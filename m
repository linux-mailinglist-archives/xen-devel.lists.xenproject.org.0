Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4747AAB4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 14:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249815.430212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzJ8n-0006R1-2o; Mon, 20 Dec 2021 13:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249815.430212; Mon, 20 Dec 2021 13:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzJ8m-0006PE-V5; Mon, 20 Dec 2021 13:55:48 +0000
Received: by outflank-mailman (input) for mailman id 249815;
 Mon, 20 Dec 2021 13:55:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzJ8l-0006P4-P4; Mon, 20 Dec 2021 13:55:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzJ8l-0005rY-MQ; Mon, 20 Dec 2021 13:55:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzJ8l-00071T-BL; Mon, 20 Dec 2021 13:55:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mzJ8l-0005jT-An; Mon, 20 Dec 2021 13:55:47 +0000
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
	bh=MVKD/AjEd8ErMA0IGpTQCtmx/R5Blc8J1MO328jlnKk=; b=Ife+DJbDwG/OpAeZ0o8UQJFxRZ
	iPW2AraGJcJT2RoGSV1Rvs8QMTzBpBJbdoUEJsLkjvOXIMs/eujOlWwgvAcmGVVDNNiAKvO5Ci1jk
	tqe3rCrg/maDewKoLs6E4qNqmfFxAH+YKbjDzcuOEwz2Ve3oBA6lnob8d6MRn127r11I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167486-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167486: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a7904a538933c525096ca2ccde1e60d0ee62c08e
X-Osstest-Versions-That:
    linux=a76c3d035872bf390d2fd92d8e5badc5ee28b17d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Dec 2021 13:55:47 +0000

flight 167486 linux-linus real [real]
flight 167490 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167486/
http://logs.test-lab.xenproject.org/osstest/logs/167490/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 167484

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt      8 xen-boot            fail pass in 167490-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 167490 like 167484
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 167490 never pass
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10       fail  like 167484
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167484
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167484
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167484
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167484
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167484
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167484
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167484
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                a7904a538933c525096ca2ccde1e60d0ee62c08e
baseline version:
 linux                a76c3d035872bf390d2fd92d8e5badc5ee28b17d

Last test of basis   167484  2021-12-19 20:40:59 Z    0 days
Testing same since   167486  2021-12-20 02:31:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jens Axboe <axboe@kernel.dk>
  Linus Torvalds <torvalds@linux-foundation.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Sean Christopherson <seanjc@google.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-libvirt                                     fail    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
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
commit a7904a538933c525096ca2ccde1e60d0ee62c08e
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Dec 19 14:14:33 2021 -0800

    Linux 5.16-rc6

commit f291e2d899d120880bfe8e0fa6fe22a97a54e054
Merge: 2da09da4ae5e 18c841e1f411
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Dec 19 12:44:03 2021 -0800

    Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
    
    Pull kvm fixes from Paolo Bonzini:
     "Two small fixes, one of which was being worked around in selftests"
    
    * tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm:
      KVM: x86: Retry page fault if MMU reload is pending and root has no sp
      KVM: selftests: vmx_pmu_msrs_test: Drop tests mangling guest visible CPUIDs
      KVM: x86: Drop guest CPUID check for host initiated writes to MSR_IA32_PERF_CAPABILITIES

commit 2da09da4ae5e1714606668bdb145806b0afe9c90
Merge: a76c3d035872 87959fa16cfb
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Dec 19 12:38:53 2021 -0800

    Merge tag 'block-5.16-2021-12-19' of git://git.kernel.dk/linux-block
    
    Pull block revert from Jens Axboe:
     "It turns out that the fix for not hammering on the delayed work timer
      too much caused a performance regression for BFQ, so let's revert the
      change for now.
    
      I've got some ideas on how to fix it appropriately, but they should
      wait for 5.17"
    
    * tag 'block-5.16-2021-12-19' of git://git.kernel.dk/linux-block:
      Revert "block: reduce kblockd_mod_delayed_work_on() CPU consumption"

commit 18c841e1f4112d3fb742aca3429e84117fcb1e1c
Author: Sean Christopherson <seanjc@google.com>
Date:   Thu Dec 9 06:05:46 2021 +0000

    KVM: x86: Retry page fault if MMU reload is pending and root has no sp
    
    Play nice with a NULL shadow page when checking for an obsolete root in
    the page fault handler by flagging the page fault as stale if there's no
    shadow page associated with the root and KVM_REQ_MMU_RELOAD is pending.
    Invalidating memslots, which is the only case where _all_ roots need to
    be reloaded, requests all vCPUs to reload their MMUs while holding
    mmu_lock for lock.
    
    The "special" roots, e.g. pae_root when KVM uses PAE paging, are not
    backed by a shadow page.  Running with TDP disabled or with nested NPT
    explodes spectaculary due to dereferencing a NULL shadow page pointer.
    
    Skip the KVM_REQ_MMU_RELOAD check if there is a valid shadow page for the
    root.  Zapping shadow pages in response to guest activity, e.g. when the
    guest frees a PGD, can trigger KVM_REQ_MMU_RELOAD even if the current
    vCPU isn't using the affected root.  I.e. KVM_REQ_MMU_RELOAD can be seen
    with a completely valid root shadow page.  This is a bit of a moot point
    as KVM currently unloads all roots on KVM_REQ_MMU_RELOAD, but that will
    be cleaned up in the future.
    
    Fixes: a955cad84cda ("KVM: x86/mmu: Retry page fault if root is invalidated by memslot update")
    Cc: stable@vger.kernel.org
    Cc: Maxim Levitsky <mlevitsk@redhat.com>
    Signed-off-by: Sean Christopherson <seanjc@google.com>
    Message-Id: <20211209060552.2956723-2-seanjc@google.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

commit 0b091a43d704997789c6d812b02167c8f5f9f061
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Thu Dec 16 17:52:12 2021 +0100

    KVM: selftests: vmx_pmu_msrs_test: Drop tests mangling guest visible CPUIDs
    
    Host initiated writes to MSR_IA32_PERF_CAPABILITIES should not depend
    on guest visible CPUIDs and (incorrect) KVM logic implementing it is
    about to change. Also, KVM_SET_CPUID{,2} after KVM_RUN is now forbidden
    and causes test to fail.
    
    Reported-by: kernel test robot <oliver.sang@intel.com>
    Fixes: feb627e8d6f6 ("KVM: x86: Forbid KVM_SET_CPUID{,2} after KVM_RUN")
    Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
    Message-Id: <20211216165213.338923-2-vkuznets@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

commit 1aa2abb33a419090c7c87d4ae842a6347078ee12
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Thu Dec 16 17:52:13 2021 +0100

    KVM: x86: Drop guest CPUID check for host initiated writes to MSR_IA32_PERF_CAPABILITIES
    
    The ability to write to MSR_IA32_PERF_CAPABILITIES from the host should
    not depend on guest visible CPUID entries, even if just to allow
    creating/restoring guest MSRs and CPUIDs in any sequence.
    
    Fixes: 27461da31089 ("KVM: x86/pmu: Support full width counting")
    Suggested-by: Sean Christopherson <seanjc@google.com>
    Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
    Message-Id: <20211216165213.338923-3-vkuznets@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

commit 87959fa16cfbcf76245c11559db1940069621274
Author: Jens Axboe <axboe@kernel.dk>
Date:   Sun Dec 19 07:58:44 2021 -0700

    Revert "block: reduce kblockd_mod_delayed_work_on() CPU consumption"
    
    This reverts commit cb2ac2912a9ca7d3d26291c511939a41361d2d83.
    
    Alex and the kernel test robot report that this causes a significant
    performance regression with BFQ. I can reproduce that result, so let's
    revert this one as we're close to -rc6 and we there's no point in trying
    to rush a fix.
    
    Link: https://lore.kernel.org/linux-block/1639853092.524jxfaem2.none@localhost/
    Link: https://lore.kernel.org/lkml/20211219141852.GH14057@xsang-OptiPlex-9020/
    Reported-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
    Reported-by: kernel test robot <oliver.sang@intel.com>
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

