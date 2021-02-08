Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26755312F5C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:46:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82727.152883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943d-0001QZ-NR; Mon, 08 Feb 2021 10:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82727.152883; Mon, 08 Feb 2021 10:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943d-0001Pu-JA; Mon, 08 Feb 2021 10:46:17 +0000
Received: by outflank-mailman (input) for mailman id 82727;
 Mon, 08 Feb 2021 10:46:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943c-0001PS-Fe; Mon, 08 Feb 2021 10:46:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943c-0001cJ-8S; Mon, 08 Feb 2021 10:46:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943c-0006qy-0k; Mon, 08 Feb 2021 10:46:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l943c-00089A-0I; Mon, 08 Feb 2021 10:46:16 +0000
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
	bh=cjmWajFYmQeyvy6Cv0QkUwFTj+IIKODllv6TX3nRXPs=; b=3EQmC+nOv/jlAyez1v8TIACnWI
	rfzqmSNEj0X/KEMqJIa048OUPdHJz4SAxCOJSlclRPwZ5twsm7Oj8VSZ3BxpK4J3NShirV4494lbB
	zhU2T96l4w3i4O5R+OlT53YzjEQ5B6RAkz2+yTSRqoS83WLqgq7p6V3Ecs4bnYmXpmXo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159120-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.11-testing test] 159120: trouble: blocked/broken/preparing/queued/running
X-Osstest-Failures:
    xen-4.11-testing:build-amd64-prev:<job status>:broken:regression
    xen-4.11-testing:build-amd64-pvops:<job status>:broken:regression
    xen-4.11-testing:build-armhf:<job status>:broken:regression
    xen-4.11-testing:build-armhf-pvops:<job status>:broken:regression
    xen-4.11-testing:build-amd64-pvops:host-install(4):broken:regression
    xen-4.11-testing:build-armhf-pvops:host-install(4):broken:regression
    xen-4.11-testing:build-amd64-prev:host-install(4):broken:regression
    xen-4.11-testing:build-armhf:host-install(4):broken:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-arm64-arm64-libvirt-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-arm64-arm64-xl:<none executed>:queued:regression
    xen-4.11-testing:test-arm64-arm64-xl-credit1:<none executed>:queued:regression
    xen-4.11-testing:test-arm64-arm64-xl-credit2:<none executed>:queued:regression
    xen-4.11-testing:test-arm64-arm64-xl-seattle:<none executed>:queued:regression
    xen-4.11-testing:test-arm64-arm64-xl-thunderx:<none executed>:queued:regression
    xen-4.11-testing:test-arm64-arm64-xl-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-xtf-amd64-amd64-1:<none executed>:queued:regression
    xen-4.11-testing:test-xtf-amd64-amd64-2:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<none executed>:queued:regression
    xen-4.11-testing:build-amd64-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-win7-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.11-testing:build-arm64-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    xen-4.11-testing:build-i386-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-pvhv2-amd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-multivcpu:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-amd64-pvgrub:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-i386-pvgrub:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-vhd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-xl:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-livepatch:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-nested-intel:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-migrupgrade:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-pair:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-nested-amd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-pygrub:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-amd64-qemuu-freebsd12-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-raw:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-livepatch:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-migrupgrade:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-pair:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemut-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:<none executed>:queued:regression
    xen-4.11-testing:test-xtf-amd64-amd64-3:<none executed>:queued:regression
    xen-4.11-testing:test-xtf-amd64-amd64-4:<none executed>:queued:regression
    xen-4.11-testing:test-xtf-amd64-amd64-5:<none executed>:queued:regression
    xen-4.11-testing:build-amd64:hosts-allocate:running:regression
    xen-4.11-testing:build-i386-prev:hosts-allocate:running:regression
    xen-4.11-testing:build-amd64-xtf:hosts-allocate:running:regression
    xen-4.11-testing:build-arm64:hosts-allocate:running:regression
    xen-4.11-testing:build-arm64-xsm:hosts-allocate:running:regression
    xen-4.11-testing:build-i386:hosts-allocate:running:regression
    xen-4.11-testing:build-arm64-pvops:hosts-allocate:running:regression
    xen-4.11-testing:build-i386-pvops:hosts-allocate:running:regression
    xen-4.11-testing:build-i386-xsm:hosts-allocate:running:regression
    xen-4.11-testing:build-amd64-xsm:host-install(4):running:regression
    xen-4.11-testing:build-amd64-xsm:syslog-server:running:regression
    xen-4.11-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.11-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=1c7d984645f9ade9b47e862b5880734ad498fea8
X-Osstest-Versions-That:
    xen=310ab79875cb705cc2c7daddff412b5a4899f8c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 10:46:16 +0000

flight 159120 xen-4.11-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159120/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-prev                <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 157566
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 157566
 build-amd64-prev              4 host-install(4)        broken REGR. vs. 157566
 build-armhf                   4 host-install(4)        broken REGR. vs. 157566
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm    <none executed> queued
 test-amd64-i386-xl-qemut-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemut-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-arm64-arm64-xl             <none executed>              queued
 test-arm64-arm64-xl-credit1     <none executed>              queued
 test-arm64-arm64-xl-credit2     <none executed>              queued
 test-arm64-arm64-xl-seattle     <none executed>              queued
 test-arm64-arm64-xl-thunderx    <none executed>              queued
 test-arm64-arm64-xl-xsm         <none executed>              queued
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
 build-arm64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 build-i386-libvirt              <none executed>              queued
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
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
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
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemut-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm    <none executed>          queued
 test-xtf-amd64-amd64-3          <none executed>              queued
 test-xtf-amd64-amd64-4          <none executed>              queued
 test-xtf-amd64-amd64-5          <none executed>              queued
 build-amd64                   2 hosts-allocate               running
 build-i386-prev               2 hosts-allocate               running
 build-amd64-xtf               2 hosts-allocate               running
 build-arm64                   2 hosts-allocate               running
 build-arm64-xsm               2 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 build-arm64-pvops             2 hosts-allocate               running
 build-i386-pvops              2 hosts-allocate               running
 build-i386-xsm                2 hosts-allocate               running
 build-amd64-xsm               4 host-install(4)              running
 build-amd64-xsm               3 syslog-server                running

Tests which did not succeed, but are not blocking:
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
 build-armhf-libvirt           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  1c7d984645f9ade9b47e862b5880734ad498fea8
baseline version:
 xen                  310ab79875cb705cc2c7daddff412b5a4899f8c9

Last test of basis   157566  2020-12-15 14:05:54 Z   54 days
Failing since        159016  2021-02-04 15:05:58 Z    3 days    4 attempts
Testing same since   159042  2021-02-05 12:13:30 Z    2 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              running 
 build-arm64-xsm                                              preparing
 build-i386-xsm                                               preparing
 build-amd64-xtf                                              preparing
 build-amd64                                                  preparing
 build-arm64                                                  preparing
 build-armhf                                                  broken  
 build-i386                                                   preparing
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          queued  
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           queued  
 build-amd64-prev                                             broken  
 build-i386-prev                                              preparing
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            preparing
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             preparing
 test-xtf-amd64-amd64-1                                       queued  
 test-xtf-amd64-amd64-2                                       queued  
 test-xtf-amd64-amd64-3                                       queued  
 test-xtf-amd64-amd64-4                                       queued  
 test-xtf-amd64-amd64-5                                       queued  
 test-amd64-amd64-xl                                          queued  
 test-arm64-arm64-xl                                          queued  
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           queued  
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
 test-arm64-arm64-xl-credit1                                  queued  
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  queued  
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
 test-arm64-arm64-xl-seattle                                  queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-amd64-i386-xl-shadow                                    queued  
 test-arm64-arm64-xl-thunderx                                 queued  
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

broken-job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-xl-qemut-win7-amd64 queued
broken-job test-amd64-i386-xl-qemut-ws16-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-arm64-arm64-xl queued
broken-job test-arm64-arm64-xl-credit1 queued
broken-job test-arm64-arm64-xl-credit2 queued
broken-job test-arm64-arm64-xl-seattle queued
broken-job test-arm64-arm64-xl-thunderx queued
broken-job test-arm64-arm64-xl-xsm queued
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
broken-job build-amd64-pvops broken
broken-job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm queued
broken-job build-arm64-libvirt queued
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job build-armhf broken
broken-job test-amd64-amd64-xl-pvshim queued
broken-job build-armhf-pvops broken
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job build-i386-libvirt queued
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job test-amd64-amd64-xl-multivcpu queued
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
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-xl-shadow queued
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
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemut-debianhvm-i386-xsm queued
broken-job test-xtf-amd64-amd64-3 queued
broken-job test-xtf-amd64-amd64-4 queued
broken-job test-xtf-amd64-amd64-5 queued
broken-step build-amd64-pvops host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-amd64-prev host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 1c7d984645f9ade9b47e862b5880734ad498fea8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Feb 5 08:54:03 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again, part 2)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f9090d990e201a5ca045976b8ddaab9fa6ee69dd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Feb 4 15:41:12 2021 +0100

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL} (again)
    
    X86_VENDOR_* aren't bit masks in the older trees.
    
    Reported-by: James Dingwall <james@dingwall.me.uk>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

