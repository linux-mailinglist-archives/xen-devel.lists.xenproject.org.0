Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAA651AC7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 07:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466535.725430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7WIn-0002FL-Fs; Tue, 20 Dec 2022 06:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466535.725430; Tue, 20 Dec 2022 06:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7WIn-0002C9-Ca; Tue, 20 Dec 2022 06:40:37 +0000
Received: by outflank-mailman (input) for mailman id 466535;
 Tue, 20 Dec 2022 06:40:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7WIl-0002Bz-OE; Tue, 20 Dec 2022 06:40:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7WIl-0007V5-JH; Tue, 20 Dec 2022 06:40:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7WIl-0006dV-3r; Tue, 20 Dec 2022 06:40:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p7WIl-00072v-0e; Tue, 20 Dec 2022 06:40:35 +0000
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
	bh=BNyPE8IZpI8wnQ2c9akjbQojuSbaCwcxNHKOYJYFvsw=; b=F555BoJQqGc/3jK9Qx8Em/8tHt
	iLKbvsuYb2fRs4Tg2gXPNao5CfkIdYYPTBJwjdEKY8gK10E3tP/1WYOKLyyx7SGcCAc0lSc5dbWP9
	TcCBKbRWBKUzPd8PiUvDuVmi427yWxjujKfVyXNgWz39oJPl33t4MPttVIfgWKCpnM28=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175408-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 175408: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-pair:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-pvshim:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-pvshim:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-pair:host-install/src_host(6):broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:regression
    xen-unstable:test-amd64-amd64-examine-uefi:host-install:broken:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-amd64-examine-uefi:memdisk-try-append:fail:allowable
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=da5092e7d6ed4714b5dc63ed2cd7f6c93dd6efd4
X-Osstest-Versions-That:
    xen=12b593ca0d61ef884c2f2de15ed36b4900fc92b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Dec 2022 06:40:35 +0000

flight 175408 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175408/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-pair            <job status>                 broken
 test-amd64-i386-xl-pvshim       <job status>                 broken
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>    broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-i386-xl-pvshim     5 host-install(5)        broken REGR. vs. 175399
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 175399
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 175399
 test-amd64-i386-pair        6 host-install/src_host(6) broken REGR. vs. 175399
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 175399
 test-amd64-amd64-examine-uefi  5 host-install          broken REGR. vs. 175399
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 175399
 test-amd64-i386-xl-vhd      21 guest-start/debian.repeat fail REGR. vs. 175399

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-examine-uefi  4 memdisk-try-append      fail REGR. vs. 175399

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175399
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175399
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175399
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175399
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175399
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175399
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175399
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175399
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175399
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175399
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175399
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175399
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  da5092e7d6ed4714b5dc63ed2cd7f6c93dd6efd4
baseline version:
 xen                  12b593ca0d61ef884c2f2de15ed36b4900fc92b2

Last test of basis   175399  2022-12-19 01:53:26 Z    1 days
Testing same since   175408  2022-12-19 15:38:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Neowutran <xen@neowutran.ovh>
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
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  broken  
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
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
 test-amd64-i386-pair                                         broken  
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    broken  
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
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
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       fail    


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

broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-xl-pvshim broken
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-step test-amd64-i386-xl-pvshim host-install(5)
broken-step test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-i386-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-i386-pair host-install/src_host(6)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-examine-uefi host-install

Not pushing.

------------------------------------------------------------
commit da5092e7d6ed4714b5dc63ed2cd7f6c93dd6efd4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Dec 19 11:35:25 2022 +0100

    NUMA: replace phys_to_nid()
    
    All callers convert frame numbers (perhaps in turn derived from struct
    page_info pointers) to an address, just for the function to convert it
    back to a frame number (as the first step of paddr_to_pdx()). Replace
    the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
    call sites by the respectively most suitable one.
    
    While there also
    - introduce a !NUMA stub, eliminating the need for Arm (and potentially
      other ports) to carry one individually,
    - drop the (strictly speaking wrong) "pure" attribute from the function,
    - extend a condition in dump_numa() to make sure that none of the
      assertions would trigger for empty or (unlikely) single-page nodes (at
      the same time this also prevents the warning printk() to be issued for
      every empty [e.g. CPU-only] node).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit ad15a0a8ca2515d8ac58edfc0bc1d3719219cb77
Author: Neowutran <xen@neowutran.ovh>
Date:   Mon Dec 19 11:34:16 2022 +0100

    x86/time: prevent overflow with high frequency TSCs
    
    Make sure tsc_khz is promoted to a 64-bit type before multiplying by
    1000 to avoid an 'overflow before widen' bug. Otherwise just above
    4.294GHz the value will overflow. Processors with clocks this high are
    now in production and require this to work correctly.
    
    Signed-off-by: Neowutran <xen@neowutran.ovh>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 573279cde1c4e752d4df34bc65ffafa17573148e
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Dec 19 11:24:14 2022 +0100

    x86/vmx: implement Notify VM Exit
    
    Under certain conditions guests can get the CPU stuck in an unbounded
    loop without the possibility of an interrupt window to occur on
    instruction boundary.  This was the case with the scenarios described
    in XSA-156.
    
    Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
    if no interrupt window occurs for a specified amount of time.  Note
    that using the Notify VM Exit avoids having to trap #AC and #DB
    exceptions, as Xen is guaranteed to get a VM Exit even if the guest
    puts the CPU in a loop without an interrupt window, as such disable
    the intercepts if the feature is available and enabled.
    
    Setting the notify VM exit window to 0 is safe because there's a
    threshold added by the hardware in order to have a sane window value.
    
    Note the handling of EXIT_REASON_NOTIFY in the nested virtualization
    case is passed to L0, and hence a nested guest being able to trigger a
    notify VM exit with an invalid context would be able to crash the L1
    hypervisor (by L0 destroying the domain).  Since we don't expose VM
    Notify support to L1 it should already enable the required
    protections in order to prevent VM Notify from triggering in the first
    place.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit d329b37d12132164c3894d0b6284be72576ef950
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Dec 19 11:23:34 2022 +0100

    x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
    
    Introduce a small helper to OR VMX_INTR_SHADOW_NMI in
    GUEST_INTERRUPTIBILITY_INFO in order to help dealing with the NMI
    unblocked by IRET case.  Replace the existing usage in handling
    EXIT_REASON_EXCEPTION_NMI and also add such handling to EPT violations
    and page-modification log-full events.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit f7d07619d2ae0382e2922e287fbfbb27722f3f0b
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Dec 19 11:22:43 2022 +0100

    x86/vmx: implement VMExit based guest Bus Lock detection
    
    Add support for enabling guest Bus Lock Detection on Intel systems.
    Such detection works by triggering a vmexit, which ought to be enough
    of a pause to prevent a guest from abusing of the Bus Lock.
    
    Add an extra Xen perf counter to track the number of Bus Locks detected.
    This is done because Bus Locks can also be reported by setting the bit
    26 in the exit reason field, so also account for those.
    
    Note EXIT_REASON_BUS_LOCK VMExits will always have bit 26 set in
    exit_reason, and hence the performance counter doesn't need to be
    increased for EXIT_REASON_BUS_LOCK handling.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
(qemu changes not included)

