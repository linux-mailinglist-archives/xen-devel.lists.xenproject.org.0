Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AF8A6696
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 10:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706765.1104142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweew-0001Vi-Dn; Tue, 16 Apr 2024 08:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706765.1104142; Tue, 16 Apr 2024 08:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweew-0001TN-AY; Tue, 16 Apr 2024 08:59:22 +0000
Received: by outflank-mailman (input) for mailman id 706765;
 Tue, 16 Apr 2024 08:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g64T=LV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rweev-0001TF-EL
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 08:59:21 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2607::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c20af7a-fbcf-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 10:59:19 +0200 (CEST)
Received: from AS4P189CA0053.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::17)
 by AS4PR08MB7688.eurprd08.prod.outlook.com (2603:10a6:20b:507::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 08:59:14 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::b3) by AS4P189CA0053.outlook.office365.com
 (2603:10a6:20b:659::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 08:59:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 16 Apr 2024 08:59:13 +0000
Received: ("Tessian outbound e14047529286:v313");
 Tue, 16 Apr 2024 08:59:13 +0000
Received: from f74271070284.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62A09306-1A61-415F-84A5-3339066489B4.1; 
 Tue, 16 Apr 2024 08:59:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f74271070284.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Apr 2024 08:59:02 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8953.eurprd08.prod.outlook.com (2603:10a6:10:464::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 08:59:00 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 08:59:00 +0000
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
X-Inumbo-ID: 9c20af7a-fbcf-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DsR6PTIaQrJret7dv9INxaJW9I90FQmssXu8iR69wirK579N/Fnz7WeukoX5c9DPxmBmyqIncW4Lo3xlkz/SMQlHP6NT+Dxkhjj+UR7qUkdRFKPlvRqrBPwzYYiBZxrQ/aZDTWYs6H9mjD5V9uWEIJd6Mmcgg24lAWBwUJQjh8oFohcUZuR8vhq8KAZLMp1osLjWpo1FbRur5bp9u5wl03LkOzc4pAcjfgCwDIln84Z1Qe2+/PXYcjxoVhGC6CahYrmr/wxV0hzEDoi8ZVH+5HI2LIeTe0udu6OGqDi+XFn6qkdJv4bxlxtvBbJpASJhZ+xBSwCXyTMlqHwRjbwDsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWXfMaRzwGuvL5uL9AJyEQBJWRxSO5r02Ir2vMlpiqw=;
 b=V2jbmgwDcdzKwFe6iMKeC9vaCs55tp6/7tmwQnZ6W+Xmdgz0X7vBi1TNtaGxf/gqhfCvXdhWo8zyikAP0D1WKm5MNwfHHo4ZXkKGa2mW81pJPg0O37EA5mvi3SfD17drKiq+EDfu7xOfsPg3Ip4rGvBjNb93udljaGDpcu6Yq1NvjBUDkFHCoearJmgsoKL3iFP9S5Y56BkUqhPNMNuO6nduvUQCEMewyr3wLce55D1uKaQvPnwiqPtEZQWwOHodniekqZ0ncZo2Uk+K75uNyXfWrMLMpxzGmDHlEWA8M2f4EhLkXm9/ajpbBun9Ua1sy6beAv6gwMwfWYjwlpLPvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWXfMaRzwGuvL5uL9AJyEQBJWRxSO5r02Ir2vMlpiqw=;
 b=Yeuc9LBLkUbXxMTAHQHG4h7EDyoWWHGeynn6j293Y+xeU3xmjMHsI0eiE1LQmT3FqEl20cNQtDWBbt0RoZgiiJJMvwO/a/k4OeO9nttpD2trcNL/lehCK0POoFwYwVNJ4DNEuI1lt/dAs/tz8CSbDMA+n9iGmhTGX5DOavATKhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 286054192b40484d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apziTZabqnSBbgroCbxD8aMLc6QkuCcpgouRQJp32m3+gtk4TqwoHWmlxvp/M7fGR/hTKL6Y1thSLWBVAznRqjLiGSY0ivcvyifh5adL83Ht7SQeeUslQsebHBmiwbgVhTEw0YMmSxy7u8sJhenWK7EoXxrcYmDS+gTxIiBTYNwZjXGdK+VXIejqqGxFJMM2O/4qn93OENwBhd2q2+RAcZNRUT/eDF/tcEyY/xStDkh4b+jTw2JTUlbWj3iAAaQDQqEKBKMBHM0FxeUTLQvgo5uNDuDF3YMRliwTWpuvH7IpP2/qOer8VItHGH3vEnCqEqw1xCFFiePbPbjrtfR7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWXfMaRzwGuvL5uL9AJyEQBJWRxSO5r02Ir2vMlpiqw=;
 b=NBx8Pv9kJRBeXCFkG1RppWAO/VXo7yptRqL4ot2qtjp2bZDtFsu4d5IR8G+iHPzTn+RYQyFfHEzqiJGdMeOYwkXGS2dO4uw4Xl0jC+16cuMDlGDJdgADXPKxJLGC//L1oopi+ksMT04Mw+KjMprWDahj3zMmXg5Mk1fuxy9MW84wbJbYdZo7FDG9QC32HU4Co66zzPkQL7tAZCG5IeZMfs0C8hR7DG/IV4AwtqDP5kfOcNW5JhgE0XxVBfICst3uBhSoybK0GLZzt+9BrDxeBYocsY1nuELDT5g9eXAo6DXW50wgYvX54/RSXp8Wh8kQMxLueGJwra52eydlEsh9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWXfMaRzwGuvL5uL9AJyEQBJWRxSO5r02Ir2vMlpiqw=;
 b=Yeuc9LBLkUbXxMTAHQHG4h7EDyoWWHGeynn6j293Y+xeU3xmjMHsI0eiE1LQmT3FqEl20cNQtDWBbt0RoZgiiJJMvwO/a/k4OeO9nttpD2trcNL/lehCK0POoFwYwVNJ4DNEuI1lt/dAs/tz8CSbDMA+n9iGmhTGX5DOavATKhs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Topic: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Index: AQHainSZ45I8T1wdtkSTioIgDqTSKbFptBmAgADFXACAACfggIAAAloA
Date: Tue, 16 Apr 2024 08:59:00 +0000
Message-ID: <F1BB5F9C-0683-420C-AB77-BBE88AB16347@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-14-luca.fancellu@arm.com>
 <7b09184a-111d-4a38-baec-53f01ec6ed03@xen.org>
 <39165767-26EA-4849-9C02-12393933139E@arm.com>
 <74cfa4fe-2ee8-4700-be90-4227704f96d1@xen.org>
In-Reply-To: <74cfa4fe-2ee8-4700-be90-4227704f96d1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8953:EE_|AM4PEPF00027A5D:EE_|AS4PR08MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: c54826b5-8134-42c6-4417-08dc5df37d42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Awu5NxFQD7hOhgDoGwGc0Gc5vxVnlj7EC0W/+GK6D+TvPCFP9iGibyOrJuTJDG5hEqf2e/H/4Gbk8XyNnDomXpHUt6GVwHLGos7J1P0l9IvcHLhjs6FSLy1hCmoFSlwOaQCky6jiW5rvDrK7HzAGgbCE7E4UWa8q46KYZFiTkSrTFtJzHvNuqas5UljSHS3sFwH+HozZ8ocEPvtRIxqkLw/aPC9sR3RXBg8sVMH/oUcfgPkvVd3pBnFn+WMjnKQ8z0oDvmXwd8MdBfAdEXQLW4C8sEYp8QqMkkBALzcD4X9Ktb5BYcMX7ZCT9wcl6BxxuA6W0aAxYuESa+ZUjo5DZNCdb+0MiuTRCj5vOYGFEApf8LgWExm3IRUSQ4Xqh2aZLss+P/9e+Me+Kxw9eErWH55NDuL5gutDn/o8SMKE8Ul5/ra00rdCnhJ50oaiNmKLOQGetVadGypqo5PX+DBExQJ464vPLJ9scjl0WZwD3540P7di0q3s0RkhuEMMtuXo4dh9FlK0EY3Abpy+EqVPjcum2ZRLM41Y/K8VK1CJNyBydCpccub28lvaROC5K7zSroN2KdLOeAHthDTpLSwHB9OuWgE6LLKViK0UO2a/2J/4vDYcXq8GqRNlrCPbNeeMlSDymVs/XB8Gvle8Wr9wZxj6chDGEe3AIx8thQR9QP3DuOERUVtt8V9oUgMN3bIHnhSH8BDI3KADozFgJLXp+OlMNlXwXCpdLCQebI89Tn4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9195BA824E956F448FE401EC3D348DBF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8953
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fec13b19-eea3-409e-507d-08dc5df37557
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Guy6KVYajJuTXCGktOI091NVZxYbxv2f2ntmTzx2feOQcULM6A+jPsIXJRf+Bi0c2ZeviO8c+RgXipJwiZ0jRoG5lLgB59wXtuEJbd1KxXsTk8ViLUJOkPNUrrQvwQg10D8P2p6RHJyh/USf7l1lSaJEzyclV8IG7txKdOZr+vziI59TrIwIEEPrqI3KbK7cKpPpp/j6p1juicQgXmuxnQYxDs9wETVLBXRzX2thLccpLBOBW8Z6XfURh80Ks6LLCqR6LBnmPUcfXpUlqqki82Q0HlnPV416w56jx6A3HqLandqnypf34IPewfWrooRpd5pNudzqxDtxoyIy7FQHfAuwogQ+58Qk5JlO9Liim/3PO7cdKmGdtnvMi1mhDXqqzZJRsJg9JijZyeuIZikArzxq+3uVzTPKQeqaTeVNCTRY8ozc3bCC3rx70aT1B91Uk6KNm5Osl/DfOjKhUCrkfMZs2c2yb/GsUQs1z6rvLhRJE9+eFYmF6uHtrch1GPQWQatBBgUQOD76O6NFfTLZLE23qVGEv4aejNFXBmGpAxRoGK4jc4qRO6wkNPlFhIalkkBx0OKF5B1mUlNOLo2uq4q+9j8+voq5njkkqV1F+cHPaFu0FGcQ5jlftewWHZ1y8OwBEWd5ZP/F6UF09/YEtOZWH1ILovv+LaSzn9+RSYWHaOjxfDTY/lBdiCzDkt6laR/AiPFTf/lIDwAD3Sm4Zn2DgEIdPPy6dNQwEKREdDBR7BVaHSc4Py6tRp3O3KBi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 08:59:13.9073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54826b5-8134-42c6-4417-08dc5df37d42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7688

DQoNCj4gT24gMTYgQXByIDIwMjQsIGF0IDA5OjUwLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTYvMDQvMjAyNCAwNzoyNywgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPj4+IE9uIDE1
IEFwciAyMDI0LCBhdCAxOTo0MSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6
DQo+Pj4gDQo+Pj4gSGkgTHVjYSwNCj4+PiANCj4+PiBPbiAwOS8wNC8yMDI0IDEyOjQ1LCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4+PiBDdXJyZW50bHkgWGVuIGlzIG5vdCBleHBvcnRpbmcgdGhl
IHN0YXRpYyBzaGFyZWQgbWVtb3J5IHJlZ2lvbnMNCj4+Pj4gdG8gdGhlIGRldmljZSB0cmVlIGFz
IC9tZW1vcnkgbm9kZSwgdGhpcyBjb21taXQgaXMgZml4aW5nIHRoaXMNCj4+Pj4gaXNzdWUuDQo+
Pj4+IFRoZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSBiYW5rcyBjYW4gYmUgcGFydCBvZiB0aGUgbWVt
b3J5IHJhbmdlDQo+Pj4+IGF2YWlsYWJsZSBmb3IgdGhlIGRvbWFpbiwgc28gaWYgdGhleSBhcmUg
b3ZlcmxhcHBpbmcgd2l0aCB0aGUNCj4+Pj4gbm9ybWFsIG1lbW9yeSBiYW5rcywgdGhleSBuZWVk
IHRvIGJlIG1lcmdlZCB0b2dldGhlciBpbiBvcmRlcg0KPj4+PiB0byBwcm9kdWNlIGEgL21lbW9y
eSBub2RlIHdpdGggbm9uIG92ZXJsYXBwaW5nIHJhbmdlcyBpbiAncmVnJy4NCj4+PiANCj4+PiBC
ZWZvcmUgcmV2aWV3aW5nIHRoZSBjb2RlIGluIG1vcmUgZGV0YWlscywgSSB3b3VsZCBsaWtlIHRv
IHVuZGVyc3RhbmQgYSBiaXQgbW9yZSB0aGUgdXNlIGNhc2UgYW5kIHdoZXRoZXIgaXQgc2hvdWxk
IGJlIHZhbGlkLg0KPj4+IA0KPj4+IEZyb20gbXkgdW5kZXJzdGFuZGluZywgdGhlIGNhc2UgeW91
IGFyZSB0cnlpbmcgdG8gcHJldmVudCBpcyB0aGUgZm9sbG93aW5nIHNldHVwOg0KPj4+ICAxLiBU
aGUgR3Vlc3QgUGh5c2ljYWwgcmVnaW9uIDB4MDAwMCB0byAweDgwMDAgaXMgdXNlZCBmb3IgUkFN
DQo+Pj4gIDIuIFRoZSBHdWVzdCBQaHlzaWNhbCByZWdpb24gMHgwMDAwIHRvIDB4NDAwMCBpcyB1
c2VkIGZvciBzdGF0aWMgbWVtb3J5DQo+PiBTbyBmYXIsIGl0IHdhcyBwb3NzaWJsZSB0byBtYXAg
Z3Vlc3QgcGh5c2ljYWwgcmVnaW9ucyBpbnNpZGUgdGhlIG1lbW9yeSByYW5nZSBnaXZlbiB0byB0
aGUgZ3Vlc3QsDQo+PiBzbyB0aGUgYWJvdmUgY29uZmlndXJhdGlvbiB3YXMgYWxsb3dlZCBhbmQg
dGhlIHVuZGVybHlpbmcgaG9zdCBwaHlzaWNhbCByZWdpb25zIHdlcmUgb2YgY291cnNlDQo+PiBk
aWZmZXJlbnQgYW5kIGVuZm9yY2VkIHdpdGggY2hlY2tzLiBTbyBJ4oCZbSBub3QgdHJ5aW5nIHRv
IHByZXZlbnQgdGhpcyBiZWhhdmlvdXIsIGhvd2V2ZXIgLi4uDQo+Pj4gDQo+Pj4gVGhlIHVuZGVy
bHlpbmcgSG9zdCBQaHlzaWNhbCByZWdpb25zIG1heSBiZSBkaWZmZXJlbnQuIFhlbiBkb2Vzbid0
IGd1YXJhbnRlZSBpbiB3aGljaCBvcmRlciB0aGUgcmVnaW9ucyB3aWxsIGJlIG1hcHBlZCwgU28g
d2hldGhlciB0aGUgb3ZlcmxhcHBlZCByZWdpb24gd2lsbCBwb2ludCB0byB0aGUgbWVtb3J5IG9y
IHRoZSBzaGFyZWQgcmVnaW9uIGlzIHVua25vd24gKHdlIGRvbid0IGd1YXJhbnRlZSB0aGUgb3Jk
ZXIgb2YgdGhlIG1hcHBpbmcpLiBTbyBub3RoaW5nIGdvb2Qgd2lsbCBoYXBwZW4gdG8gdGhlIGd1
ZXN0Lg0KPj4gLi4uIG5vdyBoZXJlIEkgZG9u4oCZdCB1bmRlcnN0YW5kIGlmIHRoaXMgd2FzIHdy
b25nIGZyb20gdGhlIGJlZ2lubmluZyBvciBub3QsIHNoYWxsIHdlIGVuZm9yY2UgYWxzbyB0aGF0
DQo+PiBndWVzdCBwaHlzaWNhbCByZWdpb25zIGZvciBzdGF0aWMgc2hhcmVkIG1lbW9yeSBhcmUg
b3V0c2lkZSB0aGUgbWVtb3J5IGdpdmVuIHRvIHRoZSBndWVzdD8NCj4gDQo+IE5vdGhpbmcgZ29v
ZCB3aWxsIGhhcHBlbiBpZiB5b3UgYXJlIHRyeWluZyB0byBvdmVyd3JpdGUgbWFwcGluZ3MuIFNv
IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZW5mb3JjZWQuIEhvd2V2ZXIsIHRoaXMgaXMgYSBtb3Jl
IGdlbmVyYWwgcHJvYmxlbS4gQXQgdGhlIG1vbWVudCwgdGhpcyBpcyBwcmV0dHkgbXVjaCBhcyBt
ZXNzIGJlY2F1c2UgeW91IGNhbiBvdmVyd3JpdGUgYW55IG1hcHBpbmcgKGUuZy4gbWFwIE1NSU8g
b24gdG9wIG9mIHRoZSBSQU0pLg0KPiANCj4gSSB0aGluayB0aGUgZWFzaWVzdCB3YXkgdG8gZW5m
b3JjZSBpcyB0byBkbyBpdCBpbiB0aGUgUDJNIGNvZGUgbGlrZSB4ODYgZG9lcyBmb3IgY2VydGFp
biBtYXBwaW5ncy4NCj4gDQo+IEFueXdheSwgSSBkb24ndCB0aGluayB0aGUgcHJvYmxlbSBzaG91
bGQgYmUgc29sdmVkIGhlcmUgb3IgYnkgeW91ICh0aGlzIGlzIGxpa2VseSBnb2luZyB0byBiZSBh
IGNhbiBvZiB3b3JtcykuIEZvciBub3csIEkgd291bGQgY29uc2lkZXIgdG8gc2ltcGx5IGRyb3Ag
dGhlIHBhdGNoZXMgdGhhdCBhcmUgdHJ5aW5nIHRvIGRvIHRoZSBtZXJnZS4NCj4gDQo+IEFueSB0
aG91Z2h0cz8NCg0KWWVzIEkgYWdyZWUgd2l0aCB5b3UsIEnigJlsbCBkcm9wIHRoZSBwYXRjaCB0
aGF0IHRyaWVzIHRvIGRvIHRoZSBtZXJnZSwgSSB3YXMgdGhpbmtpbmcgYWJvdXQgY2hlY2tpbmcg
dGhhdCB0aGUgZ3Vlc3QgcGh5cyBzdGF0aWMgbWVtIHJlZ2lvbiBpcw0KaW5zaWRlIHRoZXNlIGJv
dW5kYXJpZXM6DQoNCiNkZWZpbmUgR1VFU1RfUkFNX0JBTktfQkFTRVMgeyBHVUVTVF9SQU0wX0JB
U0UsIEdVRVNUX1JBTTFfQkFTRSB9DQojZGVmaW5lIEdVRVNUX1JBTV9CQU5LX1NJWkVTIHsgR1VF
U1RfUkFNMF9TSVpFLCBHVUVTVF9SQU0xX1NJWkUgfQ0KDQphbmQgYWxzbyB0aGF0IGRvZXNu4oCZ
dCBvdmVybGFwIHdpdGggKHN0cnVjdCBrZXJuZWxfaW5mbykubWVtLCBkb2VzIGl0IHNvdW5kcyBy
aWdodCB0byB5b3U/DQoNClNvIGluIHRoaXMgcGF0Y2ggSSB3aWxsIG9ubHkgcG9wdWxhdGUgdGhl
IC9tZW1vcnkgbm9kZXMgd2l0aCB0aGUgc3RhdGljIHNoYXJlZCBtZW1vcnkgYmFua3MuDQoNCg0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

