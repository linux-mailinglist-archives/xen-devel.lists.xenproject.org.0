Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834198A5937
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 19:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706414.1103555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwQF9-0004Kj-Gj; Mon, 15 Apr 2024 17:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706414.1103555; Mon, 15 Apr 2024 17:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwQF9-0004JN-DC; Mon, 15 Apr 2024 17:35:47 +0000
Received: by outflank-mailman (input) for mailman id 706414;
 Mon, 15 Apr 2024 17:35:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQF8-0004JD-Jj; Mon, 15 Apr 2024 17:35:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQF8-0001v1-GO; Mon, 15 Apr 2024 17:35:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQF8-000483-9p; Mon, 15 Apr 2024 17:35:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwQF8-0005QD-9T; Mon, 15 Apr 2024 17:35:46 +0000
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
	bh=Dv+cRvqMp5E6GE78BTYW1zpTv8WGPVBlDhODQYEKBiU=; b=spJE94YjhxJrbEH+yGcMBVoNSQ
	x77FywU08qkxrQnYXzifHr55JvboyqtvYnSB9F0GNFr/33B6yPMVHdFBo/SC11ZylBprdJLBvNsn7
	6jp6J8lMTMQbykZJ4ett4MAKWqhCLEmattNGZjOmK1L/83IMHfggLiba5lKTOcttjayk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185604-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 185604: regressions - trouble: blocked/broken
X-Osstest-Failures:
    seabios:build-amd64:<job status>:broken:regression
    seabios:build-amd64-pvops:<job status>:broken:regression
    seabios:build-amd64-xsm:<job status>:broken:regression
    seabios:build-i386:<job status>:broken:regression
    seabios:build-i386-pvops:<job status>:broken:regression
    seabios:build-i386-xsm:<job status>:broken:regression
    seabios:build-amd64:host-build-prep:fail:regression
    seabios:build-amd64-xsm:host-build-prep:fail:regression
    seabios:build-amd64-pvops:host-build-prep:fail:regression
    seabios:build-i386-xsm:host-build-prep:fail:regression
    seabios:build-i386:host-build-prep:fail:regression
    seabios:build-i386-pvops:host-build-prep:fail:regression
    seabios:build-amd64-libvirt:build-check(1):blocked:nonblocking
    seabios:build-i386-libvirt:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    seabios=e5f2e4c69643bc3cd385306a9e5d29e11578148c
X-Osstest-Versions-That:
    seabios=c5a361c09a19e3b1a83557b01f11f04b27181a11
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Apr 2024 17:35:46 +0000

flight 185604 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185604/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64                   5 host-build-prep          fail REGR. vs. 185287
 build-amd64-xsm               5 host-build-prep          fail REGR. vs. 185287
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 185287
 build-i386-xsm                5 host-build-prep          fail REGR. vs. 185287
 build-i386                    5 host-build-prep          fail REGR. vs. 185287
 build-i386-pvops              5 host-build-prep          fail REGR. vs. 185287

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a

version targeted for testing:
 seabios              e5f2e4c69643bc3cd385306a9e5d29e11578148c
baseline version:
 seabios              c5a361c09a19e3b1a83557b01f11f04b27181a11

Last test of basis   185287  2024-04-09 15:42:58 Z    6 days
Testing same since   185604  2024-04-15 13:42:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniil Tatianin <d-tatianin@yandex-team.ru>
  Kevin O'Connor <kevin@koconnor.net>

jobs:
 build-amd64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 


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
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken

Not pushing.

------------------------------------------------------------
commit e5f2e4c69643bc3cd385306a9e5d29e11578148c
Author: Daniil Tatianin <d-tatianin@yandex-team.ru>
Date:   Thu Apr 11 22:51:35 2024 +0300

    pciinit: don't misalign large BARs
    
    Previously we would unconditionally lower the alignment for large BARs
    in case their alignment was greater than "pci_mem64_top >> 11", this
    would make it impossible to use these devices by the kernel:
        [   13.821108] pci 0000:9c:00.0: can't claim BAR 1 [mem 0x66000000000-0x67fffffffff 64bit pref]: no compatible bridge window
        [   13.823492] pci 0000:9d:00.0: can't claim BAR 1 [mem 0x64000000000-0x65fffffffff 64bit pref]: no compatible bridge window
        [   13.824218] pci 0000:9e:00.0: can't claim BAR 1 [mem 0x62000000000-0x63fffffffff 64bit pref]: no compatible bridge window
        [   13.828322] pci 0000:8a:00.0: can't claim BAR 1 [mem 0x6e000000000-0x6ffffffffff 64bit pref]: no compatible bridge window
        [   13.830691] pci 0000:8b:00.0: can't claim BAR 1 [mem 0x6c000000000-0x6dfffffffff 64bit pref]: no compatible bridge window
        [   13.832218] pci 0000:8c:00.0: can't claim BAR 1 [mem 0x6a000000000-0x6bfffffffff 64bit pref]: no compatible bridge window
    
    Fix it by only overwriting the alignment in case it's actually greater
    than the desired by the BAR window.
    
    Fixes: 96a8d130a8c ("be less conservative with the 64bit pci io window")
    Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
    Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

commit 731c88d503ef07a06a03dd17a6e9163941b329da
Author: Kevin O'Connor <kevin@koconnor.net>
Date:   Mon Apr 1 13:44:58 2024 -0400

    stdvgaio: Only read/write one color palette entry at a time
    
    Introduce stdvga_dac_read_many() and stdvga_dac_write_many() for
    writing multiple dac palette entries.  Convert the stdvga_dac_read()
    and stdvga_dac_write() low-level IO access functions in stdvgaio.c to
    access just one color palette entry.
    
    Signed-off-by: Kevin O'Connor <kevin@koconnor.net>

