Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD6E96832F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 11:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787683.1197121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3KT-0005r4-7l; Mon, 02 Sep 2024 09:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787683.1197121; Mon, 02 Sep 2024 09:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3KT-0005nl-3W; Mon, 02 Sep 2024 09:26:33 +0000
Received: by outflank-mailman (input) for mailman id 787683;
 Mon, 02 Sep 2024 09:26:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl3KR-0005iP-Hl; Mon, 02 Sep 2024 09:26:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl3KR-000798-8W; Mon, 02 Sep 2024 09:26:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sl3KQ-0004Vw-RS; Mon, 02 Sep 2024 09:26:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sl3KQ-0006wg-Qv; Mon, 02 Sep 2024 09:26:30 +0000
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
	bh=yAthbQ3wxwX0w2/QthkVVzkntBrP0zQgDKof/gp5w+4=; b=K0+hpDz950xwW1o7y9kmYmh6+8
	11av3NwPGXeUGaXMjdtMVN9IjZLksLIIo6H769EKMJkmbTw9XpV7dpOxTtbsjNSQFge2CxWt2AEgz
	L/2HbraP27gt1WZ7aiEu2p7l/bkHc7pOwh72uDdoA33CuYieko7gSQlePcLuH2xq3C8E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187454-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 187454: trouble: preparing/queued/running
X-Osstest-Failures:
    qemu-mainline:test-arm64-arm64-xl-thunderx:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl-credit2:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl-credit1:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-libvirt-xsm:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-libvirt-raw:<none executed>:queued:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-vhd:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-raw:<none executed>:queued:regression
    qemu-mainline:build-amd64-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:<none executed>:queued:regression
    qemu-mainline:build-arm64-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<none executed>:queued:regression
    qemu-mainline:build-armhf-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<none executed>:queued:regression
    qemu-mainline:build-i386-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-qcow2:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    qemu-mainline:test-amd64-amd64-libvirt-raw:<none executed>:queued:regression
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
    qemu-mainline:test-arm64-arm64-xl-vhd:<none executed>:queued:regression
    qemu-mainline:test-arm64-arm64-xl-xsm:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-libvirt:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-libvirt-vhd:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-qcow2:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-raw:<none executed>:queued:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:<none executed>:queued:regression
    qemu-mainline:build-amd64:hosts-allocate:running:regression
    qemu-mainline:build-amd64-pvops:hosts-allocate:running:regression
    qemu-mainline:build-arm64-pvops:hosts-allocate:running:regression
    qemu-mainline:build-amd64-xsm:hosts-allocate:running:regression
    qemu-mainline:build-arm64-xsm:hosts-allocate:running:regression
    qemu-mainline:build-i386:hosts-allocate:running:regression
    qemu-mainline:build-armhf-pvops:host-install(4):running:regression
    qemu-mainline:build-i386-xsm:host-install(4):running:regression
    qemu-mainline:build-i386-pvops:host-install(4):running:regression
    qemu-mainline:build-armhf-pvops:syslog-server:running:regression
    qemu-mainline:build-arm64:host-install(4):running:regression
    qemu-mainline:build-i386-xsm:syslog-server:running:regression
    qemu-mainline:build-i386-pvops:syslog-server:running:regression
    qemu-mainline:build-arm64:syslog-server:running:regression
    qemu-mainline:build-armhf:host-install(4):running:regression
    qemu-mainline:build-armhf:syslog-server:running:regression
X-Osstest-Versions-This:
    qemuu=cec99171931ea79215c79661d33423ac84e63b6e
X-Osstest-Versions-That:
    qemuu=c152379422a204109f34ca2b43ecc538c7d738ae
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Sep 2024 09:26:30 +0000

flight 187454 qemu-mainline running [real]
http://logs.test-lab.xenproject.org/osstest/logs/187454/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-thunderx    <none executed>              queued
 test-arm64-arm64-xl-credit2     <none executed>              queued
 test-arm64-arm64-xl-credit1     <none executed>              queued
 test-arm64-arm64-xl             <none executed>              queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-arm64-arm64-libvirt-raw    <none executed>              queued
 test-amd64-coresched-amd64-xl    <none executed>              queued
 test-amd64-amd64-xl-xsm         <none executed>              queued
 test-amd64-amd64-xl-vhd         <none executed>              queued
 test-amd64-amd64-xl-shadow      <none executed>              queued
 test-amd64-amd64-xl-rtds        <none executed>              queued
 test-amd64-amd64-xl-raw         <none executed>              queued
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-ws16-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-win7-amd64    <none executed>              queued
 build-arm64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict   <none executed> queued
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <none executed>         queued
 build-armhf-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <none executed>     queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <none executed>            queued
 test-amd64-amd64-dom0pvh-xl-amd    <none executed>              queued
 test-amd64-amd64-xl-qcow2       <none executed>              queued
 test-amd64-amd64-dom0pvh-xl-intel    <none executed>              queued
 test-amd64-amd64-xl-pvshim      <none executed>              queued
 test-amd64-amd64-libvirt        <none executed>              queued
 test-amd64-amd64-libvirt-pair    <none executed>              queued
 test-amd64-amd64-libvirt-qcow2    <none executed>              queued
 test-amd64-amd64-xl-pvhv2-intel    <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-libvirt-raw    <none executed>              queued
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
 test-arm64-arm64-xl-vhd         <none executed>              queued
 test-arm64-arm64-xl-xsm         <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-vhd    <none executed>              queued
 test-armhf-armhf-xl             <none executed>              queued
 test-armhf-armhf-xl-arndale     <none executed>              queued
 test-armhf-armhf-xl-credit1     <none executed>              queued
 test-armhf-armhf-xl-credit2     <none executed>              queued
 test-armhf-armhf-xl-multivcpu    <none executed>              queued
 test-armhf-armhf-xl-qcow2       <none executed>              queued
 test-armhf-armhf-xl-raw         <none executed>              queued
 test-armhf-armhf-xl-rtds        <none executed>              queued
 build-amd64                   2 hosts-allocate               running
 build-amd64-pvops             2 hosts-allocate               running
 build-arm64-pvops             2 hosts-allocate               running
 build-amd64-xsm               2 hosts-allocate               running
 build-arm64-xsm               2 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 build-armhf-pvops             4 host-install(4)              running
 build-i386-xsm                4 host-install(4)              running
 build-i386-pvops              4 host-install(4)              running
 build-armhf-pvops             3 syslog-server                running
 build-arm64                   4 host-install(4)              running
 build-i386-xsm                3 syslog-server                running
 build-i386-pvops              3 syslog-server                running
 build-arm64                   3 syslog-server                running
 build-armhf                   4 host-install(4)              running
 build-armhf                   3 syslog-server                running

version targeted for testing:
 qemuu                cec99171931ea79215c79661d33423ac84e63b6e
baseline version:
 qemuu                c152379422a204109f34ca2b43ecc538c7d738ae

Last test of basis   182707  2023-09-07 00:28:57 Z  361 days
Failing since        182723  2023-09-07 18:19:05 Z  360 days   43 attempts
Testing same since   187397  2024-08-29 05:16:44 Z    4 days    4 attempts

------------------------------------------------------------
621 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              preparing
 build-arm64-xsm                                              preparing
 build-i386-xsm                                               running 
 build-amd64                                                  preparing
 build-arm64                                                  running 
 build-armhf                                                  running 
 build-i386                                                   preparing
 build-amd64-libvirt                                          queued  
 build-arm64-libvirt                                          queued  
 build-armhf-libvirt                                          queued  
 build-i386-libvirt                                           queued  
 build-amd64-pvops                                            preparing
 build-arm64-pvops                                            preparing
 build-armhf-pvops                                            running 
 build-i386-pvops                                             running 
 test-amd64-amd64-xl                                          queued  
 test-amd64-coresched-amd64-xl                                queued  
 test-arm64-arm64-xl                                          queued  
 test-armhf-armhf-xl                                          queued  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 queued  
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 queued  
 test-amd64-amd64-xl-xsm                                      queued  
 test-arm64-arm64-xl-xsm                                      queued  
 test-amd64-amd64-qemuu-nested-amd                            queued  
 test-amd64-amd64-xl-pvhv2-amd                                queued  
 test-amd64-amd64-dom0pvh-xl-amd                              queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    queued  
 test-amd64-amd64-qemuu-freebsd11-amd64                       queued  
 test-amd64-amd64-qemuu-freebsd12-amd64                       queued  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         queued  
 test-amd64-amd64-xl-qemuu-win7-amd64                         queued  
 test-amd64-amd64-xl-qemuu-ws16-amd64                         queued  
 test-armhf-armhf-xl-arndale                                  queued  
 test-amd64-amd64-xl-credit1                                  queued  
 test-arm64-arm64-xl-credit1                                  queued  
 test-armhf-armhf-xl-credit1                                  queued  
 test-amd64-amd64-xl-credit2                                  queued  
 test-arm64-arm64-xl-credit2                                  queued  
 test-armhf-armhf-xl-credit2                                  queued  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        queued  
 test-amd64-amd64-qemuu-nested-intel                          queued  
 test-amd64-amd64-xl-pvhv2-intel                              queued  
 test-amd64-amd64-dom0pvh-xl-intel                            queued  
 test-amd64-amd64-libvirt                                     queued  
 test-armhf-armhf-libvirt                                     queued  
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
 test-arm64-arm64-libvirt-raw                                 queued  
 test-amd64-amd64-xl-raw                                      queued  
 test-armhf-armhf-xl-raw                                      queued  
 test-amd64-amd64-xl-rtds                                     queued  
 test-armhf-armhf-xl-rtds                                     queued  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             queued  
 test-amd64-amd64-xl-shadow                                   queued  
 test-arm64-arm64-xl-thunderx                                 queued  
 test-amd64-amd64-libvirt-vhd                                 queued  
 test-armhf-armhf-libvirt-vhd                                 queued  
 test-amd64-amd64-xl-vhd                                      queued  
 test-arm64-arm64-xl-vhd                                      queued  


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

broken-job test-arm64-arm64-xl-thunderx queued
broken-job test-arm64-arm64-xl-credit2 queued
broken-job test-arm64-arm64-xl-credit1 queued
broken-job test-arm64-arm64-xl queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-arm64-arm64-libvirt-raw queued
broken-job test-amd64-coresched-amd64-xl queued
broken-job test-amd64-amd64-xl-xsm queued
broken-job test-amd64-amd64-xl-vhd queued
broken-job test-amd64-amd64-xl-shadow queued
broken-job test-amd64-amd64-xl-rtds queued
broken-job test-amd64-amd64-xl-raw queued
broken-job build-amd64-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 queued
broken-job build-arm64-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm queued
broken-job build-armhf-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow queued
broken-job build-i386-libvirt queued
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 queued
broken-job test-amd64-amd64-dom0pvh-xl-amd queued
broken-job test-amd64-amd64-xl-qcow2 queued
broken-job test-amd64-amd64-dom0pvh-xl-intel queued
broken-job test-amd64-amd64-xl-pvshim queued
broken-job test-amd64-amd64-libvirt queued
broken-job test-amd64-amd64-libvirt-pair queued
broken-job test-amd64-amd64-libvirt-qcow2 queued
broken-job test-amd64-amd64-xl-pvhv2-intel queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-libvirt-raw queued
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
broken-job test-arm64-arm64-xl-vhd queued
broken-job test-arm64-arm64-xl-xsm queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-vhd queued
broken-job test-armhf-armhf-xl queued
broken-job test-armhf-armhf-xl-arndale queued
broken-job test-armhf-armhf-xl-credit1 queued
broken-job test-armhf-armhf-xl-credit2 queued
broken-job test-armhf-armhf-xl-multivcpu queued
broken-job test-armhf-armhf-xl-qcow2 queued
broken-job test-armhf-armhf-xl-raw queued
broken-job test-armhf-armhf-xl-rtds queued

Not pushing.

(No revision log; it would be 181188 lines long.)

