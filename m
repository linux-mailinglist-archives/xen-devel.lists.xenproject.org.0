Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5166E8B10DE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 19:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711594.1111658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzgL4-0000IY-4Q; Wed, 24 Apr 2024 17:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711594.1111658; Wed, 24 Apr 2024 17:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzgL4-0000Gx-13; Wed, 24 Apr 2024 17:23:22 +0000
Received: by outflank-mailman (input) for mailman id 711594;
 Wed, 24 Apr 2024 17:23:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzgL1-0000Gn-R8; Wed, 24 Apr 2024 17:23:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzgL1-0006wa-Ld; Wed, 24 Apr 2024 17:23:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzgL1-0007az-Ax; Wed, 24 Apr 2024 17:23:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzgL1-0003Z0-AR; Wed, 24 Apr 2024 17:23:19 +0000
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
	bh=mjcUuLRUPIRSH60FfPDaYaeHR7ffPohNI9Gy7G2hReE=; b=dAHUMyFFIkq4W/Xf/xbKehcQHG
	ovA7riZcFyPN639/SJtm7nNss5J0zfVHiUGwDgIG8gn9vrcwqlo87NT+AO5QiUOWmSScGVIO06RnG
	+WDktfem1tvW3kn2qOuumhWlgOiFURv8V+0B3OI7kBVPTrboQM418h79f5SV3XLDygYU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185782-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 185782: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:build-arm64-pvops:<job status>:broken:regression
    linux-5.4:build-arm64-xsm:<job status>:broken:regression
    linux-5.4:build-arm64-libvirt:<job status>:broken:regression
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:regression
    linux-5.4:build-arm64-libvirt:host-build-prep:fail:regression
    linux-5.4:build-arm64-pvops:host-build-prep:fail:regression
    linux-5.4:build-arm64-xsm:host-build-prep:fail:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:guest-start/redhat.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-examine:reboot:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-raw:debian-di-install:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-qcow2:debian-di-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-vhd:debian-di-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start.2:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start.2:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=0dbd436fb9908fbb442cb4c6e28044a891360229
X-Osstest-Versions-That:
    linux=24489321d0cd5339f9c2da01eb8bf2bccbac7956
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Apr 2024 17:23:19 +0000

flight 185782 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185782/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops               <job status>                 broken  in 185433
 build-arm64-xsm                 <job status>                 broken  in 185433
 build-arm64-libvirt             <job status>                 broken  in 185433
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail REGR. vs. 185168
 build-arm64-libvirt          5 host-build-prep fail in 185433 REGR. vs. 185168
 build-arm64-pvops            5 host-build-prep fail in 185433 REGR. vs. 185168
 build-arm64-xsm              5 host-build-prep fail in 185433 REGR. vs. 185168

Tests which are failing intermittently (not blocking):
 test-amd64-i386-qemut-rhel6hvm-amd 14 guest-start/redhat.repeat fail in 185433 pass in 185782
 test-armhf-armhf-examine      8 reboot           fail in 185769 pass in 185782
 test-arm64-arm64-libvirt-raw 13 guest-start      fail in 185769 pass in 185782
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail in 185769 pass in 185782
 test-amd64-i386-libvirt-raw  12 debian-di-install          fail pass in 185433
 test-amd64-i386-libvirt-qcow2 12 debian-di-install         fail pass in 185433
 test-amd64-i386-xl-vhd       12 debian-di-install          fail pass in 185433
 test-armhf-armhf-xl-multivcpu 14 guest-start               fail pass in 185769

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-examine      1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 185433 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 185433 n/a
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail blocked in 185168
 test-armhf-armhf-xl-credit2  19 guest-start.2 fail in 185433 blocked in 185168
 test-armhf-armhf-xl-credit1  14 guest-start         fail in 185433 like 185168
 test-amd64-i386-libvirt-raw 14 migrate-support-check fail in 185433 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 185433 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 185433 never pass
 test-amd64-i386-libvirt-qcow2 14 migrate-support-check fail in 185433 never pass
 test-armhf-armhf-xl-credit1  19 guest-start.2 fail in 185769 blocked in 185168
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 185769 like 185168
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185168
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185168
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 185168
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185168
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 185168
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185168
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185168
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185168
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 185168
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 185168
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 185168
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                0dbd436fb9908fbb442cb4c6e28044a891360229
baseline version:
 linux                24489321d0cd5339f9c2da01eb8bf2bccbac7956

Last test of basis   185168  2024-03-26 23:14:28 Z   28 days
Testing same since   185433  2024-04-13 11:16:55 Z   11 days   13 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Andrey Jr. Melnikov" <temnota.am@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksandr Burakov <a.burakov@rosalinux.ru>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Henrie <alexhenrie24@gmail.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexandre Chartre <alexandre.chartre@oracle.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andreas Larsson <andreas@gaisler.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrew Paniakin <apanyaki@amazon.com>
  Andrey Jr. Melnikov <temnota.am@gmail.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Aric Cyr <aric.cyr@amd.com>
  Arnd Bergmann <arnd@arndb.de>
  Arseniy Krasnov <avkrasnov@salutedevices.com>
  Aurélien Jacobs <aurel@gnuage.org>
  Baokun Li <libaokun1@huawei.com>
  Bart Van Assche <bvanassche@acm.org>
  Bastien Nocera <hadess@hadess.net>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Camelia Groza <camelia.groza@nxp.com>
  Cameron Williams <cang1@live.co.uk>
  Carlo Caione <ccaione@baylibre.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Charlie Jenkins <charlie@rivosinc.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Brauner <brauner@kernel.org>
  Christian Häggström <christian.haggstrom@orexplore.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Conrad Kostecki <conikost@gentoo.org>
  Dai Ngo <dai.ngo@oracle.com>
  Damian Muszynski <damian.muszynski@intel.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Drake <drake@endlessos.org>
  Daniel Vogelbacher <daniel@chaospixel.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Stevenson <dave.stevenson@raspberrypi.org>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dominique Martinet <dominique.martinet@atmark-techno.com>
  Duje Mihanović <duje.mihanovic@skole.hr>
  Duoming Zhou <duoming@zju.edu.cn>
  Edward Adam Davis <eadavis@qq.com>
  Eric Dumazet <edumazet@google.com>
  Felix Fietkau <nbd@nbd.name>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Gabor Juhos <j4g8y7@gmail.com>
  Genjian Zhang <zhanggenjian@kylinos.cn>
  Gergo Koteles <soyer@irl.hu>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Goldwyn Rodrigues <rgoldwyn@suse.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gui-Dong Han <2045gemini@gmail.com>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Guo Mengqi <guomengqi3@huawei.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harald Freudenberger <freude@linux.ibm.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hidenori Kobayashi <hidenorik@chromium.org>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Hui Wang <hui.wang@canonical.com>
  I Gede Agastya Darma Laksana <gedeagas22@gmail.com>
  Ian Abbott <abbotti@mev.co.uk>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jacopo Mondi <jacopo@jmondi.org>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jian-Hong Pan <jhp@endlessos.org>
  Joe Perches <joe@perches.com>
  Johan Hovold <johan@kernel.org>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  John Fastabend <john.fastabend@gmail.com>
  John Ogness <john.ogness@linutronix.de>
  John Sperbeck <jsperbeck@google.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Corbet <corbet@lwn.net>
  Josef Bacik <josef@toxicpanda.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Josua Mayer <josua@solid-run.com>
  Juergen Gross <jgross@suse.com>
  Justin Tee <justin.tee@broadcom.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karthikeyan Ramasubramanian <kramasub@chromium.org>
  Keerthana K <keerthana.kalyanasundaram@broadcom.com>
  Kees Cook <keescook@chromium.org>
  kernelci.org bot <bot@kernelci.org>
  Kevin Hilman <khilman@baylibre.com>
  Kim Phillips <kim.phillips@amd.com>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kuntal Nayak <kuntal.nayak@broadcom.com>
  Kunwu Chan <chentao@kylinos.cn>
  Lin Yujun <linyujun809@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu Shixin <liushixin2@huawei.com>
  Lubomir Rintel <lkundrak@v3.sk>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Mahmoud Adam <mngyadam@amazon.com>
  Marco Felsch <m.felsch@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Martijn Coenen <maco@android.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maulik Shah <quic_mkshah@quicinc.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Ripard <mripard@kernel.org>
  Maximilian Heyne <mheyne@amazon.de>
  Mel Gorman <mgorman@techsingularity.net>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikko Rapeli <mikko.rapeli@linaro.org>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicolas Pitre <nico@fluxnic.net>
  Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  Niklas Cassel <cassel@kernel.org>
  Nilesh Javali <njavali@marvell.com>
  OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Barker <paul.barker.ct@bp.renesas.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Petre Rodan <petre.rodan@subdimension.ro>
  Philipp Zabel <p.zabel@pengutronix.de>
  Piotr Wejman <piotrwejman90@gmail.com>
  Przemek Kitszel <przemyslaw.kitszel@intel.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qiang Zhang <qiang4.zhang@intel.com>
  Qingliang Li <qingliang.li@mediatek.com>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ricardo B. Marliere <ricardo@marliere.net>
  Richard Weinberger <richard@nod.at>
  Ricky Wu <ricky_wu@realtek.com>
  Roberto Sassu <roberto.sassu@huawei.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Smirnov <r.smirnov@omp.ru>
  Rui Qi <qirui.001@bytedance.com>
  Ryosuke Yasuoka <ryasuoka@redhat.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sandipan Das <sandipan.das@amd.com>
  Sasha Levin <sashal@kernel.org>
  Sean Anderson <sean.anderson@linux.dev>
  Sean Anderson <sean.anderson@seco.com>
  Sean Christopherson <seanjc@google.com>
  SeongJae Park <sj@kernel.org>
  Shannon Nelson <shannon.nelson@amd.com>
  Sherry Sun <sherry.sun@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Siddh Raman Pant <code@siddh.me>
  Song Liu <song@kernel.org>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srivathsa Dara <srivathsa.d.dara@oracle.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Lee <slee08177@gmail.com>
  Steve Wahl <steve.wahl@hpe.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Svyatoslav Pankratov <svyatoslav.pankratov@intel.com>
  syzbot+d4066896495db380182e@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tim Schumacher <timschumi@gmx.de>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Toru Katagiri <Toru.Katagiri@tdk.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasiliy Kovalev <kovalev@altlinux.org>
  Vasily Gorbik <gor@linux.ibm.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vlastimil Babka <vbabka@suse.cz>
  William Tu <u9012063@gmail.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xiao Ni <xni@redhat.com>
  Yang Jihong <yangjihong1@huawei.com>
  yangerkun <yangerkun@huawei.com>
  Yangxi Xiang <xyangxi5@gmail.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yu Kuai <yukuai3@huawei.com>
  yuan linyu <yuanlinyu@hihonor.com>
  Zhang Shurong <zhang_shurong@foxmail.com>
  Zhang Yi <yi.zhang@huawei.com>
  Zheng Wang <zyytlz.wz@163.com>
  Zhong Jinghua <zhongjinghua@huawei.com>
  Zi Yan <ziy@nvidia.com>
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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-qemuu-freebsd10-amd64                        pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-qemuu-freebsd10-i386                         pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-i386-libvirt-qcow2                                fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       fail    


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

broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-arm64-libvirt broken

Not pushing.

(No revision log; it would be 6848 lines long.)

