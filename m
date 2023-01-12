Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C6667021
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 11:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475976.737920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFv6N-0003Fc-Fh; Thu, 12 Jan 2023 10:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475976.737920; Thu, 12 Jan 2023 10:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFv6N-0003DV-Bt; Thu, 12 Jan 2023 10:46:31 +0000
Received: by outflank-mailman (input) for mailman id 475976;
 Thu, 12 Jan 2023 10:46:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+83i=5J=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pFv6L-0003DP-Rw
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 10:46:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2071.outbound.protection.outlook.com [40.107.15.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da34080-9266-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 11:46:27 +0100 (CET)
Received: from LO4P265CA0241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:350::15)
 by PAXPR08MB7393.eurprd08.prod.outlook.com (2603:10a6:102:2bd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 10:46:19 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:600:350:cafe::f8) by LO4P265CA0241.outlook.office365.com
 (2603:10a6:600:350::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 10:46:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 10:46:18 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Thu, 12 Jan 2023 10:46:18 +0000
Received: from c283985d8fa6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0702FA6-EF12-47B8-B412-95CD15ABFBC7.1; 
 Thu, 12 Jan 2023 10:46:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c283985d8fa6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Jan 2023 10:46:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB7524.eurprd08.prod.outlook.com (2603:10a6:102:26d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 10:46:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 10:46:04 +0000
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
X-Inumbo-ID: 5da34080-9266-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXkVS1Z8dOTT9hU+gAbGeKlrx/wJV4wLt/WInMX7XYY=;
 b=sisxAGioqjjSsVN1zcz+BJI1rAI+5uGKnIEtiHFI9A31/6fZhFVjmT9kX3boy7g5R3RjAwPqpzjhBILVzTE+vW338js3KGp5oYDDUMAf2FaDGmew+uyifJDKCHQedLM9mBw0F8nqrjxJWo2kpBe873vDAPBLj81ifAlbelmDL4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9c38e77585c1013
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H97DUJEcXV4Iyr+exXCyZbxyAaRfOC80P3cboqaSgUHkaB644Tlp/nFxmqWpCx4uKgcRpXd8rS9y793+JA1qZJKlShGVHFxd8qkQ1nmBt+N4I4brzOpDYz7riKv8SPuSQ9ScnvrdnKdCKbWOTZgDpp6umWjCqyAdMOIau4ywi9/27myqm8UJbGjvCzStKb157d6F68zOOtxoo4EIl31YtkPpR1vIkTnwsyhwtIu2QMW+J/nIiBsN0YgBwMnABMWUbWvJ+UTbQrEmF290uZ42Kz6d1aDoUtKfRXYiUN0gmUKnEWU7iAyomfMXYmQ3tXMEZULkvgo06HYhtXftzxDO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXkVS1Z8dOTT9hU+gAbGeKlrx/wJV4wLt/WInMX7XYY=;
 b=dXbPLQNJCP2Bg1cMAtbpvgLYUjZdCRbg8CefUIaO1SUqUj0JCl2E6820UyeDOyQ1rhiY2yeRvuHZurmfC25c+D6z6S7LnRSgVlTT3WWlfpAe5S44gIk2rKfsB/EHndaATc5yXFx0cSDJyr2L8Ro28pal/+QtVmJnQtZqnCgpVe/0TYkeVctMAcPvnZgRW/0WoHGqo2i2bdfVPHKiZHMAbX8AkoBUuPp+ngDoRRsetVU5VKqUDlIQwCB1m1IGipS4T0sSuArjpQcIyAXYDGutsj2sUh9lJ2ln7o0Md6n62TARQ62exfra5VRzrB4WTfYEwYmNwP09HVrpgnVWd6mymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXkVS1Z8dOTT9hU+gAbGeKlrx/wJV4wLt/WInMX7XYY=;
 b=sisxAGioqjjSsVN1zcz+BJI1rAI+5uGKnIEtiHFI9A31/6fZhFVjmT9kX3boy7g5R3RjAwPqpzjhBILVzTE+vW338js3KGp5oYDDUMAf2FaDGmew+uyifJDKCHQedLM9mBw0F8nqrjxJWo2kpBe873vDAPBLj81ifAlbelmDL4Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 1/8] xen/arm: enable SVE extension for Xen
Thread-Topic: [RFC PATCH 1/8] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZJcp25sHFUmTjSUKVOX9zw5fwA66ZdWWAgAElHQA=
Date: Thu, 12 Jan 2023 10:46:04 +0000
Message-ID: <85F9C725-816A-46EE-AD0C-2725AE13F14C@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-2-luca.fancellu@arm.com>
 <e37e5564-e7b9-c9d2-1360-171c014649c7@xen.org>
In-Reply-To: <e37e5564-e7b9-c9d2-1360-171c014649c7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB7524:EE_|AM7EUR03FT034:EE_|PAXPR08MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb03640-3901-45ba-2c47-08daf48a3c94
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2oUBsQEJOXv1uQ1zMVqWcpFVKPyRf3WrxrF1TK2tvc8IpgTmaONbfVpAce3TklaNQa762Z2icjGYWKSL1OUxcl53LawwxP9mdBut2dhmhO4kuADrWk2g+dl3hf65EH6niLvwzXAV0i+nXaYItvXoWHogsyKSEH97ba0n48EPteeN/RRaBUDtkxmRu98Vi6wBlUPrqggOP7SlXZ0ppbdpbl6V3EJ0iAYiwCtbU2gpS7SeQajgjZskYQHT+i+4CkTeD3fc7HxZS79uM0NahkFDFXV3+KmthVkrlloaS1xs/5ZY+CLT9HnLVlpplxxZDCHhV7p+nRk/hmOL4FpbI8HHSVokw4JI0dy7nK4VCZjQ2KAWUp4Mpc3ZiHTkKyNYSr54f5FGdHRDJjpSo2sTuBWfdfMa1cWpzl83ahTlfUXxNQnrW70ArNNsnpSLafWFjsnbux056vpk0VLpYcAueTPDFFCBPCbXS4rUidFdsROcx1OHmHpYkMh+AGsIrdavoUkRSvWmVBGz9EW0q4uoN8DS5aT4aZYmKzg5Cx1TTsq01GtwHR03q9w6hZwtRqTxj0R2QA9F2NmySmRgBtKrwoKu0khxrtvb7Z5e3F/9kj6chK13y+K3TRnW+QFHKnbbyYDAkAqHnGWPF2TuWbPnNhsY2VsrBfLIIsWsZasWdqQM6spBwestC+3H1gpQaXHFUQa5kf+mNn+Imx6/Ri1zt6wsR64Php4m3UYv33hzsUR4r1E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(53546011)(41300700001)(86362001)(6506007)(83380400001)(122000001)(38070700005)(6486002)(26005)(6512007)(8936002)(478600001)(186003)(38100700002)(66946007)(66446008)(91956017)(8676002)(71200400001)(4326008)(5660300002)(66556008)(33656002)(36756003)(64756008)(76116006)(66476007)(6916009)(2906002)(316002)(2616005)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B2465419E64F24A980D173705DB6E7A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7524
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e11201b-7912-4b76-55cd-08daf48a3458
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	be72i6ouA6dmbyuf05p3Wo2iWJEy+oXW3Xd2JMbMWPYCShw6udXDBpiWkjJvKhibH/eWXXJHN1t2OLoqDYEPRi3NlVkYMhtoMmYDDsOyt8iqEZOCjD23dOgOJeS8fYJ5rgUGMvPvA/wEgetQL7/V+BhFukQG23LES/aAGCKr3S3siJfkJg2NmiNKgkqzHHJuPIx6dNpUVSkqXD2/yznvGnC9WxkJJSBSKTVhqA2GowlPUu6SUskrtGaOSKGYnMJc4Eg6yEOMemhzrJQuLn/YnYCTZlXpcfXiQjaMtxpIbh0BRGZhFRqtNh5k3f+DEdrOdlczHp/lPjfgH5JBj4bn/msU3jtliFygQ7rQxNlqYvv4x2y4MdErU12J1+JWpOhmjoUkKyg6QuCCkh3jQc+9wHuoO7yp5RjOXFA9FNphfA9dMT+uU+SCivRI1xQ1eTxOOJskQKm/sx8WlFxGCSAJfFuIxrXaC95QXybTYoj3s8+NPes2e2oGYRTES8rBDi0JuPNzwNHVWpDd8Cc5ii4ErvqWHQG0yjyuDReUsStqgX6y8XOU9PjlKmJrBlTnr5val7WqLCWwndyklv1uU0Vi+tCee7a86DXQiv3tXb1ZNoPfQgiMKaCqFNX7oYXTcbFCEYVm1paFnR8niNKemTKU+VPleQLXzAnq/GeQXtNXnmifdb08dHN1R79yHE0B2xwW0AsCDw0b8pV15sCkAg9ijw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(53546011)(26005)(86362001)(6512007)(40480700001)(186003)(83380400001)(4326008)(8676002)(33656002)(336012)(47076005)(6862004)(70206006)(70586007)(8936002)(36756003)(2616005)(40460700003)(81166007)(5660300002)(2906002)(478600001)(316002)(356005)(54906003)(41300700001)(82310400005)(6506007)(36860700001)(82740400003)(6486002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 10:46:18.4729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb03640-3901-45ba-2c47-08daf48a3c94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7393

DQoNCj4gT24gMTEgSmFuIDIwMjMsIGF0IDE3OjE2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBBcyB0aGlzIGlzIGFuIFJGQywgSSB3
aWxsIGJlIG1vc3RseSBtYWtpbmcgZ2VuZXJhbCBjb21tZW50cy4NCg0KSGkgSnVsaWVuLA0KDQpU
aGFuayB5b3UuDQoNCj4gDQo+IE9uIDExLzAxLzIwMjMgMTQ6MzgsIEx1Y2EgRmFuY2VsbHUgd3Jv
dGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJt
L2RvbWFpbi5jDQo+PiBpbmRleCA5OTU3N2FkYjZjNjkuLjhlYTM4NDNlYThlOCAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFp
bi5jDQo+PiBAQCAtMTgxLDYgKzE4MSw4IEBAIHN0YXRpYyB2b2lkIGN0eHRfc3dpdGNoX3RvKHN0
cnVjdCB2Y3B1ICpuKQ0KPj4gICAgICAvKiBWR0lDICovDQo+PiAgICAgIGdpY19yZXN0b3JlX3N0
YXRlKG4pOw0KPj4gICsgICAgV1JJVEVfU1lTUkVHKG4tPmFyY2guY3B0cl9lbDIsIENQVFJfRUwy
KTsNCj4gDQo+IFNob3VsZG4ndCB0aGlzIG5lZWQgYW4gaXNiKCkgYWZ0ZXJ3YXJkcyBkbyBlbnN1
cmUgdGhhdCBhbnkgcHJldmlvdXNseSB0cmFwcGVkIHdpbGwgYmUgYWNjZXNzaWJsZT8NCg0KWWVz
IHlvdSBhcmUgcmlnaHQsIHdvdWxkIGl0IGJlIG9rIGZvciB5b3UgaWYgSSBtb3ZlIHRoaXMgYmVm
b3JlIGdpY19yZXN0b3JlX3N0YXRlIGJlY2F1c2UgaXQgaW5zaWRlDQpoYXMgYW4gaXNiKCk/IFRo
aXMgdG8gbGltaXQgdGhlIGlzYigpIHVzYWdlLiBJIGNvdWxkIHB1dCBhbHNvIGEgY29tbWVudCB0
byBkb27igJl0IGZvcmdldCBpdC4NCg0KT3RoZXJ3aXNlIEkgd2lsbCBhZGQgdGhlIGJhcnJpZXIu
DQoNCg0KPiANCj4gWy4uLl0NCj4gDQo+PiBAQCAtMTIyLDYgKzEzNyw3IEBAIF9faW5pdGNhbGwo
dXBkYXRlX3NlcnJvcnNfY3B1X2NhcHMpOw0KPj4gICAgdm9pZCBpbml0X3RyYXBzKHZvaWQpDQo+
PiAgew0KPj4gKyAgICByZWdpc3Rlcl90IGNwdHJfYml0cyA9IGdldF9kZWZhdWx0X2NwdHJfZmxh
Z3MoKTsNCj4+ICAgICAgLyoNCj4+ICAgICAgICogU2V0dXAgSHlwIHZlY3RvciBiYXNlLiBOb3Rl
IHRoZXkgbWlnaHQgZ2V0IHVwZGF0ZWQgd2l0aCB0aGUNCj4+ICAgICAgICogYnJhbmNoIHByZWRp
Y3RvciBoYXJkZW5pbmcuDQo+PiBAQCAtMTM1LDE3ICsxNTEsMTUgQEAgdm9pZCBpbml0X3RyYXBz
KHZvaWQpDQo+PiAgICAgIC8qIFRyYXAgQ1AxNSBjMTUgdXNlZCBmb3IgaW1wbGVtZW50YXRpb24g
ZGVmaW5lZCByZWdpc3RlcnMgKi8NCj4+ICAgICAgV1JJVEVfU1lTUkVHKEhTVFJfVCgxNSksIEhT
VFJfRUwyKTsNCj4+ICAtICAgIC8qIFRyYXAgYWxsIGNvcHJvY2Vzc29yIHJlZ2lzdGVycyAoMC0x
MykgZXhjZXB0IGNwMTAgYW5kDQo+PiAtICAgICAqIGNwMTEgZm9yIFZGUC4NCj4+IC0gICAgICoN
Cj4+IC0gICAgICogLyFcIEFsbCBjb3Byb2Nlc3NvcnMgZXhjZXB0IGNwMTAgYW5kIGNwMTEgY2Fu
bm90IGJlIHVzZWQgaW4gWGVuLg0KPj4gLSAgICAgKg0KPj4gLSAgICAgKiBPbiBBUk02NCB0aGUg
VENQeCBiaXRzIHdoaWNoIHdlIHNldCBoZXJlICgwLi45LDEyLDEzKSBhcmUgYWxsDQo+PiAtICAg
ICAqIFJFUzEsIGkuZS4gdGhleSB3b3VsZCB0cmFwIHdoZXRoZXIgd2UgZGlkIHRoaXMgd3JpdGUg
b3Igbm90Lg0KPj4gKyNpZmRlZiBDT05GSUdfQVJNNjRfU1ZFDQo+PiArICAgIC8qDQo+PiArICAg
ICAqIERvbid0IHRyYXAgU1ZFIG5vdywgWGVuIG1pZ2h0IG5lZWQgdG8gYWNjZXNzIFpDUiByZWcg
aW4gY3B1ZmVhdHVyZSBjb2RlLA0KPj4gKyAgICAgKiB0cmFwcGluZyBhZ2FpbiBvciBub3Qgd2ls
bCBiZSBoYW5kbGVkIG9uIHZjcHUgY3JlYXRpb24vc2NoZWR1bGluZyBsYXRlcg0KPj4gICAgICAg
Ki8NCj4gDQo+IEluc3RlYWQgb2YgZW5hYmxlIGJ5IGRlZmF1bHQgYXQgYm9vdCwgY2FuIHdlIHRy
eSB0byBlbmFibGUvZGlzYWJsZSBvbmx5IHdoZW4gdGhpcyBpcyBzdHJpY3RseSBuZWVkZWQ/DQoN
ClllcyB3ZSBjb3VsZCB1bi10cmFwIGluc2lkZSBjb21wdXRlX21heF96Y3IoKSBqdXN0IGJlZm9y
ZSBhY2Nlc3NpbmcgU1ZFIHJlc291cmNlcyBhbmQgdHJhcCBpdA0KYWdhaW4gd2hlbiBmaW5pc2hl
ZC4gV291bGQgaXQgYmUgb2sgZm9yIHlvdSB0aGlzIGFwcHJvYWNoPw0KDQo+IA0KPj4gLSAgICBX
UklURV9TWVNSRUcoKEhDUFRSX0NQX01BU0sgJiB+KEhDUFRSX0NQKDEwKSB8IEhDUFRSX0NQKDEx
KSkpIHwNCj4+IC0gICAgICAgICAgICAgICAgIEhDUFRSX1RUQSB8IEhDUFRSX1RBTSwNCj4+IC0g
ICAgICAgICAgICAgICAgIENQVFJfRUwyKTsNCj4+ICsgICAgY3B0cl9iaXRzICY9IH5IQ1BUUl9D
UCg4KTsNCj4+ICsjZW5kaWYNCj4+ICsNCj4+ICsgICAgV1JJVEVfU1lTUkVHKGNwdHJfYml0cywg
Q1BUUl9FTDIpOw0KPj4gICAgICAgIC8qDQo+PiAgICAgICAqIENvbmZpZ3VyZSBIQ1JfRUwyIHdp
dGggdGhlIGJhcmUgbWluaW11bSB0byBydW4gWGVuIHVudGlsIGEgZ3Vlc3QNCj4gDQo+IENoZWVy
cywNCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

