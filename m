Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A927B74F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 23:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN12P-0001Ug-1W; Mon, 28 Sep 2020 21:50:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rPw=DF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kN12N-0001UH-GR
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 21:50:23 +0000
X-Inumbo-ID: 45802d87-52db-4e7c-93f5-d51ac6519dd2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45802d87-52db-4e7c-93f5-d51ac6519dd2;
 Mon, 28 Sep 2020 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=crAfwDb90LbFw/b5RTJEBiJ4vqw6t40ZIrPgTBndFBA=; b=Sc89CFlL7BJgh77C2jlrdbrdZC
 CUrDrY5NIuBaTgkaMUp2dA4poGSM5jTcBxJFlpTRTeUcJEaFXKaLdPYhT2kWNo/cBbG8GDbUHu0nC
 C+1135gRsiYGiXCTnFzhOjQaALaC5xk8bCTaLiDwUjud5UIMB5B0ZDR9N1kzzvo1rZ28=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kN12F-0006GQ-R1; Mon, 28 Sep 2020 21:50:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kN12F-0000HP-Hx; Mon, 28 Sep 2020 21:50:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kN12F-0004aA-HU; Mon, 28 Sep 2020 21:50:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155004-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 155004: regressions - FAIL
X-Osstest-Failures: seabios:build-amd64-xsm:xen-build:fail:regression
 seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: seabios=41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5
X-Osstest-Versions-That: seabios=155821a1990b6de78dde5f98fa5ab90e802021e0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Sep 2020 21:50:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 155004 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155004/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152554

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 152554
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 152554
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 152554
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 152554
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 seabios              41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5
baseline version:
 seabios              155821a1990b6de78dde5f98fa5ab90e802021e0

Last test of basis   152554  2020-08-10 15:41:45 Z   49 days
Testing same since   154814  2020-09-25 16:10:32 Z    3 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Berrangé <berrange@redhat.com>
  Matt DeVillier <matt.devillier@puri.sm>

jobs:
 build-amd64-xsm                                              fail    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    


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
commit 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5
Author: Matt DeVillier <matt.devillier@puri.sm>
Date:   Fri Sep 11 12:54:21 2020 -0500

    usb.c: Fix devices using non-primary interface descriptor
    
    A fair number of USB devices (keyboards in particular) use an
    interface descriptor
    other than the first available, making them non-functional currently.
    To correct this, iterate through all available interface descriptors
    until one with the correct class/subclass is found, then proceed to set the
    configuration and setup the driver.
    
    Tested on an ultimate hacking keyboard (UHK 60)
    
    Signed-off-by: Matt DeVillier <matt.devillier@puri.sm>

commit 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5
Author: Daniel P. Berrangé <berrange@redhat.com>
Date:   Tue Sep 8 16:16:53 2020 +0100

    smbios: avoid integer overflow when adding SMBIOS type 0 table
    
    SeaBIOS implements the SMBIOS 2.1 entry point which is limited to a
    maximum length of 0xffff. If the SMBIOS data received from QEMU is large
    enough, then adding the type 0 table will cause integer overflow. This
    results in fun behaviour such as KVM crash, or hangs in SeaBIOS.
    
    Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

