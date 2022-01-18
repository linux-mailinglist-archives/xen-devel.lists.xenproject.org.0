Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0F749208E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 08:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258370.444853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jH6-00072z-Ru; Tue, 18 Jan 2022 07:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258370.444853; Tue, 18 Jan 2022 07:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jH6-0006zd-OT; Tue, 18 Jan 2022 07:51:28 +0000
Received: by outflank-mailman (input) for mailman id 258370;
 Tue, 18 Jan 2022 07:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K2lf=SC=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1n9jH4-0006zX-Qw
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 07:51:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f30000a-7833-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 08:51:25 +0100 (CET)
Received: from AS9PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:20b:464::35)
 by VI1PR08MB3678.eurprd08.prod.outlook.com (2603:10a6:803:89::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 07:51:21 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::7a) by AS9PR06CA0061.outlook.office365.com
 (2603:10a6:20b:464::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 07:51:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 07:51:21 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Tue, 18 Jan 2022 07:51:20 +0000
Received: from b2ee4554d203.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6850EAC-B0BF-48D0-9011-E36760215C18.1; 
 Tue, 18 Jan 2022 07:51:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2ee4554d203.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jan 2022 07:51:10 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB7185.eurprd08.prod.outlook.com (2603:10a6:102:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 18 Jan
 2022 07:51:09 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 07:51:08 +0000
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
X-Inumbo-ID: 6f30000a-7833-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mICl6khP2BfVYkr4LeNqE1HhE/4I6l1fCFrCf0qZ4MI=;
 b=wAi35VbZdiXXIQXoRXRNtZuBd1s+jIBm2e33QdOcJRVQFYYcTAYQ/zqkTAJ3Y00S5FW25CazTucU2wFCsk4rJ5Q/3UHj3LCykafqJ655Qyqi93BPgM3areqLBIPTrPP2PzP6EtEt14LUcnzSlxGo24Y/L1VH49PpRyaODm6VTFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I47DiDbUX7t/q9wWaaJyfWuuwvUzLm+08LfHlMckizvegRk7x4NtqtqQbrbxkZzwxBV6Z/oaAqrJ2bmmUGRoLUxBVchk5VkRrS8fz+CE6i4Qh53QgBpfyCxJtUe3IN5ekEjecRERJOl3jGDGvdnMXzuk58dsdAnzv3CCq79RmnhKqs021kOO+yKs/zZHGidwlT1fsqclDbSyc6QXpgH8pYP+wCMvR9xO4xA6PKRbvaChvj/wqN80XLhkFVwfkfQ5/+7lGgfNJvTfRp3QqCdANSJuK7rHZemVonAaL/EpaMNUlWY0vqRelKnNyAaLFZaSdzzbM+dOiVPVospBix9ENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mICl6khP2BfVYkr4LeNqE1HhE/4I6l1fCFrCf0qZ4MI=;
 b=QPMXqvutuR7Rkk5+qAZ8Sy0PrZF8O8ov7i6h2Y/R9SnEdN9alf4ucHMQq4gqnvTuNojtadfXDkAxxQnISjXjVHo4qHm6TX25ADRHyND9fegukx/KeZlmMiBCS5eBhetJs0mJogYQCQxkXcVX5LQD89CCNAgb0OCI8of7DGAZmTfT1EMZp9rCGmyD9Oe7iB+3sXegywrI+tfyuNcbOpCj1CIOlwfWabwB1zHg1aSzGaFcx9iJAfLXHwE5tcpC2ao4dRlBFEv16U4h7Zz+D1GcdkARTOjXeF2jPmvHDAcC2eVHIgKNNkvUwrqg/nvYQa9HAFHNn4Z56lmXkigBD7DV9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mICl6khP2BfVYkr4LeNqE1HhE/4I6l1fCFrCf0qZ4MI=;
 b=wAi35VbZdiXXIQXoRXRNtZuBd1s+jIBm2e33QdOcJRVQFYYcTAYQ/zqkTAJ3Y00S5FW25CazTucU2wFCsk4rJ5Q/3UHj3LCykafqJ655Qyqi93BPgM3areqLBIPTrPP2PzP6EtEt14LUcnzSlxGo24Y/L1VH49PpRyaODm6VTFg=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Topic: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Index: AQHXsHMGx8xGhif/FUCDSa9NS/fSLqxoGKiAgAD49HA=
Date: Tue, 18 Jan 2022 07:51:08 +0000
Message-ID:
 <PAXPR08MB7420CD3B7CFB4D2D81019F479E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
 <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
In-Reply-To: <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2865EEDF098CA2409B9E848F555144EC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7a18d88d-f88d-487e-6b83-08d9da57515a
x-ms-traffictypediagnostic:
	PAXPR08MB7185:EE_|VE1EUR03FT035:EE_|VI1PR08MB3678:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB367884D1B414D26B343A904B9E589@VI1PR08MB3678.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ci/N20RXzuDnkcmlimV9ywmbMA/vDkmnLMkLkwHbkTxzayiQAiGB1NHHGaV8VdtwQnWJdxpNcoGaXzTJ7GxA86kMV4NaS6EWmYPLDdneB/j7WPUP+rv2Km+oz7w/7BN/JoOw+2J7so61x6xWe6rT0ZbQ49ZDPaoMvnTpom/20P6J7y/7eJnJcvfrnDQdWZjnDmj/8saNid/Bv8IMyLTDwUDYQm0DCbEIInJrtmi28isijqXMQFB6950xiyJiEv7bIc6FEWI/t/Y429GFzPJnRBrvqYNbiLgQEYDcbnO4rE/yBO0ew/fxyzirPfb7qDLLLpVZYsfQ9TWGxukNOFZora0GMhYlrk7ErzXNmofWSDSsZDq46sKiXKhS8xLsg2VU6U50wLb/W87jgskvvFZehgqjSLBRAvRovY4OCykixWhP+cQJtRmnNETIUJea5eAcLuAb1Ys2yo2FdgWAxWUwe7Mg3dYETk40xWRR/CfPG4OztBzLc6lNrjH6Af+lq9PqZqJXRQkc9qdRBkX7Q4qHLp8UPg3DrLCJWEQtYN/d3Du0V/Duvrtxw9F9EQ28y1R8nrtrLcFQAO+95cqqFs14q0j0boVyOc33CNvvubDXhWp6xbgeLPn5rf5BSJxIuhnzvVnXMgIARenhjuB8nMA8bnWPS52QlzGXW4JU6vGrn3McB/cu1O+zlWO+QkmsA7M1ZLO0MTVTWmG0WR8PYEeNCHRcuIfRa3+BHaiB8em/XWOiDjUqzw1VQUa6zV53E6k/FgpwJ4iqRWQP6/U3gXde/MaasJGQwFlEA9SjR1bWrIw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(6506007)(26005)(66476007)(2906002)(76116006)(66556008)(86362001)(38100700002)(66446008)(316002)(71200400001)(6916009)(5660300002)(33656002)(8936002)(508600001)(9686003)(55016003)(122000001)(54906003)(186003)(53546011)(7696005)(38070700005)(52536014)(4326008)(966005)(83380400001)(8676002)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7185
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1980e29b-e1bf-497f-6fca-08d9da574a0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k6otgLqftYZXhK25uVA9z8cpVNkM1lV4uvDTlayBIu1BUSgyfDiAtLksX/t80vrjYc8GCWrQZzPZCIE6jmGnrIS+NJaTRxyDpoutWIseOOb4rOGFRlvF1TDzdVHwmGISJVpwEBLzTrangdtV8MJjt2NQRpv/TedwX4ywgLJ5fP7tmkdwBuBIz378R9OMU/WOysPAz68bKSLV2o8tPLTu9Je4gqwZgVBUeXyAHbdqf/gt7d+CDMgmCCqjgvkVLWD5QFzItD0g33w7CjmqaYHXE2m4Gu5O1FZL4x72NF7GOiKuGzjtzA5uiGkJmtJy1MHeOWcamf5MyfIOyP0tY+CoAfGTdLMkqKtHcvaLWpU5dYJfuWPCfrj5y0oSwt74U4zwSpxKwJCsq10d6XoBuNtVzpigA7erg1IoUB7psgNd3um4vATPD4eIiZQE14U4nS8bZOHkOy29krPWW/cCc1F9zxsikKf9ELKbSvfIetcyuMd9z4uBAamhlOg2zp8q+i59/fIKIYRGPe/fxEKTb7jXgaljBmUgeaVrUxUI68KEMfYQ+OcyEvQ3+KMpMRuMdttK6RPxiD8X527hZmfmmwLICuzZ/wZ0qelVYNOQR/f94c+Zz5P+3xlRAOodHJkgxRGymUTVKtit6lgw7LYiPKWCS7tU1xbySwRc7VH6E/ye/K23uK2cOyYsaa1OquuCSzi8g0VtIp0evazSWEjDjJblAQvOyMZ20zwq629I2dcsqw6DsAnJqfF9ZPz0+rmkWoNgPJVsSv0xpXVOW2hZrylcnxcZ3m8QPFmVCh14dIf72W8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(47076005)(83380400001)(6506007)(53546011)(86362001)(966005)(7696005)(508600001)(4326008)(26005)(33656002)(36860700001)(70586007)(2906002)(186003)(55016003)(54906003)(336012)(70206006)(356005)(8676002)(6862004)(81166007)(5660300002)(9686003)(82310400004)(316002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 07:51:21.0119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a18d88d-f88d-487e-6b83-08d9da57515a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3678

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOOaXpSAwOjExDQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMDQvMzddIHhlbjogaW50cm9kdWNlIGFuIGFyY2ggaGVscGVyIGZvciBkZWZh
dWx0IGRtYQ0KPiB6b25lIHN0YXR1cw0KPiANCj4gSSByZWFsaXplIHRoaXMgc2VyaWVzIGhhcyBi
ZWVuIHBlbmRpbmcgZm9yIGEgbG9uZyB0aW1lLCBidXQgSSBkb24ndA0KPiByZWNhbGwgYW55IGlu
ZGljYXRpb24gdGhhdCBpdCB3b3VsZCBoYXZlIGJlZW4gZHJvcHBlZC4gSGVuY2UgYXMgYQ0KPiBm
aXJzdCB0cnksIGEgZmV3IGNvbW1lbnRzIG9uIHRoaXMgcmVsYXRpdmVseSBzaW1wbGUgY2hhbmdl
LiBJJ20NCj4gc29ycnkgaXQgdG8gaGF2ZSB0YWtlbiBzbyBsb25nIHRvIGdldCB0byBpdC4NCj4g
DQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoaXMgc2VyaWVzIGFuZCBsaWZ0IGl0IHVwLiBXZSBh
cmUgc3RpbGwNCndvcmtpbmcgb24gdGhpcyBzZXJpZXMgYW5kIHdpbGwgc2VuZCBhIG5ldyB2ZXJz
aW9uIHNvb24uDQoNCj4gT24gMjMuMDkuMjAyMSAxNDowMiwgV2VpIENoZW4gd3JvdGU6DQo+ID4g
SW4gY3VycmVudCBjb2RlLCB3aGVuIFhlbiBpcyBydW5uaW5nIGluIGEgbXVsdGlwbGUgbm9kZXMg
TlVNQQ0KPiA+IHN5c3RlbSwgaXQgd2lsbCBzZXQgZG1hX2JpdHNpemUgaW4gZW5kX2Jvb3RfYWxs
b2NhdG9yIHRvIHJlc2VydmUNCj4gPiBzb21lIGxvdyBhZGRyZXNzIG1lbW9yeSBmb3IgRE1BLg0K
PiA+DQo+ID4gVGhlcmUgYXJlIHNvbWUgeDg2IGltcGxpY2F0aW9ucyBpbiBjdXJyZW50IGltcGxl
bWVudGF0aW9uLiBCZWN1YXNlDQo+ID4gb24geDg2LCBtZW1vcnkgc3RhcnRzIGZyb20gMC4gT24g
YSBtdWx0aXBsZSBub2RlcyBOVU1BIHN5c3RlbSwgaWYNCj4gPiBhIHNpbmdsZSBub2RlIGNvbnRh
aW5zIHRoZSBtYWpvcml0eSBvciBhbGwgb2YgdGhlIERNQSBtZW1vcnkuIHg4Ng0KPiA+IHByZWZl
ciB0byBnaXZlIG91dCBtZW1vcnkgZnJvbSBub24tbG9jYWwgYWxsb2NhdGlvbnMgcmF0aGVyIHRo
YW4NCj4gPiBleGhhdXN0aW5nIHRoZSBETUEgbWVtb3J5IHJhbmdlcy4gSGVuY2UgeDg2IHVzZSBk
bWFfYml0c2l6ZSB0byBzZXQNCj4gPiBhc2lkZSBzb21lIGxhcmdlbHkgYXJiaXRyYXJ5IGFtb3Vu
dCBtZW1vcnkgZm9yIERNQSBtZW1vcnkgcmFuZ2VzLg0KPiA+IFRoZSBhbGxvY2F0aW9ucyBmcm9t
IHRoZXNlIG1lbW9yeSByYW5nZXMgd291bGQgaGFwcGVuIG9ubHkgYWZ0ZXINCj4gPiBleGhhdXN0
aW5nIGFsbCBvdGhlciBub2RlcycgbWVtb3J5Lg0KPiA+DQo+ID4gQnV0IHRoZSBpbXBsaWNhdGlv
bnMgYXJlIG5vdCBzaGFyZWQgYWNyb3NzIGFsbCBhcmNoaXRlY3R1cmVzLiBGb3INCj4gPiBleGFt
cGxlLCBBcm0gZG9lc24ndCBoYXZlIHRoZXNlIGltcGxpY2F0aW9ucy4gU28gaW4gdGhpcyBwYXRj
aCwgd2UNCj4gPiBpbnRyb2R1Y2UgYW4gYXJjaF9oYXZlX2RlZmF1bHRfZG1hem9uZSBoZWxwZXIg
Zm9yIGFyY2ggdG8gZGV0ZXJtaW5lDQo+ID4gdGhhdCBpdCBuZWVkIHRvIHNldCBkbWFfYml0c2l6
ZSBmb3IgcmVzZXJ2ZSBETUEgYWxsb2NhdGlvbnMgb3Igbm90Lg0KPiANCj4gSG93IHdvdWxkIEFy
bSBndWFyYW50ZWUgYXZhaWxhYmlsaXR5IG9mIG1lbW9yeSBiZWxvdyBhIGNlcnRhaW4NCj4gYm91
bmRhcnkgZm9yIGxpbWl0ZWQtY2FwYWJpbGl0eSBkZXZpY2VzPyBPciBpcyB0aGVyZSBubyBuZWVk
DQo+IGJlY2F1c2UgdGhlcmUncyBhbiBhc3N1bXB0aW9uIHRoYXQgSS9PIGZvciBzdWNoIGRldmlj
ZXMgd291bGQNCj4gYWx3YXlzIHBhc3MgdGhyb3VnaCBhbiBJT01NVSwgbGlmdGluZyBhZGRyZXNz
IHNpemUgcmVzdHJpY3Rpb25zPw0KPiAoSSBndWVzcyBpbiBhICFQViBidWlsZCBvbiB4ODYgd2Ug
Y291bGQgYWxzbyBnZXQgcmlkIG9mIHN1Y2ggYQ0KPiByZXNlcnZhdGlvbi4pDQoNCk9uIEFybSwg
d2Ugc3RpbGwgY2FuIGhhdmUgc29tZSBkZXZpY2VzIHdpdGggbGltaXRlZCBETUEgY2FwYWJpbGl0
eS4NCkFuZCB3ZSBhbHNvIGRvbid0IGZvcmNlIGFsbCBzdWNoIGRldmljZXMgdG8gdXNlIElPTU1V
LiBUaGlzIGRldmljZXMNCndpbGwgYWZmZWN0IHRoZSBkbWFfYml0c2l6ZS4gTGlrZSBSUGkgcGxh
dGZvcm0sIGl0IHNldHMgaXRzIGRtYV9iaXRzaXplDQp0byAzMC4gQnV0IGluIG11bHRpcGxlIE5V
TUEgbm9kZXMgc3lzdGVtLCBBcm0gZG9lc24ndCBoYXZlIGEgZGVmYXVsdA0KRE1BIHpvbmUuIE11
bHRpcGxlIG5vZGVzIGlzIG5vdCBhIGNvbnN0cmFpbnQgb24gZG1hX2JpdHNpemUuIEFuZCBzb21l
DQpwcmV2aW91cyBkaXNjdXNzaW9ucyBhcmUgcGxhY2VkIGhlcmUgWzFdLg0KDQo+IA0KPiA+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9udW1hLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbnVtYS5jDQo+
ID4gQEAgLTM3MSw2ICszNzEsMTEgQEAgdW5zaWduZWQgaW50IF9faW5pdCBhcmNoX2dldF9kbWFf
Yml0c2l6ZSh2b2lkKQ0KPiA+ICAgICAgICAgICAgICAgICAgICsgUEFHRV9TSElGVCwgMzIpOw0K
PiA+ICB9DQo+ID4NCj4gPiArdW5zaWduZWQgaW50IGFyY2hfaGF2ZV9kZWZhdWx0X2RtYXpvbmUo
dm9pZCkNCj4gPiArew0KPiA+ICsgICAgcmV0dXJuICggbnVtX29ubGluZV9ub2RlcygpID4gMSAp
ID8gMSA6IDA7DQo+ID4gK30NCj4gDQo+IEFjY29yZGluZyB0byB0aGUgZXhwcmVzc2lvbiBhbmQg
Li4uDQo+IA0KPiA+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gKysrIGIveGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBAQCAtMTg4OSw3ICsxODg5LDcgQEAgdm9pZCBfX2lu
aXQgZW5kX2Jvb3RfYWxsb2NhdG9yKHZvaWQpDQo+ID4gICAgICB9DQo+ID4gICAgICBucl9ib290
bWVtX3JlZ2lvbnMgPSAwOw0KPiA+DQo+ID4gLSAgICBpZiAoICFkbWFfYml0c2l6ZSAmJiAobnVt
X29ubGluZV9ub2RlcygpID4gMSkgKQ0KPiA+ICsgICAgaWYgKCAhZG1hX2JpdHNpemUgJiYgYXJj
aF9oYXZlX2RlZmF1bHRfZG1hem9uZSgpICkNCj4gPiAgICAgICAgICBkbWFfYml0c2l6ZSA9IGFy
Y2hfZ2V0X2RtYV9iaXRzaXplKCk7DQo+IA0KPiAuLi4gdGhlIHVzZSBzaXRlLCB5b3UgbWVhbiB0
aGUgZnVuY3Rpb24gdG8gcmV0dXJuIGJvb2xlYW4uIFBsZWFzZQ0KPiBpbmRpY2F0ZSBzbyBieSBt
YWtpbmcgaXQgaGF2ZSBhIHJldHVybiB0eXBlIG9mICJib29sIi4gSW5kZXBlbmRlbnQNCj4gb2Yg
dGhhdCB5b3UgZG9uJ3QgbmVlZCBhIGNvbmRpdGlvbmFsIGV4cHJlc3Npb24gYWJvdmUsIG5vcg0K
PiAobWFsZm9ybWVkKSB1c2Ugb2YgcGFyZW50aGVzZXMuIEkgZnVydGhlciB3b25kZXIgd2hldGhl
ciAuLi4NCj4gDQoNCkkgd2lsbCBmaXggdGhlbSBpbiBuZXh0IHZlcnNpb24uIEJ1dCBJIGFtIG5v
dCB2ZXJ5IGNsZWFyIGFib3V0DQp0aGlzIGNvbW1lbnQgIm9mIHRoYXQgeW91IGRvbid0IG5lZWQg
YSBjb25kaXRpb25hbCBleHByZXNzaW9uIGFib3ZlIiwNClRoZSAiYWJvdmUiIGluZGljYXRlcyB0
aGlzIGxpbmU6DQoicmV0dXJuICggbnVtX29ubGluZV9ub2RlcygpID4gMSApID8gMSA6IDA7Ij8N
Cg0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9udW1hLmgNCj4gPiBAQCAtMjUsNiArMjUsMTEgQEAgZXh0ZXJuIG1mbl90
IGZpcnN0X3ZhbGlkX21mbjsNCj4gPiAgI2RlZmluZSBub2RlX3N0YXJ0X3BmbihuaWQpIChtZm5f
eChmaXJzdF92YWxpZF9tZm4pKQ0KPiA+ICAjZGVmaW5lIF9fbm9kZV9kaXN0YW5jZShhLCBiKSAo
MjApDQo+ID4NCj4gPiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgYXJjaF9oYXZlX2RlZmF1
bHRfZG1hem9uZSh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiAN
Cj4gLi4uIGxpa2UgdGhpcyBvbmUsIHg4NidlcyBjb3VsZG4ndCBiZSBpbmxpbmUgYXMgd2VsbC4g
SWYgaW5kZWVkDQo+IGl0IGNhbid0IGJlLCBtYWtpbmcgaXQgYSBtYWNybyBtYXkgc3RpbGwgYmUg
YmV0dGVyIChhbmQgYXZvaWQgYQ0KPiBmdXJ0aGVyIGNvbW1lbnQgcmVnYXJkaW5nIHRoZSBsYWNr
IG9mIF9faW5pdCkuDQoNCk9rLCB0aGF0IHdvdWxkIGJlIGJldHRlciwgSSB3aWxsIGRvIGl0IGlu
IG5leHQgdmVyc2lvbi4NCg0KPiANCj4gSmFuDQoNClsxXSBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjEtMDgvbXNnMDA3NzIuaHRtbA0KDQoN
Cg==

