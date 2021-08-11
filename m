Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5C3E861D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 00:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165494.302431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDaM5-0005jk-QE; Tue, 10 Aug 2021 22:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165494.302431; Tue, 10 Aug 2021 22:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDaM5-0005hX-Mb; Tue, 10 Aug 2021 22:36:17 +0000
Received: by outflank-mailman (input) for mailman id 165494;
 Tue, 10 Aug 2021 22:36:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDaM4-0005hN-UJ; Tue, 10 Aug 2021 22:36:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDaM4-0007vo-OX; Tue, 10 Aug 2021 22:36:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDaM4-0001JM-F2; Tue, 10 Aug 2021 22:36:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mDaM4-0004W9-EX; Tue, 10 Aug 2021 22:36:16 +0000
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
	bh=51J1VZaEzl0qGu93Z/SIO+bndYMolddrvY6fDxbxuVo=; b=qGow64/jlJ+ufKBTD7nDKQ0x4V
	zr3c5i1Js+eWgNYMZ5A+d8QycF6KysUiOhNy0ENPJhsbBow/EAzo106Xap/L9d1/Cr/5qcc8Cs4hc
	NE4aNozef2BMEIt2c+sJoWAsiqzk2cJ/C7jXL1d8P+OMRwxD+dX3kCCxJbQ1e9DGmqBI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164151-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164151: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a7ddc7847cb4afa3534da82222f296aafadb959d
X-Osstest-Versions-That:
    ovmf=d02dbb53cd78de799e6afaa237e98771fb5148db
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Aug 2021 22:36:16 +0000

flight 164151 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164151/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a7ddc7847cb4afa3534da82222f296aafadb959d
baseline version:
 ovmf                 d02dbb53cd78de799e6afaa237e98771fb5148db

Last test of basis   164142  2021-08-09 11:42:25 Z    1 days
Testing same since   164151  2021-08-10 17:11:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   d02dbb53cd..a7ddc7847c  a7ddc7847cb4afa3534da82222f296aafadb959d -> xen-tested-master

