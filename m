Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1D56BCDD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 17:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363542.594132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ppn-0001HA-NF; Fri, 08 Jul 2022 15:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363542.594132; Fri, 08 Jul 2022 15:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ppn-0001E1-KN; Fri, 08 Jul 2022 15:23:59 +0000
Received: by outflank-mailman (input) for mailman id 363542;
 Fri, 08 Jul 2022 15:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LzHR=XN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o9ppm-0001Dv-0g
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 15:23:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id facee61a-fed1-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 17:23:57 +0200 (CEST)
Received: from AM6P195CA0107.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::48)
 by DB6PR0802MB2549.eurprd08.prod.outlook.com (2603:10a6:4:a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Fri, 8 Jul
 2022 15:23:52 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::d9) by AM6P195CA0107.outlook.office365.com
 (2603:10a6:209:86::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Fri, 8 Jul 2022 15:23:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 15:23:51 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Fri, 08 Jul 2022 15:23:50 +0000
Received: from ea1ed28e7f9b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E538BCCA-E71D-4E95-9C44-3F78A923BE73.1; 
 Fri, 08 Jul 2022 15:23:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea1ed28e7f9b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 15:23:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB7PR08MB3737.eurprd08.prod.outlook.com (2603:10a6:10:33::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 15:23:41 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.018; Fri, 8 Jul 2022
 15:23:41 +0000
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
X-Inumbo-ID: facee61a-fed1-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Tc8Qvg1eWsf44+CP4JdRIuvt1FrirVwbwDZ1cVecp5WlaBh/+PZ+1R8xW+dr3pP/jvv4bCslw8320TfYfwBBwY11DN/u9sX7BRotvVKaaVE3BMS40OEloemMQSxGoiVAKhbpkACsNwFTPUqMpLjcaNFrfdTKsRkmCgvcKw3vBPKj46k3ht+GnljZdBnaLvR9SXzw5K/t8tHvd8vw98i36JiwlMVtebdEOyRh0f+N58vA1JqLEVdISXAyU6BZ8W68ZntbN6bS5q/tUxCu8EwLzt+o0RbKyR1i+DGfHA7Ft+B/Nmn6sYfTDePxroggatltfIQB+p1h6f4VCI4J2Rm9GQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njPODwD1bMmyTOF+1F7iWEpiew4wqIZuy7x2hUUoqhE=;
 b=IAJyMViybLDN6FUBNoZebqUXG14f7s8tIbvPTqBBbMwSg6eF/miRpDtjAS/e6fNIcQ1+Cpz7fTStb0WlcshbSOfVAOF3dgFsbRClF9elJOkjy22cGcXOVUylwjpYD/qGRuNKVnWlKG7rKP7++PuO0vhh1wMcwj0+zWJuOQfB0BwhzpQgHDwK59Lt0RhIKL6U6RRmJ+/pXsIt2lYBTOY8CC18YIcJ2YB8Clu8WdP4dVIYBM+AqACEFfRjTZvyA/WbMH67SkTQOdh8vjLV4igR3lk70eV++7Livw4vOrUBypRrUc6jcHLsQAfKgLs9yaLR/Js6L2uUhKgw3re+IHDhFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njPODwD1bMmyTOF+1F7iWEpiew4wqIZuy7x2hUUoqhE=;
 b=3Ohif10FjP+HGGzi1NrtzseMEcpiYq03Z71eP5BtAj+tCCMrVZRTHaum5lPZFDUXRlARc0YO1o6bbQEUoTa06nmVXazV7tPokjGqD/uktzakVAQ8YgFDACx0FsHyS24kC7BMtvCaSywcMqs9P3q0LmFgGe1SB2gQxnwQ3G8Ul+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93219a6f4131b75e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnQ00g6tlUvyltLAHjgCl5+vzxUSDD2sZsHU5QGLO4QAioJVGn8s0lHRKvsQOb7ne4XowDpJMJ4CM+HhUkjORc27uU5RIynJEoQmVBBCLqnG2UTGDgrZ7bRBqQ5ilN0gWdofmZuG+Jgnpkl5sQbXUQQKcIWvqPEO6bfgeKjxm7BsFlV9cTO09HkmIZVlBqlNDA5ELg4W5VVvj2oVa5lmSv7V0m1RZk+K7nFH6qxs+uBwoVR2j9VY+75yj3UAq/C8zmeP35fbxhY+r3RNq3FbmmKj2DB4Pp1qJVJiGonAceHlGrwkxqtt6tcNy6XBtjpiCMzA8Uv4o9GRA4Afw6zs2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njPODwD1bMmyTOF+1F7iWEpiew4wqIZuy7x2hUUoqhE=;
 b=N8wc5pMlUcaKd13Nyi6uw4MYqj4hREVkUw8rdxi0BiN5tSbjwmLP0ig/40Sxj1FTHKLsc/Ju/HKpTJ3ifpo20fYiq4yGCr6x8Ub/hBu2Arp2zdUnWNcps6ockKz7r1KsBGeAiD1l2srn3Geoot1FE5jF7+ABcSqLKWQrf+BVZwMm4h6mJovLN8n9dgk9CSW6mfPha4c0eK7dj/W3Z3afAaW80/UjOV3w7dHBHa6O3z11a16mA74VXI8SntWzBrG9tXAEatFAy7s1TCSLOaQLor1LJ0gubOxQZY4Yp8n3b1KecLiO+K7T72yvmCRdtBTyJP3mXKjLEWqoMS3YJPX7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njPODwD1bMmyTOF+1F7iWEpiew4wqIZuy7x2hUUoqhE=;
 b=3Ohif10FjP+HGGzi1NrtzseMEcpiYq03Z71eP5BtAj+tCCMrVZRTHaum5lPZFDUXRlARc0YO1o6bbQEUoTa06nmVXazV7tPokjGqD/uktzakVAQ8YgFDACx0FsHyS24kC7BMtvCaSywcMqs9P3q0LmFgGe1SB2gQxnwQ3G8Ul+0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 02/25] tools/debugger/gdbsx: Fix and cleanup
 makefiles
Thread-Topic: [XEN PATCH v3 02/25] tools/debugger/gdbsx: Fix and cleanup
 makefiles
Thread-Index: AQHYh+Q7ENxA0CLOIEej7JYABIo4T610rZ4A
Date: Fri, 8 Jul 2022 15:23:41 +0000
Message-ID: <7BE4800A-5196-40C6-9D4C-7F6D924E107F@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-3-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-3-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8adff8a1-7481-4cb0-fd23-08da60f5dcbb
x-ms-traffictypediagnostic:
	DB7PR08MB3737:EE_|VE1EUR03FT060:EE_|DB6PR0802MB2549:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6ZUoxHqHmTZy76x6dHYW+v+V7wWidlTR76ocktRhc/wz5SkpkA1Vj+nNGKkIGn9ONmb5O1WG5x7QJYniIoDB0HAcM4Rt0ruk52JrPqg7p+Qo4t9zLoR5msYHBRC7ZQl5EZw9azWaBh/yivUh5SQUwsmTnb6A/56Kk3ElUN8Fzve1wo6M39ge93ookbjOP1xb6czoJKNiVD6u0LEONuIUzzjz6EbwjsVOEv0tvfIwlMLJS5lUdAvi934W7sxS3j8GXi16Dri3DthT1Lo4rbwBhFHz9Eao/IqsMj5MmGQ3HzH/PVCqWTk+J1oEznB1qLGWLs98DLJjSo+09vHOfwtq5rFszAi3pcOiFRyniMhCXLpSUw9Bvf/6GpwFV4BThQR9rtBct5xLXtfyi0XMIGQ1RYYd5nwK0YZfJDGkw3t9CkwOWi2pv2G2c9RuqcWBh0aPTWe7TT9ugOzp/djIHevQFabCZSplVzi51VWWC/FKNwz47k0/qmi1udu00e1M+0u1OzHGnD+zlGStk/6rsBgIX0uJl+/tMWCHAZNZKh73TCFhzMLOUL5uWvY1tezfDICEXrghsqgRhagJZRlAqP8DMKJOCFyNl5pGjoTpM8HsJyriu4X7dguLiC7ZS+8V08PGhTH8FpK7t1PeEok+E90dImnIP6Cm1H851vqQFDo49jnQxYa8AfrelaB7WhuNe762751HmjLm+5m5iGCgimYb+YB7vAnMVhgOV4xlycKviSSVVtcaMlsaQspRpByaAwTDbVJgQqp4fqi4sulMjHrsRZ3jw4H0Sigg787q2I1tyCAYGUbhgGfJCbKUDOCngvmWpTI1xjkW9Gg60keQohBihfUt9wlx12amQ7I1JEDgVrY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(6486002)(66946007)(38070700005)(76116006)(66446008)(91956017)(66476007)(64756008)(8676002)(4326008)(316002)(41300700001)(6916009)(71200400001)(478600001)(186003)(83380400001)(2616005)(66556008)(54906003)(53546011)(6506007)(6512007)(122000001)(26005)(5660300002)(86362001)(36756003)(8936002)(2906002)(33656002)(4744005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4D7468D452F8E14892AFA512110BAB8D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3737
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3301dbec-319c-469d-e84b-08da60f5d6d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yYyex6dLk41bKYSplvLy/hiHvuE+z4WNp+xFZKMzM73/plTDZf5jAXMrzI2mpBfgnCIt+pI+i8plT7S3AyCFVCpw5GZQon1vN8E/jVmfMGC2EFZzX6o2Wi2rBJurj7TbNdCTQIpI7NuVRtsPICrzCQLbP74khO++UPdnGLwnFJj/VKhTzzDwTrLzHwbDF6yG1SOK+iT6NwG6hxnGTbgYs6sCXesBxfFLtP8Si2fJScPWpfcc0zRgVVEKwDVvl/hOLk3pDgsNgqlU0xNCP0iBy5magyHqq9ugq2V4TgdAQaAWzvQqt4NuDADVGAgBXr+c1L3Y4HQGZWkxX7TL7kMwBVfm/WXVYDiDcg1FeoQgN7Y3wDWZn6EP0EZlmJbS4fDsU1gf+Rfo95L683It/vRTeqZaYsWyJi2qceF4zwsD/wScjYJDR0pzBUOHq+z4niTPSCn1lHtCPCdONLSkbF95VDfWCZBW5JpO53pZvAAwC8w9zoBZITemFc7KcjLicLOZpiPhopDLS9WXpovg0jTkpzZiIVOacmqZc3vxomY4F23xI5Tdzpf23o43zNqjyNAaxRpsACRn5OJAPzZX2HvMNzE1SI6AqF4hYKf53sgLFxhE1d4EobVTRxw1E5wSteHDthbbc+ax8sqfNekqi2EZ2JNeBWjqexMpIkx4FDKKwp/c7BGThxd80HurIHaXZSEA+QbfPVF+bnR8Nguf3Sd3007cREVxBsLKa0110pjW4S8DhzuHSJsvSrRCsSpVFJW10MCd0pyrHU24LP4mgrYiKkmv2zKq2/lJEPGMs3sfBW7+lJq3i5OxejQD1c+Z/nzm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(83380400001)(478600001)(6486002)(33656002)(70586007)(47076005)(86362001)(5660300002)(81166007)(336012)(356005)(70206006)(26005)(6862004)(186003)(82740400003)(4326008)(8676002)(40460700003)(54906003)(36860700001)(6512007)(53546011)(40480700001)(41300700001)(2616005)(82310400005)(6506007)(8936002)(2906002)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 15:23:51.1658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adff8a1-7481-4cb0-fd23-08da60f5dcbb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2549



> On 24 Jun 2022, at 17:03, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> gdbsx/:
>  - Make use of subdir facility for the "clean" target.
>  - No need to remove the *.a, they aren't in this dir.
>  - Avoid calling "distclean" in subdirs as "distclean" targets do only
>    call "clean", and the "clean" also runs "clean" in subdirs.
>  - Avoid the need to make "gx_all.a" and "xg_all.a" in the "all"
>    recipe by forcing make to check for update of "xg/xg_all.a" and
>    "gx/gx_all.a" by having "FORCE" as prerequisite. Now, when making
>    "gdbsx", make will recurse even when both *.a already exist.
>  - List target in $(TARGETS).
>=20
> gdbsx/*/:
>  - Fix dependency on *.h.
>  - Remove some dead code.
>  - List targets in $(TARGETS).
>  - Remove "build" target.
>  - Cleanup "clean" targets.
>  - remove comments about the choice of "ar" instead of "ld"
>  - Use "$(AR)" instead of plain "ar".
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Antony,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



