Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0AD84AB21
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 01:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676568.1052730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX9TS-0008Kz-CJ; Tue, 06 Feb 2024 00:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676568.1052730; Tue, 06 Feb 2024 00:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX9TS-0008JQ-7a; Tue, 06 Feb 2024 00:38:06 +0000
Received: by outflank-mailman (input) for mailman id 676568;
 Tue, 06 Feb 2024 00:38:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rX9TQ-0008JG-5T; Tue, 06 Feb 2024 00:38:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rX9TQ-0002xE-30; Tue, 06 Feb 2024 00:38:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rX9TP-0002H2-HX; Tue, 06 Feb 2024 00:38:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rX9TP-00007p-Gz; Tue, 06 Feb 2024 00:38:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=7SCX7wgYi4dDbBHxY9LNou0Ixn2SQcvgwydMzwFpFng=; b=T7U6lKNusuX+Z+gIUXARl7V50U
	P5x0VxwF2Vo7jK5B3FRNncc/5OL8JY6gsZV2gG1DwjKUs+n6ShuQ5KtxkYSaCBOmZ40aaDwURkonr
	BODllq69/A38cFH4dwYnWuuNOTNME4WpT5+IwhQnpZtFgQvUOoDf5oTvN3AQAEUgRU7Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184596-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184596: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3ce2e1f606cef3aa16b856396b31068c447b1262
X-Osstest-Versions-That:
    xen=29f17d837421f13c0e0010802de1b2d51d2ded4a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Feb 2024 00:38:03 +0000

flight 184596 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184596/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 184593

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3ce2e1f606cef3aa16b856396b31068c447b1262
baseline version:
 xen                  29f17d837421f13c0e0010802de1b2d51d2ded4a

Last test of basis   184593  2024-02-05 18:00:25 Z    0 days
Testing same since   184596  2024-02-05 21:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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


Not pushing.

------------------------------------------------------------
commit 3ce2e1f606cef3aa16b856396b31068c447b1262
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:57 2024 +0100

    tools/xenstored: map stubdom interface
    
    When running as stubdom, map the stubdom's Xenstore ring page in order
    to support using the 9pfs frontend.
    
    Use the same pattern as in dom0_init() when running as daemon in dom0
    (introduce the own domain, then send an event to the client side to
    signal Xenstore is ready to communicate).
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 097388d520eb104ebd93b486d126f319536a54e4
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:56 2024 +0100

    tools/xenstored: split domain_init()
    
    Today domain_init() is called either just before calling dom0_init()
    in case no live update is being performed, or it is called after
    reading the global state from read_state_global(), as the event
    channel fd is needed.
    
    Split up domain_init() into a preparation part which can be called
    unconditionally, and in a part setting up the event channel handle.
    
    Note that there is no chance that chk_domain_generation() can be
    called now before xc_handle has been setup, so there is no need for
    the related special case anymore.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 5edc819ed50d4d0bc0de422eed72301b69309862
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:55 2024 +0100

    tools/xenstored: rework ring page (un)map functions
    
    When [un]mapping the ring page of a Xenstore client, different actions
    are required for "normal" guests and dom0. Today this distinction is
    made at call site.
    
    Move this distinction into [un]map_interface() instead, avoiding code
    duplication and preparing special handling for [un]mapping the stub
    domain's ring page.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit a3e37f7024b0fb25c648315b2edf3583aa140b32
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:54 2024 +0100

    tools/xenstored: get own domid in stubdom case
    
    Obtain own domid when running as stubdom.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit e199a3068097708a9e712bf5d86f9fb51e6615e8
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:53 2024 +0100

    tools/xenstored: move all socket handling into posix.c
    
    All of the socket handling is needed only when running as daemon.
    
    Move it into posix.c, allowing to remove the NO_SOCKETS macro.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit aae54458a1b5e947dbc4fb44beca7ec94fe80001
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:52 2024 +0100

    tools/xenstored: move all log-pipe handling into posix.c
    
    All of the log-pipe handling is needed only when running as daemon.
    
    Move it into posix.c. This requires to have a service function in the
    main event loop for handling the related requests and one for setting
    the fds[] array, which is renamed to poll_fds to have a more specific
    name. Use a generic name for those functions, as socket handling can
    be added to them later, too.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 511cc30cf8bbf083f2788cf4eee91edec0b85ac0
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:51 2024 +0100

    tools/xenstored: move systemd handling to posix.c
    
    Move systemd handling to a new late_init() function in posix.c.
    
    This prepares a future removal of the NO_SOCKETS macro.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit e767a98f040d8274b0f1dc991b9eefbc13b39e2d
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:50 2024 +0100

    tools/xenstored: add early_init() function
    
    Some xenstored initialization needs to be done in the daemon case only,
    so split it out into a new early_init() function being a stub in the
    stubdom case.
    
    Remove the call of talloc_enable_leak_report_full(), as it serves no
    real purpose: the daemon only ever exits due to a crash, in which case
    a log of talloc()ed memory hardly has any value.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 1c2c7f790147ca003270b32da41550c04c7d15d2
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:47 2024 +0100

    tools/xenstored: rename xenbus_evtchn()
    
    Rename the xenbus_evtchn() function to get_xenbus_evtchn() in order to
    avoid two externally visible symbols with the same name when Xenstore-
    stubdom is being built with a Mini-OS with CONFIG_XENBUS set.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

commit 9c076988fe5f9d55a0ecb846549bdbdfddcf3841
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Feb 5 11:49:46 2024 +0100

    tools/helpers: allocate xenstore event channel for xenstore stubdom
    
    In order to prepare support of PV frontends in xenstore-stubdom, add
    allocation of a Xenstore event channel to init-xenstore-domain.c.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
(qemu changes not included)

