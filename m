Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE9F7B80EA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612574.952537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1xk-0002qx-KJ; Wed, 04 Oct 2023 13:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612574.952537; Wed, 04 Oct 2023 13:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1xk-0002oO-H3; Wed, 04 Oct 2023 13:30:52 +0000
Received: by outflank-mailman (input) for mailman id 612574;
 Wed, 04 Oct 2023 13:30:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qo1xj-0002oE-86; Wed, 04 Oct 2023 13:30:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qo1xj-0003RM-2K; Wed, 04 Oct 2023 13:30:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qo1xi-0002PN-Ke; Wed, 04 Oct 2023 13:30:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qo1xi-0007jR-KD; Wed, 04 Oct 2023 13:30:50 +0000
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
	bh=M4zE1RrgVK9OP3gVxsoakBT7v1n/o0rwiMuPYV24TcM=; b=w3IjGKXyV8uif30bMCu+0skha+
	O4Z88Fo6POGdirwJyfHOBTF+OEjCRngCr3Kir5HjfaguyltyGPNqXI436P8+0F63dMq4xhpB3GxLS
	Qxc08X1JzjBhtFpgWNzZ9pHxqOzoeETfrgINnEVNVuVFthbmswLQToDELog+uab7JPP8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183261-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 183261: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=8ab636aee07918402d80da2ea605ce449b0fd657
X-Osstest-Versions-That:
    xtf=f91cd602586c28f76b04f20fe39c5f001d8d613a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Oct 2023 13:30:50 +0000

flight 183261 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183261/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  8ab636aee07918402d80da2ea605ce449b0fd657
baseline version:
 xtf                  f91cd602586c28f76b04f20fe39c5f001d8d613a

Last test of basis   183251  2023-10-03 13:14:07 Z    1 days
Testing same since   183261  2023-10-04 12:44:07 Z    0 days    1 attempts

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
   f91cd60..8ab636a  8ab636aee07918402d80da2ea605ce449b0fd657 -> xen-tested-master

