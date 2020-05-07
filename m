Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9121C886B
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 13:37:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWepc-0001pg-Pp; Thu, 07 May 2020 11:36:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aphx=6V=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jWepb-0001pZ-Fj
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 11:36:47 +0000
X-Inumbo-ID: 075cf230-9057-11ea-9f06-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 075cf230-9057-11ea-9f06-12813bfff9fa;
 Thu, 07 May 2020 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4w2ixTxHAJSJ68WOTZVyCo234QMFE7co+9vASLrLby4=; b=sR6HWNzoD4+UzfAIvApzLfjKs
 KEzYKJ3ahqSjUTqmtOnaEF+ZRdYGNyivK3zdBw2ZBBHVLSHkpsHL5JlFkU9MuFopkzBBLLlzhZFAO
 3nqJZJjcgWbkXB1pxG8q71dpvkrsIGGY1Sfde4CQxz36OE1LUILToZADWFM/Gf3pEquNQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWepY-0004wF-IY; Thu, 07 May 2020 11:36:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jWepY-0002vD-9B; Thu, 07 May 2020 11:36:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jWepY-00068j-81; Thu, 07 May 2020 11:36:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150051-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.9-testing test] 150051: regressions - trouble:
 fail/pass/starved
X-Osstest-Failures: xen-4.9-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:regression
 xen-4.9-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-stop:fail:heisenbug
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-localmigrate/x10:fail:heisenbug
 xen-4.9-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-localmigrate:fail:heisenbug
 xen-4.9-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-localmigrate/x10:fail:heisenbug
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-localmigrate/x10:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-localmigrate/x10:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-localmigrate/x10:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-localmigrate/x10:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: xen=93cc305d1f3e7c6949a8f4116446624fa2dbfdf4
X-Osstest-Versions-That: xen=45c90737d5f0c8bf479adcd8cb88450f1998e55c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 May 2020 11:36:44 +0000
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

flight 150051 xen-4.9-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150051/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop fail in 150038 REGR. vs. 149649

Tests which are failing intermittently (not blocking):
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 15 guest-stop fail pass in 150038
 test-amd64-amd64-xl-qemuu-win7-amd64 16 guest-localmigrate/x10 fail pass in 150038
 test-amd64-i386-xl-qemut-ws16-amd64 14 guest-localmigrate  fail pass in 150038
 test-amd64-amd64-xl-qemut-ws16-amd64 16 guest-localmigrate/x10 fail pass in 150038

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop      fail blocked in 149649
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop fail in 150038 blocked in 149649
 test-amd64-amd64-xl-qemuu-ws16-amd64 16 guest-localmigrate/x10 fail in 150038 blocked in 149649
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop  fail in 150038 like 149649
 test-amd64-i386-xl-qemut-ws16-amd64 16 guest-localmigrate/x10 fail in 150038 like 149649
 test-amd64-i386-xl-qemut-win7-amd64 16 guest-localmigrate/x10 fail like 149649
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149649
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 149649
 test-amd64-amd64-xl-qemut-win7-amd64 16 guest-localmigrate/x10 fail like 149649
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 149649
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  93cc305d1f3e7c6949a8f4116446624fa2dbfdf4
baseline version:
 xen                  45c90737d5f0c8bf479adcd8cb88450f1998e55c

Last test of basis   149649  2020-04-14 13:35:25 Z   22 days
Testing same since   150038  2020-05-05 16:06:01 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>

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
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
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
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
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
 test-armhf-armhf-xl-rtds                                     fail    
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
commit 93cc305d1f3e7c6949a8f4116446624fa2dbfdf4
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Apr 3 13:03:40 2020 +0100

    tools/xenstore: fix a use after free problem in xenstored
    
    Commit 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object
    twice") introduced a potential use after free problem in
    domain_cleanup(): after calling talloc_unlink() for domain->conn
    domain->conn is set to NULL. The problem is that domain is registered
    as talloc child of domain->conn, so it might be freed by the
    talloc_unlink() call.
    
    With Xenstore being single threaded there are normally no concurrent
    memory allocations running and freeing a virtual memory area normally
    doesn't result in that area no longer being accessible. A problem
    could occur only in case either a signal received results in some
    memory allocation done in the signal handler (SIGHUP is a primary
    candidate leading to reopening the log file), or in case the talloc
    framework would do some internal memory allocation during freeing of
    the memory (which would lead to clobbering of the freed domain
    structure).
    
    Fixes: 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object twice")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    (cherry picked from commit bb2a34fd740e9a26be9e2244f1a5b4cef439e5a8)
    (cherry picked from commit dc5176d0f9434e275e0be1df8d0518e243798beb)
    (cherry picked from commit a997ffe678e698ff2b4c89ae5a98661d12247fef)
    (cherry picked from commit 48e8564435aca590f1c292ab7bb1f3dbc6b75693)
    (cherry picked from commit 1e722e6971539eab4f484affd60490cbc8429951)
(qemu changes not included)

