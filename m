Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507299D6B3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 20:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818828.1232110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Q38-0004be-U1; Mon, 14 Oct 2024 18:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818828.1232110; Mon, 14 Oct 2024 18:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Q38-0004Zg-R1; Mon, 14 Oct 2024 18:44:10 +0000
Received: by outflank-mailman (input) for mailman id 818828;
 Mon, 14 Oct 2024 18:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7KN=RK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t0Q37-0004Za-0i
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 18:44:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2614::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ab8e18b-8a5c-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 20:44:07 +0200 (CEST)
Received: from DU2PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:10:232::25)
 by PA6PR08MB10782.eurprd08.prod.outlook.com (2603:10a6:102:3d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Mon, 14 Oct
 2024 18:44:04 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::ec) by DU2PR04CA0080.outlook.office365.com
 (2603:10a6:10:232::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Mon, 14 Oct 2024 18:44:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17 via
 Frontend Transport; Mon, 14 Oct 2024 18:44:01 +0000
Received: ("Tessian outbound 60a4253641a2:v473");
 Mon, 14 Oct 2024 18:44:01 +0000
Received: from Lcebb58bb15be.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 793C9A56-E072-49A9-8807-3476BC6F4791.1; 
 Mon, 14 Oct 2024 18:43:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcebb58bb15be.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2024 18:43:55 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB9948.eurprd08.prod.outlook.com (2603:10a6:10:3d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 18:43:53 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 18:43:53 +0000
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
X-Inumbo-ID: 4ab8e18b-8a5c-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nAK36BNlY3J9Mk7JA0fWbxtKhE4wUErsYyLKj7TGlDnbbqzLQKLeaHRVUwAxJpLav+cN+NCdq2IZu7UvBXvLQ//6hvpvckOhJvxfDSWMrCAlXDwtfmkHejRYwPgnsVixRlJsVdYtLtZ6ygb+jOkA4sinjdfnmyv1JyUUofE7VcIWSSVxP5R+cygcGTi6esjIKD5kQ602XZxQAcVjzlB19OSIquUmhtwLnkSafWiPArIUfw39CQrBj70rkXXlRSvR2oE9QGf0/wMlksSEMMWDGQ61vRreBaRZetoMqTkgvLl4lC1HjiNugy+/QXfpKJu3iKbHof8A5DyjkN8dOgOIZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWx7wan0tT2TaXJIvMp6T6BMjmqGnLSD2Ljm8vf2WIo=;
 b=Wp5G+n0wUGKx6JazSTzEF7Dagtm1gm9rU2OJk9/dOCav5OPk13NP18DhLqt3YoPdbYqrj7HX2qeLh8GyHJNVGYiwsPDnFTkUcDMHn6g4F0Vgv43IQpzN2TiNcE4M1Ro9I7pMsAGeCTqYZ+7Ns/i5DL0Gjhbn8M6DnU4YTLZ3+BHjtBp5K/Vnv/gWswvwUy7dtHYzmM4Rvi14HI7od1EUIOhZIEhmJqbDQmZOPVHxez28Iy1jaHNQv8jSW/FTuGSF9+gTm8WvzvcCn+8DjwQDfZr46dyNLq/lam0PKVUsBNTQu47o4FF7BFK6KmGuK3L7M7ZVESvF2OPvdhemU/PSCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWx7wan0tT2TaXJIvMp6T6BMjmqGnLSD2Ljm8vf2WIo=;
 b=QidycQI3ZV8Xmw/i7kcHDyFlpRzdNxeLul96c+nkk++/sCO31PGU4l6Ulu8uiWDLvdgJsjNmdhP54oIEEdpjVDb2RSPJ4liEVPXJ1SSEzfRTDRTdlfZnZlXw1NDEukLK7OHWtA3nzjlrus8+9yZHu7Kkod6q6Reljxo84kK999Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1835f88bb4cfc4d
X-TessianGatewayMetadata: mXnhX2LYXa0Q1/cCxnoYN+PAuw4Otc0JCGd0WIHOKMVbLu/YdUDbuXGdMqVw0Oz9iaU0gNg1nrvId9HleEtqubj4MQsJlJUDzdiBy/jhA3XNtTYZRMncfx+BBNxO4T5HMHSanERecNBLj3CAzdxUPWWBlNyjnaeOmiJs6hKdBeU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpFgAt9ozklkN5tiLoeLo5SdL1xhHWM9OITnQxmvWU2lLQfbZuY9TrVwKb0jvda2d0sjar98uCnv6iV2wrqKIHtbH0ezFlMsllMGrA2T3pWibm0W5CbocvWEDMRMTkeb2w8Qx5WhovLxtzcyS0IZCtxRbCSgK1A6EgqplEPZsFh8+ZsGzthnTuhGFUPgqtlmLDIDcRUrA3lgt/0IDMbuMzm0qLqYRDIE3q7VDtAPw1Fb09nh3KJTf69iedLxbHGF7cWxqYCa0SV1pTzm+YgMTzoFfhTLBXraLeM/3Uv9HcBG/Nnz5RQqTbydnNIrvkBwt/aopKJC4+LaTRNtmTuSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWx7wan0tT2TaXJIvMp6T6BMjmqGnLSD2Ljm8vf2WIo=;
 b=vwz4flxE6BzY5xOhIjqddqomV2igind+DQIN1XJRoHzhEnCzCQRO8w7qmQwWlrbCvQUvufjj++jburWJ+XhNp/g7mttL9intnPrggePQTmapa3bFT1D0fM+58LMQaroC20jtlsycYJx1IPX7WmjkSZmnlfg4eWZcgWGuUXJorT0gqfB8cuQcgY4L9IeYZHGtoUxWzwCgvdKrAtm+N7+hmr8z4rHztDW/AN0HPT6eUfJvTn3nf8HXArSfZgEBkABIXAz0rUEZYSo4WE5AJ8av6SzWmN7cmMJCcEViAQJmcyGyjQNvmy+Ov2w4xXWiWqWFy2zHyRBseCel+nn0V6JYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWx7wan0tT2TaXJIvMp6T6BMjmqGnLSD2Ljm8vf2WIo=;
 b=QidycQI3ZV8Xmw/i7kcHDyFlpRzdNxeLul96c+nkk++/sCO31PGU4l6Ulu8uiWDLvdgJsjNmdhP54oIEEdpjVDb2RSPJ4liEVPXJ1SSEzfRTDRTdlfZnZlXw1NDEukLK7OHWtA3nzjlrus8+9yZHu7Kkod6q6Reljxo84kK999Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Thread-Topic: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and
 MPU
Thread-Index: AQHbGx127FMt5Y9y2EO8VFlcKfnxirKGm8AA
Date: Mon, 14 Oct 2024 18:43:53 +0000
Message-ID: <9A01BB97-2CA9-491F-80EA-7B7D81B553AD@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-3-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-3-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB9948:EE_|DU6PEPF0000A7E4:EE_|PA6PR08MB10782:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f025545-3cde-48d8-2509-08dcec802c27
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VmxJZzZnWDZ4ei9zckg5eUN1aXZQTloxOTc4SGxRYVlGQ3F5ZGpmdDZmNkVl?=
 =?utf-8?B?RWt2SzIzcnVHQ2NEYmZIaUFwVk5QVXdMUW8vVGxjUDN1SzY0WWdrazFnajFZ?=
 =?utf-8?B?WjFZZkdPY3Yxc2JnOTZOcU5wa0lNR2NQbWROLzNiT09VYVVRek5wRmZKeWxz?=
 =?utf-8?B?ZlR1b1pUUElXWUtkZDJFZEQxSFNDUEJxTHh4U1JOb3cxSGg2OFdod0huZTJO?=
 =?utf-8?B?WEUwdVJuMzdIVXU1S05ON1d2Wk9pSHhQRlhybjJ3TFByc0VSdHRuSXl3SERC?=
 =?utf-8?B?RGZnbVZ4UTlpZ3pZTFA2YkRUSGkrOTN6a1cvWE9ONDRHdkNpSTlFK2ZyaWN6?=
 =?utf-8?B?ei8vMm5ta1VqcE4wRUFMVVlLVHBVNjR4QUZiNU5ta0g0SklJN1R0SlN4MlRi?=
 =?utf-8?B?alY5YStQLzNNenlLeStYQ0NmMU82MjNIRVRka3R1UDg2TGVzbVdRcGE5RUdB?=
 =?utf-8?B?bHIxYUErNjBWc2w1SnpjRXlKUHZzckdFbG1rRVYrem8rYjJmU0VHWWFUT01z?=
 =?utf-8?B?cFFNWkIxM2xzOXh2RGFOb3I1WXBiWWNzMTd5NUdiNDNwL25DZkJPOThvRUVC?=
 =?utf-8?B?Uk1mN21zYzBQczRUemhUVklILzNtMzQ1QnJTRjFXQlkwdGs5Z0NtTmU0Vi84?=
 =?utf-8?B?WTFtZWNYeHZQRkp4UzNBdkdPY1V2c3o5Y2ZpSFJTWkRESUk2VDBZNGRTMWNt?=
 =?utf-8?B?RUpMVkFLVXorYnhrRExwbityYmZsMWd0anIyazVlWXRhMzVsdlRlbWYyNWRm?=
 =?utf-8?B?aHVGUlhXTFhlRklFSDhVam4xeVI1bzZsdlZ5OGk0WWkzL0JkM0xadFB0YlNr?=
 =?utf-8?B?VENqSnhsUXRLUE5QaTRDa0VvaWo3RGVTdU95cnlqenVyZDFrRENyL0g4c0hV?=
 =?utf-8?B?bnN2aWdtUDFtQU5HNlA2R3VwbUtKK0xVdTUzRkJYWmJRYlJmVUtzMGRKQzg4?=
 =?utf-8?B?cG00ak1haEtKYURaRy9HSDZwRUQrMXdldjBJak11aE1sSE8zdUxRV2RuSWtT?=
 =?utf-8?B?aTh2a1ZVK1YvdUpONzQ0T2dHa0tGNWpKWHRRNVdlTEJ5bzFYRVZNeVdUOE40?=
 =?utf-8?B?VVFlektsZjBkRjk4ajBJNWEyS0JZVmI3c0tad0pwbVE1ckVkbm5Xb0JOSEs4?=
 =?utf-8?B?cEhIR2l4MlJ0Nys3ZjEyYzhUMGMwTXJXSDd4V0FOeGY1dGR0QWdDMllpYUhN?=
 =?utf-8?B?dEt3YTY5T2pyUjd6Z1VQd0s2VzFSblFQTG85dWxaQkxBeFdCazRCNStyaHpJ?=
 =?utf-8?B?QVpianZSQzQxc2pkQzd0NC9lWnZLZW9PQnc2VzgvU0NuV2JtS3N6YkFVWFJE?=
 =?utf-8?B?UmdrN013aDRtMW9MZDJMdzU5S3B0bHBVUGZINGlFUmlHOE5MN1d6YUYzdWdL?=
 =?utf-8?B?b3oxSkFudDA3UTVTNER6WENYSUthNFcyTG4weHRNU3ZqZjVBSEp5Y0tlSnpI?=
 =?utf-8?B?V285MjVTNW12d3RlVVdBNlFzdGlGckg3a3ZZem9xSWp3MysrblZhTEE3S05C?=
 =?utf-8?B?SVhtdGh6bmlnK000WS9ZMnpadlVRU3JxcktneU9saTVPVSsyWGRlTHU1aXhE?=
 =?utf-8?B?UGtiWGkxcVUwbGd2VUlTalRObXU1c1lWRWhsREh6T2tpcDkzcFg1TDJrbDdS?=
 =?utf-8?B?QzIzU3lvaDJITGw0eW1tZ0dxeFRQV1dlbllwSC9YVzI3VS9rSEVBK0ZXemVz?=
 =?utf-8?B?NXpKUk96ci9Nd1ljRGkzM2N2OSsxQnA5MVZQcUkrYTVwWmNSOHROcm9TWm5X?=
 =?utf-8?B?cHV5bGRJVjJTTnVieFpPSkt0ZmJjYk5ONUFsMVd3Z1pzbDB2UzkxNmFnaG9N?=
 =?utf-8?B?dHZ6V3B6ZnNhdUhWQmlvQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <69ED8FD4FC59074F808B432725D018C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9948
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4138633b-26d1-48b4-4c6b-08dcec8026e0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2VrUTNRVEVjbTNtYWhuSldHTzMwVFd6WExhNklnRzJKU21rdHpzcmN1NUo4?=
 =?utf-8?B?UkdjMVNpSjhmQi9NTnhlUGF0c2tKendOVjMySFBWZnpiY2dkVjBmVEFjQ3l0?=
 =?utf-8?B?SlROYnNWckxiK0wrTG1mVXAzV2x2a0tUY05wQTJvVVN4ME5QU0piQ2ZvYWdy?=
 =?utf-8?B?YTVTS0R1anVQNkcvQXZiWHk4SHlPaVJ1ZTd0aWdyUkRkS3hNQzg1VmRZQ2o3?=
 =?utf-8?B?UVNGdXhpdXBRK1d2MWVGcVlOZU5id1pNbWljdG9tUi9CS3Q3T3VScFFENEFB?=
 =?utf-8?B?NVZZOUhhRjZBOXlxbmQ2a2NHZmg5bkVlckc5RGhlelRDWk9hQnJUNTY5cENZ?=
 =?utf-8?B?clZLUjZPWnY1RTFnaVdGWTRmWFJWK1dOeUtHdnJCMlZITWVrdWhqY2ZteGIz?=
 =?utf-8?B?TllTcmttRUJ3TnhjNUo5dWJEYlZUdm1CdFFWWXRsdmRNZ21yelhCVkZlTlg4?=
 =?utf-8?B?YnF5UjI1OG8xYzJPUFE2THB1akdsL0YxYjc0a1VROVRiYWdrTUtpdEYwR1FW?=
 =?utf-8?B?cUdFWGVSWUdGcHNWVDV1N1JaN2Z3NHNJRjNjUnVieFFETnJRUkU5SEc2OGdF?=
 =?utf-8?B?bi9abi9wTEhXSEkrMCtNUzhNNjB1anR5UzN6dHlpYWs1MHg4dTBzQzJRN0Jp?=
 =?utf-8?B?b0tWTDFyZVVZL04zQUNBNTFXVDNnNTdlWmhyN2ZSNFhTdGxBWlVGVXdSZUhl?=
 =?utf-8?B?MGhPSS9XZloxNm1Yc1hxdUF5VHRNZmlsZWwvM254UCs1QzJCY1ZqRUYwY0FU?=
 =?utf-8?B?amFxSlkvRVZIZlVlL1hJVmE0bUJvdnZ0bnh4VDFvcTdZZ0ZCVEF0M0Z4YVdY?=
 =?utf-8?B?RnhwZlFaOVhVbHlLL1BxL0d0TG5wT2hQOXA1Y09mT0FjTFpZZWxQN0FMaUlG?=
 =?utf-8?B?S0xMalYxcUlIRnU3V3pLVXUydWd5SXdtNHdDMENBTERrZTZyWm9Fdm52QWUw?=
 =?utf-8?B?bTByQThlcXU5TnN1N1ByWmRCN21NeURJUlBWUlBVV2EzQ0pFcUlXVGd3b3dP?=
 =?utf-8?B?Q2ZtbkoyOVJtN3Jwckd2SHRlL3U2NUdGRDhoUVovVlRHaW8yMkgvdVd3VVU1?=
 =?utf-8?B?V1pReE1pL0t0VlB4SVhzZjdYSCtIZ0MzekFsMGhVWkFDNXNhcys3cC9uakNP?=
 =?utf-8?B?c2VVRFZaSXVYZHE2dnRsNUM0cnozU0UxeW9JM25YZDdzQW12U2hrNG44N0J1?=
 =?utf-8?B?d2h0STd3ZnJCMjJLQXZoZEplL1VtU0lyUWEvcVh6N3JLUFMydE8zSWRnV01V?=
 =?utf-8?B?Vkk5a09TWVZUV2w0ZGxNK1IySVMvZ05UTEgyMmo0SW04ZFl4ZlcrVkkvNkhE?=
 =?utf-8?B?Si9XdFRNMnRZelcvZmJna0gyT0JUMnBYSnBPYU1xRlBkYmZUL2pWdnowLzI0?=
 =?utf-8?B?bWZXajk4Z2JKc2dOYzFqN0JtNHgxZ3UrRVdSRGZuc1p1YTUzNEZLWnk5TGNv?=
 =?utf-8?B?S0cwN2RXY2FVVlNwVyt1d1lMOWZRVTliQ3l2b01od1l3SmFPeWlnK2cxdDd2?=
 =?utf-8?B?OGxWSmZ0K1lEVXMrWjZGV3BSWjIwWDl2OXlpbk5jRlNJSVZ4QnVqenczWVJ0?=
 =?utf-8?B?bm1leUpNS0lFNkRBOTBEbzArdHpSWmFMdlVEOERsQzJkaVkxeWFoRThvOFVN?=
 =?utf-8?B?bittYWFGNER2bFUxYXUxOXJTYkZYN1NXc0ZlNm5TRS9aL1FEL1pyb1p0Wm1k?=
 =?utf-8?B?b0tzaVFMaEU1Sm5zU0VXNlplenEvUjV1cENjTHArSmhGUjJQbVhKZGQ1d3dv?=
 =?utf-8?B?T2hQS2lvSlRMejRFbkw3TUZHMzZGMTBRalptWnMzWk9TYWx1ZjV6YVl5Tmk1?=
 =?utf-8?B?elViNVdUbkV2VHlVVmJiOGxxQ3lmd1MyblhRenRueWFDVW9WMTVFU2Y1c3Vq?=
 =?utf-8?Q?XbRUSpLNI6lNV?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 18:44:01.9249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f025545-3cde-48d8-2509-08dcec802c27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10782

SGkgQXlhbiwNCg0KPiBPbiAxMCBPY3QgMjAyNCwgYXQgMTU6MDMsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IFRoZXJlIGFyZSBmZWF0
dXJlcyBpbiB0aGUgZm9ydGhjb21pbmcgcGF0Y2hlcyB3aGljaCBhcmUgZGVwZW5kZW50IG9uDQo+
IE1QVS4gRm9yIGVnIGZpeGVkIHN0YXJ0IGFkZHJlc3MuDQo+IEFsc28sIHNvbWUgb2YgdGhlIFhl
biBmZWF0dXJlcyAoZWcgU1RBVElDX01FTU9SWSkgd2lsbCBiZSBzZWxlY3RlZA0KPiBieSB0aGUg
TVBVIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBUaHVzLCB0aGlzIHBhdGNoIGludHJvZHVjZXMgYSBj
aG9pY2UgYmV0d2VlbiBNTVUgYW5kIE1QVSBmb3IgdGhlIHR5cGUNCj4gb2YgbWVtb3J5IG1hbmFn
ZW1lbnQgc3lzdGVtLiBCeSBkZWZhdWx0LCBNTVUgaXMgc2VsZWN0ZWQuDQo+IE1QVSBpcyBub3cg
Z2F0ZWQgYnkgVU5TVVBQT1JURUQuDQo+IA0KPiBVcGRhdGUgU1VQUE9SVC5tZCB0byBzdGF0ZSB0
aGF0IHRoZSBzdXBwb3J0IGZvciBNUFUgaXMgZXhwZXJpbWVudGFsLg0KDQpNYXliZSBJ4oCZbSB3
cm9uZywgYnV0IHNob3VsZG7igJl0IHdlIGFkZCB0aGlzIG9ubHkgd2hlbiBNUFUgaXMgc3VwcG9y
dGVkPw0KSW4gdGhpcyBjYXNlIHdlIGFyZSBqdXN0IGhhdmluZyB0aGUgS2NvbmZpZyBzZXR0aW5n
Lg0KDQpBcGFydCBmcm9tIHRoYXQsIHRoZSByZXN0IGxvb2tzIGdvb2QgdG8gbWU6DQoNClJldmll
d2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KDQo=

