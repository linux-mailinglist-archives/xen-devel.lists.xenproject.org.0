Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D17848B19
	for <lists+xen-devel@lfdr.de>; Sun,  4 Feb 2024 05:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675497.1050924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWUW7-0007HO-Mx; Sun, 04 Feb 2024 04:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675497.1050924; Sun, 04 Feb 2024 04:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWUW7-0007F8-Ih; Sun, 04 Feb 2024 04:54:07 +0000
Received: by outflank-mailman (input) for mailman id 675497;
 Sun, 04 Feb 2024 04:54:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWUW5-0007Ey-CJ; Sun, 04 Feb 2024 04:54:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWUW5-0006OT-Au; Sun, 04 Feb 2024 04:54:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWUW1-0000Tu-U9; Sun, 04 Feb 2024 04:54:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rWUW1-0000BE-Qz; Sun, 04 Feb 2024 04:54:01 +0000
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
	bh=ECLmxQTO6r8M7BZYAFkPA65ltEgBpiLD9M+NPR2wL5s=; b=VFGQ7c8dUvaVcpxW3RTnCrw1+t
	vO6np2+c69S5nWpWY7xuq9Xh1gOE3Us14Aipu7Y32tbo+B/LRnwjb5KlFkn43RrjpOStVwOo8r3/0
	2wiA2GKBK/FsXD/NUTkXbTMi6Y1LN84Evp+e5R3HSfYcdkVRnNQRnJaGIXlAuWjrEezs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184583-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184583: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=141dcaed6cc930d83a4f95cb51ebc22f51fcc32c
X-Osstest-Versions-That:
    ovmf=cd6f2152237713d12723a55aa258c7ae91577dff
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Feb 2024 04:54:01 +0000

flight 184583 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184583/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 141dcaed6cc930d83a4f95cb51ebc22f51fcc32c
baseline version:
 ovmf                 cd6f2152237713d12723a55aa258c7ae91577dff

Last test of basis   184580  2024-02-03 20:14:33 Z    0 days
Testing same since   184583  2024-02-04 03:11:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dhaval Sharma <dhaval@rivosinc.com>

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
   cd6f215223..141dcaed6c  141dcaed6cc930d83a4f95cb51ebc22f51fcc32c -> xen-tested-master

