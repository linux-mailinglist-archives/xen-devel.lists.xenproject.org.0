Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C935667E6D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 19:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476360.738488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG2fS-0007Im-QJ; Thu, 12 Jan 2023 18:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476360.738488; Thu, 12 Jan 2023 18:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG2fS-0007HP-Ln; Thu, 12 Jan 2023 18:51:14 +0000
Received: by outflank-mailman (input) for mailman id 476360;
 Thu, 12 Jan 2023 18:51:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pG2fR-0007H9-Gv; Thu, 12 Jan 2023 18:51:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pG2fR-0000Z1-Ct; Thu, 12 Jan 2023 18:51:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pG2fR-0001gl-1P; Thu, 12 Jan 2023 18:51:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pG2fR-0006qF-0w; Thu, 12 Jan 2023 18:51:13 +0000
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
	bh=omginXvNBLOzUs2ZsmhzlB+XKQAWMNz7i4pLjS0v7no=; b=Hl02TrQgCx5g226QD/rLHADuH6
	S5RhCbq+oE/ejbzuzz1LhWUMB1wjENvXoOWPrIPAXMdA8ZxHRV0P45388eT1t16SDpAf0DYBbJvJ1
	T8kpXhajjKnxNtFTTt0OOOF/g/ozkGStK1Oi7KKloLnreUyzTryRDQ6ix6ATPWImWIck=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175747-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175747: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9d70d8f20d0feee1d232cbf86fc87147ce92c2cb
X-Osstest-Versions-That:
    ovmf=e5ec3ba409b5baa9cf429cc25fdf3c8d1b8dcef0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Jan 2023 18:51:13 +0000

flight 175747 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175747/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9d70d8f20d0feee1d232cbf86fc87147ce92c2cb
baseline version:
 ovmf                 e5ec3ba409b5baa9cf429cc25fdf3c8d1b8dcef0

Last test of basis   175740  2023-01-12 10:40:46 Z    0 days
Testing same since   175747  2023-01-12 16:10:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dionna Glaze <dionnaglaze@google.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Sophia Wolf <phiawolf@google.com>

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
   e5ec3ba409..9d70d8f20d  9d70d8f20d0feee1d232cbf86fc87147ce92c2cb -> xen-tested-master

