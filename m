Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7E8089F3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649899.1014988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF5P-0001I3-CH; Thu, 07 Dec 2023 14:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649899.1014988; Thu, 07 Dec 2023 14:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF5P-0001H1-7x; Thu, 07 Dec 2023 14:10:43 +0000
Received: by outflank-mailman (input) for mailman id 649899;
 Thu, 07 Dec 2023 14:10:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBF5O-0001Gp-BR; Thu, 07 Dec 2023 14:10:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBF5O-0004jp-6h; Thu, 07 Dec 2023 14:10:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBF5N-0000WE-TZ; Thu, 07 Dec 2023 14:10:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBF5N-0003pM-T8; Thu, 07 Dec 2023 14:10:41 +0000
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
	bh=jWqsh6g+k/7tizhoLwBOaRRscVw5tHecOi0guBaHAck=; b=hnZrpTGorZ5384BwDKxFXTxDg+
	285ycjgnoP54aGG/98VzhbDWJ/nDi5adQehi1UWu2Nhlkt70o/mAdFMpxQJFuSSohIRJM4ukljhmS
	bBVSyShnKIboVMnC3mX0MDvUhSpOOK8+z6i7RZIieZ+rzICvsOdz8yzFpfeQVKaYQWBI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184023-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184023: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=553dfb0f57ae8a666938873cf836a33549568c87
X-Osstest-Versions-That:
    ovmf=ff4c49a5ee38d613384fb2e318d891a800d32999
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Dec 2023 14:10:41 +0000

flight 184023 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184023/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 553dfb0f57ae8a666938873cf836a33549568c87
baseline version:
 ovmf                 ff4c49a5ee38d613384fb2e318d891a800d32999

Last test of basis   184017  2023-12-07 01:45:05 Z    0 days
Testing same since   184023  2023-12-07 10:14:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sheng Wei <w.sheng@intel.com>

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
   ff4c49a5ee..553dfb0f57  553dfb0f57ae8a666938873cf836a33549568c87 -> xen-tested-master

