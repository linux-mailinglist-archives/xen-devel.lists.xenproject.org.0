Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A682DB22
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667386.1038582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPNkw-0001ij-4e; Mon, 15 Jan 2024 14:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667386.1038582; Mon, 15 Jan 2024 14:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPNkw-0001i6-17; Mon, 15 Jan 2024 14:16:02 +0000
Received: by outflank-mailman (input) for mailman id 667386;
 Mon, 15 Jan 2024 14:16:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPNku-0001hw-HS; Mon, 15 Jan 2024 14:16:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPNkt-0004T4-Oc; Mon, 15 Jan 2024 14:15:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPNkt-0007Ik-Cx; Mon, 15 Jan 2024 14:15:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPNkt-0000NB-CT; Mon, 15 Jan 2024 14:15:59 +0000
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
	bh=ba6Xt2eeCQV9V6WQEqWj2oD/uPFPIlxX0iTpUzbaAO4=; b=oE3AYVpCZtzAri+XG+1isWMm7a
	jJuZY8qz3q3jvVsSIs4FjcYEnP9OeOupH+XBi2Ill/id0onW2OVJcYPvh6EBf/Fa3OxXBptGOnIyQ
	Pig4ayYQWhIDgayfydbLJ5EwSUlGFRQiZbEGG3wTRKfdEIQDuBh3TfKZYNSp5iY2WLSA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184356-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184356: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=195e59bd0c60523caa415f429517e46ff7065600
X-Osstest-Versions-That:
    ovmf=d65b183f92446a3a2855c1c7dd4a7a1b760af381
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jan 2024 14:15:59 +0000

flight 184356 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184356/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 195e59bd0c60523caa415f429517e46ff7065600
baseline version:
 ovmf                 d65b183f92446a3a2855c1c7dd4a7a1b760af381

Last test of basis   184352  2024-01-15 09:42:45 Z    0 days
Testing same since   184356  2024-01-15 12:11:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Suqiang Ren <suqiangx.ren@intel.com>

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
   d65b183f92..195e59bd0c  195e59bd0c60523caa415f429517e46ff7065600 -> xen-tested-master

