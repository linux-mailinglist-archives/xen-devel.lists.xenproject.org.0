Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D87E324E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 01:40:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628522.980087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0A81-0000wl-Tx; Tue, 07 Nov 2023 00:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628522.980087; Tue, 07 Nov 2023 00:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0A81-0000uj-RT; Tue, 07 Nov 2023 00:39:37 +0000
Received: by outflank-mailman (input) for mailman id 628522;
 Tue, 07 Nov 2023 00:39:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0A80-0000uZ-Pi; Tue, 07 Nov 2023 00:39:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0A80-0002ES-ES; Tue, 07 Nov 2023 00:39:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0A80-0000W5-1n; Tue, 07 Nov 2023 00:39:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r0A80-0002xC-1D; Tue, 07 Nov 2023 00:39:36 +0000
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
	bh=EABvf1WVof7WH3yHCjQ40KdDco3AJH/8JwDYFL1KqsQ=; b=u1SWNwAuaRlmg/8c8Mz/IVLAzI
	Npqh2gWPbTO0VxM9L/Vz3u9iC81/Q9Ufu685APbv2cHlc2E1IthFWmZLCzk3zhxsg6Olwf7tk8/VV
	mjEsV6GYzEikDfLY5nfIOL+UQfbg+GIoXys+NptApgqmJIe8Mjh3SanfHToo5bsQp6V4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183696-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183696: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ae02d487a3a4f198e37ca5029ae04abd8976076d
X-Osstest-Versions-That:
    ovmf=778134e491a9f53abc903f6fa730d8389f27697d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Nov 2023 00:39:36 +0000

flight 183696 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183696/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ae02d487a3a4f198e37ca5029ae04abd8976076d
baseline version:
 ovmf                 778134e491a9f53abc903f6fa730d8389f27697d

Last test of basis   183689  2023-11-06 01:42:37 Z    0 days
Testing same since   183696  2023-11-06 20:46:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Rebecca Cran <rebecca@bsdio.com>

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
   778134e491..ae02d487a3  ae02d487a3a4f198e37ca5029ae04abd8976076d -> xen-tested-master

