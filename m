Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF3378E926
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593547.926544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdmu-0001W5-JY; Thu, 31 Aug 2023 09:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593547.926544; Thu, 31 Aug 2023 09:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdmu-0001TO-G8; Thu, 31 Aug 2023 09:16:28 +0000
Received: by outflank-mailman (input) for mailman id 593547;
 Thu, 31 Aug 2023 09:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3Cb=EQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qbdms-0001TI-PP
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:16:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dfc23c7-47df-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:16:23 +0200 (CEST)
Received: from DUZPR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::28) by DU0PR08MB9582.eurprd08.prod.outlook.com
 (2603:10a6:10:44a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 09:16:20 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::8) by DUZPR01CA0170.outlook.office365.com
 (2603:10a6:10:4b3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 09:16:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20 via Frontend Transport; Thu, 31 Aug 2023 09:16:19 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Thu, 31 Aug 2023 09:16:19 +0000
Received: from 1f6df135909f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FFC745B-BCE9-4AFA-8EFD-C4B0C4CFB423.1; 
 Thu, 31 Aug 2023 09:16:12 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f6df135909f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 31 Aug 2023 09:16:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB5299.eurprd08.prod.outlook.com (2603:10a6:208:18d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Thu, 31 Aug
 2023 09:16:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.035; Thu, 31 Aug 2023
 09:16:10 +0000
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
X-Inumbo-ID: 0dfc23c7-47df-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gV6o0mJXmYYenb52GGDLmMRJ9Hnzl1dtlqzeXo3x60=;
 b=6MDIYobqKIePvQ+OCpGrOYLrzGHMBWpsjYDltbzDmL7CX2q6Tl8xyZJ1c1t/0yIQDS5H8HMsbD7gWWugXGNjSOb1QG2tuX8Q7M/ZmuKHedCOApeectlPlea8VaPx/Tc4TzMeENS+c3VdR7mRGMantCM5ZrC38zNNrsDRpk6HjcQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9699ab0a075956e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hl/yNSPLOK+84dItMX+TXLNksSK0he8uBTqTAJ2L8qalQVnXbDGa2jw7YHDpWpiP+ZAcJFMCMY8DH0HdX4t78M2pcq92kADA+lCICElTd1BtmoNW8xTxVBOd2k4uX7ZebR7cU/AR1hkgnxSHeAag/cPKdyV3SvoeIjLBLTj4Fn7UIsq9TlzIyEaEX9StkAD/WNJpOcbA0brkolD8hRsbEJGZ7ZUYSREIjDDYKBWUl9ssFFzNuLgrrf3tnbTRo8wAW4sgpNdacmaIdCdtfxQ4bN5tX32eKIerSWU4KYTAr4Du5GTOGKe/ei580IkMYnq6Wq1k6ObY+UvrZYgN3XKVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gV6o0mJXmYYenb52GGDLmMRJ9Hnzl1dtlqzeXo3x60=;
 b=kThBQnesmnX9byV0nSljq/qbIWYQS5OdzhVfVEqYnV7KRSaXWAFA6dE43UiWx0IPv7JWGhMyvM/KmNTdHNvd71+mYel58k+xya26WmEh2lhM9LCFZSQNE4ygy1GXq1AjcW1ripoamLYFv7Qw4daYxE0HdwrmMZEcqCUlqjLL1yy23/huA/NwsvNufmAcU5ZB8D8SjkCs3XizmzgGwaf89apP1VRX88KfCVhLYOW1jJHMkKs6njLNf8AACKsgggI7myTo0WKaBkNhzHZihuuKC0nmH9SqhlKWVbOX+DJxP5mloV/VhTIj3JdeJTTcR5deekraldSAmjYnvS7TYaINZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gV6o0mJXmYYenb52GGDLmMRJ9Hnzl1dtlqzeXo3x60=;
 b=6MDIYobqKIePvQ+OCpGrOYLrzGHMBWpsjYDltbzDmL7CX2q6Tl8xyZJ1c1t/0yIQDS5H8HMsbD7gWWugXGNjSOb1QG2tuX8Q7M/ZmuKHedCOApeectlPlea8VaPx/Tc4TzMeENS+c3VdR7mRGMantCM5ZrC38zNNrsDRpk6HjcQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Topic: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to
 head.S
Thread-Index: AQHZ2U+hoB0xrFr/oU+WCBP7wHF2i7AEJAQAgAAA3gA=
Date: Thu, 31 Aug 2023 09:16:10 +0000
Message-ID: <CE8AF1AE-8F01-4DD8-86EE-12C4AD18E4A0@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-9-Henry.Wang@arm.com>
 <19a8b434-3b2d-9e3d-fc05-fc2828d1abbd@amd.com>
In-Reply-To: <19a8b434-3b2d-9e3d-fc05-fc2828d1abbd@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM0PR08MB5299:EE_|DBAEUR03FT040:EE_|DU0PR08MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: b3499bb0-637e-4d5b-997c-08dbaa02efc3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GPgZ1noLFXpl+Dp7pp7F9cKYqK0PPlUZnP6R1/Rp5JTfUt53nAn2Ji4W9OEgbuLMpwk7ox+/DKX+3vv9Bex3HIf7X6y7IQNYpaxxnHpa3T29yKBJcYnVs68fSqlUFYOGbkTwq4AkimjECqgjtXqqaEF+ThivRFUX3gScCKlcYNjBIUMLRgoCxu71dCRifNrOO6lkqZeDmXMpVy4gqZiuuPl0OV0771OmGvmj1OgNjldgzUOSCK6Sqnn0BqaS3SZMKBWNe+aszRAQUw7bdCa8sdNWRfw9M1b5tdnW02lEKJfVZ1CcJlZZLLDQ+9fbMGSrFs/TqMP31sJ/R3jchllNQ8t7MAKpCH0d+WXO/FdMP7QzzhFAknjM/c/YRXrnWDnXSrvOtHPJEUr79IA0HseBv3sD4bjG7/Xo7F8N4ZOH1OEd95eQ045D5IN/uTGLGq48lxeU1ab2+DHf/wCFRp07JoDaFRj+mA8dlVW/8WDZKIGARB06nwuEMe/+6oNGwgEFsDELHbYK1esZPNc0NnH1oUgrBELBldvmhLPK5jbSs6JAbgkATGCJ5cGLvo54QSJvc0FcrqP4hQIcsBQsJD3LPIzTvklOcSe5cXTP9NwJZuJ/w9uJupz03JJAccVV+fEab6hzQqoAS8tjk7zbK5nxYQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(6512007)(71200400001)(6506007)(6486002)(36756003)(33656002)(122000001)(38070700005)(38100700002)(86362001)(2616005)(2906002)(26005)(53546011)(83380400001)(478600001)(91956017)(76116006)(66946007)(8676002)(8936002)(4326008)(5660300002)(66556008)(41300700001)(66446008)(316002)(54906003)(6916009)(66476007)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <02B3C96B7695884586EC9C72671CEE85@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5299
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80e47688-3c63-48ce-9f9c-08dbaa02ea5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qODSwns+GSO4jipE9hXe6XVxB0ZfrwQEfPYvgpViPyBKLJnVy+03A5LljSAKXh/pT7llwuq9HxNC49B4tXrSiW9VScOYV2wuGEbDi8DiucuZrdDj9cf9SfQB3nPCiqDqmtTX8tUvFX3dY2RJeJY5ozGI1kVCCknPgfwHmX6J8idn/LC3fSiRZ1RYVDGuS1zbdi3tD4Vn9YVBunxmBhLoYnV17VUnqWUqxH+8GWc6HZFn274gBqIuCDSo5Z3PaSEy2c9/wm/0Ioby1ax3ZC6iuQfwJLUpgT/ollAKpc8W7uxyMnVo9TKT/AkpNbJtSVzFVcqQtYwiH1W80FkSAkKJPbwwCWf4RZyNsjDlu1IIjw7XFN/C8mRoNW8eo7lL+XX2kgsIBc9hzcTjahe94ki83y2VW5ywxxewuk6wknUQSA5pxhMRl576pkwzX8ncDddJBCGjiycgOz9G4z6jy5oh3NznoGISpfLQsucl8wSE1CazzmKlE7DDdDAw/NMEn9d5R+HT2whB+c3IQ0+dM7koQEATeFOBj7vQKviLEpuFKgZWzTwDppClcoeXbSOqrQdR73iNpJbxXWxd5y51NLXbOjXGggyrKhVLj0wtAw7cLg9BGiYBaumsVJBq5EJO+rcO6CZlL+rNkOrbSSCHoTx4E1vfpq21/K2N1yiMdZKEZJJbvXplITVp4KhdcPOWfcuQpjbhoqOD0rWuCn/IgqcEif/ULvl8fYxqyd8gqeeVed2AUehz9/21y1hs3mwXwOaB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(82310400011)(1800799009)(451199024)(186009)(36840700001)(46966006)(40470700004)(41300700001)(40460700003)(81166007)(356005)(82740400003)(86362001)(33656002)(478600001)(83380400001)(2616005)(47076005)(26005)(336012)(107886003)(6512007)(6486002)(53546011)(36860700001)(40480700001)(6506007)(70206006)(2906002)(70586007)(316002)(36756003)(54906003)(5660300002)(6862004)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:16:19.2130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3499bb0-637e-4d5b-997c-08dbaa02efc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582

Hi Ayan,

> On Aug 31, 2023, at 17:12, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Henry,
>=20
> On 28/08/2023 02:32, Henry Wang wrote:
>>=20
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 33b038e7e0..39218cf15f 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -83,6 +83,25 @@
>>          isb
>>  .endm
>>=20
>> +/*
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
>> +        pt_enforce_wxn
>> =20
>=20
> Can you move ^^^ to before "#ifdef CONFIG_EARLY_PRINTK" so that the MMU r=
elated functionality are bundled together?
>=20
> Also AFAIU, mov_w has not effect on pt_enforce_wxn().
>=20
> So that I can create a function "enable_secondary_cpu_mm()" - similar to =
one you introduced for arm64

Sure, I am good with this if other maintainers do not have any objections.

Kind regards,
Henry

>=20
> /* This will contain all the MMU related function for secondary cpu */
>=20
> enable_secondary_cpu_mm:
>=20
> bl    create_page_tables
>=20
> mov_w lr, secondary_switched
>=20
> ....
>=20
> flush_xen_tlb_local r0
>=20
> pt_enforce_wxn r0
>=20
> ENDPROC(enable_secondary_cpu_mm)
>=20
>=20
> - Ayan


