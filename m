Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE636BBC8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 00:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117926.223851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb9yL-0006oZ-8J; Mon, 26 Apr 2021 22:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117926.223851; Mon, 26 Apr 2021 22:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb9yL-0006oA-52; Mon, 26 Apr 2021 22:44:57 +0000
Received: by outflank-mailman (input) for mailman id 117926;
 Mon, 26 Apr 2021 22:44:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lb9yJ-0006o2-6D; Mon, 26 Apr 2021 22:44:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lb9yI-0002Kk-QM; Mon, 26 Apr 2021 22:44:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lb9yI-0001rd-Eb; Mon, 26 Apr 2021 22:44:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lb9yI-0007Xx-E6; Mon, 26 Apr 2021 22:44:54 +0000
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
	bh=cTP4AuBrAMe/wmWakjP0RYab6kMKjmgLiRh9srqW+eU=; b=rUB87Ospumm9Ja48xeod27o+tx
	HTJQmrzqqpTW34QuW60NcE3v5tx/hr/vejMeEiSe2FsA49MTxPnUmGePwVH//6GTm/7MI4wEc9iqa
	K4+q2GexPTigTKAp34aKCWJELNmzrRK1D+3CgZzzdDyxB0a4I4NByeimlFwO3rgeQOFQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161464-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 161464: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:test-armhf-armhf-xl:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-i386:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-saverestore:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:debian-install:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-multivcpu:debian-install:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-arndale:debian-install:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-vhd:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=ffa090bc56e73e287a63261e70ac02c0970be61a
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Apr 2021 22:44:54 +0000

flight 161464 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161464/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64 16 guest-saverestore fail REGR. vs. 152631
 test-amd64-i386-libvirt      14 guest-start              fail REGR. vs. 152631
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 152631
 test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. vs. 152631
 test-amd64-amd64-qemuu-freebsd12-amd64 16 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 152631
 test-amd64-i386-freebsd10-i386 16 guest-saverestore      fail REGR. vs. 152631
 test-amd64-i386-freebsd10-amd64 16 guest-saverestore     fail REGR. vs. 152631
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 152631
 test-amd64-i386-libvirt-pair 25 guest-start/debian       fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-win7-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-qemuu-nested-intel 20 debian-hvm-install/l1/l2 fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 15 guest-saverestore fail REGR. vs. 152631
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-win7-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ws16-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ws16-amd64 15 guest-saverestore fail REGR. vs. 152631

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-rtds     12 debian-install             fail pass in 161455
 test-armhf-armhf-xl-multivcpu 12 debian-install            fail pass in 161455
 test-armhf-armhf-xl-arndale  12 debian-install             fail pass in 161455

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd       5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-credit1   5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-credit2   5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-cubietruck  5 host-install(5)     broken blocked in 152631
 test-armhf-armhf-xl           5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 161455 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 161455 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 161455 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 161455 never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check fail in 161455 never pass
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 161455 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 161455 never pass
 test-armhf-armhf-xl         15 migrate-support-check fail in 161455 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 161455 never pass
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152631
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152631
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                ffa090bc56e73e287a63261e70ac02c0970be61a
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z  249 days
Failing since        152659  2020-08-21 14:07:39 Z  248 days  457 attempts
Testing same since   161419  2021-04-24 00:07:02 Z    2 days    5 attempts

------------------------------------------------------------
478 people touched revisions under test,
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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          broken  
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      broken  


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

broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-xl-cubietruck host-install(5)
broken-step test-armhf-armhf-xl host-install(5)

Not pushing.

(No revision log; it would be 143011 lines long.)

