Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D9292F324
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 02:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757734.1166862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS4L1-0005oW-Qa; Fri, 12 Jul 2024 00:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757734.1166862; Fri, 12 Jul 2024 00:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS4L1-0005lK-Ne; Fri, 12 Jul 2024 00:40:39 +0000
Received: by outflank-mailman (input) for mailman id 757734;
 Fri, 12 Jul 2024 00:40:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS4L0-0005lA-Mv; Fri, 12 Jul 2024 00:40:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS4L0-0001M1-Is; Fri, 12 Jul 2024 00:40:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sS4L0-0007k2-8U; Fri, 12 Jul 2024 00:40:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sS4L0-0000Cb-85; Fri, 12 Jul 2024 00:40:38 +0000
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
	bh=RIaQed76EFJ65Qt0gjgn4vZE4W1trqiBtX3ng44px2I=; b=DcnNvdc4IcOCZavXA0Yh9MUg55
	GTeSIzqZTLxAl/N8/X8nmYM3hcrDYoieWV+FFOEzZFLDD0PLvrxFK+/djNP9r0UDMojOldrX4/clb
	/9XjTR17yF04ILNBthq1PkmcR9RYpyAEvG1nq85ESwvuL6badppVGhNzZN2R9m6LZfTg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186768-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186768: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5c86b0b57c153bde28f925de80cc011dd4ff1f9d
X-Osstest-Versions-That:
    ovmf=071d2cfab8347e396c8b2709bfb588a18c497bbd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Jul 2024 00:40:38 +0000

flight 186768 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186768/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5c86b0b57c153bde28f925de80cc011dd4ff1f9d
baseline version:
 ovmf                 071d2cfab8347e396c8b2709bfb588a18c497bbd

Last test of basis   186759  2024-07-11 03:43:49 Z    0 days
Testing same since   186768  2024-07-11 22:11:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Saloni Kasbekar <saloni.kasbekar@intel.com>

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
   071d2cfab8..5c86b0b57c  5c86b0b57c153bde28f925de80cc011dd4ff1f9d -> xen-tested-master

