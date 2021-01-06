Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB382EC45B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 20:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62673.111092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxExP-0007R0-Ib; Wed, 06 Jan 2021 19:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62673.111092; Wed, 06 Jan 2021 19:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxExP-0007QY-FN; Wed, 06 Jan 2021 19:58:59 +0000
Received: by outflank-mailman (input) for mailman id 62673;
 Wed, 06 Jan 2021 19:58:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxExO-0007QQ-KB; Wed, 06 Jan 2021 19:58:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxExO-00081Z-Ea; Wed, 06 Jan 2021 19:58:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxExO-0003ju-6g; Wed, 06 Jan 2021 19:58:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxExO-0002VX-6A; Wed, 06 Jan 2021 19:58:58 +0000
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
	bh=THA4bcFLm8+CFPwhPZJfNeHwgq5oaPGGWDShRNGSTaM=; b=4QYCGkjV08WwVsJSDykG7ZYaQi
	2PuuY9WhizCwY+RI/CHIj8+VyL4Pg9mCTqnNrPulhXSdPMO469h5sE4T5CA5jDW4+myaeK912KolB
	7wAuuKUoBMj1wAz/3uNBFtGdiP2n7I+ElaAOWnjzGa3vwQC+MkhOHnBLyyT+RxPHXLjc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158215-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158215: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7785b38ac9772d55b6d1e8560dde3f854e1dd34a
X-Osstest-Versions-That:
    ovmf=67e0e4caa5bacdd65327d8b302eace2d9ebd209f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Jan 2021 19:58:58 +0000

flight 158215 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158215/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7785b38ac9772d55b6d1e8560dde3f854e1dd34a
baseline version:
 ovmf                 67e0e4caa5bacdd65327d8b302eace2d9ebd209f

Last test of basis   158199  2021-01-06 08:41:02 Z    0 days
Testing same since   158215  2021-01-06 16:41:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   67e0e4caa5..7785b38ac9  7785b38ac9772d55b6d1e8560dde3f854e1dd34a -> xen-tested-master

