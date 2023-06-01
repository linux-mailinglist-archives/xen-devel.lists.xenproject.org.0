Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7A71F5EE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 00:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542775.847038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4qnk-0002MM-Qv; Thu, 01 Jun 2023 22:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542775.847038; Thu, 01 Jun 2023 22:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4qnk-0002Jk-OM; Thu, 01 Jun 2023 22:29:48 +0000
Received: by outflank-mailman (input) for mailman id 542775;
 Thu, 01 Jun 2023 22:29:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4qnj-0002Ja-P1; Thu, 01 Jun 2023 22:29:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4qnj-0006JI-Hr; Thu, 01 Jun 2023 22:29:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4qnj-00018L-AP; Thu, 01 Jun 2023 22:29:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4qnj-00008G-9u; Thu, 01 Jun 2023 22:29:47 +0000
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
	bh=+0YKojVoKfAxWDoxBugQBveb5VAKfZ/GZCs36EObBWI=; b=27bMYDjWICLAE3s7XYzlOLnXEF
	dqZ8CAL8c9OnXmt1k3Y7a0x4yY2jobgAEDM2Q1AJc1T7cNsXAhfFu/RKQPgiuOK74G/3OyoxNKSA9
	x+xvhjYC0ghxttgoRY+zy1nve+UBJ8kk5FbbheNtppDUDIT7d4Yi48u8H52W547sfavk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181091-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181091: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=41abf00bf98e36830974bd669ab7ec3679bd5e67
X-Osstest-Versions-That:
    ovmf=ded1d5414b5a0161de8fcf234b7fb200fb59fb2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Jun 2023 22:29:47 +0000

flight 181091 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181091/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 41abf00bf98e36830974bd669ab7ec3679bd5e67
baseline version:
 ovmf                 ded1d5414b5a0161de8fcf234b7fb200fb59fb2c

Last test of basis   181087  2023-06-01 17:10:49 Z    0 days
Testing same since   181091  2023-06-01 19:43:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>
  Corvin Köhne <corvink@FreeBSD.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Pedro Falcato <pedro.falcato@gmail.com>
  Peter Grehan <grehan@freebsd.org>

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
   ded1d5414b..41abf00bf9  41abf00bf98e36830974bd669ab7ec3679bd5e67 -> xen-tested-master

