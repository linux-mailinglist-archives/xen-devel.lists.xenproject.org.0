Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3142D6533BF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 17:04:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467983.727047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p81YN-00005c-3A; Wed, 21 Dec 2022 16:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467983.727047; Wed, 21 Dec 2022 16:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p81YM-0008Uw-VB; Wed, 21 Dec 2022 16:02:46 +0000
Received: by outflank-mailman (input) for mailman id 467983;
 Wed, 21 Dec 2022 16:02:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p81YK-0008Um-OJ; Wed, 21 Dec 2022 16:02:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p81YK-0007L6-Lz; Wed, 21 Dec 2022 16:02:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p81YK-00087l-8A; Wed, 21 Dec 2022 16:02:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p81YK-0008Q4-5f; Wed, 21 Dec 2022 16:02:44 +0000
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
	bh=v2wrQHRVMUreBpZJrHJfNIAo4Qx1gka0FsBpIQLhwz4=; b=HnfoHga+qu/4q65Bj597cRvuVW
	8Klj+2bmp66V0IWgL2gbIn4eWdCCUzwPUtd7G+KsYNcu6dg52bjVjYhQChPNJZI0vTbcYdoP0c1gp
	XOGj+FX12ZcKFL8HVK8oLjlBqsN3eZGWlBqguGPLvo7PbixrBQx0WRY84sFk8+9eWtWg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175441-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175441: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0b633b14944903c32aa061befaf38bd8d994cf13
X-Osstest-Versions-That:
    ovmf=d103840cfb559c28831c2635b916d60118f671cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Dec 2022 16:02:44 +0000

flight 175441 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175441/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0b633b14944903c32aa061befaf38bd8d994cf13
baseline version:
 ovmf                 d103840cfb559c28831c2635b916d60118f671cc

Last test of basis   175202  2022-12-14 13:42:59 Z    7 days
Failing since        175214  2022-12-14 18:42:16 Z    6 days   41 attempts
Testing same since   175441  2022-12-21 11:13:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Adam Dunlap <acdunlap@google.com>
  Anthony PERARD <anthony.perard@citrix.com>
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
  Matt DeVillier <matt.devillier@gmail.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>
  Nishant C Mistry <nishant.c.mistry@intel.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <quic_rcran@quicinc.com>
  Rebecca Cran <rebecca@quicinc.com>
  Sean Rhodes <sean@starlabs.systems>
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
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   d103840cfb..0b633b1494  0b633b14944903c32aa061befaf38bd8d994cf13 -> xen-tested-master

