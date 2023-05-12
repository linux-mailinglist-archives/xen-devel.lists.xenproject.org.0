Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45A7000A9
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 08:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533699.830561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMP0-0000Oz-Uj; Fri, 12 May 2023 06:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533699.830561; Fri, 12 May 2023 06:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMP0-0000ND-S4; Fri, 12 May 2023 06:37:18 +0000
Received: by outflank-mailman (input) for mailman id 533699;
 Fri, 12 May 2023 06:37:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxMOz-0000N3-28; Fri, 12 May 2023 06:37:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxMOy-0002y8-UR; Fri, 12 May 2023 06:37:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxMOy-0006rr-Im; Fri, 12 May 2023 06:37:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pxMOy-0007Qz-IL; Fri, 12 May 2023 06:37:16 +0000
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
	bh=A4eZq4wtQ0DBA405N9XT4fkODSWQleHXuQiCFL5i3cI=; b=t/3zslWnHF6hF+I13Fg+OqMz8W
	tou4zZREAQZKs8kN/dNoKyysUsXjvJIifqFW7P+aH0QuRCoEazhl2YNEL/TwnzzFfjokJR3b8SqXf
	WqFIXDfin2gSnoIQdY0Y1JRDbkB+X0ModEx8GI4V2bE7qnt35CzPt6aiASHpQz1KLk/4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180627-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180627: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c08a3a96fd19ac8adc75f00d373b4a1606b26c00
X-Osstest-Versions-That:
    ovmf=0a0e60caf20ab621ee9c1fc66b82b739158c05cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 May 2023 06:37:16 +0000

flight 180627 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180627/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c08a3a96fd19ac8adc75f00d373b4a1606b26c00
baseline version:
 ovmf                 0a0e60caf20ab621ee9c1fc66b82b739158c05cf

Last test of basis   180617  2023-05-11 09:10:41 Z    0 days
Testing same since   180627  2023-05-12 04:12:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tinh Nguyen <tinhnguyen@os.amperecomputing.com>

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
   0a0e60caf2..c08a3a96fd  c08a3a96fd19ac8adc75f00d373b4a1606b26c00 -> xen-tested-master

