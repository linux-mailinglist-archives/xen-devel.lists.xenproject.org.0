Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F5323235
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 21:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89095.167579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEeUY-0000jQ-Jw; Tue, 23 Feb 2021 20:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89095.167579; Tue, 23 Feb 2021 20:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEeUY-0000iy-Fv; Tue, 23 Feb 2021 20:41:10 +0000
Received: by outflank-mailman (input) for mailman id 89095;
 Tue, 23 Feb 2021 20:41:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEeUX-0000io-6Q; Tue, 23 Feb 2021 20:41:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEeUW-0002y9-SM; Tue, 23 Feb 2021 20:41:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lEeUW-00084C-Hs; Tue, 23 Feb 2021 20:41:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lEeUW-0007Up-HK; Tue, 23 Feb 2021 20:41:08 +0000
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
	bh=Ho2jbA9tbu4P+nJhf82giSvtDTw3XG4UDYg70oLnkxY=; b=g8BWUOadWKVM9R70OK5bJSk5mE
	nTnmCkgkTdCtORjXSKLWQpdRyly3pnbh7+hLVmMb1t5WNGaEs3P3eE35grBbEqrn5/MCOcdjA1WhU
	XJBdpWvFcDI8YHHRiqwNXJieHKRIZDQizwKyehzjjmLeiLhzzngPBMT4WTyjCckTND1Y=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159576-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 159576: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-shadow:xen-boot:fail:regression
    xen-unstable:test-xtf-amd64-amd64-1:xtf/test-pv32pae-selftest:fail:regression
    xen-unstable:test-xtf-amd64-amd64-2:xtf/test-pv32pae-selftest:fail:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:xen-boot:fail:regression
    xen-unstable:test-xtf-amd64-amd64-3:xtf/test-pv32pae-selftest:fail:regression
    xen-unstable:test-amd64-i386-libvirt-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-coresched-i386-xl:xen-boot:fail:regression
    xen-unstable:test-xtf-amd64-amd64-4:xtf/test-pv32pae-selftest:fail:regression
    xen-unstable:test-xtf-amd64-amd64-5:xtf/test-pv32pae-selftest:fail:regression
    xen-unstable:test-amd64-i386-xl-raw:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-libvirt-pair:xen-boot/src_host:fail:regression
    xen-unstable:test-amd64-i386-libvirt-pair:xen-boot/dst_host:fail:regression
    xen-unstable:test-amd64-i386-xl-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-migrupgrade:xen-boot/dst_host:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-freebsd10-i386:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-examine:reboot:fail:regression
    xen-unstable:test-amd64-i386-libvirt:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-livepatch:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-boot/src_host:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-boot/dst_host:fail:regression
    xen-unstable:test-amd64-i386-xl-pvshim:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
X-Osstest-Versions-That:
    xen=e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Feb 2021 20:41:08 +0000

flight 159576 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159576/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-ws16-amd64  8 xen-boot          fail REGR. vs. 159475
 test-amd64-i386-xl-qemuu-debianhvm-amd64  8 xen-boot     fail REGR. vs. 159475
 test-amd64-i386-xl-shadow     8 xen-boot                 fail REGR. vs. 159475
 test-xtf-amd64-amd64-1      19 xtf/test-pv32pae-selftest fail REGR. vs. 159475
 test-xtf-amd64-amd64-2      19 xtf/test-pv32pae-selftest fail REGR. vs. 159475
 test-amd64-i386-qemut-rhel6hvm-intel  8 xen-boot         fail REGR. vs. 159475
 test-xtf-amd64-amd64-3      19 xtf/test-pv32pae-selftest fail REGR. vs. 159475
 test-amd64-i386-libvirt-xsm   8 xen-boot                 fail REGR. vs. 159475
 test-amd64-i386-xl-qemut-debianhvm-amd64  8 xen-boot     fail REGR. vs. 159475
 test-amd64-coresched-i386-xl  8 xen-boot                 fail REGR. vs. 159475
 test-xtf-amd64-amd64-4      19 xtf/test-pv32pae-selftest fail REGR. vs. 159475
 test-xtf-amd64-amd64-5      19 xtf/test-pv32pae-selftest fail REGR. vs. 159475
 test-amd64-i386-xl-raw        8 xen-boot                 fail REGR. vs. 159475
 test-amd64-i386-libvirt-pair 12 xen-boot/src_host        fail REGR. vs. 159475
 test-amd64-i386-libvirt-pair 13 xen-boot/dst_host        fail REGR. vs. 159475
 test-amd64-i386-xl-xsm        8 xen-boot                 fail REGR. vs. 159475
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 159475
 test-amd64-i386-migrupgrade  13 xen-boot/dst_host        fail REGR. vs. 159475
 test-amd64-i386-xl-qemuu-ovmf-amd64  8 xen-boot          fail REGR. vs. 159475
 test-amd64-i386-xl            8 xen-boot                 fail REGR. vs. 159475
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 159475
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 159475
 test-amd64-i386-qemut-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 159475
 test-amd64-i386-qemuu-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 159475
 test-amd64-i386-xl-qemut-win7-amd64  8 xen-boot          fail REGR. vs. 159475
 test-amd64-i386-freebsd10-amd64  8 xen-boot              fail REGR. vs. 159475
 test-amd64-i386-freebsd10-i386  8 xen-boot               fail REGR. vs. 159475
 test-amd64-i386-examine       8 reboot                   fail REGR. vs. 159475
 test-amd64-i386-libvirt       8 xen-boot                 fail REGR. vs. 159475
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 159475
 test-amd64-i386-livepatch     8 xen-boot                 fail REGR. vs. 159475
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 159475
 test-amd64-i386-qemuu-rhel6hvm-intel  8 xen-boot         fail REGR. vs. 159475
 test-amd64-i386-xl-qemuu-ws16-amd64  8 xen-boot          fail REGR. vs. 159475
 test-amd64-i386-pair         12 xen-boot/src_host        fail REGR. vs. 159475
 test-amd64-i386-pair         13 xen-boot/dst_host        fail REGR. vs. 159475
 test-amd64-i386-xl-pvshim     8 xen-boot                 fail REGR. vs. 159475
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 159475
 test-amd64-i386-xl-qemuu-win7-amd64  8 xen-boot          fail REGR. vs. 159475

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail pass in 159559
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat  fail pass in 159559

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 159475
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 159475
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 159475
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 159475
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 159475
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 159475
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 159475
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f894c3d8e705fea9cb3244fa61684bfd8bdd1b2a
baseline version:
 xen                  e8185c5f01c68f7d29d23a4a91bc1be1ff2cc1ca

Last test of basis   159475  2021-02-19 06:26:37 Z    4 days
Failing since        159487  2021-02-20 04:29:29 Z    3 days    7 attempts
Testing same since   159559  2021-02-22 20:38:35 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Norbert Manthey <nmanthey@amazon.de>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>
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
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
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
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    fail    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    fail    
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

(No revision log; it would be 318 lines long.)

