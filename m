Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2A715EBC
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 14:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541145.843582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3yFz-0006ZK-Vd; Tue, 30 May 2023 12:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541145.843582; Tue, 30 May 2023 12:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3yFz-0006W8-Sm; Tue, 30 May 2023 12:15:19 +0000
Received: by outflank-mailman (input) for mailman id 541145;
 Tue, 30 May 2023 12:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=478C=BT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q3yFy-0006UI-12
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 12:15:18 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe16::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2750e74-fee3-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 14:15:15 +0200 (CEST)
Received: from DB6P18901CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::30)
 by PR3PR08MB5722.eurprd08.prod.outlook.com (2603:10a6:102:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 12:15:09 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::d0) by DB6P18901CA0020.outlook.office365.com
 (2603:10a6:4:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22 via Frontend
 Transport; Tue, 30 May 2023 12:15:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 12:15:09 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Tue, 30 May 2023 12:15:09 +0000
Received: from cacd00489d64.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7176F53-09E0-4023-B09D-99E8606F94A0.1; 
 Tue, 30 May 2023 12:15:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cacd00489d64.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 May 2023 12:15:02 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Tue, 30 May
 2023 12:14:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::52ec:40fa:1d66:7a1b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::52ec:40fa:1d66:7a1b%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 12:14:56 +0000
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
X-Inumbo-ID: a2750e74-fee3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khKxWV6/1WPbI++MA1oOZPouL9bJ2V5LBAoo5rhtt+Y=;
 b=9sf9yPG6czyscv8diU75KeoglAIdggDTcyJyswzWGpTO5GeDGwtkYQPiF7Mc7nClYA7+iBLEl9/t1YKVjDNJC6r16DibMsPwbJ+u5d49sBAR2+Z7+yNsrP0ITdNYyWZdRTT6DNhaan3GQcLx1VKrj/epwnUxjsQ3J3qZ2fC8B2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23d7990802d54ccb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+8CeIlpyn0JlKF3M8ScF62PFjnwWJKHKIA9YbOTBepKSmNSDiVYZBQXePtPqjcPCWTomXOkS7TUthTxjl7gbvBaCWBxdSUByF1vz3+ZNPPrdPvQpfG8Lnvkc9C8YLNzKspEQV3LpgbBUYMpFn5/dMrCtjrJ1i9oKb48GjugGO6PktQdLqN8atFuYQgbSDygZMtPJLlR2lTQiWLSAtPeC0dtxSGnITYF1FkrTPD2h4UNUjgCs1XL3Cyrv/A9jrqT/5nUaZpfWUnRQ52so6nfjpgJhHF+I03n7HfsIzz710R1eaunuWa2v/9evU1adB4REtkG8kOv308jxYFdbu8HFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khKxWV6/1WPbI++MA1oOZPouL9bJ2V5LBAoo5rhtt+Y=;
 b=FooT5WbCQzsf0IyeuaEOFSw7kmQIokBKRrKXfff8ItB6VZPcqmgs5McPFTMJ5gUMJQdK3DPFdFnhyoF75GlxiHCyfopJZ7MLc5bO/Ljcak7MMBf+NEruQ335I830ZL+4sijGgcVACl46csg0jY27yUsCHBt4XkIuGGfc/H1pxMpoI42QUYWd/hlORsCuXVSk11oGxhTp8GgGv1iVKpVlcOAwct4/AnNk/a9vBvk83IQZllvDlo+je6d1EQO0OfwuXJdtLCDKrZqN78yTsBPs874cYM2/kTqFg1P017GU3SwA9UcKD294WuYOXAQHaDdcsgTg90UXOKOwTWSDPGpfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khKxWV6/1WPbI++MA1oOZPouL9bJ2V5LBAoo5rhtt+Y=;
 b=9sf9yPG6czyscv8diU75KeoglAIdggDTcyJyswzWGpTO5GeDGwtkYQPiF7Mc7nClYA7+iBLEl9/t1YKVjDNJC6r16DibMsPwbJ+u5d49sBAR2+Z7+yNsrP0ITdNYyWZdRTT6DNhaan3GQcLx1VKrj/epwnUxjsQ3J3qZ2fC8B2w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Thread-Topic: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Thread-Index: AQHZjZUfS+Hth9ncdEKi1WC1jlJ0EK9pLTuAgAl2xACAACF6gA==
Date: Tue, 30 May 2023 12:14:56 +0000
Message-ID: <8ED9FBA6-81E8-48F6-A641-3C19E3E870A2@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-14-anthony.perard@citrix.com>
 <35D40E55-2D93-431A-8B16-FCFEBBDA25B1@arm.com>
 <62d42514-25d3-57f1-f061-0bde197a995b@suse.com>
In-Reply-To: <62d42514-25d3-57f1-f061-0bde197a995b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM0PR08MB5506:EE_|DBAEUR03FT033:EE_|PR3PR08MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7789f9-e75c-460c-1d74-08db610782ef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ok9hhIu6bsfjzSNZbH4n/gWrLU+IFHEswl189Hk6eePFyP/AVWRNLRteOzJ1W8NEfM1+/4vr+J/J34Q1TMUOOHkOJJ+p+IA/825ryxPBt5ltnQUml4EdHzFKc13sIzsG3MnNsUaDjY6bd1WB2A4FPJ1FOJvBn+W5djJC1QF8nKF956gXyirlIu9jdyn9I5GB701uZD5QsUBP4AawWQrJbiayxZ4YCB/qgi/HLIdzOMne6Q94RbpLZfyiASJS3W9tWwG/Hnu33OLHT4UoaO6AUmE68QAHMlOmi6VDXJt/sW5n1EkJ8d8VUxEMPrrCM6WfL1cv2F1Gd/ILJGnJGf2mDEP9wE6IE7FDHIlnncW7YbGXKporjTTT8spb9uF2/lxFTVhZpoK4QR0dO3imVpuom1hi1f8nE8e52+pqEuCJ71d2KlDyWadlSeyXKG/1BvCU9JPtbdNnwlWWu+rz4lxinuX1UbuifH168XNKEMrLGLyjAFnjRd6Qt3f3LDJBxWJ5xppeFRr6s9Oxs0cSq8MmCff9KCqyCEdYNDrczaLEV1qO8XlARNi8NP2bluAiCOWpjePV4OyzCI1sqtIsW+JwGCrqiVc0Y+gnHBPHp3qtfRt1Qsdi9qVIJCSBM1iRthZPIAS8rGxcQcybzXcMD43sIg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(33656002)(186003)(26005)(53546011)(6506007)(6486002)(6512007)(316002)(71200400001)(2906002)(5660300002)(41300700001)(36756003)(8936002)(8676002)(478600001)(122000001)(38100700002)(54906003)(6916009)(4326008)(86362001)(91956017)(38070700005)(64756008)(66946007)(66446008)(2616005)(66476007)(83380400001)(76116006)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2AD4F1AC6862A4E85A4FEAB05D64283@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5506
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9cc55084-f79f-4213-6c21-08db61077b91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vUOw/xkwIf1XqHmSffGKYS2xAPx1oK5M9V51Wp2kaXS5KzsS9zomQ0WVFr2VBayq3i6D8dRZBx9MWiUHcpLDkMccd/zm/jZ0FfNY0RSTidCnOvYxkrGiDn0k0GuLmvbVTaOJk45Uv4XB2Q1802raF8TQT+uRUsM91olhogmokF2egPGxez4qO9BdKZZm0omiQKwuj3m2lInhT8oZM7EMIFSE1/iRPlZkp0ryS6MlYMX47NX3j3JZAC2oGRatI5s36Jh0ALjbniiQCnsTyWa+EK6830ms/c82CFPJYsrNN+3n0GGnHgKjXi+xGsQcHlhkBj6Ds55YmyCffXfh2XfOmvRCgag58fmnasRdzqsiAr1jBJVVveUUnik5KqIohQ1IaCJEdqz+avSnGnEIyXB+fRjy1VU0PdAEeBtInEETrT/puzNvjOwwFPX5UzVMTHK04xH08cxYqvmzPURFDpe0EqW16b04LJ6wV3pR2RaCxRAxXchn7jULiboaNVjky8sO0VSAERTdc1pY/S79CiF5izYysDVE9GPLoYcwwPZrr08Dm/++2AIvZmc0NL09endsFqTRlRUIKLH8eZoNRUCJKsQRPCWK99TxOMYS1UUeW93IuBeTMle2JX8cOkyEiu9pk/wwoUi0Zvhq046Qlr6LRyG+NCCB5bFsadWO3xQJSV7e7temh/zm13u7/li7iT4BF0Z9KnwYCE4HR/QowdrTqQZXlyk6S38L4WymQ6HO2BQdHXWCCceQxvnaZXAv8Mo2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(6486002)(478600001)(54906003)(83380400001)(2616005)(47076005)(336012)(40480700001)(40460700003)(36860700001)(86362001)(33656002)(36756003)(82310400005)(53546011)(6512007)(6506007)(107886003)(2906002)(186003)(26005)(82740400003)(356005)(81166007)(4326008)(70206006)(8936002)(70586007)(316002)(8676002)(5660300002)(6862004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 12:15:09.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7789f9-e75c-460c-1d74-08db610782ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5722

DQoNCj4gT24gMzAgTWF5IDIwMjMsIGF0IDExOjE0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDUuMjAyMyAxMTo0MywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMjMgTWF5IDIwMjMsIGF0IDE3OjM4LCBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gQ0ZMQUdT
IGlzIGp1c3QgZnJvbSBDb25maWcubWssIGluc3RlYWQgdXNlIHRoZSBmbGFncyB1c2VkIHRvIGJ1
aWxkDQo+Pj4gWGVuLg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IA0KPj4+IE5vdGVzOg0KPj4+
ICAgSSBkb24ndCBrbm93IGlmIENGTEFHUyBpcyBldmVuIHVzZWZ1bCB0aGVyZSwganVzdCAtLXZl
cnNpb24gd2l0aG91dCB0aGUNCj4+PiAgIGZsYWdzIG1pZ2h0IHByb2R1Y2UgdGhlIHNhbWUgcmVz
dWx0Lg0KPj4+IA0KPj4+IHhlbi9idWlsZC5tayB8IDIgKy0NCj4+PiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEveGVu
L2J1aWxkLm1rIGIveGVuL2J1aWxkLm1rDQo+Pj4gaW5kZXggZTJhNzhhYTgwNi4uZDQ2OGJiNmUy
NiAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYnVpbGQubWsNCj4+PiArKysgYi94ZW4vYnVpbGQubWsN
Cj4+PiBAQCAtMjMsNyArMjMsNyBAQCBkZWZpbmUgY21kX2NvbXBpbGUuaA0KPj4+ICAgLWUgJ3Mv
QEB3aG9hbWlAQC8kKFhFTl9XSE9BTUkpL2cnIFwNCj4+PiAgIC1lICdzL0BAZG9tYWluQEAvJChY
RU5fRE9NQUlOKS9nJyBcDQo+Pj4gICAtZSAncy9AQGhvc3RuYW1lQEAvJChYRU5fQlVJTERfSE9T
VCkvZycgXA0KPj4+IC0gICAgLWUgJ3MhQEBjb21waWxlckBAISQoc2hlbGwgJChDQykgJChDRkxB
R1MpIC0tdmVyc2lvbiAyPiYxIHwgaGVhZCAtMSkhZycgXA0KPj4+ICsgICAgLWUgJ3MhQEBjb21w
aWxlckBAISQoc2hlbGwgJChDQykgJChYRU5fQ0ZMQUdTKSAtLXZlcnNpb24gMj4mMSB8IGhlYWQg
LTEpIWcnIFwNCj4+PiAgIC1lICdzL0BAdmVyc2lvbkBALyQoWEVOX1ZFUlNJT04pL2cnIFwNCj4+
PiAgIC1lICdzL0BAc3VidmVyc2lvbkBALyQoWEVOX1NVQlZFUlNJT04pL2cnIFwNCj4+PiAgIC1l
ICdzL0BAZXh0cmF2ZXJzaW9uQEAvJChYRU5fRVhUUkFWRVJTSU9OKS9nJyBcDQo+Pj4gLS0gDQo+
Pj4gQW50aG9ueSBQRVJBUkQNCj4+PiANCj4+PiANCj4+IA0KPj4gWWVzIEkgdGhpbmsgQW5kcmV3
IGlzIHJpZ2h0LCBzbyBJIGd1ZXNzICQoWEVOX0NGTEFHUykgY2FuIGJlIGRyb3BwZWQ/DQo+PiAN
Cj4+IFJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+
PiBUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IA0K
Pj4gSeKAmXZlIHRlc3RlZCB0aGlzIHBhdGNoIHdpdGggYW5kIHdpdGhvdXQgdGhlICQoWEVOX0NG
TEFHUyksIHNvIGlmIHlvdSBkcm9wIGl0IHlvdSBjYW4NCj4+IHJldGFpbiBteSByLWJ5IGlmIHlv
dSB3YW50Lg0KPiANCj4gSSdtIHNvcnJ5LCBJIGRpZG4ndCBsb29rIGJhY2sgaGVyZSB0byBzcG90
IHRoaXMgZXh0cmEgc2VudGVuY2UgYmVmb3JlDQo+IGNvbW1pdHRpbmcgdGhlIGVkaXRlZCBwYXRj
aCwgd2hpY2ggYXMgYSByZXN1bHQgSSd2ZSBub3cgcHV0IGluIHdpdGhvdXQNCj4geW91ciB0YWdz
Lg0KPiANCg0KTm8gcHJvYmxlbSENCg0KPiBKYW4NCg0K

