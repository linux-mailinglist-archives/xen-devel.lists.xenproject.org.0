Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F022349D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 08:33:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwJvo-0005Az-BL; Fri, 17 Jul 2020 06:33:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKPa=A4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jwJvn-0005Au-6s
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 06:33:15 +0000
X-Inumbo-ID: 62b2fb98-c7f7-11ea-9592-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62b2fb98-c7f7-11ea-9592-12813bfff9fa;
 Fri, 17 Jul 2020 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bxvLCeawTEaXq6BucfhAqFe9/AJyJBpM+VPshB4VtEc=; b=LXgEOGupBRF6ffXBcdD9D2oESi
 VefcDhv4aPyHiqRomHCXzbITutMyP35UCVlmFv73Ma1NMVSf45V89jtoJ/jxTNtm4y0tPm0pFF0Os
 dOe6cYced8aTaMYUAyrS9w1IeBz0r0baYbbzcsYxuZG9cBdvHE2tTReursZkEu6HC5eI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwJvj-0005rh-6d; Fri, 17 Jul 2020 06:33:11 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jwJvi-0005Sa-V8; Fri, 17 Jul 2020 06:33:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jwJvi-0008Dl-UR; Fri, 17 Jul 2020 06:33:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
Message-Id: <E1jwJvi-0008Dl-UR@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Jul 2020 06:33:10 +0000
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
job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  da278d58a092bfcc4e36f1e274229c1468dea731
  Bug not present: 23accdf162dcccb9fec9585a64ad01a87b13da5c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151958/


  commit da278d58a092bfcc4e36f1e274229c1468dea731
  Author: Philippe Mathieu-Daudé <philmd@redhat.com>
  Date:   Fri May 8 12:02:22 2020 +0200
  
      accel: Move Xen accelerator code under accel/xen/
      
      This code is not related to hardware emulation.
      Move it under accel/ with the other hypervisors.
      
      Reviewed-by: Paul Durrant <paul@xen.org>
      Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Message-Id: <20200508100222.7112-1-philmd@redhat.com>
      Reviewed-by: Juan Quintela <quintela@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install --summary-out=tmp/151958.bisection-summary --basis-template=151065 --blessings=real,real-bisect qemu-mainline test-amd64-i386-xl-qemuu-debianhvm-i386-xsm debian-hvm-install
Searching for failure / basis pass:
 151934 fail [host=albana1] / 151065 [host=huxelrebe1] 151047 [host=albana0] 150970 [host=huxelrebe0] 150930 [host=elbling1] 150916 [host=elbling0] 150895 [host=debina0] 150831 [host=chardonnay0] 150694 [host=debina1] 150631 [host=pinot0] 150608 [host=fiano1] 150593 ok.
Failure / basis pass flights: 151934 / 150593
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc 3c659044118e34603161457db9934a34f816d78b 8746309137ba470d1b2e8f5ce86ac228625db940 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3-c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://git.qemu.org/qemu.git#4ec2a1f53e8aaa22924614b64dde97321126943e-8746309137ba470d1b2e8f5ce86ac228625db940 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-88ab0c15525ced2eefe39220742efe4769089ad8 git://xenbits.xen.org/xen.git#1497e78068421d83956f8e82fb6e1bf1fc3b1199-165f3afbfc3db70fcfdccad07085cde0a03c858b
From git://cache:9419/git://xenbits.xen.org/osstest/seabios
   88ab0c1..6ada228  xen-tested-master -> origin/xen-tested-master
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 55650 nodes in revision graph
Searching for test results:
 150585 [host=pinot1]
 150593 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 150631 [host=pinot0]
 150608 [host=fiano1]
 150694 [host=debina1]
 150831 [host=chardonnay0]
 150909 []
 150930 [host=elbling1]
 150916 [host=elbling0]
 150895 [host=debina0]
 150899 []
 150970 [host=huxelrebe0]
 151047 [host=albana0]
 151101 fail irrelevant
 151065 [host=huxelrebe1]
 151149 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151221 fail irrelevant
 151175 fail irrelevant
 151241 fail irrelevant
 151286 fail irrelevant
 151269 fail irrelevant
 151328 fail irrelevant
 151304 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 322969adf1fb3d6cfbd613f35121315715aff2ed 3c659044118e34603161457db9934a34f816d78b 171199f56f5f9bdf1e5d670d09ef1351d8f01bae 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151377 fail irrelevant
 151353 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1a992030522622c42aa063788b3276789c56c1e1 3c659044118e34603161457db9934a34f816d78b d4b78317b7cf8c0c635b70086503813f79ff21ec 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151399 fail irrelevant
 151414 fail irrelevant
 151435 fail irrelevant
 151459 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b e7651153a8801dad6805d450ea8bef9b46c1adf5 88ab0c15525ced2eefe39220742efe4769089ad8 88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
 151471 fail irrelevant
 151485 fail irrelevant
 151500 fail irrelevant
 151518 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b fc1bff958998910ec8d25db86cd2f53ff125f7ab 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151547 fail irrelevant
 151598 fail irrelevant
 151577 fail irrelevant
 151622 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b 7b7515702012219410802a168ae4aa45b72a44df 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151656 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151634 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151645 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151669 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151685 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151704 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151778 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b aff2caf6b3fbab1062e117a47b66d27f7fd2f272 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151721 fail irrelevant
 151763 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 48f22ad04ead83e61b4b35871ec6f6109779b791 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151744 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 8796c64ecdfd34be394ea277aaaaa53df0c76996 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151804 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 45db94cc90c286a9965a285ba19450f448760a09 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151816 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 45db94cc90c286a9965a285ba19450f448760a09 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151833 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b 827937158b72ce2265841ff528bba3c44a1bfbc8 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151909 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 86e8c353f705f14f2f2fd7a6195cefa431aa24d9 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 151855 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b d34498309cff7560ac90c422c56e3137e6a64b19 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151841 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b 2033cc6efa98b831d7839e367aa7d5aa74d0750f 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151925 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b af509738f8e4400c26d321abeac924efb04fbfa0 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151849 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b d34498309cff7560ac90c422c56e3137e6a64b19 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151917 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bb78cfbec07eda45118b630a09b0af549b43a135 3c659044118e34603161457db9934a34f816d78b fe0fe4735e798578097758781166cc221319b93d 2e3de6253422112ae43e608661ba94ea6b345694 d9f58cd54fe2f05e1f05e2fe254684bd1840de8e
 151901 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151911 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 6345d7e2aeb6f7bbaa9c1e7e94e21fccf9453c70 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151902 fail irrelevant
 151874 fail irrelevant
 151895 fail irrelevant
 151904 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 3c659044118e34603161457db9934a34f816d78b 9f1f264edbdf5516d6f208497310b3eedbc7b74c 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151920 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 6bb228190ef0b45669d285114cf8a280c55f4b39 2e3de6253422112ae43e608661ba94ea6b345694 ad33a573c009d72466432b41ba0591c64e819c19
 151912 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 49ee11555262a256afec592dfed7c5902d5eefd2 2e3de6253422112ae43e608661ba94ea6b345694 726c78d14dfe6ec76f5e4c7756821a91f0a04b34
 151918 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 250b1da35d579f42319af234f36207902ca4baa4 2e3de6253422112ae43e608661ba94ea6b345694 dde6174ada5280cd9a6396e3b12606360a0d29a3
 151905 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1d24410da356731da70b3334f86343e11e207d2 3c659044118e34603161457db9934a34f816d78b 470dd165d152ff7ceac61c7b71c2b89220b3aad7 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151906 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b eea8f5df4ecc607d64f091b8d916fcc11a697541 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151914 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 256c4470f86e53661c070f8c64a1052e975f9ef0 3c659044118e34603161457db9934a34f816d78b c920fdba39480989cb5f1af3cc63acccef021b54 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 151913 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 5d2f557b47dfbf8f23277a5bdd8473d4607c681a 2e3de6253422112ae43e608661ba94ea6b345694 51ca66c37371b10b378513af126646de22eddb17
 151919 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 71b04329c4f7d5824a289ca5225e1883a278cf3b 2e3de6253422112ae43e608661ba94ea6b345694 e181db8ba4e0797b8f9b55996adfa71ffb5b4081
 151931 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b b889212973dabee119a1ab21326a27fc51b88d6d 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151915 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 7d2410cea154bf915fb30179ebda3b17ac36e70e 2e3de6253422112ae43e608661ba94ea6b345694 780aba2779b834f19b2a6f0dcdea0e7e0b5e1622
 151924 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 98d59d5dd8b662ba8ec7c522faa9b88823389711 2e3de6253422112ae43e608661ba94ea6b345694 dde6174ada5280cd9a6396e3b12606360a0d29a3
 151928 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cde194be8d43ee642db719b4761889f46dd80f27 3c659044118e34603161457db9934a34f816d78b 80bde69353924d99e2a7f5ac6be0ab4cf489d33c 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151949 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b da278d58a092bfcc4e36f1e274229c1468dea731 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151929 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b 0d48b436327955c69e2eb53f88aba9aa1e0dbaa0 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151940 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b aaacf1c15a225ffeb1ff066b78e211594b3a5053 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151933 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151936 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 256c4470f86e53661c070f8c64a1052e975f9ef0 3c659044118e34603161457db9934a34f816d78b c920fdba39480989cb5f1af3cc63acccef021b54 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 151938 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b da278d58a092bfcc4e36f1e274229c1468dea731 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151941 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b 73b994f6d74ec00a1d78daf4145096ff9f0e2982 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151948 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b 23accdf162dcccb9fec9585a64ad01a87b13da5c 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151943 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b d6048bfd12e24a0980ba2040cfaa2b101df3fa16 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151934 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc 3c659044118e34603161457db9934a34f816d78b 8746309137ba470d1b2e8f5ce86ac228625db940 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 151950 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151951 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c7195b9ec3c5f8f40119c96ac4a0ab1e8cebe9dc 3c659044118e34603161457db9934a34f816d78b 8746309137ba470d1b2e8f5ce86ac228625db940 88ab0c15525ced2eefe39220742efe4769089ad8 165f3afbfc3db70fcfdccad07085cde0a03c858b
 151953 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b 23accdf162dcccb9fec9585a64ad01a87b13da5c 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151954 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b da278d58a092bfcc4e36f1e274229c1468dea731 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151955 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b 23accdf162dcccb9fec9585a64ad01a87b13da5c 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151958 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b da278d58a092bfcc4e36f1e274229c1468dea731 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
Searching for interesting versions
 Result found: flight 150593 (pass), for basis pass
 Result found: flight 151934 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 151950 (pass), for basis pass
 Repro found: flight 151951 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 14c7ed8b51f60097ad771277da69f74b22a7a759 3c659044118e34603161457db9934a34f816d78b 23accdf162dcccb9fec9585a64ad01a87b13da5c 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
No revisions left to test, checking graph state.
 Result found: flight 151948 (pass), for last pass
 Result found: flight 151949 (fail), for first failure
 Repro found: flight 151953 (pass), for last pass
 Repro found: flight 151954 (fail), for first failure
 Repro found: flight 151955 (pass), for last pass
 Repro found: flight 151958 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  da278d58a092bfcc4e36f1e274229c1468dea731
  Bug not present: 23accdf162dcccb9fec9585a64ad01a87b13da5c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151958/


  commit da278d58a092bfcc4e36f1e274229c1468dea731
  Author: Philippe Mathieu-Daudé <philmd@redhat.com>
  Date:   Fri May 8 12:02:22 2020 +0200
  
      accel: Move Xen accelerator code under accel/xen/
      
      This code is not related to hardware emulation.
      Move it under accel/ with the other hypervisors.
      
      Reviewed-by: Paul Durrant <paul@xen.org>
      Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Message-Id: <20200508100222.7112-1-philmd@redhat.com>
      Reviewed-by: Juan Quintela <quintela@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.487169 to fit
pnmtopng: 206 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
151958: tolerable ALL FAIL

flight 151958 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/151958/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    


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


