Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ECE420476
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 01:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201119.355540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXAue-0000AP-Fe; Sun, 03 Oct 2021 23:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201119.355540; Sun, 03 Oct 2021 23:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXAue-00008T-CU; Sun, 03 Oct 2021 23:28:56 +0000
Received: by outflank-mailman (input) for mailman id 201119;
 Sun, 03 Oct 2021 23:28:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jt1B=OX=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mXAuc-00008M-MN
 for xen-devel@lists.xenproject.org; Sun, 03 Oct 2021 23:28:54 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa2bbaf2-24a1-11ec-be8f-12813bfff9fa;
 Sun, 03 Oct 2021 23:28:51 +0000 (UTC)
Received: from AM6PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::14) by AM6PR08MB5237.eurprd08.prod.outlook.com
 (2603:10a6:20b:e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Sun, 3 Oct
 2021 23:28:49 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::65) by AM6PR01CA0037.outlook.office365.com
 (2603:10a6:20b:e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend
 Transport; Sun, 3 Oct 2021 23:28:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Sun, 3 Oct 2021 23:28:48 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Sun, 03 Oct 2021 23:28:45 +0000
Received: from 8ba20bcd8b62.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1228FB6-735E-4D45-B266-965D72DB1E54.1; 
 Sun, 03 Oct 2021 23:28:34 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ba20bcd8b62.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 03 Oct 2021 23:28:34 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3530.eurprd08.prod.outlook.com (2603:10a6:10:4a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Sun, 3 Oct
 2021 23:28:26 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 23:28:25 +0000
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
X-Inumbo-ID: aa2bbaf2-24a1-11ec-be8f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+sl+QmdON37r2Y1vVseZ0fz/o2b+UWWKmtDOBu8j4c=;
 b=mOTeNOIeyeFVnMPrjbeQmhwXa2h//0hBmeti5CLbeZeGdXHYcWgHCcy92k1g2B5s96b1NF9isiQrcEdYq+YaUPfmJIMkQo2N7K66KHUNlF3nZc4pRM4IxvXBWqzoPZXF8qvU71kPA9aTl1AXyOlO0u8VXWeRRpajRGNuDY5GQ8Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag/jpizJH81xOpM7UJRf4qGVIC87NX7MHOEA1kXfGd8uG6I/y6W8qhbKPqj4dRoBWEP2+W209VmLCRhqEDv7+LDedcpBassIIIDiIjApV5SmOjO3cFW9d2YJPjPbIj06Gp3dUkmtQsItFkyc7z7kwkDuGmI6fYWnR8KtumRjmFaz41lc4H1y+hrZmGXgNUj8Vo1ds5QguOzhq/EMH/noxn3lF0ApSfLeRGor30D0HIQTcyUh2X+t41vx/XktmrNPiyCiyFB8srLhimN23SQ25J9eOJMltmvXsgQ0NjXWNQ57qjRAgGu/+fuwxJV+OTvAgOinRCwbn814cZttCoH0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+sl+QmdON37r2Y1vVseZ0fz/o2b+UWWKmtDOBu8j4c=;
 b=eRDRx/5C9l+lZagKMlmmHaS68pyaSZjatIe5XavWpfV+3lXELOBX7sS13/jUycaEJretAO/XgCC0+zufJ1LJP0jCBN+iotd8twDgF/1/iqOnoOJW9wgefGCfqeJ/g4rRu/a5SB5/gosVTPLuhuq42yKnXoz9evSqG6xdFxpOpXbUO4NhOSYXOOu+kbJ0WQBTLq4PrUF0TP2oQqAyqs/hloAQwzfVt/6i+bE0d7aQIBoq+o3bo3YKzNNA9eVue+KJj69Ur8Sy9Agl+nQFIxfOlfWMCoACSRv9/aDHFWoKx/eQGqk4HlflV1pSqvKHDhu5RKDYsglv7qA3mEoZIkowzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+sl+QmdON37r2Y1vVseZ0fz/o2b+UWWKmtDOBu8j4c=;
 b=mOTeNOIeyeFVnMPrjbeQmhwXa2h//0hBmeti5CLbeZeGdXHYcWgHCcy92k1g2B5s96b1NF9isiQrcEdYq+YaUPfmJIMkQo2N7K66KHUNlF3nZc4pRM4IxvXBWqzoPZXF8qvU71kPA9aTl1AXyOlO0u8VXWeRRpajRGNuDY5GQ8Q=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index:
 AQHXsHMtR+l18+MmpE6rl/RjSXTBgquyYmkAgAA2xQCAADnbAIAAKWhQgAAGUwCAAxtPwIABk+MwgAD1aACAACGFAIAAIfsAgAAyrICACN3+0A==
Date: Sun, 3 Oct 2021 23:28:24 +0000
Message-ID:
 <DB9PR08MB68576ADE0EC584A49C63E5FE9EAD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
 <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com>
 <DB9PR08MB6857EE6294A1062EE0FAF0289EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB6857AB9DBB66A4E02140987B9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109271420560.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857E57847E38C400F6571EA9EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109272159590.5022@sstabellini-ThinkPad-T480s>
 <f872f421-dddf-7fde-34ce-210ddc55a87f@suse.com>
In-Reply-To: <f872f421-dddf-7fde-34ce-210ddc55a87f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 16A9AFD859E6A04383507FF1235A9FEB.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 57f1ac77-14cd-4752-fa9a-08d986c58d0e
x-ms-traffictypediagnostic: DB7PR08MB3530:|AM6PR08MB5237:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5237D6FABE0166E0826FD3049EAD9@AM6PR08MB5237.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uMxVi7D8kt4zC9EBN+/7bGqNRvTF8BNg/5GhiI+MEyCsXZGDvWN0YxyYPtQ5ZMbDwqG/egFYNxvEwWvZGkgSpgSXOQPZPVI6EBNQq2YC7rYJEzAAY6OrfjnDPb1tQXQWIyL1RfAqVzMMKPI2ti47iomeRHcAADgJIVwzoUO3YIKtvQayzymxWgz2JbmHOi0clGLR4ugsb8lr7e33o8GET489hVPcbhw1xHbIUh75YRuVCV/ceIhbND/nDzzDOayGJFE/iy3iYnnHhiNEzlN3SpDO5BW1gssWL7rnqEfYuAPNdLdsy+0ew45o5uamYGzYz0LQih9uCZfMAhsXUh0cAWT34vu6TerzBMWuas9zzvHy349VCDbUl7VzdAouYO3htQxh8ycT4F7bA4TcrJqHEK229wXXfb3uSe8KtW1GuMQhW7dp1VsQIiFPKl5KBllpxPMC4YVNsAkCVAwBHBrz5aWIqncvMPiKKGZPekqdIxvx5ualdRi+P8mAhqVMHyUKV+T8SdMD41ZKHXO2tyss43QVlSwG80f5paJXX3qlu4CiCJ9jLqWD8257+w4FxEXUmrRvDMPVAdvk45atwnLNESudpcCwjtLvvrejUnuLzhG5Cxq0wShx5rpD8sLDHSvdDa1/FW6EmoSwT1BrVIsM7CLdMp4kOR1BySb/VZrowMWHCPze/clPIMFmcIkDWbwP2om3JeB1ZgosT6QYOp+dlrE+aar2ZzaajF5i19wGoo7DMhKAFbm9weVLy+lcTaojMbpZMxWZTiwgFFjnGuCrKsD1L0LT+HeQDlHs/Pp42Yo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(55016002)(38070700005)(122000001)(8936002)(966005)(5660300002)(71200400001)(508600001)(52536014)(4326008)(9686003)(83380400001)(26005)(316002)(7696005)(38100700002)(66446008)(64756008)(66556008)(66476007)(54906003)(66946007)(33656002)(2906002)(186003)(76116006)(53546011)(6506007)(86362001)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3530
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f6a3ed3-2a43-4b16-fc27-08d986c57f6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cghE9VhTqFqELf8hd+jtAM8/ui2WFpRPnn4nMMCJdWZPxZeTnp4W5jeF8Jucp+qZAxKxxWlE4Vc4xb/Ny/OzfO2sM1XHid497XZakKNgM50slAKQED6lbu/A3Tvvn6Z1yJg3TQvQYmHbyRAG5F5RaQt9tOVtdQGrSIiZ6SASYUlKgyaGxojh8lwoPYyNsiLAkEWMGWhzAySxwHBBBk5L8Q0nAupRJd2f9Hu95qGQjsXvNs9rNNZafHe35Kme+jK/I0N5qQJ4y+ylnrbM3QI256wN8yf0w4AGIfccnl1FRT9KXbFLUIe7CIpwIkA+bUkWxWm6xjGsGqmt8cVRGy0CpDB7Tz7BSb84PYcbET848loF52Jl+1s/e/6Mp/e99bQ+5c8nB/p8vOEg5rJ4QPnuUxeaZHEh8noJIRP0/TiVOEAO49FWTsI0th2w/4aQaY1c4+kU1u0udShA/Z6ysDGnO2V2fpYOla9W6FnEvxe4OeyZRmcN3uruOzB0ysmo+rlmuMy9Ge9+CUt4TqsYsD4lB5/sVVMLtN1ug9JsQhipD9MMMnGvqRAnMrOcxfmPSeDmnVBPCYTGJ2AzjyF6i+qOaime4v5ix+3kM9XW4Vls9okzdEm4YIlfTA/MidK+356o3PDbp4TRhWQex2XLiSelA3fZfVZDXQv6yF64AwltXOeo2x57B9c5QvZEQrq8UhYgaxpWeLsI6dbfQM8Faf9p1HAUY1oQYG+rCyfuURIXblt+NLGLVHzSNtDQVHrIAr/oX2KkHXFwZcgYOAjhO+7G1ibukZE7taZn7Kp/s7/w2zk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(52536014)(55016002)(4326008)(54906003)(8936002)(9686003)(33656002)(70586007)(81166007)(356005)(186003)(26005)(508600001)(2906002)(110136005)(316002)(8676002)(82310400003)(6506007)(966005)(47076005)(336012)(70206006)(7696005)(53546011)(83380400001)(86362001)(36860700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2021 23:28:48.2194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f1ac77-14cd-4752-fa9a-08d986c58d0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5237

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiAyMDIx5bm0OeaciDI45pelIDE2OjAzDQo+IFRvOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
anVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJt
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyMC8zN10geGVuOiBpbnRyb2R1Y2UgQ09ORklH
X0VGSSB0byBzdHViIEFQSSBmb3Igbm9uLQ0KPiBFRkkgYXJjaGl0ZWN0dXJlDQo+IA0KPiBPbiAy
OC4wOS4yMDIxIDA3OjAxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4gT24gVHVlLCAy
OCBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+Pj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KPiA+Pj4gU2VudDogMjAyMeW5tDnmnIgyOOaXpSA5OjAwDQo+ID4+PiBUbzogV2VpIENo
ZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+ID4+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+Pj4ganVsaWVuQHhl
bi5vcmc7IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFN0ZWZh
bm8NCj4gPj4+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4+PiBTdWJq
ZWN0OiBSRTogW1BBVENIIDIwLzM3XSB4ZW46IGludHJvZHVjZSBDT05GSUdfRUZJIHRvIHN0dWIg
QVBJIGZvcg0KPiBub24tDQo+ID4+PiBFRkkgYXJjaGl0ZWN0dXJlDQo+ID4+Pg0KPiA+Pj4gT24g
TW9uLCAyNyBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+Pj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNA
bGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZg0KPiBPZg0KPiA+Pj4gV2VpDQo+ID4+Pj4+
IENoZW4NCj4gPj4+Pj4gU2VudDogMjAyMeW5tDnmnIgyNuaXpSAxODoyNQ0KPiA+Pj4+PiBUbzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+PiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBqdWxpZW5AeGVuLm9yZzsgQmVydHJhbmQgTWFycXVpcw0KPiA+
Pj4+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+Pj4+PiBTdWJqZWN0OiBSRTogW1BBVENIIDIwLzM3
XSB4ZW46IGludHJvZHVjZSBDT05GSUdfRUZJIHRvIHN0dWIgQVBJIGZvcg0KPiA+Pj4gbm9uLQ0K
PiA+Pj4+PiBFRkkgYXJjaGl0ZWN0dXJlDQo+ID4+Pj4+DQo+ID4+Pj4+IEhpIEphbiwNCj4gPj4+
Pj4NCj4gPj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBY
ZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhh
bGYNCj4gPj4+IE9mDQo+ID4+Pj4+IEphbg0KPiA+Pj4+Pj4gQmV1bGljaA0KPiA+Pj4+Pj4gU2Vu
dDogMjAyMeW5tDnmnIgyNOaXpSAxODo0OQ0KPiA+Pj4+Pj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hl
bkBhcm0uY29tPg0KPiA+Pj4+Pj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
anVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kDQo+IE1hcnF1aXMNCj4gPj4+Pj4+IDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPj4+IDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPg0KPiA+Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCAyMC8zN10geGVuOiBpbnRy
b2R1Y2UgQ09ORklHX0VGSSB0byBzdHViIEFQSQ0KPiBmb3INCj4gPj4+Pj4gbm9uLQ0KPiA+Pj4+
Pj4gRUZJIGFyY2hpdGVjdHVyZQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIDI0LjA5LjIwMjEgMTI6
MzEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4+Pj4+Pj4+IFNlbnQ6IDIwMjHlubQ55pyIMjTml6UgMTU6NTkNCj4g
Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gT24gMjQuMDkuMjAyMSAwNjozNCwgV2VpIENoZW4gd3JvdGU6
DQo+ID4+Pj4+Pj4+Pj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPg0KPiA+Pj4+Pj4+Pj4+IFNlbnQ6IDIwMjHlubQ55pyIMjTml6UgOToxNQ0KPiA+Pj4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gT24gVGh1LCAyMyBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6
DQo+ID4+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+Pj4+Pj4+Pj4+PiAr
KysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gPj4+Pj4+Pj4+Pj4gQEAgLTExLDYgKzExLDE2IEBA
IGNvbmZpZyBDT01QQVQNCj4gPj4+Pj4+Pj4+Pj4gIGNvbmZpZyBDT1JFX1BBUktJTkcNCj4gPj4+
Pj4+Pj4+Pj4gIAlib29sDQo+ID4+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4+ICtjb25maWcgRUZJ
DQo+ID4+Pj4+Pj4+Pj4+ICsJYm9vbA0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gV2l0aG91
dCB0aGUgdGl0bGUgdGhlIG9wdGlvbiBpcyBub3QgdXNlci1zZWxlY3RhYmxlIChvciBkZS0NCj4g
Pj4+Pj4+IHNlbGVjdGFibGUpLg0KPiA+Pj4+Pj4+Pj4+IFNvIHRoZSBoZWxwIG1lc3NhZ2UgYmVs
b3cgY2FuIG5ldmVyIGJlIHNlZW4uDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBFaXRoZXIg
YWRkIGEgdGl0bGUsIGUuZy46DQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBib29sICJFRkkg
c3VwcG9ydCINCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IE9yIGZ1bGx5IG1ha2UgdGhlIG9w
dGlvbiBhIHNpbGVudCBvcHRpb24gYnkgcmVtb3ZpbmcgdGhlIGhlbHANCj4gPj4+IHRleHQuDQo+
ID4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4gT0ssIGluIGN1cnJlbnQgWGVuIGNvZGUsIEVGSSBpcyB1
bmNvbmRpdGlvbmFsbHkgY29tcGlsZWQuIEJlZm9yZQ0KPiA+Pj4+Pj4+Pj4gd2UgY2hhbmdlIHJl
bGF0ZWQgY29kZSwgSSBwcmVmZXIgdG8gcmVtb3ZlIHRoZSBoZWxwIHRleHQuDQo+ID4+Pj4+Pj4+
DQo+ID4+Pj4+Pj4+IEJ1dCB0aGF0J3Mgbm90IHRydWU6IEF0IGxlYXN0IG9uIHg4NiBFRkkgZ2V0
cyBjb21waWxlZCBkZXBlbmRpbmcNCj4gPj4+IG9uDQo+ID4+Pj4+Pj4+IHRvb2wgY2hhaW4gY2Fw
YWJpbGl0aWVzLiBVbHRpbWF0ZWx5IHdlIG1heSBpbmRlZWQgd2FudCBhIHVzZXINCj4gPj4+Pj4+
Pj4gc2VsZWN0YWJsZSBvcHRpb24gaGVyZSwgYnV0IHVudGlsIHRoZW4gSSdtIGFmcmFpZCBoYXZp
bmcgdGhpcw0KPiA+Pj4gb3B0aW9uDQo+ID4+Pj4+Pj4+IGF0IGFsbCBtYXkgYmUgbWlzbGVhZGlu
ZyBvbiB4ODYuDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBJIGNoZWNrIHRoZSBi
dWlsZCBzY3JpcHRzLCB5ZXMsIHlvdSdyZSByaWdodC4gRm9yIHg4NiwgRUZJIGlzIG5vdA0KPiA+
Pj4gYQ0KPiA+Pj4+Pj4+IHNlbGVjdGFibGUgb3B0aW9uIGluIEtjb25maWcuIEkgYWdyZWUgd2l0
aCB5b3UsIHdlIGNhbid0IHVzZQ0KPiA+Pj4gS2NvbmZpZw0KPiA+Pj4+Pj4+IHN5c3RlbSB0byBk
ZWNpZGUgdG8gZW5hYmxlIEVGSSBidWlsZCBmb3IgeDg2IG9yIG5vdC4NCj4gPj4+Pj4+Pg0KPiA+
Pj4+Pj4+IFNvIGhvdyBhYm91dCB3ZSBqdXN0IHVzZSB0aGlzIEVGSSBvcHRpb24gZm9yIEFybSBv
bmx5PyBCZWNhdXNlIG9uDQo+ID4+PiBBcm0sDQo+ID4+Pj4+Pj4gd2UgZG8gbm90IGhhdmUgc3Vj
aCB0b29sY2hhaW4gZGVwZW5kZW5jeS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBUbyBiZSBob25lc3Qg
LSBkb24ndCBrbm93LiBUaGF0J3MgYmVjYXVzZSBJIGRvbid0IGtub3cgd2hhdCB5b3UNCj4gd2Fu
dA0KPiA+Pj4+Pj4gdG8gdXNlIHRoZSBvcHRpb24gZm9yIHN1YnNlcXVlbnRseS4NCj4gPj4+Pj4+
DQo+ID4+Pj4+DQo+ID4+Pj4+IEluIGxhc3QgdmVyc2lvbiwgSSBoYWQgaW50cm9kdWNlZCBhbiBh
cmNoLWhlbHBlciB0byBzdHViIEVGSV9CT09UDQo+ID4+Pj4+IGluIEFybSdzIGNvbW1vbiBjb2Rl
IGZvciBBcm0zMi4gQmVjYXVzZSBBcm0zMiBkb2Vzbid0IHN1cHBvcnQgRUZJLg0KPiA+Pj4+PiBT
byBKdWxpZW4gc3VnZ2VzdGVkIG1lIHRvIGludHJvZHVjZSBhIENPTkZJR19FRkkgb3B0aW9uIGZv
ciBub24tRUZJDQo+ID4+Pj4+IHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzIHRvIHN0dWIgaW4gRUZJ
IGxheWVyLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIxLQ0KPiA+Pj4+PiAwOC9tc2cwMDgwOC5odG1s
DQo+ID4+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBBcyBKYW4nIHJlbWluZGVkLCB4ODYgZG9lc24ndCBk
ZXBlbmQgb24gS2NvbmZpZyB0byBidWlsZCBFRkkgY29kZS4NCj4gPj4+PiBTbywgaWYgd2UgQ09O
RklHX0VGSSB0byBzdHViIEVGSSBBUEkncyBmb3IgeDg2LCB3ZSB3aWxsIGVuY291bnRlcg0KPiA+
Pj4+IHRoYXQgdG9vbGNoYWlucyBlbmFibGUgRUZJLCBidXQgS2NvbmZpZyBkaXNhYmxlIEVGSS4g
T3IgS2NvbmZpZw0KPiA+Pj4+IGVuYWJsZSBFRkkgYnV0IHRvb2xjaGFpbiBkb2Vzbid0IHByb3Zp
ZGUgRUZJIGJ1aWxkIHN1cHBvcnRzLiBBbmQNCj4gPj4+PiB0aGVuIHg4NiBjb3VsZCBub3Qgd29y
ayB3ZWxsLg0KPiA+Pj4+DQo+ID4+Pj4gSWYgd2UgdXNlIENPTkZJR19FRkkgZm9yIEFybSBvbmx5
LCB0aGF0IG1lYW5zIENPTkZJR19FRkkgZm9yIHg4Ng0KPiA+Pj4+IGlzIG9mZiwgdGhpcyB3aWxs
IGFsc28gY2F1c2UgcHJvYmxlbS4NCj4gPj4+Pg0KPiA+Pj4+IFNvLCBjYW4gd2Ugc3RpbGwgdXNl
IHByZXZpb3VzIGFyY2hfaGVscGVycyB0byBzdHViIGZvciBBcm0zMj8NCj4gPj4+PiB1bnRpbCB4
ODYgY2FuIHVzZSB0aGlzIHNlbGVjdGFibGUgb3B0aW9uPw0KPiA+Pj4NCj4gPj4+IEVGSSBkb2Vz
bid0IGhhdmUgdG8gYmUgbmVjZXNzYXJpbHkgYSB1c2VyLXZpc2libGUgb3B0aW9uIGluIEtjb25m
aWcgYXQNCj4gPj4+IHRoaXMgcG9pbnQuIEkgdGhpbmsgSnVsaWVuIHdhcyBqdXN0IGFza2luZyB0
byBtYWtlIHRoZSAjaWZkZWYgYmFzZWQgb24NCj4gPj4+IGEgRUZJLXJlbGF0ZWQgY29uZmlnIHJh
dGhlciB0aGFuIGp1c3QgYmFzZWQgQ09ORklHX0FSTTY0Lg0KPiA+Pj4NCj4gPj4+IE9uIHg4NiBF
RkkgaXMgZGV0ZWN0ZWQgYmFzZWQgb24gY29tcGlsZXIgc3VwcG9ydCwgc2V0dGluZw0KPiBYRU5f
QlVJTERfRUZJDQo+ID4+PiBpbiB4ZW4vYXJjaC94ODYvTWFrZWZpbGUuIExldCdzIHNheSB0aGF0
IHdlIGtlZXAgdXNpbmcgdGhlIHNhbWUgbmFtZQ0KPiA+Pj4gIlhFTl9CVUlMRF9FRkkiIG9uIEFS
TSBhcyB3ZWxsLg0KPiA+Pj4NCj4gPj4+IE9uIEFSTTMyLCBYRU5fQlVJTERfRUZJIHNob3VsZCBi
ZSBhbHdheXMgdW5zZXQuDQo+ID4+Pg0KPiA+Pj4gT24gQVJNNjQgWEVOX0JVSUxEX0VGSSBzaG91
bGQgYmUgYWx3YXlzIHNldC4NCj4gPj4+DQo+ID4+PiBUaGF0J3MgaXQsIHJpZ2h0PyBJJ2QgYXJn
dWUgdGhhdCBDT05GSUdfRUZJIG9yIEhBU19FRkkgYXJlIGJldHRlcg0KPiBuYW1lcw0KPiA+Pj4g
dGhhbiBYRU5fQlVJTERfRUZJLCBidXQgdGhhdCdzIE9LIGFueXdheS4gU28gZm9yIGluc3RhbmNl
IHlvdSBjYW4gbWFrZQ0KPiA+Pj4gWEVOX0JVSUxEX0VGSSBhbiBpbnZpc2libGUgc3ltYm9sIGlu
IHhlbi9hcmNoL2FybS9LY29uZmlnIGFuZCBzZWxlY3QNCj4gaXQNCj4gPj4+IG9ubHkgb24gQVJN
NjQuDQo+ID4+DQo+ID4+IFRoYW5rcywgdGhpcyBpcyBhIGdvb2QgYXBwcm9hY2guIEJ1dCBpZiB3
ZSBwbGFjZSBYRU5fQlVJTERfRUZJIGluDQo+IEtjb25maWcNCj4gPj4gaXQgd2lsbCBiZSB0cmFu
c2ZlciB0byBDT05GSUdfWEVOX0JVSUxEX0VGSS4gSG93IGFib3V0IHVzaW5nIGFub3RoZXINCj4g
bmFtZQ0KPiA+PiBpbiBLY29uZmlnIGxpa2UgQVJNX0VGSSwgYnV0IHVzZSBDT05GSUdfQVJNX0VG
SSBpbiBjb25maWcuaCB0byBkZWZpbmUNCj4gPj4gWEVOX0JVSUxEX0VGST8NCj4gPg0KPiA+IEkg
YW0gT0sgd2l0aCB0aGF0LiBBbm90aGVyIG9wdGlvbiBpcyB0byByZW5hbWUgWEVOX0JVSUxEX0VG
SSB0bw0KPiA+IENPTkZJR19YRU5fQlVJTERfRUZJIG9uIHg4Ni4gRWl0aGVyIHdheSBpcyBmaW5l
IGJ5IG1lLiBKYW4sIGRvIHlvdSBoYXZlYQ0KPiA+IHByZWZlcmVuY2U/DQo+IA0KPiBZZXMsIEkg
ZG86IE5vIG5ldyBDT05GSUdfKiBzZXR0aW5ncyBwbGVhc2UgdGhhdCBkb24ndCBvcmlnaW5hdGUg
ZnJvbQ0KPiBLY29uZmlnLiBIZW5jZSBJJ20gYWZyYWlkIHRoaXMgaXMgYSAibm8iIHRvIHlvdXIg
c3VnZ2VzdGlvbi4NCj4gDQo+IE1pZC10ZXJtIHdlIHNob3VsZCB0cnkgdG8gZ2V0IHJpZCBvZiB0
aGUgcmVtYWluaW5nIENPTkZJR18qIHdoaWNoDQo+IGdldCAjZGVmaW5lLWQgaW4gZS5nLiBhc20v
Y29uZmlnLmguDQo+IA0KDQpJIHdpbGwgZG8gc29tZXRoaW5nIGxpa2UgdGhpczogDQogLSBpbnRy
b2R1Y2UgYW4gQVJNX0VGSSBpbnZpc2libGUgc3ltYm9sIGluIGtjb25maWcsIHNlbGVjdGVkIGJ5
IEFSTTY0IG9ubHkNCiAtIHVzZSBDT05GSUdfQVJNX0VGSSB0byBkZWZpbmUgWEVOX0JVSUxEX0VG
SSBpbiBjb25maWcuaA0KDQo+IEphbg0KDQo=

