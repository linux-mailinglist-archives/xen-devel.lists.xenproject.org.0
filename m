Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8186EEEB
	for <lists+xen-devel@lfdr.de>; Sat,  2 Mar 2024 06:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687852.1071666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgIKp-0006z9-Ch; Sat, 02 Mar 2024 05:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687852.1071666; Sat, 02 Mar 2024 05:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgIKp-0006xL-94; Sat, 02 Mar 2024 05:54:59 +0000
Received: by outflank-mailman (input) for mailman id 687852;
 Sat, 02 Mar 2024 05:54:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgIKn-0006wv-Ox; Sat, 02 Mar 2024 05:54:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgIKn-0003VP-KR; Sat, 02 Mar 2024 05:54:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgIKn-00046M-CO; Sat, 02 Mar 2024 05:54:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rgIKn-0002AY-Bu; Sat, 02 Mar 2024 05:54:57 +0000
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
	bh=Y6dIAOYw0sedwsSb/i264miSNQsRssnMiW21BQvLKFQ=; b=LMgpFuO31noBQs83ZHteqquOHH
	mG2EUR9sZpHXk1AhVtVXJxNvzMvhx2txk0p3cTpcNpbp+WPiH9FFNPMtcJJmdCCzBTutOWKug6BWq
	RNorPwE0jrTXrbrJtrrZPOO5KOTaordxsviBxh6unUkpZXjBcR+3XbnEyo9KlbH/8dWM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184839-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184839: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=856664f774bd5b66301c5f9022126b61b8cb492d
X-Osstest-Versions-That:
    xen=c40bc0576dcc5acd4d7e22ef628eb4642f568533
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 02 Mar 2024 05:54:57 +0000

flight 184839 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184839/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  856664f774bd5b66301c5f9022126b61b8cb492d
baseline version:
 xen                  c40bc0576dcc5acd4d7e22ef628eb4642f568533

Last test of basis   184837  2024-03-01 21:02:21 Z    0 days
Testing same since   184839  2024-03-02 02:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

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
   c40bc0576d..856664f774  856664f774bd5b66301c5f9022126b61b8cb492d -> smoke

