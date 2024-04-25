Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489078B19BD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 05:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711785.1112018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzqAQ-0004fg-6b; Thu, 25 Apr 2024 03:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711785.1112018; Thu, 25 Apr 2024 03:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzqAQ-0004cV-40; Thu, 25 Apr 2024 03:53:02 +0000
Received: by outflank-mailman (input) for mailman id 711785;
 Thu, 25 Apr 2024 03:53:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzqAO-0004cJ-UV; Thu, 25 Apr 2024 03:53:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzqAO-0001Yo-TC; Thu, 25 Apr 2024 03:53:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzqAO-0000V6-KJ; Thu, 25 Apr 2024 03:53:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzqAO-0007qB-Ju; Thu, 25 Apr 2024 03:53:00 +0000
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
	bh=JgleRuqzeCycpJHS3aEbowVcqZmag+vLyuxEdDutnrs=; b=Ici5yEllMnApQudE775fMLsP7z
	+sRlNJl75M1tYdq51q4GZuer4np8xBuMCFEsz3n46Fi59ajKy388a3M/JdQgGG1y+56boocRbHJnG
	7Tu2/+S94djQi85cdgakICwzqnhSIzOjNM8ZJ6+o6XbkzRTNoIUTbQdpODaae7KcuvA4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185792-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185792: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=66c24219ade92b85b24f3ce29b988d187a9f6517
X-Osstest-Versions-That:
    ovmf=90b6725562c82ec630d9e0cb19078f4b507db10b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Apr 2024 03:53:00 +0000

flight 185792 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185792/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 66c24219ade92b85b24f3ce29b988d187a9f6517
baseline version:
 ovmf                 90b6725562c82ec630d9e0cb19078f4b507db10b

Last test of basis   185789  2024-04-24 23:42:57 Z    0 days
Testing same since   185792  2024-04-25 01:43:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Srikanth Aithal <sraithal@amd.com>

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
   90b6725562..66c24219ad  66c24219ade92b85b24f3ce29b988d187a9f6517 -> xen-tested-master

