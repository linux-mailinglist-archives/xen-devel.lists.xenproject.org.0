Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7937F2FC2AB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 22:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71073.127158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1yqy-0007Eh-5W; Tue, 19 Jan 2021 21:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71073.127158; Tue, 19 Jan 2021 21:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1yqy-0007EA-04; Tue, 19 Jan 2021 21:47:56 +0000
Received: by outflank-mailman (input) for mailman id 71073;
 Tue, 19 Jan 2021 21:47:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1yqx-0007E2-9X; Tue, 19 Jan 2021 21:47:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1yqx-00029F-2D; Tue, 19 Jan 2021 21:47:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l1yqw-0003Pi-Nz; Tue, 19 Jan 2021 21:47:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l1yqw-0004fZ-NW; Tue, 19 Jan 2021 21:47:54 +0000
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
	bh=3eZ2o+bunAEAkY67DFrWE+enGXRU0Zw4zjxOk9UqfZM=; b=ucPAefNOujiY1eDyf4GSXkXx+c
	dRKy6pDE9Dfi7k3bjAAVdPMBm2z/GnJSIxxot3UglKDpSU4s/hScG7XVRTZtIt8rubw+TUhYE99gf
	yui3BxHLKnZQGSxXSBHjmAUdaAGPZOtoEn+yeoAqQfkvp463LmITck9tL8NBx13jIEj0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158522-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158522: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=83facfd184021874f95a6a34b2e47e0ebb34a762
X-Osstest-Versions-That:
    ovmf=4f214830ce02cf588baba9ae6e7becfd67e5748c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Jan 2021 21:47:54 +0000

flight 158522 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158522/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 83facfd184021874f95a6a34b2e47e0ebb34a762
baseline version:
 ovmf                 4f214830ce02cf588baba9ae6e7becfd67e5748c

Last test of basis   158489  2021-01-18 13:09:45 Z    1 days
Testing same since   158522  2021-01-19 14:11:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>
  Lou, Yun <Yun.Lou@intel.com>

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
   4f214830ce..83facfd184  83facfd184021874f95a6a34b2e47e0ebb34a762 -> xen-tested-master

