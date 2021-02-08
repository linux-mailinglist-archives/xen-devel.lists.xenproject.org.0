Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51910312F58
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82723.152854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943L-0001Gn-Rg; Mon, 08 Feb 2021 10:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82723.152854; Mon, 08 Feb 2021 10:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943L-0001GN-No; Mon, 08 Feb 2021 10:45:59 +0000
Received: by outflank-mailman (input) for mailman id 82723;
 Mon, 08 Feb 2021 10:45:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943K-0001GD-O0; Mon, 08 Feb 2021 10:45:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943K-0001bp-Fb; Mon, 08 Feb 2021 10:45:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943K-0006qb-88; Mon, 08 Feb 2021 10:45:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l943K-0007tg-7b; Mon, 08 Feb 2021 10:45:58 +0000
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
	bh=sA9iqbUvM6kyrc8rtghpEd2UgLf27JQHWh1ymys++Ig=; b=DnGIyJu9ulcbxs8IU6OZNlfo04
	xqUyUa96QyfV39uVGsXZbw1+oei5pDnZc2a86v+C4m66C92DKUTl7F2ZXpyDOsmMZpH3zPkrU67zY
	4QNT3bVmiWjojXMwjtH0UGhUAjLQw1QJpbdTDDAOPQc0YfGekUav6bCBnyJQRkt/WXLg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159113-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 159113: trouble: blocked/broken/preparing/queued
X-Osstest-Failures:
    linux-5.4:build-amd64-xsm:<job status>:broken:regression
    linux-5.4:build-arm64:<job status>:broken:regression
    linux-5.4:build-arm64-pvops:<job status>:broken:regression
    linux-5.4:build-arm64-xsm:<job status>:broken:regression
    linux-5.4:build-armhf:<job status>:broken:regression
    linux-5.4:build-i386:<job status>:broken:regression
    linux-5.4:build-i386-pvops:<job status>:broken:regression
    linux-5.4:build-i386-xsm:<job status>:broken:regression
    linux-5.4:build-i386-pvops:host-install(4):broken:regression
    linux-5.4:build-i386-xsm:host-install(4):broken:regression
    linux-5.4:build-i386:host-install(4):broken:regression
    linux-5.4:build-arm64-xsm:host-install(4):broken:regression
    linux-5.4:build-arm64-pvops:host-install(4):broken:regression
    linux-5.4:build-arm64:host-install(4):broken:regression
    linux-5.4:build-amd64-xsm:host-install(4):broken:regression
    linux-5.4:build-armhf:host-install(4):broken:regression
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-raw:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-examine:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-libvirt:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-libvirt-raw:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl-cubietruck:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
    linux-5.4:test-armhf-armhf-xl-vhd:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-examine:<none executed>:queued:regression
    linux-5.4:test-amd64-coresched-i386-xl:<none executed>:queued:regression
    linux-5.4:test-amd64-coresched-amd64-xl:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    linux-5.4:build-amd64-libvirt:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-amd64-pvgrub:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-examine:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-i386-pvgrub:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-amd:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-libvirt:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-multivcpu:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-libvirt-vhd:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-pair:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-pygrub:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-xl:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:<none executed>:queued:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-intel:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-libvirt:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-pair:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    linux-5.4:build-amd64-xsm:STARTING:running:regression
    linux-5.4:build-amd64:hosts-allocate:running:regression
    linux-5.4:build-amd64-pvops:hosts-allocate:running:regression
    linux-5.4:build-armhf-pvops:hosts-allocate:running:regression
    linux-5.4:build-amd64-xsm:syslog-server:running:regression
    linux-5.4:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-5.4:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-5.4:build-i386-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    linux=d4716ee8751bf8dabf5872ba008124a0979a5f94
X-Osstest-Versions-That:
    linux=a829146c3fdcf6d0b76d9c54556a223820f1f73b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 10:45:58 +0000

flight 159113 linux-5.4 running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159113/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 158387
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 158387
 build-i386                    4 host-install(4)        broken REGR. vs. 158387
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 158387
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 158387
 build-arm64                   4 host-install(4)        broken REGR. vs. 158387
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 158387
 build-armhf                   4 host-install(4)        broken REGR. vs. 158387
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-armhf-armhf-examine        <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-raw    <none executed>              queued
 test-armhf-armhf-xl             <none executed>              queued
 test-armhf-armhf-xl-arndale     <none executed>              queued
 test-armhf-armhf-xl-credit1     <none executed>              queued
 test-armhf-armhf-xl-credit2     <none executed>              queued
 test-armhf-armhf-xl-cubietruck    <none executed>              queued
 test-armhf-armhf-xl-multivcpu    <none executed>              queued
 test-armhf-armhf-xl-rtds        <none executed>              queued
 test-armhf-armhf-xl-vhd         <none executed>              queued
 test-amd64-i386-examine         <none executed>              queued
 test-amd64-coresched-i386-xl    <none executed>              queued
 test-amd64-coresched-amd64-xl    <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict   <none executed> queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <none executed>     queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm   <none executed> queued
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-amd64-pvgrub    <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-amd    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-intel    <none executed>              queued
 test-amd64-amd64-examine        <none executed>              queued
 test-amd64-amd64-i386-pvgrub    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-xl-multivcpu    <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-libvirt-vhd    <none executed>              queued
 test-amd64-amd64-xl-credit2     <none executed>              queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-pair           <none executed>              queued
 test-amd64-amd64-xl-credit1     <none executed>              queued
 test-amd64-amd64-pygrub         <none executed>              queued
 test-amd64-amd64-qemuu-freebsd11-amd64    <none executed>              queued
 test-amd64-amd64-xl             <none executed>              queued
 test-amd64-amd64-qemuu-freebsd12-amd64    <none executed>              queued
 test-amd64-amd64-qemuu-nested-amd    <none executed>              queued
 test-amd64-amd64-qemuu-nested-intel    <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 build-amd64-xsm               5 STARTING                     running
 build-amd64                   2 hosts-allocate               running
 build-amd64-pvops             2 hosts-allocate               running
 build-armhf-pvops             2 hosts-allocate               running
 build-amd64-xsm               3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a

version targeted for testing:
 linux                d4716ee8751bf8dabf5872ba008124a0979a5f94
baseline version:
 linux                a829146c3fdcf6d0b76d9c54556a223820f1f73b

Last test of basis   158387  2021-01-12 19:40:06 Z   26 days
Failing since        158473  2021-01-17 13:42:20 Z   21 days   33 attempts
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
377 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  preparing
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            preparing
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            preparing
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          queued  
 test-amd64-coresched-amd64-xl                                queued  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          queued  
 test-amd64-i386-xl                                           queued  
 test-amd64-coresched-i386-xl                                 queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        queued  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         queued  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  queued  
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       queued  
 test-amd64-amd64-qemuu-nested-amd                            queued  
 test-amd64-amd64-xl-pvhv2-amd                                queued  
 test-amd64-i386-qemut-rhel6hvm-amd                           queued  
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
 test-amd64-amd64-dom0pvh-xl-amd                              queued  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    queued  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     queued  
 test-amd64-i386-freebsd10-amd64                              queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       queued  
 test-amd64-amd64-qemuu-freebsd12-amd64                       queued  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         queued  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  
 test-amd64-amd64-xl-qemut-win7-amd64                         queued  
 test-amd64-i386-xl-qemut-win7-amd64                          queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         queued  
 test-amd64-i386-xl-qemuu-win7-amd64                          queued  
 test-amd64-amd64-xl-qemut-ws16-amd64                         queued  
 test-amd64-i386-xl-qemut-ws16-amd64                          queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         queued  
 test-amd64-i386-xl-qemuu-ws16-amd64                          queued  
 test-armhf-armhf-xl-arndale                                  queued  
 test-amd64-amd64-xl-credit1                                  queued  
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  queued  
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  queued  
 test-armhf-armhf-xl-cubietruck                               queued  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        queued  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-amd64-examine                                     queued  
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     queued  
 test-amd64-i386-examine                                      queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          queued  
 test-amd64-amd64-xl-pvhv2-intel                              queued  
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-dom0pvh-xl-intel                            queued  
 test-amd64-amd64-libvirt                                     queued  
 test-armhf-armhf-libvirt                                     queued  
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-xl-multivcpu                                queued  
 test-armhf-armhf-xl-multivcpu                                queued  
 test-amd64-amd64-pair                                        queued  
 test-amd64-i386-pair                                         queued  
 test-amd64-amd64-libvirt-pair                                queued  
 test-amd64-i386-libvirt-pair                                 queued  
 test-amd64-amd64-amd64-pvgrub                                queued  
 test-amd64-amd64-i386-pvgrub                                 queued  
 test-amd64-amd64-xl-pvshim                                   queued  
 test-amd64-i386-xl-pvshim                                    queued  
 test-amd64-amd64-pygrub                                      queued  
 test-amd64-amd64-xl-qcow2                                    queued  
 test-armhf-armhf-libvirt-raw                                 queued  
 test-amd64-i386-xl-raw                                       queued  
 test-amd64-amd64-xl-rtds                                     queued  
 test-armhf-armhf-xl-rtds                                     queued  
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 queued  
 test-armhf-armhf-xl-vhd                                      queued  


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

broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-armhf-armhf-examine queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-raw queued
broken-job test-armhf-armhf-xl queued
broken-job test-armhf-armhf-xl-arndale queued
broken-job test-armhf-armhf-xl-credit1 queued
broken-job test-armhf-armhf-xl-credit2 queued
broken-job test-armhf-armhf-xl-cubietruck queued
broken-job test-armhf-armhf-xl-multivcpu queued
broken-job test-armhf-armhf-xl-rtds queued
broken-job test-armhf-armhf-xl-vhd queued
broken-job test-amd64-i386-examine queued
broken-job test-amd64-coresched-i386-xl queued
broken-job test-amd64-coresched-amd64-xl queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job build-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 queued
broken-job build-arm64 broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 queued
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job build-armhf broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm queued
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 queued
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub queued
broken-job test-amd64-amd64-xl-pvshim queued
broken-job test-amd64-amd64-dom0pvh-xl-amd queued
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job test-amd64-amd64-dom0pvh-xl-intel queued
broken-job test-amd64-amd64-examine queued
broken-job test-amd64-amd64-i386-pvgrub queued
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-xl-multivcpu queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-libvirt-vhd queued
broken-job test-amd64-amd64-xl-credit2 queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-pair queued
broken-job test-amd64-amd64-xl-credit1 queued
broken-job test-amd64-amd64-pygrub queued
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 queued
broken-job test-amd64-amd64-xl queued
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 queued
broken-job test-amd64-amd64-qemuu-nested-amd queued
broken-job test-amd64-amd64-qemuu-nested-intel queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-step build-i386-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 11411 lines long.)

