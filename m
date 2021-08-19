Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5B3F113B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 05:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168374.307420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGYOq-00062w-Ch; Thu, 19 Aug 2021 03:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168374.307420; Thu, 19 Aug 2021 03:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGYOq-000614-6f; Thu, 19 Aug 2021 03:07:24 +0000
Received: by outflank-mailman (input) for mailman id 168374;
 Thu, 19 Aug 2021 03:07:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGYOo-00060u-0b; Thu, 19 Aug 2021 03:07:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGYOn-0003yz-Pa; Thu, 19 Aug 2021 03:07:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGYOn-0008K1-7H; Thu, 19 Aug 2021 03:07:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mGYOn-00023e-6l; Thu, 19 Aug 2021 03:07:21 +0000
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
	bh=HGr2aM3uLBDplUt4G2ViKeW1ecbhoc2U3tHXw0rWwWI=; b=r/rR7wzyd3W9vb7NaNmgV8ePmL
	o8bjcdsSXStVvt+A2xMJfcGr4V5t29Qol1Gjw4C0kHMa+RMQiyMC75or4Uv1Zbfd/KRCJJ1YIUtcp
	CULb43QusS4UHielhu2ZIIVOCKx5RQOXlGoiuKGPBO2b2K+oDCXf3DRvo+CCBd0dSTxk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164237-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 164237: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-amd64-pvgrub:debian-di-install:fail:regression
    xen-unstable:test-amd64-amd64-i386-pvgrub:debian-di-install:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=54c9736382e0d558a6acd820e44185e020131c48
X-Osstest-Versions-That:
    xen=5a88d524857e5bf78b077d30ea515fcaac061bfc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Aug 2021 03:07:21 +0000

flight 164237 xen-unstable real [real]
flight 164246 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/164237/
http://logs.test-lab.xenproject.org/osstest/logs/164246/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-amd64-pvgrub 12 debian-di-install       fail REGR. vs. 164178
 test-amd64-amd64-i386-pvgrub 12 debian-di-install        fail REGR. vs. 164178

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 164178
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 164178
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 164178
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 164178
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 164178
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 164178
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 164178
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 164178
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 164178
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 164178
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 164178
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 xen                  54c9736382e0d558a6acd820e44185e020131c48
baseline version:
 xen                  5a88d524857e5bf78b077d30ea515fcaac061bfc

Last test of basis   164178  2021-08-13 10:47:20 Z    5 days
Failing since        164182  2021-08-14 00:39:12 Z    5 days    8 attempts
Testing same since   164237  2021-08-18 07:24:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Kevin Stefanov <kevin.stefanov@citrix.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

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
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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
commit 54c9736382e0d558a6acd820e44185e020131c48
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Aug 17 11:38:07 2021 +0100

    x86/cet: Fix build on newer versions of GCC
    
    Some versions of GCC complain with:
    
      traps.c:405:22: error: 'get_shstk_bottom' defined but not used [-Werror=unused-function]
       static unsigned long get_shstk_bottom(unsigned long sp)
                            ^~~~~~~~~~~~~~~~
      cc1: all warnings being treated as errors
    
    Change #ifdef to if ( IS_ENABLED(...) ) to make the sole user of
    get_shstk_bottom() visible to the compiler.
    
    Fixes: 35727551c070 ("x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Compile-tested-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

commit 35727551c0703493a2240e967cffc3063b13d49c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 12 17:39:16 2021 +0100

    x86/cet: Fix shskt manipulation error with BUGFRAME_{warn,run_fn}
    
    This was a clear oversight in the original CET work.  The BUGFRAME_run_fn and
    BUGFRAME_warn paths update regs->rip without an equivalent adjustment to the
    shadow stack, causing IRET to suffer #CP because of the mismatch.
    
    One subtle, and therefore fragile, aspect of extable_shstk_fixup() was that it
    required regs->rip to have its old value as a cross-check that the right word
    in the shadow stack was being edited.
    
    Rework extable_shstk_fixup() into fixup_exception_return() which takes
    ownership of the update to both the regular and shadow stacks, ensuring that
    the regs->rip update is ordered correctly.
    
    Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_warn to
    ensure that the shadow stack is updated too.
    
    Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow stack compatible")
    Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit bc141e8ca56200bdd0a12e04a6ebff3c19d6c27b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Aug 16 14:24:44 2021 +0100

    x86/ACPI: Insert missing newlines into FACS error messages
    
    Booting Xen as a PVH guest currently yields:
    
      (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
      (XEN) ACPI: FACS is not 64-byte aligned: 0xfc001010<2>ACPI: wakeup_vec[fc00101c], vec_size[20]
      (XEN) ACPI: Local APIC address 0xfee00000
    
    Insert newlines as appropriate.
    
    Fixes: d3faf9badf52 ("[host s3] Retrieve necessary sleep information from plain-text ACPI tables (FADT/FACS), and keep one hypercall remained for sleep notification.")
    Fixes: 0f089bbf43ec ("x86/ACPI: fix S3 wakeup vector mapping")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 6928bc511399fd8f593fe49a3241212860a6a1b5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Aug 12 14:49:57 2021 +0100

    MAINTAINERS: Fix file path for kexec headers
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 274c5e79c792ce0331d0d8cd9a01545dea5a48fd
Author: Kevin Stefanov <kevin.stefanov@citrix.com>
Date:   Mon Aug 16 15:16:56 2021 +0200

    x86/ioapic: remove use of TRUE/FALSE/1/0
    
    Also fix stray usage in VT-d.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 2e5512d1ffd2e720f25c376df12db8a914117589
Author: Jane Malalane <jane.malalane@citrix.com>
Date:   Mon Aug 16 15:16:20 2021 +0200

    x86/pv: provide more helpful error when CONFIG_PV32 is absent
    
    Currently, when booting a 32bit dom0 kernel, the message isn't very
    helpful:
    
      (XEN)  Xen  kernel: 64-bit, lsb
      (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -> 0x112000
      (XEN) Mismatch between Xen and DOM0 kernel
      (XEN)
      (XEN) ****************************************
      (XEN) Panic on CPU 0:
      (XEN) Could not construct domain 0
      (XEN) ****************************************
    
    With this adjustment, it now looks like this:
    
      (XEN)  Xen  kernel: 64-bit, lsb
      (XEN) Found 32-bit PV kernel, but CONFIG_PV32 missing
      (XEN)
      (XEN) ****************************************
      (XEN) Panic on CPU 0:
      (XEN) Could not construct domain 0
      (XEN) ****************************************
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit c53aa9e655e7c615283e9e9637376c2b865e9dae
Author: Jane Malalane <jane.malalane@citrix.com>
Date:   Mon Aug 16 15:15:43 2021 +0200

    x86/pv: remove unnecessary use of goto out in construct_dom0()
    
    elf_check_broken() only needs to be invoked after elf_xen_parse() and
    after elf_load_binary().
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 60a9d8d2fc9c4a524c7342499580a88aaa3a2b55
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon Aug 16 15:14:37 2021 +0200

    ns16550: do not override fifo size if explicitly set
    
    If fifo size is already set via uart_params, do not force it to 16 - which
    may not match the actual hardware. Specifically Exar cards have fifo of
    256 bytes.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 5c34b9af05b9e5abd25d88efc4fb783136547810
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 13 16:50:09 2021 +0200

    libxc: simplify HYPERCALL_BUFFER()
    
    _hcbuf_buf1 has been there only for a pointer comparison to validate
    type compatibility. The same can be achieved by not using typeof() on
    the definition of what so far was _hcbuf_buf2, as the initializer has
    to also be type-compatible. Drop _hcbuf_buf1 and the comaprison;
    rename _hcbuf_buf2.
    
    Since we're already using compiler extensions here, don't be shy and
    also omit the middle operand of the involved ?: operator.
    
    Bring line continuation character placement in line with that of
    related macros.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit e241d15f1c8a8a02baa401af857393f9ada5aeb3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 13 16:49:46 2021 +0200

    libxenguest: fix off-by-1 in colo-secondary-bitmap merging
    
    Valid GFNs (having a representation in the dirty bitmap) need to be
    strictly below p2m_size.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 1a838bf72584788310496ba5f3d865457c80727f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 13 16:49:10 2021 +0200

    libxenguest: complete loops in xc_map_domain_meminfo()
    
    minfo->p2m_size may have more than 31 significant bits. Change the
    induction variable to unsigned long, and (largely for signed-ness
    consistency) a helper variable to unsigned int. While there also avoid
    open-coding min().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

