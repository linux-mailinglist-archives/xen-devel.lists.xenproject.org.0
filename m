Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C18FA814
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 04:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735083.1141230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEJWz-0001XL-31; Tue, 04 Jun 2024 02:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735083.1141230; Tue, 04 Jun 2024 02:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEJWy-0001UQ-WB; Tue, 04 Jun 2024 02:04:08 +0000
Received: by outflank-mailman (input) for mailman id 735083;
 Tue, 04 Jun 2024 02:04:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEJWx-0001U0-Uu; Tue, 04 Jun 2024 02:04:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEJWx-0006NY-QN; Tue, 04 Jun 2024 02:04:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEJWx-0002WI-76; Tue, 04 Jun 2024 02:04:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sEJWx-0008CD-6i; Tue, 04 Jun 2024 02:04:07 +0000
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
	bh=jsSQEokWRd7+U0rFOgE0pH2kqhhs0yHAgzRH6fyz1Xg=; b=GqBblMQ7iDbNOTYngWJWSbAnLa
	pLgmIcHiYx1J9jmxMTS1RNX+3yyRns1xfbkpkLcMiSUaNwBG1quW+232fx9aDCLlqLir4a0k19vBa
	MvjybO94HiY8cNLnT+GtbUYzOvwIKf2gqfHH0xRhXSuDOI6TTcyNxF/sE2yFbTGnW5tA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186240-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186240: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=27b044605cd5f6b33a3d231576003850b3fe305b
X-Osstest-Versions-That:
    ovmf=b0930e3f4e6de1ce1c480bca687b44875e071f74
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Jun 2024 02:04:07 +0000

flight 186240 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186240/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 27b044605cd5f6b33a3d231576003850b3fe305b
baseline version:
 ovmf                 b0930e3f4e6de1ce1c480bca687b44875e071f74

Last test of basis   186236  2024-06-03 11:14:35 Z    0 days
Testing same since   186240  2024-06-03 20:43:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   b0930e3f4e..27b044605c  27b044605cd5f6b33a3d231576003850b3fe305b -> xen-tested-master

