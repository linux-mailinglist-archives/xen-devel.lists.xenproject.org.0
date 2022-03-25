Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69554E7008
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 10:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294619.501021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXgKF-0005iD-V0; Fri, 25 Mar 2022 09:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294619.501021; Fri, 25 Mar 2022 09:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXgKF-0005fl-Rq; Fri, 25 Mar 2022 09:33:43 +0000
Received: by outflank-mailman (input) for mailman id 294619;
 Fri, 25 Mar 2022 09:33:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXgKD-0005ff-Ft
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 09:33:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a71cc311-ac1e-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 10:33:40 +0100 (CET)
Received: from AS8PR04CA0121.eurprd04.prod.outlook.com (2603:10a6:20b:127::6)
 by HE1PR0801MB1722.eurprd08.prod.outlook.com (2603:10a6:3:87::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Fri, 25 Mar
 2022 09:33:37 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::d) by AS8PR04CA0121.outlook.office365.com
 (2603:10a6:20b:127::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 09:33:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 09:33:36 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 25 Mar 2022 09:33:36 +0000
Received: from 5330d1730513.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 873BFFC1-B7D0-4C65-B2D4-602AEC1EED46.1; 
 Fri, 25 Mar 2022 09:33:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5330d1730513.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 09:33:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7462.eurprd08.prod.outlook.com (2603:10a6:10:355::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 09:33:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 09:33:28 +0000
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
X-Inumbo-ID: a71cc311-ac1e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJOgJaLOM9mlY/CzyQdW/GDwiNokse55jq/oxEtUXOw=;
 b=eAX2bumJ4R/pp5egSLaPlRbEvxfN6E6WIw2armaJXn9StJIQx2IEu43nLlje3rt1zoXMGab/fp0naCGvbZ+G8Pj2ZfPsnfzkGkr8n8BXgEPlTO8iEuC8eXG3a0Bjq1rnKAubvngZHfjsbhx4EPoaj8gFdx8LfMyLDuXH4mJkock=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 277d7e080eed7b4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iusr2VbT6rdIHqIdAiZ7mEwsjhau7iW0SEXm8xHrNvuDBLTc7hCcJOEhY33m9nV6m0DoXsG4lXZTRvdbuQ2E9sy+Uu1fapFO8if/haY2VsYsPlfbGyOvqNaoQnn3RKxfvkyfP5ivWQ1WFKES3929AsB3WCfILYwCu061xtP06JVZPsaZtXPLm1hYdwoDCvuWfySXaYcmENI8ahVdlUBMH7Y7Py1iNzP04YuOLhuVVF4/aM9SoRprcgR8vWvR9OBRuB8o+JbVpjER1Pb5r2zccpKDxmRcd6PwMwC3X92Q/UKteS8BUeRmfAKpFMtAgZgpMAHX2VBls4rJxJxECREsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJOgJaLOM9mlY/CzyQdW/GDwiNokse55jq/oxEtUXOw=;
 b=J42CxDKaAsL53cZlNP1QivIKoBjZoZ/PGPyOpYiM2JYXJn8o3wq3F1Ey2abcUaJJxuLUmqnHJ1ymd2pKaOM2YKAoQlc8/NPIwiawgp3Qxidhgvi48X7tLZkvtR+lTQgZdVcanzp7jzNe3hWlyteZQQ+O8Un8Gjjxqfmdo+lA52tty4qxIcpF81odzqGLt6A3sZAuUp9ahmic+FHIp7kCbZG+wQVIPBcCZzgvpDVEp1vGWPNiqhK8UrsWeAct/1CFtsWKx5zQRTT1Jnvt5dHhzBPSM2WLUzzr/N+H819DZWCPqMzy58H2ijHM8g7079iARgCSw4AZRtfGzlNmhH+bHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJOgJaLOM9mlY/CzyQdW/GDwiNokse55jq/oxEtUXOw=;
 b=eAX2bumJ4R/pp5egSLaPlRbEvxfN6E6WIw2armaJXn9StJIQx2IEu43nLlje3rt1zoXMGab/fp0naCGvbZ+G8Pj2ZfPsnfzkGkr8n8BXgEPlTO8iEuC8eXG3a0Bjq1rnKAubvngZHfjsbhx4EPoaj8gFdx8LfMyLDuXH4mJkock=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Topic: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Index: AQHYP+PNN5njehIrkUSJD7AjfT2HzKzP1vuA
Date: Fri, 25 Mar 2022 09:33:28 +0000
Message-ID: <F786E1F2-8AFD-4D2C-ABE6-42528A2C6658@arm.com>
References: <20220325010052.1597420-1-sstabellini@kernel.org>
In-Reply-To: <20220325010052.1597420-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a0a3b3a5-0c26-4cf2-43d5-08da0e4289a7
x-ms-traffictypediagnostic:
	DU0PR08MB7462:EE_|VE1EUR03FT032:EE_|HE1PR0801MB1722:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1722BD7AD1505DB2B3B0DFDE9D1A9@HE1PR0801MB1722.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZQHjHTT7fWhB+BVaX7NRN0ChBGWuU/YYMH5I385kbVpPqK/zSJngrDoJhuRa+f5jJoNDwb+hj4nKe9VuyUW2t2klMvoRCECiN5DVdC5NgFwpYCUxNopSpm46JJvaZvuteQxkJZvAVmbRkZleYRgJPFwj+OJZkHBTxPgNTFgrpqHuEDy0dnLzPIJG25Nv4twz53ByRL73PP0nTAsS+o8mmfE/tN4EzdmxAc8/WDGb+6JGNDv2fr+YB9iyl7V9TYPr9mol9+IKzyA9bLV7ZacUOI07fb8u3Hy+s+dbLS+Gk3WV4/hvxjQBw3sxpO4RoVBAz4nhl7RKV+ix11DfRuDHfDjHfsGS5q/V2OEkC5xJ3qIGX6xPMKIEx06oWi37qDxrogb/0oGCsXP0QJ0V6FlRLEUUmKJ1PmiTdvUxkSdr0yTbSg9UDjybThVtXCBSlIbF8m2m5ZDXAI/Ly9VibeTazZjAx9bGy3O7GBsKLAn7RNM7QAb8O3jU3jyo+DH7Xeu9PbhfL338Mt90qK68JdlrAmSjco9f+JoqrjzegFFDQdO0WotMq3WSDRpPvO8iOYP2NO+SgqxMZNEKemdPieQOtG+PbeqAdwDaamL+U7pq3zp42Ozf8xu9szvrL5gl+dkwCksiScWSAIj5Oi/oIQCgX7fd2f9vwQnO/WC03cldfP7j4s7qqT3rVqD4eh8VxZ1qKgF2P9Nz5QIUtan56K554gomcD54a0SMOL43jFCxedWmPKc9JV+ZV8vH9CmCYySi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(122000001)(71200400001)(6512007)(186003)(38070700005)(8936002)(2616005)(5660300002)(6506007)(38100700002)(6486002)(508600001)(83380400001)(76116006)(91956017)(66946007)(4326008)(66476007)(66446008)(64756008)(8676002)(316002)(54906003)(6916009)(66556008)(2906002)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <75656DC14FD66F47ACF15EEDB53EA54B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40306841-4399-44f4-b884-08da0e4284ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DRe9Sw96MhImdCpPtfDn2r+lM8lv2mumB0XBnEzOuSfHb9w8tg5YlgZy6u9JRtFWMFZycrkj9B4ZRcbfsOxz32QbFiIqTDlE8YjePim4+++WTviNP8X9sHgflNGsRJtpyhpbWBSDIS2OVkyIo2fWiNiNwk83vRwYNT8npQsNvWJJlJBGS9nb3rv6EeooQ5fwJlPNGHj/ENFsu4siYGaATQEsIP3OxOGFjMcXjldMRlCzkGSncoeDu/1p/Q2Fd5Y3zAZTAoeSSlUmVgt/uusmmiKDiDb6g6V2nIr91xstfDfFF+lZdbGFn6NPn1fhHbo7OBzhGLhh+OU9qPexoti0nczLerseBFj2Ds0g133Kj0dARCi6J9YqHaFResJ/vF7i3I8pKO5Ol7bYf47d+cKaZK32OI2AgTeiouen/B6yv447kpR+v9/B7aqkHlNe7y2wcRo/LqzIF+w5RtXXHQeL+XiKuGK6rAf9mG0sQUiJYYPMnN1hgy1zgjk7MDxoAK2+1wKKQjrMA+yLYzdcUa4IUaccgiInFAb5WRFTNlrKF1+B3tHru9GI0fRnzhO3lrLr9t7lLU7mXYUbAaPBNbMt31ZTSOBVG1F6DhCIaVSsnrkU4DFU7YMWu8UJoDFupIDtBH7v9PvCr+rJvz2kzyi+sQ8LMi803iDGp+bCmJCGCgUJgQeHlTDhQ3ZazEC4VnWD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(336012)(5660300002)(82310400004)(8676002)(53546011)(8936002)(4326008)(6506007)(2906002)(36860700001)(36756003)(54906003)(6512007)(40460700003)(83380400001)(508600001)(86362001)(356005)(186003)(47076005)(316002)(81166007)(26005)(107886003)(70586007)(6486002)(70206006)(6862004)(33656002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 09:33:36.5323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a3b3a5-0c26-4cf2-43d5-08da0e4289a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1722

Hi Stefano,

> On 25 Mar 2022, at 02:00, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
> kernel, certain versions of Linux will use an UNPREDICATABLE NOP
> encoding, sometimes resulting in an unbootable kernel. Whether the
> resulting kernel is bootable or not depends on the processor. See commit
> a92882a4d270 in the Linux kernel for all the details.
>=20
> All kernel releases starting from Linux 4.9 without commit a92882a4d270
> are affected.
>=20
> Fortunately there is a simple workaround: setting the "Z" bit in CPSR
> make it so those invalid NOP instructions are never executed. That is
> because the instruction is conditional (not equal). So, on QEMU at
> least, the instruction will end up to be ignored and not generate an
> exception. Setting the "Z" bit makes those kernel versions bootable
> again and it is harmless in the other cases.
>=20
> Note that both U-Boot and QEMU -kernel set the "Z" bit in CPSR when
> booting a zImage kernel on aarch32.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Thanks for the comment and commit message fixes.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v3:
> - improve commit message
> - improve in-code comment
>=20
> Changes in v2:
> - improve commit message
> - add in-code comment
> - move PSR_Z to the beginning
> ---
> xen/include/public/arch-arm.h | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 94b31511dd..c0c1149e27 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
> #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
> #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
> #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
> +#define PSR_Z           (1<<30)       /* Zero condition flag */
>=20
> /* 32 bit modes */
> #define PSR_MODE_USR 0x10
> @@ -383,7 +384,15 @@ typedef uint64_t xen_callback_t;
> #define PSR_MODE_EL1t 0x04
> #define PSR_MODE_EL0t 0x00
>=20
> -#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MO=
DE_SVC)
> +/*
> + * We set PSR_Z to be able to boot Linux kernel versions with an invalid
> + * encoding of the first 8 NOP instructions. See commit a92882a4d270 in
> + * Linux.
> + *
> + * Note that PSR_Z is also set by U-Boot and QEMU -kernel when loading
> + * zImage kernels on aarch32.
> + */
> +#define PSR_GUEST32_INIT  (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|=
PSR_MODE_SVC)
> #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE=
_EL1h)
>=20
> #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
> --=20
> 2.25.1
>=20


