Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6DA1F0820
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 20:20:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhdPw-0006sA-7D; Sat, 06 Jun 2020 18:19:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUo7=7T=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jhdPv-0006s5-F3
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2020 18:19:39 +0000
X-Inumbo-ID: 476a2720-a822-11ea-9ad7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 476a2720-a822-11ea-9ad7-bc764e2007e4;
 Sat, 06 Jun 2020 18:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bhHJ21gDFxjYvRwEuhYiXme4pJuAWPFnJ5SKOD71vc=; b=LbMztMBBMjqAuYI89/FhAEGs1
 2p2H4V4DWoA+en19wvDXgZN2+zAl6SxyoLol5xX4ye1y9JUu55qgYjlMvnQ8GOrEvaZoZEInMcBZt
 QVL+qb3xGHm8B5DSw9pang23hWPMFhj0Mihen834mQhoXlx6FB1Yx5/0sNSrGptLulQ38=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhdPs-00043t-9Q; Sat, 06 Jun 2020 18:19:36 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhdPs-000453-1w; Sat, 06 Jun 2020 18:19:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jhdPs-0005lG-0x; Sat, 06 Jun 2020 18:19:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150895-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 150895: FAIL
X-Osstest-Failures: qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<job
 status>:broken:regression
 qemu-mainline:test-amd64-i386-xl:<job status>:broken:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:<job
 status>:broken:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:<job status>:broken:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job
 status>:broken:regression
 qemu-mainline:test-amd64-i386-libvirt-xsm:<job status>:broken:regression
 qemu-mainline:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:hosts-allocate:broken:heisenbug
 qemu-mainline:test-amd64-amd64-xl-rtds:capture-logs(19):broken:heisenbug
 qemu-mainline:test-amd64-amd64-i386-pvgrub:syslog-server:broken:heisenbug
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:host-ping-check-xen:fail:heisenbug
 qemu-mainline:test-amd64-i386-xl:guest-localmigrate/x10:fail:heisenbug
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:guest-start/redhat.repeat:fail:heisenbug
 qemu-mainline:test-amd64-amd64-i386-pvgrub:debian-di-install:fail:heisenbug
 qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:heisenbug
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:heisenbug
 qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:heisenbug
 qemu-mainline:test-amd64-amd64-i386-pvgrub:capture-logs(11):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:capture-logs(11):broken:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:capture-logs(9):broken:nonblocking
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:capture-logs(13):broken:nonblocking
 qemu-mainline:test-amd64-i386-xl:capture-logs(19):broken:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:capture-logs(19):broken:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:capture-logs(19):broken:nonblocking
 qemu-mainline:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: qemuu=175198ad91d8bac540159705873b4ffe4fb94eab
X-Osstest-Versions-That: qemuu=66234fee9c2d37bfbc523aa8d0ae5300a14cc10e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Jun 2020 18:19:36 +0000
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

flight 150895 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150895/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>            broken in 150872
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>          broken in 150872
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict <job status> broken in 150872
 test-amd64-i386-xl              <job status>                 broken  in 150872
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <job status>      broken in 150872
 test-amd64-amd64-xl-rtds        <job status>                 broken  in 150872
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>   broken in 150872
 test-amd64-i386-libvirt-xsm     <job status>                 broken  in 150872
 test-amd64-amd64-i386-pvgrub    <job status>                 broken  in 150872

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-debianhvm-amd64 2 hosts-allocate broken in 150872 pass in 150895
 test-amd64-amd64-xl-rtds   19 capture-logs(19) broken in 150872 pass in 150895
 test-amd64-amd64-i386-pvgrub  3 syslog-server  broken in 150872 pass in 150895
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 8 host-ping-check-xen fail in 150872 pass in 150895
 test-amd64-i386-xl     18 guest-localmigrate/x10 fail in 150872 pass in 150895
 test-amd64-i386-qemuu-rhel6hvm-amd 12 guest-start/redhat.repeat fail in 150872 pass in 150895
 test-amd64-amd64-i386-pvgrub 10 debian-di-install fail in 150872 pass in 150895
 test-amd64-i386-libvirt-xsm 18 guest-start/debian.repeat fail in 150872 pass in 150895
 test-amd64-amd64-xl-qemuu-ws16-amd64 10 windows-install fail in 150872 pass in 150895
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 18 guest-start/debianhvm.repeat fail in 150872 pass in 150895
 test-arm64-arm64-libvirt-xsm 16 guest-start/debian.repeat  fail pass in 150872

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-i386-pvgrub 11 capture-logs(11) broken in 150872 blocked in 150694
 test-amd64-amd64-xl-qemuu-ws16-amd64 11 capture-logs(11) broken in 150872 blocked in 150694
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 9 capture-logs(9) broken in 150872 never pass
 test-amd64-i386-qemuu-rhel6hvm-amd 13 capture-logs(13) broken in 150872 never pass
 test-amd64-i386-xl           19 capture-logs(19)   broken in 150872 never pass
 test-amd64-i386-libvirt-xsm  19 capture-logs(19)   broken in 150872 never pass
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 19 capture-logs(19) broken in 150872 never pass
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150694
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150694
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150694
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150694
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150694
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150694
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150694
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 qemuu                175198ad91d8bac540159705873b4ffe4fb94eab
baseline version:
 qemuu                66234fee9c2d37bfbc523aa8d0ae5300a14cc10e

Last test of basis   150694  2020-06-04 11:44:20 Z    2 days
Failing since        150831  2020-06-05 13:06:20 Z    1 days    3 attempts
Testing same since   150872  2020-06-05 22:39:31 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Bulekov <alxndr@bu.edu>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jared Rossi <jrossi@linux.ibm.com>
  Kevin Wolf <kwolf@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

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
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
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
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
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
 test-armhf-armhf-xl-rtds                                     fail    
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

broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-i386-xl broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-i386-libvirt-xsm broken
broken-job test-amd64-amd64-i386-pvgrub broken

Not pushing.

(No revision log; it would be 447 lines long.)

