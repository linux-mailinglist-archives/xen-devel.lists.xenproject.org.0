Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72762ABEDF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 15:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22600.48969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc8Kx-0006DS-03; Mon, 09 Nov 2020 14:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22600.48969; Mon, 09 Nov 2020 14:40:02 +0000
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
	id 1kc8Kw-0006C9-RU; Mon, 09 Nov 2020 14:40:02 +0000
Received: by outflank-mailman (input) for mailman id 22600;
 Mon, 09 Nov 2020 14:40:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47vU=EP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kc8Kv-00064X-B7
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 14:40:01 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 665bd766-ef2c-4c4f-b9f7-b5499f128556;
 Mon, 09 Nov 2020 14:39:53 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kc8Kn-00077m-6V; Mon, 09 Nov 2020 14:39:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kc8Km-0002aP-SG; Mon, 09 Nov 2020 14:39:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kc8Km-0006sF-PL; Mon, 09 Nov 2020 14:39:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=47vU=EP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kc8Kv-00064X-B7
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 14:40:01 +0000
X-Inumbo-ID: 665bd766-ef2c-4c4f-b9f7-b5499f128556
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 665bd766-ef2c-4c4f-b9f7-b5499f128556;
	Mon, 09 Nov 2020 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=qrQXHKWlLc9Y0uMR1SQosLiMSilYhY6+tB2LkaYGl84=; b=g/vNhpwnWsrp++PlpvsB3wJPfL
	erHZ0Nuxlnut7zG02/DRlRV1Pr5qBO1++xCBfWQ0NSU0TBoUai1I0xjhvdg8+KuHXfGLNbtIQVqLH
	C34nQEbcgf1+wUGC+giCja9DxxowwW/BjnURzaiZOkZdk+cbODTpZw7U9QIICLvrfq/U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kc8Kn-00077m-6V; Mon, 09 Nov 2020 14:39:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kc8Km-0002aP-SG; Mon, 09 Nov 2020 14:39:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kc8Km-0006sF-PL; Mon, 09 Nov 2020 14:39:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-libvirt-xsm
Message-Id: <E1kc8Km-0006sF-PL@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Nov 2020 14:39:52 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt-xsm
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
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156586/


  commit e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Nov 6 10:48:07 2020 +0100
  
      xen/rwlock: add check_lock() handling to rwlocks
      
      Checking whether a lock is consistently used regarding interrupts on
      or off is beneficial for rwlocks, too.
      
      So add check_lock() calls to rwlock functions. For this purpose make
      check_lock() globally accessible.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-libvirt-xsm.guest-start --summary-out=tmp/156586.bisection-summary --basis-template=156443 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-libvirt-xsm guest-start
Searching for failure / basis pass:
 156556 fail [host=chardonnay0] / 156443 [host=elbling1] 156401 [host=huxelrebe1] 156389 [host=chardonnay1] 156373 [host=rimava1] 156354 [host=rimava1] 156339 [host=elbling0] 156331 [host=albana0] 156315 [host=pinot0] 156291 [host=pinot1] 156268 [host=fiano1] 156254 [host=fiano0] 156248 [host=albana1] 156228 [host=albana0] 156196 [host=chardonnay1] 156167 [host=chardonnay1] 156136 ok.
Failure / basis pass flights: 156556 / 156136
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
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-677cbe1324c29294bb1d1b8454b3f214725e40fd git://xenbits.xen.org/xen.git#6ca70821b59849ad97c3fadc47e63c1a4af1a78c-0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Loaded 41925 nodes in revision graph
Searching for test results:
 156119 [host=huxelrebe0]
 156136 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c
 156167 [host=chardonnay1]
 156196 [host=chardonnay1]
 156228 [host=albana0]
 156248 [host=albana1]
 156254 [host=fiano0]
 156268 [host=fiano1]
 156291 [host=pinot1]
 156315 [host=pinot0]
 156331 [host=albana0]
 156339 [host=elbling0]
 156354 [host=rimava1]
 156373 [host=rimava1]
 156389 [host=chardonnay1]
 156401 [host=huxelrebe1]
 156443 [host=elbling1]
 156524 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34
 156538 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156568 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6ca70821b59849ad97c3fadc47e63c1a4af1a78c
 156570 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156571 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 82c0d3d491ccb183cf12c87775086b68531b8444
 156578 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156572 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd dac867bf9adc1562a4cf9db5f89726597af13ef8
 156574 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 9ff9705647646aa937b5f5c1426a64c69a62b3bd
 156556 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156576 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 957708c2d1ae25d7375abd5e5e70c3043d64f1f1
 156580 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156581 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156583 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156584 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156586 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
Searching for interesting versions
 Result found: flight 156136 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c, results HASH(0x55aee1f71b90) HASH(0x55aedeea4e50) HASH(0x55aedee060f0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef8\
 28bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 957708c2d1ae25d7375abd5e5e70c3043d64f1f1, results HASH(0x55aee1f71928) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98\
 c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 9ff9705647646aa937b5f5c1426a64c69a62b3bd, results HASH(0x55aee1f6e298) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd dac867bf9adc1562a4cf9db5f89726597af13ef8, results HASH(0x55aee1f71268) For basis\
  failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 82c0d3d491ccb183cf12c87775086b68531b8444, results HASH(0x55aee1f71bf0) Result found: flight 156524 (fail), for basis failure (at ancestor ~32)
 Repro found: flight 156568 (pass), for basis pass
 Repro found: flight 156570 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
No revisions left to test, checking graph state.
 Result found: flight 156578 (pass), for last pass
 Result found: flight 156580 (fail), for first failure
 Repro found: flight 156581 (pass), for last pass
 Repro found: flight 156583 (fail), for first failure
 Repro found: flight 156584 (pass), for last pass
 Repro found: flight 156586 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156586/


  commit e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Nov 6 10:48:07 2020 +0100
  
      xen/rwlock: add check_lock() handling to rwlocks
      
      Checking whether a lock is consistently used regarding interrupts on
      or off is beneficial for rwlocks, too.
      
      So add check_lock() calls to rwlock functions. For this purpose make
      check_lock() globally accessible.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
156586: tolerable FAIL

flight 156586 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156586/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-xsm  14 guest-start             fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-xsm                                  fail    


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


