Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36E280C46
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 04:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1640.4962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOAi4-000819-S6; Fri, 02 Oct 2020 02:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1640.4962; Fri, 02 Oct 2020 02:22:12 +0000
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
	id 1kOAi4-00080r-Nm; Fri, 02 Oct 2020 02:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1640;
 Fri, 02 Oct 2020 02:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOAi2-00080m-S2
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 02:22:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb8106cd-e5a2-4e5e-b3a6-d6598431ca70;
 Fri, 02 Oct 2020 02:22:08 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOAhz-0001dW-IE; Fri, 02 Oct 2020 02:22:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOAhz-0007qo-97; Fri, 02 Oct 2020 02:22:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOAhz-0006XB-8d; Fri, 02 Oct 2020 02:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOAi2-00080m-S2
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 02:22:11 +0000
X-Inumbo-ID: eb8106cd-e5a2-4e5e-b3a6-d6598431ca70
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb8106cd-e5a2-4e5e-b3a6-d6598431ca70;
	Fri, 02 Oct 2020 02:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=d0Sk779KNn0V21V51JW5B+TZ7vkfiqfCDqtdbNIyHtY=; b=jn9OEuGmJZjeuYvQsgzsrZ4wuj
	fJzdK9V5JS95bxCNi2OwMTpkHAA+69ahnZ03OJbXQh1gxZaoGJ/Y+qlJyD5DOoKcKoO3GYk4DST2x
	Zu0DYpaK3LiJrgSaZWhofJtLLkqT3oS4R4+kfaDw4C5QNlo3L8UunTrCg5N2jGxTMScE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOAhz-0001dW-IE; Fri, 02 Oct 2020 02:22:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOAhz-0007qo-97; Fri, 02 Oct 2020 02:22:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOAhz-0006XB-8d; Fri, 02 Oct 2020 02:22:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete test-amd64-amd64-libvirt
Message-Id: <E1kOAhz-0006XB-8d@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Oct 2020 02:22:07 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-amd64-amd64-libvirt
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
  Bug not present: 50a5215f30e964a6f16165ab57925ca39f31a849
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155282/


  commit bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Sep 29 14:48:52 2020 +0100
  
      tools/cpuid: Plumb nested_virt down into xc_cpuid_apply_policy()
      
      Nested Virt is the final special case in legacy CPUID handling.  Pass the
      (poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
      the semantic dependency on HVM_PARAM_NESTEDHVM.
      
      No functional change.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: Wei Liu <wl@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-amd64-amd64-libvirt.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-amd64-amd64-libvirt.guest-start --summary-out=tmp/155282.bisection-summary --basis-template=155128 --blessings=real,real-bisect xen-unstable-smoke test-amd64-amd64-libvirt guest-start
Searching for failure / basis pass:
 155271 fail [host=huxelrebe1] / 155128 [host=godello0] 155089 [host=elbling1] 155080 [host=huxelrebe0] 155048 [host=chardonnay1] 155035 [host=huxelrebe0] 154728 [host=elbling0] 154637 [host=fiano0] 154615 [host=pinot0] 154609 [host=pinot1] 154581 [host=huxelrebe0] 154569 ok.
Failure / basis pass flights: 155271 / 154569
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6-bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
Loaded 5001 nodes in revision graph
Searching for test results:
 154569 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6
 154581 [host=huxelrebe0]
 154609 [host=pinot1]
 154615 [host=pinot0]
 154637 [host=fiano0]
 154728 [host=elbling0]
 155022 []
 155035 [host=huxelrebe0]
 155048 [host=chardonnay1]
 155080 [host=huxelrebe0]
 155089 [host=elbling1]
 155128 [host=godello0]
 155144 [host=pinot0]
 155156 [host=pinot0]
 155162 [host=pinot0]
 155167 [host=pinot0]
 155157 [host=fiano0]
 155174 [host=pinot0]
 155176 [host=godello1]
 155180 [host=fiano0]
 155189 [host=godello1]
 155192 [host=godello1]
 155194 [host=godello1]
 155187 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 11852c7bb070a18c3708b4c001772a23e7d4fc27
 155196 [host=godello1]
 155198 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6
 155203 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 11852c7bb070a18c3708b4c001772a23e7d4fc27
 155206 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 5bcac985498ed83d89666959175ca9c9ed561ae1
 155200 [host=chardonnay0]
 155209 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b18b8801d0457881282b9dde46ca1100bd5e6476
 155214 [host=chardonnay0]
 155213 [host=albana0]
 155216 [host=chardonnay0]
 155220 [host=albana0]
 155228 [host=albana0]
 155225 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 de16a8fa0db7f1879442cf9cfe865eb2e9d98e6d
 155232 [host=albana0]
 155248 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 e301a706eb679a0246cf98324958deb3781c886a
 155253 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0d8d289af7a679c028462c4ed5d98586f9ef9648
 155257 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 50a5215f30e964a6f16165ab57925ca39f31a849
 155246 [host=huxelrebe0]
 155260 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
 155264 [host=huxelrebe0]
 155262 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155269 [host=huxelrebe0]
 155273 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 50a5215f30e964a6f16165ab57925ca39f31a849
 155275 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
 155271 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155279 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 50a5215f30e964a6f16165ab57925ca39f31a849
 155282 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
Searching for interesting versions
 Result found: flight 154569 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 50a5215f30e964a6f16165ab57925ca39f31a849, results HASH(0x56452d21d058) HASH(0x56452cc6a8c8) HASH(0x56452cc78998) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef8\
 28bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0d8d289af7a679c028462c4ed5d98586f9ef9648, results HASH(0x56452d236218) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98\
 c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 e301a706eb679a0246cf98324958deb3781c886a, results HASH(0x56452d223518) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b18b8801d0457881282b9dde46ca1100bd5e6476, results HASH(0x56452d224418) For basis\
  failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 5bcac985498ed83d89666959175ca9c9ed561ae1, results HASH(0x56452d227290) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b\
 1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6, results HASH(0x56452d228818) HASH(0x56452d234390) Result found: flight 155187 (fail), for basis failure (at ancestor ~386)
 Repro found: flight 155198 (pass), for basis pass
 Repro found: flight 155262 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 50a5215f30e964a6f16165ab57925ca39f31a849
No revisions left to test, checking graph state.
 Result found: flight 155257 (pass), for last pass
 Result found: flight 155260 (fail), for first failure
 Repro found: flight 155273 (pass), for last pass
 Repro found: flight 155275 (fail), for first failure
 Repro found: flight 155279 (pass), for last pass
 Repro found: flight 155282 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
  Bug not present: 50a5215f30e964a6f16165ab57925ca39f31a849
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155282/


  commit bfcc97c08c2258316d1cd92c23a441d97ad6ff4e
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Sep 29 14:48:52 2020 +0100
  
      tools/cpuid: Plumb nested_virt down into xc_cpuid_apply_policy()
      
      Nested Virt is the final special case in legacy CPUID handling.  Pass the
      (poorly named) nested_hvm setting down into xc_cpuid_apply_policy() to break
      the semantic dependency on HVM_PARAM_NESTEDHVM.
      
      No functional change.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: Wei Liu <wl@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-amd64-amd64-libvirt.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155282: tolerable FAIL

flight 155282 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155282/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt     12 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt                                     fail    


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


