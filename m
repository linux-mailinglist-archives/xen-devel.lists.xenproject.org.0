Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE2128678C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3805.11357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEN7-00014u-4C; Wed, 07 Oct 2020 18:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3805.11357; Wed, 07 Oct 2020 18:41:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEN7-00014V-0d; Wed, 07 Oct 2020 18:41:05 +0000
Received: by outflank-mailman (input) for mailman id 3805;
 Wed, 07 Oct 2020 18:41:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQEN6-00013t-39
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:41:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40d4bb9d-5e4f-4c64-91bf-4a88d914e1f9;
 Wed, 07 Oct 2020 18:40:57 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQEMy-0003iW-Rw; Wed, 07 Oct 2020 18:40:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQEMy-0005BS-K4; Wed, 07 Oct 2020 18:40:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQEMy-0005fo-JX; Wed, 07 Oct 2020 18:40:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQEN6-00013t-39
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:41:04 +0000
X-Inumbo-ID: 40d4bb9d-5e4f-4c64-91bf-4a88d914e1f9
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 40d4bb9d-5e4f-4c64-91bf-4a88d914e1f9;
	Wed, 07 Oct 2020 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=vQ3WMdtua64mU/eCMTrAqRNOOnZGhr6kTxh9C1ZvNec=; b=zxML+KMW3p6QmYo/rorgC/j17S
	MOFJSBH7eyNgZSGf7DHa22W2ViujDxN2tF03M95+0vNvEI+e/uBiTsh0KRk19fgrcy0lFtbVTHsgg
	hvidImfqemn3VEajhQEQ2zQmrFf2TqA2x0PZMFoKyFehTBP6fNFj3Wvzg71NYBJ7bWDE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQEMy-0003iW-Rw; Wed, 07 Oct 2020 18:40:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQEMy-0005BS-K4; Wed, 07 Oct 2020 18:40:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQEMy-0005fo-JX; Wed, 07 Oct 2020 18:40:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1kQEMy-0005fo-JX@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Oct 2020 18:40:56 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e4e64408f5c755da3bf7bfd78e70ad9f6c448376
  Bug not present: 93508595d588afe9dca087f95200effb7cedc81f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155530/


  commit e4e64408f5c755da3bf7bfd78e70ad9f6c448376
  Author: Bertrand Marquis <bertrand.marquis@arm.com>
  Date:   Fri Oct 2 11:42:09 2020 +0100
  
      build: always use BASEDIR for xen sub-directory
      
      Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
      
      This is removing the dependency to xen subdirectory preventing using a
      wrong configuration file when xen subdirectory is duplicated for
      compilation tests.
      
      Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/155530.bisection-summary --basis-template=155495 --blessings=real,real-bisect xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 155517 fail [host=himrod1] / 155495 [host=himrod2] 155349 [host=himrod2] 155327 ok.
Failure / basis pass flights: 155517 / 155327
(tree with no url: minios)
(tree in basispass but not in latest: ovmf)
(tree in basispass but not in latest: qemu)
(tree in basispass but not in latest: seabios)
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ea6d3cd1ed79d824e605a70c3626bc437c386260 e4e64408f5c755da3bf7bfd78e70ad9f6c448376
Basis pass ea6d3cd1ed79d824e605a70c3626bc437c386260 59b27f360e3d9dc0378c1288e67a91fa41a77158
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#59b27f360e3d9dc0378c1288e67a91fa41a77158-e4e64408f5c755da3bf7bfd78e70ad9f6c448376
Loaded 5001 nodes in revision graph
Searching for test results:
 155310 [host=himrod2]
 155321 [host=albana1]
 155327 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155349 [host=himrod2]
 155495 [host=himrod2]
 155517 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 e4e64408f5c755da3bf7bfd78e70ad9f6c448376
 155519 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155520 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 e4e64408f5c755da3bf7bfd78e70ad9f6c448376
 155522 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 3600118a52e75e10800806fdd05eba13adc87347
 155523 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 1bc30c076a7f1678166934c080e1bf94b2c189af
 155524 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 7f66c0dc41ae5f770c614e516810eb1f336e2470
 155525 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 93508595d588afe9dca087f95200effb7cedc81f
 155526 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 e4e64408f5c755da3bf7bfd78e70ad9f6c448376
 155527 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 93508595d588afe9dca087f95200effb7cedc81f
 155528 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 e4e64408f5c755da3bf7bfd78e70ad9f6c448376
 155529 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 93508595d588afe9dca087f95200effb7cedc81f
 155530 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 e4e64408f5c755da3bf7bfd78e70ad9f6c448376
Searching for interesting versions
 Result found: flight 155327 (pass), for basis pass
 For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 93508595d588afe9dca087f95200effb7cedc81f, results HASH(0x55f3dbade518) HASH(0x55f3dbae5e48) HASH(0x55f3dbae9b58) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 7f66c0dc41ae5f770c614e516810eb1f336e2470, results HASH(0x55f3dbad0e18) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 1bc30c076a7f1678166934c080e1bf94b2c189af, results HASH(0x\
 55f3dbad9760) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 3600118a52e75e10800806fdd05eba13adc87347, results HASH(0x55f3dbadb2e8) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 59b27f360e3d9dc0378c1288e67a91fa41a77158, results HASH(0x55f3dbad1118) HASH(0x55f3dbad9460) Result found: flight 155517 (fail), for basis failure (at ancestor ~407)
 Repro found: flight 155519 (pass), for basis pass
 Repro found: flight 155520 (fail), for basis failure
 0 revisions at ea6d3cd1ed79d824e605a70c3626bc437c386260 93508595d588afe9dca087f95200effb7cedc81f
No revisions left to test, checking graph state.
 Result found: flight 155525 (pass), for last pass
 Result found: flight 155526 (fail), for first failure
 Repro found: flight 155527 (pass), for last pass
 Repro found: flight 155528 (fail), for first failure
 Repro found: flight 155529 (pass), for last pass
 Repro found: flight 155530 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e4e64408f5c755da3bf7bfd78e70ad9f6c448376
  Bug not present: 93508595d588afe9dca087f95200effb7cedc81f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155530/


  commit e4e64408f5c755da3bf7bfd78e70ad9f6c448376
  Author: Bertrand Marquis <bertrand.marquis@arm.com>
  Date:   Fri Oct 2 11:42:09 2020 +0100
  
      build: always use BASEDIR for xen sub-directory
      
      Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
      
      This is removing the dependency to xen subdirectory preventing using a
      wrong configuration file when xen subdirectory is duplicated for
      compilation tests.
      
      Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Acked-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
155530: tolerable ALL FAIL

flight 155530 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155530/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


