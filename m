Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728E3C16D8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 18:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153217.283062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1WVb-0003y9-OX; Thu, 08 Jul 2021 16:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153217.283062; Thu, 08 Jul 2021 16:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1WVb-0003vk-LC; Thu, 08 Jul 2021 16:04:15 +0000
Received: by outflank-mailman (input) for mailman id 153217;
 Thu, 08 Jul 2021 16:04:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1WVZ-0003va-7w; Thu, 08 Jul 2021 16:04:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1WVZ-0001p1-4N; Thu, 08 Jul 2021 16:04:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1WVY-00047f-QP; Thu, 08 Jul 2021 16:04:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m1WVY-0006IE-Pu; Thu, 08 Jul 2021 16:04:12 +0000
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
	bh=HlUguLbtyv4ITligAphxB8G565XhEL609HoMzLkTt1I=; b=elYrFGMhlgnqP6qc83R5PCScQ/
	X728HndjhzTLLIqEeg9ucWpPYdZ+Bo/yskwLbOEDDG2eBPHKOyy8QLeT2cP1CHRQDuWl2M1Ze1f90
	5bJHRXqIHcS72Q3lXZN/yPI5utTKR5LxmzkjxSnzTqTAQItm3DnlTEx9MMl42rwNeYAs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163445-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 163445: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0f435e2b58543f5baae96e17a10ae20d3dbc28fa
X-Osstest-Versions-That:
    xen=484910bf41fec2c80d79ed9c5c33831bee7318f0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Jul 2021 16:04:12 +0000

flight 163445 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163445/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0f435e2b58543f5baae96e17a10ae20d3dbc28fa
baseline version:
 xen                  484910bf41fec2c80d79ed9c5c33831bee7318f0

Last test of basis   163422  2021-07-07 23:01:39 Z    0 days
Testing same since   163445  2021-07-08 13:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Olaf Hering <olaf@aepfle.de>

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
   484910bf41..0f435e2b58  0f435e2b58543f5baae96e17a10ae20d3dbc28fa -> smoke

