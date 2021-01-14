Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD852F61A9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 14:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67001.119243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l02TU-000206-Tn; Thu, 14 Jan 2021 13:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67001.119243; Thu, 14 Jan 2021 13:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l02TU-0001ze-Pz; Thu, 14 Jan 2021 13:15:40 +0000
Received: by outflank-mailman (input) for mailman id 67001;
 Thu, 14 Jan 2021 13:15:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l02TT-0001zW-MX; Thu, 14 Jan 2021 13:15:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l02TT-0003pt-DI; Thu, 14 Jan 2021 13:15:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l02TT-0005FW-5a; Thu, 14 Jan 2021 13:15:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l02TT-0000Wh-4y; Thu, 14 Jan 2021 13:15:39 +0000
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
	bh=+CW2p+soCm3TUIFPcPmHxPt0pVbi86JJfmad0ZKGB6U=; b=Y1o2nV2pW4/japdHvGff4v3j6o
	lTlOxgd89BkrsNjDY2JN9hXDVrOl9DqIL2szB81wn0UZfqEh/bdVW5C2Oj/9SXtGeUnlit7nwWBBb
	vbtioO9t3fPZ4mPmUfp2alK9gAIFo3kDQrN5hVOUCa3Jhhf4NTTrKErLKoFq7zIJvTBg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158417-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158417: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=536a3e67263b6d891152c0511cbdbbadf42a7360
X-Osstest-Versions-That:
    ovmf=da45a3608787d77fc55d915bee3903f5119b3ee6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Jan 2021 13:15:39 +0000

flight 158417 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158417/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 536a3e67263b6d891152c0511cbdbbadf42a7360
baseline version:
 ovmf                 da45a3608787d77fc55d915bee3903f5119b3ee6

Last test of basis   158414  2021-01-14 01:40:10 Z    0 days
Testing same since   158417  2021-01-14 08:20:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   da45a36087..536a3e6726  536a3e67263b6d891152c0511cbdbbadf42a7360 -> xen-tested-master

