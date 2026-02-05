Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGBhIqSGhGl43QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:01:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54290F2298
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221847.1529962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vny2i-0001aa-9G; Thu, 05 Feb 2026 12:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221847.1529962; Thu, 05 Feb 2026 12:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vny2i-0001YO-6V; Thu, 05 Feb 2026 12:01:04 +0000
Received: by outflank-mailman (input) for mailman id 1221847;
 Thu, 05 Feb 2026 12:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vny2g-0001Vo-Q3
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 12:01:03 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5718eff7-028a-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 13:01:01 +0100 (CET)
Received: from DUZPR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::14) by GVXPR08MB11493.eurprd08.prod.outlook.com
 (2603:10a6:150:2e2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 12:00:55 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::2) by DUZPR01CA0066.outlook.office365.com
 (2603:10a6:10:3c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 12:00:51 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 12:00:54 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBBPR08MB6107.eurprd08.prod.outlook.com (2603:10a6:10:200::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 11:59:52 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 11:59:52 +0000
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
X-Inumbo-ID: 5718eff7-028a-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Rqfs+kgav9CWHSpv2zoouqj/t6g/UA922a5XXIejuX7cSWxsIxDnEXQ9ie/RCIKDduxyK9d+iyOSZKPYfj27+CwTSvMzQ6C5HHtfH70/eVq4BY0hIvCTo2a1GQ0PGI52zRkymMRitPs6exo4d5jfabZabLsh7F40cR0MaKT0Y2CX2zmxC3++Rf9MrzF9cdAqZ1Oqi8ZVAQc7hIszA8c5wLWFW4nL/ju1KeELHxrI0kteyUcm5S+j5+pLqAPAq4ClJRQd/PLZj+K69bu6zszoOrrSLSWysbb6wUQtiYFb9bnXUdky2Jkkc7WC8HOgVdw3q0nRejKNDoK5z1OyKDe2Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzsWQja5xQytwL8IBW2sE1gAw6RtagMOQd7oWp97mjE=;
 b=XJvYbBx0taeZFEWPSUnok4A3LvCpnDWWnQRWmj2eE5jOhwU19Zp2cVmR7LrY8o7clfa1/ZSFF7Dos5XnXsG5yHWDdJ5o9330HxY0ot8/TYr5+1UTMMR1ej0n9eFIuwP/s+dNtTKNogeglABvHg8IxiIUZD7xGITIR9Ph1T95i0Mp80rL9Y6WIlGRWrim/wN1uYcM9ZT4eaM5ZBR0m3aUNQlayWurhyfXwxBsjb2qKJsj9FnB8sJjCTwavPQ3GyUtdjOCSbiPOvxuSB62ePdleCpwAxYw/s9e6MnXBwsVjEfwpZK7CIhT4wsE/d0s60jip4tEErMYjFJRfuHVW6rUvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzsWQja5xQytwL8IBW2sE1gAw6RtagMOQd7oWp97mjE=;
 b=n/jj6DAsFKfw6QQS7p6hEfCKbNhTRQDfns7iGpextgELPTDXDD292mGCAvJm3lIqAViaNKygFPMxQgxQpQo03nN3TW+0l3eymCcCPiDZgQo1Ave2+48xMU7i1DrzSzkNr/vsW/0k7VE2FeGYIXHaICKGIaQ3pBUiIYYcybysVao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdcjEXwwAp6jOx6xZzNUOCs1NaBYMKPwB0aR9OVCV3j8d474wCtYAosAWM0xYKZv36skEQNq2sg/MBC4xB+ueQTMgMHKRzKOhEcHd3BfmCUp9zwJ6jYDQwkOe1BsfHi/nrZ9INNfjCBaRRtYFADASFFgZWvf2/TfdQ85Xew5BQJ5EN7cyIPZYCh00HKsFXoq3c5nk1BxfNWyW+2A1o3hMq7OQY/Y71Q+npBsnkJjRNlfkJ3LeUWLH5vnuKlTx7dgEqWYj/sXuBTOYwMY+drBh936nWBYJWzchuanSFZYQyGaH4v/55Eu9S1XYSUcXsX5btDdvjQMIblyyGCJG+Ic8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzsWQja5xQytwL8IBW2sE1gAw6RtagMOQd7oWp97mjE=;
 b=VXBsq5hfs6w/00v18N2HIYiNR1xtHcVR0+6h3r5LNqyDURi4Olp1r/XDKgfU7tA/xXiBk9PTP/hJzN15qT8VGsR/dYNiia49VR5gJz20UVEDvQidyl8fm4L3Ht3AdkyQwvAbNQKJJ30wNoZuoumWPZbXNkeEmi+t6k47wczWIXI2t+5oGNTXVC7I6WEcVVlbfcqK8zZ7PFrgLcGCidjRWbwD5e/0m6PMMLYvkPml8tTKOy+vNbln8ZWuw7H7wuEIJewfrq2Dt2YsmgBuLJMw1AsV/Z9H7vDyjyGrPxYBtqxpxFGcUCYNY9Yox8tqgcslsHtxXfYJP4TWAilp07ieSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzsWQja5xQytwL8IBW2sE1gAw6RtagMOQd7oWp97mjE=;
 b=n/jj6DAsFKfw6QQS7p6hEfCKbNhTRQDfns7iGpextgELPTDXDD292mGCAvJm3lIqAViaNKygFPMxQgxQpQo03nN3TW+0l3eymCcCPiDZgQo1Ave2+48xMU7i1DrzSzkNr/vsW/0k7VE2FeGYIXHaICKGIaQ3pBUiIYYcybysVao=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] xen: Use MFLAGS for silent-mode detection
Thread-Topic: [PATCH v1] xen: Use MFLAGS for silent-mode detection
Thread-Index: AQHclpNYPLhzf1Jy6UKGKEMKa2gWarVz/LiAgAAD8oA=
Date: Thu, 5 Feb 2026 11:59:52 +0000
Message-ID: <2E85263B-38BC-49CB-80CD-3C30F37EFE4F@arm.com>
References:
 <3ab39249c788fd0463e73df9464d482fefe8516b.1770290975.git.bertrand.marquis@arm.com>
 <1a0c5e48-5457-414e-89c8-0f12cfa55a96@suse.com>
In-Reply-To: <1a0c5e48-5457-414e-89c8-0f12cfa55a96@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBBPR08MB6107:EE_|DB1PEPF000509F0:EE_|GVXPR08MB11493:EE_
X-MS-Office365-Filtering-Correlation-Id: a75b9252-2ae7-4a78-ee4f-08de64ae375b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VVVvSVE0NGJuZlVMT1ZqYkJVRjc5NStxNXNFZEdNVllmNDl1aHRtaEo0cGQ5?=
 =?utf-8?B?Vzg3YUpzMEFGZDVaNHYraVh6VG1sbWpXZVFuZUUyZ3ZUMTNOOGQ4Wm5zSTBr?=
 =?utf-8?B?TTJIcFhPaFdXQVJVYWVaYW1hYkFweEVJcG5uVVhWNkRiemNpVzlBU1NoVG9H?=
 =?utf-8?B?NEtKQ013d2pWeGJ1RHZMblM5NENVNnBiOWg0eWo5dHpiVjBZT3c1bkw4QWNM?=
 =?utf-8?B?Y2dSNzN0a3lLQW5xd0FHa0F3dHVvcWdlMWZaTFBpY3NJVVVTMXhzNUhCU2Y5?=
 =?utf-8?B?N09TbmNLUGNFVVVzYnUzZ0tHK3lGVENkYXJhNzMwdzRBZ3FSdXhEUjdsb1ZR?=
 =?utf-8?B?ZzEveW5Na1c0WlZRWGwvRE9lcmdHUzBTbG51SWNWL3I0YmZHM0lFcFdOYjFK?=
 =?utf-8?B?VjczNkM3ZEovNkM3NCt2RUFYYmh3bmphRWVIN21FNWdpdVZQaUpaNUtkb0RQ?=
 =?utf-8?B?NkhNcm8xMzN0bkZsekpwdHB0K1dzRzZEMFhBRmkzZEhlRUpsUnA2cTF1NDNu?=
 =?utf-8?B?V2I3RkxrV0ZIZUJjaHpSUjVSSFRCTWlublFodW5mdThOVVJoR1kxTnNsTStT?=
 =?utf-8?B?SkdQYWlQLzlWRVJCTGh2ditVbTAwY0ZydldRY05iYXk3Uzl2bWlyQXFLZGM5?=
 =?utf-8?B?VDR0clJDZUZpMmsrWm9KbG1ycnRYcWZNT1hSYW5XemF5QkhwVllIYmxlc1pU?=
 =?utf-8?B?b3V6UTRLcGNFaUxNaG4vZlpqRkIwUmNZYmJabTRzOVI3dHFTK1N4ajRDU3hl?=
 =?utf-8?B?S1RPcFpNdjZBUVgxckxNclBVckJaRnI4U3RHQVEwZ05vVVJHelYyQ2ZvajFr?=
 =?utf-8?B?bnc5UW5KMUNSam1hclhNVWxkaUJmN1czelFJeXRLU0FONXM2Q2hjODl6bjVW?=
 =?utf-8?B?YjlnRHd2d21MUWs2RGh0aTIrUHZHTE5MZ0wvLzJqQUxlODR4TWVnc0RIckQx?=
 =?utf-8?B?bTVuQ2ZEYjEvR3NHNEhGSDcwODVhUU1pcmZSNGowa0tHaXpoQ2ZIK21qTEdQ?=
 =?utf-8?B?MXRJNzU1eUlrNVA0WTJqaVgrUHhPNkVOUVZDQTBHcFZzbDA5MGVRSXVNSlF5?=
 =?utf-8?B?L0ZGOXQxSzM0bUtNaUJ0VHVCOStVQUgreTlJQlo3ZGVNK3BURkg4ZTZKOFhR?=
 =?utf-8?B?WUJ6L3lDOFZuNm8xVFA5UWZuVW12ZkdzWVRQbnMyKzRpYVNkcnYrRXVuSkdT?=
 =?utf-8?B?S2NVNkt3Sk1rRFVrY3g3VGh1YWY5elYwSUlVNHhUamFmcnJlSzdGUUIydEhY?=
 =?utf-8?B?RUgzeDcwclZrVkpjQ2U3RjJzVkQwQmducTBzSmVFMWVmUTVDNVdnOHp1NU5a?=
 =?utf-8?B?N3NqdjdTRXJsV0pNZjVxK0tKeWs4ZWg1ckp2MGhRWm8zVU9RRzRvSkdPTVpX?=
 =?utf-8?B?aS9lMWRkRzV0RkVnYjFsZjlsRmp6RkJHQzVNaWQ0cEFUcUI0NE9UdEQ5RGdn?=
 =?utf-8?B?ZHV2RzM0SXBod1hPZC85dU5WanVSMjdnQmxKWlNYdzloQjNnUm5JMTJvZlBt?=
 =?utf-8?B?dk5ROGFJS2FBMkk2SE9CbE1HZTRIM0owUGlHdHlyc1AxZkNZa1VPZzlwdTk5?=
 =?utf-8?B?bWwxcFBlQ0xmdFViS3g2c291WGI3VzBpRUFKOEdpQ3N0enpQZWFwK0pNUXhv?=
 =?utf-8?B?OVlma0MxQUFmVE5LZk1FeC9yYkhOazhDRFU2dFF1TG1kNVM0R1JlZFRVUW80?=
 =?utf-8?B?NGNNTCs5WEthd0JIcTRYcHhRbGEvUmkyODkxTDRXaUFzZGZIUWtKWFgyUmZz?=
 =?utf-8?B?TG9WZWhHSUcrdWZwZzNZL3lVaWlhZlJHNVRTaXcwTktROXRCS0ZqdTlIdU5y?=
 =?utf-8?B?U3QwdVNGWURZdWFoOHVLWWZ6dlRvOWxuNHZ3VFVEMGdSQXVjVWs0U24yZ09Z?=
 =?utf-8?B?UDNjU0R1Z2QwQ3RVWXBua2hkeGRGZnlNUHpGZ1c1Y2xVcjJUajFwWmgrbURu?=
 =?utf-8?B?aitpdy9BcGtSRE1aaVFUaWk4R3ZVVVhEdUQ3MWRRNHZvdmwxdW1MOW9za3VO?=
 =?utf-8?B?YWYwZU51bVRlQnhtM3VCTHhYNlRnN0F4R3FnT0dubDJmaDFmMGxkeWJkWkVK?=
 =?utf-8?B?dkdlTTB2emFQb0YzcHUrMElHVDUxWTRFMjd5Vzd1YkVvUlRFRFltWlltVGVG?=
 =?utf-8?B?NmFuNXhUYXRPZEdoNlRkY05xWHBXenVhVlkxMGowd1pFUWpyaS80dm5QVjVh?=
 =?utf-8?Q?Y2Z94L86q8eOcg3hUKK54kc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <54DF35BDF8392647B97115DDA0CDD9AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6107
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d3c2c82-5027-4a0a-e6e4-08de64ae11f9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2pITGJDR2NocjhBNEJ2ZGYzWEczSTN3M01pRnZjTnZCWlBQblZic1NLVXhq?=
 =?utf-8?B?Mm4vR0RNdm9CdWNCOEEzVkxsN1BsOXJXdmhiUDZ4VXphazhla3dGU3FLNk5n?=
 =?utf-8?B?RGoxcHJndHcrRmxoeWx0NThLR3ZCbTNoRFJLU1cwRlFqQUpZYk5qaWU5dHJR?=
 =?utf-8?B?ckVyc2dEM0pKMDg2ZVU0QmNiM1ZLWm84SmhJOTMyaGdaWlh2ajJJVDRvcG1W?=
 =?utf-8?B?VjQ2eFhGelFMZXBQOXJ2WG9XL0hLZGxKZFJYVXRhQ0NyVU5sS1dud3JjbkQx?=
 =?utf-8?B?WXEweE9QQ0pUbVlXYkZGdzhBZzNzaWxYcXphY3dnRUx1WW94VlhvOVNsTWJO?=
 =?utf-8?B?V3d4SmJ2MDdxc3VzbHlsYnIzVWdpSWpGb1Q5aGpHa1I4WDgydGZoK0NJUzJF?=
 =?utf-8?B?MjJpeXdzc242Y01wdnBBTFRrSmpVNzdSNjFPSTdnVWUrR2l1b25pYzVlQnNX?=
 =?utf-8?B?aGtKbVRzN0RJUldOd3JEUmEvSm9Ha0RuY2pzK0YyWjViby81d0ZWWElvOTBk?=
 =?utf-8?B?dThCTURycHBpOVQ5OTUyQlZ2SnRPVTFuN0toajBMNnNYYXFFMStxUXNwVXhE?=
 =?utf-8?B?SlJjNlo2b0dHTHM4dFZGbGw4MkY0cE93dUdDY0N4N3FrWFJxaG9McGhaWC9G?=
 =?utf-8?B?cWRsbExab0QrNTk2emRLdEpqbmp2U0UwVnh6K2diN0h4N2lqWVh2cld5UG5k?=
 =?utf-8?B?K0ExYk9lSTQzQm1ReWhQQjRkTzNWT1RWYlgwRk5tL3Fpd3RBYkZDclN4d1VU?=
 =?utf-8?B?QmFabEh4bm5uN0dISWRTTmpBNmpXWTczNWI2OWtqSngrM2dmRFpjMjU5VEZ5?=
 =?utf-8?B?V1BZNVhuOHkySEFPdldiamtiem9pRWd0TjczNDdTTnQ1SWdkWkpkSVRYemlv?=
 =?utf-8?B?YnhoY2pjNTRYMEVodVRiR0xJUjRMU2pkeHZTYmZScndDOVc5VVF0NWkvclYw?=
 =?utf-8?B?Vll6eUhkcGZpN2VaNGhKQytzUUswMmZ0V0h4S2dyRzlHeWVaRFRuN251QW85?=
 =?utf-8?B?dng2WldkczRVOVBxNkVVWE5wRGtNdGdmdXZoMjB0QTJ1WUpOSGcrdzZ3eUlT?=
 =?utf-8?B?SWVscE84dHVVdEFyajBLRkE0YjNZS085SWJiQ2p4VXk0dTVYaDFJZ3FkTkMw?=
 =?utf-8?B?SEhkM29lSDVFVGZPUzdkNXJxTVNzS3c0TkNnc1c5Skd2S2VBOEpHcklRWXFB?=
 =?utf-8?B?ZzN4NWJZeDZJZTZwOENlY2hjTjRTY1RzQjAwbVBTbDQ0U0dzRkFLOFdjWTBn?=
 =?utf-8?B?Sm96Tm45ZWpXVjRJNHJTSktOaE1vQkVmcXJGMVlDL3BLdGwrbDU2T2xxMjM4?=
 =?utf-8?B?NW9sdytQZi8xeGFTaXFmU3N1U0ZaYzZldTdYRy9oeFVWblhWRDVGS0tFT3dk?=
 =?utf-8?B?cHRqMEFETkkrOUxIcFRZaFFYRjJGRlRiOWlzaGRpQjhhUXR4YjlhZ2Rhd2Rs?=
 =?utf-8?B?b3NjaC8raWRaY09wbnZZTW1EME1yVHhrNU0zY003RU94UmRnaDduMjdHVEdS?=
 =?utf-8?B?MUNXZzFRQW9WQVoveENsbzBRZUtGU2s5K1YwajlLOS9hRDFybkp3Qk9SSjR3?=
 =?utf-8?B?alk2Uzd3dWFjRy8zNy9MSlhjaEU1S21RRUU4N0NQNVowNThQaVVtYkUyUHlK?=
 =?utf-8?B?TE1nZHRQSFRoT3kyOWRqU3NTdmlCNmRpVU9ZV0xpcFlxL0Nqem9OUFhwMEdG?=
 =?utf-8?B?ZS94LyswNm1JWUl2T3NuM3VmN01YckI4ZnVCeFcvdElBdFh3N1FYV0V0WG5P?=
 =?utf-8?B?MC9GQ2xBeUxBNnUxMEJqbVU2QmxyMGZKc0ZIckQxa2lmcmNRVUI3a0d6UGI1?=
 =?utf-8?B?T3d6UGU3TGVldFJLTFdwblozZUt1NU8zNE5JaEE2N3lkRDVvZ2dZckpCcG9Y?=
 =?utf-8?B?U1kyYmxoSXRXVStYWnVjbXJrait3cS9MQ2dQRlowUXQ0RjRLUUV0VlZ3UmVK?=
 =?utf-8?B?MVh2Mk8wbjNKTEM4RGsrdGJjKzVmaEZTaTBzV2ZGeFBXUkJRQ1ViVU1wdmR5?=
 =?utf-8?B?dWRGYVhzQkNFMklYdlJmNkdzOTIycmthYmtvYzNqMys4aEU4d2Zwei9BbFRY?=
 =?utf-8?B?OFl1RmpuNXRBMyt3WmZNOWl5MElSczgvdHVqWi9lbi9Gd1ZrNkp2NDVqSVhx?=
 =?utf-8?B?cmJNb2JabE5YU3RHVmpuL1F4dUFtK25aVGptL1FBdXNFdlFQL0ExQ3ZXb3JX?=
 =?utf-8?B?ZTFUOERIKzhnaFFzd2g4ejRoaCtQWG13bkNTaHNwUkYzZWF4NFkvWjNrWTZt?=
 =?utf-8?B?cis4TFllWjUrazkwTkdtTVpQVExnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ojqeNyX8HL9MEerJwBYD/r5Dt5BW2sXhBK15Wnc1v1pqptPove5v6gVjzNN4fZEC4yL6cOPmNwyFAucbOK6/aVvcN0I2L3PPm9btIU/2tANermGWZmVJVUPyp4pqZaZHIb5nmC0NeiMWEHNWL3dlU/zZe/8XDa99EdIftsl6L7j0O0oJgU5xit2kqqZ005QEkKnCGg+1WSSvC5x0YwgyCHjQhqm3maTfESQd7omYmA7NKLHDmIeBwNpR+QJnOeB7tesZBWRIoaY/FLK0igtitrfJxXB8pzs7z9XAvH37ii5E+dRSGs4ftCz6oMB5d2O/J/9dVnHd3FlN/bLNZq05ODrA12XmHnrSWnlUvsP0XuPz64IKDQMVqATKdX8WFqS8jggei8Uz+fl6jTsWtcoJeYCQETQNjY7tV+4PJ1Kn6wGQhBmHilvxRlr8Ui1cV1DO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 12:00:54.7857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75b9252-2ae7-4a78-ee4f-08de64ae375b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11493
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,arm.com:email,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 54290F2298
X-Rspamd-Action: no action

SGkgSmFuLA0KDQo+IE9uIDUgRmViIDIwMjYsIGF0IDEyOjQ1LCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDUuMDIuMjAyNiAxMjozMywgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+IEdOVSBtYWtlIDQuNCsgZXhwb3NlcyB2YXJpYWJsZSBvdmVycmlk
ZXMgaW4gTUFLRUZMQUdTIGFmdGVyICItLSIgKGUuZy4NCj4+IE89L3BhdGgsIEZPTz1iYXIpLiBU
aGUgc2lsZW50LW1vZGUgY2hlY2sgc2VhcmNoZXMgZm9yICJzIiBhbmQgY2FuIG1hdGNoDQo+PiBh
biBvdmVycmlkZSB2YWx1ZSwgZm9yY2luZyBzaWxlbnQgb3V0cHV0IGV2ZW4gd2l0aG91dCAtcy4N
Cj4+IA0KPj4gVXNlIE1GTEFHUyBmb3Igc2hvcnQgb3B0aW9ucyBhbmQgZmlsdGVyIG91dCBhbnkg
bG9uZyBvcHRpb25zIGJlZm9yZQ0KPj4gc2VhcmNoaW5nIGZvciAicyIuIFRoaXMgcHJlc2VydmVz
IC1zIGRldGVjdGlvbiB3aGlsZSBhdm9pZGluZyBmYWxzZQ0KPj4gcG9zaXRpdmVzIGZyb20gb3Zl
cnJpZGVzLg0KPj4gDQo+PiBGaXhlczogNGZkYjRiNzFiMTUyICgieGVuL2J1aWxkOiBpbnRyb2R1
Y2UgaWZfY2hhbmdlZCBhbmQgaWZfY2hhbmdlZF9ydWxlIikNCj4gDQo+IEkgZG9uJ3QgdGhpbmsg
dGhpcyBpcyBxdWl0ZSByaWdodDogbWFrZSA0LjQgcG9zdC1kYXRlcyB0aGF0IGNvbW1pdCBieSBh
Ym91dA0KPiAyLjUgeWVhcnMuDQoNClRydWUsIHdlIGNhbiByZW1vdmUgdGhlIGZpeGVzIHRhZy4N
Cg0KPiANCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQu
bWFycXVpc0Bhcm0uY29tPg0KPiANCj4gTml0OiBObyBibGFuayBsaW5lcyBiZXR3ZWVuIHRhZ3Ms
IHBsZWFzZS4NCg0KQWNrDQoNCj4gDQo+PiAtLS0gYS94ZW4vTWFrZWZpbGUNCj4+ICsrKyBiL3hl
bi9NYWtlZmlsZQ0KPj4gQEAgLTExMywxMCArMTEzLDExIEBAIGVsc2UNCj4+ICAgICBRIDo9IEAN
Cj4+IGVuZGlmDQo+PiANCj4+IC0jIElmIHRoZSB1c2VyIGlzIHJ1bm5pbmcgbWFrZSAtcyAoc2ls
ZW50IG1vZGUpLCBzdXBwcmVzcyBlY2hvaW5nIG9mDQo+PiAtIyBjb21tYW5kcw0KPj4gLQ0KPj4g
LWlmbmVxICgkKGZpbmRzdHJpbmcgcywkKGZpbHRlci1vdXQgLS0lLCQoTUFLRUZMQUdTKSkpLCkN
Cj4+ICsjIElmIHRoZSB1c2VyIGlzIHJ1bm5pbmcgbWFrZSAtcyAoc2lsZW50IG1vZGUpLCBzdXBw
cmVzcyBlY2hvaW5nIG9mIGNvbW1hbmRzLg0KPj4gKyMgVXNlIE1GTEFHUyAoc2hvcnQgb3B0aW9u
cyBvbmx5KS4gTUFLRUZMQUdTIG1heSBpbmNsdWRlIHZhcmlhYmxlIG92ZXJyaWRlcw0KPiANCj4g
V2h5ICJzaG9ydCBvcHRpb25zIG9ubHkiPyBJdCBsb29rcyB5b3UgbWVhbiB0byBkZXNjcmliZSB0
aGUgbWFjcm8gaGVyZSwgbm90DQo+IHdoYXQncyBkb25lIGluIHRoZSBpZmVxKCk7IGF0IHRoZSB2
ZXJ5IGxlYXN0IGl0IGNhbiBiZSByZWFkIGJvdGggd2F5cy4NCg0KVHJ1ZSBzaG91bGQgYmUuDQpG
aWx0ZXIgc2hvcnQgb3B0aW9ucyBmcm9tIE1GTEFHUy4NCg0KPiANCj4+ICsjIGFmdGVyIOKAnC0t
4oCdIChHTlUgbWFrZSBncmVhdGVyIHRoYW4gNC40KSwgd2hpY2ggY2FuIGNvbnRhaW4gYW4g4oCc
c+KAnSBhbmQgZmFsc2VseQ0KPiANCj4gNC40IGFuZCBuZXdlciByZWFsbHksIGFzIDQuNCBpdHNl
bGYgaXMgaW5jbHVkZWQgaW4gdGhlIGFmZmVjdGVkIHJhbmdlLiBJJ20NCj4gbm90IHF1aXRlIHN1
cmUgYW55d2F5IHdoZXRoZXIgdGhlIGNvbW1lbnQgcmVhbGx5IG5lZWRzIHRvIGdvIHRoaXMgZmFy
LiBUaGlzDQo+IGtpbmQgb2YgZGV0YWlsIGNhbiBiZSBoYWQgZnJvbSB0aGUgY29tbWl0IG1lc3Nh
Z2Ugb2YgdGhpcyBjaGFuZ2UsIGlmIG5lZWRlZC4NCj4gDQo+IEhhcHB5IHRvIG1ha2UgYWRqdXN0
bWVudHMgd2hpbGUgY29tbWl0dGluZywgeWV0IEknbSBub3Qgc3VyZSB3aGV0aGVyIHlvdQ0KPiBh
Z3JlZSBpbiBhbGwgcmVnYXJkcy4NCg0KQWdyZWUuDQoNCklmIHlvdSBhZ3JlZSBhbmQgY2FuIGRv
IHRoYXQgb24gY29tbWl0LCBpIHdvdWxkIGp1c3QgcHV0Og0KDQpGaWx0ZXIgc2hvcnQgb3B0aW9u
cyBmcm9tIE1GTEFHUyBhcyBNQUtFRkxBR1MgbWF5IGluY2x1ZGUgdmFyaWFibGUgb3ZlcnJpZGVz
Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KDQo=

