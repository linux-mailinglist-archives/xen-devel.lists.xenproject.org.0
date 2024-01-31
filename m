Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3F844B13
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 23:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674173.1048949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVJ82-0004da-3v; Wed, 31 Jan 2024 22:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674173.1048949; Wed, 31 Jan 2024 22:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVJ82-0004c3-0L; Wed, 31 Jan 2024 22:32:22 +0000
Received: by outflank-mailman (input) for mailman id 674173;
 Wed, 31 Jan 2024 22:32:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVJ80-0004bt-Hs; Wed, 31 Jan 2024 22:32:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVJ80-0000Qn-BA; Wed, 31 Jan 2024 22:32:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVJ7z-0002oK-Pk; Wed, 31 Jan 2024 22:32:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rVJ7z-0007Yg-P5; Wed, 31 Jan 2024 22:32:19 +0000
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
	bh=pPe79iqXFww669OKbvRzesGl2s3QejyWUBrHvcWQGAw=; b=qbWTQsZ1+ippoBJIyZ1ewZbRIE
	2kp6f9Bu7g9280QL+b3eWlww4sVRuxruG60Ldu0tD6xXdmpy0T+GCDF5iL2PnO1GVjdbg3Yx9it9T
	ApDJvhYH2UkwbwPCgZsSjRcG+kjR5ea934wly61fApQUeVKPyRl2b0DbJ1zDi8YVbNqQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184534-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184534: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-arm64-libvirt:libvirt-build:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=2a6526c4f389bb741e511be11721b3d1cbf1034a
X-Osstest-Versions-That:
    linux=861c0981648f5b64c86fd028ee622096eb7af05a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Jan 2024 22:32:19 +0000

flight 184534 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184534/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 184525

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184525
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184525
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184525
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184525
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184525
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184525
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184525
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184525
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                2a6526c4f389bb741e511be11721b3d1cbf1034a
baseline version:
 linux                861c0981648f5b64c86fd028ee622096eb7af05a

Last test of basis   184525  2024-01-30 04:10:43 Z    1 days
Testing same since   184534  2024-01-30 23:45:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Gordeev <agordeev@linux.ibm.com>
  Anders Roxell <anders.roxell@linaro.org>
  Arthur Grillo <arthurgrillo@riseup.net>
  Dan Carpenter <dan.carpenter@linaro.org>
  David Gow <davidgow@google.com>
  Joe Lawrence <joe.lawrence@redhat.com>
  Kees Cook <keescook@chromium.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Marco Pagani <marpagan@redhat.com>
  Marcos Paulo de Souza <mpdesouza@suse.com>
  Mark Brown <broonie@kernel.org>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Miroslav Benes <mbenes@suse.cz>
  Rae Moar <rmoar@google.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Shuah Khan <skhan@linuxfoundation.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    


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
commit 2a6526c4f389bb741e511be11721b3d1cbf1034a
Merge: d1d873a9bfac 1a9f2c776d14
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jan 30 15:12:58 2024 -0800

    Merge tag 'linux_kselftest-kunit-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
    
    Pull kunit fixes from Shuah Khan:
     "NULL vs IS_ERR() bug fixes, documentation update, MAINTAINERS file
      update to add Rae Moar as a reviewer, and a fix to run test suites
      only after module initialization completes"
    
    * tag 'linux_kselftest-kunit-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
      Documentation: KUnit: Update the instructions on how to test static functions
      kunit: run test suites only after module initialization completes
      MAINTAINERS: kunit: Add Rae Moar as a reviewer
      kunit: device: Fix a NULL vs IS_ERR() check in init()
      kunit: Fix a NULL vs IS_ERR() bug

commit d1d873a9bfac44a9a455d2ec47b85ea66f7888b9
Merge: 53ed2ac8fc1d b54761f6e977
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jan 30 15:10:17 2024 -0800

    Merge tag 'linux_kselftest-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
    
    Pull kselftest fixes from Shuah Khan:
     "Three fixes to livepatch, rseq, and seccomp tests"
    
    * tag 'linux_kselftest-fixes-6.8-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
      kselftest/seccomp: Report each expectation we assert as a KTAP test
      kselftest/seccomp: Use kselftest output functions for benchmark
      selftests/livepatch: fix and refactor new dmesg message code
      selftests/rseq: Do not skip !allowed_cpus for mm_cid

commit 53ed2ac8fc1de6658aadae5714627ac99b9dddb0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jan 30 11:34:49 2024 -0800

    soc: apple: mailbox: error pointers are negative integers
    
    In an entirely unrelated discussion where I pointed out a stupid thinko
    of mine, Rasmus piped up and noted that that obvious mistake already
    existed elsewhere in the kernel tree.
    
    An "error pointer" is the negative error value encoded as a pointer,
    making the whole "return error or valid pointer" use-case simple and
    straightforward.  We use it all over the kernel.
    
    But the key here is that errors are _negative_ error numbers, not the
    horrid UNIX user-level model of "-1 and the value of 'errno'".
    
    The Apple mailbox driver used the positive error values, and thus just
    returned invalid normal pointers instead of actual errors.
    
    Of course, the reason nobody ever noticed is that the errors presumably
    never actually happen, so this is fixing a conceptual bug rather than an
    actual one.
    
    Reported-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
    Link: https://lore.kernel.org/all/5c30afe0-f9fb-45d5-9333-dd914a1ea93a@prevas.dk/
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit b54761f6e9773350c0d1fb8e1e5aacaba7769d0f
Author: Mark Brown <broonie@kernel.org>
Date:   Wed Jan 24 13:00:19 2024 +0000

    kselftest/seccomp: Report each expectation we assert as a KTAP test
    
    The seccomp benchmark test makes a number of checks on the performance it
    measures and logs them to the output but does so in a custom format which
    none of the automated test runners understand meaning that the chances that
    anyone is paying attention are slim. Let's additionally log each result in
    KTAP format so that automated systems parsing the test output will see each
    comparison as a test case. The original logs are left in place since they
    provide the actual numbers for analysis.
    
    As part of this rework the flow for the main program so that when we skip
    tests we still log all the tests we skip, this is because the standard KTAP
    headers and footers include counts of the number of expected and run tests.
    
    Tested-by: Anders Roxell <anders.roxell@linaro.org>
    Acked-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Mark Brown <broonie@kernel.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 5820cfee443f8a90ea3eb9f99f57f2049a4a93c3
Author: Mark Brown <broonie@kernel.org>
Date:   Wed Jan 24 13:00:18 2024 +0000

    kselftest/seccomp: Use kselftest output functions for benchmark
    
    In preparation for trying to output the test results themselves in TAP
    format rework all the prints in the benchmark to use the kselftest output
    functions. The uses of system() all produce single line output so we can
    avoid having to deal with fully managing the child process and continue to
    use system() by simply printing an empty message before we invoke system().
    We also leave one printf() used to complete a line of output in place.
    
    Tested-by: Anders Roxell <anders.roxell@linaro.org>
    Acked-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Mark Brown <broonie@kernel.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit f1fea725cc93fcc3c5af9a2af63ffdc40dd2259e
Author: Joe Lawrence <joe.lawrence@redhat.com>
Date:   Wed Dec 20 10:11:51 2023 -0500

    selftests/livepatch: fix and refactor new dmesg message code
    
    The livepatching kselftests rely on comparing expected vs. observed
    dmesg output.  After each test, new dmesg entries are determined by the
    'comm' utility comparing a saved, pre-test copy of dmesg to post-test
    dmesg output.
    
    Alexander reports that the 'comm --nocheck-order -13' invocation used by
    the tests can be confused when dmesg entry timestamps vary in magnitude
    (ie, "[   98.820331]" vs. "[  100.031067]"), in which case, additional
    messages are reported as new.  The unexpected entries then spoil the
    test results.
    
    Instead of relying on 'comm' or 'diff' to determine new testing dmesg
    entries, refactor the code:
    
      - pre-test  : log a unique canary dmesg entry
      - test      : run tests, log messages
      - post-test : filter dmesg starting from pre-test message
    
    Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
    Closes: https://lore.kernel.org/live-patching/ZYAimyPYhxVA9wKg@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com/
    Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
    Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
    Tested-by: Marcos Paulo de Souza <mpdesouza@suse.com>
    Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>
    Acked-by: Miroslav Benes <mbenes@suse.cz>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit d53271c05965b4469c57a18c66585075df81c504
Author: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Date:   Thu Jan 11 10:49:22 2024 -0500

    selftests/rseq: Do not skip !allowed_cpus for mm_cid
    
    Indexing with mm_cid is incompatible with skipping disallowed cpumask,
    because concurrency IDs are based on a virtual ID allocation which is
    unrelated to the physical CPU mask.
    
    These issues can be reproduced by running the rseq selftests under a
    taskset which excludes CPU 0, e.g.
    
      taskset -c 10-20 ./run_param_test.sh
    
    Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Cc: Shuah Khan <shuah@kernel.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: "Paul E. McKenney" <paulmck@kernel.org>
    Cc: Boqun Feng <boqun.feng@gmail.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 1a9f2c776d1416c4ea6cb0d0b9917778c41a1a7d
Author: Arthur Grillo <arthurgrillo@riseup.net>
Date:   Wed Jan 10 14:39:28 2024 -0300

    Documentation: KUnit: Update the instructions on how to test static functions
    
    Now that we have the VISIBLE_IF_KUNIT and EXPORT_SYMBOL_IF_KUNIT macros,
    update the instructions to recommend this way of testing static
    functions.
    
    Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
    Reviewed-by: David Gow <davidgow@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit a1af6a2bfa0cb46d70b7df5352993e750da6c79b
Author: Marco Pagani <marpagan@redhat.com>
Date:   Wed Jan 10 16:59:47 2024 +0100

    kunit: run test suites only after module initialization completes
    
    Commit 2810c1e99867 ("kunit: Fix wild-memory-access bug in
    kunit_free_suite_set()") fixed a wild-memory-access bug that could have
    happened during the loading phase of test suites built and executed as
    loadable modules. However, it also introduced a problematic side effect
    that causes test suites modules to crash when they attempt to register
    fake devices.
    
    When a module is loaded, it traverses the MODULE_STATE_UNFORMED and
    MODULE_STATE_COMING states before reaching the normal operating state
    MODULE_STATE_LIVE. Finally, when the module is removed, it moves to
    MODULE_STATE_GOING before being released. However, if the loading
    function load_module() fails between complete_formation() and
    do_init_module(), the module goes directly from MODULE_STATE_COMING to
    MODULE_STATE_GOING without passing through MODULE_STATE_LIVE.
    
    This behavior was causing kunit_module_exit() to be called without
    having first executed kunit_module_init(). Since kunit_module_exit() is
    responsible for freeing the memory allocated by kunit_module_init()
    through kunit_filter_suites(), this behavior was resulting in a
    wild-memory-access bug.
    
    Commit 2810c1e99867 ("kunit: Fix wild-memory-access bug in
    kunit_free_suite_set()") fixed this issue by running the tests when the
    module is still in MODULE_STATE_COMING. However, modules in that state
    are not fully initialized, lacking sysfs kobjects. Therefore, if a test
    module attempts to register a fake device, it will inevitably crash.
    
    This patch proposes a different approach to fix the original
    wild-memory-access bug while restoring the normal module execution flow
    by making kunit_module_exit() able to detect if kunit_module_init() has
    previously initialized the tests suite set. In this way, test modules
    can once again register fake devices without crashing.
    
    This behavior is achieved by checking whether mod->kunit_suites is a
    virtual or direct mapping address. If it is a virtual address, then
    kunit_module_init() has allocated the suite_set in kunit_filter_suites()
    using kmalloc_array(). On the contrary, if mod->kunit_suites is still
    pointing to the original address that was set when looking up the
    .kunit_test_suites section of the module, then the loading phase has
    failed and there's no memory to be freed.
    
    v4:
    - rebased on 6.8
    - noted that kunit_filter_suites() must return a virtual address
    v3:
    - add a comment to clarify why the start address is checked
    v2:
    - add include <linux/mm.h>
    
    Fixes: 2810c1e99867 ("kunit: Fix wild-memory-access bug in kunit_free_suite_set()")
    Reviewed-by: David Gow <davidgow@google.com>
    Tested-by: Rae Moar <rmoar@google.com>
    Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
    Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
    Signed-off-by: Marco Pagani <marpagan@redhat.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 57e39086fb868a84f772cf097004f4715d8aaccb
Author: David Gow <davidgow@google.com>
Date:   Fri Jan 12 07:49:47 2024 +0800

    MAINTAINERS: kunit: Add Rae Moar as a reviewer
    
    Rae has been shouldering a lot of the KUnit review burden for the last
    year, and will continue to do so in the future. Thanks!
    
    Signed-off-by: David Gow <davidgow@google.com>
    Reviewed-by: Rae Moar <rmoar@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 083974ebb8fc65978d6cacd1bcfe9158d6234b98
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Wed Jan 10 21:55:14 2024 +0300

    kunit: device: Fix a NULL vs IS_ERR() check in init()
    
    The root_device_register() function does not return NULL, it returns
    error pointers.  Fix the check to match.
    
    Fixes: d03c720e03bd ("kunit: Add APIs for managing devices")
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
    Reviewed-by: Rae Moar <rmoar@google.com>
    Reviewed-by: David Gow <davidgow@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit ed1a72fb0d646c983c85b62144fb1d134a8edb71
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Wed Jan 10 21:55:22 2024 +0300

    kunit: Fix a NULL vs IS_ERR() bug
    
    The kunit_device_register() function doesn't return NULL, it returns
    error pointers.  Change the KUNIT_ASSERT_NOT_NULL() to check for
    ERR_OR_NULL().
    
    Fixes: d03c720e03bd ("kunit: Add APIs for managing devices")
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
    Reviewed-by: Rae Moar <rmoar@google.com>
    Reviewed-by: David Gow <davidgow@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

