Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1D92D2A2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 15:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756951.1165687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRXEv-0004Iy-Ln; Wed, 10 Jul 2024 13:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756951.1165687; Wed, 10 Jul 2024 13:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRXEv-0004Gf-Hv; Wed, 10 Jul 2024 13:20:09 +0000
Received: by outflank-mailman (input) for mailman id 756951;
 Wed, 10 Jul 2024 13:20:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRXEu-0004GV-5u; Wed, 10 Jul 2024 13:20:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRXEt-0002Fc-Td; Wed, 10 Jul 2024 13:20:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRXEt-0004ug-Gc; Wed, 10 Jul 2024 13:20:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sRXEt-0000WU-G3; Wed, 10 Jul 2024 13:20:07 +0000
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
	bh=QkpSLB/+ghKH0QQ0yXIv8LXmObpiCI8+rrEOr2rQ46Y=; b=oFbjhyNQ+2WxiMxKNA+wXLpfWA
	f8kwHrq4Qa6JxN1hteIAS26vHM/tpyYjZErkOG25/83vrHAUNMnHz0CSPuAAFY+rMq/S0PkQ5it/Y
	sF6qKOsJntijmc6/rYj/xZjRXtE3ckIeXhy4tFGm/IrYeQ0OwnNZEsl5IC3esqy5g+Zg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186749-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186749: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=34afb82a3c67f869267a26f593b6f8fc6bf35905
X-Osstest-Versions-That:
    linux=256abd8e550ce977b728be79a74e1729438b4948
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jul 2024 13:20:07 +0000

flight 186749 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186749/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-qcow2     8 xen-boot                 fail REGR. vs. 186727

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-examine      8 reboot           fail in 186742 pass in 186749
 test-armhf-armhf-xl-credit1   8 xen-boot         fail in 186742 pass in 186749
 test-armhf-armhf-xl-credit2   8 xen-boot                   fail pass in 186742
 test-armhf-armhf-libvirt      8 xen-boot                   fail pass in 186742

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 186727

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 186742 like 186727
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 186742 never pass
 test-armhf-armhf-xl         15 migrate-support-check fail in 186742 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 186742 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 186742 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 186742 never pass
 test-armhf-armhf-xl           8 xen-boot                     fail  like 186727
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186727
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186727
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186727
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186727
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186727
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                34afb82a3c67f869267a26f593b6f8fc6bf35905
baseline version:
 linux                256abd8e550ce977b728be79a74e1729438b4948

Last test of basis   186727  2024-07-08 04:15:50 Z    2 days
Failing since        186734  2024-07-08 22:12:02 Z    1 days    4 attempts
Testing same since   186742  2024-07-09 16:12:19 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Gordeev <agordeev@linux.ibm.com>
  Andrei Vagin <avagin@google.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hobin Woo <hobin.woo@samsung.com>
  Ian Rogers <irogers@google.com>
  John Hubbard <jhubbard@nvidia.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Matt Fleming <matt@readmodwrite.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Namhyung Kim <namhyung@kernel.org>
  Namjae Jeon <linkinjeon@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Steve French <stfrench@microsoft.com>
  Yoonho Shin <yoonho.shin@samsung.com>

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
 test-armhf-armhf-libvirt                                     fail    
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
commit 34afb82a3c67f869267a26f593b6f8fc6bf35905
Merge: 920bc844baa9 e2e33caa5dc2
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jul 9 08:16:18 2024 -0700

    Merge tag '6.10-rc6-smb3-server-fixes' of git://git.samba.org/ksmbd
    
    Pull smb server fixes from Steve French:
    
     - fix access flags to address fuse incompatibility
    
     - fix device type returned by get filesystem info
    
    * tag '6.10-rc6-smb3-server-fixes' of git://git.samba.org/ksmbd:
      ksmbd: discard write access to the directory open
      ksmbd: return FILE_DEVICE_DISK instead of super magic

commit 920bc844baa92fe508d9cb7c72765d6f54dfebe1
Merge: b5efb63acf7b 66cde337fa1b
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jul 9 08:11:39 2024 -0700

    Merge tag 'linux_kselftest-fixes-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
    
    Pull kselftest fixes from Shuah Khan
     "Fixes to clang build failures to timerns, vDSO tests and fixes to vDSO
      makefile"
    
    * tag 'linux_kselftest-fixes-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
      selftests/vDSO: remove duplicate compiler invocations from Makefile
      selftests/vDSO: remove partially duplicated "all:" target in Makefile
      selftests/vDSO: fix clang build errors and warnings
      selftest/timerns: fix clang build failures for abs() calls

commit b5efb63acf7bddaf20eacfcac654c25c446eabe8
Author: Heiko Carstens <hca@linux.ibm.com>
Date:   Tue Jul 9 08:50:56 2024 +0200

    s390/mm: Add NULL pointer check to crst_table_free() base_crst_free()
    
    crst_table_free() used to work with NULL pointers before the conversion
    to ptdescs.  Since crst_table_free() can be called with a NULL pointer
    (error handling in crst_table_upgrade() add an explicit check.
    
    Also add the same check to base_crst_free() for consistency reasons.
    
    In real life this should not happen, since order two GFP_KERNEL
    allocations will not fail, unless FAIL_PAGE_ALLOC is enabled and used.
    
    Reported-by: Yunseong Kim <yskelg@gmail.com>
    Fixes: 6326c26c1514 ("s390: convert various pgalloc functions to use ptdescs")
    Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
    Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
    Cc: stable@kernel.org
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 4376e966ecb78c520b0faf239d118ecfab42a119
Merge: 256abd8e550c 7b2450bb4027
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Jul 8 14:08:43 2024 -0700

    Merge tag 'perf-tools-fixes-for-v6.10-2024-07-08' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
    
    Pull perf tools fixes from Namhyung Kim:
     "Fix performance issue for v6.10
    
      These address the performance issues reported by Matt, Namhyung and
      Linus. Recently perf changed the processing of the comm string and DSO
      using sorted arrays but this caused it to sort the array whenever
      adding a new entry.
    
      This caused a performance issue and the fix is to enhance the sorting
      by finding the insertion point in the sorted array and to shift
      righthand side using memmove()"
    
    * tag 'perf-tools-fixes-for-v6.10-2024-07-08' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools:
      perf dsos: When adding a dso into sorted dsos maintain the sort order
      perf comm str: Avoid sort during insert

commit 7b2450bb40275802b73593331b0db2fc147ae2b7
Author: Ian Rogers <irogers@google.com>
Date:   Wed Jul 3 10:21:17 2024 -0700

    perf dsos: When adding a dso into sorted dsos maintain the sort order
    
    dsos__add would add at the end of the dso array possibly requiring a
    later find to re-sort the array. Patterns of find then add were
    becoming O(n*log n) due to the sorts. Change the add routine to be
    O(n) rather than O(1) but to maintain the sorted-ness of the dsos
    array so that later finds don't need the O(n*log n) sort.
    
    Fixes: 3f4ac23a9908 ("perf dsos: Switch backing storage to array from rbtree/list")
    Reported-by: Namhyung Kim <namhyung@kernel.org>
    Signed-off-by: Ian Rogers <irogers@google.com>
    Cc: Steinar Gunderson <sesse@google.com>
    Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
    Cc: Matt Fleming <matt@readmodwrite.com>
    Link: https://lore.kernel.org/r/20240703172117.810918-3-irogers@google.com
    Signed-off-by: Namhyung Kim <namhyung@kernel.org>

commit 88076e4699ce490aabe89037190d4749ab346b29
Author: Ian Rogers <irogers@google.com>
Date:   Wed Jul 3 10:21:16 2024 -0700

    perf comm str: Avoid sort during insert
    
    The array is sorted, so just move the elements and insert in order.
    
    Fixes: 13ca628716c6 ("perf comm: Add reference count checking to 'struct comm_str'")
    Reported-by: Matt Fleming <matt@readmodwrite.com>
    Signed-off-by: Ian Rogers <irogers@google.com>
    Tested-by: Matt Fleming <matt@readmodwrite.com>
    Cc: Steinar Gunderson <sesse@google.com>
    Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
    Link: https://lore.kernel.org/r/20240703172117.810918-2-irogers@google.com
    Signed-off-by: Namhyung Kim <namhyung@kernel.org>

commit 66cde337fa1b7c6cf31f856fa015bd91a4d383e7
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Fri Jul 5 09:57:36 2024 -1000

    selftests/vDSO: remove duplicate compiler invocations from Makefile
    
    The Makefile open-codes compiler invocations that ../lib.mk already
    provides.
    
    Avoid this by using a Make feature that allows setting per-target
    variables, which in this case are: CFLAGS and LDFLAGS. This approach
    generates the exact same compiler invocations as before, but removes all
    of the code duplication, along with the quirky mangled variable names.
    So now the Makefile is smaller, less unusual, and easier to read.
    
    The new dependencies are listed after including lib.mk, in order to
    let lib.mk provide the first target ("all:"), and are grouped together
    with their respective source file dependencies, for visual clarity.
    
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit bb2a605de3757ec8c39e5706cfac3deed5694228
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Fri Jul 5 09:57:35 2024 -1000

    selftests/vDSO: remove partially duplicated "all:" target in Makefile
    
    There were a couple of errors here:
    
    1. TEST_GEN_PROGS was incorrectly prepending $(OUTPUT) to each program
    to be built. However, lib.mk already does that because it assumes "bare"
    program names are passed in, so this ended up creating
    $(OUTPUT)/$(OUTPUT)/file.c, which of course won't work as intended.
    
    2. lib.mk was included before TEST_GEN_PROGS was set, which led to
    lib.mk's "all:" target not seeing anything to rebuild.
    
    So nothing worked, which caused the author to force things by creating
    an "all:" target locally--while still including ../lib.mk.
    
    Fix all of this by including ../lib.mk at the right place, and removing
    the $(OUTPUT) prefix to the programs to be built, and removing the
    duplicate "all:" target.
    
    Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 73810cd45b99c6c418e1c6a487b52c1e74edb20d
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Fri Jul 5 09:57:34 2024 -1000

    selftests/vDSO: fix clang build errors and warnings
    
    When building with clang, via:
    
        make LLVM=1 -C tools/testing/selftests
    
    ...there are several warnings, and an error. This fixes all of those and
    allows these tests to run and pass.
    
    1. Fix linker error (undefined reference to memcpy) by providing a local
       version of memcpy.
    
    2. clang complains about using this form:
    
        if (g = h & 0xf0000000)
    
    ...so factor out the assignment into a separate step.
    
    3. The code is passing a signed const char* to elf_hash(), which expects
       a const unsigned char *. There are several callers, so fix this at
       the source by allowing the function to accept a signed argument, and
       then converting to unsigned operations, once inside the function.
    
    4. clang doesn't have __attribute__((externally_visible)) and generates
       a warning to that effect. Fortunately, gcc 12 and gcc 13 do not seem
       to require that attribute in order to build, run and pass tests here,
       so remove it.
    
    Reviewed-by: Carlos Llamas <cmllamas@google.com>
    Reviewed-by: Edward Liaw <edliaw@google.com>
    Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
    Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit f76f9bc616b7320df6789241ca7d26cedcf03cf3
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Wed Jul 3 19:52:47 2024 -0700

    selftest/timerns: fix clang build failures for abs() calls
    
    When building with clang, via:
    
        make LLVM=1 -C tools/testing/selftests
    
    ...clang warns about mismatches between the expected and required
    integer length being supplied to abs(3).
    
    Fix this by using the correct variant of abs(3): labs(3) or llabs(3), in
    these cases.
    
    Reviewed-by: Dmitry Safonov <dima@arista.com>
    Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>
    Acked-by: Andrei Vagin <avagin@google.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit e2e33caa5dc2eae7bddf88b22ce11ec3d760e5cd
Author: Hobin Woo <hobin.woo@samsung.com>
Date:   Fri Jul 5 12:27:25 2024 +0900

    ksmbd: discard write access to the directory open
    
    may_open() does not allow a directory to be opened with the write access.
    However, some writing flags set by client result in adding write access
    on server, making ksmbd incompatible with FUSE file system. Simply, let's
    discard the write access when opening a directory.
    
    list_add corruption. next is NULL.
    ------------[ cut here ]------------
    kernel BUG at lib/list_debug.c:26!
    pc : __list_add_valid+0x88/0xbc
    lr : __list_add_valid+0x88/0xbc
    Call trace:
    __list_add_valid+0x88/0xbc
    fuse_finish_open+0x11c/0x170
    fuse_open_common+0x284/0x5e8
    fuse_dir_open+0x14/0x24
    do_dentry_open+0x2a4/0x4e0
    dentry_open+0x50/0x80
    smb2_open+0xbe4/0x15a4
    handle_ksmbd_work+0x478/0x5ec
    process_one_work+0x1b4/0x448
    worker_thread+0x25c/0x430
    kthread+0x104/0x1d4
    ret_from_fork+0x10/0x20
    
    Cc: stable@vger.kernel.org
    Signed-off-by: Yoonho Shin <yoonho.shin@samsung.com>
    Signed-off-by: Hobin Woo <hobin.woo@samsung.com>
    Acked-by: Namjae Jeon <linkinjeon@kernel.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

commit 25a6e135569b3901452e4863c94560df7c11c492
Author: Namjae Jeon <linkinjeon@kernel.org>
Date:   Mon Jun 24 08:39:23 2024 +0900

    ksmbd: return FILE_DEVICE_DISK instead of super magic
    
    MS-SMB2 specification describes setting ->DeviceType to FILE_DEVICE_DISK
    or FILE_DEVICE_CD_ROM. Set FILE_DEVICE_DISK instead of super magic in
    FS_DEVICE_INFORMATION. And Set FILE_READ_ONLY_DEVICE for read-only share.
    
    Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

