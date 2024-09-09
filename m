Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE9971E32
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 17:39:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794708.1203778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sngTI-0006dB-Ni; Mon, 09 Sep 2024 15:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794708.1203778; Mon, 09 Sep 2024 15:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sngTI-0006ad-Jd; Mon, 09 Sep 2024 15:38:32 +0000
Received: by outflank-mailman (input) for mailman id 794708;
 Mon, 09 Sep 2024 15:38:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sngTH-0006aS-06; Mon, 09 Sep 2024 15:38:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sngTG-0001My-T1; Mon, 09 Sep 2024 15:38:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sngTG-0005bp-LS; Mon, 09 Sep 2024 15:38:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sngTG-0002PN-Kr; Mon, 09 Sep 2024 15:38:30 +0000
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
	bh=MPqwWdGL/V/KGneYq8NkX65hh4m9EaTz52P5nXbAUbU=; b=ubQktRZsAeHm4WOwBcPR2inz5/
	NkoVFHnb98GoE1lkdtzrANIvsiLt8N9FYJWQeJDNMO81DNnKUtD+huobKRcmzf59UfEMOvqpwk4oh
	IXXU9urPVIFSoaOQpnb7luN8mEPA0Aksdteblhk7gKaPoq8RLLSUl8ijo7RVpZ3njrLU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187607-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187607: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=4e56d0a9f9c5612c724299136c8ef55bc436419b
X-Osstest-Versions-That:
    xen=65e4bc585c28b50ec76f679e1001a81fea9d690b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2024 15:38:30 +0000

flight 187607 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187607/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  4e56d0a9f9c5612c724299136c8ef55bc436419b
baseline version:
 xen                  65e4bc585c28b50ec76f679e1001a81fea9d690b

Last test of basis   187544  2024-09-06 18:02:14 Z    2 days
Testing same since   187607  2024-09-09 12:05:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Huang Rui <ray.huang@amd.com>
  Jan Beulich <jbeulich@suse.com>
  Jiqian Chen <Jiqian.Chen@amd.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   65e4bc585c..4e56d0a9f9  4e56d0a9f9c5612c724299136c8ef55bc436419b -> smoke

