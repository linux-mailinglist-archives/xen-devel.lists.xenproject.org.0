Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4769697BB02
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 12:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800259.1210195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqs6E-0006xj-F2; Wed, 18 Sep 2024 10:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800259.1210195; Wed, 18 Sep 2024 10:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqs6E-0006v9-B6; Wed, 18 Sep 2024 10:39:54 +0000
Received: by outflank-mailman (input) for mailman id 800259;
 Wed, 18 Sep 2024 10:39:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqs6C-0006uz-Bn; Wed, 18 Sep 2024 10:39:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqs6C-0000eg-An; Wed, 18 Sep 2024 10:39:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqs6C-0005l5-0J; Wed, 18 Sep 2024 10:39:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sqs6B-0006A1-WD; Wed, 18 Sep 2024 10:39:51 +0000
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
	bh=8LpxlVmhClaTmcad7wlaXMOcSJ3JxGg9zgEf/YIuphI=; b=UnBJmQUTHBbqHfFI7aqiwP3asm
	+ahSIcYfORZHugsm/df2Ez7VdNE/z3cCmai+vTiVGo7we7h+qSfJbNZZRfgh6wyfM9kWksv1q+ZOC
	rXZAt7U7yFP4p5Y7oawBLS6fpRenFLZxlMDSeGKoo7LIKjailr9IDbJgq0yXoBxORowA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187744-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187744: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5901f19a877c87de73f6b28265ad5db60b2239e1
X-Osstest-Versions-That:
    ovmf=21e8a85653e104385bfb8218fe22a72053bd3d2d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Sep 2024 10:39:51 +0000

flight 187744 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187744/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5901f19a877c87de73f6b28265ad5db60b2239e1
baseline version:
 ovmf                 21e8a85653e104385bfb8218fe22a72053bd3d2d

Last test of basis   187740  2024-09-18 04:13:29 Z    0 days
Testing same since   187744  2024-09-18 08:13:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   21e8a85653..5901f19a87  5901f19a877c87de73f6b28265ad5db60b2239e1 -> xen-tested-master

