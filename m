Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29C35EC74
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 07:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110260.210462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWYPQ-00046u-Vf; Wed, 14 Apr 2021 05:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110260.210462; Wed, 14 Apr 2021 05:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWYPQ-00046L-QM; Wed, 14 Apr 2021 05:49:52 +0000
Received: by outflank-mailman (input) for mailman id 110260;
 Wed, 14 Apr 2021 05:49:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWYPO-00046C-RH; Wed, 14 Apr 2021 05:49:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWYPO-0002GK-JX; Wed, 14 Apr 2021 05:49:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWYPO-00078Q-BP; Wed, 14 Apr 2021 05:49:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lWYPO-0004Lp-At; Wed, 14 Apr 2021 05:49:50 +0000
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
	bh=Huk5r2KApi5wLRsOXNdL/5DRCoaj6csI6Zo/+DArhJE=; b=3hW2A10W29a0npVuB/0BvwouHV
	ukTlOMxrxXY+yNp9arB88XrtQHDnZxRFmtt9jNlkPvQeC+WM4ltr/UgK3p6S1rKlSllvNW/XdNCgl
	qawHI2YiHT0+/oiD2Sp1IuopQJ8KlT2UiN1C0TtctJC0vn0eR6SReYMXSPCOU3AYr6F8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161114-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161114: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=037090cb7c0063bcb7788982cab73bf7c5b66924
X-Osstest-Versions-That:
    ovmf=83876950ab3cf5278d0ae7542086bd4be75059d3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Apr 2021 05:49:50 +0000

flight 161114 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161114/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 037090cb7c0063bcb7788982cab73bf7c5b66924
baseline version:
 ovmf                 83876950ab3cf5278d0ae7542086bd4be75059d3

Last test of basis   161099  2021-04-13 17:40:12 Z    0 days
Testing same since   161114  2021-04-14 01:56:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Takuto Naito <naitaku@gmail.com>

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
   83876950ab..037090cb7c  037090cb7c0063bcb7788982cab73bf7c5b66924 -> xen-tested-master

