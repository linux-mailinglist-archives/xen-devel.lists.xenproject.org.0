Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424B2C824A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40863.73865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgXK-0001o8-VV; Mon, 30 Nov 2020 10:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40863.73865; Mon, 30 Nov 2020 10:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgXK-0001ng-RV; Mon, 30 Nov 2020 10:36:02 +0000
Received: by outflank-mailman (input) for mailman id 40863;
 Mon, 30 Nov 2020 10:36:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kjgXJ-0001nY-CK; Mon, 30 Nov 2020 10:36:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kjgXJ-0001RQ-97; Mon, 30 Nov 2020 10:36:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kjgXJ-0004Cm-0B; Mon, 30 Nov 2020 10:36:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kjgXI-0007hu-W0; Mon, 30 Nov 2020 10:36:00 +0000
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
	bh=8O71Y70zQclewrxCglZZ7J8boJp0UScJw1GcYmrm/Tg=; b=mxvh90PPM7TqPQkv0q1ScJuwrK
	XWpPepyFJgp19UWzqkwipPKPL0Zr46xiWTw4513ueI+oiWJyLeJg7MMZwECfJscTTDCjYihtyVrkc
	8xksA/AZELQ5u4FwaRA72pvQJE8aKwMlxtnWzR+lCz9OLTlbW3dKoBnRaoONOYdgNNGg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157104-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157104: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8501bb0c05ad9dd7ef6504803678866b1d23f6ab
X-Osstest-Versions-That:
    ovmf=f69a2b9a42029bcbcf88d074425ebe63495b0a08
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Nov 2020 10:36:00 +0000

flight 157104 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157104/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8501bb0c05ad9dd7ef6504803678866b1d23f6ab
baseline version:
 ovmf                 f69a2b9a42029bcbcf88d074425ebe63495b0a08

Last test of basis   157060  2020-11-27 19:10:46 Z    2 days
Testing same since   157104  2020-11-30 03:09:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen, Christine <Yuwei.Chen@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   f69a2b9a42..8501bb0c05  8501bb0c05ad9dd7ef6504803678866b1d23f6ab -> xen-tested-master

