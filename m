Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A30341C1A0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198936.352687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVuM-0008EN-6q; Wed, 29 Sep 2021 09:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198936.352687; Wed, 29 Sep 2021 09:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVuM-0008CZ-2p; Wed, 29 Sep 2021 09:29:46 +0000
Received: by outflank-mailman (input) for mailman id 198936;
 Wed, 29 Sep 2021 09:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AY/=OT=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mVVuK-0008CR-Kh
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:29:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.86]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84e245bd-baa2-4fe7-b4e6-99b49acf798b;
 Wed, 29 Sep 2021 09:29:42 +0000 (UTC)
Received: from AM6P193CA0120.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::25)
 by VI1PR08MB3101.eurprd08.prod.outlook.com (2603:10a6:803:45::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 09:29:39 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::c7) by AM6P193CA0120.outlook.office365.com
 (2603:10a6:209:85::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 09:29:39 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 09:29:38 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Wed, 29 Sep 2021 09:29:37 +0000
Received: from 6eecb24ba9d5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5017ED9A-962C-454B-AEBF-8203B05766D1.1; 
 Wed, 29 Sep 2021 09:29:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6eecb24ba9d5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 09:29:24 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4803.eurprd08.prod.outlook.com (2603:10a6:20b:c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 09:29:21 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 09:29:21 +0000
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
X-Inumbo-ID: 84e245bd-baa2-4fe7-b4e6-99b49acf798b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgDWpFjyYRgPv97da3w2BM8h441w53bay0cYkUStBkg=;
 b=N+0LMgY6srKlSWFj0WJb9AQrm6B25AWn5YK9cAeEZuHpT4fgj/AGnGP3BC6M0DkbArRk3qh7kf4i3lnZcOgFRK+tEsUlurB569+H/yN2Ddlda84JsENlB1Dhq8S3HGZZnomGkO/Q7nTnMjeBc4vx0zK9SQLP34w9N+kGAmmj3MY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87c3b6975f67332e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVJBVCWL8/kQjmzo2Njs3103WNqCSmo+01GG2v8oJuYBt1aWUbNvbA4MFP83Tpf1e6q0nW+y8DtV7WK5n6SEsAalhNeoxsUKUoERSUQi9S8MHcE+JWIRpZuyGQ4+qpaOmeGrHc5e/A0v5VR3RVvqyE4duVOOkFURA34ZKr7MeqWKHgAefky+egZEdbLdzoZZJSDoii0SrSZyQ634vLo3ooeF5h38i/cZKMQgakfFjPXLC4f1MM+cLNiImHQZfmLFRSReujjZy+5bRiUajbRiZWq6IwVjNC6PxphoWxPDmOJ0Nv0qBebxA2yn4jl75EKjkWkbtsqVofJay0E4haLU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HgDWpFjyYRgPv97da3w2BM8h441w53bay0cYkUStBkg=;
 b=VrCMAHuFk6rtkcOOzNEHOJfyxt6W3ZbLjKeGO89vbaxKJzZcJPQBJdmHX2ya78xvnjny8HEQf6darJDBk5+f3WT4JtgSDUGr57svB4hngvGbCUzRfXMfjPA9fpixHeJztz5PvPdVzJcrvRZK9RFd/Vxs5Xr1FdJji0GY0AJsMzem/Swcki3exh/dGzchhXI9akk4GmPLyN4cxbEzS1fBOmVuatNqUVomvemgOPue1Kn+keA0hdmqm+kzpg/4gK7xJ0qgxxKwxt7ps6rVPEFyZT7StERmhxRyTLRdHZUjZpz80Rkn8cKorg7icViz7kU8guNLB2jKdwXHnXhpl9DLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgDWpFjyYRgPv97da3w2BM8h441w53bay0cYkUStBkg=;
 b=N+0LMgY6srKlSWFj0WJb9AQrm6B25AWn5YK9cAeEZuHpT4fgj/AGnGP3BC6M0DkbArRk3qh7kf4i3lnZcOgFRK+tEsUlurB569+H/yN2Ddlda84JsENlB1Dhq8S3HGZZnomGkO/Q7nTnMjeBc4vx0zK9SQLP34w9N+kGAmmj3MY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/17] xen/arm: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Topic: [PATCH v3 03/17] xen/arm: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Index: AQHXtJV6eXi8DNccokiopfNmJVlfDau6rZ8AgAASK4A=
Date: Wed, 29 Sep 2021 09:29:20 +0000
Message-ID: <FE4E065F-7DA3-4608-874E-C3CC48CA1E9F@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <b95685e16fccf18580c094a5c57db4b83d5b4a29.1632847120.git.rahul.singh@arm.com>
 <67ae3cd5-e90a-5d62-b7f6-b9802ec8296c@suse.com>
In-Reply-To: <67ae3cd5-e90a-5d62-b7f6-b9802ec8296c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6df7a686-0acf-4a1d-a34e-08d9832ba8d8
x-ms-traffictypediagnostic: AM6PR08MB4803:|VI1PR08MB3101:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB31018C15AADAC0E786DA5D6FFCA99@VI1PR08MB3101.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kVKRorL9xTTdm/eNKufrIgwWPaCPnpI/Srytkne5n4w/BSoObBhiUofmFgS0rmiS94oc8D0UhlAwiIhHbYAsUNG8h2p/MAuG+pzAXmENPedTHqUvXQSpMTig0gwq3D3dj060JGQKD/RXoc74J+nD5QjvN5t//itwVnD3ZESdAeg+gXY4yJHOT8N4XX1BISvmp1z0/XR1goq9fEgSi/RApQ/aiRrShhGzvzNOcT95VlPbtmKXw/x/ZC3umo8FwnvpHS8eMTMX8scq7dMsnYd156vNihGwTjzW5Qn2Aw7J79Y9qysKa2EnQgO5kY+9sdLChyb9w+b4740jyf11Qa9qQ1fBbDUkSKcL8mXWah2K9sXGufu6g15s2UzO3eJm4UURY+uarbD8YQzkdisgftVCIWzN/yzI7pOD9ElmZMfpX8PoCTiyUedDzB0C0QfUwyw71ul8eW7/WZjqMhP34PWvkhsHpt2bF5MHpqr/qyW2iQJ25Ywk6ZFTizjQReDBEgELUlSWXdDgyxHqmTYCimJSdNn/LOI5yDmTrLP5DI2vgqHkgDPPBw9CQv+fIxohC/g2SPrfRAj/KKYunMpII9+GVY77AVMOR3vewTwwV+ivEJjw0MFeVK9D5GsLdJH5wEw6zCqktDFqpe4uid5JtH8+PI4icAjAjrMXtqT1bgBUUWOKbWbJH1HWEzzjpXAu7JL7IktJoZ44UNBlmn1c5cjUkhR3auQK6eA73NmEVwn5qDvQSYNpH2Fgr0ZXtEltk/9f
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6506007)(6486002)(8936002)(53546011)(8676002)(54906003)(2616005)(4326008)(6916009)(26005)(6512007)(5660300002)(186003)(71200400001)(66946007)(76116006)(91956017)(86362001)(33656002)(122000001)(36756003)(508600001)(66446008)(64756008)(66556008)(66476007)(38070700005)(2906002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CBE0B683A0E3F479964F11F157EC799@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4803
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5e4c861-53bf-450f-512f-08d9832b9e2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5MZHAn5Qn0BLbflF5y5IuPvPXbW3WGRDUjV0qcw1y00JHEalzvC2T+aGMJ33GlU3JS1BQkK+dKEvxou+9HLXf8slGZnH4mUJfiBIbtuLpLfTX8zaT68ju6fz+WzxRmAhPRoX0y9fMT8rjY2hAB3S5e5JFZZ2Cfa6M3sDIZhNCJLlLWeNf9ZPWPL5rRIf5ee6ZyVooE6V+3UmIgzltM5zCJC9FngVDj4zc8yImqwUV7m8IRDZM27/g0qcyv8JsMDE3tg3d1CO3DqpfzgratFHNHX//1vkl1b73sYH5JJo5lXYAcykxH+AfaSdrltsSiqDTOufi98jEzjlFWQEyztbefaXBX9uUxoNahQPDQbqoXxJw/lqqFg85w/Pw2PxlrG791uEEP3uUgM77I4X3P9gKgQkxvKy1AMVL04dAXbHzQffEfB7gfw/CvWbRiDiPNZRDSpMYLwdqnzMzxsTzWQ03eVr9zEDYD6w6wqLWzsE7zEnLHO5y+zkhm42pzpM13YQWy+8xidHDFM9cK6ELkXptd/EgZNxbOflghco9/AfnN6m08H0y6ccHD4Y1V90J4ZNbIih+SsdfhEMniTl9JLAJiJ/R4uUorxFLVwKII1pKTPqmmZ+7jXh35JxwzwBf11xRL0SOrPH530zZrft/5xZelx0L2d1KIM5EgkjTPOmlGYMgKlZJ8za7nVG+N6ao3q+GhO2SNdyrmRxPfXU0mkbDQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6486002)(36860700001)(508600001)(70206006)(2616005)(6862004)(86362001)(82310400003)(70586007)(316002)(336012)(356005)(6506007)(53546011)(8936002)(81166007)(4326008)(5660300002)(2906002)(47076005)(54906003)(6512007)(36756003)(8676002)(26005)(33656002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 09:29:38.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df7a686-0acf-4a1d-a34e-08d9832ba8d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3101

SGkgSmFuLA0KDQo+IE9uIDI5IFNlcCAyMDIxLCBhdCA5OjI0IGFtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMDkuMjAyMSAyMDoxOCwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiBwcmVsaW5rLm86IEluIGZ1bmN0aW9uIGBwY2llX2Flcl9nZXRfZmly
bXdhcmVfZmlyc3TigJk6DQo+PiBkcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jOjEyNTE6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGFwZWlfaGVzdF9wYXJzZScNCj4+IA0KPj4gQ29tcGlsYXRpb24g
ZXJyb3IgaXMgb2JzZXJ2ZWQgd2hlbiBBQ1BJIGFuZCBIQVNfUENJIGlzIGVuYWJsZWQgZm9yIEFS
TQ0KPj4gYXJjaGl0ZWN0dXJlLiBBUEVJIG5vdCBzdXBwb3J0ZWQgb24gQVJNIHlldCBtb3ZlIHRo
ZSBjb2RlIHVuZGVyDQo+PiBDT05GSUdfWDg2IGZsYWcgdG8gZ2F0ZSB0aGUgY29kZSBmb3IgQVJN
Lg0KPiANCj4gTGlrZSBpaXJjIEp1bGllbiBoYXMgcG9pbnRlZCBvdXQgZm9yIGFub3RoZXIsIHNp
bWlsYXJseSB0aXRsZWQgcGF0Y2gsDQo+ICJzb2x2ZSBjb21waWxhdGlvbiBlcnJvciIgZG9lc24n
dCByZWFsbHkgc2VlbSBhcHByb3ByaWF0ZSBoZXJlLCBhcw0KPiB3aXRoIHRoZSB0cmVlIGF0IHRo
aXMgcG9pbnQgb2YgdGhlIHNlcmllcyBubyBzdWNoIGVycm9yIHNob3VsZCBiZQ0KPiBvYnNlcnZh
YmxlLiBVbmxlc3MgSSdtIG92ZXJsb29raW5nIHNvbWV0aGluZy4NCkkgd2lsIGZpeCB0aGUgY29t
bWVudCBhcyBiZWxvdzoNCg0KeGVuL3BjaTogZ2F0ZSBBUEVJIHN1cHBvcnQgb24gQVJNDQoNCkFQ
RUkgbm90IHN1cHBvcnRlZCBvbiBBUk0geWV0IG1vdmUgdGhlIGNvZGUgdW5kZXINCkNPTkZJR19Y
ODYgZmxhZyB0byBnYXRlIHRoZSBjb2RlIGZvciBBUk0uDQoNClRoaXMgcGF0Y2ggaXMgdGhlIHBy
ZXBhcmF0b3J5IHdvcmsgdG8gZW5hYmxlIEhBU19QQ0kgb24gQVJNIHRvIGF2b2lkIA0KY29tcGls
YXRpb24gZXJyb3Igb24gQVJNLg0KDQpwcmVsaW5rLm86IEluIGZ1bmN0aW9uIGBwY2llX2Flcl9n
ZXRfZmlybXdhcmVfZmlyc3TigJk6DQpkcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jOjEyNTE6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFwZWlfaGVzdF9wYXJzZScgDQoNCj4gIA0KPiBJJ2QgbGlr
ZSB0byBzdWdnZXN0IHRoYXQgd2hlbiB5b3UgcmVjZWl2ZSByZXZpZXcgY29tbWVudHMsIHlvdSBh
cHBseQ0KPiB0aGVtIHRocm91Z2hvdXQgdGhlIHNlcmllcy4gSWYgeW91IGZvbGxvdyB0aGUgYXBw
cm9hY2ggdGFrZSBpbiB0aGUNCj4gb3RoZXIgcGF0Y2ggLi4uDQoNCk9rLiBJIHdpbGwgdGFrZSBj
YXJlIG9mIHRoaXMgaW4gZnV0dXJlIHBhdGNoIHNlcmllcy4NCg0KUmVnYXJkcywNClJhaHVsDQo+
IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+
PiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0K
PiANCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IEph
bg0KPiANCg0K

