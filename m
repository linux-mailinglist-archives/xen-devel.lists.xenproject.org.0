Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D961E8CDDE2
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 02:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728952.1134039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAIUy-0005mn-2A; Fri, 24 May 2024 00:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728952.1134039; Fri, 24 May 2024 00:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAIUx-0005kf-VD; Fri, 24 May 2024 00:09:27 +0000
Received: by outflank-mailman (input) for mailman id 728952;
 Fri, 24 May 2024 00:09:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAIUw-0005kV-DH; Fri, 24 May 2024 00:09:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAIUw-0001O4-9C; Fri, 24 May 2024 00:09:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sAIUv-000640-Vi; Fri, 24 May 2024 00:09:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sAIUv-0004dQ-VJ; Fri, 24 May 2024 00:09:25 +0000
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
	bh=dIwaN6cwckeTA/H7GxoghjwQWPL0Zf/zZPwZ/CwR4Ek=; b=vYHlfPLGdIWSRpgv24MlRuERL4
	Z0DH7JlJqX2OAgFoRFVjK8bzB0R9cgncl5vmEfv+zbLpdvC9Vo2FuSamH2cclcGLyQ6g+XWKUgv2B
	gtMlDuiF8A8IwV3oaBLloKrXgcVIyMBFaKdZcmqD1J09PJ32BNevYnev63wgqC4rjoRc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186109-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.17-testing test] 186109: regressions - FAIL
X-Osstest-Failures:
    xen-4.17-testing:build-arm64-pvops:kernel-build:fail:regression
    xen-4.17-testing:build-amd64:xen-build:fail:regression
    xen-4.17-testing:build-amd64-xsm:xen-build:fail:regression
    xen-4.17-testing:build-i386:xen-build:fail:regression
    xen-4.17-testing:build-amd64-prev:xen-build:fail:regression
    xen-4.17-testing:build-i386-xsm:xen-build:fail:regression
    xen-4.17-testing:build-i386-prev:xen-build:fail:regression
    xen-4.17-testing:test-armhf-armhf-xl-credit1:host-ping-check-xen:fail:heisenbug
    xen-4.17-testing:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-5:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-migrupgrade:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:build-i386-libvirt:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-1:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-raw:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-4:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-3:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-xtf-amd64-amd64-2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-livepatch:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3c7c9225ffa5605bf0603f9dd1666f3f786e2c44
X-Osstest-Versions-That:
    xen=effcf70f020ff12d34c80e2abde0ecb00ce92bda
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 May 2024 00:09:25 +0000

flight 186109 xen-4.17-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186109/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 185864
 build-amd64                   6 xen-build      fail in 186087 REGR. vs. 185864
 build-amd64-xsm               6 xen-build      fail in 186087 REGR. vs. 185864
 build-i386                    6 xen-build      fail in 186087 REGR. vs. 185864
 build-amd64-prev              6 xen-build      fail in 186087 REGR. vs. 185864
 build-i386-xsm                6 xen-build      fail in 186087 REGR. vs. 185864
 build-i386-prev               6 xen-build      fail in 186087 REGR. vs. 185864

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit1  10 host-ping-check-xen        fail pass in 186087
 test-armhf-armhf-xl           8 xen-boot                   fail pass in 186087

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)    blocked in 186087 n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked in 186087 n/a
 test-xtf-amd64-amd64-5        1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-migrupgrade  1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)   blocked in 186087 n/a
 build-amd64-libvirt           1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 1 build-check(1) blocked in 186087 n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)          blocked in 186087 n/a
 test-amd64-amd64-libvirt      1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)   blocked in 186087 n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)        blocked in 186087 n/a
 build-i386-libvirt            1 build-check(1)           blocked in 186087 n/a
 test-xtf-amd64-amd64-1        1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-libvirt-raw  1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64 1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)      blocked in 186087 n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)      blocked in 186087 n/a
 test-amd64-amd64-xl-raw       1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)          blocked in 186087 n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)          blocked in 186087 n/a
 test-xtf-amd64-amd64-4        1 build-check(1)           blocked in 186087 n/a
 test-xtf-amd64-amd64-3        1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)   blocked in 186087 n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)   blocked in 186087 n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl           1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-pygrub       1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-libvirt-qcow2  1 build-check(1)         blocked in 186087 n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-pair         1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)          blocked in 186087 n/a
 test-xtf-amd64-amd64-2        1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)   blocked in 186087 n/a
 test-amd64-amd64-livepatch    1 build-check(1)           blocked in 186087 n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked in 186087 n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)        blocked in 186087 n/a
 test-amd64-amd64-xl-vhd       1 build-check(1)           blocked in 186087 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 186087 never pass
 test-arm64-arm64-xl-credit1 15 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-xl-credit1 16 saverestore-support-check fail in 186087 never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check fail in 186087 never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check fail in 186087 never pass
 test-arm64-arm64-xl         15 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-xl     16 saverestore-support-check fail in 186087 never pass
 test-arm64-arm64-xl-credit2 15 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-xl-credit2 16 saverestore-support-check fail in 186087 never pass
 test-armhf-armhf-xl         15 migrate-support-check fail in 186087 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 186087 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 186087 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 186087 never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check fail in 186087 never pass
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 186087 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 186087 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185864
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185864
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185864
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185864
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185864
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185864
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3c7c9225ffa5605bf0603f9dd1666f3f786e2c44
baseline version:
 xen                  effcf70f020ff12d34c80e2abde0ecb00ce92bda

Last test of basis   185864  2024-04-29 08:08:55 Z   24 days
Failing since        186063  2024-05-21 10:06:36 Z    2 days    4 attempts
Testing same since   186069  2024-05-22 01:58:18 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Andryuk <jason.andryuk@amd.com>
  Juergen Gross <jgross@suse.com>
  Leigh Brown <leigh@solinno.co.uk>
  Roger Pau Monné <roger.pau@citrix.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-amd64-migrupgrade                                 pass    
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
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


Not pushing.

(No revision log; it would be 438 lines long.)

