Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0137A2DE3
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 06:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603503.940519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhMii-00008i-MG; Sat, 16 Sep 2023 04:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603503.940519; Sat, 16 Sep 2023 04:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhMii-00006A-J0; Sat, 16 Sep 2023 04:15:48 +0000
Received: by outflank-mailman (input) for mailman id 603503;
 Sat, 16 Sep 2023 04:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aGgT=FA=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qhMih-000064-DO
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 04:15:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4cd2c4a-5447-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 06:15:45 +0200 (CEST)
Received: from DB8PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:10:be::48)
 by AM8PR08MB5795.eurprd08.prod.outlook.com (2603:10a6:20b:1df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Sat, 16 Sep
 2023 04:15:39 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::a0) by DB8PR03CA0035.outlook.office365.com
 (2603:10a6:10:be::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23 via Frontend
 Transport; Sat, 16 Sep 2023 04:15:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.11 via Frontend Transport; Sat, 16 Sep 2023 04:15:39 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Sat, 16 Sep 2023 04:15:39 +0000
Received: from a35a188493b5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B318679C-A309-4F9E-BB5B-D31D57447ABD.1; 
 Sat, 16 Sep 2023 04:15:32 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a35a188493b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 16 Sep 2023 04:15:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB8120.eurprd08.prod.outlook.com (2603:10a6:20b:58c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Sat, 16 Sep
 2023 04:15:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6792.021; Sat, 16 Sep 2023
 04:15:25 +0000
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
X-Inumbo-ID: b4cd2c4a-5447-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naq6YlmwOdh747dPnMEkJt9bEda8CcSEllIubYpZpqY=;
 b=wHrF5/2LUEj39sxkXX+TqZZFHBzb7Sj4BwKlib7Lqz/8BDFVIvNJf/awShKgQNL8tEMO/tnOtLSmPejsC29p4IxBv4D19C8O53uKUcy/CNZ1tR6M3+M2fNzF6n1wVscbOVTRxdIcXXkLEyqtdx1ZhiVrG4gDKO5jfUi49fF+ujg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0274883478cda44
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH7v9QxVkind1ruI6AGIDBbSdwtbeg+4DnhA2R0H7pqimGStHZFqCk4wNc+tYmcXNq0KsOSOhstXErYY2MhSNvwipaGMM7gDKBkFDkYo7ZxxuSqhZ5rjsiDlmNQkjTmXV1AA8ntJjk6DL2OsuOvKjSV3Sjqcn72Bkk7H0OjNwUedcQdXxmgoEyj80tGEJLICwxxxkp1L23r5nzEJ6/n9dO4oc0HONrqb47MQjJzTcoIefrnX53NfsvdQbaghEIQt4xK6Grug+kA7kCXo5diYTpsTqc5aS1v+I3wF55MYpVA75HHjgsn2CjhXKoLFBAQNvIu96mOt2Wi2lP+ODRuaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naq6YlmwOdh747dPnMEkJt9bEda8CcSEllIubYpZpqY=;
 b=PDUHUz9HnJiMwZyqVWdO5bErgMXOK5VIKmhm9duyYS9tBBlypkMQYDiiKl34nfs6LMntVuaLcHr73E3Iglfx5OyLFIvJyekkcHpTEPTRGt/ooDZdKYmt0CQi7VsqUgkQCIQSqaxX4j96Q02NwefsLQrBc4bnvGMtiJEoX+bqRPJrlLuCM3PlKVYDV+roVPXts64RLHlO+hzgo/eq8MFHKIC980MyaX0IXMaa4z+14zoJEoY3vSR0NqgSafhExt1L/EG39p7iFkVJ69phZ2wv7lOoDTPjYRrAQK+HYU4sLVZlfO5u/NefVjdeqOjK4/sKkdY5M/Avj+ITDbhOS5F4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naq6YlmwOdh747dPnMEkJt9bEda8CcSEllIubYpZpqY=;
 b=wHrF5/2LUEj39sxkXX+TqZZFHBzb7Sj4BwKlib7Lqz/8BDFVIvNJf/awShKgQNL8tEMO/tnOtLSmPejsC29p4IxBv4D19C8O53uKUcy/CNZ1tR6M3+M2fNzF6n1wVscbOVTRxdIcXXkLEyqtdx1ZhiVrG4gDKO5jfUi49fF+ujg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Topic: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to
 head.S
Thread-Index: AQHZ2U+hoB0xrFr/oU+WCBP7wHF2i7AcjQCAgABpJ4A=
Date: Sat, 16 Sep 2023 04:15:24 +0000
Message-ID: <E322EB66-C914-4989-A25B-121D41BFC9C5@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-9-Henry.Wang@arm.com>
 <4d7a9849-8990-8ddd-3531-93f4e2e262b1@xen.org>
In-Reply-To: <4d7a9849-8990-8ddd-3531-93f4e2e262b1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB8120:EE_|DBAEUR03FT054:EE_|AM8PR08MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ead5007-3650-4214-9460-08dbb66b95a8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fmfl4fpHPeroqTZe4sx8XTi/AsB59GYpD76WyoGpmUb3p0fk1gEGXwkYU2Jql5C+b3ROd5dViEe153JdLvm33kWcvWUOuuZGUP8hKedqIg5YZfbjK/JINYP4Nxcuh1ft/3ZeEx+c5pzTaVX2F7cRpmnYDcNiU+WUoOo30HX2LZRK91Ae7wHJ3NzDxLXbHmkX6se/UNYJeqdSAF4Qk9ofvWfthk5i+aAzROVX3UyCSQALi8bSjVkcxPUBS4RUexUEaY5nRJGEWaabb+4Qe9z+EIkZjrx+yGDcibB+7lWlMJuXc266eAZCUtexYmlo9Pv4JQUzObtK9pfaDC2nBKF1ICTSdjqjuiawynj2Og9Qp1R+uXCm+G5rLqmKx2U9rgmPn44/jykwleGl8CSe8YHP8RAy1fE8IFC13OEpWlNVDSAkUEoz3lLoyhc9XRV0GmTzXeNG7IEq/dM4aY3iw4pHQhnjHwBcrfi3bx+5Tta5vBonpaEwDN0LSFrJaTgQlosf5EcPAMMOuYXwVYfhvZ4j4XCJSOwDyVgGUVvfx1BowZrpHAWwJmzVqi9uYz26JSYW2i85Y/f9Fn/T6eEZBFiMqlLv0zksA6owT9w2CakoCnJ7fVeDXFd1S2x5HMSpJ/E0S3j2pWUhoP64p6HDjw764g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(186009)(451199024)(1800799009)(316002)(54906003)(64756008)(76116006)(66446008)(66476007)(66556008)(6916009)(91956017)(66946007)(26005)(36756003)(2616005)(83380400001)(6486002)(6506007)(86362001)(38070700005)(38100700002)(33656002)(53546011)(6512007)(478600001)(122000001)(2906002)(71200400001)(8676002)(8936002)(41300700001)(4326008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <569AD40FACF0F44BA420669F67DA6478@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8120
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	618759bd-8f15-4abc-7919-08dbb66b8d38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bHYBRC/QLmmvv7K+ldVwvthSgBv3CNHfhuVKxz+WzMaKpBh2jR9rKbdHJ8qTxuDlTij3S1ek/b8YUV2Yp+9tYxWnZL4Quin04b4v4l17U5DOxI9vQL2o9TSw6oUopCP69L8fW21MrSy3j/Q40bnixdCi5WlZsuoTN0uIT9rYRFAACUrwe95s1z1RQbz5E497Ea16giqhaQJcd0KUUUJ/MMZAT2zEcDL3vj/DGHix/zo3BZMnsQVlZtPdsfCzb/CsfuQLNFJnpIKTgI6uymKw+XBs0pSXKcOywT82zWVTgLh1RyWXmcn5cCuYNumR7dAsyKO84fHNdpzXcsNmSVii03wFtvriMdPFTwF9YxnTAndqN6SK9BEjFY02UeJw61H6j0c8fvEh7RFizsV9YUNJwZkYJlU8EqSuji2GxgP8p/5/3l2c02gsvVU+sRB3LBy9wlba1+8k6rb9pOyP0ANXvBIR4v/1zhmEoFGNbWjue2D0uOkES/Hcm+C8hQL7BggVXE/Ge3AEaW12cC0zhkf349TQGE1bOZYWIu7jt54Q0Z6KZAXJSgJXA6yX52PfDuIbjihxEHsz0/hlurzwf6IUxAjt1H3k99kkTW9/Ps5ie1NsMa2yhYYTZecGsi+bGv4jyHQ36EZNsoZE7YiY5k+fv4z0y6DKgKdJWLfY5Yd0vk4RlNK4m76eZSqV6/JHr0jp9ffvhd8AE40uM1J/NeE49llUM0q64nfF9AeqhbskLOPTgyif0BcJhE2aq1vnY8g3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(478600001)(41300700001)(40480700001)(83380400001)(5660300002)(2906002)(8676002)(70206006)(8936002)(6862004)(54906003)(316002)(70586007)(4326008)(6506007)(53546011)(6486002)(6512007)(40460700003)(2616005)(26005)(107886003)(336012)(36860700001)(36756003)(86362001)(356005)(81166007)(33656002)(82740400003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2023 04:15:39.1666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ead5007-3650-4214-9460-08dbb66b95a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5795

Hi Julien,

> On Sep 16, 2023, at 05:58, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 28/08/2023 02:32, Henry Wang wrote:
>> Currently mmu_init_secondary_cpu() only enforces the page table
>> should not contain mapping that are both Writable and eXecutables
>> after boot. To ease the arch/arm/mm.c split work, fold this function
>> to head.S.
>> Introduce assembly macro pt_enforce_wxn for both arm32 and arm64.
>> For arm64, the macro is called at the end of enable_secondary_cpu_mm().
>> For arm32, the macro is called before secondary CPUs jumping into
>> the C world.
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> v6:
>> - New patch.
>> ---
>>  xen/arch/arm/arm32/head.S     | 20 ++++++++++++++++++++
>>  xen/arch/arm/arm64/mmu/head.S | 21 +++++++++++++++++++++
>>  xen/arch/arm/include/asm/mm.h |  2 --
>>  xen/arch/arm/mm.c             |  6 ------
>>  xen/arch/arm/smpboot.c        |  2 --
>>  5 files changed, 41 insertions(+), 10 deletions(-)
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 33b038e7e0..39218cf15f 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -83,6 +83,25 @@
>>          isb
>>  .endm
>>  +/*
>> + * Enforce Xen page-tables do not contain mapping that are both
>> + * Writable and eXecutables.
>> + *
>> + * This should be called on each secondary CPU.
>> + */
>> +.macro pt_enforce_wxn tmp
>> +        mrc   CP32(\tmp, HSCTLR)
>> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
>> +        dsb
>> +        mcr   CP32(\tmp, HSCTLR)
>> +        /*
>> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchroniz=
ed
>> +         * before flushing the TLBs.
>> +         */
>> +        isb
>> +        flush_xen_tlb_local \tmp
>> +.endm
>> +
>>  /*
>>   * Common register usage in this file:
>>   *   r0  -
>> @@ -254,6 +273,7 @@ secondary_switched:
>>          /* Use a virtual address to access the UART. */
>>          mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>>  #endif
>> +        pt_enforce_wxn r0
>>          PRINT("- Ready -\r\n")
>>          /* Jump to C world */
>>          mov_w r2, start_secondary
>> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head=
.S
>> index a5271e3880..25028bdf07 100644
>> --- a/xen/arch/arm/arm64/mmu/head.S
>> +++ b/xen/arch/arm/arm64/mmu/head.S
>> @@ -31,6 +31,25 @@
>>          isb
>>  .endm
>>  +/*
>> + * Enforce Xen page-tables do not contain mapping that are both
>> + * Writable and eXecutables.
>> + *
>> + * This should be called on each secondary CPU.
>> + */
>> +.macro pt_enforce_wxn tmp
>> +       mrs   \tmp, SCTLR_EL2
>> +       orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
>> +       dsb   sy
>> +       msr   SCTLR_EL2, \tmp
>> +       /*
>> +        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronize=
d
>> +        * before flushing the TLBs.
>> +        */
>> +       isb
>> +       flush_xen_tlb_local
>> +.endm
>> +
>=20
> It would be preferable if we can set the flag right when the MMU is initi=
alized enabled configured. This would avoid the extra TLB flush and SCTLR d=
ance. How about the following (not compiled/cleaned) code:

Thank you for the detailed information. Sure, I will try below code and kee=
p you
updated about if it works. Will update the patch accordingly.

>=20
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.=
S
> index a5271e388071..6b19d15ff89f 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -264,10 +264,11 @@ ENDPROC(create_page_tables)
>  * Inputs:
>  *   x0 : Physical address of the page tables.
>  *
> - * Clobbers x0 - x4
> + * Clobbers x0 - x6
>  */
> enable_mmu:
>         mov   x4, x0
> +        mov   x5, x1
>         PRINT("- Turning on paging -\r\n")
>=20
>         /*
> @@ -283,6 +284,7 @@ enable_mmu:
>         mrs   x0, SCTLR_EL2
>         orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
>         orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
> +        orr   x0, x0, x5                /* Enable extra flags */
>         dsb   sy                     /* Flush PTE writes and finish reads=
 */
>         msr   SCTLR_EL2, x0          /* now paging is enabled */
>         isb                          /* Now, flush the icache */
> @@ -297,16 +299,17 @@ ENDPROC(enable_mmu)
>  * Inputs:
>  *   lr : Virtual address to return to.
>  *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>  */
> ENTRY(enable_secondary_cpu_mm)
> -        mov   x5, lr
> +        mov   x6, lr
>=20
>         load_paddr x0, init_ttbr
>         ldr   x0, [x0]
>=20
> +        mov   x1, #SCTLR_Axx_ELx_WXN        /* Enable WxN from the start=
 */
>         bl    enable_mmu
> -        mov   lr, x5
> +        mov   lr, x6
>=20
>         /* Return to the virtual address requested by the caller. */
>         ret
> @@ -320,16 +323,17 @@ ENDPROC(enable_secondary_cpu_mm)
>  * Inputs:
>  *   lr : Virtual address to return to.
>  *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>  */
> ENTRY(enable_boot_cpu_mm)
> -        mov   x5, lr
> +        mov   x6, lr
>=20
>         bl    create_page_tables
>         load_paddr x0, boot_pgtable
>=20
> +        mov   x1, #0        /* No extra SCTLR flags */
>         bl    enable_mmu
> -        mov   lr, x5
> +        mov   lr, x6
>=20
>         /*
>          * The MMU is turned on and we are in the 1:1 mapping. Switch
>=20
> The same logic could be used for arm32.

Sure. Will do that together.

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


