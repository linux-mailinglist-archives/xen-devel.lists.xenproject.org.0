Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C789BD09
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 12:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701895.1096510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmCl-00071k-IO; Mon, 08 Apr 2024 10:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701895.1096510; Mon, 08 Apr 2024 10:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmCl-0006z7-FA; Mon, 08 Apr 2024 10:26:23 +0000
Received: by outflank-mailman (input) for mailman id 701895;
 Mon, 08 Apr 2024 10:26:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtmCk-0006yl-52; Mon, 08 Apr 2024 10:26:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtmCk-0002cw-1v; Mon, 08 Apr 2024 10:26:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtmCj-0006wR-MK; Mon, 08 Apr 2024 10:26:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rtmCj-00006E-Lp; Mon, 08 Apr 2024 10:26:21 +0000
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
	bh=JyD2f6CNMy1BV5EZIyGJrcGZLOZElcWWOmdi9ntoXV0=; b=Be3PGlY9OpFmro0sqO5N+A2iUo
	J4fWDnpMBRmqZ7UlEb/jszEtowUuaLrrxjFuULpy6p/ijR9eSj+UzL/hFJ16R4C7yEK4QjdN0P1Am
	xyy9D36fIxZbPje82up4isvKlHFO+JgYRK+mPFUqqe66hgGFo/aywyi9qVEle8NHRbcc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185273-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185273: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c079823df64c98dd7bb40fe77d9ef410e85a7624
X-Osstest-Versions-That:
    xen=402c2d3e66a6bc9481dcabfc8697750dc4beabed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Apr 2024 10:26:21 +0000

flight 185273 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185273/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c079823df64c98dd7bb40fe77d9ef410e85a7624
baseline version:
 xen                  402c2d3e66a6bc9481dcabfc8697750dc4beabed

Last test of basis   185251  2024-04-05 20:04:01 Z    2 days
Testing same since   185273  2024-04-08 08:00:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jason.andryuk@amd.com>
  Juergen Gross <jgross@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>

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
   402c2d3e66..c079823df6  c079823df64c98dd7bb40fe77d9ef410e85a7624 -> smoke

