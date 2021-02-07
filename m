Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD26831240E
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 12:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82362.152170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8iYf-0004Me-Tr; Sun, 07 Feb 2021 11:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82362.152170; Sun, 07 Feb 2021 11:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8iYf-0004M8-Pc; Sun, 07 Feb 2021 11:48:53 +0000
Received: by outflank-mailman (input) for mailman id 82362;
 Sun, 07 Feb 2021 11:48:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8iYe-0004M0-Ci; Sun, 07 Feb 2021 11:48:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8iYe-0003iB-0t; Sun, 07 Feb 2021 11:48:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8iYd-00029N-NQ; Sun, 07 Feb 2021 11:48:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l8iYd-0002Up-Mu; Sun, 07 Feb 2021 11:48:51 +0000
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
	bh=4CKTN6J+MaU3uyivWgWvkmsarlrse1lRQvcyOH1TQ8I=; b=BipdlLUrlBVRCS8hXBJFS+ZUDU
	BElypRLDiM73MC+Z6L/Aeba+zjrkD0b1ol9jv0pVht1Hm9EQf4ZnL8LSgom6CA3laOB1e31dyjgMp
	17r4TLRdt0d6Jm8FPZ8sQohPvAuOtQBwkR+PwN/cxtC+pw7T4lHjbfhRJ2C93NIPpRmM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159061-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 159061: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    linux-linus:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    linux-linus:build-i386:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    linux-linus:build-i386-pvops:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    linux-linus:build-i386-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    linux-linus:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    linux-linus:test-amd64-amd64-pair:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    linux-linus:test-amd64-amd64-pygrub:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-xl:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    linux-linus:build-i386:host-install(4):broken:regression
    linux-linus:build-i386-pvops:host-install(4):broken:regression
    linux-linus:build-i386-xsm:host-install(4):broken:regression
    linux-linus:test-amd64-amd64-examine:host-install:broken:regression
    linux-linus:test-arm64-arm64-xl:host-ping-check-xen:fail:regression
    linux-linus:test-arm64-arm64-examine:reboot:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-seattle:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:host-ping-check-xen:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    linux-linus:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-examine:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    linux-linus:build-i386-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-multivcpu:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qcow2:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-amd64-pvgrub:host-install(5):broken:nonblocking
    linux-linus:test-amd64-coresched-amd64-xl:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-credit2:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-pair:host-install/src_host(6):broken:nonblocking
    linux-linus:test-amd64-amd64-pair:host-install/dst_host(7):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-rtds:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-i386-pvgrub:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-pvshim:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-pygrub:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-credit1:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-shadow:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-xsm:host-install(5):broken:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:host-install(5):broken:nonblocking
    linux-linus:test-armhf-armhf-libvirt:host-install(5):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:host-install(5):broken:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:leak-check/basis(11):fail:nonblocking
X-Osstest-Versions-This:
    linux=1e0d27fce010b0a4a9e595506b6ede75934c31be
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Feb 2021 11:48:51 +0000

flight 159061 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159061/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemut-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>   broken
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
 build-i386                      <job status>                 broken
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 build-i386-pvops                <job status>                 broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 build-i386                    4 host-install(4)        broken REGR. vs. 152332
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 152332
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 152332
 test-amd64-amd64-examine      5 host-install           broken REGR. vs. 152332
 test-arm64-arm64-xl          10 host-ping-check-xen      fail REGR. vs. 152332
 test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 152332
 test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 152332
 test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm      10 host-ping-check-xen      fail REGR. vs. 152332
 test-armhf-armhf-xl-vhd      13 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 152332
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 152332

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)  broken blocked in 152332
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-multivcpu  5 host-install(5)      broken blocked in 152332
 test-amd64-amd64-xl-qcow2     5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken blocked in 152332
 test-armhf-armhf-xl-multivcpu  5 host-install(5)      broken blocked in 152332
 test-amd64-amd64-dom0pvh-xl-intel  5 host-install(5)  broken blocked in 152332
 test-amd64-amd64-amd64-pvgrub  5 host-install(5)      broken blocked in 152332
 test-amd64-coresched-amd64-xl  5 host-install(5)      broken blocked in 152332
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)      broken blocked in 152332
 test-amd64-amd64-xl-credit2   5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)    broken blocked in 152332
 test-amd64-amd64-libvirt      5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-pair      6 host-install/src_host(6) broken blocked in 152332
 test-amd64-amd64-pair      7 host-install/dst_host(7) broken blocked in 152332
 test-amd64-amd64-xl-rtds      5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-qemuu-nested-intel 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-i386-pvgrub  5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-qemut-win7-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-xl-pvshim    5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-pygrub       5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-libvirt-xsm  5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)    broken blocked in 152332
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken blocked in 152332
 test-amd64-amd64-xl-credit1   5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-shadow    5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl           5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken blocked in 152332
 test-amd64-amd64-libvirt-vhd  5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken blocked in 152332
 test-amd64-amd64-xl-xsm       5 host-install(5)       broken blocked in 152332
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken blocked in 152332
 test-armhf-armhf-xl-cubietruck  5 host-install(5)     broken blocked in 152332
 test-armhf-armhf-libvirt      5 host-install(5)       broken blocked in 152332
 test-armhf-armhf-xl-credit2   5 host-install(5)       broken blocked in 152332
 test-arm64-arm64-xl-credit1  11 leak-check/basis(11)    fail blocked in 152332

version targeted for testing:
 linux                1e0d27fce010b0a4a9e595506b6ede75934c31be
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  190 days
Failing since        152366  2020-08-01 20:49:34 Z  189 days  336 attempts
Testing same since   159061  2021-02-06 01:39:25 Z    1 days    1 attempts

------------------------------------------------------------
4541 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               broken  
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        broken  
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         broken  
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         broken  
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     fail    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     broken  
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                broken  
 test-amd64-amd64-i386-pvgrub                                 broken  
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      broken  
 test-amd64-amd64-xl-qcow2                                    broken  
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 broken  
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

broken-job test-armhf-armhf-libvirt broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemut-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm broken
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-multivcpu host-install(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(5)
broken-step test-amd64-amd64-amd64-pvgrub host-install(5)
broken-step test-amd64-coresched-amd64-xl host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-amd64-amd64-i386-pvgrub host-install(5)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step build-i386 host-install(4)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step build-i386-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-examine host-install
broken-step test-armhf-armhf-xl-cubietruck host-install(5)
broken-step test-armhf-armhf-libvirt host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)

Not pushing.

(No revision log; it would be 1026545 lines long.)

