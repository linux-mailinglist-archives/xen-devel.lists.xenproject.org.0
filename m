Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7604748932
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559428.874408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5MF-000362-MR; Wed, 05 Jul 2023 16:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559428.874408; Wed, 05 Jul 2023 16:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5MF-00034N-Ic; Wed, 05 Jul 2023 16:27:59 +0000
Received: by outflank-mailman (input) for mailman id 559428;
 Wed, 05 Jul 2023 16:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUcB=CX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qH5MD-0002mx-Am
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:27:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5bf7eab-1b50-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 18:27:56 +0200 (CEST)
Received: from AS9PR07CA0033.eurprd07.prod.outlook.com (2603:10a6:20b:46b::19)
 by VI1PR08MB10030.eurprd08.prod.outlook.com (2603:10a6:800:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 16:27:16 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::48) by AS9PR07CA0033.outlook.office365.com
 (2603:10a6:20b:46b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 16:27:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 16:27:15 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Wed, 05 Jul 2023 16:27:15 +0000
Received: from 6d9256312912.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B795DFCA-32A7-4581-895A-1452529E0C4B.1; 
 Wed, 05 Jul 2023 16:27:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d9256312912.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 16:27:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 16:27:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 16:27:01 +0000
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
X-Inumbo-ID: e5bf7eab-1b50-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Le09054YEX6s0TRwwotIsDcNWfolsiiLOmqo1dTHFJU=;
 b=JqD12rvQxtzRaBTRBH0A1hSDMcleetaux46UQZa4ijncYBWWMPqMsnNXx4I9eSX5q31YxenumFJKr2980AoKMPLjSGj+9CxC+hgEhxljfI+QFvTaRJgPbs+QLoMKSpATJKQ/fkEeq2Xmn4/rmJNc2+4m0+JlYo3vZ3BnXjvHDkA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8168b3122a6a71c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i76+VH3v/lHPt27vCe29rDBKCFGA7M8+L1hVrLBTqoHQHfrY8Al3nKepxMT66BpQnnjculuTnsaT6HPHAKE8bhFUMLmCknWxlIkXxEUaOQSW5b7ToXXbVoW3H/rO5uxYPT+mYYIDsIdspSVdm8b4EeuzknKK04mGLt+viDyIGLSpHitO13xa4vQjIb9NrSmNIsFQEtO4yCP3eS1dyxUTyLK+CA85JP8uTfnzjk+jmMEgn3+QFX/kkRF71n2yww8PNZufuaxAECFSiiq7ThdVxVWWgcirKOQzxVC5TP0mr9q5iQFoz71kuhcAEV0Ch2cWB/2O3Mjp7y8Ti15kwn4Ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Le09054YEX6s0TRwwotIsDcNWfolsiiLOmqo1dTHFJU=;
 b=modq7cPWmhxJjDgkf8RDLzWgVBecr6DcBNQhTFHXcIGVp6wugMhj9KO5o9blBEI7PAbDrR+b0Oh8IBe8PN75P9lf6HZ6Wv52JCWoB2vtLhsl/XJEdHfd78SypFeGutNxjhiKrRPDLCAqGzqQn2aHGz9Micp6KYEhw0Q8nKJs3Wndv7fvxS1LNCCd0eu/504DBJg/jXJ+JysUrPBfxE0ewO1ixJ51DjoEaJYYx+GJj/MfxyDCqCKb9vzNVO6cSQEJTaOMECh/5wtqBeL9MqMo/SQl68XCVCKgq5JLZ9XsQf044rNSoZiCAodM3+9rpBz6tkrV1CBrhJb/kD8LtJeUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Le09054YEX6s0TRwwotIsDcNWfolsiiLOmqo1dTHFJU=;
 b=JqD12rvQxtzRaBTRBH0A1hSDMcleetaux46UQZa4ijncYBWWMPqMsnNXx4I9eSX5q31YxenumFJKr2980AoKMPLjSGj+9CxC+hgEhxljfI+QFvTaRJgPbs+QLoMKSpATJKQ/fkEeq2Xmn4/rmJNc2+4m0+JlYo3vZ3BnXjvHDkA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Xenia
 Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 04/13] xen/arm: fix violations of MISRA C:2012 Rule
 7.2
Thread-Topic: [XEN PATCH v2 04/13] xen/arm: fix violations of MISRA C:2012
 Rule 7.2
Thread-Index: AQHZr1U7uIYEMfg1kUezCieUYnmo76+rXFUA
Date: Wed, 5 Jul 2023 16:27:01 +0000
Message-ID: <FDCB18E6-3D49-4634-BD11-931E03B2438C@arm.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <c58aa850214380cb6f799226a911968fd33a98ff.1688559115.git.gianluca.luparini@bugseng.com>
In-Reply-To:
 <c58aa850214380cb6f799226a911968fd33a98ff.1688559115.git.gianluca.luparini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6469:EE_|AM7EUR03FT045:EE_|VI1PR08MB10030:EE_
X-MS-Office365-Filtering-Correlation-Id: 3396434f-f2e3-4e08-7af2-08db7d74b1e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 98mLDqE5lRFDP8QLThYaGAQmFGw7Zbfu1wPPx99qACpwDP5vQaZXWjU2aEMTEhy+u1dLK1yuJSyjFHMCSdDnvrTUS5SqGP9xewd5SltDTS5+B55w0oXqQxryB/ZbXSPTdJlANVzpouE1EJtbbQuinLxKWfNuuqhbxC/5kHnL/IPUEEdGvRfW+go4eh9asa4IgsyIy0KEI/KHKEw33TPgKgz0E2RYkn4VWHCFZ1qeIOm1EeaqiNBW8iz7m0MChKghLQUBJikp8bKPeXSn/mBPc61LPZpZ7VJpBwds1YXLCgtSLNX+WVDr+2sdsEAWDbHdJTgZXEr7o6YruLxL0MlURdOltbRt9mEFkwB9Ywxok1jswsvpHVffdC/BtVqo0jtgEjFGpqfYEFGhLpWIX+k4jDhLfYz1k4U09IJXOe/vrcUWWkkjkOQ5PN1tgXO2OS2hWkKaIEQ09AdlXQABqLMq0WhWspjYk4G2/p1vUtUYpM7BObRrZs9uGBpeTbiEJ7VIblrg8mtjYNKqfD7BczX5h1lz8u8UHKWbZZACECn4SHq16sILyk2UciH+ISjXrXtc2Ak8YmmsOCbs6/m5kzfTBjekzjAwQd2DSa4VaGyP91salKH+/gwHTVBw0np+IYAXOX68mafqzBRasvQatWf0OA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(2616005)(4326008)(76116006)(66946007)(91956017)(38100700002)(66446008)(66476007)(64756008)(66556008)(6916009)(122000001)(186003)(86362001)(478600001)(36756003)(38070700005)(6486002)(33656002)(71200400001)(6512007)(26005)(53546011)(6506007)(8676002)(8936002)(30864003)(54906003)(5660300002)(7416002)(2906002)(41300700001)(316002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E9CE499CF5F924AB3CD657546FA26CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ed9818c-1b75-4f63-2370-08db7d74a943
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oGR4Qwt6f1ZYaQlYNjZpohSsRskAKYFRocnOLI6Pp+etRQpWPoxeCXuZYwkE8ZmitqleVKVTPGZ/Gg2hfkbxaZkDhaLO6DzQRb2FpdW4X7/vPsMURZH5ogLOw8/dP2FXSCa42jO5qbB2DtIzBY8onXY46GcZAZqj+5zLOKV/ByjyvjYp7P3/v9kvKlSS3+SCx1jI/x8NyVei6gusP+XfpPyWcjhN/nrbNgTLCY+eLoHn0BMyUpks2MXq0vVF67W3jN+FsY2Ulp8RvXfgrz45UFG5ndcQqFEY654BvKGsdx/lAmVMj5WUw40dh3rwwQexTRdUkXfD4RFjmMcCisKnOu76NP2lFEnxv70ZTaqhMWkOu+eYoCegUiJn0SZG7oi+kAO0T9g4vL1SETdmsZxig1fPIDAC+eZhIT+KZq4pzbHLGQgzrmzmNIlL/SWCdChQ03COhyEywuD0iuy9cDtTm30K+sAS6WS2+1uXhNqSfa2nJSuOVrdNrsC32T18JC9eVwHWdQ6CZiYQt/gCXa7FIL5XyBm1ByRTfKwnUU+Wi+6lrMO4pkk+kF9lNWF1gYwMWVdwB/kuBOpSIvl0jY8jzfqy+1nOTsst1yoNsU5MJrcTYiBB4a6lhhlIJdGkIyI8m1Yb2N18+agf8kG9FE81Pf3cIWgl+ZiKRIfJCuZvbGrw2+hJUXdovrX7RmEJ86bMFJLRC4xME5AW5LlhCY87b8duqC/FCanvJTTFgsLL/UqMPE/9WvY9fxLOr2uHi31K
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(30864003)(40460700003)(8676002)(2906002)(41300700001)(6862004)(5660300002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(6512007)(6486002)(478600001)(83380400001)(47076005)(336012)(36860700001)(70206006)(186003)(26005)(53546011)(2616005)(82740400003)(6506007)(4326008)(54906003)(81166007)(356005)(316002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:27:15.6298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3396434f-f2e3-4e08-7af2-08db7d74b1e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10030



> On 5 Jul 2023, at 16:26, Simone Ballarin <simone.ballarin@bugseng.com> wr=
ote:
>=20
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>=20
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
>=20
> Add the 'U' suffix to integers literals with unsigned type and also to ot=
her
> literals used in the same contexts or near violations, when their positiv=
e
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
>=20
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> ---
> Changes in v2:
> - minor change to commit title
> - change commit message
> - fix in 'domain_build.c' file for consistency
> - fix typo in 'gic-v2.c' file
> - fix in 'insn.h' file for consistency
> - add fixes in 'gic-v3.c', 'traps.c' and 'vgic-v3.c'
> ---
> xen/arch/arm/domain_build.c              |  4 ++--
> xen/arch/arm/efi/efi-boot.h              |  2 +-
> xen/arch/arm/gic-v2.c                    |  6 +++---
> xen/arch/arm/gic-v3.c                    | 10 +++++-----
> xen/arch/arm/include/asm/arm64/brk.h     |  2 +-
> xen/arch/arm/include/asm/arm64/efibind.h | 10 +++++-----
> xen/arch/arm/include/asm/arm64/insn.h    | 16 ++++++++--------
> xen/arch/arm/include/asm/vreg.h          |  2 +-
> xen/arch/arm/kernel.c                    |  2 +-
> xen/arch/arm/traps.c                     | 14 +++++++-------
> xen/arch/arm/vgic-v2.c                   |  2 +-
> xen/arch/arm/vgic-v3.c                   |  2 +-
> xen/include/public/arch-arm/smccc.h      |  8 ++++----
> 13 files changed, 40 insertions(+), 40 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0d6be922d..d58604ef4a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3751,8 +3751,8 @@ static int __init construct_domain(struct domain *d=
, struct kernel_info *kinfo)
>          * r1 =3D machine nr, r2 =3D atags or dtb pointer.
>          *...
>          */
> -        regs->r0 =3D 0; /* SBZ */
> -        regs->r1 =3D 0xffffffff; /* We use DTB therefore no machine id *=
/
> +        regs->r0 =3D 0U; /* SBZ */
> +        regs->r1 =3D 0xffffffffU; /* We use DTB therefore no machine id =
*/
>         regs->r2 =3D kinfo->dtb_paddr;
>     }
> #ifdef CONFIG_ARM_64
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index bb64925d70..585332647d 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -46,7 +46,7 @@ static int get_module_file_index(const char *name, unsi=
gned int name_len);
> static void PrintMessage(const CHAR16 *s);
>=20
> #define DEVICE_TREE_GUID \
> -{0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, =
0xe0}}
> +{0xb1b621d5U, 0xf19cU, 0x41a5U, {0x83U, 0x0bU, 0xd9U, 0x15U, 0x2cU, 0x69=
U, 0xaaU, 0xe0U}}
>=20
> static struct file __initdata dtbfile;
> static void __initdata *fdt;
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 6476ff4230..cf392bfd1c 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -386,9 +386,9 @@ static void gicv2_cpu_init(void)
>     /* The first 32 interrupts (PPI and SGI) are banked per-cpu, so
>      * even though they are controlled with GICD registers, they must
>      * be set up here with the other per-cpu state. */
> -    writel_gicd(0xffffffff, GICD_ICACTIVER); /* Diactivate PPIs and SGIs=
 */
> -    writel_gicd(0xffff0000, GICD_ICENABLER); /* Disable all PPI */
> -    writel_gicd(0x0000ffff, GICD_ISENABLER); /* Enable all SGI */
> +    writel_gicd(0xffffffffU, GICD_ICACTIVER); /* De-activate PPIs and SG=
Is */
> +    writel_gicd(0xffff0000U, GICD_ICENABLER); /* Disable all PPI */
> +    writel_gicd(0x0000ffffU, GICD_ISENABLER); /* Enable all SGI */
>=20
>     /* Set SGI priorities */
>     for ( i =3D 0; i < 16; i +=3D 4 )
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 4e6c98bada..95e4f020fe 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -619,8 +619,8 @@ static void __init gicv3_dist_init(void)
>     /* Disable/deactivate all global interrupts */
>     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
>     {
> -        writel_relaxed(0xffffffff, GICD + GICD_ICENABLER + (i / 32) * 4)=
;
> -        writel_relaxed(0xffffffff, GICD + GICD_ICACTIVER + (i / 32) * 4)=
;
> +        writel_relaxed(0xffffffffU, GICD + GICD_ICENABLER + (i / 32) * 4=
);
> +        writel_relaxed(0xffffffffU, GICD + GICD_ICACTIVER + (i / 32) * 4=
);
>     }
>=20
>     /*
> @@ -832,13 +832,13 @@ static int gicv3_cpu_init(void)
>      * The activate state is unknown at boot, so make sure all
>      * SGIs and PPIs are de-activated.
>      */
> -    writel_relaxed(0xffffffff, GICD_RDIST_SGI_BASE + GICR_ICACTIVER0);
> +    writel_relaxed(0xffffffffU, GICD_RDIST_SGI_BASE + GICR_ICACTIVER0);
>     /*
>      * Disable all PPI interrupts, ensure all SGI interrupts are
>      * enabled.
>      */
> -    writel_relaxed(0xffff0000, GICD_RDIST_SGI_BASE + GICR_ICENABLER0);
> -    writel_relaxed(0x0000ffff, GICD_RDIST_SGI_BASE + GICR_ISENABLER0);
> +    writel_relaxed(0xffff0000U, GICD_RDIST_SGI_BASE + GICR_ICENABLER0);
> +    writel_relaxed(0x0000ffffU, GICD_RDIST_SGI_BASE + GICR_ISENABLER0);
>     /* Configure SGIs/PPIs as non-secure Group-1 */
>     writel_relaxed(GENMASK(31, 0), GICD_RDIST_SGI_BASE + GICR_IGROUPR0);
>=20
> diff --git a/xen/arch/arm/include/asm/arm64/brk.h b/xen/arch/arm/include/=
asm/arm64/brk.h
> index 04442c4b9f..3af153a053 100644
> --- a/xen/arch/arm/include/asm/arm64/brk.h
> +++ b/xen/arch/arm/include/asm/arm64/brk.h
> @@ -21,7 +21,7 @@
>  * BRK instruction encoding
>  * The #imm16 value should be placed at bits[20:5] within BRK ins
>  */
> -#define AARCH64_BREAK_MON 0xd4200000
> +#define AARCH64_BREAK_MON 0xd4200000U
>=20
> /*
>  * BRK instruction for provoking a fault on purpose
> diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/incl=
ude/asm/arm64/efibind.h
> index 8b43bb8495..0e890b666d 100644
> --- a/xen/arch/arm/include/asm/arm64/efibind.h
> +++ b/xen/arch/arm/include/asm/arm64/efibind.h
> @@ -22,12 +22,12 @@ Revision History
> #pragma pack()
> #endif
>=20
> -#define EFIERR(a)           (0x8000000000000000 | a)
> -#define EFI_ERROR_MASK      0x8000000000000000
> -#define EFIERR_OEM(a)       (0xc000000000000000 | a)
> +#define EFIERR(a)           (0x8000000000000000U | a)
> +#define EFI_ERROR_MASK      0x8000000000000000U
> +#define EFIERR_OEM(a)       (0xc000000000000000U | a)
>=20
> -#define BAD_POINTER         0xFBFBFBFBFBFBFBFB
> -#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFF
> +#define BAD_POINTER         0xFBFBFBFBFBFBFBFBU
> +#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFFU
>=20

Should these be UL? (From EFIERR to MAX_ADDRESS)


> #define EFI_STUB_ERROR      MAX_ADDRESS
>=20
> diff --git a/xen/arch/arm/include/asm/arm64/insn.h b/xen/arch/arm/include=
/asm/arm64/insn.h
> index 4e0d364d41..6308959449 100644
> --- a/xen/arch/arm/include/asm/arm64/insn.h
> +++ b/xen/arch/arm/include/asm/arm64/insn.h
> @@ -60,14 +60,14 @@ static always_inline bool aarch64_insn_is_##abbr(u32 =
code) \
> static always_inline u32 aarch64_insn_get_##abbr##_value(void) \
> { return (val); }
>=20
> -__AARCH64_INSN_FUNCS(b, 0xFC000000, 0x14000000)
> -__AARCH64_INSN_FUNCS(bl, 0xFC000000, 0x94000000)
> -__AARCH64_INSN_FUNCS(cbz, 0x7F000000, 0x34000000)
> -__AARCH64_INSN_FUNCS(cbnz, 0x7F000000, 0x35000000)
> -__AARCH64_INSN_FUNCS(tbz, 0x7F000000, 0x36000000)
> -__AARCH64_INSN_FUNCS(tbnz, 0x7F000000, 0x37000000)
> -__AARCH64_INSN_FUNCS(bcond, 0xFF000010, 0x54000000)
> -__AARCH64_INSN_FUNCS(hint, 0xFFFFF01F, 0xD503201F)
> +__AARCH64_INSN_FUNCS(b, 0xFC000000U, 0x14000000U)
> +__AARCH64_INSN_FUNCS(bl, 0xFC000000U, 0x94000000U)
> +__AARCH64_INSN_FUNCS(cbz, 0x7F000000U, 0x34000000U)
> +__AARCH64_INSN_FUNCS(cbnz, 0x7F000000U, 0x35000000U)
> +__AARCH64_INSN_FUNCS(tbz, 0x7F000000U, 0x36000000U)
> +__AARCH64_INSN_FUNCS(tbnz, 0x7F000000U, 0x37000000U)
> +__AARCH64_INSN_FUNCS(bcond, 0xFF000010U, 0x54000000U)
> +__AARCH64_INSN_FUNCS(hint, 0xFFFFF01FU, 0xD503201FU)
>=20
> bool aarch64_insn_is_branch_imm(u32 insn);
>=20
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/v=
reg.h
> index bf945eebbd..387ce76e7e 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -56,7 +56,7 @@ static inline bool vreg_emulate_cp64(struct cpu_user_re=
gs *regs, union hsr hsr,
>=20
>     if ( ret && cp64.read )
>     {
> -        set_user_reg(regs, cp64.reg1, x & 0xffffffff);
> +        set_user_reg(regs, cp64.reg1, x & 0xffffffffU);
>         set_user_reg(regs, cp64.reg2, x >> 32);
>     }
>=20
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index ca5318515e..508c54824d 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -39,7 +39,7 @@ struct minimal_dtb_header {
>     /* There are other fields but we don't use them yet. */
> };
>=20
> -#define DTB_MAGIC 0xd00dfeed
> +#define DTB_MAGIC 0xd00dfeedU
>=20
> /**
>  * copy_from_paddr - copy data from a physical address
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index ef5c6a8195..d1ef787638 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -398,7 +398,7 @@ static vaddr_t exception_handler32(vaddr_t offset)
>     register_t sctlr =3D READ_SYSREG(SCTLR_EL1);
>=20
>     if ( sctlr & SCTLR_A32_EL1_V )
> -        return 0xffff0000 + offset;
> +        return 0xffff0000U + offset;
>     else /* always have security exceptions */
>         return READ_SYSREG(VBAR_EL1) + offset;
> }
> @@ -809,7 +809,7 @@ static void show_registers_32(const struct cpu_user_r=
egs *regs,
> #ifdef CONFIG_ARM_64
>                (uint32_t)(ctxt->far >> 32),
>                ctxt->ifsr32_el2,
> -               (uint32_t)(ctxt->far & 0xffffffff),
> +               (uint32_t)(ctxt->far & 0xffffffffU),
>                ctxt->esr_el1
> #else
>                ctxt->ifar, ctxt->ifsr, ctxt->dfar, ctxt->dfsr
> @@ -1414,16 +1414,16 @@ static void do_trap_hypercall(struct cpu_user_reg=
s *regs, register_t *nr,
>     {
>         /* Deliberately corrupt parameter regs used by this hypercall. */
>         switch ( hypercall_args[*nr] ) {
> -        case 5: HYPERCALL_ARG5(regs) =3D 0xDEADBEEF;
> -        case 4: HYPERCALL_ARG4(regs) =3D 0xDEADBEEF;
> -        case 3: HYPERCALL_ARG3(regs) =3D 0xDEADBEEF;
> -        case 2: HYPERCALL_ARG2(regs) =3D 0xDEADBEEF;
> +        case 5: HYPERCALL_ARG5(regs) =3D 0xDEADBEEFU;
> +        case 4: HYPERCALL_ARG4(regs) =3D 0xDEADBEEFU;
> +        case 3: HYPERCALL_ARG3(regs) =3D 0xDEADBEEFU;
> +        case 2: HYPERCALL_ARG2(regs) =3D 0xDEADBEEFU;
>         case 1: /* Don't clobber x0/r0 -- it's the return value */
>         case 0: /* -ENOSYS case */
>             break;
>         default: BUG();
>         }
> -        *nr =3D 0xDEADBEEF;
> +        *nr =3D 0xDEADBEEFU;
>     }
> #endif
>=20
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 0b083c33e6..35363fee09 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -306,7 +306,7 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v, mm=
io_info_t *info,
>     case VREG32(GICD_SGIR):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
>         /* Write only -- read unknown */
> -        *r =3D 0xdeadbeef;
> +        *r =3D 0xdeadbeefU;
>         return 1;
>=20
>     case VRANGE32(0xF04, 0xF0C):
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 9c1fdcc3f8..f3e9eb2f92 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -354,7 +354,7 @@ read_reserved:
>     return 1;
>=20
> read_unknown:
> -    *r =3D vreg_reg64_extract(0xdeadbeafdeadbeaf, info);
> +    *r =3D vreg_reg64_extract(0xdeadbeafdeadbeafU, info);

Should this be UL?


>     return 1;
> }
>=20
> diff --git a/xen/include/public/arch-arm/smccc.h b/xen/include/public/arc=
h-arm/smccc.h
> index 802d800aad..8553f2f39e 100644
> --- a/xen/include/public/arch-arm/smccc.h
> +++ b/xen/include/public/arch-arm/smccc.h
> @@ -26,16 +26,16 @@
> #define XEN_SMCCC_MINOR_REVISION 1
>=20
> /* Hypervisor Service UID. Randomly generated with uuidgen. */
> -#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dc, 0xc698, 0x4369, 0x9acf=
, \
> -                                      0x79, 0xd1, 0x8d, 0xde, 0xe6, 0x67=
)
> +#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dcU, 0xc698U, 0x4369U, 0x9=
acfU, \
> +                                      0x79U, 0xd1U, 0x8dU, 0xdeU, 0xe6U,=
 0x67U)
>=20
> /* Standard Service Service Call version. */
> #define SSSC_SMCCC_MAJOR_REVISION 0
> #define SSSC_SMCCC_MINOR_REVISION 1
>=20
> /* Standard Service Call UID. Randomly generated with uuidgen. */
> -#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386f, 0x4b39, 0x4cbd, 0x922=
0,\
> -                                       0xce, 0x16, 0x41, 0xe5, 0x9f, 0x6=
f)
> +#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386fU, 0x4b39U, 0x4cbdU, 0x=
9220U,\
> +                                       0xceU, 0x16U, 0x41U, 0xe5U, 0x9fU=
, 0x6fU)
>=20
> #endif /* __XEN_PUBLIC_ARCH_ARM_SMCCC_H__ */
>=20
> --=20
> 2.41.0
>=20
>=20


