Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFC2979B0
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 01:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11344.30068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW6Vu-0002f0-6y; Fri, 23 Oct 2020 23:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11344.30068; Fri, 23 Oct 2020 23:30:26 +0000
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
	id 1kW6Vu-0002eb-30; Fri, 23 Oct 2020 23:30:26 +0000
Received: by outflank-mailman (input) for mailman id 11344;
 Fri, 23 Oct 2020 23:30:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJnI=D6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kW6Vt-0002dP-AP
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 23:30:25 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b273019-0b0e-43cc-bcc9-ea54cae818bc;
 Fri, 23 Oct 2020 23:30:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kW6Vl-0000Lp-Lu; Fri, 23 Oct 2020 23:30:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kW6Vl-0005QG-Fe; Fri, 23 Oct 2020 23:30:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kW6Vl-0006na-FA; Fri, 23 Oct 2020 23:30:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vJnI=D6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kW6Vt-0002dP-AP
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 23:30:25 +0000
X-Inumbo-ID: 6b273019-0b0e-43cc-bcc9-ea54cae818bc
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6b273019-0b0e-43cc-bcc9-ea54cae818bc;
	Fri, 23 Oct 2020 23:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=LUEt7Uk1l8w9nctICwSU5hc42imC30s2EDXHQ1Aihho=; b=ipoVLTxxTnbbtUnNzDdZvKpG9l
	rmKEEMX2bpavBO5YzMN3sIUi0HcUPYmII27ucsxugU6mcLzvoK6FEF0R4ts+6rcWKG/lW/IcQLGmy
	aJ4N92ACDxqrjHO0PapW4v7lWrm4xdm9CbuPYmMKV+viJNdmiOuZq59vmqK6MA+V/jBM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kW6Vl-0000Lp-Lu; Fri, 23 Oct 2020 23:30:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kW6Vl-0005QG-Fe; Fri, 23 Oct 2020 23:30:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kW6Vl-0006na-FA; Fri, 23 Oct 2020 23:30:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1kW6Vl-0006na-FA@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Oct 2020 23:30:17 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4664034cdc720a52913bc26358240bb9d3798527
  Bug not present: 154137dfdba334348887baf0be9693c407f7cef3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156144/


  commit 4664034cdc720a52913bc26358240bb9d3798527
  Author: Juergen Gross <jgross@suse.com>
  Date:   Mon Oct 19 17:27:54 2020 +0200
  
      tools/libs: move official headers to common directory
      
      Instead of each library having an own include directory move the
      official headers to tools/include instead. This will drop the need to
      link those headers to tools/include and there is no need any longer
      to have library-specific include paths when building Xen.
      
      While at it remove setting of the unused variable
      PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Christian Lindig <christian.lindig@citrix.com>
      Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Acked-by: Ian Jackson <iwj@xenproject.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/156144.bisection-summary --basis-template=156117 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 156140 fail [host=himrod1] / 156120 [host=himrod2] 156117 [host=himrod2] 156108 ok.
Failure / basis pass flights: 156140 / 156108
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 861f0c110976fa8879b7bf63d9478b6be83d4ab6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#861f0c110976fa8879b7bf63d9478b6be83d4ab6-4ddd6499d999a7d08cabfda5b0262e473dd5beed
Loaded 5001 nodes in revision graph
Searching for test results:
 156108 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 861f0c110976fa8879b7bf63d9478b6be83d4ab6
 156117 [host=himrod2]
 156120 [host=himrod2]
 156129 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156131 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 861f0c110976fa8879b7bf63d9478b6be83d4ab6
 156132 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156134 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c
 156135 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 154137dfdba334348887baf0be9693c407f7cef3
 156133 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156137 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 588756db020e73e6f5e4407bbf78fbd53f15b731
 156138 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4664034cdc720a52913bc26358240bb9d3798527
 156139 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 154137dfdba334348887baf0be9693c407f7cef3
 156141 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4664034cdc720a52913bc26358240bb9d3798527
 156142 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 154137dfdba334348887baf0be9693c407f7cef3
 156140 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4ddd6499d999a7d08cabfda5b0262e473dd5beed
 156144 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4664034cdc720a52913bc26358240bb9d3798527
Searching for interesting versions
 Result found: flight 156108 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 154137dfdba334348887baf0be9693c407f7cef3, results HASH(0x559bab0e2bb8) HASH(0x559bab0f1840) HASH(0x559bab0f7e80) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c, results HASH(0x559bab0e82d0) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 861f0c110976fa8879b7bf63d9478b6be83d4ab6, results HASH(0x559bab0e0d30) HASH(0x559bab0e2738) Result found: flight 156129 (fail), for basis failure (at ancestor ~484)
 Repro found: flight 156131 (pass), for basis pass
 Repro found: flight 156132 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 154137dfdba334348887baf0be9693c407f7cef3
No revisions left to test, checking graph state.
 Result found: flight 156135 (pass), for last pass
 Result found: flight 156138 (fail), for first failure
 Repro found: flight 156139 (pass), for last pass
 Repro found: flight 156141 (fail), for first failure
 Repro found: flight 156142 (pass), for last pass
 Repro found: flight 156144 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4664034cdc720a52913bc26358240bb9d3798527
  Bug not present: 154137dfdba334348887baf0be9693c407f7cef3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156144/


  commit 4664034cdc720a52913bc26358240bb9d3798527
  Author: Juergen Gross <jgross@suse.com>
  Date:   Mon Oct 19 17:27:54 2020 +0200
  
      tools/libs: move official headers to common directory
      
      Instead of each library having an own include directory move the
      official headers to tools/include instead. This will drop the need to
      link those headers to tools/include and there is no need any longer
      to have library-specific include paths when building Xen.
      
      While at it remove setting of the unused variable
      PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Christian Lindig <christian.lindig@citrix.com>
      Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
      Acked-by: Ian Jackson <iwj@xenproject.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
156144: tolerable ALL FAIL

flight 156144 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156144/

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


