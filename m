Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755893DD2A
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 05:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765828.1176481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXYVn-0008Gh-Ee; Sat, 27 Jul 2024 03:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765828.1176481; Sat, 27 Jul 2024 03:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXYVn-0008EK-Ay; Sat, 27 Jul 2024 03:54:27 +0000
Received: by outflank-mailman (input) for mailman id 765828;
 Sat, 27 Jul 2024 03:54:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXYVm-0008EA-2N; Sat, 27 Jul 2024 03:54:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXYVl-0008Q6-Mv; Sat, 27 Jul 2024 03:54:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXYVl-0007d7-Cc; Sat, 27 Jul 2024 03:54:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sXYVl-0005mL-AX; Sat, 27 Jul 2024 03:54:25 +0000
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
	bh=GFbNk+jhYPBR6vbxilRTaI8TpYRY61kvNZX+0SzYjyk=; b=6KuQL1tpK3NHLDYFkrObBT3uIg
	l+EuPlOqOeZj0msyTNH389hGsxHdkvREelvLlY/ZeyYz0AxK54XGFJu+DVjPnQW1CeEDyw5BjZXFd
	LFxYRvqOx+W3PjLBnI1GBcUjLbDTIC4RHqK0aoKgD3upxUZG7nCtja8ezamXqaKCYDko=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187021-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187021: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d7e36ccbbde76ab39dd8bb21c3712767c2f2c98f
X-Osstest-Versions-That:
    ovmf=03ad59e631aaab0143c5b1c1d64f27f5da1eb8c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Jul 2024 03:54:25 +0000

flight 187021 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187021/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d7e36ccbbde76ab39dd8bb21c3712767c2f2c98f
baseline version:
 ovmf                 03ad59e631aaab0143c5b1c1d64f27f5da1eb8c4

Last test of basis   187018  2024-07-26 17:45:25 Z    0 days
Testing same since   187021  2024-07-27 01:45:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Sean Brogan <sean.brogan@microsoft.com>

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
   03ad59e631..d7e36ccbbd  d7e36ccbbde76ab39dd8bb21c3712767c2f2c98f -> xen-tested-master

