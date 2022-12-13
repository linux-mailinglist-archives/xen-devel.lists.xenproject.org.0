Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1564ACD8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460038.717834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tp3-0003ZV-Ie; Tue, 13 Dec 2022 01:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460038.717834; Tue, 13 Dec 2022 01:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tp3-0003Wa-EM; Tue, 13 Dec 2022 01:11:05 +0000
Received: by outflank-mailman (input) for mailman id 460038;
 Tue, 13 Dec 2022 01:11:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p4tp2-0003WQ-P0; Tue, 13 Dec 2022 01:11:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p4tp2-0006MZ-KS; Tue, 13 Dec 2022 01:11:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p4tp2-0001NA-76; Tue, 13 Dec 2022 01:11:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p4tp2-0004wQ-6c; Tue, 13 Dec 2022 01:11:04 +0000
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
	bh=lR2FWU42xQyF34iVtsrJBJ27JROHouTNXN9mnezXSmk=; b=ByAkbDONhFLNZbNQ8FQ5g59LuA
	cePD+pylsIgBOzFfnJ21CHbUad2MnaHwbbJpLhbbv07I5JwhPev0akrG//SGA9vUg52OexMCnyL3S
	W5SnVouI2dgDUGc/XyAGKGjP40WPR/JYSCVdDFI0thJWShxN3kF3RcBTKwYMJ0JWWvgE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175154-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 175154: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-livepatch:xen-boot:fail:regression
    xen-unstable:test-xtf-amd64-amd64-4:xen-boot:fail:regression
    xen-unstable:test-xtf-amd64-amd64-2:xen-boot:fail:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    xen-unstable:test-arm64-arm64-xl-thunderx:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-boot/src_host:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-boot/dst_host:fail:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    xen-unstable:test-xtf-amd64-amd64-5:xen-boot:fail:regression
    xen-unstable:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    xen-unstable:test-amd64-amd64-examine-uefi:reboot:fail:regression
    xen-unstable:test-amd64-amd64-examine:reboot:fail:regression
    xen-unstable:test-arm64-arm64-xl-seattle:xen-boot:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=96993519424c3fef49fd00d80a271d986767a3cd
X-Osstest-Versions-That:
    xen=f86d0a1ff200264aaf80b65d7d200a3ba19c7845
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Dec 2022 01:11:04 +0000

flight 175154 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175154/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-livepatch     8 xen-boot                 fail REGR. vs. 175144
 test-xtf-amd64-amd64-4        8 xen-boot                 fail REGR. vs. 175148
 test-xtf-amd64-amd64-2        8 xen-boot                 fail REGR. vs. 175148
 test-amd64-amd64-xl-pvhv2-amd  8 xen-boot                fail REGR. vs. 175148
 test-amd64-i386-qemuu-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 175148
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 175148
 test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 175148
 test-amd64-i386-pair         12 xen-boot/src_host        fail REGR. vs. 175148
 test-amd64-i386-pair         13 xen-boot/dst_host        fail REGR. vs. 175148
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 175148
 test-xtf-amd64-amd64-5        8 xen-boot                 fail REGR. vs. 175148
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 175148
 test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 175148
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 175148
 test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 175148

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175148
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175148
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175148
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175148
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175148
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175148
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175148
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175148
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175148
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175148
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175148
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175148
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  96993519424c3fef49fd00d80a271d986767a3cd
baseline version:
 xen                  f86d0a1ff200264aaf80b65d7d200a3ba19c7845

Last test of basis   175148  2022-12-12 01:53:19 Z    0 days
Testing same since   175154  2022-12-12 15:07:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jiamei Xie <jiamei.xie@arm.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Wei Chen <wei.chen@arm.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       fail    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       fail    
 test-xtf-amd64-amd64-5                                       fail    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    fail    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-i386-examine-uefi                                 pass    
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
commit 96993519424c3fef49fd00d80a271d986767a3cd
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon Dec 12 12:29:09 2022 +0100

    docs: do not install .deps files
    
    It isn't really part of the documentation. Furthermore, entries there
    are in not determined order, which breaks build reproducibility.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b08600e2d6b58eca29d72f6cb6672a5cba5baed4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 12 12:27:30 2022 +0100

    x86/tboot: actually wipe contexts
    
    Especially with our use of __builtin_memset() to implement memset() the
    compiler is free to eliminate instances when it can prove that the
    affected object is dead. Introduce a small helper function accompanying
    the memset() with a construct forcing the compiler to retain the
    clearing of (stack) memory.
    
    Fixes: c021c95498d9 ("x86: Replace our own specialised versions of memset and memcpy with")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 8301856bd956558161aa0c71623c85403ebdca35
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 12 12:21:01 2022 +0100

    x86/tboot: correct IOMMU (VT-d) interaction
    
    First of all using is_idle_domain() on the subject domain in the body of
    for_each_domain() is pointless. Replace that conditional by one checking
    that a domain actually has IOMMU support enabled for it, and that we're
    actually on a VT-d system (both are largely cosmetic / documentary with
    how things work elsewhere, but still).
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4384d96c1cedfa4e388401be3a19ff50f8dce54b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 12 12:19:20 2022 +0100

    x86/mm: PGC_shadowed_pt is used by shadow code only
    
    By defining the constant to zero when !SHADOW_PAGING we give compilers
    the chance to eliminate a little more dead code elsewhere in the tree.
    Plus, as a minor benefit, the general reference count can be one bit
    wider. (To simplify things, have PGC_shadowed_pt change places with
    PGC_extra.)
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit c44c0dc35889848ee27549ac3455314e236cfc3d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 12 12:18:41 2022 +0100

    x86/mm: rename PGC_page_table to PGC_shadowed_pt
    
    The original name didn't express the purpose of the flag: It is being
    set once a page table page obtains a shadow, and it is removed when the
    last shadow of a page was destroyed.
    
    In set_tlbflush_timestamp() also remove the 2nd half of the condition as
    being redundant (PGC_shadowed_pt can't be set on a page without shadow
    mode being enabled on the owning domain).
    
    Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f00ad745cfa774a269b28e88951b56b7001d4fe0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 12 12:17:07 2022 +0100

    x86/tboot: drop failed attempt to hash shadow page tables
    
    While plausible to do what was intended based on the name of the flag
    (PGC_page_table), that name was misleading and is going to be changed.
    It marks page tables pages _having_ a shadow, not shadows of page table
    pages. The attempt also didn't cover the HAP case at all, and it
    constituted a potentially very long loop doing nothing when
    !SHADOW_PAGING. Instead leave a comment of what actually wants doing
    there (which then also may need to account for e.g. the risk of A/D bits
    becoming set behind our backs).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

commit c243c0bb2a77e1328842436ca654f808701161c6
Author: Wei Chen <wei.chen@arm.com>
Date:   Mon Dec 12 12:15:28 2022 +0100

    xen: introduce a Kconfig option to configure NUMA nodes number
    
    Currently the maximum number of NUMA nodes is a hardcoded value.
    This provides little flexibility unless changing the code.
    
    Introduce a new Kconfig option to change the maximum number of
    NUMA nodes conveniently. Also considering that not all
    architectures support NUMA, this Kconfig option is only visible
    on NUMA enabled architectures. Architectures not supporting NUMA
    still use 1 for MAX_NUMNODES.
    
    As NODES_SHIFT is currently unused, we're taking this
    opportunity to remove it.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit d46b1f5c29400a25bfc2492a649225a7915b04b2
Author: Wei Chen <wei.chen@arm.com>
Date:   Mon Dec 12 12:14:53 2022 +0100

    xen/x86: move NUMA process nodes nodes code from x86 to common
    
    x86 has implemented a set of codes to process NUMA nodes. These
    codes will parse NUMA memory and processor information from
    ACPI SRAT table. But except some ACPI specific codes, most
    of the process code like memory blocks validation, node memory
    range updates and some sanity check can be reused by other
    NUMA implementation.
    
    So in this patch, we move some variables and related functions
    for NUMA memory and processor to common as library. At the
    same time, numa_set_processor_nodes_parsed has been introduced
    for ACPI specific code to update processor parsing results.
    With this helper, we can reuse most of NUMA memory affinity init
    code from ACPI. As bad_srat and node_to_pxm functions have been
    used in common code to do architectural fallback and node to
    architectural node info translation. But it doesn't make sense
    to reuse the functions names in common code, we have rename them
    to neutral names as well.
    
    PXM is an ACPI specific item, we can't use it in common code
    directly. So we introduced an numa_fw_nid_name for each NUMA
    implementation to set their specific firmware NUMA node name.
    In this case, we do not need to retain a lot of per-arch code
    but still can print architectural log messages for different
    NUMA implementations. A default value "???" will be set to
    indicate an unset numa_fw_nid_name.
    
    mem_hotplug is accessed by common code if memory hotplug is
    activated. Even if this is only supported by x86, export the
    variable so that other architectures could support it in the future.
    
    As asm/acpi.h has been removed from common/numa.c, we have to
    move NR_NODE_MEMBLKS from asm/acpi.h to xen/numa.h in this patch
    as well.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit cfee463c112b8ac261f6ca1d32e4c70e4821ba7a
Author: Wei Chen <wei.chen@arm.com>
Date:   Mon Dec 12 12:14:13 2022 +0100

    xen/x86: use arch_get_ram_range to get information from E820 map
    
    The sanity check of nodes_cover_memory is also a requirement of
    other architectures that support NUMA. But now, the code of
    nodes_cover_memory is tied to the x86 E820. In this case, we
    introduce arch_get_ram_range to decouple architecture specific
    memory map from this function. This means, other architectures
    like Arm can also use it to check its node and memory coverage
    from bootmem info.
    
    Depends arch_get_ram_range, we make nodes_cover_memory become
    architecture independent. We also use neutral words to replace
    SRAT and E820 in the print message of this function. This will
    to make the massage seems more common.
    
    As arch_get_ram_range use unsigned int for index, we also adjust
    the index in nodes_cover_memory from int to unsigned int.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit e9c72d524fbdb109c45f24acce998f0bd552fb6f
Author: Wei Chen <wei.chen@arm.com>
Date:   Mon Dec 12 12:13:26 2022 +0100

    xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
    
    VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
    results in two lines of error-checking code in phys_to_nid
    that is not actually working and causing two compilation
    errors:
    1. error: "MAX_NUMNODES" undeclared (first use in this function).
       This is because in the common header file, "MAX_NUMNODES" is
       defined after the common header file includes the ARCH header
       file, where phys_to_nid has attempted to use "MAX_NUMNODES".
       This error was resolved after we moved the phys_to_nid from
       x86 ARCH header file to common header file.
    2. error: wrong type argument to unary exclamation mark.
       This is because, the error-checking code contains !node_data[nid].
       But node_data is a data structure variable, it's not a pointer.
    
    So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
    enable the two lines of error-checking code. And fix the left
    compilation errors by replacing !node_data[nid] to
    !node_data[nid].node_spanned_pages. Although NUMA allows one node
    can only have CPUs but without any memory. And node with 0 bytes
    of memory might have an entry in memnodemap[] theoretically. But
    that doesn't mean phys_to_nid can find any valid address from a
    node with 0 bytes memory.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Tested-by: Jiamei Xie <jiamei.xie@arm.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit eac84d9d579011f311d502317b74dc56e788463d
Author: Wei Chen <wei.chen@arm.com>
Date:   Mon Dec 12 12:11:55 2022 +0100

    xen/x86: move generically usable NUMA code from x86 to common
    
    There are some codes in x86/numa.c can be shared by common
    architectures to implememnt NUMA support. Just like some
    variables and functions to check and store NUMA memory map.
    And some variables and functions to do NUMA initialization.
    
    In this patch, we move them to common/numa.c and xen/numa.h
    and use the CONFIG_NUMA to gate them for non-NUMA supported
    architectures. As the target header file is Xen-style, so
    we trim some spaces and replace tabs for the codes that has
    been moved to xen/numa.h at the same time.
    
    As acpi_scan_nodes has been used in a common function, it
    doesn't make sense to use acpi_xxx in common code, so we
    rename it to numa_process_nodes in this patch too. After that
    if we still use CONFIG_ACPI_NUMA in to gate numa_process_nodes
    in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
    will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
    CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_process_nodes.
    
    As arch_numa_disabled has been implememnted for ACPI NUMA,
    we can rename srat_disabled to numa_disabled and move it
    to common code as well.
    
    The macro node_to_first_cpu(node) hasn't been used anywhere,
    so we drop it in this patch too.
    
    Because some architectures allow to use all 64 physical address
    bits, but some architectures are not (like Arm64 allows 52, 48
    bits). In this case, we use min(PADDR_BITS, BITS_PER_LONG - 1)
    to calculate the shift when only one node is in the system in
    this patch too.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 9bbfd7b14c4ad3774d88fe6430ab8726720633ec
Author: Wei Chen <wei.chen@arm.com>
Date:   Mon Dec 12 12:10:18 2022 +0100

    xen/x86: Provide helpers for common code to access acpi_numa
    
    acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
    Other NUMA implementation may not need this switch. But this switch is
    not only used by ACPI code, it is also used directly in some general
    NUMA logic code. So far this hasn't caused any problem because Xen only
    has x86 implementing ACPI NUMA, but now Arm is implementing device tree
    based NUMA. Accesssing acpi_numa directly in some functions will be a
    block of reusing NUMA common code. It is also difficult for us to replace
    it with a new generic switch, because it is hard to prove that the new
    switch states can guarantee the original code will work correctly.
    
    So in this patch, we provide two helpers for common code to update and
    get states of acpi_numa. And other new NUMA implementations just need
    to provide the same helpers for common code. In this case, the generic
    NUMA logic code can be reused by all NUMA implementations.
    
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

