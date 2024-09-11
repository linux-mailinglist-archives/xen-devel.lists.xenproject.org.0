Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895097479F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 03:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796129.1205613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soBpd-0000I3-3P; Wed, 11 Sep 2024 01:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796129.1205613; Wed, 11 Sep 2024 01:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soBpc-0000GE-V2; Wed, 11 Sep 2024 01:07:40 +0000
Received: by outflank-mailman (input) for mailman id 796129;
 Wed, 11 Sep 2024 01:07:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soBpb-0000G2-51; Wed, 11 Sep 2024 01:07:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soBpb-0004fb-1G; Wed, 11 Sep 2024 01:07:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soBpa-0004bF-GB; Wed, 11 Sep 2024 01:07:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soBpa-0004p9-FX; Wed, 11 Sep 2024 01:07:38 +0000
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
	bh=RnYbbo8wscECt+YPyi2J5ErcccuBPqCfjlfS8UIOoR4=; b=5QE79jFDahSbO40TXErhEuRog0
	5E3+PKTjP1QyGU972bX8yaE/TUWmSNIdGy3/Crz28svrxE6K1g+ygb80mj3YRWMQ8qc0u7D1dKp0O
	NtIAR6CWdBz/LwqdaUhmZNb4ffXRuL5N5PmaxsyZXYLGc3fBy8oWZT7zXNqVhA/m7Hvc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187641-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 187641: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c23571fe3150c2994afabcaa10c218b3d87fa832
X-Osstest-Versions-That:
    xen=4e56d0a9f9c5612c724299136c8ef55bc436419b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Sep 2024 01:07:38 +0000

flight 187641 xen-unstable real [real]
flight 187647 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187641/
http://logs.test-lab.xenproject.org/osstest/logs/187647/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail in 187647 REGR. vs. 187614

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail pass in 187647-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187614
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187614
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187614
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187614
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187614
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187614
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c23571fe3150c2994afabcaa10c218b3d87fa832
baseline version:
 xen                  4e56d0a9f9c5612c724299136c8ef55bc436419b

Last test of basis   187614  2024-09-09 16:07:21 Z    1 days
Testing same since   187641  2024-09-10 10:43:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrii Sultanov <andrii.sultanov@cloud.com>
  Christian Lindig <christian.lindig@cloud.com>
  Fouad Hilly <fouad.hilly@cloud.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Victor Lira <victorm.lira@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
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
commit c23571fe3150c2994afabcaa10c218b3d87fa832
Author: Victor Lira <victorm.lira@amd.com>
Date:   Mon Sep 9 17:31:46 2024 -0700

    automation: fix xilinx test console settings
    
    The test showed unreliable behavior due to unsupported console settings.
    Update the baud rate used to connect to the UART.
    
    Signed-off-by: Victor Lira <victorm.lira@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit ebb7c6b2faf27fbbb546282e6096e5680f82fef1
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Mon Sep 9 16:39:02 2024 +0200

    cirrus-ci: update to FreeBSD 14.1 image
    
    14.0 is going EOL by the end of the month.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 9a6250d80b9ec274852bdc6f8eb825d55ff4b45e
Author: Fouad Hilly <fouad.hilly@cloud.com>
Date:   Thu Aug 22 14:04:26 2024 +0100

    x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same
    
    Pass xen-ucode flags to do low level checks on microcode version and utilize
    it to allow for microcode downgrade or reapply the same version of the
    microcode.  ucode_force is required to be passed to a low level Intel and AMD
    for version checks to be done.
    
    While adding ucode_force, opt_ucode_allow_same was removed.  Remove
    opt_ucode_allow_same from documentation.
    
    Update CHANGELOG.md for opt_ucode_allow_same removal.
    
    Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit afc8d7dd300aae4b45eb74970b6db91d1161e397
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 21 20:59:46 2024 +0100

    x86/cache: Drop legacy __read_mostly/__ro_after_init definitions
    
    Lots of files were picking these up transitively, including lib.h
    
    However, lib.h needs __read_mostly for printk_once() and this has the side
    effect of kicking the transitive can down the road.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 41556be010f447df2683649a149a8c0ca2abc76b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Sep 5 20:18:06 2024 +0100

    x86/build: Swap cache.h includes for xen/sections.h
    
    These include {xen/asm}/cache.h but only want xen/sections.h.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a4194782da80f530e58dc8d074cab03ece25ee0e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu May 30 21:22:56 2024 +0100

    xen/build: Drop unused includes of xen/cache.h
    
    None of these are used, not even transitively.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit e58d41e9f00aa759122adb7dbe2d0bb0176a02ba
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Sep 5 21:40:20 2024 +0100

    x86/build: Rework includes in genapic/probe.c
    
    probe.c includes a large number of headers which are unused, and not from
    churn so far as I can see in history.  Strip back to a reasonable set.
    
    One complication is that genapic.h has to include xen/cpumask.h because
    there's no way to forward declare a cpumask_t.
    
    Also strip trailing whitespace while adjusting the file.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit be21da24c6a264eafbdd3b41ade838771fc56a2d
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Mon Sep 9 14:22:16 2024 +0100

    x86/boot: Add missing __XEN__ definition for 32 bit code
    
    We are compiling Xen source code so we should define __XEN__ macro.
    We don't want to import all definitions from XEN_CFLAGS (as done for
    other options) because most of them are processor dependent and
    do not apply to 32 bit.
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit bbe4035e6727d259dbb65c3ce432a508822a8957
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Mon Sep 9 14:22:15 2024 +0100

    x86/boot: Optimise 32 bit C source code
    
    The various filters are removing all optimisations.
    No need to have all optimisations turned off.
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 52e6db7a8cc5654562fc821e836edfbab374e06c
Author: Andrii Sultanov <andrii.sultanov@cloud.com>
Date:   Mon Sep 9 13:02:42 2024 +0100

    tools/oxenstored: Switch to using the plugin for Xenctrl.domain_getinfo
    
    Also run 'make format' on the file to reformat an adjacent block of code
    correctly.
    
    Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 8d3ca1b23b5413ea68109f9d0d719aef65819d9a
Author: Andrii Sultanov <andrii.sultanov@cloud.com>
Date:   Mon Sep 9 13:02:41 2024 +0100

    tools/oxenstored: Load the plugin for Xenctrl.domain_getinfo
    
    Oxenstored dynamically loads the plugin provided in ocaml/libs/xsd_glue.
    The plugin is verified to be providing the specified plugin_interface
    during its loading.
    
    If a V2 of the plugin is produced, V1 will still be present, and a new
    version should only be loaded if it's verified to exist
    (New oxenstored can run in an environment with only V1 of the plugin).
    
    The plugin is not switched to as of yet, the old Xenctrl stubs are still
    used.
    
    Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a6576011a4d21a6e88daba1308d5a19e2d964d9b
Author: Andrii Sultanov <andrii.sultanov@cloud.com>
Date:   Mon Sep 9 13:02:40 2024 +0100

    ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo
    
    This plugin intends to hide the unstable Xenctrl interface under a
    stable one. In case of the change in the interface, a V2 of this plugin
    would need to be produced, but V1 with the old interface would
    need to be kept (with potential change in the implementation) in the
    meantime.
    
    To reduce the need for such changes in the future, this plugin only
    provides the absolute minimum functionality that Oxenstored uses - only
    three fields of the domaininfo struct are used and presented here.
    
    Oxenstored currently uses the single-domain domain_getinfo function,
    whereas domain_getinfolist is a potentially more efficient option. Both
    of these are provided in the plugin to allow a transition from one to
    the other without modifying the interface in the future. Both return
    identical structures and rely on the same fields in xenctrl, thus if one
    of them breaks, both will break, and a new version of the interface
    would need to be issued.
    
    Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 0a15b7695bd983fa49da2e4c5daf8606497f0671
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 6 15:36:37 2024 +0100

    tools/ocaml: Rationalise .gitignore
    
    The root .gitignore is quite stale from recent (and less recent) removals, but
    also fails to work for the forthcoming dynamic plugin work.
    
    Strip all Ocaml content out of the root .gitignore, and provide a more local
    .gitignore's with up-to-date patterns.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>

commit 6978602334d92378269ca0dcea794ddc83b4dae7
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 22 20:18:15 2024 +0100

    x86/bitops: Use the POPCNT instruction when available
    
    It has existed in x86 CPUs since 2008, so we're only 16 years late adding
    support.  With all the other scafolding in place, implement arch_hweightl()
    for x86.
    
    The only complication is that the call to arch_generic_hweightl() is behind
    the compilers back.  Address this by writing it in ASM and ensure that it
    preserves all registers.
    
    Copy the code generation from generic_hweightl().  It's not a complicated
    algorithm, and is easy to regenerate if needs be, but cover it with the same
    unit tests as test_generic_hweightl() just for piece of mind.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit d177793f70b52455264bcae94912a818a362aa49
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 22 21:39:59 2024 +0100

    xen/bitops: Implement hweight64() in terms of hweight{l,32}()
    
    ... and drop generic_hweight{32,64}().
    
    This is identical on all architectures except ARM32.  Add one extra SELF_TEST
    to check that hweight64() works when the input is split in half.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit f20504e1cf78c90a50335f080f6393af02b8372f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 22 21:40:11 2024 +0100

    xen/bitops: Implement hweight32() in terms of hweightl()
    
    ... and drop generic_hweight32().
    
    As noted previously, the only two users of hweight32() are in __init paths.
    
    The int-optimised form of generic_hweight() is only two instructions shorter
    than the long-optimised form, and even then only on architectures which lack
    fast multiplication, so there's no point providing an int-optimised form.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit e8f0cc77dc3ce82d61afddfd889e3e1773a5192a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 22 18:13:57 2024 +0100

    xen/bitops: Drop the remnants of hweight{8,16}()
    
    They are no more.  No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit f7dc0862945155dd05814c46d7741a23319dae01
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 22 16:33:56 2024 +0100

    xen/bitops: Reinstate the please tidy message
    
    Recent additions have undone prior tidying at the top of the file.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

