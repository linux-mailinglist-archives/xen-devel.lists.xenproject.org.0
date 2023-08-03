Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F676E26F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576050.901756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTL0-0000Kb-Ih; Thu, 03 Aug 2023 08:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576050.901756; Thu, 03 Aug 2023 08:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTL0-0000Iz-FU; Thu, 03 Aug 2023 08:05:38 +0000
Received: by outflank-mailman (input) for mailman id 576050;
 Thu, 03 Aug 2023 08:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRTKy-0000It-JJ
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:05:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 859a529e-31d4-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 10:05:34 +0200 (CEST)
Received: from DB8PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:10:100::31)
 by AS8PR08MB8063.eurprd08.prod.outlook.com (2603:10a6:20b:54c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:04:59 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::e4) by DB8PR06CA0018.outlook.office365.com
 (2603:10a6:10:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Thu, 3 Aug 2023 08:04:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Thu, 3 Aug 2023 08:04:59 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Thu, 03 Aug 2023 08:04:59 +0000
Received: from ce50d277fe64.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 793C0985-07A5-4C5D-A3AB-5347362104F0.1; 
 Thu, 03 Aug 2023 08:04:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce50d277fe64.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 08:04:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7853.eurprd08.prod.outlook.com (2603:10a6:20b:51c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:04:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:04:50 +0000
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
X-Inumbo-ID: 859a529e-31d4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDvI8MDbYKaDXjqZ0zTEM8J4YD4KVCCgqp6VT0TZlOY=;
 b=aWQOUnUC4He6RFdvWBUVCRO/EGav0Z18M98xWEEUikDzUqj6CoRMJ7pMlZC3bPDdxpeXJcfCA4YoCWRjkEvx/b+eSwsINlQId4DEkom4iQojK+qSUw9X/aOlCm634Fy3ywJ2d7W6uTIa12JW8lCX+fCaGy6Vwq89RHV9AYPo7qE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24f99669834b1f0c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUVPtldjlEP2GAmbOG7N3cLp+hiZzNR+E7yP9haVa5fWRQ1qSjfq6z2esQ+NwCj+WdmGwSaR0+2oJ3FNSRDYnB++tHDQZU/qne2ZOmkcMBW6h88Wv8BNgBDawIlmWe9Itr+XjP59F3soXX8WlGnV/aGKIUh8+E/5RVKRjg/EUzC+ol1pTYnqcQA4j7ECCHvcCRH33s4IqLO3CY3mUXppXevxM5LTu2iGIZ/k3AJluzx/McZ7kE/+ACuM63yAoZdfzlRKCx7GbYV5e9JG+1M/Q8eHEm0OixCoevesIpPj2zoeIXUpP9hlMzfz78bJxNSivGRufbB28H1dMOVnIAvRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDvI8MDbYKaDXjqZ0zTEM8J4YD4KVCCgqp6VT0TZlOY=;
 b=fh2XSc45nR3NgXhV4LCPHYw7abUGPUVn+cFD8F8rXmhPDGW+tM5wOXTKLYiCyA5Du4qyp1zM2lIeSpi9NMR9dKmuZw7LkZg/16jU5ZzpqSg8coaXnzN6RmXjbTnX5UXxWsBHfiMTwupZg9L/zsEttPpXdRB3Z8xW96DLgAgz1B0NVfhNLWMEZkzvcjUjNHIWa3z5mbY3ZjCYo2x+1yoN2mix3zf667NoAKCSxbpUZ/Y1RsmG6J2Lbtqrg8P9NgDOMxYKxDh7Ts+35n/Sb1uCm1WOt0puvSOn3ZgMr/pcC8gFFSko8tIRfEKUMJzvJAkaLGIDirwtnJmpHtfiwv8yrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDvI8MDbYKaDXjqZ0zTEM8J4YD4KVCCgqp6VT0TZlOY=;
 b=aWQOUnUC4He6RFdvWBUVCRO/EGav0Z18M98xWEEUikDzUqj6CoRMJ7pMlZC3bPDdxpeXJcfCA4YoCWRjkEvx/b+eSwsINlQId4DEkom4iQojK+qSUw9X/aOlCm634Fy3ywJ2d7W6uTIa12JW8lCX+fCaGy6Vwq89RHV9AYPo7qE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index:
 AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/XEDgAgAAEZQCAAAGbgIAABJqAgAArPoCAAOPegIAABcoAgAAIA4A=
Date: Thu, 3 Aug 2023 08:04:49 +0000
Message-ID: <33DCC5E2-7190-464C-B25A-68BC68CA4021@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
 <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
In-Reply-To: <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7853:EE_|DBAEUR03FT017:EE_|AS8PR08MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0e48d3-7591-453f-fddd-08db93f8551c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ux3HFo/Dnomf/0VhD+ZWh7eJ66XgRmlktDlWIHhiwcvZV8c4sgOxNz0iPrH3etQr5709jubO45f2aRFgit9b0zOYxPVbJfCkYyuZswY0Yf5TYFQfOR9FPNgDiXQPcBGBN37bal6Pn2/MwWt1hGlNxLv/iLLkXPiVaad/Q6muBPhtGFcXUePwkhYPlqlk/aXNvlm2GOdkxgjyv4nYLsF9MZ8fH1a5KC4DyrtT9UX8TfecOVJsRVz790kTsYz9/cYlRklgoQ7beya0N//5x5C9xrGaKto4TcL7xryOtv57MLvVMeBj9/0Wif802xM6aq0ttJIpw2lpiERUjtuVLiuQTbQTlocntZHNJJQ6/x/b4tV35M5XQuZWePVv+kMXnJRE7L7u6IW4Ra+Jbhdli000glvN32nTK5MBTWj8p6Ae51ArNfgUaUKnQcnAJ7O1Ohovk++i/AYKyh6OtXZF7gWIHDjGIbgtPEjXQt7shtwQccoHY8so2y77sDkxn8VE6sF4PX7Gv1RF4pXX/3IVcKKyzlwxA96yLn7VUM7HEOR2IaMVQ/EccL4oe+AnFYkgV3c5x4AiaeLzNp/9V4ca1qD6W7GlVp2O36XiqLys8SOTK5pkWzYyPlxVim98b51XRhQDBG3iUFS+CGwORQaKyhyaZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(2616005)(83380400001)(6506007)(26005)(186003)(41300700001)(2906002)(91956017)(66946007)(76116006)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(316002)(8676002)(8936002)(6486002)(71200400001)(6512007)(478600001)(54906003)(38100700002)(122000001)(33656002)(86362001)(36756003)(38070700005)(66899021)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F6A0ABC3CDDD8418989182A0D19B3D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7853
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9cac6697-6c9d-4d91-a809-08db93f84f85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cwup3RxPtBD7ynY+u4hQokSnK3rnxW4hexp37Rkp8OaUqNpHU/0xOVS1bUf0WMGi/w4SDJ8tNC21X7h1CNoFlrnjFlaj8WlR5BPfAnZqBr82BW3/cba8Mm/ZzwXdkM25/DoAHDc+azgL+Xnrt5//JrN+XnAPc63FGd+ZNDYV9WyQphdPuq0ATjXVmHClG2+Lpf9ms56KvuUvwKGhK+1kwaY/woERX04h5P0ABS1n/Xo9QbbAqThHkE7KXg9Xljs4cZgaJA+bdsTquliYZdh8YRPo5gIN1PeXLNM+sWFH9zybtjkaSrLgRvtLn/p23VU1Df6WMmQp6GfFjH0b0KR+zikyvDLmsraqZm+/uoIHYkDuQPHD3wmOVz1sbaO5xGJCoFZZN3tzRyDD+0t7kVg9HB+cM3Iq2TfHk5sTNlzc4s4WykiXUC8A8+SokWe9JklZXVaS2IyMWkIN/HXl9d/umTWnXh7rpuXw7R+HJYq0q2x8nCh2b0At+LWztO3nf3i2/oTwVNtHloDQi2ygMcBNm3C57BJ5SNZoZ0NxM88gDc5x08LveCN3kh26+DYrVJRTzMYNWD9p+ANiOfgkeewFTY7zzsnrDIfuScYFRMxKA7rONWbo/fkznYFPUK2gEPJ6HdKXuxYAQrDXuQ8OFh3X6iZlaDCirG+aRVQZNiMl0UKvH8zJTBaDZLoKQq/M5/5GnsFQO0BtOZB0LcR8inUqaQhGswUzUcCHbblmY+lgh1PMGf2o5CtegF4euRXwiNYd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(40460700003)(2616005)(107886003)(6506007)(83380400001)(26005)(186003)(336012)(47076005)(36860700001)(316002)(2906002)(70586007)(70206006)(4326008)(5660300002)(6862004)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(40480700001)(356005)(81166007)(33656002)(86362001)(36756003)(82740400003)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:04:59.2036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0e48d3-7591-453f-fddd-08db93f8551c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8063

DQo+Pj4+Pj4gDQo+Pj4+Pj4gLSBVQVJUIGVuYWJsZWQgLQ0KPj4+Pj4+IC0gQm9vdCBDUFUgYm9v
dGluZyAtDQo+Pj4+Pj4gLSBDdXJyZW50IEVMIDAwMDAwMDAwMDAwMDAwMDggLQ0KPj4+Pj4+IC0g
SW5pdGlhbGl6ZSBDUFUgLQ0KPj4+Pj4+IC0gVHVybmluZyBvbiBwYWdpbmcgLQ0KPj4+Pj4+IC0g
WmVybyBCU1MgLQ0KPj4+Pj4+IC0gUmVhZHkgLQ0KPj4+Pj4+IChYRU4pIENoZWNraW5nIGZvciBp
bml0cmQgaW4gL2Nob3Nlbg0KPj4+Pj4+IChYRU4pIFJBTTogMDAwMDAwMDA4MDAwMDAwMCAtIDAw
MDAwMDAwZmVmZmZmZmYNCj4+Pj4+PiAoWEVOKSBSQU06IDAwMDAwMDA4ODAwMDAwMDAgLSAwMDAw
MDAwOGZmZmZmZmZmDQo+Pj4+Pj4gKFhFTikNCj4+Pj4+PiAoWEVOKSBNT0RVTEVbMF06IDAwMDAw
MDAwODQwMDAwMDAgLSAwMDAwMDAwMDg0MTVkMDAwIFhlbg0KPj4+Pj4+IChYRU4pIE1PRFVMRVsx
XTogMDAwMDAwMDBmZDZjNTAwMCAtIDAwMDAwMDAwZmQ2YzgwMDAgRGV2aWNlIFRyZWUNCj4+Pj4+
PiAoWEVOKSBNT0RVTEVbMl06IDAwMDAwMDAwODAwODAwMDAgLSAwMDAwMDAwMDgxNGYxYTAwIEtl
cm5lbA0KPj4+Pj4+IChYRU4pICBSRVNWRFswXTogMDAwMDAwMDA4MDAwMDAwMCAtIDAwMDAwMDAw
ODAwMTAwMDANCj4+Pj4+PiAoWEVOKSAgUkVTVkRbMV06IDAwMDAwMDAwMTgwMDAwMDAgLSAwMDAw
MDAwMDE4N2ZmZmZmDQo+Pj4+Pj4gKFhFTikNCj4+Pj4+PiAoWEVOKQ0KPj4+Pj4+IChYRU4pIENv
bW1hbmQgbGluZTogbm9yZWJvb3QgZG9tMF9tZW09MTAyNE0gY29uc29sZT1kdHVhcnQgZHR1YXJ0
PXNlcmlhbDAgYm9vdHNjcnViPTANCj4+Pj4+PiAoWEVOKSBQRk4gY29tcHJlc3Npb24gb24gYml0
cyAyMC4uLjIyDQo+Pj4+Pj4gKFhFTikgRG9tYWluIGhlYXAgaW5pdGlhbGlzZWQNCj4+Pj4+PiAo
WEVOKSBCb290aW5nIHVzaW5nIERldmljZSBUcmVlDQo+Pj4+Pj4gKFhFTikgUGxhdGZvcm06IEdl
bmVyaWMgU3lzdGVtDQo+Pj4+Pj4gKFhFTikNCj4+Pj4+PiAoWEVOKSAqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqDQo+Pj4+Pj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6DQo+
Pj4+Pj4gKFhFTikgVW5hYmxlIHRvIGZpbmQgY29tcGF0aWJsZSBHSUMgaW4gdGhlIGRldmljZSB0
cmVlDQo+Pj4+Pj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KPj4+Pj4+IChYRU4pDQo+Pj4+Pj4gKFhFTikgTWFudWFsIHJlc2V0IHJlcXVpcmVkICgnbm9y
ZWJvb3QnIHNwZWNpZmllZCkNCg0KSGkgSnVsaWVuLCBNaWNoYWwsDQoNCj4+Pj4+IEhhdmluZyBl
YXJseSBwcmludGsgZW5hYmxlZCBhbGwgdGhlIHRpbWUgaXMgbm90IGNvbW1vbiBhbmQgbm90IGVu
YWJsZWQgaW4gcmVsZWFzZSBidWlsZHMgRldJSy4NCj4+PiANCj4+PiBUaGVyZSBhcmUgYSBsb3Qg
b2YgaW5mb3JtYXRpb24gcHJpbnRlZCBiZWZvcmUgdGhlIGNvbnNvbGUgaXMgcHJvcGVybHkNCj4+
PiBicm91Z2h0IHVwLiBJIHdvbmRlciBpZiB3ZSBzaG91bGQgbG9vayBhdCBhZGRpbmcgZWFybHkg
Y29uc29sZSBsaWtlDQo+Pj4gTGludXggZG9lcz8NCj4+IEkgZ3Vlc3MgaXQgaXMgbm90IGEgbWF0
dGVyIG9mICJpZiIgYnV0ICJ3aGVuIiBhbmQgSSB0aGluayBpdCdzIGp1c3QgdGhhdCBubyBvbmUg
aGFzIHRpbWUgdG8gZG8gdGhhdA0KPj4gc2luY2UgaXQgaXMgbW9yZSBhIGxpa2UgYSBmZWF0dXJl
IGZvciBkZXZlbG9wZXJzIHJhdGhlciB0aGFuIGZvciBjdXN0b21lcnMgKHRoZXkganVzdCByZXBv
cnQgdGhlIGlzc3VlDQo+PiBhbmQgd2UgbmVlZCB0byBmaXggaXQgOikpLg0KPiANCj4gU3VyZS4g
VGhpcyBpcyBhbHdheXMgdGhlIGNhc2UsIGJ1dCBpdCBhbHNvIG1lYW5zIGRldmVsb3BwZXJzIHdp
bGwgY29udGludWUgdG8gd2FzdGUgdGltZSB3aGVuIGludmVzdGlnYXRpbmcgZWFybHkgYm9vdCBp
c3N1ZXMuIEkgd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIHRoZSB0b3RhbCB0aW1lIHdhc3RlZCBp
cyBtb3JlIHRoYW4gdGhlIGFjdHVhbCBlZmZvcnQgdG8gYWRkIHN1cHBvcnQgOikuDQoNCknigJl2
ZSBub3QgaW52ZXN0aWdhdGVkIG9uIHRoZSBhbW91bnQgb2YgdGltZSBuZWVkZWQgdG8gYWRkIHRo
YXQsIEkgd291bGRu4oCZdCB1bmRlcmVzdGltYXRlIHRoYXQgYW5kIHVuZm9ydHVuYXRlbHkgcGVv
cGxlIGhhdmUNCmRpZmZlcmVudCBjYXBhY2l0eSBhbmQgY29tcGFuaWVzIGhhdmUgZGlmZmVyZW50
IHByaW9yaXRpZXMsIHNvIGEgcXVpY2sgZmVhdHVyZSBjYW4gdHJhbnNsYXRlIG9uIG1vbnRocyB3
aGVuIHRoZSB0aW1lIGFsbG9jYXRlZA0KZm9yIGEgcGFydGljdWxhciBqb2IgaXMsIGxldOKAmXMg
c2F5LCBvbmUgZGF5IGEgbW9udGguDQoNCj4gDQo+PiBUaGVyZSBhcmUgc28gbWFueSB0aGluZ3Mg
dGhhdCBjYW4gZ28gd3JvbmcgZHVyaW5nIGVhcmx5IGJvb3QgaW5jbHVkaW5nIHRoZSBlbnRpcmUg
Ym9vZmR0IHBhcnNpbmcNCj4+IGFuZCBoYXZpbmcgZWFybHljb24gd291bGQgYmUgc28gZGVzaXJh
YmxlLg0KPiBJdCBpcyBub3QgY2xlYXIgd2hhdCB0byB0YWtlIGZyb20geW91ciByZXBseS4gRWFy
bGllciB5b3Ugd2VyZSBjb25jZXJuZWQgYWJvdXQgdGhlIGVycm9yIG5vdCBzaG93aW5nIHVwIGlu
IHRoZSBsb2cgaWYgdGhlIC5jb25maWcgaXMgbm90IGNvcnJlY3QuDQo+IA0KPiBUaGVyZSBpcyBu
byByZWFsbHkgcXVpY2sgZml4IGZvciB0aGF0IGFzIGEgLmNvbmZpZyBtYXkgd29yayBmb3IgcGxh
dGZvcm0gQSBidXQgbm90IHBsYXRmb3JtIEIuIFRoZSBvbmx5IHZpYWJsZSBzb2x1dGlvbiBpcyBo
YXZpbmcgYW4gZWFybHkgY29uc29sZS4NCj4gDQo+IEFueXRoaW5nIGVsc2UgbGlrZSBmb3JjaW5n
IHRvIGFsd2F5cyBoYXZlIG9uZSBHSUN2WCBzZWxlY3RlZCBpcyBqdXN0IGEgaGFjayB0aGF0IHdv
dWxkIHdvcmsgZm9yIG9uZSBzZXQgb2YgcGVvcGxlIGJ1dCBub3QgdGhlIG90aGVycy4NCg0KSSBh
Z3JlZSB3aXRoIHlvdSBpbiBwYXJ0LCB3aGVuIHlvdSBzYXkgdGhhdCBpdCB3b3VsZCB3b3JrIGZv
ciBvbmUgc2V0IG9mIHBlb3BsZSBidXQgbm90IHRoZSBvdGhlcnMsIGlzbuKAmXQgaXQgYWx3YXlz
IHRoZSBjYXNlPyBXZSBhcmUgcHJvdmlkaW5nDQphIGRlZmNvbmZpZyB0aGF0IHdvdWxkIGZpdCB0
aGUgbWFqb3JpdHkgb2YgdGhlIHBlb3BsZSwgYnV0IGl04oCZcyBhbHdheXMgYSBzZXQgb2YgdGhl
bS4NCg0KTW9yZSBzcGVjaWZpYyB0byB0aGlzIHBhdGNoLCB3aXRoIHRoZSBwcm92aWRlZCBLY29u
ZmlnIOKAnGhhY2vigJ0gYXMgeW91IHNheSwgaXQgaXMgbm90IG9ubHkgcHJvdmlkaW5nIHRoZSBz
YW1lIHVzZXIgZXhwZXJpZW5jZSBhcyB0aGUgY3VycmVudCBzdGF0ZSwNCml0IGlzIGRvaW5nIG1v
cmUsIGl0IGlzIHByb3ZpZGluZyBhIHdheSB0byBleGNsdWRlIGZyb20gdGhlIGJ1aWxkIHRoZSBH
SUN2MiB3aGljaCBpcyBub3QgcG9zc2libGUgY3VycmVudGx5LCB0aGlzIHdvcmsgYWltcyB0byBw
cm92aWRlIGEgbW9yZQ0KZmluZSBncmFudWxhciBjb25maWd1cmF0aW9uIHNvIHRoYXQgZXhwZXJp
ZW5jZWQgdXNlcnMgY2FuIHJlbW92ZSBlbnRpcmUgbW9kdWxlcyB0aGF0IHRoZXkgZG9u4oCZdCBu
ZWVkIGluIHRoZWlyIHBsYXRmb3JtIHNvIHRoYXQgdGhleSBkb27igJl0IGhhdmUNCnRvIHRha2Ug
dGhlbSBpbnRvIGFjY291bnQgd2hlbiBnb2luZyB0bywgZm9yIGV4YW1wbGUsIHNhZmV0eSBjcml0
aWNhbCBhdWRpdHMuDQoNCkkgYWdyZWUgd2l0aCB5b3UgdGhhdCBlYXJseWNvbiB3b3VsZCBiZSBw
ZXJmZWN0LCBzbyB0aGF0IHdlIGNvdWxkIG1ha2UgdGhlIHVzZXIgcmVtb3ZlIGV2ZXJ5IG1vZHVs
ZSBhbmQgbGV0IGhpbSBrbm93IHF1aWNrbHkgdGhlIGlzc3VlLA0KYnV0IG9uIHRoZSBvdGhlciBo
YW5kIGl0IGlzIGEgY29tcGxldGUgbmV3IGZlYXR1cmUgdGhhdCB5b3UgYXJlIHJlcXVlc3Rpbmcg
KGFyZSB5b3U/KSB0byBtYWtlIHRoaXMgcGF0Y2ggZ28gZm9yd2FyZC4NCg0KTXkgcGVyc29uYWwg
b3BpbmlvbiBpcyB0aGF0LCBzaW5jZSB0aGlzIHBhdGNoIGlzIG5vdCBhZmZlY3RpbmcgdGhlIHVz
ZXIgZXhwZXJpZW5jZSwgaXQgaXMgbWFpbnRhaW5pbmcgdGhlIGN1cnJlbnQgc3RhdHVzIChub3Qg
aWRlYWwpLCBidXQgYXQgbGVhc3QNCkl0IGlzIHByb3ZpZGluZyBzb21ldGhpbmcgbW9yZSwgaXQg
d291bGQgYmUgYSBzaGFtZSB0byB0aHJvdyB0aGF0IGluIHRoZSBiaW4gYmVjYXVzZSBubyBvbmUg
aGFzIHRpbWUgdG8gd29yayBvbiBlYXJseWNvbi4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

