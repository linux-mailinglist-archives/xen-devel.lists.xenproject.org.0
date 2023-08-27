Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B878A2C3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 00:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591192.923566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaOJL-0004m7-2W; Sun, 27 Aug 2023 22:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591192.923566; Sun, 27 Aug 2023 22:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaOJK-0004kE-Vz; Sun, 27 Aug 2023 22:32:46 +0000
Received: by outflank-mailman (input) for mailman id 591192;
 Sun, 27 Aug 2023 22:32:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaOJJ-0004k4-Su; Sun, 27 Aug 2023 22:32:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaOJJ-0001x0-F7; Sun, 27 Aug 2023 22:32:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaOJI-0006o6-Tn; Sun, 27 Aug 2023 22:32:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qaOJI-0006QY-TO; Sun, 27 Aug 2023 22:32:44 +0000
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
	bh=7dnjHhlV9gBeDxq1pvDmVH22ruMViyfpIWQ28h4qbnQ=; b=ooPZfq3D1Er+JiJ2Nyw+jqUA3d
	QaOm3DinQkL4Koz6vL49Kl3KWc1slV4aJwF4xvpRxpe+SGvvTUikLet3xCSUndq01xjyo4H6tpiD/
	FYUSiSliX8Yb3Nz1mNmB35TTiYV/AS70GxnE1LiDGaO/8nF6icCZI0RzjyOH7ZnYG+hA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182529-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182529: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=85eb043618bb17124050197d71c453d4a1f556e5
X-Osstest-Versions-That:
    linux=28f20a19294da7df158dfca259d0e2b5866baaf9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Aug 2023 22:32:44 +0000

flight 182529 linux-linus real [real]
flight 182530 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182529/
http://logs.test-lab.xenproject.org/osstest/logs/182530/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail in 182530 REGR. vs. 182526

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 18 guest-localmigrate/x10 fail pass in 182530-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail blocked in 182526
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182526
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182526
 test-amd64-amd64-xl-credit1  22 guest-start/debian.repeat    fail  like 182526
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182526
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182526
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182526
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182526
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182526
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                85eb043618bb17124050197d71c453d4a1f556e5
baseline version:
 linux                28f20a19294da7df158dfca259d0e2b5866baaf9

Last test of basis   182526  2023-08-26 21:10:35 Z    1 days
Testing same since   182529  2023-08-27 14:41:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
  Bao D. Nguyen <quic_nguyenb@quicinc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Manivannan Sadhasivam <mani@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Zhu Wang <wangzhu9@huawei.com>

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
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
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
commit 85eb043618bb17124050197d71c453d4a1f556e5
Merge: 28f20a19294d 1bd3a76880b2
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Aug 27 07:33:54 2023 -0700

    Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
    
    Pull SCSI fixes from James Bottomley:
     "Three small driver fixes and one larger unused function set removal in
      the raid class (so no external impact)"
    
    * tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi:
      scsi: snic: Fix double free in snic_tgt_create()
      scsi: core: raid_class: Remove raid_component_add()
      scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW major version > 5
      scsi: ufs: mcq: Fix the search/wrap around logic

commit 1bd3a76880b2bce017987cf53780b372cf59528e
Author: Zhu Wang <wangzhu9@huawei.com>
Date:   Sat Aug 19 08:39:41 2023 +0000

    scsi: snic: Fix double free in snic_tgt_create()
    
    Commit 41320b18a0e0 ("scsi: snic: Fix possible memory leak if device_add()
    fails") fixed the memory leak caused by dev_set_name() when device_add()
    failed. However, it did not consider that 'tgt' has already been released
    when put_device(&tgt->dev) is called. Remove kfree(tgt) in the error path
    to avoid double free of 'tgt' and move put_device(&tgt->dev) after the
    removed kfree(tgt) to avoid a use-after-free.
    
    Fixes: 41320b18a0e0 ("scsi: snic: Fix possible memory leak if device_add() fails")
    Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
    Link: https://lore.kernel.org/r/20230819083941.164365-1-wangzhu9@huawei.com
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

commit 60c5fd2e8f3c42a5abc565ba9876ead1da5ad2b7
Author: Zhu Wang <wangzhu9@huawei.com>
Date:   Tue Aug 22 01:52:54 2023 +0000

    scsi: core: raid_class: Remove raid_component_add()
    
    The raid_component_add() function was added to the kernel tree via patch
    "[SCSI] embryonic RAID class" (2005). Remove this function since it never
    has had any callers in the Linux kernel. And also raid_component_release()
    is only used in raid_component_add(), so it is also removed.
    
    Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
    Link: https://lore.kernel.org/r/20230822015254.184270-1-wangzhu9@huawei.com
    Reviewed-by: Bart Van Assche <bvanassche@acm.org>
    Fixes: 04b5b5cb0136 ("scsi: core: Fix possible memory leak if device_add() fails")
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

commit c422fbd5cb58c9a078172ae1e9750971b738a197
Author: Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon Aug 21 14:11:21 2023 +0200

    scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW major version > 5
    
    The qunipro_g4_sel clear is also needed for new platforms with major
    version > 5. Fix the version check to take this into account.
    
    Fixes: 9c02aa24bf40 ("scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW version major 5")
    Acked-by: Manivannan Sadhasivam <mani@kernel.org>
    Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
    Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
    Link: https://lore.kernel.org/r/20230821-topic-sm8x50-upstream-ufs-major-5-plus-v2-1-f42a4b712e58@linaro.org
    Reviewed-by: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

commit d0c89af3130eb4ff962266bb7597690a696f1cbc
Author: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Date:   Tue Aug 15 18:38:29 2023 -0700

    scsi: ufs: mcq: Fix the search/wrap around logic
    
    The search and wrap around logic in the ufshcd_mcq_sqe_search() function
    does not work correctly when the hwq's queue depth is not a power of two
    number. Correct it so that any queue depth with a positive integer value
    within the supported range would work.
    
    Signed-off-by: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
    Link: https://lore.kernel.org/r/ff49c15be205135ed3ec186f3086694c02867dbd.1692149603.git.quic_nguyenb@quicinc.com
    Reviewed-by: Bart Van Assche <bvanassche@acm.org>
    Fixes: 8d7290348992 ("scsi: ufs: mcq: Add supporting functions for MCQ abort")
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

