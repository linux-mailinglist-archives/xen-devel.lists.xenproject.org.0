Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762E22A14B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 23:23:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyMCT-0003gx-Qq; Wed, 22 Jul 2020 21:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/Qh=BB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jyMCS-0003gs-8f
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 21:22:52 +0000
X-Inumbo-ID: 7d3a21db-cc61-11ea-86b2-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d3a21db-cc61-11ea-86b2-bc764e2007e4;
 Wed, 22 Jul 2020 21:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4vVT4u0COFDR9Qi30mFdFMsCzgbcpe3wxjY4IFgC7hg=; b=lDzdbq6sHmYJHyPvpThZeW5TE
 jAmb3z1u4Z0zMATR3JzgiOekBexsYqz8EWkpVZ3tT1DTP0+rxEZFtUG0gI2GVhpdg3ILlIf2RXD06
 m91oHnSJtvrWcCyYdJGF0nLJ3oLYfl/OxF0lD2mP4Js7oz1lRH/hFyyelqboVVr/9Yc5U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyMCO-00018Q-1s; Wed, 22 Jul 2020 21:22:48 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jyMCN-0004YX-Pt; Wed, 22 Jul 2020 21:22:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jyMCN-0002Yh-Ol; Wed, 22 Jul 2020 21:22:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152091-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 152091: regressions - trouble:
 fail/pass/preparing/running/starved
X-Osstest-Failures: xen-unstable:test-amd64-amd64-xl-multivcpu:guest-localmigrate/x10:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-start.2:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:hosts-allocate:running:regression
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:windows-install:running:regression
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:syslog-server:running:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:running:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:syslog-server:running:regression
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:starved:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: xen=f3885e8c3ceaef101e466466e879e97103ecce18
X-Osstest-Versions-That: xen=8c4532f19d6925538fb0c938f7de9a97da8c5c3b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Jul 2020 21:22:47 +0000
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

flight 152091 xen-unstable running [real]
http://logs.test-lab.xenproject.org/osstest/logs/152091/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-multivcpu 18 guest-localmigrate/x10  fail REGR. vs. 152045
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 152045
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 19 guest-start.2 fail REGR. vs. 152045
 test-amd64-amd64-xl-qemut-win7-amd64  2 hosts-allocate               running
 test-amd64-amd64-xl-qemut-ws16-amd64 10 windows-install              running
 test-amd64-amd64-xl-qemut-ws16-amd64  3 syslog-server                running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 18 guest-start/debianhvm.repeat running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 syslog-server             running

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 152045
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 152045
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 152045
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 152045
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 152045
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 152045
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 152045
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-qemuu-freebsd11-amd64  2 hosts-allocate           starved n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  2 hosts-allocate           starved n/a

version targeted for testing:
 xen                  f3885e8c3ceaef101e466466e879e97103ecce18
baseline version:
 xen                  8c4532f19d6925538fb0c938f7de9a97da8c5c3b

Last test of basis   152045  2020-07-20 13:36:39 Z    2 days
Failing since        152067  2020-07-21 06:59:07 Z    1 days    1 attempts
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  George Dunlap <george.dunlap@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
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
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    running 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       starved 
 test-amd64-amd64-qemuu-freebsd12-amd64                       starved 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         preparing
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         running 
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
 test-amd64-amd64-xl-multivcpu                                fail    
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
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
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
commit f3885e8c3ceaef101e466466e879e97103ecce18
Author: Elliott Mitchell <ehem+xen@m5p.com>
Date:   Fri Jul 17 20:32:42 2020 -0700

    tools/ocaml: Default to useful build output
    
    While hiding details of build output looks pretty to some, defaulting to
    doing so deviates from the rest of Xen.  Switch the OCAML tools to match
    everything else.
    
    Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit 69953e2856382274749b617125cc98ce38198463
Author: Elliott Mitchell <ehem+xen@m5p.com>
Date:   Fri Jul 17 20:31:21 2020 -0700

    tools: Partially revert "Cross-compilation fixes."
    
    This partially reverts commit 16504669c5cbb8b195d20412aadc838da5c428f7.
    
    Doesn't look like much of 16504669c5cbb8b195d20412aadc838da5c428f7
    actually remains due to passage of time.
    
    Of the 3, both Python and pygrub appear to mostly be building just fine
    cross-compiling.  The OCAML portion is being troublesome, this is going
    to cause bug reports elsewhere soon.  The OCAML portion though can
    already be disabled by setting OCAML_TOOLS=n and shouldn't have this
    extra form of disabling.
    
    Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 057cfa258ca554013178c5aaf6f80db47fb184fc
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 21 14:04:59 2020 +0200

    tools/xen-cpuid: use dashes consistently in feature names
    
    We've grown to a mix of dashes and underscores - switch to consistent
    naming in the hope that future additions will play by this.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit a6ed77f1e0334c26e6e216aea45f8674d9284856
Author: Edwin Török <edvin.torok@citrix.com>
Date:   Wed Jul 15 16:10:56 2020 +0100

    oxenstored: fix ABI breakage introduced in Xen 4.9.0
    
    dbc84d2983969bb47d294131ed9e6bbbdc2aec49 (Xen >= 4.9.0) deleted XS_RESTRICT
    from oxenstored, which caused all the following opcodes to be shifted by 1:
    reset_watches became off-by-one compared to the C version of xenstored.
    
    Looking at the C code the opcode for reset watches needs:
    XS_RESET_WATCHES = XS_SET_TARGET + 2
    
    So add the placeholder `Invalid` in the OCaml<->C mapping list.
    (Note that the code here doesn't simply convert the OCaml constructor to
     an integer, so we don't need to introduce a dummy constructor).
    
    Igor says that with a suitably patched xenopsd to enable watch reset,
    we now see `reset watches` during kdump of a guest in xenstored-access.log.
    
    Signed-off-by: Edwin Török <edvin.torok@citrix.com>
    Tested-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit 6d49fbdeab3e687a6818f809ca3d98ac7ced2c8d
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Mon Jul 20 19:54:40 2020 -0400

    golang/xenlight: fix code generation for python 2.6
    
    Before python 2.7, str.format() calls required that the format fields
    were explicitly enumerated, e.g.:
    
      '{0} {1}'.format(foo, bar)
    
      vs.
    
      '{} {}'.format(foo, bar)
    
    Currently, gengotypes.py uses the latter pattern everywhere, which means
    the Go bindings do not build on python 2.6. Use the 2.6 syntax for
    format() in order to support python 2.6 for now.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Acked-by: Wei Liu <wl@xen.org>

commit af0584931c1b902577317dacff976bc4b4f3923d
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Thu Jul 16 12:00:26 2020 -0400

    MAINTAINERS: add myself as a golang bindings maintainer
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 139ce42388c3fe7096a09b3d397250fe14906809
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Jul 20 18:35:55 2020 +0100

    SUPPORT.md: Spell Experimental correctly
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit fc7f700cf1845d80dee1f4075044a54645aec04e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 21 14:00:25 2020 +0200

    x86emul: support AVX512_VP2INTERSECT insns
    
    The standard memory access pattern once again should allow us to go
    without a test harness addition beyond the EVEX Disp8-scaling one.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f6b78aefea557e5fd58d1c1e1e314c25c0bacaef
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 21 13:59:28 2020 +0200

    x86/shadow: l3table[] and gl3e[] are HVM only
    
    ... by the very fact that they're 3-level specific, while PV always gets
    run in 4-level mode. This requires adding some seemingly redundant
    #ifdef-s - some of them will be possible to drop again once 2- and
    3-level guest code doesn't get built anymore in !HVM configs, but I'm
    afraid there's still quite a bit of disentangling work to be done to
    make this possible.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 5fd152ea7dfbd7e83c4f398bc8d7273466b88cbb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 21 13:58:56 2020 +0200

    x86/shadow: have just a single instance of sh_set_toplevel_shadow()
    
    The only guest/shadow level dependent piece here is the call to
    sh_make_shadow(). Make a pointer to the respective function an
    argument of sh_set_toplevel_shadow(), allowing it to be moved to
    common.c.
    
    This implies making get_shadow_status() available to common.c; its set
    and delete counterparts are moved along with it.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit ef3b0d8d2c3975c5cdd6a521896d85e97b74e924
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 21 13:58:15 2020 +0200

    x86/shadow: shadow_table[] needs only one entry for PV-only configs
    
    Furthermore the field isn't needed at all with shadow support disabled -
    move it into struct shadow_vcpu.
    
    Introduce for_each_shadow_table(), shortening loops for the 4-level case
    at the same time.
    
    Adjust loop variables and a function parameter to be "unsigned int"
    where applicable at the same time. Also move a comment that ended up
    misplaced due to incremental additions.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit ded576ce07e9328f66842bef67d8cfc14c3088b7
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 21 13:57:06 2020 +0200

    x86/shadow: dirty VRAM tracking is needed for HVM only
    
    Move shadow_track_dirty_vram() into hvm.c (requiring two static
    functions to become non-static). More importantly though make sure we
    don't de-reference d->arch.hvm.dirty_vram for a non-HVM guest. This was
    a latent issue only just because the field lives far enough into struct
    hvm_domain to be outside the part overlapping with struct pv_domain.
    
    While moving shadow_track_dirty_vram() some purely typographic
    adjustments are being made, like inserting missing blanks or putting
    breaces on their own lines.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Tim Deegan <tim@xen.org>

commit 9ffdda96d9e7c3d9c7a5bbe2df6ab30f63927542
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jul 20 17:54:52 2020 +0100

    docs: Replace non-UTF-8 character in hypfs-paths.pandoc
    
    From the docs cronjob on xenbits:
    
      /usr/bin/pandoc --number-sections --toc --standalone misc/hypfs-paths.pandoc --output html/misc/hypfs-paths.html
      pandoc: Cannot decode byte '\x92': Data.Text.Internal.Encoding.decodeUtf8: Invalid UTF-8 stream
      make: *** [Makefile:236: html/misc/hypfs-paths.html] Error 1
    
    Fixes: 5a4a411bde4 ("docs: specify stability of hypfs path documentation")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 6720345aaf82fc76dca084f3f7a577062f5ff0f3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Jul 15 12:39:06 2020 +0200

    Arm: prune #include-s needed by domain.h
    
    asm/domain.h is a dependency of xen/sched.h, and hence should not itself
    include xen/sched.h. Nor should any of the other #include-s used by it.
    While at it, also drop two other #include-s that aren't needed by this
    particular header.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 5a4a411bde4f73ff8ce43d6e52b77302973e8f68
Author: Juergen Gross <jgross@suse.com>
Date:   Mon Jul 20 13:38:00 2020 +0200

    docs: specify stability of hypfs path documentation
    
    In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
    file system are specified. Make it more clear that path availability
    might change, e.g. due to scope widening or narrowing (e.g. being
    limited to a specific architecture).
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Paul Durrant <paul@xen.org>
(qemu changes not included)

