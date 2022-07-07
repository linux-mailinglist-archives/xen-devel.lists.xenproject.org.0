Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BE56A3EE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 15:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362992.593303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9RkA-0003cn-Js; Thu, 07 Jul 2022 13:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362992.593303; Thu, 07 Jul 2022 13:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9RkA-0003a1-H4; Thu, 07 Jul 2022 13:40:34 +0000
Received: by outflank-mailman (input) for mailman id 362992;
 Thu, 07 Jul 2022 13:40:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9Rk8-0003Zq-GR; Thu, 07 Jul 2022 13:40:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9Rk8-0006wH-Dw; Thu, 07 Jul 2022 13:40:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o9Rk7-0008IS-V5; Thu, 07 Jul 2022 13:40:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o9Rk7-0005Sm-Ue; Thu, 07 Jul 2022 13:40:31 +0000
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
	bh=ZMFTMh5cilv8LW/rnnU23lgxw7phGxVRMyeej4pF73k=; b=KXPeWtu/FwHnAuSXSDfEdakQL3
	sM/ig7ZG+T9uRM7vO1m+mARja0RY3vdwG54r6pkhsbPeHdxUuJgeQpj6LBLdeWbs6wYqKQ4HaOEhG
	PBm+nMkwTMUT0dTz1mV/0ClOGUAvgjP5HEDxErHCvxdvBFgatScLZ91P40e9KBqiM2n0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171546-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171546: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5496c763aaddc4a47639d4652abe23aa3419263a
X-Osstest-Versions-That:
    ovmf=f193b945eac58ca379d3d21c77d5550b063580d6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Jul 2022 13:40:31 +0000

flight 171546 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171546/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5496c763aaddc4a47639d4652abe23aa3419263a
baseline version:
 ovmf                 f193b945eac58ca379d3d21c77d5550b063580d6

Last test of basis   171540  2022-07-07 01:10:28 Z    0 days
Testing same since   171546  2022-07-07 10:42:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ming Huang <huangming@linux.alibaba.com>

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
   f193b945ea..5496c763aa  5496c763aaddc4a47639d4652abe23aa3419263a -> xen-tested-master

