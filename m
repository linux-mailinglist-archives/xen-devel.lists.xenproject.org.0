Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323CE97A728
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 20:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799644.1209619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqGEV-0007CH-Oy; Mon, 16 Sep 2024 18:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799644.1209619; Mon, 16 Sep 2024 18:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqGEV-0007Ah-MH; Mon, 16 Sep 2024 18:13:55 +0000
Received: by outflank-mailman (input) for mailman id 799644;
 Mon, 16 Sep 2024 18:13:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqGEU-0007AX-GP; Mon, 16 Sep 2024 18:13:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqGEU-0001SN-FP; Mon, 16 Sep 2024 18:13:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqGET-0005tj-SE; Mon, 16 Sep 2024 18:13:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sqGET-0007Vi-RX; Mon, 16 Sep 2024 18:13:53 +0000
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
	bh=LR1iLAsGk/p8C4Sxu3EA1LRsERgC9FulpYjdAMJyeiA=; b=dvkfbnlUjiqG1MQfjvuUlSKwyM
	mMLxVXM8CNFXwgT+ndikyiA1J9IsIaDvnSRzbItkS5D+k3svhxyF0pSjdLgtKnfeEq+EiPYe2C616
	pHfdAkzGdtMx4v1QWZngEVnPmKo4FjoRYAv0ii7YlotNe/pUt3xwAGcUYtko4oJprRLs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187722-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187722: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=670e263419eb875fd8dce0c8d18dd3ab02b83ba0
X-Osstest-Versions-That:
    ovmf=7843c8da060484cdb4239078544cab807377070d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 Sep 2024 18:13:53 +0000

flight 187722 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187722/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 670e263419eb875fd8dce0c8d18dd3ab02b83ba0
baseline version:
 ovmf                 7843c8da060484cdb4239078544cab807377070d

Last test of basis   187719  2024-09-16 09:45:07 Z    0 days
Testing same since   187722  2024-09-16 16:43:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   7843c8da06..670e263419  670e263419eb875fd8dce0c8d18dd3ab02b83ba0 -> xen-tested-master

