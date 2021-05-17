Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C632C382E00
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 15:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128278.240863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidfE-0000Oi-9v; Mon, 17 May 2021 13:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128278.240863; Mon, 17 May 2021 13:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidfE-0000Lx-64; Mon, 17 May 2021 13:52:08 +0000
Received: by outflank-mailman (input) for mailman id 128278;
 Mon, 17 May 2021 13:52:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lidfC-0000Ln-1y; Mon, 17 May 2021 13:52:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lidfB-0004bV-R8; Mon, 17 May 2021 13:52:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lidfB-0006MX-It; Mon, 17 May 2021 13:52:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lidfB-0007SY-IO; Mon, 17 May 2021 13:52:05 +0000
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
	bh=/kgCad0uW6uSSrmGEqX8ns+Q6TNOUJaal9t6fA1GGKo=; b=HAFM4W6IAI48GUj4FqHk3SmMz8
	xilwO4+n7Fiwf4Tu9K4kYOUZ/sVBBe+evXdBttR3+DApEmQ0BAlgf7bwIIb8qebqT+q+teawg02vj
	8kVWcqaO1myHJCE+IskcQoUkc0wAhB+wUTxGvjBpnUaqWAxPRH9mMJiLieDcJ7oymsVU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161978-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161978: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=5ead491e36af6cb8681fc1278bd36c756ad62ac2
X-Osstest-Versions-That:
    xtf=880092854e5473558af77289bb7c01a9fa9dda5a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 May 2021 13:52:05 +0000

flight 161978 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161978/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  5ead491e36af6cb8681fc1278bd36c756ad62ac2
baseline version:
 xtf                  880092854e5473558af77289bb7c01a9fa9dda5a

Last test of basis   161814  2021-05-06 14:40:11 Z   10 days
Testing same since   161978  2021-05-17 10:41:15 Z    0 days    1 attempts

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
   8800928..5ead491  5ead491e36af6cb8681fc1278bd36c756ad62ac2 -> xen-tested-master

