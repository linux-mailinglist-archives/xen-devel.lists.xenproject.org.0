Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884498675E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 22:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804563.1215590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYDC-0003z6-AD; Wed, 25 Sep 2024 20:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804563.1215590; Wed, 25 Sep 2024 20:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYDC-0003wN-6V; Wed, 25 Sep 2024 20:02:10 +0000
Received: by outflank-mailman (input) for mailman id 804563;
 Wed, 25 Sep 2024 20:02:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stYDB-0003wB-Dk; Wed, 25 Sep 2024 20:02:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stYDB-0001fO-BG; Wed, 25 Sep 2024 20:02:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1stYDA-0001t6-Rj; Wed, 25 Sep 2024 20:02:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1stYDA-00049b-R8; Wed, 25 Sep 2024 20:02:08 +0000
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
	bh=ako8e0N5qfZqdZnfOsRxh8XoJhuUYD/UlNlScbE5iPg=; b=D9RKRne+xZjuQgbIOOnBcHrUmr
	rrZRm4ZFIwaiOcwwnEOeUs4aaCR/Gw+DMtA8MtKHR8Wqul2EEY5SbONKmO6RFFEsY0D1vouE7aSvD
	huSu+qhS+aCid5dD00cgYllGPrIQjaDjZEQedYUXHGZer4AZmFfty2iMmpXHm9CP/PPw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187857-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187857: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3a28da8f4dafa906ec13b8d0533046584d897bca
X-Osstest-Versions-That:
    xen=b81ea162efd4b66b78ee358aefbc225fd1dfd2e4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Sep 2024 20:02:08 +0000

flight 187857 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187857/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3a28da8f4dafa906ec13b8d0533046584d897bca
baseline version:
 xen                  b81ea162efd4b66b78ee358aefbc225fd1dfd2e4

Last test of basis   187855  2024-09-25 12:02:19 Z    0 days
Testing same since   187857  2024-09-25 16:04:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Frediano Ziglio <frediano.ziglio@cloud.com>
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
   b81ea162ef..3a28da8f4d  3a28da8f4dafa906ec13b8d0533046584d897bca -> smoke

