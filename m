Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5566D03E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 21:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478972.742525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHWAo-00086l-6I; Mon, 16 Jan 2023 20:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478972.742525; Mon, 16 Jan 2023 20:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHWAo-00084E-30; Mon, 16 Jan 2023 20:33:42 +0000
Received: by outflank-mailman (input) for mailman id 478972;
 Mon, 16 Jan 2023 20:33:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pHWAm-000844-Ng; Mon, 16 Jan 2023 20:33:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pHWAm-0001FX-Kn; Mon, 16 Jan 2023 20:33:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pHWAm-0006aF-BO; Mon, 16 Jan 2023 20:33:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pHWAm-0008TN-Ar; Mon, 16 Jan 2023 20:33:40 +0000
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
	bh=9xMYiKPFrPeB5Sjo139AHShTvAJ5UA0mBdciQk1W7Hk=; b=S4BYxTI+r1i9XAZdMASVJzD3Aw
	/wYvl1QjsixLPQSbQ+6uY8kPzHSPjkIv7D3Jpztjj6YPHPgNQoGbj39l3eKcYvlzoeuTi5N8fWLwr
	PdN9LDCUWdXMcHLllaokuFr+waQhgZ2KXkA/j7CL44hKCrzj22wcXcSKMGmPmV/C+Vks=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175922-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 175922: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:build-armhf:<job status>:broken:regression
    qemu-mainline:build-armhf:host-install(4):broken:regression
    qemu-mainline:build-amd64:xen-build:fail:regression
    qemu-mainline:build-amd64-xsm:xen-build:fail:regression
    qemu-mainline:build-i386:xen-build:fail:regression
    qemu-mainline:build-arm64-xsm:xen-build:fail:regression
    qemu-mainline:build-i386-xsm:xen-build:fail:regression
    qemu-mainline:build-arm64:xen-build:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:build-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:build-arm64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:build-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    qemuu=886fb67020e32ce6a2cf7049c6f017acf1f0d69a
X-Osstest-Versions-That:
    qemuu=aa96ab7c9df59c615ca82b49c9062819e0a1c287
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Jan 2023 20:33:40 +0000

flight 175922 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175922/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   4 host-install(4)        broken REGR. vs. 175743
 build-amd64                   6 xen-build                fail REGR. vs. 175743
 build-amd64-xsm               6 xen-build                fail REGR. vs. 175743
 build-i386                    6 xen-build                fail REGR. vs. 175743
 build-arm64-xsm               6 xen-build                fail REGR. vs. 175743
 build-i386-xsm                6 xen-build                fail REGR. vs. 175743
 build-arm64                   6 xen-build                fail REGR. vs. 175743

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a

version targeted for testing:
 qemuu                886fb67020e32ce6a2cf7049c6f017acf1f0d69a
baseline version:
 qemuu                aa96ab7c9df59c615ca82b49c9062819e0a1c287

Last test of basis   175743  2023-01-12 13:41:12 Z    4 days
Failing since        175750  2023-01-13 06:38:52 Z    3 days   10 attempts
Testing same since   175835  2023-01-14 07:07:10 Z    2 days    9 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Hildenbrand <david@redhat.com>
  Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Eric Auger <eric.auger@redhat.com>
  Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
  Felipe Balbi <balbi@kernel.org>
  Joe Richey <joerichey@google.com>
  Klaus Jensen <k.jensen@samsung.com>
  Marcel Holtmann <marcel@holtmann.org>
  Niek Linnenbank <nieklinnenbank@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>
  Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
  Strahinja Jankovic <strahinjapjankovic@gmail.com>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-arm64                                                  fail    
 build-armhf                                                  broken  
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
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
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      blocked 
 test-amd64-i386-xl-vhd                                       blocked 


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

broken-job build-armhf broken
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 1426 lines long.)

