Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E4944A5F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 13:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769596.1180485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTyy-0007nT-Rz; Thu, 01 Aug 2024 11:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769596.1180485; Thu, 01 Aug 2024 11:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTyy-0007lx-Of; Thu, 01 Aug 2024 11:28:32 +0000
Received: by outflank-mailman (input) for mailman id 769596;
 Thu, 01 Aug 2024 11:28:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTyx-0007ln-3u; Thu, 01 Aug 2024 11:28:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTyw-00041F-Rm; Thu, 01 Aug 2024 11:28:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTyw-0007Qk-If; Thu, 01 Aug 2024 11:28:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTyw-0007fh-IB; Thu, 01 Aug 2024 11:28:30 +0000
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
	bh=0S1ktA9qqVOiEc34yGks0xTDtE3ufY/wb+cJAEc/llE=; b=I8L4m37sVhZTDf9+PcKyds3qR0
	VvFMBy+V23PKvE2hCJJCNjdg22FMBorOtS0t+/xuqptjQxWTbJxvA51iInxyFaPnD3C4Dj5YlCjee
	KUqOeq6qlCFNdc+K9JfEqqr804z/H3f9F4aCfhA7FIF0Ql1ynqF8lXspohd6k4KZJSNY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187104-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187104: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=85fad9912c860927aec3953e213662ea1f397c23
X-Osstest-Versions-That:
    ovmf=7e5a5ae154cb4c1e5c3d148a2ba21cc2764e96e6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Aug 2024 11:28:30 +0000

flight 187104 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187104/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 85fad9912c860927aec3953e213662ea1f397c23
baseline version:
 ovmf                 7e5a5ae154cb4c1e5c3d148a2ba21cc2764e96e6

Last test of basis   187100  2024-08-01 05:13:19 Z    0 days
Testing same since   187104  2024-08-01 08:43:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sachin Ganesh <sachinganesh@ami.com>

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
   7e5a5ae154..85fad9912c  85fad9912c860927aec3953e213662ea1f397c23 -> xen-tested-master

