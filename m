Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD681E680
	for <lists+xen-devel@lfdr.de>; Tue, 26 Dec 2023 10:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660002.1029609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rI3w7-0005DC-Le; Tue, 26 Dec 2023 09:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660002.1029609; Tue, 26 Dec 2023 09:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rI3w7-0005B6-IU; Tue, 26 Dec 2023 09:41:19 +0000
Received: by outflank-mailman (input) for mailman id 660002;
 Tue, 26 Dec 2023 09:41:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rI3w5-0005Aw-Jt; Tue, 26 Dec 2023 09:41:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rI3w5-00081W-Ed; Tue, 26 Dec 2023 09:41:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rI3w4-0000u7-W2; Tue, 26 Dec 2023 09:41:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rI3w4-0006Jq-Vc; Tue, 26 Dec 2023 09:41:16 +0000
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
	bh=S5BvSzCvWjeyVUpzGcNuer2GPThItOZYoHZbyV07NtQ=; b=OI4HydWP3GWwnoFiyeo+OJG5cB
	wj84AHoGFsWIXRRZOinzMLQ5a2oWyIidixAoxzK1X1KEqVmU7fnRlGoKOnI3i/488a6q2XfAIokVz
	U4B2TMIOotkuRvcpll7A51FGLZl9+VBHBQES+URABlFdX0aiWaQzL/Ng44Io7viGUUUo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184227-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184227: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=58d94639390803e375a7d16c94a5a527ec158474
X-Osstest-Versions-That:
    ovmf=54c662845f5dfa3f1146b0c345b91615b0e77af2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Dec 2023 09:41:16 +0000

flight 184227 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184227/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 58d94639390803e375a7d16c94a5a527ec158474
baseline version:
 ovmf                 54c662845f5dfa3f1146b0c345b91615b0e77af2

Last test of basis   184223  2023-12-25 07:14:24 Z    1 days
Testing same since   184227  2023-12-26 07:41:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   54c662845f..58d9463939  58d94639390803e375a7d16c94a5a527ec158474 -> xen-tested-master

