Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51A6F4AA7
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 21:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528799.822397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptw59-0000t0-8Z; Tue, 02 May 2023 19:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528799.822397; Tue, 02 May 2023 19:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptw59-0000q8-5r; Tue, 02 May 2023 19:54:39 +0000
Received: by outflank-mailman (input) for mailman id 528799;
 Tue, 02 May 2023 19:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=foPY=AX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ptw57-0000q2-Lw
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 19:54:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28f94b9b-e923-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 21:54:34 +0200 (CEST)
Received: from DB6P18901CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::24)
 by PAXPR08MB7365.eurprd08.prod.outlook.com (2603:10a6:102:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 19:54:30 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::ee) by DB6P18901CA0014.outlook.office365.com
 (2603:10a6:4:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 19:54:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20 via Frontend Transport; Tue, 2 May 2023 19:54:30 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Tue, 02 May 2023 19:54:30 +0000
Received: from b54e168d3d85.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E57027C9-C2EC-48B5-AFD4-76F064C796A6.1; 
 Tue, 02 May 2023 19:54:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b54e168d3d85.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 May 2023 19:54:23 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS8PR08MB7790.eurprd08.prod.outlook.com (2603:10a6:20b:527::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 19:54:20 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::e6af:7fc5:bb80:9406]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::e6af:7fc5:bb80:9406%7]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 19:54:20 +0000
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
X-Inumbo-ID: 28f94b9b-e923-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIauXjVPwCZaMr0emwlQmLTVrakJ4XH4Bg+H0hwJ6Ps=;
 b=Dn+OGWmWdLsk3GfgTNzj4BxB6XYEAtHamV31fGGOKpf34aTy9eCCl/9jv29XAwE0M3KYpn8O0m31qIjN63kAcaLweCGllEYLESWPgghAkgWvtiqofn+FYEdYgesmNIG+KuGPir0ki2pVF+i+0l1u0K7+RRBBhpz3Zweh6PwRMlQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e32b693e000c3f57
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpthWXKaINUH8Ffau9FkQTjG/1yDRnGL3JXR6Pjfxo6/LU5+NlNRPOp16Xj32KG2DArUmXeeVZ1/J116fmtmngh7hDunEbvMVHIGeCC0BFt/GXB5Ml/AVWwPu+zn/EDIpU3NFp8VQg59Z/lu6DlMV7V38XAI5VjKLq4mldeESrwJZBmXpHuqfT6bbDQgGYxdStvULFR/NZoEPVaIAJHixe40c2Gq9mxwHCwCwhFHOGATDjm7weTLZ4ZcP0x/AII+DtPbxFefyQVxwGBXtqmoixGxAE7mtJ4wS5RVuhDR99XuNumLIjGwA2i7QhXx08id+bqOvHxw1GmyRgARGEEAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIauXjVPwCZaMr0emwlQmLTVrakJ4XH4Bg+H0hwJ6Ps=;
 b=b3wlaNk70l3h2uMgePNDcwa21sKbJarrPVzhT/TdQpxnK1zhVudO8FIDmp+i37fwixEE7/qfUH+ISMv5PUf5qrhiI6kswttR1aCobhlJwjWoC6+bB7epBLz+CNA/3u1zw626YrfIssy+Ed9hqOWt/YzKoplhObqbBQguXYnHK6OnZacJXfnhemlqbMt/un+X+89J7FK03VJ9yVtxLxcnFSXmAJtSp8x6AQEliLGWrBl88lOPLh6Wg4gLZlbItk+haXSmxyB4xHqinR1wF+ije5TH+U6djs2G5RvfTYabuJ8nZfnNVvKdBSIUyY5W+dynmG7w4iyhpkKaMrwiejqm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIauXjVPwCZaMr0emwlQmLTVrakJ4XH4Bg+H0hwJ6Ps=;
 b=Dn+OGWmWdLsk3GfgTNzj4BxB6XYEAtHamV31fGGOKpf34aTy9eCCl/9jv29XAwE0M3KYpn8O0m31qIjN63kAcaLweCGllEYLESWPgghAkgWvtiqofn+FYEdYgesmNIG+KuGPir0ki2pVF+i+0l1u0K7+RRBBhpz3Zweh6PwRMlQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 10/12] xen/tools: add sve parameter in XL configuration
Thread-Topic: [PATCH v6 10/12] xen/tools: add sve parameter in XL
 configuration
Thread-Index: AQHZdnKI1/ryq6h2kEuVT2yTgC4YMq9HQ+EAgAAu74A=
Date: Tue, 2 May 2023 19:54:19 +0000
Message-ID: <8C3DC6ED-83D8-4DD0-9C99-B34449304373@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-11-luca.fancellu@arm.com>
 <996db21b-e963-4259-884d-2131c548ca1e@perard>
In-Reply-To: <996db21b-e963-4259-884d-2131c548ca1e@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS8PR08MB7790:EE_|DBAEUR03FT019:EE_|PAXPR08MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8df2ad-d3f4-4f97-8c36-08db4b470b2b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nl7jwy/rHwCPApwMIp99tPwC058MrOC+sbuOUGWwMy0B4loMknKMU7rIELwR0U7EexJSfJimqvJN9M9BtR697nk60j/wIHfnE1XIplUMseFxr306WXBD2p6nQhyJOTIzIijiF122dxnzcKMBGVJv0gFZC1B2+HQ5BowBy40GBSl1Q30g+4p3XoROa239QlgdKF7QwcIcZV0H7QmQAIgMC2z2eRSXo9pGO5qg7Nu2ovn/e0oZN0ySxDUuMAb2cpy5t3jeLvgMRyh6L+eW4OXJA4QGxt3lmJ7RN/2HUX6eQrQfnd1XRfrJQcCsHsty/eF3UX+iTUXRSipXkYtlYLqL2BGcHFF58HfFIRghv8suVmdEyY62F9pMUEi2tBshNCGzkxDMs9R5tcAdDdEx2CaVn61et1UtAMw7JjkjQu55YJRMV2e1xhLhm1aIXurVUHQcKNXs3WFMvOdR0Uf7no5u6husfiMlLYaBb/Bo9oYIaC13bAX9ah2nuzR4/9p0ZM4+2s4vfgSAANd64DwyTe0Y2ujtenTuqg4mBvDIiCw6bBfHeZQXD6OSDJFc5Xhc6pqv4v+ZRtZJ3VcJBrZ+cDtVHtHoNKnB9oTWNadrc7HAogB7ZdZntg+5nruBE0h94UDqX1AbfCnxtKdXo6h4Zt+h6A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199021)(53546011)(26005)(6512007)(6506007)(4326008)(76116006)(64756008)(66446008)(66556008)(6916009)(66476007)(66946007)(2616005)(33656002)(478600001)(40140700001)(86362001)(91956017)(83380400001)(71200400001)(316002)(38070700005)(122000001)(38100700002)(41300700001)(2906002)(6486002)(36756003)(186003)(54906003)(5660300002)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AE75BDE125C23B43B704AF9D0A60A6BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7790
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	017bfbe8-4da0-47fe-6519-08db4b4704c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+gV8+WY3y81bNs8Edn910en4Q0IWtOLF4ggYKDGMXTxrTWrRgTUra+0ePZDtO2Qz+MBTXf2uWQEA0amTLNEfPknFXNN78FEeFzvCeV3tCOiXu9ex75UKe877xNnD0B6uxWEVSg3RoxXGjgUHmNT/pq6iRwhOBQK9GkdzL6Cq3oVvRxr2U53t5VACqNXTSAeZEPY8dipVcHr6H8Ta8oH1kSInH5Rn40/GoHSyr4dqX4W/BBpoFK3JAe7OvHWmzisHP2vh2lmUyqLs1Z9YbD4BKQhjq+YOhHoz/JFMKRyKylRsQv9xDvECtM3DvnRhBxlOM3ZHOkwBVLl8Rq7HjKWvo8LgaOYn397VpdbMJew4a6i9A7nnrxMSKMjx/QVZbO4fv68DMLIAmc+CoKN7QtgVc2Ezen8o0ksGmUUsQre/ny/sxHdTn/DNrmzWVVQCezMySDV355DuRCycU/ZfRnrfYiYjcLOOOMCWRgMFdx7l1SM56liV38U6P6PM18oh8n1+yv0sddGYVdBTiOo5tfDblRa6dIyUht70dYih8i5eOUeoz0yF7VZwm3EeykFObTEJr5TmM8N/3VLRlfbFvufRpco6qHsnqysVBTdlFRqXruSn+pg89cX3eitNlxDwHlH2HihSw79rJcEYy/a+d3icNnnAcW6TRPKHMSQaFSN3x+P+GC+4iGtRxpu0MBGJHfgz5BWzh1pgr8HHFKIed/wscv/LyBbZjH7DXEYDmVrduPg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(6862004)(86362001)(40460700003)(5660300002)(8676002)(70206006)(8936002)(41300700001)(81166007)(356005)(82740400003)(70586007)(4326008)(316002)(40480700001)(2906002)(6486002)(34020700004)(36860700001)(36756003)(33656002)(2616005)(107886003)(53546011)(186003)(26005)(40140700001)(6506007)(82310400005)(6512007)(83380400001)(54906003)(47076005)(478600001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 19:54:30.5221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8df2ad-d3f4-4f97-8c36-08db4b470b2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7365

Hi Anthony,

Thank you for your review.

> On 2 May 2023, at 18:06, Anthony PERARD <anthony.perard@citrix.com> wrote=
:
>=20
> On Mon, Apr 24, 2023 at 07:02:46AM +0100, Luca Fancellu wrote:
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index ddc7b2a15975..1e69dac2c4fa 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -211,6 +213,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
>>         return ERROR_FAIL;
>>     }
>>=20
>> +    /* Parameter is sanitised in libxl__arch_domain_build_info_setdefau=
lt */
>> +    if (d_config->b_info.arch_arm.sve_vl) {
>> +        /* Vector length is divided by 128 in struct xen_domctl_created=
omain */
>> +        config->arch.sve_vl =3D d_config->b_info.arch_arm.sve_vl / 128U=
;
>> +    }
>> +
>>     return 0;
>> }
>>=20
>> @@ -1681,6 +1689,26 @@ int libxl__arch_domain_build_info_setdefault(libx=
l__gc *gc,
>>     /* ACPI is disabled by default */
>>     libxl_defbool_setdefault(&b_info->acpi, false);
>>=20
>> +    /* Sanitise SVE parameter */
>> +    if (b_info->arch_arm.sve_vl) {
>> +        unsigned int max_sve_vl =3D
>> +            arch_capabilities_arm_sve(physinfo->arch_capabilities);
>> +
>> +        if (!max_sve_vl) {
>> +            LOG(ERROR, "SVE is unsupported on this machine.");
>> +            return ERROR_FAIL;
>> +        }
>> +
>> +        if (LIBXL_SVE_TYPE_HW =3D=3D b_info->arch_arm.sve_vl) {
>> +            b_info->arch_arm.sve_vl =3D max_sve_vl;
>> +        } else if (b_info->arch_arm.sve_vl > max_sve_vl) {
>> +            LOG(ERROR,
>> +                "Invalid sve value: %d. Platform supports up to %u bits=
",
>> +                b_info->arch_arm.sve_vl, max_sve_vl);
>> +            return ERROR_FAIL;
>> +        }
>=20
> You still need to check that sve_vl is one of the value from the enum,
> or that the value is divisible by 128.

I have probably missed something, I thought that using the way below to
specify the input I had for free that the value is 0 or divisible by 128, i=
s it
not the case? Who can write to b_info->arch_arm.sve_vl different value
from the enum we specified in the .idl?

>=20
>> +    }
>> +
>>     if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
>>         return 0;
>>=20
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_t=
ypes.idl
>> index fd31dacf7d5a..9e48bb772646 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -523,6 +523,27 @@ libxl_tee_type =3D Enumeration("tee_type", [
>>     (1, "optee")
>>     ], init_val =3D "LIBXL_TEE_TYPE_NONE")
>>=20
>> +libxl_sve_type =3D Enumeration("sve_type", [
>> +    (-1, "hw"),
>> +    (0, "disabled"),
>> +    (128, "128"),
>> +    (256, "256"),
>> +    (384, "384"),
>> +    (512, "512"),
>> +    (640, "640"),
>> +    (768, "768"),
>> +    (896, "896"),
>> +    (1024, "1024"),
>> +    (1152, "1152"),
>> +    (1280, "1280"),
>> +    (1408, "1408"),
>> +    (1536, "1536"),
>> +    (1664, "1664"),
>> +    (1792, "1792"),
>> +    (1920, "1920"),
>> +    (2048, "2048")
>> +    ], init_val =3D "LIBXL_SVE_TYPE_DISABLED")
>=20
> I'm not sure if I like that or not. Is there a reason to stop at 2048?
> It is possible that there will be more value available in the future?

Uhm... possibly there might be some extension, I thought that when it will
be the case, the only thing to do was to add another entry, I used this way
also to have for free the checks on the %128 and maximum 2048.

>=20
> Also this mean that users of libxl (like libvirt) would be supposed to
> use LIBXL_SVE_TYPE_1024 for e.g., or use libxl_sve_type_from_string().
>=20
> Also, it feels weird to me to mostly use numerical value of the enum
> rather than the enum itself.
>=20
> Anyway, hopefully that enum will work fine.
>=20
>> libxl_rdm_reserve =3D Struct("rdm_reserve", [
>>     ("strategy",    libxl_rdm_reserve_strategy),
>>     ("policy",      libxl_rdm_reserve_policy),
>=20
> Thanks,
>=20
> --=20
> Anthony PERARD


