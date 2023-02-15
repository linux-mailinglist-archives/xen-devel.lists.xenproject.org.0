Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84805697918
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 10:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495785.766211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSECs-0003l4-WD; Wed, 15 Feb 2023 09:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495785.766211; Wed, 15 Feb 2023 09:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSECs-0003jM-TT; Wed, 15 Feb 2023 09:36:06 +0000
Received: by outflank-mailman (input) for mailman id 495785;
 Wed, 15 Feb 2023 09:36:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSECr-0003jC-ND; Wed, 15 Feb 2023 09:36:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSECr-0005Z4-Lw; Wed, 15 Feb 2023 09:36:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSECr-0004eN-CN; Wed, 15 Feb 2023 09:36:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pSECr-0004Ca-Bp; Wed, 15 Feb 2023 09:36:05 +0000
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
	bh=47XZQja9Y/p6WpY0muWi5PJgE36eLitfJqtd8+jh/5M=; b=POcYQceARocIxjzezjUxTrpEfy
	ygj05hP2PRVNDOgTmy9g1CIMKn4aiVu7MOYLXCl6VtNRkpcI34omJiIzSbhE8gP7OQlA6A4osnAYL
	9EnB/hvzn+98YFm5vntok1fAwOVhxrKnLCPG5vuul0z5YQFD5bLcxFHEf3OnSIq/qs/E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177365-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 177365: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=77d6772708541a2ddf093af79816dd1831581388
X-Osstest-Versions-That:
    ovmf=68c1bedbf297b57a336a2edc046f1f9874ba69fa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Feb 2023 09:36:05 +0000

flight 177365 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177365/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 77d6772708541a2ddf093af79816dd1831581388
baseline version:
 ovmf                 68c1bedbf297b57a336a2edc046f1f9874ba69fa

Last test of basis   177356  2023-02-15 06:13:53 Z    0 days
Testing same since   177365  2023-02-15 08:13:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  JunX1 Li <junx1.li@intel.com>
  lijun10x <junx1.li@intel.com>

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
   68c1bedbf2..77d6772708  77d6772708541a2ddf093af79816dd1831581388 -> xen-tested-master

