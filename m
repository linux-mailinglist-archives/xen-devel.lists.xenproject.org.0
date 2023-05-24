Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6422770F3B9
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 12:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538953.839369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lNa-0005e1-Fj; Wed, 24 May 2023 10:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538953.839369; Wed, 24 May 2023 10:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lNa-0005bl-CA; Wed, 24 May 2023 10:06:02 +0000
Received: by outflank-mailman (input) for mailman id 538953;
 Wed, 24 May 2023 10:06:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1lNZ-0005bf-7k
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 10:06:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93bedf07-fa1a-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 12:05:57 +0200 (CEST)
Received: from AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7)
 by AS8PR08MB10150.eurprd08.prod.outlook.com (2603:10a6:20b:62a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 10:05:51 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::fc) by AS9PR06CA0002.outlook.office365.com
 (2603:10a6:20b:462::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 10:05:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Wed, 24 May 2023 10:05:50 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Wed, 24 May 2023 10:05:50 +0000
Received: from f872fec28455.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 747FC9E9-FEF8-4C06-841F-9D3378800A34.1; 
 Wed, 24 May 2023 10:05:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f872fec28455.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 10:05:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8477.eurprd08.prod.outlook.com (2603:10a6:20b:55b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 10:05:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 10:05:40 +0000
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
X-Inumbo-ID: 93bedf07-fa1a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al/3yr0pngWD9gXRxZRp0PKFoHd5lNjj1aeMXVh/jog=;
 b=L3gDF0TCv1itvommmVmZ+shUZg3uVjmFTHfpcMP1ZwRBpFIuTSXwo7ziplQuPbk1kEqGv1g5pYfqeFtgxF7xmmvE2KbpA3MuKXVeLxWVQTzGI/YuoKw+N36hADWOHprqhZ4gtB+2H0xS4/odFCgMSHUJQ1o02+cxZJ3mJFFtLsc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3af1e2ff4d36cd07
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB2YkQfeV240/tN9yHWCohTkkfs3HJAxCbJOBPA1owopX4rElYwDlIIZ+ag5QIzBFuu1J81/p77hwBWflHz+eNQ+q1cw89HuqTXkIIoi4kAysaR5WDKsZ4NWbXVBNdNbORefh7MfGfIqXab9LHoQeYnoE3ZZW9x0CM98BZQx3oMLM8v6Kz7Bkv0GiXp1Go1LUtd3UkLgvzm9oqO24DktdIQrBzl/Jyu6fkhdiRcUGKfHugFw++kz4JkxA9ROqDCxTcaNwm+BpQZU2Co6/X79b7VeR0v4PFin1mGEQO010sri6Z5Eu17USRApDXSHGlLtxvxZFcT14tIIOV6BCoKIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=al/3yr0pngWD9gXRxZRp0PKFoHd5lNjj1aeMXVh/jog=;
 b=OkuBT8XScJMv9nQccwk/aC7ZDpQzZGHi/TDczn2/H8CP3YZfwZ68Q32mJDHy8sYylHch5XnVwHDr0slJL+LWWIMnX4T7UBqFwuUeqdhkFpN/rxMPbEaOkGV7bWLvL9wPug38lNgIjlvqIrUUP6856iq9yA5c7ue37Dv1koCR01YB4YBhTmlyYHI6J8y8jeVpOLAPBuBn5VnN5AtRW7ZDTVADR5ki+vbdJMGTZv2HdkPqM2IzC84lC5A+vAmX9k0Z280RGkQyQ/Edk1C15rVhwkEHoZ489kBm0Jk0lFINcQ/8Kh28nqMZk9VVB5FmPnEmOQhnbF8OavNZ2Wrf5xiZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al/3yr0pngWD9gXRxZRp0PKFoHd5lNjj1aeMXVh/jog=;
 b=L3gDF0TCv1itvommmVmZ+shUZg3uVjmFTHfpcMP1ZwRBpFIuTSXwo7ziplQuPbk1kEqGv1g5pYfqeFtgxF7xmmvE2KbpA3MuKXVeLxWVQTzGI/YuoKw+N36hADWOHprqhZ4gtB+2H0xS4/odFCgMSHUJQ1o02+cxZJ3mJFFtLsc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZjUpZciMsvgYXykmY5lL2NeB+Hq9pM/SA
Date: Wed, 24 May 2023 10:05:40 +0000
Message-ID: <04D83C51-E734-465D-BC2D-4F0535C91B77@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-8-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB8477:EE_|AM7EUR03FT056:EE_|AS8PR08MB10150:EE_
X-MS-Office365-Filtering-Correlation-Id: 236e4b64-1ac8-40bb-2c37-08db5c3e73fe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n8ZQnN5Gcb6/nOYWViKtZJfjNu4pNAQ+CfsSyyWVAr/zV2k8gwIkS/MjIXyQRjqDU/sLMKmey9f0qd8f7qdpZWNIWZ079zqPvNOHxrJnY2/tEf8sLALt5OWvXqyjmDOIrte3YwLhmtcXu3s2HrCvrdv5qANW9jAtQstdQmAA75npsZE4xNMLV1YmZIG3hFciYvsWKRBEHrriHd5375DCpg9nDwF1FOFHBuykxhx5Gq13okfz0cuh+NxKlQNNfDraMGkzYvWb3hMX+t3DsecqlNRJFWXhX19FViMm/anNsLremOT7XvgdMUOVTFnxI9PFk8dvU+KR9+bKHq1H9OJt28z+TvJtfRAU4VFx1htK4FwwzVEzV76owRsZ12q0lrGNl9mjrnBAMzxjwS6Rp6DaSVrgUSAB5g94dVs2dtZgk5D/xJVrkwYmce+xcmUe1nUO/seT20p/Wlmwukt02WajLkqZfirGo1ifmh+lxx8ifbXK2b8Y5WH9Jkg0L3YLlrJKmlJ3POMQxl50adZ5rR0BFgRbcOKiZDnZ3w6GAWv0Ss8ngohKTTEfHiabGmcsPvNlV0t6OILxCz0QkDryK3pUn7HHqSHN7D5MEWU5fo/Kld2Q0nF+ua74FDKGeo/XFxBd
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(6512007)(26005)(122000001)(53546011)(186003)(33656002)(6506007)(2616005)(36756003)(83380400001)(2906002)(38100700002)(41300700001)(6486002)(71200400001)(316002)(37006003)(54906003)(966005)(478600001)(66946007)(66556008)(66476007)(66446008)(76116006)(64756008)(91956017)(6636002)(38070700005)(4326008)(86362001)(8936002)(6862004)(5660300002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <094B75803BC03E488BA52F7CCFB8B207@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8477
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	387631a9-8ddd-493c-6f4c-08db5c3e6dfd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vEFQoa+5wix+oaFQqkPOBvIkx8P/gPDvtsO23YujizqV7sux7MxTxZ9j4hMNfeNpG7c3qBQ8UGESyLBfX/LXRC7ODpevbLGXU/NAiZOzdNkKezTQNQb3nQ6U9jlkqvfg2FQfbSvj+/FMdfvKx3oS620p73v9F5xtJWfxs1kWsRcccyBoFGK8pX/Mjb2BWzs62AGgdYXDBMNhO+/ydTf+Zq9g6dKhNA7lU9o6aWa5DxnOD15HTeqZHjih2qFH9+D58vOaStpxj6+/CwvkdMakiaM063Cn8TMRqGCxlepA1uPYmjf/zH57E6KoEbIJ0SeQXKImd6k5km7QHK6x/2j/We6UaU4QDenny7TWVuIHTdb73GUuhiQDL9nPvm4+nsWTE0HbXAxgdfvVeUJFd9B3p1++iFEaAdRLoqPrrnqef98k5a2JiGq9unihmkZbqes3yoLtLsnwGjzsPCkO/yezTkW3izGTsokVJXZfkUYTjr5t8VJ+rD6qJuD5e4sjTF0Mz8rde+ScR3rliumQQgqkZYtnp2pNLrzkHvGyQ8itIyJ++mml/GBi5MioPBvs4lBA6aXiEFSMVJ2AINvQboQvrYCzUKNhm+pZCRLgyn53NrIXGz8vV9aDmCNjRqXObz02OmUCqOtLuYdAoCfwR/BZqsVtlIW8IcrcpGPuI12gE2LsrSPT/AjkBKT+G0J+Po5nVh5Seezd3yhoeFhwS0KaUJy4PNXpENgMjFyQDyJy8SE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(2906002)(966005)(2616005)(36756003)(186003)(40480700001)(107886003)(8936002)(6862004)(8676002)(40460700003)(5660300002)(6512007)(6506007)(26005)(53546011)(82310400005)(478600001)(70586007)(70206006)(6636002)(4326008)(86362001)(82740400003)(54906003)(37006003)(81166007)(41300700001)(83380400001)(6486002)(336012)(47076005)(356005)(316002)(36860700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 10:05:50.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 236e4b64-1ac8-40bb-2c37-08db5c3e73fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10150

Hi Luca,

> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Add a command line parameter to allow Dom0 the use of SVE resources,
> the command line parameter sve=3D<integer>, sub argument of dom0=3D,
> controls the feature on this domain and sets the maximum SVE vector
> length for Dom0.
>=20
> Add a new function, parse_signed_integer(), to parse an integer
> command line argument.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

with ...

> ---
> Changes from v6:
> - Fixed case for e=3D=3DNULL in parse_signed_integer, drop parenthesis
>   from if conditions, delete inline sve_domctl_vl_param and rely on
>   DCE from the compiler (Jan)
> - Drop parenthesis from opt_dom0_sve (Julien)
> - Do not continue if 'sve' is in command line args but
>   CONFIG_ARM64_SVE is not selected:
>   https://lore.kernel.org/all/7614AE25-F59D-430A-9C3E-30B1CE0E1580@arm.co=
m/
> Changes from v5:
> - stop the domain if VL error occurs (Julien, Bertrand)
> - update the documentation
> - Rename sve_sanitize_vl_param to sve_domctl_vl_param to
>   mark the fact that we are sanitizing a parameter coming from
>   the user before encoding it into sve_vl in domctl structure.
>   (suggestion from Bertrand in a separate discussion)
> - update comment in parse_signed_integer, return boolean in
>   sve_domctl_vl_param (Jan).
> Changes from v4:
> - Negative values as user param means max supported HW VL (Jan)
> - update documentation, make use of no_config_param(), rename
>   parse_integer into parse_signed_integer and take long long *,
>   also put a comment on the -2 return condition, update
>   declaration comment to reflect the modifications (Jan)
> Changes from v3:
> - Don't use fixed len types when not needed (Jan)
> - renamed domainconfig_encode_vl to sve_encode_vl
> - Use a sub argument of dom0=3D to enable the feature (Jan)
> - Add parse_integer() function
> Changes from v2:
> - xen_domctl_createdomain field has changed into sve_vl and its
>   value now is the VL / 128, create an helper function for that.
> Changes from v1:
> - No changes
> Changes from RFC:
> - Changed docs to explain that the domain won't be created if the
>   requested vector length is above the supported one from the
>   platform.
> ---
> docs/misc/xen-command-line.pandoc    | 20 ++++++++++++++++++--
> xen/arch/arm/arm64/sve.c             | 20 ++++++++++++++++++++
> xen/arch/arm/domain_build.c          | 26 ++++++++++++++++++++++++++
> xen/arch/arm/include/asm/arm64/sve.h | 10 ++++++++++
> xen/common/kernel.c                  | 28 ++++++++++++++++++++++++++++
> xen/include/xen/lib.h                | 10 ++++++++++
> 6 files changed, 112 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index e0b89b7d3319..47e5b4eb6199 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -777,9 +777,9 @@ Specify the bit width of the DMA heap.
>=20
> ### dom0
>     =3D List of [ pv | pvh, shadow=3D<bool>, verbose=3D<bool>,
> -                cpuid-faulting=3D<bool>, msr-relaxed=3D<bool> ]
> +                cpuid-faulting=3D<bool>, msr-relaxed=3D<bool> ] (x86)
>=20
> -    Applicability: x86
> +    =3D List of [ sve=3D<integer> ] (Arm)
>=20
> Controls for how dom0 is constructed on x86 systems.
>=20
> @@ -838,6 +838,22 @@ Controls for how dom0 is constructed on x86 systems.
>=20
>     If using this option is necessary to fix an issue, please report a bu=
g.
>=20
> +Enables features on dom0 on Arm systems.
> +
> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain an=
d sets
> +    the maximum SVE vector length, the option is applicable only to AArc=
h64
> +    guests.

Here i would just remove "guests", just AArch64 is enough.
I am ok if you choose to use "AArch64 Dom0 kernels"

> +    A value equal to 0 disables the feature, this is the default value.
> +    Values below 0 means the feature uses the maximum SVE vector length
> +    supported by hardware, if SVE is supported.
> +    Values above 0 explicitly set the maximum SVE vector length for Dom0=
,
> +    allowed values are from 128 to maximum 2048, being multiple of 128.
> +    Please note that when the user explicitly specifies the value, if th=
at value
> +    is above the hardware supported maximum SVE vector length, the domai=
n
> +    creation will fail and the system will stop, the same will occur if =
the
> +    option is provided with a non zero value, but the platform doesn't s=
upport
> +    SVE.
> +

I agree on the discussion with Jan here so you can keep my R-b if modified =
as discussed.


Cheers
Bertrand

> ### dom0-cpuid
>     =3D List of comma separated booleans
>=20
> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> index 84a6dedc1fd7..feaca2cf647d 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -13,6 +13,9 @@
> #include <asm/processor.h>
> #include <asm/system.h>
>=20
> +/* opt_dom0_sve: allow Dom0 to use SVE and set maximum vector length. */
> +int __initdata opt_dom0_sve;
> +
> extern unsigned int sve_get_hw_vl(void);
>=20
> /*
> @@ -152,6 +155,23 @@ void sve_restore_state(struct vcpu *v)
>     sve_load_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
> }
>=20
> +bool __init sve_domctl_vl_param(int val, unsigned int *out)
> +{
> +    /*
> +     * Negative SVE parameter value means to use the maximum supported
> +     * vector length, otherwise if a positive value is provided, check i=
f the
> +     * vector length is a multiple of 128
> +     */
> +    if ( val < 0 )
> +        *out =3D get_sys_vl_len();
> +    else if ( (val % SVE_VL_MULTIPLE_VAL) =3D=3D 0 )
> +        *out =3D val;
> +    else
> +        return false;
> +
> +    return true;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f373a5024783..9202a96d9c28 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -62,6 +62,22 @@ custom_param("dom0_mem", parse_dom0_mem);
>=20
> int __init parse_arch_dom0_param(const char *s, const char *e)
> {
> +    long long val;
> +
> +    if ( !parse_signed_integer("sve", s, e, &val) )
> +    {
> +#ifdef CONFIG_ARM64_SVE
> +        if ( (val >=3D INT_MIN) && (val <=3D INT_MAX) )
> +            opt_dom0_sve =3D val;
> +        else
> +            printk(XENLOG_INFO "'sve=3D%lld' value out of range!\n", val=
);
> +
> +        return 0;
> +#else
> +        panic("'sve' property found, but CONFIG_ARM64_SVE not selected")=
;
> +#endif
> +    }
> +
>     return -EINVAL;
> }
>=20
> @@ -4113,6 +4129,16 @@ void __init create_dom0(void)
>     if ( iommu_enabled )
>         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>=20
> +    if ( opt_dom0_sve )
> +    {
> +        unsigned int vl;
> +
> +        if ( sve_domctl_vl_param(opt_dom0_sve, &vl) )
> +            dom0_cfg.arch.sve_vl =3D sve_encode_vl(vl);
> +        else
> +            panic("SVE vector length error\n");
> +    }
> +
>     dom0 =3D domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
>     if ( IS_ERR(dom0) )
>         panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/=
asm/arm64/sve.h
> index 65b46685d263..a71d6a295dcc 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -21,14 +21,22 @@ static inline unsigned int sve_decode_vl(unsigned int=
 sve_vl)
>     return sve_vl * SVE_VL_MULTIPLE_VAL;
> }
>=20
> +static inline unsigned int sve_encode_vl(unsigned int sve_vl_bits)
> +{
> +    return sve_vl_bits / SVE_VL_MULTIPLE_VAL;
> +}
> +
> register_t compute_max_zcr(void);
> int sve_context_init(struct vcpu *v);
> void sve_context_free(struct vcpu *v);
> void sve_save_state(struct vcpu *v);
> void sve_restore_state(struct vcpu *v);
> +bool sve_domctl_vl_param(int val, unsigned int *out);
>=20
> #ifdef CONFIG_ARM64_SVE
>=20
> +extern int opt_dom0_sve;
> +
> static inline bool is_sve_domain(const struct domain *d)
> {
>     return d->arch.sve_vl > 0;
> @@ -38,6 +46,8 @@ unsigned int get_sys_vl_len(void);
>=20
> #else /* !CONFIG_ARM64_SVE */
>=20
> +#define opt_dom0_sve     0
> +
> static inline bool is_sve_domain(const struct domain *d)
> {
>     return false;
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index f7b1f65f373c..7cd00a4c999a 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -314,6 +314,34 @@ int parse_boolean(const char *name, const char *s, c=
onst char *e)
>     return -1;
> }
>=20
> +int __init parse_signed_integer(const char *name, const char *s, const c=
har *e,
> +                                long long *val)
> +{
> +    size_t slen, nlen;
> +    const char *str;
> +    long long pval;
> +
> +    slen =3D e ? ({ ASSERT(e >=3D s); e - s; }) : strlen(s);
> +    nlen =3D strlen(name);
> +
> +    if ( !e )
> +        e =3D s + slen;
> +
> +    /* Check that this is the name we're looking for and a value was pro=
vided */
> +    if ( slen <=3D nlen || strncmp(s, name, nlen) || s[nlen] !=3D '=3D' =
)
> +        return -1;
> +
> +    pval =3D simple_strtoll(&s[nlen + 1], &str, 10);
> +
> +    /* Number not recognised */
> +    if ( str !=3D e )
> +        return -2;
> +
> +    *val =3D pval;
> +
> +    return 0;
> +}
> +
> int cmdline_strcmp(const char *frag, const char *name)
> {
>     for ( ; ; frag++, name++ )
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index e914ccade095..5343ee7a944a 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -94,6 +94,16 @@ int parse_bool(const char *s, const char *e);
>  */
> int parse_boolean(const char *name, const char *s, const char *e);
>=20
> +/**
> + * Given a specific name, parses a string of the form:
> + *   $NAME=3D<integer number>
> + * returning 0 and a value in val, for a recognised integer.
> + * Returns -1 for name not found, general errors, or -2 if name is found=
 but
> + * not recognised number.
> + */
> +int parse_signed_integer(const char *name, const char *s, const char *e,
> +                         long long *val);
> +
> /**
>  * Very similar to strcmp(), but will declare a match if the NUL in 'name=
'
>  * lines up with comma, colon, semicolon or equals in 'frag'.  Designed f=
or
> --=20
> 2.34.1
>=20


