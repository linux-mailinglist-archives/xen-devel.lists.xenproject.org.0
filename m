Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA6190CB8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 12:48:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGhyl-0001Se-Qr; Tue, 24 Mar 2020 11:44:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H+Hk=5J=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGhyj-0001SZ-TB
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:44:17 +0000
X-Inumbo-ID: c9bf5008-6dc4-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9bf5008-6dc4-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 11:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6W0WIZfSLKflLblqgdgpLIMkNx2f6uLk1WLFGbw02Xc=; b=WUVR0nWQw62SrDRyHZ18bHdIqs
 67Jfs2EZcs2/Rv8O3AXdZJgoG4vWol5xyxpdZdHWkHKsff9GxcxQfrOkSgEDF/1at8P++jRqxcgMB
 II7knmiSp7NpUWNsxRYpAiqAP8LwM0QY22al7BotjWIOIC/+/7epw20EiH9HFUKNgpsc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGhyh-0003al-6Y; Tue, 24 Mar 2020 11:44:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jGhyg-0002z9-Rt; Tue, 24 Mar 2020 11:44:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jGhyg-000767-RH; Tue, 24 Mar 2020 11:44:14 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1jGhyg-000767-RH@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Mar 2020 11:44:14 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete
 test-amd64-amd64-xl-qemuu-ovmf-amd64
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
job test-amd64-amd64-xl-qemuu-ovmf-amd64
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
  Bug introduced:  ca6155c0f2bd39b4b4162533be401c98bd960820
  Bug not present: c220cdec4845f305034330f80ce297f1f997f2d3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148968/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/148968.bisection-summary --basis-template=144861 --blessings=real,real-bisect qemu-mainline test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 148879 fail [host=albana1] / 147546 ok.
Failure / basis pass flights: 148879 / 147546
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 9b26a610936deaf436af9b7e39e4b7f0a35e4409 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#70911f1f4aee0366b6122f2b90d367ec0f066beb-0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://git.qemu.org/qemu.git#c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f-9b26a610936deaf436af9b7e39e4b7f0a35e4409 git://xenbits.xen.org/osstest/seabios.git#76551856b28d227cb0386a1ab0e774329b941f7d-066a9956097b54530888b88ab9aa1ea02e42af5a git://xenbits.xen.org/xen.git#c47984aabead53918e5ba6d43cdb3f1467452739-d094e95fb7c61c5f46d8e446b4bdc028438dea1c
From git://cache:9419/git://git.qemu.org/qemu
   f1e748d279..09a98dd988  master     -> origin/master
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 30209 nodes in revision graph
Searching for test results:
 147546 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 147641 fail irrelevant
 147710 fail irrelevant
 147758 fail irrelevant
 147821 fail irrelevant
 148010 fail irrelevant
 148184 fail irrelevant
 148120 fail irrelevant
 148261 fail irrelevant
 148421 fail irrelevant
 148340 fail irrelevant
 148483 fail irrelevant
 148545 fail irrelevant
 148578 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 799d88c1bae7978da23727df94b16f37bd1521f4 d0d8ad39ecb51cd7497cd524484fe09f50876798 61c265f0660ee476985808c8aa7915617c44fd53 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148616 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 799d88c1bae7978da23727df94b16f37bd1521f4 d0d8ad39ecb51cd7497cd524484fe09f50876798 61c265f0660ee476985808c8aa7915617c44fd53 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148637 fail irrelevant
 148599 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 799d88c1bae7978da23727df94b16f37bd1521f4 d0d8ad39ecb51cd7497cd524484fe09f50876798 61c265f0660ee476985808c8aa7915617c44fd53 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148661 fail irrelevant
 148693 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01ce872739d2f0cd3a8917be2180381db5f0391e d0d8ad39ecb51cd7497cd524484fe09f50876798 d649689a8ecb2e276cc20d3af6d416e3c299cb17 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148723 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01ce872739d2f0cd3a8917be2180381db5f0391e d0d8ad39ecb51cd7497cd524484fe09f50876798 9214813489eb29de71d37f57e1bcabf5facecc8f 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148783 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 226cd20706e20264c176f8edbaf17d7c9b7ade4a 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148763 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b6b4a83e1d85e48837068dfe409f5557b50d71d d0d8ad39ecb51cd7497cd524484fe09f50876798 e6d567db23219fe9979f16d74e13f27145f07f84 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148807 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 3d0ac346032a1fa9afafcaedc979a99f670e077e 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148884 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7d325f93e190cbbb7bc58f1b994d314b53fe8668 d0d8ad39ecb51cd7497cd524484fe09f50876798 d46f81cb746d18b4530b5fe63e75b11f6b926f1f 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 a9b6dacf88fe99fbb69a2ee505833851ffdc9cec
 148900 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7288ff4095cf4254dd2f86ad97c648d9e6114fc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 55afdac3b29e672aad51e953412364127e54268b 76551856b28d227cb0386a1ab0e774329b941f7d 40213cd8626bac712fa69c4978993e87b57a7d0c
 148879 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 9b26a610936deaf436af9b7e39e4b7f0a35e4409 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148835 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 7b1e7cb7c56fbf800ee952d0ef013422dcc5751b 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148869 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 3d0ac346032a1fa9afafcaedc979a99f670e077e 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148885 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5e75c4d1fe4fd641abc9c15404e65a1dffe70e3e d0d8ad39ecb51cd7497cd524484fe09f50876798 ba29883206d92a29ad5a466e679ccfc2ee6132ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 a9b6dacf88fe99fbb69a2ee505833851ffdc9cec
 148878 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d42fdd6f8384bb4681d93e4a25d8f57db1e63adb d0d8ad39ecb51cd7497cd524484fe09f50876798 19dd408a479cae3027ae9ff9ef3f509ad3e681e5 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 e54c433adf01a242bf6e9fe9378a2c83d3f8b419
 148868 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 148893 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a3e25cc8a1dd3d1ea24ed02f90c44221e015e965 d0d8ad39ecb51cd7497cd524484fe09f50876798 7a5853cec479a448edae0fb2aaf4e2f78c9c774d 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 5657d6765717ee309d758fe573f832c28b67cbc7
 148874 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 7b1e7cb7c56fbf800ee952d0ef013422dcc5751b 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148891 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a3e25cc8a1dd3d1ea24ed02f90c44221e015e965 d0d8ad39ecb51cd7497cd524484fe09f50876798 b4983c570c7a5848c9df519cd9e056bea3177fe2 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 99f1c935190986068a36fb5e78a00e6b71b08f25
 148881 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7d325f93e190cbbb7bc58f1b994d314b53fe8668 d0d8ad39ecb51cd7497cd524484fe09f50876798 10b114008acc1f7ae55eaf2646e25114e878ddac 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 a9b6dacf88fe99fbb69a2ee505833851ffdc9cec
 148896 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 80681884319d7ad45987348d30bae60cd3a43afb d0d8ad39ecb51cd7497cd524484fe09f50876798 41fba1618b7a743740670f528ba409478678cc7c 76551856b28d227cb0386a1ab0e774329b941f7d a798bac54fe87a7d69fb7be7f125b8c97f767ff6
 148895 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 80681884319d7ad45987348d30bae60cd3a43afb d0d8ad39ecb51cd7497cd524484fe09f50876798 f4c4357fbfca0fb14e477bf661ae7384b4b9b283 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 6052921da02dd2180b80eb77c7aa115c6834067a
 148902 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7288ff4095cf4254dd2f86ad97c648d9e6114fc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 e64a62df378a746c0b257105959613c9f8122e59 76551856b28d227cb0386a1ab0e774329b941f7d e57b00f0b7e8a932fabd8524465972f9c4d2e507
 148908 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7288ff4095cf4254dd2f86ad97c648d9e6114fc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 c2e09ad8cdf4705a91eb6c20a9f3d4d90a0f46aa 76551856b28d227cb0386a1ab0e774329b941f7d 109ecb894525e16cf84f34ead15467980fa2edfd
 148939 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b85048261aa5dc0b8fd98ddc4431d8c2a6389b25 d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d e6ca7afcf2ddeb72beade853ccd6fa3332210014
 148913 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4c0f6e349d32cf27a7104ddd3e729d6ebc88ea70 d0d8ad39ecb51cd7497cd524484fe09f50876798 bdfd66788349acc43cd3f1298718ad491663cfcc 76551856b28d227cb0386a1ab0e774329b941f7d d6e732c32a82eb8f03c1bf86c6bc530f24dc05b3
 148962 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 c220cdec4845f305034330f80ce297f1f997f2d3 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
 148916 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4c0f6e349d32cf27a7104ddd3e729d6ebc88ea70 d0d8ad39ecb51cd7497cd524484fe09f50876798 a4c7ed8b89e8919ddb71c78c4f42b8fdc455ac27 76551856b28d227cb0386a1ab0e774329b941f7d 9649cef3b3a7eaca1347154ea7f274586d48bc29
 148942 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d aea270e3f7c0db696c88a0e94b1ece7abd339c84
 148919 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 edfe16a6d9f8c6830d7ad93ee7616225fe4e9c13 d0d8ad39ecb51cd7497cd524484fe09f50876798 906b60facc3d3dd3af56cb1a7860175d805e10a3 76551856b28d227cb0386a1ab0e774329b941f7d 9649cef3b3a7eaca1347154ea7f274586d48bc29
 148922 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 edfe16a6d9f8c6830d7ad93ee7616225fe4e9c13 d0d8ad39ecb51cd7497cd524484fe09f50876798 430f63e250a55c5fdfa31ffbddd8538dc1ce6b36 76551856b28d227cb0386a1ab0e774329b941f7d 90d19e6f53a47f8f7f2154c67f03adc192c0d760
 148923 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 edfe16a6d9f8c6830d7ad93ee7616225fe4e9c13 d0d8ad39ecb51cd7497cd524484fe09f50876798 8b6269c8ec14b9213dd22200c1c05aaecd6cbb9d 76551856b28d227cb0386a1ab0e774329b941f7d 11cc71f463b907b8dbbffbd835473f1c1ba26f1f
 148963 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 ca6155c0f2bd39b4b4162533be401c98bd960820 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
 148927 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 a08b4a9fe6cb3c23755db764c9a40510a40a8731 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
 148930 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 9e264985ff0bc86927b44b334bd504687f78659d 76551856b28d227cb0386a1ab0e774329b941f7d ead4c2d8314cea8defb6e9613071f21df6d216c2
 148932 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cd72b6cfd1f3665833006239a932d03f5511e824 d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 148933 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 148945 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d 64fe38f246a7bf305e4e47da26c9dfc31bbff30b
 148935 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 9b26a610936deaf436af9b7e39e4b7f0a35e4409 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148938 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f1ddb21ff94b3d4e66446f9b26ac156475eb85e d0d8ad39ecb51cd7497cd524484fe09f50876798 c1e667d2598b9b3ce62b8e89ed22dd38dfe9f57f 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 148965 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 c220cdec4845f305034330f80ce297f1f997f2d3 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
 148968 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 ca6155c0f2bd39b4b4162533be401c98bd960820 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
 148953 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 93c3593ad04f2610fd0a176dfa89a7e40b6afe1f 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
 148957 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 c220cdec4845f305034330f80ce297f1f997f2d3 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
 148960 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 ca6155c0f2bd39b4b4162533be401c98bd960820 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
Searching for interesting versions
 Result found: flight 147546 (pass), for basis pass
 Result found: flight 148879 (fail), for basis failure
 Repro found: flight 148933 (pass), for basis pass
 Repro found: flight 148935 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d3215fd24f47eaa4877542a59b4bbf5afc0cfe8 d0d8ad39ecb51cd7497cd524484fe09f50876798 c220cdec4845f305034330f80ce297f1f997f2d3 76551856b28d227cb0386a1ab0e774329b941f7d e465fecbfdb865c75f762055c0396bc617005748
No revisions left to test, checking graph state.
 Result found: flight 148957 (pass), for last pass
 Result found: flight 148960 (fail), for first failure
 Repro found: flight 148962 (pass), for last pass
 Repro found: flight 148963 (fail), for first failure
 Repro found: flight 148965 (pass), for last pass
 Repro found: flight 148968 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  ca6155c0f2bd39b4b4162533be401c98bd960820
  Bug not present: c220cdec4845f305034330f80ce297f1f997f2d3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148968/


  (Revision log too long, omitted.)

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.570814 to fit
pnmtopng: 196 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
148968: tolerable ALL FAIL

flight 148968 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/148968/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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


