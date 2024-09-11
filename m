Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C72975DB8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 01:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796891.1206597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soWpl-0005hQ-DZ; Wed, 11 Sep 2024 23:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796891.1206597; Wed, 11 Sep 2024 23:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soWpl-0005f9-A1; Wed, 11 Sep 2024 23:33:13 +0000
Received: by outflank-mailman (input) for mailman id 796891;
 Wed, 11 Sep 2024 23:33:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soWpj-0005ez-8W; Wed, 11 Sep 2024 23:33:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soWpj-0006GI-6O; Wed, 11 Sep 2024 23:33:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soWpi-0005Un-Se; Wed, 11 Sep 2024 23:33:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soWpi-0004bg-SD; Wed, 11 Sep 2024 23:33:10 +0000
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
	bh=o2Yht2QTo5A9EaTjknYGEK9lFy88rWVVqWwun2eIJYQ=; b=BXQ26X1qpJiMf33Gr09Gg61tnu
	UnOMxDkKU24hXddsOnulIWegB2KfRt1CbpAnQ1PQddq62SKV6jUjH4wjO7hscN//+Y4RW53bkX4cw
	G4ZlUQ8mLDRzSl480107oPH07IhipcsqQfsJ04VeGFO/W1yCrEICXLDFBLJ/LoWOWkwg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187664-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187664: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=03c8ec6ce29e47abca2b598bba9a05ddd87afc17
X-Osstest-Versions-That:
    ovmf=f2557032d61e7a6bf1eb76eca5e836e7de991b8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Sep 2024 23:33:10 +0000

flight 187664 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187664/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 03c8ec6ce29e47abca2b598bba9a05ddd87afc17
baseline version:
 ovmf                 f2557032d61e7a6bf1eb76eca5e836e7de991b8a

Last test of basis   187662  2024-09-11 19:41:29 Z    0 days
Testing same since   187664  2024-09-11 21:41:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason1 Lin <jason1.lin@intel.com>

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
   f2557032d6..03c8ec6ce2  03c8ec6ce29e47abca2b598bba9a05ddd87afc17 -> xen-tested-master

