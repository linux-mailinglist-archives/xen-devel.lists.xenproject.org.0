Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6D41DFF6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 19:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200154.354577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzgu-0003Mw-U3; Thu, 30 Sep 2021 17:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200154.354577; Thu, 30 Sep 2021 17:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzgu-0003Kl-PX; Thu, 30 Sep 2021 17:17:52 +0000
Received: by outflank-mailman (input) for mailman id 200154;
 Thu, 30 Sep 2021 17:17:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzgt-0003KV-5W; Thu, 30 Sep 2021 17:17:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzgt-0004yA-0g; Thu, 30 Sep 2021 17:17:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzgs-0003LH-Hy; Thu, 30 Sep 2021 17:17:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzgs-000401-HS; Thu, 30 Sep 2021 17:17:50 +0000
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
	bh=Ur5w1u7RdbZNl8nO8qKiGkqZyGT++tliDsmPcBQZtx8=; b=a63orfcnVYfPe36f6mTiuDt/ui
	anfkaRXM+4mEmv6nl5sUIagnMid2pQ/K/3nUX1kyaFPsvon7w5NUtrNMa3RXnqyJAudjqdI+rdDP9
	weSwKAh26vUGm20D3CexfL080/QfAjmtOKheFbWBEV8ojOu6yEoTDEeULKuwVlMpSA10=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165331-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 165331: regressions - trouble: fail/pass/preparing/running
X-Osstest-Failures:
    qemu-mainline:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:hosts-allocate:running:regression
    qemu-mainline:test-armhf-armhf-libvirt:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-libvirt-raw:hosts-allocate:running:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-pygrub:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-multivcpu:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-freebsd10-i386:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-coresched-i386-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-vhd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-credit1:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-freebsd10-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-pair:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-xl-pvshim:hosts-allocate:running:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:hosts-allocate:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):running:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:debian-install:running:regression
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:host-install(5):running:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:host-ping-check-native:running:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:syslog-server:running:regression
    qemu-mainline:test-armhf-armhf-xl-cubietruck:debian-install:running:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:syslog-server:running:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:running:regression
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:syslog-server:running:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:syslog-server:running:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:syslog-server:running:regression
    qemu-mainline:test-armhf-armhf-xl-cubietruck:syslog-server:running:regression
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=6b54a31bf7b403672a798b6443b1930ae6c74dea
X-Osstest-Versions-That:
    qemuu=99c44988d5ba1866a411450c877ed818b1b70081
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Sep 2021 17:17:50 +0000

flight 165331 qemu-mainline running [real]
http://logs.test-lab.xenproject.org/osstest/logs/165331/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail REGR. vs. 164950
 test-armhf-armhf-libvirt-raw  3 hosts-allocate               running
 test-armhf-armhf-libvirt      3 hosts-allocate               running
 test-amd64-i386-libvirt-xsm   3 hosts-allocate               running
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate    running
 test-armhf-armhf-xl-vhd       3 hosts-allocate               running
 test-amd64-i386-libvirt       3 hosts-allocate               running
 test-amd64-i386-libvirt-pair  4 hosts-allocate               running
 test-amd64-i386-libvirt-raw   3 hosts-allocate               running
 test-armhf-armhf-xl-multivcpu  3 hosts-allocate               running
 test-amd64-amd64-libvirt-pair  4 hosts-allocate               running
 test-amd64-amd64-libvirt      3 hosts-allocate               running
 test-amd64-amd64-pygrub       3 hosts-allocate               running
 test-amd64-amd64-libvirt-xsm  3 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-amd  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 3 hosts-allocate running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  3 hosts-allocate            running
 test-amd64-amd64-xl-pvshim    3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd11-amd64  3 hosts-allocate               running
 test-amd64-coresched-amd64-xl  3 hosts-allocate               running
 test-amd64-amd64-xl-multivcpu  3 hosts-allocate               running
 test-amd64-i386-xl-shadow     3 hosts-allocate               running
 test-amd64-amd64-pair         4 hosts-allocate               running
 test-amd64-i386-freebsd10-i386  3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-amd  3 hosts-allocate               running
 test-amd64-coresched-i386-xl  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qcow2     3 hosts-allocate               running
 test-amd64-amd64-xl-pvhv2-intel  3 hosts-allocate               running
 test-amd64-amd64-qemuu-freebsd12-amd64  3 hosts-allocate               running
 test-amd64-amd64-qemuu-nested-intel  3 hosts-allocate               running
 test-amd64-amd64-xl           3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-vhd        3 hosts-allocate               running
 test-amd64-amd64-xl-shadow    3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-win7-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate     running
 test-amd64-amd64-xl-credit1   3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-ws16-amd64  3 hosts-allocate               running
 test-amd64-i386-freebsd10-amd64  3 hosts-allocate               running
 test-amd64-amd64-xl-xsm       3 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate          running
 test-amd64-amd64-xl-rtds      3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64  3 hosts-allocate             running
 test-amd64-i386-xl-xsm        3 hosts-allocate               running
 test-amd64-i386-pair          4 hosts-allocate               running
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  3 hosts-allocate         running
 test-amd64-i386-qemuu-rhel6hvm-intel  3 hosts-allocate               running
 test-amd64-i386-xl            3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate      running
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict  3 hosts-allocate running
 test-amd64-i386-xl-pvshim     3 hosts-allocate               running
 test-amd64-i386-qemuu-rhel6hvm-amd  3 hosts-allocate               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  5 host-install(5)  running
 test-amd64-amd64-xl-credit2  12 debian-install               running
 test-armhf-armhf-libvirt-qcow2  5 host-install(5)              running
 test-armhf-armhf-xl-rtds      6 host-ping-check-native       running
 test-amd64-amd64-xl-credit2   4 syslog-server                running
 test-armhf-armhf-xl-cubietruck 12 debian-install               running
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm  4 syslog-server    running
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    running
 test-armhf-armhf-libvirt-qcow2  4 syslog-server                running
 test-armhf-armhf-xl-credit2   4 syslog-server                running
 test-armhf-armhf-xl-rtds      4 syslog-server                running
 test-armhf-armhf-xl-cubietruck  4 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                6b54a31bf7b403672a798b6443b1930ae6c74dea
baseline version:
 qemuu                99c44988d5ba1866a411450c877ed818b1b70081

Last test of basis   164950  2021-09-11 18:57:22 Z   18 days
Failing since        164967  2021-09-13 13:06:52 Z   17 days   31 attempts
Testing same since   165319  2021-09-29 20:37:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Chen <alex.chen@huawei.com>
  Alexander Graf <agraf@csgraf.de>
  Alexandra Clifford <aclifford@draper.com>
  AlexChen <alex.chen@huawei.com>
  Alistair Francis <alistair.francis@wdc.com>
  Amanda Strnad <astrnad@draper.com>
  Andrew Jeffery <andrew@aj.id.au>
  Anup Patel <anup.patel@wdc.com>
  Bin Meng <bmeng.cn@gmail.com>
  Cai Huoqing <caihuoqing@baidu.com>
  Chris Rauer <crauer@google.com>
  Cleber Rosa <crosa@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Daniel P. Berrangé <berrange@redhat.com>
  David Gibson <david@gibson.dropbear.id.au>
  Dongli Zhang <dongli.zhang@oracle.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Eric Blake <eblake@redhat.com>
  Frank Chang <frank.chang@sifive.com>
  G S Niteesh Babu <niteesh.gs@gmail.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Green Wan <green.wan@sifive.com>
  Guenter Roeck <linux@roeck-us.net>
  Hanna Reitz <hreitz@redhat.com>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jason Wang <jasowang@redhat.com>
  Joel Stanley <joel@jms.id.au>
  John Arbuckle <programmingkidx@gmail.com>
  John Snow <jsnow@redhat.com>
  Jose R. Ziviani <jziviani@suse.de>
  Justin Restivo <jrestivo@draper.com>
  Kirill Tkhai <ktkhai@virtuozzo.com>
  Klaus Jensen <k.jensen@samsung.com>
  Lara Lazier <laramglazier@gmail.com>
  Laurent Vivier <laurent@vivier.eu>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Luc Michel <lmichel@kalray.eu>
  Marc Zyngier <maz@kernel.org>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Markus Armbruster <armbru@redhat.com>
  Max Hsu <max.hsu@sifive.com>
  Max Reitz <mreitz@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michal Privoznik <mprivozn@redhat.com>
  Naveen Nagar <naveen.n1@samsung.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Pankaj Gupta <pankaj.gupta.linux@gmail.com>
  Pankaj Raghav <p.raghav@samsung.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
  Peter Collingbourne <pcc@google.com>
  Peter Delevoryas <pdel@fb.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Reinoud Zandijk <Reinoud@NetBSD.org>
  Richard Henderson <richard.henderson@linaro.org>
  Richard W.M. Jones <rjones@redhat.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)
  Sergio Lopez <slp@redhat.com>
  Shashi Mallela <shashi.mallela@linaro.org>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Viktor Prutyanov <viktor.prutyanov@phystech.edu>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Wainer dos Santos Moschetta <wainersm@redhat.com>
  Willian Rampazzo <willianr@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          preparing
 test-amd64-coresched-amd64-xl                                preparing
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           preparing
 test-amd64-coresched-i386-xl                                 preparing
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           running 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            preparing
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 preparing
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  preparing
 test-amd64-amd64-libvirt-xsm                                 preparing
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  preparing
 test-amd64-amd64-xl-xsm                                      preparing
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       preparing
 test-amd64-amd64-qemuu-nested-amd                            preparing
 test-amd64-amd64-xl-pvhv2-amd                                preparing
 test-amd64-i386-qemuu-rhel6hvm-amd                           preparing
 test-amd64-amd64-dom0pvh-xl-amd                              preparing
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     preparing
 test-amd64-i386-freebsd10-amd64                              preparing
 test-amd64-amd64-qemuu-freebsd11-amd64                       preparing
 test-amd64-amd64-qemuu-freebsd12-amd64                       preparing
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         preparing
 test-amd64-i386-xl-qemuu-ovmf-amd64                          preparing
 test-amd64-amd64-xl-qemuu-win7-amd64                         preparing
 test-amd64-i386-xl-qemuu-win7-amd64                          preparing
 test-amd64-amd64-xl-qemuu-ws16-amd64                         preparing
 test-amd64-i386-xl-qemuu-ws16-amd64                          preparing
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  preparing
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  running 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  running 
 test-armhf-armhf-xl-cubietruck                               running 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        preparing
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         preparing
 test-amd64-i386-freebsd10-i386                               preparing
 test-amd64-amd64-qemuu-nested-intel                          preparing
 test-amd64-amd64-xl-pvhv2-intel                              preparing
 test-amd64-i386-qemuu-rhel6hvm-intel                         preparing
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     preparing
 test-armhf-armhf-libvirt                                     preparing
 test-amd64-i386-libvirt                                      preparing
 test-amd64-amd64-xl-multivcpu                                preparing
 test-armhf-armhf-xl-multivcpu                                preparing
 test-amd64-amd64-pair                                        preparing
 test-amd64-i386-pair                                         preparing
 test-amd64-amd64-libvirt-pair                                preparing
 test-amd64-i386-libvirt-pair                                 preparing
 test-amd64-amd64-xl-pvshim                                   preparing
 test-amd64-i386-xl-pvshim                                    preparing
 test-amd64-amd64-pygrub                                      preparing
 test-armhf-armhf-libvirt-qcow2                               running 
 test-amd64-amd64-xl-qcow2                                    preparing
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 preparing
 test-amd64-i386-libvirt-raw                                  preparing
 test-amd64-amd64-xl-rtds                                     preparing
 test-armhf-armhf-xl-rtds                                     running 
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             preparing
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              preparing
 test-amd64-amd64-xl-shadow                                   preparing
 test-amd64-i386-xl-shadow                                    preparing
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      preparing
 test-amd64-i386-xl-vhd                                       preparing


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


Not pushing.

(No revision log; it would be 6687 lines long.)

