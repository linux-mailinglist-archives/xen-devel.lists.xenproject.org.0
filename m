Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E336942CE2B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 00:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208899.365172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mammY-00083b-Vp; Wed, 13 Oct 2021 22:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208899.365172; Wed, 13 Oct 2021 22:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mammY-00081l-Rg; Wed, 13 Oct 2021 22:31:30 +0000
Received: by outflank-mailman (input) for mailman id 208899;
 Wed, 13 Oct 2021 22:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mammX-00081b-Ib; Wed, 13 Oct 2021 22:31:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mammX-0007Km-FE; Wed, 13 Oct 2021 22:31:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mammX-0000Xs-2M; Wed, 13 Oct 2021 22:31:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mammX-0007vW-1p; Wed, 13 Oct 2021 22:31:29 +0000
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
	bh=96kFtMZ0ZV/Jyq1oWhOXUTbFeL9KUFWOoZoA1voCoh0=; b=w9q7EdLSV/FE++8RE7grbzx6Xf
	Z4HEqWEap21nnBhVtMm0q7F3MxgX5lkexxfAf9v1urXacHwMcvtlMyV5sdA3ZzESmQ7VJG63xeuxK
	Li2tSVPSHrQtcHQ8QwSq44ExVU6MSHPxzpjt4jtXyExb0qpu5CfsozGsqhtuZtgsAn4c=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165494-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165494: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6ed6abd6c116e8599876a2876b77e172e800b13e
X-Osstest-Versions-That:
    ovmf=f22feb0e3b3f08b95201b258b104c45a2acef71f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Oct 2021 22:31:29 +0000

flight 165494 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165494/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6ed6abd6c116e8599876a2876b77e172e800b13e
baseline version:
 ovmf                 f22feb0e3b3f08b95201b258b104c45a2acef71f

Last test of basis   165487  2021-10-13 01:56:13 Z    0 days
Testing same since   165494  2021-10-13 12:41:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen, Christine <Yuwei.Chen@intel.com>
  IanX Kuo <ianx.kuo@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   f22feb0e3b..6ed6abd6c1  6ed6abd6c116e8599876a2876b77e172e800b13e -> xen-tested-master

