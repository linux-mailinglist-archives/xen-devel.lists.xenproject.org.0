Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0174BF58
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 23:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560748.876886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIFih-0007y6-PN; Sat, 08 Jul 2023 21:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560748.876886; Sat, 08 Jul 2023 21:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIFih-0007wR-MY; Sat, 08 Jul 2023 21:43:59 +0000
Received: by outflank-mailman (input) for mailman id 560748;
 Sat, 08 Jul 2023 21:43:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qIFig-0007wH-V8; Sat, 08 Jul 2023 21:43:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qIFig-0005o4-Ir; Sat, 08 Jul 2023 21:43:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qIFig-0007ry-42; Sat, 08 Jul 2023 21:43:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qIFig-0003tb-3N; Sat, 08 Jul 2023 21:43:58 +0000
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
	bh=aaGIk+dvUj4HAOLd/Os/23N6sdw2a2X6FojwlHuXWEE=; b=AUw1SgCpuixYdpEY530V0tj/I+
	M4JDyLljZhTZ3E9Wr1/5UaqfBdzDGqp8N2tTFE8B/suZyrFm+LHLKHdyBBNE6kMYgGD8RD3Grjjj5
	i5sjvYufiOcyhpxsGmqPcsmlXPlMZ5nwx8etZkgjQ/LqCxLkX8QgV03kF9aTFkNjF6cg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181739-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 181739: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-vhd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:debian-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:debian-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:guest-start:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:guest-start:fail:regression
    linux-linus:test-amd64-amd64-examine-uefi:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine-bios:reboot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-libvirt:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-pygrub:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:host-install(5):broken:heisenbug
    linux-linus:test-amd64-amd64-qemuu-nested-amd:leak-check/basis(11):fail:heisenbug
    linux-linus:test-amd64-amd64-xl-multivcpu:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:leak-check/basis(11):fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-pygrub:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:leak-check/basis(11):fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-xsm:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-shadow:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/src_host:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:leak-check/basis(11):fail:allowable
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=8689f4f2ea561dd080118eeb05c0255ac9542905
X-Osstest-Versions-That:
    linux=6c538e1adbfc696ac4747fb10d63e704344f763d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 08 Jul 2023 21:43:58 +0000

flight 181739 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181739/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-vhd         <job status>                 broken  in 181737
 test-amd64-amd64-xl-qemut-ws16-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 180278
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 180278
 test-amd64-amd64-xl          11 leak-check/basis(11)     fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 180278
 test-amd64-amd64-freebsd11-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-debianhvm-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-multivcpu 12 debian-install          fail REGR. vs. 180278
 test-amd64-amd64-xl-credit1  12 debian-install           fail REGR. vs. 180278
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-credit2  12 debian-install           fail REGR. vs. 180278
 test-amd64-amd64-xl-pvhv2-amd 12 debian-install          fail REGR. vs. 180278
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 180278
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-vhd       8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 180278
 test-amd64-amd64-pair        12 xen-boot/src_host        fail REGR. vs. 180278
 test-amd64-amd64-pair        13 xen-boot/dst_host        fail REGR. vs. 180278
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 180278
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 180278
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 180278
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 180278
 test-arm64-arm64-xl-vhd      13 guest-start              fail REGR. vs. 180278
 test-arm64-arm64-libvirt-raw 13 guest-start              fail REGR. vs. 180278
 test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 180278
 test-amd64-amd64-examine-bios  8 reboot                  fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 11 leak-check/basis(11) fail in 181737 REGR. vs. 180278
 test-amd64-amd64-xl-shadow 11 leak-check/basis(11) fail in 181737 REGR. vs. 180278
 test-amd64-amd64-libvirt     12 debian-install fail in 181737 REGR. vs. 180278
 test-amd64-amd64-xl-xsm      12 debian-install fail in 181737 REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail in 181737 REGR. vs. 180278
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail in 181737 REGR. vs. 180278
 test-amd64-amd64-pygrub   12 debian-di-install fail in 181737 REGR. vs. 180278

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-vhd      5 host-install(5) broken in 181737 pass in 181739
 test-amd64-amd64-qemuu-nested-amd 11 leak-check/basis(11) fail in 181737 pass in 181739
 test-amd64-amd64-xl-multivcpu  8 xen-boot        fail in 181737 pass in 181739
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 8 xen-boot fail in 181737 pass in 181739
 test-amd64-amd64-xl-credit2   8 xen-boot         fail in 181737 pass in 181739
 test-amd64-amd64-xl-pvhv2-amd 11 leak-check/basis(11) fail in 181737 pass in 181739
 test-amd64-amd64-xl-qemut-debianhvm-amd64 8 xen-boot fail in 181737 pass in 181739
 test-amd64-amd64-xl-rtds      8 xen-boot         fail in 181737 pass in 181739
 test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot fail in 181737 pass in 181739
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail in 181737 pass in 181739
 test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host fail in 181737 pass in 181739
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail pass in 181737
 test-amd64-amd64-pygrub       8 xen-boot                   fail pass in 181737
 test-amd64-amd64-xl-qemuu-ovmf-amd64 11 leak-check/basis(11) fail pass in 181737
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot      fail pass in 181737
 test-amd64-amd64-xl-xsm       8 xen-boot                   fail pass in 181737
 test-amd64-amd64-xl-shadow    8 xen-boot                   fail pass in 181737
 test-amd64-amd64-libvirt      8 xen-boot                   fail pass in 181737
 test-amd64-amd64-libvirt-pair 12 xen-boot/src_host         fail pass in 181737

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     11 leak-check/basis(11)     fail REGR. vs. 180278

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd       8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl           8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 180278
 test-armhf-armhf-examine      8 reboot                       fail  like 180278
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-raw  8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-qcow2  8 xen-boot                    fail like 180278
 test-armhf-armhf-xl-rtds      8 xen-boot                     fail  like 180278
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                8689f4f2ea561dd080118eeb05c0255ac9542905
baseline version:
 linux                6c538e1adbfc696ac4747fb10d63e704344f763d

Last test of basis   180278  2023-04-16 19:41:46 Z   83 days
Failing since        180281  2023-04-17 06:24:36 Z   82 days  163 attempts
Testing same since   181737  2023-07-08 03:26:47 Z    0 days    2 attempts

------------------------------------------------------------
3728 people touched revisions under test,
not listing them all

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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      fail    


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

broken-job test-amd64-amd64-xl-vhd broken

Not pushing.

(No revision log; it would be 618053 lines long.)

