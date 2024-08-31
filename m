Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00E9670BF
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 12:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787161.1196776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skL7b-0002gA-1J; Sat, 31 Aug 2024 10:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787161.1196776; Sat, 31 Aug 2024 10:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skL7a-0002ef-Uj; Sat, 31 Aug 2024 10:14:18 +0000
Received: by outflank-mailman (input) for mailman id 787161;
 Sat, 31 Aug 2024 10:14:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skL7Z-0002eV-Jj; Sat, 31 Aug 2024 10:14:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skL7Z-0006LZ-D8; Sat, 31 Aug 2024 10:14:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skL7Y-0008WQ-S6; Sat, 31 Aug 2024 10:14:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skL7Y-0006il-Rh; Sat, 31 Aug 2024 10:14:16 +0000
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
	bh=iSPeDIvdJzR/mo0G27NKtLFDTFcMbw+9sU6Tdj9jHJw=; b=5ts3qFcspYBiGRNgeEGTXvJHaE
	nYuTMJMNNDWkbfrqUZmZGz1sOoWNNL44b5L9XNLQSPj42HA59skIbNXwzUcjWcuyJz0n7c0PXsE/O
	bHNvhzOYkmHfqgd8a5U3jBbyN08Z7BA6cM0mwbfEViSv9f/XjOMmckjIn+t5M9J7N3oo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187435-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187435: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=baecba68a32b26778e902faed64f2e701e584531
X-Osstest-Versions-That:
    ovmf=95ee7f3ef7a34773e0528410fd0178aecfdd89b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Aug 2024 10:14:16 +0000

flight 187435 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187435/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 baecba68a32b26778e902faed64f2e701e584531
baseline version:
 ovmf                 95ee7f3ef7a34773e0528410fd0178aecfdd89b5

Last test of basis   187433  2024-08-31 05:13:31 Z    0 days
Testing same since   187435  2024-08-31 07:41:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali <ashraf.ali.s@intel.com>

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
   95ee7f3ef7..baecba68a3  baecba68a32b26778e902faed64f2e701e584531 -> xen-tested-master

