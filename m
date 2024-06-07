Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851B9001E0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 13:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736484.1142571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFXbb-0006Gl-LY; Fri, 07 Jun 2024 11:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736484.1142571; Fri, 07 Jun 2024 11:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFXbb-0006FB-Hr; Fri, 07 Jun 2024 11:17:59 +0000
Received: by outflank-mailman (input) for mailman id 736484;
 Fri, 07 Jun 2024 11:17:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFXba-0006F1-H7; Fri, 07 Jun 2024 11:17:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFXba-0002tt-E7; Fri, 07 Jun 2024 11:17:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFXba-0007hy-2R; Fri, 07 Jun 2024 11:17:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFXba-0004yi-23; Fri, 07 Jun 2024 11:17:58 +0000
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
	bh=FnwrUGnqjRRpwsB99ElphbeaByCg288o1Ru2Ssg2wQw=; b=1+BHQFE8eX+nBhBsths7SOwsTY
	gZVMx54d5vwmPpHa2gogkP1uxNUV/1fjihazkhaUVOGAn4BcSBq6rRZjdGfAL/3HGjVvBRyHu0kAX
	As5GX+nZPJR7F7EYZV64+T4r8in4cLbJSOAa3NE9zAkuyzXV5tSpHCd1R4GsiSmXWGa0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186276-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186276: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=665b223d57369d8b28dcdc81352428adfe435ff4
X-Osstest-Versions-That:
    ovmf=80b59ff8320d1bd134bf689fe9c0ddf4e0473b88
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Jun 2024 11:17:58 +0000

flight 186276 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186276/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 665b223d57369d8b28dcdc81352428adfe435ff4
baseline version:
 ovmf                 80b59ff8320d1bd134bf689fe9c0ddf4e0473b88

Last test of basis   186273  2024-06-07 04:13:04 Z    0 days
Testing same since   186276  2024-06-07 09:11:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  HoraceX Lien <horacex.lien@intel.com>

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
   80b59ff832..665b223d57  665b223d57369d8b28dcdc81352428adfe435ff4 -> xen-tested-master

