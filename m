Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B6A325F0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 13:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886427.1296078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBzs-00025M-3z; Wed, 12 Feb 2025 12:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886427.1296078; Wed, 12 Feb 2025 12:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBzs-00022q-0g; Wed, 12 Feb 2025 12:37:44 +0000
Received: by outflank-mailman (input) for mailman id 886427;
 Wed, 12 Feb 2025 12:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F151=VD=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tiBzq-00022k-H4
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 12:37:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2613::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25a19f7b-e93e-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 13:37:40 +0100 (CET)
Received: from DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) by VI0PR08MB10744.eurprd08.prod.outlook.com
 (2603:10a6:800:20b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 12:37:31 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::e2) by DUZPR01CA0295.outlook.office365.com
 (2603:10a6:10:4b7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Wed,
 12 Feb 2025 12:37:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 12:37:30 +0000
Received: ("Tessian outbound 31e949b9df6b:v567");
 Wed, 12 Feb 2025 12:37:30 +0000
Received: from Lcc604ee986af.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0B96551-FF83-4860-9E76-3C7B4D58A2DF.1; 
 Wed, 12 Feb 2025 12:37:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcc604ee986af.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Feb 2025 12:37:24 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by VI1PR08MB9984.eurprd08.prod.outlook.com (2603:10a6:800:1c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Wed, 12 Feb
 2025 12:37:17 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 12:37:17 +0000
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
X-Inumbo-ID: 25a19f7b-e93e-11ef-b3ef-695165c68f79
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YdldqVPAkBLAilQTLq9AXAi9fuiHbc7Lgj48vP/KCvKDvygFsa5W3jU/eIkACcwOo3Jgje9eqjg2EO6QtKFTBXPux5D3LEs2nKq8KXiDOmaw3IhfPTHi8mnzGd6bghQcdcjhxl04z90BXc4k+Fq2NCBNVphTjXtXPUjfm32ytRr5lRwi4BQWk+O67ec4VDPYTrtjbMoe9PHccMyRfnBBpGtQ3OkhINotVDb4EchU0QDDMaOfBV6Bw8bWX+6McjrtiMMhVshWivmKvZ3krOtGo12siIU/xzoQmclHpJAsBe+R5lVl5+EhCN5w+1Mom+0encIKfWp+RcUc/7eQAZb2fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/0KKGv2BAtQLDfbhlAEoRo0FpWKuZrZiCwuvKWFzXs=;
 b=lI9zigXybsrflXIZbOf5isr8ngAnvCT27GcJQHk55/S+jQo2lrVZHaHLhBq7n5D5Wv00gUIAL7GUuzPPtvQIIzUwMZcaZHY9mOzJ6ijmeLPFmLAsh6lnnCjCLIcvKdz4d/TwM6bKHULSCHGfV25OFL1rXqEqGn2gGwJG8wWUjMxf6/7kwlY36nht1d5d9jueeN0HRhUwULCR8uA94hgx9h78nfIiTIAqgWpA+iHtPHCfvfmDntdMC720tlFmr3OjG2V+hBDllF7E3dxe1JnRC9/M5VxIku2NCKNuvl8rxnBAz6G+6UXp/YvzYIxibp3A9YZIN1HL+OfvSt7u98Sbmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/0KKGv2BAtQLDfbhlAEoRo0FpWKuZrZiCwuvKWFzXs=;
 b=MRI1uSPcExaXCcDhquE7AkLCkH8O3yhUPVJ1h3Ps6L6npz2Rd8pqLzKdY9d+tmAS9RbP1D7QLYUGk0gzbcMHlRh6EtK3j62WUNuzfJyOJz3i2Qp1vvNm9qOK0kVeP0yBxkO6/QCNti7qIVJPOr1Xm/UFvDbmtEAUmu3O0RrzcMI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bc051f39502908a
X-TessianGatewayMetadata: cKafklwIwHkqmLWPMlO8K6qlRrw/F+MVK0L7FJPkTBm5j6HqRl1AdcS9WYoeVd30Evzm7mCYHgdA/J0LbqjJ6pKI9bUe9GZppZ5iGZk+ia64vcDLcCN1sQnHJzd4UC3+C7ePn1OCMY/dxxyhAfLlJLBxxhkimXZD9Y4Kxu3fci4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx0B/kdzIrE2W6oZOt5lFGm9byPCRpR5xP6PmTd5k6ffBOhhH1dr0Iy2hUcQaaBhCD2qfSwV9JvwPZD+8fFMML7kF3i3649U2Pnf0mfIGJUyVCb/jekYZySogVv9QHP739v1rxeatGZHbXFHoxmlWlFsc7OwpHkqdPPG8CyXhJ43IU/133tcLkjdvS9eUklWIy55JZMOKjEK9w8Zcb2DCevGhxI50LegGwHEPXVy0Mdw/EKBthuc/KOlRNcN1LcjUNj9QnDbwuLGOVbcvsSfFZ70aN3un6kP7k0tbG7R5nwQqm4VSCE1GuxUWQCTgsMhseqLuuCrvqVtCmUji0R+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/0KKGv2BAtQLDfbhlAEoRo0FpWKuZrZiCwuvKWFzXs=;
 b=owc0dWhfdptXTr9OIrWRNtK6sKM50nKKJj5d/Viiel3mpoQYTPTcgur1r+mVhdb//aSjAv7XVLhDpXOM4iwG/5+3mHUdDi8vrKOhHmk3TEv7xaJ959PxkD+e1l9qisAQndnROF5Wk638yriyf9nQZNLVg/5+PjqfKEdptcxSfHyfa9Gz9GBRRvM8d3xj512RYAZr/+ToRrHY1t2ssu8fJogwB3YFPuN2fZOHwsqt8fZoou6eTWTkrZKl53IX4rSSOOjZ+e969q5B84gb+ngIyZd8nc2kjJx8sLtIhgemp5y+kLY9DZzDQ3z+AWMk/F/SKOb4tYMejQvmBzPd5r4zmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/0KKGv2BAtQLDfbhlAEoRo0FpWKuZrZiCwuvKWFzXs=;
 b=MRI1uSPcExaXCcDhquE7AkLCkH8O3yhUPVJ1h3Ps6L6npz2Rd8pqLzKdY9d+tmAS9RbP1D7QLYUGk0gzbcMHlRh6EtK3j62WUNuzfJyOJz3i2Qp1vvNm9qOK0kVeP0yBxkO6/QCNti7qIVJPOr1Xm/UFvDbmtEAUmu3O0RrzcMI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbfS852PGMwQJcDk23CJnJhhVOo7NDjlKAgAAM3QA=
Date: Wed, 12 Feb 2025 12:37:16 +0000
Message-ID: <65418796-047E-4E8F-B674-CD0C61CD475C@arm.com>
References: <20250212091900.1515563-1-luca.fancellu@arm.com>
 <20250212091900.1515563-2-luca.fancellu@arm.com>
 <c97cb922-733c-4afb-ac0f-6223ace5b956@citrix.com>
In-Reply-To: <c97cb922-733c-4afb-ac0f-6223ace5b956@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|VI1PR08MB9984:EE_|DB1PEPF000509FB:EE_|VI0PR08MB10744:EE_
X-MS-Office365-Filtering-Correlation-Id: 34971d51-b5e1-4dfd-cc1e-08dd4b62046b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ajIxMWc1dzNBSkVZWjdmS3JJdDJGME02WXVWSEdhUEM0cFVZcld1eGhndnBa?=
 =?utf-8?B?Zno4QkRLYkMveSt3UHYxUVdkWjVBdWEvNWt0d2xHM1dMbDZuVEJFaEdmM1pU?=
 =?utf-8?B?b2Q5RmZQZ0Fzb1liTWtyT1hmdExOQkpQekdPd0lHSTdLL1BCV1Z4c3dkNTh2?=
 =?utf-8?B?d0libk1XNHJickVpc2hIZWJmRUxKUENFOER0Ym5EZitKRXRNc2VLRlUzYWJv?=
 =?utf-8?B?YmpkQ2s1L25JZ2V4Smg1TzJxSG94VVhNL3NTamk0UHAxbWlOL2lDOEY1dXp2?=
 =?utf-8?B?Uk5USGxYaHBIN2hFWmlFNy9lcmFRRUhBUVNEVkVCcGNIUy9zcXFpV2hZclhy?=
 =?utf-8?B?THZQbHo1MVI0Um13aE1RR0xIcm04d1pkaEpnOTRDN2wxTVlWdFFWV1FMS2xD?=
 =?utf-8?B?b01yd3ZBQTI0V0pka2QrQW5kenZ4akE0ZTJCaGNGQXVWa3o1QjczbWJKVTlB?=
 =?utf-8?B?QWpycmlLMmRTdUZlK3BLYTRpWVU5NEhlSnhmeWJncUlKbW4yTmtPcU51R2ZK?=
 =?utf-8?B?OU1zYVA5dUhXeGxZM3k1WDFQam5LaFAwT3JJVEE3b3V0QmZXQWtsL2NmNW1C?=
 =?utf-8?B?cU1idG5tcklXZ0hZZCt0YjJSai9pR1hUdXdxcS9MY0JGdUYvWVAxUjZtcWtT?=
 =?utf-8?B?Vjh0ZW9zR1BzY1BPZkI2bzVJa1VuOUc5VU15YTNDUnJzanJ1YzVTdzFFdU03?=
 =?utf-8?B?eVROV0xzejJLMGxDd3lnSk12VDVEeEcrWWUvT3hzL1htaktLUUhyQnJNZVhj?=
 =?utf-8?B?akdpSWNEcVBNclduOVZpS01HSFVJWG1SRWpKeEsvSjcrNjNYNHpJekoyeTdH?=
 =?utf-8?B?VHBpRGNtVVhHUGlNdlBYaGYrQml4NVp6Q3dxek85eHNwQTZ4Tm9kWmU1T3Zw?=
 =?utf-8?B?Kys3SmNIYXNINDRjcW14TnZGVjE4NW1uVnBBa3hLdGNZT0MxOCtIRWlyVVoy?=
 =?utf-8?B?UXZVWXNBaVJCNURmcHoxcEIvK3Nldy9IV0J2Q3FyYnJBb285OW1yRzZSaHNQ?=
 =?utf-8?B?b29uVDNQa2g5NjFpWXFNZ3ZzR213Q2d3aXZQWGFJRk5Qc29GZVdRUTlaVEgz?=
 =?utf-8?B?V0l2SWFHUjRtY1VIQ2pBY0N2UDU2b2cvZmFHOUVPWHFyTC95REtpLzMrVDk4?=
 =?utf-8?B?d3JCc2Q2emtpbU9PV3V5R3ROMUU3ckQ2dmo4ZGZBRCtxMFJsZTlYVExTa0xI?=
 =?utf-8?B?Y3ZsWHBNc3QrcEVtM3V5TTJvb2xwaVdMVk5JS1BiQTRJMlVxRHE1ZFozTjlM?=
 =?utf-8?B?bUkxejM5cjF5L1paVm5jSVlMVUc4OFozNDFpNzFwbXUxUlorYmYvN1ZzZy90?=
 =?utf-8?B?dlNjdjR6S1dUaEQzZ1QxTzdEMk1xWGg2WmE1bEFXc3RJS3cvSWZFcEcrNXky?=
 =?utf-8?B?dW9QMjZuNlg4NDZhT0M2dGNGakE4SnFKT29qN3FyRExJZCtDVVJXUC9NT2F1?=
 =?utf-8?B?QU9YUXl3ZVBBVmg1bXczSWcvUGkvRC9jN1ZtMEZBSlNGa0ZxOXZsQzd4TkFV?=
 =?utf-8?B?Skt2emhrZDAvblg3TDhjRE5yQnVLZzZjNjZQYUh1b3N5ckpsaDhCWDc2ZjB5?=
 =?utf-8?B?Njdac2ZLc2xPekNMUHFBcVhFbTVEN0ZIVlI1Q1p2YWt6THUwMWJnaTc1MkRm?=
 =?utf-8?B?QjduZEhhc2tJMHI4UGlMNjJxTmlCMld4SzRCeGwwb3BEK2t1QStzL3I3THBv?=
 =?utf-8?B?VTAxVmJkSzhTd3FFMm1BWUpIYjhxZy94NHN4TlRvbHZ1UGp4S3hsa3dSYzFT?=
 =?utf-8?B?N2hoVVBZVUxvem5Ebm1ORy9ONXlKdkYzTktMY0NBM0NPUW8yS2pLTTBmbERC?=
 =?utf-8?B?S2J3a1M4VThGK3pPZVFJZG9lelZIdTVXTnc4K3FGeUVmSGRRMlZZUWZZRGVi?=
 =?utf-8?B?elVIMzY2VU1wdHdZOWl0eUR4WjVpSE0ydklnKzFnU2xhSE9VSzhNb0xLNnAz?=
 =?utf-8?Q?JGxTiHz1VtQAposFKUNYgzCGKM8vzjtK?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD9C8616E85CC6499C72C5EB4E907B53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9984
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e9301e4-4233-4385-a77d-08dd4b61fc38
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T28zZUdOSEpvdDBYRFJFMi9oYlYyZUhxK05nOVkrOC9sTGlBWHAvQnhRMTBs?=
 =?utf-8?B?eXJ5UnRkZlpSa295NW1hNC84U2ZGeHhNVkM5RFRiaUJ4aDJVNE8zclAxb3pv?=
 =?utf-8?B?MmtkQWN4Si8rTktCWlNQOVpUdklHU3dVUFlqVEg1dkZTTzRyOVBBTDNKWE9v?=
 =?utf-8?B?NElFMmQ5cjVCa3NKc3J6ZTF2U3NMTVNvZTFZVU82S2FGM0xDcVAzTkd5K0x4?=
 =?utf-8?B?WnFObXlpOEF3a2hvT0Y4QXNDYjh3SE1jQ2RrTHJqc0RuaGpzRUY2djBaYlk5?=
 =?utf-8?B?ZGFFVXFPSGs0amcvajBpa3lhMlRtMUFjSW5yK25hVVdPY2gxYjBvL2FSTkpp?=
 =?utf-8?B?MEQreDRWT3dpZlliMHFKeFY1bmpBRFZzOWdQeTBLTjY3WkJTbEJuM25jY0Ir?=
 =?utf-8?B?bEw1N2wvWGJXSW5sMC9tQUE4VmhKS2lyLzFZYkQ1ZUZrVURWY2hxN0Y4b2pX?=
 =?utf-8?B?UDVCcURpck0rMW1QNzY0dUlXSEdaQ1ZZWkdHcHE1WFRMNWxjNExyT2RRWjFG?=
 =?utf-8?B?eEQrYVV2WTUvUVYyd0xjaFJ0STltNnhSWFBnSGJkR3dwNTBqSkZUR2M3WHVT?=
 =?utf-8?B?OTlLcitqZUdSdSswczFQbjdldUVydkQ2cnVpN2QxWXBEM0lXeVlDakdncXY1?=
 =?utf-8?B?SGFSVDhQRmtYSlBkcVB5S29qSTA5OFErTFlWcjdReEFCZkdSeW5zY01JMElG?=
 =?utf-8?B?M2RQZWdlZHlYQmRzWmpIRVBtY3JLU0RwVllGbHVrYTBKdzI5WEptRHQwdTVX?=
 =?utf-8?B?L3dWL2dkQ3RqRWprR0VTMnNsSEFWb2ppa0haTnlZUlpIUEZoRXVwVjR6b3hn?=
 =?utf-8?B?NjZHcG9ieUpQUkhMWE5hN1hLbGlNRUlabWFUVDVqRDRzTElGTEtFV0RkRXBN?=
 =?utf-8?B?am45ekNlWHRMeWlPTEx5cmVkcy8xVGw0ZU9xM05ueUgwb05aSTZudzNYOFl5?=
 =?utf-8?B?OVhxTEVVYVcrdDJva3lpN0diLzlVZTdvWnRXREFIV25LYUJxMU5ySHY2WnJa?=
 =?utf-8?B?VW1MVXI4MlRFT01RUkszdlhvOUFIaW9od2QzMG5TU1ZSQnVndkRBQUhqUGpI?=
 =?utf-8?B?TEp4dkgyMVhLSWhDaGlXd09lL1Y2M3NXejRhdE9lTzZYbTViTVJBdVMxTnls?=
 =?utf-8?B?K1FBMk9HOFc1aUZCaDFheFZJSFlKcVgxYjg1Qnc4by90NUZNOXJIR05DNHZI?=
 =?utf-8?B?cXNnQ2lISlVmNUtaQ085SDJwZEx5VVFEek56RzBaU0xEK1dGUW9RNlRuRnZn?=
 =?utf-8?B?TEcxV2hvZjRzSG1wblZuVVRnRW1Ha0NZamJIRTlSUnJnVFdrN3RCdFdtWFdo?=
 =?utf-8?B?UHZJdDJkMThmK1lyU1dJbkVZcU1NdGxpRFIzZnhiZENiaWZXTllCMlZNS1pI?=
 =?utf-8?B?UlFLTkpQVSs5TTlCMVZ1aVlGMTNsaWM2alQrUGtZYjFRUzNkOGhiRTB6dTkw?=
 =?utf-8?B?blpST0RFNjBPRXJTdnN6Rjl1ZTZlcjQxVThlVFc1VzBKWmszWXZQMmRiMlcy?=
 =?utf-8?B?VnFManhEN29zbXdKYm1QdDBFSFpXT0ExejY1ckphbDIvU1BKTVdpWjNXOW9C?=
 =?utf-8?B?YUFCMEJkR0FmODhEZlNsU1ZrU1Jxc1YyS2lmWTVmSjI2OHk3eU9XczlmRUtE?=
 =?utf-8?B?YktWVkNCUkJ6cFhiRDZoNFJVN2ZrelZSUzdQaXhEVjBJL2ZRR1k3NTFDNGlW?=
 =?utf-8?B?QzUrMUxrMFRtbEpnZjdEampwSHB2OEo3eUJuT1dSVFd6Q0EybTdpUDYzZk9u?=
 =?utf-8?B?akVhVXYvZXpTODNZYlRmZ0R0RUthNEZ0MldFNmZIazZXdDM2MFpKNUV5Q21X?=
 =?utf-8?B?QlBzcko0V0o5MlZkU1NsN2pUM2ZnWDAzTGU1Z09qdnJ6K1E0UUVsdWpoS1FX?=
 =?utf-8?B?bTd0N1ozcERTT1g1SmM5L3QvR3J3SUJDRWVBYVhPYzVrZlVpMGFBekJwYkdI?=
 =?utf-8?B?WTBmTzFPZDI5VTBKa3NXQVdpQ1djSWRDMDNJbERxMk5McFRTZGxjaGJxaE9T?=
 =?utf-8?Q?yW4J8xUwZ/q9taeOpOsj6R/R+fP3+I=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 12:37:30.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34971d51-b5e1-4dfd-cc1e-08dd4b62046b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10744

SGkgQW5kcmV3LA0KDQp0aGFua3MgZm9yIHlvdXIgcmV2aWV3LA0KDQo+IE9uIDEyIEZlYiAyMDI1
LCBhdCAxMTo1MCwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+IA0KPiBPbiAxMi8wMi8yMDI1IDk6MTggYW0sIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+
PiBXaGVuIFhlbiBpcyBidWlsdCB3aXRob3V0IEhBU19QQVNTVEhST1VHSCwgdGhlcmUgYXJlIHNv
bWUgcGFydHMNCj4+IGluIGFybSBhbmQgeDg2IHdoZXJlIGlvbW11XyogZnVuY3Rpb25zIGFyZSBj
YWxsZWQgaW4gdGhlIGNvZGViYXNlLA0KPj4gYnV0IHRoZWlyIGltcGxlbWVudGF0aW9uIGlzIHVu
ZGVyIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoIHRoYXQgaXMNCj4+IG5vdCBidWlsdC4NCj4+IA0K
Pj4gU28gcHJvdmlkZSBzb21lIHN0dWIgZm9yIHRoZXNlIGZ1bmN0aW9ucyBpbiBvcmRlciB0byBi
dWlsZCBYZW4NCj4+IHdoZW4gIUhBU19QQVNTVEhST1VHSCwgd2hpY2ggaXMgdGhlIGNhc2UgZm9y
IGV4YW1wbGUgb24gc3lzdGVtcw0KPj4gd2l0aCBNUFUgc3VwcG9ydC4NCj4+IA0KPj4gU2lnbmVk
LW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gLS0tDQo+
PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaCB8ICA4ICsrKysrKw0KPj4g
eGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysrKysr
KysrKysrKysrKy0tLQ0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2dyYW50X3RhYmxlLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaA0K
Pj4gaW5kZXggZDNjNTE4YTkyNmI5Li5lMjE2MzRiNzUyZGYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2dyYW50X3RhYmxlLmgNCj4+IEBAIC03Myw5ICs3MywxNyBAQCBpbnQgcmVw
bGFjZV9ncmFudF9ob3N0X21hcHBpbmcodWludDY0X3QgZ3BhZGRyLCBtZm5fdCBmcmFtZSwNCj4+
ICNkZWZpbmUgZ250dGFiX3N0YXR1c19nZm4oZCwgdCwgaSkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+PiAgICAgcGFnZV9nZXRfeGVuaGVhcF9nZm4oZ250dGFiX3N0
YXR1c19wYWdlKHQsIGkpKQ0KPj4gDQo+PiArI2lmZGVmIENPTkZJR19IQVNfUEFTU1RIUk9VR0gN
Cj4+ICsNCj4+ICNkZWZpbmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSAgICAgICAgICAg
ICAgICAgICAgXA0KPj4gICAgIChpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAmJiBpc19pb21t
dV9lbmFibGVkKGQpKQ0KPj4gDQo+PiArI2Vsc2UNCj4+ICsNCj4+ICsjZGVmaW5lIGdudHRhYl9u
ZWVkX2lvbW11X21hcHBpbmcoZCkgKGZhbHNlKQ0KPiANCj4gVGhpcyBkb2Vzbid0IGV2YWx1YXRl
IGQsIHdoaWNoIGNhbiBsZWFkIHRvIG90aGVyIGJ1aWxkIHByb2JsZW1zLg0KPiANCj4gSW5zdGVh
ZCBvZiBwcm92aWRpbmcgdHdvLCB5b3Ugc2hvdWxkIGluc2VydA0KPiAiSVNfRU5BQkxFRChDT05G
SUdfSEFTX1BBU1NUSFJPVUdIKSAmJiIgaW50byB0aGUgZXhpc3RpbmcNCj4gZ250dGFiX25lZWRf
aW9tbXVfbWFwcGluZygpLg0KDQpJ4oCZbGwgZG8gdGhhdCBmb3IgdGhpcyBjYXNlLCBJIGFscmVh
ZHkgY2hlY2tlZCBhbmQgaXQgd29ya3Mgd2VsbCwganVzdCBmb3IgbXkga25vd2xlZGdlIGNvdWxk
IHlvdQ0KZXhwbGFpbiB0byBtZSB3aGF0IGJ1aWxkIHByb2JsZW1zIGNhbiBoYXBwZW4/IElzIGl0
IHNvbWV0aGluZyByZWxhdGVkIHRvIHRoZSBjb21waWxlciB0aGF0DQpkb2VzbuKAmXQgc2VlIGEg
dXNhZ2UgZm9yIGQ/DQoNCg0KPiANCj4gVGhlIHNhbWUgYXBwbGllcyB0byBzZXZlcmFsIG90aGVy
IGh1bmtzIHRvby4NCg0KQXJlIHlvdSByZWZlcnJpbmcgdG8gaW9tbXVfdXNlX2hhcF9wdD8gSSBo
YXZlIHRvIHNheSB0aGF0IEnigJl2ZSB0cmllZCBiZWZvcmUgdG8gaW5zZXJ0IGFub3RoZXINCklT
X0VOQUJMRUQo4oCmKSBidXQgaXQgd2FzIGZhaWxpbmcgdGhlIGNvbXBpbGF0aW9uIGJlY2F1c2Ug
d2l0aG91dCBIQVNfUEFTU1RIUk9VR0gNCmRvbV9pb21tdShkKSBpcyAoJihkKS0+aW9tbXUpLCBi
dXQgdGhlIGlvbW11IGZpZWxkIGRvZXNu4oCZdCBleGlzdHMuDQoNClNvIEnigJltIG5vdCBzdXJl
IGhvdyB0byBwcm9jZWVkIHRoZXJlLCBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnM/DQoNCkNo
ZWVycywNCkx1Y2E=

