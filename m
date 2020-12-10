Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF22D5F3E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49427.87407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNep-0001ZE-FU; Thu, 10 Dec 2020 15:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49427.87407; Thu, 10 Dec 2020 15:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNep-0001Yp-Aj; Thu, 10 Dec 2020 15:15:03 +0000
Received: by outflank-mailman (input) for mailman id 49427;
 Thu, 10 Dec 2020 15:15:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knNen-0001Yj-Jx
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:15:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d088c60-af83-4e44-b932-9485305839c2;
 Thu, 10 Dec 2020 15:15:00 +0000 (UTC)
Received: from AM7PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:20b:110::40)
 by AM5PR0801MB1635.eurprd08.prod.outlook.com (2603:10a6:203:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 15:14:58 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::81) by AM7PR04CA0030.outlook.office365.com
 (2603:10a6:20b:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:14:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:14:57 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Thu, 10 Dec 2020 15:14:57 +0000
Received: from c4b794d906eb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8FB8C28E-A6CB-436B-BFA7-330AB07BF829.1; 
 Thu, 10 Dec 2020 15:14:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4b794d906eb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:14:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6315.eurprd08.prod.outlook.com (2603:10a6:10:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 10 Dec
 2020 15:14:51 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:14:51 +0000
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
X-Inumbo-ID: 0d088c60-af83-4e44-b932-9485305839c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YytKpmL6/doYBIVnmXxqPX7JgX4MNepTG7tLrzrN/zI=;
 b=9lUbeGGr0tdoM8443rICWpQCTmWSdhd4wh8XhilKd8aCFjbrjpvAAwryAjvTuPoQ7Mnx0Ykc8Ev6nx0tYhMMFnVr5kycBjwzuY2hctE/gmwS2g5s972Qsci1Js5M7KcN9M3Lr9YHCathFiKzyfwUJA6Vo4b6DcFQXZ1htEIqfSw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 904c18ee44b05502
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvRiWwSp5ItKZlzKy8dWQulWHLJvE+mkDacqzgT1Mk0bmhd+SCw8TZ1ZeaCUwICAI4/LgTNXolv5rm51CwqaIii6FOkAZ50MtJZfYQqM8OML2ksImxtM6UC4z/Ul665DWWd/Qz2ZkEJw8sGYB5wOH5zkrV9y4wqf1ocg0CvGtOO+fvqB5c7eoErO+ucf/Kn7/WP6EkW3iZ6Cdl2gjHfxwj6IQg17/2QJEIyDMs5LeLW/7dCSsTdhgdQn8/ca/fSAm9HuBTcbWITIdaDGLeKPjzClLtIqSa/KYs+vAHfEcJEOe5fODVx1HxtYebc1Mwb6P1fC3933KDbzmu9DFVOF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YytKpmL6/doYBIVnmXxqPX7JgX4MNepTG7tLrzrN/zI=;
 b=hY19QwfWUHaCIzq5XmUPEG3zSBSySt2osyrfMCg6qo9/eDnB3O5Zw263BpGDv2MOJFJZlT4+xZeBL2hHefCRhXGxFup0YGe7wT7s/k4yffY3JrdBGndXSU8vDm6PseFsy5hXsY2nI0iVz6vM9ZlABihP8EXfygXRR1mDWcotnt5zhlqfctQIA2w/8tupnpBUtvX/biI52h5Pdrs/lllgxIYcj0NkfGW+2gRgeAdpxdZYcYrvKzfWpcrjTjFCDbwaXhsXcgWLz44odismUfwdcK5++tJFLRxxPeKp7BzNR5KIhmWUd9JZPxc+aerik5Ucf/bt98Fbrj4+GJJ+qnPgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YytKpmL6/doYBIVnmXxqPX7JgX4MNepTG7tLrzrN/zI=;
 b=9lUbeGGr0tdoM8443rICWpQCTmWSdhd4wh8XhilKd8aCFjbrjpvAAwryAjvTuPoQ7Mnx0Ykc8Ev6nx0tYhMMFnVr5kycBjwzuY2hctE/gmwS2g5s972Qsci1Js5M7KcN9M3Lr9YHCathFiKzyfwUJA6Vo4b6DcFQXZ1htEIqfSw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/7] xen/arm: Add ID registers and complete cpuinfo
Thread-Topic: [PATCH v3 1/7] xen/arm: Add ID registers and complete cpuinfo
Thread-Index: AQHWzklS6YSKOBiOok+g4tPLnYP0b6nvYnQAgAEPYQA=
Date: Thu, 10 Dec 2020 15:14:51 +0000
Message-ID: <8D31DCB1-3529-4785-A18B-CFE69CC0E846@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <aab713989bec4dc843bd513c03b305c83028851b.1607524536.git.bertrand.marquis@arm.com>
 <62484fa0-fa86-523a-12e0-54d69934d791@xen.org>
In-Reply-To: <62484fa0-fa86-523a-12e0-54d69934d791@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: b3f30379-2bdb-4ef3-337e-08d89d1e5b60
x-ms-traffictypediagnostic: DBBPR08MB6315:|AM5PR0801MB1635:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1635505893B8FF572F0B22F89DCB0@AM5PR0801MB1635.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +1KT2X5yRQnp1Fr6Gf3dOgpKgDDj6HSfIm67YMweWbIc5kcpPCapc0wijevfZHkjIlmGLUyB8uhQ22mEsq0jf/xPX7Rs+18fvJBmwlUupzpDF5AItjer1t1QkWug41rimc/8u+4Uit54H3kOKP9DNlZCoGpLxQfyEZ4HrFw27r8agR9RnEBGh9plo/yJSvLOUfkOnIyVaBPM6bpy9jnVXTLLhvh01CRYc6LWyK3LKkMa+PkOiFagINPjN7otzVac1WA99X8BgzjVSEYH0OxSEa9T3m7XvOkAjRj73EVN46pWDLHXUcVOcLCCuzJST73sz+fLTjg7VWXUvToXFYAmF1T1Bmv2qPoKD7957qNqwQNX9V6q6bj/bGVBkwtF0d1O
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(66556008)(186003)(6486002)(54906003)(6512007)(53546011)(6916009)(4326008)(478600001)(2906002)(64756008)(26005)(66476007)(316002)(2616005)(91956017)(8936002)(76116006)(30864003)(86362001)(66446008)(83380400001)(71200400001)(8676002)(36756003)(6506007)(33656002)(5660300002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?3xpXuNfhMRAeT9hNxMVGoHwVlfTh836TkQtnQaXiPv86M1w3cbrDlhmVID79?=
 =?us-ascii?Q?rbiDzW0wn5dvM6ddYmetAlKcFMgNxoL4JmXhZLJkX1oTCGs+IOg1ZljLIpvN?=
 =?us-ascii?Q?mjPYpcfpWQrxXnJFfwb2mpA7rCFT/YkfWXY6a9r/XZa/q+LaF2oX8QTtvTNV?=
 =?us-ascii?Q?oHRRyKMZ8kVA8bGQmGIo60AFdhDL97w0pwAM0Bh+UuWPBhaz7PNNAWeUn/IY?=
 =?us-ascii?Q?3ZSJibYUf9e1vLaxukiIDPfM8qjdeoxYmCBA7Jmp3zD2wN2hu09l+68o8TxR?=
 =?us-ascii?Q?Ajwl4JdC17WAoaGm3+2XgfRgK7q1Dtbdv/LtCpTaiMs++AiDWKr+2EOC3K00?=
 =?us-ascii?Q?HMjc+3FzFv6IVCXuUrSzwdeJCSW9niLiHeXtxh4GcA6EWEyMVnsfSYyLGofc?=
 =?us-ascii?Q?2xfkonjsh1/p3MGzwRWdpEyfi63whDwCTrqOj7qIy6IXsaNORodEuYfHTVLW?=
 =?us-ascii?Q?9sZX0ehLHaMrGc+9XcIYBIPesEryRbUHCnRJCR27iK+3IOGoLimlGcG8fZ0P?=
 =?us-ascii?Q?7QF6UCZWgOQTn+8DOPfMYWaSLmL6inrj8Rp+oT483ZdJ/z3EYQUmXIR/Y/jV?=
 =?us-ascii?Q?vnLpTn4UJuwHR7xa2AV/nZWQu9PNY+gpMgin9elQekOthsvDV1FyiUeaM5z9?=
 =?us-ascii?Q?4xNYeqqExDIYF7mRh93/B5RVusvrXlF73pCOUlrH0xJPlzw8KMWdhDD34S82?=
 =?us-ascii?Q?lCJkCXB+R40hK8WXKiW/JGhi1v1sZ+mZAkrxRk+ZUSG7nE6qV2Waz0fTaJpi?=
 =?us-ascii?Q?Jticx8XefLB4DfjeGBTpnkW5D+9QZWTzSqM4YbiAv3n3iyyRT+xzW06A5aHt?=
 =?us-ascii?Q?63WMPYgrBBh/PVS2E5zwZz+thcTWCDuBbIWon9ZxDhcjjsFU0Qhu3W+VfoKO?=
 =?us-ascii?Q?FxoZu80Qt70zX6pYPsw0He+tPZecAqH+CPhz0kJSNw7CijMUCNR6PW3jyaS4?=
 =?us-ascii?Q?zKjxGEWvn3gaPSSHWGarDNhm8P6E4hroCG2REnVC+OKB3anG2fdsTF6/Puof?=
 =?us-ascii?Q?weQE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD3B0D2549BBA8409E5238F448706022@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6315
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3b86ad5-2d0d-4784-e564-08d89d1e578d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zF25z1B0davgUGsdWA8IcR3yZ86mAHda33rfw6bT8lvkczc3TAUQYkE8hrHIawlB3tcAmbN+wPXg+ZlCkanmszPCDhg+17uprkGjd99PD6Rr4CeqUjN+WcnXfgFRLaI3ZB26xpMaVGLIL9JWyiyTn0S7+cL571dF4pp1hYm9ghtKuYyI44GJ+EhtAgOl3jMIjLKK3Orxjmb6+P+puISvcsTjliPWrTiomNIx+UojnIW4yr1y3+y5SkKt9vSpdjVIw9xcQHZQaKmKnc4BkSTrlbI8HISLmSFSFCgkpbhvJYvQ9e2cIqKrhDgiHUhU/j2pUf5Tsf/TZ+tNML7+NdXMnwHaMUu758gptPQFLdFegIQB1HGhOMMdi7aD0C+gcep+IhZ/L1YtUDykgi4yInhojQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(53546011)(81166007)(107886003)(186003)(26005)(356005)(6862004)(86362001)(33656002)(82310400003)(6512007)(5660300002)(70586007)(6506007)(4326008)(47076004)(6486002)(8676002)(54906003)(336012)(30864003)(2906002)(8936002)(82740400003)(316002)(70206006)(83380400001)(36756003)(478600001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:14:57.8856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f30379-2bdb-4ef3-337e-08d89d1e5b60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1635

Hi Julien,

> On 9 Dec 2020, at 23:03, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 09/12/2020 16:30, Bertrand Marquis wrote:
>> Add definition and entries in cpuinfo for ID registers introduced in
>> newer Arm Architecture reference manual:
>> - ID_PFR2: processor feature register 2
>> - ID_DFR1: debug feature register 1
>> - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
>> - ID_ISA6: ISA Feature register 6
>> Add more bitfield definitions in PFR fields of cpuinfo.
>> Add MVFR2 register definition for aarch32.
>> Add mvfr values in cpuinfo.
>> Add some registers definition for arm64 in sysregs as some are not
>> always know by compilers.
>> Initialize the new values added in cpuinfo in identify_cpu during init.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2:
>>   Fix dbg32 table size and add proper initialisation of the second entry
>>   of the table by reading ID_DFR1 register.
>> Changes in V3:
>>   Fix typo in commit title
>>   Add MVFR2 definition and handling on aarch32 and remove specific case
>>   for mvfr field in cpuinfo (now the same on arm64 and arm32).
>>   Add MMFR4 definition if not known by the compiler.
>> ---
>>  xen/arch/arm/cpufeature.c           | 18 ++++++++++
>>  xen/include/asm-arm/arm64/sysregs.h | 28 +++++++++++++++
>>  xen/include/asm-arm/cpregs.h        | 12 +++++++
>>  xen/include/asm-arm/cpufeature.h    | 56 ++++++++++++++++++++++++-----
>>  4 files changed, 105 insertions(+), 9 deletions(-)
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 44126dbf07..bc7ee5ac95 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -114,15 +114,20 @@ void identify_cpu(struct cpuinfo_arm *c)
>>            c->mm64.bits[0]  =3D READ_SYSREG64(ID_AA64MMFR0_EL1);
>>          c->mm64.bits[1]  =3D READ_SYSREG64(ID_AA64MMFR1_EL1);
>> +        c->mm64.bits[2]  =3D READ_SYSREG64(ID_AA64MMFR2_EL1);
>>            c->isa64.bits[0] =3D READ_SYSREG64(ID_AA64ISAR0_EL1);
>>          c->isa64.bits[1] =3D READ_SYSREG64(ID_AA64ISAR1_EL1);
>> +
>> +        c->zfr64.bits[0] =3D READ_SYSREG64(ID_AA64ZFR0_EL1);
>>  #endif
>>            c->pfr32.bits[0] =3D READ_SYSREG32(ID_PFR0_EL1);
>>          c->pfr32.bits[1] =3D READ_SYSREG32(ID_PFR1_EL1);
>> +        c->pfr32.bits[2] =3D READ_SYSREG32(ID_PFR2_EL1);
>>            c->dbg32.bits[0] =3D READ_SYSREG32(ID_DFR0_EL1);
>> +        c->dbg32.bits[1] =3D READ_SYSREG32(ID_DFR1_EL1);
>>            c->aux32.bits[0] =3D READ_SYSREG32(ID_AFR0_EL1);
>>  @@ -130,6 +135,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>>          c->mm32.bits[1]  =3D READ_SYSREG32(ID_MMFR1_EL1);
>>          c->mm32.bits[2]  =3D READ_SYSREG32(ID_MMFR2_EL1);
>>          c->mm32.bits[3]  =3D READ_SYSREG32(ID_MMFR3_EL1);
>> +        c->mm32.bits[4]  =3D READ_SYSREG32(ID_MMFR4_EL1);
>> +        c->mm32.bits[5]  =3D READ_SYSREG32(ID_MMFR5_EL1);
>=20
> Please don't introduce any more use of READ_SYSREG32(), they are wrong on=
 Armv8 because system registers are always 64-bit.

I followed the existing implementation but ...

>=20
>>            c->isa32.bits[0] =3D READ_SYSREG32(ID_ISAR0_EL1);
>>          c->isa32.bits[1] =3D READ_SYSREG32(ID_ISAR1_EL1);
>> @@ -137,6 +144,17 @@ void identify_cpu(struct cpuinfo_arm *c)
>>          c->isa32.bits[3] =3D READ_SYSREG32(ID_ISAR3_EL1);
>>          c->isa32.bits[4] =3D READ_SYSREG32(ID_ISAR4_EL1);
>>          c->isa32.bits[5] =3D READ_SYSREG32(ID_ISAR5_EL1);
>> +        c->isa32.bits[6] =3D READ_SYSREG32(ID_ISAR6_EL1);
>> +
>> +#ifdef CONFIG_ARM_64
>> +        c->mvfr.bits[0] =3D READ_SYSREG64(MVFR0_EL1);
>> +        c->mvfr.bits[1] =3D READ_SYSREG64(MVFR1_EL1);
>> +        c->mvfr.bits[2] =3D READ_SYSREG64(MVFR2_EL1);
>> +#else
>> +        c->mvfr.bits[0] =3D READ_CP32(MVFR0);
>> +        c->mvfr.bits[1] =3D READ_CP32(MVFR1);
>> +        c->mvfr.bits[2] =3D READ_CP32(MVFR2);
>> +#endif
>=20
> READ_SYSREG() will do the job to either use READ_SYSREG64() or READ_CP32(=
) depending on the arch used.

.. I can modify the ones I added and the existing ones to user READ_SYSREG =
instead.
Please confirm if you want me to do that.

>=20
>>  }
>>    /*
>> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/a=
rm64/sysregs.h
>> index c60029d38f..077fd95fb7 100644
>> --- a/xen/include/asm-arm/arm64/sysregs.h
>> +++ b/xen/include/asm-arm/arm64/sysregs.h
>> @@ -57,6 +57,34 @@
>>  #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>>  #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>>  +/*
>> + * Define ID coprocessor registers if they are not
>> + * already defined by the compiler.
>> + *
>> + * Values picked from linux kernel
>> + */
>> +#ifndef ID_AA64MMFR2_EL1
>=20
> I am a bit puzzled how this meant to work. Will the libc/compiler headers=
 define ID_AA64MMFR2_EL1?

I tested this and if the compiler has a definition for the register, I am n=
ot entering the ifndef.
So there is no header defining this but if the compiler has the definition =
for this the ifndef will
not be entered.

>=20
>> +#define ID_AA64MMFR2_EL1            S3_0_C0_C7_2
>> +#endif
>> +#ifndef ID_PFR2_EL1
>> +#define ID_PFR2_EL1                 S3_0_C0_C3_4
>> +#endif
>> +#ifndef ID_MMFR4_EL1
>> +#define ID_MMFR4_EL1                S3_0_C0_C2_6
>> +#endif
>> +#ifndef ID_MMFR5_EL1
>> +#define ID_MMFR5_EL1                S3_0_C0_C3_6
>> +#endif
>> +#ifndef ID_ISAR6_EL1
>> +#define ID_ISAR6_EL1                S3_0_C0_C2_7
>> +#endif
>> +#ifndef ID_AA64ZFR0_EL1
>> +#define ID_AA64ZFR0_EL1             S3_0_C0_C4_4
>> +#endif
>> +#ifndef ID_DFR1_EL1
>> +#define ID_DFR1_EL1                 S3_0_C0_C3_5
>> +#endif
>> +
>>  /* Access to system registers */
>>    #define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
>> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
>> index 8fd344146e..2690ddeb7a 100644
>> --- a/xen/include/asm-arm/cpregs.h
>> +++ b/xen/include/asm-arm/cpregs.h
>> @@ -63,6 +63,8 @@
>>  #define FPSID           p10,7,c0,c0,0   /* Floating-Point System ID Reg=
ister */
>>  #define FPSCR           p10,7,c1,c0,0   /* Floating-Point Status and Co=
ntrol Register */
>>  #define MVFR0           p10,7,c7,c0,0   /* Media and VFP Feature Regist=
er 0 */
>> +#define MVFR1           p10,7,c6,c0,0   /* Media and VFP Feature Regist=
er 1 */
>> +#define MVFR2           p10,7,c5,c0,0   /* Media and VFP Feature Regist=
er 2 */
>>  #define FPEXC           p10,7,c8,c0,0   /* Floating-Point Exception Con=
trol Register */
>>  #define FPINST          p10,7,c9,c0,0   /* Floating-Point Instruction R=
egister */
>>  #define FPINST2         p10,7,c10,c0,0  /* Floating-point Instruction R=
egister 2 */
>> @@ -108,18 +110,23 @@
>>  #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Regi=
ster */
>>  #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0=
 */
>>  #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1=
 */
>> +#define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2=
 */
>>  #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
>> +#define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
>>  #define ID_AFR0         p15,0,c0,c1,3   /* Auxiliary Feature Register 0=
 */
>>  #define ID_MMFR0        p15,0,c0,c1,4   /* Memory Model Feature Registe=
r 0 */
>>  #define ID_MMFR1        p15,0,c0,c1,5   /* Memory Model Feature Registe=
r 1 */
>>  #define ID_MMFR2        p15,0,c0,c1,6   /* Memory Model Feature Registe=
r 2 */
>>  #define ID_MMFR3        p15,0,c0,c1,7   /* Memory Model Feature Registe=
r 3 */
>> +#define ID_MMFR4        p15,0,c0,c2,6   /* Memory Model Feature Registe=
r 4 */
>> +#define ID_MMFR5        p15,0,c0,c3,6   /* Memory Model Feature Registe=
r 5 */
>>  #define ID_ISAR0        p15,0,c0,c2,0   /* ISA Feature Register 0 */
>>  #define ID_ISAR1        p15,0,c0,c2,1   /* ISA Feature Register 1 */
>>  #define ID_ISAR2        p15,0,c0,c2,2   /* ISA Feature Register 2 */
>>  #define ID_ISAR3        p15,0,c0,c2,3   /* ISA Feature Register 3 */
>>  #define ID_ISAR4        p15,0,c0,c2,4   /* ISA Feature Register 4 */
>>  #define ID_ISAR5        p15,0,c0,c2,5   /* ISA Feature Register 5 */
>> +#define ID_ISAR6        p15,0,c0,c2,7   /* ISA Feature Register 6 */
>>  #define CCSIDR          p15,1,c0,c0,0   /* Cache Size ID Registers */
>>  #define CLIDR           p15,1,c0,c0,1   /* Cache Level ID Register */
>>  #define CSSELR          p15,2,c0,c0,0   /* Cache Size Selection Registe=
r */
>> @@ -312,18 +319,23 @@
>>  #define HSTR_EL2                HSTR
>>  #define ID_AFR0_EL1             ID_AFR0
>>  #define ID_DFR0_EL1             ID_DFR0
>> +#define ID_DFR1_EL1             ID_DFR1
>>  #define ID_ISAR0_EL1            ID_ISAR0
>>  #define ID_ISAR1_EL1            ID_ISAR1
>>  #define ID_ISAR2_EL1            ID_ISAR2
>>  #define ID_ISAR3_EL1            ID_ISAR3
>>  #define ID_ISAR4_EL1            ID_ISAR4
>>  #define ID_ISAR5_EL1            ID_ISAR5
>> +#define ID_ISAR6_EL1            ID_ISAR6
>>  #define ID_MMFR0_EL1            ID_MMFR0
>>  #define ID_MMFR1_EL1            ID_MMFR1
>>  #define ID_MMFR2_EL1            ID_MMFR2
>>  #define ID_MMFR3_EL1            ID_MMFR3
>> +#define ID_MMFR4_EL1            ID_MMFR4
>> +#define ID_MMFR5_EL1            ID_MMFR5
>>  #define ID_PFR0_EL1             ID_PFR0
>>  #define ID_PFR1_EL1             ID_PFR1
>> +#define ID_PFR2_EL1             ID_PFR2
>>  #define IFSR32_EL2              IFSR
>>  #define MDCR_EL2                HDCR
>>  #define MIDR_EL1                MIDR
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index c7b5052992..6cf83d775b 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -148,6 +148,7 @@ struct cpuinfo_arm {
>>      union {
>>          uint64_t bits[2];
>>          struct {
>> +            /* PFR0 */
>>              unsigned long el0:4;
>>              unsigned long el1:4;
>>              unsigned long el2:4;
>> @@ -155,9 +156,23 @@ struct cpuinfo_arm {
>>              unsigned long fp:4;   /* Floating Point */
>>              unsigned long simd:4; /* Advanced SIMD */
>>              unsigned long gic:4;  /* GIC support */
>> -            unsigned long __res0:28;
>> +            unsigned long ras:4;
>> +            unsigned long sve:4;
>> +            unsigned long sel2:4;
>> +            unsigned long mpam:4;
>> +            unsigned long amu:4;
>> +            unsigned long dit:4;
>> +            unsigned long __res0:4;
>>              unsigned long csv2:4;
>> -            unsigned long __res1:4;
>> +            unsigned long cvs3:4;
>> +
>> +            /* PFR1 */
>> +            unsigned long bt:4;
>> +            unsigned long ssbs:4;
>> +            unsigned long mte:4;
>> +            unsigned long ras_frac:4;
>> +            unsigned long mpam_frac:4;
>> +            unsigned long __res1:44;
>>          };
>>      } pfr64;
>>  @@ -170,7 +185,7 @@ struct cpuinfo_arm {
>>      } aux64;
>>        union {
>> -        uint64_t bits[2];
>> +        uint64_t bits[3];
>>          struct {
>>              unsigned long pa_range:4;
>>              unsigned long asid_bits:4;
>> @@ -190,6 +205,8 @@ struct cpuinfo_arm {
>>              unsigned long pan:4;
>>              unsigned long __res1:8;
>>              unsigned long __res2:32;
>> +
>> +            unsigned long __res3:64;
>>          };
>>      } mm64;
>>  @@ -197,6 +214,10 @@ struct cpuinfo_arm {
>>          uint64_t bits[2];
>>      } isa64;
>>  +    struct {
>> +        uint64_t bits[1];
>> +    } zfr64;
>> +
>>  #endif
>>        /*
>> @@ -204,25 +225,38 @@ struct cpuinfo_arm {
>>       * when running in 32-bit mode.
>>       */
>>      union {
>> -        uint32_t bits[2];
>> +        uint32_t bits[3];
>>          struct {
>> +            /* PFR0 */
>>              unsigned long arm:4;
>>              unsigned long thumb:4;
>>              unsigned long jazelle:4;
>>              unsigned long thumbee:4;
>> -            unsigned long __res0:16;
>> +            unsigned long csv2:4;
>> +            unsigned long amu:4;
>> +            unsigned long dit:4;
>> +            unsigned long ras:4;
>>  +            /* PFR1 */
>>              unsigned long progmodel:4;
>>              unsigned long security:4;
>>              unsigned long mprofile:4;
>>              unsigned long virt:4;
>>              unsigned long gentimer:4;
>> -            unsigned long __res1:12;
>> +            unsigned long sec_frac:4;
>> +            unsigned long virt_frac:4;
>> +            unsigned long gic:4;
>> +
>> +            /* PFR2 */
>> +            unsigned long csv3:4;
>> +            unsigned long ssbs:4;
>> +            unsigned long ras_frac:4;
>> +            unsigned long __res2:20;
>>          };
>>      } pfr32;
>>        struct {
>> -        uint32_t bits[1];
>> +        uint32_t bits[2];
>>      } dbg32;
>>        struct {
>> @@ -230,12 +264,16 @@ struct cpuinfo_arm {
>>      } aux32;
>>        struct {
>> -        uint32_t bits[4];
>> +        uint32_t bits[6];
>>      } mm32;
>>        struct {
>> -        uint32_t bits[6];
>> +        uint32_t bits[7];
>>      } isa32;
>> +
>> +    struct {
>> +        uint64_t bits[3];
>=20
> Shouldn't this be register_t?

I followed the scheme of the rest of the structure which
is always using uint64_t or uint32_t for bits definitions.

Why should I use register_t type for this one ?

Cheers
Bertrand

>=20
>> +    } mvfr;
>>  };
>>    extern struct cpuinfo_arm boot_cpu_data;
>=20
> --=20
> Julien Grall


