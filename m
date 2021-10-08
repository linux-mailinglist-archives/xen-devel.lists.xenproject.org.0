Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAEA4265F8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204547.359711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlIQ-0002xI-PZ; Fri, 08 Oct 2021 08:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204547.359711; Fri, 08 Oct 2021 08:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlIQ-0002uR-Le; Fri, 08 Oct 2021 08:32:02 +0000
Received: by outflank-mailman (input) for mailman id 204547;
 Fri, 08 Oct 2021 08:32:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CyP=O4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mYlIP-0002sr-29
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:32:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff413a4-2354-4f8b-978b-0c770ddb7b52;
 Fri, 08 Oct 2021 08:31:59 +0000 (UTC)
Received: from DB6PR0201CA0007.eurprd02.prod.outlook.com (2603:10a6:4:3f::17)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 8 Oct
 2021 08:31:57 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::b3) by DB6PR0201CA0007.outlook.office365.com
 (2603:10a6:4:3f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend
 Transport; Fri, 8 Oct 2021 08:31:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 08:31:56 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 08 Oct 2021 08:31:56 +0000
Received: from 0d743de79010.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0333BCFD-5479-4F3F-B83F-B0E79F9A7AB2.1; 
 Fri, 08 Oct 2021 08:31:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d743de79010.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Oct 2021 08:31:46 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 (2603:10a6:203:4b::22) by AM5PR0801MB1889.eurprd08.prod.outlook.com
 (2603:10a6:203:49::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 08:31:44 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215]) by AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215%3]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 08:31:44 +0000
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
X-Inumbo-ID: eff413a4-2354-4f8b-978b-0c770ddb7b52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpWulWwwnr2zmixwpIZOKIoxsGUD2NJ+ijLqHHq3QbE=;
 b=dhlU6ln6A7bW2EwY5KJ0r2QFxhvVkFtfOhM94snmCcINwBqb0/PIIv7AmWZ7dTN1ptpGSXMlByflbfNVBUpheWkbnfUeX024Xpvngh6fch4EigyA4PngkJWvk+ANyZStvqvu9rzXLKlFTHuHGOrqedbTS/zQHatjsc2Xkd2ue2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd218c5383b6121d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBlxecIgbKl7pBlD9U/QoZqF7lzCBevTvL/Kfol+SH2QAL9Vag355uGS3XcuEXeeFXEe+fN0nU3E1W0cmKnl7ZagoeHCtZSEnbQE+YCMkoqxYr2JY5T0YGn6AOLBpjQTL+PNkCkDAfKvpvWkInB5ZCcohB4NEmKt5B7Yph0fi2ig2ySNvCN6sxR4EXBzC503ZLnKRkrtYXJzONk+Wp+D15yeZiZEy9ldEIUOeJe7qntdmAO9nQ65ABJm1136xzO/f79LKPzk5v1HJpPmmalZiiV70LdP8a+prY1v9lhkAP/9NxJBLey4MhXOuq8uMVDUGfoQE3XE9iveKUWAO5Xm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpWulWwwnr2zmixwpIZOKIoxsGUD2NJ+ijLqHHq3QbE=;
 b=VkPEI6NPHWYR0dsP4H5lLmNoNCXwGT2ukvs49+ghEiVD1chRWR8KYh05X5gPZnWBXW70ERuN229194XjsUkbKL28YLAhJIC2h1orykxavRQVpyUfyg6MTAW/JnLNhQGg3Ov05eSGQyXAj1oaqqzwZkqhk/urGr833U+5tOTkT06xzCcrfvFbDnC2yus6ilru7vSnzqku1+4n+90cqO9eEKugDMTwpYBjhayol8iHVdkyDD7/BTu6GFpY+CWxJ4le6nWf/D5s9O0wX7p6pE2ryAPAOyCP2uaepruxZPufLS9oEoH+TfrDbpHHdXVHrhZlyt1Y6Llffjp3uR/U3BvAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpWulWwwnr2zmixwpIZOKIoxsGUD2NJ+ijLqHHq3QbE=;
 b=dhlU6ln6A7bW2EwY5KJ0r2QFxhvVkFtfOhM94snmCcINwBqb0/PIIv7AmWZ7dTN1ptpGSXMlByflbfNVBUpheWkbnfUeX024Xpvngh6fch4EigyA4PngkJWvk+ANyZStvqvu9rzXLKlFTHuHGOrqedbTS/zQHatjsc2Xkd2ue2s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/3] xen/arm: Check for PMU platform support
Thread-Topic: [PATCH v3 2/3] xen/arm: Check for PMU platform support
Thread-Index: AQHXvB1V0VFSwEt/Q0SfrOAbW/sfCavIxZ2A
Date: Fri, 8 Oct 2021 08:31:44 +0000
Message-ID: <0448EAA4-57BA-4146-8FF3-E02CBBAC2E85@arm.com>
References: <20211008081933.18546-1-michal.orzel@arm.com>
 <20211008081933.18546-3-michal.orzel@arm.com>
In-Reply-To: <20211008081933.18546-3-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ca3d216b-f1cb-4b64-42e0-08d98a361704
x-ms-traffictypediagnostic: AM5PR0801MB1889:|AM6PR08MB4599:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4599087459C4720D404D7AB69DB29@AM6PR08MB4599.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 H2ulycANC6FCdWjXVYAKj1u79Iqw0pg8R2p5qU2//iWnJ4ufe/NR+BpqR75S8PVqYPYFyvTEN1+TM3uncVeTvJuVSnGFNdrdkSc0i1XL20iP9fU+hd+MzK5ataJDStXkBVgc/ekd+eWR2+lEUM0daEEoXLJCAoEUfcZyV3oEQQk8duUmpR0ylifOXt3A1Xa0hm/HvUYV31h/nxGaXmPQXhUpxO1KS3zlOrof5Z0n4d/Qtv7L5WsMubEWnYD/P7mKa38+76mXKzUSAE4Dn9IFC0l8wmb04jd6dHYxhearHBz3mcjlEud/PD6ToL+UqyCFI1sv9a9suZOdUc/IDWNzcLn4lxbS6XXZW7y10mgizYqyLS5m+wqJl+mqEEqnN5z6jg5ZcwwyKWKLymvW+S6G9mrYVIZynVQyLHRryauLDX9lJBSCCA6kknO4/Yd4Z/Czdto9Gnzw80x0YwJ2Zjnbv+ZLLBk7NGdcsp//mlMqirygZFq+5sKEXh1Eake9u4/EUiKgwZWhuXhMIctcf8mrtmERR6xg2azqNlgq/nB20587+f+6EJHPfCqP8TvGzGBusBL23mej3qBUgCu+PsKCHhuYU8eiywTfWI4QltzPJz0YGa7h+fLbk+ERcM20CeU09uwmBNO2do2vjn3nZH7oDAyozIcFa85Ray6Hz45XRln72zxV/zMZHmW5qt/Qv+GWwatWarhjsIlv/4IipxST/TVanzvhy4IGcqVknRpWI+cJiSXLqaog/y6R06H8q/xg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2019.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(2616005)(316002)(38070700005)(26005)(37006003)(6636002)(8936002)(6512007)(4326008)(6862004)(6506007)(53546011)(91956017)(5660300002)(6486002)(76116006)(2906002)(36756003)(66946007)(8676002)(66476007)(122000001)(66556008)(508600001)(83380400001)(186003)(66446008)(64756008)(86362001)(54906003)(38100700002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D4845FE39A4E546BDB5700B75CA89D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1889
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	782e08f6-f2b7-4702-36cb-08d98a360f8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QLuoi9fbT5D9pc9luHO8krCCz5U1rjsdv2GisYCLhyAwrPaz9+AQrROtg3OwgqKn48Pw86mtMJdIATYPziODxE+MnF605WFFcXdhuSiFeB+hnHg7OHNT2tbL3NilavjSaw5y/5XPK/r+JyRI0CkfdJCkO9Co7P3rc7e7CIMcf1EHmS6fGJrPamVl7CwR8ucUABmnuKqE8sCNjrweKlW2r907st+nqKcbXagjBGiPQEBVkkXR/QJJNKJY4jlZ3LUjpF1URS32uJqGiaSaos/FOPD+F8D0nLEvn628EVxaH81kYC3cYDFGB0AO354JzDyq4rt3T7B2CeGbO/uy5vU9gaeglMHz+tKVq94gRfq+TE0VprSTnYCeNeC+hoWHDjtH9b7FybogGckco81mJU2y15x0wh45LsD6l40XlpAwYT8WuiwFb1F7xIYBsXaKRrGM84zpR1gAoTdFBgmq587y9fEfvs846SoLqD5d2vTwfE+xF6FSGnk21S84ak/M8szO58SToVbYolEMUkR4ubzXmJUrC+qmuhcHaCKzhYlwLm1lM6g+Qn87aAiWxCEhD8unoqI7ocVYnBcom+Kxy6MKgyv8abpwiGoHuH2t4wP8yD90QTwRlhyQybAlFHdUsWn24duJkjBztGubuhwTuHmpzb5cyxYlCN1+xS0J+I2bJpBpPMqrAiCkoxPGwpu8/e1Y1ZX5f991zaNLwMTj96BN4g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(70586007)(5660300002)(2906002)(4326008)(70206006)(33656002)(26005)(6636002)(6862004)(186003)(86362001)(36756003)(8936002)(81166007)(2616005)(83380400001)(47076005)(336012)(356005)(107886003)(54906003)(37006003)(316002)(6506007)(53546011)(6512007)(508600001)(8676002)(6486002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 08:31:56.8578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3d216b-f1cb-4b64-42e0-08d98a361704
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599

Hi Michal,

> On 8 Oct 2021, at 09:19, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> ID_AA64DFR0_EL1/ID_DFR0_EL1 registers provide
> information about PMU support. Replace structure
> dbg64/dbg32 with a union and fill in all the
> register fields according to document:
> ARM Architecture Registers(DDI 0595, 2021-06).
>=20
> Add macros boot_dbg_feature64/boot_dbg_feature32
> to check for a debug feature. Add macro
> cpu_has_pmu to check for PMU support.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes since v2:
> -none
> Changes since v1:
> -new in v2
> ---
> xen/include/asm-arm/cpufeature.h | 49 ++++++++++++++++++++++++++++++--
> 1 file changed, 47 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index 5ca09b0bff..4fce23844d 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -4,6 +4,7 @@
> #ifdef CONFIG_ARM_64
> #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
> #define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
> +#define boot_dbg_feature64(feat)       (system_cpuinfo.dbg64.feat)
>=20
> #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) =3D=3D 2)
>=20
> @@ -22,6 +23,7 @@
>=20
> #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
> #define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
> +#define boot_dbg_feature32(feat)       (system_cpuinfo.dbg32.feat)
>=20
> #define cpu_has_arm       (boot_cpu_feature32(arm) =3D=3D 1)
> #define cpu_has_thumb     (boot_cpu_feature32(thumb) >=3D 1)
> @@ -32,8 +34,10 @@
>=20
> #ifdef CONFIG_ARM_32
> #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) =3D=3D 1)
> +#define cpu_has_pmu       (boot_dbg_feature32(perfmon) >=3D 1)
> #else
> #define cpu_has_gentimer  (1)
> +#define cpu_has_pmu       (boot_dbg_feature64(pmu_ver) >=3D 1)
> #endif
> #define cpu_has_security  (boot_cpu_feature32(security) > 0)
>=20
> @@ -181,8 +185,28 @@ struct cpuinfo_arm {
>         };
>     } pfr64;
>=20
> -    struct {
> +    union {
>         register_t bits[2];
> +        struct {
> +            /* DFR0 */
> +            unsigned long debug_ver:4;
> +            unsigned long trace_ver:4;
> +            unsigned long pmu_ver:4;
> +            unsigned long brps:4;
> +            unsigned long __res0:4;
> +            unsigned long wrps:4;
> +            unsigned long __res1:4;
> +            unsigned long ctx_cmps:4;
> +            unsigned long pms_ver:4;
> +            unsigned long double_lock:4;
> +            unsigned long trace_filt:4;
> +            unsigned long __res2:4;
> +            unsigned long mtpmu:4;
> +            unsigned long __res3:12;
> +
> +            /* DFR1 */
> +            unsigned long __res4:64;
> +        };
>     } dbg64;
>=20
>     struct {
> @@ -321,8 +345,29 @@ struct cpuinfo_arm {
>         };
>     } pfr32;
>=20
> -    struct {
> +    union {
>         register_t bits[2];
> +        struct {
> +            /* DFR0 */
> +            unsigned long copdbg:4;
> +            unsigned long copsdbg:4;
> +            unsigned long mmapdbg:4;
> +            unsigned long coptrc:4;
> +            unsigned long mmaptrc:4;
> +            unsigned long mprofdbg:4;
> +            unsigned long perfmon:4;
> +            unsigned long tracefilt:4;
> +#ifdef CONFIG_ARM_64
> +            unsigned long __res0:32;
> +#endif
> +
> +            /* DFR1 */
> +            unsigned long mtpmu:4;
> +            unsigned long __res1:28;
> +#ifdef CONFIG_ARM_64
> +            unsigned long __res2:32;
> +#endif
> +        };
>     } dbg32;
>=20
>     struct {
> --=20
> 2.29.0
>=20
>=20


