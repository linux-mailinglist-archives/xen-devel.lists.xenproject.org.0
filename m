Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D003E8C6F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 10:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165564.302540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDjvu-0004H7-Op; Wed, 11 Aug 2021 08:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165564.302540; Wed, 11 Aug 2021 08:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDjvu-0004Ed-L7; Wed, 11 Aug 2021 08:49:54 +0000
Received: by outflank-mailman (input) for mailman id 165564;
 Wed, 11 Aug 2021 08:49:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fl7y=NC=epam.com=prvs=88576a6db5=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mDjvt-0004EX-HL
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 08:49:53 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26fe8797-6b00-4385-ae59-f10ea3f6d451;
 Wed, 11 Aug 2021 08:49:50 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17B8kPVb029324; Wed, 11 Aug 2021 08:49:46 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ac38k1290-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 08:49:46 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AM7PR03MB6481.eurprd03.prod.outlook.com (2603:10a6:20b:1c1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 08:49:42 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411%3]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 08:49:42 +0000
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
X-Inumbo-ID: 26fe8797-6b00-4385-ae59-f10ea3f6d451
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1M9m8UGwnAhFU66zKTWk3//tfmKIvvuc0XZDUPTUmlqsorLz4Y1y9qlwiLr/8m/KHnR1kaU480iRZeRoOEfBbE1T+pBHtFqNVwnGvrt3LCEza76gU26doABJTaXNcAr1ntamkOuPbiSeCJ+0moVe1cr5JGvUcS8zAHQBLsTTuOeNPokWia1lmhcEOMES1ydj0CQbY/quj6EbC9QkFglTtX/K0rYbb5VOb3jYloeaZW5ba61gBiFsjznMZpKLNyoqoAhMAx/ZWXKhHjRT3DDcyzGSzCuHi8yDSCPAphWn/txUppK6xWvzDS7XzUrc68CtSV5stnmHffOgNEUTlZBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl02WHcFpCS0M/lwtXzNyuIo2a8mvAEFAKPZQlY0B94=;
 b=CvBNKK8qlFuGYmelo6Bo0jBdMHYiTRA9K8zNVwIl+fdYRgo1F3k8w3li5sxS8h2Eahst7/Hj4M7nOjXxkuOSNF7FT8bsb5CtDrlJRyA6cEsqt4W0bbJZ/vYOm+yjTMG9FKVRRe9fL81geryW5/IWkNWq5YTtjhW/+QshW0OHbh6rLPcEhrwLQyZefE7Ic9THgcBIh4aw+z4WYZQe+3yGRTHBr3nOB6jhpaEQWdj8nkbeQ3jUjt+fNWfAaqw8mtKzXZn6e1HHl/ia1sEnHq21DIzTlUMUhsNmusdgQG09Z76H4PbGrDOVAvEC7en7IhXNWaLvw6dT6/NCDhlEIhxXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl02WHcFpCS0M/lwtXzNyuIo2a8mvAEFAKPZQlY0B94=;
 b=En+aIvHMI+XLJAkk/+Gnq8pX6oOmeeneWLw6qSKh7d7Kxfrxo14JQgmuDkYz5BeGoqi/hX0bkaPtKZ/GyjsSFAh2x9NkO924vGXVdNOuKb8FkrJisXmBbvummz6Yw7sYn3bbPE05awGL+LIFPUtbs5IbHAseQ/CI7eDbR1CEfLX+BylNhqg+bCCw1XTvFsqXK42c+gpfx/5SPOwpoM2nVPqLJE3uJtFHoDCfz9OJpWX+Ich4pqzrtPUhg1ZfXroTkcReaA2TBx+jDAE1thp/cNvwDTCGH+ZuJIgB6L4l1CALgMqt6dI7xtjcjuA0hgt25tVXW7VU2UuyAjcVFkOpBg==
From: Roman Skakun <Roman_Skakun@epam.com>
To: Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrii Anisov
	<Andrii_Anisov@epam.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Roman Skakun <rm.skakun@gmail.com>, Jan
 Beulich <jbeulich@suse.com>,
        Roman Skakun <Roman_Skakun@epam.com>
Subject: Re: Disable swiotlb for Dom0
Thread-Topic: Disable swiotlb for Dom0
Thread-Index: AQHXjfwJK3kYIT7XAUWdmOu1AWm+tKts6kUAgAD/Ofo=
Date: Wed, 11 Aug 2021 08:49:42 +0000
Message-ID: 
 <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
References: 
 <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>,<060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
In-Reply-To: <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a330ddc-5cbc-4928-bc8b-08d95ca4f62e
x-ms-traffictypediagnostic: AM7PR03MB6481:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB64814C57EDDC5D11976AFF7F85F89@AM7PR03MB6481.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RwZrHaKsaVGmDso21odjO+NSYRfYeRCaWcsx+YK984sscbU4UJn27rez9msRVnSMRpZac9UvpQ3TO+SSYNjNmTOftucEqXeI6NVeHeHRouKX1tPlrnvDe3rD/dbywCNotLRPjIo5gQ0Atvn21xxx5rTZ6Q8VqBlEck3yY2Roq00PeOY+0OjZkWU4Vp4FEiDO6LFppUtQkArw6n+0pGjIBc52vAjUpK5F1NAGYqr/9UOOvuQvbndMIAxcslpEozneezFHsj0Dws5BqIlMp1yAX9MKMri3wZ0UQYx9qB0sfMLmoH0FSLsCEvuSmqjR0GYkO0MyK6+Gr3H96QCCDBhueQnYlxz/x1u0GTdqjfKBzGe8z8TXeV6in195h/oXcLqiFC8qU4HrbNEMd9ITcuNFTFaewQl9R4Ky1XGJpOpudPpoTvptm4FbDZSAo5D5ZmI62WsDWTmXfQ06sO2dhnxSgcsVerJdejs6wosR3uZmzfxqQzAV4jYmg6XB7pZKu49utNTpQSKgLGn+kiBWfDU5c8snia59c9iKYw2ezA8ydZ2SreRhJh6Ka5kkNmzejNDSpSddVVBnGsTOAsyPu3JKTplMsjxGhvAtKuSKvfda1WHgUD2vmoi2h09+iEK/jOCJfgVpdkm9EegvQWGbGwoJjsPQ+xrRWviBJVS/eF6YCfNcVUy2DZ4eAXJe+GFrqbL9KL1X9AJUqV2javzbAUL5dhKSDui9UYGr6JsvDcf7TXD1xm3wXEBHKj+7ZSNyJLu8tksnXB2FFLyDmdwXufYOLM1mnCbvh5hpFlFrzfvCbw8EUh/LcTrdnQl1cP4nKJfPc/9J9T+ZvPrCE59yVqHjtw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(66446008)(66556008)(66476007)(19627405001)(7696005)(6506007)(53546011)(66946007)(71200400001)(64756008)(4326008)(2906002)(38100700002)(186003)(86362001)(83380400001)(38070700005)(76116006)(5660300002)(478600001)(52536014)(166002)(91956017)(26005)(122000001)(19627235002)(107886003)(966005)(33656002)(54906003)(55016002)(316002)(9686003)(110136005)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IaLLx6+y5w8zEnxJHg1CptYkSB4p9ZVnWl0SyuKnbN3/umUZhqRxZNXnHecf?=
 =?us-ascii?Q?BHbL7EFGdJQSRx/kwGLo6r3Af7IRAZMx/VLVpgapMF0JjliXUsuaZXGNhSVI?=
 =?us-ascii?Q?uZvafkKK64LThuaahDxBMU3B2VU8ZgnrreWjsh1OdnZCHffUiTGT4pbttc+u?=
 =?us-ascii?Q?yZFyjJETeCUSF6wNZ1+doQ5xvuwRda2oao+HVkEnFsfYzLQyQT3RtI6+/6bU?=
 =?us-ascii?Q?TTp9qDfRryt5sTMkKiJgMmIQVLyMN2AB9A6MDPNUyvXoYfr8TLIXmeDY/XYV?=
 =?us-ascii?Q?w8I1Q8upLp9JaVCWyHjEOAuU+8pPWSvC185yzKOgo2ZuW1D2/H+0wW3y3tm+?=
 =?us-ascii?Q?ZouSpmAeuLGAaEmXkdADLbkewdpAkRZqKcJ/U0F1yKVquJXMe+KXVo8c/AMP?=
 =?us-ascii?Q?TCSqO4DnBSoR6vNfmWHwtXMbezm1KXft+A3yEYKJ/aFWVmP54kxUuHyKT/Je?=
 =?us-ascii?Q?+TiW0mIyaF52E82XMnmwRjoYkaXWNSNBg1Irbn549VTjejoVrDKK5DYLEEUt?=
 =?us-ascii?Q?hxvrLOvI/411g4HSQmF5E5+mwrEolSwpZJJzlkExonWqJdHpKlbNpq3HNOVg?=
 =?us-ascii?Q?rgUp3fZyK/h0n9VyZ4/BVZV+omMUHz8fOlb3H+kl7+0wJEMN12YOFcveMPIr?=
 =?us-ascii?Q?Qp+HKbKcDNHk9Wncw3e3SP070YWNbaL++mSYBtPaKFwkPdXRHtyaDbz1uFp4?=
 =?us-ascii?Q?ibUIxfYF7vRQHP/ZC4YJShdmobYn2bUF5iK2Gs51iWAKRVClZMq8g5KSCVE9?=
 =?us-ascii?Q?tWQ/AVNQ6/0UWEz2to5P3X/Gu9a/PUsoXhsj4u73X4Wi+2VvsOFQQ+dqpGle?=
 =?us-ascii?Q?3dwb2pe3M1qSH5PM9NkZ8umQWh7Q4MdOLSpeWTJCNCHkvzsShjQgzlHTUwyo?=
 =?us-ascii?Q?q20vuiDZAwPOvtgwTknbhwINq7zPOXXTpdxNmU5wvCuB/OjLaigkyZ9ihtDw?=
 =?us-ascii?Q?wVHXUTxtJZmutTOtVZIfLhKhB+giU4IZ9RUhbTLtHd30Vqjfc4FyV6dqGvP8?=
 =?us-ascii?Q?PVS8DykDtLwfBRZfNcoi00hNQ7/56/kQpQw5L+fHKNX7NAhdV8auUBWu6RCP?=
 =?us-ascii?Q?h0ib7G/ctyWTjLeWq9HI5q/WTj83FwR2Z64t23uxDGGBZHWUD/HE3zvBYDZ+?=
 =?us-ascii?Q?4Sl00POEQt8tlSA0bq80FOG4N9a3yY2tD44HsQu7OUzzpqMBT6Hij3ZpvQUH?=
 =?us-ascii?Q?yaRVRx6ZK7N1xaa5sHc0GrdZSE54oCuAueKWYZ90fcboBcoWR67y6HwwTL/z?=
 =?us-ascii?Q?6rHxn3q8jbnaC9/eBnH1zRXunGu2D9V86Kbl4BG9dKqxU7bthe0mrEX4ss6L?=
 =?us-ascii?Q?cJQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR03MB65932619505158E3930D8E8785F89AM7PR03MB6593eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a330ddc-5cbc-4928-bc8b-08d95ca4f62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 08:49:42.2872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MbvfFynkrquvkKDvDw4QLtEkqhczloOnBMekdTlbO7B9igPMP4p8ebL8DBI3pNoiBhHYdS8vwJY91Resvk5z+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6481
X-Proofpoint-GUID: GJts4pzLtXGX0a6CxHYWCeUpparW64fh
X-Proofpoint-ORIG-GUID: GJts4pzLtXGX0a6CxHYWCeUpparW64fh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-11_03:2021-08-10,2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110056

--_000_AM7PR03MB65932619505158E3930D8E8785F89AM7PR03MB6593eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Julien!

Thanks for the answer!

>> I have observed your patch here:
>> https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-dev=
el/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad->>T480s/__=
;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B=
5XBqZlW$<https://urldefense.com/v3/__https://patchwork.kernel.org/project/x=
en-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad->T48=
0s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72=
udp2B5XBqZlW$> [patchwork[.]kernel[.]org]
>>
>> And I collided with the same issue, when Dom0 device trying to use
>> swiotlb fops for devices which are controlled by IOMMU.
>
>The issue Stefano reported was when the dom0 is not direct mapped.
>However...

I applied these patches:
https://github.com/torvalds/linux/commit/f5079a9a2a31607a2343e544e9182ce35b=
030578
https://github.com/xen-project/xen/commit/d66bf122c0ab79063a607d6cf68edf5e9=
1d17d5e
to check this more pragmatically.

Also, I added the log in xen_swiotlb_detect() and can see that swiotlb stil=
l used (other devices within dom0 used too), when dom0 is direct mapped:

[    1.870363] xen_swiotlb_detect() dev: rcar-fcp, XENFEAT_direct_mapped, u=
se swiotlb
[    1.878352] xen_swiotlb_detect() dev: rcar-fcp, XENFEAT_direct_mapped, u=
se swiotlb
[    1.886309] xen_swiotlb_detect() dev: rcar-fcp, XENFEAT_direct_mapped, u=
se swiotlb

This means, that all devices are using swiotlb-xen DMA fops.
By the way, before applying this patches, dom0 always used swiotlb-xen fops=
 for initial domain by design.


> Any reason to not use the stable branch for 5.10? I don't know whether
> your issue will be fixed there, but the stable branch usually contains a
> lot of bug fixes (including security one). So it is a good idea to use
> it over the first release of a kernel version.

Yes, sure, current BSP release based on 5.10 kernel:
https://github.com/xen-troops/linux/tree/v5.10/rcar-5.0.0.rc4-xt0.1
based on https://github.com/renesas-rcar/linux-bsp<https://github.com/renes=
as-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.0.rc2>
BTW, I specified the wrong kernel URL in the previous massage, sorry.

>> Issue caused in xen_swiotlb_map_page():
>> ```
>>   dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c7400, pag=
e_to_phys: 64b1d0000,
>> xen_phys_to_dma(phys): 64b1d0000
>> ```
>
>I can't seem to find this printk in Linux 5.10. Did you add it yourself?

Yes, it's my own log.


> This line suggests that the SWIOTLB tried to bounce the DMA buffer. In
> general, the use of the bounce buffer should be rare. So I would suggest
> to find out why this is used.
>
> Looking at the code, this suggests that one of the following check is fal=
se:
>
>         /*
>          * If the address happens to be in the device's DMA window,
>           * we can safely return the device addr and not worry about boun=
ce
>           * buffering it.
>           */
>         if (dma_capable(dev, dev_addr, size, true) &&
>             !range_straddles_page_boundary(phys, size) &&
>                 !xen_arch_need_swiotlb(dev, phys, dev_addr) &&
>                 swiotlb_force !=3D SWIOTLB_FORCE)
>                 goto done;

I checked this earlier and saw that dma_capable(dev, dev_addr, size, true) =
 returns false as expected because
we got dev_addr equals 64b1d0000 and according to this expression under dma=
_capable():

```
dma_addr_t end =3D dev_addr + size - 1;
return end <=3D min_not_zero(*dev->dma_mask, dev->bus_dma_limit);
```
As result, DMA mask more than 32bit.

> Let me start with that I agree we should disable swiotlb when we know
> the device is protected. However, from what you describe, it sounds like
> the same issue would appear if the IOMMU was disabled.

Yes, it looks like a potential issue. This means that swiotlb should be wor=
ked correctly, when it's needed, agreed.
But this is also potential improvement, and I presented this idea to discus=
s and create some patches.

> Therefore, I think we should first find out why Linux wants to bounce
> the DMA buffer.

We retrieved dev_addr(64b1d0000) + size > 32bit mask, but fcp driver wants =
to use only 32 bit boundary address, but that's consequence.
I think, the main reason of using bounce buffer is MFN address, not DMA phy=
s address.

Cheers!
________________________________
From: Julien Grall <julien@xen.org>
Sent: Tuesday, August 10, 2021 7:16 PM
To: Roman Skakun <Roman_Skakun@epam.com>; sstabellini@kernel.org <sstabelli=
ni@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>; Andrii Anisov <Andrii_Anis=
ov@epam.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Oleksandr Tys=
hchenko <Oleksandr_Tyshchenko@epam.com>; Oleksandr Andrushchenko <Oleksandr=
_Andrushchenko@epam.com>; xen-devel@lists.xenproject.org <xen-devel@lists.x=
enproject.org>; Roman Skakun <rm.skakun@gmail.com>; Jan Beulich <jbeulich@s=
use.com>
Subject: Re: Disable swiotlb for Dom0



On 10/08/2021 16:38, Roman Skakun wrote:
> Hi, Stefano!

Hi,

> I have observed your patch here:
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-deve=
l/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s/__;!!=
GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B5XB=
qZlW$ [patchwork[.]kernel[.]org]
>
> And I collided with the same issue, when Dom0 device trying to use
> swiotlb fops for devices which are controlled by IOMMU.

The issue Stefano reported was when the dom0 is not direct mapped.
However...

>
> Prerequisites:
> https://urldefense.com/v3/__https://github.com/xen-project/xen/tree/stabl=
e-4.15__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mR=
b72udp2B6EVrRb_$ [github[.]com]

... if you are really using 4.15, then the domain will always be direct
mapped. So I think this is a different one.

> https://urldefense.com/v3/__https://github.com/torvalds/linux/tree/v5.10_=
_;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2=
B1n8el4F$ [github[.]com]

Any reason to not use the stable branch for 5.10? I don't know whether
your issue will be fixed there, but the stable branch usually contains a
lot of bug fixes (including security one). So it is a good idea to use
it over the first release of a kernel version.

> Issue caused in xen_swiotlb_map_page():
> ```
>   dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c7400, page=
_to_phys: 64b1d0000,
> xen_phys_to_dma(phys): 64b1d0000
> ```

I can't seem to find this printk in Linux 5.10. Did you add it yourself?

>
> There is retrieved MFN(0x64b1d0000), which belongs to DomU. Dom0
> swiotlb couldn't proceed to this address and throws the log:
>
> ```
> [   99.504990] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz: 3686400=
 bytes), total 32768 (slots), used 64 (slots)
> ```

This line suggests that the SWIOTLB tried to bounce the DMA buffer. In
general, the use of the bounce buffer should be rare. So I would suggest
to find out why this is used.

Looking at the code, this suggests that one of the following check is false=
:

         /*
          * If the address happens to be in the device's DMA window,
          * we can safely return the device addr and not worry about bounce
          * buffering it.
          */
         if (dma_capable(dev, dev_addr, size, true) &&
             !range_straddles_page_boundary(phys, size) &&
                 !xen_arch_need_swiotlb(dev, phys, dev_addr) &&
                 swiotlb_force !=3D SWIOTLB_FORCE)
                 goto done;

>
> Temporary, I resolved this issue by disabling swiotlb for dom0 at all
> because sure that all devices goes through IOMMU, but this mention can
> be true only for me.
>
> But, I think of a more reliable way is to declare a special IOMMU
> property in xen dts for each device. If the device controlled by IOMMU
> not need to set swiotlb fops in arch_setup_dma_ops.
> What do you think about it?

Let me start with that I agree we should disable swiotlb when we know
the device is protected. However, from what you describe, it sounds like
the same issue would appear if the IOMMU was disabled.

Therefore, I think we should first find out why Linux wants to bounce
the DMA buffer. Does your device have any DMA restriction?

Cheers,

--
Julien Grall

--_000_AM7PR03MB65932619505158E3930D8E8785F89AM7PR03MB6593eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D""><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, A=
rial, Helvetica, sans-serif; font-size: 12pt;">Hi, Julien!<br>
<br>
Thanks for the answer!<br>
<br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 I have observed your patch here:</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;<spa=
n>&nbsp;</span></span><a href=3D"https://urldefense.com/v3/__https://patchw=
ork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@s=
stabellini-ThinkPad-&gt;T480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3gg=
N9LiPN4OVinOnqrhLQrNr-mRb72udp2B5XBqZlW$" target=3D"_blank" rel=3D"noopener=
 noreferrer" data-auth=3D"NotApplicable" data-linkindex=3D"0" style=3D"marg=
in:0px;font-size:14.6667px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI=
 Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSy=
stemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;background-color:r=
gb(255, 255, 255)">https://urldefense.com/v3/__https://patchwork.kernel.org=
/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-Thi=
nkPad-<span style=3D"color:rgb(0, 0, 0);background-color:rgb(255, 255, 255)=
;display:inline !important">&gt;</span><span style=3D"color:rgb(0, 0, 0);ba=
ckground-color:rgb(255, 255, 255);display:inline !important">&gt;</span>T48=
0s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72=
udp2B5XBqZlW$</a><span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Seg=
oe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Blink=
MacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.=
6667px;background-color:rgb(255, 255, 255);display:inline !important"><span=
>&nbsp;</span>[patchwork[.]kernel[.]org]</span><br style=3D"font-family:&qu=
ot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI=
&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quo=
t;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;</sp=
an><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;backgroun=
d-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 And I collided with the same issue, when Dom0 device trying to use</span><=
br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Euro=
pean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Robot=
o, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-co=
lor:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 swiotlb fops for devices which are controlled by IOMMU.</span><br style=3D=
"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;=
, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;He=
lvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255=
, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;</span><br style=
=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&qu=
ot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot=
;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(=
255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>The
 issue Stefano reported was when the dom0 is not direct mapped.</span><br s=
tyle=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European=
)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &=
quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:=
rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>However.=
..<br>
</span><br>
I applied these&nbsp;</span><font face=3D"Calibri, Arial, Helvetica, sans-s=
erif"><span style=3D"font-size: 12pt;">patches:</span></font><br>
<a href=3D"https://github.com/torvalds/linux/commit/f5079a9a2a31607a2343e54=
4e9182ce35b030578" id=3D"LPlnk" style=3D"color: rgb(0, 0, 0); font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">https://github.com=
/torvalds/linux/commit/f5079a9a2a31607a2343e544e9182ce35b030578</a><br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1" style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sa=
ns-serif; font-size: 12pt;">
<a href=3D"https://github.com/xen-project/xen/commit/d66bf122c0ab79063a607d=
6cf68edf5e91d17d5e" id=3D"LPlnk">https://github.com/xen-project/xen/commit/=
d66bf122c0ab79063a607d6cf68edf5e91d17d5e</a></div>
<span style=3D"font-family:Calibri, Arial, Helvetica, sans-serif;background=
-color:rgb(255, 255, 255);display:inline !important">to check this more pra=
gmatically.</span><br>
<br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonl=
y_1" style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, =
sans-serif; font-size: 12pt;">
</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Also, I added the log in&nbsp;<span style=3D"background-color:rgb(255, 255,=
 255);display:inline !important">xen_swiotlb_detect()&nbsp;</span>and can s=
ee that swiotlb still used (other devices within dom0 used too), when dom0 =
is direct mapped:<br>
<br>
[ &nbsp; &nbsp;1.870363] xen_swiotlb_detect() dev: rcar-fcp, XENFEAT_direct=
_mapped, use swiotlb
<div>[ &nbsp; &nbsp;1.878352] xen_swiotlb_detect() dev: rcar-fcp, XENFEAT_d=
irect_mapped, use swiotlb</div>
[ &nbsp; &nbsp;1.886309] xen_swiotlb_detect() dev: rcar-fcp, XENFEAT_direct=
_mapped, use swiotlb<br>
<br>
This means, that all devices are using swiotlb-xen DMA fops.<br>
By the way, before applying this patches, dom0 always used swiotlb-xen fops=
 for initial domain by design.<br>
<br>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; Any reason to not=
 use
 the stable branch for 5.10? I don't know whether</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; your issue will b=
e
 fixed there, but the stable branch usually contains a</span><br style=3D"f=
ont-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, =
&quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helv=
etica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, =
255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; lot of bug fixes =
(including
 security one). So it is a good idea to use</span><br style=3D"font-family:=
&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe=
 UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&=
quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; it over the first=
 release
 of a kernel version.<br>
</span><br>
Yes, sure, <span style=3D"background-color:rgb(255, 255, 255);display:inlin=
e !important">
current BSP release based on 5.10 kernel:</span>
<div><a href=3D"https://github.com/xen-troops/linux/tree/v5.10/rcar-5.0.0.r=
c4-xt0.1" id=3D"LPlnk">https://github.com/xen-troops/linux/tree/v5.10/rcar-=
5.0.0.rc4-xt0.1</a></div>
<div>based on&nbsp;<a href=3D"https://github.com/renesas-rcar/linux-bsp/tre=
e/v5.10.41/rcar-5.1.0.rc2" id=3D"LPlnk734023">https://github.com/renesas-rc=
ar/linux-bsp</a><br>
</div>
<div>BTW, I specified the wrong&nbsp;<span style=3D"background-color:rgb(25=
5, 255, 255);display:inline !important">kernel URL</span>&nbsp;in the previ=
ous massage, sorry.<br>
<br>
</div>
<div><span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (W=
est European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFon=
t, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;backg=
round-color:rgb(255, 255, 255);display:inline !important"><span style=3D"ba=
ckground-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt=
;
 Issue caused in xen_swiotlb_map_page():</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 ```</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI We=
b (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSyste=
mFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;b=
ackground-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;&nbs=
p;&nbsp;
 dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c7400, page_to=
_phys: 64b1d0000,</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 xen_phys_to_dma(phys): 64b1d0000</span><br style=3D"font-family:&quot;Sego=
e UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;,=
 -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, san=
s-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 ```</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI We=
b (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSyste=
mFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;b=
ackground-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;</span><br style=
=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&qu=
ot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot=
;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(=
255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>I
 can't seem to find this printk in Linux 5.10. Did you add it yourself?<br>
</span><br>
</div>
<div>Yes, it's my own log.<br>
<br>
<br>
</div>
<span></span><span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe U=
I Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacS=
ystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667=
px;background-color:rgb(255, 255, 255);display:inline !important"><span sty=
le=3D"background-color:rgb(255, 255, 255);display:inline !important">&gt;<s=
pan>&nbsp;</span></span>This
 line suggests that the SWIOTLB tried to bounce the DMA buffer. In</span><b=
r>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>general,
 the use of the bounce buffer should be rare. So I would suggest</span><br =
style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Europea=
n)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, =
&quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color=
:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>to
 find out why this is used.</span><br style=3D"font-family:&quot;Segoe UI&q=
uot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -appl=
e-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-seri=
f;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</span=
></span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (=
West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFo=
nt, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;back=
ground-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>Looking
 at the code, this suggests that one of the following check is false:</span=
><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eu=
ropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Rob=
oto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-=
color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</span=
></span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (=
West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFo=
nt, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;back=
ground-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 /*</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;ba=
ckground-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;* If the address happens to be in the device's =
DMA window,</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Sego=
e UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkM=
acSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6=
667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 * we can safely return the device addr and not worry about bounce</span><b=
r style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Europ=
ean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto=
, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-col=
or:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 * buffering it.</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot=
;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, B=
linkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size=
:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 */</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;ba=
ckground-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 if (dma_capable(dev, dev_addr, size, true) &amp;&amp;</span><br style=3D"f=
ont-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, =
&quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helv=
etica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, =
255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;
 !range_straddles_page_boundary(phys, size) &amp;&amp;</span><br style=3D"f=
ont-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, =
&quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helv=
etica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, =
255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
 !xen_arch_need_swiotlb(dev, phys, dev_addr) &amp;&amp;</span><br style=3D"=
font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;,=
 &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Hel=
vetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255,=
 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
 swiotlb_force !=3D SWIOTLB_FORCE)</span><br style=3D"font-family:&quot;Seg=
oe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;=
, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sa=
ns-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;<span>&nbsp;</s=
pan></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
 goto done;<br>
</span><br>
<span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt;"=
>I checked this earlier and saw that&nbsp;</span><span style=3D"font-family=
: Arial, Helvetica, sans-serif; font-size: 12pt; background-color: rgb(255,=
 255, 255); display: inline !important;">dma_capable(dev,
 dev_addr, size, true)</span><span style=3D"font-family:&quot;Segoe UI&quot=
;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-s=
ystem, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;f=
ont-size:14.6667px;background-color:rgb(255, 255, 255);display:inline !impo=
rtant"><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size:=
 12pt;">&nbsp;
 returns false as expected because</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"font-fa=
mily: Arial, Helvetica, sans-serif; font-size: 12pt;">we
 got&nbsp;</span><span><span style=3D"background-color: rgb(255, 255, 255);=
 display: inline !important; font-family: Arial, Helvetica, sans-serif; fon=
t-size: 12pt;">dev_addr equals&nbsp;</span><span style=3D"background-color:=
 rgb(255, 255, 255); display: inline !important; font-family: Arial, Helvet=
ica, sans-serif; font-size: 12pt;">64b1d0000
 and according to this expression under&nbsp;<span style=3D"background-colo=
r:rgb(255, 255, 255);display:inline !important">dma_capable():<br>
<br>
</span>```<br>
dma_addr_t end =3D <span style=3D"background-color:rgb(255, 255, 255);displ=
ay:inline !important">
dev_addr</span> + size - 1;<br>
return end &lt;=3D min_not_zero(*dev-&gt;dma_mask, dev-&gt;bus_dma_limit);<=
br>
```<br>
</span></span><span style=3D"font-family: Arial, Helvetica, sans-serif; fon=
t-size: 12pt;"><span style=3D"background-color:rgb(255, 255, 255);display:i=
nline !important">As result, DMA mask more than</span>&nbsp;32bit.</span><s=
pan><br>
<br>
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t"><span style=3D"background-color:rgb(255, 255, 255);display:inline !impor=
tant">&gt;&nbsp;</span>Let me start with that I agree we should disable swi=
otlb when we know</span><br>
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t"><span style=3D"background-color:rgb(255, 255, 255);display:inline !impor=
tant">&gt;&nbsp;</span>the device is protected. However, from what you desc=
ribe, it sounds like</span><br style=3D"background-color:rgb(255, 255, 255)=
">
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t"><span style=3D"background-color:rgb(255, 255, 255);display:inline !impor=
tant">&gt;&nbsp;</span>the same issue would appear if the IOMMU was disable=
d.</span><br style=3D"background-color:rgb(255, 255, 255)">
<br>
</span><span style=3D"font-size: 12pt;"></span></span></div>
<div><span style=3D"font-size: 12pt;">Yes, it looks like a potential issue.=
 This means that swiotlb should be worked correctly, when it's needed, agre=
ed.</span></div>
<span style=3D"font-size: 12pt;">But this is also potential improvement, an=
d I presented this idea to discuss and create some patches.</span>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"font-si=
ze: 12pt;"></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; color: rg=
b(0, 0, 0);">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; background-color: rgb(255, 2=
55, 255); display: inline !important;"><br style=3D"background-color:rgb(25=
5, 255, 255)">
<span style=3D"font-size: 14.6667px; background-color: rgb(255, 255, 255); =
display: inline !important;"><span style=3D"background-color:rgb(255, 255, =
255);display:inline !important">&gt;&nbsp;</span>Therefore, I think we shou=
ld first find out why Linux wants to bounce</span><br style=3D"background-c=
olor:rgb(255, 255, 255)">
<span style=3D"font-size: 14.6667px; background-color: rgb(255, 255, 255); =
display: inline !important;"><span style=3D"background-color:rgb(255, 255, =
255);display:inline !important">&gt;&nbsp;</span>the DMA buffer.
<br>
<br>
</span><span style=3D"font-size: 12pt; background-color: rgb(255, 255, 255)=
; display: inline !important;">We retrieved dev_addr(<span style=3D"font-fa=
mily:Arial, Helvetica, sans-serif;background-color:rgb(255, 255, 255);displ=
ay:inline !important">64b1d0000)&nbsp;</span>+
 size &gt; 32bit mask, but fcp driver wants to use only 32 bit boundary add=
ress, but that's consequence.</span><span style=3D"font-size: 14.6667px; ba=
ckground-color: rgb(255, 255, 255); display: inline !important;"><br>
</span><span style=3D"font-size: 12pt; background-color: rgb(255, 255, 255)=
; display: inline !important;">I think, the main reason of using
<span style=3D"font-size:14.6667px;background-color:rgb(255, 255, 255);disp=
lay:inline !important">
bounce buffer is</span>&nbsp;MFN address, not DMA phys address.</span><span=
 style=3D"font-size: 14.6667px; background-color: rgb(255, 255, 255); displ=
ay: inline !important;"><br>
</span><br>
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; background-color: rgb=
(255, 255, 255); display: inline !important; color: rgb(0, 0, 0);">Cheers!<=
/span></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Tuesday, August 10, 2021 7:16 PM<br>
<b>To:</b> Roman Skakun &lt;Roman_Skakun@epam.com&gt;; sstabellini@kernel.o=
rg &lt;sstabellini@kernel.org&gt;<br>
<b>Cc:</b> Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;; Andrii Anisov=
 &lt;Andrii_Anisov@epam.com&gt;; Volodymyr Babchuk &lt;Volodymyr_Babchuk@ep=
am.com&gt;; Oleksandr Tyshchenko &lt;Oleksandr_Tyshchenko@epam.com&gt;; Ole=
ksandr Andrushchenko &lt;Oleksandr_Andrushchenko@epam.com&gt;;
 xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;; Rom=
an Skakun &lt;rm.skakun@gmail.com&gt;; Jan Beulich &lt;jbeulich@suse.com&gt=
;<br>
<b>Subject:</b> Re: Disable swiotlb for Dom0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 10/08/2021 16:38, Roman Skakun wrote:<br>
&gt; Hi, Stefano!<br>
<br>
Hi,<br>
<br>
&gt; I have observed your patch here:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://patchwork.kernel.org/pr=
oject/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkP=
ad-T480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr=
-mRb72udp2B5XBqZlW$">
https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-devel/=
patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s/__;!!GF=
_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B5XBqZ=
lW$</a> [patchwork[.]kernel[.]org]<br>
&gt; <br>
&gt; And I collided with the same issue, when Dom0 device trying to use<br>
&gt; swiotlb fops for devices which are controlled by IOMMU.<br>
<br>
The issue Stefano reported was when the dom0 is not direct mapped. <br>
However...<br>
<br>
&gt; <br>
&gt; Prerequisites:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/xen-project/=
xen/tree/stable-4.15__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVi=
nOnqrhLQrNr-mRb72udp2B6EVrRb_$">
https://urldefense.com/v3/__https://github.com/xen-project/xen/tree/stable-=
4.15__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb7=
2udp2B6EVrRb_$</a> [github[.]com]<br>
<br>
... if you are really using 4.15, then the domain will always be direct <br=
>
mapped. So I think this is a different one.<br>
<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/torvalds/lin=
ux/tree/v5.10__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhL=
QrNr-mRb72udp2B1n8el4F$">
https://urldefense.com/v3/__https://github.com/torvalds/linux/tree/v5.10__;=
!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B1=
n8el4F$</a> [github[.]com]<br>
<br>
Any reason to not use the stable branch for 5.10? I don't know whether <br>
your issue will be fixed there, but the stable branch usually contains a <b=
r>
lot of bug fixes (including security one). So it is a good idea to use <br>
it over the first release of a kernel version.<br>
<br>
&gt; Issue caused in xen_swiotlb_map_page():<br>
&gt; ```<br>
&gt;&nbsp;&nbsp; dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe001=
80c7400, page_to_phys: 64b1d0000,<br>
&gt; xen_phys_to_dma(phys): 64b1d0000<br>
&gt; ```<br>
<br>
I can't seem to find this printk in Linux 5.10. Did you add it yourself?<br=
>
<br>
&gt; <br>
&gt; There is retrieved MFN(0x64b1d0000), which belongs to DomU. Dom0<br>
&gt; swiotlb couldn't proceed to this address and throws the log:<br>
&gt; <br>
&gt; ```<br>
&gt; [&nbsp; &nbsp;99.504990] rcar-fcp fea2f000.fcp: swiotlb buffer is full=
 (sz: 3686400 bytes), total 32768 (slots), used 64 (slots)<br>
&gt; ```<br>
<br>
This line suggests that the SWIOTLB tried to bounce the DMA buffer. In <br>
general, the use of the bounce buffer should be rare. So I would suggest <b=
r>
to find out why this is used.<br>
<br>
Looking at the code, this suggests that one of the following check is false=
:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If the address hap=
pens to be in the device's DMA window,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we can safely retu=
rn the device addr and not worry about bounce<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * buffering it.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dma_capable(dev, dev_a=
ddr, size, true) &amp;&amp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !r=
ange_straddles_page_boundary(phys, size) &amp;&amp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; !xen_arch_need_swiotlb(dev, phys, dev_addr) &amp;&amp=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; swiotlb_force !=3D SWIOTLB_FORCE)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto done;<br>
<br>
&gt; <br>
&gt; Temporary, I resolved this issue by disabling swiotlb for dom0 at all<=
br>
&gt; because sure that all devices goes through IOMMU, but this mention can=
<br>
&gt; be true only for me.<br>
&gt; <br>
&gt; But, I think of a more reliable way is to declare a special IOMMU<br>
&gt; property in xen dts for each device. If the device controlled by IOMMU=
<br>
&gt; not need to set swiotlb fops in arch_setup_dma_ops.<br>
&gt; What do you think about it?<br>
<br>
Let me start with that I agree we should disable swiotlb when we know <br>
the device is protected. However, from what you describe, it sounds like <b=
r>
the same issue would appear if the IOMMU was disabled.<br>
<br>
Therefore, I think we should first find out why Linux wants to bounce <br>
the DMA buffer. Does your device have any DMA restriction?<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM7PR03MB65932619505158E3930D8E8785F89AM7PR03MB6593eurp_--

