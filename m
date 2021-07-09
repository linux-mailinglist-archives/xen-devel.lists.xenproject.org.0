Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646663C29EB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 22:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153858.284267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1wip-0001ms-Vl; Fri, 09 Jul 2021 20:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153858.284267; Fri, 09 Jul 2021 20:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1wip-0001kb-RM; Fri, 09 Jul 2021 20:03:39 +0000
Received: by outflank-mailman (input) for mailman id 153858;
 Fri, 09 Jul 2021 20:03:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1wio-0001kR-Ai; Fri, 09 Jul 2021 20:03:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1wio-00007O-2O; Fri, 09 Jul 2021 20:03:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1win-0003ZH-R4; Fri, 09 Jul 2021 20:03:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m1win-0000Ho-Qb; Fri, 09 Jul 2021 20:03:37 +0000
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
	bh=/r4TcL3Av1zLKc4tfVx1rzNqVU60LkW2WpcXtYHlGp4=; b=QE/6n2+jAf04X6txYKS7uQC6sh
	+Mr7qEKKIiCfhNzreLWZlsIYfvksOdXm4eyu6PeL6lLjYzinIRfE2pHqYESDi1ZE4atGAZJbj8abu
	Qty+t3j2+qn3aFpVit5N33rMFEZMDZf1mX9qWYVheVLtdRBuw3ZScYUeLmd2m0Q0Y8LA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163480-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 163480: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e6917412628d11986f0e6fc028851c8181b24fb8
X-Osstest-Versions-That:
    xen=6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Jul 2021 20:03:37 +0000

flight 163480 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163480/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 163474

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e6917412628d11986f0e6fc028851c8181b24fb8
baseline version:
 xen                  6de3e5fce5e2a3c5f438e8e214168dd3a474cbbf

Last test of basis   163474  2021-07-09 12:00:25 Z    0 days
Testing same since   163480  2021-07-09 16:08:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  Dario Faggioli <dfaggioli@suse.com>
  Ian Jackson <iwj@xenproject.org>
  Olaf Hering <olaf@aepfle.de>

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

