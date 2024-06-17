Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD590AEA4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742261.1149020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJC2M-0006c3-Bt; Mon, 17 Jun 2024 13:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742261.1149020; Mon, 17 Jun 2024 13:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJC2M-0006ZW-8c; Mon, 17 Jun 2024 13:04:42 +0000
Received: by outflank-mailman (input) for mailman id 742261;
 Mon, 17 Jun 2024 13:04:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJC2L-0006ZM-3v; Mon, 17 Jun 2024 13:04:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJC2K-0006ju-Ma; Mon, 17 Jun 2024 13:04:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJC2K-0000i9-As; Mon, 17 Jun 2024 13:04:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJC2K-0003Kd-AM; Mon, 17 Jun 2024 13:04:40 +0000
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
	bh=7FxdBd7m5UQjr/hapXaVXzVgvEb4J6qdt1PksCJ7xqk=; b=HQlEAqjMPDAhqULfYrNOnlp7ll
	2CxuKTjsyuZOa3MaA3HzhakPDiXazDs2NMHXKXJ0pvHl2d+NNynCw2kC34q72rQmnriluAGQ6Xui5
	vqBXfd1WPT79MrE/owXwivOU8E7dfSRFaveBC5C5fBk3u2SY31k6PK5rIc77uG7BEf1g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186377-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186377: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6ba59ff4227927d3a8530fc2973b80e94b54d58f
X-Osstest-Versions-That:
    linux=b5beaa44747bddbabb338377340244f56465cd7d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Jun 2024 13:04:40 +0000

flight 186377 linux-linus real [real]
flight 186380 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186377/
http://logs.test-lab.xenproject.org/osstest/logs/186380/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-qcow2     8 xen-boot                 fail REGR. vs. 186372

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 186372
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186372
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186372
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186372
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186372
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186372
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186372
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                6ba59ff4227927d3a8530fc2973b80e94b54d58f
baseline version:
 linux                b5beaa44747bddbabb338377340244f56465cd7d

Last test of basis   186372  2024-06-16 18:43:40 Z    0 days
Testing same since   186377  2024-06-17 02:49:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andi Shyti <andi.shyti@kernel.org>
  Helge Deller <deller@gmx.de>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jean Delvare <jdelvare@suse.de>
  John David Anglin <dave.anglin@bell.net>
  John David Anglin <dave@parisc-linux.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>

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
 test-armhf-armhf-xl-credit2                                  fail    
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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
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
commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jun 16 13:40:16 2024 -0700

    Linux 6.10-rc4

commit 6456c4256d1cf1591634b39e58bced37539d35b1
Merge: 4301487e6b25 72d95924ee35
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jun 16 11:50:16 2024 -0700

    Merge tag 'parisc-for-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
    
    Pull parisc fix from Helge Deller:
     "On parisc we have suffered since years from random segfaults which
      seem to have been triggered due to cache inconsistencies. Those
      segfaults happened more often on machines with PA8800 and PA8900 CPUs,
      which have much bigger caches than the earlier machines.
    
      Dave Anglin has worked over the last few weeks to fix this bug. His
      patch has been successfully tested by various people on various
      machines and with various kernels (6.6, 6.8 and 6.9), and the debian
      buildd servers haven't shown a single random segfault with this patch.
    
      Since the cache handling has been reworked, the patch is slightly
      bigger than I would like in this stage, but the greatly improved
      stability IMHO justifies the inclusion now"
    
    * tag 'parisc-for-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux:
      parisc: Try to fix random segmentation faults in package builds

commit 4301487e6b25276e0270a7547150e0304da2ba78
Merge: b5beaa44747b 7e9bb0cb50fe
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jun 16 11:37:38 2024 -0700

    Merge tag 'i2c-for-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
    
    Pull i2c fixes from Wolfram Sang:
     "Two fixes to correctly report i2c functionality, ensuring that
      I2C_FUNC_SLAVE is reported when a device operates solely as a slave
      interface"
    
    * tag 'i2c-for-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux:
      i2c: designware: Fix the functionality flags of the slave-only interface
      i2c: at91: Fix the functionality flags of the slave-only interface

commit 7e9bb0cb50fec5d287749a58de5bb32220881b46
Merge: 83a7eefedc9b cbf3fb5b29e9
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date:   Sun Jun 16 12:48:30 2024 +0200

    Merge tag 'i2c-host-fixes-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current
    
    Two fixes from Jean aim to correctly report i2c functionality,
    specifically ensuring that I2C_FUNC_SLAVE is reported when a
    device operates solely as a slave interface.

commit cbf3fb5b29e99e3689d63a88c3cddbffa1b8de99
Author: Jean Delvare <jdelvare@suse.de>
Date:   Fri May 31 11:17:48 2024 +0200

    i2c: designware: Fix the functionality flags of the slave-only interface
    
    When an I2C adapter acts only as a slave, it should not claim to
    support I2C master capabilities.
    
    Fixes: 5b6d721b266a ("i2c: designware: enable SLAVE in platform module")
    Signed-off-by: Jean Delvare <jdelvare@suse.de>
    Cc: Luis Oliveira <lolivei@synopsys.com>
    Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
    Cc: Jan Dabros <jsd@semihalf.com>
    Cc: Andi Shyti <andi.shyti@kernel.org>
    Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
    Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
    Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

commit d6d5645e5fc1233a7ba950de4a72981c394a2557
Author: Jean Delvare <jdelvare@suse.de>
Date:   Fri May 31 11:19:14 2024 +0200

    i2c: at91: Fix the functionality flags of the slave-only interface
    
    When an I2C adapter acts only as a slave, it should not claim to
    support I2C master capabilities.
    
    Fixes: 9d3ca54b550c ("i2c: at91: added slave mode support")
    Signed-off-by: Jean Delvare <jdelvare@suse.de>
    Cc: Juergen Fitschen <me@jue.yt>
    Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
    Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
    Cc: Andi Shyti <andi.shyti@kernel.org>
    Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
    Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
    Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
    Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

commit 72d95924ee35c8cd16ef52f912483ee938a34d49
Author: John David Anglin <dave@parisc-linux.org>
Date:   Mon Jun 10 18:47:07 2024 +0000

    parisc: Try to fix random segmentation faults in package builds
    
    PA-RISC systems with PA8800 and PA8900 processors have had problems
    with random segmentation faults for many years.  Systems with earlier
    processors are much more stable.
    
    Systems with PA8800 and PA8900 processors have a large L2 cache which
    needs per page flushing for decent performance when a large range is
    flushed. The combined cache in these systems is also more sensitive to
    non-equivalent aliases than the caches in earlier systems.
    
    The majority of random segmentation faults that I have looked at
    appear to be memory corruption in memory allocated using mmap and
    malloc.
    
    My first attempt at fixing the random faults didn't work. On
    reviewing the cache code, I realized that there were two issues
    which the existing code didn't handle correctly. Both relate
    to cache move-in. Another issue is that the present bit in PTEs
    is racy.
    
    1) PA-RISC caches have a mind of their own and they can speculatively
    load data and instructions for a page as long as there is a entry in
    the TLB for the page which allows move-in. TLBs are local to each
    CPU. Thus, the TLB entry for a page must be purged before flushing
    the page. This is particularly important on SMP systems.
    
    In some of the flush routines, the flush routine would be called
    and then the TLB entry would be purged. This was because the flush
    routine needed the TLB entry to do the flush.
    
    2) My initial approach to trying the fix the random faults was to
    try and use flush_cache_page_if_present for all flush operations.
    This actually made things worse and led to a couple of hardware
    lockups. It finally dawned on me that some lines weren't being
    flushed because the pte check code was racy. This resulted in
    random inequivalent mappings to physical pages.
    
    The __flush_cache_page tmpalias flush sets up its own TLB entry
    and it doesn't need the existing TLB entry. As long as we can find
    the pte pointer for the vm page, we can get the pfn and physical
    address of the page. We can also purge the TLB entry for the page
    before doing the flush. Further, __flush_cache_page uses a special
    TLB entry that inhibits cache move-in.
    
    When switching page mappings, we need to ensure that lines are
    removed from the cache.  It is not sufficient to just flush the
    lines to memory as they may come back.
    
    This made it clear that we needed to implement all the required
    flush operations using tmpalias routines. This includes flushes
    for user and kernel pages.
    
    After modifying the code to use tmpalias flushes, it became clear
    that the random segmentation faults were not fully resolved. The
    frequency of faults was worse on systems with a 64 MB L2 (PA8900)
    and systems with more CPUs (rp4440).
    
    The warning that I added to flush_cache_page_if_present to detect
    pages that couldn't be flushed triggered frequently on some systems.
    
    Helge and I looked at the pages that couldn't be flushed and found
    that the PTE was either cleared or for a swap page. Ignoring pages
    that were swapped out seemed okay but pages with cleared PTEs seemed
    problematic.
    
    I looked at routines related to pte_clear and noticed ptep_clear_flush.
    The default implementation just flushes the TLB entry. However, it was
    obvious that on parisc we need to flush the cache page as well. If
    we don't flush the cache page, stale lines will be left in the cache
    and cause random corruption. Once a PTE is cleared, there is no way
    to find the physical address associated with the PTE and flush the
    associated page at a later time.
    
    I implemented an updated change with a parisc specific version of
    ptep_clear_flush. It fixed the random data corruption on Helge's rp4440
    and rp3440, as well as on my c8000.
    
    At this point, I realized that I could restore the code where we only
    flush in flush_cache_page_if_present if the page has been accessed.
    However, for this, we also need to flush the cache when the accessed
    bit is cleared in ptep_clear_flush_young to keep things synchronized.
    The default implementation only flushes the TLB entry.
    
    Other changes in this version are:
    
    1) Implement parisc specific version of ptep_get. It's identical to
    default but needed in arch/parisc/include/asm/pgtable.h.
    2) Revise parisc implementation of ptep_test_and_clear_young to use
    ptep_get (READ_ONCE).
    3) Drop parisc implementation of ptep_get_and_clear. We can use default.
    4) Revise flush_kernel_vmap_range and invalidate_kernel_vmap_range to
    use full data cache flush.
    5) Move flush_cache_vmap and flush_cache_vunmap to cache.c. Handle
    VM_IOREMAP case in flush_cache_vmap.
    
    At this time, I don't know whether it is better to always flush when
    the PTE present bit is set or when both the accessed and present bits
    are set. The later saves flushing pages that haven't been accessed,
    but we need to flush in ptep_clear_flush_young. It also needs a page
    table lookup to find the PTE pointer. The lpa instruction only needs
    a page table lookup when the PTE entry isn't in the TLB.
    
    We don't atomically handle setting and clearing the _PAGE_ACCESSED bit.
    If we miss an update, we may miss a flush and the cache may get corrupted.
    Whether the current code is effectively atomic depends on process control.
    
    When CONFIG_FLUSH_PAGE_ACCESSED is set to zero, the page will eventually
    be flushed when the PTE is cleared or in flush_cache_page_if_present. The
    _PAGE_ACCESSED bit is not used, so the problem is avoided.
    
    The flush method can be selected using the CONFIG_FLUSH_PAGE_ACCESSED
    define in cache.c. The default is 0. I didn't see a large difference
    in performance.
    
    Signed-off-by: John David Anglin <dave.anglin@bell.net>
    Cc: <stable@vger.kernel.org> # v6.6+
    Signed-off-by: Helge Deller <deller@gmx.de>

