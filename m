Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35080A8FE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650751.1016533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdlF-0006KQ-AY; Fri, 08 Dec 2023 16:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650751.1016533; Fri, 08 Dec 2023 16:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdlF-0006IH-7d; Fri, 08 Dec 2023 16:31:33 +0000
Received: by outflank-mailman (input) for mailman id 650751;
 Fri, 08 Dec 2023 16:31:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBdlD-0006I7-MB; Fri, 08 Dec 2023 16:31:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBdlD-0002wf-9E; Fri, 08 Dec 2023 16:31:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBdlC-0007f9-Rf; Fri, 08 Dec 2023 16:31:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBdlC-00068r-RB; Fri, 08 Dec 2023 16:31:30 +0000
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
	bh=ld+rJ75yMQe8HQFCpQpKTvNAwTkC0vvvrON6A7+8U6k=; b=gCsDfHWk5yuaf9hLPfj7/pYwob
	MLFhNnlWzV/lR1lvA8DiD/3Y8KSg+VbbK2zdxUUqNS0YRVhxQK16/Kytu/R9pzPDPkxMh8CKry2IX
	x7xPnFUPzyB3gWgYd39TwAbQz9JI83T+eODz5gKGy3dnFRh8yfj0MDuqmUJx7vXyycBo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184038-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184038: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2cd9d5f6fa710e9a8ee810212081f86702114d2f
X-Osstest-Versions-That:
    ovmf=eccdab611c01aa40b6cefcfbcb4d23e54b4c0ec6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Dec 2023 16:31:30 +0000

flight 184038 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184038/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2cd9d5f6fa710e9a8ee810212081f86702114d2f
baseline version:
 ovmf                 eccdab611c01aa40b6cefcfbcb4d23e54b4c0ec6

Last test of basis   184028  2023-12-07 20:11:01 Z    0 days
Testing same since   184038  2023-12-08 13:43:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Michael Roth <michael.roth@amd.com>
  Page Chen <paiching_chen@apple.com>
  Wu, Jiaxin <jiaxin.wu@intel.com>

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
   eccdab611c..2cd9d5f6fa  2cd9d5f6fa710e9a8ee810212081f86702114d2f -> xen-tested-master

