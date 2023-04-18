Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163FF6E5AC3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 09:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522619.812104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pog2y-0003BI-RF; Tue, 18 Apr 2023 07:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522619.812104; Tue, 18 Apr 2023 07:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pog2y-000397-Nv; Tue, 18 Apr 2023 07:46:40 +0000
Received: by outflank-mailman (input) for mailman id 522619;
 Tue, 18 Apr 2023 07:46:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pog2w-00038x-Tb; Tue, 18 Apr 2023 07:46:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pog2w-0005i7-L1; Tue, 18 Apr 2023 07:46:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pog2w-0001Xe-8V; Tue, 18 Apr 2023 07:46:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pog2w-0007uS-86; Tue, 18 Apr 2023 07:46:38 +0000
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
	bh=87z+yaiu1nxYN62Lf7U/+A63vg3Bt1B89ResqD9s/iI=; b=yyeZyUvFFMcFdvqmV8VGGLbeM6
	3KDZh+5LNMF4bQR/smFu1jCrPXJ1komf1oUODMTIZZpulvbpO6crtQgZBhf1dxO/KJn7j5NN0n3lb
	FRulkeW5GbCEYh1amofoLFPGsfWy74EJeyv+Ov6rO/vd41VIsidD8bpxi8JF7R3xwm7I=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180295-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180295: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b16284e2a0011489f6e16dfcc6af7623c3cbaf0b
X-Osstest-Versions-That:
    ovmf=6ded9f50c3aa123fe581c42ff6c03789b9b593c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Apr 2023 07:46:38 +0000

flight 180295 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180295/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b16284e2a0011489f6e16dfcc6af7623c3cbaf0b
baseline version:
 ovmf                 6ded9f50c3aa123fe581c42ff6c03789b9b593c1

Last test of basis   180277  2023-04-16 18:10:48 Z    1 days
Testing same since   180295  2023-04-18 06:12:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Duggapu Chinni B <chinni.b.duggapu@intel.com>
  Duggapu, Chinni B <chinni.b.duggapu@intel.com>

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
   6ded9f50c3..b16284e2a0  b16284e2a0011489f6e16dfcc6af7623c3cbaf0b -> xen-tested-master

