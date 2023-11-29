Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AA27FD3C8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 11:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643790.1004285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8HbC-0007g2-4D; Wed, 29 Nov 2023 10:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643790.1004285; Wed, 29 Nov 2023 10:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8HbC-0007eM-0p; Wed, 29 Nov 2023 10:15:18 +0000
Received: by outflank-mailman (input) for mailman id 643790;
 Wed, 29 Nov 2023 10:15:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8HbA-0007eB-Ri; Wed, 29 Nov 2023 10:15:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8HbA-0007Ww-F6; Wed, 29 Nov 2023 10:15:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8HbA-0001q5-1K; Wed, 29 Nov 2023 10:15:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8HbA-0007xX-0t; Wed, 29 Nov 2023 10:15:16 +0000
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
	bh=k0oqERVtC1kfoq2thdVKyq/3Fr2mMzJX5/pWT4aZ9go=; b=RDK1JcWcp8p0gPAOSShUpYhb+C
	uxrnBSO1/x5yA4mdWYAwXONh2UaxnqvBEMUb3PnaoVt1efwcepa6KRELW2RdWrr273rExOOihwD33
	pcIutYAZLSMRXUkA9gNRvGbIRPtJskzk01O5QNRUUeM0J3B/rZhRwD4g4e7b9Et0GAnM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183932-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183932: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=68d506e0d15c0c412142be68ed006c65b641560f
X-Osstest-Versions-That:
    ovmf=88580a79d49f923ed9347d6161a5cff28a46f627
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Nov 2023 10:15:16 +0000

flight 183932 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183932/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 68d506e0d15c0c412142be68ed006c65b641560f
baseline version:
 ovmf                 88580a79d49f923ed9347d6161a5cff28a46f627

Last test of basis   183923  2023-11-29 01:56:04 Z    0 days
Testing same since   183932  2023-11-29 07:41:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   88580a79d4..68d506e0d1  68d506e0d15c0c412142be68ed006c65b641560f -> xen-tested-master

