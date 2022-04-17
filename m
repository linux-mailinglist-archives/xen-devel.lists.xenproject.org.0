Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1908850476F
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 11:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306557.521698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng1Ql-00079p-6o; Sun, 17 Apr 2022 09:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306557.521698; Sun, 17 Apr 2022 09:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng1Ql-00077E-3l; Sun, 17 Apr 2022 09:42:55 +0000
Received: by outflank-mailman (input) for mailman id 306557;
 Sun, 17 Apr 2022 09:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TbK7=U3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1ng1Qj-000778-7M
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 09:42:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcfdf7ab-be32-11ec-a405-831a346695d4;
 Sun, 17 Apr 2022 11:42:51 +0200 (CEST)
Received: from AS9P194CA0002.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::7)
 by AS8PR08MB6149.eurprd08.prod.outlook.com (2603:10a6:20b:29d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Sun, 17 Apr
 2022 09:42:33 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::d1) by AS9P194CA0002.outlook.office365.com
 (2603:10a6:20b:46d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Sun, 17 Apr 2022 09:42:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Sun, 17 Apr 2022 09:42:32 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Sun, 17 Apr 2022 09:42:32 +0000
Received: from ff2a2baed506.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 068F7784-F0B5-4D3B-86EA-071BF0C1C555.1; 
 Sun, 17 Apr 2022 09:42:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff2a2baed506.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 17 Apr 2022 09:42:21 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by GV1PR08MB7916.eurprd08.prod.outlook.com
 (2603:10a6:150:8c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29; Sun, 17 Apr
 2022 09:42:17 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0%11]) with mapi id 15.20.5164.025; Sun, 17 Apr
 2022 09:42:17 +0000
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
X-Inumbo-ID: bcfdf7ab-be32-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKm1FiP+IHOUtOp2uEAHl66xiZrEvQsYWNPH0+ljHZg=;
 b=LLJ/wR3ckMofRnVbS4zlFWngW80nY5lI8+6m2BJ0NFuq/qHjrL0M3pajXUqdFPRgniOrqOS6ChTCgowF2ghWlxgYPSC3PsvJGcGVGmlt52pzBwDJYZn9iOdv50xLyJ202QlUEXj5Xz8lFhcLT3r/geQRHEinRKEBTld5Z3+L2IQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57077541f65d3535
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbDsUz0hnlrKfNMWejCXcm2AOUjMpPElf3xBLbogyxt3EeHpS6UNPF5+UgMoyVTOtILaa0rWP0D+/kbgDeYpoVclLaIXded7fFJ79VlqWkiV4EfnpDcCbgaFO/Fj4VwcCCFjKdaeJDQAZGUNQrIEfXpSdWHQsO5H/snsG9nluJNrkWgCyCrRgENKirzxee5yCYYeCyBEw/Z2f8VSSJaCOT9Mp1tAcc39/471DqoRhycGkaFAZOtY4LvY96v1YUxKuNMqJw60A5AWnw11SJQzdH3JbgUh8yVKDilowM3BKu64ae3XUYbbZE8txgcoT5SYtwLc7grGzvQE7Bje6UeFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKm1FiP+IHOUtOp2uEAHl66xiZrEvQsYWNPH0+ljHZg=;
 b=mT4dkx6/o+iz5ysTx7cZICqmDdN7hC+tiUPI8/cKBSBiDfnprwcQyFBKHFrhapj9uUgwWNzEg5aNKIMvRoJu9STLj8r3pntjoXzxVLBuu9M0IvgNT43HQwYybG7gDYnPGLLQ9J6vcOrSz2iGZRMvWHMIG+lhJSnIZkkbNqC61r5HBZEHd00eJI0ijf7n5YXsuE52YDynxPqZkBolVXeL5YE/fILIORLeI0TifZGKIY0SQrE2vZz0WAB0h1/gX6+uEUsCO6UPCmDcA4nK7jBJdxGNYEzGin1a7ojB6lmRt7RC8NlQ8nhPg9mcPIC5IM41GfoFqBEfCwT8XNfEWi/TKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKm1FiP+IHOUtOp2uEAHl66xiZrEvQsYWNPH0+ljHZg=;
 b=LLJ/wR3ckMofRnVbS4zlFWngW80nY5lI8+6m2BJ0NFuq/qHjrL0M3pajXUqdFPRgniOrqOS6ChTCgowF2ghWlxgYPSC3PsvJGcGVGmlt52pzBwDJYZn9iOdv50xLyJ202QlUEXj5Xz8lFhcLT3r/geQRHEinRKEBTld5Z3+L2IQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Christoph Hellwig <hch@lst.de>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Thread-Topic: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Thread-Index:
 AQHYTzcUggEUWxM2006iot1qnYxlIKzuW0oAgAFU1ACAADDmgIAApv+AgAC5dQCAAp7ugA==
Date: Sun, 17 Apr 2022 09:42:17 +0000
Message-ID: <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com>
 <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop>
 <8C511888-6183-421E-A4C7-B271DAF46696@arm.com>
 <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
 <20220415063705.GA24262@lst.de>
 <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bf9eeb33-2044-4c0d-4c2f-08da20569890
x-ms-traffictypediagnostic:
	GV1PR08MB7916:EE_|VE1EUR03FT012:EE_|AS8PR08MB6149:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB61490AA38F7AC2AA585FB7B9FCF09@AS8PR08MB6149.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MujaIzEeIDGA35RhYlFuPZyI958+0jjIReIzR9vLTZd79ESPf43wiAAVmipBYZTTIZBUerDgotoJm/1TWoGMEA4aEjj4xfCDsS4sFg6qWLhosuBIO6xPdCM0Aq2zSJWofBMDVoOUWaApnZbJ9UaDRhmswwDFVa+WvPdzQa/Yal7I8RmmGyf3pZgzGva4rh8qarSsoBYWSRYl7pVs/stoJHhd3Vc+Tx6xlGOxnu6GvKPxEWkl4kWBXW0lyk/4LzWkz4syEXsXkCULfqYnPgGqtEqP846y3LaoWZiZ3BcBzCfKxHd4uuF03Xk/BquI9vVoAn6xY5/0MDvWKojCZDUZjQoROIgG7typ9b546CvyHXIAQgl0RQ/X5NvQXml6vV6xx+oNcMbjldgwXzcgg3VRSF0r1PqFUpy4nD9A33HE41AUC5fQSurn0dcNm6CaDa/f2uvE30AHusFJGbthqnyFtuZ4H3hvqdHL/2yD61yT+zZFkl843mRps3iALQBnUXfuR89BPRdeufBI++b/WApMf/ka75d12Kf8waZTrq3W3kHuDLcKL1r5kyHEArIzVWX6cYr6dlNgLbKenpLCuOzNTOojVpMkfycliQMTdo/pAyx+1LmLXTL2l29kaGP7fnTehg4Lv0nkxnQKh+E2FjtutZLSZe6p9e9109No/JrsCE12vFG1q+iSxXMNhLtIw4iZyDZ4D5Us+oNYZn6+8HWOYetZtyEvDjtXlXqUn73Tlw7zxqC9tFdpdPkEUrpuriEj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(6486002)(8936002)(508600001)(66946007)(86362001)(122000001)(66556008)(66476007)(8676002)(76116006)(64756008)(66446008)(4326008)(2616005)(54906003)(6506007)(33656002)(38100700002)(53546011)(6512007)(36756003)(91956017)(316002)(6916009)(38070700005)(83380400001)(2906002)(71200400001)(186003)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08F047B6DEB6864782D7AC6BE7D820EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7916
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c226c0df-73d1-4c31-346b-08da20568f64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L+opb2khXPr4n0FKe5o90AtU1C8gXK2kaWji4Gg6KPQqzwTfhFPb+rJ+Vn3u0UbGok2G7VB1cnmymSNJjpZAVCXZvHnH2ieyC2/hQ3v2YUPPDAEDW80Mg8JnteTs0o7JrnDn6WAL88x2IsMJ20dDk3aCjZqqcWMvzjNtJ5z5Ci4bcG5xN3Ho3DJ59SxgRR9QXmVKE07wgWVh36RNqFSK9tnXQx5PuIyn42Qd1aDUbLudM+L7Um95v3lbXdnuR1iDJsUD7CAcbPR/xJocl+uu83hcAo37AnlGK4BYiojYJh6VeCP1YKWgY3dyceIxI6cSnHMjLrV8pS1mN5lVtoX3m4a96xV1yXQCoUdltr+peNBkGFgrVd568B2asNKiWekGDdPCZPD0URyrIerMGQj8MzaX4XF7tnVIP8Pkwz/c/mYEXTqChfay6T2F9quao2eYHhLTMUfDp4ahs689KRPMSSDTiZ6CiGRq9oeIIIBZFWuGgcEb15z5g5dplxcmeiNy++CCjnyf0qdTf9JM6JNf9C1jy8aqXNeX8f+dXdD02vUjfSZ5y42u7Ei9r3BwwjD0rXIGEWoqovvx6qYwsa06fQuY1trrrYTtcq8NhjbF7rcScfFCuk24cuIEiyjlRFmAS6aTmL2LdYs/nOJErF5O+A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(36756003)(54906003)(81166007)(356005)(8936002)(36860700001)(6506007)(33656002)(70586007)(6862004)(5660300002)(26005)(47076005)(70206006)(4326008)(2616005)(83380400001)(8676002)(6512007)(336012)(53546011)(86362001)(82310400005)(316002)(508600001)(6486002)(2906002)(107886003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2022 09:42:32.3966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9eeb33-2044-4c0d-4c2f-08da20569890
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6149

Hi Stefano,

> On 15 Apr 2022, at 6:40 pm, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Fri, 15 Apr 2022, Christoph Hellwig wrote:
>> On Thu, Apr 14, 2022 at 01:39:23PM -0700, Stefano Stabellini wrote:
>>> OK, now we know that the code path with Xen is correct and it is the
>>> same code path taken (dma_alloc_direct) as when !CONFIG_XEN and !SMMU.
>>> That is how it should be.
>>>=20
>>> I cannot explain why dma_alloc_direct() would fail when called from
>>> xen_swiotlb_alloc_coherent(), but it would succeed when called from
>>> dma_alloc_attrs() without Xen.
>>>=20
>>> I am not aware of any restrictions that xen or swiotlb-xen would
>>> introduce in that regard. Unless you are just running out of memory
>>> because dom0_mem too low.
>>=20
>> The crash is deep down in the page allocator.  Even if memory was low
>> it should no crash.  So there is some odd interaction between Xen
>> and the page allocator going on.  I think nvme and dma-direct really
>> are only the messenger here.
>=20
>=20
> I cannot think of anything but if that is the case I guess it is more
> likely related to reserved-memory not properly advertised or ACPI tables
> not properly populated.

I am not sure if it is true as we are able to boot with the same reserved m=
emory or
the same ACPI table populated if we boot without swiotlb-xen dma ops.

>=20
>=20
> Rahul,
>=20
> What happens if you boot Linux on Xen with swiotlb-xen disabled?

Linux boots fine without any issue if we disable swiotlb-xen as mentioned b=
elow.
>=20
>=20
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index 93e87b287556..26d9da58f2c6 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -51,9 +51,4 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_bas=
e, u64 size,
> 	dev->dma_coherent =3D coherent;
> 	if (iommu)
> 		iommu_setup_dma_ops(dev, dma_base, size);
> -
> -#ifdef CONFIG_XEN
> -	if (xen_initial_domain())
> -		dev->dma_ops =3D &xen_swiotlb_dma_ops;
> -#endif
> }
>=20
>=20

Regards,
Rahul


