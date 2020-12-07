Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F72D1777
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 18:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46871.83051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKFz-00005P-VS; Mon, 07 Dec 2020 17:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46871.83051; Mon, 07 Dec 2020 17:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKFz-00004v-SA; Mon, 07 Dec 2020 17:25:03 +0000
Received: by outflank-mailman (input) for mailman id 46871;
 Mon, 07 Dec 2020 17:25:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzin=FL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmKFy-0008WT-4f
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 17:25:02 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bf7c91a-a2b3-40f0-8326-87d9c4e89b4f;
 Mon, 07 Dec 2020 17:25:00 +0000 (UTC)
Received: from DB6PR0802CA0032.eurprd08.prod.outlook.com (2603:10a6:4:a3::18)
 by VI1PR08MB2782.eurprd08.prod.outlook.com (2603:10a6:802:1c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Mon, 7 Dec
 2020 17:24:58 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::6d) by DB6PR0802CA0032.outlook.office365.com
 (2603:10a6:4:a3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Mon, 7 Dec 2020 17:24:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 17:24:58 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Mon, 07 Dec 2020 17:24:58 +0000
Received: from 5f376cc0e6fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FD13C11-3B31-4C2E-87D8-D52004EAECE7.1; 
 Mon, 07 Dec 2020 17:24:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f376cc0e6fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Dec 2020 17:24:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5589.eurprd08.prod.outlook.com (2603:10a6:10:1a2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 17:24:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 17:24:18 +0000
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
X-Inumbo-ID: 5bf7c91a-a2b3-40f0-8326-87d9c4e89b4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlH+Sxi4vEnksM6T974PSKhfPj8eLEJTs61bgnI4m5U=;
 b=b6VWScZkLdA9c8gfA7c3HulsSNiqua2CdZyw2xL8b4dzUmlE+3HsjmrIrZTlmo/UUEPkF/wXnmk5sJiPROKHvzfUuACf/z4UT34qBPxFxgoItMjYpSsbud5k6z1yT2+c+2LR++UcUDZNbwqjGEsUEpH0jLCBvvIOCrwRYFnOifo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24997c4ae3059805
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIfwE7lnH4FQOsYwNdD9ekj0jbCZp379ZrvcBe9TMO1YKhGVIi7dHNRa2f6Rm00zZMqm07+lds5lDYpnEbO8wf4tWIGg7HnMGz9S4CNHUitdWIZDYUpMgrGAaEfx0RmTvn0rnlap0//j6gzTODZ8IjVtPF73rZwV7JzTlTcnQ5HchLn7YfBfcHocFa9rLrVgvihUG+RRHxabiwKSSU5SssxHYlLNYpBtpz50hqP+eZGBfJPiqMJC1aoGUr7UmJfq9rI8X5MsSNmim8RgJZmggtgEIB83Kx0TWJAO8qivJsXbxZBSqtJUbCe9EPDMElDMztqycgCB+CFyegR24xm4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlH+Sxi4vEnksM6T974PSKhfPj8eLEJTs61bgnI4m5U=;
 b=iXSTeiw2kZBllqvCSA9PxoR+IMljBQ0m/J/C2fvNbAze8wD0ERgUop0S3GSlzZxZWuTI9rju6t4bXPJy8gGh4oQmY9R5v6iDQHJ61Ms/aPtnpbKdAVNL67NgO3EjZ0aTDsB8+Kyq8jsPzcXdsne//UniB6rS0E5UOKt8u67qQCsSqJYvpUQGfu+wkKQAPZZfn+fuVgrpZ1z7OWkKrbmAhSm+jxxUwbuHRIbcanTttIotGxBgU0dS2yBG+/WaS0hDjQ62yyeUw2p4sR1AS20WKmDr3sKUokg2RvHUezwLGfR3XTAkVkpJwJjU92DhnSajZCbg6d5RrPGp4P7WGAZ0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlH+Sxi4vEnksM6T974PSKhfPj8eLEJTs61bgnI4m5U=;
 b=b6VWScZkLdA9c8gfA7c3HulsSNiqua2CdZyw2xL8b4dzUmlE+3HsjmrIrZTlmo/UUEPkF/wXnmk5sJiPROKHvzfUuACf/z4UT34qBPxFxgoItMjYpSsbud5k6z1yT2+c+2LR++UcUDZNbwqjGEsUEpH0jLCBvvIOCrwRYFnOifo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Topic: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Index: AQHWxyRpRLPV3+rSX0iDOmZYGXBVV6nnpDEAgARJGoA=
Date: Mon, 7 Dec 2020 17:24:18 +0000
Message-ID: <F1C7605B-2E88-4A9E-A556-C529AF06E9E6@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <539cc9c817a80e35a2532dba5bc01e9b2533ff56.1606742184.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012041531420.32240@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012041531420.32240@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 859d6174-7665-427b-4da4-08d89ad50559
x-ms-traffictypediagnostic: DBAPR08MB5589:|VI1PR08MB2782:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2782DC1555E38E0890E30AE69DCE0@VI1PR08MB2782.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r3tPtTfKodZCCXxp4tb6+WFh3E2td9v2ijD1aRIYmhBBBkvwU0GMUgVD9HaDEzzo2z3ZNI4jBsGtUfEICYDco2hanA26oHIenQlwUfBWWzAYtz53uRtqfPvgNwIaZrZ890VKVwNGHynJcqJazdqE5pr1irWVxRXqbuIWyh2/TgxO67qbWUVtChsKIselSWcKfirdB97LkTLntkKdtbXfEcqxDlXmqjeQ452d0vcFiUW1ne/QikIJ+PWYrluF6Cjpfro2CuDfmZX8D2fUHwDJBTrUuCnEC7MZZwG0lIVa8NHgf0d+RS7fdZjMPYMAtVGqDJz16IMwDSydTrp9zi4tpXOKzW84z6CaMufFsOXse25WEzrouIbic/X0jwl9Hx5g
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(86362001)(478600001)(186003)(64756008)(5660300002)(66556008)(2616005)(6486002)(53546011)(2906002)(8676002)(6916009)(6506007)(4326008)(54906003)(316002)(66946007)(33656002)(66446008)(91956017)(8936002)(66476007)(6512007)(76116006)(36756003)(83380400001)(26005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?YxcaKSYh2v98mKCl/9oRE8HRQzmX+tdj8PD2IUh8oPGfaE1Xf4dHzUKjw0M8?=
 =?us-ascii?Q?rlIwYdGx2JDxkd8asKLBrUc2Hu+f0fY24RP7+QuvLyLTDRYIhNA4+ja9DewL?=
 =?us-ascii?Q?XGDITahPi0zuArG9v4z0oMtGP9KB+rw5qnVx8A5q/12oUOGJsmhle6XCuIwo?=
 =?us-ascii?Q?RbGnDglKoM3d8BCnBl584QTcM67DpORB/iR0S+u8ZTiWqG3IN30asaUNqAtq?=
 =?us-ascii?Q?I23UHkTv5Z95BgAi22GnXMfHvYXOPbP6YTeqXAMA5jvcH3veEZkKh+5a8vyr?=
 =?us-ascii?Q?Ls4/E/V6URyYeDIMGGiTQpbq7oux0vPyghE4rBKxdxz6GYhjVM8Pl375tcBb?=
 =?us-ascii?Q?Szd/PhExyA7anIqReI+sk0yw+ddunXeB3R3cDpZ7aWOtEBbIXakOSAFRc3hL?=
 =?us-ascii?Q?8xxMboiwK90n83tQZAhhUKle409wqvtpCR8xmQ8+l6PLi5KeEDcp2p38ndtJ?=
 =?us-ascii?Q?JUi2foycAynxvlYpQRuBzb0tkjNGfgs5ex0QAVeV285p9IP7rJkn/angF5uX?=
 =?us-ascii?Q?69Fu3OSaeEXxuIgBAbhbW4d3n716VFIN0yUkHf+Akbhxi0WUDsasLTyT/Pbd?=
 =?us-ascii?Q?FPSus5+nc355W9LZXGRow1WNz3owGOHPo43EUwXCCACqXQL9+XLg7gkVj7v+?=
 =?us-ascii?Q?fNynGnlowO2M+pWc6qWrMh0OAe+SDR/wAl/9fQrBTN9Dx5bUMwvEWSYPrMH0?=
 =?us-ascii?Q?ZaxayTi3yu+vqRLsy09cCc6tuWmF+8HKYIKWYeD8VITDnpmot+DUxFPf99Lg?=
 =?us-ascii?Q?ds6GoS5V/XfXN5WRoQaocH2QTcnVvkCaH9XONVor4e4tu9rWGt/k5D4bfX5T?=
 =?us-ascii?Q?1D4H+Vw0+gWwuVtQdCpmqoSG5kJqZLHfruGjzoHLoMHWZgC/SJmg8NKL6je5?=
 =?us-ascii?Q?0Zk7mywmzA2vQJTvw72dxgXxknpUq9/Tv04T6Z0RzFSCPtfpQ+1eR3KteWz1?=
 =?us-ascii?Q?PbCpTEnY7fZKqMScqKpQQCjHbhjkgOU0lD9S8cQcGO82oVG26Qst1zVZG2F4?=
 =?us-ascii?Q?Th1Q?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9BD0F064CC8593479E5244EFDC0E8239@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5589
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6316a74-19cc-49b8-147d-08d89ad4edde
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HfsRyN/5m2USLiQ87BQaMHMi5obps14etQZ/C19W/cemcPnNykmmAMOfd14z/p8Q/aUEvkYI/LUmEtUQ8aZWVelm08Z1N5p6MdJ19X/QGqcEmbH31eSl20oZgQX3hZ4sRS4CSpGLrrRPBzfC++F4zB2CjgE6NFKmYbE25DDdfBAtksoc3re+uugAc/AvKTwYnaaPhecvrJVkdNdF7jM0GLHn2AHAyxkZ8OqYeAUMVD7bUF9ylT+Reg3ischB2CgMHsjwTtlF4S5VIH2E6LHeBF/ZgDirYvbEvx7fP6akf8L6yjaGouLoC+LukPgGlitowo5RdJHvj2iX+9rpOkf90MkzNFZO2iF/Ph6CLirUWihfS/AInz6rjHauEsOix5fvZBUkH3CuyeKAOOx/CIpL6Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(70586007)(82740400003)(70206006)(6512007)(4326008)(316002)(83380400001)(8676002)(478600001)(5660300002)(356005)(82310400003)(2906002)(81166007)(8936002)(6486002)(26005)(33656002)(107886003)(36756003)(6506007)(6862004)(86362001)(2616005)(47076004)(54906003)(53546011)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 17:24:58.1300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 859d6174-7665-427b-4da4-08d89ad50559
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2782

Hi Stefano,

> On 4 Dec 2020, at 23:57, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Mon, 30 Nov 2020, Bertrand Marquis wrote:
>> Create a cpuinfo structure for guest and mask into it the features that
>> we do not support in Xen or that we do not want to publish to guests.
>>=20
>> Modify some values in the cpuinfo structure for guests to mask some
>> features which we do not want to allow to guests (like AMU) or we do not
>> support (like SVE).
>=20
> The first two sentences seem to say the same thing in two different
> ways.
>=20
>=20
>> The code is trying to group together registers modifications for the
>> same feature to be able in the long term to easily enable/disable a
>> feature depending on user parameters or add other registers modification
>> in the same place (like enabling/disabling HCR bits).
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: rebase
>> ---
>> xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
>> xen/include/asm-arm/cpufeature.h |  2 ++
>> 2 files changed, 53 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 204be9b084..309941ff37 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -24,6 +24,8 @@
>>=20
>> DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>>=20
>> +struct cpuinfo_arm __read_mostly guest_cpuinfo;
>> +
>> void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
>>                              const char *info)
>> {
>> @@ -156,6 +158,55 @@ void identify_cpu(struct cpuinfo_arm *c)
>> #endif
>> }
>>=20
>> +/*
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
>> +    identify_cpu(&guest_cpuinfo);
>=20
> Given that we already have boot_cpu_data and current_cpu_data, which
> should be already initialized at this point, we could simply:
>=20
>  guest_cpuinfo =3D current_cpu_data;
>=20
> or
>=20
>  guest_cpuinfo =3D boot_cpu_data;
>=20
> ?

Ack, I will do that.

Cheers
Bertrand

>=20
>=20
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
>> +
>> +    return 0;
>> +}
>> +/*
>> + * This function needs to be run after all smp are started to have
>> + * cpuinfo structures for all cores.
>> + */
>> +__initcall(create_guest_cpuinfo);
>> +
>> /*
>>  * Local variables:
>>  * mode: C
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index 64354c3f19..0ab6dd42a0 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -290,6 +290,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
>> extern struct cpuinfo_arm cpu_data[];
>> #define current_cpu_data cpu_data[smp_processor_id()]
>>=20
>> +extern struct cpuinfo_arm guest_cpuinfo;
>> +
>> #endif /* __ASSEMBLY__ */
>>=20
>> #endif
>> --=20
>> 2.17.1


