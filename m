Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2434A9175
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 01:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264962.458223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFmAT-00035I-So; Fri, 04 Feb 2022 00:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264962.458223; Fri, 04 Feb 2022 00:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFmAT-00031s-OX; Fri, 04 Feb 2022 00:09:37 +0000
Received: by outflank-mailman (input) for mailman id 264962;
 Fri, 04 Feb 2022 00:09:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFmAR-00031i-UI; Fri, 04 Feb 2022 00:09:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFmAR-0001gs-QN; Fri, 04 Feb 2022 00:09:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFmAQ-0000sc-GF; Fri, 04 Feb 2022 00:09:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nFmAQ-0006B9-CM; Fri, 04 Feb 2022 00:09:34 +0000
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
	bh=JIhHLJ6x8KEZcd2OoKgj4ichOg8zk0b61kvwNzlmku8=; b=ik/E9yyjpODtjoqy27incTOhTG
	0AZfLfHzAh9odY1SzvTCrWA78CHNb3+6yYyKesNr+j5kZDeHr/Ztm6k940QCa4dqZ+1CRl5YlC+3v
	P3KG54JShSo9WxnpTc7z6HrwmGum9SCE8ZtT5lTTohy+BHikTwWPkAStA/tSRJShJECQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167993-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167993: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=88808fbbead481aedb46640a5ace69c58287f56a
X-Osstest-Versions-That:
    linux=27bb0b18c208ecd4c0deda6aad28616d73e4133d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Feb 2022 00:09:34 +0000

flight 167993 linux-linus real [real]
flight 168002 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167993/
http://logs.test-lab.xenproject.org/osstest/logs/168002/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 167988

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167988
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167988
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167988
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167988
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167988
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167988
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167988
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167988
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                88808fbbead481aedb46640a5ace69c58287f56a
baseline version:
 linux                27bb0b18c208ecd4c0deda6aad28616d73e4133d

Last test of basis   167988  2022-02-02 18:11:17 Z    1 days
Testing same since   167993  2022-02-03 04:34:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chuck Lever <chuck.lever@oracle.com>
  Dai Ngo <dai.ngo@oracle.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  J. Bruce Fields <bfields@redhat.com>
  Jan Kara <jack@suse.cz>
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
commit 88808fbbead481aedb46640a5ace69c58287f56a
Merge: d5084ffbc50c ab451ea952fe
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Feb 2 10:14:31 2022 -0800

    Merge tag 'nfsd-5.17-1' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
    
    Pull nfsd fixes from Chuck Lever:
     "Notable bug fixes:
    
       - Ensure SM_NOTIFY doesn't crash the NFS server host
    
       - Ensure NLM locks are cleaned up after client reboot
    
       - Fix a leak of internal NFSv4 lease information"
    
    * tag 'nfsd-5.17-1' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux:
      nfsd: nfsd4_setclientid_confirm mistakenly expires confirmed client.
      lockd: fix failure to cleanup client locks
      lockd: fix server crash on reboot of client holding lock

commit d5084ffbc50c76e4a237d87e022e88f6b15b3cb9
Merge: 27bb0b18c208 ee12595147ac
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Feb 2 10:08:52 2022 -0800

    Merge tag 'fsnotify_for_v5.17-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
    
    Pull fanotify fix from Jan Kara:
     "Fix stale file descriptor in copy_event_to_user"
    
    * tag 'fsnotify_for_v5.17-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs:
      fanotify: Fix stale file descriptor in copy_event_to_user()

commit ee12595147ac1fbfb5bcb23837e26dd58d94b15d
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri Jan 28 22:57:01 2022 +0300

    fanotify: Fix stale file descriptor in copy_event_to_user()
    
    This code calls fd_install() which gives the userspace access to the fd.
    Then if copy_info_records_to_user() fails it calls put_unused_fd(fd) but
    that will not release it and leads to a stale entry in the file
    descriptor table.
    
    Generally you can't trust the fd after a call to fd_install().  The fix
    is to delay the fd_install() until everything else has succeeded.
    
    Fortunately it requires CAP_SYS_ADMIN to reach this code so the security
    impact is less.
    
    Fixes: f644bc449b37 ("fanotify: fix copy_event_to_user() fid error clean up")
    Link: https://lore.kernel.org/r/20220128195656.GA26981@kili
    Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
    Reviewed-by: Mathias Krause <minipli@grsecurity.net>
    Signed-off-by: Jan Kara <jack@suse.cz>

commit ab451ea952fe9d7afefae55ddb28943a148247fe
Author: Dai Ngo <dai.ngo@oracle.com>
Date:   Wed Jan 26 13:13:38 2022 -0800

    nfsd: nfsd4_setclientid_confirm mistakenly expires confirmed client.
    
    From RFC 7530 Section 16.34.5:
    
    o  The server has not recorded an unconfirmed { v, x, c, *, * } and
       has recorded a confirmed { v, x, c, *, s }.  If the principals of
       the record and of SETCLIENTID_CONFIRM do not match, the server
       returns NFS4ERR_CLID_INUSE without removing any relevant leased
       client state, and without changing recorded callback and
       callback_ident values for client { x }.
    
    The current code intends to do what the spec describes above but
    it forgot to set 'old' to NULL resulting to the confirmed client
    to be expired.
    
    Fixes: 2b63482185e6 ("nfsd: fix clid_inuse on mount with security change")
    Signed-off-by: Dai Ngo <dai.ngo@oracle.com>
    Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
    Reviewed-by: Bruce Fields <bfields@fieldses.org>

commit d19a7af73b5ecaac8168712d18be72b9db166768
Author: J. Bruce Fields <bfields@redhat.com>
Date:   Tue Jan 18 17:00:51 2022 -0500

    lockd: fix failure to cleanup client locks
    
    In my testing, we're sometimes hitting the request->fl_flags & FL_EXISTS
    case in posix_lock_inode, presumably just by random luck since we're not
    actually initializing fl_flags here.
    
    This probably didn't matter before commit 7f024fcd5c97 ("Keep read and
    write fds with each nlm_file") since we wouldn't previously unlock
    unless we knew there were locks.
    
    But now it causes lockd to give up on removing more locks.
    
    We could just initialize fl_flags, but really it seems dubious to be
    calling vfs_lock_file with random values in some of the fields.
    
    Fixes: 7f024fcd5c97 ("Keep read and write fds with each nlm_file")
    Signed-off-by: J. Bruce Fields <bfields@redhat.com>
    [ cel: fixed checkpatch.pl nit ]
    Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

commit 6e7f90d163afa8fc2efd6ae318e7c20156a5621f
Author: J. Bruce Fields <bfields@redhat.com>
Date:   Tue Jan 18 17:00:16 2022 -0500

    lockd: fix server crash on reboot of client holding lock
    
    I thought I was iterating over the array when actually the iteration is
    over the values contained in the array?
    
    Ugh, keep it simple.
    
    Symptoms were a null deference in vfs_lock_file() when an NFSv3 client
    that previously held a lock came back up and sent a notify.
    
    Reported-by: Jonathan Woithe <jwoithe@just42.net>
    Fixes: 7f024fcd5c97 ("Keep read and write fds with each nlm_file")
    Signed-off-by: J. Bruce Fields <bfields@redhat.com>
    Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

