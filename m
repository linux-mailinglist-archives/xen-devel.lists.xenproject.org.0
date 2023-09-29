Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3865A7B3204
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 14:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610504.949929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmCEH-0000oX-Co; Fri, 29 Sep 2023 12:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610504.949929; Fri, 29 Sep 2023 12:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmCEH-0000lv-9L; Fri, 29 Sep 2023 12:04:21 +0000
Received: by outflank-mailman (input) for mailman id 610504;
 Fri, 29 Sep 2023 12:04:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qmCEG-0000ll-5M; Fri, 29 Sep 2023 12:04:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qmCEF-0006Qa-VM; Fri, 29 Sep 2023 12:04:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qmCEF-0000NH-J5; Fri, 29 Sep 2023 12:04:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qmCEF-0007FL-Id; Fri, 29 Sep 2023 12:04:19 +0000
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
	bh=7hP4Eyx6AKnE9gvX0WriO2kYrbxz/c0e2yO/3JFUPro=; b=vcqyDBc9dMkvgYoGvjh31VAQls
	O8d+X/7cMdrrrMpytKeTeLqtOq+ELMvmK1j166mU7X4uV/vrLgcg0yKpwonzrh9OlmZra5ihc4S7o
	yCXoxagdHBAEgJL5m7HX9VAZ1YXCwt8OaniAZ5G+DhkmkUe6orYnawVTK3arygzzdjXI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183213-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183213: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a8ab67cae01eca7bba8627ce13429c59fda056f3
X-Osstest-Versions-That:
    xen=a363089e68ed677fef12c296253535753fe817e3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Sep 2023 12:04:19 +0000

flight 183213 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183213/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a8ab67cae01eca7bba8627ce13429c59fda056f3
baseline version:
 xen                  a363089e68ed677fef12c296253535753fe817e3

Last test of basis   183197  2023-09-28 00:02:01 Z    1 days
Testing same since   183213  2023-09-29 09:02:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>

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
   a363089e68..a8ab67cae0  a8ab67cae01eca7bba8627ce13429c59fda056f3 -> smoke

