Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF156174C4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 04:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436100.690164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqQc2-0005by-7Q; Thu, 03 Nov 2022 03:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436100.690164; Thu, 03 Nov 2022 03:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqQc2-0005Yc-4B; Thu, 03 Nov 2022 03:09:50 +0000
Received: by outflank-mailman (input) for mailman id 436100;
 Thu, 03 Nov 2022 03:09:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqQc0-0005YS-LN; Thu, 03 Nov 2022 03:09:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqQc0-00085Y-Hu; Thu, 03 Nov 2022 03:09:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oqQc0-0000XL-0p; Thu, 03 Nov 2022 03:09:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oqQc0-0000O1-0I; Thu, 03 Nov 2022 03:09:48 +0000
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
	bh=Qsx7vpO+y59ztE9DEwMi/c+5ClDMr/KtvKPXa12FHVg=; b=tuFPU1Dj9C8Hzl9w0Qo9zuHw2W
	oJA0oLNRKF8ojYs+l7A3QF2z5/yH8JhoBXGnhiXvH3RY4gS4U4KefJbUMsTb2S56Ic/Jlx6yzCxmd
	y+N8acKYZEtKH1of+S8UWga3bxFKRojvggrPh0ZPxIVmG5hiIorRw9FKXq/ivzIr+krM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174593-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174593: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c46204e25f5b929fae2b336c03c73fada632d4f4
X-Osstest-Versions-That:
    ovmf=957a15adaf72b945d50703977475bf45cbd18c20
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Nov 2022 03:09:48 +0000

flight 174593 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174593/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c46204e25f5b929fae2b336c03c73fada632d4f4
baseline version:
 ovmf                 957a15adaf72b945d50703977475bf45cbd18c20

Last test of basis   174587  2022-11-02 12:11:56 Z    0 days
Testing same since   174593  2022-11-02 21:43:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   957a15adaf..c46204e25f  c46204e25f5b929fae2b336c03c73fada632d4f4 -> xen-tested-master

