Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E968C578F7D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 02:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370262.601920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDbZt-0002JE-Pt; Tue, 19 Jul 2022 00:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370262.601920; Tue, 19 Jul 2022 00:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDbZt-0002Gv-NA; Tue, 19 Jul 2022 00:59:09 +0000
Received: by outflank-mailman (input) for mailman id 370262;
 Tue, 19 Jul 2022 00:59:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDbZs-0002Gl-AN; Tue, 19 Jul 2022 00:59:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDbZr-000416-Rq; Tue, 19 Jul 2022 00:59:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDbZr-0001gz-GY; Tue, 19 Jul 2022 00:59:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oDbZr-0006VG-GA; Tue, 19 Jul 2022 00:59:07 +0000
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
	bh=HZbLSOFMPGEjkQggdDF1Khy/oifzeOC/IUZL5vDgfOk=; b=uqq6TnMaduu0dqgiuoYdKgc2Kq
	kNM2psdbmUoJvz33Jv7hvz6NV6zhzMBIHj3AU3TcUcG7LJas6AIyX8SBU2Jf06hu1NQ5qW5+yfzkG
	HIhZs6IjGV/i2ATnrm1NgyDyb3Qzv+7tygF3pXzte1gJO8g0RdtYRfVQhXLewBEWpXcg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171675-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171675: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=586b4a104bfeae277ce16687f852c4f26c4a3b73
X-Osstest-Versions-That:
    ovmf=792ebb6374f2b92e2c4b84f5b8d151a129ed81cc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Jul 2022 00:59:07 +0000

flight 171675 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171675/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 586b4a104bfeae277ce16687f852c4f26c4a3b73
baseline version:
 ovmf                 792ebb6374f2b92e2c4b84f5b8d151a129ed81cc

Last test of basis   171671  2022-07-18 17:10:27 Z    0 days
Testing same since   171675  2022-07-18 21:11:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nate DeSimone <nathaniel.l.desimone@intel.com>

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
   792ebb6374..586b4a104b  586b4a104bfeae277ce16687f852c4f26c4a3b73 -> xen-tested-master

