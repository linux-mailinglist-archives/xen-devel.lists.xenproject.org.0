Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C32194D82
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 00:51:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHcEo-0006lw-3A; Thu, 26 Mar 2020 23:48:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RiB7=5L=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jHcEn-0006lr-8D
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 23:48:37 +0000
X-Inumbo-ID: 4e4ebe6e-6fbc-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e4ebe6e-6fbc-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 23:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qyf3+zQJ+TYP1O1bST6Tx+D4+qubQ1yMN6aODEYvwtA=; b=uyF/xeeUjWLoStgZkeHPLdZ5S
 mXfqvwzvJafdB6HwfSuNXEwzUtca2oveB7IgivwDIKJt2/owzbIpUyxrszoAZ0fdpZ5D+bU0WPEzF
 fmyYg7zf75/b8n37ogVVMM6fADFToXyfU/p1ghPABhIukmX7ntTzlFDoArePBaKU9WL/s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHcEk-0003sB-ED; Thu, 26 Mar 2020 23:48:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jHcEk-0003dw-1G; Thu, 26 Mar 2020 23:48:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jHcEk-00036C-00; Thu, 26 Mar 2020 23:48:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149029-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:guest-localmigrate/x10:fail:regression
 xen-unstable:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:regression
 xen-unstable:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
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
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: xen=0537d246f8db3ac0a1df2ce653b07e85cd887962
X-Osstest-Versions-That: xen=60d6ba1916dce0622a53b00dbae3c01d0761057e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Mar 2020 23:48:34 +0000
Subject: [Xen-devel] [xen-unstable test] 149029: regressions - trouble:
 fail/pass/starved
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

flight 149029 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149029/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel 18 guest-localmigrate/x10 fail REGR. vs. 148873
 test-amd64-amd64-libvirt-pair 11 xen-boot/dst_host       fail REGR. vs. 148925

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail like 148925
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 148925
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 148925
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 148925
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 148925
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 148925
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 148925
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 148925
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 148925
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 148925
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
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-dom0pvh-xl-amd  2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  0537d246f8db3ac0a1df2ce653b07e85cd887962
baseline version:
 xen                  60d6ba1916dce0622a53b00dbae3c01d0761057e

Last test of basis   148925  2020-03-23 17:36:41 Z    3 days
Failing since        148980  2020-03-24 16:19:46 Z    2 days    2 attempts
Testing same since   149029  2020-03-25 22:21:22 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Hongyan Xia <hongyxia@amazon.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien@xen.org>
  Paul Durrant <paul@xen.org>
  Pu Wen <puwen@hygon.cn>
  Tamas K Lengyel <tamas@tklengyel.com>
  Yan Yankovskyi <yyankovskyi@gmail.com>

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
 test-amd64-amd64-dom0pvh-xl-amd                              starved 
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
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                fail    
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
commit 0537d246f8db3ac0a1df2ce653b07e85cd887962
Author: Paul Durrant <paul@xen.org>
Date:   Tue Mar 24 17:40:50 2020 +0100

    mm: add 'is_special_page' inline function...
    
    ... to cover xenheap and PGC_extra pages.
    
    PGC_extra pages are intended to hold data structures that are associated
    with a domain and may be mapped by that domain. They should not be treated
    as 'normal' guest pages (i.e. RAM or page tables). Hence, in many cases
    where code currently tests is_xen_heap_page() it should also check for
    the PGC_extra bit in 'count_info'.
    
    This patch therefore defines is_special_page() to cover both cases and
    converts tests of is_xen_heap_page() (or open coded tests of PGC_xen_heap)
    to is_special_page() where the page is assigned to a domain.
    
    Signed-off-by: Paul Durrant <paul@xen.org>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <julien@xen.org>

commit 0a393d881f27ecddd7be762ba24951d6cb67751d
Author: Paul Durrant <paul@xen.org>
Date:   Tue Mar 24 17:40:09 2020 +0100

    x86 / ioreq: use a MEMF_no_refcount allocation for server pages...
    
    ... now that it is safe to assign them.
    
    This avoids relying on libxl (or whatever toolstack is in use) setting
    max_pages up with sufficient 'slop' to allow all necessary ioreq server
    pages to be allocated.
    
    Signed-off-by: Paul Durrant <paul@xen.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 4203f4d3dfcd73adaeea997f546e0ea27a3c170a
Author: Paul Durrant <paul@xen.org>
Date:   Tue Mar 24 17:37:27 2020 +0100

    mm: keep PGC_extra pages on a separate list
    
    This patch adds a new page_list_head into struct domain to hold PGC_extra
    pages. This avoids them getting confused with 'normal' domheap pages where
    the domain's page_list is walked.
    
    A new dump loop is also added to dump_pageframe_info() to unconditionally
    dump the 'extra page list'.
    
    Signed-off-by: Paul Durrant <paul@xen.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <julien@xen.org>

commit 4c7d340f75abc64f131b0f9bffd6d66d72e43528
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Mar 24 17:36:44 2020 +0100

    sched: fix onlining cpu with core scheduling active
    
    When onlining a cpu cpupool_cpu_add() checks whether all siblings of
    the new cpu are free in order to decide whether to add it to cpupool0.
    In case the added cpu is not the last sibling to be onlined this test
    is wrong as it only checks for all online siblings to be free. The
    test should include the check for the number of siblings having
    reached the scheduling granularity of cpupool0, too.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

commit 3ec1296ad3a823609eec479cb6c7ee493f6a888b
Author: Pu Wen <puwen@hygon.cn>
Date:   Tue Mar 24 10:56:22 2020 +0100

    x86/mce: correct the machine check vendor for Hygon
    
    Currently the xl dmesg output on Hygon platforms will be
    "(XEN) CPU0: AMD Fam18h machine check reporting enabled",
    which is misleading as AMD does not have family 18h (Hygon
    negotiated with AMD to confirm that only Hygon has family 18h).
    
    To correct this, add Hygon machine check type and vendor string.
    
    Signed-off-by: Pu Wen <puwen@hygon.cn>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit fdb96c8256422524a9dbc3b26d44c48829cf7029
Author: Yan Yankovskyi <yyankovskyi@gmail.com>
Date:   Tue Mar 24 10:50:38 2020 +0100

    evtchn: change evtchn port type to evtchn_port_t
    
    struct evtchn_set_priority uses uint32_t type for event channel port.
    Replace the type with evtchn_port_t. Such change is also done in Linux.
    
    Signed-off-by: Yan Yankovskyi <yyankovskyi@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit daed26bb7ff6714e1c2eaa3dc980c4ce4343e307
Author: Hongyan Xia <hongyxia@amazon.com>
Date:   Tue Mar 24 10:44:22 2020 +0100

    x86/tboot: check return value of dmar_table allocation
    
    The allocation can just return NULL. Return an error value early instead
    of crashing later on.
    
    Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit f10df652c78cbdd0c25e93767baad55b022af5be
Author: David Woodhouse <dwmw@amazon.co.uk>
Date:   Tue Mar 24 10:43:51 2020 +0100

    build: add -MP to CFLAGS along with -MMD
    
    This causes gcc (yes, and clang) to emit phony targets for each dependency.
    
    This means that when a header file is deleted, the C files which *used*
    to include it will no longer stop building with bogus out-of-date
    dependencies like this:
    
      make[5]: *** No rule to make target
      '/home/dwmw2/git/xen/xen/include/asm/hvm/svm/amd-iommu-proto.h',
      needed by 'p2m.o'. Stop.
    
    Based on -MP post-dating -MP by many years it is assumed that the
    behavior of -MP isn't the defualt just out of extreme caution. We're
    sufficiently convinced that there are no undue side effects of this.
    
    Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
(qemu changes not included)

