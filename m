Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F5C7F33DA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638045.994284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TiW-0005yt-Ow; Tue, 21 Nov 2023 16:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638045.994284; Tue, 21 Nov 2023 16:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TiW-0005wN-KW; Tue, 21 Nov 2023 16:35:16 +0000
Received: by outflank-mailman (input) for mailman id 638045;
 Tue, 21 Nov 2023 16:35:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5TiU-0005wD-IW; Tue, 21 Nov 2023 16:35:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5TiU-0006Fk-He; Tue, 21 Nov 2023 16:35:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r5TiU-0007W5-1b; Tue, 21 Nov 2023 16:35:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r5TiU-0003ia-1C; Tue, 21 Nov 2023 16:35:14 +0000
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
	bh=EAouZo0oFQAZMCy6fPNQ5EvbD1GKpFuyupqaqcY0WQ0=; b=YEDe5yykU8WKP6n+JBIrbU1nJC
	o++zniKrugFZqtwG6tiT5ZTL4/VWY0M90X7j88FCu8YH3pa95ntnK1CCw14L/ZyJkBT0q1tnLENqF
	6PLi4dik9djLxnnOfdBtSmx8NMDy6SldAeq2PLkFR0o/H5pItHPn2lbcwz4VaU2iVjhs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183810-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183810: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=23dbb8a07d108a7b8589e31639b6302b70445b9f
X-Osstest-Versions-That:
    ovmf=3db76e6476e493d3cda45b81bba99a645180cf35
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Nov 2023 16:35:14 +0000

flight 183810 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183810/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 23dbb8a07d108a7b8589e31639b6302b70445b9f
baseline version:
 ovmf                 3db76e6476e493d3cda45b81bba99a645180cf35

Last test of basis   183758  2023-11-15 04:11:08 Z    6 days
Testing same since   183810  2023-11-21 14:42:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashish Singhal <ashishsingha@nvidia.com>

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
   3db76e6476..23dbb8a07d  23dbb8a07d108a7b8589e31639b6302b70445b9f -> xen-tested-master

