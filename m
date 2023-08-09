Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855B77617D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581106.909651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjTo-0005ck-CN; Wed, 09 Aug 2023 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581106.909651; Wed, 09 Aug 2023 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjTo-0005a2-9N; Wed, 09 Aug 2023 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 581106;
 Wed, 09 Aug 2023 13:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTjTm-0005Zw-EC
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:44:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc208c1f-36ba-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 15:44:01 +0200 (CEST)
Received: from DU2P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::20)
 by AS8PR08MB5989.eurprd08.prod.outlook.com (2603:10a6:20b:297::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:43:51 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::4d) by DU2P251CA0022.outlook.office365.com
 (2603:10a6:10:230::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 13:43:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 13:43:51 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Wed, 09 Aug 2023 13:43:51 +0000
Received: from d3663516bddb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6EAC9B19-1904-4FB7-BE11-93A5909DE6E5.1; 
 Wed, 09 Aug 2023 13:43:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3663516bddb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 13:43:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8116.eurprd08.prod.outlook.com (2603:10a6:10:3ec::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 13:43:02 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 13:43:02 +0000
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
X-Inumbo-ID: cc208c1f-36ba-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Yj8Ae1uxprVYPAiU4vBf3XP8MCk4USbss9Nmn4utc=;
 b=FqUUx4rviVmhrL1sQ6ES9Qwg1s1pmx2lINCZRhj4fCoOdui22s1cCck2SsvclIQZuLRh0G/PyNvxhhECl7BQQEcSKTr0y9/d6e4cKxqffaeb9OgkxD8sh6J8GSO/s6v3E2+HCOGDfFTv0gr+73j1zTpFs1DylbDmn48Kikx4gSo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdd756b83d2ddcac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhspUFx4EVyOE5wl2kcyP63Fr1ycDh72ZskEqRYcSPj8exdNnXI7ebODNf2Sb7c6S9SGSNCWLnj0DXX8pSGPn7Zo7wB28r7baP/Ul39KgX04J4gf0srjbmVwQlKVcTZ0EMFCwGDRBH79slgI1hJb97dTwQ5v/xf4Z/WcCm7VGJZxTuQTG9CSL6YvjodroqII1iyL3p31j/XtgCVYRRPUHfXkx5I6bHdkIY9Ft71vYUlWbFTRoiatYoI5kw8F2K+VNQVkGP03Ap+OYa3TtK+A1lPVE3h0O3yAOwLq3muMIh180Ko2rFxOiGJSBAIzeQ9dvY2DxT3etNrlNvvUWbUPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/Yj8Ae1uxprVYPAiU4vBf3XP8MCk4USbss9Nmn4utc=;
 b=cdSHLd+wL5Hg9JHPpaWcL+cIfG44GK/hZ1WiylzIUNzaP3u01w37tceYBEvuYfLJs8dCVhf+XLf4MrHxej1Nv2dsj0OqosmCp08fZf6iXEZ42YK2XXlttFPyrjUIblUfjx9XO16cBY/Es/K7QnxNm7iU2mkn86qSwzUdskeq1wFzJ+XMyMDSkJIwFp//33In6l4+u61XRKYD6SVCTZTA7cASqh0GSnicggnNrmRaSKlFpGLdbTIY3ipDBOeBmOIaN0CeT0F/L+rboPG8MIs7LqDJyzGyTLtj0Gj8NlVBcCvoFLWZnHMgWdcDVbX+x/vmV8UQS0n9TkFuiH/SB5kMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/Yj8Ae1uxprVYPAiU4vBf3XP8MCk4USbss9Nmn4utc=;
 b=FqUUx4rviVmhrL1sQ6ES9Qwg1s1pmx2lINCZRhj4fCoOdui22s1cCck2SsvclIQZuLRh0G/PyNvxhhECl7BQQEcSKTr0y9/d6e4cKxqffaeb9OgkxD8sh6J8GSO/s6v3E2+HCOGDfFTv0gr+73j1zTpFs1DylbDmn48Kikx4gSo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 6/8] xen/arm: mm: address MISRA C:2012 Rule 8.4
Thread-Topic: [XEN PATCH 6/8] xen/arm: mm: address MISRA C:2012 Rule 8.4
Thread-Index: AQHZyrEdmNcwigzYukmEfRcETstuuK/h+WWA
Date: Wed, 9 Aug 2023 13:43:02 +0000
Message-ID: <0C30A959-AF46-484D-B44B-058A86799FE6@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <67163dc4bc2e44d3f70f9c49295b993663d2fd5a.1691575243.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <67163dc4bc2e44d3f70f9c49295b993663d2fd5a.1691575243.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8116:EE_|DBAEUR03FT060:EE_|AS8PR08MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff88c4c-ea40-443b-4a3c-08db98deaa96
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DkMQ3+89bXg08Z1Id1+QflRLmYwA1msT3uWtWsLkT9IJkJ61WPiMENiqBXA3NCYPSoBVEefA6Lmf19VX74OXm8HUbZ1e/tzWhePnvPw8E5jSAzIWCwueFlR46dwZnuDSM9Nv98WRkGPAEaY0HMQ916FweTn56IOaaN32bzYv7PEi7/vd9lCsGuXQFPzO+CifCJ5DwacsId3rKmsfiSRJYeCEiQTknATKyNlgGtqkTOakHKcZ5eq8WS9Pf048ASiw7+CtnS3ZtbbWAJZ45Rf9BOk8YSweIdQb7ImjMFyIr+wGbE6Of7lbIFeyjdd2pq/9UNCKZBwzciIlwxs8RpEmbF2IXLMjuQ/UbxeyZ05u13f/MwGCNsRN81CkstCgUJIML46XTrRPFpI0daa0h/KMQJMJR4lsxyvrm2g+0nt+jyZ+VGr1EZNdh3olO+wqOQPvNOvUohiRg0cTK58T3qWip1OKPawzFV2ZqZe1zRnMB32d5+fgZdePOJx4nECbs+xfBlI8MgGAi5UaH2FDjJRv4qnL1Ub/zyVDYNDy0uG6H12ixIKA8sbgT39dLe0HEn5aN1SljXJkyAkclVSpkmpXFqS8/PiW2L0yd26kzwNW2d/L3TZ6NPqRylNbirisBZWTG8trVH8+eLEtPepbHnZn8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(186006)(1800799006)(451199021)(316002)(2616005)(2906002)(122000001)(36756003)(71200400001)(6506007)(8676002)(5660300002)(53546011)(6486002)(38100700002)(26005)(66446008)(64756008)(41300700001)(6916009)(76116006)(66476007)(4326008)(66556008)(66946007)(54906003)(33656002)(86362001)(91956017)(38070700005)(8936002)(6512007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7EBDACD8C8EBD24B872027029807A142@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8116
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba0f673b-1880-412e-92cc-08db98de8d2c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IeFO1/2uIuWmRIe5j6mAwX5v2KHn+ypKco9khijrVrk92ZxMKRlMdIUalc1eNrNDlRwB/CP6aq/Kbekg7AdN/ionrmxh5jSLyM7cp2Zt0MSJywJigFmHDB0xx5qzZ+uEr5PKV6/DGo2zIUk0cdk/JM7CeNs/QfWbdFsDmg4oozz+R+IKYDXsRJIs/GgAqjI16N5t3LVbCGANavN8uyORluFdyToXDwqNBKNbDZdrZHnW2K5Z8tWCDUnam/39dVRUFRXwfdlWANjWkPTorR6hOC/l0e7tVKbspmnZvLAiQ1Z0xszczwRU9UxBSPiukUw5SoyW2KlS6XoKDmcwPIhCQXUxBMGHAoznswLPZxttkiQNvO6Cd0gzCxDDUO9PmrD5BbAJ7/F1uIY95YqeoxTmh/rpH0/4gWlSka2GTtG/O9XM9VPXM4sNwbnI+rpDJKH1MoFGvu+UO1MpfSPRSzvu+XWMjSqiQvELmm3aDeTQFcUFHcfgYuEVo7iAt8eEdYaUvQ3O1OY/YwfHQnC62mC/5DIZ/ToaX8BJLCE3lGiLNlQCUBdfUxl70WUDgLi9XZiptiSLr4jCL6KSohbeGvM4NhvKHWdMasc2fmNM2gpwlRz8n+YGfpPybhQVJVtdp04qhwpCo0ooFTvbiPCVxNpyxTWt8ftSNccEshVJvSYzt2lx47Jzy/4OaGmGqBzcVgGgwD3ZDhD4xokp+qFxSp/ObsTGkLUY/0hFp80U6jcQreV8H985e81MuCqw5I/VPZ1t
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(82310400008)(186006)(1800799006)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(356005)(478600001)(82740400003)(81166007)(2616005)(47076005)(336012)(40460700003)(6512007)(26005)(53546011)(6506007)(107886003)(40480700001)(8936002)(41300700001)(70206006)(70586007)(316002)(8676002)(4326008)(2906002)(6486002)(6862004)(36756003)(54906003)(33656002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:43:51.5038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff88c4c-ea40-443b-4a3c-08db98deaa96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5989



> On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrot=
e:
>=20
> Add a declaration for the variable 'init_ttbr' to resolve
> the violation of Rule 8.4 present in the associated source file 'mm.c'.
>=20
> No functional changes.
>=20
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

With:

Fixes: 4557c2292854 ("xen: arm: rewrite start of day page table and cpu bri=
ng up")

If maintainers are ok

> xen/arch/arm/include/asm/mm.h | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.=
h
> index 5b530f0f40..698e54aff0 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -165,6 +165,9 @@ struct page_info
> #define _PGC_need_scrub   _PGC_allocated
> #define PGC_need_scrub    PGC_allocated
>=20
> +/* Non-boot CPUs use this to find the correct pagetables. */
> +extern uint64_t init_ttbr;
> +
> extern mfn_t directmap_mfn_start, directmap_mfn_end;
> extern vaddr_t directmap_virt_end;
> #ifdef CONFIG_ARM_64
> --=20
> 2.34.1
>=20
>=20


