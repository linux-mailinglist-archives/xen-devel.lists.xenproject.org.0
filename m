Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E1F9DC2CA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 12:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845963.1261274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGz6k-0002jD-RT; Fri, 29 Nov 2024 11:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845963.1261274; Fri, 29 Nov 2024 11:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGz6k-0002hg-O9; Fri, 29 Nov 2024 11:24:22 +0000
Received: by outflank-mailman (input) for mailman id 845963;
 Fri, 29 Nov 2024 11:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aowa=SY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tGz6j-0002hY-AB
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 11:24:21 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20609.outbound.protection.outlook.com
 [2a01:111:f403:260c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78f5678e-ae44-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 12:24:18 +0100 (CET)
Received: from AS4P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::11)
 by GVXPR08MB11153.eurprd08.prod.outlook.com (2603:10a6:150:1f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Fri, 29 Nov
 2024 11:24:13 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::99) by AS4P251CA0007.outlook.office365.com
 (2603:10a6:20b:5d2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.15 via Frontend Transport; Fri,
 29 Nov 2024 11:24:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Fri, 29 Nov 2024 11:24:12 +0000
Received: ("Tessian outbound 75f654e2c9bc:v514");
 Fri, 29 Nov 2024 11:24:11 +0000
Received: from L8fe880de0d3f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BA1EA09-8B53-40C1-AAAD-E86D3F00AF50.1; 
 Fri, 29 Nov 2024 11:24:05 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L8fe880de0d3f.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Nov 2024 11:24:05 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS2PR08MB9475.eurprd08.prod.outlook.com (2603:10a6:20b:5e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 11:24:00 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 11:24:00 +0000
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
X-Inumbo-ID: 78f5678e-ae44-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwYzo6NjA5IiwiaGVsbyI6IkVVUjAzLVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijc4ZjU2NzhlLWFlNDQtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODc5NDU4LjYyNzI3OCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rEIQcGrgdPsigwCzfaoumglQE4bsuOw+8dGNGzrRTT6YbSZFlMFJKAzn6qFh/3bOqhkisAgOsu2NCQZog8zbWN+yIDJQ806KfWIflQSa0vUVnnpX5R0weZvLe4eYSlTZfeCUlPrkPbPmHYwR0ERGnaj9Ko3UGKRoKFgIonLF6zKoMhQSraT7d8krfOTT7eZRLV8Xkow3ahoVwBysn9jJiU6WLljH9yYzHkwT/WdtwPZGY36F6W8jz6AEOTH66VUHbKmdMGEzfxLRnqkN6MxiZPkUYIltdDYHjR/Hd/g3RB1OfzNwvucu2SffxOzgj9M4g7Lc0LL+gO6K9HU3lZOrtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEaVoGNlz0JdoRaalEiKBwAzNlsZ2/DAclO3zeuwz/Q=;
 b=HV+yfeusjPkOABHivg5eAxCpx7vBXAJvRh72hYI9xJ7XWGfAy4ARbZyWdBRw4phdR4SogL0GjzP9bAezgBG1oG1P5AHHrUzsfouApfW5udeOeS8bAV2bQ5Jjdd/F+UxmVm41LY6F/HoHPJK1jUG2Fh88CBxlV7WezTY1bySzV9H2u8rpK4YQVTj+yX06NOIr3uuaCrNJBocprlAvSUuhNoWdGAdmNlUSKooXNi4jj/h+fcCgS7KYEZJK/WhNkFi6ycjDx67K4y4/HKIqI5zxVu0Ylvoe5Felns03tdn4OLQt7CJqNaYyt9lt/nLInIZCq1ETEYw1FY1QWodEsdxe7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEaVoGNlz0JdoRaalEiKBwAzNlsZ2/DAclO3zeuwz/Q=;
 b=pY2yqMZKnKD6iApeyU+EnEO2xWlGmhzV3ZHLvnAU1gLFPMxBJIdaRaj3mpDjcHm1yYOxB2stgwtRlfWvU5beBB5kgSsKZIfhSeCNSxWeqhE1DXFXPZd9S9Pjhl0EoDwYxglu+orGwPcyt0vVO8eerdZwNh6ZGloNWwst3kMCCYk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2cb74aa7ae78258
X-TessianGatewayMetadata: VG41z9mFKenH8R6H0ZL07p7CCZH4GRCVtgMAYWDVeJfUel2rMYGxMrwnsFDZS4WbuSpjfItCy1L+Ik72ZHtlwsTUaVO1nhC0sSA2o7I4gGxsEAfRq0KjWWIcBTiRv5jtzKdZDW1BfWOx92JBLXzjfEA1c2TkKa3IZGUSvgOycGo=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRbqkRuhDuE+Tto3XkSbjkiaKMsQDcpFox12sLHXsce4XpGkNw9gjsAto4HDNkPL/QWOO45j1OgI4kAfz4TND3L3AhrnaPH+QwQ+b2CuPt28WL/vSNAPGJsvg/ihLSgZRnNLrX1HjzRAgU6CsL4wJRtjEElMCPour88a6rsRIBEVCKsiSqCcRTCtjajdreFTPulNnpSeiOVdkJOqw4Xo/KsisdO55CTRfFFrqXfDFQfyFqFfblZTZWme4b4/ScRBngMys7KWGN4RvD8pMrgw9UVs1ABWIglnQRps2uyD1srNvRzOclrhgEqeXg2bKDm30R+Vd+KkpykFMI97O40xcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEaVoGNlz0JdoRaalEiKBwAzNlsZ2/DAclO3zeuwz/Q=;
 b=Nht0of/M1gmwgbj07zf9k25mYGx6YlNC6hyBUsQj9HEJbKuTg63yK2mgWo5veuwl8Ym4/p2RMwYk+bUQRanuu9bcluEDJJ+TD6Wz2bgON/80KdGHrA+WsT5qT1o9FGz1aR7Ty7pCfGbRjMIFRpKzbAY5NvR45VMXz/nTJzHYYiYdzKQe0ga5Mrbg+sqF0ByqZMnCEkH+vx3xOH224+v3j6ZGzig993INdG+Youv1nUUjWdkE8WMNDLxTFx5TiLuVWF8L74ofv+7rMBgIgykLLAq2MYlmTosjHQTYz4grw1therGym4WUEmghXS0JPPBrqmfVjL5TVE5dyRwm5gJmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEaVoGNlz0JdoRaalEiKBwAzNlsZ2/DAclO3zeuwz/Q=;
 b=pY2yqMZKnKD6iApeyU+EnEO2xWlGmhzV3ZHLvnAU1gLFPMxBJIdaRaj3mpDjcHm1yYOxB2stgwtRlfWvU5beBB5kgSsKZIfhSeCNSxWeqhE1DXFXPZd9S9Pjhl0EoDwYxglu+orGwPcyt0vVO8eerdZwNh6ZGloNWwst3kMCCYk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH v3 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbQj8EJeBBpea3PECsMrqs79+q+7LOGRaAgAAB8gCAAAJmgIAAAE8A
Date: Fri, 29 Nov 2024 11:24:00 +0000
Message-ID: <1D005260-5BE7-4C10-A65B-7F6418A0E7CB@arm.com>
References: <20241129091237.3409304-1-luca.fancellu@arm.com>
 <20241129091237.3409304-2-luca.fancellu@arm.com>
 <63022d0b-5761-4392-8280-fbfca8c679f7@suse.com>
 <52FD5E2C-A620-486D-A648-5F34531B2681@arm.com>
 <b064a441-4f46-4a2e-bc2b-965548242820@suse.com>
In-Reply-To: <b064a441-4f46-4a2e-bc2b-965548242820@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS2PR08MB9475:EE_|AM3PEPF00009BA0:EE_|GVXPR08MB11153:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ec5fc3-286c-4482-8dba-08dd10685981
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bHpJY1Q2U3M3VmczRGRSUEhnOGYzMkI0MXc0RUxXR3FWdldkUUp0ekc3Z29w?=
 =?utf-8?B?ZGpqcWZRR1FTYWUzbHNRL1VUUkR0V21CSE52YVR4K25YKzZ2enNURWNNQVNN?=
 =?utf-8?B?alY0OW0xM05abmI5bWg4STc5RHJ1VGxCZjd4KzJBcEZ5QkRXTDBaY1VhY0JC?=
 =?utf-8?B?bDFxeFl6aHd3WnFNeE45VXd1V2czTDV5aGRpZkIvZGhIS0tQMVJDaUNtTXQv?=
 =?utf-8?B?MStkTFZ0WENkbUZBbWVhTVVQZjZsK09HSXVXNnZ4S0lwMVF5SFNCZ3NCTzA3?=
 =?utf-8?B?c0wwamhyV2VVR0RmWUNnL1pBMmFXdzRmS3I0YmRmUy95OTgyUjBZMkJORGdC?=
 =?utf-8?B?QmhyTWN0bzVGUnJ4R1AweGJObXhzVlc3K3Vzc2R0aGxsRndVdjhoN3I4cTR6?=
 =?utf-8?B?UnJwZFd2TFFReFB1cTMzTWRSQ0ZzTWpPZlpSNUZsWTdZaFM4c2U5bE8rdEdK?=
 =?utf-8?B?WWFjd01mUXJBMTNKeHU1SW9sSmVSOFBuNmw4UVdLazZuV0IrNXRxVE5NOTVs?=
 =?utf-8?B?WHQ4UCtRUE5Fd2V6OEZoNjNZc1piZitROUlsbEhRMHZrb1V0UWFXaEZwbTNp?=
 =?utf-8?B?a0xtQ2JRb01KaHVzQXllTjBJZU5TMk9PYTA2b1JkYzRXTXZaaUZ5SEVHcWZO?=
 =?utf-8?B?aFFaTm9MY2RJb2YwTVZBcTYvUmZPc3NMNG45amVERUQwRE1NUXFwYlV0eHJt?=
 =?utf-8?B?b20wZFVhV3VISVhWVVFuTDBNbnBFL0NmTmRjNkxlbXljUXloN2VoeUtIRUVK?=
 =?utf-8?B?WWhKVVBBWVJ3TDV5K1BpVnRUL1VDS2hyMG5XSEdNcER2bGI4bkFtc1J2QklX?=
 =?utf-8?B?SGpIZVU1ZlgxWFZNbXRIZVZTU0tOdXU5QkN2dnBpeWtyODkxNjFOYTg4VmpI?=
 =?utf-8?B?WTA0aXdRTEFtNnIzdjJxOEdhU3lvcUVOcVBmenF2ZFppeHpBd21NWkY1VERt?=
 =?utf-8?B?bFR3N2ZKclUybC81MjFRejFwb0k3NWE4ZjVrME0yTmpBQkV3MWYzZkZHRSs5?=
 =?utf-8?B?TjRjZUtFS05CVnNoemxrVE82aGNBZkd0U3p5cHhLU3ExTEV4MDZXVVFOSTR1?=
 =?utf-8?B?VGxNT3FEU3VkdmVFOFJCUnU2VmJwa21sVGNBWkY1dzBENEZBSkluOHczSmJs?=
 =?utf-8?B?Y2R4TUo0REJOdUJlLzhZWlFFNUQ3b1lOdzVjZ2w2eUQwMmNwQUIraEhycW1T?=
 =?utf-8?B?TUxheTZvWEV2K0xTMVVxeDFyM0EyY3huUURrbXdjY1k2RjJIbWZBWk1ESHds?=
 =?utf-8?B?YkZ5Sm1nbU9xaWRFUHNCaEJscVhncWo1RTU4YTNqTVhSNldKSWpFUFlES2lK?=
 =?utf-8?B?V2FGQmkyb3FPVnJGVjZ1cFNBckZXazZPdjRyWXJqemc4cURFYTc2dE1EV3dT?=
 =?utf-8?B?OU9mdnRQVngwaDRrcVpJUTdycHJHbm04QlM1ZVhQWkRWS0d1eTNveHhEMUkw?=
 =?utf-8?B?K1RWYzQ2Q2tLS3VFdVZKVDUydDVFVVNjUTZIMTEvM2hrUjhjbkc3RVhPT3Er?=
 =?utf-8?B?a244a2RSR29uZWtLZzlGNzdyOHAvT1ZJQTE0L282elBIeSt1UXR5c0wzblBh?=
 =?utf-8?B?a1c2OUw5Q2tSaW45VTJKZHNBRlBRaUNwMlZQdWlGNmQyZnJESnYrODRMbEtF?=
 =?utf-8?B?bDl5VlZqYjhTSjNpeGNia1h6Q21rbDFzZ25JbG9PZlB1Zko5dzNOeTN6L0hu?=
 =?utf-8?B?QkZFdjNvSVlvMUdMdCtkSTZzN3VjSk0wcHFjME1HTTFPY3E5UDNRejlYZmVm?=
 =?utf-8?B?clVjZS9vUGJMdzBkMWNGS296dzgyM0drVnVnTi9XSHRJR0FOVGdHT1VsanNS?=
 =?utf-8?B?KzVaSHJ1MUZjSklZOWtNa2RmdWRNZlM2N2sxNXBaL29DVXpkTDBhOXFaTW5T?=
 =?utf-8?B?NU44ZnVqTTFNVDlwTXJrZWhKSU1SWlFoNUNtNFBWSDVHTkE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <21E6291230DC194D894D4AC2D162EC99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9475
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd588c42-7a38-4ee9-29bf-08dd106852d8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0ZkWHlUV3I4UkJVZmozemVILzVxNWNrTWw4U0NFMTA3Tmt4ZFFsN2xtV1lZ?=
 =?utf-8?B?a3VmM2dKaWlRM3p4OWp0alFpRmk3NDh3c0VvK05PcXZ3WDBUeFZZMkFzVmpt?=
 =?utf-8?B?Z3YxWjNXNE43eFBtODFneUxWUkZSNTQxenpmdjlzQll6ZzVHNHlVR3Q0bUpP?=
 =?utf-8?B?Q0pvcXJWYy9BOVpyUGttZzJkWGpDUFlTeDhBUXAvaXZoR1hyUHg2QVBMUlB1?=
 =?utf-8?B?VWNjdkVXcm55dDZGRkxVOTJVbEFqakpRVWZLVUhFbkE1akxrbjJIaEppSnpJ?=
 =?utf-8?B?RHpVZHl3M2d0cU5zZGI3YzltMFZSRlNWRWtoaE1XM05HTkhzQzltWEMwNU1V?=
 =?utf-8?B?VHg4UlRVa0VsaElDLzRGVkQ3RWRnejNyTDZqMkVsYXlFdUU4bnhMSy9wS0xT?=
 =?utf-8?B?VXJGYzEzSU11dUFpVmpOVWlVSjU3QkN1d1hmejRhL3g0MG5VOWFYeVFjK0tM?=
 =?utf-8?B?SWxpRVlNYXdaZVAzb3dnMlVvWjg0ZUQ5eG42RG9WdWdydlBjRnduN3BEdFFX?=
 =?utf-8?B?UWhRcG5RVEN6d1JpUFNRMmQ1a0dETGNKUEhNWUFmSWJpOEZ0eHRrZ2NWK3lB?=
 =?utf-8?B?Z1AvemVRelRONTdHbEZuWDcrWm1hRkpOYnRlZzRjRmcyTkIwUHlxWWd1Y2ZN?=
 =?utf-8?B?MVdkYUlwYTBlS2h5THhiUng2dHRSblZ0UlU5TktKblZwaEZidWppR0tVdTdL?=
 =?utf-8?B?QzNsUDhRR2R5ZTRrdEtmNUUrVk5TYlVOdDZtSnJIVW1QOXBrcCt0ZXJENzNL?=
 =?utf-8?B?Q3g3RXp4cTZ6K2NSUURMTVd4RnNLSEtjREhyOXlXcWVzVVVmTFZyQzZTTzla?=
 =?utf-8?B?YW80eWJYZUQ2cEVvdjNLS3dtenFIWHFtbGlsMFprRUxOZ3dJZFlTSHBreDZN?=
 =?utf-8?B?ZWVwc0xGSUJObDJVdHUyTnJZVENJUFA0RExvV21QSHBwcmtvRXNDSFgvbjRJ?=
 =?utf-8?B?Tlczcm93RkxhcmNlSzJkVWJDaVdnQ1pTYkFib25IWmFWZWRDUjFsMFArTTBL?=
 =?utf-8?B?aDRiS0laZmRvNGdHam1aWTFMeVZKOWFTSE1yT2tQenlncXNUNnlWT2ptSG9D?=
 =?utf-8?B?UkU2ZStDazhRcjVSeEwydGxBeG9UQ2wwYUZKU0VHYkhXN3ZGNGg1a0JSTk93?=
 =?utf-8?B?QmZ3RTlPbDFBbEZ5QUNiRFRvY3ZlT2lrdzdUbHNXZTJxcGdNOUtZQWI4Vnow?=
 =?utf-8?B?ZFo0SmttUndQRTd1blp1YXFGQU5reHJkOWE4eVpwSEFMdW16OEJBenIzc1RC?=
 =?utf-8?B?d2YwblhGOTVwdXNSYjF0dDZiVEhGVTN2THV6V3RYK05aRldDazFkSUtCLzBQ?=
 =?utf-8?B?UWhPN3Z6ZkxkU1pNVzBaTG4vbjQ3aHhIdEY0N2xwcDJ3Yzl1eFFKZ3doVFYr?=
 =?utf-8?B?QUo3UXRha29uNXZhZ2ZlN2NIK3hvVFlhVXhTb2ZORXJaazBXYXYyZEptYkt2?=
 =?utf-8?B?VjFDKytpZ0JVT0pKK3krQjZKRnFyVFV3LytsZEIyVERhSkxtY2pScVMveFVl?=
 =?utf-8?B?VmZPaDZhK0pueG5TaTJJb2JDcHZka2xPd0N1WFpHaXN6bjBaSmVBUFJXb1A2?=
 =?utf-8?B?SFJNdVl5MDBXb09valZGSWpmRmRuU2ZLRFkzMFZsRmE1dkJ0dExDT1dDOXVt?=
 =?utf-8?B?UlN2UzdSTWZTMjYxVmY4UmR2Q3hMdGxublAvYVJxMVhlTHNJTk5HM0xadFF0?=
 =?utf-8?B?aHVncWREcnZjL3hiYjhKRHBIaE11VkwwUmpjSVRCNzlSbGlFK0x5cVVYZzlG?=
 =?utf-8?B?K0xucWxXN2tvWkVaaDhnbCs4cmxvaFFBRTJ5MHFZOWNsYWsxalBuYTUyWlRa?=
 =?utf-8?B?anROU1hEd3lJT3pRa1o1ZzdFcTlrUk5lQUNOZjllMUU0T0RSV0xyMlBZQnIy?=
 =?utf-8?B?SEpjTUpXdWE2NmxGMDYzcVpibGgwR2NJcWI0WEo4dHZ0bFV4Y3kwQ2c5aGMz?=
 =?utf-8?Q?8QQxY45u1C/IJiki7wCmuuMMW3ibaWSt?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 11:24:12.0315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ec5fc3-286c-4482-8dba-08dd10685981
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11153

DQo+Pj4gDQo+Pj4gSnVzdCB0byBkb3VibGUgY2hlY2s6IFdhcyBpdCBhdCBsZWFzdCBjb25zaWRl
cmVkIHRvIHVzZSBzaW1wbGUgI2RlZmluZS1zDQo+Pj4gdG8gZWZmZWN0IHRoZSBhbGlhc2luZz8g
V3JhcHBlciBmdW5jdGlvbnMgbGlrZSB0aGUgYWJvdmUgb25lcyBoYXZlIHRoZQ0KPj4+IGRvd25z
aWRlIG9mIG5lZWRpbmcgdG91Y2hpbmcgKGVhc3kgdG8gbWlzcykgd2hlbiB0aGUgd3JhcHBlZCBm
dW5jdGlvbg0KPj4+IHR5cGVzIGNoYW5nZSBpbiB3aGljaGV2ZXIgbWlub3Igd2F5LiAoQW5kIHll
cywgSSBkbyB1bmRlcnN0YW5kIHRoYXQgd2UNCj4+PiBnZW5lcmFsbHkgYWltIGF0IHVzaW5nIGlu
bGluZSBmdW5jdGlvbnMgaW4gcHJlZmVyZW5jZSB0byBtYWNyb3MuKQ0KPj4gDQo+PiBZZXMsIEkg
dGhpbmsgSSB0cmllZCBhbmQgSSBkaWRu4oCZdCBoYXZlIGlzc3VlcyB1c2luZyAjZGVmaW5lLXMs
IEkgYXNrZWQgaGVyZQ0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hl
bi1kZXZlbC9wYXRjaC8yMDI0MTExNTEwNTAzNi4yMTg0MTgtMi1sdWNhLmZhbmNlbGx1QGFybS5j
b20vIzI2MTIzNDQ4DQo+PiBhYm91dCBhIHByZWZlcnJlZCBhcHByb2FjaCwgYnV0IEkgZGlkbuKA
mXQgaGF2ZSBhbnkgcmVwbHksIHNvIEkgd2VudCBmb3Igd2hhdA0KPj4gSSBiZWxpZXZlZCB3YXMg
cHJlZmVycmVkIGFzIHlvdSBzYWlkLCBzdGF0aWMgaW5saW5lLXMgaW5zdGVhZCBvZiBtYWNyb3Mu
DQo+IA0KPiBBcyBBbmRyZXcncyBpZGVhIGRpZG4ndCB3b3JrIG91dCwgcGVyc29uYWxseSBJIHRo
aW5rIHRoZSBzaW1wbGUgI2RlZmluZQ0KPiBhcHByb2FjaCB5b3Ugc3VnZ2VzdGVkIHdvdWxkIGJl
IHByZWZlcmFibGUgaW4gdGhpcyBjYXNlLiBUaGVyZSBpcyBpbg0KPiBwYXJ0aWN1bGFyIG5vIHR5
cGUtc2FmZXR5IGNvbmNlcm4gaGVyZSwgYXMgdGhlIHdyYXBwZWQgZnVuY3Rpb25zIHdpbGwNCj4g
YWxsIGhhdmUgdGhlIGludGVuZGVkIHR5cGUgY2hlY2tpbmcgYXBwbGllZC4NCg0Kb2ssIEnigJls
bCByZS1zcGluIHRoaXMgb25lIHdpdGggI2RlZmluZXMuDQoNCj4gDQo+IEphbg0KDQo=

