Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F142C6F63C6
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 05:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529528.823976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQ3b-0005BX-8H; Thu, 04 May 2023 03:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529528.823976; Thu, 04 May 2023 03:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQ3b-00059u-1O; Thu, 04 May 2023 03:55:03 +0000
Received: by outflank-mailman (input) for mailman id 529528;
 Thu, 04 May 2023 03:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABSM=AZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1puQ3Z-00059l-4c
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 03:55:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb4fa2a-ea2f-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 05:54:58 +0200 (CEST)
Received: from AM6P192CA0060.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::37)
 by AS2PR08MB8454.eurprd08.prod.outlook.com (2603:10a6:20b:55a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 03:54:55 +0000
Received: from AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::5a) by AM6P192CA0060.outlook.office365.com
 (2603:10a6:209:82::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 03:54:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT065.mail.protection.outlook.com (100.127.140.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.21 via Frontend Transport; Thu, 4 May 2023 03:54:55 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 04 May 2023 03:54:54 +0000
Received: from 05c584a71ee4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9191A3A7-3D2D-4559-A542-1213A3019919.1; 
 Thu, 04 May 2023 03:54:49 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05c584a71ee4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 03:54:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 03:54:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 03:54:46 +0000
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
X-Inumbo-ID: 6fb4fa2a-ea2f-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRauj12Zeuec/7oL0evdHlgULMSFkh+0FOD2EYPTdzE=;
 b=K9W7WZN/VDfESn/v3wY3Mrf+X1bdrYNCe/Lqd8odEVodM36zPO607yxdtzUem2FBe7FkfqUe6VC3/z4z4JsmHABRQkD2TMF4LIbTMxXszlfmT48PEGwZkhU7vaDGhzKB2GZKUIZKLNpSLC331ZRzy9xCDAfq5m7YNZdGh8EpO1E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBWYzNcrvDlu3EiNS2hqudOQkYDjt1ZtGyhv3wi1ss9ozhBvVyLstzspRkGjp4XXqOwAot+RQa98cdVFe+FCd9dXf+4Q1udwzdCWVNKkeRP7ai3n+wWmCHRyHm2DL+IaetnSNCv1HbOdHLOex7GR2xvIxorGD2NYayaX8suBxwXupMG9576p+AL4iYi5ty7E2zFkGHNc+YVpf9gTTb9mosfSX/kzkNhGSxvppu+GcILXlP7f4oW9fuuwNLGAWrqgpAheW42wGFvWvlPekNJ7TtzbhkiQmDIm2U+ZwDgyat/kOfuRjFpdp5/wGEtJfjlugXzQ7mpn05PtaE/rjgkvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRauj12Zeuec/7oL0evdHlgULMSFkh+0FOD2EYPTdzE=;
 b=l64eiEScDW3RNEWmI97rDn+KEKQ/HKV3Ld4WGF3tWtugHc9GPU1j7XSFCV1OACMb3uNdTfcZrxq9/uXOBa+YZzkh7cS3uHTisUZ97JNk877je849zCmygRYNli7K/FPvkjT0BIzA4gFlQfWlBpncVCycR4NKzfNaC9+Sok9d6NAJLzykuLOqvR110sVGyVyvFPKOKedXEjwPtlr1NJlzOKpCmJoLpWbqg1c6SKA501C9dnCemncfP1dyh5BRJk1DOva56EWMWqwQtMgF7iIPrMh0GvkzsYJGdfkpUdpXFaHjOMNk4+Q5Ps5SEPf3CkpQT21EoI25oTaTTm+WotbJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRauj12Zeuec/7oL0evdHlgULMSFkh+0FOD2EYPTdzE=;
 b=K9W7WZN/VDfESn/v3wY3Mrf+X1bdrYNCe/Lqd8odEVodM36zPO607yxdtzUem2FBe7FkfqUe6VC3/z4z4JsmHABRQkD2TMF4LIbTMxXszlfmT48PEGwZkhU7vaDGhzKB2GZKUIZKLNpSLC331ZRzy9xCDAfq5m7YNZdGh8EpO1E=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: RE: [XEN][PATCH v6 02/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
Thread-Topic: [XEN][PATCH v6 02/19] common/device_tree: handle memory
 allocation failure in __unflatten_device_tree()
Thread-Index: AQHZfU8Zj43F8/qoe0aOSV+uN58JIK9JfX4Q
Date: Thu, 4 May 2023 03:54:46 +0000
Message-ID:
 <AS8PR08MB799168BC091D76E168C9F4E7926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-3-vikram.garhwal@amd.com>
In-Reply-To: <20230502233650.20121-3-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6D50E71DC551B149BE8281E2F88E7FAA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5823:EE_|AM7EUR03FT065:EE_|AS2PR08MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 80667c16-239a-4f66-ffe9-08db4c53526f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ztzKfw5IbwaZPZdvf/NR/xq0XeyqxhdNuhAhgRQsy0Nup/HvPmrylapLIm9dQEZjTkf0lzh8JncWeJ/cU6CMFEcsgitoy+HiV9+1BhDkwUjO60xpC2BIhe3EhYn4RsXV8iE7tCwSzfwMR4auVNX59ISDqP9oyPvLgeuYUSrH9Fdr1w2aAUJAbG1uqPr7T5XZW1MfsNTb4cgS3Vg4j4+gGdiJY9n3vyJfgRx7qAxebXhZRuzyOMP4P1tDeicTRVLxm131/3BEIh+5M0lvQ0QGT1Obi4X9BNm9bm2+s8/PMrtocLlKb6HfJbJOnNVAp58cPuG7U63WleHZnM1E30UG5lIXkFRP8XDYkdXFsgzTEriUUOJZ8E+0uCv5W1OWJGG2OpnlJm0LFTPbbUAASvd4XlzXY4ts5Txjex7hC6hGlGQbtvHmGsS0AdmMuiGuWivur5CnlEZLL36sdiKk3BRC9MhpIdqQvI6QJqFvrgnJzebHTHxClLuyznNjYGeMurqr7h1V9Ehq6RVGMatE/XtBRpPSjFr3h3IkqvEnlU0uOhMlnmB4F9jruHrKHL6kHWvTz3idQl6NT4w/DZnRC8z0NxkDjAef/FOi0L+IEFs3r7oEzeiUHLKliIBWXh8mvv4T
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(136003)(39850400004)(376002)(451199021)(86362001)(33656002)(54906003)(316002)(110136005)(66946007)(66476007)(66556008)(64756008)(4326008)(76116006)(7696005)(478600001)(66446008)(71200400001)(41300700001)(2906002)(55016003)(8676002)(8936002)(4744005)(5660300002)(52536014)(38100700002)(122000001)(38070700005)(186003)(6506007)(26005)(9686003)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab152563-eca1-4fd0-9ceb-08db4c534d33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GmxvWtX6+bJmgQZfHbGfhXAz9WEjM0dQo00VbSLDtO2llWFpphfcuOuNDdAMoC1yFfscobGCzmgaHPTWrNjQjL1K+kabxErI7ngEj/yBRu7voaLfDgb1RUu/3K7WqJnYiH8B4AutxUBpaoSy67HABj2vuHJbDCwMgyxc5X4AXT/DHNjREtAIA6+3Xwmu97fbHZE/s2YkTa69/nmhqh2J84tOApzCHPFCnm4ZrIm9LpaJ8ZTH7sXOiDUYrUQazVUBx3Xhdc+DtTAULbLSMu4PaCVg3Vo2Oyi375n8YIR0S5ryI7jMS67nc0pYZSPTR7lFuraS+bODrZTTLBzBLUjgn9e2QPBGO4f1oPE+3CK71oSQ4qlBelDCZQXRvJenAvZ8Y+fYZzxBbjJtI5d8DqrN9J+jJ5mjWp5HcrvhAslMHNgZF0GXQnKFakkSB+WX5UFnmckf9S/QtDPgvHzJRctA5sPRbWOu6Uib0hSxnArv1jLE5M5A4a6ek/FmStEElAE7TM0G0UiJvnKfiObCeBE/64vuEhELa/4LeDxWQMdo0kWTrolGx9oiSmqIJBj4JNF9hl9uFS35AAWAaSbgt3l+E1MRmyhVyHmYJjBlYZ+T1JRaGRpzXGejC2a2rpH5GjYIag1CO7tE9idOQoZM14qWqvIM/sD2+OeVttAfVAfOoJYWWcOTU0uyT8OeuoU3MFH2Us3yaKqPQA5BAgLKGggI5GyVp/XJbDEcjGuHRt8Rjss=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(8676002)(40480700001)(55016003)(82740400003)(356005)(33656002)(82310400005)(81166007)(34020700004)(70206006)(316002)(41300700001)(4326008)(86362001)(70586007)(478600001)(54906003)(110136005)(40460700003)(7696005)(8936002)(4744005)(2906002)(336012)(52536014)(5660300002)(83380400001)(6506007)(9686003)(26005)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 03:54:55.1500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80667c16-239a-4f66-ffe9-08db4c53526f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8454

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v6 02/19] common/device_tree: handle memory
> allocation failure in __unflatten_device_tree()
>=20
> Change __unflatten_device_tree() return type to integer so it can propaga=
te
> memory allocation failure. Add panic() in dt_unflatten_host_device_tree()=
 for
> memory allocation failure during boot.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

