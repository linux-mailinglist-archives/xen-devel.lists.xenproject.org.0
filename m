Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bTmKI3Ari2k7QgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 13:58:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4E11B0FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 13:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226380.1532909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpnJV-0000us-Es; Tue, 10 Feb 2026 12:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226380.1532909; Tue, 10 Feb 2026 12:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpnJV-0000sn-Ba; Tue, 10 Feb 2026 12:57:57 +0000
Received: by outflank-mailman (input) for mailman id 1226380;
 Tue, 10 Feb 2026 12:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KCy=AO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpnJT-0000sg-6G
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 12:57:55 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cb72d30-0680-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 13:57:53 +0100 (CET)
Received: from DUZPR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::28) by AS8PR08MB9412.eurprd08.prod.outlook.com
 (2603:10a6:20b:5ab::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 12:57:48 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::b0) by DUZPR01CA0170.outlook.office365.com
 (2603:10a6:10:4b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 12:57:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 12:57:47 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB10974.eurprd08.prod.outlook.com (2603:10a6:102:46b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 12:56:43 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 12:56:43 +0000
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
X-Inumbo-ID: 1cb72d30-0680-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=V8+B5pjna9zhvmexlMEA58W95SNPoVa+FrzaKpta38WAl/+Wsp1bPMPANdEC6maFbdor/JkiKqonSsGeXz0eCEN8d0ZU5mC/o+tDgXNy1lOu2CeTUeEbWrpO9sShzai2ufbJQJAxBt1eQu3TNgGQV2WCh9oyh/FUqithIlR6macEG4DB9ZXsIXV/WWCHDiDxOMRqcvcnUaJ4y3BFlK34Lmu/JyXiCqbYGUMyNXvWrt0mCJFzeUXpJ1ZkyLf/vb23sDGceYHqDUlybk80SMn/UVpd2PKPDx4CTjIW/KT/ug7ZmJMjNmNCLhJsxqdROY1wYE5HkjHuXwwY5aAgEZ6Ihw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJnx4XfNJHMESMghr1QwrT2awZcglI5QGqVQ9GacbY0=;
 b=xviYF4aWiXJxh0CBLzMD8C6ehnfBsYowGdl6hP9QkC3LYv3/tHvEZGv9MzUIMyVSA6c8VeAOR9LxGl6zmc9POiXHxBaLvJtAQ2PMkPd5Vw4gobOkDKoUPgiUBGD9/k2OY7vit5xSLc1eBbWlsoj4fifyHZZTBWsFVH39vIhxqCFU1aLKhIQ+G3YyMH/PYxz6CSu+mwofiqkupBRDImMeCO1OLLLlQZVBEd/2PyqTTBUdlBbk9QWrSjh/D+aI6MTxKbHKIT9SvBBoCqNo7X4KdToB+7j1bxWrW/ClrqEPrGCWhzl/c5Ioi1rKL09gC1hq0sERa0JYF8vOy09I5NPJRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJnx4XfNJHMESMghr1QwrT2awZcglI5QGqVQ9GacbY0=;
 b=BjHjm7FxtUyOukN+m09RdJPpkaxHBAjCJUSkYtW/ly0WpqwY5ze/ipRXNftDg9FwPQDBEktbQ46QC4RLgyDJP5A2DKFRWrHZTWOvsRQ93NqHGOxcjjjFgbSvdP5YoYATBaqYIS3jfgfC7C4md8tbqzxQFPvaoyXShzyDl1EKWU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWF0TcSima+9URiVJCkcqZV0Mvj1MzN7wmpbuc4xUl4MJI0ET1wwgfsT7ONYY6bCVwKHq32nH8UhyxS1fbIDgy/u3UwSCmzmcgJa52pwA1X6tvh8vE/eOlNHnmE5Tf1EU2boMPFoiz2Z2pRY1aQCLOxonmLg+ouhlTShwzK1QjKrpAQzsX0OPFp/DRUV7HejQ39Htuw4bnO3FJT1n9z69LVGnDJAJvK8mS28lY1ET0RD+lT4F62MSu965pvQpZNa8NO767i3u9AskzbhLi+z/b5zikBCogHvYlbOPquQfam4LYDpXOLpT2XcZi2ezKVe8uh8vwHlTJTYmT4aow8DSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJnx4XfNJHMESMghr1QwrT2awZcglI5QGqVQ9GacbY0=;
 b=JWthQzKOEsh5QHNHbfkl0+NBmPT7bcs4p1gTeDrehXimM7aPN9cWC3voX61UokL+LyFtuJGGEhJmi9lHKGH0vx9KZVb8jSBVD908n/cZiUgdhcXnJ3YFvPKwvalUR85xe/goaeMol3vPjAoC70U1GKpoPirIOJXybjNcitoZ3DhCqSVoiwD7a94DV5cY7C1SoUpzMIvL9Av27odKmFY3wCZs3xsOGAgMV4lT0UggfS4jqOCdvZ9LKQCOK1+5GdDewI2LrNwFERecrQr9qyp5A5o/ui3cP4x4MLHsppoRqVACMdH/w+a/z/DnGrpjXmsCWN2Yc6YT9n5sOh2sAmPX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJnx4XfNJHMESMghr1QwrT2awZcglI5QGqVQ9GacbY0=;
 b=BjHjm7FxtUyOukN+m09RdJPpkaxHBAjCJUSkYtW/ly0WpqwY5ze/ipRXNftDg9FwPQDBEktbQ46QC4RLgyDJP5A2DKFRWrHZTWOvsRQ93NqHGOxcjjjFgbSvdP5YoYATBaqYIS3jfgfC7C4md8tbqzxQFPvaoyXShzyDl1EKWU0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Thread-Topic: [PATCH v5] xen: Add Darwin.mk
Thread-Index: AQHcmbF131JHt0VrQEG2yzDmCYz1i7V7wbUAgAAPU4CAABTygA==
Date: Tue, 10 Feb 2026 12:56:43 +0000
Message-ID: <02BCBE82-C7F1-4631-AC9E-4A4B2E6065A3@arm.com>
References:
 <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <d1baa448-962c-4c2a-9a79-cf334b860450@suse.com> <aYsZb529xJvYSSRo@Mac.lan>
In-Reply-To: <aYsZb529xJvYSSRo@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB10974:EE_|DB1PEPF000509F3:EE_|AS8PR08MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc46103-7740-44a4-ea25-08de68a3fdd9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TXpjWUtyNDljRk9xWTB3VGNPY0FVOUdUTnFabmJqVWJBb3VFTUFueUFKMndI?=
 =?utf-8?B?N3YxNFNOMTB5eS84MEx3RTJKY0J5MTRmZnkwSlcyR0lEODdlNGR2WTIyNDNG?=
 =?utf-8?B?MWlUd0JLbHhvYkI1czBOVEZNYk1WRFFDWGNTVSt3SlJYNGVNZ2tsUjVyRFkv?=
 =?utf-8?B?ajI0WkpnbHgxWTBvSFg2V3ZjNTJibGtOeHZyUTFrT0phRDhMUXVBc1pKNEpl?=
 =?utf-8?B?YVB6YmlrUHY5UHArSkVMNTBoMk1DZmJ0cEZMMk1uTG1tYk1VUnZvQ3JUWFpk?=
 =?utf-8?B?bFJMT1JIUDd2S2J1VlZWTDNMTE4rTE56QWNzRDU0SEx0YjVVd1htRlNKdjNp?=
 =?utf-8?B?YmlHQjVyM2lLblV4bWFOUHFDNkJMdmpPSEVmWjZpb3MvT0NTaGYrZEh1SnNk?=
 =?utf-8?B?ZTk4eG5tUG15cCtSVGE1VHplMWRvZXdWcnVMbElhQUF6dlNGenlpdW5FNHp2?=
 =?utf-8?B?NUI3aUMveVRLOEJWUlVGc1kvK3VkVmZYKyt2RzhuTFYwZ2xTVENGWHBUbDh6?=
 =?utf-8?B?Smk4SzFwWWpDYm9sOGtjc3BnSTFiS2ZkK2pmUGY1UUdNYUtmRVJZWmVOZERr?=
 =?utf-8?B?UkdzR0hnM2FXTWFKeDNURWRjT0d5b1JRTktDQ0daYllVdzBZYkE0ZlVPd3hq?=
 =?utf-8?B?eXZHUVVwdHNMUHhuVmxKdGxOV1VWVVM3MXRLNC9ld3lieTM2aEdvMUNxTHhK?=
 =?utf-8?B?OVlTQWlOdE5JcWU1a3VRUnp1di9NNTdzVTJ0K01lRkV3ZzhROFB3cXBES1NO?=
 =?utf-8?B?WXJIcG5SR2ZRQjh0dmRrcDJaaGs5M0lvb1NHa3FSZWppTVE2dVlaKzVJNmNo?=
 =?utf-8?B?WHM4RlFyZGR1ZFptODlpbE1tbWVNb09wQWRtK0pBMTluLzhYK0xoWVh5azdF?=
 =?utf-8?B?OHVQZTc0bnlMR2NwdUNqSm5YdFY1Y29RQ3QwaWhpRjNhRnVKWmhJN0tpOHNa?=
 =?utf-8?B?TSt1VFl1OUJqTk1jSE03RzBZY1EzU2VhbURYSFl5WkthZklMNDlJMGNZa0Qy?=
 =?utf-8?B?YWdaUjRDWUhxLzl3T01sWU4vTk1GRFBBMERuMVRvaFNib3BRcHAyeWFPS3dt?=
 =?utf-8?B?b2EyeUFuWGl6QklGWHViYjM4UUZwK2tGU2lmbzVJcU9RMnRRS0NIWEsvZncz?=
 =?utf-8?B?MXZzL1RoU016eXZOZzdTNVdpeWVaNHZ3T1JuM1h4Q1hLdlJGYWtsTU8rdDJF?=
 =?utf-8?B?bnpleFpmVmM3dGhkdnVzNU5CaGtuMnkveFdRTkQ0MEpEQW1mZG95cUhmS3N5?=
 =?utf-8?B?c3pJMmdHWGxBUVJIcTJjamhENUU0V2RuK2hlSmhPQmVLWktkcG9PNVFMbTFy?=
 =?utf-8?B?N3RPZFJKMVBUdDJDQ3htUXg4UEhsaGhwKzBGNTVjZVJhcHk5cnNJMk95dVcx?=
 =?utf-8?B?R2oyRkFzcVl2aDV4QUJwUnhGRUczSVJETU5OL1duZzQ5aXdHSUxzNnpRdWJQ?=
 =?utf-8?B?d2xvMGR0aGVNeGhXOWplWnZhNlhYTVV0THIwbTNBenFSQnpiektIWmtjVVRE?=
 =?utf-8?B?c1JHZ3hnaks2MjFlMWg0MW1ldFBsVDBYUjNSMlRSQlM0WUh2N2xXcFhxUkxM?=
 =?utf-8?B?MStaRUVVdnVZRWdZc0NIZ2hxc0NqUk96eTJ1NlFESEJNR055eGV2OVNxUlQr?=
 =?utf-8?B?VjVpZFdHS25BZDhUR0F3TVczRmQxU2J1TlExUi8vUXNIbXMzbjF2dzN4Z0RM?=
 =?utf-8?B?OHNxN1dGcGhNSnowSklDUWpFeFRIY0FsSDNLWWg1MUJDSzIyRVZxQnVJdzZm?=
 =?utf-8?B?SGFkMVNTN05VUUpZbDNINndlblp5ZXY2Z1hHc1FPNHhmRjlpTU5abFNieVJN?=
 =?utf-8?B?UDREWUV5WVp2eFZ3OXlsQlA4bENMRUN3M2RNL0ordnVyeU42Y21PNUhFNlJ6?=
 =?utf-8?B?TkppUkR4YTVaVnlmRXRaSlRURGZ5SCtHSDhySUhRQThsNjBPRTA1Z2N2RWpj?=
 =?utf-8?B?QzJDUlgyMjdtVUtDUEFMRHhHQ1E1M0dTbVFsNkgvN0J6NnJETnpqazBldGN1?=
 =?utf-8?B?c1JhT0l5c1lzK3RUMUxtQmtWQlpFUy9GdnJSZ3p4SmZxUFVpQXZRYlVmUUMx?=
 =?utf-8?B?VFhnTnhML3U3Wldjb3F6Ri9PaUVSdWdyNmFhdDhxQzV4cjc4RTJ3bFY3ZFl0?=
 =?utf-8?B?dnBicjh0SWFic3VmUk1UakJ3cmdTRGIvRVpzSERrNzcyQ3NkWUNYOUsrVlhM?=
 =?utf-8?Q?5cyNnNJk6TnpfwFzhb5Z7jw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C848CD37BA1F80468081B0376AD598BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10974
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b36b0046-c3c5-4ff9-5be8-08de68a3d772
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|35042699022|14060799003|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3F6eENWZnphMXpKU1AxWEtZU0lsRkZJWVlpejZMVGNUbTdRcVF6cGI0UVpS?=
 =?utf-8?B?MzZ4WlNEaDlQVm4zQnl5eHdHUmc1aTNTeDU4VWJidzduZkZMQlJnTlEvd09y?=
 =?utf-8?B?c3lXQnU2Q3dZaWI4N3R5WTZKK0FmNitGWncyZUV4NUVwZzB0OUxsZytGa1Bi?=
 =?utf-8?B?QTk5ZUpNK2dtRjRQQ1pKMjhQRWgzOEkwek0xWFVTMkxMVFhMb090MHRFdkRM?=
 =?utf-8?B?d0o5OEczT3o4cysrUlJ0c3RBU3NLajJ0dEFhVFpLVUlDK0FuWi9heVpKUEto?=
 =?utf-8?B?TjhiSVRWeFhkc21tR2J0TTcrUzFtNERBTzVRbGJkQjYwNXh4aGY5S3VlNFRD?=
 =?utf-8?B?a2N1bUVCZ0hlYWdrZkhOd1UyUzBWNis1Wmh4bDJxSnlyMUtodWp3ODM5elpW?=
 =?utf-8?B?RDNubFdPZWFzS284dDd1RThkbzhad3BVVHhWZm5PMW1jZFBEeElBYm5rTFV2?=
 =?utf-8?B?c01KZE91L0x4UnlPcTNYMFhheDA3Z1A3aEpCR0pscWN5dFJVR2VDRmNubmMw?=
 =?utf-8?B?V0JwY2c4VnFRNkVVenFNSkpXeVhBdkw0OVhhQW1sczAxMXQ5OEtMT0l6QlM0?=
 =?utf-8?B?TEZabS9tWXY4bnVTRzNmT0xrTERpRWpIMjdnNE1tNFVLbmhRQm9YQ256MEVC?=
 =?utf-8?B?cEFuQndNeFJLdno4TGtCS3lOWXVNSUxOM2dKQjlpNHAyeFIwNjQ1U2YyY05U?=
 =?utf-8?B?TkR2eWdPZGx2QVovV051WWNhVzNRVndkM3MwQ1pITzQwdUVKNnhNWlhzSjVO?=
 =?utf-8?B?U2VaczIrRkVDM0VNcFh5c2xZVzFqSWI5ZjNqTHM5S3U1dFVVSnJadXgxNHRF?=
 =?utf-8?B?Z0pMNms3QzJEeEVVY0d5eWVUQ0xITkdEblB3Z0FmTGlGbU12UFBwaUJhZy9O?=
 =?utf-8?B?Mk9nMmxhcTNYSU9QOENIeSs1TnBUYWg0TjFieVdjTFV1aVZYaHZBRTVLRnpV?=
 =?utf-8?B?RXFrSzZPVENUVUVEbXBlUGIwbXdiNGRYamxQUUNmUFZGN3NKVVRpODE5ZnF0?=
 =?utf-8?B?L1NOUFB1bzFmZGhpc2NkMm8xU3NsdXNoeUZxYWcwWXFVc1oxUHBxSmYyaE41?=
 =?utf-8?B?Njc0cmwxYVlmbUtFUG5HRjdRdUNKc09xaElkSGwrcXNuSTRzazczdFl2QlNs?=
 =?utf-8?B?eEJQNDcyNGZLMHA1RU15U01XT1lrMStxYlNRZEtmMFd5bHRvOENnQ2xzVkJu?=
 =?utf-8?B?blpwaVdVYmQ2NGFabjBQcWEwVUVMU3QxbEJ1ZXhxYVgvZWJGa3BEM2tnWGE0?=
 =?utf-8?B?alJYanhXdllYQm1mUFlRa09UU29ycWxmRkVGaUhuK3h5KzE2WFVuU2xMT0lZ?=
 =?utf-8?B?QmVBN2l6bVc0KzJMclZJVzBtdk1VVXlwMHVFMktRL1BwSlVLQTVFa1lRQ25R?=
 =?utf-8?B?SGRwdHhkclJhdU5jNHIwTWNpTk1pRVFPdDdnNXlSZlU2aVVCenVYSW15Mi9i?=
 =?utf-8?B?QmREbjArTHBYQzZRWVFJYUZveitodG1SdGxMYTkybldyVzVnSVRQSVVKZXl3?=
 =?utf-8?B?OFovVE5TTjlWeE9TUFh5UTNPdmNEdXBITk02TGdWRHJuYW1lMjZJWUF6ZEZJ?=
 =?utf-8?B?eE1MU3U5TlVteDY0NnF6dmljMnE3ZTZ1VG1QT3pFRTdEWm9GSDJITTJGUlRo?=
 =?utf-8?B?VitDdzNEeE5uZFRsSUdQVm05TWtFVHdyRENSMUcwRER2RW0rMDM0Y1k3Z1Nz?=
 =?utf-8?B?OUpqelJ3a2liZWQrWXFFemRFZi9KSzJCWE85NjM0WEVYVjB3c016UjAxNVkz?=
 =?utf-8?B?ZU5nMEhSd1JESkxwVXA4RTlHQXRFOWY4OCtXTDhTUmk4S2kyM25UOEpramw5?=
 =?utf-8?B?NDB1STQxOWt2aWdVbnd1YWVTQXhaN0poUVJOYzJaQUkwbERFUm9KaExILzBF?=
 =?utf-8?B?WU82UlBJWUxUaXBaNXJZQU05RXhMUHJxZHdiRVhuNFU2ajJXaWZpTlMvRnJi?=
 =?utf-8?B?VlNmUkwyc3dWeWF0WnEwQzhsUkJzSlZVVitXMDFja2l1NVYzdTErTjY4UUt5?=
 =?utf-8?B?T3psLzZuVVQ4NHA4NTk2OFRiYTRPaHB4ZGdXOHQ5NnJHT2NLTFU2MjlabTdU?=
 =?utf-8?B?YnphNENLeWF4Tjk5cHRRSVRUajRhV2YyRnJ4dzU1YTlpSVBlSDRBQnBJeEVJ?=
 =?utf-8?B?YUlpeWVjWXFsbTJTZW1tNm1hdXkwOGNJTnhwZEhWa0lDRFYvYVNiS254SEJU?=
 =?utf-8?B?b0Y2ZU8rNUpxekZoSkt0VzVuMXJlVVpXVmZMTGRjT2E1NzhsUUUvUlJteE90?=
 =?utf-8?B?dzNXNGRkOUswaU44cWZPOGhwR2tRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(14060799003)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3c+ub8yQgXPfvi8eJsYsIiiRgWyuhW38KhljoOYqp7HF+EpkmDsYK7/JMQSmX7+sA56FS/KGEIpob1bYT1GZxbshAjseFKWKBkbX/MtS+zhZxABlO7T+AL4Gqe2DDaL4x7PqMyLXnqTmkYzJm+t32vs4LWxbKCfM+ds+JpiUYR0eI1XU+jGdnVz1kk3ByONihrmYdIBBEfDoIfoIm3fE2fLszuQ/ivHCpZ7m47lphCF/s2hwgp/Uvai7y20amURhNum0F+/ML2o0vSigXnoCmQb5xMBQo+gLUnTdalJwYuJNj0jYlhGx/mfL2apuwJKL40yqjMDl4e7o90WUj8eDgvW4DkFqsPVxTr5IAUKxlPJj8z969v4gAHFayIDCvzgDNP3bPLa0ChecTJ4V6F5SdC9S9BvUcok7ahbs+k1nr2KJ8EteNygET+RT+BgRIEbr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 12:57:47.9917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc46103-7740-44a4-ea25-08de68a3fdd9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9412
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B2D4E11B0FA
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gMTAgRmViIDIwMjYsIGF0IDEyOjQxLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIEZlYiAxMCwgMjAy
NiBhdCAxMTo0Njo0NEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA5LjAyLjIw
MjYgMTE6NDYsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+
ICsrKyBiL2NvbmZpZy9EYXJ3aW4ubWsNCj4+PiBAQCAtMCwwICsxLDYgQEANCj4+PiArIyBVc2Ug
R05VIHRvb2wgZGVmaW5pdGlvbnMgYXMgdGhlIHRvb2xzIHdlIGFyZSB1c2luZyBhcmUgZWl0aGVy
IEdOVSBjb21wYXRpYmxlDQo+Pj4gKyMgb3Igd2Ugb25seSB1c2UgZmVhdHVyZXMgd2hpY2ggYXJl
IHN1cHBvcnRlZCBvbiBNYWMgT1MuDQo+Pj4gK2luY2x1ZGUgJChYRU5fUk9PVCkvY29uZmlnL1N0
ZEdOVS5taw0KPj4+ICsNCj4+PiArIyBDcm9zcyBjb21waWxlIG9uIE1hYyBPUywgb25seSBoeXBl
cnZpc29yIGJ1aWxkIGhhcyBiZWVuIHRlc3RlZCwgbm8gdG9vbHMNCj4+PiArWEVOX0NPTVBJTEVf
QVJDSCA9IHVua25vdw0KPj4gDQo+PiBXaGlsZSBlZGl0aW5nIGluIHRoZSBBQkkgYXNwZWN0LCBp
dCBvY2N1cnJlZCB0byBtZSB0byBjaGVjayB3aGF0IEFwcGxlIGhhcw0KPj4gdG8gc2F5IHJlZ2Fy
ZGluZyB0aGVpciBBQkkuIEZvciBib3RoIGFhcmNoNjQgYW5kIHg4Ni02NCB0aGV5IHNheSB0aGV5
IHVzZQ0KPj4gdGhlIHN0YW5kYXJkIEFCSSB3aXRoIHNvbWUgbW9kaWZpY2F0aW9ucy4gV2UgbWF5
IHdhbnQgdG8gZXZhbHVhdGUgd2hldGhlcg0KPj4gdGhvc2UgbW9kaWZpY2F0aW9ucyBhcmUgYWN0
dWFsbHkgY29tcGF0aWJsZSB3aXRoIHdoYXQgd2UgbmVlZC4NCj4+IA0KPj4gVGFsa2luZyBvZiB4
ODYtNjQ6IEhhcyBidWlsZGluZyBvbiBhbiB4ODYgTWFjIGJlZW4gdGVzdGVkIGFzIHdlbGw/DQo+
PiBFc3BlY2lhbGx5IGlmIHRoYXQgZG9lc24ndCB3b3JrLCBpdCBtYXkgd2FudCBtZW50aW9uaW5n
Lg0KPiANCj4gSSBubyBsb25nZXIgaGF2ZSBhY2Nlc3MgdG8gYW4geDg2IE1hYywgdGhvc2UgYXJl
IGFib3V0IHRvIGRpc2FwcGVhci4NCj4gDQo+IEZXSVcsIEkgYnVpbGQgeDg2IG9uIE1hYyB1c2lu
ZyB0aGUgRG9ja2VyIGNvbnRhaW5lcnMsIGp1c3QgYXMgdGhlIENJDQo+IGRvZXMuICBPU1ggRG9j
a2VyIGFsbG93cyBydW5uaW5nIHg4NiBjb250YWluZXJzIG9uIGFybTY0IHVzaW5nIHRoZQ0KPiAi
Um9zZXR0YSAyIiBiaW5hcnkgdHJhbnNsYXRpb24gbGF5ZXIuDQo+IA0KPiBJJ3ZlIGF0dGVtcHRl
ZCBkb2luZyBhIGNyb3NzLWJ1aWxkIGZyb20gYW4gYXJtNjQgTWFjIHVzaW5nIHRoZSB4ODYtZWxm
DQo+IHRvb2xjaGFpbiwgYnV0IGdvdCB0aGUgZm9sbG93aW5nIGVycm9yOg0KPiANCj4gJSBtYWtl
IFhFTl9UQVJHRVRfQVJDSD14ODZfNjQgQ1JPU1NfQ09NUElMRT14ODZfNjQtZWxmLSBIT1NUQ0M9
Z2NjIC1DIHhlbiBWPTENCj4gWy4uLl0NCj4gL0xpYnJhcnkvRGV2ZWxvcGVyL0NvbW1hbmRMaW5l
VG9vbHMvdXNyL2Jpbi9tYWtlIC1mIC4vUnVsZXMubWsgb2JqPWNvbW1vbiBuZWVkLWJ1aWx0aW49
MQ0KPiAgeDg2XzY0LWVsZi1nY2MgLU1NRCAtTVAgLU1GIGNvbW1vbi8uYml0bWFwLm8uZCAtbTY0
IC1EQlVJTERfSUQgLWZuby1zdHJpY3QtYWxpYXNpbmcgLXN0ZD1nbnU5OSAtV2FsbCAtV3N0cmlj
dC1wcm90b3R5cGVzIC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11bnVzZWQtbG9j
YWwtdHlwZWRlZnMgICAtTzEgLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIgLW5vc3RkaW5jIC1mbm8t
YnVpbHRpbiAtZm5vLWNvbW1vbiAtZnplcm8taW5pdC1wYWRkaW5nLWJpdHM9YWxsIC1XZXJyb3Ig
LVdyZWR1bmRhbnQtZGVjbHMgLVd3cml0ZS1zdHJpbmdzIC1Xbm8tcG9pbnRlci1hcml0aCAtV2Rl
Y2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV3VuaW5pdGlhbGl6ZWQgLVd2bGEgLVdmbGV4LWFy
cmF5LW1lbWJlci1ub3QtYXQtZW5kIC1XaW5pdC1zZWxmIC1waXBlIC1EX19YRU5fXyAtaW5jbHVk
ZSAuL2luY2x1ZGUveGVuL2NvbmZpZy5oIC1XYSwtLXN0cmlwLWxvY2FsLWFic29sdXRlIC1mZnVu
Y3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zIC1nIC1tYWxpZ24tZGF0YT1hYmkgLW1pbmRp
cmVjdC1icmFuY2g9dGh1bmstZXh0ZXJuIC1taW5kaXJlY3QtYnJhbmNoLXJlZ2lzdGVyIC1mbm8t
anVtcC10YWJsZXMgLW1mdW5jdGlvbi1yZXR1cm49dGh1bmstZXh0ZXJuIC1XYSwtbXg4Ni11c2Vk
LW5vdGU9bm8gIC1mbm8tc3RhY2stcHJvdGVjdG9yIC1JLi9pbmNsdWRlIC1JLi9hcmNoL3g4Ni9p
bmNsdWRlIC1JLi9hcmNoL3g4Ni9pbmNsdWRlL2dlbmVyYXRlZCAtRFhFTl9JTUdfT0ZGU0VUPTB4
MjAwMDAwIC1tc29mdC1mbG9hdCAtZm5vLXBpZSAtZm5vLWV4Y2VwdGlvbnMgLWZuby1hc3luY2hy
b25vdXMtdW53aW5kLXRhYmxlcyAtV25lc3RlZC1leHRlcm5zIC1ESEFWRV9BU19RVU9URURfU1lN
IC1ESEFWRV9BU19NT1ZESVIgLURIQVZFX0FTX0VOUUNNRCAtREhBVkVfQVNfTk9QU19ESVJFQ1RJ
VkUgLW1uby1yZWQtem9uZSAtZnBpYyAtbW5vLW1teCAtbW5vLXNzZSAtbXNraXAtcmF4LXNldHVw
IC1mY2YtcHJvdGVjdGlvbj1icmFuY2ggLW1tYW51YWwtZW5kYnIgLWZuby1qdW1wLXRhYmxlcyAt
bW1lbWNweS1zdHJhdGVneT11bnJvbGxlZF9sb29wOjE2Om5vYWxpZ24sbGliY2FsbDotMTpub2Fs
aWduIC1tbWVtc2V0LXN0cmF0ZWd5PXVucm9sbGVkX2xvb3A6MTY6bm9hbGlnbixsaWJjYWxsOi0x
Om5vYWxpZ24gLVdhLC1JLi9pbmNsdWRlIC1XYSwtSS4vaW5jbHVkZSAnLURfX09CSkVDVF9MQUJF
TF9fPWNvbW1vbi9iaXRtYXAubycgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MyAgIC1jIGNv
bW1vbi9iaXRtYXAuYyAtbyBjb21tb24vLmJpdG1hcC5vLnRtcCAtTVEgY29tbW9uL2JpdG1hcC5v
DQo+IC4vYXJjaC94ODYvaW5jbHVkZS9hc20vYml0b3BzLmg6IEFzc2VtYmxlciBtZXNzYWdlczoN
Cj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9iaXRvcHMuaDo1MTE6IEVycm9yOiBmb3VuZCAnDQo+
ICcsIGV4cGVjdGVkOiAnKScNCj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9iaXRvcHMuaDo1MTE6
IEVycm9yOiBmb3VuZCAnDQo+ICcsIGV4cGVjdGVkOiAnKScNCj4gLi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9iaXRvcHMuaDo1MTE6IEVycm9yOiBmb3VuZCAnDQo+ICcsIGV4cGVjdGVkOiAnKScNCj4g
Li9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9iaXRvcHMuaDo1MTE6IEVycm9yOiBmb3VuZCAnDQo+ICcs
IGV4cGVjdGVkOiAnKScNCj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9ub3NwZWMuaDoyMDogRXJy
b3I6IGZvdW5kICcNCj4gJywgZXhwZWN0ZWQ6ICcpJw0KPiAuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L25vc3BlYy5oOjIwOiBFcnJvcjogZm91bmQgJw0KPiAnLCBleHBlY3RlZDogJyknDQo+IC4vYXJj
aC94ODYvaW5jbHVkZS9hc20vbm9zcGVjLmg6MjE6IEVycm9yOiBhbHRlcm5hdGl2ZSBmZWF0dXJl
IG91dHNpZGUgb2YgZmVhdHVyZXNldCByYW5nZQ0KPiAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL25v
c3BlYy5oOjIwOiBFcnJvcjogZm91bmQgJw0KPiAnLCBleHBlY3RlZDogJyknDQo+IC4vYXJjaC94
ODYvaW5jbHVkZS9hc20vbm9zcGVjLmg6MjA6IEVycm9yOiBmb3VuZCAnDQo+ICcsIGV4cGVjdGVk
OiAnKScNCj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9ub3NwZWMuaDoyMTogRXJyb3I6IGFsdGVy
bmF0aXZlIGZlYXR1cmUgb3V0c2lkZSBvZiBmZWF0dXJlc2V0IHJhbmdlDQo+IC4vYXJjaC94ODYv
aW5jbHVkZS9hc20vbm9zcGVjLmg6Mjg6IEVycm9yOiBmb3VuZCAnDQo+ICcsIGV4cGVjdGVkOiAn
KScNCj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9ub3NwZWMuaDoyODogRXJyb3I6IGZvdW5kICcN
Cj4gJywgZXhwZWN0ZWQ6ICcpJw0KPiAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL25vc3BlYy5oOjI5
OiBFcnJvcjogYWx0ZXJuYXRpdmUgZmVhdHVyZSBvdXRzaWRlIG9mIGZlYXR1cmVzZXQgcmFuZ2UN
Cj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9ub3NwZWMuaDoyODogRXJyb3I6IGZvdW5kICcNCj4g
JywgZXhwZWN0ZWQ6ICcpJw0KPiAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL25vc3BlYy5oOjI4OiBF
cnJvcjogZm91bmQgJw0KPiAnLCBleHBlY3RlZDogJyknDQo+IC4vYXJjaC94ODYvaW5jbHVkZS9h
c20vbm9zcGVjLmg6Mjk6IEVycm9yOiBhbHRlcm5hdGl2ZSBmZWF0dXJlIG91dHNpZGUgb2YgZmVh
dHVyZXNldCByYW5nZQ0KPiAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL25vc3BlYy5oOjI4OiBFcnJv
cjogZm91bmQgJw0KPiAnLCBleHBlY3RlZDogJyknDQo+IC4vYXJjaC94ODYvaW5jbHVkZS9hc20v
bm9zcGVjLmg6Mjg6IEVycm9yOiBmb3VuZCAnDQo+ICcsIGV4cGVjdGVkOiAnKScNCj4gLi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9ub3NwZWMuaDoyOTogRXJyb3I6IGFsdGVybmF0aXZlIGZlYXR1cmUg
b3V0c2lkZSBvZiBmZWF0dXJlc2V0IHJhbmdlDQo+IC4vYXJjaC94ODYvaW5jbHVkZS9hc20vbm9z
cGVjLmg6MjA6IEVycm9yOiBmb3VuZCAnDQo+ICcsIGV4cGVjdGVkOiAnKScNCj4gLi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9ub3NwZWMuaDoyMDogRXJyb3I6IGZvdW5kICcNCj4gJywgZXhwZWN0ZWQ6
ICcpJw0KPiAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL25vc3BlYy5oOjIxOiBFcnJvcjogYWx0ZXJu
YXRpdmUgZmVhdHVyZSBvdXRzaWRlIG9mIGZlYXR1cmVzZXQgcmFuZ2UNCj4gLi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9ub3NwZWMuaDoyMDogRXJyb3I6IGZvdW5kICcNCj4gJywgZXhwZWN0ZWQ6ICcp
Jw0KPiAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL25vc3BlYy5oOjIwOiBFcnJvcjogZm91bmQgJw0K
PiAnLCBleHBlY3RlZDogJyknDQo+IC4vYXJjaC94ODYvaW5jbHVkZS9hc20vbm9zcGVjLmg6MjE6
IEVycm9yOiBhbHRlcm5hdGl2ZSBmZWF0dXJlIG91dHNpZGUgb2YgZmVhdHVyZXNldCByYW5nZQ0K
PiAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL25vc3BlYy5oOjI4OiBFcnJvcjogZm91bmQgJw0KPiAn
LCBleHBlY3RlZDogJyknDQo+IC4vYXJjaC94ODYvaW5jbHVkZS9hc20vbm9zcGVjLmg6Mjg6IEVy
cm9yOiBmb3VuZCAnDQo+ICcsIGV4cGVjdGVkOiAnKScNCj4gLi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9ub3NwZWMuaDoyOTogRXJyb3I6IGFsdGVybmF0aXZlIGZlYXR1cmUgb3V0c2lkZSBvZiBmZWF0
dXJlc2V0IHJhbmdlDQo+IA0KPiBJIGhhdmVuJ3QgaW52ZXN0aWdhdGVkIGZ1cnRoZXIuICBTZWVt
cyBsaWtlIHNvbWUgaXNzdWUgd2l0aA0KPiBhbHRlcm5hdGl2ZSBhbmQgdGhlIHVzZXMgb2YgQ1BV
SUQgZGVmaW5lcy4gIFdlIHByb2JhYmx5IHdhbnQgdG8NCj4gbWVudGlvbiBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UgdGhhdCBvbmx5IGFybTY0IGJ1aWxkcyBoYXZlIGJlZW4gdGVzdGVkDQo+IHNvIGZh
ci4NCg0KSSBqdXN0IHRyaWVkIHRoZSBzYW1lIGFuZCBjb3VsZCByZXByb2R1Y2UgdGhhdC4NCg0K
VGhpcyBpcyBhcHBhcmVudGx5IG5vdCByZWxhdGVkIHRvIG1hYyBvcyBidXQgdG8gYmludXRpbHMg
KDIuNDUuMSBvbiBteSBzaWRlKQ0KDQpBZnRlciBzb21lIGRpZ2dpbmcgaSBmb3VuZCBvdXQgdGhh
dCB0aGlzIGNhbiBiZSB0cmlnZ2VyZWQgd2l0aCBhIHNpbXBsZSBhc3NlbWJsZXIgdGVzdCB3aGVy
ZQ0KLmlmICgyLzMyKSANCnRyaWdnZXJzIHRoZSBzYW1lIGVycm9yLCB3aGlsZQ0KLmlmIDIvMzIN
CmlzIGZpbmUgKGllIHBhcmVudGhlc2lzIGFyZSB0aGUgc291cmNlIG9mIHRoZSBpc3N1ZSkuDQoN
ClNvIHRoZSBzYW1lIGVycm9yIHdvdWxkIHByb2JhYmx5IG9jY3VyIHdpdGggdGhlIHNhbWUgYmlu
dXRpbHMgdmVyc2lvbiBpbiBsaW51eCBpIGd1ZXNzICh1bmxlc3MgaXQNCmJyZXcgc3BlY2lmaWMg
dmVyc2lvbiBvciBwYXRjaGVzIHdoaWNoIGFyZSBjcmVhdGluZyB0aGF0KS4NCg0KSSBkaWQgbm90
IGRpZyBmdXJ0aGVyIHRoYW4gdGhhdCBidXQgd2Ugc2hvdWxkIGtlZXAgdGhhdCBpbiBtaW5kIGlu
IGNhc2UgdGhpcyBjb21lcyBiYWNrIGluIG90aGVyDQpzY2VuYXJpb3MuDQoNCkNoZWVycw0KQmVy
dHJhbmQNCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KDQo=

