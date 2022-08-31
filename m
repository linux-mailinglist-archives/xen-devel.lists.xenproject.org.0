Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548835A7FA0
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 16:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395685.635525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR3-0003gl-TX; Wed, 31 Aug 2022 14:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395685.635525; Wed, 31 Aug 2022 14:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTOR3-0003eC-P8; Wed, 31 Aug 2022 14:11:17 +0000
Received: by outflank-mailman (input) for mailman id 395685;
 Wed, 31 Aug 2022 14:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7u=ZD=epam.com=prvs=1242718080=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oTOR2-0002bv-GY
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 14:11:16 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5e52b94-2936-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 16:11:15 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VBo4G7032537;
 Wed, 31 Aug 2022 14:11:02 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ja427h4rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 14:11:02 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 14:10:58 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9190:c0a7:bd87:f01f%6]) with mapi id 15.20.5566.019; Wed, 31 Aug 2022
 14:10:58 +0000
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
X-Inumbo-ID: c5e52b94-2936-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHLzhARZ3j7+xnnsuQFIQQN+n+ZdvTlTzOu9zEs1/N2OtZB3taJ8vePbWuUdYVtr4O4Y3H4Ay5llADx5z/p6kAyLs0fFTlXiom32AZdLtW+iBx7qL69qwv7nkb8A93JYYWL5vWiebif56fb/qLCrUpgEKysCHshF4TRxOcl8Ze9SCrjuln5mcr6Loqdk1QBHj9gs9Gs8ajCefYibMDEmyrjAfPZm19iSnsUstFq0L054gnKvICE1qku6pZmMhdPH5y0UE0tVsz6T+qDWmTf99mpgPVw2lwyVjwTdVQNZIUEncGyKxBi8HahKw85oRd0/qgV1+T5mjl8i+obwzB4xRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4xC1JfZlgWk3CJQOkTA5B8aIbW9nZkyrpRTyJGvH5Y=;
 b=myd6bQ0jSdM7chfuDzz9+bApsfrbDgaZ5jIWOHFYOyNdd9d9tmN3zmsXN+gjz2kqUQiwEVT5HnEPmrvQH9UUn3JqfyiLLsWRPm2I5aPcj8pNNtbTCE92bPsAa8HH5TjOqmsBaZTg1etDYvgXjCFX+LSkln8M9n/NMa0GX0TcV45ictd61Femn5hlluTZrIpAmC8NTFew+2KO2S1Op75ZDSBeObMwr6EnTXdOEHaBBhZx7XW8XOdo0EWvGEL1pU0/+eKIgncSaeNKxoqAKrc5oIUw4FcL47pEgGHpj1FdhjE+mhFQLwBJ7GP+wIQMMOS9+BUtk5ZLjCcGHgR47gXJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4xC1JfZlgWk3CJQOkTA5B8aIbW9nZkyrpRTyJGvH5Y=;
 b=hBWuGgt4QJbE63nR2ExllpGU1pnlXSepWtusAR55nBtnPF99ZnkTA4D+KuVzN2wLdfraqZIjbSNi2Xt17VmwKO8RSn6XSa/9BCmH+/rljYQsdf2KrKjchd6LQKFqdDjxdu2zB6taw3GzrobnyM8gz8uNe3ImRrDrX4K7OvQxEcWRsWkPuHPq4Nl4/ZSa/y2F3dVbtYd6y/MZRQwGJMh+s9AI8M0hznKpNE06CuBfPCk5BS2FdRw0PwN879nqumFsMJyIZ58xSR9TviuSQIej5QVPfyDobZyNCuJoOULxSC4zPZ2mN6WIqMnbTjm3rIjpQt/p8aiUHFNbkYXRnbZH1Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 00/10] Rework PCI locking
Thread-Topic: [RFC PATCH 00/10] Rework PCI locking
Thread-Index: AQHYvUN+anJUcYxp10mJv57QVAD0ow==
Date: Wed, 31 Aug 2022 14:10:58 +0000
Message-ID: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.37.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0afc25ac-49bb-4a9f-b3ec-08da8b5aa0a2
x-ms-traffictypediagnostic: VI1PR03MB6301:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 U+qbdwdeFf5DoZztrJDFvZYAyoR2nTYBJ0W//lX57GCVg8VpicbvIDMxMjCg5Jvn0Uw6GHfnjWOiq1fgsAZJJHDqigChT+S/z+2swnHHrWGdnHj7qxySJGAoIYfTZHE3K6EKGY1l3Ub7YdRXRSqPJ416SIgoIu4Y+HzfstmrDcDlgqDq0NMEt8t9oZjxC/mC3Ei59HU30ufjWf91AxJ17UziYlSrzhP0M14+RaLzTB6vdfXZkEj3x8SWMcD7Fzf//rzIz37Ewvrixyu2cJtqQgg6D0a7enB605G9pwK5ue/rw6/ZtEBHOJAPGMGI58YbWa5B/gX0g+yVSv81D5kUk2wr9fuZdOthwmetpx6Xae6rQhOjoCEL9G1F907IXRkKyF4Q+cFmYND/MbolALz/sakcckX6Soaxmfp3TCOgRVMofHfvkBaMRgPeliuVnsWdvmJ4H1EWBxtqo7lPUkqejfDNZV0IqN3aoaJ0mBUaRduhRa/Ilr5FNtA9vRucEyDHpDSJEtVxER9IhiZoTeL0DmDc9FGVHm0IiPeo+gihcQ7PF+bqg0bGSig3pQsH8zsSpv5vj4/G21vBPcR6+WfsZu95ZEj/kYXTAZJRnwtAh5n5vhLHx6+PNDky1WUZp/A/EnT+vrJOZuGgMahRaTtK1bCvbc5AiM87u3c8gt1Y0JNuOyvfZVdKP2wWbGt6vaZPfvaR5Gl1vu+mLDsSGynsi9xDbL7JPxTQRfRH+fdRxS7DNw+nWAWH+4h3UhLBl2AZH4KYEvOq8MWPKJcEc/nmbw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(4326008)(66556008)(76116006)(66946007)(38070700005)(66476007)(8676002)(2906002)(66446008)(64756008)(54906003)(1076003)(186003)(83380400001)(2616005)(5660300002)(91956017)(7416002)(8936002)(316002)(36756003)(6916009)(6486002)(478600001)(71200400001)(86362001)(55236004)(26005)(41300700001)(6512007)(6506007)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ng/KlPWBkb4GXVaiVk6BldJXFuEqDgbMn6QKEmXgR4jV36j8nUB1aJlRLB?=
 =?iso-8859-1?Q?1LMVIrw+TwxosRNOGBkJsUor1+L0BvRyPE/C49v0q6oWxgx7PidOlN2iPC?=
 =?iso-8859-1?Q?PJkOY9hGDd7AMg9ghgma4dIiepNS7miG7OL1Xi5sLmJMk2euHkf6ut8PAm?=
 =?iso-8859-1?Q?+2tr9/nBJVH2uMJlzGyE3lF6sEMt0PlVAio5DQDr9zje3sKoHexjNGOJmA?=
 =?iso-8859-1?Q?mXOQY0tNg70zSOveBA8rr91nOszkTAOCBOrN/iScGspjEkCvmYUjD/7yUl?=
 =?iso-8859-1?Q?nXmMBAqfmNrVUeiRihNV0mPOlcnjkpTYL5QZe6o1dmaxTopP0cOmXTHdUt?=
 =?iso-8859-1?Q?DtcldVE4R6X/zsEpC7cA667qZ2Zi4eXa2q2LnGWvh2kSpWa3C20eO1x1H5?=
 =?iso-8859-1?Q?fqMoQOKROsSg1wOfGWoNu+Gn++KUtMTEIcoDnCwD9ZkcdMUzm3jgAzJShi?=
 =?iso-8859-1?Q?vhuA9JmPh5bJa1kVw8Wi4Ea7bW6rFdsfv1FETItTwt7KWE4ISZjs7mz/Vo?=
 =?iso-8859-1?Q?Ji1zShNXv7Azj6OryHy9t4ZFT25JCAQMKJkR8pzesxuIyf94lOaemkZzvf?=
 =?iso-8859-1?Q?JSOmBbAS2DjlIEVpHgZ8MaGLBmQZrELwuveOSNx8QvLgSCb/UyXxnQbS6d?=
 =?iso-8859-1?Q?/0gAafrZb0IriCq6FtQsV1Hcy4zY34Hfh1JZoj+vZhdGDG2BUYSo9BP+nT?=
 =?iso-8859-1?Q?6V71UlTNEodJ7cNxzRku6AhbCbjk50CJpqjTuQ78a2O7FrQGAdgYvE9kFU?=
 =?iso-8859-1?Q?YGRMxbnWYJJAcp44ORc2YGjM1KWWs7Opofo39UHeP4BIx5hjgQ3TohzuDN?=
 =?iso-8859-1?Q?My0WsovYWj4CRzDroj6NsOCM+JSZ/hSSKsHNp6q/KaAMi27QlMtU0HdVF5?=
 =?iso-8859-1?Q?qmGnBnZzuTbJy+aRq6BHNCpSNSS3UdCW0tDUFC7CjZOUDmJw81h3rCk8ON?=
 =?iso-8859-1?Q?039qJKDrgxewFsvQ46Dfr2ql2nq8MY7TsaheMoL378v6XcltWHjN5zTWBA?=
 =?iso-8859-1?Q?73py/NP9kJFI4tcdO84NtwNHcpgNeh5/FTIH4hg8g6EXcpGbI0c0CrXqsr?=
 =?iso-8859-1?Q?J3bBmRtN5NujQO0QX0bHmKGPnqKGRw8LhAeb/35uprLtHrUekH1G/sS8TK?=
 =?iso-8859-1?Q?I/lKCCF1qZwMxAA6+XtEg3dK2f5F0GdJEI7jV9kZgvbxtRrdczx1pJ57yS?=
 =?iso-8859-1?Q?68tvFy26P4SIzKzpVjoCz5AUzTQrSmD1IZGG5LXfkiFynp0zjoWogL2cVW?=
 =?iso-8859-1?Q?6V1Y/NNqBBwPJ0T9QwRCx0/k+uPaff5uHI/SvsOBKw04XMogAZnhZPBbOX?=
 =?iso-8859-1?Q?T8EaA8dzljf+siCkDJvcT+ZxZ3ei2dacGkhczYEzbug5cybj6EE9Cx/rWO?=
 =?iso-8859-1?Q?F5/d7/xc0go2tdINwl0v0gHO7JziHrzc0BCmDg/9tyPmtb8bZHET11r6aq?=
 =?iso-8859-1?Q?tt+Cmn7Rs1o7+rl40K3coH17RU4DbfyFDOWof2B+k3TCHQ6FuEtwswBfPY?=
 =?iso-8859-1?Q?g8tUkPbnrFBu5TyOGdcrL+7CPmrsiNi3+H0Sry9uNS2Yhyf/XQuzvVAmqW?=
 =?iso-8859-1?Q?8u/TMLHxSqN/1Cm7lybCuLQSbwpkM539WreODX/hPm/YYnN4OsgDNznz08?=
 =?iso-8859-1?Q?08F2n7pFmwMtUdbC2BjebvYTUVofo9eYixQ/w7dgsJJ/WbcIQvKT+/+g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afc25ac-49bb-4a9f-b3ec-08da8b5aa0a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:10:58.4525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZQ4LqA+0F0nibU6tU8cbORDaFcSnAWWwj48/L6CGahpAdH21oobVVw0a9o/chrbl5TAgnxtwx8mVsiZXMkRtROtjrLL2oySc78Ti2kbI7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6301
X-Proofpoint-GUID: cx3ljss_nboiaWyYXt1L8ZGTFtwhV7Rh
X-Proofpoint-ORIG-GUID: cx3ljss_nboiaWyYXt1L8ZGTFtwhV7Rh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=698 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208310070

Hello,

This is yet another take to a PCI locking rework. This approach
was suggest by Jan Beulich who proposed to use a reference
counter to control lifetime of pci_dev objects.

When I started added reference counting it quickly became clear
that this approach can provide more granular locking insted of
huge pcidevs_lock() which is used right now. I studied how this
lock used and what it protects. And found the following:

0. Comment in pci.h states the following:

 153 /*
 154  * The pcidevs_lock protect alldevs_list, and the assignment for the
 155  * devices, it also sync the access to the msi capability that is not
 156  * interrupt handling related (the mask bit register).
 157  */

But in reality it does much more. Here is what I found:

1. Lifetime of pci_dev struct

2. Access to pseg->alldevs_list

3. Access to domain->pdev_list

4. Access to iommu->ats_list

5. Access to MSI capability

6. Some obsucure stuff in IOMMU drivers: there are places that
are guarded by pcidevs_lock() but it seems that nothing
PCI-related happens there.

7. Something that I probably overlooked

Anyways, I tried to get rid of global mighty pcidevs_lock() by
reworking items 1-5.

This patch series does exactly this: adds separate lock for each
of the lists, lock for struct pci_dev itself, adds reference
counting, then removes pcidevs_lock() entirely. I do understand
that I should not remove locks when there are locking fixes for
items 6-7. But this is why it is an RFC. I want to discuss if my
approach is legit and get some guidance from maintainers on what
should be done in addition to the presented changes.


Volodymyr Babchuk (10):
  xen: pci: add per-domain pci list lock
  xen: pci: add pci_seg->alldevs_lock
  xen: pci: introduce ats_list_lock
  xen: add reference counter support
  xen: pci: introduce reference counting for pdev
  xen: pci: print reference counter when dumping pci_devs
  xen: pci: add per-device locking
  xen: pci: remove pcidev_[un]lock[ed] calls
  [RFC only] xen: iommu: remove last  pcidevs_lock() calls in iommu
  [RFC only] xen: pci: remove pcidev_lock() function

 xen/arch/x86/domctl.c                       |   8 -
 xen/arch/x86/hvm/vioapic.c                  |   2 -
 xen/arch/x86/hvm/vmsi.c                     |  20 +-
 xen/arch/x86/irq.c                          |  11 +-
 xen/arch/x86/msi.c                          |  68 ++++-
 xen/arch/x86/pci.c                          |   8 +-
 xen/arch/x86/physdev.c                      |  24 +-
 xen/common/domain.c                         |   1 +
 xen/common/sysctl.c                         |   7 +-
 xen/drivers/char/ns16550.c                  |   4 -
 xen/drivers/passthrough/amd/iommu.h         |   1 +
 xen/drivers/passthrough/amd/iommu_cmd.c     |   4 +-
 xen/drivers/passthrough/amd/iommu_detect.c  |   1 +
 xen/drivers/passthrough/amd/iommu_init.c    |  19 +-
 xen/drivers/passthrough/amd/iommu_map.c     |  11 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  19 +-
 xen/drivers/passthrough/msi.c               |   8 +-
 xen/drivers/passthrough/pci.c               | 267 +++++++++++---------
 xen/drivers/passthrough/vtd/intremap.c      |   2 -
 xen/drivers/passthrough/vtd/iommu.c         |  33 +--
 xen/drivers/passthrough/vtd/iommu.h         |   1 +
 xen/drivers/passthrough/vtd/qinval.c        |   3 +
 xen/drivers/passthrough/vtd/quirks.c        |   2 +
 xen/drivers/passthrough/vtd/x86/ats.c       |   3 +
 xen/drivers/passthrough/x86/iommu.c         |   5 -
 xen/drivers/video/vga.c                     |  12 +-
 xen/drivers/vpci/header.c                   |   3 +
 xen/drivers/vpci/msi.c                      |   7 +-
 xen/drivers/vpci/vpci.c                     |  10 +-
 xen/include/xen/pci.h                       |  36 ++-
 xen/include/xen/refcnt.h                    |  28 ++
 xen/include/xen/sched.h                     |   1 +
 32 files changed, 380 insertions(+), 249 deletions(-)
 create mode 100644 xen/include/xen/refcnt.h

--=20
2.36.1

