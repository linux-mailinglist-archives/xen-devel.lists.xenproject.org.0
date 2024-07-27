Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE893DF97
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 15:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765940.1176541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXhkM-0004Jp-Du; Sat, 27 Jul 2024 13:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765940.1176541; Sat, 27 Jul 2024 13:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXhkM-0004Gf-A0; Sat, 27 Jul 2024 13:46:06 +0000
Received: by outflank-mailman (input) for mailman id 765940;
 Sat, 27 Jul 2024 13:46:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXhkK-0004GF-Us; Sat, 27 Jul 2024 13:46:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXhkK-0003Hw-4d; Sat, 27 Jul 2024 13:46:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sXhkJ-0001Px-Mh; Sat, 27 Jul 2024 13:46:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sXhkJ-00023d-M5; Sat, 27 Jul 2024 13:46:03 +0000
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
	bh=VrIoby6qkFtf8b+eCXNszE2O2DFWybKTxrz+1mRuys8=; b=Yff5drEqX3DWNT/njOLXJTyfNQ
	YfWH8ayCarwFHv6aL168sSilBLxGIH9oQNlrJEpoq2MBUy7mM8001i63mCbx5AuX3VB4gD5hSJ+i5
	AMWriXw38lzlCiR6YGcQW/dJpEoDulEvAcSKedaPhx6suLUAuJvgMeva+F2L476BInB0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187027-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187027: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=418b8176b8d7d99f4303d92f87130f1b09989b7a
X-Osstest-Versions-That:
    ovmf=0343e7523387df6204c3219211d798683d3fd200
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Jul 2024 13:46:03 +0000

flight 187027 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187027/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 418b8176b8d7d99f4303d92f87130f1b09989b7a
baseline version:
 ovmf                 0343e7523387df6204c3219211d798683d3fd200

Last test of basis   187024  2024-07-27 06:15:13 Z    0 days
Testing same since   187027  2024-07-27 12:15:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   0343e75233..418b8176b8  418b8176b8d7d99f4303d92f87130f1b09989b7a -> xen-tested-master

