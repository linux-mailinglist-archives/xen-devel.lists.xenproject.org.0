Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FADA49287
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 08:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898506.1307040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnvDJ-0003sT-RR; Fri, 28 Feb 2025 07:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898506.1307040; Fri, 28 Feb 2025 07:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnvDJ-0003qI-O0; Fri, 28 Feb 2025 07:55:17 +0000
Received: by outflank-mailman (input) for mailman id 898506;
 Fri, 28 Feb 2025 07:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tnvDH-0003q7-9t
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 07:55:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2613::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53eba832-f5a9-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 08:55:08 +0100 (CET)
Received: from DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) by DU0PR08MB7517.eurprd08.prod.outlook.com
 (2603:10a6:10:322::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 07:55:03 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::c5) by DUZPR01CA0212.outlook.office365.com
 (2603:10a6:10:4b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 07:55:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Fri, 28 Feb 2025 07:55:02 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585");
 Fri, 28 Feb 2025 07:55:01 +0000
Received: from L66c1f771377e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1EB2AA15-4EB1-4071-A695-BB115D551C1F.1; 
 Fri, 28 Feb 2025 07:54:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L66c1f771377e.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 28 Feb 2025 07:54:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9692.eurprd08.prod.outlook.com (2603:10a6:20b:604::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 07:54:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 07:54:52 +0000
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
X-Inumbo-ID: 53eba832-f5a9-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oq9V5jwi3iZPNSeSQwK9q7W20Y+lP4WgPcVlruqZSjsUlUaPZfN+5nlyoF3Cm2pzr9xenog+3rSwX+ztXqNpEYVIKJQeUgLvhpb799s+8Qzy474aXgNCe/p4mrrUd1HxMwE6EtqOC0MvjE2NMSIg03hXTU48ZrAZiiQWZcUurAlGqSmpDOxsSRpVaqjFpPFEtADa0SEDQW0j+wZRFCrTTB0R2udwG/RfcBOUE8RrjAd0RIu6HiLl2udx651QGdrC/f8v0tafydEFGXu7+eXbnFRs5K4SWBtOS++p1zlzN5zZyTkuBJGqD1/Y80UXUmXLVVf8ES7M1Xu6mvGyLJggIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKqdTb8kcwuCt3olRZ0+RPtBsCy7U1eHRPKIA8GF9DY=;
 b=c8ESMKK3sUA00TR3iAUlEIUlaaBUQERMpPlw9LIhAresanEaMRxWtvse26xpTw23FUwkkvO44K/VrxbTzDdbmX/4INK5xPYor2KHapqMnDYLDf195ES42ESOSYQJ7Jf7+jmzCOqx1Ojam431xCefYLG3TV8OtJ8eaAEtLUzbtXTRAauZg3/W3TEQETNV3OSn0MPQhMwWVipymiHfl/Av9z5C7SFxqoiaNlRQV9ddRZhkN7E8fWYdh07NSWY9nVKIFE4ZRG+uxDVYOowMVq7H/TDV7tYDuQXWyTKxwRh0ypqDvtiupBFo+n6cqe8txjA5E3YMGNKerEIKv/2RlSb3YA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKqdTb8kcwuCt3olRZ0+RPtBsCy7U1eHRPKIA8GF9DY=;
 b=dr2j6tfLdfudiqR0nfx0Q1hWa65M4hTTLct3Q9Yby9WLOPZJLbck22Zl1fR9i23T4MfoDB5bTtZk89B0C/XlevRGznhBRAtGFhgieUx4webcFBbPRE0YVWnS7A7qqlAW+uca9aZlDjS6verU//ZXwZ4C8+X+QIHLNf2XgVNgCGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb52276d9a178314
X-TessianGatewayMetadata: 1NgFEAhuz7nQDLLt021n94CwyXvaAQLCyYsrsj7XP6/8zPpM693Os4nbaLsEPSMkNruqNRXbuRwnhWYynaLWLr+F3J6+dVDaHhtEqgA/TSCqA4oAAwPL/GuGNFHEQly28ZOP2SjkcC5EX+9ujEDN63ayNB94LEGl7VKCJ+hwIbY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj+4NeWtDS4G1g4fDAKzidGdlyblsWMGZbP+K+GbQEXNPttMb9w/3pNasbCiBolc28W5zuEDmKczI7rhB/2lGN4EzsnbUwtsE6GKO64eIh0ZdwUZek7Zr6W63c5e6YuFzdozfM/YDuP7bdcMgdvj1r3rNIx7p5e+SS3XuTjbeTJezvwGhFbYGyZTC/PLiENeQEn4jxwbbNSvfE/EATasQIrLWcIu41owpPIPt6XnlWBrZ1ABWx0NfjuYzJvZ5n1BZUIEVSKnIcCPJEPQRIYFZmpyU88XFeEq9o0PrBuws5UC1ag1E8nz97jy9LZhqociii9BPuse7/a0KKIahAjE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKqdTb8kcwuCt3olRZ0+RPtBsCy7U1eHRPKIA8GF9DY=;
 b=p+0jxLM3Lni6PVURuGXWf+u4ZmiUAGHfVk9CS4nxNtyqDwHz9k3w0u4BF4lN5dDFN4waNZBWdiXPzianNmQ/HRkCN81dYa5jeHKoprvJ9lujUZdqGTgEK71NFxeFZkZtmMqgClW1iP1gDEI2lqsKt62/uksnnyOz7q6d13U/JSUVRhoiVOmbf0PnbnNdfWEc9dPF0wePQicDFZoYCuJ3B+biNfWYKlpr72slLUEuFAfgR76UBP2UOw1VxdiwgQieR0svUhEv11GfwzcnruWung6v+T4a7ME3P1LTcVvKA2XTOSj6cHoYAdo82AG9p/73Oz9+e9bMgjxP48mWjpm6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKqdTb8kcwuCt3olRZ0+RPtBsCy7U1eHRPKIA8GF9DY=;
 b=dr2j6tfLdfudiqR0nfx0Q1hWa65M4hTTLct3Q9Yby9WLOPZJLbck22Zl1fR9i23T4MfoDB5bTtZk89B0C/XlevRGznhBRAtGFhgieUx4webcFBbPRE0YVWnS7A7qqlAW+uca9aZlDjS6verU//ZXwZ4C8+X+QIHLNf2XgVNgCGc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbiSmfhnajI8fAUU6893mrw5oGSLNbZAUAgAAlYACAANBTgA==
Date: Fri, 28 Feb 2025 07:54:52 +0000
Message-ID: <6B6C39FB-E0C5-4873-923D-32D4B277B224@arm.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
 <636358F4-C156-4304-9C75-A8DF36E16F2E@arm.com>
 <3ec73f8f-0a91-46eb-9ea8-461fc6bac373@amd.com>
In-Reply-To: <3ec73f8f-0a91-46eb-9ea8-461fc6bac373@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9692:EE_|DB5PEPF00014B98:EE_|DU0PR08MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: cb38d458-766d-4d59-389b-08dd57cd34ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?6DoDPmbUgiVS4Ct2vRCALLQPsBVLSWTIubV8dUylJRY6m6Mi0V+mWBuQGn0o?=
 =?us-ascii?Q?STlWLYY3czvFShQ9uhJ18GZmMMKsQgYMnhWsaTflpZBokr4Uzk8UvO0/0f1Q?=
 =?us-ascii?Q?je8Oy6oOyJ5HTC513MHX09+CQVW3h2HDc5pF8+lf//PmqYE12tRi/19yh5VQ?=
 =?us-ascii?Q?Q86Cvsc6Ulooj0yGhLQaUrX4XW+TgSkbECZRAek+BOtLdpr295YcVSQIyMnK?=
 =?us-ascii?Q?6UEOCCl2O7xKtHHUlLkuE/lOLD0v8Sus4WcIFH47lGgvx7t6aJBLGBB+35lb?=
 =?us-ascii?Q?l+6axd8uy9qywCRKH/vyMFUTVHdfLqFXTluTo9KrjLRUKR+vqV5dwv6nMh76?=
 =?us-ascii?Q?VchhEUGpuVcTtMU4MS2Az0qJzv1xELn9giXoYW2s/6zqM3YcJdrxhyzlacKh?=
 =?us-ascii?Q?QM/h/mO0WU14aeqEfeE7TDyZiEmgc/cXyhQbWNWZMZjJhjpG4uBMStf4mQp9?=
 =?us-ascii?Q?g4FSQo0HkGDC3IQbZS+Q1c63VI8gUkd68IVDvHq+MU30DBe6A9A8+ZCAZz0E?=
 =?us-ascii?Q?yEPhhjk08NdgTvHEvQRfGpDbTMpVuAXTDZupadmq+J0J1BxPZvZ7hq06uTA1?=
 =?us-ascii?Q?x5ANW+b0s/9HBt8lNG4a3hFzDWhKptqJUpRpn4Htab/H1Hsi0icKOM9Uou+D?=
 =?us-ascii?Q?GuN05Ppzo08pUr9TvTGkUzMHtJQJ0nqzIcMUG7lKWUWo6LKDXRPeNzlZPbe2?=
 =?us-ascii?Q?hknZL3FF+3jUPHmZJ0POUFf5H757K+ybgpkEGtV1NLb9gtMYBcIokQPkWzCZ?=
 =?us-ascii?Q?r5xA1KTksLxgRow0vofSkPA263eeHcKT/S8FXi/ANJmCqs5RmZmlDWH6x3BG?=
 =?us-ascii?Q?ZMwLaurLHBVamBjR0zrHmUHa6SK2sq7yP4nYCCZ0EvhJyia3X9mQ4ndg6vyF?=
 =?us-ascii?Q?tIaL+eo7GS1FpB93gio2vWN8tCpb340yIAQDAdI8zg5lFuzhJVXW14zaDMS2?=
 =?us-ascii?Q?ZiSur6OQoKnuqzkzRkP4ud1mb6jRtLTW/ymVxInL46TOILR0xJCYbWN+Sqoh?=
 =?us-ascii?Q?TI0rAix4zlBpkZGYJIQrEARXGpmQK3O5nDvet3a2qHlIFWDh8INdgOzfQzc2?=
 =?us-ascii?Q?XAqT/6s60acJZCqloAQVMbMeI22l6XFBQPqYz9J/VmXMEefFuSt/nk9PYN4c?=
 =?us-ascii?Q?fqdxkA740Pg+Yt/j25kkW3BZzzkvL8Ayv/kfxWUGnYgybipaP3f9Al02Hwpa?=
 =?us-ascii?Q?dBM0/p9zzKYDmDaEL00wj297DvcPKl/b2+JRxPRQDp0i9xDf8UILy7/rAcv9?=
 =?us-ascii?Q?JmBpuYO9R402hqm30ieIRf/6wE3a4BpFlR53uT92DdpqummoT4DhxQPHIYRb?=
 =?us-ascii?Q?C7UDn//AQvgP6lGNmersZJ/TvkyV4Y7O5Fz8270b5qGrndqV05X+DxEUIsjj?=
 =?us-ascii?Q?FbGHc8e8YkiDvzsSDuyQoqbwi3ORUfqtbV016bgiLB8uMMXdww=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <782A60F5E9882A478B7CD9F8E8804DF9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9692
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99fc8117-43ff-46bb-b543-08dd57cd2ed4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jObQsy2c+7CdBdYNbmME0fDqnqhkSSCf6DSPVhwB37QjMBD1kUm1RoEEEsC+?=
 =?us-ascii?Q?BmU69KKg/m97nHf/38IDYarIFXzX0lWMN81W8jt4jSZBuxBNqieFasUF8dNp?=
 =?us-ascii?Q?Sy9y0cwltfFSdWX0jp5TA7BDFB5oKzK8ySUtHnvcOVdoVD5dLEGQBH16Iu2x?=
 =?us-ascii?Q?pHF4GW5tss51hIEVJrEwa3WweDadvP6gYd5iItu+X9enu23VNciP2JnU2unH?=
 =?us-ascii?Q?aZ5FygrdNxrJ0aGO0SPv4EVIpDAzD3PgRw78GJ9JnnSRyezz1pTHy+csRzH1?=
 =?us-ascii?Q?thQUYCLWnKDwb3DV8z2V38VdBAtwKBOGxuHp4iWk57+fR5Qt1SF5Aj/YxAYa?=
 =?us-ascii?Q?VFkv7X2HuDUu02Zpo+R8m6VZDCmOWJaA44vpGjvTFfmMuqJ5Zv3ys2xyx4TJ?=
 =?us-ascii?Q?8ULGeqS54bsBhHNtL1dkm1LqgNzxJo8yrweENCbk+x3o2p91CHVT3cQNUAIk?=
 =?us-ascii?Q?Ow8Gbhn4NNT6wYhttg5czc0d1R1xXqEXccs633DhoGH59u9Yxu3ovQZcOw+x?=
 =?us-ascii?Q?sqAMK+wpBqnOywHihdQ7JqbCW5MnHIxyv7W0+b2putsyyp491kiV5Q9qQMAz?=
 =?us-ascii?Q?PIKxNjWfseDOI/QL42sJXP4L5VtZyHNmifAuUxO4M+3l0bERitzrVNZTHGWQ?=
 =?us-ascii?Q?MJaitvgXd6DnSnplKjIbuPgwGh9GHGqroIiK1ayUmzv3CbhdCYW7sR8bIqvs?=
 =?us-ascii?Q?xcYbPVjN+PHzHU50yAaO9xQlIsQFMGyHpLLq3A1maGU46nPFAsRGuUoZyM0a?=
 =?us-ascii?Q?/w067cuWsOTJeOnWccgBGowlie+Az3d8aC1BKWTzkCTbjrXpv7SvZu2swnlq?=
 =?us-ascii?Q?uebALPP4HgIVkTjWyJQsfxd+KkmEXNQ2hQVOnkB9xbQT8A2bTL6RsHxRb02x?=
 =?us-ascii?Q?h7o1g4ItlTWCxlaSBWkSGdqnefbp1qcIF4K+zfCinPPiGQ+HYBQWiM3LHPsV?=
 =?us-ascii?Q?yH4srwTiV/+53eWUjXPH+hXI7+zHgdRiQuENrbog9Xv3xd8Vrwbr7OmdfFKa?=
 =?us-ascii?Q?ByJYJPCfcN7v2fmI7HkutHoOerrC2GM5CGEXXwGKWR7emRxC7kmhv1LlsgN3?=
 =?us-ascii?Q?O6tTJ/EdvLk2AjHlqh+LM6SOrzubs/FUU1ybrUPo2STzj1RwVmSqHdWey2wN?=
 =?us-ascii?Q?1bkhtaI5IhoG8u/c5XrBL2MEfiN6mfGElYnoi9iZdT43ZKJqzMEW8kCPAz+h?=
 =?us-ascii?Q?cZUCfyA77bSpefp9EiZ9bN4jWBiiquQBd+C6pf63O+TCi7xDkUaF12yxGrwh?=
 =?us-ascii?Q?EzFaGVsRvcpj13DC9FPfIz3qp1UhG+2uLkzXbRzIQyiF6hxjdwQb5CUhDYli?=
 =?us-ascii?Q?jlyFTNgABuXNAcG4VTireV15wY/nZ0lh4+aXoe+7nzYBSD8YUuRHAal8Ptmd?=
 =?us-ascii?Q?v2HCrCjmER8YRLM6cNmkL2A0J2n81jjomI3Z/6tiIeIiaZsyNrWhXJ1kRZUG?=
 =?us-ascii?Q?mpKnwjuegpkadm0jmwrVseYX8XDAxBG3?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 07:55:02.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb38d458-766d-4d59-389b-08dd57cd34ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7517

Hi Ayan,

> On 27 Feb 2025, at 20:29, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 27/02/2025 17:15, Bertrand Marquis wrote:
>> Hi Ayan,
>=20
> Hi Bertrand,
>=20
> I have just some clarifications.
>=20
>>=20
>>> On 27 Feb 2025, at 16:09, Ayan Kumar Halder <ayan.kumar.halder@amd.com>=
 wrote:
>>>=20
>>> In the current patch, we have defined the requirements which are common=
 for
>>> all the commands.
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>=20
>>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does n=
ot return
>>> 0 for success in all the cases.
>>> 2. Reworded the requirements so as to write them from Xen's perspective=
 (not
>>> domain's perspective).
>>>=20
>>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
>>> docs/fusa/reqs/index.rst                      |  2 +
>>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>>> .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
>>> 4 files changed, 134 insertions(+)
>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa=
/reqs/design-reqs/arm64/hypercall.rst
>>> new file mode 100644
>>> index 0000000000..ffd883260c
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>> @@ -0,0 +1,55 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Instruction
>>> +-----------
>>> +
>>> +`XenSwdgn~arm64_hyp_instr~1`
>>> +
>>> +Description:
>>> +Xen shall treat domain hypercall exception as hypercall requests.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Hypercall is one of the communication mechanism between Xen and domain=
s.
>>> +Domains use hypercalls for various requests to Xen.
>>> +Domains use 'hvc' instruction to invoke hypercalls.
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Parameters
>>> +----------
>>> +
>>> +`XenSwdgn~arm64_hyp_param~1`
>>> +
>>> +Description:
>>> +Xen shall use x0 to read the first parameter, x1 for second parameter =
and so
>>> +on, for domain hypercall requests.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_first_param~1`
>>> + - `XenProd~version_hyp_second_param~1`
>>> +
>>> +Return value
>>> +------------
>>> +
>>> +`XenSwdgn~arm64_ret_val~1`
>>> +
>>> +Description:
>>> +Xen shall store the return value in x0 register.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_ret_val~1`
>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>> index 1088a51d52..d8683edce7 100644
>>> --- a/docs/fusa/reqs/index.rst
>>> +++ b/docs/fusa/reqs/index.rst
>>> @@ -10,5 +10,7 @@ Requirements documentation
>>>    market-reqs/reqs
>>>    product-reqs/reqs
>>>    product-reqs/arm64/reqs
>>> +   product-reqs/version_hypercall
>>>    design-reqs/arm64/generic-timer
>>>    design-reqs/arm64/sbsa-uart
>>> +   design-reqs/arm64/hypercall
>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/marke=
t-reqs/reqs.rst
>>> index 2d297ecc13..0e29fe5362 100644
>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>> @@ -79,3 +79,19 @@ Comments:
>>>=20
>>> Needs:
>>>  - XenProd
>>> +
>>> +Version hypercall
>>> +-----------------
>>> +
>>> +`XenMkt~version_hypercall~1`
>>> +
>>> +Description:
>>> +Xen shall provide an interface for the domains to retrieve Xen's versi=
on, type
>>> +and compilation information.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Needs:
>>> + - XenProd
>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/f=
usa/reqs/product-reqs/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..03221f70c3
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> @@ -0,0 +1,61 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Version hypercall
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +First Parameter
>>> +---------------
>>> +
>>> +`XenProd~version_hyp_first_param~1`
>>> +
>>> +Description:
>>> +Xen shall treat the first argument (as an integer) to denote the comma=
nd number
>>> +for the hypercall.
>> You speak of argument here and parameter earlier.
>> I would rephrase to: the first argument of an hypercall exception as the=
 command number for the hypercall.
>=20
> Ack
>=20
> Should I do this everywhere ?
>=20
> s/parameter/argument
>=20
> That would make it consistent.

Yes definitely=20

>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Second Parameter
>>> +----------------
>>> +
>>> +`XenProd~version_hyp_second_param~1`
>>> +
>>> +Description:
>>> +Xen shall treat the second argument as a virtual address to buffer in =
domain's
>>> +memory.
>>> +
>> Same here on argument vs parameter.
>>=20
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Return Value
>>> +------------
>>> +
>>> +`XenProd~version_hyp_ret_val~1`
>>> +
>>> +Description:
>>> +In case the hypercall fails, Xen shall return one of the error codes d=
efined
>>> +in http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/include=
/public/errno.h.
>> This is a very imprecise req as it does not states what can fail and wha=
t should be returned exactly.
>> Do we want to be that generic ? if yes then this might be a requirement =
valid for any hypercall.
>=20
> Yes, you are correct.
>=20
> I am thinking of pushing this further up ie have this requirement at mark=
et level and leave it **unlinked** to any product requirement.
>=20
> IOW, we don't need to validate each and every error code returned by the =
hypercall.
>=20
> Or should we just drop this requirement ?

I think you should move this requirement and make it a generic one valid fo=
r all hypercalls.

Now at some point you might have to describe which error is caused by what =
problem as part of your hypercall interface definition.
ie: one generic product req and per hypercall design req describing the err=
or cases.

At the end you should have a test to trigger each error condition and that =
test will be linked to the design req corresponding.

Cheers
Bertrand

>=20
> - Ayan
>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> \ No newline at end of file
>>> --=20
>>> 2.25.1



