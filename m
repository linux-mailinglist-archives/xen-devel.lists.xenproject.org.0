Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B366D1DD915
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 23:08:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbsPk-0002aj-PR; Thu, 21 May 2020 21:07:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcJi=7D=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbsPj-0002ae-Eu
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 21:07:39 +0000
X-Inumbo-ID: 15c159f0-9ba7-11ea-ab67-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15c159f0-9ba7-11ea-ab67-12813bfff9fa;
 Thu, 21 May 2020 21:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dHjMN/Xc2cnhSDdluGWgUd9yU6V/kE3p57vAGdY8PMU=; b=qCFAA1P1CcxZYQk1cjLm6KviU
 C32xF52664/VVYwA2KwSHAlHbFZDf1/dwUrDHVESFWgFf+tXKr6PpRTfXg7L2kVDLT+tEveD0qGgI
 v3HJ2I7OM0rfL5RH1X4a84LYGGmKRtaa9PS6HDjsVFpVOMfByiUNgJmjUkolp9cAKwrqo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbsPa-0004Vs-T2; Thu, 21 May 2020 21:07:30 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbsPa-0000I2-JV; Thu, 21 May 2020 21:07:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbsPa-00020f-Iw; Thu, 21 May 2020 21:07:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150296-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150296: regressions - FAIL
X-Osstest-Failures: linux-linus:build-i386-pvops:kernel-build:fail:regression
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-examine:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=b85051e755b0e9d6dd8f17ef1da083851b83287d
X-Osstest-Versions-That: linux=2ea1940b84e55420a9e8feddcafd173edfe4df11
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 21 May 2020 21:07:30 +0000
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

flight 150296 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150296/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-pvops              6 kernel-build             fail REGR. vs. 150281

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150281
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150281
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150281
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150281
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150281
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150281
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 linux                b85051e755b0e9d6dd8f17ef1da083851b83287d
baseline version:
 linux                2ea1940b84e55420a9e8feddcafd173edfe4df11

Last test of basis   150281  2020-05-20 19:40:19 Z    1 days
Testing same since   150296  2020-05-21 08:13:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Christoph Hellwig <hch@lst.de>
  Eric Biggers <ebiggers@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Ignat Korchagin <ignat@cloudflare.com>
  Johannes Berg <johannes.berg@intel.com>
  Kamal Dasu <kdasu.kdev@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Ricardo Ribalda Delgado <ribalda@kernel.org>
  Richard Weinberger <richard@nod.at>
  Sascha Hauer <s.hauer@pengutronix.de>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             fail    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    blocked 
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
commit b85051e755b0e9d6dd8f17ef1da083851b83287d
Merge: fea371e259eb f3a6a6c5e0f5
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 20 13:23:55 2020 -0700

    Merge tag 'fixes-for-5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
    
    Pull MTD fixes from Richard Weinberger:
    
     - Fix a PM regression in brcmnand driver
    
     - Propagate ECC information correctly on SPI-NAND
    
     - Make sure no MTD name is used multiple time in nvmem
    
    * tag 'fixes-for-5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux:
      mtd:rawnand: brcmnand: Fix PM resume crash
      mtd: Fix mtd not registered due to nvmem name collision
      mtd: spinand: Propagate ECC information to the MTD structure

commit fea371e259ebcc85d2d51a036743189bee487289
Merge: d303402c2883 0e7572cffe44
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 20 13:07:01 2020 -0700

    Merge tag 'for-linus-5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs
    
    Pull UBI and UBIFS fixes from Richard Weinberger:
    
     - Correctly set next cursor for detailed_erase_block_info debugfs file
    
     - Don't use crypto_shash_descsize() for digest size in UBIFS
    
     - Remove broken lazytime support from UBIFS
    
    * tag 'for-linus-5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs:
      ubi: Fix seq_file usage in detailed_erase_block_info debugfs file
      ubifs: fix wrong use of crypto_shash_descsize()
      ubifs: remove broken lazytime support

commit d303402c288340f9094fa0ba697600335a41bc3e
Merge: 2ea1940b84e5 2e27d33d22af
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 20 12:56:21 2020 -0700

    Merge tag 'for-linus-5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml
    
    Pull UML fixes from Richard Weinberger:
    
     - Two missing includes which caused build issues on recent systems
    
     - Correctly set TRANS_GRE_LEN in our vector network driver
    
    * tag 'for-linus-5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml:
      um: Fix typo in vector driver transport option definition
      um: syscall.c: include <asm/unistd.h>
      um: Fix xor.h include

commit f3a6a6c5e0f5a303fd8ec84ea33c0da5869d715f
Author: Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Sat May 2 16:41:36 2020 -0400

    mtd:rawnand: brcmnand: Fix PM resume crash
    
    This change fixes crash observed on PM resume. This bug
    was introduced in the change made for flash-edu support.
    
    Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")
    
    Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
    Acked-by: Florian Fainelli <f.fainelli@gmail.com>
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit 7b01b7239d0dc9832e0d0d23605c1ff047422a2c
Author: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Thu Apr 30 15:17:21 2020 +0200

    mtd: Fix mtd not registered due to nvmem name collision
    
    When the nvmem framework is enabled, a nvmem device is created per mtd
    device/partition.
    
    It is not uncommon that a device can have multiple mtd devices with
    partitions that have the same name. Eg, when there DT overlay is allowed
    and the same device with mtd is attached twice.
    
    Under that circumstances, the mtd fails to register due to a name
    duplication on the nvmem framework.
    
    With this patch we use the mtdX name instead of the partition name,
    which is unique.
    
    [    8.948991] sysfs: cannot create duplicate filename '/bus/nvmem/devices/Production Data'
    [    8.948992] CPU: 7 PID: 246 Comm: systemd-udevd Not tainted 5.5.0-qtec-standard #13
    [    8.948993] Hardware name: AMD Dibbler/Dibbler, BIOS 05.22.04.0019 10/26/2019
    [    8.948994] Call Trace:
    [    8.948996]  dump_stack+0x50/0x70
    [    8.948998]  sysfs_warn_dup.cold+0x17/0x2d
    [    8.949000]  sysfs_do_create_link_sd.isra.0+0xc2/0xd0
    [    8.949002]  bus_add_device+0x74/0x140
    [    8.949004]  device_add+0x34b/0x850
    [    8.949006]  nvmem_register.part.0+0x1bf/0x640
    ...
    [    8.948926] mtd mtd8: Failed to register NVMEM device
    
    Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
    Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
    Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit 3507273d5a4d3c2e46f9d3f9ed9449805f5dff07
Author: Miquel Raynal <miquel.raynal@bootlin.com>
Date:   Wed May 13 15:10:29 2020 +0200

    mtd: spinand: Propagate ECC information to the MTD structure
    
    This is done by default in the raw NAND core (nand_base.c) but was
    missing in the SPI-NAND core. Without these two lines the ecc_strength
    and ecc_step_size values are not exported to the user through sysfs.
    
    Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
    Cc: stable@vger.kernel.org
    Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
    Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit 0e7572cffe442290c347e779bf8bd4306bb0aa7c
Author: Richard Weinberger <richard@nod.at>
Date:   Sat May 2 14:48:02 2020 +0200

    ubi: Fix seq_file usage in detailed_erase_block_info debugfs file
    
    3bfa7e141b0b ("fs/seq_file.c: seq_read(): add info message about buggy .next functions")
    showed that we don't use seq_file correctly.
    So make sure that our ->next function always updates the position.
    
    Fixes: 7bccd12d27b7 ("ubi: Add debugfs file for tracking PEB state")
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit 3c3c32f85b6cc05e5db78693457deff03ac0f434
Author: Eric Biggers <ebiggers@google.com>
Date:   Fri May 1 22:59:45 2020 -0700

    ubifs: fix wrong use of crypto_shash_descsize()
    
    crypto_shash_descsize() returns the size of the shash_desc context
    needed to compute the hash, not the size of the hash itself.
    
    crypto_shash_digestsize() would be correct, or alternatively using
    c->hash_len and c->hmac_desc_len which already store the correct values.
    But actually it's simpler to just use stack arrays, so do that instead.
    
    Fixes: 49525e5eecca ("ubifs: Add helper functions for authentication support")
    Fixes: da8ef65f9573 ("ubifs: Authenticate replayed journal")
    Cc: <stable@vger.kernel.org> # v4.20+
    Cc: Sascha Hauer <s.hauer@pengutronix.de>
    Signed-off-by: Eric Biggers <ebiggers@google.com>
    Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit 2e27d33d22afa3d12746f854d6a4fad7ad7b86de
Author: Ignat Korchagin <ignat@cloudflare.com>
Date:   Sat Apr 25 09:18:42 2020 +0100

    um: Fix typo in vector driver transport option definition
    
    No big problem as "raw" and "gre" have the same length, but could go wrong if
    they don't in the future.
    
    Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit e6da5df0eefc0ff5c48aba29157d738888b214e1
Author: Johannes Berg <johannes.berg@intel.com>
Date:   Wed Apr 15 09:51:52 2020 +0200

    um: syscall.c: include <asm/unistd.h>
    
    Without CONFIG_SECCOMP, we don't get this include recursively
    through the existing includes, thus failing the build on not
    having __NR_syscall_max defined. Add the necessary include to
    fix this.
    
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>
    Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit d0e20fd4c1db7cb28874402f78f39870d84398e9
Author: Johannes Berg <johannes.berg@intel.com>
Date:   Sun Apr 5 21:33:57 2020 +0200

    um: Fix xor.h include
    
    Two independent changes here ended up going into the tree
    one after another, without a necessary rename, fix that.
    
    Reported-by: Thomas Meyer <thomas@m3y3r.de>
    Fixes: f185063bff91 ("um: Move timer-internal.h to non-shared")
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>
    Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
    Signed-off-by: Richard Weinberger <richard@nod.at>

commit ecf84096a526f2632ee85c32a3d05de3fa60ce80
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Apr 9 13:33:05 2020 +0200

    ubifs: remove broken lazytime support
    
    When "ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs" introduced atime
    support to ubifs, it also added lazytime support.  As far as I can tell
    the lazytime support is terminally broken, as it causes
    mark_inode_dirty_sync to be called from __writeback_single_inode, which
    will then trigger the locking assert in ubifs_dirty_inode.  Just remove
    the broken lazytime support for now, it can be added back later,
    especially as some infrastructure changes should make that easier soon.
    
    Fixes: 8c1c5f263833 ("ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs")
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Richard Weinberger <richard@nod.at>

