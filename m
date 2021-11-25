Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F5745D4A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 07:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230646.398764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq85H-0002MW-BU; Thu, 25 Nov 2021 06:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230646.398764; Thu, 25 Nov 2021 06:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq85H-0002KM-7w; Thu, 25 Nov 2021 06:18:15 +0000
Received: by outflank-mailman (input) for mailman id 230646;
 Thu, 25 Nov 2021 06:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mq85F-0002KC-Qf; Thu, 25 Nov 2021 06:18:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mq85F-0003Jj-Ji; Thu, 25 Nov 2021 06:18:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mq85F-0004pW-7R; Thu, 25 Nov 2021 06:18:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mq85F-0006lE-6t; Thu, 25 Nov 2021 06:18:13 +0000
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
	bh=dI9st/51AISnhbefJvKal8G0BHABBoT8bgEVjC5dTUo=; b=vHCheyKW77dgt2CkMnrl+TjDcR
	wNpNxzzGA7WjyeTCUP4aZkVI8/7FGLCq3OsyEDuHDTcAYXfv9nrOPGQcUsymc3mgGSaeW9c1C0aMs
	bayF3JHiGt0+VNcnl4e6yHwyAfGXnEIb7enNvflV6Vw7CLicK+xeabtQWs83esIyZjys=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166324-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 166324: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:debian-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-credit1:debian-install:fail:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:freebsd-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-shadow:debian-install:fail:regression
    xen-unstable:test-amd64-i386-xl-xsm:debian-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-xsm:debian-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:allowable
    xen-unstable:test-armhf-armhf-xl-rtds:host-ping-check-xen:fail:allowable
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=74a11c43fd7e074b1f77631b446dd2115eacb9e8
X-Osstest-Versions-That:
    xen=be12fcca8b784e456df3adedbffe657d753c5ff9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Nov 2021 06:18:13 +0000

flight 166324 xen-unstable real [real]
flight 166372 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/166324/
http://logs.test-lab.xenproject.org/osstest/logs/166372/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel 12 debian-install      fail REGR. vs. 166304
 test-amd64-amd64-xl-credit1  12 debian-install           fail REGR. vs. 166304
 test-amd64-i386-freebsd10-amd64 12 freebsd-install       fail REGR. vs. 166304
 test-amd64-amd64-xl-shadow   12 debian-install           fail REGR. vs. 166304
 test-amd64-i386-xl-xsm       12 debian-install           fail REGR. vs. 166304
 test-amd64-amd64-xl-xsm      12 debian-install           fail REGR. vs. 166304
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 166304
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 166304

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10   fail REGR. vs. 166304
 test-armhf-armhf-xl-rtds     10 host-ping-check-xen      fail REGR. vs. 166304

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166304
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166304
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166304
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166304
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 166304
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 166304
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166304
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166304
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 166304
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166304
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166304
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 166304
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 xen                  74a11c43fd7e074b1f77631b446dd2115eacb9e8
baseline version:
 xen                  be12fcca8b784e456df3adedbffe657d753c5ff9

Last test of basis   166304  2021-11-23 01:54:09 Z    2 days
Testing same since   166324  2021-11-23 17:39:07 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>

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
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              fail    
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
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   fail    
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
commit 74a11c43fd7e074b1f77631b446dd2115eacb9e8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Nov 22 11:12:32 2021 +0000

    x86/P2M: deal with partial success of p2m_set_entry()
    
    M2P and PoD stats need to remain in sync with P2M; if an update succeeds
    only partially, respective adjustments need to be made. If updates get
    made before the call, they may also need undoing upon complete failure
    (i.e. including the single-page case).
    
    Log-dirty state would better also be kept in sync.
    
    Note that the change to set_typed_p2m_entry() may not be strictly
    necessary (due to the order restriction enforced near the top of the
    function), but is being kept here to be on the safe side.
    
    This is CVE-2021-28705 and CVE-2021-28709 / XSA-389.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 8ec13f68e0b026863d23e7f44f252d06478bc809
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Nov 22 11:11:44 2021 +0000

    x86/PoD: handle intermediate page orders in p2m_pod_cache_add()
    
    p2m_pod_decrease_reservation() may pass pages to the function which
    aren't 4k, 2M, or 1G. Handle all intermediate orders as well, to avoid
    hitting the BUG() at the switch() statement's "default" case.
    
    This is CVE-2021-28708 / part of XSA-388.
    
    Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 182c737b9ba540ebceb1433f3940fbed6eac4ea9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Nov 22 11:11:44 2021 +0000

    x86/PoD: deal with misaligned GFNs
    
    Users of XENMEM_decrease_reservation and XENMEM_populate_physmap aren't
    required to pass in order-aligned GFN values. (While I consider this
    bogus, I don't think we can fix this there, as that might break existing
    code, e.g Linux'es swiotlb, which - while affecting PV only - until
    recently had been enforcing only page alignment on the original
    allocation.) Only non-PoD code paths (guest_physmap_{add,remove}_page(),
    p2m_set_entry()) look to be dealing with this properly (in part by being
    implemented inefficiently, handling every 4k page separately).
    
    Introduce wrappers taking care of splitting the incoming request into
    aligned chunks, without putting much effort in trying to determine the
    largest possible chunk at every iteration.
    
    Also "handle" p2m_set_entry() failure for non-order-0 requests by
    crashing the domain in one more place. Alongside putting a log message
    there, also add one to the other similar path.
    
    Note regarding locking: This is left in the actual worker functions on
    the assumption that callers aren't guaranteed atomicity wrt acting on
    multiple pages at a time. For mis-aligned GFNs gfn_lock() wouldn't have
    locked the correct GFN range anyway, if it didn't simply resolve to
    p2m_lock(), and for well-behaved callers there continues to be only a
    single iteration, i.e. behavior is unchanged for them. (FTAOD pulling
    out just pod_lock() into p2m_pod_decrease_reservation() would result in
    a lock order violation.)
    
    This is CVE-2021-28704 and CVE-2021-28707 / part of XSA-388.
    
    Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 143501861d48e1bfef495849fd68584baac05849
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Nov 22 11:11:05 2021 +0000

    xen/page_alloc: Harden assign_pages()
    
    domain_tot_pages() and d->max_pages are 32-bit values. While the order
    should always be quite small, it would still be possible to overflow
    if domain_tot_pages() is near to (2^32 - 1).
    
    As this code may be called by a guest via XENMEM_increase_reservation
    and XENMEM_populate_physmap, we want to make sure the guest is not going
    to be able to allocate more than it is allowed.
    
    Rework the allocation check to avoid any possible overflow. While the
    check domain_tot_pages() < d->max_pages should technically not be
    necessary, it is probably best to have it to catch any possible
    inconsistencies in the future.
    
    This is CVE-2021-28706 / part of XSA-385.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

