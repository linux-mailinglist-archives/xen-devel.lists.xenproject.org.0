Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399B5BD973
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 03:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409100.651998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaSDe-0006pO-TL; Tue, 20 Sep 2022 01:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409100.651998; Tue, 20 Sep 2022 01:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaSDe-0006m1-N4; Tue, 20 Sep 2022 01:38:38 +0000
Received: by outflank-mailman (input) for mailman id 409100;
 Tue, 20 Sep 2022 01:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uL4T=ZX=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oaSDc-0006lv-96
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 01:38:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20058.outbound.protection.outlook.com [40.107.2.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f020267c-3884-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 03:38:34 +0200 (CEST)
Received: from AS9PR06CA0071.eurprd06.prod.outlook.com (2603:10a6:20b:464::22)
 by DB9PR08MB7423.eurprd08.prod.outlook.com (2603:10a6:10:370::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 01:38:30 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::20) by AS9PR06CA0071.outlook.office365.com
 (2603:10a6:20b:464::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 01:38:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 01:38:29 +0000
Received: ("Tessian outbound 9236804a5e9b:v124");
 Tue, 20 Sep 2022 01:38:29 +0000
Received: from b8628569d284.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 461416BB-9A5B-480D-A5F2-3A7366F712A7.1; 
 Tue, 20 Sep 2022 01:38:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8628569d284.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 01:38:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5692.eurprd08.prod.outlook.com (2603:10a6:102:8a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 01:38:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 01:38:22 +0000
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
X-Inumbo-ID: f020267c-3884-11ed-bad8-01ff208a15ba
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cwT/NL6/+mGkLABhcQHCs0Z4wnTnwr0xjHliOmH+i+zFDy0eA8HGvSF4tr4RDndlbD7alPuViWSi9DXFzUSvMbZF2aodTSBoAIyf51nl6/qaEuHhmFleZR38Uj49fwVFAaqBsa8xs2HcopnqK99/pw4hTcddd5UTUSXpVYj50t4uT2N8M1wb04ZdvTLBmeLKtOtKz9GatfxYEl5F4A68L1fiyKPvl8Dgnw673jK7xnbuekMM32yTnVNnGHRgEYBq0h4woKLHUQd8ptjxFIBxOinwsR4+6Ul1dri1kWr8zNbwIOFr8n1pr2iVxbUcAbZ5APNBh1NKvI9eVYHEE2mAow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1uP1fjcRXa+FFxfK+iSFV340Ed5Qip3Kuo10Mx4Qg8=;
 b=h4Vn2QgdXgpnVpQHfloY470u/P5o6I+vV9A5IfkReVTEUrfcKfYNInzJoHJDJePu7Ce7VjEYs4Es8FqYPQ5ipHEg66i2CiUd93cWuFU6WK0z3TKZqKwpEhD3eaGwejfJmAaxlqK1gLzd5Nylv0DL48BRM42G9z1ODAmZVYOrkUoDvEdsDCsh/XxcuYwgMczkKduOGd8iNQkUpvJQsNVABSYiT1MS7F6U+MhvJ9fb6iU5Omr4Adgg+XmQrb+aVv2ZCoXB92CBFXmh3uoADlzIiAYo45CQVgGbFF4DgHZgOJpufc/CHHgSu7i+h43hmEC/2+DUkvPj2+MCLKsdUtgyYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1uP1fjcRXa+FFxfK+iSFV340Ed5Qip3Kuo10Mx4Qg8=;
 b=or07ohQyoTmkYWUoPKkV7vzduSeo2smXyv6AW+7gaXe5s4NmwK+Vf6MNN7qAiS7WUPCq215vriRQ2+kdT+fOIZk38P/dqVQjp/CHXsZaao882LnurDr268jVC8KuvgXcm6mIzBqXxZaAObp1mYAFmbJFe44nPbRT+m4YdDGqu+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLTdeFapy6i/7JP9PbX6oEahAa0sP67Nn0JLUaO8eKZP2W1Y9XT+vtaOEJrlLaMWnhODmra8LLU1HCjommttqI/hYn/1TxIyfJSTUc+1+W3mpg00ihvJhdMjFxRhGs3dhEL5/iZGs/6jSPN4RIM9ptHU4lWbBIA7PfIsRjxS5PJNYADRr/akUO5JUIkwCo4sLFQGMcdUxJBxdRBbP4D3RKs9166xxr1p/ms7PqqSC4PI8Q9xWdIbSZ+vbTkRcAaj9gmegFuzog1VxpNbicDMfwPy9hilmsxwyc4WXlYLSa3ruoi1P0i50UFA1g66LIiNcWUYZBtR9tHWQowsHDCQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1uP1fjcRXa+FFxfK+iSFV340Ed5Qip3Kuo10Mx4Qg8=;
 b=mV0k+LL7oAoxYrbLt7DlYRBa7moMizVN+a5pJ4r9tTTeWXqt+/4Tpxt9EUBSUYpDvP6AgZ2sEBjgMOR2O/QGA1olE1qcljd9b+wOLzEIHPzbNkBW+pf3DpQ6rukOvDgSbsklwDR7vBp9BUGxEQ+eSMmr/jjCjWzuylFmpMsd3LSS7EQURnco+9sftmwjgQNF0uWlv+BobBjViVa6GKPQy/GudI7TaYA4WfeBieYe0Zw12HqRkg+y65FpfoLF5Oq2f6GaogCUbP0yIVdPDWuY+//sSokZkWrn53WuVAebkBGe9L/rFWbonCUiFhIn4XlBs+WKFP8Ep1RL41kMIoYvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1uP1fjcRXa+FFxfK+iSFV340Ed5Qip3Kuo10Mx4Qg8=;
 b=or07ohQyoTmkYWUoPKkV7vzduSeo2smXyv6AW+7gaXe5s4NmwK+Vf6MNN7qAiS7WUPCq215vriRQ2+kdT+fOIZk38P/dqVQjp/CHXsZaao882LnurDr268jVC8KuvgXcm6mIzBqXxZaAObp1mYAFmbJFe44nPbRT+m4YdDGqu+I=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>, Connor Davis
	<connojdavis@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 00/11] Add Xue - console over USB 3 Debug Capability
Thread-Topic: [PATCH v7 00/11] Add Xue - console over USB 3 Debug Capability
Thread-Index: AQHYykB84mg4uPAeVUC/H1cP2JLxkK3mxGyAgADG5TA=
Date: Tue, 20 Sep 2022 01:38:22 +0000
Message-ID:
 <AS8PR08MB7991DF9AE39D98916611BBF5924C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
 <6211a296-c4ba-5783-f6b4-8dbed8261a2a@suse.com>
In-Reply-To: <6211a296-c4ba-5783-f6b4-8dbed8261a2a@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 81F389C7AA8DAC4B93EE9FFA1941A781.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5692:EE_|VE1EUR03FT011:EE_|DB9PR08MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: bdad8e39-e6ea-408c-08f0-08da9aa8d253
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GuA6N/l+RmjfHeisFXZ0IqQRCe0iGjHJK/ZeEaqOtAyzQ3cLO0gZg2PQHeHXt0V+3jWH7Hit9jcKAmDYsw7VyBpIZugeL7aMnDBgFL+l2ocO0tkRZnl6l3XQ2Z5RaY/gc7NhGrxauDgiQfh41+FNsSck8OMsxe2qljvhHKkn/Pby/aWyHACt2kojeUuoKvo0WFg3NWepcJ0cvyyuomsNerQTMLS1MXVhnB+bprr2FSX/wHWkUWZUxGTUSuJ3I/CWX1ccvTiLSzkoQM6hqOfuQoL22Gj/VZJNk2OasAHyb6DrP8Ror9CbcWTivVoSwJf87tITwT4npGDqZFkOccnoXX3wRSN3ESlQzo3QOEs1FBheSNJ2RmH+MB4YPhNeXN0ceobOweiOthcjI81Rcea0PAjnb/vhbauilj7rSat6ZDnwdrMvuegLahysiqoNfJ4r0gjJ1dVptDIBoDmH5P3MAjMrMDiA5tAXozDS+G4NO+99Qa1y5ESzGicK05PEGDzWFWu0g1VyhtgPX+eUTuXJQPQGxop2QN9XFlcS3nsjA0RI0m4gqBq8wp2K621idJtSdHFn3mKIWnXuxSV19yjbh4xSs0y8r5hS7zDPEPVho/Q20c6PxBRcNcnBtR1vuFy8NdHJyaeze7iwzSajxD7AV0KyjJEckvSiyxysMHjxw6GxmJlypD4bRdGlnQZID9W/57hztHBo4pp/GCrkhouSQKC2Gdex1NHGTUew70PA3ikTo1BjKPGMZg7Ei+QJYPEXJgfdrTiChxIGCcbFPtFJJw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(9686003)(38100700002)(26005)(122000001)(55016003)(64756008)(6506007)(8676002)(33656002)(76116006)(4326008)(2906002)(54906003)(41300700001)(38070700005)(7696005)(186003)(71200400001)(5660300002)(7416002)(478600001)(86362001)(8936002)(110136005)(316002)(66446008)(66556008)(66946007)(66476007)(83380400001)(66574015)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5692
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e33a9f31-f384-453b-4e8c-08da9aa8cda0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R2ET5PKeZkntyqm84g+s2CthHmv1mTD5FbPwTrYkqREkeR2LnbPZ+TAcoEdLgc6lxiaMR8AsKIe+lf79w1bx6qi8VLU8u2YVMWZYauTno8953L0Bjl1up9z+A2Hx//xOMH6j/FVIQ0qCskAWRwWwE2JzcWrBNPJCGKI/tvFTX/NmNMlSTUA8/PdeSYXsgobzWem67ByMYtvPbQ5fZ7WlXk+W7CSymf16pdqO14i/TTXMyyN/1fMyfV1lmRnfj+4J0v3KbjbHIcBWUVGC/KYck/xkEMQI+AsPrSwxD/WMkRo8HnJG4n1HKt2HJdkneOx+sq0joi9JemX3NLT8SPDFwLIMp2lltMgbsjTlQYjlu1/woLWRLCHQhw/rVYR9I6PzfNz7+BLm9pKN1u+IujPR2h2AXGh74gYCvISeJjkAB48mtZSO3g3yuHfLqaSGdFzDmtIO4PB49ruMeN3lL8XCo2168gNf4/uClYLArszjrlE9m/RJZPMAKWXfehSWlo7RaSbGMZNnUsGLSfPGXya2Cg7xcp335a41yngszIGjVOYdH/yxsjZJSluc77WmKovt6KF4zticjl4Djc0dBbzX6SBSWnlZHm7sTjxpJzejaHhkVnTdQdnFyyYMIRc31ZtxwLwBQ1txx4n+1uAwyCQBR/kmlhkWF1+H0GkNi3K5Uf8LxPbItARARlRl1yvhrlusnubdACu+6q3PSus0/h0vdOsb+peEUzvlcQDvvLjxSwPLWmJbzPeBQHx55iCMeCNFjfBdIYNjFvyoWY/xbzFCzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(9686003)(26005)(81166007)(82740400003)(70586007)(40480700001)(55016003)(6506007)(36860700001)(8676002)(33656002)(4326008)(2906002)(54906003)(356005)(41300700001)(7696005)(186003)(47076005)(70206006)(5660300002)(478600001)(86362001)(8936002)(110136005)(316002)(83380400001)(66574015)(40460700003)(52536014)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 01:38:29.9088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdad8e39-e6ea-408c-08f0-08da9aa8d253
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7423

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
KDExKToNCj4gPiAgIGRyaXZlcnMvY2hhcjogYWxsb3cgdXNpbmcgYm90aCBkYmdwPXhoY2kgYW5k
IGRiZ3A9ZWhjaQ0KPiA+ICAgSU9NTVU6IGFkZCBjb21tb24gQVBJIGZvciBkZXZpY2UgcmVzZXJ2
ZWQgbWVtb3J5DQo+ID4gICBJT01NVS9BTUQ6IHdpcmUgY29tbW9uIGRldmljZSByZXNlcnZlZCBt
ZW1vcnkgQVBJDQo+ID4gICBkcml2ZXJzL2NoYXI6IG1hcmsgRE1BIGJ1ZmZlcnMgYXMgcmVzZXJ2
ZWQgZm9yIHRoZSBYSENJDQo+ID4gICBkcml2ZXJzL2NoYXI6IGFkZCBSWCBzdXBwb3J0IHRvIHRo
ZSBYSENJIGRyaXZlcg0KPiA+ICAgZHJpdmVycy9jaGFyOiBmaXggaGFuZGxpbmcgY2FibGUgcmUt
cGx1ZyBpbiBYSENJIGNvbnNvbGUgZHJpdmVyDQo+ID4gICBkcml2ZXJzL2NoYXI6IGFsbG93IGRy
aXZpbmcgdGhlIHJlc3Qgb2YgWEhDSSBieSBhIGRvbWFpbiB3aGlsZSBYZW4gdXNlcw0KPiBEYkMN
Cj4gPiAgIElPTU1VL1ZULWQ6IHdpcmUgY29tbW9uIGRldmljZSByZXNlcnZlZCBtZW1vcnkgQVBJ
DQo+ID4gICBjb25zb2xlOiBzdXBwb3J0IG11bHRpcGxlIHNlcmlhbCBjb25zb2xlIHNpbXVsdGFu
ZW91c2x5DQo+ID4gICBkcml2ZXJzL2NoYXI6IHN1c3BlbmQgaGFuZGxpbmcgaW4gWEhDSSBjb25z
b2xlIGRyaXZlcg0KPiA+ICAgZHJpdmVycy9jaGFyOiBhZGQgY29uc29sZT1laGNpIGFzIGFuIGFs
aWFzIGZvciBjb25zb2xlPWRiZ3ANCj4gDQo+IEhlbnJ5LA0KPiANCj4gdGhpcyBzZXJpZXMgaXMg
a2luZCBvZiBvbiB0aGUgZWRnZSBiZXR3ZWVuIGEgZmVhdHVyZSBzdWJtaXNzaW9uIGFuZA0KPiBj
b3JyZWN0aW9ucyB0byBleGlzdGluZyBjb2RlLCBhcyB0aGUgYmFzZSBwYXRjaCBpbnRyb2R1Y2lu
ZyB0aGUgbmV3DQo+IGRyaXZlciB3YXMgbWVyZ2VkIG9ubHkgcmVjZW50bHksIGFuZCBhdCBsZWFz
dCBzb21lIG9mIHRoZSB0aGluZ3MgaGVyZQ0KPiBhcmVuJ3QgY2xlYXJseSAiYnVnIiBmaXhlcy4g
QWRkaXRpb25hbGx5IGl0J3Mgb24gdGhlIHNpZGUgb2YgbGFyZ2VyDQo+IG9uZXMgY29uc2lkZXJp
bmcgdGhlIHBvaW50IGluIHRpbWUuDQo+IA0KPiBUbyBzdW1tYXJpemUgc3RhdGU6IFBhdGNoZXMg
Mi03IGFyZSByZWFkeSB0byBiZSBjb21taXR0ZWQsIGFuZCBNYXJlaw0KPiB0ZWxscyBtZSB0aGF0
IHRoZXkncmUgaW5kZXBlbmRlbnQgb2YgcGF0Y2ggMSAoZXhjZXB0IGZvciBhIGNvbnRleHQNCj4g
Y29uZmxpY3QpLiBQYXRjaCAxMSBwcm9iYWJseSBhbHNvIGZhbGxzIGluIHRoaXMgY2F0ZWdvcnku
IFBhdGNoIDEwLA0KPiBvdG9oLCBpcyBwcmV0dHkgbGlrZWx5IHRvIGJlIHZpZXdlZCBhcyBhIG5l
dyBmZWF0dXJlLCBhbmQgaGVuY2UNCj4gbGlrZWx5IHdhbnRzIHBvc3Rwb25pbmcuIEluIGFueSBl
dmVudCAtIGlmIEkgd2FzIHRvIGNvbW1pdCBhbnkgb2YNCj4gdGhlc2UsIHRoaXMgY291bGRuJ3Qg
aGFwcGVuIGVhcmxpZXIgdGhhbiBuZXh0IE1vbmRheSwgYXMgdGhlIGxhcHRvcA0KPiBJJ20gY3Vy
cmVudGx5IHdvcmtpbmcgd2l0aCBpcyBub3QgKHlldCkgc2V0IHVwIHRvIGRvIGNvbW1pdHMgZnJv
bS4NCj4gDQo+IERvIHlvdSBoYXZlIGFueSBwYXJ0aWN1bGFyIG9waW5pb24gb24gdGhlIGRpc3Bv
c2l0aW9uIG9mIHRoaXMgc2VyaWVzPw0KDQpUaGFuayB5b3UgZm9yIHRoZSBpbmZvcm1hdGlvbiBh
bmQgdGhlIGRldGFpbGVkIHN1bW1hcnkhDQoNCkZyb20gdGhlIGNvdmVyIGxldHRlciBhbmQgdGhl
IHJpc2sgYW5hbHlzaXMgZnJvbSBNYXJlaywgSSBhbSBvayB0bw0KY29tbWl0IHBhdGNoICMyLSM3
IGFuZCBwYXRjaCMxMSwgYXMgbG9uZyBhcyB0aGV5IGFyZSBpbmRlcGVuZGVudA0KcGF0Y2hlcyBh
bmQgd2lsbCBub3QgYnJlYWsgY3VycmVudCBkcml2ZXIuIFRoYW5rIHlvdSBmb3IgdGFraW5nIGNh
cmUNCm9mIHRoZSBjb21taXR0aW5nIDopKQ0KDQpTaW5jZSBmcm9tIHRoZSBkaXNjdXNzaW9uIGVh
cmxpZXIsIHRoZSByZWxlYXNlLWFjayB0YWcgaXMgYSBsaXR0bGUgYml0IHRvbw0KZWFybHkgaW4g
dGhpcyBzdGFnZSwgaXQgaXMgdXAgdG8geW91IHRvIGFkZCB0aGUgcmVsZWFzZS1hY2sgdGFnIHdo
ZW4geW91DQpkbyB0aGUgY29tbWl0dGluZy4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAN
Cj4gVGhhbmtzLCBKYW4NCg==

