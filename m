Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7739F5EB9C6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 07:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412244.655476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od3HJ-0004u7-C3; Tue, 27 Sep 2022 05:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412244.655476; Tue, 27 Sep 2022 05:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od3HJ-0004rl-93; Tue, 27 Sep 2022 05:37:09 +0000
Received: by outflank-mailman (input) for mailman id 412244;
 Tue, 27 Sep 2022 05:37:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1od3HH-0004qP-Af; Tue, 27 Sep 2022 05:37:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1od3HH-0001zX-8q; Tue, 27 Sep 2022 05:37:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1od3HF-00081M-Ss; Tue, 27 Sep 2022 05:37:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1od3HF-0001DS-SN; Tue, 27 Sep 2022 05:37:05 +0000
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
	bh=sYy9ZupRSksp9zerEAInUKyrh5sphGtDcW0A32mGWKs=; b=PDqwnS9brL9HCE7Rws+Ba0Bkq2
	BSA0vpEBdLkTH29N8SuLJvQXgI6vK2dyJ6/7xTnRIXHF/SLKBCtv8HVTNRGSr9TTNhNJMlwgTLYnJ
	N9JyIiHmNs44gdW5XhvdpvZy7G1G5/A80JGqZww46VuLHGP4WM9nKXGQ0qOLRRenPiyM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173323-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173323: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b3dd9cb836e2aed68198aa79a1ca6afdb25adf80
X-Osstest-Versions-That:
    ovmf=96f3efbd991db83c608909c1c861a77fe26982f1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Sep 2022 05:37:05 +0000

flight 173323 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173323/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b3dd9cb836e2aed68198aa79a1ca6afdb25adf80
baseline version:
 ovmf                 96f3efbd991db83c608909c1c861a77fe26982f1

Last test of basis   173318  2022-09-26 20:40:22 Z    0 days
Testing same since   173323  2022-09-27 03:13:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  jdzhang <jdzhang@kunluntech.com.cn>

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
   96f3efbd99..b3dd9cb836  b3dd9cb836e2aed68198aa79a1ca6afdb25adf80 -> xen-tested-master

