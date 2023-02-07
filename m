Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52E68D186
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 09:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490917.759821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJS6-0007UI-M7; Tue, 07 Feb 2023 08:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490917.759821; Tue, 07 Feb 2023 08:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJS6-0007RT-J2; Tue, 07 Feb 2023 08:35:46 +0000
Received: by outflank-mailman (input) for mailman id 490917;
 Tue, 07 Feb 2023 08:35:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPJS5-0007RJ-5Z; Tue, 07 Feb 2023 08:35:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPJS5-0003Mt-3e; Tue, 07 Feb 2023 08:35:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPJS4-0006oI-OY; Tue, 07 Feb 2023 08:35:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pPJS4-0002B0-Nx; Tue, 07 Feb 2023 08:35:44 +0000
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
	bh=u7vDry9E5JN+t62tL7GS63MDSn9SIMDuTMMDDtMgNbQ=; b=RP0Y47m5XVZ8Py5sWj/Tl2k50e
	Ep5FkY6ZST3nsZ7VfAMwsy/Dv/v8oPJAP6hPGpqbpQUP2HcnwCzhqWLsZQnXu4ITMha8VYypKYeby
	uqHOPXTODvEsT8ivZLrBGopIMTV0oRheEOZK0GKgKqg71PKxdwWFvvMlvpENKLcvL9sk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176439-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176439: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=aef0061ac22fb14d631aa0398d2cb496b2f7b8c8
X-Osstest-Versions-That:
    ovmf=aea8a9c954a79029ded443eadf7c92716c1753cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Feb 2023 08:35:44 +0000

flight 176439 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176439/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aef0061ac22fb14d631aa0398d2cb496b2f7b8c8
baseline version:
 ovmf                 aea8a9c954a79029ded443eadf7c92716c1753cc

Last test of basis   176426  2023-02-06 16:44:33 Z    0 days
Testing same since   176439  2023-02-07 03:43:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Thierry LARONDE <tlaronde@polynum.com>

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
   aea8a9c954..aef0061ac2  aef0061ac22fb14d631aa0398d2cb496b2f7b8c8 -> xen-tested-master

