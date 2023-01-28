Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3CE67F4D2
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 05:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486080.753565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLdEi-0003vE-Re; Sat, 28 Jan 2023 04:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486080.753565; Sat, 28 Jan 2023 04:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLdEi-0003sE-OC; Sat, 28 Jan 2023 04:54:44 +0000
Received: by outflank-mailman (input) for mailman id 486080;
 Sat, 28 Jan 2023 04:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFBb=5Z=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLdEg-0003s8-Rk
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 04:54:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2082.outbound.protection.outlook.com [40.107.15.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de8600bd-9ec7-11ed-a5d9-ddcf98b90cbd;
 Sat, 28 Jan 2023 05:54:39 +0100 (CET)
Received: from DB6PR0601CA0010.eurprd06.prod.outlook.com (2603:10a6:4:7b::20)
 by PAWPR08MB9663.eurprd08.prod.outlook.com (2603:10a6:102:2e0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Sat, 28 Jan
 2023 04:54:36 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::2b) by DB6PR0601CA0010.outlook.office365.com
 (2603:10a6:4:7b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Sat, 28 Jan 2023 04:54:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Sat, 28 Jan 2023 04:54:35 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Sat, 28 Jan 2023 04:54:34 +0000
Received: from e7c29e8277fd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 836F390F-E9AA-4110-B4DD-C86D929B1F01.1; 
 Sat, 28 Jan 2023 04:54:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7c29e8277fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Jan 2023 04:54:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6558.eurprd08.prod.outlook.com (2603:10a6:102:151::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Sat, 28 Jan
 2023 04:54:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Sat, 28 Jan 2023
 04:54:26 +0000
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
X-Inumbo-ID: de8600bd-9ec7-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JT/aJUB8U4AgaGOam6ZEMPMEVnAM6/l9M9Q8RKHRzw=;
 b=wbcLZF1L7hRZNDAy5Al+ZCIrGu2tP0KzG2+4N1SoNUedd/xVlGrY6e0p+W5PZKTrJjsVew/SmdobreqOvcAlGyFtcziG6txOMriq6WwFp/R/TsbNVPMneQA7oZuV5CCm4Dmqvu67lx5WOxm07py1W9FtiwCu3IrvKqnkfZJfvq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QovIZRGzb8n3AVEeHbDozuQ5+S6KeS1spXUu+l19sBydMf+2LU3NUPn7WIZC53bJCmWUnLbN+vwJZFxOfQW8aTzYxfQtveHxv7H0lsjozp+yut7/1ghxBl6BFe4NiN2q6f+ODmvaeYoxO2Q0rMAgtovxDfw1OL8nWYuX7NoqUW9lA0EGQkrjmqjNCPPjXU7mZrF7S4Z8jeoYywMK8YJJ58S4wes94xAwGkXOb/dFMJ6lZgjtsI5ftrghMuzmGgtjeWhYtuHXVmCKpcjumzNSVgcfqJiDqkzc/NzQ8Vq9fOroPQLwqc4+B2eyHyndMPMpsUYSDKGl8GXrM5ZQnorYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JT/aJUB8U4AgaGOam6ZEMPMEVnAM6/l9M9Q8RKHRzw=;
 b=B6is1xiqObPSjVd8MKUurnD9f/K5G+xic1ljINhDcws6Mo/oFPvgy/0wDMvD5PsRkg5Xt9niMv9U5Y93X6jJ02Y4S/xz9qrl55KEsFBI0aCHrIYoqdhPHgfVW0ICQDIc8lHIXpAxRfODvz5iVFY9ML09XeAy5jrovVHoyYfbmr4yVN85dCBs/Kc8y/Ga1kx4e7Tup5PsBLk8L3fPN20uRPPe3IagOxyCvwG3vBpQHgzC2THuNyvGo9z4yNmFPBWeHE70QmgPe0MmfUPtnDoPiMkccVv0ebRbCxET705p8mKQfwIHaERK9ayFxcYLyN/6phloca07wUOViEPDsAcCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JT/aJUB8U4AgaGOam6ZEMPMEVnAM6/l9M9Q8RKHRzw=;
 b=wbcLZF1L7hRZNDAy5Al+ZCIrGu2tP0KzG2+4N1SoNUedd/xVlGrY6e0p+W5PZKTrJjsVew/SmdobreqOvcAlGyFtcziG6txOMriq6WwFp/R/TsbNVPMneQA7oZuV5CCm4Dmqvu67lx5WOxm07py1W9FtiwCu3IrvKqnkfZJfvq8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH v5 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHZMolY4mue8S6qKE2ltVytEV95o66zFE0A
Date: Sat, 28 Jan 2023 04:54:25 +0000
Message-ID:
 <AS8PR08MB7991FBCB731CC548C98ECA2792CD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-4-julien@xen.org>
In-Reply-To: <20230127195508.2786-4-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5E3F718C6378674A847101709A516BA3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6558:EE_|DBAEUR03FT044:EE_|PAWPR08MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: d01c452d-b2fb-4069-a57f-08db00ebc092
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r6Gf9fTXr8J/6vCP/NL7tHMcLznIaNhB81chsfL3rnt1l2w6ae1quNTwjpqHNi3VEogi0ollPa0i81RXxLHBf1b06vijgcbGYhUIsIEqP8ICShchoN0HB329U28rOWFWx7LuzGKbbc5vaaDWesViPkV6QRyQvjk6Z7w3kC3T0DOVn77c2zrU9vpj7psnO81tjzo/D4YGKEkUPwCqaW+oUrBlSDtffV4rtlTwDs5NOoR/gm8RaUMJIKFCqKoE5Nw1uIodAHhOeQHGqkgWEanaLDbUrblBhS3Sll8M65Dd6RqFsjD4854/SPiSVDdac2Nje6G76WUe5kQ4vbGDzhNefMUJ0je+tdqBqymHxyWt8m3gkebQOqkMrPNymtvTwr39UEqm+/pTr1kwuT27hJLQk9ExAHdEtj6X/qDrCmQ6a4XUnRz6VJlMpIph0I1rPrjeySHsJDZhAz8hKaypZkeQClnWzgh1utljXSJMwRzpZ2V5c98YiqWeLPm/dM0C7GH4nOCeacdyCX8eANNex0xG6fZygnlh0GHZGbceviESgJJ+GD1lf0YtS20Hb9i6OvEMLlDbFVJZf0ERXP1RfdzSb0CKo3bxVs9DK2ytYA6jIAQ8NNQuSa1o0Hl3mW8UaZtVAK6jHjGA34VeSSXPkrQhCc6RW90z07lRVuXyjhe7FxVYqFKDkZRjoBnVJSP/gWn31vH6NoYVknq+wuCOIlRm7w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199018)(66476007)(66556008)(64756008)(66946007)(76116006)(66446008)(41300700001)(83380400001)(4326008)(8676002)(52536014)(8936002)(316002)(122000001)(9686003)(33656002)(55016003)(2906002)(110136005)(54906003)(5660300002)(478600001)(86362001)(7696005)(71200400001)(6506007)(38070700005)(26005)(186003)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6558
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac73fc11-e0b8-49e9-ba8d-08db00ebbad1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FOELtVZruyBzO0j7zUgxJtZGHUqxq+KbTQBHocGzFIxSrKj3/TnbVnb0e89oqVILappDbdy2Yv65VP0zDWEGAPX3t/jPJ2gIwO7FbqByLrVxjD+gEBxQ9rb+KwuTKy+gyAtglbnh3kzPhk9gfTBitarLTk3eFXXyKiumshynVlTXRfGXrXLjuOWty2H3pkMYfpw3TuvTkrASXcULLzBdoQcs5/lHBMZaY7D3T6gsOUsM5Hz9mnE/u9xdKX+ifL9efOJg2DWEIGq/D2IOLltnlo84dwcP7dSxFkcjMOWM7Q11Wtd1gXd10LgOW3CD5+H9vqEFR+altkm45rlTOTGD8zaEAv1vazsGqJ+sgjvgqfKZW9WDQBCCfUgdx+wm4eUoG4RrmHiUrGgkFEzH1w9ZhuRdM+c5ig04HwxAVELeNdBtdKFLa0yxSRdQKBitjvxGbYC23qY2jk8Hrs3UsupBHT8ycOdcnKuXIiRxkjpNTyLOkKiM4fsik/QqNWN1lCcFkHkbKYhE4v1FvjTbEReR0aHEuBijIFUziLT1q2qmGfBBi3NtWZSPrrOAwtbYkqm916S3FtwQ1vDHlr108AAdlMpk+KQ/cdyQmHDhS6hd2SBHBKPYXLeLRMZL0lTlbFunaj1WH743LISH/pEf3aI87W8XnousImx834dKqfK6b7cfZoMtuher2CQCWCN8pyRF7dUOBC7D9JMRudbeJl7IPA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(54906003)(110136005)(5660300002)(7696005)(40460700003)(86362001)(47076005)(336012)(2906002)(40480700001)(186003)(55016003)(33656002)(26005)(6506007)(107886003)(9686003)(478600001)(83380400001)(41300700001)(81166007)(4326008)(82310400005)(70206006)(70586007)(82740400003)(316002)(52536014)(356005)(8676002)(8936002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 04:54:35.1051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d01c452d-b2fb-4069-a57f-08db00ebc092
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9663

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v5 3/5] xen/arm64: mm: Introduce helpers to
> prepare/enable/disable the identity mapping
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
>=20
> On some platform, the identity mapping may have to start at 0. If we alwa=
ys
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
>=20
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
>=20
> Two new external helpers are introduced:
>     - arch_setup_page_tables() will setup the page-tables so it is
>       easy to create the mapping afterwards.
>     - update_identity_mapping() will create/remove the identity mapping
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
With some nits below that can definitely be fixed on commit.

Tested on FVP in Arm64 mode, so:
Tested-by: Henry Wang <Henry.Wang@arm.com>

> +static void __init prepare_boot_identity_mapping(void)
> +{
> +    paddr_t id_addr =3D virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    /*
> +     * We will be re-using the boot ID tables. They may not have been
> +     * zeroed but they should be unlinked. So it is fine to use
> +     * clear_page().
> +     */
> +    clear_page(boot_first_id);
> +    clear_page(boot_second_id);
> +    clear_page(boot_third_id);
> +
> +    if ( id_offsets[0] !=3D 0 )
> +        panic("Cannot handled ID mapping above 512GB\n");

Nit: s/handled/handle/

> +
> +static void __init prepare_runtime_identity_mapping(void)
> +{
> +    paddr_t id_addr =3D virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    if ( id_offsets[0] >=3D IDENTITY_MAPPING_AREA_NR_L0 )
> +        panic("Cannot handled ID mapping above 512GB\n");

Same here.

> +void arch_setup_page_tables(void);
> +
> +/*
> + * Enable/disable the identity mapping in the live page-tables (i.e.
> + * the one pointer by TTBR_EL2).

Nit: I might be wrong but I think s/pointer/pointed/.

> + *
> + * Note that nested a call (e.g. enable=3Dtrue, enable=3Dtrue) is not

Nit: s/nested/nesting/ or "a nested call"?

> + * supported.
> + */
> +void update_identity_mapping(bool enable);

Kind regards,
Henry


