Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0794B487
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 03:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773687.1184133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbrlB-0006kh-Ce; Thu, 08 Aug 2024 01:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773687.1184133; Thu, 08 Aug 2024 01:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbrlB-0006iZ-8b; Thu, 08 Aug 2024 01:16:09 +0000
Received: by outflank-mailman (input) for mailman id 773687;
 Thu, 08 Aug 2024 01:16:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbrlA-0006iN-Eg; Thu, 08 Aug 2024 01:16:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbrlA-00033k-3v; Thu, 08 Aug 2024 01:16:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sbrl9-0006to-Oc; Thu, 08 Aug 2024 01:16:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sbrl9-0005aT-O9; Thu, 08 Aug 2024 01:16:07 +0000
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
	bh=/XEPsRw6U+lmTDn8l0/Al+BUoQyQLXjkvNvv85INuzk=; b=h4KaVbkFpdATvnS4ccyexDj/IR
	bBF0uQaQDdvK1zrefN2fXu0ptCWcdGQLObR4UKg4Cv/icP6+700et4Gu6JuJ1iFyID8zPJYFwTXF3
	FgxEXYv4o4T2EdjR1hz2YivJ3e9X9nmOg1iUcU1lWCSErhIXf0/k7BJmqWaUfHWTc97Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187185-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187185: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ab6ad2fbdbaad1eb3a766973d6f587685d784d48
X-Osstest-Versions-That:
    ovmf=976113774320e5f18bb5bd6f21dd062c1d74f3d4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Aug 2024 01:16:07 +0000

flight 187185 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187185/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ab6ad2fbdbaad1eb3a766973d6f587685d784d48
baseline version:
 ovmf                 976113774320e5f18bb5bd6f21dd062c1d74f3d4

Last test of basis   187177  2024-08-07 03:43:22 Z    0 days
Testing same since   187185  2024-08-07 23:13:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Saloni Kasbekar <saloni.kasbekar@intel.com>

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
   9761137743..ab6ad2fbdb  ab6ad2fbdbaad1eb3a766973d6f587685d784d48 -> xen-tested-master

