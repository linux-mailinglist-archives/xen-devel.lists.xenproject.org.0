Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B717E8A4398
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 17:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705627.1102436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rw2A5-0007jC-R7; Sun, 14 Apr 2024 15:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705627.1102436; Sun, 14 Apr 2024 15:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rw2A5-0007gl-OC; Sun, 14 Apr 2024 15:52:57 +0000
Received: by outflank-mailman (input) for mailman id 705627;
 Sun, 14 Apr 2024 15:52:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rw2A3-0007gb-Tb; Sun, 14 Apr 2024 15:52:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rw2A3-0003m3-H4; Sun, 14 Apr 2024 15:52:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rw2A3-0003eX-5j; Sun, 14 Apr 2024 15:52:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rw2A3-00079R-5L; Sun, 14 Apr 2024 15:52:55 +0000
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
	bh=wcNdecXfjg00k7KPFGdL8Vy3/owfQwoAdyvnZ6QAx7M=; b=DLEBOLOU8jA8vuIOcMQbege3SE
	td0FjMBMS23ouTqPpd4W5p8yGGf2WNRcWNi24zS+H/EHRR+5uCLHbXwauh5GUXxxrBA99V78sXQud
	xOkvkw4gJNJcajqy5A9UdIj7F3dSrQkHua4/QBSYUim/uYWv9W1vYDh1RnjR79R3yxX0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185473-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.18-testing test] 185473: regressions - trouble: blocked/broken
X-Osstest-Failures:
    xen-4.18-testing:build-amd64:<job status>:broken:regression
    xen-4.18-testing:build-amd64-prev:<job status>:broken:regression
    xen-4.18-testing:build-amd64-pvops:<job status>:broken:regression
    xen-4.18-testing:build-amd64-xsm:<job status>:broken:regression
    xen-4.18-testing:build-amd64-xtf:<job status>:broken:regression
    xen-4.18-testing:build-arm64:<job status>:broken:regression
    xen-4.18-testing:build-arm64-pvops:<job status>:broken:regression
    xen-4.18-testing:build-arm64-xsm:<job status>:broken:regression
    xen-4.18-testing:build-armhf:<job status>:broken:regression
    xen-4.18-testing:build-armhf-pvops:<job status>:broken:regression
    xen-4.18-testing:build-i386:<job status>:broken:regression
    xen-4.18-testing:build-i386-prev:<job status>:broken:regression
    xen-4.18-testing:build-i386-pvops:<job status>:broken:regression
    xen-4.18-testing:build-i386-xsm:<job status>:broken:regression
    xen-4.18-testing:build-i386-xsm:host-build-prep:fail:regression
    xen-4.18-testing:build-i386-pvops:host-build-prep:fail:regression
    xen-4.18-testing:build-amd64-prev:host-build-prep:fail:regression
    xen-4.18-testing:build-amd64:host-build-prep:fail:regression
    xen-4.18-testing:build-amd64-xtf:host-build-prep:fail:regression
    xen-4.18-testing:build-amd64-pvops:host-build-prep:fail:regression
    xen-4.18-testing:build-armhf-pvops:host-build-prep:fail:regression
    xen-4.18-testing:build-i386-prev:host-build-prep:fail:regression
    xen-4.18-testing:build-amd64-xsm:host-build-prep:fail:regression
    xen-4.18-testing:build-arm64:host-build-prep:fail:regression
    xen-4.18-testing:build-i386:host-build-prep:fail:regression
    xen-4.18-testing:build-arm64-xsm:host-build-prep:fail:regression
    xen-4.18-testing:build-arm64-pvops:host-build-prep:fail:regression
    xen-4.18-testing:build-armhf:host-build-prep:fail:regression
    xen-4.18-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-raw:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    xen-4.18-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    xen-4.18-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.18-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
    xen-4.18-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=2d38302c33b117aa9a417056db241aefc840c2f0
X-Osstest-Versions-That:
    xen=1166467ed300d605529aaf7a7d26c8c92defe36a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Apr 2024 15:52:55 +0000

flight 185473 xen-4.18-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185473/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-prev                <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-amd64-xtf                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-prev                 <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-xsm                5 host-build-prep          fail REGR. vs. 185285
 build-i386-pvops              5 host-build-prep          fail REGR. vs. 185285
 build-amd64-prev              5 host-build-prep          fail REGR. vs. 185285
 build-amd64                   5 host-build-prep          fail REGR. vs. 185285
 build-amd64-xtf               5 host-build-prep          fail REGR. vs. 185285
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 185285
 build-armhf-pvops             5 host-build-prep          fail REGR. vs. 185285
 build-i386-prev               5 host-build-prep          fail REGR. vs. 185285
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 185285
 build-arm64                   5 host-build-prep          fail REGR. vs. 185285
 build-i386                    5 host-build-prep          fail REGR. vs. 185285
 build-arm64-xsm               5 host-build-prep          fail REGR. vs. 185285
 build-arm64-pvops             5 host-build-prep          fail REGR. vs. 185285
 build-armhf                   5 host-build-prep          fail REGR. vs. 185285

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-raw       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  2d38302c33b117aa9a417056db241aefc840c2f0
baseline version:
 xen                  1166467ed300d605529aaf7a7d26c8c92defe36a

Last test of basis   185285  2024-04-09 12:07:14 Z    5 days
Failing since        185303  2024-04-10 18:41:55 Z    3 days    4 attempts
Testing same since   185337  2024-04-12 01:37:11 Z    2 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Paul Durrant <paul@xen.org>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64-xtf                                              broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-prev                                             broken  
 build-i386-prev                                              broken  
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-xtf-amd64-amd64-1                                       blocked 
 test-xtf-amd64-amd64-2                                       blocked 
 test-xtf-amd64-amd64-3                                       blocked 
 test-xtf-amd64-amd64-4                                       blocked 
 test-xtf-amd64-amd64-5                                       blocked 
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-livepatch                                   blocked 
 test-amd64-amd64-migrupgrade                                 blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      blocked 
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      blocked 
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

broken-job build-amd64 broken
broken-job build-amd64-prev broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-amd64-xtf broken
broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job build-i386-prev broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken

Not pushing.

(No revision log; it would be 713 lines long.)

