Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07177819244
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 22:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657219.1025953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFhdI-0002jT-SJ; Tue, 19 Dec 2023 21:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657219.1025953; Tue, 19 Dec 2023 21:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFhdI-0002gn-Pb; Tue, 19 Dec 2023 21:28:08 +0000
Received: by outflank-mailman (input) for mailman id 657219;
 Tue, 19 Dec 2023 21:28:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFhdH-0002gd-P4; Tue, 19 Dec 2023 21:28:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFhdH-0003H9-KK; Tue, 19 Dec 2023 21:28:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFhdH-0007Nv-6e; Tue, 19 Dec 2023 21:28:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFhdH-00030v-69; Tue, 19 Dec 2023 21:28:07 +0000
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
	bh=rbfHa8hfkgiNaqJin2nKflRZDNjVHP+FRdX0hgtxsAI=; b=jF+fl1JaPgXP99Dsl42uc8/s+/
	9eB7uDV8RqXCaFfSC+fSJ19lNeeCCTIxr/MrpJ08Qzu6+oq8nc5hUr2KoLRnprYgrbsyUW0N/BV61
	6ewn02pkRl/WtpNv+hcb/52eKn4TSN+K+/FwZ2P9VY/iF5+Ou0HFTWwNmmpSnJUAHTeU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184178-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184178: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1b42304fd1d84adcf7caf8c12c33ec66347b6dcc
X-Osstest-Versions-That:
    xen=05b6368ba01e07aa3b2b1f1856d77332971a7bdf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Dec 2023 21:28:07 +0000

flight 184178 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184178/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1b42304fd1d84adcf7caf8c12c33ec66347b6dcc
baseline version:
 xen                  05b6368ba01e07aa3b2b1f1856d77332971a7bdf

Last test of basis   184174  2023-12-19 13:02:03 Z    0 days
Testing same since   184178  2023-12-19 19:02:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jens Wiklander <jens.wiklander@linaro.org>

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
   05b6368ba0..1b42304fd1  1b42304fd1d84adcf7caf8c12c33ec66347b6dcc -> smoke

