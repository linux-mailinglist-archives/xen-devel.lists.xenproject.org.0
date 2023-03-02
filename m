Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59506A85A2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505206.777836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlEF-0001zv-Dz; Thu, 02 Mar 2023 15:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505206.777836; Thu, 02 Mar 2023 15:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlEF-0001x4-AN; Thu, 02 Mar 2023 15:52:23 +0000
Received: by outflank-mailman (input) for mailman id 505206;
 Thu, 02 Mar 2023 15:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfVa=62=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pXlED-0001wy-N2
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:52:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c818f6-b912-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:52:18 +0100 (CET)
Received: from DB3PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:8::23) by
 AS8PR08MB9340.eurprd08.prod.outlook.com (2603:10a6:20b:5a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 15:52:11 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::1) by DB3PR08CA0010.outlook.office365.com
 (2603:10a6:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 15:52:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.20 via Frontend Transport; Thu, 2 Mar 2023 15:52:11 +0000
Received: ("Tessian outbound 0df938784972:v135");
 Thu, 02 Mar 2023 15:52:11 +0000
Received: from d1892ff6d114.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FFD392D9-E0FF-43C0-B318-F260B29D85B1.1; 
 Thu, 02 Mar 2023 15:52:00 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1892ff6d114.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Mar 2023 15:52:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB9275.eurprd08.prod.outlook.com (2603:10a6:10:41b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 15:51:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 15:51:58 +0000
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
X-Inumbo-ID: 35c818f6-b912-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Czf39zrHaWnaBfN3qeRgPUJb9qSQrGI7BeXfUrcWpHQ=;
 b=renEI1hUUPzONAEDrxQLRq8n8w+hH8Z0mlG53mufMcScr5g2G3zAWgSxUeSLjrFS3EzBtCBv3pkXcH0g47M6WYqF6Fgf3GSO2ma3PnOaBCJjyHY70m/Omt5sbiubMGLsl3LQ4DFdi5eughA54G7R6dUxp9I1u99xep5FkN8SlTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1153d063e4ee4395
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt3JkC96T97GAbMIIDIiBmv9ef4D0hJMgOq7jJvMfZ/evcyanQGNrAG4utdLZ78qLfhhT08npxipvJ/zVBaFnF3Hg3iWGI7pgLjNODsBQ5JZhguHUarhdPKhjoOGokTcx5cslgSSjc0aB7Z5D2/Ell+7nLMj+p1+Sl9G0tEhOY71TwjlmpbzhyTTjvWU2TcLMguW3OmqrUaKejtK8ZNpBGFrUwyAMo7WRV1DdwkVwV7Fg/bNReWqxJ987p+csqjbJvZfQGEMIvZezH1qVh3i2zhEwvXHIyDPx2XrZ/RdMgU8xIqiNwYzUP/0xBIJ2Eg9AZI00bkiLRttY7LERX2UsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Czf39zrHaWnaBfN3qeRgPUJb9qSQrGI7BeXfUrcWpHQ=;
 b=RtqMzTw3AzxydifL8yDOce0LGUnTRdx78rlsGynsKAKpUwUlHy0m8rzgqfb7S30O7andn48iMW7VmoWHgKKyT/1LGKud+PL8AAeq/KhKZMx4qI95i0VJbroAlmqPDsBYI6kFsLq7Q3Kt56NXT+j++vgxVXVOxYgjTrPBOktQIwNBLR40eCBkGyLoRlgpTjGGzDeUpoD2g76le7OM2mLFk4G2Neius8qA2BCswvMD1BsT2CG+dIriAEUeiPKc5ih5x/RiWtqX+dmvs0VUh0vM0oH9zhCCNZvqfeyhH2aNqZTMB0raE86qhUQToHF271zuFyvXg2wrj2Dfy+IacCgX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Czf39zrHaWnaBfN3qeRgPUJb9qSQrGI7BeXfUrcWpHQ=;
 b=renEI1hUUPzONAEDrxQLRq8n8w+hH8Z0mlG53mufMcScr5g2G3zAWgSxUeSLjrFS3EzBtCBv3pkXcH0g47M6WYqF6Fgf3GSO2ma3PnOaBCJjyHY70m/Omt5sbiubMGLsl3LQ4DFdi5eughA54G7R6dUxp9I1u99xep5FkN8SlTQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v6 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH v6 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZTRegmVYOCBfckkKt3RhJZjw+I67no5qA
Date: Thu, 2 Mar 2023 15:51:58 +0000
Message-ID: <66AB8789-4F4F-474A-A05D-4850023488E5@arm.com>
References: <20230302145916.44035-1-julien@xen.org>
 <20230302145916.44035-2-julien@xen.org>
In-Reply-To: <20230302145916.44035-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB9275:EE_|DBAEUR03FT015:EE_|AS8PR08MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de035be-47ac-4d7d-ab80-08db1b36160a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qCvRM4p2A6QU66OHLqPs6Dk+/hyNcuOsprOZp3pORUNmy0xtR5GhHd5djl85qgMQcQxHwx1urYVrxW5IDwAsW8kCUxDyuz2h2a6I1Kgf2UW+h8nOa/SoW7BUjjhEGSa1IrGrkrrLWVPFGQOzVn3alxWyZiiWSNY/CrPlW4BFLB0nqJBzx3YGxRmXiXuTsrXMiejAtN1wdIW/lKbDs/joWrSb9vip/wko6dqUwa70XU5QfwJoANRLwTp4kd1cZIzoKaR+WGWiHCda1Qws1CCYRUZVGT9Jnruy3jGQgKrriTKA9qORRDBu3KQlf+V57wBc9jpK/27AQBY2mAWu6o+CR1W4KGNeWg4wU3vDwARJZClQOU0kX1fv+ukKIhBnI2g2hxVJBcy3uw2k0uskzrFVdNSP2668zL3PEPu6sPn6RET5nuNSB7VpLBoGOf+148kpHxdM8hgaR7rO9vHyBQ7kEwA3oIs3fklu64JoTZxFVQcSqymRXfAa+2qUK7+gblmqmzQH1aL6c+RKwpu/Z8dhDvqx9Dj3IcdjyQcCACbZF6b73o+oMJ7PigJDY0qhTtKYBjNDTS5BcdBkWoJ+UVlM5nm/0+wGFQXJZThJaJO0j/5NX4TKr6VsroQwDNdT5wnxtGkzIORdN60/JRpjVE93UuwaXmQDS6m9KoyN4fKLI6vCVKuGpdCkavqJSgGwMLb0yk7V+92h+ixOGXZiEhLUOVNXy4L2tX/6d5X+ApNPmKU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199018)(83380400001)(122000001)(36756003)(38100700002)(478600001)(8936002)(5660300002)(66946007)(86362001)(38070700005)(33656002)(71200400001)(26005)(186003)(2616005)(6512007)(53546011)(6506007)(6486002)(66446008)(66556008)(66476007)(2906002)(64756008)(8676002)(76116006)(6916009)(41300700001)(316002)(4326008)(91956017)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <041128C9236DFD45A048921A216974C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9275
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe81a816-7da2-4c50-84bb-08db1b360e2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	472Td7okK1NXGt2qAf2Z+g3IcFrfkRoPGnE89r4h1V21gh4457614o4LWGynyJK0mezaLDft/Y8nvJBNttQLWpPFNyz4n4B65ZiLketRV0mUPuGLvhaERUr07G7ydyiQMrVQcCLhRZ+86AJv0fwL/solYNoIvGqXzWnBQsAOzGhD6MH3KSBQQ6nHsUW+XZlXPY+LUg2fL+Ac8/u6lwknG+aMjqJgR35GS5PcMwgUhaoiTgF3SuS1q+8K86ZVfn/2Ylsk8/CltoVauucACwxYp9iGQlFnxPqTs6xzJEZ5gDWrDFFE1tpyi2x+oMyJDcIXGO3fFqcKknd0z9ddkL3vJXp3CqXNVzVHstbNwIrt9Oi8pGVvywydRPsKq/DCUy3HCgbBivLMC1tLMOo3N1NW6qUIn7iHSMAuUN3DA/ShbYrUgETzed1gIa5v/YkQSDAFDLLA/V0VJGEmmiS0SJXnMa06KlpJdMrdW435QlShCnuxgDuUNrEznaMBFJmWURgTZk25lfKNDWz7oqV++k0FDwaQ54sSnXyTB8Lh3eiEQFqvB8bQwH1+jPdWhXHCNxXHygr4NZ0ym1sQm2czD0Tu0uPXl3ScT9T0TWHiXh9AAzQfBndC1YdcH7gqOSNh0fIlCX/CIqaUdpGvN1IUtAjnj1bG8LRSciP3d9yCycVoHOMxpoP3AE8fp9LKtlh4Qx4JTfA7a4UtVXH3Ubm/M+MWfQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(36756003)(33656002)(53546011)(6486002)(6512007)(6506007)(2616005)(26005)(186003)(336012)(316002)(41300700001)(54906003)(4326008)(70206006)(2906002)(8676002)(70586007)(8936002)(478600001)(5660300002)(82740400003)(81166007)(6862004)(86362001)(40480700001)(82310400005)(356005)(36860700001)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:52:11.4882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de035be-47ac-4d7d-ab80-08db1b36160a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9340

Hi Julien,

> On 2 Mar 2023, at 15:59, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the temporary mapping is only used when the virtual
> runtime region of Xen is clashing with the physical region.
>=20
> In follow-up patches, we will rework how secondary CPU bring-up works
> and it will be convenient to use the fixmap area for accessing
> the root page-table (it is per-cpu).
>=20
> Rework the code to use temporary mapping when the Xen physical address
> is not overlapping with the temporary mapping.
>=20
> This also has the advantage to simplify the logic to identity map
> Xen.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ----
>=20
> Even if this patch is rewriting part of the previous patch, I decided
> to keep them separated to help the review.
>=20
> The "follow-up patches" are still in draft at the moment. I still haven't
> find a way to split them nicely and not require too much more work
> in the coloring side.
>=20
> I have provided some medium-term goal in the cover letter.
>=20
>    Changes in v6:
>        - Add Henry's reviewed-by and tested-by tag
>        - Add Michal's reviewed-by
>        - Add newline in remove_identity_mapping for clarity
>=20
>    Changes in v5:
>        - Fix typo in a comment
>        - No need to link boot_{second, third}_id again if we need to
>          create a temporary area.
>=20
>    Changes in v3:
>        - Resolve conflicts after switching from "ldr rX, <label>" to
>          "mov_w rX, <label>" in a previous patch
>=20
>    Changes in v2:
>        - Patch added
> ---
> xen/arch/arm/arm32/head.S | 86 ++++++++-------------------------------
> 1 file changed, 16 insertions(+), 70 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index df51550baa8a..9befffd85079 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -459,7 +459,6 @@ ENDPROC(cpu_init)
> create_page_tables:
>         /* Prepare the page-tables for mapping Xen */
>         mov_w r0, XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, 1
>         create_table_entry boot_second, boot_third, r0, 2
>=20
>         /* Setup boot_third: */
> @@ -479,70 +478,37 @@ create_page_tables:
>         cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per pag=
e */
>         blo   1b
>=20
> -        /*
> -         * If Xen is loaded at exactly XEN_VIRT_START then we don't
> -         * need an additional 1:1 mapping, the virtual mapping will
> -         * suffice.
> -         */
> -        cmp   r9, #XEN_VIRT_START
> -        moveq pc, lr
> -
>         /*
>          * Setup the 1:1 mapping so we can turn the MMU on. Note that
>          * only the first page of Xen will be part of the 1:1 mapping.
> -         *
> -         * In all the cases, we will link boot_third_id. So create the
> -         * mapping in advance.
>          */
> +        create_table_entry boot_pgtable, boot_second_id, r9, 1
> +        create_table_entry boot_second_id, boot_third_id, r9, 2
>         create_mapping_entry boot_third_id, r9, r9
>=20
>         /*
> -         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
> -         * then the 1:1 mapping will use its own set of page-tables from
> -         * the second level.
> +         * Find the first slot used. If the slot is not the same
> +         * as TEMPORARY_AREA_FIRST_SLOT, then we will want to switch
> +         * to the temporary mapping before jumping to the runtime
> +         * virtual mapping.
>          */
>         get_table_slot r1, r9, 1     /* r1 :=3D first slot */
> -        cmp   r1, #XEN_FIRST_SLOT
> -        beq   1f
> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
> -        b     link_from_second_id
> -
> -1:
> -        /*
> -         * Find the second slot used. If the slot is XEN_SECOND_SLOT, th=
en the
> -         * 1:1 mapping will use its own set of page-tables from the
> -         * third level.
> -         */
> -        get_table_slot r1, r9, 2     /* r1 :=3D second slot */
> -        cmp   r1, #XEN_SECOND_SLOT
> -        beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, r9, 2
> -        b     link_from_third_id
> +        cmp   r1, #TEMPORARY_AREA_FIRST_SLOT
> +        bne   use_temporary_mapping
>=20
> -link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, r9, 2
> -link_from_third_id:
> -        /* Good news, we are not clashing with Xen virtual mapping */
> +        mov_w r0, XEN_VIRT_START
> +        create_table_entry boot_pgtable, boot_second, r0, 1
>         mov   r12, #0                /* r12 :=3D temporary mapping not cr=
eated */
>         mov   pc, lr
>=20
> -virtphys_clash:
> +use_temporary_mapping:
>         /*
> -         * The identity map clashes with boot_third. Link boot_first_id =
and
> -         * map Xen to a temporary mapping. See switch_to_runtime_mapping
> -         * for more details.
> +         * The identity mapping is not using the first slot
> +         * TEMPORARY_AREA_FIRST_SLOT. Create a temporary mapping.
> +         * See switch_to_runtime_mapping for more details.
>          */
> -        PRINT("- Virt and Phys addresses clash  -\r\n")
>         PRINT("- Create temporary mapping -\r\n")
>=20
> -        /*
> -         * This will override the link to boot_second in XEN_FIRST_SLOT.
> -         * The page-tables are not live yet. So no need to use
> -         * break-before-make.
> -         */
> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
> -        create_table_entry boot_second_id, boot_third_id, r9, 2
> -
>         /* Map boot_second (cover Xen mappings) to the temporary 1st slot=
 */
>         mov_w r0, TEMPORARY_XEN_VIRT_START
>         create_table_entry boot_pgtable, boot_second, r0, 1
> @@ -675,33 +641,13 @@ remove_identity_mapping:
>         /* r2:r3 :=3D invalid page-table entry */
>         mov   r2, #0x0
>         mov   r3, #0x0
> -        /*
> -         * Find the first slot used. Remove the entry for the first
> -         * table if the slot is not XEN_FIRST_SLOT.
> -         */
> +
> +        /* Find the first slot used and remove it */
>         get_table_slot r1, r9, 1     /* r1 :=3D first slot */
> -        cmp   r1, #XEN_FIRST_SLOT
> -        beq   1f
> -        /* It is not in slot 0, remove the entry */
>         mov_w r0, boot_pgtable       /* r0 :=3D root table */
>         lsl   r1, r1, #3             /* r1 :=3D Slot offset */
>         strd  r2, r3, [r0, r1]
> -        b     identity_mapping_removed
> -
> -1:
> -        /*
> -         * Find the second slot used. Remove the entry for the first
> -         * table if the slot is not XEN_SECOND_SLOT.
> -         */
> -        get_table_slot r1, r9, 2     /* r1 :=3D second slot */
> -        cmp   r1, #XEN_SECOND_SLOT
> -        beq   identity_mapping_removed
> -        /* It is not in slot 1, remove the entry */
> -        mov_w r0, boot_second        /* r0 :=3D second table */
> -        lsl   r1, r1, #3             /* r1 :=3D Slot offset */
> -        strd  r2, r3, [r0, r1]
>=20
> -identity_mapping_removed:
>         flush_xen_tlb_local r0
>         mov   pc, lr
> ENDPROC(remove_identity_mapping)
> --=20
> 2.39.1
>=20
>=20


