Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BA9720032
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 13:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543090.847725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q52kT-0005ZF-NH; Fri, 02 Jun 2023 11:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543090.847725; Fri, 02 Jun 2023 11:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q52kT-0005XY-Jg; Fri, 02 Jun 2023 11:15:13 +0000
Received: by outflank-mailman (input) for mailman id 543090;
 Fri, 02 Jun 2023 11:15:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q52kR-0005XO-UY; Fri, 02 Jun 2023 11:15:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q52kR-0000wx-O1; Fri, 02 Jun 2023 11:15:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q52kR-00046x-DP; Fri, 02 Jun 2023 11:15:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q52kR-000485-Cz; Fri, 02 Jun 2023 11:15:11 +0000
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
	bh=2qvQUn0bz/l15kjYgTcBWuPnmsHIN3ibWov+2aMbfHU=; b=3rxnmnSuj9k3hvtnDLcolFWo/O
	qwoW06dcG3dvBIwD3jK300o5LxaFA/yFsthJnQbE8y4L9K5qxHHdjZrHPglT3BBaa3lS2gAU3odez
	ZE5K0FHz7NLmlu8EX0m8vdGrKZDaibz3e/QT1tRDnARicc/vCPknkjB92OriWsd12dMs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181106-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181106: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=78262899d225eb30e5fbe6a88e85a4b1d8c04a61
X-Osstest-Versions-That:
    ovmf=41abf00bf98e36830974bd669ab7ec3679bd5e67
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Jun 2023 11:15:11 +0000

flight 181106 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181106/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 78262899d225eb30e5fbe6a88e85a4b1d8c04a61
baseline version:
 ovmf                 41abf00bf98e36830974bd669ab7ec3679bd5e67

Last test of basis   181091  2023-06-01 19:43:55 Z    0 days
Testing same since   181106  2023-06-02 07:40:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Thejaswani Putta <tputta@nvidia.com>

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
   41abf00bf9..78262899d2  78262899d225eb30e5fbe6a88e85a4b1d8c04a61 -> xen-tested-master

