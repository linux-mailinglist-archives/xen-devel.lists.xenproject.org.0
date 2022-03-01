Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C894F4C89D8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 11:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281112.479328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08O-0003UB-7d; Tue, 01 Mar 2022 10:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281112.479328; Tue, 01 Mar 2022 10:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08N-0003Hr-Sc; Tue, 01 Mar 2022 10:53:35 +0000
Received: by outflank-mailman (input) for mailman id 281112;
 Tue, 01 Mar 2022 10:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNgs=TM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nP08M-00031b-Bk
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 10:53:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe05::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61b203e-994d-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 11:53:33 +0100 (CET)
Received: from AS8PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:313::16)
 by AM6PR08MB3672.eurprd08.prod.outlook.com (2603:10a6:20b:4d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 10:53:28 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::9d) by AS8PR04CA0071.outlook.office365.com
 (2603:10a6:20b:313::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Tue, 1 Mar 2022 10:53:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 10:53:28 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Tue, 01 Mar 2022 10:53:28 +0000
Received: from e98e151bf0fd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F551B79B-F530-48EF-A956-8F6A4B27ADB8.1; 
 Tue, 01 Mar 2022 10:53:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e98e151bf0fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 10:53:21 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by VI1PR08MB3373.eurprd08.prod.outlook.com (2603:10a6:803:7b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 1 Mar
 2022 10:53:18 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 10:53:18 +0000
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
X-Inumbo-ID: d61b203e-994d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m8pPoRu+85TyGj2cdbwexvelzOLKeuK5zCSd90Jpfk=;
 b=cjHB3X7t32514IEUinVsAEUjHLvvLaXzT9aGljisMIQQbC09ETL0WA5bSAusAFDw34dGe8qVPSgTuw6skyCbb6zZymQD3eddURDL8JCL/JdV+J6hFkkk6DH6HAJ+9oJW2Ta+LM1u1+lzonTgMSRvKwPx954yBfOQR2lqDdJ1OSU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcc9a82fe087dd1e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bjp/EKqdEGIniuhYycS+hk0JZ8TTc7JMMmYRh8wxnTgURdSRnwKYKFTDa5CTKDa/a4lFQ5s+/TAqR8zikIUtwwgJ7SWpL9ta/Yq3DJ7rDER47AWZLj+XXOQvud+SmPumlkckbwlwfy6J695XtQqINO83rA/mpUGOvfsh/mvWhdjJ7h9NldXBePx4+3UduRi5PPmUNUXCQ9cmcphGgnRZK30HCnrk0ekm4JhiYiPy9yn5oCilRgWyGG/sfNYg/A6PkguTAjgBw6SfH8aQmQr+vytWEJK4F32Bv3Z7irZdPVSe1dJnXj0X2TNe1kEi2XbiWZtX6u/TB6RyDb7hFjMLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m8pPoRu+85TyGj2cdbwexvelzOLKeuK5zCSd90Jpfk=;
 b=TI7CksXHbF9+atSPhahoBn8nfjfY3zMvqNgM25BYRt2VfvkpEinoJ12UfPUZTdf3ME49drJdtAFBZ1swaYUP3u3whtm1HBMDqMz5AwKIwUb1xUdPo2c32jEjdsJfKe/zawPl2tGfe0wa2LCyCnIS+PGz1cODTdJD5znjVHyM80Iq9V589t3+LIcvUie8iq/o9LlroQrT2G4xc9zD2dndqCvQq5S7Ew7AJMjsJtzGRiapTS/ubZ/hNmRCWoiGYVnXmjkBVPir0pTbNN0nmrTGgatlR9fjx9EDdFmdzTo+w7o9lHZHYN0EaxpjeBHv5/tcIivvn/WZ/BBugpkJAbwTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m8pPoRu+85TyGj2cdbwexvelzOLKeuK5zCSd90Jpfk=;
 b=cjHB3X7t32514IEUinVsAEUjHLvvLaXzT9aGljisMIQQbC09ETL0WA5bSAusAFDw34dGe8qVPSgTuw6skyCbb6zZymQD3eddURDL8JCL/JdV+J6hFkkk6DH6HAJ+9oJW2Ta+LM1u1+lzonTgMSRvKwPx954yBfOQR2lqDdJ1OSU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <Julien.Grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: Remove unused BOOT_RELOC_VIRT_START
Thread-Topic: [PATCH] xen/arm: Remove unused BOOT_RELOC_VIRT_START
Thread-Index: AQHYLIrpIk7mbc8G60OD3FqJgTcvKayqXAeA
Date: Tue, 1 Mar 2022 10:53:18 +0000
Message-ID: <87B0168C-7020-4DB2-8FC9-F86ED999694C@arm.com>
References: <20220228100633.57593-1-julien@xen.org>
In-Reply-To: <20220228100633.57593-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cac44cd4-cad2-4a51-78ac-08d9fb71b7bb
x-ms-traffictypediagnostic:
	VI1PR08MB3373:EE_|AM5EUR03FT020:EE_|AM6PR08MB3672:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB36729B6DC175BEB8C2ED9E589D029@AM6PR08MB3672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4n3GqBQMvvUr1VOF5iZhN9SuyUAXXobxDAtLdJYLYvfJR6V+9CArKqxg0bXvCG4SjQICm2sgOQ3Ibl872AX2o6i1IdrepnOWS9MiP5PhbZSnttKl9kCFEln0n1kNcYRk3TEblA0duXyfnGSCzoKIgnUizzg4a4aX5q+v0gkvNRS2drIc0r1LGitqzcQPCNZ/yaemNFQ0sSvL1pSY947QiiSjwZnm7XdZioDFn1LP8lziZ9YyNNtSN54GIe1E1fpWhZybmufmT8bWKFdYECT1sgelB7MzNkOjl3N46wYOR4ia2OdoyyK9pgJKdg5NyGeUTIjui9p6HY4LEAhkCy2XGOrliw4LJiBQn9GVLNtArDIhUf0wxmuQ4NcOlAMWbnWYPqEJrY27QZ0NSIPV/z/BmFeoRKxlgPU13+nyHMp7yS0DiisfbDSJxZ1RCcT5AzJWJ292KSA6gee7XFhVCw9ph42mKXVN3ZTS2qQD+iYfq3/HQh8xCy8jjj9DP3MuOFqsOJ/RWd4rdoJIwKxgLqncphuSsUq26pdOYF2cphrgxtSZntkNFbhZhBvheOu1ZGRQ1lPAaLQj5ZQqpvyNf5temhAIOtwuujmM/zbIgBNyS6d2PD9Zb9yspfiVIJ52bXev/+lr+5Ehb6CNASDgxPF0Y+meo4BCPF66x3AYeB2JeC3dPmPhSk++EyoQBitCG1+r/Pm2pZU57SstcsyAeg+ceVBsOYCJnL8AeoF9yml4TbwTKOKmJ38lqouJ+ketHxz1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38070700005)(36756003)(122000001)(33656002)(186003)(26005)(86362001)(2616005)(6916009)(54906003)(316002)(4326008)(76116006)(66476007)(66946007)(6506007)(66446008)(66556008)(6512007)(64756008)(53546011)(71200400001)(6486002)(508600001)(8676002)(2906002)(83380400001)(8936002)(5660300002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6DA39540E49EB488DA383D873A3059E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3373
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6d0a581-31e3-4643-c56d-08d9fb71b20a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nYwSQosoydZ7Ws/+a7977DYhwTfSAn3LFuR4HZ+hgmOkaP60bNRUzHMgVKpTGs03kwdlknDZnRxWbxkWn57SPTOu4DgauP6uO8lAmUzLZb/L+4otJBT7Mu2jcLR6iWXu6LXTr8t+zttZZDT3dQeFwlZOdp9T45t4UnZNZPb/7MsAEePyyR0o2YvlUXXZVHMlwiHbaxbPhPf1wfXBTMWDLH73nNi33hjj73jCDhE+5y/cW3KMt7fL/lT8zFbgTpivK3rw3ccaU8+o82u71qejyeNk3O6HeirJ8Te/fcOFV2AP2oBKrCu7vb3ClTKTJTBmJBGRbEkqWTwukvg5wAq1y3iXETl5GHPSDOyDpgNqkI0JPINIfOUJSMo8rVvnJkbi1huGBb8NcgWdG5ZB599jrBUWkx/hPXYkM1DwpiesASwUdEqcdTI+aao/rcDhezv7h7+f8ehxT56XLkKUTzvt/3jLKYtfZ0+aILoPdDl42aq8/KUv3SsHSvQEtCVbYrtIk3N+uVTiLTsFNHXa+3fGYJVYYxDXf98Qjye2/UEPt3Me3fHY4+4euB0QBwb0vTyEyrSzKiWkhkOWQleAtYAaEgu8W1f1zpBwlyI+/2s0ZdOG3a/eAonX3bhLICAtCyblgSuciL9WdpRKr9d79xQSqBnAxWsdmMEcTn4DehVk/1v7XMni1C5vnVJ9YDm+NaDm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6512007)(40460700003)(6862004)(4326008)(70586007)(5660300002)(70206006)(86362001)(8676002)(82310400004)(186003)(53546011)(26005)(6506007)(8936002)(336012)(33656002)(83380400001)(2616005)(6486002)(356005)(36860700001)(508600001)(54906003)(81166007)(2906002)(316002)(47076005)(36756003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 10:53:28.1403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac44cd4-cad2-4a51-78ac-08d9fb71b7bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3672

Hi Julien,

> On 28 Feb 2022, at 10:06, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> We stopped relocating Xen since commit f60658c6ae "xen/arm: Stop
> relocating Xen".
>=20
> At the same time, update the memory layout description.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/config.h | 4 +---
> xen/arch/arm/mm.c                 | 1 -
> 2 files changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index 2aced0bc3b8b..b25c9d39bb32 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -77,8 +77,7 @@
>  *   2M -   4M   Xen text, data, bss
>  *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>  *   6M -  10M   Early boot mapping of FDT
> - *   10M - 12M   Early relocation address (used when relocating Xen)
> - *               and later for livepatch vmap (if compiled in)
> + *   10M - 12M   Livepatch vmap (if compiled in)
>  *
>  * ARM32 layout:
>  *   0  -  12M   <COMMON>
> @@ -115,7 +114,6 @@
> #define BOOT_FDT_SLOT_SIZE     MB(4)
> #define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
>=20
> -#define BOOT_RELOC_VIRT_START  _AT(vaddr_t,0x00a00000)
> #ifdef CONFIG_LIVEPATCH
> #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
> #define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 515d0906f85b..8a17222109c6 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -196,7 +196,6 @@ static void __init __maybe_unused build_assertions(vo=
id)
>     /* 2MB aligned regions */
>     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
>     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> -    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
>     /* 1GB aligned regions */
> #ifdef CONFIG_ARM_32
>     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
> --=20
> 2.32.0
>=20


