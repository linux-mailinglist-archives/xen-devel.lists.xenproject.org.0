Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA98A50AB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 15:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706203.1103290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwMAA-0000BE-JM; Mon, 15 Apr 2024 13:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706203.1103290; Mon, 15 Apr 2024 13:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwMAA-00009Y-FQ; Mon, 15 Apr 2024 13:14:22 +0000
Received: by outflank-mailman (input) for mailman id 706203;
 Mon, 15 Apr 2024 13:14:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwMA9-00009O-2Z; Mon, 15 Apr 2024 13:14:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwMA8-0004sd-RO; Mon, 15 Apr 2024 13:14:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwMA8-0005Uk-JI; Mon, 15 Apr 2024 13:14:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwMA8-0003Nn-Il; Mon, 15 Apr 2024 13:14:20 +0000
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
	bh=j9Z7vSi2X9IAHORMuk5ZqKXUsR0Ygum9FNY2YjaDHGo=; b=1y2wD5B5Jos+K56I6wNkjVsqJs
	tMqMbxSe1IKVxmECkppRNzMi4hO1ctapw91iBJnKeSb3tBkRYWJPhUx3NHCYQzqKIB5z3IANiba/i
	VghewHj3oE+eiIr4fW9pFpZt3vKDWrrq6XjqoRSJsTvmD/w+H0zZ/Bg1GnUefM0doXNE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185595-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 185595: regressions - trouble: blocked/broken
X-Osstest-Failures:
    linux-6.1:build-amd64:<job status>:broken:regression
    linux-6.1:build-amd64-pvops:<job status>:broken:regression
    linux-6.1:build-amd64-xsm:<job status>:broken:regression
    linux-6.1:build-arm64:<job status>:broken:regression
    linux-6.1:build-arm64-pvops:<job status>:broken:regression
    linux-6.1:build-arm64-xsm:<job status>:broken:regression
    linux-6.1:build-armhf:<job status>:broken:regression
    linux-6.1:build-armhf-pvops:<job status>:broken:regression
    linux-6.1:build-i386:<job status>:broken:regression
    linux-6.1:build-i386-pvops:<job status>:broken:regression
    linux-6.1:build-i386-xsm:<job status>:broken:regression
    linux-6.1:build-amd64-pvops:host-build-prep:fail:regression
    linux-6.1:build-amd64:host-build-prep:fail:regression
    linux-6.1:build-amd64-xsm:host-build-prep:fail:regression
    linux-6.1:build-i386:host-build-prep:fail:regression
    linux-6.1:build-armhf-pvops:host-build-prep:fail:regression
    linux-6.1:build-i386-pvops:host-build-prep:fail:regression
    linux-6.1:build-i386-xsm:host-build-prep:fail:regression
    linux-6.1:build-arm64:host-build-prep:fail:regression
    linux-6.1:build-arm64-xsm:host-build-prep:fail:regression
    linux-6.1:build-arm64-pvops:host-build-prep:fail:regression
    linux-6.1:build-armhf:host-build-prep:fail:regression
    linux-6.1:test-amd64-amd64-xl-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-6.1:build-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-6.1:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    linux-6.1:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    linux-6.1:build-i386-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-examine-bios:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-examine-uefi:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    linux=cd5d98c0556cd790f78a3ba26afc9d2f896163e4
X-Osstest-Versions-That:
    linux=bf1e3b1cb1e002ed1590c91f1a24433b59322368
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Apr 2024 13:14:20 +0000

flight 185595 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185595/

Regressions :-(

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
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 185299
 build-amd64                   5 host-build-prep          fail REGR. vs. 185299
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 185299
 build-i386                    5 host-build-prep          fail REGR. vs. 185299
 build-armhf-pvops             5 host-build-prep          fail REGR. vs. 185299
 build-i386-pvops              5 host-build-prep          fail REGR. vs. 185299
 build-i386-xsm                5 host-build-prep          fail REGR. vs. 185299
 build-arm64                   5 host-build-prep          fail REGR. vs. 185299
 build-arm64-xsm               5 host-build-prep          fail REGR. vs. 185299
 build-arm64-pvops             5 host-build-prep          fail REGR. vs. 185299
 build-armhf                   5 host-build-prep          fail REGR. vs. 185299

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
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
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-bios  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-uefi  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
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

version targeted for testing:
 linux                cd5d98c0556cd790f78a3ba26afc9d2f896163e4
baseline version:
 linux                bf1e3b1cb1e002ed1590c91f1a24433b59322368

Last test of basis   185299  2024-04-10 14:42:59 Z    4 days
Testing same since   185434  2024-04-13 11:42:42 Z    2 days    6 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alban Boyé <alban.boye@protonmail.com>
  Aleksandr Burakov <a.burakov@rosalinux.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Henrie <alexhenrie24@gmail.com>
  Andrew Lunn <andrew@lunn.ch>
  Ard Biesheuvel <ardb@kernel.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Aric Cyr <aric.cyr@amd.com>
  Arnd Bergmann <arnd@arndb.de>
  Baochen Qiang <quic_bqiang@quicinc.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bo Ye <bo.ye@mediatek.com>
  Boqun Feng <boqun.feng@gmail.com>
  C Cheng <C.Cheng@mediatek.com>
  Chancel Liu <chancel.liu@nxp.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Colin Ian King <colin.i.king@gmail.com>
  Dai Ngo <dai.ngo@oracle.com>
  Daniel Drake <drake@endlessos.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Duje Mihanović <duje.mihanovic@skole.hr>
  Edward Adam Davis <eadavis@qq.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gergo Koteles <soyer@irl.hu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gwendal Grignou <gwendal@chromium.org>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Ian Rogers <irogers@google.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeffrey Hugo <quic_jhugo@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jian-Hong Pan <jhp@endlessos.org>
  Jiawei Fu (iBug) <i@ibugone.com>
  Jiawei Fu <i@ibugone.com>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  John Ogness <john.ogness@linutronix.de>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Justin Tee <justin.tee@broadcom.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karel Balej <balejk@matfyz.cz>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kelsey Steele <kelseysteele@linux.microsoft.com>
  kernelci.org bot <bot@kernelci.org>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Leon Romanovsky <leon@kernel.org>
  linke li <lilinke99@qq.com>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Jun <Jun.Ma2@amd.com>
  Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Manjunath Patil <manjunath.b.patil@oracle.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Markus Elfring <elfring@users.sourceforge.net>
  Markuss Broks <markuss.broks@gmail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Maxime Ripard <mripard@kernel.org>
  Maíra Canal <mcanal@igalia.com>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael S. Tsirkin <mst@redhat.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Marshall <hubcap@omnibond.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  mosomate <mosomate@gmail.com>
  Mukesh Sisodiya <mukesh.sisodiya@intel.com>
  Máté Mosonyi <mosomate@gmail.com>
  Namhyung Kim <namhyung@kernel.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Machek (CIP) <pavel@denx.de>
  Petr Mladek <pmladek@suse.com>
  Petre Rodan <petre.rodan@subdimension.ro>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Ricardo B. Marliere <ricardo@marliere.net>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Ron Economos <re@w6rz.net>
  Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
  Samuel Dionne-Riel <samuel@dionne-riel.com>
  Sandipan Das <sandipan.das@amd.com>
  Sasha Levin <sashal@kernel.org>
  SeongJae Park <sj@kernel.org>
  Serge Semin <fancer.lancer@gmail.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tasos Sahanidis <tasos@tasossah.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vasiliy Kovalev <kovalev@altlinux.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Ye Bin <yebin10@huawei.com>
  Zhang Yi <yi.zhang@huawei.com>

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
 test-amd64-amd64-examine-bios                                blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
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
 test-amd64-amd64-examine-uefi                                blocked 
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

Not pushing.

(No revision log; it would be 2250 lines long.)

