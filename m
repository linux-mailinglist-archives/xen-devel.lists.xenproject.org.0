Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AEB30E7E9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 00:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81119.149296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Rxo-0000VY-Ml; Wed, 03 Feb 2021 23:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81119.149296; Wed, 03 Feb 2021 23:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Rxo-0000V6-IA; Wed, 03 Feb 2021 23:53:36 +0000
Received: by outflank-mailman (input) for mailman id 81119;
 Wed, 03 Feb 2021 23:53:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7Rxn-0000Uy-5m; Wed, 03 Feb 2021 23:53:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7Rxm-0002ty-Ro; Wed, 03 Feb 2021 23:53:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7Rxm-0007Nz-IG; Wed, 03 Feb 2021 23:53:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7Rxm-0006xN-Hg; Wed, 03 Feb 2021 23:53:34 +0000
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
	bh=qnbHPPC9sasnAv4hBHJf46Mvbt7Zst+Jspu9Ql9npVQ=; b=H/fCgnafIC2T6z83K/6q3ifjqy
	3KO/o8AuBi3Va56YGaCcx/nK7dIE47PxZXr09n25hErkDsvJBjbx2msLKDR8TnJuVaqeuTbI0szBS
	d0A1yTw6UK/DoavB6PMx/eB0Fxlu5v75h2jMfpq5F5YlqVPEp+Ku+Vx9o78KfEdb/zdg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158985-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158985: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e806bb29cfde1b242bb37e72e77364dd812830e0
X-Osstest-Versions-That:
    ovmf=618e6a1f21a11eaee0a92e19c753969eb4a1b198
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Feb 2021 23:53:34 +0000

flight 158985 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158985/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e806bb29cfde1b242bb37e72e77364dd812830e0
baseline version:
 ovmf                 618e6a1f21a11eaee0a92e19c753969eb4a1b198

Last test of basis   158975  2021-02-03 07:14:36 Z    0 days
Testing same since   158985  2021-02-03 13:10:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>
  Lou, Yun <Yun.Lou@intel.com>

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
   618e6a1f21..e806bb29cf  e806bb29cfde1b242bb37e72e77364dd812830e0 -> xen-tested-master

