Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CB29FB12
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 03:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15375.38356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYJt2-00070D-U0; Fri, 30 Oct 2020 02:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15375.38356; Fri, 30 Oct 2020 02:11:28 +0000
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
	id 1kYJt2-0006zo-Qk; Fri, 30 Oct 2020 02:11:28 +0000
Received: by outflank-mailman (input) for mailman id 15375;
 Fri, 30 Oct 2020 02:11:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mU6k=EF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kYJt1-0006zj-Bc
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 02:11:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c1bc3e6-a747-4d4d-b379-0c381c7a1a0b;
 Fri, 30 Oct 2020 02:11:26 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYJsz-0002ai-L8; Fri, 30 Oct 2020 02:11:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kYJsz-0002jq-Ba; Fri, 30 Oct 2020 02:11:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kYJsz-0003Tr-AA; Fri, 30 Oct 2020 02:11:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mU6k=EF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kYJt1-0006zj-Bc
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 02:11:27 +0000
X-Inumbo-ID: 1c1bc3e6-a747-4d4d-b379-0c381c7a1a0b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1c1bc3e6-a747-4d4d-b379-0c381c7a1a0b;
	Fri, 30 Oct 2020 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=CFjsfB+EBBad1Hq7300KoL78GeKijXKt6uRTspNvVO8=; b=o90yJytScPyUwUu+AO/GNnsjzD
	EUasA56+s+gaY75/ET3ELAARvT/pfhnhJ/mgiea6CL6SPfzz38e7Z2+vMnj3jlx5Lt1U6Qm6wtFLJ
	kDI5COx/mmR32524UCqoOeCEUoTnRkZPmlvpg6/oJYX5JW6Ma/s9kxvGmeHI6q1JjGSQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYJsz-0002ai-L8; Fri, 30 Oct 2020 02:11:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYJsz-0002jq-Ba; Fri, 30 Oct 2020 02:11:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kYJsz-0003Tr-AA; Fri, 30 Oct 2020 02:11:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156310-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156310: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6e2ee3dfd660d9fde96243da7d565244b4d2f164
X-Osstest-Versions-That:
    xen=26a8fa494f2f323622b6928bd15921b41818f180
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Oct 2020 02:11:25 +0000

flight 156310 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156310/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6e2ee3dfd660d9fde96243da7d565244b4d2f164
baseline version:
 xen                  26a8fa494f2f323622b6928bd15921b41818f180

Last test of basis   156304  2020-10-29 20:00:26 Z    0 days
Testing same since   156310  2020-10-30 00:01:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   26a8fa494f..6e2ee3dfd6  6e2ee3dfd660d9fde96243da7d565244b4d2f164 -> smoke

