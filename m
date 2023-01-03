Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C367B65BE78
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 11:55:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470561.730101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCewS-0000On-E8; Tue, 03 Jan 2023 10:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470561.730101; Tue, 03 Jan 2023 10:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCewS-0000Mv-Au; Tue, 03 Jan 2023 10:54:48 +0000
Received: by outflank-mailman (input) for mailman id 470561;
 Tue, 03 Jan 2023 10:54:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pCewQ-0000Ml-Dp; Tue, 03 Jan 2023 10:54:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pCewQ-0007FR-BH; Tue, 03 Jan 2023 10:54:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pCewQ-0002LA-0f; Tue, 03 Jan 2023 10:54:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pCewQ-0002Jh-0H; Tue, 03 Jan 2023 10:54:46 +0000
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
	bh=ZTHG2ZwIsaSqEf66LtQuBcdhmyksofI4lkxW5wb3inM=; b=Cq4NCQ/SE1TLd91avksjoLhlaU
	Hhcyho3PAvNg3eZdw/rYtiNSjaXK6X1ipt71IjC5lmGXjAvDI75aqDyvYE0vZRxNJeXQVN4x6kFXO
	OVCYasbwX6U9PND8Gi9YK/TTPQ0JCjjOD1g9UTaofI/0n/N2/8oG2haOprQuG3peXaTM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175558-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175558: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b670700ddf5eb1dd958d60eb4f2a51e0636206f9
X-Osstest-Versions-That:
    ovmf=bbd30066e137c036db140b6e58e6e172e2827eb3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Jan 2023 10:54:46 +0000

flight 175558 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175558/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b670700ddf5eb1dd958d60eb4f2a51e0636206f9
baseline version:
 ovmf                 bbd30066e137c036db140b6e58e6e172e2827eb3

Last test of basis   175529  2022-12-30 07:40:56 Z    4 days
Testing same since   175558  2023-01-03 06:41:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Tan, Dun <dun.tan@intel.com>

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
   bbd30066e1..b670700ddf  b670700ddf5eb1dd958d60eb4f2a51e0636206f9 -> xen-tested-master

