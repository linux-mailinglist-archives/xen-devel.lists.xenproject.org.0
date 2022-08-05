Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627C58B2CB
	for <lists+xen-devel@lfdr.de>; Sat,  6 Aug 2022 01:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381637.616377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK6wS-0001SX-3w; Fri, 05 Aug 2022 23:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381637.616377; Fri, 05 Aug 2022 23:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK6wS-0001Q6-1E; Fri, 05 Aug 2022 23:41:20 +0000
Received: by outflank-mailman (input) for mailman id 381637;
 Fri, 05 Aug 2022 23:41:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK6wQ-0001Pw-6g; Fri, 05 Aug 2022 23:41:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK6wQ-0005I5-5o; Fri, 05 Aug 2022 23:41:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK6wP-00031B-Po; Fri, 05 Aug 2022 23:41:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oK6wP-0004OB-PL; Fri, 05 Aug 2022 23:41:17 +0000
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
	bh=1ETLgZ9OM9rEzPhgh65a7CxCo1OBJOzB+SnchSOPD2s=; b=Y2giLE6ykdc4q+mTJUx1SQ9wAX
	YZuE7SWwk7eUG6pn3yuhH7vnE2h+hHbtBGe4S7clLwU55IbpU70Jjr2XBRE97K7Yv9lbTr/oENjbw
	gKylmfH08Hz/Kuqar6ZdBWPe3Bj7U1qTVtpbBzIRKk7I/MB5tEMvBmGlgu3PFSQIJkjg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172205-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172205: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=a8f59e2eb44199040d2e1f747a6d950a25ed0984
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Aug 2022 23:41:17 +0000

flight 172205 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172205/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 a8f59e2eb44199040d2e1f747a6d950a25ed0984
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z    1 days
Testing same since   172151  2022-08-05 02:40:28 Z    0 days    8 attempts

------------------------------------------------------------
People who touched revisions under test:
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-i386-libvirt                                           fail    
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


Not pushing.

------------------------------------------------------------
commit a8f59e2eb44199040d2e1f747a6d950a25ed0984
Author: Czajkowski, Maciej <maciej.czajkowski@intel.com>
Date:   Tue Aug 2 01:00:09 2022 +0800

    MdeModulePkg/AhciPei: Use PCI_DEVICE_PPI to manage AHCI device
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3907
    
    This change modifies AhciPei library to allow usage both EDKII_PCI_DEVICE_PPI
    and EDKII_PEI_ATA_AHCI_HOST_CONTROLLER_PPI to manage ATA HDD working under
    AHCI mode.
    
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Signed-off-by: Maciej Czajkowski <maciej.czajkowski@intel.com>
    Reviewed-by: Hao A Wu <hao.a.wu@intel.com>

commit 86757f0b4750f672f346d955f89e5b76430ba6b4
Author: Czajkowski, Maciej <maciej.czajkowski@intel.com>
Date:   Tue Aug 2 01:00:08 2022 +0800

    MdeModulePkg: Add EDKII_PCI_DEVICE_PPI definition
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3907
    
    This commit introduces EDKII_PCI_DEVICE_PPI. The purpose of this PPI is
    to provide a way of accessing PCI devices to drvice drivers such as
    NvmExpressPei or AhciPei.
    
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Cc: Ray Ni <ray.ni@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Signed-off-by: Maciej Czajkowski <maciej.czajkowski@intel.com>
    Reviewed-by: Hao A Wu <hao.a.wu@intel.com>

