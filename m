Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A901649A54
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 09:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459134.716795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4eU3-0006Un-5s; Mon, 12 Dec 2022 08:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459134.716795; Mon, 12 Dec 2022 08:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4eU3-0006Su-2Z; Mon, 12 Dec 2022 08:48:23 +0000
Received: by outflank-mailman (input) for mailman id 459134;
 Mon, 12 Dec 2022 08:48:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p4eU1-0006Sk-Ka; Mon, 12 Dec 2022 08:48:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p4eU1-0005TV-Fe; Mon, 12 Dec 2022 08:48:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p4eU1-00016i-0S; Mon, 12 Dec 2022 08:48:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p4eU0-0004W2-WF; Mon, 12 Dec 2022 08:48:21 +0000
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
	bh=xe0eWfvhQK7rGR5MGX/zsvNisBkl5XZ63OpBp6i8qvI=; b=ZiJ0/iLuVIfUCeBavKLxf5s28T
	Zhrs7/ei5XcJ/L0B7gQ5fYdw03H7w82gfcoiEarPJovprKWkuUszdUgzrvkTQGO0eWTHgOTa5R9gF
	S6JIdVUoPUn82jxdNqfoxRIYS2+4hESaZgcdT2rAuo+aYiM/DP7lPvgsNNSRLRb8/ShE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175151-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175151: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5890a18409a0e67a491c600b930e6c904ad3b3fd
X-Osstest-Versions-That:
    ovmf=a6542894391bae58b7704b2624b541a2b8b9ed93
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Dec 2022 08:48:20 +0000

flight 175151 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175151/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5890a18409a0e67a491c600b930e6c904ad3b3fd
baseline version:
 ovmf                 a6542894391bae58b7704b2624b541a2b8b9ed93

Last test of basis   175149  2022-12-12 01:55:58 Z    0 days
Testing same since   175151  2022-12-12 06:42:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chevron Li (WH) <chevron.li@bayhubtech.com>
  Chevron Li <chevron.li@bayhubtech.com>

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
   a654289439..5890a18409  5890a18409a0e67a491c600b930e6c904ad3b3fd -> xen-tested-master

