Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DB719054
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 04:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542200.845784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4XeM-0003aU-NZ; Thu, 01 Jun 2023 02:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542200.845784; Thu, 01 Jun 2023 02:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4XeM-0003XW-IZ; Thu, 01 Jun 2023 02:02:50 +0000
Received: by outflank-mailman (input) for mailman id 542200;
 Thu, 01 Jun 2023 02:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzP7=BV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q4XeK-0003XQ-Tf
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 02:02:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 653cfc31-0020-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 04:02:44 +0200 (CEST)
Received: from DU2PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:3b::21)
 by PAXPR08MB7672.eurprd08.prod.outlook.com (2603:10a6:102:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 02:02:39 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::a5) by DU2PR04CA0016.outlook.office365.com
 (2603:10a6:10:3b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 02:02:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 02:02:38 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 01 Jun 2023 02:02:38 +0000
Received: from 005c8d55ff40.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5704C353-B401-47FB-8906-1E276FD2F6ED.1; 
 Thu, 01 Jun 2023 02:02:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 005c8d55ff40.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jun 2023 02:02:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6096.eurprd08.prod.outlook.com (2603:10a6:102:eb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 02:02:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 02:02:29 +0000
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
X-Inumbo-ID: 653cfc31-0020-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLN+j1B1D1/YqfLvwUdLjB+68Ovdqan/p/cSJ8ERq/Y=;
 b=AFd7mS56V1ahnhsIVAft+e2X3qB3czGllxVP5f6AQa8uJC3Ie5XlaCkv+JJhIZY78+QIwvoE8Kqs6aYmTMkZ2UmwGbZSg6mqpDC75D0Z3iATXu+i1A7t1OrNF7cLV/RAgmc4fmPDR+0GxZwHq/+cDo5o9O9X2/dppy2EPgRR8RM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCdKc5m5U2++yUbdxjsRiwyFmgOELvg5YpwvxV5fIcev7i2QIty9Ejd57YqA2Qjvd9IG8UbSLGlz781bCUvImACt8U9+IIbR9ls0z3FQF7LBiIt13XA7C3ye8SMMz2bnl5UZAvLLyjNS6LL/lTR0mOE7NTUVBoJlKI9MIbBwjpRoEGr77rg1O9OlGw0YNkMBmykvXDTEiFvAgADk1XZgijrzcZmRKdnHRJJP29qoPw2NFgJgpUEhQtdY8uJjgHmb1Tu4+abjTBmT/tQddSDpUQkWDVzMDeDN+9+qJxOSrzSrpGKtV7NdryqeasIYPPE/Qzc/UTSA8yrP1AXm2nMGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLN+j1B1D1/YqfLvwUdLjB+68Ovdqan/p/cSJ8ERq/Y=;
 b=Y23hglO/aZgO86lZ1z438zUK8gdEaI7PlXLJFldeiTFi/omzyvGjEgbzJ08yOL9a3UqF89SYS+YIGMNZDDcz3AU8J4kj/dNevvYDU0fE8X4rSRjQnEs1wF+0PqtHrI8J+37bBZYQaZMtJGX7oHqodbsqU7lxCcas1KZjpz6g32JrG0xXTxG6ZmAKbasaSdWktyQo0SIfEhsx6sKbKHRYakb7XToELpwbX3XJZIgrzuxRWFvu59w8qwkcYkYn2KTkgyL81aJ3sQ1Vlm6A7OZK/tYM28u9o4DqH5puJcWEqEzA5ySEXlE9yQ3bsbq3WMK3WwO4hG7T35mfV+z6ommlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLN+j1B1D1/YqfLvwUdLjB+68Ovdqan/p/cSJ8ERq/Y=;
 b=AFd7mS56V1ahnhsIVAft+e2X3qB3czGllxVP5f6AQa8uJC3Ie5XlaCkv+JJhIZY78+QIwvoE8Kqs6aYmTMkZ2UmwGbZSg6mqpDC75D0Z3iATXu+i1A7t1OrNF7cLV/RAgmc4fmPDR+0GxZwHq/+cDo5o9O9X2/dppy2EPgRR8RM=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, Michal Orzel
	<michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>
Subject: RE: [XEN][PATCH v6 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Topic: [XEN][PATCH v6 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Index: AQHZfU8kxczuWvlyd0qZ9yNYcQTG6K9JhHkwgAhT/4CAIzuLgIAASt/Q
Date: Thu, 1 Jun 2023 02:02:29 +0000
Message-ID:
 <AS8PR08MB799178D9DEDB69CECEA7199C92499@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-9-vikram.garhwal@amd.com>
 <AS8PR08MB79910CFF4439E503046660EF926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <080bd1fe-a58c-5bdf-eef5-995420001ca4@amd.com>
 <99b0bdf6-b215-f65f-aad9-3ae74a14f66e@amd.com>
In-Reply-To: <99b0bdf6-b215-f65f-aad9-3ae74a14f66e@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 84F58158CE6F064FA802998E50AE6E48.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6096:EE_|DBAEUR03FT063:EE_|PAXPR08MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: f08b5f32-030d-4c5f-a3ba-08db624446ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f+EqnAKc1vaavmSaquu5PT2sq3FRSSs/xdfTqKUikwqXi9BlpqBBsiEz4ktcY/DycI+Izx8fWQhSDn440FVYHfrRlyORLDM3deN0VOs4g0kLj3GtzzUvkWMETnSKKgK+r/tUpl6RCCZPC9PonbdCN076aEyW8cK9T9m2GzS4J6pl5bxI/X9F3xlJpu00xcWbuekbNc5OGvaZpmcO/J88TG+kcm2tdATCdqrg8jG83Ab3ZPv3r3tDbBRNL25w/0Cx0bSGBUQdmMUcBgyfrqG9CS1Z3kwArAnhV9qZSTkmHFDFcKbNASUOaSJ+3dFXb4Y9gznVoUB1U4/mBgKfONa9Enp3TkDUD6MMcCDDdW7aM+CtUQnuPP+UvCRppzE4WvuilF4Okn7VhbEJqldEf1toQXIY3b1gsqUliwgs22nUt5FrkJ+nGV/keXgqiklXigedP13sZNoEufASFzPVB8PGsgxKDp3LqJkzkrz19r64ZfDq+bysAIybFnfOUanaK8n+YEj+MTa3Tm4sLTzP+jH7go7SH0AStlAL+cM45wFXv7SJdiJkJZZpTf4y2BdhVcquhtkQ3uMcK4yFj1CnYTunKpaLdybaV3xzCmRDd7odig3T1z3unCnvuOXiRDpheg6dGkJ27YZ0pwMrzS+AwiCgrA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(478600001)(54906003)(7696005)(110136005)(26005)(186003)(2906002)(71200400001)(4744005)(6506007)(8936002)(316002)(4326008)(5660300002)(76116006)(66446008)(41300700001)(66946007)(66556008)(64756008)(52536014)(66476007)(8676002)(38100700002)(122000001)(55016003)(9686003)(86362001)(38070700005)(33656002)(83380400001)(37363002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6096
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1be3ba44-2db6-480f-0beb-08db6244417d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oe0/0tXREGx0Xb/HDn2XDhXbt38sMTV321vOUmmC2y81r1ZMIOEYuOOEJntl+K1O+zhgpoR4ja3E46SIxHv04yNul/XMdzsNzod8XuJLX5+2EqxNY7WEmyqa0bMCRd1bL0dNc0uaj3STH4PzEEFshHD4OLnTkexRUs1b9IAn+ILiYNuy9/zdz67MJHGHBztQ52de8+HJzhlfePwd2+OouNFfTFzxgCMGUDU6O5oK7k6x5uV6lO8ONS8rjXdlLsP6rXwavbOaONmnOiXAXgAA/T3bNtJIiMwTZnUKesI/5w/9aM+IpvbcvWNLUTYS3QRAbbOdrUujQotanv48K4pGP8o08w/RQUV4JckX1bbsNgyAkwxH1m4yogVDsTK0G6q7IyChq97697yhBkLAmpUF0+tLJp03LcrQVbpeP5WKS62oZBq/dm40nHDPAJvjKSBS/x2KEeg8bzf2qh36lynPq7iTpWmvmIzMoCpLDy8RLEiRV7jINBufDRhXPvXRAxfobz58422L9skr4xRqHMhbsIBEMkre18J8biybHUQEzLiKpi0BfcGbxHoHBCbuu+2GuHpbegQm+OhQ1dZR1v+9nTWAjy9KjQSjIGPmpr+3iU/JONz/tbH+D9DdCI4vftAA7gvL6vfJCNjaiaRWS7sF/HLlqNP5wLlQkxzXDiP+MfFVjhoktxNq3fTrnjFfptE6IEY2BlPKY3LeNqucDfNi7+ui11izKMYFROiLOLax6hnChk8xKv92px3NAZEwZTvGe4cGCxFFPkzO33l02DHZmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(70206006)(70586007)(2906002)(316002)(4326008)(41300700001)(4744005)(110136005)(54906003)(5660300002)(52536014)(8936002)(8676002)(36860700001)(40460700003)(478600001)(7696005)(356005)(40480700001)(55016003)(6506007)(26005)(33656002)(83380400001)(9686003)(336012)(47076005)(186003)(82740400003)(81166007)(82310400005)(86362001)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 02:02:38.6835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f08b5f32-030d-4c5f-a3ba-08db624446ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7672

SGkgVmlrcmFtLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEhpIEhlbnJ5ICYg
TWljaGFsLA0KPiBDaGFuZ2VkIHRoaXMgZm9yIHY3LiBXaWxsIHNlbmQgaXQgb3V0IHNvb24uDQo+
IA0KPiBASGVucnksIGkgZGlkbid0IGFkZCByZXZpZXdlZC1ieSBhcyB0aGUgcGF0Y2ggaXMgYml0
IGNoYW5nZWQgd2l0aA0KPiByZW5hbWluZy4gQ2FuIHlvdSBwbGVhc2UgcmV2aWV3IHY3IGFuZCBn
aXZlIHlvdXIgZmVlZGJhY2suDQoNClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLCB5ZXMgSSB3b3Vs
ZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8gcmV2aWV3DQp0aGUgdjcgc2VyaWVzIG9uY2UgeW91IHNl
bmQgaXQuIA0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+ID4NCg==

