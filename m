Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE36E1EB7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 10:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521058.809334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnF5c-0001gY-Ne; Fri, 14 Apr 2023 08:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521058.809334; Fri, 14 Apr 2023 08:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnF5c-0001dF-KO; Fri, 14 Apr 2023 08:47:28 +0000
Received: by outflank-mailman (input) for mailman id 521058;
 Fri, 14 Apr 2023 08:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlWx=AF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pnF5b-0001ct-66
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 08:47:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9dd0596-daa0-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 10:47:24 +0200 (CEST)
Received: from AS9PR06CA0659.eurprd06.prod.outlook.com (2603:10a6:20b:46f::35)
 by GV1PR08MB9916.eurprd08.prod.outlook.com (2603:10a6:150:a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 08:47:17 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::52) by AS9PR06CA0659.outlook.office365.com
 (2603:10a6:20b:46f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 08:47:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Fri, 14 Apr 2023 08:47:16 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Fri, 14 Apr 2023 08:47:16 +0000
Received: from c47710ec9854.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C7F73050-5D25-4657-B869-090F9DA7FD06.1; 
 Fri, 14 Apr 2023 08:47:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c47710ec9854.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 08:47:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8930.eurprd08.prod.outlook.com (2603:10a6:10:465::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 08:47:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 08:47:02 +0000
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
X-Inumbo-ID: f9dd0596-daa0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1d++NwiHA03Rdgvx4zl7hDaFSLq9idxZRGzKkiYsaQ=;
 b=KSOND7mmVoUPCfp1ACxeWlZEZgIgX/b0u+VRNzQepnoyGBq2Zn0+A9aWHC9O5E+kQux0Sb2MyWbaApz+//eiAOoLW0i2j02xYmHuOnRyBN5YwLSWNXrE5FHM5SJ1pdgVcCH28awOWhj38KD1/u0ZWfh5QHKbZeEK1g5I8k/u2OY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0bf19fa0587feaaf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGoZ3ncKsr4whjcAEE/gXRLPPjcd/3NyEwDsZoVWYl/5YuFhs7btof7s3Woa2m0UYAsLM9JBRQJtmgaKI816cBUMf5lyKEWuFgbq/MpX+8FEVfjh6Jo5Nj6KtVOIP4PoIviaXbFx9jUyJBjX4JrkVEmEO68341WiT9/2jItW2NJ6QtF+5bhPZVwfi0ryqRFeKJjbMD7K9BXzZvjxJoZbQLSX8mXGeQhSQqDHzVPh0Vkdd1rls3yupaW8TTIaSSUQAS410KI8KUAMTMkTtqcA6K/c3IMcFQr9V9L3hOJNsd8PCAC0kowsRFG6inNbIaZ13s4QJ8NC2qCfsiG6myOh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1d++NwiHA03Rdgvx4zl7hDaFSLq9idxZRGzKkiYsaQ=;
 b=hhJ+7lQrZFbdqxTZbtW6/NkxwiJQtNAR9woyT2ibogfPkIC+p539Qt1ub63ZJWVdvWWlnbc+Wed04/Mib/mtFucPfBFHNuCoC7fwZHX9gW4LUc/0UTZpYc5oh7Cub3i83JpkW6ctPjH19uVerBaDKe6J1I/wMnRozK3dZTHgy/fo2cISowHt88KTMMb7klq/s+9kWfeBG3p5L2PlWrjS1gq5mnF/g6M5JPqLSczs+r9Z4iKGAqlRS37fG0lvCueWILhBHU9PDdqLp7+X5IfIKASB1RWKiaHtR3T+/RbtLGN+VUhhOjXLShhXsdOm5mODbW8CFFu51nc3VkeEHq7daQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1d++NwiHA03Rdgvx4zl7hDaFSLq9idxZRGzKkiYsaQ=;
 b=KSOND7mmVoUPCfp1ACxeWlZEZgIgX/b0u+VRNzQepnoyGBq2Zn0+A9aWHC9O5E+kQux0Sb2MyWbaApz+//eiAOoLW0i2j02xYmHuOnRyBN5YwLSWNXrE5FHM5SJ1pdgVcCH28awOWhj38KD1/u0ZWfh5QHKbZeEK1g5I8k/u2OY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 06/12] xen/common: add dom0 xen command line argument
 for Arm
Thread-Topic: [PATCH v5 06/12] xen/common: add dom0 xen command line argument
 for Arm
Thread-Index: AQHZbSQvU2J9PUHvFUGvULiLhkcjJK8qgQWA
Date: Fri, 14 Apr 2023 08:47:00 +0000
Message-ID: <8796C502-0822-4559-8167-105CDA3B1163@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-7-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-7-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8930:EE_|AM7EUR03FT037:EE_|GV1PR08MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: faa98a15-a307-408f-9197-08db3cc4d993
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9K8gC3MTYYbnKVJUielkADJtvj7YXYmkeN0xMkDa53oiRXuweiY8mhgNKLh7TfxY9YL3HKCPiWQ8Gej2es+opJiIh+5R4Pp3j8iXUlE7iQg92LIa4MlT93byjuGT61S/rFuob9htjz6y9rVFo/hkHVwnhPouEehksAPMvVejPJlqRktvVgyKdEvbxpftpNSnbOBTCISgbLoRLTlbHCQNb/k9B+t2v1053iknBVb320+WPvj3i7iHzrexA/NONO074vJXuOj0JluLCtQQS1CC5FLhHGsskCNVxkyO3xq7YhMc6i+frYEqJcQDBOm4wt1AA8TbLe15zfqRRS+EXBZkGLlekJeaWJxS6tSM841z5vdv4JW2z72qi+WpOlE76RZje3cK+Skh3Dd0/4/5puOJQEx+uxZSI6Nkx4GW+gBy/7Sva6ck6sDkx1n15RuVI/XtTrjIsYFKrWcjEVILA1oXIP7SpWfUuXtSczDs0Atb9l4twsAJWk17m2AgPwLrnCUVk23fnN2L+C90pvF7E6RXgPxdrvBcW/Ql6jf5MjIxVSrUJDvEK8SSUa3UikUhhKyyEonjCOuaBQvwA+kaUUFeKd01XwmjURHc+BxXGOWZK/Ym6YHFVTKQeauIekk4Eflgf06B5QPhj01hOBFtYsHHIw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(8676002)(8936002)(76116006)(91956017)(6862004)(41300700001)(5660300002)(66476007)(66446008)(66946007)(66556008)(2906002)(4326008)(64756008)(122000001)(316002)(6636002)(478600001)(37006003)(54906003)(86362001)(6486002)(38070700005)(38100700002)(53546011)(6506007)(186003)(6512007)(71200400001)(83380400001)(33656002)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0A5982B861DE5D4CB675C1279DDF056C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8930
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d2e52de-d392-4c29-8885-08db3cc4cffd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EO31HU4BPKQn4W+9HlPGkmMs6oH7ug6M0AzA3L9PY0BanFUWNVgkTmzUiv+Il/Eq9Q9HvrrLBR1hwMvR7vT9Bah5F7k0Tqhv49AVle/K/78KjUV7Hgnvyn/PuRvzLJgH0vJfZmhIbKEcS+AthMkzh/SWkMPS3BBGZQeN6tO0KmsMWbl3pJc3nKfJW7neL4n8VuOVDP0XpmZ+XzWXW94TAAkn9jTVxEtOh+u8DdBR11cHA6ArhtFwwqV4qogD2fzQy846Lw5bovJIy4B9Wozu4xWcTfBTIUb9E+DIoJd/uytr5i2E40Q10jII5LxV4Vd5cWEnASHGZeqhVBTmTeVmdSBsk3ydN9Ivg0byVdyt0x0y8dj8se+tWH69qWCPQKu6lil+jX+6xZKkackusmWjRZg1Mmi0qTpm8Z0SmHXJK4K1RA4qIEEhLWPrLCrAc2rwYNhtXoyPjOkesEHsewPp/9MOKY5dasgQQDapSsEHBehdqy+dH4tjH35AhXzt1LP+bpd+JUcVEE5ab6LSbutTkrX6sCb0Anl3nbuoA4UDVs4s1hnNH5IDSeI80E+1qiJ1dqA9uS0f/i0NCZd+JXi4qLb20dv4z3zHC/mk9yl4poMxHr+S19qCHVbu3v2/4A4Sv5mHSgARnPd1gkkSnU8kG2chu9d7NNsxmxCrs/ltQJ7cAlMTVei6FrgYJ0XajHFPLEwiY6XKnr0s6i+psfnC+w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(40470700004)(36840700001)(46966006)(4326008)(6636002)(54906003)(316002)(37006003)(70586007)(70206006)(6486002)(478600001)(5660300002)(6862004)(82310400005)(40480700001)(8936002)(41300700001)(8676002)(36756003)(356005)(53546011)(2906002)(82740400003)(81166007)(86362001)(33656002)(186003)(83380400001)(2616005)(26005)(107886003)(36860700001)(6506007)(40460700003)(6512007)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 08:47:16.3703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa98a15-a307-408f-9197-08db3cc4d993
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9916

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Currently x86 defines a Xen command line argument dom0=3D<list> where
> there can be specified dom0 controlling sub-options, to use it also
> on Arm, move the code that loops through the list of arguments from
> x86 to the common code and from there, call architecture specific
> functions to handle the comma separated sub-options.
>=20
> No functional changes are intended.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> Changes from v4:
> - return EINVAL in Arm implementation of parse_arch_dom0_param,
>   shorten variable name in the funtion from str_begin, str_end to
>   s, e. Removed variable rc from x86 parse_arch_dom0_param
>   implementation. (Jan)
> - Add R-By Jan
> Changes from v3:
> - new patch
> ---
> xen/arch/arm/domain_build.c |  5 ++++
> xen/arch/x86/dom0_build.c   | 48 ++++++++++++++-----------------------
> xen/common/domain.c         | 23 ++++++++++++++++++
> xen/include/xen/domain.h    |  1 +
> 4 files changed, 47 insertions(+), 30 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4f9d4f9d8867..eeb4662f0eee 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -59,6 +59,11 @@ static int __init parse_dom0_mem(const char *s)
> }
> custom_param("dom0_mem", parse_dom0_mem);
>=20
> +int __init parse_arch_dom0_param(const char *s, const char *e)
> +{
> +    return -EINVAL;
> +}
> +
> /* Override macros from asm/page.h to make them work with mfn_t */
> #undef virt_to_mfn
> #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 79234f18ff01..9f5300a3efbb 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -266,42 +266,30 @@ bool __initdata opt_dom0_pvh =3D !IS_ENABLED(CONFIG=
_PV);
> bool __initdata opt_dom0_verbose =3D IS_ENABLED(CONFIG_VERBOSE_DEBUG);
> bool __initdata opt_dom0_msr_relaxed;
>=20
> -static int __init cf_check parse_dom0_param(const char *s)
> +int __init parse_arch_dom0_param(const char *s, const char *e)
> {
> -    const char *ss;
> -    int rc =3D 0;
> +    int val;
>=20
> -    do {
> -        int val;
> -
> -        ss =3D strchr(s, ',');
> -        if ( !ss )
> -            ss =3D strchr(s, '\0');
> -
> -        if ( IS_ENABLED(CONFIG_PV) && !cmdline_strcmp(s, "pv") )
> -            opt_dom0_pvh =3D false;
> -        else if ( IS_ENABLED(CONFIG_HVM) && !cmdline_strcmp(s, "pvh") )
> -            opt_dom0_pvh =3D true;
> +    if ( IS_ENABLED(CONFIG_PV) && !cmdline_strcmp(s, "pv") )
> +        opt_dom0_pvh =3D false;
> +    else if ( IS_ENABLED(CONFIG_HVM) && !cmdline_strcmp(s, "pvh") )
> +        opt_dom0_pvh =3D true;
> #ifdef CONFIG_SHADOW_PAGING
> -        else if ( (val =3D parse_boolean("shadow", s, ss)) >=3D 0 )
> -            opt_dom0_shadow =3D val;
> +    else if ( (val =3D parse_boolean("shadow", s, e)) >=3D 0 )
> +        opt_dom0_shadow =3D val;
> #endif
> -        else if ( (val =3D parse_boolean("verbose", s, ss)) >=3D 0 )
> -            opt_dom0_verbose =3D val;
> -        else if ( IS_ENABLED(CONFIG_PV) &&
> -                  (val =3D parse_boolean("cpuid-faulting", s, ss)) >=3D =
0 )
> -            opt_dom0_cpuid_faulting =3D val;
> -        else if ( (val =3D parse_boolean("msr-relaxed", s, ss)) >=3D 0 )
> -            opt_dom0_msr_relaxed =3D val;
> -        else
> -            rc =3D -EINVAL;
> -
> -        s =3D ss + 1;
> -    } while ( *ss );
> +    else if ( (val =3D parse_boolean("verbose", s, e)) >=3D 0 )
> +        opt_dom0_verbose =3D val;
> +    else if ( IS_ENABLED(CONFIG_PV) &&
> +              (val =3D parse_boolean("cpuid-faulting", s, e)) >=3D 0 )
> +        opt_dom0_cpuid_faulting =3D val;
> +    else if ( (val =3D parse_boolean("msr-relaxed", s, e)) >=3D 0 )
> +        opt_dom0_msr_relaxed =3D val;
> +    else
> +        return -EINVAL;
>=20
> -    return rc;
> +    return 0;
> }
> -custom_param("dom0", parse_dom0_param);
>=20
> static char __initdata opt_dom0_ioports_disable[200] =3D "";
> string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 626debbae095..7779ba088675 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -364,6 +364,29 @@ static int __init cf_check parse_extra_guest_irqs(co=
nst char *s)
> }
> custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>=20
> +static int __init cf_check parse_dom0_param(const char *s)
> +{
> +    const char *ss;
> +    int rc =3D 0;
> +
> +    do {
> +        int ret;
> +
> +        ss =3D strchr(s, ',');
> +        if ( !ss )
> +            ss =3D strchr(s, '\0');
> +
> +        ret =3D parse_arch_dom0_param(s, ss);
> +        if ( ret && !rc )
> +            rc =3D ret;
> +
> +        s =3D ss + 1;
> +    } while ( *ss );
> +
> +    return rc;
> +}
> +custom_param("dom0", parse_dom0_param);
> +
> /*
>  * Release resources held by a domain.  There may or may not be live
>  * references to the domain, and it may or may not be fully constructed.
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 26f9c4f6dd5b..1df8f933d076 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -16,6 +16,7 @@ typedef union {
> struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id);
>=20
> unsigned int dom0_max_vcpus(void);
> +int parse_arch_dom0_param(const char *s, const char *e);
> struct vcpu *alloc_dom0_vcpu0(struct domain *dom0);
>=20
> int vcpu_reset(struct vcpu *);
> --=20
> 2.34.1
>=20


