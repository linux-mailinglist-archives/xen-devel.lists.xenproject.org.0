Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6920E3FD753
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 12:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176261.320741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLN2H-0006zX-RE; Wed, 01 Sep 2021 10:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176261.320741; Wed, 01 Sep 2021 10:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLN2H-0006v5-MB; Wed, 01 Sep 2021 10:00:01 +0000
Received: by outflank-mailman (input) for mailman id 176261;
 Wed, 01 Sep 2021 10:00:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2KbH=NX=epam.com=prvs=987800c254=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mLN2F-0006uz-P6
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 10:00:00 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d42ca6e-0b0b-11ec-adc1-12813bfff9fa;
 Wed, 01 Sep 2021 09:59:58 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1818W2aY029947; 
 Wed, 1 Sep 2021 09:59:55 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3at5yr8h4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 09:59:55 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AS8PR03MB6757.eurprd03.prod.outlook.com (2603:10a6:20b:292::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 09:59:52 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::7cb2:a2bc:d477:683d]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::7cb2:a2bc:d477:683d%9]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 09:59:52 +0000
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
X-Inumbo-ID: 5d42ca6e-0b0b-11ec-adc1-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQL0FSUpOR6ZZw4dzZ/WLDoYJRtr+dnA/6nKFP+FJdK3t7mQDaLQmiv/4yzs2ddRWiuquNuEWv3lGIRiirB+fSyN/nylMaMo3p2g9vsv3KuikQANoY8PVRlJdaAeXB2nQDXsKaKRGbqSXtQ4Lw41VsrJ+8U7dAyEVzsWryJSuefKp/cEZfc9gkV3mJlYVLvF32f5pcTk8h/7W/mORBBzsJ9k8cbBmfmNNn8Cd+NQlBkK2jxU9Pq0Fy8MxntIX71NF+aSeKHoV1RHwpDYd3oa8fDy1TlWGN6ghWQ6KUbHKC2U39EPLXHk68sGit7tjboKBV89C0nmxKXzoSX4qKU1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La8gXQMXfHGw4BBQ/lbRYKOiAPc1dG59oOZFJuu/0R4=;
 b=atiOGJeaTfQD/X7a0Y5DxpMn/1zW8kvmxi+a0vyi117D0eUM5CIeTxrjskfuGc13BpsURhpQ+nSMbsxcllTBoFPk6r+GEsL5Fdp1DHOfJiJx6/HMB+QH/Rv5CECRl/6xh7N9qyle5VZPhw5jqy11vcXe0cgRH8SJmnJ/lRi6344yDtFfJFDxemywR/DLLDOdiY8j6d7Qh9KJGHA2krlmJnrhwzoCiP9Xf2nUyVVDAqjXQU5zc8pbwbeh/UTj3zq3eV0QzmcifqBBya8ow80o9pGQFNd9/vBSwr1GFB6ikB2aHvJPOd3p/8YfskKNJ9bIVrU1mPo6qPK83gxO1CR4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La8gXQMXfHGw4BBQ/lbRYKOiAPc1dG59oOZFJuu/0R4=;
 b=bzgZGNp7TSEPPhuFfoDeIX+LYW42sv438/+BrxDIlI2dQfHWYB+gBDxPQy5NjOesZTnCTpfabMjXtIXBx7xW2A8wRbMmeElQW4ixWD/SRX1I0gJdT+gjNUh/rUq33i9KRsqrrQHDBsYF8ep0piMuYhVAXJ9f/x8Dll3dxhSEekPU2uMZv96ngmr77IQS/4adLQh8YfwGLtfxrLc7PbC2ewBVh+28tJdmjoYRhI79GTJodghkuos7QX8GOriEAztEVINyMsC1rAqy+it25hH6inp41Qj0KfaoclfYwL3eeaKgTN/9/j95JWBqHgBmb/dZcyIIbCcI6G7oCuFYHBXzvA==
From: Roman Skakun <Roman_Skakun@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Andrii Anisov <Andrii_Anisov@epam.com>,
        Roman
 Skakun <rm.skakun@gmail.com>,
        Roman Skakun <Roman_Skakun@epam.com>
Subject: Re: Disable IOMMU in Dom0
Thread-Topic: Disable IOMMU in Dom0
Thread-Index: AQHXnnd7IVjUu+L6S0mPq9naNxJ1FauOJ3YAgADDGos=
Date: Wed, 1 Sep 2021 09:59:52 +0000
Message-ID: 
 <AM7PR03MB659358C0EBA9D71AEEF7A60885CD9@AM7PR03MB6593.eurprd03.prod.outlook.com>
References: 
 <AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2108311444310.18862@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108311444310.18862@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e480f3ce-6a3e-44ea-c1c1-08d96d2f3e73
x-ms-traffictypediagnostic: AS8PR03MB6757:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB67575F4385E18435A2A5E92985CD9@AS8PR03MB6757.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0J2GrC+3U+dvjt4VfBDewh7ZaRnVTgwszZGiIN0mOXsMZzgeDF77YwUx8Pm5AUhzbQlGUCbi9+v6gL0+1oJsSxAUrwLj+Xj/6e5xybjMaohm7o+PR7IyxWzOh8AhOpOAlZ5Ca9HBCaNlVno7qmv30UCRvVukBnK/GLHgf5NTiT1tTXmS8VKIFIm9N6RWyq5yVJkHqqVWnxPWQ0Bhl4ejxTUZpnzeDa4DxrUyenP/JvJgSsF5NuKRXdZ1SC/dA00TE7ljuyhKggETqugoKEtkweuKQDGorQG2ndDyAKSI1ERuk4DCNfRY2wDWR8xJHVguTE9o87jg8cKRUTelZeKkDjTsmsK9iFfS1VU0ko/ielKUf+YX2h4VUqLNruOX8B0qzK0//8z5fm9vUlwvGAcDgVuGC7EFOMRrHAps3aIlZSEQpWcECaV0XntF7y6OQGdwTjtl5aLT6A4Qz3bQF1/HuBjj9SIg9Di/V8DGKe6P8nCQ/jsW8abmoaW3IdioKxHz/hepValPgsn3NGJ8N4F0wEINhKhm8zR7Xks7v4skV5ckSa5knP6BbRxL7T82AqiWWL9Qw6CiaaeWB0lm4/2ZXjazO/AFR7Pr50vMeuKZj0WOQ9m1VE8vMXdXzbxqIMJprD3ky20QVNWba9GBKaxpp8oBQKXDckG4Wd3qUq8yziTAZakugn7aE7/4JYnMYONgVoLAw/iurTy8Fu0nDjJS7Luru5IOFFlDWHeQ9gBsBebrvLKBHk5QG5dpYsXNxXYpkHig5AB22lSz05A3KZ6z5AgOY+uRLpkserliFVRZilM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(966005)(54906003)(38070700005)(166002)(508600001)(66946007)(6916009)(52536014)(5660300002)(33656002)(19627235002)(316002)(38100700002)(26005)(64756008)(8676002)(66556008)(4326008)(66476007)(122000001)(86362001)(6506007)(8936002)(76116006)(186003)(2906002)(107886003)(55016002)(9686003)(19627405001)(53546011)(7696005)(66446008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dXdAFwMOel6Y+LgrmmBEe1vCjW3DC5BUNlcOIlLOyh2n0EWZbpck3S2c/l8s?=
 =?us-ascii?Q?T0QumJZ3ENjw0IrYSxWQnzh3jKnHPPenoHkzzpAsImy7txk9nzJK2n/hF6Gs?=
 =?us-ascii?Q?2hgaoem6aqfDy1ZGzVgsCHnHNYYJjK2/60WW9Ugpw6uMm3MxFHvM72eag6HU?=
 =?us-ascii?Q?bPBuBwe0nbe4xBP0+sR85COktzASZQ6+onMsEh1Yolvpo2DShj1Bw2rJ4MlE?=
 =?us-ascii?Q?62enXAV3f0s1/9w+4k3cGFNj832PjXgmUMiW+Vd9e9YYbCtjbaiMwAi39wgK?=
 =?us-ascii?Q?Eneh+IBI4hLd9iXjmvXiJz8CLGoTUiv51ehpdYF6daOLntbyUMvs9y3ZSC3l?=
 =?us-ascii?Q?AjaBmw2cjbcYBvOuOeDPBhFMbTdDdxeXRL7OuSwk58bW8keAZiItYUwItDZ2?=
 =?us-ascii?Q?iAYDjOVQMMSfh7ioTko3MjORqUMrAkWlQEQ9782JY3z2oh6A/6gh5kAO6wYp?=
 =?us-ascii?Q?QdWbphIxTYknFHfjgut4tcuEp3N3uDcfr4cXagegyGnEor8o3qvsRs3bRMwa?=
 =?us-ascii?Q?1movT+uemGV+P6QAoiRSFQrGFh5IVG8dElY1BrmjGQS0leG5ULBr2mdg7tc4?=
 =?us-ascii?Q?8BsdxqO4g5CrfXildw3BfkFtoRJcdA1g/xmhW6ql+VbGW2GFu73I1wtPsmhR?=
 =?us-ascii?Q?vdAsQ9H8WQRFdnwAAL+m9z3N3nGOqlN3HaJf5iLo7trIuwce19ap115gNcVp?=
 =?us-ascii?Q?bvFodvtttggo376TWvV+V9LEoyH8qyDvIQ3Qy4tLI2jBWH9ASI3lm7JhhWh2?=
 =?us-ascii?Q?acDJN4P7w99/Nryw9KIMOfl+H7sVK5WWs49+I7BS3XBG8wD7xLXetigURkoB?=
 =?us-ascii?Q?LDpeUTij61reziSVhgqMIXF5XSkHTflsWuqeQn2t8/rG7JBj/0RRI/mNMBwi?=
 =?us-ascii?Q?jRflXKkknibU7FZ50qLxMrXhu/1FjBnJvrm+iUWJbA933yVLr7nJZY8JIgN9?=
 =?us-ascii?Q?B/49zypIpMAvKaLe0MROOpQoZ2IBl/L1F1T7k3nidbo/QfDWVXRZaaHtQoAg?=
 =?us-ascii?Q?uOFSep8RqUjOT340v+367anbCl9Jw0pk8nnweXZSHMrbO2pUVT5jTyQCTp0L?=
 =?us-ascii?Q?I9+RgFGBGAgMDcjPN1Vvf5eScJ4Ez/xqq1eU9DMNPdFAXeDOrT4WYA8N1jYA?=
 =?us-ascii?Q?MJHyPKRilmNc26Ki70J/+tue3lFqk45dJovIuXOgvjwTTL0D8O66DEzvQkEU?=
 =?us-ascii?Q?coyRF7X9hxDME5w9TPhkorolqUbmveKZckNrrxgeOhTEk29tjJdPy1P9FSj+?=
 =?us-ascii?Q?uPQS8LKJdc8yLNdqtbjhNKOIm8KqS1PQXC4hAPcRX3DF1zAao7YPNO9iX6L1?=
 =?us-ascii?Q?+Mc=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR03MB659358C0EBA9D71AEEF7A60885CD9AM7PR03MB6593eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e480f3ce-6a3e-44ea-c1c1-08d96d2f3e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 09:59:52.7354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvyKAp3fP1C2MdxzGwuduA5+107HnnQ6ba5q06+VmopgXhShct6Ii4VMyBE16KIXZcyN8LmR6OaXs3Z2T7RAvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6757
X-Proofpoint-GUID: YE7uaaEk6YAdQTzKXmC9hKelH24PX-Ys
X-Proofpoint-ORIG-GUID: YE7uaaEk6YAdQTzKXmC9hKelH24PX-Ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_03,2021-08-31_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010058

--_000_AM7PR03MB659358C0EBA9D71AEEF7A60885CD9AM7PR03MB6593eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Stefano!

Thanks for responding!

> If you have a setup where Dom0 is not 1:1 mapped (which is not currently
> possible with upstream Xen but it is possible with cache coloring) and
> uses the IOMMU to make device DMA work like regular DomUs, then passing
> XENFEAT_not_direct_mapped to Linux would make it work. Without
> XENFEAT_not_direct_mapped, Linux would try to use swiotlb-xen which has
> code that relies on Linux being 1:1 mapped to work properly.

I'm using 1:1 Dom0.
According to your patch series, xen-swiotlb fops will be applied for all de=
vices
because XENFEAT_direct_mapped is active, as shown here:
https://elixir.bootlin.com/linux/v5.14/source/arch/arm64/mm/dma-mapping.c#L=
56

I agreed, that xen-swiotlb should work correctly, but in my case, I retriev=
ed MFN here:
https://elixir.bootlin.com/linux/v5.14/source/drivers/xen/swiotlb-xen.c#L36=
6
which is greater than 32bit and xen-swiotlb tries to use bounce buffer as e=
xpected.
It can lead to decrease a performance because I have a long buffer ~4MB.

I thought, that we can disable swiotlb fops for devices which are controlle=
d by IOMMU.

Cheers,
________________________________
From: Stefano Stabellini <sstabellini@kernel.org>
Sent: Wednesday, September 1, 2021 12:50 AM
To: Roman Skakun <Roman_Skakun@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.o=
rg>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Bertr=
and Marquis <bertrand.marquis@arm.com>; Andrii Anisov <Andrii_Anisov@epam.c=
om>; Roman Skakun <rm.skakun@gmail.com>
Subject: Re: Disable IOMMU in Dom0

On Tue, 31 Aug 2021, Roman Skakun wrote:
> Hi, Stefano!
>
> I have seen your negotiation of disabling xen-swiotlb for devices which a=
re controlled by IOMMU in Dom0:
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-deve=
l/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s/__;!!=
GF_29dbcQIUBPA!hl4_2pWlI3NQmAkwh4uvJFu7NhcOay9O9bIJRr7eOOMKD_I2z8MPbwnSXpNm=
qU6F$ [patchwork[.]kernel[.]org]
>
> As I was thinking to create a common implementation because I have the is=
sue
> when device controlled by IOMMU using xen-swiotlb fops and bounce buffer =
as the result.
> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/060b5741-92=
2c-115c-7e8c-97d8aa5f46f4@xen.org/T/__;!!GF_29dbcQIUBPA!hl4_2pWlI3NQmAkwh4u=
vJFu7NhcOay9O9bIJRr7eOOMKD_I2z8MPbwnSXp1TdIa7$ [lore[.]kernel[.]org]
>
> Do you have any future plans to finish implementation for upstream?

Hi Roman,

The feature is already upstream in Linux as f5079a9a2, and the new
feature flags are XENFEAT_direct_mapped and XENFEAT_not_direct_mapped.

If you have a setup where Dom0 is not 1:1 mapped (which is not currently
possible with upstream Xen but it is possible with cache coloring) and
uses the IOMMU to make device DMA work like regular DomUs, then passing
XENFEAT_not_direct_mapped to Linux would make it work. Without
XENFEAT_not_direct_mapped, Linux would try to use swiotlb-xen which has
code that relies on Linux being 1:1 mapped to work properly.

Is that the same problem that you have, or is dom0 1:1 mapped in your
case? If dom0 is 1:1 mapped then swiotlb-xen should work regardless of
whether the IOMMU is enabled or disabled.

I hope this helps.

Cheers,

Stefano

--_000_AM7PR03MB659358C0EBA9D71AEEF7A60885CD9AM7PR03MB6593eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 12pt;">Hi, Stefano!</span><br>
<br>
<span style=3D"font-size: 12pt;">Thanks for responding!</span><br>
<br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; If you have a set=
up
 where Dom0 is not 1:1 mapped (which is not currently</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; possible with ups=
tream
 Xen but it is possible with cache coloring) and</span><br style=3D"font-fa=
mily:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;=
Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica =
Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 2=
55)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; uses the IOMMU to=
 make
 device DMA work like regular DomUs, then passing</span><br style=3D"font-f=
amily:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, =
255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; XENFEAT_not_direc=
t_mapped
 to Linux would make it work. Without</span><br style=3D"font-family:&quot;=
Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&qu=
ot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,=
 sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; XENFEAT_not_direc=
t_mapped,
 Linux would try to use swiotlb-xen which has</span><br style=3D"font-famil=
y:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Seg=
oe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neu=
e&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)=
">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; code that relies =
on
 Linux being 1:1 mapped to work properly.<br>
</span><br>
<span style=3D"font-size: 12pt;">I'm using 1:1 Dom0.</span><span style=3D"f=
ont-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, =
&quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helv=
etica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, =
255, 255);display:inline !important"><br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; back=
ground-color: rgb(255, 255, 255); display: inline !important;">According to
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">your patch series,&nbsp;</span>xen-swiotlb fops will be applied for all =
devices&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; background-=
color: rgb(255, 255, 255); display: inline !important;">because&nbsp;</span=
><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West=
 European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, =
Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; background=
-color: rgb(255, 255, 255); display: inline !important;"><span style=3D"bac=
kground-color: rgb(255, 255, 255); display: inline !important; font-size: 1=
2pt;">XENFEAT_direct_mapped
 is active, as shown here:</span></span><span style=3D"font-family:&quot;Se=
goe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255);display:i=
nline !important"><br>
<a href=3D"https://elixir.bootlin.com/linux/v5.14/source/arch/arm64/mm/dma-=
mapping.c#L56" id=3D"LPlnk"><span style=3D"font-size: 12pt;">https://elixir=
.bootlin.com/linux/v5.14/source/arch/arm64/mm/dma-mapping.c#L56</span></a><=
br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonl=
y_1"></div>
<br>
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; back=
ground-color: rgb(255, 255, 255); display: inline !important;">I agreed, th=
at
 xen-swiotlb should work correctly, but&nbsp;</span><span style=3D"font-fam=
ily: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;=
Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica =
Neue&quot;, sans-serif; font-size: 12pt;">in my case, I retrieved MFN here:=
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><a href=3D"https://eli=
xir.bootlin.com/linux/v5.14/source/drivers/xen/swiotlb-xen.c#L366" style=3D=
"margin:0px"><span style=3D"font-size: 12pt;">https://elixir.bootlin.com/li=
nux/v5.14/source/drivers/xen/swiotlb-xen.c#L366</span></a></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; background-=
color: rgb(255, 255, 255); display: inline !important;">which is greater th=
an
 32bit and xen-swiotlb tries to use bounce buffer as expected.</span><span =
style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Europea=
n)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, =
&quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color=
:rgb(255, 255, 255);display:inline !important"><br>
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; back=
ground-color: rgb(255, 255, 255); display: inline !important;">It can lead
 to decrease a performance because I have a long buffer ~4MB.</span><span s=
tyle=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European=
)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &=
quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:=
rgb(255, 255, 255);display:inline !important"><br>
<br>
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; back=
ground-color: rgb(255, 255, 255); display: inline !important;">I thought,
 that we can disable swiotlb fops for devices which are controlled by IOMMU=
.</span><span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;ba=
ckground-color:rgb(255, 255, 255);display:inline !important"><br>
<br>
Cheers,</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Stefano Stabellini &l=
t;sstabellini@kernel.org&gt;<br>
<b>Sent:</b> Wednesday, September 1, 2021 12:50 AM<br>
<b>To:</b> Roman Skakun &lt;Roman_Skakun@epam.com&gt;<br>
<b>Cc:</b> Stefano Stabellini &lt;sstabellini@kernel.org&gt;; Julien Grall =
&lt;julien@xen.org&gt;; xen-devel@lists.xenproject.org &lt;xen-devel@lists.=
xenproject.org&gt;; Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;; Andr=
ii Anisov &lt;Andrii_Anisov@epam.com&gt;; Roman Skakun &lt;rm.skakun@gmail.=
com&gt;<br>
<b>Subject:</b> Re: Disable IOMMU in Dom0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 31 Aug 2021, Roman Skakun wrote:<br>
&gt; Hi, Stefano!<br>
&gt; <br>
&gt; I have seen your negotiation of disabling xen-swiotlb for devices whic=
h are controlled by IOMMU in Dom0:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://patchwork.kernel.org/pr=
oject/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkP=
ad-T480s/__;!!GF_29dbcQIUBPA!hl4_2pWlI3NQmAkwh4uvJFu7NhcOay9O9bIJRr7eOOMKD_=
I2z8MPbwnSXpNmqU6F$">
https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-devel/=
patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s/__;!!GF=
_29dbcQIUBPA!hl4_2pWlI3NQmAkwh4uvJFu7NhcOay9O9bIJRr7eOOMKD_I2z8MPbwnSXpNmqU=
6F$</a> [patchwork[.]kernel[.]org]<br>
&gt; <br>
&gt; As I was thinking to create a common implementation because I have the=
 issue<br>
&gt; when device controlled by IOMMU using xen-swiotlb fops and bounce buff=
er as the result.<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://lore.kernel.org/xen-dev=
el/060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org/T/__;!!GF_29dbcQIUBPA!hl4_2=
pWlI3NQmAkwh4uvJFu7NhcOay9O9bIJRr7eOOMKD_I2z8MPbwnSXp1TdIa7$">
https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/060b5741-922c=
-115c-7e8c-97d8aa5f46f4@xen.org/T/__;!!GF_29dbcQIUBPA!hl4_2pWlI3NQmAkwh4uvJ=
Fu7NhcOay9O9bIJRr7eOOMKD_I2z8MPbwnSXp1TdIa7$</a> [lore[.]kernel[.]org]<br>
&gt; <br>
&gt; Do you have any future plans to finish implementation for upstream?<br=
>
<br>
Hi Roman,<br>
<br>
The feature is already upstream in Linux as f5079a9a2, and the new<br>
feature flags are XENFEAT_direct_mapped and XENFEAT_not_direct_mapped.<br>
<br>
If you have a setup where Dom0 is not 1:1 mapped (which is not currently<br=
>
possible with upstream Xen but it is possible with cache coloring) and<br>
uses the IOMMU to make device DMA work like regular DomUs, then passing<br>
XENFEAT_not_direct_mapped to Linux would make it work. Without<br>
XENFEAT_not_direct_mapped, Linux would try to use swiotlb-xen which has<br>
code that relies on Linux being 1:1 mapped to work properly.<br>
<br>
Is that the same problem that you have, or is dom0 1:1 mapped in your<br>
case? If dom0 is 1:1 mapped then swiotlb-xen should work regardless of<br>
whether the IOMMU is enabled or disabled.<br>
<br>
I hope this helps.<br>
<br>
Cheers,<br>
<br>
Stefano<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM7PR03MB659358C0EBA9D71AEEF7A60885CD9AM7PR03MB6593eurp_--

