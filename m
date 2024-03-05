Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9804F871D35
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 12:18:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688760.1073313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhSo8-0007w3-G7; Tue, 05 Mar 2024 11:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688760.1073313; Tue, 05 Mar 2024 11:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhSo8-0007tt-DO; Tue, 05 Mar 2024 11:18:04 +0000
Received: by outflank-mailman (input) for mailman id 688760;
 Tue, 05 Mar 2024 11:18:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhSo6-0007th-Vh; Tue, 05 Mar 2024 11:18:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhSo6-0001pn-Qy; Tue, 05 Mar 2024 11:18:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rhSo6-000430-I3; Tue, 05 Mar 2024 11:18:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rhSo6-0004dG-Hd; Tue, 05 Mar 2024 11:18:02 +0000
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
	bh=IU1D8t5ud6zSlliRHHPLt/fzO0kwezEydSHyOPNb/JI=; b=TXLJCRsyw19SDRg3efmfY9hzVA
	jVrZiupU3M5FHS5gWskKkUPYPMNOOh3GdbGNkov+CvSYl/3/ijIWZ+MMPR8/Rfzmpuw6NdOukhcyI
	kfo5loTqqLd0Hr2jtD/zLIjQKh7sIQyHcVDE2/Uy8Vcb+UtvkfkAx8dZ2stBcauFZOWk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184908-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184908: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2a0d4a2641a706d6b964dea0c95b1e0362194f57
X-Osstest-Versions-That:
    ovmf=918288ab5a7c3abe9c58d576ccc0ae32e2c7dea0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Mar 2024 11:18:02 +0000

flight 184908 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184908/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2a0d4a2641a706d6b964dea0c95b1e0362194f57
baseline version:
 ovmf                 918288ab5a7c3abe9c58d576ccc0ae32e2c7dea0

Last test of basis   184903  2024-03-04 18:41:12 Z    0 days
Testing same since   184908  2024-03-05 09:12:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Lee, Chun-Yi" <jlee@suse.com>
  Lee, Chun-Yi <joeyli.kernel@gmail.com>

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
   918288ab5a..2a0d4a2641  2a0d4a2641a706d6b964dea0c95b1e0362194f57 -> xen-tested-master

