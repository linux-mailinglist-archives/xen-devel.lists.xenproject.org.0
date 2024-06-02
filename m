Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE98D73D8
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 06:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734394.1140575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDcuz-0001r4-5H; Sun, 02 Jun 2024 04:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734394.1140575; Sun, 02 Jun 2024 04:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDcuy-0001oa-UT; Sun, 02 Jun 2024 04:34:04 +0000
Received: by outflank-mailman (input) for mailman id 734394;
 Sun, 02 Jun 2024 04:34:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDcux-0001oQ-EO; Sun, 02 Jun 2024 04:34:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDcux-0005fG-73; Sun, 02 Jun 2024 04:34:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDcuw-0004Ge-7c; Sun, 02 Jun 2024 04:34:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sDcuv-0000QF-UC; Sun, 02 Jun 2024 04:34:01 +0000
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
	bh=BKv9qKg5g6VVTDz4NSGRQ9qIIuqk7Rvq7UM1DZhFoms=; b=5GdUn/Y2RPEOdOuVWaP03VaKRn
	yQGRwlxafgBOeTIV2m7BFVm5/p9E1HjTf5d2GbFuv+hqf/JZdMVXItHSGsJLjCp5+6rhfqWJyE0bM
	x2Iw2M/VwEe7a0xNr+a2BqxjUKvTCXCvDA4GrZei4w3iHzFSrvBAaM1sdtHX4k/2eFc8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186227-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186227: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=de2330450ff71df5a609fe48e2153eb4854d9359
X-Osstest-Versions-That:
    ovmf=7339bfeffa3fa30b18dce86409c0112039bacec5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 Jun 2024 04:34:01 +0000

flight 186227 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186227/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 de2330450ff71df5a609fe48e2153eb4854d9359
baseline version:
 ovmf                 7339bfeffa3fa30b18dce86409c0112039bacec5

Last test of basis   186219  2024-06-01 06:14:48 Z    0 days
Testing same since   186227  2024-06-02 02:11:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Du Lin <du.lin@intel.com>

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
   7339bfeffa..de2330450f  de2330450ff71df5a609fe48e2153eb4854d9359 -> xen-tested-master

