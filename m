Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA69825668
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 16:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662209.1032191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlvB-00056k-Ej; Fri, 05 Jan 2024 15:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662209.1032191; Fri, 05 Jan 2024 15:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlvB-00054P-Bd; Fri, 05 Jan 2024 15:15:41 +0000
Received: by outflank-mailman (input) for mailman id 662209;
 Fri, 05 Jan 2024 15:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MyhP=IP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rLlvA-00054H-LK
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 15:15:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4880138e-abdd-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 16:15:38 +0100 (CET)
Received: from DUZPR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::17) by DB8PR08MB5385.eurprd08.prod.outlook.com
 (2603:10a6:10:119::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 15:15:08 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::1c) by DUZPR01CA0085.outlook.office365.com
 (2603:10a6:10:46a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Fri, 5 Jan 2024 15:15:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 15:15:07 +0000
Received: ("Tessian outbound 52fd419df13e:v239");
 Fri, 05 Jan 2024 15:15:07 +0000
Received: from d66c59e7e8c2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 531983D3-29F4-4018-BA66-07A8241E6944.1; 
 Fri, 05 Jan 2024 15:14:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d66c59e7e8c2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Jan 2024 15:14:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS4PR08MB8045.eurprd08.prod.outlook.com (2603:10a6:20b:585::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 15:14:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a856:52ca:c1c6:a21d]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a856:52ca:c1c6:a21d%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 15:14:54 +0000
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
X-Inumbo-ID: 4880138e-abdd-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KxwojB/YABp/DLbiQTZmsJh/PS0xdQZuKOEWfLksb72RtYFc7h+HsIU6hrJMrsfcV+COHlok1jIyNf3c/QJaABjswWlkOy1I06epB+PXpedovqaUMhoJXr0f6OibmDQeJwE+/9ok8CjHEbLmV13ny2ZdgGLqNA769FGtegkMlosMQHzExHcy4Fj0QLq72ql2riXoWQ+hsXUUgdXTFUgp+BzDbYiRywuEsCFJiNjLr0ni5VhCZmHZd4LPazVaIeM6Ud4qmGYA+e5/mPhcLdQeJ2djqgGr5KdvKUJ5l+2AYFOL+MpMuuFINy1XfLlaAs4C4vxdqVYtFL+l8p9dr6pG8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XT5fN8X8PNaqRLJd1A23nK8nI39vK+Zl192zIDlJdI=;
 b=OUJiUUWZrySBkZP5TWy5nEk89Fl48eQKuDyGkO35gdYAaJnOy1HuHiZOVePxYmz7aD5wmVxI7eoH7Bksmh6YVf1Pn8a39q5a/zuIZtuoGT2eqq0h6k45mqJm3VcXSS/9xEHas1LNO3AdX1DXjlO5SjuAA/2ERbnm6n//XFyBHrd43Dhv6mHxqy1d7ElCEtYFAb5PrQfpVHM8/zfD17aa3xeAd0WYhXhwGN9IHbYWCJtKcrkRLh89gxjIZYY1jCS0eXI849kOxak3n0PvjIChsRUlmm0vyjedIrUN3ZMQXrRYL+PfNwgsKLaHBdXshV5MtXrz22pMeqzutuaiTBNZ5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XT5fN8X8PNaqRLJd1A23nK8nI39vK+Zl192zIDlJdI=;
 b=C31V+bhe0oo9KC8dyq+My3YjaBylyCBeP1HcIDA6MkbAbalyBjDFARmaS1n6TpjwKi5T6SVzKmd/vCwgyy56WE2pc8t4jNEoIyogIw3N7jij6oTce3XdF95kggqCpFBn9u09dRyZnQGHaZfQQx1MizQD60MWduUOR36J9xYCqjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2322184d385b1081
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8CuwJpdM86dJxrGGOR0C3pvB32M7owT0dR0NTS0nEdJZYmpZSbYAmuEEelXL5W8oDKHJq2lvS3VB4YJfJaLDvnsqEUkB9woakpgfs9OunVmAo6GY88nIPS6C87cc6tI9/Zq6l8BNhYXXGue7sra07vw4hgX3Di/NPwHXz+lwP+aalmRFvHqw/S1Bd0HMxjBBK3P7AkjbkkMkaXR0wT4MWKOd127xRtY4z+8hfG+RvbRHio+YW10vLT27XrvV7UhCRyzlfz1IWV1nqcUAhO7BUtaqXMt+UmNRfyrYzP5HY5h4zH/6ETUDEM2W2Mgl6G1MK9Ua2gUQ2wosLaZrlf9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XT5fN8X8PNaqRLJd1A23nK8nI39vK+Zl192zIDlJdI=;
 b=bVJpYJB7U81RZ1ONiW9dJyQYsJpNy5n3c3Iqjo+XEqE3r1pc0vIknYuOnBfVdBBFXNXLkL5RZLQ9snsvr6k8/9uEXUBEu4eqSrt/ckD1IagVDXBmLD5RZYj9PQ7uoY/nDwBEWyANcJ7eC6MFPMH8CnAmY8LNBkEPOFuEH7cJxC6FFxc84s3rJxdOz872IV6uiwq8tYEtlopDnLwYV2C9iYP8IjBEhgqd0Pk8JbGbGFJmyoWCAk8YdWh0U52PjhQLitjGQIYCwIaPohi/QRKqq6lVFFWQ2kbhRl4hsVIDZz4qi4LANpKOOulyBot3+KB0NRkEznQ5YC2ciQPtNZ0scg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XT5fN8X8PNaqRLJd1A23nK8nI39vK+Zl192zIDlJdI=;
 b=C31V+bhe0oo9KC8dyq+My3YjaBylyCBeP1HcIDA6MkbAbalyBjDFARmaS1n6TpjwKi5T6SVzKmd/vCwgyy56WE2pc8t4jNEoIyogIw3N7jij6oTce3XdF95kggqCpFBn9u09dRyZnQGHaZfQQx1MizQD60MWduUOR36J9xYCqjA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Federico Serafini <federico.serafini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Rahul Singh <Rahul.Singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 7/7] xen/arm: smmu-v3: address violations of MISRA
 C:2012 Rule 16.3
Thread-Topic: [XEN PATCH 7/7] xen/arm: smmu-v3: address violations of MISRA
 C:2012 Rule 16.3
Thread-Index: AQHaMzQuu+t0ikhiokmCnvr+/E49RLDLbWoA
Date: Fri, 5 Jan 2024 15:14:54 +0000
Message-ID: <8E1C54FC-4464-4564-AC0A-FA8C4CB22DC6@arm.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <93d32bf20bb85b93618be5140edb1be527606b77.1703066935.git.federico.serafini@bugseng.com>
In-Reply-To:
 <93d32bf20bb85b93618be5140edb1be527606b77.1703066935.git.federico.serafini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS4PR08MB8045:EE_|DB5PEPF00014B8C:EE_|DB8PR08MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a6e232-f0c2-4711-31a0-08dc0e011a40
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m3wb/IQ6B+46IY59Z1Ril6hGSAqmpHcj6sdHMAJP17XDFIts7s3SgPOVfwbPU/i6L7fYcpbf/KEvthtDE7HKSi2q6l57wlJurj8MxrR5VXaKYdtV6vKlz8DTfUb3i31zXLF/K/VxuyYJb4Unti+2gO54tGZ0ejg/S7V8MPpVBDB0jsel0qeHVWh9Xnv50awfYq9WrBXOz6354bNzfOxC6ZIS5Y1oMWOUc4TE42NNbK/dUiPRkO22TdGOWY5SSsKZ/EfdEr9VBreuZb69zH53U3biMh/YVSY4m/2hWk1kvTLadp9nIzitwQ2iRfimK7GHoK4MCLpxpaMrnhjbZOySPi/WhCF1j62GAMmBliIW/BbUCLDz83whD15BRrsFnp5dUT9F7lTKyWCkgIHOAUEahPBEIDGza9ccWvBdyFR6FfXNMkKlTnB2DFmBjU8tNnHQQNY8Cv2nk32s/h8M3afLL/VV/SMxtE8fGqkyLZ+goFKk9x3JG8LtVfGCzWjQYv0mj8ZIGYU1JYgaNAdKzDxR7+QKwqaBrwKP6cyVVwEy2j68DHchrt432mXTlFr4tYNGPvb+1VFg7fKWRjKLGDcssEndImeT88xv7LCreKQOk5FvaEEK7reemwjOGF1fwdSxiImVkko8KeOB2FCzjYfpvw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(8676002)(6486002)(66556008)(478600001)(76116006)(38100700002)(36756003)(8936002)(316002)(66476007)(66946007)(6916009)(41300700001)(71200400001)(86362001)(66446008)(33656002)(91956017)(54906003)(53546011)(64756008)(122000001)(6506007)(2616005)(6512007)(4326008)(5660300002)(38070700009)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A92C5D21A57C3945998DEFF80C189B0C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8045
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3acec913-8f7f-4170-6d3b-08dc0e011259
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sV3BxAi10hm8hz9YbIyog4w3dZFb/h1YjSxRglb8Ov8zOdHqqfbDCaEXIFCU+Y1T1/04IZgJtRLVVqm+Rm0fJ9VwIt6b/Tw95w07L6ef6riBH6G5/MPRZAOO5Qg5eAU5h/NBa6fq/DG8eJFzCOdxHsmNhlhWgoROTp6dwmgxYXk5LsHH6XGwteTHuydz3UEO3uYxrXddOBR2JH+K+aDcE7qKRlJuSK1iVDpHv3qiYToXVHfJjJwi7Pux+BB/rxIYXaaGOgk0ySo9wqqSVEL6jnQASUFYpAzlc5esmfkuM/atF4JTWROb/TWQwakiJ32oml3DBGqxHA/pKt1gHG0IRSqVIyqSzGlW2kmyGMcOwwF6NTxQ9bTOri+Oi/Buhz4C43lei85BYxXnwzU2tRZuPLouFy7CEJfzbt0tTsEePvEzO0ZeChVR2PYHaCGx2JoJsHrGFjphVXMDgsgP0uEVLGtXwPl1hmwOhqJ6MM5przpCT0VYvnHmPa6ZB8jV2Iztqdxo1iiphdjqBtGcf7XNSi6BvGkMGza8aBqm+atgmsCdhVi9Dm7lZ511zPxoKhwf+6zibPkeMsXkGqWeheIrPi9dAMCD8yZU6ZIVJp/t5ZxHTkeziJssX6J3nhEENFjf3mL7ki/hnQ7onB8+715dBFM75HTjQpa8hup41ifcksbRhxTDtfnPUP4JZ+cjSz677yWOX2A9Qb0boE4mMVtkkomHZqEDN1yJmexMtEu/sQI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(2616005)(6486002)(53546011)(26005)(336012)(478600001)(6506007)(6512007)(36860700001)(107886003)(2906002)(41300700001)(70206006)(54906003)(316002)(8936002)(8676002)(4326008)(6862004)(5660300002)(70586007)(47076005)(82740400003)(86362001)(36756003)(33656002)(81166007)(356005)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 15:15:07.7313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a6e232-f0c2-4711-31a0-08dc0e011a40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5385

Hi Frederico,

Sorry to have missed that one.

> On 20 Dec 2023, at 12:03, Federico Serafini <federico.serafini@bugseng.co=
m> wrote:
>=20
> Add a break statement at the end of the switch-clauses to address
> violations of MISRA C:2012 Rule 16.3 ("An unconditional `break'
> statement shall terminate every switch-clause").
> No funtional change.
>=20
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com

Cheers
Bertrand

> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index cdbb505134..bca5866b35 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2200,6 +2200,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
> fallthrough;
> case IDR0_STALL_MODEL_STALL:
> smmu->features |=3D ARM_SMMU_FEAT_STALLS;
> + break;
> }
>=20
> if (reg & IDR0_S2P)
> @@ -2301,6 +2302,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
> fallthrough;
> case IDR5_OAS_48_BIT:
> smmu->oas =3D 48;
> + break;
> }
>=20
> smmu->oas =3D min_t(unsigned long, PADDR_BITS, smmu->oas);
> --=20
> 2.34.1
>=20


