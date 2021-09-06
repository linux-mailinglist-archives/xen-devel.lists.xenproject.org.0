Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD2401766
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 09:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179421.325689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9X9-0004Wl-5M; Mon, 06 Sep 2021 07:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179421.325689; Mon, 06 Sep 2021 07:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9X9-0004U0-1c; Mon, 06 Sep 2021 07:59:15 +0000
Received: by outflank-mailman (input) for mailman id 179421;
 Mon, 06 Sep 2021 07:59:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxtw=N4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mN9X8-0004Ts-8R
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 07:59:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02416458-7fb2-4eb4-adef-abbbdb4859e6;
 Mon, 06 Sep 2021 07:59:12 +0000 (UTC)
Received: from AM6PR10CA0084.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::25)
 by AM6PR08MB4294.eurprd08.prod.outlook.com (2603:10a6:20b:bd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 07:59:10 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::6a) by AM6PR10CA0084.outlook.office365.com
 (2603:10a6:209:8c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Mon, 6 Sep 2021 07:59:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 07:59:10 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Mon, 06 Sep 2021 07:59:09 +0000
Received: from bf2941014b77.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDCB66D2-3E83-4673-962B-47BE55C9FD1B.1; 
 Mon, 06 Sep 2021 07:59:02 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf2941014b77.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Sep 2021 07:59:02 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR2PR08MB4874.eurprd08.prod.outlook.com (2603:10a6:101:1d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 07:59:01 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 07:59:00 +0000
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
X-Inumbo-ID: 02416458-7fb2-4eb4-adef-abbbdb4859e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqT3OTunmQEuYn/hPnbl+2ZS4xB6pnzJeMCS5J/gFo0=;
 b=1CigprJlfSjfO99h6CWRiRHI1AL4fV+efrm2/TjS5mCFgzwplQb4yVGvY+CTYFJ1JJZfruCkcigPDIHmurzsL/iYJzioTas0ASTs9q7wPCLIXimt2lPFC2h8hf8EFALoYhVEiKftUDL6u77cximqotCYRsqHKDkBie6uJHTbN4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbf86ecf56087163
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOaNrl38Xj3PI4AOCqtzL5SsAYpkh8esndWQhkQ2W5ffZNG84QPmVRJjwCLfMaRU9HFkooDrKoqan7XVLQrQZhV55dbM6/wWPbPA+Nc0wCgrzZG9nrQdybJfxGBGZ+3uZ2fUj+fvzBD3tyV8lsud7BDVdHX6QYmt5h3t1ytwDjA1uFh4BXIi+/RZRUkgrlBzMSDrs7/b+ht3Pu0qUVRM2xw/Jv83EfJD1GGNikJtkSjutN5EkGrqSBKdmOHGjJEVCVU5CIdu9NCiTG5TRTdnKMOpy3YRmjkmj7v5bot59Vb5JN0FGiyjjwqwZJng44GtTNDk4qAVEYi8eWjTXpn86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wqT3OTunmQEuYn/hPnbl+2ZS4xB6pnzJeMCS5J/gFo0=;
 b=HsNcM+Eb2ckqiboIeDKnPVu/CB1TgSWGd2KpPkrAFHm3ljb9XD6287WiXFKLnxLaca8bUQUnz4gQYeO5CSYO18GVIt1dl6sVJI9jTvfXSaDQIE+6U9pgywloq6/ctZ/B4UpZ2iDM/kmmfaEwk18C97bvL9UboAGyDC9CYqx+H3t1T04nJkorMzupdmfSvWwUM8nC5uk3Gu0c19THvcLHGeesUjFOsStMZwKBxXxWN+hUqIk0G62uKNvbB7Qph0nWj9/FTXNiS70fzK+KHFmQcDL76FoTCZgcqw1nVuQdwLjHYb5MAUgeH+yKsitlPXjoIR2zju2P7aQ5b6Hr/Q5RZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqT3OTunmQEuYn/hPnbl+2ZS4xB6pnzJeMCS5J/gFo0=;
 b=1CigprJlfSjfO99h6CWRiRHI1AL4fV+efrm2/TjS5mCFgzwplQb4yVGvY+CTYFJ1JJZfruCkcigPDIHmurzsL/iYJzioTas0ASTs9q7wPCLIXimt2lPFC2h8hf8EFALoYhVEiKftUDL6u77cximqotCYRsqHKDkBie6uJHTbN4M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] xen/arm: Taint Xen on incompatible DCZID values
Thread-Topic: [PATCH v3 6/7] xen/arm: Taint Xen on incompatible DCZID values
Thread-Index: AQHXmbPyvc9RSYz5OUKBEYoCXmX0t6uS+GGAgAO+T4A=
Date: Mon, 6 Sep 2021 07:59:00 +0000
Message-ID: <DDB381B4-1519-43B5-9DA5-DE0C0E11916B@arm.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <c1868fce1bcb0bcddf7bc786be166007f91f2f67.1629897306.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2109031529400.26072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109031529400.26072@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b915c3f8-054c-4e7c-cd21-08d9710c3597
x-ms-traffictypediagnostic: PR2PR08MB4874:|AM6PR08MB4294:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB42949E96D58FDB136F4F6A929DD29@AM6PR08MB4294.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3kXZxKy3Nxd+lLfGRINpjkMOHc74N/vpeTzhNSMzG6leXwfDMaIeSXQQzDyWioFZtk0fFNGuxC2wdDrvlL4/Tje4L9vZd8NORw0EaVN8JbjoK+oXMh2Q3hHxaIjLIt8p390ZDFL3l1PTdm6gt+vmCzzYAZKyVeHEoAthD70xQMCkwosGN3IfcxiIdhh0NwDFekt7vRYc8fttuwr+pmdFRL9A7Axn3nou2E/LogJxNjDsFBl0oUpYAnn7Ew+Bd7igGnWn4CAL4KjXIZ1JdV3SBl9wrTVN1UXe/VO2+WiVRPPntICtAjStrPyNUN1hoEGrPAwfx3xvdVmpIZwgfYZE54UvuhEuSRzC0RJybXrYAyzpPUm1d+CXzgHLYF1lMn4Usbx+fA6XEjZjLYCdaH0gklpcReLM+JnqgCeLIlMECvniD7wyTwG0y3pwZuPvrEqH9Yx+n7YquwlXDfnrFFmKmg/09/zia0YZx+gFc/nTsbN+jqIPbn0HkxX0csj02mDigdh5+lw7Ekz2Y1L35HjnVIRIdvdhXXchB37kmNXLyVhS+I6Dpb/9JkfNSEUiyfSbUow+K1kYWmgTpp6Z+shKvs9dYRQOJgoJBZFgyG/4AJ5hvVhLy+P8LTKPLjwqnkKOJYS60nMH1sk4+WK/qMWsSo9iNBGyQDTKAuvTzJrwtRI6iHU/AMm9bW0ga/rrfoAd5sn8Ed6LydXF+TzbsZS4mLVbbE8omm28/Y/qdaEKNXRLDNH05hOtCeWW1AkAqa4e
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(54906003)(316002)(5660300002)(2906002)(122000001)(2616005)(38070700005)(64756008)(6506007)(66946007)(53546011)(66446008)(6486002)(76116006)(91956017)(83380400001)(8676002)(66556008)(8936002)(66476007)(38100700002)(26005)(6916009)(86362001)(186003)(71200400001)(36756003)(478600001)(33656002)(6512007)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CCDE26D932ED4648AD77B2D677D78978@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4874
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d153bbb4-0551-4513-384b-08d9710c3014
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e7gteVfGcZkygifGTQs7+6Hjnd8+8eU8mK/kGobYyJRsk6hgL7HGUzxpfWhglH6E3jgwfdPULlsd07A3pLUl81hhEe3w9uLojy9B1rACZYg+LzZoBgQZURTN2Scc2Wv6j5DhDmsmoStIroXRbvCQP3wRj44f2O3lhYICYIjuey93nHzC7VGxl+QUOQsmg6p14w4wsxGOUOeMTVy0aRuDlwTD55JVJb2sIi37MlgM9E6P5qi6oyE1lawegdguyKehMaD0sQB5dtorfUGTFvQnUvdx7aw83dMqQRL9S6IgQT766piwInYqgypSWtExWWMMbxYWktbhFFR7ZTpMegi+MJcOT6YZ23tFt4gFvghZgw9/ZmP+/UTaqayBiuXNyTs4f7Cf+ABKXhEnga6A/4DmoOtQ6V7rCnkqYlYKsrGRi2za06F4RFMOERWR5d+gjKWqtE4eqD/NsAq40aKMf2kUQbUsaUz7F6mYFMARnjbbOwkY5zRWUET95dcPtV+vIH9YewpY3OAMfLnfYe0Nox+5y75qroxG1W49xjQF88Z3uQt6Ozly4fcE+gLuXYHTeuHxFWywuztBQscDWURAC3h+0LAcGrp8wyhJ4Jx8ykLsIeiVEIlp1B/mR/LGr+x2PJAVva2ImPEJ2IiKWZ4sw8X3Q0EvoiMy3ewzZbWi5q9za4seYjPtc4ofprm9PhbWof+4ol19QPlyKr3aHQSXLodvKA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(46966006)(36840700001)(5660300002)(82310400003)(8936002)(186003)(6512007)(6862004)(26005)(6506007)(83380400001)(107886003)(54906003)(478600001)(8676002)(356005)(81166007)(4326008)(316002)(36756003)(36860700001)(33656002)(336012)(2616005)(6486002)(82740400003)(70586007)(2906002)(47076005)(70206006)(86362001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 07:59:10.0910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b915c3f8-054c-4e7c-cd21-08d9710c3597
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4294



> On 3 Sep 2021, at 23:49, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 25 Aug 2021, Bertrand Marquis wrote:
>> Use arm64 cpu feature sanitization to TAIN Xen if different DCZID values
>                                        ^  TAINT
>=20
>=20
>> are found (ftr_dczid is using only STRICT method).
>> In this case actual memory being cleaned by DC ZVA operations would be
>> different depending on the cores which could make a guest zeroing too
>> much or too little memory if it is merged between CPUs.
>>=20
>> We could, on processor supporting it, trap access to DCZID_EL0 register
>               ^ processors

Could those typos be fixed during commit ?

>=20
>> using HFGRTR_EL2 register but this would not solve the case where a
>> process is being migrated during a copy or if it cached the value of the
>> register.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Change in v3: none
>> Change in v2: Patch introduced in v2
>> ---
>> xen/arch/arm/arm64/cpufeature.c  | 14 +++++++++++---
>> xen/arch/arm/cpufeature.c        |  2 ++
>> xen/include/asm-arm/cpufeature.h |  8 ++++++++
>> 3 files changed, 21 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufea=
ture.c
>> index 61f629ebaa..b1936ef1d6 100644
>> --- a/xen/arch/arm/arm64/cpufeature.c
>> +++ b/xen/arch/arm/arm64/cpufeature.c
>> @@ -329,14 +329,11 @@ static const struct arm64_ftr_bits ftr_mvfr2[] =3D=
 {
>> 	ARM64_FTR_END,
>> };
>>=20
>> -#if 0
>> -/* TODO: handle this when sanitizing cache related registers */
>> static const struct arm64_ftr_bits ftr_dczid[] =3D {
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, =
1),
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT,=
 4, 0),
>> 	ARM64_FTR_END,
>> };
>> -#endif
>>=20
>> static const struct arm64_ftr_bits ftr_id_isar0[] =3D {
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_=
SHIFT, 4, 0),
>> @@ -592,6 +589,17 @@ void update_system_features(const struct cpuinfo_ar=
m *new)
>>=20
>> 	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
>>=20
>> +	/*
>> +	 * Comment from Linux:
>=20
> I don't know if I would keep or remove "Comment from Linux"

I added that because the comment itself does not really apply to Xen.
I could have rephrased the comment/
Anyway I have no objection to remove that statement.

Do I need to send a v2 for that ?

Cheers
Bertrand


>=20
> In any case:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
>=20
> Also I gave a quick test of the series on a ZCU102 and it worked fine.
>=20
>=20
>> +	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
>> +	 * could result in too much or too little memory being zeroed if a
>> +	 * process is preempted and migrated between CPUs.
>> +	 *
>> +	 * ftr_dczid is using STRICT comparison so we will taint Xen if differ=
ent
>> +	 * values are found.
>> +	 */
>> +	SANITIZE_REG(dczid, 0, dczid);
>> +
>> 	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
>> 	{
>> 		SANITIZE_ID_REG(pfr32, 0, pfr0);
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index f600a611bd..113f20f601 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -125,6 +125,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>>=20
>>     c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
>>=20
>> +    c->dczid.bits[0] =3D READ_SYSREG(DCZID_EL0);
>> +
>>     aarch32_el0 =3D cpu_feature64_has_el0_32(c);
>> #endif
>>=20
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index 52cb3133e0..5219fd3bab 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -259,6 +259,14 @@ struct cpuinfo_arm {
>>         register_t bits[1];
>>     } zfr64;
>>=20
>> +    /*
>> +     * DCZID is only used to check for incoherent values between cores
>> +     * and taint Xen in this case
>> +     */
>> +    struct {
>> +        register_t bits[1];
>> +    } dczid;
>> +
>> #endif
>>=20
>>     /*
>> --=20
>> 2.17.1


