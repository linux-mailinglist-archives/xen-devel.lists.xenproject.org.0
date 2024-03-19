Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423EC88013B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695469.1085261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbo4-0007mu-9y; Tue, 19 Mar 2024 15:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695469.1085261; Tue, 19 Mar 2024 15:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbo4-0007lL-6z; Tue, 19 Mar 2024 15:55:16 +0000
Received: by outflank-mailman (input) for mailman id 695469;
 Tue, 19 Mar 2024 15:55:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmbo2-0007l9-QC; Tue, 19 Mar 2024 15:55:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmbo2-00073N-LT; Tue, 19 Mar 2024 15:55:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmbo2-00063S-CM; Tue, 19 Mar 2024 15:55:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rmbo2-00076d-Bi; Tue, 19 Mar 2024 15:55:14 +0000
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
	bh=t/4tUPadefHj8sMiP/D1bR0Ufpg/VqItKS5Cr9c+Ga4=; b=MF4Zo0NJ+yidUfZsGly7mqcRqB
	9MzUc50ckPWYi3s4ESx41e11RBbBwnRnRsU13ZYVtLtVaSbSewnv/+SnP9Bk4aT3Md7oos4qpJTz7
	msQlPkaxI6wIInVyIYFmyFfeplZ9Bcl4GT/yjtVqNK32qHTq+6j/4qbo6KebA64AiJxY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185098-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185098: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=35f6a2780e5198315a9f100c07b3bc86187d20a8
X-Osstest-Versions-That:
    ovmf=3840c35e34d1c992268092b6366e26f2acc55a75
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Mar 2024 15:55:14 +0000

flight 185098 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185098/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 35f6a2780e5198315a9f100c07b3bc86187d20a8
baseline version:
 ovmf                 3840c35e34d1c992268092b6366e26f2acc55a75

Last test of basis   185049  2024-03-15 12:41:10 Z    4 days
Testing same since   185093  2024-03-19 10:11:15 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ceping Sun <cepingx.sun@intel.com>

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
   3840c35e34..35f6a2780e  35f6a2780e5198315a9f100c07b3bc86187d20a8 -> xen-tested-master

