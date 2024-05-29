Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428D8D2AC7
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 04:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731346.1136772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC91A-00080I-G4; Wed, 29 May 2024 02:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731346.1136772; Wed, 29 May 2024 02:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC91A-0007xT-Cf; Wed, 29 May 2024 02:26:20 +0000
Received: by outflank-mailman (input) for mailman id 731346;
 Wed, 29 May 2024 02:26:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sC918-0007xJ-Tu; Wed, 29 May 2024 02:26:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sC918-0003I3-SS; Wed, 29 May 2024 02:26:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sC918-0002rk-Eu; Wed, 29 May 2024 02:26:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sC918-0007CW-EM; Wed, 29 May 2024 02:26:18 +0000
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
	bh=QTzI2klCqMStrjEUnT17UZET3SAGn8im0nMDnHBblK0=; b=txLEq/CkyfOZR3KGKehfN8oWNG
	BS5OQUzUg1zfac9FPhElhjkbzNbEnjeropJ/ZFaDvTYy3T5JTXc9+6EqIZUo6bpRwEBNdw7RH1QLX
	kLX3raANF9YUSnQAkXtJusLivGim4rHPz5Yro9GnIMAluSpBq3NRrSAukCV5Ub5DCQ7s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186178-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186178: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=55f8bddade205c9cbe3583d5d31d0048cdf26ed4
X-Osstest-Versions-That:
    ovmf=0e3189d406684e44608e01c93f7e2d53fa07b40a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 May 2024 02:26:18 +0000

flight 186178 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186178/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 55f8bddade205c9cbe3583d5d31d0048cdf26ed4
baseline version:
 ovmf                 0e3189d406684e44608e01c93f7e2d53fa07b40a

Last test of basis   186176  2024-05-28 20:43:05 Z    0 days
Testing same since   186178  2024-05-29 00:41:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   0e3189d406..55f8bddade  55f8bddade205c9cbe3583d5d31d0048cdf26ed4 -> xen-tested-master

