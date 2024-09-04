Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299BA96C621
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 20:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790651.1200475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sluWj-0008Cn-Lz; Wed, 04 Sep 2024 18:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790651.1200475; Wed, 04 Sep 2024 18:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sluWj-00089n-JA; Wed, 04 Sep 2024 18:14:45 +0000
Received: by outflank-mailman (input) for mailman id 790651;
 Wed, 04 Sep 2024 18:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHdG=QC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1sluWi-00089h-Pm
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 18:14:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed3e727-6ae9-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 20:14:43 +0200 (CEST)
Received: from AM0P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::15)
 by VI1PR08MB5343.eurprd08.prod.outlook.com (2603:10a6:803:12d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 18:14:37 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::cc) by AM0P190CA0005.outlook.office365.com
 (2603:10a6:208:190::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Wed, 4 Sep 2024 18:14:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 4 Sep 2024 18:14:35 +0000
Received: ("Tessian outbound 7d86ec5dfeb5:v403");
 Wed, 04 Sep 2024 18:14:35 +0000
Received: from L816d604269e9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B24B37D-40A5-481A-B83F-4149C9F6EB56.1; 
 Wed, 04 Sep 2024 18:14:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L816d604269e9.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Sep 2024 18:14:24 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU5PR08MB10437.eurprd08.prod.outlook.com (2603:10a6:10:524::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 18:14:20 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.7939.010; Wed, 4 Sep 2024
 18:14:20 +0000
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
X-Inumbo-ID: 8ed3e727-6ae9-11ef-a0b3-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iVdU43nWJrqK4QtaxzViCJUgXmuvefi+I/bFT9HIHIM7bHMCVIDQtOSrvM3HjI/ODBENxpPEmsKKc2n1MyIL8ibThv0o3LR4FEhi9HwelQZNgJyz40CFuR461QCpm0fABwDj32/k15Pk3mzupQ5nZjH+vRSzcM99jy3KcnEMMvaq7fbDIHbfjmt3bRoKWvV1Z65IDi91X8BJivYs3StOYntpQihNrxXnW6CnjHwXdpM0iVlLBWtZXCxwtoqfiecKfflEgPBZMKiT8ktSyF5DbiH+q9a0PtbILjVT9d0lxaK7+FFJIccKhGtEMNGKU3nhZYA6qeHEyjQz9r4L13dapA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYMHzqC8C9S8YzhtcPpA6Zwqs8HNic8uir2C4NSj6gw=;
 b=ObY8H86DVs5cRNhoV/IF1sZICK2em38WWp4myCGeHAbrnK4VLxENZPYrTbqyLK8RLT/QRPLsx8UY/F+tAHOKrLZstIDNla4Y2mI9gmhbzxamwGVLbTWFVM00ssjlflciMZRmIrC6DN4wqq5T+Pz8h5e+iaVewr0aGly856IQUTCa3AQC+l+w9sg1RQkEPJ7VW4cF8APdBhUyKaS2lCDgqgKLBwEw/oXsNpw47yiM9pQDNcvQ+2Dayu1XqbdRIgQksW3Eb6jkv9gYXzAlKbNb+kaTlpi+rNUEE2CUf3BeeirenBedcnXBIKTQnAlMctHYF8Ebv3L9wYS/WzvkKDOGXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYMHzqC8C9S8YzhtcPpA6Zwqs8HNic8uir2C4NSj6gw=;
 b=lZHwVJwT46PF8CRiztxpunGJfn6tcWB80YrA6k23RqULYdBxq2MuBzK+oDP5nHz3FzKrIYNrCy8IdzVXrojOJBZD+1X+GtW8x96XIqVHv4EJpVcCgNXUQGH+GWQys+eNkx8Xf0f2W5dnar9FLVjpFO0hosQmsnp7DzJokRoVLMw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9e9cad2c8c0a03f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhLmvXsrNtYiKGunFpTk65lyZ2slDf10RpZeJD4kOEIRS37MeVChVii6z9rzcKjlL+ymx6zUUPSalvc4I6NSHpdHP9mpsb3WXK1ozusL3vl9Kcw08FYw0Ek503DCxjyU8gf4C3gD/ThRdMkVhbHjHkjjj45U4VG2j3Z3e0Fe2DQUoQEI+8OGoLP5C2YPKK639QexRBNJisH4l2+z8jptY1IKtbJ6pEWF2PVi/nAbCwcwpHq4tq+Hnbf8zxjYMxC86pAnA9PtotUODanIBf0iQD8CsBTPoGhq2fTzbTO0lZI9Isa55LRh9tMAuq8tHvHFUVwPEKNP4KpNIOwQAZkqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYMHzqC8C9S8YzhtcPpA6Zwqs8HNic8uir2C4NSj6gw=;
 b=kInB9eu0p+TjoUkFqiiPv2/43cb/+4afdPItt/AytRPL8mTpEIyaSchJ5zZgMmcaY5MWoDNZ3i+6Ucw1qy4aGh6WXZg9we2hseUTB0f78SlsCAiVebHZSKZCpi7PQi0xqoxaNgIYki0kuX3NkxVY9HTWkQC0+SEYvhUzblxSe5ACobsYZujIVZoFTNqakFHz6L20ERC4TPBC6fLwmSRfcxSbtcOrjTjoT4HhPUPMRthmJqeSZ4p8R0Cc80TK3dK5i1ZpLRN6YJ9c3g1KLgSzhPYqwlhxs98wAAutSNjI49EUYnt228a5NADdTXnhU/OC5eUt7mXQNH2b+cPOre8afA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYMHzqC8C9S8YzhtcPpA6Zwqs8HNic8uir2C4NSj6gw=;
 b=lZHwVJwT46PF8CRiztxpunGJfn6tcWB80YrA6k23RqULYdBxq2MuBzK+oDP5nHz3FzKrIYNrCy8IdzVXrojOJBZD+1X+GtW8x96XIqVHv4EJpVcCgNXUQGH+GWQys+eNkx8Xf0f2W5dnar9FLVjpFO0hosQmsnp7DzJokRoVLMw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHa9XoHude8SoLzqU+vDRBIKLz30bI8y1SAgArTwQCAAGJvgA==
Date: Wed, 4 Sep 2024 18:14:20 +0000
Message-ID: <C845B4EB-2CF8-4B37-9507-4D575FC88AE2@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
 <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
In-Reply-To: <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU5PR08MB10437:EE_|AMS0EPF000001B3:EE_|VI1PR08MB5343:EE_
X-MS-Office365-Filtering-Correlation-Id: f5559837-d2a7-46cd-6bec-08dccd0d6ef7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TEhxcno0c2w1cGZKU05LcUc4bHR1cDFIcGlJbWlyQlEwZjZaTGI2TURUM2dF?=
 =?utf-8?B?RmJSdE8xUld6YWxvcGhyTEx1V1FWTmZrWmQ1cG0yT2NsWmZGN2pqZFdvRVd0?=
 =?utf-8?B?WU1TRnVRb1NpZU5qbzB4SjM3TWdYNnFUUGh2U0M0eE52TDIxWkwrVEhUOEl1?=
 =?utf-8?B?K01WcXBpSmxIMmhyK0t0dDNCUmRndXVVdUw5S0k2TG9ZZ2trYVd0bVVvMkVo?=
 =?utf-8?B?NWVIdlhhOGVnL1NpZ3c3aVorMUY5b09tb2MreS9JM0RvdE5yNXB6dFJ3T2Ni?=
 =?utf-8?B?YTQwak1ST2s2TkFOM1phbk9HNnBrdHF5Z2Z1MXlsRjNaZFNyVE5KcVcvSmFn?=
 =?utf-8?B?a2R0eitsWlVOeDBqMk1VUW5kR0puQTJvL2NhVEx1elVYZFU3NGs2dWtqemtw?=
 =?utf-8?B?a04xRnphb0hkdUEzU2M2WER1WHpJL3VNMEZ2S2J3dURRS3pyWjMzOWo5Y3B6?=
 =?utf-8?B?MnJZTU9QZkZhMDduVk5melJ6NmN1bC8wR0NoazhuU2tKYW9GOXUvQ1c2Rk1I?=
 =?utf-8?B?dDdXZFBDcGlnUU43VnhrOHg0bTNaNnE5M1BiNWMrQjk3TmZ4ZTk4MTUvV0ky?=
 =?utf-8?B?RjFhVndvYXoxVmhkWVRKWFUwck9LV2lZNkFYSjhzbThieS9jM2tid0dUN1Y5?=
 =?utf-8?B?SGtKWW91SUhXckthZlEyRzVWVzJRUnpqTVJmWjJFclozc3g5YWNtMmJTdjQy?=
 =?utf-8?B?dE9lb0lUSXpqMWs5bGsrUnhQLzVsYVd6dHNOZ0Y2Qy94SjRIOEQzaWJUaFlL?=
 =?utf-8?B?Sm4yWjhoT3VSd1huTjJMWldIVVpYenBYYlR6UEpWaDZ3Qi9pbmhsN2dKYzlO?=
 =?utf-8?B?enV5a05QRmRuUllYRkZqZjlDMmZ3Z0hDOWg0dmlvK01zZFFFNWRQZDJhZ282?=
 =?utf-8?B?Qi93dXdLcmhNbHNKZ0FCbVNWSkJKVUZIMlhRYnJCYXJpL3lsU2duT3pFaFZz?=
 =?utf-8?B?c0dxdmNYR3h3S0QxUGlsaWg1RTJNR2V2bWhxOFpjUFEvcFJ6YlBKN1kvdnRJ?=
 =?utf-8?B?WjFlbjVkMVR1Q3RKM3pwUUEwaFdUWTJuODQ1R2IxMWpianRhcy9nREw1OEZt?=
 =?utf-8?B?aTB4Z20wK3pERnNsbTBtK3l4QmJIdFh5NWlsc0FhSWdYSkRTZ0ZxSTlaOE8w?=
 =?utf-8?B?WDBta3R3WE1Tems0ZmNFUFltS0dndWVWVUYvS2lmWHZ1MWFmWkNpcjNnWDVN?=
 =?utf-8?B?UEtZamxHdFlab0lqS1VIWVNwSmViNXZoMHlsODZTTmJQSFByMVhvTW1nbS9X?=
 =?utf-8?B?REdiaTd4WHk1Rkh2a0trNGJYWVFxY2NVb0gwZE96UFJBWWhTdmNhaHJ4YTN4?=
 =?utf-8?B?WlJZUkgrZ2ZJa3MvcXptNG41S1p2MVlOL2VYUDNEK2FpeFNZQmRXOEFGQitN?=
 =?utf-8?B?Nnh6UDBSdnJ2SXNrQ0ZoU1dxM3NOeDZReDJtK0hDMjNISGdsUXRaQzUwcUxQ?=
 =?utf-8?B?N3VOUktiMHhnQ014NUJMajFDcE04c213aytFaFZRNit5d1FWV0tpRXZ5R0hX?=
 =?utf-8?B?UmNqc2NEMEpTSkxxM2VGaGdYalhZVTZZQ0pNcGlWL09OcENGQlBSK1Y1alZh?=
 =?utf-8?B?RU05emNLTzlITnNBelhtN3FiM0FXVUhMREgraFo4L1BUbXFoQ3RFTnByRmpF?=
 =?utf-8?B?dVdnOTZNakxKb2tQeWRDZnE5RXZuWEdFdUVud2d4Qld1L2ljQzQrTElScG90?=
 =?utf-8?B?Tno0U09rdlA1by9TdHJudGtJRWJxRTFwd1FLMnk4T0s0dm5kc04yRndwalRO?=
 =?utf-8?B?QXc1OVJVNm5CaG1VRXZ1bXdaSkcrU2ZxWjI3ZjhxWXVKRmFySzMyRE9QY2Vp?=
 =?utf-8?B?WmhwN0lBWkhpTjIvSnNsUnp2NkFFY0xhMU5PdkJnM1ZQTHY5NEpXbk43RHpj?=
 =?utf-8?B?OU5TZmgzM0JyNFJCeXI2cGlzZnhCYW54QkdWL3pXMEQxNEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEBC6D8FF68A3040BCAC526EBAC9EE58@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10437
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c78e38b-7fd1-4ced-3c84-08dccd0d658f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXFoODBSYlNmT3RlWndBYm5IL21Fcy9HbEh1Y2lRTWFmWUVxOFBGUE03a2ZZ?=
 =?utf-8?B?VCs4QU9aWDZmSTdkbFpvc1NTNXh2aVcwbC9xNlhIcUFPVEdwOUd6Y1I0RjVI?=
 =?utf-8?B?RDZNSWFla29vRW9aRXZibDl1NHNyd0d4R1Vjc3RTUU5ZU1BaRGUxNkxjYzU1?=
 =?utf-8?B?L2lKK0daT0JIdmNUUzBSQjZkWUpWaU5Ib1gvSVlyd0kzRnFYUHlMMEpwVzg1?=
 =?utf-8?B?cTVFM0tqWngxcXlOcTJKUW4xakFpbjJxK1g4YXZFSzNHelg1ZUVtNmFKR2xU?=
 =?utf-8?B?WTdXTVkwbThOcExudU82dmFadi9RbUNKZnorQlFNQmlNdVViZUNGTlI3NjJk?=
 =?utf-8?B?bnpTejMxeUpmMTZRS096OVkwR2p5VTg2SDJWNy9LTmkvMllQcWhlOWlnOTVH?=
 =?utf-8?B?ZHZjbGIxdnhrSzZ0aWtRL2M3Q0lqZG50YzFwMmlCdDBFUTU0S0NVdExublA4?=
 =?utf-8?B?aGdBVTVjK0NGUkJvOHc2S1l6UUVBRFRTQWFJTmgybTVmQjlubUdCQWV2c1pS?=
 =?utf-8?B?QUJ6T05WQmttYldNb3BkQ01oY3E0Y1R3UVVWZ1hjOUlob3FJT2RFUVhRaXFE?=
 =?utf-8?B?bTBNK1l1U3JKdWNiRFBlNnFPY1MwMlNXY2tlb2o3bGU2NmJrZVhHQXZyWGJv?=
 =?utf-8?B?UHE2U2w4L1k4UkFNVGQzMWFlZEpDbHlYK3JKcWxuTVFuRG1FS1g3b1JuamJq?=
 =?utf-8?B?bEpLQ1BPVXFJZ1ZlRkNtT2NMNmFIQzFSUXRmWFA4eGlURE1JVDFhZk05WGxU?=
 =?utf-8?B?anpqWmF4UklWRkdObEpLUWRPTEFMNUJsRWMxQUIwNkRsd2lMQW9vOThKUlZ3?=
 =?utf-8?B?WUZLVE5sMG1aKy9iMjhpWWNRcVN0YzZZNkdxeTVhZXNDZEJDV0xCV25iUncv?=
 =?utf-8?B?R2hDU3hsd3ZkV1F5Z1d2Q29qdUdRSjdMNUJUMFAwWndKWmhESFpPNWdXRUdP?=
 =?utf-8?B?SDhqOXExMVNWblFmWWJ1S0lwV1dOSHlDY1JzUVZRSitSVnlVdy9aeVdHaDJr?=
 =?utf-8?B?bzdYVXJCbjFkdzg2MXNTY0VxMVRJVWlwdnJMU1FBNmJWYWNoUTR2UGJCSldh?=
 =?utf-8?B?MlFIWG1hTVFabnhtd2J0azFLQWFkaGxKRnU3Q1E0MHN1MHJUaW5Sd3ZCOE41?=
 =?utf-8?B?OXZRVU5NV0M1YXc5WHJqNER4YmMzc3RqYWt6QXpxWVBVUWJ2QllaVmpRKzhB?=
 =?utf-8?B?Z0lhcjdlb2xkeGV2RFpVeXM3di9OYWxJY1RkYmg1OVRFQU12REdtMlVRaVg1?=
 =?utf-8?B?eVJvc0tiKzltcGVJaTQzNVFiV3ZCZm5hZEdIM0ZPbUdSYUFpTlpGOW0xTkhR?=
 =?utf-8?B?K1B1b1ZXTWphcSttVDRpMkFzZlhzODhpZ0ZaaFMyQzBoTlBXWnhidkQzUVNR?=
 =?utf-8?B?NEhmMzJQWkJFNVZVVUNqODA4NmxXcDNZdlFXRlRTR09zZG5RTXV1VnVPbjhn?=
 =?utf-8?B?d2lxNHVHSFRmdXFYazVLb2RFQldoVm9QOUduU2k1R3pWSjZHb3YyN09VaTRL?=
 =?utf-8?B?QkZ2YkZDVllvNWMwbk5RemEraGtZbEswaHJHYjJuazhqRi91dVBlSEhXVTBY?=
 =?utf-8?B?SGk4UlNycGRDdHZuL1pJYUs4SzV1WVJ3ZmV3blhqMnJaN3hCNThqUmtRS3or?=
 =?utf-8?B?SU5FM3pDK3ZLckdqUnk3c0dUNVFFbm5wTXhkc044bE0wMGZrMk5TQU5EMWsw?=
 =?utf-8?B?WEMzWmVOT1BuWnlKS1gwSjBFMFdyOUN3YTJQQ1FTNTRkSXZPSU9sdlBqS1My?=
 =?utf-8?B?eno0bUZ6QUphaktEeVR0L0ZBOGFOaFZlMXJwQkRZVlFXeG51RllNM1UzeFBS?=
 =?utf-8?B?Y3h2ejZod2FsVFR0TGVSSUN2cGNTeGRPVUZ1N0Z1WVNiMVdOVEc4dWVMK3h3?=
 =?utf-8?B?MCs1T1RkS3lkSHZ0cUpTRDFrYmpESkN1NHlLNm1KeVZ3aTFoM0hDZi9FUXNo?=
 =?utf-8?Q?o14P70b21JFPRlW3UDC3ZLqhbKS7uWTy?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 18:14:35.9120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5559837-d2a7-46cd-6bec-08dccd0d6ef7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343

SGkgQXlhbiwNCg0KQXBvbG9naWVzIGJ1dCBJIGNhbuKAmXQgZG8gYSBmdWxsIHJldmlldyB5ZXQs
DQoNCg0KPj4+ICsNCj4+PiArLyogTVBVIG5vcm1hbCBtZW1vcnkgYXR0cmlidXRlcy4gKi8NCj4+
PiArI2RlZmluZSBQUkJBUl9OT1JNQUxfTUVNICAgICAgICAweDMwICAgIC8qIFNIPTExIEFQPTAw
IFhOPTAwICovDQo+Pj4gKyNkZWZpbmUgUFJMQVJfTk9STUFMX01FTSAgICAgICAgMHgwZiAgICAv
KiBOUz0wIEFUVFI9MTExIEVOPTEgKi8NCj4+PiArDQo+Pj4gKy5tYWNybyB3cml0ZV9wciwgc2Vs
LCBwcmJhciwgcHJsYXINCj4+PiArICAgIG1zciAgIFBSU0VMUl9FTDIsIFxzZWwNCj4+PiArICAg
IGRzYiAgIHN5DQo+PiANCj4+IEkgYW0gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoeSB0aGlzIGlz
IGEgZHNiIHJhdGhlciB0aGFuIGlzYi4gQ2FuIHlvdSBjbGFyaWZ5Pw0KPiANCj4gSVNCIGlzIG5v
dCBuZWVkZWQgaGVyZSBhcyB0aGUgbWVtb3J5IHByb3RlY3Rpb24gaGFzbid0IGJlZW4gYWN0aXZh
dGVkIHlldC4gVGhlIGFib3ZlIGluc3RydWN0aW9uIGp1c3Qgc2VsZWN0cyB0aGUgbWVtb3J5IHJl
Z2lvbiBhbmQgdGhlIGJlbG93IHR3byBpbnN0cnVjdGlvbnMgc2V0cyB0aGUgYmFzZSBhZGRyZXNz
IGFuZCBsaW1pdCBmb3IgdGhhdCBtZW1vcnkgcmVnaW9uLiBBZnRlciB0aGUgdGhyZWUgaW5zdHJ1
Y3Rpb25zLCB3ZSBuZWVkIGFuIElTQiBzbyB0aGF0IHRoZSBtZW1vcnkgcHJvdGVjdGlvbiB0YWtl
cyBpbnRvIGFmZmVjdCBmb3IgZnVydGhlciBpbnN0cnVjdGlvbiBmZXRjaGVzLg0KPiANCj4gSG93
ZXZlciwgYSBEU0IgaXMgbmVlZGVkIGhlcmUgYXMgdGhlIGJlbG93IHR3byBpbnN0cnVjdGlvbnMg
ZGVwZW5kIG9uIHRoaXMuIFNvLCB3ZSBkZWZpbml0ZWx5IHdhbnQgdGhpcyBpbnN0cnVjdGlvbiB0
byBjb21wbGV0ZS4NCj4gDQo+IEZ1cnRoZXIsIHJlZmVyIHRvIHRoZSBub3RlIGluIEFSTSBEREkg
MDYwMEEuZCBJRDEyMDgyMSwgQzEuNy4xICJQcm90ZWN0aW9uIHJlZ2lvbiBhdHRyaWJ1dGVzIg0K
PiANCj4gMC4NCj4gDQo+ICAgYGBgV3JpdGVzIHRvIE1QVSByZWdpc3RlcnMgYXJlIG9ubHkgZ3Vh
cmFudGVlZCB0byBiZSB2aXNpYmxlDQo+ICAgZm9sbG93aW5nIGEgQ29udGV4dCBzeW5jaHJvbml6
YXRpb24gZXZlbnQgYW5kIERTQiBvcGVyYXRpb24uYGBgDQo+IA0KPiBUaHVzLCBJIGluZmVyIHRo
YXQgRFNCIGlzIG5lY2Vzc2FyeSBoZXJlLg0KDQpJIHRoaW5rIHRoaXMgd2FzIGEgbWlzdGFrZSBm
cm9tIHRoZSBhdXRob3Igb2YgdGhpcyBwYXRjaCwgaW4gbXkgb3BpbmlvbiB0aGVyZSBzaG91bGQg
YmUgYW4gSVNCDQphZnRlciBzZXR0aW5nIFBSU0VMUl9FTHgsIHRvIGVuZm9yY2UgYSBzeW5jaHJv
bmlzYXRpb24gYmVmb3JlIHdyaXRpbmcgUFJ7QixMfUFSX0VMeCB3aGljaA0KZGVwZW5kcyBvbiB0
aGUgdmFsdWUgd3JpdHRlbiBvbiBQUlNFTFIuDQoNCkNoZWVycywNCkx1Y2ENCg0K

