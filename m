Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5123CBA4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 17:11:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3L4L-0008Cf-Em; Wed, 05 Aug 2020 15:11:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8x8=BP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k3L4J-0008C8-DE
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 15:11:03 +0000
X-Inumbo-ID: d53f5629-089f-4108-82d7-d237a3eb5010
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d53f5629-089f-4108-82d7-d237a3eb5010;
 Wed, 05 Aug 2020 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w4q0oysIxaLNxRB+TodGGYga9pYqch9z9aTZXCIoq4Y=; b=f30zM5bI9I54JDnOb1ma469nHi
 UnehWo3MVuJh8ODjXw/uK9r/QqaPpqYv5/bZ7q1QH6+H19U/GMg8fXwlj5uSHqqmI+beZu580FCYg
 OhLaSqgdzXwRKxupd32WPZkHBtv7KdAKk/VHr4d419F9f45Ip5pxBRkaOkF3pUuY0j0o=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3L4E-0007v0-Tg; Wed, 05 Aug 2020 15:10:58 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3L4E-0007i0-JB; Wed, 05 Aug 2020 15:10:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k3L4E-0006Dy-IT; Wed, 05 Aug 2020 15:10:58 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-xl-qemuu-ws16-amd64
Message-Id: <E1k3L4E-0006Dy-IT@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Aug 2020 15:10:58 +0000
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
job test-amd64-i386-xl-qemuu-ws16-amd64
testid windows-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  7d3660e79830a069f1848bb4fa1cdf8f666424fb
  Bug not present: 9e3903136d9acde2fb2dd9e967ba928050a6cb4a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/152490/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-ws16-amd64.windows-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-ws16-amd64.windows-install --summary-out=tmp/152490.bisection-summary --basis-template=151065 --blessings=real,real-bisect qemu-mainline test-amd64-i386-xl-qemuu-ws16-amd64 windows-install
Searching for failure / basis pass:
 152456 fail [host=fiano1] / 151065 ok.
Failure / basis pass flights: 152456 / 151065
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e557442e3f7ec7bee2d886978bbd259c6d68c75a 3c659044118e34603161457db9934a34f816d78b 5c1c3e4f02e458cf280c677c817ae4fd1ed9bf10 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 81fd0d3ca4b2cd309403c6e8da662c325dd35750
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#dafce295e6f447ed8905db4e29241e2c6c2a4389-e557442e3f7ec7bee2d886978bbd259c6d68c75a git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://git.qemu.org/qemu.git#9e3903136d9acde2fb2dd9e967ba928050a6cb4a-5c1c3e4f02e458cf280c677c817ae4fd1ed9bf10 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-d9c812dda519a1a73e8370e1b81ddf46eb22ed16 git://xenbits.xen.org/xen.git#058023b343d4e366864831db46e9b438e9e3a178-81fd0d3ca4b2cd309403c6e8da662c325dd35750
From git://cache:9419/git://xenbits.xen.org/xen
   c9f9a7258d..e58a71274c  smoke      -> origin/smoke
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 55467 nodes in revision graph
Searching for test results:
 151101 fail irrelevant
 151065 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 151149 [host=fiano0]
 151221 fail irrelevant
 151175 [host=fiano0]
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
 151855 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b d34498309cff7560ac90c422c56e3137e6a64b19 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151841 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b 2033cc6efa98b831d7839e367aa7d5aa74d0750f 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151849 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b d34498309cff7560ac90c422c56e3137e6a64b19 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151874 fail irrelevant
 151895 fail irrelevant
 151914 fail irrelevant
 151934 fail irrelevant
 151968 fail irrelevant
 151952 fail irrelevant
 152013 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d8327496762b4f2a54c9bafd7a214314ec28e9e 3c659044118e34603161457db9934a34f816d78b 939ab64b400b9bec4b59795a87817784093e1acd 6ada2285d9918859699c92e09540e023e0a16054 fb024b779336a0f73b3aee885b2ce082e812881f
 151988 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff53d2a13740e39dea110d6b3509c156c659586 3c659044118e34603161457db9934a34f816d78b b7bda69c4ef46c57480f6e378923f5215b122778 6ada2285d9918859699c92e09540e023e0a16054 f8fe3c07363d11fc81d8e7382dbcaa357c861569
 151999 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d8327496762b4f2a54c9bafd7a214314ec28e9e 3c659044118e34603161457db9934a34f816d78b 97f750becac33e3d3e446d3ff4ae9af2577b7877 6ada2285d9918859699c92e09540e023e0a16054 fb024b779336a0f73b3aee885b2ce082e812881f
 152026 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d8327496762b4f2a54c9bafd7a214314ec28e9e 3c659044118e34603161457db9934a34f816d78b 9fc87111005e8903785db40819af66b8f85b8b96 6ada2285d9918859699c92e09540e023e0a16054 fb024b779336a0f73b3aee885b2ce082e812881f
 152039 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d8327496762b4f2a54c9bafd7a214314ec28e9e 3c659044118e34603161457db9934a34f816d78b 9fc87111005e8903785db40819af66b8f85b8b96 6ada2285d9918859699c92e09540e023e0a16054 fb024b779336a0f73b3aee885b2ce082e812881f
 152058 fail irrelevant
 152076 fail irrelevant
 152108 fail irrelevant
 152144 fail irrelevant
 152171 fail irrelevant
 152200 fail irrelevant
 152189 fail irrelevant
 152211 fail irrelevant
 152219 fail irrelevant
 152227 fail irrelevant
 152241 fail irrelevant
 152286 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 152266 fail irrelevant
 152284 fail irrelevant
 152289 fail irrelevant
 152292 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b eefe34ea4b82c2b47abe28af4cc7247d51553626 2e3de6253422112ae43e608661ba94ea6b345694 25636ed707cf1211ce846c7ec58f8643e435d7a7
 152356 [host=fiano0]
 152294 fail irrelevant
 152376 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 152298 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b 3f429a3400822141651486193d6af625eeab05a5 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 152325 [host=fiano0]
 152299 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 54cdfe511219b8051046be55a6e156c4f08ff7ff 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 152300 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b 6675a653d2e57ab09c32c0ea7b44a1d6c40a7f58 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 152345 [host=fiano0]
 152301 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 53550e81e2cafe7c03a39526b95cd21b5194d9b1 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 152304 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6cca8e111696fbbd7c233dc53f9c80b6a43359d 2e3de6253422112ae43e608661ba94ea6b345694 fec6a7af5c5760b9bccd9e7c3eaf29f0401af264
 152328 [host=fiano0]
 152295 []
 152359 [host=fiano0]
 152307 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 3664f7b7788b66bb802432e6748be0fb57993581
 152333 [host=fiano0]
 152346 [host=fiano0]
 152324 [host=fiano0]
 152335 [host=fiano0]
 152369 [host=fiano0]
 152309 [host=fiano0]
 152336 [host=fiano0]
 152338 [host=fiano0]
 152349 [host=fiano0]
 152340 [host=fiano0]
 152341 [host=fiano0]
 152343 [host=fiano0]
 152361 [host=fiano0]
 152352 [host=fiano0]
 152337 fail irrelevant
 152364 [host=fiano0]
 152372 [host=fiano0]
 152394 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 365fdb0f939cf00b26d37f27adbf579aa984221b 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 152381 fail irrelevant
 152390 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b16fd231f6d8124fa05a0f086840934b8709faf9 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 152380 [host=fiano0]
 152397 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 ceaae74cedd2f7f8ae5c66b90da82f7ead206011
 152400 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4cfb842fca9693a330cb5435284c1ee8bfbbace 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 152433 [host=fiano0]
 152406 [host=fiano0]
 152489 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 152409 [host=fiano0]
 152436 [host=fiano0]
 152453 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e557442e3f7ec7bee2d886978bbd259c6d68c75a 3c659044118e34603161457db9934a34f816d78b d74824cf7c8b352f9045e949dc636c7207a41eee d9c812dda519a1a73e8370e1b81ddf46eb22ed16 81fd0d3ca4b2cd309403c6e8da662c325dd35750
 152416 [host=fiano0]
 152479 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 152420 [host=fiano0]
 152411 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e557442e3f7ec7bee2d886978bbd259c6d68c75a 3c659044118e34603161457db9934a34f816d78b d74824cf7c8b352f9045e949dc636c7207a41eee d9c812dda519a1a73e8370e1b81ddf46eb22ed16 81fd0d3ca4b2cd309403c6e8da662c325dd35750
 152427 [host=fiano0]
 152441 [host=fiano0]
 152467 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 152450 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 152481 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e557442e3f7ec7bee2d886978bbd259c6d68c75a 3c659044118e34603161457db9934a34f816d78b 5c1c3e4f02e458cf280c677c817ae4fd1ed9bf10 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 81fd0d3ca4b2cd309403c6e8da662c325dd35750
 152476 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 152456 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e557442e3f7ec7bee2d886978bbd259c6d68c75a 3c659044118e34603161457db9934a34f816d78b 5c1c3e4f02e458cf280c677c817ae4fd1ed9bf10 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 81fd0d3ca4b2cd309403c6e8da662c325dd35750
 152478 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 152490 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 152485 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
Searching for interesting versions
 Result found: flight 151065 (pass), for basis pass
 Result found: flight 152456 (fail), for basis failure
 Repro found: flight 152479 (pass), for basis pass
 Repro found: flight 152481 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 9e3903136d9acde2fb2dd9e967ba928050a6cb4a 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
No revisions left to test, checking graph state.
 Result found: flight 152467 (pass), for last pass
 Result found: flight 152476 (fail), for first failure
 Repro found: flight 152478 (pass), for last pass
 Repro found: flight 152485 (fail), for first failure
 Repro found: flight 152489 (pass), for last pass
 Repro found: flight 152490 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  7d3660e79830a069f1848bb4fa1cdf8f666424fb
  Bug not present: 9e3903136d9acde2fb2dd9e967ba928050a6cb4a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/152490/


  (Revision log too long, omitted.)

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.510779 to fit
pnmtopng: 201 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-ws16-amd64.windows-install.{dot,ps,png,html,svg}.
----------------------------------------
152490: tolerable ALL FAIL

flight 152490 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/152490/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ws16-amd64 10 windows-install  fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    


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


