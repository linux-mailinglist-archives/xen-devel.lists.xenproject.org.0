Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17C908792
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 11:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740556.1147647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3L0-0006zD-SL; Fri, 14 Jun 2024 09:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740556.1147647; Fri, 14 Jun 2024 09:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3L0-0006x1-P3; Fri, 14 Jun 2024 09:35:14 +0000
Received: by outflank-mailman (input) for mailman id 740556;
 Fri, 14 Jun 2024 09:35:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sI3L0-0006wr-0a; Fri, 14 Jun 2024 09:35:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sI3Kz-0000mH-Vw; Fri, 14 Jun 2024 09:35:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sI3Kz-0007su-NC; Fri, 14 Jun 2024 09:35:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sI3Kz-0001wk-Mi; Fri, 14 Jun 2024 09:35:13 +0000
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
	bh=igUA5ddgMFyY8muW04mJAuGvcYuswOBeaLhBe8iHnbI=; b=wVMPFG8FjiWpkRbRTmTIjr8Oca
	9LyUktHvQ+WekOD0XtgZ1dQxLo6flJ3LIFINjmp0f4wvx7ow1zLhM4fW6CSF9UQ1AgSHl8hjDw1+p
	TzlQY65Tw0FPxmfPUoyyp44A5mb4Pkrtc0BT1E34Nz5aXaHg+dnpGapo1rzoWkxOxJaE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186346-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186346: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ce91687a1b2d4e03b01abb474b4665629776f588
X-Osstest-Versions-That:
    ovmf=712797cf19acd292bf203522a79e40e7e13d268b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 Jun 2024 09:35:13 +0000

flight 186346 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186346/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ce91687a1b2d4e03b01abb474b4665629776f588
baseline version:
 ovmf                 712797cf19acd292bf203522a79e40e7e13d268b

Last test of basis   186338  2024-06-13 16:11:15 Z    0 days
Testing same since   186346  2024-06-14 07:13:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   712797cf19..ce91687a1b  ce91687a1b2d4e03b01abb474b4665629776f588 -> xen-tested-master

