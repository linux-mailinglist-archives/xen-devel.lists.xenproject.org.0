Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D9357F39
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 11:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107098.204695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUR10-0003Tt-JG; Thu, 08 Apr 2021 09:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107098.204695; Thu, 08 Apr 2021 09:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUR10-0003TP-FL; Thu, 08 Apr 2021 09:31:54 +0000
Received: by outflank-mailman (input) for mailman id 107098;
 Thu, 08 Apr 2021 09:31:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUR0z-0003TH-Qi; Thu, 08 Apr 2021 09:31:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUR0z-0008TW-D2; Thu, 08 Apr 2021 09:31:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUR0z-00060J-4l; Thu, 08 Apr 2021 09:31:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lUR0z-0007mC-4G; Thu, 08 Apr 2021 09:31:53 +0000
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
	bh=Ac87KTjzKOxdpftoe/HwLizYUL9JVT3fRpNmzwOYxVg=; b=EjxsgdY6c83YAjSGIuplUturUt
	AFyomDuI+MDGDlLw1Gw7D2Gh2ilgOz2C2H+gCXwCMWK0ReB4BHo5maXZTuqxdUy2A/IOh2xZyULau
	qwV8OU9qcTpOn8z9LQz8fXrDsJqcxq5l6o05jolOv9XIAUuVICioCy3CaaF5P5CLo3Ek=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160799-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160799: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9c08b3e7d5ac177a1ecb3678004fd94164865814
X-Osstest-Versions-That:
    ovmf=4ac02962017c77bf38b462f970c884c2dc7931cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Apr 2021 09:31:53 +0000

flight 160799 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160799/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9c08b3e7d5ac177a1ecb3678004fd94164865814
baseline version:
 ovmf                 4ac02962017c77bf38b462f970c884c2dc7931cf

Last test of basis   160757  2021-04-06 01:11:18 Z    2 days
Testing same since   160799  2021-04-07 16:40:17 Z    0 days    1 attempts

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
   4ac0296201..9c08b3e7d5  9c08b3e7d5ac177a1ecb3678004fd94164865814 -> xen-tested-master

