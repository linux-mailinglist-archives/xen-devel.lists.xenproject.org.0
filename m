Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9254E4E8909
	for <lists+xen-devel@lfdr.de>; Sun, 27 Mar 2022 18:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295206.502262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYWDm-0003tD-Mc; Sun, 27 Mar 2022 16:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295206.502262; Sun, 27 Mar 2022 16:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYWDm-0003qb-JT; Sun, 27 Mar 2022 16:58:30 +0000
Received: by outflank-mailman (input) for mailman id 295206;
 Sun, 27 Mar 2022 16:58:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYWDl-0003qR-Ti; Sun, 27 Mar 2022 16:58:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYWDl-0006YY-12; Sun, 27 Mar 2022 16:58:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nYWDk-0000BV-E0; Sun, 27 Mar 2022 16:58:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nYWDk-00068Y-DV; Sun, 27 Mar 2022 16:58:28 +0000
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
	bh=7gHMnfvsiTSu4pBrilcNgTqXXIwAZdtA3ThFDgIXp7E=; b=uufCLrLXi/RIb9KIrag8qR6s/g
	4NOGCAqpoL2tYy8M11omty1K+u4vbEn3+BCqxk4enYrk7XmpW24zD+VwhZGiED5xFRskLPQu3TcSl
	yeU1DL+/a8fPsjc3a+x5ICHr0qTDQfX0KzWSXzBPO5fWknx/KBmgMLNxJUTGrWl14mzs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168872-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 168872: regressions - trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl-credit1:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl-credit2:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl-seattle:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl-vhd:<job status>:broken:regression
    xen-4.14-testing:test-arm64-arm64-xl-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-shadow:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-rtds:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-qcow2:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-pvshim:<job status>:broken:regression
    xen-4.14-testing:build-i386:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-pvhv2-intel:<job status>:broken:regression
    xen-4.14-testing:build-i386-prev:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-pvhv2-amd:<job status>:broken:regression
    xen-4.14-testing:build-i386-pvops:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-multivcpu:<job status>:broken:regression
    xen-4.14-testing:build-i386-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-amd:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-credit2:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-libvirt:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-pair:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl-credit1:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-xl:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-livepatch:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-intel:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-migrupgrade:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-pair:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-pygrub:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-freebsd11-amd64:<job status>:broken:regression
    xen-4.14-testing:test-amd64-amd64-qemuu-freebsd12-amd64:<job status>:broken:regression
    xen-4.14-testing:test-xtf-amd64-amd64-1:<job status>:broken:regression
    xen-4.14-testing:test-xtf-amd64-amd64-2:<job status>:broken:regression
    xen-4.14-testing:test-xtf-amd64-amd64-3:<job status>:broken:regression
    xen-4.14-testing:test-xtf-amd64-amd64-4:<job status>:broken:regression
    xen-4.14-testing:test-xtf-amd64-amd64-5:<job status>:broken:regression
    xen-4.14-testing:build-i386-prev:host-install(4):broken:regression
    xen-4.14-testing:build-i386-xsm:host-install(4):broken:regression
    xen-4.14-testing:build-i386:host-install(4):broken:regression
    xen-4.14-testing:build-i386-pvops:host-install(4):broken:regression
    xen-4.14-testing:test-amd64-amd64-livepatch:livepatch-run:fail:regression
    xen-4.14-testing:test-amd64-amd64-xl-qcow2:guest-localmigrate/x10:fail:regression
    xen-4.14-testing:test-amd64-i386-livepatch:livepatch-run:fail:regression
    xen-4.14-testing:test-amd64-amd64-libvirt:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-intel:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-pvshim:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-pair:host-install/src_host(6):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-pair:host-install/dst_host(7):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-amd:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-pvhv2-amd:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-multivcpu:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-coresched-amd64-xl:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-qemuu-freebsd11-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-qemuu-freebsd12-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-xtf-amd64-amd64-5:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-libvirt-pair:host-install/src_host(6):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-libvirt-pair:host-install/dst_host(7):broken:heisenbug
    xen-4.14-testing:test-xtf-amd64-amd64-2:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-migrupgrade:host-install/src_host(6):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-dom0pvh-xl-intel:host-install(5):broken:heisenbug
    xen-4.14-testing:test-xtf-amd64-amd64-4:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-shadow:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-pvhv2-intel:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-credit1:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-migrupgrade:host-install/dst_host(7):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-xtf-amd64-amd64-1:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-credit2:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-rtds:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl-seattle:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qcow2:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-livepatch:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl-credit1:host-install(5):broken:heisenbug
    xen-4.14-testing:test-xtf-amd64-amd64-3:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl-vhd:host-install(5):broken:heisenbug
    xen-4.14-testing:test-arm64-arm64-xl-credit2:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-amd64-pygrub:host-install(5):broken:heisenbug
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=10b09aa2541de4c3c49b9343e9bc04e19f0ae4f8
X-Osstest-Versions-That:
    xen=ca304edd3ba8c19211107fd2e898249987557ce5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Mar 2022 16:58:28 +0000

flight 168872 xen-4.14-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168872/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-raw    <job status>                 broken
 test-arm64-arm64-libvirt-xsm    <job status>                 broken
 test-arm64-arm64-xl             <job status>                 broken
 test-arm64-arm64-xl-credit1     <job status>                 broken
 test-arm64-arm64-xl-credit2     <job status>                 broken
 test-arm64-arm64-xl-seattle     <job status>                 broken
 test-arm64-arm64-xl-thunderx    <job status>                 broken
 test-arm64-arm64-xl-vhd         <job status>                 broken
 test-arm64-arm64-xl-xsm         <job status>                 broken
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
 test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qcow2       <job status>                 broken
 test-amd64-amd64-xl-pvshim      <job status>                 broken
 build-i386                      <job status>                 broken
 test-amd64-amd64-xl-pvhv2-intel    <job status>                 broken
 build-i386-prev                 <job status>                 broken
 test-amd64-amd64-xl-pvhv2-amd    <job status>                 broken
 build-i386-pvops                <job status>                 broken
 test-amd64-amd64-xl-multivcpu    <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-amd    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-xl-credit2     <job status>                 broken
 test-amd64-amd64-libvirt        <job status>                 broken
 test-amd64-amd64-libvirt-pair    <job status>                 broken
 test-amd64-amd64-xl-credit1     <job status>                 broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-vhd    <job status>                 broken
 test-amd64-amd64-xl             <job status>                 broken
 test-amd64-amd64-libvirt-xsm    <job status>                 broken
 test-amd64-amd64-livepatch      <job status>                 broken
 test-amd64-amd64-qemuu-nested-intel    <job status>                 broken
 test-amd64-amd64-migrupgrade    <job status>                 broken
 test-amd64-amd64-pair           <job status>                 broken
 test-amd64-amd64-qemuu-nested-amd    <job status>                 broken
 test-amd64-amd64-pygrub         <job status>                 broken
 test-amd64-amd64-qemuu-freebsd11-amd64    <job status>                 broken
 test-amd64-amd64-qemuu-freebsd12-amd64    <job status>                 broken
 test-xtf-amd64-amd64-1          <job status>                 broken
 test-xtf-amd64-amd64-2          <job status>                 broken
 test-xtf-amd64-amd64-3          <job status>                 broken
 test-xtf-amd64-amd64-4          <job status>                 broken
 test-xtf-amd64-amd64-5          <job status>                 broken
 build-i386-prev               4 host-install(4)        broken REGR. vs. 168506
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 168506
 build-i386                    4 host-install(4)        broken REGR. vs. 168506
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 168506
 test-amd64-amd64-livepatch   13 livepatch-run  fail in 168862 REGR. vs. 168506
 test-amd64-amd64-xl-qcow2 19 guest-localmigrate/x10 fail in 168862 REGR. vs. 168506
 test-amd64-i386-livepatch    13 livepatch-run  fail in 168862 REGR. vs. 168506

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt      5 host-install(5)          broken pass in 168862
 test-amd64-amd64-qemuu-nested-intel  5 host-install(5)   broken pass in 168862
 test-amd64-amd64-xl-pvshim    5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-qemuu-ws16-amd64  5 host-install(5)  broken pass in 168862
 test-amd64-amd64-pair         6 host-install/src_host(6) broken pass in 168862
 test-amd64-amd64-pair         7 host-install/dst_host(7) broken pass in 168862
 test-amd64-amd64-dom0pvh-xl-amd  5 host-install(5)       broken pass in 168862
 test-amd64-amd64-xl-pvhv2-amd  5 host-install(5)         broken pass in 168862
 test-amd64-amd64-xl-multivcpu  5 host-install(5)         broken pass in 168862
 test-amd64-coresched-amd64-xl  5 host-install(5)         broken pass in 168862
 test-amd64-amd64-qemuu-freebsd11-amd64 5 host-install(5) broken pass in 168862
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)     broken pass in 168862
 test-amd64-amd64-qemuu-freebsd12-amd64 5 host-install(5) broken pass in 168862
 test-xtf-amd64-amd64-5        5 host-install(5)          broken pass in 168862
 test-amd64-amd64-libvirt-pair 6 host-install/src_host(6) broken pass in 168862
 test-amd64-amd64-libvirt-pair 7 host-install/dst_host(7) broken pass in 168862
 test-xtf-amd64-amd64-2        5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl           5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 5 host-install(5) broken pass in 168862
 test-amd64-amd64-xl-qemut-win7-amd64  5 host-install(5)  broken pass in 168862
 test-amd64-amd64-migrupgrade  6 host-install/src_host(6) broken pass in 168862
 test-amd64-amd64-dom0pvh-xl-intel  5 host-install(5)     broken pass in 168862
 test-xtf-amd64-amd64-4        5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-shadow    5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-qemut-ws16-amd64  5 host-install(5)  broken pass in 168862
 test-amd64-amd64-xl-pvhv2-intel  5 host-install(5)       broken pass in 168862
 test-amd64-amd64-xl-credit1   5 host-install(5)          broken pass in 168862
 test-amd64-amd64-libvirt-xsm  5 host-install(5)          broken pass in 168862
 test-amd64-amd64-migrupgrade  7 host-install/dst_host(7) broken pass in 168862
 test-amd64-amd64-xl-xsm       5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-qemuu-win7-amd64  5 host-install(5)  broken pass in 168862
 test-xtf-amd64-amd64-1        5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-credit2   5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-rtds      5 host-install(5)          broken pass in 168862
 test-arm64-arm64-xl-seattle   5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-qcow2     5 host-install(5)          broken pass in 168862
 test-amd64-amd64-livepatch    5 host-install(5)          broken pass in 168862
 test-arm64-arm64-libvirt-xsm  5 host-install(5)          broken pass in 168862
 test-arm64-arm64-xl-credit1   5 host-install(5)          broken pass in 168862
 test-xtf-amd64-amd64-3        5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken pass in 168862
 test-amd64-amd64-libvirt-vhd  5 host-install(5)          broken pass in 168862
 test-amd64-amd64-xl-qemut-debianhvm-amd64 5 host-install(5) broken pass in 168862
 test-amd64-amd64-xl-qemuu-ovmf-amd64  5 host-install(5)  broken pass in 168862
 test-arm64-arm64-xl           5 host-install(5)          broken pass in 168862
 test-arm64-arm64-xl-xsm       5 host-install(5)          broken pass in 168862
 test-arm64-arm64-xl-thunderx  5 host-install(5)          broken pass in 168862
 test-arm64-arm64-libvirt-raw  5 host-install(5)          broken pass in 168862
 test-arm64-arm64-xl-vhd       5 host-install(5)          broken pass in 168862
 test-arm64-arm64-xl-credit2   5 host-install(5)          broken pass in 168862
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken pass in 168862
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 5 host-install(5) broken pass in 168862
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken pass in 168862
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken pass in 168862
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 5 host-install(5) broken pass in 168862
 test-amd64-amd64-pygrub       5 host-install(5)          broken pass in 168862

Tests which did not succeed, but are not blocking:
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemut-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemut-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemut-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail in 168862 like 168506
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop   fail in 168862 like 168506
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop  fail in 168862 like 168506
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop  fail in 168862 like 168506
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop   fail in 168862 like 168506
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop  fail in 168862 like 168506
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop  fail in 168862 like 168506
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop   fail in 168862 like 168506
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop   fail in 168862 like 168506
 test-amd64-i386-libvirt-xsm 15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 168862 never pass
 test-amd64-amd64-libvirt    15 migrate-support-check fail in 168862 never pass
 test-amd64-i386-libvirt     15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-credit2 15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-credit2 16 saverestore-support-check fail in 168862 never pass
 test-arm64-arm64-xl-seattle 15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-seattle 16 saverestore-support-check fail in 168862 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 168862 never pass
 test-amd64-i386-xl-pvshim    14 guest-start          fail in 168862 never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check fail in 168862 never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail in 168862 never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 168862 never pass
 test-arm64-arm64-xl-credit1 15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-credit1 16 saverestore-support-check fail in 168862 never pass
 test-arm64-arm64-xl         15 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl     16 saverestore-support-check fail in 168862 never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check fail in 168862 never pass
 test-amd64-i386-libvirt-raw 14 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 168862 never pass
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 168862 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 168862 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168506
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168506
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168506
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  10b09aa2541de4c3c49b9343e9bc04e19f0ae4f8
baseline version:
 xen                  ca304edd3ba8c19211107fd2e898249987557ce5

Last test of basis   168506  2022-03-10 14:16:31 Z   17 days
Testing same since   168862  2022-03-25 17:36:39 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bjoern Doebel <doebel@amazon.de>
  Jan Beulich <jbeulich@suse.com>
  Jiamei Xie <jiamei.xie@arm.com>
  Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Thiner Logoer <logoerthiner1@163.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             pass    
 build-i386-prev                                              broken  
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-xtf-amd64-amd64-1                                       broken  
 test-xtf-amd64-amd64-2                                       broken  
 test-xtf-amd64-amd64-3                                       broken  
 test-xtf-amd64-amd64-4                                       broken  
 test-xtf-amd64-amd64-5                                       broken  
 test-amd64-amd64-xl                                          broken  
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          broken  
 test-armhf-armhf-xl                                          pass    
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
 test-arm64-arm64-libvirt-xsm                                 broken  
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      broken  
 test-arm64-arm64-xl-xsm                                      broken  
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  broken  
 test-arm64-arm64-xl-credit1                                  broken  
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  broken  
 test-arm64-arm64-xl-credit2                                  broken  
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        broken  
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          broken  
 test-amd64-amd64-xl-pvhv2-intel                              broken  
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     broken  
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   broken  
 test-amd64-i386-livepatch                                    blocked 
 test-amd64-amd64-migrupgrade                                 broken  
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                broken  
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        broken  
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                broken  
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   broken  
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      broken  
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    broken  
 test-arm64-arm64-libvirt-raw                                 broken  
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     broken  
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             broken  
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   broken  
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 broken  
 test-amd64-amd64-libvirt-vhd                                 broken  
 test-arm64-arm64-xl-vhd                                      broken  
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       blocked 


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

broken-job test-arm64-arm64-libvirt-raw broken
broken-job test-arm64-arm64-libvirt-xsm broken
broken-job test-arm64-arm64-xl broken
broken-job test-arm64-arm64-xl-credit1 broken
broken-job test-arm64-arm64-xl-credit2 broken
broken-job test-arm64-arm64-xl-seattle broken
broken-job test-arm64-arm64-xl-thunderx broken
broken-job test-arm64-arm64-xl-vhd broken
broken-job test-arm64-arm64-xl-xsm broken
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
broken-job test-amd64-amd64-xl-qemut-debianhvm-amd64 broken
broken-job test-amd64-amd64-xl-qcow2 broken
broken-job test-amd64-amd64-xl-pvshim broken
broken-job build-i386 broken
broken-job test-amd64-amd64-xl-pvhv2-intel broken
broken-job build-i386-prev broken
broken-job test-amd64-amd64-xl-pvhv2-amd broken
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-multivcpu broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-dom0pvh-xl-amd broken
broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-job test-amd64-amd64-xl-credit2 broken
broken-job test-amd64-amd64-libvirt broken
broken-job test-amd64-amd64-libvirt-pair broken
broken-job test-amd64-amd64-xl-credit1 broken
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-job test-amd64-amd64-libvirt-vhd broken
broken-job test-amd64-amd64-xl broken
broken-job test-amd64-amd64-libvirt-xsm broken
broken-job test-amd64-amd64-livepatch broken
broken-job test-amd64-amd64-qemuu-nested-intel broken
broken-job test-amd64-amd64-migrupgrade broken
broken-job test-amd64-amd64-pair broken
broken-job test-amd64-amd64-qemuu-nested-amd broken
broken-job test-amd64-amd64-pygrub broken
broken-job test-amd64-amd64-qemuu-freebsd11-amd64 broken
broken-job test-amd64-amd64-qemuu-freebsd12-amd64 broken
broken-job test-xtf-amd64-amd64-1 broken
broken-job test-xtf-amd64-amd64-2 broken
broken-job test-xtf-amd64-amd64-3 broken
broken-job test-xtf-amd64-amd64-4 broken
broken-job test-xtf-amd64-amd64-5 broken
broken-step test-amd64-amd64-libvirt host-install(5)
broken-step test-amd64-amd64-qemuu-nested-intel host-install(5)
broken-step test-amd64-amd64-xl-pvshim host-install(5)
broken-step build-i386-prev host-install(4)
broken-step test-amd64-amd64-xl-qemuu-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-pair host-install/src_host(6)
broken-step test-amd64-amd64-pair host-install/dst_host(7)
broken-step test-amd64-amd64-dom0pvh-xl-amd host-install(5)
broken-step build-i386-xsm host-install(4)
broken-step test-amd64-amd64-xl-pvhv2-amd host-install(5)
broken-step test-amd64-amd64-xl-multivcpu host-install(5)
broken-step test-amd64-coresched-amd64-xl host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd11-amd64 host-install(5)
broken-step test-amd64-amd64-qemuu-nested-amd host-install(5)
broken-step test-amd64-amd64-qemuu-freebsd12-amd64 host-install(5)
broken-step test-xtf-amd64-amd64-5 host-install(5)
broken-step test-amd64-amd64-libvirt-pair host-install/src_host(6)
broken-step test-amd64-amd64-libvirt-pair host-install/dst_host(7)
broken-step test-xtf-amd64-amd64-2 host-install(5)
broken-step test-amd64-amd64-xl host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemut-win7-amd64 host-install(5)
broken-step test-amd64-amd64-migrupgrade host-install/src_host(6)
broken-step test-amd64-amd64-dom0pvh-xl-intel host-install(5)
broken-step test-xtf-amd64-amd64-4 host-install(5)
broken-step test-amd64-amd64-xl-shadow host-install(5)
broken-step test-amd64-amd64-xl-qemut-ws16-amd64 host-install(5)
broken-step test-amd64-amd64-xl-pvhv2-intel host-install(5)
broken-step test-amd64-amd64-xl-credit1 host-install(5)
broken-step test-amd64-amd64-libvirt-xsm host-install(5)
broken-step test-amd64-amd64-migrupgrade host-install/dst_host(7)
broken-step test-amd64-amd64-xl-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-win7-amd64 host-install(5)
broken-step test-xtf-amd64-amd64-1 host-install(5)
broken-step test-amd64-amd64-xl-credit2 host-install(5)
broken-step test-amd64-amd64-xl-rtds host-install(5)
broken-step test-arm64-arm64-xl-seattle host-install(5)
broken-step test-amd64-amd64-xl-qcow2 host-install(5)
broken-step test-amd64-amd64-livepatch host-install(5)
broken-step test-arm64-arm64-libvirt-xsm host-install(5)
broken-step test-arm64-arm64-xl-credit1 host-install(5)
broken-step test-xtf-amd64-amd64-3 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-libvirt-vhd host-install(5)
broken-step build-i386 host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step test-amd64-amd64-xl-qemut-debianhvm-amd64 host-install(5)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step test-arm64-arm64-xl host-install(5)
broken-step test-arm64-arm64-xl-xsm host-install(5)
broken-step test-arm64-arm64-xl-thunderx host-install(5)
broken-step test-arm64-arm64-libvirt-raw host-install(5)
broken-step test-arm64-arm64-xl-vhd host-install(5)
broken-step test-arm64-arm64-xl-credit2 host-install(5)
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict host-install(5)
broken-step test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-xl-qemut-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-amd64-pygrub host-install(5)

Not pushing.

(No revision log; it would be 394 lines long.)

