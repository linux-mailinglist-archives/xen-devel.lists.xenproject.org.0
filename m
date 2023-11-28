Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F387FBBAB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643174.1003122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yG6-0006fg-1V; Tue, 28 Nov 2023 13:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643174.1003122; Tue, 28 Nov 2023 13:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yG5-0006dZ-U8; Tue, 28 Nov 2023 13:36:13 +0000
Received: by outflank-mailman (input) for mailman id 643174;
 Tue, 28 Nov 2023 13:36:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7yG4-0006dP-Ug; Tue, 28 Nov 2023 13:36:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7yG4-0000iu-MV; Tue, 28 Nov 2023 13:36:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r7yG4-0000oT-D5; Tue, 28 Nov 2023 13:36:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r7yG4-00070a-CW; Tue, 28 Nov 2023 13:36:12 +0000
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
	bh=ePDj2lRKJD1t2ucRXxTNQdsU0Wv0msxwGf2TL7jPuOI=; b=Ie+OM0v6MVjc0Smrq1TAHeg2iA
	1M+4hEzhTSAmE6g/LQY/JvuEOfYQqORmJ3EyL/dulUZX3KTtQobe1K85chw2uO+hRhl5GfSzEi0wL
	1GScbHNULHvEXFD7iJYDPnEhpslu3q1Lji+ZhkCFjVrmwWsRnILFsLv5tMySlWOxXZYY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183890-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183890: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d451bba399687b4102459db5a447fc9abb8fdee1
X-Osstest-Versions-That:
    ovmf=0e9ce9146a6dc50a35488e3a4a7a2a4bbaf1eb1c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Nov 2023 13:36:12 +0000

flight 183890 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183890/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d451bba399687b4102459db5a447fc9abb8fdee1
baseline version:
 ovmf                 0e9ce9146a6dc50a35488e3a4a7a2a4bbaf1eb1c

Last test of basis   183879  2023-11-28 03:21:56 Z    0 days
Testing same since   183890  2023-11-28 10:41:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   0e9ce9146a..d451bba399  d451bba399687b4102459db5a447fc9abb8fdee1 -> xen-tested-master

