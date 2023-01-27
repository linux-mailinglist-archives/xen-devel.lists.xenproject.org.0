Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02F67F225
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 00:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485996.753455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLXxO-0002Q2-Ea; Fri, 27 Jan 2023 23:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485996.753455; Fri, 27 Jan 2023 23:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLXxO-0002NT-BM; Fri, 27 Jan 2023 23:16:30 +0000
Received: by outflank-mailman (input) for mailman id 485996;
 Fri, 27 Jan 2023 23:16:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLXxN-0002NJ-B4; Fri, 27 Jan 2023 23:16:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLXxN-0003eE-8e; Fri, 27 Jan 2023 23:16:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pLXxM-0004YV-PK; Fri, 27 Jan 2023 23:16:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pLXxM-0003ba-Ot; Fri, 27 Jan 2023 23:16:28 +0000
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
	bh=YiCulGQPseGfDigAp/VLRXRuI5muLmFRz2BWOVUsqIc=; b=OEQKgX02ldhePx5rkS7cUPQLim
	cZBkpsEwPo/QPyVYlESawOz5LUAII7rSiXU8dAIdQkZJoFfhZeSKmD+w9TzCSIzYOTN583is56xK/
	GSlT0HFLSBjxSUekk41G/o9xMOPbDbec6C+OkGgIZ5wbfeGNjevObN12xNa74RiTr7Ak=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176259-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 176259: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=bf1c4eb6cb52785cf539eb83752dfcecfe66c5d1
X-Osstest-Versions-That:
    xtf=c0f454c68329301447fd258e47824f7d402f19e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Jan 2023 23:16:28 +0000

flight 176259 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176259/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  bf1c4eb6cb52785cf539eb83752dfcecfe66c5d1
baseline version:
 xtf                  c0f454c68329301447fd258e47824f7d402f19e9

Last test of basis   175715  2023-01-11 01:41:46 Z   16 days
Testing same since   176259  2023-01-27 21:12:33 Z    0 days    1 attempts

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
   c0f454c..bf1c4eb  bf1c4eb6cb52785cf539eb83752dfcecfe66c5d1 -> xen-tested-master

