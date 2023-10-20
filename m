Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051B7D1233
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 17:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619816.965510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtr5G-0007gB-A6; Fri, 20 Oct 2023 15:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619816.965510; Fri, 20 Oct 2023 15:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtr5G-0007dD-5q; Fri, 20 Oct 2023 15:06:42 +0000
Received: by outflank-mailman (input) for mailman id 619816;
 Fri, 20 Oct 2023 15:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtr5E-0007cS-Ep
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 15:06:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7d00::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 439411ab-6f5a-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 17:06:37 +0200 (CEST)
Received: from DB3PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:8:1::24) by
 PAVPR08MB9258.eurprd08.prod.outlook.com (2603:10a6:102:308::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 15:06:34 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::eb) by DB3PR06CA0011.outlook.office365.com
 (2603:10a6:8:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Fri, 20 Oct 2023 15:06:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 15:06:34 +0000
Received: ("Tessian outbound a024c74d4d6d:v215");
 Fri, 20 Oct 2023 15:06:33 +0000
Received: from b3759e2d3735.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E990F0BB-192F-4C47-A191-31D3CEF36B30.1; 
 Fri, 20 Oct 2023 15:06:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3759e2d3735.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 15:06:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB10585.eurprd08.prod.outlook.com (2603:10a6:150:14e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 15:06:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 15:06:20 +0000
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
X-Inumbo-ID: 439411ab-6f5a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJdQWkVxux7uYgeK5Q7E9WMCMl2JrEFbdepZEMuy6oA=;
 b=57J5wkdrWW0lTzXPU7ZT5wLWx/tQ149evOAE0+07/NDPPe6nY8NkAIjQz5jBjmigmI4vsaR3PL74lCuWlQEzqQ3yan/d3k97uEP0yaPci6vpB8UhevLt7dm6fMXP3z8rKXnFe+UvF0gVVNI7AUjDVYJiV/JPPl0oYNcr+Cnu6X4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ca0142865f2d8d3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8/TF+P5ZWbFWxA0dQGiSVcWff6CrbZkyotDGHdj4vDzXoPIcFELgCw4c258RtK115gt6ViFg7z+cUcutQPokvHECKCcve31I2yugpgdf8e/oZ7DuXeDpOAy5Zcxz+zppepI2Q3J/IVj51/eQcLWDV4S7SbXpI3wDf6bOObzZJkTQzek4tJNxvRVkwWmcBXf1SmS1H69BU4GT7tU8+JZnFT4Pyryz5lpaCmVXpSN8HbDuL+l576twOPWFZAp0gfr9m5X28HyNn1h1A3ko6mZlMGnkoF9Z3lbS0I53InEOPY2msjOZM+aqdQ3lWnFCe9AdnpODuiCvfs7pMotOL5Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJdQWkVxux7uYgeK5Q7E9WMCMl2JrEFbdepZEMuy6oA=;
 b=Xf1iqEp4z18yxtDBVaKZtBCKOyOUgAENKJZOcPUadWMroteNG+UyFQzVq5ndfTM0nEha1FXTBbV+VERZfparUIhTfcb8O80a5ADB+/PcSRfuI1T1N5CrrPpvPhjicSTzEUALNFJYpfL5/WmVMk3y/P41IwJ5/vZ9SNCnmiLTTA9LdhvUianqF1d3WCJbNLs8ZIbKtbbplwYm1oWbBE3d45iDsHapfrp1ATEKuPRH2qqlEU+KhaUpvGQwxxgSL7LhmYQmGdDNjeaBRaaDYinEnMM12GB0hiu1qiMo9mavoOfOc8Bc7c0qiVfJWEzM9uzGgiEy4lpiFHBbxgf21V6AFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJdQWkVxux7uYgeK5Q7E9WMCMl2JrEFbdepZEMuy6oA=;
 b=57J5wkdrWW0lTzXPU7ZT5wLWx/tQ149evOAE0+07/NDPPe6nY8NkAIjQz5jBjmigmI4vsaR3PL74lCuWlQEzqQ3yan/d3k97uEP0yaPci6vpB8UhevLt7dm6fMXP3z8rKXnFe+UvF0gVVNI7AUjDVYJiV/JPPl0oYNcr+Cnu6X4=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 2/3] CHANGELOG.md: Set 4.18 release date and tag
Thread-Topic: [PATCH 2/3] CHANGELOG.md: Set 4.18 release date and tag
Thread-Index: AQHaAkwelJ/nqwKyk0yYe6Zf84C1/bBRSfMAgACZlYCAAEzsAIAAmN4A
Date: Fri, 20 Oct 2023 15:06:20 +0000
Message-ID: <4418D961-2A3B-4062-A888-55EBE6A4CFF6@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190913360.1945130@ubuntu-linux-20-04-desktop>
 <8327F8D2-72B7-42CE-A31A-9E845A38DAC0@arm.com>
 <42132ef5-ddf5-a7a4-70fc-ccb42419300f@suse.com>
In-Reply-To: <42132ef5-ddf5-a7a4-70fc-ccb42419300f@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB10585:EE_|DB5PEPF00014B8A:EE_|PAVPR08MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cb1fcc-a0ba-44a8-8c76-08dbd17e2637
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pLfRE4XZq6Q53OSifXmTf+K2PmxvgC2Z8GQuwCw1UGJmArIAZE195XvO1kJRhVRRidTfD/tJL7YQ64TnltzhK6k89G3oyo0RfkJkWvOoXLR8a5hCOwdAIBystNE0393q03baejrvRxCgO+OJAR1tldWTdCyoybG6S+3+k2mDUdR5PBDhpSCf1hRHozQ52RQcUoaC3Hs0U5KRYpekYmck7yxTvFIsUkhf3dJeL8Af0C247SzagJcE+4wGIRFBcXIXNrEMlt+QBeeyDR1oLicGmwQXvciA8vBfjYVmep6f16r4bPPBoJvk9mUi3LVrSDfC76a51QVFvHtUl6lfL4LIUvlSJRiAyH7KJhp29t18kYu8WvdJCTbLJSTRTrER8/rNbAhh7elJ88QKvjZ1VXxiiaU8/gBzoTJJgI/5ijzSMV1U17xvI2FmqSHd+GV1DMefw7Rh95636f33ViFUvnmIW/mqfjX/zjCqnbXrfOfNp45g9jWv38pEIH43+wRqtOGJsv89zgQ90WIwCjQk9Ta0VlJouRibGLCHedR9kpOnepc9pkEg8IHX952aK96yYka8odOHs2dYVn214UVEdHwJbodqPYCpJtyWE/wLRmv19SReG0wqwqnMlX3R+bfwLJBFy4HfuQmol893BQiQfa6ApkuITDhBCj7EEFLGfRDAV89I91RFwOpPTrwEYHttTY42qV28ZGCjG76bugftv2Hj1v/brlh/M8KHq9Kjtq9mFcU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(36756003)(33656002)(38100700002)(26005)(83380400001)(2616005)(86362001)(4001150100001)(122000001)(6512007)(38070700009)(2906002)(53546011)(6506007)(71200400001)(41300700001)(6916009)(64756008)(54906003)(66476007)(66946007)(76116006)(91956017)(66556008)(66446008)(316002)(5660300002)(8936002)(8676002)(4326008)(6486002)(478600001)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFFFEEC00DA34D4DA14386C07006F608@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10585
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c8bd8f4-c002-4544-fae1-08dbd17e1e4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ArID0R/0HaWhffuHWMj4CRfpIiFkwnOGDHhCC4iaNGtG5PAeSgy9O8shklyByzPM2i2L3Qa8wGdaDQXp7nJu1QWjrpUxeWG3StkIAOmxMLTsbtQIPU4+Uj+RcBTDfOItMa9QL4wxFUFnS71SBPTYabl9Mi26c0/RfNzBXlNIx7o7fymkx+e0uXST6UkLuQTDQs2CIM9g/G76TEbJa1aSRJkx+fuNM400qOENMv5JBdMjxKlpn97M4gMTc0r4McOd/QDX/na/GGI4yTE2SM+tmy5wfX3AbSSbbCYtn1n9IEcl06TFN0D6YIUQbu02T4Fryx8o86DowUvWVBCGUxo46SSRzaSggHuJ+bqxLJ/+aywQFsOT4vprnFBdieP3bm8+HEggYkadJWNDfWH42c41r8S+TSJYUGh3AlAXlDlqSQlvWSR2Wh1P+ii4jwhYVTkoXcQYoViTotZNis7Sr6sXNT6MVY1/+I1K3mo2BKNljFHMMH6DyyrmNJgopiJRXMLAreamu7ogHaQyRnQxgmq9xN9Mu0yAO0rvFSiok4pZyLW3yGRA9zOQgtnfJ5CJNEJ/usBeAuuthib6OEeKHIoDvqPvDcXU4y9EKG/80O1VJAcrjQZKyaBOD39/OGAqhrU87eufzGbbss+nG0hOGz80/t6xCoVgrXoF5pNU1cZJz0RA3PH3t8xHoiED6XVzDs4CIenPrrv30bP8srzn5ZIkD5bbW0Po7OPUAu8F1Y/nEps14ySM8ATU7SamITg5O0pGtZGTRM7luWpIwVZDP6POP7En7IvLEdUNsvK0n7nHoQHn7kxXHG62/5QJaE7fyAA1jrtBVaxEOPBhH0UNeK7MRg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(40460700003)(86362001)(2906002)(47076005)(83380400001)(36756003)(6862004)(41300700001)(4326008)(5660300002)(40480700001)(356005)(6512007)(26005)(6506007)(82740400003)(336012)(36860700001)(53546011)(2616005)(81166007)(4001150100001)(8676002)(478600001)(8936002)(6486002)(33656002)(70586007)(54906003)(70206006)(316002)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 15:06:34.0003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cb1fcc-a0ba-44a8-8c76-08dbd17e2637
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9258

SGkgSmFuLA0KDQo+IE9uIE9jdCAyMCwgMjAyMywgYXQgMTM6NTksIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyMC4xMC4yMDIzIDAzOjIzLCBIZW5yeSBX
YW5nIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBPY3QgMjAsIDIwMjMsIGF0IDAwOjE0LCBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+
IE9uIFRodSwgMTkgT2N0IDIwMjMsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IENIQU5H
RUxPRy5tZCB8IDIgKy0NCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdF
TE9HLm1kDQo+Pj4+IGluZGV4IDQ3ZTk4ZjAzNmYuLjNjODM4NzhjOWIgMTAwNjQ0DQo+Pj4+IC0t
LSBhL0NIQU5HRUxPRy5tZA0KPj4+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+Pj4gQEAgLTQsNyAr
NCw3IEBAIE5vdGFibGUgY2hhbmdlcyB0byBYZW4gd2lsbCBiZSBkb2N1bWVudGVkIGluIHRoaXMg
ZmlsZS4NCj4+Pj4gDQo+Pj4+IFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vs
b2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+Pj4gDQo+Pj4+IC0j
IyBbdW5zdGFibGUgVU5SRUxFQVNFRF0oaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9w
PXhlbi5naXQ7YT1zaG9ydGxvZztoPXN0YWdpbmcpIC0gVEJEDQo+Pj4+ICsjIyBbNC4xOC4wXSho
dHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXNob3J0bG9nO2g9UkVM
RUFTRS00LjE4LjApIC0gMjAyMy0xMC0zMA0KPj4+IA0KPj4+IFNob3VsZCB3ZSB1c2UgeGVuYml0
cy54ZW5wcm9qZWN0Lm9yZyBpbnN0ZWFkPyBJIHRoaW5rIHRoYXQncyB0aGUNCj4+PiBvZmZpY2lh
bCBuYW1lLiBJbiBhbnkgY2FzZToNCj4+IA0KPj4gSG1tbSwgZ29vZCBxdWVzdGlvbiwgYnV0IGFm
dGVyIHNvbWUgZGVlcGVyIGxvb2sgc29tZWhvdyBJIGFtIG1vcmUgY29uZnVzZWQgbm93Lg0KPj4g
DQo+PiBTbyBpZiBJIGNsaWNrIHRoZSB4ZW4uZ2l0IGxpbmsgaW4geGVuYml0cy54ZW5wcm9qZWN0
Lm9yZyA8aHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvPiwgSSB3aWxsIGJlIGRpcmVjdGVk
IHRvDQo+PiAiaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXN1bW1h
cnnigJ0sIHdoZXJlIHRoZSBodHRwIGFuZCBodHRwcyBnaXQgVVJMDQo+PiBhcmUgYm90aCB1c2lu
ZyAieGVuYml0cy54ZW4ub3Jn4oCdLg0KPj4gDQo+PiBIb3dldmVyLCAiaHR0cHM6Ly94ZW5iaXRz
LnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c3VtbWFyeeKAnSBpcyBhbHNvIGEg
dmFsaWQNCj4+IGxpbmssIGJ1dCB0aGUgaHR0cHMgYW5kIGh0dHAgZ2l0IFVSTCBhcmUgc3RpbGwg
Ym90aCB1c2luZyDigJx4ZW5iaXRzLnhlbi5vcmfigJ0sIGFsc28sIGFsbCBvdXIgcHJldmlvdXMN
Cj4+IHJlbGVhc2VzIHNlZW0gdG8gdXNlICJ4ZW5iaXRzLnhlbi5vcmciLg0KPj4gDQo+PiBDb3Vs
ZCBhbnlvbmUgaW4gdGhpcyBjb21tdW5pdHkgbG9uZyBlbm91Z2ggcHJvdmlkZSBhIGJpdCBtb3Jl
IGRldGFpbHMvY2xhcmlmaWNhdGlvbnMgb24gdGhpcz8NCj4gDQo+IFdlbGwsICJ4ZW5wcm9qZWN0
IiBhcHBlYXJlZCBsYXRlciBhcyBhIG5hbWUsIHdpdGggdGhlIGludGVudGlvbiBvZg0KPiBiZWNv
bWluZyB0aGUgImNhbm9uaWNhbCIgb25lLiBTdGlsbCBpdCB3YXMgbGlrZWx5IGVhc2llc3QgYXQg
dGhlIHRpbWUNCj4gdG8gc2ltcGx5IGFkZCByZXNwZWN0aXZlIHJlZGlyZWN0cyBpbiB0aGUgd2Vi
IHNlcnZlcihzKS4NCg0KSSB0YWtlIGFib3ZlIGNvbW1lbnQgYXMgeW91IGFsc28gcHJlZmVyIHRo
ZSDigJx4ZW5iaXRzLnhlbnByb2plY3Qub3Jn4oCdPyBDb3VsZCB5b3UgcGxlYXNlIGtpbmRseQ0K
Y29uZmlybSB0aGF0PyBJZiB0aGF0IGlzIHRoZSBjYXNlLCBJIHdpbGwgc2VuZCBhIHYzIHdpdGgg
dGhlIGxpbmsgY2hhbmdlZCwgYXMgMiBjb21taXR0ZXJzIG5vdyBib3RoDQpwcmVmZXIgdGhlIOKA
nHhlbnByb2plY3TigJ0gb25lIGFuZCBJIHdvbuKAmXQgYXJndWUgZm9yIHRoYXQuDQoNCktpbmQg
cmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0KDQo=

