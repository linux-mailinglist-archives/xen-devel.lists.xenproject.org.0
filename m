Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DDC85125A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 12:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679544.1057016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZUak-0007y3-57; Mon, 12 Feb 2024 11:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679544.1057016; Mon, 12 Feb 2024 11:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZUak-0007w2-28; Mon, 12 Feb 2024 11:35:18 +0000
Received: by outflank-mailman (input) for mailman id 679544;
 Mon, 12 Feb 2024 11:35:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rZUaj-0007vs-Gs; Mon, 12 Feb 2024 11:35:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rZUaj-0003Os-FA; Mon, 12 Feb 2024 11:35:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rZUaj-0003Xt-1U; Mon, 12 Feb 2024 11:35:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rZUaj-0003Ve-10; Mon, 12 Feb 2024 11:35:17 +0000
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
	bh=kgmUF9n79q8qvoNpcROxqvgH/W0LnXu5CnQ76HB8EwI=; b=qlhwLkDbCLFibLskrdJUekst5i
	HQOiAw5kJRoy0QqcTo0d99JkEfOCG2VqlxM6ZaUNzCvLA1ifetB/kFkPimpcgcXl+y0bhEhG0cWOg
	eBi46l4KgrCuX8fQ2x3SCI6WiHv5bSfoowPWmcOLfk8GTpTxfYeQ9IC/zVwl3aeAslVw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184650-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184650: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=772380f7547bac7e4c10c9ceff87af3f54151ae5
X-Osstest-Versions-That:
    xen=4e5bd87d24ac2b08f33c6a9c0d530daef99ed369
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Feb 2024 11:35:17 +0000

flight 184650 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184650/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  772380f7547bac7e4c10c9ceff87af3f54151ae5
baseline version:
 xen                  4e5bd87d24ac2b08f33c6a9c0d530daef99ed369

Last test of basis   184634  2024-02-09 08:02:06 Z    3 days
Testing same since   184650  2024-02-12 09:02:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Petr Beneš <w1benny@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Simone Ballarin <simone.ballarin@bugseng.com>

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
   4e5bd87d24..772380f754  772380f7547bac7e4c10c9ceff87af3f54151ae5 -> smoke

