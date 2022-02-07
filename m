Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3454ABEC2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 14:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266895.460614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3ev-0007On-Pk; Mon, 07 Feb 2022 13:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266895.460614; Mon, 07 Feb 2022 13:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3ev-0007Mw-MC; Mon, 07 Feb 2022 13:02:21 +0000
Received: by outflank-mailman (input) for mailman id 266895;
 Mon, 07 Feb 2022 13:02:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH3et-0007Mm-QO; Mon, 07 Feb 2022 13:02:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH3et-0002hX-Lp; Mon, 07 Feb 2022 13:02:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH3et-00083p-7O; Mon, 07 Feb 2022 13:02:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nH3et-000739-6y; Mon, 07 Feb 2022 13:02:19 +0000
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
	bh=l8lAiu8XE83QY+IqmYmq0tF3cntGuIxCNsGkI79ctxo=; b=McSwVrP2Wmr3DTXW0oJD5f0S4j
	YcwuVOfWRZ3M8VdsSR6t25IL75UbEHC4UBpAAUKj1/dpu7Z68Kz/d4Y87J4p1hJXU8QyVqGRqaDbL
	eJluQppZ0fTGwl5GSe3gd9xC1e7u1Y+in32xQK+TZ6p3gr9nfJr7gzUhYjY1D/4P3RbE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168044-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 168044: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=bc0abf2a5498d4691538bf34496ca0f0f189951b
X-Osstest-Versions-That:
    xtf=61e6f40b07d256bd62ae7b231a3eeecd49d0b15b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Feb 2022 13:02:19 +0000

flight 168044 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168044/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  bc0abf2a5498d4691538bf34496ca0f0f189951b
baseline version:
 xtf                  61e6f40b07d256bd62ae7b231a3eeecd49d0b15b

Last test of basis   165349  2021-10-04 12:43:20 Z  126 days
Testing same since   168044  2022-02-07 11:41:42 Z    0 days    1 attempts

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
   61e6f40..bc0abf2  bc0abf2a5498d4691538bf34496ca0f0f189951b -> xen-tested-master

