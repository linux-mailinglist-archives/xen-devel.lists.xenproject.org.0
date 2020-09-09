Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10762623C7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 02:01:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFnXI-0000DP-KK; Wed, 09 Sep 2020 00:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLKP=CS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFnXG-0008Vw-Lw
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 00:00:26 +0000
X-Inumbo-ID: 814627ae-c39a-4929-9864-161f20991275
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 814627ae-c39a-4929-9864-161f20991275;
 Wed, 09 Sep 2020 00:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=Y0szsNL1746WACoKEqSnDRxAsZ9WyaxiRaVAukrlScQ=; b=s271W8A9wo36C7JiU4he0OafNJ
 dU+AOk4oOYnl4ETGeC8vaVus8QBPkCnBdZYqxlszQmorFnjLztqMuWLq01tmoriOCPI4LvaJkRc6m
 6sdGETbBpLmCGxox4B0Zhx8QAmOONmb3ekbkBLuTZMSX/LmtIUL+6YASLgeHDzYuvrFU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFnXA-0002NY-3t; Wed, 09 Sep 2020 00:00:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFnX9-0007UG-S4; Wed, 09 Sep 2020 00:00:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFnX9-00024v-Rb; Wed, 09 Sep 2020 00:00:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153957-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 153957: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-xtf-amd64-amd64-1:xtf/test-pv64-selftest:fail:regression
 xen-unstable:test-amd64-coresched-amd64-xl:guest-saverestore:fail:regression
 xen-unstable:test-xtf-amd64-amd64-1:leak-check/check:fail:regression
 xen-unstable:test-amd64-amd64-xl-pvhv2-amd:guest-localmigrate/x10:fail:regression
 xen-unstable:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-localmigrate:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-saverestore:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
 xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:guest-localmigrate/x10:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:windows-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-amd64-pvgrub:guest-localmigrate/x10:fail:heisenbug
 xen-unstable:test-amd64-coresched-amd64-xl:guest-start:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-credit1:debian-install:fail:heisenbug
 xen-unstable:test-xtf-amd64-amd64-4:xtf/test-pv64-livepatch-priv-check:fail:heisenbug
 xen-unstable:test-xtf-amd64-amd64-4:leak-check/check:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-pvhv2-amd:guest-localmigrate:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-localmigrate:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-credit1:guest-start:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-multivcpu:guest-start:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-localmigrate/x10:fail:heisenbug
 xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:heisenbug
 xen-unstable:test-amd64-amd64-libvirt:guest-start:fail:heisenbug
 xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:guest-localmigrate:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-amd64-pvgrub:debian-di-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-pygrub:guest-start:fail:heisenbug
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:nested-setup:fail:heisenbug
 xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
 xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=b11910082d90bb1597f6679524eb726a33306672
X-Osstest-Versions-That: xen=7a8d8bde9820387c3e168182b99fd9761c223fff
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Sep 2020 00:00:19 +0000
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

flight 153957 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153957/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-xtf-amd64-amd64-1       18 xtf/test-pv64-selftest   fail REGR. vs. 152877
 test-amd64-coresched-amd64-xl 15 guest-saverestore       fail REGR. vs. 152877
 test-xtf-amd64-amd64-1       19 leak-check/check         fail REGR. vs. 152877
 test-amd64-amd64-xl-pvhv2-amd 18 guest-localmigrate/x10  fail REGR. vs. 152877
 test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 152877
 test-amd64-amd64-xl-qemut-win7-amd64 14 guest-localmigrate fail REGR. vs. 152877
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 13 guest-saverestore fail REGR. vs. 152877
 test-amd64-amd64-xl-qemuu-win7-amd64 10 windows-install  fail REGR. vs. 152877
 test-amd64-amd64-dom0pvh-xl-amd 18 guest-localmigrate/x10 fail in 153931 REGR. vs. 152877

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail in 153906 pass in 153957
 test-amd64-amd64-xl-qemut-win7-amd64 10 windows-install fail in 153906 pass in 153957
 test-amd64-amd64-amd64-pvgrub 17 guest-localmigrate/x10 fail in 153931 pass in 153906
 test-amd64-coresched-amd64-xl 12 guest-start     fail in 153931 pass in 153957
 test-amd64-amd64-xl-credit1  10 debian-install   fail in 153931 pass in 153957
 test-xtf-amd64-amd64-4 94 xtf/test-pv64-livepatch-priv-check fail in 153931 pass in 153957
 test-xtf-amd64-amd64-4       95 leak-check/check fail in 153931 pass in 153957
 test-amd64-amd64-xl-pvhv2-amd 16 guest-localmigrate fail in 153931 pass in 153957
 test-amd64-amd64-xl-qemuu-ovmf-amd64 14 guest-localmigrate fail in 153931 pass in 153957
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail in 153931 pass in 153957
 test-amd64-amd64-xl-credit1  12 guest-start                fail pass in 153906
 test-amd64-amd64-xl-multivcpu 12 guest-start               fail pass in 153906
 test-amd64-amd64-xl-qemuu-ovmf-amd64 16 guest-localmigrate/x10 fail pass in 153906
 test-amd64-amd64-dom0pvh-xl-amd 12 guest-start             fail pass in 153931
 test-amd64-amd64-libvirt     12 guest-start                fail pass in 153931
 test-amd64-amd64-qemuu-freebsd12-amd64 15 guest-localmigrate fail pass in 153931
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail pass in 153931
 test-amd64-amd64-amd64-pvgrub 10 debian-di-install         fail pass in 153931
 test-amd64-amd64-pygrub      11 guest-start                fail pass in 153931
 test-amd64-amd64-qemuu-nested-amd 11 nested-setup          fail pass in 153931
 test-amd64-amd64-libvirt-vhd 17 guest-start/debian.repeat  fail pass in 153931
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail pass in 153931

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt    13 migrate-support-check fail in 153931 never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2 fail in 153931 never pass
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 152849
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 152877
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 152877
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 152877
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 152877
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 152877
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 152877
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 152877
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b11910082d90bb1597f6679524eb726a33306672
baseline version:
 xen                  7a8d8bde9820387c3e168182b99fd9761c223fff

Last test of basis   152877  2020-08-27 01:51:40 Z   12 days
Failing since        152896  2020-08-27 13:07:51 Z   12 days   36 attempts
Testing same since   153906  2020-09-07 21:42:27 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  George Dunlap <george.dunlap@citrix.com>
  Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michael Kurth <mku@amazon.de>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Chen <wei.chen@arm.com>
  Wei Liu <wl@xen.org>

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
 test-xtf-amd64-amd64-1                                       fail    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
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
 test-amd64-amd64-xl-credit1                                  fail    
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
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
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

(No revision log; it would be 1129 lines long.)

