Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052D4ED3CB
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 08:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296653.505018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZo4W-0007lL-5y; Thu, 31 Mar 2022 06:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296653.505018; Thu, 31 Mar 2022 06:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZo4W-0007iR-2L; Thu, 31 Mar 2022 06:14:16 +0000
Received: by outflank-mailman (input) for mailman id 296653;
 Thu, 31 Mar 2022 06:14:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yrn=UK=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZo4T-0007iL-L5
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 06:14:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c75a1a69-b0b9-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 08:14:11 +0200 (CEST)
Received: from AS9PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:20b:48b::6)
 by AM0PR08MB5364.eurprd08.prod.outlook.com (2603:10a6:208:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 06:14:08 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::c6) by AS9PR04CA0082.outlook.office365.com
 (2603:10a6:20b:48b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.22 via Frontend
 Transport; Thu, 31 Mar 2022 06:14:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 06:14:08 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 31 Mar 2022 06:14:07 +0000
Received: from f877e869a4ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C63A24B4-FB6D-47D7-922F-21C162B7213D.1; 
 Thu, 31 Mar 2022 06:14:00 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f877e869a4ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 31 Mar 2022 06:14:00 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB6PR08MB2920.eurprd08.prod.outlook.com (2603:10a6:6:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Thu, 31 Mar
 2022 06:13:55 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%8]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 06:13:55 +0000
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
X-Inumbo-ID: c75a1a69-b0b9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOsyVRQIdqPfwogpo/fF7R9xsusCta5i/9GJyxzkdzc=;
 b=NEc8pxTzl71OU/tviRqQhYq7LN1jH6rlTTaXPIYQ1SJPH70gmL4iUSxDQvGdX28LTFNUFJhB9KQiHQ+uX7rAqh0J54udzFRvDGP+56LANcTNs3wMHI1mXA/gDYPYPafqG2fXEJq2SXtS1k8XWFkPM1DraJuQZ4543qL/aTXZygg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0uAsUiNJeKtzMOAPH/SI+3uGuBka2MQPR7Cn7kFewvCld8HtH9RjiQ+jzC1ZVP0cTg1B9XgFAqdDo21c46yyzwxJXQDXJYOi9ifa9whqV3YVCy7RRHs6wdhP+XLIyHH+Ey19AX1hkScqiEvjRofs1+xmEX2e1mMbDT4kW5H8sjNUrccmLlqS5OslOx3jQ85XuZl3+uPGsYvr3eblYN8JRo2xOXWheA0PaxwFk2HgFMZReerPfbkHhMOKaqojnjr2Lst0MWWmDRAkGkobn7vg9rqvIWCxyGrRAamZa2wflnijlBxmIbjn0WMQse6MLYq/55m7zwKnE1/MWBmidoktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOsyVRQIdqPfwogpo/fF7R9xsusCta5i/9GJyxzkdzc=;
 b=a8bEJGOxVcxCePHYJ7qX3QLAxgUXuYwzU54tcFz0sCsNd074CXprH1VbzCmFsJKb10n6TTXUDpp5YCOR6Pm1WY9rLTBugSZERQ34nk8Rlf6CV+sBWw+46D6589dOL3e3ublet6qH4GRArjSbDKIl0TUcJrF0J5Vtr2SovZkhRdp45RdP54GFo7KQtVbgR66B9d5+YHFUywwdU8HPkmJjjXW2xA8NvzOxSFEjtkZLPsqBoJ93nnP8QJzaMo+LxsToz+hnZT1CjNCMFHc8ar4rBQJso34WtjVTv2r8o+dPaB+7dncdfA1roTBnR5vm10sF/viEyzmqZ4yY4AmAcoXlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOsyVRQIdqPfwogpo/fF7R9xsusCta5i/9GJyxzkdzc=;
 b=NEc8pxTzl71OU/tviRqQhYq7LN1jH6rlTTaXPIYQ1SJPH70gmL4iUSxDQvGdX28LTFNUFJhB9KQiHQ+uX7rAqh0J54udzFRvDGP+56LANcTNs3wMHI1mXA/gDYPYPafqG2fXEJq2SXtS1k8XWFkPM1DraJuQZ4543qL/aTXZygg=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Thread-Topic: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Thread-Index: AQHYRBnkeXnYvoANH0WdfY8GUNrlN6zXr5KAgAEgZ0A=
Date: Thu, 31 Mar 2022 06:13:54 +0000
Message-ID:
 <DU2PR08MB73251B78F8EB19E334A70876F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
 <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
In-Reply-To: <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5171FFAE1870274B9DD2C89C2D7D2D48.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cc4a3950-2428-438a-b734-08da12ddaa65
x-ms-traffictypediagnostic:
	DB6PR08MB2920:EE_|AM5EUR03FT054:EE_|AM0PR08MB5364:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5364A9686C3F31BF34E28442F7E19@AM0PR08MB5364.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kdCNNKzIQhAJxTuyC0/c13PAZfg8VrRkYSBKf7Rbtp0vGXa7PIsHsrh8jVqwPi8YbhBJU6CENFWiYpOladJiwRziyiGQBo/tIpZmANf+dnbn3jteGaMUkhhm+c+Gw05wpa2BDiD/Y9ACMyg80snYFcd1zdiIeQh9GLpP9noD1U8Eu+D2KNUx2u9Ziyq0RGL6YdBqkWD9CN8UoIu0DccZ3oAtgE2Fz1Sidg9SW/2F+HSaRZuxMM11UXMMAVVKLzYKMw/WfxNsULNXVAEUc480AvptdT8zDoMCtIo6Jism7sxT2SNg5nboDsnmzYv2mrCMnF/w5jv1b9lIQMx7S3MZmCtC9JyqNe6ZLGOFqPKGJmzNF2M6JbGieyDLg66Yvb5zC2MP6qMcweinbcE/nsgkNlCuotR58gzdWnLKWQCLbUW17IB5w9It5c5omYvObbBJ3KhYS9sydWeMJv3XLC6gJwEpd3aseC2OdZ2uHZWHFJCv53zD84YacqDHpKx1RtRVFHa8gj3ll0iaE/ITACHYos1xFa7imvgp/s2FmjQdOJHZFap9mIJSCSG8YO8JdZw9geQtV4hHDSU8q0/tECyPMdnMOoeYahWj4LqwlZ324eGB/cFupihlQpALTq3vbT6G4ZZB9T02vqWspRdVKtkLO94A0TixE3898cL9fP/PEy7Cn+rTdPWxg0FP2nJAzbLZrJB1mCl9OEpXtFmnOiOlbQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(53546011)(6916009)(76116006)(4326008)(64756008)(66946007)(55016003)(45080400002)(66446008)(33656002)(66476007)(2906002)(86362001)(54906003)(7696005)(38070700005)(6506007)(8676002)(186003)(66556008)(122000001)(5660300002)(83380400001)(71200400001)(8936002)(26005)(9686003)(38100700002)(52536014)(508600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2920
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b427c0a-a2be-47c7-c77b-08da12dda297
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P1SFg16HpuNKtngrApdnJoqUePj11OXfvlPQxtgjIIgr9zMxXrE6uLklCBXDK3J+QOlNIRwBXb/byfjgXPkUJ/MFVtuZpIFAkF6IB678w8mRwlvTh5AR2hryzHbJoBQhtRcjz0/Rp6aj/QUYwwm0UrU9B2K0Pmks9iPOB7fpBA32SEuHJOcGdGaSUb78B8wUGAcq1f2hBs0SeN+G23YbRrvuQY1gzu/EYk0ZAYeb1hM15hasmO7FpPoXNv4QSq1eS0QMeakk6nmeGDFmqqShUlZ9hcFpok+jr/OX710DonaH1E1tCgY11MLjlbFn2vOmCu3BPXHCRhgr4F8LfNZBBRAN2Kgfs85ZPm1RVEhznl0Dglg07NSRRWT/kBBvZjrcce0ndhDIjzyiJtbLq8x8HbIVNZsMwlp0O0RJn24lpz5hvZWorgrIMMx2Bn0dN5sPi52fEBb1L5YctaEZROd3w1sPOJIp0Y50GNzyPgI3zjvaP5ZhzQkMRtp8o4CaYQNXeXHy2Lk2rQg1FzzqsSPqbnVKTLDj7j6H0Yc/9ZOTckuvX3sx3DJNwvdH8CF5YjkFUXgPvG8jeMpFDbQYUK2PzA4rAW35HjTb7/W+WyzSV29AvFURSG4DsaklNUZ3fuFYi0XM7yu1RP16DtvFB2j6gsSjqk/Juswzr01YI64ApztykIAnrJmtQ3SmRaZhfESK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(356005)(5660300002)(81166007)(8936002)(82310400004)(54906003)(52536014)(9686003)(316002)(186003)(40460700003)(26005)(336012)(508600001)(45080400002)(7696005)(47076005)(4326008)(6862004)(53546011)(36860700001)(55016003)(33656002)(8676002)(83380400001)(70206006)(70586007)(2906002)(86362001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 06:14:08.1586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4a3950-2428-438a-b734-08da12ddaa65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5364

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDMwLCAyMDIy
IDU6NTMgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5j
b20+Ow0KPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vvcmdl
IER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMy81XSB4ZW4vYXJtOiB1bnBvcHVsYXRlIG1l
bW9yeSB3aGVuIGRvbWFpbiBvbg0KPiBzdGF0aWMgYWxsb2NhdGlvbg0KPiANCj4gT24gMzAuMDMu
MjAyMiAxMTozNiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9tZW1v
cnkuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gPiBAQCAtMzUsNiArMzUsMTAg
QEANCj4gPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC5oPg0KPiA+ICAjZW5kaWYNCj4gPg0KPiA+ICsj
aWZuZGVmIGlzX2RvbWFpbl9vbl9zdGF0aWNfYWxsb2NhdGlvbiAjZGVmaW5lDQo+ID4gK2lzX2Rv
bWFpbl9vbl9zdGF0aWNfYWxsb2NhdGlvbihkKSAwDQo+IA0KPiBOaXQ6ICJmYWxzZSIsIG5vdCAi
MCIuDQo+IA0KPiA+IEBAIC00MDUsMTMgKzQwOSwyOSBAQCBpbnQgZ3Vlc3RfcmVtb3ZlX3BhZ2Uo
c3RydWN0IGRvbWFpbiAqZCwNCj4gdW5zaWduZWQgbG9uZyBnbWZuKQ0KPiA+ICAgICAgICogZGV2
aWNlIG11c3QgcmV0cmlldmUgdGhlIHNhbWUgcGZuIHdoZW4gdGhlIGh5cGVyY2FsbA0KPiBwb3B1
bGF0ZV9waHlzbWFwDQo+ID4gICAgICAgKiBpcyBjYWxsZWQuDQo+ID4gICAgICAgKg0KPiA+ICsg
ICAgICogV2hlbiBkb21haW4gb24gc3RhdGljIGFsbG9jYXRpb24sIHRoZXkgc2hvdWxkIGFsd2F5
cyBnZXQgcGFnZXMgZnJvbQ0KPiB0aGUNCj4gPiArICAgICAqIHJlc2VydmVkIHN0YXRpYyByZWdp
b24gd2hlbiB0aGUgaHlwZXJjYWxsIHBvcHVsYXRlX3BoeXNtYXAgaXMgY2FsbGVkLg0KPiA+ICsg
ICAgICoNCj4gPiAgICAgICAqIEZvciB0aGlzIHB1cnBvc2UgKGFuZCB0byBtYXRjaCBwb3B1bGF0
ZV9waHlzbWFwKCkgYmVoYXZpb3IpLCB0aGUgcGFnZQ0KPiA+ICAgICAgICogaXMga2VwdCBhbGxv
Y2F0ZWQuDQo+ID4gICAgICAgKi8NCj4gPiAtICAgIGlmICggIXJjICYmICFpc19kb21haW5fZGly
ZWN0X21hcHBlZChkKSApDQo+ID4gKyAgICBpZiAoICFyYyAmJiAhKGlzX2RvbWFpbl9kaXJlY3Rf
bWFwcGVkKGQpIHx8DQo+ID4gKyAgICAgICAgICAgICAgICAgIGlzX2RvbWFpbl9vbl9zdGF0aWNf
YWxsb2NhdGlvbihkKSkgKQ0KPiA+ICAgICAgICAgIHB1dF9wYWdlX2FsbG9jX3JlZihwYWdlKTsN
Cj4gPg0KPiA+ICAgICAgcHV0X3BhZ2UocGFnZSk7DQo+ID4gKyNpZmRlZiBDT05GSUdfU1RBVElD
X01FTU9SWQ0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIFdoZW4gZG9tYWluIG9uIHN0YXRpYyBh
bGxvY2F0aW9uLCB3ZSBzaGFsbCBzdG9yZSBwYWdlcyB0bw0KPiByZXN2X3BhZ2VfbGlzdCwNCj4g
PiArICAgICAqIHNvIHRoZSBoeXBlcmNhbGwgcG9wdWxhdGVfcGh5c21hcCBjb3VsZCByZXRyaWV2
ZSBwYWdlcyBmcm9tIGl0LA0KPiA+ICsgICAgICogcmF0aGVyIHRoYW4gYWxsb2NhdGluZyBmcm9t
IGhlYXAuDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGlmICggaXNfZG9tYWluX29uX3N0YXRpY19h
bGxvY2F0aW9uKGQpICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwYWdlX2xpc3RfYWRkX3Rh
aWwocGFnZSwgJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gPiArICAgICAgICBkLT5yZXN2X3BhZ2Vz
Kys7DQo+ID4gKyAgICB9DQo+ID4gKyNlbmRpZg0KPiANCj4gSSB0aGluayB0aGlzIGlzIHdyb25n
LCBhcyBhIHJlc3VsdCBvZiBub3QgaW50ZWdyYXRpbmcgd2l0aCBwdXRfcGFnZSgpLg0KPiBUaGUg
cGFnZSBzaG91bGQgb25seSBnbyBvbiB0aGF0IGxpc3Qgb25jZSBpdHMgbGFzdCByZWYgd2FzIGRy
b3BwZWQuIEkgZG9uJ3QgcmVjYWxsDQo+IGZvciBzdXJlLCBidXQgaWlyYyBzdGF0aWNtZW0gcGFn
ZXMgYXJlIHB1dCBvbiB0aGUgZG9tYWluJ3MgcGFnZSBsaXN0IGp1c3QgbGlrZQ0KPiBvdGhlciBw
YWdlcyB3b3VsZCBiZS4gQnV0IHRoZW4geW91IGFsc28gY29ycnVwdCB0aGUgbGlzdCB3aGVuIHRo
aXMgaXNuJ3QgdGhlIGxhc3QNCj4gcmVmIHdoaWNoIGlzIHB1dC4NCg0KWWVzLCBzdGF0aWNtZW0g
cGFnZXMgYXJlIHB1dCBvbiB0aGUgZG9tYWluJ3MgcGFnZSBsaXN0Lg0KSGVyZSwgSSB0cmllZCB0
byBvbmx5IGRlc3Ryb3kgdGhlIFAyTSBtYXBwaW5nLCBhbmQga2VlcCB0aGUgcGFnZSBzdGlsbCBh
bGxvY2F0ZWQNCnRvIHRoaXMgZG9tYWluLg0KcmVzdl9wYWdlX2xpc3QgaXMganVzdCBwcm92aWRp
bmcgYW4gZWFzeSB3YXkgdG8gdHJhY2sgZG93biB0aGUgdW5wb3B1bGF0ZWQgbWVtb3J5LiANCicn
Jw0KQnV0IHRoZW4geW91IGFsc28gY29ycnVwdCB0aGUgbGlzdCB3aGVuIHRoaXMgaXNuJ3QgdGhl
IGxhc3QNCnJlZiB3aGljaCBpcyBwdXQuDQonJycNCkknbSBzb3JyeSwgd291bGQgeW91IGxpa2Ug
dG8gYmUgbW9yZSBzcGVjaWZpYyBvbiB0aGlzIGNvbW1lbnQ/DQpJIHdhbnQgdGhlc2UgcGFnZXMg
dG8gbGlua2VkIGluIHRoZSBkb21haW4ncyBwYWdlIGxpc3QsIHRoZW4gaXQgY291bGQgYmUNCmZy
ZWVkIHByb3Blcmx5IHdoZW4gZG9tYWluIGdldCBkZXN0cm95ZWQgdGhyb3VnaCByZWxpbnF1aXNo
X21lbW9yeS4NCg0KPiANCj4gQXMgYSByZXN1bHQgSSBhbHNvIHRoaW5rIHRoYXQgeW91IHNob3Vs
ZG4ndCBuZWVkIHRvIHRvdWNoIHRoZSBlYXJsaWVyIGlmKCkuDQo+IA0KPiBKYW4NCg0K

