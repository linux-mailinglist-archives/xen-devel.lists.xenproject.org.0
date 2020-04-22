Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D401B4B05
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 18:55:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRIdv-000829-U8; Wed, 22 Apr 2020 16:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GuZW=6G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRIdu-000824-1E
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 16:54:34 +0000
X-Inumbo-ID: ec78e4cc-84b9-11ea-92b3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec78e4cc-84b9-11ea-92b3-12813bfff9fa;
 Wed, 22 Apr 2020 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vd6xwCvnAXhZwTflpdqa+AEVWuNFChrum4ai7fk3Ob8=; b=odEoDIxj8Afwe7evkQWjgcp5l
 HCOhgkXoq4p19owzPgoP0BeqHdPxC0R5/Y5K6S8a0KTZ2r1/IVzDrvwukWqmc2Ox+bDF/p2/mNOfx
 /zpyBKCr2fa9ieF4bRmFlBy9FwmkTZVHsGYzKO1fEdJEkrFfa41/DtNShxkBbce02FvQo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRIdl-0003ga-PK; Wed, 22 Apr 2020 16:54:25 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRIdl-0001wH-Bc; Wed, 22 Apr 2020 16:54:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRIdl-0004N7-AI; Wed, 22 Apr 2020 16:54:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149726-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 149726: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:guest-start/redhat.repeat:fail:regression
 xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=4803a67114279a656a54a23cebed646da32efeb6
X-Osstest-Versions-That: xen=82dd1a956d9b68f52e830d1dddfdfb4ab4d5a638
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Apr 2020 16:54:25 +0000
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

flight 149726 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149726/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd 12 guest-start/redhat.repeat fail REGR. vs. 149705

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 149702
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 149705
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149705
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 149705
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 149705
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 149705
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149705
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 149705
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 149705
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149705
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 149705
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  4803a67114279a656a54a23cebed646da32efeb6
baseline version:
 xen                  82dd1a956d9b68f52e830d1dddfdfb4ab4d5a638

Last test of basis   149705  2020-04-21 10:39:06 Z    1 days
Testing same since   149726  2020-04-21 22:07:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>
  Wei Liu <wl@xen.org>

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
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
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
 test-amd64-amd64-xl-rtds                                     fail    
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
commit 4803a67114279a656a54a23cebed646da32efeb6
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 21 17:56:57 2020 +0000

    x86: Enumeration for Control-flow Enforcement Technology
    
    The CET spec has been published and guest kernels are starting to get support.
    Introduce the CPUID and MSRs, and fully block the MSRs from guest use.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 7aacf6ac49829d8dd6242f67460f4d52d0d36503
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 11:03:46 2020 +0200

    x86/shadow: don't open-code shadow_blow_tables_per_domain()
    
    Make shadow_blow_all_tables() call the designated function, and on this
    occasion make the function itself use domain_vcpu().
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit e55c9b25349c133a333b7b827d3b4645a84b5846
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 11:02:36 2020 +0200

    x86/shadow: the trace_emul_write_val() hook is HVM-only
    
    Its only caller lives in HVM-only code, and the only caller of
    trace_shadow_emulate() also already site in a HVM-only code section.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 2fb2dee1ac6288349a8a8320cde739df4f0e379f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 10:59:43 2020 +0200

    x86/mm: pagetable_dying() is HVM-only
    
    Its only caller lives in HVM-only code.
    
    This involves wider changes, in order to limit #ifdef-ary: Shadow's
    SHOPT_FAST_EMULATION and the fields used by it get constrained to HVM
    builds as well. Additionally the shadow_{init,continue}_emulation()
    stubs for the !HVM case aren't needed anymore and hence get dropped.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 8b8d011ad868df38afae6282103087556beaa1f9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 10:58:45 2020 +0200

    x86/shadow: the guess_wrmap() hook is needed for HVM only
    
    sh_remove_write_access() bails early for !external guests, and hence its
    building and thus the need for the hook can be suppressed altogether in
    !HVM configs.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit df9238eaa4ad870bab835de5be3242f8f2a632ce
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 10:58:05 2020 +0200

    x86/shadow: sh_remove_write_access_from_sl1p() can be static
    
    It's only used by common.c.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 452219e246486d35fffb0b418f97db1beb9bc37c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 10:57:04 2020 +0200

    x86/shadow: monitor table is HVM-only
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit ac7addbeff73bc8b06d8234a0e1658bba9368164
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 10:55:58 2020 +0200

    x86/shadow: drop a stray forward structure declaration
    
    struct sh_emulate_ctxt is private to shadow code, and hence a
    declaration for it is not needed here.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 3957e12c02670b97855ef0933b373f99993fa598
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Apr 21 10:54:56 2020 +0200

    x86/vtd: relax EPT page table sharing check
    
    The EPT page tables can be shared with the IOMMU as long as the page
    sizes supported by EPT are also supported by the IOMMU.
    
    Current code checks that both the IOMMU and EPT support the same page
    sizes, but this is not strictly required, the IOMMU supporting more
    page sizes than EPT is fine and shouldn't block page table sharing.
    
    This is likely not a common case (IOMMU supporting more page sizes
    than EPT), but should still be fixed for correctness.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit a94b55a2986145ab5b357feb340f782d9d199d10
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 21 10:51:42 2020 +0200

    x86emul: SYSRET must change CPL
    
    The special AMD behavior of leaving SS mostly alone wasn't really
    complete: We need to adjust CPL aka SS.DPL.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>

commit 59b087e3954402c487e0abb4ad9bd05f43669436
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Mar 30 15:14:23 2020 +0100

    tools/ocaml: Fix stubs build when OCaml has been compiled with -safe-string
    
    The OCaml code has been fixed to handle properly -safe-string in Xen
    4.11, however the stubs part were missed.
    
    On OCaml newer than 4.06.1, String_Val() will return a const char *
    when using -safe-string leading to build failure when this is used
    in place where char * is expected.
    
    The main use in Xen code base is when a new string is allocated. The
    suggested approach by the OCaml community [1] is to use the helper
    caml_alloc_initialized_string() but it was introduced by OCaml 4.06.1.
    
    The next best approach is to cast String_val() to (char *) as the helper
    would have done. So use it when we need to update the new string using
    memcpy().
    
    Take the opportunity to remove the unnecessary cast of the source as
    mempcy() is expecting a void *.
    
    [1] https://github.com/ocaml/ocaml/pull/1274
    
    Reported-by: Dario Faggioli <dfaggioli@suse.com>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit 78686437e949a85a207ae1a0d637efe2d3778bbe
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Mar 30 18:50:08 2020 +0100

    tools/ocaml: libxb: Avoid to use String_val() when value is bytes
    
    Commit ec7d54dd1a "ocaml/libs/xb: Use bytes in place of strings for
    mutable buffers" switch mutable buffers from string to bytes. However
    the C code were still using String_Val() to access them.
    
    While the underlying structure is the same between string and bytes, a
    string is meant to be immutable. OCaml 4.06.1 and later will enforce it.
    Therefore, it will not be possible to build the OCaml libs when using
    -safe-string. This is because String_val() will return a const value.
    
    To avoid plain cast in the code, the code is now switched to use
    Bytes_val(). As the macro is not defined in older OCaml version, we need
    to provide a stub.
    
    Take the opportunity to switch to const the buffer in
    ml_interface_write() as it should not be modified.
    
    Reported-by: Dario Faggioli <dfaggioli@suse.com>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit d92ba1aa7cf877a77abdcbd94a6a19fc55886a75
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Mar 30 14:29:10 2020 +0100

    tools/ocaml: libxb: Harden stub_header_of_string()
    
    stub_header_of_string() should not modify the header. So mark the
    variable 'hdr' as const.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit 3bf69699cacad3efb4fe6109044365f79379ed20
Author: Julien Grall <jgrall@amazon.com>
Date:   Sun Mar 29 20:12:34 2020 +0100

    tools/ocaml: libxc: Check error return in stub_xc_vcpu_context_get()
    
    xc_vcpu_getcontext() may fail to retrieve the vcpu context. Rather than
    ignoring the return value, check it and throw an error if needed.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit ca58e7b0800aaef85739508674abca2db9c6637d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Apr 17 12:31:13 2020 +0100

    x86/pv: Delete CONFIG_PV_LDT_PAGING
    
    ... in accordance with the timeline laid out in the Kconfig message.  There
    has been no comment since it was disabled by default.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wl@xen.org>
(qemu changes not included)

