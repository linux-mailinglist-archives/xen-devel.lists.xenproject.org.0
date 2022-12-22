Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C24654366
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 15:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468545.727663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8MwU-0001Z5-Lv; Thu, 22 Dec 2022 14:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468545.727663; Thu, 22 Dec 2022 14:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8MwU-0001Wq-Il; Thu, 22 Dec 2022 14:53:06 +0000
Received: by outflank-mailman (input) for mailman id 468545;
 Thu, 22 Dec 2022 14:53:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8MwS-0001Wg-Ab; Thu, 22 Dec 2022 14:53:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8MwS-0007On-80; Thu, 22 Dec 2022 14:53:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8MwR-0002lg-O6; Thu, 22 Dec 2022 14:53:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8MwR-0005m6-Ne; Thu, 22 Dec 2022 14:53:03 +0000
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
	bh=7hSehhs1UdQ0aTaxeliFxemTZ0PNqmJFlfus8EWRyjE=; b=AApeqxcmFjoPbI+WMoOmEnunBY
	NMZKmSO7g0YTOiKb+4xj+k362vUiVd178tfX20GUHlhm7VI40Du2nxtFT+ROVkT0jNyI98QIOkfjU
	nizozf1V1tV1AtG+qIXA85C7diILLEoOVp8/L3YcyzMTa3X+kUWwgHuvWxg5dnmFnoMw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175445-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 175445: FAIL
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-xl:<job status>:broken:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    linux-5.4:test-amd64-i386-pair:<job status>:broken:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:<job status>:broken:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl-credit2:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:heisenbug
    linux-5.4:test-amd64-i386-examine:host-install:broken:heisenbug
    linux-5.4:test-amd64-i386-pair:host-install/dst_host(7):broken:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
    linux-5.4:test-arm64-arm64-examine:reboot:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=851c2b5fb7936d54e1147f76f88e2675f9f82b52
X-Osstest-Versions-That:
    linux=66bb2e2b24ce52819a7070d3a3255726cb946b69
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Dec 2022 14:53:03 +0000

flight 175445 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175445/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>     broken in 175407
 test-amd64-amd64-xl-credit2     <job status>                 broken  in 175407
 test-amd64-i386-qemuu-rhel6hvm-intel    <job status>          broken in 175407
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow <job status> broken in 175433
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>     broken in 175433
 test-amd64-amd64-xl             <job status>                 broken  in 175433
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>          broken in 175433
 test-amd64-i386-pair            <job status>                 broken  in 175433
 test-amd64-i386-xl-qemuu-ws16-amd64    <job status>           broken in 175433

Tests which are failing intermittently (not blocking):
 test-amd64-i386-qemuu-rhel6hvm-intel 5 host-install(5) broken in 175407 pass in 175445
 test-amd64-amd64-xl-credit2  5 host-install(5) broken in 175407 pass in 175445
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken in 175407 pass in 175445
 test-amd64-amd64-xl          5 host-install(5) broken in 175433 pass in 175445
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken in 175433 pass in 175445
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken in 175433 pass in 175445
 test-amd64-i386-xl-qemuu-ws16-amd64 5 host-install(5) broken in 175433 pass in 175445
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken in 175433 pass in 175445
 test-amd64-i386-examine       5 host-install   broken in 175433 pass in 175445
 test-amd64-i386-pair 7 host-install/dst_host(7) broken in 175433 pass in 175445
 test-armhf-armhf-xl-multivcpu 14 guest-start     fail in 175407 pass in 175445
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail in 175433 pass in 175407
 test-armhf-armhf-xl-rtds     14 guest-start      fail in 175433 pass in 175445
 test-arm64-arm64-examine      8 reboot                     fail pass in 175433
 test-armhf-armhf-xl          18 guest-start/debian.repeat  fail pass in 175433
 test-armhf-armhf-xl-credit1  14 guest-start                fail pass in 175433
 test-armhf-armhf-xl-vhd      13 guest-start                fail pass in 175433

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail blocked in 175197
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail in 175407 like 175197
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 175433 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 175433 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 175433 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 175433 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175197
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175197
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat    fail like 175197
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175197
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175197
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 175197
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 175197
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175197
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175197
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175197
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175197
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175197
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175197
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175197
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                851c2b5fb7936d54e1147f76f88e2675f9f82b52
baseline version:
 linux                66bb2e2b24ce52819a7070d3a3255726cb946b69

Last test of basis   175197  2022-12-14 10:43:17 Z    8 days
Testing same since   175407  2022-12-19 11:42:26 Z    3 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexei Starovoitov <ast@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Heiko Schocher <hs@denx.de>
  Hulk Robot <hulkrobot@huawei.com>
  Jakub Kicinski <kuba@kernel.org>
  Jialiang Wang <wangjialiang0806@163.com>
  Jon Hunter <jonathanh@nvidia.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Colitti <lorenzo@google.com>
  Maciej Żenczykowski <maze@google.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Ricardo Ribalda <ribalda@chromium.org>
  Samuel Mendoza-Jonas <samjonas@amazon.com>
  Sasha Levin <sashal@kernel.org>
  Shiwei Cui <cuishw@inspur.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <simon.horman@corigine.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Yasushi SHOJI <yashi@spacecubics.com>
  Yasushi SHOJI <yasushi.shoji@gmail.com>

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
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     fail    
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
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
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

broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-i386-pair broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-i386-qemuu-rhel6hvm-intel broken

Not pushing.

(No revision log; it would be 410 lines long.)

