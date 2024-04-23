Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F28AE805
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710627.1109941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzG8C-0006j0-Dq; Tue, 23 Apr 2024 13:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710627.1109941; Tue, 23 Apr 2024 13:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzG8C-0006fb-BD; Tue, 23 Apr 2024 13:24:20 +0000
Received: by outflank-mailman (input) for mailman id 710627;
 Tue, 23 Apr 2024 13:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agql=L4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rzG8B-0006fV-F3
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:24:19 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260d::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8bfca4f-0174-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 15:24:17 +0200 (CEST)
Received: from DUZP191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::10)
 by PAVPR08MB8798.eurprd08.prod.outlook.com (2603:10a6:102:32c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 13:24:14 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::2) by DUZP191CA0032.outlook.office365.com
 (2603:10a6:10:4f8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 13:24:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Tue, 23 Apr 2024 13:24:13 +0000
Received: ("Tessian outbound 8c03561b2da6:v313");
 Tue, 23 Apr 2024 13:24:13 +0000
Received: from 74b23753335b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94F9E493-CE11-4821-BE67-7A87889559F9.1; 
 Tue, 23 Apr 2024 13:24:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74b23753335b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Apr 2024 13:24:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DBBPR08MB5913.eurprd08.prod.outlook.com (2603:10a6:10:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 13:23:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 13:23:56 +0000
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
X-Inumbo-ID: c8bfca4f-0174-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AIJTZKSCL5NRSkkGQS5BkVZ803r271hUIkQJtA+xOFp4dN8Xsm5Kq6FPvA3UUH0f+OEpeA0JWWYOgjAj7c4wvPjF3Al4JdfugL9MkIoVafCuBZm3ZuFpL3CJDWdl6hNk3AkfCO6FJpmIj/bIWmROC9+XxeqlsWjqJ4cmhcGXEbvGP6C84iY8AjWKpl35ew7xO8vS05PlAL5tiiDF4Ej0j3J1ke9FkCYI41ik4KpLSf2eg4cfeLN7NR90mmxId+BbwEIZvMHRblTEeU3BMKSf30nut5PusBsjyDNIzimUuOsV5mq/xv/ZgI94Ggf3T5ITjQe84rV0AOdimk/rpNJbzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8kLzunINJcBpWu6G9GVvbGsVhDaERAzKG2j0BXjsBE=;
 b=JlTL0YwrZOal5JAhuWTBKXn3Xe+gvdr9gaj6Ll+mdvFwk8gilIhSPCysmVSRX/CCmb7Dhgz5+ueoyRpaTCVWuAtOGw4scNblW2YKvyjVZ/HoxMwPT4TMyz0asmoA3o8BMbzDrXx06XeZM+THigSlOVUKCSDTKx8ArIqGUJYc7jWKiVuFj/780kADohDWIlmbfuNck4nduHnKGodFCpltV6FVMXVmLEUmOkeGAAIJKSqNgyfFi5pmTbJI8LX2f/++W7n25Gyect9AuJoDvsLKL3ri1Vvey5IBztgR9dQJfcTaYWQuWQCUxSct+L/F5hUJDkKhD0GGtuWgPQ3mVDZNaQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8kLzunINJcBpWu6G9GVvbGsVhDaERAzKG2j0BXjsBE=;
 b=hml1z5w/ZjjQ7u5P0vpX4ddhgXkciswR0OP8cWKIkGac/edJwmBySrUwXsFWkSfgP3dIxnNMrGW6VQI5JhVlsPfxp9eMT5kqYuwz0CBeWBfLfmfURqEtXaOrVWvSdt6R2GmamdPd+h/owTvjP45TLlzFu4F5P08nK57aXGwxtq0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9c61c987436ce9d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lETbYMFV0TLH3rEtB6WDZfssU0Emnm4zihxCGGptHjwfmqiI/2SotAjdAIe6sZkemjqRKEnGnyckuVZhTHuDCYu2z0l/AXr4ZyCLL2IICPAZmJfUcr0npKg3OUVb1ztr9VtrwiJvh2enro8VAzR7L1BPW7qoj6Bkf3JTgw7XSIBELH2GDMXrNxtsdnDfN5OHQndCbMGXSYD6OAHzGVzpvcF7S4PyY6gdN+7RZ31CsP3VOaGCvA0hFefmLjilAmuhAyag+uwW7C2L8vQw6k2Jg6Dmtck70KqzC31IhkAN0zTtZRJXb5CmNytNE1Q2Bf1XrQJouXg5fAqNSpj2PWtMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8kLzunINJcBpWu6G9GVvbGsVhDaERAzKG2j0BXjsBE=;
 b=WuXXiyam8H/xIYl/I+v5Yczj43S/JrebL84onO+s3Lpo5VhNJIHD1ZVJrMPAWGnVne/jCNaXKWvlWFEUujYixNOkF4XG8I5Tj6ONgERTXILOUwmLhhztG9MtLt+4GbkvMZ0HKUfzD+LdqzyohvYgoE3X2iSBbEki0tdBRd6xz1eIJUFobtt0oVXxUiYNDe1Xy4GxkCTsdcoWz8GNGJI0ZZiPOHclxQuobslNwvWUTwR0ZPsgqNslh2iJ48FNKPZjNxoHf+v63wws02qN9eaIoR0hgdw6oiM30Sf2JqOofzF5XAf/Sf4lQcrKxm+qgbmbOpewO+170AWy1zxdoUKq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8kLzunINJcBpWu6G9GVvbGsVhDaERAzKG2j0BXjsBE=;
 b=hml1z5w/ZjjQ7u5P0vpX4ddhgXkciswR0OP8cWKIkGac/edJwmBySrUwXsFWkSfgP3dIxnNMrGW6VQI5JhVlsPfxp9eMT5kqYuwz0CBeWBfLfmfURqEtXaOrVWvSdt6R2GmamdPd+h/owTvjP45TLlzFu4F5P08nK57aXGwxtq0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI
 handlers
Thread-Topic: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI
 handlers
Thread-Index: AQHalIf6ydPM1y7+406Z1t07uZV5tLF0HrOAgAF7f4CAABj+AIAAGdeAgAAM2IA=
Date: Tue, 23 Apr 2024 13:23:56 +0000
Message-ID: <27BADE00-E6EC-4BD6-AC5D-201DF1A76BCD@arm.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-5-jens.wiklander@linaro.org>
 <89d268cc-bc49-4e22-b4e9-2e8dbe73124c@xen.org>
 <CAHUa44GAbBtczbVohVjC=66tqzjgeGLx44k9ddodDJL13KwVEQ@mail.gmail.com>
 <205a95f2-fdf6-4f38-b2e0-31e4fff9348b@xen.org>
 <756FEA03-7F16-48AE-8308-059EBF8638A0@arm.com>
In-Reply-To: <756FEA03-7F16-48AE-8308-059EBF8638A0@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DBBPR08MB5913:EE_|DU2PEPF00028D0D:EE_|PAVPR08MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d438bd1-3bff-4289-0fa3-08dc6398ab07
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bzh1NEl5bm40WVRTSy9PZGV0S3RweFBVYmpYSllqT3VMM0xqOFV6WWNVakRM?=
 =?utf-8?B?M0xrNkt0eS92YWlvK1k0UFZabjJNa3VYSGNVZ0diVHlPc2VQbFBFM3BWZWV5?=
 =?utf-8?B?TWJta0dmS3ptSWtzS1BOWXBoNVZuZEEwMlNVeWk0cG9vUVJGV1c2ZVd3VENN?=
 =?utf-8?B?aUp0dmtjeVMwampuMUVycHBJUUlLNkhscVdseTkrREtuWkl1M25ncHhnd2M5?=
 =?utf-8?B?Vjlwdi81bWVzSHlOdGU5QTJtV0t0cm55dGVIb3d6NVB3WDZJeE5LaTgwQ3Ar?=
 =?utf-8?B?S0hMRFp6SUdFNXZsSEtBNEV5Nm5TcmdDRk1ZV0JjV052STh4QkhiR1NtL1pE?=
 =?utf-8?B?Z0x4TFhHbzFzTXBiUmxuakJIYzhuYnRQZjRIa0NmSlRkQVZSQWJnd0dlZDdP?=
 =?utf-8?B?RytmbEZmOWFCbE5PLzRPZDA3MGZER2dJNExpRU9yeGlnOHRLSGhFeWtmYTUz?=
 =?utf-8?B?U1Rxb25ad0ZXQWw1Z1lPWVBzOVlmTlovVS9JQm5EakgyUWxSYmxOeGFjbnds?=
 =?utf-8?B?cUsxdW8vazJ5dGFhNSs0TmwxMDR0WVIxVU5vV1RwSGRmUmdWVGdJVXZheFBj?=
 =?utf-8?B?VnlXNXV2SWpRSC9pMFowSTloTWFJeGdpSHQ2SEpmYndSZDE2cTRTbUhzMWFJ?=
 =?utf-8?B?RHpzVFo2UXVCcUZOLzlYTE95dFY4R3V1ZEF5L0crZVRCRW9jdkJQM0hTZGFV?=
 =?utf-8?B?YjJyelMvdFoyeWVweGNwZWlTaXdGd01PdlgxNXJBSDZBdlAxbEEwMXlYU3RK?=
 =?utf-8?B?OEh0bm5waEdiSjZUR2JHci9rNFVBNjJJQlZXd0l0SG9ZU0twZDN2bHFQUGNU?=
 =?utf-8?B?WUZGL2xsQ2JBUUJyZUl1UXBrYW9vYVAzUC9LT3d4bDFPR09ZVnN5VEF3Zkp4?=
 =?utf-8?B?QWdOY2lWeHY2UmpONnJkc3pCaDVJM1BPdVN1MlNoSGtnUjFQMnU2bnRVZkNw?=
 =?utf-8?B?QnpCblV0VkFyRDZDa2hVR0pSZUNnSmV0VlFOdy9TV0wrMmhqaXVRL0xmdkk2?=
 =?utf-8?B?bUVOUmtMQ0U3RTU0cjJsVGJjMHh3ZGk3ancxNjI2eGc5aG82elZoN2NoU2dL?=
 =?utf-8?B?Rml6MS8yWDRxb3NCYzVrNWpxOUFVVVgxMWxqeFFKcUZNOU1nY3FxTExyVlNl?=
 =?utf-8?B?TmlNdU5yS2VIK2NlNHMxKzJObkMxYTlYSUtsRjZkQU52eCs4QWlTaWRPWUly?=
 =?utf-8?B?K05QT3p2N09ZdEdXd1M2VGhEenAyZFVqdzc2MlpmMVo2dkxzRGR0ZDM0V1Na?=
 =?utf-8?B?aGEwWDlmMk9INVRjbXhubCtzQ3ZGZklyc0E3Y1dxalY5NnhZZ29wMEpQb2s4?=
 =?utf-8?B?YUNmSG0yZnBPS29qMU5GZit6OE10RkJnUEE4Sk5Fdks4MSs2TSs0WjU1T0Jt?=
 =?utf-8?B?eVZodTBLV3o3VkdkajBWMUUxWHhJOUVCUEpJZHE4VHdrbTZ3WnkxQS9WMFZS?=
 =?utf-8?B?Ym5KemxlQjNsNGh5YXZzaSs2YTV5TFpId05jNGgzSm9TS0dCZ1d1b2xaSlFy?=
 =?utf-8?B?WmtuekE5TDNQVE1NM3hnVmVRK3JCVG9HME9IUTk0Y0ltQTM1aS9xaVNhMCtZ?=
 =?utf-8?B?T0Qyb2NwNXlHT0ppcUk3Tk1tNU9yRHI5cVRjSndyaDRMd3F4dkhoNkNac0RM?=
 =?utf-8?B?MGw3WEtxdEZoY2NrTFIrWUNGU05NcXVRWW5tRkNuZU1Gby9RdnloOVh0QkI0?=
 =?utf-8?B?VGNBbHVHejk1Y1lZSVc5L0dwMFdvamJXMWQzdElPV1Mzcll6eHlZYTQrcnRC?=
 =?utf-8?B?SktXQjRQa2lxSlQyd21jZzZ4VFJad1V6cjBTSDl2TStITTh3RlN1aDE0dzAz?=
 =?utf-8?B?d3pUSUxvM1cvZXJVQ1FXZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E9AD939D5B9034884E9A828CE417249@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5913
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	824946f1-f72f-4e02-4536-08dc6398a09b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW5nVUJ5UGxCRWxQdEJ4dXJwRW1BQWV3WGRMcUNyK3lNd29UTk5qWndyZlV0?=
 =?utf-8?B?ZWhWU2d6VzI0WmdQb1FuUXdiU3JnSk5LT0lYN3k4YjBWRVBTNjRaZ1YzV3Zx?=
 =?utf-8?B?eGYvOHRwWmRSaUZoL25CQ04yMXpmR0pQZ25VTWJHZGpDeU9UbGJ2WllOUG1H?=
 =?utf-8?B?Y1hSK1g1WWp4YkNqL3BTN1ZGbG1QL3N6QzFMd0FFdVVjODJBYnhEVmdNWmIz?=
 =?utf-8?B?K2wzdWNSdFg0dXNQOWg4RzA5V25SYURhYUtEYXZWdUZ2Uzc0R3gyVnpmYllC?=
 =?utf-8?B?bXNob0YvOTZxZFFlb1NkZGIrVW5WYzFOdU1LOXBUN25rL1J1TG54cHJGVkMv?=
 =?utf-8?B?YlNrK3Irc2JlVEFHSUVhYjVDVy9iRXZ0bVV1SEZWR0FncnpNcmVBbDJrNWhL?=
 =?utf-8?B?bHo5Sk80Vzk1Z01IbEdSRlF5WUlnb1JRVmFjTHp0RkJDdVp2MjdlU2JDL2w4?=
 =?utf-8?B?Uks0dkEyaUlhS0VKRmdyRjdvTTljd2MwRUdMOU1NemNUKzBVMDdvdHhMMGhT?=
 =?utf-8?B?WHJxL21GU0lGbVhsZmFFSVNKRFl5OEtSRlk3aEphZ2t4YWt0cCtvQ1daUTAr?=
 =?utf-8?B?NlJsRm15aG1kZzhBY1l3T0JZZS82UHdOcHlSYm40a0xaVXI0UE4vZVhlY2ZZ?=
 =?utf-8?B?Qy9xdFoxdVVQbS8rT0VCcUx2VFJha2dmTnNua2xUeFdXd2xFUzVRempyc3Av?=
 =?utf-8?B?NjZMRnBWMWpCSDJCVEtoUW5taklKdnNwcUJ4OU1MaSsxbkhVT05HZjV4L0l4?=
 =?utf-8?B?SnZOMHVIeHV4MnQyZkx3UHJnMFZuYnVYUjJVN1RvRjNCN0ZlMEpqQ2hHSWZL?=
 =?utf-8?B?SDdTNmxhbHZqbVpyS1psdnMySFY1eG5CMmF4QzlxSXBTVm1LanY1bzl2bC9s?=
 =?utf-8?B?emNZdnUzVnVpUFJ5K1d0K1lPaDI1UjRYUlo5S3lnbUpPRytOcVRXUTlRNUR4?=
 =?utf-8?B?OHBva3R4WEt4NXZoT0phU3JtckpkN1N2aTlEY0hYUXNrbVBaZEZLSDdNcVJl?=
 =?utf-8?B?Z3llWEQzNDBvSzdhUGZib1FTbGJob1dPR1Y1T29VZE84eGFNcjkzWE5kMFhY?=
 =?utf-8?B?VHU5aTU1UXJ4OCtjcDRGMmZxWVJFMkJLa1krdGlsanlCS3llVlBsME1SUUtr?=
 =?utf-8?B?NVRZbCs1V1ViVWhESWtEZlRVNDdSM3k3YzNnbUtQamM0NkV3dlpVQU9kSVV4?=
 =?utf-8?B?ZSs4UWcxVS93Wmc3YVJFNWcrN3E5S2dBaWZLK1hrbEFYSyswL2UvT2c2QUZj?=
 =?utf-8?B?K2xPbFk2MkVPb0ZvaXBlM1ljR0VCV2ZVc2pYMlowa3FXVUZpem14UWRTWDF4?=
 =?utf-8?B?WEdMSWloTVlEL0lQUWUvb2JHRnZKZWNMZk83SmJwRVQ4SGJ3KzBibFhuKzNX?=
 =?utf-8?B?cW9jTkd3aHliK2Q2bklscklkSmV6eTMzSHJFVTZsSlUwYlVQbTNwNU0zNkNh?=
 =?utf-8?B?NVR0VjArYTBVNnFBL1N5ai9hamRrK2RBdTIzY1ZrNXRNeW40YmVnc1ZHazZM?=
 =?utf-8?B?RytKRGZqTjlLWkN2ZENaNURxZ2ZMWUc5cFl4NExRTzFNK3lac3pZQzNIbXhu?=
 =?utf-8?B?eDJJRHFDRTZLeEcrdlpnOTZRemNPRGpyaVFOZlp3WFl4Mks0Rlg1OFU4b3Z3?=
 =?utf-8?B?alR1YUhIOUhrNW94NGVmYnFUN0daR3lPY21Gck9GTFZnK1ltVERrYk1aTFJk?=
 =?utf-8?B?cHJCYUdmTXo3bXB6dDgrbFdTMStXTXNYUjBxSG8xZGE5cndTeUo1VEkybkJV?=
 =?utf-8?B?QVpQcktKV25MYVliMGo3dldRWXZPcldLU3FKdjlMMzhqVzFUb1BZcHV4azYr?=
 =?utf-8?B?M0F3VFpiNHlRSG0rSlVnWm1BaS9wUXhXTHMwRjJDZU12YXlDVjBnMGNNR1F6?=
 =?utf-8?Q?KFyhfOaMLpdSZ?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 13:24:13.5313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d438bd1-3bff-4289-0fa3-08dc6398ab07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8798

SGkgSnVsaWVuLA0KDQo+IE9uIDIzIEFwciAyMDI0LCBhdCAxNDozNywgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwNCj4g
DQo+PiBPbiAyMyBBcHIgMjAyNCwgYXQgMTM6MDUsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4gT24gMjMvMDQvMjAyNCAxMDozNSwgSmVucyBX
aWtsYW5kZXIgd3JvdGU6DQo+Pj4gSGkgSnVsaWVuLA0KPj4gDQo+PiBIaSBKZW5zLA0KPj4gDQo+
Pj4gT24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMTI6NTfigK9QTSBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIEplbnMsDQo+Pj4+IA0KPj4+PiBPbiAy
Mi8wNC8yMDI0IDA4OjM3LCBKZW5zIFdpa2xhbmRlciB3cm90ZToNCj4+Pj4+IFVwZGF0ZXMgc28g
cmVxdWVzdF9pcnEoKSBjYW4gYmUgdXNlZCB3aXRoIGEgZHluYW1pY2FsbHkgYXNzaWduZWQgU0dJ
IGlycQ0KPj4+Pj4gYXMgaW5wdXQuIFRoaXMgcHJlcGFyZXMgZm9yIGEgbGF0ZXIgcGF0Y2ggd2hl
cmUgYW4gRkYtQSBzY2hlZHVsZQ0KPj4+Pj4gcmVjZWl2ZXIgaW50ZXJydXB0IGhhbmRsZXIgaXMg
aW5zdGFsbGVkIGZvciBhbiBTR0kgZ2VuZXJhdGVkIGJ5IHRoZQ0KPj4+Pj4gc2VjdXJlIHdvcmxk
Lg0KPj4+PiANCj4+Pj4gSSB3b3VsZCBsaWtlIHRvIHVuZGVyc3RhbmQgdGhlIHVzZS1jYXNlIGEg
Yml0IG1vcmUuIFdobyBpcyByZXNwb25zaWJsZQ0KPj4+PiB0byBkZWNpZGUgdGhlIFNHSSBudW1i
ZXI/IElzIGl0IFhlbiBvciB0aGUgZmlybXdhcmU/DQo+Pj4+IA0KPj4+PiBJZiB0aGUgbGF0ZXIs
IGhvdyBjYW4gd2UgZXZlciBndWFyYW50ZWUgdGhlIElEIGlzIG5vdCBnb2luZyB0byBjbGFzaA0K
Pj4+PiB3aXRoIHdoYXQgdGhlIE9TL2h5cGVydmlzb3IgaXMgdXNpbmc/IElzIGl0IGRlc2NyaWJl
ZCBpbiBhDQo+Pj4+IHNwZWNpZmljYXRpb24/IElmIHNvLCBwbGVhc2UgZ2l2ZSBhIHBvaW50ZXIu
DQo+Pj4gVGhlIGZpcm13YXJlIGRlY2lkZXMgdGhlIFNHSSBudW1iZXIuIEdpdmVuIHRoYXQgdGhl
IGZpcm13YXJlIGRvZXNuJ3QNCj4+PiBrbm93IHdoaWNoIFNHSXMgWGVuIGlzIHVzaW5nIGl0IHR5
cGljYWxseSBuZWVkcyB0byBkb25hdGUgb25lIG9mIHRoZQ0KPj4+IHNlY3VyZSBTR0lzLCBidXQg
dGhhdCBpcyB0cmFuc3BhcmVudCB0byBYZW4uDQo+PiANCj4+IFJpZ2h0IHRoaXMgaXMgbXkgY29u
Y2Vybi4gVGhlIGZpcm13YXJlIGRlY2lkZXMgdGhlIG51bWJlciwgYnV0IGF0IHRoZSBzYW1lIHRp
bWUgWGVuIHRoaW5rcyB0aGF0IGFsbCB0aGUgU0dJcyBhcmUgYXZhaWxhYmxlIChBRkFJSyB0aGVy
ZSBpcyBvbmx5IG9uZSBzZXQpLg0KPj4gDQo+PiBXaGF0IEkgd291bGQgbGlrZSB0byBzZWUgaXMg
c29tZSB3b3JkaW5nIGZyb20gYSBzcGVjIGluZGljYXRpbmcgdGhhdCB0aGUgU0dJcyBJRCByZXNl
cnZlZCBieSB0aGUgZmlybXdhcmUgd2lsbCBub3QgYmUgY2xhc2hpbmcgd2l0aCB0aGUgb25lIHVz
ZWQgYnkgWGVuLg0KPiANCj4gVGhlIGlkZWEgaXMgdGhhdCB0aGUgb25seSBTR0kgcmVzZXJ2ZWQg
Zm9yIHNlY3VyZSBhcmUgdXNlZCBieSB0aGUgc2VjdXJlIHdvcmxkIChpbiBmYWN0IGl0IGlzIHRo
ZSBTUE1DIGluIHRoZSBzZWN1cmUgd29ybGQgd2hvIHRlbGxzIHVzIHdoaWNoIFNHSSBpdCB3aWxs
IGdlbmVyYXRlKS4NCj4gU28gaW4gdGhlb3J5IHRoYXQgbWVhbnMgaXQgd2lsbCBhbHdheXMgdXNl
IGFuIFNHSSBiZXR3ZWVuIDggYW5kIDE1Lg0KPiANCj4gTm93IGl0IGNvdWxkIG1ha2Ugc2Vuc2Ug
aW4gZmFjdCB0byBjaGVjayB0aGF0IHRoZSBudW1iZXIgcmV0dXJuZWQgYnkgdGhlIGZpcm13YXJl
IChvciBTUE1DKSBpcyBub3QgY2xhc2hpbmcgd2l0aCBYZW4gYXMgaXQgaXMgYSByZWNvbW1lbmRh
dGlvbiBpbiB0aGUgc3BlYyBhbmQNCj4gaW4gZmFjdCBhbiBpbXBsZW1lbnRhdGlvbiBtaWdodCBk
byBzb21ldGhpbmcgZGlmZmVyZW50Lg0KPiANCj4gUmlnaHQgbm93IHRoZXJlIGlzIG5vIHNwZWMg
dGhhdCB3aWxsIHNheSB0aGF0IGl0IHdpbGwgbmV2ZXIgY2xhc2ggd2l0aCB0aGUgb25lIHVzZWQg
YnkgWGVuIGFzIHRoZSBGRi1BIHNwZWMgaXMgbm90IGVuZm9yY2luZyBhbnl0aGluZyBoZXJlIHNv
IGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhDQo+IHRvIGNoZWNrIGFuZCBkaXNhYmxlIEZGLUEgd2l0
aCBhIHByb3BlciBlcnJvciBtZXNzYWdlIGlmIHRoaXMgaGFwcGVucy4NCg0KDQpBZnRlciBzb21l
IG1vcmUgZGlnZ2luZyBoZXJlIGlzIHdoYXQgaXMgcmVjb21tZW5kZWQgYnkgQXJtIGluIHRoZSBB
cm0gQmFzZSBTeXN0ZW0gQXJjaGl0ZWN0dXJlIHYxLjBDIFsxXToNCg0KIlRoZSBzeXN0ZW0gc2hh
bGwgaW1wbGVtZW50IGF0IGxlYXN0IGVpZ2h0IE5vbi1zZWN1cmUgU0dJcywgYXNzaWduZWQgdG8g
aW50ZXJydXB0IElEcyAwLTcuIg0KDQpTbyBiYXNpY2FsbHkgYXMgbG9uZyBhcyBYZW4gaXMgdXNp
bmcgU0dJcyAwLTcgaXQgaXMgc2FmZSBhcyB0aG9zZSBzaGFsbCBuZXZlciBiZSB1c2VkIGJ5IHRo
ZSBzZWN1cmUgd29ybGQuDQpOb3cgaSBkbyBhZ3JlZSB0aGF0IHdlIHNob3VsZCBjaGVjayB0aGF0
IHdoYXRldmVyIGlzIHJldHVybmVkIGJ5IHRoZSBmaXJtd2FyZSBpcyBub3QgY29uZmxpY3Rpbmcg
d2l0aCB3aGF0DQppcyB1c2VkIGJ5IFhlbi4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQpbMV0gaHR0
cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2RlbjAwOTQvDQoNCg0K

