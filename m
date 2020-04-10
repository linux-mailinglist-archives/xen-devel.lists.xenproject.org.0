Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120031A49C1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 20:16:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMyCN-0006Uw-Ul; Fri, 10 Apr 2020 18:16:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fqfT=52=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jMyCM-0006Ur-Tm
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 18:16:14 +0000
X-Inumbo-ID: 5bb20417-7b57-11ea-849b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bb20417-7b57-11ea-849b-12813bfff9fa;
 Fri, 10 Apr 2020 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+kcJGcr9SaCmwmdLYFFQCcPWCQSt/shGyZuY3KvkRvU=; b=XFdUmDrevEcg7Iic/uzWouTQk
 D/mSCba1m0/L1VrhZJu6iKdwqXjPg3sklG8OmUvIxH1qqFmA+mImd/zw0vhwtn3txQ4zm8vkgfX78
 sCNzV9rR+a+EIP5FHtCqzuGMiCuessk+Ce4ATankbHUM+YQN12SoOENOhdXLMfvB50Oz0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMyCK-0004mu-1r; Fri, 10 Apr 2020 18:16:12 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMyCJ-0002Iz-LC; Fri, 10 Apr 2020 18:16:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jMyCJ-0006Fb-KV; Fri, 10 Apr 2020 18:16:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149583-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 149583: regressions - FAIL
X-Osstest-Failures: xen-4.12-testing:test-amd64-amd64-xl-qcow2:guest-saverestore.2:fail:regression
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:heisenbug
 xen-4.12-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: xen=c1a1c4e8fb54038aee36305531426da4e3ad3872
X-Osstest-Versions-That: xen=824bdb432fc8831ee4684e45361a78faee4548ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Apr 2020 18:16:11 +0000
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

flight 149583 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149583/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    16 guest-saverestore.2      fail REGR. vs. 148185

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail pass in 149554

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 xen                  c1a1c4e8fb54038aee36305531426da4e3ad3872
baseline version:
 xen                  824bdb432fc8831ee4684e45361a78faee4548ed

Last test of basis   148185  2020-03-06 18:13:31 Z   34 days
Testing same since   149554  2020-04-09 07:42:33 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  George Dunlap <george.dunlap@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
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
 test-amd64-amd64-xl-qcow2                                    fail    
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
commit c1a1c4e8fb54038aee36305531426da4e3ad3872
Author: Dario Faggioli <dfaggioli@suse.com>
Date:   Thu Apr 9 09:36:51 2020 +0200

    credit2: fix credit reset happening too few times
    
    There is a bug in commit 5e4b4199667b9 ("xen: credit2: only reset
    credit on reset condition"). In fact, the aim of that commit was to
    make sure that we do not perform too many credit reset operations
    (which are not super cheap, and in an hot-path). But the check used
    to determine whether a reset is necessary was the wrong one.
    
    In fact, knowing just that some vCPUs have been skipped, while
    traversing the runqueue (in runq_candidate()), is not enough. We
    need to check explicitly whether the first vCPU in the runqueue
    has a negative amount of credit.
    
    Since a trace record is changed, this patch updates xentrace format file
    and xenalyze as well
    
    This should be backported.
    
    Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
    Acked-by: George Dunlap <george.dunlap@citrix.com>
    master commit: dae7b62e976b28af9c8efa150618c25501bf1650
    master date: 2020-04-03 10:46:53 +0200

commit 4c69d1c2dbe0ad1f5343852d9e596fe870892a6c
Author: Dario Faggioli <dfaggioli@suse.com>
Date:   Thu Apr 9 09:36:08 2020 +0200

    credit2: avoid vCPUs to ever reach lower credits than idle
    
    There have been report of stalls of guest vCPUs, when Credit2 was used.
    It seemed like these vCPUs were not getting scheduled for very long
    time, even under light load conditions (e.g., during dom0 boot).
    
    Investigations led to the discovery that --although rarely-- it can
    happen that a vCPU manages to run for very long timeslices. In Credit2,
    this means that, when runtime accounting happens, the vCPU will lose a
    large quantity of credits. This in turn may lead to the vCPU having less
    credits than the idle vCPUs (-2^30). At this point, the scheduler will
    pick the idle vCPU, instead of the ready to run vCPU, for a few
    "epochs", which often times is enough for the guest kernel to think the
    vCPU is not responding and crashing.
    
    An example of this situation is shown here. In fact, we can see d0v1
    sitting in the runqueue while all the CPUs are idle, as it has
    -1254238270 credits, which is smaller than -2^30 = −1073741824:
    
        (XEN) Runqueue 0:
        (XEN)   ncpus              = 28
        (XEN)   cpus               = 0-27
        (XEN)   max_weight         = 256
        (XEN)   pick_bias          = 22
        (XEN)   instload           = 1
        (XEN)   aveload            = 293391 (~111%)
        (XEN)   idlers: 00,00000000,00000000,00000000,00000000,00000000,0fffffff
        (XEN)   tickled: 00,00000000,00000000,00000000,00000000,00000000,00000000
        (XEN)   fully idle cores: 00,00000000,00000000,00000000,00000000,00000000,0fffffff
        [...]
        (XEN) Runqueue 0:
        (XEN) CPU[00] runq=0, sibling=00,..., core=00,...
        (XEN) CPU[01] runq=0, sibling=00,..., core=00,...
        [...]
        (XEN) CPU[26] runq=0, sibling=00,..., core=00,...
        (XEN) CPU[27] runq=0, sibling=00,..., core=00,...
        (XEN) RUNQ:
        (XEN)     0: [0.1] flags=0 cpu=5 credit=-1254238270 [w=256] load=262144 (~100%)
    
    We certainly don't want, under any circumstance, this to happen.
    Let's, therefore, define a minimum amount of credits a vCPU can have.
    During accounting, we make sure that, for however long the vCPU has
    run, it will never get to have less than such minimum amount of
    credits. Then, we set the credits of the idle vCPU to an even
    smaller value.
    
    NOTE: investigations have been done about _how_ it is possible for a
    vCPU to execute for so much time that its credits becomes so low. While
    still not completely clear, there are evidence that:
    - it only happens very rarely,
    - it appears to be both machine and workload specific,
    - it does not look to be a Credit2 (e.g., as it happens when
      running with Credit1 as well) issue, or a scheduler issue.
    
    This patch makes Credit2 more robust to events like this, whatever
    the cause is, and should hence be backported (as far as possible).
    
    Reported-by: Glen <glenbarney@gmail.com>
    Reported-by: Tomas Mozes <hydrapolic@gmail.com>
    Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
    master commit: 36f3662f27dec32d76c0edb4c6b62b9628d6869d
    master date: 2020-04-03 10:45:43 +0200

commit 9a082e14c66947f0acc4ca05d563b76a50571638
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Apr 9 09:35:24 2020 +0200

    x86/ucode/amd: Fix more potential buffer overruns with microcode parsing
    
    cpu_request_microcode() doesn't know the buffer is at least 4 bytes long
    before inspecting UCODE_MAGIC.
    
    install_equiv_cpu_table() doesn't know the boundary of the buffer it is
    interpreting as an equivalency table.  This case was clearly observed at one
    point in the past, given the subsequent overrun detection, but without
    comprehending that the damage was already done.
    
    Make the logic consistent with container_fast_forward() and pass size_left in
    to install_equiv_cpu_table().
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 718d1432000079ea7120f6cb770372afe707ce27
    master date: 2020-04-01 14:00:12 +0100

commit e282e87f151adab1b269cafc404e0f554d896a45
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 9 09:34:19 2020 +0200

    x86/HVM: fix AMD ECS handling for Fam10
    
    The involved comparison was, very likely inadvertently, converted from
    >= to > when making changes unrelated to the actual family range.
    
    Fixes: 9841eb71ea87 ("x86/cpuid: Drop a guests cached x86 family and model information")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    master commit: 5d515b1c296ebad6889748ea1e49e063453216a3
    master date: 2020-04-01 12:28:30 +0200

commit f3264407d0feadd948359242ac346567d8afa23a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Apr 9 09:33:20 2020 +0200

    x86/ucode/amd: Fix potential buffer overrun with equiv table handling
    
    find_equiv_cpu_id() loops until it finds a 0 installed_cpu entry.  Well formed
    AMD microcode containers have this property.
    
    Extend the checking in install_equiv_cpu_table() to reject tables which don't
    have a sentinal at the end.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 1f97b6b9f1b5978659c5735954c37c130e7bb151
    master date: 2020-03-27 13:13:26 +0000

commit 736c67bc46a333b24a9b0ffc902768ab96505ad6
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 9 09:32:36 2020 +0200

    libx86/CPUID: fix (not just) leaf 7 processing
    
    x86_cpuid_policy_fill_native() should, as it did originally, iterate
    over all subleaves here as well as over all main leaves. Switch to
    using a "<= MIN()"-based approach similar to that used in
    x86_cpuid_copy_to_buffer(). Also follow this for the extended main
    leaves then.
    
    Fixes: 1bd2b750537b ("libx86: Fix 32bit stubdom build of x86_cpuid_policy_fill_native()")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: eb0bad81fceb3e81df5f73441771b49b732edf56
    master date: 2020-03-27 11:40:59 +0100

commit 94f0bb7c3ff63b7322849cd80ed0d6c2b9998ee4
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Apr 9 09:31:45 2020 +0200

    x86/ucode: Fix error paths in apply_microcode()
    
    In the unlikley case that patch application completes, but the resutling
    revision isn't expected, sig->rev doesn't get updated to match reality.
    
    It will get adjusted the next time collect_cpu_info() gets called, but in the
    meantime Xen might operate on a stale value.  Nothing good will come of this.
    
    Rewrite the logic to always update the stashed revision, before worrying about
    whether the attempt was a success or failure.
    
    Take the opportunity to make the printk() messages as consistent as possible.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    master commit: d2a0a96cf76603b2e2b87c3ce80c3f9d098327d4
    master date: 2020-03-26 18:57:45 +0000

commit 4c187457d1890067350c1770b84b75cea1d97214
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Thu Apr 9 09:30:58 2020 +0200

    x86/shim: fix ballooning up the guest
    
    args.preempted is meaningless here as it doesn't signal whether the
    hypercall was preempted before. Use start_extent instead which is
    correct (as long as the hypercall was invoked in a "normal" way).
    
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    master commit: 76dbabb59eeaa78e9f57407e5b15a6606488333e
    master date: 2020-03-18 12:55:54 +0100

commit 3c37292c844a23beffc802192600386e2ea6888c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 9 09:30:14 2020 +0200

    x86/vPMU: don't blindly assume IA32_PERF_CAPABILITIES MSR exists
    
    Just like VMX'es lbr_tsx_fixup_check() the respective CPUID bit should
    be consulted first.
    
    Reported-by: Farrah Chen <farrah.chen@intel.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: 15c39c7c913f26fba40231e103ce1ffa6101e7c9
    master date: 2020-02-26 17:35:48 +0100

commit 813757cf12eab38f3f86fc76a59d9e11749b4b27
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Apr 9 09:29:00 2020 +0200

    AMD/IOMMU: fix off-by-one in amd_iommu_get_paging_mode() callers
    
    amd_iommu_get_paging_mode() expects a count, not a "maximum possible"
    value. Prior to b4f042236ae0 dropping the reference, the use of our mis-
    named "max_page" in amd_iommu_domain_init() may have lead to such a
    misunderstanding. In an attempt to avoid such confusion in the future,
    rename the function's parameter and - while at it - convert it to an
    inline function.
    
    Also replace a literal 4 by an expression tying it to a wider use
    constant, just like amd_iommu_quarantine_init() does.
    
    Fixes: ea38867831da ("x86 / iommu: set up a scratch page in the quarantine domain")
    Fixes: b4f042236ae0 ("AMD/IOMMU: Cease using a dynamic height for the IOMMU pagetables")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: b75b3c62fe4afe381c6f74a07f614c0b39fe2f5d
    master date: 2020-03-16 11:24:29 +0100
(qemu changes not included)

