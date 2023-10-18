Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11D7CEB1C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 00:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618796.962913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtEwj-0003tT-GV; Wed, 18 Oct 2023 22:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618796.962913; Wed, 18 Oct 2023 22:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtEwj-0003r3-Ct; Wed, 18 Oct 2023 22:23:21 +0000
Received: by outflank-mailman (input) for mailman id 618796;
 Wed, 18 Oct 2023 22:23:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtEwh-0003qt-Jz; Wed, 18 Oct 2023 22:23:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtEwh-0003Gx-EX; Wed, 18 Oct 2023 22:23:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtEwh-0004Ed-3B; Wed, 18 Oct 2023 22:23:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qtEwh-0000f9-2o; Wed, 18 Oct 2023 22:23:19 +0000
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
	bh=aNdzaBqGdtf9R++Of2jbWWLQb2WYPx+HcKsusS71cfI=; b=w+C5WsI0gIhKWAGIdeQB9mDFjE
	iho7K5DTfQVkqy76K99aKCCxK64mPYI+rLCZ9c/lmdYgCvV8570/kNjZSbSvSrNlH2bcXkVNyZvgX
	rcw8/jxKK5jfVlG+SbowFBSCV6DLgqAokrxNt6NXMeAzB8EvuixEpmdpGADxQ3wYD574=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183420-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183420: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b75d9f556d6f290a4037064a2b934f5a3396328c
X-Osstest-Versions-That:
    ovmf=7fe49887c4d227e585d5aa5530ee8a8d79d5fa1e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Oct 2023 22:23:19 +0000

flight 183420 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183420/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b75d9f556d6f290a4037064a2b934f5a3396328c
baseline version:
 ovmf                 7fe49887c4d227e585d5aa5530ee8a8d79d5fa1e

Last test of basis   183417  2023-10-18 17:42:23 Z    0 days
Testing same since   183420  2023-10-18 20:10:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuwei Chen <yuwei.chen@intel.com>

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
   7fe49887c4..b75d9f556d  b75d9f556d6f290a4037064a2b934f5a3396328c -> xen-tested-master

