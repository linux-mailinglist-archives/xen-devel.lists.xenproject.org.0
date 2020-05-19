Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1631F1DA262
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 22:18:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb8f5-0005rP-Vz; Tue, 19 May 2020 20:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYyw=7B=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jb8f4-0005rK-Mk
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 20:16:26 +0000
X-Inumbo-ID: 99c178b6-9a0d-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99c178b6-9a0d-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 20:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etZXsnzVQ7zNlinxdEQZ8/QNncZ6eQcuHQDviSFOmXs=; b=xRe+/nXIcaztViNrU35Jh+kxZ
 1vHn7sizu/84EynGy6INpJIep6CtqBw4GDjYcjRL0zl8WxhvdgYB4eoA8SY6QiQqAmnUbLQ0EMVjp
 DikRBiEPJhUCFz9jDRul0nEasET/QPAmuYS5+o3D7j1WLp4oC7S9JOPrcFNftU3W+x/Ak=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jb8ew-0002AI-Jg; Tue, 19 May 2020 20:16:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jb8ew-0002Ag-8M; Tue, 19 May 2020 20:16:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jb8ew-00021i-7e; Tue, 19 May 2020 20:16:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 150249: tolerable all pass
X-Osstest-Failures: xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=e235fa2794c95365519eac714d6ea82f8e64752e
X-Osstest-Versions-That: xen=271ade5a621005f86ec928280dc6ac85f2c4c95a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 May 2020 20:16:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150249 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150249/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e235fa2794c95365519eac714d6ea82f8e64752e
baseline version:
 xen                  271ade5a621005f86ec928280dc6ac85f2c4c95a

Last test of basis   150245  2020-05-19 13:01:12 Z    0 days
Testing same since   150249  2020-05-19 17:01:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jason Andryuk <jandryuk@gmail.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Pushing revision :

ssh: Could not resolve hostname xenbits.xen.org: Temporary failure in name resolution
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
------------------------------------------------------------
commit e235fa2794c95365519eac714d6ea82f8e64752e
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Mon May 18 21:55:03 2020 -0400

    libxl: Check stubdomain kernel & ramdisk presence
    
    Just out of context is the following comment for libxl__domain_make:
    /* fixme: this function can leak the stubdom if it fails */
    
    When the stubdomain kernel or ramdisk is not present, the domid and
    stubdomain name will indeed be leaked.  Avoid the leak by checking the
    file presence and erroring out when absent.  It doesn't fix all cases,
    but it avoids a big one when using a linux device model stubdomain.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit b6af49af6093a9a0e0e0b4d39ab06da106f4bdf7
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Mon May 18 21:55:02 2020 -0400

    docs: Add device-model-domid to xenstore-paths
    
    Document device-model-domid for when using a device model stubdomain.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit cfc47cd4e24f3bfbe9b69f3196d1dd31f7423c31
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:55:01 2020 -0400

    libxl: consider also qemu in stubdomain in libxl__dm_active check
    
    Since qemu-xen can now run in stubdomain too, handle this case when
    checking it's state too.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit fa9d82825a8ddee1894528576f383efddcdc3691
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:55:00 2020 -0400

    libxl: ignore emulated IDE disks beyond the first 4
    
    Qemu supports only 4 emulated IDE disks, when given more (or with higher
    indexes), it will fail to start. Since the disks can still be accessible
    using PV interface, just ignore emulated path and log a warning, instead
    of rejecting the configuration altogether.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit ab9ce23f5af8f77078d63b11ff8bd7280e0e6b50
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:59 2020 -0400

    libxl: require qemu in dom0 for multiple stubdomain consoles
    
    Device model stubdomains (both Mini-OS + qemu-trad and linux + qemu-xen)
    are always started with at least 3 consoles: log, save, and restore.
    Until xenconsoled learns how to handle multiple consoles, this is needed
    for save/restore support.
    
    For Mini-OS stubdoms, this is a bug.  In practice, it works in most
    cases because there is something else that triggers qemu in dom0 too:
    vfb/vkb added if vnc/sdl/spice is enabled.
    
    Additionally, Linux-based stubdomain waits for all the backends to
    initialize during boot. Lack of some console backends results in
    stubdomain startup timeout.
    
    This is a temporary patch until xenconsoled will be improved.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    [Updated commit message with Marek's explanation from mailing list.]
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 83c845033dc8bb3a35ae245effb7832b6823174a
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:58 2020 -0400

    libxl: use vchan for QMP access with Linux stubdomain
    
    Access to QMP of QEMU in Linux stubdomain is possible over vchan
    connection. Handle the actual vchan connection in a separate process
    (vchan-socket-proxy). This simplified integration with QMP (already
    quite complex), but also allows preliminary filtering of (potentially
    malicious) QMP input.
    Since only one client can be connected to vchan server at the same time
    and it is not enforced by the libxenvchan itself, additional client-side
    locking is needed. It is implicitly implemented by vchan-socket-proxy,
    as it handle only one connection at a time. Note that qemu supports only
    one simultaneous client on a control socket anyway (but in UNIX socket
    case, it enforce it server-side), so it doesn't add any extra
    limitation.
    
    libxl qmp client code already has locking to handle concurrent access
    attempts to the same qemu qmp interface.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    
    Squash in changes of regenerated autotools files.
    
    Kill the vchan-socket-proxy so we don't leak the daemonized processes.
    libxl__stubdomain_is_linux_running() works against the guest_domid, but
    the xenstore path is beneath the stubdomain.  This leads to the use of
    libxl_is_stubdom in addition to libxl__stubdomain_is_linux_running() so
    that the stubdomain calls kill for the qmp-proxy.
    
    Also call libxl__qmp_cleanup() to remove the unix sockets used by
    vchan-socket-proxy.  vchan-socket-proxy only creates qmp-libxl-$domid,
    and libxl__qmp_cleanup removes that as well as qmp-libxenstat-$domid.
    However, it tolerates ENOENT, and a stray qmp-libxenstat-$domid should
    not exist.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 379ab27086be37fbb8d23c4e001e33e05dc18b2e
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Mon May 18 21:54:57 2020 -0400

    libxl: Refactor kill_device_model to libxl__kill_xs_path
    
    Move kill_device_model to libxl__kill_xs_path so we have a helper to
    kill a process from a pid stored in xenstore.  We'll be using it to kill
    vchan-qmp-proxy.
    
    libxl__kill_xs_path takes a "what" string for use in printing error
    messages.  kill_device_model is retained in libxl_dm.c to provide the
    string.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 14fe3ace50c3853670370d8b8ff93b066420a5e0
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:56 2020 -0400

    tools: add simple vchan-socket-proxy
    
    Add a simple proxy for tunneling socket connection over vchan. This is
    based on existing vchan-node* applications, but extended with socket
    support. vchan-socket-proxy serves both as a client and as a server,
    depending on parameters. It can be used to transparently communicate
    with an application in another domian that normally expose UNIX socket
    interface. Specifically, it's written to communicate with qemu running
    within stubdom.
    
    Server mode listens for vchan connections and when one is opened,
    connects to a pointed UNIX socket.  Client mode listens on UNIX
    socket and when someone connects, opens a vchan connection.  Only
    a single connection at a time is supported.
    
    Additionally, socket can be provided as a number - in which case it's
    interpreted as already open FD (in case of UNIX listening socket -
    listen() needs to be already called). Or "-" meaning stdin/stdout - in
    which case it is reduced to vchan-node2 functionality.
    
    Example usage:
    
    1. (in dom0) vchan-socket-proxy --mode=client <DOMID>
        /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)
    
    2. (in DOMID) vchan-socket-proxy --mode=server 0
       /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)
    
    This will listen on /run/qemu.(DOMID) in dom0 and whenever connection is
    made, it will connect to DOMID, where server process will connect to
    /run/qemu.(DOMID) there. When client disconnects, vchan connection is
    terminated and server vchan-socket-proxy process also disconnects from
    qemu.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 7f6bce6386824a6c69ea852cfa40673b0350f4d1
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:55 2020 -0400

    tools: add missing libxenvchan cflags
    
    libxenvchan.h include xenevtchn.h and xengnttab.h, so applications built
    with it needs applicable -I in CFLAGS too.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 449901fc966613c1829d92570df237d4d904cdf5
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:54 2020 -0400

    libxl: add save/restore support for qemu-xen in stubdomain
    
    Rely on a wrapper script in stubdomain to attach relevant consoles to
    qemu.  The save console (1) must be attached to fdset/1.  When
    performing a restore, $STUBDOM_RESTORE_INCOMING_ARG must be replaced on
    the qemu command line by "fd:$FD", where $FD is an open file descriptor
    number to the restore console (2).
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    
    Address TODO in dm_state_save_to_fdset: Only remove savefile for
    non-stubdom.
    Use $STUBDOM_RESTORE_INCOMING_ARG instead of fd:3 and update commit
    message.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit dae844977e1e10dc859ec21612f1811ca5d5f128
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:53 2020 -0400

    tools/libvchan: notify server when client is connected
    
    Let the server know when the client is connected. Otherwise server will
    notice only when client send some data.
    This change does not break existing clients, as libvchan user should
    handle spurious notifications anyway (for example acknowledge of remote
    side reading the data).
    
    Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Replace spaces with tabs to match the file's whitespace.
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit f76a0fa109ab48ec6e910bce3b45804ef6f0915d
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:52 2020 -0400

    xl: add stubdomain related options to xl config parser
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit dabc571b7292c3cdd51734b709a663eaa45345a1
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:51 2020 -0400

    libxl: write qemu arguments into separate xenstore keys
    
    This allows using arguments with spaces, like -append, without
    nominating any special "separator" character.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    
    Write arguments in dm-argv directory instead of overloading mini-os's
    dmargs string.
    
    Make libxl__write_stub_dmargs vary behaviour based on the
    is_linux_stubdom flag.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 6d721be59d1b57088ab6ae92bcf79d0ac91fad18
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Mon May 18 21:54:50 2020 -0400

    libxl: Use libxl__xs_* in libxl__write_stub_dmargs
    
    Re-work libxl__write_stub_dmargs to use libxl_xs_* functions in a loop.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
(qemu changes not included)

