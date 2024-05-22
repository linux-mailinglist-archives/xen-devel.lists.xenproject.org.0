Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D335C8CBC53
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727254.1131677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9giW-0003v8-Fp; Wed, 22 May 2024 07:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727254.1131677; Wed, 22 May 2024 07:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9giW-0003se-D7; Wed, 22 May 2024 07:48:56 +0000
Received: by outflank-mailman (input) for mailman id 727254;
 Wed, 22 May 2024 07:48:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9giU-0003sU-TR; Wed, 22 May 2024 07:48:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9giU-0007XK-Pi; Wed, 22 May 2024 07:48:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9giU-0004Pb-D3; Wed, 22 May 2024 07:48:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s9giU-0004vi-Cb; Wed, 22 May 2024 07:48:54 +0000
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
	bh=K91Via/UOZWzTXAsa54I0XBHCFR0QDEulnh6sDdrb80=; b=5jGM4SoOgzvGs8pTETHh7Oac41
	clzAmmcON0SCnUpMw+mzMFrGKMQ1/Vwd/2kMU30QkRDZoJ+j7nOKj/v2sAzwvWNwAiPHE01Bnpyhy
	d6k4FtCcPn4NQ8i5BOP4f9VzlhKwwiAA+y4HVmcEv46v5znQd96SOe9Kzj5WFdFo6Iz8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186065-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186065: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=5ad8b6ad9a08abdbc8c57a51a5faaf2ef1afc547
X-Osstest-Versions-That:
    linux=8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 May 2024 07:48:54 +0000

flight 186065 linux-linus real [real]
flight 186071 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186065/
http://logs.test-lab.xenproject.org/osstest/logs/186071/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 186052

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 186052

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt   16 saverestore-support-check fail blocked in 186052
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 186052
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186052
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186052
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186052
 test-armhf-armhf-xl-credit1   8 xen-boot                     fail  like 186052
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186052
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186052
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                5ad8b6ad9a08abdbc8c57a51a5faaf2ef1afc547
baseline version:
 linux                8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6

Last test of basis   186052  2024-05-21 01:42:42 Z    1 days
Testing same since   186065  2024-05-21 16:10:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Al Viro <viro@zeniv.linux.org.uk>
  Christian Brauner <brauner@kernel.org>
  Kent Overstreet <kent.overstreet@linux.dev>
  Linus Torvalds <torvalds@linux-foundation.org>

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
 test-armhf-armhf-xl-credit1                                  fail    
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
commit 5ad8b6ad9a08abdbc8c57a51a5faaf2ef1afc547
Merge: db3d841ac9ed d18a8679581e
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue May 21 08:34:51 2024 -0700

    Merge tag 'pull-set_blocksize' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
    
    Pull vfs blocksize updates from Al Viro:
     "This gets rid of bogus set_blocksize() uses, switches it over
      to be based on a 'struct file *' and verifies that the caller
      has the device opened exclusively"
    
    * tag 'pull-set_blocksize' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs:
      make set_blocksize() fail unless block device is opened exclusive
      set_blocksize(): switch to passing struct file *
      btrfs_get_bdev_and_sb(): call set_blocksize() only for exclusive opens
      swsusp: don't bother with setting block size
      zram: don't bother with reopening - just use O_EXCL for open
      swapon(2): open swap with O_EXCL
      swapon(2)/swapoff(2): don't bother with block size
      pktcdvd: sort set_blocksize() calls out
      bcache_register(): don't bother with set_blocksize()

commit db3d841ac9edb0b98cc002e3b27c0b266ecfe5ba
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue May 21 14:34:43 2024 +0200

    fs/pidfs: make 'lsof' happy with our inode changes
    
    pidfs started using much saner inodes in commit b28ddcc32d8f ("pidfs:
    convert to path_from_stashed() helper"), but that exposed the fact that
    lsof had some knowledge of just how odd our old anon_inode usage was.
    
    For example, legacy anon_inodes hadn't even initialized the inode type
    in the inode mode, so everything had a type of zero.
    
    So sane tools like 'stat' would report these files as "weird file", but
    'lsof' instead used that (together with the name of the link in proc) to
    notice that it's an anonymous inode, and used it to detect pidfd files.
    
    Let's keep our internal new sane inode model, but mask the file type
    bits at 'stat()' time in the getattr() function we already have, and by
    making the dentry name match what lsof expects too.
    
    This keeps our internal models sane, but should make user space see the
    same old odd behavior.
    
    Reported-by: Jiri Slaby <jirislaby@kernel.org>
    Link: https://lore.kernel.org/all/a15b1050-4b52-4740-a122-a4d055c17f11@kernel.org/
    Link: https://github.com/lsof-org/lsof/issues/317
    Cc: Alexander Viro <viro@zeniv.linux.org.uk>
    Cc: Seth Forshee <sforshee@kernel.org>
    Cc: Tycho Andersen <tycho@tycho.pizza>
    Signed-off-by: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit d18a8679581e8d1166b68e211d16c5349ae8c38c
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Thu May 2 17:36:32 2024 -0400

    make set_blocksize() fail unless block device is opened exclusive
    
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit ead083aeeed9df44fab9227e47688f7305c3a233
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Thu Apr 18 00:34:31 2024 -0400

    set_blocksize(): switch to passing struct file *
    
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit b85c42981ac4abeeb15d16437c40f52a8a64787d
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Thu Apr 18 00:21:25 2024 -0400

    btrfs_get_bdev_and_sb(): call set_blocksize() only for exclusive opens
    
    btrfs_get_bdev_and_sb() has two callers - btrfs_open_one_device(),
    which asks for open to be exclusive and btrfs_get_dev_args_from_path(),
    which doesn't.  Currently it does set_blocksize() in all cases.
    
    I'm rather dubious about the need to do set_blocksize() anywhere in btrfs,
    to be honest - there's some access to page cache of underlying block
    devices in there, but it's nowhere near the hot paths, AFAICT.
    
    In any case, btrfs_get_dev_args_from_path() only needs to read
    the on-disk superblock and copy several fields out of it; all
    callers are only interested in devices that are already opened
    and brought into per-filesystem set, so setting the block size
    is redundant for those and actively harmful if we are given
    a pathname of unrelated device.
    
    So we only need btrfs_get_bdev_and_sb() to call set_blocksize()
    when it's asked to open exclusive.
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit b1439b179d351977641a1df9745a24d08693f9d4
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Wed Apr 17 18:38:38 2024 -0400

    swsusp: don't bother with setting block size
    
    same as with the swap...
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit ebb0173df2015187bacf704d16a95119d4bc306d
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sun Apr 28 18:55:47 2024 -0400

    zram: don't bother with reopening - just use O_EXCL for open
    
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit 51d908b3db0e588aeb2d06df37e4df3fb1754bb5
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Wed Apr 17 18:33:34 2024 -0400

    swapon(2): open swap with O_EXCL
    
    ... eliminating the need to reopen block devices so they could be
    exclusively held.
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit 798cb7f9aec35460c383eab57b9fa474d999a2eb
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Wed Apr 17 18:26:54 2024 -0400

    swapon(2)/swapoff(2): don't bother with block size
    
    once upon a time that used to matter; these days we do swap IO for
    swap devices at the level that doesn't give a damn about block size,
    buffer_head or anything of that sort - just attach the page to
    bio, set the location and size (the latter to PAGE_SIZE) and feed
    into queue.
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit 3a52c03d1ece8f480d6a6c35d92f7c1c6215d2a6
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Wed Apr 17 00:28:03 2024 -0400

    pktcdvd: sort set_blocksize() calls out
    
    1) it doesn't make any sense to have ->open() call set_blocksize() on the
    device being opened - the caller will override that anyway.
    
    2) setting block size on underlying device, OTOH, ought to be done when
    we are opening it exclusive - i.e. as part of pkt_open_dev().  Having
    it done at setup time doesn't guarantee us anything about the state
    at the time we start talking to it.  Worse, if you happen to have
    the underlying device containing e.g. ext2 with 4Kb blocks that
    is currently mounted r/o, that set_blocksize() will confuse the hell
    out of filesystem.
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

commit af63dd715a5c6b66bbd1485c2189b92c1a3fba41
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Tue Apr 16 20:12:47 2024 -0400

    bcache_register(): don't bother with set_blocksize()
    
    We are not using __bread() anymore and read_cache_page_gfp() doesn't
    care about block size.  Moreover, we should *not* change block
    size on a device that is currently held exclusive - filesystems
    that use buffer cache expect the block numbers to be interpreted
    in units set by filesystem.
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Christian Brauner <brauner@kernel.org>
    ACKed-by: Kent Overstreet <kent.overstreet@linux.dev>
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

