Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120277998A6
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 15:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598556.933459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qey5C-0006gt-Ue; Sat, 09 Sep 2023 13:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598556.933459; Sat, 09 Sep 2023 13:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qey5C-0006fD-Q7; Sat, 09 Sep 2023 13:33:06 +0000
Received: by outflank-mailman (input) for mailman id 598556;
 Sat, 09 Sep 2023 13:33:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qey5B-0006f2-Fk; Sat, 09 Sep 2023 13:33:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qey5B-0007b3-Ce; Sat, 09 Sep 2023 13:33:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qey5B-0002tr-3J; Sat, 09 Sep 2023 13:33:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qey5B-0006su-2v; Sat, 09 Sep 2023 13:33:05 +0000
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
	bh=CAXxl7NwOSDzmjPBvWHEeHyZoncYf/lrp9+TSjhee0g=; b=I9MZriBtj7lrFuYsrewe6BbEIZ
	Ky9usM/VhHoo/kRNkQgB7MB3n5kIB2UkxoheZOF4ruAH+nst7bEG9vH0DPpR3dnBgam9fUOnmSaEP
	gcvJaQV6v9t3MEfKoJdypJHEEI2QQ5L3HKiWL9zxAxCu4NwTKWylx+hr0CAOZ7D2/gTI=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-i386
Message-Id: <E1qey5B-0006su-2v@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Sep 2023 13:33:05 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Bug not present: aa7354beb1238e68126815e060f7d5ccda48fcb8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182832/


  commit 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Author: Vikram Garhwal <vikram.garhwal@amd.com>
  Date:   Tue Sep 5 18:16:30 2023 -0700
  
      tools/xl: Add new xl command overlay for device tree overlay support
      
      Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-i386.xen-build --summary-out=tmp/182832.bisection-summary --basis-template=182707 --blessings=real,real-bisect,real-retry qemu-mainline build-i386 xen-build
Searching for failure / basis pass:
 182801 fail [host=nobling1] / 182707 [host=pinot1] 182638 [host=fiano0] 182606 [host=nobling0] 182588 [host=nobling0] 182584 [host=albana1] 182570 ok.
Failure / basis pass flights: 182801 / 182570
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
Basis pass 0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 156618d9ea67f2f2e31d9dedd97f2dcccbe6808c 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 8c01f267eff3d6c1ea04273e9885bf6d2fda1c44
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af-b240eab03530f063ef5438497d70a731b19a201e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#156618d9ea67f2f2e31d9dedd97f2dcccbe6808c-c5ea91da443b458352c1b629b490ee6631775cb4 git://xenbits.xen.org/osstest/seabios.git#7a4003be25eae462f3c3d8aad96b57e\
 34dc0c2b8-7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 git://xenbits.xen.org/xen.git#8c01f267eff3d6c1ea04273e9885bf6d2fda1c44-cba6d44a13d5e25334d164e27cb1b1d7674aa05e
Loaded 25167 nodes in revision graph
Searching for test results:
 182570 pass 0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 156618d9ea67f2f2e31d9dedd97f2dcccbe6808c 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 8c01f267eff3d6c1ea04273e9885bf6d2fda1c44
 182584 [host=albana1]
 182588 [host=nobling0]
 182606 [host=nobling0]
 182638 [host=fiano0]
 182707 [host=pinot1]
 182723 [host=nobling0]
 182730 [host=nobling0]
 182739 fail irrelevant
 182770 [host=nobling0]
 182796 fail irrelevant
 182802 pass 0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 156618d9ea67f2f2e31d9dedd97f2dcccbe6808c 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 8c01f267eff3d6c1ea04273e9885bf6d2fda1c44
 182804 fail irrelevant
 182805 pass irrelevant
 182806 pass 4d196352f35ac516b477e568265b4e537b0283d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bde438c3ecdb9813038b226c429dd982925d8205 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 d8c3ff585b9fd10200b05aca77139de2789d0517
 182807 pass irrelevant
 182808 pass irrelevant
 182809 pass f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bb5c77c4f8a5ea9cb3f6bcf5ca33bab4d85d1d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 3ec9528a8262dd461718881d251fba01d3e662fa
 182811 pass irrelevant
 182812 fail irrelevant
 182801 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182813 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182815 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2f352bc2270fdc896beb2957b5171b03ba3e2d66 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182816 fail 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 631c872614aca91eaf947c1748f0f27f99635d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182817 pass b81557a00c61cc80ab118828f16ed9ce79455880 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 269e60635a72f8dec4cb210b5b99e9e7f8920f34 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182818 pass 4d196352f35ac516b477e568265b4e537b0283d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 06fca745d5ba3be8b693985e6075d6ba2782f145 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 d8c3ff585b9fd10200b05aca77139de2789d0517
 182819 fail 4d196352f35ac516b477e568265b4e537b0283d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182820 pass dfb941d32a2f38c9177729e39c6a6515abbbad48 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6657e41cde73597e61c0165da7be7e76f116f342 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f805cf3e9b87584e16b03b5059b1163fd22bf5a0
 182821 pass dfb941d32a2f38c9177729e39c6a6515abbbad48 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1663ffb9157e3dc17d14741f6cd6c48bfffde9d0 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f805cf3e9b87584e16b03b5059b1163fd22bf5a0
 182822 pass f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 427b6a571cd275015c201abd5b6a7843452d95a0
 182823 pass f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b8de00ff7a4bbf7a9fd480d6d7db458db3020f6d
 182824 pass f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f61243530e2a1e10f9414653d37d99df61fd88ad
 182825 fail f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182826 pass f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 aa7354beb1238e68126815e060f7d5ccda48fcb8
 182827 fail f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182828 pass f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 aa7354beb1238e68126815e060f7d5ccda48fcb8
 182829 fail f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
 182831 pass f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 aa7354beb1238e68126815e060f7d5ccda48fcb8
 182832 fail f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
Searching for interesting versions
 Result found: flight 182570 (pass), for basis pass
 Result found: flight 182801 (fail), for basis failure (at ancestor ~6)
 Repro found: flight 182802 (pass), for basis pass
 Repro found: flight 182813 (fail), for basis failure
 0 revisions at f008890ae55929f7f17e7d2f8aff929255007d33 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e38f4e976dd40c985bfe84230a627de9a108c9d3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 aa7354beb1238e68126815e060f7d5ccda48fcb8
No revisions left to test, checking graph state.
 Result found: flight 182826 (pass), for last pass
 Result found: flight 182827 (fail), for first failure
 Repro found: flight 182828 (pass), for last pass
 Repro found: flight 182829 (fail), for first failure
 Repro found: flight 182831 (pass), for last pass
 Repro found: flight 182832 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Bug not present: aa7354beb1238e68126815e060f7d5ccda48fcb8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182832/


  commit 61765a07e3d8a4dabbb8323b55f13ee75c80e54a
  Author: Vikram Garhwal <vikram.garhwal@amd.com>
  Date:   Tue Sep 5 18:16:30 2023 -0700
  
      tools/xl: Add new xl command overlay for device tree overlay support
      
      Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182832: tolerable ALL FAIL

flight 182832 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182832/

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


