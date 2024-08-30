Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBE8965643
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 06:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786197.1195731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjt9l-0004me-1Y; Fri, 30 Aug 2024 04:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786197.1195731; Fri, 30 Aug 2024 04:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjt9k-0004k3-Uc; Fri, 30 Aug 2024 04:22:40 +0000
Received: by outflank-mailman (input) for mailman id 786197;
 Fri, 30 Aug 2024 04:22:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjt9j-0004jq-Ah; Fri, 30 Aug 2024 04:22:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjt9j-0003f2-0K; Fri, 30 Aug 2024 04:22:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjt9i-0006ZL-H6; Fri, 30 Aug 2024 04:22:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjt9i-0003oX-GP; Fri, 30 Aug 2024 04:22:38 +0000
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
	bh=+t0gGbCjmKW2GXOS0NItuD7L4klGtD6DAXJTfyyIA1o=; b=f8t1BNuXu9H1kozWIonLEduKKY
	UWzv8yxGN+eYwU4k2MV2OFKG6xeh9SN/xDcX3JbhDRGCFAz7Xmo3qnsU6ibbirCAsGWvgIr8taWa8
	+T0yaA3itxJCEIFzdIyB1xMIirThIFfkvEP7ReNXw8POPGEkcTy83xo8vehtaV9tlArQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187413-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187413: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6a7be5a8418ab6397375e32e399e9523db9d4293
X-Osstest-Versions-That:
    ovmf=b6c4708c4d3470cfd9f465771a665510d3ad1a66
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2024 04:22:38 +0000

flight 187413 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187413/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6a7be5a8418ab6397375e32e399e9523db9d4293
baseline version:
 ovmf                 b6c4708c4d3470cfd9f465771a665510d3ad1a66

Last test of basis   187409  2024-08-29 20:11:30 Z    0 days
Testing same since   187413  2024-08-30 01:56:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   b6c4708c4d..6a7be5a841  6a7be5a8418ab6397375e32e399e9523db9d4293 -> xen-tested-master

