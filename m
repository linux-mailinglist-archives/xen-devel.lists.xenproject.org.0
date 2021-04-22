Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6553688B1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 23:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115817.221010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZh4P-00081C-EQ; Thu, 22 Apr 2021 21:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115817.221010; Thu, 22 Apr 2021 21:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZh4P-00080k-Aa; Thu, 22 Apr 2021 21:41:09 +0000
Received: by outflank-mailman (input) for mailman id 115817;
 Thu, 22 Apr 2021 21:41:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZh4N-00080c-Qb; Thu, 22 Apr 2021 21:41:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZh4N-0007PJ-Jx; Thu, 22 Apr 2021 21:41:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZh4N-0006lj-9t; Thu, 22 Apr 2021 21:41:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lZh4N-0004XT-9M; Thu, 22 Apr 2021 21:41:07 +0000
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
	bh=YcB3dm8wG63heItYFkpbR5NMkhF/uT6ze965BQSah9g=; b=SfTC0EhhG/68DYVnDUocOiNmt/
	Nm5i9CJeKnTKLFrtc9BeGEGtC03/+X2aUyiobWgI5j02kTA0Mlvsq/7ePfOiQVePCWWSgFvFai7og
	nrF/SA9c/Wh6aVJ7N0yZRvmKj4w8iznbwvF6OcZCgN8nL0ilsq7wtvLqTXf7nxiialBw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161375-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161375: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=2cf3168661355565e2b80395ef16c5ee3cfc5f55
X-Osstest-Versions-That:
    xtf=e24fbec38e66e0df8471efb0c804256bdac96636
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Apr 2021 21:41:07 +0000

flight 161375 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161375/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  2cf3168661355565e2b80395ef16c5ee3cfc5f55
baseline version:
 xtf                  e24fbec38e66e0df8471efb0c804256bdac96636

Last test of basis   161363  2021-04-21 23:10:10 Z    0 days
Testing same since   161375  2021-04-22 11:11:15 Z    0 days    1 attempts

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
   e24fbec..2cf3168  2cf3168661355565e2b80395ef16c5ee3cfc5f55 -> xen-tested-master

