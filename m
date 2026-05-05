Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMAKK9TB+Wn/DAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:09:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF74CA951
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300438.1574966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCi2-0002te-By; Tue, 05 May 2026 10:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300438.1574966; Tue, 05 May 2026 10:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCi2-0002rm-8V; Tue, 05 May 2026 10:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1300438;
 Tue, 05 May 2026 10:08:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wKCi1-0002rg-3P
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:08:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCi0-001ct8-B4
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:08:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f9c1af-bab6-0a2a0a5309dd-0a2a450bc524-46
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:08:55 +0200
Received: from [52.101.66.32]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f9c1b7-212f-0a2a450b0019-346542209049-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:08:55 +0200
Received: from AS4P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::14)
 by AM8PR08MB6402.eurprd08.prod.outlook.com (2603:10a6:20b:363::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:08:51 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::b6) by AS4P190CA0008.outlook.office365.com
 (2603:10a6:20b:5de::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 10:08:51 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 10:08:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB4PR08MB9407.eurprd08.prod.outlook.com (2603:10a6:10:3f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:07:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:07:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AClbXW/MN3yaIiLsO8rpPsP3rDk2RACtPdfpFHbHzQcbBe7VfUYd1gowCe9XRsANIgOMz6/MjxfXBYCi2Mf/+GFwem/Ap8NWo0zWttJsyAiUS4vWj2jML8qZso+V82WkfcOrpCC0uwDnK9jOxgINhKUCSppawgPmig7xS+w0zNdGfsrkkPjB1uZ3NDluo5KmaVN4FVRWPlL+2jWi6KOfs1fAz02lG2VnVvpQxgFnqaLgCKpJYQl3YCNugY9qWkSHuw7x+Ih+dJBYygCmMQLdrENhBzbA+ToMkG1fD1DPwHd++4BNKWgweQzB7zkmpVjEa80AQkeh72cDK/E5Zja4AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTdTpntTu8gQNXtZOEc4phtBrG77MBT7zFAnDu8JKF8=;
 b=OdG/Ezc6IGl5Awmi97rsAp16aH5P0HK2AbnDRW2fI2mRP3NlSrgqWWqCsgeAMPbN847yzMCbvBk1sv9Puo8SfS0kg0tVt0QCs9MG4aY3U3UxD0IMlUu0m92Lw0mBZtCkTF2wKSY291Eco5guWnOwfbBpfJXHx5jcYTq8nfoAW8PHIYOq5S/aVFrEPMqmPmGdUHwcZIzHHf1s6vXNEp0nwKl8iGLBR2jFKLjNTKPctYDaqV0Xcz0L0UCQ0zqkCKuwGYS0rGlZ+9ztG38cvhN+OnIfYj3ZRtYwHqDh4mKXD3VTsASIR3orVaRFanJKPJBCrNLsyG/rbKxoCdY1BMhXsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTdTpntTu8gQNXtZOEc4phtBrG77MBT7zFAnDu8JKF8=;
 b=eRzHLN108WHWuhpk75XXZQgMaFhqXOnevtwl0xsu8WQ1KvxkI7misCvf0d40c3pzCkljtRJ+RPxJfw+UsiDWemOw8RsufygQMaZp5h56VKbpwADwJJl6qUQ8b+sHOttwVErJhVeanPPxL7v2UOREDEqf1h2Uv3VRoXccrGY1UPg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9OZhFCeM9EU65Ne3Pzi8fMbzczZGhA/+ZrKeDpJPRS5wWMAJ5B+qp8o1362gYJguMZSHFDYtEc//sUiqVPj9jIu5RHNPCDBx0iaBJrHMVaBJPwld8OSOQtXXU+Fk/JzhMuZ3xrdhf00txXY+TxrJ1HPF9IZ1nXhLmxI27oDz2ujbx2eJvQoL98I7qRDhLIoOQ6TnkLMkZ94dsQYoDOdaMxt75sIxUKDMpvAoVsbj7WeAOu7ljVVX8p1gXarFUUi5xYdX264+2baA+6m4cMlG7RqDZCXLKK/hbFnkPUs6pcYDxmos5NXgFVmPjJpo42AWABu6VFrWMfMTgdX9ZDYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTdTpntTu8gQNXtZOEc4phtBrG77MBT7zFAnDu8JKF8=;
 b=VyJqXYfi0G4KmdLhMakzZZ5l7oLbBsmTL5i96fCbdFjavhwo0+odTpwQyf8NR17KByU+DrfNE3gxXOtJ0oDaNJIz7rAM2+hWd6sVQoEYq3eECu+SrYZ/dJ8xjfAENqgtCHJxR0PtOi/2/kvuZUU6z3y7FNw9Vnv4PZS/pgE4B5FQ7V36c2m2ukHwKzFtWOyg7cqZdCffrjKmELyBm5DwcGjzyIkeICAkhu23apuykEUrYtSFrhmvNfFY9JMTEctZyOJ5HFK0Luqo4Julu1P4NP01hTCytxoN0kYqVbGf6v6ZG4qboZqgQb3tEaYqc0F2xzggPH726p8Yh4QToReKJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTdTpntTu8gQNXtZOEc4phtBrG77MBT7zFAnDu8JKF8=;
 b=eRzHLN108WHWuhpk75XXZQgMaFhqXOnevtwl0xsu8WQ1KvxkI7misCvf0d40c3pzCkljtRJ+RPxJfw+UsiDWemOw8RsufygQMaZp5h56VKbpwADwJJl6qUQ8b+sHOttwVErJhVeanPPxL7v2UOREDEqf1h2Uv3VRoXccrGY1UPg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Topic: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Index: AQHc1xwXYYBcuLui0UypBKVcqnkF/bX10fCAgAeOAYCAAcPSgIAACp8AgAARTAA=
Date: Tue, 5 May 2026 10:07:46 +0000
Message-ID: <5B084D26-4FE9-4C1A-8C3A-298FB73F34CB@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
 <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
 <edfb6bc3-ad1a-4185-9966-29bb126a6b3f@suse.com>
 <F9DB9C27-810C-41DB-95DD-D00772CE4385@arm.com>
 <32eddac5-73c7-46c4-8944-99cfe970c803@suse.com>
In-Reply-To: <32eddac5-73c7-46c4-8944-99cfe970c803@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB4PR08MB9407:EE_|AMS0EPF000001A1:EE_|AM8PR08MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1552af-c00b-439d-0e40-08deaa8e4e60
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|38070700021|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 df5khPqnWXyiNqlQM0EWqZo0+gRjIhsq/VeellmqDkZZSXclFqOCYNquiBBYKYTJcRWOrRBaQzVacoWzGQqmpm7ZEKFqe0HOSpsGjtbivRJqFQU9Vx/JMQyyW/SNA89dEkfoysiuSz8CXwAvTBtf7kS/iQBdCCA2rrwvrt+i3CP27PPJnbMVqiM2d9zICpT5RSacO0WIpogBSzunRTQCSJNEMC3xf1tdzfHj7gacU8TVxOMoqsikKJ6S0kStHH8KWpMnlgDJESSjkZsnNx9oWLLWP47fs1KOhrgW6ZCsj+nBoLmEoem58x4Sr4yk8EpqSEwOjyGSKBVnvEOgbPf2LmpGVBN2T+Xz9OpjJ3SNtJvdjM64apMg1mYTEHZiKLCxlFd1NogWV5+LrODfLW3fW+EPxbMJlw+d/NwfwvbA31A8ZhtxnQPVwUFTXxbSh+6tGV/9zwjztc36gJod0JSXVxPwSMWALnJ11+JSCLaw21FoKfPJk3bS9HOL/uyRKlc8kzanWZsKoIDQG7+rU6tEVw6iqrziyK2nEfY4t8ZVD31MZfYAKJv1LOvcDpxRNi04wtbacsLEYFFURLiTQzKrGaWOHkHz7h5J49bE/i+1zwsv/nGsjnXHFhz2bij4ZO5+WYIJwjkifz0S66k33tpPnqZsGRoC18lkNpBn15gMOM/ZmiVN02Cb+YPd2McPNGjoEdL43R8J9ockFPqAnXXZCwG5kAuOJC9dCnexto9Zmq7KGaJ5/WDlV34O3Y7AQZkD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28737EC8363311479E897DE3B2501000@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 LJHvf/FNXN5REVuZOmWEI6YFhlVkj+Fc61oXsGtP4aovN92b92TfrFXCYvfCO0yJmpiXtw03egVkI7Q5aT+ZFPwUPnQiJ+UyGmhjsbEbLa34d6RybrkKtTc0Uw/OyV75AIB1O2mpeWR8kVdedxH+wSXy5ovJwlQbB6QiBQ00/kX3kVvDxgwuL4YBwtGfwbaCOc6XHaHxvyjk4OSK6kw+LIRYKjBx4hEHJmoFzWvEAk51Ech1xVOHXkdPXFyhkbXeCqJptOtKDQQIi9JtbnjUA7+tmMrb3NVTNDknK8I8LRIXgFWSqfdatbA5KZbEMyJ0KdRl3XlRQfLXMpPPxSvNig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9407
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48a3c68e-61a9-4177-f41f-08deaa8e2820
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700016|35042699022|82310400026|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	k1vqNbPm0T5qKHgQ/ETx5XNEA5X2dvbZ4tLQXLNCvLeSI3neKJ/5lkFLje8BdT9QvvaZy1zDSbSNXrF8womktWoNAi71O+XzLG6cwkxPdu6P8mUY6x/d0m0kWD5zoI75BMq5opgLRo786AyAgghQpe8Z3wxD69JQjEaj3jHBYJPVkQ0Ty5J9BSHUOtimKPpVSfXpU53LPkkcHxthm3YiHawkYQ8hWupH1hg3tgtWl7lqlFN15k5IFuIefBwafYcuYhsYmGlg8c/eiD51CYVH9ji1ni64hHBS441pE3dK+1IlsVqyHw/5kp1n9IGB/RNWINuNipY9+cRLWg+UMPXhdwsm83KIX2324CuPsTo1lrws5UBsC3y5iCJmpndAAs2OxtNmORhm5lnz0GP33GB1P3hRrXfhjTk+qIDEZf9oYbvxRouMGTDCVboMBgq25kpWpjt1p7ZQNxpvVWsKDqnF7XYBdvuPLJOj9CkwbJ0lvFrl4CIO57ZMVtRnsEuQYzABrvRKh9MoxgBp18xLFF22OAXwayOTUOENaVab7gUDsQKdmtxIQHwn3SK41X17qFxBRMjlq2OkBwDUYH9yEt1A8vFeJIIOvc4aJHX9shFhNN8sV0SFKLkLHR1q2yWxGrrbz6rno9Y+WY5YPsIxq1g2RT81qNi7Td7b4X4tGF1NCJ3r2ySR7WZMQk9MyUe7SaiZ/DosCJ8g+ypWvHflJmlsI4VrHkc1nyby+2+TGYgNW5E=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700016)(35042699022)(82310400026)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fHPLgxZJ2mg73vjgAgpUiHAyDVT+i6obdo3ub+ysS5it98VqhNDIM/JXUdB6Fr6tFRLylPUAaCTCGHIJ9Xz7UE3q6EG7A/lyaXeZ4sdc17v0TUb8mDIkgmFdiFYSCA9qbL8X9Du/+w5huNrga0CBWbNURMsM2pgLb22bEJPyewJhgE8SKV0I5Wr78jHajJ1uGsIf+rndz++3AG+983tcHh29bTzJecaHfzxtkcT3ATCp1oHeZiCAkYkBXLLZo+pIARdfbmhrQXHMXWGeJWBylDB/xq44w559EdU9NcTAIaBcZ6JbOm4AjdhGIlUMlSn1cUOJ1mNmQ30PLoTOoO7h7WirwQMo8yQJrq7ttWwHPS/M2VKETM9SVLB/pcWK81AdgLLGgueEJy2bgjlIgv7BdCLDJhdOSjV0eQgsl+B56co2MePXx4AqQePigz6NktYl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:08:50.9202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1552af-c00b-439d-0e40-08deaa8e4e60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6402
X-purgate-ID: tlsNG-42698a/1777975735-05D6FF3B-AA4C4FE1/0/0
X-purgate-type: clean
X-purgate-size: 2346
X-Rspamd-Queue-Id: 01CF74CA951
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid,suse.com:email]

DQoNCj4gT24gNSBNYXkgMjAyNiwgYXQgMTA6MDUsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNS4wNS4yMDI2IDEwOjI3LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4+IE9uIDQgTWF5IDIwMjYsIGF0IDA2OjMwLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDI5LjA0LjIwMjYgMTI6MDgsIEx1Y2EgRmFuY2VsbHUg
d3JvdGU6DQo+Pj4+PiBAQCAtMTM2LDcgKzEzNiw3IEBAIHVuc2lnbmVkIGxvbmcgcmF3X2NvcHlf
ZnJvbV9ndWVzdCh2b2lkICp0bywgY29uc3Qgdm9pZCBfX3VzZXIgKmZyb20sDQo+Pj4+PiB1bnNp
Z25lZCBsb25nIGNvcHlfdG9fZ3Vlc3RfcGh5c19mbHVzaF9kY2FjaGUoc3RydWN0IGRvbWFpbiAq
ZCwNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFk
ZHJfdCBncGEsDQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKmJ1ZiwNCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGxlbikNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBsZW4pDQo+Pj4+PiB7DQo+
Pj4+IA0KPj4+PiBOb3cgdGhhdCB3ZSBkbyB0aGlzLCBwb3RlbnRpYWxseSB3ZSBjb3VsZCBoYXZl
IHRydW5jYXRpb24gaW4gdGhlIHBsYWNlcyB3aGVyZSB3ZSBzdG9yZSBpdHMgcmV0dXJuIHZhbHVl
DQo+Pj4+IGluc2lkZSBhbiBpbnQ6DQo+Pj4gDQo+Pj4gVGhvc2Ugd291bGQgc3VmZmVyIGZyb20g
dHJ1bmNhdGlvbiBiZWZvcmUgYW5kIGFmdGVyIHRoaXMgY2hhbmdlLCB3b3VsZG4ndCB0aGV5Pw0K
Pj4+IEp1c3QgdGhhdCB3aGVyZSB0aGUgdHJ1bmNhdGlvbiBvY2N1cnMgZG9lcyBtb3ZlLiBJLmUu
IGlmIG5lY2Vzc2FyeSB0aGV5IHdvdWxkDQo+Pj4gd2FudCBkZWFsaW5nIHdpdGggc2VwYXJhdGVs
eS4NCj4+IA0KPj4geWVzIHRoYXTigJlzIHRydWUsIHRydW5jYXRpb24gd2FzIGFscmVhZHkgdGhl
cmUgaW4gZGlmZmVyZW50IHBsYWNlcywgZG8geW91IHdhbnQgdG8gZGVhbCB3aXRoIGl0IHNlcGFy
YXRlbHkgc28gdGhhdA0KPj4gd2UgaGF2ZSBhIEZpeGVzIHRhZyBmb3IgaXQ/DQo+IA0KPiBJIGFs
cmVhZHkgc2FpZCBJJ2QgbGlrZSB0aGF0IHRvIGJlIGRlYWx0IHdpdGggc2VwYXJhdGVseSwgZGlk
bid0IEk/DQoNCkkgdW5kZXJzdG9vZCB0aGUg4oCcc2VwYXJhdGVseeKAnSBwYXJ0Lg0KDQpXaGF0
IEkgd2FzIGFza2luZyBpcyB3aGV0aGVyIHRoZSByZWFzb24gaXMgdGhhdCB0aGlzIHNob3VsZCBi
ZSBpdHMgb3duIGZpeCwgd2l0aCBpdHMgb3duIEZpeGVzIHRhZywgc2luY2UgdGhlIHRydW5jYXRp
b24gcHJlZGF0ZXMgdGhpcyBwYXRjaC4NCg0KSeKAmW0gYXNraW5nIHRvIHVuZGVyc3RhbmQgeW91
ciByZWFzb25pbmcgYW5kIGNhbGlicmF0ZSBteSByZXZpZXdzIGFjY29yZGluZ2x5LiBXaGVuIHRo
ZSByZWFzb25pbmcgaXMgbm90IHN0YXRlZCwgaXQgaXMgaGFyZCB0byB0ZWxsIHdoZXRoZXINCnRo
aXMgaXMgYSBnZW5lcmFsIHJldmlldyBydWxlIEkgc2hvdWxkIGFwcGx5IGluIHNpbWlsYXIgY2Fz
ZXMgb3IganVzdCBhIHByZWZlcmVuY2UgZm9yIHRoaXMgcGF0Y2guDQoNCkNoZWVycywNCkx1Y2EN
Cg0K

