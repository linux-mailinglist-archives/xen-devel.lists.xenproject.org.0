Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3A6C4111
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 04:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513074.793544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pepCo-0005Jc-6q; Wed, 22 Mar 2023 03:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513074.793544; Wed, 22 Mar 2023 03:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pepCo-0005Hv-3S; Wed, 22 Mar 2023 03:32:06 +0000
Received: by outflank-mailman (input) for mailman id 513074;
 Wed, 22 Mar 2023 03:32:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pepCm-0005Hl-0c; Wed, 22 Mar 2023 03:32:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pepCl-0007jy-TQ; Wed, 22 Mar 2023 03:32:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pepCl-00054Y-FD; Wed, 22 Mar 2023 03:32:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pepCl-0008GF-Ej; Wed, 22 Mar 2023 03:32:03 +0000
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
	bh=Rcf1tDWLYJWUAcDSuKT29Z4nFmuRHc3MFgCZsVa2Pqg=; b=OD4Tv4WIJJIh+jQA+vUxbS3Ikq
	DTYTbw9jZmkoeTYwIuqT7q1D3ovozoQzRPcNI6e9UUJ5YcjbpxvuQHJj+FRX9CvhKkfQpWA7mRmI6
	kXByf4tmK4pzmQUXI5DzlNC7qQaBpsrgVr1SSw6btL8g3SXZ/OCBdnOFDmHFQGcb4wKU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179842-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 179842: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    xen-4.16-testing:build-arm64-pvops:kernel-build:fail:regression
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-4.16-testing:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=3c924fe46b455834b5c04268db6b528b549668d1
X-Osstest-Versions-That:
    xen=84dfe7a56f04a7412fa4869b3e756c49e1cfbe75
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Mar 2023 03:32:03 +0000

flight 179842 xen-4.16-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179842/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 179065

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 179065
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 179065
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 179065
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 179065
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 179065
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 179065
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 179065
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 179065
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 179065
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  3c924fe46b455834b5c04268db6b528b549668d1
baseline version:
 xen                  84dfe7a56f04a7412fa4869b3e756c49e1cfbe75

Last test of basis   179065  2023-03-03 07:37:09 Z   18 days
Testing same since   179842  2023-03-21 12:36:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      starved 
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
commit 3c924fe46b455834b5c04268db6b528b549668d1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 10 21:11:14 2023 +0000

    x86/spec-ctrl: Defer CR4_PV32_RESTORE on the cstar_enter path
    
    As stated (correctly) by the comment next to SPEC_CTRL_ENTRY_FROM_PV, between
    the two hunks visible in the patch, RET's are not safe prior to this point.
    
    CR4_PV32_RESTORE hides a CALL/RET pair in certain configurations (PV32
    compiled in, SMEP or SMAP active), and the RET can be attacked with one of
    several known speculative issues.
    
    Furthermore, CR4_PV32_RESTORE also hides a reference to the cr4_pv32_mask
    global variable, which is not safe when XPTI is active before restoring Xen's
    full pagetables.
    
    This crash has gone unnoticed because it is only AMD CPUs which permit the
    SYSCALL instruction in compatibility mode, and these are not vulnerable to
    Meltdown so don't activate XPTI by default.
    
    This is XSA-429 / CVE-2022-42331
    
    Fixes: 5e7962901131 ("x86/entry: Organise the use of MSR_SPEC_CTRL at each entry/exit point")
    Fixes: 5784de3e2067 ("x86: Meltdown band-aid against malicious 64-bit PV guests")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit df5b055b12116d9e63ced59ae5389e69a2a3de48)

commit 564de020d29fbc4efd20ef8052051e86b2465a1a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 21 12:01:01 2023 +0000

    x86/HVM: serialize pinned cache attribute list manipulation
    
    While the RCU variants of list insertion and removal allow lockless list
    traversal (with RCU just read-locked), insertions and removals still
    need serializing amongst themselves. To keep things simple, use the
    domain lock for this purpose.
    
    This is CVE-2022-42334 / part of XSA-428.
    
    Fixes: 642123c5123f ("x86/hvm: provide XEN_DMOP_pin_memory_cacheattr")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    (cherry picked from commit 829ec245cf66560e3b50d140ccb3168e7fb7c945)

commit 2fe1517a00e088f6b1f1aff7d4ea1b477b288987
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 21 12:01:01 2023 +0000

    x86/HVM: bound number of pinned cache attribute regions
    
    This is exposed via DMOP, i.e. to potentially not fully privileged
    device models. With that we may not permit registration of an (almost)
    unbounded amount of such regions.
    
    This is CVE-2022-42333 / part of XSA-428.
    
    Fixes: 642123c5123f ("x86/hvm: provide XEN_DMOP_pin_memory_cacheattr")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    (cherry picked from commit a5e768640f786b681063f4e08af45d0c4e91debf)

commit b0d6684ee58f7252940f5a62e4b85bdc56307eef
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 21 11:59:44 2023 +0000

    x86/shadow: account for log-dirty mode when pre-allocating
    
    Pre-allocation is intended to ensure that in the course of constructing
    or updating shadows there won't be any risk of just made shadows or
    shadows being acted upon can disappear under our feet. The amount of
    pages pre-allocated then, however, needs to account for all possible
    subsequent allocations. While the use in sh_page_fault() accounts for
    all shadows which may need making, so far it didn't account for
    allocations coming from log-dirty tracking (which piggybacks onto the
    P2M allocation functions).
    
    Since shadow_prealloc() takes a count of shadows (or other data
    structures) rather than a count of pages, putting the adjustment at the
    call site of this function won't work very well: We simply can't express
    the correct count that way in all cases. Instead take care of this in
    the function itself, by "snooping" for L1 type requests. (While not
    applicable right now, future new request sites of L1 tables would then
    also be covered right away.)
    
    It is relevant to note here that pre-allocations like the one done from
    shadow_alloc_p2m_page() are benign when they fall in the "scope" of an
    earlier pre-alloc which already included that count: The inner call will
    simply find enough pages available then; it'll bail right away.
    
    This is CVE-2022-42332 / XSA-427.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Tim Deegan <tim@xen.org>
    (cherry picked from commit 91767a71061035ae42be93de495cd976f863a41a)
(qemu changes not included)

