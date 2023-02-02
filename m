Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ACD6874B0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 05:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488530.756650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNRbU-0002kz-4o; Thu, 02 Feb 2023 04:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488530.756650; Thu, 02 Feb 2023 04:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNRbU-0002jG-1F; Thu, 02 Feb 2023 04:53:44 +0000
Received: by outflank-mailman (input) for mailman id 488530;
 Thu, 02 Feb 2023 04:53:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNRbT-0002j6-2z; Thu, 02 Feb 2023 04:53:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNRbS-0007TA-Qs; Thu, 02 Feb 2023 04:53:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pNRbS-0006yt-CJ; Thu, 02 Feb 2023 04:53:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pNRbS-0003BL-Bq; Thu, 02 Feb 2023 04:53:42 +0000
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
	bh=TvGuvfNXlu/UrnPQMf46wBYjYLh/Cu0MJlpUv7sOzgE=; b=HKlScRE3Lz6CUWj8H8yqgd9LJM
	qiffhfkm7/+NpK10eIJCC9n8m7bH5mhsSQlsA8Iq26lwI2RTaJ9BgrJFCf8a1i4dllBqY/e1AkKJe
	6T9xT1mB/gZT1B2MeLnaDfHx5N5UkRxMzhKYKH141vLDOfgC6dcJgoL+X6rTQqXA6jYg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176311-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 176311: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-unstable:build-armhf:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-migrupgrade:<job status>:broken:regression
    xen-unstable:build-armhf:host-install(4):broken:regression
    xen-unstable:test-amd64-i386-libvirt-pair:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-unstable:build-arm64-pvops:kernel-build:fail:regression
    xen-unstable:build-armhf:syslog-server:running:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-i386-libvirt-pair:host-install/src_host(6):broken:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:heisenbug
    xen-unstable:test-amd64-amd64-examine:host-install:broken:heisenbug
    xen-unstable:test-amd64-amd64-migrupgrade:host-install/dst_host(7):broken:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:xen-install:fail:heisenbug
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:host-ping-check-native:fail:heisenbug
    xen-unstable:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:heisenbug
    xen-unstable:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-localmigrate/x10:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start.2:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:xen-install:fail:heisenbug
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:build-armhf:capture-logs:broken:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=10b80ee5588e8928b266dea02a5e99d098bd227a
X-Osstest-Versions-That:
    xen=f588e7b7cb70800533aaa8a2a9d7a4b32d10b363
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Feb 2023 04:53:42 +0000

flight 176311 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176311/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <job status>         broken
 build-armhf                     <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 175994
 test-amd64-i386-libvirt-pair    <job status>                 broken  in 176268
 test-amd64-amd64-xl-pvhv2-intel    <job status>               broken in 176268
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>           broken in 176268
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>     broken in 176284
 build-arm64-pvops             6 kernel-build   fail in 176266 REGR. vs. 175994
 build-armhf                   3 syslog-server                running

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64 5 host-install(5) broken in 176268 pass in 176311
 test-amd64-amd64-xl-pvhv2-intel 5 host-install(5) broken in 176268 pass in 176311
 test-amd64-i386-libvirt-pair 6 host-install/src_host(6) broken in 176268 pass in 176311
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken in 176284 pass in 176311
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken pass in 176277
 test-amd64-amd64-examine      5 host-install             broken pass in 176277
 test-amd64-amd64-migrupgrade  7 host-install/dst_host(7) broken pass in 176297
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail in 176268 pass in 176266
 test-amd64-i386-xl-qemut-debianhvm-amd64 7 xen-install fail in 176268 pass in 176311
 test-amd64-i386-qemuu-rhel6hvm-amd 7 xen-install fail in 176268 pass in 176311
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 6 host-ping-check-native fail in 176277 pass in 176268
 test-amd64-i386-libvirt-pair 10 xen-install/src_host fail in 176277 pass in 176311
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host fail in 176277 pass in 176311
 test-amd64-i386-xl-qemuu-ovmf-amd64 18 guest-localmigrate/x10 fail in 176277 pass in 176311
 test-amd64-i386-xl-vhd 21 guest-start/debian.repeat fail in 176277 pass in 176311
 test-amd64-amd64-libvirt-vhd 20 guest-start.2    fail in 176284 pass in 176297
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail in 176297 pass in 176311
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 176284
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat  fail pass in 176297

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 176266 n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)           blocked in 176266 n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 build-armhf                   5 capture-logs          broken blocked in 175994
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install fail in 176284 like 175994
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175987
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175987
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175994
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175994
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175994
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175994
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175994
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175994
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175994
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle   3 hosts-allocate           starved in 176277 n/a

version targeted for testing:
 xen                  10b80ee5588e8928b266dea02a5e99d098bd227a
baseline version:
 xen                  f588e7b7cb70800533aaa8a2a9d7a4b32d10b363

Last test of basis   175994  2023-01-20 08:38:32 Z   12 days
Failing since        176003  2023-01-20 17:40:27 Z   12 days   24 attempts
Testing same since   176222  2023-01-26 22:13:29 Z    6 days   10 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Cooper <andrew.cooper@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Bobby Eshleman <bobby.eshleman@gmail.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  George Dunlap <george.dunlap@cloud.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  broken  
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
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
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              broken  
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      blocked 
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

broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job build-armhf broken
broken-job test-amd64-amd64-migrupgrade broken
broken-step build-armhf capture-logs
broken-step test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step build-armhf host-install(4)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(7)
broken-step test-amd64-amd64-examine host-install
broken-job build-armhf broken
broken-job test-amd64-i386-libvirt-pair broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job build-armhf broken
broken-job build-armhf broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job build-armhf broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow broken
broken-job build-armhf broken
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken

Not pushing.

(No revision log; it would be 1225 lines long.)

