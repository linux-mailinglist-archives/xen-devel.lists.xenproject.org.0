Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E05837AA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 05:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376564.609434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGuQQ-0003Cj-JQ; Thu, 28 Jul 2022 03:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376564.609434; Thu, 28 Jul 2022 03:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGuQQ-0003Av-GE; Thu, 28 Jul 2022 03:43:02 +0000
Received: by outflank-mailman (input) for mailman id 376564;
 Thu, 28 Jul 2022 03:43:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGuQP-0003Al-Nk; Thu, 28 Jul 2022 03:43:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGuQP-00060w-LB; Thu, 28 Jul 2022 03:43:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oGuQO-0003GE-VU; Thu, 28 Jul 2022 03:43:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oGuQO-0004dk-Un; Thu, 28 Jul 2022 03:43:00 +0000
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
	bh=38MWIl5LtrUnuu+WPAk3cMvlZ38wmbKxLTgM25JRRoc=; b=Bs605gwA9/pe+KR5h920mFWW/a
	EiqAGj2TxqjbBx7sIvep7BpQtssshIg9/A2wxM9rjbN9Jvaruqragizlir1+hKouY5YLatXeHJwrf
	14p11vvJ2JmFAx8XfG/W5Pqtf/ruCVr5cqATeTyvfIEEVhe4OuI62cDtHfr6r4q/afWc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171892-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171892: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1774a44ad91d01294bace32b0060ce26da2f0140
X-Osstest-Versions-That:
    ovmf=f26b70cb9f1367ceb25190ba2777631ee42c69fe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 Jul 2022 03:43:00 +0000

flight 171892 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171892/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1774a44ad91d01294bace32b0060ce26da2f0140
baseline version:
 ovmf                 f26b70cb9f1367ceb25190ba2777631ee42c69fe

Last test of basis   171889  2022-07-27 21:13:18 Z    0 days
Testing same since   171892  2022-07-28 00:43:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
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
   f26b70cb9f..1774a44ad9  1774a44ad91d01294bace32b0060ce26da2f0140 -> xen-tested-master

