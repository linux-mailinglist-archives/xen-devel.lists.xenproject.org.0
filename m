Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434DC97D113
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 08:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801015.1211037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srWz6-0008VK-AF; Fri, 20 Sep 2024 06:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801015.1211037; Fri, 20 Sep 2024 06:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srWz6-0008TM-7D; Fri, 20 Sep 2024 06:19:16 +0000
Received: by outflank-mailman (input) for mailman id 801015;
 Fri, 20 Sep 2024 06:19:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srWz4-0008TC-9i; Fri, 20 Sep 2024 06:19:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srWz4-0000mB-6d; Fri, 20 Sep 2024 06:19:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1srWz3-0003oa-Pw; Fri, 20 Sep 2024 06:19:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1srWz3-0004uC-PK; Fri, 20 Sep 2024 06:19:13 +0000
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
	bh=kJQcuisjQdXT5T8LMTuJrqqeD/VSyU2I31vIPqUJDaA=; b=0uLhuX+9rD2f6O0yaS5QIywa8P
	VFYCDc7GcW7xXVFrQx2SqatAsOXB9gq3K/GV3rMtptS6msO0w2DYxvMXg4UwwCbIqXYI/PE6wC1uc
	+HCytnjp3S0ysU5/3FEezFj7ZJcHhKvlyu7YdXxGhCABjmpGrFPnfsLKaaNqXSBdQ82Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187772-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187772: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3a3b12cbdae2e89b0e365eb01c378891d0d9037c
X-Osstest-Versions-That:
    ovmf=ff8a7d101f7d892dea96254bc1309c1a7c502e02
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Sep 2024 06:19:13 +0000

flight 187772 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187772/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3a3b12cbdae2e89b0e365eb01c378891d0d9037c
baseline version:
 ovmf                 ff8a7d101f7d892dea96254bc1309c1a7c502e02

Last test of basis   187757  2024-09-19 08:50:33 Z    0 days
Testing same since   187772  2024-09-20 02:43:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   ff8a7d101f..3a3b12cbda  3a3b12cbdae2e89b0e365eb01c378891d0d9037c -> xen-tested-master

