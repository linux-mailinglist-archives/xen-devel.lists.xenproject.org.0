Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B25027A0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 11:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305669.520757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfId4-0001yb-IW; Fri, 15 Apr 2022 09:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305669.520757; Fri, 15 Apr 2022 09:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfId4-0001wk-F4; Fri, 15 Apr 2022 09:52:38 +0000
Received: by outflank-mailman (input) for mailman id 305669;
 Fri, 15 Apr 2022 09:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y4D=UZ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nfId3-0001we-GC
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 09:52:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c60ac00d-bca1-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 11:52:35 +0200 (CEST)
Received: from AM7PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:110::30)
 by AM0PR08MB3331.eurprd08.prod.outlook.com (2603:10a6:208:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 09:52:31 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::a5) by AM7PR04CA0020.outlook.office365.com
 (2603:10a6:20b:110::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Fri, 15 Apr 2022 09:52:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Fri, 15 Apr 2022 09:52:30 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Fri, 15 Apr 2022 09:52:29 +0000
Received: from e9f6d6aafce8.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5ED546D9-865B-4000-9FD8-86E855700636.1; 
 Fri, 15 Apr 2022 09:52:20 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9f6d6aafce8.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Apr 2022 09:52:20 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DBBPR08MB4508.eurprd08.prod.outlook.com (2603:10a6:10:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 09:52:15 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::b97d:6bc0:1ce6:ee38]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::b97d:6bc0:1ce6:ee38%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 09:52:15 +0000
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
X-Inumbo-ID: c60ac00d-bca1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+6wfYKYO48PvL1zb+hNMHa4fCRhRKrcUwf9p5hplCo=;
 b=AVPHIPTCs7dzp/+5TMxIx3VuCmtRN1VXJs66uKUB2SVCzkewUUlkONtGu2fvUbu0vvwhd5F5gZ3zR0RzAb9MnQDAjb7ipWpXijoPooXCVhZL0WZjBNx99tjwmzbHmy6xxn2RP0z2gFOSUfGTg0iPxVAowOIkXeQJcIYX1aZq2Ac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbyaJYQoM1U8Q5nLZ3mqEzkZTEBi0/diR4XOrZvPsjd3PTUq/wNGn7KRhQsG7/XnP88E1nUjkE5bWpoSx9VJWpCiw2PPWcYh+Shh2PC9iBur50JlgX2uxnDQJKBKrbvFQjJ/b6BvrBFKaFphd0rHy39YYm+7VG6hjiVVYK/H5IWnrvQxaqgSzmEVRm6zEBuiDQJ7CCcuMTGkRFgHeM70LWdtxa7UWuLEbd71kz2VPc4lHo0ahTfTOV3KP0wCicc8CXKNHYCl3J7kRgKNXn7bDxAeRtSE9SMvRvYDXCQS10SYcnOm9ZY9Bq/5JnCdIhVyxxRPcg35I+asncdw7Lq/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+6wfYKYO48PvL1zb+hNMHa4fCRhRKrcUwf9p5hplCo=;
 b=CLbhzf2G0ybuAKZUGMfx6yC5k550UVpWC4OFD7GiwL+6CnL7XxHXN35fXF59P+Zuq3DrC4/EF7X0MW2a+QnYrOAcNQ8TXEoz4/YRg88kdBG4HCoNqNbMIEL3cWIU7wqkwy0vCAoRtj9vGTtwR66FtyXtGQORPrKdC2wyjWZrAlfM0qjFp3/OXos1lgVZHmFqj6bEJCr9T/2/lM34T7iqPIsJWYJKQgGmFU5ND4IMSCp/cFrnnbubRBT6xcxuWtkUtsKehdGOj/Gl1rAB7DIkwPCFaA7c7Tvt0RBVwgLpLeVw3qH97QmMYU/Vubfxy7dogDkcTVb8+/mOogplL6o9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+6wfYKYO48PvL1zb+hNMHa4fCRhRKrcUwf9p5hplCo=;
 b=AVPHIPTCs7dzp/+5TMxIx3VuCmtRN1VXJs66uKUB2SVCzkewUUlkONtGu2fvUbu0vvwhd5F5gZ3zR0RzAb9MnQDAjb7ipWpXijoPooXCVhZL0WZjBNx99tjwmzbHmy6xxn2RP0z2gFOSUfGTg0iPxVAowOIkXeQJcIYX1aZq2Ac=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>
Subject: RE: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
Thread-Topic: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
Thread-Index: AQHYNQ8BtyFeP2p9kkWMo7TCkVRwI6zE4SIAgCv+qWA=
Date: Fri, 15 Apr 2022 09:52:15 +0000
Message-ID:
 <DU2PR08MB7325265A2356A09AC1DA5FDDF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
In-Reply-To: <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E2426FB9878C5648AE114DBCDD8731CA.1
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cf0032bc-0312-4e12-4eee-08da1ec5a828
x-ms-traffictypediagnostic:
	DBBPR08MB4508:EE_|VE1EUR03FT027:EE_|AM0PR08MB3331:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB33311874D5F223268DBD93C1F7EE9@AM0PR08MB3331.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 199qmm7Whe6UeLQn09IVVlQgTYAZdQ8suFaAbqcDRCWzucY67NDuMb4qT0jtf3qf0U2PpPOkrJ6iFEJdw5e9OEN8Ne2CryP+/aGXL6M+Hke1FRZE/dZzvoIYH4U0mOWpITCpwzBPZPx3NisD64NeS8eFLKSAbh6L3DAWfOf0RyjizsUttt0evSiz2LSY+LaD2Kulzctq1CZy3Soo221r3o3xunbxWia7mv7igX3h3wMijekHH5zHdSbjoE+zawo9u18IG+f7Be9MppxfAapcUEXbXMkMT8huTNp7E2Jy5XmO7hCCw6mXwDQVLI/BvveRHWko6SJmUe83gpn/HbhmLfPw/6w5/Q4ZtsU8pYC2tR93jUGAT5wCpdahuJkk7YGSjdL2CXqDd7uGWzX/Fsxpyj5UaDVaTuFE6EuJYP6scjHZdbMrWWn98yQL/0zBazOCGai5LN6FkJPdFI1nrnZaf6WUnouOYlCQ46VAOPoM2NH0MbY1v+cN5ztNjnfPSvz+wV7vVPqPgYAjY98mwO38RarIoJnvAU+ND0Lzv+prhjssZKG4g6I8IzuFNXN6/yUOemBaNBP560n8NtKqwX3ZqOEwBJzA5IMZM8KLxE9jE5g2QJyN3hJrjTtA+KPQPjXfCOIv/vvpNei9nEmBn5dPEy+VhJPrSYYxs78bbSogj+whBQYVLv46gID0Gl8Cu/WQL71ZfRox/77rAFFSEAOYdQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(26005)(6506007)(2906002)(316002)(6916009)(38070700005)(83380400001)(38100700002)(54906003)(66476007)(64756008)(33656002)(76116006)(55016003)(86362001)(8936002)(4326008)(66946007)(9686003)(122000001)(66446008)(52536014)(66556008)(8676002)(186003)(53546011)(7696005)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4508
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4833c966-0f85-498f-6f92-08da1ec59f3d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rq9/+EG2TAZZ0eoE+XSVGjr8Pj8LShzVRD9GI9wTHxiENup0c3kEewVYj9Xb/383i0DO+0PdpAbzKfozkvGo6V88wPglL3PoCSJjd20h4JG5nl11vrMgC0gnjVo3EbYwvtwaudaIuRQjQNratDIEultdeLIU8YtnDT5CqbhIqAP3wDfYK2GboKtIESWvL35SXPYJ113BS5z37B6IkRlLMRg5ThJxPa/RGsIeVEvfJrmOxvE9kQ3sgNYcls1zX/bvVHrW1e7mmslkQrIFoqwrjjiFaAKyvPHcXOboIvZgYxTrg7LeZaihrrJrPuJZJCYJMQe0nfQyZwI1Ku43yVaN6mW1wB4GZMfQ7fEgGdvXNtaNSpkw1OXmMgv7Bw8q4ZjFSGrDEVzNVbqGinBi29hv+vttqv/jKtjwHA5UJiZm5jfmYbcX8Ak7++qYZAI30VH0ETvHyJNI7WvDisCOR8i8fULjkiu6HedM+2t5Xfb84iekg8Hg66n5fi94U3TI+eQ0p0Qy/VmVhRFrpMxsmwarwbkXbLvQSJWqdAcJAGx2hBpZGXb1HgsSoqPcfnkiOwF++B4IYYTCednYMPa7lVeenhtVg2+wUdftOnSObpO+aAYJvtTLZjc5SKSntJU3eRJddfhf0vtS1OMl8HeRFu8v/HIgZ5XhCsFJBJIiMhBs12/+bF1hbKn53FXnN4guddw4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(9686003)(2906002)(6506007)(86362001)(55016003)(33656002)(36860700001)(82310400005)(83380400001)(186003)(26005)(53546011)(5660300002)(7696005)(40460700003)(356005)(316002)(70586007)(70206006)(8936002)(52536014)(54906003)(6862004)(4326008)(336012)(81166007)(47076005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 09:52:30.3701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0032bc-0312-4e12-4eee-08da1ec5a828
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3331

SGkgamFuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXJjaCAxOCwgMjAyMiA0
OjUzIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IG5k
IDxuZEBhcm0uY29tPjsgUGVubnkgWmhlbmcNCj4gPHBlbnpoZTAxQGEwMTEyOTIuc2hhbmdoYWku
YXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0Jh
YmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsNCj4gV2VpIExp
dSA8d2xAeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYxIDAyLzEzXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBzcGVjaWFsIGRvbWFp
bg0KPiBET01JRF9TSEFSRUQNCj4gDQo+IE9uIDExLjAzLjIwMjIgMDc6MTEsIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+IEluIGNhc2UgdG8gb3duIHN0YXRpY2FsbHkgc2hhcmVkIHBhZ2VzIHdoZW4g
b3duZXIgZG9tYWluIGlzIG5vdA0KPiA+IGV4cGxpY2l0bHkgZGVmaW5lZCwgdGhpcyBjb21taXRz
IHByb3Bvc2UgYSBzcGVjaWFsIGRvbWFpbg0KPiA+IERPTUlEX1NIQVJFRCwgYW5kIHdlIGFzc2ln
biBpdCAweDdGRjUsIGFzIG9uZSBvZiB0aGUgc3lzdGVtIGRvbWFpbnMuDQo+ID4NCj4gPiBTdGF0
aWNhbGx5IHNoYXJlZCBtZW1vcnkgcmV1c2VzIHRoZSBzYW1lIHdheSBvZiBpbml0aWFsaXphdGlv
biB3aXRoDQo+ID4gc3RhdGljIG1lbW9yeSwgaGVuY2UgdGhpcyBjb21taXRzIHByb3Bvc2VzIGEg
bmV3IEtjb25maWcNCj4gPiBDT05GSUdfU1RBVElDX1NITSB0byB3cmFwIHJlbGF0ZWQgY29kZXMs
IGFuZCB0aGlzIG9wdGlvbiBkZXBlbmRzIG9uDQo+IHN0YXRpYyBtZW1vcnkoQ09ORklHX1NUQVRJ
Q19NRU1PUlkpLg0KPiA+DQo+ID4gV2UgaW50ZW5kcyB0byBkbyBzaGFyZWQgZG9tYWluIGNyZWF0
aW9uIGFmdGVyIHNldHVwX3ZpcnRfcGFnaW5nIHNvDQo+ID4gc2hhcmVkIGRvbWFpbiBjb3VsZCBz
dWNjZXNzZnVsbHkgZG8gcDJtIGluaXRpYWxpemF0aW9uLg0KPiANCj4gVGhlcmUncyBub3RoaW5n
IHNhaWQgaGVyZSwgaW4gdGhlIGVhcmxpZXIgcGF0Y2gsIG9yIGluIHRoZSBjb3ZlciBsZXR0ZXIg
YWJvdXQgdGhlDQo+IHNlY3VyaXR5IGFzcGVjdHMgb2YgdGhpcy4gVGhlcmUgaXMgYSByZWFzb24g
d2UgaGF2ZW4ndCBiZWVuIGFsbG93aW5nIGFyYml0cmFyeSwNCj4gdW4tc3VwZXJ2aXNlZCBzaGFy
aW5nIG9mIG1lbW9yeSBiZXR3ZWVuIGRvbWFpbnMuIEl0IHdhbnRzIGNsYXJpZnlpbmcgd2h5IGUu
Zy4NCj4gZ3JhbnRzIGFyZW4ndCBhbiBvcHRpb24gdG8gYWNoaWV2ZSB3aGF0IHlvdSBuZWVkLCBh
bmQgaG93IHlvdSBtZWFuIHRvDQo+IGVzdGFibGlzaCB3aGljaCBkb21haW5zIGFyZSAvIGFyZW4n
dCBwZXJtaXR0ZWQgdG8gYWNjZXNzIGFueSBpbmRpdmlkdWFsIHBhZ2UNCj4gb3duZWQgYnkgdGhp
cyBkb21haW4uDQo+IA0KDQpJJ2xsIGFkZCB0aGUgc2VjdXJpdHkgYXNwZWN0cyB3aGF0IFN0ZWZh
bm8gZXhwbGFpbnMgaW4gdGhlIGNvdmVyIGxldHRlciBuZXh0IHNlcmllDQpmb3IgYmV0dGVyIHVu
ZGVyc3RhbmRpbmcuDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+ICsrKyBi
L3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4gQEAgLTEwNiw2ICsxMDYsMTMgQEAgY29uZmlnIFRF
RQ0KPiA+DQo+ID4gIHNvdXJjZSAiYXJjaC9hcm0vdGVlL0tjb25maWciDQo+ID4NCj4gPiArY29u
ZmlnIFNUQVRJQ19TSE0NCj4gPiArICAgICAgIGJvb2wgIlN0YXRpY2FsbHkgc2hhcmVkIG1lbW9y
eSBvbiBhIGRvbTBsZXNzIHN5c3RlbSIgaWYgVU5TVVBQT1JURUQNCj4gPiArICAgICAgIGRlcGVu
ZHMgb24gU1RBVElDX01FTU9SWQ0KPiA+ICsgICAgICAgZGVmYXVsdCBuDQo+IA0KPiBOaXQ6ICJk
ZWZhdWx0IG4iIGlzIHJlZHVuZGFudCBhbmQgaGVuY2Ugd291bGQgaW1vIGJldHRlciBiZSBvbWl0
dGVkLg0KPiANCj4gPiBAQCAtNzEyLDEyICs3MTYsMTYgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0
ZShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICAgICAgZC0+YXJjaC5kaXJlY3RtYXAgPSBmbGFncyAm
IENERl9kaXJlY3RtYXA7DQo+ID4NCj4gPiAgICAgIC8qIHAybV9pbml0IHJlbGllcyBvbiBzb21l
IHZhbHVlIGluaXRpYWxpemVkIGJ5IHRoZSBJT01NVSBzdWJzeXN0ZW0gKi8NCj4gPiAtICAgIGlm
ICggKHJjID0gaW9tbXVfZG9tYWluX2luaXQoZCwgY29uZmlnLT5pb21tdV9vcHRzKSkgIT0gMCAp
DQo+ID4gKyAgICBpZiAoIChyYyA9IGlvbW11X2RvbWFpbl9pbml0KGQsIGlzX3NoYXJlZF9kb21h
aW4oZCkgPyAwIDoNCj4gPiArIGNvbmZpZy0+aW9tbXVfb3B0cykpICE9IDAgKQ0KPiANCj4gTml0
OiBPdmVybG9uZyBsaW5lLg0KPiANCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4gQEAgLTg1NSw2ICs4NTUsMjAgQEAgc3Rh
dGljIGJvb2wgX19pbml0IGlzX2RvbTBsZXNzX21vZGUodm9pZCkNCj4gPiAgICAgIHJldHVybiAo
ICFkb20wZm91bmQgJiYgZG9tVWZvdW5kICk7ICB9DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19T
VEFUSUNfU0hNDQo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9zaGFyZWRfZG9tYWluKHZv
aWQpIHsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBJbml0aWFsaXNlIG91ciBET01JRF9TSEFS
RUQgZG9tYWluLg0KPiA+ICsgICAgICogVGhpcyBkb21haW4gb3ducyBzdGF0aWNhbGx5IHNoYXJl
ZCBwYWdlcyB3aGVuIG93bmVyIGRvbWFpbiBpcyBub3QNCj4gPiArICAgICAqIGV4cGxpY2l0bHkg
ZGVmaW5lZC4NCj4gPiArICAgICAqLw0KPiA+ICsgICAgZG9tX3NoYXJlZCA9IGRvbWFpbl9jcmVh
dGUoRE9NSURfU0hBUkVELCBOVUxMLCBDREZfZGlyZWN0bWFwKTsNCj4gPiArICAgIGlmICggSVNf
RVJSKGRvbV9zaGFyZWQpICkNCj4gPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGNyZWF0ZSBk
W1NIQVJFRF06ICVsZFxuIiwNCj4gPiArUFRSX0VSUihkb21fc2hhcmVkKSk7DQo+IA0KPiBJIGRv
bid0IHRoaW5rIHRoaXMgc2hvdWxkIGJlIGEgcGFuaWMgLSB0aGUgc3lzdGVtIG91Z2h0IHRvIGJl
IGFibGUgdG8gY29tZSB1cA0KPiBmaW5lLCBqdXN0IHdpdGhvdXQgYWN0dWFsbHkgdXNpbmcgdGhp
cyBkb21haW4uIEFmdGVyIGFsbCB0aGlzIGlzIGFuIG9wdGlvbmFsDQo+IGZlYXR1cmUgd2hpY2gg
bWF5IG5vdCBhY3R1YWxseSBiZSB1c2VkLg0KPiANCj4gQWxzbywgYWxvbmcgdGhlIGxpbmVzIG9m
IHdoYXQgU3RlZmFubyBoYXMgc2FpZCwgdGhpcyBzZXR0aW5nIHVwIG9mIHRoZSBkb21haW4NCj4g
d291bGQgYWxzbyBiZXR0ZXIgbGl2ZSBuZXh0IHRvIHdoZXJlIHRoZSBvdGhlciBzcGVjaWFsIGRv
bWFpbnMgYXJlIHNldCB1cC4gQW5kDQo+IGV2ZW4gaWYgaXQgd2FzIHRvIHJlbWFpbiBoZXJlLCAu
Li4NCj4gDQoNClRoZSByZWFzb24gd2h5IEkgcGxhY2UgdGhlIHNldHRpbmcgdXAgaGVyZSBpcyB0
aGF0IERPTUlEX1NIQVJFRCBuZWVkcyB0byBtYXANCnByZS1jb25maWd1cmVkIHN0YXRpYyBzaGFy
ZWQgbWVtb3J5IGluIGl0cyBwMm0gdGFibGUsIHNvIGl0IG11c3QgYmUgc2V0IHVwDQphZnRlciBz
eXN0ZW0gUDJNIGluaXRpYWxpemF0aW9uKHNldHVwX3ZpcnRfcGFnaW5nKCkpLiBzZXR1cF9zeXN0
ZW1fZG9tYWlucygpDQppcyBjYWxsZWQgYmVmb3JlIHN5c3RlbSBQMk0gaW5pdGlhbGl6YXRpb24g
b24geGVuL2FyY2gvYXJtL3NldHVwLmMsIHdoaWNoDQpjYW4ndCBtZWV0IHRoZSByZXF1aXJlbWVu
dC4NCg0KPiA+IEBAIC0xMDIyLDYgKzEwMzYsMTQgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVu
c2lnbmVkIGxvbmcNCj4gYm9vdF9waHlzX29mZnNldCwNCj4gPiAgICAgIGFwcGx5X2FsdGVybmF0
aXZlc19hbGwoKTsNCj4gPiAgICAgIGVuYWJsZV9lcnJhdGFfd29ya2Fyb3VuZHMoKTsNCj4gPg0K
PiA+ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19TSE0NCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBU
aGlzIG5lZWRzIHRvIGJlIGNhbGxlZCAqKmFmdGVyKiogc2V0dXBfdmlydF9wYWdpbmcgc28gc2hh
cmVkDQo+ID4gKyAgICAgKiBkb21haW5zIGNvdWxkIHN1Y2Nlc3NmdWxseSBkbyBwMm0gaW5pdGlh
bGl6YXRpb24uDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIHNldHVwX3NoYXJlZF9kb21haW4oKTsN
Cj4gPiArI2VuZGlmDQo+IA0KPiAuLi4gdGhlICNpZmRlZi1hcnkgaGVyZSBzaG91bGQgYmUgYXZv
aWRlZCBieSBtb3ZpbmcgdGhlIG90aGVyICNpZmRlZiBpbnNpZGUgdGhlDQo+IGZ1bmN0aW9uIGJv
ZHkuDQo+IA0KPiA+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPiArKysgYi94ZW4vY29t
bW9uL2RvbWFpbi5jDQo+ID4gQEAgLTY0MywxMSArNjQzLDE0IEBAIHN0cnVjdCBkb21haW4gKmRv
bWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwNCj4gPg0KPiA+ICAgICAgcmFuZ2VzZXRfZG9tYWlu
X2luaXRpYWxpc2UoZCk7DQo+ID4NCj4gPiAtICAgIC8qIERPTUlEX3tYRU4sSU8sZXRjfSAob3Ro
ZXIgdGhhbiBJRExFKSBhcmUgc3VmZmljaWVudGx5IGNvbnN0cnVjdGVkLiAqLw0KPiA+IC0gICAg
aWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpICYmICFpc19pZGxlX2RvbWFpbihkKSApDQo+ID4gKyAg
ICAvKg0KPiA+ICsgICAgICogRE9NSURfe1hFTixJTyxldGN9IChvdGhlciB0aGFuIElETEUgYW5k
IERPTUlEX3NoYXJlZCkgYXJlDQo+ID4gKyAgICAgKiBzdWZmaWNpZW50bHkgY29uc3RydWN0ZWQu
DQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGlmICggaXNfc3lzdGVtX2RvbWFpbihkKSAmJiAhaXNf
aWRsZV9kb21haW4oZCkgJiYNCj4gPiArICFpc19zaGFyZWRfZG9tYWluKGQpICkNCj4gPiAgICAg
ICAgICByZXR1cm4gZDsNCj4gPg0KPiA+IC0gICAgaWYgKCAhaXNfaWRsZV9kb21haW4oZCkgKQ0K
PiA+ICsgICAgaWYgKCAhaXNfaWRsZV9kb21haW4oZCkgJiYgIWlzX3NoYXJlZF9kb21haW4oZCkg
KQ0KPiA+ICAgICAgew0KPiA+ICAgICAgICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihkKSAp
DQo+ID4gICAgICAgICAgICAgIGQtPm5yX3BpcnFzID0gbnJfc3RhdGljX2lycXMgKyBleHRyYV9k
b21VX2lycXM7IEBAIC02NjMsNw0KPiA+ICs2NjYsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5f
Y3JlYXRlKGRvbWlkX3QgZG9taWQsDQo+ID4gICAgICAgICAgZ290byBmYWlsOw0KPiA+ICAgICAg
aW5pdF9zdGF0dXMgfD0gSU5JVF9hcmNoOw0KPiA+DQo+ID4gLSAgICBpZiAoICFpc19pZGxlX2Rv
bWFpbihkKSApDQo+ID4gKyAgICBpZiAoICFpc19pZGxlX2RvbWFpbihkKSAmJiAhaXNfc2hhcmVk
X2RvbWFpbihkKSApDQo+ID4gICAgICB7DQo+ID4gICAgICAgICAgd2F0Y2hkb2dfZG9tYWluX2lu
aXQoZCk7DQo+ID4gICAgICAgICAgaW5pdF9zdGF0dXMgfD0gSU5JVF93YXRjaGRvZzsNCj4gDQo+
IEFsbCBvZiB0aGVzZSBleHRyYSBpc19zaGFyZWRfZG9tYWluKCkgYXJlIHF1aXRlIHVnbHkgdG8g
c2VlIGFkZGVkLg0KPiBGaXJzdCBhbmQgZm9yZW1vc3QgZ29pbmcgdGhpcyByb3V0ZSBkb2Vzbid0
IHNjYWxlIHZlcnkgd2VsbCAtIGNvbnNpZGVyIGhvdyB0aGUNCj4gY29kZSB3aWxsIGxvb2sgbGlr
ZSB3aGVuIHR3byBtb3JlIHNwZWNpYWwgZG9tYWlucyB3aXRoIHNwZWNpYWwgbmVlZHMgd291bGQN
Cj4gYmUgYWRkZWQuIEkgdGhpbmsgeW91IHdhbnQgdG8gYWJzdHJhY3QgdGhpcyBzb21lIGJ5IGlu
dHJvZHVjaW5nIG9uZSAob3IgYSBzbWFsbA0KPiBzZXQgb2YpIG5ldyBpc18uLi4oKSBvciBlLmcu
IG5lZWRzXy4uLigpIHByZWRpY2F0ZXMuDQo+IA0KDQpBZ3JlZS4gU2hhcmVkIGRvbWFpbiBuZWVk
cyB0aGUgcDJtIGluaXRpYWxpemF0aW9uKHAybV9pbml0KSwgd2hpY2ggaXMNCmluIGFyY2hfZG9t
YWluX2NyZWF0ZS4gU28gSSB3aWxsIGludHJvZHVjZSBhIG5ldyBoZWxwZXIgbmVlZHNfYXJjaF9k
b21haW5fY3JlYXRpb24oKQ0KdG8gaW5jbHVkZSB0aGVzZSBzeXN0ZW0gZG9tYWlucyB3aGljaCBu
ZWVkIHRvIGNhbGwgYXJjaF9kb21haW5fY3JlYXRlIHRvDQpiZSBzdWZmaWNpZW50bHkgY29uc3Ry
dWN0ZWQuDQoNCj4gRnVydGhlciAodGhlcmUncyBubyBwYXJ0aWN1bGFybHkgZ29vZCBwbGFjZSB0
byBtZW50aW9uIHRoaXMpIEknbSBhZnJhaWQgSSBkb24ndA0KPiB2aWV3ICJzaGFyZWQiIGFzIGEg
Z29vZCBuYW1lOiBJdCdzIG5vdCB0aGUgZG9tYWluIHdoaWNoIGlzIHNoYXJlZCwgYnV0IGl0J3Mg
dGhlDQo+IGRvbWFpbiB0byBob2xkIHNoYXJlZCBtZW1vcnkuIEZvciB0aGlzIG15IGZpcnN0IGNv
bnNpZGVyYXRpb24gd291bGQgYmUgdG8NCj4gc2VlIHdoZXRoZXIgYW4gZXhpc3Rpbmcgc3BlY2lh
bCBkb21haW4gY2FuIGJlIHJlLXVzZWQ7IGFmdGVyIGFsbCB0aGUgc2V0IG9mDQo+IHJlc2VydmVk
IGRvbWFpbiBJRHMgaXMgYSB2ZXJ5IGxpbWl0ZWQgb25lLCBhbmQgaGVuY2UgZWFjaCB2YWx1ZSB0
YWtlbiBmcm9tDQo+IHRoZXJlIHNob3VsZCBjb21lIHdpdGggYSB2ZXJ5IGdvb2QgcmVhc29uLiBX
ZSBkaWQgc3VjaCByZS11c2UgZS5nLiB3aGVuDQo+IGludHJvZHVjaW5nIHF1YXJhbnRpbmluZyBm
b3IgUENJIGRldmljZXMsIGJ5IGFzc29jaWF0aW5nIHRoZW0gd2l0aCBET01fSU8NCj4gcmF0aGVy
IHRoYW4gaW52ZW50aW5nIGEgbmV3IERPTV9RVUFSQU5USU5FLiBJZiB0aGVyZSBhcmUgZ29vZCBy
ZWFzb25zDQo+IHNwZWFraW5nIGFnYWluc3Qgc3VjaCByZS11c2UsIHRoZW4gSSdkIGxpa2UgdG8g
YXNrIHRvIGNvbnNpZGVyIGUuZy4NCj4gRE9NSURfU0hNIC8gRE9NSURfU0hNRU0gcGx1cyBhc3Nv
Y2lhdGVkIHByZWRpY2F0ZS4NCj4gDQoNCkknbGwgdGFrZSBzdGVmYW5vJ3Mgc3VnZ2VzdGlvbiB0
byByZXVzZSBET01JRF9JTy4NCg0KPiA+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+
ID4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBAQCAtMjYxNiw2ICsyNjE2LDEx
IEBAIHN0cnVjdCBkb21haW4gKmdldF9wZ19vd25lcihkb21pZF90IGRvbWlkKQ0KPiA+DQo+ID4g
ICAgICBzd2l0Y2ggKCBkb21pZCApDQo+ID4gICAgICB7DQo+ID4gKyNpZmRlZiBDT05GSUdfU1RB
VElDX1NITQ0KPiA+ICsgICAgY2FzZSBET01JRF9TSEFSRUQ6DQo+ID4gKyAgICAgICAgcGdfb3du
ZXIgPSByY3VfbG9ja19kb21haW4oZG9tX3NoYXJlZCk7DQo+ID4gKyAgICAgICAgYnJlYWs7DQo+
ID4gKyNlbmRpZg0KPiANCj4gUGxlYXNlIGNhbiB5b3UgYXZvaWQgI2lmZGVmIGluIGNhc2VzIGxp
a2UgdGhpcyBvbmUsIGJ5IGluc3RlYWQgdXNpbmcNCj4gDQo+ICAgICBjYXNlIERPTUlEX1NITUVN
Og0KPiAgICAgICAgIHBnX293bmVyID0gZG9tX3NoYXJlZCA/IHJjdV9sb2NrX2RvbWFpbihkb21f
c2hhcmVkKSA6IE5VTEw7DQo+ICAgICAgICAgYnJlYWs7DQo+IA0KPiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gPiBA
QCAtNjE4LDYgKzYxOCw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19zeXN0ZW1fZG9tYWluKGNv
bnN0IHN0cnVjdA0KPiBkb21haW4gKmQpDQo+ID4gICAgICByZXR1cm4gZC0+ZG9tYWluX2lkID49
IERPTUlEX0ZJUlNUX1JFU0VSVkVEOyAgfQ0KPiA+DQo+ID4gKyNkZWZpbmUgaXNfc2hhcmVkX2Rv
bWFpbihkKSAoKGQpLT5kb21haW5faWQgPT0gRE9NSURfU0hBUkVEKQ0KPiANCj4gV291bGQgdGhp
cyBiZXR0ZXIgZXZhbHVhdGUgdG8gImZhbHNlIiB3aGVuICFTVEFUSUNfU0hNLCBzdWNoIHRoYXQg
dGhlDQo+IGNvbXBpbGVyIGNhbiBlbGltaW5hdGUgcmVzcGVjdGl2ZSBjb25kaXRpb25hbHMgYW5k
L29yIGNvZGU/DQo+IA0KPiBKYW4NCg0K

