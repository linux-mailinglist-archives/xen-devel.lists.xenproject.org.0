Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C4429558
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206384.361943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyrb-0005Ex-3J; Mon, 11 Oct 2021 17:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206384.361943; Mon, 11 Oct 2021 17:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZyrb-0005Ci-02; Mon, 11 Oct 2021 17:13:23 +0000
Received: by outflank-mailman (input) for mailman id 206384;
 Mon, 11 Oct 2021 17:13:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZyrZ-0005Cc-76
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:13:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7c0e3ca-382a-4212-9509-260e9a9dd7e3;
 Mon, 11 Oct 2021 17:13:18 +0000 (UTC)
Received: from DB6PR0201CA0028.eurprd02.prod.outlook.com (2603:10a6:4:3f::38)
 by DB7PR08MB3227.eurprd08.prod.outlook.com (2603:10a6:5:1f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26; Mon, 11 Oct
 2021 17:13:15 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::f2) by DB6PR0201CA0028.outlook.office365.com
 (2603:10a6:4:3f::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 17:13:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 17:13:15 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Mon, 11 Oct 2021 17:13:15 +0000
Received: from dc32fd044ce2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EE801A2C-919B-4DB3-A775-D21EC95028E5.1; 
 Mon, 11 Oct 2021 17:11:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc32fd044ce2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 17:11:34 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3769.eurprd08.prod.outlook.com (2603:10a6:10:7b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 17:11:31 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 17:11:31 +0000
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
X-Inumbo-ID: a7c0e3ca-382a-4212-9509-260e9a9dd7e3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zgwV/V/LAzdrofH2bmODNKRUygFZoH0srIdTPBfcnk=;
 b=4apOnvKiJha6JT/YPl4PiAaqEvTUnIcsJAKS+TnnHedmcCkKPBYgqTWjvh43AV3f97XqmzYHPBwXs5fg//CfRL8dmgdbrYWVMUtWmWKZ48QHuP8NvROQrMJJ81oHK3B1GVvrkWi+UsMIIN7KxwkmYhIymShQ0YvZXOXRAVGARfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e5ef4273c5710aac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmYUuxEwdUwXtJxP9kqUor9ROgU8d21Ptju2OK+03vR/6rgcAF6mafN96s32UcUpryePZ7Yf3TiaUB4FrAvqXQn2klPTKVcvE+ROSDejmgeyQqAkkBeaM5RCutWtxKLK82zFejq/oumf2cpnSfBS087DzTuspbOwy+q1JqLH8rDfpHC6LTzO3NLxMloAI8rfc7MFkkpwR6VmxadgDIc+FCB5CwPL2PWXDI1bb3DLpVL/7rjB7Y68JIwKGxa7zI1aYR6WvVqkqMfofVipQW/rqD5PqRw/sYsorZuBYR+LwZSzThnqf4dNMjqvWQyf+Up407NDUu/E2XOxPfw+G1iPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zgwV/V/LAzdrofH2bmODNKRUygFZoH0srIdTPBfcnk=;
 b=T+enonhqtT7uQpkZ3m8UncU/VfTph87KCvVnBvKPJbs/YfEN21x/6h9q9h8+JfpTWl8+JgyiCWrlnrjErjYJAufGJe0u6jywkqs6nYVvTqEdUDgMj8FW3wKmXxNDtdWoEx5lM/a/B/IQAznjyZGtNptfsXygXMY3f8D5NMyKT97BOI4jugfTfqJdAk2aCje4hUocD39aQgEenUrJTzZns4gF665OQuB0k4oX1nb22Y145cbwWKLEVlKdsEnh5fZqBXH3XQInf8Ax5HeGB7PHqR9l8lXQ5ZumwWoY36omHf2eRXLx5OE8RRl9wynbW4PwNza4y4qqV6Dd9Qfs3iafSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zgwV/V/LAzdrofH2bmODNKRUygFZoH0srIdTPBfcnk=;
 b=4apOnvKiJha6JT/YPl4PiAaqEvTUnIcsJAKS+TnnHedmcCkKPBYgqTWjvh43AV3f97XqmzYHPBwXs5fg//CfRL8dmgdbrYWVMUtWmWKZ48QHuP8NvROQrMJJ81oHK3B1GVvrkWi+UsMIIN7KxwkmYhIymShQ0YvZXOXRAVGARfQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index:
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAIAAJiWAgAAK0IA=
Date: Mon, 11 Oct 2021 17:11:31 +0000
Message-ID: <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
In-Reply-To: <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f217c926-9895-4050-1068-08d98cda69a9
x-ms-traffictypediagnostic: DB7PR08MB3769:|DB7PR08MB3227:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3227493B4A508A89EA64FB009DB59@DB7PR08MB3227.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TVCPE2DRPQsJhTAHxihJcWmm/Zist3DTubGUkgpXRHbQ4N9ZPXWQ9iKGeJ3475uDd38nik+iYSjl1zSIquebMcoXI/2h6ui0h2sZns4zdLVBDIC6siqDcvc8/+lf0aayWLflibLa/Jr7Wz6xcAHlnpIRop7SFULAczVEMd9DE5Lx1Q5o4v6klNuWAdrOynEwno7gCx970ow61uGVPd/glk/PVlalwR1rUQKQG8NGa2a2JFDKW4pcE2Lt7jOLN5AfjP6YCPBMQGK8au78nahmUWSZChcQK/UE95CjEBahGwWcbhfxdFpaoRvS9eU4GbL/x883V0kh8Udduh2Li6fAeuuA/nNAR17ks3R/KN4jmunxUSLZlbMPJ6OdemokyDIR6fqXrBaqpxj1DXDMob26VwwhD0fC5Jjb09QYb4+hu791oVS/afD0uCzKKKluq/O5t397jgE8kL9sW2m9qravsRt88pH1TZyB7U0ZVN4bZvVbvk5FmIIXi8EmJasDpMbm0ibAHeHf1tGb12CyjgVTyQmmca0tbrsmVAYuObgUWxWK+Woov7wSKjSGsG+uKf6fM7MIFSia+udbJGrNgBZExAU0z899skpsaxvX2/G22c4S/b4Hke7QXHvXXfv3l9xuxDapv/8qdenTJnUpKPBRsdAbF90v6qpXiJhwNBg1nPm9hOGsSLeUlxDFE1cgYAX+sD0XTElmcsmKsugheWuy88Jzy53iv9AYKCNX11kNdBLNMrcpyYuzdcwnZlmB0WaZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(84040400005)(4326008)(8936002)(2906002)(38100700002)(6512007)(71200400001)(33656002)(53546011)(6916009)(316002)(6506007)(36756003)(54906003)(122000001)(86362001)(38070700005)(26005)(91956017)(508600001)(6486002)(2616005)(66556008)(5660300002)(8676002)(66446008)(83380400001)(66946007)(76116006)(64756008)(66476007)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7FE91F9E3B04B4BBD9B2BC62989200A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3769
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7de8ba3a-1cef-4b6e-256f-08d98cda2bee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o0VQOZTCUpfhkk2ZeXP999lIkwnXAYm8cL2houcCghhTSvch9PSpWlDgStaEOMmLE86FPfwp8QabtAbsgHOaDBNdEZlyPt7/ZNqljoQDlbB6KEcnZSeE3xlXgFkhpYLN7LLiKCWI+KIGHA3s5lSiSrAdSKKb4NWBhjLG+BjCChmTMq21tiO87QnYi3w5lWAcO12Dq0gm62GWsg9hF1wymJIK4ukHRDhQWx5nlyeT44yvWtOqqqyNClThPiPks7Kq/BSUDV2Mq/MxqR6kj6wUD9OL/pgNoiy5hR6uEvkI7pa4WV/BGGtwFJowTq8C2wEev0csgjv24LayVV5MsFaj6g6TsOwJ/WXjuITnXeGPCEEChW+OSWu6by7vTkSUdrSyZl6fcvZ3lTTttwfnoDc/stWMLpr+wlYkLpGa5yqwPV0qsGZh+FMs3OIhCYIibChlDhCPEYE/Qst65aPERk6hGxNzCWpmoGKasJdi/KNXJBx+iACVlULEOzjQrMwJapnEdKIv1Rfuol6OjVlBOX79Y3lesTspdFyTOkqHbRD7J1P4dK0fYLkefFUZ8KMmwHh8UxxaiU0t0Vx3P2GRzu0y2ZuNdV+ZDlwxUAku2RYdw8a7ZJzro3uYrIJAHsQgRENgUXa/QfVNrowt9P5ctZSSAUoEE/uD5r/c13l3YgRE2suaqzsAoWAaGw6WcAiKB9UJPe+sm8nJgpSpHtHSjZHYDg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(84040400005)(36840700001)(46966006)(70206006)(5660300002)(107886003)(47076005)(53546011)(6506007)(186003)(26005)(2906002)(70586007)(54906003)(6512007)(83380400001)(81166007)(86362001)(2616005)(33656002)(356005)(8676002)(6862004)(4326008)(36756003)(336012)(316002)(6486002)(36860700001)(508600001)(8936002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 17:13:15.3002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f217c926-9895-4050-1068-08d98cda69a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3227

SGkgUm9nZXIsDQoNCj4gT24gMTEgT2N0IDIwMjEsIGF0IDE3OjMyLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIE9jdCAxMSwgMjAy
MSBhdCAwMjoxNjoxOVBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgUm9n
ZXIsDQo+PiANCj4+PiBPbiAxMSBPY3QgMjAyMSwgYXQgMTQ6NTcsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBNb24sIE9jdCAxMSwg
MjAyMSBhdCAwMTo0MDozMFBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBI
aSBSb2dlciwNCj4+Pj4gDQo+Pj4+ICsgT2xla3NhbmRyIHRvIGhhdmUgYSBiZXR0ZXIgUENJIGV4
cGVydCB0aGVuIG1lLg0KPj4+PiANCj4+Pj4+IE9uIDExIE9jdCAyMDIxLCBhdCAxNDoyMCwgUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+
PiBPbiBNb24sIE9jdCAxMSwgMjAyMSBhdCAxMjoxMTowNFBNICswMDAwLCBCZXJ0cmFuZCBNYXJx
dWlzIHdyb3RlOg0KPj4+Pj4+IEhpIFJvZ2VyLA0KPj4+Pj4+IA0KPj4+Pj4+PiBPbiAxMSBPY3Qg
MjAyMSwgYXQgMTI6NDcsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3
cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IE9uIFdlZCwgT2N0IDA2LCAyMDIxIGF0IDA2OjQwOjI3
UE0gKzAxMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4gQVJNIGFyY2hpdGVjdHVyZSBk
b2VzIG5vdCBpbXBsZW1lbnQgSS9PIHBvcnRzLiBJZ25vcmUgdGhpcyBjYWxsIG9uIEFSTQ0KPj4+
Pj4+Pj4gdG8gYXZvaWQgdGhlIG92ZXJoZWFkIG9mIG1ha2luZyBhIGh5cGVyY2FsbCBqdXN0IGZv
ciBYZW4gdG8gcmV0dXJuDQo+Pj4+Pj4+PiAtRU5PU1lTLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gV2hh
dCBpcyB0aGUgY2FsIHRyYWNlIG9mIHRoaXMgZnVuY3Rpb24gYWN0dWFsbHkgb24gQXJtPw0KPj4+
Pj4+PiANCj4+Pj4+Pj4gQUZBSUNUIGxpYnhsIHdpbGwgb25seSBjYWxsIHhjX2RvbWFpbl9pb3Bv
cnRfcGVybWlzc2lvbiBpZiB0aGVyZSBhcmUNCj4+Pj4+Pj4gSU8gcG9ydHMgZXhwbGljaXRseSBk
ZWZpbmVkIGluIHRoZSBndWVzdCBjb25maWd1cmF0aW9uLCBvciBpZiBhbnkgb2YNCj4+Pj4+Pj4g
dGhlIEJBUnMgb2YgdGhlIFBDSSBkZXZpY2UgaXMgaW4gdGhlIElPIHNwYWNlLCB3aGljaCBpcyBu
b3QgcG9zc2libGUNCj4+Pj4+Pj4gb24gQXJtLg0KPj4+Pj4+IA0KPj4+Pj4+IFBDSSBkZXZpY2Vz
IEJBUnMgY2FuIGJlIGluIHRoZSBJTyBzcGFjZSBhcyB0aGUgUENJIGRldmljZXMgYXJlIG5vdA0K
Pj4+Pj4+IEFybSBzcGVjaWZpYy4gVGhlcmUgaXMgbm90IGlvcG9ydHMgb24gYXJtIHNvIHRvIGJl
IHVzZWQgdGhvc2UgY2FuIGJlDQo+Pj4+Pj4gaW4gc29tZSBjYXNlcyByZW1hcHBlZCBhbmQgYWNj
ZXNzZWQgYXMgTU1JT3Mgb3IgYXJlIG5vdCBwb3NzaWJsZQ0KPj4+Pj4+IHRvIHVzZSBhdCBhbGwu
DQo+Pj4+Pj4gDQo+Pj4+Pj4gQnV0IHRoZSBJTyBzcGFjZSBkb2VzIGFwcGVhciB3aGVuIEJBUnMg
YXJlIGxpc3RlZCBldmVuIG9uIEFybS4NCj4+Pj4+IA0KPj4+Pj4gVXJnLCBJIHdvbmRlciB3aGV0
aGVyIHRob3NlIGRldmljZXMgd2l0aCBJTyBCQVJzIHdpbGwgd29yayBjb3JyZWN0bHkNCj4+Pj4+
IHVuZGVyIEFybSB0aGVuLg0KPj4+Pj4gDQo+Pj4+PiBIb3cgZG8geW91IGtub3cgd2hldGhlciB0
aGUgQkFSIGhhcyBiZWVuIHJlbWFwcGVkIGZyb20gSU8gc3BhY2UgaW50bw0KPj4+Pj4gTU1JTz8N
Cj4+Pj4gDQo+Pj4+IFdlIGNhbm5vdCwgSSB0aGluayB0aGUgcGxhdGZvcm0gd2lsbCBkZWZpbmUg
aWYgdGhpcyBpcyB0aGUgY2FzZSBhbmQgd2hlcmUuDQo+Pj4+IEBvbGVrc2FuZHI6IEkgcmVtZW1i
ZXIgdGhhdCB0aGlzIHdhcyBkaXNjdXNzZWQgZHVyaW5nIHNvbWUgb2Ygb3VyDQo+Pj4+IG1lZXRp
bmdzIGJ1dCBJIGhhdmUgbm8gaWRlYSBvZiB0aGUgZGV0YWlscyBoZXJlLCBjYW4geW91IGhlbHAg
Pw0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4gSU1PIGluc3RlYWQgb2YgZmFraW5nIGEgc3VjY2Vzc2Z1
bCByZXR1cm4gdmFsdWUgZnJvbQ0KPj4+Pj4geGNfZG9tYWluX2lvcG9ydF9wZXJtaXNzaW9uIHdl
IHNob3VsZCBhdm9pZCB0aGUgY2FsbCBjb21wbGV0ZWx5IGluIHRoZQ0KPj4+Pj4gZmlyc3QgcGxh
Y2UsIHNwZWNpYWxseSBpZiB3ZSBuZWVkIHRvIGluc3RlYWQgaXNzdWUgYSBjYWxsIHRvDQo+Pj4+
PiB4Y19kb21haW5faW9tZW1fcGVybWlzc2lvbi4NCj4+Pj4gDQo+Pj4+IEF0IHRoZSBlbmQgd2Ug
d2lsbCBuZXZlciBoYXZlIHRvIGlzc3VlIHRoaXMgYmVjYXVzZSB0aGlzIHdpbGwgbmV2ZXIgYmUg
YSBtYXR0ZXINCj4+Pj4gb2Yg4oCcaW9tZW3igJ0gcGVybWlzc2lvbiBhcyB0aGVyZSB3b3VsZCBu
b3QgYmUgYW55IHdheSB0byBjdXQgb24gc29tZXRoaW5nIHVuZGVyDQo+Pj4+IHRoZSBwYWdlLiBJ
ZiB0aGlzIGlzIHRvIGJlIHN1cHBvcnRlZCBvbmUgZGF5LCBpdCB3aWxsIHByb2JhYmx5IGhhdmUg
dG8gYmUgZnVsbHkgZW11bGF0ZWQNCj4+Pj4gdG8ga2VlcCB0aGUgaXNvbGF0aW9uLg0KPj4+IA0K
Pj4+IFNvIHlvdSBoYXZlIGEgc2V0IG9mIG1lbW9yeSBwYWdlcyB0aGF0IG1hcCBhY2Nlc3NlcyBm
cm9tDQo+Pj4gTU1JTyBpbnRvIElPIHNwYWNlIGJ1dCBpdCdzIG5vdCBwb3NzaWJsZSB0byBpc29s
YXRlIHNwZWNpZmljIElPIHBvcnQNCj4+PiByZWdpb25zIGFzIHRoZXkgYXJlIGFsbCBjb250aWd1
b3VzIGluIHRoZSBzYW1lIHBhZ2UocykuDQo+PiANCj4+IEV4YWN0Lg0KPj4gDQo+Pj4gDQo+Pj4+
IFJpZ2h0IG5vdyBvbiBhcm0geW91IGNhbiBqdXN0IG1ha2UgdGhlIG1vcmUgc2ltcGxlIGFzc3Vt
cHRpb24gdGhhdCBpb3BvcnRzIGFyZQ0KPj4+PiBqdXN0IG5vdCBzdXBwb3J0ZWQuDQo+Pj4gDQo+
Pj4gV291bGQgaXQgbWFrZSBzZW5zZSBpbiB0aGUgZnV0dXJlIHRvIHByb3ZpZGUgYSBtZW1vcnkg
cmVnaW9uIHRvIGd1ZXN0cw0KPj4+IGluIG9yZGVyIHRvIHVzZSBmb3IgSU8gcG9ydCBhY2Nlc3Nl
cywgYW5kIGNhbGwNCj4+PiB4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24gdG8gc2V0IHdoaWNo
IHBvcnRzIHdvdWxkIGJlIGFsbG93ZWQ/DQo+PiANCj4+IFJpZ2h0IG5vdyB3ZSBkbyBub3QgcGxh
biB0byBzdXBwb3J0IHRoaXMgYXQgYWxsIGFuZCB3ZSB3aWxsIGhhdmUgdG8NCj4+IGZpZ3VyZSB0
aGlzIG91dCBpZiB3ZSBkbyB0aGlzIG9uZSBkYXkuDQo+PiANCj4+PiANCj4+PiBJIHRoaW5rIHRo
ZSBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBhdCBsZWFzdCBiZSBleHBhbmRlZCBpbiBvcmRlciB0
bw0KPj4+IGNvbnRhaW4gdGhlIGluZm9ybWF0aW9uIHByb3ZpZGVkIGhlcmUuIEl0IG1pZ2h0IGFs
c28gYmUgaGVscGZ1bCB0bw0KPj4+IGZpZ3VyZSBvdXQgd2hldGhlciB3ZSB3b3VsZCBoYXZlIHRv
IGhhbmRsZSBJTyBwb3J0IGFjY2Vzc2VzIGluIHRoZQ0KPj4+IGZ1dHVyZSBvbiBBcm0sIG9yIGlm
IGl0J3MgZmluZSB0byBqdXN0IGlnbm9yZSB0aGVtLg0KPj4gDQo+PiBBbGwgb3VyIGludmVzdGln
YXRpb25zIGFuZCB0ZXN0cyBoYXZlIGJlZW4gZG9uZSB3aXRob3V0IHN1cHBvcnRpbmcgaXQNCj4+
IHdpdGhvdXQgYW55IGlzc3VlcyBzbyB0aGlzIGlzIG5vdCBhIGNyaXRpY2FsIGZlYXR1cmUgKG1v
c3QgZGV2aWNlcyBjYW4NCj4+IGJlIG9wZXJhdGVkIHdpdGhvdXQgdXNpbmcgdGhlIEkvTyBwb3J0
cykuDQo+IA0KPiBJTU8gd2Ugc2hvdWxkIGxldCB0aGUgdXNlcnMga25vdyB0aGV5IGF0dGVtcHRl
ZCB0byB1c2UgYSBkZXZpY2Ugd2l0aA0KPiBCQVJzIGluIHRoZSBJTyBzcGFjZSwgYW5kIHRoYXQg
dGhvc2UgQkFScyB3b24ndCBiZSBhY2Nlc3NpYmxlIHdoaWNoDQo+IGNvdWxkIG1ha2UgdGhlIGRl
dmljZSBub3QgZnVuY3Rpb24gYXMgZXhwZWN0ZWQuDQo+IA0KPiBEbyB5b3UgdGhpbmsgaXQgd291
bGQgYmUgcmVhc29uYWJsZSB0byBhdHRlbXB0IHRoZSBoeXBlcmNhbGwgb24gQXJtDQo+IGFsc28s
IGFuZCBpbiBjYXNlIG9mIGVycm9yIChvbiBBcm0pIGp1c3QgcHJpbnQgYSB3YXJuaW5nIG1lc3Nh
Z2UgYW5kDQo+IGNvbnRpbnVlIG9wZXJhdGlvbnMgYXMgbm9ybWFsPw0KDQpJIHRoaW5rIHRoaXMg
d291bGQgbGVhZCB0byBhIHdhcm5pbmcgcHJpbnRlZCBvbiBsb3RzIG9mIGRldmljZXMgd2hlcmUg
aW4NCmZhY3QgdGhlcmUgd291bGQgYmUgbm8gaXNzdWVzLg0KDQpJZiB0aGlzIGlzIGFuIGlzc3Vl
IGZvciBhIGRldmljZSBkcml2ZXIgYmVjYXVzZSBpdCBjYW5ub3Qgb3BlcmF0ZSB3aXRob3V0DQpJ
L08gcG9ydHMsIHRoaXMgd2lsbCBiZSByYWlzZWQgYnkgdGhlIGRyaXZlciBpbnNpZGUgdGhlIGd1
ZXN0Lg0KDQpTbyBpbiB0aGUgY3VycmVudCBzdGF0ZSBJIHRoaW5rIHRoZSB3YXkgdG8gZG8gaXQg
aXMgcmlnaHQuDQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoN
Cg==

