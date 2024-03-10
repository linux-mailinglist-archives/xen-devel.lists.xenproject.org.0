Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6D87753F
	for <lists+xen-devel@lfdr.de>; Sun, 10 Mar 2024 04:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691049.1076808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjAHq-0007SD-E5; Sun, 10 Mar 2024 03:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691049.1076808; Sun, 10 Mar 2024 03:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjAHq-0007Qg-At; Sun, 10 Mar 2024 03:55:46 +0000
Received: by outflank-mailman (input) for mailman id 691049;
 Sun, 10 Mar 2024 03:55:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rjAHp-0007QU-Bo; Sun, 10 Mar 2024 03:55:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rjAHp-0002wD-7q; Sun, 10 Mar 2024 03:55:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rjAHo-00032A-Tj; Sun, 10 Mar 2024 03:55:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rjAHo-0002B8-TM; Sun, 10 Mar 2024 03:55:44 +0000
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
	bh=XpZV5XSuJHUaAdSn2vFmR8108j+yLpChvLHHGA07hc0=; b=IxAdlOgLiVDZmG0tB6eCWqDMW9
	RRxyZwf18oWfAkPQBUrhkzPD22fJoW20oBC/cjnJf27L2rKe2gMsUDYxjgyIq5Zeyt9WTUsDS/NoI
	jJa2+pMofLDocuMQ251tzme3J7Dq9QWjMTg9ciHdQFHdCRGZj+XmRb2n9+SdWO/Dc57k=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184982-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184982: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=005f6f34bd47eaa61d939a2727fc648e687b84c1
X-Osstest-Versions-That:
    linux=09e5c48fea173b72f1c763776136eeb379b1bc47
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Mar 2024 03:55:44 +0000

flight 184982 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184982/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 184971

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184971
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184971
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184971
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184971
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184971
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184971
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail like 184971
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184971
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184971
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                005f6f34bd47eaa61d939a2727fc648e687b84c1
baseline version:
 linux                09e5c48fea173b72f1c763776136eeb379b1bc47

Last test of basis   184971  2024-03-09 06:52:06 Z    0 days
Testing same since   184982  2024-03-09 19:42:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andi Shyti <andi.shyti@kernel.org>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Edmund Raile <edmund.raile@proton.me>
  Heiner Kallweit <hkallweit1@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tommy Huang <tommy_huang@aspeedtech.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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
commit 005f6f34bd47eaa61d939a2727fc648e687b84c1
Merge: 66695e7d94fc ac168d6770aa
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Mar 9 10:32:03 2024 -0800

    Merge tag 'i2c-for-6.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
    
    Pull i2c fixes from Wolfram Sang:
     "Two patches from Heiner for the i801 are targeting muxes discovered
      while working on some other features. Essentially, there is a
      reordering when adding optional slaves and proper cleanup upon
      registering a mux device.
    
      Christophe fixes the exit path in the wmt driver that was leaving the
      clocks hanging, and the last fix from Tommy avoids false error reports
      in IRQ"
    
    * tag 'i2c-for-6.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux:
      i2c: aspeed: Fix the dummy irq expected print
      i2c: wmt: Fix an error handling path in wmt_i2c_probe()
      i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
      i2c: i801: Fix using mux_pdev before it's set

commit 66695e7d94fc499f26411044e07cc1386e4f3aa7
Merge: 09e5c48fea17 575801663c7d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Mar 9 10:25:14 2024 -0800

    Merge tag 'firewire-fixes-6.8-final' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
    
    Pull firewire fix from Takashi Sakamoto:
     "A fix to suppress a warning about unreleased IRQ for 1394 OHCI
      hardware when disabling MSI.
    
      In Linux kernel v6.5, a PCI driver for 1394 OHCI hardware was
      optimized into the managed device resources. Edmund Raile points out
      that the change brings the warning about unreleased IRQ at the call of
      pci_disable_msi(), since the API expects that the relevant IRQ has
      already been released in advance.
    
      As long as the API is called in .remove callback of PCI device
      operation, it is prohibited to maintain the IRQ as the part of managed
      device resource. As a workaround, the IRQ is explicitly released at
      .remove callback, before the call of pci_disable_msi().
    
      pci_disable_msi() is legacy API nowadays in PCI MSI implementation. I
      have a plan to replace it with the modern API in the development for
      the future version of Linux kernel. So at present I keep them as is"
    
    * tag 'firewire-fixes-6.8-final' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394:
      firewire: ohci: prevent leak of left-over IRQ on unbind

commit ac168d6770aa12ee201c7474e1361810d5fc723a
Author: Tommy Huang <tommy_huang@aspeedtech.com>
Date:   Tue Mar 5 09:19:06 2024 +0800

    i2c: aspeed: Fix the dummy irq expected print
    
    When the i2c error condition occurred and master state was not
    idle, the master irq function will goto complete state without any
    other interrupt handling. It would cause dummy irq expected print.
    Under this condition, assign the irq_status into irq_handle.
    
    For example, when the abnormal start / stop occurred (bit 5) with
    normal stop status (bit 4) at same time. Then the normal stop status
    would not be handled and it would cause irq expected print in
    the aspeed_i2c_bus_irq.
    
    ...
    aspeed-i2c-bus x. i2c-bus: irq handled != irq.
    Expected 0x00000030, but was 0x00000020
    ...
    
    Fixes: 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events properly")
    Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
    Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
    Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

commit 97fd62e3269d2d47cefd421ffe144f9eafab8315
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date:   Fri Jan 5 15:39:35 2024 +0100

    i2c: wmt: Fix an error handling path in wmt_i2c_probe()
    
    wmt_i2c_reset_hardware() calls clk_prepare_enable(). So, should an error
    occur after it, it should be undone by a corresponding
    clk_disable_unprepare() call, as already done in the remove function.
    
    Fixes: 560746eb79d3 ("i2c: vt8500: Add support for I2C bus on Wondermedia SoCs")
    Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
    Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

commit ceb013b2d9a2946035de5e1827624edc85ae9484
Author: Heiner Kallweit <hkallweit1@gmail.com>
Date:   Mon Mar 4 21:31:06 2024 +0100

    i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
    
    If registering the platform device fails, the lookup table is
    removed in the error path. On module removal we would try to
    remove the lookup table again. Fix this by setting priv->lookup
    only if registering the platform device was successful.
    In addition free the memory allocated for the lookup table in
    the error path.
    
    Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
    Cc: stable@vger.kernel.org
    Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
    Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
    Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
    Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

commit 09f02902eb9cd41d4b88f4a5b93696297b57a3b0
Author: Heiner Kallweit <hkallweit1@gmail.com>
Date:   Sun Mar 3 11:45:22 2024 +0100

    i2c: i801: Fix using mux_pdev before it's set
    
    i801_probe_optional_slaves() is called before i801_add_mux().
    This results in mux_pdev being checked before it's set by
    i801_add_mux(). Fix this by changing the order of the calls.
    I consider this safe as I see no dependencies.
    
    Fixes: 80e56b86b59e ("i2c: i801: Simplify class-based client device instantiation")
    Cc: stable@vger.kernel.org
    Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
    Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
    Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

commit 575801663c7dc38f826212b39e3b91a4a8661c33
Author: Edmund Raile <edmund.raile@proton.me>
Date:   Thu Feb 29 14:47:59 2024 +0000

    firewire: ohci: prevent leak of left-over IRQ on unbind
    
    Commit 5a95f1ded28691e6 ("firewire: ohci: use devres for requested IRQ")
    also removed the call to free_irq() in pci_remove(), leading to a
    leftover irq of devm_request_irq() at pci_disable_msi() in pci_remove()
    when unbinding the driver from the device
    
    remove_proc_entry: removing non-empty directory 'irq/136', leaking at
    least 'firewire_ohci'
    Call Trace:
     ? remove_proc_entry+0x19c/0x1c0
     ? __warn+0x81/0x130
     ? remove_proc_entry+0x19c/0x1c0
     ? report_bug+0x171/0x1a0
     ? console_unlock+0x78/0x120
     ? handle_bug+0x3c/0x80
     ? exc_invalid_op+0x17/0x70
     ? asm_exc_invalid_op+0x1a/0x20
     ? remove_proc_entry+0x19c/0x1c0
     unregister_irq_proc+0xf4/0x120
     free_desc+0x3d/0xe0
     ? kfree+0x29f/0x2f0
     irq_free_descs+0x47/0x70
     msi_domain_free_locked.part.0+0x19d/0x1d0
     msi_domain_free_irqs_all_locked+0x81/0xc0
     pci_free_msi_irqs+0x12/0x40
     pci_disable_msi+0x4c/0x60
     pci_remove+0x9d/0xc0 [firewire_ohci
         01b483699bebf9cb07a3d69df0aa2bee71db1b26]
     pci_device_remove+0x37/0xa0
     device_release_driver_internal+0x19f/0x200
     unbind_store+0xa1/0xb0
    
    remove irq with devm_free_irq() before pci_disable_msi()
    also remove it in fail_msi: of pci_probe() as this would lead to
    an identical leak
    
    Cc: stable@vger.kernel.org
    Fixes: 5a95f1ded28691e6 ("firewire: ohci: use devres for requested IRQ")
    Signed-off-by: Edmund Raile <edmund.raile@proton.me>
    Link: https://lore.kernel.org/r/20240229144723.13047-2-edmund.raile@proton.me
    Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

