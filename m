Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1183247D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 07:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668927.1041425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQi0D-0005JO-50; Fri, 19 Jan 2024 06:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668927.1041425; Fri, 19 Jan 2024 06:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQi0D-0005Hp-23; Fri, 19 Jan 2024 06:05:17 +0000
Received: by outflank-mailman (input) for mailman id 668927;
 Fri, 19 Jan 2024 06:05:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQi0B-0005Hc-UW; Fri, 19 Jan 2024 06:05:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQi0B-0002tW-7Z; Fri, 19 Jan 2024 06:05:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rQi0A-0007n3-Q6; Fri, 19 Jan 2024 06:05:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rQi0A-0000fh-PY; Fri, 19 Jan 2024 06:05:14 +0000
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
	bh=qPOXygakeayf4h0nFZXSCPdg5rnyU/byoY5tEWbiaWY=; b=vriLTIrn+g3rkEWa7v2dlzEzc4
	7N8gVilaEidoj+PiG6wNMQyfPSYh0ejZ70uUMYNfQ6AoRq5NQsnl+LDpehXTvjO06UdZ7aKh7Iar6
	r5bsuf98m/Ij7xoSk76kYU7fNZENIQYZSp2Gs5kKSY+FGNM8inqm4THTFMZpUKmgUsS8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184400-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184400: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9d3fe85fcc8ff386ee0814a4dad03bbf7dc54594
X-Osstest-Versions-That:
    ovmf=264636d8e6983e0f6dc6be2fca9d84ec81315954
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Jan 2024 06:05:14 +0000

flight 184400 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184400/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9d3fe85fcc8ff386ee0814a4dad03bbf7dc54594
baseline version:
 ovmf                 264636d8e6983e0f6dc6be2fca9d84ec81315954

Last test of basis   184395  2024-01-18 19:44:20 Z    0 days
Testing same since   184400  2024-01-19 03:43:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashish Singhal <ashishsingha@nvidia.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   264636d8e6..9d3fe85fcc  9d3fe85fcc8ff386ee0814a4dad03bbf7dc54594 -> xen-tested-master

