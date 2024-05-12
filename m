Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569B8C3955
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 01:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720653.1123573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Igt-0003nm-Oz; Sun, 12 May 2024 23:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720653.1123573; Sun, 12 May 2024 23:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Igt-0003mF-LG; Sun, 12 May 2024 23:33:15 +0000
Received: by outflank-mailman (input) for mailman id 720653;
 Sun, 12 May 2024 23:33:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6Igs-0003m5-Go; Sun, 12 May 2024 23:33:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6Igs-0005gH-Bv; Sun, 12 May 2024 23:33:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6Igr-0007rT-Vr; Sun, 12 May 2024 23:33:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s6Igr-0001q6-VC; Sun, 12 May 2024 23:33:13 +0000
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
	bh=LuwCgcVHHGYDHk7FFmeHqZuzPKirqq/IQ1Tjrytsn2c=; b=K8khiEf50lQRBfpFiX0Xhzedwz
	uHHjorSwakJa/Ib65SuoAcwwf+j3jB8UJ8s5rZ9uXlUpRtJ4QwD8hYuPBCYdtPk30yg7cC9yxdksF
	kieSX91ziVBGVwWU3reW1UTd53kPnFBLwJ9nx2YRKuAj6BWPerUEuTgOUyv00WOsdJhg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185984-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185984: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start/freebsd.repeat:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:host-ping-check-native:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ba16c1cf11c9f264b5455cb7d57267b39925409a
X-Osstest-Versions-That:
    linux=cf87f46fd34d6c19283d9625a7822f20d90b64a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 May 2024 23:33:13 +0000

flight 185984 linux-linus real [real]
flight 185985 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185984/
http://logs.test-lab.xenproject.org/osstest/logs/185985/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-freebsd12-amd64 21 guest-start/freebsd.repeat fail in 185985 REGR. vs. 185982
 test-armhf-armhf-xl           8 xen-boot       fail in 185985 REGR. vs. 185982

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-freebsd12-amd64 19 guest-localmigrate/x10 fail pass in 185985-retest
 test-armhf-armhf-xl        6 host-ping-check-native fail pass in 185985-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 185982

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 185977
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185977
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185982
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185982
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185982
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 185982
 test-armhf-armhf-examine      8 reboot                       fail  like 185982
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185982
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185982
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ba16c1cf11c9f264b5455cb7d57267b39925409a
baseline version:
 linux                cf87f46fd34d6c19283d9625a7822f20d90b64a4

Last test of basis   185982  2024-05-11 16:13:39 Z    1 days
Testing same since   185984  2024-05-12 16:44:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Borislav Petkov (AMD) <bp@alien8.de>
  Linus Torvalds <torvalds@linux-foundation.org>
  Serge Semin <fancer.lancer@gmail.com>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Thomas Gleixner <tglx@linutronix.de>
  Yuezhang Mo <Yuezhang.Mo@sony.com>

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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
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
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
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
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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
commit ba16c1cf11c9f264b5455cb7d57267b39925409a
Merge: 775a0eca3357 591c946675d8
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun May 12 09:09:27 2024 -0700

    Merge tag 'edac_urgent_for_v6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras
    
    Pull EDAC fix from Borislav Petkov:
    
     - Fix a race condition when clearing error count bits and toggling the
       error interrupt throug the same register, in synopsys_edac
    
    * tag 'edac_urgent_for_v6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras:
      EDAC/synopsys: Fix ECC status and IRQ control race condition

commit 775a0eca3357d79311c0225458f8fe90791a8857
Merge: cf87f46fd34d 5754ace3c319
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun May 12 08:54:28 2024 -0700

    Merge tag 'x86_urgent_for_v6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
    
    Pull x86 fixes from Borislav Petkov:
    
     - Add a new PCI ID which belongs to a new AMD CPU family 0x1a
    
     - Ensure that that last level cache ID is set in all cases, in the AMD
       CPU topology parsing code, in order to prevent invalid scheduling
       domain CPU masks
    
    * tag 'x86_urgent_for_v6.9' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip:
      x86/topology/amd: Ensure that LLC ID is initialized
      x86/amd_nb: Add new PCI IDs for AMD family 0x1a

commit 5754ace3c3199c162dcee1f3f87a538c46d1c832
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Wed May 8 21:53:47 2024 +0200

    x86/topology/amd: Ensure that LLC ID is initialized
    
    The original topology evaluation code initialized cpu_data::topo::llc_id
    with the die ID initialy and then eventually overwrite it with information
    gathered from a CPUID leaf.
    
    The conversion analysis failed to spot that particular detail and omitted
    this initial assignment under the assumption that each topology evaluation
    path will set it up. That assumption is mostly correct, but turns out to be
    wrong in case that the CPUID leaf 0x80000006 does not provide a LLC ID.
    
    In that case, LLC ID is invalid and as a consequence the setup of the
    scheduling domain CPU masks is incorrect which subsequently causes the
    scheduler core to complain about it during CPU hotplug:
    
      BUG: arch topology borken
           the CLS domain not a subset of the MC domain
    
    Cure it by reusing legacy_set_llc() and assigning the die ID if the LLC ID
    is invalid after all possible parsers have been tried.
    
    Fixes: f7fb3b2dd92c ("x86/cpu: Provide an AMD/HYGON specific topology parser")
    Reported-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Tested-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
    Link: https://lore.kernel.org/r/PUZPR04MB63168AC442C12627E827368581292@PUZPR04MB6316.apcprd04.prod.outlook.com

commit 0e640f0a47d8426eab1fb9c03f0af898dfe810b8
Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Date:   Fri May 10 16:48:28 2024 +0530

    x86/amd_nb: Add new PCI IDs for AMD family 0x1a
    
    Add the new PCI Device IDs to the MISC IDs list to support new
    generation of AMD 1Ah family 70h Models of processors.
    
      [ bp: Massage commit message. ]
    
    Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Link: https://lore.kernel.org/r/20240510111829.969501-1-Shyam-sundar.S-k@amd.com

commit 591c946675d88dcc0ae9ff54be9d5caaee8ce1e3
Author: Serge Semin <fancer.lancer@gmail.com>
Date:   Thu Feb 22 21:12:46 2024 +0300

    EDAC/synopsys: Fix ECC status and IRQ control race condition
    
    The race condition around the ECCCLR register access happens in the IRQ
    disable method called in the device remove() procedure and in the ECC IRQ
    handler:
    
      1. Enable IRQ:
         a. ECCCLR = EN_CE | EN_UE
      2. Disable IRQ:
         a. ECCCLR = 0
      3. IRQ handler:
         a. ECCCLR = CLR_CE | CLR_CE_CNT | CLR_CE | CLR_CE_CNT
         b. ECCCLR = 0
         c. ECCCLR = EN_CE | EN_UE
    
    So if the IRQ disabling procedure is called concurrently with the IRQ
    handler method the IRQ might be actually left enabled due to the
    statement 3c.
    
    The root cause of the problem is that ECCCLR register (which since
    v3.10a has been called as ECCCTL) has intermixed ECC status data clear
    flags and the IRQ enable/disable flags. Thus the IRQ disabling (clear EN
    flags) and handling (write 1 to clear ECC status data) procedures must
    be serialised around the ECCCTL register modification to prevent the
    race.
    
    So fix the problem described above by adding the spin-lock around the
    ECCCLR modifications and preventing the IRQ-handler from modifying the
    IRQs enable flags (there is no point in disabling the IRQ and then
    re-enabling it again within a single IRQ handler call, see the
    statements 3a/3b and 3c above).
    
    Fixes: f7824ded4149 ("EDAC/synopsys: Add support for version 3 of the Synopsys EDAC DDR")
    Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Link: https://lore.kernel.org/r/20240222181324.28242-2-fancer.lancer@gmail.com

