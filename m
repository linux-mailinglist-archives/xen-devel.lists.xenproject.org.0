Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE46D9246
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 11:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518783.805641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLbQ-0005xd-OY; Thu, 06 Apr 2023 09:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518783.805641; Thu, 06 Apr 2023 09:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLbQ-0005uh-LU; Thu, 06 Apr 2023 09:08:20 +0000
Received: by outflank-mailman (input) for mailman id 518783;
 Thu, 06 Apr 2023 09:08:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkLbP-0005uX-65; Thu, 06 Apr 2023 09:08:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkLbP-0005HC-3Y; Thu, 06 Apr 2023 09:08:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkLbO-0001MB-KJ; Thu, 06 Apr 2023 09:08:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pkLbO-0006w7-Jr; Thu, 06 Apr 2023 09:08:18 +0000
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
	bh=EnX4CyUyIlLVd/OPkcT7LpM7eS6oFPZK49HT/hv48gc=; b=VhHd+yKtHh7/uMgxLaj/88lmA4
	L/Wbjadli4j3miqIQ7ev2XOovUH3e260o03+XF/4ERal06MhMGsUf/3TSOYIogP2jaIt84qlVLYcr
	JA4L2vg3kOS7mxHTpTO6/44suuTYUxge/w8vxdPStwcoRMONsqGo7wIPcku3yGQAOVkY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180166-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180166: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3e3be2cbc286e773ed5bd3afd5942440546888de
X-Osstest-Versions-That:
    ovmf=8d185dfb66700e65035d51f149570aeab728c665
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Apr 2023 09:08:18 +0000

flight 180166 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180166/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3e3be2cbc286e773ed5bd3afd5942440546888de
baseline version:
 ovmf                 8d185dfb66700e65035d51f149570aeab728c665

Last test of basis   180164  2023-04-06 01:42:38 Z    0 days
Testing same since   180166  2023-04-06 07:10:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Jiewen Yao <jiewen.yao@intel.com>

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
   8d185dfb66..3e3be2cbc2  3e3be2cbc286e773ed5bd3afd5942440546888de -> xen-tested-master

