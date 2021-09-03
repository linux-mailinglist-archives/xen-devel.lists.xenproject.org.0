Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09243FF8B4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 03:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177753.323415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLyLb-0005zg-ST; Fri, 03 Sep 2021 01:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177753.323415; Fri, 03 Sep 2021 01:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLyLb-0005xK-LC; Fri, 03 Sep 2021 01:50:27 +0000
Received: by outflank-mailman (input) for mailman id 177753;
 Fri, 03 Sep 2021 01:50:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLyLZ-0005xA-U9; Fri, 03 Sep 2021 01:50:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLyLZ-0000Df-Kr; Fri, 03 Sep 2021 01:50:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLyLZ-0007ls-D3; Fri, 03 Sep 2021 01:50:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLyLZ-0007dx-Cb; Fri, 03 Sep 2021 01:50:25 +0000
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
	bh=1ujK+iTDU59k+1UNmmjPHa/4ecj4ziFwVX6SuXg0gsQ=; b=dcwsrY8OVC9eFEOhhxt0SPtqiJ
	HWH5HR5gPQNjam/R47Zm2YiImT/EqZpilUVMq4BFaiRKalE1V6MGmuKa4vWSAaaagAuReZ/dzmUHL
	3kxto20JZDwKvfq0LQCOUAZwxsvqY1qUE7q1P2fpU5G9UWWHmtE8KsAavjFXvY+Bj+do=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164779-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 164779: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=0bb720b3c486bd3de62b8c32282eb5fa192b87f3
X-Osstest-Versions-That:
    xtf=bc26bc260cbfec1c6de1778ef17cf0faa54c0e03
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Sep 2021 01:50:25 +0000

flight 164779 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164779/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  0bb720b3c486bd3de62b8c32282eb5fa192b87f3
baseline version:
 xtf                  bc26bc260cbfec1c6de1778ef17cf0faa54c0e03

Last test of basis   164255  2021-08-19 12:11:19 Z   14 days
Testing same since   164779  2021-09-02 21:40:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

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
   bc26bc2..0bb720b  0bb720b3c486bd3de62b8c32282eb5fa192b87f3 -> xen-tested-master

