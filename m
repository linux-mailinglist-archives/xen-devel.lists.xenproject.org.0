Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D2577591
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jul 2022 11:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369013.600409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oD0i7-0000nD-9Q; Sun, 17 Jul 2022 09:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369013.600409; Sun, 17 Jul 2022 09:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oD0i7-0000lH-64; Sun, 17 Jul 2022 09:37:11 +0000
Received: by outflank-mailman (input) for mailman id 369013;
 Sun, 17 Jul 2022 09:37:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oD0i5-0000l7-3R; Sun, 17 Jul 2022 09:37:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oD0i5-0002FW-0p; Sun, 17 Jul 2022 09:37:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oD0i4-0002bI-Pt; Sun, 17 Jul 2022 09:37:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oD0i4-0001Zq-PO; Sun, 17 Jul 2022 09:37:08 +0000
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
	bh=XgtVy2yvySZDDF+xNrtkFxksTQWV8jcO33sxNxd6qNE=; b=Kw7mLgIgrcL8y675DDfr0tvwM1
	gDnrVf2Uy2UHh20E8vtA7WLxCDQF1znkbNOFgo7EzC04iY7vXkdtcPDBUlyHCpreRwqWSZupWZnjl
	tx9VkS1zLEJl2V9Ra0wMtS+LT+/BtbgKiL0+763uHEOWWqsXzYSjA2tWmEBbmpTyiYR4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171659-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171659: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=039bdb4d3e96f9c9264abf135b8a0eef2e2b4860
X-Osstest-Versions-That:
    ovmf=176016387f0a6ad16efcfdcef19fd90bdc3a77e4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 17 Jul 2022 09:37:08 +0000

flight 171659 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171659/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 039bdb4d3e96f9c9264abf135b8a0eef2e2b4860
baseline version:
 ovmf                 176016387f0a6ad16efcfdcef19fd90bdc3a77e4

Last test of basis   171657  2022-07-17 02:41:23 Z    0 days
Testing same since   171659  2022-07-17 07:43:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen, Christine <Yuwei.Chen@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   176016387f..039bdb4d3e  039bdb4d3e96f9c9264abf135b8a0eef2e2b4860 -> xen-tested-master

