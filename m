Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489A40DD95
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188556.337758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQszv-0007zz-7o; Thu, 16 Sep 2021 15:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188556.337758; Thu, 16 Sep 2021 15:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQszv-0007xt-4b; Thu, 16 Sep 2021 15:08:23 +0000
Received: by outflank-mailman (input) for mailman id 188556;
 Thu, 16 Sep 2021 15:08:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQszt-0007wf-UF; Thu, 16 Sep 2021 15:08:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQszt-0000PL-PN; Thu, 16 Sep 2021 15:08:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mQszt-0006nb-Fg; Thu, 16 Sep 2021 15:08:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mQszt-0002S8-F5; Thu, 16 Sep 2021 15:08:21 +0000
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
	bh=NIXLT3EwRTE7NYyzfb34E9On+CB9t2D6ic8YaDRkcIY=; b=fVsKv6MHIjunUpRu2cNgdXFakY
	hmaUo+2RjYLNmpluIx6Y9FyBW62hhYAGky8vlbVMm16GghCcK+OUCfsM3XDEnkLC17VAXQCpSUl2G
	EDO+jYaEkglOdHYi1oBGBxquw49VK0DUnCwDfhJYM7XLmYg9swzNPFL9eO3MSPvreHdQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165007-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165007: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f4e72cf9d665a8f1a54170b0b62739a628823c8b
X-Osstest-Versions-That:
    ovmf=c19d18136ef920e3e84f961e2a335a41147adcb8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Sep 2021 15:08:21 +0000

flight 165007 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165007/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f4e72cf9d665a8f1a54170b0b62739a628823c8b
baseline version:
 ovmf                 c19d18136ef920e3e84f961e2a335a41147adcb8

Last test of basis   165001  2021-09-16 01:55:08 Z    0 days
Testing same since   165007  2021-09-16 09:41:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Tan, Dun <dun.tan@intel.com>

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
   c19d18136e..f4e72cf9d6  f4e72cf9d665a8f1a54170b0b62739a628823c8b -> xen-tested-master

