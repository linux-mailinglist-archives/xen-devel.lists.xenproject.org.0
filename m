Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BD77814B5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 23:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586600.917862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX6wc-0003mK-Dg; Fri, 18 Aug 2023 21:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586600.917862; Fri, 18 Aug 2023 21:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX6wc-0003ka-9S; Fri, 18 Aug 2023 21:23:46 +0000
Received: by outflank-mailman (input) for mailman id 586600;
 Fri, 18 Aug 2023 21:23:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX6wa-0003kQ-5M; Fri, 18 Aug 2023 21:23:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX6wa-00054w-0K; Fri, 18 Aug 2023 21:23:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX6wZ-0004mf-KT; Fri, 18 Aug 2023 21:23:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qX6wZ-0001lD-Ji; Fri, 18 Aug 2023 21:23:43 +0000
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
	bh=5cx40rBRdd+f+XvAhh1YOu/6DkrHELE5SngN2H+dZ5s=; b=pQUvvdeoC2rNnlznH19FZlQ0nl
	+wITutgo8+TjXAx8XfqGD/ENRvd1z+r5LbCjd/cgBSw9XAJr51qXXp3tclX4WmtAlLfI3JvkMZtEQ
	lAIhCKWhEpLdRJ0ki+wHe8wbUCRFQs6N2oqt8CbdLNPgqaOLqSyRA3WMwf2ErrlY76q8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182389-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 182389: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=cec23a34c03ffcf12d68d35f0e1d7f9ae85ab49c
X-Osstest-Versions-That:
    xtf=bf1c4eb6cb52785cf539eb83752dfcecfe66c5d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Aug 2023 21:23:43 +0000

flight 182389 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182389/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  cec23a34c03ffcf12d68d35f0e1d7f9ae85ab49c
baseline version:
 xtf                  bf1c4eb6cb52785cf539eb83752dfcecfe66c5d1

Last test of basis   176259  2023-01-27 21:12:33 Z  203 days
Testing same since   182389  2023-08-18 20:10:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>

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
   bf1c4eb..cec23a3  cec23a34c03ffcf12d68d35f0e1d7f9ae85ab49c -> xen-tested-master

