Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65A131274C
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 20:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82516.152362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8q3c-0008Rv-RQ; Sun, 07 Feb 2021 19:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82516.152362; Sun, 07 Feb 2021 19:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8q3c-0008RT-N4; Sun, 07 Feb 2021 19:49:20 +0000
Received: by outflank-mailman (input) for mailman id 82516;
 Sun, 07 Feb 2021 19:49:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8q3b-0008RL-KS; Sun, 07 Feb 2021 19:49:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8q3b-0003da-CD; Sun, 07 Feb 2021 19:49:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8q3b-0004AX-4j; Sun, 07 Feb 2021 19:49:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l8q3b-0004E3-4G; Sun, 07 Feb 2021 19:49:19 +0000
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
	bh=+1qLE8+Uu8s/9waPwnDDNIjii8Xt3rxGZ+/eG5j+rQY=; b=5R9OdB+wJu8aR+1Tvww9sO7T5/
	kQcnE2Y3VN8UVC3KLl9+ZInms+I4PY+8No+eS48XfndQvLZvKQMbvEF7H2q5aY5MOvzTCO/SejecZ
	Q5DWIaMF+hSaIxQ4EeUlDsfSqq8LKAy6pp+W83jl55hYZgiHPS7mNKsoPfqrhIF3goMM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 159072: trouble: blocked/broken/pass
X-Osstest-Failures:
    qemu-mainline:test-arm64-arm64-xl-seattle:<job status>:broken:regression
    qemu-mainline:test-arm64-arm64-xl-thunderx:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-libvirt:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    qemu-mainline:build-i386:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    qemu-mainline:build-i386-pvops:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    qemu-mainline:build-i386-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-amd64-pvgrub:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-i386-pvgrub:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-pair:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-pygrub:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-xl:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    qemu-mainline:test-arm64-arm64-xl:<job status>:broken:regression
    qemu-mainline:build-i386-pvops:host-install(4):broken:regression
    qemu-mainline:build-i386-xsm:host-install(4):broken:regression
    qemu-mainline:build-i386:host-install(4):broken:regression
    qemu-mainline:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-multivcpu:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-i386-pvgrub:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-shadow:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvshim:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-coresched-amd64-xl:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-pair:host-install/src_host(6):broken:nonblocking
    qemu-mainline:test-amd64-amd64-pair:host-install/dst_host(7):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-xsm:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qcow2:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit2:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit1:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-amd64-pvgrub:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-pygrub:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-rtds:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl:host-install(5):broken:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:host-install(5):broken:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:host-install(5):broken:nonblocking
    qemu-mainline:test-arm64-arm64-xl:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:host-install(5):broken:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:host-install(5):broken:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=d0dddab40e472ba62b5f43f11cc7dba085dabe71
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Feb 2021 19:49:19 +0000

flight 159072 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159072/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-seattle     <job status>                 broken
 test-arm64-arm64-xl-thunderx    <job status>                 broken
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-libvirt-raw    <job status>                 broken
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-xl-xsm         <job status>                 broken
 test-amd64-amd64-xl-shadow      <job status>                 broken
 test-amd64-amd64-xl-rtds        <job status>                 broken
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-win7-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm    <job status>            broken
 build-i386                      <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow    <job status>        broken
 build-i386-pvops                <job status>                 broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 build-i386-xsm                  <job status>                 broken
 test-amd64-amd64-amd64-pvgrub    <job status>                 broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-i386-pvgrub    <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-arm64-arm64-xl             <job status>                 broken
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 152631
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 152631
 build-i386                    4 host-install(4)        broken REGR. vs. 152631

Tests which did not succeed, but are not blocking:
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-xl-multivcpu  5 host-install(5)      broken blocked in 152631
 test-amd64-amd64-i386-pvgrub  5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)  broken blocked in 152631
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)      broken blocked in 152631
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken blocked in 152631
 test-armhf-armhf-xl-credit1   5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-libvirt      5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl           5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-multivcpu  5 host-install(5)      broken blocked in 152631
 test-armhf-armhf-xl-rtds      5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-vhd       5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-arndale   5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-credit2   5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-libvirt-xsm  5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-xl-shadow    5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-xl-pvshim    5 host-install(5)       broken blocked in 152631
 test-amd64-coresched-amd64-xl  5 host-install(5)      broken blocked in 152631
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)    broken blocked in 152631
 test-amd64-amd64-libvirt-vhd  5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-pair      6 host-install/src_host(6) broken blocked in 152631
 test-amd64-amd64-pair      7 host-install/dst_host(7) broken blocked in 152631
 test-amd64-amd64-xl-xsm       5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken blocked in 152631
 test-amd64-amd64-dom0pvh-xl-intel  5 host-install(5)  broken blocked in 152631
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken blocked in 152631
 test-amd64-amd64-xl-qcow2     5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-xl-credit2   5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-xl-qemuu-win7-amd64 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-xl-credit1   5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-amd64-pvgrub  5 host-install(5)      broken blocked in 152631
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)    broken blocked in 152631
 test-amd64-amd64-pygrub       5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-xl-rtds      5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-xl           5 host-install(5)       broken blocked in 152631
 test-arm64-arm64-xl-seattle   5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken blocked in 152631
 test-amd64-amd64-libvirt      5 host-install(5)       broken blocked in 152631
 test-amd64-amd64-qemuu-nested-intel 5 host-install(5) broken blocked in 152631
 test-arm64-arm64-xl-thunderx  5 host-install(5)       broken blocked in 152631
 test-arm64-arm64-xl           5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-libvirt-raw  5 host-install(5)       broken blocked in 152631
 test-armhf-armhf-xl-cubietruck  5 host-install(5)     broken blocked in 152631
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                d0dddab40e472ba62b5f43f11cc7dba085dabe71
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z  171 days
Failing since        152659  2020-08-21 14:07:39 Z  170 days  340 attempts
Testing same since   159072  2021-02-06 08:45:24 Z    1 days    1 attempts

------------------------------------------------------------
374 people touched revisions under test,
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
 test-arm64-arm64-xl                                          broken  
 test-armhf-armhf-xl                                          broken  
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 broken  
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 broken  
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            broken  
 test-amd64-amd64-xl-pvhv2-amd                                broken  
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       broken  
 test-amd64-amd64-qemuu-freebsd12-amd64                       broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         broken  
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         broken  
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
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
 test-armhf-armhf-libvirt-raw                                 broken  
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     broken  
 test-arm64-arm64-xl-seattle                                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 broken  
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-armhf-armhf-xl-vhd                                      broken  


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

broken-job test-arm64-arm64-xl-seattle broken
broken-job test-arm64-arm64-xl-thunderx broken
broken-job test-armhf-armhf-libvirt broken
broken-job test-armhf-armhf-libvirt-raw broken
broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job test-amd64-coresched-amd64-xl broken
broken-job test-amd64-amd64-xl-xsm broken
broken-job test-amd64-amd64-xl-shadow broken
broken-job test-amd64-amd64-xl-rtds broken
broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-win7-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm broken
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow broken
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-amd64-pvgrub broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-i386-pvgrub broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-xl broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-arm64-arm64-xl broken
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-xl-multivcpu host-install(5)
broken-step test-amd64-amd64-i386-pvgrub host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-step test-armhf-armhf-libvirt host-install(5)
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-xl-rtds host-install(5)
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step test-amd64-coresched-amd64-xl host-install(5)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-amd64-pvgrub host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)
broken-step build-i386-pvops host-install(4)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step test-arm64-arm64-xl-seattle host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-arm64-arm64-xl-thunderx host-install(5)
broken-step test-arm64-arm64-xl host-install(5)
broken-step test-armhf-armhf-libvirt-raw host-install(5)
broken-step test-armhf-armhf-xl-cubietruck host-install(5)

Not pushing.

(No revision log; it would be 104630 lines long.)

