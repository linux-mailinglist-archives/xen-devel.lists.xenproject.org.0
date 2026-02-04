Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH3RKXt5g2nyngMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:53:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED688EA92B
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221035.1529422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vng7W-0002ov-0A; Wed, 04 Feb 2026 16:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221035.1529422; Wed, 04 Feb 2026 16:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vng7V-0002nU-Ti; Wed, 04 Feb 2026 16:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1221035;
 Wed, 04 Feb 2026 16:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=THT1=AI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vng7U-0002nO-Im
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:52:48 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb63949b-01e9-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 17:52:41 +0100 (CET)
Received: from DUZPR01CA0153.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::6) by DU4PR08MB11185.eurprd08.prod.outlook.com
 (2603:10a6:10:56e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 16:52:38 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::ef) by DUZPR01CA0153.outlook.office365.com
 (2603:10a6:10:4bd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 16:52:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 16:52:38 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB6713.eurprd08.prod.outlook.com (2603:10a6:10:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 16:51:35 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 16:51:35 +0000
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
X-Inumbo-ID: eb63949b-01e9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HQ7iRVgGBCln8wQp9GIvYmf6fmSe/KdeY7hAPhWrARC/O7lfFcSHZL4jxFhWpPhTljqzADPi6016Shi/36QSyUdh+Kjehv5SN+KUVo5QPJaqM5ANut0nuODsKPjO1Cc37W7YG+S63In6uqSsLVhTWcDzdcxJ7gZLZCwQKZ41ERQ74FopSCU4n/Eu5dD47m57dovhez1rCSBSPwxer7qriyiYbyDJoSu5NZGPA2wHiBQXraSZHA2vqgYAQczTw+4K5G50jGU8hMVe6mIUvpSH67YyM331bitfOQ+EoIriAkDxRFjOErWL0XRywwoEA6V1p+U8YjUdtU69LWQkDR8BzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGJxp46NY6v3Ij8co5kw93O+T1JwZMDCw/Gxc0Lq1uA=;
 b=aAGLrTuI11hp/yhI1bxX678j7JWF9EPFAdLijYM6cAt9mQE4AgLSo5XCZs01HUZwjKUS/ZsikFZHrwmUdWPy2VcCg9/u1XnfB6rQHBdp/dQLo+Ie202g2bCc0AStswtJ56nKKHdl4IJc7W2CrTorvu1TdrSVvsnP1etqpNSANi4WocrQj/vB9ofQ3rRmjeo7OCOznuwGUa2z4W2MooGePITuow5XvxR7SUqBaPSY8Kgo2kiITI7UCIV1gK1bOXxCxqA+fDYJ+/EEj3nSU0CpDA7+/2GRoCXcspfmHLKxbrJ6ul/ZW5HG55KjfDF1ME3oaw4qGbJoS2v/WB8PRuJERQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGJxp46NY6v3Ij8co5kw93O+T1JwZMDCw/Gxc0Lq1uA=;
 b=RLvb5hw25NeUc9vV6uvs9EfR5Cq/E8xb4/b42zDb7tgGB9lbH5mDjQWrukCopgGVbwN27KXgyy0p0DKrTycaZT2XfZjRxz2Yjz1VDJCj4OGXhza/kjRaDborRTb25GGHFKxO1NIgRmRldMyCC6U5Je0aN4lOVMjEyiFkXRCo7YM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nn2Haal50BcfeGBS94+IavYgsuT0AMsCD0kHSYO62wpNSAgbxAVUchpPTlxkmSCb+vL7MUjYqi9tdYTNV4TYE9ovj1vV1JxeN3vJ2Y9IquRy0/bzL5vVehwfRssH5O8csO1aQr4c2s1v+ubz/Ty4ctdZtnTuGxd9EtEPUTGAsggrxxMdo5ftP3tHEFneC/2dbxRMR2pINqjHXd57qFCThmAU4CwEmuHHmVp2KMnVGxz05JQqZCYamVgt0ial0lx4axMDNfXC9EmM43WSX8cMzvu2mPzlH6cjo4SW9FYD9Cc0i99OMGj1bFATDeRscI40tOJL6REkSwxvsPwg7270YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGJxp46NY6v3Ij8co5kw93O+T1JwZMDCw/Gxc0Lq1uA=;
 b=PwEuOVntbHObE5Qm9n73FQEafS+fLWiiNbkab/s4RnWNGQKIIOtPG20EW6x8J5+3EjQhXcRi/VGOMU3fzYF+CgwEx476gZUpI+/x5o+XNrr3ZQeVzquPJphUHD5htw7ZyWy0YJBwk2vW0ZAafQX2pi2RM02SdZa5qjdgWovaMXxbngnIiSxS8JPfRuVz9oN92H9hr5rNTDp+ThKkayCRO/soXOf/qFDznpsa794CtrO6X95TGYE/UwzXBCFGq3kQZGMvADrpO8bw+0xv+47Ze50/ZcYR8Vs95h4mrbb3+rY/lB3uDGzNgBFjmsO0daLUu94iRwaQAyOZM76TeHw2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGJxp46NY6v3Ij8co5kw93O+T1JwZMDCw/Gxc0Lq1uA=;
 b=RLvb5hw25NeUc9vV6uvs9EfR5Cq/E8xb4/b42zDb7tgGB9lbH5mDjQWrukCopgGVbwN27KXgyy0p0DKrTycaZT2XfZjRxz2Yjz1VDJCj4OGXhza/kjRaDborRTb25GGHFKxO1NIgRmRldMyCC6U5Je0aN4lOVMjEyiFkXRCo7YM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Topic: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Index: AQHcldiTYCc32vRyb0mp6O53Aox8PLVyquQAgAAD9QCAAAraAIAAB5kA
Date: Wed, 4 Feb 2026 16:51:35 +0000
Message-ID: <BDB5B69D-3E56-4F24-88C5-A96A3F860596@arm.com>
References:
 <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com> <aYNyrKA7bOiZQSZU@Mac.lan>
In-Reply-To: <aYNyrKA7bOiZQSZU@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB6713:EE_|DB1PEPF0003922D:EE_|DU4PR08MB11185:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ec69a5-a6bb-48a4-ffd1-08de640dcdac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UXZUL3dRSStlRG93UHVvaDVwU0YyZGJUWVBzWmlsVlZ0VTBCN2ZuMzBTVVV5?=
 =?utf-8?B?KzdoWDkxaWhGeGpBYkpveThGK0lWck8xZUNlbjlGZFU3bFdOa3ZJWDFFZUZo?=
 =?utf-8?B?cnJFTG5KdkVjcXlNMUJBRFhlUTR2eWM4Wnc4UWtLM0ExOUJMU1J3WHB5dm03?=
 =?utf-8?B?SE81WTF6OGxjZEorcmVnN2MzcmRiY3Q5bXV4T0FRV2xKc0lpOWplQ1RzTWEx?=
 =?utf-8?B?UVFwSUxSYUxxVlNWMy9yTkp5L2pxZWFTdjNBYTRYU2NQOUtMRVQ1S0J4VUM0?=
 =?utf-8?B?TW5FOHhRL2pzTmt6QUlhSVYwSXNVbjZndy9mZ0pwOFJmWkxYWlVGU0F5cEE4?=
 =?utf-8?B?aHY4SHlsREFvK0pZRENmTC9wVmlJSTRnNmlBaEJ3STNpVmIwYkxzMzJzS2hC?=
 =?utf-8?B?T0ZDa2NyRlkxbXRkZXlONWtpUGxYNmhaMVBxK1QvVVZTc3JUOG5GcDgxYUtU?=
 =?utf-8?B?dmkwWndBVW9tTi83S1JEOEU4RHY2R21UTVBMRGJhNklwYmxOS00zclNUWnRL?=
 =?utf-8?B?cGtZSnhuNGJET0VjUWxodkJxUFlBNE02bXRFYSt3QW0wUW5aaElJMHB6b05i?=
 =?utf-8?B?K0pZZVkwRnVUNWFVWHM5QTdRbFQyY3dHNWZ0K2tkT1lKMWZMd21IeER4c3BH?=
 =?utf-8?B?cytUdVYwMnJTNHMxSDhkdjZVVDdNNmR2NlNCRkhlVzZwaGJKVXppd2xyRVRJ?=
 =?utf-8?B?T2VZeEc1VkxnSEhCK0NWY3V3MWhjNjdNZDVEUXVTOWR5eFVmdTQyNFRpbER3?=
 =?utf-8?B?ZDMveGVtR3RyZXdZV3Z2emVzV3NhSE5ESkF6V2xadjF6bVBGOERuZTJ6VTI4?=
 =?utf-8?B?ZnJIQVl5NzFWb2RJWXg3U1NBTlNZTnVNSGlxdkljNkZBeWc0cVZHSHhPVi8y?=
 =?utf-8?B?bnh0TUR3cC9aK282Z3Y4V3dDUFR0WDZna0ErOHdBQzVpUTlFZmhhSFFFMnJu?=
 =?utf-8?B?UkVKMEJyRWpzUWo1UmJJS0FZYzNMRnBJc1dtR3lOMnVoWVFVdk5EVEo4cHE0?=
 =?utf-8?B?b2dIMVRDYjNiaFpzR0hqcVFqUXo4WTZTd2JwVGhLZy9lazg2VDhoVWp5MFFY?=
 =?utf-8?B?S21pNUxMWjRwdE1kZVAvWThmV1hWSUFKV3l1WXRDTS9JbGpJbE42WU1Xb205?=
 =?utf-8?B?dXdNdmRkdC9sMlRyYVU0Qm8xczJxN3VCZWV5SFkvZW1pYS9iQUI0MTRjUFdy?=
 =?utf-8?B?M3A2QXgwa1kwUXhhUWVpTFJZZWZwbjVyZlNVWE1tZjVXV0ZuejJ6RzFvSHR4?=
 =?utf-8?B?OThWSTV1UTJ0SWJ5VnlFRGRqaXIyWFJVRzQ1TFZqTkFFRE9abFFjR2pueDRY?=
 =?utf-8?B?SU1mWktsYlArdzJJZkE4Zkg5SHpHcU9lTWJkNmw3MWFRelJsZnI4TFhyczhU?=
 =?utf-8?B?KzRaZWZQaHp3aGRZOG1VWThHNGdRV3I0RTUvdG41OVF0ckZDb1c2MEJCTHFR?=
 =?utf-8?B?RFlWYmdkUW1pMlM3N1pXRGVGRDZwYmYyZEI0ekhwSFFKS0hLbDBDVEJuQjhD?=
 =?utf-8?B?MkFUSVVWMnFPMmNxYWdtNk9DelJqL3hKUGFWS2RybnpJYXc0OG92aFAyVFd5?=
 =?utf-8?B?RFM4SDIvWXBuaUY2cTE4Nm16eFRibHpBd3psUWp5OU9ISHlOaHlWclUwUVc5?=
 =?utf-8?B?ZkpIYXVLOXNaYXFsdlk1aTlTNmJ0a0NYQkpaKzRxM3FSODY0dy9NVWtOTnpC?=
 =?utf-8?B?ZWkzdEZLanpQQ093VWJSMHJJS0JDZC9FY2paMGFWemdQbE9aMWczSFdjV1FY?=
 =?utf-8?B?UjNwSFNHYWVtLytjc1RSeWlFQkU5MmJHMzdVcUVwYUREMy8yVDRwaDdyaWxw?=
 =?utf-8?B?Y2c0dVlGRXJsSEJubmsxNTRnT21oandYdTFnZUx1U2VIT0hzaFN1ZUF2TFFM?=
 =?utf-8?B?UTBYbDBpWE9haU53YjhiUld4QXdNODR0ZVU1ZVh3OFRNbldFMVRSRkZQQ1Vl?=
 =?utf-8?B?TXMrc2JhcHNtYy9XNncrL2JlSnpXbVc1UjNiV2dVN0lPUjVLWUhLVFJoc3ll?=
 =?utf-8?B?MkVxNVk5MzExYmxtSVNNanhpZGVhK2ZESjlTN1ErcE40MVNhUUNIRnlGM1Vo?=
 =?utf-8?B?bk01YnczZkRkNzRtNHNoWEFHTUFiUWliN2dyZU9oRkMxTThkZzdzT2M0V3RU?=
 =?utf-8?B?TjJRblczZElteCtMSEE3Q1JmblJpK3ROcXBNL21lNnNKVDc0bFU4djZxcE9u?=
 =?utf-8?Q?a5U4ZuFGXAqX4RJchtz4YXg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE7267B98790D94DB72EBBEDC8062527@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6713
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d02187d-5df6-41b8-9565-08de640da839
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|376014|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3VPOFFGVjkvVU9yVzFWUDA1ZnhzRGRHbjExcTVxaTdIRzJmQ0pWUC9wd3I1?=
 =?utf-8?B?TE9RUm52d1dFcFRHWXUrbTZnS1ZZZXM0OWJHMkVjQk5DS3VyR0Job2dXenR1?=
 =?utf-8?B?Z0dVd09tRmtwMnptaDZyc0wrQnhkWGdteHVZbjZDN3JDSEJKall3Q2p0NVpC?=
 =?utf-8?B?YTR1SWFRcUxQRk9HVVBDb0hPZTZzYmhTd2tqUzh0UERJaXpPUXVCVlRxOVh5?=
 =?utf-8?B?Y3JpSXYzYW53TGJybTBPdzh4VklFYWNZMXlyTEhYTEJ5c0F0U3dMNlVrdWQ3?=
 =?utf-8?B?UjZPdGRFQ2RPVng1QzlLVzhxWkdqeldiSWUybEJTN2V6bGROMDNOS3NQdTFx?=
 =?utf-8?B?UHZZRnhPUjNEUlhHRGM4cEkzSFBUSitIeGNWWm04ODVHdWdGVmdnWXN2K3Mw?=
 =?utf-8?B?NjlzMGpPSWlGblBVR0xnMFJVZ3ZGUXhSV2Zyd25Ba0luZ1o0WEM0VXhBL3JT?=
 =?utf-8?B?ODIrWngwUHlDRGZSdUd0V2cyT3puZUFFZVI0aUhOVXZiZURadVVyNitpekRD?=
 =?utf-8?B?Z3E3WS9EbVN1aEFlVWpyK1JrV0RyVWM5SnB1TEFTa1hBL3k1Z3B2U1hOYzY5?=
 =?utf-8?B?YXI3TXVLUkgraEk3dzlmYjRsd2xud1Ftc3dKNFFVVHhiVzd4TEFjTzNvSEhq?=
 =?utf-8?B?V25YRkdlVndocXJXSFphUlU5RlVKOTF5WFRTMmM5R1JEQXVXTWhpYUJyT0x6?=
 =?utf-8?B?ZW9GS0c0Yis0Smh2MGI5N3E5U0RRdElZYXk1TVpFUDRieldzWkhhV1BzdVRJ?=
 =?utf-8?B?Ylp4MDF0NkdWME1SWkQvOUtJRHhrMjZtL2FURFo5citsaVJkbUVKcEhIZzVS?=
 =?utf-8?B?YUgwVDg4UmRsdXNXc0Z2YmNvclRWU2ZNYVJXZzVOMU5WZTk1S2lPRW1UcDg0?=
 =?utf-8?B?VExacU9RNzF5djh2cm1IRSsvSUlncmgrSVEwMUtZMjYvNytadDhVcGFhT0Zh?=
 =?utf-8?B?MWNPM1NpVGpWYkRDYWw3OGJRVlpmd3JYSjFUTTE4blRwVFhvM1NEcktxVmdi?=
 =?utf-8?B?SzFMMUJrT0M4Q2tWT01ON3cxUXluREJWd1lFbklwTmVhd0tBNWZMTmd3WnFQ?=
 =?utf-8?B?THEwN2ZoTDZHNzFYb3Nia0dJY016cHRRa0FtaFQ5ODFTWUlvM1A0OUkzUGtV?=
 =?utf-8?B?cWROTDlYbVh1RDM1aU9IRmNnY3M3V25KWWVJd1MyY0g5dC9rVU5tYWFyNmhF?=
 =?utf-8?B?SDNWclhIQ2ZIUlhodXFjWDNBUG4xbS9XRUhiSS80dDdyVVVMUGhoUWFWbFB3?=
 =?utf-8?B?NzVKcngyTVlqQ3R5OUVNNDhCanZpaFM4Wmc3QnlyOThPWkRia1NVbU9aMW1k?=
 =?utf-8?B?VGRSQlg5S25KTnNlWkNCSWdzdEF6TW1XUkN4SGkrTWRhKzRLWGExOVJhazhH?=
 =?utf-8?B?KzUwWnhUVC9jVUJjSFlWUjVOR3kvbFhvN1BhVWpXdURkTVlKZERON3NjUS9G?=
 =?utf-8?B?YmtwSFNlbXNwTVlXcjh2K3lvbGpHUGJQalNoNUY0cmNtWTZZOHd0TVlKNnNQ?=
 =?utf-8?B?L0Z4T1JPS2lGSGZ1dHhIbFRBV2oxREc4TVlNTEFhL0szTUh5T3dmUWxtNXZT?=
 =?utf-8?B?K3Z5ZUhoQWdBSTFLUCttb04wckE5VFZtK1YzSWhoTDVvOTNja01Gd2hxZXJR?=
 =?utf-8?B?YTc2M2tSMGNzbkViQmE3VnFjc0RqRDZUY2R4aUoyNDdYdWF6NnREMFFKYXJM?=
 =?utf-8?B?Mm1pdDRZU3hBcTNpWk5iZkdzMm5oNXF5aG9kSWwyYnI4dlpUUXJ0WXRyN1A1?=
 =?utf-8?B?akJ2b3FHWEZBTnZJaHZzcjRhZlhhUUxBVENidVdMRkRJUkMzK0UwZEdTZE9a?=
 =?utf-8?B?aHJXL2dpamFCT1BhNkJ0WGxVb0g4dzFRTlp1a0xFMXovaUQ0U0dGZE53a2JZ?=
 =?utf-8?B?TDMzbWdDeEdkb29Za21hckdHd1RMSUJTaU5qU3VOU214RG9TTFg1anRHMWNt?=
 =?utf-8?B?YXpxbFNZY0hpRFZvUkEyV2Y5b2ZnN3paS2x3Nkt5SFVRd3NyWktsR00xOUpp?=
 =?utf-8?B?UnZZT3EwZjlqRk1XQkptRWJsYkV0Q2NRTmZHdjA0RFdzU2lJZVhDTWFtdlRB?=
 =?utf-8?B?TC81a1N3bXhFNVZJQXhvV3pTNkNHRHR1RG52SjNBT2lnSkxGSEkxb0RSU0ow?=
 =?utf-8?B?TTdvSHRXazhiV3NvcmRVWGxFMnRabElwS3hqRktaN3hBaVhscVcvdDdOSnFG?=
 =?utf-8?B?UzRBREQ4SFgwR0FMRTlzc1VmdTVNR2V3SGxDbjFIYXc1aXQ4aUpvUStob3pM?=
 =?utf-8?B?OCsxclo2U3l6c2ZZbkh2TERqQWhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(376014)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NuMcbMWP7jO2flIHdBwHhTJDfGgn6uP5+xu3VmnPZnHaRbaOykDsbGnPbYVI1QD6uN6Sp/EeV+zwfUnQWxpXayKwXtuKtZGMkfht0iBzh766QSd9fEmy7SX6pJEXuHcYL93DrDLoOww6F7z315HpcRSnZ6tehkUHGClE2LjRXDc0ciBS4BCNCZ1Cga2mzeBn64fAPfXtknkAdpOjam2oPOz2CIVZKrMfAexZtg+rtFxczlXUYdMEYX8oo8ComUTHnx907akzAT1JWTzmIHhrOBh5JWq+abxFIqE+vUj3fnvnxtIJjMUNQ14mpnhs/Em9BSdXP+ZgTABDdq+h+587iyqkcRBm9TSkjpNVM/qijdcvpBIv+Mncsq6CRmZmWtnQyy147NDgVICY1+qGdR3/JHEqpu2yn6DdFMEVUGSu7WOGXNvfTIdzyFwX0yxkofJ/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:52:38.0095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ec69a5-a6bb-48a4-ffd1-08de640dcdac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,arm.com:mid,arm.com:dkim,stdgnu.mk:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: ED688EA92B
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gNCBGZWIgMjAyNiwgYXQgMTc6MjQsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgRmViIDA0LCAyMDI2
IGF0IDAzOjQ1OjMzUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKYW4s
DQo+PiANCj4+PiBPbiA0IEZlYiAyMDI2LCBhdCAxNjozMSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwNC4wMi4yMDI2IDE0OjE2LCBCZXJ0cmFu
ZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBiL2NvbmZpZy9E
YXJ3aW4ubWsNCj4+Pj4gQEAgLTAsMCArMSw0IEBADQo+Pj4+ICtpbmNsdWRlICQoWEVOX1JPT1Qp
L2NvbmZpZy9TdGRHTlUubWsNCj4+PiANCj4+PiBEYXJ3aW4gaXNuJ3QgcmVhbGx5IGEgR05VIGVu
dmlyb25tZW50LCBpcyBpdD8gVGhlIGRlZmluaXRpb25zIGluIHRoYXQgZmlsZQ0KPj4+IG1heSBi
ZSBzdWl0YWJsZSwgYnV0IHBlcmhhcHMgYSBicmllZiBjb21tZW50IGlzIHdhcnJhbnRlZD8NCj4+
IA0KPj4gWWVzIHRoaXMgaXMgb25seSB2YWxpZCBiZWNhdXNlIHdlIHVzZSBicmV3IGluIHRoYXQg
Y2FzZS4NCj4+IEkgd2lsbCBhZGQgYSBjb21tZW50Lg0KPiANCj4gT2gsIHNvIHlvdSBlbmQgdXAg
YnVpbGRpbmcgdXNpbmcgdGhlIEdOVSB0b29sY2hhaW4gcHJvdmlkZWQgYnkNCj4gaG9tZWJyZXcg
YW5kIG5vdCB0aGUgTExWTSBvbmU/ICBTb3JyeSwgSSB3YXMgYXNzdW1pbmcgdGhhdCB5b3UgZGlk
IHVzZQ0KPiB0aGUgbmF0aXZlIExMVk0gdG9vbGNoYWluIHdoZW4gcG9zc2libGUuDQoNCkkgYW0g
dXNpbmcgdGhlIEdOVSB0b29sY2hhaW4gdXNpbmcgYnJldy4NCg0KVGhhdCB3b3VsZCBhbHNvIHdv
cmsgdXNpbmcgTExWTSBpIGd1ZXNzIGJ1dCB0aGUgZGVwZW5kZW5jeSBvbiBvdGhlciBHTlUNCnRv
b2xzIGxpa2UgbWFrZSBhbmQgc2VkIHdvdWxkIHN0aWxsIGJlIHRoZXJlIHNvIHlvdSB3b3VsZCBu
ZWVkIGJyZXcgKG9yIHNvbWV0aGluZw0KZWxzZSBwcm92aWRpbmcgZ251IG1ha2UgYW5kIHNlZCBm
b3Igb3VyIGJ1aWxkIHRvIHdvcmspLg0KDQpJbiBhbnkgY2FzZSB5b3Ugd291bGQgcmVxdWlyZSB0
byBpbmNsdWRlIFN0ZEdOVS5tayBhbnl3YXkuDQoNCkkgYW0gbm90IHN1cmUgaWYgcmVuYW1pbmcg
aXQgaXMgYSBnb29kIGlkZWEgYXMgeW91IG5lZWQgc29tZXRoaW5nIEdOVSBmcmllbmRseQ0KZXZl
biBpZiBpdCBpcyBub3QgYSBHTlUgdGhpbmcgc28gLi4uLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoN
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCg==

