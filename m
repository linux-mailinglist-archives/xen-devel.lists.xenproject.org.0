Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93025312F62
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82736.152946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9441-0001qU-2T; Mon, 08 Feb 2021 10:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82736.152946; Mon, 08 Feb 2021 10:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9440-0001pV-Pt; Mon, 08 Feb 2021 10:46:40 +0000
Received: by outflank-mailman (input) for mailman id 82736;
 Mon, 08 Feb 2021 10:46:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943y-0001o8-Fm; Mon, 08 Feb 2021 10:46:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943y-0001cm-Al; Mon, 08 Feb 2021 10:46:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943y-0006ra-1J; Mon, 08 Feb 2021 10:46:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l943y-00007b-0r; Mon, 08 Feb 2021 10:46:38 +0000
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
	bh=CYNyUjvslyMzMzQT1dhpKjVdVSPHiZvDjHNqjaTY37Q=; b=BXxYEL1u5GTY3t1PhM+OmMc38Q
	bgFijvf6Zimff+oe+DsFwF09CQdS175Ju8r0ganf9vj+2tKCQBgXhzM9RHNzlA14yYVbWitmswiKF
	i2SKKfTHQ7S4ifDfPmGHp0FwasWt+jbbSdjES0mgCVsDu1szZ4hXjEt4lpI/toIKFrqs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159111-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 159111: trouble: blocked/broken/preparing/queued/running
X-Osstest-Failures:
    xen-4.12-testing:build-amd64-prev:<job status>:broken:regression
    xen-4.12-testing:build-amd64-xsm:<job status>:broken:regression
    xen-4.12-testing:build-arm64:<job status>:broken:regression
    xen-4.12-testing:build-arm64-pvops:<job status>:broken:regression
    xen-4.12-testing:build-arm64-xsm:<job status>:broken:regression
    xen-4.12-testing:build-armhf:<job status>:broken:regression
    xen-4.12-testing:build-armhf-pvops:<job status>:broken:regression
    xen-4.12-testing:build-i386:<job status>:broken:regression
    xen-4.12-testing:build-i386-prev:<job status>:broken:regression
    xen-4.12-testing:build-i386-pvops:<job status>:broken:regression
    xen-4.12-testing:build-i386-xsm:<job status>:broken:regression
    xen-4.12-testing:build-i386-pvops:host-install(4):broken:regression
    xen-4.12-testing:build-i386-prev:host-install(4):broken:regression
    xen-4.12-testing:build-i386-xsm:host-install(4):broken:regression
    xen-4.12-testing:build-i386:host-install(4):broken:regression
    xen-4.12-testing:build-arm64:host-install(4):broken:regression
    xen-4.12-testing:build-arm64-pvops:host-install(4):broken:regression
    xen-4.12-testing:build-arm64-xsm:host-install(4):broken:regression
    xen-4.12-testing:build-amd64-xsm:host-install(4):broken:regression
    xen-4.12-testing:build-armhf-pvops:host-install(4):broken:regression
    xen-4.12-testing:build-amd64-prev:host-install(4):broken:regression
    xen-4.12-testing:build-armhf:host-install(4):broken:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-xtf-amd64-amd64-1:<none executed>:queued:regression
    xen-4.12-testing:test-xtf-amd64-amd64-2:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-4.12-testing:build-amd64-libvirt:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-pvhv2-amd:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-multivcpu:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-amd64-pvgrub:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-i386-pvgrub:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-libvirt:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-vhd:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-xl:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-livepatch:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-intel:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-migrupgrade:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-pair:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-pygrub:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-amd64-qemuu-freebsd12-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-raw:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-libvirt:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-livepatch:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-migrupgrade:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-pair:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-4.12-testing:test-xtf-amd64-amd64-3:<none executed>:queued:regression
    xen-4.12-testing:test-xtf-amd64-amd64-4:<none executed>:queued:regression
    xen-4.12-testing:test-xtf-amd64-amd64-5:<none executed>:queued:regression
    xen-4.12-testing:build-amd64:hosts-allocate:running:regression
    xen-4.12-testing:build-amd64-pvops:hosts-allocate:running:regression
    xen-4.12-testing:build-amd64-xtf:host-install(4):running:regression
    xen-4.12-testing:build-amd64-xtf:syslog-server:running:regression
    xen-4.12-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.12-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.12-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=8d26cdd3b66ab86d560dacd763d76ff3da95723e
X-Osstest-Versions-That:
    xen=cce7cbd986c122a86582ff3775b6b559d877407c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 10:46:38 +0000

flight 159111 xen-4.12-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159111/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-prev                <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-prev                 <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 158556
 build-i386-prev               4 host-install(4)        broken REGR. vs. 158556
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 158556
 build-i386                    4 host-install(4)        broken REGR. vs. 158556
 build-arm64                   4 host-install(4)        broken REGR. vs. 158556
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 158556
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 158556
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 158556
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 158556
 build-amd64-prev              4 host-install(4)        broken REGR. vs. 158556
 build-armhf                   4 host-install(4)        broken REGR. vs. 158556
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-xtf-amd64-amd64-1          <none executed>              queued
 test-xtf-amd64-amd64-2          <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict   <none executed> queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <none executed>     queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qemut-ws16-amd64    <none executed>              queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm   <none executed> queued
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              queued
 test-amd64-amd64-xl-multivcpu    <none executed>              queued
 test-amd64-amd64-amd64-pvgrub    <none executed>              queued
 test-amd64-amd64-i386-pvgrub    <none executed>              queued
 test-amd64-amd64-xl-credit2     <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-xl-credit1     <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-libvirt-vhd    <none executed>              queued
 test-amd64-amd64-xl             <none executed>              queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-livepatch      <none executed>              queued
 test-amd64-amd64-qemuu-nested-intel    <none executed>              queued
 test-amd64-amd64-migrupgrade    <none executed>              queued
 test-amd64-amd64-pair           <none executed>              queued
 test-amd64-amd64-qemuu-nested-amd    <none executed>              queued
 test-amd64-amd64-pygrub         <none executed>              queued
 test-amd64-amd64-qemuu-freebsd11-amd64    <none executed>              queued
 test-amd64-amd64-qemuu-freebsd12-amd64    <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-livepatch       <none executed>              queued
 test-amd64-i386-migrupgrade     <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-xtf-amd64-amd64-3          <none executed>              queued
 test-xtf-amd64-amd64-4          <none executed>              queued
 test-xtf-amd64-amd64-5          <none executed>              queued
 build-amd64                   2 hosts-allocate               running
 build-amd64-pvops             2 hosts-allocate               running
 build-amd64-xtf               4 host-install(4)              running
 build-amd64-xtf               3 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a

version targeted for testing:
 xen                  8d26cdd3b66ab86d560dacd763d76ff3da95723e
baseline version:
 xen                  cce7cbd986c122a86582ff3775b6b559d877407c

Last test of basis   158556  2021-01-21 15:37:26 Z   17 days
Failing since        159017  2021-02-04 15:06:13 Z    3 days    3 attempts
Testing same since   159052  2021-02-05 18:27:22 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              running 
 build-amd64                                                  preparing
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             broken  
 build-i386-prev                                              broken  
 build-amd64-pvops                                            preparing
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-xtf-amd64-amd64-1                                       queued  
 test-xtf-amd64-amd64-2                                       queued  
 test-xtf-amd64-amd64-3                                       queued  
 test-xtf-amd64-amd64-4                                       queued  
 test-xtf-amd64-amd64-5                                       queued  
 test-amd64-amd64-xl                                          queued  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        queued  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 queued  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            queued  
 test-amd64-amd64-xl-pvhv2-amd                                queued  
 test-amd64-i386-qemut-rhel6hvm-amd                           queued  
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  queued  
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        queued  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          queued  
 test-amd64-amd64-xl-pvhv2-intel                              queued  
 test-amd64-i386-qemut-rhel6hvm-intel                         queued  
 test-amd64-i386-qemuu-rhel6hvm-intel                         queued  
 test-amd64-amd64-libvirt                                     queued  
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-livepatch                                   queued  
 test-amd64-i386-livepatch                                    queued  
 test-amd64-amd64-migrupgrade                                 queued  
 test-amd64-i386-migrupgrade                                  queued  
 test-amd64-amd64-xl-multivcpu                                queued  
 test-armhf-armhf-xl-multivcpu                                blocked 
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
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       queued  
 test-amd64-amd64-xl-rtds                                     queued  
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 queued  
 test-armhf-armhf-xl-vhd                                      blocked 


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
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-xtf-amd64-amd64-1 queued
broken-job test-xtf-amd64-amd64-2 queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-amd64-xl-qemut-win7-amd64 queued
broken-job build-amd64-prev broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job build-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm queued
broken-job build-arm64 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 queued
broken-job build-arm64-pvops broken
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job test-amd64-amd64-xl-pvshim queued
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job build-i386-prev broken
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-multivcpu queued
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub queued
broken-job test-amd64-amd64-i386-pvgrub queued
broken-job test-amd64-amd64-xl-credit2 queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-xl-credit1 queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-libvirt-vhd queued
broken-job test-amd64-amd64-xl queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-livepatch queued
broken-job test-amd64-amd64-qemuu-nested-intel queued
broken-job test-amd64-amd64-migrupgrade queued
broken-job test-amd64-amd64-pair queued
broken-job test-amd64-amd64-qemuu-nested-amd queued
broken-job test-amd64-amd64-pygrub queued
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 queued
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-livepatch queued
broken-job test-amd64-i386-migrupgrade queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-xtf-amd64-amd64-3 queued
broken-job test-xtf-amd64-amd64-4 queued
broken-job test-xtf-amd64-amd64-5 queued
broken-step build-i386-pvops host-install(4)
broken-step build-i386-prev host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-amd64-prev host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 8d26cdd3b66ab86d560dacd763d76ff3da95723e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Feb 5 08:52:54 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again, part 2)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f1f322610718c40680ac09e66f6c82e69c78ba3a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 4 15:39:45 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Reported-by: James Dingwall <james@dingwall.me.uk>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

