Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB63982FFFB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 06:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668234.1040278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPyvq-0005yD-KE; Wed, 17 Jan 2024 05:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668234.1040278; Wed, 17 Jan 2024 05:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPyvq-0005w1-Gf; Wed, 17 Jan 2024 05:57:46 +0000
Received: by outflank-mailman (input) for mailman id 668234;
 Wed, 17 Jan 2024 05:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPyvo-0005qq-B2; Wed, 17 Jan 2024 05:57:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPyvo-0007w8-9N; Wed, 17 Jan 2024 05:57:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPyvn-0001K5-R3; Wed, 17 Jan 2024 05:57:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPyvn-0006tj-QU; Wed, 17 Jan 2024 05:57:43 +0000
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
	bh=JosaXTW3wLzIBDWfJ6ZIuqqwBzAEx+3Fke1Fm58MNN8=; b=Tjg2CGeRlAY0rU6v6zPgK0LqkY
	XJn9uF27dHrxq7ZaXzG5VdmhXtBUIB2sytUhjIol+InCLkYZzbKg1ZLQdni+qioxXkkfGqI3GEWvg
	ABd8LOKEmbG1QJYj/JtF0CfLOHqBgwwBXHjum2kyvtw/rNwVR+4pRUMqE721jtaAj3Jw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184370-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 184370: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:build-amd64-pvops:kernel-build:fail:regression
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
    linux-5.4:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-examine-bios:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-examine-uefi:build-check(1):blocked:nonblocking
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
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9153fc9664959aa6bb35915b2bbd8fbc4c762962
X-Osstest-Versions-That:
    linux=4410df70110ff5175bf7f7fdc3bae5c80f2c36d9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jan 2024 05:57:43 +0000

flight 184370 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184370/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-pvops             6 kernel-build             fail REGR. vs. 184339

Tests which did not succeed, but are not blocking:
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-bios  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-uefi  1 build-check(1)               blocked  n/a
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
 test-armhf-armhf-xl-credit1  14 guest-start                  fail  like 184327
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat    fail  like 184327
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat    fail like 184334
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184339
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184339
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184339
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184339
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184339
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184339
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 184339
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                9153fc9664959aa6bb35915b2bbd8fbc4c762962
baseline version:
 linux                4410df70110ff5175bf7f7fdc3bae5c80f2c36d9

Last test of basis   184339  2024-01-13 06:35:35 Z    3 days
Testing same since   184362  2024-01-15 17:43:08 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Cinal <adriancinal1@gmail.com>
  Adrian Cinal <adriancinal@gmail.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andrea Mayer <andrea.mayer@uniroma2.it>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Staikov <andrii.staikov@intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Bartosz Pawlowski <bartosz.pawlowski@intel.com>
  Benjamin Bara <benjamin.bara@skidata.com>
  Bharathi Sreenivas <bharathi.sreenivas@intel.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Chen Ni <nichen@iscas.ac.cn>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  David S. Miller <davem@davemloft.net>
  Ding Hui <dinghui@sangfor.com.cn>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Doug Berger <opendmb@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hangyu Hua <hbh25y@gmail.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiajun Xie <jiajun.xie.sh@gmail.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maxwell <jmaxwell37@gmail.com>
  Jorge Ramirez-Ortiz <jorge@foundries.io>
  Kalle Valo <kvalo@codeaurora.org>
  Karen Ostrowska <karen.ostrowska@intel.com>
  Ke Xiao <xiaoke@sangfor.com.cn>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Michael Chan <michael.chan@broadcom.com>
  Michael Walle <mwalle@kernel.org>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Phil Sutter <phil@nwl.cc>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Rafal Romanowski <rafal.romanowski@intel.com>
  Rakesh Pillai <pillair@codeaurora.org>
  Sasha Levin <sashal@kernel.org>
  Siddh Raman Pant <code@siddh.me>
  Stefan Wahren <wahrenst@gmx.net>
  Sudheer Mogilappagari <sudheer.mogilappagari@intel.com>
  Suraj Jitindar Singh <surajjs@amazon.com>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Thomas Lange <thomas@corelatus.se>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tor Vic <torvic9@mailbox.org>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vadim Fedorenko <vadfed@meta.com>
  Wenchao Chen <wenchao.chen@unisoc.com>
  Wolfram Sang <wsa@kernel.org>

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
 build-amd64-pvops                                            fail    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         blocked 
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                blocked 
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      blocked 
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                blocked 
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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

(No revision log; it would be 1379 lines long.)

