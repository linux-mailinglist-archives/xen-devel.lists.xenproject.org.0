Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79316312F5E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82731.152912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943m-0001aH-Hg; Mon, 08 Feb 2021 10:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82731.152912; Mon, 08 Feb 2021 10:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943m-0001Zd-C6; Mon, 08 Feb 2021 10:46:26 +0000
Received: by outflank-mailman (input) for mailman id 82731;
 Mon, 08 Feb 2021 10:46:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943k-0001Yp-S2; Mon, 08 Feb 2021 10:46:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943k-0001cU-ND; Mon, 08 Feb 2021 10:46:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943k-0006rG-ET; Mon, 08 Feb 2021 10:46:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l943k-0008Fd-Dz; Mon, 08 Feb 2021 10:46:24 +0000
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
	bh=O0MSg8VMAaaQlpyANYh8BH1uBB3jKrGdPaAc6/eAdw0=; b=CSlUyJ2oIBegYP2J3l99fLEJ73
	zq1piHsZEFWu6vFdZIwqdbsc14mgRwwCDAY4/3k8SpP+yQLXuHsxrwRQa58RW2OzR+imoX7HzPBWX
	wVBQkhWCK8JJgrDB++GWbXsYgKgG1ZSkFcfzq6ukK+oYNZP4hdP36TuHoM/nPAoJQB70=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159122-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 159122: trouble: blocked/broken/preparing/queued/running
X-Osstest-Failures:
    qemu-mainline:build-amd64-pvops:<job status>:broken:regression
    qemu-mainline:build-armhf:<job status>:broken:regression
    qemu-mainline:build-i386:<job status>:broken:regression
    qemu-mainline:build-amd64-pvops:host-install(4):broken:regression
    qemu-mainline:build-i386:host-install(4):broken:regression
    qemu-mainline:build-armhf:host-install(4):broken:regression
    qemu-mainline:test-arm64-arm64-xl-credit1:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl-credit2:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl-seattle:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl-thunderx:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl-xsm:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-libvirt:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-pair:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-freebsd10-i386:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-freebsd10-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-coresched-i386-xl:<none executed>:queued:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    qemu-mainline:build-amd64-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:<none executed>:queued:regression
    qemu-mainline:build-arm64-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    qemu-mainline:build-armhf-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-amd64-pvgrub:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-i386-pvgrub:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-multivcpu:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-pair:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-pygrub:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-credit1:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-cubietruck:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-pvshim:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-raw:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-shadow:<none executed>:queued:regression
    qemu-mainline:test-amd64-i386-xl-xsm:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-libvirt-xsm:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl:<none executed>:queued:regression
    qemu-mainline:build-amd64:hosts-allocate:running:regression
    qemu-mainline:build-arm64:hosts-allocate:running:regression
    qemu-mainline:build-arm64-pvops:hosts-allocate:running:regression
    qemu-mainline:build-arm64-xsm:hosts-allocate:running:regression
    qemu-mainline:build-i386-pvops:hosts-allocate:running:regression
    qemu-mainline:build-i386-xsm:hosts-allocate:running:regression
    qemu-mainline:build-armhf-pvops:host-install(4):running:regression
    qemu-mainline:build-amd64-xsm:host-install(4):running:regression
    qemu-mainline:build-armhf-pvops:syslog-server:running:regression
    qemu-mainline:build-amd64-xsm:syslog-server:running:regression
    qemu-mainline:build-armhf:syslog-server:running:regression
    qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    qemuu=5b19cb63d9dfda41b412373b8c9fe14641bcab60
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 10:46:24 +0000

flight 159122 qemu-mainline running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159122/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-pvops               <job status>                 broken
 build-armhf                     <job status>                 broken
 build-i386                      <job status>                 broken
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 152631
 build-i386                    4 host-install(4)        broken REGR. vs. 152631
 build-armhf                   4 host-install(4)        broken REGR. vs. 152631
 test-arm64-arm64-xl-credit1     <none executed>              queued
 test-arm64-arm64-xl-credit2     <none executed>              queued
 test-arm64-arm64-xl-seattle     <none executed>              queued
 test-arm64-arm64-xl-thunderx    <none executed>              queued
 test-arm64-arm64-xl-xsm         <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-raw    <none executed>              queued
 test-armhf-armhf-xl             <none executed>              queued
 test-armhf-armhf-xl-arndale     <none executed>              queued
 test-armhf-armhf-xl-credit1     <none executed>              queued
 test-armhf-armhf-xl-multivcpu    <none executed>              queued
 test-armhf-armhf-xl-rtds        <none executed>              queued
 test-armhf-armhf-xl-vhd         <none executed>              queued
 test-amd64-i386-pair            <none executed>              queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-freebsd10-i386    <none executed>              queued
 test-amd64-i386-freebsd10-amd64    <none executed>              queued
 test-amd64-coresched-i386-xl    <none executed>              queued
 test-amd64-coresched-amd64-xl    <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              queued
 build-arm64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict   <none executed> queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 build-armhf-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <none executed>     queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-amd64-pvgrub    <none executed>              queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-amd    <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-intel    <none executed>              queued
 test-amd64-amd64-i386-pvgrub    <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-xl-pvhv2-amd    <none executed>              queued
 test-amd64-amd64-libvirt-vhd    <none executed>              queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-amd64-xl-multivcpu    <none executed>              queued
 test-amd64-amd64-pair           <none executed>              queued
 test-amd64-amd64-pygrub         <none executed>              queued
 test-amd64-amd64-xl-credit2     <none executed>              queued
 test-amd64-amd64-qemuu-freebsd11-amd64    <none executed>              queued
 test-amd64-amd64-qemuu-freebsd12-amd64    <none executed>              queued
 test-amd64-amd64-xl-credit1     <none executed>              queued
 test-amd64-amd64-qemuu-nested-amd    <none executed>              queued
 test-amd64-amd64-qemuu-nested-intel    <none executed>              queued
 test-amd64-amd64-xl             <none executed>              queued
 test-armhf-armhf-xl-credit2     <none executed>              queued
 test-armhf-armhf-xl-cubietruck    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-amd    <none executed>              queued
 test-amd64-i386-qemuu-rhel6hvm-intel    <none executed>              queued
 test-amd64-i386-xl              <none executed>              queued
 test-amd64-i386-xl-pvshim       <none executed>              queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64    <none executed>             queued
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow    <none executed>      queued
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <none executed>          queued
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict    <none executed> queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-win7-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-i386-xl-raw          <none executed>              queued
 test-amd64-i386-xl-shadow       <none executed>              queued
 test-amd64-i386-xl-xsm          <none executed>              queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-arm64-arm64-xl             <none executed>              queued
 build-amd64                   2 hosts-allocate               running
 build-arm64                   2 hosts-allocate               running
 build-arm64-pvops             2 hosts-allocate               running
 build-arm64-xsm               2 hosts-allocate               running
 build-i386-pvops              2 hosts-allocate               running
 build-i386-xsm                2 hosts-allocate               running
 build-armhf-pvops             4 host-install(4)              running
 build-amd64-xsm               4 host-install(4)              running
 build-armhf-pvops             3 syslog-server                running
 build-amd64-xsm               3 syslog-server                running
 build-armhf                   3 syslog-server                running

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a

version targeted for testing:
 qemuu                5b19cb63d9dfda41b412373b8c9fe14641bcab60
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z  172 days
Failing since        152659  2020-08-21 14:07:39 Z  170 days  341 attempts
Testing same since   159107  2021-02-07 19:51:11 Z    0 days    1 attempts

------------------------------------------------------------
375 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              running 
 build-arm64-xsm                                              preparing
 build-i386-xsm                                               preparing
 build-amd64                                                  preparing
 build-arm64                                                  preparing
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          queued  
 build-armhf-libvirt                                          queued  
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            preparing
 build-armhf-pvops                                            running 
 build-i386-pvops                                             preparing
 test-amd64-amd64-xl                                          queued  
 test-amd64-coresched-amd64-xl                                queued  
 test-arm64-arm64-xl                                          queued  
 test-armhf-armhf-xl                                          queued  
 test-amd64-i386-xl                                           queued  
 test-amd64-coresched-i386-xl                                 queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           queued  
 test-amd64-amd64-dom0pvh-xl-amd                              queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    queued  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     queued  
 test-amd64-i386-freebsd10-amd64                              queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       queued  
 test-amd64-amd64-qemuu-freebsd12-amd64                       queued  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         queued  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         queued  
 test-amd64-i386-xl-qemuu-win7-amd64                          queued  
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
 test-amd64-i386-freebsd10-i386                               queued  
 test-amd64-amd64-qemuu-nested-intel                          queued  
 test-amd64-amd64-xl-pvhv2-intel                              queued  
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

broken-job test-arm64-arm64-xl-credit1 queued
broken-job test-arm64-arm64-xl-credit2 queued
broken-job test-arm64-arm64-xl-seattle queued
broken-job test-arm64-arm64-xl-thunderx queued
broken-job test-arm64-arm64-xl-xsm queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-raw queued
broken-job test-armhf-armhf-xl queued
broken-job test-armhf-armhf-xl-arndale queued
broken-job test-armhf-armhf-xl-credit1 queued
broken-job test-armhf-armhf-xl-multivcpu queued
broken-job test-armhf-armhf-xl-rtds queued
broken-job test-armhf-armhf-xl-vhd queued
broken-job test-amd64-i386-pair queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-freebsd10-i386 queued
broken-job test-amd64-i386-freebsd10-amd64 queued
broken-job test-amd64-coresched-i386-xl queued
broken-job test-amd64-coresched-amd64-xl queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job build-amd64-pvops broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 queued
broken-job build-arm64-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job build-armhf broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job build-armhf-libvirt queued
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-amd64-amd64-pvgrub queued
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job test-amd64-amd64-dom0pvh-xl-amd queued
broken-job test-amd64-amd64-xl-pvshim queued
broken-job test-amd64-amd64-dom0pvh-xl-intel queued
broken-job test-amd64-amd64-i386-pvgrub queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-xl-pvhv2-amd queued
broken-job test-amd64-amd64-libvirt-vhd queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-amd64-xl-multivcpu queued
broken-job test-amd64-amd64-pair queued
broken-job test-amd64-amd64-pygrub queued
broken-job test-amd64-amd64-xl-credit2 queued
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 queued
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 queued
broken-job test-amd64-amd64-xl-credit1 queued
broken-job test-amd64-amd64-qemuu-nested-amd queued
broken-job test-amd64-amd64-qemuu-nested-intel queued
broken-job test-amd64-amd64-xl queued
broken-job test-armhf-armhf-xl-credit2 queued
broken-job test-armhf-armhf-xl-cubietruck queued
broken-job test-amd64-i386-qemuu-rhel6hvm-amd queued
broken-job test-amd64-i386-qemuu-rhel6hvm-intel queued
broken-job test-amd64-i386-xl queued
broken-job test-amd64-i386-xl-pvshim queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow queued
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm queued
broken-job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-win7-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-i386-xl-raw queued
broken-job test-amd64-i386-xl-shadow queued
broken-job test-amd64-i386-xl-xsm queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-arm64-arm64-xl queued
broken-step build-amd64-pvops host-install(4)
broken-step build-i386 host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 105392 lines long.)

