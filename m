Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F78CC269
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727691.1132309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mKE-0004OV-3d; Wed, 22 May 2024 13:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727691.1132309; Wed, 22 May 2024 13:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mKE-0004Mw-0N; Wed, 22 May 2024 13:48:14 +0000
Received: by outflank-mailman (input) for mailman id 727691;
 Wed, 22 May 2024 13:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfTZ=MZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s9mKC-00036q-Dk
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:48:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed72933b-1841-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:48:11 +0200 (CEST)
Received: from AS4P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::14)
 by DB5PR08MB10213.eurprd08.prod.outlook.com (2603:10a6:10:48d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 13:48:06 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::91) by AS4P192CA0029.outlook.office365.com
 (2603:10a6:20b:5e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34 via Frontend
 Transport; Wed, 22 May 2024 13:48:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Wed, 22 May 2024 13:48:06 +0000
Received: ("Tessian outbound 57d5075de207:v327");
 Wed, 22 May 2024 13:48:05 +0000
Received: from 3b5107f893e7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A68587BA-DEE6-4534-9782-EC73DB0329ED.1; 
 Wed, 22 May 2024 13:47:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b5107f893e7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 May 2024 13:47:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS1PR08MB7540.eurprd08.prod.outlook.com (2603:10a6:20b:470::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 13:47:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 13:47:57 +0000
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
X-Inumbo-ID: ed72933b-1841-11ef-90a0-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DQPuuRPtwgizhbR2BXWi5OzM1s/TQohkzRG8+prfvZhqJpyoGohT0KP5GplrS7MQx3S9+bO5s5qbx7am9yUL6CT+agaXpRY/+hHxuPvpvvicLefJn15icuW7MQXIazx7gJ2VwOks7/MJcN/54ILx7y1CcumomNouP4hvq6dJ1RpMwBxsUA8M3TNTMzeohAWISxq45RVesLrRTwLHHTPMlB1UoYbz62ssV+8c0XRRkxVOx9GwK7K8Oq7NNbZWzlewtSoHRXZvOwUzqY31E6+uWzTmM3dr1NHZQBRXbl6Xh6qUV046jG8+BYEhJHvRmGPn6A1fLxiIA5rLvbHIdJpXig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8inm99bsJSwaZum7vHP1UHCxY0hjtJOUxkxPN83wO1w=;
 b=ZNASMT/IpPsKZ63b0ikjcVQur3IVupzfcFWY3GiugcyHMzAjAVwxm6y0spAiP677Tb3XkQp2pSkFAVnAuVOF2W0tLPOv8hLIsgKnamf4lYjwzARhx8Hk0PVnkAYeDLqZJYjI5ugDLgDGh4us6/xHWwJTUwyOZ1gpeoz04qk7hX2Ws3Gp1WzMEE4ILaQ7x+SpIIREL9UxfVPsObKCez3BQVTpvvxpEHA+I5gCYcE/2hVfbmi+EosNDAeNMTzklkIDTqD3YzxoGUAzWhgTLsaZul/FUK/pLO9CP9rEhF+qDpS+fAaix4pq7KLeSnzVNKYUCp4/UrjdCMlpio5446sDFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8inm99bsJSwaZum7vHP1UHCxY0hjtJOUxkxPN83wO1w=;
 b=EM0fVuEg9rQY9nn6wES150KRMpAryqbMTT+L41jOe4PMN+Hot8LrINI/5MrIR05gNCiNtmhRMayAj2ns8xqnvDAfcGQbABG70BGDwAT5iTicKukW3LPDGaKJhBOnj0KOL8Vh6K6TjTFJDt/hqaXYLdv1lnlPYW9OVcL/a9Jv7X0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5cf9bc6dca38adb6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxKwuGKbSUbpyFbjjzEdb3zomNruKfNVn0ctO0yS8TDi9r7seSo+c7kjnHN2hwv30ZEND5VnPyFYu3w9Nf6Okri97Xdw/5DI+88G4RzlKywB1gmFZdE45RolNSElwMCwN147+VhOy8lh9Oml7QjTS8XUPBjO9HEMRESMhpBQ7LU5lbLYLQAnX0vHI3HoMnPK1PmDfU1XW5va+gIa+jzHL3EWh/Lxu6YybCAQtTxXFmu1WHMPmq3B2/HlZu7WE9L9GIB4tHjmBgqShIDiDSxPVCbKucqdQlMf+YySniJSDTuyzNZJy+6y892IZCnWDQ47wFld6hVb8YBTohzAjrskww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8inm99bsJSwaZum7vHP1UHCxY0hjtJOUxkxPN83wO1w=;
 b=b0cnezilGMBVWZKYFS8PukRDrerUqiyZ3reU/uGiIntBIV3R21BgH2LD/awh5vqh/1NuA9Idxmm+wuFXMpgG/EYHTu0KHCpJcqNy/YXCyREhrSVGnJp6+y1XbmB98+1FL5zKA6usoyiGqVeANsbD+FMjMoVCr3tYQ1bqaABH6AhudqYuMHlmu4nU8o9Hxcp3x6vBRUE74OtvacFfjd9pbdjXMoEc+olHj9O4lieAYbr4LJ//SZ3BC6HOnS+9QIJbvuO4ACiH+Spqdtf51sjWADwC5COEeTgn4+eYouv/PIdwt0Al7+E5VK05PkFTanGVVvY03L2KBmyqz+BbDC71Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8inm99bsJSwaZum7vHP1UHCxY0hjtJOUxkxPN83wO1w=;
 b=EM0fVuEg9rQY9nn6wES150KRMpAryqbMTT+L41jOe4PMN+Hot8LrINI/5MrIR05gNCiNtmhRMayAj2ns8xqnvDAfcGQbABG70BGDwAT5iTicKukW3LPDGaKJhBOnj0KOL8Vh6K6TjTFJDt/hqaXYLdv1lnlPYW9OVcL/a9Jv7X0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/p2m: put reference for level 2 superpage
Thread-Topic: [PATCH v3 3/7] xen/p2m: put reference for level 2 superpage
Thread-Index: AQHarBz8P+fwY/NKMEm727VASI/i97GjPugAgAAGHgA=
Date: Wed, 22 May 2024 13:47:57 +0000
Message-ID: <CD6149B6-EC9C-4313-AA21-F0F0156A9E1C@arm.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
 <20240522075151.3373899-4-luca.fancellu@arm.com>
 <c10b2513-b0f1-4042-a538-2115e92408d1@xen.org>
In-Reply-To: <c10b2513-b0f1-4042-a538-2115e92408d1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS1PR08MB7540:EE_|AM3PEPF0000A79C:EE_|DB5PR08MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: c891ddab-30a0-4429-2d7d-08dc7a65cee8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NUYzc3JQQVFFUkdFeG9NS3VQaFB5aVhlV2swOFhZczZCeU4yMlFmYXFSYXMz?=
 =?utf-8?B?Z3BKZUI2WGJlVm03M0xGZ0R3ZlBuYTR3L2NMVGN3VUF3Uk5VMjYrR09sZ0tU?=
 =?utf-8?B?R0Y4VjVlYUZISXpMUGd1Wkd2WmFwazJiNzByc1pudHFIWHNsSU1JaFp0dGVh?=
 =?utf-8?B?UFRsY0NpbDBQMVZOWmRDbkpGeFFnZkhUQjJpeTYxQ2xyTU9EQmZPVTdLem42?=
 =?utf-8?B?KzdNNlpFcVRRbFErYWFEWldiZUc4bGZ1L2YzRW1xMHVid1VxZ2pFenRna0Fp?=
 =?utf-8?B?OG5MUDEwSVZwMFRsVzgxSHBES2JQcVhad2xtci9SV0pBYWdZZE0wb1I0SGE4?=
 =?utf-8?B?Y0lMdS9vb05EdzF0OXp5Z0xiU3MvWGJkNjRNcmVhSlQwWmNiRG40T3lpQTlp?=
 =?utf-8?B?bDFnanFqWlNPVWtNMFFnTUtMcHBVWW1KaGxCUGwwaUNzV3VoTXZwNEFiL3Zo?=
 =?utf-8?B?a0JwZVI5d09oWGRQaWVyYTFNcEtMNllKTVYxcVIxcUlTTFFlWnBvVEZtRS82?=
 =?utf-8?B?WEh5aC9YR2FOZFh5Ym1IdTJhRzQ5V0JhZk1TeC9Rc1pWR3JNWVVRNUliYW5S?=
 =?utf-8?B?U2orTjhwUkVGSG9nNWErSnl0RUYrazV6RjFCallVaXJuREFDTWwydmNibHU0?=
 =?utf-8?B?WDJZekVUZzJ6UCtuenA1NUg0YzFiclFIYVdoL1FIM3gzUG1hTHNFd0FsZndX?=
 =?utf-8?B?QkNkZlpxZk5RUHhrWFJRb1hGUmNkdkVZWkE5SkJlWlVvWU9YaVdXdm1DbHJT?=
 =?utf-8?B?dEhYNGRrM215bDBpWis4T3V0ZGN5U0FsVkh5TXladWIrVVFqZHptbDY5d1Zv?=
 =?utf-8?B?aklqK0NNMGRoLzZDR0k1N0MvR0VvYWcvanNMQS9KbVB5L1dNeUh3T3MyZ1Uw?=
 =?utf-8?B?V1BGNll1STRQSlhWMy82NHRraG9wWE9Od2V6bFdkYkhqdklqdXN5TmtlM0hE?=
 =?utf-8?B?NDhMK2l3eks2Z3d1TjlZQm5ZV0NLR01qR1k0MkVTQzdXU3NHZHJtdjBGR2wr?=
 =?utf-8?B?dkMrRitpMHd6UGYzVUVJNk9HRm81ZUVLc055NmdOMEc0aVNUS1d3d2VZd2ZZ?=
 =?utf-8?B?RjdUR1BJazVTM3dDdTZMUmx6c1RaNHBpSVNzWENkN1I5WjhXU1RjQ3pYMmhy?=
 =?utf-8?B?WW54K1RiRktSNlkzUkN1RkdRSG5tZFVOWmlDNUcrUjlldVFTMzJUODduU0Zw?=
 =?utf-8?B?TFU0cWdxYTZYczcxMld2OXdibm5rak10NkdsS1hzeDB0NGxCS2RsNzh3RTRy?=
 =?utf-8?B?dkxZOHZyOE9BbEJaakgrd3ZKUUI4SDNIRVJuVGZoRnNBL25hWHg0ektwWTdn?=
 =?utf-8?B?emxTNkZyVUVTUkpTUWFEYjU2VkZxUlRkSDFqNDVKR3hwWVZXRTQwc2NNb216?=
 =?utf-8?B?dzBvZDNqL0VyK2V1M1EydHVyWXdTVWo2cWdHbHpLSTB5ZHV0cXBBZlJBcCtL?=
 =?utf-8?B?TkZWekNSOFl5eDJJZEVGQzdIMkNQRThCd1lxWS9sZHhRMVVzZ0hLMWRBMXlK?=
 =?utf-8?B?Z2kzVWc0NHRUNmRZRU1vcGIvMktTNFNjQnZ1cGorb3lMZzQ0T3ZGQlppekQy?=
 =?utf-8?B?NW0ySzhjQU5OR1h2WDNBOTdnM21pWDREVDBnSVRhWGg4S29KaUhNcllDakJj?=
 =?utf-8?B?V2pDRmtWNW1vNUVDcWFrVkVPdGdRdXVHaDVQRElXQ3RkbE1TUGhuR2pPRVpq?=
 =?utf-8?B?U1ppVVdFTC85SFpnMmlhVC9FZzA3dEIrL0JDUHB1QlNYMlJsMmFabFZpYXVO?=
 =?utf-8?B?cnNJS2ZVckN1Wk5Wc1Z1cXNmbi9STER4KzBhN0d0TUR6aFVvLzI4SXhhbFZY?=
 =?utf-8?B?NFhOZy9jN2xvU1ZVT0ZzUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6651BF4B12F53E449BC875744E7EF26A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7540
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f89821e-5d33-4e3c-c318-08dc7a65c9aa
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3hIdWkxU1FMdFBlY0FSa3AvTE00OVFWdEpjSGhPbTViMEh0Vm5RUTdsQnJY?=
 =?utf-8?B?NUc0YnNVaUxtWVNTUHVTQzZKYXlENnZ3VktlYW5HbGpQYW5aSnIwTzdEbzhC?=
 =?utf-8?B?UWNJZG5KRlJ5ekhnZ0F1U2ovZm1ib3hjOFJkU3FKU1hpVWQ2bC9wM3NGdUt6?=
 =?utf-8?B?VEgxa0k0MmN2eks4eGxkaDNNZHc3SWs3UUdlbXU3cEsrR0VTNXBEdlJmN2Qw?=
 =?utf-8?B?QnhZMlZGTG5QN0VBanhWa05lSXlOM0RNaExwL29WclFrZWxzMUVVeVllL0dX?=
 =?utf-8?B?YUc4VVFpZmFraXRVVU1JSlcyUmJ6WkFJNklpSDkwWVZFaTc0RnR2MHNRN25P?=
 =?utf-8?B?bndrZHpzb1V5bzhmVE91Y0E3Y0p6ZG5pUjRPUnlKQUF3d25MZ3pPY21mNUd6?=
 =?utf-8?B?N1Qwb0dRWVZTcWpnaHl3VmxZUWlzS1F2eExmV3o2cTlXWnF1SnNiVEc1SlVR?=
 =?utf-8?B?KzlXUDN0SDE5SlF6eHU2RzNhTjlUK2NRVWVvRG15UWY1MFNIN3NlM3NWN2t3?=
 =?utf-8?B?QVEzZExpMmRLVG1Ea3JmUEY1V0lqVjZRVFQ3emhWTkttbUpGaGFkK3BlVXNJ?=
 =?utf-8?B?NnNvWjBCNWlxZVVNR1BxR3pkTy9QbjR6Q29Ibjl1QUF3NVNxc0RTWmtBbXBk?=
 =?utf-8?B?ck1GNG9SODVCTVNpQlNXQ1NwWXV0SnRLdDBldU85QUZXUnR0NVVybVEyWE1y?=
 =?utf-8?B?WlE2SW1YYXdCT0Nma3hwLzMvVlFMc3VENWtrcDE0Y09OR3Rpb1FCWkpXUm93?=
 =?utf-8?B?OG4vTTl4dGJqTEJGbFpCL0t6U2VsdGVzd0FYV1crckZ6RnR2M2RRdDRUSEJl?=
 =?utf-8?B?SitZRmRiQSt0V3pFNlVxL2NEWkpoWkdPMDlLR0JNbFJZUjY1RlAzaWFSM3Vw?=
 =?utf-8?B?dkN5MXRHMmJGUjE5OXhVcEVhVEVqbnU5ellML3pwOWkyY2VZVEY2NzQyRHdv?=
 =?utf-8?B?VzB0SzFKaEVKM2lhMUxuMm9mSy9MWDlVTHovVTJkQ2tFVExBUWtjME4vcWlz?=
 =?utf-8?B?akRUQ1NETWRzbEwyNVcxZ1U3OTgvUlBYRHZTUUxvNU1pc1MyMnpCTDlKWEpN?=
 =?utf-8?B?SjJFRXF6c0ZMR3J1TmlaM01wWVJxdUlSUGZoT3R6V3BDaVVRb2N4dVN1V2R6?=
 =?utf-8?B?bWUxRDdGLzYwQ3FnL2x5a1R3S2RzK3Q0ejR3dUpjZUNMMTgwQVNJY2ZwZGhQ?=
 =?utf-8?B?bkQzVHcvS2c1VkNpUlMzaCswQ0wwTmxpTTVRZHZKaDRuMUtHQ09ZSGxLV1V6?=
 =?utf-8?B?YUdxM0tMbjRCdE05alNOeUl2Qm1yNGs5L3RZWmN4bjdRL3p2dDBIQXJHSGlk?=
 =?utf-8?B?Zy9Jd291TmFtMFJMQksxNjRjVGVtSFNNdC9nNHlKWHUxVHpSNHE3Y2dHNTQz?=
 =?utf-8?B?a1RibUt0dUszYVRrZmNUdEZPb3VVSktlRjdueURjdzBaY20zc0UvbjAzLzlH?=
 =?utf-8?B?TlBzQ0FldHJuSFlyQ0dDbFdXMC94UVNrdlhjbHlyaGJGU3lCRlp4OXRJWVZ1?=
 =?utf-8?B?emxlRmdPT2sxVlg3em9zKzZRM0JkSVpXNE1uL0c2RXAwK0h0RDg3aDRNWFZI?=
 =?utf-8?B?WnN6V0ZIbmJYM3FzWUdubFVDdWJ4RWNjTWNmNTdkdmVVT1hDbkE0RmRaTzVR?=
 =?utf-8?B?aUhQUEV1ZkxCWU5hZ0IxR1lxS0NIRkVhdWdsZ2RKVWJ2Z0N1N2FkTFcveklh?=
 =?utf-8?B?SHFZTjhFcDBpallMNm9GcmZCcDFDSUdnMEh6aS9iUkJ6TzUwa1JueStYNDNq?=
 =?utf-8?B?WllBUGdVUHRRUVp3NnFJNUFPV0RGTytEaXYyWGNEOXRWdmdWRVl5VW52aTJv?=
 =?utf-8?B?cjVmRzNrMXZmQ1YzREl6emViaVpoK1RJMUlEN0p6dlFPc0hhWGlNWi9wSFVo?=
 =?utf-8?Q?/NRAFL6bA3LiQ?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:48:06.0594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c891ddab-30a0-4429-2d7d-08dc7a65cee8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10213

SGkgSnVsaWVuLA0KDQo+IE9uIDIyIE1heSAyMDI0LCBhdCAxNDoyNSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9t
bXUvcDJtLmMgYi94ZW4vYXJjaC9hcm0vbW11L3AybS5jDQo+PiBpbmRleCA0MWZjY2EwMTFjZjQu
LmI0OTYyNjZkZWVmNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbXUvcDJtLmMNCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9tbXUvcDJtLmMNCj4+IEBAIC03NTMsMTcgKzc1Myw5IEBAIHN0
YXRpYyBpbnQgcDJtX21lbV9hY2Nlc3NfcmFkaXhfc2V0KHN0cnVjdCBwMm1fZG9tYWluICpwMm0s
IGdmbl90IGdmbiwNCj4+ICAgICAgcmV0dXJuIHJjOw0KPj4gIH0NCj4+ICAtLyoNCj4+IC0gKiBQ
dXQgYW55IHJlZmVyZW5jZXMgb24gdGhlIHNpbmdsZSA0SyBwYWdlIHJlZmVyZW5jZWQgYnkgcHRl
Lg0KPj4gLSAqIFRPRE86IEhhbmRsZSBzdXBlcnBhZ2VzLCBmb3Igbm93IHdlIG9ubHkgdGFrZSBz
cGVjaWFsIHJlZmVyZW5jZXMgZm9yIGxlYWYNCj4+IC0gKiBwYWdlcyAoc3BlY2lmaWNhbGx5IGZv
cmVpZ24gb25lcywgd2hpY2ggY2FuJ3QgYmUgc3VwZXIgbWFwcGVkIHRvZGF5KS4NCj4+IC0gKi8N
Cj4+IC1zdGF0aWMgdm9pZCBwMm1fcHV0X2wzX3BhZ2UoY29uc3QgbHBhZV90IHB0ZSkNCj4+ICsv
KiBQdXQgYW55IHJlZmVyZW5jZXMgb24gdGhlIHNpbmdsZSA0SyBwYWdlIHJlZmVyZW5jZWQgYnkg
bWZuLiAqLw0KPj4gK3N0YXRpYyB2b2lkIHAybV9wdXRfbDNfcGFnZShtZm5fdCBtZm4sIHAybV90
eXBlX3QgdHlwZSkNCj4+ICB7DQo+PiAtICAgIG1mbl90IG1mbiA9IGxwYWVfZ2V0X21mbihwdGUp
Ow0KPj4gLQ0KPj4gLSAgICBBU1NFUlQocDJtX2lzX3ZhbGlkKHB0ZSkpOw0KPj4gLQ0KPj4gICAg
ICAvKg0KPj4gICAgICAgKiBUT0RPOiBIYW5kbGUgb3RoZXIgcDJtIHR5cGVzDQo+PiAgICAgICAq
DQo+PiBAQCAtNzcxLDE2ICs3NjMsNDMgQEAgc3RhdGljIHZvaWQgcDJtX3B1dF9sM19wYWdlKGNv
bnN0IGxwYWVfdCBwdGUpDQo+PiAgICAgICAqIGZsdXNoIHRoZSBUTEJzIGlmIHRoZSBwYWdlIGlz
IHJlYWxsb2NhdGVkIGJlZm9yZSB0aGUgZW5kIG9mDQo+PiAgICAgICAqIHRoaXMgbG9vcC4NCj4+
ICAgICAgICovDQo+PiAtICAgIGlmICggcDJtX2lzX2ZvcmVpZ24ocHRlLnAybS50eXBlKSApDQo+
PiArICAgIGlmICggcDJtX2lzX2ZvcmVpZ24odHlwZSkgKQ0KPj4gICAgICB7DQo+PiAgICAgICAg
ICBBU1NFUlQobWZuX3ZhbGlkKG1mbikpOw0KPj4gICAgICAgICAgcHV0X3BhZ2UobWZuX3RvX3Bh
Z2UobWZuKSk7DQo+PiAgICAgIH0NCj4+ICAgICAgLyogRGV0ZWN0IHRoZSB4ZW5oZWFwIHBhZ2Ug
YW5kIG1hcmsgdGhlIHN0b3JlZCBHRk4gYXMgaW52YWxpZC4gKi8NCj4+IC0gICAgZWxzZSBpZiAo
IHAybV9pc19yYW0ocHRlLnAybS50eXBlKSAmJiBpc194ZW5faGVhcF9tZm4obWZuKSApDQo+PiAr
ICAgIGVsc2UgaWYgKCBwMm1faXNfcmFtKHR5cGUpICYmIGlzX3hlbl9oZWFwX21mbihtZm4pICkN
Cj4+ICAgICAgICAgIHBhZ2Vfc2V0X3hlbmhlYXBfZ2ZuKG1mbl90b19wYWdlKG1mbiksIElOVkFM
SURfR0ZOKTsNCj4+ICB9DQo+IA0KPiBBbGwgdGhlIHBhZ2VzIHdpdGhpbiBhIDJNQiBtYXBwaW5n
IHNob3VsZCBiZSB0aGUgc2FtZSB0eXBlLiBTby4uLg0KPiANCj4+ICArLyogUHV0IGFueSByZWZl
cmVuY2VzIG9uIHRoZSBzdXBlcnBhZ2UgcmVmZXJlbmNlZCBieSBtZm4uICovDQo+PiArc3RhdGlj
IHZvaWQgcDJtX3B1dF9sMl9zdXBlcnBhZ2UobWZuX3QgbWZuLCBwMm1fdHlwZV90IHR5cGUpDQo+
PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsNCj4+ICsgICAgZm9yICggaSA9IDA7
IGkgPCBYRU5fUFRfTFBBRV9FTlRSSUVTOyBpKysgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBw
Mm1fcHV0X2wzX3BhZ2UobWZuLCB0eXBlKTsNCj4+ICsNCj4+ICsgICAgICAgIG1mbiA9IG1mbl9h
ZGQobWZuLCAxKTsNCj4+ICsgICAgfQ0KPiANCj4gLi4uIHRoaXMgc29sdXRpb24gaXMgYSBiaXQg
d2FzdGVmdWwgYXMgd2Ugd2lsbCBub3cgY2FsbCBwMm1fcHV0X2wzX3BhZ2UoKSA1MTIgdGltZXMg
ZXZlbiB0aG91Z2ggdGhlcmUgaXMgbm90aGluZyB0byBkby4NCj4gDQo+IFNvIGluc3RlYWQgY2Fu
IHdlIG1vdmUgdGhlIGNoZWNrcyBvdXRzaWRlIHRvIG9wdGltaXplIHRoZSBwYXRoIGEgYml0Pw0K
DQpZb3UgbWVhbiB0aGlzPw0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tdS9wMm0uYyBi
L3hlbi9hcmNoL2FybS9tbXUvcDJtLmMNCmluZGV4IGI0OTYyNjZkZWVmNi4uZDQwY2RkZGE0OGYz
IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL21tdS9wMm0uYw0KKysrIGIveGVuL2FyY2gvYXJt
L21tdS9wMm0uYw0KQEAgLTc5NCw3ICs3OTQsOCBAQCBzdGF0aWMgdm9pZCBwMm1fcHV0X3BhZ2Uo
Y29uc3QgbHBhZV90IHB0ZSwgdW5zaWduZWQgaW50IGxldmVsKQ0KICAgICBBU1NFUlQocDJtX2lz
X3ZhbGlkKHB0ZSkpOw0KIA0KICAgICAvKiBXZSBoYXZlIGEgc2Vjb25kIGxldmVsIDJNIHN1cGVy
cGFnZSAqLw0KLSAgICBpZiAoIHAybV9pc19zdXBlcnBhZ2UocHRlLCBsZXZlbCkgJiYgKGxldmVs
ID09IDIpICkNCisgICAgaWYgKCBwMm1faXNfc3VwZXJwYWdlKHB0ZSwgbGV2ZWwpICYmIChsZXZl
bCA9PSAyKSAmJg0KKyAgICAgICAgIHAybV9pc19mb3JlaWduKHB0ZS5wMm0udHlwZSkgKQ0KICAg
ICAgICAgcmV0dXJuIHAybV9wdXRfbDJfc3VwZXJwYWdlKG1mbiwgcHRlLnAybS50eXBlKTsNCiAg
ICAgZWxzZSBpZiAoIGxldmVsID09IDMgKQ0KICAgICAgICAgcmV0dXJuIHAybV9wdXRfbDNfcGFn
ZShtZm4sIHB0ZS5wMm0udHlwZSk7DQoNCg0KPiBPdGhlcndpc2UuLi4NCj4gDQo+PiArfQ0KPj4g
Kw0KPj4gKy8qIFB1dCBhbnkgcmVmZXJlbmNlcyBvbiB0aGUgcGFnZSByZWZlcmVuY2VkIGJ5IHB0
ZS4gKi8NCj4+ICtzdGF0aWMgdm9pZCBwMm1fcHV0X3BhZ2UoY29uc3QgbHBhZV90IHB0ZSwgdW5z
aWduZWQgaW50IGxldmVsKQ0KPj4gK3sNCj4+ICsgICAgbWZuX3QgbWZuID0gbHBhZV9nZXRfbWZu
KHB0ZSk7DQo+PiArDQo+PiArICAgIEFTU0VSVChwMm1faXNfdmFsaWQocHRlKSk7DQo+PiArDQo+
PiArICAgIC8qIFdlIGhhdmUgYSBzZWNvbmQgbGV2ZWwgMk0gc3VwZXJwYWdlICovDQo+PiArICAg
IGlmICggcDJtX2lzX3N1cGVycGFnZShwdGUsIGxldmVsKSAmJiAobGV2ZWwgPT0gMikgKQ0KPj4g
KyAgICAgICAgcmV0dXJuIHAybV9wdXRfbDJfc3VwZXJwYWdlKG1mbiwgcHRlLnAybS50eXBlKTsN
Cj4+ICsgICAgZWxzZSBpZiAoIGxldmVsID09IDMgKQ0KPj4gKyAgICAgICAgcmV0dXJuIHAybV9w
dXRfbDNfcGFnZShtZm4sIHB0ZS5wMm0udHlwZSk7DQo+PiArfQ0KPj4gKw0KPj4gIC8qIEZyZWUg
bHBhZSBzdWItdHJlZSBiZWhpbmQgYW4gZW50cnkgKi8NCj4+ICBzdGF0aWMgdm9pZCBwMm1fZnJl
ZV9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLA0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxwYWVfdCBlbnRyeSwgdW5zaWduZWQgaW50IGxldmVsKQ0KPj4gQEAgLTgwOSw5ICs4
MjgsMTYgQEAgc3RhdGljIHZvaWQgcDJtX2ZyZWVfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAy
bSwNCj4+ICAjZW5kaWYNCj4+ICAgICAgICAgICAgcDJtLT5zdGF0cy5tYXBwaW5nc1tsZXZlbF0t
LTsNCj4+IC0gICAgICAgIC8qIE5vdGhpbmcgdG8gZG8gaWYgdGhlIGVudHJ5IGlzIGEgc3VwZXIt
cGFnZS4gKi8NCj4+IC0gICAgICAgIGlmICggbGV2ZWwgPT0gMyApDQo+PiAtICAgICAgICAgICAg
cDJtX3B1dF9sM19wYWdlKGVudHJ5KTsNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBU
T0RPOiBDdXJyZW50bHkgd2UgZG9uJ3QgaGFuZGxlIDFHQiBzdXBlci1wYWdlLCBYZW4gaXMgbm90
DQo+PiArICAgICAgICAgKiBwcmVlbXB0aWJsZSBhbmQgdGhlcmVmb3JlIHNvbWUgd29yayBpcyBu
ZWVkZWQgdG8gaGFuZGxlIHN1Y2gNCj4+ICsgICAgICAgICAqIHN1cGVycGFnZXMsIGZvciB3aGlj
aCBhdCBzb21lIHBvaW50IFhlbiBtaWdodCBlbmQgdXAgZnJlZWluZyBtZW1vcnkNCj4+ICsgICAg
ICAgICAqIGFuZCB0aGVyZWZvcmUgZm9yIHN1Y2ggYSBiaWcgbWFwcGluZyBpdCBjb3VsZCBlbmQg
dXAgaW4gYSB2ZXJ5IGxvbmcNCj4+ICsgICAgICAgICAqIG9wZXJhdGlvbi4NCj4+ICsgICAgICAg
ICAqLw0KPj4gKyAgICAgICAgaWYgKCBsZXZlbCA+PSAyICkNCj4+ICsgICAgICAgICAgICBwMm1f
cHV0X3BhZ2UoZW50cnksIGxldmVsKTsNCj4+ICsNCj4+ICAgICAgICAgIHJldHVybjsNCj4+ICAg
ICAgfQ0KPj4gIEBAIC0xNTU4LDkgKzE1ODQsMTIgQEAgaW50IHJlbGlucXVpc2hfcDJtX21hcHBp
bmcoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICAgICAgICAgY291bnQrKzsNCj4+ICAgICAgICAg
IC8qDQo+PiAtICAgICAgICAgKiBBcmJpdHJhcmlseSBwcmVlbXB0IGV2ZXJ5IDUxMiBpdGVyYXRp
b25zLg0KPj4gKyAgICAgICAgICogQXJiaXRyYXJpbHkgcHJlZW1wdCBldmVyeSA1MTIgaXRlcmF0
aW9ucyBvciB3aGVuIHR5cGUgaXMgZm9yZWlnbg0KPj4gKyAgICAgICAgICogbWFwcGluZyBhbmQg
dGhlIG9yZGVyIGlzIGFib3ZlIDkgKDJNQikuDQo+PiAgICAgICAgICAgKi8NCj4+IC0gICAgICAg
IGlmICggIShjb3VudCAlIDUxMikgJiYgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApDQo+PiAr
ICAgICAgICBpZiAoICghKGNvdW50ICUgNTEyKSB8fA0KPj4gKyAgICAgICAgICAgICAgKHAybV9p
c19mb3JlaWduKHQpICYmIChvcmRlciA+IFhFTl9QVF9MRVZFTF9PUkRFUigyKSkpKSAmJg0KPiAN
Cj4gLi4uIHdlIHdvdWxkIG5lZWQgdG8gcHJlZW1wdCBmb3IgZXZlcnkgMk1CIHJhdGhlciB0aGFu
IGp1c3QgZm9yIHRoZSBwMm1faXNfZm9yZWlnbigpLg0KDQpPayBvdGhlcndpc2UgeW91IGFyZSBz
dWdnZXN0aW5nIHRoYXQgaWYgd2UgZG9u4oCZdCBnbyBmb3IgdGhlIHNvbHV0aW9uIGFib3ZlIHdl
IGRyb3AgcDJtX2lzX2ZvcmVpZ24odCkgZnJvbQ0KdGhlIGNvbmRpdGlvbiBoZXJlLCBhbSBJIHJp
Z2h0Pw0KDQo+IA0KPiBCVFcsIHAybV9wdXRfbDNfcGFnZSgpIGhhcyBhbHNvIGFub3RoZXIgY2Fz
ZS4gU2hvdWxkIHdlIGNvbnNpZGVyIHRvIGhhbmRsZSBwcmVlbXB0aW9uIGZvciBpdCB0b28/DQoN
CllvdSBtZWFuIGNoZWNraW5nIGZvciA1MTIgaXRlcmF0aW9ucywgb3IgZm9yZWlnbiBtYXBwaW5n
IHdoZW4gb3JkZXIgaXMgPiA5LCBvcg0KcDJtX2lzX3JhbSh0eXBlKSAmJiBpc194ZW5faGVhcF9t
Zm4obWZuKSA/DQoNCkp1c3Qgd2FudCB0byBiZSBzdXJlIEkgZnVsbHkgdW5kZXJzdGFuZCB5b3Vy
IGNvbW1lbnRzIGhlcmUuDQoNCkNoZWVycywNCkx1Y2ENCg0K

