Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD560BD2B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 00:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429417.680390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on5fd-0005wm-OJ; Mon, 24 Oct 2022 22:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429417.680390; Mon, 24 Oct 2022 22:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on5fd-0005uw-Jt; Mon, 24 Oct 2022 22:11:45 +0000
Received: by outflank-mailman (input) for mailman id 429417;
 Mon, 24 Oct 2022 22:11:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1on5fc-0005um-90; Mon, 24 Oct 2022 22:11:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1on5fc-0004jc-6S; Mon, 24 Oct 2022 22:11:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1on5fb-0006RP-LA; Mon, 24 Oct 2022 22:11:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1on5fb-0006CT-Kh; Mon, 24 Oct 2022 22:11:43 +0000
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
	bh=HFwiR9nMyLAIK2Pp4vYQchTXmY2zta5QQdspVDEqy1A=; b=cHSXofHzTusRJrV8WNAnFSG32H
	YjYuZj2TVE/oorUrrgKHQBYDUjvkU4Pu/ZqcFPrAHADKlkIypTdHQE8pFMHqBEir4Hf23IXxlU/xn
	yg7XXjpirFR/z69QT3PRP6iFW5xq6GCb8HfJMPiUc/YNL8muW3IGDl/tRcRNn0fRbCa8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174354-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174354: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4d29da411fa031031a90ec713ad826570e9117d7
X-Osstest-Versions-That:
    ovmf=6fd754ec0fe96511cc48e3babe1a1b650fb3994f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Oct 2022 22:11:43 +0000

flight 174354 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174354/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4d29da411fa031031a90ec713ad826570e9117d7
baseline version:
 ovmf                 6fd754ec0fe96511cc48e3babe1a1b650fb3994f

Last test of basis   174265  2022-10-22 13:40:31 Z    2 days
Testing same since   174354  2022-10-24 06:40:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  JessyX Wu <jessyx.wu@intel.com>
  Wu, JessyX <jessyx.wu@intel.com>

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
   6fd754ec0f..4d29da411f  4d29da411fa031031a90ec713ad826570e9117d7 -> xen-tested-master

