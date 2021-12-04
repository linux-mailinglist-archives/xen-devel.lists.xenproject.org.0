Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8D46824E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Dec 2021 05:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238034.412761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtMzb-00046E-Cg; Sat, 04 Dec 2021 04:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238034.412761; Sat, 04 Dec 2021 04:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtMzb-00043y-9N; Sat, 04 Dec 2021 04:49:47 +0000
Received: by outflank-mailman (input) for mailman id 238034;
 Sat, 04 Dec 2021 04:49:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtMza-00043o-Ev; Sat, 04 Dec 2021 04:49:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtMza-0006uO-2E; Sat, 04 Dec 2021 04:49:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtMzZ-0007G5-Nb; Sat, 04 Dec 2021 04:49:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mtMzZ-0001C1-N6; Sat, 04 Dec 2021 04:49:45 +0000
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
	bh=sE+ChIyJ7kLPeV7Di9DipIqy43Bcf7GLG5yffj1BV5o=; b=UqxM057pGR/x7LUinc2NpOHzGv
	wnf1bp3P+X4r02/GJxsZ1BUCH/zLbz5gsY4jXpyUhwFyzdO43WunM+4CRpGVbXkIRfmdVRcVkM7DZ
	FFMOG0XuSvTjb0VmizyaOzESt/zofna7gvk/TgMHGt63961SO1gPBznmLr9izQqQJgBQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167104-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167104: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:regression
X-Osstest-Versions-This:
    ovmf=dfafa8e45382939fb5dc78e9d37b97b500a43613
X-Osstest-Versions-That:
    ovmf=f0f3f5aae7c4d346ea5e24970936d80dc5b60657
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Dec 2021 04:49:45 +0000

flight 167104 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167104/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166961
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166961

version targeted for testing:
 ovmf                 dfafa8e45382939fb5dc78e9d37b97b500a43613
baseline version:
 ovmf                 f0f3f5aae7c4d346ea5e24970936d80dc5b60657

Last test of basis   166961  2021-11-30 14:41:39 Z    3 days
Testing same since   167081  2021-12-03 10:10:57 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>

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

------------------------------------------------------------
commit dfafa8e45382939fb5dc78e9d37b97b500a43613
Author: wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>
Date:   Tue Nov 30 09:51:10 2021 +0800

    MdeModulePkg/DxeCorePerformanceLib:Variable Initial
    
    SmmBootRecordDataSize is initialized in InternalGetSmmPerData,
    but this function may fail. so to avoid using SmmBootRecordDataSize
    without intialization, set it to 0 at first.
    
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Dandan Bi <dandan.bi@intel.com>
    Signed-off-by: Wenyi Xie <xiewenyi2@huawei.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
    Reviewed-by: Dandan Bi <dandan.bi@intel.com>

