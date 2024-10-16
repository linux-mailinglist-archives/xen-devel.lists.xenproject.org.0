Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C529A1289
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 21:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820243.1233707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t19hB-0004hY-A1; Wed, 16 Oct 2024 19:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820243.1233707; Wed, 16 Oct 2024 19:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t19hB-0004f3-7I; Wed, 16 Oct 2024 19:28:33 +0000
Received: by outflank-mailman (input) for mailman id 820243;
 Wed, 16 Oct 2024 19:28:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t19hA-0004et-I2; Wed, 16 Oct 2024 19:28:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t19hA-0002As-Ef; Wed, 16 Oct 2024 19:28:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t19hA-0003wQ-1G; Wed, 16 Oct 2024 19:28:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t19hA-0007CN-0k; Wed, 16 Oct 2024 19:28:32 +0000
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
	bh=S6kAXuVEzezhtZ8l5rAEzuvF0JFOyXqzsGGZXiv4vH0=; b=rn10mZQjKvs4XShaJCAIfHLjB+
	0dcvPxmYWwNJw2Ec3caSd6rLzoMBFLKllIssUEcLZ28zWhUd7h7sQemMFdB+Ym+loCw0JZ8lo7k6+
	hBd2nJsSIrGRBgpCqR7RnzYaUQp8OVmJetMJW7n4EcRcF9BeIDLuzgu9gKV7tiBvkASA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188110-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 188110: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:build-armhf:xen-build:fail:regression
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=47990ecef286606794d607d4ca8703d71c98d659
X-Osstest-Versions-That:
    xen=3f6ee3db2e878398cfcde725399b4d1b04e92269
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Oct 2024 19:28:32 +0000

flight 188110 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188110/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 188095
 build-armhf                   6 xen-build                fail REGR. vs. 188095

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 188095
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 188095
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 188095
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 188095
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 188095
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  47990ecef286606794d607d4ca8703d71c98d659
baseline version:
 xen                  3f6ee3db2e878398cfcde725399b4d1b04e92269

Last test of basis   188095  2024-10-15 16:39:00 Z    1 days
Testing same since   188110  2024-10-16 05:31:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
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
 test-armhf-armhf-xl                                          blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-amd64-migrupgrade                                 pass    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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
commit 47990ecef286606794d607d4ca8703d71c98d659
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Tue Oct 15 09:25:13 2024 +0100

    x86/boot: Improve MBI2 structure check
    
    Tag structure should contain at least the tag header.
    Entire tag structure must be contained inside MBI2 data.
    
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

commit f4c3300d88189ab18b6459e22e1aa945ab1d3f6f
Author: Frediano Ziglio <frediano.ziglio@cloud.com>
Date:   Tue Oct 15 09:25:12 2024 +0100

    x86/boot: Align mbi2.c stack to 16 bytes
    
    Most of Xen is built with a stack alignment of 8 bytes, but the UEFI spec
    mandates 16 and UEFI services will fault if the stack is misaligned.
    
    While the caller of efi_multiboot2_prelude() takes care to align the stack,
    mbi2.c accidentally got the Xen-wide default of 8, and has a 50% chance of
    crashing depending on how many variables the compiler decided to spill to the
    stack.
    
    Compile mbi2.c with the appropriate alignment for UEFI functionality.
    
    Also take the opportunity to make it a fully .init object.
    
    Fixes: eb21ce14d709 ('x86/boot: Rewrite EFI/MBI2 code partly in C')
    Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    [rewrite the commit message]
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

