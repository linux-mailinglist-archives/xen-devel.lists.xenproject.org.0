Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0FF909632
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2024 07:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740966.1148050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIM4a-0004lA-QF; Sat, 15 Jun 2024 05:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740966.1148050; Sat, 15 Jun 2024 05:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIM4a-0004io-NA; Sat, 15 Jun 2024 05:35:32 +0000
Received: by outflank-mailman (input) for mailman id 740966;
 Sat, 15 Jun 2024 05:35:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIM4a-0004ie-4y; Sat, 15 Jun 2024 05:35:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIM4Z-0007sM-NS; Sat, 15 Jun 2024 05:35:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sIM4Z-0007F5-Do; Sat, 15 Jun 2024 05:35:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sIM4Z-0004cv-DD; Sat, 15 Jun 2024 05:35:31 +0000
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
	bh=uuP59QluP5Vrl1hiIGwaKUkyJ2rwf1H29ny0CS0tpb8=; b=GS7pSqXDURVVlgr7Ik8JTpxf97
	8yfI4p/xh6+3NzXb1aSCbvyyeJ+fZ4UYYI3YqOcPSb5TUCbYaI0PpjVJZwjt5LImW9QwBOaTAV+bN
	DKGdCcQb8Rbyl7+39JAyjFP3jA1w3NRXuXeocU12i4LI5VhNcKyBTZEf69xqHMMi7LpM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186358-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186358: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cf323e2839ce260fde43487baae205527dee1b2f
X-Osstest-Versions-That:
    ovmf=5e776299a2604b336a947e68593012ab2cc16eb4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 Jun 2024 05:35:31 +0000

flight 186358 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186358/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cf323e2839ce260fde43487baae205527dee1b2f
baseline version:
 ovmf                 5e776299a2604b336a947e68593012ab2cc16eb4

Last test of basis   186352  2024-06-14 13:42:52 Z    0 days
Testing same since   186358  2024-06-15 04:11:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Pierre Gondois <pierre.gondois@arm.com>

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
   5e776299a2..cf323e2839  cf323e2839ce260fde43487baae205527dee1b2f -> xen-tested-master

