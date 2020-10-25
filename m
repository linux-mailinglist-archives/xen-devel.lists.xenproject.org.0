Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE3929800C
	for <lists+xen-devel@lfdr.de>; Sun, 25 Oct 2020 06:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.11717.30990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWYAG-0001Pe-GT; Sun, 25 Oct 2020 05:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11717.30990; Sun, 25 Oct 2020 05:01:56 +0000
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
	id 1kWYAG-0001PF-D3; Sun, 25 Oct 2020 05:01:56 +0000
Received: by outflank-mailman (input) for mailman id 11717;
 Sun, 25 Oct 2020 05:01:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ryJk=EA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kWYAF-0001PA-08
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 05:01:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23009b20-c762-4e44-932f-a8ecd66d8822;
 Sun, 25 Oct 2020 05:01:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWYAB-0007A6-9M; Sun, 25 Oct 2020 05:01:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWYAB-0004Cl-1L; Sun, 25 Oct 2020 05:01:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kWYAB-0005bl-0r; Sun, 25 Oct 2020 05:01:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ryJk=EA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kWYAF-0001PA-08
	for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 05:01:55 +0000
X-Inumbo-ID: 23009b20-c762-4e44-932f-a8ecd66d8822
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 23009b20-c762-4e44-932f-a8ecd66d8822;
	Sun, 25 Oct 2020 05:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=g/8oJCPZ7vGmkvzaWcKMjCkFwWOlAVdDMlLZp0kaAvc=; b=DrOVkwnl6ttrVLA/90tr2NydEk
	d1LpYOtMGNnvCfJ2Ub6LvRSDl/Zq9W591J31yWYBDGRf4r6SJWWZ7r7F3PMhVU4pvYUYe+y8x96In
	P0sBe6owOCjdLDJGyFfQ6rpltV+tphXiU1AgFQfUUZTE4wiQ66AP+BRdHillvYn5QZOg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWYAB-0007A6-9M; Sun, 25 Oct 2020 05:01:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWYAB-0004Cl-1L; Sun, 25 Oct 2020 05:01:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWYAB-0005bl-0r; Sun, 25 Oct 2020 05:01:51 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-armhf
Message-Id: <E1kWYAB-0005bl-0r@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 25 Oct 2020 05:01:51 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-armhf
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f89955449c5a47ff688e91873bbce4c3670ed9fe
  Bug not present: 56c1aca6a2bc013f45e7af2fa88605a693402770
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156199/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build --summary-out=tmp/156199.bisection-summary --basis-template=156117 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-armhf xen-build
Searching for failure / basis pass:
 156197 fail [host=cubietruck-gleizes] / 156120 [host=cubietruck-metzinger] 156117 ok.
Failure / basis pass flights: 156197 / 156117
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
Basis pass ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#6ca70821b59849ad97c3fadc47e63c1a4af1a78c-4ddd6499d999a7d08cabfda5b0262e473dd5beed
Loaded 5001 nodes in revision graph
Searching for test results:
 156117 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c
 156120 [host=cubietruck-metzinger]
 156129 [host=cubietruck-braque]
 156133 [host=cubietruck-braque]
 156140 [host=cubietruck-braque]
 156146 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156158 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c
 156159 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156162 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156164 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156166 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 154137dfdba334348887baf0be9693c407f7cef3
 156168 [host=cubietruck-metzinger]
 156169 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 70cf8e9acada638f68c1c597d7580500d9f21c91
 156171 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156173 [host=cubietruck-metzinger]
 156175 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156177 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
 156178 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156180 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 f89955449c5a47ff688e91873bbce4c3670ed9fe
 156182 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156184 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
 156185 [host=cubietruck-metzinger]
 156187 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 f89955449c5a47ff688e91873bbce4c3670ed9fe
 156188 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156189 [host=cubietruck-metzinger]
 156190 [host=cubietruck-metzinger]
 156192 pass ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
 156193 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156197 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156195 [host=cubietruck-metzinger]
 156199 fail ea6d3cd1ed79d824e605a70c3626bc437c386260 f89955449c5a47ff688e91873bbce4c3670ed9fe
Searching for interesting versions
 Result found: flight 156117 (pass), for basis pass
 For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770, results HASH(0x557199d3cef8) HASH(0x557199d471e8) HASH(0x557199d30a20) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 70cf8e9acada638f68c1c597d7580500d9f21c91, results HASH(0x557199d365b8) For basis failure, parent search stopping at ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c, results HASH(0x\
 557199d233b0) HASH(0x557199d2f318) Result found: flight 156146 (fail), for basis failure (at ancestor ~484)
 Repro found: flight 156158 (pass), for basis pass
 Repro found: flight 156159 (fail), for basis failure
 0 revisions at ea6d3cd1ed79d824e605a70c3626bc437c386260 56c1aca6a2bc013f45e7af2fa88605a693402770
No revisions left to test, checking graph state.
 Result found: flight 156177 (pass), for last pass
 Result found: flight 156180 (fail), for first failure
 Repro found: flight 156184 (pass), for last pass
 Repro found: flight 156187 (fail), for first failure
 Repro found: flight 156192 (pass), for last pass
 Repro found: flight 156199 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f89955449c5a47ff688e91873bbce4c3670ed9fe
  Bug not present: 56c1aca6a2bc013f45e7af2fa88605a693402770
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156199/


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

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
156199: tolerable ALL FAIL

flight 156199 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156199/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf                   6 xen-build               fail baseline untested


jobs:
 build-armhf                                                  fail    


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


