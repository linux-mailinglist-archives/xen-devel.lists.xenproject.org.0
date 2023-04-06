Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EAC6D8EF9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 07:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518727.805541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkIZp-0006iR-J3; Thu, 06 Apr 2023 05:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518727.805541; Thu, 06 Apr 2023 05:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkIZp-0006fS-Fg; Thu, 06 Apr 2023 05:54:29 +0000
Received: by outflank-mailman (input) for mailman id 518727;
 Thu, 06 Apr 2023 05:54:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Amx=75=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pkIZn-0006fG-Hx
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 05:54:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b0ca530-d43f-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 07:54:23 +0200 (CEST)
Received: from AS8PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:20b:311::10)
 by AS8PR08MB5896.eurprd08.prod.outlook.com (2603:10a6:20b:294::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 05:54:11 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::32) by AS8PR05CA0005.outlook.office365.com
 (2603:10a6:20b:311::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30 via Frontend
 Transport; Thu, 6 Apr 2023 05:54:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.18 via Frontend Transport; Thu, 6 Apr 2023 05:54:10 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 06 Apr 2023 05:54:10 +0000
Received: from a116dc8fa01a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD35CB03-1301-47DC-8E1F-83A78E497BA7.1; 
 Thu, 06 Apr 2023 05:54:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a116dc8fa01a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Apr 2023 05:54:04 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by PA4PR08MB5966.eurprd08.prod.outlook.com (2603:10a6:102:ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 05:53:57 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7b58:72de:8c37:5104]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7b58:72de:8c37:5104%6]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 05:53:57 +0000
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
X-Inumbo-ID: 7b0ca530-d43f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY4jx1GTbRwnlCdCm9O33GMybE9G6DdERn2IfAZfgFw=;
 b=kvuJATbuFyao9DC3bMq24h1W6Vx+mpnaDSVteW7unkqYr8nuS7z5zo9Kw8OTAlGLo0l1X33aKWAmifosElXgmyPGBFqRwMpZQk0YZRNLfKimG/JEmb8daX1ImguN6yJyD14sHItdH2xqBKm0xPQzr6IqXNKWKiLSaFf9aSCqa+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3424a9ff9d72e78
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+ui8UZbw7a/YVI/klLz5RrvgL8pEzPkNOamcMK0MT7T5/lRjVL2/JVAx2RmQQ81Ij4JEE5UTUEbIH/VQdAE34TTvKOwNw1rdfnjRnf9E5zVn8Fispc6LF6MaOfsMi5m8UulsFCSKPquh+Tom44lVMeHwEbpGD4HHLDerXuJYXlYgs7tTqS/UOvT2uVXc9Tjw4x++MIpRpjnbAPQwoo5W9sz3cgZjSEtyTelYqGgDQSDpnAe5pEyUomDODpwfsEDh35JatM41dR6AH4sqY8IIcARH9nUAxGJx0Xa0XJgky/AM7og8p5NQUiGwotARNdCxxKs8tSf7em9b9WSXdPJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY4jx1GTbRwnlCdCm9O33GMybE9G6DdERn2IfAZfgFw=;
 b=GXrMu+W94DMnFE1sX23cZWTeGOznRY8o7HXB7WR+OVckROmZ5UqO/etVtGlSiIMffsT1iB1y0s7n5b42Y31ZNMOcGNke7yG0QFwg5P0+q/09kduMbgd2YDLJlRLJaUrDBROc7rDoJZODnVhH/O4swFz8tZDxQ5Bmp79Zqmhk8R80bNH4T+bDc2709X3dTpTST7gkc+O5lB4B2WVBwAW6qPFzRyEldtbm+qTTZDlbQgCuFotYXgI8TmD/yxpcbbiRtoKxNhRE8zB+TDDQFwyAqtXDmnsZ1ik1/GM9sN8xiJczfKsCvMlIDgVRk5Y0W9uYSNNmU8b2Iwdn3MKq1kEzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY4jx1GTbRwnlCdCm9O33GMybE9G6DdERn2IfAZfgFw=;
 b=kvuJATbuFyao9DC3bMq24h1W6Vx+mpnaDSVteW7unkqYr8nuS7z5zo9Kw8OTAlGLo0l1X33aKWAmifosElXgmyPGBFqRwMpZQk0YZRNLfKimG/JEmb8daX1ImguN6yJyD14sHItdH2xqBKm0xPQzr6IqXNKWKiLSaFf9aSCqa+w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@cloud.com>
Subject: Re: [PATCH v4 10/12] xen/tools: add sve parameter in XL configuration
Thread-Topic: [PATCH v4 10/12] xen/tools: add sve parameter in XL
 configuration
Thread-Index: AQHZYJtmX5JG1Zpok0mjr+irvDjf6q8U92AAgAY/qICAAap2gIAA9ZmA
Date: Thu, 6 Apr 2023 05:53:57 +0000
Message-ID: <15401568-22E5-48B0-8F8C-9CBC50BF883A@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-11-luca.fancellu@arm.com>
 <9bd2924b-bb4a-440d-ae31-0253e66c56e5@perard>
 <328A9CBD-5FCE-481B-93AF-D139963488D5@arm.com>
 <8921a9ca-7284-44ce-8ce5-bc631b0980d6@perard>
In-Reply-To: <8921a9ca-7284-44ce-8ce5-bc631b0980d6@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|PA4PR08MB5966:EE_|AM7EUR03FT017:EE_|AS8PR08MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: a64e1e91-1b54-4382-1229-08db36635812
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CDWvoQ4DIhztbTfWtCBkcfvEKHYM3swLmQXFgZ5IZ9WPAdihAC08vwTlkUDwl2jZeAcwQ6IaHeGulVdvhb0WM5BVm4FBfAlMf82A+vSSPY2a2Y3qmSPa3EEAMK5jBq/8IdgWz30B963rfjXuYpb/znzuXP78kXqM8Kzf7GnZmJ4+7zudy5XMB/wIQXqfuTkdkjw8LZpbqnNyaQnnu5QyGVZ8Bt1sSWD1YtOVe/Yd3gSWKkBMx4hlD/OhlSgkaOw1XooyMmS5E3DnWAkEeuT5NBPTYR1W9pFP8n2sqtyzPkYDPG9AzcJmziBkMnAFdH+5bZu/BLgFLXhqYOxysvK5yn+VR47zXjqyjxNmLSAcSvwDuUUelZgZWF2YcabdFNdyct1mjM7vuafEjid7n7Q/wKsMj7V9oJLgWBoa/dH1RB+9fsq52/SLov7ZBT7HffARLfsGa9g9JCs7oyi2EWpEFLyPJV2RIRDr4nEjH3u3IjsIMkOAX0fW4rf+vjNActp7r9qg0Nja+yKghvt7zOJ/mff8b9wTqsEQ5WIIKatGQ04GRDc4cTNkOuOmHF/djtFsl4vRrtTafeRZv52JZ0jx/QQrL/tQDdMNwcsAtY8AQmwM/dw+bwHgVgPAQO/pgr7nONmmkPoKKJT5GmfD5qT2NA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(2906002)(36756003)(38070700005)(40140700001)(33656002)(86362001)(6486002)(71200400001)(2616005)(83380400001)(186003)(26005)(6512007)(6506007)(76116006)(66476007)(8676002)(66946007)(66446008)(6916009)(41300700001)(66556008)(38100700002)(64756008)(91956017)(122000001)(5660300002)(54906003)(478600001)(316002)(8936002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FC05514D620864F8E8740245053C59B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5966
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27067f1d-4208-44a2-5abe-08db3663500e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YWojoA5nL//zNN9BIfLeRrMmPHfdU8gYjZDAcQt0lZS6rSHYPfeFi7GE/6oG+0aII44DXvEl4/RX7IBEcrwKnRYMeXa54oPSanJs2BQuuwdfDw+22lG13cjR8MVl8zjO7LPiId1WTo8GFoJgwGf/o/kjF+jECb59ke6IiUyJc/g26QTu4hwygIfcfERi6If/jJNqbd0ehCt7ZHQVMbV2B6C3Jwb13f4OtldNxfI7Dy5xn+gmxgRG/OmHloqlx8LmT17J8NNYr6Hz0b1t4hkNFh0nhtQfdT5UwGF3qPk6RF5I2OuVtuMruCzOyf9p3Zl4JOx0nksNs4DivBdKQADcINCpkkOIvJFI2s92JwoXsl05QseicNPjJUDTqnSgrRwe8tf2XOvsI5N4SIOXyViNNVqWlJfI71SQL8WASvC8/IJsz6UEEtmTo2QGjmtYClf5QHQ+bzyo8gGHoDjrh4S0vC/gIXGhgl1sC5/FviUbcKdtp0Je4uGJH5+pDGElqJJR017Oqpy4SYDlFQhYBAzgFvOFmS+LLPMFpQwIreMrhEo1bbwUHww2U+ufu0BaNp+/WjFWAQQ2GZCtwUkvbvP7tq4elTiQF4qoH9Q4H2U29BoLJuJLVZyYL66AezvW1HIwn0I60YF0mqGs5+z+jn5QIs4F+D8tE7mXbjY9BFjni+zEeQ3C5SkB2kycrD3fAhq4AxMRmDagp/f0f7jm0S1z6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(40140700001)(33656002)(5660300002)(2906002)(4326008)(36756003)(40480700001)(82310400005)(356005)(81166007)(41300700001)(6862004)(8936002)(70586007)(8676002)(86362001)(70206006)(82740400003)(2616005)(336012)(47076005)(6512007)(36860700001)(83380400001)(186003)(26005)(54906003)(107886003)(6486002)(6506007)(316002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 05:54:10.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a64e1e91-1b54-4382-1229-08db36635812
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5896

SGkgQW50aG9ueSwNCg0KPj4gDQo+PiBZZXMgSSBjYW4gY2hhbmdlIGl0LCBhIG5lZWQgdG8gZG8g
aXQgYW55d2F5IGJlY2F1c2UgSSB0aGluayBhbHNvIGhlcmUsIHRoZSBzdWdnZXN0aW9uDQo+PiBG
cm9tIEphbiBjYW4gYXBwbHkgYW5kIHdlIGNvdWxkIHBhc3MgYSBuZWdhdGl2ZSB2YWx1ZSB0aGF0
IG1lYW5zIOKAnG1heCBWTCBzdXBwb3J0ZWQNCj4+IGJ5IHRoZSBwbGF0Zm9ybSINCj4gDQo+IFdl
bGwsIGl0J3MgYSBjb25maWcgZmlsZSwgbm90IGEgQyBBQkksIHNvIG1heCBhbGxvd2VkIGhlcmUg
ZG9lc24ndCBoYXZlIHRvIGJlDQo+IHNwZWxsZWQgIi0xIiwgaXQgY291bGQgYWxzbyBiZSAibWF4
IiwgIm1heC1hbGxvd2VkIiwNCj4gIm1heC1zaXplLXN1cHBvcnRlZCIsIC4uLiBTbyBmaWxsIGZy
ZWUgZGV2aWF0ZSBmcm9tIHRoZSByZXN0cmljdGVkIEMNCj4gQUJJLiBCdXQgIi0xIiB3b3JrcyBh
cyBsb25nIGFzIGl0J3MgdGhlIG9ubHkgYWxsb3dlZCBuZWdhdGl2ZSBudW1iZXIuDQoNClllcyB3
aGlsZSB3b3JraW5nIG9uIHRoZSBwYXRjaCBJ4oCZdmUgZm91bmQgdGhhdCBJIGNvdWxkIGRlY2xh
cmUgdGhpcyB0eXBlIGluIExpYnhsOg0KDQpsaWJ4bF9zdmVfdHlwZSA9IEVudW1lcmF0aW9uKCJz
dmVfdHlwZSIsIFsNCiAgICAoMCwgImRpc2FibGVkIiksDQogICAgKDEyOCwgIjEyOCIpLA0KICAg
ICgyNTYsICIyNTYiKSwNCiAgICAoMzg0LCAiMzg0IiksDQogICAgKDUxMiwgIjUxMiIpLA0KICAg
ICg2NDAsICI2NDAiKSwNCiAgICAoNzY4LCAiNzY4IiksDQogICAgKDg5NiwgIjg5NiIpLA0KICAg
ICgxMDI0LCAiMTAyNCIpLA0KICAgICgxMTUyLCAiMTE1MiIpLA0KICAgICgxMjgwLCAiMTI4MCIp
LA0KICAgICgxNDA4LCAiMTQwOCIpLA0KICAgICgxNTM2LCAiMTUzNiIpLA0KICAgICgxNjY0LCAi
MTY2NCIpLA0KICAgICgxNzkyLCAiMTc5MiIpLA0KICAgICgxOTIwLCAiMTkyMCIpLA0KICAgICgy
MDQ4LCAiMjA0OCIpLA0KICAgICgtMSwgImh3IikNCiAgICBdLCBpbml0X3ZhbCA9ICJMSUJYTF9T
VkVfVFlQRV9ESVNBQkxFROKAnSkNCg0KU28gdGhhdCBpbiB4bCBJIGNhbiBqdXN0IHVzZSBsaWJ4
bF9zdmVfdHlwZV9mcm9tX3N0cmluZw0KDQo+IA0KPj4+IA0KPj4+PiArc3VwcG9ydGVkIGJpdHMg
dmFsdWUsIHRoZW4gdGhlIGRvbWFpbiBjcmVhdGlvbiB3aWxsIGZhaWwuDQo+Pj4+ICtBIHZhbHVl
IGVxdWFsIHRvIHplcm8gaXMgdGhlIGRlZmF1bHQgYW5kIGl0IG1lYW5zIHRoaXMgZ3Vlc3QgaXMg
bm90IGFsbG93ZWQgdG8NCj4+Pj4gK3VzZSBTVkUuDQo+Pj4+ICsNCj4+Pj4gKz1iYWNrDQo+Pj4+
ICsNCj4+Pj4gPWhlYWQzIHg4Ng0KPj4+PiANCj4+Pj4gPW92ZXIgNA0KPj4+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
YXJtLmMNCj4+Pj4gaW5kZXggZGRjN2IyYTE1OTc1Li4xNmE0OTAzMWZkNTEgMTAwNjQ0DQo+Pj4+
IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4+Pj4gKysrIGIvdG9vbHMvbGli
cy9saWdodC9saWJ4bF9hcm0uYw0KPj4+PiBAQCAtMjExLDYgKzIxMSw4IEBAIGludCBsaWJ4bF9f
YXJjaF9kb21haW5fcHJlcGFyZV9jb25maWcobGlieGxfX2djICpnYywNCj4+Pj4gICAgICAgIHJl
dHVybiBFUlJPUl9GQUlMOw0KPj4+PiAgICB9DQo+Pj4+IA0KPj4+PiArICAgIGNvbmZpZy0+YXJj
aC5zdmVfdmwgPSBkX2NvbmZpZy0+Yl9pbmZvLmFyY2hfYXJtLnN2ZTsNCj4+PiANCj4+PiBUaGlz
IHRydW5jYXRlIGEgMTZiaXQgdmFsdWUgaW50byBhbiA4Yml0IHZhbHVlLCBJIHRoaW5rIHlvdSBz
aG91bGQgY2hlY2sNCj4+PiB0aGF0IHRoZSB2YWx1ZSBjYW4gYWN0dWFsbHkgZml0Lg0KPj4+IA0K
Pj4+IEFuZCBtYXliZSBjaGVjayBgZF9jb25maWctPmJfaW5mby5hcmNoX2FybS5zdmVgIHZhbHVl
IGhlcmUgaW5zdGVhZCBvZg0KPj4+IGB4bGAgYXMgY29tbWVudGVkIGxhdGVyLg0KPj4gDQo+PiBZ
ZXMgSSBjYW4gZG8gaXQsIG9uZSBxdWVzdGlvbiwgY2FuIEkgdXNlIGhlcmUgeGNfcGh5c2luZm8g
dG8gcmV0cmlldmUgdGhlIG1heGltdW0NCj4+IFZlY3RvciBsZW5ndGggZnJvbSBhcmNoX2NhcGFi
aWxpdGllcz8NCj4+IEkgbWVhbiwgaXMgdGhlcmUgYSBiZXR0ZXIgd2F5IG9yIEkgY2FuIGdvIGZv
ciB0aGF0Pw0KPiANCj4gWWVhaCwgdGhlcmUgbWlnaHQgYmUgYSAiYmV0dGVyIiB3YXkuIEkgdGhp
bmsgbWUgc3VnZ2VzdGlvbiB0byBjaGVjayB0aGUNCj4gc3ZlIHZhbHVlIGhlcmUgd2FzIHdyb25n
LiBJIHN0aWxsIHdhbnQgdG8gaGF2ZSBpdCBjaGVja2VkIGluIGxpYnhsLCBidXQNCj4gaXQgbWln
aHQgYmUgYmV0dGVyIHRvIGRvIHRoYXQgaW4gdGhlIHByZXZpb3VzIHN0ZXAsIHRoYXQgaXMNCj4g
ImxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQiLiBsaWJ4bF9fYXJjaF9kb21haW5fYnVp
bGRfaW5mb19zZXRkZWZhdWx0KCkNCj4gd2lsbCBoYXZlIGBwaHlzaW5mb2Agc28geW91IHdvbid0
IGhhdmUgdG8gY2FsbCB4Y19waHlzaW5mbygpLg0KDQpSaWdodCwgSeKAmXZlIHNlZW4gaXQgYmVm
b3JlIGJ1dCBJIHdhcyB1bnN1cmUgaWYgaXQgd2FzIHRoZSByaWdodCB3YXksIG5vdyB0aGF0IHlv
dQ0Kc3VnZ2VzdGVkIGl0LCBJIHdpbGwgZ28gZm9yIHRoYXQuDQoNClRoYW5rIHlvdS4NCg0KQ2hl
ZXJzLA0KTHVjYQ0KDQoNCg0K

