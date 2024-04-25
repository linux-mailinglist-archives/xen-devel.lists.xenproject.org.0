Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728908B2009
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 13:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712014.1112384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzx3S-00072Z-3k; Thu, 25 Apr 2024 11:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712014.1112384; Thu, 25 Apr 2024 11:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzx3S-00070B-0m; Thu, 25 Apr 2024 11:14:18 +0000
Received: by outflank-mailman (input) for mailman id 712014;
 Thu, 25 Apr 2024 11:14:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzx3Q-0006ym-Qc; Thu, 25 Apr 2024 11:14:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzx3Q-0002FE-ES; Thu, 25 Apr 2024 11:14:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzx3Q-0008QG-44; Thu, 25 Apr 2024 11:14:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzx3Q-00064k-2r; Thu, 25 Apr 2024 11:14:16 +0000
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
	bh=dfOep5k3pULmR50GX/IUSYAnkbaRozfUsPUNGVwySJ4=; b=jKNZTrpu17Oh9Xni3sTJMuHTn7
	ZM5pZBVA+hXn3/cvIi72oNv6vJihGRh9bRdLZxE0KtD7HujAUg322HnwmRBODbt0Y4VSL1gfJc9He
	uNT/QZekY/cmFAsTnWUEksNO+Ekj9hiVscC9agmGMwO+WARwVi7tGPoqx9CdFTStRqNI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185795-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185795: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=524eee7ce019da69df356a7bdd2174b94a6787b1
X-Osstest-Versions-That:
    xen=31d6b5b4a7c84818294dacca7a07e92f52393c9d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Apr 2024 11:14:16 +0000

flight 185795 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185795/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  524eee7ce019da69df356a7bdd2174b94a6787b1
baseline version:
 xen                  31d6b5b4a7c84818294dacca7a07e92f52393c9d

Last test of basis   185790  2024-04-25 01:00:22 Z    0 days
Testing same since   185795  2024-04-25 08:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Andryuk <jason.andryuk@amd.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Petr Beneš <w1benny@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   31d6b5b4a7..524eee7ce0  524eee7ce019da69df356a7bdd2174b94a6787b1 -> smoke

