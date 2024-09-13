Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE09788F6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 21:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798451.1208692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBxP-00033V-3Q; Fri, 13 Sep 2024 19:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798451.1208692; Fri, 13 Sep 2024 19:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBxP-00031T-04; Fri, 13 Sep 2024 19:27:51 +0000
Received: by outflank-mailman (input) for mailman id 798451;
 Fri, 13 Sep 2024 19:27:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spBxO-00031J-FE; Fri, 13 Sep 2024 19:27:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spBxO-0005V7-Dd; Fri, 13 Sep 2024 19:27:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spBxO-0001pD-3K; Fri, 13 Sep 2024 19:27:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1spBxO-0006Xd-2t; Fri, 13 Sep 2024 19:27:50 +0000
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
	bh=vNNV4n7GnY7RCpjM/pqYo04CnkOg7J1DFnaANGcntEQ=; b=fxnI652SpiYJhZb2VRcCkJvpDZ
	kgotBrImaqFjEeDOeEZ/7UD4f8QRdDyjO3ihGDJJYvU8ry4Sm7pNXW35dytozeKYHrq8RCXhtA5ii
	JsIF3tMyk6FaXwR52AHxxGEeXV6WejNc92I/aPiEpGbmoax/eD7U0amRORurWYCM+ynY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187696-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 187696: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=c9a5e404e70c21c7621db4b8cabdf68261db7e1c
X-Osstest-Versions-That:
    xtf=f503efe8e5cf8858ec0704f1aaa82d0bf50891a5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 19:27:50 +0000

flight 187696 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187696/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  c9a5e404e70c21c7621db4b8cabdf68261db7e1c
baseline version:
 xtf                  f503efe8e5cf8858ec0704f1aaa82d0bf50891a5

Last test of basis   187426  2024-08-30 18:41:32 Z   14 days
Testing same since   187696  2024-09-13 18:11:32 Z    0 days    1 attempts

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
   f503efe..c9a5e40  c9a5e404e70c21c7621db4b8cabdf68261db7e1c -> xen-tested-master

