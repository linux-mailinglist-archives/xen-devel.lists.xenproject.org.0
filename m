Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6AB986D08
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804969.1215959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiQa-0007EI-6c; Thu, 26 Sep 2024 06:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804969.1215959; Thu, 26 Sep 2024 06:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiQa-0007Bo-3V; Thu, 26 Sep 2024 06:56:40 +0000
Received: by outflank-mailman (input) for mailman id 804969;
 Thu, 26 Sep 2024 06:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCv=QY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1stiQY-0007Bi-NH
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:56:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2613::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79a8fac9-7bd4-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 08:56:38 +0200 (CEST)
Received: from DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) by DU5PR08MB10677.eurprd08.prod.outlook.com
 (2603:10a6:10:529::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.11; Thu, 26 Sep
 2024 06:56:29 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::ea) by DUZPR01CA0327.outlook.office365.com
 (2603:10a6:10:4ba::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Thu, 26 Sep 2024 06:56:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15 via
 Frontend Transport; Thu, 26 Sep 2024 06:56:24 +0000
Received: ("Tessian outbound ff7cc14e3a8a:v465");
 Thu, 26 Sep 2024 06:56:19 +0000
Received: from L32be68fa85b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C41A03D-5A73-40E1-934A-A9FD0A57F956.1; 
 Thu, 26 Sep 2024 06:56:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L32be68fa85b7.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Sep 2024 06:56:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM7PR08MB5464.eurprd08.prod.outlook.com (2603:10a6:20b:10a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 06:56:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 06:56:06 +0000
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
X-Inumbo-ID: 79a8fac9-7bd4-11ef-a0ba-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NCj1B/QhTCxXyFOvRE1F5DVLO8fv+zts/fGzqY6egT/YVXOKvHcHr6uZTBzY+GZuj3kQvfftrCqEd6xdzk73SPv4Ix4b0U6xnFpwPKRJnWu7INQ5wZcPxPk5sNrhzIKCCnBS0O8BMp64LWCvgw3m3HV/Qwb3bd7bafZHcAztfhmhjyPxsvx8Fl7M+YDNDC0hzKho/wYaTlXRkuNDSyO9z0vHyp1gB7/H9vDJVjW5fFn3Nt5DBrERHT8IEoydctUxJkGUh+70ZdiYhVlRAWHwYOQncOtTomzXlV/7S1gvpZs19IHDbpRmQ/YllHHP5u2L3eb8Iv6Kb5eCbl6dlJsX0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1MElKBbHBF+g1LiKhZEBedqQfkq9YlmT5RI75Ejo7k=;
 b=VKwR/v0l4Bvd9Zu/67gaxT5+XGklESlRsfzJLg9QjKz3L2TEBVU1ADfSaZsysVuFrENvlCPRlmHaA/GUnRIWhpgXB7riZtJFT85ewa8bp7KV1c0Md1Gu2DzaZf0IUxfUaKRW9EdlxUq9ZAN5DkFxxZZbrTVLPapkNThxAJZ25q0ukrCN/yg6bI/8xkHSC91NMkQN8L5sPNJbHi3PaBaRsnlQXPmR0s4gQDw6CfGl8hSncK/9OdSeZIPXVV02E0f5ESvJk2+DhW5J7qc2ffenhG7Gw4XIV2Az0bL4iQDuG4UBAaxF001olmmQ7f55+GwO98a5hyR6nKhleMkV2X5cBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1MElKBbHBF+g1LiKhZEBedqQfkq9YlmT5RI75Ejo7k=;
 b=oi85VR1G29fKUuC/LLi0+bwL7Q+BbZf+0OG0BbSxdDn+akplUyca/wNwWrPl7eO9VEpu4Pwlo16bjIzVlViOR2UsW5DIOFPvvnZgYgRKqKGU3GtPevoN18Ku5VnlRUDLP1oUca+ueSBDijFVsSrsFSSmjIb+vLHEwWN1XbAy/Lo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0bec51d3f1d4ecd9
X-TessianGatewayMetadata: pr6BhLy9Mb9zYgrMOGRVVSjt8EuLyc0CqJ7nJZUdzYQZGKEgItU4VyTMsbc8YT4tiFrgS719NGlhn8PcEW5ATky7pTXty1wzg61NYezlcFsIYhwnj5E9JyHPPmGEvbCjd8grizzmGuAuGeH5XmT037pdTpgPNmrhnERhgxaqwlQ=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBgYfX2aahXOaMqfEKexT/720PqJYe0bXlYAZJLSbhk7RuSs6LZ3jwxWqr7PrFCMbXgIArmRTk5A0b4jYYjOXIWzZ6yJe5lESGgp/QOke08kagLGoQD9Lvd+xhADggi2BVYzS4vORISifBwL93reRVBNd8x0PntT8gdEvr4rAQvxqiNVkO5DSoJoWYF24Ogb5JHVcTHgwHtCKo/ziPK93d/fHGEs7Ae9iTJS6JAi6jt8XfW+OmFZHlE7k/7kKLHAv76COoSvbqGMAAh83Y1PPasPIdzEj9FeVSXsE6vPNyQZK5yuBmdT3AqdpJG56zHCepEaVdKcu71vvdoyiomEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1MElKBbHBF+g1LiKhZEBedqQfkq9YlmT5RI75Ejo7k=;
 b=UAhBQRcC4hmjPZO9Sod1xwrNDG2gxwsgzrb6z+MrgomHE+ldaxJTL/QTK8RZ6mX+5Zdm9/imXUf6PhmJidPogZFMBhJa5iwZuYRiZ2z2bsgoqiy8vzVKWgO/uA0PsjtoIrDeqX/13gISuDeT6IG7tMhWJbmiJCAC19fxm6/aroBKIU6ExmHHOp3E3/GNalAL8BTrEliYDCYOsoDLIpa7CRn3I3NDzCt73suJB1W/f3iMQ5jUXa/PwAfsNAfXXSzVtSsCQ/FvOvZb5hhhavUMTrF6ZZtFi9GpR0GBrm54kr6sdzYxGSgUX7JkeHG1zdh7bfbV41Cijy6yV/HuTDvdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1MElKBbHBF+g1LiKhZEBedqQfkq9YlmT5RI75Ejo7k=;
 b=oi85VR1G29fKUuC/LLi0+bwL7Q+BbZf+0OG0BbSxdDn+akplUyca/wNwWrPl7eO9VEpu4Pwlo16bjIzVlViOR2UsW5DIOFPvvnZgYgRKqKGU3GtPevoN18Ku5VnlRUDLP1oUca+ueSBDijFVsSrsFSSmjIb+vLHEwWN1XbAy/Lo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
Thread-Topic: [PATCH 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
Thread-Index: AQHbCo5HO1zpybOQMUW0An8uX23nwLJlqTMAgAQD9QA=
Date: Thu, 26 Sep 2024 06:56:06 +0000
Message-ID: <46AEE352-7786-413D-8CCF-EDDA7157472A@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <0bb3d0faf5a80112a95363ee9fd023d510e3f0c8.1726676338.git.bertrand.marquis@arm.com>
 <CAHUa44FLzkXsXoHtbiS1djDnSi5H2aupHmr0i759Ldd_NQD4ow@mail.gmail.com>
In-Reply-To:
 <CAHUa44FLzkXsXoHtbiS1djDnSi5H2aupHmr0i759Ldd_NQD4ow@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM7PR08MB5464:EE_|DU6PEPF0000A7E2:EE_|DU5PR08MB10677:EE_
X-MS-Office365-Filtering-Correlation-Id: db0e94c1-27cd-436f-5a25-08dcddf85628
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dzFaYVZsd2JqVFN1Z0NMZDlKV3NicHdQd0JSU25XNXhaVTJvRWNmYlhmSDM5?=
 =?utf-8?B?ZGdpb3NSNG91UkthcmpWaTJ6T0NYdnJmQ3MrK3Z0cUcyM29PbnM1OVNBcVBu?=
 =?utf-8?B?R3I4YXhnVGk4SWpDbWZvYktrTUVxQVFRU0Y0aGxMbkY3bnpQMlZ3QUtaQ05Q?=
 =?utf-8?B?L01WZElSc0hsVS91K1Zlb0VDejNZV0R4ZFlxYm1uNDdOYjhDQXlrbEljQW5t?=
 =?utf-8?B?b2ZpS2F6THBQNTJUSU1FT2dMZ2E0NCtLWkp3NU1IZ2F6UlB1Z1JDTU1aa2tT?=
 =?utf-8?B?d1h3YVg1cVVLZk9Ta291UWx5YUlZSTJJOGVqeGhZUFRjbGZIa1E2YjRFb0pu?=
 =?utf-8?B?MVJqZEJZdjNydjhydFArVmVrc29kZ0ZYTGhTZmhiME81eElqa09QaFFDeFZi?=
 =?utf-8?B?TjlaWnhrREwyYUdpdDRNRi9ROS9sNWxQdnBTRnQrS1g4OVluRTRvRC9sTU8r?=
 =?utf-8?B?dm9UVTEwR05uNklQRXZ2bGR0WGxjRnpzRGs5d0o1U29mOTdDSkdKVE1nYlBS?=
 =?utf-8?B?T0M1eVMxUHYwWGJZcmZMVGJ0QmZJakdFc0NBem1FTXVOTnlXMmZIdWdMTXVY?=
 =?utf-8?B?NUI3c3AxMTNPRXBYWFRybjBBeTJ0RmErSkJPbFlPelZOdGpoWFl5bFdRdU5D?=
 =?utf-8?B?OUM5TklYR2dNWjkyeWNNR0hYM3d4SHo2V1NjZ203OGY2eTU3c0pjN05SZTZB?=
 =?utf-8?B?TU5YdlhZSzNvd3lRWndLc3hsazI5MzJOekRmcDIrVDB3UFhMc0diSkxPSXB6?=
 =?utf-8?B?Z1ZFaDNyejRKYWNMYkJ6MElsQVRTYW9GcDFJNXJDV0l5Q1dNRWdlOGhLMThu?=
 =?utf-8?B?aWVqQVZidFNOOXBsUWRuaEpySTg4Yzg4SENpOXJFRHlqUWFVaCsrRnVTQ2ZQ?=
 =?utf-8?B?NUIxczdidmpZdFlHYTFldlZXaEtFRm1JNGttSmJVQ2psMzVWMGRKL3FGMFhR?=
 =?utf-8?B?bTBIVlZCTHNBYytWb01helowc0gxNUZnL3ZKMWJJbkF6TXIzT3hxTzEyeEhV?=
 =?utf-8?B?aXJDN29reXNaNzRmb1V6NE1TY3JLWnVMQWQ4M1kyNUZxUlBsNno4YUFsTHpj?=
 =?utf-8?B?aXlqMUd4WFQ1SVFtVFFpQWg2cHRSSkRwbDRwKzhnV2hDWmFBOXlCTEFUSmt0?=
 =?utf-8?B?NWRpZVdGWC8vVnJGS0VNU211Z2VnV3MvVDlRdlZudlF5dHlvaGdNaytsMDRT?=
 =?utf-8?B?cXFnWWNSSUJhbUc0V2tiaE9uNDF3N1FqNjFBdDFXQUZuRWsvK3hkWVV3Qkgv?=
 =?utf-8?B?RVA0ZER3SjI0OG9WeUx4S3ZrWE9kdGcyT3BjbkhYUENpN2JQNzFHRHllZXVO?=
 =?utf-8?B?eTlCVDJXQmx5c2lVNldXa1hlbVQvUmR6eW82bkd6MkJ5cW0vN1NXRXhGZW5u?=
 =?utf-8?B?NEczQjVFZy92S0tXQzRUZWtyRWtSUTVFc2VuaytrQXEzVXdPSjIxa0NxY2N1?=
 =?utf-8?B?YnRCUXVaSWt2MkJQN2xKNm5vUU03RFNjRmtQR0VLakNDb1JQeGRDQWx2OVFX?=
 =?utf-8?B?QlBJNVArNWc3WExndlFGVklXVzB4THg2Q0Q0aUJuQVZ5MzJKeHZpVzFpUHRT?=
 =?utf-8?B?UWlBd0llbHRZd0NzS2xVYVhtT1VYaTZpYnBtUVJCblhKV1hrVEllbjVZNUEw?=
 =?utf-8?B?U3VzVzNZOGZVbDcveEVsblU4R0luWkV3WDJsQlQzQ3pGbXUzak0xZGduVDdS?=
 =?utf-8?B?dlBrQzBBS2dxUkRsSHFVQXBaVjFSVzREQWJBeFU1Qm9qV2lRVEluc0g1NVFX?=
 =?utf-8?B?c0V3ZU0yZWtrU0xkazZYdlZMcXdmeXN4OG11dzkzbXF3UGhZT3JibUN4Tlc2?=
 =?utf-8?B?K0grSzVBay96VElBOWVsZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9872783A9627654DBE23CF489D1521AF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5464
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d17b4e1-75c7-4d23-cbd0-08dcddf84b47
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUhSVmJzSVg2NWtHL3psNGRORHpTeFJyYUFJSWhRTktPNnRQY3lacDVHeG0z?=
 =?utf-8?B?dUluVXg1S09hYlovcmxpalZydU5qTXRSM214S1AwemRtay9SMXlvaElsKzlu?=
 =?utf-8?B?aWZSdDY1QjlJQm4vR05seUptR0dWNlJYbDBYM3ZmRkpKY1ZDQmhDeUxibGtS?=
 =?utf-8?B?SDhzaDNqTklyWVlBRVM1NkVCZm9pVVl0VTVDSVRkVXhiNHRyakd5Ti9BdjQx?=
 =?utf-8?B?UEtSZHo4V1VFUWZXNDE1bjE1cXVKSGZBVzVjalY2dkhFTzNoN2x5ckNxeXd1?=
 =?utf-8?B?dEN3NE91STlGaXF4TVJPRlA4NE03d0R3eENjUzhtdHN0cWlaNk1LTnZrMk9V?=
 =?utf-8?B?bWp1Uzh4d1JNbitMOWNKYTRvNFpkZFRGaUJFL0pSZW83QWVLOUNTeFNEaVpl?=
 =?utf-8?B?a2RrN2tDRkNxSDErTnpYc1kzUWkrYlZKV2V1UTdtVzJLdCszbmZicjVibHpM?=
 =?utf-8?B?OVJPSVRQanZzdVFiSzVVMGdEYjdvVHhwMVZlZnRuUjNuTTYzaFU2emdRQXR4?=
 =?utf-8?B?MHVRYjFMNTNBUnBONnQxeE5vTmlwRWdDVW9ubmprTjVUajJNRG9iblpianNl?=
 =?utf-8?B?TTgvK0NNcEZTbVQzblJFQUs0NmU1dXZBQUxFT0k2MnJqTTFVaHFOVUxWajFl?=
 =?utf-8?B?N09TaEw0VEcyV25ndHlzbDhjYjFPMFlvYmpubkM3aXNqNHcyY042ZUZlSEpV?=
 =?utf-8?B?T1lRWDNDMFZMdDd4YTY3VWlOcXByb0hTeExCNmwzQVVRWU5xeUVNNFRuelpE?=
 =?utf-8?B?NzNENENXcjZlYmpTN3Y3OUhWNU01MFlEYlFsUXBaTjZrYVNFRFRFak5raCtq?=
 =?utf-8?B?UmxyUzVDU25aSHVkaXBFNDhuQUZqZjFTTndDRWNwQklJbkxpNTJCSHF1Rk81?=
 =?utf-8?B?UXFFNWFSei83UjdFRVIybWJqUGJpK05xS1ZPTkxhZzFXRGxDTGFEdmNzZG1T?=
 =?utf-8?B?Y3RnUUZlUDY5MEtaZEIrZjNxWHRoY0VZQlBIbnc4ZGg0SUNiMWZkbEdwZm41?=
 =?utf-8?B?dzRuRGNvdHVIVWhpL1ZwUnNvQ3FIckJqS3QxeXRLaVdHekNqdFY1MTUzc3VL?=
 =?utf-8?B?NkFBYnM4ZDdoL1RHNFp3R0ljRTBtTXlkNWx6WUFMSUE4TnE5R0xtbm1BdkZH?=
 =?utf-8?B?aUJobHc2NDlQSkkyWFZ6TFUwRUt4MXI0di9tNFJubVVYak1Hd0dpbGZHMTJQ?=
 =?utf-8?B?YVJFWmM5R3NlTy9jOGJoM2gwTEJEWWFzUHhYWWF6a1h6ZWxMcjF3RS80V1J4?=
 =?utf-8?B?bGQ3eStVM0pzTXlVY2FReHNjYXJWSm9XWXZSV3hmdEJhUnRncVZXck16N1BM?=
 =?utf-8?B?cnRMMEw4UmpBN205cktkdlRaZGNnaEE1d3EwWkE0RkhoOFp4VWJrRTczR0tY?=
 =?utf-8?B?WE4zUGNOODF2c28vYS8yVlF2Y25yaHVCdW9TUDdzVTVhNUZHQVl3NE4vRjY4?=
 =?utf-8?B?ZWEyWHIva0xKSmpBeTVQV0hUTDg3a3ZGY0g3dUtzMDZITGlUR1ROUWxzTEc3?=
 =?utf-8?B?SjIrOWszWVIzMS9MTlY5TDB3ZnhlcjB5c3pJMlZSK1A0anJGaEFvUTEreU4y?=
 =?utf-8?B?OXIzZkRDaHJtZWdlTFJWRGpLOUQrVWVSdUI2R0pXNS92M0FtbDM2SXRjaUVP?=
 =?utf-8?B?dTlKdWN5eHJpR0I2MXpvL3JjQXlPclZFZG9qUTRDRFMvOHVYRUlVRytSSmZt?=
 =?utf-8?B?ekhHVS9iNHkzem5TZzRQcGFwcHJBaG8yZVBINkpHNWdNOFhnMzJFSG9zY3I4?=
 =?utf-8?B?aWsraC9ZdHBuSG84ZXdKS0NOc3JyaEx6eXBrWERCbDgxeDNuWlRIWTAyUGpw?=
 =?utf-8?B?am5uUmR2WkQzaDdydEhENEpqdU9lbkhZWFBLQlF5czkxNFVNNWlyRVl4YUxu?=
 =?utf-8?Q?zaSZfW15jr8iE?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 06:56:24.6412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db0e94c1-27cd-436f-5a25-08dcddf85628
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10677

SGkgSmVucywNCg0KPiBPbiAyMyBTZXAgMjAyNCwgYXQgMTk6MzYsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gVGh1
LCBTZXAgMTksIDIwMjQgYXQgMjoyMOKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4gPGJlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IFdoZW4gYW4gUlhUWCBidWZmZXIgaXMg
bWFwcGVkIGJ5IGEgVk0gdHJhbnNtaXQgaXQgdG8gdGhlIFNQTUMgd2hlbiBpdA0KPj4gc3VwcG9y
dHMgUlhfQUNRVUlSRS4NCj4+IEFzIGEgY29uc2VxdWVuY2Ugb2YgdGhhdCwgd2UgbXVzdCBhY3F1
aXJlIHRoZSBSWCBidWZmZXIgb2YgYSBWTSBmcm9tIHRoZQ0KPj4gU1BNQyB3aGVuIHdlIHdhbnQg
dG8gdXNlIGl0Og0KPj4gLSBjcmVhdGUgYSBnZW5lcmljIGFjcXVpcmUgYW5kIHJlbGVhc2UgZnVu
Y3Rpb24gdG8gZ2V0IHRoZSByeCBidWZmZXIgb2YNCj4+ICBhIFZNIHdoaWNoIGdldHMgaXQgZnJv
bSB0aGUgU1BNQyB3aGVuIHN1cHBvcnRlZA0KPj4gLSByZW5hbWUgdGhlIHJ4X2FjcXVpcmUgdG8g
aHlwX3J4X2FjcXVpcmUgdG8gcmVtb3ZlIGNvbmZ1c2lvbg0KPj4gLSByZXdvcmsgdGhlIHJ4X2xv
Y2sgdG8gb25seSBsb2NrIGFjY2VzcyB0byByeF9pc19mcmVlIGFuZCBvbmx5IGFsbG93DQo+PiAg
dXNhZ2Ugb2YgdGhlIHJ4IGJ1ZmZlciB0byBvbmUgd2hvIG1hbmFnZWQgdG8gYWNxdWlyZSBpdCwg
dGh1cyByZW1vdmluZw0KPj4gIHRoZSB0cnlsb2NrIGFuZCByZXR1cm5pbmcgYnVzeSBpZiByeF9p
c19mcmVlIGlzIGZhbHNlDQo+PiANCj4+IEFzIHBhcnQgb2YgdGhpcyBjaGFuZ2UgbW92ZSBzb21l
IHN0cnVjdHVyZSBkZWZpbml0aW9uIHRvIGZmYV9wcml2YXRlDQo+PiBmcm9tIGZmYV9zaG0gYXMg
dGhvc2UgYXJlIG5lZWQgZm9yIHRoZSBNQVAgY2FsbCB3aXRoIHRoZSBTUE1DLg0KPj4gDQo+PiBT
aWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+
DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhLmMgICAgICAgICAgfCAgIDIgKy0NCj4+
IHhlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMgfCAgMjggKysrLS0tLQ0KPj4geGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oICB8ICAyMiArKysrKy0NCj4+IHhlbi9hcmNoL2FybS90
ZWUvZmZhX3J4dHguYyAgICAgfCAxMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0N
Cj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5jICAgICAgfCAgMTUgLS0tLQ0KPj4gNSBmaWxl
cyBjaGFuZ2VkLCAxNDIgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEu
Yw0KPj4gaW5kZXggNDVmOWMxZGI4YTZlLi40YTc2OWUyMDAwN2IgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+
PiBAQCAtMzQ0LDcgKzM0NCw3IEBAIHN0YXRpYyBib29sIGZmYV9oYW5kbGVfY2FsbChzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgZmZhX2hhbmRsZV9wYXJ0aXRpb25faW5m
b19nZXQocmVncyk7DQo+PiAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gICAgIGNhc2UgRkZBX1JY
X1JFTEVBU0U6DQo+PiAtICAgICAgICBlID0gZmZhX2hhbmRsZV9yeF9yZWxlYXNlKCk7DQo+PiAr
ICAgICAgICBlID0gZmZhX3J4X3JlbGVhc2UoZCk7DQo+PiAgICAgICAgIGJyZWFrOw0KPj4gICAg
IGNhc2UgRkZBX01TR19TRU5EX0RJUkVDVF9SRVFfMzI6DQo+PiAgICAgY2FzZSBGRkFfTVNHX1NF
TkRfRElSRUNUX1JFUV82NDoNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9w
YXJ0aW5mby5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcGFydGluZm8uYw0KPj4gaW5kZXggYjM5
MWIxYWRmOWYyLi5mZGUxODdkYmE0ZTUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVl
L2ZmYV9wYXJ0aW5mby5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wYXJ0aW5mby5j
DQo+PiBAQCAtMTIxLDExICsxMjEsOSBAQCB2b2lkIGZmYV9oYW5kbGVfcGFydGl0aW9uX2luZm9f
Z2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgICAgICBnb3RvIG91dDsNCj4+
ICAgICB9DQo+PiANCj4+IC0gICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZjdHgtPnJ4X2xvY2spICkN
Cj4+IC0gICAgew0KPj4gLSAgICAgICAgcmV0ID0gRkZBX1JFVF9CVVNZOw0KPj4gKyAgICByZXQg
PSBmZmFfcnhfYWNxdWlyZShkKTsNCj4+ICsgICAgaWYgKCByZXQgIT0gRkZBX1JFVF9PSyApDQo+
PiAgICAgICAgIGdvdG8gb3V0Ow0KPj4gLSAgICB9DQo+PiANCj4+ICAgICBkc3RfYnVmID0gY3R4
LT5yeDsNCj4+IA0KPj4gQEAgLTEzNSwyMiArMTMzLDE2IEBAIHZvaWQgZmZhX2hhbmRsZV9wYXJ0
aXRpb25faW5mb19nZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgIGdv
dG8gb3V0X3J4X3JlbGVhc2U7DQo+PiAgICAgfQ0KPj4gDQo+PiAtICAgIGlmICggIWN0eC0+cGFn
ZV9jb3VudCB8fCAhY3R4LT5yeF9pc19mcmVlICkNCj4+IC0gICAgew0KPj4gLSAgICAgICAgcmV0
ID0gRkZBX1JFVF9ERU5JRUQ7DQo+PiAtICAgICAgICBnb3RvIG91dF9yeF9yZWxlYXNlOw0KPj4g
LSAgICB9DQo+PiAtDQo+PiAgICAgc3Bpbl9sb2NrKCZmZmFfcnhfYnVmZmVyX2xvY2spOw0KPj4g
DQo+PiAgICAgcmV0ID0gZmZhX3BhcnRpdGlvbl9pbmZvX2dldCh1dWlkLCAwLCAmZmZhX3NwX2Nv
dW50LCAmc3JjX3NpemUpOw0KPj4gDQo+PiAgICAgaWYgKCByZXQgKQ0KPj4gLSAgICAgICAgZ290
byBvdXRfcnhfYnVmX3VubG9jazsNCj4+ICsgICAgICAgIGdvdG8gb3V0X3J4X2h5cF91bmxvY2s7
DQo+PiANCj4+ICAgICAvKg0KPj4gICAgICAqIGZmYV9wYXJ0aXRpb25faW5mb19nZXQoKSBzdWNj
ZWVkZWQgc28gd2Ugbm93IG93biB0aGUgUlggYnVmZmVyIHdlDQo+PiAtICAgICAqIHNoYXJlIHdp
dGggdGhlIFNQTUMuIFdlIG11c3QgZ2l2ZSBpdCBiYWNrIHVzaW5nIGZmYV9yeF9yZWxlYXNlKCkN
Cj4+ICsgICAgICogc2hhcmUgd2l0aCB0aGUgU1BNQy4gV2UgbXVzdCBnaXZlIGl0IGJhY2sgdXNp
bmcgZmZhX2h5cF9yeF9yZWxlYXNlKCkNCj4+ICAgICAgKiBvbmNlIHdlJ3ZlIGNvcGllZCB0aGUg
Y29udGVudC4NCj4+ICAgICAgKi8NCj4+IA0KPj4gQEAgLTE5MywxNSArMTg1LDEzIEBAIHZvaWQg
ZmZhX2hhbmRsZV9wYXJ0aXRpb25faW5mb19nZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Mp
DQo+PiAgICAgICAgIH0NCj4+ICAgICB9DQo+PiANCj4+IC0gICAgY3R4LT5yeF9pc19mcmVlID0g
ZmFsc2U7DQo+PiAtDQo+PiBvdXRfcnhfaHlwX3JlbGVhc2U6DQo+PiAtICAgIGZmYV9yeF9yZWxl
YXNlKCk7DQo+PiAtb3V0X3J4X2J1Zl91bmxvY2s6DQo+PiArICAgIGZmYV9oeXBfcnhfcmVsZWFz
ZSgpOw0KPj4gK291dF9yeF9oeXBfdW5sb2NrOg0KPj4gICAgIHNwaW5fdW5sb2NrKCZmZmFfcnhf
YnVmZmVyX2xvY2spOw0KPj4gb3V0X3J4X3JlbGVhc2U6DQo+PiAtICAgIHNwaW5fdW5sb2NrKCZj
dHgtPnJ4X2xvY2spOw0KPj4gLQ0KPj4gKyAgICBpZiAoIHJldCAhPSBGRkFfUkVUX09LICkNCj4+
ICsgICAgICAgIGZmYV9yeF9yZWxlYXNlKGQpOw0KPj4gb3V0Og0KPj4gICAgIGlmICggcmV0ICkN
Cj4+ICAgICAgICAgZmZhX3NldF9yZWdzX2Vycm9yKHJlZ3MsIHJldCk7DQo+PiBAQCAtMzY4LDcg
KzM1OCw3IEBAIGJvb2wgZmZhX3BhcnRpbmZvX2luaXQodm9pZCkNCj4+ICAgICByZXQgPSBpbml0
X3N1YnNjcmliZXJzKGNvdW50LCBmcGlfc2l6ZSk7DQo+PiANCj4+IG91dDoNCj4+IC0gICAgZmZh
X3J4X3JlbGVhc2UoKTsNCj4+ICsgICAgZmZhX2h5cF9yeF9yZWxlYXNlKCk7DQo+PiAgICAgcmV0
dXJuIHJldDsNCj4+IH0NCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZh
X3ByaXZhdGUuaCBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gaW5kZXggYzY5
MDNlMzM1NDg5Li44NGIwZjg2NmE3MWUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVl
L2ZmYV9wcml2YXRlLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0K
Pj4gQEAgLTI2Myw2ICsyNjMsMjEgQEANCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEZGQV9GVU5DX0lEKEZGQV9GVU5DX01JTikpIDw8IDEgfCBcDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBGRkFfRlVOQ19DT05WKGlkKSkNCj4+IA0KPj4gKy8q
IENvbnN0aXR1ZW50IG1lbW9yeSByZWdpb24gZGVzY3JpcHRvciAqLw0KPj4gK3N0cnVjdCBmZmFf
YWRkcmVzc19yYW5nZSB7DQo+PiArICAgIHVpbnQ2NF90IGFkZHJlc3M7DQo+PiArICAgIHVpbnQz
Ml90IHBhZ2VfY291bnQ7DQo+PiArICAgIHVpbnQzMl90IHJlc2VydmVkOw0KPj4gK307DQo+PiAr
DQo+PiArLyogQ29tcG9zaXRlIG1lbW9yeSByZWdpb24gZGVzY3JpcHRvciAqLw0KPj4gK3N0cnVj
dCBmZmFfbWVtX3JlZ2lvbiB7DQo+PiArICAgIHVpbnQzMl90IHRvdGFsX3BhZ2VfY291bnQ7DQo+
PiArICAgIHVpbnQzMl90IGFkZHJlc3NfcmFuZ2VfY291bnQ7DQo+PiArICAgIHVpbnQ2NF90IHJl
c2VydmVkOw0KPj4gKyAgICBzdHJ1Y3QgZmZhX2FkZHJlc3NfcmFuZ2UgYWRkcmVzc19yYW5nZV9h
cnJheVtdOw0KPj4gK307DQo+PiArDQo+PiBzdHJ1Y3QgZmZhX2N0eF9ub3RpZiB7DQo+PiAgICAg
Ym9vbCBlbmFibGVkOw0KPj4gDQo+PiBAQCAtMjkwLDcgKzMwNSw3IEBAIHN0cnVjdCBmZmFfY3R4
IHsNCj4+ICAgICBzdHJ1Y3QgZmZhX2N0eF9ub3RpZiBub3RpZjsNCj4+ICAgICAvKg0KPj4gICAg
ICAqIHR4X2xvY2sgaXMgdXNlZCB0byBzZXJpYWxpemUgYWNjZXNzIHRvIHR4DQo+PiAtICAgICAq
IHJ4X2xvY2sgaXMgdXNlZCB0byBzZXJpYWxpemUgYWNjZXNzIHRvIHJ4DQo+PiArICAgICAqIHJ4
X2xvY2sgaXMgdXNlZCB0byBzZXJpYWxpemUgYWNjZXNzIHRvIHJ4X2lzX2ZyZWUNCj4+ICAgICAg
KiBsb2NrIGlzIHVzZWQgZm9yIHRoZSByZXN0IGluIHRoaXMgc3RydWN0DQo+PiAgICAgICovDQo+
PiAgICAgc3BpbmxvY2tfdCB0eF9sb2NrOw0KPj4gQEAgLTMyOSw3ICszNDQsOCBAQCB2b2lkIGZm
YV9yeHR4X2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOw0KPj4gdWludDMyX3QgZmZh
X2hhbmRsZV9yeHR4X21hcCh1aW50MzJfdCBmaWQsIHJlZ2lzdGVyX3QgdHhfYWRkciwNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZWdpc3Rlcl90IHJ4X2FkZHIsIHVpbnQzMl90IHBh
Z2VfY291bnQpOw0KPj4gdWludDMyX3QgZmZhX2hhbmRsZV9yeHR4X3VubWFwKHZvaWQpOw0KPj4g
LWludDMyX3QgZmZhX2hhbmRsZV9yeF9yZWxlYXNlKHZvaWQpOw0KPj4gK2ludDMyX3QgZmZhX3J4
X2FjcXVpcmUoc3RydWN0IGRvbWFpbiAqZCk7DQo+PiAraW50MzJfdCBmZmFfcnhfcmVsZWFzZShz
dHJ1Y3QgZG9tYWluICpkKTsNCj4+IA0KPj4gdm9pZCBmZmFfbm90aWZfaW5pdCh2b2lkKTsNCj4+
IHZvaWQgZmZhX25vdGlmX2luaXRfaW50ZXJydXB0KHZvaWQpOw0KPj4gQEAgLTQxOCw3ICs0MzQs
NyBAQCBzdGF0aWMgaW5saW5lIGludDMyX3QgZmZhX3NpbXBsZV9jYWxsKHVpbnQzMl90IGZpZCwg
cmVnaXN0ZXJfdCBhMSwNCj4+ICAgICByZXR1cm4gZmZhX2dldF9yZXRfY29kZSgmcmVzcCk7DQo+
PiB9DQo+PiANCj4+IC1zdGF0aWMgaW5saW5lIGludDMyX3QgZmZhX3J4X3JlbGVhc2Uodm9pZCkN
Cj4+ICtzdGF0aWMgaW5saW5lIGludDMyX3QgZmZhX2h5cF9yeF9yZWxlYXNlKHZvaWQpDQo+PiB7
DQo+PiAgICAgcmV0dXJuIGZmYV9zaW1wbGVfY2FsbChGRkFfUlhfUkVMRUFTRSwgMCwgMCwgMCwg
MCk7DQo+PiB9DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcnh0eC5jIGIv
eGVuL2FyY2gvYXJtL3RlZS9mZmFfcnh0eC5jDQo+PiBpbmRleCBjYjU0Yzc2OTExZmQuLmRhY2Yz
M2NjOWVmYyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3J4dHguYw0KPj4g
KysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcnh0eC5jDQo+PiBAQCAtMzAsNiArMzAsMTcgQEAg
c3RydWN0IGZmYV9lbmRwb2ludF9yeHR4X2Rlc2NyaXB0b3JfMV8xIHsNCj4+ICAgICB1aW50MzJf
dCB0eF9yZWdpb25fb2ZmczsNCj4+IH07DQo+PiANCj4+ICtzdGF0aWMgaW50MzJfdCBmZmFfcnh0
eF9tYXAocGFkZHJfdCB0eF9hZGRyLCBwYWRkcl90IHJ4X2FkZHIsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQzMl90IHBhZ2VfY291bnQpDQo+PiArew0KPj4gKyAgICByZXR1
cm4gZmZhX3NpbXBsZV9jYWxsKEZGQV9SWFRYX01BUF82NCwgdHhfYWRkciwgcnhfYWRkciwgcGFn
ZV9jb3VudCwgMCk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQzMl90IGZmYV9yeHR4X3Vu
bWFwKHZvaWQpDQo+PiArew0KPj4gKyAgICByZXR1cm4gZmZhX3NpbXBsZV9jYWxsKEZGQV9SWFRY
X1VOTUFQLCAwLCAwLCAwLCAwKTsNCj4+ICt9DQo+PiArDQo+PiB1aW50MzJfdCBmZmFfaGFuZGxl
X3J4dHhfbWFwKHVpbnQzMl90IGZpZCwgcmVnaXN0ZXJfdCB0eF9hZGRyLA0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyX3QgcnhfYWRkciwgdWludDMyX3QgcGFnZV9jb3Vu
dCkNCj4+IHsNCj4+IEBAIC00Miw2ICs1Myw5IEBAIHVpbnQzMl90IGZmYV9oYW5kbGVfcnh0eF9t
YXAodWludDMyX3QgZmlkLCByZWdpc3Rlcl90IHR4X2FkZHIsDQo+PiAgICAgdm9pZCAqcng7DQo+
PiAgICAgdm9pZCAqdHg7DQo+PiANCj4+ICsgICAgLyogVGhlIGNvZGUgaXMgY29uc2lkZXJpbmcg
dGhhdCB3ZSBvbmx5IGdldCBvbmUgcGFnZSBmb3Igbm93ICovDQo+PiArICAgIEJVSUxEX0JVR19P
TihGRkFfTUFYX1JYVFhfUEFHRV9DT1VOVCAhPSAxKTsNCj4+ICsNCj4+ICAgICBpZiAoICFzbWNj
Y19pc19jb252XzY0KGZpZCkgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgLyoNCj4+IEBAIC04Nyw2
ICsxMDEsNjUgQEAgdWludDMyX3QgZmZhX2hhbmRsZV9yeHR4X21hcCh1aW50MzJfdCBmaWQsIHJl
Z2lzdGVyX3QgdHhfYWRkciwNCj4+ICAgICBpZiAoICFyeCApDQo+PiAgICAgICAgIGdvdG8gZXJy
X3VubWFwX3R4Ow0KPj4gDQo+PiArICAgIC8qDQo+PiArICAgICAqIFRyYW5zbWl0IHRoZSBSWC9U
WCBidWZmZXIgaW5mb3JtYXRpb24gdG8gdGhlIFNQTSBpZiBhY3F1aXJlIGlzIHN1cHBvcnRlZA0K
Pj4gKyAgICAgKiBhcyB0aGUgc3BlYyBzYXlzIHRoYXQgaWYgbm90IHRoZXJlIGlzIG5vdCBuZWVk
IHRvIGFjcXVpcmUvcmVsZWFzZS9tYXANCj4+ICsgICAgICogcnh0eCBidWZmZXJzIGZyb20gdGhl
IFNQTUMNCj4+ICsgICAgICovDQo+PiArICAgIGlmICggZmZhX2Z3X3N1cHBvcnRzX2ZpZChGRkFf
UlhfQUNRVUlSRSkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBzdHJ1Y3QgZmZhX2VuZHBvaW50
X3J4dHhfZGVzY3JpcHRvcl8xXzEgKnJ4dHhfZGVzYzsNCj4+ICsgICAgICAgIHN0cnVjdCBmZmFf
bWVtX3JlZ2lvbiAqbWVtX3JlZzsNCj4+ICsNCj4+ICsgICAgICAgIC8qIEFsbCBtdXN0IGZpdCBp
biBvdXIgVFggYnVmZmVyICovDQo+PiArICAgICAgICBCVUlMRF9CVUdfT04oKHNpemVvZigqcnh0
eF9kZXNjKSArIHNpemVvZigqbWVtX3JlZykqMiArDQo+PiArICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihzdHJ1Y3QgZmZhX2FkZHJlc3NfcmFuZ2UpKjIpID4gRkZBX1BBR0VfU0laRSk7DQo+
PiArDQo+PiArICAgICAgICBzcGluX2xvY2soJmZmYV90eF9idWZmZXJfbG9jayk7DQo+PiArICAg
ICAgICByeHR4X2Rlc2MgPSBmZmFfdHg7DQo+PiArDQo+PiArICAgICAgICAvKg0KPj4gKyAgICAg
ICAgICogV2UgaGF2ZSBvbmx5IG9uZSBwYWdlIGZvciBlYWNoIHNvIHdlIHBhY2sgZXZlcnl0aGlu
ZzoNCj4+ICsgICAgICAgICAqIC0gcnggcmVnaW9uIGRlc2NyaXB0b3INCj4+ICsgICAgICAgICAq
IC0gcnggcmVnaW9uIHJhbmdlDQo+PiArICAgICAgICAgKiAtIHR4IHJlZ2lvbiBkZXNjcmlwdG9y
DQo+PiArICAgICAgICAgKiAtIHR4IHJlZ2lvbiByYW5nZQ0KPj4gKyAgICAgICAgICovDQo+PiAr
ICAgICAgICByeHR4X2Rlc2MtPnNlbmRlcl9pZCA9IGZmYV9nZXRfdm1faWQoZCk7DQo+PiArICAg
ICAgICByeHR4X2Rlc2MtPnJlc2VydmVkID0gMDsNCj4+ICsgICAgICAgIHJ4dHhfZGVzYy0+cnhf
cmVnaW9uX29mZnMgPSBzaXplb2YoKnJ4dHhfZGVzYyk7DQo+PiArICAgICAgICByeHR4X2Rlc2Mt
PnR4X3JlZ2lvbl9vZmZzID0gc2l6ZW9mKCpyeHR4X2Rlc2MpICsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgZmZhX21lbV9yZWdpb24sDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRkcmVzc19y
YW5nZV9hcnJheVsxXSk7DQo+PiArDQo+PiArICAgICAgICAvKiByeCBidWZmZXIgKi8NCj4+ICsg
ICAgICAgIG1lbV9yZWcgPSBmZmFfdHggKyBzaXplb2YoKnJ4dHhfZGVzYyk7DQo+PiArICAgICAg
ICBtZW1fcmVnLT50b3RhbF9wYWdlX2NvdW50ID0gMTsNCj4+ICsgICAgICAgIG1lbV9yZWctPmFk
ZHJlc3NfcmFuZ2VfY291bnQgPSAxOw0KPj4gKyAgICAgICAgbWVtX3JlZy0+cmVzZXJ2ZWQgPSAw
Ow0KPj4gKw0KPj4gKyAgICAgICAgbWVtX3JlZy0+YWRkcmVzc19yYW5nZV9hcnJheVswXS5hZGRy
ZXNzID0gcGFnZV90b19tYWRkcihyeF9wZyk7DQo+PiArICAgICAgICBtZW1fcmVnLT5hZGRyZXNz
X3JhbmdlX2FycmF5WzBdLnBhZ2VfY291bnQgPSAxOw0KPj4gKyAgICAgICAgbWVtX3JlZy0+YWRk
cmVzc19yYW5nZV9hcnJheVswXS5yZXNlcnZlZCA9IDA7DQo+PiArDQo+PiArICAgICAgICAvKiB0
eCBidWZmZXIgKi8NCj4+ICsgICAgICAgIG1lbV9yZWcgPSBmZmFfdHggKyByeHR4X2Rlc2MtPnR4
X3JlZ2lvbl9vZmZzOw0KPj4gKyAgICAgICAgbWVtX3JlZy0+dG90YWxfcGFnZV9jb3VudCA9IDE7
DQo+PiArICAgICAgICBtZW1fcmVnLT5hZGRyZXNzX3JhbmdlX2NvdW50ID0gMTsNCj4+ICsgICAg
ICAgIG1lbV9yZWctPnJlc2VydmVkID0gMDsNCj4+ICsNCj4+ICsgICAgICAgIG1lbV9yZWctPmFk
ZHJlc3NfcmFuZ2VfYXJyYXlbMF0uYWRkcmVzcyA9IHBhZ2VfdG9fbWFkZHIodHhfcGcpOw0KPj4g
KyAgICAgICAgbWVtX3JlZy0+YWRkcmVzc19yYW5nZV9hcnJheVswXS5wYWdlX2NvdW50ID0gMTsN
Cj4+ICsgICAgICAgIG1lbV9yZWctPmFkZHJlc3NfcmFuZ2VfYXJyYXlbMF0ucmVzZXJ2ZWQgPSAw
Ow0KPj4gKw0KPj4gKyAgICAgICAgcmV0ID0gZmZhX3J4dHhfbWFwKDAsIDAsIDEpOw0KPiANCj4g
SSBjYW4ndCBmaW5kIHRoZSBjb3JyZXNwb25kaW5nIGZmYV9yeHR4X3VubWFwKCkgb2YgYSBWTSBy
eHR4IGJ1ZmZlci4NCg0KUmlnaHQsIGkgd2lsbCBmaXggdGhhdCBpbiB0aGUgbmV4dCB2ZXJzaW9u
Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+ICsN
Cj4+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZmZmFfdHhfYnVmZmVyX2xvY2spOw0KPj4gKw0KPj4g
KyAgICAgICAgaWYgKCByZXQgIT0gRkZBX1JFVF9PSyApDQo+PiArICAgICAgICAgICAgZ290byBl
cnJfdW5tYXBfdHg7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICBjdHgtPnJ4ID0gcng7DQo+PiAg
ICAgY3R4LT50eCA9IHR4Ow0KPj4gICAgIGN0eC0+cnhfcGcgPSByeF9wZzsNCj4+IEBAIC0xMzIs
MzQgKzIwNSw2MSBAQCB1aW50MzJfdCBmZmFfaGFuZGxlX3J4dHhfdW5tYXAodm9pZCkNCj4+ICAg
ICByZXR1cm4gRkZBX1JFVF9PSzsNCj4+IH0NCj4+IA0KPj4gLWludDMyX3QgZmZhX2hhbmRsZV9y
eF9yZWxlYXNlKHZvaWQpDQo+PiAraW50MzJfdCBmZmFfcnhfYWNxdWlyZShzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPj4gew0KPj4gICAgIGludDMyX3QgcmV0ID0gRkZBX1JFVF9ERU5JRUQ7DQo+PiAtICAg
IHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47DQo+PiAgICAgc3RydWN0IGZmYV9j
dHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4gDQo+PiAtICAgIGlmICggIXNwaW5fdHJ5bG9jaygm
Y3R4LT5yeF9sb2NrKSApDQo+PiAtICAgICAgICByZXR1cm4gRkZBX1JFVF9CVVNZOw0KPj4gKyAg
ICBzcGluX2xvY2soJmN0eC0+cnhfbG9jayk7DQo+PiANCj4+IC0gICAgaWYgKCAhY3R4LT5wYWdl
X2NvdW50IHx8IGN0eC0+cnhfaXNfZnJlZSApDQo+PiArICAgIGlmICggIWN0eC0+cGFnZV9jb3Vu
dCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfREVOSUVEOw0KPj4gKyAg
ICAgICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCAhY3R4LT5yeF9p
c19mcmVlICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9CVVNZOw0KPj4g
ICAgICAgICBnb3RvIG91dDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoIGZmYV9md19z
dXBwb3J0c19maWQoRkZBX1JYX0FDUVVJUkUpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcmV0
ID0gZmZhX3NpbXBsZV9jYWxsKEZGQV9SWF9BQ1FVSVJFLCBmZmFfZ2V0X3ZtX2lkKGQpLCAwLCAw
LCAwKTsNCj4+ICsgICAgICAgIGlmICggcmV0ICE9IEZGQV9SRVRfT0sgKQ0KPj4gKyAgICAgICAg
ICAgIGdvdG8gb3V0Ow0KPj4gKyAgICB9DQo+PiAgICAgcmV0ID0gRkZBX1JFVF9PSzsNCj4+IC0g
ICAgY3R4LT5yeF9pc19mcmVlID0gdHJ1ZTsNCj4+ICsgICAgY3R4LT5yeF9pc19mcmVlID0gZmFs
c2U7DQo+PiBvdXQ6DQo+PiAgICAgc3Bpbl91bmxvY2soJmN0eC0+cnhfbG9jayk7DQo+PiANCj4+
ICAgICByZXR1cm4gcmV0Ow0KPj4gfQ0KPj4gDQo+PiAtc3RhdGljIGludDMyX3QgZmZhX3J4dHhf
bWFwKHBhZGRyX3QgdHhfYWRkciwgcGFkZHJfdCByeF9hZGRyLA0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCBwYWdlX2NvdW50KQ0KPj4gK2ludDMyX3QgZmZhX3J4X3Jl
bGVhc2Uoc3RydWN0IGRvbWFpbiAqZCkNCj4+IHsNCj4+IC0gICAgcmV0dXJuIGZmYV9zaW1wbGVf
Y2FsbChGRkFfUlhUWF9NQVBfNjQsIHR4X2FkZHIsIHJ4X2FkZHIsIHBhZ2VfY291bnQsIDApOw0K
Pj4gLX0NCj4+ICsgICAgaW50MzJfdCByZXQgPSBGRkFfUkVUX0RFTklFRDsNCj4+ICsgICAgc3Ry
dWN0IGZmYV9jdHggKmN0eCA9IGQtPmFyY2gudGVlOw0KPj4gDQo+PiAtc3RhdGljIGludDMyX3Qg
ZmZhX3J4dHhfdW5tYXAodm9pZCkNCj4+IC17DQo+PiAtICAgIHJldHVybiBmZmFfc2ltcGxlX2Nh
bGwoRkZBX1JYVFhfVU5NQVAsIDAsIDAsIDAsIDApOw0KPj4gKyAgICBzcGluX2xvY2soJmN0eC0+
cnhfbG9jayk7DQo+PiArDQo+PiArICAgIGlmICggIWN0eC0+cGFnZV9jb3VudCB8fCBjdHgtPnJ4
X2lzX2ZyZWUgKQ0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiArDQo+PiArICAgIGlmICggZmZh
X2Z3X3N1cHBvcnRzX2ZpZChGRkFfUlhfQUNRVUlSRSkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAg
ICByZXQgPSBmZmFfc2ltcGxlX2NhbGwoRkZBX1JYX1JFTEVBU0UsIGZmYV9nZXRfdm1faWQoZCks
IDAsIDAsIDApOw0KPj4gKyAgICAgICAgaWYgKCByZXQgIT0gRkZBX1JFVF9PSyApDQo+PiArICAg
ICAgICAgICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+ICsgICAgcmV0ID0gRkZBX1JFVF9PSzsN
Cj4+ICsgICAgY3R4LT5yeF9pc19mcmVlID0gdHJ1ZTsNCj4+ICtvdXQ6DQo+PiArICAgIHNwaW5f
dW5sb2NrKCZjdHgtPnJ4X2xvY2spOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gcmV0Ow0KPj4gfQ0K
Pj4gDQo+PiB2b2lkIGZmYV9yeHR4X2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfc2htLmMgYi94ZW4vYXJjaC9hcm0v
dGVlL2ZmYV9zaG0uYw0KPj4gaW5kZXggMjk2NzVmOWJhM2Y3Li5kNjI4YzFiNzA2MDkgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYw0KPj4gKysrIGIveGVuL2FyY2gv
YXJtL3RlZS9mZmFfc2htLmMNCj4+IEBAIC0xNiwyMSArMTYsNiBAQA0KPj4gDQo+PiAjaW5jbHVk
ZSAiZmZhX3ByaXZhdGUuaCINCj4+IA0KPj4gLS8qIENvbnN0aXR1ZW50IG1lbW9yeSByZWdpb24g
ZGVzY3JpcHRvciAqLw0KPj4gLXN0cnVjdCBmZmFfYWRkcmVzc19yYW5nZSB7DQo+PiAtICAgIHVp
bnQ2NF90IGFkZHJlc3M7DQo+PiAtICAgIHVpbnQzMl90IHBhZ2VfY291bnQ7DQo+PiAtICAgIHVp
bnQzMl90IHJlc2VydmVkOw0KPj4gLX07DQo+PiAtDQo+PiAtLyogQ29tcG9zaXRlIG1lbW9yeSBy
ZWdpb24gZGVzY3JpcHRvciAqLw0KPj4gLXN0cnVjdCBmZmFfbWVtX3JlZ2lvbiB7DQo+PiAtICAg
IHVpbnQzMl90IHRvdGFsX3BhZ2VfY291bnQ7DQo+PiAtICAgIHVpbnQzMl90IGFkZHJlc3NfcmFu
Z2VfY291bnQ7DQo+PiAtICAgIHVpbnQ2NF90IHJlc2VydmVkOw0KPj4gLSAgICBzdHJ1Y3QgZmZh
X2FkZHJlc3NfcmFuZ2UgYWRkcmVzc19yYW5nZV9hcnJheVtdOw0KPj4gLX07DQo+PiAtDQo+PiAv
KiBNZW1vcnkgYWNjZXNzIHBlcm1pc3Npb25zIGRlc2NyaXB0b3IgKi8NCj4+IHN0cnVjdCBmZmFf
bWVtX2FjY2Vzc19wZXJtIHsNCj4+ICAgICB1aW50MTZfdCBlbmRwb2ludF9pZDsNCj4+IC0tDQo+
PiAyLjM5LjUgKEFwcGxlIEdpdC0xNTQpDQo+PiANCj4+IA0KDQo=

