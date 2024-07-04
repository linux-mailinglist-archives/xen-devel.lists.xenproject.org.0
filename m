Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F9927623
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 14:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753804.1162094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPLgq-0004kI-Sf; Thu, 04 Jul 2024 12:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753804.1162094; Thu, 04 Jul 2024 12:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPLgq-0004hi-Ph; Thu, 04 Jul 2024 12:35:56 +0000
Received: by outflank-mailman (input) for mailman id 753804;
 Thu, 04 Jul 2024 12:35:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPLgp-0004hV-GN; Thu, 04 Jul 2024 12:35:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPLgp-00024p-DQ; Thu, 04 Jul 2024 12:35:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPLgp-0005RS-0T; Thu, 04 Jul 2024 12:35:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPLgo-0005Ve-WE; Thu, 04 Jul 2024 12:35:55 +0000
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
	bh=7ax6cRe10kBGXqo/ZoRjoj/ymN93fvICg9gAlXhI/ko=; b=KN2i+BdpxUGc3YWhG4E/GTUBrH
	sBazCxkEczdjVFQmwqaC6ihYE0SlrzM6lN26suXxqrJLYZBOq4R1J5I/oPpPJHmmWr1uNTAku6pq3
	nENt0rRIJGcNMEsvclDFxrdPaJ+rWuBtuG02whI8PHnS5CZ6QYce+l3vYwd8KvOzVA0Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186652-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186652: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=592725d2291b9844cfd9187111e904c6383e2000
X-Osstest-Versions-That:
    ovmf=ed07a2bb11b358fdece44a760fc193d56f22cfb2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jul 2024 12:35:54 +0000

flight 186652 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186652/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 592725d2291b9844cfd9187111e904c6383e2000
baseline version:
 ovmf                 ed07a2bb11b358fdece44a760fc193d56f22cfb2

Last test of basis   186640  2024-07-03 12:44:49 Z    0 days
Testing same since   186652  2024-07-04 08:13:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joey.vagedes@gmail.com>

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
   ed07a2bb11..592725d229  592725d2291b9844cfd9187111e904c6383e2000 -> xen-tested-master

