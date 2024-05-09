Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4A28C11C6
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 17:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719285.1121949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s55Sh-0002xh-P1; Thu, 09 May 2024 15:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719285.1121949; Thu, 09 May 2024 15:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s55Sh-0002ud-Lg; Thu, 09 May 2024 15:13:35 +0000
Received: by outflank-mailman (input) for mailman id 719285;
 Thu, 09 May 2024 15:13:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s55Sf-0002tc-MZ; Thu, 09 May 2024 15:13:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s55Sf-0004Dw-Is; Thu, 09 May 2024 15:13:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s55Sf-0007yf-6p; Thu, 09 May 2024 15:13:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s55Sf-0001MR-6J; Thu, 09 May 2024 15:13:33 +0000
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
	bh=S2kKGMgc1RfK4BWbf6Q1Xamm3ks7eZ0I+/diHy+NRBk=; b=IZR1FE9kjrt9L3W9utRi9ccd6l
	wWKG8LuDVDuBDtK6yjyIg+xzQsz++6UqoD9dcUG1rN5clKpYZFh0bXkvoBRpwwz9WnU2Pp2fLmFic
	4sWe4u4A6mNUB/+x//T6CLYZ+XrgcIPOhQMqdfxpxFpiRC7Gp353k482QHWAOS9WIgks=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185951-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 185951: regressions - FAIL
X-Osstest-Failures:
    libvirt:build-arm64-pvops:kernel-build:fail:regression
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=a47e73d6e76c85b0897e3cccaf0a58ed3c367664
X-Osstest-Versions-That:
    libvirt=df9ffb025646d649f981ca25600225bc8cf794d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 May 2024 15:13:33 +0000

flight 185951 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185951/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 185943

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185943
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              a47e73d6e76c85b0897e3cccaf0a58ed3c367664
baseline version:
 libvirt              df9ffb025646d649f981ca25600225bc8cf794d1

Last test of basis   185943  2024-05-08 04:22:17 Z    1 days
Testing same since   185951  2024-05-09 04:20:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    


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
commit a47e73d6e76c85b0897e3cccaf0a58ed3c367664
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 14:35:39 2024 +0100

    src/node_device: don't overwrite error messages
    
    The nodedev code unhelpfully reports
    
      couldn't convert node device def to mdevctl JSON
    
    which hides the actual error message
    
      No JSON parser implementation is available
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 479333af2c9d234ec1639a0a976e27afb1e26604
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 14:35:04 2024 +0100

    tests: don't run mdevctl test if lacking YAJL
    
    The mdev code requires YAJL in order to convert from node dev XML to
    mdev's config format.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 7817c3f89cc9f887bea269ebd3f34641cd0a052a
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 14:26:55 2024 +0100

    test: drop bogus check for YAJL from libxl test/mock
    
    The libxlmock.c conditionalizes on WITH_YAJL, but this mock is
    used from other tests which only conditionalize on WITH_LIBXL.
    The libxl code does not have any dependancy on YAJL, so the
    bogus condition can be removed from the mock and also from
    libxlxml2domconfigtest.c
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 971305e86f26269d3211ff41f4931e66c6f0b716
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 14:17:36 2024 +0100

    tests: always build securityselinuxhelper if libselinux is present
    
    The securityselinuxhelper build is conditionalized on the SELinux
    security driver feature. It is also needed, however, by viridentitytest
    whenever libselinux is present.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit c8c5170b74ae9af6f2ade66be310e58c90170f0f
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 14:05:12 2024 +0100

    test: conditionalize 'virsh-auth' on test driver
    
    The 'virsh-auth' test is mistakenly conditionalized on the libvirtd
    daemon build, however, it just uses the 'test:///default' driver
    URI, so does not require a daemon.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 08bfb18736a0dc50068090e1a7a024b7a920f789
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 13:23:39 2024 +0100

    tests: build driver modules before virdrivermoduletest
    
    The virdrivermoduletest will attempt to dlopen() each driver module,
    so they must be build before the test can run.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit a76ffee3657a449b7be06b9e89b33bd2246cc8e8
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 13:16:26 2024 +0100

    tests: build 'virsh' before running virsh-auth test
    
    The 'virsh-auth' test needs to be able to invoke the 'virsh' binary
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 0dc278dd020680d1a490d7d88ccf2c7be82b5c05
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 13:10:59 2024 +0100

    src: ensure augeas test file is generated before running test
    
    We fail to express an ordering between the custom target that
    generates the combined augeas test input file, and the meson
    test command.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit bdfe46ed6e7c11790f7234be46a4136e06e482ff
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 11:38:07 2024 +0100

    meson: record which other options are a pre-requisite
    
    Several meson options cannot be enabled, without first enabling another
    option. This adds a small comment prior to an option to record its
    mandatory dependencies.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 67ac2cd5908a686ab8f83703d5167caf5310a9f3
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 10:40:15 2024 +0100

    tests: fix tests when test driver is disabled
    
    Various tests try to open a connection to 'test:///default' and
    must be skipped when the test driver is disabled.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit 20acd5b1beddaa77c9d0da1917940eeceb98e470
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue May 7 10:38:59 2024 +0100

    scripts/rpcgen: skip tests if tirpc is not present
    
    This skips building tests which rely on tirpc when it is not
    present.
    
    Reviewed-by: Peter Krempa <pkrempa@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit ae6a89884aeea9f6e334b8b6951d1aa6c362bdad
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed May 8 13:03:20 2024 +0100

    tests: fix two off-by-1 errors in read-big-pipe test
    
    When testPipeFeeder copies the XML document into the padded buffer, it
    tells virStrcpy that 'xmlsize' bytes are available. This is under
    reporting size by 1 byte, and as a result it fails to copy the trailing
    '\n' replacing it with '\0'. The return value of virStrcpy wasn't
    checked, but was reporting this truncation.
    
    When testPipeFeeder then sends the padded buffer down the pipe, it asks
    to send 'emptyspace + xmlsize + 1' bytes, which means it sends the data,
    as well as the trailing '\0' terminator.
    
    Both bugs combined mean it is sending '\0\0' as the last bytes, instead
    of '\n' which was intended. When virFileReadAll reads data from the
    pipe, it ends up adding another '\0' resulting in a very NUL terminated
    string ('\0\0\0'). This is all harmless, but should be fixed regardless.
    
    Reviewed-by: Andrea Bolognani <abologna@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

commit e1c32120ce6eddb72272b4717dd8384075b32c2f
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Wed May 8 11:50:09 2024 +0100

    tests: fix hang in virshtest 'read-big-pipe' case
    
    The virshtest program testPipeFeeder method is doing this:
    
      mkfifo("test.fifo", 0600) ;
    
      int fd = open("test.fifo", O_RDWR);
    
      char buf[...];
      memset(buf, 'a', sizeof(buf));
      write(fd, buf, sizeof(buf)) == sizeof(buf));
      close(fd);
    
    while the the 'virsh' child process then ends up doing:
    
      fd = open("test.fifo", O_RDONLY);
      read(fd, buf, sizeof(buf)) == sizeof(buf));
      close(fd);
    
    The 'virsh' code hangs on open() on at least ppc64 and some other
    arches. It can be provoked to hang even on x86 by reducing the size of
    the buffer. It can be prevented from hanging on ppc64 by increasing the
    size of the buffer.
    
    What is happening is a result of differing page sizes, altering the
    overall pipe capacity size, since pipes on linux default to 16 pages
    in size and thus have architecture specific capacity when measured
    in bytes.
    
     * On x86, testPipeFeeder opens R+W, tries to write 140kb and
       write() blocks because the pipe is full. This gives time for
       virsh to start up, and it can open the pipe for O_RDONLY
       since testPipeFeeder still has it open for write. Everything
       works as intended.
    
     * On ppc64,  testPipeFeeder opens R+W, tries to write 140kb
       and write() succeeds because the larger 64kb page size
       resulted in greater buffer capacity for the pipe. It thus
       quickly closes the pipe, removing the writer, and triggering
       discard of all the unread data. Now virsh starts up, tries
       to open the pipe for O_RDONLY and blocks waiting for a new
       writer to open it, which will never happen. Meson kills
       the test after 30 seconds.
    
       NB, every now & then, it will not block because virsh starts
       up quickly enough that testPipeFeeder has not yet closed the
       write end of the pipe, giving the illusion of correctness.
    
    The key flaw here is that it should not have been using O_RDWR
    in testPipeFeeder. Synchronization is required such that both
    virsh and testPipeFeeder have their respective ends of the pipe
    open before any data is sent. This is trivially arranged by
    using O_WRONLY in testPipeFeeder.
    
    Reviewed-by: Andrea Bolognani <abologna@redhat.com>
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

