Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896054E1C10
	for <lists+xen-devel@lfdr.de>; Sun, 20 Mar 2022 15:44:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292610.496919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVwmS-0000cs-LL; Sun, 20 Mar 2022 14:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292610.496919; Sun, 20 Mar 2022 14:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVwmS-0000aZ-ID; Sun, 20 Mar 2022 14:43:40 +0000
Received: by outflank-mailman (input) for mailman id 292610;
 Sun, 20 Mar 2022 14:43:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nVwmQ-0000aP-PB; Sun, 20 Mar 2022 14:43:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nVwmQ-0000fc-GL; Sun, 20 Mar 2022 14:43:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nVwmQ-0000B4-14; Sun, 20 Mar 2022 14:43:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nVwmQ-00064a-0c; Sun, 20 Mar 2022 14:43:38 +0000
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
	bh=qRetU9+Ie3xQmFPjQPeblEfoIbtwA1ztEnk0NY+I8R8=; b=6TuQYxm/L9CJCmD49r4h8EkZKr
	l8mYe6qbhqIHUYAae8pj802FORG2efK1rORplQGVHzqwPiabxWV8wt4xZpl6Q6UXgWayNO/Tq7hm5
	CDGeC09Wd58DhM4JjRnsF7K5IdYXMAgqqVuYDa4t1c1MQvNlttMGtl7CJJx8ELf1mJys=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168718-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168718: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-shadow:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=14702b3b2438e2f2d07ae93b5d695c166e5c83d1
X-Osstest-Versions-That:
    linux=97e9c8eb4bb1dc57859acb1338dfddbd967d7484
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Mar 2022 14:43:38 +0000

flight 168718 linux-linus real [real]
flight 168724 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/168718/
http://logs.test-lab.xenproject.org/osstest/logs/168724/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-shadow  22 guest-start/debian.repeat fail REGR. vs. 168711

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168711
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168711
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168711
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168711
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168711
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168711
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168711
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168711
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                14702b3b2438e2f2d07ae93b5d695c166e5c83d1
baseline version:
 linux                97e9c8eb4bb1dc57859acb1338dfddbd967d7484

Last test of basis   168711  2022-03-19 19:41:05 Z    0 days
Testing same since   168718  2022-03-20 03:54:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Arnd Bergmann <arnd@arndb.de>
  David Jeffery <djeffery@redhat.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Marc Zyngier <maz@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Matt Lupfer <mlupfer@ddn.com>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>

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
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
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
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
commit 14702b3b2438e2f2d07ae93b5d695c166e5c83d1
Merge: f76da4d5ad51 1447c635802f
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Mar 19 16:36:32 2022 -0700

    Merge tag 'soc-fixes-5.17-4' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
    
    Pull ARM SoC fix from Arnd Bergmann:
     "Here is one last regression fix for 5.17, reverting a patch that went
      into 5.16 as a cleanup that ended up breaking external interrupts on
      Layerscape chips.
    
      The revert makes it work again, but also reintroduces a build time
      warning about the nonstandard DT binding that will have to be dealt
      with in the future"
    
    * tag 'soc-fixes-5.17-4' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc:
      Revert "arm64: dts: freescale: Fix 'interrupt-map' parent address cells"

commit f76da4d5ad5168de58f0f5be1a12c1052a614663
Merge: 97e9c8eb4bb1 733ab7e1b5d1
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Mar 19 15:56:43 2022 -0700

    Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
    
    Pull SCSI fixes from James Bottomley:
     "Two small(ish) fixes, both in drivers"
    
    * tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi:
      scsi: fnic: Finish scsi_cmnd before dropping the spinlock
      scsi: mpt3sas: Page fault in reply q processing

commit 1447c635802fd0f5e213ad5277753108d56a4db3
Author: Vladimir Oltean <vladimir.oltean@nxp.com>
Date:   Tue Dec 14 15:58:52 2021 +0200

    Revert "arm64: dts: freescale: Fix 'interrupt-map' parent address cells"
    
    This reverts commit 869f0ec048dc8fd88c0b2003373bd985795179fb. That
    updated the expected device tree binding format for the ls-extirq
    driver, without also updating the parsing code (ls_extirq_parse_map)
    to the new format.
    
    The context is that the ls-extirq driver uses the standard
    "interrupt-map" OF property in a non-standard way, as suggested by
    Rob Herring during review:
    https://lore.kernel.org/lkml/20190927161118.GA19333@bogus/
    
    This has turned out to be problematic, as Marc Zyngier discovered
    through commit 041284181226 ("of/irq: Allow matching of an interrupt-map
    local to an interrupt controller"), later fixed through commit
    de4adddcbcc2 ("of/irq: Add a quirk for controllers with their own
    definition of interrupt-map"). Marc's position, expressed on multiple
    opportunities, is that:
    
    (a) [ making private use of the reserved "interrupt-map" name in a
        driver ] "is wrong, by the very letter of what an interrupt-map
        means. If the interrupt map points to an interrupt controller,
        that's the target for the interrupt."
    https://lore.kernel.org/lkml/87k0g8jlmg.wl-maz@kernel.org/
    
    (b) [ updating the driver's bindings to accept a non-reserved name for
        this property, as an alternative, is ] "is totally pointless. These
        machines have been in the wild for years, and existing DTs will be
        there *forever*."
    https://lore.kernel.org/lkml/87ilvrk1r0.wl-maz@kernel.org/
    
    Considering the above, the Linux kernel has quirks in place to deal with
    the ls-extirq's non-standard use of the "interrupt-map". These quirks
    may be needed in other operating systems that consume this device tree,
    yet this is seen as the only viable solution.
    
    Therefore, the premise of the patch being reverted here is invalid.
    It doesn't matter whether the driver, in its non-standard use of the
    property, complies to the standard format or not, since this property
    isn't expected to be used for interrupt translation by the core.
    
    This change restores LS1088A, LS2088A/LS2085A and LX2160A to their
    previous bindings, which allows these systems to continue to use
    external interrupt lines with the correct polarity.
    
    Fixes: 869f0ec048dc ("arm64: dts: freescale: Fix 'interrupt-map' parent address cells")
    Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
    Acked-by: Marc Zyngier <maz@kernel.org>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

commit 733ab7e1b5d1041204c4ca7373f6e6f9d08e3283
Author: David Jeffery <djeffery@redhat.com>
Date:   Fri Mar 11 13:43:59 2022 -0500

    scsi: fnic: Finish scsi_cmnd before dropping the spinlock
    
    When aborting a SCSI command through fnic, there is a race with the fnic
    interrupt handler which can result in the SCSI command and its request
    being completed twice. If the interrupt handler claims the command by
    setting CMD_SP to NULL first, the abort handler assumes the interrupt
    handler has completed the command and returns SUCCESS, causing the request
    for the scsi_cmnd to be re-queued.
    
    But the interrupt handler may not have finished the command yet. After it
    drops the spinlock protecting CMD_SP, it does memory cleanup before finally
    calling scsi_done() to complete the scsi_cmnd. If the call to scsi_done
    occurs after the abort handler finishes and re-queues the request, the
    completion of the scsi_cmnd will advance and try to double complete a
    request already queued for retry.
    
    This patch fixes the issue by moving scsi_done() and any other use of
    scsi_cmnd to before the spinlock is released by the interrupt handler.
    
    Link: https://lore.kernel.org/r/20220311184359.2345319-1-djeffery@redhat.com
    Reviewed-by: Laurence Oberman <loberman@redhat.com>
    Reviewed-by: Ming Lei <ming.lei@redhat.com>
    Signed-off-by: David Jeffery <djeffery@redhat.com>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

commit 69ad4ef868c1fc7609daa235dfa46d28ba7a3ba3
Author: Matt Lupfer <mlupfer@ddn.com>
Date:   Tue Mar 8 15:27:02 2022 +0000

    scsi: mpt3sas: Page fault in reply q processing
    
    A page fault was encountered in mpt3sas on a LUN reset error path:
    
    [  145.763216] mpt3sas_cm1: Task abort tm failed: handle(0x0002),timeout(30) tr_method(0x0) smid(3) msix_index(0)
    [  145.778932] scsi 1:0:0:0: task abort: FAILED scmd(0x0000000024ba29a2)
    [  145.817307] scsi 1:0:0:0: attempting device reset! scmd(0x0000000024ba29a2)
    [  145.827253] scsi 1:0:0:0: [sg1] tag#2 CDB: Receive Diagnostic 1c 01 01 ff fc 00
    [  145.837617] scsi target1:0:0: handle(0x0002), sas_address(0x500605b0000272b9), phy(0)
    [  145.848598] scsi target1:0:0: enclosure logical id(0x500605b0000272b8), slot(0)
    [  149.858378] mpt3sas_cm1: Poll ReplyDescriptor queues for completion of smid(0), task_type(0x05), handle(0x0002)
    [  149.875202] BUG: unable to handle page fault for address: 00000007fffc445d
    [  149.885617] #PF: supervisor read access in kernel mode
    [  149.894346] #PF: error_code(0x0000) - not-present page
    [  149.903123] PGD 0 P4D 0
    [  149.909387] Oops: 0000 [#1] PREEMPT SMP NOPTI
    [  149.917417] CPU: 24 PID: 3512 Comm: scsi_eh_1 Kdump: loaded Tainted: G S         O      5.10.89-altav-1 #1
    [  149.934327] Hardware name: DDN           200NVX2             /200NVX2-MB          , BIOS ATHG2.2.02.01 09/10/2021
    [  149.951871] RIP: 0010:_base_process_reply_queue+0x4b/0x900 [mpt3sas]
    [  149.961889] Code: 0f 84 22 02 00 00 8d 48 01 49 89 fd 48 8d 57 38 f0 0f b1 4f 38 0f 85 d8 01 00 00 49 8b 45 10 45 31 e4 41 8b 55 0c 48 8d 1c d0 <0f> b6 03 83 e0 0f 3c 0f 0f 85 a2 00 00 00 e9 e6 01 00 00 0f b7 ee
    [  149.991952] RSP: 0018:ffffc9000f1ebcb8 EFLAGS: 00010246
    [  150.000937] RAX: 0000000000000055 RBX: 00000007fffc445d RCX: 000000002548f071
    [  150.011841] RDX: 00000000ffff8881 RSI: 0000000000000001 RDI: ffff888125ed50d8
    [  150.022670] RBP: 0000000000000000 R08: 0000000000000000 R09: c0000000ffff7fff
    [  150.033445] R10: ffffc9000f1ebb68 R11: ffffc9000f1ebb60 R12: 0000000000000000
    [  150.044204] R13: ffff888125ed50d8 R14: 0000000000000080 R15: 34cdc00034cdea80
    [  150.054963] FS:  0000000000000000(0000) GS:ffff88dfaf200000(0000) knlGS:0000000000000000
    [  150.066715] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  150.076078] CR2: 00000007fffc445d CR3: 000000012448a006 CR4: 0000000000770ee0
    [  150.086887] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
    [  150.097670] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
    [  150.108323] PKRU: 55555554
    [  150.114690] Call Trace:
    [  150.120497]  ? printk+0x48/0x4a
    [  150.127049]  mpt3sas_scsih_issue_tm.cold.114+0x2e/0x2b3 [mpt3sas]
    [  150.136453]  mpt3sas_scsih_issue_locked_tm+0x86/0xb0 [mpt3sas]
    [  150.145759]  scsih_dev_reset+0xea/0x300 [mpt3sas]
    [  150.153891]  scsi_eh_ready_devs+0x541/0x9e0 [scsi_mod]
    [  150.162206]  ? __scsi_host_match+0x20/0x20 [scsi_mod]
    [  150.170406]  ? scsi_try_target_reset+0x90/0x90 [scsi_mod]
    [  150.178925]  ? blk_mq_tagset_busy_iter+0x45/0x60
    [  150.186638]  ? scsi_try_target_reset+0x90/0x90 [scsi_mod]
    [  150.195087]  scsi_error_handler+0x3a5/0x4a0 [scsi_mod]
    [  150.203206]  ? __schedule+0x1e9/0x610
    [  150.209783]  ? scsi_eh_get_sense+0x210/0x210 [scsi_mod]
    [  150.217924]  kthread+0x12e/0x150
    [  150.224041]  ? kthread_worker_fn+0x130/0x130
    [  150.231206]  ret_from_fork+0x1f/0x30
    
    This is caused by mpt3sas_base_sync_reply_irqs() using an invalid reply_q
    pointer outside of the list_for_each_entry() loop. At the end of the full
    list traversal the pointer is invalid.
    
    Move the _base_process_reply_queue() call inside of the loop.
    
    Link: https://lore.kernel.org/r/d625deae-a958-0ace-2ba3-0888dd0a415b@ddn.com
    Fixes: 711a923c14d9 ("scsi: mpt3sas: Postprocessing of target and LUN reset")
    Cc: stable@vger.kernel.org
    Acked-by: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
    Signed-off-by: Matt Lupfer <mlupfer@ddn.com>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

