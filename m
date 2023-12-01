Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB1801675
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 23:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645780.1008119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9C6d-0006vS-O8; Fri, 01 Dec 2023 22:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645780.1008119; Fri, 01 Dec 2023 22:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9C6d-0006sc-KZ; Fri, 01 Dec 2023 22:35:31 +0000
Received: by outflank-mailman (input) for mailman id 645780;
 Fri, 01 Dec 2023 22:35:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r9C6c-0006sN-H2; Fri, 01 Dec 2023 22:35:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r9C6c-00029g-70; Fri, 01 Dec 2023 22:35:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r9C6b-0000cD-Ry; Fri, 01 Dec 2023 22:35:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r9C6b-0006qU-RV; Fri, 01 Dec 2023 22:35:29 +0000
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
	bh=UdQd5vJYjVNabZtBvJbbv34BdaYeFbxs+gMGWUNbE2k=; b=x4xoTiNVrmuhmgHGgLwyVbXVLk
	wPe+xbElT2kio+I3iT6+zdlzR5aJh7+L7TYUStsBcBqZaVkfHeLiTAtqS7/rMOzEi85kEpwzWbJHw
	U0TjyEqFrjJlnJpikh4XxEczdU0s25Hmmgp0ERbxlrmdTuK3LrANjtuc3XeYo03xC/k4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183968-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183968: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=525c7c094b258e8a46b494488eef96f5670eb352
X-Osstest-Versions-That:
    xen=1571ff7a987b88b20598a6d49910457f3b2c59f1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Dec 2023 22:35:29 +0000

flight 183968 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183968/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  525c7c094b258e8a46b494488eef96f5670eb352
baseline version:
 xen                  1571ff7a987b88b20598a6d49910457f3b2c59f1

Last test of basis   183963  2023-12-01 10:02:10 Z    0 days
Testing same since   183968  2023-12-01 20:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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
   1571ff7a98..525c7c094b  525c7c094b258e8a46b494488eef96f5670eb352 -> smoke

