{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit SocketConsts;

interface

{$MODE OBJFPC}
{$H+}

resourcestring

    rsSocketListenFailed = 'Listening failed, error: %s (%d)';
    rsAcceptWouldBlock = 'Accept socket would block on socket, error: %s (%d)';
    rsBindFailed = 'Bind failed on %s, error: %s (%d)';
    rsCreateFailed = 'Create socket on %s failed, error: %s (%d)';

    rsEpollInitFailed = 'Fail to initialize epoll';
    raEpollAddFileDescriptorFailed = 'Fail to add file descriptor';

implementation

end.