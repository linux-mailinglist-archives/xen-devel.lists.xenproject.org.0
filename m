Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EDA66D4E8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 04:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479041.742624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHcNC-0007WR-PX; Tue, 17 Jan 2023 03:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479041.742624; Tue, 17 Jan 2023 03:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHcNC-0007UB-MN; Tue, 17 Jan 2023 03:10:54 +0000
Received: by outflank-mailman (input) for mailman id 479041;
 Tue, 17 Jan 2023 03:10:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mnn9=5O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pHcNB-0007Ty-7v
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 03:10:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8beb75a6-9614-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 04:10:51 +0100 (CET)
Received: from DB6PR07CA0166.eurprd07.prod.outlook.com (2603:10a6:6:43::20) by
 AS2PR08MB10322.eurprd08.prod.outlook.com (2603:10a6:20b:5ff::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 17 Jan
 2023 03:10:49 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::d5) by DB6PR07CA0166.outlook.office365.com
 (2603:10a6:6:43::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 03:10:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 03:10:48 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 17 Jan 2023 03:10:48 +0000
Received: from 47af3368f8fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 00992B5D-3AC1-4250-A5E0-E559802E193B.1; 
 Tue, 17 Jan 2023 03:10:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47af3368f8fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Jan 2023 03:10:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8807.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Tue, 17 Jan
 2023 03:10:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Tue, 17 Jan 2023
 03:10:29 +0000
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
X-Inumbo-ID: 8beb75a6-9614-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjaOFzc3csXxMX7AQyXBMtP1uvGNHik3RJzjrfKZYN8=;
 b=oDmHgWacoTM8two7BV+oBblt5FWWLJyyr/h8u/4hMEShx5DwPgf5tqjZ787fUvKgqt4zN4sykBw+evLmxkn8tSvCOAAIaAJZ3cL+f0Gr3ZVDAariwEFWmn+jjTMB16Y1EOlDswLQhwULrUoIcYPLfw5WGjaZmXqgskGlGEbkUh4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwLOViJ6u0CHzFWwXHrX2ZCznt3/zxeoHNP7cmI+cvb+1172IXpJkG5dzxkMsxYRgEVS/MSm42vVzeo4eyNZTRE4CCnagX5Kgr1MfUoZVdl959ZCxCVsUsktbqhAnCjbdTaT+gZzUubCl4lN4onha4+b1dGKITobfJWk9vc984NpC5heqLfSZPykgBZBEWlrpK0UUM5iOYgDz80kaoLBPPSuztkCTVI4bFO90ZLqiONGkk/pgTCdNiJgMtcSq0S479p/Q0PYEjvPfvqc6+vffdQQYJ6pGFzIBMIeUfy+PYNhHjPKawGKTJBxjE1CWntDs1wdIB+Rx8qO0A9wi+9E6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjaOFzc3csXxMX7AQyXBMtP1uvGNHik3RJzjrfKZYN8=;
 b=aK0d7zR8wtNR/izfsFTryNkbPRPnW3qsT49JiEexTQVnq15aQvlppN7EodE8Oc93QyZREOok7TdpAPffZRTCtbEUPsahejLGHoBVj2SqQCZVUXUf8xrxCJoInrfXZvbxlPzHI+RJSshistM+PS7MfwATBlUo+rC8badL5KNjtyktVEypTrlkQKg7LzsDbJUVZKvdLjO1H9JoYs80j24lH4dhLNHexApzStpU5R5ijAYGMXtBSlc7CII3uo6XMNnWK/bzRpLAeeqkrbYKwkY20FfdNpCfPLKNdxJiwfb0xAlTtnV0PU2qlATjP9yNGiCvlTcbjLdfkiMkTtOVihmdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjaOFzc3csXxMX7AQyXBMtP1uvGNHik3RJzjrfKZYN8=;
 b=oDmHgWacoTM8two7BV+oBblt5FWWLJyyr/h8u/4hMEShx5DwPgf5tqjZ787fUvKgqt4zN4sykBw+evLmxkn8tSvCOAAIaAJZ3cL+f0Gr3ZVDAariwEFWmn+jjTMB16Y1EOlDswLQhwULrUoIcYPLfw5WGjaZmXqgskGlGEbkUh4=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Thread-Topic: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Thread-Index: AQHZKbkuhF2CydVKlkSWMcq+jFNCca6h0FvQ
Date: Tue, 17 Jan 2023 03:10:28 +0000
Message-ID:
 <AS8PR08MB7991378797D89AF18F735C7C92C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <20230116144106.12544-2-michal.orzel@amd.com>
In-Reply-To: <20230116144106.12544-2-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E7FD13E8FE65A449BB7B70A3B45102C0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8807:EE_|DBAEUR03FT026:EE_|AS2PR08MB10322:EE_
X-MS-Office365-Filtering-Correlation-Id: 790fa496-4973-497d-27fc-08daf8386ea3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tr6ANeXTpVOY6xYSimNsddsbtA0es9FS/9mEgm390o9fs83K6a7Q4OUBVA8aN+zIWnNBCUXJVlj4KxjOBbGjGDwiRiorli8W6CVfa6KIdYxB5V+UdprxSp7yHodv1M3LQpGg8RaHK8zFKlpdzaTA+0GetLWrr1LD4978eYmnB3YVEJn3q6Wi6pe1bLdhGASjuh4SX3xI/NfwGa6ayP/EdYd3C8EUVG8oVa/FWMeerg7wznMMAndIdouIM15ZWibJmQwiNUqyNkC62OKsCwEumJ9fYGaum9c357DqqVAReITjh8EFPA+/l2QoYK3bVN2Z+AtA1Y9tMBTnIxYfSYbfmal25CQqfP5OlOdT6TZ9A1D2vwc/Afn3iYhv4cx5kitfnPhKpcjFdoFbVHFegyRdgSk+pjOuM/zgDSJ8sxLuAY2bP68tk7u8r+tX+m/dwg1zTdZyUYdmUf/KKaDoicWmcQcLc7LzCr1r+2otIGVGotenrK2pN7hW3BCZuOFyFOYGEczfWzX1+kb9ClGq3QI0yppMaP9NZpXCJ+LupCrMXVhhV0ka1OeckMgcrcpYgW7JlRnCfKPr3gyPtM+OrythimIiOykvFEVZgjM4o8emFM3ywAVDXKsI6IRfpoYQTDCUJAvPyIN7n5/12TopExd01v9zdxPFbsJNXAndQWvA0Y5/EEMwJ+/Syd7HLF+FnHQpne6DiIzfMCi6R88wJsq5Dw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199015)(55016003)(33656002)(8676002)(66476007)(76116006)(64756008)(83380400001)(41300700001)(5660300002)(66946007)(66556008)(52536014)(186003)(26005)(478600001)(8936002)(66446008)(9686003)(4326008)(316002)(54906003)(71200400001)(7696005)(110136005)(38070700005)(86362001)(2906002)(38100700002)(122000001)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8807
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9e12951-32e6-40c9-1cd1-08daf83862ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ymvmb+jDcqqJS3iTsUtwDAkEErwPxsd0PY29/8b2TA3NG5HrKMF/GNdIwelAc6ok0rsRvARLbECiqQu/P60Qky/T7lhaG2rYh1ZnkM7jblXHeiTrdHtxU5UNpFkzez+NPAERXZPP3G9xO27e5am964EElgi7kErtQv9pl2dWZ8FR1dC1x+PEQfHnY+OHXgaP514GmRvbUtD5bPIotS9odGWOBIhdUzFahIBFNlI2D74TY81xI8Tch0RFed0O7GDG8YqQiHAPzcedwdGouG8Ydye1eb6vFnklGaWYwkpCb4Fttr9oyQIgdq4j46YR2K/kcUULCIB5v1nd18avf9/vkTLno5wypEmoD2XzhTYg2slTkZ/QmvKMX6eOiBq3JtstlHNT+vKvgzfjsO5Y6vJB3ZKFppGYtC6hZx30gZBC6aBycKXgaJ5fuFdhW6qN5gJIYzAZrHQMbSJLMRpM309h1veFrbOOKzPXz7b0BuGDh80hoVQjF229ASs/0wAPT7wmtPxgXhkxSfxHCAraB/rpKjDPkyo87k8IaGcv/CLOjcA1cnS0JEQwYSogZBLFHciWg6ZT0YpOzNYSoKGD03RS9XMZxJhui5Ite4uJs7RcKl1wDSbrSi3ZMvtSJ9H4XkVW3kChBrJcRACiFctnmqJ1B8B773u5iVTd/Ix2QkyDvojyAIXfA6ju7T3YInngpdBonTQFBuwlQOhAq1FRVPiHmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(9686003)(86362001)(8936002)(478600001)(186003)(26005)(7696005)(6506007)(82310400005)(107886003)(54906003)(52536014)(110136005)(356005)(336012)(316002)(70206006)(70586007)(8676002)(4326008)(81166007)(40480700001)(40460700003)(47076005)(41300700001)(83380400001)(55016003)(5660300002)(36860700001)(82740400003)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 03:10:48.4389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 790fa496-4973-497d-27fc-08daf8386ea3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10322

Hi Michal,

> -----Original Message-----
> Subject: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
>=20
> The direct mapped area occupies L0 slots from 256 to 265 (i.e. 10 slots),
> resulting in 5TB (512GB * 10) of virtual address space. However, due to
> incorrect slot subtraction (we take 9 slots into account) we set
> DIRECTMAP_SIZE to 4.5TB instead. Fix it.
>=20
> Fixes: 5263507b1b4a ("xen: arm: Use a direct mapping of RAM on arm64")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/arch/arm/include/asm/config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/include/asm/config.h
> b/xen/arch/arm/include/asm/config.h
> index 0fefed1b8aa9..16213c8b677f 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -157,7 +157,7 @@
>  #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>=20
>  #define DIRECTMAP_VIRT_START   SLOT0(256)
> -#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
> +#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))

From the commit message "L0 slots from 256 to 265 (i.e. 10 slots)", I think
the actual range is [256, 265] so probably using "(265 - 256 + 1)" here is =
a
bit better? It seems to me that the number 266 looks like a magic number
because 266 is not in the range. But this is my personal taste though and I
am open to discussion if you or maintainers have other opinions.

Maybe we can also putting a comment on top of the macro to explain this
calculation.

I did test this patch on FVP using XTP in both arm32 and arm64 execution
mode, and this patch is good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

