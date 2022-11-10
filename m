Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B585623A2C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 04:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441206.695558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osxt7-0006Va-1I; Thu, 10 Nov 2022 03:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441206.695558; Thu, 10 Nov 2022 03:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osxt6-0006SK-TL; Thu, 10 Nov 2022 03:05:56 +0000
Received: by outflank-mailman (input) for mailman id 441206;
 Thu, 10 Nov 2022 03:05:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WK5U=3K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1osxt5-0006SD-6R
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 03:05:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 958613e7-60a4-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 04:05:53 +0100 (CET)
Received: from DB8P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::17)
 by DU0PR08MB8833.eurprd08.prod.outlook.com (2603:10a6:10:478::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Thu, 10 Nov
 2022 03:05:49 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::b0) by DB8P191CA0007.outlook.office365.com
 (2603:10a6:10:130::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Thu, 10 Nov 2022 03:05:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 03:05:49 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Thu, 10 Nov 2022 03:05:49 +0000
Received: from 125f96656067.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59FD003B-0C28-4083-B4D0-F3902DBDF42B.1; 
 Thu, 10 Nov 2022 03:05:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 125f96656067.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Nov 2022 03:05:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8201.eurprd08.prod.outlook.com (2603:10a6:10:39c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 03:05:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Thu, 10 Nov 2022
 03:05:34 +0000
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
X-Inumbo-ID: 958613e7-60a4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HIpNMgRsC17X6Tp0uSYNCVapkD960JxzB5+Ep3G9uREBoLtMaP81xCI2scjGLAgAIhQsn7iK2PqK5VdT9bK1CggUwrWAqsf+MxEvBF8OX1MFRN7sN05z8xDw5gAirMR9V8sRYFD5SQ8pn7sVTrBFb4EvOcVnLzxIhQ+SRy2MhpLQDYxETT0EaMfxnnyHZH/sxlZ+reE9B4kKtF3c/77BV/7MT8CQTewtu4U+HpCnoPRb1StJxX9CNjih3quwn3IpP+E8cWEy0jKna0gB1E1vAHw8ZxAPgG7AtxkDV8BXZk5h9zKP+NbgmLTSEQL6etZXq/ss9WVZeMp7rANfvMOruQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6T/Zi4qydpSt+j+KVfiN5hv830EHXUJ5QVqY0FaTg0g=;
 b=nEfVLAncZc0Liwel7PeDlSDyCvlheQj0WAnXN0UBfAwFlm1tPfh0zokf9wmlBA48+rLG29yBn3ouNrZLI8OW6H29hNuIAr1MsoVOQCotdsDxhg+12xYn6AbeOgZExVrABgI6fhsJuh5+rTJp80avGYwMA3Ug6DGXJphhLjdsb209U8C0PDjntbfIda24iWpdRR9nRViKapyQlrJgwTNAkHtUndqFE4lSbm7Y80J0EuWu0UpbeV5I4oi6LPu9a/kf26xvvDjPn0NkWz8q+Bx7v2ScHhNI6lemoyn0VaEsAFdxv10wahxhp7H02tty2cD5XOZDxHULo37tAuO6f+TbcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6T/Zi4qydpSt+j+KVfiN5hv830EHXUJ5QVqY0FaTg0g=;
 b=ieb3K94cZWXviHhY5dkoMrMtDviVFtD/Km/ILtlNFnbQqmw/ZRVS9i0atx8zsKXerxOEMmPEMof2iz7G2oZ8DxpDi5Imz8grG53g6yn+QvRY8yXvwSup/fN8xioS/+ML4VQ8TwOJeJXPOG0T8QGXNyDGBZ2z3nsvAMvC92K+Nbg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AivtbV4+UxK51paCufnvv1y4nuBsTX0JvEaEuWVPpelLyiW3bm1cYxU0zc84Z2iNXz1MVFirJY8NnzFFGw/v+ArTJL58T2zcwU4R1THbZicBObNr/oLWeDr2oPAdSYR1W+qW0IYSTZsn1hw/L2iLt/Cai25wyuE6UWrNi/KsBFSC4lyDxsIzUvOcsrlmvjQX9s1ItwiTJanuTpt3Xl13GkVWsdKK6G0jlGTYGXbDp/GyJB6lSeAewUm6ITEaj7s5taTy1KcW+hBCjgFiG+yLk5kuzok4X/OTEC1WR2w/YVMDU6+sSXzx4AZjrbbzqloEWUxXhDo2pF6TI8TUIQHD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6T/Zi4qydpSt+j+KVfiN5hv830EHXUJ5QVqY0FaTg0g=;
 b=Ok1sMzw66tRHz6SzIw4AzebfffzAHCzA/SY6iqNXysQYxj/u/x/Ov0kaNtWv2Fjygror3q+3LqHDL3x5hBpdkyXSvuzxJW2QRO3CgRoPf8/xktFnhMRIYbS/Ogrc+QtmBdVVVo8cPbiHMZkmNLmD2Pss5/1y7SYG5dtSYVA4N3oOUddhUqcKpeoFdrZcLDnz+OnTtyKa70WkOThuMzO2hGc97/kwRB6MLN0gzaF54S3WzND5tnIQVtB5JobBd5nrzeVmfMUt+HtGAD3ekQJk5M/eBLxOAuUmWyHDDrh8nI1EZngOQrAu/eThdhYbDqqmsRzqtRKkWa35dlmZPN/8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6T/Zi4qydpSt+j+KVfiN5hv830EHXUJ5QVqY0FaTg0g=;
 b=ieb3K94cZWXviHhY5dkoMrMtDviVFtD/Km/ILtlNFnbQqmw/ZRVS9i0atx8zsKXerxOEMmPEMof2iz7G2oZ8DxpDi5Imz8grG53g6yn+QvRY8yXvwSup/fN8xioS/+ML4VQ8TwOJeJXPOG0T8QGXNyDGBZ2z3nsvAMvC92K+Nbg=
From: Henry Wang <Henry.Wang@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH for 4.17] arm: fix Kconfig symbol dependency on arm
 features
Thread-Topic: [PATCH for 4.17] arm: fix Kconfig symbol dependency on arm
 features
Thread-Index: AQHY9EQ4YSVwAsUBfECXaLTd4QdGs643eXug
Date: Thu, 10 Nov 2022 03:05:34 +0000
Message-ID:
 <AS8PR08MB79912E160253413F9C5038FA92019@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221109140420.31007-1-luca.fancellu@arm.com>
In-Reply-To: <20221109140420.31007-1-luca.fancellu@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D00A2AF020131D408DFD83CDEA1E5D1A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8201:EE_|DBAEUR03FT055:EE_|DU0PR08MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e95992-d9b2-4c98-9891-08dac2c87830
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O4hjlYr6sxY2M2F3rkRbDY8EC2qfrnT2kpc0HLnbuj57nh/1Q5y0CXXhFsVLBV65Gh1JCYixUEOsbvRB/85q6143ALseh4iyROLWPQRqQlYIWG5wpWfxUvAQss6MSZnN84deCclqw+93PpAlqpfP/j/0WHYRthyaFz5D2tHg3e8NANEnmnp+7lZSywKvF52yt7GWQgL2K5yBY1MTq0wSUkkVYbf8TPcBfr8keHBhxq2H3GsxBEU7PPjsvOMiOqswEDgqdAQmNa/beILOOzBsigxNDqkfm80NUCne/ZUu0X5081qusgOWv/j8Jy6y7AMe5LwZ7ksqwTyEL2lWOzBEidIj+SH8PsKu0z6p8pRvCabyynXtSm2O0C2sX9MekZqjsP1qO/R8QECgWXFWfQgn3NPKqdHJOeMhqWW/3NFMPsNspfXEJPjaD7AH+4hQ/LSoki0j9jhBUx5qbnXrggQpOiyciCWCP6xGkWhCtAdlQTRrOVufKwtDpeT1PzXgw+4KSd+4IYbMM+UYfvcSi0GlD9R/IZHlqY4jiwkScMMN0sZ4tLvku6BQq/0GB+0Nfa4YZT0E8diAnTyCSji3wHtUyBP27VxR+fDPLAk4O6u/h5HWwKIgB9BnSqHCCsY/mBhSaxMMTDVCzQcLeECrNAwVBOcXd6S7y57DbUoiOKGiO6/11AysGL/+Ksli6ob7TI3OB7jxoMtdIjCQmsCS3hudZWP6m+CyFQ++BhZRAuExilb4iypX1Ce5qMBFVNGnPlDSRRc8j+hzgQdxVwVH9NbC1A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(33656002)(6506007)(7696005)(4326008)(2906002)(38070700005)(4744005)(38100700002)(122000001)(86362001)(8936002)(5660300002)(83380400001)(41300700001)(186003)(52536014)(54906003)(66946007)(66476007)(76116006)(66446008)(316002)(66556008)(110136005)(9686003)(26005)(55016003)(8676002)(71200400001)(478600001)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8201
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7bbea1d-b37a-472f-6dcf-08dac2c86f6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRKJV4b4NC2dG549Hw+IVlvvmE5C4mtNjo9cQWEx9SeSOEtFqNejNUQVOawFO2ylXsxE7hMuJ6EJIY25Id4EVX3KCWb4HAU/Ju4Z+Oynczi4gJaeyNMl6k0GZCvnXHv508MVKXa11hgAFXFTjKVLvYx6eisDUuX4pIUUxOaYqnygfAtQoXrbQ3hzymldSENX8hvyTQAOcEcxTN4cNfhB2nYevCXVXFNRMn+vni+DWRb69MqwPoc9TYKF8Hh11ZPrppQLHdZVOSJqgEVWSf6yR+ULhoFikp+XkoUBgkWNROQhjiz8dzvoATxKAQjs05ZDXD5AMFI/A6JYV77csNn/2Kmg/RpYxZ1ILuQ+VoC3W/g6ALRK8eEOA9HGxsLWHVxpdepuN93Jod12Z2ezeZ9XqEe0dl98jrkkIVTaJjOjAN/3c9QMVkkma9BraKosTF/Dw4ziQ2pOMUn2gUpmb5e7sxgPTX0T/W8WLiXmenDZ9kJ1r/CmTIQMeMv5bdqYXlSSkvpnDeb6hrOaFAKUHUh39RaTxbqQUGiGCDayJgm9rK2XgAFUS+A47Wc6L22Q2G5LUcq3zSST4lagXQJV+ExqdSVabFTojrkadWzLMiSAAwuPFQC4t6duKZ7GnisyxAleAnUonhRY0rq4av6dq+9gK/0NlxlgyYzeOfpGBl2upuhmnd1RrM/7p8Uvsl0sL05PtjGsUg8VW1IHLyzCdoksgzJCCxMWG9PdvLo1C78cUznkGGQRShiyc/Z6RWrBJMomYXthC87Ur7Fx9lAp0aLi+w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(7696005)(47076005)(81166007)(55016003)(33656002)(107886003)(8676002)(54906003)(478600001)(4744005)(356005)(40460700003)(86362001)(82740400003)(2906002)(40480700001)(82310400005)(70206006)(36860700001)(83380400001)(186003)(26005)(336012)(6506007)(9686003)(5660300002)(70586007)(316002)(110136005)(4326008)(41300700001)(52536014)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 03:05:49.1888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e95992-d9b2-4c98-9891-08dac2c87830
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8833

Hi Luca,

> -----Original Message-----
> From: Luca Fancellu <luca.fancellu@arm.com>
> Subject: [PATCH for 4.17] arm: fix Kconfig symbol dependency on arm
> features
>=20
> The commit 3c2a14ea81c7 is introducing some unsupported arm features
> that by default are disabled and are used for the cpufeature.c code.
>=20
> As they are disabled by default, a typo in the Kconfig symbol they
> depend on has landed in the codebase unnoticed, instead of depending
> on ARM64 which does not exist, fix the code to depend on ARM_64 that
> is the intended symbol.
>=20
> Fixes: 3c2a14ea81c7 ("arm: Define kconfig symbols used by arm64
> cpufeatures")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

As IIUC this is a harmless patch, so it is fine to consider this in the rel=
ease,
but I will let the Arm maintainers to do the final call.

If Arm maintainers agree this patch should go to 4.17, feel free to add:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


