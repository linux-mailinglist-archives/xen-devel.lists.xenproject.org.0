Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83198326BF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668977.1041509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlDK-0003WM-G0; Fri, 19 Jan 2024 09:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668977.1041509; Fri, 19 Jan 2024 09:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlDK-0003Ul-D8; Fri, 19 Jan 2024 09:31:02 +0000
Received: by outflank-mailman (input) for mailman id 668977;
 Fri, 19 Jan 2024 09:31:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQlDJ-0003UZ-KK; Fri, 19 Jan 2024 09:31:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQlDJ-0006vO-DD; Fri, 19 Jan 2024 09:31:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQlDJ-0008CC-1P; Fri, 19 Jan 2024 09:31:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rQlDJ-0004zJ-0K; Fri, 19 Jan 2024 09:31:01 +0000
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
	bh=317uUWC4o1lRjcHKpQmjwVkQJbzk8keDqx+MXQWjJHg=; b=yprR/1Z3XyvoARJXejZEYCKVIe
	MFwGlkokvgT7Iw8COvKSfOz9R1C/e7BopWJMtXq5vh9LEUZPSxh7ciae8epEDR+qvJRQaKAoRA32K
	JfPN4TwlCq0h1X6VnJUST8zknL/vAEQb6KwI08ED4VWC08pkeIUS2GSoo7SQo/fGfHSA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184403-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184403: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0223bdd4e40975c427616761fb13c9454461b64d
X-Osstest-Versions-That:
    ovmf=9d3fe85fcc8ff386ee0814a4dad03bbf7dc54594
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Jan 2024 09:31:01 +0000

flight 184403 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184403/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0223bdd4e40975c427616761fb13c9454461b64d
baseline version:
 ovmf                 9d3fe85fcc8ff386ee0814a4dad03bbf7dc54594

Last test of basis   184400  2024-01-19 03:43:25 Z    0 days
Testing same since   184403  2024-01-19 07:11:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yi Li <yi1.li@intel.com>

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
   9d3fe85fcc..0223bdd4e4  0223bdd4e40975c427616761fb13c9454461b64d -> xen-tested-master

