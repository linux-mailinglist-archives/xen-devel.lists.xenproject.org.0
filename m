Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC77B16E0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609386.948444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qln2x-0001ab-6w; Thu, 28 Sep 2023 09:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609386.948444; Thu, 28 Sep 2023 09:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qln2x-0001Xx-3k; Thu, 28 Sep 2023 09:10:59 +0000
Received: by outflank-mailman (input) for mailman id 609386;
 Thu, 28 Sep 2023 09:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVKH=FM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qln2w-0001Xr-Ci
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:10:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee29b5b9-5dde-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 11:10:55 +0200 (CEST)
Received: from DB8PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:10:a0::34)
 by AM0PR08MB5443.eurprd08.prod.outlook.com (2603:10a6:208:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 09:10:52 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::b9) by DB8PR09CA0021.outlook.office365.com
 (2603:10a6:10:a0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22 via Frontend
 Transport; Thu, 28 Sep 2023 09:10:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Thu, 28 Sep 2023 09:10:52 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Thu, 28 Sep 2023 09:10:52 +0000
Received: from 53173c12577c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3F989A5-0DBF-4A6D-924E-1733CA8120CB.1; 
 Thu, 28 Sep 2023 09:10:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53173c12577c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Sep 2023 09:10:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9148.eurprd08.prod.outlook.com (2603:10a6:20b:57f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 09:10:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 09:10:43 +0000
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
X-Inumbo-ID: ee29b5b9-5dde-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8OEIFLGNbEbr8ewFOPuLQ03fLbfQCDHcDnJZWqWZC0=;
 b=qUtxhFo1ocxTDKGdVOiQGzcsA2lfMuHObntyckeEw3zIlKPDdR7tsSQUDerqSnqDQAXtsPzuJ1l2/VDkVWySlmf2Qeq3x7/quQ2u5yQ1LU0IKdv5n0r/70wcQyd4maTq7o5R4bUSdm605AKmMpmlraS6h6Ufn3J4L9GvixKnOy0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3ed919f879bff576
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFiGpHvoJeFtDaiWXOuFZ1+wR8Uiu/dud9HHECB6+ZahULMimpaZvNbbuxC0gEM8yAKO9OQ6saRQKvLLtGd9EroBGK+p4NMfI7RrlgsxHVmEyUfXIPrSL4wTMEEjOngpTkwp1QXwd4kYVJa3EcPXPLt2LYhOKNVIzublitQFOlm8vjx78G5dRyEXYvz3Y4yEepQ4XOhKvDbGwhjP6CO4Z3SDvI+kMCHjLL2HQdDuzGd8RYzy4EiSjlAKxX3PGkrrxzNf2aC6isOIHyxms+u2TER2nq9r7oYftrc4jlk58ckrsEL7qmhm+AkxUY314/3mys25GceB5EKH9FXolnI9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8OEIFLGNbEbr8ewFOPuLQ03fLbfQCDHcDnJZWqWZC0=;
 b=nGJswWWhsP4AI6c3OuYyjti4JLm2g68hx9ybWzo5JymM9uL10Kgd9ll95Mr6+GCAYY0iAtrjncE2944YnJmjQJujcBHbySEyg5gEdRm1dOJT/7wD3oq76jCO2LBOZdYRIblwKtiMy/2B59tykj8D7X7JELq8j093O3/tmNeibV+OyHpoBqHTKLzEfZcfgJ9kEiPdTH/ebP5jxVVwdsjGsr5305qFTC6a6FY4WsuGpRVjMSCFJHZ105yCJ/S5eEVH2Owd+TXHZ0qwq1P3pgoVwp7lFfyMqt0AhqBkHzXh9FoJwLUR5QBn148jGcwrN18XnzI/15ZoOQD0JnRqe+iXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8OEIFLGNbEbr8ewFOPuLQ03fLbfQCDHcDnJZWqWZC0=;
 b=qUtxhFo1ocxTDKGdVOiQGzcsA2lfMuHObntyckeEw3zIlKPDdR7tsSQUDerqSnqDQAXtsPzuJ1l2/VDkVWySlmf2Qeq3x7/quQ2u5yQ1LU0IKdv5n0r/70wcQyd4maTq7o5R4bUSdm605AKmMpmlraS6h6Ufn3J4L9GvixKnOy0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] docs/misra: add rule 2.1 exceptions
Thread-Topic: [PATCH v2] docs/misra: add rule 2.1 exceptions
Thread-Index: AQHZ1hLASNqKg0R4JUWaB9eFf7S+WLAwKx4A
Date: Thu, 28 Sep 2023 09:10:43 +0000
Message-ID: <57A3B9BE-BBB2-42D4-B576-C539CDA9A539@arm.com>
References: <20230823223942.2981782-1-sstabellini@kernel.org>
In-Reply-To: <20230823223942.2981782-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9148:EE_|DBAEUR03FT010:EE_|AM0PR08MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfa4ca0-5f80-4def-69d3-08dbc002d072
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /v3lyNmiIHTj1R0FbjuOGpVGQIUwMceD4wUo9mlFAayZg6SrIeSOFLto5/pvZCi1Pt1YmeDTFOegeo7ubpBFiCaFeQxyiqoSRR6kuQOZVxtdD5KHnJaRPouDLAcHMy5cQqgNqTK/MNUnltQXrcb35NB2HeAqDO8UTyMND7cD+69QlGMb/XsBohSXxuZxLhCFiCbjO+Vq9EsLJTo7kaku8hcSWTGadLF6EG3L8HhDNLekBMMzSF+7o3riaHIMDnhLhbb9oDNL1o7nBgxaP7eS0mAPgtE4X1ak/CJad5EAz2AjKJQag+7ru2y4bz2G8c5jH4/LQ+nPCeV/+0iRgjCsX+v2WGdTX9uRm9Nj0mPwxQIHZan/hAcK28YvVvN6EU+bQJy9Kn2kt4DFSCTZ27b50eM0hVfUeSNAE0CfKtVBLAr4Ee0nRrK+AI0JP/8nzCOuE++3xbSBdBfST61fJlVf/BICohmHUNKJI3Xe2Ig3fzPFUUT8+j88Ohx/+l4j0/CAEi8qWjnHiH+fGIFbVEOQw7J9YQew2hkk5iz8Cp/HOnSU6eMaN5csbfWiG8im/XHpt8sKiQOJZAPRutjZZM55+ny748zITzQDB2Nvz46txLVyE4csSABlMR6AZDaWzktMqnoiMW+wQp/h60Y5u1arRMVpuiYSUcG0dhlTmpS9L+muM8DK/x14sz8GYO1a2AGL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(83380400001)(5660300002)(76116006)(91956017)(66556008)(41300700001)(66476007)(64756008)(66946007)(66446008)(54906003)(316002)(2616005)(53546011)(478600001)(6506007)(71200400001)(6512007)(6486002)(2906002)(6916009)(8676002)(122000001)(4326008)(38070700005)(8936002)(33656002)(36756003)(86362001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B6D4391BC1BAF14CBA580FFBB8C1F343@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9148
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44a29294-264b-436f-bc43-08dbc002caff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sK9te0LFCWjaZqDvg1QlrXTwy3jWHzggZzc8gDSJUKK3uSmOWxF33hm+KSm+mFfjBmyhzylo8E9GKH7FQiJYZAi3FkianN+hzoSDUcDoxiZvPf8+6tijqY6f1Bz+hVlkAQQQ3ShJGNnKQ4FVDkLj+lJruRMRHtU3aUuRWgJRxDAm1jGadmLz8qzxf2hOPSwo7LGExfwtsXun5SMakyRrPU7bRguu0WUQOiM8RoQlfUe5Cf+AK/jfKM5c2MCt1mjkoT2vlfmxhcNT6nJ3J94IVgGIsCf4BDLARWVyFbWL0hpOP9gphpYgzwNCwpuQTxiiEpvWcJPEm3PKo94NpDUEXlWzd3BUW4LAy/X2gCwshkV3PKJkDmAFWgIEnq5YHEyk+OJFQrFGlJqIhIhtKdmcfJ1TsmpI4EA6TZI9zwv441UGiufw7MJSnOmVpN40QilJSRKC/uQec0y+ZUcS8Pybzl4/741E0D3ZCpx/p+lrBECbkEJIxJ509UKUrJR6kYFC6ft4jFD1MhH2XXUASVdvVAHZ5oSGOFRAx7qETsGGMT1I2Ni9S/FLEYn2ToNcRcZb+i52x/N8azU9YM9POqszHXC+u0PNbWdsbqdKVTbGqNGt2taYgDSnEnNyfP28pRCFY8/yrv0ZDn0PrthY5u3+GxDrn8xHGMSL6MCBGeohpv23ox83eHwNWeSEP/ZHNELyJEmi4pb9km+IWgX5D7Pi6e95vepJ8i1iRmDgJUAKFM9rEpe0ElAIG72zF6oncXGCfbvn+UE11i27P1u2F8Q6cA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(82310400011)(186009)(46966006)(40470700004)(36840700001)(36756003)(86362001)(356005)(81166007)(82740400003)(33656002)(40460700003)(40480700001)(53546011)(478600001)(6506007)(6512007)(2616005)(336012)(41300700001)(26005)(5660300002)(4326008)(8676002)(8936002)(6862004)(2906002)(316002)(6486002)(54906003)(70206006)(70586007)(36860700001)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:10:52.2527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfa4ca0-5f80-4def-69d3-08dbc002d072
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5443

Hi Stefano,

> On 24 Aug 2023, at 00:39, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> During the discussions that led to the acceptance of Rule 2.1, we
> decided on a few exceptions that were not properly recorded in
> rules.rst. Add them now.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that safe.json and the codebase are not yet updated with an
> appropriate tag for BUG, panic and friends.
>=20
> v2:
> - fix typo in commit message
> - use "only referenced from assembly"
> - use "Deliberate unreachability caused by"
> - add "See safe.json"
> - add acked-by (although I also added "See safe.json")
> ---
> docs/misra/rules.rst | 13 ++++++++++++-
> 1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 8f0e4d3f25..4f33ed4ba6 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -106,7 +106,18 @@ maintainers if you want to suggest a change.
>    * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_02_01_1.c>`_
>      - Required
>      - A project shall not contain unreachable code
> -     -
> +     - The following are allowed:
> +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HV=
M)) { S; }
> +         - Switch with a controlling value statically determined not to
> +           match one or more case statements
> +         - Functions that are intended to be referenced only from
> +           assembly code (e.g. 'do_trap_fiq')
> +         - Deliberate unreachability caused by certain macros/functions,
> +           e.g. BUG, assert_failed, panic, etc. See safe.json.

As Julien requested, you should remove this.

With that handled:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> +         - asm-offsets.c, as they are not linked deliberately, because
> +           they are used to generate definitions for asm modules
> +         - Declarations without initializer are safe, as they are not
> +           executed
>=20
>    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_02_06.c>`_
>      - Advisory
> --=20
> 2.25.1
>=20


