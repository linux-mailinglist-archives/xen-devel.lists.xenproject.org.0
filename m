Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0512302456
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 12:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74041.133086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l40AX-0006ZG-RK; Mon, 25 Jan 2021 11:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74041.133086; Mon, 25 Jan 2021 11:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l40AX-0006Ym-MC; Mon, 25 Jan 2021 11:36:29 +0000
Received: by outflank-mailman (input) for mailman id 74041;
 Mon, 25 Jan 2021 11:36:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l40AW-0006Yd-3m; Mon, 25 Jan 2021 11:36:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l40AV-0003AY-Sy; Mon, 25 Jan 2021 11:36:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l40AV-00010c-Id; Mon, 25 Jan 2021 11:36:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l40AV-0007mI-ID; Mon, 25 Jan 2021 11:36:27 +0000
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
	bh=nq2juEMTx0UeYb0JlOjSt/qIs1kvS6wwTmX95jqOQw0=; b=bTYL9L65+S5foeU4H64oomnVUH
	oBpnFmhITmITweYkRbnty/ixfpi8tdfvDUH5/FeW3IwHH/MMjNsvqcDTQuzsU4PGUT2JPnTK6I8og
	OudIEdtNiPtliGQj2Jn2z1BtumocNa5RNnEj4fLBr0G+eA+5rzUWBXwtpy9CsX3MAx6E=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158608-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158608: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=96a9acfc527964dc5ab7298862a0cd8aa5fffc6a
X-Osstest-Versions-That:
    ovmf=3b769c5110384fb33bcfeddced80f721ec7838cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Jan 2021 11:36:27 +0000

flight 158608 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158608/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 96a9acfc527964dc5ab7298862a0cd8aa5fffc6a
baseline version:
 ovmf                 3b769c5110384fb33bcfeddced80f721ec7838cc

Last test of basis   158585  2021-01-23 01:06:49 Z    2 days
Testing same since   158608  2021-01-25 02:39:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   3b769c5110..96a9acfc52  96a9acfc527964dc5ab7298862a0cd8aa5fffc6a -> xen-tested-master

