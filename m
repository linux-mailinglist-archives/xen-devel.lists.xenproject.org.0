Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748B5F3BAD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 05:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415141.659642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofYcS-0007qt-E6; Tue, 04 Oct 2022 03:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415141.659642; Tue, 04 Oct 2022 03:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofYcS-0007oN-BP; Tue, 04 Oct 2022 03:29:20 +0000
Received: by outflank-mailman (input) for mailman id 415141;
 Tue, 04 Oct 2022 03:29:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofYcQ-0007oD-Up; Tue, 04 Oct 2022 03:29:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofYcQ-0007rW-RR; Tue, 04 Oct 2022 03:29:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ofYcQ-0002ST-Bq; Tue, 04 Oct 2022 03:29:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ofYcQ-0003gC-98; Tue, 04 Oct 2022 03:29:18 +0000
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
	bh=KdkY6FMD1AZjUxmjRQBAy7n+8qJY5OgJp7+tkvu/fjQ=; b=Wa8ohPTFMhL4WJdFUFpX5jII86
	M6SKaVwA/SZUTLxVh429EusuXeWVtE+cDPevTkLjGRIQ1EGAv3VrLWf415Ej0XcypugAkbr+j590y
	IXZMUaDG0T+4Da5P+Kxus+z3Uov7cxABIfQLpg/b9MdZnWfdSAN1tzcUlmhdOPUFfuPc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173410-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173410: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3161231abcb461314b205337fbd0530c7ead1696
X-Osstest-Versions-That:
    xen=1666086b00442b23e4fd70f4971e3bcf1a16b124
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Oct 2022 03:29:18 +0000

flight 173410 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173410/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3161231abcb461314b205337fbd0530c7ead1696
baseline version:
 xen                  1666086b00442b23e4fd70f4971e3bcf1a16b124

Last test of basis   173387  2022-09-30 14:01:51 Z    3 days
Testing same since   173410  2022-10-04 01:01:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rahul Singh <rahul.singh@arm.com>
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
   1666086b00..3161231abc  3161231abcb461314b205337fbd0530c7ead1696 -> smoke

