Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80586F77CB
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 23:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530143.825559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugCK-0007dm-E2; Thu, 04 May 2023 21:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530143.825559; Thu, 04 May 2023 21:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pugCK-0007aS-Ao; Thu, 04 May 2023 21:09:08 +0000
Received: by outflank-mailman (input) for mailman id 530143;
 Thu, 04 May 2023 21:09:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pugCI-0007aI-L8; Thu, 04 May 2023 21:09:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pugCI-0001sl-Dw; Thu, 04 May 2023 21:09:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pugCH-0002lU-Uf; Thu, 04 May 2023 21:09:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pugCH-0004J9-UE; Thu, 04 May 2023 21:09:05 +0000
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
	bh=TVQRSwTIB8gYeI19Xh2M1eV0SW3m1yRle7jL7c478I0=; b=s/+aG+o6iyrfuHb6zgkpfEAMO7
	6jvLbvugp0LZw4Mq1q7gWqTwAOc1a6E8ArxKTKCTGXdGHo2YOoBLtQCP2BgSKZqYu2aAxGGJ6mqVQ
	IVI+iha+qm1IP85HJ0EdyqsE/kCzM6SqstIWyx4Zh8dxXFS3l/uW3VE7qicQBt/iMkug=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180535-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180535: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d992a05ade3d1bebc6e7a81aaf700286e0e217c8
X-Osstest-Versions-That:
    ovmf=4b02045f86d6aac8a617bf3f65f9cb2146630ce3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 May 2023 21:09:05 +0000

flight 180535 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180535/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d992a05ade3d1bebc6e7a81aaf700286e0e217c8
baseline version:
 ovmf                 4b02045f86d6aac8a617bf3f65f9cb2146630ce3

Last test of basis   180532  2023-05-04 14:40:45 Z    0 days
Testing same since   180535  2023-05-04 19:12:15 Z    0 days    1 attempts

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
   4b02045f86..d992a05ade  d992a05ade3d1bebc6e7a81aaf700286e0e217c8 -> xen-tested-master

