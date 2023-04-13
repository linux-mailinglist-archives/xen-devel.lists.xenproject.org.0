Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346F6E0DA1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520697.808573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwMJ-0004Eg-Kp; Thu, 13 Apr 2023 12:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520697.808573; Thu, 13 Apr 2023 12:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwMJ-0004Bi-GV; Thu, 13 Apr 2023 12:47:27 +0000
Received: by outflank-mailman (input) for mailman id 520697;
 Thu, 13 Apr 2023 12:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73wY=AE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pmwMI-0003wO-Gf
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:47:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57aa59ef-d9f9-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 14:47:26 +0200 (CEST)
Received: from AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12)
 by PAWPR08MB10019.eurprd08.prod.outlook.com (2603:10a6:102:362::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 12:47:24 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::80) by AS9PR06CA0062.outlook.office365.com
 (2603:10a6:20b:464::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 12:47:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 12:47:23 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 13 Apr 2023 12:47:23 +0000
Received: from ccdb36c774c0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66580BF8-7DA3-4829-8CD8-35E1FB063A95.1; 
 Thu, 13 Apr 2023 12:47:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ccdb36c774c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 12:47:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB9303.eurprd08.prod.outlook.com (2603:10a6:150:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:47:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:47:14 +0000
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
X-Inumbo-ID: 57aa59ef-d9f9-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtygNClpbjg3pL0Vy527GsUXVXEkKMNbd269i/PqNMo=;
 b=ETlS/QOdPpTuECTtWEZyp3D9n060bLmEZwx8Onjq1xblOQIk5IP97UfChQE1txEjbf81APQNqNKVzZ3XAPziMKHngegmRL5Ke22vq6j1vB3jof5KZ6icjhdiGPWksozVZf2s0RiNV9x0HKEkdEtM+njrFrh+CmngQAuznRCLLug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0b35fb7e16df590
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhqgCvgDE4o7F6D3ZlPK5jMSkditeh3lTLpGpcARQJZhNy3ORKlZ7jM8j5HGMu27yYJQpswjoPfwAoKByxPDWIHSP7+iA7Cs/2XRgd4lhb4mZMzANRG60cPzlfVZeJCYVHj4hBOutC0TKsNjBO+1Kba6AdOFFmrP92y/op6LYh/e3OXg4TpdD5/v8AQr/fTNHKmQ8PT0gku+U74xedzKyiTCzGjpzqTtYGxMh/ZoHfC0bfI7q0bk4NEqemfQU/7QSznkygD33rQSSlV7hHiO08T4vmcnJU/Xtx54kFsdI1YVjvkrNNfDclN6Ddw4UHqVBcZ/59qEUM8LVE4iRmqdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtygNClpbjg3pL0Vy527GsUXVXEkKMNbd269i/PqNMo=;
 b=JFm64lKTGW1DC91hFjvHBcejgR2TYxLgeoH2+8En99qM9ndJpz65P/WE+CvosbQ3AcRkoa/nROTENSezjbSpl+NHpv8OiRdbpx9hjOsKe5OAMNk6OkndwipbTN+mAl5GTk22N+ejXDscS6tZov+xQzf6gg2Duldp68KNbTjnkeSAt7NHG8IjP4wxb+jsZ9CFSG55XUB8Jr344g1h7ruZkWUk/NjTsbVmZUroS5RLgrVnyQUS6wq/SWlyBMXDSYvFvkeyJ/kwMYS1lpLqJbSUps07TeSIWD56/uZvg3vbnH905iTpS2+6H1uxhz5EImNsgMfaRQRnuFTu9M/Xod6HxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtygNClpbjg3pL0Vy527GsUXVXEkKMNbd269i/PqNMo=;
 b=ETlS/QOdPpTuECTtWEZyp3D9n060bLmEZwx8Onjq1xblOQIk5IP97UfChQE1txEjbf81APQNqNKVzZ3XAPziMKHngegmRL5Ke22vq6j1vB3jof5KZ6icjhdiGPWksozVZf2s0RiNV9x0HKEkdEtM+njrFrh+CmngQAuznRCLLug=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 03/12] xen/arm: Expose SVE feature to the guest
Thread-Topic: [PATCH v5 03/12] xen/arm: Expose SVE feature to the guest
Thread-Index: AQHZbSQuM7VmfjG4MUSvggInCqBRn68pMdAA
Date: Thu, 13 Apr 2023 12:47:14 +0000
Message-ID: <43CDAEBF-D406-4DD8-9C17-00971867B4B8@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-4-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-4-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB9303:EE_|AM7EUR03FT034:EE_|PAWPR08MB10019:EE_
X-MS-Office365-Filtering-Correlation-Id: 6adee899-713e-4829-e4f8-08db3c1d3a72
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lB9lvKG5/lxn9WHr5boZApxnt3l3J5FVFEi2A618vWkcR/cRZH4jQQmiiV8dm8B8EF4ePcWIZ1JZHUbR/MiVd1XxbJ4a4tacq7gXyvgbgDqdoCsgoV9+772GFyCnxnrN5PnqHFO3clMQbr3gjL7IpLH+bDaO6wOwkIFyLk4ZJmQIwkggdwPvyz0NzhuZe5s90MzdzOvwGVxTQo1+/Zt+ff+bTWeXZA5Qk1p5rjSVL2OSOosoVbv+1f++xolXAyNYBsDUCq9h6MwAiO+WX4JWqWTPuIagE4SjuEVOSSAexizpGFZqUfkAETihGiWiupCORZGeb4TmJ6IH1fLnNPB98lqGFvOe0l8/c92i6moN8V/EYvmQHG6nPuOQA9+ewncbAuGTt1FeClB59ipsSHyC/pN5ryworVWyU/y5EjARSXuVm7Owex0nh6h10edac+SeOsN4yNMdA1lYjsarYldKaHQCItB1zdHMNpXZczFYekkj0lizvZ1JKld+/69LIXUBDRHiDZRmavOK/74M7AgjD/ZB2OB5+sTIaX4pdb0jhwrAphT3cRtbk2lFylMVbD1TbRKnlGbprmGq6kq8Yn+EE8R3ovSVGpYwgBYxUZ/wzLv2m/9UcFOOM1gLTrObVIgiyWqM/hSg/pYq6cGRc3b1Iw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(71200400001)(6486002)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(36756003)(76116006)(91956017)(37006003)(2906002)(38070700005)(86362001)(122000001)(41300700001)(33656002)(5660300002)(8676002)(8936002)(6862004)(316002)(38100700002)(478600001)(54906003)(6636002)(53546011)(6512007)(6506007)(26005)(2616005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <929C3E3C7C006D4CA470CDFCA214CDFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9303
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f640fbef-ab04-43e7-9890-08db3c1d351d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pu4nV/XhyAXCO2vVeK0uF2MSk6NX4zNnj335MgUhl3SICHum/9faaJk/QGYgmVGNhPlQe3XLN/Nr+yHpc7WCLo2i+0sl72lexDpvgrskJsfayN/C3b/Ng0fFUkHEwJ6O2xSGtch9z8SkIoyFTfthxIf2RwaasPC/JBXVhi7NRBtLknTcnT5g7XiwognzIBBv4XFupfSUq9aQKBXRgZGQiFXUveK052ths19tzUP17bXWYOEZgPBy52nX6/fmN2vgG4vo0ZeTiyMzdGlkMWmwE2/P4xxFteDJMm0vHz3+DZkg75XA+5BZppuCD0ze/E1pvzha2zJFT+eiJ3+7m8ZDQrKMdbS9l0W4tu+aTccozcHozkLedYUsKk4hbOn2YkXlacNX8TGlmbX+ilsHSUWTZnUvYBW6jwrGGXvrIuhXpYMC8P8jHwfEna4E41NxTFGjd8z770kI2Kll5Pq1R9VgeFfdymhJasvlAb+z9PzbbHPKtRrx+9OpxvrAdGg57SXtBeX0XJcJxCal0K0PDF2dAvMSkhoHOY/+BpX51t+0kdV1CoQ845UCE7Y8SxCzk+X57VoK8izvBYAzTZJWKuzdtj0O8Pmi2bwWXQeuaUdWS2LR5ctk4h2t1mHJG84RCPURdd/NCqV8TROXNRWhVBAQa4LYUtL3uf0swxvEIoNiKfgeLMa8cywwe+O4ghbYWMEEZqJ6Hr9bgNlpiGGsgosRWw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(70206006)(4326008)(336012)(107886003)(81166007)(37006003)(86362001)(36756003)(54906003)(82310400005)(2906002)(8936002)(8676002)(5660300002)(6862004)(33656002)(478600001)(41300700001)(6636002)(316002)(70586007)(40480700001)(40460700003)(356005)(82740400003)(6506007)(6512007)(26005)(53546011)(6486002)(2616005)(36860700001)(83380400001)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:47:23.4758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adee899-713e-4829-e4f8-08db3c1d3a72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10019

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> When a guest is allowed to use SVE, expose the SVE features through
> the identification registers.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> CHanges from v4:
> - no changes
> Changes from v3:
> - no changes
> Changes from v2:
> - no changes
> Changes from v1:
> - No changes
> Changes from RFC:
> - No changes
> ---
> xen/arch/arm/arm64/vsysreg.c | 39 ++++++++++++++++++++++++++++++++++--
> 1 file changed, 37 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 758750983c11..10048bb4d221 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -18,6 +18,7 @@
>=20
> #include <xen/sched.h>
>=20
> +#include <asm/arm64/cpufeature.h>
> #include <asm/current.h>
> #include <asm/regs.h>
> #include <asm/traps.h>
> @@ -295,7 +296,28 @@ void do_sysreg(struct cpu_user_regs *regs,
>     GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
>     GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
>     GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
> -    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
> +
> +    case HSR_SYSREG_ID_AA64PFR0_EL1:
> +    {
> +        register_t guest_reg_value =3D guest_cpuinfo.pfr64.bits[0];
> +
> +        if ( is_sve_domain(v->domain) )
> +        {
> +            /* 4 is the SVE field width in id_aa64pfr0_el1 */
> +            uint64_t mask =3D GENMASK(ID_AA64PFR0_SVE_SHIFT + 4 - 1,
> +                                    ID_AA64PFR0_SVE_SHIFT);
> +            /* sysval is the sve field on the system */
> +            uint64_t sysval =3D cpuid_feature_extract_unsigned_field_wid=
th(
> +                                system_cpuinfo.pfr64.bits[0],
> +                                ID_AA64PFR0_SVE_SHIFT, 4);
> +            guest_reg_value &=3D ~mask;
> +            guest_reg_value |=3D (sysval << ID_AA64PFR0_SVE_SHIFT) & mas=
k;
> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
> +
>     GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
>     GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
>     GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
> @@ -306,7 +328,20 @@ void do_sysreg(struct cpu_user_regs *regs,
>     GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
>     GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
>     GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
> -    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
> +
> +    case HSR_SYSREG_ID_AA64ZFR0_EL1:
> +    {
> +        /*
> +         * When the guest has the SVE feature enabled, the whole id_aa64=
zfr0_el1
> +         * needs to be exposed.
> +         */
> +        register_t guest_reg_value =3D guest_cpuinfo.zfr64.bits[0];
> +        if ( is_sve_domain(v->domain) )
> +            guest_reg_value =3D system_cpuinfo.zfr64.bits[0];
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>=20
>     /*
>      * Those cases are catching all Reserved registers trapped by TID3 wh=
ich
> --=20
> 2.34.1
>=20


