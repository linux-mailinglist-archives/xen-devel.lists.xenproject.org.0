Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465247E1957
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 05:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627738.978563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzqxT-0004as-Pg; Mon, 06 Nov 2023 04:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627738.978563; Mon, 06 Nov 2023 04:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzqxT-0004Xw-Mv; Mon, 06 Nov 2023 04:11:27 +0000
Received: by outflank-mailman (input) for mailman id 627738;
 Mon, 06 Nov 2023 04:11:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzqxS-0004Xm-Mh; Mon, 06 Nov 2023 04:11:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzqxS-0004av-A8; Mon, 06 Nov 2023 04:11:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qzqxR-0005dk-Un; Mon, 06 Nov 2023 04:11:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qzqxR-0008SO-UL; Mon, 06 Nov 2023 04:11:25 +0000
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
	bh=UWrDISoMiGHPalUjyHdEU60L/ohJTvyfnQL+/kacJnk=; b=jPIx9ToUCtsMd/Q87Ls1oSD92B
	I8oefPA8msUNY8vVhJPmcBZVPBUvpQuLmbrU/ZHZsxPRgEJ/3QWnt6Rpg9vvVGW5lITzHY5IZNEUu
	rHERhv/v6wdosOcLDMeY322sgIllArZpFGKU+JlusVi0oMIo6LRkf2QBVpZ+anwTh+G4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183689-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183689: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=778134e491a9f53abc903f6fa730d8389f27697d
X-Osstest-Versions-That:
    ovmf=038499a2681c1adab5a508da34621f74c52bc05c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Nov 2023 04:11:25 +0000

flight 183689 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183689/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 778134e491a9f53abc903f6fa730d8389f27697d
baseline version:
 ovmf                 038499a2681c1adab5a508da34621f74c52bc05c

Last test of basis   183685  2023-11-04 23:42:55 Z    1 days
Testing same since   183689  2023-11-06 01:42:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   038499a268..778134e491  778134e491a9f53abc903f6fa730d8389f27697d -> xen-tested-master

