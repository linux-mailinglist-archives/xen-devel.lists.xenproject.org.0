Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E335341C
	for <lists+xen-devel@lfdr.de>; Sat,  3 Apr 2021 15:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105074.201193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSgEm-0006Kp-F7; Sat, 03 Apr 2021 13:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105074.201193; Sat, 03 Apr 2021 13:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSgEm-0006KM-Ab; Sat, 03 Apr 2021 13:22:52 +0000
Received: by outflank-mailman (input) for mailman id 105074;
 Sat, 03 Apr 2021 13:22:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lSgEl-0006KE-9R; Sat, 03 Apr 2021 13:22:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lSgEl-0004j1-54; Sat, 03 Apr 2021 13:22:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lSgEk-0003Ki-Os; Sat, 03 Apr 2021 13:22:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lSgEk-0001kM-OP; Sat, 03 Apr 2021 13:22:50 +0000
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
	bh=L23KO64JtxPOP3a+tBCezKJ7BJhQaWC0biCI+3Eo+gU=; b=4N1DYlJe/LumMoerVmD5rHJ3D1
	2nK1iHdrGqhelx8AvRaGd13svH6Mg4yLAYsUFYxNneuOT6qdQWpEfSgSHKFSZ8CaeC8G8neKoTl0t
	tBHurOPw4EPsgj5bJ9YpiiwyHqasgbCkltF4qCm7OaxIoB9KobV+eAFxCEMKNafdANgs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160687-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160687: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f95cdd316c3d56e8f76b5044be54b9645e1dc60f
X-Osstest-Versions-That:
    ovmf=8c8922988544d31e8c87dd595f209828edcee962
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 03 Apr 2021 13:22:50 +0000

flight 160687 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160687/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f95cdd316c3d56e8f76b5044be54b9645e1dc60f
baseline version:
 ovmf                 8c8922988544d31e8c87dd595f209828edcee962

Last test of basis   160656  2021-04-01 23:40:07 Z    1 days
Testing same since   160687  2021-04-03 01:55:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   8c89229885..f95cdd316c  f95cdd316c3d56e8f76b5044be54b9645e1dc60f -> xen-tested-master

