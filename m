Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2A82418D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 13:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661747.1031435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMjN-0000zh-8t; Thu, 04 Jan 2024 12:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661747.1031435; Thu, 04 Jan 2024 12:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMjN-0000xX-5o; Thu, 04 Jan 2024 12:21:49 +0000
Received: by outflank-mailman (input) for mailman id 661747;
 Thu, 04 Jan 2024 12:21:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rLMjL-0000xL-RN; Thu, 04 Jan 2024 12:21:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rLMjL-0001XF-Ns; Thu, 04 Jan 2024 12:21:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rLMjL-0000AF-8R; Thu, 04 Jan 2024 12:21:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rLMjL-000497-7y; Thu, 04 Jan 2024 12:21:47 +0000
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
	bh=AwPM9LCnYsvilaL90V06/4mWmJznxnQLhREL4UIuRYE=; b=p1dnSf5AnrNcyKBJe97y71yera
	V+rmoLl4S1UhuVDCt6gAri380wlkuJHPQJKuLgrPIR6TP+8UPjAhhtBtyEGyExKX4prE1OvVDmK3b
	WMjgZ3Pl0KzDIArUZ6ahFpJRH8SQNUsErueT2q1Lsi+mmZOsS21LENAlQ9okjk4pA/n4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184251-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184251: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e449451770193c8eb36e4dc3a770c8ee353183aa
X-Osstest-Versions-That:
    ovmf=16c8cfc81054aa76e133eab1033560052727cab5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jan 2024 12:21:47 +0000

flight 184251 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184251/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e449451770193c8eb36e4dc3a770c8ee353183aa
baseline version:
 ovmf                 16c8cfc81054aa76e133eab1033560052727cab5

Last test of basis   184246  2024-01-03 16:12:35 Z    0 days
Testing same since   184251  2024-01-04 10:14:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hou, Wenxing <wenxing.hou@intel.com>
  Wenxing Hou <wenxing.hou@intel.com>

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
   16c8cfc810..e449451770  e449451770193c8eb36e4dc3a770c8ee353183aa -> xen-tested-master

