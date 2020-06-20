Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89EF2021FA
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 08:45:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmXDf-0001Ii-6o; Sat, 20 Jun 2020 06:43:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WcHl=AB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jmXDe-0001Id-4X
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2020 06:43:14 +0000
X-Inumbo-ID: 4dddf0ba-b2c1-11ea-bc4b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dddf0ba-b2c1-11ea-bc4b-12813bfff9fa;
 Sat, 20 Jun 2020 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hmW3VeEuR26357pFMDbJpgKGvADQBW/+Bpmtw48Lxis=; b=Xk4pMfx17iau552ZQkESVoFjg
 n/P6AerloIYF6fStDqjOyPmTJHoLijtIxT+KMGECY9suU+/1G9FjRLgQJ0PV2q9+dg2fFUSnIGmwT
 21fHbjr8+DIrfWPcDgFXQ5BCXb6QKBa23QoF5cgGRK7WH3rmKUp7QwZ+Sx34lST8Pf03s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmXDY-0005FO-Ui; Sat, 20 Jun 2020 06:43:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmXDY-0005mH-PI; Sat, 20 Jun 2020 06:43:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jmXDY-0007fT-Oe; Sat, 20 Jun 2020 06:43:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151224-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 151224: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: xen=71ca0e0ad000e690899936327eb09709ab182ade
X-Osstest-Versions-That: xen=3625b04991b4d6affadd99d377ab84bac48dfff4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 20 Jun 2020 06:43:08 +0000
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

flight 151224 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151224/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151181
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151181

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151181
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 151181
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 151181
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151181
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 151181
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151181
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 151181
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151181
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 151181
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 151181
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 xen                  71ca0e0ad000e690899936327eb09709ab182ade
baseline version:
 xen                  3625b04991b4d6affadd99d377ab84bac48dfff4

Last test of basis   151181  2020-06-17 06:01:52 Z    3 days
Testing same since   151224  2020-06-18 16:01:07 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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
commit 71ca0e0ad000e690899936327eb09709ab182ade
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 12 13:39:13 2020 +0100

    x86/spec-ctrl: Hide RDRAND by default on IvyBridge client
    
    To combat the absence of mitigating microcode, arrange to hide RDRAND by
    default on IvyBridge client hardware.
    
    Adjust the default feature derivation to hide RDRAND on IvyBridge client
    parts, unless `cpuid=rdrand` is explicitly provided.
    
    Adjust the restore path in xc_cpuid_apply_policy() to not hide RDRAND from VMs
    which migrated from pre-4.14.
    
    In all cases, individual guests can continue using RDRAND if explicitly
    enabled in their config files.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit fde4acd5feb7961269a2e6edd918c7a46626cf6b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jun 15 13:42:11 2020 +0100

    x86/cpuid: Introduce missing feature adjustment in calculate_pv_def_policy()
    
    This was an accidental asymmetry with the HVM side.
    
    No change in behaviour at this point.
    
    Fixes: 83b387382 ("x86/cpuid: Introduce and use default CPUID policies")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 54463aa79dac70a9d92f55650c7b8fe3e9fcc967
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Feb 24 17:15:56 2020 +0000

    x86/hvm: Disable MPX by default
    
    Memory Protection eXtension support has been dropped from GCC and Linux, and
    will be dropped from future Intel CPUs.
    
    With all other default/max pieces in place, move MPX from default to max.
    This means that VMs won't be offered it by default, but can explicitly opt
    into using it via cpuid="host,mpx=1" in their vm.cfg file.
    
    The difference as visible to the guest is:
    
      diff --git a/default b/mpx
      index 0e91765d6b..c8c33cd584 100644
      --- a/default
      +++ b/mpx
      @@ -13,15 +13,17 @@ Native cpuid:
         00000004:00000004 -> 00000000:00000000:00000000:00000000
         00000005:ffffffff -> 00000000:00000000:00000000:00000000
         00000006:ffffffff -> 00000000:00000000:00000000:00000000
      -  00000007:00000000 -> 00000000:009c2fbb:00000000:9c000400
      +  00000007:00000000 -> 00000000:009c6fbb:00000000:9c000400
         00000008:ffffffff -> 00000000:00000000:00000000:00000000
         00000009:ffffffff -> 00000000:00000000:00000000:00000000
         0000000a:ffffffff -> 00000000:00000000:00000000:00000000
         0000000b:ffffffff -> 00000000:00000000:00000000:00000000
         0000000c:ffffffff -> 00000000:00000000:00000000:00000000
      -  0000000d:00000000 -> 00000007:00000240:00000340:00000000
      +  0000000d:00000000 -> 0000001f:00000240:00000440:00000000
         0000000d:00000001 -> 0000000f:00000240:00000000:00000000
         0000000d:00000002 -> 00000100:00000240:00000000:00000000
      +  0000000d:00000003 -> 00000040:000003c0:00000000:00000000
      +  0000000d:00000004 -> 00000040:00000400:00000000:00000000
         40000000:ffffffff -> 40000005:566e6558:65584d4d:4d4d566e
         40000001:ffffffff -> 0004000e:00000000:00000000:00000000
         40000002:ffffffff -> 00000001:40000000:00000000:00000000
    
    Adjust the legacy restore path in libxc to cope safely with pre-4.14 VMs.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 1accd92514f286c44e76f198f1bba90ad2e9e83b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Feb 25 15:33:31 2020 +0000

    x86/gen-cpuid: Distinguish default vs max in feature annotations
    
    The toolstack logic can now correctly distinguish a clean boot from a
    migrate/restore.
    
    Allow lowercase a/s/h to be used to annotate a non-default feature.
    
    Due to the emulator work prepared earlier in 4.14, this now allows VMs to
    explicity opt in to the TSXLDTRK, MOVDIR{I,64B} and SERIALIZE instructions via
    their xl.cfg file, rather than getting them as a matter of default.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 057012d2899e4e71e274f77fcab136b0cad23099
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 12 14:07:10 2020 +0100

    tools/libx[cl]: Plumb bool restore down into xc_cpuid_apply_policy()
    
    In order to safely disable some features by default, without breaking
    migration from 4.13 or older, the CPUID logic needs to distinguish the two
    cases.
    
    Plumb a restore boolean down from the two callers of libxl__cpuid_legacy() all
    the way down into xc_cpuid_apply_policy().
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit f79cd47cd7a2ea321a0fe7d46586bdbea4845cdd
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 12 14:07:10 2020 +0100

    tools/libx[cl]: Merge xc_cpuid_set() into xc_cpuid_apply_policy()
    
    This reduces the number of CPUID handling entry-points to just one.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 585c7f4317987b4e92a381d6178be238be4c9653
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 12 14:07:10 2020 +0100

    tools/libx[cl]: Move processing loop down into xc_cpuid_set()
    
    Currently, libxl__cpuid_legacy() passes each element of the policy list to
    xc_cpuid_set() individually.  This is wasteful both in terms of the number of
    hypercalls made, and the quantity of repeated merging/auditing work performed
    by Xen.
    
    Move the loop processing down into xc_cpuid_set(), which allows us to do one
    set of hypercalls, rather than one per list entry.
    
    In xc_cpuid_set(), obtain the full host, guest max and current policies to
    begin with, and loop over the xend array, processing one leaf at a time.
    Replace the linear search with a binary search, seeing as the serialised
    leaves are sorted.
    
    No change in behaviour from the guests point of view.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit c22ced93e167f56104111fcc414298c0cd2db3e9
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 12 16:48:02 2020 +0100

    tests/cpu-policy: Confirm that CPUID serialisation is sorted
    
    The existing x86_cpuid_copy_to_buffer() does produce sorted results, and we're
    about to start relying on this.  Extend the unit tests.
    
    As test_cpuid_serialise_success() is a fairly limited set of synthetic
    examples right now, introduce test_cpuid_current() to operate on the full
    policy for the current CPU.
    
    Tweak the fail() macro to allow for simplified control flow.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 700738bf6a7a89a1b41cc783ae58f7c8ec1e9cfa
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 12 14:05:44 2020 +0100

    tools/libx[cl]: Introduce struct xc_xend_cpuid for xc_cpuid_set()
    
    In order to combine the functionality of xc_cpuid_set() with
    xc_cpuid_apply_policy(), arrange to pass the data in a single contained
    struct, rather than two arrays.
    
    libxl__cpuid_policy is the ideal structure to use, but that would introduce a
    reverse dependency between libxc and libxl.  Introduce xc_xend_cpuid (with a
    transparent union to provide more useful names for the inputs), and use this
    structure in libxl.
    
    The public API has libxl_cpuid_policy as an opaque type referencing
    libxl__cpuid_policy.  Drop the inappropriate comment about its internals, and
    use xc_xend_cpuid as a differently named opaque backing object.  Users of both
    libxl and libxc are not permitted to look at the internals.
    
    No change in behaviour.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>
(qemu changes not included)

