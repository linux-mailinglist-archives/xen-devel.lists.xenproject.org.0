Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482C7A4FB0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 18:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604141.941369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiHQm-000265-7B; Mon, 18 Sep 2023 16:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604141.941369; Mon, 18 Sep 2023 16:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiHQm-00024N-3r; Mon, 18 Sep 2023 16:49:04 +0000
Received: by outflank-mailman (input) for mailman id 604141;
 Mon, 18 Sep 2023 16:49:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiHQk-00024D-JX; Mon, 18 Sep 2023 16:49:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiHQk-0006u6-9z; Mon, 18 Sep 2023 16:49:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiHQj-000347-Py; Mon, 18 Sep 2023 16:49:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qiHQj-0002qc-PY; Mon, 18 Sep 2023 16:49:01 +0000
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
	bh=zcMNLN3QTxKDV3IHQ5WXFzn5Mm6/Phi/SvYL003ASf4=; b=OKTMW0+oRtD/6AI5RogaC5RWaA
	FKkYYi6Nfo9QU8ryFkxPZP5GHNSey459CpeKMHpovYXwa3MKJ/pMjMspyAKXsm5Y0sTSEFG7uDmzN
	u1yz53Q9UZyhvOgIBDswZKmO1Z+A0oUWdChdivh6VDZ/ZVpqmo/lfo3PqSH7b6ptdlVo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183030-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183030: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2ea38251eb67639be7aa9d7b64084b1be0230273
X-Osstest-Versions-That:
    xen=290f82375d828ef93f831a5ef028f1283aa1ea47
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Sep 2023 16:49:01 +0000

flight 183030 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183030/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2ea38251eb67639be7aa9d7b64084b1be0230273
baseline version:
 xen                  290f82375d828ef93f831a5ef028f1283aa1ea47

Last test of basis   183011  2023-09-15 22:01:58 Z    2 days
Testing same since   183030  2023-09-18 14:02:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Federico Serafini <federico.serafini@bugseng.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>

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
   290f82375d..2ea38251eb  2ea38251eb67639be7aa9d7b64084b1be0230273 -> smoke

