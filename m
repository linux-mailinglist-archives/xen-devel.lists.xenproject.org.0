Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D408BFEC0
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 15:29:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718821.1121355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4hLZ-0000u9-GE; Wed, 08 May 2024 13:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718821.1121355; Wed, 08 May 2024 13:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4hLZ-0000rT-D9; Wed, 08 May 2024 13:28:37 +0000
Received: by outflank-mailman (input) for mailman id 718821;
 Wed, 08 May 2024 13:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=guPL=ML=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4hLX-0000r7-L9
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 13:28:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de491bb3-0d3e-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 15:28:34 +0200 (CEST)
Received: from AM0PR10CA0110.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::27)
 by DB9PR08MB7697.eurprd08.prod.outlook.com (2603:10a6:10:390::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Wed, 8 May
 2024 13:28:28 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::7e) by AM0PR10CA0110.outlook.office365.com
 (2603:10a6:208:e6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Wed, 8 May 2024 13:28:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Wed, 8 May 2024 13:28:27 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315");
 Wed, 08 May 2024 13:28:27 +0000
Received: from fb0a36088b4e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F95F9527-53F6-4C55-BD1F-7AF6C9A6DC49.1; 
 Wed, 08 May 2024 13:28:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb0a36088b4e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 May 2024 13:28:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8804.eurprd08.prod.outlook.com (2603:10a6:20b:5ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 13:28:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 13:28:11 +0000
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
X-Inumbo-ID: de491bb3-0d3e-11ef-909c-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VvK6a8+TDXcEMppnbQzeG7LUrBpw4vq8celIzHam/6GPPXTBF3aqcxD2xgUTFw5g7ncy8l8/2i9YeAcMeoQn0rnLJS2jZE6PdUA/tkCjYoiKJbucb6DTG0LC8a2fxCEAZLkY+zLLShizRdY/AFTFPFHkTymJRqZGXCzfAaAWANgawZ55+GLRnaMsUtCaiSskuhoufkRIaYb2PvqPmYtoERpN+I5204BdKpxObKC7TrmOgX3d+sKmLWIodaOwi8qQVgJkg9EiIPi5zrU19nrZPnlxkmbdd1SoGu0ujYA0ZcYbnvwjmQ4vKPLzHsDVX4Kb8v+l1nACD7gsIKskoggSBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFgVM2Oo/y+HZPz/oTIqTdMyExdgg4M61NzSM1xXVEc=;
 b=b7D9PXdpqDRx6OOJyrnjZ4NThrJBn5rYMZ453eGgojhHPkWUnOIfhvVD4HQeqQCC6fzQDA8LMJ0JguFgeKYK6PI2gI5i9mjEn7eYDRoZqJ+4csimvKxGXf2uHvdGn3JUdWJOEXQuWpMLrifN3XbZlX6y2RfyV+2ylU5BrgUcsEfK1qXIIgSFPFCk62kB8yZnjt9pCheIWII2h67elVe6BplejxKHEOvLnJhu7H3mg+gvw398QZ5WTgF8vebDi0YA0cQPH/GtRpkaKXQMluqjD4HtqOl6NNLtGP+gEQf+cr8UodNnoNts1Eao4meDAOPMSXtD836NgxGm+EzCgroYbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFgVM2Oo/y+HZPz/oTIqTdMyExdgg4M61NzSM1xXVEc=;
 b=mBf1abFGJz14DWzegcfqSUgW/cEUQ5yhP7gYc2egF3B6MbZY5gnhtjJB1ARczTNa0S/EJwzpffg50j3tQrQDsZuy3bHAcJIPhRLs9w/jzWafad1lhnha017zJeGx9z+wgc0c/dryKC20mUCt8W9UqHeRxG9FKCwMm/Zh0H3puKE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09e6c53ee0b268f7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq9Lsz59euS5P99FKTTHnZhsVM018WytIhBtBbwYYIIfdqZkWdm1H8e7yVtr5UKwHbpbM+uR0uKjDvXucLon5FeKn/FJTv2OQGIXVz3V1aIIFpZ3+//Q5n6+YV7kEIdy9Dps0+5I2AzXWrVP9hG67zz9ftZAGfHPpOWldNIHIopgRBM26D/cOCBhOr97w7bp/5jagcUqj/ZRpOIKhtaXkDi2P/vVPPXpDi1luw/h2aq4pGtD0Vp77sfsXLoUdwGemNuFu4RqZIoA17Dww+NkIeWN2MoJtpvnY8MAKFMr34ls1o0ZfEiYe8jSQKlw7oyONlE4GFgDpzjYA20lcfo4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFgVM2Oo/y+HZPz/oTIqTdMyExdgg4M61NzSM1xXVEc=;
 b=G8ZZUJY9+yqM5LKdkJEfW8S5wo/6QPKlorJJN9u1jb3E8kDLaTwy6uJlwsJDP4cM7L/Fw1WAzd89ZRQwoITtUtDmLjsXZ4z+V8uq2UQExBVrrudTRCmqqGeMmC8o46Rl+MprBH+oPGN9ExzqXFmp/x8/3bxf3da4x7Q7LMz/39maidVRggflDeqo4YMBx5JVLpX34akA2E45UEYAEfzh2fQADlADLsAOePY8PhgbX8o/haDlAMUolLuljOkrkHazIa87hpbin7rir8wMgtG5HFpb4GhMiCojj2/HviWMG3/9vuIYaI7yLghjufehBY27xDR/6DtOW6AluYlzZ/ukMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFgVM2Oo/y+HZPz/oTIqTdMyExdgg4M61NzSM1xXVEc=;
 b=mBf1abFGJz14DWzegcfqSUgW/cEUQ5yhP7gYc2egF3B6MbZY5gnhtjJB1ARczTNa0S/EJwzpffg50j3tQrQDsZuy3bHAcJIPhRLs9w/jzWafad1lhnha017zJeGx9z+wgc0c/dryKC20mUCt8W9UqHeRxG9FKCwMm/Zh0H3puKE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/7] xen/arm: Parse xen,shared-mem when host phys address
 is not provided
Thread-Topic: [PATCH 4/7] xen/arm: Parse xen,shared-mem when host phys address
 is not provided
Thread-Index: AQHalVfmskMuPI2TlEqCln/x5OWH6LGNVmgAgAAV/wA=
Date: Wed, 8 May 2024 13:28:11 +0000
Message-ID: <A9708869-7739-4306-8527-1A0978D542FF@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-5-luca.fancellu@arm.com>
 <59b02ed2-e543-4bfd-946e-6a82919c582d@amd.com>
In-Reply-To: <59b02ed2-e543-4bfd-946e-6a82919c582d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8804:EE_|AM3PEPF0000A78E:EE_|DB9PR08MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6d33fa-b1a0-458b-5bdf-08dc6f62beae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QlZmOU11cFpNV09KRkhtbEZMY05oQ2VKOElqeGU1RG5kajkyV2RsMnM0MHIr?=
 =?utf-8?B?NTJYMHlVcHhmcDNVb0ovQ3RyaTUxazY5ZWM1U2UwUjhFelQ5WGJkb3pqbVN2?=
 =?utf-8?B?KzkwdWw4dy9DWUR1bDRyU0RHamdPb0VoYmlKUUJjWXQvQ1Z0Z2ptMkt0dmZ0?=
 =?utf-8?B?Tk1zV3Yyc241R1J3cE00QUVRL01WS242VTROakgzY3p4eTVpWjhUUHZkN1Bh?=
 =?utf-8?B?SmRBSHpTYW9mZjhmTzR5OVk3RkVzNEdpc2JzVUFzZnhPOFRGUE9nVk1WYndq?=
 =?utf-8?B?UkM2RTFOaEk1Ni9nOXA0OUtyMjY3YW1sUlBhdTI5RjB5WXBuRksxUXczTHZF?=
 =?utf-8?B?VlVUbEJBUTV4N0xjM1VtckRTWUZYaW9BYTFZTGJta1VrcGkzU0c3c2pFV3U4?=
 =?utf-8?B?WTFRd1FNQkZLQytiWG50dDVtMGM3Y3RXdE5leDRjYjNiZWRVTW96ZkRrMWk0?=
 =?utf-8?B?OTBDTEFZbGlFc2M2QmtoRXNYZVBvV1VVQllJWEZoc2pkTmVIbW1VYnBZTVRE?=
 =?utf-8?B?VEgrUkpWSkxlOExLbVFBaVJqemFteGs4RUxjR3BIV3JnN3JmRkgySEpRbDFO?=
 =?utf-8?B?b09aTkR3UWVYY1JnTStWaXZYZGlXa0huaU5tWkJiUDJjdEQ0QzZuWE5lNDY5?=
 =?utf-8?B?cGlwWVQwMlBlUlZobkk1WGNGTDdjU2ZmWTV3aW5FWXdVWjhWaXNRNkV5eks0?=
 =?utf-8?B?M3ZjTDlmMkJyb3h5TEtZbXdWRUU5QmR2YkhVd3IzcWozYmsxWEMzNDhpZlpZ?=
 =?utf-8?B?T1VFMGMzdjhYUXVmSVZEWFh4bzN4aW1GTng0SnVrWkt4MzVvdGpKVDdGSWpi?=
 =?utf-8?B?a2ovQVBkSDByQnp3ZkZoZ2pCQjhYdmtKaWdmQzExc0RMTndrazRXdnV4ZlJF?=
 =?utf-8?B?bGo5SEw3SmVyaEVoN0xZY3lnYlpXL1VyNUlBY29qTWFtQWp3Sklac0QxOVFF?=
 =?utf-8?B?cVVlV0N0OHpNd3N0Mm9pN2UxMUJ3VkVzNDd6bnNIZlF4ZG85bTM1S0o5VWpk?=
 =?utf-8?B?cENSRXRHUVpCZjQ0eGtmcThLNVZkZnpEYWtuVnJZSXFuWk9vNEFEKzBWbWRG?=
 =?utf-8?B?bjhKOGlOaXY5TXRrWFVNZWt3RTBmV1dtSUxSUnlRUldwTWlmZExrV3VEYndN?=
 =?utf-8?B?QUIvbUpiSGQvVzJNbkFEQkprSmZsNEVZMTRwa3ZoYm9zMmJKUnVudk81NlV3?=
 =?utf-8?B?Zm1peHJkbHd2RnREMTBVZHNlcmhZRkhHT29tMnU5d3loVWwvdVduSFBaSC9O?=
 =?utf-8?B?bW9XK054Zi92RjZsWnZtTzNYdVNTZ1hCalBEazZPVklJTGxOUkZteDRFendk?=
 =?utf-8?B?c3RRNlhSbWp1OFQySTBVNlQzRURyQ1ZoQmxQYTJBREZQUlkvSkcxODdyek9s?=
 =?utf-8?B?eGxNUkRYOXhXbkhHQTExUlFPVHc3bzFEcFhERm1wTnZITXkyalZwMVF6NFdq?=
 =?utf-8?B?ZUdsbUU5TGNHejFGUngxaUtubi9GRmVjUTlvOFdCNFZJYWhLSWVOZm1GclRM?=
 =?utf-8?B?Y014eUUwcnRBYVZ4aEc4alA2RXcrNlcxYXY3NEdub3N4bDRUYXZTb0wwM294?=
 =?utf-8?B?OERzbHRXMTdjQjBMdUJUeFlaeDYwNTlCc1ZyVStZWU5zdEdFSGozV2pGSGVV?=
 =?utf-8?B?TCtPMk82MmthL1ErNk8zeGh2YTFsNEl5SnpGcG1mUis1ek1sREsyMU9INEFv?=
 =?utf-8?B?R1dBemRuTlFvRElmTzV2YnU5ZUI5NENNN2VMa0hyL0traXNEOFpvanpVMVph?=
 =?utf-8?B?dU5Ta3dkQmVQbnk3TUZRNVdiaGNSMmZIeU1rZFBJMUhWYVpOcU5HUzBrUkhG?=
 =?utf-8?B?eE1RUHNOdGhvcG1xcm9TUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB98CCD80B3929468311EC7AC7ADA1DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8804
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9bd4288-bd05-426a-4321-08dc6f62b533
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|35042699013|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjhCejFsTGNXLzZVZ3RVNjl2TjdMdzJxTjcwakkvSGJNdk8zd1lyNTVDTE93?=
 =?utf-8?B?U3VxRldHZmEyR0wrbjlEeERkNW96Q3V6cy9zb2N2QVdRNHh3ZVRFTWE4Zjds?=
 =?utf-8?B?cExkRGhGMmlYYm4yNit2WWNCb2dqZXlTWHFnNFpTdXlJZjJyUWNLaGdMbXVB?=
 =?utf-8?B?LzhaKy9Mam0zSGVQUWROcmRsNmoxM3VuWmtZVWs5em1WNTBvbFRBT2RjOW5B?=
 =?utf-8?B?c1JEclo0enE2Mk1LTFgvWjhSLzArVE15OFdWK0JDbEcyT1NXRldOY3Z4Uk9t?=
 =?utf-8?B?am5pUFJsYlgydDBHY1ROQXZGZS9yOG5lZzRwL2oxa1pHZ1pFMlV1U0YyRWdj?=
 =?utf-8?B?YVlRUFE5bUg5VytsSkQwT3owWGZaT3k4bjVUaDJ3MG1qcHlLMEw0L1lRZWZR?=
 =?utf-8?B?ajdBNlZjTUx4dFMxQ1JTTUFkQXNUemJUc2VaNTNtWmduZDEyWHV3aFUyMTVC?=
 =?utf-8?B?Z0l5OVA3UFN1ZU9sY3NOYVRTcENVVzZhdXVwUk9ZRlFaM2pRMExkQllIaTBl?=
 =?utf-8?B?REFDSVpZUUhHemhzWWoxSXNoeStKNmJ2YXBKZEVaL1lhOEgwVHZ1UHp6NXJt?=
 =?utf-8?B?R1B2VzE3cjB6OThIZGZqSG1nNVNhNmFJMFNhWTNrZFA5NDNLNnM1VmgrMkxi?=
 =?utf-8?B?Yzh6Q2JiczR5bGhmZThKcks5WVR5Q000Z0RtM05zWWRicjU2TWQ2Y2NJUzhE?=
 =?utf-8?B?eWhxRzJ5Zk8zVVJzS3dmNElia0JpRTJKR2RqODgvQkRiWlhnVXkrSVJQUjRG?=
 =?utf-8?B?bVR5RjUyZDB0aGpQT0h5bW5EWXM5MEFWZlEwQUN2TmcxMjJiSE1YZ3c4K3gy?=
 =?utf-8?B?czlXN0JMM002bk1TVnB6dmlnZmJLTXJZdEh0WTlsaVlBMlhzK2NtR1JWM0Jn?=
 =?utf-8?B?OW00ek50Ulp3ZVkxU2lGa2QvbVNpUHQydVAzU1pPaGQzc1pBZkRXYTJqZ0t1?=
 =?utf-8?B?RUpiVURkaU5qVzRTK0J2OGVFSld3NWVaN0wzL05JV0tDVzFWR0tmcVd2N3FF?=
 =?utf-8?B?YUVwUlVNR2JuNkdKVGxxM3BkbDRsempITWFkS2Z6bS8rdEtqd0NRSEpnemxG?=
 =?utf-8?B?Z3d5UnZKWmFjcVVXUVdkblMvVk5pR010cnloMU51dTdHV0JObDFwZFArZVh0?=
 =?utf-8?B?SFBENVorUEV6eEkySWhXd0JYeXR5eXdjMGNxbEtVYStSTDBKZkN4eDljblJz?=
 =?utf-8?B?blN1MmdqdzhlY3hZRk4veUpVTDB6aFdtWVBuV0M3aEtoTmdjSTBDSFVvNlpM?=
 =?utf-8?B?QmxLUEJmVy8vMnVzbVAwQ2dmYW1ZVEhBakRML0VxK0QvU0JuRXFDZ2tTakp5?=
 =?utf-8?B?d1JQZFdQVE9kNGZjbUsrUWNXeFIrSjlrWm91akhiaTdOUkJwV0tKYlAreEIr?=
 =?utf-8?B?MGx5TmxXVm5ZZlZvTHh5WUJSR3p4ZUNwZXNVREtQaU5wZm10OFhIMTJpc3Rv?=
 =?utf-8?B?WGVLRlJ3YWlFRXZhcWhLTzUxcVMxVldHK2tneHlCNlFHMldYMDdFeml2c0ZT?=
 =?utf-8?B?TW9UTEprVlRWNlAvbnE0Zmp5cnJsaUxTeG5EYzFHS2s1cUtWTEtLV25nZWUr?=
 =?utf-8?B?Y280K2hkbENiVUN5SUx1V0FjZ252Q2syRmdVUWdLbnNpU3ZNSEUwRGJobGh2?=
 =?utf-8?B?TVI1M1BNNnB0NDZObzBZamhDRDV2NldaY3ROV0gxTk9JZm12V1dCL2s1T2VQ?=
 =?utf-8?B?Ly9aZXduME50V0pOUWc5RnJaMWxwVzluM1p1ZGhiRjF3aFBieE42U1c3WXRL?=
 =?utf-8?B?UmJGazg0cGppWjdSdU9LNU1TMmFPMGZmeERseXhJUjZBWldSNWVTdWdkWHow?=
 =?utf-8?B?V0kxMS9kKzlMWTl5Q3Ayc2xJUk9sakVmZzA2U05ORUt3QWpUeWVOdis5M0pH?=
 =?utf-8?Q?NTrnwcRAp6+Ps?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(35042699013)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 13:28:27.5718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6d33fa-b1a0-458b-5bdf-08dc6f62beae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7697

SGkgTWljaGFsLA0KDQo+IE9uIDggTWF5IDIwMjQsIGF0IDEzOjA5LCBNaWNoYWwgT3J6ZWwgPG1p
Y2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMy8w
NC8yMDI0IDEwOjI1LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IEhhbmRsZSB0
aGUgcGFyc2luZyBvZiB0aGUgJ3hlbixzaGFyZWQtbWVtJyBwcm9wZXJ0eSB3aGVuIHRoZSBob3N0
IHBoeXNpY2FsDQo+PiBhZGRyZXNzIGlzIG5vdCBwcm92aWRlZCwgdGhpcyBjb21taXQgaXMgaW50
cm9kdWNpbmcgdGhlIGxvZ2ljIHRvIHBhcnNlIGl0LA0KPj4gYnV0IHRoZSBmdW5jdGlvbmFsaXR5
IGlzIHN0aWxsIG5vdCBpbXBsZW1lbnRlZCBhbmQgd2lsbCBiZSBwYXJ0IG9mIGZ1dHVyZQ0KPj4g
Y29tbWl0cy4NCj4+IA0KPj4gUmV3b3JrIHRoZSBsb2dpYyBpbnNpZGUgcHJvY2Vzc19zaG1fbm9k
ZSB0byBjaGVjayB0aGUgc2htX2lkIGJlZm9yZSBkb2luZw0KPj4gdGhlIG90aGVyIGNoZWNrcywg
YmVjYXVzZSBpdCBlYXNlIHRoZSBsb2dpYyBpdHNlbGYsIGFkZCBtb3JlIGNvbW1lbnQgb24NCj4+
IHRoZSBsb2dpYy4NCj4+IE5vdyB3aGVuIHRoZSBob3N0IHBoeXNpY2FsIGFkZHJlc3MgaXMgbm90
IHByb3ZpZGVkLCB0aGUgdmFsdWUNCj4+IElOVkFMSURfUEFERFIgaXMgY2hvc2VuIHRvIHNpZ25h
bCB0aGlzIGNvbmRpdGlvbiBhbmQgaXQgaXMgc3RvcmVkIGFzDQo+PiBzdGFydCBvZiB0aGUgYmFu
aywgZHVlIHRvIHRoYXQgY2hhbmdlIGFsc28gZWFybHlfcHJpbnRfaW5mb19zaG1lbSBhbmQNCj4+
IGluaXRfc2hhcmVkbWVtX3BhZ2VzIGFyZSBjaGFuZ2VkLCB0byBkb24ndCBoYW5kbGUgYmFua3Mg
d2l0aCBzdGFydCBlcXVhbA0KPj4gdG8gSU5WQUxJRF9QQUREUi4NCj4+IA0KPj4gQW5vdGhlciBj
aGFuZ2UgaXMgZG9uZSBpbnNpZGUgbWVtaW5mb19vdmVybGFwX2NoZWNrLCB0byBza2lwIGJhbmtz
IHRoYXQNCj4+IGFyZSBzdGFydGluZyB3aXRoIHRoZSBzdGFydCBhZGRyZXNzIElOVkFMSURfUEFE
RFIsIHRoYXQgZnVuY3Rpb24gaXMgdXNlZA0KPj4gdG8gY2hlY2sgYmFua3MgZnJvbSByZXNlcnZl
ZCBtZW1vcnkgYW5kIEFDUEkgYW5kIGl0J3MgdW5saWtlbHkgZm9yIHRoZXNlDQo+IGFsc28gZnJv
bSBzaG1lbQ0KPiANCj4+IGJhbmsgdG8gaGF2ZSB0aGUgc3RhcnQgYWRkcmVzcyBhcyBJTlZBTElE
X1BBRERSLiBUaGUgY2hhbmdlIGhvbGRzDQo+PiBiZWNhdXNlIG9mIHRoaXMgY29uc2lkZXJhdGlv
bi4NCj4gT24gYXJtNjQgYW5kIExQQUUgYXJtMzIgd2UgZG9uJ3QgaGF2ZSB0aGlzIHByb2JsZW0u
IEluIHRoZW9yeSB3ZSBjb3VsZCBoYXZlIGEgYmFuaw0KPiBzdGFydGluZyBhdCBJTlZBTElEX1BB
RERSIGlmIFBBIHJhbmdlIHdhcyAzMmJpdCBidXQgYXMgdGhlIGNvbW1lbnQgYWJvdmUgdGhlIGZ1
bmN0aW9uIHN0YXRlcywNCj4gd3JhcHBpbmcgYXJvdW5kIGlzIG5vdCBoYW5kbGVkLiBZb3UgbWln
aHQgd2FudCB0byB1c2UgaXQgYXMgYSBqdXN0aWZpY2F0aW9uIHRvIGJlIGNsZWFyLg0KDQpTdXJl
LCBJ4oCZbGwgcmVwaHJhc2UgaXQsIGlzIGl0IG9rIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoNClsu
Li5dDQpBbm90aGVyIGNoYW5nZSBpcyBkb25lIGluc2lkZSBtZW1pbmZvX292ZXJsYXBfY2hlY2ss
IHRvIHNraXAgYmFua3MgdGhhdA0KYXJlIHN0YXJ0aW5nIHdpdGggdGhlIHN0YXJ0IGFkZHJlc3Mg
SU5WQUxJRF9QQUREUiwgdGhhdCBmdW5jdGlvbiBpcyB1c2VkDQp0byBjaGVjayBiYW5rcyBmcm9t
IHJlc2VydmVkIG1lbW9yeSwgc2hhcmVkIG1lbW9yeSBhbmQgQUNQSSBhbmQgc2luY2UNCnRoZSBj
b21tZW50IGFib3ZlIHRoZSBmdW5jdGlvbiBzdGF0ZXMgdGhhdCB3cmFwcGluZyBhcm91bmQgaXMg
bm90IGhhbmRsZWQsDQppdOKAmXMgdW5saWtlbHkgZm9yIHRoZXNlIGJhbmsgdG8gaGF2ZSB0aGUg
c3RhcnQgYWRkcmVzcyBhcyBJTlZBTElEX1BBRERSLg0KVGhlIGNoYW5nZSBob2xkcyBiZWNhdXNl
IG9mIHRoaXMgY29uc2lkZXJhdGlvbi4NCg0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3N0YXRpYy1zaG1lbS5jIGIveGVuL2FyY2gvYXJtL3N0YXRpYy1zaG1lbS5jDQo+PiBpbmRl
eCAyNGU0MDQ5NWE0ODEuLjFjMDNiYjdmMTg4MiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9zdGF0aWMtc2htZW0uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3N0YXRpYy1zaG1lbS5jDQo+
PiBAQCAtMjY0LDYgKzI2NCwxMiBAQCBpbnQgX19pbml0IHByb2Nlc3Nfc2htKHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiAgICAgICAgIHBiYXNlID0gYm9v
dF9zaG1fYmFuay0+c3RhcnQ7DQo+PiAgICAgICAgIHBzaXplID0gYm9vdF9zaG1fYmFuay0+c2l6
ZTsNCj4+IA0KPj4gKyAgICAgICAgaWYgKCBJTlZBTElEX1BBRERSID09IHBiYXNlICkNCj4+ICsg
ICAgICAgIHsNCj4+ICsgICAgICAgICAgICBwcmludGsoIiVwZDogaG9zdCBwaHlzaWNhbCBhZGRy
ZXNzIG11c3QgYmUgY2hvc2VuIGJ5IHVzZXJzIGF0IHRoZSBtb21lbnQuIiwgZCk7DQo+IFRoZSBk
b3QgYXQgdGhlIGVuZCBpcyBub3QgbmVlZGVkLg0KV2lsbCBmaXgNCg0KDQo+PiANCj4+IC0gICAg
ZW5kID0gcGFkZHIgKyBzaXplOw0KPj4gLSAgICBpZiAoIGVuZCA8PSBwYWRkciApDQo+PiAtICAg
IHsNCj4+IC0gICAgICAgIHByaW50aygiZmR0OiBzdGF0aWMgc2hhcmVkIG1lbW9yeSByZWdpb24g
JXMgb3ZlcmZsb3dcbiIsIHNobV9pZCk7DQo+PiAtICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+
IC0gICAgfQ0KPj4gLQ0KPj4gICAgIGZvciAoIGkgPSAwOyBpIDwgbWVtLT5ucl9iYW5rczsgaSsr
ICkNCj4+ICAgICB7DQo+PiAgICAgICAgIC8qDQo+PiAgICAgICAgICAqIE1lZXQgdGhlIGZvbGxv
d2luZyBjaGVjazoNCj4+ICsgICAgICAgICAqIHdoZW4gaG9zdCBhZGRyZXNzIGlzIHByb3ZpZGVk
Og0KPiAtIHdoZW4gd291bGQgcmVhZCBiZXR0ZXINCk9rIEnigJlsbCB1c2UgaHlwaGVuIGluc3Rl
YWQgb2Ygc3RhciwgaGVyZSBhbmQgYmVsb3cNCg0KPiANCj4+ICAgICAgICAgICogMSkgVGhlIHNo
bSBJRCBtYXRjaGVzIGFuZCB0aGUgcmVnaW9uIGV4YWN0bHkgbWF0Y2gNCj4+ICAgICAgICAgICog
MikgVGhlIHNobSBJRCBkb2Vzbid0IG1hdGNoIGFuZCB0aGUgcmVnaW9uIGRvZXNuJ3Qgb3Zlcmxh
cA0KPj4gICAgICAgICAgKiB3aXRoIGFuIGV4aXN0aW5nIG9uZQ0KPj4gKyAgICAgICAgICogd2hl
biBob3N0IGFkZHJlc3MgaXMgbm90IHByb3ZpZGVkOg0KPj4gKyAgICAgICAgICogMSkgVGhlIHNo
bSBJRCBtYXRjaGVzIGFuZCB0aGUgcmVnaW9uIHNpemUgZXhhY3RseSBtYXRjaA0KPj4gICAgICAg
ICAgKi8NCj4+IC0gICAgICAgIGlmICggcGFkZHIgPT0gbWVtLT5iYW5rW2ldLnN0YXJ0ICYmIHNp
emUgPT0gbWVtLT5iYW5rW2ldLnNpemUgKQ0KPj4gKyAgICAgICAgYm9vbCBwYWRkcl9hc3NpZ25l
ZCA9IElOVkFMSURfUEFERFIgPT0gcGFkZHI7DQo+IHBhcmVudGhlc2lzIGFyb3VuZCBJTlZBTElE
X1BBRERSID09IHBhZGRyDQpPaw0KDQo+IA0KPj4gKyAgICAgICAgYm9vbCBzaG1faWRfbWF0Y2gg
PSBzdHJuY21wKHNobV9pZCwgc2htZW1fZXh0cmFbaV0uc2htX2lkLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIE1BWF9TSE1fSURfTEVOR1RIKSA9PSAwOw0KPiB3aHkg
bm90IGlmICggc3RybmNtcC4uLiBnaXZlbiBubyBvdGhlciB1c2Ugb2YgdGhpcyB2YXJpYWJsZSBv
dGhlciB0aGFuIHRoZSBvbmUgYmVsb3c/DQoNClllYWggSSB0aGluayBpbiBzb21lIHByZXZpb3Vz
IHJld29yayBJIHdhcyB1c2luZyBtdWx0aXBsZSB0aW1lcyBhbmQgdGhlbiBJIGZvcmdvdCB0bw0K
Y2hhbmdlIGhlcmUsIEnigJlsbCBmaXgNCg0KPiANCj4+ICsgICAgICAgIGlmICggc2htX2lkX21h
dGNoICkNCj4+ICAgICAgICAgew0KPj4gLSAgICAgICAgICAgIGlmICggc3RybmNtcChzaG1faWQs
IHNobWVtX2V4dHJhW2ldLnNobV9pZCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgTUFY
X1NITV9JRF9MRU5HVEgpID09IDAgICkNCj4+ICsgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAg
ICAgICAqIFJlZ2lvbnMgaGF2ZSBzYW1lIHNobV9pZCAoY2FzZXMpOg0KPj4gKyAgICAgICAgICAg
ICAqIDEpIHBoeXNpY2FsIGhvc3QgYWRkcmVzcyBpcyBzdXBwbGllZDoNCj4+ICsgICAgICAgICAg
ICAgKiAgICAtIE9LOiAgIHBhZGRyIGlzIGVxdWFsIGFuZCBzaXplIGlzIGVxdWFsIChzYW1lIHJl
Z2lvbikNCj4+ICsgICAgICAgICAgICAgKiAgICAtIEZhaWw6IHBhZGRyIGRvZXNuJ3QgbWF0Y2gg
b3Igc2l6ZSBkb2Vzbid0IG1hdGNoICh0aGVyZQ0KPj4gKyAgICAgICAgICAgICAqICAgICAgICAg
ICAgY2Fubm90IGV4aXN0cyB0d28gc2htZW0gcmVnaW9ucyB3aXRoIHNhbWUgc2htX2lkKQ0KPj4g
KyAgICAgICAgICAgICAqIDIpIHBoeXNpY2FsIGhvc3QgYWRkcmVzcyBpcyBOT1Qgc3VwcGxpZWQ6
DQo+PiArICAgICAgICAgICAgICogICAgLSBPSzogICBzaXplIGlzIGVxdWFsIChzYW1lIHJlZ2lv
bikNCj4+ICsgICAgICAgICAgICAgKiAgICAtIEZhaWw6IHNpemUgaXMgbm90IGVxdWFsIChzYW1l
IHNobV9pZCBtdXN0IGlkZW50aWZ5IG9ubHkgb25lDQo+PiArICAgICAgICAgICAgICogICAgICAg
ICAgICByZWdpb24sIHRoZXJlIGNhbid0IGJlIHR3byBkaWZmZXJlbnQgcmVnaW9ucyB3aXRoIHNh
bWUNCj4+ICsgICAgICAgICAgICAgKiAgICAgICAgICAgIHNobV9pZCkNCj4+ICsgICAgICAgICAg
ICAgKi8NCj4+ICsgICAgICAgICAgICBib29sIHN0YXJ0X21hdGNoID0gcGFkZHJfYXNzaWduZWQg
PyAocGFkZHIgPT0gbWVtLT5iYW5rW2ldLnN0YXJ0KSA6DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZTsNCj4+ICsNCj4+ICsgICAgICAgICAg
ICBpZiAoIHN0YXJ0X21hdGNoICYmIHNpemUgPT0gbWVtLT5iYW5rW2ldLnNpemUgKQ0KPj4gICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPj4gICAgICAgICAgICAgZWxzZQ0KPj4gICAgICAgICAgICAg
ew0KPj4gLSAgICAgICAgICAgICAgICBwcmludGsoImZkdDogeGVuLHNobS1pZCAlcyBkb2VzIG5v
dCBtYXRjaCBmb3IgYWxsIHRoZSBub2RlcyB1c2luZyB0aGUgc2FtZSByZWdpb24uXG4iLA0KPj4g
KyAgICAgICAgICAgICAgICBwcmludGsoImZkdDogZGlmZmVyZW50IHNoYXJlZCBtZW1vcnkgcmVn
aW9uIGNvdWxkIG5vdCBzaGFyZSB0aGUgc2FtZSBzaG0gSUQgJXNcbiIsDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgIHNobV9pZCk7DQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+PiAgICAgICAgICAgICB9DQo+PiAgICAgICAgIH0NCj4+IC0gICAgICAgIGVsc2UgaWYgKCBz
dHJuY21wKHNobV9pZCwgc2htZW1fZXh0cmFbaV0uc2htX2lkLA0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgTUFYX1NITV9JRF9MRU5HVEgpICE9IDAgKQ0KPj4gLSAgICAgICAgICAgIGNv
bnRpbnVlOw0KPj4gICAgICAgICBlbHNlDQo+PiAgICAgICAgIHsNCj4gVGhlcmUgaXMgbm8gbmVl
ZCBmb3IgdGhpcyBlbHNlIGFuZCBlbnRpcmUgYmxvY2sgZ2l2ZW4gdGhhdCB0aGUgYmxvY2sgd2l0
aGluIGlmIGVpdGhlciBjYWxscyBicmVhayBvciByZXR1cm4NCg0KVGhlcmUgd2FzIGEgTUlTUkEg
ZGlzY3Vzc2lvbiBhYm91dCBlbHNlIGF0IHRoZSBlbmQgb2YgaWYgLi4uIGVsc2UgaWYgLi4uIChS
MTUuNykgYW5kIEkgZG9u4oCZdCByZW1lbWJlcg0KdGhlIG91dGNvbWUNCj4+IA0KPj4gQEAgLTU4
OCwxMyArNjM3LDE2IEBAIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm9fc2htZW0odm9pZCkN
Cj4+IHsNCj4+ICAgICBjb25zdCBzdHJ1Y3QgbWVtYmFua3MgKnNobWVtID0gYm9vdGluZm9fZ2V0
X3NobWVtKCk7DQo+PiAgICAgdW5zaWduZWQgaW50IGJhbms7DQo+PiArICAgIHVuc2lnbmVkIGlu
dCBwcmludGVkID0gMDsNCj4+IA0KPj4gICAgIGZvciAoIGJhbmsgPSAwOyBiYW5rIDwgc2htZW0t
Pm5yX2JhbmtzOyBiYW5rKysgKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICBwcmludGsoIiBTSE1F
TVsldV06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsIGJhbmssDQo+PiAtICAgICAgICAg
ICAgICAgc2htZW0tPmJhbmtbYmFua10uc3RhcnQsDQo+PiAtICAgICAgICAgICAgICAgc2htZW0t
PmJhbmtbYmFua10uc3RhcnQgKyBzaG1lbS0+YmFua1tiYW5rXS5zaXplIC0gMSk7DQo+PiAtICAg
IH0NCj4+ICsgICAgICAgIGlmICggc2htZW0tPmJhbmtbYmFua10uc3RhcnQgIT0gSU5WQUxJRF9Q
QUREUiApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcHJpbnRrKCIgU0hNRU1bJXVd
OiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLCBwcmludGVkLA0KPj4gKyAgICAgICAgICAg
ICAgICBzaG1lbS0+YmFua1tiYW5rXS5zdGFydCwNCj4+ICsgICAgICAgICAgICAgICAgc2htZW0t
PmJhbmtbYmFua10uc3RhcnQgKyBzaG1lbS0+YmFua1tiYW5rXS5zaXplIC0gMSk7DQo+PiArICAg
ICAgICAgICAgcHJpbnRlZCsrOw0KPiBOSVQ6IHlvdSBjb3VsZCBpbml0aWFsaXplIGFuZCBpbmNy
ZW1lbnQgaXQgYXMgcGFydCBvZiB0aGUgZm9yIGxvb3ANClN1cmUsIEnigJlsbCBkbw0KDQo=

