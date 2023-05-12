Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301D700C16
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 17:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533865.830840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxUsb-0001c4-08; Fri, 12 May 2023 15:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533865.830840; Fri, 12 May 2023 15:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxUsa-0001a7-TF; Fri, 12 May 2023 15:40:24 +0000
Received: by outflank-mailman (input) for mailman id 533865;
 Fri, 12 May 2023 15:40:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxUsZ-0001Zx-0u; Fri, 12 May 2023 15:40:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxUsY-0007eg-U9; Fri, 12 May 2023 15:40:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxUsY-0006hm-HW; Fri, 12 May 2023 15:40:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pxUsY-0007S2-GE; Fri, 12 May 2023 15:40:22 +0000
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
	bh=R5DSpnZtP/yiYBCQOqbQxFoia8sHbk0F9RcmEQgjUig=; b=AC/DoRmAvll0wByfcFgHL9pqBJ
	Itk+3pUUQKVPUaa9nH4Ii4A1+tCAcnGMYNxgDRplPuxuWgpsYAfWv4TUNlHl924kFvyqMXeT/sxS/
	1vPTd6JKx/Y0lhTdQQ7JPRqCVuNkn1sEfFc3QRQnfvfAMBTeGIQA5MhC/uRbebDV/Rtw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180635-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180635: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d3225577123767fd09c91201d27e9c91663ae132
X-Osstest-Versions-That:
    ovmf=0b37723186ec1525b6caf14b0309fb0ed04084d7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 May 2023 15:40:22 +0000

flight 180635 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180635/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d3225577123767fd09c91201d27e9c91663ae132
baseline version:
 ovmf                 0b37723186ec1525b6caf14b0309fb0ed04084d7

Last test of basis   180629  2023-05-12 06:42:08 Z    0 days
Testing same since   180635  2023-05-12 13:40:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>

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
   0b37723186..d322557712  d3225577123767fd09c91201d27e9c91663ae132 -> xen-tested-master

