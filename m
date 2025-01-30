Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C0A22919
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 08:22:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879398.1289609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdOsD-0006hG-Is; Thu, 30 Jan 2025 07:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879398.1289609; Thu, 30 Jan 2025 07:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdOsD-0006f6-EC; Thu, 30 Jan 2025 07:22:01 +0000
Received: by outflank-mailman (input) for mailman id 879398;
 Thu, 30 Jan 2025 07:22:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fmxx=UW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tdOsC-0006f0-7q
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 07:22:00 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3525158-deda-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 08:21:57 +0100 (CET)
Received: from AS4PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::10)
 by AM9PR08MB6100.eurprd08.prod.outlook.com (2603:10a6:20b:287::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 07:21:53 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::2f) by AS4PR09CA0019.outlook.office365.com
 (2603:10a6:20b:5d4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 07:21:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 30 Jan 2025 07:21:52 +0000
Received: ("Tessian outbound d1e0abd198b0:v560");
 Thu, 30 Jan 2025 07:21:52 +0000
Received: from Lc2d2530b70a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A605E5F4-1768-4DA7-9C73-DE231B23CABF.1; 
 Thu, 30 Jan 2025 07:21:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc2d2530b70a8.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Jan 2025 07:21:45 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS4PR08MB7604.eurprd08.prod.outlook.com (2603:10a6:20b:4ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 07:21:43 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 07:21:43 +0000
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
X-Inumbo-ID: e3525158-deda-11ef-99a4-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XAehReU5zPkvJF11KJxjomRskAONyayaFNR78QSkOOTxDU9AfF0V9Zdc8iubL4SDUDvWz2z6Q/85ADBjza3onbBLSduXCOYbpwnrgAKPtH7tg/EgVPY+9s3hLLkQjoTsXkDSU8NEvj02xQ/8QNiYjeEH7/KPfWFd/GXxmW47oXwHBjsz9WI4EY26qC5gcJNHCB0slctl5aO9LsK0cioVnXeEVljj7IEwaeBjuMoggqomW8bYIVik1tAfe7YgsSF6VgLPnjoKUwdZAe+cCxd/CW3/xQRhgL1CAKO9nT/bGyN0dzpIge/Y9TsD9zhnK0OWz6ehXCf7cx9cFCSJnKkl2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S0BMp9txL7FjgpkTkifbncfjx2WDu67UFdOFlgTyhg=;
 b=e2/xzxGQtoI0RLUaMMW/BpU6uFfYsAq0dwoB+j83hT7ighgclXYvcRbQOt1FMPUoi0cAs9wxa3PU8ihj5EoORPu9VvWyo+jgGogS8QLSoku2znB9TGISUi1DCOmz6Tr+2qV3hSC2dFuhRqHa2FCQemEI8ux5zKc/hzCroLkLx7MAtJR9bn37zpRLm3HxhtJfs+Kgu1Mx9IHzyaBhQTjNCvEFL2L2GZvsZzBKosqqDGajQde0uikREEtqgk2tnY4kjfjfk6OuNZtpLwF+ym7bHrA36WIeAz19EuxD4nOpgVZpP0Hyh3LQLW5/e/aQJJYEuxJVURTygoYdd3WYO2fLAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S0BMp9txL7FjgpkTkifbncfjx2WDu67UFdOFlgTyhg=;
 b=ROU1sJnNj9rGxbimOF7iAu3MlD3JISmejluUAJ03CmHHGwg9DhdH2MGWdZW7DQmFDVouyV+SGkRKZBzTsr8RR6Xm3Ghl+TAdngHCJzT6V6eqpyk7afEYzsZ10hZJUMRU+/Vb9kbdTI4g6jCxfAOpXIQX6agRwVFOTtEKhJgnlEg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 516b003a20912349
X-TessianGatewayMetadata: m1Z7JWFBwBo68xFQxy79LtN+SX4hDlUj1zwKMTKCIy1zFHp85hfoPIER80nTWcYueIQBpPio1ruhr8i5YdF6dc9Ks4ppC2gcCTcgdxHfGdzrxrTIJp0d/lx8yUJPl3sZDbL5YVcialf0nhjZ5ZUjKkwuRwxI92aTxH0WPtozQ78=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye/k+/2gQTLU8IzSFCJBdDAHeUamfc/P7gwfCjNFaI7/BeHIwFhPNhEdllrwtXxwFbvgOPoAfuvIigfuplNshkGNdpgflGs+TRrOtBJL1vHFhDAyQSVZE/G79XKIfJrbLyq163K8Tde9PXl8CgNzuh4YJ/Qt9cQOUzrpdE5rQUaUx2lWRl5aPiHWLNGcwZzlxv5+R2yOrC+5z626kCbH+Bzf1wsC+6p+toPwqxykol1ISZfo8bHv0La8kOsSygymJ7qaj2G7AEWGJ+BAj4Bslv0RiNG25G7+xYLitesAEd9JsGFm9m546i2Gegubfz0btaP7xD0y8YzC1j6Z9YTGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S0BMp9txL7FjgpkTkifbncfjx2WDu67UFdOFlgTyhg=;
 b=NGOVlTglHmEkwo/WFXz0nj+HkZgsOLNrtmzuua/o9U5DgqI0s4gYlG+I/yhC+vPNafcvwgr5tkNWIFXZbI6dwqmV7g6mDCd/CanOhVvp67TegQV/x/PSB0HZUxijFlsbWYJEAhVJdL+La8z3rpknzNsZp+POac4xbZdn3YuAIYIo+dDZgXMRNalYczJ9cPdhuN1EXU5hj5xEqu3KXsozH7B3uGrmPm/uzyt/8k0BJKpp1PeK65tQ15j+MzpUFMiD+1ZLAcJCGemPcqhgg1wgNPlw9Bcz3loDIVDT183aybK3GSLBLj8S1UfOQBjp62bUkf/1AzdO6bZlZzspBCdFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S0BMp9txL7FjgpkTkifbncfjx2WDu67UFdOFlgTyhg=;
 b=ROU1sJnNj9rGxbimOF7iAu3MlD3JISmejluUAJ03CmHHGwg9DhdH2MGWdZW7DQmFDVouyV+SGkRKZBzTsr8RR6Xm3Ghl+TAdngHCJzT6V6eqpyk7afEYzsZ10hZJUMRU+/Vb9kbdTI4g6jCxfAOpXIQX6agRwVFOTtEKhJgnlEg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Topic: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Index: AQHbZr2QpA/avZzDqk6Vb2qnMvbcCbMt+LgAgAAEYwCAAEv4AIAAuJ4A
Date: Thu, 30 Jan 2025 07:21:43 +0000
Message-ID: <E622E957-FAB8-4A09-8994-074A30CFE42B@arm.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
 <CAJ=z9a1ynFU86ac=1Q7i=xSNh2bjnZJ3+tPjsjWvfw7294n_NA@mail.gmail.com>
 <E930B9A0-6C32-476C-8829-7FD4C991F4A9@arm.com>
 <CAJ=z9a3dqKDzPN9w_b5EnA+zOdezvBg0SQL+3aiNt9GhyU40bw@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a3dqKDzPN9w_b5EnA+zOdezvBg0SQL+3aiNt9GhyU40bw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS4PR08MB7604:EE_|AMS0EPF000001AC:EE_|AM9PR08MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: cbca83ec-5541-49f7-7c86-08dd40fec51d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?KzlVbVptN0g2cmFILy9DditqWUxhRmdDZkJPUWk2bC9xdHBxNm94YzRwNE1i?=
 =?utf-8?B?bTRLbkNaanQyUm5mZE9ZczQwMjV1UjY5N0FLOGI0amNuR1JvWEc1bzFlM05w?=
 =?utf-8?B?ZnZlL1BPSFcrQUZ2Sy9OMCtoL3BJK1FUSnN5dUk3eDI5TkY5bGJYZUJmZkVh?=
 =?utf-8?B?R3dmd0NrS05kdldsbTZyRlhvckQ2TEo2U1ZOTnpmdWE5MGl3MVBWVnJENGxr?=
 =?utf-8?B?S0VacUo1N2RGV3RmWnN3OGF6K01UYTRQZXIrZGZnZVNhb20wMEZtaHNSODV1?=
 =?utf-8?B?R1RWTVZ1RktreGRTQmxRMVdrb0E1RjVtQ29Kb3NMMTVHcnZnN2M0cWk2Rlpn?=
 =?utf-8?B?UUplaHoyWTlkVmZJa24wNGJmTzV3Ukh6YW5SMmJyNXhvVDI5NXZ6WHdERHZX?=
 =?utf-8?B?VDhCUjVLOFQ5L01kakJQd3o4QlovYlJDZm1ZVWdHY0wrRk9IMFgyMUVRcHha?=
 =?utf-8?B?djI3RFVrNkZuUmdQdnRCNzVQaU9uOVRabGR1U1paK3NURDJ6SHp5SkpjRmVq?=
 =?utf-8?B?ay9tZXZCaXZ0Z201TXR2S3BQTHpkYVM1OUo1bFZ1TXM5ZGh0cm9pbXFpc0VJ?=
 =?utf-8?B?TTRHOWNNR05tNVZvdi8zaDJaTWpjMkRDM3o3bmI5blBjVFlROG1lU0l6Yml2?=
 =?utf-8?B?MjhsaXVGQTJqVXNxamZ5T08zNlhTTU9MZStnM083RmJyVVlvUFcxbGMyN2pJ?=
 =?utf-8?B?ck95SEhrRFhQYStrQUxycVorYUx2dWErOXI3Wlo2M2dPZm8yalFzckh0QXdo?=
 =?utf-8?B?dkJxdFpDanl1KzJ2aDh2cnhFeWpNd3VtVUVoSm4wMy9CSjlWdmtXd1JaYnNo?=
 =?utf-8?B?TkZRZld5WWZyT3E0clN3UEU0L0dmVk1FWnNqRDFCREs0OGRSSjd3ekRZQ2xX?=
 =?utf-8?B?SWFTcVJFYjV1VHpjcDE5VTZjQTRlT1phbkxxZVpWc3h6ZTlYOVQxVFJxMUR4?=
 =?utf-8?B?UFovNTJ4c3JtMTlMVmYrSVlJVEFUS05XMloySDBzdXhKWHNYMzBnZnNscW5J?=
 =?utf-8?B?NTFuenNJejBpeHFVdXNqUDc2UUhocHBxM1pUWGlvOXFjTE1KNlNTZlpycWJT?=
 =?utf-8?B?aEJ5TjM0ZE1vcHI1NkgxeWVNc1Z1M1Q1ZyswbW1aVll5OFdTMzB6Sk91NVFU?=
 =?utf-8?B?VTJDc0VzNnRVQzI3TUdIQnpoYm1qdW1DU1FEVGo0aDF4Ujl3R0RwdTZnK3Yz?=
 =?utf-8?B?Y0thR1lOY3FINGNVV3M2THZZSjRsbkNuWHVZTmE1OCttT2R5SmlVUkJFYlVK?=
 =?utf-8?B?YnlwcmNpYUlta29BSHliNTVpbFY5Ny9vc1diOTlHbWdSa0ZqMWc4b3FWOHhx?=
 =?utf-8?B?YjNhU3g0RXlydkVRMGZvenlCUld0YlBsWko3bVpPZXJ2azFMcWo4MndEUG51?=
 =?utf-8?B?aEI4UG83KzlLWUZVenUvK25FM0xhdlVQRVhHVnJzOVFKTmltcG1RbGZ3K0cy?=
 =?utf-8?B?OUx0aDErYWJIMmJaaWR4ZldicVFSWG5jUEpaa2hoV2l6R0wyVkp1NE54eEwy?=
 =?utf-8?B?Sk5PTTJKL2RBVEs2dFEyYkd3U3VZeG9EeFVKd2dSRndaT1lheWNKanpGM2dK?=
 =?utf-8?B?cWNDQVBhMFBzWCs1dGtSZVp3RDdCVHFhbkxlM3VKYm1qZWVpck4wL3YvWlFM?=
 =?utf-8?B?eDJwaERyUG5VKzJWMWY5azZMai9XZE1OU2hpd1dTM3hDaWd6eFV5alNnQ2VN?=
 =?utf-8?B?MHJTT0VNQmhZM2ptR2Z0TmpEd0hjQ1NXeUI5aEkzZnB2U3JtMW1WaS8zWVBr?=
 =?utf-8?B?a3lQSnFZU0dlRkdJaXpXL1paRWRlSytBUGEvdFFoN203VUJHRHJkS28rWkNZ?=
 =?utf-8?B?b2lDTHlJWk9nRUl6YzljeFhCYjhIeExBaHRpVkFFQ1JJVHAxSXYzRUI0eGxL?=
 =?utf-8?B?K1Z5Rm8yNksrWEswRnRmWlB1d0J6bUMrTVM1blRRS05TcFFUREZhN0ptbDdJ?=
 =?utf-8?Q?6VEpXzm9FHLDaKkjObjygR0Qq8mIRuJd?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4ECC5C69D914446944F917A4B930277@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7604
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a01584a-b448-4c66-93f7-08dd40febf49
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|30052699003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0VtUVBmdWtYN212WDNSZG8wdmdsNzh4Y3QxcGhTSEJ0MVBXQ1VCOHhvZ3NR?=
 =?utf-8?B?dHl6U3Q1ZlloTUFiQmpUeEIxWEFtQ3hpTStOc1hOVERBMmsxVlpZclZKSytZ?=
 =?utf-8?B?NUY5QXhITFUrMFRqRFFwclZPNnloTmcvVHNGOXVsK3hhT2NHSnRjSHdVOS96?=
 =?utf-8?B?Z2tLa1V0cGxRUi9QRnZzdjZQMUhDeVlmaEZ2NmlsUzIzcU5IaVZLTnRLWnNP?=
 =?utf-8?B?NWZKN3M3L2VWaDE3YkNGN0pXVHltT2x6ZWtuK2NjbWtlS1JsSnIxbzN4K0tW?=
 =?utf-8?B?a21pS0hNNzdPclNrMFpzZUZOU2FTN2dPNW9zUVZNMzB5bEFIcjN2Z3dPT2xF?=
 =?utf-8?B?WVhmbkdqamUvZm56bE05dGRRZjZxVUFhbXlyZDZrRTVRLzlZMy96ejJGS1hU?=
 =?utf-8?B?M2RKbmxsQW43ZjVuRmwwcGVLQnZSL0pZM1VBODdjTG5XK0hkYkxTL3l3Rysr?=
 =?utf-8?B?NlZJYktNRzNtc0RqR093OEVpMG1IaS9GMzRjSEdBTnVrYUxqQTY0ZnBLOGor?=
 =?utf-8?B?RkF6cWQvRlhZVC8wWk5jTXlBYnY4WGRoT2FKcTgxaXRFUk9pWTAwdU9wTWJP?=
 =?utf-8?B?a3B3bVR1Tjh6eEVxMlZ3blpDUkk3cW1JcmlkYmVCRElBbXdkb2U2Y0ZqanBs?=
 =?utf-8?B?ZC8vOVZDUWNVcmROTUtYYTgvTk41TXJIMVhSaEtYbEc4a1RTdWw5VUR0UWpl?=
 =?utf-8?B?KzJrbVoxREZCRGhyWVZLejdDajFvdXEyZFB5UWRxTUlRWHptZFp5Z3Z6bk1X?=
 =?utf-8?B?eXJLTjhLUFRnSkRjZjhnQVhiZW5OTG5Ib3hKbjZlaHh3WFRHR3VkMWhTdHVu?=
 =?utf-8?B?VC9Jdm5tckNXNk1GaDFBMWkyS2FvUzV0ck0xTS9ZWjRHK1NuOVMzZm1DTm5s?=
 =?utf-8?B?WEU5VDUwWU9kK2lVWnRhUmtRc2tVZ0tlNCtjSEIzdHdMUndRUTNnMkVtN0tz?=
 =?utf-8?B?c1VsRzl2d2YxN2J3MGhFaG4zelJreVdwNFcyZzZWa0RLc3g2WERzRU83UjBh?=
 =?utf-8?B?Tm5nVk9WRjJKV2t5ODBsTlczOTlzb2l1czVkdm1SNzJXNG1zR0V4dEdXcXBU?=
 =?utf-8?B?VzRyTW1vSGwzSkp1VDFOSnJyalZyZ3dIUzBwYll3UzdFbUh5clIyc1pFdC9Q?=
 =?utf-8?B?Tyt5eUdnN28zcUdBcmVxNWRJVDZzNnhyVlc4OStteEJ6K2RSNHA0eEhmaWh3?=
 =?utf-8?B?SGk1eWN1L29JalJzTER6cExSTGVHRitqVjBoak1IdDBLQ2llMG9RUkppSXJv?=
 =?utf-8?B?OXg4ZTBzQXlwWmpSQjFsWUppQWIzeWdlZmR0VU1pTmJqODd0RndCMEdWYkFQ?=
 =?utf-8?B?RXUxaWh1Q1lEaE5MQnlsTnRKbXNTWnB4QWk3UlF0d2huSlZSV29CbW5nMUdX?=
 =?utf-8?B?bmY3UGFkNElUYXpDcjlvQ3BUUExDMmZkRnRwSkxnaHQ2a0tTai9HRUF1Zm0z?=
 =?utf-8?B?RVhxZVAxTysxTlNGODlqZVpXTGxCeWxZMllVMXhiMkJMQ1pBNzBEY2VCSEFu?=
 =?utf-8?B?LzlmZkFMMy91elp2SVRyWDZ1TTFxMjRuR0dNdW43eWk0WEdvT0hWT01LNHhF?=
 =?utf-8?B?NWs2N29EMTdlVGtmejZvb2IrTVZhQ0kzdWd5dHdCTUR6Z1pUUG9MZlVDRVJt?=
 =?utf-8?B?djdGY2dRYU9KdCtBSU1NN0RVeHZkUXMrK0NsOFY5enR3V2MxVktPeHpGY1Jy?=
 =?utf-8?B?UC9yd3FEVU0vRTZoRkMwOFlmVUdIajhnOEtWT3M0b1dNOTZSSUpTQUprY29v?=
 =?utf-8?B?dTZLeEt2bnRaTWthT3VTTTVwR0VXWktHa0VKT1BYSllWY09MYWxvd1IzdlZ2?=
 =?utf-8?B?K0xjWkJTUjZWRW5tNkI0S2o3eU5Zcy9BV2FsM2x0eGhUMjZDTWlteW9ULzlm?=
 =?utf-8?B?cU9tZm5hUHdyeU1UWDZjNXAvUC83WmE1VFRHZFNIV091bEN4V0lZcWx2ZXN3?=
 =?utf-8?B?blZkL3Y1USt0RkZnajF1RDFYNnJhYUNmaUE1a0lFdFJocThRUjNZaXVWY29F?=
 =?utf-8?Q?FotkiatdWpXC0+haZMGTqD3oHKUyH0=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(30052699003)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 07:21:52.8611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbca83ec-5541-49f7-7c86-08dd40fec51d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6100

SGkgSnVsaWVuLA0KDQo+IE9uIDI5IEphbiAyMDI1LCBhdCAyMToyMCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGwub3NzQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gT24gV2VkLCAyOSBK
YW4gMjAyNSBhdCAxMjo0OSwgQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPiB3cm90ZToNCj4gSGkgSnVsaWVuLA0KPiANCj4gV2VsY29tZSBiYWNrIDotKQ0KPiANCj4g
SSBhbSBub3QgZnVsbHkgYmFjayB5ZXQgYnV0IEkgaGF2ZSBhIGJpdCBvZiBzcGFyZSB0aW1lIHRv
IGdvIHRocm91Z2ggeGVuLWRldmVsIDopLg0KDQpUaGVuIGVuam95IHlvdXIgcmVtYWluaW5nIGZy
ZWUgdGltZSB0bywgbm90aGluZyB1cmdlbnQgb24gdGhlIE1MIDstKQ0KDQo+IA0KPiANCj4gDQo+
ID4gT24gMjkgSmFuIDIwMjUsIGF0IDE2OjMzLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbC5v
c3NAZ21haWwuY29tPiB3cm90ZToNCj4gPiANCj4gPiBIaSwNCj4gPiANCj4gPiBPbiBUdWUsIDE0
IEphbiAyMDI1IGF0IDE2OjUwLCBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5oYWxkZXJA
YW1kLmNvbT4gd3JvdGU6DQo+ID4gV2UgaGF2ZSB3cml0dGVuIHRoZSByZXF1aXJlbWVudHMgZm9y
IHNvbWUgb2YgdGhlIGNvbW1hbmRzIG9mIHRoZSBYRU5fVkVSU0lPTg0KPiA+IGh5cGVyY2FsbC4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5o
YWxkZXJAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rlc2lnbi1yZXFzL2FybTY0L3ZlcnNp
b25faHlwZXJjYWxsLnJzdCAgIHwgMzMgKysrKysrKysNCj4gPiAgLi4uL3JlcXMvZGVzaWduLXJl
cXMvdmVyc2lvbl9oeXBlcmNhbGwucnN0ICAgIHwgNjUgKysrKysrKysrKysrKysrDQo+ID4gIGRv
Y3MvZnVzYS9yZXFzL2luZGV4LnJzdCAgICAgICAgICAgICAgICAgICAgICB8ICAyICsNCj4gPiAg
Li4uL3JlcXMvcHJvZHVjdC1yZXFzL3ZlcnNpb25faHlwZXJjYWxsLnJzdCAgIHwgODIgKysrKysr
KysrKysrKysrKysrKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE4MiBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Z1c2EvcmVxcy9kZXNpZ24tcmVxcy9hcm02NC92
ZXJzaW9uX2h5cGVyY2FsbC5yc3QNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvZnVzYS9y
ZXFzL2Rlc2lnbi1yZXFzL3ZlcnNpb25faHlwZXJjYWxsLnJzdA0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kb2NzL2Z1c2EvcmVxcy9kZXNpZ24tcmVxcy9hcm02NC92ZXJzaW9uX2h5cGVyY2FsbC5y
c3QgYi9kb2NzL2Z1c2EvcmVxcy9kZXNpZ24tcmVxcy9hcm02NC92ZXJzaW9uX2h5cGVyY2FsbC5y
c3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLjFkYWQy
Yjg0YzINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZG9jcy9mdXNhL3JlcXMvZGVzaWdu
LXJlcXMvYXJtNjQvdmVyc2lvbl9oeXBlcmNhbGwucnN0DQo+ID4gQEAgLTAsMCArMSwzMyBAQA0K
PiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQ0MtQlktNC4wDQo+ID4gKw0KPiA+ICtD
YXBhYmlsaXRpZXMNCj4gPiArLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICtgWGVuU3dkZ25+YXJt
NjRfY2FwYWJpbGl0aWVzfjFgDQo+ID4gKw0KPiA+ICtEZXNjcmlwdGlvbjoNCj4gPiArWGVuIHNo
YWxsIGhhdmUgYSBpbnRlcm5hbCBjb25zdGFudCBzdHJpbmcgc3RvcmluZyAieGVuLTMuMC1hYXJj
aDY0Ii4NCj4gPiANCj4gPiBDYW4geW91IGV4cGxhaW4gd2h5IHdlIG5lZWQgdG8gc3BlY2lmeSBo
b3cgWGVuIGlzIHN0b3JpbmcgdGhlIHN0cmluZz8gQXQgbGVhc3QgdG8gbWUgdGhpcyBmZWVscyBh
IGJpdCBvdmVya2lsbC4gV2hhdCBtYXR0ZXJzIGlzIHdoYXQvaG93IHRoZSBWTSBpcyBzZWVuLg0K
PiANCj4gVGhpcyBpcyBhIGRlc2lnbiByZXF1aXJlbWVudCBhbmQgYXMgc3VjaCBpdCBzaG91bGQg
YmUgdGVzdGFibGUgc28gaXQgd291bGQgYmUgZWFzaWVyIHRvIGhhdmUgc29tZXRoaW5nIHNheWlu
ZzoNCj4gWGVuIHNoYWxsIGhhdmUgYSBjb25zdGFudCBuYW1lZCBYWFggc3RvcmluZyBZWVkuDQo+
IA0KPiBSZWFkaW5nIHRoaXMsIHdvdWxkIGl0IGJlIGJldHRlciB0byB0aWUgdG8gdGhlIHZhcmlh
YmxlIGluIHRoZSBtYWtlZmlsZT8gVGhpcyB3b3VsZCBiZSBjbG9zZXIgdG8gaG93IGEgdXNlciB3
b3VsZCBzZXQgaXQgYW5kIGhvdyBvbmUgd291bGQgdGVzdCBpdC4NCg0KRGVmaW5pdGVseSB5ZXMu
IFRoZSBtb3JlIGRpcmVjdCB0aGUgdmFyaWFibGUsIHRoZSBiZXR0ZXIgaXQgaXMuDQpBcyB0aGUg
TWFrZWZpbGUgdmFyaWFibGUgaXMgd2hhdCB3ZSBtb2RpZnksIEkgYWdyZWUgdGhhdCB0aGlzIHNo
b3VsZCBwb2ludCB0byBpdC4NCg0KPiANCj4gDQo+IA0KPiANCj4gSnVzdCBzYXlpbmcgImFuIGlu
dGVybmFsIGNvbnN0YW50IiBzZWVtIGEgYml0IGxpbWl0ZWQgaGVyZSBhbmQgbm90IHNheWluZyBt
dWNoIHRoYXQgY291bGQgYmUgdGVzdGVkIGVhc2lseS4NCj4gDQo+IFdoeSBkbyB5b3UgdGhpbmsg
dGhpcyB3b3VsZCBiZSBhbiBvdmVya2lsbCA/IGRvIHlvdSBleHBlY3QgdGhlIGNvbnN0YW50IG5h
bWUgdG8gY2hhbmdlIGEgbG90ID8NCj4gDQo+IEkgZG9u4oCZdCBleHBlY3QgdGhlIGNvbnN0YW50
IG5hbWUgdG8gY2hhbmdlLiBJdCBpcyBtb3JlIHRoYXQgdGhpcyBpcyBhbiBpbnRlcm5hbCBpbXBs
ZW1lbnRhdGlvbiBxdWl0ZSBmYXIgdG8gaG93IHRoZSB1c2VyIHdvdWxkIHNldCBpdCAoc2VlIGFi
b3ZlKS4NCg0KQWdyZWUgYW5kIHRoZSBNYWtlZmlsZSB2YXJpYWJsZSBzZWVtcyB0aGUgYmVzdCB3
YXkuDQpBbGwgaW4gYWxsLCB0aGUgZGVzaWduIGp1c3QgbmVlZCB0byBzYXkgdGhhdCBpdCBtdXN0
IGJlIHN0b3JlZCBzb21ld2hlcmUgImJvdW5kZWQiIHRvIHRoZSBzb3VyY2UgY29kZSBzbyB0aGF0
IGEgdGVzdGVyIGNhbiBjaGVjayBpdC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiANCj4gSSB3b3VsZCBzZWUgbW9yZSBhcyBhbiBvdmVya2lsbCB0aGUgZmFjdCB0
aGF0IHRoZSB2YWx1ZSBpcyBzdG9yZWQgaW4gYSByZXF1aXJlbWVudC4NCj4gDQo+IENoZWVycw0K
PiBCZXJ0cmFuZA0KDQoNCg==

