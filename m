Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C036616FD6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 22:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436065.690116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqLMB-0000uS-HK; Wed, 02 Nov 2022 21:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436065.690116; Wed, 02 Nov 2022 21:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqLMB-0000sF-ET; Wed, 02 Nov 2022 21:33:07 +0000
Received: by outflank-mailman (input) for mailman id 436065;
 Wed, 02 Nov 2022 21:33:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqLMA-0000s5-1N; Wed, 02 Nov 2022 21:33:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqLM9-0002gr-U7; Wed, 02 Nov 2022 21:33:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqLM9-0003mN-E4; Wed, 02 Nov 2022 21:33:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oqLM9-0005m6-Da; Wed, 02 Nov 2022 21:33:05 +0000
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
	bh=SvwLHhYWXJMBZprXlLH4JxWhMeyAsYEFVD6el+MOevQ=; b=AKZGoqfLpUJTjymHZgv2Rtj5XH
	nFEiHu3WYakQjW/gIQaaTkt/nM7BLF9G3S7YSO7knimy3JoupBWeslD3Y4D/trmR1joYnKv8ZMvI+
	El282LlJRj3jkcwJZGKBR8qPLUkZMh2TS0RC960hdAajZ2ohPQ9FQR00SUTd8jNdEpRU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174587-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174587: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=957a15adaf72b945d50703977475bf45cbd18c20
X-Osstest-Versions-That:
    ovmf=b5dbf8267b2596f4a28cdb30d1f533b958ddd4ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Nov 2022 21:33:05 +0000

flight 174587 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174587/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 957a15adaf72b945d50703977475bf45cbd18c20
baseline version:
 ovmf                 b5dbf8267b2596f4a28cdb30d1f533b958ddd4ed

Last test of basis   174577  2022-11-02 02:43:42 Z    0 days
Testing same since   174587  2022-11-02 12:11:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   b5dbf8267b..957a15adaf  957a15adaf72b945d50703977475bf45cbd18c20 -> xen-tested-master

