Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D73363497
	for <lists+xen-devel@lfdr.de>; Sun, 18 Apr 2021 12:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112402.214562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lY4XX-0006Ay-TW; Sun, 18 Apr 2021 10:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112402.214562; Sun, 18 Apr 2021 10:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lY4XX-0006AZ-QC; Sun, 18 Apr 2021 10:20:31 +0000
Received: by outflank-mailman (input) for mailman id 112402;
 Sun, 18 Apr 2021 10:20:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lY4XX-0006AR-3U; Sun, 18 Apr 2021 10:20:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lY4XW-0007lZ-Sd; Sun, 18 Apr 2021 10:20:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lY4XW-0003B7-KL; Sun, 18 Apr 2021 10:20:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lY4XW-000105-Jq; Sun, 18 Apr 2021 10:20:30 +0000
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
	bh=c0IH6Oi48nfwR97NxjFBBbSGfdqZppJ+0T6EQYGjATc=; b=ZRCzE5u8Os2+buCQBeAoCXKEv3
	cDum71ACqbiKE17gesfB8FpnCQF5sFftVGEQQVecDzWNftcgawTUITumqww8P/YG/3bqGlJcLcPO+
	wZXkpFZpxeyA1u3Y3GbdAp2hE37T2Yg4g/WxNAlxPf8x2XbCSBCM5YK9QC8LQalGPi98=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161257-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161257: all pass - PUSHED
X-Osstest-Versions-This:
    xen=dd22a64de7e02b48312839a15179528c8f7db5c6
X-Osstest-Versions-That:
    xen=264aa183ad85b2779b27d1312724a291259ccc9f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Apr 2021 10:20:30 +0000

flight 161257 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161257/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  dd22a64de7e02b48312839a15179528c8f7db5c6
baseline version:
 xen                  264aa183ad85b2779b27d1312724a291259ccc9f

Last test of basis   161129  2021-04-14 09:19:54 Z    4 days
Testing same since   161257  2021-04-18 09:19:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Frédéric Pierret <frederic.pierret@qubes-os.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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
   264aa183ad..dd22a64de7  dd22a64de7e02b48312839a15179528c8f7db5c6 -> coverity-tested/smoke

