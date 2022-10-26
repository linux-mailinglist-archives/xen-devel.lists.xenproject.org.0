Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA660D871
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 02:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430282.681789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onUDt-00050l-EF; Wed, 26 Oct 2022 00:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430282.681789; Wed, 26 Oct 2022 00:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onUDt-0004xM-B5; Wed, 26 Oct 2022 00:24:45 +0000
Received: by outflank-mailman (input) for mailman id 430282;
 Wed, 26 Oct 2022 00:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NsSF=23=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onUDq-0004xG-TQ
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 00:24:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94e5fd9f-54c4-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 02:24:41 +0200 (CEST)
Received: from AM5PR0502CA0008.eurprd05.prod.outlook.com
 (2603:10a6:203:91::18) by DB9PR08MB9539.eurprd08.prod.outlook.com
 (2603:10a6:10:453::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 00:24:38 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::69) by AM5PR0502CA0008.outlook.office365.com
 (2603:10a6:203:91::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Wed, 26 Oct 2022 00:24:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 26 Oct 2022 00:24:37 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 26 Oct 2022 00:24:37 +0000
Received: from 0d971bca963c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF40FD09-C22A-4E76-8F5F-D0FA4CE2B11B.1; 
 Wed, 26 Oct 2022 00:24:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d971bca963c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 00:24:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8458.eurprd08.prod.outlook.com (2603:10a6:10:3d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Wed, 26 Oct
 2022 00:24:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 00:24:29 +0000
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
X-Inumbo-ID: 94e5fd9f-54c4-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=W3tIztXnsLTmyvWrVB7xq4nY2lHuOOOEOynywXxi3jP7L1/iGtrk+x/plwl21RDS5vWyH5NyY/O/UqjfzymH/WD3IGf0jyKQs0B7a6YYRL9w5+iZmv7YqKT7iUaPPb/Wa+8/J6vofwIqxyHM6EC2IO2TKIKdBmG7AgYAk+r1bfnBhoACllsR3X3AopwDX9bcnjPSM6F7cVUgQ/JT3ym+Ld/3HxMtHp2q472fNsVHbZRlKaQmXWPzUlUrgcTH2NVHciR0pOXyZ5nNLv+34B1WDULDnLFsvPsEYTbZyqNq/l7Tk6VMYHYV3HdOMAD7cOqfv6Ijv1vdq3ei+MAgYCjIWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohq/QidtMMhvuoQn3k1V0osZPXj/L17D20miE8Ha+MU=;
 b=HV9O1Ls5cJ7zX/cq6BnhpqtREdrIOLBzT0q8Gi+5vpN0MX/wWzSrRUGp437QOizwwlRUjoOhW/RfkJuRrj0RIFBM2INj9yOK7SlzNpdzj7N+SU+LYskUBTbWhI7/GggFRebds96YJ2t52RZWCyT7WkjEfmi62dIwf79eV4pixQh2vKHc4ONDnV4wQdbVVZcU40i3QspY8PEJ0d0fEx00Q7iiYc4zdrty6deu3fjzeoWb5/1I9svKua+w/ZF/5uMF9WLsjoUkVkU/LOBV1txv1XNQKrfoPuUeQGRI7Cx08aIr9+onLyO/z5TPOPwLBon025T8Zl1BQczUTTHu4X615g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohq/QidtMMhvuoQn3k1V0osZPXj/L17D20miE8Ha+MU=;
 b=cFaV5d32/+cROyl8XyWUqvwiGgiXoYxm6+AqFgm92pEpfkkXRbZHkvyMm1pMp/QQNQE1PfiWniI8lXJKMViLnvwj4lB0rFhxWLzDUlFfXEgasGqScezauCNsjtxniLA2fgzxoQxLeniYma+jkVlNFwzCpWp2XZlX69jtS/1GZAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdEH1xg2IOZjl+bTNWNo5dd5mFz31HSCx/nxBpNdvJKC4O7oUd2XCTf3MUPj2QvgDf0+E/QsCPU6Gagoty8Mdx8qMrrSC45BW8+gSpkvnIeuEL8s/MV+LOzYGm2ybCwmoymmxyAL8qiugXTYwy4opAVZxwGmLEbjHz2xJlVhrW3CMi6/htambyyjataBIx9ylhJoqfwcYmYwrtVTuwQmwhvPjGVX8PD8C5Po1Rz8JUOWdyA6hYgSgAlQg/CoVr5WqnVWYe5Zp7e/qY01+QFUYgWoVF5Zp/m1LBJhBlTsfPDT8nBtD5xU9yqD6WNxyxDkzknxcGJPETODMCZKDFG2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohq/QidtMMhvuoQn3k1V0osZPXj/L17D20miE8Ha+MU=;
 b=OPDyjY/gtRPaGIpZ7jUZduRO6Ru17o+AcHy5wcHeWERPr3IYZRYIvH+zp8915HnUgZVVeuBrU0kD8O2vTa6ShDTAxN16703OHzPv7zBfwp06QZl4/Ng/kCjEvgSueh7a3zxlhT8mJ9TKb/MgZGKiA6+mN9Nm+JlnFQxnWi00NQ3MOffRVXBlqUG03+7hmI2e9z9N2IuSrNFqthLjevmvITuTxeqasIX8uy1HrlXSlocdU/OSaEg/oiw6Cm3Cw34viPpOSxk2T5+hK4KppOGAQU2LbENh9S/JozCb1heTh1VqktQpkFyVIGGbydcb9MFo4ZKDr+6Xy8JF69Xk8pDWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohq/QidtMMhvuoQn3k1V0osZPXj/L17D20miE8Ha+MU=;
 b=cFaV5d32/+cROyl8XyWUqvwiGgiXoYxm6+AqFgm92pEpfkkXRbZHkvyMm1pMp/QQNQE1PfiWniI8lXJKMViLnvwj4lB0rFhxWLzDUlFfXEgasGqScezauCNsjtxniLA2fgzxoQxLeniYma+jkVlNFwzCpWp2XZlX69jtS/1GZAg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH for-4.14-to-4.16 0/2] Backports for XSA-409 fixes
Thread-Topic: [PATCH for-4.14-to-4.16 0/2] Backports for XSA-409 fixes
Thread-Index: AQHY6FMyz5PAz01Tnka4mYQhtIXJEK4ficaAgABEtvA=
Date: Wed, 26 Oct 2022 00:24:29 +0000
Message-ID:
 <AS8PR08MB79915FB6F828D7650E85BDA092309@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221025092112.50168-1-Henry.Wang@arm.com>
 <9bec8877-25d2-8d50-6f03-523b806642b2@xen.org>
In-Reply-To: <9bec8877-25d2-8d50-6f03-523b806642b2@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B5F00B1E48961346ADCDB56FA55434C8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8458:EE_|AM7EUR03FT060:EE_|DB9PR08MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c7b073-0d55-4c86-12ff-08dab6e87721
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2a7tJO+vzDdd2CmYAexMvg6O9gsEEVzi+cfH3vc0wnBeLQlgw3y+yQDIvQX9zIMoxlDtBuRfTZMZhf6P4YaY0W4m7vDoMk6277UZ4qsRbnymWEGglgj3fXdAQlbceHgXdZrv9MBWMKIP4qCTf7uTo87fw34T94ajSHmD9cLcT/zt8GOA8vtnuNzqodnun1M6b6b5UCoV4j7+MYoAGcMKFEHvR0SBr/lcGQcl/q9sjg1VDduGtOQfwLtb5mnMVHAeiBTsRHGD5bCYgQeKEem36YVIzVAU5hzjBKMyfNhSV2U/uJ7LAbFeqN/ksk/7COxlddMmzPO8gkvgj9emqh/7u7dBvjs01RoSqC44EpyvUMV3RSOMRc/EuyvUQ0MgqLWJD0yeVRJdXWeVRUjfdtFmp/pXqE2/rSAnJtCkVOgcGv/MsFkX8gS9SrlnTVmkdofpo3HNnRzwmF/S7tu5asDHi+/mwcuaiEA6w4foIvXzvkXn4urKWWNlZNz88AOFxQmKt3M3OY7wJNn48gfLm3zxU6/BKSeWvcwOnv+qdJ4+DXD3bX3bAPKoicWI5i9lr2q7fO1rD1m8BnIDbFbgTspybYBknyi46fpAK8kkiJlg+pXybJeSoAOkY7yaS6qAAlbR18336HEP9Q5z6vi5NS7Eq09dKmeFfUiiPH4HXVOrolhg0wVoynSf2/D1ZAvvRvVb58VDj3oEEH0aDp88V7AkmwLX2fdPdR085gMgNJnh64waqN+kh1/1ZgYijlWAoKQn+o29sz0RlkyVvI35ZMYxuw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(186003)(110136005)(33656002)(52536014)(478600001)(26005)(41300700001)(8936002)(9686003)(86362001)(316002)(54906003)(55016003)(83380400001)(5660300002)(38070700005)(66946007)(66446008)(53546011)(38100700002)(64756008)(66556008)(76116006)(8676002)(66476007)(6506007)(122000001)(71200400001)(4326008)(7696005)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f16e4c31-1400-4b08-e402-08dab6e8724d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MWaOmyi5OtEOJSYANpv6VJPGScxKVHIzoEKBjTY+9RcNPPx8L0kJoBsu0Xh60wLzrJdwaXVodFwIGxrQbrTaLtJ5la89nuRTzq7rXPCl7xMBpCaVbw8/dHFG3geSbaTxfq0DX5gPguZvMOSG1n7wq+n40ZuDt/NIbPTT64Lub/cLeCj+zDG60MaMTpyj73tcEYG183XcnUP1qUZXVHuwdE8GWv+Bn+w9lfQQLmGash4Jtv8pxf+NxHjcV+pzE48cUoZgihpbSvY8dgVzvCb7pENwEPB+El/nXum7anBKcqwkv2KB/69O4tGY+HNlRoFHcXsblbFbHnHfAIFqgh12JSBbI7LjIMqLQ4G6VdaMjJn/+r8vVCpPNRaf6pZ/ed2Mi2xjGAThRLIlunJJqn45qhsUng49DgvXqlqOBo7b/m08b4rORfU1+It0bvFfP+kH2NOpSrp6EubtAyGsqHbSL8JsJtqpszG8xJ0QGCWQN/JvNLxLvSIXjQfyo3vBESmWy3SmrCAhfXQD2mQQWzgKOJzEqrNODAXyecocq0tX8slmvq6OzYRjkVkftwZantLRZqKheoZsuLfyYQ4L5arWP0TDE4u4uOqOl+w9BTQYO71xrZvhLZHlHVHVi0q1I1MQyVx36DEN1KBEQ2Nq9O43iyIDTHef5XBlizIwZiQte+gKNqGqd9glwyjwOjwVSHCkR1Qf3nai73NLr4qq+7FB13fzt1mctvJrJMJ/bj/FK1Q+04KBDobZEpunoC5PGiXu4S8V9fBY1FQnmo17wwLN+Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(2906002)(47076005)(36860700001)(186003)(336012)(82310400005)(82740400003)(5660300002)(52536014)(41300700001)(107886003)(26005)(9686003)(6506007)(110136005)(7696005)(53546011)(33656002)(54906003)(40460700003)(55016003)(4326008)(316002)(8936002)(70586007)(70206006)(8676002)(86362001)(478600001)(356005)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 00:24:37.3045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c7b073-0d55-4c86-12ff-08dab6e87721
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9539

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTQt
dG8tNC4xNiAwLzJdIEJhY2twb3J0cyBmb3IgWFNBLTQwOSBmaXhlcw0KPiANCj4gSGkgSGVucnks
DQo+IA0KPiBPbiAyNS8xMC8yMDIyIDEwOjIxLCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IFRoaXMg
c2VyaWVzIGlzIGEgYmFja3BvcnRlZCBzZXJpZXMgZm9yIFhTQS00MDkgZml4ZXMgZnJvbSBtYXN0
ZXIgZm9yDQo+ID4gNC4xNCB0byA0LjE2LCB3aGljaCBjaGVycnktcGlja2luZyBjb21taXRzOg0K
PiA+IDM3ODNlNTgzMzE5ZiBhcm0vcDJtOiBSZXdvcmsgcDJtX2luaXQoKQ0KPiA+IGM3Y2ZmMTE4
ODgwMiB4ZW4vYXJtOiBwMm06IFBvcHVsYXRlIHBhZ2VzIGZvciBHSUN2MiBtYXBwaW5nIGluDQo+
IHAybV9pbml0KCkNCj4gDQo+IEkgaGF2ZSBtZXJnZWQgdGhlIDIgcGF0Y2hlcyBpbiBYZW4gNC4x
NiwgNC4xNSBhbmQgNC4xNC4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCENCg0KPiBJIG5vdGljZWQg
dGhhdCB0aGUgInJlbGVhc2VkLWFja2VkLWJ5IiB0YWdzIHdlcmUgcmVtb3ZlZC4NCg0KWWVhaCwg
SSBjYW5ub3QgZmluZCBhbnkgIlJlbGVhc2UtYWNrZWQtYnkiIGZyb20gYWxsIHRoZSBiYWNrcG9y
dGVkDQpwYXRjaGVzIHNvIEkgcmVtb3ZlZCB0aGF0IHRhZyBmb3IgY29udmVuaWVuY2Ugb2YgdGhl
IG1haW50YWluZXIgZG9pbmcNCnRoZSBiYWNrcG9ydC4NCg0KPiANCj4gV2UgdXN1YWxseSBrZWVw
IHRoZSBjb21taXQgbWVzc2FnZSBhcy1pcyAoaW5jbHVkaW5nIHRhZ3MpLiBCdXQgSSB2YWd1ZWx5
DQo+IHJlbWVtYmVyIHRoYXQgd2UgbWF5IGhhdmUgc3RyaXBwZWQgdGhlICJyZWxlYXNlZC1hY2tl
ZC1ieSIgdGFnIGluIHRoZQ0KPiBwYXN0LiBTbyBJIGxlZnQgaXQgYWxvbmUuDQoNClRoYW5rcy4N
Cg0KPiANCj4gQWxzbywgaXQgbG9va3MgbGlrZSB0aGUgdG9vbHMgSSBhbSB1c2luZyB0byBkb3du
bG9hZCB0aGUgcGF0Y2hlcyAoYjQpDQo+IGRlY2lkZWQgdG8gbW92ZSB0aGUgImNoZXJyeS1waWNr
ZWQgLi4uIiBsaW5lIGJlZm9yZSB0aGUgdGFncy4gSSBhbSBub3QNCj4gZW50aXJlbHkgc3VyZSB3
aHkuLi4gU28gSSBoYXZlIG1vZGlmaWVkIHRoZSBjb21taXQgbWVzc2FnZSB0byByZS1hZGQgdGhl
DQo+IGxpbmUgd2hlcmUgeW91IGluaXRpYWxseSBhZGRlZCAodGhpcyBpcyB0aGUgY29ycmVjdCBw
bGFjZSEpLg0KDQpIbW1tIHRoaXMgaXMgc3RyYW5nZS4uLnByb2JhYmx5IGI0IHRoaW5rcyB0aGlz
ICJjaGVycnkgcGlja2VkIGNvbW1pdCIgaXMNCnNvbWUga2luZCBvZiB1bm5lY2Vzc2FyeSBpbmZv
cm1hdGlvbiB3aGljaCBzaG91bGRuJ3QgYXBwZWFyIGluIHRoZSBjb21taXQNCm1lc3NhZ2UgOikN
Cg0KTXkgaW5pdGlhbCB0aG91Z2h0IHdhcyBhZGRpbmcgdGhlICJjaGVycnkgcGlja2VkIGNvbW1p
dCIgd291bGQgcmVkdWNlDQp0aGUgbWFpbnRhaW5lcidzIHdvcmtsb2FkIHNvIHRoZSBwYXRjaCBj
YW4gYmUgYXBwbGllZCB3aXRob3V0IGFueSBtb2RpZmljYXRpb24NCmJ1dCBpdCBzZWVtcyB0aGF0
IHlvdSBzdGlsbCBkaWQgc29tZSBleHRyYSB3b3JrLi4uLnNvcnJ5IGFib3V0IHRoYXQuDQoNCktp
bmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBH
cmFsbA0K

