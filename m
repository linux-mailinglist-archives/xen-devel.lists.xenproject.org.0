Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1745312F63
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82738.152958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9445-0001vv-KM; Mon, 08 Feb 2021 10:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82738.152958; Mon, 08 Feb 2021 10:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9445-0001vA-Eq; Mon, 08 Feb 2021 10:46:45 +0000
Received: by outflank-mailman (input) for mailman id 82738;
 Mon, 08 Feb 2021 10:46:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9444-0001uL-0Z; Mon, 08 Feb 2021 10:46:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9443-0001cv-N0; Mon, 08 Feb 2021 10:46:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9443-0006rd-7F; Mon, 08 Feb 2021 10:46:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9443-0000Jo-6l; Mon, 08 Feb 2021 10:46:43 +0000
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
	bh=1+lwrV9Ad675bkxzIpKf+pQeP2rJvOP4PvmHmD/8KYg=; b=XPyvDtVtDVR0PW/1G3t64btkgt
	s5AUtivR3Sb1Ngsz8/j4uTogrpqd9mUivONG+OCZJTk3hmdCp1lOTm+YQM9BoLNYr0Y+zwjhhXWsm
	fEmcpZa+nS4mp2+V2w3epqkCoNCmrbjrepiWy5cK88dZ83aLbHZ9SvEZ6P0Pn28fZnbg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159123-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 159123: trouble: blocked/broken/preparing/queued/running
X-Osstest-Failures:
    xen-unstable:build-amd64-prev:<job status>:broken:regression
    xen-unstable:build-arm64:<job status>:broken:regression
    xen-unstable:build-i386:<job status>:broken:regression
    xen-unstable:build-i386-xsm:<job status>:broken:regression
    xen-unstable:build-amd64-prev:host-install(4):broken:regression
    xen-unstable:build-i386:host-install(4):broken:regression
    xen-unstable:build-i386-xsm:host-install(4):broken:regression
    xen-unstable:build-arm64:host-install(4):broken:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-raw:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-examine:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-libvirt-xsm:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-xl:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-xl-credit1:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-xl-credit2:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-xl-seattle:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-xl-thunderx:<none executed>:queued:regression
    xen-unstable:test-arm64-arm64-xl-xsm:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-examine:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-libvirt:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-libvirt-raw:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-unstable:build-amd64-libvirt:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:<none executed>:queued:regression
    xen-unstable:build-armhf-libvirt:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-multivcpu:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-amd64-pvgrub:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-examine:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-i386-pvgrub:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-vhd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-pygrub:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-livepatch:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-migrupgrade:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-pair:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-coresched-amd64-xl:<none executed>:queued:regression
    xen-unstable:test-amd64-coresched-i386-xl:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-examine:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-libvirt:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-livepatch:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-migrupgrade:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-pair:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-cubietruck:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-multivcpu:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-vhd:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-1:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-2:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-3:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-4:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-5:<none executed>:queued:regression
    xen-unstable:build-amd64:hosts-allocate:running:regression
    xen-unstable:build-amd64-pvops:hosts-allocate:running:regression
    xen-unstable:build-amd64-xsm:hosts-allocate:running:regression
    xen-unstable:build-amd64-xtf:hosts-allocate:running:regression
    xen-unstable:build-i386-prev:hosts-allocate:running:regression
    xen-unstable:build-arm64-xsm:hosts-allocate:running:regression
    xen-unstable:build-arm64-pvops:hosts-allocate:running:regression
    xen-unstable:build-armhf-pvops:hosts-allocate:running:regression
    xen-unstable:build-i386-pvops:host-install(4):running:regression
    xen-unstable:build-i386-pvops:syslog-server:running:regression
    xen-unstable:build-armhf:host-install(4):running:regression
    xen-unstable:build-armhf:syslog-server:running:regression
    xen-unstable:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:build-i386-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=ca82d3fecc93745ee17850a609ac7772bd7c8bf7
X-Osstest-Versions-That:
    xen=ff522e2e9163b27fe4d80ba55c18408f9b1f1cb7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 10:46:43 +0000

flight 159123 xen-unstable running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159123/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-prev                <job status>                 broken
 build-arm64                     <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64-prev              4 host-install(4)        broken REGR. vs. 159036
 build-i386                    4 host-install(4)        broken REGR. vs. 159036
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 159036
 build-arm64                   4 host-install(4)        broken REGR. vs. 159036
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-arm64-arm64-examine        <none executed>              queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-arm64-arm64-xl             <none executed>              queued
 test-arm64-arm64-xl-credit1     <none executed>              queued
 test-arm64-arm64-xl-credit2     <none executed>              queued
 test-arm64-arm64-xl-seattle     <none executed>              queued
 test-arm64-arm64-xl-thunderx    <none executed>              queued
 test-arm64-arm64-xl-xsm         <none executed>              queued
 test-armhf-armhf-examine        <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-raw    <none executed>              queued
 test-armhf-armhf-xl             <none executed>              queued
 test-armhf-armhf-xl-arndale     <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict   <none executed> queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <none executed>     queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm   <none executed> queued
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <none executed>         queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              queued
 build-armhf-libvirt             <none executed>              queued
 test-amd64-amd64-xl-multivcpu    <none executed>              queued
 test-amd64-amd64-xl-credit2     <none executed>              queued
 test-amd64-amd64-xl-credit1     <none executed>              queued
 test-amd64-amd64-xl             <none executed>              queued
 test-amd64-amd64-amd64-pvgrub    <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-amd    <none executed>              queued
 test-amd64-amd64-qemuu-nested-intel    <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-intel    <none executed>              queued
 test-amd64-amd64-examine        <none executed>              queued
 test-amd64-amd64-qemuu-nested-amd    <none executed>              queued
 test-amd64-amd64-i386-pvgrub    <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-qemuu-freebsd12-amd64    <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-qemuu-freebsd11-amd64    <none executed>              queued
 test-amd64-amd64-libvirt-vhd    <none executed>              queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-pygrub         <none executed>              queued
 test-amd64-amd64-livepatch      <none executed>              queued
 test-amd64-amd64-migrupgrade    <none executed>              queued
 test-amd64-amd64-pair           <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-coresched-amd64-xl    <none executed>              queued
 test-amd64-coresched-i386-xl    <none executed>              queued
 test-amd64-i386-examine         <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-livepatch       <none executed>              queued
 test-amd64-i386-migrupgrade     <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemut-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-armhf-armhf-xl-credit1     <none executed>              queued
 test-armhf-armhf-xl-credit2     <none executed>              queued
 test-armhf-armhf-xl-cubietruck    <none executed>              queued
 test-armhf-armhf-xl-multivcpu    <none executed>              queued
 test-armhf-armhf-xl-rtds        <none executed>              queued
 test-armhf-armhf-xl-vhd         <none executed>              queued
 test-xtf-amd64-amd64-1          <none executed>              queued
 test-xtf-amd64-amd64-2          <none executed>              queued
 test-xtf-amd64-amd64-3          <none executed>              queued
 test-xtf-amd64-amd64-4          <none executed>              queued
 test-xtf-amd64-amd64-5          <none executed>              queued
 build-amd64                   2 hosts-allocate               running
 build-amd64-pvops             2 hosts-allocate               running
 build-amd64-xsm               2 hosts-allocate               running
 build-amd64-xtf               2 hosts-allocate               running
 build-i386-prev               2 hosts-allocate               running
 build-arm64-xsm               2 hosts-allocate               running
 build-arm64-pvops             2 hosts-allocate               running
 build-armhf-pvops             2 hosts-allocate               running
 build-i386-pvops              4 host-install(4)              running
 build-i386-pvops              3 syslog-server                running
 build-armhf                   4 host-install(4)              running
 build-armhf                   3 syslog-server                running

Tests which did not succeed, but are not blocking:
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  ca82d3fecc93745ee17850a609ac7772bd7c8bf7
baseline version:
 xen                  ff522e2e9163b27fe4d80ba55c18408f9b1f1cb7

Last test of basis   159036  2021-02-05 08:46:54 Z    3 days
Testing same since   159077  2021-02-06 11:11:30 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Michał Leszczyński <michal.leszczynski@cert.pl>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

jobs:
 build-amd64-xsm                                              preparing
 build-arm64-xsm                                              preparing
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              preparing
 build-amd64                                                  preparing
 build-arm64                                                  broken  
 build-armhf                                                  running 
 build-i386                                                   broken  
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          queued  
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             broken  
 build-i386-prev                                              preparing
 build-amd64-pvops                                            preparing
 build-arm64-pvops                                            preparing
 build-armhf-pvops                                            preparing
 build-i386-pvops                                             running 
 test-xtf-amd64-amd64-1                                       queued  
 test-xtf-amd64-amd64-2                                       queued  
 test-xtf-amd64-amd64-3                                       queued  
 test-xtf-amd64-amd64-4                                       queued  
 test-xtf-amd64-amd64-5                                       queued  
 test-amd64-amd64-xl                                          queued  
 test-amd64-coresched-amd64-xl                                queued  
 test-arm64-arm64-xl                                          queued  
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
 test-arm64-arm64-libvirt-xsm                                 queued  
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      queued  
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
 test-arm64-arm64-xl-credit1                                  queued  
 test-armhf-armhf-xl-credit1                                  queued  
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  queued  
 test-armhf-armhf-xl-credit2                                  queued  
 test-armhf-armhf-xl-cubietruck                               queued  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        queued  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         queued  
 test-amd64-amd64-examine                                     queued  
 test-arm64-arm64-examine                                     queued  
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
 test-amd64-amd64-livepatch                                   queued  
 test-amd64-i386-livepatch                                    queued  
 test-amd64-amd64-migrupgrade                                 queued  
 test-amd64-i386-migrupgrade                                  queued  
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
 test-arm64-arm64-xl-seattle                                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 queued  
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

broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-arm64-arm64-examine queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-arm64-arm64-xl queued
broken-job test-arm64-arm64-xl-credit1 queued
broken-job test-arm64-arm64-xl-credit2 queued
broken-job test-arm64-arm64-xl-seattle queued
broken-job test-arm64-arm64-xl-thunderx queued
broken-job test-arm64-arm64-xl-xsm queued
broken-job test-armhf-armhf-examine queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-raw queued
broken-job test-armhf-armhf-xl queued
broken-job test-armhf-armhf-xl-arndale queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-amd64-xl-qemut-ws16-amd64 queued
broken-job test-amd64-amd64-xl-qemut-win7-amd64 queued
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 queued
broken-job build-amd64-prev broken
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job test-amd64-amd64-xl-pvshim queued
broken-job build-arm64 broken
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job build-armhf-libvirt queued
broken-job test-amd64-amd64-xl-multivcpu queued
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-credit2 queued
broken-job test-amd64-amd64-xl-credit1 queued
broken-job test-amd64-amd64-xl queued
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub queued
broken-job test-amd64-amd64-dom0pvh-xl-amd queued
broken-job test-amd64-amd64-qemuu-nested-intel queued
broken-job test-amd64-amd64-dom0pvh-xl-intel queued
broken-job test-amd64-amd64-examine queued
broken-job test-amd64-amd64-qemuu-nested-amd queued
broken-job test-amd64-amd64-i386-pvgrub queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 queued
broken-job test-amd64-amd64-libvirt-vhd queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-pygrub queued
broken-job test-amd64-amd64-livepatch queued
broken-job test-amd64-amd64-migrupgrade queued
broken-job test-amd64-amd64-pair queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-coresched-amd64-xl queued
broken-job test-amd64-coresched-i386-xl queued
broken-job test-amd64-i386-examine queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-livepatch queued
broken-job test-amd64-i386-migrupgrade queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-qemut-rhel6hvm-amd queued
broken-job test-amd64-i386-qemut-rhel6hvm-intel queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-armhf-armhf-xl-credit1 queued
broken-job test-armhf-armhf-xl-credit2 queued
broken-job test-armhf-armhf-xl-cubietruck queued
broken-job test-armhf-armhf-xl-multivcpu queued
broken-job test-armhf-armhf-xl-rtds queued
broken-job test-armhf-armhf-xl-vhd queued
broken-job test-xtf-amd64-amd64-1 queued
broken-job test-xtf-amd64-amd64-2 queued
broken-job test-xtf-amd64-amd64-3 queued
broken-job test-xtf-amd64-amd64-4 queued
broken-job test-xtf-amd64-amd64-5 queued
broken-step build-amd64-prev host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-arm64 host-install(4)

Not pushing.

------------------------------------------------------------
commit ca82d3fecc93745ee17850a609ac7772bd7c8bf7
Author: Tamas K Lengyel <tamas.lengyel@intel.com>
Date:   Sat Jan 30 08:36:37 2021 -0500

    x86/vm_event: add response flag to reset vmtrace buffer
    
    Allow resetting the vmtrace buffer in response to a vm_event. This can be used
    to optimize a use-case where detecting a looped vmtrace buffer is important.
    
    Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit c5866ab93167a73a8d4d85b844edf4aa364a1aaa
Author: Tamas K Lengyel <tamas.lengyel@intel.com>
Date:   Mon Jan 18 12:46:37 2021 -0500

    x86/vm_event: Carry the vmtrace buffer position in vm_event
    
    Add vmtrace_pos field to x86 regs in vm_event. Initialized to ~0 if
    vmtrace is not in use.
    
    Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 9744611991a042e9aea348c5721b80cc2101c7e5
Author: Tamas K Lengyel <tamas.lengyel@intel.com>
Date:   Fri Sep 11 20:14:00 2020 +0200

    xen/vmtrace: support for VM forks
    
    Implement vmtrace_reset_pt function. Properly set IPT
    state for VM forks.
    
    Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 88dd8389dd2c9442729e9d96a4febaf38cd822e3
Author: Michał Leszczyński <michal.leszczynski@cert.pl>
Date:   Tue Jun 16 15:35:07 2020 +0200

    tools/misc: Add xen-vmtrace tool
    
    Add an demonstration tool that uses xc_vmtrace_* calls in order
    to manage external IPT monitoring for DomU.
    
    Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 53aaa792fdebcf131983d45ee8e3d09bd0740c71
Author: Michał Leszczyński <michal.leszczynski@cert.pl>
Date:   Tue Jun 16 15:33:25 2020 +0200

    tools/libxc: Add xc_vmtrace_* functions
    
    Add functions in libxc that use the new XEN_DOMCTL_vmtrace interface.
    
    Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 1cee4bd97c88633c4a39f56f6722be0727c9ea8f
Author: Michał Leszczyński <michal.leszczynski@cert.pl>
Date:   Sun Jun 28 23:48:09 2020 +0200

    xen/domctl: Add XEN_DOMCTL_vmtrace_op
    
    Implement an interface to configure and control tracing operations.  Reuse the
    existing SETDEBUGGING flask vector rather than inventing a new one.
    
    Userspace using this interface is going to need platform specific knowledge
    anyway to interpret the contents of the trace buffer.  While some operations
    (e.g. enable/disable) can reasonably be generic, others cannot.  Provide an
    explicitly-platform specific pair of get/set operations to reduce API churn as
    new options get added/enabled.
    
    For the VMX specific Processor Trace implementation, tolerate reading and
    modifying a safe subset of bits in CTL, STATUS and OUTPUT_MASK.  This permits
    userspace to control the content which gets logged, but prevents modification
    of details such as the position/size of the output buffer.
    
    Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 71cb03f03ce309e8cc1dacd18aa383ccea6af231
Author: Michał Leszczyński <michal.leszczynski@cert.pl>
Date:   Tue Jun 16 15:20:18 2020 +0200

    x86/vmx: Add Intel Processor Trace support
    
    Add CPUID/MSR enumeration details for Processor Trace.  For now, we will only
    support its use inside VMX operation.  Fill in the vmtrace_available boolean
    to activate the newly introduced common infrastructure for allocating trace
    buffers.
    
    For now, Processor Trace is going to be operated in Single Output mode behind
    the guests back.  Add the MSRs to struct vcpu_msrs, and set up the buffer
    limit in vmx_init_ipt() as it is fixed for the lifetime of the domain.
    
    Context switch the most of the MSRs in and out of vCPU context, but the main
    control register needs to reside in the MSR load/save lists.  Explicitly pull
    the msrs pointer out into a local variable, because the optimiser cannot keep
    it live across the memory clobbers in the MSR accesses.
    
    Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit b72eab263592a3d76aa826675e5d62606d83cecd
Author: Michał Leszczyński <michal.leszczynski@cert.pl>
Date:   Mon Jun 29 00:05:51 2020 +0200

    xen/memory: Add a vmtrace_buf resource type
    
    Allow to map processor trace buffer using acquire_resource().
    
    Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 45ba9a7d7688a6a08200e37a8caa2bc99bb4d267
Author: Michał Leszczyński <michal.leszczynski@cert.pl>
Date:   Fri Jun 19 00:31:24 2020 +0200

    tools/[lib]xl: Add vmtrace_buf_size parameter
    
    Allow to specify the size of per-vCPU trace buffer upon
    domain creation. This is zero by default (meaning: not enabled).
    
    Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 217dd79ee29286b85074d22cc75ee064206fb2af
Author: Michał Leszczyński <michal.leszczynski@cert.pl>
Date:   Fri Jul 3 01:16:10 2020 +0200

    xen/domain: Add vmtrace_size domain creation parameter
    
    To use vmtrace, buffers of a suitable size need allocating, and different
    tasks will want different sizes.
    
    Add a domain creation parameter, and audit it appropriately in the
    {arch_,}sanitise_domain_config() functions.
    
    For now, the x86 specific auditing is tuned to Processor Trace running in
    Single Output mode, which requires a single contiguous range of memory.
    
    The size is given an arbitrary limit of 64M which is expected to be enough for
    anticipated usecases, but not large enough to get into long-running-hypercall
    problems.
    
    Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 34cc2e5f8dba6906da82fe8d76e839f9ab20f153
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jul 27 17:24:11 2020 +0100

    xen/memory: Fix mapping grant tables with XENMEM_acquire_resource
    
    A guest's default number of grant frames is 64, and XENMEM_acquire_resource
    will reject an attempt to map more than 32 frames.  This limit is caused by
    the size of mfn_list[] on the stack.
    
    Fix mapping of arbitrary size requests by looping over batches of 32 in
    acquire_resource(), and using hypercall continuations when necessary.
    
    To start with, break _acquire_resource() out of acquire_resource() to cope
    with type-specific dispatching, and update the return semantics to indicate
    the number of mfns returned.  Update gnttab_acquire_resource() and x86's
    arch_acquire_resource() to match these new semantics.
    
    Have do_memory_op() pass start_extent into acquire_resource() so it can pick
    up where it left off after a continuation, and loop over batches of 32 until
    all the work is done, or a continuation needs to occur.
    
    compat_memory_op() is a bit more complicated, because it also has to marshal
    frame_list in the XLAT buffer.  Have it account for continuation information
    itself and hide details from the upper layer, so it can marshal the buffer in
    chunks if necessary.
    
    With these fixes in place, it is now possible to map the whole grant table for
    a guest.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit f4318db940c39cc656128fcf72df3e79d2e55bc1
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Feb 5 14:09:42 2021 +0100

    x86/EFI: work around GNU ld 2.36 issue
    
    Our linker capability check fails with the recent binutils release's ld:
    
    .../check.o:(.debug_aranges+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_info'
    .../check.o:(.debug_info+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_abbrev'
    .../check.o:(.debug_info+0xc): relocation truncated to fit: R_X86_64_32 against `.debug_str'+76
    .../check.o:(.debug_info+0x11): relocation truncated to fit: R_X86_64_32 against `.debug_str'+d
    .../check.o:(.debug_info+0x15): relocation truncated to fit: R_X86_64_32 against `.debug_str'+2b
    .../check.o:(.debug_info+0x29): relocation truncated to fit: R_X86_64_32 against `.debug_line'
    .../check.o:(.debug_info+0x30): relocation truncated to fit: R_X86_64_32 against `.debug_str'+19
    .../check.o:(.debug_info+0x37): relocation truncated to fit: R_X86_64_32 against `.debug_str'+71
    .../check.o:(.debug_info+0x3e): relocation truncated to fit: R_X86_64_32 against `.debug_str'
    .../check.o:(.debug_info+0x45): relocation truncated to fit: R_X86_64_32 against `.debug_str'+5e
    .../check.o:(.debug_info+0x4c): additional relocation overflows omitted from the output
    
    Tell the linker to strip debug info as a workaround. Debug info has been
    getting stripped already anyway when linking the actual xen.efi.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d7acc47c8201611fda98ce5bd465626478ca4759
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Fri Feb 5 13:19:38 2021 +0100

    tools/tests: fix resource test build on FreeBSD
    
    error.h is not a standard header, and none of the functions declared
    there are actually used by the code. This fixes the build on FreeBSD
    that doesn't have error.h
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

