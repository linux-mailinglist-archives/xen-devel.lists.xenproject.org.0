Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35622417074
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195296.347937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTioY-0007rQ-PB; Fri, 24 Sep 2021 10:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195296.347937; Fri, 24 Sep 2021 10:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTioY-0007ok-M4; Fri, 24 Sep 2021 10:52:22 +0000
Received: by outflank-mailman (input) for mailman id 195296;
 Fri, 24 Sep 2021 10:52:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mfdr=OO=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mTioW-0007oe-H2
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:52:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89e8340a-01c5-4a1b-88fd-e6c5d7a1339a;
 Fri, 24 Sep 2021 10:52:18 +0000 (UTC)
Received: from AM6P192CA0081.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::22)
 by AM9PR08MB5874.eurprd08.prod.outlook.com (2603:10a6:20b:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 10:52:15 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::f4) by AM6P192CA0081.outlook.office365.com
 (2603:10a6:209:8d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 10:52:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:52:14 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Fri, 24 Sep 2021 10:52:12 +0000
Received: from a65bb6ca84ca.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 608D8706-5811-496B-92CA-7F1113CE724B.1; 
 Fri, 24 Sep 2021 10:52:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a65bb6ca84ca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:52:01 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6128.eurprd08.prod.outlook.com (2603:10a6:102:f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 10:51:59 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:51:59 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0188.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:51:58 +0000
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
X-Inumbo-ID: 89e8340a-01c5-4a1b-88fd-e6c5d7a1339a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCmURqAOGUZi1Us3emkbyTPWGvgqPY5SYraxsyRAEO0=;
 b=2vMSkrqW9d7yohjkkkcrN+7z3BUbkoOu6q23+COGe3daFiSNonIr5Zzr/9ysnx+heiNeYpIvuqr/cmCBuu3C6Ky2Bv/WQ2OzSkSYyGNPM8G5y31jrFrpIIyIfAY3QnWf798rQOdtMVknOC2/O1xOeryU0f2pSi/wqbdhLBfh1JU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85284076dcb9a8a2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPPQ3in+84MHNukL6Bvs9cDSu5heFLO4V0v8XBnnJjA4fp2zeGX1pH9vbTcmpGmcYj5T3eJVqTgI2nhZps0gmQklAsHl77jvfXSvvlU7hU2I2CdoCU42OrlIzzGfb8u5GhNQC9NZwGD+XpQVAbzNP9eoxMpp9nVnfSw9/uDmaOio8dz9plVvdyfCphzHWBRgrHX1q/XqvJmv34s9qeTNL+Z26oejOFzBrkyrtU8e3jkF/u4t7r2WKC9AjIGLLBOZy4WnuHNQgceVsrH3Dfhhy5mbkpG4bndZJdXxg4vkFOlPlcnetVNyKouPotBQjNQeQl7zU19Lei4MXsyo0ytQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vCmURqAOGUZi1Us3emkbyTPWGvgqPY5SYraxsyRAEO0=;
 b=HuVeKb3elfy84Q+MjNXs3fvjOlIzHLIXDjnhRkK1jvm9h8rHRCMwGZoI5VlvLbGE20aoZfyB4/36Cwyr3Nk/f3R8SqIZ69emsvdYGE761BH4xNS4cqDuXXUyfL6DQbajJsifUSZvY81siA5KHkPf0247b298lugcko5CKyX0rwGmtvt4knFb/ZCOgITt7ziBdhllPailO0uXeC/IgmP7BkPjMzhjohakhV2aZZSFrFSsa5gsLucOF9xpFvwGf6bzdlgB6kcf+8enqlPPEmKKYyMa7GaDcTybwztSXEBantVSpoltayhuwRRhfb/RRtmfpjf8smjZj5xX6o6SszbZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCmURqAOGUZi1Us3emkbyTPWGvgqPY5SYraxsyRAEO0=;
 b=2vMSkrqW9d7yohjkkkcrN+7z3BUbkoOu6q23+COGe3daFiSNonIr5Zzr/9ysnx+heiNeYpIvuqr/cmCBuu3C6Ky2Bv/WQ2OzSkSYyGNPM8G5y31jrFrpIIyIfAY3QnWf798rQOdtMVknOC2/O1xOeryU0f2pSi/wqbdhLBfh1JU=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109230943510.17979@sstabellini-ThinkPad-T480s>
Date: Fri, 24 Sep 2021 11:51:51 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6A929631-AA44-4ECF-AACB-16C0110393F6@arm.com>
References: <20210922141341.42288-1-luca.fancellu@arm.com>
 <20210922141341.42288-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109221430210.17979@sstabellini-ThinkPad-T480s>
 <2C0E480C-DF1C-4AAD-89F5-99D52B016970@arm.com>
 <alpine.DEB.2.21.2109230943510.17979@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::32) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fb9fe46-6e22-41f0-d7e5-08d97f495ed0
X-MS-TrafficTypeDiagnostic: PA4PR08MB6128:|AM9PR08MB5874:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB58749BE6B9D9028FA086C77FE4A49@AM9PR08MB5874.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XVFje0UnoBC+OdEx4u1AjtNcplC/+FwoSRpu+HNs6vtibnPMqZu4DUrq7UdZwnGparcXHvvcPGxND+GupxPkJj8ZGCOGtgItJ1T9iErwSRgpGut0A+qHe9gGVy5+Pfgo9cdNPLP1ARQCju8jYZbL94iFeTpV1Dj84zQWbaMBCnz5VNYZG63UYGGZpuM2Ck5Sasf8bqQYC66c5AiPs9j7/tIUntxzCsKNVCEOkC1MTVM4L1SHyhcQqx9JQTsi6y373kocY9lWejtNaOYx/DB9kFdQldn7QSVdbr4Sxd7wY5cEst3KOlD6P/HO46mqS8eIy9AL5USnRnJL9DjDLnAq8kvV2XNCDa53eE0WcNaQCqWPuHfc2EJz4aLCg1Iu8muVhlLVmflkLJaeP72Br8qqIDkQ5gYEBzkIDNfXyKI1yyDAj91QXlqTs7Q2EWaASnbQbFBvIW5g1pX/29fNArvp/MGXJ7vLr6PXsh6zo1I0jhYBkX8HadvsBEfxQHRtthpQ9l8shQEMMigbyU2GFduyH2Zd8ewQPUfrNJO1clwj/eh/pTpABXWjXnvgXtY6+fuZ0IWRJQ6Y/qQc5ZIJsRJB8WDBLMyE1ZbasaJd+e+WVdf3/IXB1gVaMeGfnzh6PbtlEUU/6ciPCjkR8vjW3FubF9Qwsd1ESTVQlMnpGB7zAzCRGFNwuKFZ69J4z8H077AQVi8cw90jdJX1x3UgRDaTy6BoJsysgnI6bNPiITihtiz97FJcOwVEcUm1FksyR2wy34wZczeIrxV6DaaAG2ObvA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(2906002)(4326008)(2616005)(86362001)(6916009)(316002)(52116002)(66946007)(508600001)(956004)(6512007)(44832011)(54906003)(8936002)(7416002)(66556008)(33656002)(66476007)(38350700002)(38100700002)(26005)(5660300002)(36756003)(53546011)(8676002)(6506007)(6486002)(6666004)(186003)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6128
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0dc4f034-5cb1-4913-2d22-08d97f495565
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VRG1Tkpw4netxyaFU95TAkPbgCTal/yDn2AohDhgQ04YK+EmXyT0qRljnLripAUQgGuG3XGL59dingg9eOx9d3PKYjRXZk0SLLfaNyyBMJ3yKpHRILjU5cfQ3lZ3ywQ2ppVq6hhSQVwoZKiyPXDNdEHLaTvFjl0rV7j/nk/iFZPEg1A3XD5aRWfoGcOY3JPu4dhBhM2olhPH92mpAmhFHS57d7qM1V1uf0ersuOdDuyTaW9iUO3/4xLj6gsE6WkmOjGQ3cxaXjLYU6NE3189O9p1tk7WsoLv0mGAuCypK7YkDYxabttGZjoH0epPlXisvAQO5HayY3Yp69Qm6W+a8h7S9GM2pAegQ58HSwwwfhXFhNCsB4pHVN/B2L+x4D6rBTi6X9Xa/ngKTkOYjVnTq091wMOAoaA6ZSF/ztccdOcBVDH0Bl2pwC86ZbDKd+ea+rD9PoXZuTv/KHFlTAYTYzlowaY+rk6I+VFW1N8zRZXZwX2splVxdHZMAWIvUPmTECWzwq8U0j00zoT1+unL4QMSGofVBQmQUlL/b1LQVdrgHZSb51hqAUuT2TEAzBvfwtDG1mC4/24oziE7240Ko5PFmI2pCJUmVOzS/dg7bAZjHEYNWtrJcgH6tOlmMGswjL9klQzwV6lve9HNAqMIym+Jb2Wjq4dNMeXB7j994wFgZUNHNsiYBkjCETqCrtTaJaNsnERgTJ+VyCWA5ZcdfTw2+3d2qWcuMJtyjwq02pg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(8936002)(82310400003)(86362001)(6486002)(36756003)(33656002)(70586007)(36860700001)(2906002)(6862004)(70206006)(2616005)(956004)(6512007)(316002)(81166007)(4326008)(54906003)(47076005)(8676002)(44832011)(53546011)(83380400001)(6506007)(26005)(186003)(508600001)(107886003)(356005)(6666004)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:52:14.8631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb9fe46-6e22-41f0-d7e5-08d97f495ed0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5874



> On 23 Sep 2021, at 17:59, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 23 Sep 2021, Luca Fancellu wrote:
>>>> +/*
>>>> + * Binaries will be translated into bootmodules, the maximum number f=
or them is
>>>> + * MAX_MODULES where we should remove a unit for Xen and one for Xen =
DTB
>>>> + */
>>>> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
>>>> +static struct file __initdata dom0less_file;
>>>> +static dom0less_module_name __initdata dom0less_modules[MAX_DOM0LESS_=
MODULES];
>>>> +static unsigned int __initdata dom0less_modules_available =3D
>>>> +                               MAX_DOM0LESS_MODULES;
>>>> +static unsigned int __initdata dom0less_modules_idx;
>>>=20
>>> This is a lot better!
>>>=20
>>> We don't need both dom0less_modules_idx and dom0less_modules_available.
>>> You can just do:
>>>=20
>>> #define dom0less_modules_available (MAX_DOM0LESS_MODULES - dom0less_mod=
ules_idx)
>>> static unsigned int __initdata dom0less_modules_idx;
>>>=20
>>> But maybe we can even get rid of dom0less_modules_available entirely?
>>>=20
>>> We can change the check at the beginning of allocate_dom0less_file to:
>>>=20
>>> if ( dom0less_modules_idx =3D=3D dom0less_modules_available )
>>>   blexit
>>>=20
>>> Would that work?
>>=20
>> I thought about it but I think they need to stay, because dom0less_modul=
es_available is the
>> upper bound for the additional dom0less modules (it is decremented each =
time a dom0 module
>> Is added), instead dom0less_modules_idx is the typical index for the arr=
ay of dom0less modules.
>=20
> [...]
>=20
>=20
>>>> +    /*
>>>> +     * Check if there is any space left for a domU module, the variab=
le
>>>> +     * dom0less_modules_available is updated each time we use read_fi=
le(...)
>>>> +     * successfully.
>>>> +     */
>>>> +    if ( !dom0less_modules_available )
>>>> +        blexit(L"No space left for domU modules");
>>>=20
>>> This is the check that could be based on dom0less_modules_idx
>>>=20
>>=20
>> The only way I see to have it based on dom0less_modules_idx will be to c=
ompare it
>> to the amount of modules still available, that is not constant because i=
t is dependent
>> on how many dom0 modules are loaded, so still two variables needed.
>> Don=E2=80=99t know if I=E2=80=99m missing something.
>=20
> I think I understand where the confusion comes from. I am appending a
> small patch to show what I had in mind. We are already accounting for
> Xen and the DTB when declaring MAX_DOM0LESS_MODULES (MAX_MODULES - 2).
> The other binaries are the Dom0 kernel and ramdisk, however, in my setup
> they don't trigger a call to handle_dom0less_module_node because they
> are compatible xen,linux-zimage and xen,linux-initrd.
>=20
> However, the Dom0 kernel and ramdisk can be also compatible
> multiboot,kernel and multiboot,ramdisk. If that is the case, then they
> would indeed trigger a call to handle_dom0less_module_node.
>=20
> I think that is not a good idea: a function called
> handle_dom0less_module_node should only be called for dom0less modules
> (domUs) and not dom0.
>=20
> But from the memory consumption point of view, it would be better
> actually to catch dom0 modules too as you intended. In that case we need =
to:
>=20
> - add a check for xen,linux-zimage and xen,linux-initrd in
>  handle_dom0less_module_node also
>=20
> - rename handle_dom0less_domain_node, handle_dom0less_module_node,
>  dom0less_file, dom0less_modules, dom0less_modules_idx to something
>  else more generic
>=20
>=20
> For instance they could be called:
>=20
> handle_domain_node
> handle_module_node
> module_file
> modules
> modules_idx
>=20
>=20
>=20
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index e2b007ece0..812d0bd607 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -22,8 +22,6 @@ typedef struct {
> #define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
> static struct file __initdata dom0less_file;
> static dom0less_module_name __initdata dom0less_modules[MAX_DOM0LESS_MODU=
LES];
> -static unsigned int __initdata dom0less_modules_available =3D
> -                               MAX_DOM0LESS_MODULES;
> static unsigned int __initdata dom0less_modules_idx;
>=20
> #define ERROR_DOM0LESS_FILE_NOT_FOUND (-1)
> @@ -592,14 +590,6 @@ static void __init efi_arch_handle_module(const stru=
ct file *file,
>          * stop here.
>          */
>         blexit(L"Unknown module type");
> -
> -    /*
> -     * dom0less_modules_available is decremented here because for each d=
om0
> -     * file added, there will be an additional bootmodule, so the number
> -     * of dom0less module files will be decremented because there is
> -     * a maximum amount of bootmodules that can be loaded.
> -     */
> -    dom0less_modules_available--;
> }
>=20
> /*
> @@ -643,7 +633,7 @@ static unsigned int __init allocate_dom0less_file(EFI=
_FILE_HANDLE dir_handle,
>      * dom0less_modules_available is updated each time we use read_file(.=
..)
>      * successfully.
>      */
> -    if ( !dom0less_modules_available )
> +    if ( dom0less_modules_idx =3D=3D MAX_DOM0LESS_MODULES )
>         blexit(L"No space left for domU modules");
>=20
>     module_name.s =3D (char*) name;

Hi Stefano,

Yes I understand what you mean, unfortunately it can=E2=80=99t be done, I w=
ill explain why in details
because the UEFI code is very tricky in the way it was written.

Dom0 modules and xsm-policy are handled in boot.c by read_section(=E2=80=A6=
) or read_file(=E2=80=A6) and
both call handle_file_info(=E2=80=A6) that inside calls efi_arch_handle_mod=
ule(=E2=80=A6).
Dom0less modules (xen,domain child modules) are handled in efi-boot.h by ha=
ndle_dom0less_module_node(=E2=80=A6)
that may call allocate_dom0less_file(=E2=80=A6) and (to reuse code) calls r=
ead_file(=E2=80=A6).

So there can be maximum (MAX_MODULES-2) boot modules because at start in st=
art_xen(=E2=80=A6)
we add Xen and the DTB as boot modules.

This amount is to be shared among dom0 modules (kernel, ramdisk), xsm-polic=
y and domU
modules (kernel, ramdisk, dtb).

The thing is that we don=E2=80=99t know how many dom0 modules will be speci=
fied and also for the xsm-policy.

In your code example, let=E2=80=99s say I have MAX_DOM0LESS_MODULES=3D(32-2=
) so 30 modules available,
If I declare a Dom0 kernel and 30 DomU kernels, it will pass the check, but=
 on boot I think it will ignore
the exceeding modules.

For that reason we need to keep track of how many =E2=80=9Cslots=E2=80=9D a=
re available, so in my code every time the
read_file(=E2=80=A6)/read_section(=E2=80=A6) is called, the dom0less_module=
s_available is decremented.

If we want to get rid of one variable, we can just assume the dom0 modules =
and xsm-policy will be always
loaded and we can set MAX_DOM0LESS_MODULES=3D(MAX_MODULES - 2 - 3) where 3 =
is dom0 kernel,
dom0 ramdisk and xsm-policy. If the user doesn=E2=80=99t load any of them, =
we just lost 3 slots.

Another solution can be keeping just the dom0less_modules_available and eve=
ry time loop backward in the array
starting from that position and stopping when we have a dom0less_module_nam=
e.name =3D=3D NULL so we
know we have an available slot or we reach below zero and we know there is =
no space. But I think it=E2=80=99s not
worthy.

So if you really want to have only one variable, I will remove space from M=
AX_DOM0LESS_MODULES and
I will push it in v3.

Cheers,
Luca









