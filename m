Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6515C4CC2DC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283519.482560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoMX-0007XU-Ky; Thu, 03 Mar 2022 16:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283519.482560; Thu, 03 Mar 2022 16:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoMX-0007VE-Hj; Thu, 03 Mar 2022 16:31:33 +0000
Received: by outflank-mailman (input) for mailman id 283519;
 Thu, 03 Mar 2022 16:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyJZ=TO=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nPoMW-0007V8-CC
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:31:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6135716b-9b0f-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:31:30 +0100 (CET)
Received: from DB6PR0402CA0010.eurprd04.prod.outlook.com (2603:10a6:4:91::20)
 by AM8PR08MB5683.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Thu, 3 Mar
 2022 16:31:28 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::50) by DB6PR0402CA0010.outlook.office365.com
 (2603:10a6:4:91::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 16:31:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 16:31:27 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Thu, 03 Mar 2022 16:31:27 +0000
Received: from cdb49baf4c5b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 13B39DBB-E3C0-4FB3-9F54-9EE7308CB405.1; 
 Thu, 03 Mar 2022 16:31:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cdb49baf4c5b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 16:31:16 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by DB7PR08MB3465.eurprd08.prod.outlook.com
 (2603:10a6:10:50::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:31:13 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 16:31:13 +0000
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
X-Inumbo-ID: 6135716b-9b0f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LirzQcj1S4dFkFOBZknkPK/63vMz0xS9z9/CFCWEnc=;
 b=mOXjH7dpkXPp1eRvmkgUMoHFs+bG0dEGvWzfIJx2/gwDuIAX7ZZ1I80LUK1cH8GGVyKHqylw5c7yTg/bPk2FE5a+lRKHEUZgSM7fOEIMR6+1TAlLvQ3qsTlg7fJkIqAcdJcNp6stOb5ZFY0ZDuWKzJAuy7KYKubLgJuOTbDioPI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76cda304d584db10
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTNYAJ0pdUlalX+fgh/cwdJRFy6F2wJEuXNhxp6fu4UZjne85EvPFCs3Hoznua1hT2yv3NkKahxFlbBPAbPYKA0vZ6IDjZy0ITeGa/ImlxFkSIF+oSBPAnmOOyJrwl0uPjTjzKUpXVC1CF6spZzNb+YzT4fF/0e3Sg35Bi0K5crkqYhqHxXoHFEL5RsPNsdpUqAKdkAw6OH5ssRNPs413iWQFMvBfmBD/pcEPQGBwnFJSlU8PmFVwmYuZaRLfSDDmaZn+vbQW+vdMajROFDHWwr1wwWQg0IvYrSjT0990g4CEUxP80Zu9ja3nrin6S19IhYcl7pBc046ZVlrkUO4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LirzQcj1S4dFkFOBZknkPK/63vMz0xS9z9/CFCWEnc=;
 b=Y8Z28a/cOj/jreBGK1JucvHF9sLQ8i489x1lkbvAQIwUtlCC4DTsXHhXlwofjwaRU7gynEKG6jBvNgRKUlzConXw9f97C7YR+f+oIEiTfsNSo0rbjw0xGSyNY8lIdgI+5qDRzN93oHi+nsh0z1OP3zUXgyt8ze4UOK3ErIMrKCGmL1wH+rcRl2XWHRxL5LykDvbxOAXubQ8P2DclZrw6B9SP+oOBnt6IesM0x7+HPS/D1y11AAeoqLgtu+n4uIWUD7yXKtNXEqJUlvgOFRr6oUHPatm7Kd189Yjom7bddW72GTc1j/p214cfGg5WKFe/w3Qrc/iU30jyoYUE1QrW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LirzQcj1S4dFkFOBZknkPK/63vMz0xS9z9/CFCWEnc=;
 b=mOXjH7dpkXPp1eRvmkgUMoHFs+bG0dEGvWzfIJx2/gwDuIAX7ZZ1I80LUK1cH8GGVyKHqylw5c7yTg/bPk2FE5a+lRKHEUZgSM7fOEIMR6+1TAlLvQ3qsTlg7fJkIqAcdJcNp6stOb5ZFY0ZDuWKzJAuy7KYKubLgJuOTbDioPI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86
 file
Thread-Index: AQHYIoBoEZVl6/zkE0mK7dGMpvA2Zqyi2K6AgAfEbQCAAAXLAIADUEkA
Date: Thu, 3 Mar 2022 16:31:12 +0000
Message-ID: <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
In-Reply-To: <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7aa6313d-4a3b-45ce-69d1-08d9fd33443f
x-ms-traffictypediagnostic:
	DB7PR08MB3465:EE_|DB5EUR03FT060:EE_|AM8PR08MB5683:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB56838FB19391429866BBA257FC049@AM8PR08MB5683.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sfTt38ZDQFlSWrAsgLYhTwUIkSewydcj9CoTTAHZFs1AEi3t6F2Y19f4Ostwn07YmKv+Ol6OdtRe5G9lN8A1HTYIZS+hcUgOu4CeNu4lW0xRvrxEpOg+P1z9DHYWqBln1mz/xb83Bxa6ar8x4ekN8Qfj/jrzzm10bjRiCMPmobBhf8RxFZ3hPrC7OsNaLqCSqDcxs7SxqJSxKzOInpxjDaBp77a6OQzGpHQqGHu0MepcyXuhRkPb7pQwQRhebkTPPPHhhs3TzJwLvjZrC1YP1qWUi9ySxBpRmV3wT47pZ394jNJHiB/uppmB32WC9UpPuAo7AQNIBbvOcC4U5C2USonAl5g6r0l7fmWPnEWgdcUpfk2GoG2BPhQ+bhLUydIrhMEtzn7F2+QYXw3KrRjEASdDGSrZhj/X4+IrmhgVPVqSKa2//WvrrPauj77c2Ot0nWRAzM6WFIaoj2E5+H3/s/NjtWzbkHpie6fHZ5t1xD4xoYLL47zPcq8GumtScltWFptdMeGklPBA/trCeQjzlwCRnmbILTRzBYDyK+yVuA1E1mJRofNvCcpvJV4dpzg5H+gcGYELJ4aURNewYW3Z+kUEf8qKLbTs0vZUKxj/L+0yTT/EPkJfuqRgoyhShoq/D35AyAMu5pWUVGsJvSU6rN6+X/cA7CisRqGjHOxrIjD3gJ81rSlSLGX2oZ5452i/NlZ663jYMSmclfG5zw4ykZRReRGD4/x/p1Ls3UCmAZqm5lT72d4zC+r4Eynk0HC0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(38070700005)(508600001)(86362001)(8676002)(64756008)(66946007)(66446008)(76116006)(38100700002)(66556008)(66476007)(91956017)(2616005)(122000001)(316002)(6916009)(6486002)(54906003)(36756003)(6512007)(186003)(26005)(6506007)(53546011)(2906002)(33656002)(5660300002)(8936002)(83380400001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <746168A206CB7B4DB622FB58D7D3833B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25c816dd-4c8e-4125-c4fe-08d9fd333b64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VW2r/HWzqyiLKHAR1aIZdGPcJZmJkJtl8K40Qzeii2XNBYCq+dDxm+MTGfg9TVuDpVik7DOVhfOFaEp/OCQuPdXtSxm/KtTX/0N5SCfL9EeLJGArvQbYf0Ic2sUEjpt9HqRFVpzooK1q9Alem0jHffM1Gy2OKln0MSlR2RCC1Bz1fjK75IEuxknreIfsd5NmXhWmxtcQdJJDcbHojxFyEizijrg9h+bbRYMWBAsxzaEiA4iRsyDduFZ8eqX3hM5Jj79nfdVtAw73mN/nql/0D+hLTJOG9Ynwah4nntsnO4xn82oVliVsGZlqFbchdE1JUaMSJiyDzH3ZtDsauHOJGxd9eKBwaVbJSxSBZ1XR7MXw36U+x/sm3YulAGKTLss2Xv9iwHaQgEWF8TrJ23rlVoozj7oNMT8Jkz+AA/lwZ/HULOLA5j7S875L5QVjj3MwqtyRZhMB0rWWt2edeopDFnkFInT2DCNfz4M0fo/On5SWD8i8KdiHolHmnNWTYefZBOahh6ukQQZJFcn5Zf9A/6kb5zZWrops7fdDkOB5jT/y+3WwGzAl/OeK97JzbfoZDSiSXXFJgL7EzaVWHeOwXf9O17PrJrN71/k5do6wSArAxwPxek9udcTFSQ1krYlVUFnZ9K5PxCNbHk3IO7QMHylAuNP6VqBHdUNzq09Ifrd+gXbIxEqUJ6ydQ555gYbh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(316002)(8936002)(6486002)(4326008)(6862004)(8676002)(2906002)(26005)(54906003)(40460700003)(86362001)(186003)(36756003)(508600001)(70206006)(70586007)(6512007)(53546011)(6506007)(36860700001)(81166007)(356005)(2616005)(33656002)(82310400004)(336012)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:31:27.9801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa6313d-4a3b-45ce-69d1-08d9fd33443f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5683

SGkgSmFuLA0KDQo+IE9uIDEgTWFyIDIwMjIsIGF0IDE6NTUgcG0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS4wMy4yMDIyIDE0OjM0LCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+PiBPbiAyNCBGZWIgMjAyMiwgYXQgMjo1NyBwbSwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAxNS4wMi4yMDIyIDE2OjI1
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4gdnBjaS9tc2l4LmMgZmlsZSB3aWxsIGJlIHVzZWQg
Zm9yIGFybSBhcmNoaXRlY3R1cmUgd2hlbiB2cGNpIG1zaXgNCj4+Pj4gc3VwcG9ydCB3aWxsIGJl
IGFkZGVkIHRvIEFSTSwgYnV0IHRoZXJlIGlzIHg4NiBzcGVjaWZpYyBjb2RlIGluIHRoaXMNCj4+
Pj4gZmlsZS4NCj4+Pj4gDQo+Pj4+IE1vdmUgeDg2IHNwZWNpZmljIGNvZGUgdG8gdGhlIHg4Ni9o
dm0vdm1zaS5jIGZpbGUgdG8gbWFrZSBzdXJlIGNvbW1vbg0KPj4+PiBjb2RlIHdpbGwgYmUgdXNl
ZCBmb3Igb3RoZXIgYXJjaGl0ZWN0dXJlLg0KPj4+IA0KPj4+IENvdWxkIHlvdSBwcm92aWRlIHNv
bWUgY3JpdGVyaWEgYnkgd2hpY2ggY29kZSBpcyBjb25zaWRlcmVkIHg4Ni1zcGVjaWZpYw0KPj4+
IChvciBub3QpPyBGb3IgZXhhbXBsZSAuLi4NCj4+IA0KPj4gQ29kZSBtb3ZlZCB0byB4ODYgZmls
ZSBpcyBiYXNlZCBvbiBjcml0ZXJpYSB0aGF0IGVpdGhlciB0aGUgY29kZSB3aWxsIGJlIHVudXNh
YmxlIG9yIHdpbGwgYmUgZGlmZmVyZW50IA0KPj4gZm9yIEFSTSB3aGVuIE1TSVggIHN1cHBvcnQg
d2lsbCBiZSBpbnRyb2R1Y2UgZm9yIEFSTS4NCj4gDQo+IFRoYXQncyBhIHZlcnkgYWJzdHJhY3Qg
c3RhdGVtZW50LCB3aGljaCB5b3UgY2FuJ3QgcmVhbGx5IGRlcml2ZSBhbnkNCj4ganVkZ2VtZW50
IGZyb20uIEl0J2xsIGJlIG5lY2Vzc2FyeSB0byBzZWUgaW4gaG93IGZhciB0aGUgY29kZSBpcw0K
PiBpbmRlZWQgZGlmZmVyZW50LiBBZnRlciBhbGwgUENJLCBNU0ksIGFuZCBNU0ktWCBhcmUgbGFy
Z2VseSBhcmNoLQ0KPiBhZ25vc3RpYy4NCj4gDQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm1zaS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jDQo+Pj4+IEBAIC05MjUs
NCArOTI1LDEwNiBAQCBpbnQgdnBjaV9tc2l4X2FyY2hfcHJpbnQoY29uc3Qgc3RydWN0IHZwY2lf
bXNpeCAqbXNpeCkNCj4+Pj4gDQo+Pj4+ICAgIHJldHVybiAwOw0KPj4+PiB9DQo+Pj4+ICsNCj4+
Pj4gK2ludCB2cGNpX21ha2VfbXNpeF9ob2xlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0K
Pj4+PiArew0KPj4+PiArICAgIHN0cnVjdCBkb21haW4gKmQgPSBwZGV2LT5kb21haW47DQo+Pj4+
ICsgICAgdW5zaWduZWQgaW50IGk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoICFwZGV2LT52cGNp
LT5tc2l4ICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKiBN
YWtlIHN1cmUgdGhlcmUncyBhIGhvbGUgZm9yIHRoZSBNU0lYIHRhYmxlL1BCQSBpbiB0aGUgcDJt
LiAqLw0KPj4+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShwZGV2LT52cGNpLT5t
c2l4LT50YWJsZXMpOyBpKysgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgdW5zaWduZWQg
bG9uZyBzdGFydCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2FkZHIocGRldi0+dnBjaSwgaSkpOw0K
Pj4+PiArICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2Fk
ZHIocGRldi0+dnBjaSwgaSkgKw0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZtc2l4X3RhYmxlX3NpemUocGRldi0+dnBjaSwgaSkgLSAxKTsNCj4+Pj4gKw0KPj4+
PiArICAgICAgICBmb3IgKCA7IHN0YXJ0IDw9IGVuZDsgc3RhcnQrKyApDQo+Pj4+ICsgICAgICAg
IHsNCj4+Pj4gKyAgICAgICAgICAgIHAybV90eXBlX3QgdDsNCj4+Pj4gKyAgICAgICAgICAgIG1m
bl90IG1mbiA9IGdldF9nZm5fcXVlcnkoZCwgc3RhcnQsICZ0KTsNCj4+Pj4gKw0KPj4+PiArICAg
ICAgICAgICAgc3dpdGNoICggdCApDQo+Pj4+ICsgICAgICAgICAgICB7DQo+Pj4+ICsgICAgICAg
ICAgICBjYXNlIHAybV9tbWlvX2RtOg0KPj4+PiArICAgICAgICAgICAgY2FzZSBwMm1faW52YWxp
ZDoNCj4+Pj4gKyAgICAgICAgICAgICAgICBicmVhazsNCj4+Pj4gKyAgICAgICAgICAgIGNhc2Ug
cDJtX21taW9fZGlyZWN0Og0KPj4+PiArICAgICAgICAgICAgICAgIGlmICggbWZuX3gobWZuKSA9
PSBzdGFydCApDQo+Pj4+ICsgICAgICAgICAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkoZCwgc3RhcnQpOw0KPj4+PiArICAgICAgICAg
ICAgICAgICAgICBicmVhazsNCj4+Pj4gKyAgICAgICAgICAgICAgICB9DQo+Pj4+ICsgICAgICAg
ICAgICAgICAgLyogZmFsbHRocm91Z2guICovDQo+Pj4+ICsgICAgICAgICAgICBkZWZhdWx0Og0K
Pj4+PiArICAgICAgICAgICAgICAgIHB1dF9nZm4oZCwgc3RhcnQpOw0KPj4+PiArICAgICAgICAg
ICAgICAgIGdwcmludGsoWEVOTE9HX1dBUk5JTkcsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAiJXBwOiBleGlzdGluZyBtYXBwaW5nIChtZm46ICUiIFBSSV9tZm4NCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICJ0eXBlOiAlZCkgYXQgJSNseCBjbG9iYmVycyBNU0lYIE1NSU8g
YXJlYVxuIiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmLCBtZm5f
eChtZm4pLCB0LCBzdGFydCk7DQo+Pj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIC1FRVhJU1Q7
DQo+Pj4+ICsgICAgICAgICAgICB9DQo+Pj4+ICsgICAgICAgICAgICBwdXRfZ2ZuKGQsIHN0YXJ0
KTsNCj4+Pj4gKyAgICAgICAgfQ0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgIHJldHVy
biAwOw0KPj4+PiArfQ0KPj4+IA0KPj4+IC4uLiBub3RoaW5nIGluIHRoaXMgZnVuY3Rpb24gbG9v
a3MgdG8gYmUgeDg2LXNwZWNpZmljLCBleGNlcHQgbWF5YmUNCj4+PiBmdW5jdGlvbnMgbGlrZSBj
bGVhcl9pZGVudGl0eV9wMm1fZW50cnkoKSBtYXkgbm90IGN1cnJlbnRseSBiZSBhdmFpbGFibGUN
Cj4+PiBvbiBBcm0uIEJ1dCB0aGlzIGRvZXNuJ3QgbWFrZSB0aGUgY29kZSB4ODYtc3BlY2lmaWMu
DQo+PiANCj4+IEkgd2lsbCBtYXliZSBiZSB3cm9uZyBidXQgd2hhdCBJIHVuZGVyc3RhbmQgZnJv
bSB0aGUgY29kZSBpcyB0aGF0IGZvciB4ODYgDQo+PiBpZiB0aGVyZSBpcyBubyBwMm0gZW50cmll
cyBzZXR1cCBmb3IgdGhlIHJlZ2lvbiwgYWNjZXNzZXMgdG8gdGhlbSB3aWxsIGJlIHRyYXBwZWQg
DQo+PiBpbnRvIHRoZSBoeXBlcnZpc29yIGFuZCBjYW4gYmUgaGFuZGxlZCBieSBzcGVjaWZpYyBN
TUlPIGhhbmRsZXIuDQo+PiANCj4+IEJ1dCBmb3IgQVJNIHdoZW4gd2UgYXJlIHJlZ2lzdGVyaW5n
IHRoZSBNTUlPIGhhbmRsZXIgd2UgaGF2ZSB0byBwcm92aWRlIA0KPj4gdGhlIEdQQSBhbHNvIGZv
ciB0aGUgTU1JTyBoYW5kbGVyLiANCj4gDQo+IFF1ZXN0aW9uIGlzOiBJcyB0aGlzIGp1c3QgYW4g
ZWZmZWN0IHJlc3VsdGluZyBmcm9tIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiwNCj4gb3IgYW4g
aW5oZXJlbnQgcmVxdWlyZW1lbnQ/IEluIHRoZSBmb3JtZXIgY2FzZSwgaGFybW9uaXppbmcgdGhp
bmdzIG1heSBiZSBhbg0KPiBhbHRlcm5hdGl2ZSBvcHRpb24uDQoNClRoaXMgaXMgYW4gaW5oZXJl
bnQgcmVxdWlyZW1lbnQgdG8gcHJvdmlkZSBhIEdQQSB3aGVuIHJlZ2lzdGVyaW5nIHRoZSBNTUlP
IGhhbmRsZXIuDQoNCkZvciB4ODYgbXNpeCBtbWlvIGhhbmRsZXJzIGlzIHJlZ2lzdGVyZWQgaW4g
aW5pdF9tc2l4KC4uKSBmdW5jdGlvbiBhcyB0aGVyZSBpcyBubyByZXF1aXJlbWVudA0Kb24geDg2
IHRvIHByb3ZpZGUgR1BBIHdoZW4gcmVnaXN0ZXJpbmcgdGhlIGhhbmRsZXIuIExhdGVyIHBvaW50
IG9mIHRpbWUgd2hlbiBCQVJzIGFyZSBjb25maWd1cmVkDQphbmQgbWVtb3J5IGRlY29kaW5nIGJp
dCBpcyBlbmFibGVkIHZwY2lfbWFrZV9tc2l4X2hvbGUoKSB3aWxsIGNsZWFyIHRoZSBpZGVudGl0
eSBtYXBwaW5nIGZvciBtc2l4DQpiYXNlIHRhYmxlIGFkZHJlc3Mgc28gdGhhdCBhY2Nlc3MgdG8g
bXNpeCB0YWJsZXMgd2lsbCBiZSB0cmFwcGVkLg0KDQpPbiBBUk0gd2UgbmVlZCB0byBwcm92aWRl
IEdQQSB0byByZWdpc3RlciB0aGUgbW1pbyBoYW5kbGVyIGFuZCBNU0lYIHRhYmxlIGJhc2UNCmFk
ZHJlc3MgaXMgbm90IHZhbGlkIHdoZW4gaW5pdF9tc2l4KCkgaXMgY2FsbGVkIGFzIEJBUiB3aWxs
IGJlIGNvbmZpZ3VyZWQgbGF0ZXIgcG9pbnQgaW4gdGltZS4NClRoZXJlZm9yZSBvbiBBUk0gbW1p
byBoYW5kbGVyIHdpbGwgYmUgcmVnaXN0ZXJlZCBpbiBmdW5jdGlvbiB2cGNpX21ha2VfbXNpeF9o
b2xlKCkgd2hlbg0KbWVtb3J5IGRlY29kaW5nIGJpdCBpcyBlbmFibGVkLg0KDQo+IA0KPj4gRm9y
IEFSTSBhcmNoIHZwY2lfbWFrZV9tc2l4X2hvbGUoKSB3aWxsIGJlIHVzZWQgdG8gcmVnaXN0ZXIg
dGhlIE1NSU8gaGFuZGxlciANCj4+IGZvciB0aGUgTVNJWCBNTUlPIHJlZ2lvbi4NCj4+IA0KPj4g
aW50IHZwY2lfbWFrZV9tc2l4X2hvbGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiB7
DQo+PiAgICBzdHJ1Y3QgdnBjaV9tc2l4ICptc2l4ID0gcGRldi0+dnBjaS0+bXNpeDsNCj4+ICAg
IHBhZGRyX3QgYWRkcixzaXplOw0KPj4gDQo+PiAgIGZvciAoIGludCBpID0gMDsgbXNpeCAmJiBp
IDwgQVJSQVlfU0laRShtc2l4LT50YWJsZXMpOyBpKysgKQ0KPj4gICB7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgDQo+PiAgICAgICBhZGRyID0gdm1zaXhfdGFibGVfYWRkcihwZGV2LT52cGNpLCBpKTsgICAg
ICAgICAgICAgICANCj4+ICAgICAgIHNpemUgPSB2bXNpeF90YWJsZV9zaXplKHBkZXYtPnZwY2ks
IGkpIC0gMTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiAgICAgICByZWdpc3Rlcl9tbWlvX2hhbmRsZXIo
cGRldi0+ZG9tYWluLCAmdnBjaV9tc2lfbW1pb19oYW5kbGVyLCAgICAgICAgICAgICANCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHIsIHNpemUsIE5V
TEwpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiAgICB9ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4+ICAgIHJldHVy
biAwOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICANCj4+IH0NCj4+IA0KPj4gVGhlcmVmb3JlIGluIHRoaXMgY2FzZSB0aGVy
ZSBpcyBkaWZmZXJlbmNlIGhvdyBBUk0gaGFuZGxlIHRoaXMgY2FzZS4NCj4+IA0KPj4+IA0KPj4+
PiArc3RydWN0IHZwY2lfbXNpeCAqdnBjaV9tc2l4X2ZpbmQoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCwgdW5zaWduZWQgbG9uZyBhZGRyKQ0KPj4+PiArew0KPj4+PiArICAgIHN0cnVjdCB2cGNpX21z
aXggKm1zaXg7DQo+Pj4+ICsNCj4+Pj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggbXNpeCwg
JmQtPmFyY2guaHZtLm1zaXhfdGFibGVzLCBuZXh0ICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAg
ICAgIGNvbnN0IHN0cnVjdCB2cGNpX2JhciAqYmFycyA9IG1zaXgtPnBkZXYtPnZwY2ktPmhlYWRl
ci5iYXJzOw0KPj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4+Pj4gKw0KPj4+PiArICAg
ICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUobXNpeC0+dGFibGVzKTsgaSsrICkNCj4+
Pj4gKyAgICAgICAgICAgIGlmICggYmFyc1ttc2l4LT50YWJsZXNbaV0gJiBQQ0lfTVNJWF9CSVJN
QVNLXS5lbmFibGVkICYmDQo+Pj4+ICsgICAgICAgICAgICAgICAgIFZNU0lYX0FERFJfSU5fUkFO
R0UoYWRkciwgbXNpeC0+cGRldi0+dnBjaSwgaSkgKQ0KPj4+PiArICAgICAgICAgICAgICAgIHJl
dHVybiBtc2l4Ow0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgIHJldHVybiBOVUxMOw0K
Pj4+PiArfQ0KPj4+IA0KPj4+IE9yIHRha2UgdGhpcyBvbmUgLSBJIGRvbid0IHNlZSBhbnl0aGlu
ZyB4ODYtc3BlY2lmaWMgaW4gaGVyZS4gVGhlIHVzZQ0KPj4+IG9mIGQtPmFyY2guaHZtIG1lcmVs
eSBwb2ludHMgb3V0IHRoYXQgdGhlcmUgbWF5IGJlIGEgZmllbGQgd2hpY2ggbm93DQo+Pj4gbmVl
ZHMgZ2VuZXJhbGl6aW5nLg0KPj4gDQo+PiBZZXMsIHlvdSBhcmUgcmlnaHQgaGVyZSBJIGNhbiBh
dm9pZCB0aGlzIGNoYW5nZSBpZiBJIHdpbGwgaW50cm9kdWNlIA0KPj4gInN0cnVjdCBsaXN0X2hl
YWQgbXNpeF90YWJsZXMiICBpbiAiZC0+YXJjaC5odm0iIGZvciBBUk0gYWxzby4gDQo+IA0KPiBX
YWl0IC0gaWYgeW91IHBhc3MgaW4gdGhlIGd1ZXN0IGFkZHJlc3MgYXQgcmVnaXN0cmF0aW9uIHRp
bWUsIHlvdQ0KPiBzaG91bGRuJ3QgaGF2ZSBhIG5lZWQgZm9yIGEgImZpbmQiIGZ1bmN0aW9uLg0K
DQpZZXMgeW91IGFyZSByaWdodCB3ZSBkb27igJl0IG5lZWQgdG8gY2FsbCBtc2l4X2ZpbmQoKSBv
biBBUk0uIEluIHRoYXQgY2FzZSB0aGVyZSBpcw0KbmVlZCB0byBtb3ZlIG1zaXhfZmluZCgpIGZ1
bmN0aW9uIHRvIHg4NiBmaWxlIGFzIEkgZGlkIGluIHYxLg0KDQpSZWdhcmRzLA0KUmFodWwNCj4g
DQo+IEphbg0KPiANCg0K

