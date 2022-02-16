Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E24B84B6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273890.469189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGu3-0008U8-Ih; Wed, 16 Feb 2022 09:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273890.469189; Wed, 16 Feb 2022 09:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGu3-0008SI-Fe; Wed, 16 Feb 2022 09:47:15 +0000
Received: by outflank-mailman (input) for mailman id 273890;
 Wed, 16 Feb 2022 09:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXi8=S7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nKGu1-0008SA-LE
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:47:13 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe05::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a2d5fca-8f0d-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 10:47:12 +0100 (CET)
Received: from DB6P18901CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::33)
 by AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 09:47:09 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::28) by DB6P18901CA0023.outlook.office365.com
 (2603:10a6:4:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 09:47:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 09:47:08 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 16 Feb 2022 09:47:08 +0000
Received: from 5253e0bdb9c5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DF72E8D-5DB7-412C-B858-59F46D049AD1.1; 
 Wed, 16 Feb 2022 09:47:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5253e0bdb9c5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 09:47:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB7032.eurprd08.prod.outlook.com (2603:10a6:20b:41e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 09:46:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 09:46:59 +0000
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
X-Inumbo-ID: 6a2d5fca-8f0d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enztSATIE0PNym+Bx0dO33uCIgY6HitJixLacRT1nfQ=;
 b=wXm/Xnfe6UqKBhTeYTeWgni3/zpae7j/LdUwleKPJ0cMwkSoG95VgNJKMsFg83yw1V7FPXMYr3Evz0bhBEhJ8yMh+2iv4OxtmS0Z/Ap4oClCgK7hGV8zcGpFR4MMYvawST8MpxO9L2B4RM5znScoi6IgikLlF0OVT9c6LG0d6bI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: be327a42f7c37701
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrHMiFH3dtrWS8QU1Irw2InPZzengRL2G28XTVEEcQT/le+SD4IYlM3nOrmK758pExR1mjj/fuALxi5DPTmj407J5UAxGACKvtDyt2ohLzL6ws96Ez+72e+Qa0o8NxOR8edD9nfunHjeic9NKiUhzwjT0J56HYhk4wPd9gfhQqPC16UeflgYSHJIm3aHVSwyaG8zHsc2EaYmL/0rhDFFhxWYfV/5/aQ2pZe6Htqt1fzyy5z8DSu7PdL1zoAAqMVfoP+ZbUSc0fIlAkm8X/TjVb5FAS1+Igtrtf1r3bHTDpMvn+BOem05pxbkggKtuo+s/41BFj7zEWARSNtVaxIGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enztSATIE0PNym+Bx0dO33uCIgY6HitJixLacRT1nfQ=;
 b=Jcw5mbp8OgM5+hOodEdFXVmgVsWJeWTutAVuE6Vkj51jUmE+CQKuVU1IqtHV1Vkt2ItYmdVnKaLXAwvoWam4Ki+KisHBRoXgYHUtAhYBpiqPkbwf7lnA6B3Wl0A12lnYRm84WcDb4mp9XZ0p2KxTpHJqHoOfO5PbSh9uFn0CziZEpaboH68jeIdeF+2wpJxdOaEDRDwJWmcKZNfMVyAM9zij+NN4vj+kQmVcvPyFSG4plVoxodLH/hV1uz7TnL325GW3Ig1C+mDZRFuiSfokXLTqJqIuI3sPvnYp83Kpf1IUCE+eFpNE2t14IVr72lXlv4hQ+af2z8/Lst5aa/ENNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enztSATIE0PNym+Bx0dO33uCIgY6HitJixLacRT1nfQ=;
 b=wXm/Xnfe6UqKBhTeYTeWgni3/zpae7j/LdUwleKPJ0cMwkSoG95VgNJKMsFg83yw1V7FPXMYr3Evz0bhBEhJ8yMh+2iv4OxtmS0Z/Ap4oClCgK7hGV8zcGpFR4MMYvawST8MpxO9L2B4RM5znScoi6IgikLlF0OVT9c6LG0d6bI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v2] lib: extend ASSERT()
Thread-Topic: [PATCH v2] lib: extend ASSERT()
Thread-Index: AQHYE4sUwaOwwc8tCU249z99fRIDqqyVNw0AgADQBoCAAAHjAIAABDoA
Date: Wed, 16 Feb 2022 09:46:59 +0000
Message-ID: <9A2C0906-B7EA-4E18-A384-89D52744B940@arm.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
In-Reply-To: <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e64a1815-2d7f-4de9-9824-08d9f1314c89
x-ms-traffictypediagnostic:
	AM9PR08MB7032:EE_|DB5EUR03FT034:EE_|AM8PR08MB6628:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6628FD697E5606547D0372D19D359@AM8PR08MB6628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LPSUU/vxFHNXnbaZcc0MMqGbrD2aBH53THdFlk6O2+vbYFVWKG1wqrsKT5nhyF6zmr0CaeIjkKpIYb6sRPSUxu4i6zQq1+RyElvTzashHJyK5JoAkHflxQ36Is3CWVvwfrLfsEggguUJ9+dLVWPwD2nkz5MNiuSxeyNNqMdnjWcE+5uN8ZjgVIzWKEuJelCM5xFLpgwu/BHe1ndKDRTJoEBzpBjqBlth+wDDZ1VYFVER5bILVAngrAXpMdB8CmX80bRra1+ZRvJuky7qI+UQaJklzjkZp5hf6sK8X7eN6EX6dq+H0nZpsNPIojtpjnYATFxiD82fWgV8+YR7gfRKqtcVybCJMNQoU65sQfy+D0xQPqOmzGyHNoGH39M9b9YFVb65Byj9Cu5dWlzWmc0+foMLyy/IxJ8p9gteOCIzAh+JVJ1YT9yIMhaIh+OiZ7nXgjTj7IoDkaQm/AM/zCQzRhkgwNIEPFqiZssl8tLhwwCzwY43XpPKiDxQU6m2q6HVfXlbPnbHwn3YPTJwUUhoZh+oSIftXUDFHFhc0gojr2STp1nTuFBtZuiWIHYVB7BsxgM/2EPAvURC4G3yQT6PquG1csR0z/4l2paosg8MzRSoGKXlr5SCgdDVKgQBBfiRvrexEXa9qESwFOKa497adpfbkDHE0/hakGBWWdf5Ex55FfHqhF+5ytfvD+H9OCQ575ES9pRZlrumXwQk+SRHslDzdER13LrYA49BrHo1OshpP/GVrDcokO8hAFKAMk4c
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6486002)(66946007)(6916009)(186003)(53546011)(26005)(6506007)(86362001)(316002)(36756003)(508600001)(5660300002)(8676002)(2906002)(122000001)(38070700005)(4326008)(66556008)(64756008)(8936002)(66446008)(76116006)(91956017)(66476007)(2616005)(33656002)(38100700002)(6512007)(54906003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A84EFBC88CDA446939A7541BD4AD0C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	125a768a-7ee2-468f-c85c-08d9f13146ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ruUXGJk57sKdABb51S/N36zxE+ND56a7uW58BvfxV27I5xwTfizDqNwQ0XmoW3WD/hY4nBU/9BxET+QDSELxDgtqTkFNI5jlxL/2+4pT89tB39Cww6n5WIt6j6pg889vQkSLtTCZ7e+jc3WRvOR4VagZ9/MVmi3WUosoxxM7SWuwOaxdCS/mzxileKTXErwxq7XzQ9EesyHJnsetiGleoCSoXG5RLpEdlDe/TaFqZlJFPQ62TtOyxoDHfde8r1YlYqCeMbn99KKYfrcOoWXPjv9ALy63//BCrI2Hnl/snwPf7uajVgDsCcswlqhoHUj4M2W0sHpIbQZPZ6lF8eN6LhEpQ+OEsAI6bN8DtxMoXExBqGAQ8aqV0ieKT9UU02NJj4eAukb5WVs0OtmnbdcwGotA7aypMv6XtsZLqQzChroranPX+/2LDgfmrkJTD9K7fRYSfDWuhK5OHo70zPZf1ZelHKUDcOgSo+KJ4X5KgWJTUq7AhXkdXno7JsK6OV6vgBYJW04uH7Utctb4l6ZzAVjNyIno0Tze4W/CHefLFiLpqgnMnTPSzcNQJ7X0L0BVD2K621bFZZN/Al0uNG4HO//fbpcqbezKr/L1FKk2T8hoQr9pv5ofVWTYxU77Dy1Nh7uhBWnPhNuJ5r0NTLRNsoDqS7yqBVWNYP2eoS4oDrl0k7BXYt6vYkCFMKpkVZC/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2906002)(8936002)(5660300002)(33656002)(40460700003)(82310400004)(36756003)(2616005)(26005)(186003)(336012)(36860700001)(83380400001)(47076005)(70586007)(86362001)(316002)(70206006)(356005)(4326008)(8676002)(6862004)(53546011)(6506007)(6512007)(54906003)(6486002)(81166007)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:47:08.9338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e64a1815-2d7f-4de9-9824-08d9f1314c89
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6628

SGkgSmFuLA0KDQo+IE9uIDE2IEZlYiAyMDIyLCBhdCAwOTozMSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE2LjAyLjIwMjIgMTA6MjUsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4sIEp1bGllbiwNCj4+IA0KPj4+IE9uIDE1IEZlYiAy
MDIyLCBhdCAyMTowMCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4g
DQo+Pj4gKCsgQmVydHJhbmQpDQo+Pj4gDQo+Pj4gSGkgSmFuLA0KPj4+IA0KPj4+IE9uIDI3LzAx
LzIwMjIgMTQ6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBUaGUgaW5jcmVhc2luZyBhbW91
bnQgb2YgY29uc3RydWN0cyBhbG9uZyB0aGUgbGluZXMgb2YNCj4+Pj4gICAgaWYgKCAhY29uZGl0
aW9uICkNCj4+Pj4gICAgew0KPj4+PiAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+Pj4+
ICAgICAgICByZXR1cm47DQo+Pj4+ICAgIH0NCj4+Pj4gaXMgbm90IG9ubHkgbG9uZ2VyIHRoYW4g
bmVjZXNzYXJ5LCBidXQgYWxzbyBkb2Vzbid0IHByb2R1Y2UgaW5jaWRlbnQNCj4+Pj4gc3BlY2lm
aWMgY29uc29sZSBvdXRwdXQgKGV4Y2VwdCBmb3IgZmlsZSBuYW1lIGFuZCBsaW5lIG51bWJlciku
DQo+Pj4gDQo+Pj4gU28gSSBhZ3JlZSB0aGF0IHRoaXMgY29uc3RydWN0IHdpbGwgYWx3YXlzIHJl
c3VsdCB0byBhIG1pbmltdW0gNSBsaW5lcy4gV2hpY2ggaXMgbm90IG5pY2UuIEJ1dCB0aGUgcHJv
cG9zZWQgY2hhbmdlIGlzLi4uDQo+Pj4gDQo+Pj4+IEFsbG93DQo+Pj4+IHRoZSBpbnRlbmRlZCBl
ZmZlY3QgdG8gYmUgYWNoaWV2ZWQgd2l0aCBBU1NFUlQoKSwgYnkgZ2l2aW5nIGl0IGEgc2Vjb25k
DQo+Pj4+IHBhcmFtZXRlciBhbGxvd2luZyBzcGVjaWZpY2F0aW9uIG9mIHRoZSBhY3Rpb24gdG8g
dGFrZSBpbiByZWxlYXNlIGJ1aWxkcw0KPj4+PiBpbiBjYXNlIGFuIGFzc2VydGlvbiB3b3VsZCBo
YXZlIHRyaWdnZXJlZCBpbiBhIGRlYnVnIG9uZS4gVGhlIGV4YW1wbGUNCj4+Pj4gYWJvdmUgdGhl
biBiZWNvbWVzDQo+Pj4+ICAgIEFTU0VSVChjb25kaXRpb24sIHJldHVybik7DQo+Pj4+IE1ha2Ug
c3VyZSB0aGUgY29uZGl0aW9uIHdpbGwgY29udGludWUgdG8gbm90IGdldCBldmFsdWF0ZWQgd2hl
biBqdXN0IGENCj4+Pj4gc2luZ2xlIGFyZ3VtZW50IGdldHMgcGFzc2VkIHRvIEFTU0VSVCgpLg0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4+
IC0tLQ0KPj4+PiB2MjogUmVuYW1lIG5ldyBtYWNybyBwYXJhbWV0ZXIuDQo+Pj4+IC0tLQ0KPj4+
PiBSRkM6IFRoZSB1c2Ugb2YgYSBjb250cm9sIGZsb3cgY29uc3RydWN0IGFzIGEgbWFjcm8gYXJn
dW1lbnQgbWF5IGJlDQo+Pj4+ICAgICBjb250cm92ZXJzaWFsLg0KPj4+IA0KPj4+IGluZGVlZCBj
b250cm92ZXJzaWFsLiBJIGZpbmQgdGhpcyBxdWl0ZSBjb25mdXNpbmcgYW5kIG5vdCBzb21ldGhp
bmcgSSB3b3VsZCByZXF1ZXN0IGEgdXNlciB0byBzd2l0Y2ggdG8gaWYgdGhleSB1c2UgdGhlIGxv
bmdlciB2ZXJzaW9uLg0KPj4+IA0KPj4+IFRoYXQgc2FpZCwgdGhpcyBpcyBtYWlubHkgYSBtYXR0
ZXIgb2YgdGFzdGUuIFNvIEkgYW0gaW50ZXJlc3RlZCB0byBoZWFyIG90aGVycyB2aWV3Lg0KPj4+
IA0KPj4+IEkgaGF2ZSBhbHNvIENDZWQgQmVydHJhbmQgdG8gaGF2ZSBhbiBvcGluaW9ucyBmcm9t
IHRoZSBGdXNhIEdyb3VwIChJIHN1c3BlY3QgdGhpcyB3aWxsIGdvIGJhY2t3YXJkIGZvciB0aGVt
KS4NCj4+IA0KPj4gVGhhbmtzIGFuZCBoZXJlIGlzIG15IGZlZWRiYWNrIGluIHJlZ2FyZHMgdG8g
RnVzYSBoZXJlLg0KPj4gDQo+PiBNb3N0IGNlcnRpZmljYXRpb24gc3RhbmRhcmRzIGFyZSBmb3Ji
aWRkaW5nIGNvbXBsZXRlbHkgbWFjcm9zIGluY2x1ZGluZw0KPj4gY29uZGl0aW9ucyAoYW5kIHF1
aXRlIGEgbnVtYmVyIGFyZSBmb3JiaWRkaW5nIHN0YXRpYyBpbmxpbmUgd2l0aCBjb25kaXRpb25z
KS4NCj4+IFRoZSBtYWluIHJlYXNvbiBmb3IgdGhhdCBpcyBNQ0RDIGNvdmVyYWdlIChjb25kaXRp
b24vZGVjaXNpb25zIGFuZCBub3Qgb25seQ0KPj4gY29kZSBsaW5lKSBpcyBub3QgcG9zc2libGUg
dG8gZG8gYW55bW9yZSBkb3duIHRvIHRoZSBzb3VyY2UgY29kZSBhbmQgaGFzIHRvIGJlDQo+PiBk
b25lIGRvd24gdG8gdGhlIHByZS1wcm9jZXNzZWQgY29kZS4NCj4+IA0KPj4gT3V0IG9mIEZ1c2Eg
Y29uc2lkZXJhdGlvbnMsIG9uZSB0aGluZyBJIGRvIG5vdCBsaWtlIGluIHRoaXMgc29sdXRpb24g
aXMgdGhlIGZhY3QgdGhhdA0KPj4geW91IHB1dCBzb21lIGNvZGUgYXMgcGFyYW1ldGVyIG9mIHRo
ZSBtYWNybyAodGhlIHJldHVybikuDQo+PiANCj4+IFRvIG1ha2UgdGhpcyBhIGJpdCBiZXR0ZXIg
eW91IGNvdWxkIHB1dCB0aGUgcmV0dXJuIGNvZGUgYXMgcGFyYW1ldGVyDQo+PiBpbnN0ZWFkIG9m
IGhhdmluZyDigJxyZXR1cm4gQ09EReKAnSBhcyBwYXJhbWV0ZXIuDQo+IA0KPiBFeGNlcHQgdGhh
dCBpdCdzIG5vdCBhbHdheXMgInJldHVybiIgd2hhdCB5b3Ugd2FudCwgYW5kIGhlbmNlIGl0DQo+
IGNhbid0IGJlIG1hZGUgaW1wbGljaXQuDQoNClRoZW4gaGF2aW5nIGNvZGUgYXMgcGFyYW1ldGVy
IGZvciBhIG1hY3JvIGlzIHJlYWxseSBub3QgbmljZSBJIHRoaW5rLg0KDQo+IA0KPj4gQW4gb3Ro
ZXIgdGhpbmcgaXMgdGhhdCBYZW4gQVNTRVJUIGFmdGVyIHRoaXMgY2hhbmdlIHdpbGwgYmUgcXVp
dGUgZGlmZmVyZW50IGZyb20NCj4+IGFueSBBU1NFUlQgZm91bmQgaW4gb3RoZXIgcHJvamVjdHMg
d2hpY2ggY291bGQgbWFrZSBpdCBtaXNsZWFkaW5nIGZvciBkZXZlbG9wZXJzLg0KPj4gTWF5YmUg
d2UgY291bGQgaW50cm9kdWNlIGFuIEFTU0VSVF9SRVRVUk4gbWFjcm9zIGluc3RlYWQgb2YgbW9k
aWZ5aW5nIHRoZQ0KPj4gYmVoYXZpb3VyIG9mIHRoZSBzdGFuZGFyZCBBU1NFUlQgPw0KPiANCj4g
QWxvbmcgdGhlIGxpbmVzIG9mIHRoZSBhYm92ZSwgdGhpcyB3b3VsZCB0aGVuIG1lYW4gYSBtdWx0
aXR1ZGUgb2YNCj4gbmV3IG1hY3Jvcy4NCg0KVW5kZXJzdG9vZCB0aGVuIG15IHN0YXRlbWVudCBv
ZiBYZW4gaGF2aW5nIGFuIEFTU0VSVCBkaWZmZXJlbnQgZnJvbSBhbnkgb3RoZXIga25vd24NCmFz
c2VydCBzdGlsbCBzdGFuZHMsIHRoaXMgaXMgbm8gc29tZXRoaW5nIEkgd291bGQgdm90ZSBmb3Iu
DQpJZiB5b3Ugd2FudCB0byBrZWVwIHRoZSBjb2RlIHRoZW4gbWF5YmUgdXNpbmcgQVNTRVJUX0FD
VElPTiBvciBzb21ldGhpbmcgbGlrZSB0aGF0IA0KYW5kIGtlZXAgQVNTRVJUIGJlaW5nIGEgc3Rh
bmRhcmQgYXNzZXJ0IHdvdWxkIGJlIGEgZ29vZCBpZGVhLg0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0K
DQo+IA0KPiBKYW4NCg0K

