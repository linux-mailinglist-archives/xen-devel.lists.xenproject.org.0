Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5ECA4F9F3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:27:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901949.1309940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl1v-0007lz-Nb; Wed, 05 Mar 2025 09:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901949.1309940; Wed, 05 Mar 2025 09:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl1v-0007jr-Ke; Wed, 05 Mar 2025 09:27:07 +0000
Received: by outflank-mailman (input) for mailman id 901949;
 Wed, 05 Mar 2025 09:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XpfQ=VY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpl1t-0007je-NQ
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:27:05 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff91555d-f9a3-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:27:03 +0100 (CET)
Received: from AM4PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:205::14) by
 GVXPR08MB10541.eurprd08.prod.outlook.com (2603:10a6:150:158::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 09:26:57 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:205:0:cafe::71) by AM4PR05CA0001.outlook.office365.com
 (2603:10a6:205::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Wed,
 5 Mar 2025 09:26:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Wed, 5 Mar 2025 09:26:57 +0000
Received: ("Tessian outbound a81432d5988b:v585");
 Wed, 05 Mar 2025 09:26:56 +0000
Received: from L1705ee2f8cfa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C2B5A7C-3948-4EEB-B814-8D598FB9C1F3.1; 
 Wed, 05 Mar 2025 09:26:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1705ee2f8cfa.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 05 Mar 2025 09:26:44 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAVPR08MB8895.eurprd08.prod.outlook.com (2603:10a6:102:323::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 09:26:42 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 09:26:41 +0000
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
X-Inumbo-ID: ff91555d-f9a3-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ykYBGSpBER40MzOojLltDE9x1zpwL+AMntCaXZBfcyoufCXqTPSSB9/pXLxS7ajPNsDd7wZKC7fScuc7LXb7yuG+575Fpu76CqbhMhJ3raevusaW9hhXN28/PIELmoY049DKj+PeK2PIFmD5mVfkprHwdAXzU73CWtPfVl9AcTplNXoeUT++ZAhhA8sPfvqdBzc8fk/0HIHne57HJPPVwLTooZ3NGtgsA0hgIHDN6DaKBuUkaw9pdAeXY+lJWk9q9vj6A8+M6CWsuCGhvGl/SPp113lLJNzivkEM+DbwoJbPpufEmIaFJvFxp+WoQmH7gU3AB6xnQcbaQpUBjdPXPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f91jiP+gRmKiRK4i/b6WbUqLqK4L+8SPBRRlWZrZko=;
 b=bMDTxakwJ2cfGimgA+tYbDjbucTloeWmKJc0FDd2AqP1l1f6PB5dkd8BFWx4fxlsKrEJt1FCf2HVQc6zFrA6Tm013fAaUyel+iWSjZUV6HAbE7Fs0pCd/fad2KMKz56kHZiJMVk3MiPRDmlpPyTYw0DiqvlQFN5icgt5EsmMYLsoFKFXp3kcLm8EOwLOIWLR0gmtp3cfItU8hu2Bagw1j7lz49zlEDNarzQUFmCoTf1wQk4XRBPEldofLpJL3U/BfmQ1Of05k3yUWiaim7sUPONNaVpqWNq0FYd4YaFYQ9G3Ddzgz3D0VXKo2hGUWkTgvMudIsTIYnuHoK0qRaVl9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f91jiP+gRmKiRK4i/b6WbUqLqK4L+8SPBRRlWZrZko=;
 b=XQw5t+huVLtZnLSAJOG7sK3l/SW8HZKbKKSXCnBnmW0nclWvLM82cZM6q608R1INVNntEMPMNL1esAHHreUqVdE2NsmARVgImYMzprkZ7XU75eb1nGOAUeAl9vlO8h1REhaoQNaZL95KjQgTwqAh9NbIka9QdumXluKWxqyBvEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a947d9210178c152
X-TessianGatewayMetadata: 03rB9NU7Mc30GSmBXWz1rwW2OblzXzf+7IIyGBYyzduOyRYAAQYdFB6h+Qs96jKT2BWU9QUkT3/pu2WG9LQTndaWBEQGiL3jES+HZ3XdD29p6KTdEeqGFF1h4INVUmPNHShIQBLukAMjKvk2AD7xL0D6EfoPdl7NXEHspPQpYGU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWIOv6KegkGZ1cWX1i+4xp54Dn265sSDrzg/gIXCDNg4OiFQMH9KPYnpSrngNqljU4M5/+0R5QDEyFvHasCU3+tK1tHp1DrW3lT36dljgqh93FpPGu7krkyL+dSZGOS1x5FLifjCsYdcJqgdhZZyqMa0ayyAY4OUDrYTC8eh157okGbZsDhJkvhQPUygij15r61NRgVVh+nW/zjZL0qYhkTC4WpbVDyK17i9L9zWm8kMDnroxQppsGH11641dGAFc9eY/Dd7i4VAELMdRdc51FCOyV+OmgfannFSg2Q4n906KKLePixiIfbp0TRN+llAlLHoBCFoYqlxpfYW8nm2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f91jiP+gRmKiRK4i/b6WbUqLqK4L+8SPBRRlWZrZko=;
 b=ewlAK8onGxrxlK95LIQolccMYgyZ8TmeOgtnVHC/gncmgKKjUSXuqYxPgxXvjrdDCy3NL2VG6oehUkn018InXl+drDb82JjwWAz536vbUT8aMFCHQQzLQKLsAyQA3e4IvgTKDw1sT9lY52nmbnfDhP+7NShNQjwmKAdDYAVLamzTrrEe+yZFe1WqHgSX5SnGLfCV3/eis2F8crwxCeyPD0Q6IzrHl4R1CplLjRGm616SO451Qkl9dGIjLuNLpkuvDDe4ayJGNGFF7Ub1DClrvUkYZsfJ6thDtL6K1gg4y/5LsuUIdQQv26Rst3bUnh51mHRe0H7hVfSc0W6uuKU1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f91jiP+gRmKiRK4i/b6WbUqLqK4L+8SPBRRlWZrZko=;
 b=XQw5t+huVLtZnLSAJOG7sK3l/SW8HZKbKKSXCnBnmW0nclWvLM82cZM6q608R1INVNntEMPMNL1esAHHreUqVdE2NsmARVgImYMzprkZ7XU75eb1nGOAUeAl9vlO8h1REhaoQNaZL95KjQgTwqAh9NbIka9QdumXluKWxqyBvEI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index:
 AQHbgeq9NiESuirZAUKjxGV4IoLUtLNOlIQAgAAFvICAAAbRgIAAH+aAgAAG2QCAFKnTgIAA69gA
Date: Wed, 5 Mar 2025 09:26:41 +0000
Message-ID: <49B8D44B-928C-4B3C-A01F-11D6811BE5A8@arm.com>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-2-luca.fancellu@arm.com>
 <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com>
 <E6E21F32-EA02-4DE1-80CC-98D3A21FBF79@arm.com>
 <cc864728-0302-4ddc-88e0-c5330e3dc409@suse.com>
 <59D691D9-5A06-49C1-8B0C-E874029A97C6@arm.com>
 <1c4844a0-89e7-4699-894a-4957fedc4dee@suse.com>
 <alpine.DEB.2.22.394.2503041120430.1303386@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2503041120430.1303386@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAVPR08MB8895:EE_|AM3PEPF0000A795:EE_|GVXPR08MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5060afb1-38bf-427b-d043-08dd5bc7e002
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dUxORUlHT2I4bjcwQ2QreVZKdExhcnlxY0QvMThCazc4cGhjNmE1QVFHdDFj?=
 =?utf-8?B?K1hScVZwZ3VTYnB6MTN5VzBQN2xkL0cydzg3SmZCN3dFZmcwUDN4VTZZdXdU?=
 =?utf-8?B?MDExcHE3TGhlaE9vZERZVG9ZN0NDMHNDakllaERNSkNSMGRyaXNNcldGZDZV?=
 =?utf-8?B?M3ZkdHBhcjI4WHAxMzV3bWtwa29PYWJYN0hJZFJiNnVGajBtWGxseC9IbGJT?=
 =?utf-8?B?Y2ppRDk0c3lkbllYY1NpMENKLzRTNVhNSi9xa2pXMllWLzZvZU1zOG1OVFFa?=
 =?utf-8?B?NlVyOHRaQ0VXeGxySG1qMUlBWXhnSmhQWGI0TVZwbU84VGNwYmFQd1VYQjUv?=
 =?utf-8?B?MmtnN2dKVHNJdHJ0RFd6Z09QcTZuN2VidGprWUVkeE5Fb21PZldCN2RCR01q?=
 =?utf-8?B?R2NRVXBxeTJyTXU5WGlIaDluUmNVZXp0QnhVRXVlNFFGSHZrdERGOGhCcXBm?=
 =?utf-8?B?bTRoY3BIdDFTWjcweXFsMlZGaHp5UjhjdGtlT241Q3Y1b2IvVGoyWUVhQ3o0?=
 =?utf-8?B?dmtPRE8xektYbFhxUE54cGY3a0lvRkRWelUxek9pM3Y3ZlZaTEJqbU5UMnlJ?=
 =?utf-8?B?cUJuNFZmcHBHZVJ6V0tnN1pxamRMOEg3bnNuaWlieVdidjBld1VQM3VCTGZN?=
 =?utf-8?B?aXJkQmtNTGZGdFh1VHBOUWNVWVFJT3llcHpURktZY1gvTTFzaXo4aDRiNHBP?=
 =?utf-8?B?YlRkdFNkREtiTktmaGlDWVNueklCTTh0R3lNMzQwYmdoMlJwOXVSSUMxdkZr?=
 =?utf-8?B?VTBnemMyVnJoZXdJNVBVNVRiL2MrRjlVZmpFL0p0NVRydzN2cExmVkczWGU1?=
 =?utf-8?B?SW1yaHFzUkZJanJDT1FGSXJMZ1hLRFVQZk1FQ2IvaVppeEsreit5TUR5U0VD?=
 =?utf-8?B?dFRhZHhnV3liQzg2SHhNRnl6WS9aQ2lSaThVME0zWU5jZjRUV01UQzdvbTFE?=
 =?utf-8?B?aENQY1NXb0RZS0lITSsvTEd1NitlNUxVa2U3R3BqbHNCNHFlNkxJWjdBK2Z5?=
 =?utf-8?B?aVJjU0FCdFlCcjBVaEpzVDdma1VVTWRGdFJyL1NlSXJWcEpoeTlNV1JVQUlI?=
 =?utf-8?B?Y09kL2h6TGNlOTVjeWpyR2VxRGNDcitiZFIwRUhoL0JCK2RDbnc1TGxTWTBY?=
 =?utf-8?B?WjFSS3FPdHZxdjljZmxrYlU5ZlI1WDdiS1NrYUk3bTZ3RUJ3U1picTB4SmVZ?=
 =?utf-8?B?bVk4Q1Y2b2JzNWJvOXQ1UHlHeVFDN1pWMzlHdWMrcFMxNHZqbHE3ekYvejN3?=
 =?utf-8?B?eEdxeXdteDZkTXdkaFRVdG84SWxLdHVtSHUvK0hXaytOeWJheVZQdFFwUVZ6?=
 =?utf-8?B?RUp0Y2R2SUVFNG54TG5MbXRYaytXSUZrOXM3Q3N1UlFqYU1DR0hydjcxK2Mv?=
 =?utf-8?B?ZWtKOVRGTitxWXNlL25mTTlpZHYwVkhxa3lSRHR0ekg1M0xkTVh5VXJKUVg2?=
 =?utf-8?B?U3lROEZlN1VGbkpNa0U1SlNVLzRQc3RUUXZVQXp4TnRCNDMzcHYyL3lrYWtk?=
 =?utf-8?B?OUszRnhDaXljTDlpazhZelVObVhIZTh4L2Fmb01BamJhcG50UVpSMlBmdkVL?=
 =?utf-8?B?U2ZlaHpYWFlvUXRoVC80TXVCNVRFUlBaSW5GNUhnVG94NGMyY3N0YXBaSVBI?=
 =?utf-8?B?Z1BkUEtsam84QXgxbkpzazlRb0pIdUVCSVA3RUh4RkhkR3B5a2I0MmJXN3RE?=
 =?utf-8?B?a2VsTDhOSmhIaDFtbm92VkhFWk83N0FvbDV3V1hjNnJjWmlDQ093RVlCRTZw?=
 =?utf-8?B?L1pnTjMvK0ZwcDk4b2gxUW9ySE43MW13ZmpnTVB0Z3RXTGtueCtFQnE5OHJx?=
 =?utf-8?B?MXZEZUdtVXBpd0FrbGJmSXNmbEFnZG5Ha3dBaG1jUzE3SjdNS2tDbmtZeVFR?=
 =?utf-8?B?QjlXbEhwdEdOZlIzRWt3RUI4R0ozNTBHaEpjSkgzYTRYaGRaaVBSRnlJK3Jv?=
 =?utf-8?Q?OwouF+xLmD5o/WaF4myzYkrJkO8M+cly?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <64E6975A95ACBF479A21EF277BE48822@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8895
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a10ade8-f7ef-45ec-5780-08dd5bc7d6f0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE5LcXMyc01GQWZ3SkhLNTJKK1VBeVB1Z3IyY1RHVk9rd0JhNm5BY3REaE9l?=
 =?utf-8?B?VFZkYXcvTU5sSEZVdzJVWFJtNHNaRzRYWTZJTFVjSHJadWlQQStpU3EwcEdK?=
 =?utf-8?B?cEs2VkkwUXZSWEpYaTVOVllqQzUwSGRJc1hDSzRpTVk4b213aW5RU1dxMGdt?=
 =?utf-8?B?bFpxT1QycnZZQ0tWTkNFRjRRRFM3b1JNQW9MV21KSVFITFlqQmRuL21Wb1Fw?=
 =?utf-8?B?cGhQeDIwWno2RmhxcUtKNlRFV054RFQ0d210SHdiNjVpTFZvVWVMK01ERFd5?=
 =?utf-8?B?QlVBenNTdFRsaDFHSGVrNkhGODFCTnJITGp4VmtMTVdvclJkQzl1YnJPS05o?=
 =?utf-8?B?U0xSQitIRDdZZHhaTG85WHhqVmFFeHJ2cldCc054MWczYjJ2VXk5b2I3bThB?=
 =?utf-8?B?YnZKZzZqM09RbkVrNW5lbDVtZi81WmxsSUZjc2pOUjE3dHdMWTJESzJtNUMx?=
 =?utf-8?B?aFZHaUNZa2ZWdGlBTDNwbkwxVDUxVzFzdE51TXI5bk9EaUZOUDhWT25QOXRs?=
 =?utf-8?B?WHkzQkljS24rSVdSc0ZteUhoUkw3RnBsZUFzNW9tODdUWTQvR2lrMS9jT0Vy?=
 =?utf-8?B?UEdTNlBzYnFjR2tSZGdOSjVxMk9obS8vQlNsMUJkbWs2cStOR0twSjlGRmR5?=
 =?utf-8?B?cmhJbVdxNHBOU0F2TDRva1krQ012OThCTzhCUTl1UzBBVE8yZ2lCdUNzby95?=
 =?utf-8?B?aWJoRG1ZNGNyRGJSSmZCQm9RblVHcWhaZXI4TE9NQkhXN1QvZjgxaVhXUnh1?=
 =?utf-8?B?VkZmdVR4dGtmN21JRFZzak52b056U1R2dFBSdm9YTDBqT3lZN0hSdmVwWlFD?=
 =?utf-8?B?eldkUkVZV2pZWmhrVHlrV1M0dEx2dHB6cEw5alhGTmttSTJxWlhuYWxTbzM2?=
 =?utf-8?B?Nm8ybTBDZ2dsaVZhZW04UzVQc01NcHVWbERjUHlJSm9Gd1kzTHJSK0RoWW9n?=
 =?utf-8?B?VWMwQjlJOEtiUUVzd1AwaXpBVGlsNXpMN21SSmRlTzFoVmx2T1l4dGNXdGpE?=
 =?utf-8?B?bnNhQUIvdmkwSWdjZU15TitrdFpyOTI0QlA5b0gzUWFCMWxpcGdha2lQZHRZ?=
 =?utf-8?B?UzQxNEFvVHpEcHozdWF2WXREZnhRSVl0NmVJcGw4T2hpYVlJM3pLYzdlaEg4?=
 =?utf-8?B?NCtaMHpZOWNZVDhpOERFYnBOeWFnSHMyaXF3aFBGbnRBeWxZZzVzODNMZ3Vy?=
 =?utf-8?B?SU5SbVBCZU1VemtXbXpZNFU0bWpxRVdkM3NjL0FTVzMvVXlMMHFNajlzY3dN?=
 =?utf-8?B?M1hTalI0NGZURDdSVk1BLzhsWkpJazc4K3lrSkNrMHlLNUhLMy9OdTJPSVVu?=
 =?utf-8?B?RExzYm1nN1JyR1RScm9mb1BlZFR0M3BtUVdMLzIwK09Jb0c3Y20wUUdFdDF0?=
 =?utf-8?B?S2JrTmdsNjBHaE5rK2tCZ2VyVmdFN1p0aDc2RlYwTHplL2FOcDFsL09hTzhM?=
 =?utf-8?B?M3ZsN0ZlMkNranQwQzZHZ3hxOEI4NkZMclhpRDRKK2FFbUQ1cTlOQ21JRGMy?=
 =?utf-8?B?VFdXcXFMQ0JCcFhCWi9CV0tmZkJJaHA4ZHRPNHpOUWJiSnp4Q3o2VlVBNENw?=
 =?utf-8?B?dXRYSVlvaFZpL0ZJQnMyeGtRY1hsVHdpN0FjUnE2cFV1TjYzaERtS1NBbHNv?=
 =?utf-8?B?eUtnYmRoWmRhWmxBZ2RkVWIyN3JoM1lRWFFXZS9DUnpIRE4vNngyUE5OakMv?=
 =?utf-8?B?WmdnN1RnQ3RSbkZ4bHkyOGFXREIzVVlsczlwY2lNYVRzUjVuRUtHcXZTb1J5?=
 =?utf-8?B?UGQ5dVVkZGVnSS9wMkVxdEFKb082ZEpTTGtjbTRla09mRkorMjdob2VqZHVK?=
 =?utf-8?B?eE1kQlZTN1NxUDNCRGJPWk1MK0UzQ1VTQnZnMnFrbmZvYkpNbE5tdkZoQ2Ny?=
 =?utf-8?B?Z081Z20vcFo2QXdBY0krU3QxaExBMmxuNGliNG1Za3YrREd5Wm1vZ3RUQmcy?=
 =?utf-8?B?KzFOTGYxREpPMUhRN2Z1Z0ZZcTJSaFpTZDlqZyt4dTJhSTJPczl6SmpBSDI2?=
 =?utf-8?Q?nkQZMTxEoheidbRvwcrDdTj6YGuVPE=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:26:57.0597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5060afb1-38bf-427b-d043-08dd5bc7e002
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10541

SGkgU3RlZmFubywNCg0KPiBPbiA0IE1hciAyMDI1LCBhdCAxOToyMiwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMTkgRmVi
IDIwMjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTkuMDIuMjAyNSAxNjoyNSwgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+Pj4gT24gMTkgRmViIDIwMjUsIGF0IDEzOjMwLCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+PiBPbiAxOS4wMi4yMDI1IDE0OjA2LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+IE9uIDE5IEZlYiAyMDI1LCBhdCAxMjo0NSwgSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+PiBBcyBwZXIgdGhlDQo+
Pj4+Pj4gcmVzcGVjdGl2ZSByZXZsb2cgZW50cnksIHRoaXMgY2hhbmdlIGxvb2tzIHRvIGJlbG9u
ZyBpbnRvIHdoYXRldmVyIGlzDQo+Pj4+Pj4gZ29pbmcgdG8gYmUgZG9uZSB0byBkZWFsIHdpdGgg
dGhlIG9uZSBBcm0gdXNlIG9mIHRoZSBtYWNyby4gT3IgbWF5YmUNCj4+Pj4+PiBpdCdzIHVubmVl
ZGVkIGFsdG9nZXRoZXIuDQo+Pj4+PiANCj4+Pj4+IEkgZGlkbuKAmXQgdW5kZXJzdGFuZCB0aGF0
IHlvdSB3ZXJlIG9wcG9zaW5nIHRvIHByb3RlY3RpbmcgaW9tbXVfdXNlX2hhcF9wdCgpIHdoZW4N
Cj4+Pj4+ICFIQVNfUEFTU1RIUk9VR0gsIEkgdGhvdWdodCB5b3Ugd2VyZSByZWZlcnJpbmcgb25s
eSB0byB0aGUgc3R1YiBpbiB0aGUgI2Vsc2UNCj4+Pj4+IGJyYW5jaC4NCj4+Pj4+IENhbiBJIGFz
ayB3aHk/DQo+Pj4+IA0KPj4+PiBTdXJlLiBBbmQgbm8sIEknbSBub3QgYWdhaW5zdCB0aGUgZXh0
cmEgcHJvdGVjdGlvbi4gSSdtIGFnYWluc3QgdW5uZWNlc3NhcnkNCj4+Pj4gY29kZSBjaHVybi4g
VGhhdCBpcywgYW55IHN1Y2ggYSByZS1hcnJhbmdlbWVudCB3YW50cyB0byBoYXZlIHNvbWUga2lu
ZCBvZg0KPj4+PiBqdXN0aWZpY2F0aW9uLg0KPj4+IA0KPj4+IG9rLCB5ZXMgdGhlIGp1c3RpZmlj
YXRpb24gaXMgdGhhdCBNUFUgc3lzdGVtIHdpbGwgYmUgYnVpbHQgd2l0aCAhSEFTX1BBU1NUSFJP
VUdILA0KPj4+IGJ1dCB0aGVyZSBpcyBhIGNvbW1vbiBmdW5jdGlvbiAocDJtX3NldF93YXlfZmx1
c2gpIHRvIE1NVS9NUFUgc3Vic3lzdGVtIHRoYXQNCj4+PiBJIHdvdWxkIGxpa2UgdG8ga2VlcCBj
b21tb24sIHRvIGRvIHNvIEkgaGF2ZSB0byBoaWRlIHRoZSBtYWNybyBpbiB0aGlzIHBhcnRpY3Vs
YXINCj4+PiBjb25maWd1cmF0aW9uIGFuZCBhZnRlcndhcmRzIEkgaGF2ZSB0d28gY2hvaWNlczoN
Cj4+PiANCj4+PiAxKSBwcm92aWRlIGEgc3R1YiBpbXBsZW1lbnRhdGlvbiBvbiB0aGUgQXJtIHNp
ZGUNCj4+PiAyKSBwcm92aWRlIGEgc3R1YiBpbXBsZW1lbnRhdGlvbiBpbiBpb21tdS5oDQo+Pj4g
DQo+Pj4gbnVtYmVyIDIgZmVsdCBiZXR0ZXIgYmVjYXVzZSBpdCBjb3VsZCBiZSBhcHBsaWVkIG9u
IGFueSBYZW4gY29uZmlndXJhdGlvbiB3aXRob3V0DQo+Pj4gSEFTX1BBU1NUSFJPVUdILCBldmVu
IGlmIGF0IHRoZSBtb21lbnQgdGhlcmUgaXMgb25seSBNUFUuDQo+Pj4gDQo+Pj4gTnVtYmVyIDEg
bGV0IHRoZSBwb3NzaWJpbGl0eSBmb3IgdGhlIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24gdG8gY2hv
b3NlIHdoYXQgdG8gZG8gaW4gYWJzZW5jZQ0KPj4+IG9mIEhBU19QQVNTVEhST1VHSC4NCj4+PiAN
Cj4+PiBOb3cgSSB3b3VsZCBsaWtlIHlvdXIgdmlldyBvbiB3aGF0IHdvdWxkIGJlIGFjY2VwdGFi
bGUgaGVyZS4NCj4+IA0KPj4gSSB0aGluayBJIGluZGljYXRlZCBlYXJsaWVyIHRoYXQgSSdkIGxp
a2UgdGhlIEFybSBtYWludGFpbmVycyB0byB2b2ljZQ0KPj4gdGhlaXIgcHJlZmVyZW5jZS4gRG9p
bmcgaXQgaW4gaW9tbXUuaCBtYXkgYmUgb2theSwgYnV0IGFsc28gbWF5IG5vdCBiZS4NCj4+IFll
dCB0byBkZWNpZGUgdGhhdCB2ZXJ5IEFybSB1c2Ugb2YgdGhlIG1hY3JvIG5lZWRzIHRha2luZyBp
bnRvIGFjY291bnQsDQo+PiBhbmQgSSBsYWNrIGNvbnRleHQgdGhlcmUuDQo+IA0KPiBJIHRoaW5r
IHRoYXQgZG9pbmcgaXQgaW4gaW9tbXUuaCBpcyBmaW5lDQoNClRoYW5rcyBmb3Igc2hhcmluZyB5
b3VyIHZpZXcsIEphbiBpZiB5b3UgYXJlIG9rIHdpdGggdGhhdCwgSeKAmWxsIHJlc3BpbiB0aGlz
IHBhdGNoIHdpdGggdGhlIHN0dWIgaW1wbGVtZW50YXRpb24NCmluIGlvbW11LmguDQoNCkNoZWVy
cywNCkx1Y2E=

