Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077A41E00B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 19:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200170.354609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVziz-0004cv-Tp; Thu, 30 Sep 2021 17:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200170.354609; Thu, 30 Sep 2021 17:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVziz-0004ar-Lg; Thu, 30 Sep 2021 17:20:01 +0000
Received: by outflank-mailman (input) for mailman id 200170;
 Thu, 30 Sep 2021 17:20:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzix-0004ad-V8; Thu, 30 Sep 2021 17:19:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzix-00051x-Oo; Thu, 30 Sep 2021 17:19:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzix-0003P9-9B; Thu, 30 Sep 2021 17:19:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzix-00044l-8g; Thu, 30 Sep 2021 17:19:59 +0000
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
	bh=KFASEe5cphzgTA/addmm0dOEy5F8IoO0ljH2HFrqo4Q=; b=hhRqKDEOVmDqUj5PqlyZ9bwQ+l
	KW+HBdxdUwe7XboiZAdwzdI9NTcqOX1DrlHP834H2f4FX8QEoigAcHbZjOeV/Q6Lfl+WlsQwSWvM0
	C2TIVKf0ysMjQ76kqe0lelqy2mpq/4RvNxcVHsXzWOB896xp3rXLEP/xJyRg82R5rMF8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165330-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165330: trouble: pass/preparing
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:running:regression
X-Osstest-Versions-This:
    ovmf=9e950cda6ad9dab6bb31868d341e3f5d8cd296e3
X-Osstest-Versions-That:
    ovmf=442e46d3b6c1931b54111c92e0efb5a797bc622b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Sep 2021 17:19:59 +0000

flight 165330 ovmf running [real]
http://logs.test-lab.xenproject.org/osstest/logs/165330/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate               running

version targeted for testing:
 ovmf                 9e950cda6ad9dab6bb31868d341e3f5d8cd296e3
baseline version:
 ovmf                 442e46d3b6c1931b54111c92e0efb5a797bc622b

Last test of basis   165321  2021-09-29 20:41:38 Z    0 days
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin12@gmail.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         preparing
 test-amd64-i386-xl-qemuu-ovmf-amd64                          preparing


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
commit 9e950cda6ad9dab6bb31868d341e3f5d8cd296e3
Author: Kun Qin <kuqin12@gmail.com>
Date:   Thu Sep 16 08:14:20 2021 +0800

    MdeModulePkg: CI YAML: Added new GUID to ignore duplicate list
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3629
    
    SMM Communication PPI GUID from MdeModulePkg is defined the same as MM
    Communication PPI GUID from MdePkg, according to PI Spec v1.5 and onward.
    
    After introduction of MM Communication PPI definitions, an update in the
    ignore duplicate list is needed to avoid breaking CI build.
    
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    
    Signed-off-by: Kun Qin <kuqin12@gmail.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

commit 8b4bb94f6484f84d48a3dc77fa31e954fc75c4b5
Author: Kun Qin <kuqin12@gmail.com>
Date:   Thu Sep 16 08:14:19 2021 +0800

    MdePkg: CI YAML: Added new GUID to ignore duplicate list
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3629
    
    SMM Communication PPI GUID from MdeModulePkg is defined the same as MM
    Communication PPI GUID from MdePkg, according to PI Spec v1.5 and onward.
    
    After introduction of MM Communication PPI definitions, an update in the
    ignore duplicate list is needed to avoid breaking CI build.
    
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>
    
    Signed-off-by: Kun Qin <kuqin12@gmail.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

commit f86de75862c20077aa9e7dbe71c9c9182d783d5f
Author: Kun Qin <kuqin12@gmail.com>
Date:   Thu Sep 16 08:14:18 2021 +0800

    MdePkg: MmCommunication: Added definition of MM Communication PPI
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3629
    
    MM Communication PPI was defined in PI Specification since v1.5. This
    change added definition of such PPI and related GUIDs into MdePkg.
    
    Cc: Michael D Kinney <michael.d.kinney@intel.com>
    Cc: Liming Gao <gaoliming@byosoft.com.cn>
    Cc: Zhiguang Liu <zhiguang.liu@intel.com>
    Cc: Sean Brogan <sean.brogan@microsoft.com>
    
    Signed-off-by: Kun Qin <kuqin12@gmail.com>
    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

commit bd298d75934a7a0cf6b9e2863a5e4975e9714285
Author: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date:   Wed Sep 15 09:25:06 2021 +0800

    OvmfPkg: Reference new Tcg2PlatformPei in the build system
    
    Compile the Tcg2PlatformPei related code now to support TPM 2 platform
    hierachy disablement if the TPM state cannot be resumed upon S3 resume.
    
    Cc: Rebecca Cran <rebecca@bsdio.com>
    Cc: Peter Grehan <grehan@freebsd.org>
    Cc: Brijesh Singh <brijesh.singh@amd.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
    Cc: Jordan Justen <jordan.l.justen@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>

commit 8ab8fbc016e789bb45b2c8fb7a6887a28cc32353
Author: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date:   Wed Sep 15 09:25:05 2021 +0800

    OvmfPkg: Reference new Tcg2PlatformDxe in the build system for compilation
    
    Compile the Tcg2PlatformDxe related code now.
    
    Cc: Rebecca Cran <rebecca@bsdio.com>
    Cc: Peter Grehan <grehan@freebsd.org>
    Cc: Brijesh Singh <brijesh.singh@amd.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
    Cc: Jordan Justen <jordan.l.justen@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>

commit b8675deaa819631db2667df63f89799fe65fc906
Author: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date:   Wed Sep 15 09:25:04 2021 +0800

    OvmfPkg: Handle TPM 2 physical presence opcodes much earlier
    
    Handle the TPM 2 physical presence interface (PPI) opcodes in
    PlatformBootManagerBeforeConsole() before the TPM 2 platform hierarchy
    is disabled. Since the handling of the PPI opcodes may require inter-
    action with the user, initialize the keyboard before handling PPI codes.
    
    Cc: Rebecca Cran <rebecca@bsdio.com>
    Cc: Peter Grehan <grehan@freebsd.org>
    Cc: Brijesh Singh <brijesh.singh@amd.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
    Cc: Jordan Justen <jordan.l.justen@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>

commit 499c4608b13df0738213329722cdcb0ac838f3ad
Author: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date:   Wed Sep 15 09:25:03 2021 +0800

    OvmfPkg/TPM PPI: Connect default consoles for user interaction
    
    Activate the default console when user interaction is required for
    the processing of TPM 2 physical presence interface opcodes.
    
    Background:
    TPM 2 physical presence interface (PPI) opcodes need to be handled before
    the TPM 2 platform hierarchy is disabled. Due to this requirement we will
    move the function call to handle the PPI opcodes into
    PlatformBootManagerBeforeConsole() which runs before the initialization
    of the consoles. However, since for interaction with the user we need
    the console to be available, activate it now before displaying any message
    to the user.
    
    Cc: Rebecca Cran <rebecca@bsdio.com>
    Cc: Peter Grehan <grehan@freebsd.org>
    Cc: Brijesh Singh <brijesh.singh@amd.com>
    Cc: Erdem Aktas <erdemaktas@google.com>
    Cc: James Bottomley <jejb@linux.ibm.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Cc: Tom Lendacky <thomas.lendacky@amd.com>
    Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
    Cc: Jordan Justen <jordan.l.justen@intel.com>
    Cc: Gerd Hoffmann <kraxel@redhat.com>
    Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
    Reviewed-by: Jiewen Yao <Jiewen.yao@intel.com>

