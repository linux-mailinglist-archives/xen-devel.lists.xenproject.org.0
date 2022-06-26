Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F114555B402
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 22:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356126.584161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5YhH-0005IF-1V; Sun, 26 Jun 2022 20:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356126.584161; Sun, 26 Jun 2022 20:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5YhG-0005Ex-Sz; Sun, 26 Jun 2022 20:17:30 +0000
Received: by outflank-mailman (input) for mailman id 356126;
 Sun, 26 Jun 2022 20:17:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o5YhF-0005En-Sw; Sun, 26 Jun 2022 20:17:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o5YhF-00062s-Nl; Sun, 26 Jun 2022 20:17:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o5YhF-0001Md-5h; Sun, 26 Jun 2022 20:17:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o5YhF-0004WG-5E; Sun, 26 Jun 2022 20:17:29 +0000
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
	bh=I34pBH3mCICqYm2qLXwkUWpHfhVbfNgrlD5gHGQVI1k=; b=J+Eb/BZtmPITBy3ENrrTFNifcc
	JwUX30LgcXI0k7t3RKNN6M7zV4AHurPHpTDBiywvz3cAM1Ny2HIAlCLr0bF24a7q0eRCPCjK2EPWs
	oKT3TZZkWmWpVkuZW+8SReOmy8iVsiq9tYF7jXmi6MfB6s1x1halKBXeOAnRyPR4JsPg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171360-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 171360: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pygrub:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine-uefi:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine-bios:reboot:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=0840a7914caa14315a3191178a9f72c742477860
X-Osstest-Versions-That:
    linux=354c6e071be986a44b956f7b57f1884244431048
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Jun 2022 20:17:29 +0000

flight 171360 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171360/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-freebsd11-amd64  8 xen-boot             fail REGR. vs. 171277
 test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot              fail REGR. vs. 171277
 test-amd64-amd64-qemuu-nested-amd  8 xen-boot            fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-ovmf-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl           8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-credit1   8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-shadow    8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-credit2   8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-multivcpu  8 xen-boot                fail REGR. vs. 171277
 test-amd64-amd64-xl-vhd       8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 171277
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-libvirt-pair 12 xen-boot/src_host       fail REGR. vs. 171277
 test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 171277
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 171277
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 171277
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-pvhv2-amd  8 xen-boot                fail REGR. vs. 171277
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 171277
 test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 171277
 test-amd64-amd64-examine-bios  8 reboot                  fail REGR. vs. 171277
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-debianhvm-amd64  8 xen-boot    fail REGR. vs. 171277
 test-amd64-amd64-pair        12 xen-boot/src_host        fail REGR. vs. 171277
 test-amd64-amd64-pair        13 xen-boot/dst_host        fail REGR. vs. 171277
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 171277

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      8 xen-boot                 fail REGR. vs. 171277

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171277
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171277
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171277
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                0840a7914caa14315a3191178a9f72c742477860
baseline version:
 linux                354c6e071be986a44b956f7b57f1884244431048

Last test of basis   171277  2022-06-19 03:11:35 Z    7 days
Failing since        171280  2022-06-19 15:12:25 Z    7 days   21 attempts
Testing same since   171356  2022-06-25 21:11:35 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aashish Sharma <shraash@google.com>
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
  Akira Yokosawa <akiyks@gmail.com>
  Alan Liu <HaoPing.Liu@amd.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Egorenkov <egorenar@linux.ibm.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexei Starovoitov <ast@kernel.org>
  Ali Saidi <alisaidi@amazon.com>
  Alistair Popple <apopple@nvidia.com>
  Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
  Anatolii Gerasymenko <anatolii.gerasymenko@intel.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antoine Tenart <atenart@kernel.org>
  Antoniu Miclaus <antoniu.miclaus@analog.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Athira Jajeev <atrajeev@linux.vnet.ibm.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Ballon Shi <ballon.shi@quectel.com>
  Bart Van Assche <bvanassche@acm.org>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Baruch Siach <baruch@tkos.co.il>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Brian Foster <bfoster@redhat.com>
  Carlo Lobrano <c.lobrano@gmail.com>
  Carlos Llamas <cmllamas@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chevron Li <chevron.li@bayhubtech.com>
  Chevron Li<chevron.li@bayhubtech.com>
  Christian Lamparter <chunkeey@gmail.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christian Schoenebeck <linux_oss@crudebyte.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Lameter <cl@linux.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Ciara Loftus <ciara.loftus@intel.com>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Curtis Taylor <cutaylor-pub@yahoo.com>
  Daeho Jeong <daehojeong@google.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Vacura <w36195@motorola.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniil Dementev <d.dementev@ispras.ru>
  Darrick J. Wong <djwong@kernel.org>
  Dave Airlie <airlied@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Howells <dhowells@redhat.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Ding Xiang <dingxiang@cmss.chinamobile.com>
  Dmitry Klochkov <kdmitry556@gmail.com>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Dmitry Rokosov <ddrokosov@sberdevices.ru>
  Dominique Martinet <asmadeus@codewreck.org>
  Douglas Gilbert <dgilbert@interlog.com>
  Dylan Yudaken <dylany@fb.com>
  Eddie Huang <eddie.huang@mediatek.com>
  Edward Wu <edwardwu@realtek.com>
  Eelco Chaudron <echaudro@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Evgeniy Baskov <baskov@ispras.ru>
  Filipe Manana <fdmanana@suse.com>
  Florian Westphal <fw@strlen.de>
  Gautam Menghani <gautammenghani201@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Genjian Zhang <zhanggenjian@kylinos.cn>
  George Shen <george.shen@amd.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Stuebner <heiko@sntech.de>
  Hillf Danton <hdanton@sina.com>
  Hoang Le <hoang.h.le@dektech.com.au>
  Hongyu Xie <xiehongyu1@kylinos.cn>
  Hongyu Xie <xy521521@gmail.com>
  Huacai Chen <chenhuacai@loongson.cn>
  huhai <huhai@kylinos.cn>
  Hyeonggon Yoo <42.hyeyoo@gmail.com>
  Ian Abbott <abbotti@mev.co.uk>
  Ian Rogers <irogers@google.com>
  Ivan Vecera <ivecera@redhat.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jamie Iles <jamie@jamieiles.com>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Wang <jasowang@redhat.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jialin Zhang <zhangjialin11@huawei.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jie2x Zhou <jie2x.zhou@intel.com>
  Jing-Ting Wu <jing-ting.wu@mediatek.com>
  Jiri Olsa <jolsa@kernel.org>
  Joe Damato <jdamato@fastly.com>
  Joel Granados <j.granados@samsung.com>
  Joel Savitz <jsavitz@redhat.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  John Fastabend <john.fastabend@gmail.com>
  Jon <jon.lin@rock-chips.com>
  Jon Lin <jon.lin@rock-chips.com>
  Jon Maloy <jmaloy@redhat.com>
  Jon Maxwell <jmaxwell37@gmail.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Lemon <jonathan.lemon@gmail.com>
  Jonathan Marek <jonathan@marek.ca>
  Jonathan Toppins <jtoppins@redhat.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Joshua Ashton <joshua@froggi.es>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Kees Cook <keescook@chromium.org>
  Ken Moffat <zarniwhoop@ntlworld.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Kuogee Hsieh <quic_khsieh@quicinc.com>
  Lars-Peter Clausen <lars@metafoo.de>
  Leo Savernik <l.savernik@aon.at>
  Leo Yan <leo.yan@linaro.org>
  Li Nan <linan122@huawei.com>
  Liam Beguin <liambeguin@gmail.com>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Ying <victor.liu@nxp.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Lv Ruyi <lv.ruyi@zte.com.cn>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Zyngier <maz@kernel.org>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Pearson <markpearson@lenovo.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maxime Ripard <maxime@cerno.tech>
  Maximilian Luz <luzmaximilian@gmail.com>
  Maya Matuszczyk <maccraft123mc@gmail.com>
  Mengqi Zhang <mengqi.zhang@mediatek.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Petlan <mpetlan@redhat.com>
  Michal Simek <michal.simek@amd.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Mingwei Zhang <mizhang@google.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Chancellor <nathan@kernel.org> # build
  Nico Pache <npache@redhat.com>
  nikitashvets@flyium.com
  Nikos Tsironis <ntsironis@arrikto.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Upton <oupton@google.com>
  Olivier Moysan <olivier.moysan@foss.st.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Peter Gonda <pgonda@google.com>
  Peter Rosin <peda@axentia.se>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Qu Wenruo <wqu@suse.com>
  Quentin Perret <qperret@google.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raghavendra Rao Ananta <rananta@google.com>
  Randy Dunlap <rdunlap@infradead.org>
  Riccardo Paolo Bestetti <pbl@bestov.io>
  Rob Clark <robdclark@chromium.org>
  Rob Clark <robdclark@gmail.com>
  Rob Herring <robh@kernel.org>
  Robert Marko <robimarko@gmail.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Ron Economos <re@w6rz.net>
  Rosemarie O'Riorden <roriorden@redhat.com>
  Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
  Samuel Holland <samuel@sholland.org>
  Sandeep Penigalapati <sandeep.penigalapati@intel.com>
  Sander Vanheule <sander@svanheule.net>
  Sascha Hauer <s.hauer@pengutronix.de>
  Saud Farooqui <farooqui_saud@hotmail.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergey Gorenko <sergeygo@nvidia.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Soham Sen <contact@sohamsen.me>
  Song Liu <songliubraving@fb.com>
  Steev Klimaszewski <steev@kali.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Stephen Boyd <swboyd@chromium.org>
  Stephen Hemminger <stephen@networkplumber.org>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  sunliming <sunliming@kylinos.cn>
  syzbot+3e3f419f4a7816471838@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tali Perry <tali.perry1@gmail.com>
  Tanveer Alam <tanveer1.alam@intel.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tim Crawford <tcrawford@system76.com>
  Tom Schwindl <schwindl@posteo.de>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Utkarsh Patel <utkarsh.h.patel@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vadim Fedorenko <vadfed@fb.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wentao_Liang <Wentao_Liang_g@163.com>
  Wojciech Drewek <wojciech.drewek@intel.com>
  Wolfram Sang <wsa@kernel.org>
  Xiang wangx <wangxiang@cdjrlc.com>
  Xiubo Li <xiubli@redhat.com>
  Xu Jia <xujia39@huawei.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yannick Brosseau <yannick.brosseau@gmail.com>
  Ying Xue <ying.xue@windriver.com>
  Yonghong Song <yhs@fb.com>
  Yonglin Tan <yonglin.tan@outlook.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yu Liao <liaoyu15@huawei.com>
  Zheyu Ma <zheyuma97@gmail.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

(No revision log; it would be 9761 lines long.)

