Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC879A4B18
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 05:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822320.1236312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1zzF-00050n-NX; Sat, 19 Oct 2024 03:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822320.1236312; Sat, 19 Oct 2024 03:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1zzF-0004y6-KA; Sat, 19 Oct 2024 03:18:41 +0000
Received: by outflank-mailman (input) for mailman id 822320;
 Sat, 19 Oct 2024 03:18:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1zzE-0004xv-LR; Sat, 19 Oct 2024 03:18:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1zzE-0003LH-H7; Sat, 19 Oct 2024 03:18:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1zzE-0007ys-0o; Sat, 19 Oct 2024 03:18:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1zzE-0007mC-0O; Sat, 19 Oct 2024 03:18:40 +0000
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
	bh=Im+ej3U68LsSeaR8d+n8Kz0z5iJGCS2mHh+w7gVndws=; b=vpSveZbaDCLdQb3ktMX/ZdGWZo
	ZBH2DoCynzHdnAf9mf1pslUXKzkQV2ZIMhGNBtOfxqclYE/OZstGg74yaoGSkqmnJFDDVYtodX3G+
	jsUKDYclWlP5v19292azbq1MalgRU4YuSH8BonDcCwyNQkzGocyNYE6QzbMetsR4IGTU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188248-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 188248: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a285d2ac2e524c808091062c67142cf5924b56f6
X-Osstest-Versions-That:
    xen=47990ecef286606794d607d4ca8703d71c98d659
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 19 Oct 2024 03:18:40 +0000

flight 188248 xen-unstable real [real]
flight 188280 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/188248/
http://logs.test-lab.xenproject.org/osstest/logs/188280/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 188153

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt   16 saverestore-support-check fail blocked in 188153
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 188153
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 188153
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a285d2ac2e524c808091062c67142cf5924b56f6
baseline version:
 xen                  47990ecef286606794d607d4ca8703d71c98d659

Last test of basis   188153  2024-10-17 07:28:21 Z    1 days
Failing since        188193  2024-10-17 18:11:18 Z    1 days    2 attempts
Testing same since   188248  2024-10-18 11:35:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christopher Clark <christopher.w.clark@gmail.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@amd.com>
  Stewart Hildebrand <stewart.hildebrand@amd.com>

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
 test-amd64-amd64-xl-pvshim                                   fail    
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
commit a285d2ac2e524c808091062c67142cf5924b56f6
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Thu Oct 17 13:02:44 2024 -0400

    x86/boot: move mmap info to boot info
    
    Transition the memory map info to be held in struct boot_info.
    
    No functional change intended.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 29aaded97dacd3120842aeeafa91a4a8e6d45180
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Thu Oct 17 13:02:43 2024 -0400

    x86/boot: move cmdline to boot info
    
    Transition Xen's command line to being held in struct boot_info.
    
    No functional change intended.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b438c5fbf4c02145f6ecc8642290d46bf1957388
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Thu Oct 17 13:02:42 2024 -0400

    x86/boot: move boot loader name to boot info
    
    Transition the incoming boot loader name to be held in struct boot_info.
    
    No functional change intended.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 038826b61e852469b1a54690dba6d142aceb1f20
Author: Christopher Clark <christopher.w.clark@gmail.com>
Date:   Thu Oct 17 13:02:41 2024 -0400

    x86/boot: move x86 boot module counting into a new boot_info struct
    
    An initial step towards a non-multiboot internal representation of boot
    modules for common code, starting with x86 setup and converting the fields
    that are accessed for the startup calculations.
    
    Introduce a new header, <asm/bootinfo.h>, and populate it with a new boot_info
    structure initially containing a count of the number of boot modules.
    
    No functional change intended.
    
    Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 081683ea578da56dd20b9dc22a64d03c893b47ba
Author: Stewart Hildebrand <stewart.hildebrand@amd.com>
Date:   Fri Oct 11 17:19:56 2024 -0400

    xen/arm: dom0less: cope with missing /gic phandle
    
    If a partial DT has a /gic node, but no references to it, dtc may omit
    the phandle property. With the phandle property missing,
    fdt_get_phandle() returns 0, leading Xen to generate a malformed domU
    dtb due to invalid interrupt-parent phandle references. 0 is an invalid
    phandle value. Add a zero check, and fall back to GUEST_PHANDLE_GIC.
    
    Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 1e81d2df4f48f37d2086bc75199c75ca93cace92
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Thu Oct 10 12:57:46 2024 +0200

    device-tree: Move dt-overlay.c to common/device-tree/
    
    The code is DT specific and as such should be placed under common
    directory for DT related files. Update MAINTAINERS file accordingly
    and drop the line with a path from a top-level comment in dt-overlay.c.
    It serves no purpose and requires being updated on every code movement.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit b3ca3caaf36efa3eaea0cce909f75e12b0fb6a1d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Oct 17 14:14:51 2024 +0200

    x86emul/test: drop Xeon Phi S/G prefetch special case
    
    Another leftover from the dropping of Xeon Phi support.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 09d22fe15cb11254d06413d15fd578093d7fe062
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Oct 17 14:14:31 2024 +0200

    x86emul/test: correct loop body indentation in evex-disp8.c:test_one()
    
    For some reason I entirely consistently screwed these up.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

commit 330d4e62508defa708b55f1b612f42b6a2e2842b
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Oct 17 14:13:50 2024 +0200

    docs: update documentation of reboot param
    
    Reflect changed default mode, and fix formatting of `efi` value.
    
    Fixes: d81dd3130351 ("x86/shutdown: change default reboot method preference")
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

