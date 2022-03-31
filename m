Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E54ED95A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296910.505580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtbT-0000YV-FS; Thu, 31 Mar 2022 12:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296910.505580; Thu, 31 Mar 2022 12:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtbT-0000WP-Ak; Thu, 31 Mar 2022 12:08:39 +0000
Received: by outflank-mailman (input) for mailman id 296910;
 Thu, 31 Mar 2022 12:08:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZtbR-0000WF-TS; Thu, 31 Mar 2022 12:08:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZtbR-00052d-R2; Thu, 31 Mar 2022 12:08:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZtbR-0007HM-FA; Thu, 31 Mar 2022 12:08:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nZtbR-0005v3-Eh; Thu, 31 Mar 2022 12:08:37 +0000
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
	bh=q+Sny8ic+ClU/7/EdTFeGePAGCpOuhC592otD9mwq8k=; b=cf6ksdaPCxsN5GUwV64v8XLgvm
	jmSciWCCqICZFKQyC5xNT//8eEzSGHHRhQhyy/qyxUYdv4eyUkAnjNM4f6P60GG2PkzB7+5DhmnWY
	7PMBXpWGK6xZVD4bITWaXypH9AcqjHH+/XwLQu1UMy5PZkKXAMvNVo7YRz+prAL5c0uk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169064-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169064: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8a87b9a0fb0564f9d68f0be0a0d1a17c34117b8b
X-Osstest-Versions-That:
    xen=8eec96b7b8d937d40e2e7988edb8bbd08598c715
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 31 Mar 2022 12:08:37 +0000

flight 169064 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169064/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8a87b9a0fb0564f9d68f0be0a0d1a17c34117b8b
baseline version:
 xen                  8eec96b7b8d937d40e2e7988edb8bbd08598c715

Last test of basis   168984  2022-03-29 14:00:29 Z    1 days
Testing same since   169064  2022-03-31 09:00:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bjoern Doebel <doebel@amazon.de>
  Jan Beulich <jbeulich@suse.com>

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
   8eec96b7b8..8a87b9a0fb  8a87b9a0fb0564f9d68f0be0a0d1a17c34117b8b -> smoke

