Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A398825D095
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 06:30:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE3MH-0004de-WA; Fri, 04 Sep 2020 04:29:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiF3=CN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kE3MG-0004dZ-QI
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 04:29:52 +0000
X-Inumbo-ID: 47277a53-1512-40dc-aa25-a6adf0e694ec
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47277a53-1512-40dc-aa25-a6adf0e694ec;
 Fri, 04 Sep 2020 04:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=pBWrju+pI2vUKrCbzVwIjhhCIYYgGaTeCz0CngjJHKE=; b=LSI+bETitzp0MfB+X3p/4LpSQT
 gI1rrdolRubYZn4nPYcE+U19aXQDTQZFgjlQ0nLso9OTG2Onvdd3WLkv05rqm6ukSQm8nGXafAlrB
 Fk0Nm27/iiLW7kP7H4Jppe/iiGdgumUTkJi1/RUVIUyJrXdmwp1FKeHKxMPNE/JMovTo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kE3MD-0001NG-9P; Fri, 04 Sep 2020 04:29:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kE3MD-0007KY-2G; Fri, 04 Sep 2020 04:29:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kE3MD-0000D8-1m; Fri, 04 Sep 2020 04:29:49 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-5.4 bisection] complete build-i386
Message-Id: <E1kE3MD-0000D8-1m@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Sep 2020 04:29:49 +0000
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
job build-i386
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153676/


  commit 165f3afbfc3db70fcfdccad07085cde0a03c858b
  Author: Ian Jackson <ian.jackson@eu.citrix.com>
  Date:   Mon Jul 13 14:50:33 2020 +0100
  
      Config.mk: Unnail versions (for unstable branch)
      
      Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-5.4/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-5.4/build-i386.xen-build --summary-out=tmp/153676.bisection-summary --basis-template=152853 --blessings=real,real-bisect linux-5.4 build-i386 xen-build
Searching for failure / basis pass:
 153641 fail [host=albana1] / 152853 [host=fiano1] 152675 [host=pinot0] 152664 [host=albana0] 152656 [host=chardonnay1] 152614 [host=albana0] 152562 [host=huxelrebe1] 152514 [host=huxelrebe0] 152501 [host=fiano0] 152486 [host=huxelrebe0] 152331 [host=huxelrebe0] 152282 [host=huxelrebe0] 152137 [host=huxelrebe0] 152100 [host=fiano1] 151939 [host=albana0] 151757 [host=huxelrebe1] 151516 [host=albana0] 151503 [host=albana0] 151339 ok.
Failure / basis pass flights: 153641 / 151339
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
Basis pass 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#00b8bf7eda00fb6f0197d3968b6078cfdb4870fa-63d92674d240ab4ecab94f98e1e198842bb7de00 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db9934a34f816d78b-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#410cc30fdc590417ae730d635bbc70257adf6750-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345\
 694-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#fde76f895d0aa817a1207d844d793239c6639bc6-7a8d8bde9820387c3e168182b99fd9761c223fff
Loaded 12584 nodes in revision graph
Searching for test results:
 151339 pass 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151324 pass irrelevant
 151307 pass irrelevant
 151327 pass irrelevant
 151503 [host=albana0]
 151516 [host=albana0]
 151757 [host=huxelrebe1]
 151939 [host=albana0]
 152100 [host=fiano1]
 152137 [host=huxelrebe0]
 152282 [host=huxelrebe0]
 152331 [host=huxelrebe0]
 152486 [host=huxelrebe0]
 152514 [host=huxelrebe0]
 152501 [host=fiano0]
 152562 [host=huxelrebe1]
 152614 [host=albana0]
 152656 [host=chardonnay1]
 152671 [host=elbling1]
 152673 pass irrelevant
 152664 [host=albana0]
 152674 [host=pinot0]
 152675 [host=pinot0]
 152853 [host=fiano1]
 153616 fail 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
 153643 pass 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 153644 fail 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
 153645 fail 137c2c6eff67f4750d77e8e40af6683c412d3ed0 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 98bed5de1de3352c63cfe29a00f17e8d9ce72689
 153647 fail 3bd5c994c879f78e8e3d5346dc3b627f199291aa 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 6ada2285d9918859699c92e09540e023e0a16054 f8fe3c07363d11fc81d8e7382dbcaa357c861569
 153650 pass f56d52c7f581da4bb732ab6b456718ae59d39efa 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 153659 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 153660 pass 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 23570bce00ee6ba2139ece978ab6f03ff166e21d
 153661 pass bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 153664 pass 48aa2edf5dae7a1e819ae01c43a326b6c97f20b1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 153641 fail 63d92674d240ab4ecab94f98e1e198842bb7de00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 7a8d8bde9820387c3e168182b99fd9761c223fff
 153667 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 153669 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
 153671 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 153673 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
 153674 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 153675 pass f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
 153676 fail f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
Searching for interesting versions
 Result found: flight 151339 (pass), for basis pass
 For basis failure, parent search stopping at f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94, results HASH(0x5639fd06a1b0) HASH(0x5639fd050bd8) HASH(0x5639fd04e5d0) For basis failure, parent search stopping at f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c155\
 25ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b, results HASH(0x5639fd03ff48) For basis failure, parent search stopping at 48aa2edf5dae7a1e819ae01c43a326b6c97f20b1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b, results HASH(0x5639fd043058) For basis failure, parent search stopping at bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a3\
 4f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780, results HASH(0x5639fc4101f0) For basis failure, parent search stopping at 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 23570bce00ee6ba2139ece978ab6f03ff166e21d, results HASH(0x5639fc410df0) For basis failure, parent search stopping at f56d52c7f581\
 da4bb732ab6b456718ae59d39efa 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655, results HASH(0x5639fd03ed20) For basis failure, parent search stopping at 00b8bf7eda00fb6f0197d3968b6078cfdb4870fa 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6, results HASH(0x5639fd043c5\
 8) HASH(0x5639fd0525e0) Result found: flight 153616 (fail), for basis failure (at ancestor ~5212)
 Repro found: flight 153643 (pass), for basis pass
 Repro found: flight 153644 (fail), for basis failure
 0 revisions at f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3df0424e69549ca21613fad3654509c35b2a3e94
No revisions left to test, checking graph state.
 Result found: flight 153669 (pass), for last pass
 Result found: flight 153671 (fail), for first failure
 Repro found: flight 153673 (pass), for last pass
 Repro found: flight 153674 (fail), for first failure
 Repro found: flight 153675 (pass), for last pass
 Repro found: flight 153676 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  165f3afbfc3db70fcfdccad07085cde0a03c858b
  Bug not present: 3df0424e69549ca21613fad3654509c35b2a3e94
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153676/


  commit 165f3afbfc3db70fcfdccad07085cde0a03c858b
  Author: Ian Jackson <ian.jackson@eu.citrix.com>
  Date:   Mon Jul 13 14:50:33 2020 +0100
  
      Config.mk: Unnail versions (for unstable branch)
      
      Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

pnmtopng: 86 colors found
Revision graph left in /home/logs/results/bisect/linux-5.4/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
153676: tolerable ALL FAIL

flight 153676 linux-5.4 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/153676/

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


