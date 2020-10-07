Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F6286810
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 21:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3811.11371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQElp-0003tx-9G; Wed, 07 Oct 2020 19:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3811.11371; Wed, 07 Oct 2020 19:06:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQElp-0003tY-64; Wed, 07 Oct 2020 19:06:37 +0000
Received: by outflank-mailman (input) for mailman id 3811;
 Wed, 07 Oct 2020 19:06:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQEln-0003t2-M4
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 19:06:35 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0ea0da2-34a5-42e7-b9a9-bb5e580fd770;
 Wed, 07 Oct 2020 19:06:24 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQElc-0004SA-CW; Wed, 07 Oct 2020 19:06:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQElc-0006kC-4l; Wed, 07 Oct 2020 19:06:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQElc-0004Ya-4H; Wed, 07 Oct 2020 19:06:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQEln-0003t2-M4
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 19:06:35 +0000
X-Inumbo-ID: c0ea0da2-34a5-42e7-b9a9-bb5e580fd770
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c0ea0da2-34a5-42e7-b9a9-bb5e580fd770;
	Wed, 07 Oct 2020 19:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=VSGkDq6t9iLFNfNU+AnREC3AiFJkMEYYzxmortSCXLc=; b=S1whXdmJJUhVaHI56ZDM7B5WQs
	q8rSE5DYV6gldW/eExTcDKoRTNrZaC9IdTZsu/GpayLBeHuUJ3CZa3kD2zJIE9NMqHr4SE4AvVjAY
	i61HlquCOAAzErkI6/lGQEtd/hYLPUpdTot1lbI4ESARz8qJcTO6yERy/bxScvRHOCi4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQElc-0004SA-CW; Wed, 07 Oct 2020 19:06:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQElc-0006kC-4l; Wed, 07 Oct 2020 19:06:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQElc-0004Ya-4H; Wed, 07 Oct 2020 19:06:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155521-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155521: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a
X-Osstest-Versions-That:
    xen=93508595d588afe9dca087f95200effb7cedc81f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Oct 2020 19:06:24 +0000

flight 155521 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155521/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a
baseline version:
 xen                  93508595d588afe9dca087f95200effb7cedc81f

Last test of basis   155495  2020-10-06 12:00:29 Z    1 days
Failing since        155517  2020-10-07 12:01:31 Z    0 days    2 attempts
Testing same since   155521  2020-10-07 16:00:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Wei Liu <wl@xen.org>

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
   93508595d5..7a519f8bda  7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a -> smoke

