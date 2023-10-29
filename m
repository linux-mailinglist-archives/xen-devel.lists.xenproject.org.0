Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225B7DAC38
	for <lists+xen-devel@lfdr.de>; Sun, 29 Oct 2023 12:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.624905.973713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qx3uo-0002ai-2j; Sun, 29 Oct 2023 11:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624905.973713; Sun, 29 Oct 2023 11:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qx3un-0002Y0-Vj; Sun, 29 Oct 2023 11:25:09 +0000
Received: by outflank-mailman (input) for mailman id 624905;
 Sun, 29 Oct 2023 11:25:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qx3um-0002Xq-8P; Sun, 29 Oct 2023 11:25:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qx3ul-0005bQ-PL; Sun, 29 Oct 2023 11:25:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qx3ul-0000f4-Ht; Sun, 29 Oct 2023 11:25:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qx3ul-00042X-HP; Sun, 29 Oct 2023 11:25:07 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=R15SCYHXa7YTA1+nH4TfM3JN4QqVHtDaWvYK9e+PXjA=; b=BTtpZO7or9GLqZr6WFjd87MZ8b
	17NAgYph+2SWGI4aDUGGgctiR93ZTO4V/dDmjyygrSrnUyrADTSQHeJFopl1Y+0KfIZRJsFWgANFA
	oG0Dduwv1B4Xmpmz9zKVtMgnYi1BxVyBVpSL3k1+LwnoTgmS5sN3Padqyl6SWN9SXEtE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.18-testing bisection] complete build-i386
Message-Id: <E1qx3ul-00042X-HP@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Oct 2023 11:25:07 +0000

branch xen-4.18-testing
xenbranch xen-4.18-testing
job build-i386
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Bug not present: 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183612/


  commit f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Author: Julien Grall <julien@xen.org>
  Date:   Fri Oct 27 14:07:09 2023 +0100
  
      Config.mk: switch to named tags (for stable branch)
      
      Signed-off-by: Julien Grall <julien@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.18-testing/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.18-testing/build-i386.xen-build --summary-out=tmp/183612.bisection-summary --basis-template=183555 --blessings=real,real-bisect,real-retry xen-4.18-testing build-i386 xen-build
Searching for failure / basis pass:
 183564 fail [host=huxelrebe1] / 183555 [host=pinot1] template as basis? using template as basis.
Failure / basis pass flights: 183564 / 183555
(tree in basispass but not in latest: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
Basis pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad-7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/osstest/seabios.git#1e1da7a963007d03a4e0e9a9e0ff17990bb16\
 08d-1e1da7a963007d03a4e0e9a9e0ff17990bb1608d git://xenbits.xen.org/xen.git#5415b2b2118bd78d8a04f276a8312f7f0cb1a466-b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
Loaded 5001 nodes in revision graph
Searching for test results:
 183555 [host=pinot1]
 183564 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
 183602 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183604 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
 183605 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183606 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d b6cf4f81b5ff43a05b199c3eb8c78059d03d9485
 183607 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
 183609 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183610 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
 183611 pass 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
 183612 fail 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
Searching for interesting versions
 Result found: flight 183602 (pass), for basis pass
 For basis failure, parent search stopping at 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466, results HASH(0x5575ec4d1e08) HASH(0x5575ec4d57b8) HASH(0x5575ec4db678) HASH(0x5575ec4df208) Result found: flight 183604 (fail), for basis failure (at ancestor ~2236)
 Repro found: flight 183605 (pass), for basis pass
 Repro found: flight 183606 (fail), for basis failure
 0 revisions at 7e08d17a4a535a7abfa58a0606ca1a0e7f5862ad 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 1e1da7a963007d03a4e0e9a9e0ff17990bb1608d 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
No revisions left to test, checking graph state.
 Result found: flight 183602 (pass), for last pass
 Result found: flight 183607 (fail), for first failure
 Repro found: flight 183609 (pass), for last pass
 Repro found: flight 183610 (fail), for first failure
 Repro found: flight 183611 (pass), for last pass
 Repro found: flight 183612 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Bug not present: 5415b2b2118bd78d8a04f276a8312f7f0cb1a466
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183612/


  commit f17e9d7459f4d4c6e078cbf15e7e0591c8b5f43e
  Author: Julien Grall <julien@xen.org>
  Date:   Fri Oct 27 14:07:09 2023 +0100
  
      Config.mk: switch to named tags (for stable branch)
      
      Signed-off-by: Julien Grall <julien@xen.org>

Revision graph left in /home/logs/results/bisect/xen-4.18-testing/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
183612: tolerable ALL FAIL

flight 183612 xen-4.18-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/183612/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386                    6 xen-build               fail baseline untested


jobs:
 build-i386                                                   fail    


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


