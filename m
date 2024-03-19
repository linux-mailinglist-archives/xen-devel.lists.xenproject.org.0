Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1F87FED8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695381.1085090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZYG-0001Ln-RV; Tue, 19 Mar 2024 13:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695381.1085090; Tue, 19 Mar 2024 13:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZYG-0001KG-Ou; Tue, 19 Mar 2024 13:30:48 +0000
Received: by outflank-mailman (input) for mailman id 695381;
 Tue, 19 Mar 2024 13:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gRet=KZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rmZYF-0001KA-JU
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:30:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260d::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3f2c158-e5f4-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 14:30:45 +0100 (CET)
Received: from DU2PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:10:232::17)
 by DBBPR08MB5932.eurprd08.prod.outlook.com (2603:10a6:10:207::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Tue, 19 Mar
 2024 13:30:41 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::df) by DU2PR04CA0072.outlook.office365.com
 (2603:10a6:10:232::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 13:30:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 13:30:41 +0000
Received: ("Tessian outbound e26069fc76b9:v300");
 Tue, 19 Mar 2024 13:30:41 +0000
Received: from 61ca9ac08ac0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76783482-3899-41BF-951D-964F1F1557AE.1; 
 Tue, 19 Mar 2024 13:30:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61ca9ac08ac0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Mar 2024 13:30:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9653.eurprd08.prod.outlook.com (2603:10a6:10:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 13:30:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::13e4:dd98:2513:db0]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::13e4:dd98:2513:db0%7]) with mapi id 15.20.7386.023; Tue, 19 Mar 2024
 13:30:23 +0000
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
X-Inumbo-ID: e3f2c158-e5f4-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U94yqitzZC2l8sbz41cgdA85r6zP6xzRPMRllIwXhip7qbEz+0y4q2sSzYsAPoahkFNEC69tesXTZPCEcJdZO42p8XDbbsUEyVTINPsctGNoI0StkRYtQFlQJeRwBYOTE9/VTotax8Udt157GAtC+6kbg88kp6+ro3ZA6u0GSnmeZ+T0xurwUyr1MIO7gQBQfMltkuSCf1O3mkH+df/PpRXvZw8GvikYoAXU7EUdLZ5iHP1DBwGp02HMwEY5OS5I33IroqorMERrptWj7jgDn2um9Gz7ZxRR/khjnMEcEJ4qkyFi/VpXkb+aayX1a1kYf1eizR6T/RWsMz0J+zwRfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE4p0YzeWWuQDURuNHJmYDSPA+fd7dpTX3r/gdvxMKE=;
 b=nlux7D3PWykcZgV02WJIGKjV9qChHg37S7xjrzPudX5F3vpWNrh4w3gc0srfeDtZcbbgYgE7e8NwOxeRCQTbZIuQynUBily7vqfmBDRhDBEdW/HdQY+Mk/n7IEFKo92LUdBDDl1hzikr+Zky2e4VHfgdhnwTQJiopVP8W1erP9Cw6XBx7zm9bD7ZXkly5TXkUi5qgBKqdAdtHwRDyoyhfIRQMnIwU6GOiyrZ/dEsq0PhWDJHU3Wp8fXwTv4jiDlCP/tekQU59uD1/khTn5qfjsZQjA/K6YctJcKXCFcnfzvNd7nGlRLhERh3ibOfznEmJ36W1WU/Qp5de6QukG7b+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE4p0YzeWWuQDURuNHJmYDSPA+fd7dpTX3r/gdvxMKE=;
 b=AgjAgCioNMTgVLeVdkENir9n9PLRxkv0RTXmRToUF/sEtrVrWYlMna/60goiBAZggZfjitiHpSMnvQ7d/nWnYj39unuvluV9J4b9TJ8VK64LpN5FVYEOiRQb59GDKIheEZNNUFEU0XBocvENiTIrI1eKwmVcgRDoVZS3z94bQsc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cb4c8c3ed7a5077
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaEbn72pNn1Jhp+B6rqHo7n/09ZiWR6UIOJ30LrXtJyW0CzV/srp/QVfcnXPy3lZUouovKWqsVGQYTnbDzvVQF6elizOF/+A1q9cHH8bpo+eLEyeK/irkt1dGyFuuzLXJ1GidpsuiuAib7Lq+jsWQGKtyc+eNlkcSGWnB0YfFtrmfu9IwurI5R9JOB2ifZgD3MlaIZVXkp+Jh67fzF6abJEh8Csxv8eF9Afl2zkCZqivC6Wwa0gBvo24n02Sb9soACEPxiBSQwPFAPI1Uh9XsMSLHyRR1IRi7Jnc5KeCM0ROOK+zkSLRkmbmn1NyQGJ6Wgjvja6YWNFPjFBFotDtbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE4p0YzeWWuQDURuNHJmYDSPA+fd7dpTX3r/gdvxMKE=;
 b=Ngi/yRFkszOeEjdFp+/oLdETdSzsIA7DiL/t4t2t8F+T8Z9yMnLQsXBR2xpsMfBSAAwr5rr/F+/BPmFRJX/dLsZL9uJUUim4rcpZQyRxmOYr8upLsq2MkwkKRxOqqqhNoi0rE3uA2tZCRG77QMlfaYDSRqabor7Yd0LvFp3804/ZsaMvMeJ+aFev0sa5n0CbOEsx0ihcAGeO37Zwh7+hg+Thv6SGPc2VZ+yG+WuyGm8kI0+aUdMu5St6Gk9vBFYO5Cvqk01OvhZBDPG9h/rbl2+cEp/1a76gZT+nHFUchiPcz+OtFbbp1ztDTjHL3ZnB7lgklrBdZR4keiynEQXWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE4p0YzeWWuQDURuNHJmYDSPA+fd7dpTX3r/gdvxMKE=;
 b=AgjAgCioNMTgVLeVdkENir9n9PLRxkv0RTXmRToUF/sEtrVrWYlMna/60goiBAZggZfjitiHpSMnvQ7d/nWnYj39unuvluV9J4b9TJ8VK64LpN5FVYEOiRQb59GDKIheEZNNUFEU0XBocvENiTIrI1eKwmVcgRDoVZS3z94bQsc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 03/11] xen/arm: Introduce a generic way to access memory
 bank structures
Thread-Topic: [PATCH 03/11] xen/arm: Introduce a generic way to access memory
 bank structures
Thread-Index: AQHadH3mFY6wZkuH8kG5zjUlnZxCHbE/FIwAgAAFnIA=
Date: Tue, 19 Mar 2024 13:30:23 +0000
Message-ID: <5ED2A5C8-3B82-4E74-9CE6-46BFBC117F23@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-4-luca.fancellu@arm.com>
 <73dbf297-31ed-4cf1-b081-c6f82c234de8@amd.com>
In-Reply-To: <73dbf297-31ed-4cf1-b081-c6f82c234de8@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9653:EE_|DU6PEPF0000A7DF:EE_|DBBPR08MB5932:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /ciwN+zMFodSpepd3O0w3lSK1jN1Rsei8ygzDdR0oXNCgNy+dE0kKqi9r1fsAlQbMxJ91DfYEgqAtjUb8HzdsJo+x4JZtpJlVV4qTArKqYggGitBINLo+t1Tb0/npY3DZJEDMLWe7l/Us+Nwt3mX6rvxCaNfi4q+akWNS7anOzcOkjQ/KHAX7k+RJDDG4J7Bcp/tSFr0x2MUgPOfYJ44Gjp1gWq3IIGwODClYA5eRjd9JpqbFxkJJfEvPzQB++IANbDzhYTCRju4QpHAPbV+3dbdm3f17WsGv7CitOqMDX5WrZUYo833ZL6Qp7RVA/CWpxioAmk3brTNNnu1smpNAhcsWoiZ2vyoeCGGoPEyBior1pQ9Tp9I7Nb6F4MgP9taRwb3G6wd6SwkKSdfdq4hy843vUjKXXDjTBskuohgOZdliROdUscskhrp3tegq9Bk70Pr8XFQ94X+RpTxxvluThUHtZUKNu6dslA20dJ0pAvgwUeHJu3R1xYP4qoDY5xRgGUi2jinMt3lj7I7z66WuGX9s41mVCVmNs8bXtomu2/qhPGoWTYbPxBia2134CHbEt23wxpQ/InsWwcpLZuosQGBjy/g2uD01QF1r6MXTivewk4Uh7NXcb0b091d0gbbN3Ps3kP/9iu84MuuPe/oxgy/n0fK7UWPxWW8ko9dMDk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <92C2B57C671C6040867175F8D99596D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9653
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8022e06-10a7-4524-0a16-08dc4818c5be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AoQcTDcJQI3rr9s9va3f+yOd7uYwgvzXXco1HA3SpUvD1ELdiXTQ4oCIZVHb7JQ0KgiNxEuO50RV9/+5bNNp3H2SQMH+NRxlP4JoOhANr+fwGhnLgqlpeVaB6g5DEEXPdvp+NKSA/u31h16OWyJrTuDRtcFJHRK1fWc2EEbB6ilZTx0wH8lS2r3xpYWkuFQc87xyYgJL60nShlznEBa33wnmtbtM87V6qr04tkrrnLoECQBpKzMAAnj5kZQlJaJ2gC+/zBQUzrgvMlbbmOrbdEgUNg/UxXO+LB7l7VuIJfoctacxusugOLh3Tdb9gUPIOT1tNjTMIbWME4Xs1U3X2XWXEQzG2BpPlQ2cLpDQuJlktrQhZDymhDJb4jOSPZK5mSOXXEOkiGSNxUZZL4abQK4Tq7wL5WNnTseDTZZF65mrcFqm/mY0GiFH5cRbh4/JUpO9A7CAcGx4oAICO7i6u5Pre2JUp/22UsD4ZMnDTZ8dsDGpVgeb+HNMrcl0KYwGxLm1FOlM6Ei8MZmBmPzjp5FSfnxrZ0w4Uk9VzGbhB2zntEBNhrtpcAPaZsDprFEIHO+RbvYl2IGmKVnkJ4HTx8zbBuNFV3q6PxybX58dso1avFjk/nPhAku81+oqRoTquTh/txholoZnEUXA2nWew3s2VyB6uw1moIlrQVvdLHEwnrXvYJfIZyYBZECN21rYgsKKrDiIPBdejFVb4sKLAlmTsyKCpr4bwZIprXnLE066ocIDQT4gPdbG6EGACntB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 13:30:41.3748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8022e06-10a7-4524-0a16-08dc4818c5be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5932

DQoNCj4gT24gMTkgTWFyIDIwMjQsIGF0IDEzOjEwLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQoNCkhpIE1pY2hhbCwNCg0KVGhhbmtz
IGZvciBoYXZpbmcgYSBsb29rDQoNCj4gDQo+IE9uIDEyLzAzLzIwMjQgMTQ6MDMsIEx1Y2EgRmFu
Y2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4gQ3VycmVudGx5IHRoZSAnc3R1Y3QgbWVtaW5mbycg
aXMgZGVmaW5pbmcgYSBzdGF0aWMgZGVmaW5lZCBhcnJheSBvZg0KPj4gJ3N0cnVjdCBtZW1iYW5r
JyBvZiBOUl9NRU1fQkFOS1MgZWxlbWVudHMsIHNvbWUgZmVhdHVyZSBsaWtlDQo+PiBzaGFyZWQg
bWVtb3J5IGRvbid0IHJlcXVpcmUgc3VjaCBhbW91bnQgb2YgbWVtb3J5IGFsbG9jYXRpb24gYnV0
DQo+PiBtaWdodCB3YW50IHRvIHJldXNlIGV4aXN0aW5nIGNvZGUgdG8gbWFuaXB1bGF0ZSB0aGlz
IGtpbmQgb2YNCj4+IHN0cnVjdHVyZSB0aGF0IGlzIGp1c3QgYXMgJ3N0cnVjdCBtZW1pbmZvJyBi
dXQgbGVzcyBidWxreS4NCj4+IA0KPj4gRm9yIHRoaXMgcmVhc29uIGludHJvZHVjZSBhIGdlbmVy
aWMgd2F5IHRvIGFjY2VzcyB0aGlzIGtpbmQgb2YNCj4+IHN0cnVjdHVyZSB1c2luZyBhIG5ldyBz
dHVjdHVyZSAnc3RydWN0IG1lbWJhbmtzJywgd2hpY2ggaW1wbGVtZW50cw0KPiBzL3N0dWN0dXJl
L3N0cnVjdHVyZQ0KPiANCj4+IGFsbCB0aGUgZmllbGRzIG5lZWRlZCBieSBhIHN0cnVjdHVyZSBy
ZWxhdGVkIHRvIG1lbW9yeSBiYW5rcw0KPj4gd2l0aG91dCB0aGUgbmVlZCB0byBzcGVjaWZ5IGF0
IGJ1aWxkIHRpbWUgdGhlIHNpemUgb2YgdGhlDQo+PiAnc3RydWN0IG1lbWJhbmsnIGFycmF5Lg0K
PiBNaWdodCBiZSBiZW5lZmljaWFsIGhlcmUgdG8gbWVudGlvbiB0aGUgdXNlIG9mIEZBTS4NCj4g
DQo+PiANCj4+IE1vZGlmeSAnc3RydWN0IG1lbWluZm8nIHRvIGltcGxlbWVudCB0aGUgZmllbGQg
cmVsYXRlZCB0byB0aGUgbmV3DQo+PiBpbnRyb2R1Y2VkIHN0cnVjdHVyZSwgZ2l2ZW4gdGhlIGNo
YW5nZSBhbGwgdXNhZ2Ugb2YgdGhpcyBzdHJ1Y3R1cmUNCj4+IGFyZSB1cGRhdGVkIGluIHRoaXMg
d2F5Og0KPj4gLSBjb2RlIGFjY2Vzc2luZyBib290aW5mby57bWVtLHJlc2VydmVkX21lbSxhY3Bp
fSBmaWVsZCBub3cgdXNlcw0KPj4gICAzIG5ldyBpbnRyb2R1Y2VkIHN0YXRpYyBpbmxpbmUgaGVs
cGVycyB0byBhY2Nlc3MgdGhlIG5ldyBmaWVsZA0KPj4gICBvZiAnc3RydWN0IG1lbWluZm8nIG5h
bWVkICdjb21tb24nLg0KPj4gLSBjb2RlIGFjY2Vzc2luZyAnc3RydWN0IGtlcm5lbF9pbmZvICon
IG1lbWJlciAnbWVtJyBub3cgdXNlIHRoZQ0KPj4gICBuZXcgaW50cm9kdWNlZCBtYWNybyAna2Vy
bmVsX2luZm9fZ2V0X21lbSguLi4pJyB0byBhY2Nlc3MgdGhlDQo+PiAgIG5ldyBmaWVsZCBvZiAn
c3RydWN0IG1lbWluZm8nIG5hbWVkICdjb21tb24nLg0KPj4gDQo+PiBDb25zdGlmeSBwb2ludGVy
cyB3aGVyZSBuZWVkZWQuDQo+PiANCj4+IFN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4NCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL2FjcGkvZG9tYWluX2J1aWxkLmMg
ICAgICAgIHwgICA2ICstDQo+PiB4ZW4vYXJjaC9hcm0vYXJtMzIvbW11L21tLmMgICAgICAgICAg
ICAgfCAgNDQgKysrKystLS0tLQ0KPj4geGVuL2FyY2gvYXJtL2FybTY0L21tdS9tbS5jICAgICAg
ICAgICAgIHwgICAyICstDQo+PiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICAgICAgICAg
ICAgfCAgMjcgKysrLS0tDQo+PiB4ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYyAgICAgICAg
ICAgfCAgMTggKystLQ0KPj4geGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICAgICAgICAg
IHwgMTA2ICsrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPj4geGVuL2FyY2gvYXJtL2VmaS9lZmkt
Ym9vdC5oICAgICAgICAgICAgIHwgICA4ICstDQo+PiB4ZW4vYXJjaC9hcm0vZWZpL2VmaS1kb20w
LmMgICAgICAgICAgICAgfCAgMTMgKy0tDQo+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9t
YWluX2J1aWxkLmggfCAgIDIgKy0NCj4+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9rZXJuZWwu
aCAgICAgICB8ICAgOSArKw0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmggICAg
ICAgIHwgIDQwICsrKysrKysrLQ0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3N0YXRpYy1z
aG1lbS5oIHwgICA0ICstDQo+PiB4ZW4vYXJjaC9hcm0va2VybmVsLmMgICAgICAgICAgICAgICAg
ICAgfCAgMTIgKy0tDQo+PiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgICAg
fCAgNTggKysrKysrKy0tLS0tLQ0KPj4geGVuL2FyY2gvYXJtL3N0YXRpYy1tZW1vcnkuYyAgICAg
ICAgICAgIHwgIDI3ICsrKy0tLQ0KPj4geGVuL2FyY2gvYXJtL3N0YXRpYy1zaG1lbS5jICAgICAg
ICAgICAgIHwgIDM0ICsrKystLS0tDQo+PiAxNiBmaWxlcyBjaGFuZ2VkLCAyNDMgaW5zZXJ0aW9u
cygrKSwgMTY3IGRlbGV0aW9ucygtKQ0KPiBMb3RzIG9mIG1lY2hhbmljYWwgY2hhbmdlcyBidXQg
aW4gZ2VuZXJhbCBJIGxpa2UgdGhpcyBhcHByb2FjaC4NCj4gSSdkIGxpa2Ugb3RoZXIgbWFpbnRh
aW5lcnMgdG8gc2hhcmUgdGhlaXIgb3Bpbmlvbi4NCj4gDQo+IFsuLi5dDQo+IA0KPj4gQEAgLTEx
NTcsMTAgKzExNjMsMTIgQEAgaW50IF9faW5pdCBtYWtlX2h5cGVydmlzb3Jfbm9kZShzdHJ1Y3Qg
ZG9tYWluICpkLA0KPj4gICAgIH0NCj4+ICAgICBlbHNlDQo+PiAgICAgew0KPj4gLSAgICAgICAg
ZXh0X3JlZ2lvbnMgPSB4emFsbG9jKHN0cnVjdCBtZW1pbmZvKTsNCj4+ICsgICAgICAgIGV4dF9y
ZWdpb25zID0gKHN0cnVjdCBtZW1iYW5rcyAqKXh6YWxsb2Moc3RydWN0IG1lbWluZm8pOw0KPiBZ
b3UncmUgbWFraW5nIGFzc3VtcHRpb24gdGhhdCBzdHJ1Y3QgbWVtYmFua3MgaXMgdGhlIGZpcnN0
IG1lbWJlciBvZiBtZW1pbmZvIGJ1dCB0aGVyZSdzIG5vIHNhbml0eSBjaGVjay4NCj4gV2h5IG5v
dCB4emFsbG9jX2ZsZXhfc3RydWN0KCk/DQoNCknigJlsbCB1c2UgdGhhdCwgYXMgd2VsbCBhcyB0
aGUgY2hlY2sgeW91IHN1Z2dlc3RlZCBiZWxvdw0KDQo+IA0KPj4gICAgICAgICBpZiAoICFleHRf
cmVnaW9ucyApDQo+PiAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IFsuLi5dDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2tlcm5lbC5oIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2tlcm5lbC5oDQo+PiBpbmRleCAwYTIzZTg2YzJkMzcuLmQyOGI4
NDNjMDFhOSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9rZXJuZWwu
aA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2tlcm5lbC5oDQo+PiBAQCAtNzgs
NiArNzgsMTUgQEAgc3RydWN0IGtlcm5lbF9pbmZvIHsNCj4+ICAgICB9Ow0KPj4gfTsNCj4+IA0K
Pj4gKyNkZWZpbmUga2VybmVsX2luZm9fZ2V0X21lbShraW5mbykgXA0KPj4gKyAgICAoJihraW5m
byktPm1lbS5jb21tb24pDQo+IFdoeSB0aGlzIGlzIGEgbWFjcm8gYnV0IGZvciBib290aW5mbyB5
b3UgdXNlIHN0YXRpYyBpbmxpbmUgaGVscGVycz8NCg0KU28gSSB0aGluayBJIHN0YXJ0ZWQgdXNp
bmcgc3RhdGljIGlubGluZSBoZWxwZXJzIGJ1dCBJIGhhZCB0byBoYXZlIG9uZSB0aGF0IGRpZG7i
gJl0DQpyZW1vdmUgdGhlIGNvbnN0IHF1YWxpZmllciwgYW5kIGl0IHdhcyB1c2VkIG9ubHkgb25j
ZS4gQW55d2F5IGlmIGl0IGlzIGFjY2VwdGFibGUNCkkgd2lsbCBnbyBmb3Igc3RhdGljIGlubGlu
ZSBhbHNvIGhlcmUuDQoNCj4gDQo+PiArDQo+PiArI2RlZmluZSBLRVJORUxfSU5GT19JTklUIFwN
Cj4gTklUOiBpbiBtb3N0IHBsYWNlcyB3ZSBwcmVmZXIgXCB0byBiZSBhbGlnbmVkICh0aGUgc2Ft
ZSBhcHBseSB0byBvdGhlciBwbGFjZXMpDQoNCmtrDQoNCj4gDQo+PiAreyBcDQo+PiArICAgIC5t
ZW0uY29tbW9uLm1heF9iYW5rcyA9IE5SX01FTV9CQU5LUywgXA0KPj4gKyAgICAuc2htX21lbS5j
b21tb24ubWF4X2JhbmtzID0gTlJfTUVNX0JBTktTLCBcDQo+PiArfQ0KPj4gKw0KPj4gLyoNCj4+
ICAqIFByb2JlIHRoZSBrZXJuZWwgdG8gZGV0ZW1pbmUgaXRzIHR5cGUgYW5kIHNlbGVjdCBhIGxv
YWRlci4NCj4+ICAqDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Nl
dHVwLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaA0KPj4gaW5kZXggZDE1YTg4
ZDJlMGQxLi5hM2UxZGM4ZmRiNmMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vc2V0dXAuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmgN
Cj4+IEBAIC01Niw4ICs1NiwxNCBAQCBzdHJ1Y3QgbWVtYmFuayB7DQo+PiAjZW5kaWYNCj4+IH07
DQo+PiANCj4+IC1zdHJ1Y3QgbWVtaW5mbyB7DQo+PiArc3RydWN0IG1lbWJhbmtzIHsNCj4+ICAg
ICB1bnNpZ25lZCBpbnQgbnJfYmFua3M7DQo+PiArICAgIHVuc2lnbmVkIGludCBtYXhfYmFua3M7
DQo+PiArICAgIHN0cnVjdCBtZW1iYW5rIGJhbmtbXTsNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0cnVj
dCBtZW1pbmZvIHsNCj4+ICsgICAgc3RydWN0IG1lbWJhbmtzIGNvbW1vbjsNCj4gWW91IHdlcmUg
c3VwcG9zZWQgdG8gbWFrZSBzdXJlIHRoZXJlIGlzIG5vIGV4dHJhIHBhZGRpbmcgaGVyZS4gSSBk
b24ndCBzZWUgYW55IGNoZWNrIGluIHRoaXMgcGF0Y2guDQo+IEknZCBhdCBsZWFzdCBkbyBzdGgg
bGlrZToNCj4gQlVJTERfQlVHX09OKChvZmZzZXRvZihzdHJ1Y3QgbWVtYmFua3MsIGJhbmspKSAh
PSAob2Zmc2V0b2Yoc3RydWN0IG1lbWluZm8sIGJhbmspKSk7DQoNCknigJlsbCBhZGQgdGhpcyBj
aGVjaywgdGhhbmtzIQ0KDQo+IA0KPiB+TWljaGFsDQoNCg==

