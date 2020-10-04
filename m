Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15A282913
	for <lists+xen-devel@lfdr.de>; Sun,  4 Oct 2020 07:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2669.7632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOwYk-0007MM-N2; Sun, 04 Oct 2020 05:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2669.7632; Sun, 04 Oct 2020 05:27:46 +0000
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
	id 1kOwYk-0007M4-Id; Sun, 04 Oct 2020 05:27:46 +0000
Received: by outflank-mailman (input) for mailman id 2669;
 Sun, 04 Oct 2020 05:27:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOwYj-0007Lz-Ib
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 05:27:45 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffcc0928-8533-4fd2-9321-3835551ba52c;
 Sun, 04 Oct 2020 05:27:41 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOwYf-0004P9-EV; Sun, 04 Oct 2020 05:27:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOwYe-0000UY-NE; Sun, 04 Oct 2020 05:27:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOwYe-0003BG-Mj; Sun, 04 Oct 2020 05:27:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOwYj-0007Lz-Ib
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 05:27:45 +0000
X-Inumbo-ID: ffcc0928-8533-4fd2-9321-3835551ba52c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ffcc0928-8533-4fd2-9321-3835551ba52c;
	Sun, 04 Oct 2020 05:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=TWXiAgo/uRCBlzw/NT/XJWBKEzBwt7G35vktre4gJ1Q=; b=C5Jun9dDpddmabx3oxnkZ+kP6C
	aGxb5Ce5PYSReKvY8j8XPnBF199JtMyIYW/rsfVPIp+h7K/InIDJMAkCDyYXdcqxje0ryEztarjZh
	0HC3mPpbPM0ga5/zIfO83TVXIDSnkqMJsyvGuw/HdAilDvd+mOAEDSDf1pAnaUTtRshI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOwYf-0004P9-EV; Sun, 04 Oct 2020 05:27:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOwYe-0000UY-NE; Sun, 04 Oct 2020 05:27:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOwYe-0003BG-Mj; Sun, 04 Oct 2020 05:27:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete test-amd64-amd64-libvirt-xsm
Message-Id: <E1kOwYe-0003BG-Mj@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Oct 2020 05:27:40 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
job test-amd64-amd64-libvirt-xsm
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  21054297bf832d8eacd73dc428f55168522b0d86
  Bug not present: a8122e991da70ac1ee9f88e34e003d2169a5b114
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155425/


  commit 21054297bf832d8eacd73dc428f55168522b0d86
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:26:01 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-amd64-amd64-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-libvirt-xsm.guest-start --summary-out=tmp/155425.bisection-summary --basis-template=154358 --blessings=real,real-bisect xen-4.13-testing test-amd64-amd64-libvirt-xsm guest-start
Searching for failure / basis pass:
 155258 fail [host=fiano0] / 154602 [host=godello0] 154358 [host=godello1] 152528 [host=godello0] 151712 [host=huxelrebe1] 151337 [host=godello0] 151153 [host=godello1] 151048 [host=pinot0] 150944 [host=chardonnay0] 150177 [host=elbling1] 150073 [host=albana0] 150042 [host=godello1] 149836 [host=italia0] 149664 [host=debina1] 149647 ok.
Failure / basis pass flights: 155258 / 149647
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
Basis pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bd6aa93296de36c5afabd34e4fa4083bccb8488d d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 b66ce5058ec9ce84418cedd39b2bf07b7c5a1f65
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#9d6920bd7de3f92be1894790adeb689060ab25eb-9d6920bd7de3f92be1894790adeb689060ab25eb https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc\
 7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#bd6aa93296de36c5afabd34e4fa4083bccb8488d-d8ab884fe9b4dd148980bf0d8673187f8fb25887 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847\
 ef-730e2b1927e7d911bbd5350714054ddd5912f4ed git://xenbits.xen.org/osstest/seabios.git#6a3b59ab9c7dc00331c21346052dfa6a0df45aa3-41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 git://xenbits.xen.org/xen.git#b66ce5058ec9ce84418cedd39b2bf07b7c5a1f65-88f5b414ac0f8008c1e2b26f93c3d980120941f7
Loaded 88564 nodes in revision graph
Searching for test results:
 149647 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bd6aa93296de36c5afabd34e4fa4083bccb8488d d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 b66ce5058ec9ce84418cedd39b2bf07b7c5a1f65
 149664 [host=debina1]
 149836 [host=italia0]
 150042 [host=godello1]
 150073 [host=albana0]
 150177 [host=elbling1]
 150944 [host=chardonnay0]
 151048 [host=pinot0]
 151153 [host=godello1]
 151337 [host=godello0]
 151712 [host=huxelrebe1]
 152528 [host=godello0]
 154358 [host=godello1]
 154602 [host=godello0]
 154625 fail irrelevant
 154667 fail irrelevant
 155015 []
 155062 fail irrelevant
 155132 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
 155309 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bd6aa93296de36c5afabd34e4fa4083bccb8488d d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 b66ce5058ec9ce84418cedd39b2bf07b7c5a1f65
 155364 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
 155367 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 88ab0c15525ced2eefe39220742efe4769089ad8 1c7a98cab9101d8fedadd0bb0ccafc4498b37560
 155369 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422e93e1de6f265ff48eaacc8cf7c44d6401062e d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
 155372 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5ba203b54e5953572e279e5505cd65e4cc360e34 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
 155258 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
 155374 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7bcb021a6d54c5775c0fa1a3ea003b61f5c966ed d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9
 155378 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
 155382 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 42fcdd42328f9819530f3f0350f9b851acc7c1a0
 155387 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 f63b20a213ecaa672cf40b4627eb1eea9542cb58
 155393 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 e1364e05f92d6c2f12cc77f100cea584354c66cb
 155398 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 43572a4cd97902ba0155b922a4d2e99fb945ec2b
 155403 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
 155408 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 21054297bf832d8eacd73dc428f55168522b0d86
 155412 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
 155416 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 21054297bf832d8eacd73dc428f55168522b0d86
 155421 pass 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
 155425 fail 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 21054297bf832d8eacd73dc428f55168522b0d86
Searching for interesting versions
 Result found: flight 149647 (pass), for basis pass
 For basis failure, parent search stopping at 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114, results HASH(0x55c976943580) HASH(0x55c9769\
 2bfb0) HASH(0x55c97073e7e0) For basis failure, parent search stopping at 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 e1364e05f92d6c2f12cc77f100cea584354c66cb, results HASH(0x5\
 5c97690b888) For basis failure, parent search stopping at 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 42fcdd42328f9819530f3f0350f9b851acc7c1a0, results HASH(0x55c976917df0) Fo\
 r basis failure, parent search stopping at 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7bcb021a6d54c5775c0fa1a3ea003b61f5c966ed d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9, results HASH(0x55c97695e680) For basis failure\
 , parent search stopping at 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5ba203b54e5953572e279e5505cd65e4cc360e34 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f, results HASH(0x55c976924448) For basis failure, parent search\
  stopping at 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422e93e1de6f265ff48eaacc8cf7c44d6401062e d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f, results HASH(0x55c97694e7d0) For basis failure, parent search stopping at 9d\
 6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 88ab0c15525ced2eefe39220742efe4769089ad8 1c7a98cab9101d8fedadd0bb0ccafc4498b37560, results HASH(0x55c976947290) Result found: flight 155132 (fail), for basis failure (at ance\
 stor ~752)
 Repro found: flight 155309 (pass), for basis pass
 Repro found: flight 155378 (fail), for basis failure
 0 revisions at 9d6920bd7de3f92be1894790adeb689060ab25eb 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
No revisions left to test, checking graph state.
 Result found: flight 155403 (pass), for last pass
 Result found: flight 155408 (fail), for first failure
 Repro found: flight 155412 (pass), for last pass
 Repro found: flight 155416 (fail), for first failure
 Repro found: flight 155421 (pass), for last pass
 Repro found: flight 155425 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  21054297bf832d8eacd73dc428f55168522b0d86
  Bug not present: a8122e991da70ac1ee9f88e34e003d2169a5b114
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155425/


  commit 21054297bf832d8eacd73dc428f55168522b0d86
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:26:01 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.739278 to fit
pnmtopng: 73 colors found
Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155425: tolerable FAIL

flight 155425 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155425/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm 12 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-xsm                                 fail    


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


