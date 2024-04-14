Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CB8A4192
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 11:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705464.1102243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvwOV-0000sD-1X; Sun, 14 Apr 2024 09:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705464.1102243; Sun, 14 Apr 2024 09:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvwOU-0000qH-Uo; Sun, 14 Apr 2024 09:43:26 +0000
Received: by outflank-mailman (input) for mailman id 705464;
 Sun, 14 Apr 2024 09:43:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvwOT-0000q7-Mc; Sun, 14 Apr 2024 09:43:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvwOT-00057I-L0; Sun, 14 Apr 2024 09:43:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvwOT-0003qs-Dn; Sun, 14 Apr 2024 09:43:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvwOT-00006Z-DH; Sun, 14 Apr 2024 09:43:25 +0000
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
	bh=MI1bIngpQAulE5U7c9DkRr49nHZ5DvSy5CycF33IbWo=; b=cGVB8UeMWYxBLXzQMichmM8J/n
	npWtGhOhXNogCpKcWZwW5w/dtUX8UEJnyRWDVRhULW+TRSmnGOKEw62y+zcF9PyxQG9tin/2TnO2U
	UyVph36ckVF+2aW49Zm/GgQTgSgYS7h7klLWh2sJO3uTSp4BPAzoffu9LOAF4yy+IrBM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185481-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185481: regressions - trouble: blocked/broken
X-Osstest-Failures:
    linux-linus:build-amd64:<job status>:broken:regression
    linux-linus:build-amd64-pvops:<job status>:broken:regression
    linux-linus:build-amd64-xsm:<job status>:broken:regression
    linux-linus:build-arm64:<job status>:broken:regression
    linux-linus:build-arm64-pvops:<job status>:broken:regression
    linux-linus:build-arm64-xsm:<job status>:broken:regression
    linux-linus:build-armhf:<job status>:broken:regression
    linux-linus:build-armhf-pvops:<job status>:broken:regression
    linux-linus:build-i386:<job status>:broken:regression
    linux-linus:build-i386-pvops:<job status>:broken:regression
    linux-linus:build-i386-xsm:<job status>:broken:regression
    linux-linus:build-i386:host-build-prep:fail:regression
    linux-linus:build-amd64-xsm:host-build-prep:fail:regression
    linux-linus:build-amd64-pvops:host-build-prep:fail:regression
    linux-linus:build-armhf-pvops:host-build-prep:fail:regression
    linux-linus:build-amd64:host-build-prep:fail:regression
    linux-linus:build-i386-pvops:host-build-prep:fail:regression
    linux-linus:build-i386-xsm:host-build-prep:fail:regression
    linux-linus:build-arm64-xsm:host-build-prep:fail:regression
    linux-linus:build-arm64:host-build-prep:fail:regression
    linux-linus:build-arm64-pvops:host-build-prep:fail:regression
    linux-linus:build-armhf:host-build-prep:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:build-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    linux-linus:build-i386-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine-bios:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine-uefi:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    linux=7efd0a74039fb6b584be2cb91c1d0ef0bd796ee1
X-Osstest-Versions-That:
    linux=586b5dfb51b962c1b6c06495715e4c4f76a7fc5a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Apr 2024 09:43:25 +0000

flight 185481 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185481/

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
 build-i386                    5 host-build-prep          fail REGR. vs. 185347
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 185347
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 185347
 build-armhf-pvops             5 host-build-prep          fail REGR. vs. 185347
 build-amd64                   5 host-build-prep          fail REGR. vs. 185347
 build-i386-pvops              5 host-build-prep          fail REGR. vs. 185347
 build-i386-xsm                5 host-build-prep          fail REGR. vs. 185347
 build-arm64-xsm               5 host-build-prep          fail REGR. vs. 185347
 build-arm64                   5 host-build-prep          fail REGR. vs. 185347
 build-arm64-pvops             5 host-build-prep          fail REGR. vs. 185347
 build-armhf                   5 host-build-prep          fail REGR. vs. 185347

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
 linux                7efd0a74039fb6b584be2cb91c1d0ef0bd796ee1
baseline version:
 linux                586b5dfb51b962c1b6c06495715e4c4f76a7fc5a

Last test of basis   185347  2024-04-12 05:19:23 Z    2 days
Failing since        185442  2024-04-13 14:48:28 Z    0 days    2 attempts
Testing same since   185481  2024-04-14 04:18:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaro Koskinen <aaro.koskinen@iki.fi>
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Alex Constantino <dreaming.about.electric.sheep@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexey Izbyshev <izbyshev@ispras.ru>
  Animesh Manna <animesh.manna@intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Ashutosh Dixit <ashutosh.dixit@intel.com>
  Bharath SM <bharathsm@microsoft.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Coly Li <colyli@suse.de>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Damien Le Moal <dlemoal@kernel.org>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  Dillon Varone <dillon.varone@amd.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Fabio Estevam <festevam@denx.de>
  Frank Li <Frank.Li@nxp.com>
  Fudongwang <fudong.wang@amd.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Haiyue Wang <haiyue.wang@intel.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
  Harry Wentland <harry.wentland@amd.com>
  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
  Igor Pylypiv <ipylypiv@google.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jammy Huang <jammy_huang@aspeedtech.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  John Harrison <John.C.Harrison@Intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jouni Högander <jouni.hogander@intel.com>
  Karthik Poosa <karthik.poosa@intel.com>
  Kees Cook <keescook@chromium.org>
  Kenneth Feng <kenneth.feng@amd.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuogee Hsieh <quic_khsieh@quicinc.com>
  Lang Yu <Lang.Yu@amd.com>
  Li Ma <li.ma@amd.com>
  Lijo Lazar <lijo.lazar@amd.com>
  lima1002 <li.ma@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Ruhmann <ruhmann@luis.uni-hannover.de>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Maxime Ripard <mripard@kernel.org>
  Miguel Ojeda <ojeda@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  NeilBrown <neilb@suse.de>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Prasad Pandit <pjp@fedoraproject.org>
  Rik van Riel <riel@surriel.com>
  Rob Clark <robdclark@chromium.org>
  Rob Clark <robdclark@gmail.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Li <roman.li@amd.com>
  Samuel Holland <samuel.holland@sifive.com>
  shaoyunl <shaoyun.liu@amd.com>
  Shawn Guo <shawnguo@kernel.org>
  Song Liu <song@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Suraj Kandpal <suraj.kandpal@intel.com>
  Tao Zhou <tao.zhou1@amd.com>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tim Harvey <tharvey@gateworks.com>
  Tim Huang <Tim.Huang@amd.com>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasant Hegde <vasant.hegde@amd.com>
  Vidya Srinivas <vidya.srinivas@intel.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Wachowski, Karol <karol.wachowski@intel.com>
  Wenjing Liu <wenjing.liu@amd.com>
  Xiubo Li <xiubli@redhat.com>
  Xuchun Shang <xuchun.shang@linux.alibaba.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Ye Li <ye.li@broadcom.com>
  Yifan Zhang <yifan1.zhang@amd.com>
  Yu Kuai <yukuai3@huawei.com>
  Zack Rusin <zack.rusin@broadcom.com>
  ZhenGuo Yin <zhenguo.yin@amd.com>
  Zhigang Luo <Zhigang.Luo@amd.com>
  Zhongwei <zhongwei.zhang@amd.com>

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

(No revision log; it would be 3622 lines long.)

