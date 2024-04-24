Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CB8B00E0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 07:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711098.1110788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzUub-0005hY-SJ; Wed, 24 Apr 2024 05:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711098.1110788; Wed, 24 Apr 2024 05:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzUub-0005gk-NT; Wed, 24 Apr 2024 05:11:17 +0000
Received: by outflank-mailman (input) for mailman id 711098;
 Wed, 24 Apr 2024 05:11:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzUua-0005gY-Pp; Wed, 24 Apr 2024 05:11:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzUua-0001QU-Kg; Wed, 24 Apr 2024 05:11:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzUua-0001KK-BG; Wed, 24 Apr 2024 05:11:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzUua-0001jn-Ae; Wed, 24 Apr 2024 05:11:16 +0000
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
	bh=6lv+Cx6j+dGip4gaeyp2MF/F5NwP90ZifGwUW22QdB0=; b=AA2QW7eq6WaEK96sLDVbIGLz9M
	uPkD7d5Fwu9ysGjehUw7e9sd4nec5cgxHyVIDc6xgD61x8E8bHIHBCfnKAN6VPhwgU6wW1ODkZelj
	D911ic4chxDjxtXoh5HYr3zqHrnD4W+qzJsbNimxUawr7+WLNGKObEta/zep0fX2aF8c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185781-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185781: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=410ef3343924b5a3928bbe8e392491992b322cf0
X-Osstest-Versions-That:
    xen=77e25f0e30ddd11e043e6fce84bf108ce7de5b6f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Apr 2024 05:11:16 +0000

flight 185781 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185781/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  410ef3343924b5a3928bbe8e392491992b322cf0
baseline version:
 xen                  77e25f0e30ddd11e043e6fce84bf108ce7de5b6f

Last test of basis   185775  2024-04-23 20:00:26 Z    0 days
Testing same since   185781  2024-04-24 02:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Petr Beneš <w1benny@gmail.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   77e25f0e30..410ef33439  410ef3343924b5a3928bbe8e392491992b322cf0 -> smoke

