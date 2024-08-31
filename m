Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E735B9671A4
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 14:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787205.1196807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skNcv-0005LB-I3; Sat, 31 Aug 2024 12:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787205.1196807; Sat, 31 Aug 2024 12:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skNcv-0005Jx-F1; Sat, 31 Aug 2024 12:54:49 +0000
Received: by outflank-mailman (input) for mailman id 787205;
 Sat, 31 Aug 2024 12:54:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skNcu-0005Ji-Qr; Sat, 31 Aug 2024 12:54:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skNcu-0000qG-PJ; Sat, 31 Aug 2024 12:54:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skNcu-0005Re-6d; Sat, 31 Aug 2024 12:54:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skNcu-00061J-5y; Sat, 31 Aug 2024 12:54:48 +0000
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
	bh=lprG76jQLnMIbVSryTeZAKECecfg+y7zur4wcSOiRFA=; b=We1GoWaCSP2BqC42RhhnIxKrUN
	2a7kGEdXio3m0cLLPLDwUgqaJ7XIaI9pQfYRmcZzdxjKTjBkoQks5p14AA2Rpv+nV6GBC5l6bodBg
	ZbJ3TAIoZGPPSMb1ItM31CQVBG8fdFl65O5SAQIm4j4LRqXYT0kYNysO7JMAnXFkh6kI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187436-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187436: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=96b90e150c2f107c64a827e82451b642a42df686
X-Osstest-Versions-That:
    ovmf=baecba68a32b26778e902faed64f2e701e584531
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Aug 2024 12:54:48 +0000

flight 187436 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187436/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 96b90e150c2f107c64a827e82451b642a42df686
baseline version:
 ovmf                 baecba68a32b26778e902faed64f2e701e584531

Last test of basis   187435  2024-08-31 07:41:29 Z    0 days
Testing same since   187436  2024-08-31 10:45:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Matthew Carlson <macarl@microsoft.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   baecba68a3..96b90e150c  96b90e150c2f107c64a827e82451b642a42df686 -> xen-tested-master

