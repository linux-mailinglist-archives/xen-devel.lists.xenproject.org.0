Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB7216D3E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 14:57:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsn9o-0003U6-5E; Tue, 07 Jul 2020 12:57:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F44P=AS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jsn9m-0003SE-U5
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 12:57:07 +0000
X-Inumbo-ID: 58cf91fc-c051-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58cf91fc-c051-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DGsvvD3cFzfl5LXDA6+aRnsCtQ0WzO0DQPO1kaFIrxs=; b=IsEYkJyOndyuhSX+T8vS6Ocl5R
 /h3haflXQflGfXK9DJKC4mjZbDDo/Rh0r9ENbdhiThnvvEH8PdiJ4Y0rIC/DA+BvrNCPz+zPflpw1
 ESXg9OWEhzVNnAJPtP4XvFw4sNvyLhyj8FFq+TVxgHFDK16VnBCBX5LPvJUmUar85Fhs=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jsn9f-0003Yh-Uo; Tue, 07 Jul 2020 12:57:00 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jsn9f-0005wT-Kj; Tue, 07 Jul 2020 12:56:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jsn9f-0007BX-K7; Tue, 07 Jul 2020 12:56:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete
 test-amd64-amd64-xl-qemuu-debianhvm-amd64
Message-Id: <E1jsn9f-0007BX-K7@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Jul 2020 12:56:59 +0000
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
job test-amd64-amd64-xl-qemuu-debianhvm-amd64
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
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151709/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-amd64.debian-hvm-install --summary-out=tmp/151709.bisection-summary --basis-template=151065 --blessings=real,real-bisect qemu-mainline test-amd64-amd64-xl-qemuu-debianhvm-amd64 debian-hvm-install
Searching for failure / basis pass:
 151685 fail [host=huxelrebe0] / 151149 [host=albana1] 151101 [host=elbling0] 151065 [host=godello1] 151047 [host=chardonnay1] 150970 [host=elbling1] 150930 [host=godello0] 150916 [host=chardonnay0] 150909 [host=fiano1] 150899 [host=fiano0] 150895 [host=debina1] 150831 [host=huxelrebe1] 150694 [host=pinot1] 150631 [host=italia0] 150608 [host=albana0] 150593 ok.
Failure / basis pass flights: 151685 / 150593
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3-627d1d6693b0594d257dbe1a3363a8d4bd4d8307 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://git.qemu.org/qemu.git#4ec2a1f53e8aaa22924614b64dde97321126943e-eb6490f544388dd24c0d054a96dd304bc7284450 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-88ab0c15525ced2eefe39220742efe4769089ad8 git://xenbits.xen.org/xen.git#1497e78068421d83956f8e82fb6e1bf1fc3b1199-be63d9d47f571a60d70f8fb630c03871312d9655
From git://cache:9419/git://xenbits.xen.org/xen
   be63d9d47f..f97f99c8d8  master     -> origin/master
   f97f99c8d8..3fdc211b01  staging    -> origin/staging
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 43179 nodes in revision graph
Searching for test results:
 150585 [host=elbling0]
 150593 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 150631 [host=italia0]
 150608 [host=albana0]
 150694 [host=pinot1]
 150831 [host=huxelrebe1]
 150909 [host=fiano1]
 150930 [host=godello0]
 150916 [host=chardonnay0]
 150895 [host=debina1]
 150899 [host=fiano0]
 150970 [host=elbling1]
 151047 [host=chardonnay1]
 151101 [host=elbling0]
 151065 [host=godello1]
 151149 [host=albana1]
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
 151683 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 250b1da35d579f42319af234f36207902ca4baa4 2e3de6253422112ae43e608661ba94ea6b345694 dde6174ada5280cd9a6396e3b12606360a0d29a3
 151659 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b 3f429a3400822141651486193d6af625eeab05a5 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 151674 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 3575b0aea983ad57804c9af739ed8ff7bc168393 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151699 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 007d1dbf72536ec1b847a944832e4de1546af2ac 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151660 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 54cdfe511219b8051046be55a6e156c4f08ff7ff 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 151663 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b 6675a653d2e57ab09c32c0ea7b44a1d6c40a7f58 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151622 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b 7b7515702012219410802a168ae4aa45b72a44df 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151693 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 fec6a7af5c5760b9bccd9e7c3eaf29f0401af264
 151676 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 49ee11555262a256afec592dfed7c5902d5eefd2 2e3de6253422112ae43e608661ba94ea6b345694 726c78d14dfe6ec76f5e4c7756821a91f0a04b34
 151686 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 71b04329c4f7d5824a289ca5225e1883a278cf3b 2e3de6253422112ae43e608661ba94ea6b345694 e181db8ba4e0797b8f9b55996adfa71ffb5b4081
 151656 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151664 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 53550e81e2cafe7c03a39526b95cd21b5194d9b1 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151634 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151666 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 250bc43a406f7d46e319abe87c19548d4f027828 2e3de6253422112ae43e608661ba94ea6b345694 3371ced37ced359167b5a71abee2062854371323
 151645 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151655 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 4ec2a1f53e8aaa22924614b64dde97321126943e 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151668 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 3c659044118e34603161457db9934a34f816d78b 9f1f264edbdf5516d6f208497310b3eedbc7b74c 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151657 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151658 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b eefe34ea4b82c2b47abe28af4cc7247d51553626 2e3de6253422112ae43e608661ba94ea6b345694 25636ed707cf1211ce846c7ec58f8643e435d7a7
 151678 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 5d2f557b47dfbf8f23277a5bdd8473d4607c681a 2e3de6253422112ae43e608661ba94ea6b345694 51ca66c37371b10b378513af126646de22eddb17
 151670 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1d24410da356731da70b3334f86343e11e207d2 3c659044118e34603161457db9934a34f816d78b 470dd165d152ff7ceac61c7b71c2b89220b3aad7 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151688 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 3c659044118e34603161457db9934a34f816d78b 6bb228190ef0b45669d285114cf8a280c55f4b39 2e3de6253422112ae43e608661ba94ea6b345694 ad33a573c009d72466432b41ba0591c64e819c19
 151680 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 7d2410cea154bf915fb30179ebda3b17ac36e70e 2e3de6253422112ae43e608661ba94ea6b345694 780aba2779b834f19b2a6f0dcdea0e7e0b5e1622
 151672 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b eea8f5df4ecc607d64f091b8d916fcc11a697541 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151673 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 86e8c353f705f14f2f2fd7a6195cefa431aa24d9 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 151669 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151682 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bb78cfbec07eda45118b630a09b0af549b43a135 3c659044118e34603161457db9934a34f816d78b fe0fe4735e798578097758781166cc221319b93d 2e3de6253422112ae43e608661ba94ea6b345694 d9f58cd54fe2f05e1f05e2fe254684bd1840de8e
 151694 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 157ed954e2dc8c2a4230d38058ca7f1fe50902e0 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151689 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 175198ad91d8bac540159705873b4ffe4fb94eab 2e3de6253422112ae43e608661ba94ea6b345694 51ca66c37371b10b378513af126646de22eddb17
 151700 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151691 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 6b0eff1a4ea47c835a7d8bee88c05c47ada37495 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151685 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151692 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b da9630c57ee386f8beb571ba6bb4a98d546c42ca 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151697 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 75a6ed875ff0a2eb6b2971ae2098ed09963d7329 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151706 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151703 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151701 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151709 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151708 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
Searching for interesting versions
 Result found: flight 150593 (pass), for basis pass
 Result found: flight 151634 (fail), for basis failure
 Repro found: flight 151655 (pass), for basis pass
 Repro found: flight 151656 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
No revisions left to test, checking graph state.
 Result found: flight 151700 (pass), for last pass
 Result found: flight 151701 (fail), for first failure
 Repro found: flight 151703 (pass), for last pass
 Repro found: flight 151706 (fail), for first failure
 Repro found: flight 151708 (pass), for last pass
 Repro found: flight 151709 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151709/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.622332 to fit
pnmtopng: 223 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
151709: tolerable ALL FAIL

flight 151709 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/151709/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    


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


