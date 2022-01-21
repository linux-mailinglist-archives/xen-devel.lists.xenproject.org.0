Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D719B495C9B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 10:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259286.447393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAq1K-0005v0-4v; Fri, 21 Jan 2022 09:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259286.447393; Fri, 21 Jan 2022 09:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAq1K-0005rw-1c; Fri, 21 Jan 2022 09:15:46 +0000
Received: by outflank-mailman (input) for mailman id 259286;
 Fri, 21 Jan 2022 09:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=58fC=SF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nAq1H-0005rq-Nl
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 09:15:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44d952e-7a9a-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 10:15:41 +0100 (CET)
Received: from DB3PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:8::49) by
 AS8PR08MB6760.eurprd08.prod.outlook.com (2603:10a6:20b:393::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 09:15:39 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::cd) by DB3PR08CA0036.outlook.office365.com
 (2603:10a6:8::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Fri, 21 Jan 2022 09:15:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7 via Frontend Transport; Fri, 21 Jan 2022 09:15:38 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 21 Jan 2022 09:15:38 +0000
Received: from 12ee30140afb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C2037BE-94EB-47A3-8F0B-DCA9232A73B5.1; 
 Fri, 21 Jan 2022 09:15:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12ee30140afb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jan 2022 09:15:32 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VE1PR08MB5693.eurprd08.prod.outlook.com (2603:10a6:800:1a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 09:15:30 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::b1b3:fe7b:e56b:b2fe]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::b1b3:fe7b:e56b:b2fe%9]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 09:15:30 +0000
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
X-Inumbo-ID: b44d952e-7a9a-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht17sfsBFKs5sbiNdFUpSEjSLSRisxR2BXIrjSqHg5w=;
 b=MrC1zak/JweQOgrMs9xwU3qwTWQiD+OpwQ+uiDYOzkwRG/kYnFuY044W16egsovTzom3vRxjeoTwp1DrLFLpY2IKYlpoAGrsA9K+pq7xLT+zqMY+VmfcduL85wt8R4V6Kr1IIABlDCCj5m11zz+SleetsaIhP631LMPggCO/BhQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbarPiamgrwmwugmaKcEPCQE85jXGW30tEnsuXgpQSI7094mh5keh88br8EaPPZlshcSJujYz/snih4EuFTOiCtJMvFCLrBRy/pttZkM7fqZ513lGzfKG53kNvDBOAoCYwxxSAi/AWHO2hO+i7HQfJas4WLVhYCC5rNeCLkJeTJ1ETON1JO+uNmiHjMetheg7jJ7DzXfmTVqsblMDEZwWLKCFyOHIxs1HT6jSyGaaOZpevO7qMU2nq/gHlzfB1KsryoaOBlZt8OMfzS7IiVPuRanUISQTYAVsSYLeXvH29WOB3Qt+As07knggWwP2DrxOaxipEu5gDTdyvJwYENr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht17sfsBFKs5sbiNdFUpSEjSLSRisxR2BXIrjSqHg5w=;
 b=AXB5tuN+IYavk/Twp537moyC18+dzSYJm5uQezzY86T1uDPe4A9xe8StmUIucIzhbj3/uxn3wlSBSGsilLrvIBact9ANJsPGfw2AaxOO8X4IhJwvm7trP82S5SE+2jkTNZMzo5VjxRDZofVTi3TU/s8d4FJJsdgZAQkzmANLQ5IgafZKbam7oBDyjM3fNaUD7I0Spusf+oFzYHaXZiDT6JZ8daEjG6CYLJauGp1IcJZUKFiyyaHGgcpSdG7SQRcrCfk5LeqQoBxywNsFnXz7SUkQUB7x7GYt1ZuCsFNBg4ULIWLpbVWaDPrAl766Lj202uHMDqTWT4Jh8U662qm3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht17sfsBFKs5sbiNdFUpSEjSLSRisxR2BXIrjSqHg5w=;
 b=MrC1zak/JweQOgrMs9xwU3qwTWQiD+OpwQ+uiDYOzkwRG/kYnFuY044W16egsovTzom3vRxjeoTwp1DrLFLpY2IKYlpoAGrsA9K+pq7xLT+zqMY+VmfcduL85wt8R4V6Kr1IIABlDCCj5m11zz+SleetsaIhP631LMPggCO/BhQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH v4 02/11] xen: introduce CDF_directmap
Thread-Topic: [PATCH v4 02/11] xen: introduce CDF_directmap
Thread-Index: AQHYA9H+JIfw9425OkuSPzbM51YUg6xtROgg
Date: Fri, 21 Jan 2022 09:15:30 +0000
Message-ID:
 <DU2PR08MB73256E26F49902C55661A418F75B9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
 <20211220052123.969876-3-penny.zheng@arm.com>
 <e13c5289-f32b-dea8-f9c2-a0a6a98413a4@suse.com>
In-Reply-To: <e13c5289-f32b-dea8-f9c2-a0a6a98413a4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DC6EC2BC1087704B860DB3AA340E955C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3c4533e2-30d0-454c-77cf-08d9dcbe971d
x-ms-traffictypediagnostic:
	VE1PR08MB5693:EE_|DB5EUR03FT007:EE_|AS8PR08MB6760:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6760785B3067B033E90A4F1CF75B9@AS8PR08MB6760.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1227;OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cTw+L5PaTo3esCiI4is4tA4eN2DdXeeCREwsjQuaeF+EZp9+1MDvyiagpf6cHgTUh1Oxo0Pls2s/3c3pClAckNRghiqt5qkC2BI7zaBWqgc8lzAHOnP7XKv+UN75rT/wj4dP+DY1oz31bi5gly0tBm2t/Uc1/4f4vb2Uqtg10iZogaMQ7BYWn4VvbctiYUTzm/fPZtG+vyzNhfgskQyy5JfqvUqNiFatEjXSi0bVcaGJUQTIB5cmAZs+pHvvxGUGCsoKABwrKhet600CW1OMU6m83o5UQn9gObE5h7+g6LPGVp7Gvjj8neDbHPQIZXAn1kNaU4RUBd7ZM+6M+ZFxdCwGXW+lTQ3GzYcNR+G2FhOA3SSJHGpDPXKEIvcMPbZqzY7V+yf66PHuyeQxe3JLWpaaWcA2Yqt4C2SWhx6pnghXBRVFSN3ze5HSjZPGpnoWYuC7VnRElnF1+R2ahdRqqOFYMrnUE7PEwBmK4Cip6lOBzkwLomGZ8zOxZUMJcZC9o9B9lLeiqPhSNgnywzl+lpP7GKnUkZDFX0c/nvw+SuMdII7GzFrnHS/oBFcmAIZqWL9l93VDxSdekXhlMwx5XiPOkJ4IdaovAVEiA7QYsJ5L/C6l7kcqYQFmntYe8tzR2xkSkWXam3DPgI594dcl1f0j/OPk3TExi27z4D90cIvWhXSj4XSe32OM/VaL3YM61mn/IueAhe+QV7JWksmQpQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(55016003)(6916009)(83380400001)(71200400001)(8676002)(8936002)(5660300002)(38070700005)(9686003)(52536014)(122000001)(66946007)(4326008)(2906002)(54906003)(33656002)(66476007)(76116006)(38100700002)(316002)(7696005)(66446008)(64756008)(186003)(66556008)(508600001)(26005)(6506007)(53546011);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5693
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	befa9f92-e87b-4ffb-1584-08d9dcbe920e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OoygQO27q2/Odrjr/1PS6lXSQcS/342e05r7RP+X0RMUwf7cTDfK591Y+5w8apiCY88/T0tkF90pa0mvKXbiufGKaML2auf0cBMNteYYuPI1J0N9lhi6baNeNcHyK7JLyb6129g2luozDhBUMYkmyDcgXHbm39IzHmjz3PzBiJ3HA4U120D7zfs+X2blUVK3Rq0jH68yjHa8WlNKtYl19Xb/36iDI0KYY0yG8xh+C0wQnAsvW74QKnS+zuirTzg7YbfLp52bZmj88uFfjpYKpzBRVP9VP0sHJIur84TIAtFve5+nv3+xJwjRvDy+T/tgGKkI1WK1RDuf8/3dgKVT+inF4olshZaujoOn4IUIxDCuqpH5cqIXfXbw+Nliu79S9qu1TiilCHMa4K2uyiH0gDnxGwm7Ify7Gl3GBoTuM+YAji0q7amd62XNVjxZ06OWFfAIOMSMVMBwqy25pqiw3CrY+7giGqANCG+ckj880dIhK4xeStLaHnWpBozfNFb6oCOxnG5J7RfH2J2W7aNPd+VV5qT8NfU/m3h0VWoCi5mxH386aBd7LhrWWpNtFC4o4Uj574+eA1V/Yx/02qHBIGR+2XpUZlIIImp8k6baxiJicxeV9DD7Uqy3CO+RZtf7YnXcBuJ5h3qxUdSRutr1Y9F7zavkzV7x9gZ56tyuGTpR/u1DKF4pZNns++3fgSfcOWPO/xzQXo/hGGFKy1zSYw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(52536014)(508600001)(33656002)(8936002)(53546011)(6506007)(5660300002)(7696005)(26005)(186003)(86362001)(2906002)(336012)(70586007)(47076005)(4326008)(356005)(83380400001)(36860700001)(6862004)(316002)(9686003)(54906003)(8676002)(81166007)(55016003)(82310400004)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 09:15:38.6733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4533e2-30d0-454c-77cf-08d9dcbe971d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6760

SGkgSmFuDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNl
bnQ6IEZyaWRheSwgSmFudWFyeSA3LCAyMDIyIDEwOjIyIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8
UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1h
cnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+IDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5A
eGVuLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAyLzExXSB4ZW46IGludHJvZHVjZSBD
REZfZGlyZWN0bWFwDQo+IA0KPiBPbiAyMC4xMi4yMDIxIDA2OjIxLCBQZW5ueSBaaGVuZyB3cm90
ZToNCj4gPiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxp
bnguY29tPg0KPiA+DQo+ID4gVGhpcyBjb21taXQgaW50cm9kdWNlcyBhIG5ldyBhcm0tc3BlY2lm
aWMgZmxhZyBDREZfZGlyZWN0bWFwIHRvDQo+ID4gc3BlY2lmeSB0aGF0IGEgZG9tYWluIHNob3Vs
ZCBoYXZlIGl0cyBtZW1vcnkgZGlyZWN0LW1hcChndWVzdCBwaHlzaWNhbA0KPiA+IGFkZHJlc3Mg
PT0gcGh5c2ljYWwgYWRkcmVzcykgYXQgZG9tYWluIGNyZWF0aW9uLg0KPiA+DQo+ID4gQWxzbywg
YWRkIGEgZGlyZWN0bWFwIGZsYWcgdW5kZXIgc3RydWN0IGFyY2hfZG9tYWluIGFuZCB1c2UgaXQg
dG8NCj4gPiByZWltcGxlbWVudCBpc19kb21haW5fZGlyZWN0X21hcHBlZC4NCj4gPg0KPiA+IEZv
ciBub3csIGRpcmVjdC1tYXAgaXMgb25seSBhdmFpbGFibGUgd2hlbiBzdGF0aWNhbGx5IGFsbG9j
YXRlZCBtZW1vcnkNCj4gPiBpcyB1c2VkIGZvciB0aGUgZG9tYWluLCB0aGF0IGlzLCAieGVuLHN0
YXRpYy1tZW0iIG11c3QgYmUgYWxzbyBkZWZpbmVkDQo+ID4gaW4gdGhlIGRvbWFpbiBjb25maWd1
cmF0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVm
YW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVu
ZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gDQo+IE5vbi1Bcm0gcGFydHMNCj4gQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gSG93ZXZlciwgLi4uDQo+IA0KPiA+IC0t
LSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYw0KPiA+IEBAIC0zMDI5LDEwICszMDI5LDIwIEBAIHZvaWQgX19pbml0IGNy
ZWF0ZV9kb21Vcyh2b2lkKQ0KPiA+ICAgICAgICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9
IC0xLA0KPiA+ICAgICAgICAgICAgICAuZ3JhbnRfb3B0cyA9DQo+IFhFTl9ET01DVExfR1JBTlRf
dmVyc2lvbihvcHRfZ250dGFiX21heF92ZXJzaW9uKSwNCj4gPiAgICAgICAgICB9Ow0KPiA+ICsg
ICAgICAgIHVuc2lnbmVkIGludCBmbGFncyA9IDBVOw0KPiANCj4gTml0OiBObyByZWFsIG5lZWQg
Zm9yIGEgVSBzdWZmaXggaGVyZS4NCj4gDQo+ID4gICAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lz
X2NvbXBhdGlibGUobm9kZSwgInhlbixkb21haW4iKSApDQo+ID4gICAgICAgICAgICAgIGNvbnRp
bnVlOw0KPiA+DQo+ID4gKyAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwg
ImRpcmVjdC1tYXAiKSApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBpZiAoICFJ
U19FTkFCTEVEKENPTkZJR19TVEFUSUNfTUVNT1JZKSApDQo+IA0KPiBJc24ndCB0aGlzIHRvbyBs
YXggYSBjaGVjaz8gSSBkaWRuJ3QgZmluZCBhbnkgb3RoZXIgY2hlY2sgb2YgdGhpcyBwcm9wZXJ0
eSwgc28gdGhlDQo+IHVzZSBvZiBzdGF0aWMgbWVtb3J5IG11c3QgYmUga2V5ZWQgdG8gc29tZXRo
aW5nIGVsc2UuIEhlbmNlIGl0J3Mgbm90IHN1ZmZpY2llbnQNCj4gdGhhdCBzdGF0aWMgbWVtb3J5
IHN1cHBvcnQgaXMgZW5hYmxlZCBpbiB0aGUgYnVpbGQuDQo+IA0KDQpPay4NCkknbGwgY2hhbmdl
IHRoZSBjaGVjayB0byAiIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX1NUQVRJQ19NRU1PUlkpIHx8
ICFkdF9maW5kX3Byb3BlcnR5KG5vZGUsICJ4ZW4sc3RhdGljLW1lbSIsIE5VTEwpICkgIg0KdG8g
bWFrZSB0aGUgY2hlY2sgYSBiaXQgbW9yZSBzdHJpY3QuDQoNCj4gPiBAQCAtNjUsNyArNjcsOCBA
QCBpbnQgbWFwX3ZjcHVfaW5mbyhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBnZm4sDQo+
ID4gdW5zaWduZWQgb2Zmc2V0KTsgIHZvaWQgdW5tYXBfdmNwdV9pbmZvKHN0cnVjdCB2Y3B1ICp2
KTsNCj4gPg0KPiA+ICBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWlu
ICpjb25maWcpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3Rs
X2NyZWF0ZWRvbWFpbiAqY29uZmlnLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IHVuc2lnbmVkIGludCBmbGFncyk7DQo+IA0KPiBTYW1lIGNvbW1lbnQgYXMgZm9yIHRoZSBlYXJs
aWVyIHBhdGNoIHJlZ2FyZGluZyB0aGUgY29uc3QgaGVyZS4NCj4gDQo+IEphbg0KDQpNYW55IHRo
YW5rcywNClBlbm55IFpoZW5nDQoNCg==

