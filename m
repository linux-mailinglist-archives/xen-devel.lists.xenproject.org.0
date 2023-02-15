Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C11697F19
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496025.766536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJLf-0001x7-Mb; Wed, 15 Feb 2023 15:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496025.766536; Wed, 15 Feb 2023 15:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJLf-0001vN-JO; Wed, 15 Feb 2023 15:05:31 +0000
Received: by outflank-mailman (input) for mailman id 496025;
 Wed, 15 Feb 2023 15:05:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSJLd-0001vB-SM; Wed, 15 Feb 2023 15:05:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSJLd-0004pd-Pi; Wed, 15 Feb 2023 15:05:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pSJLd-0001vu-GQ; Wed, 15 Feb 2023 15:05:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pSJLd-0001aA-EZ; Wed, 15 Feb 2023 15:05:29 +0000
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
	bh=GYf+jPL6Ip+IgmyKRinkuPl9fQ73LPATASMl9AUKV1U=; b=Q2w/ZDWbbtYayp3BJV0Wg7NtFN
	+rjhe4kkKcbj/GQ39VbZ6uiqCk9NxQGyOfzi/G6E1at9E+OhggkFExMDPAJg5RtGQYEUA2e3r2Xan
	qGarrdv6bXjCG+acpeW+/13UoIAjurqadDNx38zdaTbv6czkpXjCT2h4qFRiSQTS5Iqk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-177386-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 177386: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=38da9606f77842cdcdc231210c0369a6180c51a0
X-Osstest-Versions-That:
    ovmf=77d6772708541a2ddf093af79816dd1831581388
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Feb 2023 15:05:29 +0000

flight 177386 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/177386/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 38da9606f77842cdcdc231210c0369a6180c51a0
baseline version:
 ovmf                 77d6772708541a2ddf093af79816dd1831581388

Last test of basis   177365  2023-02-15 08:13:38 Z    0 days
Testing same since   177386  2023-02-15 12:42:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Robert Phelps <robert@ami.com>

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
   77d6772708..38da9606f7  38da9606f77842cdcdc231210c0369a6180c51a0 -> xen-tested-master

