Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D289AE154
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 11:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825062.1239259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uQ0-0000mh-AW; Thu, 24 Oct 2024 09:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825062.1239259; Thu, 24 Oct 2024 09:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uQ0-0000lA-6g; Thu, 24 Oct 2024 09:46:12 +0000
Received: by outflank-mailman (input) for mailman id 825062;
 Thu, 24 Oct 2024 09:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sutq=RU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t3uPx-0000l4-Va
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 09:46:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2612::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb1eca25-91ec-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 11:46:08 +0200 (CEST)
Received: from DB9PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:10:1da::21)
 by AS8PR08MB8085.eurprd08.prod.outlook.com (2603:10a6:20b:54a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 09:46:04 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::30) by DB9PR05CA0016.outlook.office365.com
 (2603:10a6:10:1da::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18 via Frontend
 Transport; Thu, 24 Oct 2024 09:46:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 09:46:04 +0000
Received: ("Tessian outbound 4a86a9c66651:v490");
 Thu, 24 Oct 2024 09:46:03 +0000
Received: from L231e3a137189.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16C46FA7-6C10-48D8-889A-5E5699B2F6CE.1; 
 Thu, 24 Oct 2024 09:45:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L231e3a137189.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 09:45:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB7844.eurprd08.prod.outlook.com (2603:10a6:10:39f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 09:45:53 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 09:45:51 +0000
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
X-Inumbo-ID: cb1eca25-91ec-11ef-a0bf-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kaxLyZCi+cPfOaJHkQ8+hnaBEv+tyENBl5JpAaoJHBoWRl/9U9wLlIjiVYKnBUujnu6zs4pJYljTa7VD/07XmkGl7OHT9MNF9G+A8lB8g9QaNTN0cYqKGA5SUkheMc5IFJuXnNX06XHLb8rbZ4WNdXOk4hbGctFCxwy7fkNAwjQb1aIZ2gqDse7h4FuxIniZ2SNcHHbtOsCokvPGzZw9R0XE02WAqKzkRg0gTlxGUNrJNbU+v/FXZDOZKHSIIdYSYJcqudZeE/iADcbRBwjPaNuwXAGF2/3NIhpR+e9G0L0L25vKaGkHJzL/tVpESUcvjb5FG/p6sWYQM4dSzsWtvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvpmb4XSfDT2J8qMyivqRYObXU0qaaetStJJKvGOazw=;
 b=xtAxTsfk0HGBySv2OjoEbBXOxImWLOiHWoHz37S+B7b678BQoR/qg1icKKHLDhQMH82AdFpN2xgai8am8OpYX0WktoeZugiHyXhMK0xn7qcBPI5+o2Lv2syDHNrrPeH4QaQY6ku1DnSeDSbvsj4BEpSimbCY7wrcKzefmk6YlHHa/YfEOwh0eAp9EZnrnKdLa/zve7jpUaIitsRdZ0a/33ClZyqtr98+TT0rHF63F/eVdGzB6BPdiV3eQqZqc7uCP4sAM55jpFtt3DJaTo5lX4RSnzXRllyQ755enqzKlNgJv3Wk1sm0/+MSn54+Ldk9mTJpcxEJpoqYYPaouXD3Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvpmb4XSfDT2J8qMyivqRYObXU0qaaetStJJKvGOazw=;
 b=Id+GuCKh+Rdbe+/OwjQ+hdEdlAACHcB0dXi3gCgdsCvLcV5jZxgvG5574r0O65UBPkdAVi3NydbdasZhBtJszlsgsvwX6ndNBN3ca/iLLg8/BZZpnZDqQWo39e1MbBKsvnhFCFDuBUsqXJR28hW25qUz/JtU5Pw7Ag4qKwWy7t4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a42372db3c062180
X-TessianGatewayMetadata: OuGdYVsPRxZOJlL614OvKUYTzFIq6oV7VCB0/IAPHM0Q0QOzjIPiukjGLE3fNgsziRCxefCADeKJ+1jtwo4JITUPGUhF6XyQin2OkaU8UafxTdIiuDOlGlXWcwbwP6OkRJmd0rvAK2pkhg4R49V5MfhXfqqrwe6i5GuHpnIiqWM=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcqEcqG6fAIp8hFL1zClFhvuLG7bSUB5XYYGmQGBFlTS8e5BNOY8H2g9E1WX5t+dU8Tj0G8biyUCCYUw5iLhxgnjVmAYoTFak112uCuwwntBnPPMVl09Zv7wl1pP5UOg0W+1iKCm8PK+eTz2Cj62+WUKKmWOyJtQj2OKm/t8QVJEMz1KMTt5luI0Bh8GME7VByCTzC4EPmOPfaGYQqqTxhweXy+QnQck24yNzrw5Akgy1Mz5gq4JYOv54Ep2XdNHgfZmJyHi1u85OnJYqTmGtgYH/3XRyNZ5iLPcmN/aBvmWeqxPFmvMxpLtfSdcBpO/UOgYjNYk8sbgY1FguBRzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvpmb4XSfDT2J8qMyivqRYObXU0qaaetStJJKvGOazw=;
 b=h3pFos1VqdYUKNUF5nTS+Y3Dq9GrrIzuzjRk3z0M4XOGKUe5K25w/YkPdI4z18XMZrozC4qfG0KPI5T62m/Pa5HiHO0y205YLcVc1svRhzBn9szPCQ24hrpaubdz7Sq8/HvY05XCi/VUpIrMGJLqTmWiG+U7RipTC/NtJELc/k/IXJnas9WMJ43m++DuwMBb5F2e57Myrc2od9j3Qr2AuX3R5vHua5b3wj7QD1c2FuLG+EONYdU28IlHb9cDk0ZeTBvx/qZQdaWGX0xykvfBDvpNuNZqcVzRh5u0WN5bz+dORQVvC1C7IB56HEKyqfaJtaSWeZjz10mGIPSb7n/jQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvpmb4XSfDT2J8qMyivqRYObXU0qaaetStJJKvGOazw=;
 b=Id+GuCKh+Rdbe+/OwjQ+hdEdlAACHcB0dXi3gCgdsCvLcV5jZxgvG5574r0O65UBPkdAVi3NydbdasZhBtJszlsgsvwX6ndNBN3ca/iLLg8/BZZpnZDqQWo39e1MbBKsvnhFCFDuBUsqXJR28hW25qUz/JtU5Pw7Ag4qKwWy7t4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
Thread-Topic: [PATCH v2 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
Thread-Index: AQHbH6X5dqMp+H3mmUmu98Cla1V2hLKUdsMAgAE86oA=
Date: Thu, 24 Oct 2024 09:45:51 +0000
Message-ID: <CDDAEF0D-92C4-45A4-95C1-E775A26DB03A@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <f6037d0d077d793864ec10875dccf9e82a19e100.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44F5yXW5yb_+RgBrof7c3yRoMp3Jh2n3OkAVV2mND7c6QA@mail.gmail.com>
In-Reply-To:
 <CAHUa44F5yXW5yb_+RgBrof7c3yRoMp3Jh2n3OkAVV2mND7c6QA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB7844:EE_|DU6PEPF0000B621:EE_|AS8PR08MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0b04df-af29-4270-5a82-08dcf410ad26
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SE44SmtvMFVOYXlMSFllblYyOWVoQU02VWxhdXh6ZzVvbHhuUWhqd3dMNlF2?=
 =?utf-8?B?OGFnTlV0ckRzLzRGMS9nUG16T3hrS2Q3NVZIUzFIWVJFNk4xTVNEMGhnUEdF?=
 =?utf-8?B?YVFacEU2MTNybnNjMzdWOU9XWEFHNUYxV0Rpby9mSGowTVRvRWxBa0VnYXVa?=
 =?utf-8?B?TzBKOHIyWXZERFR4eXQ3clFiRWhqT2IzS2JLWTRDUHFNTXRSMElza0lUVElt?=
 =?utf-8?B?Kzh3RklKNEhDQ2htcCtKQ1M2dll2QnVWbWtXRytMTEhGeXZrRW9adnQyOWxL?=
 =?utf-8?B?Vzh6TUtxWEs0amp1WFR0Q2ZSL3k0TjFXRnQ3Q1ZtcDFKVmJMRFlWaGJrQzhL?=
 =?utf-8?B?ZE14bkZJb0Zmdlc4ajZ6cjk5STE3MzFHZ2FaVXZSRkRUNDVwemdxOGREbEs1?=
 =?utf-8?B?cmRKMUtWMkZBQXc4QTJGVGQreTJhTnFaTXJLNDB3Y0xDbElOL0lmblIvbUFn?=
 =?utf-8?B?ZWFnYW51a1ZpRmR5MWFPSWdIU3h5Slplb3ZUTnB0ajlVSFJ1WXN1aTlxZzE1?=
 =?utf-8?B?RVZDbDdiWk1wekV4MWZMSGI4MzZNTDFLblIrOWJGekFjWHNNaG9IWmFLajA5?=
 =?utf-8?B?T0ZkVXI1dHdmb0tObU90TnB1Vi9tV3JRQmVaOS9CYUEwbThHSmxOekdReVps?=
 =?utf-8?B?dVo5RFhmNS9va1E0Y0R5eXkyUVhtdmtuUWNRVW9adFRPTzVtNm1oZkJRZmI5?=
 =?utf-8?B?dnU0cVM5WVNGKzVhWTRDcDh4RTB0c2tLQkhSNzJVRC9xWVBlSytBcitaZTJQ?=
 =?utf-8?B?TE9xYmJmalRieU03YkhXaGlTY3FxSW5CTFdzck96ZS9VRWpKa1ozWWxjaDh3?=
 =?utf-8?B?d0NlR1pNTjJJdENOeEl1aEl0NEhGME1XYm14dFl5UVlzMzYvQmJmTENSZ3NU?=
 =?utf-8?B?VGdJYkxkTlBTVXZ2bDY2ckVudytQUFh6ZHZ3c1dhdVZwcGQ4MDh2UTNzelBt?=
 =?utf-8?B?bXYwOFBrNzVIdForMGYxYWQvZXgxQ25NcjNybFhDcU5pa2U5akR1MGZlMlhC?=
 =?utf-8?B?cWM2Q2tUZzlrVVgzY2dCOHQvN2preHJMNERucHNWaTdaQWtWd0VjMlNxU2pS?=
 =?utf-8?B?OHNEcDZVQVo3ZWovMFRKYTVqYlBoaEVCK2V5TWFZaTNrRitzZ3NjeFRjTWlX?=
 =?utf-8?B?cGlhUFhXeEpGSEpPNGxWbnZZLzV5SUNTa1JCU2NXc0R6ZlpiWHZzMExwdkxX?=
 =?utf-8?B?ZjZIYlJTVjdzQ2dKR3luS3pkak5rZXRZN1JFTmZMcW1CQ0g5d1MvclRCd3NC?=
 =?utf-8?B?T1llMSs2Q25mVXRPdVQ1SnMxcjI2aHhIZ3pmQTI2Ym03cW9RR0RvZElkcmkz?=
 =?utf-8?B?anVMNm0weWQ1MnFBUnFRNjAyVVIrK1VleUQ3WmltZm1CNlc0dWdrRVVpQWl6?=
 =?utf-8?B?RHZGUWZSN0orZmVkK1IyYTE4UXlLNDlDQ3R0RngwaTQ5Yk5aaVBHaHNnWGFG?=
 =?utf-8?B?c1VJWXBkNjc0Rm5qSGVaaTdKOC9TSWZCK3dYYkhaNU5tT2Z3SVEycnJJK21I?=
 =?utf-8?B?bVZJRFQxQ25BNGlCVllVaEJMVXk3V0dhNkY4L21xS2NkZ0QvelpKVDYxYkZO?=
 =?utf-8?B?ZGtZRTZSdHpYckNYclpsMCtsc0NBbXRpQ2M0WjBaTUFuekoxZS95czhpUlRi?=
 =?utf-8?B?NEs3bjBEMnFrNmU0MEZlTXlIdmlFdTB1dkZXOUsvb1R5a29EWXFzdXBEUWE0?=
 =?utf-8?B?WDhkbUNiSEgweWRTTm5KSTFVbDhsREJlNzBIWTR6OXBhQVhlMWR0YzhSLzhR?=
 =?utf-8?B?a2Q0VlROZ2VKSXBEOGFRWGdZZ2ozUTZhSW4wbVRWTngxZjBkVEp5QTlDcmdk?=
 =?utf-8?Q?7bp8ooxaU3MNVUU4ZGBaldzZe1qHMBlsvYiGU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6E8A21A72AE71469FDF75B4ECA422F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7844
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd6e9604-4a0b-4114-6d07-08dcf410a5c4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXQ2ZFM4S2RhRkk1RElTeUxXQ3NTUzJRUDNYSXNHYVBvTE9lcU5mb0xhRTEy?=
 =?utf-8?B?RGRGcGdyeC9DRFhnL2Juc2VGWWNvZ1BORGhJOHBIK3lHMmVwd2ZhNTN6SVFk?=
 =?utf-8?B?a0xpbVN2QmNNTnVMSmNNY1ExZkNLT2lzdnFub25XSUN0ejc2Z1JxY3pmRnZz?=
 =?utf-8?B?RjB2VUt6ckNCK2g0c1ZHdmpyZCtLeklKRnNJL1dPYWovbGlaQVBhOGVjdWpp?=
 =?utf-8?B?RTkxaDJqdUlPYnJlTjVYcjNLVFl5RjExUXBPakdrbDc4NXhSK1hOSDdOUG1x?=
 =?utf-8?B?b1hFbEpBTHNzc3p5Qm5XMG1GQy9wUWlaZWlhOE14R3k3cnpxN1JTSzc4bDdO?=
 =?utf-8?B?NEVFdVlOV0hyclZ3QUtPL1dMN2ozZUp4ZUFKbG1OcDRoTmhIQkxENi8yMU5U?=
 =?utf-8?B?eURaT2Nob1lRbm85THU3cTZQQ0R0OHFGMStlelFTZXBWQlJJY0tkeGZDK3Z5?=
 =?utf-8?B?M0t5NDIyeTY1K21BODJUdGF2S2w1R29TNDhEMDFWQUtMeElMcFpjTXJXTlIz?=
 =?utf-8?B?UUY3Uzh1cUtaV2RUYnJWTTUyREVzYm80Yjc5YW4wcUR3QUx5bC9IR1pUYTZZ?=
 =?utf-8?B?MnlNV2xJRTJpOGJFSHJHQ0h5NjVXTWpDYnNNS2RDd0dKQll5QmFsT0I5NUR2?=
 =?utf-8?B?a1UrYmxBM0d6Ym5GejR6dk05TFhvbzNLaWd3ZkVmV2NNbzBJdllyMFNGYm5I?=
 =?utf-8?B?ZFZJZk9sUmx5SXZyai8yMHB3WVlrRGk0cVJ4MndBajZKd3Y2ZlR0bzcwZGRW?=
 =?utf-8?B?OWl1cjlJaElmUmpnSzF1RUdoM2w5MUZyNERsbEJvZXZFWWdPVEdsSFBNUC9z?=
 =?utf-8?B?a0xLOG1DblZqZG45THRqOVM1bzFhQnNtOXJ3NHFzR1Y2eThJOVNlK0RReHpN?=
 =?utf-8?B?ZSt4R3N6NE9pSlpwVjlxQ3g2U2N1UGpXeXJmREhnV1dxT0UzM3ZNOUYwSHRL?=
 =?utf-8?B?MktTKzdxZ3IyNHJwTXlRZHRtek8rVzdGQ2pJNUpXc3k3Y1JmNnVJUkhYOVdB?=
 =?utf-8?B?NVZqSG9uaHNoYXM3M3NOS2VnVVp5d2RXenBuSHMyMHd1OURvY0VtcUY3YVpB?=
 =?utf-8?B?a01BOXQ2NUVzTVR6TTVNSWN0dDNqN1ZxZG9ybkpnMWxNT2hwWkhBOWd4NGxF?=
 =?utf-8?B?Mm9ENFYxZzJFMzJyc0tEYUV5U1JSeTZjVE5ZUGJrd2FaY1czd1NtVU9WTUE5?=
 =?utf-8?B?N1hXeGtSa2w0RUQrbkZ5RTJ4TE9KcXV5a0FvUEFRcHJsZWx6Q0ZMOVdDK3Jp?=
 =?utf-8?B?QUh2S1JjOUY1UDNLSFVsd3dhZU5oRDZjWXg3ZkI1MjhIeGE0akNVcXRtRldq?=
 =?utf-8?B?U0FKaEpibXlib3pxUTZoZEU1SkM1aGV5Y0l5SDQ0b2FhbnhreGxwbGloWDNL?=
 =?utf-8?B?WTByZUpWVFdpcERZb2xvZnhRRUptNWpudVNzdkdYMFFPTENVSW5HazdGYS9Y?=
 =?utf-8?B?V0gxeHptdEhpdnY4V2dQczBwUHhBVnpQR25XVVV5SzJkcWdZaTVZczAzMDFY?=
 =?utf-8?B?Y3BPNjRVQ0xYTHEyUmNEV1dGTnVKbUFCY0JHODJkVHNjRkozT2Y4WXNydHNp?=
 =?utf-8?B?bVFLbi92dTFNendTRTdZdVFCY0ExL3pCRlhld2FqdXdPWUt3RjBmalRXbi9H?=
 =?utf-8?B?SUY2Q2M1dkdXS1NCRm5qN3kyZHlIT2kzcU1ab0Vwb0F5WnVqdzNuMmZ4elpB?=
 =?utf-8?B?czZHU1JCbDZXL3daYW9jbFhLYjV2akNiaFpsL1FMS2pJNW8zUVNKOTRKeHhZ?=
 =?utf-8?B?bHJKMDVSM1FPaFFiMEJ6ZVcyZEtpc05EQjd6SmE0aGRQdFdNSmRmOFR3RTVE?=
 =?utf-8?B?Y1lxZk5hRGZyd0VYUndqRzVBbWhLMEk4aktNVWFiWmhrV0grc25VOUJZb05h?=
 =?utf-8?B?b2RSQzhDUHRFMGNkM29NUXVScTl0cUpyUmNsZFR0ZkFQSmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:46:04.1237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0b04df-af29-4270-5a82-08dcf410ad26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8085

SGkgSmVucywNCg0KPiBPbiAyMyBPY3QgMjAyNCwgYXQgMTY6NTEsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6MzLigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBXaGVuIGFuIFJYVFgg
YnVmZmVyIGlzIG1hcHBlZCBieSBhIFZNIHRyYW5zbWl0IGl0IHRvIHRoZSBTUE1DIHdoZW4gaXQN
Cj4+IHN1cHBvcnRzIFJYX0FDUVVJUkUuDQo+PiBBcyBhIGNvbnNlcXVlbmNlIG9mIHRoYXQsIHdl
IG11c3QgYWNxdWlyZSB0aGUgUlggYnVmZmVyIG9mIGEgVk0gZnJvbSB0aGUNCj4+IFNQTUMgd2hl
biB3ZSB3YW50IHRvIHVzZSBpdDoNCj4+IC0gY3JlYXRlIGEgZ2VuZXJpYyBhY3F1aXJlIGFuZCBy
ZWxlYXNlIGZ1bmN0aW9uIHRvIGdldCB0aGUgcnggYnVmZmVyIG9mDQo+PiAgYSBWTSB3aGljaCBn
ZXRzIGl0IGZyb20gdGhlIFNQTUMgd2hlbiBzdXBwb3J0ZWQNCj4+IC0gcmVuYW1lIHRoZSByeF9h
Y3F1aXJlIHRvIGh5cF9yeF9hY3F1aXJlIHRvIHJlbW92ZSBjb25mdXNpb24NCj4+IC0gcmV3b3Jr
IHRoZSByeF9sb2NrIHRvIG9ubHkgbG9jayBhY2Nlc3MgdG8gcnhfaXNfZnJlZSBhbmQgb25seSBh
bGxvdw0KPj4gIHVzYWdlIG9mIHRoZSByeCBidWZmZXIgdG8gb25lIHdobyBtYW5hZ2VkIHRvIGFj
cXVpcmUgaXQsIHRodXMgcmVtb3ZpbmcNCj4+ICB0aGUgdHJ5bG9jayBhbmQgcmV0dXJuaW5nIGJ1
c3kgaWYgcnhfaXNfZnJlZSBpcyBmYWxzZQ0KPj4gDQo+PiBBcyBwYXJ0IG9mIHRoaXMgY2hhbmdl
IG1vdmUgc29tZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbiB0byBmZmFfcHJpdmF0ZQ0KPj4gZnJvbSBm
ZmFfc2htIGFzIHRob3NlIGFyZSBuZWVkIGZvciB0aGUgTUFQIGNhbGwgd2l0aCB0aGUgU1BNQy4N
Cj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVp
c0Bhcm0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSB1bm1hcCBWTSByeHR4
IGJ1ZmZlciBpbiBTUE1DIG9uIHVubWFwIGNhbGwgb3Igb24gVk0gZGVzdHJveQ0KPj4gLSByZXdv
cmsgdGhlIHVubWFwIGNhbGwgdG8gdGhlIFNQTUMgdG8gcHJvcGVybHkgcGFzcyB0aGUgVk0gSUQN
Cj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmEuYyAgICAgICAgICB8ICAgMiArLQ0KPj4g
eGVuL2FyY2gvYXJtL3RlZS9mZmFfcGFydGluZm8uYyB8ICAyOSArKy0tLS0NCj4+IHhlbi9hcmNo
L2FybS90ZWUvZmZhX3ByaXZhdGUuaCAgfCAgMjIgKysrKy0NCj4+IHhlbi9hcmNoL2FybS90ZWUv
ZmZhX3J4dHguYyAgICAgfCAxNTggKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0NCj4+
IHhlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5jICAgICAgfCAgMTUgLS0tDQo+PiA1IGZpbGVzIGNo
YW5nZWQsIDE2MSBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+
PiBpbmRleCBhMjkyMDAzY2E5ZmUuLjQwZWE1Mzk4ZmEyMSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9h
cmNoL2FybS90ZWUvZmZhLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IEBA
IC0zNDcsNyArMzQ3LDcgQEAgc3RhdGljIGJvb2wgZmZhX2hhbmRsZV9jYWxsKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgICAgICBmZmFfaGFuZGxlX3BhcnRpdGlvbl9pbmZvX2dl
dChyZWdzKTsNCj4+ICAgICAgICAgcmV0dXJuIHRydWU7DQo+PiAgICAgY2FzZSBGRkFfUlhfUkVM
RUFTRToNCj4+IC0gICAgICAgIGUgPSBmZmFfaGFuZGxlX3J4X3JlbGVhc2UoKTsNCj4+ICsgICAg
ICAgIGUgPSBmZmFfcnhfcmVsZWFzZShkKTsNCj4+ICAgICAgICAgYnJlYWs7DQo+PiAgICAgY2Fz
ZSBGRkFfTVNHX1NFTkRfRElSRUNUX1JFUV8zMjoNCj4+ICAgICBjYXNlIEZGQV9NU0dfU0VORF9E
SVJFQ1RfUkVRXzY0Og0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRp
bmZvLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wYXJ0aW5mby5jDQo+PiBpbmRleCAzY2Y4MDE1
MjMyOTYuLmZkZTE4N2RiYTRlNSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZh
X3BhcnRpbmZvLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMNCj4+
IEBAIC0xMjEsMTEgKzEyMSw5IEBAIHZvaWQgZmZhX2hhbmRsZV9wYXJ0aXRpb25faW5mb19nZXQo
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgIGdvdG8gb3V0Ow0KPj4gICAg
IH0NCj4+IA0KPj4gLSAgICBpZiAoICFzcGluX3RyeWxvY2soJmN0eC0+cnhfbG9jaykgKQ0KPj4g
LSAgICB7DQo+PiAtICAgICAgICByZXQgPSBGRkFfUkVUX0JVU1k7DQo+PiArICAgIHJldCA9IGZm
YV9yeF9hY3F1aXJlKGQpOw0KPj4gKyAgICBpZiAoIHJldCAhPSBGRkFfUkVUX09LICkNCj4+ICAg
ICAgICAgZ290byBvdXQ7DQo+PiAtICAgIH0NCj4+IA0KPj4gICAgIGRzdF9idWYgPSBjdHgtPnJ4
Ow0KPj4gDQo+PiBAQCAtMTM1LDIyICsxMzMsMTYgQEAgdm9pZCBmZmFfaGFuZGxlX3BhcnRpdGlv
bl9pbmZvX2dldChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgZ290byBv
dXRfcnhfcmVsZWFzZTsNCj4+ICAgICB9DQo+PiANCj4+IC0gICAgaWYgKCAhY3R4LT5wYWdlX2Nv
dW50IHx8ICFjdHgtPnJ4X2lzX2ZyZWUgKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICByZXQgPSBG
RkFfUkVUX0RFTklFRDsNCj4+IC0gICAgICAgIGdvdG8gb3V0X3J4X3JlbGVhc2U7DQo+PiAtICAg
IH0NCj4+IC0NCj4+ICAgICBzcGluX2xvY2soJmZmYV9yeF9idWZmZXJfbG9jayk7DQo+PiANCj4+
ICAgICByZXQgPSBmZmFfcGFydGl0aW9uX2luZm9fZ2V0KHV1aWQsIDAsICZmZmFfc3BfY291bnQs
ICZzcmNfc2l6ZSk7DQo+PiANCj4+ICAgICBpZiAoIHJldCApDQo+PiAtICAgICAgICBnb3RvIG91
dF9yeF9idWZfdW5sb2NrOw0KPj4gKyAgICAgICAgZ290byBvdXRfcnhfaHlwX3VubG9jazsNCj4+
IA0KPj4gICAgIC8qDQo+PiAgICAgICogZmZhX3BhcnRpdGlvbl9pbmZvX2dldCgpIHN1Y2NlZWRl
ZCBzbyB3ZSBub3cgb3duIHRoZSBSWCBidWZmZXIgd2UNCj4+IC0gICAgICogc2hhcmUgd2l0aCB0
aGUgU1BNQy4gV2UgbXVzdCBnaXZlIGl0IGJhY2sgdXNpbmcgZmZhX3J4X3JlbGVhc2UoKQ0KPj4g
KyAgICAgKiBzaGFyZSB3aXRoIHRoZSBTUE1DLiBXZSBtdXN0IGdpdmUgaXQgYmFjayB1c2luZyBm
ZmFfaHlwX3J4X3JlbGVhc2UoKQ0KPj4gICAgICAqIG9uY2Ugd2UndmUgY29waWVkIHRoZSBjb250
ZW50Lg0KPj4gICAgICAqLw0KPj4gDQo+PiBAQCAtMTkzLDE1ICsxODUsMTMgQEAgdm9pZCBmZmFf
aGFuZGxlX3BhcnRpdGlvbl9pbmZvX2dldChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+
ICAgICAgICAgfQ0KPj4gICAgIH0NCj4+IA0KPj4gLSAgICBjdHgtPnJ4X2lzX2ZyZWUgPSBmYWxz
ZTsNCj4+IC0NCj4+IG91dF9yeF9oeXBfcmVsZWFzZToNCj4+IC0gICAgZmZhX3J4X3JlbGVhc2Uo
KTsNCj4+IC1vdXRfcnhfYnVmX3VubG9jazoNCj4+ICsgICAgZmZhX2h5cF9yeF9yZWxlYXNlKCk7
DQo+PiArb3V0X3J4X2h5cF91bmxvY2s6DQo+PiAgICAgc3Bpbl91bmxvY2soJmZmYV9yeF9idWZm
ZXJfbG9jayk7DQo+PiBvdXRfcnhfcmVsZWFzZToNCj4+IC0gICAgc3Bpbl91bmxvY2soJmN0eC0+
cnhfbG9jayk7DQo+PiAtDQo+PiArICAgIGlmICggcmV0ICE9IEZGQV9SRVRfT0sgKQ0KPj4gKyAg
ICAgICAgZmZhX3J4X3JlbGVhc2UoZCk7DQo+IA0KPiBQbGVhc2UgY29tbWVudCBvbiB3aHkgZmZh
X3J4X3JlbGVhc2UoKSBtdXN0IG9ubHkgYmUgY2FsbGVkIG9uIGZhaWx1cmUuDQoNCkl0IGlzIGJl
Y2F1c2UgdGhlIGJ1ZmZlciBjb250YWlucyBkYXRhIGZvciB0aGUgY2FsbGVyIGluIGNhc2Ugb2Yg
c3VjY2VzcyBzbw0KaXQgbXVzdCBiZSByZWxlYXNlZCBieSB0aGUgY2FsbGVyLg0KDQpEbyBpIGdl
dCBpdCByaWdodCB0aGF0IHlvdSB3YW50IG1lIHRvIGFkZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQg
aW4gdGhlIGNvZGUNCmFuZCBub3Qgb25seSB0ZWxsIHlvdSBoZXJlID8NCg0KPiANCj4+IG91dDoN
Cj4+ICAgICBpZiAoIHJldCApDQo+PiAgICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdzLCBy
ZXQpOw0KPj4gQEAgLTM2OCw4ICszNTgsNyBAQCBib29sIGZmYV9wYXJ0aW5mb19pbml0KHZvaWQp
DQo+PiAgICAgcmV0ID0gaW5pdF9zdWJzY3JpYmVycyhjb3VudCwgZnBpX3NpemUpOw0KPj4gDQo+
PiBvdXQ6DQo+PiAtICAgIGZmYV9yeF9yZWxlYXNlKCk7DQo+PiAtDQo+PiArICAgIGZmYV9oeXBf
cnhfcmVsZWFzZSgpOw0KPj4gICAgIHJldHVybiByZXQ7DQo+PiB9DQo+PiANCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmggYi94ZW4vYXJjaC9hcm0vdGVlL2Zm
YV9wcml2YXRlLmgNCj4+IGluZGV4IGFmZTY5YjQzZGJlZi4uOWFkZmU2ODdjM2M5IDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiArKysgYi94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9wcml2YXRlLmgNCj4+IEBAIC0yNjUsNiArMjY1LDIxIEBADQo+PiAjZGVm
aW5lIEZGQV9BQklfQklUTlVNKGlkKSAgICAoKEZGQV9BQklfSUQoaWQpIC0gRkZBX0FCSV9NSU4p
IDw8IDEgfCBcDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRkZBX0FCSV9DT05W
KGlkKSkNCj4+IA0KPj4gKy8qIENvbnN0aXR1ZW50IG1lbW9yeSByZWdpb24gZGVzY3JpcHRvciAq
Lw0KPj4gK3N0cnVjdCBmZmFfYWRkcmVzc19yYW5nZSB7DQo+PiArICAgIHVpbnQ2NF90IGFkZHJl
c3M7DQo+PiArICAgIHVpbnQzMl90IHBhZ2VfY291bnQ7DQo+PiArICAgIHVpbnQzMl90IHJlc2Vy
dmVkOw0KPj4gK307DQo+PiArDQo+PiArLyogQ29tcG9zaXRlIG1lbW9yeSByZWdpb24gZGVzY3Jp
cHRvciAqLw0KPj4gK3N0cnVjdCBmZmFfbWVtX3JlZ2lvbiB7DQo+PiArICAgIHVpbnQzMl90IHRv
dGFsX3BhZ2VfY291bnQ7DQo+PiArICAgIHVpbnQzMl90IGFkZHJlc3NfcmFuZ2VfY291bnQ7DQo+
PiArICAgIHVpbnQ2NF90IHJlc2VydmVkOw0KPj4gKyAgICBzdHJ1Y3QgZmZhX2FkZHJlc3NfcmFu
Z2UgYWRkcmVzc19yYW5nZV9hcnJheVtdOw0KPj4gK307DQo+PiArDQo+PiBzdHJ1Y3QgZmZhX2N0
eF9ub3RpZiB7DQo+PiAgICAgYm9vbCBlbmFibGVkOw0KPj4gDQo+PiBAQCAtMjkyLDcgKzMwNyw3
IEBAIHN0cnVjdCBmZmFfY3R4IHsNCj4+ICAgICBzdHJ1Y3QgZmZhX2N0eF9ub3RpZiBub3RpZjsN
Cj4+ICAgICAvKg0KPj4gICAgICAqIHR4X2xvY2sgaXMgdXNlZCB0byBzZXJpYWxpemUgYWNjZXNz
IHRvIHR4DQo+PiAtICAgICAqIHJ4X2xvY2sgaXMgdXNlZCB0byBzZXJpYWxpemUgYWNjZXNzIHRv
IHJ4DQo+PiArICAgICAqIHJ4X2xvY2sgaXMgdXNlZCB0byBzZXJpYWxpemUgYWNjZXNzIHRvIHJ4
X2lzX2ZyZWUNCj4+ICAgICAgKiBsb2NrIGlzIHVzZWQgZm9yIHRoZSByZXN0IGluIHRoaXMgc3Ry
dWN0DQo+PiAgICAgICovDQo+PiAgICAgc3BpbmxvY2tfdCB0eF9sb2NrOw0KPj4gQEAgLTMzMSw3
ICszNDYsOCBAQCB2b2lkIGZmYV9yeHR4X2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQp
Ow0KPj4gdWludDMyX3QgZmZhX2hhbmRsZV9yeHR4X21hcCh1aW50MzJfdCBmaWQsIHJlZ2lzdGVy
X3QgdHhfYWRkciwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdpc3Rlcl90IHJ4
X2FkZHIsIHVpbnQzMl90IHBhZ2VfY291bnQpOw0KPj4gdWludDMyX3QgZmZhX2hhbmRsZV9yeHR4
X3VubWFwKHZvaWQpOw0KPj4gLWludDMyX3QgZmZhX2hhbmRsZV9yeF9yZWxlYXNlKHZvaWQpOw0K
Pj4gK2ludDMyX3QgZmZhX3J4X2FjcXVpcmUoc3RydWN0IGRvbWFpbiAqZCk7DQo+PiAraW50MzJf
dCBmZmFfcnhfcmVsZWFzZShzdHJ1Y3QgZG9tYWluICpkKTsNCj4+IA0KPj4gdm9pZCBmZmFfbm90
aWZfaW5pdCh2b2lkKTsNCj4+IHZvaWQgZmZhX25vdGlmX2luaXRfaW50ZXJydXB0KHZvaWQpOw0K
Pj4gQEAgLTQyMCw3ICs0MzYsNyBAQCBzdGF0aWMgaW5saW5lIGludDMyX3QgZmZhX3NpbXBsZV9j
YWxsKHVpbnQzMl90IGZpZCwgcmVnaXN0ZXJfdCBhMSwNCj4+ICAgICByZXR1cm4gZmZhX2dldF9y
ZXRfY29kZSgmcmVzcCk7DQo+PiB9DQo+PiANCj4+IC1zdGF0aWMgaW5saW5lIGludDMyX3QgZmZh
X3J4X3JlbGVhc2Uodm9pZCkNCj4+ICtzdGF0aWMgaW5saW5lIGludDMyX3QgZmZhX2h5cF9yeF9y
ZWxlYXNlKHZvaWQpDQo+PiB7DQo+PiAgICAgcmV0dXJuIGZmYV9zaW1wbGVfY2FsbChGRkFfUlhf
UkVMRUFTRSwgMCwgMCwgMCwgMCk7DQo+PiB9DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3RlZS9mZmFfcnh0eC5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcnh0eC5jDQo+PiBpbmRleCBi
NjkzMWM4NTU3NzkuLmE1ZDQzZTUxZjg0MyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90
ZWUvZmZhX3J4dHguYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcnh0eC5jDQo+PiBA
QCAtMzAsNiArMzAsMTcgQEAgc3RydWN0IGZmYV9lbmRwb2ludF9yeHR4X2Rlc2NyaXB0b3JfMV8x
IHsNCj4+ICAgICB1aW50MzJfdCB0eF9yZWdpb25fb2ZmczsNCj4+IH07DQo+PiANCj4+ICtzdGF0
aWMgaW50MzJfdCBmZmFfcnh0eF9tYXAocGFkZHJfdCB0eF9hZGRyLCBwYWRkcl90IHJ4X2FkZHIs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHBhZ2VfY291bnQpDQo+
PiArew0KPj4gKyAgICByZXR1cm4gZmZhX3NpbXBsZV9jYWxsKEZGQV9SWFRYX01BUF82NCwgdHhf
YWRkciwgcnhfYWRkciwgcGFnZV9jb3VudCwgMCk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBp
bnQzMl90IGZmYV9yeHR4X3VubWFwKHVpbnQxNl90IGlkKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJu
IGZmYV9zaW1wbGVfY2FsbChGRkFfUlhUWF9VTk1BUCwgKCh1aW50NjRfdClpZCk8PDE2LCAwLCAw
LCAwKTsNCj4+ICt9DQo+PiArDQo+PiB1aW50MzJfdCBmZmFfaGFuZGxlX3J4dHhfbWFwKHVpbnQz
Ml90IGZpZCwgcmVnaXN0ZXJfdCB0eF9hZGRyLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZ2lzdGVyX3QgcnhfYWRkciwgdWludDMyX3QgcGFnZV9jb3VudCkNCj4+IHsNCj4+IEBA
IC00Miw2ICs1Myw5IEBAIHVpbnQzMl90IGZmYV9oYW5kbGVfcnh0eF9tYXAodWludDMyX3QgZmlk
LCByZWdpc3Rlcl90IHR4X2FkZHIsDQo+PiAgICAgdm9pZCAqcng7DQo+PiAgICAgdm9pZCAqdHg7
DQo+PiANCj4+ICsgICAgLyogVGhlIGNvZGUgaXMgY29uc2lkZXJpbmcgdGhhdCB3ZSBvbmx5IGdl
dCBvbmUgcGFnZSBmb3Igbm93ICovDQo+PiArICAgIEJVSUxEX0JVR19PTihGRkFfTUFYX1JYVFhf
UEFHRV9DT1VOVCAhPSAxKTsNCj4+ICsNCj4+ICAgICBpZiAoICFzbWNjY19pc19jb252XzY0KGZp
ZCkgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgLyoNCj4+IEBAIC04Nyw2ICsxMDEsNjUgQEAgdWlu
dDMyX3QgZmZhX2hhbmRsZV9yeHR4X21hcCh1aW50MzJfdCBmaWQsIHJlZ2lzdGVyX3QgdHhfYWRk
ciwNCj4+ICAgICBpZiAoICFyeCApDQo+PiAgICAgICAgIGdvdG8gZXJyX3VubWFwX3R4Ow0KPj4g
DQo+PiArICAgIC8qDQo+PiArICAgICAqIFRyYW5zbWl0IHRoZSBSWC9UWCBidWZmZXIgaW5mb3Jt
YXRpb24gdG8gdGhlIFNQTSBpZiBhY3F1aXJlIGlzIHN1cHBvcnRlZA0KPj4gKyAgICAgKiBhcyB0
aGUgc3BlYyBzYXlzIHRoYXQgaWYgbm90IHRoZXJlIGlzIG5vdCBuZWVkIHRvIGFjcXVpcmUvcmVs
ZWFzZS9tYXANCj4+ICsgICAgICogcnh0eCBidWZmZXJzIGZyb20gdGhlIFNQTUMNCj4+ICsgICAg
ICovDQo+PiArICAgIGlmICggZmZhX2Z3X3N1cHBvcnRzX2ZpZChGRkFfUlhfQUNRVUlSRSkgKQ0K
Pj4gKyAgICB7DQo+PiArICAgICAgICBzdHJ1Y3QgZmZhX2VuZHBvaW50X3J4dHhfZGVzY3JpcHRv
cl8xXzEgKnJ4dHhfZGVzYzsNCj4+ICsgICAgICAgIHN0cnVjdCBmZmFfbWVtX3JlZ2lvbiAqbWVt
X3JlZzsNCj4+ICsNCj4+ICsgICAgICAgIC8qIEFsbCBtdXN0IGZpdCBpbiBvdXIgVFggYnVmZmVy
ICovDQo+PiArICAgICAgICBCVUlMRF9CVUdfT04oKHNpemVvZigqcnh0eF9kZXNjKSArIHNpemVv
ZigqbWVtX3JlZykqMiArDQo+PiArICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3Qg
ZmZhX2FkZHJlc3NfcmFuZ2UpKjIpID4gRkZBX1BBR0VfU0laRSk7DQo+IA0KPiBQbGVhc2UgYWRk
IHNwYWNlIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIGJpbmFyeSBvcGVyYXRvciAiKiIuDQpBY2sNCg0K
PiBUaGUgc2l6ZSBvZiB0aGUgVFggYnVmZmVyIGlzIEZGQV9SWFRYX1BBR0VfQ09VTlQgKiBGRkFf
UEFHRV9TSVpFLg0KVmVyeSByaWdodCwgSSB3aWxsIGZpeCB0aGF0IGluIHYzLg0KDQo+IE5pdDog
dGhlIG91dGVyIHBhcmVudGhlc2lzIGFyb3VuZCB0aGUgbGVmdCBleHByZXNzaW9uIGFyZW4ndCBu
ZWVkZWQuDQpBY2sNCg0KPiANCj4+ICsNCj4+ICsgICAgICAgIHNwaW5fbG9jaygmZmZhX3R4X2J1
ZmZlcl9sb2NrKTsNCj4+ICsgICAgICAgIHJ4dHhfZGVzYyA9IGZmYV90eDsNCj4+ICsNCj4+ICsg
ICAgICAgIC8qDQo+PiArICAgICAgICAgKiBXZSBoYXZlIG9ubHkgb25lIHBhZ2UgZm9yIGVhY2gg
c28gd2UgcGFjayBldmVyeXRoaW5nOg0KPj4gKyAgICAgICAgICogLSByeCByZWdpb24gZGVzY3Jp
cHRvcg0KPj4gKyAgICAgICAgICogLSByeCByZWdpb24gcmFuZ2UNCj4+ICsgICAgICAgICAqIC0g
dHggcmVnaW9uIGRlc2NyaXB0b3INCj4+ICsgICAgICAgICAqIC0gdHggcmVnaW9uIHJhbmdlDQo+
PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIHJ4dHhfZGVzYy0+c2VuZGVyX2lkID0gZmZhX2dl
dF92bV9pZChkKTsNCj4+ICsgICAgICAgIHJ4dHhfZGVzYy0+cmVzZXJ2ZWQgPSAwOw0KPj4gKyAg
ICAgICAgcnh0eF9kZXNjLT5yeF9yZWdpb25fb2ZmcyA9IHNpemVvZigqcnh0eF9kZXNjKTsNCj4+
ICsgICAgICAgIHJ4dHhfZGVzYy0+dHhfcmVnaW9uX29mZnMgPSBzaXplb2YoKnJ4dHhfZGVzYykg
Kw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVj
dCBmZmFfbWVtX3JlZ2lvbiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhZGRyZXNzX3JhbmdlX2FycmF5WzFdKTsNCj4+ICsNCj4+ICsgICAgICAgIC8q
IHJ4IGJ1ZmZlciAqLw0KPj4gKyAgICAgICAgbWVtX3JlZyA9IGZmYV90eCArIHNpemVvZigqcnh0
eF9kZXNjKTsNCj4+ICsgICAgICAgIG1lbV9yZWctPnRvdGFsX3BhZ2VfY291bnQgPSAxOw0KPj4g
KyAgICAgICAgbWVtX3JlZy0+YWRkcmVzc19yYW5nZV9jb3VudCA9IDE7DQo+PiArICAgICAgICBt
ZW1fcmVnLT5yZXNlcnZlZCA9IDA7DQo+PiArDQo+PiArICAgICAgICBtZW1fcmVnLT5hZGRyZXNz
X3JhbmdlX2FycmF5WzBdLmFkZHJlc3MgPSBwYWdlX3RvX21hZGRyKHJ4X3BnKTsNCj4+ICsgICAg
ICAgIG1lbV9yZWctPmFkZHJlc3NfcmFuZ2VfYXJyYXlbMF0ucGFnZV9jb3VudCA9IDE7DQo+PiAr
ICAgICAgICBtZW1fcmVnLT5hZGRyZXNzX3JhbmdlX2FycmF5WzBdLnJlc2VydmVkID0gMDsNCj4+
ICsNCj4+ICsgICAgICAgIC8qIHR4IGJ1ZmZlciAqLw0KPj4gKyAgICAgICAgbWVtX3JlZyA9IGZm
YV90eCArIHJ4dHhfZGVzYy0+dHhfcmVnaW9uX29mZnM7DQo+PiArICAgICAgICBtZW1fcmVnLT50
b3RhbF9wYWdlX2NvdW50ID0gMTsNCj4+ICsgICAgICAgIG1lbV9yZWctPmFkZHJlc3NfcmFuZ2Vf
Y291bnQgPSAxOw0KPj4gKyAgICAgICAgbWVtX3JlZy0+cmVzZXJ2ZWQgPSAwOw0KPj4gKw0KPj4g
KyAgICAgICAgbWVtX3JlZy0+YWRkcmVzc19yYW5nZV9hcnJheVswXS5hZGRyZXNzID0gcGFnZV90
b19tYWRkcih0eF9wZyk7DQo+PiArICAgICAgICBtZW1fcmVnLT5hZGRyZXNzX3JhbmdlX2FycmF5
WzBdLnBhZ2VfY291bnQgPSAxOw0KPj4gKyAgICAgICAgbWVtX3JlZy0+YWRkcmVzc19yYW5nZV9h
cnJheVswXS5yZXNlcnZlZCA9IDA7DQo+PiArDQo+PiArICAgICAgICByZXQgPSBmZmFfcnh0eF9t
YXAoMCwgMCwgMSk7DQo+IA0KPiBUaGUgbGFzdCBwYXJhbWV0ZXIgaXMgYWxzbyBNQlogd2hlbiBm
b3J3YXJkaW5nIG9uIGJlaGFsZiBvZiBhbiBlbmRwb2ludC4NCg0KQWNrLCB3aWxsIGZpeCBpbiB2
My4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IEplbnMNCj4gDQo+PiAr
DQo+PiArICAgICAgICBzcGluX3VubG9jaygmZmZhX3R4X2J1ZmZlcl9sb2NrKTsNCj4+ICsNCj4+
ICsgICAgICAgIGlmICggcmV0ICE9IEZGQV9SRVRfT0sgKQ0KPj4gKyAgICAgICAgICAgIGdvdG8g
ZXJyX3VubWFwX3J4Ow0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgY3R4LT5yeCA9IHJ4Ow0KPj4g
ICAgIGN0eC0+dHggPSB0eDsNCj4+ICAgICBjdHgtPnJ4X3BnID0gcnhfcGc7DQo+PiBAQCAtOTUs
NiArMTY4LDggQEAgdWludDMyX3QgZmZhX2hhbmRsZV9yeHR4X21hcCh1aW50MzJfdCBmaWQsIHJl
Z2lzdGVyX3QgdHhfYWRkciwNCj4+ICAgICBjdHgtPnJ4X2lzX2ZyZWUgPSB0cnVlOw0KPj4gICAg
IHJldHVybiBGRkFfUkVUX09LOw0KPj4gDQo+PiArZXJyX3VubWFwX3J4Og0KPj4gKyAgICB1bm1h
cF9kb21haW5fcGFnZV9nbG9iYWwocngpOw0KPj4gZXJyX3VubWFwX3R4Og0KPj4gICAgIHVubWFw
X2RvbWFpbl9wYWdlX2dsb2JhbCh0eCk7DQo+PiBlcnJfcHV0X3J4X3BnOg0KPj4gQEAgLTEwNSw4
ICsxODAsMjIgQEAgZXJyX3B1dF90eF9wZzoNCj4+ICAgICByZXR1cm4gcmV0Ow0KPj4gfQ0KPj4g
DQo+PiAtc3RhdGljIHZvaWQgcnh0eF91bm1hcChzdHJ1Y3QgZmZhX2N0eCAqY3R4KQ0KPj4gK3N0
YXRpYyB1aW50MzJfdCAgcnh0eF91bm1hcChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gew0KPj4gKyAg
ICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiArDQo+PiArICAgIGlmICgg
IWN0eC0+cGFnZV9jb3VudCApDQo+PiArICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZBTElEX1BB
UkFNRVRFUlM7DQo+PiArDQo+PiArICAgIGlmICggZmZhX2Z3X3N1cHBvcnRzX2ZpZChGRkFfUlhf
QUNRVUlSRSkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICB1aW50MzJfdCByZXQ7DQo+PiArDQo+
PiArICAgICAgICByZXQgPSBmZmFfcnh0eF91bm1hcChmZmFfZ2V0X3ZtX2lkKGQpKTsNCj4+ICsg
ICAgICAgIGlmICggcmV0ICE9IEZGQV9SRVRfT0sgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoY3R4
LT5yeCk7DQo+PiAgICAgdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGN0eC0+dHgpOw0KPj4gICAg
IHB1dF9wYWdlKGN0eC0+cnhfcGcpOw0KPj4gQEAgLTExNywzMiArMjA2LDYzIEBAIHN0YXRpYyB2
b2lkIHJ4dHhfdW5tYXAoc3RydWN0IGZmYV9jdHggKmN0eCkNCj4+ICAgICBjdHgtPnR4X3BnID0g
TlVMTDsNCj4+ICAgICBjdHgtPnBhZ2VfY291bnQgPSAwOw0KPj4gICAgIGN0eC0+cnhfaXNfZnJl
ZSA9IGZhbHNlOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gRkZBX1JFVF9PSzsNCj4+IH0NCj4+IA0K
Pj4gdWludDMyX3QgZmZhX2hhbmRsZV9yeHR4X3VubWFwKHZvaWQpDQo+PiB7DQo+PiAtICAgIHN0
cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47DQo+PiArICAgIHJldHVybiByeHR4X3Vu
bWFwKGN1cnJlbnQtPmRvbWFpbik7DQo+PiArfQ0KPj4gKw0KPj4gK2ludDMyX3QgZmZhX3J4X2Fj
cXVpcmUoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIGludDMyX3QgcmV0ID0gRkZB
X1JFVF9PSzsNCj4+ICAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiAN
Cj4+IC0gICAgaWYgKCAhY3R4LT5yeCApDQo+PiAtICAgICAgICByZXR1cm4gRkZBX1JFVF9JTlZB
TElEX1BBUkFNRVRFUlM7DQo+PiArICAgIHNwaW5fbG9jaygmY3R4LT5yeF9sb2NrKTsNCj4+IA0K
Pj4gLSAgICByeHR4X3VubWFwKGN0eCk7DQo+PiArICAgIGlmICggIWN0eC0+cGFnZV9jb3VudCAp
DQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfREVOSUVEOw0KPj4gKyAgICAg
ICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+IA0KPj4gLSAgICByZXR1cm4gRkZBX1JFVF9PSzsN
Cj4+ICsgICAgaWYgKCAhY3R4LT5yeF9pc19mcmVlICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAg
cmV0ID0gRkZBX1JFVF9CVVNZOw0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+
ICsNCj4+ICsgICAgaWYgKCBmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9SWF9BQ1FVSVJFKSApDQo+
PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IGZmYV9zaW1wbGVfY2FsbChGRkFfUlhfQUNRVUlS
RSwgZmZhX2dldF92bV9pZChkKSwgMCwgMCwgMCk7DQo+PiArICAgICAgICBpZiAoIHJldCAhPSBG
RkFfUkVUX09LICkNCj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4+ICsgICAgfQ0KPj4gKyAg
ICBjdHgtPnJ4X2lzX2ZyZWUgPSBmYWxzZTsNCj4+ICtvdXQ6DQo+PiArICAgIHNwaW5fdW5sb2Nr
KCZjdHgtPnJ4X2xvY2spOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gcmV0Ow0KPj4gfQ0KPj4gDQo+
PiAtaW50MzJfdCBmZmFfaGFuZGxlX3J4X3JlbGVhc2Uodm9pZCkNCj4+ICtpbnQzMl90IGZmYV9y
eF9yZWxlYXNlKHN0cnVjdCBkb21haW4gKmQpDQo+PiB7DQo+PiAgICAgaW50MzJfdCByZXQgPSBG
RkFfUkVUX0RFTklFRDsNCj4+IC0gICAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFp
bjsNCj4+ICAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiANCj4+IC0g
ICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZjdHgtPnJ4X2xvY2spICkNCj4+IC0gICAgICAgIHJldHVy
biBGRkFfUkVUX0JVU1k7DQo+PiArICAgIHNwaW5fbG9jaygmY3R4LT5yeF9sb2NrKTsNCj4+IA0K
Pj4gICAgIGlmICggIWN0eC0+cGFnZV9jb3VudCB8fCBjdHgtPnJ4X2lzX2ZyZWUgKQ0KPj4gICAg
ICAgICBnb3RvIG91dDsNCj4+ICsNCj4+ICsgICAgaWYgKCBmZmFfZndfc3VwcG9ydHNfZmlkKEZG
QV9SWF9BQ1FVSVJFKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IGZmYV9zaW1wbGVf
Y2FsbChGRkFfUlhfUkVMRUFTRSwgZmZhX2dldF92bV9pZChkKSwgMCwgMCwgMCk7DQo+PiArICAg
ICAgICBpZiAoIHJldCAhPSBGRkFfUkVUX09LICkNCj4+ICsgICAgICAgICAgICBnb3RvIG91dDsN
Cj4+ICsgICAgfQ0KPj4gICAgIHJldCA9IEZGQV9SRVRfT0s7DQo+PiAgICAgY3R4LT5yeF9pc19m
cmVlID0gdHJ1ZTsNCj4+IG91dDoNCj4+IEBAIC0xNTEsMjMgKzI3MSw5IEBAIG91dDoNCj4+ICAg
ICByZXR1cm4gcmV0Ow0KPj4gfQ0KPj4gDQo+PiAtc3RhdGljIGludDMyX3QgZmZhX3J4dHhfbWFw
KHBhZGRyX3QgdHhfYWRkciwgcGFkZHJfdCByeF9hZGRyLA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCBwYWdlX2NvdW50KQ0KPj4gLXsNCj4+IC0gICAgcmV0dXJuIGZm
YV9zaW1wbGVfY2FsbChGRkFfUlhUWF9NQVBfNjQsIHR4X2FkZHIsIHJ4X2FkZHIsIHBhZ2VfY291
bnQsIDApOw0KPj4gLX0NCj4+IC0NCj4+IC1zdGF0aWMgaW50MzJfdCBmZmFfcnh0eF91bm1hcCh2
b2lkKQ0KPj4gLXsNCj4+IC0gICAgcmV0dXJuIGZmYV9zaW1wbGVfY2FsbChGRkFfUlhUWF9VTk1B
UCwgMCwgMCwgMCwgMCk7DQo+PiAtfQ0KPj4gLQ0KPj4gdm9pZCBmZmFfcnh0eF9kb21haW5fZGVz
dHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gew0KPj4gLSAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4
ID0gZC0+YXJjaC50ZWU7DQo+PiAtDQo+PiAtICAgIGlmICggY3R4LT5yeCApDQo+PiAtICAgICAg
ICByeHR4X3VubWFwKGN0eCk7DQo+PiArICAgIHJ4dHhfdW5tYXAoZCk7DQo+PiB9DQo+PiANCj4+
IHZvaWQgZmZhX3J4dHhfZGVzdHJveSh2b2lkKQ0KPj4gQEAgLTE4Niw3ICsyOTIsNyBAQCB2b2lk
IGZmYV9yeHR4X2Rlc3Ryb3kodm9pZCkNCj4+ICAgICB9DQo+PiANCj4+ICAgICBpZiAoIG5lZWRf
dW5tYXAgKQ0KPj4gLSAgICAgICAgZmZhX3J4dHhfdW5tYXAoKTsNCj4+ICsgICAgICAgIGZmYV9y
eHR4X3VubWFwKDApOw0KPj4gfQ0KPj4gDQo+PiBib29sIGZmYV9yeHR4X2luaXQodm9pZCkNCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYyBiL3hlbi9hcmNoL2FybS90
ZWUvZmZhX3NobS5jDQo+PiBpbmRleCAyOTY3NWY5YmEzZjcuLmQ2MjhjMWI3MDYwOSAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3NobS5jDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vdGVlL2ZmYV9zaG0uYw0KPj4gQEAgLTE2LDIxICsxNiw2IEBADQo+PiANCj4+ICNpbmNsdWRl
ICJmZmFfcHJpdmF0ZS5oIg0KPj4gDQo+PiAtLyogQ29uc3RpdHVlbnQgbWVtb3J5IHJlZ2lvbiBk
ZXNjcmlwdG9yICovDQo+PiAtc3RydWN0IGZmYV9hZGRyZXNzX3JhbmdlIHsNCj4+IC0gICAgdWlu
dDY0X3QgYWRkcmVzczsNCj4+IC0gICAgdWludDMyX3QgcGFnZV9jb3VudDsNCj4+IC0gICAgdWlu
dDMyX3QgcmVzZXJ2ZWQ7DQo+PiAtfTsNCj4+IC0NCj4+IC0vKiBDb21wb3NpdGUgbWVtb3J5IHJl
Z2lvbiBkZXNjcmlwdG9yICovDQo+PiAtc3RydWN0IGZmYV9tZW1fcmVnaW9uIHsNCj4+IC0gICAg
dWludDMyX3QgdG90YWxfcGFnZV9jb3VudDsNCj4+IC0gICAgdWludDMyX3QgYWRkcmVzc19yYW5n
ZV9jb3VudDsNCj4+IC0gICAgdWludDY0X3QgcmVzZXJ2ZWQ7DQo+PiAtICAgIHN0cnVjdCBmZmFf
YWRkcmVzc19yYW5nZSBhZGRyZXNzX3JhbmdlX2FycmF5W107DQo+PiAtfTsNCj4+IC0NCj4+IC8q
IE1lbW9yeSBhY2Nlc3MgcGVybWlzc2lvbnMgZGVzY3JpcHRvciAqLw0KPj4gc3RydWN0IGZmYV9t
ZW1fYWNjZXNzX3Blcm0gew0KPj4gICAgIHVpbnQxNl90IGVuZHBvaW50X2lkOw0KPj4gLS0NCj4+
IDIuNDcuMA0KDQoNCg==

