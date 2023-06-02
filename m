Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C578E72095F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 20:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543232.848035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q59nc-0008Bp-3c; Fri, 02 Jun 2023 18:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543232.848035; Fri, 02 Jun 2023 18:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q59nc-00089M-0P; Fri, 02 Jun 2023 18:46:56 +0000
Received: by outflank-mailman (input) for mailman id 543232;
 Fri, 02 Jun 2023 18:46:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q59na-00089C-BW; Fri, 02 Jun 2023 18:46:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q59na-0003H7-2b; Fri, 02 Jun 2023 18:46:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q59nZ-0000iS-Nj; Fri, 02 Jun 2023 18:46:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q59nZ-0006XF-NN; Fri, 02 Jun 2023 18:46:53 +0000
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
	bh=XLMXYD/zoJYS1sUCvVFQc5ZBYWDujTT9D3jckIRWa2U=; b=e5ah82vclwAZ8o3CNxnknzaYig
	dQFo9uw5FmKH0CjlOG1inTh/0FVJWK/6/n9ezi0A6FIf2GslfxLBAGMAqqBidBxd/IEAwhUSrjoFz
	nqgUiU3QmMiL/OzotegKAPxEY3NJEWnfMFBcLMIQauE4dKhQ6p3p0XprcGnItYMKbK8M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181117-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181117: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8fbf857a0b42697c22ec03abda9a2101b2870812
X-Osstest-Versions-That:
    ovmf=4354c22f38778a2bb4644d1f1f43a47e4313fe42
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Jun 2023 18:46:53 +0000

flight 181117 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181117/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8fbf857a0b42697c22ec03abda9a2101b2870812
baseline version:
 ovmf                 4354c22f38778a2bb4644d1f1f43a47e4313fe42

Last test of basis   181111  2023-06-02 11:40:43 Z    0 days
Testing same since   181117  2023-06-02 16:44:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   4354c22f38..8fbf857a0b  8fbf857a0b42697c22ec03abda9a2101b2870812 -> xen-tested-master

