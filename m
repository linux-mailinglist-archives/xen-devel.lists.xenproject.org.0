Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF7498FC80
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 05:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809949.1222536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swYjH-0005CU-3U; Fri, 04 Oct 2024 03:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809949.1222536; Fri, 04 Oct 2024 03:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swYjH-0005AA-00; Fri, 04 Oct 2024 03:11:43 +0000
Received: by outflank-mailman (input) for mailman id 809949;
 Fri, 04 Oct 2024 03:11:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swYjF-0005A0-On; Fri, 04 Oct 2024 03:11:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swYjF-0001dz-Kj; Fri, 04 Oct 2024 03:11:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swYjF-0003w1-AN; Fri, 04 Oct 2024 03:11:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swYjF-0004ZK-9P; Fri, 04 Oct 2024 03:11:41 +0000
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
	bh=Qjh0+kn/JtRZ7ZolQiLClcbQV0nboA9eMhNP92sNGmo=; b=DHUsg0s7FuBMHPOpa22P+OyKeb
	SjvK/3abrlNAVqxszklgNHKkjnzZEtw42n4mAam91zBjewUB6ZjGJBe433Qan96eb12ovbWjhD4uE
	mdfEPfA0uPXZDCTDdg6/JFPLPHnpyRFQwNDHxIhJF5OGTcBLKMBNZ6F68LGhVf1VfFJk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187960-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187960: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=71239406652f78675499f2fbe937de03c53129cb
X-Osstest-Versions-That:
    ovmf=2fdc39d09d49a57e8dc87022b1dedd958f8c8d6a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Oct 2024 03:11:41 +0000

flight 187960 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187960/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 71239406652f78675499f2fbe937de03c53129cb
baseline version:
 ovmf                 2fdc39d09d49a57e8dc87022b1dedd958f8c8d6a

Last test of basis   187957  2024-10-03 20:41:33 Z    0 days
Testing same since   187960  2024-10-04 01:11:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Oliver Smith-Denny <osde@microsoft.com>

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
   2fdc39d09d..7123940665  71239406652f78675499f2fbe937de03c53129cb -> xen-tested-master

