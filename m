Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC87106DE
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539336.840111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q261X-000711-Qt; Thu, 25 May 2023 08:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539336.840111; Thu, 25 May 2023 08:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q261X-0006yX-Mc; Thu, 25 May 2023 08:08:39 +0000
Received: by outflank-mailman (input) for mailman id 539336;
 Thu, 25 May 2023 08:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q261V-0006xv-I5
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:08:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 575cb0d9-fad3-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:08:33 +0200 (CEST)
Received: from AM6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::32)
 by DU2PR08MB7344.eurprd08.prod.outlook.com (2603:10a6:10:2f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 08:08:30 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::49) by AM6P195CA0019.outlook.office365.com
 (2603:10a6:209:81::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 08:08:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 08:08:29 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 25 May 2023 08:08:29 +0000
Received: from c428a9cf5fc2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B86A06AF-D8EC-449F-A5F9-58F0CA247007.1; 
 Thu, 25 May 2023 08:08:22 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c428a9cf5fc2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 08:08:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8309.eurprd08.prod.outlook.com (2603:10a6:20b:554::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 08:08:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 08:08:20 +0000
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
X-Inumbo-ID: 575cb0d9-fad3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au+jPYUDDeqPC+Ot0IjQKqfRxPc9X6pYFIZFJsySTNM=;
 b=OKhM/0jk5YZsofWIoJRln5Yw9nFJFjepxlNjqKsp33SMm9zDqFJTnrcO3a+vXhY2l5HcTJ34imyEyXjEI0TFFedSw4PQrEp9TE3wERx5VSDnCZk8k5WKbmlIpHA5hRO+bnWQSvieQu7Ws0n4+R2Vvem/QWkdmbOMAWTsuxGp1OQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1dc515e75afbecf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goYzyirzxaKEnkhdVsw3cEriToVX1wHCfZ9CLbUGR4LTELaTgp0PTNq+JhwKCViTLOG3UOCOKBRjIurROIyD6PADuoLWCZYC7orGbn+35Ar8yClzt3vNpBx8Zy+Yq/IiQMiFiJbLPmOR/QXfh9wSbprmICVkFBFIDOrnekrUZ/4fe5w8flVAQiZV9Fd/qLqFWUqh2N5D+2Cs25ktHrgGWQQM9ZCX0YH/ZQnTNAtX7lBjkezjEx1AMNmqkWDxLpYnbD1fMdaWaek4HF2UjbaJ9CCCfT/SMB5HMvBSVBI1M5eZ7RHYm9ZULB191bFIoOiee0jriLAN/juB7ixg8OO7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au+jPYUDDeqPC+Ot0IjQKqfRxPc9X6pYFIZFJsySTNM=;
 b=Dx8NrbdNvJZHxJQJA3WtTW2o3Zp9SEoAdyo4tTO6We+sqcqlZpVLW0Ct3KVucRyRXmeUg/JLtUoGpNcQk+QZv1cjkgz2lyUQKxLtnwjkI+Gd00KgtbbG83JwlVe4eMK9V0Ap0SJYnctlxFTmgzVYnYFAbZN9CMrU3MSuyeMpLOTvqCEgl1eSBcILMGProDAetvjVRS+GUFAg3gUFbWsKkkqqLdHfZsBFQloBh/U2XRL8FAdxcxFBNu8weuazkuGV0gXc12BUAkMojLGFD5vN+tiY9BEjVvUN0hiXVqvz2cHTYOMmO1bOyALn6elgjOb5a7qUPWWdEefPw0R+09L7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au+jPYUDDeqPC+Ot0IjQKqfRxPc9X6pYFIZFJsySTNM=;
 b=OKhM/0jk5YZsofWIoJRln5Yw9nFJFjepxlNjqKsp33SMm9zDqFJTnrcO3a+vXhY2l5HcTJ34imyEyXjEI0TFFedSw4PQrEp9TE3wERx5VSDnCZk8k5WKbmlIpHA5hRO+bnWQSvieQu7Ws0n4+R2Vvem/QWkdmbOMAWTsuxGp1OQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
Thread-Topic: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
Thread-Index: AQHZijbbQbnxRobwCkSJohEa6eKRVa9hY3kAgAjV3YCAAHJTAA==
Date: Thu, 25 May 2023 08:08:20 +0000
Message-ID: <A3B0B9E6-1770-4159-8A92-6A213FD9BBBF@arm.com>
References: <20230519094613.2134153-1-luca.fancellu@arm.com>
 <20230519094613.2134153-3-luca.fancellu@arm.com>
 <CA6576E0-E49F-4E36-9363-CEB23B508DCE@arm.com>
 <alpine.DEB.2.22.394.2305241818410.44000@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2305241818410.44000@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8309:EE_|AM7EUR03FT052:EE_|DU2PR08MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: e58b2a48-f1f0-4af4-3a5a-08db5cf739c9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3b0S//1u7s7hc3bvw9x7CzyEdHZVvc+2Cgk/QilGup/0w0SVDtF1ciAV4b1F4vsivdVAT7MB6RSBsNX9JsVl275bNkiqjY1ttd6o52RRWhF/Zdjor5SLvlKQWvw1l+ej17zYIoSEtzW6XdVForYASFDX/H58KB6sxXQPctY8LJLPUpmCfNvFsJbf1+qYQh0d9C3iPE2z46/Jvw90N8JVQ0dce1oiKIzcWu5YzuMF+WCjWNnT1mMdBDAoE+XtuwIN/zcSQE4Xhzi5VUP26y+R2N8Joo5YiuiStE4NhLdy7D3uijk8HHsoZdRgQYFJJGWj2QpQl0NGfZOs6r7gfK+MNNsPBKsvHJnQxZVY4lfEMQJicqlSMJq3yh7KVr8k2pwxs53kT6BCCWnwTTk1HErlAsN7YMw4Zdy9taGTW1E+G2GnepWjf8CLmRdNArZX3e+viN3ZSPBIF2pUfNfbscGjTr3tcOHaj/Cuc3OOVvU282UOpWBbXwyODa0jHZ8e56zllklqiD2TBZO2dE8g0zxave1dFjcS0Vn1qgO8S0n1PmBYoU/oBvpvQxhoxdANIOVcZ+dY/daPiqTh+bOqkGV6NugwemytydjExyHD2z7KymPSw9gn0xuMhr03s3TBHC0RpX7ruB8xHsWytV5opeVYzw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(122000001)(5660300002)(36756003)(33656002)(38100700002)(41300700001)(38070700005)(76116006)(66476007)(64756008)(66556008)(66946007)(66446008)(316002)(6916009)(91956017)(83380400001)(4326008)(71200400001)(478600001)(186003)(8936002)(86362001)(2906002)(8676002)(6512007)(26005)(6486002)(2616005)(6506007)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3AC06F0A8DE794984F40F6B38E155C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8309
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be507f4e-a6fb-4b2f-5e81-08db5cf73458
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+s0Jc+8IqOoAapSWNBxzjtuCr33W350Ga+ouuixWDDB/x3cO8VQLZnICXcmRqvbrdZOtqNgwOkI2g5RJH729Qk/9BiTjW0F6lUZlcEIHalKN1+zn+yDNQK/oqs9ECl+KO4pgqBUdz8DiGXWEhuBGkzobCSIWxjMfe6g92BuyrhfoTQXvQN/SCpaNuFxE0Ffsklbl3XhlvEBCpbx0MtQlgeKJVCtE2qb2jmaxQ8MZ3LM/ntOlLQRUc7RgHBj0lBscGUL18C2v9xLA5P7/82glfR7bCMnXNL8TrJpxKLRDdzo5t+4B4vOfLWko0/WFKKl27GextX5c86M+8uYzUEOfL0468f38Zj0oEae//PYBKqEq9R3o3+zlLTNUkLPFbTcHx5ztm9l8C0lAosxKX8SI3/hlyRpyEYUrfQeCC9QKpDokZ2NeacaOj9uY6nwiaEyBMhQN+3T/GRRPYUptcs/cYqv1PAi2ad26xkd/ib1I+kTABAThVnQaibzGueItXRLe0TDDFU2Z1p6DHHofCCXV2GVG36f9/BL9OM6NmbBdygNzYFO5DikOBLMGxhwKt/qv768NoyVox736iB2Z5thAL4yrL05QJfzMB7leZJAZMh/5MTQp0rcJM56wbYHxsiDRoP5MoSKUA1BHTpNKnab/kXIuHAHJOnEvhdb4sgXhPabaxZTQIoBQyf/gIibBERCME1N/+H+N+h4ZhRbdKNM2hGZVMWGOB4kSdshqIzDo4yWiivEbgV7Kp00rp0R2JLv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(6862004)(8676002)(8936002)(5660300002)(36860700001)(82310400005)(47076005)(186003)(83380400001)(6512007)(26005)(86362001)(2616005)(81166007)(6506007)(356005)(336012)(82740400003)(40460700003)(70586007)(6486002)(41300700001)(40480700001)(70206006)(33656002)(4326008)(316002)(36756003)(478600001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:08:29.8598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e58b2a48-f1f0-4af4-3a5a-08db5cf739c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7344

DQo+Pj4gICAgaWYgYXJncy5vdXQgPT0gInN0ZG91dCI6DQo+Pj4gICAgICAgIGZpbGVfb3V0ID0g
c3lzLnN0ZG91dA0KPj4+ICAgIGVsc2U6DQo+Pj4gQEAgLTYzLDExICs5MCwzNSBAQCBkZWYgbWFp
bihhcmd2KToNCj4+PiAgICAgICAgbmV3X3JlcC5wYXJzZSgpDQo+Pj4gICAgICAgIGRlYnVnLmRl
YnVnX3ByaW50X3BhcnNlZF9yZXBvcnQobmV3X3JlcCkNCj4+PiAgICAgICAgbG9nX2luZm8oIiBb
T0tdIikNCj4+PiAtICAgIGV4Y2VwdCBSZXBvcnRFcnJvciBhcyBlOg0KPj4+ICsgICAgICAgIGRp
ZmZfc291cmNlID0gTm9uZQ0KPj4+ICsgICAgICAgIGlmIGFyZ3MucGF0Y2g6DQo+Pj4gKyAgICAg
ICAgICAgIGRpZmZfc291cmNlID0gb3MucGF0aC5yZWFscGF0aChhcmdzLnBhdGNoKQ0KPj4+ICsg
ICAgICAgIGVsaWYgYXJncy5iYXNlbGluZV9yZXY6DQo+Pj4gKyAgICAgICAgICAgIGdpdF9kaWZm
ID0gaW52b2tlX2NvbW1hbmQoDQo+Pj4gKyAgICAgICAgICAgICAgICAiZ2l0IGRpZmYgLS1naXQt
ZGlyPXt9IC1DIC1DIHt9Li57fSIuZm9ybWF0KHJlcG9fZGlyLA0KPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmdzLmJhc2Vs
aW5lX3JldiwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYXJncy5yZXBvcnRfcmV2KSwNCj4+PiArICAgICAgICAgICAgICAg
IFRydWUsICJFcnJvciBvY2N1cmVkIGludm9raW5nOlxue31cblxue30iDQo+Pj4gKyAgICAgICAg
ICAgICkNCj4+IA0KPj4gSeKAmXZlIG5vdGljZWQgbm93IGFuIGlzc3VlIGhlcmUsIHdoZW4gdXNp
bmcgLS1iYXNlbGluZS1yZXYvLS1yZXBvcnQtcmV2LCB0aGUgZml4IGlzIHRoaXMgb25lOg0KPj4g
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL3NjcmlwdHMvZGlmZi1yZXBvcnQucHkgYi94ZW4vc2NyaXB0
cy9kaWZmLXJlcG9ydC5weQ0KPj4gaW5kZXggZDYwOGUzYTA1YWExLi42MzZmOThmNWVlYmUgMTAw
NzU1DQo+PiAtLS0gYS94ZW4vc2NyaXB0cy9kaWZmLXJlcG9ydC5weQ0KPj4gKysrIGIveGVuL3Nj
cmlwdHMvZGlmZi1yZXBvcnQucHkNCj4+IEBAIC05NSw5ICs5NSw4IEBAIGRlZiBtYWluKGFyZ3Yp
Og0KPj4gICAgICAgICAgICAgZGlmZl9zb3VyY2UgPSBvcy5wYXRoLnJlYWxwYXRoKGFyZ3MucGF0
Y2gpDQo+PiAgICAgICAgIGVsaWYgYXJncy5iYXNlbGluZV9yZXY6DQo+PiAgICAgICAgICAgICBn
aXRfZGlmZiA9IGludm9rZV9jb21tYW5kKA0KPj4gLSAgICAgICAgICAgICAgICAiZ2l0IGRpZmYg
LS1naXQtZGlyPXt9IC1DIC1DIHt9Li57fSIuZm9ybWF0KHJlcG9fZGlyLA0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFyZ3Mu
YmFzZWxpbmVfcmV2LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFyZ3MucmVwb3J0X3JldiksDQo+PiArICAgICAgICAgICAg
ICAgICJnaXQgLS1naXQtZGlyPXt9Ly5naXQgZGlmZiAtQyAtQyB7fS4ue30iDQo+PiArICAgICAg
ICAgICAgICAgIC5mb3JtYXQocmVwb19kaXIsIGFyZ3MuYmFzZWxpbmVfcmV2LCBhcmdzLnJlcG9y
dF9yZXYpLA0KPj4gICAgICAgICAgICAgICAgIFRydWUsICJFcnJvciBvY2N1cmVkIGludm9raW5n
Olxue31cblxue30iDQo+PiAgICAgICAgICAgICApDQo+PiAgICAgICAgICAgICBkaWZmX3NvdXJj
ZSA9IGdpdF9kaWZmLnNwbGl0bGluZXMoa2VlcGVuZHM9VHJ1ZSkNCj4+IA0KPj4gSeKAmWxsIHdh
aXQgZm9yIG90aGVyIGZlZWRiYWNrIG9uIHRoZSBwYXRjaCBiZWZvcmUgc2VuZGluZyBpdCBhZ2Fp
bi4NCj4gDQo+IFdpdGggdGhpcyBjaGFuZ2U6DQo+IA0KPiBBY2tlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBUZXN0ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCg0KVGhhbmsgeW91IFN0ZWZhbm8sDQoN
Ckkgd2lsbCBwdXNoIHRoZSBzZXJpZSB3aXRoIHRoZSBmaXggYW5kIHlvdXIgdGFncw0KDQo=

