Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C649653D9C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:42:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468335.727409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8I5p-0000dC-Ah; Thu, 22 Dec 2022 09:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468335.727409; Thu, 22 Dec 2022 09:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8I5p-0000bO-7p; Thu, 22 Dec 2022 09:42:25 +0000
Received: by outflank-mailman (input) for mailman id 468335;
 Thu, 22 Dec 2022 09:42:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8I5n-0000bE-VX; Thu, 22 Dec 2022 09:42:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8I5n-0007uK-Sy; Thu, 22 Dec 2022 09:42:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8I5n-0006mO-Cx; Thu, 22 Dec 2022 09:42:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8I5n-0002oL-CT; Thu, 22 Dec 2022 09:42:23 +0000
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
	bh=5bFDeJtqvp2Duau0dsrcZJjvDN3ASoD6j3KyxCZ/MGc=; b=BBwgeOELeWkVLIn2tNDCDE0tpD
	e3CLtNMPJrJUG0ujPkCmUaFILJwj6KRO6wylH+zx4XHTTSuhBL93t9vCm/x0iiks6acZvvE5jsDVC
	+dM5Od/20GeB5b3Kp7F/KpAw+ecprJ/GGo8xOEpGUHZnNbvU7YcZgzkeywmmuasRuQlk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175442-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 175442: trouble: broken/fail/pass
X-Osstest-Failures:
    xen-4.16-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.16-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-4.16-testing:test-amd64-i386-xl-xsm:<job status>:broken:regression
    xen-4.16-testing:test-amd64-i386-freebsd10-amd64:<job status>:broken:regression
    xen-4.16-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-4.16-testing:test-amd64-i386-xl-vhd:<job status>:broken:regression
    xen-4.16-testing:test-amd64-i386-xl-vhd:host-install(5):broken:heisenbug
    xen-4.16-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-4.16-testing:test-amd64-i386-xl-xsm:host-install(5):broken:heisenbug
    xen-4.16-testing:test-amd64-i386-freebsd10-amd64:host-install(5):broken:heisenbug
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    xen-4.16-testing:test-amd64-i386-livepatch:xen-install:fail:heisenbug
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:debian-di-install:fail:heisenbug
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=65bf12135f618614bbf44626fba1c20ca8d1a127
X-Osstest-Versions-That:
    xen=03a43f548e9095448db72c829db575097910f84f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Dec 2022 09:42:23 +0000

flight 175442 xen-4.16-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175442/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 175155
 test-amd64-i386-xl-xsm          <job status>                 broken  in 175427
 test-amd64-i386-freebsd10-amd64    <job status>               broken in 175427
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm <job status> broken in 175427
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>           broken in 175427
 test-amd64-i386-xl-vhd          <job status>                 broken  in 175427

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-vhd       5 host-install(5) broken in 175427 pass in 175442
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken in 175427 pass in 175442
 test-amd64-i386-xl-xsm       5 host-install(5) broken in 175427 pass in 175442
 test-amd64-i386-freebsd10-amd64 5 host-install(5) broken in 175427 pass in 175442
 test-amd64-i386-xl-qemuu-ovmf-amd64 5 host-install(5) broken in 175427 pass in 175442
 test-amd64-i386-livepatch     7 xen-install      fail in 175427 pass in 175442
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 175427
 test-arm64-arm64-libvirt-raw 12 debian-di-install          fail pass in 175427

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 175427 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 175427 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175155
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175155
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175155
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175155
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175155
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175155
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175155
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175155
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175155
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175155
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175155
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175155
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  65bf12135f618614bbf44626fba1c20ca8d1a127
baseline version:
 xen                  03a43f548e9095448db72c829db575097910f84f

Last test of basis   175155  2022-12-12 16:08:43 Z    9 days
Failing since        175403  2022-12-19 08:37:45 Z    3 days    4 attempts
Testing same since   175427  2022-12-20 15:35:42 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Neowutran <xen@neowutran.ovh>
  Per Bilse <per.bilse@citrix.com>

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
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  broken  
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
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
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

broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-job test-amd64-i386-xl-xsm broken
broken-job test-amd64-i386-freebsd10-amd64 broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-vhd broken

Not pushing.

------------------------------------------------------------
commit 65bf12135f618614bbf44626fba1c20ca8d1a127
Author: Neowutran <xen@neowutran.ovh>
Date:   Tue Dec 20 13:51:42 2022 +0100

    x86/time: prevent overflow with high frequency TSCs
    
    Make sure tsc_khz is promoted to a 64-bit type before multiplying by
    1000 to avoid an 'overflow before widen' bug. Otherwise just above
    4.294GHz the value will overflow. Processors with clocks this high are
    now in production and require this to work correctly.
    
    Signed-off-by: Neowutran <xen@neowutran.ovh>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: ad15a0a8ca2515d8ac58edfc0bc1d3719219cb77
    master date: 2022-12-19 11:34:16 +0100

commit f2edbd79f5d5ce3b633885469852e1215dc0d4b5
Author: Per Bilse <per.bilse@citrix.com>
Date:   Tue Dec 20 13:50:47 2022 +0100

    ioreq_broadcast(): accept partial broadcast success
    
    Avoid incorrectly triggering an error when a broadcast buffered ioreq
    is not handled by all registered clients, as long as the failure is
    strictly because the client doesn't handle buffered ioreqs.
    
    Signed-off-by: Per Bilse <per.bilse@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    master commit: a44734df6c24fadbdb001f051cc5580c467caf7d
    master date: 2022-12-07 12:17:30 +0100

commit e3396cd8be5ee99d363a23f30c680e42fb2757bd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 20 13:50:16 2022 +0100

    update Xen version to 4.16.4-pre

commit 556c2e817c9cf23b675eb4eaa2dc091f7bb3039f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 19 09:08:32 2022 +0100

    update Xen version to 4.16.3
(qemu changes not included)

