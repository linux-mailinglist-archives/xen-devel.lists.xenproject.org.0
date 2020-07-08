Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6721862B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 13:31:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt8IB-0006Ts-QT; Wed, 08 Jul 2020 11:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okql=AT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jt8IA-0006TY-Bz
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 11:31:10 +0000
X-Inumbo-ID: 80e32bbe-c10e-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80e32bbe-c10e-11ea-8496-bc764e2007e4;
 Wed, 08 Jul 2020 11:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=swFJcA061/g9KiIBe5it1CXv/JrjRUltQloULrW/bFQ=; b=irZk4eDZe0HtCHRlojLK+iZR3
 Btwaw/jKNNArFo9AzP5aCwra/qitPB/Qg159gaPIbnANnwevp8QiLf/476u4zZ10liWOea1ZJxaeG
 RzV0T2PJs+rXQHQZvD8CED3OoCniIKO+pKbxGVy6yC0B9mbxCAPiB2dWKu0IWMNLcLMzQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jt8I2-0007ux-7Q; Wed, 08 Jul 2020 11:31:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jt8I1-0003Zq-Up; Wed, 08 Jul 2020 11:31:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jt8I1-00056C-TA; Wed, 08 Jul 2020 11:31:01 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151716-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.9-testing test] 151716: regressions - trouble:
 fail/pass/starved
X-Osstest-Failures: xen-4.9-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:guest-saverestore.2:fail:regression
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-saverestore.2:fail:regression
 xen-4.9-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-localmigrate/x10:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-localmigrate/x10:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-localmigrate/x10:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.9-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.9-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: xen=4597fc97b3b8870c39214e3aa4132ab711a40691
X-Osstest-Versions-That: xen=6e477c2ea4d5c26a7a7b2f850166aa79edc5225c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Jul 2020 11:31:01 +0000
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

flight 151716 xen-4.9-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151716/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-debianhvm-amd64 15 guest-saverestore.2 fail REGR. vs. 151223
 test-amd64-amd64-xl-qemuu-ws16-amd64 15 guest-saverestore.2 fail REGR. vs. 151223

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop      fail blocked in 151223
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151223
 test-amd64-amd64-xl-qemut-win7-amd64 16 guest-localmigrate/x10 fail like 151223
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151223
 test-amd64-amd64-xl-qemuu-win7-amd64 16 guest-localmigrate/x10 fail like 151223
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 151223
 test-amd64-i386-xl-qemut-ws16-amd64 16 guest-localmigrate/x10 fail like 151223
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 151223
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  4597fc97b3b8870c39214e3aa4132ab711a40691
baseline version:
 xen                  6e477c2ea4d5c26a7a7b2f850166aa79edc5225c

Last test of basis   151223  2020-06-18 15:48:44 Z   19 days
Testing same since   151716  2020-07-07 14:05:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
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
commit 4597fc97b3b8870c39214e3aa4132ab711a40691
Author: Julien Grall <jgrall@amazon.com>
Date:   Tue Jul 7 15:43:59 2020 +0200

    xen: Check the alignment of the offset pased via VCPUOP_register_vcpu_info
    
    Currently a guest is able to register any guest physical address to use
    for the vcpu_info structure as long as the structure can fits in the
    rest of the frame.
    
    This means a guest can provide an address that is not aligned to the
    natural alignment of the structure.
    
    On Arm 32-bit, unaligned access are completely forbidden by the
    hypervisor. This will result to a data abort which is fatal.
    
    On Arm 64-bit, unaligned access are only forbidden when used for atomic
    access. As the structure contains fields (such as evtchn_pending_self)
    that are updated using atomic operations, any unaligned access will be
    fatal as well.
    
    While the misalignment is only fatal on Arm, a generic check is added
    as an x86 guest shouldn't sensibly pass an unaligned address (this
    would result to a split lock).
    
    This is XSA-327.
    
    Reported-by: Julien Grall <jgrall@amazon.com>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    master commit: 3fdc211b01b29f252166937238efe02d15cb5780
    master date: 2020-07-07 14:41:00 +0200

commit a852040fe3ab6658ab0dd4fa8f86f50db9d08874
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Jul 7 15:43:29 2020 +0200

    x86/ept: flush cache when modifying PTEs and sharing page tables
    
    Modifications made to the page tables by EPT code need to be written
    to memory when the page tables are shared with the IOMMU, as Intel
    IOMMUs can be non-coherent and thus require changes to be written to
    memory in order to be visible to the IOMMU.
    
    In order to achieve this make sure data is written back to memory
    after writing an EPT entry when the recalc bit is not set in
    atomic_write_ept_entry. If such bit is set, the entry will be
    adjusted and atomic_write_ept_entry will be called a second time
    without the recalc bit set. Note that when splitting a super page the
    new tables resulting of the split should also be written back.
    
    Failure to do so can allow devices behind the IOMMU access to the
    stale super page, or cause coherency issues as changes made by the
    processor to the page tables are not visible to the IOMMU.
    
    This allows to remove the VT-d specific iommu_pte_flush helper, since
    the cache write back is now performed by atomic_write_ept_entry, and
    hence iommu_iotlb_flush can be used to flush the IOMMU TLB. The newly
    used method (iommu_iotlb_flush) can result in less flushes, since it
    might sometimes be called rightly with 0 flags, in which case it
    becomes a no-op.
    
    This is part of XSA-321.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: c23274fd0412381bd75068ebc9f8f8c90a4be748
    master date: 2020-07-07 14:40:11 +0200

commit 3c9a98410be01236f1de1ad171885552fae5397a
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Jul 7 15:42:59 2020 +0200

    vtd: optimize CPU cache sync
    
    Some VT-d IOMMUs are non-coherent, which requires a cache write back
    in order for the changes made by the CPU to be visible to the IOMMU.
    This cache write back was unconditionally done using clflush, but there are
    other more efficient instructions to do so, hence implement support
    for them using the alternative framework.
    
    This is part of XSA-321.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: a64ea16522a73a13a0d66cfa4b66a9d3b95dd9d6
    master date: 2020-07-07 14:39:54 +0200

commit 46d6a0721405149ace209cdf23fa009fd366dbf2
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Jul 7 15:42:34 2020 +0200

    x86/alternative: introduce alternative_2
    
    It's based on alternative_io_2 without inputs or outputs but with an
    added memory clobber.
    
    This is part of XSA-321.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    master commit: 23570bce00ee6ba2139ece978ab6f03ff166e21d
    master date: 2020-07-07 14:39:25 +0200

commit 83917016f87ca5feeb32f2fdcae32e560bb8d283
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Jul 7 15:42:15 2020 +0200

    vtd: don't assume addresses are aligned in sync_cache
    
    Current code in sync_cache assume that the address passed in is
    aligned to a cache line size. Fix the code to support passing in
    arbitrary addresses not necessarily aligned to a cache line size.
    
    This is part of XSA-321.
    
    Reported-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: b6d9398144f21718d25daaf8d72669a75592abc5
    master date: 2020-07-07 14:39:05 +0200

commit 1c51a292788e3e006dd9b14ec987c5da662d4a50
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Jul 7 15:41:49 2020 +0200

    x86/iommu: introduce a cache sync hook
    
    The hook is only implemented for VT-d and it uses the already existing
    iommu_sync_cache function present in VT-d code. The new hook is
    added so that the cache can be flushed by code outside of VT-d when
    using shared page tables.
    
    Note that alloc_pgtable_maddr must use the now locally defined
    sync_cache function, because IOMMU ops are not yet setup the first
    time the function gets called during IOMMU initialization.
    
    No functional change intended.
    
    This is part of XSA-321.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 91526b460e5009fc56edbd6809e66c327281faba
    master date: 2020-07-07 14:38:34 +0200

commit 7338b3371c0535944346fb3336a5e28b5c080658
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Jul 7 15:41:18 2020 +0200

    vtd: prune (and rename) cache flush functions
    
    Rename __iommu_flush_cache to iommu_sync_cache and remove
    iommu_flush_cache_page. Also remove the iommu_flush_cache_entry
    wrapper and just use iommu_sync_cache instead. Note the _entry suffix
    was meaningless as the wrapper was already taking a size parameter in
    bytes. While there also constify the addr parameter.
    
    No functional change intended.
    
    This is part of XSA-321.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 62298825b9a44f45761acbd758138b5ba059ebd1
    master date: 2020-07-07 14:38:13 +0200

commit 6fe2c30d483c7c02db1d517edd1c708f81e62bd9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 7 15:40:56 2020 +0200

    vtd: improve IOMMU TLB flush
    
    Do not limit PSI flushes to order 0 pages, in order to avoid doing a
    full TLB flush if the passed in page has an order greater than 0 and
    is aligned. Should increase the performance of IOMMU TLB flushes when
    dealing with page orders greater than 0.
    
    This is part of XSA-321.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 5fe515a0fede07543f2a3b049167b1fd8b873caf
    master date: 2020-07-07 14:37:46 +0200

commit 6ee71c98e35054045d47e65cb10587b0f60cae52
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Jul 7 15:40:33 2020 +0200

    x86/ept: atomically modify entries in ept_next_level
    
    ept_next_level was passing a live PTE pointer to ept_set_middle_entry,
    which was then modified without taking into account that the PTE could
    be part of a live EPT table. This wasn't a security issue because the
    pages returned by p2m_alloc_ptp are zeroed, so adding such an entry
    before actually initializing it didn't allow a guest to access
    physical memory addresses it wasn't supposed to access.
    
    This is part of XSA-328.
    
    Reported-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: bc3d9f95d661372b059a5539ae6cb1e79435bb95
    master date: 2020-07-07 14:37:12 +0200

commit 098d95995564f38f5415dd7b30096785db9e2337
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 7 15:40:11 2020 +0200

    x86/EPT: ept_set_middle_entry() related adjustments
    
    ept_split_super_page() wants to further modify the newly allocated
    table, so have ept_set_middle_entry() return the mapped pointer rather
    than tearing it down and then getting re-established right again.
    
    Similarly ept_next_level() wants to hand back a mapped pointer of
    the next level page, so re-use the one established by
    ept_set_middle_entry() in case that path was taken.
    
    Pull the setting of suppress_ve ahead of insertion into the higher level
    table, and don't have ept_split_super_page() set the field a 2nd time.
    
    This is part of XSA-328.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 1104288186ee73a7f9bfa41cbaa5bb7611521028
    master date: 2020-07-07 14:36:52 +0200

commit 715453066082072b38eaa754840c558e7a9edf88
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 7 15:39:47 2020 +0200

    x86/shadow: correct an inverted conditional in dirty VRAM tracking
    
    This originally was "mfn_x(mfn) == INVALID_MFN". Make it like this
    again, taking the opportunity to also drop the unnecessary nearby
    braces.
    
    This is XSA-319.
    
    Fixes: 246a5a3377c2 ("xen: Use a typesafe to define INVALID_MFN")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 23a216f99d40fbfbc2318ade89d8213eea6ba1f8
    master date: 2020-07-07 14:36:24 +0200
(qemu changes not included)

