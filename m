Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3488674201
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 20:02:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481266.746037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaAp-0001eZ-DK; Thu, 19 Jan 2023 19:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481266.746037; Thu, 19 Jan 2023 19:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaAp-0001bZ-9f; Thu, 19 Jan 2023 19:02:07 +0000
Received: by outflank-mailman (input) for mailman id 481266;
 Thu, 19 Jan 2023 19:02:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIaAn-0001bP-Ov; Thu, 19 Jan 2023 19:02:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIaAn-0003KF-Ky; Thu, 19 Jan 2023 19:02:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pIaAn-0008JM-8M; Thu, 19 Jan 2023 19:02:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pIaAn-0004y2-7i; Thu, 19 Jan 2023 19:02:05 +0000
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
	bh=DRyGvhD3UnIJdhC9j2lH8+gomMG3LgVRnGZvZFDaHiM=; b=sM7fiDTqptiIGfgTIct0/PkJUw
	WcEmI0sFJYKspoQ2n5ycIxqrwDdGi/eXLUilRhrPV/1S5Kw4pfWAfYwRFmql+DlNEC5tMxnYUYmQb
	54d8pZwuXJO/Lb4fMp2oAWvxJofN5s0DAXrwLkg6wOiIyLghX3PiMtHvywF5+27VuVa4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175965-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 175965: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl-vhd:xen-install:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-install:fail:heisenbug
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
X-Osstest-Versions-That:
    xen=fd42170b152b19ff12121f3b63674e882c087849
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Jan 2023 19:02:05 +0000

flight 175965 xen-unstable real [real]
flight 175984 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/175965/
http://logs.test-lab.xenproject.org/osstest/logs/175984/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-vhd        7 xen-install              fail REGR. vs. 175734

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail pass in 175984-retest
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install   fail pass in 175984-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175734
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175734
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175734
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175734
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175734
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175734
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175734
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175734
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175734
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175734
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175734
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175734
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
baseline version:
 xen                  fd42170b152b19ff12121f3b63674e882c087849

Last test of basis   175734  2023-01-12 01:53:30 Z    7 days
Failing since        175739  2023-01-12 09:38:44 Z    7 days   17 attempts
Testing same since   175965  2023-01-19 02:53:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
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
 test-arm64-arm64-libvirt-raw                                 pass    
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
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       fail    


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
commit f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Tue Jan 3 11:25:19 2023 +0100

    xen/arm: Add 0x prefix when printing memory size in construct_domU
    
    Printing memory size in hex without 0x prefix can be misleading, so
    add it. Also, take the opportunity to adhere to 80 chars line length
    limit by moving the printk arguments to the next line.
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 229ebd517b9df0e2d2f9e3ea50b57ca716334826
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Jan 12 22:07:42 2023 +0000

    xen/arm: linker: The identitymap check should cover the whole .text.header
    
    At the moment, we are only checking that only some part of .text.header
    is part of the identity mapping. However, this doesn't take into account
    the literal pool which will be located at the end of the section.
    
    While we could try to avoid using a literal pool, in the near future we
    will also want to use an identity mapping for switch_ttbr().
    
    Not everything in .text.header requires to be part of the identity
    mapping. But it is below a page size (i.e. 4KB) so take a shortcut and
    check that .text.header is smaller than a page size.
    
    With that _end_boot can be removed as it is now unused. Take the
    opportunity to avoid assuming that a page size is always 4KB in the
    error message and comment.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 22a9981ba2443bd569bad6b772fb6e7e64f0d714
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Jan 12 22:06:42 2023 +0000

    xen/arm: linker: Indent correctly _stext
    
    _stext is indented by one space more compare to the lines. This doesn't
    seem warrant, so delete the extra space.
    
    Signed-off: Julien Grall <jgrall@amazon.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 3edca52ce736297d7fcf293860cd94ef62638052
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 9 10:58:31 2023 +0000

    x86/vmx: Support for CPUs without model-specific LBR
    
    Ice Lake (server at least) has both architectural LBR and model-specific LBR.
    Sapphire Rapids does not have model-specific LBR at all.  I.e. On SPR and
    later, model_specific_lbr will always be NULL, so we must make changes to
    avoid reliably hitting the domain_crash().
    
    The Arch LBR spec states that CPUs without model-specific LBR implement
    MSR_DBG_CTL.LBR by discarding writes and always returning 0.
    
    Do this for any CPU for which we lack model-specific LBR information.
    
    Adjust the now-stale comment, now that the Arch LBR spec has created a way to
    signal "no model specific LBR" to guests.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit e94af0d58f86c3a914b9cbbf4d9ed3d43b974771
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 9 11:42:22 2023 +0000

    x86/vmx: Calculate model-specific LBRs once at start of day
    
    There is no point repeating this calculation at runtime, especially as it is
    in the fallback path of the WRSMR/RDMSR handlers.
    
    Move the infrastructure higher in vmx.c to avoid forward declarations,
    renaming last_branch_msr_get() to get_model_specific_lbr() to highlight that
    these are model-specific only.
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit e6ee01ad24b6a1c3b922579964deebb119a90a48
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jan 3 15:08:56 2023 +0000

    xen/version: Drop compat/kernel.c
    
    kernel.c is mostly in an #ifndef COMPAT guard, because compat/kernel.c
    re-includes kernel.c to recompile xen_version() in a compat form.
    
    However, the xen_version hypercall is almost guest-ABI-agnostic; only
    XENVER_platform_parameters has a compat split.  Handle this locally, and do
    away with the re-include entirely.  Also drop the CHECK_TYPE()'s between types
    that are simply char-arrays in their native and compat form.
    
    In particular, this removed the final instances of obfuscation via the DO()
    macro.
    
    No functional change.  Also saves 2k of of .text in the x86 build.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 73f0696dc1d31a987563184ce1d01cbf5d12d6ab
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Dec 20 15:51:07 2022 +0000

    public/version: Change xen_feature_info to have a fixed size
    
    This is technically an ABI change, but Xen doesn't operate in any environment
    where "unsigned int" is different to uint32_t, so switch to the explicit form.
    This avoids the need to derive (identical) compat logic for handling the
    subop.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 6bec713f871f21c6254a5783c1e39867ea828256
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jan 12 16:17:54 2023 +0100

    include/compat: produce stubs for headers not otherwise generated
    
    Public headers can include other public headers. Such interdependencies
    are retained in their compat counterparts. Since some compat headers are
    generated only in certain configurations, the referenced headers still
    need to exist. The lack thereof was observed with hvm/hvm_op.h needing
    trace.h, where generation of the latter depends on TRACEBUFFER=y. Make
    empty stubs in such cases (as generating the extra headers is relatively
    slow and hence better to avoid). Changes to .config and incrementally
    (re-)building is covered by the respective .*.cmd then no longer
    matching the command to be used, resulting in the necessary re-creation
    of the (possibly stub) header.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 661489874e87c0f6e21ac298b039aab9379f6ee0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jan 12 11:14:50 2023 +0100

    x86/shadow: call sh_detach_old_tables() directly
    
    There's nothing really mode specific in this function anymore (the
    varying number of valid entries in v->arch.paging.shadow.shadow_table[]
    is dealt with fine by the zero check, and we have other similar cases of
    iterating through the full array in common.c), and hence there's neither
    a need to have multiple instances of it, nor does it need calling
    through a function pointer.
    
    While moving the function drop a non-conforming and not very useful
    (anymore) comment.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d2123363788cc60b1d33123d93d27a49e5a37a43
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jan 12 11:12:35 2023 +0100

    x86/shadow: reduce effort of hash calculation
    
    The "n" input is a GFN/MFN value and hence bounded by the physical
    address bits in use on a system. The hash quality won't improve by also
    including the upper always-zero bits in the calculation. To keep things
    as compile-time-constant as they were before, use PADDR_BITS (not
    paddr_bits) for loop bounding. This reduces loop iterations from 8 to 5.
    
    While there also drop the unnecessary conversion to an array of unsigned
    char, moving the value off the stack altogether (at least with
    optimization enabled).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 2497cb428250de36df088b36a47f89a10c115b94
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jan 12 11:11:47 2023 +0100

    x86/shadow: drop a few uses of mfn_valid()
    
    v->arch.paging.shadow.shadow_table[], v->arch.paging.shadow.oos[],
    v->arch.paging.shadow.oos_{snapshot[],fixup[].smfn[]} as well as the
    hash table are all only ever written with valid MFNs or INVALID_MFN.
    Avoid the somewhat expensive mfn_valid() when checking MFNs coming from
    these arrays.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit c47e5d94d0bd0c283bf7f1b31e42314065d82be4
Author: Xenia Ragiadakou <burzalodowa@gmail.com>
Date:   Thu Jan 12 11:09:16 2023 +0100

    x86/iommu: introduce AMD-Vi and Intel VT-d Kconfig options
    
    Introduce two new Kconfig options, AMD_IOMMU and INTEL_IOMMU, to allow code
    specific to each IOMMU technology to be separated and, when not required,
    stripped. AMD_IOMMU will be used to enable IOMMU support for platforms that
    implement the AMD I/O Virtualization Technology. INTEL_IOMMU will be used to
    enable IOMMU support for platforms that implement the Intel Virtualization
    Technology for Directed I/O.
    
    Since, at this point, disabling any of them would cause Xen to not compile,
    the options are not visible to the user and are enabled by default if X86.
    
    Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 83d9679db057d5736c7b5a56db06bb6bb66c3914
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Tue Jan 10 17:17:56 2023 +0200

    xen/riscv: introduce stack stuff
    
    The patch introduces and sets up a stack in order to go to C environment
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

