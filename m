Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15C799257
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 00:38:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598223.932840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qek6U-0005RQ-Am; Fri, 08 Sep 2023 22:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598223.932840; Fri, 08 Sep 2023 22:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qek6U-0005OY-76; Fri, 08 Sep 2023 22:37:30 +0000
Received: by outflank-mailman (input) for mailman id 598223;
 Fri, 08 Sep 2023 22:37:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qek6T-0005ON-2Y; Fri, 08 Sep 2023 22:37:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qek6S-0000KY-Tq; Fri, 08 Sep 2023 22:37:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qek6S-0004dW-K3; Fri, 08 Sep 2023 22:37:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qek6S-0003hS-Jd; Fri, 08 Sep 2023 22:37:28 +0000
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
	bh=/mRAFYnSP8Yzlle9SGJg5drbXMpxeY1c6F1ApGUiASg=; b=X46ear1RWyq2l2xlUJxF3g1/n2
	3RnURL9ViydbW7qcP+2Yg+HDiv31H5cwFTVi0bcHdXAju7KGFyYDsB1YL2n9txYfmL+JybNPQtKTW
	pnd37DIcQoDnbVp/x9s2c9dtak3Ak97cAxDCoqNefHZ/zEcyfg66DME5cOPJ1WeNep9M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182779-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182779: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d4ae5df71190148c902942c3462245e97ed2fcc8
X-Osstest-Versions-That:
    ovmf=28a74d7ab22a33e3915eb747879d58797718f6f2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Sep 2023 22:37:28 +0000

flight 182779 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182779/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d4ae5df71190148c902942c3462245e97ed2fcc8
baseline version:
 ovmf                 28a74d7ab22a33e3915eb747879d58797718f6f2

Last test of basis   182772  2023-09-08 18:19:00 Z    0 days
Testing same since   182779  2023-09-08 20:44:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Avinash Bhargava <avinash.bhargava@intel.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   28a74d7ab2..d4ae5df711  d4ae5df71190148c902942c3462245e97ed2fcc8 -> xen-tested-master

