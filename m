Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966D6E9BCE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 20:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524349.815224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppZC8-0000j1-OV; Thu, 20 Apr 2023 18:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524349.815224; Thu, 20 Apr 2023 18:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppZC8-0000gx-LX; Thu, 20 Apr 2023 18:39:48 +0000
Received: by outflank-mailman (input) for mailman id 524349;
 Thu, 20 Apr 2023 18:39:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppZC6-0000gn-VL; Thu, 20 Apr 2023 18:39:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppZC6-0005a2-Mp; Thu, 20 Apr 2023 18:39:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppZC6-0008FN-8r; Thu, 20 Apr 2023 18:39:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppZC6-0006Ca-8U; Thu, 20 Apr 2023 18:39:46 +0000
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
	bh=XZ2icQ5LssUKD9bcTPtkgDAursXoiybuZs4FqmlInRA=; b=rmyr4bt0vKRfMgisiFFPnvOI9n
	R1vkePs8UAe+bXRPCqvhz+Afm9Eimu036dVwuq1t7u9J9lHrxnmXwoOERSIzmk3R7IAYqzzNY20RN
	8LnQ2+NwJ1x0SRQFyZAPHEVCrLTOoz1fJ3m29P50lQ6YbQPDN70gArr/0pqxpw9/4O3Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180337-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180337: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8f4ec0cc433a33967cdbbb945acd37b6ae1d3fce
X-Osstest-Versions-That:
    ovmf=e3d2c08322bc61e9c5b87b3c282dd2af3d52aec6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Apr 2023 18:39:46 +0000

flight 180337 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180337/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8f4ec0cc433a33967cdbbb945acd37b6ae1d3fce
baseline version:
 ovmf                 e3d2c08322bc61e9c5b87b3c282dd2af3d52aec6

Last test of basis   180307  2023-04-19 04:10:44 Z    1 days
Testing same since   180337  2023-04-20 16:41:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marvin Häuser <mhaeuser@posteo.de>
  Marvin Häuser <mhaeuser@posteo.de>

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
   e3d2c08322..8f4ec0cc43  8f4ec0cc433a33967cdbbb945acd37b6ae1d3fce -> xen-tested-master

