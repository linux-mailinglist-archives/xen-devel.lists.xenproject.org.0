Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB03B96A75B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 21:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789522.1199121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slZBf-0006la-IJ; Tue, 03 Sep 2024 19:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789522.1199121; Tue, 03 Sep 2024 19:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slZBf-0006ir-FQ; Tue, 03 Sep 2024 19:27:35 +0000
Received: by outflank-mailman (input) for mailman id 789522;
 Tue, 03 Sep 2024 19:27:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slZBe-0006ig-Cs; Tue, 03 Sep 2024 19:27:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slZBe-0003zw-3B; Tue, 03 Sep 2024 19:27:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1slZBd-0003zz-Me; Tue, 03 Sep 2024 19:27:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1slZBd-0004Tz-MA; Tue, 03 Sep 2024 19:27:33 +0000
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
	bh=3d52QVig7LPAlguj5u1Fl2MtnTB74VHM8RIoJhPxCNU=; b=JMectabaHoBvDUgTLamy/Ldfpp
	cO4UFtVC+9kn35w75U+mfr3MLuEcbR/E5BgiFzait3/xhyOCUzjTjX2a6umw5DMXj5nvyvaRGu2bd
	7UKWhWzCHusmLwjKJwuqDH/bTdtZWpz9CnSPbfGlXnHdEw4sDfxYXES8JmfeDdRVivrI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187477-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187477: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d997d3c62f6c3255491da09235cc7410cefad850
X-Osstest-Versions-That:
    ovmf=e48acc0fa98e307b1192037062f4623da3eeeb7f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Sep 2024 19:27:33 +0000

flight 187477 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187477/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d997d3c62f6c3255491da09235cc7410cefad850
baseline version:
 ovmf                 e48acc0fa98e307b1192037062f4623da3eeeb7f

Last test of basis   187475  2024-09-03 14:45:00 Z    0 days
Testing same since   187477  2024-09-03 16:42:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ceping Sun <cepingx.sun@intel.com>

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
   e48acc0fa9..d997d3c62f  d997d3c62f6c3255491da09235cc7410cefad850 -> xen-tested-master

