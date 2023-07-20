Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC875AC84
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 13:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566542.885494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRQi-0000jC-Pf; Thu, 20 Jul 2023 11:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566542.885494; Thu, 20 Jul 2023 11:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRQi-0000gu-Mn; Thu, 20 Jul 2023 11:02:44 +0000
Received: by outflank-mailman (input) for mailman id 566542;
 Thu, 20 Jul 2023 11:02:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMRQh-0000gk-0j; Thu, 20 Jul 2023 11:02:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMRQg-0001bb-OZ; Thu, 20 Jul 2023 11:02:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMRQg-0003WS-DR; Thu, 20 Jul 2023 11:02:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qMRQg-000828-Cy; Thu, 20 Jul 2023 11:02:42 +0000
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
	bh=rluLHFw4A841OeFEfSv5AAh6mST/5sDskDCQj0f7uy0=; b=zVT4LRjtKIlD+u2+FBwIcRC/wC
	X/U3Y7SFf3HYk2tcvDIFZ+OwGtgjjNacsHF2Zb+G4s5LLUTX7tSe6X3PtD7afEUhWTvRZqUYg0GqY
	P/D19gTsTF1dcjzDLlK8BMoHtGYEKq+6lu7FhoUNVw1DpTPDh8B2c+ZxNLVpDimadmvw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181922-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181922: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b2de9ec5a759aa4a7ac029cda9079dce077bf856
X-Osstest-Versions-That:
    ovmf=6510dcf6f71adbe282bff0ba2b236f1d074f819f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jul 2023 11:02:42 +0000

flight 181922 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181922/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b2de9ec5a759aa4a7ac029cda9079dce077bf856
baseline version:
 ovmf                 6510dcf6f71adbe282bff0ba2b236f1d074f819f

Last test of basis   181916  2023-07-20 01:41:49 Z    0 days
Testing same since   181922  2023-07-20 08:11:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sheng Wei <w.sheng@intel.com>

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
   6510dcf6f7..b2de9ec5a7  b2de9ec5a759aa4a7ac029cda9079dce077bf856 -> xen-tested-master

