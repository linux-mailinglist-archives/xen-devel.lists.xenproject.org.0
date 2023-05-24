Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE00A70F8C0
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539082.839609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pVZ-0003Rc-6J; Wed, 24 May 2023 14:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539082.839609; Wed, 24 May 2023 14:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pVZ-0003PS-36; Wed, 24 May 2023 14:30:33 +0000
Received: by outflank-mailman (input) for mailman id 539082;
 Wed, 24 May 2023 14:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1pVX-0003PM-Rn
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:30:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88984848-fa3f-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 16:30:30 +0200 (CEST)
Received: from DU2PR04CA0356.eurprd04.prod.outlook.com (2603:10a6:10:2b4::14)
 by DBBPR08MB6314.eurprd08.prod.outlook.com (2603:10a6:10:20f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:30:26 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::46) by DU2PR04CA0356.outlook.office365.com
 (2603:10a6:10:2b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 14:30:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 14:30:25 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Wed, 24 May 2023 14:30:25 +0000
Received: from 7c3bc349fa94.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5B6D0F0-24DD-4713-985E-166EF0C50B8D.1; 
 Wed, 24 May 2023 14:30:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c3bc349fa94.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 14:30:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8375.eurprd08.prod.outlook.com (2603:10a6:10:408::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 14:30:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 14:30:16 +0000
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
X-Inumbo-ID: 88984848-fa3f-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nDoDP1cQr2TdFC3oohFVBusjQitDMOHQV8cJuoJidM=;
 b=5KJy268J0Mchni5oD7r1XEUi+yeEBWIKUTiFixlzdX/uLpd5minc+kQHiXav9XP4utSbK6syW7UOT2LmpKOWd4EIC1ckrIyFqV0+LNFLZNtC5wyGlj9MgfPyXyHPVu/tW/D60d5vpvOw2zWmcuYt+u8qvdgxGumWxuQAjMrPFXY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3dd4096e60384b6f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7n4Vdi78k1vjud5o2FBhqBJWZcedU2LJdfjaLfWfq5diSRwGAB/7Iwvi+SPsVcPL2ZaByG4xIO25oQRqL3QLBpJhu/2WAoxF6XopBFwjcUOhrM31vOYP85XuoYNTS6UkCDDWFpnksqRoFwMRNL89CUwdIALObP89iA97/1fkeZXLjrRmOFIHyl97DYGft8zm7TaXAZdFlGjFIye5mDeCKmUvnWdQFWebTdQMRH7NteEnhiIXEuN9Kie00HosBxiHaNuUH7TqlUItD1HevtpRIeFTDqLU08JwnS9VlcM8yI0qCELOcjo7rrqLwBjhOGZQCG0/HEWTcEUgRfCSfDSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nDoDP1cQr2TdFC3oohFVBusjQitDMOHQV8cJuoJidM=;
 b=hOqHrWJXOXs6owbjcGQiwQUYjXhtb6rDApvstRaIGIb3pPzf0UB0THXRKCc9zCVJHjDNd53ISWK898Txr2XoaUW8ZGAQ6z/7gKP6M/wrGTH56M/qYj0f8OGlBYNODUr+q7TQErOrqe19IZc1Fvmo7PbCp1s/JgwRwnT2nO/msFji02udNsLPB+20tGx2XIIbbHBcknCevBaBrcBLiUZqaQC3F6pgoFO+rjeZT1D6VDZOqh2vNiVk6qECTgZdifJ86Rk12uDFEyMUq6UoSG2Db0XoD8NMnPECmDIef4k9msBdoB3IwV8H1kj0FCPpeapUCbu4xDn3qTELRAVSRFtMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nDoDP1cQr2TdFC3oohFVBusjQitDMOHQV8cJuoJidM=;
 b=5KJy268J0Mchni5oD7r1XEUi+yeEBWIKUTiFixlzdX/uLpd5minc+kQHiXav9XP4utSbK6syW7UOT2LmpKOWd4EIC1ckrIyFqV0+LNFLZNtC5wyGlj9MgfPyXyHPVu/tW/D60d5vpvOw2zWmcuYt+u8qvdgxGumWxuQAjMrPFXY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v7 01/12] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZjUpOMMV4Yflw9E2LiWKuLwqFE69pIiaAgAAP2YCAAEvjgA==
Date: Wed, 24 May 2023 14:30:16 +0000
Message-ID: <10FEE82B-9EEB-4A29-BEFF-F425A396D2B6@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-2-luca.fancellu@arm.com>
 <98D7529A-FF7E-4079-B4FB-7EA096CB6822@arm.com>
 <dae8d4f9-7a1e-3940-1f25-0b1a2cb123bf@xen.org>
In-Reply-To: <dae8d4f9-7a1e-3940-1f25-0b1a2cb123bf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8375:EE_|DBAEUR03FT020:EE_|DBBPR08MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ee7d10-aca0-42de-dcc8-08db5c636a28
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UNZod9pvReZUr4GtZVHZOPsDtry50wdqIRjKizOnLq4EQ8gCRF6YQ6BhLFawrDm4oNfwy05yQXaUL3G0aPqJSJkJ3Lr8+uHHlSGMqayTKYwHUsj/ef6k5ZiuJztOwRzaRk9c2Z+luKKsRAvKNwxTmt1FX2tobrhQoQdVAKt5kFzeujIi6vOiYYeznj39QgiAiWRaGHqeAQLY1z0aBOWkKEOI5VzkVGywaZ38xDlqkt0uz1WCP+a0RS1+0bFp7VGVDl6JwJpd/tPH270vo9oohSu5lfAWWzgU5VRU55ZslR2WlP8CO+d6QaDq/EUNAaIHEIxry3vCOd1oHGXFJdl61LiAxuXyi49XExQFGYDfw/Ezwv2vd0Zw/UAcSSFMO7vpl/AiN3bcNwRrk9Fngs6E3vblpMdKxswWhVc4rN+vzDnHOKIR5Jjl0PQ88vSGyOzYiYaICdB0CXYqh5FFSxUSVYALMvdMT3ZaRHhlxSXLX2qxMC9Jh01AC1Jj3bY3RaMfw0o297kj+qW5x5v0/QWBJ+Q92mlAT3qL5bJGU/UczdE46jGdJM7p9vsZGS2Nw7/IQ950GGLSoRErv81xBr8JkX4VrpUHMFan0uFPoZYlrig7cG/pG0hob/iquMex4Q1hm2SK/Nlrph1rnaD1qgDdag==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(54906003)(86362001)(6916009)(64756008)(66946007)(66476007)(66556008)(66446008)(4326008)(478600001)(76116006)(91956017)(6486002)(41300700001)(71200400001)(316002)(5660300002)(8676002)(38070700005)(8936002)(38100700002)(26005)(6512007)(6506007)(33656002)(122000001)(186003)(53546011)(2906002)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <39FB56CF98F66D45B4186578CCA70A4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8375
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8e10d6c-ea2a-46e0-5588-08db5c6364bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a+Q1YmdwiiaRW+6Y+3vLDhYglDCu4XNdEURMKlVxy1g6nLdWA+vhU32TtZOmbM45BC4zHeCKGckTroLKOInzpgZubXCNd/seIELkhP1Xzspg9RCm+h9oI3zvDUVJtLmhQI9A4sBnI3/zZNcOBOWSWqOehqbkQPoFeDZofbsjzx6rJlRHrl81w7q+aW7Qk+EapU0XBLm8wCrFItYSg9C2NW7CTel9FQh0AC/SSoX6FPQIectJfmOi8C/aUIO6r36NinJS4I/0c823IwJ7MO3cnNtDAeykBh/bZ34Zm6CKU6oYqk+FhKZakDZtC9oXugdOxGfDghx27Jdwj3T7OfarnJQHESlp1hmn228TFypn/tXhBdAu8y5144pztBod6gqN2o0wd5iFlYWt8ai7zBConqhvQgI2ryxnpXb0CJqgd0r3pr8d3UAp3c10y2+0+bB5ESwBYN0nHeA/ZW76uywN2JVSb8pdzwYXI+ntngK4BouEXhZJXPAjgH2eA19iTPbt10hJHnuUvasVK8q/8xDSPdDX7gj/bLjzqqJxD3bmgtLRchzoV9GEDLqakBrIGJMuKpAh6PSQrYp6WqMC8hDLtoY2Inbm8LrbqCa6RSdhUkMB0YQG8MgQ7L24JYNI8tntsD9szpo19e+ZNkvgb3JfYchWhfyhDUMIXUYjQh4daCgf8MFr0J6Db10VdOFb0UAqG0v+6n0TWkOy01Qh+nsLDW7WKe8I1uEJFDhdQuqKBGhCObUAS93xCI+zpeomFkqv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(33656002)(86362001)(6862004)(8936002)(8676002)(2906002)(356005)(70206006)(70586007)(4326008)(316002)(478600001)(5660300002)(41300700001)(54906003)(82740400003)(6486002)(82310400005)(40460700003)(81166007)(47076005)(2616005)(186003)(53546011)(26005)(6506007)(6512007)(40480700001)(107886003)(36756003)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:30:25.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ee7d10-aca0-42de-dcc8-08db5c636a28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6314

Hi Julien,

> On 24 May 2023, at 11:58, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 24/05/2023 10:01, Bertrand Marquis wrote:
>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>> index c4ec38bb2554..83b84368f6d5 100644
>>> --- a/xen/arch/arm/cpufeature.c
>>> +++ b/xen/arch/arm/cpufeature.c
>>> @@ -9,6 +9,7 @@
>>> #include <xen/init.h>
>>> #include <xen/smp.h>
>>> #include <xen/stop_machine.h>
>>> +#include <asm/arm64/sve.h>
>>> #include <asm/cpufeature.h>
>>>=20
>>> DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>>> @@ -143,6 +144,9 @@ void identify_cpu(struct cpuinfo_arm *c)
>>>=20
>>>     c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
>>>=20
>>> +    if ( cpu_has_sve )
>>> +        c->zcr64.bits[0] =3D compute_max_zcr();
>>> +
>>>     c->dczid.bits[0] =3D READ_SYSREG(DCZID_EL0);
>>>=20
>>>     c->ctr.bits[0] =3D READ_SYSREG(CTR_EL0);
>>> @@ -199,7 +203,7 @@ static int __init create_guest_cpuinfo(void)
>>>     guest_cpuinfo.pfr64.mpam =3D 0;
>>>     guest_cpuinfo.pfr64.mpam_frac =3D 0;
>>>=20
>>> -    /* Hide SVE as Xen does not support it */
>>> +    /* Hide SVE by default to the guests */
>> Everything is for guests and as Jan mentioned in an other comment
>> this could be wrongly interpreted.
>=20
> (Not directly related to this patch, so no changes expected here)
>=20
> Hmmm... The name of the function/variable is confusing as well given that=
 the cpuinfo should also apply to dom0. Should we s/guest/domain/?

Would make sense to do some kind of coherency check here to use domain when=
ever something is for dom0 or guest.
So yes that would be a good idea and I can add this to my todolist (after S=
VE is merged to prevent conflicts).

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


