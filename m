Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639A62288C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440832.695046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osiQw-0007zG-0N; Wed, 09 Nov 2022 10:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440832.695046; Wed, 09 Nov 2022 10:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osiQv-0007xS-T3; Wed, 09 Nov 2022 10:35:49 +0000
Received: by outflank-mailman (input) for mailman id 440832;
 Wed, 09 Nov 2022 10:35:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osiQu-0007xI-B1; Wed, 09 Nov 2022 10:35:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osiQu-0002Fu-4u; Wed, 09 Nov 2022 10:35:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1osiQt-0006Si-SU; Wed, 09 Nov 2022 10:35:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1osiQt-0002Va-Rz; Wed, 09 Nov 2022 10:35:47 +0000
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
	bh=kS236WWseesSL8pX4gmdFREFGDdPJf9+/SlXL6u3CIw=; b=iMeE1aufsbS+3epYIxn2+v3P4z
	jIIYepSHNNnvbSS3TKkcVkNDyxKEZYzRXyoH2Pgw2QY+wG65OrLbvuKm+HcxNp/8n6S/TBVYp6aKZ
	Fj4Nh4XT4sxbIpqXxr2wl06C0twQV0U3+1r1940sKczVgLkxOM+0OUFYHteH/DwNZ9eE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174681-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174681: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0be81a4d83810cdb018d293bc264f489e7664043
X-Osstest-Versions-That:
    ovmf=6c1a4a376e97800c555dab9ca9d9651a5676d231
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Nov 2022 10:35:47 +0000

flight 174681 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174681/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0be81a4d83810cdb018d293bc264f489e7664043
baseline version:
 ovmf                 6c1a4a376e97800c555dab9ca9d9651a5676d231

Last test of basis   174673  2022-11-08 15:40:34 Z    0 days
Testing same since   174681  2022-11-08 20:43:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Wei6 Xu <wei6.xu@intel.com>

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
   6c1a4a376e..0be81a4d83  0be81a4d83810cdb018d293bc264f489e7664043 -> xen-tested-master

