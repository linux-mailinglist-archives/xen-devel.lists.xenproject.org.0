Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA94FF06B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 09:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303931.518407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neXEk-00061k-LW; Wed, 13 Apr 2022 07:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303931.518407; Wed, 13 Apr 2022 07:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neXEk-0005yi-Ht; Wed, 13 Apr 2022 07:16:22 +0000
Received: by outflank-mailman (input) for mailman id 303931;
 Wed, 13 Apr 2022 07:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWwI=UX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1neXEi-0005yb-LQ
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 07:16:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ccc6250-baf9-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 09:16:19 +0200 (CEST)
Received: from AS9PR0301CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::29) by VI1PR0802MB2368.eurprd08.prod.outlook.com
 (2603:10a6:800:9d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 07:16:07 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::32) by AS9PR0301CA0019.outlook.office365.com
 (2603:10a6:20b:468::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 13 Apr 2022 07:16:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 07:16:06 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Wed, 13 Apr 2022 07:16:06 +0000
Received: from 9c5eafcb9bdf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D92ED076-2BF0-44A7-881B-CA56B0ED75EA.1; 
 Wed, 13 Apr 2022 07:16:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c5eafcb9bdf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Apr 2022 07:16:00 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB6PR08MB2758.eurprd08.prod.outlook.com (2603:10a6:6:1c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 07:15:48 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 07:15:48 +0000
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
X-Inumbo-ID: 9ccc6250-baf9-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKI1JzWv4PwhPpDA4a5jLbM2DVtyJbD9Pn7kdTckDJA=;
 b=JeArvsTLJQzy7M3A+yxJNYLNHPjHNtqJNfX+fmxfPtSoqz3vUPrkuwNhS+YH6w9DGItmSnqacd12vw8o2rxb+CV2sprIrHfV3hYYSpfBnJeDZWHQE3QIpMDTnAPLNorgH+TEodB9l76tKTanP9WRNDlpdhScOrMLJyy5UhHZmP4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8deef940288bc036
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7QwyhZh4S+mtmHEVJ/9stEd/c3tGuM13e9ksyMvBuL6R/yFCxyqODVhm+eZQ4WhQmB6OOgoV0yrZPiSiwRG56lKcuj4dgRSxMCBuWprR6Q9S5SQj9MDWuo1YvAHJdmIX25rRY45/9FrdjUVEW03+7AORmm2JbUFo30oz5tuR5SG8efp0Y7pMbCNVFBeas9tCTJHilebwQhHzNpuGILh02Zm0M2sQYNKXb/BQU1gITfBWzVeMBWRmw14dtEU9raLZeK2dYsUP6bjXoSYM7k/EbUnbpEYoyEbc0+tTv4G+DNEiVk8hNJGxYWPEZEoPGOI/t3sG+11HgaXH676kY3NwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKI1JzWv4PwhPpDA4a5jLbM2DVtyJbD9Pn7kdTckDJA=;
 b=ccF5aH+nA2I2GQgbbBnWgoh37Ls5QnwR919/t3E3zwtCttNkobEGPHg9KsQcSgGM1rjdYXL1EOxXDmQ9kKa79RBQ1HhVAu9DC7g2UAOlVVFu+QJRw6FCLwes2X4J+ykyQvwlUe4IGj2QsQIKmH7I9TGDokfFhb0/rImE/iiUYp4Apohe0FOjjEzKHCv0+By9AMCmb3a3flD1NXVahVcqI42Feb9DWD8b1tF/rkj5GCXHi0O/cGMz3yRe+iM44Q1dV/rcWyNcf0IK3ANk6XAnyc8CS9CA3LBPAPPMYcGjTPDlVCPeifYU4rEaEIXP6QfnOa8Bfggg4jYVc3VXk4MRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKI1JzWv4PwhPpDA4a5jLbM2DVtyJbD9Pn7kdTckDJA=;
 b=JeArvsTLJQzy7M3A+yxJNYLNHPjHNtqJNfX+fmxfPtSoqz3vUPrkuwNhS+YH6w9DGItmSnqacd12vw8o2rxb+CV2sprIrHfV3hYYSpfBnJeDZWHQE3QIpMDTnAPLNorgH+TEodB9l76tKTanP9WRNDlpdhScOrMLJyy5UhHZmP4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYTbfiNTg+IXy/G0GwaoqGDOL0yazq2Y4AgAEwcQCAAAivgIAA2MwAgACFroA=
Date: Wed, 13 Apr 2022 07:15:47 +0000
Message-ID: <39D59E80-A4B5-4587-9A2A-1D5F06C8C33E@arm.com>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
 <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
 <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
 <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
 <alpine.DEB.2.22.394.2204121616030.3066615@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204121616030.3066615@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9d9d09eb-3ce0-42d7-c370-08da1d1d7a66
x-ms-traffictypediagnostic:
	DB6PR08MB2758:EE_|VE1EUR03FT054:EE_|VI1PR0802MB2368:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB236819663F75E47ADEF6037FE4EC9@VI1PR0802MB2368.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m6IQeEqCgEGTKVX9gqFC2D357mG6b1z5AZjl58IVo0VUaIypoi+HVVN2NPhQYUacuycCG18yia3QGQe7WGa84sggUX+0ndiM6AaviJCKutIrePIml+ARZmk4wcF1Yn6YprocajTNjzgoePIxI7A17/pPWnBJDs8zxbROaB0zE501Jh/7k9drtspl8xtp1qqGsdUXR8ZxmWJlN9F7FQLp3yiA2+N3ZZQjHE8qqELEJepd66Mu7c+nNu9+iKcT48/dkHYONgnOemPaxo5Lew65yv6PqjgGegsjidxi+9xOyjawOVsgJZlbCiqgQyXoAZnmBSHvEaelRvMfVE2BGrgqElFSpBIQrFP1bSpLZRddHwAviEjVTZDc2UkShGl6UHW/490gkPcr1DA8E4TL3lorqB2brEesUVvfhvaMLEzPKFXvcTU/85MK3lZaX3I5C7+RlmzFx2oEm0cY+sPamly+m9zP+PuCxpVe2mbmkSTfBRa/yZleYWJI8S4Z1jVOQ/MjC261vCpG1h0YybZu1auPfWY/fiikPKTySXy+feSdE6he7DANeuYJ0eg7tkG63TZ7xzBYp/f6GtXppJi8/Ssx7iiiWDXcAGr0V1tWou1DZzhdJcIhgLbGKK8yMxdFg+4j/9wBiy9aG0ts9WVaMEM5rLYrqicrFbGLId1b1ZxFN1zSOe6JIyfVt3D4GGA298MlfDjT+x+fKUNm0rSPPihAlLFF3DEHBqwJ2fHr/meQ4XftEb3GkhzkxiIE0nIUVLJb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(508600001)(122000001)(316002)(2616005)(26005)(38100700002)(36756003)(110136005)(6486002)(54906003)(186003)(86362001)(4326008)(66556008)(8676002)(38070700005)(64756008)(66946007)(66476007)(91956017)(66446008)(76116006)(2906002)(33656002)(5660300002)(8936002)(7416002)(71200400001)(6512007)(55236004)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5EF9E5A80C7DE548BB7C6B2A3E6B1057@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2758
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04d7228c-e68b-4a4c-4506-08da1d1d6f1b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mse3j8e+bx/yA11feyOLhNFh1KMct8WQTuvJs0aK1/8mSm10F1Ax2G02IDuHT3kJjqIoG9yuHoFGhU5QJ8NWqzyycrVbu6us0nbu85tkm2kshv20S8HtsuSbi+BwJaKJc9kaFzKQe0OK5DTY6V4de26dti9pKdCfxxJt7nnoFnYHf8Bn241vuIaovxhPBuCiQsyrxB6g75sOd86N6vy+fsfPqlGgNcI+pTrdrijXZHXR00f3/B0bNIVFfNxvWPLpPSJiIWcZl2bmu78jONMFi1qhidGfRXG+1iydYZg/BQI8JhMaVpoD8basYAVnGZfBInDDMUgwXKvdUyt2it7POyBoK7zijeHtfYASMGVivhTyl3JqoDVULLm6456ouZmSWYtg1mlq59UeApQ1uxqlVVn1PC9HBbGDWmW4stQk3799exmhlqgMLdlrQzEGd3EQxRBAUdBGEvU+jyqFLBysam0l+BgfaaWi7YdXhZKlscsf9elAAqbglwFmvGkPRCHtZ07uhiVF7izo+SxS4iyGavQft1CYFOjKhzNmVhhpO5OJd7lwordN6I8Ob1xg2jY0Y+bVxM4UE1atWJ7GMw/gr1d/LYppXnbvyrBJwTVimcFlY84mQ1D5EkIx4eXRPIgVRbjEBa4lhIFHOYkO1YLAp+5uY6N5zckspv+cQS4eUfh8yVxBkdLut0VglGPMZOE+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(356005)(81166007)(6512007)(82310400005)(47076005)(36756003)(5660300002)(33656002)(40460700003)(2906002)(2616005)(508600001)(4744005)(6486002)(36860700001)(86362001)(316002)(8936002)(336012)(70206006)(70586007)(6506007)(110136005)(4326008)(8676002)(54906003)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 07:16:06.8857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9d09eb-3ce0-42d7-c370-08da1d1d7a66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2368


>>=20
>> No, I'm not suggesting a new menu. I was merely wondering whether the
>> Kconfig contents wouldn't location-wise better match where the
>> respective source file lives.
>=20
> It could be in xen/common/sched/Kconfig at the beginning of the file
> before creating the new "Schedulers" menu, e.g.:
>=20
> diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
> index 3d9f9214b8..f6545f4e9b 100644
> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -1,3 +1,10 @@
> +config BOOT_TIME_CPUPOOLS
> + bool "Create cpupools at boot time"
> + depends on HAS_DEVICE_TREE
> + help
> + Creates cpupools during boot time and assigns cpus to them. Cpupools
> + options can be specified in the device tree.
> +
> menu "Schedulers"
> 	visible if EXPERT
>=20
>=20
> I think it is fine either way, so:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you Stefano,

Jan for you is it ok at the beginning like Stefano said?

Cheers,
Luca


