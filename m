Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E210467DFD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 20:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237930.412618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtE48-0007WW-3L; Fri, 03 Dec 2021 19:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237930.412618; Fri, 03 Dec 2021 19:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtE47-0007Tf-Tp; Fri, 03 Dec 2021 19:17:51 +0000
Received: by outflank-mailman (input) for mailman id 237930;
 Fri, 03 Dec 2021 19:17:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtE46-0007TV-DD; Fri, 03 Dec 2021 19:17:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtE46-0003MQ-7S; Fri, 03 Dec 2021 19:17:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtE45-0000cC-Qs; Fri, 03 Dec 2021 19:17:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mtE45-0001YP-QO; Fri, 03 Dec 2021 19:17:49 +0000
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
	bh=XNM2hQDfmfsWcIs1//8EnStcYqOahUgDpR9bf3inPFs=; b=WWCZjNLRaz8boVRjCjvVJJyMVY
	SoR9Kej8ziEWrrAC2mf4KHsYBM/+ybHmgepK38C5YgkeF/TyZLGUmaeVMGLft7ZJuldx8OS/Q52Zy
	Iyq87IT7PL/62Byen7k7lELudP4OwGwF+jLgGjN9ILUAVPqO7JkwWPOzI9vlqpqtZv84=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167058-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 167058: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:nested-setup:fail:regression
    qemu-mainline:test-arm64-arm64-xl-seattle:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-xl:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-credit2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-shadow:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start.2:fail:regression
    qemu-mainline:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-pvshim:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-arm64-arm64-xl-credit1:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-arm64-arm64-xl-thunderx:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-multivcpu:guest-start.2:fail:regression
    qemu-mainline:test-amd64-i386-xl-shadow:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-xsm:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-arm64-arm64-xl-credit2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
    qemu-mainline:test-arm64-arm64-xl-xsm:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-rtds:guest-start:fail:allowable
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=a69254a2b320e31d3aa63ca910b7aa02efcd5492
X-Osstest-Versions-That:
    qemuu=50456a6794fbb8dc94a31eb9534e91c586da7add
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Dec 2021 19:17:49 +0000

flight 167058 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167058/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-amd 13 nested-setup        fail REGR. vs. 166954
 test-arm64-arm64-xl-seattle 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-coresched-amd64-xl 22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-pvhv2-amd 22 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 166954
 test-amd64-amd64-xl         22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-libvirt    20 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-credit2 22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-shadow  22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-libvirt     20 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-libvirt-xsm 21 guest-start.2            fail REGR. vs. 166954
 test-amd64-amd64-xl-credit1 22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-pvhv2-intel 22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-pvshim  22 guest-start/debian.repeat fail REGR. vs. 166954
 test-arm64-arm64-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-arm64-arm64-xl-thunderx 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-multivcpu 23 guest-start.2           fail REGR. vs. 166954
 test-amd64-i386-xl-shadow   22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-xsm      22 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-dom0pvh-xl-intel 22 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 166954
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 166954
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-arm64-arm64-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. 166954
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166954
 test-arm64-arm64-xl-xsm     18 guest-start/debian.repeat fail REGR. vs. 166954
 test-armhf-armhf-libvirt-qcow2 17 guest-start/debian.repeat fail REGR. vs. 166954

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 166954
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 166954

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166954
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 166954
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166954
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166954
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 166954
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166954
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                a69254a2b320e31d3aa63ca910b7aa02efcd5492
baseline version:
 qemuu                50456a6794fbb8dc94a31eb9534e91c586da7add

Last test of basis   166954  2021-11-30 08:39:11 Z    3 days
Failing since        166968  2021-12-01 06:37:45 Z    2 days    4 attempts
Testing same since   167058  2021-12-03 01:55:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eduardo Habkost <ehabkost@redhat.com>
  John Snow <jsnow@redhat.com>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Richard Henderson <richard.henderson@linaro.org>

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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-amd64-i386-xl-shadow                                    fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 fail    
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

------------------------------------------------------------
commit a69254a2b320e31d3aa63ca910b7aa02efcd5492
Merge: 682aa69b1f cc20926e9b
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Thu Dec 2 08:49:51 2021 -0800

    Merge tag 'ide-pull-request' of https://gitlab.com/jsnow/qemu into staging
    
    Pull request
    
    # gpg: Signature made Wed 01 Dec 2021 10:17:38 PM PST
    # gpg:                using RSA key F9B7ABDBBCACDF95BE76CBD07DEF8106AAFC390E
    # gpg: Good signature from "John Snow (John Huston) <jsnow@redhat.com>" [full]
    
    * tag 'ide-pull-request' of https://gitlab.com/jsnow/qemu:
      tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
      hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
      hw/block/fdc: Extract blk_create_empty_drive()
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit cc20926e9b8077bff6813efc8dcdeae90d1a3b10
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Wed Nov 24 17:15:36 2021 +0100

    tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
    
    Without the previous commit, when running 'make check-qtest-i386'
    with QEMU configured with '--enable-sanitizers' we get:
    
      AddressSanitizer:DEADLYSIGNAL
      =================================================================
      ==287878==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000344
      ==287878==The signal is caused by a WRITE memory access.
      ==287878==Hint: address points to the zero page.
          #0 0x564b2e5bac27 in blk_inc_in_flight block/block-backend.c:1346:5
          #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
          #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
          #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
          #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
          #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9
    
    Add the reproducer for CVE-2021-20196.
    
    Suggested-by: Alexander Bulekov <alxndr@bu.edu>
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Message-id: 20211124161536.631563-4-philmd@redhat.com
    Signed-off-by: John Snow <jsnow@redhat.com>

commit 1ab95af033a419e7a64e2d58e67dd96b20af5233
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Wed Nov 24 17:15:35 2021 +0100

    hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
    
    Guest might select another drive on the bus by setting the
    DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
    The current controller model doesn't expect a BlockBackend
    to be NULL. A simple way to fix CVE-2021-20196 is to create
    an empty BlockBackend when it is missing. All further
    accesses will be safely handled, and the controller state
    machines keep behaving correctly.
    
    Cc: qemu-stable@nongnu.org
    Fixes: CVE-2021-20196
    Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Message-id: 20211124161536.631563-3-philmd@redhat.com
    BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
    Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Reviewed-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Signed-off-by: John Snow <jsnow@redhat.com>

commit b154791e7b6d4ca5cdcd54443484d97360bd7ad2
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Wed Nov 24 17:15:34 2021 +0100

    hw/block/fdc: Extract blk_create_empty_drive()
    
    We are going to re-use this code in the next commit,
    so extract it as a new blk_create_empty_drive() function.
    
    Inspired-by: Hanna Reitz <hreitz@redhat.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Message-id: 20211124161536.631563-2-philmd@redhat.com
    Signed-off-by: John Snow <jsnow@redhat.com>

commit 682aa69b1f4dd5f2905a94066fa4c853adc33251
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed Dec 1 07:20:06 2021 +0100

    Update version for v6.2.0-rc3 release
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 24c4cd1311a45fa8ecfcde2f7b7afe84eb17dfac
Author: Eduardo Habkost <ehabkost@redhat.com>
Date:   Tue Nov 30 15:47:22 2021 -0500

    MAINTAINERS: Change my email address
    
    The ehabkost@redhat.com email address will stop working on
    2021-12-01, change it to my personal email address.
    
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
    Message-Id: <20211129163053.2506734-1-ehabkost@redhat.com>
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
    Message-Id: <20211130204722.2732997-2-ehabkost@redhat.com>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

