Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CBA1A3DCC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 03:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMihx-0006gz-7h; Fri, 10 Apr 2020 01:43:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fqfT=52=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jMihv-0006gu-Gd
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 01:43:47 +0000
X-Inumbo-ID: b70aa4ac-7acc-11ea-838f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b70aa4ac-7acc-11ea-838f-12813bfff9fa;
 Fri, 10 Apr 2020 01:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IgQw27TUy8ZBlh2/1CDoLLp1cAe7OgZkd7+klEvHKVY=; b=Pvz7NvWGU4vOG4sLtOAeKUz32V
 Z7l0a3wjQGv2sR9vwkqtzuQDYGEo+Gb7DRQigu2EYIBQAH5sf7RhXx6puEUgolT+vMb/i+MqofDZA
 tBci/sCpEkw0mMuFXsmI7icsNsNImCBADR893T7G34f80wpIgOYXu3NZ3aZuXyvhSsoU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMihs-0000Vv-Tq; Fri, 10 Apr 2020 01:43:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMihs-0003xC-HI; Fri, 10 Apr 2020 01:43:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jMihs-0002Kg-Fs; Fri, 10 Apr 2020 01:43:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1jMihs-0002Kg-Fs@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Apr 2020 01:43:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e013e8514389b739153016349e49f5a78e34ddf0
  Bug not present: 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149585/


  commit e013e8514389b739153016349e49f5a78e34ddf0
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Apr 7 15:48:31 2020 +0200
  
      config: use mini-os master for unstable
      
      We haven't used mini-os master for about 2 years now due to a stubdom
      test failing [1]. Booting a guest with mini-os master used for building
      stubdom didn't reveal any problem, so use master for unstable in order
      to let OSStest find any problems not showing up in the local test.
      
      [1]: https://lists.xen.org/archives/html/minios-devel/2018-04/msg00015.html
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/149585.bisection-summary --basis-template=149478 --blessings=real,real-bisect xen-unstable test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 149547 fail [host=huxelrebe1] / 149478 [host=elbling1] 149451 [host=debina0] 149431 [host=elbling0] 149406 [host=albana1] 149378 [host=debina1] 149297 [host=fiano0] 149260 [host=pinot1] 149231 [host=chardonnay0] 149188 [host=debina0] 149151 [host=fiano1] 149121 [host=chardonnay1] 149068 [host=albana0] 149029 [host=italia0] 148980 [host=huxelrebe0] 148925 ok.
Failure / basis pass flights: 149547 / 148925
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9be0b2747bc7381c684cfbdd3fa2e40badefbeef
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 60d6ba1916dce0622a53b00dbae3c01d0761057e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e41\
 0bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/xen.git#60d6ba1916dce0622a53b00dbae3c01d0761057e-9be0b2747bc7381c684cfbdd3fa2e40badefbeef
Loaded 5001 nodes in revision graph
Searching for test results:
 148826 [host=albana0]
 148873 [host=rimava1]
 148925 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 60d6ba1916dce0622a53b00dbae3c01d0761057e
 148980 [host=huxelrebe0]
 149029 [host=italia0]
 149068 [host=albana0]
 149121 [host=chardonnay1]
 149151 [host=fiano1]
 149188 [host=debina0]
 149231 [host=chardonnay0]
 149260 [host=pinot1]
 149297 [host=fiano0]
 149335 []
 149378 [host=debina1]
 149406 [host=albana1]
 149431 [host=elbling0]
 149451 [host=debina0]
 149478 [host=elbling1]
 149502 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef e013e8514389b739153016349e49f5a78e34ddf0
 149549 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 37053578e8bd57de9d114b19a29f5ab1533d6071
 149537 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef e013e8514389b739153016349e49f5a78e34ddf0
 149539 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 5af4698d98d881e786c0909b6308f04696586c49
 149566 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9be0b2747bc7381c684cfbdd3fa2e40badefbeef
 149520 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef e013e8514389b739153016349e49f5a78e34ddf0
 149552 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 4853f03dee2ed17cc421260d669377db253f0dac
 149541 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 98eb0c994ca828da7f38f0ee04c57a0ae24068a5
 149521 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 60d6ba1916dce0622a53b00dbae3c01d0761057e
 149562 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 60d6ba1916dce0622a53b00dbae3c01d0761057e
 149545 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 41cebdd1a6b5e880c768a4af69724851e6a06108
 149557 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6b8836aa65947e58ba2b58573cece03754ad68f6
 149584 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149547 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9be0b2747bc7381c684cfbdd3fa2e40badefbeef
 149561 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149571 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef e013e8514389b739153016349e49f5a78e34ddf0
 149574 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149581 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef e013e8514389b739153016349e49f5a78e34ddf0
 149585 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef e013e8514389b739153016349e49f5a78e34ddf0
Searching for interesting versions
 Result found: flight 148925 (pass), for basis pass
 Result found: flight 149547 (fail), for basis failure
 Repro found: flight 149562 (pass), for basis pass
 Repro found: flight 149566 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
No revisions left to test, checking graph state.
 Result found: flight 149561 (pass), for last pass
 Result found: flight 149571 (fail), for first failure
 Repro found: flight 149574 (pass), for last pass
 Repro found: flight 149581 (fail), for first failure
 Repro found: flight 149584 (pass), for last pass
 Repro found: flight 149585 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e013e8514389b739153016349e49f5a78e34ddf0
  Bug not present: 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149585/


  commit e013e8514389b739153016349e49f5a78e34ddf0
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Apr 7 15:48:31 2020 +0200
  
      config: use mini-os master for unstable
      
      We haven't used mini-os master for about 2 years now due to a stubdom
      test failing [1]. Booting a guest with mini-os master used for building
      stubdom didn't reveal any problem, so use master for unstable in order
      to let OSStest find any problems not showing up in the local test.
      
      [1]: https://lists.xen.org/archives/html/minios-devel/2018-04/msg00015.html
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
149585: tolerable ALL FAIL

flight 149585 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/149585/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    


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


