Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A759141D060
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 02:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199355.353357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVjUX-0005xd-58; Thu, 30 Sep 2021 00:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199355.353357; Thu, 30 Sep 2021 00:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVjUW-0005vW-UI; Thu, 30 Sep 2021 00:00:00 +0000
Received: by outflank-mailman (input) for mailman id 199355;
 Wed, 29 Sep 2021 23:59:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVjUU-0005vF-Ox; Wed, 29 Sep 2021 23:59:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVjUU-0003dV-I5; Wed, 29 Sep 2021 23:59:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVjUU-0005PW-5m; Wed, 29 Sep 2021 23:59:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVjUU-0005P1-5G; Wed, 29 Sep 2021 23:59:58 +0000
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
	bh=iwxLUdfieLDS7vzX6Z+GCqoTdmu+AFPGPDzfpD/HkJE=; b=bYa07OsIrs3q2S44M0hGAKTUmQ
	V5XY94AWh08m9EKZhfw7cCUC70iNLEDV2TuaPIaEJhxi55J4Px0wpYOyGif9XVdztryQL3m4NfAiE
	e4kMcsoL/OnI63dkwAbclpffGTFm7VaRs12B68zmSaQAVStAC1yNQRfwRw38EckIleZc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165317-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 165317: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ab4a83023eda9f04ad864877c1956b087ec6fc4f
X-Osstest-Versions-That:
    xen=890ceb9453171c85e881103e65dbb5cdcf81659e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Sep 2021 23:59:58 +0000

flight 165317 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165317/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ab4a83023eda9f04ad864877c1956b087ec6fc4f
baseline version:
 xen                  890ceb9453171c85e881103e65dbb5cdcf81659e

Last test of basis   165233  2021-09-28 12:00:26 Z    1 days
Failing since        165243  2021-09-28 17:00:26 Z    1 days    2 attempts
Testing same since   165317  2021-09-29 20:22:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
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
   890ceb9453..ab4a83023e  ab4a83023eda9f04ad864877c1956b087ec6fc4f -> smoke

