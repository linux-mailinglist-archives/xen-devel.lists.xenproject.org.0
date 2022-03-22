Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3C4E369C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 03:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293256.498139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWUF0-0007EK-4s; Tue, 22 Mar 2022 02:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293256.498139; Tue, 22 Mar 2022 02:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWUF0-0007CY-0x; Tue, 22 Mar 2022 02:27:22 +0000
Received: by outflank-mailman (input) for mailman id 293256;
 Tue, 22 Mar 2022 02:27:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nWUEy-0007CO-V9; Tue, 22 Mar 2022 02:27:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nWUEy-0002XF-Qd; Tue, 22 Mar 2022 02:27:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nWUEy-0001Ks-9T; Tue, 22 Mar 2022 02:27:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nWUEy-0006Xj-8k; Tue, 22 Mar 2022 02:27:20 +0000
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
	bh=y5jIxr9K+th9kdjo3RpK0EcCIwZefdhSUzpryKmkpYU=; b=5PEe9jIE6dNqGRsGdtiPwoTvuo
	aF/6+8UDcJfkIlyPol/0nSp2+C6TmG7BJaQP/+9nl7507Sd9zLw8a2cKif8JXZZqzhETnUNAlqotl
	2r7eZ6gWAjfDey4memByLUlPcjKlzTSw1Yv/+HinsFeGQOOtv2e9fRbnZJwxafyKTmDE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168756-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 168756: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start/freebsd.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    qemu-mainline:build-armhf:xen-build:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:build-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=ecf1bbe3227cc1c54d7374aa737e7e0e60ee0c29
X-Osstest-Versions-That:
    qemuu=2058fdbe81e2985c226a026851dd26b146d3395c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Mar 2022 02:27:20 +0000

flight 168756 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168756/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 168712
 test-amd64-amd64-qemuu-freebsd12-amd64 21 guest-start/freebsd.repeat fail REGR. vs. 168712
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 168712
 build-armhf                   6 xen-build                fail REGR. vs. 168712

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168712
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168712
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 168712
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 168712
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168712
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                ecf1bbe3227cc1c54d7374aa737e7e0e60ee0c29
baseline version:
 qemuu                2058fdbe81e2985c226a026851dd26b146d3395c

Last test of basis   168712  2022-03-19 20:39:34 Z    2 days
Testing same since   168756  2022-03-21 15:38:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Cédric Le Goater <clg@kaod.org>
  Khem Raj <raj.khem@gmail.com>
  Lucas Coutinho <lucas.coutinho@eldorado.org.br>
  Peter Maydell <peter.maydell@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      blocked 
 test-amd64-i386-xl-vhd                                       pass    


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
commit ecf1bbe3227cc1c54d7374aa737e7e0e60ee0c29
Merge: 2058fdbe81 3515553bf6
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Mon Mar 21 11:16:56 2022 +0000

    Merge tag 'pull-ppc-20220321' of https://github.com/legoater/qemu into staging
    
    ppc-7.0 queue :
    
    * ISA v3.1 vector instruction fixes
    * Compilation fix regarding 'struct pt_regs' definition
    
    # gpg: Signature made Mon 21 Mar 2022 06:43:22 GMT
    # gpg:                using RSA key A0F66548F04895EBFE6B0B6051A343C7CFFBECA1
    # gpg: Good signature from "Cédric Le Goater <clg@kaod.org>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: A0F6 6548 F048 95EB FE6B  0B60 51A3 43C7 CFFB ECA1
    
    * tag 'pull-ppc-20220321' of https://github.com/legoater/qemu:
      target/ppc: Replicate Double->Single-Precision result
      target/ppc: Replicate double->int32 result for some vector insns
      ppc64: Avoid pt_regs struct definition
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 3515553bf625ad48aa90210379c4f387c2596093
Author: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Date:   Sun Mar 20 23:35:27 2022 +0100

    target/ppc: Replicate Double->Single-Precision result
    
    Power ISA v3.1 formalizes the previously undefined result in
    words 1 and 3 to be a copy of the result in words 0 and 2.
    
    This affects: xvcvsxdsp, xvcvuxdsp, xvcvdpsp.
    
    And the previously undefined result in word 1 to be a copy of
    the result in word 0.
    
    This affects: xscvdpsp.
    
    Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
    Message-Id: <20220316200427.3410437-1-lucas.coutinho@eldorado.org.br>
    Signed-off-by: Cédric Le Goater <clg@kaod.org>

commit 217979d33e78ee64978295962c33d8525973c760
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sun Mar 20 23:35:27 2022 +0100

    target/ppc: Replicate double->int32 result for some vector insns
    
    Power ISA v3.1 formalizes the previously undefined result in
    words 1 and 3 to be a copy of the result in words 0 and 2.
    
    This affects: xscvdpsxws, xscvdpuxws, xvcvdpsxws, xvcvdpuxws.
    
    Resolves: https://gitlab.com/qemu-project/qemu/-/issues/852
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    [ clg: checkpatch fixes ]
    Message-Id: <20220315053934.377519-1-richard.henderson@linaro.org>
    Signed-off-by: Cédric Le Goater <clg@kaod.org>

commit 9d1401b79463e74adbfac69d836789d4e103fb61
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Mar 20 23:35:27 2022 +0100

    ppc64: Avoid pt_regs struct definition
    
    Remove pt_regs indirection and instead reference gp_regs directly, this
    makes it portable across musl/glibc
    
    Use PT_* constants defined in asm/ptrace.h
    
    Move the file to ppc64 subdir and leave ppc empty
    
    Fixes
    ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
        return uc->uc_mcontext.regs->nip;
               ~~~~~~~~~~~~~~~~~~~~^
    
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Cc: Peter Maydell <peter.maydell@linaro.org>
    Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Cc: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220315015740.847370-1-raj.khem@gmail.com>
    Signed-off-by: Cédric Le Goater <clg@kaod.org>

