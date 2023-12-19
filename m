Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D61818B37
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656985.1025544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFc0E-0005ci-6y; Tue, 19 Dec 2023 15:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656985.1025544; Tue, 19 Dec 2023 15:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFc0E-0005b3-4H; Tue, 19 Dec 2023 15:27:26 +0000
Received: by outflank-mailman (input) for mailman id 656985;
 Tue, 19 Dec 2023 15:27:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFc0C-0005at-Vx; Tue, 19 Dec 2023 15:27:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFc0C-0003xT-Mo; Tue, 19 Dec 2023 15:27:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFc0C-00008c-AJ; Tue, 19 Dec 2023 15:27:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFc0C-0001j2-9m; Tue, 19 Dec 2023 15:27:24 +0000
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
	bh=82G3lE3ylzQLa1CNao+X/hopa3sQ48lwUUNQPIk3yZg=; b=bS2i6b4BMLO5HWk8QwrC4hTpn2
	2DDdpAR7Uk3VDp4dwVL5VyzirAf8N0dc6r1gXFnjLsxcxHcFfmpPEk9a36LqLfKsnvBz11GN288nB
	fuXklLjxCu90ESOaSd3KIKqaoHhMFrGeVFgolUePzwrwYXGO/sDvOx1xU6UDEuU+oyPE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184174-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184174: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=05b6368ba01e07aa3b2b1f1856d77332971a7bdf
X-Osstest-Versions-That:
    xen=0cc74376d6823e0883f89556be2a267f2240a558
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Dec 2023 15:27:24 +0000

flight 184174 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184174/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  05b6368ba01e07aa3b2b1f1856d77332971a7bdf
baseline version:
 xen                  0cc74376d6823e0883f89556be2a267f2240a558

Last test of basis   184168  2023-12-18 15:03:58 Z    1 days
Testing same since   184174  2023-12-19 13:02:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   0cc74376d6..05b6368ba0  05b6368ba01e07aa3b2b1f1856d77332971a7bdf -> smoke

