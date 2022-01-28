Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0420949F28D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 05:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261833.453604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDIzB-00084a-IQ; Fri, 28 Jan 2022 04:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261833.453604; Fri, 28 Jan 2022 04:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDIzB-00081s-Ed; Fri, 28 Jan 2022 04:35:45 +0000
Received: by outflank-mailman (input) for mailman id 261833;
 Fri, 28 Jan 2022 04:35:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PPK3=SM=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nDIz9-00081m-ET
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 04:35:43 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf0a6b9b-7ff3-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 05:35:40 +0100 (CET)
Received: from AM7PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:20b:100::39)
 by DBBPR08MB6060.eurprd08.prod.outlook.com (2603:10a6:10:20a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 04:35:37 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::1e) by AM7PR02CA0029.outlook.office365.com
 (2603:10a6:20b:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Fri, 28 Jan 2022 04:35:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 04:35:37 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Fri, 28 Jan 2022 04:35:36 +0000
Received: from 77fcd44256eb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B407D059-B862-4E85-9866-39562873BE01.1; 
 Fri, 28 Jan 2022 04:35:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77fcd44256eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Jan 2022 04:35:30 +0000
Received: from AS1PR08MB7426.eurprd08.prod.outlook.com (2603:10a6:20b:4c5::16)
 by AM6PR08MB3335.eurprd08.prod.outlook.com (2603:10a6:209:4c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 04:35:29 +0000
Received: from AS1PR08MB7426.eurprd08.prod.outlook.com
 ([fe80::d8eb:9221:89a6:df99]) by AS1PR08MB7426.eurprd08.prod.outlook.com
 ([fe80::d8eb:9221:89a6:df99%9]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 04:35:28 +0000
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
X-Inumbo-ID: bf0a6b9b-7ff3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LswWmfZr/1thz2Va2j2uD/bXSfofoPGW72BdvvRvi/E=;
 b=OHIjlshZody+pb2X+OFbnmA7F9bBZ7w3t50yzeOU+ktuITQyGG1+lmZ08B1j2hFpk6KiStUGYOR1uU9KhlxmISdgtQEFMRp2iP+bxW7LBx9wA2W/XpYD+7ulJ4+1+VCHFFXLCDo7LHzNqGtp3z+RxzLd3p56FWosfibRYtCFkt4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZkMfCIMR/dHS3Y9j0GJdA8oyCTLWBxbjcYDcYqEu+WWkTDa0/HWI6hd+DpDB1XUlJN90JTaVnbXrhYbmPT8WefyvfF6ZWzBJVRUrqZCXG5SOO+vCLTaT806VkA63UOP+AnaPQJNqAACZPueXQLsYGGJ2Kop2LGhBCMc9RHk9tdeWHn43zSa4+zUSljvemruyk6Whf8gcgZVVBQjOM3+fgGLJKGC2eij57kCc1NpbG2rj0k+jvJSyI/k3di5smpyzR/IwrQd/9crdC+IIUcBMqMkOR98tSPTwicQuQwQE2foY3EIx1/BBHp9G/dlBpuLzwyDohnFj/Xjks12m++/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LswWmfZr/1thz2Va2j2uD/bXSfofoPGW72BdvvRvi/E=;
 b=PRpKnYjB3A7ot8huvowofwtl5obiPKC9a0qKOWEp/ByWlwfIiVdSf/12vNfFTPgTiuNSXTdGzUqaaI/wl+gg6Ks3V4RNac4zPHotvCi464ioyQUEIpzmn1QlFSzqoKC4QjhdSZqDtIR8yOsl9fJijOTzXod8vla/Y3VLZVZRRMuORNq6EmhDvSQkCce/IyWKswuu1vntTyad8iaTa/2UZme3ZLr8T9g0neE/hLJ1DUajysWfSJ9KiT91pEvd368KjEHQeLALN4MC6rgP6nGBUxMi0AykPCIK/R2ooN9DNlXAimPXfjSE2awMlEgd0WG0G9d0qMD3gu6cw22JbFUeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LswWmfZr/1thz2Va2j2uD/bXSfofoPGW72BdvvRvi/E=;
 b=OHIjlshZody+pb2X+OFbnmA7F9bBZ7w3t50yzeOU+ktuITQyGG1+lmZ08B1j2hFpk6KiStUGYOR1uU9KhlxmISdgtQEFMRp2iP+bxW7LBx9wA2W/XpYD+7ulJ4+1+VCHFFXLCDo7LHzNqGtp3z+RxzLd3p56FWosfibRYtCFkt4=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index:
 AQHXsHMtR+l18+MmpE6rl/RjSXTBgqx0TXyAgAME0ECAAAH2oIAAA3YAgAAA4bCAAAOtAIAAAa7AgAABegCAAAkkgIABNnUw
Date: Fri, 28 Jan 2022 04:35:28 +0000
Message-ID:
 <AS1PR08MB74260C9D87DA7B0BFD49A32F9E229@AS1PR08MB7426.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
 <PAXPR08MB7420EF1360C2E1D63D278A1B9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <b274899d-55f5-1851-82e6-69898d53e726@suse.com>
 <PAXPR08MB74205D98C454993DCFAE4FFC9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <677bb034-242d-e9ce-00ce-57e7214fd4cc@suse.com>
 <8e59b4ef-a009-b380-f262-a8381abbea16@xen.org>
In-Reply-To: <8e59b4ef-a009-b380-f262-a8381abbea16@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9FA73070DF6C54478A37882495533FDF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b81ea48a-d50f-47b7-aa73-08d9e217a19c
x-ms-traffictypediagnostic:
	AM6PR08MB3335:EE_|VE1EUR03FT008:EE_|DBBPR08MB6060:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6060D222730ADEDD0291C3839E229@DBBPR08MB6060.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RexH8/dkJYzymcci8cuYAj9aSNHrV9eId9vQrffPdu6cAvA+6zHIUddYj6Z6JfqgPpMQWRQv/PxzEan694VEFgDTpmd6ui99TWv/r2E+dYvHXM0twd4Oevp02RFpuW4XZLLHJU1HS0vz55RUybQNB9MQN/6HIgtiMSQWIjbu058hEuvdvOvyBAvGtSuwJ74g0zojONJiLWdG1n/Ay3nbso3ollsuuNyZLN3MkEf2IY2RDZvSP+S6oPMRwBI00WNKvHEJkVZ2XS0aLc6g33zdQYd37qXMcjDgs26nMbd9aw7OpeJ85wFQTJOBr8dln4mBNZYltWPLeGtqXwsIWMQSePVr6+Td/8js4kortbBwG5KP+c0D8NdHu3qjf3C8dWLMdHUBwY7Vv9jeZ19XISdzG6RFLKCSldC9l8joMEdlKRuEf3JE+rhd8uGvsf36Kshe9+81aL71Ot1BPQg5djoSzvezpHFTY1fDCinnMR2OxwObt2NP9tqqnNGPUtgvFLIyThSm61nLWoI5WjZJPpfdZDFPonpF0QEWmK2/C48xoyCgAUA1bodHRiNAdf7nO8Tgk4fNKuHcYO2d+jD1GJ5nKM3rOPmQF0Yc5pnnaTfb4p99iE4sgp1QirYT3Oj/9QH0GElHblret/x0CmGFiMVZK14Q91ciLJey71r5DGHKPTqOM8MqbQbBTsn5413ZY/tWmT0S27seUxzMI0zmF7FDhg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR08MB7426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(5660300002)(110136005)(66556008)(66446008)(66946007)(66476007)(76116006)(38100700002)(54906003)(64756008)(8936002)(55016003)(86362001)(186003)(38070700005)(8676002)(83380400001)(26005)(508600001)(316002)(4326008)(33656002)(122000001)(53546011)(7696005)(6506007)(9686003)(71200400001)(2906002)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3335
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71a93285-d172-4fcc-1c37-08d9e2179c9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9em0WEluGJPQsxw3jtmLo6OJ3ITeNj6KySgbmc3YR0grI9Dl8/NUXkMwrTf8RyxHEH6Vd6yobRKhCqxhEAzJEu4P/oE7IifjnCd0/Q47aa/GQphLqM1LkOnnZKVf2Rv6NRxBpA8iHjAz2Pg1Diyv4ocjXw8EFJX07WeSej3w7tANKvs8uoNficidiCJ7VcXmiI9GkS4vBoQ8Xujb/lcyPQ8PQ0+7noBIzf0uHaf/tAoCJdO1fG+HynbgasniGfsn27KbjmY78A9XL9ak3/Z5aboPTGBgdpldE73KX/cxHnmuE8KtLVVZQAw+ULGC+d481uAQmE5z4Lcdji87gv0fW5fzzMIJ+3gF6piKUFF1J8zqc8inzP5BbBFzeLi1U4PKn32mPc0iPifwbPe2xueGLST+Vx+zrWgsu2FvwvJNRDz94CUcKBXCL6UROVAtkvtATEMqXfF2e22IFs7NtnJWDV0pjYF612NFYAYKYR7g4ZScxuVOJ7kr6l152zlAjFye/WlY6ciS+QSD2tJALxLMXovdaVZhXiYDSyDh+H/R3VpfYEZ5JOOCB3jC6Lw/scDez+gkTXQ5xGStDVfSrMiSfj/tsu4kqtSMo0N7spfLXXWXcUwVMIEfeLvvSILiYaDmUdSJy/1Fxd04DeY0MtmuoQZKwo5VBKz/c1jttYNbEhBgbpw6jo2GtuU75BToIUxk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(55016003)(336012)(2906002)(54906003)(6506007)(9686003)(8936002)(508600001)(4326008)(8676002)(70586007)(107886003)(70206006)(110136005)(7696005)(83380400001)(52536014)(316002)(26005)(186003)(40460700003)(36860700001)(82310400004)(33656002)(86362001)(53546011)(81166007)(47076005)(356005)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 04:35:37.2222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b81ea48a-d50f-47b7-aa73-08d9e217a19c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6060

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQx5pyIMjfml6UgMTg6MDEN
Cj4gVG86IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFdlaSBDaGVuIDxXZWkuQ2hl
bkBhcm0uY29tPg0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIwLzM3XSB4ZW46IGludHJvZHVjZSBDT05G
SUdfRUZJIHRvIHN0dWIgQVBJIGZvciBub24tDQo+IEVGSSBhcmNoaXRlY3R1cmUNCj4gDQo+IEhp
LA0KPiANCj4gT24gMjcvMDEvMjAyMiAwOToyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gT24g
MjcuMDEuMjAyMiAxMDoyNSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+PiBTZW50OiAyMDIy5bm0MeaciDI35pelIDE3OjE3
DQo+ID4+Pg0KPiA+Pj4gT24gMjcuMDEuMjAyMiAxMDowOSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+
Pj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+Pj4gU2VudDog
MjAyMuW5tDHmnIgyN+aXpSAxNzowMA0KPiA+Pj4+Pg0KPiA+Pj4+PiBCdXQgeW91IHJlYWxpemUg
d2UgYWxyZWFkeSBoYXZlIHN1Y2ggYSBzdHViIGZpbGUgb24geDg2Pw0KPiA+Pj4+Pg0KPiA+Pj4+
DQo+ID4+Pj4gWWVzLCB3ZSBmb3VuZCB0aGUgcmVkZWZpbml0aW9uIGVycm9ycyB0aGF0IGFyZSBj
YXVzZWQgYnkgeDg2IHN0dWINCj4gZmlsZQ0KPiA+Pj4+IGFuZCBuZXcgbWFjcm9zIGluIHN0dWIu
aC4gV2UgaGFkIHRyaWVzIHRvIGFkZDoNCj4gPj4+PiBpZmVxICgkKFhFTl9CVUlMRF9FRkkpLHkp
DQo+ID4+Pj4gQ0ZMQUdTLXkgKz0gLURYRU5fQlVJTERfRUZJDQo+ID4+Pj4gWEVOX0NGTEFHUyAr
PSAtRFhFTl9CVUlMRF9FRkkNCj4gPj4+PiBlbmRpZg0KPiA+Pj4+IHg4Ni9NYWtlZmlsZSB0byBn
YXRlIHRoZXNlIG5ldyBtYWNyb3MsIGJ1dCBpdCBzZWVtcyB0aGF0IHdlIG1heSBuZWVkDQo+ID4+
Pj4gdG8gY2hhbmdlIEVGSSBidWlsZCBsb2dpYyBmb3IgeDg2LiBJdCB3aWxsIGNhdXNlIG1vcmUg
cmlza3MgZm9yIG1lLg0KPiA+Pj4+IFNvIEkgd2FudCB0byBpbnRyb2R1Y2UgYSBzaW1pbGFyIHN0
dWIuYyBpbiBhcmNoL2FybS4NCj4gPj4+DQo+ID4+PiBXaGlsZSB0aGF0J3MgcGVyaGFwcyBmaW5l
LCBpZGVhbGx5IGNvbW1vbiBiaXRzIHdvdWxkIGJlIGNvbW1vbi4gSWlyYw0KPiA+Pj4gYWxyZWFk
eSBiYWNrIGF0IHRoZSB0aW1lIEkgd2FzIHdvbmRlcmluZyB3aHkgc3R1Yi5jIGhhZCB0byBiZSB4
ODYtDQo+ID4+PiBvbmx5Lg0KPiA+Pg0KPiA+PiBTb21lIGR1bW15IGZ1bmN0aW9ucyBpbiBzdHVi
LmMgY2FuIGJlIHNoYXJlZCBieSBhcm0gb3Igb3RoZXINCj4gYXJjaGl0ZWN0dXJlcy4NCj4gPj4g
QnV0IHNvbWUgZnVuY3Rpb25zIGxpa2UgZWZpX211bHRpYm9vdDIgYXJlIGFyY2hpdGVjdHVyZSBk
ZXBlbmRlbnQuDQo+ID4NCj4gPiBSaWdodCAtIHRoYXQncyBubyBkaWZmZXJlbnQgZnJvbSB0aGUg
YnVsayBvZiB0aGUgbm9uLXN0dWJiZWQgRUZJIGNvZGUuDQo+ID4gSSBkb24ndCByZWFsbHkgbWlu
ZCB5b3UgbWFraW5nIGFuIEFybS1zcGVjaWZpYyBzdHViIGZpbGUgaWYgdGhlcmUncw0KPiA+IG5v
dCB2ZXJ5IG11Y2ggZHVwbGljYXRpb24sIGJ1dCBpdCBkb2Vzbid0IGZlZWwgdmVyeSBnb29kLiBJ
biB0aGUgZW5kDQo+ID4gaXQncyB1cCB0byB0aGUgQXJtIG1haW50YWluZXJzIGFueXdheS4NCj4g
DQo+IElmIHRoZSBzdHVicyBhcmUgbW9zdGx5IHRoZSBzYW1lIHRoZW4gdGhleSBzaG91bGQgYmUg
Y29tbW9uIHJhdGhlciB0aGFuDQo+IGR1cGxpY2F0ZWQuDQo+IA0KPiAgPiB4ODYvTWFrZWZpbGUg
dG8gZ2F0ZSB0aGVzZSBuZXcgbWFjcm9zLCBidXQgaXQgc2VlbXMgdGhhdCB3ZSBtYXkgbmVlZA0K
PiAgPiB0byBjaGFuZ2UgRUZJIGJ1aWxkIGxvZ2ljIGZvciB4ODYuIEl0IHdpbGwgY2F1c2UgbW9y
ZSByaXNrcyBmb3IgbWUuDQo+IA0KPiBCdXQgdGhhdCB3b3VsZCBiZSBhIGJ1aWxkIHJpc2sgcmln
aHQ/IElmIHNvLCBpdCBpcyBxdWl0ZSBlYXN5IHRvDQo+IHZlcmlmeS9jYXRjaCBpdCBjb21wYXJl
IHRvIHJ1bnRpbWUgaXNzdWUuDQo+IA0KUmlzayBtYXkgYmUgbm90IHZlcnkgYWNjdXJhdGUgd29y
ZC4gSSBtZWFuLCBJIHdhcyBhZnJhaWQgdGhhdCBteSBjaGFuZ2VzDQp0byB4ODYgRUZJIGJ1aWxk
IHdvdWxkIGludHJvZHVjZSBzb21lIHVuZm9yZXNlZW4gcHJvYmxlbXMgdG8geDg2LiBCZWNhdXNl
DQpJIGFtIG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhhdC4gQXMgeW91IGFuZCBKYW4gdGhpbmsg
aXQncyBiZXR0ZXIsIEkgd2lsbA0KdHJ5IHRvIGRvIGl0Lg0KDQo+IENoZWVycywNCj4gDQo+ID4N
Cj4gPiBKYW4NCj4gPg0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

