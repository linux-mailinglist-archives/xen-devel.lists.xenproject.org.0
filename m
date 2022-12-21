Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23F4652A4B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 01:09:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467470.726540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7mdt-0005p4-JO; Wed, 21 Dec 2022 00:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467470.726540; Wed, 21 Dec 2022 00:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7mdt-0005li-Ga; Wed, 21 Dec 2022 00:07:29 +0000
Received: by outflank-mailman (input) for mailman id 467470;
 Wed, 21 Dec 2022 00:07:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7mdr-0005lY-Jd; Wed, 21 Dec 2022 00:07:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7mdr-0000bD-HK; Wed, 21 Dec 2022 00:07:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7mdr-0001Zc-0I; Wed, 21 Dec 2022 00:07:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p7mdq-0007uI-W4; Wed, 21 Dec 2022 00:07:26 +0000
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
	bh=oXJmjo65IAqhFVzAW8y7wB7/h2/bcDynDGcTUG9oumQ=; b=CvPl5xDaokUTQC7Ug4obvgjP96
	O3vx1w8LfAlsrPxh+H9+4JTRF/kqLoB1hLdNaMiVeL8LJHUC/RgHyws1/ql67mU4X1Cbn3upA79DJ
	YesKR/XnGC3fNH6N8MJvQYHBEbhd2kpSoZ7aNHtWw/gnHXsFWF7YcyLtnxVM/AghC3eA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175429-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175429: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
X-Osstest-Versions-This:
    ovmf=3f378450dfafc11754bfdb64af28060ec8466acb
X-Osstest-Versions-That:
    ovmf=d103840cfb559c28831c2635b916d60118f671cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Dec 2022 00:07:26 +0000

flight 175429 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175429/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 175202

version targeted for testing:
 ovmf                 3f378450dfafc11754bfdb64af28060ec8466acb
baseline version:
 ovmf                 d103840cfb559c28831c2635b916d60118f671cc

Last test of basis   175202  2022-12-14 13:42:59 Z    6 days
Failing since        175214  2022-12-14 18:42:16 Z    6 days   37 attempts
Testing same since   175423  2022-12-20 10:40:57 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Adam Dunlap <acdunlap@google.com>
  Ard Biesheuvel <ardb@kernel.org>
  Chun-Yi Lee <jlee@suse.com>
  Chun-Yi Lee <joeyli.kernel@gmail.com>
  devel@edk2.groups.io <devel@edk2.groups.io>
  Dov Murik <dovmurik@linux.ibm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  jdzhang <jdzhang@kunluntech.com.cn>
  Jeff Brasen <jbrasen@nvidia.com>
  Jeshua Smith <jeshuas@nvidia.com>
  Jian J Wang <jian.j.wang@intel.com>
  Jiaqi Gao <jiaqi.gao@intel.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Judah Vang <judah.vang@intel.com>
  Kavya <k.kavyax.sravanthi@intel.com>
  Kuo, Ted <ted.kuo@intel.com>
  MarsX Lin <marsx.lin@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Nishant C Mistry <nishant.c.mistry@intel.com>
  Ray Ni <ray.ni@intel.com>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Ted Kuo <ted.kuo@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Xie, Yuanhao <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

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

(No revision log; it would be 894 lines long.)

