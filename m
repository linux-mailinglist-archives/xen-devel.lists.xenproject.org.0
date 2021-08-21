Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098973F3AFD
	for <lists+xen-devel@lfdr.de>; Sat, 21 Aug 2021 16:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169798.310142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHRv8-0006pY-Aa; Sat, 21 Aug 2021 14:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169798.310142; Sat, 21 Aug 2021 14:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHRv8-0006m5-62; Sat, 21 Aug 2021 14:24:26 +0000
Received: by outflank-mailman (input) for mailman id 169798;
 Sat, 21 Aug 2021 14:24:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHRv6-0006lv-Ln; Sat, 21 Aug 2021 14:24:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHRv6-0000wK-G1; Sat, 21 Aug 2021 14:24:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHRv6-0002zP-5S; Sat, 21 Aug 2021 14:24:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mHRv6-0000AW-4w; Sat, 21 Aug 2021 14:24:24 +0000
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
	bh=qS87F3AdPGtUlXLAuopaE6l4SrTTW6gb81AcUTPQ/A8=; b=t+0xzwu1wQ/Rs5Qk/VXZZUwzqP
	S8ttbPnhl/4JlkzhrX0/AvWDDIRSpNhYQg07PmqYYcfpq+d7a9oo93A6+d3qB34RMXl0yAplvuKSU
	vIfG4+WnKX33bfxn6VFO/4SCeqZ6shis+FfCNxQ2msvroLE+Ituc5izSEl8Jda9royZc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164264-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 164264: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-examine:reboot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-freebsd10-i386:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-livepatch:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-boot/src_host:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-boot/dst_host:fail:regression
    xen-unstable:test-amd64-i386-migrupgrade:xen-boot/dst_host:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-raw:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    xen-unstable:test-amd64-coresched-i386-xl:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-libvirt:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-shadow:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-libvirt-pair:xen-boot/src_host:fail:regression
    xen-unstable:test-amd64-i386-libvirt-pair:xen-boot/dst_host:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-pvshim:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-libvirt-xsm:xen-boot:fail:regression
    xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:allowable
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-amd64-pvgrub:debian-di-install:fail:nonblocking
    xen-unstable:test-amd64-amd64-i386-pvgrub:debian-di-install:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5293470a77ad980dce2af9b7e6c3f11eeebf1b64
X-Osstest-Versions-That:
    xen=54c9736382e0d558a6acd820e44185e020131c48
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 21 Aug 2021 14:24:24 +0000

flight 164264 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164264/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemut-ws16-amd64  8 xen-boot          fail REGR. vs. 164237
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 164237
 test-amd64-i386-examine       8 reboot                   fail REGR. vs. 164237
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 164237
 test-amd64-i386-xl-xsm        8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-freebsd10-i386  8 xen-boot               fail REGR. vs. 164237
 test-amd64-i386-livepatch     8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-pair         12 xen-boot/src_host        fail REGR. vs. 164237
 test-amd64-i386-pair         13 xen-boot/dst_host        fail REGR. vs. 164237
 test-amd64-i386-migrupgrade  13 xen-boot/dst_host        fail REGR. vs. 164237
 test-amd64-i386-xl-qemut-debianhvm-amd64  8 xen-boot     fail REGR. vs. 164237
 test-amd64-i386-xl-qemuu-debianhvm-amd64  8 xen-boot     fail REGR. vs. 164237
 test-amd64-i386-qemut-rhel6hvm-intel  8 xen-boot         fail REGR. vs. 164237
 test-amd64-i386-qemut-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 164237
 test-amd64-i386-xl-raw        8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-qemuu-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 164237
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 164237
 test-amd64-coresched-i386-xl  8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-freebsd10-amd64  8 xen-boot              fail REGR. vs. 164237
 test-amd64-i386-xl-qemut-win7-amd64  8 xen-boot          fail REGR. vs. 164237
 test-amd64-i386-libvirt       8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-xl-qemuu-ovmf-amd64  8 xen-boot          fail REGR. vs. 164237
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 164237
 test-amd64-i386-xl            8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-xl-shadow     8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-libvirt-pair 12 xen-boot/src_host        fail REGR. vs. 164237
 test-amd64-i386-libvirt-pair 13 xen-boot/dst_host        fail REGR. vs. 164237
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 164237
 test-amd64-i386-xl-pvshim     8 xen-boot                 fail REGR. vs. 164237
 test-amd64-i386-qemuu-rhel6hvm-intel  8 xen-boot         fail REGR. vs. 164237
 test-amd64-i386-xl-qemuu-ws16-amd64  8 xen-boot          fail REGR. vs. 164237
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 164237
 test-amd64-i386-xl-qemuu-win7-amd64  8 xen-boot          fail REGR. vs. 164237
 test-amd64-i386-libvirt-xsm   8 xen-boot                 fail REGR. vs. 164237

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10   fail REGR. vs. 164237

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 164237
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 164237
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 164237
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 164237
 test-amd64-amd64-amd64-pvgrub 12 debian-di-install            fail like 164237
 test-amd64-amd64-i386-pvgrub 12 debian-di-install            fail  like 164237
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 164237
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 164237
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 164237
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 xen                  5293470a77ad980dce2af9b7e6c3f11eeebf1b64
baseline version:
 xen                  54c9736382e0d558a6acd820e44185e020131c48

Last test of basis   164237  2021-08-18 07:24:21 Z    3 days
Failing since        164248  2021-08-19 03:12:07 Z    2 days    2 attempts
Testing same since   164264  2021-08-19 18:39:40 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
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
 test-amd64-amd64-amd64-pvgrub                                fail    
 test-amd64-amd64-i386-pvgrub                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
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

------------------------------------------------------------
commit 5293470a77ad980dce2af9b7e6c3f11eeebf1b64
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Aug 19 13:38:31 2021 +0200

    xen/sched: fix get_cpu_idle_time() for smt=0 suspend/resume
    
    With smt=0 during a suspend/resume cycle of the machine the threads
    which have been parked before will briefly come up again. This can
    result in problems e.g. with cpufreq driver being active as this will
    call into get_cpu_idle_time() for a cpu without initialized scheduler
    data.
    
    Fix that by letting get_cpu_idle_time() deal with this case. Drop a
    redundant check in exchange.
    
    Fixes: 132cbe8f35632fb2 ("sched: fix get_cpu_idle_time() with core scheduling")
    Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Dario Faggioli <dfaggioli@suse.com>

commit 475715d65a1084fd38c5baa12c18d1e2f5f74ea0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 19 13:37:42 2021 +0200

    Arm: relax iomem_access_permitted() check
    
    Ranges checked by iomem_access_permitted() are inclusive; to permit a
    mapping there's no need for access to also have been granted for the
    subsequent page.
    
    Fixes: 80f9c3167084 ("xen/arm: acpi: Map MMIO on fault in stage-2 page table for the hardware domain")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit dd635cebd1eefc7f90bbe3d5df2524a2a3a94f88
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Aug 19 13:36:54 2021 +0200

    x86: mark compat hypercall regs clobbering for intended fall-through
    
    Oddly enough in the original report Coverity only complained about the
    native hypercall related switch() statements. Now that it has seen those
    fixed, it complains about (only HVM) compat ones. Hence the CIDs below
    are all for the HVM side of things, yet while at it take care of the PV
    side as well.
    
    Coverity-ID: 1487105, 1487106, 1487107, 1487108, 1487109.
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 517a90d1ca09ce00e50d46ac25566cc3bd2eb34d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 18 09:44:14 2021 +0200

    VT-d: Tylersburg errata apply to further steppings
    
    While for 5500 and 5520 chipsets only B3 and C2 are mentioned in the
    spec update, X58's also mentions B2, and searching the internet suggests
    systems with this stepping are actually in use. Even worse, for X58
    erratum #69 is marked applicable even to C2. Split the check to cover
    all applicable steppings and to also report applicable errata numbers in
    the log message. The splitting requires using the DMI port instead of
    the System Management Registers device, but that's then in line (also
    revision checking wise) with the spec updates.
    
    Fixes: 6890cebc6a98 ("VT-d: deal with 5500/5520/X58 errata")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit 6b1ca51b1a91d002636518afe4a8a50ba7212495
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 18 09:40:08 2021 +0200

    x86/PV: assert page state in mark_pv_pt_pages_rdonly()
    
    About every time I look at dom0_construct_pv()'s "calculation" of
    nr_pt_pages I question (myself) whether the result is precise or merely
    an upper bound. I think it is meant to be precise, but I think we would
    be better off having some checking in place. Hence add ASSERT()s to
    verify that
    - all pages have a valid L1...Ln (currently L4) page table type and
    - no other bits are set, in particular the type refcount is still zero.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citirx.com>

commit 4c0a19991465fc19c5afa9bc3f304bae6044314e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 18 09:39:08 2021 +0200

    x86/PV: suppress unnecessary Dom0 construction output
    
    v{xenstore,console}_{start,end} can only ever be zero in PV shim
    configurations. Similarly reporting just zeros for an unmapped (or
    absent) initrd is not useful. Particularly in case video is the only
    output configured, space is scarce: Split the printk() and omit lines
    carrying no information at all.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

