Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D761D65211C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 14:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467010.726002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7cEZ-0002Ie-Oq; Tue, 20 Dec 2022 13:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467010.726002; Tue, 20 Dec 2022 13:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7cEZ-0002FP-L0; Tue, 20 Dec 2022 13:00:39 +0000
Received: by outflank-mailman (input) for mailman id 467010;
 Tue, 20 Dec 2022 13:00:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7cEX-0002FF-WC; Tue, 20 Dec 2022 13:00:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7cEX-0000Ci-Ta; Tue, 20 Dec 2022 13:00:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7cEX-0005ts-Cb; Tue, 20 Dec 2022 13:00:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p7cEX-0003KH-C7; Tue, 20 Dec 2022 13:00:37 +0000
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
	bh=803hN7cd0/M7tkHRPpp1ba0j4Xj3MZqFq7kA31GpaBg=; b=eSrL+/pgyTEJf/cMWBZQ5x37td
	00DEIn8fQJEk8BGnMl193bKfn3O4ahIg+6yL/2p+DFqTT5zkZsfxs18dVIrSHeZCnd3K10V8otAD0
	isymDjcLzlhefk3WXnzdzpoeFzmQCq6FaNoXTNCEm9j8GM1laQiohtKEHYq60Cl8aqKA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175411-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 175411: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-credit2:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-pair:host-install/dst_host(7):broken:regression
    linux-linus:test-amd64-amd64-xl-shadow:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    linux-linus:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine-uefi:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine-bios:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-pygrub:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-seattle:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=aeba12b26c79fc35e07e511f692a8907037d95da
X-Osstest-Versions-That:
    linux=9d84bb40bcb30a7fa16f33baa967aeb9953dda78
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Dec 2022 13:00:37 +0000

flight 175411 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175411/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken REGR. vs. 173462
 test-amd64-amd64-xl-credit2   5 host-install(5)        broken REGR. vs. 173462
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken REGR. vs. 173462
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 173462
 test-amd64-amd64-pair       7 host-install/dst_host(7) broken REGR. vs. 173462
 test-amd64-amd64-xl-shadow    5 host-install(5)        broken REGR. vs. 173462
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken REGR. vs. 173462
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 173462
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 173462
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-qemuu-nested-amd  8 xen-boot            fail REGR. vs. 173462
 test-amd64-amd64-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 173462
 test-amd64-amd64-xl-pvhv2-amd  8 xen-boot                fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 173462
 test-amd64-amd64-freebsd11-amd64  8 xen-boot             fail REGR. vs. 173462
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 173462
 test-amd64-amd64-xl-multivcpu  8 xen-boot                fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 173462
 test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 173462
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 173462
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 173462
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl           8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-ovmf-amd64  8 xen-boot         fail REGR. vs. 173462
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 173462
 test-amd64-amd64-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 173462
 test-amd64-amd64-examine-bios  8 reboot                  fail REGR. vs. 173462
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 173462
 test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 173462
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-libvirt-qcow2  8 xen-boot               fail REGR. vs. 173462
 test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 173462
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-arndale   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. 173462

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 173462

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                aeba12b26c79fc35e07e511f692a8907037d95da
baseline version:
 linux                9d84bb40bcb30a7fa16f33baa967aeb9953dda78

Last test of basis   173462  2022-10-07 18:41:45 Z   73 days
Failing since        173470  2022-10-08 06:21:34 Z   73 days  149 attempts
Testing same since   175411  2022-12-19 18:14:17 Z    0 days    1 attempts

------------------------------------------------------------
3164 people touched revisions under test,
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
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        broken  
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   broken  
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

broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-pair broken
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)

Not pushing.

(No revision log; it would be 475347 lines long.)

