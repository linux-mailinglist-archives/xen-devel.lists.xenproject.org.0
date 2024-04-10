Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBA68A031E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 00:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703669.1099456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugEZ-0007HY-HN; Wed, 10 Apr 2024 22:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703669.1099456; Wed, 10 Apr 2024 22:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugEZ-0007Eq-Dj; Wed, 10 Apr 2024 22:15:59 +0000
Received: by outflank-mailman (input) for mailman id 703669;
 Wed, 10 Apr 2024 22:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rugEX-0007EL-5a
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 22:15:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e54f2402-f787-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 00:15:53 +0200 (CEST)
Received: from DU2P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::12)
 by DU0PR08MB7859.eurprd08.prod.outlook.com (2603:10a6:10:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 22:15:23 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::63) by DU2P251CA0001.outlook.office365.com
 (2603:10a6:10:230::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Wed, 10 Apr 2024 22:15:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 22:15:23 +0000
Received: ("Tessian outbound f0b355493f75:v300");
 Wed, 10 Apr 2024 22:15:22 +0000
Received: from 9936c50dbbb0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD211F90-9836-4C4B-9CCE-859BBD0DDDE1.1; 
 Wed, 10 Apr 2024 22:15:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9936c50dbbb0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 22:15:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6454.eurprd08.prod.outlook.com (2603:10a6:20b:33a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.47; Wed, 10 Apr
 2024 22:15:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 22:15:08 +0000
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
X-Inumbo-ID: e54f2402-f787-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Nsdt9LRMdVW1W5WvzOPBIT0z6Pvc76Rmyl9eTX7kcHm4ac2nbVkYryjgvkpkyhtPRpLMuZIU45FvY1hBzcy+btlWv1304mreUTLk2S9i3iyD3mzN3lpIDNNAwwGPKNIW9DLHlOK3jwxLNlfx2G+IZ0SjmrqxSbP+b+N3DITcKC8z/7VCV9rdy1svpTEz05ZAHIlGwD60qh0FENMnsiuF9Iovv3F45HAhnf0Ich4cN3/fKdCMFIdTMYgGKFSA54NdQ2lVrPdSMLtVql69K6DQg2PhsRdHPig2dFRceMIeuJWjEXkdDKvnZ6iAZFc43WBRi1VN4Qjflkkmof3hFkosug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4NjFr8QXusWYiDeLGqgJZoqYhbdfoqnOJxzVEGKduE=;
 b=mK6HpGvScV+ezi0oqDYoqJY/4uFQqoVU2ndvyQNVExMXXhvL/T8Hy7EROjufqf9xtO6U0lXvVDNsW7P6/ZU920SseNPihfYtpPZlwa9AHF+j8b+hn9+3qJ6tu+2jpY22Gm7IEqcIgeHudbaTKrSIgt6hDB85S14oZUHvB0pWVAeCnHESSQM08MFRwL1mM4gBGTKbGteMM0JodOe0jUWsPPJ63P2wO/7r5WdcuzpTLnU2Twj3eInO9tFEWOBiQ74UaTlTBIEXdIpOw/68ib008Yyf7HJKpiL6Y8nJ9UxAYa9ogWijg9dCG+QC4utoKXePDDEWQhbvJAvPWwuoE0GxUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4NjFr8QXusWYiDeLGqgJZoqYhbdfoqnOJxzVEGKduE=;
 b=b+wWk3PzT5+YY+GSrzmvLI5ju1FiSWrhwLoqff9ipCm1wlIpMQdi7LFtGUS0RoOJ+u2Jr+xt52kxoIeBLsGI0Mf6wWNYhorwvpUTXS847eZZljR3ehvDJWJsD0Eu1T49o7m8qk6lNYrcv5HIbwemWmZXQXYDCvZ7Q5EYfIakALU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f69cbb5f7d51c24
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBdm7AwdEDiUcoHAI4RzSoTpTooFkamKhd5EAz7+ZZpSEOSr9+sx0EMe1l4NbX0Gcc3ObRYet4NRm6lAtOdXZFSGfJPdZ2lpSjRndkmeZS3L44xM6dzY2Gl0hP2OK4aUnDT1wBZO/hwLMxdy9TtAmFKkkYPIHGg8rWTCbljIJShg9oFTGd7jSi+JBJXkOvlMzuppXR8ju7MExfX188LZjndke9wBS8evT3a1s8l2kz0/yCkpZxQPDc9eav9ywl6LdsBYdv+WENttGeh5uBoCgWsCDR8ontWkTTAi0Pgk/ubuSj0VpwwCdYIP5Ix1oxhdFIu7lqPRAfaAuA4dS38v9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4NjFr8QXusWYiDeLGqgJZoqYhbdfoqnOJxzVEGKduE=;
 b=dyFTxRns3l7WCfhGzcfIx7ToxdMxyg7uFN7u/TKWRLRFxnlKKz6BUWHJhCPad8igfHRSjWQ40mbl3QwGSMptkNl3yFVs1hEH+imMyqBhhsTc0lVi/Toi3zeKDNE29npgJWQ2BCGG5aFGY9hoDqJCaoZZWBieyJBbe4oJ+n/At540uIjCuj4Xkknrjf8yf/fKMiWnG1hXZq91RGfw6rSlKjTAhAP/Zygvmzq5s+FN4MZ73IoFYvgIAdQnz4WCxBQkl7yv8ksYtKNcGPGGHLcRy0QRiZ0E9/jPAc9LfRYZYMCBvS5fQdwKTznSRvCF24lUKw041xxdY4SbXt2VjaAvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4NjFr8QXusWYiDeLGqgJZoqYhbdfoqnOJxzVEGKduE=;
 b=b+wWk3PzT5+YY+GSrzmvLI5ju1FiSWrhwLoqff9ipCm1wlIpMQdi7LFtGUS0RoOJ+u2Jr+xt52kxoIeBLsGI0Mf6wWNYhorwvpUTXS847eZZljR3ehvDJWJsD0Eu1T49o7m8qk6lNYrcv5HIbwemWmZXQXYDCvZ7Q5EYfIakALU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 4/4] xen/virtual-region: Drop setup_virtual_regions()
Thread-Topic: [PATCH v2 4/4] xen/virtual-region: Drop setup_virtual_regions()
Thread-Index: AQHai3biMWazacOqM0yj9H6Ey1PPRbFiEh4A
Date: Wed, 10 Apr 2024 22:15:08 +0000
Message-ID: <3545F142-9557-4A91-8CEC-133CDA5F0EA9@arm.com>
References: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
 <20240410184217.1482366-5-andrew.cooper3@citrix.com>
In-Reply-To: <20240410184217.1482366-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6454:EE_|DU6PEPF0000B61D:EE_|DU0PR08MB7859:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vsY/4/aOdiT/ay8xWJDRlIMQ8XrO2wObjlTq+oBPpANRHyDBr2PSkDUXe7yCVvZCYPQ0DJaExNSAPX6E/fhNAZ70D1SHVOAQcXWIIj+pxTrOCEref09NjOFWUh14uZnI1YW6ohNUx8BrwLh5PtXVoWA+s2BRiDnaufLuPhf175Y/L/dRr0gCTd1Au+ez1fxUa9tNxbrkqdcA+HJ0XGyz1lcL1wRjoQi7o/360cBAVeobQ3T1TZFz3qjTxwEZ2bATny1mP/DctSwfK9gdso0lG0ebXicliHrkNk30I3yZpHc/yd6xTMFvRhYAJQIkDGPZZoQwbdOzKZhiEOuba+hZIdndH2liWzdN+JN6ZKLQ0GWdqQE4TopgnlSO6kkaTKqizijAy2Z+KYTNO7XGFk5AttmC9edp5ITS/SaICCv+svk8COqHSc6D4DoOoyAoakHTbo3dIxfJTvU4muhQMHgd7QeQ199KMhJPx/YtFwO5tlZVslfULwZIiPQfVJGHZDD1Ntm5eQmo5nkSXT0pfd2i9AsohxxiConc4BGvODsLxXP71wmC7kS+kENpdVE9qfNm92stdp+mQ7Di2dLtl8BCurqB8+L9Y7k0lcWPxqGVIOUUmgM9X/x558O8FKdNcYzQ7m3l/5EWWHlFwNA51ok9FBBDFQXoZRU1z/oUUNnQW70=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <715F3F33B7CB6642B2B3097ED42043E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6454
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2e8d9ad-944e-4ba7-484b-08dc59abb76a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pek9FdqkatXTrlBIyF8IK0F9na6LEl9L/dTipevKHJqtExyr6VVgLUq5qCyhUPoJ+8p2c3EUvbgG27lYYdVty3Jcgzyw2XKX43+43Kfm4DLPG9Aen+/Dy43RKgQSUBhsDmvBTFvoPHp3RWci+JAEBr9mvZmX8Z5PhFk9i2aAKuZn0XGPgmQ3M7i7UWMMVOTPXS8XPmkML6/dCM/zmyE2EBYzkdIjRkAnabTakMPMBNKYE6+U7PR031/F693rEQrIr/F3FKwc2LO8C04AhaY1tHDbC1wbPnL1bB9fdDRmuzpqBWR6iNeydhuyYJT6beBuUb/n/naine3lzO7k3CBeFcH9krMJQpzxma4XDrckVEnHBylXg7JBS3kOU1MZzfVptU7h/w46/pHiIVsPKflDIwuRAGbFiLiHiGCehAe7yWfMFlLrBVJ5nPQS977vBXEXEe4LByBPZl1ptt+qpMCgv7qB49CGbFpkU6dAezJ1KQ87npFcQ7cHDnXYoQFi9Qx0DZCQxVpD60lAVBkxl5uMc9/BR0ElJ+TrVVFTcIdeBG5TDbw+bs6/9cMDFyOvIZumJ/WfPyZYoMs5xJP8Ve9STrIiD2vkKo8rnRachjp73Hz/sBPjFMhBwBj3uqIfGB0uSUVg75oj5noS8tdzAg2HALX9lImSuGzuQEXyPnV/L2kvV7IZ7RKJ/E0PfJGw1E+lFH2IwzBtoAmMHUucNMcm3vS1D5CQnW+cwHBMguL0E1EmW2j8WbNinaXJ0gw4t9PU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 22:15:23.1087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e8d9ad-944e-4ba7-484b-08dc59abb76a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7859

DQoNCj4gT24gMTAgQXByIDIwMjQsIGF0IDE5OjQyLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEFsbCBvdGhlciBhY3Rpb25zIGl0IHVzZWQg
dG8gcGVyZm9ybSBoYXZlIGJlZW4gY29udmVydGVkIHRvIGJ1aWxkLXRpbWUNCj4gaW5pdGlhbGlz
YXRpb24uICBUaGUgZXh0YWJsZSBzZXR1cCBjYW4gZG9uZSBhdCBidWlsZCB0aW1lIHRvby4NCj4g
DQo+IFRoaXMgaXMgb25lIGZld2VyIHNldHVwIHN0ZXAgcmVxdWlyZWQgdG8gZ2V0IGV4Y2VwdGlv
bnMgd29ya2luZy4NCj4gDQo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIG1vdmUgJ2NvcmUnIGlu
dG8gcmVhZF9tb3N0bHksIHdoZXJlIGl0IHByb2JhYmx5IHNob3VsZA0KPiBoYXZlIGxpdmVkIGFs
bCBhbG9uZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQoNCkZvciB0aGUgYXJtIHBhcnQ6DQoNClJldmlld2VkLWJ5OiBMdWNh
IEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+ICNhcm0NCg0KSeKAmXZlIGFsc28gdGVz
dGVkIHRoZSBzZXJpZSBvbiBhcm0zMiBhbmQgYXJtNjQgb24gcWVtdQ0KDQpUZXN0ZWQtYnk6IEx1
Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KDQo=

