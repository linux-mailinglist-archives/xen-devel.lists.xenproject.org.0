Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09627917425
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 00:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748120.1155702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMERC-0007SJ-BP; Tue, 25 Jun 2024 22:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748120.1155702; Tue, 25 Jun 2024 22:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMERC-0007P6-71; Tue, 25 Jun 2024 22:14:54 +0000
Received: by outflank-mailman (input) for mailman id 748120;
 Tue, 25 Jun 2024 22:14:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMERA-0007Ow-VA; Tue, 25 Jun 2024 22:14:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMERA-00079T-NA; Tue, 25 Jun 2024 22:14:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMERA-0003Ct-9e; Tue, 25 Jun 2024 22:14:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMERA-0004yY-9C; Tue, 25 Jun 2024 22:14:52 +0000
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
	bh=+kxSXIFbq69d9ohWoBKv7bs1cB6FIM8Sic6qfUNBzio=; b=EYmkofPc6vwZLCQMzDb39Z+iB7
	/d5NlSYPf+j7Y3VXmuZ1+ioeJN6vdG/Okc/wU5wQrggZ4Gk+xqa9HAXeDRobbB5veJaXrEvBQBj0O
	XbL0+ZIbTjeFJgjUUTVh/EwuVu5OmrwpxX9lHIFNe9Bfzz9aTPlJOxop18L16Y6mQhvc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186480-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 186480: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c56f1ef577831ec70645ca5874d54f2e698c6761
X-Osstest-Versions-That:
    xen=9e7c26ad8532c3efda174dee5ab8bdbeef1e4f6d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jun 2024 22:14:52 +0000

flight 186480 xen-unstable real [real]
flight 186496 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186480/
http://logs.test-lab.xenproject.org/osstest/logs/186496/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 186465
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 186465

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186465
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186465
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186465
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186465
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186465
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186465
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c56f1ef577831ec70645ca5874d54f2e698c6761
baseline version:
 xen                  9e7c26ad8532c3efda174dee5ab8bdbeef1e4f6d

Last test of basis   186465  2024-06-24 01:51:55 Z    1 days
Failing since        186471  2024-06-24 19:07:13 Z    1 days    2 attempts
Testing same since   186480  2024-06-25 06:50:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@vates.tech>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
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
commit c56f1ef577831ec70645ca5874d54f2e698c6761
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Fri Jun 21 11:22:05 2024 +0200

    xen/arm: static-shmem: request host address to be specified for 1:1 domains
    
    As a follow up to commit cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem
    should be direct-mapped for direct-mapped domains") add a check to
    request that both host and guest physical address must be supplied for
    direct mapped domains. Otherwise return an error to prevent unwanted
    behavior.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Fixes: 988f1c7e1f40 ("xen/arm: static-shmem: fix "gbase/pbase used  uninitialized" build failure")
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 908407bf2b29a38d6879fc8c57dad14473ef67f8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 21 20:29:07 2024 +0100

    xen/riscv: Drop legacy __ro_after_init definition
    
    Hide the legacy __ro_after_init definition in xen/cache.h for RISC-V, to avoid
    its use creeping in.  Only mm.c needs adjusting as a consequence
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 8c3bb4d8ce3f9e69ee173b8787a8cbbf1a852d06
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Feb 20 19:58:08 2024 +0000

    xen/gnttab: Perform compat/native gnttab_query_size check
    
    This subop appears to have been missed from the compat checks.
    
    Fixes: 5ce8fafa947c ("Dynamic grant-table sizing")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit ebed411e7afa240fea803ac97a0ced73fffef8dc
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Feb 20 19:34:06 2024 +0000

    xen/xlat: Sort structs per file
    
    ... with a C local to avoid ambiguities over _ and - as separators.
    
    Also adjust arch-x86/xen.h which is out-of-order relative to the other
    arch-x86/ files.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 90c1520d4eff8e6480035f523041fe62c5065833
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Feb 20 19:27:33 2024 +0000

    xen/xlat: Sort out whitespace
    
     * Fix tabs/spaces mismatch for certain rows
     * Insert lines between header files to improve legibility
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 6a17e1199332c24b41bacccdc91dbeaf22653588
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 22 12:17:30 2024 +0200

    x86/shadow: Don't leave trace record field uninitialized
    
    The emulation_count field is set only conditionally right now. Convert
    all field setting to an initializer, thus guaranteeing that field to be
    set to 0 (default initialized) when GUEST_PAGING_LEVELS != 3.
    
    Rework trace_shadow_emulate() to be consistent with the other trace helpers.
    
    Coverity-ID: 1598430
    Fixes: 9a86ac1aa3d2 ("xentrace 5/7: Additional tracing for the shadow code")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 8765783434e903fa8be628de25f9941b0204502d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 22 14:05:13 2024 +0100

    x86/shadow: Rework trace_shadow_emulate_other() as sh_trace_gfn_va()
    
    sh_trace_gfn_va() is very similar to sh_trace_gl1e_va(), and a rather shorter
    name than trace_shadow_emulate_other().
    
    It's only referenced in CONFIG_HVM=y builds, so give it a __maybe_unused to
    placate randconfig builds.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 578066d82b2b96e949ff46e6c142a33231b1ae2d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 22 13:58:22 2024 +0100

    x86/shadow: Introduce sh_trace_gl1e_va()
    
    trace_shadow_fixup() and trace_not_shadow_fault() both write out identical
    trace records.  Reimplement them in terms of a common sh_trace_gl1e_va().
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 2e9f8a734e3dd2b6abccea325dd5e854a3670dec
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 22 13:51:43 2024 +0100

    x86/shadow: Rework trace_shadow_gen() into sh_trace_va()
    
    The ((GUEST_PAGING_LEVELS - 2) << 8) expression in the event field is common
    to all shadow trace events, so introduce sh_trace() as a very thin wrapper
    around trace().
    
    Then, rename trace_shadow_gen() to sh_trace_va() to better describe what it is
    doing, and to be more consistent with later cleanup.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit ba52b3b624e4a1a976908552364eba924ca45430
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue May 7 12:05:58 2024 +0100

    tools/xl: Open xldevd.log with O_CLOEXEC
    
    `xl devd` has been observed leaking /var/log/xldevd.log into children.
    
    Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd, so
    after setting up stdout/stderr, it's only the logfile fd which will close on
    exec().
    
    Link: https://github.com/QubesOS/qubes-issues/issues/8292
    Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Acked-by: Anthony PERARD <anthony.perard@vates.tech>
    Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
(qemu changes not included)

