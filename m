Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52970DBDB
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 13:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538451.838398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QeD-0002cI-TX; Tue, 23 May 2023 11:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538451.838398; Tue, 23 May 2023 11:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1QeD-0002ZE-Q7; Tue, 23 May 2023 11:57:49 +0000
Received: by outflank-mailman (input) for mailman id 538451;
 Tue, 23 May 2023 11:57:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqVG=BM=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1QeB-0002Z8-F7
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 11:57:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe13::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07774ad1-f961-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 13:57:45 +0200 (CEST)
Received: from AS8PR04CA0186.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::11)
 by AS8PR08MB6104.eurprd08.prod.outlook.com (2603:10a6:20b:299::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 11:57:41 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::da) by AS8PR04CA0186.outlook.office365.com
 (2603:10a6:20b:2f3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 11:57:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 11:57:40 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Tue, 23 May 2023 11:57:40 +0000
Received: from 5c02d8c4d31e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DB02D10-2A82-4057-9DF7-22250801DEC5.1; 
 Tue, 23 May 2023 11:57:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c02d8c4d31e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 May 2023 11:57:28 +0000
Received: from VI1PR08MB3760.eurprd08.prod.outlook.com (2603:10a6:803:c1::27)
 by PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 11:57:24 +0000
Received: from VI1PR08MB3760.eurprd08.prod.outlook.com
 ([fe80::2fda:206f:dfef:271a]) by VI1PR08MB3760.eurprd08.prod.outlook.com
 ([fe80::2fda:206f:dfef:271a%5]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 11:57:24 +0000
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
X-Inumbo-ID: 07774ad1-f961-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjbiPSHywVpHCq3pYp8eUa3OS8jM44qqSBY533cIvOk=;
 b=IvuS68WkmOejLWi6Qh/5rEmDIBVLcDz3jNtcSuNcZ4mv4RYVO5UFDgd2uxiVO4oGhQfylf98TyBClXcjK8kbCgcWGf7nO9WtzruQDSnoID89JyiS7Yhx8qz62w16pMc0bCh0Cu1Kl7VIMsy8XMWfTDuDQBDsJ5XH4fHptsBfs8U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3a0d9607804f212
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clFRI/gFCed1YsmF9pW2WWdcyBxENhIUsiA69vLAA/und4NSW48zsuyOA6iu2QZTIsvgaE2c2WuWN/aoInJc1xnWUTIJTfErEaiJcItshHjegbzWbarY7FJWR58uaHTbNMqB4zdnoTc6UDesiM4BH8B1fHyHHa7mYaUuUv6Aa71woW9vZ6F77Iq9hFqn1Vh2XvHuo4qJ5mdI1UhimGVXv2+Oo5lBPDabgQFqBx4I0cleQL/Py0RGEqwNtwRtKc7K2Bt0gR+FhDLMTuuHpQ9KTSceBFqHet5tTNkTxzWQUzoG/WCb6HjVQnkfk2pSzmvwWsiH0cX0M7MklzNUKPzdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjbiPSHywVpHCq3pYp8eUa3OS8jM44qqSBY533cIvOk=;
 b=dm9w0dAk1VLocZ4KD7AMzuXeHHNusliE9RBz0gXA6V14RNKOQlPChGlqX3EsLZ9t4VUOhtNPgxBnTywMeWDPkSrlDk3TuPkIel3wEnSdvcL2ET+5nO3bL5ocLt3KiYRs8EQ4aBslJL+5kQ8e25YmH1ggmUXQXnCNO9FZ7UnFXx+TeWGHZuQEYhIHeYjR6jAwVhZ8xUcSG+nyAcDKYxCSKDWQ65cyas81HyUHKCuUJzHle+V0MrYxFc7kmgzvRywOUFsi2qUkMCEcJhzkeMb/fzKzZHR2dHwFBj8kpQhKLqD+UgPks3L+EE6MpawT1elTLYDWL9STDD9tOzNctvQK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjbiPSHywVpHCq3pYp8eUa3OS8jM44qqSBY533cIvOk=;
 b=IvuS68WkmOejLWi6Qh/5rEmDIBVLcDz3jNtcSuNcZ4mv4RYVO5UFDgd2uxiVO4oGhQfylf98TyBClXcjK8kbCgcWGf7nO9WtzruQDSnoID89JyiS7Yhx8qz62w16pMc0bCh0Cu1Kl7VIMsy8XMWfTDuDQBDsJ5XH4fHptsBfs8U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZjUpfkyJmVIVJBUW8KdO0aW075a9noLWAgAAFYICAAALiAIAAFdcAgAABCwCAAAD+gA==
Date: Tue, 23 May 2023 11:57:23 +0000
Message-ID: <E8FD576D-917C-486B-B537-2455C9686A2E@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
 <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
 <6DEA0CC3-C3EF-4509-A869-807CE4B21401@arm.com>
 <767b11a1-4d43-9057-1fcc-6516fea64fb3@suse.com>
 <45285215-4528-435A-B203-B770D60FABAA@arm.com>
 <4d86d3b6-3ce5-8d25-abb9-4c27b592647f@suse.com>
In-Reply-To: <4d86d3b6-3ce5-8d25-abb9-4c27b592647f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VI1PR08MB3760:EE_|PR3PR08MB5689:EE_|AM7EUR03FT004:EE_|AS8PR08MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 5632290a-ea64-41cf-b1b2-08db5b84e8fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bF3ywAVUU32/4AKN6WmBvgGmIHHt3drqZFhgdd12Ui5FgyEAL18j5OcGj3L70Bf1lsA1952zJFbmkVvXeCs3U1CWH9ycIqBB4h6LJ9kXFH24SNeXquQ9fIRXAUORASyuU6obISBg6/dfIRmATEj86caItUoHmKERsRJBBW5/1PeHlN/VmYLwBNJ/LcfQdMpsL5CQWBrw7sBvD3gawUn3J1alYcAQXWXGDxbZWu05KEiB+OsPEkphZ/cKN4u8J/GEDEwtPRsthkOPDnWkWWS7ijQIASzeMbtA9fMT4H9v0Jj7S19zP1ahm9SRZyn7MtgSUwkF8Gf/rHnBql6NowqNfFRtuBRbKJpg5aN3pC7uaEyDjCaWSysXQrJ7onTHJl6pu9OZOHSLE64bbhqR7sMcTVd9IH30e/ky5OlkqUo/be6qER5JGqRaNPlkVFT7P5zxbRf7teWLa6lxhnZfEkwt7Lk7shE/PfeTXdFlLP2lXRPTlRwM/YeWHu5gs14A7QH/mT3/m/bTEidi0J1/CNp7Ezwi1mZmqtFjg4M3WCaPqFzsSUE8uxsSsncFm0+GsF+9ZVwk+ZNYAGNSEu3qPUdLl58WmZBd6YMvVUUPbr4kxdqNBzs/W/m+FDQ1IDQ1msJHUuEM7aOagiUMc8oq88EwnQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3760.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(26005)(122000001)(186003)(53546011)(33656002)(6512007)(6506007)(38100700002)(2616005)(36756003)(83380400001)(2906002)(41300700001)(6486002)(71200400001)(316002)(54906003)(478600001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(6916009)(4326008)(38070700005)(86362001)(8936002)(8676002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A083519363D7444AF8AC658CF9D252A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5689
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ef3475d-2bb8-4546-c05e-08db5b84df13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gpnyfas9lPUbxyPnPXHqYO/1XEf5muAxel3m0h2GzjZoqA0Tb81eBFio8I3GNBsyjSAI1CMroB1MS1UqhXXLtZXGNp8h8UGhbpVLAviHZnykwGWQX6Ue7luN1gebhEaz11IWiSh8Q2rwFXKvgxSDTIxfbIw5rr0owTbBJy5gEhgUpnk4wsb12dG5G4huZwT9CxBZRec3wYcbn9elfoCCPFVlGpShSGtTzpd+iWagyD0BezEyZ/U9ux4Sf/Yyv04MKI9DC2HeqTugll+hy6NOx/aexOeOBpw7qKhpi68MgH3UWf0E5qbJzizWsPV32wMf6b2i3dm76v0m2Ac6nFNw0blpbfalkeEb89Sbox5F0kE9aPH4QoECSl6a06vrSNkvH1oNBjjvxwl5ZATCbK/nZ8iFXk+1hOZtj8CysKxXYLRwqmEl7xR+QPdCddPxExi616hTmCmenWBQu0Qib05lqp1iOOsYDOo/UwdWe3CuF5aDyShV0ahleAPb5dita9q3g3OQ5vkEzD8o6CvXBxvfoAGELMBs2mgS5IWaf4FvMxt7riow+tqmgySJUS4/lgnenZOWxfpt5DBT4oqVie0skwWK+4QQSmCv7GWJouLtObKbcOqcd2VeQN73zQdNpyzKmU8nOTCnlqaSZ/b8C9iarvaAoptTAPYv6R1Jbqrk3Ys4YBSmM5fxpGpxeQCYNnCoysLxI0Hj3+KEyXukwWAEIaAIDIB4FhqOO7JEi70QsX/dWrgpHk7MA+cMde7VwMiI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(41300700001)(70586007)(70206006)(2906002)(40480700001)(186003)(478600001)(26005)(6486002)(316002)(4326008)(5660300002)(54906003)(6512007)(6862004)(8936002)(8676002)(40460700003)(36860700001)(53546011)(81166007)(356005)(36756003)(47076005)(2616005)(336012)(6506007)(83380400001)(33656002)(82310400005)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 11:57:40.4895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5632290a-ea64-41cf-b1b2-08db5b84e8fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6104

DQoNCj4gT24gMjMgTWF5IDIwMjMsIGF0IDEyOjUzLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjMuMDUuMjAyMyAxMzo1MCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyMyBNYXkgMjAyMywgYXQgMTE6MzEsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjMuMDUuMjAyMyAxMjoyMSwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IE9uIDIzIE1heSAyMDIzLCBhdCAxMTowMiwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDIzLjA1LjIwMjMgMDk6NDMsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4gQEAgLTgzOCw2ICs4MzgsMjIgQEAgQ29udHJvbHMgZm9y
IGhvdyBkb20wIGlzIGNvbnN0cnVjdGVkIG9uIHg4NiBzeXN0ZW1zLg0KPj4+Pj4+IA0KPj4+Pj4+
ICAgSWYgdXNpbmcgdGhpcyBvcHRpb24gaXMgbmVjZXNzYXJ5IHRvIGZpeCBhbiBpc3N1ZSwgcGxl
YXNlIHJlcG9ydCBhIGJ1Zy4NCj4+Pj4+PiANCj4+Pj4+PiArRW5hYmxlcyBmZWF0dXJlcyBvbiBk
b20wIG9uIEFybSBzeXN0ZW1zLg0KPj4+Pj4+ICsNCj4+Pj4+PiArKiAgIFRoZSBgc3ZlYCBpbnRl
Z2VyIHBhcmFtZXRlciBlbmFibGVzIEFybSBTVkUgdXNhZ2UgZm9yIERvbTAgZG9tYWluIGFuZCBz
ZXRzDQo+Pj4+Pj4gKyAgICB0aGUgbWF4aW11bSBTVkUgdmVjdG9yIGxlbmd0aCwgdGhlIG9wdGlv
biBpcyBhcHBsaWNhYmxlIG9ubHkgdG8gQUFyY2g2NA0KPj4+Pj4+ICsgICAgZ3Vlc3RzLg0KPj4+
Pj4gDQo+Pj4+PiBXaHkgImd1ZXN0cyI/IERvZXMgdGhlIG9wdGlvbiBhZmZlY3QgbW9yZSB0aGFu
IERvbTA/DQo+Pj4+IA0KPj4+PiBJIHVzZWQg4oCcZ3Vlc3Rz4oCdIGJlY2F1c2UgaW4gbXkgbWlu
ZCBJIHdhcyByZWZlcnJpbmcgdG8gYWxsIHRoZSBhYXJjaDY0IE9TIHRoYXQgY2FuIGJlIHVzZWQN
Cj4+Pj4gYXMgY29udHJvbCBkb21haW4sIEkgY2FuIGNoYW5nZSBpdCBpZiBpdCBzb3VuZHMgYmFk
Lg0KPj4+IA0KPj4+IElmIHlvdSBtZWFucyBPU2VzIHRoZW4gYmV0dGVyIGFsc28gc2F5IE9TZXMu
IEJ1dCBtYXliZSB0aGlzIGRvZXNuJ3QgbmVlZA0KPj4+IHNwZWNpZmljYWxseSBleHByZXNzaW5n
LCBieSBzYXlpbmcgZS5nLiAiLi4uLCB0aGUgb3B0aW9uIGlzIGFwcGxpY2FibGUNCj4+PiBvbmx5
IG9uIEFBcmNoNjQiPyBPciBjYW4gYSBEb20wIGJlIDMyLWJpdCBvbiBBcm02NCBYZW4/DQo+PiAN
Cj4+IEkgdGhpbmsgdGhlcmUgaXMgbm8gbGltaXRhdGlvbiBzbyBEb20wIGNhbiBiZSAzMiBiaXQg
b3IgNjQuIE1heWJlIEkgY2FuIHNheQ0KPj4g4oCcLi4uIEFBcmNoNjQga2VybmVsIGd1ZXN0cy7i
gJ0/DQo+IA0KPiBJJ2QgcmVjb21tZW5kIHRvIGF2b2lkIHRoZSB0ZXJtICJndWVzdCIgd2hlbiB5
b3UgdGFsayBhYm91dCBEb20wIGFsb25lLg0KPiBDb21tb25seSAiZ3Vlc3QiIG1lYW5zIG9yZGlu
YXJ5IGRvbWFpbnMgb25seSwgaS5lLiBpbiBwYXJ0aWN1bGFyIGV4Y2x1ZGluZw0KPiBEb20wLiBX
aGF0J3Mgd3Jvbmcgd2l0aCAiQUFyY2g2NCBEb20wIGtlcm5lbHMiPw0KDQpPayB3b3JrcyBmb3Ig
bWUsIEkgd2lsbCB1c2Ug4oCcQUFyY2g2NCBEb20wIGtlcm5lbHMiLCBJIHRob3VnaHQg4oCcZ3Vl
c3Rz4oCdIHdlcmUgYSBnZW5lcmljIGNhdGVnb3J5DQphbmQgdGhlbiB3ZSBoYXZlIOKAnHByaXZp
bGVnZWQJZ3Vlc3Rz4oCdLCBmb3IgZXhhbXBsZSBEb20wIG9yIGRyaXZlciBkb21haW4sIGFuZCDi
gJx1bnByaXZpbGVnZWQgZ3Vlc3Rz4oCdDQpsaWtlIERvbVVzLg0KDQo+IA0KPj4+Pj4+ICsgICAg
QSB2YWx1ZSBlcXVhbCB0byAwIGRpc2FibGVzIHRoZSBmZWF0dXJlLCB0aGlzIGlzIHRoZSBkZWZh
dWx0IHZhbHVlLg0KPj4+Pj4+ICsgICAgVmFsdWVzIGJlbG93IDAgbWVhbnMgdGhlIGZlYXR1cmUg
dXNlcyB0aGUgbWF4aW11bSBTVkUgdmVjdG9yIGxlbmd0aA0KPj4+Pj4+ICsgICAgc3VwcG9ydGVk
IGJ5IGhhcmR3YXJlLCBpZiBTVkUgaXMgc3VwcG9ydGVkLg0KPj4+Pj4+ICsgICAgVmFsdWVzIGFi
b3ZlIDAgZXhwbGljaXRseSBzZXQgdGhlIG1heGltdW0gU1ZFIHZlY3RvciBsZW5ndGggZm9yIERv
bTAsDQo+Pj4+Pj4gKyAgICBhbGxvd2VkIHZhbHVlcyBhcmUgZnJvbSAxMjggdG8gbWF4aW11bSAy
MDQ4LCBiZWluZyBtdWx0aXBsZSBvZiAxMjguDQo+Pj4+Pj4gKyAgICBQbGVhc2Ugbm90ZSB0aGF0
IHdoZW4gdGhlIHVzZXIgZXhwbGljaXRseSBzcGVjaWZpZXMgdGhlIHZhbHVlLCBpZiB0aGF0IHZh
bHVlDQo+Pj4+Pj4gKyAgICBpcyBhYm92ZSB0aGUgaGFyZHdhcmUgc3VwcG9ydGVkIG1heGltdW0g
U1ZFIHZlY3RvciBsZW5ndGgsIHRoZSBkb21haW4NCj4+Pj4+PiArICAgIGNyZWF0aW9uIHdpbGwg
ZmFpbCBhbmQgdGhlIHN5c3RlbSB3aWxsIHN0b3AsIHRoZSBzYW1lIHdpbGwgb2NjdXIgaWYgdGhl
DQo+Pj4+Pj4gKyAgICBvcHRpb24gaXMgcHJvdmlkZWQgd2l0aCBhIG5vbiB6ZXJvIHZhbHVlLCBi
dXQgdGhlIHBsYXRmb3JtIGRvZXNuJ3Qgc3VwcG9ydA0KPj4+Pj4+ICsgICAgU1ZFLg0KPj4+Pj4g
DQo+Pj4+PiBBc3N1bWluZyB0aGlzIGFsc28gY292ZXJzIHRoZSAtMSBjYXNlLCBJIHdvbmRlciBp
ZiB0aGF0IGlzbid0IGEgbGl0dGxlIHRvbw0KPj4+Pj4gc3RyaWN0LiAiTWF4aW11bSBzdXBwb3J0
ZWQiIGltbyBjYW4gdmVyeSB3ZWxsIGJlIDAuDQo+Pj4+IA0KPj4+PiBNYXhpbXVtIHN1cHBvcnRl
ZCwgd2hlbiBwbGF0Zm9ybXMgdXNlcyBTVkUsIGNhbiBiZSBhdCBtaW5pbXVtIDEyOCBieSBhcm0g
c3BlY3MuDQo+Pj4gDQo+Pj4gV2hlbiB0aGVyZSBpcyBTVkUgLSBzdXJlLiBCdXQgd2hlbiB0aGVy
ZSdzIG5vIFNWRSwgMCBpcyBraW5kIG9mIHRoZSBpbXBsaWVkDQo+Pj4gbGVuZ3RoLiBBbmQgSSdk
IHZpZXcgYSBjb21tYW5kIGxpbmUgb3B0aW9uIHZhbHVlIG9mIC0xIHF1aXRlIG9rYXkgaW4gdGhh
dA0KPj4+IGNhc2U6IFRoZXkndmUgYXNrZWQgZm9yIHRoZSBtYXhpbXVtIHN1cHBvcnRlZCwgc28g
dGhleSdsbCBnZXQgMC4gTm8gcmVhc29uDQo+Pj4gdG8gY3Jhc2ggdGhlIHN5c3RlbSBkdXJpbmcg
Ym9vdC4NCj4+IA0KPj4gT2sgSSBzZWUgd2hhdCB5b3UgbWVhbiwgZm9yIGV4YW1wbGUgd2hlbiBL
Y29uZmlnIFNWRSBpcyBlbmFibGVkLCBidXQgdGhlIHBsYXRmb3JtIGRvZXNu4oCZdA0KPj4gaGF2
ZSBTVkUgZmVhdHVyZSwgcmVxdWVzdGluZyBzdmU9LTEgd2lsbCBrZWVwIHRoZSB2YWx1ZSB0byAw
LCBhbmQgbm8gc3lzdGVtIHdpbGwgYmUgc3RvcHBlZC4NCj4+IA0KPj4gTWF5YmUgSSBjYW4gc2F5
OiANCj4+IA0KPj4g4oCcLi4uIHRoZSBzYW1lIHdpbGwgb2NjdXIgaWYgdGhlIG9wdGlvbiBpcyBw
cm92aWRlZCB3aXRoIGEgcG9zaXRpdmUgbm9uIHplcm8gdmFsdWUsDQo+PiBidXQgdGhlIHBsYXRm
b3JtIGRvZXNuJ3Qgc3VwcG9ydCBTVkUuIg0KPiANCj4gUmlnaHQsIHByb3ZpZGVkIHRoYXQgbWF0
Y2hlcyB0aGUgaW1wbGVtZW50YXRpb24uDQoNCk9rIEkgd2lsbCBkbyB0aGUgY2hhbmdlcywgY2Fu
IEkgcmV0YWluIHlvdXIgUi1ieT8gSSBzdXBwb3NlIGl0IGNvdmVycyBhbHNvIGRvY3VtZW50YXRp
b24gcmlnaHQ/DQoNCj4gDQo+IEphbg0KDQoNCg==

