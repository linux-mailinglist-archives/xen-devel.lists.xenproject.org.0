Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D297F0C0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 20:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802292.1212512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssnvQ-0002yh-WD; Mon, 23 Sep 2024 18:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802292.1212512; Mon, 23 Sep 2024 18:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssnvQ-0002wL-T8; Mon, 23 Sep 2024 18:36:44 +0000
Received: by outflank-mailman (input) for mailman id 802292;
 Mon, 23 Sep 2024 18:36:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvQ-0002wB-6K; Mon, 23 Sep 2024 18:36:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvQ-0004dr-4h; Mon, 23 Sep 2024 18:36:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvP-0004Ri-Pv; Mon, 23 Sep 2024 18:36:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ssnvP-0006fK-PN; Mon, 23 Sep 2024 18:36:43 +0000
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
	bh=+YUnhkI77M41DaCkDv6s4geOHXK7U0W3Snt5oSRWac0=; b=XeGRcL4xoe7n+UZ8nf01DLjVbD
	rL5Ey2DmPMNO23Q25sbM6mPFMUlqP7vljABamm5oVVIoGon8AEBEZe6SuCerPCQSuPFNsKMdDQffA
	7j4B9nsHHSM0BrKM0Fme8ks/pGCqaATdk2zFM+vJtoPMtvcJvfJ/BufSZ3bNjh73plo4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187829-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187829: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4c3bffaeb3cff662686e33c506802132147c4fbf
X-Osstest-Versions-That:
    ovmf=1a89c690a1df8a22bd2157be72d438b741c96854
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Sep 2024 18:36:43 +0000

flight 187829 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187829/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4c3bffaeb3cff662686e33c506802132147c4fbf
baseline version:
 ovmf                 1a89c690a1df8a22bd2157be72d438b741c96854

Last test of basis   187824  2024-09-23 06:43:33 Z    0 days
Testing same since   187829  2024-09-23 16:13:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   1a89c690a1..4c3bffaeb3  4c3bffaeb3cff662686e33c506802132147c4fbf -> xen-tested-master

