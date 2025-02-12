Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B66FA3266E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 13:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886439.1296088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiCKm-00052O-QP; Wed, 12 Feb 2025 12:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886439.1296088; Wed, 12 Feb 2025 12:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiCKm-0004zz-N9; Wed, 12 Feb 2025 12:59:20 +0000
Received: by outflank-mailman (input) for mailman id 886439;
 Wed, 12 Feb 2025 12:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F151=VD=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tiCKk-0004zt-M4
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 12:59:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2613::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a150a50-e941-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 13:59:17 +0100 (CET)
Received: from DU6P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::12)
 by DB9PR08MB6602.eurprd08.prod.outlook.com (2603:10a6:10:23c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 12 Feb
 2025 12:59:13 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::b5) by DU6P191CA0052.outlook.office365.com
 (2603:10a6:10:53e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Wed,
 12 Feb 2025 12:59:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 12:59:12 +0000
Received: ("Tessian outbound 4fd325905615:v567");
 Wed, 12 Feb 2025 12:59:12 +0000
Received: from Lbf61201092d2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E08E44D-9557-470C-A0ED-13941C4AECA5.1; 
 Wed, 12 Feb 2025 12:59:00 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbf61201092d2.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Feb 2025 12:59:00 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB8681.eurprd08.prod.outlook.com (2603:10a6:20b:565::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 12:58:58 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 12:58:58 +0000
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
X-Inumbo-ID: 2a150a50-e941-11ef-a075-877d107080fb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D/bvtRWAuYAWigAuK685X84DgLvsBraRRe8ezWLALV44fKLhhDCjbWrlXA+VIx7kAmHnkUKL1ZJeAswOvBaXx89QF7Ih8XkhROlDwdvKp8o6lkg0/kz1YFbLrP393Ez8vg3Z29OYsah4o8RdgB11rAm9XdwJYqS/5ZblbWQr5j3IVboC147fK5GBL3A/q3h3LsThiAn8M8lS/A1v1siZDkGjKF07t4sOsC/L5P8lCbACmd9ymTJ7yIW6u32msaNfIWZdWV/yRdSMBV2KiyUpntK1rDiqbygsnONPK6cOVKoALXthNm+NIDEgb+SrDCP5m8LRF2Ytk0qoF5dD19oigQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MIjHanZ1EMNdqSB3f9LlOxOrXhSMx0XnBMb/HcIf2k=;
 b=a6bxc2CP+iTm4c8A3nVRKIrBzRjx5CHVjB/xDv8bgwQXZnK5jl3cEjAiJkW0gb/gkNGyrLLuecevOxZ/ulkT1Nym62iW9iulEcnXxIPYMPqFa0XkYeWLWXkzE8lKxIsCB1Uvoau5djpabhtU9SPSFWVrfiLH95SVUh99fREW1yrzCML5UWzbMiy8nDnQgkgbCqUTyxQrqyH4GFFXMw24Fsw7SrDf3i5eYsTuKGKEIQa/jngu4006GmIsSLBapy0lxtQsZBIz/NKjyfGVcbZWkoAiuK02Uc+3w9uIPZu7gSZAxrDOpdHpE3PcRTzXKccn7Dfiz8uCkBdxVKk+iB0QSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MIjHanZ1EMNdqSB3f9LlOxOrXhSMx0XnBMb/HcIf2k=;
 b=Qq0nTysORYbyCXeAdqGBuIKZv7k+J8bqcbtkis4M/N7KcpXe5yXREEnv6PQY/GaAHTI4rXSB7KfxcmfPp3VSeDXZLflBBlPsN/iZEiFqNt8c7U1LneX7Ii4PJ7gsJIMEwaU/DuJi0kcNwyfPVt+4F3IA6qxysLqZdco2HbI0Em4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03f2cf1fd13dfd21
X-TessianGatewayMetadata: C7PJMFoUlJu19Z9IZQaXnfxFzsZOhskbIuWlS0mEFVzTOwttOr+NUagJafz+ryo/aaDClmkFl+IjPxQWFW4rERtR6mTUdm2j18RCfW2Oufr36KyDKjIyVwlFOT6qkLvS0kzdjN326HKf8ORYESez6UjezXv9IUgucKR0wQfza6E=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POX5qpwdc35DaDfKcJZkbAd+sEd0AB4Ha2KwRac96FGkOaJPg8hMBHP2KuOz+tI4mGXkGkT1itmg1Ddlve8EslVpNdGEURTXzqIzH+3RdZaHlohwJeZZk5Fl/Rqng9acKtWo0Ofu8OQ+cSjSHLQX3pMSqTHIi7eQjGr5cCiuIuefITJTrY+4He/rt22dxbtAdgth2BhjkWAnTUUPY0s7d2rNIZJ24FZ9Yn4kpxwf36dwdqpZoSpMqf1uQXWAQpIhZF7e3A6/DXB5Pzsei0vooRvBaNnkBMeMgNZGFVMp4gPyr8t6bBk7WbXT1KwRmE4ApAmy8Sz5mttTuA5xwzOj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MIjHanZ1EMNdqSB3f9LlOxOrXhSMx0XnBMb/HcIf2k=;
 b=aI26OliaVUOTAzstwHANandaaFzqjO1cpawhMCHLuRYxG7Ho8vhElqZLxY3cjyOwzpJnLREADWEiMR+ntDSWFr3W3nw53nE3qMlIfZUeuXcZHbNcGHH+Iwmm1dpkeqW2KOUWHgNBw7DrwR2ScKkZ/I3ndaNhEf0Zd7ct14HwOfQVpwVqyROrHnTAdhTdhwWK4OQBvuhaLFzZhKUlt6pnbLwM6nzFaBzVyagXbbjI5Aq6oT/obXgzL2Sj4jsuE/OHBmO+OJbbkrWIGzpDZulLrVdlMOlBNUOnWYsPKQytGq2a/zZABfSsWiJ0lb0OTnK0KCB+GwZyPdO0A5ogwixYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MIjHanZ1EMNdqSB3f9LlOxOrXhSMx0XnBMb/HcIf2k=;
 b=Qq0nTysORYbyCXeAdqGBuIKZv7k+J8bqcbtkis4M/N7KcpXe5yXREEnv6PQY/GaAHTI4rXSB7KfxcmfPp3VSeDXZLflBBlPsN/iZEiFqNt8c7U1LneX7Ii4PJ7gsJIMEwaU/DuJi0kcNwyfPVt+4F3IA6qxysLqZdco2HbI0Em4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbfS852PGMwQJcDk23CJnJhhVOo7NDjlKAgAAM3QCAAAYPgA==
Date: Wed, 12 Feb 2025 12:58:58 +0000
Message-ID: <439B7C5A-F357-4A17-99D2-1FF4F3FD9BFB@arm.com>
References: <20250212091900.1515563-1-luca.fancellu@arm.com>
 <20250212091900.1515563-2-luca.fancellu@arm.com>
 <c97cb922-733c-4afb-ac0f-6223ace5b956@citrix.com>
 <65418796-047E-4E8F-B674-CD0C61CD475C@arm.com>
In-Reply-To: <65418796-047E-4E8F-B674-CD0C61CD475C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB8681:EE_|DU2PEPF00028D05:EE_|DB9PR08MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d346e5d-d213-4692-e074-08dd4b650c3b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UXBDNENIRHprdWdnQWxGYXpRNTQ0Z0M1QkFYQ3lBcTByVWs5Yjk2SVVNVDQz?=
 =?utf-8?B?OTZ4MHJscXV5bG0rS1M2YytYZUkrK3M0NGdGSVhpRll2WlVvejZDR1M2MWpj?=
 =?utf-8?B?Ti9XeE9RTk50ZWVucmNvVGFZUnZpZW50MlpIRWpqckhLbHZjUTlIa2hUVzdB?=
 =?utf-8?B?ZW4zSDdDWDlyL09mNXByQ0prb0l2K0lIS3d1cFNqeUF6VWhZaTVKZlNxUFFs?=
 =?utf-8?B?V2ZwVVlvR0FUV21DWEc3VGVxRy9JbklYUWlLZ3d3NUZDS1hoWFpCQmZGc2lX?=
 =?utf-8?B?bTZ5M1pPZ2JXQ0pKR3A4YUFPNWV1bjBBUm5SMDE2bzZFazFtajZvcmw1clFZ?=
 =?utf-8?B?MERFbkJncyt3QzhYbXBJNFdTdVhxeEtBTnl4VWIvNkN6bXJwTS9oU0tKQUVV?=
 =?utf-8?B?QmlTUW1DT0hCTS9pNkJqWWdZTjdXL2kvTWg0dmJ3eDE3eVlDWWZManNjTm1Z?=
 =?utf-8?B?QmVPMzhmRUtwaWtJNExVU2N6dExXMitMak9RVk9MNVNVdVI0M2QzVldaZHlw?=
 =?utf-8?B?VlFpM2pvclJ3SDlBOGFZRWtFeGtCRHIwMFg0OCtZMFZXa2JiRlczRFRnMWc1?=
 =?utf-8?B?b0g1QnNXZkdXeDNOUkJ1NnpjelF0dUxqcWJnMGFFcWRhTTBuTmpqS3Fmb2NT?=
 =?utf-8?B?NkV3Y0RkN0g4U2hBeVVzODN4a3BOMG1qZnhMRnNULzhrQTdTOTZBTkdKcHl1?=
 =?utf-8?B?VzEzWW03VXZ4WFFWNXZMSmEyWFJtQ081MmVOdldMdmozSkh0NlRnQjJBWWZZ?=
 =?utf-8?B?T3IyaFZDOW9lTDkvWWI4WWMrRVpOSFd1bzQrSEJJbVVNQWc4OHl0dGZ3Q1ZH?=
 =?utf-8?B?NUVxdTBMNGRHZHhEc3JiQlU4b0dFR3E0K0EzRjZLVlFNYldYQ1JZcC8ySGtn?=
 =?utf-8?B?eVJ3ZGhvRWF6NDVkVGNGZStrVU1jU0RZM1pVMFhZdTkzOWFKZkpxSlJqNjU5?=
 =?utf-8?B?Mk9DMWhRQnJEeVpGdzdFNUJvQW14WGhmRCs1TE1VVXZOSlJhNjJLUTh0VXJh?=
 =?utf-8?B?eWFodWl6dmtFMlIrcExlb3VwNndrRTd6RjRsV0FDRllqRGtnOUZxUmJjdlF3?=
 =?utf-8?B?RWJEQ0tUYkdYNmw3U2lmMGxSYW4zaWJsN0I3MkQxUTB2V2pXTjJ5YTFZVm1q?=
 =?utf-8?B?NERzQURUaEhqaG9lSHJLa3MyQUR4L1pOTURmV3pPNVllYVlOWEg4cXQyWDQ3?=
 =?utf-8?B?NjNZZWl6SFNDUHAzS1BQc0VDVzZLZTdWbHJUSDNrSUIvd1pIL3NGaTh4b3BR?=
 =?utf-8?B?MTcrQWxFQitkUnV2M3IzbkRCdGlQd2ZkeEk2VlNHUGNQQXk0UDNLZEI5cnZp?=
 =?utf-8?B?bVYvT0JlTlNaT2pRdGYwVzZrdEdSVklaaklPU0RzR3JsN3Z4RHJkUG5VWUpa?=
 =?utf-8?B?RkZTSGt1RnJOOTFYRXdCd2tJZzYzWjZoNnZwR2U2c2t4dGFGVTl3YUUzcnlZ?=
 =?utf-8?B?UUxINmR4L2thdUcwVndHVGk0ZDgzNDJqVlFPY2pHQXUxMDZoRUVBKzhWbCtP?=
 =?utf-8?B?MXcrVkN5aDVVOHI3d0hVOGJhekQ5WmIzQ1ZHYk9Ib2hhalUwd0YyekVpUGNi?=
 =?utf-8?B?b2M1TE1jVCtqT0gxNHRTZGs2SDdFaGd4R3ZxMDB2aDF6NkN0SlNoRmdLRGFp?=
 =?utf-8?B?bDJuV1Y5SE5qNERYVG14ZUUvdGFzSVVMaFFyMklnSWsvUWgrT2ZSZGJIaUJK?=
 =?utf-8?B?aDNRV1l3WnFnQlIxdU5lMkxJSnRJZ1RXd216L1BRWmRoQjg1Q0hpK21ZM21K?=
 =?utf-8?B?ZVZlZUV2bitjUWxuZnlMRlRHVWZlQi9BUFZNU0JjbE01WGtVZkNaZ1RVR0c4?=
 =?utf-8?B?T3RFUWdHbmk1SGJ0V28xcEd5UmpkVGd6QzFzZkZvd0Exd1plUithdk5JN0Vz?=
 =?utf-8?B?UlkvR0dpdUdqZGlYQkZSRnlpclRIU1FuZHFXZDlKNmJmTy9XUVFiTHE0TDJ2?=
 =?utf-8?Q?aRXKCijOJwvDaEZoIpUH/p7zrmfA0cwG?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDE44D473E270E44A4A02F08C9697EBA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8681
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b9fca4c9-3027-493f-f76f-08dd4b650395
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|376014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1lLYktIWSs1Qmh5N2ZIM3pWRkx2YisxWXYvY3kvcWo3WWN5b1hycmlqU3di?=
 =?utf-8?B?K3V1UElDS0UrdHNMZVVDeEErclFWRDRHZkpaY29vUy9wK1BLcTVZUTFKU2ND?=
 =?utf-8?B?SW1DOVIrR3FORE1JcW9KYVhEaUhabEUzUWhxYXJ3aHJqZEg5UmlwOWRuK3lI?=
 =?utf-8?B?alpTTHExSUM4c3FiQS9MVnprSE1nU0p5K05LaEQ0U2VhWDh3c2NxSk1zNUh6?=
 =?utf-8?B?U2pkKzJrekU3dzZjbURHbHNoRmZMV05JS2JQQnVmZWw1UDNURWhqbjAzVmNM?=
 =?utf-8?B?czd5TWZEWjlLL3c5T3NkTy9xeXM3c3BoZDNjYmRiWUtSaXkvakI2Z2tySFNV?=
 =?utf-8?B?QlBtQkw2ZzcwUmRnb0YzMjI0b2lRRXpWZ3lrNVVOQW9LZWlZVzAyU2dscEx4?=
 =?utf-8?B?ekRRN2pLWGVLZ2d0SW9kVnNlcEdoS00ydngyYkg3QWJDMUNUd05sMWR4MXRz?=
 =?utf-8?B?SmllcmZXWE02OVI5Smowenp3Ty9TSFdmdzJRN1prOXZVdHpFZUplaVFCd2lD?=
 =?utf-8?B?RDBhbHJtbklPVHQ0T0lKeUd1SDlwSkhnMEZyVXA0UjArVnM1QUJFcGhpNzMv?=
 =?utf-8?B?SDBRdWVnVWJWMm9pNkJsT1hHL2oyT2pXUjhWS2NCaWF5M25XSFA4d2VWbXRC?=
 =?utf-8?B?WnZqRkF6azdjNzBkcTJkcnhoY1N6QlRrbzRkRXdWdnlrU3p2aWFpdWlVZXJz?=
 =?utf-8?B?ZE9TdkdrK2gwY0lsTkhxL0lXeGUvWUtNeTBUSWJNb3FuaFhjQlE5OTlaNC9v?=
 =?utf-8?B?a2JWKzAyd29XZG14SDlmVUF6dEZ4NkZzSUMybkoxYkdJaEV4M0c4TWhjaHJi?=
 =?utf-8?B?emEyRUNXYTA0Z2o5SCtnT1NuTWljOGIxRk1KUjc0OHhHYVdHbkpxK0NpaHE4?=
 =?utf-8?B?QUhJRHYzWDVWVXJjQ1lYZjNSeVVOWW1GdkdrcDJCR0doMWxZazMzSGYwSUJ3?=
 =?utf-8?B?K0l2bWJKZmZPSno5azhzSzNxSUp0VFpqb3MzV1lkajE2aWk0eWN2TE9pZXR0?=
 =?utf-8?B?aFBDVHA5SkxxOWhkQytNalBVYUM2VmkzZHVnWitGOTZkWVlRcGd6ZGNnMTJS?=
 =?utf-8?B?SVEyc1dWdUZiMit1SVNFTEpTaTRxZURIaENvSTE3MUM4MDBsWVVyWUZvSmVn?=
 =?utf-8?B?Q3l0NUYzOWZ4SVZNelpsa3YvN09KZGZEM09NU1E1amlwSTVFUW8zSEhHT0Fv?=
 =?utf-8?B?bHpienhZeFo3dEZCamtxVWRuN1Nqa0pYbFRwTjA5UFJ4US80Z1pweDN2TTJw?=
 =?utf-8?B?Y2w5Z1IvN0s1YUJhbnJNb0t3U1hlNXRNN09RU05XWXFSTmNEWUlBTnR1cWoy?=
 =?utf-8?B?WUs4UEU4VnVVZ2xDZktEOTFMZnJidllreWJKQnl2UERpRDB6a05qUytmNU9D?=
 =?utf-8?B?a01oWkxFU2pOOWllK0dHMS9FeVBGNklVb0hIL3BKMWNsMFF6RncrTEVBd3VT?=
 =?utf-8?B?bkxPdXZDeWRqMWQvUDM0aXoxVk1aR0VrTWw0ck96Z1BwTlgxQ0I5Smh2TzlY?=
 =?utf-8?B?R3o5YXZGUHRRMGRJeVNRYUs4aWRySjVPQUtEREg2cDVHZHBBRXVPWCtTV0JB?=
 =?utf-8?B?WCtvVmU3c0VkaUdUYzhXSGpMTjJEV1hrdVBnRGpUQmIzaFh0WTdMdlAzZzg3?=
 =?utf-8?B?QUlXR1FpTXJtbFNuSVV5bC9jalRlV1R6MzhiMXVPUWlBS2oyNmFMd0NETHJI?=
 =?utf-8?B?SjRUUXFQenBFSkpjM3hJOFpydXJpZkdUWmk4RFZLZ2l6ZkJvYlJBbXdvYkNq?=
 =?utf-8?B?Y244akpMeURneHRETGJmQk1LR2VxTGRxTmF1Q2NwTGg0RGR4NUt0aFZqeHJm?=
 =?utf-8?B?aEIwS1hsTVplOEM3NDdPNE8yandJK2dZeGIwUktxb3p4WlZLWUxwT3BYQTZW?=
 =?utf-8?B?OU1GWk1kTVd1SkJoRGMzTnVHZEIwMDdjU2JjQ1V1TUd4RlBOL3pGZXJTTDJW?=
 =?utf-8?B?QkEvWDZIckNIQlBRZkJpNVdJWkFjZFJ1V3NBU08yMVBYcloyTkVhMkltcDVT?=
 =?utf-8?Q?x9pIpmvd1sTLU3EbODlfG/E6xbR/qA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(376014)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 12:59:12.5509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d346e5d-d213-4692-e074-08dd4b650c3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6602

DQoNCj4gT24gMTIgRmViIDIwMjUsIGF0IDEyOjM3LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgQW5kcmV3LA0KPiANCj4gdGhhbmtzIGZvciB5
b3VyIHJldmlldywNCj4gDQo+PiBPbiAxMiBGZWIgMjAyNSwgYXQgMTE6NTAsIEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4gDQo+PiBPbiAxMi8wMi8y
MDI1IDk6MTggYW0sIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gV2hlbiBYZW4gaXMgYnVpbHQg
d2l0aG91dCBIQVNfUEFTU1RIUk9VR0gsIHRoZXJlIGFyZSBzb21lIHBhcnRzDQo+Pj4gaW4gYXJt
IGFuZCB4ODYgd2hlcmUgaW9tbXVfKiBmdW5jdGlvbnMgYXJlIGNhbGxlZCBpbiB0aGUgY29kZWJh
c2UsDQo+Pj4gYnV0IHRoZWlyIGltcGxlbWVudGF0aW9uIGlzIHVuZGVyIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoIHRoYXQgaXMNCj4+PiBub3QgYnVpbHQuDQo+Pj4gDQo+Pj4gU28gcHJvdmlkZSBz
b21lIHN0dWIgZm9yIHRoZXNlIGZ1bmN0aW9ucyBpbiBvcmRlciB0byBidWlsZCBYZW4NCj4+PiB3
aGVuICFIQVNfUEFTU1RIUk9VR0gsIHdoaWNoIGlzIHRoZSBjYXNlIGZvciBleGFtcGxlIG9uIHN5
c3RlbXMNCj4+PiB3aXRoIE1QVSBzdXBwb3J0Lg0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEx1
Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+PiAtLS0NCj4+PiB4ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaCB8ICA4ICsrKysrKw0KPj4+IHhlbi9pbmNs
dWRlL3hlbi9pb21tdS5oICAgICAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysr
KystLS0NCj4+PiAyIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncmFu
dF90YWJsZS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dyYW50X3RhYmxlLmgNCj4+PiBp
bmRleCBkM2M1MThhOTI2YjkuLmUyMTYzNGI3NTJkZiAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaA0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9ncmFudF90YWJsZS5oDQo+Pj4gQEAgLTczLDkgKzczLDE3IEBAIGludCByZXBs
YWNlX2dyYW50X2hvc3RfbWFwcGluZyh1aW50NjRfdCBncGFkZHIsIG1mbl90IGZyYW1lLA0KPj4+
ICNkZWZpbmUgZ250dGFiX3N0YXR1c19nZm4oZCwgdCwgaSkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+Pj4gICAgcGFnZV9nZXRfeGVuaGVhcF9nZm4oZ250dGFiX3N0
YXR1c19wYWdlKHQsIGkpKQ0KPj4+IA0KPj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQVNTVEhST1VH
SA0KPj4+ICsNCj4+PiAjZGVmaW5lIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoZCkgICAgICAg
ICAgICAgICAgICAgIFwNCj4+PiAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgaXNf
aW9tbXVfZW5hYmxlZChkKSkNCj4+PiANCj4+PiArI2Vsc2UNCj4+PiArDQo+Pj4gKyNkZWZpbmUg
Z250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSAoZmFsc2UpDQo+PiANCj4+IFRoaXMgZG9lc24n
dCBldmFsdWF0ZSBkLCB3aGljaCBjYW4gbGVhZCB0byBvdGhlciBidWlsZCBwcm9ibGVtcy4NCj4+
IA0KPj4gSW5zdGVhZCBvZiBwcm92aWRpbmcgdHdvLCB5b3Ugc2hvdWxkIGluc2VydA0KPj4gIklT
X0VOQUJMRUQoQ09ORklHX0hBU19QQVNTVEhST1VHSCkgJiYiIGludG8gdGhlIGV4aXN0aW5nDQo+
PiBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nKCkuDQo+IA0KPiBJ4oCZbGwgZG8gdGhhdCBmb3Ig
dGhpcyBjYXNlLCBJIGFscmVhZHkgY2hlY2tlZCBhbmQgaXQgd29ya3Mgd2VsbCwganVzdCBmb3Ig
bXkga25vd2xlZGdlIGNvdWxkIHlvdQ0KPiBleHBsYWluIHRvIG1lIHdoYXQgYnVpbGQgcHJvYmxl
bXMgY2FuIGhhcHBlbj8gSXMgaXQgc29tZXRoaW5nIHJlbGF0ZWQgdG8gdGhlIGNvbXBpbGVyIHRo
YXQNCj4gZG9lc27igJl0IHNlZSBhIHVzYWdlIGZvciBkPw0KPiANCj4gDQo+PiANCj4+IFRoZSBz
YW1lIGFwcGxpZXMgdG8gc2V2ZXJhbCBvdGhlciBodW5rcyB0b28uDQo+IA0KPiBBcmUgeW91IHJl
ZmVycmluZyB0byBpb21tdV91c2VfaGFwX3B0PyBJIGhhdmUgdG8gc2F5IHRoYXQgSeKAmXZlIHRy
aWVkIGJlZm9yZSB0byBpbnNlcnQgYW5vdGhlcg0KPiBJU19FTkFCTEVEKOKApikgYnV0IGl0IHdh
cyBmYWlsaW5nIHRoZSBjb21waWxhdGlvbiBiZWNhdXNlIHdpdGhvdXQgSEFTX1BBU1NUSFJPVUdI
DQo+IGRvbV9pb21tdShkKSBpcyAoJihkKS0+aW9tbXUpLCBidXQgdGhlIGlvbW11IGZpZWxkIGRv
ZXNu4oCZdCBleGlzdHMuDQo+IA0KPiBTbyBJ4oCZbSBub3Qgc3VyZSBob3cgdG8gcHJvY2VlZCB0
aGVyZSwgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zPw0KDQpPaCBzb3JyeSwgbmV2ZXJtaW5k
IHRoaXMgcG9pbnQsIEkgc2VlIEkgY2FuIG1heWJlIHVzZSB0aGUgc2FtZSBhcHByb2FjaCBhcyBu
ZWVkX2lvbW11X3B0X3N5bmMoZCkNCg0KPiANCj4gQ2hlZXJzLA0KPiBMdWNhDQoNCg0K

