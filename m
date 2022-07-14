Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0B5747AD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367126.598175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBuli-0000kl-UL; Thu, 14 Jul 2022 09:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367126.598175; Thu, 14 Jul 2022 09:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBuli-0000ic-RP; Thu, 14 Jul 2022 09:04:22 +0000
Received: by outflank-mailman (input) for mailman id 367126;
 Thu, 14 Jul 2022 09:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZjPX=XT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBulh-0000iW-GT
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 09:04:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0eeca05-0353-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 11:04:18 +0200 (CEST)
Received: from FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::18) by
 AM0PR08MB2964.eurprd08.prod.outlook.com (2603:10a6:208:5d::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12; Thu, 14 Jul 2022 09:04:15 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a:cafe::f7) by FR2P281CA0008.outlook.office365.com
 (2603:10a6:d10:a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.7 via Frontend
 Transport; Thu, 14 Jul 2022 09:04:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 09:04:14 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Thu, 14 Jul 2022 09:04:14 +0000
Received: from 8d27ad46e509.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8541CE5F-A3E9-4F1D-86AA-10FC29D60B39.1; 
 Thu, 14 Jul 2022 09:04:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8d27ad46e509.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 09:04:08 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB5235.eurprd08.prod.outlook.com (2603:10a6:208:163::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 09:03:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 09:03:59 +0000
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
X-Inumbo-ID: f0eeca05-0353-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Aiclgq715UvQsaVxRyeYXldxfKn6L9hnH7xZmp3+d19kqPjEJBQ4XwGG9vDFxOstylQJ1fqnotYJpAk88pH/9HAcsRpOqAzq7xZ8b5QUDyCkiWuWRJdMdVyICRaXVjyRG32kFGVzTvlmD93zK+S24mGUphImR3SU+/+CfHwM8LK2gZj8YbcnHukho7/qQX1Ki2xY66KGOJw3mHgaom9ij49PUpbR25rOFzKbkq8PC6mC9R0gqaC8p1fvQ3fcaJuEl1pAkPGB0Bav1pGykUk8VC6y7SYdJZG6/+XhiE0VLwoetbuoV7iD2LsUI+xpTwu5yRGjNGSv75/RwllBM/E8SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hslQ4VZDIgTi9JwMfhJR+um9vEhPPpETHGrRcNjqtfE=;
 b=f6K1HW5Wg7fclhXPoHZU0LyRi64unRcTYxvWiV1OuM6vgMBOCqoySgfbL0RzH0SJqg7drnEJ2PwCcYwQ9fZoNoBMTwg9Oz/2yibAMSoSqk0IeHsJE5Bi7isPaCnqrkFZNbRC2sANl5KJ/rJJcdBN4dD1N66KtUytGefMXg3E8lGN1Wz+kfHombrUwFg0TwyQF2d7pJe5U43D74m9b17obWvX+d3hqTz3Gx8e5pQAMytGBS2IXDT18sPSrdmjCe+obPsq1aVfgmgKW+LbZOcRnAKQsSCigiLQv0bqDXUvaWcHFUw0JxwqHgld5jSxONSBSSgePzZXr2UQVxg4P0yDlQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hslQ4VZDIgTi9JwMfhJR+um9vEhPPpETHGrRcNjqtfE=;
 b=71t6VI667Z248Wv4gIaZYJo1urY05GqGJb4mFTA/YvWemIS+sGETdkmYqEcVQyPU4IN5C4Yy74RmtF847wxFC5wGdIM8cBJDgRBctVXs0jyMSb23FOnN8nOTX9JeIBjvctTUyaPmb9a46xm0W05hhAj43svbQRdK2rvuCHjEdso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB+hiyHxNOSrU+Fv3lyM/D8MXmq07Aw5jQttat/bx4b72dOsNuQhEQ83eWDqreA5Iy5OZqOQv31tdvaTFvAI3gHkQRTYDxxdfQcAdbASpOaWf3VG5bkaCp4O4b8jQRMlUmjG/OiPRdDUUOHlGNOz1VuGvbqlY+4Vn+c3UgEPGFmIxXqvJCATa7T6GGvmSKsAW+kfQLZjIVpr+u7sqVxh3GNuZhS7OQ+6jiUOrBnwsP/D7asy0T6YCo9UcURFayO3/euKsRkZF4x+DofyZlj2e8CaPSvUU1KfG8JUoiPe+QDJkakanakeIuLqHomtaZOUpepqD8dmrwzJyaEMWLkvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hslQ4VZDIgTi9JwMfhJR+um9vEhPPpETHGrRcNjqtfE=;
 b=cbZQaIkTvx810qrfs43R98pURfAqPrfWVz+NT7qghEMoUVG6/giQS4FPzBR+YbaYWX6/8unIBYHriGLlWtXbq5Sx8qnagjvBlfESSsekZ5uH9Iod+PPO3AyGWOEUFaS6dH9BHs9RRXHmm/HsCA7UcrC8RiDLq3zjKLFsPHs9Y1nQInmzpEg6umX8miPEQKavxZiaZSQWlvFTfHl7dFVNVvhzGxDLPKE51d0uloY5s9Le9+nLV9mIMyBHnF2QETY4RLo2/EVPK+2hR2bnpmQ/VssSEEfbqHyM73SL6NouUryWLLoitwtpDkMmVlfKBhdonoj3Nrp303aVSZE53+hI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hslQ4VZDIgTi9JwMfhJR+um9vEhPPpETHGrRcNjqtfE=;
 b=71t6VI667Z248Wv4gIaZYJo1urY05GqGJb4mFTA/YvWemIS+sGETdkmYqEcVQyPU4IN5C4Yy74RmtF847wxFC5wGdIM8cBJDgRBctVXs0jyMSb23FOnN8nOTX9JeIBjvctTUyaPmb9a46xm0W05hhAj43svbQRdK2rvuCHjEdso=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Topic: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Thread-Index: AQHYktrASbKlS5xyGUK27wSgSLVuo616tdwAgALfc0A=
Date: Thu, 14 Jul 2022 09:03:59 +0000
Message-ID:
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
In-Reply-To: <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FB7DF25F77EC4F46B4448EB4B51F4BCA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a32222a0-b5d4-4b71-78c2-08da6577d38f
x-ms-traffictypediagnostic:
	AM0PR08MB5235:EE_|VE1EUR03FT006:EE_|AM0PR08MB2964:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YLIrN9TV7HaAeNBRkxtM91xJPZssuNGqFnxqFCexDkVBxGEgBl0lHF18nswQ6S8jFeeMBbBZIt+1ZZijk1I18zWbnjVxlpR1R+DdDrqzDrmb2CpWaAHHkS63SJ2y26El+OElm8v652dKSKlEoalEd6LveuXW449jPsdae6ndoKIgwNlOah49mb5DEnRcw6twQPk0HtarDPKblfMwHCMoHt5htwwl3O6SLRXII99s6XoRsk92HBb9EcS8MiHZAlzf/r0FzJWxM5J7W0hE7cp+GRkN3lt2S3IkSZdkHCHpvaNEWR9PQ0gPaUo+CBY3kmmCDLEdGf5N9ViX0xjXqX3lOq2ikxQiolgsBjKWUwuaA/tGe/zJtXB9HeBaYh+sIlS6u1/Ms+o6PaZF+bo8H1x55fyv3VKfkNsZxZyMI4DhKwejubY78JFDV9p0/yZz5SBj3x1ZPAqLf0PqIBJJPjron1gzBjVk3WIB06j94Z0PBUvkggBt+/NKiZ0GMZcaDQ4EcQNfmZyYsGBdn6ksu8RBDGiQ9Iqxb5bPKwBYXlD8Ef6BVi/GZn/jnOFhwzqppBh5KLc5fXfDkOE9N7U9X+BhwdxaxT939JBu9OxI1/JzkNNSESXgdk2hf7H+ZFIkwMzf6WopXP+WPVCuA0ltytI4T6oTca3TA5puIOlj3Nt+ICrHG/S3UpJlfeOZYk2vO9I40E4KGRZlXeGnhR+TQtGT19GLj43xGUe0QIR0A32lrvWJscQAjcWmy2PiHnhcWgCGwNDQUbQupF5MRor9Nj7ym+qMyKGRf9MTUKPy1Erq5EgB82Xi2K5sRYVJADYtCDNa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(38100700002)(186003)(122000001)(316002)(38070700005)(54906003)(6916009)(55016003)(52536014)(5660300002)(9686003)(33656002)(478600001)(7696005)(6506007)(41300700001)(83380400001)(53546011)(26005)(86362001)(66446008)(8676002)(76116006)(64756008)(66946007)(66556008)(66476007)(4326008)(2906002)(71200400001)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5235
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d5b2ecb-9691-4fa2-9b3b-08da6577ca38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eFeBKQ1VniN/w0kLdZrFH6gM+vQHCeMjSoZSLd3zqHIS7mdi9D2Vp6T2/ZmbCn2e72DohJIyqJP4o00vx7EBfqGgkYEacnoSvPR9Nj3IUhEynoTxEODEPntQ7YifXStV8kbtT0JlZJ6MwpTSXCiFbmQi6oQfMKXU1t10Dksk2QBjGqfr7iy5i2mjbgE/B3eLjq1RgDpREKrDsAirINMuwm6o+W8GzG72lcJivrl4ZHuBDIHLBHxzkAFBtcgyA6CWbjTQVIxhj78gLjvyRzScP5fyrFtOnZ46HQHMp3Y3cx85rkAd0aSXd6++LkUMUu3qi/aoyHpoJ7yIpw4/HIrjPOtDS0Gc9Qhs/xmUpIFbg/krfn90WDr0GHSJNeza43VcY81VE/d3jo0rFYdLQGPjUdhcllpkgIDlhZbVqsxGXfLCULwsjKImWkFEh4+6zgwRafFNJ69VWy+C20jSHT6kn+QGJ2ONYtzp8CTDot6jti2j9A7pAs+BnRnzwkOr5FSMI3zyz0zpZqw54lC0tErbaywb7gVtNXRwwEVsYQnieDjmBE09BfcV7ZffnHUXyrc77qFm3BCkWnM8CzvjTt1vmFZ14R+YbODf5oJ/XJ3Xa4xEp0h09/yf2YWm6NUz9h2R5Y7gOMjcM3ckHT41vqCu70c41ztx7Ce1A1URkzlBB/oMC9hVyJiQr64O04gUWjUeQOi7t8CXwu5b1LA86Az1F80Du5bxGf3E4yD1lxhyjeQVsncdi8IAAZaBt3deF0GeSU30CmpzLaR7keSd5T7WdDr2U81U7NLuiarczrJjdu8TkDeVlakuNV8TYMXdRWoS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(40470700004)(46966006)(36840700001)(70586007)(47076005)(40460700003)(70206006)(9686003)(4326008)(8676002)(186003)(26005)(7696005)(2906002)(41300700001)(86362001)(336012)(6506007)(8936002)(478600001)(6862004)(52536014)(33656002)(5660300002)(36860700001)(53546011)(40480700001)(54906003)(82740400003)(356005)(316002)(83380400001)(81166007)(55016003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:04:14.9692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a32222a0-b5d4-4b71-78c2-08da6577d38f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2964

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAyMDo0OQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
Mi85XSB4ZW4veDg2OiBVc2UgZW51bWVyYXRpb25zIHRvIGluZGljYXRlIE5VTUENCj4gc3RhdHVz
DQo+IA0KPiBPbiAwOC4wNy4yMDIyIDE2OjU0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBJbiBjdXJy
ZW50IGNvZGUsIHg4NiBpcyB1c2luZyB0d28gdmFyaWFibGVzLCBudW1hX29mZiBhbmQgYWNwaV9u
dW1hLA0KPiA+IHRvIGluZGljYXRlIHRoZSBOVU1BIHN0YXR1cy4gVGhpcyBpcyBiZWNhdXNlIE5V
TUEgaXMgbm90IGNvdXBsZWQgd2l0aA0KPiA+IEFDUEksIGFuZCBBQ1BJIHN0aWxsIGNhbiB3b3Jr
IHdpdGhvdXQgTlVNQSBvbiB4ODYuIFdpdGggdGhlc2UgdHdvDQo+ID4gdmFyaWFibGVzJyBjb21i
aW5hdGlvbnMsIHg4NiBjYW4gaGF2ZSBzZXZlcmFsIE5VTUEgc3RhdHVzOg0KPiA+IE5VTUEgc3dp
dGggb24sDQo+ID4gTlVNQSBzd2l0aCBvZmYsDQo+ID4gTlVNQSBzd2l0aCBvbiB3aXRoIE5VTUEg
ZW11bGF0aW9uLA0KPiA+IE5VTUEgc3dpdGggb24gd2l0aCBuby1BQ1BJLA0KPiA+IE5VTUEgc3dp
dGggb24gd2l0aCBBQ1BJLg0KPiANCj4gSG1tLCB3aXRoIGJvdGggdGhpcyBhbmQgdGhlIGFjdHVh
bCBjaGFuZ2UgSSdtIG5vdCBhYmxlIHRvIGNvbnZpbmNlDQo+IG15c2VsZiB0aGF0IHlvdSd2ZSBl
eHByZXNzZWQgdGhlIHByaW9yIGNvbWJpbmF0aW9ucyBjb3JyZWN0bHkuIE1heQ0KPiBJIHN1Z2dl
c3QgdGhhdCB5b3UgbWFrZSB0YWJsZSByZXByZXNlbnRpbmcgdGhlIDYgKEkgdGhpbmspDQo+IGNv
bWJpbmF0aW9ucyBvZiBvcmlnaW5hbCBzdGF0ZXMgd2l0aCB0aGVpciBtYXBwaW5nIHRvIHRoZSBu
ZXcNCj4gZW51bWVyYXRvcnM/IChJdCBkb2Vzbid0IG5lZWQgdG8gYmUgNiBkaWZmZXJlbnQgZW51
bWVyYXRvcnMsIGJ1dA0KPiBhbGwgNiBleGlzdGluZyBzdGF0ZXMgbmVlZCBhIFtwcm9wZXJdIHJl
cHJlc2VudGF0aW9uIGluIHRoZSBuZXcNCj4gbW9kZWwuKQ0KPiANCg0KU29ycnkgZm9yIHJlcGx5
aW5nIGxhdGVyLCBJIHBhaWQgc29tZXRpbWUgdG8gY2hlY2sgdGhlIGNvZGUgYWdhaW4sDQphbmQg
ZHJldyBhIHRhYmxlIGxpa2UgYmVsb3csIEkgaWdub3JlIHR3byBjb2x1bW5zIHdoZW4gbnVtYV9v
ZmY9dHJ1ZQ0KYW5kIGFjcGlfbnVtYT0xLy0xLiBCZWNhdXNlIHdoZW4gbnVtYV9vZmYgPSB0cnVl
LCBBQ1BJIHNyYXQgdGFibGUNCndpbGwgbm90IGJlIHBhcnNlZDoNCistLS0tLS0tLS0tLSstLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
Kw0KfCBvcmlnaW5hbCAgfCAgY29sMSAgIHwgIGNvbDIgICAgICAgICB8ICBjb2wzICAgICB8ICBj
b2w0ICAgICAgfCAgY29sNSAgICB8DQorLS0tLS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSsNCnxudW1hX29mZiAgIHx0
cnVlICAgICB8ZmFsc2UgICAgICAgICAgfGZhbHNlICAgICAgfGZhbHNlICAgICAgIHxmYWxzZSAg
ICAgfA0KfGFjcGlfbnVtYSAgfDAgICAgICAgIHwwICAgICAgICAgICAgICB8MSAgICAgICAgICB8
LTEgICAgICAgICAgfHggICAgICAgICB8DQp8bnVtYV9mYWtlICB8eCAgICAgICAgfHggICAgICAg
ICAgICAgIHx4ICAgICAgICAgIHx4ICAgICAgICAgICB8ZmFrZV9ub2Rlc3wNCnxlbnVtIHN0YXRl
IHxudW1hX29mZiB8bnVtYV9md19ub2RhdGEgfG51bWFfZndfb2sgfG51bWFfZndfYmFkIHxudW1h
X2VtdSAgfA0KKy0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0rDQoNCk5vdGVzOg0KVGhlIGZvbGxvd2luZyBzY2Vu
YXJpb3Mgd2lsbCBtYWtlIGFjcGlfbnVtYT0wOg0KMS4gWGVuIGRpc2FibGUgQUNQSSB0aHJvdWdo
IGFjcGlfZGlzYWJsZWQgPSAxLg0KMi4gQUNQSSB0YWJsZSBkb2Vzbid0IGhhdmUgU1JBVCwgb3Ig
U1JBVCBkb2Vzbid0IGNvbnRhaW4gQ1BVIGFuZCBtZW1vcnkNCiAgIE5VTUEgYWZmaW5pdHkgaW5m
b3JtYXRpb24uDQozLiBFbXVsYXRlIG51bWEgdGhyb3VnaCAibnVtYT1mYWtlIiBjb21tYW5kIGxp
bmUgcGFyYW1ldGVyLiBCdXQgSSBmb3VuZA0KICAgdGhhdCB3aGVuIG51bWFfZmFrZSBpcyBlbmFi
bGVkLCBjdXJyZW50IGNvZGUgd2lsbCBub3QgcHJldmVudCBBQ1BJDQogICBzcmF0IHBhcnNlcnMg
dG8gcGFyc2UgTlVNQSBpbmZvcm1hdGlvbi4gU28gYWNwaV9udW1hIHN0aWxsIG1heSBiZQ0KICAg
Y2hhbmdlZCBsYXRlci4gSXMgdGhlcmUgYW55IGZ1cnRoZXIgcmVhc29ucyB0aGF0IHdlIHN0aWxs
IG5lZWQgdG8NCiAgIHBhcnNlIE5VTUEgaW5mbyBmcm9tIFNSQVQgdGFibGUgd2hlbiBudW1hPWZh
a2U/IE9yIGNhbiB3ZSBzZXQNCiAgIGFjcGlfbnVtYSA9IC0xIGluIG51bWVfc2V0dXAgd2hlbiAi
bnVtYT1mYWtlIiB0byBtYWtlIHNyYXRfZGlzYWJsZWQNCiAgIGNhbiBwcmV2ZW50IEFDUEkgU1JB
VCBwYXJzaW5nLg0KDQpJZiBtZWV0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucywgdGhlbiBhY3Bp
X251bWEgPSAxOg0KMS4gWGVuIGVuYWJsZSBBQ1BJIHRocm91Z2ggYWNwaV9kaXNhYmxlZCA9IDAu
DQoyLiBBQ1BJIFNSQVQgcGFyc2VyIGNhbiBwYXJzZSBDUFUgYW5kIE1lbW9yeSBOVU1BIGFmZmlu
aXRpZXMgc3VjY2Vzc2Z1bGx5DQogICBmcm9tIFNSQVQgdGFibGUuDQozLiBQYXNzIHRoZSBtZW1t
b3J5IGJsb2Nrcycgc2FuaXR5IGNoZWNrIGFuZCBoYXNoIGNvbXB1dGluZyBpbg0KICAgYWNwaV9z
Y2FuX25vZGVzLg0KDQpUaGUgZm9sbG93aW5nIHNjZW5hcmlvcyB3aWxsIG1ha2UgYWNwaV9udW1h
PS0xOg0KMS4gQUNQSSB0YWJsZSBpcyBkaXNhYmxlZCAgYnkgIm51bWE9bm9hY3BpIiBjb21tYW5k
IGxpa2UgcGFyYW1ldGVyLg0KMi4gWGVuIGVuYWJsZSBBQ1BJIHRocm91Z2ggYWNwaV9kaXNhYmxl
ZCA9IDAgYnV0IEFDUEkgU1JBVCBwYXJzZXIgY2FuIG5vdA0KICAgcGFyc2UgQ1BVIG9yIE1lbW9y
eSBOVU1BIGFmZmluaXRpZXMgc3VjY2Vzc2Z1bGx5IGZyb20gU1JBVCB0YWJsZS4NCjMuIFRoZSBt
ZW1tb3J5IGJsb2Nrcycgc2FuaXR5IGNoZWNrIG9yIGhhc2ggY29tcHV0aW5nIGluIGFjcGlfc2Nh
bl9ub2Rlcw0KICAgaXMgZmFpbGVkLg0KDQo+IEFzIGFuIGFzaWRlIC0gSSB0aGluayB5b3UgbWVh
biAic3dpdGNoZWQiIGluIGFsbCBmaXZlIG9mIHRoZXNlDQo+IGxpbmVzLg0KPiANCg0KWWVzLCBJ
IHdpbGwgZml4IHRoZW0gaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gLS0tIGEveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL251bWEuaA0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9u
dW1hLmgNCj4gPiBAQCAtMjgsMTIgKzI4LDIyIEBAIGV4dGVybiBub2RlaWRfdCBweG1fdG9fbm9k
ZSh1bnNpZ25lZCBpbnQgcHhtKTsNCj4gPiAgI2RlZmluZSBaT05FX0FMSUdOICgxVUwgPDwgKE1B
WF9PUkRFUitQQUdFX1NISUZUKSkNCj4gPiAgI2RlZmluZSBWSVJUVUFMX0JVR19PTih4KQ0KPiA+
DQo+ID4gKy8qIEVudW1lcmF0aW9ucyBmb3IgTlVNQSBzdGF0dXMuICovDQo+ID4gK2VudW0gbnVt
YV9tb2RlIHsNCj4gPiArCW51bWFfb24gPSAwLA0KPiA+ICsJbnVtYV9vZmYsDQo+IA0KPiBNYXkg
SSBzdWdnZXN0IHRvIHN3aXRjaCB0aGVzZSB0d28gYXJvdW5kLCBzdWNoIHRoYXQgIm9mZiIgYmVj
b21lcw0KPiB0aGUgbWVhbmluZyBvZiAwLCBwb3RlbnRpYWxseSBhbGxvd2luZyAhIHRvIGJlIHVz
ZWQgaW4gYSBib29sZWFuLQ0KPiBsaWtlIGZhc2hpb24gaGVyZSBvciB0aGVyZT8gQW5kIHBsZWFz
ZSBvbWl0IHRoZSAiPSAwIiBwYXJ0IC0gaXQncw0KPiBvbmx5IG5vbi16ZXJvIGZpcnN0IHZhbHVl
cyB3aGljaCBhY3R1YWxseSBuZWVkIHNwZWxsaW5nIG91dC4NCj4gDQoNCk9rLg0KDQo+ID4gKwkv
KiBOVU1BIHR1cm5zIG9uLCBidXQgQUNQSSB0YWJsZSBpcyBiYWQgb3IgZGlzYWJsZWQuICovDQo+
ID4gKwludW1hX25vX2FjcGksDQo+ID4gKwkvKiBOVU1BIHR1cm5zIG9uLCBhbmQgQUNQSSB0YWJs
ZSB3b3JrcyB3ZWxsLiAqLw0KPiA+ICsJbnVtYV9hY3BpLA0KPiANCj4gQXMgdG8gdGhlIG5hbWVz
IG9mIHRoZXNlOiBJbiB0aGUgZGVzY3JpcHRpb24geW91IGFscmVhZHkgc2F5IHRoYXQNCj4geW91
IHdhbnQgdG8gcmUtdXNlIHRoZSBjb2RlIGZvciBub24tQUNQSSBjYXNlcy4gV291bGRuJ3QgeW91
IGJldHRlcg0KPiBhdm9pZCAiYWNwaSIgaW4gdGhlIG5hbWVzIHRoZW4gKHJhdGhlciB0aGFuIHBl
cmhhcHMgcmVuYW1pbmcgdGhlc2UNCj4gYW5vdGhlciB0aW1lIGxhdGVyIG9uKT8NCj4gDQo+IEkn
ZCBhbHNvIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGF0IHVzZWZ1bCBzdGF0ZSAibnVtYV9ub19hY3Bp
IiBpcy4NCj4gSSByZWFsaXplIHRoaXMgd2FzIGEgc3RhdGUgZXhwcmVzc2FibGUgYnkgdGhlIHR3
byBvcmlnaW5hbA0KPiB2YXJpYWJsZXMsIGJ1dCBkb2VzIGl0IG1ha2Ugc2Vuc2U/DQo+IA0KDQpJ
IGhhdmUgdXBkYXRlZCB0aGUgbmV3IG5hbWVzIGluIGFib3ZlIHRhYmxlLiBBbmQgIm51bWFfbm9f
YWNwaSINCmlzIG1hcHBpbmcgdG8gIiBudW1hX2Z3X2JhZCIgZW51bSBzdGF0ZS4NCg0KPiA+IEBA
IC01MjgsNyArNTI4LDggQEAgaW50IF9faW5pdCBhY3BpX3NjYW5fbm9kZXMocGFkZHJfdCBzdGFy
dCwgcGFkZHJfdA0KPiBlbmQpDQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgTUFYX05VTU5PREVTOyBp
KyspDQo+ID4gIAkJY3V0b2ZmX25vZGUoaSwgc3RhcnQsIGVuZCk7DQo+ID4NCj4gPiAtCWlmIChh
Y3BpX251bWEgPD0gMCkNCj4gPiArCS8qIE9ubHkgd2hlbiBudW1hX29uIHdpdGggZ29vZCBmaXJt
d2FyZSwgd2UgY2FuIGRvIG51bWEgc2NhbiBub2Rlcy4NCj4gKi8NCj4gPiArCWlmICghbnVtYV9l
bmFibGVkX3dpdGhfZmlybXdhcmUoKSkNCj4gPiAgCQlyZXR1cm4gLTE7DQo+IA0KPiBOaXQ6IFBl
cmhhcHMgZHJvcCAiZG8gbnVtYSIgZnJvbSB0aGUgY29tbWVudD8NCj4gDQoNCk9rLCBJIHdpbGwg
ZG8gaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IEphbg0K

