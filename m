Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B8755FD9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 11:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564344.881807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKtV-0007F1-Gd; Mon, 17 Jul 2023 09:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564344.881807; Mon, 17 Jul 2023 09:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLKtV-0007Cz-DU; Mon, 17 Jul 2023 09:51:53 +0000
Received: by outflank-mailman (input) for mailman id 564344;
 Mon, 17 Jul 2023 09:51:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLKtT-0007Cp-Km; Mon, 17 Jul 2023 09:51:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLKtT-0000Dx-EU; Mon, 17 Jul 2023 09:51:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qLKtS-0005y8-PN; Mon, 17 Jul 2023 09:51:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qLKtS-0001el-Os; Mon, 17 Jul 2023 09:51:50 +0000
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
	bh=KiOMA7X/pOiXLvGyzTACUC9qIIyQud2p1YSPfw9HiWo=; b=DBaPH5ugbUxINY1CeQj2tgLgdJ
	32V27Rx4W/Mp5G/922KS3fDi/SA1JVf5FOl3XRCMwR6B3tedkL0aZJoxEThm0P3oH0RyrYlwZ0YD5
	hLrPnwaI3j/Sfc0OZjLS/AFxmFNlqkACjYknMHhRt24qm8ulPcpYM24FiTCQ0mbjLRLo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181808-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 181808: regressions - FAIL
X-Osstest-Failures:
    libvirt:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    libvirt:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:regression
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=36b247b908e50534a8450909f87bb3f0216a9ff7
X-Osstest-Versions-That:
    libvirt=14026db9b0e25739ea30685bd643ff23aca30588
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jul 2023 09:51:50 +0000

flight 181808 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181808/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 181789
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host     fail REGR. vs. 181789

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt   16 saverestore-support-check fail blocked in 181789
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181789
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 181789
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              36b247b908e50534a8450909f87bb3f0216a9ff7
baseline version:
 libvirt              14026db9b0e25739ea30685bd643ff23aca30588

Last test of basis   181789  2023-07-14 04:21:56 Z    3 days
Testing same since   181808  2023-07-15 04:18:52 Z    2 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tim Small <tim@seoss.co.uk>

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
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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
commit 36b247b908e50534a8450909f87bb3f0216a9ff7
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 12:00:04 2023 +0100

    docs: Reword ninja invocation note to clarify build directory
    
    Minor rewording to clarify purpose of the -C flag in the ninja
    invocation, whilst retaining previous meaning.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit ef7228f5ca22c7ebb47d40ce87b8c4817fd28c7c
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 12:00:03 2023 +0100

    docs: Fix deprecated use of implicit meson "setup" command
    
    Use the explicit meson "setup" command instead of the deprecated
    implicit invocation. The implied setup usage generates a warning with
    meson version 1.0.1:
    
    WARNING: Running the setup command as `meson [options]` instead of
    `meson setup [options]` is ambiguous and deprecated.
    
    Additionally the implicit command is likely to be confusing to those
    unfamiliar with Meson - the `build` argument in `meson build` resembles
    an action rather than an arbitrary path.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 4d50cd23c91c54996ba78f424811e0570ed7cb91
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 12:00:02 2023 +0100

    docs: Point to mailing list archives from submitting-patches
    
    Suggest that new contributors should review past patch submissions for
    typical style, feedback etc. prior to submitting. Link to archives.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 7160215146c9b3085a40e3923ab895644de3a645
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 12:00:01 2023 +0100

    docs: Advise running CI tests prior to submission
    
    In the preparing patches section, note that it is possible to run CI
    tests via gitlab prior to submitting patches.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 941fc36f114e6581425310462bd148b924d99495
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 12:00:00 2023 +0100

    docs: Reword "Preparing Patches" to clarify
    
    Clarify that patches should apply cleanly to the master branch. Give
    guidance for typical bug fix process for existing releases.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 3da8d8b5b1c48ae780d0ae76cec9a432e2cc6d39
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 11:59:59 2023 +0100

    docs: Add config instructions for clangd with libvirt
    
    In build environments which use gcc as the default compiler, use of the
    clangd LSP server (for enhanced code editing and navigation etc.) with
    libvirt requires some additional configuration.  Detail this and link
    from `hacking.rst`.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 401a6171a3ea80c3f00e25b78132a4346c346e68
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 11:59:58 2023 +0100

    docs: Point to compiling guide from code contribution guide
    
    The "hacking" doc details where to find the code, but not how to compile
    it - link to the instructions contained in `compiling.rst`.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 721897086254850c9fd1cf762695d265fc30e4b8
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 11:59:57 2023 +0100

    docs: Link main "contributing" from programming-specific guide
    
    There are two guides to contributing: `hacking.rst` is focused on code
    contributions, and `contributing.rst` is more general. Clarify scope of
    `hacking.rst` and link to the general guide in its references.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 225f6de45fc0520d7a4e1037419ab85c97ffe2c4
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 11:59:56 2023 +0100

    docs: Missing "full-stop"/"period" on some bullet items
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit cccf129c2d253fdb8f49cb89d4442dd019a482a3
Author: Tim Small <tim@seoss.co.uk>
Date:   Thu Jul 13 11:59:55 2023 +0100

    docs: Link to main docs directory from Quick Links
    
    Whilst the "docs" documentation map is linked in the navigation bar,
    users may scroll down and lose sight of this, so also place at the
    bottom of the "Quick Links" section.
    
    Signed-off-by: Tim Small <tim@seoss.co.uk>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

