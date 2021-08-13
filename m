Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327163EB9AA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 18:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166840.304555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEZbL-0005f3-1x; Fri, 13 Aug 2021 16:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166840.304555; Fri, 13 Aug 2021 16:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEZbK-0005cC-SU; Fri, 13 Aug 2021 16:00:06 +0000
Received: by outflank-mailman (input) for mailman id 166840;
 Fri, 13 Aug 2021 16:00:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=USBj=NE=epam.com=prvs=885989f52f=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mEZbI-0005IV-9d
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 16:00:04 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 844aaf7a-fc4f-11eb-a2ec-12813bfff9fa;
 Fri, 13 Aug 2021 16:00:02 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17DFtW99011679; Fri, 13 Aug 2021 15:59:59 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3adrurrweq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 15:59:58 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AM6PR03MB4054.eurprd03.prod.outlook.com (2603:10a6:20b:16::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Fri, 13 Aug
 2021 15:59:54 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411%3]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 15:59:54 +0000
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
X-Inumbo-ID: 844aaf7a-fc4f-11eb-a2ec-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VicMO0YRfpMYBEavh5Dzk6sbQNOHoXjFGgv21Ps9keHjxjZHmyXMz4bgY34Scok0SNrtv3BrUN8sS1g+Dzb9qf9kLaVKLOfpduVenHTXUBw86x7g3P3KwVKkvs3gPXv9wEPIoVgIo+TCdxUCp1iLuy9kx2+ufgTAJcol/0sNaCkxhlZ/0urizSosheFWZghNx1v67kr4UqWyXcKwSWi5jdfzhcXKFlzmTSARGqHj3FgK+YPRpryhU49Q6xobyjc5a0T94ZdkvO04fuErqDnxerEHVdmKBhysrZdqljTufshyQ7WU8yh2kHrDJgP3NQhzjNHfnv4l4OL2m2n+oUQXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZregRLNf01nj4+DF+xNM1YazSprrtjcYbgSgxKQ5sBc=;
 b=fCQxRyeRHM93qKI7fLYwaDQnnwNaBJb0OW3IoG57XGIuew92Di1u7fyJcqqstc8+R6VyRZ7sjQZTZ1mjwmowiFyzXXNSfzDnGAlkJZpEe6q5k3878EtDww/xC0wv4cCCvtntVPOxoATxZfsfF1NRnn1K2S4xMwr4YmjTu9MkS5jUts0v0D1bt4/o1fYP/6AWdrMmkTdy9lDbx0Z15hMZi4DPBEj+J7tH17TQZ5zssk8qkz8Q14GgWHyvQFOt/VGdqCfoMnNQ4VF97fzRdaMOKj1QhS5uHnp6k2dmuSwqu6dFwJ+uThSnTrrdPTV1gke6L+X2Tm/T2mpgWl2/HBFq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZregRLNf01nj4+DF+xNM1YazSprrtjcYbgSgxKQ5sBc=;
 b=EEGjOUutYkNpFcWqOg9+YETncOPj3y8FcDcggCIEy+kpPqszMS4+tEclumBjnH5iIIZe02JnkLckBGrEQ/c21hoWiZSDYdhqt6UWgkMeMF5db3YFJSshLGqBQjnsdD3OrPKrpKiscIxUnlRxjgBytp5QWUWZ7XhiSVYWDylHoJRF8S6NXmvV+sC7LY6VIjQZYF9i6BtBn3kV7GFVXPjCtY19ndvmjJXmBziXygOTkKrKnUhE/ZEpGaKqsXkZpRoir40L/JvUQgKaIpJ6ZGgH7nEWzGPLACH16RI7HKXlv8UPWwj6G/su0nB/a88QKykrz/LHLA5RUKvv7/3g/72p1g==
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
Thread-Index: 
 AQHXjfwJK3kYIT7XAUWdmOu1AWm+tKts6kUAgAD/OfqAADJaAIAAJhCIgAArBQCAAqGMMYAAN/uAgABIigY=
Date: Fri, 13 Aug 2021 15:59:53 +0000
Message-ID: 
 <AM7PR03MB65932EEF162F76F482BF4F8C85FA9@AM7PR03MB6593.eurprd03.prod.outlook.com>
References: 
 <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
 <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <d616081a-8c60-dcda-ac54-58c5be0c21ce@xen.org>
 <AM7PR03MB6593834BA54AD8A126EF872185F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <691e31db-c79b-9196-53e1-cbbdc9bd3a54@xen.org>
 <AM7PR03MB659376E041306352B583060185FA9@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <d77e3b8e-ebd5-b4de-e516-9c5c69626678@xen.org>
In-Reply-To: <d77e3b8e-ebd5-b4de-e516-9c5c69626678@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f840a54e-1a64-4898-0d53-08d95e7363f3
x-ms-traffictypediagnostic: AM6PR03MB4054:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB40542D926C0034AC0F16870685FA9@AM6PR03MB4054.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IgeWdp5qmnaP770/ebnXzG+FdZLxdyIY5tLCItoaqXyDSkCT37w2P4dxXA7Axvk3MOQ87HqvZn5Dj2IpbIIlqNOPQOiXspFAxUGNYpLN0XwAzyYA7uh9t3gGEuelJEu9LTdo90grMUGvap6cTuIehU+EhUCkENmLbktmlmhoil1n6kZwHCpdbvKLS3UXM3ekGxL4kIxzAanVJKIX3nXWdN8nL/Y9WDUoiRegNAQjehXUdioKhz3F3miYjUj0OdhQfKAm+q/d+YWckEwNtpwO5eRksYAwF+3xWcb5lxJiZk1kouro+xb7vI2g1GAyo7sJVhl/mf/7b8gf26EOmvkRCkI2B4iJAEmNObUmZl9+G3ww6jmdRgPNa/4pbLBor3uDEk1iRA+A9ndOxC4F4tyf1csZaGGb1umOvNOohwIwqMA0s5pbdC+7MjFNFn21iRSHRbpeJ72wSexbxIQGAjcS/NQqMmOsV6InabzjK3yiyLBJzew3ijOPrYcpf4d+WOkqiuPapG+6yEqZIBQCaYgdU30bQDr65b8RKyFxzRb2tQAzv1tFchVLUXKiIY3qBKtqepeV3llA57fwbvtpwjrg9sQ2ZrFhCMtqZAGHh6z4tgUZeX1TywAF54SFOlSq34EQcfYh9Fm6nK4UaYHW/efG+1Zrp7ZkON2UT0gd0K47M+Np7M9JH5wBelnoQvUlfYYpFLP+2KD0FMvCOmckuiHnbBDlDY4XqXBIqGl+mCRfPEnTvvT63Wyk+HFGGzQyVHaSREDd3X9vKACWPn7MGJoleTpKP6MIn2RRdG2dvDIZk3I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(26005)(55016002)(122000001)(9686003)(86362001)(2906002)(38100700002)(186003)(83380400001)(6506007)(8676002)(19627235002)(53546011)(71200400001)(107886003)(4326008)(7696005)(38070700005)(19627405001)(8936002)(21615005)(166002)(478600001)(5660300002)(33656002)(966005)(52536014)(76116006)(110136005)(66556008)(66946007)(66476007)(64756008)(66446008)(316002)(91956017)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6lijdyGlRmZpQ7TagL1Ni7ao6wLYtkmpkFvKO8zHNzO699hG7AiyMhcqKrfg?=
 =?us-ascii?Q?9JRT0TkQccCgTzPHYCyEQjiGp+ZwK7NpOd2gT1v+JccwFes6+/yFhnj8Nzdf?=
 =?us-ascii?Q?qUuJr2eFNMLjndb2lt22CTxh7noKV3KXZPJQ2aXb4cbNWfDzdyNO0t98fvlj?=
 =?us-ascii?Q?EuvkDzy/lKLr6DxO32IQ2etZ2OsX8KF5Pw8oMs2AVwQLuEWiogQ+BNxv2l6A?=
 =?us-ascii?Q?lxQIKkY3KX1YJ0iyrgaYs6HQWRy9wrRebM4ArJaj+vIZPoFPdINFG2M9MaHI?=
 =?us-ascii?Q?yjazdbkqe/CGCST2ynwmzzCigGPnyotiW/52JWGj0CyqsTATApZVgcQdWiM6?=
 =?us-ascii?Q?v+Hmpt/oaBRZmNzUjloM05OXuNgCVWW3YTw5zWpnGENoz0st9XbGNeu39niX?=
 =?us-ascii?Q?YIiXFGHZwbsPkIk49QJM45v6lwHNY9kR89aLxnGHehNEXH7eEqL6uu1vXT5N?=
 =?us-ascii?Q?UQv6B40vu9hbJb7ME11jWJomuMirsg/y8ItuJWbqzwzTBOm0/dPEA2Dlbdmr?=
 =?us-ascii?Q?ZYQLUpdZ1FO60zxNJpQ/hyjOJairEdKtB7ZNh6Sq+a4X8szZKE7HB6SVq96w?=
 =?us-ascii?Q?Hcdo4TUMBVDKgBr9onfr6E9hXdz/pAO2PAR8f0ESZtRNHMZGqBCTP4Z/doQ9?=
 =?us-ascii?Q?PE5cmawVyn2tcDJa9ngqWXCBkP5MewWYDzeq5StTI2UBPRu37ErDOz5AHDHj?=
 =?us-ascii?Q?6zJ0UJ2+fYu4xJMA4mO0fzjri53KRAWnJxg0lg/ix4SCNMcHwc2y221wPLY2?=
 =?us-ascii?Q?/wJg7gL0m/jb6zvIamxiyDiQcqlrvwinoARvn+YA2B/nLRq5pUZg5joYixUH?=
 =?us-ascii?Q?NNjo/W22VkfEc+fn/Xzz/tukvDHh0A1Ap8rt9qMcYEjp/TEYTRmDanFOgIiY?=
 =?us-ascii?Q?wabkMKlLqZmjigvlXBDi24WegCQ+8eQCFjAGLJwY6SQIQo+YozfaaCarks1w?=
 =?us-ascii?Q?vhHFeSMWAQHOG+CbWnG7m+eUQKS8ekHMBeSN1xL/DPaReXrwAhRhrspPxBRM?=
 =?us-ascii?Q?B5iYWhf6yMHwOqmF8RxVdE7JV4kFM38R8SW82/JFN5iCQnxHD53fl8Ius3CN?=
 =?us-ascii?Q?W9t/Y4uVgYXDrglWXGFUbJZBY+n/AmrvTfBTWdQRiMNGuOMwPXBhnKP3JB+S?=
 =?us-ascii?Q?eznCAuoUCBgZi3yoOKbz4kT0s2zBIq9dAewuctgr08nSPENezUZTg+T9XhaZ?=
 =?us-ascii?Q?PM/oJUiHbqXgyc8xR4mkSLhSzikYc3hkH5md79IDXUmepcHmK+U7XT1W1Q7j?=
 =?us-ascii?Q?MyY4SLFQVIJ2sm+8jectert1oHxyWVg5pZYPZIuHQCIUlyWsfjPtdobcXHlp?=
 =?us-ascii?Q?4/w=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR03MB65932EEF162F76F482BF4F8C85FA9AM7PR03MB6593eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f840a54e-1a64-4898-0d53-08d95e7363f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 15:59:53.9424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jXeMVWFksVAbqbjanqOEpijHjvFbAkz2+c0PnEu6HFor79mhsTtbzasqJqB30qSRfe9ainJmvAQEppnga1aF6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4054
X-Proofpoint-GUID: AAxinX7iljIulfRLy981o-0OH18_uD6C
X-Proofpoint-ORIG-GUID: AAxinX7iljIulfRLy981o-0OH18_uD6C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-13_05:2021-08-13,2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130095

--_000_AM7PR03MB65932EEF162F76F482BF4F8C85FA9AM7PR03MB6593eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>> But I think, we cannot use64af97000 address in the swiotlb_bounce()
>> directly.
>>
>I am not sure to understand what you mean. Can you clarify?

I thought, that the address 64af97000 can be used directly here:
https://elixir.bootlin.com/linux/v5.10/source/kernel/dma/swiotlb.c#L572
and I was confused about it.
After some diggings I realized that this code is not reachable because
DMA_ATTR_SKIP_CPU_SYNC is active.

>> Swiotlb did not fit requested slots because the maximum slot size equals
>> IO_TLB_SEGSIZE=3D128 by default.
>
>> Ok. So it sounds like your problem is the have a DMA buffer that is too
>> large for the default swiotlb. Did you try to bump the value from the
>> command line?

Yes, you are right. I checked the implementation more detailed and figured =
out that
swiotlb tries to find a contiguous segment that is a big enough, as shown h=
ere:
https://elixir.bootlin.com/linux/v5.10/source/kernel/dma/swiotlb.c#L528,

But the maximum TLB segment equals 128K by default in accordance with
https://elixir.bootlin.com/linux/v5.10/source/include/linux/swiotlb.h#L25

This means that the max size of TLB segment equals:
128 * 2048 =3D 256K

After this, I tried to increase the TLB segment size like this:

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index fbdc65782195..85f32865bb6c 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -22,7 +22,7 @@ enum swiotlb_force {
  * must be a power of 2.  What is the appropriate value ?
  * The complexity of {map,unmap}_single is linearly dependent on this valu=
e.
  */
-#define IO_TLB_SEGSIZE 128
+#define IO_TLB_SEGSIZE 2048

 /*
  * log of the size of each IO TLB slab.  The number of slabs is command li=
ne

and the problem is gone.

Also, I found the article https://www.xilinx.com/support/answers/72694.html=
,
where I believe the same issue was mentioned.

Thank you so much for your time and help!

________________________________
From: Julien Grall <julien@xen.org>
Sent: Friday, August 13, 2021 1:51 PM
To: Roman Skakun <Roman_Skakun@epam.com>; sstabellini@kernel.org <sstabelli=
ni@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>; Andrii Anisov <Andrii_Anis=
ov@epam.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Oleksandr Tys=
hchenko <Oleksandr_Tyshchenko@epam.com>; Oleksandr Andrushchenko <Oleksandr=
_Andrushchenko@epam.com>; xen-devel@lists.xenproject.org <xen-devel@lists.x=
enproject.org>; Roman Skakun <rm.skakun@gmail.com>; Jan Beulich <jbeulich@s=
use.com>
Subject: Re: Disable swiotlb for Dom0



On 13/08/2021 10:38, Roman Skakun wrote:
> Hi Julien,

Hi Roman,

>> So 0xb6000000 is most likely the GFN used to mapped the grant from the d=
omU.
>>
>> swiotlb-xen on Arm will convert it to the MFN because it is not aware
>> whether the device is behind an IOMMU.
>
> If I'm understand right, it seems like that swiotlb-xen is not ready to
> work properly in case
> when we retrieved MFN instead of proper GFN mapped to Dom0 memory.
> Maybe you know some ideas to overcome this condition?

swiotlb-xen work as intended. You have a DMA buffer at an address that
your device cannot deal with. So it will try to bounce it.

>
>>  As the address is too high to be handled by the device, swiotlb will tr=
y
>>  to bounce it. I think it is correct to bounce the page but I am not sur=
e
>>  why it can't. What the size of the DMA transaction?
>
> The DMA map size is 3686400 bytes.

So that's a 3MB buffer. I am slightly confused because in an earlier
message you wrote that the memory is coming from the guest. How did you
map it?

>
> I've added several logs to swiotlb map_single() and see:
> [  151.298455] <SWIOTLB> swiotlb_tbl_map_single() origin_addr:
> 64af97000, needed: 708,
> avail: 7fc0, stride: 2, index: 4160

I am not sure how to read the logs... Are the number in hexadecimal or
decimal? It might be useful if you post the diff of your changes.

[...]

> Swiotlb did not fit requested slots because the maximum slot size equals
> IO_TLB_SEGSIZE=3D128 by default.

Ok. So it sounds like your problem is the have a DMA buffer that is too
large for the default swiotlb. Did you try to bump the value from the
command line?

> But I think, we cannot use64af97000 address in the swiotlb_bounce()
> directly.

I am not sure to understand what you mean. Can you clarify?

Cheers,

[...]

--
Julien Grall

--_000_AM7PR03MB65932EEF162F76F482BF4F8C85FA9AM7PR03MB6593eurp_
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
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px;"><br>
&gt;</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI=
 Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSy=
stemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.666=
7px;">&gt; But I think, we cannot use64af97000 address in the&nbsp;swiotlb_=
bounce()</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 directly.</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe=
 UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMa=
cSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.66=
67px;background-color:rgb(255, 255, 255)">
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
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>I
 am not sure to understand what you mean. Can you clarify?</span><br>
<br>
I thought, that the address&nbsp;<span style=3D"font-family:&quot;Segoe UI&=
quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -app=
le-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-ser=
if;font-size:14.6667px;background-color:rgb(255, 255, 255);display:inline !=
important">64af97000
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; back=
ground-color: rgb(255, 255, 255); display: inline !important;">can be used
 directly here</span><span style=3D"font-family:&quot;Segoe UI&quot;, &quot=
;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, B=
linkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size=
:14.6667px;background-color:rgb(255, 255, 255);display:inline !important">:=
<br>
</span><a href=3D"https://elixir.bootlin.com/linux/v5.10/source/kernel/dma/=
swiotlb.c#L572" id=3D"LPlnk">https://elixir.bootlin.com/linux/v5.10/source/=
kernel/dma/swiotlb.c#L572</a><br>
and I was confused about it.<br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">After some diggings I realized that this cod=
e is not reachable because&nbsp;</span><br>
DMA_ATTR_SKIP_CPU_SYNC is active.<br>
<br>
<div style=3D"margin:0px;font-size:12pt"><span style=3D"margin:0px;font-siz=
e:14.6667px;font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Euro=
pean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Robot=
o, &quot;Helvetica Neue&quot;, sans-serif;background-color:rgb(255, 255, 25=
5);display:inline !important"><span style=3D"margin:0px;background-color:rg=
b(255, 255, 255);display:inline !important">&gt;</span>&gt;
 Swiotlb did not fit requested slots because the maximum slot size equals</=
span><br>
<span style=3D"margin:0px;font-size:14.6667px;font-family:&quot;Segoe UI&qu=
ot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple=
-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif=
;background-color:rgb(255, 255, 255);display:inline !important">&gt;<span s=
tyle=3D"margin:0px;background-color:rgb(255, 255, 255);display:inline !impo=
rtant">&gt;</span><span>&nbsp;</span>IO_TLB_SEGSIZE=3D128
 by default.</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Seg=
oe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Blink=
MacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.=
6667px;background-color:rgb(255, 255, 255)">
<span style=3D"margin:0px;font-size:14.6667px;font-family:&quot;Segoe UI&qu=
ot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple=
-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif=
;background-color:rgb(255, 255, 255);display:inline !important">&gt;</span>=
<br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eur=
opean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Robo=
to, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-c=
olor:rgb(255, 255, 255)">
<span style=3D"margin:0px;font-size:14.6667px;font-family:&quot;Segoe UI&qu=
ot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple=
-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif=
;background-color:rgb(255, 255, 255);display:inline !important"><span style=
=3D"margin:0px;background-color:rgb(255, 255, 255);display:inline !importan=
t">&gt;</span><span style=3D"margin:0px;background-color:rgb(255, 255, 255)=
;display:inline !important">&gt;&nbsp;</span>Ok.
 So it sounds like your problem is the have a DMA buffer that is too</span>=
<br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eur=
opean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Robo=
to, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-c=
olor:rgb(255, 255, 255)">
<span style=3D"margin:0px;font-size:14.6667px;font-family:&quot;Segoe UI&qu=
ot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple=
-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif=
;background-color:rgb(255, 255, 255);display:inline !important"><span style=
=3D"margin:0px;background-color:rgb(255, 255, 255);display:inline !importan=
t">&gt;</span><span style=3D"margin:0px;background-color:rgb(255, 255, 255)=
;display:inline !important">&gt;&nbsp;</span>large
 for the default swiotlb. Did you try to bump the value from the</span><br =
style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Europea=
n)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, =
&quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color=
:rgb(255, 255, 255)">
<span style=3D"margin:0px;font-size:14.6667px;font-family:&quot;Segoe UI&qu=
ot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple=
-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif=
;background-color:rgb(255, 255, 255);display:inline !important"><span style=
=3D"margin:0px;background-color:rgb(255, 255, 255);display:inline !importan=
t">&gt;<span style=3D"margin:0px;background-color:rgb(255, 255, 255);displa=
y:inline !important">&gt;&nbsp;</span></span>command
 line?</span><br>
<br>
Yes, you are right. I checked<span>&nbsp;</span><span style=3D"margin:0px;b=
ackground-color:rgb(255, 255, 255);display:inline !important">the implement=
ation&nbsp;</span>more detailed and figured out that<br>
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">swiotlb tries to find a contiguous segment that is a big enough, as show=
n here:</span><br>
<a href=3D"https://elixir.bootlin.com/linux/v5.10/source/kernel/dma/swiotlb=
.c#L528" style=3D"margin:0px;background-color:rgb(255, 255, 255)">https://e=
lixir.bootlin.com/linux/v5.10/source/kernel/dma/swiotlb.c#L528</a>,</div>
<div style=3D"margin:0px;font-size:12pt"><br>
</div>
<div style=3D"margin:0px;font-size:12pt">But the maximum TLB segment equals=
 128K by default in accordance with<br>
<a href=3D"https://elixir.bootlin.com/linux/v5.10/source/include/linux/swio=
tlb.h#L25" id=3D"LPlnk">https://elixir.bootlin.com/linux/v5.10/source/inclu=
de/linux/swiotlb.h#L25</a><br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_2 _EReadonl=
y_1"></div>
<br>
This means that the max size of TLB segment equals:<br>
128 * 2048 =3D 256K<br>
&nbsp;<br>
After this, I tried to increase the TLB segment size like this:<br>
<br>
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
<div style=3D"margin:0px">index fbdc65782195..85f32865bb6c 100644</div>
<div style=3D"margin:0px">--- a/include/linux/swiotlb.h</div>
<div style=3D"margin:0px">+++ b/include/linux/swiotlb.h</div>
<div style=3D"margin:0px">@@ -22,7 +22,7 @@ enum swiotlb_force {</div>
<div style=3D"margin:0px">&nbsp; * must be a power of 2. &nbsp;What is the =
appropriate value ?</div>
<div style=3D"margin:0px">&nbsp; * The complexity of {map,unmap}_single is =
linearly dependent on this value.</div>
<div style=3D"margin:0px">&nbsp; */</div>
<div style=3D"margin:0px">-#define IO_TLB_SEGSIZE 128</div>
<div style=3D"margin:0px">+#define IO_TLB_SEGSIZE 2048</div>
<div style=3D"margin:0px">&nbsp;</div>
<div style=3D"margin:0px">&nbsp;/*</div>
&nbsp; * log of the size of each IO TLB slab. &nbsp;The number of slabs is =
command line<br>
<br>
and the problem is gone.<br>
<br>
Also, I found the article&nbsp;<a href=3D"https://www.xilinx.com/support/an=
swers/72694.html" style=3D"margin:0px">https://www.xilinx.com/support/answe=
rs/72694.html</a>,&nbsp;<br>
<span style=3D"margin:0px;background-color:rgb(255, 255, 255);display:inlin=
e !important">where I believe the same issue was mentioned.</span></div>
<br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonl=
y_1"></div>
Thank you so much for your time and help!<br>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Friday, August 13, 2021 1:51 PM<br>
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
On 13/08/2021 10:38, Roman Skakun wrote:<br>
&gt; Hi&nbsp;Julien,<br>
<br>
Hi Roman,<br>
<br>
&gt;&gt; So 0xb6000000 is most likely the GFN used to mapped the grant from=
 the domU.<br>
&gt;&gt;<br>
&gt;&gt; swiotlb-xen on Arm will convert it to the MFN because it is not aw=
are<br>
&gt;&gt; whether the device is behind an IOMMU.<br>
&gt; <br>
&gt; If I'm understand right, it seems like that swiotlb-xen is not ready t=
o <br>
&gt; work properly in case<br>
&gt; when we retrieved MFN instead of proper GFN mapped to Dom0 memory.<br>
&gt; Maybe you know some ideas to overcome this condition?<br>
<br>
swiotlb-xen work as intended. You have a DMA buffer at an address that <br>
your device cannot deal with. So it will try to bounce it.<br>
<br>
&gt; <br>
&gt;&gt;&nbsp; As the address is too high to be handled by the device, swio=
tlb will try<br>
&gt;&gt;&nbsp; to bounce it. I think it is correct to bounce the page but I=
 am not sure<br>
&gt;&gt;&nbsp; why it can't. What the size of the DMA transaction?<br>
&gt; <br>
&gt; The DMA map size is 3686400 bytes.<br>
<br>
So that's a 3MB buffer. I am slightly confused because in an earlier <br>
message you wrote that the memory is coming from the guest. How did you <br=
>
map it?<br>
<br>
&gt; <br>
&gt; I've added several logs to swiotlb map_single() and see:<br>
&gt; [ &nbsp;151.298455] &lt;SWIOTLB&gt; swiotlb_tbl_map_single() origin_ad=
dr: <br>
&gt; 64af97000, needed: 708,<br>
&gt; avail: 7fc0, stride: 2, index: 4160<br>
<br>
I am not sure how to read the logs... Are the number in hexadecimal or <br>
decimal? It might be useful if you post the diff of your changes.<br>
<br>
[...]<br>
<br>
&gt; Swiotlb did not fit requested slots because the maximum slot size equa=
ls <br>
&gt; IO_TLB_SEGSIZE=3D128 by default.<br>
<br>
Ok. So it sounds like your problem is the have a DMA buffer that is too <br=
>
large for the default swiotlb. Did you try to bump the value from the <br>
command line?<br>
<br>
&gt; But I think, we cannot use64af97000 address in the&nbsp;swiotlb_bounce=
() <br>
&gt; directly.<br>
<br>
I am not sure to understand what you mean. Can you clarify?<br>
<br>
Cheers,<br>
<br>
[...]<br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM7PR03MB65932EEF162F76F482BF4F8C85FA9AM7PR03MB6593eurp_--

