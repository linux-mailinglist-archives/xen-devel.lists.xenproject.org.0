Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A02590FBC3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 05:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744121.1151139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK8kK-0006uq-Sn; Thu, 20 Jun 2024 03:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744121.1151139; Thu, 20 Jun 2024 03:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK8kK-0006sX-Ou; Thu, 20 Jun 2024 03:46:00 +0000
Received: by outflank-mailman (input) for mailman id 744121;
 Thu, 20 Jun 2024 03:45:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8kI-0006s4-Jw; Thu, 20 Jun 2024 03:45:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8kI-0004rK-4p; Thu, 20 Jun 2024 03:45:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8kH-0008FC-RT; Thu, 20 Jun 2024 03:45:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sK8kH-0003G4-Qr; Thu, 20 Jun 2024 03:45:57 +0000
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
	bh=+Akyi2ebykoqDX5UrGj/H55qpaMFo95gBf9tbup1rek=; b=40iay0Svaqf+pLBx5dzStGKrXz
	fPga4b4n/cvOeOK4QFKHXFQlIJJ/fofTqlzvCG5KkdpzJJVuxssGPelXx6ag16J5Y/I/Ng6Vbnesi
	+q3iH8E3cREGJ5vgPD7QliJDSdGNcYdcBCPQd1/LhRnf1TRg3DORfU/8Nl1yC6/OKKgk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186413-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186413: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=e5b3efbe1ab1793bb49ae07d56d0973267e65112
X-Osstest-Versions-That:
    linux=92e5605a199efbaee59fb19e15d6cc2103a04ec2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jun 2024 03:45:57 +0000

flight 186413 linux-linus real [real]
flight 186424 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186413/
http://logs.test-lab.xenproject.org/osstest/logs/186424/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-raw       8 xen-boot                 fail REGR. vs. 186406

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 186406
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186406
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186406
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186406
 test-armhf-armhf-examine      8 reboot                       fail  like 186406
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186406
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186406
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                e5b3efbe1ab1793bb49ae07d56d0973267e65112
baseline version:
 linux                92e5605a199efbaee59fb19e15d6cc2103a04ec2

Last test of basis   186406  2024-06-19 02:45:48 Z    1 days
Testing same since   186413  2024-06-19 17:42:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Marangi <ansuelsmth@gmail.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Martin Schiller <ms@dev.tdt.de>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>

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
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
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
 test-armhf-armhf-xl-raw                                      fail    
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
commit e5b3efbe1ab1793bb49ae07d56d0973267e65112
Merge: 6785e3cc09f1 3572bd5689b0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Jun 19 10:29:49 2024 -0700

    Merge tag 'probes-fixes-v6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
    
    Pull probes fix from Masami Hiramatsu:
    
     - Restrict gen-API tests for synthetic and kprobe events to only be
       built as modules, as they generate dynamic events that cannot be
       removed, causing ftracetest and startup selftests to fail
    
    * tag 'probes-fixes-v6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace:
      tracing: Build event generation tests only as modules

commit 6785e3cc09f149c42ce70eb92736d68c0db64684
Merge: 92e5605a199e 6e5aee08bd25
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Jun 19 10:19:41 2024 -0700

    Merge tag 'mips-fixes_6.10_1' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
    
    Pull MIPS fixes from Thomas Bogendoerfer:
    
     - fix for BCM6538 boards
    
     - fix RB532 PCI workaround
    
    * tag 'mips-fixes_6.10_1' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux:
      Revert "MIPS: pci: lantiq: restore reset gpio polarity"
      mips: bmips: BCM6358: make sure CBR is correctly set
      MIPS: pci: lantiq: restore reset gpio polarity
      MIPS: Routerboard 532: Fix vendor retry check code

commit 6e5aee08bd2517397c9572243a816664f2ead547
Author: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Thu Jun 13 10:17:09 2024 +0200

    Revert "MIPS: pci: lantiq: restore reset gpio polarity"
    
    This reverts commit 277a0363120276645ae598d8d5fea7265e076ae9.
    
    While fixing old boards with broken DTs, this change will break
    newer ones with correct gpio polarity annotation.
    
    Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

commit 3572bd5689b0812b161b40279e39ca5b66d73e88
Author: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Date:   Tue Jun 11 22:30:37 2024 +0900

    tracing: Build event generation tests only as modules
    
    The kprobes and synth event generation test modules add events and lock
    (get a reference) those event file reference in module init function,
    and unlock and delete it in module exit function. This is because those
    are designed for playing as modules.
    
    If we make those modules as built-in, those events are left locked in the
    kernel, and never be removed. This causes kprobe event self-test failure
    as below.
    
    [   97.349708] ------------[ cut here ]------------
    [   97.353453] WARNING: CPU: 3 PID: 1 at kernel/trace/trace_kprobe.c:2133 kprobe_trace_self_tests_init+0x3f1/0x480
    [   97.357106] Modules linked in:
    [   97.358488] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 6.9.0-g699646734ab5-dirty #14
    [   97.361556] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
    [   97.363880] RIP: 0010:kprobe_trace_self_tests_init+0x3f1/0x480
    [   97.365538] Code: a8 24 08 82 e9 ae fd ff ff 90 0f 0b 90 48 c7 c7 e5 aa 0b 82 e9 ee fc ff ff 90 0f 0b 90 48 c7 c7 2d 61 06 82 e9 8e fd ff ff 90 <0f> 0b 90 48 c7 c7 33 0b 0c 82 89 c6 e8 6e 03 1f ff 41 ff c7 e9 90
    [   97.370429] RSP: 0000:ffffc90000013b50 EFLAGS: 00010286
    [   97.371852] RAX: 00000000fffffff0 RBX: ffff888005919c00 RCX: 0000000000000000
    [   97.373829] RDX: ffff888003f40000 RSI: ffffffff8236a598 RDI: ffff888003f40a68
    [   97.375715] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
    [   97.377675] R10: ffffffff811c9ae5 R11: ffffffff8120c4e0 R12: 0000000000000000
    [   97.379591] R13: 0000000000000001 R14: 0000000000000015 R15: 0000000000000000
    [   97.381536] FS:  0000000000000000(0000) GS:ffff88807dcc0000(0000) knlGS:0000000000000000
    [   97.383813] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   97.385449] CR2: 0000000000000000 CR3: 0000000002244000 CR4: 00000000000006b0
    [   97.387347] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
    [   97.389277] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
    [   97.391196] Call Trace:
    [   97.391967]  <TASK>
    [   97.392647]  ? __warn+0xcc/0x180
    [   97.393640]  ? kprobe_trace_self_tests_init+0x3f1/0x480
    [   97.395181]  ? report_bug+0xbd/0x150
    [   97.396234]  ? handle_bug+0x3e/0x60
    [   97.397311]  ? exc_invalid_op+0x1a/0x50
    [   97.398434]  ? asm_exc_invalid_op+0x1a/0x20
    [   97.399652]  ? trace_kprobe_is_busy+0x20/0x20
    [   97.400904]  ? tracing_reset_all_online_cpus+0x15/0x90
    [   97.402304]  ? kprobe_trace_self_tests_init+0x3f1/0x480
    [   97.403773]  ? init_kprobe_trace+0x50/0x50
    [   97.404972]  do_one_initcall+0x112/0x240
    [   97.406113]  do_initcall_level+0x95/0xb0
    [   97.407286]  ? kernel_init+0x1a/0x1a0
    [   97.408401]  do_initcalls+0x3f/0x70
    [   97.409452]  kernel_init_freeable+0x16f/0x1e0
    [   97.410662]  ? rest_init+0x1f0/0x1f0
    [   97.411738]  kernel_init+0x1a/0x1a0
    [   97.412788]  ret_from_fork+0x39/0x50
    [   97.413817]  ? rest_init+0x1f0/0x1f0
    [   97.414844]  ret_from_fork_asm+0x11/0x20
    [   97.416285]  </TASK>
    [   97.417134] irq event stamp: 13437323
    [   97.418376] hardirqs last  enabled at (13437337): [<ffffffff8110bc0c>] console_unlock+0x11c/0x150
    [   97.421285] hardirqs last disabled at (13437370): [<ffffffff8110bbf1>] console_unlock+0x101/0x150
    [   97.423838] softirqs last  enabled at (13437366): [<ffffffff8108e17f>] handle_softirqs+0x23f/0x2a0
    [   97.426450] softirqs last disabled at (13437393): [<ffffffff8108e346>] __irq_exit_rcu+0x66/0xd0
    [   97.428850] ---[ end trace 0000000000000000 ]---
    
    And also, since we can not cleanup dynamic_event file, ftracetest are
    failed too.
    
    To avoid these issues, build these tests only as modules.
    
    Link: https://lore.kernel.org/all/171811263754.85078.5877446624311852525.stgit@devnote2/
    
    Fixes: 9fe41efaca08 ("tracing: Add synth event generation test module")
    Fixes: 64836248dda2 ("tracing: Add kprobe event command generation test module")
    Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
    Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

commit ce5cdd3b05216b704a704f466fb4c2dff3778caf
Author: Christian Marangi <ansuelsmth@gmail.com>
Date:   Tue Jun 11 13:35:33 2024 +0200

    mips: bmips: BCM6358: make sure CBR is correctly set
    
    It was discovered that some device have CBR address set to 0 causing
    kernel panic when arch_sync_dma_for_cpu_all is called.
    
    This was notice in situation where the system is booted from TP1 and
    BMIPS_GET_CBR() returns 0 instead of a valid address and
    !!(read_c0_brcm_cmt_local() & (1 << 31)); not failing.
    
    The current check whether RAC flush should be disabled or not are not
    enough hence lets check if CBR is a valid address or not.
    
    Fixes: ab327f8acdf8 ("mips: bmips: BCM6358: disable RAC flush for TP1")
    Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
    Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
    Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

commit 277a0363120276645ae598d8d5fea7265e076ae9
Author: Martin Schiller <ms@dev.tdt.de>
Date:   Fri Jun 7 11:04:00 2024 +0200

    MIPS: pci: lantiq: restore reset gpio polarity
    
    Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API") not
    only switched to the gpiod API, but also inverted / changed the polarity
    of the GPIO.
    
    According to the PCI specification, the RST# pin is an active-low
    signal. However, most of the device trees that have been widely used for
    a long time (mainly in the openWrt project) define this GPIO as
    active-high and the old driver code inverted the signal internally.
    
    Apparently there are actually boards where the reset gpio must be
    operated inverted. For this reason, we cannot use the GPIOD_OUT_LOW/HIGH
    flag for initialization. Instead, we must explicitly set the gpio to
    value 1 in order to take into account any "GPIO_ACTIVE_LOW" flag that
    may have been set.
    
    In order to remain compatible with all these existing device trees, we
    should therefore keep the logic as it was before the commit.
    
    Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
    Cc: stable@vger.kernel.org
    Signed-off-by: Martin Schiller <ms@dev.tdt.de>
    Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

commit ae9daffd9028f2500c9ac1517e46d4f2b57efb80
Author: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Date:   Wed May 8 15:07:00 2024 +0300

    MIPS: Routerboard 532: Fix vendor retry check code
    
    read_config_dword() contains strange condition checking ret for a
    number of values. The ret variable, however, is always zero because
    config_access() never returns anything else. Thus, the retry is always
    taken until number of tries is exceeded.
    
    The code looks like it wants to check *val instead of ret to see if the
    read gave an error response.
    
    Fixes: 73b4390fb234 ("[MIPS] Routerboard 532: Support for base system")
    Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

