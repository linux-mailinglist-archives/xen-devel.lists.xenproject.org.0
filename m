Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC58CCBC1
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 07:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728058.1132813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA0wb-0000ew-Bc; Thu, 23 May 2024 05:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728058.1132813; Thu, 23 May 2024 05:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA0wb-0000cG-8W; Thu, 23 May 2024 05:24:49 +0000
Received: by outflank-mailman (input) for mailman id 728058;
 Thu, 23 May 2024 05:24:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0wZ-0000c6-Vi; Thu, 23 May 2024 05:24:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0wZ-0006A0-Rk; Thu, 23 May 2024 05:24:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0wZ-0005sI-H2; Thu, 23 May 2024 05:24:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0wZ-0008Jf-Gi; Thu, 23 May 2024 05:24:47 +0000
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
	bh=3rP/tPnms7Ju16XCN7dRvBA02MfIgkfvLbjfHTq3ODk=; b=mXoh2lYXyWfwINGJxGX9JxcaRo
	P8MO+ypEeyn0UXVI7Ds7WEGIipM/Qvlu2eY1DvVWj72yhhH8LzDf/g0hqtq5Q2Ydxp2qNA9jSkYDq
	XkiN1keoRpW8tZp6N/6bM6BzM77bTpMBlwQPLFqkjbjUycP/+M4hXenOuB1e51tbVjaI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186072: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-amd64-xsm:xen-build:fail:regression
    linux-linus:build-amd64:xen-build:fail:regression
    linux-linus:build-i386:xen-build:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:build-i386-xsm:xen-build:fail:regression
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:regression
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
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
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
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=29c73fc794c83505066ee6db893b2a83ac5fac63
X-Osstest-Versions-That:
    linux=8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 May 2024 05:24:47 +0000

flight 186072 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186072/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 186052
 build-amd64                   6 xen-build                fail REGR. vs. 186052
 build-i386                    6 xen-build                fail REGR. vs. 186052
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 186052
 build-i386-xsm                6 xen-build                fail REGR. vs. 186052
 test-armhf-armhf-libvirt-vhd  8 xen-boot                 fail REGR. vs. 186052

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
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
 test-armhf-armhf-libvirt   16 saverestore-support-check fail blocked in 186052
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 186052
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                29c73fc794c83505066ee6db893b2a83ac5fac63
baseline version:
 linux                8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6

Last test of basis   186052  2024-05-21 01:42:42 Z    2 days
Failing since        186065  2024-05-21 16:10:24 Z    1 days    2 attempts
Testing same since   186072  2024-05-22 07:52:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Liang, Kan" <kan.liang@linux.intel.com>
  "Ricardo B. Marliere" <ricardo@marliere.net>
  Abel Vesa <abel.vesa@linaro.org>
  Adam Ford <aford173@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Egorenkov <egorenar@linux.ibm.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexey Kardashevskiy <aik@amd.com>
  Allen Pais <allen.lkml@gmail.com>
  Allen Pais <apais@linux.microsoft.com>
  Amrit Anand <quic_amrianan@quicinc.com>
  Andi Kleen <ak@linux.intel.com>
  Andrew Davis <afd@ti.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anne Macedo <retpolanne@posteo.net>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Apurva Nandan <a-nandan@ti.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Atish Patra <atishp@rivosinc.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Baruch Siach <baruch@tkos.co.il>
  Beleswar Padhi <b-padhi@ti.com>
  Ben Levinsky <ben.levinsky@amd.com>
  Benjamin Tissoires <bentiss@kernel.org>
  Bhaskar Chowdhury <unixbhaskar@gmail.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Chaitanya S Prakash <chaitanyas.prakash@arm.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen Pei <cp0613@linux.alibaba.com>
  Christian Brauner <brauner@kernel.org>
  Clark Wang <xiaoning.wang@nxp.com>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Golle <daniel@makrotopia.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Danila Tikhonov <danila@jiaxyga.com>
  Dave Jiang <dave.jiang@intel.com>
  Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
  Devyn Liu <liudingyuan@huawei.com>
  Dima Kogan <dima@secretsauce.net>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dominique Martinet <asmadeus@codewreck.org>
  Duoming Zhou <duoming@zju.edu.cn>
  Eric Heintzmann <heintzmann.eric@free.fr>
  Erick Archer <erick.archer@outlook.com>
  Ethan Adams <j.ethan.adams@gmail.com>
  Fenghua Yu <fenghua.yu@intel.com>
  Frank Li <Frank.Li@nxp.com>
  Frank Wang <frank.wang@rock-chips.com>
  Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL
  Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Hans de Goede <hdegoede@redhat.com>
  Harald Freudenberger <freude@linux.ibm.com>
  He Zhe <zhe.he@windriver.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Holger Dengler <dengler@linux.ibm.com>
  Howard Chu <howardchu95@gmail.com>
  Ian Rogers <irogers@google.com>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Iuliana Prodan <iuliana.prodan@nxp.com>
  James Clark <james.clark@arm.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason-JH.Lin <jason-jh.lin@mediatek.com>
  Jassi Brar <jassisinghbrar@gmail.com>
  Jens Remus <jremus@linux.ibm.com>
  Jerry Snitselaar <jsnitsel@redhat.com>
  Jiri Olsa <jolsa@kernel.org>
  Joao Pinto <Joao.Pinto@synopsys.com>
  Joao Pinto <jpinto@synopsys.com>
  Joy Zou <joy.zou@nxp.com>
  Jules Irenge <jbi.octave@gmail.com>
  Julien Panis <jpanis@baylibre.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Komal Bajaj <quic_kbajaj@quicinc.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Konstantin Kharlamov <Hi-Angel@yandex.ru>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Kunwu Chan <chentao@kylinos.cn>
  Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  Kyle Meyer <kyle.meyer@hpe.com>
  Laura Nao <laura.nao@collabora.com>
  Leonard Crestez <cdleonard@gmail.com>
  Lijun Pan <lijun.pan@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Luca Weiss <luca@z3ntu.xyz>
  Lucas Stach <l.stach@pengutronix.de>
  Madadi Vineeth Reddy <vineethr@linux.ibm.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mateusz Kaduk <mateusz.kaduk@gmail.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Michal Simek <michal.simek@amd.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@kernel.org>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mrinmay Sarkar <quic_msarkar@quicinc.com>
  Nam Cao <namcao@linutronix.de>
  Namhyung Kim <namhyung@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicolin Chen <b42378@freescale.com>
  Niklas Cassel <cassel@kernel.org>
  Nuno Sa <nuno.sa@analog.com>
  Olivia Wen <olivia.wen@mediatek.com>
  Peng Ma <andypma@tencent.com>
  Peter Griffin <peter.griffin@linaro.org>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  Ricardo B. Marliere <ricardo@marliere.net>
  Richard Leitner <richard.leitner@skidata.com>
  Rick Wertenbroek <rick.wertenbroek@gmail.com>
  Rob Herring (Arm) <robh@kernel.org>
  Rob Herring <robh@kernel.org>
  Robin Gong <yibin.gong@nxp.com>
  Rohit Agarwal <quic_rohiagar@quicinc.com>
  Saeed Nowshadi <saeed.nowshadi@amd.com>
  Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
  Sandipan Das <sandipan.das@amd.com>
  Satish Thatchanamurthy <Satish.Thatchanamurt@Dell.com> # one platform
  Sean Anderson <sean.anderson@linux.dev>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
  Stephen Rothwell <sfr@canb.auug.org.au> # PowerPC le incermental build
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Schnelle <svens@linux.ibm.com>
  Tan Chun Hau <chunhau.tan@starfivetech.com>
  Tanmay Shah <tanmay.shah@amd.com>
  Thomas Huth <thuth@redhat.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Tommaso Merciai <tomm.merciai@gmail.com>
  Tycho Andersen <tycho@tycho.pizza>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vidya Sagar <vidyas@nvidia.com>
  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Vinod Koul <vkoul@kernel.org>
  Vipul Kumar <vipul_kumar@mentor.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Weilin Wang <weilin.wang@intel.com>
  Wendy Wang <wendy.wang@intel.com>
  Yang Jihong <yangjihong@bytedance.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yu Kuai <yukuai3@huawei.com>
  Yury Norov <yury.norov@gmail.com>
  Zhang Yubing <yubing.zhang@rock-chips.com>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      pass    
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 blocked 
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      blocked 
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-libvirt-vhd                                 fail    
 test-amd64-amd64-xl-vhd                                      blocked 
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

(No revision log; it would be 17610 lines long.)

