Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6527A44E
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 23:52:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMeZz-0007jj-RB; Sun, 27 Sep 2020 21:51:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mno3=DE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMeZy-0007j6-IA
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 21:51:34 +0000
X-Inumbo-ID: e29a2d57-5171-4995-9137-b59dd82ee4c4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e29a2d57-5171-4995-9137-b59dd82ee4c4;
 Sun, 27 Sep 2020 21:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=klCf0SMqthyOUV7KyhDuf+mspLo+8RqC32RWYkTvFiQ=; b=o/j9sE0lsicBEVYCd3jcIbfFe0
 JBrpnAcWffCH4ijVy267idS85Yhgmg9wwr2z+qMCtHkJ6+gvI7F+/GhW3iYpX++Mf5KGH6Hoy0jIv
 wUXRHSbBWW8KG9ZRAWsIj5EVOIlxQUR6+vTtZ2bJRXHOgd89MD8XmiDH1tbsZPevdcSQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMeZu-0006Hx-0d; Sun, 27 Sep 2020 21:51:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMeZt-0002WZ-Ne; Sun, 27 Sep 2020 21:51:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMeZt-0005aD-N6; Sun, 27 Sep 2020 21:51:29 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154956-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 154956: trouble: blocked/broken
X-Osstest-Failures: linux-5.4:build-amd64:<job status>:broken:regression
 linux-5.4:build-amd64-pvops:<job status>:broken:regression
 linux-5.4:build-amd64-xsm:<job status>:broken:regression
 linux-5.4:build-arm64:<job status>:broken:regression
 linux-5.4:build-arm64-pvops:<job status>:broken:regression
 linux-5.4:build-arm64-xsm:<job status>:broken:regression
 linux-5.4:build-armhf:<job status>:broken:regression
 linux-5.4:build-armhf-pvops:<job status>:broken:regression
 linux-5.4:build-i386:<job status>:broken:regression
 linux-5.4:build-i386-pvops:<job status>:broken:regression
 linux-5.4:build-i386-xsm:<job status>:broken:regression
 linux-5.4:build-i386-xsm:host-install(4):broken:regression
 linux-5.4:build-i386:host-install(4):broken:regression
 linux-5.4:build-i386-pvops:host-install(4):broken:regression
 linux-5.4:build-arm64:host-install(4):broken:regression
 linux-5.4:build-arm64-xsm:host-install(4):broken:regression
 linux-5.4:build-arm64-pvops:host-install(4):broken:regression
 linux-5.4:build-amd64-xsm:host-install(4):broken:regression
 linux-5.4:build-amd64-pvops:host-install(4):broken:regression
 linux-5.4:build-amd64:host-install(4):broken:regression
 linux-5.4:build-armhf-pvops:host-install(4):broken:regression
 linux-5.4:build-armhf:host-install(4):broken:regression
 linux-5.4:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-examine:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-5.4:build-amd64-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:build-arm64-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:build-armhf-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:build-i386-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: linux=5d087e3578cf9cbd850a6f0a5c8b8169f22b5272
X-Osstest-Versions-That: linux=a4bea6a4f1e0e5132fdedb5c0a74cbba696342fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Sep 2020 21:51:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154956 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154956/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf                     <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 154718
 build-i386                    4 host-install(4)        broken REGR. vs. 154718
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 154718
 build-arm64                   4 host-install(4)        broken REGR. vs. 154718
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 154718
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 154718
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 154718
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 154718
 build-amd64                   4 host-install(4)        broken REGR. vs. 154718
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 154718
 build-armhf                   4 host-install(4)        broken REGR. vs. 154718

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
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
 test-amd64-i386-examine       1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
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

version targeted for testing:
 linux                5d087e3578cf9cbd850a6f0a5c8b8169f22b5272
baseline version:
 linux                a4bea6a4f1e0e5132fdedb5c0a74cbba696342fd

Last test of basis   154718  2020-09-24 19:06:39 Z    3 days
Testing same since   154908  2020-09-26 16:09:32 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Morton <akpm@linux-foundation.org>
  Chengming Zhou <zhouchengming@bytedance.com>
  Chris Down <chris@chrisdown.name>
  Cong Wang <xiyou.wangcong@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dany Madden <drt@linux.ibm.com>
  David Ahern <dsahern@gmail.com>
  David Ahern <dsahern@kernel.org>
  David S. Miller <davem@davemloft.net>
  Edwin Peer <edwin.peer@broadcom.com>
  Eric Dumazet <edumazet@google.com>
  Erik Rockstrom <erik.rockstrom@oracle.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Ganji Aravind <ganji.aravind@chelsio.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hauke Mehrtens <hauke@hauke-m.de>
  Henry Ptasinski <hptasinski@google.com>
  Ido Schimmel <idosch@nvidia.com>
  Jakub Kicinski <kuba@kernel.org>
  Joerg Roedel <jroedel@suse.de>
  Johannes Weiner <hannes@cmpxchg.org>
  Jon Hunter <jonathanh@nvidia.com>
  Julius Hemanth Pitti <jpitti@cisco.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Maor Dickman <maord@mellanox.com>
  Maor Gottlieb <maorg@nvidia.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Mark Gray <mark.d.gray@redhat.com>
  Mark Salyzyn <salyzyn@android.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Michael Chan <michael.chan@broadcom.com>
  Michal Hocko <mhocko@suse.com>
  Mingming Cao <mmc@linux.vnet.ibm.com>
  Muchun Song <songmuchun@bytedance.com>
  Necip Fazil Yildiran <fazilyildiran@gmail.com>
  Peilin Ye <yepeilin.cs@gmail.com>
  Petr Machata <petrm@nvidia.com>
  Qiuyu Xiao <qiuyu.xiao.qyx@gmail.com>
  Raju Rangoju <rajur@chelsio.com>
  Ralph Campbell <rcampbell@nvidia.com>
  Saeed Mahameed <saeedm@mellanox.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sasha Levin <sashal@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  Tariq Toukan <tariqt@mellanox.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Vasundhara Volam <vasundhara-v.volam@broadcom.com>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wei Wang <weiwan@google.com>
  Xin Long <lucien.xin@gmail.com>
  Xunlei Pang <xlpang@linux.alibaba.com>
  Ying Xue <ying.xue@windriver.com>
  Yunsheng Lin <linyunsheng@huawei.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemut-rhel6hvm-amd                           blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemut-debianhvm-amd64                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         blocked 
 test-amd64-i386-xl-qemut-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemut-ws16-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-i386-examine                                      blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-armhf broken
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 1420 lines long.)

