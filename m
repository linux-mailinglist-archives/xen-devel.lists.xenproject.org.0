Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68771434654
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213641.371927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6Tt-0004gc-DO; Wed, 20 Oct 2021 07:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213641.371927; Wed, 20 Oct 2021 07:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6Tt-0004eR-9r; Wed, 20 Oct 2021 07:57:49 +0000
Received: by outflank-mailman (input) for mailman id 213641;
 Wed, 20 Oct 2021 07:57:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=faDG=PI=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1md6Tr-0004dl-Gi
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:57:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69810a8e-317b-11ec-8334-12813bfff9fa;
 Wed, 20 Oct 2021 07:57:46 +0000 (UTC)
Received: from AM5PR0601CA0084.eurprd06.prod.outlook.com (2603:10a6:206::49)
 by AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 07:57:27 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::11) by AM5PR0601CA0084.outlook.office365.com
 (2603:10a6:206::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 07:57:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 20 Oct 2021 07:57:26 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Wed, 20 Oct 2021 07:57:25 +0000
Received: from bd57d53b1f03.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1992FFF0-5A7F-4ADC-81BE-937FC5361D90.1; 
 Wed, 20 Oct 2021 07:57:19 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd57d53b1f03.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Oct 2021 07:57:19 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB2118.eurprd08.prod.outlook.com (2603:10a6:4:37::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 07:57:16 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 07:57:15 +0000
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
X-Inumbo-ID: 69810a8e-317b-11ec-8334-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF9NWZoFT2ZhVEYK+y1R+fwzoGvu+1baArmg1NDFZ9E=;
 b=4pZINI3GScG+dBLEMffuusTFnLGbzCc04JTHfGEBaglFC0zArYLvVOQAvlPsetDQuSxKrvBRhmaGRiKPiGGKFhf1+UUyCu+4dnLhGiYR5go1V5ovANL0ZY7VBs1MUw18Z3XFbEzo9/gaevEWkBwp0vmxhWB1KosBgZQ27fr1Xp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9619fd86039c0e15
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfYcyJ9eeG1KYwJQd0+umNvgUcBOQKe0zCndIOyNT2NENrNyDyU5ZdtX2g3Nl+8C+PRSAlkyn3WZLWgbxdtt6u7PxQaKpfI5EQAwy4vkxr2zCgO5UYaG9WynjLqKFCvPHROjdrmdVCmnoCkLpNEM+T28iz7ojw7g7eKk1CFeTt+OHZe/7tniaZ3FToBy0SmmFZjZjtptZGwR4cOV91EfdnzyAO3ZK9LkHGMzhcljg44SnT0nAeaaDbzWxmoykVIbFuQVIZPW/3Ml979gh7FSfdRF9mA2CywPB8LUQB3s7ePu8/7okDSRDxmtycZ0sPPHlWP+0ai0VLxkWpZnVCC6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oF9NWZoFT2ZhVEYK+y1R+fwzoGvu+1baArmg1NDFZ9E=;
 b=MqBIM9MAww30X0P8uC6UzxJmgy40tMD0E0yVWCtkEb/E8wd3keGbAtBaOJecK4i07c9SqCZDVI8U8X9Atky/c8+/35ciNCmxg1cga6UWOy5VnfUZ3w/hKAbJFnLYZewxABqs9hOaEiUnL5M6Cyl80xyKPelhn8Y6OuO3sg2DSNE6FJrj5l3Enu2fAh+2tpxLXy+sS43+n6siRjfuqqSfWT9w5O6rlbqx3Kj1v8UmOL5R5W85kZFRIyCkNxSbTk26aV84t75UER9Epy3RV7782ergj8/bLM+hoSpjbUsAO4xNIkLZQf6Ug5reHleYRiGxcIfFr4VSA5zcgTMmJ+q6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF9NWZoFT2ZhVEYK+y1R+fwzoGvu+1baArmg1NDFZ9E=;
 b=4pZINI3GScG+dBLEMffuusTFnLGbzCc04JTHfGEBaglFC0zArYLvVOQAvlPsetDQuSxKrvBRhmaGRiKPiGGKFhf1+UUyCu+4dnLhGiYR5go1V5ovANL0ZY7VBs1MUw18Z3XFbEzo9/gaevEWkBwp0vmxhWB1KosBgZQ27fr1Xp4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
Thread-Topic: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Thread-Index: AQHXxQOsddT9Ttg6SUi4XsLpyj6SjavbhAEAgAACKIA=
Date: Wed, 20 Oct 2021 07:57:15 +0000
Message-ID: <85549220-AF96-4913-B672-ED6795C91C3D@arm.com>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <YW/KDHnZHz72mjuQ@MacBook-Air-de-Roger.local>
In-Reply-To: <YW/KDHnZHz72mjuQ@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 27d9682e-499f-4c55-489d-08d9939f4205
x-ms-traffictypediagnostic: DB6PR0801MB2118:|AM0PR08MB3809:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3809A9C7CEC0B2859D4351459DBE9@AM0PR08MB3809.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tf5d43RXJhdTSN5eWV9XhY+IFWufqk0Ta/PFk6hnBNlrvGI7IduCYf36VFb+UY7p9HNyD1BJp6Rv8YL2CZNlXRZ2Hx+VTTQuLTF05ZN3Yn1U45a6VsNSwLOBxFSfsAEHQWPtzsVpujFi59mPha1LwdXBEjX64dNRFPeaV50YUpLHohroyJAMTVyDLJlcRVMNQXIn3KhO3vbFf33NkDzR5N3Kxs20N7BAQhUZHXXqLTZ8yx8aQq85NOOKMZrb4ddJ+TB0ttNZpjlUMTgaQO7Ngo3urdEOYsFQ4ZZ+UBDKQmGMEEAp6ZtSfL2PVno9z8zn47E3DRDFpHetW/4qyVWL/wrIFlUErgq9tokF1H2ifOI6ZvbGWGew3CmdvleIp6a9gSiZurN1k5pP1klHFBLTp0Wq5QriOE3a3SoEb+x32vHjmIjMZfmv5Qp6eXnyaIOT0T9GnYNfFCM1htqhBZVcdmILOr9TL6h3Sd6g2zZzLk+u2GP7D9eY9TloOck7wxuGTGhAzZhNBXyLF7T1KHSpAmrEjHPwBejwAQNwfBo8y3xpPMdlB+iR1gatlKoaXHsPS+0Flf7T48iS+unQxP8y/GuX7Fd3YYh6XqCujtTnPo3zKz8Ax0vTrSK1fjenMjeyeyLA92zs8jlpuxDKX+9Cb0OhAY2MWpU6XNIIlprwPwtNkxc+cezEzTwqAdUduzZ8h9gzOxmyplwQr26SLPD1yhUU8JhAhGTNqlQxmQ9nT7A6rx7ZSuk6Df3KzU4j0I7I
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(64756008)(36756003)(7416002)(186003)(54906003)(2616005)(8676002)(71200400001)(122000001)(66446008)(53546011)(26005)(76116006)(6506007)(6486002)(6512007)(8936002)(38070700005)(33656002)(6916009)(4326008)(66476007)(38100700002)(83380400001)(91956017)(66946007)(66556008)(5660300002)(508600001)(86362001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <16957B3E07206743AF7FB9748B325A8F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2118
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fbae755-4065-496c-47b1-08d9939f3baa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jh6GPxNFA1VxiTAB9wUnJS3D9psXOnx1VKEzg3DZFiMkm63RKGiVLXpELTOqbihCoxnRXpp19ERxzPVlWCOIa3caGNpI0IzvZY+I8N9mDVOonitdBxp+ktjBfz0Mn5uovyDmnbqurdDEJ5AAG7DOd3ecZbMYA39Qf/ToSenN0UToBJWYp0/obarN9o+/prSsjVsVU9oCcLFLko1PHMi3xbIFsFtR6Nt9NYM9XAoZNskz3Kq+7cwP8JwgT2ro/ba9ubbrUdE34VJ6TSAYo3c16shPWu1S1SiP1poEacFEdgznYG5Zpm9UZaR67ZNBDiM8S42wBGT+Dm16J1mGHAHq58crzzwRO/gUAhAiih2pDENDV8dCuWoKT78GSOinbME4k2WDkAGCXmlOlyy1zkOL4uyiIy+KzYzw1H7WVx1n+8/volkYYNCLUpIUxZle4b+Hm9oQdQ9LWVWeGq+w5qLHuvScJJInaVe/b62fmK2ydC6PAGXa5tg0/kMEvKWRo6Zrz6fiaw6v8CofFwHR+Bty0BJYg2hMZBc1UowIN05UzX0+nYovEEjnDRf46XzsJvYcMKq9WZZqv+TZIiKN/o3VhtjSbowwA5RaXqs/kw57RPnTcoJ8+DVolGP2l49z2W+o+99OgbWV50Ae0FPiaHqEiHQzRTM4NetckZcV81++2PK7KuALZIJSfIG5qFHcU5ovF6Gqm1QNVtALlqWsPWU8ag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(33656002)(6506007)(5660300002)(26005)(336012)(83380400001)(8936002)(2906002)(70206006)(2616005)(36756003)(54906003)(81166007)(86362001)(356005)(6512007)(316002)(36860700001)(6486002)(186003)(53546011)(70586007)(508600001)(6862004)(4326008)(8676002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:57:26.5012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d9682e-499f-4c55-489d-08d9939f4205
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3809

SGkgUm9nZXIsDQoNCj4gT24gMjAgT2N0IDIwMjEsIGF0IDA4OjQ5LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIE9jdCAxOSwgMjAy
MSBhdCAwNTowODoyOFBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gWGVuIG1p
Z2h0IG5vdCBiZSBhYmxlIHRvIGRpc2NvdmVyIGF0IGJvb3QgdGltZSBhbGwgZGV2aWNlcyBvciBz
b21lIGRldmljZXMNCj4+IG1pZ2h0IGFwcGVhciBhZnRlciBzcGVjaWZpYyBhY3Rpb25zIGZyb20g
ZG9tMC4NCj4+IEluIHRoaXMgY2FzZSBkb20wIGNhbiB1c2UgdGhlIFBIWVNERVZPUF9wY2lfZGV2
aWNlX2FkZCB0byBzaWduYWwgc29tZQ0KPj4gUENJIGRldmljZXMgdG8gWGVuLg0KPj4gQXMgdGhv
c2UgZGV2aWNlcyB3aGVyZSBub3Qga25vd24gZnJvbSBYZW4gYmVmb3JlLCB0aGUgdnBjaSBoYW5k
bGVycyBtdXN0DQo+PiBiZSBwcm9wZXJseSBpbnN0YWxsZWQgZHVyaW5nIHBjaV9kZXZpY2VfYWRk
IGZvciB4ODYgUFZIIERvbTAsIGluIHRoZQ0KPj4gc2FtZSB3YXkgYXMgd2hhdCBpcyBkb25lIGN1
cnJlbnRseSBvbiBhcm0gKHdoZXJlIFhlbiBkb2VzIG5vdCBkZXRlY3QgUENJDQo+PiBkZXZpY2Vz
IGJ1dCByZWxpZXMgb24gRG9tMCB0byBkZWNsYXJlIHRoZW0gYWxsIHRoZSB0aW1lKS4NCj4+IA0K
Pj4gU28gdGhpcyBwYXRjaCBpcyByZW1vdmluZyB0aGUgaWZkZWYgcHJvdGVjdGluZyB0aGUgY2Fs
bCB0bw0KPj4gdnBjaV9hZGRfaGFuZGxlcnMgYW5kIHRoZSBjb21tZW50IHdoaWNoIHdhcyBhcm0g
c3BlY2lmaWMuDQo+PiANCj4+IHZwY2lfYWRkX2hhbmRsZXJzIGlzIGNhbGxlZCBvbiBkdXJpbmcg
cGNpX2RldmljZV9hZGQgd2hpY2ggY2FuIGJlIGNhbGxlZA0KPj4gYXQgcnVudGltZSB0aHJvdWdo
IGh5cGVyY2FsbCBwaHlzZGV2X29wLg0KPj4gUmVtb3ZlIF9faHdkb21faW5pdCBhcyB0aGUgY2Fs
bCBpcyBub3QgbGltaXRlZCBhbnltb3JlIHRvIGhhcmR3YXJlDQo+PiBkb21haW4gaW5pdCBhbmQg
Zml4IGxpbmtlciBzY3JpcHQgdG8gb25seSBrZWVwIHZwY2lfYXJyYXkgaW4gcm9kYXRhDQo+PiBz
ZWN0aW9uLg0KPj4gDQo+PiBBZGQgbWlzc2luZyB2cGNpIGhhbmRsZXJzIGNsZWFudXAgZHVyaW5n
IHBjaV9kZXZpY2VfcmVtb3ZlIGFuZCBpbiBjYXNlDQo+PiBvZiBlcnJvciB3aXRoIGlvbW11IGR1
cmluZyBwY2lfZGV2aWNlX2FkZC4NCj4+IA0KPj4gQWRkIGVtcHR5IHN0YXRpYyBpbmxpbmUgZm9y
IHZwY2lfcmVtb3ZlX2RldmljZSB3aGVuIENPTkZJR19WUENJIGlzIG5vdA0KPj4gZGVmaW5lZC4N
Cj4+IA0KPj4gRml4ZXM6IGQ1OTE2OGRjMDUgKCJ4ZW4vYXJtOiBFbmFibGUgdGhlIGV4aXN0aW5n
IHg4NiB2aXJ0dWFsIFBDSSBzdXBwb3J0DQo+PiBmb3IgQVJNIikNCj4+IFN1Z2dlc3RlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJh
bmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2Vz
IGluIHYyDQo+PiAtIGFkZCBjb21tZW50IHN1Z2dlc3RlZCBieSBKYW4gb24gdG9wIG9mIHZwY2lf
YWRkX2hhbmRsZXJzIGNhbGwNCj4+IC0gbWVyZ2UgdGhlIDMgcGF0Y2hlcyBvZiB0aGUgc2VyaWUg
aW4gb25lIHBhdGNoIGFuZCByZW5hbWVkIGl0DQo+PiAtIGZpeCB4ODYgYW5kIGFybSBsaW5rZXIg
c2NyaXB0IHRvIG9ubHkga2VlcCB2cGNpX2FycmF5IGluIHJvZGF0YSBhbmQNCj4+IG9ubHkgd2hl
biBDT05GSUdfVlBDSSBpcyBzZXQuDQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS94ZW4ubGRzLlMg
ICAgICAgIHwgOSArLS0tLS0tLS0NCj4+IHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAgICAgIHwg
OSArLS0tLS0tLS0NCj4+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgOCArKysrLS0t
LQ0KPj4geGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAgfCAyICstDQo+PiB4ZW4vaW5jbHVk
ZS94ZW4vdnBjaS5oICAgICAgICB8IDIgKysNCj4+IDUgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TDQo+PiBpbmRleCBiNzczZjkxZjFj
Li4wODAxNjk0OGFiIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPj4g
KysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPj4gQEAgLTYwLDcgKzYwLDcgQEAgU0VDVElP
TlMNCj4+ICAgICAgICAqKC5wcm9jLmluZm8pDQo+PiAgICAgICAgX19wcm9jX2luZm9fZW5kID0g
LjsNCj4+IA0KPj4gLSNpZiBkZWZpbmVkKENPTkZJR19IQVNfVlBDSSkgJiYgZGVmaW5lZChDT05G
SUdfTEFURV9IV0RPTSkNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJDQo+PiAgICAgICAgLiA9
IEFMSUdOKFBPSU5URVJfQUxJR04pOw0KPj4gICAgICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47
DQo+PiAgICAgICAgKihTT1JUKC5kYXRhLnZwY2kuKikpDQo+PiBAQCAtMTg5LDEzICsxODksNiBA
QCBTRUNUSU9OUw0KPj4gICAgICAgICooLmluaXRfYXJyYXkpDQo+PiAgICAgICAgKihTT1JUKC5p
bml0X2FycmF5LiopKQ0KPj4gICAgICAgIF9fY3RvcnNfZW5kID0gLjsNCj4+IC0NCj4+IC0jaWYg
ZGVmaW5lZChDT05GSUdfSEFTX1ZQQ0kpICYmICFkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQ0K
Pj4gLSAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7DQo+PiAtICAgICAgIF9fc3RhcnRf
dnBjaV9hcnJheSA9IC47DQo+PiAtICAgICAgICooU09SVCguZGF0YS52cGNpLiopKQ0KPj4gLSAg
ICAgICBfX2VuZF92cGNpX2FycmF5ID0gLjsNCj4+IC0jZW5kaWYNCj4+ICAgfSA6dGV4dA0KPj4g
ICBfX2luaXRfZW5kX2VmaSA9IC47DQo+PiAgIC4gPSBBTElHTihTVEFDS19TSVpFKTsNCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMu
Uw0KPj4gaW5kZXggMTFiMWRhMjE1NC4uODdlMzQ0ZDRkZCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94ZW4ubGRzLlMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4+IEBA
IC0xMzQsNyArMTM0LDcgQEAgU0VDVElPTlMNCj4+ICAgICAgICAqKC5leF90YWJsZS5wcmUpDQo+
PiAgICAgICAgX19zdG9wX19fcHJlX2V4X3RhYmxlID0gLjsNCj4+IA0KPj4gLSNpZiBkZWZpbmVk
KENPTkZJR19IQVNfVlBDSSkgJiYgZGVmaW5lZChDT05GSUdfTEFURV9IV0RPTSkNCj4+ICsjaWZk
ZWYgQ09ORklHX0hBU19WUENJDQo+PiAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOw0K
Pj4gICAgICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47DQo+PiAgICAgICAgKihTT1JUKC5kYXRh
LnZwY2kuKikpDQo+PiBAQCAtMjQ3LDEzICsyNDcsNiBAQCBTRUNUSU9OUw0KPj4gICAgICAgICoo
LmluaXRfYXJyYXkpDQo+PiAgICAgICAgKihTT1JUKC5pbml0X2FycmF5LiopKQ0KPj4gICAgICAg
IF9fY3RvcnNfZW5kID0gLjsNCj4+IC0NCj4+IC0jaWYgZGVmaW5lZChDT05GSUdfSEFTX1ZQQ0kp
ICYmICFkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQ0KPj4gLSAgICAgICAuID0gQUxJR04oUE9J
TlRFUl9BTElHTik7DQo+PiAtICAgICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47DQo+PiAtICAg
ICAgICooU09SVCguZGF0YS52cGNpLiopKQ0KPj4gLSAgICAgICBfX2VuZF92cGNpX2FycmF5ID0g
LjsNCj4+IC0jZW5kaWYNCj4+ICAgfSBQSERSKHRleHQpDQo+PiANCj4+ICAgLiA9IEFMSUdOKFNF
Q1RJT05fQUxJR04pOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+IGluZGV4IDM1ZTAxOTA3OTYu
Ljg5MjhhMWMwN2QgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+IEBAIC03NTYsMTAg
Kzc1Niw5IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLA0K
Pj4gICAgIGlmICggIXBkZXYtPmRvbWFpbiApDQo+PiAgICAgew0KPj4gICAgICAgICBwZGV2LT5k
b21haW4gPSBoYXJkd2FyZV9kb21haW47DQo+PiAtI2lmZGVmIENPTkZJR19BUk0NCj4+ICAgICAg
ICAgLyoNCj4+IC0gICAgICAgICAqIE9uIEFSTSBQQ0kgZGV2aWNlcyBkaXNjb3Zlcnkgd2lsbCBi
ZSBkb25lIGJ5IERvbTAuIEFkZCB2cGNpIGhhbmRsZXINCj4+IC0gICAgICAgICAqIHdoZW4gRG9t
MCBpbmZvcm0gWEVOIHRvIGFkZCB0aGUgUENJIGRldmljZXMgaW4gWEVOLg0KPj4gKyAgICAgICAg
ICogRm9yIGRldmljZXMgbm90IGRpc2NvdmVyZWQgYnkgWGVuIGR1cmluZyBib290LCBhZGQgdlBD
SSBoYW5kbGVycw0KPj4gKyAgICAgICAgICogd2hlbiBEb20wIGZpcnN0IGluZm9ybXMgWGVuIGFi
b3V0IHN1Y2ggZGV2aWNlcy4NCj4+ICAgICAgICAgICovDQo+PiAgICAgICAgIHJldCA9IHZwY2lf
YWRkX2hhbmRsZXJzKHBkZXYpOw0KPj4gICAgICAgICBpZiAoIHJldCApDQo+PiBAQCAtNzY4LDEw
ICs3NjcsMTAgQEAgaW50IHBjaV9hZGRfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4s
DQo+PiAgICAgICAgICAgICBwZGV2LT5kb21haW4gPSBOVUxMOw0KPj4gICAgICAgICAgICAgZ290
byBvdXQ7DQo+PiAgICAgICAgIH0NCj4+IC0jZW5kaWYNCj4+ICAgICAgICAgcmV0ID0gaW9tbXVf
YWRkX2RldmljZShwZGV2KTsNCj4+ICAgICAgICAgaWYgKCByZXQgKQ0KPj4gICAgICAgICB7DQo+
PiArICAgICAgICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlKHBkZXYpOw0KPj4gICAgICAgICAgICAg
cGRldi0+ZG9tYWluID0gTlVMTDsNCj4+ICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gICAgICAg
ICB9DQo+PiBAQCAtODE5LDYgKzgxOCw3IEBAIGludCBwY2lfcmVtb3ZlX2RldmljZSh1MTYgc2Vn
LCB1OCBidXMsIHU4IGRldmZuKQ0KPj4gICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAm
cHNlZy0+YWxsZGV2c19saXN0LCBhbGxkZXZzX2xpc3QgKQ0KPj4gICAgICAgICBpZiAoIHBkZXYt
PmJ1cyA9PSBidXMgJiYgcGRldi0+ZGV2Zm4gPT0gZGV2Zm4gKQ0KPj4gICAgICAgICB7DQo+PiAr
ICAgICAgICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlKHBkZXYpOw0KPiANCj4gdnBjaV9yZW1vdmVf
ZGV2aWNlIGlzIG1pc3NpbmcgYSBjaGVjayBmb3IgaGFzX3ZwY2kocGRldi0+ZG9tYWluKSwgYXMN
Cj4gaXQgd2lsbCB1bmNvbmRpdGlvbmFsbHkgYWNjZXNzIHBkZXYtPnZwY2kgb3RoZXJ3aXNlLCBh
bmQgdGhhdCB3b3VsZCBiZQ0KPiB3cm9uZyBmb3IgZG9tYWlucyBub3QgdXNpbmcgdnBjaS4NCj4g
DQo+IEl0IG1pZ2h0IGFsc28gYmUgZ29vZCB0byBhZGQgYW4gQVNTRVJUKCFwZGV2LT52cGNpKSB0
bw0KPiB2cGNpX2FkZF9oYW5kbGVycyBpbiBvcmRlciB0byBtYWtlIHN1cmUgdGhlcmUgYXJlIG5v
IGR1cGxpY2F0ZWQgY2FsbHMNCj4gdG8gdnBjaV9hZGRfaGFuZGxlcnMsIGJ1dCB0aGF0IGNhbiBi
ZSBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2guDQoNCkkgY2FuIGRvIGJvdGggaW4gdjMgKHRvZ2V0
aGVyIHdpdGggdGhlIGNoYW5nZSBvZiBpbiB0aGUgcGF0Y2ggbmFtZSkuDQoNClVubGVzcyB5b3Ug
d2FudCB0aGUgQVNTRVJUIGluIGEgZGlmZmVyZW50IHBhdGNoLCBpbiB0aGlzIGNhc2UgSSBkbyBu
b3QgdGhpbmsNCkkgY2FuIG1ha2UgYSBuZXcgcGF0Y2ggZm9yIHRoYXQuDQoNCkNhbiB5b3UgY29u
ZmlybSBpZiBJIHNob3VsZCBvciBub3QgYWRkIHRoZSBBU1NFUlQgZGlyZWN0bHkgaW4gdGhlIHBh
dGNoID8NCg0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0KDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoN
Cg==

