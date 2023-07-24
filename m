Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C675FCFF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 19:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569180.889480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzA4-0004jR-QP; Mon, 24 Jul 2023 17:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569180.889480; Mon, 24 Jul 2023 17:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNzA4-0004gT-NF; Mon, 24 Jul 2023 17:15:56 +0000
Received: by outflank-mailman (input) for mailman id 569180;
 Mon, 24 Jul 2023 17:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9g4K=DK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qNzA3-0004gN-Mc
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 17:15:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf363205-2a45-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 19:15:54 +0200 (CEST)
Received: from DUZPR01CA0232.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::6) by AS8PR08MB6054.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:15:49 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::c8) by DUZPR01CA0232.outlook.office365.com
 (2603:10a6:10:4b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32 via Frontend
 Transport; Mon, 24 Jul 2023 17:15:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.25 via Frontend Transport; Mon, 24 Jul 2023 17:15:49 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Mon, 24 Jul 2023 17:15:48 +0000
Received: from 8d3733c8114f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F17816F-B108-431F-8165-685965FC959C.1; 
 Mon, 24 Jul 2023 17:15:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8d3733c8114f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Jul 2023 17:15:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10119.eurprd08.prod.outlook.com (2603:10a6:102:364::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 17:15:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:15:30 +0000
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
X-Inumbo-ID: bf363205-2a45-11ee-b23b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWMj0fj3nc1fwJfKbqN1FEPborB7MLbH1vij1Yr698k=;
 b=gmj0AHWW84CG+Ps0JpgTH3fM5Y+BDgJbkQ1VcjtLOLqngVNw8QdlrB/p5/vLSxfkvAYdJNJj//UlSfS3W+vDlGZA8gNrX3KT+1/HkHEvnzCpcOhBy+zrCYL771dAVaeVsZNcyecfZR9Dpn9m/viTOgIL0x0ba0eeCEUpXIIEKmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b12da302572121c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brbwSmU1JZHABirExMDqe0Z51rUXHjH0eQd3uIchd3Nu6fGKYTy5E0gk6MFf7+WaDUnRlvZEh70QEN09IwSes12y0OiWPo+GZE0TpfFKSB8/r4HNX4ANGZOZiYBOhDjLelAYAb+aOLLMUDBex8kGo/wiIGi6j4GoP3OoavE1E7lDWshssNyYJtU/QFOoTx413wkAJ7/glxHSu48i+fxscbLPxiW7RKnhNZpLm6R9761/HbOwLlurkZp74OVQhKpEhPkoQ6aLaJuFwsHR0U9vtnU/beC1CKJN3sqWNZlWOu45FPhCirg/3aIP1Q8hhBKoxkT8w8Hq9kNQOIMOpCZrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWMj0fj3nc1fwJfKbqN1FEPborB7MLbH1vij1Yr698k=;
 b=ISAPTciBGzmfIhP71/EdO4HASYRFn5OZgKo5qjb6Y8lfrYpDpIsK9K4vreeYTo6HbZ3Ux7YFOs8WJ9vi7objZAAOcclPeE7sWw0dfFWSDl+ggpEwJglo8/V2Njp0lz20PKAq4IojyVKy6QpmtndP8qmv6hb+vGpgJTWjcOr3NkzBKCrcLcE2WwhxLc8YU6HsRXGwoNSlVT7GZ3MAxU2FdPvc+RsyslhVJ1m+8Itq4vaBd4PHUv2QKl0zoHBjg2fK+4azxSHMwRsY8wiiw415SHJZAuzj0CsucptRETfEFFK+KPkU2fAnsUfMt8LPktXWkBHxrZKdSCLdgbAkUV2nIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWMj0fj3nc1fwJfKbqN1FEPborB7MLbH1vij1Yr698k=;
 b=gmj0AHWW84CG+Ps0JpgTH3fM5Y+BDgJbkQ1VcjtLOLqngVNw8QdlrB/p5/vLSxfkvAYdJNJj//UlSfS3W+vDlGZA8gNrX3KT+1/HkHEvnzCpcOhBy+zrCYL771dAVaeVsZNcyecfZR9Dpn9m/viTOgIL0x0ba0eeCEUpXIIEKmE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH v2] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZvhfALUYUxcU0dEyDyil7nxQeXq/JKKkA
Date: Mon, 24 Jul 2023 17:15:30 +0000
Message-ID: <AD86AD11-2FFC-4276-B0B4-F0E370F22EBC@arm.com>
References: <20230724101458.79412-1-julien@xen.org>
In-Reply-To: <20230724101458.79412-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10119:EE_|DBAEUR03FT018:EE_|AS8PR08MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: eb783c46-b0c9-403c-e1c5-08db8c69a03b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uIkii3BQfr0b/zbI/kplm6B4Ptb3dS6WRIukhHXJEaFzY1kF+gDX03d/uQQw6BTafOMLEZ+r5jXLuzng/kEV2hnRbgahq4VoUa2+MvqqJPES02qODTzucZpqj0itC79gMDQ8kKH/nVNX3emkPdGmwfcLaInJvC2+unR4SmTWSyOpnaURprEYYfh/ZlsyOZKjVr+xNqkwHsM0P3YUIvjTHWGhasro7tmQ6fz6pduB9UInWAdajANatRC10XrxeyLXQjUkhJFfhJxyRZcSeJaMNU/l0OP9k/39+wx0Pv5K94GetfLRBvIGlha3OYJ41mD7kufyS/96tnJuf1eBjO5inKIPcDwPlm6YVR8KLAvjMKtuJdfm+XEKwNHesBxuFByfbufysc1M193eEH/Xraaku8yIWqHkto6iXf7P0YDHabe7dF3fDZpXZXmxVwlaEQCTz4TK7XNoroZWP+zAJasYq59cIBPfBc6uWeWf1vigfTaCa2oTquVaTvm9zhPfDWuRXhM7dnNAmW5l8VSyM+Td0SrPvUQsCMWBZNdWJ1C6KUESkp9STFFpkxhfp+22T3Baj0gG4ruFo+Nt6ViLnC43U2T2TCkqmu+LpcLNkzw0WhgylgridK6ltTx3PxveGzZTc3CBlu8Gdox7qXL+zrntSw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199021)(36756003)(66476007)(5660300002)(26005)(38070700005)(186003)(6506007)(66946007)(4326008)(6916009)(316002)(66446008)(66556008)(76116006)(41300700001)(91956017)(64756008)(71200400001)(53546011)(6486002)(2616005)(2906002)(4744005)(6512007)(8676002)(478600001)(8936002)(54906003)(83380400001)(86362001)(38100700002)(33656002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <31F934B3EC1A854A9169F335FBC17564@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10119
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ae2862c-d880-4eb8-c784-08db8c699527
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EwjvUJlRWlMNs9eAxt9TIkD+QSv1aXuxsCJerGn4uknXxJxauI7X9MezDjmJ5Y5CaYxC0j7idO44dRxpGhmWTkSLz/MZcK1IiKIJzIgm20DAo/5jBvSDdORuCOGdaKzXmJC4CZL61uBEiNtoApenNJhfRi2dTYu81cB3nIlFQo/G+9Un3maIdyWWVGYj4/p+tofy7+hKDeKhE82o/Z+WtfMdolBtZi2L2mkriCFEAKYdT8M/0ufboI/1j30yL+SqQymsAh3hBRZcB1QEg1DnZaQR7zsjhNaNyKDsgheo+sEzPG00I03fyo/v5Dplhj/L0fT33gxgbGarFdDHKfvWAkMf59A/3HIIjgAtrhyolEEGouvAypMo/vcozRMb231bJQotgcIqjKS0GIeZrpJ4fPXmOJeSZEbTeI4edzcYJ1lWYNbmg+/vNix/AMvJ50SS2xpX+hTwPXhEW2Q51MOqCP1zjxIZpqeshxRUAdA5DlhxJ6ae75y9lb1DMqS84R6tNTZsKCuYxzEdqc1Y6x+M1vd1CrF8io8pZG0vBwcNMytHg31soWXHYp7+OSltSjklc6UMDDOguXjmSU4FuTVLN1FuCo5a0Xdd1KEGVlnrvPgnU6Nohpxyc8UjNM1Zu/k5CyLTcrSe34ijG3W7kb0MV/ngUxNEX6kI1BixBCGFofGg359juYgXL1m4S8WUHOpa7rxg3uLpLK/PrXi9be/M492Ryn8+h3y/zc07OsR8M+ZvSId59s62Nk9EZPvz3Kyc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(40460700003)(33656002)(82740400003)(86362001)(356005)(40480700001)(81166007)(6486002)(4744005)(2906002)(6512007)(47076005)(2616005)(107886003)(53546011)(6506007)(186003)(26005)(336012)(36756003)(5660300002)(41300700001)(70206006)(70586007)(316002)(4326008)(478600001)(8676002)(8936002)(6862004)(54906003)(83380400001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:15:49.0634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb783c46-b0c9-403c-e1c5-08db8c69a03b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6054

DQoNCj4gT24gMjQgSnVsIDIwMjMsIGF0IDExOjE0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBBdCB0aGUgbW9tZW50LCB0aGUgdGVtcG9yYXJ5IG1hcHBpbmcgaXMgb25seSB1c2Vk
IHdoZW4gdGhlIHZpcnR1YWwNCj4gcnVudGltZSByZWdpb24gb2YgWGVuIGlzIGNsYXNoaW5nIHdp
dGggdGhlIHBoeXNpY2FsIHJlZ2lvbi4NCj4gDQo+IEluIGZvbGxvdy11cCBwYXRjaGVzLCB3ZSB3
aWxsIHJld29yayBob3cgc2Vjb25kYXJ5IENQVSBicmluZy11cCB3b3Jrcw0KPiBhbmQgaXQgd2ls
bCBiZSBjb252ZW5pZW50IHRvIHVzZSB0aGUgZml4bWFwIGFyZWEgZm9yIGFjY2Vzc2luZw0KPiB0
aGUgcm9vdCBwYWdlLXRhYmxlIChpdCBpcyBwZXItY3B1KS4NCj4gDQo+IFJld29yayB0aGUgY29k
ZSB0byB1c2UgdGVtcG9yYXJ5IG1hcHBpbmcgd2hlbiB0aGUgWGVuIHBoeXNpY2FsIGFkZHJlc3MN
Cj4gaXMgbm90IG92ZXJsYXBwaW5nIHdpdGggdGhlIHRlbXBvcmFyeSBtYXBwaW5nLg0KPiANCj4g
VGhpcyBhbHNvIGhhcyB0aGUgYWR2YW50YWdlIHRvIHNpbXBsaWZ5IHRoZSBsb2dpYyB0byBpZGVu
dGl0eSBtYXANCj4gWGVuLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3Jh
bGxAYW1hem9uLmNvbT4NCg0KSGkgSnVsaWVuLA0KDQpTZWVtcyBnb29kIHRvIG1lLCBJ4oCZdmUg
YWxzbyB0ZXN0ZWQgb24gcWVtdSBhbmQgRlZQLCBjcmVhdGluZy9kZXN0cm95aW5nIGd1ZXN0cyBh
bmQgbm8gaXNzdWVzIHNvIGZhci4NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2Eu
ZmFuY2VsbHVAYXJtLmNvbT4NClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxs
dUBhcm0uY29tPg0KDQoNCg==

