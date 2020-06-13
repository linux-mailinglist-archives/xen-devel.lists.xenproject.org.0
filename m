Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF951F8465
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 19:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jk9iL-0008V7-R6; Sat, 13 Jun 2020 17:13:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VdXd=72=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jk9iK-0008V2-Ha
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 17:13:04 +0000
X-Inumbo-ID: 24012c44-ad99-11ea-b6ae-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24012c44-ad99-11ea-b6ae-12813bfff9fa;
 Sat, 13 Jun 2020 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=86qRHAHLao/vPDk64UwxyLUvebptAqm86eQcBUnaHMc=; b=tES+16+Y85LsVLt0LOok0ecGZ
 mcAy0Ho2X05LmswzHqYX4MfHtV9h5ksk0y6V5tLKBK7HNy7RQAMtCttIRHjuCo4sNCqR9+iX9LXHy
 lVBsNLL2KY0yCMoPBWVOoYy4O85Kh5XFN2sAseP/o5j4qizoVxUYuiJxLF/55Ovy/B1BA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jk9iI-0003Ho-Nh; Sat, 13 Jun 2020 17:13:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jk9iI-00073F-Et; Sat, 13 Jun 2020 17:13:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jk9iI-00040c-EM; Sat, 13 Jun 2020 17:13:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151059-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.10-testing test] 151059: regressions - trouble:
 blocked/fail/pass/starved
X-Osstest-Failures: xen-4.10-testing:build-arm64-libvirt:libvirt-build:fail:regression
 xen-4.10-testing:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
 xen-4.10-testing:test-amd64-i386-xl-raw:debian-di-install:fail:regression
 xen-4.10-testing:test-amd64-amd64-pygrub:debian-di-install:fail:regression
 xen-4.10-testing:build-amd64-prev:xen-build:fail:regression
 xen-4.10-testing:build-i386-libvirt:libvirt-build:fail:regression
 xen-4.10-testing:build-i386-prev:xen-build:fail:regression
 xen-4.10-testing:build-amd64-libvirt:libvirt-build:fail:regression
 xen-4.10-testing:build-armhf-libvirt:libvirt-build:fail:regression
 xen-4.10-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: xen=ce056837082da7b2759a069045e480638094adcd
X-Osstest-Versions-That: xen=b922c4431df33ed5b724e53c3f3348e470ddd349
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Jun 2020 17:13:02 +0000
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

flight 151059 xen-4.10-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151059/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 150039
 test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 150039
 test-amd64-i386-xl-raw       10 debian-di-install        fail REGR. vs. 150039
 test-amd64-amd64-pygrub      10 debian-di-install        fail REGR. vs. 150039
 build-amd64-prev              6 xen-build                fail REGR. vs. 150039
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 150039
 build-i386-prev               6 xen-build                fail REGR. vs. 150039
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 150039
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 150039

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop             fail like 150039
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2 fail like 150039
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail never pass
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  ce056837082da7b2759a069045e480638094adcd
baseline version:
 xen                  b922c4431df33ed5b724e53c3f3348e470ddd349

Last test of basis   150039  2020-05-05 16:06:01 Z   39 days
Failing since        150941  2020-06-09 17:05:34 Z    4 days    6 attempts
Testing same since   151059  2020-06-12 08:13:16 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Christopher Clark <christopher.clark6@baesystems.com>
  Christopher Clark <christopher.w.clark@gmail.com>
  John Thomson <git@johnthomson.fastmail.com.au>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           fail    
 build-amd64-prev                                             fail    
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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
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
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 blocked 
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 blocked 
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
commit ce056837082da7b2759a069045e480638094adcd
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jun 10 18:57:00 2020 +0100

    x86/spec-ctrl: Allow the RDRAND/RDSEED features to be hidden
    
    RDRAND/RDSEED can be hidden using cpuid= to mitigate SRBDS if microcode
    isn't available.
    
    This is part of XSA-320 / CVE-2020-0543.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    (cherry picked from commit 7028534d8482d25860c4d1aa8e45f0b911abfc5a)

commit 934d6e1a77947662504cf4d5e36c9520e03aa731
Author: John Thomson <git@johnthomson.fastmail.com.au>
Date:   Tue May 15 11:48:43 2018 +1000

    tools/ocaml/libs/xc fix gcc-8 format-truncation warning
    
     CC       xenctrl_stubs.o
    xenctrl_stubs.c: In function 'failwith_xc':
    xenctrl_stubs.c:65:17: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
          "%d: %s: %s", error->code,
                     ^
    xenctrl_stubs.c:64:4: note: 'snprintf' output 6 or more bytes (assuming 1029) into a destination of size 1028
        snprintf(error_str, sizeof(error_str),
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          "%d: %s: %s", error->code,
          ~~~~~~~~~~~~~~~~~~~~~~~~~~
          xc_error_code_to_desc(error->code),
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          error->message);
          ~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors
    make[8]: *** [/build/xen-git/src/xen/tools/ocaml/libs/xc/../../Makefile.rules:37: xenctrl_stubs.o] Error 1
    m
    
    Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>
    Release-acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 2adc90908fbb1e614c477e29f2d45eda94570795)

commit 6e636f297f12a52ce12db11ea0787dd541937ed6
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:50 2018 +0200

    tools/misc: fix hypothetical buffer overflow in xen-lowmemd
    
    gcc-8 complains:
    
        xen-lowmemd.c: In function 'handle_low_mem':
        xen-lowmemd.c:80:55: error: '%s' directive output may be truncated writing up to 511 bytes into a region of size 489 [-Werror=format-truncation=]
                 snprintf(error, BUFSZ,"Failed to write target %s to xenstore", data);
                                                               ^~               ~~~~
        xen-lowmemd.c:80:9: note: 'snprintf' output between 36 and 547 bytes into a destination of size 512
                 snprintf(error, BUFSZ,"Failed to write target %s to xenstore", data);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    In practice it wouldn't happen, because 'data' contains string
    representation of 64-bit unsigned number (20 characters at most).
    But place a limit to mute gcc warning.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 27751d89248c8c5eef6d8b56eb8f7d2084145080)

commit dfc0b23403a2f0069bc7b9c0c20dfe5513eb8fb5
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:52 2018 +0200

    tools/blktap2: fix possible '\0' truncation
    
    gcc-8 complains:
    
        tapdisk-vbd.c: In function 'tapdisk_vbd_resume_ring':
        tapdisk-vbd.c:1671:53: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
           snprintf(params.name, sizeof(params.name) - 1, "%s", message);
                                                             ^
        tapdisk-vbd.c:1671:3: note: 'snprintf' output between 1 and 256 bytes into a destination of size 255
           snprintf(params.name, sizeof(params.name) - 1, "%s", message);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    The "- 1" in buffer size should be actually applied to message, to leave
    place for terminating '\0', not the other way around (truncate '\0' even
    if it would fit).
    
        In function 'tapdisk_control_open_image',
            inlined from 'tapdisk_control_handle_request' at tapdisk-control.c:660:10:
        tapdisk-control.c:465:2: error: 'strncpy' specified bound 256 equals destination size [-Werror=stringop-truncation]
          strncpy(params.name, vbd->name, BLKTAP2_MAX_MESSAGE_LEN);
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
        In function 'tapdisk_control_create_socket',
            inlined from 'tapdisk_control_open' at tapdisk-control.c:836:9:
        tapdisk-control.c:793:2: error: 'strncpy' specified bound 108 equals destination size [-Werror=stringop-truncation]
          strncpy(saddr.sun_path, td_control.path, sizeof(saddr.sun_path));
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
        block-qcow.c: In function 'qcow_create':
        block-qcow.c:1216:5: error: 'strncpy' specified bound 4096 equals destination size [-Werror=stringop-truncation]
             strncpy(backing_filename, backing_file,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              sizeof(backing_filename));
              ~~~~~~~~~~~~~~~~~~~~~~~~~
    
    I those cases, reduce size of copied string and make sure final '\0' is
    added.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 850e89b3ef1a7be6b71fa7ae22333c884e08431a)

commit 2f83654fa3331d1ec79275072f8742f175f82bc5
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:54 2018 +0200

    tools/gdbsx: fix -Wstringop-truncation warning
    
    gcc-8 complains:
    
        gx_main.c: In function 'prepare_stop_reply':
        gx_main.c:385:9: error: 'strncpy' output truncated before terminating nul copying 6 bytes from a string of the same length [-Werror=stringop-truncation]
                 strncpy(buf, "watch:", 6);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
    
    Since terminating '\0' isn't needed here at all, switch to memcpy.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 7f601f7c341c80d554615556d60e3b8ed1e5ad4f)

commit bf467cc828bde380e9201d8b49c7866a5b92d719
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:53 2018 +0200

    tools/xenpmd: fix possible '\0' truncation
    
    gcc-8 complains:
        xenpmd.c:207:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->oem_info, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        xenpmd.c:201:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->battery_type, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        xenpmd.c:195:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->serial_number, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        xenpmd.c:189:9: error: 'strncpy' specified bound 32 equals destination size [-Werror=stringop-truncation]
                 strncpy(info->model_number, attrib_value, 32);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Copy 31 chars, then make sure terminating '\0' is present. Those fields
    are passed to strlen and as '%s' for snprintf later.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit 938c8f53b1f80175c6f7a1399efdb984abb0cb8b)

commit 6df4d40d846eb5151a89d26d1a63d632c6b9eb55
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Apr 5 03:50:49 2018 +0200

    tools/libxc: fix strncpy size
    
    gcc-8 warns about possible truncation of trailing '\0'.
    Final character is overridden by '\0' anyway, so don't bother to copy
    it.
    
    This fixes compile failure:
    
        xc_pm.c: In function 'xc_set_cpufreq_gov':
        xc_pm.c:308:5: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]
             strncpy(scaling_governor, govname, CPUFREQ_NAME_LEN);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        cc1: all warnings being treated as errors
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    Release-Acked-by: Juergen Gross <jgross@suse.com>
    (cherry picked from commit fa7789ef18bd2e716997937af71b2e4b5b00a159)

commit e20bb5818174e9d09389776cb14781b9c6436554
Author: Christopher Clark <christopher.w.clark@gmail.com>
Date:   Wed Jul 18 15:22:17 2018 -0700

    tools/xentop : replace use of deprecated vwprintw
    
    gcc-8.1 complains:
    
    | xentop.c: In function 'print':
    | xentop.c:304:4: error: 'vwprintw' is deprecated [-Werror=deprecated-declarations]
    |     vwprintw(stdscr, (curses_str_t)fmt, args);
    |     ^~~~~~~~
    
    vw_printw (note the underscore) is a non-deprecated alternative.
    
    Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
    Acked-by: Wei Liu <wei.liu2@citrix.com>
    (cherry picked from commit 2b50cdbc444c637575580dcfa6c9525a84d5cc62)

commit a1a9b055a349748083665e42843f75d6db2c6a7b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 8 19:47:46 2020 +0000

    x86/spec-ctrl: Mitigate the Special Register Buffer Data Sampling sidechannel
    
    See patch documentation and comments.
    
    This is part of XSA-320 / CVE-2020-0543
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 6a49b9a7920c82015381740905582b666160d955)

commit afca67fafde22033b9a967ae197a10af5c654f02
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jan 8 19:47:46 2020 +0000

    x86/spec-ctrl: CPUID/MSR definitions for Special Register Buffer Data Sampling
    
    This is part of XSA-320 / CVE-2020-0543
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    (cherry picked from commit caab85ab58c0cdf74ab070a5de5c4df89f509ff3)
(qemu changes not included)

