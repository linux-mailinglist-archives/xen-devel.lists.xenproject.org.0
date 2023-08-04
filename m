Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E371476F983
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 07:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576787.903365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnFI-0005R1-Vi; Fri, 04 Aug 2023 05:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576787.903365; Fri, 04 Aug 2023 05:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnFI-0005Ou-Sg; Fri, 04 Aug 2023 05:21:04 +0000
Received: by outflank-mailman (input) for mailman id 576787;
 Fri, 04 Aug 2023 05:21:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRnFH-0005Ok-Hk; Fri, 04 Aug 2023 05:21:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRnFH-0000AB-G0; Fri, 04 Aug 2023 05:21:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qRnFG-0005Jb-VD; Fri, 04 Aug 2023 05:21:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qRnFG-0000ZU-UZ; Fri, 04 Aug 2023 05:21:02 +0000
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
	bh=W0CjFcT7JNEJD8kFmhfB1bETWHIkhvztXtVr163h8Ts=; b=zlwC4aYtdMKYmx+zGFfqPe4ruz
	UgODB2u9BtmBoCNDxObcBcJRxq+yrGaqfQATl/7zIfsifcoC7J05+NbuOwgM9Y3HVzcd+eseGXVQR
	EvYQPmMMNiEzVo6CzWJMxPZkgTTNihoHKdbrzH1y9M4balDmRdHRN3LC643pbxkPFOEA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182177-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182177: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=4a6448fd6497ad7952cd0baacec1869f6791de9e
X-Osstest-Versions-That:
    xen=092cae024ab6cd9bd5788eb6ca3ae1a05e796c0a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Aug 2023 05:21:02 +0000

flight 182177 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182177/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  4a6448fd6497ad7952cd0baacec1869f6791de9e
baseline version:
 xen                  092cae024ab6cd9bd5788eb6ca3ae1a05e796c0a

Last test of basis   182172  2023-08-03 19:02:02 Z    0 days
Testing same since   182177  2023-08-04 02:02:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Simone Ballarin <simone.ballarin@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   092cae024a..4a6448fd64  4a6448fd6497ad7952cd0baacec1869f6791de9e -> smoke

