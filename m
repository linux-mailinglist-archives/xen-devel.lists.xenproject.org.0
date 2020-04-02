Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B91B19C198
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 15:00:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJzPO-00061O-RK; Thu, 02 Apr 2020 12:57:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9JfQ=5S=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jJzPN-00061F-7l
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 12:57:21 +0000
X-Inumbo-ID: 7badff3a-74e1-11ea-bbcf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7badff3a-74e1-11ea-bbcf-12813bfff9fa;
 Thu, 02 Apr 2020 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oHeT7HsYjubqXaA84mvfo/zLcjQiRkaV6xomYy2t3w8=; b=xsjY/gQxHFVR1+jd2988C/Zeh
 V9lqJy7qphgvArpO63yG12Y398/bNJJUxMCIuZqXUiNvztQGBVQkAu6AQAxkkQpa0uQD9z0jQZj21
 SUkHqzJTrylZa0Z3b3I3QDv4nb8C0htX5IBZTrxd5XoxJd+TcIWSeG1DppiO91d4PowcY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJzPJ-0005iJ-Lj; Thu, 02 Apr 2020 12:57:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jJzPJ-0003GA-1V; Thu, 02 Apr 2020 12:57:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jJzPJ-0004Rv-0q; Thu, 02 Apr 2020 12:57:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149297-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 149297: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:guest-start/redhat.repeat:fail:regression
 xen-unstable:build-i386-prev:xen-build:fail:regression
 xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:guest-start/debian.repeat:fail:regression
 xen-unstable:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:guest-start/debian.repeat:fail:nonblocking
X-Osstest-Versions-This: xen=3925402f5dd7ae93010c48688eb64f880c794267
X-Osstest-Versions-That: xen=e19b4b3b55f84e0cfcc02fe5d66965969a81c965
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Apr 2020 12:57:17 +0000
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

flight 149297 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149297/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemut-rhel6hvm-amd 12 guest-start/redhat.repeat fail REGR. vs. 149188
 build-i386-prev               6 xen-build                fail REGR. vs. 149188
 test-amd64-amd64-dom0pvh-xl-intel 20 guest-start/debian.repeat fail REGR. vs. 149188

Tests which did not succeed, but are not blocking:
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 149151
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 149188
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149188
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 149188
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 149188
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail like 149188
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 149188
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149188
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 149188
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 149188
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149188
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-dom0pvh-xl-amd 20 guest-start/debian.repeat fail starved in 149188

version targeted for testing:
 xen                  3925402f5dd7ae93010c48688eb64f880c794267
baseline version:
 xen                  e19b4b3b55f84e0cfcc02fe5d66965969a81c965

Last test of basis   149188  2020-03-30 01:51:23 Z    3 days
Failing since        149231  2020-03-31 02:00:20 Z    2 days    3 attempts
Testing same since   149297  2020-04-01 18:11:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Simran Singhal <singhalsimran0@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
 build-i386-prev                                              fail    
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
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
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
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  blocked 
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
commit 3925402f5dd7ae93010c48688eb64f880c794267
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Wed Apr 1 12:36:57 2020 +0200

    x86/dom0: fix copy of low 1MB data for PVH
    
    The orders of start and end are inverted in order to calculate the
    size of the copy operation.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 753ab41b8b763b58cc3dd940d862bceaf58f7a4c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 1 12:34:33 2020 +0200

    x86emul: support SYSRET
    
    This is to augment SYSCALL, which we've been supporting for quite some
    time.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 78c87e41f0cdd75c847f41a2768faf41983bdf13
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 1 12:32:17 2020 +0200

    x86emul: vendor specific SYSCALL behavior
    
    AMD CPUs permit the insn everywhere (even outside of protected mode),
    while Intel ones restrict it to 64-bit mode. While at it also comment
    about the apparently missing CPUID bit check.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 5d515b1c296ebad6889748ea1e49e063453216a3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Apr 1 12:28:30 2020 +0200

    x86/HVM: fix AMD ECS handling for Fam10
    
    The involved comparison was, very likely inadvertently, converted from
    >= to > when making changes unrelated to the actual family range.
    
    Fixes: 9841eb71ea87 ("x86/cpuid: Drop a guests cached x86 family and model information")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 897b6f4b4324b7696602fe386b5ea93506415442
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Mar 30 20:21:53 2020 +0100

    tools/libxc: misc: Mark const the parameter 'params' of xc_set_parameters()
    
    The parameter 'params' of xc_set_parameters() should never be modified.
    So mark it as const.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 2b8079610ec55413613ad071cc81cd9f97232a7e
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Mar 30 20:21:52 2020 +0100

    tools/libxc: misc: Mark const the parameter 'keys' of xc_send_debug_keys()
    
    OCaml is using a string to describe the parameter 'keys' of
    xc_send_debug_keys(). Since Ocaml 4.06.01, String_val() will return a
    const char * when using -safe-string. This will result to a build
    failure because xc_send_debug_keys() expects a char *.
    
    The function should never modify the parameter 'keys' and therefore the
    parameter should be const. Unfortunately, this is not directly possible
    because DECLARE_HYPERCALL_BOUNCE() is expecting a non-const variable.
    
    A new macro DECLARE_HYPERCALL_BOUNCE_IN() is introduced and will take
    care of const parameter. The first user will be xc_send_debug_keys() but
    this can be used in more place in the future.
    
    Reported-by: Dario Faggioli <dfaggioli@suse.com>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit c4336b0b1a35c1a54a21c0cafad39466613a714f
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Mar 30 20:21:51 2020 +0100

    xen/public: sysctl: set_parameter.params and debug.keys should be const
    
    The fields set_parameter.params and debug.keys should never be modified
    by the hypervisor. So mark them as const.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit dc0b3eb56b9ce3e2b61f0c7d3af5a98b5a586099
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Tue Mar 31 11:30:47 2020 +0100

    build,arm: Fix deps check of head.o
    
    arm*/head.o isn't in obj-y or extra-y, so make don't load the
    associated .*.d file (or .*.cmd file when if_changed will be used).
    There is a workaround where .*.d file is added manually into DEPS.
    
    Changing DEPS isn't needed, we can simply add head.o into extra-y and
    the dependency files will be loaded.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit f41eb7ba3e5070b4a7a4f54cac236bf9ff93d798
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Tue Mar 31 11:30:46 2020 +0100

    xen/arm: Configure early printk via Kconfig
    
    At the moment, early printk can only be configured on the make command
    line. It is not very handy because a user has to remove the option
    everytime it is using another command other than compiling the
    hypervisor.
    
    Furthermore, early printk is one of the few odds one that are not
    using Kconfig.
    
    So this is about time to move it to Kconfig.
    
    The new kconfigs options allow a user to eather select a UART driver
    to use at boot time, and set the parameters, or it is still possible
    to select a platform which will set the parameters.
    
    If CONFIG_EARLY_PRINTK is present in the environment or on the make
    command line, make will return an error.
    
    Signed-off-by: Julien Grall <julien.grall@arm.com>
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Tested-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 370f44fa73004e9e19cff9b1e65ee7ea61b55700
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Tue Mar 31 11:30:45 2020 +0100

    xen/arm: Rename all early printk macro
    
    We are going to move the generation of the early printk macro into
    Kconfig. This means all macro will be prefix with CONFIG_. We do that
    ahead of the change.
    
    We also take the opportunity to better name some variables, which are
    used by only one driver and wouldn't make sens for other UART driver.
    Thus,
        - EARLY_UART_REG_SHIFT became CONFIG_EARLY_UART_8250_REG_SHIFT
        - EARLY_PRINTK_VERSION_* became CONFIG_EARLY_UART_SCIF_VERSION_*
    
    The other variables are change to have the prefix CONFIG_EARLY_UART_
    when they change a parameter of the driver. So we have now:
        - CONFIG_EARLY_UART_BAUD_RATE
        - CONFIG_EARLY_UART_BASE_ADDRESS
        - CONFIG_EARLY_UART_INIT
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Tested-by: Stefano Stabellini <sstabellini@kernel.org>

commit 5af4698d98d881e786c0909b6308f04696586c49
Author: Simran Singhal <singhalsimran0@gmail.com>
Date:   Tue Mar 31 08:51:21 2020 +0200

    x86: compress lines for immediate return
    
    Compress two lines into a single line if immediate return statement is found.
    It also remove variables retval, freq, effective, vector, ovf and now
    as they are no longer needed.
    
    Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 922f59a4302939471254b91c921daa5bd7c7e3fa
Author: Simran Singhal <singhalsimran0@gmail.com>
Date:   Tue Mar 31 08:50:25 2020 +0200

    x86: remove unnecessary cast on void pointer
    
    Assignment to a typed pointer is sufficient in C.
    No cast is needed.
    
    Also, changed some u64/u32 to uint64_t/uint32_t.
    
    Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit f57ae00635da429cee02373dc909542a411a09e5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Mar 31 08:46:44 2020 +0200

    SVM: split _np_enable VMCB field
    
    The nest paging enable is actually just a single bit within the 64-bit
    VMCB field, which is particularly relevant for uses like the one in
    nsvm_vcpu_vmentry(). Split the field, adding definitions for a few other
    bits at the same time. To be able to generate accessors for bitfields,
    VMCB_ACCESSORS() needs the type part broken out, as typeof() can't be
    applied to bitfields. Unfortunately this means specification of the same
    type in two distinct places.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 2a94100dd5646fb8abcd29f48553ff10d0788cc7
Author: Ian Jackson <ian.jackson@eu.citrix.com>
Date:   Mon Mar 30 14:52:12 2020 +0100

    docs/README: Fix a broken url
    
    There was a / missing here.
    
    Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 9465fac25ebd46a495ee10c3cebce4d7f4b32b14
Author: Ian Jackson <ian.jackson@eu.citrix.com>
Date:   Mon Mar 30 14:51:51 2020 +0100

    docs etc.: https: Fix references to other Xen pages
    
    Change the url scheme to https.  This is all in-tree references to
    xenbits and the main website except for those in Config.mk.
    
    We leave Config.mk alone for now because those urls are used by CI
    systems and we need to check that nothing breaks when we change the
    download method.
    
    Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 7e1867b12114602b94f2630a33aa82215b1c895c
Author: Ian Jackson <ian.jackson@eu.citrix.com>
Date:   Mon Mar 30 14:43:06 2020 +0100

    docs etc.: https: Fix references to wiki.xen[project].org
    
    Change the url scheme to https.  This is all in-tree references to the
    Xen wiki.
    
    Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit b72682c602b8d1aaadca439d49cc79c79dbc17bc
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Thu Mar 12 10:54:17 2020 -0400

    scripts: Use stat to check lock claim
    
    Replace the perl locking check with stat(1).  Stat is able to fstat
    stdin (file descriptor 0) when passed '-' as an argument.  This is now
    used to check $_lockfd.  stat(1) support for '-' was introduced to
    coreutils in 2009.
    
    After A releases its lock, script B will return from flock and execute
    stat.  Since the lockfile has been removed by A, stat prints an error to
    stderr and exits non-zero.  Redirect stderr to /dev/null to avoid
    filling /var/log/xen/xen-hotplug.log with "No such file or directory"
    messages.
    
    Placing the stat call inside the "if" condition ensures we only check
    the stat output when the command completed successfully.
    
    This change removes the only runtime dependency of the xen toolstack on
    perl.
    
    Suggested-by: Ian Jackson <ian.jackson@citrix.com>
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

commit 4b3f41e9d83209f5334095937aef7763da993781
Author: Simran Singhal <singhalsimran0@gmail.com>
Date:   Sun Mar 29 12:07:47 2020 +0530

    xen/x86: Remove parentheses from return arguments
    
    This patch remove unnecessary parentheses from return arguments.
    
    Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

