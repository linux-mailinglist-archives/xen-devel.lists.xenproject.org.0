Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C45FF87C
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423230.669807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZGo-0004Hg-FR; Sat, 15 Oct 2022 04:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423230.669807; Sat, 15 Oct 2022 04:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZGo-0004Ez-Br; Sat, 15 Oct 2022 04:59:34 +0000
Received: by outflank-mailman (input) for mailman id 423230;
 Sat, 15 Oct 2022 04:59:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojZGm-0004Ep-MA; Sat, 15 Oct 2022 04:59:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojZGm-0000hd-HF; Sat, 15 Oct 2022 04:59:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojZGm-0006ne-4R; Sat, 15 Oct 2022 04:59:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ojZGm-0000MU-3y; Sat, 15 Oct 2022 04:59:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=s35jehzkUomqlItiOBHXBg67Xd2tjzlA8QTTQVDcmJY=; b=Hi7fvc7WSQSS6hdoLAV4tceSOZ
	bnVbhdWDH0RAuyTKLDkq9NjUkiM0GTrULr0rc2mgaTtdBVmO9k9rFiTNiRxZAUEccuR8Jv0qbkkuj
	hd7oPPwdsM27orv6MharjG0d0zPy1dYtfK/1a28pwwa75JC3xpzH/GSdtC8B0nyXdXsA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173725-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 173725: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    xen-4.14-testing:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl-vhd:debian-di-install:fail:regression
    xen-4.14-testing:test-arm64-arm64-xl-seattle:guest-start:fail:regression
    xen-4.14-testing:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    xen-4.14-testing:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:debian-di-install:fail:regression
    xen-4.14-testing:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    xen-4.14-testing:test-armhf-armhf-xl:guest-start:fail:regression
    xen-4.14-testing:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    xen-4.14-testing:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    xen-4.14-testing:test-armhf-armhf-libvirt:guest-start:fail:regression
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    xen-4.14-testing:test-amd64-amd64-xl-credit2:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-i386-migrupgrade:xen-install/src_host:fail:heisenbug
    xen-4.14-testing:test-amd64-i386-migrupgrade:xen-install/dst_host:fail:heisenbug
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-4.14-testing:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=016de62747b26ead5a5c763b640fe8e205cd182b
X-Osstest-Versions-That:
    xen=4ed063a71bf9ec291a1b71d0b7b36c0416ca544d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Oct 2022 04:59:32 +0000

flight 173725 xen-4.14-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173725/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-arm64-arm64-xl-vhd      12 debian-di-install        fail REGR. vs. 172550
 test-arm64-arm64-xl-seattle  14 guest-start              fail REGR. vs. 172550
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 172550
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 172550
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 172550
 test-armhf-armhf-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 172550
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 172550
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 172550
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 172550
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 172550
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 172550
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 172550
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 172550

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-credit2   5 host-install(5)          broken pass in 173650
 test-amd64-i386-migrupgrade 10 xen-install/src_host fail in 173650 pass in 173725
 test-amd64-i386-migrupgrade 11 xen-install/dst_host fail in 173650 pass in 173725
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 173650

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 172550

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 172550
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 172550
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 172550
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 172550
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 172550
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 172550
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 172550
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 172550
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 172550
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  016de62747b26ead5a5c763b640fe8e205cd182b
baseline version:
 xen                  4ed063a71bf9ec291a1b71d0b7b36c0416ca544d

Last test of basis   172550  2022-08-15 14:37:34 Z   60 days
Failing since        173496  2022-10-11 14:08:01 Z    3 days    5 attempts
Testing same since   173650  2022-10-13 00:06:56 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>

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
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      fail    
 test-amd64-i386-xl-vhd                                       pass    


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

broken-job test-amd64-amd64-xl-credit2 broken
broken-step test-amd64-amd64-xl-credit2 host-install(5)

Not pushing.

(No revision log; it would be 450 lines long.)

