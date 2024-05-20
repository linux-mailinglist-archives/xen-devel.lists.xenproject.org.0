Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3778CA185
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 19:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726305.1130584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9750-0005nt-S1; Mon, 20 May 2024 17:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726305.1130584; Mon, 20 May 2024 17:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9750-0005lK-P8; Mon, 20 May 2024 17:45:46 +0000
Received: by outflank-mailman (input) for mailman id 726305;
 Mon, 20 May 2024 17:45:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s974z-0005lA-LV; Mon, 20 May 2024 17:45:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s974z-0007eu-H4; Mon, 20 May 2024 17:45:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s974z-00068Y-85; Mon, 20 May 2024 17:45:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s974z-00057P-7W; Mon, 20 May 2024 17:45:45 +0000
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
	bh=Zj0EgvfiTsn1yrpPLcXKMpVDAKwz7Je0ge4SGXisqNQ=; b=KkcZVHIkL73U2CtWOOKIxWYDUu
	LreZ8Ldf9IfcowiEA756kuweAkLoPXvfJQOIfWAtFmdGX3CSlafALLGESNc0l+7R8bvNm4hOESMHf
	oBP+UpDBHISWMHdUYuQUgYKJyftg3XuBxr44baPJJmI7QYX0JJUQLYORvpueuUkG/0rc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186046-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186046: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=54aa34fc89151c943550541e0af47664fb6e8676
X-Osstest-Versions-That:
    xen=21611c68702dae2e18cb519a6e166cdceeaff4ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 May 2024 17:45:45 +0000

flight 186046 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186046/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  54aa34fc89151c943550541e0af47664fb6e8676
baseline version:
 xen                  21611c68702dae2e18cb519a6e166cdceeaff4ca

Last test of basis   186024  2024-05-17 04:02:10 Z    3 days
Testing same since   186046  2024-05-20 14:00:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@cloud.com>
  Henry Wang <xin.wang2@amd.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   21611c6870..54aa34fc89  54aa34fc89151c943550541e0af47664fb6e8676 -> smoke

