Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B01C8B2E89
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 04:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712362.1113005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Avs-000378-10; Fri, 26 Apr 2024 02:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712362.1113005; Fri, 26 Apr 2024 02:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Avr-00034w-U5; Fri, 26 Apr 2024 02:03:23 +0000
Received: by outflank-mailman (input) for mailman id 712362;
 Fri, 26 Apr 2024 02:03:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0Avq-00034l-95; Fri, 26 Apr 2024 02:03:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0Avq-0002Gy-2n; Fri, 26 Apr 2024 02:03:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s0Avp-0003xL-Mh; Fri, 26 Apr 2024 02:03:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s0Avp-0004n7-MH; Fri, 26 Apr 2024 02:03:21 +0000
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
	bh=uO6zYn6eGwBn06wgN0Bm1z+sbO/1/ac+q5UgVYu6RQI=; b=2ZtF2v2NTCUq2l6O1a+6BiSDCC
	Z3aOO58ddkQXMJi33GMs+L1VZH65AVc/n7If8nL5/Y35ZZSf4GzJs40V/3FAIEC0voafdbhO3sjrI
	8qsGCcX1flyC9u8guMiHt9QQmStksZhxo7qFCJ9W0oJ2mKY1Xs4opi0R+gFXCw/dnp1M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185801-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185801: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=232ee07c23b23fbbafbbf27e475dbbc5b27e4bbb
X-Osstest-Versions-That:
    xen=23cd1207e7f6ee3e51fb42e11dba8d7cdb28e1e5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Apr 2024 02:03:21 +0000

flight 185801 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185801/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  232ee07c23b23fbbafbbf27e475dbbc5b27e4bbb
baseline version:
 xen                  23cd1207e7f6ee3e51fb42e11dba8d7cdb28e1e5

Last test of basis   185799  2024-04-25 17:02:07 Z    0 days
Testing same since   185801  2024-04-25 21:02:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Michal Orzel <michal.orzel@amd.com>
  Simone Ballarin <simone.ballarin@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@amd.com>

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
   23cd1207e7..232ee07c23  232ee07c23b23fbbafbbf27e475dbbc5b27e4bbb -> smoke

