Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C138FAF57
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 11:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735305.1141478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEQuw-0000uN-WD; Tue, 04 Jun 2024 09:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735305.1141478; Tue, 04 Jun 2024 09:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEQuw-0000sp-TV; Tue, 04 Jun 2024 09:57:22 +0000
Received: by outflank-mailman (input) for mailman id 735305;
 Tue, 04 Jun 2024 09:57:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEQuv-0000sf-9G; Tue, 04 Jun 2024 09:57:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEQuu-000775-Vd; Tue, 04 Jun 2024 09:57:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEQuu-0004tW-MZ; Tue, 04 Jun 2024 09:57:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sEQuu-0004mO-M4; Tue, 04 Jun 2024 09:57:20 +0000
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
	bh=Px8pXpGm8mDdUado2zE0WIR7K138b89DrHS6LciIy9U=; b=S0eT2LIat8bKHSBo7n0kFQ8AC5
	ljNZFwvQZxHkmbsZHyz+euVD20219JkpAqc1/ZWfY8ydUdLOW4QER7OxvBaZ5lwJZLAERKmNvRQI8
	hl/PQyRncMWITJVTW/bOlbiNeebp5f8h0gfYsKbnwbys02YB1WWBgsPBf1+SksGbjb68=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186245-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186245: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=077760fec40c2e5fcae274cc609d97aee12e5d56
X-Osstest-Versions-That:
    ovmf=27b044605cd5f6b33a3d231576003850b3fe305b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Jun 2024 09:57:20 +0000

flight 186245 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186245/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 077760fec40c2e5fcae274cc609d97aee12e5d56
baseline version:
 ovmf                 27b044605cd5f6b33a3d231576003850b3fe305b

Last test of basis   186240  2024-06-03 20:43:34 Z    0 days
Testing same since   186245  2024-06-04 07:42:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>

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
   27b044605c..077760fec4  077760fec40c2e5fcae274cc609d97aee12e5d56 -> xen-tested-master

