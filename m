Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CCF75A4DD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 05:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566328.885031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMKcN-0001RA-L4; Thu, 20 Jul 2023 03:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566328.885031; Thu, 20 Jul 2023 03:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMKcN-0001O3-IK; Thu, 20 Jul 2023 03:46:19 +0000
Received: by outflank-mailman (input) for mailman id 566328;
 Thu, 20 Jul 2023 03:46:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMKcM-0001Nt-6Z; Thu, 20 Jul 2023 03:46:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMKcM-0006LU-0Y; Thu, 20 Jul 2023 03:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMKcL-0006DV-6w; Thu, 20 Jul 2023 03:46:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qMKcL-0003sH-6W; Thu, 20 Jul 2023 03:46:17 +0000
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
	bh=2VM8QWdU2w4OStIYyHhohGhfpVsIxeIE8GVsF6YKJPo=; b=iy4eRkX7StABZiJ28IkHy8GP+E
	A1gZKvipIEbQHaqJ/VJeIse0QnheEEOrmnRvQx7xwUmzUZsaUyhZE8SNSvM+1L1vQ68r2hIUa8qV5
	rGej7PF2EwwqKvzWyc43O/Ymyb+t00XBx0O0RlUAfJiVz1w6Cmc4QDEKbCHlKVpuFV3c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181916-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181916: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6510dcf6f71adbe282bff0ba2b236f1d074f819f
X-Osstest-Versions-That:
    ovmf=a52044a9e602bc168cdf5d73a48952bfc9edb521
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jul 2023 03:46:17 +0000

flight 181916 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181916/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6510dcf6f71adbe282bff0ba2b236f1d074f819f
baseline version:
 ovmf                 a52044a9e602bc168cdf5d73a48952bfc9edb521

Last test of basis   181907  2023-07-19 17:44:03 Z    0 days
Testing same since   181916  2023-07-20 01:41:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  devel@edk2.groups.io <devel@edk2.groups.io>
  Michael D Kinney <michael.d.kinney@intel.com>
  Nickle Wang <nicklew@nvidia.com>

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
   a52044a9e6..6510dcf6f7  6510dcf6f71adbe282bff0ba2b236f1d074f819f -> xen-tested-master

