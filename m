Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F7A1AA8E3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiJo-0005GV-DO; Wed, 15 Apr 2020 13:43:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+yDq=57=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jOiJn-0005GQ-BE
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:43:07 +0000
X-Inumbo-ID: 0869c0d4-7f1f-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0869c0d4-7f1f-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CoEv60sRIp/WYanHll9JFwJ7C43KeqWNJeLp/SPdbXI=; b=vIzwpH92FWj87hQgKEtkaar/o
 o/MWM/59qBqZvWPLH5ip/Ib0oZBWajyF3zOSL5HJomkoioBcAKa3QzS5TR7EGjqoIWcGvuyIbOran
 y3T9z6t+sqD5Z6HaUttuCOkEHJn0KQfp/y8vBqlwCiSft/3OeyZQh09kj7hmeDJu0U72o=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOiJk-000466-PR; Wed, 15 Apr 2020 13:43:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOiJk-0000SW-HB; Wed, 15 Apr 2020 13:43:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jOiJk-0001MK-GC; Wed, 15 Apr 2020 13:43:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149650-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.10-testing test] 149650: regressions - trouble:
 fail/pass/starved
X-Osstest-Failures: xen-4.10-testing:test-xtf-amd64-amd64-5:xtf/test-hvm64-lbr-tsx-vmentry:fail:regression
 xen-4.10-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: xen=24d62e126296b3f67dabdd49887d41d8ed69487f
X-Osstest-Versions-That: xen=49a5d6e92317a7d9acbf0bdbd25b2809dfd84260
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Apr 2020 13:43:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149650 xen-4.10-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149650/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-xtf-amd64-amd64-5 51 xtf/test-hvm64-lbr-tsx-vmentry fail REGR. vs. 146101

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2 fail like 146076
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop             fail like 146101
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  24d62e126296b3f67dabdd49887d41d8ed69487f
baseline version:
 xen                  49a5d6e92317a7d9acbf0bdbd25b2809dfd84260

Last test of basis   146101  2020-01-15 04:00:32 Z   91 days
Testing same since   149650  2020-04-14 13:35:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Pawel Wieczorkiewicz <wipawel@amazon.de>
  Ross Lagerwall <ross.lagerwall@citrix.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
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
 test-arm64-arm64-xl-thunderx                                 starved 
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
commit 24d62e126296b3f67dabdd49887d41d8ed69487f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 14 15:14:21 2020 +0200

    gnttab: fix GNTTABOP_copy continuation handling
    
    The XSA-226 fix was flawed - the backwards transformation on rc was done
    too early, causing a continuation to not get invoked when the need for
    preemption was determined at the very first iteration of the request.
    This in particular means that all of the status fields of the individual
    operations would be left untouched, i.e. set to whatever the caller may
    or may not have initialized them to.
    
    This is part of XSA-318.
    
    Reported-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Tested-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
    master commit: d6f22d5d9e8d6848ec229083ac9fb044f0adea93
    master date: 2020-04-14 14:42:32 +0200

commit cbedabf8276f95bb4e93a5df43257790de87daad
Author: Ross Lagerwall <ross.lagerwall@citrix.com>
Date:   Tue Apr 14 15:13:24 2020 +0200

    xen/gnttab: Fix error path in map_grant_ref()
    
    Part of XSA-295 (c/s 863e74eb2cffb) inadvertently re-positioned the brackets,
    changing the logic.  If the _set_status() call fails, the grant_map hypercall
    would fail with a status of 1 (rc != GNTST_okay) instead of the expected
    negative GNTST_* error.
    
    This error path can be taken due to bad guest state, and causes net/blk-back
    in Linux to crash.
    
    This is XSA-316.
    
    Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    master commit: da0c66c8f48042a0186799014af69db0303b1da5
    master date: 2020-04-14 14:41:02 +0200

commit 38e589d4b0eeb917e14cc021e62669f04cabd31b
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Apr 14 15:11:38 2020 +0200

    xen/rwlock: Add missing memory barrier in the unlock path of rwlock
    
    The rwlock unlock paths are using atomic_sub() to release the lock.
    However the implementation of atomic_sub() rightfully doesn't contain a
    memory barrier. On Arm, this means a processor is allowed to re-order
    the memory access with the preceeding access.
    
    In other words, the unlock may be seen by another processor before all
    the memory accesses within the "critical" section.
    
    The rwlock paths already contains barrier indirectly, but they are not
    very useful without the counterpart in the unlock paths.
    
    The memory barriers are not necessary on x86 because loads/stores are
    not re-ordered with lock instructions.
    
    So add arch_lock_release_barrier() in the unlock paths that will only
    add memory barrier on Arm.
    
    Take the opportunity to document each lock paths explaining why a
    barrier is not necessary.
    
    This is XSA-314.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    master commit: 6890a04072e664c25447a297fe663b45ecfd6398
    master date: 2020-04-14 14:37:11 +0200

commit a91b8fc39e46c7b270c63882a1033b3c4faef5bf
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 14 15:10:48 2020 +0200

    xenoprof: limit consumption of shared buffer data
    
    Since a shared buffer can be written to by the guest, we may only read
    the head and tail pointers from there (all other fields should only ever
    be written to). Furthermore, for any particular operation the two values
    must be read exactly once, with both checks and consumption happening
    with the thus read values. (The backtrace related xenoprof_buf_space()
    use in xenoprof_log_event() is an exception: The values used there get
    re-checked by every subsequent xenoprof_add_sample().)
    
    Since that code needed touching, also fix the double increment of the
    lost samples count in case the backtrace related xenoprof_add_sample()
    invocation in xenoprof_log_event() fails.
    
    Where code is being touched anyway, add const as appropriate, but take
    the opportunity to entirely drop the now unused domain parameter of
    xenoprof_buf_space().
    
    This is part of XSA-313.
    
    Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    master commit: 50ef9a3cb26e2f9383f6fdfbed361d8f174bae9f
    master date: 2020-04-14 14:33:19 +0200

commit 3e0c3163a0171914afb8d1fba44afafeac4b2267
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 14 15:08:26 2020 +0200

    xenoprof: clear buffer intended to be shared with guests
    
    alloc_xenheap_pages() making use of MEMF_no_scrub is fine for Xen
    internally used allocations, but buffers allocated to be shared with
    (unpriviliged) guests need to be zapped of their prior content.
    
    This is part of XSA-313.
    
    Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    master commit: 0763a7ebfcdad66cf9e5475a1301eefb29bae9ed
    master date: 2020-04-14 14:32:33 +0200
(qemu changes not included)

