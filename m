Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC955511372
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314526.532614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njd0V-0004zn-Ea; Wed, 27 Apr 2022 08:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314526.532614; Wed, 27 Apr 2022 08:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njd0V-0004x9-BU; Wed, 27 Apr 2022 08:26:43 +0000
Received: by outflank-mailman (input) for mailman id 314526;
 Wed, 27 Apr 2022 08:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sRcl=VF=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1njd0T-0004x3-L9
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:26:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c320af4b-c603-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 10:26:40 +0200 (CEST)
Received: from AS8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:310::16)
 by AM6PR08MB4200.eurprd08.prod.outlook.com (2603:10a6:20b:a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 27 Apr
 2022 08:26:35 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::94) by AS8PR04CA0011.outlook.office365.com
 (2603:10a6:20b:310::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 08:26:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 08:26:35 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Wed, 27 Apr 2022 08:26:35 +0000
Received: from b551cff8048e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F300C4D-A513-4E5D-B6A9-A0463826C3D5.1; 
 Wed, 27 Apr 2022 08:26:28 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b551cff8048e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 08:26:28 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by VE1PR08MB4862.eurprd08.prod.outlook.com
 (2603:10a6:802:a7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Wed, 27 Apr
 2022 08:26:26 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:26:26 +0000
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
X-Inumbo-ID: c320af4b-c603-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nOG8ZkJzTBfe+DpCrAtOewt19xnQkDKUIjKI7UOSViIznQ/h/i6+XuvcuD32gtKzucDCcvTddNgqUei7S81axhjwIOgkgr0US0kWXa2zHcc5wrg3Ojac8wO42eHYjbBcjS1GoQMTrUmWH5hPmLiH2+V28QL6UQSDNNGnd+sbnRd2yJlXCclmgEfHPxM9vqYsvmYJ1/hGmKuxvO1NkVMxMjq+s4nHT1ZU41nW6tPwqphMjtjHDXvYdIYV69cyTTHZY+QIYq+pKxtWNzZtrb0RKDSzlt1yEjcu6m7IIQPCX5w4w6+dLFlSMhnofAqy3a2vGmgd1SQ6bbnLj/zHQnCjAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZoGGGbvoZpPaT6ShyhCcIsyOKXVQV2pCxi7zchFQSA=;
 b=ImKwFXazi1njxJXa2Jc+svciC7790lKYw0aCUE36Sy/QreViMpxNciB0x5c9g5EQRgYtRoYqlIbFxcrnW0bAGQ0DCYjjo6WLxpum2GCx7KFekOf3wWW6OLSOzrv4JysMZRa6zhwjusF5IcXeXfJrlUU6M6ASzoVxCVLiHGvZI5saOuieneqEA1sMNnGc2u4a2LRTj171WOLESFjJguexdsM1fTP8iHjCx21aizT0sNuAxCO2ZYx9XRSArP0PI0tn9F9j7v8idbYq0yGmHxkZ3pI35iPpyqU5Yz4aXttiLeoXJf5hukyIQwBB2Ybjr0lZ7b4iE6YbGb1V/vK4n5fsOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZoGGGbvoZpPaT6ShyhCcIsyOKXVQV2pCxi7zchFQSA=;
 b=Wqydk2Ge5TXQ3fvl15bjfZPjcWk2l9Q/7v0wH/DGJLGVKJr8V2bO0JwQhGSkEex8VA4Jailc0Mus67kLqfPZK9Aih0796RlKRyCB3g1WuNVFSzyR1d1eb19dtG4uF5COZqbelNCnbF05DeN8L9gxGrz68ho5S4Usic4bgPjDdW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fffc2d48008eb437
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAaQJ8SzNnn+MQg5wMCS5D2AldZ8JwMMwcqba29WeU4Ak0tuxYqlIaWRwbos8a8BrZHGHUryAF7rtMiiy2IwvVJP7zD7cEoxYXBmQ6A2Gixhhd/dEDSE8s3TcO5pnvl8MH/Cd3inP0Xclre8TRwT1N8PXWfgvRgvcCqUIduhFGtjBKez0Ua0lZqzdPro8kxKmtAQWfXJtSQCIEJ/Q9WFnOYALKbC79boL6OvJuM+lqyf7gj0Lk2wstwdcpXr9M4kK1H0iQj+SohUv0PhWHhxq20BjBVTMODPba/c2cSg3SyEh0KCV6Xvprs4KozJcoehHphn1BQNwN8YVj4wk51IAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZoGGGbvoZpPaT6ShyhCcIsyOKXVQV2pCxi7zchFQSA=;
 b=fdm9Gv6bRYXd6an+UXUTmE8/kLeW9fvvcXcFOtEcTKsIMgnIer3QZRO7fJjG8+C3RbQol409jbttqFcUBx/QyQRLIiPrvmoSI/9BOCWHLbaPmhigCxWYRixrTYcBr9h915x+vxreOPtFYfRijpGcsOA9eLjDPelJOgVLvwfq6BfPuH5B3sL8B8tb/HSIY84PkhIvi7lTKOcesECUBqrEU8rjtMlQ8Ao26jJjssaPTfgsrJXI5zhJsjhXCGmZKyIFFqnraaUuowBJihRFjo+O64Mns9PHSh15yv3sV1kBreufVHZy82QSGlao76++YuyIING6hK6Pv+H9n3/CSmHQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZoGGGbvoZpPaT6ShyhCcIsyOKXVQV2pCxi7zchFQSA=;
 b=Wqydk2Ge5TXQ3fvl15bjfZPjcWk2l9Q/7v0wH/DGJLGVKJr8V2bO0JwQhGSkEex8VA4Jailc0Mus67kLqfPZK9Aih0796RlKRyCB3g1WuNVFSzyR1d1eb19dtG4uF5COZqbelNCnbF05DeN8L9gxGrz68ho5S4Usic4bgPjDdW4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, "julien@xen.org"
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] MAINTAINERS: add Rahul as SMMU maintainer
Thread-Topic: [PATCH] MAINTAINERS: add Rahul as SMMU maintainer
Thread-Index: AQHYWawa4PHvuVIG8kueApmZ9/tXlq0DbaAA
Date: Wed, 27 Apr 2022 08:26:26 +0000
Message-ID: <E1C5D40A-C070-4CEE-976D-3514B40898CC@arm.com>
References:
 <alpine.DEB.2.22.394.2204261323430.915916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204261323430.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f07a68bc-5862-455c-b008-08da2827a49e
x-ms-traffictypediagnostic:
	VE1PR08MB4862:EE_|AM5EUR03FT050:EE_|AM6PR08MB4200:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB42006C65A33D459462A6F4EFFCFA9@AM6PR08MB4200.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eXvSGl8PpFyVsgu7JgQ8nfa2PrxWIrAEDkRUDJpinzODvT0v0B1JWjbFly9GPnUybNQtUmEYMSrStp+DQwz0lI92jsGuh/EFFcE9Od5pnAm6+e8iAEuJEVSSJhli69RHqiTOIJa311+84Z7qQ0rQUW1OGZGeBfHnGncrDUclToHnVNPO1izBJ/cX8Jm4hdWDd2xInEj7hcmMyhZsCU3qgXEiDE8jkwnySGChbsJ+QBduirm6Z0WVBZILPebavB5Kwz4yDFofS6KOFnXI0EdONFQE9M9Vl9d3eNCJ7OijPwlYwwRk9CrCTNZJqvlwEtjtvshobx1vxn/VSn+qCLtmacMeAXuEPiMv4/SM03dNn2HgYIcKX/wN/F8KogovXHh1uZLMGn5kVrN+FYYefyw3nl3prXa2O40ZrrX4KAyLOlS7BmJv1ms0YbRRL4KWwGFCJivmpNqo/7FN0b/f0VdsS6w7kydB+YSrCtDtWgy10eVZc9Lykwb9tnXNps1mtobqCYKzJKg7XYeSrDkGIwxGD/t27l1yaVz7sN5GiAdkYY39/f40UmPNEpI2SjhlXqbAr96MlisnZtMXOKeoqFS+vFb7cdWewZ1mf203b5AJDkzm3nxU5W6aQb+zCPGAoeBkEt2odFbfoA+adsD1iucB/vkgNHr9Ygx5Vx6gJdOYAe5qIorGfZ1W/qr4OteBNwSqjvtYNCjpR7SGWVVuS3ZAvDV4DeRTg1iNCzkVv1q2p0rYyj53DH83KqbYpEs71S3s
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(38100700002)(38070700005)(122000001)(316002)(53546011)(71200400001)(6506007)(6512007)(26005)(54906003)(508600001)(6916009)(186003)(6486002)(8936002)(2906002)(4744005)(2616005)(91956017)(4326008)(66946007)(66476007)(8676002)(66556008)(36756003)(66446008)(64756008)(76116006)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48EA5F4E356815419DA2436058D290BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4862
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5bbce26c-9b55-4252-fbdc-08da28279f3c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FJqiby5W6AJtGcISMQYjb/LygVVu9KYYPnLEdwX7kQqBHttK5XVRIljN07Qtg7RkgRIXmcjUokxeFYZif6RIeeYAIcW5j9EhJYE8avfmhrWJ/nUhBHIeJ2EYIHj/mMo+MrvRrdg44rK2MA1G5arqIWY98yNuwPFnWhte04OXaJimsEFiBu5blOpicRctwiiO3AmxIbgaXcj114C4cZUxcsuFTMzO7oBQEfat97JIVs9fLkwIWlXf1iTf6OXwMFEYiSu8YXxqsrv5EwGxRCmuz6f+sOm1sH7bhJ2y8Uzehy38VU2VtwLyuPh5Jw+XErHClIVyUSbD5jx8QMwhHRoYuU8qTvJKdFknieQG7vA5oq5LOYPTT0n9UqBZi6Ld1vQXaA1IQtzHl4t/TKBf977looDQ27YzkS0Wt5EV0J6u70iHbCsT6YOCIsO86I4AQhdFy+9YrVqB7vhmMyjPw155vv/QLvFe2OYeAqt2ydsVb1p4hgCw6UWT8vEGb4nhq1i2iwYYZSo11JEmHlcjZecGKZy0MMiYvzTuZgIbmOjeFWRbhDHW9qQzKfxM7IzEjwl/EPtuqJMsVVQZ6Urdb3GGidLBye2ufdufHO+3/28uQpWwVKrwXnzDXQ65rKptS93TBmYIK22kJ15VtTjrb4v8VfmxRg96accMhGq0rWXT0DJuOOBFLMhBFDXSDqJeRGZC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(54906003)(356005)(5660300002)(8936002)(6512007)(81166007)(36756003)(316002)(2616005)(33656002)(6486002)(6862004)(186003)(26005)(6506007)(82310400005)(8676002)(4326008)(53546011)(47076005)(508600001)(70586007)(70206006)(86362001)(36860700001)(40460700003)(2906002)(336012)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:26:35.6386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f07a68bc-5862-455c-b008-08da2827a49e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4200

Hi,=20

> On 26 Apr 2022, at 9:27 pm, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> Add Rahul as ARM SMMU maintainer. Create a new explicit entry for "ARM
> SMMU" also with Julien which is the original contributor of the code and
> continues to maintain it.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2a47fafe85..ba0d1c0c1b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -248,6 +248,12 @@ F:	xen/drivers/passthrough/arm/
> F:	xen/include/public/arch-arm/
> F:	xen/include/public/arch-arm.h
>=20
> +ARM SMMU
> +M:	Julien Grall <julien@xen.org>
> +M:	Rahul Singh <rahul.singh@arm.com>
> +S:	Supported
> +F:	xen/drivers/passthrough/arm/smmu.c
> +
> ARM SMMUv3
> M:	Bertrand Marquis <bertrand.marquis@arm.com>
> M:	Rahul Singh <rahul.singh@arm.com>


