Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79728375C63
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 22:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123710.233377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lektW-0000a0-Sy; Thu, 06 May 2021 20:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123710.233377; Thu, 06 May 2021 20:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lektW-0000XG-PF; Thu, 06 May 2021 20:46:50 +0000
Received: by outflank-mailman (input) for mailman id 123710;
 Thu, 06 May 2021 20:46:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lektV-0000X6-71; Thu, 06 May 2021 20:46:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lektU-0000Sq-Tt; Thu, 06 May 2021 20:46:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lektU-0000cB-Gh; Thu, 06 May 2021 20:46:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lektU-0001K1-GB; Thu, 06 May 2021 20:46:48 +0000
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
	bh=64BtrviUNV5WRfW/a4jHoPWXYaiRl4Scwq4AT4nBt0U=; b=V0VDnq5nXgLSS5lfHu6WkfbvpG
	jNlgFqzh3Gp3AhvmlHzLUA0kea6z31kSNXtPeKIs/Ah5EiaLy+/6yYq8b9GAOlIwzMkL7WCQxBqG9
	J9+5N7GTIymdPQaNRTbdymBKY86mzWI9yIELtzi9ipTVE41T5DMes7g+KeVzmQgj3Eas=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161814-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161814: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=880092854e5473558af77289bb7c01a9fa9dda5a
X-Osstest-Versions-That:
    xtf=2cf3168661355565e2b80395ef16c5ee3cfc5f55
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 May 2021 20:46:48 +0000

flight 161814 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161814/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  880092854e5473558af77289bb7c01a9fa9dda5a
baseline version:
 xtf                  2cf3168661355565e2b80395ef16c5ee3cfc5f55

Last test of basis   161375  2021-04-22 11:11:15 Z   14 days
Testing same since   161814  2021-05-06 14:40:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Orzel <michal.orzel@arm.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   2cf3168..8800928  880092854e5473558af77289bb7c01a9fa9dda5a -> xen-tested-master

