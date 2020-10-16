Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CB290B0D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 20:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8215.21906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTU3q-0000vW-M5; Fri, 16 Oct 2020 18:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8215.21906; Fri, 16 Oct 2020 18:02:38 +0000
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
	id 1kTU3q-0000v7-Ij; Fri, 16 Oct 2020 18:02:38 +0000
Received: by outflank-mailman (input) for mailman id 8215;
 Fri, 16 Oct 2020 18:02:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kTU3p-0000uz-45
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 18:02:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9595c499-7def-4a44-adc8-9d87c05bd8a7;
 Fri, 16 Oct 2020 18:02:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTU3n-0003DB-FP; Fri, 16 Oct 2020 18:02:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTU3n-00029G-86; Fri, 16 Oct 2020 18:02:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kTU3n-0007EU-7c; Fri, 16 Oct 2020 18:02:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kTU3p-0000uz-45
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 18:02:37 +0000
X-Inumbo-ID: 9595c499-7def-4a44-adc8-9d87c05bd8a7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9595c499-7def-4a44-adc8-9d87c05bd8a7;
	Fri, 16 Oct 2020 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=GeUUBp+A+ur2mDpyvAUgs58gSRlc3jKHuu05VfX0M5U=; b=ifb4jca7wf2q5+zZHI5o7pG1l4
	zP87dE/c/f4gB3vGHIDphy2Gxg3EbaG47sBf72SEdbC0DUfyMXAnO6FLfWvCggURidskZPp9Ewldp
	NXstwCdDs/vFg49FTUZT++MoRQN3+18/FT2uXsXk4hC7noz1QiQksxrUuQFU0qMGDyFE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTU3n-0003DB-FP; Fri, 16 Oct 2020 18:02:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTU3n-00029G-86; Fri, 16 Oct 2020 18:02:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTU3n-0007EU-7c; Fri, 16 Oct 2020 18:02:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155900-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155900: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0dfddb2116e3757f77a691a3fe335173088d69dc
X-Osstest-Versions-That:
    xen=a7952a320c1e202a218702bfdb14f75132f04894
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Oct 2020 18:02:35 +0000

flight 155900 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155900/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0dfddb2116e3757f77a691a3fe335173088d69dc
baseline version:
 xen                  a7952a320c1e202a218702bfdb14f75132f04894

Last test of basis   155895  2020-10-16 12:00:27 Z    0 days
Testing same since   155900  2020-10-16 15:04:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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
   a7952a320c..0dfddb2116  0dfddb2116e3757f77a691a3fe335173088d69dc -> smoke

