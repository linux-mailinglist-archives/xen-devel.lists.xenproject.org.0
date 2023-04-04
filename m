Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B46D55BE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 03:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517616.803225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjVCX-0001qv-N4; Tue, 04 Apr 2023 01:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517616.803225; Tue, 04 Apr 2023 01:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjVCX-0001p8-JU; Tue, 04 Apr 2023 01:11:09 +0000
Received: by outflank-mailman (input) for mailman id 517616;
 Tue, 04 Apr 2023 01:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjVCW-0001ow-31; Tue, 04 Apr 2023 01:11:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjVCV-0000ix-VQ; Tue, 04 Apr 2023 01:11:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjVCV-00064T-EH; Tue, 04 Apr 2023 01:11:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pjVCV-0006FR-Dj; Tue, 04 Apr 2023 01:11:07 +0000
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
	bh=NGuRm6LRtwdRikEnpctEtxAxJAPOwnanjb4jTii76sI=; b=cEOjz3wxxOzMyX912Cb+XwCiV2
	eBOwdOP6mKtcDnteOJrxrhnASU9qpCGCMEaznPCgue9V8jwufWgfoqcPzYOWtG1S19Yvvmb3+JSYp
	wFYkQa5Do7uMJOkg0uUNVu8pWnt3QYx/Z/+2VMQ2bgijlwPybTwEKnYJohe/kkrKhGXw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180130-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 180130: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-localmigrate:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:guest-start/debian.repeat:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=148341f0a2f53b5e8808d093333d85170586a15d
X-Osstest-Versions-That:
    linux=7e364e56293bb98cae1b55fd835f5991c4e96e7d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Apr 2023 01:11:07 +0000

flight 180130 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180130/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-freebsd12-amd64 17 guest-localmigrate   fail REGR. vs. 180116
 test-amd64-amd64-libvirt-qcow2 19 guest-start/debian.repeat fail REGR. vs. 180116
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 180116

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180116
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180116
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180116
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180116
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180116
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                148341f0a2f53b5e8808d093333d85170586a15d
baseline version:
 linux                7e364e56293bb98cae1b55fd835f5991c4e96e7d

Last test of basis   180116  2023-04-03 02:26:51 Z    0 days
Testing same since   180130  2023-04-03 17:12:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Brauner <brauner@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Michael Kelley <mikelley@microsoft.com>
  Mohammed Gamal <mgamal@redhat.com>
  Wei Liu <wei.liu@kernel.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          starved 
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
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     starved 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      starved 


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
commit 148341f0a2f53b5e8808d093333d85170586a15d
Merge: 2d72ab2449fa cb2239c198ad
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Apr 3 09:41:24 2023 -0700

    Merge tag 'vfs.misc.fixes.v6.3-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping
    
    Pull vfs fix from Christian Brauner:
     "When a mount or mount tree is made shared the vfs allocates new peer
      group ids for all mounts that have no peer group id set. Only mounts
      that aren't marked with MNT_SHARED are relevant here as MNT_SHARED
      indicates that the mount has fully transitioned to a shared mount. The
      peer group id handling is done with namespace lock held.
    
      On failure, the peer group id settings of mounts for which a new peer
      group id was allocated need to be reverted and the allocated peer
      group id freed. The cleanup_group_ids() helper can identify the mounts
      to cleanup by checking whether a given mount has a peer group id set
      but isn't marked MNT_SHARED. The deallocation always needs to happen
      with namespace lock held to protect against concurrent modifications
      of the propagation settings.
    
      This fixes the one place where the namespace lock was dropped before
      calling cleanup_group_ids()"
    
    * tag 'vfs.misc.fixes.v6.3-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping:
      fs: drop peer group ids under namespace lock

commit 2d72ab2449fa9fce8f6898fd5adda10497f7c111
Merge: 7e364e56293b f8acb24aaf89
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Apr 3 09:34:08 2023 -0700

    Merge tag 'hyperv-fixes-signed-20230402' of git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux
    
    Pull hyperv fixes from Wei Liu:
    
     - Fix a bug in channel allocation for VMbus (Mohammed Gamal)
    
     - Do not allow root partition functionality in CVM (Michael Kelley)
    
    * tag 'hyperv-fixes-signed-20230402' of git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux:
      x86/hyperv: Block root partition functionality in a Confidential VM
      Drivers: vmbus: Check for channel allocation before looking up relids

commit cb2239c198ad9fbd5aced22cf93e45562da781eb
Author: Christian Brauner <brauner@kernel.org>
Date:   Thu Mar 30 09:13:16 2023 +0200

    fs: drop peer group ids under namespace lock
    
    When cleaning up peer group ids in the failure path we need to make sure
    to hold on to the namespace lock. Otherwise another thread might just
    turn the mount from a shared into a non-shared mount concurrently.
    
    Link: https://lore.kernel.org/lkml/00000000000088694505f8132d77@google.com
    Fixes: 2a1867219c7b ("fs: add mount_setattr()")
    Reported-by: syzbot+8ac3859139c685c4f597@syzkaller.appspotmail.com
    Cc: stable@vger.kernel.org # 5.12+
    Message-Id: <20230330-vfs-mount_setattr-propagation-fix-v1-1-37548d91533b@kernel.org>
    Signed-off-by: Christian Brauner <brauner@kernel.org>

commit f8acb24aaf89fc46cd953229462ea8abe31b395f
Author: Michael Kelley <mikelley@microsoft.com>
Date:   Wed Mar 15 08:34:13 2023 -0700

    x86/hyperv: Block root partition functionality in a Confidential VM
    
    Hyper-V should never specify a VM that is a Confidential VM and also
    running in the root partition.  Nonetheless, explicitly block such a
    combination to guard against a compromised Hyper-V maliciously trying to
    exploit root partition functionality in a Confidential VM to expose
    Confidential VM secrets. No known bug is being fixed, but the attack
    surface for Confidential VMs on Hyper-V is reduced.
    
    Signed-off-by: Michael Kelley <mikelley@microsoft.com>
    Link: https://lore.kernel.org/r/1678894453-95392-1-git-send-email-mikelley@microsoft.com
    Signed-off-by: Wei Liu <wei.liu@kernel.org>

commit 1eb65c8687316c65140b48fad27133d583178e15
Author: Mohammed Gamal <mgamal@redhat.com>
Date:   Fri Feb 17 22:44:11 2023 +0200

    Drivers: vmbus: Check for channel allocation before looking up relids
    
    relid2channel() assumes vmbus channel array to be allocated when called.
    However, in cases such as kdump/kexec, not all relids will be reset by the host.
    When the second kernel boots and if the guest receives a vmbus interrupt during
    vmbus driver initialization before vmbus_connect() is called, before it finishes,
    or if it fails, the vmbus interrupt service routine is called which in turn calls
    relid2channel() and can cause a null pointer dereference.
    
    Print a warning and error out in relid2channel() for a channel id that's invalid
    in the second kernel.
    
    Fixes: 8b6a877c060e ("Drivers: hv: vmbus: Replace the per-CPU channel lists with a global array of channels")
    
    Signed-off-by: Mohammed Gamal <mgamal@redhat.com>
    Reviewed-by: Dexuan Cui <decui@microsoft.com>
    Link: https://lore.kernel.org/r/20230217204411.212709-1-mgamal@redhat.com
    Signed-off-by: Wei Liu <wei.liu@kernel.org>

