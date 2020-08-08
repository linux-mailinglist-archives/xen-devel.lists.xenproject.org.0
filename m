Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64B23F817
	for <lists+xen-devel@lfdr.de>; Sat,  8 Aug 2020 17:49:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4R4S-0002pY-Dz; Sat, 08 Aug 2020 15:47:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yjcu=BS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k4R4R-0002pE-Sp
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2020 15:47:43 +0000
X-Inumbo-ID: 721e35ed-3dea-4e49-a119-1e0eb0fb15f5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 721e35ed-3dea-4e49-a119-1e0eb0fb15f5;
 Sat, 08 Aug 2020 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PzDUzC1FW2F/y7I8uQhkzT8pcj4bgbPjpnz7eUwZKL8=; b=a2xdfAuFL9+KTd0sNEPceoMKO
 7kOTFeBQq1cOpND+yGZTItTG4wj6gjWndjG/ckGz94vCT2UD9LePmGAYphK5PBOuyM+M9VGu4Imte
 t3FJRO2rmytLJx8/W9uNh4RlmBtMUU4Nu03rihoTl0FIgyEHdQYvaurTzyo6hL8p86NdQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k4R4L-0001Ui-1P; Sat, 08 Aug 2020 15:47:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k4R4K-0002fL-L4; Sat, 08 Aug 2020 15:47:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k4R4K-0005QZ-Ho; Sat, 08 Aug 2020 15:47:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152531-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 152531: regressions - FAIL
X-Osstest-Failures: xen-4.14-testing:test-amd64-i386-libvirt:guest-start/debian.repeat:fail:regression
 xen-4.14-testing:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.14-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: xen=c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
X-Osstest-Versions-That: xen=456957aaa1391e0dfa969e2dd97b87c51a79444e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 08 Aug 2020 15:47:36 +0000
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

flight 152531 xen-4.14-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152531/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt     18 guest-start/debian.repeat fail REGR. vs. 152153

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 152153
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass

version targeted for testing:
 xen                  c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
baseline version:
 xen                  456957aaa1391e0dfa969e2dd97b87c51a79444e

Last test of basis   152153  2020-07-23 15:18:22 Z   16 days
Testing same since   152531  2020-08-07 15:39:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Fam Zheng <famzheng@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Paul Durrant <pdurrant@amazon.com>

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
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
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
commit c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 7 17:11:44 2020 +0200

    x86: comment update after "drop high compat r/o M2P table address range"
    
    Commit 5af040ef8b57 clearly should also have updated the comment, not
    just the #define-s.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 2e98d0b1d09e99e3d1287cb13f42b604ebc3c29a
    master date: 2020-08-05 10:21:22 +0200

commit 864d5701ec5dc5af028d415e86bf5cf6aaed3a7c
Author: Paul Durrant <pdurrant@amazon.com>
Date:   Fri Aug 7 17:11:10 2020 +0200

    x86/hvm: set 'ipat' in EPT for special pages
    
    All non-MMIO ranges (i.e those not mapping real device MMIO regions) that
    map valid MFNs are normally marked MTRR_TYPE_WRBACK and 'ipat' is set. Hence
    when PV drivers running in a guest populate the BAR space of the Xen Platform
    PCI Device with pages such as the Shared Info page or Grant Table pages,
    accesses to these pages will be cachable.
    
    However, should IOMMU mappings be enabled be enabled for the guest then these
    accesses become uncachable. This has a substantial negative effect on I/O
    throughput of PV devices. Arguably PV drivers should bot be using BAR space to
    host the Shared Info and Grant Table pages but it is currently commonplace for
    them to do this and so this problem needs mitigation. Hence this patch makes
    sure the 'ipat' bit is set for any special page regardless of where in GFN
    space it is mapped.
    
    NOTE: Clearly this mitigation only applies to Intel EPT. It is not obvious
          that there is any similar mitigation possible for AMD NPT. Downstreams
          such as Citrix XenServer have been carrying a patch similar to this for
          several releases though.
    
    Signed-off-by: Paul Durrant <pdurrant@amazon.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: ca24b2ffdbd9a25b2d313a547ccbe97baf3e5a8d
    master date: 2020-07-31 17:42:47 +0200

commit afed8e4365f0dec26a040ea0670b654e00d8c869
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 7 17:10:34 2020 +0200

    x86emul: replace UB shifts
    
    Displacement values can be negative, hence we shouldn't left-shift them.
    Or else we get
    
    (XEN) UBSAN: Undefined behaviour in x86_emulate/x86_emulate.c:3482:55
    (XEN) left shift of negative value -2
    
    While auditing shifts, I noticed a pair of missing parentheses, which
    also get added right here.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    
    x86: comment update after "drop high compat r/o M2P table address range"
    
    Commit 5af040ef8b57 clearly should also have updated the comment, not
    just the #define-s.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: b6a907f8c83d37886d0523f1aeff61b98e133498
    master date: 2020-07-31 17:41:58 +0200
    master commit: 2e98d0b1d09e99e3d1287cb13f42b604ebc3c29a
    master date: 2020-08-05 10:21:22 +0200

commit a5dab0a2453da1e15fd49e6a7fa9138e333ba9af
Author: Fam Zheng <famzheng@amazon.com>
Date:   Fri Aug 7 17:09:51 2020 +0200

    x86/cpuid: Fix APIC bit clearing
    
    The bug is obvious here, other places in this function used
    "cpufeat_mask" correctly.
    
    Fixed: b648feff8ea2 ("xen/x86: Improvements to in-hypervisor cpuid sanity checks")
    Signed-off-by: Fam Zheng <famzheng@amazon.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 64219fa179c3e48adad12bfce3f6b3f1596cccbf
    master date: 2020-07-29 19:03:41 +0100

commit b8c3e33a4fe4374f633b4369200731662ff1f750
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 7 17:09:19 2020 +0200

    x86/S3: put data segment registers into known state upon resume
    
    wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
    wakeup_start did set it to, and %gs at whatever BIOS did load into it.
    All of this may end up confusing the first load_segments() to run on
    the BSP after resume, in particular allowing a non-nul selector value
    to be left in %fs.
    
    Alongside %ss, also put all other data segment registers into the same
    state that the boot and CPU bringup paths put them in.
    
    Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 55f8c389d4348cc517946fdcb10794112458e81e
    master date: 2020-07-24 10:17:26 +0200

commit f836759a7bbf095dc5b1f31a069296bcfd694b82
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Aug 7 17:07:56 2020 +0200

    update Xen version to 4.14.1-pre
(qemu changes not included)

