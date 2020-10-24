Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5451C297A5A
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 04:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11418.30284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW9G2-0000yT-Ii; Sat, 24 Oct 2020 02:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11418.30284; Sat, 24 Oct 2020 02:26:14 +0000
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
	id 1kW9G2-0000y4-FC; Sat, 24 Oct 2020 02:26:14 +0000
Received: by outflank-mailman (input) for mailman id 11418;
 Sat, 24 Oct 2020 02:26:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IA9X=D7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kW9G1-0000xz-3Q
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 02:26:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78132c8d-d367-469d-93f5-ca39bee2ce18;
 Sat, 24 Oct 2020 02:26:08 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kW9Fw-0000uc-CK; Sat, 24 Oct 2020 02:26:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kW9Fw-0007Tm-57; Sat, 24 Oct 2020 02:26:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kW9Fw-0002L5-4e; Sat, 24 Oct 2020 02:26:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IA9X=D7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kW9G1-0000xz-3Q
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 02:26:13 +0000
X-Inumbo-ID: 78132c8d-d367-469d-93f5-ca39bee2ce18
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 78132c8d-d367-469d-93f5-ca39bee2ce18;
	Sat, 24 Oct 2020 02:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=tUr/Gn3BddzEHn61fZmNIYWGL9MA7VdTEWEG1hkp9Xw=; b=YaW8w5+6EWICxfBSYcDkwhuapI
	KzJk8ZRaynIBpjGebacgCosh4elTMjgcQRR/xQCjgp6vhmdw33M4h7m4jdDUUgeJ24QQjm7Gvt87l
	WeNSAHCs2FyV/r+NGm6H1+OtBLBk0eSBvMK5h80/SiaaaMJstT3/lINXGHfk8E+1Mc7E=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kW9Fw-0000uc-CK; Sat, 24 Oct 2020 02:26:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kW9Fw-0007Tm-57; Sat, 24 Oct 2020 02:26:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kW9Fw-0002L5-4e; Sat, 24 Oct 2020 02:26:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1kW9Fw-0002L5-4e@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Oct 2020 02:26:08 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f89955449c5a47ff688e91873bbce4c3670ed9fe
  Bug not present: 56c1aca6a2bc013f45e7af2fa88605a693402770
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156157/


  commit f89955449c5a47ff688e91873bbce4c3670ed9fe
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Oct 23 15:53:10 2020 +0200
  
      tools/init-xenstore-domain: support xenstore pvh stubdom
      
      Instead of creating the xenstore-stubdom domain first and parsing the
      kernel later do it the other way round. This enables to probe for the
      domain type supported by the xenstore-stubdom and to support both, pv
      and pvh type stubdoms.
      
      Try to parse the stubdom image first for PV support, if this fails use
      HVM. Then create the domain with the appropriate type selected.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/156157.bisection-summary --basis-template=156117 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 156146 fail [host=laxton0] / 156120 [host=rochester1] 156117 [host=rochester0] 156108 [host=rochester0] 156047 [host=rochester0] 156029 ok.
Failure / basis pass flights: 156146 / 156029
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
Basis pass ea6d3cd1ed79d824e605a70c3626bc437c386260 0514a3a25fb9ebff5d75cc8f00a9229385300858
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#0514a3a25fb9ebff5d75cc8f00a9229385300858-4ddd6499d999a7d08cabfda5b0262e473dd5beed
Loaded 5001 nodes in revision graph
Searching for test results:
 156029 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 0514a3a25fb9ebff5d75cc8f00a9229385300858
 156047 [host=rochester0]
 156108 [host=rochester0]
 156117 [host=rochester0]
 156120 [host=rochester1]
 156129 [host=rochester0]
 156133 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156140 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156145 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 0514a3a25fb9ebff5d75cc8f00a9229385300858
 156147 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156148 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 710f62cc826bb8c7ead99f9d6b6b269e39ff3e98
 156149 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 f89955449c5a47ff688e91873bbce4c3670ed9fe
 156150 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 032a96e5ef38f96eccfebbf8a0dbd83dc7beb625
 156151 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 70cf8e9acada638f68c1c597d7580500d9f21c91
 156152 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
 156153 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 f89955449c5a47ff688e91873bbce4c3670ed9fe
 156154 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
 156155 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 f89955449c5a47ff688e91873bbce4c3670ed9fe
 156156 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
 156146 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156157 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 f89955449c5a47ff688e91873bbce4c3670ed9fe
Searching for interesting versions
 Result found: flight 156029 (pass), for basis pass
 For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770, results HASH(0x55a6ef49eed0) HASH(0x55a6ef4adaf8) HASH(0x55a6ef4b1688) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 70cf8e9acada638f68c1c597d7580500d9f21c91, results HASH(0x55a6ef49b040) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 032a96e5ef38f96eccfebbf8a0dbd83dc7beb625, results HASH(0x\
 55a6ef4a4408) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 710f62cc826bb8c7ead99f9d6b6b269e39ff3e98, results HASH(0x55a6ef499338) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 0514a3a25fb9ebff5d75cc8f00a9229385300858, results HASH(0x55a6ef492878) HASH(0x55a6ef49f4d0) Result found: flight 156133 (fail), for basis failure (at ancestor ~484)
 Repro found: flight 156145 (pass), for basis pass
 Repro found: flight 156146 (fail), for basis failure
 0 revisions at ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
No revisions left to test, checking graph state.
 Result found: flight 156152 (pass), for last pass
 Result found: flight 156153 (fail), for first failure
 Repro found: flight 156154 (pass), for last pass
 Repro found: flight 156155 (fail), for first failure
 Repro found: flight 156156 (pass), for last pass
 Repro found: flight 156157 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f89955449c5a47ff688e91873bbce4c3670ed9fe
  Bug not present: 56c1aca6a2bc013f45e7af2fa88605a693402770
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156157/


  commit f89955449c5a47ff688e91873bbce4c3670ed9fe
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Oct 23 15:53:10 2020 +0200
  
      tools/init-xenstore-domain: support xenstore pvh stubdom
      
      Instead of creating the xenstore-stubdom domain first and parsing the
      kernel later do it the other way round. This enables to probe for the
      domain type supported by the xenstore-stubdom and to support both, pv
      and pvh type stubdoms.
      
      Try to parse the stubdom image first for PV support, if this fails use
      HVM. Then create the domain with the appropriate type selected.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
156157: tolerable ALL FAIL

flight 156157 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156157/

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


