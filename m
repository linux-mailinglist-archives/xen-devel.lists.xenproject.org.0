Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9450658750
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 23:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469566.728942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAewa-0005zG-Uf; Wed, 28 Dec 2022 22:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469566.728942; Wed, 28 Dec 2022 22:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAewa-0005wj-R9; Wed, 28 Dec 2022 22:30:40 +0000
Received: by outflank-mailman (input) for mailman id 469566;
 Wed, 28 Dec 2022 22:30:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAewY-0005wZ-SA; Wed, 28 Dec 2022 22:30:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAewY-0008TI-Lh; Wed, 28 Dec 2022 22:30:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pAewY-0006wa-7C; Wed, 28 Dec 2022 22:30:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pAewY-0000sB-6l; Wed, 28 Dec 2022 22:30:38 +0000
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
	bh=ae7EhsOGsyAEMDhiT7cj87smIWRtLZysjQ6oUKv+h4g=; b=isxriMNYrByAyH8AM0xBw6xUO5
	3nP7NDLXYb2DaL+6PART8eIxJeCOsSdeTnLQa/acc1ZS8hmYCqbOg988Fjy9qtm6hnaJEwaW9ARpo
	auzqEbwp0eHgLq6bXwHrpIYWEFn4xkHimMYV8MH2ZB8zoH16/aYVBjVSXCj2cyjqLPKw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175516-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175516: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7eef80e06ed2282bbcec3619d860c6aacb0515d8
X-Osstest-Versions-That:
    xen=84ece04e7f11fe30c2f83753d72f481610357ed0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Dec 2022 22:30:38 +0000

flight 175516 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175516/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7eef80e06ed2282bbcec3619d860c6aacb0515d8
baseline version:
 xen                  84ece04e7f11fe30c2f83753d72f481610357ed0

Last test of basis   175472  2022-12-23 18:00:27 Z    5 days
Testing same since   175516  2022-12-28 19:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Andrew Cooper <andrew.cooper3@citrix.com>

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
   84ece04e7f..7eef80e06e  7eef80e06ed2282bbcec3619d860c6aacb0515d8 -> smoke

