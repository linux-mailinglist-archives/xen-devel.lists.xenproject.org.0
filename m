Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061284BFD35
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277043.473483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXFk-0007Kd-Sl; Tue, 22 Feb 2022 15:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277043.473483; Tue, 22 Feb 2022 15:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXFk-0007HO-Oi; Tue, 22 Feb 2022 15:39:00 +0000
Received: by outflank-mailman (input) for mailman id 277043;
 Tue, 22 Feb 2022 15:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+sy=TF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nMXFj-0007HH-I2
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:38:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d16333d-93f5-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:38:58 +0100 (CET)
Received: from AS9PR06CA0235.eurprd06.prod.outlook.com (2603:10a6:20b:45e::34)
 by AS8PR08MB6518.eurprd08.prod.outlook.com (2603:10a6:20b:33d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Tue, 22 Feb
 2022 15:38:49 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::54) by AS9PR06CA0235.outlook.office365.com
 (2603:10a6:20b:45e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Tue, 22 Feb 2022 15:38:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 15:38:49 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Tue, 22 Feb 2022 15:38:49 +0000
Received: from 91edb6eec672.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BB290E9-CBAE-4604-8996-015F12530EE6.1; 
 Tue, 22 Feb 2022 15:38:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91edb6eec672.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Feb 2022 15:38:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB4227.eurprd08.prod.outlook.com (2603:10a6:208:13d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 15:38:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 15:38:38 +0000
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
X-Inumbo-ID: 8d16333d-93f5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG5hZwxHduifyNasqAErtaQe++stu5mAH0gYYcFyQ0s=;
 b=accGXiKZHqeQTNDio8pfui21sEvp+xXb8xZ/h3KW0DEmJ6xEasZPjTe7jwZCbn75xgY7Ki2wXB9QplWvv6TGF1veftYhzWdZNwX8oWZtW60r6gKrzWjNQG6pGfHCf5TBi+uxsRvaQgK+B3g7H0tiEfiBwPFA6XBrewAqPo/i+lU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19ace998aa105b60
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSTIMpp42BCzLCOkXQTRtlPaPynV1R1uMR4iSxNyAM4nfoMGceRK1y7gT8LdaGq5L/Ouw0rALYOkUDpzSxFMinGlVhIpWb17Ann2P2SNzfus8+rbHzTevZ9NXjQ7XqT3cWA3OInO8+292ssP6Ue9o47aYnfloga92I+0PWzdcNM5hc+LnPJ26XsJ7FQ15m08GEOk5Is1Ttwcj5H9pAJTSku1e9Fe71rwPQwESwgkh5NeNJQMRxcgse6FMqnM0UTvE/pvbOJkgJYIWR/xxUU0pKW/MqM9G5nw/2qLvWlHNWarx5EhxYsD6rOWlY/+dqVFiikpKqVyw59szzUm2Rk9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG5hZwxHduifyNasqAErtaQe++stu5mAH0gYYcFyQ0s=;
 b=DwlpXCFArkJrIf0OmX2gv/oo5PF7gcH++4m+J5xdVAFXgiienFJsstaW8YyT7sPeGKst7V76KyBUFMYt/zcYNCIXBIWvQzoQkuXq1LMpg79+sqC2e49pGnPyAQRn1aPsDXzXMo1who8LJobd4+3M2h8E0ch7vltRwnZcP/xiuR4uZgQVLQTE/vtT+AooHKAR5tdDyywvfWhr7iG7q71T2dtAJ+f5Tge2Iz2+nPkRqLq9nJi1JCz4Kl0KiuzingibjpnrnAl64HvWV87ZvJwRMRjBXhPh+uhlOo5Bzc3qUYjk/kxfzah7aUivFozhoRESJ+QkUjkz8PDSxATf94J0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG5hZwxHduifyNasqAErtaQe++stu5mAH0gYYcFyQ0s=;
 b=accGXiKZHqeQTNDio8pfui21sEvp+xXb8xZ/h3KW0DEmJ6xEasZPjTe7jwZCbn75xgY7Ki2wXB9QplWvv6TGF1veftYhzWdZNwX8oWZtW60r6gKrzWjNQG6pGfHCf5TBi+uxsRvaQgK+B3g7H0tiEfiBwPFA6XBrewAqPo/i+lU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 02/19] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
Thread-Topic: [PATCH v3 02/19] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
Thread-Index: AQHYJwzzAwNINZlSVEGzkyGeEn5gtayftmsA
Date: Tue, 22 Feb 2022 15:38:38 +0000
Message-ID: <2DB6D0E3-E220-47C1-BB01-E4679AFA34EC@arm.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-3-julien@xen.org>
In-Reply-To: <20220221102218.33785-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2d94aa4b-cdb7-42f4-22b6-08d9f6196c22
x-ms-traffictypediagnostic:
	AM0PR08MB4227:EE_|AM5EUR03FT003:EE_|AS8PR08MB6518:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6518FC6004D7D2822233FDC69D3B9@AS8PR08MB6518.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DOA2iP8sUc9vaEQaCbBBqh7ctN7Rmz5/xXm3SxtWry31F+SBN7JuenOzIE9ShCv5gi+Fu3Jt7fpt2EquV+1YOP8grRuAbofzji/oeXyvfK0gmss0pCAgGPaWiHU/+h+dFSfGPKFyCjj49ibBGsiUQQ/sGHqyHjUccSNEToX6dzDbuxp34SwpekX7IblSreBBIvJ6+MsH+SvpE6ZIhq6zljGNFj9mYXjvUahI7BBWqTBE8M3IIr0Xy16Bi2GFg1TdUxkf6uQxn1gravxYu9l94/2u/9qnCMyQSpx9iFSFrhtCfnxhtF/v+u6DXEPpalXV8T99DbF9Rw12atbL1hwPNRzMMEuu4aSQBvYvW1IpekmM9tF4kIPbEvLPu1arXYpSkxt4R8EVpz9JCuZVtvnUB46NuYqORrMTgYvkwh9kY8Lub7Zqx3X0Z8G0mVnBTtgLoArKVgTkdnDiYyYnlWMNBVn9QaP4IN440Yp5I+6dqvjp6Q0qOiAKdV7ecXq8nn/fBLl+PSu4dvFdTdjeUipIU6QHM6wz32iZQCye53Bl3W5RB+GV2qjqwROnLnpW5ktE7mIS6AmGWYgBm64nStjqL0QzMnvS7tPDWaP8g2iLpkNEckQAte9RZ0YqvYHAa6xo0RcMjkUFxtaqLDSo0QJ9tQpNoWYQL/QfOJwQGRh/muCvypS90udpT6fEBx0M//M3VIgp0KK1qK15+f8w3fKBTXbmRJBcJj6O2xHNxcY2GSyqGtb+RWdewzdIIrmo9TXyX8K/GrwR8yHqQDKVUSeB1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(53546011)(36756003)(6506007)(508600001)(5660300002)(8936002)(38070700005)(38100700002)(30864003)(2906002)(54906003)(66446008)(66556008)(66476007)(6486002)(4326008)(8676002)(71200400001)(2616005)(64756008)(83380400001)(91956017)(86362001)(122000001)(316002)(6916009)(33656002)(76116006)(26005)(66946007)(186003)(41533002)(45980500001)(579004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B79978626E662C4E8FBE64F3CCC4FCA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4227
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	660cdf9b-d3d0-4823-728f-08d9f61965a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w+ZIlY7oAHBl7UZYNgvM1wjLkzca9/uBGF4+n3BuKDhxacmTkPzihjxhmllADwP17pn3vMKK8hfQJUAcL/thPn3rr4EImWjgWfTAe6cvs9x/pb127aPA2J7TOz4XiB1h1G/xHjbReUPxJuRWo35NeMyHrMUNlfzRv0Jt66C24FfBEeOtVaNvUx/4XSZzTsbRICrwGg23KAi8RHyv1hB7cmoUDcu0J2O9fc+x15Thkal1iW0pp4YRQfAat/Nlu+Nex3qWCdamEbknqYQGg9P5cy/s1nNarEey5Jb8IBvw40H9pLTU0vY1dZM95+AsT8qp5z7J4XzWcnna3VOuZ2kz6QeX/6rjusuj0Ci20wxZ2kZyCILsY0ZFcx7s8Kz5M9mZ9POvt7qECT0+zUUGtCtjmOXD8VPj8a6WdZDX2WfKRp1rKzi4Oy5dlTeVowFoztaGeaRAUgGk0YyTsUM0VnBdpFu7WwsJSdy2CpsGkjUJLBH0685cne5j0ACh9G3aE4mPZiJ4VeVNq3v/q2SDMHT/CHyqaFuJiXofuUDBI/pQHtw9JMy+7XqgGWIfeZr+DfrQxCAtsiBcpIgKidc6fRccjQiMtyEVN04RdZXRVykFHFcxi1p1hpxskOIEaOkeySlbXBZJNfSPu7XpGmwLSj+bHApZglU820stQnTsMefMJR8gnL9RSLbFlkljU22h42j+njglrfA5mgoKMFINQ0MefA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36756003)(30864003)(2906002)(40460700003)(54906003)(83380400001)(53546011)(6506007)(336012)(8936002)(47076005)(36860700001)(5660300002)(70206006)(186003)(70586007)(8676002)(82310400004)(6486002)(107886003)(2616005)(81166007)(4326008)(6862004)(33656002)(356005)(6512007)(508600001)(86362001)(26005)(316002)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:38:49.7802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d94aa4b-cdb7-42f4-22b6-08d9f6196c22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6518

Hi Julien,

> On 21 Feb 2022, at 10:22, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, Xen PT helpers are only working with 4KB page granularity
> and open-code the generic helpers. To allow more flexibility, we can
> re-use the generic helpers and pass Xen's page granularity
> (PAGE_SHIFT).
>=20
> As Xen PT helpers are used in both C and assembly, we need to move
> the generic helpers definition outside of the !__ASSEMBLY__ section.
>=20
> Take the opportunity to prefix LPAE_ENTRIES, LPAE_ENTRIES and
> LPAE_ENTRIES_MASK with XEN_PT_.

The list needs to be fixed to be SHIFT, ENTRIES and ENTRY_MASK.

>=20
> Note the aliases for each level are still kept for the time being so we
> can avoid a massive patch to change all the callers.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With this fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>    Changes in v3:
>      - Prefix the new define with XEN_PT_
>=20
>    Changes in v2:
>        - New patch
> ---
> xen/arch/arm/arm32/head.S       | 14 +++----
> xen/arch/arm/arm64/head.S       | 14 +++----
> xen/arch/arm/include/asm/lpae.h | 73 ++++++++++++++++++---------------
> xen/arch/arm/mm.c               | 33 ++++++++-------
> xen/arch/arm/p2m.c              | 13 +++---
> 5 files changed, 80 insertions(+), 67 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index b5912d381b98..b1d209ea2842 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -375,7 +375,7 @@ ENDPROC(cpu_init)
>  */
> .macro create_table_entry, ptbl, tbl, virt, shift, mmu=3D0
>         lsr   r1, \virt, #\shift
> -        mov_w r2, LPAE_ENTRY_MASK
> +        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
>         and   r1, r1, r2             /* r1 :=3D slot in \tlb */
>         lsl   r1, r1, #3             /* r1 :=3D slot offset in \tlb */
>=20
> @@ -410,7 +410,7 @@ ENDPROC(cpu_init)
>  * and be distinct.
>  */
> .macro create_mapping_entry, ptbl, virt, phys, type=3DPT_MEM_L3, mmu=3D0
> -        mov_w r2, LPAE_ENTRY_MASK
> +        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
>         lsr   r1, \virt, #THIRD_SHIFT
>         and   r1, r1, r2             /* r1 :=3D slot in \tlb */
>         lsl   r1, r1, #3             /* r1 :=3D slot offset in \tlb */
> @@ -465,7 +465,7 @@ create_page_tables:
> 1:      strd  r2, r3, [r4, r1]       /* Map vaddr(start) */
>         add   r2, r2, #PAGE_SIZE     /* Next page */
>         add   r1, r1, #8             /* Next slot */
> -        cmp   r1, #(LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
> +        cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per pa=
ge */
>         blo   1b
>=20
>         /*
> @@ -487,7 +487,7 @@ create_page_tables:
>          * the second level.
>          */
>         lsr   r1, r9, #FIRST_SHIFT
> -        mov_w r0, LPAE_ENTRY_MASK
> +        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
>         and   r1, r1, r0              /* r1 :=3D first slot */
>         cmp   r1, #XEN_FIRST_SLOT
>         beq   1f
> @@ -502,7 +502,7 @@ create_page_tables:
>          * it.
>          */
>         lsr   r1, r9, #SECOND_SHIFT
> -        mov_w r0, LPAE_ENTRY_MASK
> +        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
>         and   r1, r1, r0             /* r1 :=3D second slot */
>         cmp   r1, #XEN_SECOND_SLOT
>         beq   virtphys_clash
> @@ -573,7 +573,7 @@ remove_identity_mapping:
>          * table if the slot is not XEN_FIRST_SLOT.
>          */
>         lsr   r1, r9, #FIRST_SHIFT
> -        mov_w r0, LPAE_ENTRY_MASK
> +        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
>         and   r1, r1, r0              /* r1 :=3D first slot */
>         cmp   r1, #XEN_FIRST_SLOT
>         beq   1f
> @@ -589,7 +589,7 @@ remove_identity_mapping:
>          * table if the slot is not XEN_SECOND_SLOT.
>          */
>         lsr   r1, r9, #SECOND_SHIFT
> -        mov_w r0, LPAE_ENTRY_MASK
> +        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
>         and   r1, r1, r0             /* r1 :=3D second slot */
>         cmp   r1, #XEN_SECOND_SLOT
>         beq   identity_mapping_removed
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 51b00ab0bea6..314b800b3f8e 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -509,7 +509,7 @@ ENDPROC(cpu_init)
>  */
> .macro create_table_entry, ptbl, tbl, virt, shift, tmp1, tmp2, tmp3
>         lsr   \tmp1, \virt, #\shift
> -        and   \tmp1, \tmp1, #LPAE_ENTRY_MASK/* \tmp1 :=3D slot in \tlb *=
/
> +        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 :=3D slot in=
 \tlb */
>=20
>         load_paddr \tmp2, \tbl
>         mov   \tmp3, #PT_PT                 /* \tmp3 :=3D right for linea=
r PT */
> @@ -541,7 +541,7 @@ ENDPROC(cpu_init)
>         and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 :=3D PAGE_ALIGNED(ph=
ys) */
>=20
>         lsr   \tmp1, \virt, #THIRD_SHIFT
> -        and   \tmp1, \tmp1, #LPAE_ENTRY_MASK/* \tmp1 :=3D slot in \tlb *=
/
> +        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 :=3D slot in=
 \tlb */
>=20
>         mov   \tmp2, #\type                 /* \tmp2 :=3D right for secti=
on PT */
>         orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(ph=
ys) */
> @@ -586,7 +586,7 @@ create_page_tables:
> 1:      str   x2, [x4, x1]           /* Map vaddr(start) */
>         add   x2, x2, #PAGE_SIZE     /* Next page */
>         add   x1, x1, #8             /* Next slot */
> -        cmp   x1, #(LPAE_ENTRIES<<3) /* 512 entries per page */
> +        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
>         b.lt  1b
>=20
>         /*
> @@ -621,7 +621,7 @@ create_page_tables:
>          * the second level.
>          */
>         lsr   x0, x19, #FIRST_SHIFT
> -        and   x0, x0, #LPAE_ENTRY_MASK  /* x0 :=3D first slot */
> +        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 :=3D first slot */
>         cmp   x0, #XEN_FIRST_SLOT
>         beq   1f
>         create_table_entry boot_first, boot_second_id, x19, FIRST_SHIFT, =
x0, x1, x2
> @@ -635,7 +635,7 @@ create_page_tables:
>          * it.
>          */
>         lsr   x0, x19, #SECOND_SHIFT
> -        and   x0, x0, #LPAE_ENTRY_MASK  /* x0 :=3D first slot */
> +        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 :=3D first slot */
>         cmp   x0, #XEN_SECOND_SLOT
>         beq   virtphys_clash
>         create_table_entry boot_second, boot_third_id, x19, SECOND_SHIFT,=
 x0, x1, x2
> @@ -715,7 +715,7 @@ remove_identity_mapping:
>          * table if the slot is not XEN_FIRST_SLOT.
>          */
>         lsr   x1, x19, #FIRST_SHIFT
> -        and   x1, x1, #LPAE_ENTRY_MASK  /* x1 :=3D first slot */
> +        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 :=3D first slot */
>         cmp   x1, #XEN_FIRST_SLOT
>         beq   1f
>         /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
> @@ -729,7 +729,7 @@ remove_identity_mapping:
>          * table if the slot is not XEN_SECOND_SLOT.
>          */
>         lsr   x1, x19, #SECOND_SHIFT
> -        and   x1, x1, #LPAE_ENTRY_MASK  /* x1 :=3D first slot */
> +        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 :=3D first slot */
>         cmp   x1, #XEN_SECOND_SLOT
>         beq   identity_mapping_removed
>         /* It is not in slot 1, remove the entry */
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/l=
pae.h
> index 4fb9a40a4ca9..8cf932b5c947 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -159,6 +159,17 @@ static inline bool lpae_is_superpage(lpae_t pte, uns=
igned int level)
> #define lpae_get_mfn(pte)    (_mfn((pte).walk.base))
> #define lpae_set_mfn(pte, mfn)  ((pte).walk.base =3D mfn_x(mfn))
>=20
> +/* Generate an array @var containing the offset for each level from @add=
r */
> +#define DECLARE_OFFSETS(var, addr)          \
> +    const unsigned int var[4] =3D {           \
> +        zeroeth_table_offset(addr),         \
> +        first_table_offset(addr),           \
> +        second_table_offset(addr),          \
> +        third_table_offset(addr)            \
> +    }
> +
> +#endif /* __ASSEMBLY__ */
> +
> /*
>  * AArch64 supports pages with different sizes (4K, 16K, and 64K).
>  * Provide a set of generic helpers that will compute various
> @@ -190,17 +201,6 @@ static inline bool lpae_is_superpage(lpae_t pte, uns=
igned int level)
> #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
>     (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
>=20
> -/* Generate an array @var containing the offset for each level from @add=
r */
> -#define DECLARE_OFFSETS(var, addr)          \
> -    const unsigned int var[4] =3D {           \
> -        zeroeth_table_offset(addr),         \
> -        first_table_offset(addr),           \
> -        second_table_offset(addr),          \
> -        third_table_offset(addr)            \
> -    }
> -
> -#endif /* __ASSEMBLY__ */
> -
> /*
>  * These numbers add up to a 48-bit input address space.
>  *
> @@ -211,26 +211,35 @@ static inline bool lpae_is_superpage(lpae_t pte, un=
signed int level)
>  * therefore 39-bits are sufficient.
>  */
>=20
> -#define LPAE_SHIFT      9
> -#define LPAE_ENTRIES    (_AC(1,U) << LPAE_SHIFT)
> -#define LPAE_ENTRY_MASK (LPAE_ENTRIES - 1)
> -
> -#define THIRD_SHIFT    (PAGE_SHIFT)
> -#define THIRD_ORDER    (THIRD_SHIFT - PAGE_SHIFT)
> -#define THIRD_SIZE     (_AT(paddr_t, 1) << THIRD_SHIFT)
> -#define THIRD_MASK     (~(THIRD_SIZE - 1))
> -#define SECOND_SHIFT   (THIRD_SHIFT + LPAE_SHIFT)
> -#define SECOND_ORDER   (SECOND_SHIFT - PAGE_SHIFT)
> -#define SECOND_SIZE    (_AT(paddr_t, 1) << SECOND_SHIFT)
> -#define SECOND_MASK    (~(SECOND_SIZE - 1))
> -#define FIRST_SHIFT    (SECOND_SHIFT + LPAE_SHIFT)
> -#define FIRST_ORDER    (FIRST_SHIFT - PAGE_SHIFT)
> -#define FIRST_SIZE     (_AT(paddr_t, 1) << FIRST_SHIFT)
> -#define FIRST_MASK     (~(FIRST_SIZE - 1))
> -#define ZEROETH_SHIFT  (FIRST_SHIFT + LPAE_SHIFT)
> -#define ZEROETH_ORDER  (ZEROETH_SHIFT - PAGE_SHIFT)
> -#define ZEROETH_SIZE   (_AT(paddr_t, 1) << ZEROETH_SHIFT)
> -#define ZEROETH_MASK   (~(ZEROETH_SIZE - 1))
> +#define XEN_PT_LPAE_SHIFT         LPAE_SHIFT_GS(PAGE_SHIFT)
> +#define XEN_PT_LPAE_ENTRIES       LPAE_ENTRIES_GS(PAGE_SHIFT)
> +#define XEN_PT_LPAE_ENTRY_MASK    LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
> +
> +#define XEN_PT_LEVEL_SHIFT(lvl)   LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
> +#define XEN_PT_LEVEL_ORDER(lvl)   LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
> +#define XEN_PT_LEVEL_SIZE(lvl)    LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
> +#define XEN_PT_LEVEL_MASK(lvl)    (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
> +
> +/* Convenience aliases */
> +#define THIRD_SHIFT         XEN_PT_LEVEL_SHIFT(3)
> +#define THIRD_ORDER         XEN_PT_LEVEL_ORDER(3)
> +#define THIRD_SIZE          XEN_PT_LEVEL_SIZE(3)
> +#define THIRD_MASK          XEN_PT_LEVEL_MASK(3)
> +
> +#define SECOND_SHIFT        XEN_PT_LEVEL_SHIFT(2)
> +#define SECOND_ORDER        XEN_PT_LEVEL_ORDER(2)
> +#define SECOND_SIZE         XEN_PT_LEVEL_SIZE(2)
> +#define SECOND_MASK         XEN_PT_LEVEL_MASK(2)
> +
> +#define FIRST_SHIFT         XEN_PT_LEVEL_SHIFT(1)
> +#define FIRST_ORDER         XEN_PT_LEVEL_ORDER(1)
> +#define FIRST_SIZE          XEN_PT_LEVEL_SIZE(1)
> +#define FIRST_MASK          XEN_PT_LEVEL_MASK(1)
> +
> +#define ZEROETH_SHIFT       XEN_PT_LEVEL_SHIFT(0)
> +#define ZEROETH_ORDER       XEN_PT_LEVEL_ORDER(0)
> +#define ZEROETH_SIZE        XEN_PT_LEVEL_SIZE(0)
> +#define ZEROETH_MASK        XEN_PT_LEVEL_MASK(0)
>=20
> /* Calculate the offsets into the pagetables for a given VA */
> #define zeroeth_linear_offset(va) ((va) >> ZEROETH_SHIFT)
> @@ -238,7 +247,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsi=
gned int level)
> #define second_linear_offset(va) ((va) >> SECOND_SHIFT)
> #define third_linear_offset(va) ((va) >> THIRD_SHIFT)
>=20
> -#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & LPAE_ENTRY_MASK)
> +#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & XEN_PT_LPAE_ENTRY_=
MASK)
> #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
> #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
> #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b1eae767c27c..515d0906f85b 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -71,10 +71,11 @@ mm_printk(const char *fmt, ...) {}
>  *  in C).
>  */
> #define DEFINE_BOOT_PAGE_TABLE(name)                                     =
     \
> -lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned") name[LPAE_EN=
TRIES]
> +lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")             =
      \
> +    name[XEN_PT_LPAE_ENTRIES]
>=20
> #define DEFINE_PAGE_TABLES(name, nr)                    \
> -lpae_t __aligned(PAGE_SIZE) name[LPAE_ENTRIES * (nr)]
> +lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
>=20
> #define DEFINE_PAGE_TABLE(name) DEFINE_PAGE_TABLES(name, 1)
>=20
> @@ -207,7 +208,7 @@ static void __init __maybe_unused build_assertions(vo=
id)
>     BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
> #endif
>     BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
> -    BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >=3D LPAE_ENTRIES)=
;
> +    BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >=3D XEN_PT_LPAE_E=
NTRIES);
> #ifdef CONFIG_DOMAIN_PAGE
>     BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
> #endif
> @@ -256,7 +257,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>=20
>     for ( level =3D root_level; ; level++ )
>     {
> -        if ( offsets[level] > LPAE_ENTRIES )
> +        if ( offsets[level] > XEN_PT_LPAE_ENTRIES )
>             break;
>=20
>         pte =3D mapping[offsets[level]];
> @@ -395,15 +396,15 @@ static void __init create_mappings(lpae_t *second,
>     ASSERT(!(base_mfn % granularity));
>     ASSERT(!(nr_mfns % granularity));
>=20
> -    count =3D nr_mfns / LPAE_ENTRIES;
> +    count =3D nr_mfns / XEN_PT_LPAE_ENTRIES;
>     p =3D second + second_linear_offset(virt_offset);
>     pte =3D mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
> -    if ( granularity =3D=3D 16 * LPAE_ENTRIES )
> +    if ( granularity =3D=3D 16 * XEN_PT_LPAE_ENTRIES )
>         pte.pt.contig =3D 1;  /* These maps are in 16-entry contiguous ch=
unks. */
>     for ( i =3D 0; i < count; i++ )
>     {
>         write_pte(p + i, pte);
> -        pte.pt.base +=3D 1 << LPAE_SHIFT;
> +        pte.pt.base +=3D 1 << XEN_PT_LPAE_SHIFT;
>     }
>     flush_xen_tlb_local();
> }
> @@ -424,7 +425,7 @@ void *map_domain_page(mfn_t mfn)
> {
>     unsigned long flags;
>     lpae_t *map =3D this_cpu(xen_dommap);
> -    unsigned long slot_mfn =3D mfn_x(mfn) & ~LPAE_ENTRY_MASK;
> +    unsigned long slot_mfn =3D mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
>     vaddr_t va;
>     lpae_t pte;
>     int i, slot;
> @@ -435,7 +436,7 @@ void *map_domain_page(mfn_t mfn)
>      * entry is a 2MB superpage pte.  We use the available bits of each
>      * PTE as a reference count; when the refcount is zero the slot can
>      * be reused. */
> -    for ( slot =3D (slot_mfn >> LPAE_SHIFT) % DOMHEAP_ENTRIES, i =3D 0;
> +    for ( slot =3D (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i =
=3D 0;
>           i < DOMHEAP_ENTRIES;
>           slot =3D (slot + 1) % DOMHEAP_ENTRIES, i++ )
>     {
> @@ -477,7 +478,7 @@ void *map_domain_page(mfn_t mfn)
>=20
>     va =3D (DOMHEAP_VIRT_START
>           + (slot << SECOND_SHIFT)
> -          + ((mfn_x(mfn) & LPAE_ENTRY_MASK) << THIRD_SHIFT));
> +          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
>=20
>     /*
>      * We may not have flushed this specific subpage at map time,
> @@ -513,7 +514,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>     unsigned long va =3D (unsigned long)ptr;
>     lpae_t *map =3D this_cpu(xen_dommap);
>     int slot =3D (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
> -    unsigned long offset =3D (va>>THIRD_SHIFT) & LPAE_ENTRY_MASK;
> +    unsigned long offset =3D (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
>=20
>     if ( va >=3D VMAP_VIRT_START && va < VMAP_VIRT_END )
>         return virt_to_mfn(va);
> @@ -654,7 +655,8 @@ void __init setup_pagetables(unsigned long boot_phys_=
offset)
>     /* Initialise first level entries, to point to second level entries *=
/
>     for ( i =3D 0; i < 2; i++)
>     {
> -        p[i] =3D pte_of_xenaddr((uintptr_t)(xen_second+i*LPAE_ENTRIES));
> +        p[i] =3D pte_of_xenaddr((uintptr_t)(xen_second +
> +                                          i * XEN_PT_LPAE_ENTRIES));
>         p[i].pt.table =3D 1;
>         p[i].pt.xn =3D 0;
>     }
> @@ -663,13 +665,14 @@ void __init setup_pagetables(unsigned long boot_phy=
s_offset)
>     for ( i =3D 0; i < DOMHEAP_SECOND_PAGES; i++ )
>     {
>         p[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)]
> -            =3D pte_of_xenaddr((uintptr_t)(cpu0_dommap+i*LPAE_ENTRIES));
> +            =3D pte_of_xenaddr((uintptr_t)(cpu0_dommap +
> +                                         i * XEN_PT_LPAE_ENTRIES));
>         p[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)].pt.table =
=3D 1;
>     }
> #endif
>=20
>     /* Break up the Xen mapping into 4k pages and protect them separately=
. */
> -    for ( i =3D 0; i < LPAE_ENTRIES; i++ )
> +    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )
>     {
>         vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
>=20
> @@ -768,7 +771,7 @@ int init_secondary_pagetables(int cpu)
>      * domheap mapping pages. */
>     for ( i =3D 0; i < DOMHEAP_SECOND_PAGES; i++ )
>     {
> -        pte =3D mfn_to_xen_entry(virt_to_mfn(domheap+i*LPAE_ENTRIES),
> +        pte =3D mfn_to_xen_entry(virt_to_mfn(domheap + i * XEN_PT_LPAE_E=
NTRIES),
>                                MT_NORMAL);
>         pte.pt.table =3D 1;
>         write_pte(&first[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SI=
ZE)], pte);
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 02cf852d4cf1..493a1e25879a 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -233,7 +233,8 @@ static lpae_t *p2m_get_root_pointer(struct p2m_domain=
 *p2m,
>      * we can't use (P2M_ROOT_LEVEL - 1) because the root level might be
>      * 0. Yet we still want to check if all the unused bits are zeroed.
>      */
> -    root_table =3D gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] + LPAE_SH=
IFT);
> +    root_table =3D gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] +
> +                                XEN_PT_LPAE_SHIFT);
>     if ( root_table >=3D P2M_ROOT_PAGES )
>         return NULL;
>=20
> @@ -773,7 +774,7 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>     }
>=20
>     table =3D map_domain_page(lpae_get_mfn(entry));
> -    for ( i =3D 0; i < LPAE_ENTRIES; i++ )
> +    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )
>         p2m_free_entry(p2m, *(table + i), level + 1);
>=20
>     unmap_domain_page(table);
> @@ -827,7 +828,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2=
m, lpae_t *entry,
>      * We are either splitting a first level 1G page into 512 second leve=
l
>      * 2M pages, or a second level 2M page into 512 third level 4K pages.
>      */
> -    for ( i =3D 0; i < LPAE_ENTRIES; i++ )
> +    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )
>     {
>         lpae_t *new_entry =3D table + i;
>=20
> @@ -850,7 +851,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2=
m, lpae_t *entry,
>     /* Update stats */
>     p2m->stats.shattered[level]++;
>     p2m->stats.mappings[level]--;
> -    p2m->stats.mappings[next_level] +=3D LPAE_ENTRIES;
> +    p2m->stats.mappings[next_level] +=3D XEN_PT_LPAE_ENTRIES;
>=20
>     /*
>      * Shatter superpage in the page to the level we want to make the
> @@ -888,7 +889,7 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>                            p2m_access_t a)
> {
>     unsigned int level =3D 0;
> -    unsigned int target =3D 3 - (page_order / LPAE_SHIFT);
> +    unsigned int target =3D 3 - (page_order / XEN_PT_LPAE_SHIFT);
>     lpae_t *entry, *table, orig_pte;
>     int rc;
>     /* A mapping is removed if the MFN is invalid. */
> @@ -1142,7 +1143,7 @@ static void p2m_invalidate_table(struct p2m_domain =
*p2m, mfn_t mfn)
>=20
>     table =3D map_domain_page(mfn);
>=20
> -    for ( i =3D 0; i < LPAE_ENTRIES; i++ )
> +    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )
>     {
>         lpae_t pte =3D table[i];
>=20
> --=20
> 2.32.0
>=20


