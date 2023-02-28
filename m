Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552B6A5CE2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503530.775801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2aq-00051w-Kv; Tue, 28 Feb 2023 16:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503530.775801; Tue, 28 Feb 2023 16:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2aq-00050E-HP; Tue, 28 Feb 2023 16:12:44 +0000
Received: by outflank-mailman (input) for mailman id 503530;
 Tue, 28 Feb 2023 16:12:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pX2ap-000504-OU; Tue, 28 Feb 2023 16:12:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pX2ap-0005wy-Ku; Tue, 28 Feb 2023 16:12:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pX2ap-0006yF-7g; Tue, 28 Feb 2023 16:12:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pX2ap-0007Y1-77; Tue, 28 Feb 2023 16:12:43 +0000
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
	bh=6Y4SHHTbwS0IqZzusJiNPQStbh9Gy+ssQEFmc//5ipM=; b=kHPAbHPy33Dl18Va9Vp2vO3r1M
	s02Ok0RDykENF5ZYLM/bLR34fjKSPqN/TDAT5iV+c9JxIAdN5dfz+6gR1QtThImygF2I2R8Nf7Ljh
	2Od1vhr1n067y3JUiE0I46rOckBUBsZZ+pTpwkhoGBfx9FPrEbXeHFwp9zDFu/svR0As=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178776-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 178776: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=a4557f515fb002010b34b79102278ea03d6b31a3
X-Osstest-Versions-That:
    xen=bfc3780f23ded229f42a2565783e21c32083bbfd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Feb 2023 16:12:43 +0000

flight 178776 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178776/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  a4557f515fb002010b34b79102278ea03d6b31a3
baseline version:
 xen                  bfc3780f23ded229f42a2565783e21c32083bbfd

Last test of basis   178708  2023-02-27 23:00:25 Z    0 days
Testing same since   178776  2023-02-28 14:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>
  Sergey Dyasli <sergey.dyasli@citrix.com>

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
   bfc3780f23..a4557f515f  a4557f515fb002010b34b79102278ea03d6b31a3 -> smoke

