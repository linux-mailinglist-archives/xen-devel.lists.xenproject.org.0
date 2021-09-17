Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C62A40F381
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 09:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189068.338549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8an-0004Lf-Iq; Fri, 17 Sep 2021 07:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189068.338549; Fri, 17 Sep 2021 07:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8an-0004JV-Fb; Fri, 17 Sep 2021 07:47:29 +0000
Received: by outflank-mailman (input) for mailman id 189068;
 Fri, 17 Sep 2021 07:47:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HF0=OH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mR8am-0004JP-Nc
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 07:47:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81164218-178b-11ec-b671-12813bfff9fa;
 Fri, 17 Sep 2021 07:47:28 +0000 (UTC)
Received: from AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) by VI1PR08MB3248.eurprd08.prod.outlook.com
 (2603:10a6:803:4e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 07:47:21 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::63) by AM5PR1001CA0072.outlook.office365.com
 (2603:10a6:206:15::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 17 Sep 2021 07:47:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 07:47:21 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Fri, 17 Sep 2021 07:47:20 +0000
Received: from e37737cd780c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6543172F-1B1F-495F-81A6-4B89BDD3F46A.1; 
 Fri, 17 Sep 2021 07:47:14 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e37737cd780c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Sep 2021 07:47:14 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB7033.eurprd08.prod.outlook.com (2603:10a6:102:205::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 07:47:13 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Fri, 17 Sep 2021
 07:47:13 +0000
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
X-Inumbo-ID: 81164218-178b-11ec-b671-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05eRu5Hk5gKvbYa4WlKCEx0v3OIBRFb4f0ekRTzeEQI=;
 b=B7aoeHIJ0/9IOvDSlSqLsDS0gSa95aC9Fm4zxABcgW6D26Dcp/3RA5KtBZr+KJnH7kHFxXVzRprrwJiQIK4Xwl99UkMknw+kZ66qAZudrMuTXWG5chiCeyb+G8bix8XMHjpL+NCblK8AAwFFKHkmVP+gpwY5wY/mXnDSsGhsTg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bec12e7dca10541
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aImnDFNV0q5w06Tn5NZe5BSq7Rq/nc6GqoQFfBu4geLTSDxl+rcIwRvpv6n2KWHd8i9NDcyiSGSV038gELki0gS9G7dCSRXUcDYZOJBOqDR+yimNHVkNfbqf51l5p8nbR7JftHPWNp9ZluDxea9HcBgtOv/8eKuHmE9Rbd5wa4+yWn3uD+hMktiDNmBYY5bDWUOrNdJvY7J6xXHzMy41KkMrBFVL5DwNkEM4i+jGDk3M5hRtx+VmseIQovz/7ChIhHXSFHtJbh98TfvCOwYxLtngeXeeOuaDSgQQaAh15qjyY6EkdE8bQOfBSp5m1OZOFQ0Xa+jywCF/WsjobBPEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=05eRu5Hk5gKvbYa4WlKCEx0v3OIBRFb4f0ekRTzeEQI=;
 b=O1kZllEXVKdvsMGZcddk7CdPt94Gwx8OvFS6ls0v0WOhhLb/UZpEEM5j/lSQUPPzCkum+5fVcWXfeC/Pa988ZYWYg5cu7cEOwLZhhLIVJpsmZsUlSBFBB0CIPZtbBZ8M9bs5MN9vi51GC4pXxGdUKIyzX+m43pLCq/fYMu2gvCqC2eV+4yGgVj4GJu4HwiiuI6OOBFZtBBnSGh9llSDN8SLXVY1wzKHAT7Das41AVvKCkNOubdMwaLb/Xnro7E5bKUzkBepTNuMYGKx1RZ4q/bjwJllsVb9eqpfKqA6THhoS2aFGyp8PjcIlMQwqWn8S/YOj7X3EqObP711E5wjjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05eRu5Hk5gKvbYa4WlKCEx0v3OIBRFb4f0ekRTzeEQI=;
 b=B7aoeHIJ0/9IOvDSlSqLsDS0gSa95aC9Fm4zxABcgW6D26Dcp/3RA5KtBZr+KJnH7kHFxXVzRprrwJiQIK4Xwl99UkMknw+kZ66qAZudrMuTXWG5chiCeyb+G8bix8XMHjpL+NCblK8AAwFFKHkmVP+gpwY5wY/mXnDSsGhsTg0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 7/7] xen/arm: Sanitize CTR_EL0
Thread-Topic: [PATCH v4 7/7] xen/arm: Sanitize CTR_EL0
Thread-Index: AQHXqsPus1tQg1NxCEKJXP/MCMUVQ6unK+aAgACvBQA=
Date: Fri, 17 Sep 2021 07:47:13 +0000
Message-ID: <2C65F110-1DC6-485F-AA4F-B4D5B40DAF8E@arm.com>
References: <cover.1631772970.git.bertrand.marquis@arm.com>
 <3a6a63701df71c0a0ea743c6229266077da0563e.1631772970.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2109161420210.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109161420210.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fe1de7d7-5469-4aa3-833b-08d979af6191
x-ms-traffictypediagnostic: PAXPR08MB7033:|VI1PR08MB3248:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3248189BAB1D53DD4599F25C9DDD9@VI1PR08MB3248.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DIzMKwegguPdlIdlatykvuGNk8XDVILASUrt4M32dw4a5BfHxO+1X/Omaqe+33fv4aBv7t3rLZ3xdTw/2LEisJkeGhxu/D7yhkj1ixdD6THDvs+nFbkVLVxAQ6CCT0Qh86zlEPJp13zgupw5GzcEv/4marJnVKkTpNjOmHyz2scrluNoMhE7iYjZc+A3kNSVxyOIaEDgLMOZjbPY/uNUVjiEefhls5MlSPBjW+lqFNNy6E83+GeyvR4p4p2BJ/Bl9N38gfg6fyfQ9Xat4yMEKQZLvCIlYOo9Ara9x1whE3i0RHI7p3WTyf223kCDXY3HpdTMRokLYF7tchxPaW+uxmSz0MgNxemqUzGK+oWxK9xJbce5xigQL5/4MuLuOFJKY9p9Z1EjCDqzFTMEYljqX/oKDZnbWu2l4xDhGNnBvKg1cqsEJwATsJFaxHgKkeQSBnSbfnFl1ypfbXkztjfRamthbttSkskxgbWcKNkqpDq5axDj/TMN2pJ8mSIO6HE3ch1XjS4mYdhJ0P6o9sDmfnpxQWKfPNWuXNqAa6PcQ/FlM2zPo8Mx51ZHdrss3pYvO7OPUGJ7atxxTuRd5AGoXbMQDZnsLvQONms6cPv9Z5Yg3uhKA4HJkGFRbrTuGaFB3BfsLC0lgTQNpnxSLb9fnoRCl9Pgbun4PyFvxSE2FoCG6D4O+/+zP7uVWhwILSV4TdMJ10rjqHfeT7XOplDQICTN9D9djHb6vOS7XGz7R28tRyB60ilQJvzsKKrmjjmwfgX4f/jI+x4i/poKXpPYVw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(6916009)(86362001)(316002)(38100700002)(71200400001)(122000001)(8676002)(33656002)(4326008)(6486002)(6512007)(36756003)(2616005)(5660300002)(186003)(478600001)(54906003)(6506007)(26005)(83380400001)(53546011)(2906002)(8936002)(91956017)(66446008)(66946007)(64756008)(38070700005)(66556008)(66476007)(76116006)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA7710CB056E7D4385DC7F570AD8081A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7033
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	964fd50b-fd07-4c0d-2bd6-08d979af5d00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/gIYBcW/y5rgepWxmjjzdcnm5iTOxgfObRcTsfclB2tnEPMMa3U3x/qFMPmgSIgNgsvfA6pElvi0SG9IewLiGK+mwoqLI9m43fDyxS+MZ2fVaS9QIVHfJqat3qNgIrK5GSi7vs9YwvixB4X4QAM3Tembs/6kz502T0ku+bHa4IQRT/j95Po9/2KHPACfTd1ZkkWyVgH4uUBXvCLAwF0752wSWCVzOMXzo2a+1VJfr0VfA6hyczdEQShZ9uUviORTHqtc4vZgQwCQA8YBYeLXp3qECRN8tw2UEcFWPx3B2HrFxkbY20Z0EuEiE7Mzaq9b7z7A2LY54WlPciy5TpmUysZxFBckdm1oQPP7RTKb+3R72hMpAl3USKgy5IwWBkD85Al9SNXpYr0ACHdJfzSN/hmHWbvQujQHzGMaJ6j9D1FFmFaXk+q61zmVsJK16HcbPN0iaI3M7owvX4TugMTXJkNssdrOPiK0L+aFXAs8acNEaYIzSNQilxfxqfrZFV6bPhcASUBBRN2kS2p7hhem0cyHc0D/lN1X8RKsqrhVVgPbpmnpL4L5v0+115LOY8y/yn5dJ9g96QNTvjYvoRNkJ8gExmTvt6y9YbzJcnGRFcAbVObAg73aLHfPfz6Vgs7gcDgtObBo5Zr2b43SX5/yHCAZhV7rh44UZmpCbjIkOYCLZ0p9pAZSgPekNiC5dOQpv1U1haeNicVqHnETj0PEeiFDb85R+YXHpKAb+2qaHjA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(36840700001)(46966006)(26005)(6506007)(53546011)(107886003)(8676002)(2616005)(336012)(70206006)(5660300002)(86362001)(70586007)(82740400003)(356005)(33656002)(36756003)(81166007)(36860700001)(83380400001)(82310400003)(8936002)(2906002)(478600001)(6862004)(4326008)(186003)(6512007)(316002)(47076005)(54906003)(6486002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:47:21.1000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1de7d7-5469-4aa3-833b-08d979af6191
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3248

Hi Stefano,

> On 16 Sep 2021, at 22:20, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 16 Sep 2021, Bertrand Marquis wrote:
>> Sanitize CTR_EL0 value between cores and taint Xen if incompatible
>> values are found.
>>=20
>> In the case of different i-cache types, the sanitize ctr_el0 will have a
>> sanitize value but this is currently not used or exposed to guest which
>> are seeing the original ctr_el0 value.
>>=20
>> Use the opportunity to rename CTR_L1Ip to use an upper case name like
>> Linux does.
>> The patch is also defining ICACHE_POLICY_xxx instead of only having
>> CTR_L1IP_xxx to sync the definitions with Linux and is updating the code
>> using those accordingly (arm32 setup).
>>=20
>> On platforms with only the same type of cores, this patch should not
>> modify the current Xen behaviour.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> Changes in v4: Remove TID2 support and handling of corresponding
>> register emulation in vcpreg/vsysreg.
>> Changes in v3: none
>> Change in v2: Patch introduced in v2
>> ---
>> xen/arch/arm/arm64/cpufeature.c  |  6 ++----
>> xen/arch/arm/cpufeature.c        |  2 ++
>> xen/arch/arm/setup.c             |  2 +-
>> xen/include/asm-arm/cpufeature.h |  9 +++++++++
>> xen/include/asm-arm/processor.h  | 18 +++++++++++++++---
>> 5 files changed, 29 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufea=
ture.c
>> index d4679f5df3..6e5d30dc7b 100644
>> --- a/xen/arch/arm/arm64/cpufeature.c
>> +++ b/xen/arch/arm/arm64/cpufeature.c
>> @@ -275,9 +275,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[=
] =3D {
>> 	ARM64_FTR_END,
>> };
>>=20
>> -#if 0
>> -/* TODO: use this to sanitize the cache line size among cores */
>> -
>> static const struct arm64_ftr_bits ftr_ctr[] =3D {
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 *=
/
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, =
1, 1),
>> @@ -294,7 +291,6 @@ static const struct arm64_ftr_bits ftr_ctr[] =3D {
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SH=
IFT, 4, 0),
>> 	ARM64_FTR_END,
>> };
>> -#endif
>>=20
>> static const struct arm64_ftr_bits ftr_id_mmfr0[] =3D {
>> 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNER=
SHR_SHIFT, 4, 0xf),
>> @@ -606,6 +602,8 @@ void update_system_features(const struct cpuinfo_arm=
 *new)
>> 	 */
>> 	SANITIZE_REG(dczid, 0, dczid);
>>=20
>> +	SANITIZE_REG(ctr, 0, ctr);
>> +
>> 	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
>> 	{
>> 		SANITIZE_ID_REG(pfr32, 0, pfr0);
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 113f20f601..6e51f530a8 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -127,6 +127,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>>=20
>>     c->dczid.bits[0] =3D READ_SYSREG(DCZID_EL0);
>>=20
>> +    c->ctr.bits[0] =3D READ_SYSREG(CTR_EL0);
>> +
>>     aarch32_el0 =3D cpu_feature64_has_el0_32(c);
>> #endif
>>=20
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 4ab13d0fbe..49dc90d198 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -650,7 +650,7 @@ static void __init setup_mm(void)
>>         panic("No memory bank\n");
>>=20
>>     /* We only supports instruction caches implementing the IVIPT extens=
ion. */
>> -    if ( ((ctr >> CTR_L1Ip_SHIFT) & CTR_L1Ip_MASK) =3D=3D CTR_L1Ip_AIVI=
VT )
>> +    if ( ((ctr >> CTR_L1IP_SHIFT) & CTR_L1IP_MASK) =3D=3D ICACHE_POLICY=
_AIVIVT )
>>         panic("AIVIVT instruction cache not supported\n");
>>=20
>>     init_pdx();
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index 5219fd3bab..cab89ee142 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -267,6 +267,14 @@ struct cpuinfo_arm {
>>         register_t bits[1];
>>     } dczid;
>>=20
>> +    /*
>> +     * CTR is only used to check for different cache types or policies =
and
>> +     * taint Xen in this case
>> +     */
>> +    struct {
>> +        register_t bits[1];
>> +    } ctr;
>> +
>> #endif
>>=20
>>     /*
>> @@ -339,6 +347,7 @@ extern struct cpuinfo_arm system_cpuinfo;
>> extern void identify_cpu(struct cpuinfo_arm *);
>>=20
>> #ifdef CONFIG_ARM_64
>> +
>> extern void update_system_features(const struct cpuinfo_arm *);
>> #else
>> static inline void update_system_features(const struct cpuinfo_arm *cpui=
nfo)
>=20
> Spurious change. I fixed it on commit.

Sorry for that and thanks.

Bertrand

>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


