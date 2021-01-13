Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006A2F4612
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 09:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66365.117824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzbMJ-0005Pk-Az; Wed, 13 Jan 2021 08:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66365.117824; Wed, 13 Jan 2021 08:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzbMJ-0005PL-7v; Wed, 13 Jan 2021 08:18:27 +0000
Received: by outflank-mailman (input) for mailman id 66365;
 Wed, 13 Jan 2021 08:18:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45be=GQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzbMH-0005PG-Uh
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 08:18:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ab19fd5-6bd7-4cc3-aa49-3ad66ece2222;
 Wed, 13 Jan 2021 08:18:24 +0000 (UTC)
Received: from AM0PR05CA0080.eurprd05.prod.outlook.com (2603:10a6:208:136::20)
 by AM8PR08MB6449.eurprd08.prod.outlook.com (2603:10a6:20b:364::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 08:18:22 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:136:cafe::96) by AM0PR05CA0080.outlook.office365.com
 (2603:10a6:208:136::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Wed, 13 Jan 2021 08:18:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Wed, 13 Jan 2021 08:18:22 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71");
 Wed, 13 Jan 2021 08:18:22 +0000
Received: from f6c8a44ad0c9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6E85BF0-73CE-4E33-91ED-06235699EC97.1; 
 Wed, 13 Jan 2021 08:18:16 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6c8a44ad0c9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jan 2021 08:18:16 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0802MB2335.eurprd08.prod.outlook.com (2603:10a6:800:a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Wed, 13 Jan
 2021 08:18:14 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3763.010; Wed, 13 Jan 2021
 08:18:14 +0000
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
X-Inumbo-ID: 4ab19fd5-6bd7-4cc3-aa49-3ad66ece2222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdI9gmRr/Dm7FgdBfGdsy0yR5J3qamVE6WC24IIzGvU=;
 b=3Ajyt5E6hogA5oiER10oFBSaKFfHevbCN2bgOkOv6HVBXuYVph/qCpe8mp9YOXf3FTmSdPNx+fZY46VDmftTumsdgEfB2SjMS3bcB9VRBDbBmrLYeQD2XTWvEWKl6gHJPdgvoAdCZYefHBU1epGPB74Arv5ovhSQTEkbdpMvknI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b83eaf2b4389c97
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hl5ZdAVGYIZbQsAZGoZM4ZV/Ph0MzxmFy4Ocqo5fx8pgbWky8UpIMRACzNfKpohR6XJD9mnBBjLJCWyamI5e3uu08k/NGZiVT47tUWSNZDFjbIr6tFsZYslBfAP7K15rHgee6CxrNFrA/8AuQ7G4Wls6FhMo8qm5eq9MWy2efKqNZEaWTGFTQSiHj6SpFF1iCKwPB5/2DcVQzaXJ0l0NDxaaV5ximkQG/4/6BIdtk9+SVa9WQev6mM6q4Drks9RQ9hya5FxA8CgrnWA9GBy9CxwaJKnMNNaSACAD0ClUUD7ueKU68/gpM6q5HSwFiYsfsIRFva76QuG26pQWmqBtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdI9gmRr/Dm7FgdBfGdsy0yR5J3qamVE6WC24IIzGvU=;
 b=B7XlrV2bvdyg9Gh833ts69aZgTcKrY4/ANpJTCT6fl9WRmTGOqVA1N5e0HelGzHux2bj6syZruaEO/f7HnGsgcSzG3qCLf2wMIETvt1SPHNf184uMVXvq2qT08RnYilFG0xbOvoO7YQj+cApedYei+nMnIrB6Yc3VGDTI410eKVquN7CNY408BHrVx+lYJ+VivTCuOjw8bgHYW3yWimnG9e8uhx1oq8meRYULRFFnynhYM7rsqTVcG+S4oxLnITDGgNqIissJVf0bwBJHKVZeMVQHIu9EpElq53zwg59XNru9ypNVVDTDl+oV09mWHuH9mEtmC5pCedTG5akJ3qLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdI9gmRr/Dm7FgdBfGdsy0yR5J3qamVE6WC24IIzGvU=;
 b=3Ajyt5E6hogA5oiER10oFBSaKFfHevbCN2bgOkOv6HVBXuYVph/qCpe8mp9YOXf3FTmSdPNx+fZY46VDmftTumsdgEfB2SjMS3bcB9VRBDbBmrLYeQD2XTWvEWKl6gHJPdgvoAdCZYefHBU1epGPB74Arv5ovhSQTEkbdpMvknI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "julien@xen.org" <julien@xen.org>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Topic: [PATCH v2] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Index: AQHW6T0cVyzUUW/j3ECSp244SRxuaKolNsuA
Date: Wed, 13 Jan 2021 08:18:14 +0000
Message-ID: <494C2E9B-D6C3-4D57-8F33-220A2D4DA87B@arm.com>
References: <20210112234450.31584-1-sstabellini@kernel.org>
In-Reply-To: <20210112234450.31584-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c31fd4a-b244-4f5e-0819-08d8b79bcace
x-ms-traffictypediagnostic: VI1PR0802MB2335:|AM8PR08MB6449:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB644900C0AA0484DE26EEF0999DA90@AM8PR08MB6449.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kNjfGboLo7ZvcvhpHBTPKR9vubnuQBP/0lF9sK0UnVlzuqN3cDMCeDI4HTRDsoORQpHY5KMxmIsKASroNHDRzAERGAeTTVxyv2jlJLeZ7yjKcT58TDQ7ANGWsauDszDs54UjQW8ICcyig2qICz/9VAX34ux9TjqjWPWPs+nbEuVA22jEgNdNfdhdaaMaKbk46YzCAaOdXXy1YrXICljM4ntl8Fu9xLuIFyVo6ONVIVWsX8X8GtA18y0B6CAjAIRlhhAx9Q5xg7G2ibEgA+06jum6ee1SqnpsnC5AvDFJx6oas8VDS1H4rV3cbWZIzyoxFOqMyW+l9l8zQC3f0T2Wfev/LqOwlzhGieDfprHrOileSQQOQK6DTNIq1oloXheBey/+2mV3nwEb5AKT7eU8qevW3AYXRILMEe1woVsABnf5MJmXnS8DW+KzyxmYxAY15CbOTSrVlLF5U57qPtt+xMelVYnQDynwEVig+aO9awOai3jhhAVptdu+fm1DQNH8bzi88kGD/X1dpNjoa49ICw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(6916009)(66476007)(66556008)(8936002)(86362001)(64756008)(76116006)(5660300002)(83380400001)(4326008)(316002)(33656002)(55236004)(66946007)(6512007)(54906003)(8676002)(71200400001)(2616005)(966005)(478600001)(91956017)(26005)(6506007)(186003)(6486002)(53546011)(2906002)(66446008)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?mhYCWeN0+L8M7R8gdiih5vwDTLYEdMOETS66uqjan1tavAarsjaLpUq0thn8?=
 =?us-ascii?Q?kg6XBrn+SM35YcHhBv2qiF0i+FbR5smtoOEp+p5kKozM4wxImO94HTQ0NJZf?=
 =?us-ascii?Q?NFuIdJ1syl5yL6EILHxvrVNHixNi8SW3Tk5PhBeAQiAFhKW3AtGBJDtYjCPD?=
 =?us-ascii?Q?Wn+4W+6kB4MqLRcuus86+pPeyJ923cSAFAw2P/+QN1mqjKDk/Vi/px0G4aOX?=
 =?us-ascii?Q?tot48lenkEkYMf/tIqgdszD3icKbe6CJd3d4G766/Sf0p3RoVT9qeTbSprMR?=
 =?us-ascii?Q?VlQ689ZFKX/iwAJRRAEWDF4bFzjRcFny3dyb7U67PHhOprqHmq7kQdQHM6Yk?=
 =?us-ascii?Q?FJZ7f3a3Axx0mJ8zggVqnqwddXjrcZFL9JMaVTJXZN+HhNveCHXrWgX1MjmW?=
 =?us-ascii?Q?upske1c1w9rCGE53Bq9mHgdMEebmZhGhAnTW3+RUTqSLiza3cUnEySecWPR7?=
 =?us-ascii?Q?jMwFDVu71l49xP1FIPTn5L10xrIsrRZdkOCp6xneRhqpKteOfkh2IcdRjq4K?=
 =?us-ascii?Q?jA8ceyeQClSMOA96o7v/paU6DZ9pxo4zEiatRc771AYi/IylkRyb/RZZUmxp?=
 =?us-ascii?Q?iHm1FX55YT5+CIArgs2SJ3TWsz/zz8ZfMXsGWNiuSLEWLvHNkeetfaBpciSO?=
 =?us-ascii?Q?9Hf4HJMd2rIoxpUdOqX/eCy0zIPot5UIt/VWs2Vw4WgqGkNx8ybNWPxyjkTy?=
 =?us-ascii?Q?gNqwa5wjBEAQfSFtPiH6sFPe5BJ3Jw1OxmVartzNPAmKMuQiyLmeVhzCNfD7?=
 =?us-ascii?Q?YBedkgawwwfVlJD0jhgoAZnM5OQ3cz0nt8oYR/EnbCeab/Qm5D433liYhVa3?=
 =?us-ascii?Q?NHcdGF8Rl4TsprPRDoG72oeD6QVqQh2dq4IbSKJkNuuGBmUl1IfDliLSYHd6?=
 =?us-ascii?Q?o8enRV5oxvGxYJJytBgL0W9liGdDRmZc+a/RDR4iau8u6lxg+YwqRhxMl+pa?=
 =?us-ascii?Q?e17CCH9MM34QoxVDAyCeR2eIeQa0Dw0wGXb3uJbI9a3Pfcnr9BpW0kOZ6hqh?=
 =?us-ascii?Q?jwt2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4B58CF7722C505408FD298CFE8BCA424@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2335
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d50270ca-598a-4895-2594-08d8b79bc60e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qL5tN4HmF6F+lDpiIyhzzXCcCZjZoNOxfjfYxUMSt5GSw6LDxE0edDkHfOGihWOYjVcmMedDhOPhvUa1sX/21vE5bvaGVs5MkPJRt9mQjEZm0jxIb6Sj/JZfI2cGkfxEJZSXuYtC3VWC9SDvRZx77NsMBr52YBkYlnr9S04fFqJQEu6l5Sd9XAcKs4SFz8vUKXD8+197MosbCdqIfdGENI3aKS/ICo4HY0zF96aLoEFEhpK3To6cLizp7Q1C2GskH8YjXgB/AUFn/uWklxzwFWkVUgr5tzUimhoxttnU+LFq9+LZQ2K4y+sJ1uqAe42UV6aceGME0X2Lf/eSPRWEwxL7RljPr+Njig++vejgKDUgJC5g1uOw3MtwhtGjEhCNzWEYJLYJ+VurJpKkh0BFm00XU2XqIieriYADfpXzT5AyPkCT7m8sFqtWifZlvaxcjO4y6gaIjuw2rdNGVYvpzL5JwdUro+9zPctlpr0wKlpqx0wFSAidHs1t42gZDDTL6JvTdXD1BERGZdIZpdgQv5+bkOnt7CobD94sj03kBAPsmQEePjZlwLWVaTaqBzOA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39830400003)(376002)(346002)(396003)(136003)(46966006)(36756003)(8676002)(6512007)(82310400003)(34020700004)(26005)(6486002)(186003)(336012)(2906002)(53546011)(5660300002)(55236004)(6506007)(478600001)(86362001)(2616005)(966005)(6862004)(33656002)(54906003)(4326008)(70586007)(70206006)(107886003)(316002)(356005)(8936002)(47076005)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 08:18:22.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c31fd4a-b244-4f5e-0819-08d8b79bcace
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6449

Hi Stefano,

> On 12 Jan 2021, at 23:44, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Don't read aarch32 system registers at boot time when the aarch32 state
> is not available at EL0. They are UNKNOWN, so it is not useful to read
> them.  Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen
> crash.  Instead, only read them when aarch32 is available.

Might be a good idea to say that on Cavium ID_PFR2_EL1 is generating an
unsupported exception causing a Xen crash on boot.

>=20
> Leave the corresponding fields in struct cpuinfo_arm so that they
> are read-as-zero from a guest.
>=20
> Since we are editing identify_cpu, also fix the indentation: 4 spaces
> instead of 8.
>=20
> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> Link: https://lore.kernel.org/xen-devel/f90e40ee-b042-6cc5-a08d-aef41a279=
527@suse.com/
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
with this added:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - check el0 instead of el1 for aarch32 support
> - clarify EL0 in commit message
> - remove temporary link in commit message
> - use lore.kernel.org in commit message
> - introduce cpu_feature64_has_el0_32
> - rename aarch32 to aarch32_el0
> ---
> xen/arch/arm/cpufeature.c        | 35 +++++++++++++++++++-------------
> xen/include/asm-arm/cpufeature.h |  2 ++
> 2 files changed, 23 insertions(+), 14 deletions(-)
>=20
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 698bfa0201..99fe4db280 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_ca=
pabilities *caps)
>=20
> void identify_cpu(struct cpuinfo_arm *c)
> {
> -        c->midr.bits =3D READ_SYSREG(MIDR_EL1);
> -        c->mpidr.bits =3D READ_SYSREG(MPIDR_EL1);
> +    bool aarch32_el0 =3D true;
> +
> +    c->midr.bits =3D READ_SYSREG(MIDR_EL1);
> +    c->mpidr.bits =3D READ_SYSREG(MPIDR_EL1);
>=20
> #ifdef CONFIG_ARM_64
> -        c->pfr64.bits[0] =3D READ_SYSREG(ID_AA64PFR0_EL1);
> -        c->pfr64.bits[1] =3D READ_SYSREG(ID_AA64PFR1_EL1);
> +    c->pfr64.bits[0] =3D READ_SYSREG(ID_AA64PFR0_EL1);
> +    c->pfr64.bits[1] =3D READ_SYSREG(ID_AA64PFR1_EL1);
> +
> +    c->dbg64.bits[0] =3D READ_SYSREG(ID_AA64DFR0_EL1);
> +    c->dbg64.bits[1] =3D READ_SYSREG(ID_AA64DFR1_EL1);
>=20
> -        c->dbg64.bits[0] =3D READ_SYSREG(ID_AA64DFR0_EL1);
> -        c->dbg64.bits[1] =3D READ_SYSREG(ID_AA64DFR1_EL1);
> +    c->aux64.bits[0] =3D READ_SYSREG(ID_AA64AFR0_EL1);
> +    c->aux64.bits[1] =3D READ_SYSREG(ID_AA64AFR1_EL1);
>=20
> -        c->aux64.bits[0] =3D READ_SYSREG(ID_AA64AFR0_EL1);
> -        c->aux64.bits[1] =3D READ_SYSREG(ID_AA64AFR1_EL1);
> +    c->mm64.bits[0]  =3D READ_SYSREG(ID_AA64MMFR0_EL1);
> +    c->mm64.bits[1]  =3D READ_SYSREG(ID_AA64MMFR1_EL1);
> +    c->mm64.bits[2]  =3D READ_SYSREG(ID_AA64MMFR2_EL1);
>=20
> -        c->mm64.bits[0]  =3D READ_SYSREG(ID_AA64MMFR0_EL1);
> -        c->mm64.bits[1]  =3D READ_SYSREG(ID_AA64MMFR1_EL1);
> -        c->mm64.bits[2]  =3D READ_SYSREG(ID_AA64MMFR2_EL1);
> +    c->isa64.bits[0] =3D READ_SYSREG(ID_AA64ISAR0_EL1);
> +    c->isa64.bits[1] =3D READ_SYSREG(ID_AA64ISAR1_EL1);
>=20
> -        c->isa64.bits[0] =3D READ_SYSREG(ID_AA64ISAR0_EL1);
> -        c->isa64.bits[1] =3D READ_SYSREG(ID_AA64ISAR1_EL1);
> +    c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
>=20
> -        c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
> +    aarch32_el0 =3D cpu_feature64_has_el0_32(c);
> #endif
>=20
> +    if ( aarch32_el0 )
> +    {
>         c->pfr32.bits[0] =3D READ_SYSREG(ID_PFR0_EL1);
>         c->pfr32.bits[1] =3D READ_SYSREG(ID_PFR1_EL1);
>         c->pfr32.bits[2] =3D READ_SYSREG(ID_PFR2_EL1);
> @@ -153,6 +159,7 @@ void identify_cpu(struct cpuinfo_arm *c)
> #ifndef MVFR2_MAYBE_UNDEFINED
>         c->mvfr.bits[2] =3D READ_SYSREG(MVFR2_EL1);
> #endif
> +    }
> }
>=20
> /*
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index 6058744c18..13a2739a69 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -5,6 +5,8 @@
> #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
> #define boot_cpu_feature64(feat)       (boot_cpu_data.pfr64.feat)
>=20
> +#define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) =3D=3D 2)
> +
> #define cpu_has_el0_32    (boot_cpu_feature64(el0) =3D=3D 2)
> #define cpu_has_el0_64    (boot_cpu_feature64(el0) >=3D 1)
> #define cpu_has_el1_32    (boot_cpu_feature64(el1) =3D=3D 2)
> --=20
> 2.17.1
>=20


