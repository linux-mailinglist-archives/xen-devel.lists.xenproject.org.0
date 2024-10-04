Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358299113B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 23:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810668.1223416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swphg-0000Uw-3a; Fri, 04 Oct 2024 21:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810668.1223416; Fri, 04 Oct 2024 21:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swphf-0000TW-W1; Fri, 04 Oct 2024 21:19:11 +0000
Received: by outflank-mailman (input) for mailman id 810668;
 Fri, 04 Oct 2024 21:19:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swphf-0000TM-CO; Fri, 04 Oct 2024 21:19:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swphf-0005M7-3Z; Fri, 04 Oct 2024 21:19:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swphe-0002aS-Lt; Fri, 04 Oct 2024 21:19:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swphe-0003ht-LP; Fri, 04 Oct 2024 21:19:10 +0000
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
	bh=OMprCluZ276jcDRp+BKs9MRHnEv21dekzmEZEAIWDqI=; b=mnL7R28++9R8hAmWFsnJlgbvY2
	ylq7GLhGCUGFTP5cKjbvJbSZZ1ybQYmO9FEEST2/soELkswReCo696XYORJCGL/u/Uxq2OsIknpUd
	IE7qMV9NaY2sAyAkcmc3FxeqlpCKH4LgNYIL0M+ROjpLwVB0wbzsarp++VgmD3Lsjefc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187972-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187972: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=df884297fd57aac379d227925e27211e667974ee
X-Osstest-Versions-That:
    ovmf=c82bf392c58e60e3e656b13627e3076d709ab796
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Oct 2024 21:19:10 +0000

flight 187972 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187972/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 df884297fd57aac379d227925e27211e667974ee
baseline version:
 ovmf                 c82bf392c58e60e3e656b13627e3076d709ab796

Last test of basis   187969  2024-10-04 16:43:30 Z    0 days
Testing same since   187972  2024-10-04 19:11:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Carsten Haitzler <carsten.haitzler@foss.arm.com>

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
   c82bf392c5..df884297fd  df884297fd57aac379d227925e27211e667974ee -> xen-tested-master

