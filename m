Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B465FAEF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 06:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472307.732490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDfMF-0002mZ-Up; Fri, 06 Jan 2023 05:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472307.732490; Fri, 06 Jan 2023 05:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDfMF-0002ju-Qn; Fri, 06 Jan 2023 05:33:35 +0000
Received: by outflank-mailman (input) for mailman id 472307;
 Fri, 06 Jan 2023 05:33:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDfME-0002jg-A0; Fri, 06 Jan 2023 05:33:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDfME-0004Yx-7s; Fri, 06 Jan 2023 05:33:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDfMD-0003EC-Lr; Fri, 06 Jan 2023 05:33:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pDfMD-0004Tu-LQ; Fri, 06 Jan 2023 05:33:33 +0000
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
	bh=hVQ+F5Z9aFptuE60vsMMDxGFlAf/aEEGiSqiirlZucE=; b=4rYYykOPW9Uv0AU8nATNbMovkO
	vUUT50T37J3RlmyncdzVBa2QeBpmjnNrNquMso8g/2T44N4eEh36olTWIkEqPteXWDSH0JXJwowri
	pUikxczSbsoowXcyeblQHIfsvpx9wGDNTlWLNNuzeek5dTSqfECJ2ZTHk3BRW0Cl09Bg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175596-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175596: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c32e7331513bfdb625986e4570c304dced4ea109
X-Osstest-Versions-That:
    ovmf=9ce09870e721efacc41fa7ee684e9e299f120350
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Jan 2023 05:33:33 +0000

flight 175596 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175596/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c32e7331513bfdb625986e4570c304dced4ea109
baseline version:
 ovmf                 9ce09870e721efacc41fa7ee684e9e299f120350

Last test of basis   175567  2023-01-04 10:13:33 Z    1 days
Testing same since   175596  2023-01-06 03:10:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>
  Wu, Jiaxin <jiaxin.wu@intel.com>

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
   9ce09870e7..c32e733151  c32e7331513bfdb625986e4570c304dced4ea109 -> xen-tested-master

