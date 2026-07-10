use std::cell::Cell;
wit_bindgen::generate!({
    path: "wit",
    world: "library",
    generate_all,
});
use exports::wasi::{cli, clocks, filesystem, io, sockets};
use filesystem::types::{
    Descriptor, DescriptorFlags, DescriptorStat, DescriptorType, ErrorCode, MetadataHashValue,
};
use io::poll::Pollable;
use io::streams::{InputStream, OutputStream, StreamError};
use wasi::cli::stdout;

struct Library;
export!(Library);

static HELLO_TEX: &[u8] = include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/../hello.tex"));
static CMR10_TFM: &[u8] = include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/../tfm/cmr10.tfm"));

enum FileDescriptor {
    Directory,
    InputFile(&'static [u8]),
    OutputFile(OutputDestination),
}

#[derive(Clone, Copy)]
enum OutputDestination {
    Dvi,
    Discarded,
}

fn look_up(path: &str) -> Option<FileDescriptor> {
    if path == "." || path == "./" {
        Some(FileDescriptor::Directory)
    } else if path.ends_with("hello.tex") {
        Some(FileDescriptor::InputFile(HELLO_TEX))
    } else if path.ends_with("cmr10.tfm") {
        Some(FileDescriptor::InputFile(CMR10_TFM))
    } else if path == "tex" || path.ends_with("/tex") {
        Some(FileDescriptor::InputFile(&[]))
    } else {
        None
    }
}

fn stat_of(file: &FileDescriptor) -> DescriptorStat {
    let (file_type, size) = match file {
        FileDescriptor::Directory => (DescriptorType::Directory, 0),
        FileDescriptor::InputFile(contents) => (DescriptorType::RegularFile, contents.len() as u64),
        FileDescriptor::OutputFile(_) => (DescriptorType::RegularFile, 0),
    };
    DescriptorStat {
        type_: file_type,
        link_count: 1,
        size,
        data_access_timestamp: None,
        data_modification_timestamp: None,
        status_change_timestamp: None,
    }
}

impl cli::environment::Guest for Library {
    fn get_arguments() -> Vec<String> {
        vec!["tex".into(), "-ini".into(), "./hello.tex".into()]
    }

    fn get_environment() -> Vec<(String, String)> {
        vec![("TFMFONTS".into(), ".".into())]
    }

    fn initial_cwd() -> Option<String> {
        None
    }
}

impl cli::stdin::Guest for Library {
    fn get_stdin() -> InputStream {
        unreachable!();
    }
}

impl cli::stdout::Guest for Library {
    fn get_stdout() -> OutputStream {
        OutputStream::new(FileWriter {
            destination: OutputDestination::Discarded,
        })
    }
}

impl cli::stderr::Guest for Library {
    fn get_stderr() -> OutputStream {
        OutputStream::new(FileWriter {
            destination: OutputDestination::Discarded,
        })
    }
}

impl cli::terminal_stdin::Guest for Library {
    fn get_terminal_stdin() -> Option<cli::terminal_stdin::TerminalInput> {
        unreachable!();
    }
}

impl cli::terminal_stdout::Guest for Library {
    fn get_terminal_stdout() -> Option<cli::terminal_stdout::TerminalOutput> {
        None
    }
}

impl cli::terminal_stderr::Guest for Library {
    fn get_terminal_stderr() -> Option<cli::terminal_stderr::TerminalOutput> {
        unreachable!();
    }
}

impl cli::terminal_input::Guest for Library {
    type TerminalInput = Never;
}

impl cli::terminal_output::Guest for Library {
    type TerminalOutput = Never;
}

impl cli::terminal_input::GuestTerminalInput for Never {}
impl cli::terminal_output::GuestTerminalOutput for Never {}

impl clocks::wall_clock::Guest for Library {
    fn now() -> clocks::wall_clock::Datetime {
        clocks::wall_clock::Datetime {
            seconds: 0,
            nanoseconds: 0,
        }
    }

    fn resolution() -> clocks::wall_clock::Datetime {
        unreachable!();
    }
}

impl clocks::monotonic_clock::Guest for Library {
    fn now() -> u64 {
        unreachable!();
    }

    fn resolution() -> u64 {
        unreachable!();
    }

    fn subscribe_instant(_when: u64) -> Pollable {
        unreachable!();
    }

    fn subscribe_duration(_when: u64) -> Pollable {
        unreachable!();
    }
}

impl io::error::Guest for Library {
    type Error = Never;
}

impl io::error::GuestError for Never {
    fn to_debug_string(&self) -> String {
        unreachable!()
    }
}

impl io::poll::Guest for Library {
    type Pollable = AlwaysReady;

    fn poll(_in_: Vec<io::poll::PollableBorrow<'_>>) -> Vec<u32> {
        unreachable!();
    }
}

struct AlwaysReady;

impl io::poll::GuestPollable for AlwaysReady {
    fn ready(&self) -> bool {
        unreachable!();
    }

    fn block(&self) {
        unreachable!();
    }
}

impl io::streams::Guest for Library {
    type InputStream = FileReader;
    type OutputStream = FileWriter;
}

struct FileReader {
    contents: &'static [u8],
    position: Cell<usize>,
}

impl io::streams::GuestInputStream for FileReader {
    fn read(&self, length: u64) -> Result<Vec<u8>, StreamError> {
        let position = self.position.get();
        if position >= self.contents.len() {
            return Err(StreamError::Closed);
        }
        let end = usize::min(position + length as usize, self.contents.len());
        self.position.set(end);
        Ok(self.contents[position..end].to_vec())
    }

    fn blocking_read(&self, _length: u64) -> Result<Vec<u8>, StreamError> {
        unreachable!();
    }

    fn skip(&self, _length: u64) -> Result<u64, StreamError> {
        unreachable!()
    }

    fn blocking_skip(&self, _length: u64) -> Result<u64, StreamError> {
        unreachable!()
    }

    fn subscribe(&self) -> Pollable {
        unreachable!();
    }
}

struct FileWriter {
    destination: OutputDestination,
}

impl io::streams::GuestOutputStream for FileWriter {
    fn check_write(&self) -> Result<u64, StreamError> {
        Ok(64 * 1024)
    }

    fn write(&self, contents: Vec<u8>) -> Result<(), StreamError> {
        if let OutputDestination::Dvi = self.destination {
            let stdout = stdout::get_stdout();
            for chunk in contents.chunks(4096) {
                stdout.blocking_write_and_flush(chunk).unwrap();
            }
        }
        Ok(())
    }

    fn blocking_write_and_flush(&self, _contents: Vec<u8>) -> Result<(), StreamError> {
        unreachable!();
    }

    fn flush(&self) -> Result<(), StreamError> {
        unreachable!();
    }

    fn blocking_flush(&self) -> Result<(), StreamError> {
        Ok(())
    }

    fn subscribe(&self) -> Pollable {
        unreachable!();
    }

    fn write_zeroes(&self, _length: u64) -> Result<(), StreamError> {
        unreachable!()
    }

    fn blocking_write_zeroes_and_flush(&self, _length: u64) -> Result<(), StreamError> {
        unreachable!()
    }

    fn splice(
        &self,
        _source: io::streams::InputStreamBorrow<'_>,
        _length: u64,
    ) -> Result<u64, StreamError> {
        unreachable!()
    }

    fn blocking_splice(
        &self,
        _source: io::streams::InputStreamBorrow<'_>,
        _length: u64,
    ) -> Result<u64, StreamError> {
        unreachable!()
    }
}

impl filesystem::preopens::Guest for Library {
    fn get_directories() -> Vec<(Descriptor, String)> {
        vec![(Descriptor::new(FileDescriptor::Directory), ".".into())]
    }
}

impl filesystem::types::Guest for Library {
    type Descriptor = FileDescriptor;
    type DirectoryEntryStream = Never;

    fn filesystem_error_code(_error: filesystem::types::ErrorBorrow<'_>) -> Option<ErrorCode> {
        unreachable!()
    }
}

impl filesystem::types::GuestDescriptor for FileDescriptor {
    fn open_at(
        &self,
        _path_flags: filesystem::types::PathFlags,
        path: String,
        _open_flags: filesystem::types::OpenFlags,
        _flags: DescriptorFlags,
    ) -> Result<Descriptor, ErrorCode> {
        let opened = look_up(&path).unwrap_or_else(|| {
            let destination = if path.ends_with(".dvi") {
                OutputDestination::Dvi
            } else {
                OutputDestination::Discarded
            };
            FileDescriptor::OutputFile(destination)
        });
        Ok(Descriptor::new(opened))
    }

    fn read_via_stream(&self, offset: u64) -> Result<InputStream, ErrorCode> {
        let FileDescriptor::InputFile(contents) = self else {
            unreachable!()
        };
        Ok(InputStream::new(FileReader {
            contents: *contents,
            position: Cell::new(offset as usize),
        }))
    }

    fn write_via_stream(&self, _offset: u64) -> Result<OutputStream, ErrorCode> {
        let FileDescriptor::OutputFile(destination) = self else {
            unreachable!()
        };
        Ok(OutputStream::new(FileWriter {
            destination: *destination,
        }))
    }

    fn append_via_stream(&self) -> Result<OutputStream, ErrorCode> {
        unreachable!();
    }

    fn stat(&self) -> Result<DescriptorStat, ErrorCode> {
        unreachable!();
    }

    fn stat_at(
        &self,
        _path_flags: filesystem::types::PathFlags,
        path: String,
    ) -> Result<DescriptorStat, ErrorCode> {
        look_up(&path)
            .map(|file| stat_of(&file))
            .ok_or(ErrorCode::NoEntry)
    }

    fn get_flags(&self) -> Result<DescriptorFlags, ErrorCode> {
        Ok(match self {
            FileDescriptor::Directory => DescriptorFlags::READ | DescriptorFlags::MUTATE_DIRECTORY,
            FileDescriptor::InputFile(_) => DescriptorFlags::READ,
            FileDescriptor::OutputFile(_) => DescriptorFlags::WRITE,
        })
    }

    fn get_type(&self) -> Result<DescriptorType, ErrorCode> {
        unreachable!();
    }

    fn metadata_hash(&self) -> Result<MetadataHashValue, ErrorCode> {
        unreachable!();
    }

    fn metadata_hash_at(
        &self,
        _path_flags: filesystem::types::PathFlags,
        path: String,
    ) -> Result<MetadataHashValue, ErrorCode> {
        look_up(&path)
            .map(|_| MetadataHashValue { lower: 0, upper: 0 })
            .ok_or(ErrorCode::NoEntry)
    }

    fn readlink_at(&self, _path: String) -> Result<String, ErrorCode> {
        unreachable!()
    }

    fn rename_at(
        &self,
        _old_path: String,
        _new_descriptor: filesystem::types::DescriptorBorrow<'_>,
        _new_path: String,
    ) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn read_directory(&self) -> Result<filesystem::types::DirectoryEntryStream, ErrorCode> {
        unreachable!()
    }

    fn advise(
        &self,
        _offset: u64,
        _length: u64,
        _advice: filesystem::types::Advice,
    ) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn sync_data(&self) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn sync(&self) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn set_size(&self, _size: u64) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn set_times(
        &self,
        _data_access_timestamp: filesystem::types::NewTimestamp,
        _data_modification_timestamp: filesystem::types::NewTimestamp,
    ) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn set_times_at(
        &self,
        _path_flags: filesystem::types::PathFlags,
        _path: String,
        _data_access_timestamp: filesystem::types::NewTimestamp,
        _data_modification_timestamp: filesystem::types::NewTimestamp,
    ) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn read(&self, _length: u64, _offset: u64) -> Result<(Vec<u8>, bool), ErrorCode> {
        unreachable!()
    }

    fn write(&self, _buffer: Vec<u8>, _offset: u64) -> Result<u64, ErrorCode> {
        unreachable!()
    }

    fn create_directory_at(&self, _path: String) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn link_at(
        &self,
        _old_path_flags: filesystem::types::PathFlags,
        _old_path: String,
        _new_descriptor: filesystem::types::DescriptorBorrow<'_>,
        _new_path: String,
    ) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn symlink_at(&self, _old_path: String, _new_path: String) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn remove_directory_at(&self, _path: String) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn unlink_file_at(&self, _path: String) -> Result<(), ErrorCode> {
        unreachable!()
    }

    fn is_same_object(&self, _other: filesystem::types::DescriptorBorrow<'_>) -> bool {
        unreachable!()
    }
}

impl filesystem::types::GuestDirectoryEntryStream for Never {
    fn read_directory_entry(&self) -> Result<Option<filesystem::types::DirectoryEntry>, ErrorCode> {
        unreachable!()
    }
}

struct Never;
impl sockets::network::Guest for Library {
    type Network = Never;
}
impl sockets::network::GuestNetwork for Never {}
impl sockets::instance_network::Guest for Library {
    fn instance_network() -> sockets::instance_network::Network {
        unreachable!()
    }
}
impl sockets::udp_create_socket::Guest for Library {
    fn create_udp_socket(
        _address_family: sockets::udp_create_socket::IpAddressFamily,
    ) -> Result<sockets::udp_create_socket::UdpSocket, sockets::udp_create_socket::ErrorCode> {
        unreachable!()
    }
}

impl sockets::tcp_create_socket::Guest for Library {
    fn create_tcp_socket(
        _address_family: sockets::tcp_create_socket::IpAddressFamily,
    ) -> Result<sockets::tcp_create_socket::TcpSocket, sockets::tcp_create_socket::ErrorCode> {
        unreachable!()
    }
}

impl sockets::udp::Guest for Library {
    type UdpSocket = Never;
    type IncomingDatagramStream = Never;
    type OutgoingDatagramStream = Never;
}

impl sockets::tcp::Guest for Library {
    type TcpSocket = Never;
}

use sockets::tcp::{
    Duration, ErrorCode as SocketErrorCode, IpAddressFamily, IpSocketAddress, NetworkBorrow,
    ShutdownType,
};

impl sockets::udp::GuestUdpSocket for Never {
    fn start_bind(
        &self,
        _network: NetworkBorrow<'_>,
        _local_address: IpSocketAddress,
    ) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn finish_bind(&self) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn stream(
        &self,
        _remote_address: Option<IpSocketAddress>,
    ) -> Result<
        (
            sockets::udp::IncomingDatagramStream,
            sockets::udp::OutgoingDatagramStream,
        ),
        SocketErrorCode,
    > {
        unreachable!()
    }

    fn local_address(&self) -> Result<IpSocketAddress, SocketErrorCode> {
        unreachable!()
    }

    fn remote_address(&self) -> Result<IpSocketAddress, SocketErrorCode> {
        unreachable!()
    }

    fn address_family(&self) -> IpAddressFamily {
        unreachable!()
    }

    fn unicast_hop_limit(&self) -> Result<u8, SocketErrorCode> {
        unreachable!()
    }

    fn set_unicast_hop_limit(&self, _value: u8) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn receive_buffer_size(&self) -> Result<u64, SocketErrorCode> {
        unreachable!()
    }

    fn set_receive_buffer_size(&self, _value: u64) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn send_buffer_size(&self) -> Result<u64, SocketErrorCode> {
        unreachable!()
    }

    fn set_send_buffer_size(&self, _value: u64) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn subscribe(&self) -> Pollable {
        unreachable!()
    }
}

impl sockets::udp::GuestIncomingDatagramStream for Never {
    fn receive(
        &self,
        _max_results: u64,
    ) -> Result<Vec<sockets::udp::IncomingDatagram>, SocketErrorCode> {
        unreachable!()
    }

    fn subscribe(&self) -> Pollable {
        unreachable!()
    }
}

impl sockets::udp::GuestOutgoingDatagramStream for Never {
    fn check_send(&self) -> Result<u64, SocketErrorCode> {
        unreachable!()
    }

    fn send(
        &self,
        _datagrams: Vec<sockets::udp::OutgoingDatagram>,
    ) -> Result<u64, SocketErrorCode> {
        unreachable!()
    }

    fn subscribe(&self) -> Pollable {
        unreachable!()
    }
}

impl sockets::tcp::GuestTcpSocket for Never {
    fn start_bind(
        &self,
        _network: NetworkBorrow<'_>,
        _local_address: IpSocketAddress,
    ) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn finish_bind(&self) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn start_connect(
        &self,
        _network: NetworkBorrow<'_>,
        _remote_address: IpSocketAddress,
    ) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn finish_connect(&self) -> Result<(InputStream, OutputStream), SocketErrorCode> {
        unreachable!()
    }

    fn start_listen(&self) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn finish_listen(&self) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn accept(
        &self,
    ) -> Result<(sockets::tcp::TcpSocket, InputStream, OutputStream), SocketErrorCode> {
        unreachable!()
    }

    fn local_address(&self) -> Result<IpSocketAddress, SocketErrorCode> {
        unreachable!()
    }

    fn remote_address(&self) -> Result<IpSocketAddress, SocketErrorCode> {
        unreachable!()
    }

    fn is_listening(&self) -> bool {
        unreachable!()
    }

    fn address_family(&self) -> IpAddressFamily {
        unreachable!()
    }

    fn set_listen_backlog_size(&self, _value: u64) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn keep_alive_enabled(&self) -> Result<bool, SocketErrorCode> {
        unreachable!()
    }

    fn set_keep_alive_enabled(&self, _value: bool) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn keep_alive_idle_time(&self) -> Result<Duration, SocketErrorCode> {
        unreachable!()
    }

    fn set_keep_alive_idle_time(&self, _value: Duration) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn keep_alive_interval(&self) -> Result<Duration, SocketErrorCode> {
        unreachable!()
    }

    fn set_keep_alive_interval(&self, _value: Duration) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn keep_alive_count(&self) -> Result<u32, SocketErrorCode> {
        unreachable!()
    }

    fn set_keep_alive_count(&self, _value: u32) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn hop_limit(&self) -> Result<u8, SocketErrorCode> {
        unreachable!()
    }

    fn set_hop_limit(&self, _value: u8) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn receive_buffer_size(&self) -> Result<u64, SocketErrorCode> {
        unreachable!()
    }

    fn set_receive_buffer_size(&self, _value: u64) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn send_buffer_size(&self) -> Result<u64, SocketErrorCode> {
        unreachable!()
    }

    fn set_send_buffer_size(&self, _value: u64) -> Result<(), SocketErrorCode> {
        unreachable!()
    }

    fn subscribe(&self) -> Pollable {
        unreachable!()
    }

    fn shutdown(&self, _shutdown_type: ShutdownType) -> Result<(), SocketErrorCode> {
        unreachable!()
    }
}
