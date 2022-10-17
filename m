Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFA600E8D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 14:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424367.671719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okOs6-0006P3-2S; Mon, 17 Oct 2022 12:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424367.671719; Mon, 17 Oct 2022 12:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okOs5-0006MF-Vj; Mon, 17 Oct 2022 12:05:29 +0000
Received: by outflank-mailman (input) for mailman id 424367;
 Mon, 17 Oct 2022 12:05:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rSUT=2S=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okOs4-0006M9-D1
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 12:05:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140087.outbound.protection.outlook.com [40.107.14.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb96896c-4e13-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 14:05:25 +0200 (CEST)
Received: from DB9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:10:1db::26)
 by DB8PR08MB5436.eurprd08.prod.outlook.com (2603:10a6:10:111::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 12:05:22 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::c3) by DB9PR06CA0021.outlook.office365.com
 (2603:10a6:10:1db::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 12:05:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 17 Oct 2022 12:05:22 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 17 Oct 2022 12:05:22 +0000
Received: from bb36d0fe130a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77E54F86-0531-470A-993E-DA014D386CB6.1; 
 Mon, 17 Oct 2022 12:05:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb36d0fe130a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 12:05:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6341.eurprd08.prod.outlook.com (2603:10a6:20b:33f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 12:05:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 12:05:12 +0000
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
X-Inumbo-ID: fb96896c-4e13-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CCtVHFg2VP0b4FSPVPjGA/SJEUmDGbUw8tgOZh/yTO270yfUDz5xc0+PYTIGq/nxnJsnXzJb516LesbHqfelrijLsiQxpJqOXDlOcobzzDjjZ7EDbnlVsfjZcpxXKsg0GK+ZicBFRL9BRshbz5NOPUM5oXIFTFpXPjWdpSF5CrqMSrJ69eDqWKwpxsb0cJtB2mBDcuYbTz1YySj/EjNkZ2BlIVzMukbB4LxeEB/qOM5ZhCW8kZf8+Vaiw3WiGjmyvja1t8sfLHWTK8L5Nnws7qNa61n565oFYYzPxQWldFtY/6u8cWeJWCHbSqbPO7aOX4fS0WO1GwTJHuLWApE6pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViaYpkJ285S/ToBE3N07VDT25bvHeP+Y0SXdvjcaVpQ=;
 b=SazsJT0d4Xc258wDAe0IBEx40A4BzzaICahQFa6za1f5Zu6Gk8PZXVURlGqvqGIJ8uMvoHn2TGBA6yw86ELV6O4g3HpxC6PbverB0DGIDnSvmTGJ+FGwh2DdFKTv5Z1ZwmdS+D3ad5xllLORQBb07aqNyX9U+e+o9xgqWRc/83mu1UY753Irf4GvfkeDx9y/713fNAAcJatI2vHBcqLO6Hif/MIrVcioOP7hGQko2cpY9Hwpkm1jkrL9a3tli6tGn5JW0JSCvO+SW6kX534i2OxJy5RAe4bZpI9u/3do7uOB5m8rRb8P6xbRQawlnXFCjcxb4/g4FyNBLa6deVNFYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViaYpkJ285S/ToBE3N07VDT25bvHeP+Y0SXdvjcaVpQ=;
 b=Gtgm7DCkUJbAwBTyu96M8gZ/7wYaD/KsT8dDbnuKgM9xd+6t6DJ6R+LN9tK9Gdec9UYitcBLxxPbLxsnQgBroqLz5uLWaQqtQurafPZfcrSEKLxRCYqWaQS3hs4pwGqXs+r3oEAVHT+YBW4Z85KgstX3nLV7P/DbQ9GYAAVMlNQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa1KX1HeBkJD3X0Zu1+og/9sXtKhrStJID+AjgwNnJoa3VgObioJOkfJfrLWdTOafbTTiQKv/WLw2ENDAV8LMAIN5WcNRzsksceZfXtNGt5OQa92U0Wf+kf3z6uhEr3iIhYbMDmQ6oPLDYDiOT9RuhSnR/n07/hooFswmu3D3TAOb8zTcWkpdqu3mJ52X9M5/s+71+G1Pg/lydy+4GUDyovyuEKnPJzIcUATNJdCgY6pMchvqO9lamu71Vke8/um0mKHO78bo5FBptcDcU5/M+zQr2NSCIxeDUgtAc8UkWLTEsrcJLTbihtQ5cjmlBpaYjRj6Dn64Yjl/amsFVS8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViaYpkJ285S/ToBE3N07VDT25bvHeP+Y0SXdvjcaVpQ=;
 b=Lq6PqG0NcECQQKWpcRdH6fmt+v1pozZC5GOIPLNjgtWX3LBylGWCEalhhdOJR2oRl/okqSmU47V9yERWznBncxvsqAXM9n361yJJACcifd/LGROBNRzsM5PjQlWZ1DUdXJ0Y1vn2qXIRb3N+gUOWZdGgkl0LYAi5VXFsEtjsoyG3MLOYZYHfNwoGpb2CvB4l7Cdj5kzs4lLalxJr1xLzqDQkQObDE4ZVoSBqlvMdkHFYRYFSMb6kkfc/+tb4X+8mfqLGyzrsCtWUIU+6HF8buobwaHH3MRZGcxMjS9Eu3+vOyzOe6S54Mnu38SSc6HibwIDTHBwdRtIUkxp2rwOUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViaYpkJ285S/ToBE3N07VDT25bvHeP+Y0SXdvjcaVpQ=;
 b=Gtgm7DCkUJbAwBTyu96M8gZ/7wYaD/KsT8dDbnuKgM9xd+6t6DJ6R+LN9tK9Gdec9UYitcBLxxPbLxsnQgBroqLz5uLWaQqtQurafPZfcrSEKLxRCYqWaQS3hs4pwGqXs+r3oEAVHT+YBW4Z85KgstX3nLV7P/DbQ9GYAAVMlNQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Anthony Perard
	<anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH for-4.17] tools: Workaround wrong use of
 tools/Rules.mk by qemu-trad
Thread-Topic: [XEN PATCH for-4.17] tools: Workaround wrong use of
 tools/Rules.mk by qemu-trad
Thread-Index: AQHY4hQDzkROwGW/ykyC81UfQCv+564SfKKAgAAAfKA=
Date: Mon, 17 Oct 2022 12:05:11 +0000
Message-ID:
 <AS8PR08MB7991985DA4CCC9BBDD4A28F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221017103403.63218-1-anthony.perard@citrix.com>
 <e4ea8113-9d93-995d-ad7a-d75fedfe1aaa@citrix.com>
In-Reply-To: <e4ea8113-9d93-995d-ad7a-d75fedfe1aaa@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5503CEBFAC40D549B05396E498364E21.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6341:EE_|DBAEUR03FT016:EE_|DB8PR08MB5436:EE_
X-MS-Office365-Filtering-Correlation-Id: 52581ca7-59f2-42d1-79e1-08dab037de57
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J2+HXOzMo1tDI52c1uD1zo9XaElXXAGjMHW32NKWCLxIAUyIi3XJohGEx2DFqvZHwyulEtjuAG8uoqscwO/67I6Izj/vEPfT+m/nfdkWvSEYbTASdYBhVZxjCyetlvWw5mEukETGVr4FdPR1BFIudZiBNIB0sAfSNrgDPjusuW6X2EJaUYgGENg12VE/CCJ/SGRej0jEeljwjZ+73Kq1aycIAhdTR4Ca+IFWJu0zwajBB2uOkmgx4sSrslZ00UC/9dUXvtAZ2VYmnE7EMA9N/qUDe4zYCvrED3poyaianwz1QNu9i4AasLIE2V7g2S+b4qz0735m8KMgHaxbIMGvjy/EZe55U+Tp+qx1SIcN69lY11xPLP/yVh34086Fdr1Wav2bkMMPBZ+Bv37rJ5SyrzhEB0I/sz26plTKndT8VpVQ7AIr5NEPi+LF0uPlkquNaWWTSXLL0/xi4etbJBV/1MYOrC8EZ008ZCM38Mt9v4QjvQOisFtiuNGeBAuqtG7DQKSG//PVMQTz7G+gNz+Vq7ayqesWsm3hXbwX5Gioz7+hQ6bO7Q9MGsY1Qvt0jKzXmoyuv00R/An4XSQ9QSzxHbEQvX/UYlHmALIBUq6a1Y9p64dWn5++b8n0KP7nmkwYRahEIBjjyheeObYHu2I4UOyq2sSLbIPG52QS9MrZBKoRtfxtjDbCBZlvsaz81/kSbPoyIepUjCUuGvdDEwvfULu/VQMScYFJ3BG5HkAXaRcYriSX3ciwm/JlVVNuUfXuD1zku1010k9rXmlno7DIlg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(38070700005)(122000001)(55016003)(33656002)(86362001)(38100700002)(83380400001)(66946007)(110136005)(76116006)(64756008)(66476007)(316002)(8676002)(66446008)(66556008)(5660300002)(186003)(2906002)(71200400001)(8936002)(6506007)(7696005)(4326008)(478600001)(9686003)(26005)(53546011)(52536014)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6341
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de2d8057-c47a-4502-e8cb-08dab037d7f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EsA29tplxF9muoNsbqtSbWChXQSt9FqG9KNLyF8v62EWRrHSjCxQzCyMgUwZ4fjXT+hX7cxN+U+7W0AL6XEH/5qKx7PiZqoxJI0evI3lQQo5eWOlYAz+SHEjpsLqU2Y7OTmeP7OxIrH4CbxFdbZ/rEH/JHc66+kOOsUVPH8P8WeUc2ZwijCRoBcPDTehTYG4iBfwUO7omkiyh8LttLa/k1T4+WgB+8wuDVFPLLMHxuwckUpSwR5lkSUo8QXPRhUt+9x5RUjS07g/oGEO7KW3e9qbjV6ltUuG5Ioyvql1h8sDCmW3GB66tEL7DHupifPN8bdd2A+U6opO27jEfYo+uhQx+5iQWCGore5rdsvRJ0WYGSQtGzmoGFDaotzxGn2dvfC5kj3AtLQS8y6eSBDz5UKi9jxPsN+nOP741ViRfpErQ58DmOW8iJLcbuhGRDlt4sRo04PkluaBSSjKSr1pqGVI90cbRH8R2SceTnCknN7/2VeD1pFW8DPu0ewBHZVR5jGMVEfhc9WOC+c7vLSzwKeEhaQsCEcu8aMHDOI8rIAfVu1nPkkq0JweBbNNidrro2/q1TigmAkjSIr4k9l6h3ZeiSqSiMJz0nb508pa7E2XRZgtJw26CqQpBqVBKY/8b/qMJowL1BFB2CXgZh8Ld/FfdMfX2AqFImd35tvSWERpxMxU07/RqmJGCBRnvbMnWyItzUfRHTHoahSbwBjgjr6QpvSPxXaw+bc5Xz0kmCVWL+gMSGPcfpk4osY/pVXBy9P9pEsjXrIFixEctqzUnw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(53546011)(478600001)(186003)(4326008)(70586007)(70206006)(47076005)(8676002)(336012)(41300700001)(52536014)(8936002)(5660300002)(82740400003)(356005)(81166007)(82310400005)(36860700001)(2906002)(83380400001)(9686003)(7696005)(26005)(110136005)(316002)(6506007)(86362001)(55016003)(40480700001)(33656002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:05:22.6154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52581ca7-59f2-42d1-79e1-08dab037de57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5436

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IENvb3Bl
ciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYRU4gUEFUQ0gg
Zm9yLTQuMTddIHRvb2xzOiBXb3JrYXJvdW5kIHdyb25nIHVzZSBvZg0KPiB0b29scy9SdWxlcy5t
ayBieSBxZW11LXRyYWQNCj4gDQo+IE9uIDE3LzEwLzIwMjIgMTE6MzQsIEFudGhvbnkgUEVSQVJE
IHdyb3RlOg0KPiA+IHFlbXUtdHJhZCBidWlsZCBzeXN0ZW0sIHdoZW4gYnVpbHQgZnJvbSB4ZW4u
Z2l0LCB3aWxsIG1ha2UgdXNlIG9mDQo+ID4gUnVsZXMubWsgKHNldHVwIHZpYSBxZW11LXRyYWQu
Z2l0L3hlbi1zZXR1cCkuIFRoaXMgbWVhbiB0aGF0IGNoYW5nZXMNCj4gPiB0byBSdWxlcy5tayB3
aWxsIGhhdmUgYW4gaW1wYWN0IG91ciBhYmlsaXR5IHRvIGJ1aWxkIHFlbXUtdHJhZC4NCj4gPg0K
PiA+IFJlY2VudCBjb21taXQgZTRmNTk0OWM0NDY2ICgidG9vbHM6IEFkZCAtV2Vycm9yIGJ5IGRl
ZmF1bHQgdG8gYWxsDQo+ID4gdG9vbHMvIikgaGF2ZSBhZGRlZCAiLVdlcnJvciIgdG8gdGhlIENG
TEFHUyBhbmQgcWVtdS10cmFkIHN0YXJ0IHRvIHVzZQ0KPiA+IGl0LiBCdXQgdGhpcyBmYWlscyBh
bmQgdGhlcmUncyBsb3RzIG9mIHdhcm5pbmcgdGhhdCBhcmUgbm93IHR1cm5lZA0KPiA+IGludG8g
ZXJyb3IuDQo+ID4NCj4gPiBXZSBzaG91bGQgdGVhY2ggcWVtdS10cmFkIGFuZCB4ZW4uZ2l0IHRv
IG5vdCBoYXZlIHRvIHVzZSBSdWxlcy5tayB3aGVuDQo+ID4gYnVpbGRpbmcgcWVtdS10cmFkLCBi
dXQgZm9yIG5vdywgYXZvaWQgYWRkaW5nIC1XZXJyb3IgdG8gQ0ZMQUdTIHdoZW4NCj4gPiBidWls
ZGluZyBxZW11LXRyYWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBX
YW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiAN
Cj4gcWVtdS10cmFkIGlzIGEgdmVyeSBvYnNvbGV0ZSBjb2RlYmFzZS7CoCBXZSBkb24ndCB3YW50
IHRvIGhhdmUgdG8gYmUNCj4gZml4aW5nIGl0IHVwIHRvIGNvbXBpbGUgd2l0aCBuZXcgY29tcGls
ZXJzLg0K

