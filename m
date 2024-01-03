Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3271A823728
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 22:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661029.1030728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL8sW-0000v5-8K; Wed, 03 Jan 2024 21:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661029.1030728; Wed, 03 Jan 2024 21:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL8sW-0000sw-51; Wed, 03 Jan 2024 21:34:20 +0000
Received: by outflank-mailman (input) for mailman id 661029;
 Wed, 03 Jan 2024 21:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rL8sU-0000sW-A3; Wed, 03 Jan 2024 21:34:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rL8sU-0000uB-1K; Wed, 03 Jan 2024 21:34:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rL8sT-0001UY-Io; Wed, 03 Jan 2024 21:34:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rL8sT-0008PX-IK; Wed, 03 Jan 2024 21:34:17 +0000
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
	bh=1mD1eBH4Yf43FXZZ36xec+MiuAwr5FODJbkWalOvoJU=; b=x+JvtooeeIkFLvvdIycL+woYkm
	qfnq7BDvH2A4Q/sPlwqM5LOuXCTxn9gL/2uzatXsTty7ooekh+x52qQXIHXZSGTq2MfpriqqpydOs
	906K9130HDmtPmB0u3R8C+lmg2P85SBiPmUVobexiYcDxZllnL8nIWxkjG/GVqsamHGU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184247-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184247: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=0a58a1471eb5f692700c0fd026ff96969b6ad7b0
X-Osstest-Versions-That:
    xtf=8ab636aee07918402d80da2ea605ce449b0fd657
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Jan 2024 21:34:17 +0000

flight 184247 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184247/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  0a58a1471eb5f692700c0fd026ff96969b6ad7b0
baseline version:
 xtf                  8ab636aee07918402d80da2ea605ce449b0fd657

Last test of basis   183261  2023-10-04 12:44:07 Z   91 days
Testing same since   184247  2024-01-03 20:42:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

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
   8ab636a..0a58a14  0a58a1471eb5f692700c0fd026ff96969b6ad7b0 -> xen-tested-master

