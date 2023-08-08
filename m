Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8E7735FE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 03:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579195.907065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTBdm-00050s-QJ; Tue, 08 Aug 2023 01:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579195.907065; Tue, 08 Aug 2023 01:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTBdm-0004ye-KP; Tue, 08 Aug 2023 01:36:06 +0000
Received: by outflank-mailman (input) for mailman id 579195;
 Tue, 08 Aug 2023 01:36:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTBdk-0004yU-T7; Tue, 08 Aug 2023 01:36:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTBdk-0003Ww-O1; Tue, 08 Aug 2023 01:36:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qTBdk-0001nw-9c; Tue, 08 Aug 2023 01:36:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qTBdk-0003HS-98; Tue, 08 Aug 2023 01:36:04 +0000
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
	bh=4Nd4FByL2D5IlDGnd1+R0DW+6VmuB9uC5CzYQInlXhs=; b=dY+pDueD0A2ze3j29KC5DWCZl/
	iSmwPWW1V8pjgtPmayBo2BCI0Hti5j5wDmge3+K8f/sJjzH2PgC9djTgetok8Vy1pfSKQWRnHqUwt
	MbjvQehonOf9d5ZuyNxmXlL+1ksbScXgJf5lKLkhyZCRmj9k1XzlfS0M56XXMFzZGk5U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182224-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182224: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3c274c0d83d5464b336e40058bc5969bfef25f7b
X-Osstest-Versions-That:
    ovmf=2d8c17a9b61ad298986daffe5373026c3b88c741
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Aug 2023 01:36:04 +0000

flight 182224 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182224/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3c274c0d83d5464b336e40058bc5969bfef25f7b
baseline version:
 ovmf                 2d8c17a9b61ad298986daffe5373026c3b88c741

Last test of basis   182184  2023-08-04 14:44:00 Z    3 days
Testing same since   182224  2023-08-07 23:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nate DeSimone <nathaniel.l.desimone@intel.com>

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
   2d8c17a9b6..3c274c0d83  3c274c0d83d5464b336e40058bc5969bfef25f7b -> xen-tested-master

