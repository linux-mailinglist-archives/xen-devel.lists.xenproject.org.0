Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295FB278711
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 14:23:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLmks-0006KI-DC; Fri, 25 Sep 2020 12:23:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5R+H=DC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kLmkq-0006KB-Dx
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 12:23:12 +0000
X-Inumbo-ID: bfc90144-a661-4d57-86ca-1848935b96ac
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfc90144-a661-4d57-86ca-1848935b96ac;
 Fri, 25 Sep 2020 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=Es34VH4cXRu5klzEvzhSTxJtXLLyUULXeOYhgJ3Tq7k=; b=qNiHQL5/i2zfgbRXvPckJ2gLDt
 rhj36s5P1MVqFz+6yNMYrh86Cm238lN/51fdkWrscrs9jtfaNG4Dv17tesCs+DJMMW0satyXjvm5g
 0MSzaUNfzlYdLztkOCfVm+C2+R0jfzRGEdk5Ds2Y+3DJBmdcfL4UVaePgGBivINPK5VM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLmkn-0001yN-Nt; Fri, 25 Sep 2020 12:23:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLmkn-000666-F1; Fri, 25 Sep 2020 12:23:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kLmkn-0004lM-EW; Fri, 25 Sep 2020 12:23:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154750-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.10-testing test] 154750: trouble: blocked/broken
X-Osstest-Failures: xen-4.10-testing:build-amd64:<job status>:broken:regression
 xen-4.10-testing:build-amd64-prev:<job status>:broken:regression
 xen-4.10-testing:build-amd64-pvops:<job status>:broken:regression
 xen-4.10-testing:build-amd64-xsm:<job status>:broken:regression
 xen-4.10-testing:build-amd64-xtf:<job status>:broken:regression
 xen-4.10-testing:build-arm64:<job status>:broken:regression
 xen-4.10-testing:build-arm64-pvops:<job status>:broken:regression
 xen-4.10-testing:build-arm64-xsm:<job status>:broken:regression
 xen-4.10-testing:build-armhf:<job status>:broken:regression
 xen-4.10-testing:build-armhf-pvops:<job status>:broken:regression
 xen-4.10-testing:build-i386:<job status>:broken:regression
 xen-4.10-testing:build-i386-prev:<job status>:broken:regression
 xen-4.10-testing:build-i386-pvops:<job status>:broken:regression
 xen-4.10-testing:build-i386-xsm:<job status>:broken:regression
 xen-4.10-testing:build-i386-pvops:host-install(4):broken:regression
 xen-4.10-testing:build-i386-prev:host-install(4):broken:regression
 xen-4.10-testing:build-i386:host-install(4):broken:regression
 xen-4.10-testing:build-i386-xsm:host-install(4):broken:regression
 xen-4.10-testing:build-amd64-pvops:host-install(4):broken:regression
 xen-4.10-testing:build-armhf-pvops:host-install(4):broken:regression
 xen-4.10-testing:build-amd64-xsm:host-install(4):broken:regression
 xen-4.10-testing:build-arm64:host-install(4):broken:regression
 xen-4.10-testing:build-arm64-xsm:host-install(4):broken:regression
 xen-4.10-testing:build-arm64-pvops:host-install(4):broken:regression
 xen-4.10-testing:build-amd64:host-install(4):broken:regression
 xen-4.10-testing:build-amd64-xtf:host-install(4):broken:regression
 xen-4.10-testing:build-amd64-prev:host-install(4):broken:regression
 xen-4.10-testing:build-armhf:host-install(4):broken:regression
 xen-4.10-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:build-armhf-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
 xen-4.10-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-livepatch:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-migrupgrade:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-pair:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-qemut-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-qemut-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
 xen-4.10-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: xen=f58caa40cd8c2a3dbed705d90b6a22facc281afb
X-Osstest-Versions-That: xen=93be943e7d759015bd5db41a48f6dce58e580d5a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Sep 2020 12:23:09 +0000
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

flight 154750 xen-4.10-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154750/

Failures and problems with tests :-(

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
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 151728
 build-i386-prev               4 host-install(4)        broken REGR. vs. 151728
 build-i386                    4 host-install(4)        broken REGR. vs. 151728
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 151728
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 151728
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 151728
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 151728
 build-arm64                   4 host-install(4)        broken REGR. vs. 151728
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 151728
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 151728
 build-amd64                   4 host-install(4)        broken REGR. vs. 151728
 build-amd64-xtf               4 host-install(4)        broken REGR. vs. 151728
 build-amd64-prev              4 host-install(4)        broken REGR. vs. 151728
 build-armhf                   4 host-install(4)        broken REGR. vs. 151728

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
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
 test-xtf-amd64-amd64-1        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-2        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-3        1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-livepatch    1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-livepatch     1 build-check(1)               blocked  n/a
 test-amd64-i386-migrupgrade   1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-qemut-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemut-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
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
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-4        1 build-check(1)               blocked  n/a
 test-xtf-amd64-amd64-5        1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  f58caa40cd8c2a3dbed705d90b6a22facc281afb
baseline version:
 xen                  93be943e7d759015bd5db41a48f6dce58e580d5a

Last test of basis   151728  2020-07-08 01:17:09 Z   79 days
Testing same since   154621  2020-09-22 16:07:00 Z    2 days    7 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
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
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
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
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   blocked 
 test-amd64-i386-livepatch                                    blocked 
 test-amd64-amd64-migrupgrade                                 blocked 
 test-amd64-i386-migrupgrade                                  blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
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
broken-step build-i386-pvops host-install(4)
broken-step build-i386-prev host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-armhf-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-xtf host-install(4)
broken-step build-amd64-prev host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 341 lines long.)

