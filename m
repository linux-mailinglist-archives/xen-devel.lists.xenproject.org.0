Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE02CA4D4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 15:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42074.75630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk6Go-0000UR-N3; Tue, 01 Dec 2020 14:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42074.75630; Tue, 01 Dec 2020 14:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk6Go-0000U2-Jx; Tue, 01 Dec 2020 14:04:42 +0000
Received: by outflank-mailman (input) for mailman id 42074;
 Tue, 01 Dec 2020 14:04:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dt7S=FF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kk6Gn-0000Tx-Hx
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 14:04:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74c52e1e-8ff9-4d3d-9c46-3eba004867b5;
 Tue, 01 Dec 2020 14:04:39 +0000 (UTC)
Received: from DB9PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:1d9::25)
 by AM9PR08MB6147.eurprd08.prod.outlook.com (2603:10a6:20b:2da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 14:04:36 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::a) by DB9PR02CA0020.outlook.office365.com
 (2603:10a6:10:1d9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 1 Dec 2020 14:04:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Tue, 1 Dec 2020 14:04:36 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Tue, 01 Dec 2020 14:04:36 +0000
Received: from 8cb0a397dafd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56DEE55A-0762-42EE-8043-32751756AA09.1; 
 Tue, 01 Dec 2020 14:04:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8cb0a397dafd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Dec 2020 14:04:31 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5589.eurprd08.prod.outlook.com (2603:10a6:10:1a2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Tue, 1 Dec
 2020 14:04:30 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Tue, 1 Dec 2020
 14:04:30 +0000
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
X-Inumbo-ID: 74c52e1e-8ff9-4d3d-9c46-3eba004867b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75OssYQ1ohlGTH2OCu/0MBJ4agx4rEEyL3D4EWsCiNc=;
 b=JQS1zbSm+4vL8+n5qfFRmnmPhGWux7ZtkeNzJfEWDx7gp3vvgT4MaCGaYG+9ox+bzNQF7s/p9DJxwNzy5rnw6Zqi7HXGkbjztKisejuoJRci4wXmKL9HPl6WUemDZ/9sNtjjvm7RBS+cdsrf72nLwlClAuMRPNT/S9cKklF/lU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a91f0418d968cdf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv6ogArxsPrzUL2g/SwkAUl43CjV1g5q8MyHTG++2o27G96kQb418yA30kryeICDei7DtFov9jw3iO2IkoAGhwnHT0co4D8cSTdDBgsyqJKvgNxOfI20B+kYhOGSjxRCJoU0vtOE+k3D9Vd2WQ+X5dfGpqYKkLx9UJJG6yWvEhtkYUt6EOiRBaAU7N6t2LcNurMjqqE+RDJTr+7d0kGyRWCVta+hBxBbkmORPK2oufMUyRAdnE/24dzwhafv4ss1/Kgu9TmAc1YEnEIT5Ie5waKuYNqH3aau5v//3N+wwNEXnkf79N/OI+TldO9TpnYwBhsIxvThSEa7vtSR776fJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75OssYQ1ohlGTH2OCu/0MBJ4agx4rEEyL3D4EWsCiNc=;
 b=h9dD4ZlUd7iDNrNuKsnnR9fFt5G0k+gAFDobGUwoaqR2U0AJfskUwbpR1AtKH5Gy3RtH5ITl6AOExa6wrDefj5a13pNQC3e3AlBUofRNeyRCxgbPZQA15baFxok9m+v5bwcC09euGxdT+Ozgntry8Grdy6Yo1pyZ5mZimYxx/PbOEwZmOQQhZgrH6g7VgaYNTl1wrLj1nDJc3QP1iLhUyEQ95X7yXTWtHpWBBj1v9sDh3+913FEp7sFt99bDbk5u5UsTZKSKC4dUA6cuoUXhv8fHrIyySSn/UvWNvoV1RE52pl04Y+pQrIO7HizNYr6CVNRNYu1tQg2qk8VrJxygrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75OssYQ1ohlGTH2OCu/0MBJ4agx4rEEyL3D4EWsCiNc=;
 b=JQS1zbSm+4vL8+n5qfFRmnmPhGWux7ZtkeNzJfEWDx7gp3vvgT4MaCGaYG+9ox+bzNQF7s/p9DJxwNzy5rnw6Zqi7HXGkbjztKisejuoJRci4wXmKL9HPl6WUemDZ/9sNtjjvm7RBS+cdsrf72nLwlClAuMRPNT/S9cKklF/lU4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 6/7] xen/arm: Add CP10 exception support to handle VMFR
Thread-Topic: [PATCH v2 6/7] xen/arm: Add CP10 exception support to handle
 VMFR
Thread-Index: AQHWxyRimsJuJ4bKO0qQ+1JBnbZRw6nhI6EAgAEj24A=
Date: Tue, 1 Dec 2020 14:04:29 +0000
Message-ID: <82B51F6A-5D3E-48FB-89DE-F7F8B5407064@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <58ff66d0daf610dfe8e09516302cb0c0fe17fc59.1606742184.git.bertrand.marquis@arm.com>
 <87h7p67f52.fsf@epam.com>
In-Reply-To: <87h7p67f52.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7fa5cacd-804c-4159-a14a-08d89602098b
x-ms-traffictypediagnostic: DBAPR08MB5589:|AM9PR08MB6147:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB614763FD0354616DE84871A59DF40@AM9PR08MB6147.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iZuumAOXCvfJeLCeiDY/IL4QL9m/G1gJnYweguO9FXcMFxFE+p0m93vXUhW8qOg/qbnB/YytpjUrvdcZ3ss9DE5PApxrg5Tk6LkfTr3VF6m1IsVbbdN1d6iK2A4rlSUwEw3LZ18rPLDqKGEdJ7fVWGTpaMU0GhjZHL9oUErjEDrOqQse8OWQ5JhpBkup9G/w3qTWv8EkXkzbYRz6IqzVNLNxurDLkAEPxGuuoOnx4HDM0427Qr0RTOh/1u6JzPOX9co80OSpaLuiEfe9o83YnR9KBE1PNrQVF+qzcgK+jiMzJicunOcNc3PyHTu3VaUL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(186003)(33656002)(83380400001)(6916009)(2616005)(71200400001)(478600001)(4326008)(316002)(6512007)(6506007)(6486002)(26005)(53546011)(54906003)(8676002)(91956017)(86362001)(8936002)(64756008)(66556008)(66446008)(76116006)(36756003)(66946007)(66476007)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?xdtUqwEhZYZfY/YFkvhf2DONLt8EDGC1a7g0Cz6z2qeXUMqyggePSbmnCGm2?=
 =?us-ascii?Q?eBQAYicHEXsCtcG9TUQvUZO5NI3ge5JslmIywNpTy2MtsOma2tEyGrL+yKaz?=
 =?us-ascii?Q?ZXssyIN8drMTZBhTQWMbu7uZHw6+SAFEvs8qc28/1qnFT2K8i0/wEUWTZx/S?=
 =?us-ascii?Q?uUJ2Ay2hvVoIjoEW4nB2JkCtLVDT7bux2X09of/6XYUYjqei1gl7hzDD4k1A?=
 =?us-ascii?Q?Ia4/vNv0lcEhcoC/M3GAorr5Foa+NpEKXgbrkrnbSzArR0iL9WCoaeuTUt+j?=
 =?us-ascii?Q?DYxopGjvy9Lm7dwFt/n8Yy75ZnZxjrpe/jEDtuIxmUsJVoVKAJ/pzbG3H+V+?=
 =?us-ascii?Q?tlp8SqPevTtjzPHxthYTjvqK9HKgSwt3toT3dFx53bdN2Hd6+6+/eeD5PxFD?=
 =?us-ascii?Q?iiDMYRb7XZtrQVDUshhNqTtkvIv/C4q17lZfO43JKaVlc16wHTMqd0RVZpP3?=
 =?us-ascii?Q?MntEt0hJwMQQcluI0d86hPBoh6ltIgnn0XvUG7j5NIf5WCc3f2qTTDiWTR+a?=
 =?us-ascii?Q?s2WCA++fjjih8w5cuhfeuMigFKjrM0TC+AMvk7+UNOy0zNltA0Vt5PUQKNgD?=
 =?us-ascii?Q?BNiuHscWzflSyv3G57XajYoI+tjlQ+YmG1GhdrR2R/wLaypsa8Q+BzxSnMme?=
 =?us-ascii?Q?WNjmfodrD2+OBLOFtma6uT31pPh2TW+YurNVmlzoBnA6vXoqykz9Yivx7Ygk?=
 =?us-ascii?Q?QzsVAk87KGxavdXo+MHsGxlipeM4yTP+RMKuAsaiSmvtEO7/ul3ITUd1I4/2?=
 =?us-ascii?Q?t+l66NXuCSjwCCuUkFHTTxVBQAHJF4KKLKvKUokDDkvYUjFFH5PXunl3RZyD?=
 =?us-ascii?Q?sH51Tbhsa9/fICAlqwnTQ24QuCtD1/sAr05GpHzBymTIpxcR0f8nq9U0F7XC?=
 =?us-ascii?Q?c8ADdh/AVZdfIdLOil0/zq3eIK9/q6ZVtzidD3vUqRKYRd5InOrssVMWyIae?=
 =?us-ascii?Q?arX8U427C+yU2QNsioGm2YJNYzbFtcjwoN/GJUYLskftXR7wIqtH6kwOY+od?=
 =?us-ascii?Q?Ilqg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8600584C81FFA74A8D69FD65D47BEA9F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5589
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	936aec29-18a7-4937-0e41-08d896020597
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H65eRrgrSsEErC713GTvZVn5Kytbwsq1VBCD0rdHt/30mCizkYfaMyLNkYkeuoLwlVR3GWBC+/Bv57oybMTVC4ZCYJYdXHUbXUAFs/V0koUz9tLNcy3TKpHmDZRCQpGDf391u5F7YbGdvDW/JBOj9cFP01r7DRwLQHC1F0hIkf988kIB4FY1XONrcPpi5p8rxpoG5lYoKZRqGw5D8jrd5LAaJdP+zWCVOT7zHC323or6Aa8Exjoltvogeo7KhKPKgOC5VKfOYQzIdPJJ3pRd0HlXJgLRTfzKqLfJL5opzlfEVWs4/YlIz9L8++KeLL8M22K/D1TBkS950pmZ5YZLHCpA0+ohB/uTLjTEVklCombdFUITbDWQCmkQk+xEiVO2mOOFFs3BrrMyrCpg+smE3Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(8936002)(316002)(47076004)(81166007)(356005)(86362001)(82740400003)(54906003)(6486002)(36756003)(6512007)(2906002)(53546011)(6506007)(8676002)(478600001)(26005)(336012)(70206006)(70586007)(2616005)(33656002)(83380400001)(82310400003)(5660300002)(4326008)(6862004)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 14:04:36.7051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa5cacd-804c-4159-a14a-08d89602098b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6147

Hi,

> On 30 Nov 2020, at 20:39, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> =
wrote:
>=20
>=20
> Bertrand Marquis writes:
>=20
>> Add support for cp10 exceptions decoding to be able to emulate the
>> values for VMFR0 and VMFR1 when TID3 bit of HSR is activated.
>> This is required for aarch32 guests accessing VMFR0 and VMFR1 using vmrs
>> and vmsr instructions.
>=20
> is it VMFR or MVFR? According to the reference manual, it is MVFR. Also,
> you are missing MVFR2.
>=20

Thanks for the typo and it is MVFR (I will fix that).

Regarding MVFR2, it is in fact missing for 32bit implementation and in fact=
 the
idea that it was not available on armv7 is wrong.

Thanks a lot for the finding, I will fix and test this and send a v3 patch.

Regards
Bertrand

>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: rebase
>> ---
>> xen/arch/arm/traps.c             |  5 +++++
>> xen/arch/arm/vcpreg.c            | 38 ++++++++++++++++++++++++++++++++
>> xen/include/asm-arm/perfc_defn.h |  1 +
>> xen/include/asm-arm/traps.h      |  1 +
>> 4 files changed, 45 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 22bd1bd4c6..28d9d64558 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -2097,6 +2097,11 @@ void do_trap_guest_sync(struct cpu_user_regs *reg=
s)
>>         perfc_incr(trap_cp14_dbg);
>>         do_cp14_dbg(regs, hsr);
>>         break;
>> +    case HSR_EC_CP10:
>> +        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>> +        perfc_incr(trap_cp10);
>> +        do_cp10(regs, hsr);
>> +        break;
>>     case HSR_EC_CP:
>>         GUEST_BUG_ON(!psr_mode_is_32bit(regs));
>>         perfc_incr(trap_cp);
>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> index d0c6406f34..9d6a36ca5d 100644
>> --- a/xen/arch/arm/vcpreg.c
>> +++ b/xen/arch/arm/vcpreg.c
>> @@ -634,6 +634,44 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const =
union hsr hsr)
>>     inject_undef_exception(regs, hsr);
>> }
>>=20
>> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
>> +{
>> +    const struct hsr_cp32 cp32 =3D hsr.cp32;
>> +    int regidx =3D cp32.reg;
>> +
>> +    if ( !check_conditional_instr(regs, hsr) )
>> +    {
>> +        advance_pc(regs, hsr);
>> +        return;
>> +    }
>> +
>> +    switch ( hsr.bits & HSR_CP32_REGS_MASK )
>> +    {
>> +    /*
>> +     * HSR.TID3 is trapping access to MVFR register used to identify th=
e
>> +     * VFP/Simd using VMRS/VMSR instructions.
>> +     * In this case MVFR2 is not supported as the instruction does not =
support
>> +     * it.
>> +     * Exception encoding is using MRC/MCR standard with the reg field =
in Crn
>> +     * as are declared MVFR0 and MVFR1 in cpregs.h
>> +     */
>> +    GENERATE_TID3_INFO(MVFR0, mvfr, 0)
>> +    GENERATE_TID3_INFO(MVFR1, mvfr, 1)
>> +
>> +    default:
>> +        gdprintk(XENLOG_ERR,
>> +                 "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n"=
,
>> +                 cp32.read ? "mrc" : "mcr",
>> +                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs=
->pc);
>> +        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
>> +                 hsr.bits & HSR_CP32_REGS_MASK);
>> +        inject_undef_exception(regs, hsr);
>> +        return;
>> +    }
>> +
>> +    advance_pc(regs, hsr);
>> +}
>> +
>> void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
>> {
>>     const struct hsr_cp cp =3D hsr.cp;
>> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perf=
c_defn.h
>> index 6a83185163..31f071222b 100644
>> --- a/xen/include/asm-arm/perfc_defn.h
>> +++ b/xen/include/asm-arm/perfc_defn.h
>> @@ -11,6 +11,7 @@ PERFCOUNTER(trap_cp15_64,  "trap: cp15 64-bit access")
>> PERFCOUNTER(trap_cp14_32,  "trap: cp14 32-bit access")
>> PERFCOUNTER(trap_cp14_64,  "trap: cp14 64-bit access")
>> PERFCOUNTER(trap_cp14_dbg, "trap: cp14 dbg access")
>> +PERFCOUNTER(trap_cp10,     "trap: cp10 access")
>> PERFCOUNTER(trap_cp,       "trap: cp access")
>> PERFCOUNTER(trap_smc32,    "trap: 32-bit smc")
>> PERFCOUNTER(trap_hvc32,    "trap: 32-bit hvc")
>> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
>> index 997c37884e..c4a3d0fb1b 100644
>> --- a/xen/include/asm-arm/traps.h
>> +++ b/xen/include/asm-arm/traps.h
>> @@ -62,6 +62,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const unio=
n hsr hsr);
>> void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr);
>> void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr);
>> void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr);
>> +void do_cp10(struct cpu_user_regs *regs, const union hsr hsr);
>> void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
>>=20
>> /* SMCCC handling */
>=20
>=20
> --=20
> Volodymyr Babchuk at EPAM


