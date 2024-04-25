Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A283F8B1882
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 03:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711765.1111997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzo4A-0004qA-Gb; Thu, 25 Apr 2024 01:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711765.1111997; Thu, 25 Apr 2024 01:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzo4A-0004oG-DZ; Thu, 25 Apr 2024 01:38:26 +0000
Received: by outflank-mailman (input) for mailman id 711765;
 Thu, 25 Apr 2024 01:38:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzo49-0004o6-1u; Thu, 25 Apr 2024 01:38:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzo48-000718-TM; Thu, 25 Apr 2024 01:38:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzo48-0003m6-6A; Thu, 25 Apr 2024 01:38:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzo48-00049S-5C; Thu, 25 Apr 2024 01:38:24 +0000
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
	bh=M0qlg9uILudNVIh4YMaHWxqtWJDuWn6rEmzTk/9Lhn0=; b=3pSph48NPcWcOf9Uuw52qj9GTp
	pSGSr/YGPC1c3hkgGtf1sE7NgEkMLMB/zAWs4nSp/4c4Xm2ssnuYDEkTq9cXXhoWYHg5hi41C+i0h
	+MpQiW6Ti6YLs7dbiH9iPPN3Ge5J9qKF1ycYw/rqx/rewgz4Tqa4OZCK4t9PuUWrEmUc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185785-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185785: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start/freebsd.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9d1ddab261f3e2af7c384dc02238784ce0cf9f98
X-Osstest-Versions-That:
    linux=71b1543c83d65af8215d7558d70fc2ecbee77dcf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Apr 2024 01:38:24 +0000

flight 185785 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185785/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-raw       8 xen-boot                 fail REGR. vs. 185768
 test-armhf-armhf-libvirt-vhd  8 xen-boot                 fail REGR. vs. 185768

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot         fail in 185779 pass in 185785
 test-armhf-armhf-xl-credit1   8 xen-boot         fail in 185779 pass in 185785
 test-armhf-armhf-xl           8 xen-boot                   fail pass in 185779
 test-amd64-amd64-qemuu-freebsd12-amd64 21 guest-start/freebsd.repeat fail pass in 185779

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl         15 migrate-support-check fail in 185779 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 185779 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185768
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185768
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185768
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185768
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185768
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185768
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                9d1ddab261f3e2af7c384dc02238784ce0cf9f98
baseline version:
 linux                71b1543c83d65af8215d7558d70fc2ecbee77dcf

Last test of basis   185768  2024-04-23 07:46:10 Z    1 days
Testing same since   185779  2024-04-24 00:13:50 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Howells <dhowells@redhat.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Steve French <stfrench@microsoft.com>
  Takayuki Nagata <tnagata@redhat.com>
  Tom Talpey <tom@talpey.com>

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
 test-armhf-armhf-xl                                          fail    
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
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
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
 test-armhf-armhf-xl-raw                                      fail    
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
commit 9d1ddab261f3e2af7c384dc02238784ce0cf9f98
Merge: 71b1543c83d6 77d8aa79ecfb
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Apr 23 09:37:32 2024 -0700

    Merge tag '6.9-rc5-smb-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
    
    Pull smb client fixes from Steve French:
    
     - fscache fix
    
     - fix for case where we could use uninitialized lease
    
     - add tracepoint for debugging refcounting of tcon
    
     - fix mount option regression (e.g. forceuid vs. noforceuid when uid=
       specified) caused by conversion to the new mount API
    
    * tag '6.9-rc5-smb-client-fixes' of git://git.samba.org/sfrench/cifs-2.6:
      cifs: reinstate original behavior again for forceuid/forcegid
      smb: client: fix rename(2) regression against samba
      cifs: Add tracing for the cifs_tcon struct refcounting
      cifs: Fix reacquisition of volume cookie on still-live connection

commit 77d8aa79ecfb209308e0644c02f655122b31def7
Author: Takayuki Nagata <tnagata@redhat.com>
Date:   Mon Apr 15 16:47:49 2024 +0900

    cifs: reinstate original behavior again for forceuid/forcegid
    
    forceuid/forcegid should be enabled by default when uid=/gid= options are
    specified, but commit 24e0a1eff9e2 ("cifs: switch to new mount api")
    changed the behavior. Due to the change, a mounted share does not show
    intentional uid/gid for files and directories even though uid=/gid=
    options are specified since forceuid/forcegid are not enabled.
    
    This patch reinstates original behavior that overrides uid/gid with
    specified uid/gid by the options.
    
    Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
    Signed-off-by: Takayuki Nagata <tnagata@redhat.com>
    Acked-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>
    Acked-by: Ronnie Sahlberg <lsahlber@redhat.com>
    Acked-by: Tom Talpey <tom@talpey.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

commit 18d86965e31f9be4d477da0744a7cdc9815858de
Author: Paulo Alcantara <pc@manguebit.com>
Date:   Fri Apr 19 12:05:07 2024 -0300

    smb: client: fix rename(2) regression against samba
    
    After commit 2c7d399e551c ("smb: client: reuse file lease key in
    compound operations") the client started reusing lease keys for
    rename, unlink and set path size operations to prevent it from
    breaking its own leases and thus causing unnecessary lease breaks to
    same connection.
    
    The implementation relies on positive dentries and
    cifsInodeInfo::lease_granted to decide whether reusing lease keys for
    the compound requests.  cifsInodeInfo::lease_granted was introduced by
    commit 0ab95c2510b6 ("Defer close only when lease is enabled.") to
    indicate whether lease caching is granted for a specific file, but
    that can only happen until file is open, so
    cifsInodeInfo::lease_granted was left uninitialised in ->alloc_inode
    and then client started sending random lease keys for files that
    hadn't any leases.
    
    This fixes the following test case against samba:
    
    mount.cifs //srv/share /mnt/1 -o ...,nosharesock
    mount.cifs //srv/share /mnt/2 -o ...,nosharesock
    touch /mnt/1/foo; tail -f /mnt/1/foo & pid=$!
    mv /mnt/2/foo /mnt/2/bar # fails with -EIO
    kill $pid
    
    Fixes: 0ab95c2510b6 ("Defer close only when lease is enabled.")
    Signed-off-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

commit afc23febd51c7e24361e3a9c09f3e892eb0a41ea
Author: David Howells <dhowells@redhat.com>
Date:   Thu Apr 4 13:51:36 2024 +0100

    cifs: Add tracing for the cifs_tcon struct refcounting
    
    Add tracing for the refcounting/lifecycle of the cifs_tcon struct, marking
    different events with different labels and giving each tcon its own debug
    ID so that the tracelines corresponding to individual tcons can be
    distinguished.  This can be enabled with:
    
            echo 1 >/sys/kernel/debug/tracing/events/cifs/smb3_tcon_ref/enable
    
    Signed-off-by: David Howells <dhowells@redhat.com>
    Acked-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>
    cc: Shyam Prasad N <nspmangalore@gmail.com>
    cc: linux-cifs@vger.kernel.org
    cc: linux-fsdevel@vger.kernel.org
    Signed-off-by: Steve French <stfrench@microsoft.com>

commit dad80c6bff770d25f67ec25fe011730e4a463008
Author: David Howells <dhowells@redhat.com>
Date:   Thu Apr 4 16:05:19 2024 +0100

    cifs: Fix reacquisition of volume cookie on still-live connection
    
    During mount, cifs_mount_get_tcon() gets a tcon resource connection record
    and then attaches an fscache volume cookie to it.  However, it does this
    irrespective of whether or not the tcon returned from cifs_get_tcon() is a
    new record or one that's already in use.  This leads to a warning about a
    volume cookie collision and a leaked volume cookie because tcon->fscache
    gets reset.
    
    Fix this be adding a mutex and a "we've already tried this" flag and only
    doing it once for the lifetime of the tcon.
    
    [!] Note: Looking at cifs_mount_get_tcon(), a more general solution may
    actually be required.  Reacquiring the volume cookie isn't the only thing
    that function does: it also partially reinitialises the tcon record without
    any locking - which may cause live filesystem ops already using the tcon
    through a previous mount to malfunction.
    
    This can be reproduced simply by something like:
    
        mount //example.com/test /xfstest.test -o user=shares,pass=xxx,fsc
        mount //example.com/test /mnt -o user=shares,pass=xxx,fsc
    
    Fixes: 70431bfd825d ("cifs: Support fscache indexing rewrite")
    Signed-off-by: David Howells <dhowells@redhat.com>
    Acked-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>
    cc: Shyam Prasad N <sprasad@microsoft.com>
    cc: linux-cifs@vger.kernel.org
    cc: linux-fsdevel@vger.kernel.org
    Signed-off-by: Steve French <stfrench@microsoft.com>

