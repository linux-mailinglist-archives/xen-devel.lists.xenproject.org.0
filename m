Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E756D13BD
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 01:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516916.801815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi21m-0003Cj-Uc; Thu, 30 Mar 2023 23:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516916.801815; Thu, 30 Mar 2023 23:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi21m-0003Ao-S0; Thu, 30 Mar 2023 23:49:58 +0000
Received: by outflank-mailman (input) for mailman id 516916;
 Thu, 30 Mar 2023 23:49:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi21l-0003Ae-8T; Thu, 30 Mar 2023 23:49:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi21l-0007xb-5O; Thu, 30 Mar 2023 23:49:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pi21k-00041c-VH; Thu, 30 Mar 2023 23:49:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pi21k-0007rq-Ur; Thu, 30 Mar 2023 23:49:56 +0000
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
	bh=grwAg1fZ16O21Qy+tt6mHTklhdOOG4v3kbOAfESx71s=; b=7PCkOITprKjC0/oVS59RwInLeo
	9mHePxdKxuGlbDzbIHsEXPZGjl04cur/jGFH2kXqHwHLYzmGnsv+XmMssslHlU86DBi4m/DRyrXSm
	sxc+NhyLZmYLowhNRTUo98ch18w/H5njZha2yFuUibzIDj0xa5ry3XC99K7NlsoRCoN4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180076-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180076: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=64c21916167e6269280929fab1202537b54b13cf
X-Osstest-Versions-That:
    xen=12c5eea3ca6fa2674726d62cc9f369f81861d23f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Mar 2023 23:49:56 +0000

flight 180076 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180076/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  64c21916167e6269280929fab1202537b54b13cf
baseline version:
 xen                  12c5eea3ca6fa2674726d62cc9f369f81861d23f

Last test of basis   180068  2023-03-30 16:01:56 Z    0 days
Testing same since   180072  2023-03-30 20:00:24 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   12c5eea3ca..64c2191616  64c21916167e6269280929fab1202537b54b13cf -> smoke

