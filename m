Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B251DA8FD
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 06:13:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbG56-0000tQ-Pe; Wed, 20 May 2020 04:11:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfT1=7C=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbG54-0000tL-W6
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 04:11:47 +0000
X-Inumbo-ID: 001461b9-9a50-11ea-a9b7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 001461b9-9a50-11ea-a9b7-12813bfff9fa;
 Wed, 20 May 2020 04:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FTS4PYr4iEOKvYvICgCDcnitb1R9lzKjtKr1VfU5EOc=; b=TGQ7g3ifur9ltnk6BKTQSJMvd
 O/LkYe2GxOYHX3zFcSAnBUmMvnsM96QF++nHF51a3j42zg3X6Q9f8l5qfrO7tmBcqVCqkIlgwC4T2
 zN2ZuO2jAJ8cgKtAUqNhUCgCfqzUncg0Vv49LILu+yaDf2v6pJs703LuMeMJrOWMIjE8Y=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbG4v-0005zF-4G; Wed, 20 May 2020 04:11:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbG4u-0001qC-So; Wed, 20 May 2020 04:11:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbG4u-0001s1-Rq; Wed, 20 May 2020 04:11:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150247-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 150247: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-armhf-armhf-xl:xen-boot:fail:regression
 xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=7efd9f3d45480c12328e4419547a98022f7af43a
X-Osstest-Versions-That: xen=664e1bc12f8658da124a4eff7a8f16da073bd47f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 May 2020 04:11:36 +0000
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

flight 150247 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150247/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           7 xen-boot                 fail REGR. vs. 150227

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150227
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150227
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150227
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150227
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150227
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150227
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150227
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150227
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150227
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150227
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 150227
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7efd9f3d45480c12328e4419547a98022f7af43a
baseline version:
 xen                  664e1bc12f8658da124a4eff7a8f16da073bd47f

Last test of basis   150227  2020-05-18 01:51:25 Z    2 days
Failing since        150234  2020-05-18 18:06:10 Z    1 days    3 attempts
Testing same since   150247  2020-05-19 16:07:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Eric Shelton <eshelton@pobox.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Simon Gaiser <simon@invisiblethingslab.com>
  Wei Liu <wei.liu2@citrix.com>
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
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
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
commit 7efd9f3d45480c12328e4419547a98022f7af43a
Author: Eric Shelton <eshelton@pobox.com>
Date:   Mon May 18 21:54:49 2020 -0400

    libxl: Handle Linux stubdomain specific QEMU options.
    
    This patch creates an appropriate command line for the QEMU instance
    running in a Linux-based stubdomain.
    
    NOTE: a number of items are not currently implemented for Linux-based
    stubdomains, such as:
    - save/restore
    - QMP socket
    - graphics output (e.g., VNC)
    
    Signed-off-by: Eric Shelton <eshelton@pobox.com>
    
    Simon:
     * fix disk path
     * fix cdrom path and "format"
    
    Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
    [drop Qubes-specific parts]
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    
    Allow setting stubdomain_ramdisk independently from stubdomain_kernel
    Add a qemu- prefix for qemu-stubdom-linux-{kernel,rootfs} since stubdom
    doesn't convey device-model.  Use qemu- since this code is qemu specific.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 46587a30d4cb7702a8c2074c98d687b6f9602e6c
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:48 2020 -0400

    libxl: Allow running qemu-xen in stubdomain
    
    Do not prohibit anymore using stubdomain with qemu-xen.
    To help distingushing MiniOS and Linux stubdomain, add helper inline
    functions libxl__stubdomain_is_linux() and
    libxl__stubdomain_is_linux_running(). Those should be used where really
    the difference is about MiniOS/Linux, not qemu-xen/qemu-xen-traditional.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 11b7f8725d5f992a384a6ca55a08e5e908c06d85
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:47 2020 -0400

    libxl: fix qemu-trad cmdline for no sdl/vnc case
    
    When qemu is running in stubdomain, any attempt to initialize vnc/sdl
    there will crash it (on failed attempt to load a keymap from a file). If
    vfb is present, all those cases are skipped. But since
    b053f0c4c9e533f3d97837cf897eb920b8355ed3 "libxl: do not start dom0 qemu
    for stubdomain when not needed" it is possible to create a stubdomain
    without vfb and contrary to the comment -vnc none do trigger VNC
    initialization code (just skips exposing it externally).
    Change the implicit SDL avoiding method to -nographics option, used when
    none of SDL or VNC is enabled.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

commit cd7181308e196cba5375202262d1e27d9f0ac49c
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:46 2020 -0400

    Document ioemu Linux stubdomain protocol
    
    Add documentation for upcoming Linux stubdomain for qemu-upstream.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit c7c145470168c67ba45911370bd6902917e59da5
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Mon May 18 21:54:45 2020 -0400

    Document ioemu MiniOS stubdomain protocol
    
    Add documentation based on reverse-engineered toolstack-ioemu stubdomain
    protocol.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 475ffdbbf5778329319ef6f7bd6315c163163440
Author: Olaf Hering <olaf@aepfle.de>
Date:   Mon May 18 16:44:00 2020 +0200

    tools: use HOSTCC/CPP to compile rombios code and helper
    
    Use also HOSTCFLAGS for biossums while touching the code.
    
    Spotted by inspecting build logfile.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 2b532519d64e653a6bbfd9eefed6040a09c8876d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 18 17:18:56 2020 +0200

    x86: determine MXCSR mask in all cases
    
    For its use(s) by the emulator to be correct in all cases, the filling
    of the variable needs to be independent of XSAVE availability. As
    there's no suitable function in i387.c to put the logic in, keep it in
    xstate_init(), arrange for the function to be called unconditionally,
    and pull the logic ahead of all return paths there.
    
    Fixes: 9a4496a35b20 ("x86emul: support {,V}{LD,ST}MXCSR")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4c73a2a939a51dee47db77b31208157dbc29fe98
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 18 17:17:51 2020 +0200

    x86/mem-paging: consistently use gfn_t
    
    Where gprintk()s get touched anyway to switch to PRI_gfn, also switch to
    %pd for the domain logged.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 02a2b19c8e2532998e262727d32c574267ac6b48
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 18 17:16:55 2020 +0200

    x86/mem-paging: move code to its dedicated source file
    
    Do a little bit of style adjustment along the way, and drop the
    "p2m_mem_paging_" prefixes from the now static functions.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 9f40699c956c10419a91db0ff8d0c985dd3b2800
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 18 17:15:46 2020 +0200

    x86/mem-paging: use guest handle for XENMEM_paging_op_prep
    
    While it should have been this way from the beginning, not doing so will
    become an actual problem with PVH Dom0. The interface change is binary
    compatible, but requires tools side producers to be re-built.
    
    Drop the bogus/unnecessary page alignment restriction on the input
    buffer at the same time.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 5dc999d711a75e1a83d4b21da203d3c3197ec0e0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon May 18 17:13:38 2020 +0200

    x86/mm: no-one passes a NULL domain to init_xen_l4_slots()
    
    Drop the NULL checks - they've been introduced by commit 8d7b633ada
    ("x86/mm: Consolidate all Xen L4 slot writing into
    init_xen_l4_slots()") without giving a reason; I'm told this was done
    in anticipation of the function potentially getting called with a NULL
    argument down the road.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 97fb0253e6c2f2221bfd0895b7ffe3a99330d847
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Sat May 16 19:50:45 2020 +0100

    x86/hvm: Fix shifting in stdvga_mem_read()
    
    stdvga_mem_read() has a return type of uint8_t, which promotes to int rather
    than unsigned int.  Shifting by 24 may hit the sign bit.
    
    Spotted by Coverity.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 3d6e92e309987c9e33177c9ccd155e58dbd5d0db
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Sat May 16 13:10:07 2020 +0100

    x86/hvm: Fix memory leaks in hvm_copy_context_and_params()
    
    Any error from hvm_save() or hvm_set_param() leaks the c.data allocation.
    
    Spotted by Coverity.
    
    Fixes: 353744830 "x86/hvm: introduce hvm_copy_context_and_params"
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

