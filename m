Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30A92FF5D8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 21:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72387.130299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2gZe-0006sE-79; Thu, 21 Jan 2021 20:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72387.130299; Thu, 21 Jan 2021 20:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2gZe-0006rh-1m; Thu, 21 Jan 2021 20:28:58 +0000
Received: by outflank-mailman (input) for mailman id 72387;
 Thu, 21 Jan 2021 20:28:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUQ7=GY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l2gZc-0006rc-AX
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 20:28:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30f2e80b-0d3b-49a2-8647-7b0678ae4ff5;
 Thu, 21 Jan 2021 20:28:54 +0000 (UTC)
Received: from DB6PR07CA0192.eurprd07.prod.outlook.com (2603:10a6:6:42::22) by
 DB7PR08MB3596.eurprd08.prod.outlook.com (2603:10a6:10:4a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11; Thu, 21 Jan 2021 20:28:50 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::f2) by DB6PR07CA0192.outlook.office365.com
 (2603:10a6:6:42::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5 via Frontend
 Transport; Thu, 21 Jan 2021 20:28:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 20:28:50 +0000
Received: ("Tessian outbound e989e14f9207:v71");
 Thu, 21 Jan 2021 20:28:50 +0000
Received: from f2527fd2c9d0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D31581D-C1F3-49DC-B586-B56B263C580B.1; 
 Thu, 21 Jan 2021 20:28:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2527fd2c9d0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jan 2021 20:28:45 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3338.eurprd08.prod.outlook.com (2603:10a6:5:1b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Thu, 21 Jan
 2021 20:28:43 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.016; Thu, 21 Jan 2021
 20:28:43 +0000
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
X-Inumbo-ID: 30f2e80b-0d3b-49a2-8647-7b0678ae4ff5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVY7U+yqlxESrTAtpup1k4/z60RBjYL7x6NbiWWNohI=;
 b=ZrKpTprb0n6hJuZoHcSI6Gb5c/ZaavcvRSnQcEOb4mmLpPaoD2cUSECfbXlMp+TejZ7h/lLjD/niqzwG2k7Qm5leMDp2U2W/golH+Tfb1y0U6MtdUmdKYMXQNoLw+Zq9moXSJehy3rnyiUPt1j1QQnsMAXPmdDygduYtKw53U0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: db5d6ceb4c55215c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0XR3Ug/fXfAxIbeTf2OLP2V0l2Rk0+K2GZbsVsb6OCMlGsdaTH9B04OLUA4lUa+KuetN6q44yLZ6Oz8eNEEqp6nc9fT8SjqbPTP+vctlgLiNhxvKT0VSIEL507c+tKZ6ehbVB0kecZiCHqRizpOODXoglUzGI9x/BS1EHStCAGFclDCJWhRX8KiN1bMvDvkl40Weg4OeeVSz8mSITjADptBqeITPHT5LGjimdBPvsQfB2dm/+0YXY4Gk94srBT74x1hKz/srtq4evV1fkntXlpNptiZVNPKxVgHNgela/j2EZbyYKaO064nYJQO78t8AKomTgPsyFwKUS+wkzvchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVY7U+yqlxESrTAtpup1k4/z60RBjYL7x6NbiWWNohI=;
 b=XptpCggH3SAo3kKBIxiw75cQhiu4XhWvlU5MlN43TE9y+wHxTF+2UH3XcK5IdaKOnnFAWAonTV43JXUCC9AkOokoIw959omKnrGNXMtYSNKtkRoz0vELMCFS6C3G4Z9kYYTQe86loO5nhpopPBPk+DEwSpcga75vYGKZHMfGQaE/qFTJuIB8Y7rntJnPS0gFpbrpKwnA7gsT6phhlUBVZd0oDy2H9NmUguWcWTAaEaB1mlrijsRajt6S/Pu+YvXbXjXpPIgzUCbB8vi7O9oCa7CTxXVzHIiEny2wXWp8Ti99/fp/SmQ/3Iw/wl3WHLLJLgapLfbm97kaC2OwhHCFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVY7U+yqlxESrTAtpup1k4/z60RBjYL7x6NbiWWNohI=;
 b=ZrKpTprb0n6hJuZoHcSI6Gb5c/ZaavcvRSnQcEOb4mmLpPaoD2cUSECfbXlMp+TejZ7h/lLjD/niqzwG2k7Qm5leMDp2U2W/golH+Tfb1y0U6MtdUmdKYMXQNoLw+Zq9moXSJehy3rnyiUPt1j1QQnsMAXPmdDygduYtKw53U0g=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW7zzXDLVfiB5hzUKpOAlBcRNn7Kow+AwAgAFaLYCAABnVAIAAHX2A
Date: Thu, 21 Jan 2021 20:28:43 +0000
Message-ID: <47E677DA-007E-445D-A72E-599676202CB7@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2101201212310.14528@sstabellini-ThinkPad-T480s>
 <9621B25B-E39A-4354-9AA3-1ECAED21B8B2@arm.com>
 <81104729-0354-f479-9329-04447df1b096@xen.org>
In-Reply-To: <81104729-0354-f479-9329-04447df1b096@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a26e97fb-327d-428f-4100-08d8be4b29e1
x-ms-traffictypediagnostic: DB7PR08MB3338:|DB7PR08MB3596:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB35965E91B3245310BE2E047BFCA10@DB7PR08MB3596.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rOckQGJozWtZM7VVJPBc/Sb1ODIz5jdbYk20U8cg2wl61cDP8sVsC1lRVMyhZnDQosIQ8l7Gtnox0kJNZhSWfWURMsqMG7dSyH83QuPDhTtT3BAkobysmBQJZZo7LTTC+MeP6otZ/tryeZIQW2mKjIEpIB9MUa8ISVC3tNMvL4wzrou5ffOG3tUmAUNIzNWTUwKsIhtcETZVV1DBNLBDARniM9pDGcyhegSxZPmQMcA+k2WGkzp35ETrmusp/F+4QU7SwuBN6cx1Up/mAG5W+lfo5NcFdNjRB8Omm9CSEptzec3s4tMdNWx6bbVPyS1/sJPWLJoB2Six1DoaSDtrIPmuPuzKKNe9+AsOqLe0axodxRtmKA+cElJybEP+KwyGF5tikjUdIpEuva2uZdbW8UuRzYWzQwverNdlb0X+kIudcnaS0jaa/1md5cydJ7lP7wbp+rIBZDmLleHi6XofZEPIx4TmqZ0kxJ/fI3poA0OVKk64CRyBdnTeOB8bZIDtfHkN8kboNY201y1kmrtV+j41oQ1TKxZxip8on/raOpSnh4kCAdzCO5yQUFnUtRtslB1L4g/RJ49yRfqgSziNxA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(7416002)(33656002)(86362001)(6512007)(2616005)(8676002)(4326008)(6916009)(5660300002)(83380400001)(36756003)(8936002)(2906002)(478600001)(54906003)(26005)(186003)(53546011)(71200400001)(316002)(66446008)(66476007)(91956017)(66556008)(6486002)(6506007)(64756008)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 PW25AwKu0Y4uqksp+jJfP+G596Arjf9rD6enivwKm5SwgL2sKUx6iQ282azVUjjo1LLU4ugGvG/hChCrp2FvEs5ejhIyjnWzpLOc04eFwvGojXQrC6jsL0ds/hyOh6ewduPSnnY2q6ykZx3LNQKIVL66GbLHCapbeTb+z3h+uwwx67tkY1l+3J/raOiCovh1H7ad4/t+9Jq2FCUf5/BQttBPzE7lNWJ2vRqNHE6HgxFT2s9Y+9Z22OgrJ6J48Jj5ayCs3yqHB4Mp9xjnVoWQfD19itQNDI/qEynHWeRJ6I7L4I43VuynjXPQwgZerm6zE9ydRHm8sjQ38I4vz1T94amHERj1CL+vuRw2LeeRHhQFzJNNtlN034/16x74MFmVUMZOLCowjYStiti/ptI1HtO3fyCJ9zrG7rQifA/Dl9SUqyl/quaHL7BuUoGu2ihkn2MmM406xw8I5TMHsKzHuj8r7iQ+L/yMHcCzzkpad9mVLUX79zbeo1k5mIyr0U0YwmH++DsobFW5TXHRj1/IMKgjGY3Y6ARrNMKl+yCJUD37gVImjRrS3KDebYUmYJSLy5tqcZiFa5WFt6cfQq+vkAusPA9qDmtvdgM1sQnX72K5uijTF0nPgZ3s0Qq2sJNcx+/q2tWbbiHy+oFxSDyAnI3lTEDUP7XhneLvle/ejPOZ5JwTKkj2dvDKSiWxwqMsCZdvErjizXlfXNcbd1fp+Zx0EYnHHc1nfKTg7+XMgcVtFSorZxnyfeEvr9+zFBNJ
Content-Type: text/plain; charset="utf-8"
Content-ID: <736F0CB856F7BA44A2A8C1AF52A2CD6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3338
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9b0f4d8-4ecf-4341-7045-08d8be4b2588
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hfFhkSUwABa8mn0qaB4oCugOY1uDwN3plbdgIdFIaVa4WzYpjuDo6UvLMPKk75oZDZcwigUoscfxy2gPx9wwskUTZdcj5Nst/T4BtyOsKxicJLSdca8f0fTm+tAlXcl8+nnh+K9pllckkXp2Yyr2rwabdaYLkDqr4YQLtmAWI62xjrNNeWkcCsk5WTNaQjDSeA8fygZsv5CfAMT/iZPhD2U9+pWCfCi8OTUyLBe7Sf1yYKzD5WYkz1OQfcyik4rpBHCr2TeagEXd0sDfmY3sCzFFuH/Y0Kd4nxI6npsI/wMrtOqn/QyeTJ8QfiJIdvlj7VSc4JrxBDATr8mHjcPrpK8GjcSAxN+XoV2eciGJ95sTejPdr6X50ny4R21EU9V27CNAYBEYH8MUwb0X8GbZVFt146xm6bivwRHudjN4bheQLguU/9xGE6B2gclT5AwDeNgvYo4MrMFgGnioEGJHNQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(46966006)(4326008)(6506007)(82740400003)(82310400003)(53546011)(356005)(70206006)(36756003)(8936002)(26005)(86362001)(5660300002)(33656002)(478600001)(186003)(316002)(47076005)(83380400001)(54906003)(2906002)(81166007)(2616005)(6486002)(336012)(6862004)(107886003)(6512007)(8676002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 20:28:50.7307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a26e97fb-327d-428f-4100-08d8be4b29e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3596

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDIxIEphbiAyMDIxLCBhdCA2OjQzIHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gUGxlYXNl
IHRyeSB0byB0cmltIHRoZSBlLW1haWwgd2hlbiBxdW90aW5nLCBvdGhlcndpc2UgaXQgaXMgcXVp
dGUgZGlmZmljdWx0IHRvIGZpbmQgdGhlIG9ubHkgY291cGxlIG9mIGFuc3dlciB5b3Ugd3JvdGUu
DQo+IA0KPiBPbiAyMS8wMS8yMDIxIDE3OjEwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBPbiAy
MCBKYW4gMjAyMSwgYXQgODozMSBwbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4gLXN0YXRpYyB2b2lkIF9faW9tZW0gKmFybV9zbW11X2lv
cmVtYXAoc3RydWN0IGRldmljZSAqZGV2LCByZXNvdXJjZV9zaXplX3Qgc3RhcnQsDQo+Pj4+IC0J
CQkJICAgICAgcmVzb3VyY2Vfc2l6ZV90IHNpemUpDQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyB2b2lk
IGFybV9zbW11X2ZyZWVfc3RydWN0dXJlcyhzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0K
Pj4+PiB7DQo+Pj4+IC0Jc3RydWN0IHJlc291cmNlIHJlcyA9IHsNCj4+Pj4gLQkJLmZsYWdzID0g
SU9SRVNPVVJDRV9NRU0sDQo+Pj4+IC0JCS5zdGFydCA9IHN0YXJ0LA0KPj4+PiAtCQkuZW5kID0g
c3RhcnQgKyBzaXplIC0gMSwNCj4+Pj4gLQl9Ow0KPj4+PiArCWlmIChzbW11LT5jbWRxLnEuYmFz
ZSkNCj4+Pj4gKwkJeGZyZWUoc21tdS0+Y21kcS5xLmJhc2UpOw0KPj4+PiArDQo+Pj4+ICsJaWYg
KHNtbXUtPmV2dHEucS5iYXNlKQ0KPj4+PiArCQl4ZnJlZShzbW11LT5ldnRxLnEuYmFzZSk7DQo+
Pj4+IA0KPj4+PiAtCXJldHVybiBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCAmcmVzKTsNCj4+
Pj4gKwlpZiAoc21tdS0+cHJpcS5xLmJhc2UpDQo+Pj4+ICsJCXhmcmVlKHNtbXUtPnByaXEucS5i
YXNlKTsNCj4+Pj4gKw0KPj4+PiArCWlmIChzbW11LT5zdHJ0YWJfY2ZnLnN0cnRhYikNCj4+Pj4g
KwkJeGZyZWUoc21tdS0+c3RydGFiX2NmZy5zdHJ0YWIpOw0KPj4+PiArDQo+Pj4+ICsJaWYgKHNt
bXUtPnN0cnRhYl9jZmcubDFfZGVzYykNCj4+Pj4gKwkJeGZyZWUoc21tdS0+c3RydGFiX2NmZy5s
MV9kZXNjKTsNCj4+PiANCj4+PiBGcm9tIHdoYXQgSSBjYW4gdGVsbCB3ZSBhbHNvIG5lZWQgdG8g
ZnJlZSBzb21ld2hlcmUNCj4+PiBzbW11LT5zdHJ0YWJfY2ZnLT5sMV9kZXNjLT5sMnB0ciBhbGxv
Y2F0ZWQgYnkgYXJtX3NtbXVfaW5pdF9sMl9zdHJ0YWINCj4+ICJsMV9kZXNjLT5sMnB0ciIgaXMg
YSBwb2ludGVyIHRvIHRoZSBMZXZlbCAxIFN0cmVhbSBUYWJsZSBEZXNjcmlwdG9yIGlmIDItbGV2
ZWwgU3RyZWFtIFRhYmxlIHN1cHBvcnRlZC4NCj4+IElmIHRoZSBkZXZpY2UgaXMgcHJvdGVjdGVk
IGJ5IElPTU1VLCBTTU1VdjMgZHJpdmVyIHdpbGwgYWxsb2NhdGUgdGhlICAibDFfZGVzYy0+bDJw
dHLigJ0gd2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVkIHRvIHRoZSBJT01NVSB2aWEgYXJtX3NtbXVf
YWRkX2RldmljZSgpIGZ1bmN0aW9uIGFuZCBkZXZpY2Ugd2lsbCBiZSBjb25maWd1cmVkIGluIGJ5
cGFzcy9hYm9ydCBtb2RlLg0KPj4gT25jZSB3ZSBhc3NpZ24gdGhlIGRldmljZSB0byB0aGUgZG9t
YWluKGFybV9zbW11X2Fzc2lnbl9kZXYoKSApIHNtbXV2MyBodyB3aWxsIGJlIGNvbmZpZ3VyZWQg
Y29ycmVjdGx5IHRvIG1hdGNoIHRoZSBTdHJlYW1JRC4gSWYgdGhlcmUgaXMgYSBmYWlsdXJlIGlu
IGFzc2lnbmluZyB0aGUgZGV2aWNlLCB0aGF0IGNhc2UgYWxzbyBYRU4gd2lsbCBub3QgcmVtb3Zl
IHRoZSBkZXZpY2UgYW5kIG1hc3RlciBkZXZpY2Ugc3RpbGwgYmUgaW4gYnlwYXNzL2Fib3J0IG1v
ZGUuDQo+IA0KPiBJIGFtIGEgYml0IGNvbmZ1c2VkIHdpdGggdGhpcyBhbnN3ZXIuIFdvdWxkbid0
IHRoaXMgbWVhbiB0aGF0IHdlIGFyZSAibGVha2luZyIgbWVtb3J5IGlmIHdlIGZhaWwgdG8gYXNz
aWduIHRoZSBkZXZpY2U/DQoNCk5vIHdlIGFyZSBub3QgbGVha2luZyBtZW1vcnkgYXMgImwxX2Rl
c2MtPmwycHRy4oCdIGlzIHN0aWxsIGJlIHZhbGlkIGFuZCBpcyByZXF1aXJlZCBmb3IgY29ycmVj
dCBTTU1VdjMgb3BlYXRpb24gaWYgd2UgZmFpbCB0byBhc3NpZ24gdGhlIGRldmljZSwgYXMgaW4g
dGhhdCBjYXNlIGRldmljZSB3aWxsIG9wZXJhdGUgaW4gYnlwYXNzIG9yIGFib3J0IG1vZGUuIA0K
DQpGb3IgZXhhbXBsZSBpZiBieSBhbnkgY2hhbmNlIHRoZXJlIGlzIGZhdWx0eSBodyBiZWhpbmQg
U01NVXYzIHRoZW4gaWYgd2UgZmFpbCB0byBhc3NpZ24gdGhlIGRldmljZSB3ZSBjYW4gY29uZmln
dXJlIHRoZSBkZXZpY2UgaW4gYWJvcnQgbW9kZSBpbiB0aGF0IGNhc2UgU01NVXYzIGh3IHdpbGwg
c2lsZW50bHkgcmVwb3J0IGFib3J0IHRvIGRldmljZSwgd2l0aG91dCBhbnkgZXZlbnQgcmVjb3Jk
ZWQuDQoNCldlIGNhbiBhbHNvIGNvbmZpZ3VyZSB0aGUgZGV2aWNlIGluIGJ5cGFzcyBtb2RlIGlm
IHdlIGZhaWwgdG8gYXNzaWduLiBUaGF0cyB3aHkgSSB0aG91Z2h0IG5vdCB0byBmcmVlIHRoZSAi
bDFfZGVzYy0+bDJwdHLigJ0gaWYgd2UgZmFpbCB0byBhc3NpZ24gdGhlIGRldmljZS4NCg0KPiAN
Cj4+IEFzIGluIFhFTiwgdGhlcmUgaXMgbm8gZnVuY3Rpb24gdG8gcmVtb3ZlIHRoZSBtYXN0ZXIg
ZGV2aWNlIGZyb20gdGhlIElPTU1VLCBiZWNhdXNlIG9mIHRoYXQgSSBmZWVsIHRoZXJlIGlzIG5v
IG5lZWQgdG8gZnJlZSB0aGUgImwxX2Rlc2MtPmwycHRy4oCdIGluIGNhc2Ugb2YgZmFpbHVyZSBh
bHNvLg0KPiANCj4gSG1tbS4uLiBYZW4gaXMgYWJsZSB0byByZW1vdmUgZGV2aWNlIGZyb20gdGhl
IElPTU1VLiBUaGUgcmVhc29uIHRoaXMgaXMgbm90IGltcGxlbWVudGVkIHlldCBvbiBBcm0gaXMg
YmVjYXVzZSB5b3UgY2FuJ3QgaG90LXVucGx1ZyAicGxhdGZvcm0iIGRldmljZS4NCj4gDQo+IEkg
ZXhwZWN0IHRoZSByZW1vdmFsIGZ1bmN0aW9uIHRvIGJlIHVzZWZ1bCBmb3IgUENJLg0KDQpZZXMg
SSBhZ3JlZSBmb3IgUENJIGhvdCBwbHVnIGRldmljZXMgd2UgaGF2ZSB0byBpbXBsZW1lbnQgdGhl
IElPTU1VIHJlbW92ZSBmdW5jdGlvbi4gSWYgd2UgaW1wbGVtZW50IHRoZSByZW1vdmUgZnVuY3Rp
b24gZm9yIFBDSSBob3QtcGx1ZyB3ZSBjYW4gZnJlZSB0aGUgdGhlICJsMV9kZXNjLT5sMnB0cuKA
nSBpbiB0aGUgcmVtb3ZlIGZ1bmN0aW9uIGZvciB0aGF0IGRldmljZS4gDQoNClJlZ2FyZHMsDQpS
YWh1bA0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

