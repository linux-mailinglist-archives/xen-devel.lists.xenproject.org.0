Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7240E6E2465
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 15:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521142.809485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnJdJ-0003zr-7c; Fri, 14 Apr 2023 13:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521142.809485; Fri, 14 Apr 2023 13:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnJdJ-0003wO-4C; Fri, 14 Apr 2023 13:38:33 +0000
Received: by outflank-mailman (input) for mailman id 521142;
 Fri, 14 Apr 2023 13:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlWx=AF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pnJdI-0003wI-5h
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 13:38:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3791077-dac9-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 15:38:28 +0200 (CEST)
Received: from DUZPR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::18) by DBBPR08MB5995.eurprd08.prod.outlook.com
 (2603:10a6:10:20b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 13:38:26 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::29) by DUZPR01CA0164.outlook.office365.com
 (2603:10a6:10:4b3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 13:38:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Fri, 14 Apr 2023 13:38:26 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Fri, 14 Apr 2023 13:38:26 +0000
Received: from edd4ec2fb1a0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA36389E-0F1A-45DD-95E7-C4F68C0D5028.1; 
 Fri, 14 Apr 2023 13:38:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id edd4ec2fb1a0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 13:38:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9815.eurprd08.prod.outlook.com (2603:10a6:20b:614::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 13:38:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 13:38:12 +0000
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
X-Inumbo-ID: a3791077-dac9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogctp1zZxuHa8uxipGyJGj0grO+wa7ak43rkcB7fDYo=;
 b=wjXLIbuKeaKduD74cNxLC/HcBsd+kJc5YgO3KEecjUrsePjHtKyC/TTTXLdQp6ILXAbyapK9X57zLhVsNqQLyGLy1wL/UWi7m0HtseK15sJ0PiVYUdM84xkv6yCMQf3z16U7yx2ewtlt3Fwzkt+WVPaqjuh7DqLZg79c1yN1qxE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2afed1d247fdabf3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jyay1o0h0OidO6TELjBmi/U7fLiWNdWda92Y7hqdiB3Tw23cFlCLbovy0g2P29+Enriv8OVHUgHEnSPDKHaJUQ7VMjGkvYhbkchoN7sRY5oDtND4ZxUTLYXQJgkJps4rEyXd1GQt/HDX4WJgvLxgfD3NfgFLIFmMAoVVI2OU/jf6aOrlSjjXIOch7hWhR6zcb2BTuzgq/ioJ1o5TvZja481uFtY/we2PegC/1KLwKg8jJKTGNwjVKeP2opPw+XvLLWur2x1TUhS9ogVF2q+NQ1FBsazwdixnyjF6wuDdgnuemyf7R0yc9ka5Cd/OjtE2CCOCDKUbUn3Y23E/fGP3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogctp1zZxuHa8uxipGyJGj0grO+wa7ak43rkcB7fDYo=;
 b=JYQLZjiwRgNgsk33n/zkRHoFkoVhpoirOcFsusmD5NLJzIpbZB0g8x/ZYanL6oEIWt4HBLpm0ZfgV28hpeNABUPGho6camYN93hEEr3atOv1gvFkk/vPAlGqLwyGK9LiqQ/8OvumaJ5lw5U61MOmuIrDO9DkIwJdYeH+DCpbhkadDYR+t2pzWNoGG4zbpcDETlFOitkWwA+U6SJDTt4pCDeoBT8dGEf+eFwekjTAqiNqmgJqNR5lDKqal06hTxRPSym5KFy0EGJkySoVjJgxJIm0o4vIodsGtmmRParnFpFtfhPle/Fa8Tv+3f9ZZCyNa073zzwYbKGJp7Ut0MdAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogctp1zZxuHa8uxipGyJGj0grO+wa7ak43rkcB7fDYo=;
 b=wjXLIbuKeaKduD74cNxLC/HcBsd+kJc5YgO3KEecjUrsePjHtKyC/TTTXLdQp6ILXAbyapK9X57zLhVsNqQLyGLy1wL/UWi7m0HtseK15sJ0PiVYUdM84xkv6yCMQf3z16U7yx2ewtlt3Fwzkt+WVPaqjuh7DqLZg79c1yN1qxE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v5 01/12] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZbSQnZHhi12xjyUK0b5ypet9SdK8pMcIAgAGeBQCAAAKagA==
Date: Fri, 14 Apr 2023 13:38:11 +0000
Message-ID: <6F8AEB0D-5DB4-44EB-BC64-F8488D4DE109@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-2-luca.fancellu@arm.com>
 <190AEC88-68BE-4DEA-84D5-9DDF0F63A365@arm.com>
 <8C042AAE-8256-488C-92C6-E4C0B5DEB3C1@arm.com>
In-Reply-To: <8C042AAE-8256-488C-92C6-E4C0B5DEB3C1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9815:EE_|DBAEUR03FT031:EE_|DBBPR08MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: cd689704-318c-4190-b9e1-08db3ced8672
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ol9Er6Swuyoxq2YaWBQj3JwDEKGzYDPSxCm+aSyFacfsN++i6ZNAMRDIwe1n16pMAgSvg1fBjjUfl2FGk6Fb32ioYAp2X8nM4FwchD00erLNpSBNQ+Jhsb4OQhXbqp64IjoIviYIXC+vSFyaO0gzOFQEG/Yuah2HxNfySb59l3iscKg5/83XuSF2KraLv0Fj8qLl6yOccoRo1Oubhi6NIn4O9gDyvEk8WC9VDb5Axhm02HNfM1xTmp+9F8ZsjCDQ9lWhW4qaGSW7oLNCqkmjD3uoXU0NzdMwGKAJYskCfYHMaDu5dC4NfkIl5vxtqN1xVlCZuIgFsZ1rA36TDSwOdEN/LM18XKTIGkD3S7SUa35hM2rMKOIFmSvKbhG2AbrLNo0Dd8Gav4jrr3pZ6H6uljYRxIxro/VELN9YfL+9Am32niATCk4JDeqtl8c9d/IMShAhMK0rkYlFrOHnP6A8mZlYftuxEVZPl3L6TpGizwexW5HYoVbd7vNE4CaxO4V6htem0eVOT5ywdHUcsMZWIqNQ0JPr4wCzqXY86wg1SkgUzwe65XQUoQ/QzH4OhMVsJOocZuRD3jLTFQpJNrDFDpwypBDdVjlkGEQptkC9SRT9vth6zgFQifOyl6OZDDcZ9apVpUI/+K9bNontzXmJTw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(38070700005)(26005)(186003)(6512007)(6506007)(53546011)(6636002)(54906003)(37006003)(33656002)(478600001)(122000001)(2906002)(8676002)(8936002)(6862004)(83380400001)(41300700001)(5660300002)(2616005)(38100700002)(4326008)(316002)(66946007)(66556008)(91956017)(76116006)(66476007)(64756008)(66446008)(86362001)(6486002)(71200400001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5048B202B74CC746961C6F6C754AFA56@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9815
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec96df73-73ff-4436-74e2-08db3ced7dca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xoc0FhZyHJZhaq4Rlt77haDNYq1EB2NwtrwBHcw0LiBrfL0ZEm3ZeJkFDTZSAhU5rs+2FoVSnhcmrgYwBqyW4124ga+OYsd8NTSt6/kWmr0PfC7zWVBVZgSEzYtkChxYigxq04qVle3YHXq8869npEJ2ysORfZz8+yw5Bb2aaT4Fouc0V/PjwJwD5ge6Bc5cm9iDgZp5avve+qqR0WNDqdWxI1zfc5w8/ksLFAVu0Ytk8v1MRUUBuLxIttEWJOzSMn7pmB+Y16u72PrzOLX/4ZmBwOoO+oPMmn/d7UjauuEtP0YOkDRsmgdS69SNaZnRKFQfc7Hp+SGIIqXGbn6IgfB4JtO+LN62dqVRLl3c+hpzRlnHeawECpJBgbMoqOi++AkVby2tsGHdcPOiGZHB4gOsmgwaRssE5OxSDNbP6L+xOvTwBSMmI2/evr7yoCbt2hx21O3e0SWZYfoA9rKdC9EyxQYUZGM6RdUkN7BQ89gA/cRRHwAzrIo+tCICllJ5O88iKQP5AXHcIPzm47EnP5jTyvcC+IFgUx6+nb/3fmlr0nE9eb2Iqbfn23Nw7riEwMRmewnZQEQwZIa2Nx4XNfoo98DgpLeeECgF4EJgxozq5aKAG4tS41c+X11RWMmzXVygArGbCzn97zn1vcnH/2dA3zLmrerJh9DZfFXg8JASj+keLNtxe74cxxkRFkGMWbVOUqrKvDbBDwmsxR/h8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(316002)(70206006)(70586007)(4326008)(8676002)(6862004)(8936002)(2906002)(41300700001)(5660300002)(83380400001)(6636002)(478600001)(54906003)(37006003)(40460700003)(86362001)(336012)(107886003)(36756003)(26005)(6512007)(33656002)(2616005)(186003)(36860700001)(6506007)(82310400005)(6486002)(356005)(47076005)(53546011)(82740400003)(40480700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 13:38:26.3482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd689704-318c-4190-b9e1-08db3ced8672
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5995

Hi Luca,

> On 14 Apr 2023, at 15:28, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>=20
>=20
>> On 13 Apr 2023, at 13:47, Bertrand Marquis <Bertrand.Marquis@arm.com> wr=
ote:
>>=20
>> Hi Luca,
>>=20
>>> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>=20
>>> Enable Xen to handle the SVE extension, add code in cpufeature module
>>> to handle ZCR SVE register, disable trapping SVE feature on system
>>> boot only when SVE resources are accessed.
>>> While there, correct coding style for the comment on coprocessor
>>> trapping.
>>>=20
>>> Now cptr_el2 is part of the domain context and it will be restored
>>> on context switch, this is a preparation for saving the SVE context
>>> which will be part of VFP operations, so restore it before the call
>>> to save VFP registers.
>>> To save an additional isb barrier, restore cptr_el2 before an
>>> existing isb barrier and move the call for saving VFP context after
>>> that barrier.
>>>=20
>>> Change the KConfig entry to make ARM64_SVE symbol selectable, by
>>> default it will be not selected.
>>>=20
>>> Create sve module and sve_asm.S that contains assembly routines for
>>> the SVE feature, this code is inspired from linux and it uses
>>> instruction encoding to be compatible with compilers that does not
>>> support SVE.
>>>=20
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes from v4:
>>> - don't use fixed types in vl_to_zcr, forgot to address that in
>>> v3, by mistake I changed that in patch 2, fixing now (Jan)
>>> Changes from v3:
>>> - no changes
>>> Changes from v2:
>>> - renamed sve_asm.S in sve-asm.S, new files should not contain
>>> underscore in the name (Jan)
>>> Changes from v1:
>>> - Add assert to vl_to_zcr, it is never called with vl=3D=3D0, but just
>>> to be sure it won't in the future.
>>> Changes from RFC:
>>> - Moved restoring of cptr before an existing barrier (Julien)
>>> - Marked the feature as unsupported for now (Julien)
>>> - Trap and un-trap only when using SVE resources in
>>> compute_max_zcr() (Julien)
>>> ---
>>> xen/arch/arm/Kconfig                     | 10 +++--
>>> xen/arch/arm/arm64/Makefile              |  1 +
>>> xen/arch/arm/arm64/cpufeature.c          |  7 ++--
>>> xen/arch/arm/arm64/sve-asm.S             | 48 +++++++++++++++++++++++
>>> xen/arch/arm/arm64/sve.c                 | 50 ++++++++++++++++++++++++
>>> xen/arch/arm/cpufeature.c                |  6 ++-
>>> xen/arch/arm/domain.c                    |  9 +++--
>>> xen/arch/arm/include/asm/arm64/sve.h     | 43 ++++++++++++++++++++
>>> xen/arch/arm/include/asm/arm64/sysregs.h |  1 +
>>> xen/arch/arm/include/asm/cpufeature.h    | 14 +++++++
>>> xen/arch/arm/include/asm/domain.h        |  1 +
>>> xen/arch/arm/include/asm/processor.h     |  2 +
>>> xen/arch/arm/setup.c                     |  5 ++-
>>> xen/arch/arm/traps.c                     | 28 +++++++------
>>> 14 files changed, 201 insertions(+), 24 deletions(-)
>>> create mode 100644 xen/arch/arm/arm64/sve-asm.S
>>> create mode 100644 xen/arch/arm/arm64/sve.c
>>> create mode 100644 xen/arch/arm/include/asm/arm64/sve.h
>>>=20
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 239d3aed3c7f..41f45d8d1203 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -112,11 +112,15 @@ config ARM64_PTR_AUTH
>>> This feature is not supported in Xen.
>>>=20
>>> config ARM64_SVE
>>> - def_bool n
>>> + bool "Enable Scalar Vector Extension support (UNSUPPORTED)" if UNSUPP=
ORTED
>>> depends on ARM_64
>>> help
>>> -  Scalar Vector Extension support.
>>> -  This feature is not supported in Xen.
>>> +  Scalar Vector Extension (SVE/SVE2) support for guests.
>>=20
>> I would prevent to mention SVE2 here unless both versions of SVE are sup=
ported with this config.
>> Is it the case ?
>=20
> Hi Bertrand,
>=20
> Yes both versions of SVE are supported with this config, SVE2 is a supers=
et of SVE that includes new
> instructions, but the work done in this serie for registers settings and =
context switch will apply to both
> versions.

Good so this is ok then.

You can add my:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


>=20
>>=20
>> Cheers
>> Bertrand



