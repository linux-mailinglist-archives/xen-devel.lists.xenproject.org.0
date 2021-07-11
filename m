Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4743C39A7
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jul 2021 02:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154131.284821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2NNr-0003iO-Nl; Sun, 11 Jul 2021 00:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154131.284821; Sun, 11 Jul 2021 00:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2NNr-0003g7-JN; Sun, 11 Jul 2021 00:31:47 +0000
Received: by outflank-mailman (input) for mailman id 154131;
 Sun, 11 Jul 2021 00:31:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2NNq-0003fx-GJ; Sun, 11 Jul 2021 00:31:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2NNq-00072h-7C; Sun, 11 Jul 2021 00:31:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m2NNp-0005pm-VN; Sun, 11 Jul 2021 00:31:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m2NNp-0004ZP-Ut; Sun, 11 Jul 2021 00:31:45 +0000
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
	bh=sPrQBmVng3GRpZXqzjtXsWechvkeUiifGHMXQPMitfU=; b=pN8XAuZzyfUNRqSD1yimyQRd+h
	4jVNU+HhwgXgOq1fcvoDytUnDZjXJ7cSExhJgwm8ZMkyghPIHlMbxrxMqcyaYrOshmudBrXjGRCge
	daUEqBHEeFq9Y6YCNvp0MlUZBs5tD74yVosgOKTPCCILVNaMSPPaQ3hWQ6RfPuuDZb1A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163543-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 163543: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=93c9edbef51b31056f93a37a778326c90a83158c
X-Osstest-Versions-That:
    xen=6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 11 Jul 2021 00:31:45 +0000

flight 163543 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163543/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 163474

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  93c9edbef51b31056f93a37a778326c90a83158c
baseline version:
 xen                  6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf

Last test of basis   163474  2021-07-09 12:00:25 Z    1 days
Failing since        163480  2021-07-09 16:08:01 Z    1 days    8 attempts
Testing same since   163489  2021-07-09 21:00:27 Z    1 days    7 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Olaf Hering <olaf@aepfle.de>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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
commit 93c9edbef51b31056f93a37a778326c90a83158c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 15 16:02:29 2021 +0100

    tests/xenstore: Rework Makefile
    
    In particular, fill in the install/uninstall rules so this test can be
    packaged to be automated sensibly.
    
    This causes the code to be noticed by CI, which objects as follows:
    
      test-xenstore.c: In function 'main':
      test-xenstore.c:486:5: error: ignoring return value of 'asprintf', declared
      with attribute warn_unused_result [-Werror=unused-result]
           asprintf(&path, "%s/%u", TEST_PATH, getpid());
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Address the CI failure by checking the asprintf() return value and exiting.
    
    Rename xs-test to test-xenstore to be consistent with other tests.  Honour
    APPEND_FLAGS too.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6a9f5477637a9f2d1d61c0a065eeb01bf84f6484
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 15 15:37:49 2021 +0100

    tests/cpu-policy: Rework Makefile
    
    In particular, fill in the install/uninstall rules so this test can be
    packaged to be automated sensibly.
    
    Rework TARGET-y to be TARGETS, drop redundant -f's for $(RM), drop the
    unconditional -O3 and use the default instead, and drop CFLAGS from the link
    line but honour APPEND_LDFLAGS.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit ff759953b32286f376fda7f3ff5a17eccb542b03
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 15 15:22:11 2021 +0100

    tests/resource: Rework Makefile
    
    In particular, fill in the install/uninstall rules so this test can be
    packaged to be automated sensibly.
    
    Make all object files depend on the Makefile, drop redundant -f's for $(RM),
    and use $(TARGET) when appropriate.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 79ca512a1fa68e0170a85cb71b8a8e8f4a34fb11
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 15 14:19:15 2021 +0100

    tools/tests: Drop obsolete mce-test infrastructure
    
    mce-test has a test suite, but it depends on xend, needs to run in-tree, and
    requires manual setup of at least one guest, and manual parameters to pass
    into cases.  Drop the test infrasturcture.
    
    Move the one useful remaining item, xen-mceinj, into misc/, fixing some minor
    style issues as it goes.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 2c7242bb2a11c027921b7f153841e59457edacc3
Author: Tamas K Lengyel <tamas@tklengyel.com>
Date:   Fri May 7 11:28:36 2021 -0400

    tools/misc/xen-vmtrace: handle more signals and install by default
    
    Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit e6917412628d11986f0e6fc028851c8181b24fb8
Author: Olaf Hering <olaf@aepfle.de>
Date:   Fri Jul 9 16:32:48 2021 +0200

    automation: provide pciutils in opensuse packages
    
    qemu-xen-traditional may make use of pciutils-devel, for PCI passthrough.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4ad75403625111bdd60571c3caaaefd3a84c574e
Author: Olaf Hering <olaf@aepfle.de>
Date:   Fri Jul 9 16:32:47 2021 +0200

    automation: provide SDL and SDL2 in opensuse images
    
    qemu-xen-traditional may make use of SDL, qemu-xen may make use of SDL2.
    Use pkgconfig() as resolvable instead of a rpm name, the latter may change.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 303c857a2701fe7c180744faca3507efd3edbb1d
Author: Olaf Hering <olaf@aepfle.de>
Date:   Fri Jul 9 16:06:53 2021 +0200

    automation: add meson and ninja to tumbleweed container
    
    qemu uses meson as for configuration, and requires ninja for building.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 2d1a35f1e6c2113a6322fdb758a198608c90e4bd
Author: Costin Lupu <costin.lupu@cs.pub.ro>
Date:   Tue Jun 8 15:35:29 2021 +0300

    tools/ocaml: Fix redefinition errors
    
    If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
    header) then gcc will trigger a redefinition error because of -Werror. This
    patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
    confusion between control domain page granularity (PAGE_* definitions) and
    guest domain page granularity (which is what we are dealing with here).
    
    Same issue applies for redefinitions of Val_none and Some_val macros which
    can be already define in the OCaml system headers (e.g.
    /usr/lib/ocaml/caml/mlvalues.h).
    
    Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>
    Tested-by: Dario Faggioli <dfaggioli@suse.com>

commit d1b32abd94b620db05dfff0f4ce9cc17b9da0ccf
Author: Costin Lupu <costin.lupu@cs.pub.ro>
Date:   Tue Jun 8 15:35:28 2021 +0300

    tools/libs/gnttab: Fix PAGE_SIZE redefinition error
    
    If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
    header) then gcc will trigger a redefinition error because of -Werror. This
    patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
    confusion between control domain page granularity (PAGE_* definitions) and
    guest domain page granularity.
    
    The exception is in osdep_xenforeignmemory_map() where we need the system page
    size to check whether the PFN array should be allocated with mmap() or with
    dynamic allocation.
    
    Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit 0dbb4be739c50b8018aeeb285ef290bf7962a28e
Author: Costin Lupu <costin.lupu@cs.pub.ro>
Date:   Tue Jun 8 15:35:27 2021 +0300

    tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
    
    If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
    header) then gcc will trigger a redefinition error because of -Werror. This
    patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
    confusion between control domain page granularity (PAGE_* definitions) and
    guest domain page granularity.
    
    The exception is in osdep_xenforeignmemory_map() where we need the system page
    size to check whether the PFN array should be allocated with mmap() or with
    dynamic allocation.
    
    Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit d276e0f3f14f2d46f27989008770eb2b9c678bc4
Author: Costin Lupu <costin.lupu@cs.pub.ro>
Date:   Tue Jun 8 15:35:26 2021 +0300

    tools/libfsimage: Fix PATH_MAX redefinition error
    
    If PATH_MAX is already defined in the system (e.g. in /usr/include/limits.h
    header) then gcc will trigger a redefinition error because of -Werror.
    
    Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit 37588941a249a0b45a44a6385b187d7d10132e7d
Author: Costin Lupu <costin.lupu@cs.pub.ro>
Date:   Tue Jun 8 15:35:25 2021 +0300

    tools/debugger: Fix PAGE_SIZE redefinition error
    
    If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
    header) then gcc will trigger a redefinition error because of -Werror. This
    patch replaces usage of PAGE_* macros with KDD_PAGE_* macros in order to avoid
    confusion between control domain page granularity (PAGE_* definitions) and
    guest domain page granularity (which is what we are dealing with here).
    
    We chose to define the KDD_PAGE_* macros instead of using XC_PAGE_* macros
    because (1) the code in kdd.c should not include any Xen headers and (2) to add
    consistency for code in both kdd.c and kdd-xen.c.
    
    Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
    Reviewed-by: Tim Deegan <tim@xen.org>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit cf4aa8dfb201a7db3e9ec2d4a2ff56961c7719fb
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 8 16:56:28 2021 +0200

    automation: document how to refresh a container
    
    The Tumbleweed container should be updated often.
    Describe the neccessary steps how to refresh and test it before
    pushing the new image to gitlab.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4905c2da20e2d95ff577033b0513d4bb57a9c086
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 8 16:56:49 2021 +0200

    automation: avoid globbering the docker run args
    
    containerize bash -c './configure && make' fails due to shell expansion.
    
    Collect all arguments for the script and pass them verbatim to the
    docker run command.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andew.cooper3@citrix.com>

commit ea7f91ded56e6de1fbf79b8a7c0985a5f5de5740
Author: Olaf Hering <olaf@aepfle.de>
Date:   Thu Jul 8 15:57:04 2021 +0200

    automation: use zypper dup in tumbleweed dockerfile
    
    The 'dup' command aligns the installed packages with the packages
    found in the enabled repositories, taking the repository priorities
    into account. Using this command is generally a safe thing to do.
    
    In the context of Tumbleweed using 'dup' is essential, because package
    versions might be downgraded, and package names occasionally change.
    Only 'dup' will do the correct thing in such cases.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

