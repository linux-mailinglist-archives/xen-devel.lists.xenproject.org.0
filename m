Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1637565482D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 23:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468681.727854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8TmS-0000VF-ML; Thu, 22 Dec 2022 22:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468681.727854; Thu, 22 Dec 2022 22:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8TmS-0000TR-J3; Thu, 22 Dec 2022 22:11:12 +0000
Received: by outflank-mailman (input) for mailman id 468681;
 Thu, 22 Dec 2022 22:11:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8TmR-0000TH-JM; Thu, 22 Dec 2022 22:11:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8TmR-00016c-HW; Thu, 22 Dec 2022 22:11:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8TmR-0003Nd-5L; Thu, 22 Dec 2022 22:11:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8TmR-0004jL-4q; Thu, 22 Dec 2022 22:11:11 +0000
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
	bh=5PZIs3doRYpcAuPEnW1yfWXw64b1e+vGmKb4YjaPics=; b=JbWlR2pYadbolkaEARPXbokxOA
	mwYipOIl1sGP13odp5Hjc4IVXzGltRadCfAHGftNMQERz8RLFKIDL9M5pKf6r4oj7k+Csdl13nV4S
	gOQIaU5Jg+1ncVz3dj0YxeFcOG/W8W7KMn1tmbALypf75JY90BGKa67CAJttNVzPSRHQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175461-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175461: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d8d4abdff9096a69ff59d96ac4a8dd0e19e5cbcc
X-Osstest-Versions-That:
    ovmf=538ac013d6a673842d780c88b7b3c21730260e8e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Dec 2022 22:11:11 +0000

flight 175461 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175461/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d8d4abdff9096a69ff59d96ac4a8dd0e19e5cbcc
baseline version:
 ovmf                 538ac013d6a673842d780c88b7b3c21730260e8e

Last test of basis   175458  2022-12-22 13:44:17 Z    0 days
Testing same since   175461  2022-12-22 18:12:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>

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
   538ac013d6..d8d4abdff9  d8d4abdff9096a69ff59d96ac4a8dd0e19e5cbcc -> xen-tested-master

