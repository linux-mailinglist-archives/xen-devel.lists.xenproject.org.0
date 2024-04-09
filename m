Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1789E29E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 20:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702790.1098330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruGHh-0005Yz-K7; Tue, 09 Apr 2024 18:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702790.1098330; Tue, 09 Apr 2024 18:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruGHh-0005Wr-HP; Tue, 09 Apr 2024 18:33:29 +0000
Received: by outflank-mailman (input) for mailman id 702790;
 Tue, 09 Apr 2024 18:33:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruGHg-0005Wh-0A; Tue, 09 Apr 2024 18:33:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruGHf-000713-SQ; Tue, 09 Apr 2024 18:33:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ruGHf-0003Ra-Hs; Tue, 09 Apr 2024 18:33:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ruGHf-0000dW-HR; Tue, 09 Apr 2024 18:33:27 +0000
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
	bh=e40oP1NZEUDGGyi3lPiIRISOUXkfFMFE+a0Rrg5HxAM=; b=Hd0Gxat9kpdcz5zuxvcY5lzde1
	w0Gm2ZeY1I36g/HnyU+4oK+sdPTGtRkEBjXJCnOxYqEFe95xI5ac5TNbpKJYyiADxJU8KGGOfrO//
	4I/Y303Exa5+t+veH7zOwLvm06Kq+kQP9dJ/Mh0KTgiicPCyqGcCPefqECzpb7ReiPKc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185279-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185279: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start/freebsd.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=20cb38a7af88dc40095da7c2c9094da3873fea23
X-Osstest-Versions-That:
    linux=fec50db7033ea478773b159e0e2efb135270e3b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2024 18:33:27 +0000

flight 185279 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185279/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build   fail in 185275 REGR. vs. 185270

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-freebsd11-amd64 21 guest-start/freebsd.repeat fail pass in 185275
 test-armhf-armhf-xl-credit1  18 guest-start/debian.repeat  fail pass in 185275

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-examine      1 build-check(1)           blocked in 185275 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 185275 n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185270
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185270
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185270
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185270
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185270
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185270
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                20cb38a7af88dc40095da7c2c9094da3873fea23
baseline version:
 linux                fec50db7033ea478773b159e0e2efb135270e3b7

Last test of basis   185270  2024-04-07 20:42:12 Z    1 days
Testing same since   185275  2024-04-08 23:43:57 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Boris Burkov <boris@bur.io>
  David Sterba <dsterba@suse.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Wei Yang <richard.weiyang@gmail.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
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
 test-armhf-armhf-xl-qcow2                                    pass    
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
commit 20cb38a7af88dc40095da7c2c9094da3873fea23
Merge: 4f0a8fe3215c 6e68de0bb0ed
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Apr 8 13:11:11 2024 -0700

    Merge tag 'for-6.9-rc2-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
    
    Pull btrfs fixes from David Sterba:
     "Several fixes to qgroups that have been recently identified by test
      generic/475:
    
       - fix prealloc reserve leak in subvolume operations
    
       - various other fixes in reservation setup, conversion or cleanup"
    
    * tag 'for-6.9-rc2-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux:
      btrfs: always clear PERTRANS metadata during commit
      btrfs: make btrfs_clear_delalloc_extent() free delalloc reserve
      btrfs: qgroup: convert PREALLOC to PERTRANS after record_root_in_trans
      btrfs: record delayed inode root in transaction
      btrfs: qgroup: fix qgroup prealloc rsv leak in subvolume operations
      btrfs: qgroup: correctly model root qgroup rsv in convert

commit 4f0a8fe3215c432234baed20eb8210efe1c32b10
Merge: fec50db7033e 592447f6cb3c
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Apr 8 10:11:37 2024 -0700

    Merge tag 'fixes-2024-04-08' of git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
    
    Pull memblock fixes from Mike Rapoport:
     "Fix build errors in memblock tests:
    
       - add stubs to functions that calls to them were recently added to
         memblock but they were missing in tests
    
       - update gfp_types.h to include bits.h so that BIT() definitions
         won't depend on other includes"
    
    * tag 'fixes-2024-04-08' of git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock:
      memblock tests: fix undefined reference to `BIT'
      memblock tests: fix undefined reference to `panic'
      memblock tests: fix undefined reference to `early_pfn_to_nid'

commit 592447f6cb3c20d606d6c5d8e6af68e99707b786
Author: Wei Yang <richard.weiyang@gmail.com>
Date:   Tue Apr 2 13:27:01 2024 +0000

    memblock tests: fix undefined reference to `BIT'
    
    commit 772dd0342727 ("mm: enumerate all gfp flags") define gfp flags
    with the help of BIT, while gfp_types.h doesn't include header file for
    the definition. This through an error on building memblock tests.
    
    Let's include linux/bits.h to fix it.
    
    Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
    CC: Suren Baghdasaryan <surenb@google.com>
    CC: Michal Hocko <mhocko@suse.com>
    Link: https://lore.kernel.org/r/20240402132701.29744-4-richard.weiyang@gmail.com
    Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

commit e0f5a8e74be88f2476e58b25d3b49a9521bdc4ec
Author: Wei Yang <richard.weiyang@gmail.com>
Date:   Tue Apr 2 13:27:00 2024 +0000

    memblock tests: fix undefined reference to `panic'
    
    commit e96c6b8f212a ("memblock: report failures when memblock_can_resize
    is not set") introduced the usage of panic, which is not defined in
    memblock test.
    
    Let's define it directly in panic.h to fix it.
    
    Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
    CC: Song Shuai <songshuaishuai@tinylab.org>
    CC: Mike Rapoport <rppt@kernel.org>
    Link: https://lore.kernel.org/r/20240402132701.29744-3-richard.weiyang@gmail.com
    Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

commit 7d8ed162e6a92268d4b2b84d364a931216102c8e
Author: Wei Yang <richard.weiyang@gmail.com>
Date:   Tue Apr 2 13:26:59 2024 +0000

    memblock tests: fix undefined reference to `early_pfn_to_nid'
    
    commit 6a9531c3a880 ("memblock: fix crash when reserved memory is not
    added to memory") introduce the usage of early_pfn_to_nid, which is not
    defined in memblock tests.
    
    The original definition of early_pfn_to_nid is defined in mm.h, so let
    add this in the corresponding mm.h.
    
    Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
    CC: Yajun Deng <yajun.deng@linux.dev>
    CC: Mike Rapoport <rppt@kernel.org>
    Link: https://lore.kernel.org/r/20240402132701.29744-2-richard.weiyang@gmail.com
    Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

commit 6e68de0bb0ed59e0554a0c15ede7308c47351e2d
Author: Boris Burkov <boris@bur.io>
Date:   Tue Mar 26 12:01:28 2024 -0700

    btrfs: always clear PERTRANS metadata during commit
    
    It is possible to clear a root's IN_TRANS tag from the radix tree, but
    not clear its PERTRANS, if there is some error in between. Eliminate
    that possibility by moving the free up to where we clear the tag.
    
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Boris Burkov <boris@bur.io>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit 3c6f0c5ecc8910d4ffb0dfe85609ebc0c91c8f34
Author: Boris Burkov <boris@bur.io>
Date:   Tue Mar 26 11:55:22 2024 -0700

    btrfs: make btrfs_clear_delalloc_extent() free delalloc reserve
    
    Currently, this call site in btrfs_clear_delalloc_extent() only converts
    the reservation. We are marking it not delalloc, so I don't think it
    makes sense to keep the rsv around.  This is a path where we are not
    sure to join a transaction, so it leads to incorrect free-ing during
    umount.
    
    Helps with the pass rate of generic/269 and generic/475.
    
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Boris Burkov <boris@bur.io>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit 211de93367304ab395357f8cb12568a4d1e20701
Author: Boris Burkov <boris@bur.io>
Date:   Thu Mar 21 10:18:39 2024 -0700

    btrfs: qgroup: convert PREALLOC to PERTRANS after record_root_in_trans
    
    The transaction is only able to free PERTRANS reservations for a root
    once that root has been recorded with the TRANS tag on the roots radix
    tree. Therefore, until we are sure that this root will get tagged, it
    isn't safe to convert. Generally, this is not an issue as *some*
    transaction will likely tag the root before long and this reservation
    will get freed in that transaction, but technically it could stick
    around until unmount and result in a warning about leaked metadata
    reservation space.
    
    This path is most exercised by running the generic/269 fstest with
    CONFIG_BTRFS_DEBUG.
    
    Fixes: a6496849671a ("btrfs: fix start transaction qgroup rsv double free")
    CC: stable@vger.kernel.org # 6.6+
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Boris Burkov <boris@bur.io>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit 71537e35c324ea6fbd68377a4f26bb93a831ae35
Author: Boris Burkov <boris@bur.io>
Date:   Thu Mar 21 10:14:24 2024 -0700

    btrfs: record delayed inode root in transaction
    
    When running delayed inode updates, we do not record the inode's root in
    the transaction, but we do allocate PREALLOC and thus converted PERTRANS
    space for it. To be sure we free that PERTRANS meta rsv, we must ensure
    that we record the root in the transaction.
    
    Fixes: 4f5427ccce5d ("btrfs: delayed-inode: Use new qgroup meta rsv for delayed inode and item")
    CC: stable@vger.kernel.org # 6.1+
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Boris Burkov <boris@bur.io>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit 74e97958121aa1f5854da6effba70143f051b0cd
Author: Boris Burkov <boris@bur.io>
Date:   Thu Mar 21 10:02:04 2024 -0700

    btrfs: qgroup: fix qgroup prealloc rsv leak in subvolume operations
    
    Create subvolume, create snapshot and delete subvolume all use
    btrfs_subvolume_reserve_metadata() to reserve metadata for the changes
    done to the parent subvolume's fs tree, which cannot be mediated in the
    normal way via start_transaction. When quota groups (squota or qgroups)
    are enabled, this reserves qgroup metadata of type PREALLOC. Once the
    operation is associated to a transaction, we convert PREALLOC to
    PERTRANS, which gets cleared in bulk at the end of the transaction.
    
    However, the error paths of these three operations were not implementing
    this lifecycle correctly. They unconditionally converted the PREALLOC to
    PERTRANS in a generic cleanup step regardless of errors or whether the
    operation was fully associated to a transaction or not. This resulted in
    error paths occasionally converting this rsv to PERTRANS without calling
    record_root_in_trans successfully, which meant that unless that root got
    recorded in the transaction by some other thread, the end of the
    transaction would not free that root's PERTRANS, leaking it. Ultimately,
    this resulted in hitting a WARN in CONFIG_BTRFS_DEBUG builds at unmount
    for the leaked reservation.
    
    The fix is to ensure that every qgroup PREALLOC reservation observes the
    following properties:
    
    1. any failure before record_root_in_trans is called successfully
       results in freeing the PREALLOC reservation.
    2. after record_root_in_trans, we convert to PERTRANS, and now the
       transaction owns freeing the reservation.
    
    This patch enforces those properties on the three operations. Without
    it, generic/269 with squotas enabled at mkfs time would fail in ~5-10
    runs on my system. With this patch, it ran successfully 1000 times in a
    row.
    
    Fixes: e85fde5162bf ("btrfs: qgroup: fix qgroup meta rsv leak for subvolume operations")
    CC: stable@vger.kernel.org # 6.1+
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Boris Burkov <boris@bur.io>
    Signed-off-by: David Sterba <dsterba@suse.com>

commit 141fb8cd206ace23c02cd2791c6da52c1d77d42a
Author: Boris Burkov <boris@bur.io>
Date:   Tue Mar 19 10:54:22 2024 -0700

    btrfs: qgroup: correctly model root qgroup rsv in convert
    
    We use add_root_meta_rsv and sub_root_meta_rsv to track prealloc and
    pertrans reservations for subvolumes when quotas are enabled. The
    convert function does not properly increment pertrans after decrementing
    prealloc, so the count is not accurate.
    
    Note: we check that the fs is not read-only to mirror the logic in
    qgroup_convert_meta, which checks that before adding to the pertrans rsv.
    
    Fixes: 8287475a2055 ("btrfs: qgroup: Use root::qgroup_meta_rsv_* to record qgroup meta reserved space")
    CC: stable@vger.kernel.org # 6.1+
    Reviewed-by: Qu Wenruo <wqu@suse.com>
    Signed-off-by: Boris Burkov <boris@bur.io>
    Signed-off-by: David Sterba <dsterba@suse.com>

