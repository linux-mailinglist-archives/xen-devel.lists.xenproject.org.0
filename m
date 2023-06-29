Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C3742DB5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557052.870073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExT3-0008I7-Pg; Thu, 29 Jun 2023 19:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557052.870073; Thu, 29 Jun 2023 19:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExT3-0008GI-Ml; Thu, 29 Jun 2023 19:38:13 +0000
Received: by outflank-mailman (input) for mailman id 557052;
 Thu, 29 Jun 2023 19:38:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOj0=CR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qExT2-0008Fq-1A
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:38:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a673eb3-16b4-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 21:38:09 +0200 (CEST)
Received: from ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::6) by
 AS8PR08MB9840.eurprd08.prod.outlook.com (2603:10a6:20b:613::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 19:38:07 +0000
Received: from VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:21:cafe::5f) by ZR0P278CA0055.outlook.office365.com
 (2603:10a6:910:21::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Thu, 29 Jun 2023 19:38:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT029.mail.protection.outlook.com (100.127.145.13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Thu, 29 Jun 2023 19:38:06 +0000
Received: ("Tessian outbound 7c913606c6e6:v142");
 Thu, 29 Jun 2023 19:38:05 +0000
Received: from 4e4229fd9c29.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F0739FE-8010-42DF-A6C5-219867932668.1; 
 Thu, 29 Jun 2023 19:37:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e4229fd9c29.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 19:37:54 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB5PR08MB10189.eurprd08.prod.outlook.com (2603:10a6:10:4a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 19:37:49 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 19:37:48 +0000
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
X-Inumbo-ID: 7a673eb3-16b4-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Io4JZw78Ahog/gMx754TA6O4PeVpjG86K2TDSCQxO4=;
 b=YFS00vuXbF639CajfS+0Qx7SA3J6ecqimkjnvtwZn2l6jFdTmPUxr3TsEjleGVFKqkRngJCdJRnmQA9FbwQrDNignoa6uLLv7rOqU+z3fgCUnAw6MSfuJSm+/X3P8lj0yaTkNeQu0327tlfEOCCMQmGM1cZ29GnZZiwTvQqLkXw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35c7c28a31d35d4f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ackkMgzQygp1+r91vhXRByNSZ+EzRIWXRZahReMrYNypgnVg6u5xC0RvmEPKbwv2JQphVncCVI5swIMXNy7dvVlYy2S2tdYasQ6zyESP9VbwGHh+5QBqtN9Q7qr3f1ESYT+PQ8nXoSfTpEUhGWWjG6bAmwz9Aq70ISAJYZDA1dmLHy+uLLsUeElZWT6yxqK8MrnqU+/aL1TvhGyyeKOk2hImssfkB0aXOZTC+5GdbHNGkBSFXPY3W29h4HDMKH/nz4D41RFUR1qrcPKA9ZVxBrWR+daVQfQmMolvJvRwD3BGmRgFhUlzSPkn3pSN6Oqc1ObapcpJ2/4prI2lB1TjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Io4JZw78Ahog/gMx754TA6O4PeVpjG86K2TDSCQxO4=;
 b=I8TkkG/E3smVQ0magcAiaGB/xEWqTDF9tAl4oWcnhJtTpTkwJKrPQL+FwqqJ2NhjLIDroYZsalZvfke0TmmiIOqlYoZYnd202BHhF0ptk8Ut3vwgq+nDoFAlmDmW7A6mEp7OnLpZ9RBBvloo2a2Cu4rSgDDNQhHohbyiP4NvQSYmBqL998AJyE0Ip3Bt6VfpbxCtlF0QuV91e5Q4MiVypqWvzsHw5fh4sxOImGZugYM340JrJ3k3mZdkSt+6NPzFFsGG97LEMUhfTG+H8iKt9XMl5JbI87SdP+ef+iML9EgQHgryvdRPrXJciSpW/G6XSVocAfRwuDfupNf8b3+7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Io4JZw78Ahog/gMx754TA6O4PeVpjG86K2TDSCQxO4=;
 b=YFS00vuXbF639CajfS+0Qx7SA3J6ecqimkjnvtwZn2l6jFdTmPUxr3TsEjleGVFKqkRngJCdJRnmQA9FbwQrDNignoa6uLLv7rOqU+z3fgCUnAw6MSfuJSm+/X3P8lj0yaTkNeQu0327tlfEOCCMQmGM1cZ29GnZZiwTvQqLkXw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, "ayan.kumar.halder@amd.com"
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Thread-Topic: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Thread-Index: AQHZqnGGeSRo6D9TDkKPQE/VGyIB1K+h4SyAgABHf4CAAATEAA==
Date: Thu, 29 Jun 2023 19:37:48 +0000
Message-ID: <433ACDBB-3DA8-461B-A500-268F7E6F674E@arm.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com>
 <771A1A80-0FC6-4D20-84FE-DA0A2DCFF14B@arm.com>
 <alpine.DEB.2.22.394.2306291218350.3936094@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2306291218350.3936094@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB5PR08MB10189:EE_|VI1EUR03FT029:EE_|AS8PR08MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: d854ec38-11d9-40d6-01ba-08db78d85c71
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qE/Tu3RnUEk/rmzbync9dELl0v7asJiF6sVnwNWS6DB5n+BSTcl93PCDU0z5jr/dxhqSQmY0zrZECJLsSC1762KAV0P2tF4e2ixSLn3ylcHoeAP281bnJ4c4rMe2tIPdLmBpRCSIuCJeg+Lp1q2A3DKD4ViJj69XbwW0K9khJc2XiAPsAhGE+RNA9L9vZQlL2K9KZIIYTnTtz+BidQnk4Jrvwpf+ZEtvEwY558NiOZBOixHit8i7X2eqMjW5d3/kPSzsvia4EGuM/7oJaHeIlntzzImgtPJMYXBrigJcM4dI2KbVO6Awzj88jmsuNw23Kbj1o1tIJytQf3qOtQlbYAB0sO9S4ysotlJXGrQgiojsU3y4ijj94ncCtGaby5u4c7ZlwQM/zW975XLCuIQyRM+lUVBCTthWyVjXAdfs0CLecGgoiymVQHPxTp6ro+5V1+3gzKQejxw9Kn7HtQA3cE3Te7U0nzW9YtE3j35ZEIbh2Yq66uWefKCYWmyXQGHE6NR98qm5fJopLBWc5bLb4XDdaZQRdN/1ZIBmNoLSuStm3SmcNVJuWNMc+48es5thsmq93ANZnjCMiQmNlsiQOu4yHGA2n2iULiQ2N4Erkr/Lpygf8GNwhAJPSx7Du+x6es3eaTeibNnIe9jWBAF50Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(41300700001)(6512007)(316002)(83380400001)(86362001)(38070700005)(186003)(53546011)(6506007)(26005)(2616005)(7416002)(2906002)(33656002)(38100700002)(122000001)(5660300002)(8676002)(8936002)(36756003)(71200400001)(54906003)(4326008)(66556008)(66476007)(66446008)(64756008)(76116006)(478600001)(66946007)(6486002)(6916009)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E64E608C4744DC47A4445840BB7258BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10189
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb3a4a4e-22b1-412d-66d2-08db78d851e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p+Vg4HUixE1xKvDeNh1Rd6pEKaEMbVmmgxcBpEqvhKc7Q53OgdDWmWpCWvtbLs7hH1uI/Agiv+/HG1Ydl1B8GFO66yJgrsm6q4iPM6+w+miBKJjGxua1g9zU6b933cAyPkiVup+qxItHPZjzw1OJdFjhxpo9RuNuXL4agExdLwxsakhpICzxU9KAaHS0ojg3VNfkNvjKiE2PFcZQOAuvUVQ2+laBbLb9LB4iW0Lejw7T46PoMdyecLA4L0ypyU+9K2awO5eBR1JqpmIzFtvNzYeQ3cGS7wRRgwxIcupcOzOdmbPDVb3xlOBhvDBLiSQV+g1RH5jltCQx8CSwyPkZG7DPkAExfD6fD3i9LiR1D9U+1jVMqj2zUlYkprrJOmRlDsKADz18+ZIVzJZGAvUS6MvNOKjMiDOlNzAerJWTuXKOFQPXqKMX1L5D6KqYJBvGVXMdYvIrpVQfCHA/k4SsG5mnrZ/NML0+f97yC0m+C36qeInvkyy3KqSw3oDAZY/vuW3CEs54w8sqCF8kSEisbpAD0uUBkQlpJDozBT3DhVboobIOZGK0LQiuGyOM3F7SW2+5G5cRt2zGQwNMDsuOTtYvDvlr9aXux1kLlC/cWI6BHaLR0GTovNydPhUXvqqqAFgc0R3FT8bpuskDyTtRyr8gIFXRCQqSweZj9HE8Lx50T4Q/DLW+8th1HkQyGhBc//s1lwq9xc8n+A8HSrlvSMXWH2Nl2PeIjgLkub8PJAVqEknz14F3qStzvG9xpmko
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(4326008)(33656002)(478600001)(70206006)(36756003)(316002)(70586007)(8936002)(8676002)(6862004)(2906002)(6512007)(40460700003)(36860700001)(54906003)(41300700001)(6486002)(82310400005)(40480700001)(186003)(6506007)(47076005)(26005)(336012)(53546011)(356005)(86362001)(83380400001)(82740400003)(81166007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 19:38:06.0673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d854ec38-11d9-40d6-01ba-08db78d85c71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840

DQoNCj4gT24gMjkgSnVuIDIwMjMsIGF0IDIwOjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAyOSBKdW4gMjAyMywgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+PiBPbiAyOSBKdW4gMjAyMywgYXQgMTE6MDYsIE5pY29sYSBW
ZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gSW4g
dGhlIGZpbGVzIG1vZGlmaWVkIGJ5IHRoaXMgcGF0Y2ggdGhlcmUgYXJlIGEgZmV3IG9jY3VycmVu
Y2VzIG9mIG5lc3RlZCAnLy8nDQo+Pj4gY2hhcmFjdGVyIHNlcXVlbmNlcyBpbnNpZGUgQy1zdHls
ZSBjb21tZW50IGJsb2Nrcywgd2hpY2ggdmlvbGF0ZSBSdWxlIDMuMS4NCj4+PiBUaGUgcGF0Y2gg
YWltcyB0byByZXNvbHZlIHRob3NlIGJ5IHJlbW92aW5nIHRoZSBuZXN0ZWQgY29tbWVudHMuDQo+
Pj4gDQo+Pj4gSW4gdGhlIGZpbGUgJ3hlbi9jb21tb24veG1hbGxvY190bHNmLmMnIHRoZSBjb21t
ZW50IGhhcyBiZWVuIHJlcGxhY2VzIGJ5DQo+PiANCj4+IFR5cG86IHMvcmVwbGFjZXMvcmVwbGFj
ZWQvDQo+PiANCj4+PiBhbiBBU1NFUlQsIHRvIGVuc3VyZSB0aGF0IHRoZSBpbnZhcmlhbnQgaW4g
dGhlIGNvbW1lbnQgaXMgZW5mb3JjZWQuDQo+Pj4gDQo+Pj4gSW4gdGhlIGZpbGUgJ3hlbi9pbmNs
dWRlL3hlbi9hdG9taWMuaCcgdGhlIG5lc3RlZCBjb21tZW50IGhhcyBiZWVuIHJlbW92ZWQsDQo+
Pj4gc2luY2UgdGhlIGNvZGUgc2FtcGxlIGlzIGFscmVhZHkgZXhwbGFpbmVkIGJ5IHRoZSBwcmVj
ZWRpbmcgY29tbWVudC4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGEgVmV0cmluaSA8
bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQo+PiANCj4+IFNhbWUgYXMgcGF0Y2ggMiwgbWlz
c2luZyDigJwtLS0iDQo+PiANCj4+PiBDaGFuZ2VzOg0KPj4+IC0gUmVzZW5kaW5nIHRoZSBwYXRj
aCB3aXRoIHRoZSByaWdodCBtYWludGFpbmVycyBpbiBDQy4NCj4+PiBDaGFuZ2VzIGluIFYyOg0K
Pj4+IC0gU3BsaXQgdGhlIHBhdGNoIGludG8gYSBzZXJpZXMgYW5kIHJld29ya2VkIHRoZSBmaXg7
DQo+Pj4gLSBBcHBseSB0aGUgZml4IHRvIHRoZSBhcm0zMiBgZmx1c2h0bGIuaCcgZmlsZSwgZm9y
IGNvbnNpc3RlbmN5Lg0KPj4+IENoYW5nZXMgaW4gVjM6DQo+Pj4gLSBSZXBsYWNlZCBjb21tbWVu
dGVkLW91dCAnaWYnIHdpdGggYW4gQVNTRVJUKCAqZmwgPj0gMCApLg0KPj4+IC0tLQ0KPj4+IHhl
bi9jb21tb24veG1hbGxvY190bHNmLmMgfCA0ICstLS0NCj4+PiB4ZW4vaW5jbHVkZS94ZW4vYXRv
bWljLmggIHwgMiArLQ0KPj4+IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPj4+IA0KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3htYWxsb2NfdGxz
Zi5jIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYw0KPj4+IGluZGV4IDc1YmRmMThjNGUuLjk1
YWZmY2M1NzEgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYw0KPj4+
ICsrKyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMNCj4+PiBAQCAtMTQwLDkgKzE0MCw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBNQVBQSU5HX1NFQVJDSCh1bnNpZ25lZCBsb25nICpyLCBpbnQg
KmZsLCBpbnQgKnNsKQ0KPj4+ICAgICAgICAqZmwgPSBmbHNsKCpyKSAtIDE7DQo+Pj4gICAgICAg
ICpzbCA9ICgqciA+PiAoKmZsIC0gTUFYX0xPRzJfU0xJKSkgLSBNQVhfU0xJOw0KPj4+ICAgICAg
ICAqZmwgLT0gRkxJX09GRlNFVDsNCj4+PiAtICAgICAgICAvKmlmICgoKmZsIC09IEZMSV9PRkZT
RVQpIDwgMCkgLy8gRkwgd2lsbCBiZSBhbHdheXMgPjAhDQo+Pj4gLSAgICAgICAgICpmbCA9ICpz
bCA9IDA7DQo+Pj4gLSAgICAgICAgICovDQo+Pj4gKyAgICAgICAgQVNTRVJUKCAqZmwgPj0gMCAp
Ow0KPj4gDQo+PiBJ4oCZdmUgY2hlY2tlZCB0aGUgY29kZWJhc2UgZm9yIHVzYWdlIG9mIEFTU0VS
VCwgYnV0IEnigJl2ZSBub3Qgc2VlbiB1c2Ugb2YgaXQgd2l0aCBzcGFjZXMNCj4+IGJlZm9yZSBh
bmQgYWZ0ZXIgdGhlIGNvbmRpdGlvbiAobGlrZSBvdXIgaWYgY29uZGl0aW9ucykgc28gSSB0aGlu
ayB0aGV5IGNhbiBiZSBkcm9wcGVkLg0KPiANCj4gWWVzLCB0aGF0J3MgcmlnaHQuIEkgYW0gT0sg
d2l0aCB0aGlzIHBhdGNoIGJ1dCBJIHRoaW5rIHdlIHNob3VsZCB3YWl0DQo+IGZvciBKYW4ncyBh
Y2sgdG8gYmUgc3VyZS4NCj4gDQo+IEFuIGFsdGVybmF0aXZlIHRoYXQgSSBmZWVsIG1vcmUgY29t
Zm9ydGFibGUgaW4gQWNraW5nIG15c2VsZiBiZWNhdXNlIGl0DQo+IGRvZXNuJ3QgY2hhbmdlIHRo
ZSBzZW1hbnRpY3Mgb2YgdGhpcyBjb2RlIHdvdWxkIGJlIHRvIGNoYW5nZSB0aGUgMyBsaW5lcw0K
PiBvZiBjb2RlIGFib3ZlIHdpdGggdGhpczoNCj4gDQo+IC8qDQo+ICogOyBGTCB3aWxsIGJlIGFs
d2F5cyA+MCENCj4gKiBpZiAoKCpmbCAtPSBGTElfT0ZGU0VUKSA8IDApDQo+ICogICAgIGZsID0g
KnNsID0gMDsNCj4gKi8NCg0KSGkgU3RlZmFubywNCg0KSSB0aGluayB3ZSB3b3VsZCBoYXZlIGEg
dmlvbGF0aW9uIGZvciB0aGUgRGlyZWN0aXZlIDQuNCAoU2VjdGlvbnMgb2YgY29kZSBzaG91bGQg
bm90IGJlIGNvbW1lbnRlZCBvdXQpDQppbiB0aGlzIGNhc2UsIGhvd2V2ZXIgaXTigJlzIG5vdCBs
aXN0ZWQgaW4gcnVsZXMucnN0IGFuZCBJIGRvbuKAmXQgcmVtZW1iZXIgd2hlcmUgdG8gbG9vayB0
byBrbm93IGlmIGl0IHdhcw0KdGFrZW4gaW50byBjb25zaWRlcmF0aW9uIGZvciB0aGUgYWRvcHRp
b24gaW4gWGVuIGluIHRoZSDigJx0YWlsb3JpbmfigJ0gcGhhc2UuDQoNCg0KDQoNCg==

