Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E673F967477
	for <lists+xen-devel@lfdr.de>; Sun,  1 Sep 2024 05:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787314.1196849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skbMj-0000r4-UN; Sun, 01 Sep 2024 03:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787314.1196849; Sun, 01 Sep 2024 03:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skbMj-0000nt-Nw; Sun, 01 Sep 2024 03:35:01 +0000
Received: by outflank-mailman (input) for mailman id 787314;
 Sun, 01 Sep 2024 03:34:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skbMh-0000ni-Pk; Sun, 01 Sep 2024 03:34:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skbMh-0004ur-E2; Sun, 01 Sep 2024 03:34:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skbMg-0007gL-QL; Sun, 01 Sep 2024 03:34:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skbMg-0005y9-Pp; Sun, 01 Sep 2024 03:34:58 +0000
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
	bh=lqP/ZdLgWw5Bxk1Y3H4LieVMVaLmuhJ/vfn5LwZRloM=; b=rMT7kGLhxMdrBMim5BEKy4XWX5
	TztkZF39F6DgqjnD3Zat6Fx+KHNQ7F7/4F+6Bnh6svdbFD94nF6UU309fmfxCdJadbEbYYV1EH9IC
	xJ/hVjKwHqBcKIIBUbJGNbVqFQGpe80V8IrF+Lrnn9DuoRjiZNhbKc3kPoHD8KzxMpR4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187441-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187441: trouble: blocked/broken/pass
X-Osstest-Failures:
    linux-linus:build-amd64:<job status>:broken:regression
    linux-linus:build-amd64-pvops:<job status>:broken:regression
    linux-linus:build-amd64-xsm:<job status>:broken:regression
    linux-linus:build-arm64:<job status>:broken:regression
    linux-linus:build-arm64-pvops:<job status>:broken:regression
    linux-linus:build-arm64-xsm:<job status>:broken:regression
    linux-linus:build-armhf-pvops:<job status>:broken:regression
    linux-linus:build-i386:<job status>:broken:regression
    linux-linus:build-i386-pvops:<job status>:broken:regression
    linux-linus:build-i386-xsm:<job status>:broken:regression
    linux-linus:build-i386-pvops:host-install(4):broken:regression
    linux-linus:build-i386-xsm:host-install(4):broken:regression
    linux-linus:build-i386:host-install(4):broken:regression
    linux-linus:build-arm64-xsm:host-install(4):broken:regression
    linux-linus:build-arm64:host-install(4):broken:regression
    linux-linus:build-arm64-pvops:host-install(4):broken:regression
    linux-linus:build-amd64-xsm:host-install(4):broken:regression
    linux-linus:build-amd64-pvops:host-install(4):broken:regression
    linux-linus:build-amd64:host-install(4):broken:regression
    linux-linus:build-armhf-pvops:host-install(4):broken:regression
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
    linux-linus:build-arm64-libvirt:build-check(1):blocked:nonblocking
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
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    linux=1934261d897467a924e2afd1181a74c1cbfa2c1d
X-Osstest-Versions-That:
    linux=fb24560f31f9dff2c97707cfed6029bfebebaf1c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 01 Sep 2024 03:34:58 +0000

flight 187441 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187441/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-amd64-xsm                 <job status>                 broken
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-armhf-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 187427
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 187427
 build-i386                    4 host-install(4)        broken REGR. vs. 187427
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 187427
 build-arm64                   4 host-install(4)        broken REGR. vs. 187427
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 187427
 build-amd64-xsm               4 host-install(4)        broken REGR. vs. 187427
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 187427
 build-amd64                   4 host-install(4)        broken REGR. vs. 187427
 build-armhf-pvops             4 host-install(4)        broken REGR. vs. 187427

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
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
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
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a

version targeted for testing:
 linux                1934261d897467a924e2afd1181a74c1cbfa2c1d
baseline version:
 linux                fb24560f31f9dff2c97707cfed6029bfebebaf1c

Last test of basis   187427  2024-08-30 18:54:48 Z    1 days
Testing same since   187434  2024-08-31 07:19:23 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bjorn Helgaas <bhelgaas@google.com>
  Darrick J. Wong <djwong@kernel.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Frank Li <Frank.Li@nxp.com>
  Jens Axboe <axboe@kernel.dk>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Richard Zhu <hongxing.zhu@nxp.com>
  Woody Suwalski <terraluna977@gmail.com>

jobs:
 build-amd64-xsm                                              broken  
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-arm64                                                  broken  
 build-armhf                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      blocked 
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      blocked 
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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-amd64-xsm broken
broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-job build-armhf-pvops broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386 host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64 host-install(4)
broken-step build-arm64-pvops host-install(4)
broken-step build-amd64-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-armhf-pvops host-install(4)

Not pushing.

------------------------------------------------------------
commit 1934261d897467a924e2afd1181a74c1cbfa2c1d
Merge: 8101b2766d5b c472d33bcbf7
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Aug 31 15:32:38 2024 +1200

    Merge tag 'input-for-v6.11-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
    
    Pull input fix from Dmitry Torokhov:
    
     - a fix for Cypress PS/2 touchpad for regression introduced in 6.11
       merge window where a timeout condition is incorrectly reported for
       all extended Cypress commands
    
    * tag 'input-for-v6.11-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input:
      Input: cypress_ps2 - fix waiting for command response

commit 8101b2766d5bfee43a4de737107b9592db251470
Merge: 216d163165a9 150b572a7c1d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Aug 31 14:54:11 2024 +1200

    Merge tag 'pci-v6.11-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
    
    Pull pci fixes from Bjorn Helgaas:
    
     - Add Manivannan Sadhasivam as PCI native host bridge and endpoint
       driver reviewer (Manivannan Sadhasivam)
    
     - Disable MHI RAM data parity error interrupt for qcom SA8775P SoC to
       work around hardware erratum that causes a constant stream of
       interrupts (Manivannan Sadhasivam)
    
     - Don't try to fall back to qcom Operating Performance Points (OPP)
       support unless the platform actually supports OPP (Manivannan
       Sadhasivam)
    
     - Add imx@lists.linux.dev mailing list to MAINTAINERS for NXP
       layerscape and imx6 PCI controller drivers (Frank Li)
    
    * tag 'pci-v6.11-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci:
      MAINTAINERS: PCI: Add NXP PCI controller mailing list imx@lists.linux.dev
      PCI: qcom: Use OPP only if the platform supports it
      PCI: qcom-ep: Disable MHI RAM data parity error interrupt for SA8775P SoC
      MAINTAINERS: Add Manivannan Sadhasivam as Reviewer for PCI native host bridge and endpoint drivers

commit 216d163165a937ee9c1d0e9c26fe7a6f7d27ac4c
Merge: ad246d9f04aa e33a97a830b2
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Aug 31 13:54:05 2024 +1200

    Merge tag 'block-6.11-20240830' of git://git.kernel.dk/linux
    
    Pull block fix from Jens Axboe:
     "Fix for a single regression for WRITE_SAME introduced in the 6.11
      merge window"
    
    * tag 'block-6.11-20240830' of git://git.kernel.dk/linux:
      block: fix detection of unsupported WRITE SAME in blkdev_issue_write_zeroes

commit ad246d9f04aa037f8e8bbf8573c9af527114cead
Merge: fb24560f31f9 f274495aea7b
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Aug 31 13:51:27 2024 +1200

    Merge tag 'io_uring-6.11-20240830' of git://git.kernel.dk/linux
    
    Pull io_uring fixes from Jens Axboe:
    
     - A fix for a regression that happened in 6.11 merge window, where the
       copying of iovecs for compat mode applications got broken for certain
       cases.
    
     - Fix for a bug introduced in 6.10, where if using recv/send bundles
       with classic provided buffers, the recv/send would fail to set the
       right iovec count. This caused 0 byte send/recv results. Found via
       code coverage testing and writing a test case to exercise it.
    
    * tag 'io_uring-6.11-20240830' of git://git.kernel.dk/linux:
      io_uring/kbuf: return correct iovec count from classic buffer peek
      io_uring/rsrc: ensure compat iovecs are copied correctly

commit 150b572a7c1df30f5d32d87ad96675200cca7b80
Author: Frank Li <Frank.Li@nxp.com>
Date:   Mon Aug 26 16:27:39 2024 -0400

    MAINTAINERS: PCI: Add NXP PCI controller mailing list imx@lists.linux.dev
    
    Add imx mailing list imx@lists.linux.dev for PCI controller of NXP chips
    (Layerscape and iMX).
    
    Link: https://lore.kernel.org/r/20240826202740.970015-1-Frank.Li@nxp.com
    Signed-off-by: Frank Li <Frank.Li@nxp.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Acked-by: Richard Zhu <hongxing.zhu@nxp.com>

commit f274495aea7b15225b3d83837121b22ef96e560c
Author: Jens Axboe <axboe@kernel.dk>
Date:   Fri Aug 30 10:45:54 2024 -0600

    io_uring/kbuf: return correct iovec count from classic buffer peek
    
    io_provided_buffers_select() returns 0 to indicate success, but it should
    be returning 1 to indicate that 1 vec was mapped. This causes peeking
    to fail with classic provided buffers, and while that's not a use case
    that anyone should use, it should still work correctly.
    
    The end result is that no buffer will be selected, and hence a completion
    with '0' as the result will be posted, without a buffer attached.
    
    Fixes: 35c8711c8fc4 ("io_uring/kbuf: add helpers for getting/peeking multiple buffers")
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

commit 1c47c0d6014c832ad8e2ba04fc2c5b7070d999f7
Author: Jens Axboe <axboe@kernel.dk>
Date:   Wed Aug 28 09:42:33 2024 -0600

    io_uring/rsrc: ensure compat iovecs are copied correctly
    
    For buffer registration (or updates), a userspace iovec is copied in
    and updated. If the application is within a compat syscall, then the
    iovec type is compat_iovec rather than iovec. However, the type used
    in __io_sqe_buffers_update() and io_sqe_buffers_register() is always
    struct iovec, and hence the source is incremented by the size of a
    non-compat iovec in the loop. This misses every other iovec in the
    source, and will run into garbage half way through the copies and
    return -EFAULT to the application.
    
    Maintain the source address separately and assign to our user vec
    pointer, so that copies always happen from the right source address.
    
    While in there, correct a bad placement of __user which triggered
    the following sparse warning prior to this fix:
    
    io_uring/rsrc.c:981:33: warning: cast removes address space '__user' of expression
    io_uring/rsrc.c:981:30: warning: incorrect type in assignment (different address spaces)
    io_uring/rsrc.c:981:30:    expected struct iovec const [noderef] __user *uvec
    io_uring/rsrc.c:981:30:    got struct iovec *[noderef] __user
    
    Fixes: f4eaf8eda89e ("io_uring/rsrc: Drop io_copy_iov in favor of iovec API")
    Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

commit c472d33bcbf7a1ed3710efe93822b5e94eabe18c
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Thu Aug 29 08:38:54 2024 -0700

    Input: cypress_ps2 - fix waiting for command response
    
    Commit 8bccf667f62a ("Input: cypress_ps2 - report timeouts when reading
    command status") uncovered an existing problem with cypress_ps2 driver:
    it tries waiting on a PS/2 device waitqueue without using the rest of
    libps2. Unfortunately without it nobody signals wakeup for the
    waiting process, and each "extended" command was timing out. But the
    rest of the code simply did not notice it.
    
    Fix this by switching from homegrown way of sending request to get
    command response and reading it to standard ps2_command() which does
    the right thing.
    
    Reported-by: Woody Suwalski <terraluna977@gmail.com>
    Tested-by: Woody Suwalski <terraluna977@gmail.com>
    Fixes: 8bccf667f62a ("Input: cypress_ps2 - report timeouts when reading command status")
    Link: https://lore.kernel.org/r/a8252e0f-dab4-ef5e-2aa1-407a6f4c7204@gmail.com
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

commit e33a97a830b230b79a98dbbb4121d4741a2be619
Author: Darrick J. Wong <djwong@kernel.org>
Date:   Tue Aug 27 10:53:40 2024 -0700

    block: fix detection of unsupported WRITE SAME in blkdev_issue_write_zeroes
    
    On error, blkdev_issue_write_zeroes used to recheck the block device's
    WRITE SAME queue limits after submitting WRITE SAME bios.  As stated in
    the comment, the purpose of this was to collapse all IO errors to
    EOPNOTSUPP if the effect of issuing bios was that WRITE SAME got turned
    off in the queue limits.  Therefore, it does not make sense to reuse the
    zeroes limit that was read earlier in the function because we only care
    about the queue limit *now*, not what it was at the start of the
    function.
    
    Found by running generic/351 from fstests.
    
    Fixes: 64b582ca88ca1 ("block: Read max write zeroes once for __blkdev_issue_write_zeroes()")
    Signed-off-by: Darrick J. Wong <djwong@kernel.org>
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: John Garry <john.g.garry@oracle.com>
    Link: https://lore.kernel.org/r/20240827175340.GB1977952@frogsfrogsfrogs
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

commit db1ec60fba4a995975dc1dc837b408db0d666801
Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Mon Jul 22 18:41:28 2024 +0530

    PCI: qcom: Use OPP only if the platform supports it
    
    With commit 5b6272e0efd5 ("PCI: qcom: Add OPP support to scale
    performance"), OPP was used to control the interconnect and power domains
    if the platform supported OPP. Also to maintain the backward compatibility
    with platforms not supporting OPP but just ICC, the above mentioned commit
    assumed that if ICC was not available on the platform, it would resort to
    OPP.
    
    Unfortunately, some old platforms don't support either ICC or OPP. On those
    platforms, resorting to OPP in the absence of ICC throws below errors from
    OPP core during suspend and resume:
    
      qcom-pcie 1c08000.pcie: dev_pm_opp_set_opp: device opp doesn't exist
      qcom-pcie 1c08000.pcie: _find_key: OPP table not found (-19)
    
    Also, it doesn't make sense to invoke the OPP APIs when OPP is not
    supported by the platform at all.
    
    Add a "use_pm_opp" flag to identify whether OPP is supported and use it to
    control invoking the OPP APIs.
    
    Fixes: 5b6272e0efd5 ("PCI: qcom: Add OPP support to scale performance")
    Link: https://lore.kernel.org/linux-pci/20240722131128.32470-1-manivannan.sadhasivam@linaro.org
    Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
    Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Reviewed-by: Mayank Rana <quic_mrana@quicinc.com>

commit 5d6a6c7454ebaefba518e334750b05700131923b
Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Thu Aug 8 12:00:57 2024 +0530

    PCI: qcom-ep: Disable MHI RAM data parity error interrupt for SA8775P SoC
    
    SA8775P SoC has support for the hardware parity check feature on the MHI
    RAM (entity that holds MHI registers, etc.) But due to a hardware bug in
    the parity check logic, the data parity error interrupt is getting
    generated all the time when using MHI. So the hardware team has suggested
    disabling the parity check error to work around the hardware bug.
    
    Mask the parity error interrupt in PARF_INT_ALL_5_MASK register.
    
    Fixes: 58d0d3e032b3 ("PCI: qcom-ep: Add support for SA8775P SOC")
    Link: https://lore.kernel.org/linux-pci/20240808063057.7394-1-manivannan.sadhasivam@linaro.org
    Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
    Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

commit 054308ad90ae43ba2d4b9c83c6582e8fe94f6fed
Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Mon Aug 12 11:27:07 2024 +0530

    MAINTAINERS: Add Manivannan Sadhasivam as Reviewer for PCI native host bridge and endpoint drivers
    
    I've been reviewing the native host bridge drivers for some time and would
    like to be listed as a Reviewer formally.
    
    Link: https://lore.kernel.org/r/20240812055707.6778-1-manivannan.sadhasivam@linaro.org
    Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

