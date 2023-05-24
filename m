Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2370F2B7
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538915.839288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kkr-0005br-Hw; Wed, 24 May 2023 09:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538915.839288; Wed, 24 May 2023 09:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kkr-0005Z1-F8; Wed, 24 May 2023 09:26:01 +0000
Received: by outflank-mailman (input) for mailman id 538915;
 Wed, 24 May 2023 09:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1kkq-0005Yq-0R
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:26:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe13::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fde50d14-fa14-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 11:25:58 +0200 (CEST)
Received: from FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:ac::16)
 by AM9PR08MB6673.eurprd08.prod.outlook.com (2603:10a6:20b:307::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 09:25:53 +0000
Received: from VI1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:ac:cafe::40) by FR0P281CA0223.outlook.office365.com
 (2603:10a6:d10:ac::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 09:25:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT064.mail.protection.outlook.com (100.127.144.94) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 09:25:52 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Wed, 24 May 2023 09:25:52 +0000
Received: from b8f26c31278c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5CC82C0-98B9-41AF-9C61-D75D0CB32373.1; 
 Wed, 24 May 2023 09:25:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8f26c31278c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 09:25:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU2PR08MB10204.eurprd08.prod.outlook.com (2603:10a6:10:49b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Wed, 24 May
 2023 09:25:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:25:38 +0000
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
X-Inumbo-ID: fde50d14-fa14-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg+1tg7xMYW4sM23wo5yUBvN6Jhwd2R/WMPma6BcnwI=;
 b=VYyaeIEK2EsyIuVvRkQ04kHBXw+Uirqpd3h4h+FizXOFIuYxHZdUAnG6agCZYT82rDc1kM+c2/MIynwaNw6TSwby/Ek3OMB0t5YyNDuZjrU4MSljpCWm+ZNPviVr8mCus8wYrEk5ZA0QQWGvV9JevA8gDHNllWuEfZvJGfsojE0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe6d1aea0b96b9ce
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YR8zbG4emHyorelM3W48WJK6JQJxNqxIT531EDgwG6FCVGYSeBdR2xwRv7NBDi7JpDJxW1cD0Ttr/wdJhO5VxYZpPkU1eXZ7iE7TuHhGj4gQjseAr0SI0i6RtLYis377E7dQbInR4DU8pO/DsiFWDOaXIS6ndjbiXvdL2mbMRPSj5LvclfftrkSj4cpkuD0HNFmTwiL5ZlsHOBY1OsY8n/WJCAoNpliy/hylYfyDl5WWHQoLp4ynkhlHVmPyl7lFSh4ShmZ86NeG9Oe6z4PcV8cRnGIGtL2NlNFUKnmm96qEWpr2RVntGDhQ0zrOwWoIXWp/uy3MmfK+I7RWjH6dWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg+1tg7xMYW4sM23wo5yUBvN6Jhwd2R/WMPma6BcnwI=;
 b=IalznXcHGL8vZ8SM39xpg3f9H2VWjxnt+ucoyEHTh9V++1bT897A0mTsAaNL/L0L6PrtOGyoXCuSLdv87hFszpEkbXK5undn+mDy/TiQVNo8gbAyaJJoHfxcYq32k2TqTq/0Ef2chHN0k0WMw1CxLTDyKM9pR3ReHmDU+X45DokxOZL94bN/MqEDJqvswabSkDWdo7s8QYM3ExIvfawI59cNyvNACP6KclzV3Qt2ILTg1VWcJgPlfV9e9VZW9Do7Inc9CqBXhUcBAn0MQsgvTrh2TDg6dxao8ZY1gI1Qh4x6bLfBIO6Oy0eiG2WJL7WTMWkHFIh0cgVwa9m21YtTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg+1tg7xMYW4sM23wo5yUBvN6Jhwd2R/WMPma6BcnwI=;
 b=VYyaeIEK2EsyIuVvRkQ04kHBXw+Uirqpd3h4h+FizXOFIuYxHZdUAnG6agCZYT82rDc1kM+c2/MIynwaNw6TSwby/Ek3OMB0t5YyNDuZjrU4MSljpCWm+ZNPviVr8mCus8wYrEk5ZA0QQWGvV9JevA8gDHNllWuEfZvJGfsojE0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH v7 03/12] xen/arm: Expose SVE feature to the guest
Thread-Topic: [PATCH v7 03/12] xen/arm: Expose SVE feature to the guest
Thread-Index: AQHZjUpPM3gITm+uPkGc0myaZMtxS69pKMWA
Date: Wed, 24 May 2023 09:25:37 +0000
Message-ID: <88BD5890-59AE-45E9-AFC0-9D630C8738A7@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-4-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-4-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU2PR08MB10204:EE_|VI1EUR03FT064:EE_|AM9PR08MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7f6359-4d53-4d5d-bef5-08db5c38debe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YkhzNAiRSubIMtaWVUnDKF0K5OvlJnAGSmhrQlz8vyUedaqZwT+CnTR2mJOfWOpzHgqFK2ZxAZZ6XTj6zX6nxG2MNEcUQGWMW89K9bHNEZypHRJ9kqebv0Su75x603g9izq3j6nOOG2Zlppg7inGhTBdPiTu9lnizDhjsgzQe2J+IszTTT57bn2Pobm7Mv+mMPE+fXML1qVV/rCZiTnP5hN6jhC6j7K7v7dquH6Qv2mUp/2gdVVrhekkwACabp6H7IQlEzU1ETTauhA8260YNQDdgGeAxgqncXz32+QAgl/Hle9HlSlzQ/g6iqUZzeKNmGPRLuTnSZL+uZIp2rF77XNaQB/9gzpPY8982lxWx23L+6PzjAzrN4wf+iEmE31Zu07xxL7vm/Pv7o0Cds3H064QnjawpJjs4rat/geou6s9oyWnLVFijU8Ia3qbw+Jh3JxRJz5ynKlYPNlKEnZJvRtfyo+yNTSs9Ph4Hlnni17I0ExgFSgA1lFxTwYnKE/XGNm9HE90UZ5BViW9xwJgGpJ/mRCJgUsh0k/m9K6LqYUui2HtRYtgCh+Xuy0bIcb5H17b7cX0DolYmC4loZAbGMpVKOapY5k/Bw7n+kcVpVARDM8GwsyZhMWAR85kZ2dpJulilUmrNWKiuZFeXhUSTQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199021)(33656002)(36756003)(37006003)(91956017)(54906003)(66446008)(4326008)(66556008)(76116006)(66946007)(64756008)(66476007)(6636002)(316002)(478600001)(5660300002)(8676002)(8936002)(6862004)(41300700001)(2906002)(38070700005)(71200400001)(86362001)(122000001)(38100700002)(186003)(2616005)(6512007)(26005)(53546011)(6506007)(83380400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E23A7693727C1A4AB36152EB49893B5F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10204
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cabf80ec-bfce-4ebe-3c94-08db5c38d5d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bSxnyd/M2B98mwUunVTSi4oW7u7V7yiIAixxP35PutZy3tzfgSYJCKq/3Av/XPmUTpXLbzG8NvDzU3klWhFEe2pG9+z/akKn/SHO3cBEixsybKH8HacZ6GJHVunXHhPM5hLDBb5wpa734zT0IUflTVmpdV2XEisrRjugg1msRupaTKfOZibL6HTaFRh36/cbssCpO60fQhjPSpx/8P7N38EI9O7fJJgmZ7HmY1xb0W9YBiUOVLOA+sFh+rpykCZrwy+09LFgR9O5jSmLTCzJL3BB8DwzYRlz9wFqFVcWiYck/CsvadrH+j8C+JURg3FCm3pfCNj4npM7SIFaFZhjgi2SwTJ/7gJ4DyGmL0XOvGR/fXOZF2dJO/7wrGpk3QoKKXXvdTEDkQ9y5MXwrG2dald0F0PbJno3vPnu5C6OZoRmVKrzYVCeK9/gT/TfAVpLiLl6pGbRWBDJftd7Q3/erq8wiRLz8UAp9IoZpr1mP3EvQD366h3mTtQ3bYCEkh9irhvLO25asuYGTgTlE5Xdn8YX9PLcYC0XQQXp2l8fT5lwR41gDaobgNazLxLtR6w7+pGCGamJa4JbYats709jY0d8c81FeZlVCYQFxYe2m8A8edaIs5sBwX1wyScq+iCwAK/I6CnsbnyXLkqOwBrZ0PiWTjs0gNSPZyjWjYkEwXu9ba6FOkbZDvOoUSj+DW4dguy0hchijrUWBHzyWAwM5Ft6xIi6byLaNhY7db6Gyz9gfh0ZM0XLlzlqDLnXPh6m
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(47076005)(83380400001)(82740400003)(33656002)(6636002)(4326008)(40460700003)(81166007)(356005)(70586007)(70206006)(2906002)(41300700001)(8936002)(8676002)(5660300002)(6862004)(316002)(40480700001)(36860700001)(86362001)(36756003)(2616005)(37006003)(54906003)(26005)(107886003)(6486002)(186003)(6512007)(6506007)(53546011)(478600001)(82310400005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:25:52.6930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7f6359-4d53-4d5d-bef5-08db5c38debe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6673

Hi Luca,

> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> When a guest is allowed to use SVE, expose the SVE features through
> the identification registers.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v6:
> - code style fix, add A-by Julien
> Changes from v5:
> - given the move of is_sve_domain() in asm/arm64/sve.h, add the
>   header to vsysreg.c
> - dropping Bertrand's R-by because of the change
> Changes from v4:
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
> xen/arch/arm/arm64/vsysreg.c | 41 ++++++++++++++++++++++++++++++++++--
> 1 file changed, 39 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 758750983c11..fe31f7b3827f 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -18,6 +18,8 @@
>=20
> #include <xen/sched.h>
>=20
> +#include <asm/arm64/cpufeature.h>
> +#include <asm/arm64/sve.h>
> #include <asm/current.h>
> #include <asm/regs.h>
> #include <asm/traps.h>
> @@ -295,7 +297,28 @@ void do_sysreg(struct cpu_user_regs *regs,
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
> @@ -306,7 +329,21 @@ void do_sysreg(struct cpu_user_regs *regs,
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
> +
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


