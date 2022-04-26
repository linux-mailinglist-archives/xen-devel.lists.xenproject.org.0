Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD150FD61
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313880.531658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njKWL-0001jm-AA; Tue, 26 Apr 2022 12:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313880.531658; Tue, 26 Apr 2022 12:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njKWL-0001gg-6m; Tue, 26 Apr 2022 12:42:21 +0000
Received: by outflank-mailman (input) for mailman id 313880;
 Tue, 26 Apr 2022 12:42:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kigu=VE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1njKWJ-0001ga-Qy
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 12:42:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e4bc882-c55e-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 14:42:17 +0200 (CEST)
Received: from AM6PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:20b:6e::38)
 by AM0PR08MB3793.eurprd08.prod.outlook.com (2603:10a6:208:fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 12:42:15 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::fd) by AM6PR02CA0025.outlook.office365.com
 (2603:10a6:20b:6e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Tue, 26 Apr 2022 12:42:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 12:42:14 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Tue, 26 Apr 2022 12:42:14 +0000
Received: from e55cec08fd35.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BBE8150-544A-4F7F-8436-8981F38CC46D.1; 
 Tue, 26 Apr 2022 12:42:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e55cec08fd35.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 12:42:07 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by DB8PR08MB3930.eurprd08.prod.outlook.com
 (2603:10a6:10:a7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 12:42:06 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 12:42:06 +0000
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
X-Inumbo-ID: 4e4bc882-c55e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyKzq2UAvrhg15ra8M0T/BGn8DgqfBBRNVgrD6r3Vso=;
 b=0rpaxsfxgs2ttgQzPHGK1WS17SrlSoR2M/9ocvNArEVePCd7rTB668o0WxtwiUTnlybs3GsJQetKGk8HbzRHZHpqLBefOVlQwfJhp2uQgW6TXXL+3v9fJPG7QcbIUyaGTlKldTO15QYTIxdTw2bEbo0i4/duIEdbp1nNEbFn+rc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63f394be43e7bd14
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ixc8sclWishHAAEIioee+9Q3p1q9SiWXyv63Yg8xtsioAc0y37BBhoZu66lgyPOkXePWrkT/KI2hPdZLCJzFqazT+4d8SsMyCZHuCnoWRehyUMClxdLFq1Ip24p46yp414ZxJbVnVXcxNUXyRLDFRCEVvcwsLvZ6H8QUoGxvwptX1+Alf9ZfuON1bO2ltJmobsJSIPUy3TF9xKc27FAXFVy9ZUgXhWZLpKOmJ6rlHTN77ATq5P3nQEMYFHRe/IFq2GizyPgErPS38V3MlDUtxfXp7aEkeOlPUb8P7Bh7IZlIicGYGi9GcZCm6iouCUy5b7kOacXMxdlSJC2XFo/Q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyKzq2UAvrhg15ra8M0T/BGn8DgqfBBRNVgrD6r3Vso=;
 b=eauBuKNn/RPhcdm7M7vxoT1XbajmPl2oGyxPwdwt3ENr3srQbK2GpMAsxO9HOynEgv+hgi1JYaBKOad1w+xn2BCHtox7bBmk6mMLDQpsE3ru50WdmhsXHkxmSaHRMAC9h1DjsOvgzYWPc816y4lRJwz3JRMTTuB5ecVn40FMeuSrmvAptT+pdFiyol2hcDBNIDsEcp9EoAs1IQgwYrNY0Li8ouwcEctdiwRcTHcPEpbPopLPLllRx3UDk40yse9rOfeH7hq3lCzEdhHxCIIqbbL/WjLoVhxCnC/nwqHpfb3jOHjj6ZL4XvOEO9Eg9GeXdn+UGaCywcr2UC90tI/c0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyKzq2UAvrhg15ra8M0T/BGn8DgqfBBRNVgrD6r3Vso=;
 b=0rpaxsfxgs2ttgQzPHGK1WS17SrlSoR2M/9ocvNArEVePCd7rTB668o0WxtwiUTnlybs3GsJQetKGk8HbzRHZHpqLBefOVlQwfJhp2uQgW6TXXL+3v9fJPG7QcbIUyaGTlKldTO15QYTIxdTw2bEbo0i4/duIEdbp1nNEbFn+rc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Christoph Hellwig <hch@lst.de>
CC: Stefano Stabellini <sstabellini@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Thread-Topic: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Thread-Index: AQHYVzWiSClsigwCc0OWmoGO41dp7a0CJ6aA
Date: Tue, 26 Apr 2022 12:42:06 +0000
Message-ID: <7124886B-04C8-483E-8062-870D94157DBB@arm.com>
References: <20220423171422.1831676-1-hch@lst.de>
In-Reply-To: <20220423171422.1831676-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cda83697-9ce4-486a-5efc-08da278230fe
x-ms-traffictypediagnostic:
	DB8PR08MB3930:EE_|VE1EUR03FT024:EE_|AM0PR08MB3793:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB379304D46867CCBF6D0D024EFCFB9@AM0PR08MB3793.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ofLPT9J5cyDLt1cL18Ae36BiKjcBJ2ww2cxxovInqRWl7I+JanViCGOWzxjQcXvx7yJwyPMVZSQUe18RZ7mdsD6nBoUlI/Qcr/uG1AWLuhmjuJvy6J8x4NwnMFsSdhdW3gtpQw3ayDevrI/+dqIQT4cFYdcrH2u9pHzg3SEtP1idBv3equJTF1xIVFcuAplIjlsKflaQrkMGiKntpal9d630EZxkbbmxQVRNRqqFJ+zCbmDIP4vjqjOAjIIJ2l2dKZt/MtQl4ZF1Sr2ONqCk+axme82jiI6yuGUnj4g9hbH9ypu8OX7YSXfM6ttpxe4tY0U7uEhbseuHZFBYDE+IEWN6vdzCUryNThypbizhenNVrnZZxQUWX5qy0XH4O7EU1apB8UhXSBblYpQ4DtQ3zqdUIEafl1F2HHF7fBwbb1/vW2L8G69jK3ozWJtgNPIWghSzI9iFj7CSfNK2fJLqd36fXcJZJyVE4UOCRhRFJmGo4WkqoTR8l6amVKOPGQNCxc9MX+hJbuA4tC8JRKfoAysVQlNAJbacs7bZkS4gfHuYK4DmiUh7xLY2zwL3UPpN+v2ZslwbJ9yRiKLcR/PBjj/AvGVQDDZL5GNGg68OsVb7UReIJH4VdkZ3QXd1pT47yWpXYD6C2wGkmVqHrEjQ7bCls74acDdEDBNXxP2YHpzbp7bMszW+S9JXhgIeTG0MShvmUC2QXhO4CnKrVBmkwqBK436iEM1bN6d2pr56UCcJnBJDFqleBwjHkoOFzZFw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66946007)(64756008)(8936002)(8676002)(91956017)(66476007)(66446008)(66556008)(4326008)(33656002)(508600001)(83380400001)(6486002)(6506007)(122000001)(53546011)(86362001)(2906002)(6512007)(2616005)(5660300002)(26005)(38100700002)(54906003)(30864003)(71200400001)(186003)(6916009)(36756003)(316002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1EF09590D70D2343B591E27DD3C8395A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3930
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c177aac-e643-4337-9833-08da27822bd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yt4Tr2YX8iMPYiaG9ataKEefCXxKd1pAMWmFuQZLHABNrWChWU+bDdlc7ScP5DPaZHEoLWSO6i6CucrjfmVclTTfxBevk2GSlZ01uyKaWHG1dgUwll6x6OiPhBl/VI1h7uameeNyHvxyNhZRpZ3mpN8d1bvLkIlQHmCl8n6rZ/0PasrabwCQNhyjXLb3DX1Z9nBYme4oXgsohaQ8Ryr8YyzhgvbVcKzTyrfcYYr2ms1MFgPa2po5GpBLzGalJwIiNpCWhJhp3GCtgjuwL1q9gqfrYj2OIr8mFjO563rmhouN+1feX6GhttyKfzH53cZb0BihZ3aqRzL+AXVk2xI8f3ZhJ720/TUAwpkTwaiq20WyvBAl2bLG4P3Wjz3Uufesz76btFIPADxGV33OslJRCJyenoRBifxY4c9eynQAf1Jljq3whLi9IC5oTkVrBubXO8qmjGVc7U+cpIE8m7PV3pQwyMgGiL+TyDO38CqI3Sa42FiSQ2Rc4mAurPCW9XetabsE5hRaPychm3zUocsnsDTkj0tKrRA6T4DJlb0zS+MMP/uxHDE3hiL/v3LorNOY+evaLDhnRipBKAGYw+3mHfpfKVsCjqu5+5wBIWIOB/eAm3SVuuPtTPegsrtryc5VtHCRCTjdLSWblB8g3A+YK42SRgeNZgJL2DiNhIkfycih7DKqy2WAEtEgITF7jiid
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(81166007)(82310400005)(2906002)(70206006)(70586007)(508600001)(356005)(30864003)(316002)(40460700003)(8676002)(4326008)(47076005)(6862004)(5660300002)(8936002)(6506007)(86362001)(53546011)(36860700001)(6486002)(107886003)(33656002)(6512007)(186003)(26005)(36756003)(83380400001)(336012)(2616005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 12:42:14.6148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cda83697-9ce4-486a-5efc-08da278230fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3793

Hi Christoph,

> On 23 Apr 2022, at 6:14 pm, Christoph Hellwig <hch@lst.de> wrote:
>=20
> swiotlb-xen uses very different ways to allocate coherent memory on x86
> vs arm.  On the former it allocates memory from the page allocator, while
> on the later it reuses the dma-direct allocator the handles the
> complexities of non-coherent DMA on arm platforms.
>=20
> Unfortunately the complexities of trying to deal with the two cases in
> the swiotlb-xen.c code lead to a bug in the handling of
> DMA_ATTR_NO_KERNEL_MAPPING on arm.  With the DMA_ATTR_NO_KERNEL_MAPPING
> flag the coherent memory allocator does not actually allocate coherent
> memory, but just a DMA handle for some memory that is DMA addressable
> by the device, but which does not have to have a kernel mapping.  Thus
> dereferencing the return value will lead to kernel crashed and memory
> corruption.
>=20
> Fix this by using the dma-direct allocator directly for arm, which works
> perfectly fine because on arm swiotlb-xen is only used when the domain is
> 1:1 mapped, and then simplifying the remaining code to only cater for the
> x86 case with DMA coherent device.
>=20
> Reported-by: Rahul Singh <Rahul.Singh@arm.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> arch/arm/include/asm/xen/page-coherent.h   |   2 -
> arch/arm/xen/mm.c                          |  17 ----
> arch/arm64/include/asm/xen/page-coherent.h |   2 -
> arch/x86/include/asm/xen/page-coherent.h   |  24 -----
> arch/x86/include/asm/xen/swiotlb-xen.h     |   5 +
> drivers/xen/swiotlb-xen.c                  | 106 ++++++++-------------
> include/xen/arm/page-coherent.h            |  20 ----
> include/xen/xen-ops.h                      |   7 --
> 8 files changed, 45 insertions(+), 138 deletions(-)
> delete mode 100644 arch/arm/include/asm/xen/page-coherent.h
> delete mode 100644 arch/arm64/include/asm/xen/page-coherent.h
> delete mode 100644 arch/x86/include/asm/xen/page-coherent.h
> delete mode 100644 include/xen/arm/page-coherent.h
>=20
> diff --git a/arch/arm/include/asm/xen/page-coherent.h b/arch/arm/include/=
asm/xen/page-coherent.h
> deleted file mode 100644
> index 27e984977402b..0000000000000
> --- a/arch/arm/include/asm/xen/page-coherent.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <xen/arm/page-coherent.h>
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index a7e54a087b802..6e603e5fdebb1 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -118,23 +118,6 @@ bool xen_arch_need_swiotlb(struct device *dev,
> 		!dev_is_dma_coherent(dev));
> }
>=20
> -int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
> -				 unsigned int address_bits,
> -				 dma_addr_t *dma_handle)
> -{
> -	if (!xen_initial_domain())
> -		return -EINVAL;
> -
> -	/* we assume that dom0 is mapped 1:1 for now */
> -	*dma_handle =3D pstart;
> -	return 0;
> -}
> -
> -void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int orde=
r)
> -{
> -	return;
> -}
> -
> static int __init xen_mm_init(void)
> {
> 	struct gnttab_cache_flush cflush;
> diff --git a/arch/arm64/include/asm/xen/page-coherent.h b/arch/arm64/incl=
ude/asm/xen/page-coherent.h
> deleted file mode 100644
> index 27e984977402b..0000000000000
> --- a/arch/arm64/include/asm/xen/page-coherent.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <xen/arm/page-coherent.h>
> diff --git a/arch/x86/include/asm/xen/page-coherent.h b/arch/x86/include/=
asm/xen/page-coherent.h
> deleted file mode 100644
> index 63cd41b2e17ac..0000000000000
> --- a/arch/x86/include/asm/xen/page-coherent.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_XEN_PAGE_COHERENT_H
> -#define _ASM_X86_XEN_PAGE_COHERENT_H
> -
> -#include <asm/page.h>
> -#include <linux/dma-mapping.h>
> -
> -static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_=
t size,
> -		dma_addr_t *dma_handle, gfp_t flags,
> -		unsigned long attrs)
> -{
> -	void *vstart =3D (void*)__get_free_pages(flags, get_order(size));
> -	*dma_handle =3D virt_to_phys(vstart);
> -	return vstart;
> -}
> -
> -static inline void xen_free_coherent_pages(struct device *hwdev, size_t =
size,
> -		void *cpu_addr, dma_addr_t dma_handle,
> -		unsigned long attrs)
> -{
> -	free_pages((unsigned long) cpu_addr, get_order(size));
> -}
> -
> -#endif /* _ASM_X86_XEN_PAGE_COHERENT_H */
> diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/as=
m/xen/swiotlb-xen.h
> index 66b4ddde77430..558821387808e 100644
> --- a/arch/x86/include/asm/xen/swiotlb-xen.h
> +++ b/arch/x86/include/asm/xen/swiotlb-xen.h
> @@ -10,4 +10,9 @@ extern int pci_xen_swiotlb_init_late(void);
> static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
> #endif
>=20
> +int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
> +				unsigned int address_bits,
> +				dma_addr_t *dma_handle);
> +void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int orde=
r);
> +
> #endif /* _ASM_X86_SWIOTLB_XEN_H */
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 47aebd98f52f5..557edb9c54879 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -36,7 +36,6 @@
> #include <xen/hvc-console.h>
>=20
> #include <asm/dma-mapping.h>
> -#include <asm/xen/page-coherent.h>
>=20
> #include <trace/events/swiotlb.h>
> #define MAX_DMA_BITS 32
> @@ -104,6 +103,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, =
dma_addr_t dma_addr)
> 	return 0;
> }
>=20
> +#ifdef CONFIG_X86
> static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> {
> 	int rc;
> @@ -129,6 +129,12 @@ static int xen_swiotlb_fixup(void *buf, unsigned lon=
g nslabs)
> 	} while (i < nslabs);
> 	return 0;
> }
> +#else
> +static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> +{
> +	return 0;
> +}
> +#endif
>=20
> enum xen_swiotlb_err {
> 	XEN_SWIOTLB_UNKNOWN =3D 0,
> @@ -256,97 +262,60 @@ void __init xen_swiotlb_init_early(void)
> 		panic("Cannot allocate SWIOTLB buffer");
> 	swiotlb_set_max_segment(PAGE_SIZE);
> }
> -#endif /* CONFIG_X86 */
>=20
> static void *
> -xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
> -			   dma_addr_t *dma_handle, gfp_t flags,
> -			   unsigned long attrs)
> +xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
> {
> -	void *ret;
> +	u64 dma_mask =3D dev->coherent_dma_mask;
> 	int order =3D get_order(size);
> -	u64 dma_mask =3D DMA_BIT_MASK(32);
> 	phys_addr_t phys;
> -	dma_addr_t dev_addr;
> -
> -	/*
> -	* Ignore region specifiers - the kernel's ideas of
> -	* pseudo-phys memory layout has nothing to do with the
> -	* machine physical layout.  We can't allocate highmem
> -	* because we can't return a pointer to it.
> -	*/
> -	flags &=3D ~(__GFP_DMA | __GFP_HIGHMEM);
> +	void *ret;
>=20
> -	/* Convert the size to actually allocated. */
> +	/* Align the allocation to the Xen page size */
> 	size =3D 1UL << (order + XEN_PAGE_SHIFT);
>=20
> -	/* On ARM this function returns an ioremap'ped virtual address for
> -	 * which virt_to_phys doesn't return the corresponding physical
> -	 * address. In fact on ARM virt_to_phys only works for kernel direct
> -	 * mapped RAM memory. Also see comment below.
> -	 */
> -	ret =3D xen_alloc_coherent_pages(hwdev, size, dma_handle, flags, attrs)=
;
> -
> +	ret =3D (void *)__get_free_pages(flags, get_order(size));
> 	if (!ret)
> 		return ret;
> -
> -	if (hwdev && hwdev->coherent_dma_mask)
> -		dma_mask =3D hwdev->coherent_dma_mask;
> -
> -	/* At this point dma_handle is the dma address, next we are
> -	 * going to set it to the machine address.
> -	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
> -	 * to *dma_handle. */
> -	phys =3D dma_to_phys(hwdev, *dma_handle);
> -	dev_addr =3D xen_phys_to_dma(hwdev, phys);
> -	if (((dev_addr + size - 1 <=3D dma_mask)) &&
> -	    !range_straddles_page_boundary(phys, size))
> -		*dma_handle =3D dev_addr;
> -	else {
> -		if (xen_create_contiguous_region(phys, order,
> -						 fls64(dma_mask), dma_handle) !=3D 0) {
> -			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
> -			return NULL;
> -		}
> -		*dma_handle =3D phys_to_dma(hwdev, *dma_handle);
> +	phys =3D virt_to_phys(ret);
> +
> +	*dma_handle =3D xen_phys_to_dma(dev, phys);
> +	if (*dma_handle + size - 1 > dma_mask ||
> +	    range_straddles_page_boundary(phys, size)) {
> +		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
> +				dma_handle) !=3D 0)
> +			goto out_free_pages;
> 		SetPageXenRemapped(virt_to_page(ret));
> 	}
> +
> 	memset(ret, 0, size);
> 	return ret;
> +
> +out_free_pages:
> +	free_pages((unsigned long)ret, get_order(size));
> +	return NULL;
> }
>=20
> static void
> -xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr=
,
> -			  dma_addr_t dev_addr, unsigned long attrs)
> +xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
> +		dma_addr_t dma_handle, unsigned long attrs)
> {
> +	phys_addr_t phys =3D virt_to_phys(vaddr);
> 	int order =3D get_order(size);
> -	phys_addr_t phys;
> -	u64 dma_mask =3D DMA_BIT_MASK(32);
> -	struct page *page;
> -
> -	if (hwdev && hwdev->coherent_dma_mask)
> -		dma_mask =3D hwdev->coherent_dma_mask;
> -
> -	/* do not use virt_to_phys because on ARM it doesn't return you the
> -	 * physical address */
> -	phys =3D xen_dma_to_phys(hwdev, dev_addr);
>=20
> 	/* Convert the size to actually allocated. */
> 	size =3D 1UL << (order + XEN_PAGE_SHIFT);
>=20
> -	if (is_vmalloc_addr(vaddr))
> -		page =3D vmalloc_to_page(vaddr);
> -	else
> -		page =3D virt_to_page(vaddr);
> +	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
> +	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size)))
> +	    	return;
>=20
> -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> -		     range_straddles_page_boundary(phys, size)) &&
> -	    TestClearPageXenRemapped(page))
> +	if (TestClearPageXenRemapped(virt_to_page(vaddr)))
> 		xen_destroy_contiguous_region(phys, order);
> -
> -	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
> -				attrs);
> +	free_pages((unsigned long)vaddr, get_order(size));
> }
> +#endif /* CONFIG_X86 */
>=20
> /*
>  * Map a single buffer of the indicated size for DMA in streaming mode.  =
The
> @@ -549,8 +518,13 @@ xen_swiotlb_dma_supported(struct device *hwdev, u64 =
mask)
> }
>=20
> const struct dma_map_ops xen_swiotlb_dma_ops =3D {
> +#ifdef CONFIG_X86
> 	.alloc =3D xen_swiotlb_alloc_coherent,
> 	.free =3D xen_swiotlb_free_coherent,
> +#else
> +	.alloc =3D dma_direct_alloc,
> +	.free =3D dma_direct_free,
> +#endif
> 	.sync_single_for_cpu =3D xen_swiotlb_sync_single_for_cpu,
> 	.sync_single_for_device =3D xen_swiotlb_sync_single_for_device,
> 	.sync_sg_for_cpu =3D xen_swiotlb_sync_sg_for_cpu,
> diff --git a/include/xen/arm/page-coherent.h b/include/xen/arm/page-coher=
ent.h
> deleted file mode 100644
> index b9cc11e887ed5..0000000000000
> --- a/include/xen/arm/page-coherent.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _XEN_ARM_PAGE_COHERENT_H
> -#define _XEN_ARM_PAGE_COHERENT_H
> -
> -#include <linux/dma-mapping.h>
> -#include <asm/page.h>
> -
> -static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_=
t size,
> -		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
> -{
> -	return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
> -}
> -
> -static inline void xen_free_coherent_pages(struct device *hwdev, size_t =
size,
> -		void *cpu_addr, dma_addr_t dma_handle, unsigned long attrs)
> -{
> -	dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
> -}
> -
> -#endif /* _XEN_ARM_PAGE_COHERENT_H */
> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> index a3584a357f353..c7c1b46ff4cd4 100644
> --- a/include/xen/xen-ops.h
> +++ b/include/xen/xen-ops.h
> @@ -42,13 +42,6 @@ int xen_setup_shutdown_event(void);
>=20
> extern unsigned long *xen_contiguous_bitmap;
>=20
> -#if defined(CONFIG_XEN_PV) || defined(CONFIG_ARM) || defined(CONFIG_ARM6=
4)
> -int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
> -				unsigned int address_bits,
> -				dma_addr_t *dma_handle);
> -void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int orde=
r);
> -#endif
> -
> #if defined(CONFIG_XEN_PV)
> int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
> 		  xen_pfn_t *pfn, int nr, int *err_ptr, pgprot_t prot,
> --=20
> 2.30.2
>=20


