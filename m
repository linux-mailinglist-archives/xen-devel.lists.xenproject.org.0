Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF99D9880
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 14:26:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843728.1259345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvaE-0007vm-Nl; Tue, 26 Nov 2024 13:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843728.1259345; Tue, 26 Nov 2024 13:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvaE-0007tH-KM; Tue, 26 Nov 2024 13:26:26 +0000
Received: by outflank-mailman (input) for mailman id 843728;
 Tue, 26 Nov 2024 13:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuIc=SV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tFvaD-0007QJ-82
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 13:26:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f403:2613::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 060f82cb-abfa-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 14:26:20 +0100 (CET)
Received: from AS4P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::11)
 by PAWPR08MB9065.eurprd08.prod.outlook.com (2603:10a6:102:332::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 13:26:16 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::4f) by AS4P189CA0023.outlook.office365.com
 (2603:10a6:20b:5db::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 13:26:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Tue, 26 Nov 2024 13:26:15 +0000
Received: ("Tessian outbound 02553984e049:v514");
 Tue, 26 Nov 2024 13:26:15 +0000
Received: from Lb1ad3b11f78d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61108D7A-9EBA-4D4D-B0C2-062119AA7E6D.1; 
 Tue, 26 Nov 2024 13:26:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb1ad3b11f78d.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 Nov 2024 13:26:04 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PA6PR08MB10419.eurprd08.prod.outlook.com (2603:10a6:102:3c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Tue, 26 Nov
 2024 13:25:59 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 13:25:59 +0000
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
X-Inumbo-ID: 060f82cb-abfa-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjMwIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjA2MGY4MmNiLWFiZmEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjI3NTgwLjQ4NDA1OCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RKWYxGUrftUkAXrfOQvm0vANjSLhqA6ksQXKQF8VxoG++TH0s4BxabHlHgCgMcYtUsCW2vOHoxvrCq6h18lrkrpv8B0RniyJS583a7Zwvxr7feDbkAvfHfkXhS7QA5wYgJJOQloNMcS/p/HHR3Sul8/gmJ3JRuBWVc8J9ZTZS8F0+BcaSXEnrH8BA1vOeK8VJA9pJB3ThC7i4Ix9dXGkWJUW9CjPwdZmYwLyX5Rd1o2h37dFEJRY0PxqqBSRpWOEI3iMk36G4BHBRtFUdLDNo+cvx57ywpJro3k4H84vr5PUR0IP91gU+6VJ3SWCMMDBWMbOxya+OVoi6BAInwj6Pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF12mdFPRycqPo7kSem9k2ZQ7xAP9QoZLPj9I1A8qok=;
 b=vtTwppB8kw+FDJgS323WQ/Mfm34hdxRJRCj5qlaZ0YuP7Uihytsk4nV1hdqYfzF6r+gkNUUwmmeGkBR/sRFah8UiQFJQsum2KJ3wvf/psBYHSvHol+sFeOLBlfwc9tjMYFn9AONLq6IO7Mn1f04JeoRRq+EyyI3lByhbOQJo7542DBqmnpgr79u/2AbLzrKa11X9spaRNVYz0eOlVZvu8E4+yzX2brZeGQK3jvOoUC3NkMH2ICTf4iWz/6Am5ulOccdyjovc1YNZg/HJwQUrlUA3Yi9xWsWtMxMpU+diOPlBdOBkSngf0k6hRYSXkzgQBeWtueYEw8nqfdyHKZpMyw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF12mdFPRycqPo7kSem9k2ZQ7xAP9QoZLPj9I1A8qok=;
 b=Fir8MTj5wyPzZ3iZ1zKHY+U/Zl2CS8QOKFrmbM8rj9gEnnpiWjje0UhBQBSHDLImMLRJ32AO7VZ4VHJBxZHfx6SNZLbZcVYM7i8yXaVYrF+OCpp+8tyTf53JWRBZBgBsPie4at/4VOWyIVe+kmHkkYmAX16MciPNxD3LTax5WcM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 132b578908f662db
X-TessianGatewayMetadata: sNt8+hzguNfLKt/soRs0FNu1kyo2pZz2FqxMTtXJF+RKQIliocndmJiXFBDCKfLEUX0dkhuEa222sz6A1KhAoVay5GLAar6MsIOqGASFWLwAZaloVAj0MsV295N60qUqMn2sqDABHcGva3sipEVVrxBzfPFPbFEBb3cgx4sNPHg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Suqi0kYHXobYoiJLpadZ3+Rsn+dsldbq0xumXqOJK3eEH1ZUv0gHeXSabl7ei+Wk5oZ6UycbQfHBUI/ObOdkmrIr5M4WhH2UhVQ0NT3lBcVB7BJx3vX13uclWl1QfVBPfd6QasGOdUEqaO7ioYNj0pxPES9radWVbwbuWhXELT7pogpmtmpeLDm3ozXVYGq/7/A2RIJxN40XKaK1NnxHzE5nqPZkOTIlJUE0twLMjqmNO6ZzdM8YMtN5pIXHQWytCuWZkPIJ7HbObf0dmF/PAzd+svSySqBui4Hg/z7/FOvcP2JkPaOUkKQSdlOKassxsSg5akhaZ19i9ZP9bK7ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF12mdFPRycqPo7kSem9k2ZQ7xAP9QoZLPj9I1A8qok=;
 b=FPXv7Y4hcmeQMOdW1JgoueNSlf3cFU/bpnb33cO8Gk0Oqd7Dom/XGQIKHTe24aagcVnvucovZZQiFfgCwjf6uGqwM9A9i20gm760O3qD6MTPi+G4DzzAMsJ/7pIL/Xi8j1Sgtr0XPxfS9FaFGSxtgzAJ8g4mohE7BkWpGvky4T6aLkaepYOV1xreIbkmeqYHKsxvFjttaxQJ+Ku+DBM8exiq5mges4JWuWBB6OWRUGYPkQYRb0mku5dmmeCXXQ658+hwGvVzE2kIcZ1h8+BspiBcEjiM/9w+AT+nPZwdyhqvb48I5jBSsgAlAt5yDQprMiuocs9kPtoP7ZZ4P0RRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF12mdFPRycqPo7kSem9k2ZQ7xAP9QoZLPj9I1A8qok=;
 b=Fir8MTj5wyPzZ3iZ1zKHY+U/Zl2CS8QOKFrmbM8rj9gEnnpiWjje0UhBQBSHDLImMLRJ32AO7VZ4VHJBxZHfx6SNZLbZcVYM7i8yXaVYrF+OCpp+8tyTf53JWRBZBgBsPie4at/4VOWyIVe+kmHkkYmAX16MciPNxD3LTax5WcM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Thread-Topic: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Thread-Index: AQHbOmE/JeWd4mQRXU6E1FRNAbLoQLLIOm6AgAE0ZQCAAAS3gIAAJQWA
Date: Tue, 26 Nov 2024 13:25:59 +0000
Message-ID: <7761CEB9-2304-4588-9ADE-C81B9A5E536C@arm.com>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-5-luca.fancellu@arm.com>
 <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
 <BE895863-B07F-42C2-BD44-D0A1E6150DC4@arm.com>
 <e5f0b9e4-80ab-4cf5-8745-4cb83cfe4c7d@suse.com>
In-Reply-To: <e5f0b9e4-80ab-4cf5-8745-4cb83cfe4c7d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PA6PR08MB10419:EE_|AM4PEPF00027A62:EE_|PAWPR08MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: 86bcbe35-9b4b-4ed0-6763-08dd0e1de796
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MFRBaStJeG5uYzIzRXJpd1V4TjVoT202b1BPTEw2NzRxNndLOFYvS2VTaFJ2?=
 =?utf-8?B?cWFxY3pJL25XdkRESXhoZnd6aEF2NjZwN24vdk53SlAxWFR2NzJVd1RYRi9v?=
 =?utf-8?B?SWZScTJDYlloYmhWQkIwbTJkS3NmTXlkekxBVld5VHh0UmFMSVozNXg3NDRi?=
 =?utf-8?B?STZzeEZRY2xibHBJSlA4L014SFlsdzFrVFp1TXdlbjhJOStxUjdGblZCWlVk?=
 =?utf-8?B?MGNrS2t3VG1QaEFxM2QwelEyMzY2cFF6Vi9DWVRybDd5YUJONEZmYlhLRkw2?=
 =?utf-8?B?NXdxS0xsVjBjQnEvTVlJRnBEcFJPTlhzL01vamQ4cjB6RVcxRWJEM0tocUIy?=
 =?utf-8?B?SWMzcDkwV3FOZE02dzdDR1Ruck0vMm9SQUFmVnlqMkJhNmFXdTkwMzdFc0hl?=
 =?utf-8?B?SDRsNWR5Q3liZzdoYkFSS2NFY0gyR1NBa0NYVFlXWnpmSzRSck5XK2VMN0dH?=
 =?utf-8?B?UHZWc1VMTDA0UXpVYXNBQkovQlJUY3VFZGJxOFA1OEdCQ2xacnlaeWZCblFM?=
 =?utf-8?B?YUFJdzRNRHhaMng2b1ZQeHkvbk93NDQyQ0FkR2tGcVh3QWp0SUgrbTdWZzRL?=
 =?utf-8?B?NW5lNUhGcGNwTk1NbXVmdnNEekU4ODNLU1hGc3lMbmp5dlRURDhtU2J1TGxL?=
 =?utf-8?B?RENmam9USnJqbDFuc0ZDU3VpWmFxcnZ0TjlNanM3N2E3MnlnOUJsaUtjN2pH?=
 =?utf-8?B?UFNidlltbWVheGQyTWcxYVQ3OUFZcWErZ2dsc3pzc2VJcTJ3OWFaNStBdlVH?=
 =?utf-8?B?VWcralVVT2hXYkJnRzZFYmI1UzJjQUdlcDA5U0Z6eG5mRm1mVElOSEdWbnNo?=
 =?utf-8?B?NEYxWWxJOGZDamtTY2o0MVhYa0R2S2hGSWJpaWdXYmsrYm5Fc0JuTHBRNHAz?=
 =?utf-8?B?NTlVUCtXcUs0Q0dNNVpDYWlHSm9MYktYRWdaUDRBOU44bERSRk91NnV0TVRl?=
 =?utf-8?B?OEZOVE5LOWVwUDFwVEs2L29xYnhqQ05OeVlnRnM1aWU0VUlnRlVwMFB4NS9S?=
 =?utf-8?B?V1h2dWF6djFiN0I5R2QwWGYyeXdCYzd5eVdHQ05zSGhyL0RKV3ZQVTQwZUYy?=
 =?utf-8?B?YkpySkFSVTNERklaUTN5bzF0L0dVR2FDbDIwdFhrN0F6bXB3K09KZkFQR1lz?=
 =?utf-8?B?U056QTZ6U2JMUFVDQjA0QjFZRFByWlJYUWlmb3RJYzl5VFNnNW5uZHVlRExm?=
 =?utf-8?B?L2M0RHdFQThqWk9aelJURHQwK2kwdkJCcGFZZGZhUkNGSmI3ckYwMldpMFAy?=
 =?utf-8?B?VFNEeEJ6R1I3OHV0SUVOeDd6Rmh3ZkhqMDBuZTI4VFo0NHdnVVVUWHBHd3hk?=
 =?utf-8?B?UEpMcDdvZU9jZTVTUXpjeFg2SFVOckFqTC8yb0pZcFlQbEF3UEdlb3YxU2Nn?=
 =?utf-8?B?QW91Q3BDYUU2RWFRVFhHeURUQmdWY1BzNFJqbjhzRTA2R3ZpdWVYV2dVM2xy?=
 =?utf-8?B?eTZXSld3M3prT2RmMDJpSktoV296YlFQdXQyVENHYkdraFdYZzR2ejhKVFZy?=
 =?utf-8?B?ZnRvcUlldWZQSkJLL2ZEdFg3ZG5UYmJJcjA0K2tBNEQvczcwOWFnbTJhR3Rl?=
 =?utf-8?B?U1k5SDFuZW83UGMwVExOeFFwVDdIa0tMOFJGZjM1Vjk0NmdGZTBEcGlsUUJX?=
 =?utf-8?B?MFltVVJjOWxqakNocnRrWGxsYzhveDlRNGZ0T09LcndaNlUvQ3ZhSWU3L0hI?=
 =?utf-8?B?RmxUMWtWYStOVWQzTXp6a28rQkVLK0hwSWZldnN0R2I2OVBuTU9ndlE0Nk5k?=
 =?utf-8?B?UlFsNWpBQXlObWhQaVE3b2xsWlJsWnNqRUN5L0xNM2JockNoYXJ4Zi8vdjdZ?=
 =?utf-8?B?VThKb1RVODk2WDFjaFFpa0J3UGplTjNJSUFLUXFzSlNmdWV0K2wyblorMmJT?=
 =?utf-8?B?VE11VnNoSVh2S1R6MzFjeGJBUFhGaUdnZUdRRkoxQlNXTmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <75709E559CC3034DB8D8E9480D80552F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10419
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ff5c5d7-48f0-4b9d-c0a9-08dd0e1dddc0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFdRTmNWbmgyNmpNUVorU0xTMEt6cThBYkJYUzBRS2FYR0xwUnVVTXNYUDBT?=
 =?utf-8?B?bUJFS0pYektLUE9TdmEzTy9JSW9mYURxRnVJUUxncTJHc2JHMFlGbHpTRmJi?=
 =?utf-8?B?bnBaZERjWUZ2WlptQmpaZ0lsMWU3MkUrZE54cmEzbEhxeWpBSmxaUFM3dFp4?=
 =?utf-8?B?THJOa3FyRlY2Yy9IbW5MZStjOUpwbzF0QkZhMHNabmpPUi9tWlF4NWdUUU1m?=
 =?utf-8?B?V1NtdnpPR2xJdW1tMHNSQ2QzVmdjZjRYc0p1b2p4Yk8zVWR5K0JqVk13ejlB?=
 =?utf-8?B?NENFSDhmaW05aytycWNRQ3VvZ1hpY01LN2RBZDRIQ3V1ZC9vVVV3M0UyNEd5?=
 =?utf-8?B?TzdYWk1aZkF1NEtER1VqNVBHSW1McU16NEgyNWVDUGt3M2V1NDg1SW8wQ2pC?=
 =?utf-8?B?RkYxWklsczArWm52cnQ3eEJhNmFScUtaWWlLSkxQd2RjbVp2TGQ5aWxCUWRM?=
 =?utf-8?B?WU1TQnBTTVdqQ3RyN1ByUHEySUpCVEI3TmYwbWhHRVJVRXpxZ013dm52YnE4?=
 =?utf-8?B?UGJGbGNkTmI4QWIzU0YxeDh2ZGRyOGcvU1F1MlpjY0d3cUhaNmJTUnB3eFp4?=
 =?utf-8?B?UUhrRzdCeWZUdUxUMVVkL0RndmVDYXFyRS9lM2hIbGdEa2Z2RlhHem8rRVJq?=
 =?utf-8?B?dGZGWStKaERiRjlxT2Q2Tm1FcG1BSlNQcmMyQlZFMlA5aEJVNUhERlhodnY3?=
 =?utf-8?B?MGpOczZKU213SzN4Z2YwdXBsTURMYlFTeWF3ZzZiQWdoM0o2K2w0Y3BwaFJj?=
 =?utf-8?B?dzh0WVRkYUpDWnJRdXkwaVVxYVhqMzhXbmQ5VDRoTFkvcnVIaTdFWmVaQzNo?=
 =?utf-8?B?bSs1UXJRaGMvckhTTGZFcTIwbXJkd3ZXRTJ6T0UrOHF2WWVJUWFnd3N0KzRP?=
 =?utf-8?B?eC9Lb0pCQnNtdUhRMGJ0TzV1OWQyb1ZJSjF0WkVRVHljaXpYcnNTaGU1U2dU?=
 =?utf-8?B?OXJlYnV4Q2Y5dlpWK3dnQjJhWXJpM3FVczRWcCszZGp3bFpkTVZKcjVvRnky?=
 =?utf-8?B?MGhIUlFwNFp6c1lJQUttMWtuN1BVb1doMnRXc2tGVkJGOHJycWxiMERWb25E?=
 =?utf-8?B?VXFTZXBHbkoyNTVlV3RJWGI1blZQL2FtUmpKYWR6Zmg1R1JObGFOMzJxQjc4?=
 =?utf-8?B?UVdMOUNXRUdrTXBBdEFCMEV0ZzdaYWFpUnMvOWFmbExLbms3U0x4RUJDVXpI?=
 =?utf-8?B?TFhubXlycmoyaGRmbGd4ZTZOcCtZb2kwNlpybE81NURZa1BPbVZlWG5qLzJz?=
 =?utf-8?B?Q01qaVJQR3lpUUxvdzBwRkR0M0UrZEtza0xlUnBLTDNrN1IrMldoQmQvSnB3?=
 =?utf-8?B?d0FKSDVmY1FzVkNYMUlNRStDOXNmNzA4c2J2ZnlKZlBreVZXTEkzUlI5L1oy?=
 =?utf-8?B?RUJnRzg5NkJWUWlENWVNaDNEckEwamtYNEJEbWNJdERwVG9ua0VmOVdacS9Z?=
 =?utf-8?B?NUhvU3BJTzVqY2dJS3dDWFNtYW1pUVVIeDJLQm9SSjZHVzljc2ZsTnpSeG12?=
 =?utf-8?B?QUFWeWl3SGRKRnpPSjVLNWw1RmczZ0EyYitiZmxFWFR5V3lxS3EzZ05zaTJn?=
 =?utf-8?B?SFI3ckF2ZElWUmRwZjZQT01XNlRBWGV6MWhEa2puV3VJbEhQWlFCcmFRdVI3?=
 =?utf-8?B?azAyd3BacEdWOVppV1lzVHVhQUEwRzdmM2hRcUZUTDhiMHk0WVRLYlpHQjBl?=
 =?utf-8?B?TTNDZy95NFRmTllheTR5c3Zwd1JOLysrbzkvQ2k1T00wSGVzNThXajhzMVNq?=
 =?utf-8?B?Y3ZxdTZGNTJlVk9NQ2NReDBQTStaTEdwVm1LOEFVZmpVSkRaR0VEZld6RFNS?=
 =?utf-8?B?Y3VhUVZpUG5sQ2F2bzJIUmZ3cS9mTUxsVC9FRkVrUzBDbldwcmRvSnA3NUhk?=
 =?utf-8?B?eVMxQzlVQjhGVXAzQmg0NFRGQlR3TXNIeU1DVzhtV0RVeEhyb1lMTUlsOEs3?=
 =?utf-8?Q?7sZXMNPfgFLetFV5tAUPwtnG+Xmh1q54?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(1800799024)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 13:26:15.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bcbe35-9b4b-4ed0-6763-08dd0e1de796
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9065

SGkgSmFuLA0KDQo+IA0KPiBUaGlzIHJlYWRzIGJldHRlciwgdGhhbmtzLiBGb2xsb3ctb24gcXVl
c3Rpb246IElzIHdoYXQgaXMgc3RhdGljYWxseQ0KPiBjb25maWd1cmVkIGZvciB0aGUgaGVhcCBn
dWFyYW50ZWVkIHRvIG5ldmVyIG92ZXJsYXAgd2l0aCBhbnl0aGluZyBwYXNzZWQNCj4gdG8gaW5p
dF9kb21oZWFwX3BhZ2VzKCkgaW4gdGhvc2UgcGxhY2VzIHRoYXQgeW91IHRvdWNoPw0KDQpJIHRo
aW5rIHNvLCB0aGUgcGxhY2VzIG9mIHRoZSBjaGVjayBhcmUgbWFpbmx5IG1lbW9yeSByZWdpb25z
IHJlbGF0ZWQgdG8gYm9vdCBtb2R1bGVzLA0Kd2hlbiB3ZSBhZGQgYSBib290IG1vZHVsZSB3ZSBh
bHNvIGRvIGEgY2hlY2sgaW4gb3JkZXIgdG8gc2VlIGlmIGl0IGNsYXNoZXMgd2l0aCBhbnkNCnJl
c2VydmVkIHJlZ2lvbnMgYWxyZWFkeSBkZWZpbmVkLCB3aGljaCB0aGUgc3RhdGljIGhlYXAgaXMg
cGFydCBvZi4NCg0KQ291bGQgeW91IGV4cGxhaW4gbWUgd2h5IHRoZSBxdWVzdGlvbj8NCg0KPiAN
Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2Jvb3RmZHQuaA0KPj4+PiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vYm9vdGZkdC5oDQo+Pj4+IEBAIC0xMzIsNyArMTMyLDYgQEAgc3RydWN0IGJvb3Rp
bmZvIHsNCj4+Pj4gI2lmZGVmIENPTkZJR19TVEFUSUNfU0hNDQo+Pj4+ICAgIHN0cnVjdCBzaGFy
ZWRfbWVtaW5mbyBzaG1lbTsNCj4+Pj4gI2VuZGlmDQo+Pj4+IC0gICAgYm9vbCBzdGF0aWNfaGVh
cDsNCj4+Pj4gfTsNCj4+Pj4gDQo+Pj4+ICNpZmRlZiBDT05GSUdfQUNQSQ0KPj4+PiBAQCAtMTU3
LDYgKzE1NiwxMCBAQCBzdHJ1Y3QgYm9vdGluZm8gew0KPj4+PiANCj4+Pj4gZXh0ZXJuIHN0cnVj
dCBib290aW5mbyBib290aW5mbzsNCj4+Pj4gDQo+Pj4+ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19N
RU1PUlkNCj4+Pj4gK2V4dGVybiBib29sIHN0YXRpY19oZWFwOw0KPj4+PiArI2VuZGlmDQo+Pj4g
DQo+Pj4gSnVzdCB0byBkb3VibGUgY2hlY2sgTWlzcmEtd2lzZTogSXMgdGhlcmUgYSBndWFyYW50
ZWUgdGhhdCB0aGlzIGhlYWRlciB3aWxsDQo+Pj4gYWx3YXlzIGJlIGluY2x1ZGVkIGJ5IHBhZ2Ut
YWxsb2MuYywgc28gdGhhdCB0aGUgZGVmaW5pdGlvbiBvZiB0aGUgc3ltYm9sDQo+Pj4gaGFzIGFu
IGVhcmxpZXIgZGVjbGFyYXRpb24gYWxyZWFkeSB2aXNpYmxlPyBJIGFzayBiZWNhdXNlIHRoaXMg
aGVhZGVyDQo+Pj4gZG9lc24ndCBsb29rIGxpa2Ugb25lIHdoZXJlIHN5bWJvbHMgZGVmaW5lZCBp
biBwYWdlLWFsbG9jLmMgd291bGQgbm9ybWFsbHkNCj4+PiBiZSBkZWNsYXJlZC4gQW5kIEkgc2lu
Y2VyZWx5IGhvcGUgdGhhdCB0aGlzIGhlYWRlciBpc24ndCBvbmUgb2YgdGhvc2UgdGhhdA0KPj4+
IGVuZCB1cCBiZWluZyBpbmNsdWRlZCB2aXJ0dWFsbHkgZXZlcnl3aGVyZS4NCj4+IA0KPj4gSeKA
mXZlIHJlYWQgYWdhaW4gTUlTUkEgcnVsZSA4LjQgYW5kIHlvdSBhcmUgcmlnaHQsIEkgc2hvdWxk
IGhhdmUgaW5jbHVkZWQgYm9vdGZkdC5oIGluDQo+PiBwYWdlLWFsbG9jLmMgaW4gb3JkZXIgdG8g
aGF2ZSB0aGUgZGVjbGFyYXRpb24gdmlzaWJsZSBiZWZvcmUgZGVmaW5pbmcgc3RhdGljX2hlYXAu
DQo+PiANCj4+IEkgd2lsbCBpbmNsdWRlIHRoZSBoZWFkZXIgaW4gcGFnZS1hbGxvYy5jDQo+IA0K
PiBFeGNlcHQgdGhhdCwgYXMgc2FpZCwgSSBkb24ndCB0aGluayB0aGF0IGhlYWRlciBzaG91bGQg
YmUgaW5jbHVkZWQgaW4gdGhpcyBmaWxlLg0KPiBJbnN0ZWFkIEkgdGhpbmsgdGhlIGRlY2xhcmF0
aW9uIHdhbnRzIHRvIG1vdmUgZWxzZXdoZXJlLg0KDQpPayBzb3JyeSwgSSBtaXN1bmRlcnN0b29k
IHlvdXIgY29tbWVudCwgSSB0aG91Z2h0IHlvdSB3ZXJlIHN1Z2dlc3RpbmcgdG8gaGF2ZSB0aGUN
CmRlY2xhcmF0aW9uIHZpc2libGUgaW4gdGhhdCBmaWxlIHNpbmNlIHdlIGFyZSBkZWZpbmluZyB0
aGVyZSB0aGUgdmFyaWFibGUuDQoNClNvIEp1bGllbiBzdWdnZXN0ZWQgdGhhdCBmaWxlLCBpdCB3
YXMgaG9zdGVkIGJlZm9yZSBpbiBjb21tb24vZGV2aWNlLXRyZWUvZGV2aWNlLXRyZWUuYywNCnNl
ZSB0aGUgY29tbWVudCBoZXJlOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L3hlbi1kZXZlbC9wYXRjaC8yMDI0MTExNTEwNTAzNi4yMTg0MTgtNi1sdWNhLmZhbmNlbGx1QGFy
bS5jb20vIzI2MTI1MDU0DQoNClNpbmNlIGl0IHNlZW1zIHlvdSBkaXNhZ3JlZSB3aXRoIEp1bGll
biwgY291bGQgeW91IHN1Z2dlc3QgYSBtb3JlIHN1aXRhYmxlIHBsYWNlPw0KDQpDaGVlcnMsDQpM
dWNh

