Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E092A7094BA
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 12:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536936.835677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzxHF-0006Ql-Fl; Fri, 19 May 2023 10:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536936.835677; Fri, 19 May 2023 10:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzxHF-0006OC-Bk; Fri, 19 May 2023 10:24:01 +0000
Received: by outflank-mailman (input) for mailman id 536936;
 Fri, 19 May 2023 10:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pzxHE-0006O6-1P
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 10:24:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe12::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 424cd24e-f62f-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 12:23:55 +0200 (CEST)
Received: from DU2PR04CA0210.eurprd04.prod.outlook.com (2603:10a6:10:28d::35)
 by PAVPR08MB9089.eurprd08.prod.outlook.com (2603:10a6:102:32a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 10:23:48 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::e3) by DU2PR04CA0210.outlook.office365.com
 (2603:10a6:10:28d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 10:23:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.7 via Frontend Transport; Fri, 19 May 2023 10:23:47 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Fri, 19 May 2023 10:23:47 +0000
Received: from f3f839bfce5b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93AA62C8-995D-4139-886A-3B1A9C3BABDA.1; 
 Fri, 19 May 2023 10:23:41 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3f839bfce5b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 May 2023 10:23:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8423.eurprd08.prod.outlook.com (2603:10a6:10:405::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 10:23:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 10:23:39 +0000
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
X-Inumbo-ID: 424cd24e-f62f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpVyXnAofFG5X42IZvUp2FuIueTA9OH2z4soqWItk6A=;
 b=FvQX18rFZ3bf+T5G6BAkZs+AyiEsqC49RxNVEh7ITiHelMe+l1/TNoaPpoIJrKUBIUsoOZFL0YrXFScCj/C6xlvgi0S/n9Ry4UQPDIXR02aroNN0gRRfRpCvgtgAzMF0tihlrp/M0cZ8YTHfI8zGCM/V66yWWSvB+35babSdlCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 410ce92359396816
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gov6Usji3yYyzRkvNIv9GBv5i6rbNvnnABdppAdmzmT0/WnOZCziZQpbOqOOI9igngIBL9EUYmUapKUsGHboxglLYsg0xAa3VenEnsRsuwpBq7qyA3iAeOG2dMd95qRbX+Fs5mU5crhW37pZGlsKA8XKlAG+sXp7nO99KlLkzRKHVU7zIoY3pwoy7MO6kqN9DMPNZAslQFCjkNPrBX1JT6zqPFg9VKEPaDkJIB8GAwFR2q0U+mSo4MZwMOAbCccDGlsLubkhGR2M0bX6Cx9Ti9ZECEQU2ODAy4EctvsHBHpB/Urbpfwz0AoX/jGhpVA/ZjkvPZmwi3HSf9Ovo0wB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpVyXnAofFG5X42IZvUp2FuIueTA9OH2z4soqWItk6A=;
 b=bxtktPbkZe4Li7crQdeTIdf7RT3V8nePHbIEF2MzvEsZb25dbYp8sbl8OA3maQirbtPLHLN5TZn42jp1ID+xnVRHwOv8atzzlZN+D34w12udtzFUyvX7zMm3rsW1YjP0H9oTShIyHUbHBBnB2bxmDLu0mAY191d7ROhPwojVwbfMwv1HdAW6GUbatxUJroOQQosEZaB9Khjr7RBjUqlsiz0AyAhckYqBM224TeQw0lYbBAATxL0Y4pSD1D0ZzTs5VNOTI0Yz6oLz+L+cD4G9OJ+rCAtXjnzUGxOmzGr9ocIe6bOuWhnLrHlNl/jWYWRHfdUDH1NOlvdw5PeI65np1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpVyXnAofFG5X42IZvUp2FuIueTA9OH2z4soqWItk6A=;
 b=FvQX18rFZ3bf+T5G6BAkZs+AyiEsqC49RxNVEh7ITiHelMe+l1/TNoaPpoIJrKUBIUsoOZFL0YrXFScCj/C6xlvgi0S/n9Ry4UQPDIXR02aroNN0gRRfRpCvgtgAzMF0tihlrp/M0cZ8YTHfI8zGCM/V66yWWSvB+35babSdlCg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
Thread-Topic: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
Thread-Index: AQHZijbbQbnxRobwCkSJohEa6eKRVa9hY3kA
Date: Fri, 19 May 2023 10:23:39 +0000
Message-ID: <CA6576E0-E49F-4E36-9363-CEB23B508DCE@arm.com>
References: <20230519094613.2134153-1-luca.fancellu@arm.com>
 <20230519094613.2134153-3-luca.fancellu@arm.com>
In-Reply-To: <20230519094613.2134153-3-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8423:EE_|DBAEUR03FT011:EE_|PAVPR08MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f612db-fe20-45b1-a226-08db58532201
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +9haEDQXvfuSFVMIc/h0iZ2hakbh0Cj1PmuRK0ET0i2BXcpD8xcHMurfQWXJ9ZkYqWs9x38yA4+4yKJkIpfGRSUlabtTSvUoei73KBn+1blVwTQuf5K/4xC9FBFPuTXmSX55nlszQvsZroqk/1XR9Tq++PGWInJbQDhOE9iD+p0gj1JgfG0907YIZ0UAypwl3oz8XgH5Ux8WCpahZuQr7EA1arisAzSxzIblCNtTgHnX16GyNOQi0GhuegADzNbXR7wDIO0t+oZovapl+NsKhrp09qffT/pxJR9pabjWu/T6nQr3Q8zhO7XHEeXaO+xKoRiRvreGxz745nRQHkYCtnqcidof78i0RzoDWfgdfJDtDKK6CtoVT898E8OCy4YBoMDUExM+sVrWnRfFZYkPiA1eXMItdIbF2VZiNmxkVtVSicj/uGTr6x0CeqTQ/Nv+Q7XMQ34ImWzJAZexLkx9BjkH/4qhBLgNk5Y5foh5eCVvcTz8AwIqHV0ANpfaP3p9omFhN7hvPHi2uw/xx4Yuv+s0F5SxFP8z3kpyrdtb86s7W9Zwdif976BDzeeqSYur+ObeOelD8Kl/Gac1RQqJyaDpwX5S36hYCKFkcDaMkh2czkrgBJZsUCZLfU+LnpF9cA2HNoz3t6rhy3Q8uHZzyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(478600001)(316002)(5660300002)(8936002)(8676002)(41300700001)(4326008)(6916009)(66446008)(2906002)(64756008)(66476007)(91956017)(76116006)(66556008)(66946007)(54906003)(33656002)(36756003)(6486002)(6512007)(186003)(6506007)(26005)(38070700005)(53546011)(38100700002)(86362001)(2616005)(122000001)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0F63F1F421E2D459BEB18FE28870D9F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8423
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0a161c0-020d-4b26-b043-08db58531cfb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2X9pwNg6VbXtMJHkyp3PC2zWvmdetrzRYYWGkm4FzUt/A1S9dFoUpvPAgtgu/Z1l0yTsSbREiyzS+niG022eP3DeRWNOiotqjvnxq8lmXQZ2G1DNoz1TWlbRUJA+n69kHJUfwPGJj+oz6gJ6wdLHRtbHyxEZYN+4dvB7n6m4U3IMu3YMljtUyQpBKRGG5papuG+tj7aeV3pQYBRzL1/kBfbKWGAu1VuTrylEv58KUcsmNnuCbYWKR+2Qq8VvAQMronfobpIRiUV82sOvCnfYyBikqZXtkIT2679WsWfYFrNaKAFnXd6v+j47cQLXkjmJzGB1bCcTzDkzEL0ELl26U1YXdlIzKjrX44lT7beRJAWDDwa/I35d3oofZ6GN4TaqwjlSwcgnwcFiFcOw+TAw9QWUmXG0TweuRxpragIBFzt0nwiO2nq3kUW9fvLTmSZpU3exOvroQt2P0bsLRdzPBeWUHkVNnMVWnk2NMYwWJ1q9C0KySAfmFMAKFwwvlpmmafK/GaaQdMRVfij55JlwnhAbT8KjqMptNMs+yUcsTXXvSJpPUJeqsJ92aSMPJrARCD6I0hLCdjjyd9cVdLv+kGPwrUSPsgvx2h2Q6G3OD7wI+lWxE8hI9FgdyzpctqfXH7nePv+CeIYlE3awuGntJsmu9+8zlQthbAziflqIoW0HooUzf1FKW0xrR2KZTaz2LeTO+xb+3tUThPD1x2xgn20kPyXZebFoL8R8S3dFBSU0lNYoKSqMLJsKX6oHpHak
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(70206006)(70586007)(5660300002)(54906003)(8936002)(8676002)(478600001)(4326008)(6916009)(316002)(41300700001)(6486002)(40460700003)(36860700001)(81166007)(40480700001)(83380400001)(6506007)(53546011)(47076005)(26005)(336012)(356005)(82310400005)(2616005)(82740400003)(86362001)(6512007)(186003)(33656002)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 10:23:47.8650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f612db-fe20-45b1-a226-08db58532201
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9089

DQoNCj4gT24gMTkgTWF5IDIwMjMsIGF0IDEwOjQ2LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gQWRkIGEgZmVhdHVyZSB0byB0aGUgZGlmZi1yZXBv
cnQucHkgc2NyaXB0IHRoYXQgaW1wcm92ZXMgdGhlIGNvbXBhcmlzb24NCj4gYmV0d2VlbiB0d28g
YW5hbHlzaXMgcmVwb3J0LCBvbmUgZnJvbSBhIGJhc2VsaW5lIGNvZGViYXNlIGFuZCB0aGUgb3Ro
ZXINCj4gZnJvbSB0aGUgY2hhbmdlcyBhcHBsaWVkIHRvIHRoZSBiYXNlbGluZS4NCj4gDQo+IFRo
ZSBjb21wYXJpc29uIGJldHdlZW4gcmVwb3J0cyBvZiBkaWZmZXJlbnQgY29kZWJhc2UgaXMgYW4g
aXNzdWUgYmVjYXVzZQ0KPiBlbnRyaWVzIGluIHRoZSBiYXNlbGluZSBjb3VsZCBoYXZlIGJlZW4g
bW92ZWQgaW4gcG9zaXRpb24gZHVlIHRvIGFkZGl0aW9uDQo+IG9yIGRlbGV0aW9uIG9mIHVucmVs
YXRlZCBsaW5lcyBvciBjYW4gZGlzYXBwZWFyIGJlY2F1c2Ugb2YgZGVsZXRpb24gb2YNCj4gdGhl
IGludGVyZXN0ZWQgbGluZSwgbWFraW5nIHRoZSBjb21wYXJpc29uIGJldHdlZW4gdHdvIHJldmlz
aW9ucyBvZiB0aGUNCj4gY29kZSBoYXJkZXIuDQo+IA0KPiBIYXZpbmcgYSBiYXNlbGluZSByZXBv
cnQsIGEgcmVwb3J0IG9mIHRoZSBjb2RlYmFzZSB3aXRoIHRoZSBjaGFuZ2VzDQo+IGNhbGxlZCAi
bmV3IHJlcG9ydCIgYW5kIGEgZ2l0IGRpZmYgZm9ybWF0IGZpbGUgdGhhdCBkZXNjcmliZXMgdGhl
DQo+IGNoYW5nZXMgaGFwcGVuZWQgdG8gdGhlIGNvZGUgZnJvbSB0aGUgYmFzZWxpbmUsIHRoaXMg
ZmVhdHVyZSBjYW4NCj4gdW5kZXJzdGFuZCB3aGljaCBlbnRyaWVzIGZyb20gdGhlIGJhc2VsaW5l
IHJlcG9ydCBhcmUgZGVsZXRlZCBvciBzaGlmdGVkDQo+IGluIHBvc2l0aW9uIGR1ZSB0byBjaGFu
Z2VzIHRvIHVucmVsYXRlZCBsaW5lcyBhbmQgY2FuIG1vZGlmeSB0aGVtIGFzDQo+IHRoZXkgd2ls
bCBhcHBlYXIgaW4gdGhlICJuZXcgcmVwb3J0Ii4NCj4gDQo+IEhhdmluZyB0aGUgInBhdGNoZWQg
YmFzZWxpbmUiIGFuZCB0aGUgIm5ldyByZXBvcnQiLCBub3cgaXQncyBzaW1wbGUNCj4gdG8gbWFr
ZSB0aGUgZGlmZiBiZXR3ZWVuIHRoZW0gYW5kIHByaW50IG9ubHkgdGhlIGVudHJ5IHRoYXQgYXJl
IG5ldy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVA
YXJtLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgZnJvbSB2MToNCj4gLSBNYWRlIHRoZSBzY3JpcHQg
Y29tcGF0aWJsZSB3aXRoIHB5dGhvbjIgKFN0ZWZhbm8pDQo+IC0tLQ0KPiB4ZW4vc2NyaXB0cy9k
aWZmLXJlcG9ydC5weSAgICAgICAgICAgICAgICAgICAgfCAgNTUgKysrKy0NCj4geGVuL3Njcmlw
dHMveGVuX2FuYWx5c2lzL2RpZmZfdG9vbC9kZWJ1Zy5weSAgIHwgIDIxICsrDQo+IHhlbi9zY3Jp
cHRzL3hlbl9hbmFseXNpcy9kaWZmX3Rvb2wvcmVwb3J0LnB5ICB8ICA4NyArKysrKysrDQo+IC4u
Li9kaWZmX3Rvb2wvdW5pZmllZF9mb3JtYXRfcGFyc2VyLnB5ICAgICAgICB8IDIzMiArKysrKysr
KysrKysrKysrKysNCj4gNCBmaWxlcyBjaGFuZ2VkLCAzOTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9k
aWZmX3Rvb2wvdW5pZmllZF9mb3JtYXRfcGFyc2VyLnB5DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVu
L3NjcmlwdHMvZGlmZi1yZXBvcnQucHkgYi94ZW4vc2NyaXB0cy9kaWZmLXJlcG9ydC5weQ0KPiBp
bmRleCBmOTdjYjIzNTVjYzMuLmQ2MDhlM2EwNWFhMSAxMDA3NTUNCj4gLS0tIGEveGVuL3Njcmlw
dHMvZGlmZi1yZXBvcnQucHkNCj4gKysrIGIveGVuL3NjcmlwdHMvZGlmZi1yZXBvcnQucHkNCj4g
QEAgLTcsNiArNywxMCBAQCBmcm9tIGFyZ3BhcnNlIGltcG9ydCBBcmd1bWVudFBhcnNlcg0KPiBm
cm9tIHhlbl9hbmFseXNpcy5kaWZmX3Rvb2wuY3BwY2hlY2tfcmVwb3J0IGltcG9ydCBDcHBjaGVj
a1JlcG9ydA0KPiBmcm9tIHhlbl9hbmFseXNpcy5kaWZmX3Rvb2wuZGVidWcgaW1wb3J0IERlYnVn
DQo+IGZyb20geGVuX2FuYWx5c2lzLmRpZmZfdG9vbC5yZXBvcnQgaW1wb3J0IFJlcG9ydEVycm9y
DQo+ICtmcm9tIHhlbl9hbmFseXNpcy5kaWZmX3Rvb2wudW5pZmllZF9mb3JtYXRfcGFyc2VyIGlt
cG9ydCBcDQo+ICsgICAgKFVuaWZpZWRGb3JtYXRQYXJzZXIsIFVuaWZpZWRGb3JtYXRQYXJzZUVy
cm9yKQ0KPiArZnJvbSB4ZW5fYW5hbHlzaXMuc2V0dGluZ3MgaW1wb3J0IHJlcG9fZGlyDQo+ICtm
cm9tIHhlbl9hbmFseXNpcy51dGlscyBpbXBvcnQgaW52b2tlX2NvbW1hbmQNCj4gDQo+IA0KPiBk
ZWYgbG9nX2luZm8odGV4dCwgZW5kPSdcbicpOg0KPiBAQCAtMzYsOSArNDAsMzIgQEAgZGVmIG1h
aW4oYXJndik6DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImFnYWluc3QgdGhlIGJh
c2VsaW5lLiIpDQo+ICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCItdiIsICItLXZlcmJvc2UiLCBh
Y3Rpb249J3N0b3JlX3RydWUnLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBoZWxwPSJQcmlu
dCBtb3JlIGluZm9ybWF0aW9ucyBkdXJpbmcgdGhlIHJ1bi4iKQ0KPiArICAgIHBhcnNlci5hZGRf
YXJndW1lbnQoIi0tcGF0Y2giLCB0eXBlPXN0ciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IGhlbHA9IlRoZSBwYXRjaCBmaWxlIGNvbnRhaW5pbmcgdGhlIGNoYW5nZXMgdG8gdGhlICINCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNvZGUsIGZyb20gdGhlIGJhc2VsaW5lIGFu
YWx5c2lzIHJlc3VsdCB0byB0aGUgIg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
J2NoZWNrIHJlcG9ydCcgYW5hbHlzaXMgcmVzdWx0LlxuIg0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiRG8gbm90IHVzZSB3aXRoIC0tYmFzZWxpbmUtcmV2Ly0tcmVwb3J0LXJldiIp
DQo+ICsgICAgcGFyc2VyLmFkZF9hcmd1bWVudCgiLS1iYXNlbGluZS1yZXYiLCB0eXBlPXN0ciwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGhlbHA9IlJldmlzaW9uIG9yIFNIQSBvZiB0aGUg
Y29kZWJhc2UgYW5hbHlzZWQgdG8gIg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
Y3JlYXRlIHRoZSBiYXNlbGluZSByZXBvcnQuXG4iDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJVc2UgdG9nZXRoZXIgd2l0aCAtLXJlcG9ydC1yZXYiKQ0KPiArICAgIHBhcnNlci5h
ZGRfYXJndW1lbnQoIi0tcmVwb3J0LXJldiIsIHR5cGU9c3RyLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgaGVscD0iUmV2aXNpb24gb3IgU0hBIG9mIHRoZSBjb2RlYmFzZSBhbmFseXNlZCB0
byAiDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjcmVhdGUgdGhlICdjaGVjayBy
ZXBvcnQnLlxuIg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiVXNlIHRvZ2V0aGVy
IHdpdGggLS1iYXNlbGluZS1yZXYiKQ0KPiANCj4gICAgIGFyZ3MgPSBwYXJzZXIucGFyc2VfYXJn
cygpDQo+IA0KPiArICAgIGlmIGFyZ3MucGF0Y2ggYW5kIChhcmdzLmJhc2VsaW5lX3JldiBvciBh
cmdzLnJlcG9ydF9yZXYpOg0KPiArICAgICAgICBwcmludCgiRVJST1I6ICctLXBhdGNoJyBhcmd1
bWVudCBjYW4ndCBiZSB1c2VkIHdpdGggJy0tYmFzZWxpbmUtcmV2JyINCj4gKyAgICAgICAgICAg
ICAgIiBvciAnLS1yZXBvcnQtcmV2Jy4iKQ0KPiArICAgICAgICBzeXMuZXhpdCgxKQ0KPiArDQo+
ICsgICAgaWYgYm9vbChhcmdzLmJhc2VsaW5lX3JldikgIT0gYm9vbChhcmdzLnJlcG9ydF9yZXYp
Og0KPiArICAgICAgICBwcmludCgiRVJST1I6ICctLWJhc2VsaW5lLXJldicgbXVzdCBiZSB1c2Vk
IHRvZ2V0aGVyIHdpdGggIg0KPiArICAgICAgICAgICAgICAiJy0tcmVwb3J0LXJldicuIikNCj4g
KyAgICAgICAgc3lzLmV4aXQoMSkNCj4gKw0KPiAgICAgaWYgYXJncy5vdXQgPT0gInN0ZG91dCI6
DQo+ICAgICAgICAgZmlsZV9vdXQgPSBzeXMuc3Rkb3V0DQo+ICAgICBlbHNlOg0KPiBAQCAtNjMs
MTEgKzkwLDM1IEBAIGRlZiBtYWluKGFyZ3YpOg0KPiAgICAgICAgIG5ld19yZXAucGFyc2UoKQ0K
PiAgICAgICAgIGRlYnVnLmRlYnVnX3ByaW50X3BhcnNlZF9yZXBvcnQobmV3X3JlcCkNCj4gICAg
ICAgICBsb2dfaW5mbygiIFtPS10iKQ0KPiAtICAgIGV4Y2VwdCBSZXBvcnRFcnJvciBhcyBlOg0K
PiArICAgICAgICBkaWZmX3NvdXJjZSA9IE5vbmUNCj4gKyAgICAgICAgaWYgYXJncy5wYXRjaDoN
Cj4gKyAgICAgICAgICAgIGRpZmZfc291cmNlID0gb3MucGF0aC5yZWFscGF0aChhcmdzLnBhdGNo
KQ0KPiArICAgICAgICBlbGlmIGFyZ3MuYmFzZWxpbmVfcmV2Og0KPiArICAgICAgICAgICAgZ2l0
X2RpZmYgPSBpbnZva2VfY29tbWFuZCgNCj4gKyAgICAgICAgICAgICAgICAiZ2l0IGRpZmYgLS1n
aXQtZGlyPXt9IC1DIC1DIHt9Li57fSIuZm9ybWF0KHJlcG9fZGlyLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJncy5iYXNl
bGluZV9yZXYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBhcmdzLnJlcG9ydF9yZXYpLA0KPiArICAgICAgICAgICAgICAgIFRy
dWUsICJFcnJvciBvY2N1cmVkIGludm9raW5nOlxue31cblxue30iDQo+ICsgICAgICAgICAgICAp
DQoNCknigJl2ZSBub3RpY2VkIG5vdyBhbiBpc3N1ZSBoZXJlLCB3aGVuIHVzaW5nIC0tYmFzZWxp
bmUtcmV2Ly0tcmVwb3J0LXJldiwgdGhlIGZpeCBpcyB0aGlzIG9uZToNCg0KZGlmZiAtLWdpdCBh
L3hlbi9zY3JpcHRzL2RpZmYtcmVwb3J0LnB5IGIveGVuL3NjcmlwdHMvZGlmZi1yZXBvcnQucHkN
CmluZGV4IGQ2MDhlM2EwNWFhMS4uNjM2Zjk4ZjVlZWJlIDEwMDc1NQ0KLS0tIGEveGVuL3Njcmlw
dHMvZGlmZi1yZXBvcnQucHkNCisrKyBiL3hlbi9zY3JpcHRzL2RpZmYtcmVwb3J0LnB5DQpAQCAt
OTUsOSArOTUsOCBAQCBkZWYgbWFpbihhcmd2KToNCiAgICAgICAgICAgICBkaWZmX3NvdXJjZSA9
IG9zLnBhdGgucmVhbHBhdGgoYXJncy5wYXRjaCkNCiAgICAgICAgIGVsaWYgYXJncy5iYXNlbGlu
ZV9yZXY6DQogICAgICAgICAgICAgZ2l0X2RpZmYgPSBpbnZva2VfY29tbWFuZCgNCi0gICAgICAg
ICAgICAgICAgImdpdCBkaWZmIC0tZ2l0LWRpcj17fSAtQyAtQyB7fS4ue30iLmZvcm1hdChyZXBv
X2RpciwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhcmdzLmJhc2VsaW5lX3JldiwNCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmdzLnJlcG9ydF9yZXYpLA0KKyAg
ICAgICAgICAgICAgICAiZ2l0IC0tZ2l0LWRpcj17fS8uZ2l0IGRpZmYgLUMgLUMge30uLnt9Ig0K
KyAgICAgICAgICAgICAgICAuZm9ybWF0KHJlcG9fZGlyLCBhcmdzLmJhc2VsaW5lX3JldiwgYXJn
cy5yZXBvcnRfcmV2KSwNCiAgICAgICAgICAgICAgICAgVHJ1ZSwgIkVycm9yIG9jY3VyZWQgaW52
b2tpbmc6XG57fVxuXG57fSINCiAgICAgICAgICAgICApDQogICAgICAgICAgICAgZGlmZl9zb3Vy
Y2UgPSBnaXRfZGlmZi5zcGxpdGxpbmVzKGtlZXBlbmRzPVRydWUpDQoNCknigJlsbCB3YWl0IGZv
ciBvdGhlciBmZWVkYmFjayBvbiB0aGUgcGF0Y2ggYmVmb3JlIHNlbmRpbmcgaXQgYWdhaW4uDQoN
Cg0KDQoNCg==

