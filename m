Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B878D5D4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 14:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592861.925695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbK7m-0008QM-IT; Wed, 30 Aug 2023 12:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592861.925695; Wed, 30 Aug 2023 12:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbK7m-0008PC-EO; Wed, 30 Aug 2023 12:16:42 +0000
Received: by outflank-mailman (input) for mailman id 592861;
 Wed, 30 Aug 2023 12:16:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbK7l-0008P2-He; Wed, 30 Aug 2023 12:16:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbK7k-0003Ix-W2; Wed, 30 Aug 2023 12:16:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbK7k-0004ad-HK; Wed, 30 Aug 2023 12:16:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbK7k-0007xv-Gm; Wed, 30 Aug 2023 12:16:40 +0000
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
	bh=PSvFw4AzT/3fiNkn2W4g2kpTSQn6zOlCVKhwEp1zeNY=; b=cSXUSJ8UcevjIidcPRBqIr4X7/
	JRraBFJFat/Z4XUDK89MEh4391ONBol6AQm5WQo0a6SdUuahiJndxQJPw8sL+Wn3c9BsX58EBzyP7
	Sa+7LT0q9vdcJJGtEBnONLmSyFRB6y2dZUlaNB/lRFBy1ezhQbiNiOZ4zixonaeuObSA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182565-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182565: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e5522c71beaa83f2f5d2118724ace9f90c22e583
X-Osstest-Versions-That:
    xen=8c01f267eff3d6c1ea04273e9885bf6d2fda1c44
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Aug 2023 12:16:40 +0000

flight 182565 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182565/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e5522c71beaa83f2f5d2118724ace9f90c22e583
baseline version:
 xen                  8c01f267eff3d6c1ea04273e9885bf6d2fda1c44

Last test of basis   182556  2023-08-29 15:00:28 Z    0 days
Testing same since   182565  2023-08-30 09:02:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Roger Pau Monné <roger.pau@citrix.com>
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
   8c01f267ef..e5522c71be  e5522c71beaa83f2f5d2118724ace9f90c22e583 -> smoke

