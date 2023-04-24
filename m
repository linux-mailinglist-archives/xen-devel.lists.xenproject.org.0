Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8636EC771
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 09:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525173.816206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqzU-00050u-H7; Mon, 24 Apr 2023 07:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525173.816206; Mon, 24 Apr 2023 07:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqzU-0004yE-Do; Mon, 24 Apr 2023 07:52:04 +0000
Received: by outflank-mailman (input) for mailman id 525173;
 Mon, 24 Apr 2023 07:52:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pqqzS-0004xi-Ty; Mon, 24 Apr 2023 07:52:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pqqzS-0003vs-NK; Mon, 24 Apr 2023 07:52:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pqqzS-00047m-7d; Mon, 24 Apr 2023 07:52:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pqqzS-00034O-78; Mon, 24 Apr 2023 07:52:02 +0000
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
	bh=ojyH0WmAkZIkJKne4bL/yxXc4APy0gClDF/ZWv/tkHc=; b=Gn/jRvc4a4gvFjY82V8mF/LidN
	gJs+O4W4QaEYLcm/PpCDWxgKJ1r68vaXeIFULLjC2MVESBwbsTMUbS0h329BCmNk2SIIrWTCrE7Qn
	kfQ3JQbpWdeTVzrbAd5UvoH3MuDT4tkrf/n9BFlwFw/iS/syYW4VDogXm30IpDk9YsQY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180389-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 180389: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:build-arm64-pvops:kernel-build:fail:regression
    qemu-mainline:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:heisenbug
    qemu-mainline:test-amd64-i386-pair:guest-migrate/dst_host/src_host/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=327ec8d6c2a2223b78d311153a471036e474c5c5
X-Osstest-Versions-That:
    qemuu=6dd06214892d71cbbdd25daed7693e58afcb1093
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Apr 2023 07:52:02 +0000

flight 180389 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180389/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build   fail in 180386 REGR. vs. 180382

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-vhd 21 guest-start/debian.repeat fail in 180386 pass in 180389
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start             fail pass in 180386
 test-amd64-i386-pair 28 guest-migrate/dst_host/src_host/debian.repeat fail pass in 180386
 test-amd64-amd64-xl-qcow2    21 guest-start/debian.repeat  fail pass in 180386

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 180386 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 180386 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 180386 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 180386 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 180386 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 180386 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 180386 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 180386 n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180382
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180382
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180382
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180382
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180382
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180382
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180382
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180382
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                327ec8d6c2a2223b78d311153a471036e474c5c5
baseline version:
 qemuu                6dd06214892d71cbbdd25daed7693e58afcb1093

Last test of basis   180382  2023-04-23 03:16:49 Z    1 days
Testing same since   180386  2023-04-23 16:07:44 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Richard Henderson <richard.henderson@linaro.org>

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
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
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
commit 327ec8d6c2a2223b78d311153a471036e474c5c5
Merge: 6dd0621489 3ea9be3340
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sun Apr 23 11:20:36 2023 +0100

    Merge tag 'pull-tcg-20230423' of https://gitlab.com/rth7680/qemu into staging
    
    tcg cleanups:
      - Remove tcg_abort()
      - Split out extensions as known backend interfaces
      - Put the separate extensions together as tcg_out_movext
      - Introduce tcg_out_xchg as a backend interface
      - Clear TCGLabelQemuLdst on allocation
      - Avoid redundant extensions for riscv
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQFRBAABCgA7FiEEekgeeIaLTbaoWgXAZN846K9+IV8FAmRE69sdHHJpY2hhcmQu
    # aGVuZGVyc29uQGxpbmFyby5vcmcACgkQZN846K9+IV/6jQf6Al9cgeJ6guVMpoRS
    # +sXaTs5U2yaqRvz5gGn2ANFuFgD2QanbWHjS5guTnhbsvq3icyOCpIXIPg/Z04LB
    # fTgAUCF5ut8U8C12HyGq/p4BFoTTWnCGPwY+PB9pMb5LiEcmaSUUz+fSA8xMX1b6
    # EylI8YNd74A9j5PBNbGIXooj8llM71p9YztwQ9V7sPH3ZON4qbPRDgrJsb5TngMa
    # daTpGoW+A9UyG7z0Ie6UuiOyYAzeQqm64WmMlc7UYeb9lL+yxvCq4+MXH2V/SKqg
    # GLOF95DCdqj1EeZCOt0aN1ybZPcYFFkmpXrD1iLu0Mhy7Qo/vghX/eFoFnLleD+Y
    # yM+LTg==
    # =d2hZ
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Sun 23 Apr 2023 09:27:07 AM BST
    # gpg:                using RSA key 7A481E78868B4DB6A85A05C064DF38E8AF7E215F
    # gpg:                issuer "richard.henderson@linaro.org"
    # gpg: Good signature from "Richard Henderson <richard.henderson@linaro.org>" [ultimate]
    
    * tag 'pull-tcg-20230423' of https://gitlab.com/rth7680/qemu:
      tcg/riscv: Conditionalize tcg_out_exts_i32_i64
      tcg: Clear TCGLabelQemuLdst on allocation
      tcg: Introduce tcg_out_xchg
      tcg: Introduce tcg_out_movext
      tcg: Split out tcg_out_extrl_i64_i32
      tcg: Split out tcg_out_extu_i32_i64
      tcg: Split out tcg_out_exts_i32_i64
      tcg: Split out tcg_out_ext32u
      tcg: Split out tcg_out_ext32s
      tcg: Split out tcg_out_ext16u
      tcg: Split out tcg_out_ext16s
      tcg: Split out tcg_out_ext8u
      tcg: Split out tcg_out_ext8s
      tcg: Replace tcg_abort with g_assert_not_reached
      tcg: Replace if + tcg_abort with tcg_debug_assert
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 3ea9be33400f14305565a9a094cb6031c07183d5
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 18:43:47 2023 -0700

    tcg/riscv: Conditionalize tcg_out_exts_i32_i64
    
    Since TCG_TYPE_I32 values are kept sign-extended in registers, via "w"
    instructions, we don't need to extend if the register matches.
    This is already relied upon by comparisons.
    
    Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 4745b156b8412ef12af32bd474fee70c25940950
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Thu Apr 6 11:38:56 2023 -0700

    tcg: Clear TCGLabelQemuLdst on allocation
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 767c250310ee0494d37bf7514d24973dd50e38ea
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 21:39:54 2023 -0700

    tcg: Introduce tcg_out_xchg
    
    We will want a backend interface for register swapping.
    This is only properly defined for x86; all others get a
    stub version that always indicates failure.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit b3dfd5fc181433bd43e2163b1a94b11a548edfba
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 21:16:28 2023 -0700

    tcg: Introduce tcg_out_movext
    
    This is common code in most qemu_{ld,st} slow paths, extending the
    input value for the store helper data argument or extending the
    return value from the load helper.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit b8b94ac6753effcfda7880d3b9ac49b530e3d2ab
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 19:58:35 2023 -0700

    tcg: Split out tcg_out_extrl_i64_i32
    
    We will need a backend interface for type truncation.  For those backends
    that did not enable TCG_TARGET_HAS_extrl_i64_i32, use tcg_out_mov.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit b9bfe000f954e1defefb4c917f98bf82c337144b
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 18:56:28 2023 -0700

    tcg: Split out tcg_out_extu_i32_i64
    
    We will need a backend interface for type extension with zero.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 9c6aa274a494ce807e998a3652fa16a3d2da4387
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 18:30:56 2023 -0700

    tcg: Split out tcg_out_exts_i32_i64
    
    We will need a backend interface for type extension with sign.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 9ecf5f61b8f468f17483f325f565802c645983a5
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 18:07:05 2023 -0700

    tcg: Split out tcg_out_ext32u
    
    We will need a backend interface for performing 32-bit zero-extend.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 52bf3398c3a2f51d3eaf8fd30dafcdc0cc7fc571
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 17:50:09 2023 -0700

    tcg: Split out tcg_out_ext32s
    
    We will need a backend interface for performing 32-bit sign-extend.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 379afdff47556f01e75ce2caffd7ae9efa4f1214
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 16:25:22 2023 -0700

    tcg: Split out tcg_out_ext16u
    
    We will need a backend interface for performing 16-bit zero-extend.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 753e42eada5c790bb3727c262f2e368e81cc788f
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 14:49:59 2023 -0700

    tcg: Split out tcg_out_ext16s
    
    We will need a backend interface for performing 16-bit sign-extend.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit d0e66c897f2cdfb0807b76567a17d7811487fac3
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 13:26:51 2023 -0700

    tcg: Split out tcg_out_ext8u
    
    We will need a backend interface for performing 8-bit zero-extend.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 678155b2c50aa3bf37abef6bfe914bf58f49bec2
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 11:17:01 2023 -0700

    tcg: Split out tcg_out_ext8s
    
    We will need a backend interface for performing 8-bit sign-extend.
    Use it in tcg_reg_alloc_op in the meantime.
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 732e89f4c401c3cf175aa84c987a029b9729070b
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 12:09:14 2023 -0700

    tcg: Replace tcg_abort with g_assert_not_reached
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 1a057554cc2e3ece8ed166f12a9b85cd5ec4cbe1
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Apr 5 12:08:46 2023 -0700

    tcg: Replace if + tcg_abort with tcg_debug_assert
    
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

