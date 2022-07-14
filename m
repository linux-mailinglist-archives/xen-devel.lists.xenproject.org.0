Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E525E57511A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 16:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367682.598778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0Bl-0006Gl-7d; Thu, 14 Jul 2022 14:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367682.598778; Thu, 14 Jul 2022 14:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0Bl-0006Ej-44; Thu, 14 Jul 2022 14:51:37 +0000
Received: by outflank-mailman (input) for mailman id 367682;
 Thu, 14 Jul 2022 14:51:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oC0Bj-0006EZ-7v; Thu, 14 Jul 2022 14:51:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oC0Bj-00065B-6n; Thu, 14 Jul 2022 14:51:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oC0Bi-0006bu-Jf; Thu, 14 Jul 2022 14:51:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oC0Bi-0004jp-J8; Thu, 14 Jul 2022 14:51:34 +0000
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
	bh=59YvDnt27p9yC4BLNXr+EUSiBsw4IvfysDzkPhN6inM=; b=2kWPjSwqnE7hbrPtvfA/PtXggf
	XJWJg42Oc7/97RL/CSzWiQpK8gFsvJHk4xFSEuR+qXGCK3yuLdKCg2nKjCp96+kXQDHCrNVLBA3Ld
	ofTtqnG8uX7JPDk8MJWfllSi81jT8qPKT4sK7ydHzQ5HAmvRu4ebm4FY/+46XBNY8zd0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171629-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171629: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=355caa9ef29fd4bcdf48bc263e6ca3b24392490b
X-Osstest-Versions-That:
    xen=d8cb7e0f069e0f106d24941355b59b45a731eabe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Jul 2022 14:51:34 +0000

flight 171629 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171629/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  355caa9ef29fd4bcdf48bc263e6ca3b24392490b
baseline version:
 xen                  d8cb7e0f069e0f106d24941355b59b45a731eabe

Last test of basis   171602  2022-07-12 17:03:16 Z    1 days
Testing same since   171629  2022-07-14 12:02:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiamei Xie <jiamei.xie@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Xenia Ragiadakou <burzalodowa@gmail.com>

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
   d8cb7e0f06..355caa9ef2  355caa9ef29fd4bcdf48bc263e6ca3b24392490b -> smoke

