Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4985635A7D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 11:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447510.703809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxnHU-00050U-8o; Wed, 23 Nov 2022 10:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447510.703809; Wed, 23 Nov 2022 10:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxnHU-0004y3-5u; Wed, 23 Nov 2022 10:47:04 +0000
Received: by outflank-mailman (input) for mailman id 447510;
 Wed, 23 Nov 2022 10:47:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYU+=3X=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxnHS-0004xx-GA
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 10:47:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27bcea85-6b1c-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 11:46:59 +0100 (CET)
Received: from AM5PR0701CA0060.eurprd07.prod.outlook.com (2603:10a6:203:2::22)
 by AS2PR08MB8748.eurprd08.prod.outlook.com (2603:10a6:20b:544::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 10:46:50 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::55) by AM5PR0701CA0060.outlook.office365.com
 (2603:10a6:203:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 23 Nov 2022 10:46:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17 via Frontend Transport; Wed, 23 Nov 2022 10:46:50 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 23 Nov 2022 10:46:50 +0000
Received: from c253a38cd7f0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C73843E8-59A7-4CED-824C-488B3227743A.1; 
 Wed, 23 Nov 2022 10:46:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c253a38cd7f0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Nov 2022 10:46:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6613.eurprd08.prod.outlook.com (2603:10a6:20b:339::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 10:46:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 10:46:37 +0000
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
X-Inumbo-ID: 27bcea85-6b1c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEqCmYSCnQ1oMkpH2WVLfxgYngOP2DPsuVZsmVS7yIY=;
 b=MT8vQchGT9GkeNg8qR7BdcKkOo/jDPPtpc6/vT/59CDQFnJaGlZ/OELUcBjBkRN9M5V+4LhHpFYuoHxxw/JJVD+KmGffapfrSlnAhNmqMaxFH8MYx5ctF4WjfhKbmCf2UmrqY62IlqPXv7n+JNRVlXhdOsvTn0gouFwc2pURsmc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyN/LO+JYo6cwEn5IdXSpQ6NnpVQs93NLW1xBjcqoA7ne6f2dehXqT3q9eEnUmyIqPikC8yF8yz3X0/9Wvniq2xayzRvBufD7llP0Mp6XkwWocul4KHWWYRzJTkdoB2YN7WzzizjUlFHBhNwJ5LtBzUZNDLScyPXJfDd67j+t0AUb9MXNHmJDiua3o1l4xksv6fO1tVd63Xr0pSdWCDf6QxvhKzxdpH8mQmh1vwY6KPah7C2ge2rUJjb9Cg/JFiQGUwqcdjKNRYo9tn7GQZwPsYPt/7mZ3jm6bpE+Gt8HLu3uOpZvxyROy6kUL4zqeGG2njtbdUJWC8yWshr/fTODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEqCmYSCnQ1oMkpH2WVLfxgYngOP2DPsuVZsmVS7yIY=;
 b=AGNpWGIoOABT1OFdSLsMtxDyobkgMkkpfiuosJRG/5j972GjRd913/wf+wVdXJH7IEol0w5lAv2I5uhVhrMlaigm963EyeWT6OSQJ/rQ9KXY0+EXRZnfX3tbH3iMHPUBr42CKrMAuhQa/tTHhLZcorQiF03RbCFipFQO+z8cLiXHNxHxLc1HAnRczoLa5EkWQQC23ZtoJ40ukk4Vt5WYyg19TRKlFPD9whuAfpDrnMeYyCzG7qtEV1Ye+QFe4SPB4kDZY8K2gRAlY9wMm30CioMJPZonhV0RsxpNc71hjM3yfW4JIe6SW1AgjJgmYjebyFPzci+HUMa/TAH+JpzYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEqCmYSCnQ1oMkpH2WVLfxgYngOP2DPsuVZsmVS7yIY=;
 b=MT8vQchGT9GkeNg8qR7BdcKkOo/jDPPtpc6/vT/59CDQFnJaGlZ/OELUcBjBkRN9M5V+4LhHpFYuoHxxw/JJVD+KmGffapfrSlnAhNmqMaxFH8MYx5ctF4WjfhKbmCf2UmrqY62IlqPXv7n+JNRVlXhdOsvTn0gouFwc2pURsmc=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Community Manager
	<community.manager@xenproject.org>
Subject: RE: [PATCH v4 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Topic: [PATCH v4 1/3] CHANGELOG: Add missing entries for work during
 the 4.17 release
Thread-Index: AQHY/vCVM9giSFNS50+Elg9BVMdHfK5MSsCAgAAIIXA=
Date: Wed, 23 Nov 2022 10:46:37 +0000
Message-ID:
 <AS8PR08MB799108E640EC1BB9373AD557920C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
 <20221123040315.1480112-2-Henry.Wang@arm.com>
 <cf68a696-29bf-aa05-ea8f-5c13ca181286@amd.com>
In-Reply-To: <cf68a696-29bf-aa05-ea8f-5c13ca181286@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 21EF96A1BA72694AAC7E4080E99D1C42.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6613:EE_|AM7EUR03FT036:EE_|AS2PR08MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c35ca6b-a65f-4b7e-754e-08dacd4006d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E+c5j4hJ/K8vm5yoewzr3KrOGDq1n1TR/ljXLxNEgux8hYSHFDQnZGMnuru9kyojO5LFuDJ0y8/o4x6liVEjxT9I3y9OtDIqlrWSPhkzk0ZS3+2s+MlTNN7m5Q8D7jzmcnH4gzwH3tksmiu/0UGKGkjzbfcq1A7OTn8R61+ju3AhEDeZYCusEsT6AgOd1flBvGrVy8b3oxEY+LELvcnThrTJoBThXCv1HQ82AobesDHx4S6xjESbERH9uEIxWccLWPVqYiKAeofKDkWJ5pwFivOqP6jNRaDMNjWv57PJqEPv9fRlU8GZy2qvVeDFsCUgT7GAAB7uln/yLUlDb9pxDAzPDJw7ks11UtFwkMUipUqPBYpOOOXG2cgSXDZT9UnN2a9Vssakp8SHi2UlxG4Id1H7STR3ubcFkJVUh6Q01h7lUT6JCaT46vf/jOWOsNbYJNefr9p2lbFAy83IBURU3vd8rN8XqgAr7HShM+MhJaAm2ltWaGq61VV5PIqTQ2z4fGdE2oeQZ+BnmXRZxa3rXYFj6NHvCHYPnzTzcIiOxgsyMQ5s70fQmpl5JNQhOyC9YORHK/knCI/oHfoZVm8YEM9zJmXvh2pS8TqrdzCgbQS46oB7X7MUudX/AmZDcK1vkdDicnEWoScI2gf5qJTT+j1oEcNwFHqcaoqyXwolquGPLlksoiK5roHfCBc1wscwWq6v6ksmgAEmggBtb4OE2meHL+V1+ra6sA0xN/cnugz8uSNbjd7EwdTafsY0qRFfh6Eqm8sv2LOuaGaXRnA89SVCYf4ep5bO/v5N8YglCSU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(2906002)(33656002)(4744005)(55016003)(76116006)(66946007)(41300700001)(86362001)(66556008)(38070700005)(52536014)(66446008)(122000001)(110136005)(7696005)(83380400001)(54906003)(38100700002)(4326008)(6506007)(8936002)(8676002)(64756008)(9686003)(5660300002)(66476007)(186003)(26005)(71200400001)(316002)(478600001)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6613
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b7a78e2-86e4-4130-2059-08dacd3fff59
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2xPTZFrEOOVzgmJvNmfyQ0zTRBDj9P6rPNHvFgg3js8aBqLjr5cAcy08VF9Y63p6avc8bwmjYvNuT8cs13YRZb4KTZkP32NcpPRqzKk/dsFUkIMBiccizhGQxSv/ifJITR0U6bDe65itV+rLj8c8Gk6QO/RHYEHV4iBy7ehdyv6+BfZTzMsYpzfsWDnu5Hr4fFgv2Y0vHO/343DWxrkNm6MPPzBaN40T+z4CKobbp1s0c3q75R1CSbVDBvZ2Q8m9qwkiPn31WlhIRv0bcsJm+MfTppxWyvBNaks6ilemswCqFZFHGr/vgcGPE5vMcveLaOtU9cV/mXGw4aJMWCkZwAwrwIqLh1U7aUqBZvwQIX3NYieLLcIzFDxvPHKR0bjRQlbRP9qxWLcDxGkZuctuuy1crWxbaSq7XWioueQVJt0BewHiVPjJaWGd0LvwgN7QVO8bR3cGt5ZLgUMwgJhRJs1d58N0reYtOYwa6Ur3tbAtGwVkgxnh3uuzlEFitmMmoIICN4/sIS0jGldeUhIana+V3Fb3fXrdRLfX7rbGxEEBHkHrPBpjBzICO2mxybnXyQUtmLZl4APyeTg50iqmkEVR1Gw/5vBgG+QajadwO7UjiBO7KRXybqoYhjCZDJXUpY+StLioWnqNPnKf62yy4AT2zcQZ6YNAS6UDgQGLlSv7VysJs2FgPxz20ZALAGH/wUoB9dCeYe/2pWHfMULGP5/oWD1UAMVg2CrAjx0ZSjiLrrjqEcwm+sIQi5fjI7eo0pKKKjOIxuthYe6D/2T47JO00D46W26zlRU3IM7IlaM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(2906002)(81166007)(55016003)(356005)(82740400003)(40480700001)(36860700001)(33656002)(9686003)(7696005)(82310400005)(478600001)(8936002)(83380400001)(41300700001)(6506007)(40460700003)(5660300002)(52536014)(4744005)(86362001)(186003)(26005)(336012)(47076005)(8676002)(110136005)(54906003)(316002)(4326008)(70586007)(70206006)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 10:46:50.2262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c35ca6b-a65f-4b7e-754e-08dacd4006d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8748

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjQgMS8zXSBDSEFOR0VMT0c6IEFkZCBtaXNzaW5nIGVudHJpZXMgZm9yIHdvcmsg
ZHVyaW5nDQo+IHRoZSA0LjE3IHJlbGVhc2UNCj4gSGkgSGVucnksDQo+IExvb2tpbmcgYXQgdGhl
ICJBZGRlZCIgc2VjdGlvbiBmb3IgdGhlIHByZXZpb3VzIHJlbGVhc2VzLCB3ZSBzZWVtIHRvDQo+
IG1lbnRpb24gdGhlIGNoYW5nZXMgdG8gQ0kgKGF1dG9tYXRpb24vKSBhcyB3ZWxsLg0KPiBCZWNh
dXNlIHRoZXJlIHdlcmUgcXVpdGUgYSBmZXcgY2hhbmdlcyBkb25lIGluIHRoaXMgcmVsZWFzZSwg
YWRkaW5nIGF0IGxlYXN0DQo+IHRoZSBmb2xsb3dpbmcsIGNhbiBiZSBiZW5lZmljaWFsIChzb21l
dGhpbmcgdG8gY29uc2lkZXIpOg0KPiAtIGdpdGxhYi1jaSBhdXRvbWF0aW9uOiBGaXhlcyBhbmQg
aW1wcm92ZW1lbnRzIHRvZ2V0aGVyIHdpdGggbmV3IHRlc3RzDQoNCkkgb25seSBzYXcgQ0kgZW50
cmllcyBpbiA0LjE1IHJlbGVhc2UsIGJ1dCBpZiB5b3Ugd2FudCB0byBhZGQgdGhpcyBJIGFtIG9r
IHdpdGggdGhhdC4NClNvIEkgd2lsbCB3YWl0IGZvciBhIGRheSB0byBzZWUgaWYgcGVvcGxlIG9w
cG9zZSB0aGlzLCBpZiBub3QgSSB3aWxsIGFkZCB5b3VyIHN1Z2dlc3RlZA0Kc2VudGVuY2UgaW4g
djUuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

