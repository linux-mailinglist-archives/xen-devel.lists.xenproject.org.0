Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D38D49F1
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 12:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732649.1138659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCdT3-00028Q-F2; Thu, 30 May 2024 10:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732649.1138659; Thu, 30 May 2024 10:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCdT3-000268-AI; Thu, 30 May 2024 10:57:09 +0000
Received: by outflank-mailman (input) for mailman id 732649;
 Thu, 30 May 2024 10:57:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCdT1-00025y-RY; Thu, 30 May 2024 10:57:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCdT1-0005Vq-NF; Thu, 30 May 2024 10:57:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCdT1-000262-Eu; Thu, 30 May 2024 10:57:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCdT1-0004Cs-EM; Thu, 30 May 2024 10:57:07 +0000
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
	bh=LkacN8eRHtn8csVr92RJndKlNDZWQgEavn96dxuo0QU=; b=gbdtGJUO1bLGUL3wYJMIMJ8+ya
	/rD2z0ovnXy67c9vbN5+2ETW3Fbvb8cT1v7DQDtuUR8+FV+FM6ZyY1HJE9qORGXCdMB+26KinzSYM
	lxA24yU6vQMinBnXhLg+vo/66bzlyGRj40swLEglHVgB/zYcGn3Snp8yfUcdDrJ0h3JY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186189-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186189: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:regression
    linux-linus:build-amd64-xsm:xen-build:fail:regression
    linux-linus:build-amd64:xen-build:fail:regression
    linux-linus:build-i386:xen-build:fail:regression
    linux-linus:build-i386-xsm:xen-build:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine-uefi:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    linux-linus:build-i386-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:build-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine-bios:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4a4be1ad3a6efea16c56615f31117590fd881358
X-Osstest-Versions-That:
    linux=e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 10:57:07 +0000

flight 186189 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186189/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-vhd  8 xen-boot                 fail REGR. vs. 186174
 build-amd64-xsm               6 xen-build      fail in 186185 REGR. vs. 186174
 build-amd64                   6 xen-build      fail in 186185 REGR. vs. 186174
 build-i386                    6 xen-build      fail in 186185 REGR. vs. 186174
 build-i386-xsm                6 xen-build      fail in 186185 REGR. vs. 186174

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-multivcpu  8 xen-boot        fail in 186185 pass in 186189
 test-armhf-armhf-libvirt      8 xen-boot                   fail pass in 186185

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds      1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl           1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-raw       1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)          blocked in 186185 n/a
 test-amd64-amd64-pair         1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-libvirt      1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-examine      1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)   blocked in 186185 n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)      blocked in 186185 n/a
 test-amd64-amd64-examine-uefi  1 build-check(1)          blocked in 186185 n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)    blocked in 186185 n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)   blocked in 186185 n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)          blocked in 186185 n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)        blocked in 186185 n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)           blocked in 186185 n/a
 build-i386-libvirt            1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)           blocked in 186185 n/a
 build-amd64-libvirt           1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)   blocked in 186185 n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-pygrub       1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-libvirt-raw  1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-libvirt-qcow2  1 build-check(1)         blocked in 186185 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)        blocked in 186185 n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)          blocked in 186185 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)          blocked in 186185 n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)      blocked in 186185 n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1) blocked in 186185 n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)   blocked in 186185 n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-vhd       1 build-check(1)           blocked in 186185 n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)   blocked in 186185 n/a
 test-amd64-amd64-examine-bios  1 build-check(1)          blocked in 186185 n/a
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 186185 like 186174
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 186185 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 186185 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 186185 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 186185 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 186185 never pass
 test-armhf-armhf-xl-rtds      8 xen-boot                     fail  like 186174
 test-armhf-armhf-xl-credit1   8 xen-boot                     fail  like 186174
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186174
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186174
 test-armhf-armhf-examine      8 reboot                       fail  like 186174
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186174
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186174
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186174
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4a4be1ad3a6efea16c56615f31117590fd881358
baseline version:
 linux                e0cce98fe279b64f4a7d81b7f5c3a23d80b92fbc

Last test of basis   186174  2024-05-28 18:10:31 Z    1 days
Testing same since   186185  2024-05-29 17:42:32 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dominique Martinet <asmadeus@codewreck.org>
  Herbert Xu <herbert@gondor.apana.org.au>
  Linus Torvalds <torvalds@linux-foundation.org>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>

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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 fail    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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

------------------------------------------------------------
commit 4a4be1ad3a6efea16c56615f31117590fd881358
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 29 09:39:34 2024 -0700

    Revert "vfs: Delete the associated dentry when deleting a file"
    
    This reverts commit 681ce8623567ba7e7333908e9826b77145312dda.
    
    We gave it a try, but it turns out the kernel test robot did in fact
    find performance regressions for it, so we'll have to look at the more
    involved alternative fixes for Yafang Shao's Elasticsearch load issue.
    
    There were several alternatives discussed, they just weren't as simple
    as this first attempt.
    
    The report is of a -7.4% regression of filebench.sum_operations/s, which
    appears significant enough to trigger my "this patch may get reverted if
    somebody finds a performance regression on some other load" rule.
    
    So it's still the case that we should end up deleting dentries more
    aggressively - or just be better at pruning them later - but it needs a
    bit more finesse than this simple thing.
    
    Link: https://lore.kernel.org/all/202405291318.4dfbb352-oliver.sang@intel.com/
    Cc: Yafang Shao <laoar.shao@gmail.com>
    Cc: Al Viro <viro@zeniv.linux.org.uk>
    Cc: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 397a83ab978553ca2970ad1ccdbac0cdc732efd9
Merge: db163660b02a c898afdc1564
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 29 09:25:15 2024 -0700

    Merge tag '9p-for-6.10-rc2' of https://github.com/martinetd/linux
    
    Pull 9p fixes from Dominique Martinet:
     "Two fixes headed to stable trees:
    
       - a trace event was dumping uninitialized values
    
       - a missing lock that was thought to have exclusive access, and it
         turned out not to"
    
    * tag '9p-for-6.10-rc2' of https://github.com/martinetd/linux:
      9p: add missing locking around taking dentry fid list
      net/9p: fix uninit-value in p9_client_rpc()

commit db163660b02abbffebfad1bcd6dbce1201c72731
Merge: e0cce98fe279 67ec8cdf2997
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 29 09:12:58 2024 -0700

    Merge tag 'v6.10-p3' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
    
    Pull crypto fix from Herbert Xu:
     "This fixes a new run-time warning triggered by tpm"
    
    * tag 'v6.10-p3' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6:
      hwrng: core - Remove add_early_randomness

commit 67ec8cdf29971677b2fb4b6d92871eb5d5e95597
Author: Herbert Xu <herbert@gondor.apana.org.au>
Date:   Wed May 22 13:37:54 2024 +0800

    hwrng: core - Remove add_early_randomness
    
    A potential deadlock was reported with the config file at
    
    https://web.archive.org/web/20240522052129/https://0x0.st/XPN_.txt
    
    In this particular configuration, the deadlock doesn't exist because
    the warning triggered at a point before modules were even available.
    However, the deadlock can be real because any module loaded would
    invoke async_synchronize_full.
    
    The issue is spurious for software crypto algorithms which aren't
    themselves involved in async probing.  However, it would be hard to
    avoid for a PCI crypto driver using async probing.
    
    In this particular call trace, the problem is easily avoided because
    the only reason the module is being requested during probing is the
    add_early_randomness call in the hwrng core.  This feature is
    vestigial since there is now a kernel thread dedicated to doing
    exactly this.
    
    So remove add_early_randomness as it is no longer needed.
    
    Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
    Reported-by: Eric Biggers <ebiggers@kernel.org>
    Fixes: 1b6d7f9eb150 ("tpm: add session encryption protection to tpm2_get_random()")
    Link: https://lore.kernel.org/r/119dc5ed-f159-41be-9dda-1a056f29888d@notapiano/
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
    Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
    Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

commit c898afdc15645efb555acb6d85b484eb40a45409
Author: Dominique Martinet <asmadeus@codewreck.org>
Date:   Tue May 21 21:13:36 2024 +0900

    9p: add missing locking around taking dentry fid list
    
    Fix a use-after-free on dentry's d_fsdata fid list when a thread
    looks up a fid through dentry while another thread unlinks it:
    
    UAF thread:
    refcount_t: addition on 0; use-after-free.
     p9_fid_get linux/./include/net/9p/client.h:262
     v9fs_fid_find+0x236/0x280 linux/fs/9p/fid.c:129
     v9fs_fid_lookup_with_uid linux/fs/9p/fid.c:181
     v9fs_fid_lookup+0xbf/0xc20 linux/fs/9p/fid.c:314
     v9fs_vfs_getattr_dotl+0xf9/0x360 linux/fs/9p/vfs_inode_dotl.c:400
     vfs_statx+0xdd/0x4d0 linux/fs/stat.c:248
    
    Freed by:
     p9_fid_destroy (inlined)
     p9_client_clunk+0xb0/0xe0 linux/net/9p/client.c:1456
     p9_fid_put linux/./include/net/9p/client.h:278
     v9fs_dentry_release+0xb5/0x140 linux/fs/9p/vfs_dentry.c:55
     v9fs_remove+0x38f/0x620 linux/fs/9p/vfs_inode.c:518
     vfs_unlink+0x29a/0x810 linux/fs/namei.c:4335
    
    The problem is that d_fsdata was not accessed under d_lock, because
    d_release() normally is only called once the dentry is otherwise no
    longer accessible but since we also call it explicitly in v9fs_remove
    that lock is required:
    move the hlist out of the dentry under lock then unref its fids once
    they are no longer accessible.
    
    Fixes: 154372e67d40 ("fs/9p: fix create-unlink-getattr idiom")
    Cc: stable@vger.kernel.org
    Reported-by: Meysam Firouzi
    Reported-by: Amirmohammad Eftekhar
    Reviewed-by: Christian Schoenebeck <linux_oss@crudebyte.com>
    Message-ID: <20240521122947.1080227-1-asmadeus@codewreck.org>
    Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>

commit 25460d6f39024cc3b8241b14c7ccf0d6f11a736a
Author: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Date:   Mon Apr 8 07:10:39 2024 -0700

    net/9p: fix uninit-value in p9_client_rpc()
    
    Syzbot with the help of KMSAN reported the following error:
    
    BUG: KMSAN: uninit-value in trace_9p_client_res include/trace/events/9p.h:146 [inline]
    BUG: KMSAN: uninit-value in p9_client_rpc+0x1314/0x1340 net/9p/client.c:754
     trace_9p_client_res include/trace/events/9p.h:146 [inline]
     p9_client_rpc+0x1314/0x1340 net/9p/client.c:754
     p9_client_create+0x1551/0x1ff0 net/9p/client.c:1031
     v9fs_session_init+0x1b9/0x28e0 fs/9p/v9fs.c:410
     v9fs_mount+0xe2/0x12b0 fs/9p/vfs_super.c:122
     legacy_get_tree+0x114/0x290 fs/fs_context.c:662
     vfs_get_tree+0xa7/0x570 fs/super.c:1797
     do_new_mount+0x71f/0x15e0 fs/namespace.c:3352
     path_mount+0x742/0x1f20 fs/namespace.c:3679
     do_mount fs/namespace.c:3692 [inline]
     __do_sys_mount fs/namespace.c:3898 [inline]
     __se_sys_mount+0x725/0x810 fs/namespace.c:3875
     __x64_sys_mount+0xe4/0x150 fs/namespace.c:3875
     do_syscall_64+0xd5/0x1f0
     entry_SYSCALL_64_after_hwframe+0x6d/0x75
    
    Uninit was created at:
     __alloc_pages+0x9d6/0xe70 mm/page_alloc.c:4598
     __alloc_pages_node include/linux/gfp.h:238 [inline]
     alloc_pages_node include/linux/gfp.h:261 [inline]
     alloc_slab_page mm/slub.c:2175 [inline]
     allocate_slab mm/slub.c:2338 [inline]
     new_slab+0x2de/0x1400 mm/slub.c:2391
     ___slab_alloc+0x1184/0x33d0 mm/slub.c:3525
     __slab_alloc mm/slub.c:3610 [inline]
     __slab_alloc_node mm/slub.c:3663 [inline]
     slab_alloc_node mm/slub.c:3835 [inline]
     kmem_cache_alloc+0x6d3/0xbe0 mm/slub.c:3852
     p9_tag_alloc net/9p/client.c:278 [inline]
     p9_client_prepare_req+0x20a/0x1770 net/9p/client.c:641
     p9_client_rpc+0x27e/0x1340 net/9p/client.c:688
     p9_client_create+0x1551/0x1ff0 net/9p/client.c:1031
     v9fs_session_init+0x1b9/0x28e0 fs/9p/v9fs.c:410
     v9fs_mount+0xe2/0x12b0 fs/9p/vfs_super.c:122
     legacy_get_tree+0x114/0x290 fs/fs_context.c:662
     vfs_get_tree+0xa7/0x570 fs/super.c:1797
     do_new_mount+0x71f/0x15e0 fs/namespace.c:3352
     path_mount+0x742/0x1f20 fs/namespace.c:3679
     do_mount fs/namespace.c:3692 [inline]
     __do_sys_mount fs/namespace.c:3898 [inline]
     __se_sys_mount+0x725/0x810 fs/namespace.c:3875
     __x64_sys_mount+0xe4/0x150 fs/namespace.c:3875
     do_syscall_64+0xd5/0x1f0
     entry_SYSCALL_64_after_hwframe+0x6d/0x75
    
    If p9_check_errors() fails early in p9_client_rpc(), req->rc.tag
    will not be properly initialized. However, trace_9p_client_res()
    ends up trying to print it out anyway before p9_client_rpc()
    finishes.
    
    Fix this issue by assigning default values to p9_fcall fields
    such as 'tag' and (just in case KMSAN unearths something new) 'id'
    during the tag allocation stage.
    
    Reported-and-tested-by: syzbot+ff14db38f56329ef68df@syzkaller.appspotmail.com
    Fixes: 348b59012e5c ("net/9p: Convert net/9p protocol dumps to tracepoints")
    Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
    Reviewed-by: Christian Schoenebeck <linux_oss@crudebyte.com>
    Cc: stable@vger.kernel.org
    Message-ID: <20240408141039.30428-1-n.zhandarovich@fintech.ru>
    Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>

