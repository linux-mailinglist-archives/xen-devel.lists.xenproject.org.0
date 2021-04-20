Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B668B3651B8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 07:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113288.215848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYiZG-0003pc-Ip; Tue, 20 Apr 2021 05:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113288.215848; Tue, 20 Apr 2021 05:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYiZG-0003pA-Dt; Tue, 20 Apr 2021 05:04:58 +0000
Received: by outflank-mailman (input) for mailman id 113288;
 Tue, 20 Apr 2021 05:04:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYiZE-0003p2-PE; Tue, 20 Apr 2021 05:04:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYiZE-0000rg-Fl; Tue, 20 Apr 2021 05:04:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYiZE-0008KJ-9w; Tue, 20 Apr 2021 05:04:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lYiZE-0007Is-9R; Tue, 20 Apr 2021 05:04:56 +0000
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
	bh=KhL8j7fyf4EUnX9vW10Zm5QIzbL3MJ3kBn5Cu5Q9040=; b=0BNELUD7Qlf+nuMdz7WwDA1uZ+
	xrCZjpekNqlVFoJbQz3m1iRUNp5u3qLkJG1a76vIelraktlQaOpsu+3Lw0wJnpZC1qg2v08oog/0R
	KCM/rTIe6AyTYjyIP0n6DHWeUpuTDrKz/B8EIkwTMT7Pa+GvmAH/jNk36FZ68DcAlL58=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161302-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161302: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=0395a690c921cb195619b689ba0c0b687531c64c
X-Osstest-Versions-That:
    xtf=b0bc49846c154b79243f39d461a4515804bcaf53
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Apr 2021 05:04:56 +0000

flight 161302 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161302/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  0395a690c921cb195619b689ba0c0b687531c64c
baseline version:
 xtf                  b0bc49846c154b79243f39d461a4515804bcaf53

Last test of basis   161294  2021-04-19 14:41:20 Z    0 days
Testing same since   161302  2021-04-19 21:40:10 Z    0 days    1 attempts

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
   b0bc498..0395a69  0395a690c921cb195619b689ba0c0b687531c64c -> xen-tested-master

