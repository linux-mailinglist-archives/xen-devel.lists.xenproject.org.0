Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F395608083
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 23:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427979.677657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzDj-0005LC-15; Fri, 21 Oct 2022 21:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427979.677657; Fri, 21 Oct 2022 21:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzDi-0005Ix-UA; Fri, 21 Oct 2022 21:06:22 +0000
Received: by outflank-mailman (input) for mailman id 427979;
 Fri, 21 Oct 2022 21:06:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olzDh-0005Im-EA; Fri, 21 Oct 2022 21:06:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olzDh-0003ln-Aw; Fri, 21 Oct 2022 21:06:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1olzDg-0006T2-T9; Fri, 21 Oct 2022 21:06:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1olzDg-0003uM-SY; Fri, 21 Oct 2022 21:06:20 +0000
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
	bh=0vrnN8aaatCMeAbocLoDdR/LhU5gXPEnd7QdZMQxvTg=; b=SgmUBhznHbyYwjQ+TAX/gdIDdD
	YY4hD2srNUIA4FUknkMIQcKOoSQgzKaKd0ml8pnyg7DRyJ5KlNlS191CdIX+RmxpQtXJfBQ38cIdK
	dCg+PY8RasVrxd73HV6fTMH+lkfmVJ0Ec1vdv588dQ5gni1T21lNYeA26taPeJVuLN74=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174152-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.13-testing test] 174152: regressions - FAIL
X-Osstest-Failures:
    xen-4.13-testing:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    xen-4.13-testing:test-arm64-arm64-xl-credit1:guest-start:fail:regression
    xen-4.13-testing:test-arm64-arm64-xl-seattle:guest-start:fail:regression
    xen-4.13-testing:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    xen-4.13-testing:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    xen-4.13-testing:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    xen-4.13-testing:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    xen-4.13-testing:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    xen-4.13-testing:test-armhf-armhf-libvirt:guest-start:fail:regression
    xen-4.13-testing:test-armhf-armhf-libvirt-qcow2:debian-di-install:fail:regression
    xen-4.13-testing:test-armhf-armhf-xl:guest-start:fail:regression
    xen-4.13-testing:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    xen-4.13-testing:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-intel:xen-boot:fail:heisenbug
    xen-4.13-testing:test-arm64-arm64-libvirt-xsm:guest-start:fail:heisenbug
    xen-4.13-testing:test-arm64-arm64-libvirt-raw:debian-di-install:fail:heisenbug
    xen-4.13-testing:test-arm64-arm64-xl:guest-start:fail:heisenbug
    xen-4.13-testing:test-arm64-arm64-xl-credit2:guest-start:fail:heisenbug
    xen-4.13-testing:test-arm64-arm64-xl-vhd:debian-di-install:fail:heisenbug
    xen-4.13-testing:test-amd64-i386-libvirt-xsm:xen-install:fail:heisenbug
    xen-4.13-testing:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    xen-4.13-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.13-testing:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl-arndale:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-4.13-testing:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-4.13-testing:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-4.13-testing:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=0be63c2615b268001f7cc9b72ce25eed952737dc
X-Osstest-Versions-That:
    xen=bde3b13043e31fd757c44bcec182b0ff1fe36d22
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Oct 2022 21:06:20 +0000

flight 174152 xen-4.13-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174152/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 172549
 test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 172549
 test-arm64-arm64-xl-seattle  14 guest-start              fail REGR. vs. 172549
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 172549
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 172549
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 172549
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 172549
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 172549
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 172549
 test-armhf-armhf-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 172549
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 172549
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 172549
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 172549

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot    fail in 173935 pass in 174152
 test-arm64-arm64-libvirt-xsm 14 guest-start                fail pass in 173735
 test-arm64-arm64-libvirt-raw 12 debian-di-install          fail pass in 173735
 test-arm64-arm64-xl          14 guest-start                fail pass in 173935
 test-arm64-arm64-xl-credit2  14 guest-start                fail pass in 173935
 test-arm64-arm64-xl-vhd      12 debian-di-install          fail pass in 173935
 test-amd64-i386-libvirt-xsm   7 xen-install                fail pass in 174126

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 172549

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 173735 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 173735 never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 173735 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 173735 never pass
 test-arm64-arm64-xl         15 migrate-support-check fail in 173935 never pass
 test-arm64-arm64-xl     16 saverestore-support-check fail in 173935 never pass
 test-arm64-arm64-xl-credit2 15 migrate-support-check fail in 173935 never pass
 test-arm64-arm64-xl-credit2 16 saverestore-support-check fail in 173935 never pass
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 173935 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 173935 never pass
 test-amd64-i386-libvirt-xsm 15 migrate-support-check fail in 174126 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 172549
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 172549
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 172549
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 172549
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 172549
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 172549
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 172549
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 172549
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 172549
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw  1 build-check(1)           starved in 174126 n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)         starved in 174126 n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)          starved in 174126 n/a
 test-armhf-armhf-xl           1 build-check(1)           starved in 174126 n/a
 test-armhf-armhf-libvirt      1 build-check(1)           starved in 174126 n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)           starved in 174126 n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)         starved in 174126 n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)           starved in 174126 n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)           starved in 174126 n/a
 build-armhf-libvirt           1 build-check(1)           starved in 174126 n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)           starved in 174126 n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)           starved in 174126 n/a
 build-armhf                   2 hosts-allocate           starved in 174126 n/a

version targeted for testing:
 xen                  0be63c2615b268001f7cc9b72ce25eed952737dc
baseline version:
 xen                  bde3b13043e31fd757c44bcec182b0ff1fe36d22

Last test of basis   172549  2022-08-15 14:37:33 Z   67 days
Failing since        173495  2022-10-11 14:08:01 Z   10 days   11 attempts
Testing same since   173657  2022-10-13 01:09:08 Z    8 days    8 attempts

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
 test-arm64-arm64-xl                                          fail    
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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
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
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  fail    
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
 test-arm64-arm64-libvirt-raw                                 fail    
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


Not pushing.

(No revision log; it would be 450 lines long.)

