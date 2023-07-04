Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724EA747492
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558470.872596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhQv-00040P-Uo; Tue, 04 Jul 2023 14:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558470.872596; Tue, 04 Jul 2023 14:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhQv-0003xt-S2; Tue, 04 Jul 2023 14:55:13 +0000
Received: by outflank-mailman (input) for mailman id 558470;
 Tue, 04 Jul 2023 14:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGhQu-0003xn-3E
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:55:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65b6626-1a7a-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:55:11 +0200 (CEST)
Received: from AM6P193CA0122.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::27)
 by AS8PR08MB8609.eurprd08.prod.outlook.com (2603:10a6:20b:565::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:55:06 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::d5) by AM6P193CA0122.outlook.office365.com
 (2603:10a6:209:85::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 14:55:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Tue, 4 Jul 2023 14:55:05 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Tue, 04 Jul 2023 14:55:05 +0000
Received: from c0b47bfc8967.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8AC3ED19-EBC6-420F-B2D8-DE639A925F2F.1; 
 Tue, 04 Jul 2023 14:54:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0b47bfc8967.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:54:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8452.eurprd08.prod.outlook.com (2603:10a6:150:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:54:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:54:57 +0000
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
X-Inumbo-ID: c65b6626-1a7a-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHPLYVWf3D08zYkdIrDgBPEq07v8K351XpAC2djDhZI=;
 b=W5u+z2opk/RYO7357EUKwfyTA4TZ2aw0optdcLgbaWarInYm+ZPEfboQfPHeuG0j16v98rn7Sl7uVtpWefDgOrQgG9pEkFsyZGzMX4Iw3b+3Dg+vSTPhjzdzRGvRzYJ5EZqa95iKSfisWgIwlN/XJjwo4+ujopcLvuuHbVZ2tL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49c299a67b90dc96
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsdgMlRJ1B6LEewGfqLgbjXo9jwEEstaDw7DM+T9IrSo8YANPL6DaMp1ILLnmRrsDNaKhpqsK76Dv/eCdxtlaKBal5iFn7u6WeH9An5xNrcPKD51m7ShdF8OdkQ3eJ4IVJHmWDz/9RDVm8X/F/4riHoan4f9989vzSS4a9/4hm4eI9Nai6EGcBi+m7OKpYodjaXEdm4G3S+YXvAmBQZYPO3XA4kab0N9VynZd8id+G4hcNzLIlhcO73xQh/WoEn7Gca3i9s5p2re13SgGIjx6i87J94ehVK7FsAtW40LyAeRKupJ5aEDtC8vQxOE7sxQLFlIk7I6MMthku7brblU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHPLYVWf3D08zYkdIrDgBPEq07v8K351XpAC2djDhZI=;
 b=LhC+7YqZ4hBUZ3+cNI6BjaBEpigVbX8FPjup+MBy2H7BsCXmw0gaAEYzbAbnkPSXrOBPjk8bJhrdNMs7e9c1x+Bvs+u95xkg4wIdgkj1AzGOGacwiycpHkGuXQZikFqTonwC85NCBPSDFTrLiSnqBWXxg9nwz/M0Zgd22FZ+FrWnPSm/frZoLNreVrvbGYlCQgz7P8ja5I54EfjCzXljrglfd1sfFdYocZmoPIj9Nvk5XdUXnExKPnH2SCHltwJ4L8tSOLIn7JyRgZ31YZhWfhxVIFjvYU68YmXfY8jwazf2vM3HmB6VpxjDo8kpuFeQtUWbKXB/g16vZEqrs5GrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHPLYVWf3D08zYkdIrDgBPEq07v8K351XpAC2djDhZI=;
 b=W5u+z2opk/RYO7357EUKwfyTA4TZ2aw0optdcLgbaWarInYm+ZPEfboQfPHeuG0j16v98rn7Sl7uVtpWefDgOrQgG9pEkFsyZGzMX4Iw3b+3Dg+vSTPhjzdzRGvRzYJ5EZqa95iKSfisWgIwlN/XJjwo4+ujopcLvuuHbVZ2tL8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 6/7] xen/arm: mm: Add missing ISB in xen_pt_update()
Thread-Topic: [PATCH 6/7] xen/arm: mm: Add missing ISB in xen_pt_update()
Thread-Index: AQHZos+28SuZIXCU302ZL5lufQv4QK+pyVIA
Date: Tue, 4 Jul 2023 14:54:56 +0000
Message-ID: <3BF9CBE5-8EA6-42C4-AE7D-147AB94F3E58@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-7-julien@xen.org>
In-Reply-To: <20230619170115.81398-7-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8452:EE_|AM7EUR03FT004:EE_|AS8PR08MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c9ab90-7e79-4249-ab22-08db7c9ea773
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jhn24/rLu4V3rEulqJYn+yXLpqUVb7NeblU7EN23Ms89QQv2M6DJHOOlAiSE98Y6gzlQDAmfguHSRK4j/FCcaRHdT0ZGGEAGyDPTf6gJ6vOFHZhJjsBSH3H5NeG+ivZRZz6Roj/Cf46Sk+FyhYIufmoNVaET5ZB67qv9dcQk8xM5c2z6KHip8zN9eBI0vRzlIRfQrQsTJALF1N8kelYb0bdwsgSfJSge51KLoBB40+40P/zmfM5pDCI7KQjcC+9j0WnZY+F/jL7JakpaLawqVyu2pAxE8BnqS2LZiS6cSYptXii0K5puiGTMwLVh43yo91BKZyQ1fo9JWzfXBBzRmAZPgO+sLnqtYaktJBBQN8i7S1Ewhp0qd4L9Bm0ZtBt2XufVbsTRJ1Ii+rz3uXU7pdkTqZe/Q+hG6zzPP1+s9aTeQmJbfL3b9MVw842zK8LCELNbkEq+0/Nw/Y6CGTcM//yWiVR/fqd4h9N9mVuXAEby9iYghLK1xWZ1kVMTpL6vZV72Yi5k2DgB60/ROyEE+MhBMIPHsG/dq+YOwDV81mMsYMUNubeyeiX2WV6IJOe/kXRv9IdqHM7qfHdP304P3Sbbz2Q4jtuPqwLMoLjp2fdG+dlgr40srjvGligN7yO9opG9mt+X8tPrpza/kZNmWA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(4326008)(316002)(66946007)(64756008)(66556008)(86362001)(91956017)(186003)(6916009)(76116006)(66446008)(6512007)(66476007)(6506007)(53546011)(83380400001)(122000001)(2616005)(2906002)(6486002)(38100700002)(33656002)(71200400001)(5660300002)(478600001)(8676002)(54906003)(38070700005)(8936002)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD246B026BE04C4AAC4B40A239DD1B5C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8452
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40929aa7-05e4-4f4c-ea53-08db7c9ea228
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MZSkjVF4SdQWRnk/lcIPyPa3Q32ieJYSh0oe0LZfeaLw/hlPb7MAS79k6kbpe/sYiY+bhf4cQkorZzoH3EgAmbrUq+qv2ZUjl9o3t+31Pkodz4Nsw12I7WQUqV0lMLPTewNumPfNaTUhTkCShAPfpqTWmPgXXJbmJl8LQf+HmJ7Eq0GgdnYvOflNmw/l2qGHMcPJNbHFIawgG6YpiqvfjFq7AtNdS4caPI06wF4/ST4FW/K6lU1eYj2x+zR960H+u1EFuTpA/JpkovaLHe5j3mD57WaQsvh9hnNr+D3m+ip8Le23PY0K0CJ+3Mj6UYPDfnMniNRDcTR/j+JnI9WTIgaPRJirfBpzg1pgcDX259wzm+754rqHQ+VBLm3XzJns5Q1RSVc1RgxJ3fwsOyu1NUYC6oT/zugG94bnmKoZwg0xKMavw15/UkWsXDZ3JmtWKjIiTkl5DRhzWhn59E47aIWNZDBgKyK/wl/waCKqWhGEh7HQ/gtOs3fD/rGZbPvsfhEDrgOnzCliJi2aZIBjUIfr9zllX0nrqE/UFhsg0mSkh5YQYyad06CSJDN6vrUS89K5ffhHZyonKkIq1e0LGwCmuLtvHcYH4IyNTKwlI4b2Ff2SJUyfPWaRmRrzPqyz3NFsU8QRPV7yfzOYD0WhSln0ptNwl+F7Q+QHm10pvCOGk7SCmZz0aumnB5kIkDY2rA0DXQznhdglBDfGAesWBK1MGn8Mu/3o2W9Sw4zZevU4HXC8g/Z/hOenTWrUTPQ5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(107886003)(316002)(41300700001)(6512007)(6486002)(26005)(53546011)(47076005)(83380400001)(336012)(6506007)(2616005)(186003)(478600001)(40460700003)(82740400003)(54906003)(356005)(81166007)(70206006)(4326008)(40480700001)(70586007)(5660300002)(33656002)(86362001)(82310400005)(36756003)(6862004)(8936002)(2906002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:55:05.8640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c9ab90-7e79-4249-ab22-08db7c9ea773
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8609

Hi Julien,

> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm, (Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> Note that second sentence is not part of the newer Armv8 spec. But the
> interpretation is not much different.
>=20
> The updated entry will not be used until xen_pt_update() completes.
> So rather than adding the ISB after write_pte() in create_xen_table()
> and xen_pt-update_entry(), add it in xen_pt_update().
>=20
> Also document the reasoning of the deferral after each write_pte() calls.
>=20
> Fixes: 07d11f63d03e ("xen/arm: mm: Avoid flushing the TLBs when mapping a=
re inserted")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/mm.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index e460249736c3..84e652799dd2 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -779,6 +779,11 @@ static int create_xen_table(lpae_t *entry)
>     pte =3D mfn_to_xen_entry(mfn, MT_NORMAL);
>     pte.pt.table =3D 1;
>     write_pte(entry, pte);
> +    /*
> +     * No ISB here. It is deferred to xen_pt_update() as the new table
> +     * will not be used for hardware translation table access as part of
> +     * the mapping update.
> +     */
>=20
>     return 0;
> }
> @@ -1017,6 +1022,10 @@ static int xen_pt_update_entry(mfn_t root, unsigne=
d long virt,
>     }
>=20
>     write_pte(entry, pte);
> +    /*
> +     * No ISB or TLB flush here. They are deferred to xen_pt_update()
> +     * as the entry will not be used as part of the mapping update.
> +     */
>=20
>     rc =3D 0;
>=20
> @@ -1196,6 +1205,9 @@ static int xen_pt_update(unsigned long virt,
>     /*
>      * The TLBs flush can be safely skipped when a mapping is inserted
>      * as we don't allow mapping replacement (see xen_pt_check_entry()).
> +     * Although we still need an ISB to ensure any DSB in
> +     * write_pte() will complete because the mapping may be used soon
> +     * after.
>      *
>      * For all the other cases, the TLBs will be flushed unconditionally
>      * even if the mapping has failed. This is because we may have
> @@ -1204,6 +1216,8 @@ static int xen_pt_update(unsigned long virt,
>      */
>     if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
>         flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> +    else
> +        isb();
>=20
>     spin_unlock(&xen_pt_lock);
>=20
> --=20
> 2.40.1
>=20


