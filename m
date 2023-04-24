Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1166ED171
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525512.816771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyDK-000885-CH; Mon, 24 Apr 2023 15:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525512.816771; Mon, 24 Apr 2023 15:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyDK-00085I-8j; Mon, 24 Apr 2023 15:34:50 +0000
Received: by outflank-mailman (input) for mailman id 525512;
 Mon, 24 Apr 2023 15:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pqyDJ-00085C-Av
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:34:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b5cae82-e2b5-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:34:47 +0200 (CEST)
Received: from AM6P194CA0094.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::35)
 by DBBPR08MB6217.eurprd08.prod.outlook.com (2603:10a6:10:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:34:45 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::c5) by AM6P194CA0094.outlook.office365.com
 (2603:10a6:209:8f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 15:34:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 15:34:44 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Mon, 24 Apr 2023 15:34:44 +0000
Received: from 5140db261521.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A6183F77-F5EA-4CEC-B63A-3E21CFA0806B.1; 
 Mon, 24 Apr 2023 15:34:33 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5140db261521.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 15:34:33 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:34:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:34:30 +0000
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
X-Inumbo-ID: 8b5cae82-e2b5-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuJS8RkoXZADJ4VbzV+EtG7uMm7ioWIq2ddvgdwdYNM=;
 b=QXWwHqLLU8gouGGt7ncMOeueBq6CibWwJgFbyiryFrzYQJxHwE1TDW0FrVG8qw7z/sFcNyFyw0ls/IbX+iZBAfNp8sCktfuohPOLwadL82UgohhW/zkdJFqwBX5+80dWAVJHL7XpDYeBr/+5de6FgeNG75Htk+g4KXSw8AD1bHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b71ef954be05ccb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVsUITlw7UAUIUDam5vwac3ZOJHKcTZXmN3+W2AzQI7+D3xKT5j0xYlA6qauDnXhCa3Xcl6plI+Z/H1S2MqWcMZ+W+Pq86QdtnACxPgpVyKUi4V1ktzwkeJ12kcq7FknzOaHqYImC32JTO78Fk3Z/x2BHNH4HFkwJLDjieHJfMr5724S7ek8FI4Gm71tuVRu/GTAOMfb7quMtUD/WZqGDqR9KMzGNZcf3VVw0/RCSvsnH0Ji506w7FAgLwWfl7zOHSf7df4SRVsfsq0K1Yh9WcI9EhXKS29pI0v9imC6dBw4bKr5LsNvNdKMVdBrVTWnjLL+4E2s1jTzaqKnZGHOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuJS8RkoXZADJ4VbzV+EtG7uMm7ioWIq2ddvgdwdYNM=;
 b=ZE8gKbl6lrAFqabZzwOq+SDQRNFnwFKD5gTGyjzChCRo2PGddkqvnxcaqqLzqkvAeDsHnKoXQMDcFxorZuxPHg1wGQnxUpWMpIDRXy1+SQN8ou4uTu8Q8X/TMGP/RU85ht+nvNgtZWvNTlkU4DwMJI9yZ3FN+AafDd5cURB8dS7DC7qR6KFkLZFxKhtAUMYitar/sQH3g77P2mRE91Z4FurHf2yxbKErxJiwKE3pwOl8+5dt48/w9GFYOYj8geJw4QdI6XbGeuOztYkuZPHuvf1R8wfaz47oepDrkEgDyP8Ah+ApdnqS8upnllfjzsCj8GJgzdAGmZi4Dca7oKmoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuJS8RkoXZADJ4VbzV+EtG7uMm7ioWIq2ddvgdwdYNM=;
 b=QXWwHqLLU8gouGGt7ncMOeueBq6CibWwJgFbyiryFrzYQJxHwE1TDW0FrVG8qw7z/sFcNyFyw0ls/IbX+iZBAfNp8sCktfuohPOLwadL82UgohhW/zkdJFqwBX5+80dWAVJHL7XpDYeBr/+5de6FgeNG75Htk+g4KXSw8AD1bHQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZdnKG11PjGcmQuE2MpJrElBiS3686VJGAgAAo1ICAAAFsAIAADk4AgAACvwCAAANFAIAAAd0AgAACk4A=
Date: Mon, 24 Apr 2023 15:34:29 +0000
Message-ID: <300BE89F-CA37-4A28-9CC5-5875E10D4A0C@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
 <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
 <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
In-Reply-To: <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB7495:EE_|AM7EUR03FT056:EE_|DBBPR08MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4c93d0-8598-4cf3-ce21-08db44d96ded
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cnfLwYoF8rSmoNAJBGYipm9XGsrXYVpEw1ELYutUkMDObdStn63artvMjcs12gKxShqHexIoiLtxH2tuEw+a2YLdecA8gRW1a41pmu/wzWnGPyLbZD6C3kuqBq/gV6BDULSbH8KEjwp6KasNxyFCb8AB6Op/0ct+yfI6A4N7jZ2fwJrCb5RQ56xq3RnLcpf4jWyWiXeGpEqOYEV/RTV+B6SWlG9nwkopk+mEEJTmcP/Xc8yb66c/EEv9DNkHatlvXoGjbTP6BJAJPGTv/LonKvyg3uW8uBTSTVK5K5HFNRQFtUFsPnkWksRk25Ea8eECDCgui8lUoRnpv2vSz+yIwwtiLnJQ98py9ulhSUW+5qmoHZG46DB6mKZ/uMZwFEt3D+hr4Cd1A7HlDNC3j2HpVcnyPL14nupRjZ3o0xHjvMdbdvZTe9XtyUzpIS/+kyPibsEzI3NfPF48Hi37DBE+Qq21EeZWpxZFUh5t50myZ3/WrDS0WefitInsJtQgaG+lclrmo6N9GF04cMRK3KsCred+nvyrBfvic2vhFMhvtJt/MJ6pfq/IeQPdcEB2GRcbZ2VO/YIU4QorKKDpRvUPzDu0gAXZyunjbInPrWQYsLr0jVN9VAYKfmYe5N84FEnqf5vwK5FKP1SAJ91S5Qxkew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(36756003)(8676002)(8936002)(38070700005)(54906003)(478600001)(66446008)(66476007)(66556008)(64756008)(4326008)(6916009)(66946007)(76116006)(91956017)(122000001)(316002)(41300700001)(2906002)(38100700002)(5660300002)(2616005)(86362001)(186003)(26005)(6506007)(6512007)(33656002)(53546011)(6486002)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2F189D465D08B48A1B1055947FE92ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b28dc74c-1411-4fc4-970e-08db44d9651f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RFJQSnIy9hFi4tOL/kFPvDgUZDs19doly/QipighY5JPkAW5XnYMXMs0l1zM7+8ULxal/rgljB9tPJk9S3qmOiut1grtVW5+1z6haq+cIIgeE15uWSF5xBmmK6D1KLWHAIkRQJawurcr9beJHKoMfKWcASMC2mNU4avo//WR3YqcgkzdI1H1smRoxwUiW5FuhuCpkPkTM6fbTwi3G7PmKexFD+Aft4YKtpWx9WI7y0wemxSE5XsEZ38KqT7iORln4OqAtdC9UbffT+vTuz/GXyTUTjG4cnqjtqVqV7fBYXfd9tjX6s48m2R4wNZecFKXGrKNIIwD7mMFs/KrwyfNOo8+EFyZ4FN27fCbh6sNCCq+s7RuaVYgrUoRlI/RH7yigfSHTo997DKSZRmR37AxQ/M8MSWnwh9ruLNqoe1/KMSZcuVzWTsRAwfb2RysJaQsLR70b+ZdvEGklM7LoQ0fvaFB/m4DNHhwHNhhWhMjuBBthLr+9yIpYP2vSJYH4CgEnWq3XsLIPlokyImxnx8Y9PaHGa9nnfRZs5MFPq8dozhNtmMk9JbIBryH3mo2trz6JH0CHbe2AIc8vjUZxcAk8WXMHWZd3MghvP4l2hj5HuKU2QW19z/4fQLjrj58+c7BgidPUN1f7B6e1MenTJ9Julok4iUhy4Aqclwx+yS5p2tW0pvySiHPhddogKOYNnchCoh5JXkAqNy8RwaMeM4wCg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(81166007)(356005)(82740400003)(336012)(6506007)(6512007)(53546011)(26005)(2616005)(40480700001)(186003)(83380400001)(47076005)(36860700001)(33656002)(2906002)(8676002)(8936002)(6862004)(5660300002)(36756003)(40460700003)(54906003)(478600001)(6486002)(316002)(4326008)(41300700001)(70206006)(70586007)(86362001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:34:44.5169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4c93d0-8598-4cf3-ce21-08db44d96ded
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6217

DQoNCj4gT24gMjQgQXByIDIwMjMsIGF0IDE2OjI1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDQuMjAyMyAxNzoxOCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyNCBBcHIgMjAyMywgYXQgMTY6MDYsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjQuMDQuMjAyMyAxNjo1NywgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IE9uIDI0IEFwciAyMDIzLCBhdCAxNTowNSwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDI0LjA0LjIwMjMgMTY6MDAsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+IE9uIDI0IEFwciAyMDIzLCBhdCAxMjozNCwgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4gT24gMjQuMDQuMjAyMyAw
ODowMiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4+IEBAIC0zMCw5ICszNywxMSBAQCBp
bnQgc3ZlX2NvbnRleHRfaW5pdChzdHJ1Y3QgdmNwdSAqdik7DQo+Pj4+Pj4+PiB2b2lkIHN2ZV9j
b250ZXh0X2ZyZWUoc3RydWN0IHZjcHUgKnYpOw0KPj4+Pj4+Pj4gdm9pZCBzdmVfc2F2ZV9zdGF0
ZShzdHJ1Y3QgdmNwdSAqdik7DQo+Pj4+Pj4+PiB2b2lkIHN2ZV9yZXN0b3JlX3N0YXRlKHN0cnVj
dCB2Y3B1ICp2KTsNCj4+Pj4+Pj4+ICtib29sIHN2ZV9kb21jdGxfdmxfcGFyYW0oaW50IHZhbCwg
dW5zaWduZWQgaW50ICpvdXQpOw0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiAjZWxzZSAvKiAhQ09ORklH
X0FSTTY0X1NWRSAqLw0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiArI2RlZmluZSBvcHRfZG9tMF9zdmUg
ICAgICgwKQ0KPj4+Pj4+Pj4gI2RlZmluZSBpc19zdmVfZG9tYWluKGQpICgwKQ0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBzdGF0aWMgaW5saW5lIHJlZ2lzdGVyX3QgY29tcHV0ZV9tYXhfemNyKHZvaWQp
DQo+Pj4+Pj4+PiBAQCAtNTksNiArNjgsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHN2ZV9jb250
ZXh0X2ZyZWUoc3RydWN0IHZjcHUgKnYpIHt9DQo+Pj4+Pj4+PiBzdGF0aWMgaW5saW5lIHZvaWQg
c3ZlX3NhdmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpIHt9DQo+Pj4+Pj4+PiBzdGF0aWMgaW5saW5l
IHZvaWQgc3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpIHt9DQo+Pj4+Pj4+PiANCj4+
Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgc3ZlX2RvbWN0bF92bF9wYXJhbShpbnQgdmFsLCB1
bnNpZ25lZCBpbnQgKm91dCkNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArICAgIHJldHVybiBmYWxz
ZTsNCj4+Pj4+Pj4+ICt9DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBPbmNlIGFnYWluIEkgZG9uJ3Qgc2Vl
IHRoZSBuZWVkIGZvciB0aGlzIHN0dWI6IG9wdF9kb20wX3N2ZSBpcyAjZGVmaW5lLWQNCj4+Pj4+
Pj4gdG8gcGxhaW4gemVybyB3aGVuICFBUk02NF9TVkUsIHNvIHRoZSBvbmx5IGNhbGwgc2l0ZSBt
ZXJlbHkgcmVxdWlyZXMgYQ0KPj4+Pj4+PiB2aXNpYmxlIGRlY2xhcmF0aW9uLCBhbmQgRENFIHdp
bGwgdGFrZSBjYXJlIG9mIGVsaW1pbmF0aW5nIHRoZSBhY3R1YWwgY2FsbC4NCj4+Pj4+PiANCj4+
Pj4+PiBJ4oCZdmUgdHJpZWQgdG8gZG8gdGhhdCwgSeKAmXZlIHB1dCB0aGUgZGVjbGFyYXRpb24g
b3V0c2lkZSB0aGUgaWZkZWYgc28gdGhhdCBpdCB3YXMgYWx3YXlzIGluY2x1ZGVkDQo+Pj4+Pj4g
YW5kIEkgcmVtb3ZlZCB0aGUgc3R1YiwgYnV0IEkgZ290IGVycm9ycyBvbiBjb21waWxhdGlvbiBi
ZWNhdXNlIG9mIHVuZGVmaW5lZCBmdW5jdGlvbi4NCj4+Pj4+PiBGb3IgdGhhdCByZWFzb24gIEkg
bGVmdCB0aGF0IGNoYW5nZSBvdXQuDQo+Pj4+PiANCj4+Pj4+IEludGVyZXN0aW5nLiBJIGRvbid0
IHNlZSB3aGVyZSB0aGUgcmVmZXJlbmNlIHdvdWxkIGJlIGNvbWluZyBmcm9tLg0KPj4+PiANCj4+
Pj4gQ291bGQgaXQgYmUgYmVjYXVzZSB0aGUgZGVjbGFyYXRpb24gaXMgdmlzaWJsZSwgb3V0c2lk
ZSB0aGUgaWZkZWYsIGJ1dCB0aGUgZGVmaW5pdGlvbiBpcyBub3QgY29tcGlsZWQgaW4/IA0KPj4+
IA0KPj4+IFdlbGwsIHllcywgbGlrZWx5LiBCdXQgdGhlIHF1ZXN0aW9uIGlzbid0IHRoYXQgYnV0
ICJXaHkgZGlkIHRoZSByZWZlcmVuY2UNCj4+PiBub3QgZ2V0IHJlbW92ZWQsIHdoZW4gaXQncyBp
bnNpZGUgYW4gaWYoMCkgYmxvY2s/Ig0KPj4gDQo+PiBPaCBvaywgSSBkb27igJl0IGtub3csIGhl
cmUgd2hhdCBJIGdldCBpZiBmb3IgZXhhbXBsZSBJIGJ1aWxkIGFybTMyOg0KPj4gDQo+PiBhcm0t
bGludXgtZ251ZWFiaWhmLWxkIC1FTCAtVCBhcmNoL2FybS94ZW4ubGRzIC1OIHByZWxpbmsubyBc
DQo+PiAuL2NvbW1vbi9zeW1ib2xzLWR1bW15Lm8gLW8gLi8ueGVuLXN5bXMuMA0KPj4gYXJtLWxp
bnV4LWdudWVhYmloZi1sZDogcHJlbGluay5vOiBpbiBmdW5jdGlvbiBgY3JlYXRlX2RvbVVzJzoN
Cj4+ICguaW5pdC50ZXh0KzB4MTM0NjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBzdmVfZG9t
Y3RsX3ZsX3BhcmFtJw0KPiANCj4gSW4gcGFydGljdWxhciB3aXRoIHNlZWluZyB0aGlzOiBXaGF0
IHlvdSBjb3BpZWQgaGVyZSBpcyBhIGJ1aWxkIHdpdGggdGhlDQo+IHNlcmllcyBhcHBsaWVkIG9u
bHkgdXAgdG8gdGhpcyBwYXRjaD8gSSBhc2sgYmVjYXVzZSB0aGUgcGF0Y2ggaGVyZSBhZGRzIGEN
Cj4gY2FsbCBvbmx5IG91dCBvZiBjcmVhdGVfZG9tMCgpLg0KDQpObyBJ4oCZdmUgZG8gdGhlIGNo
YW5nZXMgb24gdG9wIG9mIHRoZSBzZXJpZSwgSeKAmXZlIHRyaWVkIGl0IG5vdywgb25seSB0byB0
aGlzIHBhdGNoIGFuZCBpdCBidWlsZHMgY29ycmVjdGx5LA0KSXQgd2FzIG15IG1pc3Rha2UgdG8g
ZG9u4oCZdCByZWFkIGNhcmVmdWxseSB0aGUgZXJyb3Igb3V0cHV0Lg0KDQpBbnl3YXkgSSBndWVz
cyB0aGlzIGNoYW5nZSBpcyBub3QgYXBwbGljYWJsZSBiZWNhdXNlIHdlIGRvbuKAmXQgaGF2ZSBh
IHN5bWJvbCB0aGF0IGlzIHBsYWluIDAgZm9yIGRvbVVzDQp0byBiZSBwbGFjZWQgaW5zaWRlIGNy
ZWF0ZV9kb21Vcy4NCg0KPiANCj4gSmFuDQo+IA0KPj4gYXJtLWxpbnV4LWdudWVhYmloZi1sZDog
KC5pbml0LnRleHQrMHgxMzZiNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHN2ZV9kb21jdGxf
dmxfcGFyYW0nDQo+PiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiAuLy54ZW4tc3ltcy4wOiBoaWRk
ZW4gc3ltYm9sIGBzdmVfZG9tY3RsX3ZsX3BhcmFtJyBpc24ndCBkZWZpbmVkDQo+PiBhcm0tbGlu
dXgtZ251ZWFiaWhmLWxkOiBmaW5hbCBsaW5rIGZhaWxlZDogYmFkIHZhbHVlDQo+PiBtYWtlWzNd
OiAqKiogWy9kYXRhX3NkYy9sdWNmYW4wMS9raXJrc3RvbmVfeGVuL3hlbi94ZW4vYXJjaC9hcm0v
TWFrZWZpbGU6OTU6IHhlbi1zeW1zXSBFcnJvciAxDQo+PiBtYWtlWzJdOiAqKiogWy9kYXRhX3Nk
Yy9sdWNmYW4wMS9raXJrc3RvbmVfeGVuL3hlbi94ZW4vLi9idWlsZC5tazo5MDogeGVuXSBFcnJv
ciAyDQo+PiBtYWtlWzFdOiAqKiogWy9kYXRhX3NkYy9sdWNmYW4wMS9raXJrc3RvbmVfeGVuL3hl
bi94ZW4vTWFrZWZpbGU6NTkwOiB4ZW5dIEVycm9yIDINCj4+IG1ha2VbMV06IExlYXZpbmcgZGly
ZWN0b3J5ICcvZGF0YV9zZGMvbHVjZmFuMDEva2lya3N0b25lX3hlbi9idWlsZC94ZW4tcWVtdS1h
cm0zMicNCj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTgxOiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+
PiBtYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2RhdGFfc2RjL2x1Y2ZhbjAxL2tpcmtzdG9uZV94
ZW4veGVuL3hlbuKAmQ0KPj4gDQo+PiBUaGVzZSBhcmUgdGhlIG1vZGlmaWNhdGlvbiBJ4oCZdmUg
ZG9uZToNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02
NC9zdmUuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9zdmUuaA0KPj4gaW5kZXgg
NzFiZGRiNDFmMTljLi4zMzBjNDdlYTg4NjQgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vYXJtNjQvc3ZlLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9hcm02NC9zdmUuaA0KPj4gQEAgLTI0LDYgKzI0LDggQEAgc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBpbnQgc3ZlX2VuY29kZV92bCh1bnNpZ25lZCBpbnQgc3ZlX3ZsX2JpdHMpDQo+PiAgICAgcmV0
dXJuIHN2ZV92bF9iaXRzIC8gU1ZFX1ZMX01VTFRJUExFX1ZBTDsNCj4+IH0NCj4+IA0KPj4gK2Jv
b2wgc3ZlX2RvbWN0bF92bF9wYXJhbShpbnQgdmFsLCB1bnNpZ25lZCBpbnQgKm91dCk7DQo+PiAr
DQo+PiAjaWZkZWYgQ09ORklHX0FSTTY0X1NWRQ0KPj4gDQo+PiBleHRlcm4gaW50IG9wdF9kb20w
X3N2ZTsNCj4+IEBAIC0zNyw3ICszOSw2IEBAIGludCBzdmVfY29udGV4dF9pbml0KHN0cnVjdCB2
Y3B1ICp2KTsNCj4+IHZvaWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdik7DQo+PiB2
b2lkIHN2ZV9zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KTsNCj4+IHZvaWQgc3ZlX3Jlc3RvcmVf
c3RhdGUoc3RydWN0IHZjcHUgKnYpOw0KPj4gLWJvb2wgc3ZlX2RvbWN0bF92bF9wYXJhbShpbnQg
dmFsLCB1bnNpZ25lZCBpbnQgKm91dCk7DQo+PiANCj4+ICNlbHNlIC8qICFDT05GSUdfQVJNNjRf
U1ZFICovDQo+PiANCj4+IEBAIC02OCwxMSArNjksNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3Zl
X2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdikge30NCj4+IHN0YXRpYyBpbmxpbmUgdm9pZCBz
dmVfc2F2ZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikge30NCj4+IHN0YXRpYyBpbmxpbmUgdm9pZCBz
dmVfcmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikge30NCj4+IA0KPj4gLXN0YXRpYyBpbmxp
bmUgYm9vbCBzdmVfZG9tY3RsX3ZsX3BhcmFtKGludCB2YWwsIHVuc2lnbmVkIGludCAqb3V0KQ0K
Pj4gLXsNCj4+IC0gICAgcmV0dXJuIGZhbHNlOw0KPj4gLX0NCj4+IC0NCj4+ICNlbmRpZiAvKiBD
T05GSUdfQVJNNjRfU1ZFICovDQo+PiANCj4+ICNlbmRpZiAvKiBfQVJNX0FSTTY0X1NWRV9IICov
DQoNCg0K

