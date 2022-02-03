Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4C4A88A3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 17:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264902.458183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFf3l-00034F-Mu; Thu, 03 Feb 2022 16:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264902.458183; Thu, 03 Feb 2022 16:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFf3l-00032G-Jn; Thu, 03 Feb 2022 16:34:13 +0000
Received: by outflank-mailman (input) for mailman id 264902;
 Thu, 03 Feb 2022 16:34:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFf3k-000326-0q; Thu, 03 Feb 2022 16:34:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFf3j-0001ly-VH; Thu, 03 Feb 2022 16:34:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFf3j-0000tT-H4; Thu, 03 Feb 2022 16:34:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nFf3j-0005mV-Ga; Thu, 03 Feb 2022 16:34:11 +0000
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
	bh=qNFIgFVJSiCfvLem0f5WkFfrKJdovFID9Z9WUjWIRp4=; b=x1SPDXRyjmGdGMQXZVAgZbt1iy
	kETomhvNpLsSMMFb4w4dobuogU06CzmurpMkJsJ3n93EGqrKjJvp48Fze4HYEFDFr4R8GiDqQbyIt
	EMVK3rud2JkAVwgn6Jii3Xw6cPCNAUe1Iwkm2NXfSQdeKbNdXxS2B+Rz4dUhpe+TDsvk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167999-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 167999: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=75cc460a1b8cfd8e5d2c4302234ee194defe4872
X-Osstest-Versions-That:
    xen=b17e0ec72eded037297f34a233655aad23f64711
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Feb 2022 16:34:11 +0000

flight 167999 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167999/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  75cc460a1b8cfd8e5d2c4302234ee194defe4872
baseline version:
 xen                  b17e0ec72eded037297f34a233655aad23f64711

Last test of basis   167985  2022-02-02 10:00:30 Z    1 days
Testing same since   167999  2022-02-03 13:01:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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
   b17e0ec72e..75cc460a1b  75cc460a1b8cfd8e5d2c4302234ee194defe4872 -> smoke

