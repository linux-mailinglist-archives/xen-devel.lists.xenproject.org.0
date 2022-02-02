Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA74A7139
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264126.457123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFKZ-0005Ux-VH; Wed, 02 Feb 2022 13:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264126.457123; Wed, 02 Feb 2022 13:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFKZ-0005Rh-Rk; Wed, 02 Feb 2022 13:05:51 +0000
Received: by outflank-mailman (input) for mailman id 264126;
 Wed, 02 Feb 2022 13:05:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFFKX-0005Qs-Ui; Wed, 02 Feb 2022 13:05:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFFKX-0001k7-Oi; Wed, 02 Feb 2022 13:05:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFFKX-0003Wo-C1; Wed, 02 Feb 2022 13:05:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nFFKX-0002Zc-BY; Wed, 02 Feb 2022 13:05:49 +0000
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
	bh=kfKJ5jqEn3HPGQlry0Sr8NagIX4MCrKkt0orh+Yz65g=; b=YIXN7IXJeSPC874IzczFphtxUq
	E7f+xpLv8OMabqlMgW3Tyw+5sspH/CKD1YGHXOd1bxvwzESpWQQtjKanfx9RQX4/Dmu/0dyRl7XlL
	kC9Zc1p/c43L6FWFyeJeVJtd3qki4NDGF9zc0Cz30w7kjaLe+1rbjoxM8OB2djftTe3A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167985-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167985: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b17e0ec72eded037297f34a233655aad23f64711
X-Osstest-Versions-That:
    xen=9ce3ef20b4f085a7dc8ee41b0fec6fdeced3773e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Feb 2022 13:05:49 +0000

flight 167985 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167985/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b17e0ec72eded037297f34a233655aad23f64711
baseline version:
 xen                  9ce3ef20b4f085a7dc8ee41b0fec6fdeced3773e

Last test of basis   167977  2022-02-01 18:00:26 Z    0 days
Testing same since   167985  2022-02-02 10:00:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Jan Beulich <jbeulich@suse.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sergey Temerkhanov <s.temerkhanov@gmail.com>

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
   9ce3ef20b4..b17e0ec72e  b17e0ec72eded037297f34a233655aad23f64711 -> smoke

