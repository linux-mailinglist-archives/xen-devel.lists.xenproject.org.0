Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E693ACBB5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144607.266137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luECT-00056T-Mz; Fri, 18 Jun 2021 13:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144607.266137; Fri, 18 Jun 2021 13:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luECT-00054c-Jg; Fri, 18 Jun 2021 13:06:21 +0000
Received: by outflank-mailman (input) for mailman id 144607;
 Fri, 18 Jun 2021 13:06:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luECS-00054S-La; Fri, 18 Jun 2021 13:06:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luECS-0000AC-HM; Fri, 18 Jun 2021 13:06:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1luECS-0004P9-8E; Fri, 18 Jun 2021 13:06:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1luECS-0000PE-5I; Fri, 18 Jun 2021 13:06:20 +0000
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
	bh=hQg+fyvLgAhRiO8Sg4P5fUnuUppkU6tB8FPGkQTgIi0=; b=ojphLLpP1kcP/aKjf5g1aXYBTU
	AW9s2bPazRelw6KIG30xFbp9Pz8qC9y3RcnHt4JCRwrkteKklnuLR8vuO8OSEf392MCypRK9vCI7U
	aZ9TiQaKUt9CBH8zU533KCXOeoLPkI0qlrggymgHHfrcauef3/yGSZLrOljYWXm6S16Y=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162886-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 162886: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=3e800027016ea4eb19887bf626b46f45fc43fa5d
X-Osstest-Versions-That:
    xtf=5ead491e36af6cb8681fc1278bd36c756ad62ac2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Jun 2021 13:06:20 +0000

flight 162886 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162886/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  3e800027016ea4eb19887bf626b46f45fc43fa5d
baseline version:
 xtf                  5ead491e36af6cb8681fc1278bd36c756ad62ac2

Last test of basis   161978  2021-05-17 10:41:15 Z   32 days
Testing same since   162886  2021-06-17 23:10:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christopher Clark <christopher.w.clark@gmail.com>

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
   5ead491..3e80002  3e800027016ea4eb19887bf626b46f45fc43fa5d -> xen-tested-master

