Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9C4D99CB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 11:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290734.493185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4tE-0000hH-RH; Tue, 15 Mar 2022 10:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290734.493185; Tue, 15 Mar 2022 10:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4tE-0000eJ-NB; Tue, 15 Mar 2022 10:58:56 +0000
Received: by outflank-mailman (input) for mailman id 290734;
 Tue, 15 Mar 2022 10:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG/1=T2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nU4tD-0000GQ-Ky
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 10:58:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe06::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e78b9c32-a44e-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 11:58:54 +0100 (CET)
Received: from AS8PR04CA0117.eurprd04.prod.outlook.com (2603:10a6:20b:31e::32)
 by VI1PR08MB3053.eurprd08.prod.outlook.com (2603:10a6:803:45::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 10:58:45 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::ed) by AS8PR04CA0117.outlook.office365.com
 (2603:10a6:20b:31e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Tue, 15 Mar 2022 10:58:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 10:58:44 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Tue, 15 Mar 2022 10:58:43 +0000
Received: from eac9dcd7204b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2B5BCB34-884A-49C0-8BCA-D8412B6E3A7D.1; 
 Tue, 15 Mar 2022 10:58:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eac9dcd7204b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Mar 2022 10:58:33 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by DB6PR0802MB2440.eurprd08.prod.outlook.com (2603:10a6:4:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 10:58:31 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74%5]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 10:58:30 +0000
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
X-Inumbo-ID: e78b9c32-a44e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2iUBtFb6wgOOtVsH/St+g3ZUduNdVvSYAEGJ0srPCg=;
 b=Id2kVXy+WuO9InpcmVDKB3xSwS0u/nqXoBEPzAC72KXtdXCd2eBl1QzESoOeo5yHGH6SDis8DwvCjauf8uA6a/t2K5g/5mLIwuxruJvneoSmGrS4xD2s8Dws3og7WUudlIxKfiCUGgEL/9WJyDVglwAlZHXusUsp37VPa7wcZ9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b9c94ea2f3c22ef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAhf/8EDQ9HR0kxHdbrPyws7Ophmmz+qpMwupQJ9ulHkDUcmPPF1VACo2JCNHIvKXJ+4DNvAymKGzjdu2WVuOvVfOfTiZYNbvuWPhdNTUWxOc0r52jWRMR8d0zw+W0CyJ/Vm/4IhG3AlraCxLQIbqdvPf/W3vKO2D+WnZF334bAatk66UyzTFiVEuhoqG1p2jS0KJ2+OGji0ku5SddNp3S6i16hNjVtwduk5KW9d+ujrBV0Gl4LOdJXUhLbJkQ30yo1hihhzXRimgAy68hmWspFrqEahMZZ6x8DTcRBDXkmNq6ojYx4P/lzrxEUM/2AWoYkwRdCVFKT+YtPe7LhAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2iUBtFb6wgOOtVsH/St+g3ZUduNdVvSYAEGJ0srPCg=;
 b=LuuhEKwrAcuSdVxez9E9L9vBeUGSFY9beG98J0uv233U/dUlwmOOV4hngIXOYPm2zBpF3ccJNJoSqJ4rmmd4UMu6QbOMvYrUufOr9ssi/Wo6L1WPqHOsYQDh49++wTshcbbyPfUm1BSATs1XjdEsXhNEia2hp76l2yxTeT8QyLIy3m/q0gkwrO7/J9LfkJemmiwwO0eYLPK8u3tMXTkLgkIoFVkP4bEtq+wdAxYfCUScJOSgMoJLRVA4TyVGHPennxbq5lePEiEgWJ0ZEfhAo/24jqKofTSLbBH/3xo8WT0vIanulYYNfok5OWnZHBhDUnv9tftXrfjvfr3MNtKTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2iUBtFb6wgOOtVsH/St+g3ZUduNdVvSYAEGJ0srPCg=;
 b=Id2kVXy+WuO9InpcmVDKB3xSwS0u/nqXoBEPzAC72KXtdXCd2eBl1QzESoOeo5yHGH6SDis8DwvCjauf8uA6a/t2K5g/5mLIwuxruJvneoSmGrS4xD2s8Dws3og7WUudlIxKfiCUGgEL/9WJyDVglwAlZHXusUsp37VPa7wcZ9Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v3 13/14] tools/libs/light: Implement new libxl
 functions for device tree overlay ops
Thread-Topic: [XEN][RFC PATCH v3 13/14] tools/libs/light: Implement new libxl
 functions for device tree overlay ops
Thread-Index: AQHYMyVytmqJkB3Zs0+KbfmENe/kvazAUOoA
Date: Tue, 15 Mar 2022 10:58:30 +0000
Message-ID: <ED974219-775B-47D4-8EF5-63F0068EF632@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-14-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-14-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3dcf5d55-af51-4eb3-51c4-08da0672c5f4
x-ms-traffictypediagnostic:
	DB6PR0802MB2440:EE_|VE1EUR03FT006:EE_|VI1PR08MB3053:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB30534EDB414CCBC04A709D68E4109@VI1PR08MB3053.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ksJ/QYkchDMPdSI70x7TFVSo3Pf4Tz2EruRj5umfH+26KbBn5DrP+epRXKpI9o/OBYaCfS2BMnLpmKpbXrawt3MFYia/IjUq4VM1R50+fylIe31yYmug5PJ7jm1WiE5pCR2fYMTzch6ek6IA8WnWo6K6i5fnvwxbTPauZXeDy2hSStAO6DpihirkN49iJwEtXKTyw6w/qo9pQpbdcbSY8DEem/ygv+EPHpeRTcr7vnI2bTytfAH2CcloeGp+haAZT5I+5W8f6UGi6wgGCWw9pihJRhRb7gw4tq8vfrS4MFPQbFuvedYnbDpfHs0NuQv53G1UdL4S8gsMfoILzvsoatGLhYWli19d2xuev5nb/LW3uR+iyxntpt9MZzyPxU1iQmfjhvXSDAUhmjmQPF1q6/q/sFvz06XL3wsmG2734FksprhPvHpKfDOrh/WHuzoiFGxVdqpevAJVF6KjTlht5Hc40bERow8SKXh0veKuVir9LaqrZn/DpxNyEDfA3TyjbfOV8rUNGZFgHz7XW71/4xf6r0BY9xwJpoKI+nehCDUYzOFgen7nYBLik3l7ONLKxZoJ3S5PHWFs7KE9BKvW0x6AGwnd21g7Z6f351xMU0kOAsbRXb/f4Awl7cnAwJeo/GJFv//oWggFW81OnZfEXijxrdkdE3bzE1NXzpGFVqPDML/OybTKJbuk1X0p7MKvv8Jo3xHgeSAofOmiOTS9WPmbjeOf7J2WP4KGxcLK/TdBswAo2ZcMpd/RPAJfcASQ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(316002)(122000001)(8676002)(26005)(186003)(83380400001)(71200400001)(4326008)(38100700002)(6916009)(6512007)(86362001)(54906003)(33656002)(6486002)(38070700005)(558084003)(5660300002)(2906002)(6506007)(66946007)(91956017)(53546011)(66446008)(64756008)(66476007)(66556008)(76116006)(508600001)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A1CECB081D3E04989F60E10440D0251@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2440
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46a15ba0-ff3b-403d-a09d-08da0672bdec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bsNfAi0FgWJmNnM4D1ucQ+aIGQsP43If+9VWdDC1IW22IOvOVYqk8S6nLizeW5HJiAK1DTUx8u+0eq4WpaeuZJwjC018IDXX8n7OXTOkhKf3vOivMHNanxqDEJBTQRnHDmDO+i2aMQrM2ogWq3b2nT1Tt+7tHJSasMSLJZhbffZXsjAP/kQjLd5+CSIjGxTSEZ+FJ/29iZD3kbts7X5z6tKmT/AFYcqUwX/ReqYwaLEQsDQgqiHO2RaatVz2TI3fx/L47KQQ/QvJXxGY3Lpitr3Iaq51b19yaqdJm8xpZRDgMnbJ6ZEC0K4JBd5Dl+LOToRnbU+dmK/Xdxsco/obnppLIlQU2Vka2lmHiz4Je9ED8BhP5BPKmUvN1X7MTZFLkJmGNRU54K9KkeC8zUAKh2j4FIPKo7hcA1OqX5MsfgFb66NTCWEZNnK4gfrC4s2clFcqR6K8Dtz5rHGDuhgKkiEw7srR5tn45921G2g1ZuKKGr57CA8KGNho6j4qyKxKnalvDqOD1RbNB5g71Cn7kMwvP1tRs04hJm/qbhcV/DPW0unJr4/uVRJs3ieb+fewflXG4NkQX9xxxA8W4RpvF0GX7v43NcqXCgJPWX9sBmJkssPoW1rtQSsqrPpAZrp4LF2t78vyKoCnskfsUPeJzo6yh4VQH2ddy/9rh1FkWvmlTJUF/f5h4wIehsNvuuAf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(53546011)(6506007)(6486002)(6862004)(4326008)(8676002)(336012)(54906003)(26005)(186003)(508600001)(558084003)(82310400004)(107886003)(33656002)(36756003)(8936002)(47076005)(5660300002)(70586007)(70206006)(83380400001)(316002)(2906002)(356005)(36860700001)(81166007)(2616005)(6512007)(86362001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 10:58:44.2414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcf5d55-af51-4eb3-51c4-08da0672c5f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053

DQoNCj4gT24gOCBNYXIgMjAyMiwgYXQgMTk6NDcsIFZpa3JhbSBHYXJod2FsIDxmbnUudmlrcmFt
QHhpbGlueC5jb20+IHdyb3RlOg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlrcmFtIEdhcmh3YWwg
PGZudS52aWtyYW1AeGlsaW54LmNvbT4NCg0KSSBkb27igJl0IGtub3cgaWYgYW4gZW1wdHkgY29t
bWl0IG1lc3NhZ2UgaXMgb2sgaGVyZSwgd2lsbCBsZWF2ZSB0byB0aGUgbWFpbnRhaW5lcg0KdGhl
IGNob2ljZSwgZm9yIG1lIHRoZSBjb2RlIGxvb2tzIG9rDQoNClJldmlld2VkLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0K

