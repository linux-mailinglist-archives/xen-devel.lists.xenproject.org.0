Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA488683B3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 23:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685806.1067128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rejRV-0008AT-D6; Mon, 26 Feb 2024 22:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685806.1067128; Mon, 26 Feb 2024 22:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rejRV-00087q-9o; Mon, 26 Feb 2024 22:27:25 +0000
Received: by outflank-mailman (input) for mailman id 685806;
 Mon, 26 Feb 2024 22:27:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rejRU-00087g-BA; Mon, 26 Feb 2024 22:27:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rejRU-0007b0-9V; Mon, 26 Feb 2024 22:27:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rejRT-0001D4-SD; Mon, 26 Feb 2024 22:27:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rejRT-0000Bw-Rj; Mon, 26 Feb 2024 22:27:23 +0000
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
	bh=VO1n+Nh3aOZ/YVYqiXcGTEEaki/2+/fpq02KbDdCv3U=; b=ITwZn3o4CiO3G1LfoW2QjTPgxj
	yQ95T1u1EQ+ruhBgsJ7hC4iqfD6fIKZV0+jPNsZttXhFvbU6tkshFfqpILB9z4zwKe79URLbVkeXv
	ShKXB9JDJycdCawg587DemfDEYNso3rGqXRdDDrgz8NYtEoyw8HtvDHBj00obwd7P0RU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184772-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184772: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=68238d4f948069fc2c6b9cc13863bdced52a84d0
X-Osstest-Versions-That:
    ovmf=44fdc4f3983be77dda709d7a0c3fb8905fbf920b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Feb 2024 22:27:23 +0000

flight 184772 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184772/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 68238d4f948069fc2c6b9cc13863bdced52a84d0
baseline version:
 ovmf                 44fdc4f3983be77dda709d7a0c3fb8905fbf920b

Last test of basis   184768  2024-02-26 15:43:07 Z    0 days
Testing same since   184772  2024-02-26 19:43:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Junfeng Guan <junfengx.guan@intel.com>

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
   44fdc4f398..68238d4f94  68238d4f948069fc2c6b9cc13863bdced52a84d0 -> xen-tested-master

