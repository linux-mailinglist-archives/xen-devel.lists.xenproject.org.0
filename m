Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A42813645
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654688.1021886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDobM-0008Sn-Aj; Thu, 14 Dec 2023 16:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654688.1021886; Thu, 14 Dec 2023 16:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDobM-0008Op-7k; Thu, 14 Dec 2023 16:30:20 +0000
Received: by outflank-mailman (input) for mailman id 654688;
 Thu, 14 Dec 2023 16:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDobL-0008Of-9g; Thu, 14 Dec 2023 16:30:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDobK-0007w9-Sm; Thu, 14 Dec 2023 16:30:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDobK-0004jA-Ch; Thu, 14 Dec 2023 16:30:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rDobK-0007nB-CA; Thu, 14 Dec 2023 16:30:18 +0000
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
	bh=OUwypn1g7wqdCJpDo5h06C/SbmCMelvzBWKrPtqZu5o=; b=zKvhw0tZpx8GgXpZXQe6mSQkvv
	rEt/UmLHge2zV48yE7WHFVgLcHJIGb1/Wx0/bymFAX6q5708GpgvWkg5EC3BFQQ/jXnweSu3lvzNR
	j0KMY3tMuid9zZSCE8BgaY5VB1BogI7Po4iE3d5QKp39tTs09s/NIXVslS0/QDHEHtA4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184136-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184136: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=59a952d9ab007fda9f7a66418782c8257d3c917f
X-Osstest-Versions-That:
    ovmf=b8a3eec88cc74bbfe7fb389d026cc7d1d8a989c8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Dec 2023 16:30:18 +0000

flight 184136 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184136/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 59a952d9ab007fda9f7a66418782c8257d3c917f
baseline version:
 ovmf                 b8a3eec88cc74bbfe7fb389d026cc7d1d8a989c8

Last test of basis   184118  2023-12-13 03:14:37 Z    1 days
Testing same since   184136  2023-12-14 14:42:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jianyong Wu <jianyong.wu@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   b8a3eec88c..59a952d9ab  59a952d9ab007fda9f7a66418782c8257d3c917f -> xen-tested-master

