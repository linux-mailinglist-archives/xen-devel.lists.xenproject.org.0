Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8A419239
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196678.349616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUns4-0007qA-PM; Mon, 27 Sep 2021 10:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196678.349616; Mon, 27 Sep 2021 10:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUns4-0007nH-M5; Mon, 27 Sep 2021 10:28:28 +0000
Received: by outflank-mailman (input) for mailman id 196678;
 Mon, 27 Sep 2021 10:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xxNw=OR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUns3-0007n9-SM
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:28:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc42aca2-1f43-4f06-8309-a1e0a88dfae0;
 Mon, 27 Sep 2021 10:28:25 +0000 (UTC)
Received: from DU2PR04CA0308.eurprd04.prod.outlook.com (2603:10a6:10:2b5::13)
 by DB7PR08MB3865.eurprd08.prod.outlook.com (2603:10a6:10:74::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 10:28:22 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::1e) by DU2PR04CA0308.outlook.office365.com
 (2603:10a6:10:2b5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 10:28:22 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 10:28:22 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Mon, 27 Sep 2021 10:28:21 +0000
Received: from 4899b7a5c6ad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56A48B6A-F6AA-46D0-B004-881EE5B454FB.1; 
 Mon, 27 Sep 2021 10:28:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4899b7a5c6ad.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 10:28:10 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4316.eurprd08.prod.outlook.com (2603:10a6:10:c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 10:28:07 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 10:28:07 +0000
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
X-Inumbo-ID: cc42aca2-1f43-4f06-8309-a1e0a88dfae0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHcV30bC/NM+1UXbmY9tpGQ7gTKZXACVUKrEOY5FYig=;
 b=GfVHKmDIufvi0Zxq6h8fuuqd+tdww2RmHAqmTdHB7nu6Luc4RNsD9dEKloA07b84RLUibNqWYKm42s/0H6fvGzD2roZldZTEdnxPNkCrEtc8KU+iSDnidKUnDmNWDRBgh6K6OSqGDDwbqEKVlt7MViHC3pC+P8ORd7bdHf2OjXs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYPQlvf0TxF7jqHPOLmEHZQG738akV6vx3lcBGiGLPqqeRyA1bFRKAk2z1fN3lDC3/v2QgjpYdnpFLk7sVFihgRUD6YVyEn1Opn1pYm4w98n3mQ52gHJFwa1sbq2zNnaNigcZ9MEfA4PuTx2RHyFnSmer+D3CjwWIGZQ7dmcaK7Hc/xa/4Nir1p696YdLRupSx7T2bNZKCnDhu8uyV6FQzeTnMpR7QRvO8jk/ofvFyvEkN9/WtWq/p3WB4yqKbYcUv/yfPmiZPVtVZfU0o2OOhH4Bgz2iHszOVcYT+DK70ByIt61qw1rrSXM0w8Xw9e9SU+6+/DAbPIOAXrLL57ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EHcV30bC/NM+1UXbmY9tpGQ7gTKZXACVUKrEOY5FYig=;
 b=MV1gykMxGgfTN0VXaR9O6vrPt5ymnUBDZEYu+aLP/QIyOI5wGjkYonU9hxD4Hz9kq8eoXYSvw1pePSEX20+pC8DCqH22bocLlO2Lu7bFuusbOhKAEbU/QGJa9zSYO966SgribLIEfLgwCNl4pF6Fi652BvExzKsAwQaR1GaByPsf54WzHjBDo/qg1cIqmNk0UVQ3da+fE8AMvFhRbpXnK41eLClzg73Gb9rMkAedxprcb0KbdeInNu+VRVo9sLKRUMjCEf2Qigzs/Roh49PMMPcZcZnaVnUpLjhY/8D0bnRmi3wrUEpHIcCS5e7ga2vNjhBfXYuMNgvAS27HdrYu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHcV30bC/NM+1UXbmY9tpGQ7gTKZXACVUKrEOY5FYig=;
 b=GfVHKmDIufvi0Zxq6h8fuuqd+tdww2RmHAqmTdHB7nu6Luc4RNsD9dEKloA07b84RLUibNqWYKm42s/0H6fvGzD2roZldZTEdnxPNkCrEtc8KU+iSDnidKUnDmNWDRBgh6K6OSqGDDwbqEKVlt7MViHC3pC+P8ORd7bdHf2OjXs=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index:
 AQHXsHMtR+l18+MmpE6rl/RjSXTBgquyYmkAgAA2xQCAADnbAIAAKWhQgAAGUwCAAxtPwIABk+Mw
Date: Mon, 27 Sep 2021 10:28:07 +0000
Message-ID:
 <DB9PR08MB6857AB9DBB66A4E02140987B9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
 <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com>
 <DB9PR08MB6857EE6294A1062EE0FAF0289EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
In-Reply-To:
 <DB9PR08MB6857EE6294A1062EE0FAF0289EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D62B2DFA3FA4B740989B8750363DDE61.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 97d8e9b0-0380-41ee-46c4-08d981a18800
x-ms-traffictypediagnostic: DBBPR08MB4316:|DB7PR08MB3865:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3865CB577AA0EB0B59FE0FC69EA79@DB7PR08MB3865.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YR7Rv6dXF4M+1N+lC3aEtmXPllUGx2a+jX+H9ckyftcztI2Go2avFRe/hqJ4cvYm2qP4nFFE0G5wji18CJ24cifhWh7qsAEx54xgcrBreh/AIz0OkKYLJAJhHlNTKOyScjkJ1CpX9vcs9XO3JcnOqFVntcn1hf8n6W6s8yMp4NzvLe5FJ0Bi2WnqgYH3FpdxLQVSCWHPa0ElN67BGjFMBk/EkFp/669C27zKdaii8EVP8SjudIXIjNDxIgc3k+3TxW1hV1rcDmOUrclfCj0l0E8tXc430gUGvr/OQHaJysst7OsCs5kkbPN7ggILv+uSVOMZbK8q4fYjtr48HjhFM0iuj3/Da89IJjgNcACewX94f4UOGtVz3vChcbHrnB8o8F0ROVRpaYzj/ccUy4aYatweirC9MUoPTd9R+VkgYSkxB/RfJMaApSdhJ633YsQbo7CoW6yiriU89f27kEP774SFBSuUtAQ3nPY7MyTB24rKjYpJQ0MSV1DzwCrdRKzpkqHm5qdnRQv1xpzjJf2hQEH8LJfzKMAWU5qXNgce9vcjEMG0lipH5flXoKoK3rBe10zvFcoSSC9tN+Hs2cOF+cTKhHz+KABzmcFX4RaFsnfGaBpFNu++2gq2E2Kuku36rzfepOEF4yW4KWy2QM5eG4FTFIs5A4JNyoK0Rh1EVxApqO9c7RGtgaTG1vhSXdw58zMtVDzYopOFhaLmfqlu+2Jad5gx+NfY1ywlRSNmbYIhFwJzq6QWlFh0/94vJbRX5zYtu8pyEAafMOGWUuwXKnzvdyfZj8K7H0Jf8MeGt8Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(86362001)(54906003)(8936002)(966005)(7696005)(8676002)(508600001)(5660300002)(9686003)(6506007)(53546011)(83380400001)(55016002)(38070700005)(66476007)(33656002)(316002)(66446008)(64756008)(66556008)(76116006)(26005)(122000001)(110136005)(38100700002)(4326008)(71200400001)(52536014)(186003)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4316
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca9d317d-c2ca-45d7-d9bf-08d981a17f6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U9JhNjk5v1ml2qKcC26XqhebBGBcwtTNXHlHNJfsxrKTmxPpyklK0saRonutJjj4q7SCPWemkt+qrUwXyk1KmDrI9xwJbqjAu47Bx/ljkFxhg2sRerz2ybF97oncNsPUONDx1A3wG0cjcb36IaANNO5hCLfFTC5bod+hCkcmIk+MUevg6VNkkFYsuXi2I5YrNqRb9BnLqYrfv54jYwFCj/oKCGVTlPk483o2ShvdolifKoj4e8CDYEGvj+QwxgCZ70/nYn5WGF4bOGTMPu0CTebMPftMWp4VktbkhmhZuCAp0fJ+bQe7C7IzQE6zhnEX9d6X79x6aba0QprWoZrMQ/hhXHZ7UxzTmbAlEz3aRTwgrFJH6N+BprGnWdtq+I3pD71D8FS8seLp9SqAqOD5+dG628FXNj2ekaDl77tI7P6ikjVTzjfwAufNm+80U8fMUCytUWPUc+uv68fwT1DFkRl2kj/h6SHVi0jdTirKpKilqPCXxaglK7McVERWst7GUw0+KxC5MMlaONUqmSwjBmL20s26y5UqFZKxr5/+BfRSlrHSMYAz5Eyz10x4XLLQ+B0gdRJyyUSVpjSbK8DJ4vAuTvtNjPUJN+q2pGO4ajHqGSjGxMnDFY3voOQ5cr2BjNa4DqjbjC8sbPjQxVA7+u9XGOP5H+g9h6mNmeVwivjdRLzA9p40CfhoFJH9BoQjEkS7P+YnTuIsknsHNQlvEiQCdkFUkh3fEjYmAVioq+UU4Qi/h1IXYFIaCeC0lFs2sVGYK3q8bVZmkGrNcmyJn/O+XNRkxpFQNcicdau2tF8=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(9686003)(70586007)(356005)(36860700001)(2906002)(110136005)(47076005)(55016002)(81166007)(8676002)(8936002)(70206006)(26005)(54906003)(7696005)(82310400003)(52536014)(53546011)(966005)(6506007)(107886003)(186003)(33656002)(5660300002)(86362001)(4326008)(83380400001)(336012)(316002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 10:28:22.1013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d8e9b0-0380-41ee-46c4-08d981a18800
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3865

SGkgSnVsaWVuLCBTdGVmYW5vLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9u
IEJlaGFsZiBPZiBXZWkNCj4gQ2hlbg0KPiBTZW50OiAyMDIxxOo51MIyNsjVIDE4OjI1DQo+IFRv
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMjAvMzddIHhlbjogaW50cm9kdWNlIENP
TkZJR19FRkkgdG8gc3R1YiBBUEkgZm9yIG5vbi0NCj4gRUZJIGFyY2hpdGVjdHVyZQ0KPiANCj4g
SGkgSmFuLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFhl
bi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFs
ZiBPZg0KPiBKYW4NCj4gPiBCZXVsaWNoDQo+ID4gU2VudDogMjAyMcTqOdTCMjTI1SAxODo0OQ0K
PiA+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBqdWxpZW5AeGVuLm9yZzsgQmVydHJhbmQgTWFycXVpcw0KPiA+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyMC8zN10geGVuOiBpbnRy
b2R1Y2UgQ09ORklHX0VGSSB0byBzdHViIEFQSSBmb3INCj4gbm9uLQ0KPiA+IEVGSSBhcmNoaXRl
Y3R1cmUNCj4gPg0KPiA+IE9uIDI0LjA5LjIwMjEgMTI6MzEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+
ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiA+PiBTZW50OiAy
MDIxxOo51MIyNMjVIDE1OjU5DQo+ID4gPj4NCj4gPiA+PiBPbiAyNC4wOS4yMDIxIDA2OjM0LCBX
ZWkgQ2hlbiB3cm90ZToNCj4gPiA+Pj4+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4NCj4gPiA+Pj4+IFNlbnQ6IDIwMjHE6jnUwjI0yNUgOToxNQ0KPiA+
ID4+Pj4NCj4gPiA+Pj4+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+
ID4+Pj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+ID4+Pj4+ICsrKyBiL3hlbi9jb21t
b24vS2NvbmZpZw0KPiA+ID4+Pj4+IEBAIC0xMSw2ICsxMSwxNiBAQCBjb25maWcgQ09NUEFUDQo+
ID4gPj4+Pj4gIGNvbmZpZyBDT1JFX1BBUktJTkcNCj4gPiA+Pj4+PiAgCWJvb2wNCj4gPiA+Pj4+
Pg0KPiA+ID4+Pj4+ICtjb25maWcgRUZJDQo+ID4gPj4+Pj4gKwlib29sDQo+ID4gPj4+Pg0KPiA+
ID4+Pj4gV2l0aG91dCB0aGUgdGl0bGUgdGhlIG9wdGlvbiBpcyBub3QgdXNlci1zZWxlY3RhYmxl
IChvciBkZS0NCj4gPiBzZWxlY3RhYmxlKS4NCj4gPiA+Pj4+IFNvIHRoZSBoZWxwIG1lc3NhZ2Ug
YmVsb3cgY2FuIG5ldmVyIGJlIHNlZW4uDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gRWl0aGVyIGFkZCBh
IHRpdGxlLCBlLmcuOg0KPiA+ID4+Pj4NCj4gPiA+Pj4+IGJvb2wgIkVGSSBzdXBwb3J0Ig0KPiA+
ID4+Pj4NCj4gPiA+Pj4+IE9yIGZ1bGx5IG1ha2UgdGhlIG9wdGlvbiBhIHNpbGVudCBvcHRpb24g
YnkgcmVtb3ZpbmcgdGhlIGhlbHAgdGV4dC4NCj4gPiA+Pj4NCj4gPiA+Pj4gT0ssIGluIGN1cnJl
bnQgWGVuIGNvZGUsIEVGSSBpcyB1bmNvbmRpdGlvbmFsbHkgY29tcGlsZWQuIEJlZm9yZQ0KPiA+
ID4+PiB3ZSBjaGFuZ2UgcmVsYXRlZCBjb2RlLCBJIHByZWZlciB0byByZW1vdmUgdGhlIGhlbHAg
dGV4dC4NCj4gPiA+Pg0KPiA+ID4+IEJ1dCB0aGF0J3Mgbm90IHRydWU6IEF0IGxlYXN0IG9uIHg4
NiBFRkkgZ2V0cyBjb21waWxlZCBkZXBlbmRpbmcgb24NCj4gPiA+PiB0b29sIGNoYWluIGNhcGFi
aWxpdGllcy4gVWx0aW1hdGVseSB3ZSBtYXkgaW5kZWVkIHdhbnQgYSB1c2VyDQo+ID4gPj4gc2Vs
ZWN0YWJsZSBvcHRpb24gaGVyZSwgYnV0IHVudGlsIHRoZW4gSSdtIGFmcmFpZCBoYXZpbmcgdGhp
cyBvcHRpb24NCj4gPiA+PiBhdCBhbGwgbWF5IGJlIG1pc2xlYWRpbmcgb24geDg2Lg0KPiA+ID4+
DQo+ID4gPg0KPiA+ID4gSSBjaGVjayB0aGUgYnVpbGQgc2NyaXB0cywgeWVzLCB5b3UncmUgcmln
aHQuIEZvciB4ODYsIEVGSSBpcyBub3QgYQ0KPiA+ID4gc2VsZWN0YWJsZSBvcHRpb24gaW4gS2Nv
bmZpZy4gSSBhZ3JlZSB3aXRoIHlvdSwgd2UgY2FuJ3QgdXNlIEtjb25maWcNCj4gPiA+IHN5c3Rl
bSB0byBkZWNpZGUgdG8gZW5hYmxlIEVGSSBidWlsZCBmb3IgeDg2IG9yIG5vdC4NCj4gPiA+DQo+
ID4gPiBTbyBob3cgYWJvdXQgd2UganVzdCB1c2UgdGhpcyBFRkkgb3B0aW9uIGZvciBBcm0gb25s
eT8gQmVjYXVzZSBvbiBBcm0sDQo+ID4gPiB3ZSBkbyBub3QgaGF2ZSBzdWNoIHRvb2xjaGFpbiBk
ZXBlbmRlbmN5Lg0KPiA+DQo+ID4gVG8gYmUgaG9uZXN0IC0gZG9uJ3Qga25vdy4gVGhhdCdzIGJl
Y2F1c2UgSSBkb24ndCBrbm93IHdoYXQgeW91IHdhbnQNCj4gPiB0byB1c2UgdGhlIG9wdGlvbiBm
b3Igc3Vic2VxdWVudGx5Lg0KPiA+DQo+IA0KPiBJbiBsYXN0IHZlcnNpb24sIEkgaGFkIGludHJv
ZHVjZWQgYW4gYXJjaC1oZWxwZXIgdG8gc3R1YiBFRklfQk9PVA0KPiBpbiBBcm0ncyBjb21tb24g
Y29kZSBmb3IgQXJtMzIuIEJlY2F1c2UgQXJtMzIgZG9lc24ndCBzdXBwb3J0IEVGSS4NCj4gU28g
SnVsaWVuIHN1Z2dlc3RlZCBtZSB0byBpbnRyb2R1Y2UgYSBDT05GSUdfRUZJIG9wdGlvbiBmb3Ig
bm9uLUVGSQ0KPiBzdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcyB0byBzdHViIGluIEVGSSBsYXllci4N
Cj4gDQo+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMjEtDQo+IDA4L21zZzAwODA4Lmh0bWwNCj4gDQoNCkFzIEphbicgcmVtaW5kZWQs
IHg4NiBkb2Vzbid0IGRlcGVuZCBvbiBLY29uZmlnIHRvIGJ1aWxkIEVGSSBjb2RlLg0KU28sIGlm
IHdlIENPTkZJR19FRkkgdG8gc3R1YiBFRkkgQVBJJ3MgZm9yIHg4Niwgd2Ugd2lsbCBlbmNvdW50
ZXINCnRoYXQgdG9vbGNoYWlucyBlbmFibGUgRUZJLCBidXQgS2NvbmZpZyBkaXNhYmxlIEVGSS4g
T3IgS2NvbmZpZw0KZW5hYmxlIEVGSSBidXQgdG9vbGNoYWluIGRvZXNuJ3QgcHJvdmlkZSBFRkkg
YnVpbGQgc3VwcG9ydHMuIEFuZA0KdGhlbiB4ODYgY291bGQgbm90IHdvcmsgd2VsbC4NCg0KSWYg
d2UgdXNlIENPTkZJR19FRkkgZm9yIEFybSBvbmx5LCB0aGF0IG1lYW5zIENPTkZJR19FRkkgZm9y
IHg4Ng0KaXMgb2ZmLCB0aGlzIHdpbGwgYWxzbyBjYXVzZSBwcm9ibGVtLg0KDQpTbywgY2FuIHdl
IHN0aWxsIHVzZSBwcmV2aW91cyBhcmNoX2hlbHBlcnMgdG8gc3R1YiBmb3IgQXJtMzI/DQp1bnRp
bCB4ODYgY2FuIHVzZSB0aGlzIHNlbGVjdGFibGUgb3B0aW9uPw0KDQo+ID4gSmFuDQo+ID4NCg0K

