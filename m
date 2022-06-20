Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6E551148
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352511.579289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bf2-0008WP-H7; Mon, 20 Jun 2022 07:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352511.579289; Mon, 20 Jun 2022 07:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bf2-0008Ta-DS; Mon, 20 Jun 2022 07:17:24 +0000
Received: by outflank-mailman (input) for mailman id 352511;
 Mon, 20 Jun 2022 07:17:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o3Bf1-0008TQ-6B; Mon, 20 Jun 2022 07:17:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o3Bf1-0005yU-10; Mon, 20 Jun 2022 07:17:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o3Bf0-00024t-ML; Mon, 20 Jun 2022 07:17:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o3Bf0-0001yV-Lv; Mon, 20 Jun 2022 07:17:22 +0000
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
	bh=yAMKyPKmj63d6nUqvYE4OPKFz91qXV1Ka5sGivQghfg=; b=GwsBKDM2YmhPdmnZKFrzeEEYGk
	at+Iq0LWqym/nuAcqspANy04gX4UkJ8AYY6Rdo4qsoKzNrl2MLKoRboQs3aByBjrrSN6vcsjG4l4r
	fT73Z2AAq+24c2K/eIENeMK0o9xjZz/3SzJ4ZIhN3YnYSLXIu1D4ftJS9O7/nrIiH2xE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171282-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 171282: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-i386-xl-shadow:xen-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:xen-install:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=c8b2d413761af732a0798d8df45ce968732083fe
X-Osstest-Versions-That:
    qemuu=a28498b1f9591e12dcbfdf06dc8f54e15926760e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Jun 2022 07:17:22 +0000

flight 171282 qemu-mainline real [real]
flight 171287 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/171282/
http://logs.test-lab.xenproject.org/osstest/logs/171287/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-shadow     7 xen-install              fail REGR. vs. 171256

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt       7 xen-install                  fail  like 171256
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171256
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171256
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171256
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171256
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171256
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171256
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171256
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171256
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                c8b2d413761af732a0798d8df45ce968732083fe
baseline version:
 qemuu                a28498b1f9591e12dcbfdf06dc8f54e15926760e

Last test of basis   171256  2022-06-17 15:58:21 Z    2 days
Testing same since   171282  2022-06-20 00:38:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jung-uk Kim <jkim@FreeBSD.org>
  Kyle Evans <kevans@FreeBSD.org>
  Richard Henderson <richard.henderson@linaro.org>
  Stacey Son <sson@FreeBSD.org>
  Warner Losh <imp@bsdimp.com>

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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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
commit c8b2d413761af732a0798d8df45ce968732083fe
Merge: a28498b1f9 d35020ed00
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sun Jun 19 13:56:13 2022 -0700

    Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging
    
    bsd-user: Next round of syscalls
    
    Implement the next round of system calls. These are open, openat, close,
    fdatasync, fsync, close_from, revoke, access, eacccess, facccessat, chdir,
    fchdir, rename, renameat, mkdir, mkdirat, rmdir, _getcwd, dup, dup2, truncate,
    ftruncate, acct and sync. In addition, the helper functions needed for these to
    work are included. With the helper functions, all of these system calls are the
    'obvious' wrapper...
    
    # -----BEGIN PGP SIGNATURE-----
    # Comment: GPGTools - https://gpgtools.org
    #
    # iQIzBAABCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmKvZSwACgkQbBzRKH2w
    # EQCrdxAA0UeXmh/l1znPSrX4lif7Vhe4H5TdmHavGQX0p7B+dMd160SMLfKFJt7J
    # HHXuQZbPFNuwqE5qiFPTcXIFjT5tq2WSjd9ZC/ZexfzBJIICwcUWuWvG2WfCA3fD
    # hth/Ru2fX0vUwoUwvYw7lTPnhb9o52Z1rf5AEFu85E3UjKWEcARHCakm7n8a+Cg+
    # PkF1qZ/qFic+bkBZkZLWyHB5qR2p2sIp+VHwlG1ew39Xim457kynQOoF8etIXc1Y
    # g5PrjePUsVhPR7qm4CFplM4UOyGOOqIykHERppaXKtk2+kP8dp9HWog9Z/IFVOKc
    # z3huDtf03UtmohjdJBYkpCcCzmd2EETRPgkFaVT5ciVGMb3Nom1b2/DOnndpS9qb
    # TdE7J6Ek1vp4Mr386QHzm6AfdoHGZc4tH+SpDQZrsWbnugklYnQd3++GCqj8D2rA
    # LJ8oWInviZP8xWDn5q1sXCNw/lgVup9ZNrMl7TcXmQDZXHSW1tElIAT2PZCebman
    # rSwg/umr7fPOXdIAkLhF77bAt3J3kAzxhuYwHEstB3kRXEJ2VinLMf3BJBrGLnuK
    # kr6kJy6hw7luIT5nUNLrrNtwsAAwEu6S7OSGhEiGaUSIhiER96k/tX2u/KOBtwGC
    # VzIP7vK5V2xYPepyj4tXkVRHkjxxw3s8fYRXf73IsaZ6Avot8pg=
    # =JmJY
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Sun 19 Jun 2022 11:04:28 AM PDT
    # gpg:                using RSA key 2035F894B00AA3CF7CCDE1B76C1CD1287DB01100
    # gpg: Good signature from "Warner Losh <wlosh@netflix.com>" [unknown]
    # gpg:                 aka "Warner Losh <imp@bsdimp.com>" [unknown]
    # gpg:                 aka "Warner Losh <imp@freebsd.org>" [unknown]
    # gpg:                 aka "Warner Losh <imp@village.org>" [unknown]
    # gpg:                 aka "Warner Losh <wlosh@bsdimp.com>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 2035 F894 B00A A3CF 7CCD  E1B7 6C1C D128 7DB0 1100
    
    * tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user:
      bsd-user: Implement acct and sync
      bsd-user: Implement trunctate and ftruncate
      bsd-user: Implement dup and dup2
      bsd-user: Implement rmdir and undocumented __getcwd
      bsd-user: Implement mkdir and mkdirat
      bsd-user: Implement link, linkat, unlink and unlinkat
      bsd-user: Implement rename and renameat
      bsd-user: Implement chdir and fchdir
      bsd-user: Implement revoke, access, eaccess and faccessat
      bsd-user: Implement fdatasync, fsync and close_from
      bsd-user: Implement open, openat and close
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit d35020ed00b1cb649ccd73ba4f5e918a5cc5363a
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 09:31:18 2022 -0600

    bsd-user: Implement acct and sync
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit 4b795b147b4b0eee01f24664f630411dde8ed872
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 09:29:02 2022 -0600

    bsd-user: Implement trunctate and ftruncate
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit a15699acafd5cf9e4c414505a4aa36b0f2338ee8
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 09:27:19 2022 -0600

    bsd-user: Implement dup and dup2
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit 6af8f76a9f2c7b4d1ac5ba885695d8b6cc7c4dd0
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 08:23:57 2022 -0600

    bsd-user: Implement rmdir and undocumented __getcwd
    
    Implemenet rmdir and __getcwd. __getcwd is the undocumented
    back end to getcwd(3).
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit 1ffbd5e7feae239aa2d6d986f086c57a5835720a
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 08:21:01 2022 -0600

    bsd-user: Implement mkdir and mkdirat
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit 2d3b7e01d6ba9f6dcb86782484da42766ef7fef0
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 08:18:48 2022 -0600

    bsd-user: Implement link, linkat, unlink and unlinkat
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit ab5fd2d969855be6a0355e55d21b51c676f7b1b6
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 08:16:46 2022 -0600

    bsd-user: Implement rename and renameat
    
    Plus the helper LOCK_PATH2 and UNLOCK_PATH2 macros.
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit 390f547ea80d6758099a867669e6429d511d9c88
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 08:13:34 2022 -0600

    bsd-user: Implement chdir and fchdir
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit 65c6c4c893a29cf5c2eef48ab92ef4f04f31576f
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 08:11:30 2022 -0600

    bsd-user: Implement revoke, access, eaccess and faccessat
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit a2ba6c7b80b6aa1c6e33af778c6a9c8d99c7520e
Author: Warner Losh <imp@bsdimp.com>
Date:   Sun Jun 12 08:07:39 2022 -0600

    bsd-user: Implement fdatasync, fsync and close_from
    
    Implement fdatasync(2), fsync(2) and close_from(2).
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

commit 77d3522b3fb6da9f39ada61fe7c2d0121c10de7f
Author: Warner Losh <imp@bsdimp.com>
Date:   Sat Jun 11 21:32:19 2022 -0600

    bsd-user: Implement open, openat and close
    
    Add the open, openat and close system calls. We need to lock paths, so
    implmenent that as well.
    
    Signed-off-by: Stacey Son <sson@FreeBSD.org>
    Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
    Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
    Signed-off-by: Warner Losh <imp@bsdimp.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

