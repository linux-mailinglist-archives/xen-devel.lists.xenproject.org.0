Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CEE547625
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 17:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347278.573533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o037o-0003uL-2h; Sat, 11 Jun 2022 15:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347278.573533; Sat, 11 Jun 2022 15:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o037n-0003sI-Vg; Sat, 11 Jun 2022 15:34:07 +0000
Received: by outflank-mailman (input) for mailman id 347278;
 Sat, 11 Jun 2022 15:34:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o037m-0003s8-Re; Sat, 11 Jun 2022 15:34:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o037m-0003Gw-OM; Sat, 11 Jun 2022 15:34:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o037m-0002bz-Cv; Sat, 11 Jun 2022 15:34:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o037m-000841-CQ; Sat, 11 Jun 2022 15:34:06 +0000
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
	bh=Jw6SepiDsxKhMkGYiVlyGP/mjEb1lxGJwBJd5+B0WB0=; b=i/dHEVDokoThqjbJEZl1XfZtsq
	BFQiEFN0QHKdlOj5B7lAbOHL6UZsgVD/3YjaqbpF/qxHvBqe3+me7RIXvpsM6j/dkwDL+yttRjyBu
	GtCAjkzE4Ov5guMptJepCV656L6jWnGpzvYkqIxA/BGZxgbXv/ey4oJW+JWCeEEkuDVg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171079-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171079: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c9a707df83aad17a6fcf2e8330ab3b5bead6fb8b
X-Osstest-Versions-That:
    xen=e051b5cd1043cc1aad506faace824e6aacc887bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Jun 2022 15:34:06 +0000

flight 171079 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171079/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c9a707df83aad17a6fcf2e8330ab3b5bead6fb8b
baseline version:
 xen                  e051b5cd1043cc1aad506faace824e6aacc887bf

Last test of basis   170978  2022-06-11 00:00:28 Z    0 days
Testing same since   171079  2022-06-11 12:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hongyan Xia <hongyxia@amazon.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Liu <wei.liu2@citrix.com>

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
   e051b5cd10..c9a707df83  c9a707df83aad17a6fcf2e8330ab3b5bead6fb8b -> smoke

