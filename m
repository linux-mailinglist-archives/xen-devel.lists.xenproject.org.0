Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA292D605E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49476.87503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOBy-0005Ub-GF; Thu, 10 Dec 2020 15:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49476.87503; Thu, 10 Dec 2020 15:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOBy-0005UC-Cq; Thu, 10 Dec 2020 15:49:18 +0000
Received: by outflank-mailman (input) for mailman id 49476;
 Thu, 10 Dec 2020 15:49:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knOBw-0005U7-5O
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:49:16 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99308355-f3ee-4317-b8b1-eee1979d98aa;
 Thu, 10 Dec 2020 15:49:14 +0000 (UTC)
Received: from AS8PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:20b:312::21)
 by HE1PR0801MB1835.eurprd08.prod.outlook.com (2603:10a6:3:7c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:49:11 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::f1) by AS8PR04CA0046.outlook.office365.com
 (2603:10a6:20b:312::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:49:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:49:11 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Thu, 10 Dec 2020 15:49:11 +0000
Received: from e57a4a290c5b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AE2236A6-0EBD-45A9-9199-0DE3A5ABEB6A.1; 
 Thu, 10 Dec 2020 15:48:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e57a4a290c5b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:48:55 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2567.eurprd08.prod.outlook.com (2603:10a6:4:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:48:53 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:48:53 +0000
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
X-Inumbo-ID: 99308355-f3ee-4317-b8b1-eee1979d98aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtWqv1julNLuzMbcf9ge/fy7J8uVhFzcvlP2ga7XGZM=;
 b=xg2NpWUAAb9UtdRvBp58IHeiRC1+LuXS8bttBgFl6Lou+le66thSAla7cCy9BfsQViNm2IJIvMsmZZD94COAbsLD1EZfL5yngOigVV4LU92tQoE8i6cO9lLfVeAQaWIeJAPTvyPtYERfl87b7G7WLxj6t3bAlUQXHt50GURCtEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d34676d6381171c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxGzgy67q2xfrBSIR2B0QIRvpl0hUhnYmKBEiVNcMflnh1qxWjjtVRfCS8bnPbVG09SkdWNUTUR6vcG5Omb/zhXXDNaIfs/NQY1Ipt5iQ+0YeTHwS3GMfrLqzf2zAwgbD2G4yJAwOBm4p6NLpDoY8zw61fzNEwcVoZx1tuqpAE3uCi/slbaQMdnqkJwlG8pVpiW9R0jGRwhf5naZjE+otc2CBwAtMIoaC2GX+7o7os86pkIJiyiCE2gfJG/2/cKfX1xGyRjQsyLzIiUGOgC6G0BgszXxvhKbu7oFp4oqvVghYU8b2Mdt+KE2k3+H+X0MwJo5LXnH0sBNNPU6CMp2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtWqv1julNLuzMbcf9ge/fy7J8uVhFzcvlP2ga7XGZM=;
 b=XTCE0c8DSz85PFHliobQsVm6GfPh61Gyzdr/LNI3KGP56ndy/jfCoQ4OfxBkj9oiPcfILj7hXYsMp0XpfJc7HZxdWguY/IjvAlxNQ1v0Ck343NMq29oPX5yRBMSJ/58apzHJqOXhuB7VIqqXgl14ysSwDJasAXx62O94+uYAxEemZ0TjsKhdkY7t9g+Fn5ZlQsotT6gvaKuCcu7RolZXIzSLTsFztKIHJpqL68G/zPTO2dYTphrECQi46kUR+Jgpv5R/9FdjHwv5JmE0swXKbYAMd4di2UDmwwIEN2JcV5qo5I9gzA6PF+o2mIg3EI3A6SqQ5YhO51PS/KO03tsKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtWqv1julNLuzMbcf9ge/fy7J8uVhFzcvlP2ga7XGZM=;
 b=xg2NpWUAAb9UtdRvBp58IHeiRC1+LuXS8bttBgFl6Lou+le66thSAla7cCy9BfsQViNm2IJIvMsmZZD94COAbsLD1EZfL5yngOigVV4LU92tQoE8i6cO9lLfVeAQaWIeJAPTvyPtYERfl87b7G7WLxj6t3bAlUQXHt50GURCtEU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Topic: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Index: AQHWzklW+4XymezDRUeCGhvhzW8UY6nvZCkAgAEXL4A=
Date: Thu, 10 Dec 2020 15:48:53 +0000
Message-ID: <BD35BA39-FE40-4752-9B21-CCD0F0D963B0@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
 <61b2677c-bc0d-af0b-95f8-f8de76a20856@xen.org>
In-Reply-To: <61b2677c-bc0d-af0b-95f8-f8de76a20856@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b28c497-b83d-40eb-2959-08d89d232355
x-ms-traffictypediagnostic: DB6PR0802MB2567:|HE1PR0801MB1835:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB18359B60EDFE5BCBB03D35C19DCB0@HE1PR0801MB1835.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1DqUVYWh/VknFDPVeW/Onuajt7CLBdOFG0Gtm55xFJrhYy3O6ogIo+353COmSIN9Sf0SuX6aiRrKPDbMhD6YdwE6QWbbd+hpoXj5sd//cEBW4BZIuO3J3p+5RJtThhUgs8uyzBhYy4IMnX78LA/YxSO/oRiEc3Bm28x6+YZsRiDlCLILODR+Gck9MEhbOqnWA8slq1AnuoCnCkusQu4pIlAexz7wwhR9UpYb+LZ2RoHgF9gEEFsA2N/PqV9eiq2qCirx818FMEr84xrhyj1EAF6WhclI0w+T5JqFYFXjQmqtihRh2kiPuD6K7Epk2oOouq0r2hpOdseP2yW3oClDOFFM5Pr85M1B9xnXmwvaWA6CGfGkNKRfaGLkBGMLrI3+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(86362001)(2906002)(478600001)(316002)(2616005)(4326008)(66946007)(91956017)(8936002)(26005)(36756003)(6512007)(54906003)(186003)(33656002)(53546011)(76116006)(71200400001)(8676002)(6506007)(5660300002)(66556008)(83380400001)(66476007)(6916009)(6486002)(66446008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?RNMZeYtpwelSNEoIpHWwpth1ZeSItJ/9WCnCV3tIDM/5PK+sgs9uhqayYWh0?=
 =?us-ascii?Q?bzb58mzytrNRvM/jpmkoiE8LrrD91tuqtFaVONiOknAExO4grdT510PmiWwP?=
 =?us-ascii?Q?/9SohGIZ6L1Z64iCtUB5GIMJ58dzw0+2pTckrwZLY3gLZpIJ69S566WhGBZi?=
 =?us-ascii?Q?sYDr7mx3pnOykuM7v2+Rj0PgIJB1wy421mLwCX28+igIFlPovjulmoj8UY8/?=
 =?us-ascii?Q?8pPto1pO7c2JlLZR6zNq8SAPrVXzXqtPBFJs7Ox9/aZnAY2QiCGM1EITeNhI?=
 =?us-ascii?Q?lP0/uue2x9TlSx/vntLQ4RQT/H+ABJ6CWOr4uaBBq1uYGaWJgOEx0uIkgPxo?=
 =?us-ascii?Q?f2nnqZUSOCNJcHQaYkseTs7JHl2V7uzanyV9o8gkBAiqgbJvVRzX86lc67I1?=
 =?us-ascii?Q?N2+QfAq8LEVs6IX79Yn7o1vellAr9i1DmrCY7QUfS5hrAPK07ceveoCz1Rcj?=
 =?us-ascii?Q?FhhiCktOKsmIGk1z8Eh2z7UIEIC5HDLNdGdvwe4+QgumI+o1N5ZmZWw5drRj?=
 =?us-ascii?Q?tjHtSkPtQdKjYwYoaU67MGXhZRQAMIAE5Egb2cYII08FgDYQd0/adFSqHwGz?=
 =?us-ascii?Q?FxvQiJP9/owqoS+2Wfl8YaRh7OveXOkEMpH3ZMoG1D6MkteOPqo8hKKgPwP+?=
 =?us-ascii?Q?FP0mN4DCyLLL1mtD7/4ab9YtABWNHrSXnnm9yx9RIK1eZvn1UWfj15UuMgz2?=
 =?us-ascii?Q?GcOlGlQmliI+gMSWoCKBoxST9LVlJPkkSogQVME5uCDanZYr0kXBcGfamdN2?=
 =?us-ascii?Q?FqQREknJgMJBv3A9rEpaqViIMc19wiP0DM1LeDIDyYgUZatogCVvj2709nty?=
 =?us-ascii?Q?Dn79Ry4AZ5cG+nb26qXbSkh/lWfk0B+Du8QilFCd6f9T1lCiQxuGTu9gQCtB?=
 =?us-ascii?Q?MRQDjwQMo5Z5sSvP7z+Ydquide13chXaHNzdUZkrDZIBFu5aIfkcLKkW7MQD?=
 =?us-ascii?Q?0K/2ypYaXuDObfuSkEpWSBQV8ko92r+9xJ1swudVZudoOgJFchZlQ61+dCAY?=
 =?us-ascii?Q?hsIg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C6F4132AF99C03478C4BBC2EF1B926CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2567
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c41f84d1-85b8-4fe0-6ffb-08d89d2318ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EItJsAZEV8Y7Mfammz7/NEBSl/bIxaAdpGB//j8lcavoKE510ZMMJqEzFiDh1bmxfskYveFh/neyIHxX+P6dFEPUlW4jFHZGrjn9WNKah/vN5SBJUV5cL2lfJP8wutVqal5m+Uc3h91UM/9o6KvsVg2q4f2BJGSrNaWbpnREEOG56/ydM292Piv++1xCExUgCL9WLB9RqEkxzkap3qigW5Az2M3vpACK7OG+8gJbitQcnM5ARLCWK1Mzz+RfNsxTSTfGrNbFkFg4SlKFk5XvjiJsvg3zMAbnmZsb5Sf+wxLCxH31P+BrQnTHUPdnteXTVRC1gTUhu48HxNp9LO3cbrFIOTSe2xsp1sfNXYtGgGrl0VGa+9ZZlnM2/ChhrJGGrjqHn0HMc3HHpcmoe4+gog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966005)(8676002)(70586007)(82310400003)(8936002)(86362001)(356005)(83380400001)(2616005)(81166007)(33656002)(82740400003)(6486002)(36756003)(26005)(36906005)(53546011)(47076004)(336012)(4326008)(6506007)(316002)(5660300002)(107886003)(6862004)(186003)(478600001)(70206006)(6512007)(2906002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:49:11.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b28c497-b83d-40eb-2959-08d89d232355
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1835

Hi Julien,

> On 9 Dec 2020, at 23:09, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertand,
>=20
> On 09/12/2020 16:30, Bertrand Marquis wrote:
>> Create a cpuinfo structure for guest and mask into it the features that
>> we do not support in Xen or that we do not want to publish to guests.
>> Modify some values in the cpuinfo structure for guests to mask some
>> features which we do not want to allow to guests (like AMU) or we do not
>> support (like SVE).
>> The code is trying to group together registers modifications for the
>> same feature to be able in the long term to easily enable/disable a
>> feature depending on user parameters or add other registers modification
>> in the same place (like enabling/disabling HCR bits).
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: Rebase
>> Changes in V3:
>>   Use current_cpu_data info instead of recalling identify_cpu
>> ---
>>  xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
>>  xen/include/asm-arm/cpufeature.h |  2 ++
>>  2 files changed, 53 insertions(+)
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index bc7ee5ac95..7255383504 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -24,6 +24,8 @@
>>    DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>>  +struct cpuinfo_arm __read_mostly guest_cpuinfo;
>> +
>>  void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
>>                               const char *info)
>>  {
>> @@ -157,6 +159,55 @@ void identify_cpu(struct cpuinfo_arm *c)
>>  #endif
>>  }
>>  +/*
>> + * This function is creating a cpuinfo structure with values modified t=
o mask
>> + * all cpu features that should not be published to guest.
>> + * The created structure is then used to provide ID registers values to=
 guests.
>> + */
>> +static int __init create_guest_cpuinfo(void)
>> +{
>> +    /*
>> +     * TODO: The code is currently using only the features detected on =
the boot
>> +     * core. In the long term we should try to compute values containin=
g only
>> +     * features supported by all cores.
>> +     */
>> +    guest_cpuinfo =3D current_cpu_data;
>=20
> It would be more logical to use boot_cpu_data as this would be easier to =
match with your comment.

Agree, I will fix that in V4.

>=20
>> +
>> +#ifdef CONFIG_ARM_64
>> +    /* Disable MPAM as xen does not support it */
>> +    guest_cpuinfo.pfr64.mpam =3D 0;
>> +    guest_cpuinfo.pfr64.mpam_frac =3D 0;
>> +
>> +    /* Disable SVE as Xen does not support it */
>> +    guest_cpuinfo.pfr64.sve =3D 0;
>> +    guest_cpuinfo.zfr64.bits[0] =3D 0;
>> +
>> +    /* Disable MTE as Xen does not support it */
>> +    guest_cpuinfo.pfr64.mte =3D 0;
>> +#endif
>> +
>> +    /* Disable AMU */
>> +#ifdef CONFIG_ARM_64
>> +    guest_cpuinfo.pfr64.amu =3D 0;
>> +#endif
>> +    guest_cpuinfo.pfr32.amu =3D 0;
>> +
>> +    /* Disable RAS as Xen does not support it */
>> +#ifdef CONFIG_ARM_64
>> +    guest_cpuinfo.pfr64.ras =3D 0;
>> +    guest_cpuinfo.pfr64.ras_frac =3D 0;
>> +#endif
>> +    guest_cpuinfo.pfr32.ras =3D 0;
>> +    guest_cpuinfo.pfr32.ras_frac =3D 0;
>=20
> How about all the fields that are currently marked as RES0/RES1? Shouldn'=
t we make sure they will stay like that even if newer architecture use them=
?

Definitely we can do more then this here (including allowing to enable some=
 things for dom0 or for test reasons).
This is a first try to solve current issues with MPAM and SVE and I plan to=
 continue to enhance this in the future
to enable more customisation here.
I do think we could do a bit more here to have some features controlled by =
the user but this will need a bit of
discussion to agree on a strategy.

Could we agree to keep the current scope for this serie (to have this in ne=
xt release) and work then on future
enhancements like this ?

Cheers
Bertrand

>=20
>> +
>> +    return 0;
>> +}
>> +/*
>> + * This function needs to be run after all smp are started to have
>> + * cpuinfo structures for all cores.
>> + */
>> +__initcall(create_guest_cpuinfo);
>> +
>>  /*
>>   * Local variables:
>>   * mode: C
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index 6cf83d775b..10b62bd324 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -283,6 +283,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
>>  extern struct cpuinfo_arm cpu_data[];
>>  #define current_cpu_data cpu_data[smp_processor_id()]
>>  +extern struct cpuinfo_arm guest_cpuinfo;
>> +
>>  #endif /* __ASSEMBLY__ */
>>    #endif
>=20
> --=20
> Julien Grall


