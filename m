Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E996E4DB7D4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 19:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291249.494217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUYCn-0007WY-KW; Wed, 16 Mar 2022 18:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291249.494217; Wed, 16 Mar 2022 18:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUYCn-0007TR-HE; Wed, 16 Mar 2022 18:17:05 +0000
Received: by outflank-mailman (input) for mailman id 291249;
 Wed, 16 Mar 2022 18:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GRoA=T3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nUYCm-0007TL-U3
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 18:17:05 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4794b915-a555-11ec-853c-5f4723681683;
 Wed, 16 Mar 2022 19:17:03 +0100 (CET)
Received: from AM5PR0601CA0062.eurprd06.prod.outlook.com (2603:10a6:206::27)
 by DB7PR08MB3547.eurprd08.prod.outlook.com (2603:10a6:10:4f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 18:17:01 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::72) by AM5PR0601CA0062.outlook.office365.com
 (2603:10a6:206::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Wed, 16 Mar 2022 18:17:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 18:17:00 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 16 Mar 2022 18:17:00 +0000
Received: from 8830ec9a8197.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C86A487E-CC1D-4A3C-BC0C-989A89B2B95C.1; 
 Wed, 16 Mar 2022 18:16:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8830ec9a8197.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Mar 2022 18:16:53 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Wed, 16 Mar
 2022 18:16:52 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.029; Wed, 16 Mar 2022
 18:16:52 +0000
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
X-Inumbo-ID: 4794b915-a555-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LPbMz1+hxUjd+1jANi9gXQwCmrboKPbX+r2mfQ8QT4=;
 b=W1zTaA6FmhxJf5irX3W9Yx45cWpkt0P6NefR/x1I1Qkiiqr98lSHZy9v2rgTgRDFq+t0hRF6zp2g6r6x+hWlPi/E5Jvfo9wCaLV2jZqha5Uue2khSMQE1Sv4yxhggW4E3cbtxhUqRXFuTmITZCv+qEUcHZp/JD8h0yiS5jkt0F0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 433635942d133f32
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9GVLzY6COHb22T/7C8TD3h+WVBE2xMoUGOsJAypMIY6UBiD8gIL4Y9qUhtWoTsQKMmFyhQCJKJmT3N02FxFV1XGIzUZSUWTvpK5dsPJMkfiQlyYYuzmDpR/5RP5fqYUdRXoat8ZeqLTaLUK5vTW7wxFbg1SnRUfM+PyEYlNbieuvpJ0IoDTpyMYexIh4hm5xV1lsPoaW3jP9tNPwjzHa0q8WvJB3sQRQ4ChwR0cL+kKRXRucNrSpuqqjV14YgBrgePk93/yAXgDk/bqk6p0AtjTgEJ+nviZc0BTMNALddz5FUbNACGgT3IcybP2VGlxWzo4BdxK4uPpZbGoFLGs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LPbMz1+hxUjd+1jANi9gXQwCmrboKPbX+r2mfQ8QT4=;
 b=ew7qUdsaz1wIzbgm2FThj7MXpNjz1NqozZP0LUxlaMWLESgR0smLYhDATmJRBFh/2LgC+gP0NS1giaVzJJ9UJSleV9+vozA0mYcCwpbKgxkVZe3Tg5+q0ydpjz5o+HJcupqqC5TAxxpxuJGCPP7r6np9S08PUeB2uqsu/N4bgnUiccwrIjHFxp/bpt4nxzZQ2XUBxlTRy/MJLD2NEzYr/QTZv+ehSMQ110lDSJ/CC7RO5VSZZLcHhESim+PhATW4cpavRY3Iw93pmOOMD1mxtHoOQYxhFLaoaZBpHlV/2+xYu/pdBNs0H0aGlMPcprdlkJxvXiyGhT7BGwSZTNY8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LPbMz1+hxUjd+1jANi9gXQwCmrboKPbX+r2mfQ8QT4=;
 b=W1zTaA6FmhxJf5irX3W9Yx45cWpkt0P6NefR/x1I1Qkiiqr98lSHZy9v2rgTgRDFq+t0hRF6zp2g6r6x+hWlPi/E5Jvfo9wCaLV2jZqha5Uue2khSMQE1Sv4yxhggW4E3cbtxhUqRXFuTmITZCv+qEUcHZp/JD8h0yiS5jkt0F0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] tools/xenstore: add documentation for extended watch
 command
Thread-Topic: [PATCH 3/3] tools/xenstore: add documentation for extended watch
 command
Thread-Index: AQHYOVBwqPi09a60w0Ci2FVt6reoH6zCUWQA
Date: Wed, 16 Mar 2022 18:16:52 +0000
Message-ID: <6D6D470C-C6A6-440D-B70D-C9737853D050@arm.com>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-4-jgross@suse.com>
In-Reply-To: <20220316161017.3579-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b012c227-3a34-4cc4-dfc7-08da07792a40
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AM5EUR03FT013:EE_|DB7PR08MB3547:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3547A2A392899F81AAF2C31DE4119@DB7PR08MB3547.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sWiPXBA3mzmMI/5HG3fQP5e0nOV8hWiK4pR9gNTXEPbY/b6x6zqLICPPmjSNphPSQ89ovhPojYmyi7uUjgwveq68PyH/bF2sDAvWKoC8BOsCOttnatysdVwnNsgTPMqx0yxF+S7qXsm1hHTk/XhooxSLsahV11sg4Y8oJotr9Ve0PqDZMj5GngiFWYtd7q/ux4EFxS90QFnKOf0gc/LCRnC6TDqCWQYdGSv57CXpxNXX/MeBlIWjSLz2mGytP+jJLxVU0aspNQo0DcLO/8rf4H0HFjb/X3EMKTdaDg2KYzlKmGlhKpPoi2NzlwAwhqfHe4xXeItuJ3SGV+qYBOdwSTfZKm8EVQ433DwEBtHqdHW6/avCXKPdIaTt2f8HPN8o7w3kVgdbezRWxeoLXLJAGk0VlBdCasDVwdWolDiUvULFlJ/2IixHy/XRDGBUOGzBy3cD9MyUQ8qypG3FX7mzf0+VEc4kuGs2ZpweTgWgHErw4/nrV14z6LDbetWNj8/xr700vueID3SHiyFx8wKqkrrp+a8jzKAp6hk4ladRVNiRqpkWBg6wygc81ga6RZbqu07QS49XY6jYPagPv1Etcyj++y2mZf2fVKBg/wx2QBltQK/vv4KC199VlaaWCW8qP46wwyB6tkboErjer+iFbSjPvfBsxl2wZTJitiZgFcqjL/wOOt7xwQLw+4fEfGwaJd8OgF7QlK0CJk41QQWevoIh8xhvlgcDiG5RMBxMQzWnJSpM28CtEvMbFhw8RYN9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66446008)(8676002)(66556008)(122000001)(26005)(38100700002)(64756008)(186003)(83380400001)(53546011)(86362001)(2616005)(6506007)(6512007)(36756003)(76116006)(66946007)(508600001)(38070700005)(316002)(6916009)(54906003)(33656002)(91956017)(8936002)(66476007)(6486002)(2906002)(5660300002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBAB908765B1AD499221A90619A1E44A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2987
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2b922db-3209-4841-587e-08da07792588
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V+z14VTADQhKNBLOfDEOJ7e9RZ0iS72qPNES29qYNZ5++/nRNAlaHJ0XvYKTjiyEu/NUKJIVs/8bPpuSQMqwaojoCrbIjf79/l0niwYqK8Zo9FYP43NozVlCWGvntO7jwt/zppWJnGg6PK1BOV2KYVhAOGcGNweXIDSH7WHYOLPi5wRLA+VSbD+5cP6nMHXMfrI97dEkEcgsmVYVdhJE4Iks+1nEYKItV40r9F1IjBvPkeH7r8rikyfGLCQnzd4K0RqpLeGmk1Pz+ODKA3rIzY+OVDhgKiRf+pn4BEaFECKcqleX+lDcJC0m9nYSIVyjTc3T/cTleGq7fBAX8k9a1ljJFIFGCB2eBJNIO/ZFO8NH8bCHxO1KvtjTfTAQzwQjF19033gVMnPWYDS4PnuZPi9T6xYZD9LfCXMV2W/C+Uo1znBO/LYHfdjDeoQIuRPwffT91qrLO9HjEM0NQNyj9yyWpn9p6OSJysenK1ENnxPjfyCEXuKMClTvRuSQGQP4jdJbNG0o6cS9fEDAI+lo7KHr/zMiJFpy0/P2Zr+Vy7Ez+iIGg+AW0R7tjehCaKRZXIWqd7sD0iG57f8k2doKqcOyqReQdLVohrXothxphEHAIRgEZ2o8NYpNhVyTTJ5FcDl2wrkdBYdkcXm+LYydZJJKpAGHMeBd1hZifEso6RVo+mlMhtYXUobtfLEMcLo7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(53546011)(6506007)(2906002)(186003)(26005)(82310400004)(508600001)(6512007)(6486002)(86362001)(2616005)(47076005)(70206006)(40460700003)(6862004)(5660300002)(8936002)(36860700001)(83380400001)(336012)(316002)(356005)(81166007)(54906003)(33656002)(8676002)(70586007)(4326008)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 18:17:00.6897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b012c227-3a34-4cc4-dfc7-08da07792a40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3547

DQoNCj4gT24gMTYgTWFyIDIwMjIsIGF0IDE2OjEwLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gQWRkIGRvY3VtZW50YXRpb24gZm9yIGFuIGV4dGVuc2lvbiBv
ZiB0aGUgV0FUQ0ggY29tbWFuZCB1c2VkIHRvIGxpbWl0DQo+IHRoZSBzY29wZSBvZiB3YXRjaGVk
IHBhdGhzLiBBZGRpdGlvbmFsbHkgaXQgZW5hYmxlcyB0byByZWNlaXZlIG1vcmUNCj4gaW5mb3Jt
YXRpb24gaW4gdGhlIGV2ZW50cyByZWxhdGVkIHRvIHNwZWNpYWwgd2F0Y2hlcyAoQGludHJvZHVj
ZURvbWFpbg0KPiBvciBAcmVsZWFzZURvbWFpbikuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0tLQ0KPiBkb2NzL21pc2MveGVuc3RvcmUt
cmluZy50eHQgfCAgMSArDQo+IGRvY3MvbWlzYy94ZW5zdG9yZS50eHQgICAgICB8IDE2ICsrKysr
KysrKysrKystLS0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5zdG9yZS1yaW5nLnR4dCBi
L2RvY3MvbWlzYy94ZW5zdG9yZS1yaW5nLnR4dA0KPiBpbmRleCAwY2I3MmEzZTM1Li5lYWE2ZDBh
MWEzIDEwMDY0NA0KPiAtLS0gYS9kb2NzL21pc2MveGVuc3RvcmUtcmluZy50eHQNCj4gKysrIGIv
ZG9jcy9taXNjL3hlbnN0b3JlLXJpbmcudHh0DQo+IEBAIC03MCw2ICs3MCw3IEBAIE1hc2sgICAg
RGVzY3JpcHRpb24NCj4gMiAgICAgICBDb25uZWN0aW9uIGVycm9yIGluZGljYXRvciAoc2VlIGNv
bm5lY3Rpb24gZXJyb3IgZmVhdHVyZSBiZWxvdykNCj4gNCAgICAgICBHRVRfRkVBVFVSRSBhbmQg
U0VUX0ZFQVRVUkUgWGVuc3RvcmUgd2lyZSBjb21tYW5kcyBhcmUgYXZhaWxhYmxlDQo+IDggICAg
ICAgR0VUX1FVT1RBIGFuZCBTRVRfUVVPVEEgWGVuc3RvcmUgd2lyZSBjb21tYW5kcyBhcmUgYXZh
aWxhYmxlDQo+ICsxNiAgICAgIFdBVENIIGNhbiB0YWtlIGEgdGhpcmQgcGFyYW1ldGVyIGxpbWl0
aW5nIGl0cyBzY29wZQ0KPiANCj4gVGhlICJDb25uZWN0aW9uIHN0YXRlIiBmaWVsZCBpcyB1c2Vk
IHRvIHJlcXVlc3QgYSByaW5nIGNsb3NlIGFuZCByZWNvbm5lY3QuDQo+IFRoZSAiQ29ubmVjdGlv
biBzdGF0ZSIgZmllbGQgb25seSBjb250YWlucyB2YWxpZCBkYXRhIGlmIHRoZSBzZXJ2ZXIgaGFz
DQo+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuc3RvcmUudHh0IGIvZG9jcy9taXNjL3hlbnN0
b3JlLnR4dA0KPiBpbmRleCBkZDc1YTgxMzI4Li5mODZjNmQ5NzU3IDEwMDY0NA0KPiAtLS0gYS9k
b2NzL21pc2MveGVuc3RvcmUudHh0DQo+ICsrKyBiL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4g
QEAgLTE4OCw3ICsxODgsNyBAQCBTRVRfUEVSTVMJCTxwYXRoPnw8cGVybS1hcy1zdHJpbmc+fCs/
DQo+IA0KPiAtLS0tLS0tLS0tIFdhdGNoZXMgLS0tLS0tLS0tLQ0KPiANCj4gLVdBVENICQkJPHdw
YXRoPnw8dG9rZW4+fD8NCj4gK1dBVENICQkJPHdwYXRoPnw8dG9rZW4+fFs8ZGVwdGg+fF0/DQo+
IAlBZGRzIGEgd2F0Y2guDQo+IA0KPiAJV2hlbiBhIDxwYXRoPiBpcyBtb2RpZmllZCAoaW5jbHVk
aW5nIHBhdGggY3JlYXRpb24sIHJlbW92YWwsDQo+IEBAIC0xOTksNyArMTk5LDExIEBAIFdBVENI
CQkJPHdwYXRoPnw8dG9rZW4+fD8NCj4gCW1hdGNoaW5nIHdhdGNoIHJlc3VsdHMgaW4gYSBXQVRD
SF9FVkVOVCBtZXNzYWdlIChzZWUgYmVsb3cpLg0KPiANCj4gCVRoZSBldmVudCdzIHBhdGggbWF0
Y2hlcyB0aGUgd2F0Y2gncyA8d3BhdGg+IGlmIGl0IGlzIGFuIGNoaWxkDQo+IC0Jb2YgPHdwYXRo
Pi4NCj4gKwlvZiA8d3BhdGg+LiBUaGlzIG1hdGNoIGNhbiBiZSBsaW1pdGVkIGJ5IHNwZWNpZnlp
bmcgPGRlcHRoPiAoYQ0KPiArCWRlY2ltYWwgdmFsdWUgb2YgMCBvciBsYXJnZXIpOiBpdCBkZW5v
dGVzIHRoZSBkaXJlY3RvcnkgbGV2ZWxzDQo+ICsJYmVsb3cgPHdwYXRoPiB0byBjb25zaWRlciBm
b3IgYSBtYXRjaCAoIjAiIHdvdWxkIG5vdCBtYXRjaCBmb3INCj4gKwlhIGNoaWxkIG9mIDx3cGF0
aD4sICIxIiB3b3VsZCBtYXRjaCBvbmx5IGZvciBhIGRpcmVjdCBjaGlsZCwNCj4gKwlldGMuKS4N
Cj4gDQo+IAk8d3BhdGg+IGNhbiBiZSBhIDxwYXRoPiB0byB3YXRjaCBvciBAPHdzcGVjaWFsPi4g
IEluIHRoZQ0KPiAJbGF0dGVyIGNhc2UgPHdzcGVjaWFsPiBtYXkgaGF2ZSBhbnkgc3ludGF4IGJ1
dCBpdCBtYXRjaGVzDQo+IEBAIC0yMTAsNyArMjE0LDEzIEBAIFdBVENICQkJPHdwYXRoPnw8dG9r
ZW4+fD8NCj4gCQkJCXNodXRkb3duLCBhbmQgYWxzbyBvbiBSRUxFQVNFDQo+IAkJCQlhbmQgZG9t
YWluIGRlc3RydWN0aW9uDQo+IAk8d3NwZWNpYWw+IGV2ZW50cyBhcmUgc2VudCB0byBwcml2aWxl
Z2VkIGNhbGxlcnMgb3IgZXhwbGljaXRseQ0KPiAtCXZpYSBTRVRfUEVSTVMgZW5hYmxlZCBkb21h
aW5zIG9ubHkuDQo+ICsJdmlhIFNFVF9QRVJNUyBlbmFibGVkIGRvbWFpbnMgb25seS4gVGhlIHNl
bWFudGljcyBmb3IgYQ0KPiArCXNwZWNpZmljYXRpb24gb2YgPGRlcHRoPiBkaWZmZXIgZm9yIGdl
bmVyYXRpbmcgPHdzcGVjaWFsPg0KDQpUeXBvOiBzL2RpZmZlci9kaWZmZXJzLz8NCg0KPiArCWV2
ZW50czogc3BlY2lmeWluZyAiMSIgd2lsbCByZXBvcnQgdGhlIHJlbGF0ZWQgZG9taWQgYnkgdXNp
bmcNCj4gKwlAPHdzcGVjaWFsPi88ZG9taWQ+IGZvciB0aGUgcmVwb3J0ZWQgcGF0aC4gT3RoZXIg
PGRlcHRoPg0KPiArCXZhbHVlcyBhcmUgbm90IHN1cHBvcnRlZC4NCj4gKwlGb3IgQHJlbGVhc2VE
b21haW4gaXQgaXMgcG9zc2libGUgdG8gd2F0Y2ggb25seSBmb3IgYSBzcGVjaWZpYw0KPiArCWRv
bWFpbiBieSBzcGVjaWZ5aW5nIEByZWxlYXNlRG9tYWluLzxkb21pZD4gZm9yIHRoZSBwYXRoLg0K
PiANCj4gCVdoZW4gYSB3YXRjaCBpcyBmaXJzdCBzZXQgdXAgaXQgaXMgdHJpZ2dlcmVkIG9uY2Ug
c3RyYWlnaHQNCj4gCWF3YXksIHdpdGggPHBhdGg+IGVxdWFsIHRvIDx3cGF0aD4uICBXYXRjaGVz
IG1heSBiZSB0cmlnZ2VyZWQNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQoNCknigJltIG5vdCBh
biBFbmdsaXNoIG5hdGl2ZSBzcGVha2VyIHNvIGFwb2xvZ2llcyBpZiB0aGVyZSBpcyBubyBtaXN0
YWtlLg0KDQpXaXRoIHRoYXQgZml4ZWQgKGlmIGl04oCZcyB3cm9uZyk6DQoNClJldmlld2VkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCkNoZWVycywNCkx1Y2EN
Cg0K

