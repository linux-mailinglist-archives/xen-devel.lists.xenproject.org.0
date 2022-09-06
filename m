Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D25AE638
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 13:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399792.641110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVWUD-0008Nx-9N; Tue, 06 Sep 2022 11:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399792.641110; Tue, 06 Sep 2022 11:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVWUD-0008L9-6E; Tue, 06 Sep 2022 11:11:21 +0000
Received: by outflank-mailman (input) for mailman id 399792;
 Tue, 06 Sep 2022 11:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVWUC-0008L3-3W
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 11:11:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2088.outbound.protection.outlook.com [40.107.104.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0f44cf1-2dd4-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 13:11:17 +0200 (CEST)
Received: from AM7PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:20b:130::28)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 6 Sep
 2022 11:11:15 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::c8) by AM7PR03CA0018.outlook.office365.com
 (2603:10a6:20b:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 11:11:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 11:11:14 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Tue, 06 Sep 2022 11:11:14 +0000
Received: from 2bbe0e0e3cdb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2BE7DDE-FFF6-476F-A834-714134062663.1; 
 Tue, 06 Sep 2022 11:11:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2bbe0e0e3cdb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 11:11:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6343.eurprd08.prod.outlook.com (2603:10a6:20b:337::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 11:11:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 11:11:02 +0000
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
X-Inumbo-ID: a0f44cf1-2dd4-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L43wEP77iEry592Vdss9ekcZFdHFKzjLge9/cxvUqN3Gb7xflPYHoxgGPtmQGhtCcn+K8Ga5KDLT1WKtGbErQfzwN6q1LXFBpdCcBSM3UVh2DpFa3KEjIr1Fhn/KdY5rS5b/iQWIwYfld2wE8uhzy3tlWtzdPkJ8SwW10gmuvjyQEZ2vDzzV+JU5VMvzD7Aho2PWxQHbNQ0ZfNSu6159fbN9aFl87v/XDknGoT4BwbW9MFicXCFZ8k6gKDq7hwUSNQZ5sBCElWySZcPVuunNMq1IoMd+hAqNOm6Kv+b840032OfWE/uSP6INC7OaWH9IaylnZO2Xp1TOIRylqWV4Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIaVykuJDgreJnWqjs2cBJkNRw+ZlF/GYZztbXTqFXY=;
 b=NE1QSnX1hjzVA7R+rk0E1g2lF1MotWpAcfrmKJPIqtyfjpti8u0tT3eKlVVJXpp9wMJC7MBVekcH+KtnEnW/KZEaO18cq00fzrcxplJ/CqUC3ojFznXNmjtFCqT55PbjOT1/KFVT9HCSzW30ifmh+fvYzn0VjLedQU9EsfefqYTYC+9r+mkQPreH+aWfryII62M5vup9RN6NoPZnLHJCz8uYuGTFr2JFlwTMZ2qfg1Uff7icspHq7gBPlUu8fqTsSnlieOlNAXce0F9DMCckKfk7L/A4doCWW2x6xmDfWSlWf3vOcGxccOoovvgoDT6rJttadh7E2ZvzXUynAirXSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIaVykuJDgreJnWqjs2cBJkNRw+ZlF/GYZztbXTqFXY=;
 b=1BKEaBEjIYYd46LHTEF/TX8Fappg5DmeePkFV2nFAX9aIwM+iNQLec1Uv+daECvHXBOiaghr4xSTW5Qr+vXmy59/37voNRa1uxOmvwuOPmA72xSXxgaBnaz9AAUFSyGTtPMuTD8hHKZoBDsfLFzMsmGhgRVhcUhmqyqmGMrKPm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnBk6YfNof9baC6HXotUHlnjHZcNj6+ykRxuugJNNx11C6y76kX1WFTbypM1fVltAE0de2g0thTnAF+36DiwO6hEWBilz2XMMlcKd53a6ZdONEwhnG/MAcpXCAdbrvgH1MP39dl0VLVgJpoZ4NkdO2pOqcbTPIjMS3vsq3vuNEl9pKS/zVXxL8zE0to2oY1ZyeL9jyUyDIv/oehA4kvtrJaXD+bLyhHjopf2n6CWowc5P2B2Vv1+Q02mXuf+1YaVEVDyqnca+C6S6VlLvcU1z6Kv9Osylk5iitm+I8t1KpJpbeJ0J8dD9Q67pjWhrD00pUMwIG0B/F9NVz44rvqC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIaVykuJDgreJnWqjs2cBJkNRw+ZlF/GYZztbXTqFXY=;
 b=cABDTfWLx8RUHcF8eHGzHVXjZTl9o+1ylGEMkK4XpGstXFhmtJnOUbxk2kd1IZ27vzv5qfSiugWwlc2R8BcLevud+9mvFOwgLhRM9IuiwoB99hho/z5hOYKD9TgFT8eYBMiSeb2wpnrPACmmp6BoleS+AbkPnolhVBsZoUFtRs9fQC86Rpw/+PjM3LIP5fJNCeA/O5Rf0TimTCVw4VEkYQBNz+9YWCX15Lasnv6H5rnF/pS1Klk7bFnDxc21RQuoKyG969Mlt2zVmjT2z4wuxxFTAzUeCrGPuMZ0Lh+bx2B0248iOxZLTM96/iQMLxdQuhQBHgMHslvHmbjqONjWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIaVykuJDgreJnWqjs2cBJkNRw+ZlF/GYZztbXTqFXY=;
 b=1BKEaBEjIYYd46LHTEF/TX8Fappg5DmeePkFV2nFAX9aIwM+iNQLec1Uv+daECvHXBOiaghr4xSTW5Qr+vXmy59/37voNRa1uxOmvwuOPmA72xSXxgaBnaz9AAUFSyGTtPMuTD8hHKZoBDsfLFzMsmGhgRVhcUhmqyqmGMrKPm8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and
 heap allocator
Thread-Topic: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and
 heap allocator
Thread-Index: AQHYwPj6dlOKXE+k5kuuj2vKrDnG5K3RJT6AgAB0+PCAAIHpAIAAAbyA
Date: Tue, 6 Sep 2022 11:11:02 +0000
Message-ID:
 <AS8PR08MB7991B12952F889C8C44540D2927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-4-Henry.Wang@arm.com>
 <57082fec-e9ce-eeda-d051-d75a4bc35909@xen.org>
 <AS8PR08MB79915EEF32D662929B1657A3927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e4b2721b-8ddc-080f-e602-a3c02b2a13f8@xen.org>
In-Reply-To: <e4b2721b-8ddc-080f-e602-a3c02b2a13f8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8638985A6F4AB04A943EC4FAB6287BAB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 844ea119-9e50-4791-da31-08da8ff883a1
x-ms-traffictypediagnostic:
	AS8PR08MB6343:EE_|AM7EUR03FT057:EE_|AS8PR08MB6693:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3+XpGdWiqn9/OFx3HPkdwRP9rp8C+Gn4RGlqimnK5Sib47BQ03jvgaDsnB5HCnITDenLw0feckFY+gCMbQCHhF090agEJGMDATsGe5/txgCzZwR7o7OZ1fg47quXUyNamBMgIdO2tg/PiO6M2CiGBIcm2ZkjoD9n1QNAcOfpd7MCs2/J4T/2Efn9B218Ifak5RexoQWVd+nClnEAjTzkbHJs5SBYbZ+/+ABwPFwa7FxzTaGFdehzTv8tSTlFWUnWBNZDUIUJDg9ftYfFNQdAwAnmjxKX2/1+BtB3Dn0/edSXs8scMh+3W8x6tq0GJhlMdEj4mLdYSOcpk8yqdYqrCMtXnWYCDK3fovnMYGbCVKqZCVBywVNI1bF/MNkYrEC4ulThdCCgsqPvgQiYULE+FrJ0RJGDlaa7vCR8S6tn9J2UOBPJCNEfFxWvXEvGKLgYLXrbjVxvbJo7qgujtUq8NUYwXsuoa31akovbsXs3GsJrnyV83SjFFnU5Ua7U00onqduXdkjmrTGyZjhV+gCLWujnYgJogqKlOFrR2aE3iqMDfy0AcACSOpJkSTQ6tW3CXaIEp7+1BH3q86PNiWXH8ArJIHfY5C0+4NsRIc9ajgbb3SAg+OWI0R07Rx99aJKqVdfTb9Rd32gc9TfXW0tHKuS0f8v9sNfuUvqIR9BH1i4oSR/qrTfAHGAhlyOFTvpFLJinhAGbhQ9a5rw0labz9Aum6RU/H68q4LzKavsUjEYlPK0IRNLptD+yfiO5t+ZtjRghzFRZ9pd3wVFGGTzjWA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(9686003)(26005)(5660300002)(186003)(52536014)(8936002)(83380400001)(7696005)(41300700001)(33656002)(71200400001)(86362001)(6506007)(478600001)(38070700005)(2906002)(316002)(66556008)(66946007)(66446008)(66476007)(110136005)(64756008)(8676002)(55016003)(4326008)(76116006)(54906003)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6343
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8c6ed9d-04d2-4e54-bfc1-08da8ff87c1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NAFdPgDp2Gzr1kdiwzGSJzRzFjkh18RhQSNgvMCIL7/yT4hU0Yvv1sphKPlAcWUGw4BnRb8ZFQ9IAGYxsQ9H/w/ZzA4HDxhE0Kao+AeRM6G0NS9Ayb+s9FO+XWewZ8pW4Cb7xcPbjHwvezH4IosRtVYMiwqA6zXMx11Y44ntlxb0020p+p2l0ugOdldIts+PxfEWVKtJMv3832M+o+a3DcA4wgIdhQPBCjVNc/R2aIbZYkos2bqN2QJMwQOc3ifwtMR4EOuMgYaRHZfteDCVJMKA+4ffIKaUZ3FLPu7Zhw3yzwnp6jPnW4j7TmxIgVi2Jk/Hab/KS1yTE7K2H+YUSwnphBkzjh8HGCvzcxKT/9Ff2HuDWCuocXTHlOBYlrJ7LYgct6Q4RwIYVcMCAo4aSHYX06Dx7kW8Iocto2ixJpSvsv07VnCAmr7nlReUhlQjrgP9rWX8ewqNpoEi8t+rpjnGFzcZry6oRrbvb0+HanD+KAsTkD2LiQu7PCY1HLgr4PcshFffhyRk5y/JRuyWQ7hd5OoKFmKoaSOq1StqerM229Nb6cUY6JLZ9KlgpUS6M125Hd6d4RlMK84Yrr6Nf3cAfcWAB8Y9t4Ny8+gdACBEaXmUpNFQu2sk9X6dP4sQT4KbuWispB7rCuEL0UF4kaqhgV7NHYP/H4mgqz2hYCSknc/khiQMKt4edlaYcHOpEnr4h4VIO1ksGZtMD5U4iFaz4PqrrXYvmaDoK+rV5SSWGKEvI2cGmyaY/O+C1hOy1/94b8j69ZK4iVorhPIolg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(40470700004)(36840700001)(46966006)(36860700001)(8676002)(356005)(83380400001)(2906002)(82740400003)(55016003)(81166007)(70586007)(40480700001)(70206006)(4326008)(110136005)(316002)(40460700003)(54906003)(26005)(52536014)(8936002)(5660300002)(478600001)(47076005)(9686003)(336012)(7696005)(6506007)(82310400005)(86362001)(107886003)(33656002)(186003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:11:14.8649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 844ea119-9e50-4791-da31-08da8ff883a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693

SGkgSnVsaWVuLA0KDQpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uIGFuZCB5b3VyIHBhdGll
bmNlLiBGb3IgdGhlDQpwb3B1bGF0ZV9ib290X2FsbG9jYXRvcigpIGNoYW5nZSwgSSBhdHRhY2hl
ZCBteSBjaGFuZ2UgaW4gdGhlIGVuZCwNCmFuZCBwZXJzb25hbGx5IEkgd291bGQgbGlrZSB0byBo
ZWFyIHlvdXIgb3BpbmlvbiBiZWZvcmUgc2VuZGluZyB2Mw0Kc2luY2Ugd2Ugbm93IGhhdmUgbGlt
aXRlZCB0aW1lLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+PiArICAgICAgICB7DQo+ID4+PiArICAgICAg
ICAgICAgYmFua19zdGFydCA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2ldLnN0YXJ0Ow0K
PiA+Pj4gKyAgICAgICAgICAgIGJhbmtfc2l6ZSA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5r
W2ldLnNpemU7DQo+ID4+PiArICAgICAgICAgICAgYmFua19lbmQgPSBiYW5rX3N0YXJ0ICsgYmFu
a19zaXplOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAgICAgIGlmICggYmFua19zaXplIDwgc2l6
ZSApDQo+ID4+PiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+Pj4gKw0KPiA+Pj4gKyAg
ICAgICAgICAgIGFsaWduZWRfZW5kID0gYmFua19lbmQgJiB+KGFsaWduIC0gMSk7DQo+ID4+PiAr
ICAgICAgICAgICAgYWxpZ25lZF9zdGFydCA9IChhbGlnbmVkX2VuZCAtIHNpemUpICYgfihhbGln
biAtIDEpOw0KPiA+Pg0KPiA+PiBJIGZpbmQgdGhlIGxvZ2ljIGEgYml0IGNvbmZ1c2luZy4gQUZB
SVUsIGFsaWduZWRfc3RhcnQgY291bGQgYmUgYmVsb3cNCj4gPj4gdGhlIHN0YXJ0IG9mIHRoZSBS
QU0gd2hpY2ggaXMgbm90IHdoYXQgSSB3b3VsZCB1c3VhbGx5IGV4cGVjdC4NCj4gPg0KPiA+IFll
YWggSSB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4gSGVyZSBJIHdhbnQgdG8gbWFrZSBzdXJlIGV2
ZW4gaWYNCj4gPiB0aGUgZ2l2ZW4gc2l6ZSBpcyBub3QgYWxpZ25lZCAoYWx0aG91Z2ggbGVzcyBs
aWtlbHkgaGFwcGVuIGluIHJlYWwgbGlmZQ0KPiA+IGdpdmVuIHRoZSBzaXplIGNhbGN1bGF0aW9u
IGxvZ2ljIGluIHNldHVwX21tKSB0aGUgY29kZSBzdGlsbCB3b3JrLg0KPiANCg0KU29ycnkgSSBw
cm9iYWJseSBleHBsYWluZWQgaW4gdGhlIHdyb25nIHdheSBpbiBwcmV2aW91cyBtYWlsLCBidXQg
c2luY2Ugbm8NCmNoYW5nZSByZXF1ZXN0ZWQgaGVyZSB0aGlzIGlzIHB1cmVseSBmb3IgZGlzY3Vz
c2lvbi4gSW4gdGhlIGNvZGUgd2UNCmFyZSBzdXJlIGFsaWduZWRfZW5kIGNhbGN1bGF0aW9uIHdp
bGwgbWFrZSBzdXJlIHRoZSBlbmQgYWRkcmVzcyB3aWxsDQpzYXRpc2Z5IHRoZSBhbGlnbm1lbnQg
cmVxdWlyZW1lbnQgd2l0aGluIHRoZSByYW5nZSB0byBhIGFsaWduZWQgKGxvd2VyKQ0KYWRkcmVz
cy4gVGhlIGFsaWduZWRfc3RhcnQgPSAoYWxpZ25lZF9lbmQgLSBzaXplKSAmIH4oYWxpZ24gLSAx
KSB3aWxsIG1ha2UNCnN1cmUgdGhlIHN0YXJ0IGFkZHJlc3MgaXMgZm9sbG93aW5nIHRoZSBzYW1l
IGFsaWdubWVudCByZXF1aXJlbWVudCwgYnV0DQp0aGUgb25seSBpc3N1ZSB3b3VsZCBiZSBpbiB0
aGlzIGNhc2UgdGhlIHN0YXJ0IGFkZHJlc3Mgd2lsbCBiZWxvdyB0aGUgcmVnaW9uDQpzdGFydCwg
aGVuY2UgdGhlIGlmICggYWxpZ25lZF9zdGFydCA+IGJhbmtfc3RhcnQgKSBjaGVjay4NCg0KPiBJ
IGRvbid0IHRoaW5rIEkgYWdyZWUgb24gdGhlIGxlc3MgbGlrZWx5IGhlcmUuIFRoZSByZWdpb25z
IGFyZSBwcm92aWRlZA0KPiBieSBpbiB0aGUgRGV2aWNlLVRyZWUuIEFuZCB0aGVyZSBhcmUgbW9y
ZSBjaGFuY2UgdGhleSBhcmUgaW5jb3JyZWN0DQo+IGJlY2F1c2UgdGhlIHZhbHVlIHdpbGwgYmUg
c3BlY2lmaWMgdG8gYSBzb2Z0d2FyZS9kZXZpY2Ugc3RhY2suDQo+IA0KPiBSZWxhdGVkIHRvIHRo
aXMgZGlzY3Vzc2lvbiwgSSBjYW4ndCBmaW5kIGFueSBhbGlnbm1lbnQgcmVxdWlyZW1lbnQgaW4N
Cj4gdGhlIGRldmljZS10cmVlIGJpbmRpbmcuIEkgdGhpbmsgd2UgYXQgbGVhc3Qgd2FudCB0byBy
ZXF1aXJlIDY0S0INCj4gYWxpZ25lZCAoc28gdGhlIHNhbWUgRGV2aWNlLVRyZWUgd29ya3MgaWYg
d2Ugd2VyZSBnb2luZyB0byBzdXBwb3J0IDY0S0INCj4gcGFnZSBncmFudWxhcml0eSkuDQoNCkkg
YWdyZWUgd2UgbmVlZCB0byByZXF1aXJlIDY0S0IgYWxpZ25tZW50LCBhbmQgY3VycmVudGx5IHdl
IGFyZSBmb2xsb3dpbmcNCnRoaXMgYmVjYXVzZSB3ZSBhcmUgZG9pbmcgMzJNQiBhbGlnbm1lbnQu
IEkgd2lsbCBhZGQgYSBjb21tZW50IGluIHRoZQ0KZnVuY3Rpb24gY29tbWVudCB0byBtZW50aW9u
IHdlIGF0IGxlYXN0IHdhbnQgYSA2NEtCIGFsaWdubWVudCBzbyB0aGF0DQpmdXR1cmUgY2FsbGVy
cyB3aWxsIG5vdCBtYWtlIG1pc3Rha2VzLg0KDQo+IA0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKyAg
ICAgICAgICAgIGlmICggYWxpZ25lZF9zdGFydCA+IGJhbmtfc3RhcnQgKQ0KPiA+Pj4gKyAgICAg
ICAgICAgICAgICAvKg0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgKiBBcm0zMiBhbGxvY2F0ZXMg
eGVuaGVhcCBmcm9tIGhpZ2hlciBhZGRyZXNzIHRvIGxvd2VyLCBzbyBpZg0KPiA+Pg0KPiA+PiBU
aGlzIGNvZGUgaXMgYWxzbyBjYWxsZWQgb24gYXJtMzIuIFNvIHdoYXQgYXJlIHlvdSByZWZlcnJp
bmcgdG8/IElzIGl0DQo+ID4+IGNvbnNpZGVyX21vZHVsZXMoKT8NCj4gPg0KPiA+IFllcywgSSB0
aGluayB0aGUgY3VycmVudCBhcm0zMiBiZWhhdmlvciBpbiBjb25zaWRlcl9tb2R1bGVzKCkgaXMg
d2hhdA0KPiA+IEkgYW0gcmVmZXJyaW5nIHRvLiBJbiBmYWN0LCBJIGp1c3Qgd2FudCB0byBhZGQg
c29tZSBjb21tZW50cyB0aGF0IGV4cGxhaW4NCj4gd2h5DQo+ID4gd2UgbmVlZCB0aGUgZW5kID0g
bWF4KGVuZCwgYWxpZ25lZF9lbmQpIHNpbmNlIHRlY2huaWNhbGx5IGlmIHRoZXJlIGFyZQ0KPiA+
IG11bHRpcGxlIHJlc2VydmVkIGhlYXAgYmFua3MgYW5kIGFsbCBvZiB0aGVtIGNhbiBmaXQgdGhl
IHhlbmhlYXAgcmVnaW9uLA0KPiA+IHdlIGNhbiB1c2UgZWl0aGVyIG9mIHRoZW0uIEJ1dCBmb2xs
b3dpbmcgdGhlIGN1cnJlbnQgYmVoYXZpb3Igd2UgY2FuIG9ubHkNCj4gdXNlDQo+ID4gdGhlIGhp
Z2hlc3QgYmFuayB0byBrZWVwIHRoZSBjb25zaXN0ZW5jeS4NCj4gDQo+IFhlbmhlYXAgaXMgY3Vy
cmVudGx5IGFsbG9jYXRlZCB0aGUgaGlnaGVzdCBwb3NzaWJsZSBzbyB0aGVyZSBpcyBlbm91Z2gN
Cj4gbG93IG1lbW9yeSBhdmFpbGFibGUgZm9yIGRvbWFpbiBtZW1vcnkuIFRoaXMgaXMgaW4gb3Jk
ZXIgdG8gYWxsb3cgMzItYml0DQo+IERNQSBkZXZpY2UgdG8gZnVuY3Rpb24uDQo+IA0KPiBJIGFt
IGxlc3MgY2VydGFpbiB0aGlzIG1ha2VzIHNlbnNlIHdoZW4gdGhlIGhlYXAgaXMgcmVzZXJ2ZWQu
IEJlY2F1c2UgYW4NCj4gYWRtaW4gY291bGQgZGVjaWRlIHRvIGRlZmluZSB0aGUgaGVhcCBzb2xl
bHkgYWJvdmUvYmVsb3cgNEdCLg0KPiANCj4gVGhhdCBzYWlkLCBub3RoaW5nIGluIHRoZSBkb2N1
bWVudCBzdWdnZXN0cyB0aGF0IGRvbWFpbiBtZW1vcnkgd291bGQgbm90DQo+IGJlIGFsbG9jYXRl
ZCBmcm9tIHRoZSByZXNlcnZlZCBoZWFwLiBTbyBJIHdvdWxkIHN1Z2dlc3QgdG8gd3JpdGUgdGhl
DQo+IGZvbGxvd2luZyBjb21tZW50Og0KPiANCj4gIkFsbG9jYXRlIHRoZSB4ZW5oZWFwIGFzIGhp
Z2ggYXMgcG9zc2libGUgdG8ga2VlcCBsb3ctbWVtb3J5IGF2YWlsYWJsZQ0KPiAoYXNzdW1pbmcg
dGhlIGFkbWluIHN1cHBsaWVkIHJlZ2lvbiBiZWxvdyA0R0IpIGZvciBvdGhlciB1c2UgKGUuZy4N
Cj4gZG9tYWluIG1lbW9yeSBhbGxvY2F0aW9uKS4iDQoNClN1cmUuDQoNCj4gDQo+IEFsc28sIEkg
dGhpbmsgdGhlIGRvY3VtZW50YXRpb24gd2FudHMgdG8gYmUgdXBkYXRlZCB0byBjbGFyaWZ5IHdo
ZXRoZXINCj4gdGhlIHJlc2VydmVkIGhlYXAgY291bGQgYmUgdXNlZCB0byBhbGxvY2F0ZSBkb21h
aW4uIElmIGl0IGNvdWxkLCB0aGVuIEkNCj4gdGhpbmsgd2UgbmVlZCB0byBleHBsYWluIHRoYXQg
dGhlIHJlZ2lvbiBzaG91bGQgY29udGFpbiBlbm91Z2ggbWVtb3J5DQo+IGJlbG93IHNvbWUgNEdC
IHRvIGNhdGVyIDMyLWJpdCBETUEuDQoNCk9rIEkgd2lsbCBhZGQgaW4gdjMuDQoNCj4gDQo+ID4+
PiArICAgIC8qDQo+ID4+PiArICAgICAqIE5vIHJlc2VydmVkIGhlYXAgcmVnaW9uczoNCj4gPj4+
ICAgICAgICAgKiBGb3Igc2ltcGxpY2l0eSwgYWRkIGFsbCB0aGUgZnJlZSByZWdpb25zIGluIHRo
ZSBib290IGFsbG9jYXRvci4NCj4gPj4+ICAgICAgICAgKi8NCj4gPj4+IC0gICAgcG9wdWxhdGVf
Ym9vdF9hbGxvY2F0b3IoKTsNCj4gPj4+ICsgICAgZWxzZQ0KPiA+Pj4gKyAgICAgICAgcG9wdWxh
dGVfYm9vdF9hbGxvY2F0b3IoKTsNCj4gPj4NCj4gPj4gRm9yIGFybTMyLCBzaG91bGRuJ3Qgd2Ug
YWxzbyBvbmx5IGFkZCB0aGUgcmVzZXJ2ZWQgaGVhcCAobWludXMgdGhlDQo+ID4+IHhlbmhlYXAp
IHRvIHRoZSBib290IGFsbG9jYXRvcj8gQXQgd2hpY2ggcG9pbnQsIEkgd291bGQgbW92ZSB0aGUg
Y2hhbmdlDQo+ID4+IGluIHBvcHVsYXRlX2Jvb3RfYWxsb2NhdG9yKCkuDQo+ID4NCj4gPiBTb3Jy
eSBJIGFtIG5vdCBzdXJlIHdoYXQgdGhpcyBjb21tZW50IGFib3V0Li4uYXMgaGVyZSB0aGUgY29k
ZSBpcyBmb3INCj4gYXJtNjQuDQo+IA0KPiBSaWdodCwgSSB3YXNuJ3Qgc3VyZSB3aGVyZSB0byBj
b21tZW50IGJlY2F1c2UgeW91IGRvbid0IHRvdWNoIHRoZSBjYWxsDQo+IHRvIHBvcHVsYXRlX2Jv
b3RfYWxsb2NhdG9yKCkuDQo+IA0KPiA+IEZvciB0aGUgcXVlc3Rpb24sIHllcy4NCj4gPiBGb3Ig
dGhlIGxhdHRlciBvbmUsIGRvIHlvdSByZXF1ZXN0IHNvbWUgY2hhbmdlcz8gSWYgc28sIGNvdWxk
IHlvdSBwbGVhc2UNCj4ga2luZGx5DQo+ID4gZWxhYm9yYXRlIGEgbGl0dGxlIGJpdCBtb3JlPyBU
aGFua3MuDQo+IA0KPiBZZXMgSSBhbSByZXF1ZXN0aW5nIHNvbWUgY2hhbmdlIGJlY2F1c2UgSSB0
aGluayB0aGUgY29kZSBvbiBhcm0zMiBpcw0KPiBpbmNvcnJlY3QgKHRoZSBib290IGFsbG9jYXRv
ciB3aWxsIG5vdCBiZSBwb3B1bGF0ZWQgd2l0aCB0aGUgcmVzZXJ2ZWQgaGVhcCkuDQo+IA0KPiBJ
IHRoaW5rIHRoZSBjb2RlIHNob3VsZCBiZSBtb3ZlZCBpbiBwb3B1bGF0ZV9ib290X2FsbG9jYXRv
cigpOg0KPiANCj4gaWYgKCBib290aW5mby5yZXNlcnZlZF9oZWFwICkNCj4gew0KPiAgICAgIGZv
ciAoIC4uLjsgaSA8IGJvb3RpbmZvLnJlc2VydmVkX21lbS5ucl9iYW5rczsgaSsrICkNCj4gICAg
ICAgICBbLi4uLl0NCj4gICAgICAgICBpbml0X2Jvb3RfcGFnZXNfcGFnZXMoKQ0KPiB9DQo+IA0K
PiBOb3RlIHRoYXQgdG8gaGFuZGxlIGFybTMyLCB5b3Ugd2lsbCBhbHNvIG5lZWQgdG8gZXhjbHVk
ZSB0aGUgeGVuaGVhcCBhcmVhLg0KDQpXaGVuIEkgaW1wbGVtZW50IHRoZSBjb2RlLCBJIGZvdW5k
IHRoYXQgdGhlIGFybTMyIFhlbmhlYXAgZXhjbHVkaW5nIGxvZ2ljDQpzb21laG93IGNhbiBiZSBy
ZXVzZWQuDQoNClNvIEkgdGhpbmsgSSB0cmllZCB0byByZXVzZSBhcyBtdWNoIGFzIGN1cnJlbnQg
Y29kZS4gV291bGQgYmVsb3cNCnBvcHVsYXRlX2Jvb3RfYWxsb2NhdG9yKCkgc2VlbSBvayB0byB5
b3U/DQoNCnN0YXRpYyB2b2lkIF9faW5pdCBwb3B1bGF0ZV9ib290X2FsbG9jYXRvcih2b2lkKQ0K
ew0KICAgIHVuc2lnbmVkIGludCBpOw0KICAgIGNvbnN0IHN0cnVjdCBtZW1pbmZvICpiYW5rcyA9
IGJvb3RpbmZvLnN0YXRpY19oZWFwID8NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmYm9vdGluZm8ucmVzZXJ2ZWRfbWVtIDogJmJvb3RpbmZvLm1lbTsNCg0KICAgIGZvciAoIGkg
PSAwOyBpIDwgYmFua3MtPm5yX2JhbmtzOyBpKysgKQ0KICAgIHsNCiAgICAgICAgY29uc3Qgc3Ry
dWN0IG1lbWJhbmsgKmJhbmsgPSAmYmFua3MtPmJhbmtbaV07DQogICAgICAgIHBhZGRyX3QgYmFu
a19lbmQgPSBiYW5rLT5zdGFydCArIGJhbmstPnNpemU7DQogICAgICAgIHBhZGRyX3QgcywgZTsN
Cg0KICAgICAgICBpZiAoIGJvb3RpbmZvLnN0YXRpY19oZWFwICYmIGJhbmstPnR5cGUgIT0gTUVN
QkFOS19TVEFUSUNfSEVBUCApDQogICAgICAgICAgICBjb250aW51ZTsNCg0KICAgICAgICBzID0g
YmFuay0+c3RhcnQ7DQogICAgICAgIHdoaWxlICggcyA8IGJhbmtfZW5kICkNCiAgICAgICAgew0K
ICAgICAgICAgICAgcGFkZHJfdCBuID0gYmFua19lbmQ7DQoNCiAgICAgICAgICAgIGlmICggYm9v
dGluZm8uc3RhdGljX2hlYXAgKQ0KICAgICAgICAgICAgICAgIGUgPSBiYW5rX2VuZDsNCiAgICAg
ICAgICAgIGVsc2UNCiAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICBlID0gbmV4dF9tb2R1
bGUocywgJm4pOw0KDQogICAgICAgICAgICAgICAgaWYgKCBlID09IH4ocGFkZHJfdCkwICkNCiAg
ICAgICAgICAgICAgICAgICAgZSA9IG4gPSBiYW5rX2VuZDsNCg0KICAgICAgICAgICAgICAgIC8q
DQogICAgICAgICAgICAgICAgICogTW9kdWxlIGluIGEgUkFNIGJhbmsgb3RoZXIgdGhhbiB0aGUg
b25lIHdoaWNoIHdlIGFyZQ0KICAgICAgICAgICAgICAgICAqIG5vdCBkZWFsaW5nIHdpdGggaGVy
ZS4NCiAgICAgICAgICAgICAgICAgKi8NCiAgICAgICAgICAgICAgICBpZiAoIGUgPiBiYW5rX2Vu
ZCApDQogICAgICAgICAgICAgICAgICAgIGUgPSBiYW5rX2VuZDsNCiAgICAgICAgICAgIH0NCg0K
I2lmZGVmIENPTkZJR19BUk1fMzINCiAgICAgICAgICAgIC8qIEF2b2lkIHRoZSB4ZW5oZWFwICov
DQogICAgICAgICAgICBpZiAoIHMgPCBtZm5fdG9fbWFkZHIoZGlyZWN0bWFwX21mbl9lbmQpICYm
DQogICAgICAgICAgICAgICAgIG1mbl90b19tYWRkcihkaXJlY3RtYXBfbWZuX3N0YXJ0KSA8IGUg
KQ0KICAgICAgICAgICAgew0KICAgICAgICAgICAgICAgIGUgPSBtZm5fdG9fbWFkZHIoZGlyZWN0
bWFwX21mbl9zdGFydCk7DQogICAgICAgICAgICAgICAgbiA9IG1mbl90b19tYWRkcihkaXJlY3Rt
YXBfbWZuX2VuZCk7DQogICAgICAgICAgICB9DQojZW5kaWYNCg0KICAgICAgICAgICAgaWYgKCBi
b290aW5mby5zdGF0aWNfaGVhcCApDQogICAgICAgICAgICAgICAgaW5pdF9ib290X3BhZ2VzKHMs
IGUpOw0KICAgICAgICAgICAgZWxzZQ0KICAgICAgICAgICAgICAgIGZ3X3VucmVzZXJ2ZWRfcmVn
aW9ucyhzLCBlLCBpbml0X2Jvb3RfcGFnZXMsIDApOw0KDQogICAgICAgICAgICBzID0gbjsNCiAg
ICAgICAgfQ0KICAgIH0NCn0NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

