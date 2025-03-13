Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15839A5F207
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 12:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911929.1318306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgR0-0002oJ-CL; Thu, 13 Mar 2025 11:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911929.1318306; Thu, 13 Mar 2025 11:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsgR0-0002mk-8v; Thu, 13 Mar 2025 11:09:06 +0000
Received: by outflank-mailman (input) for mailman id 911929;
 Thu, 13 Mar 2025 11:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkET=WA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tsgQy-0002mX-Ur
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 11:09:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f403:260e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91fefdc1-fffb-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 12:09:02 +0100 (CET)
Received: from AS4P189CA0035.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::14)
 by PAXPR08MB6525.eurprd08.prod.outlook.com (2603:10a6:102:154::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 11:08:58 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::6) by AS4P189CA0035.outlook.office365.com
 (2603:10a6:20b:5dd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 11:08:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 13 Mar 2025 11:08:57 +0000
Received: ("Tessian outbound a5818d08f071:v585");
 Thu, 13 Mar 2025 11:08:57 +0000
Received: from L7f636020ce1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17F379ED-6C55-4939-8C40-159754421042.1; 
 Thu, 13 Mar 2025 11:08:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7f636020ce1c.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Mar 2025 11:08:50 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com (2603:10a6:803:4d::31)
 by DB3PR08MB9034.eurprd08.prod.outlook.com (2603:10a6:10:430::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 11:08:47 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8]) by VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 11:08:46 +0000
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
X-Inumbo-ID: 91fefdc1-fffb-11ef-9ab9-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GBwuoCcmfZ7qFf9P8UBY0e4ypZfAuk1MfNaxL2WdB1NQiHVv8sQbB9hcTRrIH8qIrhnSGvDtPSUeD75D4T3rCCr7a0AWCiZGdJ3gScatCtmJhuuDxySLHV0wVQauQOc+XqQBn+JKkaMS8SsdHSJqhIc0hwu0qUMzktn5JzNxy/k7hfGyX8NvG6rp63Mlrl4yIOYUYoc+HuA4hD+VX+r+7QXzOfjoompUZcvsvd7TrtlV3IYqRwpelWRrlh8IyCWFaxo9jr9108OI4wXo1KSwZ8Z6yalhKU7bV4Kqa5xlh6RFk3/3es9j5fPvSZsjuOtF0QAsDsA5SlGFOAo8hb24jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRbv6m0a5GMGuyI5fstQobk3/CkKmm46Dh4epjdxGpA=;
 b=Fsv/BNXbSPb6TEaUPyndxF9tC/tTyvVZPpDbF1x41oH6voFL+8F6k5lN1YR0sGXlkGDi58K4eFOsbR4qfBKxUPvkqp+7l4a44q3dhpBH79XWkZV3ewFBgDcz7OH6qNlz4UA1six6JVu1kBuiKpSdK/EXH3ZPd74XgptNlgIzd7NOVnPLqpv8RuJ+N4ldtv4xldEmtzDoVyFiRJcFDvVyieKzjU7444bEDqPY8ksJnkDPGbzPVFuRovs2i9KKXEfIhuYnisgExr2nFLF4cmvsJKfHz+W7Ggd0wp/bnn8ZjaxKoJvE5lT00I3cU5mEgeWrAxqjaxxml6x7wP/w7ach6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRbv6m0a5GMGuyI5fstQobk3/CkKmm46Dh4epjdxGpA=;
 b=PpufElpI2KGyx9jraLctxz4xI7nCSFxY7yjGgZwzbbrfDw9bfs+KvXrQCAgguKqHxmHm8IuEtOTSlzyKX0BMXJqKGCda2iKCzpGLQDz7np1hFxG7df6CkTC4k9pz7KzAadmcb+5FQDxdubxeSgzr3PeIXF5tufgip3HbMS4AeMA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe6a977dc9a750b5
X-TessianGatewayMetadata: tW5QjKw6wW64l4HXM0rgIb4wXsGvapcp5aT5uQUN9SANh4pJkUkjAksPnrsNuTUwMrt783EjQmi1pDTGmV6PoG2+xT7Llr8nTytrd0WcLghYKDxbjLP8NRybkRqdlLJE+/h2QzoYolAtRZHvgO/e99e/2vr5U5xYpCAND2Z5O50=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwtGhAfarE4vD8Qw9CleHEDG+5rjRYYKUlS/52ZDv/DQ41PGF1wePR5UdVB0Hez9zShjWbGPIfiLZUtMZMZRmF97ArKkMEWer8r4xgAPMNVdFjOXcVnPbnlJQQsDWnTSysv3QgyPhKifx9MwXX1bXrL3WvPmhr63vlwvuQopOzVnJFBnCe1/5LUq4p3vp6gfJNjgwmmxZDe/pgp4kEFGKxjkpJ/JepX3U+IteIhy99LfGA4/lO0LdNYj3EjqRJg4IZJXs/y0VdoEJ4qClEPDLuqIPXACl+UAfFcYEdXWfICj682EYH7ZwMQ/zk86duEC/UG7/kGdmGlFHRmit7XyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRbv6m0a5GMGuyI5fstQobk3/CkKmm46Dh4epjdxGpA=;
 b=qaZX9f8aVHM8jZ1Z2saVaSLKubnGbHVR1Z0xcJNaaNKlaRrMfaa2DnigwoCPrF9mDHKNxzPrkQ6WFJsR6LQNhPrbJu75YP6AgyGscsC6NV/X+eBW84Ue+qK919dIrc2Zf0DnS5Sa16qoc1T/lnkJeSZ+lguLSS6+BY3+ymwzzcP9sdKcZR76u6nVxr8HbIbFMHHqdAaFqu8CLkXWcHlSHu/AOfJZAf9ECkpoc+slNFnLlL7JzUOpMNHQ92dbjcZoN2K2BqtFhvTVDPXt9ag+PbmW39mlXBv5iVp9Es2CeuNuQ6mbF6Iy0DK/I3qGZ4gIyLpOAXyicM5SWGHT4i4e+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRbv6m0a5GMGuyI5fstQobk3/CkKmm46Dh4epjdxGpA=;
 b=PpufElpI2KGyx9jraLctxz4xI7nCSFxY7yjGgZwzbbrfDw9bfs+KvXrQCAgguKqHxmHm8IuEtOTSlzyKX0BMXJqKGCda2iKCzpGLQDz7np1hFxG7df6CkTC4k9pz7KzAadmcb+5FQDxdubxeSgzr3PeIXF5tufgip3HbMS4AeMA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 08/10] xen/arm: Rename setup_pagetables with a more
 generic name
Thread-Topic: [PATCH 08/10] xen/arm: Rename setup_pagetables with a more
 generic name
Thread-Index: AQHbk1Yo0cmyjZFeTUSq869Hx0J/E7Nw3DiAgAADaQCAAAiZAIAAAYkA
Date: Thu, 13 Mar 2025 11:08:46 +0000
Message-ID: <274347C1-EE28-48B4-9A5A-27188F5AF818@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-9-luca.fancellu@arm.com>
 <ada28315-0cfc-4be0-a543-31b589729044@amd.com>
 <ACE7CE6B-ED78-4EB1-85EB-DA2A98CEB83A@arm.com>
 <810b858c-b9cf-46f1-82ab-78ce2259d714@amd.com>
In-Reply-To: <810b858c-b9cf-46f1-82ab-78ce2259d714@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VI1PR08MB2989:EE_|DB3PR08MB9034:EE_|AM2PEPF0001C711:EE_|PAXPR08MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ba2101-0f72-482f-968d-08dd621f7393
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?b3Q0MGFnWUV3azVGYWlmaTZIK0JDQXpVYWZ4VmJQek1UVkVQd2pWL204ZkV5?=
 =?utf-8?B?YzFkYVBLeWZ4RWhOK0pqU2VJUGs3c2o4a1RWMlltUW1keW5CbFBkcDR4TG1I?=
 =?utf-8?B?UU5hQS9uVUMyaGhpQW5hbWtHd3I4TkRKRzJTWXA5M1EwSU1tWEhxTFoyQVFR?=
 =?utf-8?B?TmhBUEsxczMwQVA0bXhyckp3K3JrcUMyQnRRcHdXc0dVWFVrVlcxaUZaZ3Z6?=
 =?utf-8?B?dUVrRU1OSVM5WXFpZXFTTE5SQncwS2luZE1yc3dYOHZCS2dUKzFXZ1prdzZi?=
 =?utf-8?B?SVpnV0ZVYmtGTFUyeWdJLzVRTk9NZG9BQ1ZaUGRMU0N1akEvQ0p4Y29JbE5Q?=
 =?utf-8?B?WWZpT3YvMnRjL1BVQ2VNRTFuRGJTNktxSHRVeFdiVHVtNVVYZVZ6a2ZXRmdD?=
 =?utf-8?B?SzVyN2pBdDRIeVM1YlcyczFieFh5bjg1Q3NQQUk4d2gzVnEvUnV2OEw1Wita?=
 =?utf-8?B?OUxTYlRpOExEOWo4NWpMMmFuNnRkRXNEMW9QdGhEQm8vZDFiUWdGSVZ0UjNE?=
 =?utf-8?B?MFNaRXhHU1NReUxzaDEzVVlERnIrVFl5bW9INFU3L290eXRhWmVLM3FLb2M4?=
 =?utf-8?B?Q1lyaVQrbVVPMWtmS0NjU2VKVGtlUkM3aTB6SFJGdUxwOHlUbHVCT2RpMlNB?=
 =?utf-8?B?WUlrNk1rZnVwT2ZuUXcwWjQ2MnFQNTgrcmlwSStKM3pkTnFYVmQzdW1oZXdO?=
 =?utf-8?B?V0NNMkNENUFJMjN0bEFzVk1EQmlFKzVVc04xSVNwRFltRjNiSVkwa0phdXlk?=
 =?utf-8?B?TzdWMmtuc21kWGVLUmM5QU0rcHBleUtPSWRTUEV4NUxTbGRHbVZJWERXbDh4?=
 =?utf-8?B?dGx3UTBLRXVxcFRpOGp5TnVUT2txb1R2elRVLzVmejI1aTlKc1AxK0lWSGxm?=
 =?utf-8?B?Y1c0cWs5SnB5a1hjUkhOUzZWZDZLVi9OWm4zQy9DZ1ZDMmxya2hBTmh2WjZE?=
 =?utf-8?B?SDdKdXZscVRQc2VXd2crd2lQUXhaUFphUjZITEhLNVJZQm1wUjRrdzlhV1d6?=
 =?utf-8?B?eVc5MTdNQm5hb2hSRE1tQTRnWkMvMDIzdGU4ejBhUDVqL2N4YXRZZWw4a1ZY?=
 =?utf-8?B?LytYRlBUalhrdHVDSmNDbzNEZmFOcW42ODFCVEVEejRZcm01YjY2cWhpVHBM?=
 =?utf-8?B?dTZGTDBsWUVydFE5Wm90NVo2VllQclNvZ0NDeUpjMkdxWUtlYTVuZzlIWUFm?=
 =?utf-8?B?cU14Wk9reUJWZ0hPYUV1OG5qUTVLeUpBT1lCM1RaN0cwdDI3dUxCalc4aXVr?=
 =?utf-8?B?cmxpRU5ialc4NjN6blNGcEdpbFZrcTRtU2s5eW9zSnBTTndmVEI5VnlBYm9Y?=
 =?utf-8?B?NG5oeGJxUXh2alpNdHo4a3F6R25WeVRKVEdBTmhVQ0hwR3FwTXNaNzBXaDZE?=
 =?utf-8?B?RTRpRUlYU3VCZUxTd0hSK2pFNTlpUzNLcllPQlRtZFJOaDZXc2xaL2pjM0NC?=
 =?utf-8?B?YnY4c3ZJTElPZzhIU1FQTDgwd2lmM0VaREx2NnltZXI4RWFiY0Z4VUh3T2Vs?=
 =?utf-8?B?TkVLREd0OVBSemJvVytqRzdvbjdwZUkzREdwanM4M0ozV29sZUJtWHluN2U4?=
 =?utf-8?B?MVZIVHJTSkdaZEJMVWR0MzFiTk9ERjYyK2k1MjdpSTJjMWF6N1Z5MlBZMUJU?=
 =?utf-8?B?aVBkVllqdlFmN2F1TEV4TVI4NXNuaGVUeXlXZnVCUUJjSTBZcnVWTEVubFMr?=
 =?utf-8?B?c1E2UUNqdW1KRjY5c0dWZjN0MWtibWdublpiM2dmWit6SXhCd1pDeGdXNjRS?=
 =?utf-8?B?L2tjVThTck5xRjBkWnNDaEx6ZHRWc29sNkdneXd2Q1JNR0lGWUNNM2ZXR3ha?=
 =?utf-8?B?ZnNzdVA0Nzl1Y0NPT3hRQyt6MkpqK1p1cHZ5SzNMM2lwRkRIbUFsY1EwS1Zv?=
 =?utf-8?B?U2dhbnF1WW5leVViTXVzam5SdzF5RUZpWEJjby83U05MY0gwdHRxOUhqbzZI?=
 =?utf-8?Q?wl/NLm+P1/+FsUcn/iDvqmIJ9MdFTDOU?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB2989.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <09B9A5CC1505A64092D3E24D917D013E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9034
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:803:4d::31];domain=VI1PR08MB2989.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9f67fc2-2f07-4cd4-1c62-08dd621f6cf0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|14060799003|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1RxdlVURXMwVVlYSzRZVVkyYUZZZlpHbEtiR2N5WVg0U1VsSGUrRndUMmcz?=
 =?utf-8?B?MzFKWFkzcmgwSW4vaHpsRU5QcVgzMi9TNDFsYkc4NzFKWUVqRjBpUUhTUU1J?=
 =?utf-8?B?SkRoeXVsMGNBN3ZGak8xc3FaS1NwME8ybVQvWnUyL2RidmlnQWhnYnB6NzFv?=
 =?utf-8?B?T0F0bTMrM2JrUE5jSFFnbnFqZVRYNTl3dVlkeDE1WkRncWl0QW1zOEJWZkUv?=
 =?utf-8?B?R1B5bGpNM2d4Q2djQ3lDaG12N2RBRFlYR3Q0Y1NRVXZnN3dmMEwrOVpWSFVZ?=
 =?utf-8?B?SmltU3JTS01GbkttczFzeG1xQ3BlUlJ2cGtHSHR3aHhPNnloZFlUUnBHYnNZ?=
 =?utf-8?B?aXdtZkJHd09VWkd3aEJvczV5NmJvQ1JETC9Hb2M1U1hkaFRZNW9haFB0VndS?=
 =?utf-8?B?dkR5NEo5U2VVZXc3eXAzNExTY0NCMVJxNDRaSnNjeU5jZkNXaDJ2SlNXYytU?=
 =?utf-8?B?V3FvSldORnByR0x1bHkxUHhoaGRoUml1VTFaWkFFME1LZXJQZ0ZxeWV2UnRp?=
 =?utf-8?B?NWlTcUZYMnh6a2p4L0M1UHhtWnRmaVhpZGozeWtxSFdOY01lY1VQODBkeVpY?=
 =?utf-8?B?aTI3YjZBS2pZUER3K0NsWlQzeGtOYjFScXpXY2EwWkFaZUREdXNiZmdFeXJk?=
 =?utf-8?B?dDhNVDUyT2N1dDBxNzM1ODZ3K2ZRREVmamtHVUZUc1V1VDNHNDN3VTRudjhL?=
 =?utf-8?B?bzhGOVNLK3hUdEZhV1dyL1JScTNNWFRwV2orWi9Qak1kTy9WbEFCS1VqUzIw?=
 =?utf-8?B?Zk5wcVBmUGdteUFBODI2YzJQUDUzWWRWVjRYUU1sRnJNeWtYYVBkK1dQTWpj?=
 =?utf-8?B?N2c4b3JmLzZGWHc4TXhYMFhRUGUvTVFIZmtjUDdIeSsyNUFKYTZ5UFdwRlRz?=
 =?utf-8?B?bU9ER0Z4VldRM1M2cENvZm9aRXVyNVJta1dIR3J5OHdyaGg0Mm9oSUF1VmZR?=
 =?utf-8?B?cU1QVmY5WlduN25wb20vTFdpMmFqLzBGcjRScjhQMFordHRhZGw5bWgrajdK?=
 =?utf-8?B?ZW1wRERVenQ3S3lId3UraWUyZWdBcmk5cmtxT09sdzNxZU5FZWR1azkxaTh5?=
 =?utf-8?B?MVRyaytWZzk0bEF4YmtyTGV3TExFMGhjakc0emZ1L2ZkUVg2bHBadmVrVjBp?=
 =?utf-8?B?VWcxSkxiRVNGLzQ5SEtEYnRHbDZxbkVsUHp2dzZZWWJ5Lzd6RDBkdzc0clIz?=
 =?utf-8?B?NUp6TE1SWmhXRjIraXVBVWh0MVdsVUpLTVFmZmRqV3N0ZWRMdnhid2Z2aWpa?=
 =?utf-8?B?ckRuUFE0NG8rRkdRTVhOVTN4YTk1MytMdnJUeXVGZ3NpbHBYTWcwbXp2anhI?=
 =?utf-8?B?MWtUalJZUDI4UGRNRTJvY2hBR1VYVzRYQmpaeVZMVndDdFVRV2JhVytKSE5D?=
 =?utf-8?B?bGVFdXdoNlgwQ0FFaU13eTc0RlhNb0VKTUJiSWZSdE1aMjQwVTZUSGJ2dXpC?=
 =?utf-8?B?dEpacGdSN0tSVDVVR240Z1J1M1JBT2NRQ3R4L3RWS2RRRkd5cGdjV3dENWkz?=
 =?utf-8?B?N0V4VGk3RzMyWUhlc3ZhMWtzRkl4REpRWEJ3dzYxb1BxS3RQYU1ZM1NOVkV1?=
 =?utf-8?B?dlFQdG9SdVAzUm12ak5OVk9KUmR1TW9majgwVGViMk9jRDBFaFZSUWtDbWNv?=
 =?utf-8?B?MVJiTlhDbmY0ZHV5ZnJFUFd4SWJQbjZHbVU4ZldwKzUvMUplWkpFdzJycldG?=
 =?utf-8?B?UmYrSFphY2lSTTB2ek5tNjlFSm5Edk1sc2xZK0Y0RHJiQURqb2c2T0NNSFh3?=
 =?utf-8?B?YzY0TjJUVHkrbWhsNTBDNVptU3ZFaFl4NjJtRTZ0Q0FhTGNCci9ZTU5QNWF3?=
 =?utf-8?B?Y0NnQkF3Y1hhOTQvS09ZcmRjUENNRUJzTVl3RVRKQ2tRM24vand1ejM0NmZv?=
 =?utf-8?B?L0JQYUo0K3pGaW9qSS9vNHc3a0FMbCsxS0dmN21YVmc1OE02YlFpNzdTRkZH?=
 =?utf-8?B?RnkvZCtzTGJUaHFWVnRUSUZpU3BRNHZoOTZ0VHJVclBmWVFFNWZGSTQrc25P?=
 =?utf-8?B?RWFFL1pxNDFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(14060799003)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 11:08:57.8413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ba2101-0f72-482f-968d-08dd621f7393
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6525

DQoNCj4gT24gMTMgTWFyIDIwMjUsIGF0IDExOjAyLCBPcnplbCwgTWljaGFsIDxtaWNoYWwub3J6
ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDEzLzAzLzIwMjUgMTE6MzIsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4gSGkgTWljaGFsLA0KPj4gDQo+Pj4gT24g
MTMgTWFyIDIwMjUsIGF0IDEwOjE5LCBPcnplbCwgTWljaGFsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMTIvMDMvMjAyNSAxNDo1MiwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBSZW5hbWUgdGhlIHNldHVwX3Bh
Z2V0YWJsZXMgZnVuY3Rpb24gdG8gc2V0dXBfbWFwcGluZ3MgaW4NCj4+Pj4gb3JkZXIgdG8gYmUg
aW1wbGVtZW50ZWQgYWxzbyBmb3IgTVBVIHN5c3RlbSB0aGF0IGRvZXMgbm90DQo+Pj4+IGhhdmUg
cGFnZSB0YWJsZXMuDQo+Pj4gDQo+Pj4gbWFwcGluZ3MgaXMgYmV0dGVyIHRoYW4gcGFnZXRhYmxl
cywgc286DQo+Pj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5j
b20+DQo+Pj4gDQo+Pj4gYnV0IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2hhdCB3aWxsIGJlIGlt
cGxlbWVudGF0aW9uIG9mIHNldHVwX21hcHBpbmdzIGZvcg0KPj4+IE1QVS4gSSBzdXBwb3NlIHJl
Z2lvbnMgc2V0dXAgc3VjaCB0aGF0IHRoZSBmb2xsb3dpbmcgY2FsbCB0byBlYXJseV9mZHRfbWFw
IGNhbg0KPj4+IHN1Y2NlZWQgYW5kIGRvaW5nIHRoaXMgaW4gc2V0dXBfbW0gaXMgYWxyZWFkeSB0
b28gbGF0ZT8NCj4+IA0KPj4gU28gb24gdGhlIE1QVSBzaWRlLCBtYXBwaW5ncyBhcmUgd2VsbCBk
ZWZpbmVkIGluIEhXIGJ5IHJlZ2lzdGVycywgc28gd2UgZG9u4oCZdCBuZWVkIHRvDQo+PiBhbGxv
Y2F0ZSBwYWdldGFibGVzLCBzbyBzZXR1cF9tYXBwaW5ncyBpbiByZWFsaXR5IHdpbGwgb25seSBw
cmVwYXJlIG91ciBsb2dpY2FsIGRhdGEgc3RydWN0dXJlDQo+PiB0aGF0IHRyYWNrcyB0aGUgTVBV
IHJlZ2lvbiBzdGF0ZSAoZmV3IHJlZ2lvbnMgYXJlIGFscmVhZHkgd3JpdHRlbiBieSB0aGUgYXNt
IGVhcmx5IGNvZGUgYW5kDQo+PiBuZWVkcyB0byBiZSB0cmFja2VkKS4NCj4+IA0KPj4gZWFybHlf
ZmR0X21hcCB3b27igJl0IHVzZSB0aGlzIGxvZ2ljYWwgdmlldyBvZiB0aGUgTVBVIChhcyBpdOKA
mXMgY2FsbGVkIGVhcmx5KSwgaXQgd2lsbCB1c2UgbG93IGxldmVsDQo+PiBBUEkgdG8gYWNjZXNz
IHRoZSBNUFUgcmVnaXN0ZXJzLCBsaWtlIHRoZSBlYXJseSBhc20gY29kZSBkaWQsIGJhc2ljYWxs
eSB0byBtYXAgdGhlIERUQi4NCj4+IA0KPj4gRG9pbmcgdGhhdCwgd2UgZW5zdXJlIHRoYXQgdGhl
IGN1cnJlbnQgY29kZSBmbG93IGluIHN0YXJ0X3hlbiBjYW4gYmUgcmV1c2VkIGFzIGl0Lg0KPiBU
aGVuIHRoZSBxdWVzdGlvbiBpczogY2FuIHRoZSBNUFUgcGFydCBiZSBtb3ZlZCB0byBzZXR1cF9t
bSBpZiBlYXJseV9mZHRfbWFwDQo+IGRvZXMgbm90IG5lZWQgc2V0dXBfbWFwcGluZ3M/IElmIHNv
LCB3ZSBjYW4gYXZvaWQgaW50cm9kdWNpbmcgYSBmdW5jdGlvbiB3aXRoIGENCj4gbmFtZSB0aGF0
IGlzIGF0IGxlYXN0IG9kZCBpbiBNUFUgY29udGV4dCBhbmQgbGVhdmUgc2V0dXBfcGFnZXRhYmxl
cyBvbmx5IGZvcg0KPiBNTVUuIEFkZGluZyBhIGZ1bmN0aW9uIHdpdGggbm90IGlkZWFsIG5hbWUg
anVzdCBmb3IgdGhlIHNha2Ugb2YgYXZvaWRpbmcgI2lmZGVmDQo+IE1NVSBkb2VzIG5vdCBzb3Vu
ZCBsaWtlIGEgZ29vZCBpZGVhIGZvciBtZS4NCj4gDQo+IFlvdSBjYW4gY2hlY2sgd2l0aCBvdGhl
cnMgb24gdGhpcyBvbmUuDQoNCkkgdGhpbmsgeW91IGFyZSByaWdodCwgSSBjb3VsZCBwcm92aWRl
IGEgc3R1YiBpbXBsZW1lbnRhdGlvbiBmb3Igc2V0dXBfcGFnZXRhYmxlcygpDQpvbiBNUFUgc2lu
Y2UgdGhlcmUgYXJlIG5vIHBhZ2V0YWJsZXMgYW5kIGludHJvZHVjZSBlYXJsaWVyIHNldHVwX21t
IHdoaWNoDQp3aWxsIHNldHVwIHRoZSBkYXRhc3RydWN0dXJlLg0KDQpJIGRvbuKAmXQgdGhpbmsg
YW55b25lIHdpbGwgb3Bwb3NlIHRvIHRoYXQsIHNvIGlmIEkgZG9u4oCZdCBlYXIgZnJvbSBhbnlv
bmUgSSB3aWxsIGRyb3AgdGhpcyBwYXRjaA0KYW5kIGltcGxlbWVudCB0aGUgYWJvdmUNCg0KDQo+
IA0KPiB+TWljaGFsDQo+IA0KDQo=

