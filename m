Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10D96A44E0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502638.774524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeib-0003JO-CC; Mon, 27 Feb 2023 14:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502638.774524; Mon, 27 Feb 2023 14:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeib-0003Gw-9Y; Mon, 27 Feb 2023 14:43:09 +0000
Received: by outflank-mailman (input) for mailman id 502638;
 Mon, 27 Feb 2023 14:43:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pWeiZ-0003F8-Kx; Mon, 27 Feb 2023 14:43:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pWeiZ-0002TI-JX; Mon, 27 Feb 2023 14:43:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pWeiZ-0006gU-9h; Mon, 27 Feb 2023 14:43:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pWeiZ-0000mJ-9D; Mon, 27 Feb 2023 14:43:07 +0000
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
	bh=ezC0/KVWrMCkYpHUtqDJ1Tk2awQ8YT3MD68P92rueI8=; b=czaEmfD5hhCYc0aElHQRDF7/xZ
	m1qPie0Pjd2DacylEfapDsU1pVNUL/PCOibUv96zV31lHU/eNE3nQ4YHOyOPrFU6hFMjl7L34qh8T
	ilgWUHQldiEst5c5/mMQ3lz5G5zTaSWS4/cRfqIa4cnNyuB9jNfHBc/szEruHZ09MpSU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178663-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 178663: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=4d6df4ec7544d7c912ffab6b6edb4cbefaa01f4c
X-Osstest-Versions-That:
    xen=608f85a1818697156b72ace4913a17c8178a0ef5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 27 Feb 2023 14:43:07 +0000

flight 178663 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178663/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  4d6df4ec7544d7c912ffab6b6edb4cbefaa01f4c
baseline version:
 xen                  608f85a1818697156b72ace4913a17c8178a0ef5

Last test of basis   178391  2023-02-24 21:00:27 Z    2 days
Testing same since   178663  2023-02-27 13:03:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          starved 
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
   608f85a181..4d6df4ec75  4d6df4ec7544d7c912ffab6b6edb4cbefaa01f4c -> smoke

