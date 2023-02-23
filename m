Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE76A0B8D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500430.771803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCI4-0003A9-Ki; Thu, 23 Feb 2023 14:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500430.771803; Thu, 23 Feb 2023 14:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCI4-00038R-GB; Thu, 23 Feb 2023 14:09:44 +0000
Received: by outflank-mailman (input) for mailman id 500430;
 Thu, 23 Feb 2023 14:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVCI3-00038J-67
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:09:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6bdb3d2-b383-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 15:09:41 +0100 (CET)
Received: from DB7PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:52::35)
 by AS8PR08MB6598.eurprd08.prod.outlook.com (2603:10a6:20b:336::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 14:09:39 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::2) by DB7PR02CA0022.outlook.office365.com
 (2603:10a6:10:52::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21 via Frontend
 Transport; Thu, 23 Feb 2023 14:09:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 14:09:38 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Thu, 23 Feb 2023 14:09:38 +0000
Received: from d5c4e8767191.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CB9DD30-57E8-48B4-844D-0AEE48613F4C.1; 
 Thu, 23 Feb 2023 14:09:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5c4e8767191.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 14:09:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9638.eurprd08.prod.outlook.com (2603:10a6:102:2ec::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 14:09:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:09:24 +0000
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
X-Inumbo-ID: b6bdb3d2-b383-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jgdUDoz/IPHi3jYhlxEfeLkwI9Zx876geUTZCoW5fY=;
 b=pX095BKgiakNkTT3wkNy1zJPdtS7YlGFuVmXxiAX/dn20foW0/AuTnJ7YbM/C906F9oFtktBm8vhqexflT3HkaH7784cUg5cWbd6JaxaDdSTyO5R4RwMK3JH/2qYrAtDKmONd6l6jnPIO+CTPvPydPo58CoSrSW/Bos6Gs2yAWM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48d0a86a8914d839
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+1V7KbBHlwKV+b92aI7QYByQLsyHvFN9k5JACXpr5PdxbbZ7k5eWStqPRcl9AxXoKTlKQWPycHzhPrz6EM1Lgoiqn3wHo8edDTzoROPmjhyf6T0spdvScEKNNWAlH8q5DNLW7ek96zyNrBd+V5oj3i0ZtlxkULQfhhV0iLYmS1ptUM6bTPciCIkkHMqLViwxBCA+aSVhCxtES3weUC6xTFLnXTrRUiabETehgPezefav5fGV3daeWBSequeDj3hDcsJI5h+e0+tAODCuaHP+Y5SacEVpKBpK1SQrybrx9GR37ghc89ZpouC69azykfSdNNT7nsTASd185zaODnHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jgdUDoz/IPHi3jYhlxEfeLkwI9Zx876geUTZCoW5fY=;
 b=LLrEfVxr28N2Y5v2Bcjx2VgVRyNMbKZxeYpiANDV2JrYttsYh7RMOm7PJZ3Qh8cvfl5DHjV1wLqtQTThXFek8ZNZVEivZmuXdzpoqlGlT/CHEnUvzCyg8v4r/T3OO3yEOnhV8i/yDJIqcy+bbVmoJHk5K8OsULxkf1dC1zlXtIy6rcZUvIWKWUFFZje/KkA4SIa+W5fcvg7x8xEr2Rcp6pSSo2wyT3khUsD3vDIYQLB/sQeFjC9fUORpPg/I+Ff+XhtgoC3TZ7YT1LV/eQL8yvrOG8WdlPImOXWh+oG3fAnx8KXJE9hPC4tRlD+bzhkrhkqYHH/B9YsxypKJynYjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jgdUDoz/IPHi3jYhlxEfeLkwI9Zx876geUTZCoW5fY=;
 b=pX095BKgiakNkTT3wkNy1zJPdtS7YlGFuVmXxiAX/dn20foW0/AuTnJ7YbM/C906F9oFtktBm8vhqexflT3HkaH7784cUg5cWbd6JaxaDdSTyO5R4RwMK3JH/2qYrAtDKmONd6l6jnPIO+CTPvPydPo58CoSrSW/Bos6Gs2yAWM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH v5 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHZMolNKWoO8TApqkilwj+aGDfZ6q7cu74A
Date: Thu, 23 Feb 2023 14:09:24 +0000
Message-ID: <FCB35FDB-C5BA-44F8-BB4B-BB576D2C4AE4@arm.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-3-julien@xen.org>
In-Reply-To: <20230127195508.2786-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9638:EE_|DBAEUR03FT016:EE_|AS8PR08MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 08394e15-29e4-48c0-8d93-08db15a799d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 joILCbFsADlx/o6vOhhfsNZ+PxAy5LXVS3Nbu+HgPUJrr3n6u/HlL7w6G4bL96oMJZMUPMrLim87802DNtAHfysRbWPUw64ZrwuTQkj/Xiq3biLk6EvLvxb5+1ApJw2DVdhodRKmexlqOgfCn0FuEjQVaSNaSFi+fWkV+GMf8Vca7uIVj9jFyJLbC8GftUPsbe0F8IoPD/cp+P3oM3T2TGIkfc7L5ym9PfUKnE/Qv4TV6NrnQ+lpJGJQeWE/NK2FfPEoxzQcWeX98qgIEKpYMaYH3OQbeWfHWkQ8TnXVyxfVQAwItOzQ8f8IBM1/L4tpoqUKIlQtz/g1ijtVvgO8KouMC+QDKWR/VWDsDlotE4po2DBCIuXqgYInGVCyPueVzkMY7DZbU7pDL3w7qGY+yb8jsixR/JcoeezVZklhXborWupSCxdP1jaVS6L3Su0jVmcTp64YGAk/aEUd9Gt0JlIxM5zFYQLZ0tJTpMsmitsYa+r+rC2QgkxdnT3VwuHZjPZ5HlyoMgGBGIC12ieZiOaBskdNG8HNyLd5YlULgauvBZZu9SFnAHBlOz9rr9XUh5NNPiGYJGPa642Ng2HCbuMwElV/BpAHoRd44CshqslB5B1Lx7/b/wFSWoQXavGx3A5waO26FRbNkZa6PMOInlrgwYFMWwE3xzSqijGnNUhFykcNpv5eHXRKt04LPX0qJKE5ySldrrJop6LJofmRyvji3WhkYPd7m4K44Eu4TtQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(71200400001)(26005)(186003)(2616005)(6486002)(6512007)(6506007)(53546011)(54906003)(478600001)(316002)(83380400001)(5660300002)(8676002)(38070700005)(64756008)(4326008)(66446008)(6916009)(8936002)(41300700001)(91956017)(76116006)(66946007)(66556008)(66476007)(36756003)(122000001)(38100700002)(86362001)(33656002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F0E7D375A9C4EA4B83C4F5F1086B0437@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9638
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54a79157-cc70-410f-8d01-08db15a79167
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7t1RF8EW4vfx6PMDVLjvDSNjTE5DgYmVFOvXIdS0/tK/FY0dgfTsMiGa5TSSIwD6j+ia7vLNawCAjYPf3PGW8mSm8/mwCQFPg42vwVHYOCtuQjSsEscl6tkvCFlNy3qCWb0G48oDYvENHpSwLKa8zeQnxlxnQfjBveoWBN6YcghRfONX94kr2AJ7kEnBVApSqQxtDX3o5uj1J0oTd6e9pBrQZuppjaIqtfxHNPAezvP2HG5KgdC2nfc5yTvWiKachDaCbleb9AwetUCWmvYiCpzt9GqyBv6L+ySvBSDRgkF2msGFth5yMGfhPX3sntb865nHfQ7aeMYk3YA8Fhk12Yq3XYE2ZQOPZHtjHRnjue3mVwNaGR8bhYKR15VDqsw1oWDhazciWvi3x22stMxRLShL6vUI6XuxLCzG24Jw2Y6/w4cDI+HRsAOtUBpjCQksDiHiOU517URrsVRqFennugEmTt7V5kkOkx8QInx86a3xlCB7/FfvOg+n8vGdV4sDiLJOgfv3vsagaXx3zb+SxIjpBHH1w6+NQ8lTzLhiubrv1/Porkm0F3THz7INB9isdV7oSSJigIeevIzRDhjn5C6/oM4/ZTzLALJC3pSgCs7w3Og/S7v7+KgwCTpGFjr/kLMgc37YKgGyEh4eKcstWMztLU/q8MEqWaGplQ/UbXM6UnLZcEdtaCZq2OWkq4Z0INbHw1MNMDNSUB27Djc/qw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(70206006)(54906003)(70586007)(83380400001)(6862004)(8676002)(316002)(8936002)(5660300002)(4326008)(41300700001)(107886003)(6506007)(6512007)(2616005)(53546011)(186003)(47076005)(26005)(478600001)(6486002)(336012)(356005)(33656002)(40480700001)(36756003)(82310400005)(86362001)(82740400003)(36860700001)(2906002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:09:38.7204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08394e15-29e4-48c0-8d93-08db15a799d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6598

Hi Julien,

> On 27 Jan 2023, at 20:55, Julien Grall <julien@xen.org> wrote:
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
> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
> tweak of the boot code because XEN_VIRT_START cannot be used as an
> immediate.
>=20
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

With the finding for the comparison to 4 and not 2 found by Michal fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com <mailto:bertrand.ma=
rquis@arm.com>>

Cheers
Bertrand

>=20
> ---
>    Changes in v5:
>        - We are reserving 4 slots rather than 2.
>        - Fix the addresses in the layout comment.
>        - Fix the size of the region in the layout comment
>        - Add Luca's tested-by (the reviewed-by was not added
>          because of the changes requested by Michal
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
> xen/arch/arm/include/asm/config.h | 34 +++++++++++++++++++++----------
> xen/arch/arm/mm.c                 | 11 +++++-----
> 3 files changed, 31 insertions(+), 17 deletions(-)
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
> index 5df0e4c4959b..e388462c23d1 100644
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
> @@ -163,10 +179,6 @@
>=20
> #else /* ARM_64 */
>=20
> -#define SLOT0_ENTRY_BITS  39
> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
> -
> #define VMAP_VIRT_START  GB(1)
> #define VMAP_VIRT_SIZE   GB(1)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f758cad545fa..0b0edf28d57a 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -153,7 +153,7 @@ static void __init __maybe_unused build_assertions(vo=
id)
> #endif
>     /* Page table structure constraints */
> #ifdef CONFIG_ARM_64
> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
> +    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START) < 2);
> #endif
>     BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
> #ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> @@ -496,10 +496,11 @@ void __init setup_pagetables(unsigned long boot_phy=
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
> 2.38.1
>=20


