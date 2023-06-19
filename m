Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6455734EBC
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550890.860103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAf0-0006bA-5w; Mon, 19 Jun 2023 08:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550890.860103; Mon, 19 Jun 2023 08:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAf0-0006YN-2Y; Mon, 19 Jun 2023 08:54:54 +0000
Received: by outflank-mailman (input) for mailman id 550890;
 Mon, 19 Jun 2023 08:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=78w0=CH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qBAez-0006YH-B6
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:54:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3e47b86-0e7e-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 10:54:52 +0200 (CEST)
Received: from DB9PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::10) by AM7PR08MB5461.eurprd08.prod.outlook.com
 (2603:10a6:20b:10e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:54:45 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::a8) by DB9PR01CA0005.outlook.office365.com
 (2603:10a6:10:1d8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36 via Frontend
 Transport; Mon, 19 Jun 2023 08:54:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.20 via Frontend Transport; Mon, 19 Jun 2023 08:54:44 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Mon, 19 Jun 2023 08:54:44 +0000
Received: from 0f2b7a6ff6e5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA9C8287-E1D0-42F9-8F03-D825D7D0C22E.1; 
 Mon, 19 Jun 2023 08:54:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f2b7a6ff6e5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 19 Jun 2023 08:54:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9582.eurprd08.prod.outlook.com (2603:10a6:10:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 08:54:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 08:54:35 +0000
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
X-Inumbo-ID: f3e47b86-0e7e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydNtWTWcQnbLJb4qM4a7EMG9UytbrrupTAKWTSfKRsQ=;
 b=b0eWqCsCSyUHUecyjU42XQwj1EyTUaEJxeLQYy0JB+83gyt657phqITWCqndR9QJzr634YKyOKwhEHMyUIyEjpneeKIU8jO52uSwh7HkD2tRvP3hTXzYACBqW7CKJ6ecwM303meSVPRcXFb+7upc1PfL6o8n4MDUnHbcT1rLRXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c29d98ef81dfcbdc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wunpun0RXO8b57+mN+F71Sz5aB3Bs5izUbReCucJUBjQJKOhYA3js2m9zDWl7oxTdZp4zzWjoDAgJ+vc6GMvbzIGkq6xdlkbjNAFPfJo96dYGhMEwSxk8gYkYTYcQ8TeaSMWbhAxc4YQJC+gisog94bx2v8KTwvz2WMt5hgSlkEM3mxvBO8ljAwyQdl4xhwucKncaIOxAdyqLY9OSmUhYU6UeVTyS9i7X/xqWPO4A4S8ENvUySJv3KD4Xy5clSykaZbmW5O1O2Ej3rImrPjrvThhlHAFSH08/pxaTqfkqDJN9KKOz+/zUQTwc4VjZT9kmJ5xwigniqTL8y93IB3tnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydNtWTWcQnbLJb4qM4a7EMG9UytbrrupTAKWTSfKRsQ=;
 b=F2Dz/0U00jqHVrbp8Y7lY68u9w6y7CRRueACxGViJsWeseG7Vyak+TjgzviZA5nCiCF+7Nvnm10L9lb0watweeulpIiKJdBfahUeSbHfjrGik67TWH+xK1YH5sk6KkKwcNMj/xgsEDzJyMQprZME3V7Vv0F/BtF7TgxW3iAhDX8cNlP2TXrRyFTkyZfGzEFb0HpRF0SDueOfaafwU2tGR3IczNHSoj7mP8FtlSW0umEWNU50PngwQdgveUCUvaKKEm7Lf+5S8U6/jRFh3epSMZ+ifDXprGwL4SAQqOWD7gqW3VTbPiie8zfCZFUo9adBZ7lBB4XEG16l26mqMXNqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydNtWTWcQnbLJb4qM4a7EMG9UytbrrupTAKWTSfKRsQ=;
 b=b0eWqCsCSyUHUecyjU42XQwj1EyTUaEJxeLQYy0JB+83gyt657phqITWCqndR9QJzr634YKyOKwhEHMyUIyEjpneeKIU8jO52uSwh7HkD2tRvP3hTXzYACBqW7CKJ6ecwM303meSVPRcXFb+7upc1PfL6o8n4MDUnHbcT1rLRXQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
Thread-Topic: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
Thread-Index:
 AQHZn6gWgGF2ZXPPc02I099nu6PTEa+NBmIAgAAYV4CAAMv8AIAD4yaAgAABdQCAAAIygIAABVUAgAABJIA=
Date: Mon, 19 Jun 2023 08:54:35 +0000
Message-ID: <407943FC-BEBA-4329-A2E0-D3C4F7AF3AEE@arm.com>
References: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
 <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com>
 <4522eead-bcc3-a735-3293-54ec457e83eb@bugseng.com>
 <alpine.DEB.2.22.394.2306161354070.897208@ubuntu-linux-20-04-desktop>
 <ddbd283d-2d6e-cef5-f2a2-de7fb8a4fe3f@suse.com>
 <1d34618d-2796-e26a-b339-ac8f1fcb8c82@xen.org>
 <FFDFE558-B7CE-4145-9036-05268FDE9E6E@arm.com>
 <e4bfecf4-5728-c604-4ab4-167f0a9e5924@xen.org>
In-Reply-To: <e4bfecf4-5728-c604-4ab4-167f0a9e5924@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9582:EE_|DBAEUR03FT051:EE_|AM7PR08MB5461:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eff4f70-2d6f-49c5-8908-08db70a2d42d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /yJFwM9VUy5w1MVcXJDhOHAD7WFsxoUh3HOj8ukFec+V9LSp50mYw/w11epmTI3r0h0pOgl+69jOe212+PCvRQH5HFEU1WKIrH1Z/xpuXML5krRNOkWDAGeByxsP64YxQCGpsgWEtjkFJDaRVChiSqaso/K+nEbslt5ywBziVSOjnptgUxhWaOQFrq2ewy58M2TRHgh2KQ2csnATTEO5wuy8TJ3vYi7mlF8zY9QPuzh9aQ/CWum0hR9m5VPrWJgQyZROQmfdCdhhTMvQJrOao8eH+IC9/IL8QefChtVgpVpZsbLBZotzrlA4URNE+hzkwds3C54Z/F+0zrYAolIlNcHqvd8IC987f6E8ibDLrXQyeEuXbmXTUtVMl77t++O1GG7ZR0KPsqFGWxovmnRoYis+GvaKuftUvIJjmAbaTF22MZCW3Jxvn/IzSkHwMBOyUJK0Fy162LEsb6guu3ErpT5aCbKhLXTmD4L6lX5aYHnlAqZ1ZBb9VDnYfErv/68kSPE3kepPLHGdmXWj9KEO33qomDLXwkT54z2xjMBdKdAciyCxnoDbV3Q0ZZXbzw/vPq0/cUl3MZrL5HtFwmvYOiREwCsqpH5zQe6ks+RrXE82f+WKsFlY6zA37SeCNpUa1wquVPheC6OLBAkphxL5+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(41300700001)(5660300002)(8936002)(8676002)(2906002)(38070700005)(33656002)(36756003)(86362001)(26005)(6506007)(6512007)(53546011)(54906003)(186003)(478600001)(71200400001)(6486002)(122000001)(76116006)(66946007)(66556008)(66446008)(64756008)(66476007)(91956017)(6916009)(4326008)(38100700002)(316002)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B89402A76B26044A836CD79F16E56B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1309724-4ada-4d1b-9f5b-08db70a2ce84
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ap13mPhzzKmCHjLDaqUIssGtheaKa55ddrth076F9aXMmKZYnhScrlBYpnxsjqIje0qdSfDYgKZu+7haOT58+EX5m1w4tU45q7aJOicXHaHYo9/pm41Ud252E9Z8vhun0pj9YLOAwYUUc7CLbMQMuicOrIw01UswXJ3YW/Dd07z3+0GUeb44I8NW5OJs2KJfJfY3NuQGKzWjDYHk8Z9lLz9KP2MUCytpjx0NUGuhP5c1/Fd4efwOjb5vPvZo6jCA4OtontiaRPbqfRk7XiTEAMkMk/Tz9iGfgdWoL6V/jNpzmmDpiEamv9bBDVxbe5mdWWGuTKIU5MTuJ5MsJhNBWAz4+xi/9mVe6DJQmso8K+1HpwAVDS0bf2FDg+LF1/jfFAOPPqYeebnUlxP8xVa/7lk+vocxng95/CMYZXNYBOt97AmDlir6Z5k7HzQb3X2LwHVREEsT32pTdS9eXj/byc9lZ2LUSmHRtIIzP5sZlCGuzgNNBVjVudPzfCx05l9CkRDiMoqz8dghBCrZ/cfC4+D48FXnVPUkkkjgaq/h7rRJ7lSpfvZfui2hMIS6ZGch3MqF1WM8FbtCf6xn1MN1OVgqQ9r/9OPweIwM+VP+1q7CUVNBA/a/YTSc3L191C+H1wCw1kYg5n7a6sBn5/tiWqhjUB8OSBs7qxvN2jPPFRnlsem5Y42uEqNZU/iU1GUJbcr6u7nuPzDSAzl49T3nhA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39850400004)(136003)(451199021)(46966006)(36840700001)(478600001)(4326008)(54906003)(26005)(6512007)(186003)(36756003)(6506007)(53546011)(6486002)(40480700001)(2906002)(8676002)(8936002)(41300700001)(70206006)(70586007)(316002)(5660300002)(6862004)(82310400005)(86362001)(47076005)(33656002)(356005)(36860700001)(83380400001)(336012)(82740400003)(81166007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:54:44.9824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eff4f70-2d6f-49c5-8908-08db70a2d42d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5461

DQoNCj4gT24gMTkgSnVuIDIwMjMsIGF0IDA5OjUwLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTkvMDYvMjAyMyAwOTozMSwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+PiBPbiAxOSBKdW4gMjAyMywgYXQgMDk6MjMsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDE5LzA2LzIw
MjMgMDk6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNi4wNi4yMDIzIDIyOjU2LCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+PiBPbiBGcmksIDE2IEp1biAyMDIzLCBOaWNv
bGEgVmV0cmluaSB3cm90ZToNCj4+Pj4+PiBPbiAxNi8wNi8yMyAwOToxOSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDE1LjA2LjIwMjMgMTg6MzksIG5pY29sYSB3cm90ZToNCj4+Pj4+
Pj4+IHdoaWxlIGludmVzdGlnYXRpbmcgcG9zc2libGUgcGF0Y2hlcyByZWdhcmRpbmcgTWFuZGF0
b3J5IFJ1bGUgOS4xLCBJDQo+Pj4+Pj4+PiBmb3VuZCB0aGUgZm9sbG93aW5nIHBhdHRlcm4sIHRo
YXQgaXMgbGlrZWx5IHRvIHJlc3VsdHMgaW4gYSBsb3QgcG9zc2libGUNCj4+Pj4+Pj4+IHBvc2l0
aXZlcyBmcm9tIG1hbnkgKGFsbCkgc3RhdGljIGFuYWx5c2lzIHRvb2xzIGZvciB0aGlzIHJ1bGUu
DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFRoaXMgaXMgdGhlIGN1cnJlbnQgc3RhdHVzICh0YWtlbiBm
cm9tIGB4ZW4vY29tbW9uL2RldmljZV90cmVlLmM6MTM1JykNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBjb25zdCBzdHJ1Y3QgZHRfcHJvcGVydHkgKmR0X2ZpbmRfcHJvcGVydHkoY29u
c3Qgc3RydWN0IGR0X2RldmljZV9ub2RlDQo+Pj4+Pj4+PiAqbnAsDQo+Pj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lLCB1
MzIgKmxlbnApDQo+Pj4+Pj4+PiB7DQo+Pj4+Pj4+PiAgICAgICBjb25zdCBzdHJ1Y3QgZHRfcHJv
cGVydHkgKnBwOw0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiAgICAgICBpZiAoICFucCApDQo+Pj4+Pj4+
PiAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+ICAgICAgIGZvciAo
IHBwID0gbnAtPnByb3BlcnRpZXM7IHBwOyBwcCA9IHBwLT5uZXh0ICkNCj4+Pj4+Pj4+ICAgICAg
IHsNCj4+Pj4+Pj4+ICAgICAgICAgICBpZiAoIGR0X3Byb3BfY21wKHBwLT5uYW1lLCBuYW1lKSA9
PSAwICkNCj4+Pj4+Pj4+ICAgICAgICAgICB7DQo+Pj4+Pj4+PiAgICAgICAgICAgICAgIGlmICgg
bGVucCApDQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAqbGVucCA9IHBwLT5sZW5ndGg7DQo+
Pj4+Pj4+PiAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+Pj4gICAgICAgICAgIH0NCj4+Pj4+
Pj4+ICAgICAgIH0NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gICAgICAgcmV0dXJuIHBwOw0KPj4+Pj4+
Pj4gfQ0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+
PiBJdCdzIHZlcnkgaGFyZCB0byBkZXRlY3QgdGhhdCB0aGUgcG9pbnRlZSBpcyBhbHdheXMgd3Jp
dHRlbiB3aGVuZXZlciBhDQo+Pj4+Pj4+PiBub24tTlVMTCBwb2ludGVyIGZvciBgbGVucCcgaXMg
c3VwcGxpZWQsIGFuZCBpdCBjYW4gc2FmZWx5IGJlIHJlYWQgaW4NCj4+Pj4+Pj4+IHRoZSBjYWxs
ZWUsIHNvIGEgc291bmQgYW5hbHlzaXMgd2lsbCBlcnIgb24gdGhlIGNhdXRpb3VzIHNpZGUuDQo+
Pj4+Pj4+IA0KPj4+Pj4+PiBJJ20gaGF2aW5nIHRyb3VibGUgc2VlaW5nIHdoeSB0aGlzIGlzIGhh
cmQgdG8gcmVjb2duaXplOiBUaGUgbG9vcCBjYW4NCj4+Pj4+Pj4gb25seSBiZSBleGl0ZWQgdHdv
IHdheXM6IHBwID09IE5VTEwgb3Igd2l0aCAqbGVucCB3cml0dGVuLg0KPj4+Pj4+PiANCj4+Pj4+
Pj4gRm9yIHJ1bGUgOS4xIEknZCByYXRoZXIgZXhwZWN0IHRoZSBzY2FubmluZyB0b29sIChhbmQg
b2Z0ZW4gdGhlIGNvbXBpbGVyKQ0KPj4+Pj4+PiB0byBnZXQgaW50byB0cm91YmxlIHdpdGggdGhl
IE5VTEwgcmV0dXJuIHZhbHVlIGNhc2UsIGFuZCAqbGVucCBub3QgYmVpbmcNCj4+Pj4+Pj4gd3Jp
dHRlbiB5ZXQgYXBwYXJlbnRseSBjb25zdW1lZCBpbiB0aGUgY2FsbGVyLiBUaGVuLCBob3dldmVy
LCAuLi4NCj4+Pj4+PiANCj4+Pj4+PiANCj4+Pj4+PiBZb3UncmUgcmlnaHQsIEkgbWFkZSBhIG1p
c3Rha2UsIHRoYW5rIHlvdSBmb3IgZmluZGluZyBpdC4NCj4+Pj4+PiBJIG1lYW50IHRvIHdyaXRl
IG9uIGAqbGVucCcgaW4gYWxsIGV4ZWN1dGlvbiBwYXRocy4NCj4+Pj4+PiBQbGVhc2UsIHRha2Ug
YSBsb29rIGF0IHRoaXMgcmV2aXNlZCB2ZXJzaW9uOg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+
IGNvbnN0IHN0cnVjdCBkdF9wcm9wZXJ0eSAqZHRfZmluZF9wcm9wZXJ0eShjb25zdCBzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKm5wLA0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lLCB1MzIgKmxlbnApDQo+Pj4+Pj4gew0KPj4+
Pj4+ICAgICB1MzIgbGVuID0gMDsNCj4+Pj4+PiAgICAgY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5
ICpwcCA9IE5VTEw7DQo+Pj4+Pj4gDQo+Pj4+Pj4gICAgIGlmICggbnAgKQ0KPj4+Pj4+ICAgICB7
DQo+Pj4+Pj4gICAgICAgICBmb3IgKCBwcCA9IG5wLT5wcm9wZXJ0aWVzOyBwcDsgcHAgPSBwcC0+
bmV4dCApDQo+Pj4+Pj4gICAgICAgICB7DQo+Pj4+Pj4gICAgICAgICAgICAgaWYgKCBkdF9wcm9w
X2NtcChwcC0+bmFtZSwgbmFtZSkgPT0gMCApDQo+Pj4+Pj4gICAgICAgICAgICAgew0KPj4+Pj4+
ICAgICAgICAgICAgICAgICBsZW4gPSBwcC0+bGVuZ3RoOw0KPj4+Pj4+ICAgICAgICAgICAgICAg
ICBicmVhazsNCj4+Pj4+PiAgICAgICAgICAgICB9DQo+Pj4+Pj4gICAgICAgICB9DQo+Pj4+Pj4g
ICAgIH0NCj4+Pj4+PiANCj4+Pj4+PiAgICAgaWYgKCBsZW5wICkNCj4+Pj4+PiAgICAgICAgICps
ZW5wID0gbGVuOw0KPj4+Pj4+ICAgICByZXR1cm4gcHA7DQo+Pj4+Pj4gfQ0KPj4+Pj4gDQo+Pj4+
PiBOZXN0aW5nIG1vcmUgd2lsbCBtYWtlIHRoZSBjb2RlIGxlc3MgcmVhZGFibGUgYW5kIGFsc28g
Y2F1c2Ugb3RoZXIgY29kZQ0KPj4+Pj4gcXVhbGl0eSBtZXRyaWNzIHRvIGRldGVyaW9yYXRlIChj
eWNsb21hdGljIGNvbXBsZXhpdHkpLg0KPj4+Pj4gDQo+Pj4+PiBXb3VsZCB0aGUgYmVsb3cgd29y
az8NCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBjb25zdCBzdHJ1Y3QgZHRfcHJvcGVydHkgKmR0X2Zp
bmRfcHJvcGVydHkoY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpucCwNCj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1lLCB1
MzIgKmxlbnApDQo+Pj4+PiB7DQo+Pj4+PiAgICAgdTMyIGxlbiA9IDA7DQo+Pj4+PiAgICAgY29u
c3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpwcCA9IE5VTEw7DQo+Pj4+PiANCj4+Pj4+ICAgICBpZiAo
ICFucCApDQo+Pj4+PiAgICAgICAgIHJldHVybiBOVUxMDQo+Pj4+IFRoYXQncyB3aGF0IHdlIHN0
YXJ0ZWQgZnJvbSwgYnV0IGxlYXZpbmcgKmxlbnAgbm90IHdyaXR0ZW4gdG8uIEhvdw0KPj4+PiBh
Ym91dCAuLi4NCj4+Pj4+ICAgICBmb3IgKCBwcCA9IG5wLT5wcm9wZXJ0aWVzOyBwcDsgcHAgPSBw
cC0+bmV4dCApDQo+Pj4+ICAgICBmb3IgKCBwcCA9IG5wID8gbnAtPnByb3BlcnRpZXMgOiBOVUxM
OyBwcDsgcHAgPSBwcC0+bmV4dCApID4gPiA/DQo+Pj4gDQo+Pj4gSSB3b3VsZCBiZSBPSyB3aXRo
IHRoYXQuIE1heWJlIHdpdGggYW4gZXh0cmEgc2V0IG9mIHBhcmVudGhlc2VzIGFyb3VuZCAnIG5w
ID8gLi4uIDogTlVMTCcganVzdCB0byBtYWtlIHZpc3VhbGx5IGVhc2llciB0byBwYXJzZS4NCj4+
IEFncmVlLCBhbmQgZm9yIE1JU1JBLCB3ZSBzaG91bGQgdXNlIGEgYm9vbGVhbiBleHByZXNzaW9u
IGFzIGNvbmRpdGlvbiwgZXZlbiBpZiBJIGtub3cgdGhhdCB3ZSB3b3VsZCBsaWtlIHRvIGRldmlh
dGUgZnJvbSB0aGF0LA0KPiBUaGUgY29kZSB3aWxsIGV2ZW4gYmUgbW9yZSBkaWZmaWN1bHQgdG8g
cmVhZC4gU28gaWYgd2UgcGxhbiB0byBkZXZpYXRlLCB0aGVuIEkgZG9uJ3Qgd2FudCB1cyB0byB1
c2UgTUlTUkEtY29tcGxpYW50IGJvb2xlYW4gZXhwcmVzc2lvbiBoZXJlLg0KPiANCj4+IHdoaWNo
IEkgZGlzbGlrZS4NCj4gDQo+IFdoYXQgZG8geW91IGRpc2xpa2U/DQoNClRoZSBmYWN0IHRoYXQg
d2UgZG9u4oCZdCB1c2UgYm9vbGVhbiBleHByZXNzaW9ucyBhcyBjb25kaXRpb25zIChpbiBnZW5l
cmFsLCBub3Qgb25seSB0aGlzIGV4YW1wbGUpLCBhbnl3YXkgaXQgd2FzIG9ubHkgbXkgcGVyc29u
YWwgb3Bpbmlvbg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoN
Cg==

