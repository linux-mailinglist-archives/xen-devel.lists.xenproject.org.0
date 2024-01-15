Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3DF82E410
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 00:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667581.1038994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPWdZ-0002lm-Tk; Mon, 15 Jan 2024 23:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667581.1038994; Mon, 15 Jan 2024 23:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPWdZ-0002iV-Qj; Mon, 15 Jan 2024 23:45:01 +0000
Received: by outflank-mailman (input) for mailman id 667581;
 Mon, 15 Jan 2024 23:45:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPWdY-0002iL-1N; Mon, 15 Jan 2024 23:45:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPWdX-0007BO-Qo; Mon, 15 Jan 2024 23:44:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rPWdX-0003GX-GU; Mon, 15 Jan 2024 23:44:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rPWdX-0008DR-G2; Mon, 15 Jan 2024 23:44:59 +0000
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
	bh=id03qKJIOfLY6NZvmEXvBhDsazH1bE3YKt7/gxRAagE=; b=GltP5zNjgsKY3PIpP9CpEM2t1E
	RA59ECBwtOPMm2h/164butvWZ3WKwY/MSeZtZ6DpuJq7vzns5WzfZTmGPRJdP4k9R8Ixgt/F6a5ei
	uxPleerGW0uvQzD7KsuHZZqSmPif2rUkoRz2J4SA7q4QJxskmlLUzW12mqOss87w1A0I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184364-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184364: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7c2757c298b40f5d7bad8da3faff7bb9c47ce2ae
X-Osstest-Versions-That:
    ovmf=82e149f2bf796a5a0492d764897ada261d266653
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jan 2024 23:44:59 +0000

flight 184364 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184364/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7c2757c298b40f5d7bad8da3faff7bb9c47ce2ae
baseline version:
 ovmf                 82e149f2bf796a5a0492d764897ada261d266653

Last test of basis   184361  2024-01-15 16:12:51 Z    0 days
Testing same since   184364  2024-01-15 20:12:55 Z    0 days    1 attempts

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
   82e149f2bf..7c2757c298  7c2757c298b40f5d7bad8da3faff7bb9c47ce2ae -> xen-tested-master

