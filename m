Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A44931352
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 13:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758840.1168350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTK8G-0002gZ-2M; Mon, 15 Jul 2024 11:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758840.1168350; Mon, 15 Jul 2024 11:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTK8F-0002eK-V8; Mon, 15 Jul 2024 11:44:39 +0000
Received: by outflank-mailman (input) for mailman id 758840;
 Mon, 15 Jul 2024 11:44:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTK8E-0002eA-KN; Mon, 15 Jul 2024 11:44:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTK8E-00041R-Cr; Mon, 15 Jul 2024 11:44:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTK8E-0007Nv-0R; Mon, 15 Jul 2024 11:44:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTK8D-00072U-WC; Mon, 15 Jul 2024 11:44:37 +0000
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
	bh=O9Mh9bzSn8wtGVA5NCBLFKesr30cd9sSRjQCWjIwjtA=; b=VGMKbSZXA94RjKkDYCW2iMJsgz
	M4igAOLWJ6ib80WGkxtmsEC+k75WKLW/UFBqzhyUCXNSoQYp8doLBJvR7aQb8RQ73S873rJiO5v7A
	lEAs3NPfUdEAJNFLclWMaf5gtqgmNAiG3bEdgu05Em6+JK9gWb9S+57N43sFe1GVDGIA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186805-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186805: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8bb9145ad1a5db068f63e3e19b4a532226351b2b
X-Osstest-Versions-That:
    ovmf=91226e1eecacac832e5091d6a1867dc52666ee85
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jul 2024 11:44:37 +0000

flight 186805 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186805/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8bb9145ad1a5db068f63e3e19b4a532226351b2b
baseline version:
 ovmf                 91226e1eecacac832e5091d6a1867dc52666ee85

Last test of basis   186801  2024-07-15 04:13:14 Z    0 days
Testing same since   186805  2024-07-15 08:41:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>

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
   91226e1eec..8bb9145ad1  8bb9145ad1a5db068f63e3e19b4a532226351b2b -> xen-tested-master

