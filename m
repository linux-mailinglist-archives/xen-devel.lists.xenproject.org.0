Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFAF1B84F9
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 10:58:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSGd9-0005Zi-8J; Sat, 25 Apr 2020 08:57:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JVj9=6J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jSGd7-0005Zd-3b
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 08:57:45 +0000
X-Inumbo-ID: d07d2f92-86d2-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d07d2f92-86d2-11ea-b58d-bc764e2007e4;
 Sat, 25 Apr 2020 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SsFGeskfRRkif1RKC3o8tonywz1LiBffeEIbBWU3jcI=; b=reNWO7jOHBsqcHS/GV+k3418yQ
 6nNUi58btyI17eaEEmXMRyk1mfQAigcFtqSIAeXrbZYgV548JYNzS5ojR+pxckmoh3mAEu2wssx7f
 US3OBP1VqqFu9/dRNUH1ntzOmlbjE1AlJNzaQOTsUqzpXb/rd9Ndh5NY3OjrJPHqbIHM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSGd0-0008Fy-KL; Sat, 25 Apr 2020 08:57:38 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSGd0-0005go-5m; Sat, 25 Apr 2020 08:57:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jSGd0-0001IM-5B; Sat, 25 Apr 2020 08:57:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1jSGd0-0001IM-5B@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Apr 2020 08:57:38 +0000
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
job build-amd64
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3acfd35b61688ad9a5b843ee923221eb36e0b613
  Bug not present: 96b5c267e52657e99bd1bbf81dd51925447115e2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149815/


  commit 3acfd35b61688ad9a5b843ee923221eb36e0b613
  Author: Ian Jackson <ian.jackson@eu.citrix.com>
  Date:   Fri Apr 24 15:49:23 2020 +0100
  
      Update QEMU_TRADITIONAL_REVISION
      
      Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/149815.bisection-summary --basis-template=149784 --blessings=real,real-bisect xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 149805 fail [host=huxelrebe0] / 149784 [host=albana0] 149769 [host=godello1] 149760 [host=godello1] 149748 [host=debina0] 149736 [host=fiano1] 149733 [host=italia0] 149727 [host=godello1] 149724 [host=italia0] 149720 [host=godello1] 149713 [host=godello1] 149699 [host=albana1] 149688 [host=albana1] 149686 [host=albana1] 149654 [host=debina0] 149645 [host=godello1] 149644 [host=albana0] 149602 [host=godello1] 149599 [host=pinot0] 149568 [host=italia0] 149523 [host=pinot0] 149499 [host=chardonnay\
 0] 149401 [host=huxelrebe1] 149391 [host=huxelrebe1] 149382 [host=debina1] 149296 [host=debina1] 149284 [host=albana0] 149278 [host=fiano1] 149240 [host=italia0] 149225 [host=albana0] 149213 [host=italia0] 149132 [host=italia0] 149110 ok.
Failure / basis pass flights: 149805 / 149110
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
(tree in basispass but not in latest: qemu)
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 933ebad2470a169504799a1d95b8e410bd9847ef f093b08c47b39da6019421a2b61d40745b3e573b
Basis pass 933ebad2470a169504799a1d95b8e410bd9847ef a87676c4a32f94d79fcaf5b4e0eb59e880e0f032
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/xen.git#a87676c4a32f94d79fcaf5b4e0eb59e880e0f032-f093b08c47b39da6019421a2b61d40745b3e573b
Loaded 5001 nodes in revision graph
Searching for test results:
 149110 pass 933ebad2470a169504799a1d95b8e410bd9847ef a87676c4a32f94d79fcaf5b4e0eb59e880e0f032
 149132 [host=italia0]
 149213 [host=italia0]
 149225 [host=albana0]
 149240 [host=italia0]
 149284 [host=albana0]
 149278 [host=fiano1]
 149296 [host=debina1]
 149382 [host=debina1]
 149391 [host=huxelrebe1]
 149401 [host=huxelrebe1]
 149499 [host=chardonnay0]
 149523 [host=pinot0]
 149568 [host=italia0]
 149644 [host=albana0]
 149599 [host=pinot0]
 149688 [host=albana1]
 149602 [host=godello1]
 149645 [host=godello1]
 149654 [host=debina0]
 149686 [host=albana1]
 149699 [host=albana1]
 149713 [host=godello1]
 149720 [host=godello1]
 149801 pass 933ebad2470a169504799a1d95b8e410bd9847ef 6c122d3984a5efb1f187cde0e478e4e346202f2b
 149788 [host=godello1]
 149724 [host=italia0]
 149789 [host=godello1]
 149727 [host=godello1]
 149733 [host=italia0]
 149769 [host=godello1]
 149736 [host=fiano1]
 149748 [host=debina0]
 149796 pass 933ebad2470a169504799a1d95b8e410bd9847ef a87676c4a32f94d79fcaf5b4e0eb59e880e0f032
 149760 [host=godello1]
 149790 [host=godello1]
 149784 [host=albana0]
 149804 pass 933ebad2470a169504799a1d95b8e410bd9847ef e321576f4047661111c7e069f03fc96294d7bb32
 149785 [host=godello1]
 149793 [host=godello1]
 149798 fail 933ebad2470a169504799a1d95b8e410bd9847ef f093b08c47b39da6019421a2b61d40745b3e573b
 149787 [host=godello1]
 149812 pass 933ebad2470a169504799a1d95b8e410bd9847ef 96b5c267e52657e99bd1bbf81dd51925447115e2
 149794 [host=godello1]
 149799 pass 933ebad2470a169504799a1d95b8e410bd9847ef 8c4aed6ee1073f01f257d170c14c41af7a9cfd39
 149791 fail 933ebad2470a169504799a1d95b8e410bd9847ef f093b08c47b39da6019421a2b61d40745b3e573b
 149795 [host=godello1]
 149802 pass 933ebad2470a169504799a1d95b8e410bd9847ef aa14feb6723d3bb15a884533ade1cd9732792145
 149800 pass 933ebad2470a169504799a1d95b8e410bd9847ef 8b8d011ad868df38afae6282103087556beaa1f9
 149808 fail 933ebad2470a169504799a1d95b8e410bd9847ef 3acfd35b61688ad9a5b843ee923221eb36e0b613
 149806 pass 933ebad2470a169504799a1d95b8e410bd9847ef 96b5c267e52657e99bd1bbf81dd51925447115e2
 149797 fail 933ebad2470a169504799a1d95b8e410bd9847ef f093b08c47b39da6019421a2b61d40745b3e573b
 149810 pass 933ebad2470a169504799a1d95b8e410bd9847ef 96b5c267e52657e99bd1bbf81dd51925447115e2
 149815 fail 933ebad2470a169504799a1d95b8e410bd9847ef 3acfd35b61688ad9a5b843ee923221eb36e0b613
 149805 fail 933ebad2470a169504799a1d95b8e410bd9847ef f093b08c47b39da6019421a2b61d40745b3e573b
 149811 fail 933ebad2470a169504799a1d95b8e410bd9847ef 3acfd35b61688ad9a5b843ee923221eb36e0b613
Searching for interesting versions
 Result found: flight 149110 (pass), for basis pass
 Result found: flight 149791 (fail), for basis failure
 Repro found: flight 149796 (pass), for basis pass
 Repro found: flight 149797 (fail), for basis failure
 0 revisions at 933ebad2470a169504799a1d95b8e410bd9847ef 96b5c267e52657e99bd1bbf81dd51925447115e2
No revisions left to test, checking graph state.
 Result found: flight 149806 (pass), for last pass
 Result found: flight 149808 (fail), for first failure
 Repro found: flight 149810 (pass), for last pass
 Repro found: flight 149811 (fail), for first failure
 Repro found: flight 149812 (pass), for last pass
 Repro found: flight 149815 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3acfd35b61688ad9a5b843ee923221eb36e0b613
  Bug not present: 96b5c267e52657e99bd1bbf81dd51925447115e2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149815/


  commit 3acfd35b61688ad9a5b843ee923221eb36e0b613
  Author: Ian Jackson <ian.jackson@eu.citrix.com>
  Date:   Fri Apr 24 15:49:23 2020 +0100
  
      Update QEMU_TRADITIONAL_REVISION
      
      Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

pnmtopng: 224 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
149815: tolerable ALL FAIL

flight 149815 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/149815/

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


