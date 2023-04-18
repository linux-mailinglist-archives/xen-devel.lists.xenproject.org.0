Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB7D6E6669
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522910.812565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polmH-00077u-Jt; Tue, 18 Apr 2023 13:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522910.812565; Tue, 18 Apr 2023 13:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polmH-00075J-HD; Tue, 18 Apr 2023 13:53:49 +0000
Received: by outflank-mailman (input) for mailman id 522910;
 Tue, 18 Apr 2023 13:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1polmG-00075B-Fu
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:53:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe7afa8-ddf0-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 15:53:46 +0200 (CEST)
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by AS8PR08MB8682.eurprd08.prod.outlook.com
 (2603:10a6:20b:564::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:53:40 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::5b) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 13:53:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 13:53:40 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Tue, 18 Apr 2023 13:53:40 +0000
Received: from d7779ff6267e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 187A7BE3-F101-490B-A825-E943D5D518A4.1; 
 Tue, 18 Apr 2023 13:53:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7779ff6267e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 13:53:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GVXPR08MB7749.eurprd08.prod.outlook.com (2603:10a6:150:69::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 13:53:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:53:30 +0000
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
X-Inumbo-ID: 6fe7afa8-ddf0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX0a2+ixL92Lrl4Ob+ESXYJT+MtQ6svD3u4HBZLaXl8=;
 b=SDk4IijRbEOdg9HcEt/v5JPWiiY7A15uC+UfAG2baFnYqlAGvi2tA73v6mIB6xjwOuErf5Id6zIdNiD1Jk9gB9Vxl7tdX2b1CCNZT77pz01WgrYte7l3upY2pJqveXCuvN/FL/Y7UbK9quYQbGf/LDIRYRC+UcCqeLUsUoK4R/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: caf32e46ad596eab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2Fk58JwC2vHQiG3k2Rk+m0tlmx+ObOQ/DLy9Bvc7P/vsphjd5NrhRyT7R7SSQS7aWvITOkXvzz0FMbza3vvFuq9On5Zl7FmWGr5XJs93oUxfEL4o2dUPZsdgeKPa+SzoPNQItQTeUpPcNr4vzoyE0Tp1tgK8DBMtsNkcQdECUJe+AtdZeJH+zKgv5g6cXkub3/hjVudPziHsGjdc+DaCfknUcgZLBJDOpWIIy2iupBEK96fdzUbric94bOIBhZVLh7n0YuwxH26GdmTrgzFo/XXddmjqCdI4IRRaWJ/M3rK+pVYOpRvfRQCL1gWRSBHK3zvfco5qO0Ls7cN0XJhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX0a2+ixL92Lrl4Ob+ESXYJT+MtQ6svD3u4HBZLaXl8=;
 b=cEv+l3rEkzz/3j6Kam0AreG6o3SaB2NyXVm1AhUTL4FbZDxwaDrULcxpszrKq40baPkH01lsgNrOJs0ZFYMs4B5UPnwCM/4g5MCZdAFkn4RhI1YAKZrS39MV1uHwyHKAORidrdgKyIj+xckY7bykM5LXS6I6Yeix5lKTzqg7mIHHkNmX4VfjabPa9AJ57sQJxrJSVRbu94d/x1Zg12aHPb7VNLq7kyK8jraMRjSxfQblyoE1Hv4LNH+LH6jqCyBZraalvUPAjNfwdgaoy80k+ODanjb5N3eK4r8Svo5nWgG7ewv029+7RkGxbZFpE5MoVd0WTeKdYRtdnbi0OHzg8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX0a2+ixL92Lrl4Ob+ESXYJT+MtQ6svD3u4HBZLaXl8=;
 b=SDk4IijRbEOdg9HcEt/v5JPWiiY7A15uC+UfAG2baFnYqlAGvi2tA73v6mIB6xjwOuErf5Id6zIdNiD1Jk9gB9Vxl7tdX2b1CCNZT77pz01WgrYte7l3upY2pJqveXCuvN/FL/Y7UbK9quYQbGf/LDIRYRC+UcCqeLUsUoK4R/g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHZcHBTPKRFJKI7hUu6krfNforKJa8xGWKA
Date: Tue, 18 Apr 2023 13:53:30 +0000
Message-ID: <D357504A-B3BA-4058-98AF-973A7286D19A@arm.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-3-julien@xen.org>
In-Reply-To: <20230416143211.72227-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GVXPR08MB7749:EE_|DBAEUR03FT036:EE_|AS8PR08MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b282845-69c4-4328-e8fa-08db401450ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QbpezO3qIzsl2GUSPsQM5/qs6NcDsNoBWupmrBDMjhN/g9k3iyVWNivPZZQP+AuFQw5m0HLd2EzMNZOTmhpzhdj1sXg4GgtIlnC257uhSim988rDWbWzCIimgvz5l5xeNaL6dOGL5fB6V7MeiXHnFRjC2iIz6ukJsM2Ws31tIPGkdb7/KfdzON0cuSBiCycQ+K0Mp508s3Dibj0jyfMgfUFoSMtQB20grfQigu3g+N2q/E776WWVGbP1EAvinCiohT+00FiCejXp0UiKLUWoRh0xKTmOp3HhSu5giSRHyPz1RGIV+Iq+OPtNxCRBuBzdue+lIKyUeLUpK6HDsnK68ZEyL+jrI/lT+dhy+rYAYqSX+ZD9OXtIXqBpnBxv7cXsHFEPkcGK+biDcRikrhqe14YmntZP5nJ1ej9rA6cmXEcMa5Hx/Jt7lYsxHGNq3+0BZpG2F7fFvwdP8YqVjIUgIvbGjqk8a/hn2Fd9IXj2IqAef249ITlj5upatV4yjGR7rwgjIbUI1onnaD65bKG1u6cvVi5ncOqb4HMTkXi9p+Ocbl5XGLzwR8CIvljMmi4GPqAoqTk511ZR71pKhzz9D6jEYuVQMamqdlscUEZZlAbltwABl4aGhfps5IRwN/uHo6o0w/pC/YOv8gWHYw3jmQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(2906002)(8676002)(76116006)(33656002)(8936002)(5660300002)(478600001)(41300700001)(91956017)(186003)(316002)(64756008)(66946007)(66556008)(66476007)(36756003)(83380400001)(66446008)(54906003)(4326008)(71200400001)(122000001)(86362001)(38100700002)(38070700005)(6506007)(53546011)(6512007)(6486002)(2616005)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D0C1ECB4F9F1EE4793D1A2B189B96588@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7749
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8aad34d8-96d4-4d2d-4484-08db40144b19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GPmWr14gNyvcc5EH/tmLnwFmNrBZsPD2DS1SxVIVfD4gC6Qvef0/3MbNxpZP68LXN0Ex7YSg1O56GC+lnch4gMOjXFLQYLuB43drm0Tg16K3K7rKh4RwVuwVPYsv2rFAKMW0dN0gfGLpG84D3s62Qt1YblaF4OOSiffijg4MPD8bjXbtoGAqZzNjdovM+l1vdo0BAPV8gLMTDqonl/bfLisnYWdASpXou4akiemxL/1pxx+g4b0o7vHaNc8BkcBRoeoLc1AJB+5cNy/vIWvGDCBVBvjlGylEsQBS9IYIA45XX83L8ZScXvvoRGwckDcAHFmKToNxYbaSw6Jl1xLY3ccm1C0O4OjMtLbTI+N4M7dGp1AzOaRvNpuAxN29x4xjQW9zj0dj2aINJdpB0bY0DLXHnMyYtirbSRLe0LcJQfTkso6srx0hie+daxYbMvluSrxlW6+FCtO2IAImpWDJXIRK7L2ek8lSabrpb2HNgSe2ii27DUpSM73A04KeuD1rPJ9rjn4OH/raraZkspKEo8R2ofbEXfYr44S3zCDBIDXYr2UVYujBr8lerKRAfKv4wZf3kKty9ZY9X74K3pI2YhwlJGWD71u4y8XJK8avW3zkTdNSzZolhSzc5oZrqgjYOo7e9memG2yrSQn/N3ZJbqOdzfQPnQDAGHIWDaIYfN4f3rpxiI0P0hR7kXGFl4fBeiCpbhgT4y7aywCoqK5moA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(107886003)(40480700001)(336012)(83380400001)(2616005)(47076005)(36860700001)(186003)(40460700003)(53546011)(6512007)(6506007)(26005)(86362001)(82740400003)(316002)(4326008)(41300700001)(70206006)(70586007)(2906002)(81166007)(356005)(54906003)(82310400005)(478600001)(33656002)(6486002)(36756003)(6862004)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:53:40.3996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b282845-69c4-4328-e8fa-08db401450ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8682

Hi Julien,

> On 16 Apr 2023, at 16:32, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Xen is currently not fully compliant with the Arm Arm because it will
> switch the TTBR with the MMU on.
>=20
> In order to be compliant, we need to disable the MMU before
> switching the TTBR. The implication is the page-tables should
> contain an identity mapping of the code switching the TTBR.
>=20
> In most of the case we expect Xen to be loaded in low memory. I am aware
> of one platform (i.e AMD Seattle) where the memory start above 512GB.
> To give us some slack, consider that Xen may be loaded in the first 2TB
> of the physical address space.
>=20
> The memory layout is reshuffled to keep the first four slots of the zeroe=
th
> level free. All the regions currently in L0 slot 0 will not be part of
> slot 4 (2TB). This requires a slight tweak of the boot code because
> XEN_VIRT_START (2TB + 2MB) cannot be used as an immediate.
>=20
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
>=20
> Lastly, take the opportunity to check a compile time if any of the
> regions may overlap with the reserved area for identity mapping.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With the 2 typos found by Michal fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ----
>    Changes in v7:
>        - Remove all tags
>        - Add BUILD_BUG_ON()s
>        - Don't forget to update FRAMETABLE_VIRT_START and
>          VMAP_VIRT_START
>=20
>    Changes in v6:
>        - Correct the BUILD_BUG_ON(), Xen virtual address should be
>          above 2TB (i.e. slot0 > 4).
>        - Add Bertrand's reviewed-by
>=20
>    Changes in v5:
>        - We are reserving 4 slots rather than 2.
>        - Fix the addresses in the layout comment.
>        - Fix the size of the region in the layout comment
>        - Add Luca's tested-by (the reviewed-by was not added
>          because of the changes requested by Michal)
>        - Add Michal's reviewed-by
>=20
>    Changes in v4:
>        - Correct the documentation
>        - The start address is 2TB, so slot0 is 4 not 2.
>=20
>    Changes in v2:
>        - Reword the commit message
>        - Load Xen at 2TB + 2MB
>        - Update the documentation to reflect the new layout
> ---
> xen/arch/arm/arm64/head.S         |  3 ++-
> xen/arch/arm/include/asm/config.h | 38 +++++++++++++++++++++----------
> xen/arch/arm/mm.c                 | 23 +++++++++++++++----
> 3 files changed, 46 insertions(+), 18 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 4a3f87117c83..663f5813b12e 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -607,7 +607,8 @@ create_page_tables:
>          * need an additional 1:1 mapping, the virtual mapping will
>          * suffice.
>          */
> -        cmp   x19, #XEN_VIRT_START
> +        ldr   x0, =3DXEN_VIRT_START
> +        cmp   x19, x0
>         bne   1f
>         ret
> 1:
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index 5df0e4c4959b..2cfe5e480256 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -72,16 +72,13 @@
> #include <xen/page-size.h>
>=20
> /*
> - * Common ARM32 and ARM64 layout:
> + * ARM32 layout:
>  *   0  -   2M   Unmapped
>  *   2M -   4M   Xen text, data, bss
>  *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>  *   6M -  10M   Early boot mapping of FDT
>  *   10M - 12M   Livepatch vmap (if compiled in)
>  *
> - * ARM32 layout:
> - *   0  -  12M   <COMMON>
> - *
>  *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>  * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>  *                    space
> @@ -90,14 +87,23 @@
>  *   2G -   4G   Domheap: on-demand-mapped
>  *
>  * ARM64 layout:
> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
> - *   0  -  12M   <COMMON>
> + * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> + *
> + *  Reserved to identity map Xen
> + *
> + * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4]
> + *  (Relative offsets)
> + *   0  -   2M   Unmapped
> + *   2M -   4M   Xen text, data, bss
> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> + *   6M -  10M   Early boot mapping of FDT
> + *  10M -  12M   Livepatch vmap (if compiled in)
>  *
>  *   1G -   2G   VMAP: ioremap and early_ioremap
>  *
>  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>  *
> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
> + * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
>  *  Unused
>  *
>  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
> @@ -107,7 +113,17 @@
>  *  Unused
>  */
>=20
> +#ifdef CONFIG_ARM_32
> #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> +#else
> +
> +#define SLOT0_ENTRY_BITS  39
> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
> +
> +#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
> +#endif
> +
> #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>=20
> #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
> @@ -163,14 +179,12 @@
>=20
> #else /* ARM_64 */
>=20
> -#define SLOT0_ENTRY_BITS  39
> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
> +#define IDENTITY_MAPPING_AREA_NR_L0  4
>=20
> -#define VMAP_VIRT_START  GB(1)
> +#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
> #define VMAP_VIRT_SIZE   GB(1)
>=20
> -#define FRAMETABLE_VIRT_START  GB(32)
> +#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
> #define FRAMETABLE_SIZE        GB(32)
> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b99806af996c..1d09d61dd922 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -153,7 +153,19 @@ static void __init __maybe_unused build_assertions(v=
oid)
> #endif
>     /* Page table structure constraints */
> #ifdef CONFIG_ARM_64
> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
> +    /*
> +     * The first few slots of the L0 table is reserved for the identity
> +     * mapping. Check that none of the other regions are overlapping
> +     * with it.
> +     */
> +#define CHECK_OVERLAP_WITH_IDMAP(virt) \
> +    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L=
0)
> +
> +    CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
> +    CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
> +    CHECK_OVERLAP_WITH_IDMAP(FRAMETABLE_VIRT_START);
> +    CHECK_OVERLAP_WITH_IDMAP(DIRECTMAP_VIRT_START);
> +#undef CHECK_OVERLAP_WITH_IDMAP
> #endif
>     BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
> #ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> @@ -496,10 +508,11 @@ void __init setup_pagetables(unsigned long boot_phy=
s_offset)
>     phys_offset =3D boot_phys_offset;
>=20
> #ifdef CONFIG_ARM_64
> -    p =3D (void *) xen_pgtable;
> -    p[0] =3D pte_of_xenaddr((uintptr_t)xen_first);
> -    p[0].pt.table =3D 1;
> -    p[0].pt.xn =3D 0;
> +    pte =3D pte_of_xenaddr((uintptr_t)xen_first);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] =3D pte;
> +
>     p =3D (void *) xen_first;
> #else
>     p =3D (void *) cpu0_pgtable;
> --=20
> 2.39.2
>=20


