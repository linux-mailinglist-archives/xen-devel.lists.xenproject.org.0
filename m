Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C33631C2
	for <lists+xen-devel@lfdr.de>; Sat, 17 Apr 2021 20:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112229.214339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXpKf-0002ih-9E; Sat, 17 Apr 2021 18:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112229.214339; Sat, 17 Apr 2021 18:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXpKf-0002iD-4y; Sat, 17 Apr 2021 18:06:13 +0000
Received: by outflank-mailman (input) for mailman id 112229;
 Sat, 17 Apr 2021 18:06:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXpKd-0002i5-N6; Sat, 17 Apr 2021 18:06:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXpKd-0001K3-IN; Sat, 17 Apr 2021 18:06:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lXpKd-0005Sj-BH; Sat, 17 Apr 2021 18:06:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lXpKd-0007sh-Am; Sat, 17 Apr 2021 18:06:11 +0000
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
	bh=6tJAM+4u0jlAKFmuNfMMMQtDRPq4Yd7yis5TrDmC5aI=; b=TcloBaRMs9OwBrSsjHBWpqvp0o
	hXctC6VvVHDtMQczqgXFDABiPv+n4xuUaw1iCY0OOaP0+B88d+/T1x+NYh6OE99ZkStKtc1R3pA5q
	iyHMyjVh7/9RLE7kX656FUscjrqz/qRR3/5ALNMe8LAtbKIv53aUglczfyAwfFOYXLno=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161229-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 161229: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=2f655c0c74439805ce6dbc6fd1f2e7defdaf33e5
X-Osstest-Versions-That:
    xtf=8893fd89044e99e1894f8856d72893ea598d32d8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Apr 2021 18:06:11 +0000

flight 161229 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161229/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  2f655c0c74439805ce6dbc6fd1f2e7defdaf33e5
baseline version:
 xtf                  8893fd89044e99e1894f8856d72893ea598d32d8

Last test of basis   161219  2021-04-16 23:10:06 Z    0 days
Testing same since   161229  2021-04-17 10:33:36 Z    0 days    1 attempts

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
   8893fd8..2f655c0  2f655c0c74439805ce6dbc6fd1f2e7defdaf33e5 -> xen-tested-master

