Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFB3FEA4A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 09:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177104.322324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhbH-0008OB-Dd; Thu, 02 Sep 2021 07:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177104.322324; Thu, 02 Sep 2021 07:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLhbH-0008Le-9H; Thu, 02 Sep 2021 07:57:31 +0000
Received: by outflank-mailman (input) for mailman id 177104;
 Thu, 02 Sep 2021 07:57:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+khH=NY=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mLhbF-0008LW-Ha
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 07:57:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b8d669d-1468-457d-96e2-40290352b25a;
 Thu, 02 Sep 2021 07:57:28 +0000 (UTC)
Received: from AM5PR1001CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::18) by PAXPR08MB6861.eurprd08.prod.outlook.com
 (2603:10a6:102:138::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 07:57:24 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::cb) by AM5PR1001CA0041.outlook.office365.com
 (2603:10a6:206:15::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 07:57:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 07:57:24 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Thu, 02 Sep 2021 07:57:23 +0000
Received: from 510daa24c306.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3ECF3DD2-E246-461E-B55B-2672DFBCCA53.1; 
 Thu, 02 Sep 2021 07:57:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 510daa24c306.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Sep 2021 07:57:17 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6477.eurprd08.prod.outlook.com (2603:10a6:102:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 07:57:16 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4457.024; Thu, 2 Sep 2021
 07:57:16 +0000
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
X-Inumbo-ID: 0b8d669d-1468-457d-96e2-40290352b25a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntSFR6cfOCTWWDlTYNXDpalfdTw+y4oUqcYj51r9iZM=;
 b=KVgBj6vFozjH9e0m+YA5LxmqvI+6fu/bXc8cpcpJULzGePhqDvotMk1us0B1xmM77NGQJ0mtzraXTNMSVvtI+Oh2DEDCDQ6EocO5ClNlOpPbbaRallj0N/CP+I1DtWxFlTfIXik0cSstAzU/4By+cf1gfI2GBAFZ8kSDNEt9wl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e29bfe8e8ce2551
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeeGDSltJszWaKXDmZwH5KbhHf3NaUrpTjIb/Mkpmm6zv1k7y3WUCh1ElJ4d6i52903iWiKpKY385/iVUnB97+KmWEUtBQbg9fUtl2XgNztpa7G+bfML5Ira3eNO361K8qbuGVXryR03/FI44DKWUWH/O5M55CNNA68xdSEJj0vjwGqnJOQj9+JWC8+N7Eey+wAqWtLIxUws4Kq8WbtBXvxHTr08dVsTmrLexYgV+1jMK02ZIabhCBduRCJjq1YvDVaAU2k4bgSyOf7mS6zh6JjEjP9uL7n/2DsS7Y0oDgOE45IUNOUzyVT8CQjMjXBnl1pK/3NYRbdAg5GZ6jD04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ntSFR6cfOCTWWDlTYNXDpalfdTw+y4oUqcYj51r9iZM=;
 b=PPeSkPxbHwHnyQLOdZdvZrPejRcX20+zhf9lxLISbXz/YCtVbd1BSSh+QJ97rNIFrP0zqE7PxF8xxWieQOpseC/dtAu8gr/d4SnupPC7W3PkZqZBT9mfQYrTHONetW/KUe1MhO0YXcDs8HKzjkKlXzjle2VGYk2uFUO2ZDQNF4dQMDUywzo8RPlTn7bpabmclYLrbNVN8Vv5woE35u0FUxZ5o9oPQ+MDVsDx8az3a8XYo9ZkR1f88iuG97KudZUIxIq5XDyqEecYE0u+zwmO3x+BxxRe6Zo4mLZwbF0SmM/5xVDwB9OYTutcM/jBm9gHkZhqP/XZChBi253jZS+BCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntSFR6cfOCTWWDlTYNXDpalfdTw+y4oUqcYj51r9iZM=;
 b=KVgBj6vFozjH9e0m+YA5LxmqvI+6fu/bXc8cpcpJULzGePhqDvotMk1us0B1xmM77NGQJ0mtzraXTNMSVvtI+Oh2DEDCDQ6EocO5ClNlOpPbbaRallj0N/CP+I1DtWxFlTfIXik0cSstAzU/4By+cf1gfI2GBAFZ8kSDNEt9wl8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<Michal.Orzel@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
Thread-Topic: [PATCH] xen/arm: Introduce pmu_access parameter
Thread-Index:
 AQHXny72/ET98Hho/USYtlrYv98fUauPIugAgAAENgCAABSIgIAAOtOAgAAK3QCAAOCVgA==
Date: Thu, 2 Sep 2021 07:57:16 +0000
Message-ID: <5B7B9C01-FF1D-44F9-8815-A422E51916A0@arm.com>
References: <20210901124308.31573-1-michal.orzel@arm.com>
 <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
 <44B48162-EB44-4295-9629-2D95A40D7232@arm.com>
 <46e36ba5-8b3d-2d43-6297-b92d2654ab72@xen.org>
 <alpine.DEB.2.21.2109011045440.17925@sstabellini-ThinkPad-T480s>
 <0e72fb05-a477-ef79-c26f-bc011393a403@xen.org>
In-Reply-To: <0e72fb05-a477-ef79-c26f-bc011393a403@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3fa7285f-14a1-42b9-96b6-08d96de74cc7
x-ms-traffictypediagnostic: PAXPR08MB6477:|PAXPR08MB6861:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6861FEC68A13662FAFF8E3C39DCE9@PAXPR08MB6861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JxM2BR8EKGesiIpWcr2WI4Gzz97N2CMbXBa0g66NCj1EGjajJnY1VkV/ulWDs20FL45eoonRgOD7T2PuAAH63MUqfOGS9iAI2J9ztelOAjSCNDCmkps7hULL8ZA+eemPFSvWlTwQDkPHVKcXbjmx8uIYjiS4ygEr0WU9g0jA0gVmqNJchUQ29rLAXtr7X34b9dXxTdaT9bNbAmTBNjVhfFifs/zDeRUAx7TBsZ9rCfrInxL4Qq8NqRFGIV+A66iNVjOLKDmTszbHc15C0OVR5SAmWKsjUPb0WECeZ6WWbWikmekNNUjjCGP3gUG9qhua78uUiyCx6TZT0MaRrWTlsMZB0uQ2AipsX7mg9QMzgi49w1Nu7dhvalPcj4FELda+e79JX1qFvjUeQfxsm9+72r0v4yem64qAHBtRgRb3a10BlWDtllWRzIk4hCn4OgD0MB9WmF1WmMO50CDJPDQqNDKMlcoNY0xA1TFZq8zInx4guqKUpNxfbkzUn+3pCvBkLK2tXrqf871lGE/s1H0Cv4SOF4Y6DF7+0BVG5jhXFi0ZDusXUsMDE4rDaoUMbXMSAe3dqWXJNsH4SUAzQXxKVeA04xiGI/baITsC54DHrk//wtS8rbdCp2R/AV1WLZtRLXc7YRvma1/5EnLrh/99S9ealuVa7/GMN4KWp8jVpnFuid1T3TFNb1VWO6SctASBfuFu78Kuj8pSJUPHbMxi6uUb6Tky2dK6NLkox2c6P3AAT6E4BxqknNDos35QWsKz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(26005)(6506007)(86362001)(478600001)(53546011)(38070700005)(6512007)(33656002)(6916009)(2616005)(36756003)(66476007)(66556008)(64756008)(66446008)(6486002)(2906002)(186003)(91956017)(76116006)(8676002)(8936002)(71200400001)(4326008)(38100700002)(54906003)(316002)(5660300002)(83380400001)(122000001)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <867EF41F77E3234C88AFCA1BDAE35D46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6477
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1e4dcca-8f65-4b19-7459-08d96de747f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	656ATI06FYh8EQeTYkgRV2lC1edRwuxgQic7RMeeBTVVz0gklXqYnLmCwjVmutYLM3ta6kzY8m4Fe0yMpMY7mHNXVbI0BvGFmZ8RhNETV10go8Zq0F7CrsiIYuOcy1oqyv0nUZm+x1TPP+ntiFlaycVugBxUBxK7tYO5Ny5n6DqVjad9NXR659GUAEcoFgeoflf+RmZiuQ9mPKTDaOEx4GekBy51E7wL1rr1ouTlNzRf7rAzbAZezbJU/kaLp9VyxjMGyi3C4L8sd3dAeGRGnOYIn0RQRieqsiOsJ+kXm8aoGgZ26oLjxui3Loil92QPPG51i28ubEpo2aipKfMf9ehU7znSnRxZTS3rszlmw8wCMRhME2YEWLb9Xk7CCKVswMZ0eQYhV4lLVzhCJhP2P1K6sAMgSV7VNxMS4Bb0VqWqw8dWv5QwDX/CdIiWsm9r7odrAHHcE4LO67eaeRcL2n+1PH46WLF5yHe0RMXm0h0dRJTRtTsSbOr6wXp1s6KW46kEKcAayjI5qshb1MVix0B3ScLgHCJ3Q00kXX8Xave5E3DNW8jxKfEzO7wv4Pwtu/N2k8VaEzYDGa5+c31pPrVMWA3ytKUzw7PuUh5P7IyUVaqM1zucWcRzrTFodXxjfFETJD2Uz8TppGLkEXW3hv55JIWok5Q+kVnEdex9TtiShvvu/y8JFnTkMQOj104w6+4Q2fJJW9amm++bKXFDyg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(36840700001)(46966006)(83380400001)(8676002)(478600001)(6512007)(81166007)(6486002)(4326008)(6862004)(2616005)(107886003)(54906003)(86362001)(356005)(316002)(36756003)(47076005)(36860700001)(53546011)(6506007)(70206006)(26005)(8936002)(186003)(70586007)(336012)(33656002)(5660300002)(82740400003)(82310400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 07:57:24.1927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa7285f-14a1-42b9-96b6-08d96de74cc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6861

SGkgSnVsaWVuLA0KDQo+IE9uIDEgU2VwIDIwMjEsIGF0IDE5OjMzLCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFN0ZWZhbm8sDQo+IA0KPiBPbiAwMS8wOS8y
MDIxIDE4OjU0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBXZWQsIDEgU2VwIDIw
MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBPbiAwMS8wOS8yMDIxIDE0OjEwLCBCZXJ0cmFu
ZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gMSBTZXAgMjAyMSwgYXQgMTM6NTUsIEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBIaSwNCj4+Pj4+IA0K
Pj4+Pj4gT24gMDEvMDkvMjAyMSAxMzo0MywgTWljaGFsIE9yemVsIHdyb3RlOg0KPj4+Pj4+IElu
dHJvZHVjZSBuZXcgWGVuIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIgY2FsbGVkICJwbXVfYWNjZXNz
Ii4NCj4+Pj4+PiBUaGUgZGVmYXVsdCB2YWx1ZSBpcyAidHJhcCI6IFhlbiB0cmFwcyBQTVUgYWNj
ZXNzZXMuDQo+Pj4+Pj4gSW4gY2FzZSBvZiBzZXR0aW5nIHBtdV9hY2Nlc3MgdG8gIm5hdGl2ZSIs
IFhlbiBkb2VzIG5vdCB0cmFwDQo+Pj4+Pj4gUE1VIGFjY2Vzc2VzIGFsbG93aW5nIGFsbCB0aGUg
Z3Vlc3RzIHRvIGFjY2VzcyBQTVUgcmVnaXN0ZXJzLg0KPj4+Pj4+IEhvd2V2ZXIsIGd1ZXN0cyBj
YW5ub3QgbWFrZSB1c2Ugb2YgUE1VIG92ZXJmbG93IGludGVycnVwdHMgYXMNCj4+Pj4+PiBQTVUg
dXNlcyBQUEkgd2hpY2ggWGVuIGNhbm5vdCByb3V0ZSB0byBndWVzdHMuDQo+Pj4+Pj4gVGhpcyBv
cHRpb24gaXMgb25seSBpbnRlbmRlZCBmb3IgZGV2ZWxvcG1lbnQgYW5kIHRlc3RpbmcgcHVycG9z
ZXMuDQo+Pj4+Pj4gRG8gbm90IHVzZSB0aGlzIGluIHByb2R1Y3Rpb24gc3lzdGVtLg0KPj4+Pj4g
SSBhbSBhZnJhaWQgeW91ciBvcHRpb24gaXMgbm90IHNhZmUgZXZlbiBpbiBkZXZlbG9wbWVudCBz
eXN0ZW0gYXMgYSB2Q1BVDQo+Pj4+PiBtYXkgbW92ZSBiZXR3ZWVuIHBDUFVzLg0KPj4+Pj4gDQo+
Pj4+PiBIb3dldmVyLCBldmVuIGlmIHdlIHJlc3RyaWN0ZWQgdGhlIHVzZSB0byBwaW5uZWQgdkNQ
VSAqYW5kKiBkZWRpY2F0ZWQNCj4+Pj4+IHBDUFUsIEkgYW0gbm90IGNvbnZpbmNlZCB0aGF0IGV4
cG9zaW5nIGFuIGhhbGYgYmFja2VkIFBNVSAodGhlIG92ZXJmbG93DQo+Pj4+PiBpbnRlcnJ1cHQg
d291bGQgbm90IHdvcmspIHRvIHRoZSBndWVzdCBpcyB0aGUgcmlnaHQgc29sdXRpb24uIFRoaXMg
bGlrZWx5DQo+Pj4+PiBtZWFucyB0aGUgZ3Vlc3QgT1Mgd291bGQgbmVlZCB0byBiZSBtb2RpZmll
ZCBhbmQgdGhlcmVmb3JlIHRoZSB1c2FnZSBvZg0KPj4+Pj4gdGhpcyBvcHRpb24gaXMgZmFpcmx5
IGxpbWl0ZWQuDQo+Pj4+PiANCj4+Pj4+IFNvIEkgdGhpbmsgdGhlIGZpcnN0IHN0ZXBzIGFyZToN
Cj4+Pj4+ICAgMSkgTWFrZSB0aGUgUFBJIHdvcmsuIFRoZXJlIHdhcyBzb21lIGF0dGVtcHQgaW4g
dGhlIHBhc3QgZm9yIGl0IG9uDQo+Pj4+PiB4ZW4tZGV2ZWwuIFlvdSBjb3VsZCBoYXZlIGEgbG9v
ay4NCj4+Pj4+ICAgMikgUHJvdmlkZSBQTVUgYmluZGluZ3MNCj4+Pj4+IA0KPj4+Pj4gV2l0aCB0
aGF0IGluIHBsYWNlLCB3ZSBjYW4gZGlzY3VzcyBob3cgdG8gZXhwb3NlIHRoZSBQTVUgZXZlbiBp
ZiBpdCBpcw0KPj4+Pj4gdW5zYWZlIGluIHNvbWUgY29uZGl0aW9ucy4NCj4+Pj4gDQo+Pj4+IFdp
dGggdGhvc2UgbGltaXRhdGlvbnMsIHVzaW5nIHRoZSBQTVUgdG8gbW9uaXRvciB0aGUgc3lzdGVt
IHBlcmZvcm1hbmNlcyBvcg0KPj4+PiBvbiBzb21lIHNwZWNpZmljIHVzZSBjYXNlcyBpcyBzdGls
bCByZWFsbHkgdXNlZnVsLg0KPj4+PiBXZSBhcmUgdXNpbmcgdGhhdCB0byBkbyBzb21lIGJlbmNo
bWFya3Mgb2YgWGVuIG9yIG9mIHNvbWUgYXBwbGljYXRpb25zIHRvDQo+Pj4+IGNvbXBhcmUgdGhl
IGJlaGF2aW91ciB0byBhIG5hdGl2ZSBzeXN0ZW0gb3INCj4+Pj4gYW5hbHlzZSB0aGUgcGVyZm9y
bWFuY2VzIG9mIFhlbiBpdHNlbGYgKGh5cGVyY2FsbHMsY29udGV4dCBzd2l0Y2gg4oCmZXRjKQ0K
Pj4gSSBhbHNvIGFscmVhZHkgaGFkIHRvIHdyaXRlIGEgcGF0Y2ggYWxtb3N0IGV4YWN0bHkgbGlr
ZSB0aGlzIG9uZSB0bw0KPj4gcHJvdmlkZSB0byBjdXN0b21lcnMgYSBmZXcgbW9udGhzIGJhY2su
DQo+Pj4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgdXNlZnVsIGZvciBzb21lIHNldHVwIGFuZCBJIGFt
IG5vdCB0cnlpbmcgdG8gc2F5IHdlDQo+Pj4gc2hvdWxkIG5vdCBoYXZlIGEgd2F5IHRvIGV4cG9z
ZSB0aGUgUE1VIChldmVuIHVuc2FmZWx5KSBpbiB1cHN0cmVhbS4gSG93ZXZlciwNCj4+PiBJIHRo
aW5rIHRoZSBvcHRpb24gYXMgaXQgc3RhbmRzIGlzIHRvbyB3aWRlICh0aGlzIHNob3VsZCBiZSBh
IHBlciBkb21haW4ga25vYikNCj4+PiBhbmQgd2Ugc2hvdWxkIHByb3Blcmx5IGV4cG9zZSB0aGUg
UE1VIChpbnRlcnJ1cHRzLCBiaW5kaW5ncy4uLikuDQo+PiBJIGhhdmUgbmV2ZXIgdXNlZCBQTVUg
ZGlyZWN0bHkgbXlzZWxmLCBvbmx5IHByb3ZpZGVkIGEgcGF0Y2ggc2ltaWxhciB0bw0KPj4gdGhp
cyBvbmUuICBCdXQgYXMgZmFyIGFzIEkgY291bGQgdGVsbCB0aGUgdXNlcnMgd2VyZSBmdWxseSBz
YXRpc2ZpZWQNCj4+IHdpdGggaXQgYW5kIGl0IGhhZCBubyBpbnRlcnJ1cHRzIHN1cHBvcnQgZWl0
aGVyLiBDb3VsZCBpdCBiZSB0aGF0DQo+PiBpbnRlcnJ1cHRzIGFyZSBub3QgYWN0dWFsbHkgbmVl
ZGVkIHRvIHJlYWQgdGhlIHBlcmYgY291bnRlcnMsIHdoaWNoIGlzDQo+PiBwcm9iYWJseSB3aGF0
IHVzZXJzIGNhcmUgYWJvdXQ/DQo+IA0KPiBZb3UgZG9uJ3QgbmVlZCB0aGUgaW50ZXJydXB0cyB0
byByZWFkIHRoZSBwZXJmIGNvdW50ZXJzLiBCdXQgQUZBSVUsIHlvdSB3b3VsZCBoYXZlIHRvIHBv
bGwgYXQgYSByZWd1bGFyIGludGVydmFsIHlvdXJzZWxmLiBUaGVyZSBpcyBhbHNvIHRoZSBxdWVz
dGlvbiBvbiBob3cgdG8gY2F0Y2ggdGhlIG92ZXJmbG93Pw0KPiANCj4+IEluIHJlZ2FyZHMgdG8g
InRoaXMgc2hvdWxkIGJlIGEgcGVyIGRvbWFpbiBrbm9iIiwgaW4gcmVhbGl0eSBpZiB5b3UgYXJl
DQo+PiBkb2luZyBQTVUgZXhwZXJpbWVudHMgeW91IGRvbid0IGNhcmUgaWYgb25seSBvbmUgb3Ig
YWxsIGRvbWFpbnMgaGF2ZQ0KPj4gYWNjZXNzOiB5b3UgYXJlIHdvcmtpbmcgaW4gYSBjb250cm9s
bGVkIGVudmlyb25tZW50IHRyeWluZyB0byBmaWd1cmUgb3V0DQo+PiBpZiB5b3VyIHNldHVwIG1l
ZXRzIHRoZSB0aW1pbmcgcmVxdWlyZW1lbnRzLiBUaGVyZSBhcmUgbm8gc2VjdXJpdHkgb3INCj4+
IHNhZmV0eSBjb25jZXJucyAodGhvc2UgYXJlIGRpZmZlcmVudCBleHBlcmltZW50cykgYW5kIHRo
ZXJlIGlzIG5vDQo+PiBpbnRlcmZlcmVuY2UgcHJvYmxlbXMgaW4gdGhlIHNlbnNlIG9mIG11bHRp
cGxlIGRvbWFpbnMgdHJ5aW5nIHRvIGFjY2Vzcw0KPj4gUE1VIGF0IHRoZSBzYW1lIHRpbWUgLS0g
eW91IGNvbnRyb2wgdGhlIGRvbWFpbnMgeW91IGRlY2lkZSB3aGljaCBvbmUgaXMNCj4+IGFjY2Vz
c2luZyB0aGVtLiA+DQo+PiBTbyBJIGFtIGluIGZhdm9yIG9mIGEgcGF0Y2ggbGlrZSB0aGlzIG9u
ZSBiZWNhdXNlIGl0IGFjdHVhbGx5IHNhdGlzZnkNCj4+IG91ciByZXF1aXJlbWVudHMuIEV2ZW4g
aWYgd2UgaGFkIHBlci1kb21haW4gc3VwcG9ydCBhbmQgaW50ZXJydXB0cw0KPj4gc3VwcG9ydCwg
SSBkb24ndCB0aGluayB0aGV5IHdvdWxkIGVuZCB1cCBiZWluZyB1c2VkLg0KPiANCj4gSSBoYXZl
IHRvIGRpc2FncmVlIHdpdGggdGhhdC4gVGhlcmUgYXJlIHZhbGlkIHVzZS1jYXNlcyB3aGVyZSB5
b3UgbWF5IHdhbnQgdG8gZXhwb3NlIHRoZSBQTVUgZm9yIHVzaW5nIHBlcmYgdG8gYSBzaW5nbGUg
ZG9tYWluIGJlY2F1c2UgeW91IGtub3cgaXQgaXMgc2FmZSB0byBkbyBzby4gSSBhcHByZWNpYXRl
IHRoaXMgaXMgbWF5IG5vdCBiZSB0aGUgdXNlIGNhc2UgZm9yIHlvdXIgdXNlcnMgKHlldCksIGJ1
dCBJIGhhdmUgc2VlbiAoYW5kIHVzZWQpIGl0IG9uIHg4Ni4gU28gdG8gbWUgdGhpcyBhcHByb2Fj
aCBpcyBzaG9ydC1zaWdoZWQuDQo+IA0KPiBUQkgsIHRoaXMgaXMgbm90IHRoZSBmaXJzdCB0aW1l
IEkgaGF2ZSBzZWVuIHBhdGNoIGZvciAibGV0J3MgZXhwb3NlIHRoZSBzYW1lIGZlYXR1cmUgdG8g
ZXZlcnlvbmUgYmVjYXVzZSB0aGlzIGlzIGVhc3kgdG8gZG8iIGFuZCByZWFsbHkgZGlzbGlrZSBp
dC4gRXhwb3NpbmcgYSBuZXcgZmVhdHVyZSBmcm9tIHRoZSB0b29sc3RhY2sgaXMgZWFzaWVyIHRo
YW4geW91IHRoaW5rIChiYXJpbmcgdGhlIGxhY2sgb2YgcmV2aWV3cyksIHRoaXMgaXMgYSBtYXR0
ZXIgb2YgY3JlYXRpbmcgYSBuZXcgZmxhZyBhIG5ldyBvcHRpb24uIFRoaXMgd291bGQgbWFrZSBY
ZW4gYSBsb3QgbW9yZSBmbGV4aWJsZSBhbmQgZW5hYmxlIG1vcmUgdXNlcnMuLi4NCg0KSWYgSSB1
bmRlcnN0YW5kIGl0IHJpZ2h0LCB5b3Ugd2FudCBhIHBlciBndWVzdCBwYXJhbWV0ZXIgdG8gYmUg
YWJsZSB0byBhbGxvdyBQTVUgYWNjZXNzZXMuDQpUaGlzIHdvdWxkIHJlcXVpcmU6DQotIHRvIHNh
dmUvcmVzdG9yZSBNRENSIG9uIGNvbnRleHQgc3dpdGNoDQotIGludHJvZHVjZSBhIG5ldyBjb25m
aWcgcGFyYW1ldGVyIGZvciBndWVzdHMgKG1pZ2h0IG9yIG1pZ2h0IG5vdCBuZWVkIGEgdG9vbCBj
aGFuZ2UpDQotIGhhdmUgYSB4ZW4gY29tbWFuZCBsaW5lIHBhcmFtZXRlciB0byBoYXZlIGEgc29s
dXRpb24gdG8gQWxsb3cgUE1VIGZvciBkb20wIChvciBtYXliZSBhIERUQiBvbmUpDQoNCkJ1dCB0
aGlzIHdvdWxkIE5PVCBpbmNsdWRlOg0KLSBpbnRlcnJ1cHQgc3VwcG9ydCAob25seSBuZWVkZWQg
dG8gZ2V0IGluZm9ybWVkIG9mIG92ZXJmbG93KQ0KLSBwcm92aWRlIFBNVSB2aXJ0dWFsaXphdGlv
biAobm90IGV2ZW4gc3VyZSBzb21ldGhpbmcgbGlrZSB0aGF0IGNvdWxkIG1ha2UgbXVjaCBzZW5z
ZSkNCg0KSSBhbSBub3Qgc2F5aW5nIHRoYXQgd2Ugd2lsbCBkbyB0aGF0IG5vdyBidXQgYXMgSSBu
ZWVkIHRvIHVuYmxvY2sgdGhpcyBJIGNvdWxkIGV2YWx1YXRlIHRoZSBlZmZvcnQgYW5kIHNlZSBp
ZiBpdCBjb3VsZCBiZSBwb3NzaWJsZSB0byBkbyB0aGlzIGluIHRoZSBmdXR1cmUuDQpJbiB0aGUg
bWVhbnRpbWUgd2Ugd2lsbCBzdGFydCBtYWludGFpbmluZyBhbiBpbnRlcm5hbCBicmFuY2ggd2l0
aCBwYXRjaGVzIHJlZnVzZWQgdXBzdHJlYW0gYXMgdGhpcyBpcyBibG9ja2luZyB1cy4NCg0KS2lu
ZCByZWdhcmRzDQpCZXJ0cmFuZA0KDQo+IA0KPiBTbyBhcyBpdCBzdGFuZHM6DQo+IA0KPiBOQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

