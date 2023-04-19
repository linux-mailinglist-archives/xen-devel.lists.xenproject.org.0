Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7A6E73C6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523192.813016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp23X-0004ke-4s; Wed, 19 Apr 2023 07:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523192.813016; Wed, 19 Apr 2023 07:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp23X-0004i4-26; Wed, 19 Apr 2023 07:16:43 +0000
Received: by outflank-mailman (input) for mailman id 523192;
 Wed, 19 Apr 2023 07:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pp23V-00048g-Tn
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:16:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe02::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c521b5-de82-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 09:16:41 +0200 (CEST)
Received: from DBBPR09CA0025.eurprd09.prod.outlook.com (2603:10a6:10:d4::13)
 by DB5PR08MB10115.eurprd08.prod.outlook.com (2603:10a6:10:4a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 07:16:34 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::a5) by DBBPR09CA0025.outlook.office365.com
 (2603:10a6:10:d4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 07:16:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 07:16:34 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 19 Apr 2023 07:16:34 +0000
Received: from 5acadf1ab1e9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EBDE0E92-F75B-4569-85DB-C8938004437E.1; 
 Wed, 19 Apr 2023 07:16:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5acadf1ab1e9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:16:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6499.eurprd08.prod.outlook.com (2603:10a6:20b:317::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 07:16:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:16:21 +0000
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
X-Inumbo-ID: 21c521b5-de82-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL61DGg9KUlQhzPgLOsxXQAgFBDQneW30RVqjM8Jgbs=;
 b=j/wQadt+gLhIeizhYoLDITuYX3SG5lUUsNNEaiPp9a+rbXzBgh8k9S114eLK2hoKaPzBRZiIgrOgTcDXxJ0GBIIBbI0ucFFtoTY2SgajxsfqlQFi9kMDnWWvrxs36h0cKwx9L6sjKxUNEErKqGbsXRUZoICsYzCarMC5EMmfx9A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8aa47bec2dbdabbf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT+RJp+ljG6WU9YG8g/xddlj+X+KuVXiFZWSgYU6V0x4+AISXnsUaNcZte8GenOScAjqcGKFNsoqD+H1NYpMm3XuzdMTFdWBu7uJTtXNJcTYUo5FYx3Ejk8N0E4c3zlnjcGKEcsLSrhKGefgnWa1tsORquUjVh4HhnrBSSF8dhGS7fQBkNOQ/9HJy/8S5FYx4b9qdWdDhLYzZSwN8p24PCuzHKHvPtvglTJEavFcJkxPahpGV/ncaMiq7XWCdPumKSsxS6994vuhR4dhGlW9R3UguWQcCY6lEk2vOV8JKKDGhCdu2KnEzFm7HmE9tMB8YSm2BNgHRdEFS3Eg3lZ7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HL61DGg9KUlQhzPgLOsxXQAgFBDQneW30RVqjM8Jgbs=;
 b=nUAFUDIdIsIPlzCKVNZe6uqxotl6YYGW0dfnr4YlvqJmg/ldh5DmlNL3f9wymInNBGcLlqcRcGpveZW8lPtKNpD5sdKPSsw2BJJHprHzGOiBC1pkExD+84EV3sShWm8Segk3W3alhVXeQJJdQJc5fMpnVm2VsEpthUlslBJr+g20gGeEPOXH6jRe35HlGImDvmmh7tGXq/ey+rMXPjVpkxTcuHata7lH0Q4nn2KdTkQi2s0sWG17b1Tbknsljw+8IYygMLRK40lKYRBl7viHBbEC7hGy+j0CzhJdC18Xh+cCRhOLh8Zkt5151pfDIDUHiXNtQW27QuE7G5ok8YVvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL61DGg9KUlQhzPgLOsxXQAgFBDQneW30RVqjM8Jgbs=;
 b=j/wQadt+gLhIeizhYoLDITuYX3SG5lUUsNNEaiPp9a+rbXzBgh8k9S114eLK2hoKaPzBRZiIgrOgTcDXxJ0GBIIBbI0ucFFtoTY2SgajxsfqlQFi9kMDnWWvrxs36h0cKwx9L6sjKxUNEErKqGbsXRUZoICsYzCarMC5EMmfx9A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to the
 changelog for Arm
Thread-Topic: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to
 the changelog for Arm
Thread-Index: AQHZbSQvB461HU2dmk2buv9fQooVPa8xECsAgAEx3gCAAAFQAA==
Date: Wed, 19 Apr 2023 07:16:21 +0000
Message-ID: <3C0380BC-EC6F-4C86-AB7F-A87DEE843AA0@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-13-luca.fancellu@arm.com>
 <20BBA7B1-AF5B-49D0-BA79-17B90893C3CC@arm.com>
 <DEE57E48-1ADB-447B-90FB-0AC559B936F7@arm.com>
In-Reply-To: <DEE57E48-1ADB-447B-90FB-0AC559B936F7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB6499:EE_|DBAEUR03FT051:EE_|DB5PR08MB10115:EE_
X-MS-Office365-Filtering-Correlation-Id: 72527751-e3ee-4dcd-f565-08db40a60201
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bx5kgNmdFBwoDPo6KnL1APn0VL1rl7aD9KAzY3IEIo2aj7UHNe6CIAbSR8oUR1Xlv2eaql2yfiIY4yhwiaM7ohgkujvDwGh0PqWx9saWR5igOG5SkOOTJtFTNCvHn3iH3qdoL0n+khsM79UlOd3MC1f6QCSuPGdTlhcpWMv9/TiTcEOGZb4x/RN+Kx0SkQTh1dGnvuZqAT63dQg3R+EGS5/PGCCRiypaJno0aa6MoKJk0dCCiijmcOaxvOo5VnN7ZO9YrJM7wpT/DwjVLhmzaFsDdVjKKVd3xTjCcbSf98YvNVg86ZYjSkIuFWZl1wYy6OAVjdygQAiBCCARtAY2q0pCflcPiMfj0MOuOiI6SL2SVZ2nASYIrDHR2VHAMYTemD1sfvVvnMFcqSYYLE0hIX7hhJ12E7pxO2gmwXySviF/cZ9BdH+NUQ90NLxulLUcj29b95TC6wCzV602R02TRHVGzpc6oJVSy9d7zXG3Ez1cSRHxQF4NQqbwwOkQ7PbSSfI7XBnMvDjRvcNRqhePTaM+bE9rLmiSCaH3xwIwbdP0t+l6MeW1b421wVCO7Qp8+ttIQahV461BFWPnZif+tAf+CCGF0V9ASMTMJ9TLoWa8nnPt9bJWE3DgahFpcKxDQ2N993dBQAz07V+DP/WjMH4WQUfVvZZLoQLbNfpEZwof913aaoyyyd4kd3rqlCxEmrARZwQlswLf44BLRfc2Kew3LNooOyNUixFFbV8zWJk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(38070700005)(4001150100001)(2906002)(8676002)(8936002)(6862004)(38100700002)(5660300002)(36756003)(33656002)(86362001)(6486002)(71200400001)(6512007)(6506007)(37006003)(54906003)(6636002)(478600001)(2616005)(83380400001)(53546011)(66946007)(186003)(76116006)(91956017)(316002)(41300700001)(122000001)(66556008)(66476007)(64756008)(66446008)(4326008)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4387C3BB6B94942B6F544BD347644A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc6fc68a-d3ef-4a4b-ae90-08db40a5f9ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t7x/sM8FRVx2igJZnRFGLBi6HJmZMVI170uMFj+SqsY/vRL/9rdDNqbM99f3W15L5plYpmld2SBm/btHhliTEvBWGeTpR6EgnIvE5PVK6y5gTXlFWyg3lRR6PLAxivHtVOsErjTRwVYiGLqAFBhKxkt4yWYHfVipRhv9HT2P8DYDPoUNdibnNd1ppmeAjTObkQcD2evTy6V058zd/Ke4TsCZUyVXDQu8NnThCZLRB4OOo6DL/6S8PBRLPzkFmVSm5pDvb/jUew+8p2Y89Y3buSocJHpVzAzMd7ATKF+oVbJ85kZDUnCZbZ4vVWcf1BhAY2g+8mMrmdETnol2dXB4ta/WDuKUBFns59/hZiJQ+AKYPUndy/XucqxquXDzZcl2LYj9mJn4XiYXRzqxHv0VYaNvfOlp05mERMQxZPNj8V6S/QJR+a3WgKJPG0bhPviFYcRY97+9qcIcG96Ro4Ow8/jxu8DOgy0TJURfmyfBNWuWuclEGiRCE41AXp+8+YfvrmTbAAURrH5X4BGFguo/cTt5UWmjQqlglchn0M0B8duKIbrQGdcQokZY+ArGwA3poL62KGwBsgZWo7vQJVOnT0LN8edw1clvTjTRpq4IsZGPvhKMra7TmY3PfDqw6s8X45F3hcaPA6T7vmyaIwwDkbzko2BDggR9nNL+H63bk9g3GTnYTdzKMttPXIOT6bVN7/8zuYVoR6k2gXChHRnpmLJ0LI2VqCbv5nAMrViumveGsBNfzvtyDDOEzl6DeD1ubDzKg6TQ/7n/1c7nxjmscn25QB5qm2KJYGYJv4CxrOY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39850400004)(451199021)(46966006)(36840700001)(40470700004)(37006003)(478600001)(8936002)(6862004)(8676002)(316002)(82740400003)(41300700001)(6636002)(4326008)(70586007)(70206006)(40480700001)(81166007)(54906003)(356005)(186003)(40460700003)(4001150100001)(2906002)(53546011)(6512007)(36756003)(26005)(83380400001)(6506007)(86362001)(336012)(47076005)(82310400005)(33656002)(2616005)(5660300002)(36860700001)(6486002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:16:34.5332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72527751-e3ee-4dcd-f565-08db40a60201
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10115

SGkgTHVjYSwNCg0KPiBPbiAxOSBBcHIgMjAyMywgYXQgMDk6MTEsIEx1Y2EgRmFuY2VsbHUgPEx1
Y2EuRmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAxOCBBcHIgMjAy
MywgYXQgMTM6NTYsIEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4g
d3JvdGU6DQo+PiANCj4+IEhpIEx1Y2EsDQo+PiANCj4+PiBPbiAxMiBBcHIgMjAyMywgYXQgMTE6
NDksIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+Pj4gDQo+
Pj4gQXJtIG5vdyBjYW4gdXNlIHRoZSAiZG9tMD0iIFhlbiBjb21tYW5kIGxpbmUgb3B0aW9uIGFu
ZCB0aGUgc3VwcG9ydA0KPj4+IGZvciBndWVzdHMgcnVubmluZyBTVkUgaW5zdHJ1Y3Rpb25zIGlz
IGFkZGVkLCBwdXQgZW50cmllcyBpbiB0aGUNCj4+PiBjaGFuZ2Vsb2cuDQo+Pj4gDQo+Pj4gU2ln
bmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4+IC0t
LQ0KPj4+IENoYW5nZXMgZnJvbSB2NDoNCj4+PiAtIE5vIGNoYW5nZXMNCj4+PiBDaGFuZ2UgZnJv
bSB2MzoNCj4+PiAtIG5ldyBwYXRjaA0KPj4+IC0tLQ0KPj4+IENIQU5HRUxPRy5tZCB8IDUgKysr
KysNCj4+PiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+Pj4gDQo+Pj4gZGlmZiAt
LWdpdCBhL0NIQU5HRUxPRy5tZCBiL0NIQU5HRUxPRy5tZA0KPj4+IGluZGV4IGM5NzhjZmQ5YjY4
Zi4uYTI0OTUxNjAzMzU5IDEwMDY0NA0KPj4+IC0tLSBhL0NIQU5HRUxPRy5tZA0KPj4+ICsrKyBi
L0NIQU5HRUxPRy5tZA0KPj4+IEBAIC02LDYgKzYsMTAgQEAgVGhlIGZvcm1hdCBpcyBiYXNlZCBv
biBbS2VlcCBhIENoYW5nZWxvZ10oaHR0cHM6Ly9rZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAv
KQ0KPj4+IA0KPj4+ICMjIFt1bnN0YWJsZSBVTlJFTEVBU0VEXShodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXNob3J0bG9nO2g9c3RhZ2luZykgLSBUQkQNCj4+PiAN
Cj4+PiArIyMjIENoYW5nZWQNCj4+PiArLSBUaGUgImRvbTAiIG9wdGlvbiBpcyBub3cgc3VwcG9y
dGVkIG9uIEFybSBhbmQgInN2ZT0iIHN1Yi1vcHRpb24gY2FuIGJlIHVzZWQNCj4+PiArICB0byBl
bmFibGUgZG9tMCBndWVzdCB0byB1c2UgU1ZFL1NWRTIgaW5zdHJ1Y3Rpb25zLg0KPj4+ICsNCj4+
PiAjIyMgQWRkZWQNCj4+PiAtIE9uIHg4Niwgc3VwcG9ydCBmb3IgZmVhdHVyZXMgbmV3IGluIElu
dGVsIFNhcHBoaXJlIFJhcGlkcyBDUFVzOg0KPj4+ICAtIFBLUyAoUHJvdGVjdGlvbiBLZXkgU3Vw
ZXJ2aXNvcikgYXZhaWxhYmxlIHRvIEhWTS9QVkggZ3Vlc3RzLg0KPj4+IEBAIC0xNCw2ICsxOCw3
IEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2Vl
cGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+PiAgLSBCdXMtbG9jayBkZXRlY3Rpb24sIHVz
ZWQgYnkgWGVuIHRvIG1pdGlnYXRlIChieSByYXRlLWxpbWl0aW5nKSB0aGUgc3lzdGVtDQo+Pj4g
ICAgd2lkZSBpbXBhY3Qgb2YgYSBndWVzdCBtaXN1c2luZyBhdG9taWMgaW5zdHJ1Y3Rpb25zLg0K
Pj4+IC0geGwvbGlieGwgY2FuIGN1c3RvbWl6ZSBTTUJJT1Mgc3RyaW5ncyBmb3IgSFZNIGd1ZXN0
cy4NCj4+PiArIC0gT24gQXJtLCBYZW4gc3VwcG9ydHMgZ3Vlc3RzIHJ1bm5pbmcgU1ZFL1NWRTIg
aW5zdHJ1Y3Rpb25zLg0KPj4gDQo+PiBNaWdodCBiZSBhIGdvb2QgaWRlYSB0byBtZW50aW9uIHRo
YXQgdGhpcyBpcyBhIHRlY2ggcHJldmlldyA/DQo+IA0KPiBTdXJlIEnigJlsbCBtZW50aW9uIHRo
YXQsIGlzIHRoZXJlIHNvbWV0aGluZyBpbiBwYXJ0aWN1bGFyIHRoYXQgbmVlZHMgdG8gYmUgZG9u
ZSBvciBpcyBpdCBlbm91Z2ggdG8gc2F5IHRoYXQgaGVyZT8NCg0KSXQgaXMgY2xlYXJlciBpIHRo
aW5rIGlmIHlvdSBtZW50aW9uIGhlcmUgdGhhdCBpdCBpcyBhIHRlY2ggcHJldmlldy4NCg0KRm9y
IHRoZSByZXN0IGl0IG11c3QgYmUgbGlzdGVkIGFzIFVOU1VQUE9SVEVEIGluIEtjb25maWcgYW5k
IFRlY2ggUHJldmlldyBzdGF0ZSBtdXN0IGJlIGFsc28gbWVudGlvbmVkIGluIFNVUFBPUlQubWQu
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0K
Pj4gDQo+Pj4gDQo+Pj4gIyMgWzQuMTcuMF0oaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPXhlbi5naXQ7YT1zaG9ydGxvZztoPVJFTEVBU0UtNC4xNy4wKSAtIDIwMjItMTItMTINCj4+
PiANCj4+PiAtLQ0KPj4+IDIuMzQuMQ0KDQoNCg==

