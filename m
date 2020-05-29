Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4F1E8150
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:11:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegfE-0005FC-Pr; Fri, 29 May 2020 15:11:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8V9=7L=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jegfD-0005F2-8k
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:11:15 +0000
X-Inumbo-ID: a3104394-a1be-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3104394-a1be-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8sI0ySeI4B1jtNwSWCd+iKciDnNv33+twDnCM5+e5T4=; b=w/blFMxKxDbGu42G/ql73qCDyg
 sfQrTpgbZfWbLRTPY/3WfH5VU3k/3xz7qHxZVe3NAF/u2ROgsjkgrz5yYLxOfUhiAR7KhJlr4wXmu
 sBAoAB2pBQk20B0bl1KPzLfcopwG9XLBF1QIUhyHeoPCSTqzPJkbzYyH1D8E1AEr8zHQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jegfB-0007dY-Fc; Fri, 29 May 2020 15:11:13 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jegfB-0007Nw-1x; Fri, 29 May 2020 15:11:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jegfB-0006PU-1M; Fri, 29 May 2020 15:11:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1jegfB-0006PU-1M@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 May 2020 15:11:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
  Bug not present: 86234eafb95295621aef6c618e4c22c10d8e4138
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/150490/


  commit ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri May 29 10:20:32 2020 +0200
  
      tools: add xenfs tool
      
      Add the xenfs tool for accessing the hypervisor filesystem.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/150490.bisection-summary --basis-template=150438 --blessings=real,real-bisect xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 150488 fail [host=laxton1] / 150438 [host=laxton0] 150433 ok.
Failure / basis pass flights: 150488 / 150433
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 410cc30fdc590417ae730d635bbc70257adf6750 9b9a83e43598b231111487378d6037fa8fa473d5
Basis pass 410cc30fdc590417ae730d635bbc70257adf6750 724913de8ac8426d313a4645741d86c1169ae406
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#410cc30fdc590417ae730d635bbc70257adf6750-410cc30fdc590417ae730d635bbc70257adf6750 git://xenbits.xen.org/xen.git#724913de8ac8426d313a4645741d86c1169ae406-9b9a83e43598b231111487378d6037fa8fa473d5
Loaded 5001 nodes in revision graph
Searching for test results:
 150472 fail 410cc30fdc590417ae730d635bbc70257adf6750 9b9a83e43598b231111487378d6037fa8fa473d5
 150465 fail 410cc30fdc590417ae730d635bbc70257adf6750 ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
 150438 [host=laxton0]
 150487 fail 410cc30fdc590417ae730d635bbc70257adf6750 ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
 150467 pass 410cc30fdc590417ae730d635bbc70257adf6750 724913de8ac8426d313a4645741d86c1169ae406
 150478 pass 410cc30fdc590417ae730d635bbc70257adf6750 86234eafb95295621aef6c618e4c22c10d8e4138
 150433 pass 410cc30fdc590417ae730d635bbc70257adf6750 724913de8ac8426d313a4645741d86c1169ae406
 150468 fail 410cc30fdc590417ae730d635bbc70257adf6750 ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
 150469 fail 410cc30fdc590417ae730d635bbc70257adf6750 ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
 150489 pass 410cc30fdc590417ae730d635bbc70257adf6750 86234eafb95295621aef6c618e4c22c10d8e4138
 150479 fail 410cc30fdc590417ae730d635bbc70257adf6750 9b9a83e43598b231111487378d6037fa8fa473d5
 150471 pass 410cc30fdc590417ae730d635bbc70257adf6750 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 150488 fail 410cc30fdc590417ae730d635bbc70257adf6750 9b9a83e43598b231111487378d6037fa8fa473d5
 150482 pass 410cc30fdc590417ae730d635bbc70257adf6750 724913de8ac8426d313a4645741d86c1169ae406
 150475 pass 410cc30fdc590417ae730d635bbc70257adf6750 0e9dcd0159c671608e154da5b8b7e0edd2905067
 150490 fail 410cc30fdc590417ae730d635bbc70257adf6750 ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
 150476 pass 410cc30fdc590417ae730d635bbc70257adf6750 5b5ccafb0c425b85a60fd4f241d5f6951d0e4928
 150484 fail 410cc30fdc590417ae730d635bbc70257adf6750 9b9a83e43598b231111487378d6037fa8fa473d5
 150485 fail 410cc30fdc590417ae730d635bbc70257adf6750 ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
 150486 pass 410cc30fdc590417ae730d635bbc70257adf6750 86234eafb95295621aef6c618e4c22c10d8e4138
Searching for interesting versions
 Result found: flight 150433 (pass), for basis pass
 Result found: flight 150472 (fail), for basis failure
 Repro found: flight 150482 (pass), for basis pass
 Repro found: flight 150484 (fail), for basis failure
 0 revisions at 410cc30fdc590417ae730d635bbc70257adf6750 86234eafb95295621aef6c618e4c22c10d8e4138
No revisions left to test, checking graph state.
 Result found: flight 150478 (pass), for last pass
 Result found: flight 150485 (fail), for first failure
 Repro found: flight 150486 (pass), for last pass
 Repro found: flight 150487 (fail), for first failure
 Repro found: flight 150489 (pass), for last pass
 Repro found: flight 150490 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
  Bug not present: 86234eafb95295621aef6c618e4c22c10d8e4138
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/150490/


  commit ef716e1dc6206adc5e2a181fe0e20dfd6072bf4c
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri May 29 10:20:32 2020 +0200
  
      tools: add xenfs tool
      
      Add the xenfs tool for accessing the hypervisor filesystem.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
150490: tolerable ALL FAIL

flight 150490 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/150490/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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


