Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A824784C1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 06:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248406.428503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my6E0-0007cV-Kh; Fri, 17 Dec 2021 05:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248406.428503; Fri, 17 Dec 2021 05:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my6E0-0007Zq-HD; Fri, 17 Dec 2021 05:56:12 +0000
Received: by outflank-mailman (input) for mailman id 248406;
 Fri, 17 Dec 2021 05:56:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1my6Dz-0007Zg-4e; Fri, 17 Dec 2021 05:56:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1my6Dz-0003aa-2M; Fri, 17 Dec 2021 05:56:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1my6Dy-0003O5-Q3; Fri, 17 Dec 2021 05:56:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1my6Dy-0002EP-Pc; Fri, 17 Dec 2021 05:56:10 +0000
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
	bh=avVmOLdGIOmgXSpgJ41Ner8CuC8XvX4IA5H05GVCbX8=; b=ZcWFikq5gtA/rs1Cd+2mU7A5gg
	+tY8QuD7I+dvnHHPN6oYuL3BjERJE8mRDaRPyIWRkslPVoJfY8eJew42V78jG+IKKILFoc4GkrEG7
	P4/yByvM0JYOmeqxM+RTsWo2o0g6ud404duQyY1UFrJuYhD8ps4DEO92yWc5lSfLqlbY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167456-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167456: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f3999bc2e099c571e4583bff8f494b834b2f5f76
X-Osstest-Versions-That:
    xen=4feacc95265a3d786753ed1532c77eb382630f78
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Dec 2021 05:56:10 +0000

flight 167456 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167456/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f3999bc2e099c571e4583bff8f494b834b2f5f76
baseline version:
 xen                  4feacc95265a3d786753ed1532c77eb382630f78

Last test of basis   167454  2021-12-16 22:00:27 Z    0 days
Testing same since   167456  2021-12-17 03:02:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Luca Fancellu <luca.fancellu@arm.com>

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
   4feacc9526..f3999bc2e0  f3999bc2e099c571e4583bff8f494b834b2f5f76 -> smoke

