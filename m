Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86837B2EBD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 11:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610448.949859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9MS-00036J-84; Fri, 29 Sep 2023 09:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610448.949859; Fri, 29 Sep 2023 09:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9MS-00033g-4Y; Fri, 29 Sep 2023 09:00:36 +0000
Received: by outflank-mailman (input) for mailman id 610448;
 Fri, 29 Sep 2023 09:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGVc=FN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qm9MQ-00033Y-LO
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 09:00:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5d76939-5ea6-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 11:00:33 +0200 (CEST)
Received: from DBBPR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:c0::31)
 by VE1PR08MB5760.eurprd08.prod.outlook.com (2603:10a6:800:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 09:00:27 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::e1) by DBBPR09CA0019.outlook.office365.com
 (2603:10a6:10:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 09:00:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.15 via Frontend Transport; Fri, 29 Sep 2023 09:00:27 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Fri, 29 Sep 2023 09:00:27 +0000
Received: from f64a9214f205.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78C70093-ED52-4FAE-BA8C-A84892E5630C.1; 
 Fri, 29 Sep 2023 08:59:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f64a9214f205.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:59:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VE1PR08MB5869.eurprd08.prod.outlook.com (2603:10a6:800:1b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:59:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 08:59:56 +0000
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
X-Inumbo-ID: a5d76939-5ea6-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7V3x9oVYCnwnwQ0ylQkJgK9flJdUkJoM1L/gTTnOsA=;
 b=lPGk7Y4SzLbtAq9qCqpMM1jW57SrPFz57hDvK9n4LPhsuUFzeWcsGKpDVR/ClhfbmOjje/ytfYidJNKzY+eXj/v0KJKP+VSuL9ZQZw5o1nBGnsNMtrpgIhXpQIQ7szggSugM6kjX7H+RHUJ4Q1CLiwLJyDPPKGeeSmY+TeNre+k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d1df9274edf3210
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH5BSLZGfx98Za4nIfuphyMs+uUTyElTs2BiLVhgNEoK/iVPT5VxKD5mwiUo//6iysKqNkXvML4aEZUmyeDCQ4fauh8IuPp8IXDd7bq/TldO3sHziJr1uuVW2Ht+/bRvkm8oSGUJoqrplVEoq79pum5T/R50XoF0ATaHvs917QtEBWSxqYzxJvvDtRYE3oSq1dTT37VT+wQx5fKwNGbaOEKyAp7kOG+5sM+iJ/YU3ItKlQibg1YMg8kTMFLKkqaF0pYRbSgw25lQvvDQwF5TvF/BTTyVI+3fp5gmaXerzdfrV3Z/69dn4aE0Xw9zqMcqxtAJ5WcPhPpDaMtQpUOjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7V3x9oVYCnwnwQ0ylQkJgK9flJdUkJoM1L/gTTnOsA=;
 b=Qd8HxMO2sR/9Ys7Gb20eS+D2uxVq38lu/rOlvCac38CcpUeFY4i5q9y+GYbmofm4lyDcAwRWBPUkbk9rsx3Rf7dxAN8AUGfh/2ppUtjak52PtU3OrhzpMJGXNY501BM+UCh96bF9X45EfWGw27uWIhMCd/vWQn8QjzOlUqAUNBrwSG+LzZBJXTZ7u8c2iMhJ3YgWsOCj5b/O7NQocPgiow8seeAYsbJLZ7iTkam3U0bErJfyhih7m6wjJlPKU8mIBpA63zjRvioQ8+X2T9aSw+VjftRacggMqUbElTTcGQp8kXHJhLjXcjoXdDwuq9EBHRoZ+5HDh+ZrQyUdS4sAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7V3x9oVYCnwnwQ0ylQkJgK9flJdUkJoM1L/gTTnOsA=;
 b=lPGk7Y4SzLbtAq9qCqpMM1jW57SrPFz57hDvK9n4LPhsuUFzeWcsGKpDVR/ClhfbmOjje/ytfYidJNKzY+eXj/v0KJKP+VSuL9ZQZw5o1nBGnsNMtrpgIhXpQIQ7szggSugM6kjX7H+RHUJ4Q1CLiwLJyDPPKGeeSmY+TeNre+k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH] cpumask: fix integer type in cpumask_first
Thread-Topic: [PATCH] cpumask: fix integer type in cpumask_first
Thread-Index: AQHZ8mQSonovcLbkmUGYIzmbCmvOrrAxaSkAgAAYpIA=
Date: Fri, 29 Sep 2023 08:59:56 +0000
Message-ID: <DD5A5A95-82B2-4886-8B5F-BC75C64CC7FC@arm.com>
References:
 <alpine.DEB.2.22.394.2309281629360.1996340@ubuntu-linux-20-04-desktop>
 <e5815f93-80a4-4628-9eae-98c431c70dcc@xen.org>
In-Reply-To: <e5815f93-80a4-4628-9eae-98c431c70dcc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VE1PR08MB5869:EE_|DBAEUR03FT003:EE_|VE1PR08MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: c063bd42-f811-4cb9-4b3f-08dbc0ca866a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jVr6AKd/v/SmJLiWwbmwKCG8664c3tgFl3K8xk7pqGz+HhsfjL9y1+fjGWp8viHqjC2esrr4vd9Q2VvfQJh11K8rQ22T4V7Pk8ebGwJ99mqR2IPpaU+VvA/NWv1XjGXpjm+ZWFgwiRxTjzxr8EJdc/PCAdXIYknGaMFbdBSicEPGSbovxUZeCLetRJd0NhniONwSw/RhL6n7WCd4hi2TFrTeMFtZen0iO1JbhhYGcfIDGY8KcFXyc9EvPqSwyjcGRRhDv1b6zf18y2+iea34QHuawdPO/vdb7DKSronZsFFEfFUjN4ywVWYT4ADawZUtnBJfwcZ3xs8IX/X8E8IF7oUJSVpuRiALmjBwqegzbbqFr1JKaUYyj1tUPMsCTnfs3Nab4xVqAC408tZ4ul0qggQECdTJdmILQa3t7xl5RqFzDweQj89M8Mvkk506jfwLWTtdTodGWiwJ2c5xvM5jICTydNeioyBPhVegHSFXFNYYjHhP3FzRBGLvsV8+44RHquntZnAx9LcqQm2Hws0GMFqEcTMSSs/1gq1hcmiBrpqkCnsJvDbwLzNnfEveMObIjHxGuDLk1hVeWmjthW4s7qeN3Tejux0smZcsxqf8xK4UHmd5GwoPH+9LUa90zSYT8TA9+7QxP8MkSVaMjCPPig==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39850400004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(6506007)(53546011)(122000001)(86362001)(36756003)(38100700002)(38070700005)(33656002)(26005)(2906002)(71200400001)(6512007)(6486002)(478600001)(8936002)(8676002)(5660300002)(4326008)(41300700001)(76116006)(66446008)(66476007)(66556008)(91956017)(64756008)(54906003)(6916009)(316002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B43041B3C579B46955A93456CB621BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5869
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f91aef8-70a3-4bf9-39a7-08dbc0ca73c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	St1822YuEQIXbATna2iHrqp0ye32m7iX5tb9hAXj5v9CoW9WRDb+yeDOA9WixBarQ5rXbIGSXo33ukLdrJWPalHZwgxTNvuOLGfdi+K5Y65zX8vEF6mfiIFiWoKolscc7OPt5kmXOjxlpFTxUfET33kiCcsheWW8aBef0mMH16nkrY/3ZRj/JEiS/kBZ7nXkK/7iKVaElR62FalpdBHegFmmkP8fT0OmH10RDHJnFUtrHYVd5N9NJKj7+esEc3A7hmjwW2rwFbdaLzFULxznK18hhjcjyX9RhVwD5Im/habvYi0KYSl9A/EjyZZL3nQdYFvhoHEiTneclqKhezxhQupFHR0VfHPn+BacL1gfxdbkDMAATk+EoruBEZLYPEbYS42+Yo8WdQx+JlyXxZRaH6KF/dEm3ksyrXktOehkkMxx42GPOxhGMF+yjckujMg/lTrsKmdAg1XcvXpyeaSH2uQvj4NSjdMguW30huu9WvnWzYE8uC1r6BAvCmXUZTyU3B3WJ8oScFeizVqMxQswOxtboLF/T0hJw1EIzMnkjfckCb7r1LcKomD90nwdk/NyMuLF8tlBKSCk95fSwSA+GQ32gdVoQ6SiRyVHAzpYUws2V8lnKlLo6iGKJ3EX3twHe8YbpYB3TLBOk451lsKbyjsIq6q9G0K62Qnrgg5Zdp8RyDoepYQ6O67vfTw+9js77yBykffojIuiqQ4n2LBW2w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(376002)(346002)(396003)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(46966006)(36840700001)(8676002)(478600001)(6862004)(8936002)(40480700001)(336012)(26005)(4326008)(2906002)(70206006)(5660300002)(70586007)(41300700001)(54906003)(316002)(6506007)(53546011)(6486002)(6512007)(47076005)(2616005)(36860700001)(36756003)(33656002)(356005)(86362001)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 09:00:27.3940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c063bd42-f811-4cb9-4b3f-08dbc0ca866a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5760

DQoNCj4gT24gMjkgU2VwIDIwMjMsIGF0IDA4OjMxLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIFN0ZWZhbm8sDQo+IA0KPiBPbiAyOS8wOS8yMDIzIDAwOjMy
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBucl9jcHVfaWRzIGlzIHVuc2lnbmVkIGlu
dCwgYnV0IGZpbmRfZmlyc3RfYml0IHJldHVybnMgdW5zaWduZWQgbG9uZyAoYXQNCj4+IGxlYXN0
IG9uIGFybSkuDQo+IA0KPiBmaW5kXyogYXJlIG1lYW50IHRvIGJlIHVzZWQgYnkgY29tbW9uIGNv
ZGUuIFNvIEkgdGhpbmsgdGhlIGZpcnN0IHN0ZXAgaXMgdG8gY29ycmVjdCB0aGUgcmV0dXJuIHR5
cGUgc28gaXQgaXMgY29uc2lzdGVudCBhY3Jvc3MgYWxsIGFyY2hpdGVjdHVyZXMuDQo+IA0KPiBJ
IGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB3aGV0aGVyIHRoZXkgc2hvdWxkIGFsbCBy
ZXR1cm4gJ3Vuc2lnbmVkIGxvbmcnLg0KPiANCj4gVGhlbiB3ZSBjYW4gZGlzY3VzcyBpZiB0aGUg
TUlTUkEgcnVsZSBpcyBzdGlsbCB2aW9sYXRlZC4NCj4gDQo+PiBVc2UgdGhlIGxhcmdlciB0eXBl
IGZvciBtaW5fdCB0byBhdm9pZCBsYXJnZXItdG8tc21hbGxlcg0KPj4gdHlwZSBhc3NpZ25tZW50
cy4gVGhpcyBhZGRyZXNzIDE0MSBNSVNSQSBDIDEwLjMgdmlvbGF0aW9ucy4NCj4gDQo+IEkgZmlu
ZCBpbnRlcmVzdGluZyB5b3UgYXJlIHNheWluZyB0aGlzIGdpdmVuIHRoYXQuLi4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+
DQo+PiAtLS0NCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY3B1bWFzay5oIGIveGVu
L2luY2x1ZGUveGVuL2NwdW1hc2suaA0KPj4gaW5kZXggOTgyNjcwNzkwOS4uYTZlZDZhMjhlOCAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jcHVtYXNrLmgNCj4+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi9jcHVtYXNrLmgNCj4+IEBAIC0yMDgsNyArMjA4LDcgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGNwdW1hc2tfY29weShjcHVtYXNrX3QgKmRzdHAsIGNvbnN0IGNwdW1hc2tfdCAqc3Jj
cCkNCj4+ICAgIHN0YXRpYyBpbmxpbmUgaW50IGNwdW1hc2tfZmlyc3QoY29uc3QgY3B1bWFza190
ICpzcmNwKQ0KPj4gIHsNCj4+IC0gcmV0dXJuIG1pbl90KGludCwgbnJfY3B1X2lkcywgZmluZF9m
aXJzdF9iaXQoc3JjcC0+Yml0cywgbnJfY3B1X2lkcykpOw0KPj4gKyByZXR1cm4gbWluX3QodW5z
aWduZWQgbG9uZywgbnJfY3B1X2lkcywgZmluZF9maXJzdF9iaXQoc3JjcC0+Yml0cywgbnJfY3B1
X2lkcykpOw0KPiANCj4gLi4uIGNwdW1hc2tfZmlyc3QoKSBpcyByZXR1cm4gJ2ludCcuIFNvIHJh
dGhlciB0aGFuIGZpeGluZyBpdCwgeW91IHNlZW0gdG8gaGF2ZSBqdXN0IG1vdmVkIHRoZSB2aW9s
YXRpb24uDQo+IA0KPj4gIH0NCj4+ICAgIHN0YXRpYyBpbmxpbmUgaW50IGNwdW1hc2tfbmV4dChp
bnQgbiwgY29uc3QgY3B1bWFza190ICpzcmNwKQ0KDQpJ4oCZdmUgYWxzbyBmb3VuZCB0aGF0IGZp
bmRfZmlyc3RfYml0IHJldHVybnM6DQoNCiAtIHVuc2lnbmVkIGludCBvbiB4ODYNCiAtIHVuc2ln
bmVkIGxvbmcgb24gcHBjDQogLSB1bnNpZ25lZCBsb25nIG9uIGFybTY0DQogLSBpbnQgb24gYXJt
MzIgKHNlZW1zIHRoYXQgdmFsdWUgaXMgYWx3YXlzID49IDANCg0KU28gbWF5YmUgdGhleSBjYW4g
YmUgYWxsIHVuc2lnbmVkIGludCwgYW5kIGNwdW1hc2tfZmlyc3QgY2FuIGJlIGFzIHdlbGwgdW5z
aWduZWQgaW50Pw0KDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwN
Cj4gDQoNCg==

