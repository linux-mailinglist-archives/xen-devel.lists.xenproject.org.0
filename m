Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F897799D7B
	for <lists+xen-devel@lfdr.de>; Sun, 10 Sep 2023 11:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598676.933660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfGer-0000WR-Mw; Sun, 10 Sep 2023 09:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598676.933660; Sun, 10 Sep 2023 09:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfGer-0000Tk-K9; Sun, 10 Sep 2023 09:23:09 +0000
Received: by outflank-mailman (input) for mailman id 598676;
 Sun, 10 Sep 2023 09:23:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfGep-0000Ta-V3; Sun, 10 Sep 2023 09:23:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfGep-0004Z0-RJ; Sun, 10 Sep 2023 09:23:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfGep-0003RO-JA; Sun, 10 Sep 2023 09:23:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qfGep-0001Gg-Id; Sun, 10 Sep 2023 09:23:07 +0000
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
	bh=SzXiJN1WxNhvl8Rygjb5JUfYq+aYWPyPxA7o3ha2tC4=; b=0jQkSlGYRR1r1HufBtGuQil5zG
	GFyL/BUR75bq5WgAN6pLEI1vSFq/cn/qbEjOTTi3WJV/xzldiqe4Ij+4xEPJ5lSIGbKM+Mp1KhqJd
	292VhGOvrdP/oAOAjUYoROH8rPcQqelN66Nc+3YtCwZBDICdQLM1yW32kob+DeLFq5NE=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-arm64
Message-Id: <E1qfGep-0001Gg-Id@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Sep 2023 09:23:07 +0000

branch xen-unstable
xenbranch xen-unstable
job build-arm64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  03a3a62fbd0aa5227e978eef3c67d3978aec9e5f
  Bug not present: 13d9f6dca08a38e9258b6328f3ad61bdb8e19619
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182856/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64.xen-build --summary-out=tmp/182856.bisection-summary --basis-template=182707 --blessings=real,real-bisect,real-retry qemu-mainline build-arm64 xen-build
Searching for failure / basis pass:
 182845 fail [host=rochester1] / 182707 ok.
Failure / basis pass flights: 182845 / 182707
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
Basis pass 4d196352f35ac516b477e568265b4e537b0283d8 c152379422a204109f34ca2b43ecc538c7d738ae 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 74b725a64d800822e007e0f449317ff0a8249971
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#4d196352f35ac516b477e568265b4e537b0283d8-b240eab03530f063ef5438497d70a731b19a201e https://gitlab.com/qemu-project/qemu.git#c152379422a204109f34ca2b43ecc538c7d738ae-c5ea91da443b458352c1b629b490ee6631775cb4 git://xenbits.xen.org/osstest/seabios.git#7a4003be25eae462f3c3d8aad96b57e34dc0c2b8-7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 git://xenbits.xen.org/xen.git#74b725a64d800822e007e0f449317ff0a8249971-49b2d6a\
 529122f10e17a17f807d8d51154b5ba14
Loaded 25071 nodes in revision graph
Searching for test results:
 182707 pass 4d196352f35ac516b477e568265b4e537b0283d8 c152379422a204109f34ca2b43ecc538c7d738ae 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 74b725a64d800822e007e0f449317ff0a8249971
 182723 [host=rochester0]
 182730 [host=rochester0]
 182739 [host=rochester0]
 182770 [host=rochester0]
 182796 [host=rochester0]
 182801 [host=rochester0]
 182833 [host=rochester0]
 182814 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182834 [host=rochester0]
 182836 pass 4d196352f35ac516b477e568265b4e537b0283d8 c152379422a204109f34ca2b43ecc538c7d738ae 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 74b725a64d800822e007e0f449317ff0a8249971
 182837 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182838 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 2f352bc2270fdc896beb2957b5171b03ba3e2d66 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182839 fail 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 631c872614aca91eaf947c1748f0f27f99635d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182840 pass b81557a00c61cc80ab118828f16ed9ce79455880 9f89423537653de07ca40c18b5ff5b70b104cc93 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182841 pass bbf182229587958b17336c114e0a1525c4f90f3d c152379422a204109f34ca2b43ecc538c7d738ae 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182835 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182843 fail b29150aa3e9157908052c212d3afacbff8dbab1b 631c872614aca91eaf947c1748f0f27f99635d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182844 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182846 fail b81557a00c61cc80ab118828f16ed9ce79455880 03a3a62fbd0aa5227e978eef3c67d3978aec9e5f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182847 pass b81557a00c61cc80ab118828f16ed9ce79455880 c152379422a204109f34ca2b43ecc538c7d738ae 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182848 pass b81557a00c61cc80ab118828f16ed9ce79455880 c97d45d55798b27410253df8fc724d2a02189aa8 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182850 pass b81557a00c61cc80ab118828f16ed9ce79455880 13d9f6dca08a38e9258b6328f3ad61bdb8e19619 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182851 fail b81557a00c61cc80ab118828f16ed9ce79455880 03a3a62fbd0aa5227e978eef3c67d3978aec9e5f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182852 pass b81557a00c61cc80ab118828f16ed9ce79455880 13d9f6dca08a38e9258b6328f3ad61bdb8e19619 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182845 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182853 fail b81557a00c61cc80ab118828f16ed9ce79455880 03a3a62fbd0aa5227e978eef3c67d3978aec9e5f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182855 pass b81557a00c61cc80ab118828f16ed9ce79455880 13d9f6dca08a38e9258b6328f3ad61bdb8e19619 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182856 fail b81557a00c61cc80ab118828f16ed9ce79455880 03a3a62fbd0aa5227e978eef3c67d3978aec9e5f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
Searching for interesting versions
 Result found: flight 182707 (pass), for basis pass
 Result found: flight 182814 (fail), for basis failure (at ancestor ~11)
 Repro found: flight 182836 (pass), for basis pass
 Repro found: flight 182844 (fail), for basis failure
 0 revisions at b81557a00c61cc80ab118828f16ed9ce79455880 13d9f6dca08a38e9258b6328f3ad61bdb8e19619 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
No revisions left to test, checking graph state.
 Result found: flight 182850 (pass), for last pass
 Result found: flight 182851 (fail), for first failure
 Repro found: flight 182852 (pass), for last pass
 Repro found: flight 182853 (fail), for first failure
 Repro found: flight 182855 (pass), for last pass
 Repro found: flight 182856 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  03a3a62fbd0aa5227e978eef3c67d3978aec9e5f
  Bug not present: 13d9f6dca08a38e9258b6328f3ad61bdb8e19619
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182856/


  (Revision log too long, omitted.)

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182856: tolerable ALL FAIL

flight 182856 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182856/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64                   6 xen-build               fail baseline untested


jobs:
 build-arm64                                                  fail    


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


