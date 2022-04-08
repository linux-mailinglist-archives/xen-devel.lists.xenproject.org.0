Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CD4F9333
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301365.514301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncm4L-0003Ux-3H; Fri, 08 Apr 2022 10:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301365.514301; Fri, 08 Apr 2022 10:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncm4K-0003Rf-Vq; Fri, 08 Apr 2022 10:42:20 +0000
Received: by outflank-mailman (input) for mailman id 301365;
 Fri, 08 Apr 2022 10:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zQ4=US=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ncm4I-0003RZ-PX
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:42:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7747f20b-b728-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 12:42:06 +0200 (CEST)
Received: from AM6PR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::36) by AM9PR08MB6675.eurprd08.prod.outlook.com
 (2603:10a6:20b:300::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 10:41:23 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::e7) by AM6PR01CA0059.outlook.office365.com
 (2603:10a6:20b:e0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25 via Frontend
 Transport; Fri, 8 Apr 2022 10:41:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 10:41:23 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Fri, 08 Apr 2022 10:41:23 +0000
Received: from a26c190004dc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9EF81A7-BCD7-4EDC-B734-F10C5043D52E.1; 
 Fri, 08 Apr 2022 10:41:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a26c190004dc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Apr 2022 10:41:16 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM8PR08MB5859.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 10:41:15 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 10:41:14 +0000
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
X-Inumbo-ID: 7747f20b-b728-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qk8r6tMph7YlJ0wonA36vDVHlkC5Llyql8w+K4+Rr0=;
 b=xdWTHisaZCpTxc9hnNpNNSGKiwdz25uOkZrRa+Rtpr5b4r9tjZnlN+EGhpHWzjgjbUpuADaa0tVWYFg3HKbcNoWDAwEbTM1n6S0P9tHTfg2AGIOgeYbLDs7tmzfBcwDhMl9kh/Xk8sdCLgUvENc7KYWHEfZF+90I9ldj2xiYhw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18711b6413794e32
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQsg5J+2W/m2Is+Yhn0xeU6RzHXUinEDVGaLp1UKOkOi4OQiPBIUuPHqD0rhKf/uGzr33zj8lufaH4n9K5rrct4QGHtK7hHrCWCfsS1DE19qbWPwscg4l7QFk0FYgBW5EvxqhIrCtX3gWF7/4OySChOHwHSNNVbJ3acr6v7SIqwE3Ev6h2TjcqdgZ4L/KP5eXCwFr7eTjYyu52RtcreVO1GHnzTiEHabkyFHANu+z+Xr9jKeisBiixuxG3Bp8YUGEcWmT+VlpEz1P5j2DI9UDJTL6mjRepX1X23pd1pYwXsMP+27BBxYlSpcYrWkOSok6tir00XT+YDeWJZAQRQ7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Qk8r6tMph7YlJ0wonA36vDVHlkC5Llyql8w+K4+Rr0=;
 b=e5zQE273TN6SdqznA5jlG2Gbn3Uclk6HJKU3HQb+AJ/R6Aw5ktBUO+gUT8n6EUiySL4tKmo1GkaK5skuQjqpnSoRL/TSi+q83tGwrXIyPgvAGx8KGsoxEUMBK662/h09Pi4jmhpEVkH+sFjTZ8E4C+Wdg/x4auE/47BSHIQvNNP1KLQ5FBElCXVFgkbtqdgf48SNofls1sDM5xk1B0sIikNVoQhsiEVXBddSOUsKoOx4X4FxigyzWBbG50K/i08/624UKGGhf20vX2xfBR/J8Rxm9jsiBye/aZHqo8DZdSC7lqHKpy9LWscIirNUwC8FI482tM7/0/U+U9de4bU3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Qk8r6tMph7YlJ0wonA36vDVHlkC5Llyql8w+K4+Rr0=;
 b=xdWTHisaZCpTxc9hnNpNNSGKiwdz25uOkZrRa+Rtpr5b4r9tjZnlN+EGhpHWzjgjbUpuADaa0tVWYFg3HKbcNoWDAwEbTM1n6S0P9tHTfg2AGIOgeYbLDs7tmzfBcwDhMl9kh/Xk8sdCLgUvENc7KYWHEfZF+90I9ldj2xiYhw4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
Thread-Topic: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
Thread-Index: AQHYSxiRdnHI8V+CTUSAwReJymUaGqzl1CMA
Date: Fri, 8 Apr 2022 10:41:14 +0000
Message-ID: <920E9874-E720-4536-B5DE-5222948DB1EE@arm.com>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
In-Reply-To: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b2ef3eb1-a890-4623-6e97-08da194c5391
x-ms-traffictypediagnostic:
	AM8PR08MB5859:EE_|AM5EUR03FT044:EE_|AM9PR08MB6675:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB66750CF3A508F3D3B2D00BB2E4E99@AM9PR08MB6675.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xfGhXsU5gC4vRRl+nxUESjVI+Ckz2mue5tVx4dSDb45wv6/KnIQWp3tNEJk2cRIFmreztaZyuhXCZNVGiY853qSMywPoxKQoP+6uT4NhRennSyWmccoADxRokQK5RMNcMuF51pBg1iR67tYRAq3BVMl4pXXq9enVfhNvhDCFebYlkYt924Jkc62EWlobWYgGwh3Cm2f/MYJaPb5OmwgpBpuApQTiFd15QR5z4sEH4Ek/T29WKNTVOEwJAj6aw46y3/Dk9b6UtrJBph+YI81y4y/b3Q2MNW5ngrXqeXRDEJocN2WJxxtHdIvqFk4KDwSwEcAYEmM8831RUhrOXJ1IxSUywjpHQim5S4/74/9HYl8JGTNgkzTIbFewfiKUiafQ+eL9PQl4dQu1yjd2reMXKwN8ViGVqfNRAuzfgJLPc3VP4Ji8A6QmTjv0WD8j3lUPLLQPF81k9nFy6dVKO9DYugi78KJAnBV7N36Hs65qyN/BZQcv+F6FgHACbiIUCdKphoDT4c4K8dy55PD6tx1pyh1zcPLhwsqcdFDvMpk4kwvEI7aYGyaLZQ9uLakE/RB6DKMBxK6PGyEXNK31n3UqqsGWjSg8LVFZZbB1APqIepZNYgyvW7g8VreZvIQiZ1AuywGCZ6K395CUg1Eee+WI5SNiX0e4X+m7ODb/LaSQalAImmMo2zgBHbjBXwigzQns8wKX8yJXw751o3WnQBjom3m0wiKy6s2gN6y3A7hBaQKC3pol9WE3KOlUfHQMAYkx
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(6486002)(8936002)(508600001)(5660300002)(86362001)(66446008)(38100700002)(66556008)(66476007)(8676002)(76116006)(91956017)(4326008)(66946007)(38070700005)(64756008)(6916009)(54906003)(316002)(53546011)(2616005)(122000001)(186003)(26005)(6512007)(6506007)(83380400001)(71200400001)(36756003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B838E085B0C58141884E037E8DE703A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5859
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	722ab166-a805-45e0-adaf-08da194c4e2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hL6wKI/64jgdroBpVUwO+xhKr/AlADBlgGF6JBO+dK6tPIKZCfWlVDFEADjPpZcDcsWu2/oY2K/ZTzC7wIMCQFSwrwVUgiPMDSU8hVoyzICJwXxs4/tlA95V4E2fLSAgfigPXalmQ1Q/W7Us+b07WBFeBrTBI+xlS85t+J5eR+IyjX72rckxY1WQstOQ4xWNan1puKpuGBHwMg7g8gG0nlh6WN5nUsHEMXjwxzN9ir6x/47iKMIA0jm4lbXuGvHFHsKYyDbsxawuzpTMhBs25ZJ98BMWE6A0O55AjbP0ilHcyGLYQv+iyENC2QoXje5XdLeFje0k8n91hOy4FrZCOwDp3JEPtu6vyIdJ9nHfjF1nowoaGVdWGZa2jbvfgYBzsb/EfhjgJNJ0hmzoSHswcXe9ccW2m0i9vFOXQ/QkAAT4fUyqGA9AVWencxhwppyk3RuOvEy599Vj6sOd8Khgy3LELTtAWCVu4cdQGUoQl6PZ8o1LSPGHvv7DzzxD4VRGZae1c05D8q88HHx7pmp/yJOWKRfmCP9Whwz33Ng+ja0pTNVeaNSh9hy1Cs8tb4Z9XDMQiY/XTjzxyd9qxeIX5RbQ1k7X7N1th4zU+vl28qOMDx+TgqBQxvm7ISpm/nhG3UHNBvu/GBjqKDMKQ6jLt3aSagSn1j3+x2VJaWeLeyoWy1gft0xbN60IHqXhbF6D
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(107886003)(2616005)(26005)(83380400001)(186003)(70206006)(8676002)(336012)(356005)(36860700001)(81166007)(47076005)(6862004)(4326008)(316002)(36756003)(33656002)(8936002)(40460700003)(54906003)(2906002)(82310400005)(5660300002)(53546011)(508600001)(6512007)(6486002)(6506007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:41:23.5970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ef3eb1-a890-4623-6e97-08da194c5391
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6675

DQoNCj4gT24gOCBBcHIgMjAyMiwgYXQgMDg6MTYsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBTZWUgdGhlIGNvZGUgY29tbWVudC4gVGhlIGhpZ2hlciB0aGUg
cmF0ZSBvZiB2Q1BVLXMgbWlncmF0aW5nIGFjcm9zcw0KPiBwQ1BVLXMsIHRoZSBsZXNzIHVzZWZ1
bCB0aGlzIGF0dGVtcHRlZCBvcHRpbWl6YXRpb24gYWN0dWFsbHkgaXMuIFdpdGgNCj4gY3JlZGl0
MiB0aGUgbWlncmF0aW9uIHJhdGUgbG9va3MgdG8gYmUgdW5kdWx5IGhpZ2ggZXZlbiBvbiBtb3N0
bHkgaWRsZQ0KPiBzeXN0ZW1zLCBhbmQgaGVuY2Ugb24gbGFyZ2Ugc3lzdGVtcyBsb2NrIGNvbnRl
bnRpb24gaGVyZSBpc24ndCB2ZXJ5DQo+IGRpZmZpY3VsdCB0byBvYnNlcnZlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpJ4oCZdmUgdGVz
dGVkIHRoaXMgcGF0Y2ggb24gYSBKdW5vIGJvYXJkLCBzdGFydGluZyBEb20wLCBjcmVhdGluZy9k
ZXN0cm95aW5nIGZldyBndWVzdHMsDQpkb2luZyBzb21lIG5ldHdvcmtpbmcgZnJvbSBndWVzdHMg
b2YgZGlmZmVyZW50IGNwdSBwb29sIGFuZCBldmVyeXRoaW5nIHdvcmtlZC4NCg0KVGVzdGVkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCj4gDQo+IC0tLSBhL3hl
bi9jb21tb24vZXZlbnRfY2hhbm5lbC5jDQo+ICsrKyBiL3hlbi9jb21tb24vZXZlbnRfY2hhbm5l
bC5jDQo+IEBAIC0xNTU5LDYgKzE1NTksMTYgQEAgdm9pZCBldnRjaG5fbW92ZV9waXJxcyhzdHJ1
Y3QgdmNwdSAqdikNCj4gICAgIHVuc2lnbmVkIGludCBwb3J0Ow0KPiAgICAgc3RydWN0IGV2dGNo
biAqY2huOw0KPiANCj4gKyAgICAvKg0KPiArICAgICAqIFRoZSB3b3JrIGRvbmUgYmVsb3cgaXMg
YW4gYXR0ZW1wdCB0byBrZWVwIHBJUlEtcyBvbiB0aGUgcENQVS1zIHRoYXQgdGhlDQo+ICsgICAg
ICogdkNQVS1zIHRoZXkncmUgdG8gYmUgZGVsaXZlcmVkIHRvIHJ1biBvbi4gSW4gb3JkZXIgdG8g
bGltaXQgbG9jaw0KPiArICAgICAqIGNvbnRlbnRpb24sIGNoZWNrIGZvciBhbiBlbXB0eSBsaXN0
IHByaW9yIHRvIGFjcXVpcmluZyB0aGUgbG9jay4gSW4gdGhlDQo+ICsgICAgICogd29yc3QgY2Fz
ZSBhIHBJUlEganVzdCBib3VuZCB0byB0aGlzIHZDUFUgd2lsbCBiZSBkZWxpdmVyZWQgZWxzZXdo
ZXJlDQo+ICsgICAgICogdW50aWwgdGhlIHZDUFUgaXMgbWlncmF0ZWQgKGFnYWluKSB0byBhbm90
aGVyIHBDUFUuDQo+ICsgICAgICovDQo+ICsgICAgaWYgKCAhdi0+cGlycV9ldnRjaG5faGVhZCAp
DQo+ICsgICAgICAgIHJldHVybjsNCj4gKw0KPiAgICAgc3Bpbl9sb2NrKCZkLT5ldmVudF9sb2Nr
KTsNCj4gICAgIGZvciAoIHBvcnQgPSB2LT5waXJxX2V2dGNobl9oZWFkOyBwb3J0OyBwb3J0ID0g
Y2huLT51LnBpcnEubmV4dF9wb3J0ICkNCj4gICAgIHsNCj4gDQo+IA0KDQo=

