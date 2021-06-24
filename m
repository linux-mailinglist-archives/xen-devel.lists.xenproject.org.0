Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CF3B3521
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 20:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146987.270652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwTef-0005LQ-8m; Thu, 24 Jun 2021 18:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146987.270652; Thu, 24 Jun 2021 18:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwTef-0005JG-3c; Thu, 24 Jun 2021 18:00:45 +0000
Received: by outflank-mailman (input) for mailman id 146987;
 Thu, 24 Jun 2021 18:00:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lwTec-0005J6-Vw; Thu, 24 Jun 2021 18:00:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lwTec-00067i-QR; Thu, 24 Jun 2021 18:00:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lwTec-0007eH-Jp; Thu, 24 Jun 2021 18:00:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lwTec-0004kC-JJ; Thu, 24 Jun 2021 18:00:42 +0000
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
	bh=2uOxG0Z+y26Cgbkcq3tNraOMABNL1x/GlGYLk6em1WQ=; b=lLYlp6j6zGb84qf9mWIMPXulhN
	myllayzrJQmOoEL7g6QJVWgbaKU5/7f8fROoN30V1y95tnfcvu4Y/tBkANoXijZ7falpBtOUC+Hik
	D31dKfwKTsiFH51cC6x/Ti86x6fln/Mkhrv+md/jBsP7gtpnBXuhYtIOwibq3NMXbQgM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163016-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 163016: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=93b29b886e8665e368598c711279d45b7e5d066c
X-Osstest-Versions-That:
    xtf=3e800027016ea4eb19887bf626b46f45fc43fa5d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Jun 2021 18:00:42 +0000

flight 163016 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163016/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  93b29b886e8665e368598c711279d45b7e5d066c
baseline version:
 xtf                  3e800027016ea4eb19887bf626b46f45fc43fa5d

Last test of basis   162886  2021-06-17 23:10:13 Z    6 days
Testing same since   163016  2021-06-24 11:41:21 Z    0 days    1 attempts

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
   3e80002..93b29b8  93b29b886e8665e368598c711279d45b7e5d066c -> xen-tested-master

