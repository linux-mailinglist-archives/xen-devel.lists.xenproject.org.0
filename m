Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BFB968A7C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 16:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788071.1197506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8Vq-0007ra-95; Mon, 02 Sep 2024 14:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788071.1197506; Mon, 02 Sep 2024 14:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8Vq-0007q4-5s; Mon, 02 Sep 2024 14:58:38 +0000
Received: by outflank-mailman (input) for mailman id 788071;
 Mon, 02 Sep 2024 14:58:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl8Vp-0007oc-ID; Mon, 02 Sep 2024 14:58:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl8Vp-0004bs-2V; Mon, 02 Sep 2024 14:58:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl8Vo-0007pg-I5; Mon, 02 Sep 2024 14:58:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sl8Vo-0002Np-HS; Mon, 02 Sep 2024 14:58:36 +0000
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
	bh=SmbMz5B6fJHF3APm8DvCjzQGpHd42HBr7LiSE86nSgM=; b=x45rHIEXFnecJvht6DDS+AKWuw
	Em7dyHfmWYu0pSCBckKEzLykpoMiFkfy8Ps9zTBe6eSNedwWiMnBNzd3LH326zmbbnJ8JX9C2ijKO
	9NAZtBlzHvRCPiXQdWtp3/wQl5hUPgO8PPTgxFK3Q+dT8Pj/F25KZ6yrup0aQpo+mKKo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187453-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 187453: trouble: blocked/broken/preparing/queued/running
X-Osstest-Failures:
    xen-unstable:build-amd64-xsm:<job status>:broken:regression
    xen-unstable:build-amd64-xtf:<job status>:broken:regression
    xen-unstable:build-arm64:<job status>:broken:regression
    xen-unstable:build-arm64-pvops:<job status>:broken:regression
    xen-unstable:build-arm64-xsm:<job status>:broken:regression
    xen-unstable:build-armhf:<job status>:broken:regression
    xen-unstable:build-i386:<job status>:broken:regression
    xen-unstable:build-i386-prev:<job status>:broken:regression
    xen-unstable:build-i386-pvops:<job status>:broken:regression
    xen-unstable:build-i386-xsm:<job status>:broken:regression
    xen-unstable:build-i386-pvops:host-install(4):broken:regression
    xen-unstable:build-i386:host-install(4):broken:regression
    xen-unstable:build-i386-prev:host-install(4):broken:regression
    xen-unstable:build-i386-xsm:host-install(4):broken:regression
    xen-unstable:build-arm64-pvops:host-install(4):broken:regression
    xen-unstable:build-arm64:host-install(4):broken:regression
    xen-unstable:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable:build-amd64-xtf:host-install(4):broken:regression
    xen-unstable:build-amd64-xsm:host-install(4):broken:regression
    xen-unstable:build-armhf:host-install(4):broken:regression
    xen-unstable:test-xtf-amd64-amd64-2:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-3:<none executed>:queued:regression
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
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    xen-unstable:build-amd64-libvirt:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-pvhv2-amd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-multivcpu:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-intel:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-examine:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-examine-bios:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd11-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-examine-uefi:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-pygrub:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-qcow2:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-pair:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-raw:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-migrupgrade:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-vhd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-livepatch:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-1:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-raw:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-vhd:<none executed>:queued:regression
    xen-unstable:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    xen-unstable:test-amd64-coresched-amd64-xl:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-examine:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-libvirt:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-libvirt-vhd:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-multivcpu:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-qcow2:<none executed>:queued:regression
    xen-unstable:test-armhf-armhf-xl-raw:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-4:<none executed>:queued:regression
    xen-unstable:test-xtf-amd64-amd64-5:<none executed>:queued:regression
    xen-unstable:build-amd64-pvops:hosts-allocate:running:regression
    xen-unstable:build-amd64-prev:hosts-allocate:running:regression
    xen-unstable:build-amd64:hosts-allocate:running:regression
    xen-unstable:build-armhf-pvops:host-install(4):running:regression
    xen-unstable:build-armhf-pvops:syslog-server:running:regression
    xen-unstable:build-amd64-xsm:syslog-server:running:regression
    xen-unstable:build-amd64-xsm:capture-logs:running:regression
    xen-unstable:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=1436593d5f8f7f700478e307d5198535ba69f88d
X-Osstest-Versions-That:
    xen=99f942f3d410059dc223ee0a908827e928ef3592
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Sep 2024 14:58:36 +0000

flight 187453 xen-unstable running [real]
http://logs.test-lab.xenproject.org/osstest/logs/187453/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm                 <job status>                 broken
 build-amd64-xtf                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-prev                 <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 187415
 build-i386                    4 host-install(4)        broken REGR. vs. 187415
 build-i386-prev               4 host-install(4)        broken REGR. vs. 187415
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 187415
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 187415
 build-arm64                   4 host-install(4)        broken REGR. vs. 187415
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 187415
 build-amd64-xtf               4 host-install(4)        broken REGR. vs. 187415
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 187415
 build-armhf                   4 host-install(4)        broken REGR. vs. 187415
 test-xtf-amd64-amd64-2          <none executed>              queued
 test-xtf-amd64-amd64-3          <none executed>              queued
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
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              queued
 test-amd64-amd64-xl-multivcpu    <none executed>              queued
 test-amd64-amd64-xl-credit2     <none executed>              queued
 test-amd64-amd64-xl-credit1     <none executed>              queued
 test-amd64-amd64-xl             <none executed>              queued
 test-amd64-amd64-qemuu-nested-intel    <none executed>              queued
 test-amd64-amd64-qemuu-nested-amd    <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-amd    <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-intel    <none executed>              queued
 test-amd64-amd64-qemuu-freebsd12-amd64    <none executed>              queued
 test-amd64-amd64-examine        <none executed>              queued
 test-amd64-amd64-examine-bios    <none executed>              queued
 test-amd64-amd64-qemuu-freebsd11-amd64    <none executed>              queued
 test-amd64-amd64-examine-uefi    <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-pygrub         <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-libvirt-qcow2    <none executed>              queued
 test-amd64-amd64-pair           <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-libvirt-raw    <none executed>              queued
 test-amd64-amd64-migrupgrade    <none executed>              queued
 test-amd64-amd64-libvirt-vhd    <none executed>              queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-livepatch      <none executed>              queued
 test-armhf-armhf-xl-rtds        <none executed>              queued
 test-xtf-amd64-amd64-1          <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-raw         <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-amd64-xl-vhd         <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-coresched-amd64-xl    <none executed>              queued
 test-armhf-armhf-examine        <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-vhd    <none executed>              queued
 test-armhf-armhf-xl             <none executed>              queued
 test-armhf-armhf-xl-arndale     <none executed>              queued
 test-armhf-armhf-xl-credit1     <none executed>              queued
 test-armhf-armhf-xl-credit2     <none executed>              queued
 test-armhf-armhf-xl-multivcpu    <none executed>              queued
 test-armhf-armhf-xl-qcow2       <none executed>              queued
 test-armhf-armhf-xl-raw         <none executed>              queued
 test-xtf-amd64-amd64-4          <none executed>              queued
 test-xtf-amd64-amd64-5          <none executed>              queued
 build-amd64-pvops             2 hosts-allocate               running
 build-amd64-prev              2 hosts-allocate               running
 build-amd64                   2 hosts-allocate               running
 build-armhf-pvops             4 host-install(4)              running
 build-armhf-pvops             3 syslog-server                running
 build-amd64-xsm               3 syslog-server                running
 build-amd64-xsm               5 capture-logs                 running

Tests which did not succeed, but are not blocking:
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  1436593d5f8f7f700478e307d5198535ba69f88d
baseline version:
 xen                  99f942f3d410059dc223ee0a908827e928ef3592

Last test of basis   187415  2024-08-30 05:21:05 Z    3 days
Testing same since   187431  2024-08-31 01:39:54 Z    2 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@vates.tech>
  Christian Lindig <christian.lindig@cloud.com>
  Victor Lira <victorm.lira@amd.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              broken  
 build-amd64                                                  preparing
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             preparing
 build-i386-prev                                              broken  
 build-amd64-pvops                                            preparing
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            running 
 build-i386-pvops                                             broken  
 test-xtf-amd64-amd64-1                                       queued  
 test-xtf-amd64-amd64-2                                       queued  
 test-xtf-amd64-amd64-3                                       queued  
 test-xtf-amd64-amd64-4                                       queued  
 test-xtf-amd64-amd64-5                                       queued  
 test-amd64-amd64-xl                                          queued  
 test-amd64-coresched-amd64-xl                                queued  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        queued  
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 queued  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 queued  
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-qemuu-nested-amd                            queued  
 test-amd64-amd64-xl-pvhv2-amd                                queued  
 test-amd64-amd64-dom0pvh-xl-amd                              queued  
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       queued  
 test-amd64-amd64-qemuu-freebsd12-amd64                       queued  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         queued  
 test-amd64-amd64-xl-qemut-win7-amd64                         queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         queued  
 test-amd64-amd64-xl-qemut-ws16-amd64                         queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         queued  
 test-armhf-armhf-xl-arndale                                  queued  
 test-amd64-amd64-examine-bios                                queued  
 test-amd64-amd64-xl-credit1                                  queued  
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  queued  
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  queued  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        queued  
 test-amd64-amd64-examine                                     queued  
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     queued  
 test-amd64-amd64-qemuu-nested-intel                          queued  
 test-amd64-amd64-xl-pvhv2-intel                              queued  
 test-amd64-amd64-dom0pvh-xl-intel                            queued  
 test-amd64-amd64-libvirt                                     queued  
 test-armhf-armhf-libvirt                                     queued  
 test-amd64-amd64-livepatch                                   queued  
 test-amd64-amd64-migrupgrade                                 queued  
 test-amd64-amd64-xl-multivcpu                                queued  
 test-armhf-armhf-xl-multivcpu                                queued  
 test-amd64-amd64-pair                                        queued  
 test-amd64-amd64-libvirt-pair                                queued  
 test-amd64-amd64-xl-pvshim                                   queued  
 test-amd64-amd64-pygrub                                      queued  
 test-amd64-amd64-libvirt-qcow2                               queued  
 test-amd64-amd64-xl-qcow2                                    queued  
 test-armhf-armhf-xl-qcow2                                    queued  
 test-amd64-amd64-libvirt-raw                                 queued  
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      queued  
 test-armhf-armhf-xl-raw                                      queued  
 test-amd64-amd64-xl-rtds                                     queued  
 test-armhf-armhf-xl-rtds                                     queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                queued  
 test-amd64-amd64-libvirt-vhd                                 queued  
 test-armhf-armhf-libvirt-vhd                                 queued  
 test-amd64-amd64-xl-vhd                                      queued  
 test-arm64-arm64-xl-vhd                                      blocked 


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

broken-job test-xtf-amd64-amd64-2 queued
broken-job test-xtf-amd64-amd64-3 queued
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
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 queued
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-amd64-xl-pvshim queued
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job build-amd64-xsm broken
broken-job build-amd64-xtf broken
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job build-arm64 broken
broken-job test-amd64-amd64-xl-multivcpu queued
broken-job build-arm64-pvops broken
broken-job test-amd64-amd64-xl-credit2 queued
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job test-amd64-amd64-xl-credit1 queued
broken-job build-i386 broken
broken-job test-amd64-amd64-xl queued
broken-job build-i386-prev broken
broken-job test-amd64-amd64-qemuu-nested-intel queued
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-qemuu-nested-amd queued
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-dom0pvh-xl-amd queued
broken-job test-amd64-amd64-dom0pvh-xl-intel queued
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 queued
broken-job test-amd64-amd64-examine queued
broken-job test-amd64-amd64-examine-bios queued
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 queued
broken-job test-amd64-amd64-examine-uefi queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-pygrub queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-libvirt-qcow2 queued
broken-job test-amd64-amd64-pair queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-libvirt-raw queued
broken-job test-amd64-amd64-migrupgrade queued
broken-job test-amd64-amd64-libvirt-vhd queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-livepatch queued
broken-job test-armhf-armhf-xl-rtds queued
broken-job test-xtf-amd64-amd64-1 queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-amd64-xl-raw queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-amd64-xl-vhd queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-coresched-amd64-xl queued
broken-job test-armhf-armhf-examine queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-vhd queued
broken-job test-armhf-armhf-xl queued
broken-job test-armhf-armhf-xl-arndale queued
broken-job test-armhf-armhf-xl-credit1 queued
broken-job test-armhf-armhf-xl-credit2 queued
broken-job test-armhf-armhf-xl-multivcpu queued
broken-job test-armhf-armhf-xl-qcow2 queued
broken-job test-armhf-armhf-xl-raw queued
broken-job test-xtf-amd64-amd64-4 queued
broken-job test-xtf-amd64-amd64-5 queued
broken-step build-i386-pvops host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-prev host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-amd64-xtf host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

------------------------------------------------------------
commit 1436593d5f8f7f700478e307d5198535ba69f88d
Author: Anthony PERARD <anthony.perard@vates.tech>
Date:   Fri Aug 30 09:49:40 2024 +0000

    libxl: Probe QEMU for -run-with user=user and use it
    
    "-runas" is deprecated since QEMU 9.1 and will be remove in a future
    release.
    
    Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

commit 82335a8cc54c009792d44f0be51213da48303a68
Author: Anthony PERARD <anthony.perard@vates.tech>
Date:   Fri Aug 30 09:49:40 2024 +0000

    libxl: Probe QEMU for -run-with chroot=dir and use it
    
    QEMU 9.0 have removed "-chroot" command line option, which have been
    deprecated since QEMU 8.1 in favor of "-run-with chroot=dir".
    
    Look into the result of the QMP command "query-command-line-options"
    to find out if "-run-with chroot=dir" is available. Then use it in
    place of "-chroot".
    
    Resolves: xen-project/xen#187
    Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
    Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

commit 7ab0f83e604d44c92daa218423bf7644502fcefe
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 28 20:20:34 2024 +0100

    x86/pv: Make cr4_pv32_mask be PV32-only
    
    The user of cr4_pv32_mask (the cr4_pv32_restore() function) only exists in a
    CONFIG_PV32 build, but right now the variable is unconditionally set up.
    
    To start with, move the setup into set_in_cr4() and remove it from it's
    somewhat ad-hoc position in __start_xen().  This means the variable will be
    set up in two steps for a CONFIG_PV32=y build, but it's cleaner and more
    robust logic overall.
    
    With that, there's no good reason for the variable to stay in setup.c.  Move
    it to x86/pv/domain.c (beside opt_pv32, for want of any better place to live),
    and move the declaration to beside set_in_cr4() and mmu_cr4_features which is
    a better position than setup.h.
    
    Guard the reference with CONFIG_PV32, and fix up a recent typo in an adjacent
    comment while at it.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 8d336fcb6ea6b486ceccef2e36d003db032131fe
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 30 22:14:20 2023 +0000

    tools/ocaml: Factor out compatiblity handling
    
    ... rather than having each library implement its own subset.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>

commit 5e99a40ea54a6bf0bdc18241992866a642d7782b
Author: Victor Lira <victorm.lira@amd.com>
Date:   Thu Aug 29 15:34:23 2024 -0700

    automation: use expect utility in xilinx tests
    
    Fixes: 95764a0817a5 (automation: update xilinx test scripts (tty))
    This patch introduced a CI failure due to a timeout in xilinx-x86_64 test.
    
    Change xilinx-x86_64 and xilinx-arm64 scripts to use "expect" utility
    to determine test result and allow early exit from tests.
    Add "expect" to xilinx container environment (dockerfile).
    Rename references to "QEMU" in "qemu-key.exp" expect script to "TEST" to be
    used by both QEMU and hardware tests.
    
    Signed-off-by: Victor Lira <victorm.lira@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 740c41ca05a83a2c3629eb2ff323877c37d95c1e
Author: Victor Lira <victorm.lira@amd.com>
Date:   Thu Aug 29 15:34:22 2024 -0700

    automation: fix false success in qemu tests
    
    Fix flaw in qemu-*.sh tests that producess a false success. The following
    lines produces success despite the "expect" script producing nonzero exit
    status:
    
        set +e
    ...
        ./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
        (end of file)
    
    The default exit status for a pipeline using "|" operator is that of the
    rightmost command. Fix this by setting the "pipefail" option in the shell,
    and removing "set +e" allowing the expect script to determine the result.
    
    Signed-off-by: Victor Lira <victorm.lira@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
(qemu changes not included)

