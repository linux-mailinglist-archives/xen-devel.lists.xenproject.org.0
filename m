Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E626496E74A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 03:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791495.1201381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smNlu-00043K-QY; Fri, 06 Sep 2024 01:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791495.1201381; Fri, 06 Sep 2024 01:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smNlu-000409-NR; Fri, 06 Sep 2024 01:28:22 +0000
Received: by outflank-mailman (input) for mailman id 791495;
 Fri, 06 Sep 2024 01:28:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smNlt-0003zz-Hj; Fri, 06 Sep 2024 01:28:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smNlt-00066T-80; Fri, 06 Sep 2024 01:28:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smNls-0007ZA-IA; Fri, 06 Sep 2024 01:28:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smNls-0001vY-Hi; Fri, 06 Sep 2024 01:28:20 +0000
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
	bh=CN4RQejBI6Ic6j7t5Uzvntp6nLG+rRE7MYd3rmkX8Zw=; b=RSfAP0onaUykJXytmeuDEQTm6f
	T6IXhG0OMJrUgJQ04yUMk33HFqMjKYzH0ff8GebD5jbCHFDUnN6UBLU4ioDWudf2cZG8otCRXnlcu
	92xVbztOty/csLRUDleA7yHN6fXJeWUrWvdjDfQDNiIiGbSb5wDm8oJ8ena8EuQbj0hg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187505-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 187505: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:build-armhf:xen-build:fail:regression
    qemu-mainline:build-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:leak-check/check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=cab1afb393ea0943b3086188e91d71d594ede6bf
X-Osstest-Versions-That:
    qemuu=e638d685ec2a0700fb9529cbd1b2823ac4120c53
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2024 01:28:20 +0000

flight 187505 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187505/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 187495

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd 22 leak-check/check             fail  like 187481
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187495
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187495
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187495
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                cab1afb393ea0943b3086188e91d71d594ede6bf
baseline version:
 qemuu                e638d685ec2a0700fb9529cbd1b2823ac4120c53

Last test of basis   187495  2024-09-04 13:09:03 Z    1 days
Testing same since   187505  2024-09-05 10:37:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guenter Roeck <linux@roeck-us.net>
  Helge Deller <deller@gmx.de>
  Peter Maydell <peter.maydell@linaro.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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
commit cab1afb393ea0943b3086188e91d71d594ede6bf
Merge: e638d685ec d33d3adb57
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Wed Sep 4 13:20:17 2024 +0100

    Merge tag 'hppa-v9.1-fixes-pull-request' of https://github.com/hdeller/qemu-hppa into staging
    
    hppa target fixes
    
    Two important patches for the hppa target which missed qemu-v9.1:
    - One fix for random linux-user crashes
    - One fix for random issues due to loosing the division V-bit
      during delivery of hardware interrupts. This triggers all sorts
      of random faults when running in system mode.
    
    Helge
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iHUEABYKAB0WIQS86RI+GtKfB8BJu973ErUQojoPXwUCZtgy9AAKCRD3ErUQojoP
    # X068AQCDCwbzsoQpFX/6Kx2lm3UsW4wrESh/CYcP+epd+X59dAD+LxNwN0ol5Gvl
    # kPzM+7QdKC7geIXvBxIG6UuggTscJgM=
    # =9roy
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Wed 04 Sep 2024 11:14:12 BST
    # gpg:                using EDDSA key BCE9123E1AD29F07C049BBDEF712B510A23A0F5F
    # gpg: Good signature from "Helge Deller <deller@gmx.de>" [unknown]
    # gpg:                 aka "Helge Deller <deller@kernel.org>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 4544 8228 2CD9 10DB EF3D  25F8 3E5F 3D04 A7A2 4603
    #      Subkey fingerprint: BCE9 123E 1AD2 9F07 C049  BBDE F712 B510 A23A 0F5F
    
    * tag 'hppa-v9.1-fixes-pull-request' of https://github.com/hdeller/qemu-hppa:
      target/hppa: Fix random 32-bit linux-user crashes
      target/hppa: Fix PSW V-bit packaging in cpu_hppa_get for hppa64
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit d33d3adb573794903380e03e767e06470514cefe
Author: Helge Deller <deller@gmx.de>
Date:   Tue Sep 3 18:21:28 2024 +0200

    target/hppa: Fix random 32-bit linux-user crashes
    
    The linux-user hppa target crashes randomly for me since commit
    081a0ed188d8 ("target/hppa: Do not mask in copy_iaoq_entry").
    
    That commit dropped the masking of the IAOQ addresses while copying them
    from other registers and instead keeps them with all 64 bits up until
    the full gva is formed with the help of hppa_form_gva_psw().
    
    So, when running in linux-user mode on an emulated 64-bit CPU, we need
    to mask to a 32-bit address space at the very end in hppa_form_gva_psw()
    if the PSW-W flag isn't set (which is the case for linux-user on hppa).
    
    Fixes: 081a0ed188d8 ("target/hppa: Do not mask in copy_iaoq_entry")
    Cc: qemu-stable@nongnu.org # v9.1+
    Signed-off-by: Helge Deller <deller@gmx.de>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit ead5078cf1a5f11d16e3e8462154c859620bcc7e
Author: Helge Deller <deller@gmx.de>
Date:   Tue Sep 3 17:22:10 2024 +0200

    target/hppa: Fix PSW V-bit packaging in cpu_hppa_get for hppa64
    
    While adding hppa64 support, the psw_v variable got extended from 32 to 64
    bits.  So, when packaging the PSW-V bit from the psw_v variable for interrupt
    processing, check bit 31 instead the 63th (sign) bit.
    
    This fixes a hard to find Linux kernel boot issue where the loss of the PSW-V
    bit due to an ITLB interruption in the middle of a series of ds/addc
    instructions (from the divU milicode library) generated the wrong division
    result and thus triggered a Linux kernel crash.
    
    Link: https://lore.kernel.org/lkml/718b8afe-222f-4b3a-96d3-93af0e4ceff1@roeck-us.net/
    Reported-by: Guenter Roeck <linux@roeck-us.net>
    Signed-off-by: Helge Deller <deller@gmx.de>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Tested-by: Guenter Roeck <linux@roeck-us.net>
    Fixes: 931adff31478 ("target/hppa: Update cpu_hppa_get/put_psw for hppa64")
    Cc: qemu-stable@nongnu.org # v8.2+

