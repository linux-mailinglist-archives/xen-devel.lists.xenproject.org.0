Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9447D9A37
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624437.973047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN54-0000IG-OM; Fri, 27 Oct 2023 13:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624437.973047; Fri, 27 Oct 2023 13:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN54-0000G3-LG; Fri, 27 Oct 2023 13:40:54 +0000
Received: by outflank-mailman (input) for mailman id 624437;
 Fri, 27 Oct 2023 13:40:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwN53-0000FM-IT; Fri, 27 Oct 2023 13:40:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwN53-00063k-G7; Fri, 27 Oct 2023 13:40:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qwN53-000706-48; Fri, 27 Oct 2023 13:40:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qwN53-0000PB-3d; Fri, 27 Oct 2023 13:40:53 +0000
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
	bh=VpzSCL2uM9jI7i33/Qr7NVqp1MZarDluPTWJzx3BpV8=; b=Q9Uf0F7Q87woh7vrvyCDA5c9Be
	VkoGUtxRTvfNpdCsGj9QrcHD23B5gEMu3Zc2I9JW71wf0y5epKZmzuC7nd+BinXxejxSC7SYD/3GA
	UA9Ibp5YJMz82j9eZs1uVp/D4Gh+/BprX3hYEGlI+f6GI2r6R5xU91g7eglXH41FEwrc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183549-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 183549: regressions - FAIL
X-Osstest-Failures:
    libvirt:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=ae4477bce41e934f751740767930e4c32f34ef31
X-Osstest-Versions-That:
    libvirt=4bdadede245b90ec1d9abfc659e07b247bc8b2ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Oct 2023 13:40:53 +0000

flight 183549 libvirt real [real]
flight 183556 libvirt real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183549/
http://logs.test-lab.xenproject.org/osstest/logs/183556/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 183535

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183535
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183535
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183535
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              ae4477bce41e934f751740767930e4c32f34ef31
baseline version:
 libvirt              4bdadede245b90ec1d9abfc659e07b247bc8b2ba

Last test of basis   183535  2023-10-26 04:20:25 Z    1 days
Testing same since   183549  2023-10-27 04:20:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Bolognani <abologna@redhat.com>
  Jiri Denemark <jdenemar@redhat.com>
  Peter Krempa <pkrempa@redhat.com>

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
commit ae4477bce41e934f751740767930e4c32f34ef31
Author: Jiri Denemark <jdenemar@redhat.com>
Date:   Thu Oct 26 12:03:18 2023 +0200

    po: Refresh potfile for v9.9.0
    
    Signed-off-by: Jiri Denemark <jdenemar@redhat.com>

commit 4242a9481694845eb43fb24f654ad6600051cce5
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Oct 3 15:39:02 2023 +0200

    meson: Rename build_tests -> tests_enabled
    
    Given that this variable now controls not just whether C tests
    are built, but also whether any test at all is executed, the new
    name is more appropriate.
    
    Update the description for the corresponding meson option
    accordingly.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 87f14badd0354432d245455cd706676de5ebcc30
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Oct 3 14:58:56 2023 +0200

    meson: Disable all tests when tests are disabled
    
    Currently, passing -Dtests=disabled only disables a subset of
    tests: those that are written in C and thus require compilation.
    Other tests, such as the syntax-check ones and those that are
    implemented as scripts, are always enabled.
    
    There's a potentially dangerous consequence of this behavior:
    when tests are disabled, 'meson test' will succeed as if they
    had been enabled. No indication of this will be shown, so the
    user will likely make the reasonable assumption that everything
    is fine when in fact the significantly reduced coverage might
    be hiding failures.
    
    To solve this issues, disable *all* tests when asked to do so,
    and inject an intentionally failing test to ensure that 'meson
    test' doesn't succeed.
    
    Best viewed with 'git show -w'.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 8ce0decc372051d616018f57ae268e2f03082eec
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Oct 3 14:53:08 2023 +0200

    meson: Make -Dexpensive_tests depend on -Dtests
    
    It only makes sense to enable expensive tests when tests are
    enabled. Disallow invalid configurations.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 5904228f92cb46253f0f4624e98cda9a375a24a3
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Oct 3 14:52:45 2023 +0200

    meson: Handle -Dtests=enabled with Clang
    
    There are some cases in which we automatically disable tests when
    using Clang as the compiler. If the user has explicitly asked for
    tests to be enabled, however, we should error out instead of
    silently disabling things.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 44711485b1c1dae0a69995dbaea2a8f7069b3f51
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Oct 3 14:46:56 2023 +0200

    meson: Move all handling of test options together
    
    This will make future patches nicer.
    
    Note that we need to handle these somewhat late because of the
    dependency on information about the compiler and the flags it
    supports.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit ed90d3622488cdd852b4281cf969a0cf582b5da7
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Tue Oct 3 14:57:05 2023 +0200

    meson: Do less when not building from git
    
    As explained in the comment, the syntax-check machinery uses git
    to figure out the list of files it should operate on, so we can
    only enable it when building from git.
    
    Despite only registering the various tests with meson in that
    case, however, we unconditionally perform a bunch of preparation
    that is only useful for the purpose of registering and running
    the tests. If we're not going to do that, we can skip a few steps
    and save a bit of time.
    
    Best viewed with 'git show -w'.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 5d95617ed92fcae26e6e863d9036e07054a3e234
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Wed Oct 25 17:33:49 2023 +0200

    ci: Disable optimizations on macOS
    
    Clang can be too aggressive at optimizations, which can end up
    breaking our test suite. See f9f5ab57189b for details.
    
    As a result of this, since 7944700b4037 we are automatically
    disabling tests when Clang is used unless it supports the
    -fsemantic-interposition compiler flag.
    
    Since the version of Clang included in macOS doesn't support that
    compiler flag, we end up always disabling the test suite on that
    platform.
    
    This is already far from ideal, considering that it was just last
    year when we finally managed to get the test suite to successfully
    pass on macOS, and it would be a real shame if the situation
    regressed again.
    
    With the upcoming changes, which will turn running 'meson test'
    into a hard failure if tests are disabled, this behavior will
    result in every single pipeline failing.
    
    Work around the problem the only way we can: disabling
    optimizations entirely for the macOS CI jobs.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit 3653eb5dcf713b6c0492a1597f7c23401236d4cc
Author: Andrea Bolognani <abologna@redhat.com>
Date:   Wed Oct 25 16:48:18 2023 +0200

    tests: Fix some test cases on macOS
    
    Test cases that depend on duplicating fds are using fairly big
    values as targets.
    
    This works fine on Linux, where RLIMIT_NOFILE is 1024 by
    default, but fails on macOS which uses 256 as the default.
    
    Decrease the values so that they're valid across all platforms.
    
    Signed-off-by: Andrea Bolognani <abologna@redhat.com>
    Reviewed-by: Martin Kletzander <mkletzan@redhat.com>

commit b9a5541b49517b1099b5e2ca54366e3f3a754776
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 16:18:40 2023 +0200

    qemublocktest: Use "target only" mode in 'testJSONtoJSON' and 'testBackingXMLjsonXML'
    
    Both tests pass a disk source definition which didn't go through the
    preparation steps and thus contains only the target information that
    were originally present, thus we should be using the
    QEMU_BLOCK_STORAGE_SOURCE_BACKEND_PROPS_TARGET_ONLY flag.
    
    For the same reason QEMU_BLOCK_STORAGE_SOURCE_BACKEND_PROPS_AUTO_READONLY
    used in 'testJSONtoJSON' doesn't make sense.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit e60c3057cc22adcfefbfd66a01e2df4b135cb8b5
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 13:51:09 2023 +0200

    qemuBlockStorageSourceGetBlockdevGetCacheProps: Return the cache object rather than appending it
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 4cf223962aa342e9c1d9b2d8678b0f90e8df28d0
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 13:19:08 2023 +0200

    qemuDomainDiskCachemodeFlags: Simplify usage
    
    Return whether a relevant cachemode was presented rather than returning
    an error, so that callers can be simplified. Use the proper enum type as
    argument rather than typecasting in the switch statement.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 91661eb19fede64fc447c1cdce6b6c70f642291f
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 09:55:19 2023 +0200

    virStorageSource: Use proper type for shadow copies of iomode/cachemode/discard/detect_zeroes
    
    The aforementioned fields in virStorageSource struct are copies of the
    disk properties, but were not converted to the proper type yet.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 5ac61e7c15c3bff00e36cc2c0fdd9fe024c08543
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 12:56:04 2023 +0200

    conf: Move definition of some disk type enums to a common header
    
    Certain disk config fields are mirrored between the disk and storage
    source definitions, but the proper types are not available for use in
    the virStorageSource definition. Move them so they can be used properly.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 01e35b452b19f1ef8166045a6e98ad60f6d0c469
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 09:38:56 2023 +0200

    qemuBlockStorageSourceGetBackendProps: Remove unnecessary indent for non-nbdkit code path
    
    Formatting of the 'nbdkit' driven backend breaks out of the switch
    statement so we don't need to have an unnecessary block and indentation
    level for the case when nbdkit is not in use.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit d38f32cb4eb082e302583b800a6f63a3371724f4
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 09:34:27 2023 +0200

    qemuBuildDriveSourceStr: Absorb only use of qemuDiskSourceGetProps
    
    'qemuBuildDriveSourceStr' used to build the legacy -drive commandline
    for SD cards is the only user of qemuDiskSourceGetProps. Move the helper
    directly inline.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 682db64417b070cb9c0368fe89b11a6e905a3cc3
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Tue Oct 17 16:10:47 2023 +0200

    qemu: migration: No longer avoid 'auto-read-only' option for migration
    
    The 'auto-read-only' blockdev option is available in all supported qemu
    versions so we can remove the migration hack which disabled it.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

commit 829d9ed829c0421dc1b40bbdfd86a648e2681fad
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Wed Oct 18 09:16:40 2023 +0200

    qemuxml2(argv|xml)test: Add network backed disk type='sd'
    
    Add a few examples of SD cards backed with network storage to capture
    the current state as the formatter code is about to be refactored.
    
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Ján Tomko <jtomko@redhat.com>

