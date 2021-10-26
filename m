Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929B43AD32
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 09:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216255.375784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfGs4-0004Wu-Fn; Tue, 26 Oct 2021 07:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216255.375784; Tue, 26 Oct 2021 07:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfGs4-0004Tz-Cl; Tue, 26 Oct 2021 07:27:44 +0000
Received: by outflank-mailman (input) for mailman id 216255;
 Tue, 26 Oct 2021 07:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sep+=PO=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mfGs2-0004Ta-DS
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 07:27:42 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33ae9a86-362e-11ec-8428-12813bfff9fa;
 Tue, 26 Oct 2021 07:27:41 +0000 (UTC)
Received: from AS9PR04CA0049.eurprd04.prod.outlook.com (2603:10a6:20b:46a::34)
 by VI1PR08MB3853.eurprd08.prod.outlook.com (2603:10a6:803:c1::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 07:27:38 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::ac) by AS9PR04CA0049.outlook.office365.com
 (2603:10a6:20b:46a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Tue, 26 Oct 2021 07:27:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 07:27:37 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Tue, 26 Oct 2021 07:27:37 +0000
Received: from a039ef808677.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71EFBF57-0FA4-4F0C-A255-0F052432569E.1; 
 Tue, 26 Oct 2021 07:27:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a039ef808677.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Oct 2021 07:27:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6056.eurprd08.prod.outlook.com (2603:10a6:20b:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 07:27:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 07:27:29 +0000
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
X-Inumbo-ID: 33ae9a86-362e-11ec-8428-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbz1gC+yxerDSmJOGo9iWMynpiElyeY8+CzWmPlMaIA=;
 b=TVX2wC8FWpaZlt43459egi3TfqBqvyo89VMiMXqzQNq3yz6nj6wKazuoOLbSb33MQuHwf8czg8Z2nor+PhVLExu5pMxSLzdCU8VXLBNMU0mc6OfKuVewctTWemkGMZeUTpcst50XFUzSjBgT682Y59q1lMjxYYOw6JZu/M/aj2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8ec92bf9c8ee7ae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO6wKx/AGehrhQl7YFU6GcapItXTPGRX5G0EiazToj9bdZ/4atVjpfVtuILd3/vGZrR8wltiNbfkznWU5/24h8IMUSYvw1K6JXD7Knyybg7vDNcYE6eM8UjZkngJd3HGgVX+uu8wXTp5uTLsa33kn/svE8K6ZIj4OzzWm4avhnI/PiP/+lA+bU52MoPIjlRKyvXq6bfYcKnTweHSZCmCX4Uah9/QRK+zwJVWXl3G9mQWUZvb/BLoLEHgdEpN/1IYUB5dnCh/nWRTApK72y3XeOSrTbYyD6bl9uKcl+Gtyf76wTseJipplSf6e7EEGsP2mAFvEJT2RAz4nBZpUkcyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbz1gC+yxerDSmJOGo9iWMynpiElyeY8+CzWmPlMaIA=;
 b=aIYnmaZtsABjTRPr7SbLOpO94VBpcMa7VhD00eP3zSrEmN45V3/DyXQ41F+bS+fvWi13an3lMshVGTZcCBiCVg8z145LHccf70svFG1y9c1TQI/SETyZjL38+RqwoBp6K5L/skozK7AOq760UsjrfFOBO9PSUM3GUbBMfwd7BeYuKHuBVvHMRTAQr7QZFv79CHNpYlgj8hmOUL13Mw76sJZQH0FwRRIrKm1onlJrtbf5+9pGmw7goGbs4CZe1uNPULms3U8W6KrVYyQNzHyb+TgHUEvCLF9tBOvJmqyQCMNDbKTu6RG0Wwcb+wjMKWRfKY6nQT07alelOoRCkJ4qeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbz1gC+yxerDSmJOGo9iWMynpiElyeY8+CzWmPlMaIA=;
 b=TVX2wC8FWpaZlt43459egi3TfqBqvyo89VMiMXqzQNq3yz6nj6wKazuoOLbSb33MQuHwf8czg8Z2nor+PhVLExu5pMxSLzdCU8VXLBNMU0mc6OfKuVewctTWemkGMZeUTpcst50XFUzSjBgT682Y59q1lMjxYYOw6JZu/M/aj2s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: George Dunlap <George.Dunlap@citrix.com>, "dunlapg@umich.edu"
	<dunlapg@umich.edu>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "committers@xenproject.org"
	<committers@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] governance: communication channels
Thread-Topic: [PATCH v2] governance: communication channels
Thread-Index: AQHXygtmvmq8MpkV4UGUOhm0oDJDQqvk4cUA
Date: Tue, 26 Oct 2021 07:27:29 +0000
Message-ID: <F3071594-3327-40B4-A0C2-D3EAD591DF74@arm.com>
References: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d75150b0-3fd1-401d-f24f-08d998521627
x-ms-traffictypediagnostic: AS8PR08MB6056:|VI1PR08MB3853:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3853A998722AED33B04308229D849@VI1PR08MB3853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wTGkzmNOyotU1Tm5GclIc0OtMQkshzbHdRaCtApZ+CmuQVk2XhuzgDdwQlMoV8ITQOh2H7xCmBvzmPf3ho4gGbVOk1YXGNpJJmIDTfVmdtCxyxNGglmo3PefgjJgywEXaqoIw2WvQQ6d+L/4H5TJfXcaXgYOAXmT8lxaM2vf6F/GlV9274J661Vp/xrQvXDzkq/5nCQ3nYWR8QHyKNr9kcdaK+6USN7kf997V2KKbxw6Y/ZmqhRQicZhpQp1RGEW8M9JvzISAQlEhOXqssDW8ZK4/mFgVuHiSZiOVFY2Q7QrFPjZCUZ8oW8xs417MG3SvZ9PNqdeJsbIfiMF/VQalvTXRHzhv3T6TkXIKaoJlA/4SiDR5aPvrJ1zy2SWlnpjpNwbFoioSViYEi5PYhKQjPWU8ThoVcqcBhN1dXmlCT+K/ZNX1Iskf3qPW60O5D+b+FvpvfodiAOD03vHNuwkZbo8DcOlbv75iJ8zhKcv1H2v1VIyLSIffnC7JZhEq4dhKpwEWU1XGfGWy9hm9DLbflGsVy+DfjGKW0K9DX3UWHmbmG5NPzWSAdn5pELlnJb/4/hQLQjcgG8OKAdQCOdzubrbFApwUliAD7WBr3jrIzfvyLyiQYbsIkuMQAJ56/ssTO8vqMgla/JWmO3PMsyKIjO+49/9XBYrJRRb12Y+B++4BTJVCrRqbB5e/LsM/58cxYhzMxAiNOapKIT88+ajxodjeNpP8npCR1f6TenTaazTWi525KMSPPXkncCHyNrVjF4YknFoCcBOzB+pN/EGri2x2xY2vATb5JX64EV06ZzBjM4yljPgDKqjy2NHIlEFVCoJuN+dv4UmjWLiyvp9gKNtiOIWhiU8MeTfwsBnJLQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6916009)(26005)(5660300002)(86362001)(71200400001)(6512007)(91956017)(122000001)(8676002)(53546011)(2906002)(2616005)(54906003)(76116006)(966005)(36756003)(66946007)(316002)(66476007)(33656002)(66556008)(64756008)(66446008)(83380400001)(6486002)(38100700002)(4326008)(8936002)(38070700005)(508600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A260321B1F6496408564D3FA25F60218@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6056
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76c9e25f-7cd5-473a-44f7-08d998521160
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iJPXu1eWnlKbbGcTPD+IlG6Kz74qY6HUqBXZUiNExrbml+lcf1PmLhv4aVKykUq/aQMgwmDLf/r2pQ2q3IKAd6llbV2RyFaVrKuv4N44BM7KCiegSzFuw3bPGnQhq+gxAmBHqlMZpRGGqv2+2YFtYU4Hw+tWNmf/NnW5km9J79vDbO2ec13Ps9y3bmWrz/dGPGUBEssHRAb6edthny7jS9fPKxMu26vFdeVrF2kRfOQUHbmA9ShneeMK0K4bpDohYTsBxJ1Evz1PuVhkWUF26haQ6QGyPQBkh3E8V5HKcw1cYCqUjEJ+w/C+KKLx6ZfPR+ij3mRMpzGKOoVQprQtHlY8S3Gnsi3sL8E8lki4O5YulGzJbD9Z+J7Fk7fgOPcdgPGlv3y3Apt/Uq6qbuCZYbHCGgeLuVBQi07JmWHbA5EbXprDD2rMH2pjwkeCmVlz+SdRD5t+FisPEiZEx5r0vpIND2X2rebZU2wKM2fbskaSn405fCNlkOZy17Wci7sO2KIuispX9STza46ZGX4QS2QEdFVpJdvQIbUg2jqzVoZCcC7HrH9JuaMDhXWw5j5cidSCubXdFzMTuiFpjb+aQQKKBbEG5AzkqTpTLrGR/9WP/wNx8u6oSRRj4BFl1k3qLtPXxS+Cl8xno7ToF7jw72Y1HJ98eUGBWv3DZ9GFdRYoEPP65+yLC4eES0QZEk2yWa94ZKYiZb+Ok9NIcJqQ3tnPmGyrs9XXReT2gQRSxH5RHjO8sbWE7aDJHjNRXi9S9rEHSpsy0nBAw9WpG/YaDKcpOTvE3uOX+V8rNtUpObYP5TmkhQT6alBujMHLorxk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6512007)(2616005)(5660300002)(36756003)(8676002)(53546011)(26005)(82310400003)(33656002)(54906003)(86362001)(356005)(508600001)(6862004)(81166007)(8936002)(6506007)(36860700001)(6486002)(47076005)(316002)(70586007)(70206006)(83380400001)(336012)(186003)(4326008)(2906002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 07:27:37.5473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d75150b0-3fd1-401d-f24f-08d998521627
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3853

SGkgU3RlZmFubywNCg0KPiBPbiAyNiBPY3QgMjAyMSwgYXQgMDI6NDYsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBDbGFyaWZ5IHRoYXQg
eGVuLWRldmVsIGlzIHRoZSBvbmx5IG9mZmljaWFsIGNvbW11bmljYXRpb24gY2hhbm5lbC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5p
QHhpbGlueC5jb20+DQpSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFy
cXVpc0Bhcm0uY29tPg0KDQpKdXN0IGZvciBteSBrbm93bGVkZ2UsIHdoZXJlIGlzIHRoaXMgZmls
ZSBzdG9yZWQgKGFzIGl0IGlzIG5vdCBpbiB4ZW4uZ2l0KSA/DQoNCkNoZWVycw0KQmVydHJhbmQN
Cg0KPiANCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gcmVtb3ZlIG1lbnRpb25zIG9mICN4
ZW5kZXZlbCBvbiBPRlRDDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291cmNlL2NvbW11bmljYXRpb24t
cHJhY3RpY2UucnN0IGIvc291cmNlL2NvbW11bmljYXRpb24tcHJhY3RpY2UucnN0DQo+IGluZGV4
IDcwZjViOGMuLjJjZTJhNGUgMTAwNjQ0DQo+IC0tLSBhL3NvdXJjZS9jb21tdW5pY2F0aW9uLXBy
YWN0aWNlLnJzdA0KPiArKysgYi9zb3VyY2UvY29tbXVuaWNhdGlvbi1wcmFjdGljZS5yc3QNCj4g
QEAgLTksNiArOSwyMCBAQCBUaGlzIGd1aWRlIHByb3ZpZGVzIGNvbW11bmljYXRpb24gQmVzdCBQ
cmFjdGljZSB0aGF0IGhlbHBzIHlvdSBpbg0KPiAqIEJlaW5nIGF3YXJlIG9mIHlvdXIgb3duIGFu
ZCBjb3VudGVycGFydOKAmXMgY29tbXVuaWNhdGlvbiBzdHlsZSBhbmQgY3VsdHVyZQ0KPiAqIFNo
b3cgZW1wYXRoeSB0b3dhcmRzIG90aGVyIGNvbW11bml0eSBtZW1iZXJzDQo+IA0KPiArQ29tbXVu
aWNhdGlvbiBDaGFubmVscw0KPiArPT09PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICtBbGwg
aW1wb3J0YW50IGNvbW11bmljYXRpb25zIGFuZCBtZXNzYWdlcyBzaG91bGQgYmUgc2VudCB0byB0
aGUNCj4gK2B4ZW4tZGV2ZWwgPDEwXz5gXyBtYWlsaW5nIGxpc3QsIHdoaWNoIGlzIHRoZSBvbmx5
IG9mZmljaWFsIGNoYW5uZWwgZm9yDQo+ICtjb2RlIHN1Ym1pc3Npb25zLCBhY2tzLCBjb2RlIHJl
dmlld3MsIGFuZCBkZWNpc2lvbi1tYWtpbmcuDQo+ICsNCj4gK0luIHRoZSBtb2Rlcm4gY29ubmVj
dGVkIHdvcmxkIHRoZXJlIGFyZSBzZXZlcmFsIG90aGVyIGNvbW11bmljYXRpb24NCj4gK2NoYW5u
ZWxzIGF2YWlsYWJsZSBhdCBhbnkgZ2l2ZW4gdGltZSwgaW5jbHVkaW5nIG9ubGluZSBtZWV0aW5n
cyBhbmQgSVJDLg0KPiArSG93ZXZlciwgZGlzY3Vzc2lvbnMgb24gbWVkaWEgb3RoZXIgdGhhbiB0
aGUgeGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiArc2hvdWxkIGJlIHN1bW1hcml6ZWQgYW5kIHNl
bnQgdG8geGVuLWRldmVsIHRvIHJlYWNoIGEgd2lkZXIgYXVkaWVuY2UsDQo+ICtmb3IgcmVjb3Jk
LWtlZXBpbmcsIGFuZCB0byBtYWtlIGNvZGUgc3VibWlzc2lvbnMsIGFja3MsIGFuZCBjb2RlIHJl
dmlld3MNCj4gK29mZmljaWFsLg0KPiArDQo+IENvZGUgcmV2aWV3cyBmb3IgKipyZXZpZXdlcnMq
KiBhbmQgKipwYXRjaCBhdXRob3JzKioNCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gQEAgLTU3NiwzICs1OTAsNCBAQCBob3cgdG8g
YXZvaWQgYW5kIHJlc29sdmUgaXNzdWVzLg0KPiAuLiBfNjogaHR0cHM6Ly94ZW5wcm9qZWN0Lm9y
Zy9oZWxwL2lyYy8NCj4gLi4gXzg6IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0VyaW5f
TWV5ZXINCj4gLi4gXzk6IGh0dHBzOi8vd3d3Lm5zZi5nb3YvYXR0YWNobWVudHMvMTM0MDU5L3B1
YmxpYy8xNUxGV19Xb3JraW5nV2l0aE11bHRpY3VsdHVyYWxUZWFtc19MYXJzb25DLnBkZg0KPiAr
Li4gXzEwOiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVsDQoNCg==

