Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E56650579
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 00:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465725.724506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p72pv-00023G-3A; Sun, 18 Dec 2022 23:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465725.724506; Sun, 18 Dec 2022 23:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p72pu-00021I-VS; Sun, 18 Dec 2022 23:12:50 +0000
Received: by outflank-mailman (input) for mailman id 465725;
 Sun, 18 Dec 2022 23:12:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p72pu-000218-EO; Sun, 18 Dec 2022 23:12:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p72pu-0003ba-DI; Sun, 18 Dec 2022 23:12:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p72pt-0003mf-Ty; Sun, 18 Dec 2022 23:12:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p72pt-0004sC-TX; Sun, 18 Dec 2022 23:12:49 +0000
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
	bh=gL9pZtOwnluj6SSNXpIYVckjMbZvdSLVdUwP4CxVA2k=; b=iZWDwrPYTgHdvkZ0Qil+Yx3gp/
	Wk6seByL2cYm933Iq3W9GtwJENEZx8Q9jzHeJ3DRZ/vie3ie419Eqh2pZ5VXtfXwOEJIATEyO/lJi
	M9cr9pDy1jXzb/eGDkkOghm6egRef3Mr3/Nz+2+Vo1zaPI2tDOGZotG+3vjTe/gGCo2Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175395-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175395: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=4dd7b865565aea4d28bea1b8d57d62620f6015a9
X-Osstest-Versions-That:
    ovmf=d103840cfb559c28831c2635b916d60118f671cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Dec 2022 23:12:49 +0000

flight 175395 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175395/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202

version targeted for testing:
 ovmf                 4dd7b865565aea4d28bea1b8d57d62620f6015a9
baseline version:
 ovmf                 d103840cfb559c28831c2635b916d60118f671cc

Last test of basis   175202  2022-12-14 13:42:59 Z    4 days
Failing since        175214  2022-12-14 18:42:16 Z    4 days   29 attempts
Testing same since   175384  2022-12-18 03:41:23 Z    0 days    8 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Dunlap <acdunlap@google.com>
  Ard Biesheuvel <ardb@kernel.org>
  devel@edk2.groups.io <devel@edk2.groups.io>
  Dov Murik <dovmurik@linux.ibm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jeff Brasen <jbrasen@nvidia.com>
  Jeshua Smith <jeshuas@nvidia.com>
  Jiaqi Gao <jiaqi.gao@intel.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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

(No revision log; it would be 573 lines long.)

