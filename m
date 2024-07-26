Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCFC93D98F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 22:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765746.1176400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXRDj-0003rU-8A; Fri, 26 Jul 2024 20:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765746.1176400; Fri, 26 Jul 2024 20:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXRDj-0003pf-58; Fri, 26 Jul 2024 20:07:19 +0000
Received: by outflank-mailman (input) for mailman id 765746;
 Fri, 26 Jul 2024 20:07:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXRDh-0003nv-94; Fri, 26 Jul 2024 20:07:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXRDh-0004c5-4R; Fri, 26 Jul 2024 20:07:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXRDg-0001C4-Mq; Fri, 26 Jul 2024 20:07:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sXRDg-0004hM-MP; Fri, 26 Jul 2024 20:07:16 +0000
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
	bh=RIp4Ubwlfdy9lX5SAu5012TcR08pNSFbkYsl8YajSqY=; b=lj5LZe8lNx4Joj1Yk6SBmpvIim
	yBw2NSgBY9EQEl3Ja18lhliTziZQGIwC0hbv+jIUb/OA5QpUYq9OxLLJqrixDSguOAOg9m5++bbCF
	O7+MU3kinYwAiUW/KAM2eWdygxxvdzIUQ/GCiuUhuEX9lR/wHzRdFsz/sea38teG1wf8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187018-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187018: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=03ad59e631aaab0143c5b1c1d64f27f5da1eb8c4
X-Osstest-Versions-That:
    ovmf=6589843cc619b3a5e2d2c0e5b12451b11a3f2288
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Jul 2024 20:07:16 +0000

flight 187018 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187018/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 03ad59e631aaab0143c5b1c1d64f27f5da1eb8c4
baseline version:
 ovmf                 6589843cc619b3a5e2d2c0e5b12451b11a3f2288

Last test of basis   187015  2024-07-26 09:43:32 Z    0 days
Testing same since   187018  2024-07-26 17:45:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  George Liao <george.liao@intel.com>

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
   6589843cc6..03ad59e631  03ad59e631aaab0143c5b1c1d64f27f5da1eb8c4 -> xen-tested-master

