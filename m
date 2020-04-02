Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B019CCF4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 00:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK8Ti-0005R5-Iz; Thu, 02 Apr 2020 22:38:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9JfQ=5S=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jK8Tg-0005R0-Nm
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 22:38:24 +0000
X-Inumbo-ID: a6242626-7532-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6242626-7532-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 22:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d4bI8m5wB5DQjCLvfM2duDzQy8K80YCofUsKOyKYndk=; b=1LFIsT6GAd3M2wdRHmK5Iz+jFa
 O1D61vHMBBGJkY3adxVxASSAhiyfVxW4zDTNBtaYaNrqT3xdqyUfhbLGSVY08upGsyVJxSw9N+dJJ
 WF/NVgqWf26ZkdPGS44aD5PQMwm8XoDlwNpeTzPmrRWpi8rgAhgHR+aiJY5OGdvfodgU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jK8TZ-0000lS-PJ; Thu, 02 Apr 2020 22:38:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jK8TZ-0007kG-CR; Thu, 02 Apr 2020 22:38:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jK8TZ-0007Be-Bs; Thu, 02 Apr 2020 22:38:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-linus bisection] complete build-arm64-pvops
Message-Id: <E1jK8TZ-0007Be-Bs@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 02 Apr 2020 22:38:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

branch xen-unstable
xenbranch xen-unstable
job build-arm64-pvops
testid kernel-build

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
  Bug introduced:  f0b5989745c3e0e92424d36869a97e4e8df7ab13
  Bug not present: 7111951b8d4973bda27ff663f2cf18b663d15b48
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149364/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/build-arm64-pvops.kernel-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/build-arm64-pvops.kernel-build --summary-out=tmp/149364.bisection-summary --basis-template=149238 --blessings=real,real-bisect linux-linus build-arm64-pvops kernel-build
Searching for failure / basis pass:
 149306 fail [host=laxton1] / 149238 [host=rochester1] 149198 [host=rochester0] 149158 ok.
Failure / basis pass flights: 149306 / 149158
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Latest 668f1e9267415153e30bea03828c0530874e92e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860
Basis pass e595dd94515ed6bc5ba38fce0f9598db8c0ee9a9 c530a75c1e6a472b0eb9558310b518f0dfcd8860
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#e595dd94515ed6bc5ba38fce0f9598db8c0ee9a9-668f1e9267415153e30bea03828c0530874e92e4 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860
Loaded 5162 nodes in revision graph
Searching for test results:
 149198 [host=rochester0]
 149158 pass e595dd94515ed6bc5ba38fce0f9598db8c0ee9a9 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149238 [host=rochester1]
 149320 fail bc82521e3b8e8cfa7e0136080c75a3af3a1b448a c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149331 fail 5b071c59ede04db200d9eccb97701261461e89bf c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149307 pass e595dd94515ed6bc5ba38fce0f9598db8c0ee9a9 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149321 fail 4c0d6d3a7a81fcd2dcb4abf15fe2e13074cf8619 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149322 fail a6af77637adc92aa0725ac14f71ad915c6000609 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149332 fail a7a29f9c361f8542604ef959ae6627f423b7a412 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149309 fail 1a323ea5356edbb3073dc59d51b9e6b86908857d c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149324 fail 49d3b493673a000b5e9fd8bf1b286e847f104fa9 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149266 fail 1a323ea5356edbb3073dc59d51b9e6b86908857d c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149315 fail d63439f575dc3927331d8fbc6448f15902187d38 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149333 fail 3f8e0aae1796363442f6d0b7bc2210a6eecffb2d c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149318 fail 5ae8c0d51ace3bdbfb89c27e7661f081cc9287de c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149306 fail 668f1e9267415153e30bea03828c0530874e92e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149326 fail 48bb52c80be0e462328f58ca3a34ecfef3584320 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149334 fail 336aa67bd027f4771c3a7f3d8a3fd15d923f5df5 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149328 fail 93a129eb8c520b032e1823447b2e1badcc650666 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149329 fail 876aa9f527cd0ddc857337aba3683298b3abe6ab c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149342 pass 7111951b8d4973bda27ff663f2cf18b663d15b48 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149336 fail bd734a742d5533fb9190ecd8cf25befc1f759a5b c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149338 pass 570203ec830dd451b8804cdef8036f7fca9f0311 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149341 fail f0b5989745c3e0e92424d36869a97e4e8df7ab13 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149347 fail 668f1e9267415153e30bea03828c0530874e92e4 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149357 pass 7111951b8d4973bda27ff663f2cf18b663d15b48 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149356 fail f0b5989745c3e0e92424d36869a97e4e8df7ab13 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149362 pass 7111951b8d4973bda27ff663f2cf18b663d15b48 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149359 fail f0b5989745c3e0e92424d36869a97e4e8df7ab13 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 149364 fail f0b5989745c3e0e92424d36869a97e4e8df7ab13 c530a75c1e6a472b0eb9558310b518f0dfcd8860
Searching for interesting versions
 Result found: flight 149158 (pass), for basis pass
 Result found: flight 149306 (fail), for basis failure
 Repro found: flight 149307 (pass), for basis pass
 Repro found: flight 149347 (fail), for basis failure
 0 revisions at 7111951b8d4973bda27ff663f2cf18b663d15b48 c530a75c1e6a472b0eb9558310b518f0dfcd8860
No revisions left to test, checking graph state.
 Result found: flight 149342 (pass), for last pass
 Result found: flight 149356 (fail), for first failure
 Repro found: flight 149357 (pass), for last pass
 Repro found: flight 149359 (fail), for first failure
 Repro found: flight 149362 (pass), for last pass
 Repro found: flight 149364 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
  Bug introduced:  f0b5989745c3e0e92424d36869a97e4e8df7ab13
  Bug not present: 7111951b8d4973bda27ff663f2cf18b663d15b48
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149364/


  (Revision log too long, omitted.)

Revision graph left in /home/logs/results/bisect/linux-linus/build-arm64-pvops.kernel-build.{dot,ps,png,html,svg}.
----------------------------------------
149364: tolerable ALL FAIL

flight 149364 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/149364/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build            fail baseline untested


jobs:
 build-arm64-pvops                                            fail    


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


