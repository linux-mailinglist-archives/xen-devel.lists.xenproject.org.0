Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB076AE157
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507402.780842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXiN-0004CO-Ig; Tue, 07 Mar 2023 13:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507402.780842; Tue, 07 Mar 2023 13:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXiN-0004An-Ep; Tue, 07 Mar 2023 13:50:51 +0000
Received: by outflank-mailman (input) for mailman id 507402;
 Tue, 07 Mar 2023 13:50:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZXiM-0004Ad-Pn; Tue, 07 Mar 2023 13:50:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZXiM-0008Dy-OD; Tue, 07 Mar 2023 13:50:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZXiM-00073n-El; Tue, 07 Mar 2023 13:50:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pZXiM-0003RK-EI; Tue, 07 Mar 2023 13:50:50 +0000
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
	bh=wxwDw5Xu+8rSrIfHvSGl4N+hR7iSnVtFn5DzXV+k0UA=; b=jrQ7sGVaFgestys2x7pX539qI8
	JRPhRK2UddlxdmDE1aeZe3IemKmJKMZgkSyA7JSLKEeF8Cz7LRvUFlrHu8hLh2orNvXlhVMPrQloT
	jGrgXzQhS3o/YQ0eZCGNNgmxUO/HNmP+jbBw2aGORm2aMIrkQeZUonhMN3EpB/ClgENI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179496-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179496: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=aa1cd447b346e8cc8141df2fe2d321b032c08acb
X-Osstest-Versions-That:
    ovmf=c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Mar 2023 13:50:50 +0000

flight 179496 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179496/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 aa1cd447b346e8cc8141df2fe2d321b032c08acb
baseline version:
 ovmf                 c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6

Last test of basis   179487  2023-03-07 09:43:43 Z    0 days
Testing same since   179496  2023-03-07 11:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   c7c2599759..aa1cd447b3  aa1cd447b346e8cc8141df2fe2d321b032c08acb -> xen-tested-master

