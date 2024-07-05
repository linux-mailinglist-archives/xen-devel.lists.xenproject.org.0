Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D2928706
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 12:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754210.1162524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPgQn-0002CG-4H; Fri, 05 Jul 2024 10:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754210.1162524; Fri, 05 Jul 2024 10:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPgQm-0002AN-Vd; Fri, 05 Jul 2024 10:44:44 +0000
Received: by outflank-mailman (input) for mailman id 754210;
 Fri, 05 Jul 2024 10:44:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPgQl-0002AB-Hw; Fri, 05 Jul 2024 10:44:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPgQl-0006CG-Fk; Fri, 05 Jul 2024 10:44:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPgQl-00080v-74; Fri, 05 Jul 2024 10:44:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPgQl-0005cy-6d; Fri, 05 Jul 2024 10:44:43 +0000
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
	bh=kry5vOeO0fyhc/szHjc48oM7x6+TJrVURNV2xxgtpRo=; b=gMaeOsnEfJIgeOSgEyMtFWvd4Y
	1RHt/cfADlzhYvIa27ypDGq5JGFzymF65ATwjbMUq7mYhu/EZCwXu2ntAjspAKWCOKq3qQhfaF7Mn
	rtf7bmApgwK9Za6RTPRsGFSpS3xDuJTYdRQ3UvPlYwXcLLIOgqAwCyawAWEL68qBTE7Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186694-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186694: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bef0d333dc4fccdfc75e4be31e067b467a9a4093
X-Osstest-Versions-That:
    ovmf=9389b9a208cc5c7d9b055ea06d92cc4903f705ee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jul 2024 10:44:43 +0000

flight 186694 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186694/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bef0d333dc4fccdfc75e4be31e067b467a9a4093
baseline version:
 ovmf                 9389b9a208cc5c7d9b055ea06d92cc4903f705ee

Last test of basis   186678  2024-07-05 01:11:15 Z    0 days
Testing same since   186694  2024-07-05 08:41:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   9389b9a208..bef0d333dc  bef0d333dc4fccdfc75e4be31e067b467a9a4093 -> xen-tested-master

