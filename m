Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4478A71B1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 18:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707054.1104532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwm1a-0007n9-TQ; Tue, 16 Apr 2024 16:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707054.1104532; Tue, 16 Apr 2024 16:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwm1a-0007kt-Qa; Tue, 16 Apr 2024 16:51:14 +0000
Received: by outflank-mailman (input) for mailman id 707054;
 Tue, 16 Apr 2024 16:51:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwm1Z-0007kj-2c; Tue, 16 Apr 2024 16:51:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwm1Y-0007of-LZ; Tue, 16 Apr 2024 16:51:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwm1Y-0008C4-CE; Tue, 16 Apr 2024 16:51:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwm1Y-0005D7-Bj; Tue, 16 Apr 2024 16:51:12 +0000
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
	bh=S78y+4nwLeGxWxsK/K7v7SeYfIMsRU9ig3qnvYtUx88=; b=CH5p1jdAm5D3ZcJUd7tPxZaUuv
	rtR0hEp2zEaCr72ebF3lKrKclAHaOI48Du/ls7PI/S5mMFZjEPcwQl4vA1MF0vQjjuXIZDTKelROS
	cemTjLq1SsJuOPFnSk0Lp74Icksl1xIAx3Z6DzEOdsPLlI+1Nle27GQTNx9/Vl5jMwyA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185671-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185671: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fcfdbe29874320e9f876baa7afebc3fca8f4a7df
X-Osstest-Versions-That:
    ovmf=b6cd5ddce9ade43e4215836f12b43ebbb90eecf2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Apr 2024 16:51:12 +0000

flight 185671 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185671/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fcfdbe29874320e9f876baa7afebc3fca8f4a7df
baseline version:
 ovmf                 b6cd5ddce9ade43e4215836f12b43ebbb90eecf2

Last test of basis   185658  2024-04-16 09:41:11 Z    0 days
Testing same since   185671  2024-04-16 14:44:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liqi Liu <liqi.liu@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   b6cd5ddce9..fcfdbe2987  fcfdbe29874320e9f876baa7afebc3fca8f4a7df -> xen-tested-master

