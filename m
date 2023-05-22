Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6D70B402
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 06:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537733.837214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0wt3-0005mq-1v; Mon, 22 May 2023 04:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537733.837214; Mon, 22 May 2023 04:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0wt2-0005l9-Ut; Mon, 22 May 2023 04:11:08 +0000
Received: by outflank-mailman (input) for mailman id 537733;
 Mon, 22 May 2023 04:11:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0wt1-0005kz-F0; Mon, 22 May 2023 04:11:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0wt1-0001Qu-9l; Mon, 22 May 2023 04:11:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0wt1-000862-2B; Mon, 22 May 2023 04:11:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q0wt1-0000Hk-1j; Mon, 22 May 2023 04:11:07 +0000
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
	bh=a5UPuJWlJ18DSj0XRo/K+FU15Jt+1JicA3kQWnBb5bA=; b=mQW560XsRN43NrghLvwIqegzNW
	K+DUpgrP/fGXt8YgT00HDgcWPTFyJecIAxOxxn5djoRBEm3zD8pJF+9vCzLZExxtx1jTnKZjzefyD
	3TD/I1wDmY/67uLRYRwHmO6u++TUviIOSQkEOrYoacVePfli4Yi5y2JfI2cyPKC45Ex0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180883-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180883: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c5cf7f69c98baed40754ca4a821cb504fd5423cd
X-Osstest-Versions-That:
    ovmf=0abfb0be6cf78a8e962383e85cec57851ddae5bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 May 2023 04:11:07 +0000

flight 180883 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180883/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c5cf7f69c98baed40754ca4a821cb504fd5423cd
baseline version:
 ovmf                 0abfb0be6cf78a8e962383e85cec57851ddae5bc

Last test of basis   180695  2023-05-18 00:10:44 Z    4 days
Testing same since   180883  2023-05-22 01:40:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   0abfb0be6c..c5cf7f69c9  c5cf7f69c98baed40754ca4a821cb504fd5423cd -> xen-tested-master

