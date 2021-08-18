Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ABA3F074E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 17:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168279.307247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGN2M-0006RF-M0; Wed, 18 Aug 2021 14:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168279.307247; Wed, 18 Aug 2021 14:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGN2M-0006ON-GS; Wed, 18 Aug 2021 14:59:26 +0000
Received: by outflank-mailman (input) for mailman id 168279;
 Wed, 18 Aug 2021 14:59:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGN2L-0006OD-DZ; Wed, 18 Aug 2021 14:59:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGN2L-0008Ln-6V; Wed, 18 Aug 2021 14:59:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGN2K-0005nc-Uh; Wed, 18 Aug 2021 14:59:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mGN2K-0002pF-UC; Wed, 18 Aug 2021 14:59:24 +0000
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
	bh=kasYLTtASBnmTV3jIwiKoq6M8JgryEVmKJq3kIFiG7w=; b=o7hYSKxo3kj7dbUocw0YABSqI4
	d6N8S2uig7skc9k4v83QSzwY+WovxEcQekJUyr/ZRjrppUVAACO/XXFYp4/+8wFk/xoxP22re7p+b
	HheFNEDO4DSSI58A2voSyEZNMQJKX07LdNx81hcyT3M92mfO9bsuxgC1tHxWNMO0QILI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164235-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 164235: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=fc32c40a97069d4696fb7aa9cb76e3ae09aa18dd
X-Osstest-Versions-That:
    xtf=6d8000aeadb222282c96567022a623f770348989
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Aug 2021 14:59:24 +0000

flight 164235 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164235/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  fc32c40a97069d4696fb7aa9cb76e3ae09aa18dd
baseline version:
 xtf                  6d8000aeadb222282c96567022a623f770348989

Last test of basis   164231  2021-08-17 20:47:09 Z    0 days
Testing same since   164235  2021-08-18 03:44:23 Z    0 days    1 attempts

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
   6d8000a..fc32c40  fc32c40a97069d4696fb7aa9cb76e3ae09aa18dd -> xen-tested-master

