Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1AE82714A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663540.1033480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMqbW-00043G-Dh; Mon, 08 Jan 2024 14:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663540.1033480; Mon, 08 Jan 2024 14:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMqbW-00041C-8M; Mon, 08 Jan 2024 14:27:50 +0000
Received: by outflank-mailman (input) for mailman id 663540;
 Mon, 08 Jan 2024 14:27:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMqbV-00040y-K3; Mon, 08 Jan 2024 14:27:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMqbV-0006Ww-Gj; Mon, 08 Jan 2024 14:27:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMqbV-0008W2-3W; Mon, 08 Jan 2024 14:27:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rMqbV-00015a-36; Mon, 08 Jan 2024 14:27:49 +0000
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
	bh=z6NMEKCta9uQazLyBUqy/7NxCdPeVgpojverEMYdyJs=; b=TribzP+05tLRBIo8Q+H4CKMBa/
	mQBHxDEyL0w3HcleCR6AQWT9L8rcDdnH+tKYqz72RksRoQOkN9/SsBoiViruZFZ2TVufaDng9k5gW
	R4DTIwShAWNJG4ZIN1zh/XGtaOOttJ04Ypj/zs1fR/fFmy/jgGJfew/4bvDXo8hjcgHE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184277-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184277: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=a5bd8d9e5d5c7b729d6d6122900d28f7a00aa6c0
X-Osstest-Versions-That:
    xtf=0a58a1471eb5f692700c0fd026ff96969b6ad7b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jan 2024 14:27:49 +0000

flight 184277 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184277/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  a5bd8d9e5d5c7b729d6d6122900d28f7a00aa6c0
baseline version:
 xtf                  0a58a1471eb5f692700c0fd026ff96969b6ad7b0

Last test of basis   184247  2024-01-03 20:42:38 Z    4 days
Testing same since   184277  2024-01-08 11:42:46 Z    0 days    1 attempts

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
   0a58a14..a5bd8d9  a5bd8d9e5d5c7b729d6d6122900d28f7a00aa6c0 -> xen-tested-master

