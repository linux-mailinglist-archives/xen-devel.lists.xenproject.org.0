Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBFA8ABAF7
	for <lists+xen-devel@lfdr.de>; Sat, 20 Apr 2024 12:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709353.1108570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ry7rN-0002OC-FV; Sat, 20 Apr 2024 10:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709353.1108570; Sat, 20 Apr 2024 10:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ry7rN-0002LR-Bp; Sat, 20 Apr 2024 10:22:17 +0000
Received: by outflank-mailman (input) for mailman id 709353;
 Sat, 20 Apr 2024 10:22:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ry7rL-0002LC-Jk; Sat, 20 Apr 2024 10:22:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ry7rL-0003Vv-F1; Sat, 20 Apr 2024 10:22:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ry7rL-0006Kb-6x; Sat, 20 Apr 2024 10:22:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ry7rL-0002FO-6b; Sat, 20 Apr 2024 10:22:15 +0000
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
	bh=xeQGCiqFBLty+lTptqadI+0XfyGQVVqf/c6AjVrnmOQ=; b=S80u68uHQW8QMXv6X5xJQtdPsq
	GUdfESdKwZlSM9TZud7YZToFB+eRMagPv/5jBy/0BVW4n+HlkKemwBUXx38uZ2mwHdf3OpPRCDsY8
	jfxcwVrn2LzyghMmwPa3hDo1kO/dhEjN4NJLLGx7dCZF7fEPMY9aDdIuJi+MK9BpniR0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185745-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185745: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6780b3aba086395341d8476d43bef5e15c662c3a
X-Osstest-Versions-That:
    ovmf=0afb8743493853e30171f6000de51242e22a1eb8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 20 Apr 2024 10:22:15 +0000

flight 185745 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185745/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6780b3aba086395341d8476d43bef5e15c662c3a
baseline version:
 ovmf                 0afb8743493853e30171f6000de51242e22a1eb8

Last test of basis   185726  2024-04-17 21:14:35 Z    2 days
Testing same since   185745  2024-04-20 08:41:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  abnchang <abnchang@amd.com>
  Abner Chang <abner.chang@amd.com>

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
   0afb874349..6780b3aba0  6780b3aba086395341d8476d43bef5e15c662c3a -> xen-tested-master

