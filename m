Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9128C966A21
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 21:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786608.1196207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk7kI-0000IL-Uc; Fri, 30 Aug 2024 19:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786608.1196207; Fri, 30 Aug 2024 19:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk7kI-0000Fb-PT; Fri, 30 Aug 2024 19:57:22 +0000
Received: by outflank-mailman (input) for mailman id 786608;
 Fri, 30 Aug 2024 19:57:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk7kH-0000FQ-8c; Fri, 30 Aug 2024 19:57:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk7kG-0005na-2Y; Fri, 30 Aug 2024 19:57:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sk7kF-0002ey-PG; Fri, 30 Aug 2024 19:57:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sk7kF-00027Q-K7; Fri, 30 Aug 2024 19:57:19 +0000
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
	bh=zRNaUR723IFkm2EmJ3JYpcS+b+znMROgvXffBZhLzzY=; b=BcfH8rnK7bn2w8n5+yAGeXKVVC
	1eSjPD4GLWhSr1NRNZkNMbAmHPONcPjmAj5vbPdj7THwHYqTwN3IY2T32od4G7HYLPUzNfHOePo6Y
	rOhmMGt9SjHqntHbh89boPOxguzHfKVg3rk07KUwpPFwFRa0kYh//FsVB9AfrpHYx2xs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187426-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 187426: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=f503efe8e5cf8858ec0704f1aaa82d0bf50891a5
X-Osstest-Versions-That:
    xtf=f37c4574dd79d058c035be989ac6648508556a1a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Aug 2024 19:57:19 +0000

flight 187426 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187426/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  f503efe8e5cf8858ec0704f1aaa82d0bf50891a5
baseline version:
 xtf                  f37c4574dd79d058c035be989ac6648508556a1a

Last test of basis   186995  2024-07-25 01:11:38 Z   36 days
Testing same since   187426  2024-08-30 18:41:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bernhard Kaindl <bernhard.kaindl@cloud.com>

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
   f37c457..f503efe  f503efe8e5cf8858ec0704f1aaa82d0bf50891a5 -> xen-tested-master

