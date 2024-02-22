Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E685EE67
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 02:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684176.1063890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcxVd-0000v1-Lz; Thu, 22 Feb 2024 01:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684176.1063890; Thu, 22 Feb 2024 01:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcxVd-0000sl-I1; Thu, 22 Feb 2024 01:04:21 +0000
Received: by outflank-mailman (input) for mailman id 684176;
 Thu, 22 Feb 2024 01:04:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rcxVc-0000sb-22; Thu, 22 Feb 2024 01:04:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rcxVb-0000cu-JD; Thu, 22 Feb 2024 01:04:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rcxVb-0005Ia-3C; Thu, 22 Feb 2024 01:04:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rcxVb-0001TW-2p; Thu, 22 Feb 2024 01:04:19 +0000
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
	bh=NZE+UvjFXY/xsfoK/o7hBI/s3Mq/Wpc7iTP45gFxGb0=; b=1dfpun8ecpEIMYwvuGDka+ZR6R
	ty3RM+mILWKcvXXhKFAzCnbWvvlN72NQlOpJjAVf36UxDndI0FwkfBigi0La1n06G7or7U4A0PAee
	hVvc5tpADncpAk3aKmas7YfqSAyG1y4GQrYfocqNFXCS9ox7PAV8a6n9d5naUqIEzh9A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184721: regressions - FAIL
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
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=39133352cbed6626956d38ed72012f49b0421e7b
X-Osstest-Versions-That:
    linux=9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Feb 2024 01:04:19 +0000

flight 184721 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184721/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 184719

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
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184719
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184719
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184719
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184719
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184719
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184719
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184719
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184719
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                39133352cbed6626956d38ed72012f49b0421e7b
baseline version:
 linux                9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8

Last test of basis   184719  2024-02-21 06:34:23 Z    0 days
Testing same since   184721  2024-02-21 17:43:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Sterba <dsterba@suse.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Jason Wang <jasowang@redhat.com>
  Josef Bacik <josef@toxicpanda.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Marc Zyngier <maz@kernel.org>
  Michael S. Tsirkin <mst@redhat.com>
  Nathan Chancellor <nathan@kernel.org> # build
  Oliver Upton <oliver.upton@linux.dev>
  Paolo Bonzini <pbonzini@redhat.com>
  Qu Wenruo <wqu@suse.com>
  zhenwei pi <pizhenwei@bytedance.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
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
commit 39133352cbed6626956d38ed72012f49b0421e7b
Merge: 8da8d88455eb c48617fbbe83
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Feb 21 09:13:27 2024 -0800

    Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
    
    Pull kvm fixes from Paolo Bonzini:
     "Two fixes for ARM ITS emulation. Unmapped interrupts were used instead
      of ignored, causing NULL pointer dereferences"
    
    * tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm:
      KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
      KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()

commit 8da8d88455ebbb4e05423cf60cff985e92d43754
Merge: d8be5a55b8e3 b0ad381fa769
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Feb 21 08:45:07 2024 -0800

    Merge tag 'for-6.8-rc5-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
    
    Pull btrfs fixes from David Sterba:
    
     - Fix a deadlock in fiemap.
    
       There was a big lock around the whole operation that can interfere
       with a page fault and mkwrite.
    
       Reducing the lock scope can also speed up fiemap
    
     - Fix range condition for extent defragmentation which could lead to
       worse layout in some cases
    
    * tag 'for-6.8-rc5-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux:
      btrfs: fix deadlock with fiemap and extent locking
      btrfs: defrag: avoid unnecessary defrag caused by incorrect extent size

commit d8be5a55b8e3f7eab8f36ceed2512f457f914318
Merge: 9fc1ccccfd8d c0ec2a712daf
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Feb 21 08:37:49 2024 -0800

    Merge tag 'v6.8-p4' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
    
    Pull crypto fix from Herbert Xu:
     "Fix a stack overflow in virtio"
    
    * tag 'v6.8-p4' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6:
      crypto: virtio/akcipher - Fix stack overflow on memcpy

commit c48617fbbe831d4c80fe84056033f17b70a31136
Merge: 9895ceeb5cd6 85a71ee9a070
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Wed Feb 21 05:18:56 2024 -0500

    Merge tag 'kvmarm-fixes-6.8-3' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
    
    KVM/arm64 fixes for 6.8, take #3
    
    - Check for the validity of interrupts handled by a MOVALL
      command
    
    - Check for the validity of interrupts while reading the
      pending state on enabling LPIs.

commit 85a71ee9a0700f6c18862ef3b0011ed9dad99aca
Author: Oliver Upton <oliver.upton@linux.dev>
Date:   Wed Feb 21 09:27:32 2024 +0000

    KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
    
    It is possible that an LPI mapped in a different ITS gets unmapped while
    handling the MOVALL command. If that is the case, there is no state that
    can be migrated to the destination. Silently ignore it and continue
    migrating other LPIs.
    
    Cc: stable@vger.kernel.org
    Fixes: ff9c114394aa ("KVM: arm/arm64: GICv4: Handle MOVALL applied to a vPE")
    Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
    Link: https://lore.kernel.org/r/20240221092732.4126848-3-oliver.upton@linux.dev
    Signed-off-by: Marc Zyngier <maz@kernel.org>

commit 8d3a7dfb801d157ac423261d7cd62c33e95375f8
Author: Oliver Upton <oliver.upton@linux.dev>
Date:   Wed Feb 21 09:27:31 2024 +0000

    KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()
    
    vgic_get_irq() may not return a valid descriptor if there is no ITS that
    holds a valid translation for the specified INTID. If that is the case,
    it is safe to silently ignore it and continue processing the LPI pending
    table.
    
    Cc: stable@vger.kernel.org
    Fixes: 33d3bc9556a7 ("KVM: arm64: vgic-its: Read initial LPI pending table")
    Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
    Link: https://lore.kernel.org/r/20240221092732.4126848-2-oliver.upton@linux.dev
    Signed-off-by: Marc Zyngier <maz@kernel.org>

commit b0ad381fa7690244802aed119b478b4bdafc31dd
Author: Josef Bacik <josef@toxicpanda.com>
Date:   Mon Feb 12 11:56:02 2024 -0500

    btrfs: fix deadlock with fiemap and extent locking
    
    While working on the patchset to remove extent locking I got a lockdep
    splat with fiemap and pagefaulting with my new extent lock replacement
    lock.
    
    This deadlock exists with our normal code, we just don't have lockdep
    annotations with the extent locking so we've never noticed it.
    
    Since we're copying the fiemap extent to user space on every iteration
    we have the chance of pagefaulting.  Because we hold the extent lock for
    the entire range we could mkwrite into a range in the file that we have
    mmap'ed.  This would deadlock with the following stack trace
    
    [<0>] lock_extent+0x28d/0x2f0
    [<0>] btrfs_page_mkwrite+0x273/0x8a0
    [<0>] do_page_mkwrite+0x50/0xb0
    [<0>] do_fault+0xc1/0x7b0
    [<0>] __handle_mm_fault+0x2fa/0x460
    [<0>] handle_mm_fault+0xa4/0x330
    [<0>] do_user_addr_fault+0x1f4/0x800
    [<0>] exc_page_fault+0x7c/0x1e0
    [<0>] asm_exc_page_fault+0x26/0x30
    [<0>] rep_movs_alternative+0x33/0x70
    [<0>] _copy_to_user+0x49/0x70
    [<0>] fiemap_fill_next_extent+0xc8/0x120
    [<0>] emit_fiemap_extent+0x4d/0xa0
    [<0>] extent_fiemap+0x7f8/0xad0
    [<0>] btrfs_fiemap+0x49/0x80
    [<0>] __x64_sys_ioctl+0x3e1/0xb50
    [<0>] do_syscall_64+0x94/0x1a0
    [<0>] entry_SYSCALL_64_after_hwframe+0x6e/0x76
    
    I wrote an fstest to reproduce this deadlock without my replacement lock
    and verified that the deadlock exists with our existing locking.
    
    To fix this simply don't take the extent lock for the entire duration of
    the fiemap.  This is safe in general because we keep track of where we
    are when we're searching the tree, so if an ordered extent updates in
    the middle of our fiemap call we'll still emit the correct extents
    because we know what offset we were on before.
    
    The only place we maintain the lock is searching delalloc.  Since the
    delalloc stuff can change during writeback we want to lock the extent
    range so we have a consistent view of delalloc at the time we're
    checking to see if we need to set the delalloc flag.
    
    With this patch applied we no longer deadlock with my testcase.
    
    CC: stable@vger.kernel.org # 6.1+
    Reviewed-by: Filipe Manana <fdmanana@suse.com>
    Signed-off-by: Josef Bacik <josef@toxicpanda.com>
    Reviewed-by: David Sterba <dsterba@suse.com>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit e42b9d8b9ea2672811285e6a7654887ff64d23f3
Author: Qu Wenruo <wqu@suse.com>
Date:   Wed Feb 7 10:00:42 2024 +1030

    btrfs: defrag: avoid unnecessary defrag caused by incorrect extent size
    
    [BUG]
    With the following file extent layout, defrag would do unnecessary IO
    and result more on-disk space usage.
    
      # mkfs.btrfs -f $dev
      # mount $dev $mnt
      # xfs_io -f -c "pwrite 0 40m" $mnt/foobar
      # sync
      # xfs_io -f -c "pwrite 40m 16k" $mnt/foobar
      # sync
    
    Above command would lead to the following file extent layout:
    
            item 6 key (257 EXTENT_DATA 0) itemoff 15816 itemsize 53
                    generation 7 type 1 (regular)
                    extent data disk byte 298844160 nr 41943040
                    extent data offset 0 nr 41943040 ram 41943040
                    extent compression 0 (none)
            item 7 key (257 EXTENT_DATA 41943040) itemoff 15763 itemsize 53
                    generation 8 type 1 (regular)
                    extent data disk byte 13631488 nr 16384
                    extent data offset 0 nr 16384 ram 16384
                    extent compression 0 (none)
    
    Which is mostly fine. We can allow the final 16K to be merged with the
    previous 40M, but it's upon the end users' preference.
    
    But if we defrag the file using the default parameters, it would result
    worse file layout:
    
     # btrfs filesystem defrag $mnt/foobar
     # sync
    
            item 6 key (257 EXTENT_DATA 0) itemoff 15816 itemsize 53
                    generation 7 type 1 (regular)
                    extent data disk byte 298844160 nr 41943040
                    extent data offset 0 nr 8650752 ram 41943040
                    extent compression 0 (none)
            item 7 key (257 EXTENT_DATA 8650752) itemoff 15763 itemsize 53
                    generation 9 type 1 (regular)
                    extent data disk byte 340787200 nr 33292288
                    extent data offset 0 nr 33292288 ram 33292288
                    extent compression 0 (none)
            item 8 key (257 EXTENT_DATA 41943040) itemoff 15710 itemsize 53
                    generation 8 type 1 (regular)
                    extent data disk byte 13631488 nr 16384
                    extent data offset 0 nr 16384 ram 16384
                    extent compression 0 (none)
    
    Note the original 40M extent is still there, but a new 32M extent is
    created for no benefit at all.
    
    [CAUSE]
    There is an existing check to make sure we won't defrag a large enough
    extent (the threshold is by default 32M).
    
    But the check is using the length to the end of the extent:
    
            range_len = em->len - (cur - em->start);
    
            /* Skip too large extent */
            if (range_len >= extent_thresh)
                    goto next;
    
    This means, for the first 8MiB of the extent, the range_len is always
    smaller than the default threshold, and would not be defragged.
    But after the first 8MiB, the remaining part would fit the requirement,
    and be defragged.
    
    Such different behavior inside the same extent caused the above problem,
    and we should avoid different defrag decision inside the same extent.
    
    [FIX]
    Instead of using @range_len, just use @em->len, so that we have a
    consistent decision among the same file extent.
    
    Now with this fix, we won't touch the extent, thus not making it any
    worse.
    
    Reported-by: Filipe Manana <fdmanana@suse.com>
    Fixes: 0cb5950f3f3b ("btrfs: fix deadlock when reserving space during defrag")
    CC: stable@vger.kernel.org # 6.1+
    Reviewed-by: Boris Burkov <boris@bur.io>
    Reviewed-by: Filipe Manana <fdmanana@suse.com>
    Signed-off-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit c0ec2a712daf133d9996a8a1b7ee2d4996080363
Author: zhenwei pi <pizhenwei@bytedance.com>
Date:   Tue Jan 30 19:27:40 2024 +0800

    crypto: virtio/akcipher - Fix stack overflow on memcpy
    
    sizeof(struct virtio_crypto_akcipher_session_para) is less than
    sizeof(struct virtio_crypto_op_ctrl_req::u), copying more bytes from
    stack variable leads stack overflow. Clang reports this issue by
    commands:
    make -j CC=clang-14 mrproper >/dev/null 2>&1
    make -j O=/tmp/crypto-build CC=clang-14 allmodconfig >/dev/null 2>&1
    make -j O=/tmp/crypto-build W=1 CC=clang-14 drivers/crypto/virtio/
      virtio_crypto_akcipher_algs.o
    
    Fixes: 59ca6c93387d ("virtio-crypto: implement RSA algorithm")
    Link: https://lore.kernel.org/all/0a194a79-e3a3-45e7-be98-83abd3e1cb7e@roeck-us.net/
    Cc: <stable@vger.kernel.org>
    Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
    Tested-by: Nathan Chancellor <nathan@kernel.org> # build
    Acked-by: Michael S. Tsirkin <mst@redhat.com>
    Acked-by: Jason Wang <jasowang@redhat.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

