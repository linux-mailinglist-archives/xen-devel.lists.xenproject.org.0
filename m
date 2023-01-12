Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12066784A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476257.738337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFz0Y-00006R-U5; Thu, 12 Jan 2023 14:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476257.738337; Thu, 12 Jan 2023 14:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFz0Y-0008Th-RH; Thu, 12 Jan 2023 14:56:46 +0000
Received: by outflank-mailman (input) for mailman id 476257;
 Thu, 12 Jan 2023 14:56:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFz0X-0008TX-AP; Thu, 12 Jan 2023 14:56:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFz0X-0002uC-88; Thu, 12 Jan 2023 14:56:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFz0W-0007Jk-T9; Thu, 12 Jan 2023 14:56:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pFz0W-0002Ga-SY; Thu, 12 Jan 2023 14:56:44 +0000
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
	bh=dno1s/MtE3UryhhZT0F6rt+55OZJnxvaD340+cMODaI=; b=CZb6/XM7d802a/yM20lm7sBrrd
	7ozlB4ayivH15WJ67rRC0m23ck7QDHiG44MNKm0c/eOSQctBY/4/8OzQiDYqVgsbFYaDMIDsN4kK+
	GYuH82mNvFQ1Wty/6mty7eJXw7JSvUM18qR9kST0ok2vAd/xa8SoY71Wsbi2v7uh4eqg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175740-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175740: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e5ec3ba409b5baa9cf429cc25fdf3c8d1b8dcef0
X-Osstest-Versions-That:
    ovmf=fe405f08a09e9f2306c72aa23d8edfbcfaa23bff
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Jan 2023 14:56:44 +0000

flight 175740 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175740/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e5ec3ba409b5baa9cf429cc25fdf3c8d1b8dcef0
baseline version:
 ovmf                 fe405f08a09e9f2306c72aa23d8edfbcfaa23bff

Last test of basis   175711  2023-01-10 21:40:39 Z    1 days
Testing same since   175740  2023-01-12 10:40:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Laszlo Ersek <lersek@redhat.com>

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
   fe405f08a0..e5ec3ba409  e5ec3ba409b5baa9cf429cc25fdf3c8d1b8dcef0 -> xen-tested-master

