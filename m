Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E389D26FA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 14:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840081.1255865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOLY-0007lX-Qh; Tue, 19 Nov 2024 13:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840081.1255865; Tue, 19 Nov 2024 13:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOLY-0007j3-Np; Tue, 19 Nov 2024 13:32:48 +0000
Received: by outflank-mailman (input) for mailman id 840081;
 Tue, 19 Nov 2024 13:32:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Q5=SO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tDOLX-0007ix-6d
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 13:32:47 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfaeebc1-a67a-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 14:32:40 +0100 (CET)
Received: from AS9PR06CA0072.eurprd06.prod.outlook.com (2603:10a6:20b:464::10)
 by GV1PR08MB8331.eurprd08.prod.outlook.com (2603:10a6:150:86::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 13:32:36 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:464:cafe::69) by AS9PR06CA0072.outlook.office365.com
 (2603:10a6:20b:464::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 13:32:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Tue, 19 Nov 2024 13:32:36 +0000
Received: ("Tessian outbound 99d3b165dfe9:v490");
 Tue, 19 Nov 2024 13:32:36 +0000
Received: from L083105c4e8b4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0EFB0671-22A5-404B-891B-62CBE2BF78E3.1; 
 Tue, 19 Nov 2024 13:32:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L083105c4e8b4.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 Nov 2024 13:32:29 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB7649.eurprd08.prod.outlook.com (2603:10a6:10:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 13:32:26 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 13:32:26 +0000
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
X-Inumbo-ID: bfaeebc1-a67a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6YzIwMDo6MSIsImhlbG8iOiJEQjNQUjAyMDJDVTAwMy5vdXRib3VuZC5wcm90ZWN0aW9uLm91dGxvb2suY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJmYWVlYmMxLWE2N2EtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDIzMTYwLjkwNjI5Nywic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dfyRdR/5iT+qBQ4+QYorYcfrHzOvVuDEZPCf+2xxzVNozrGRBLQcb6osjicXTj/g2bxkRzMY7Kuly6UrH5C9Q2jJhWQ37YgUZ0lDd/YnYERAFk+g3JADzev1YYoamddpqy6l+jImNvjzerZDInqvY6RL7qAZg52kIww6AIYPx9uyw133NPGxaJWQFogH+LgpqRenmY62ue+S4aRY8CnVXkLcZVrtJQ/Gy0yBlHi5b4KxW2x6SuB9dFl+AijxhmBZy/m519US+OUzroVNtJ/8dBtg7BvNJR5wjVOl5a72aDVilGFrtnXUOMUaG9bnyLoLmglI3pk/q2Y4ZL1N8HbTzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4tAv/7/vTZygQi185bZEXJBpuLCjoq6TJ5xuCsiaN0=;
 b=oLmBtldbHD4nBUfDDgpjmuf7hq6Na8uTmOfRi8S0DkJyXChnD0HK9BGQRBoPFqaZhj5VOWavSIB0OOFQRgvF2CPjPJ26TCh1uFcXoCNIjkZ4ReRVEHSHtydVC7wpoEoJjMmLoM/MQD4L0tYiuEJV/m3T8nLe4GU0XoLR/wKQ5b8ni5hPTbe1DUAO8NK5GSFnz5RHS+9jtZKN8KqiRrCmNR5ZSOscsiFU6Ny4Q8ytx/VY7TqUV7DxeaRDc2msVM6eTpQfhjQwei3u02sIvWdl1aitmPHBO+kZPoUadaRWnjTZaSV1nD6hoL0H+dw8DV4IW3fkNUe3OQZTR8ozBfX8sA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4tAv/7/vTZygQi185bZEXJBpuLCjoq6TJ5xuCsiaN0=;
 b=jm99m+EEdmex+CqL/0SVZNMkiAdtIE+xl+sk5DVcfcCVq0LatWfX43cINuc5raCbEumc2YVnXfA85ndnr4YsNnlmYbOCS7x0mZnp0/VdwfylyJCNSSjFzrWjDbfdleai0HyDo3JorTGAbIiVqXepuLKv8oTqH2xcUE22LErnhvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 832e815181da1213
X-TessianGatewayMetadata: X4uW1I7cMbF9uJon1QHzyk5qL107KixjdKoqfx2uUJKAB8fFq0PK6G878SOVVs912REronxjdAa2okDZZDoCUj9rH1USoNF4psoRN1WTMAIBU/G12tF0xl1GdlGm3BWt3ZYv9KzYdumQalRB9txJnkDrYufpWcqky4Cv7aH+m58=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chzRmR0fNQv0+US3UUdFtPHDw6g3YP7tcF5RfIzV40IooGflXZnFW5H8GBp1kVzLkT3nlxBNSDH5fVGedSqivvmxz4r35InWas5wFcNJBJNyIqv/2/MLssh2syCLGvl5kTNcstxNKb2iTHThgo2RgROocwPSmR7+r4mP3hUFnBHMkb5UlfCmnNgBZ0ZuTokI+kMidW1F3fF/leeyY+6HjDPiWtBPMQWNnhJLLoNG3TX5VQmhI6tmFvUYVEq/M3jOW2e0VB4iI6U3DQKczWHZG2gw0+fy4puI8gm9em3vC/8UPxmuk+seVT449CAM7Lssr2xB/xIFyvffohnfa046CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4tAv/7/vTZygQi185bZEXJBpuLCjoq6TJ5xuCsiaN0=;
 b=MD5wMDnb2KppRzv6SB+vFatTDY3rGdlPTd1gyrvmwHDHENvVTkCCSnhs3HLM78KzIX51c9lcyMlGV+1l1wTgk6DKSBl+P80EJaltePjcPGtm54sjiE5aA0vYVP52QAOqqfectbdWea7C6TwDxhnsKGYMCuKNAAB30d/2bhmY5tXr2UB8UihgDS9koZDreY+hipsfGFz8lcePxk1EmHPaSzBnO8bIx71xGwukpz7CpjPDto8sYlD3Ewrwas4DVigbgZ5DnM/xRNhjbgXKk/5fW2QcbnqOI0tI7s9TU9bKmxpybwqEGPE+rBeTzdpnTffqsE6sxKZjuaH+PMKBbg+tmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4tAv/7/vTZygQi185bZEXJBpuLCjoq6TJ5xuCsiaN0=;
 b=jm99m+EEdmex+CqL/0SVZNMkiAdtIE+xl+sk5DVcfcCVq0LatWfX43cINuc5raCbEumc2YVnXfA85ndnr4YsNnlmYbOCS7x0mZnp0/VdwfylyJCNSSjFzrWjDbfdleai0HyDo3JorTGAbIiVqXepuLKv8oTqH2xcUE22LErnhvc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] bootfdt: Unify early printing of memory ranges endpoints
Thread-Topic: [PATCH] bootfdt: Unify early printing of memory ranges endpoints
Thread-Index: AQHbOnmDmplEO1fGPki1YPRhtPoGCbK+mdoA
Date: Tue, 19 Nov 2024 13:32:26 +0000
Message-ID: <D9477A55-6B55-4CDC-B92D-3FB898DBC505@arm.com>
References: <20241119115141.72770-1-michal.orzel@amd.com>
In-Reply-To: <20241119115141.72770-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB7649:EE_|AM3PEPF00009B9F:EE_|GV1PR08MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: a554a083-3705-4e33-05ef-08dd089ea198
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Ghgryl1pCg5c8Y+dkXbBDQKdHgpO29ZLofyamu1leWVmHozzL26F6XVFrRio?=
 =?us-ascii?Q?44CsYTQ3TSPdEGww+v4TtOaXwUJiujk1mj1X1WnXrrQvw928dAoQoHwMLOO8?=
 =?us-ascii?Q?l7hkLm5m7Asl7d3444l+phu22jn+FdQFzKZnmMKmfx8OAvyxFfB0seIT7r3U?=
 =?us-ascii?Q?M/pMARMmdAS6hvtOZvG3DX0ee8qygkuz+oFBEpFhQP4Ev+piJI/YALQu2v/V?=
 =?us-ascii?Q?xsocugWcPnM/0HCIjkLVWXnrLtNFUT5dHOJ00F9t3RzlMVKu9oVZ1gAusVv1?=
 =?us-ascii?Q?iCl7cbM/FXgGlb6Zs74e7Srb52PGRnzgRMNFIXONJuXTU2t0E2t+tazl70lv?=
 =?us-ascii?Q?BY3njgIhVocBJ2+H7UpxuxiI/D8QwBdny91kaPday3kOUJRqd8a2Hawq3Ibx?=
 =?us-ascii?Q?FkgLrTXU6aurlqjHKsIEgPZUkadqSJZ551gCXF+sOT9dePt1N4rVqzuLjE9J?=
 =?us-ascii?Q?LzkCWaDM0njGNJSipTWrReCNRpdIXt37rV0UfAePfdcjpXnXUs6IrIi4csEG?=
 =?us-ascii?Q?2MXhQ6bwUq0eZrYNSApg3rAMc5+CYKrFDIdeyj6vkH8sHNtQNmOOGQScBA+V?=
 =?us-ascii?Q?yFVXJpq2ZY4qyT/Jj89Rhi3q7ZlhqvhRJv2Ew9Ek4tpBh0AbyGQiMNumwtWS?=
 =?us-ascii?Q?o5krXVVxwgXEfcrJLe9IyRGpHh84CLfcBZwk102Li4WhIXCbo6rysebpT7Yl?=
 =?us-ascii?Q?8YZg/vcsEqRxtP+SseyS9PBVkNx3HIms5FTOlOC6lG1cCNY7uRdBb4gCH0HX?=
 =?us-ascii?Q?im1OWDb0wCMlEvg6B9w50MYeBP3sbmD5bMeUa9mCQG6PElqhdEIwfUFxSLVT?=
 =?us-ascii?Q?SyXA2ZPEQxIq3xx7PtBd9IOVn2fxwEE37VRWpCkCK7BNTlfplH3Y+c3nqINS?=
 =?us-ascii?Q?BL8XUEhy4Vg2eoC1k6JYq7+MMtr63EuPEjRxoB/TktmA0mfnAype99mBBr5J?=
 =?us-ascii?Q?YgAgzivRKPTdwJrBk0RUIKwGynxQ3eRRi6iPQvvhru8ZXZCN0r8mroFuvTHQ?=
 =?us-ascii?Q?odOdKqLbaOL16wG9AVnzw3puFTRywuVkrT/iiPmtjQk5zINeUF+KcSgUtTa6?=
 =?us-ascii?Q?EoWq3WsumZg7zC2klP8wdBBu9x6wqxVes2biYgETwOD6V9AOti3KDh+CTLSi?=
 =?us-ascii?Q?cWtSuGFzJQid3cBk8RXGCdB6/vGWpTo8EoK81yY1YC3fkoyzxZiiODhH1QtF?=
 =?us-ascii?Q?Zn0u6BYcE8owXRF3n1anqYKeqEQviGFJORZ5KZMDsM2nGUaUEmIY21dRmEqZ?=
 =?us-ascii?Q?JUhgf0uatDg9QQ0PeLKrHuMiwYS8MCgb4AP7AZoYO77u3sTMSXUvQKp1cLbV?=
 =?us-ascii?Q?Lz5LYHaxMlfGp51vx2EH4aPq9LI+4htqJYk/uh9bvRzjZ6TK0MvbUGhT5Jg1?=
 =?us-ascii?Q?s8+Qfcg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8DE6C0171103C8408C2D66A7AE821C55@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7649
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44bb05c4-8d6a-42c6-9c26-08dd089e9bc6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tvLn8/8kV+YqmPVS8W5I/mdungJuiT92pahaFO1nKexanu2uckfloIOJviWi?=
 =?us-ascii?Q?qT6pjmu/YiQ8vleJ2thp7dqVJ9piHR5SH3cF4wKqaVUYwIByzCHrLJRhc6PC?=
 =?us-ascii?Q?WR15jIGlf70W7g2vcfl7Mzk9abMX0b8eUxeUlySp1eY1Xi4S4J3UXgHSES+c?=
 =?us-ascii?Q?XStr4NDOGflODisBRTSSdSwmz9jfp+15pFOWp6xZhyhCTCN0wAOypdqkMADE?=
 =?us-ascii?Q?E7oNY0BndKEsN2lVklkIa2zhbo0KLfNyynsY9x7cQtKaou9NOMpp5RhfBpj8?=
 =?us-ascii?Q?QsSRZG+2nvdhT8FjRddUO3o14U0cK/Pgul5mHCBUcICpBya3WuoB3KaQ7qQM?=
 =?us-ascii?Q?HnAtrd3vu9ZsA3nAok54Wh5SBq5jVkyLGcSs3WM0C0kzblM8v3f+AFsjlM/C?=
 =?us-ascii?Q?Vdv5zoApwtdtX610nu3rrIUcHrG/iKhNLpiueMJnPgMXkn2tpLryxf6kukP/?=
 =?us-ascii?Q?qZGaV0g/zVqRuK3uw/6SRU5qtJwGPOKF887S2smOYiyGk9eqm/ZDtLKj2F+E?=
 =?us-ascii?Q?z+KBrtl65qZ/UIIS87KcppGS9S3LD0Le4VSzCj1hRaVjcvksTAF0Rf88zual?=
 =?us-ascii?Q?8933OIrSbx4Ul4yx4upeSPgPxMcQGrXjRtqg2qbCIWMmzWN3tvZwNbiyiw1l?=
 =?us-ascii?Q?MZYodjeJ/dBGVrm+g+t+UAEQTnp+6r0NbXDOlsTC16odowpcjUUE55VCzaF2?=
 =?us-ascii?Q?QhTezp5n0cU1beL6/Lyn0RGBh2h58eAPr6PSsDM5dnbz4phWuV+/vE1J097O?=
 =?us-ascii?Q?zkb3nrcaHGrAoMyjz4SsfydhR/p62Zp6qnbhxXe5RuxqsPucrTth2YOSAj6a?=
 =?us-ascii?Q?iZykudoYm6AM8DyI9C8GTtIigd0lOaQF/iE218Dh4EAIChsMCkqvwRnSYjta?=
 =?us-ascii?Q?igDGVzHwml/QcOXb6HnMByWONR+7QGWzEn3ANO+PzoVWx3XOmDy55Mmn5yDx?=
 =?us-ascii?Q?IxFlgFaaOYpbXxl+dxsVxVg/20otH6ogzt6dL3wC+MsftutOhvL+t+9J6Itu?=
 =?us-ascii?Q?iIdMIJtPyE5uGnnw8oeqSdhW8d1WRLb7wDSpRzBsT762V94JLJzbcU/GYm6M?=
 =?us-ascii?Q?fB6VnKb8t8ogXi8l9mCldqX/PdEP043UAIIdmRRX+CHrFbAjynF4N7JeaZ3d?=
 =?us-ascii?Q?32yLHwQKO7Tvct7+7xm/eYl8FWB6AeYW2S7NMzu8BOpbsUGC28dYBeUXKD1d?=
 =?us-ascii?Q?5KKT7PlD/xUMClWx4W4z6rUnSY2fbiNClp4Q6+t8wTOi9ZfEz1jaLQY/0DOs?=
 =?us-ascii?Q?GR9A2WpqnY5rPc2/wzpBHnAvIKrSQdECRbxA2ZOv61kkQ+K9cWtOPqVzUQCb?=
 =?us-ascii?Q?Ayir095b4aK66QhG5f8r5W3nix5MsrQShqncmStyO653zj9ThNARhEiQYve5?=
 =?us-ascii?Q?s3JHfWp0RvjmKrK/9/Z8/6XhN41eBzQZLOtIOIky/Ew8XiXcLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 13:32:36.4959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a554a083-3705-4e33-05ef-08dd089ea198
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8331

Hi Michal,

> On 19 Nov 2024, at 11:51, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, when printing memory ranges during early boot, endpoints
> of some ranges are printed as inclusive (RAM, RESVD, SHMEM) and some
> as exclusive (Initrd, MODULE). Make the behavior consistent and print
> all the endpoints as inclusive.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Looks good to me!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Outside early boot there are other places where we print exclusive ranges,
do you know if there is any general style we should apply or does it depend=
 on
case by case?

Cheers,
Luca



