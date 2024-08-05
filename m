Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC54947D10
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 16:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772224.1182661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sayvJ-0005wp-Tc; Mon, 05 Aug 2024 14:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772224.1182661; Mon, 05 Aug 2024 14:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sayvJ-0005ty-QR; Mon, 05 Aug 2024 14:42:57 +0000
Received: by outflank-mailman (input) for mailman id 772224;
 Mon, 05 Aug 2024 14:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VQKQ=PE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1sayvI-0005ts-8G
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 14:42:56 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff951622-5338-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 16:42:54 +0200 (CEST)
Received: from DU6P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::14)
 by DB9PR08MB9611.eurprd08.prod.outlook.com (2603:10a6:10:461::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 14:42:51 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::23) by DU6P191CA0028.outlook.office365.com
 (2603:10a6:10:53f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Mon, 5 Aug 2024 14:42:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Mon, 5 Aug 2024 14:42:50 +0000
Received: ("Tessian outbound edeef5361dc2:v365");
 Mon, 05 Aug 2024 14:42:50 +0000
Received: from Lf95ec7aef42c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F281C5D2-DE9B-464B-A4E3-DE6FB08D2F60.1; 
 Mon, 05 Aug 2024 14:42:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf95ec7aef42c.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Aug 2024 14:42:38 +0000
Received: from PAXPR08MB7154.eurprd08.prod.outlook.com (2603:10a6:102:207::17)
 by DU2PR08MB7341.eurprd08.prod.outlook.com (2603:10a6:10:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 14:42:35 +0000
Received: from PAXPR08MB7154.eurprd08.prod.outlook.com
 ([fe80::2631:ff92:5cd9:3587]) by PAXPR08MB7154.eurprd08.prod.outlook.com
 ([fe80::2631:ff92:5cd9:3587%6]) with mapi id 15.20.7784.020; Mon, 5 Aug 2024
 14:42:35 +0000
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
X-Inumbo-ID: ff951622-5338-11ef-bc03-fd08da9f4363
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q1KRPWtCaUDxMs0gGOS64gJ6CKI6jVNkuT+hwqnjGzq3IXxeZv8pYD5ULlg/Yn62nFzeERejNXkJUoYD0vG3XCHCgYJVZhm275tY4IZBcwRFvIrq9bkvuoHoNWoZw5GHCH/2oY81/dD7W/M5QpaQ2iSaXVtIKAxlO5vPMUVyduQkZN5l1yssgkij6WssaNXeuCvNgYMWGtPbCocCBlUKv3NIN8bWf4MGUhV1v48mc5QqDwATSG/UWqC3arfS53W2ivuSoJRuRxYj2pn3yHm4VTuHpPoBC0k+pd4Wb3URZvPXkWTBq12uEeHb5iOaJi0U1CYD0xMmQr14EN8yntOsLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5yGcUbzsPK+yakwkAcP1FUQqd6qShahvhgtwtKTMyA=;
 b=L4Z68xxytWFF9KWD0SgYmqeXAVndXQirdzJcIFbIdFwZjUyJh4FcJ6TWqqIROBC0uZgh3amTonJNYTCqz+4/3C0I306bGe2kcYMC28DBDhSkxh2zAhnBzpuvrrotRebIvc0ay1gz8xXgJHyxOHVjvjD8VWUf0PBNf0cuayM6PJbsSxT3hS/dxGreAKifhRTZPvRzloAHcEqim8/n8QpxeYKW8v11xJfvnJFLXb7ct8Zr2Tdj7JwdmCm2PK3c2o004Mkhh5PkGGBBWxeJ+AeFTW5sZ4Z15GuVsf1VWzFB/yIPeOZaBlzdbnGQkQAuxFkZVqEiSkmkOfEcOup6WWGrMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5yGcUbzsPK+yakwkAcP1FUQqd6qShahvhgtwtKTMyA=;
 b=kGnTM0uXLVlUcvcT1skCaZOLHFDHbmVDT+iCe+bpDj5pBkY9l699eLr5JETmHsvXZ4B/aHjEIHPhifgPjWEgQIJyMBtsNP026zGBPDzk5WLuhoiUJ70EheR+1/6wAaGSxJrKnz7X//AU5sIbSoR9/t2OvcYDklkQwqzYq4Guxrg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00e9e1b316179ddf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+B4Dp+Q/dHX1SgP/DFCDLtLAh+I6uArswELQHglnrirmt4GNF4x/UxVMnOml7V0XAHZsD9Io4n13N58+qIfjcxJkrV6hLHhkkNJV8ZWLiJkpWsbBzUuSZQp0lpDrecid5QvHZYzBh64yBk0mKJ65tW1Ol+3rwJW+XXAQ5vi+mkURXgXKVaViG6qXR81O3Hjk5mOaDxKu5I3HPc89F26ZHk1RNxyCf9u91Ho+9CHQQb7QXbBCFw/oKdlKinAQIF870uzZJD8BQHQg8H7m65C7Kw4oZgePU3yu6cfgPVN1cT6XLn5zMs2/aZglkvGRM5ZUEqUi5DBT9EWbcljSxwThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5yGcUbzsPK+yakwkAcP1FUQqd6qShahvhgtwtKTMyA=;
 b=QvYfhpdNg9nHCxpJzNI04gCzghlAd/mJGTV8GBeIYFhAkUonej7z+dB8el9bS06GfKKlL6lqfNjCfXQfSxtlK8vG+0Jc8h/II1vdPVzcHOC/1iHYwYpIp6VKXcQbmXbUtVD0UdJFjqGwAEIP93XuTstqdWwcJjDthdPjmkIt1ihkJwO2Agb/97GJ2iW5rCW9jpx7ZMT7uyaw/vpy0zA1pk0Rcd5nm5yCkPDNpYDWe9NgHW4d+SJWj3L6LHxsuY0o0LjsvuOuWKWFf5cfDqqJ01oonG1Et8lnUyNL3VlOZTMrg7pAGs8THO1cjXs4APs8BItZ/3KQV6E1Iu2su8k4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5yGcUbzsPK+yakwkAcP1FUQqd6qShahvhgtwtKTMyA=;
 b=kGnTM0uXLVlUcvcT1skCaZOLHFDHbmVDT+iCe+bpDj5pBkY9l699eLr5JETmHsvXZ4B/aHjEIHPhifgPjWEgQIJyMBtsNP026zGBPDzk5WLuhoiUJ70EheR+1/6wAaGSxJrKnz7X//AU5sIbSoR9/t2OvcYDklkQwqzYq4Guxrg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vITS: add #msi-cells property
Thread-Topic: [PATCH] xen/arm: vITS: add #msi-cells property
Thread-Index: AQHa5Qmh1vmjy32rpkCopxzgGZ2sd7IYwTSA
Date: Mon, 5 Aug 2024 14:42:35 +0000
Message-ID: <2D3D5C00-974A-4B2F-9229-44B6F760A9D0@arm.com>
References: <20240802182654.8976-1-stewart.hildebrand@amd.com>
In-Reply-To: <20240802182654.8976-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7154:EE_|DU2PR08MB7341:EE_|DB3PEPF0000885F:EE_|DB9PR08MB9611:EE_
X-MS-Office365-Filtering-Correlation-Id: cb237345-d31f-4a67-e656-08dcb55ce17d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dWljQ01uRFlkTkY1TlBNc2YwL25kcVlJeGI1bU8vZ3l2UlNCUHVQTkNwWWZV?=
 =?utf-8?B?SzdhTUlTSGxSbTJScGF2NExya0EwWEJUOGNGWTh2RTRQUDA5ZzgxR1E2OG5Y?=
 =?utf-8?B?MFFzek56eVVOY2xpc1ZqbHQ1UExzb1NtOGFkWXpiWVNRck9meUc0Rk41SWpi?=
 =?utf-8?B?Y1VLMjhsbnpsM3dHclRqV2s4VFFFZEFtdWIzc3pkL3hBb1BlSWl5WmYxM1NL?=
 =?utf-8?B?UjlxUkVVd1JQTW9ET3JZSHpCc3ZoZXJweEhZZ0lTdldSdkd1MW1Hayt2S2R4?=
 =?utf-8?B?SCtlanovK244ektxUTZCVTlSL2VSbkJ6TElsWlMxcm41OFFOTTZnTWViY2hW?=
 =?utf-8?B?VUxEU29XblROc0llN3I1S2pBRzZjRFhhZ3BwbmZRK05VM0hEZnRvQ1lHQmdD?=
 =?utf-8?B?NVozeVl1T1hkVDZwbG82VDRTYjFmQTBIOXlONjRjY3dQblBOVXorYlZLZkN3?=
 =?utf-8?B?UUkxUG80aTRDZHZHYUc4YjlBK1Y4SUhJczdxbFRlOUZvaW8rcy9TVEdGbXdJ?=
 =?utf-8?B?eUtuc1FQNmZvWitZVFVraWlvQ21rUXlYZStSZ05aL05nWnEzamZIT3F0TXpJ?=
 =?utf-8?B?L1hnZDhjQzN4UTM2SkRRRU1VVTgvZUcxdnovTnRNM1FpemJPekpZcWd3bEhn?=
 =?utf-8?B?VmdMSDYwaW5SanV6R0pNTFloRTZabTVNRkZYSnlLRVRwUTNkRGRPcFdiTC9I?=
 =?utf-8?B?WmZUT2xVaFFnUlRZa1NJbTRhOFd3KzZod3Z2bEcydHZuV0JMczdsOW9vb3dn?=
 =?utf-8?B?ZmpnUi9qN1oyN29nRDhuTzlGWVduNG1xTnZQcXlpeVl1K1ZCWEcrL1o2WGNU?=
 =?utf-8?B?emFiWE93VnovRG90TnBzamc1bGxnOGZGRHN5a3VlTmx3UUsvU1RLS1ZRYmNF?=
 =?utf-8?B?ejBBQ0Q0akl2ajkxMStzMkJ0dVhsRUNrdDlpUVpQMzkrNmo0eStLbnViUDNB?=
 =?utf-8?B?ek8xdUtLS2RkdWZibUQ0QThWUlJCanowWnpERitoYVZFVGx4cnU5a0c1dHBz?=
 =?utf-8?B?S3JKd3JpOWd4SkZFTlFTTkNtZkxibmphR0JDcUV3RWdOTktndE15UzlxUU5s?=
 =?utf-8?B?bnZzL3d0azF1QzNZOWJHZjE5NUVUVmlrUlQrRys2bXd5akU3ak9RMWhRdVFv?=
 =?utf-8?B?b0ZqWVVxbHpUaHRrUDY0UDlhRVRIeUQ3WUcyUXNzUGVJOFVUbUhDMEVtc2VP?=
 =?utf-8?B?dVdwOFJiSG1QNUpKN2J2c1dBdnYvWFkrVDJsRWlyQ0NwOWtPd3VPb241VVY2?=
 =?utf-8?B?SlpJSEpWVmtEQjdScmxWQWt0MDBGTzFZM0xJdlcwd2JkakptWXN4OXptY1Z3?=
 =?utf-8?B?bGIweWVyMWJmNUFEenVhQklNKzVycHZleXgxSFhQODh5dkZNY1ZmT2VHMjhl?=
 =?utf-8?B?Szk3eDZHNWw1QkNtL25YWWx4dTVQRmwwcnZPTWoxU2hHcW1LRkh1RS95R2FI?=
 =?utf-8?B?azVycXhVUjFVWkJaTWdrRWZZNWY1S0tHd2Y1UVBzV1YvRndWTVB3WmRyYzJH?=
 =?utf-8?B?Z2xJT2FaSDcrRkNJSFJBeEo5QlhJSWMyWlR2VzlBT2EyTm9IM1ExbFNqOFFx?=
 =?utf-8?B?b2FEK1d4NVgyVUl3ZXR5YjdWMncvdmZBM05abFRaNVdqWG96WnQ3R3J4TjBG?=
 =?utf-8?B?N093WkNpUXJVNDlQNGlyVVVQNFdGbStTd1RnVEVjVWNGLzBHd0hRRGtRczlT?=
 =?utf-8?B?OThBV1FUcDdHUFZyUXZOVW0wQnJXd1ExaGYzdVQ1LzhYRUxHTkJYYWFaaWJm?=
 =?utf-8?B?WnY3OXVJL2RmL0dhNC9XS0pISzZPUDFjN3RsVFhCNGRaRWtVMVh5TnBMQXlp?=
 =?utf-8?B?YW82MWc1UTNPUWxuU1VKSG96T3hhZ1RSRjMwbys1RFkzc3dVVWdxQTl3aERG?=
 =?utf-8?B?QTJzay9FYkRSaVFBcHJuOFJ2RnFmWTlRNXVOSCs2bE0yZ2c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7154.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8454B812CBC7B4BB45E101ED5B011FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7341
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:102:207::17];domain=PAXPR08MB7154.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b5e7f5f-b98b-4e39-28bb-08dcb55cd8a0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajNoY0lOMkYxZnkydjIva3hHUDdKNlpSV2lTbnp0YmtvakJON29IYjU3Q21s?=
 =?utf-8?B?ZzV3OUxPR2szZlhON0lBc2YwckNybHNrRENPalhoOWR3NVRXZzJlbER6QWtz?=
 =?utf-8?B?QUdDT2hFTm5GZ1lId3dBYk9HQUpLSTRuYXZjdlFUR2xHbzIycFZTMHMrVXNS?=
 =?utf-8?B?NUdSL2ViK0kxdVBDY0JuOWlvbDArL1c0UjFvRWI4MnRBem9zMnpOWTdHV3VP?=
 =?utf-8?B?Zk43b2U1a3ZBM3VKNmQyQk1KVmdKUXlBR3ZVQnNKbDRNa2ZsQ2RVaCtkdHZo?=
 =?utf-8?B?VGRZZUlmVEJqY3drQnZnZkJ0UHhvRGtDbVUyRFJZazVRS21VVGR1Q01acU85?=
 =?utf-8?B?UCtocWY0VDBLWmU3bUwvSjBsckhhSHB4bTA1NXc3cWtBVkdscXM4Y1lsY3h6?=
 =?utf-8?B?NjdCeE41UlJFZnhRdWZoaVpmT05TRFA2QjE4VG5WZUpONUZ3WURFeGNoZFRm?=
 =?utf-8?B?cEtpMlJYYlBER0d5aWgzOXZiM2M5Y1p0blBKNVkwWDljRzFSTTUvUmZIR0ZX?=
 =?utf-8?B?MktoVkdvZkF4b3VOUVhCK2NDZXI5UElyVTJUUXYvbEE3WkRvMDZ6SWUxSWxG?=
 =?utf-8?B?MlBKclJyUWdlQVFIdHdmRmxLTk5kU29sbE1OK1pFOUlNZThPaDJEcVZUbzVJ?=
 =?utf-8?B?ZWtlbUZ5ZzdRVUxiajhJSFNDeWFDZXBXQzJxalZLMWZhQllDWXpoQ29RMU52?=
 =?utf-8?B?RS9nWnJwTm0xQzBwdnlZL2dzQnlEcnR0alVJSFhINkJyakhGOUs5M3k0UEUr?=
 =?utf-8?B?Z01aLzdpbFR6ZFJCUWNsaFhCa2VoRmVwWnJGU2xuTE05ZDFMKzU2ZXFxTWI4?=
 =?utf-8?B?UXZRczluU011cXpVNmtjaDRRbjJla05iNmdZZ1RqcVFQbDI3TEYrenl6QTh0?=
 =?utf-8?B?cGtqTWRia011R0J6bm1WdXhTbGtJRnVSNVlWUEd1WFNsNThUTmEzTzdocHd3?=
 =?utf-8?B?QS9QbFQzY3gyQmFsbFNvZEFoeFZTbDVyWGJZM0FPaFUwWUs4SzAxR3puc1Va?=
 =?utf-8?B?cDI2QitubmlnWG5iY0hWNEgvc3JFMFdlaUtlcHI2bExCRWd0cGtrSE5WZkZl?=
 =?utf-8?B?cUpHTGZDbzNjNUw4UThCRlcxdE41YmF2QmxOVHUrdzhZK1dpMmtnNUNjZnEz?=
 =?utf-8?B?UTAwcHFFSjFlZXRaM2FkM0hRdklYOVFyUG1ESGFSVHpqeVk1WVRZcStQaTBP?=
 =?utf-8?B?UjRJZzdjZUYvTm8wdkpwNzBZRUh4QmpLRzRxc1VkaURwVjJQMzYrL1dKMjN3?=
 =?utf-8?B?QW55UnBGTjQyTUpDNmFRa1RkUDEyekpjby80U01ZNVU0K3NYVFhLZzJ4WGll?=
 =?utf-8?B?UVl5ZnI4cDVHdHJBOVd5QXBldUIwYzVDeWVXSHovejRlc2tWVklRcEVwcmkz?=
 =?utf-8?B?Mko5clFJUTFiUmU5R1RhbEZ2T1BRdGFHWnNyZ25rYWlmSnJ1SW1qZVMxbjZz?=
 =?utf-8?B?TFBZN1BYN0xELzBHUUFNMnpXZ3RUZ1hSdXZGakk5b2EweGhKWHp5N3c3L3lZ?=
 =?utf-8?B?R2NEZkVEWWhsNVpzaE5sNlNpKzhJbEZFZ0xtS0lCVzJJT3pnYi9hMmxFajJn?=
 =?utf-8?B?dEx3VGlxY0M4Y1lRTDRrN3FwUXluYURuRTRFazdrMnhLVlJRODM1Q3ZDVjFG?=
 =?utf-8?B?c0RFQjMxTFROVkZGbTVYSngxNUFJQUlCZDJnckNOdHQvM2dudnFmT0dIYkJ5?=
 =?utf-8?B?eG1vRjVTbmNQMmdWRjlNeTZhVlhWczZmUU9RQ1FNNjdiOTFpem4yaUhERGlL?=
 =?utf-8?B?eXZja3pENC80U3ZRUi9BU1Z6akl1ZGhWdDFsR25aUFk2U0xVK1RaQmR2Ykc2?=
 =?utf-8?B?elVNby9jdW1ncDNHOEVuNmlUYU1wRWE2Yk85bWFGd2xjUmJDelN2VjdocVB3?=
 =?utf-8?B?ekV1UDkyZkkzVUVxVDIxSk1Rc281NWVrTEZFaWZUdTFZa2M4YWV2Q2VKSld1?=
 =?utf-8?Q?Un/eAlEKTmjIWxeFw65Q27FbloIw1eoz?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 14:42:50.4042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb237345-d31f-4a67-e656-08dcb55ce17d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9611

SGkgU3Rld2FydCwNCg0KPiBPbiAyIEF1ZyAyMDI0LCBhdCA3OjI24oCvUE0sIFN0ZXdhcnQgSGls
ZGVicmFuZCA8U3Rld2FydC5IaWxkZWJyYW5kQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gTm9uLVBD
SSBwbGF0Zm9ybSBkZXZpY2VzIG1heSB1c2UgdGhlIElUUy4gRG9tMCBMaW51eCBkcml2ZXJzIGZv
ciBzdWNoDQo+IGRldmljZXMgYXJlIGZhaWxpbmcgdG8gcmVnaXN0ZXIgSVJRcyBkdWUgdG8gYSBt
aXNzaW5nICNtc2ktY2VsbHMNCj4gcHJvcGVydHkuIEFkZCB0aGUgbWlzc2luZyAjbXNpLWNlbGxz
IHByb3BlcnR5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3
YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFJhaHVsIFNpbmdoIDxyYWh1
bC5zaW5naEBhcm0uY29tPg0KDQpSZWdhcmRzLA0KUmFodWwNCg0KPiAtLS0NCj4gU2VlIExpbnV4
IGRjNGRhZTAwZDgyZiAoIkRvY3M6IGR0OiBhZGQgI21zaS1jZWxscyB0byBHSUN2MyBJVFMgYmlu
ZGluZyIpDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jIHwgNCArKysrDQo+IDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vZ2ljLXYzLWl0cy5jIGIveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPiBpbmRleCA4
YWZjZDk3ODNiYzguLjU1YmVkM2ZlODdkMCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2dp
Yy12My1pdHMuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+IEBAIC05NTEs
NiArOTUxLDEwIEBAIGludCBnaWN2M19pdHNfbWFrZV9od2RvbV9kdF9ub2Rlcyhjb25zdCBzdHJ1
Y3QgZG9tYWluICpkLA0KPiAgICAgICAgIGlmICggcmVzICkNCj4gICAgICAgICAgICAgcmV0dXJu
IHJlczsNCj4gDQo+ICsgICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9jZWxsKGZkdCwgIiNtc2kt
Y2VsbHMiLCAxKTsNCj4gKyAgICAgICAgaWYgKCByZXMgKQ0KPiArICAgICAgICAgICAgcmV0dXJu
IHJlczsNCj4gKw0KPiAgICAgICAgIGlmICggaXRzLT5waGFuZGxlICkNCj4gICAgICAgICB7DQo+
ICAgICAgICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9jZWxsKGZkdCwgInBoYW5kbGUiLCBpdHMt
PnBoYW5kbGUpOw0KPiANCj4gYmFzZS1jb21taXQ6IDk4NGNiMzE2Y2IyN2I1MzcwNGM2MDdlNjQw
YTdkZDI3NjNiODk4YWINCj4gLS0gDQo+IDIuNDUuMg0KPiANCj4gDQoNCg==

