Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C825DF84
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 18:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEELl-0005VZ-OI; Fri, 04 Sep 2020 16:14:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiF3=CN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kEELj-0005UN-Sg
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:14:03 +0000
X-Inumbo-ID: b96d4883-2014-428d-8def-98e634f265bd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b96d4883-2014-428d-8def-98e634f265bd;
 Fri, 04 Sep 2020 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=HY9WxId5g4Kb/TJLOG372qj+MKTXzsBPjv6TJMSSGHY=; b=67h3J8T8P31DzKXpa+tV+U0xBY
 5oYISSUmiQi1FTSXEY/X1vTQl3ucbU+HpqxwlWGFXcexOkxIk3gvm6QufeiaL+7Rmml0yqrIrriM/
 tQHoJEqlxhe+/2YRV1QmaJ0Dy/zs1PyiC8Yr/h1hVWyZmsCAEflQnsgSXZOYEIwu/oRQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEELc-0000z1-As; Fri, 04 Sep 2020 16:13:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEELc-0000L8-3v; Fri, 04 Sep 2020 16:13:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kEELc-0000IR-3U; Fri, 04 Sep 2020 16:13:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-5.4 bisection] complete build-i386-xsm
Message-Id: <E1kEELc-0000IR-3U@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Sep 2020 16:13:56 +0000
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

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  165f3afbfc3db70fcfdccad07085cde0a03c858b
  Bug not present: 3df0424e69549ca21613fad3654509c35b2a3e94
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153717/


  commit 165f3afbfc3db70fcfdccad07085cde0a03c858b
  Author: Ian Jackson <ian.jackson@eu.citrix.com>
  Date:   Mon Jul 13 14:50:33 2020 +0100
  
      Config.mk: Unnail versions (for unstable branch)
      
      Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/build-i386-xsm.xen-build --summary-out=tmp/153717.bisection-summary --basis-template=152853 --blessings=real,real-bisect linux-5.4 build-i386-xsm xen-build
Searching for failure / basis pass:
 153668 fail [host=albana1] / 152853 [host=fiano1] 152675 [host=pinot0] 152664 [host=huxelrebe1] 152656 [host=chardonnay1] 152614 [host=albana0] 152562 [host=huxelrebe1] 152514 [host=huxelrebe0] 152501 [host=pinot1] 152486 [host=pinot0] 152331 [host=huxelrebe0] 152282 [host=huxelrebe0] 152137 [host=huxelrebe0] 152100 [host=albana0] 151939 [host=albana0] 151757 [host=huxelrebe1] 151516 [host=albana0] 151503 [host=huxelrebe1] 151339 [host=albana0] 151307 [host=chardonnay0] 151288 [host=huxelrebe0]\
  151232 ok.
Failure / basis pass flights: 153668 / 151232
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
Basis pass 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#58ae92a993687d913aa6dd00ef3497a1bc5f6c40-63d92674d240ab4ecab94f98e1e198842bb7de00 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db9934a34f816d78b-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#410cc30fdc590417ae730d635bbc70257adf6750-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345\
 694-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#3625b04991b4d6affadd99d377ab84bac48dfff4-7a8d8bde9820387c3e168182b99fd9761c223fff
Loaded 12584 nodes in revision graph
Searching for test results:
 151200 pass irrelevant
 151232 pass 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151288 [host=huxelrebe0]
 151339 [host=albana0]
 151324 [host=huxelrebe0]
 151307 [host=chardonnay0]
 151327 pass irrelevant
 151503 [host=huxelrebe1]
 151516 [host=albana0]
 151757 [host=huxelrebe1]
 151939 [host=albana0]
 152100 [host=albana0]
 152137 [host=huxelrebe0]
 152282 [host=huxelrebe0]
 152331 [host=huxelrebe0]
 152486 [host=pinot0]
 152514 [host=huxelrebe0]
 152501 [host=pinot1]
 152562 [host=huxelrebe1]
 152614 [host=albana0]
 152656 [host=chardonnay1]
 152671 [host=elbling1]
 152673 pass irrelevant
 152664 [host=huxelrebe1]
 152674 [host=pinot0]
 152675 [host=pinot0]
 152853 [host=fiano1]
 153616 fail 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
 153641 fail 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
 153679 pass 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 153682 fail 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
 153683 fail 53936785b74dd0ab98453d610be6dfd12c2e5fc9 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 98bed5de1de3352c63cfe29a00f17e8d9ce72689
 153684 fail e906346dcb80fce588ac774c8ec9694b62f0a257 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 6ada2285d9918859699c92e09540e023e0a16054 1969576661f3e34318e9b0a61a1a38f9a5aee16f
 153685 pass 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 0e2e54966af556f4047c1048855c4a071028a32d
 153686 pass 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 1104288186ee73a7f9bfa41cbaa5bb7611521028
 153687 pass bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 153691 fail d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 6ada2285d9918859699c92e09540e023e0a16054 165f3afbfc3db70fcfdccad07085cde0a03c858b
 153693 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 153695 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 153696 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
 153699 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 153668 fail 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
 153707 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
 153710 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 153715 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
 153717 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
Searching for interesting versions
 Result found: flight 151232 (pass), for basis pass
 For basis failure, parent search stopping at f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94, results HASH(0x563ae44cb9c8) HASH(0x563ae44d7b60) HASH(0x563ae44dd3a8) For basis failure, parent search stopping at f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c155\
 25ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b, results HASH(0x563ae44bedb0) For basis failure, parent search stopping at bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b, results HASH(0x563ae4396df8) For basis failure, parent search stopping at 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a3\
 4f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 1104288186ee73a7f9bfa41cbaa5bb7611521028, results HASH(0x563ae4386b80) For basis failure, parent search stopping at 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 0e2e54966af556f4047c1048855c4a071028a32d, results HASH(0x563ae43786d8) For basis failure, parent search stopping at 58ae92a99368\
 7d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4, results HASH(0x563ae4358dc0) HASH(0x563ae436e388) Result found: flight 153616 (fail), for basis failure (at ancestor ~5212)
 Repro found: flight 153679 (pass), for basis pass
 Repro found: flight 153682 (fail), for basis failure
 0 revisions at f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
No revisions left to test, checking graph state.
 Result found: flight 153696 (pass), for last pass
 Result found: flight 153699 (fail), for first failure
 Repro found: flight 153707 (pass), for last pass
 Repro found: flight 153710 (fail), for first failure
 Repro found: flight 153715 (pass), for last pass
 Repro found: flight 153717 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  165f3afbfc3db70fcfdccad07085cde0a03c858b
  Bug not present: 3df0424e69549ca21613fad3654509c35b2a3e94
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153717/


  commit 165f3afbfc3db70fcfdccad07085cde0a03c858b
  Author: Ian Jackson <ian.jackson@eu.citrix.com>
  Date:   Mon Jul 13 14:50:33 2020 +0100
  
      Config.mk: Unnail versions (for unstable branch)
      
      Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

pnmtopng: 75 colors found
Revision graph left in /home/logs/results/bisect/linux-5.4/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
153717: tolerable ALL FAIL

flight 153717 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/153717/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-xsm                6 xen-build               fail baseline untested


jobs:
 build-i386-xsm                                               fail    


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


