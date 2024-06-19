Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D0590F766
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 22:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744017.1151031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK1bL-0003ee-Ju; Wed, 19 Jun 2024 20:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744017.1151031; Wed, 19 Jun 2024 20:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK1bL-0003co-Gw; Wed, 19 Jun 2024 20:08:15 +0000
Received: by outflank-mailman (input) for mailman id 744017;
 Wed, 19 Jun 2024 20:08:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK1bK-0003ce-1l; Wed, 19 Jun 2024 20:08:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK1bJ-0003s2-TI; Wed, 19 Jun 2024 20:08:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sK1bJ-0008Fr-Jz; Wed, 19 Jun 2024 20:08:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sK1bJ-0001eD-JR; Wed, 19 Jun 2024 20:08:13 +0000
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
	bh=aQU9pkyYiXcDD4f+4WZjRqUAq4SjYkSjtSNdiguYD3k=; b=aANmEfg4d/lqnCsxJgxijucB7+
	FLThyxZ2D9KLd1aLipq58UQYBBmqx5anQmcMc2OvbG9bnTmGHHSGpvnR6dJ6AzGzF7pkRn6b9w9gd
	M9ATxpnSXUX5CQdhvAlOK3GgqjRMzai9nSkg6+4X2UDuIh0TAPV4LTCvEfyIoQPEwSzI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186414-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186414: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=95e220e95d6237e21f7c0b83fca02d56b9327c4a
X-Osstest-Versions-That:
    ovmf=4d4f56992460c039d0cfe48c394c2e07aecf1d22
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Jun 2024 20:08:13 +0000

flight 186414 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186414/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 95e220e95d6237e21f7c0b83fca02d56b9327c4a
baseline version:
 ovmf                 4d4f56992460c039d0cfe48c394c2e07aecf1d22

Last test of basis   186408  2024-06-19 05:41:10 Z    0 days
Testing same since   186414  2024-06-19 17:42:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   4d4f569924..95e220e95d  95e220e95d6237e21f7c0b83fca02d56b9327c4a -> xen-tested-master

