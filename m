Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E692470B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 20:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752618.1160828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOhvX-00055a-Sc; Tue, 02 Jul 2024 18:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752618.1160828; Tue, 02 Jul 2024 18:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOhvX-00053K-Pe; Tue, 02 Jul 2024 18:08:27 +0000
Received: by outflank-mailman (input) for mailman id 752618;
 Tue, 02 Jul 2024 18:08:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOhvW-00053A-1O; Tue, 02 Jul 2024 18:08:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOhvV-0004mI-TV; Tue, 02 Jul 2024 18:08:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sOhvV-0002KR-GZ; Tue, 02 Jul 2024 18:08:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sOhvV-0008Er-G5; Tue, 02 Jul 2024 18:08:25 +0000
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
	bh=LZv6qk1pivUbyGC6LTVENK44nXB7nw2l4FYIOqpEH0k=; b=k+BNXzJDlcKd02Sp0mKTPMB1bY
	RNaxLjBBwWb2eZuUAX4Io9ZavoyzMAhHh2a+ZLbQiUWf5mnvcxmRSCTEeIgNY3WwsJpZYItk8XMRo
	Dn1izpr5vBDR6L8h7wSu3Mh1KPzsSmyZ6gU6NKG4KeuXCM9uiTWbi7OYzs88qLa+sMkk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186626-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186626: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:host-ping-check-xen:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=73e931504f8e0d42978bfcda37b323dbbd1afc08
X-Osstest-Versions-That:
    linux=9903efbddba0d14133b5a3c75088b558d2e34ac3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Jul 2024 18:08:25 +0000

flight 186626 linux-linus real [real]
flight 186631 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186626/
http://logs.test-lab.xenproject.org/osstest/logs/186631/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-qcow2     8 xen-boot                 fail REGR. vs. 186620
 test-armhf-armhf-xl-credit2 10 host-ping-check-xen fail in 186631 REGR. vs. 186620

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 186631-retest
 test-armhf-armhf-libvirt-vhd  8 xen-boot            fail pass in 186631-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check fail in 186631 never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check fail in 186631 never pass
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 186620
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186620
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186620
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186620
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186620
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186620
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186620
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                73e931504f8e0d42978bfcda37b323dbbd1afc08
baseline version:
 linux                9903efbddba0d14133b5a3c75088b558d2e34ac3

Last test of basis   186620  2024-07-01 17:14:02 Z    1 days
Testing same since   186626  2024-07-02 05:45:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alison Schofield <alison.schofield@intel.com>
  Dan Williams <dan.j.williams@intel.com>
  Dave Jiang <dave.jiang@intel.com>
  David Sterba <dsterba@suse.com>
  Li Ming <ming4.li@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Naohiro Aota <naohiro.aota@wdc.com>
  Yao Xingtao <yaoxt.fnst@fujitsu.com>

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
 test-armhf-armhf-xl-arndale                                  fail    
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
 test-armhf-armhf-libvirt-vhd                                 fail    
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
commit 73e931504f8e0d42978bfcda37b323dbbd1afc08
Merge: cfbc0ffea88c a0f39d51dbf7
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Jul 1 13:03:30 2024 -0700

    Merge tag 'cxl-fixes-6.10-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl
    
    Pull cxl fixes from Dave Jiang:
    
     - Fix no cxl_nvd during pmem region auto-assemble
    
     - Avoid NULLL pointer dereference in region lookup
    
     - Add missing checks to interleave capability
    
     - Add cxl kdoc fix to address document compilation error
    
    * tag 'cxl-fixes-6.10-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl:
      cxl: documentation: add missing files to cxl driver-api
      cxl/region: check interleave capability
      cxl/region: Avoid null pointer dereference in region lookup
      cxl/mem: Fix no cxl_nvd during pmem region auto-assembling

commit cfbc0ffea88c764d23f69efe6ecb74918e0f588e
Merge: 9903efbddba0 48f091fd50b2
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Jul 1 12:48:28 2024 -0700

    Merge tag 'for-6.10-rc6-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
    
    Pull btrfs fix from David Sterba:
     "A fixup for a recent fix that prevents an infinite loop during block
      group reclaim.
    
      Unfortunately it introduced an unsafe way of updating block group list
      and could race with relocation. This could be hit on fast devices when
      relocation/balance does not have enough space"
    
    * tag 'for-6.10-rc6-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux:
      btrfs: fix adding block group to a reclaim list and the unused list during reclaim

commit 48f091fd50b2eb33ae5eaea9ed3c4f81603acf38
Author: Naohiro Aota <naohiro.aota@wdc.com>
Date:   Fri Jun 28 13:32:24 2024 +0900

    btrfs: fix adding block group to a reclaim list and the unused list during reclaim
    
    There is a potential parallel list adding for retrying in
    btrfs_reclaim_bgs_work and adding to the unused list. Since the block
    group is removed from the reclaim list and it is on a relocation work,
    it can be added into the unused list in parallel. When that happens,
    adding it to the reclaim list will corrupt the list head and trigger
    list corruption like below.
    
    Fix it by taking fs_info->unused_bgs_lock.
    
      [177.504][T2585409] BTRFS error (device nullb1): error relocating ch= unk 2415919104
      [177.514][T2585409] list_del corruption. next->prev should be ff1100= 0344b119c0, but was ff11000377e87c70. (next=3Dff110002390cd9c0)
      [177.529][T2585409] ------------[ cut here ]------------
      [177.537][T2585409] kernel BUG at lib/list_debug.c:65!
      [177.545][T2585409] Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
      [177.555][T2585409] CPU: 9 PID: 2585409 Comm: kworker/u128:2 Tainted: G        W          6.10.0-rc5-kts #1
      [177.568][T2585409] Hardware name: Supermicro SYS-520P-WTR/X12SPW-TF, BIOS 1.2 02/14/2022
      [177.579][T2585409] Workqueue: events_unbound btrfs_reclaim_bgs_work[btrfs]
      [177.589][T2585409] RIP: 0010:__list_del_entry_valid_or_report.cold+0x70/0x72
      [177.624][T2585409] RSP: 0018:ff11000377e87a70 EFLAGS: 00010286
      [177.633][T2585409] RAX: 000000000000006d RBX: ff11000344b119c0 RCX:0000000000000000
      [177.644][T2585409] RDX: 000000000000006d RSI: 0000000000000008 RDI:ffe21c006efd0f40
      [177.655][T2585409] RBP: ff110002e0509f78 R08: 0000000000000001 R09:ffe21c006efd0f08
      [177.665][T2585409] R10: ff11000377e87847 R11: 0000000000000000 R12:ff110002390cd9c0
      [177.676][T2585409] R13: ff11000344b119c0 R14: ff110002e0508000 R15:dffffc0000000000
      [177.687][T2585409] FS:  0000000000000000(0000) GS:ff11000fec880000(0000) knlGS:0000000000000000
      [177.700][T2585409] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
      [177.709][T2585409] CR2: 00007f06bc7b1978 CR3: 0000001021e86005 CR4:0000000000771ef0
      [177.720][T2585409] DR0: 0000000000000000 DR1: 0000000000000000 DR2:0000000000000000
      [177.731][T2585409] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:0000000000000400
      [177.742][T2585409] PKRU: 55555554
      [177.748][T2585409] Call Trace:
      [177.753][T2585409]  <TASK>
      [177.759][T2585409]  ? __die_body.cold+0x19/0x27
      [177.766][T2585409]  ? die+0x2e/0x50
      [177.772][T2585409]  ? do_trap+0x1ea/0x2d0
      [177.779][T2585409]  ? __list_del_entry_valid_or_report.cold+0x70/0x72
      [177.788][T2585409]  ? do_error_trap+0xa3/0x160
      [177.795][T2585409]  ? __list_del_entry_valid_or_report.cold+0x70/0x72
      [177.805][T2585409]  ? handle_invalid_op+0x2c/0x40
      [177.812][T2585409]  ? __list_del_entry_valid_or_report.cold+0x70/0x72
      [177.820][T2585409]  ? exc_invalid_op+0x2d/0x40
      [177.827][T2585409]  ? asm_exc_invalid_op+0x1a/0x20
      [177.834][T2585409]  ? __list_del_entry_valid_or_report.cold+0x70/0x72
      [177.843][T2585409]  btrfs_delete_unused_bgs+0x3d9/0x14c0 [btrfs]
    
    There is a similar retry_list code in btrfs_delete_unused_bgs(), but it is
    safe, AFAICS. Since the block group was in the unused list, the used bytes
    should be 0 when it was added to the unused list. Then, it checks
    block_group->{used,reserved,pinned} are still 0 under the
    block_group->lock. So, they should be still eligible for the unused list,
    not the reclaim list.
    
    The reason it is safe there it's because because we're holding
    space_info->groups_sem in write mode.
    
    That means no other task can allocate from the block group, so while we
    are at deleted_unused_bgs() it's not possible for other tasks to
    allocate and deallocate extents from the block group, so it can't be
    added to the unused list or the reclaim list by anyone else.
    
    The bug can be reproduced by btrfs/166 after a few rounds. In practice
    this can be hit when relocation cannot find more chunk space and ends
    with ENOSPC.
    
    Reported-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
    Suggested-by: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
    Fixes: 4eb4e85c4f81 ("btrfs: retry block group reclaim without infinite loop")
    CC: stable@vger.kernel.org # 5.15+
    Reviewed-by: Filipe Manana <fdmanana@suse.com>
    Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Naohiro Aota <naohiro.aota@wdc.com>
    Reviewed-by: David Sterba <dsterba@suse.com>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit a0f39d51dbf72c28283bd201b97559ed82bc0fe5
Author: Yao Xingtao <yaoxt.fnst@fujitsu.com>
Date:   Fri Jun 14 04:47:55 2024 -0400

    cxl: documentation: add missing files to cxl driver-api
    
    Add the missing files into cxl driver api and fix the compile warning.
    
    Suggested-by: Dan Williams <dan.j.williams@intel.com>
    Suggested-by: Alison Schofield <alison.schofield@intel.com>
    Signed-off-by: Yao Xingtao <yaoxt.fnst@fujitsu.com>
    Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
    Link: https://patch.msgid.link/20240614084755.59503-3-yaoxt.fnst@fujitsu.com
    Signed-off-by: Dave Jiang <dave.jiang@intel.com>

commit 84328c5acebc10c8cdcf17283ab6c6d548885bfc
Author: Yao Xingtao <yaoxt.fnst@fujitsu.com>
Date:   Fri Jun 14 04:47:54 2024 -0400

    cxl/region: check interleave capability
    
    Since interleave capability is not verified, if the interleave
    capability of a target does not match the region need, committing decoder
    should have failed at the device end.
    
    In order to checkout this error as quickly as possible, driver needs
    to check the interleave capability of target during attaching it to
    region.
    
    Per CXL specification r3.1(8.2.4.20.1 CXL HDM Decoder Capability Register),
    bits 11 and 12 indicate the capability to establish interleaving in 3, 6,
    12 and 16 ways. If these bits are not set, the target cannot be attached to
    a region utilizing such interleave ways.
    
    Additionally, bits 8 and 9 represent the capability of the bits used for
    interleaving in the address, Linux tracks this in the cxl_port
    interleave_mask.
    
    Per CXL specification r3.1(8.2.4.20.13 Decoder Protection):
      eIW means encoded Interleave Ways.
      eIG means encoded Interleave Granularity.
    
      in HPA:
      if eIW is 0 or 8 (interleave ways: 1, 3), all the bits of HPA are used,
      the interleave bits are none, the following check is ignored.
    
      if eIW is less than 8 (interleave ways: 2, 4, 8, 16), the interleave bits
      start at bit position eIG + 8 and end at eIG + eIW + 8 - 1.
    
      if eIW is greater than 8 (interleave ways: 6, 12), the interleave bits
      start at bit position eIG + 8 and end at eIG + eIW - 1.
    
      if the interleave mask is insufficient to cover the required interleave
      bits, the target cannot be attached to the region.
    
    Fixes: 384e624bb211 ("cxl/region: Attach endpoint decoders")
    Signed-off-by: Yao Xingtao <yaoxt.fnst@fujitsu.com>
    Reviewed-by: Dan Williams <dan.j.williams@intel.com>
    Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
    Link: https://patch.msgid.link/20240614084755.59503-2-yaoxt.fnst@fujitsu.com
    Signed-off-by: Dave Jiang <dave.jiang@intel.com>

commit 285f2a08841432fc3e498b1cd00cce5216cdf189
Author: Alison Schofield <alison.schofield@intel.com>
Date:   Mon Jun 3 17:36:09 2024 -0700

    cxl/region: Avoid null pointer dereference in region lookup
    
    cxl_dpa_to_region() looks up a region based on a memdev and DPA.
    It wrongly assumes an endpoint found mapping the DPA is also of
    a fully assembled region. When not true it leads to a null pointer
    dereference looking up the region name.
    
    This appears during testing of region lookup after a failure to
    assemble a BIOS defined region or if the lookup raced with the
    assembly of the BIOS defined region.
    
    Failure to clean up BIOS defined regions that fail assembly is an
    issue in itself and a fix to that problem will alleviate some of
    the impact. It will not alleviate the race condition so let's harden
    this path.
    
    The behavior change is that the kernel oops due to a null pointer
    dereference is replaced with a dev_dbg() message noting that an
    endpoint was mapped.
    
    Additional comments are added so that future users of this function
    can more clearly understand what it provides.
    
    Fixes: 0a105ab28a4d ("cxl/memdev: Warn of poison inject or clear to a mapped region")
    Signed-off-by: Alison Schofield <alison.schofield@intel.com>
    Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
    Link: https://patch.msgid.link/20240604003609.202682-1-alison.schofield@intel.com
    Signed-off-by: Dave Jiang <dave.jiang@intel.com>

commit 84ec985944ef34a34a1605b93ce401aa8737af96
Author: Li Ming <ming4.li@intel.com>
Date:   Wed Jun 12 14:44:23 2024 +0800

    cxl/mem: Fix no cxl_nvd during pmem region auto-assembling
    
    When CXL subsystem is auto-assembling a pmem region during cxl
    endpoint port probing, always hit below calltrace.
    
     BUG: kernel NULL pointer dereference, address: 0000000000000078
     #PF: supervisor read access in kernel mode
     #PF: error_code(0x0000) - not-present page
     RIP: 0010:cxl_pmem_region_probe+0x22e/0x360 [cxl_pmem]
     Call Trace:
      <TASK>
      ? __die+0x24/0x70
      ? page_fault_oops+0x82/0x160
      ? do_user_addr_fault+0x65/0x6b0
      ? exc_page_fault+0x7d/0x170
      ? asm_exc_page_fault+0x26/0x30
      ? cxl_pmem_region_probe+0x22e/0x360 [cxl_pmem]
      ? cxl_pmem_region_probe+0x1ac/0x360 [cxl_pmem]
      cxl_bus_probe+0x1b/0x60 [cxl_core]
      really_probe+0x173/0x410
      ? __pfx___device_attach_driver+0x10/0x10
      __driver_probe_device+0x80/0x170
      driver_probe_device+0x1e/0x90
      __device_attach_driver+0x90/0x120
      bus_for_each_drv+0x84/0xe0
      __device_attach+0xbc/0x1f0
      bus_probe_device+0x90/0xa0
      device_add+0x51c/0x710
      devm_cxl_add_pmem_region+0x1b5/0x380 [cxl_core]
      cxl_bus_probe+0x1b/0x60 [cxl_core]
    
    The cxl_nvd of the memdev needs to be available during the pmem region
    probe. Currently the cxl_nvd is registered after the endpoint port probe.
    The endpoint probe, in the case of autoassembly of regions, can cause a
    pmem region probe requiring the not yet available cxl_nvd. Adjust the
    sequence so this dependency is met.
    
    This requires adding a port parameter to cxl_find_nvdimm_bridge() that
    can be used to query the ancestor root port. The endpoint port is not
    yet available, but will share a common ancestor with its parent, so
    start the query from there instead.
    
    Fixes: f17b558d6663 ("cxl/pmem: Refactor nvdimm device registration, delete the workqueue")
    Co-developed-by: Dan Williams <dan.j.williams@intel.com>
    Signed-off-by: Dan Williams <dan.j.williams@intel.com>
    Signed-off-by: Li Ming <ming4.li@intel.com>
    Tested-by: Alison Schofield <alison.schofield@intel.com>
    Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
    Reviewed-by: Alison Schofield <alison.schofield@intel.com>
    Link: https://patch.msgid.link/20240612064423.2567625-1-ming4.li@intel.com
    Signed-off-by: Dave Jiang <dave.jiang@intel.com>

