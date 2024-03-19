Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351087FD89
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 13:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695354.1085021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmYZ7-0005Uw-R2; Tue, 19 Mar 2024 12:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695354.1085021; Tue, 19 Mar 2024 12:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmYZ7-0005Sa-NR; Tue, 19 Mar 2024 12:27:37 +0000
Received: by outflank-mailman (input) for mailman id 695354;
 Tue, 19 Mar 2024 12:27:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmYZ6-0005SQ-Ju; Tue, 19 Mar 2024 12:27:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmYZ6-00034x-4j; Tue, 19 Mar 2024 12:27:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmYZ5-0003Hf-PM; Tue, 19 Mar 2024 12:27:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rmYZ5-0002db-Oo; Tue, 19 Mar 2024 12:27:35 +0000
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
	bh=LsYTGBI2WMI9KhvtEv/tOjK7S3h+U+QyuEsbwV/8ILA=; b=Zjnby8KtiButM6MQaz7Q9RIMx1
	Xncfi5BmQZUNu2JnpVxsToP2Mw/nJUc6lkabbBJtCvwviJSZFCad2X1ieUIwDOuCahspdG9nmACEK
	/Yiw6xTsPf2b/rHQr1WVTZnAy+u/Xl1acF8E/Qy7C5/1RRFdHtooPGMone8EmeZqz/Zo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185093-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185093: regressions - trouble: blocked/broken/pass
X-Osstest-Failures:
    ovmf:build-amd64-pvops:<job status>:broken:regression
    ovmf:build-amd64-pvops:host-build-prep:fail:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=35f6a2780e5198315a9f100c07b3bc86187d20a8
X-Osstest-Versions-That:
    ovmf=3840c35e34d1c992268092b6366e26f2acc55a75
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Mar 2024 12:27:35 +0000

flight 185093 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185093/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-pvops               <job status>                 broken
 build-amd64-pvops             5 host-build-prep          fail REGR. vs. 185049

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a

version targeted for testing:
 ovmf                 35f6a2780e5198315a9f100c07b3bc86187d20a8
baseline version:
 ovmf                 3840c35e34d1c992268092b6366e26f2acc55a75

Last test of basis   185049  2024-03-15 12:41:10 Z    3 days
Testing same since   185093  2024-03-19 10:11:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ceping Sun <cepingx.sun@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
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

broken-job build-amd64-pvops broken

Not pushing.

------------------------------------------------------------
commit 35f6a2780e5198315a9f100c07b3bc86187d20a8
Author: Ceping Sun <cepingx.sun@intel.com>
Date:   Tue Feb 27 05:18:33 2024 +0800

    OvmfPkg/TdxDxe: Clear the registers before tdcall
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4696
    
    Refer to the [GHCI] spec, TDVF should clear the BIT5 for RBP in the mask.
    And TDVF should clear the regitsers to avoid leaking secrets to VMM.
    
    Reference:
    [GHCI]: TDX Guest-Host-Communication Interface v1.5
    https://cdrdv2.intel.com/v1/dl/getContent/726792
    
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Michael Roth <michael.roth@amd.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: Isaku Yamahata <isaku.yamahata@intel.com>
    Signed-off-by: Ceping Sun <cepingx.sun@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
    Reviewed-by: Min Xu <min.m.xu@intel.com>

commit a1a6da80aa80baecfba71a4d8e4c38dbb8f2f4d3
Author: Ceping Sun <cepingx.sun@intel.com>
Date:   Tue Feb 27 05:18:32 2024 +0800

    OvmfPkg/CcExitLib: Update TDVMCALL_EXPOSE_REGS_MASK
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4696
    
    Refer to the [GHCI] spec, TDVF should clear the BIT5 for RBP in the mask.
    
    Reference:
    [GHCI]: TDX Guest-Host-Communication Interface v1.5
    https://cdrdv2.intel.com/v1/dl/getContent/726792
    
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Michael Roth <michael.roth@amd.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Cc: Isaku Yamahata <isaku.yamahata@intel.com>
    Signed-off-by: Ceping Sun <cepingx.sun@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
    Reviewed-by: Min Xu <min.m.xu@intel.com>

commit 07c49d5d402429ef4dbe1da5f8371a0a07bcc279
Author: Ceping Sun <cepingx.sun@intel.com>
Date:   Tue Feb 27 05:18:31 2024 +0800

    MdePkg/BaseLib: Update TDVMCALL_EXPOSE_REGS_MASK
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4696
    
    Refer to the [GHCI] spec, TDVF should clear the BIT5 for RBP in the mask.
    
    Reference:
    [GHCI]: TDX Guest-Host-Communication Interface v1.5
    https://cdrdv2.intel.com/v1/dl/getContent/726792
    
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Michael Roth <michael.roth@amd.com>
    Cc: Isaku Yamahata <isaku.yamahata@intel.com>
    Signed-off-by: Ceping Sun <cepingx.sun@intel.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

