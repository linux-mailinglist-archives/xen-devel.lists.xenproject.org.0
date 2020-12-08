Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A0C2D2D5E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 15:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47484.84014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kme9D-0003ds-G4; Tue, 08 Dec 2020 14:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47484.84014; Tue, 08 Dec 2020 14:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kme9D-0003dT-Cl; Tue, 08 Dec 2020 14:39:23 +0000
Received: by outflank-mailman (input) for mailman id 47484;
 Tue, 08 Dec 2020 14:39:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVKH=FM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kme9C-0003dO-GV
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 14:39:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::61e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a02fc977-71d0-405f-b14e-3fa8ffb56a9c;
 Tue, 08 Dec 2020 14:39:19 +0000 (UTC)
Received: from DB3PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:8:1::26) by
 VE1PR08MB5822.eurprd08.prod.outlook.com (2603:10a6:800:1a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Tue, 8 Dec
 2020 14:39:16 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::a9) by DB3PR06CA0013.outlook.office365.com
 (2603:10a6:8:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 8 Dec 2020 14:39:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 14:39:16 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Tue, 08 Dec 2020 14:39:16 +0000
Received: from d7c2c4d14ba0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 818A344E-99A2-42F3-BA9E-2E5D3AF8780A.1; 
 Tue, 08 Dec 2020 14:38:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7c2c4d14ba0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Dec 2020 14:38:57 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5765.eurprd08.prod.outlook.com (2603:10a6:10:1ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 14:38:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 14:38:56 +0000
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
X-Inumbo-ID: a02fc977-71d0-405f-b14e-3fa8ffb56a9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6XEMSu+xHR+mN7n/m1IrWCYX60Sul941CpDSEMoJhE=;
 b=YzSr1pexAXaTSa0NJNDnekClwBEBqLUB08xyWDhWjR9k3OlHNBxtJEmzR1Nz9M0/OJMIkjdbVxDKGmWZKhXyVHubOi6FpxAq0/7I64vZ+ODJnGVRBMr2azfoCyYQWEaOthUtVGr4XdYg6MUbRAGwTxwjgsDLQADklUmHBYnIhCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5e79f811a28ec00
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqnPkWqhV6yNm+r1cGzgZlcRGjnYXfDXV/T+AUMbm9K9cVSFpCx+yKE3nXSgNOKe9AUfY77yJZFg4kGPa41joHB34Gp2lx7s0qz3pyjN6OH03nMMSrHWKZlagqdNuramx7Tmt5Nn316R8FUTkLMOEhsYzcne7T6zALrDTQO3LxTTH+OlCqFFLv6UmM05NqVzHmM5XOqKxPWirJOopwu7yvyog/+uhYDz/7dVjexLw2NDWTG8TwrVpqMI0KPI5GDhrbE9kw486Fr7j11rWx5c6VnnJlKA41Y8yyMeMRXWaOLQMNrfPC27WQTF7N/Eh4EWQEdxeViD3fFD6KC7s++1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6XEMSu+xHR+mN7n/m1IrWCYX60Sul941CpDSEMoJhE=;
 b=oWl0cQJs7IqgX6z8kwW1LZODJXLYRuYPNgWfzJreH8TvX0OsAa9cYYjK/aYpjCnS/cuTuOW6jvYNvrPqGLG6eEbnr3GsJ2ufsylOUKkTnwi3PCNbqZgiBD3T7VXYOQy7mXogFb+ZXcBIZjQ1RewRJLsgH9rVJRpx5HksrQk7JwRib0mJBMWwLZA0AL3clCp5hYjI+QuNd4F5ZNmnVbCwWVxbMeVxndDvEONxBO/r+oLvY4tgrLYhw0lA5ENc3ZCAOvIzjxUXW1UPsYoIjyxPjqyLTsmnSQ5T2ISpMXdKhS+2zgtuvVxduOQo9Rp0B6rqMSSGLWaorIVK9jCI0JgHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6XEMSu+xHR+mN7n/m1IrWCYX60Sul941CpDSEMoJhE=;
 b=YzSr1pexAXaTSa0NJNDnekClwBEBqLUB08xyWDhWjR9k3OlHNBxtJEmzR1Nz9M0/OJMIkjdbVxDKGmWZKhXyVHubOi6FpxAq0/7I64vZ+ODJnGVRBMr2azfoCyYQWEaOthUtVGr4XdYg6MUbRAGwTxwjgsDLQADklUmHBYnIhCE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <Michal.Orzel@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
Thread-Topic: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
Thread-Index: AQHWzTMYnytbZyotvEaEgHJUGuOUO6ns89IAgABRfAA=
Date: Tue, 8 Dec 2020 14:38:55 +0000
Message-ID: <5D1B5771-A6B3-4F5E-81A1-864DBC8787B4@arm.com>
References: <20201208072327.11890-1-michal.orzel@arm.com>
 <d286241c-fd3b-8506-37e5-0ddcdaae97be@xen.org>
In-Reply-To: <d286241c-fd3b-8506-37e5-0ddcdaae97be@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1beb820-c1fd-4416-e65b-08d89b870a29
x-ms-traffictypediagnostic: DBAPR08MB5765:|VE1PR08MB5822:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB582230CCABBABD37AE883A6D9DCD0@VE1PR08MB5822.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XQcgTt3PRAbWXCYEQjczHwL33v5wp+0mJv/SwKMUbg04BG567GxpBGU0MBxRHYmXm5GHb7MXNuw8LXSbkE1yfnoITO8xHfnv8T4NIL8szQTur02WWRgWMW4uwhduwgXNPPrlQdAWiuCcbvQA54rTBmu8JPI4z3l3gE49iSJMpIoYQxyhR87q/aU2gZ7JGbMt/1gQAXx+IfJy7G7GdEX7XKt80iZVzgAKhTHQFgSKy+ObATkzZMbkGhcM+aZW29Bn3BiCacPgKzbQHyrRhy5P6cZGtvCxkgbJnLc1TJJfvX0Lk3Jnksy32fRzmg0f3iWspzajnvle7mB9OE8Nw3XO/SwWmLf1ss+TzjO7NgglJ5Wzb94jDVD/MY3xU+hFylFE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(53546011)(2616005)(76116006)(6916009)(8676002)(4326008)(8936002)(508600001)(6486002)(2906002)(6512007)(6506007)(26005)(54906003)(186003)(91956017)(64756008)(5660300002)(36756003)(66946007)(71200400001)(86362001)(33656002)(83380400001)(66446008)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?osRsh/mEc9SBywVi3i48fo3qX1cqJvR+cbrUObuX58G8NZmNxAOj7mDI+m3X?=
 =?us-ascii?Q?iUtmexCEp5QPGr0UGazJ+rLUACZjY79lpp6pfNppTlvc2pdlKoqZ4PBjzGgA?=
 =?us-ascii?Q?s0XYdci3cYSoQssw+5cLU2/E9cJj0Lb9z9vmmCIwl5A7yDSd0KTrZPDKqLQ6?=
 =?us-ascii?Q?DHyB56zOxOHdCrKmu4xkrdkLz2kebyQM3c+qz7rjfmDDiKIXg/3A2yFvFn+6?=
 =?us-ascii?Q?cuoSsARbqjQeu3dWxzlnrfmvHZENmXPGKMgAa4Jh2ZeidPkFgOETSdfkvJ/O?=
 =?us-ascii?Q?kCnfrmsgNqE4p+VjbsclQam8OSElvqTE9XVM/WvdYpoamjPavd32xfJ23dxt?=
 =?us-ascii?Q?RsCd1APK8BX1L3hNsZNniQyk8kly1JZ03oqQ1t656A6h8Ssy7Bw+FnLwc5Q7?=
 =?us-ascii?Q?AR6JEH30x+/9OWypsd/2QUtBzyyJGs+GV1uWcXOv1PvH9m19aJnl41KYII/I?=
 =?us-ascii?Q?uGY0K0K4T2jKL1n8nZnhtwofkBCBz3KFOtAinLTCe0onEg3Uw/67XuWB8kO1?=
 =?us-ascii?Q?0YVs0gqj3RRRNdpioYL+5XfJfFghOrUUzjrI5ac7xO5eSwhH8O6fYDzulJ/p?=
 =?us-ascii?Q?mBepfEqH7zCohtdAnGg1/S8vhhIkKMgL0K7lJgMHmcmr17rBeUxb7lAUPHGf?=
 =?us-ascii?Q?t9Ak42VNGJSwt4Na7mBfrSCqgYBL14zqd+k2kS90gXdLNCEHUnT/LEowjHgj?=
 =?us-ascii?Q?AyfEOyWZ2D7JHuuOESZz+QlkmNnqBeAFejIY7LiVNIW+Pj7lKgIUI+o+Di27?=
 =?us-ascii?Q?1TGfmMU9CypGFPZF6q1q1f2FOHt8QcKUhfqQLWm97dPd6mFu/z1h3UaQKyby?=
 =?us-ascii?Q?pUSydmig2ej2JvxuzCgC49peZm+qiU4pMQ024CHyBw+SS6lNSUn2gvF7+LvH?=
 =?us-ascii?Q?dTXYGmYVTxb7l85p72j2gV/aC0xXKcZkqdXiaETAfda7Mo0rd7hrHYlmd0N/?=
 =?us-ascii?Q?1cbrGqq35xigViIK3fVfQfkiDh+0xACp+FrbJq5BVmFtfNN3uYlCLV2ep1KY?=
 =?us-ascii?Q?kkl2?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <58FCEC9FF543044380496E9F9FCF9C17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5765
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2ff2998-51ab-4752-18e4-08d89b86fde2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QqMDCRfwCFmkycKZXUf48eUwIm4RsV5cglfrTKh5hpmakaLFR8KRzFrO4yZvLUkvjqYJ+5HxYZg+66yVUkmDZ1QxMrtkEGHjjpQx0OZvdtKzOPZ4eQJGdlv0GZ/NAVjBrWIOvJHmLh543v0cOVJm9yfrtqv5vEFRr4sHJf/syfUTH9oP8r5fq1G0Uxd3pLf/+RMoecCCnLjGfcM/OfUEd2vCXLE8O6swm3JSWOU0eIWXJUdETn4Ng/Z6dpuh/fp01iO4GSj7BLYcHQkVayexT5ISEiCPMV/zda/60sQwrqPd57BLLOeiR8T/0r2oEfAQzGlvJSGye5gZq2jviRH5ehR+gU6TlYIELlMOKk7H/BquEXzTBZ4GGJ/mTFXquNGdZ1e+Tg8dGybRozhyczDLHg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(46966005)(83380400001)(86362001)(6512007)(53546011)(81166007)(6506007)(47076004)(356005)(36756003)(6862004)(54906003)(5660300002)(4326008)(82310400003)(2906002)(186003)(70586007)(26005)(336012)(508600001)(8936002)(2616005)(33656002)(6486002)(8676002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 14:39:16.6213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1beb820-c1fd-4416-e65b-08d89b870a29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5822

Hi Julien,

> On 8 Dec 2020, at 09:47, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 08/12/2020 07:23, Michal Orzel wrote:
>> When executing in aarch32 state at EL0, a load at EL0 from a
>> virtual address that matches the bottom 32 bits of the virtual address
>> used by a recent load at (aarch64) EL1 might return incorrect data.
>> The workaround is to insert a write of the contextidr_el1 register
>> on exception return to an aarch32 guest.
>=20
> I am a bit confused with this comment. In the previous paragraph, you are=
 suggesting that the problem is an interaction between EL1 AArch64 and EL0 =
AArch32. But here you seem to imply the issue only happen when running a AA=
rch32 guest.
>=20
> Can you clarify it?

This can happen when switching from an aarch64 guest to an aarch32 guest so=
 not only when there is interaction.

>=20
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>  docs/misc/arm/silicon-errata.txt |  1 +
>>  xen/arch/arm/Kconfig             | 19 +++++++++++++++++++
>>  xen/arch/arm/arm64/entry.S       |  9 +++++++++
>>  xen/arch/arm/cpuerrata.c         |  8 ++++++++
>>  xen/include/asm-arm/cpufeature.h |  3 ++-
>>  5 files changed, 39 insertions(+), 1 deletion(-)
>> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-er=
rata.txt
>> index 27bf957ebf..fa3d9af63d 100644
>> --- a/docs/misc/arm/silicon-errata.txt
>> +++ b/docs/misc/arm/silicon-errata.txt
>> @@ -45,6 +45,7 @@ stable hypervisors.
>>  | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_82=
7319    |
>>  | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_82=
4069    |
>>  | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_81=
9472    |
>> +| ARM            | Cortex-A53      | #845719         | ARM64_ERRATUM_84=
5719    |
>>  | ARM            | Cortex-A55      | #1530923        | N/A             =
        |
>>  | ARM            | Cortex-A57      | #852523         | N/A             =
        |
>>  | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_83=
2075    |
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index f5b1bcda03..6bea393555 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -244,6 +244,25 @@ config ARM_ERRATUM_858921
>>    	  If unsure, say Y.
>>  +config ARM64_ERRATUM_845719
>> +	bool "Cortex-A53: 845719: A load might read incorrect data"
>> +	default y
>> +	help
>> +	  This option adds an alternative code sequence to work around ARM
>> +	  erratum 845719 on Cortex-A53 parts up to r0p4.
>> +
>> +	  When executing in aarch32 state at EL0, a load at EL0 from a
>> +	  virtual address that matches the bottom 32 bits of the virtual addre=
ss
>> +	  used by a recent load at (aarch64) EL1 might return incorrect data.
>> +
>> +	  The workaround is to insert a write of the contextidr_el1 register
>> +	  on exception return to an aarch32 guest.
>> +	  Please note that this does not necessarily enable the workaround,
>> +	  as it depends on the alternative framework, which will only patch
>> +	  the kernel if an affected CPU is detected.
>> +
>> +	  If unsure, say Y.
>> +
>>  config ARM64_WORKAROUND_REPEAT_TLBI
>>  	bool
>>  diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>> index 175ea2981e..ef3336f34a 100644
>> --- a/xen/arch/arm/arm64/entry.S
>> +++ b/xen/arch/arm/arm64/entry.S
>> @@ -96,6 +96,15 @@
>>          msr     SPSR_fiq, x22
>>          msr     SPSR_irq, x23
>>  +#ifdef CONFIG_ARM64_ERRATUM_845719
>> +alternative_if ARM64_WORKAROUND_845719
>> +        /* contextidr_el1 is not accessible from aarch32 guest so we ca=
n
>> +         * write xzr to it
>> +         */
>=20
> This path is also used when the trapping occurs when running in EL0 aarch=
32. So wouldn't you clobber it if the EL1 AArch64 use it (Linux may store t=
he PID in it)?

Right we missed that.
In this case i would suggest to do something reading and then writting back=
 in contextidr instead so that we do not clobber it.

Regards
Bertrand

>=20
> Also the coding style for multi-line comment in Xen is:
>=20
> /*
> * Foo
> * Bar
> */
>=20
>> +        msr     contextidr_el1, xzr
>> +alternative_else_nop_endif
>> +#endif
>=20
> Cheers,
>=20
> --=20
> Julien Grall


