Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE5B40D236
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 06:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188009.337053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQif1-0004EH-22; Thu, 16 Sep 2021 04:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188009.337053; Thu, 16 Sep 2021 04:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQif0-0004Bo-TP; Thu, 16 Sep 2021 04:06:06 +0000
Received: by outflank-mailman (input) for mailman id 188009;
 Thu, 16 Sep 2021 04:06:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQiez-0004Be-KQ; Thu, 16 Sep 2021 04:06:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQiez-0004Zu-C5; Thu, 16 Sep 2021 04:06:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQiey-0006Oa-Sp; Thu, 16 Sep 2021 04:06:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mQiey-0000JB-S4; Thu, 16 Sep 2021 04:06:04 +0000
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
	bh=CNA/JTwPP6pGmHGqcGs76ZfzuuREr3bWZv9m99T0Ffk=; b=e/Rm7dnRhhS1Ym1tO4UXaNFVT/
	h/IFOg00q5Zzh50mP0FQCQ+jXIhNV1mRih53C8r6OV5zvJFSQuLTjCse4EsIf2mkaPoLWyFksBMWT
	983ss/ZHKIbHdfjU2DAu8lq1Mqs0dA3Hw8whulF4+hMU09d008twg/69H8YXrSis3+nw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164996-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 164996: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=487975df53b5298316b594550c79934d646701bd
X-Osstest-Versions-That:
    xen=c76cfada1cfad05aaf64ce3ad305c5467650e782
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Sep 2021 04:06:04 +0000

flight 164996 xen-unstable real [real]
flight 165002 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/164996/
http://logs.test-lab.xenproject.org/osstest/logs/165002/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail REGR. vs. 164945

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 165002-retest
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 165002-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 164945
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 164945
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 164945
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 164945
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 164945
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 164945
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 164945
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 164945
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 164945
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 164945
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 164945
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 164945
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  487975df53b5298316b594550c79934d646701bd
baseline version:
 xen                  c76cfada1cfad05aaf64ce3ad305c5467650e782

Last test of basis   164945  2021-09-10 21:23:48 Z    5 days
Failing since        164951  2021-09-12 00:14:36 Z    4 days    8 attempts
Testing same since   164996  2021-09-15 11:47:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Penny Zheng <penny.zheng@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
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
 test-amd64-amd64-xl-credit1                                  pass    
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
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
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
commit 487975df53b5298316b594550c79934d646701bd
Author: Penny Zheng <penny.zheng@arm.com>
Date:   Fri Sep 10 02:52:15 2021 +0000

    xen/arm: introduce allocate_static_memory
    
    This commit introduces a new function allocate_static_memory to allocate
    static memory as guest RAM for domains on Static Allocation.
    
    It uses acquire_domstatic_pages to acquire pre-configured static memory
    for the domain, and uses guest_physmap_add_pages to set up the P2M table.
    These pre-defined static memory banks shall be mapped to the usual guest
    memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
    xen/include/public/arch-arm.h.
    
    In order to deal with the trouble of count-to-order conversion when page number
    is not in a power-of-two, this commit exports p2m_insert_mapping and introduce
    a new function guest_physmap_add_pages to cope with adding guest RAM p2m
    mapping with nr_pages.
    
    Signed-off-by: Penny Zheng <penny.zheng@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit c7fe462c0d274ffa30c9448c0a80affa075d789d
Author: Penny Zheng <penny.zheng@arm.com>
Date:   Fri Sep 10 02:52:14 2021 +0000

    xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
    
    New function acquire_staticmem_pages aims to acquire nr_mfns contiguous pages
    of static memory, starting at #smfn. And it is the equivalent of
    alloc_heap_pages for static memory.
    
    For each page, it shall check if the page is reserved(PGC_reserved)
    and free. It shall also do a set of necessary initialization, which are
    mostly the same ones in alloc_heap_pages, like, following the same
    cache-coherency policy and turning page status into PGC_state_inuse, etc.
    
    New function acquire_domstatic_pages is the equivalent of alloc_domheap_pages
    for static memory, and it is to acquire nr_mfns contiguous pages of
    static memory and assign them to one specific domain.
    
    It uses acquire_staticmem_pages to acquire nr_mfns pages of static memory.
    Then on success, it will use assign_pages to assign those pages to one
    specific domain.
    
    In order to differentiate pages of static memory from those allocated from
    heap, this patch introduces a new page flag PGC_reserved, then mark pages of
    static memory PGC_reserved when initializing them.
    
    Signed-off-by: Penny Zheng <penny.zheng@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 5260e8fb93f0e1f094de4142b2abad45844ab89c
Author: Penny Zheng <penny.zheng@arm.com>
Date:   Fri Sep 10 02:52:13 2021 +0000

    xen: re-define assign_pages and introduce a new function assign_page
    
    In order to deal with the trouble of count-to-order conversion when page number
    is not in a power-of-two, this commit re-define assign_pages for nr pages and
    assign_page for original page with a single order.
    
    Backporting confusion could be helped by altering the order of assign_pages
    parameters, such that the compiler would point out that adjustments at call
    sites are needed.
    
    [stefano: switch to unsigned int for nr]
    Signed-off-by: Penny Zheng <penny.zheng@arm.com>
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 4a9e73e6e53e9d8bc005a08c3968ec36d793f140
Author: Penny Zheng <penny.zheng@arm.com>
Date:   Fri Sep 10 02:52:12 2021 +0000

    xen/arm: static memory initialization
    
    This patch introduces static memory initialization, during system boot-up.
    
    The new function init_staticmem_pages is responsible for static memory
    initialization.
    
    Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
    nr_mfns pages of static memory.
    
    This commit also introduces a new CONFIG_STATIC_MEMORY option to wrap all
    static-allocation-related code.
    
    Put asynchronously scrubbing pages of static memory in TODO list.
    
    Signed-off-by: Penny Zheng <penny.zheng@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 540a637c3410780b519fc055f432afe271f642f8
Author: Penny Zheng <penny.zheng@arm.com>
Date:   Fri Sep 10 02:52:11 2021 +0000

    xen: introduce mark_page_free
    
    This commit defines a new helper mark_page_free to extract common code,
    like following the same cache/TLB coherency policy, between free_heap_pages
    and the new function free_staticmem_pages, which will be introduced later.
    
    The PDX compression makes that conversion between the MFN and the page can
    be potentially non-trivial. As the function is internal, pass the MFN and
    the page. They are both expected to match.
    
    Signed-off-by: Penny Zheng <penny.zheng@arm.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 41c031ff437b66cfac4b120bd7698ca039850690
Author: Penny Zheng <penny.zheng@arm.com>
Date:   Fri Sep 10 02:52:10 2021 +0000

    xen/arm: introduce domain on Static Allocation
    
    Static Allocation refers to system or sub-system(domains) for which memory
    areas are pre-defined by configuration using physical address ranges.
    
    Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
    beginning, shall never go to heap allocator or boot allocator for any use.
    
    Memory can be statically allocated to a domain using the property "xen,static-
    mem" defined in the domain configuration. The number of cells for the address
    and the size must be defined using respectively the properties
    "#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
    
    The property 'memory' is still needed and should match the amount of memory
    given to the guest. Currently, it either comes from static memory or lets Xen
    allocate from heap. *Mixing* is not supported.
    
    The static memory will be mapped in the guest at the usual guest memory
    addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
    xen/include/public/arch-arm.h.
    
    This patch introduces this new `xen,static-mem` feature, and also documents
    and parses this new attribute at boot time.
    
    This patch also introduces a new field "bool xen_domain" in "struct membank"
    to tell whether the memory bank is reserved as the whole hardware resource,
    or bind to a xen domain node, through "xen,static-mem"
    
    Signed-off-by: Penny Zheng <penny.zheng@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 904ba3ce2e46e59080dc09676cede5df63b59f20
Author: Penny Zheng <penny.zheng@arm.com>
Date:   Fri Sep 10 02:52:09 2021 +0000

    xen/arm: introduce new helper device_tree_get_meminfo
    
    This commit creates a new helper device_tree_get_meminfo to iterate over a
    device tree property to get memory info, like "reg".
    
    Signed-off-by: Penny Zheng <penny.zheng@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit a89bcd9737757e4d671783588a6041a84a5e1754
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Wed Jul 7 09:15:31 2021 +0200

    tools/go: honor append build flags
    
    Make the go build use APPEND_{C/LD}FLAGS when necessary, just like
    other parts of the build.
    
    Reported-by: Ting-Wei Lan <lantw44@gmail.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>

commit 6d45368a0a89e01a3a01d156af61fea565db96cc
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Fri Sep 10 16:12:59 2021 -0400

    xsm: drop dubious xsm_op_t type
    
    The type xsm_op_t masks the use of void pointers. This commit drops the
    xsm_op_t type and replaces it and all its uses with an explicit void.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 2928c1d250b157fd4585ca47ba36ad4792723f1f
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Fri Sep 10 16:12:58 2021 -0400

    xsm: remove remnants of xsm_memtype hook
    
    In c/s fcb8baddf00e the xsm_memtype hook was removed but some remnants were
    left behind. This commit cleans up those remnants.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 4624912c0b5505387e53a12ef3417d001431a29d
Author: Daniel P. Smith <dpsmith@apertussolutions.com>
Date:   Fri Sep 10 16:12:57 2021 -0400

    xsm: remove the ability to disable flask
    
    On Linux when SELinux is put into permissive mode the discretionary access
    controls are still in place. Whereas for Xen when the enforcing state of flask
    is set to permissive, all operations for all domains would succeed, i.e. it
    does not fall back to the default access controls. To provide a means to mimic
    a similar but not equivalent behaviour, a flask op is present to allow a
    one-time switch back to the default access controls, aka the "dummy policy".
    
    While this may be desirable for an OS, Xen is a hypervisor and should not
    allow the switching of which security policy framework is being enforced after
    boot.  This patch removes the flask op to enforce the desired XSM usage model
    requiring a reboot of Xen to change the XSM policy module in use.
    
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f26bb285949b8c233816c4c6a87237ee14a06ebc
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 10 16:12:56 2021 -0400

    xen: Implement xen/alternative-call.h for use in common code
    
    The alternative call infrastructure is x86-only for now, but the common iommu
    code has a variant and more common code wants to use the infrastructure.
    
    Introduce CONFIG_ALTERNATIVE_CALL and a conditional implementation so common
    code can use the optimisation when available, without requiring all
    architectures to implement no-op stubs.
    
    Write some documentation, which was thus far entirely absent, covering the
    requirements for an architecture to implement this optimisation, and how to
    use the infrastructure in general code.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

