Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791F73FCFF2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 01:34:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175992.320398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLDFL-00007G-FJ; Tue, 31 Aug 2021 23:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175992.320398; Tue, 31 Aug 2021 23:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLDFL-0008W0-BR; Tue, 31 Aug 2021 23:32:51 +0000
Received: by outflank-mailman (input) for mailman id 175992;
 Tue, 31 Aug 2021 23:32:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLDFK-0008Vq-0K; Tue, 31 Aug 2021 23:32:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLDFJ-0000nS-3y; Tue, 31 Aug 2021 23:32:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLDFI-0006fM-QJ; Tue, 31 Aug 2021 23:32:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLDFI-0006V3-Po; Tue, 31 Aug 2021 23:32:48 +0000
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
	bh=rwkiF0wl7NBGZE+FPUZ3kqHqIAusSplzQDQbrZIXozE=; b=uy2lPQ4L/3aUdEoLZvY6biSoq+
	7MtJ+4vEP3eD0/Xvgcr7rd9tNswoCoUOWSJdTkEhX2ggpmCzv1ajdoJB+/tB3Z1f05hEt5f7wSVz1
	lZigwDHBVP+VpLpch0GI7hdOODDJsm3uK8n4nWCuKF/eUtCGJiLv1UAbf1zl2GTga6Oc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164684-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 164684: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=96607a8e680e7f965ca868d11f8b0636317d2618
X-Osstest-Versions-That:
    xen=6b4f6a31ace125d658a581e8d10809e4fccdc272
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Aug 2021 23:32:48 +0000

flight 164684 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164684/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  96607a8e680e7f965ca868d11f8b0636317d2618
baseline version:
 xen                  6b4f6a31ace125d658a581e8d10809e4fccdc272

Last test of basis   164682  2021-08-31 16:02:54 Z    0 days
Testing same since   164684  2021-08-31 20:01:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Fabrice Fontaine <fontaine.fabrice@gmail.com>
  Ian Jackson <iwj@xenproject.org>

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
   6b4f6a31ac..96607a8e68  96607a8e680e7f965ca868d11f8b0636317d2618 -> smoke

