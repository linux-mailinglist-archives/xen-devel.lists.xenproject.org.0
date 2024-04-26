Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2988B3AC5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712900.1113800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NFO-00041J-QT; Fri, 26 Apr 2024 15:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712900.1113800; Fri, 26 Apr 2024 15:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NFO-0003yu-Nd; Fri, 26 Apr 2024 15:12:22 +0000
Received: by outflank-mailman (input) for mailman id 712900;
 Fri, 26 Apr 2024 15:12:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Jki=L7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1s0NFM-0003yo-Dt
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:12:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2611::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f0f4c48-03df-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 17:12:18 +0200 (CEST)
Received: from AS4P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::6)
 by VE1PR08MB5840.eurprd08.prod.outlook.com (2603:10a6:800:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 15:12:15 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::6d) by AS4P189CA0033.outlook.office365.com
 (2603:10a6:20b:5dd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Fri, 26 Apr 2024 15:12:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Fri, 26 Apr 2024 15:12:14 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315");
 Fri, 26 Apr 2024 15:12:14 +0000
Received: from 947e78da83d1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 984EE406-2C93-4CC1-9023-25A5CBCFF845.1; 
 Fri, 26 Apr 2024 15:12:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 947e78da83d1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Apr 2024 15:12:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9185.eurprd08.prod.outlook.com (2603:10a6:102:30d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 15:12:03 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 15:12:03 +0000
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
X-Inumbo-ID: 5f0f4c48-03df-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h6zGBh4XdcKWSQgBeR0j6I5r21wlWezQy37Br5AY9MP1qmJpuxhtH7gtYNR//Lzd4goA5TzUUTEIwklaDekPQk48uTvyr97fGvO7ZcZZNMuCw8y34GlMXjLuVg+SBgkOnfJLamn1iySaBjxKU5hMRfAAhw0hxbRIiOkd1fqmMmgeK7V1bCxQ1OIn7C8QzHfhVRd5JuwLt5tDghl/ElaXcyQQ6wwe96rYCbq0y3tr+MjNDck3vfznJA9TMBLVH1Vjj9dEracXqwnl09Fnzk18M06CPGqNLKUupZKgENykMpm/C6BEs61AkJLOm0q43cz64CplqK066OVnZiuIRgyzNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXwJYQS01UcnKyoOjSHUMqYGBLfsV7F/f3PgZkXkt+A=;
 b=XOfUj3LvPrynoRa/b/X7k9PE76u8hVOYRnk0fM7UBR+UBG2JoKY6/evyY2MmnEIGfFS27z/bomoS1c7Lj9wnopiI+hyU7PkHbgwz9NGSbCkRDkdv3X7KRBEj7GF8KZGw0u49JMxUSOXFCHyr2oBnyybuCoTltFEdq6Y67vt3l4AXFwyb0rnRoBhQQyOAC91uWLl8z8jids3Q6Qor7UBdVtPE3se21N4Tr7Mc60cyb2f84wBZPmeyV801AYJ3WsXaaJ0JOWLPuiaI7toKJfNRLxGYnxA0G/uBGjdu21WBFWUi3jztyZC58yeKYPwKf3qMJkyGMJEBCEREi0pkeBwn/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXwJYQS01UcnKyoOjSHUMqYGBLfsV7F/f3PgZkXkt+A=;
 b=SswuZVqKGEYvLSUzpvFIlBHiXE/Q/1mk9vLvN43yc9vc6Zlrah7zajMl8Gxqjw/nLAjIHT8h6GPpu3UNx+opwVMjJrYsDLUny56oy7zFTxpUp6UXuNdck6OMkL6IyqTraMnYerG/FzFITu5FATcp6kb1za8WStcvGF95vzfeMH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7b26a5b8a36ee5e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi7vUejcwL+VhND0oH/k5iTs5RB2K9s8TM5kNYVCV9C5JLIyOni+G6wfM/LlhFSY5Ryr5/nH0Vf8wgF2bs2SVQDy8qC8gZdrMFPE3R4yvmavQLRKa9EMRu9Ywf1ut5A8554SXX5KNKOuTDAf2j9M3mTMrSxeiyVCmxaWkJwHuv0sR+EJztDiu1vHZ4tpMgsWW68uy6EtkCWxL9L9TZuoNVuiohTfETFXo2NzHup4Kr4cJT6ADr6ATrKoxq9k81NnJHFXJ6OEFQHbH++PW9znq1i5qwEYxRigkN5uf4nmiZjai+PIPJkhafvd1S01aS0u4WPq5recsZyy9YTz0ECElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXwJYQS01UcnKyoOjSHUMqYGBLfsV7F/f3PgZkXkt+A=;
 b=bASh29yZxMna5F45R6H/MhumZo0mLDwZUTcH4LskZT2VtVGpK6M0A8m1kfAYBQryA1rzR8hhBi3J7XfZw40q91U3565BVVahvE4eRyDfWfmVk1vdEsSnIbwx8uAZTpsgQ7/837J41xtBCNJjKgXaDbffxPxLWkcuS4BKQIh+hz1lV4djlS0wcoslGHPv0COjuoayK+fl7GX4iEYFybmXg/fDjBoC7pO1lwp6cn4bLmKizJ4up8hzVbO1ErEjUpO9crwnvLBjO0O45fJ6bBgm1+/RlDLZMjOOdg3zBhXAejawE95Sf6ReIUMHMgNJBGi2YGfL76WG56DtrbcOkOKN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXwJYQS01UcnKyoOjSHUMqYGBLfsV7F/f3PgZkXkt+A=;
 b=SswuZVqKGEYvLSUzpvFIlBHiXE/Q/1mk9vLvN43yc9vc6Zlrah7zajMl8Gxqjw/nLAjIHT8h6GPpu3UNx+opwVMjJrYsDLUny56oy7zFTxpUp6UXuNdck6OMkL6IyqTraMnYerG/FzFITu5FATcp6kb1za8WStcvGF95vzfeMH0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Index:
 AQHal7ZoS0Rs3weazUuhKfXitmlnMLF6RnOAgAAvzwCAAAIygIAAA5kAgAACj4CAAAXVAIAAJEOA
Date: Fri, 26 Apr 2024 15:12:03 +0000
Message-ID: <F28C3921-0D2A-4D9E-A035-92BEC091C838@arm.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
 <A0908DCC-6E15-406B-8E29-F241B6EA8BE1@arm.com>
 <CAHUa44ETaCY2pbUjMOW5T2NSpmRCq3sWMjLUbK0DC2jpQxHJRQ@mail.gmail.com>
 <3A576E95-454B-4C66-A164-A2871DB4E2B2@arm.com>
 <CAHUa44EC_H7Q_A2M63dZnEGGNanyjGM6m2MuBg4_6BNEO-XDKA@mail.gmail.com>
 <42E71B74-157D-4A4E-AA57-2A93BB3D0007@arm.com>
 <CAHUa44HhxHez35a95oEwnvMEObU_=6JrGVBc8rT5grFRHNUQyQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44HhxHez35a95oEwnvMEObU_=6JrGVBc8rT5grFRHNUQyQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9185:EE_|AM3PEPF0000A796:EE_|VE1PR08MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 14541702-e114-44a4-1642-08dc66034153
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eW9hWDF2eHJXWi9XeU82dmUrajgyNTFtM1EzV0FCUzQrRjhYSStWekl5aEor?=
 =?utf-8?B?MTgzQXRJbDZFUG9XUWxibkh5YjFoMmJGTjF4SDE2dFJLTHJRL3VaZHVpMFlL?=
 =?utf-8?B?bXpKNG1BcU9wdXUrSUdvNTh2aEJ6d2NrYlJUNXRlVkR0bjgxWG5ZSHhhMFhW?=
 =?utf-8?B?cWNOZkx6RUJ1VVEzbXZxNUh1aGFzYVRXanJuUE1tdE1tQTZqdng5OVpNNkJ0?=
 =?utf-8?B?MU9kMm8zb2tISVFFbVkxdWhBc2ZUZzVvQkc1T3NTT2ZwRFJCNWhqSlljYXZE?=
 =?utf-8?B?ejJWL1d6OTUyN2hKSnptR0tlL2dKb2NsbGYydzRleGhIZ1NCYVRSQk9ma0JK?=
 =?utf-8?B?K1VZYi9LOXEvV0JDZ2NSeUVXL0dTM0VuZXhrQTl2bWU1Wk1obWpWTXFyaXk2?=
 =?utf-8?B?cGlyL0U1N3hNS2xiWEpSTm9KZ2paOTQ4Ty9pYlpqMFVQVEd1QXNtcnBzaXI5?=
 =?utf-8?B?TE1LTWRVY1RJcmQvdUtaQnlWTWZzZGY2c3JRNmxDTmwzUHZMNkw3bmlVWEpi?=
 =?utf-8?B?Q08vdGtYSHd4QmxCaDVaSkkyQkZTdzJWM21TYU1rWjRvdUNvYS9jdE8wc29h?=
 =?utf-8?B?cGJCK083SHFQOUpZN3JVK0grc3pxNzJwaER5bURBdFpHUCt5L3VwcGZ1c1VX?=
 =?utf-8?B?aXhUOHJNbDF3L3FENC94NlVtUTJqZlRtSVJ3dStqUU0xOEVHZHVrS3ZRQlJk?=
 =?utf-8?B?NEpxVDhVOXpRUWhhaWFLVGtSRXcreFpHelVtek12VVdnR2tyYlN0cWtRWUxR?=
 =?utf-8?B?a3BqQ0RXL2NiQUlSNlRid0xsK1NFakpQRmo4TTNwYlJPUi8xdGhhUjMzWWgv?=
 =?utf-8?B?YzRtVFVqN29rM2lSTGxwSWd0TGZ3anMxclMxRDUyR3QybW9qT1A2OStSVXFV?=
 =?utf-8?B?TFgxSG1NUlp1cjhBeUwyWmw3QlRLU2FGK2FLNmN4NzZSYlpnVG1jV2xXMU9K?=
 =?utf-8?B?b0kvYXNDWmtzdE5oSHhsaHZwamt5OWc2TldpNU9RSDlkS21aL2lYYk1EcU1F?=
 =?utf-8?B?ME5zeTZtT215M0F5MnlXRmJITjd3TkQ2eGF4YmFydHRvMzQ2bHlhb3dLTFJL?=
 =?utf-8?B?ZkNyb1RlVGZUUm1PWUcrTHpHLzVJYnJ4RXc0T2ZDMVhCQlJ2WWRSWnRJWmd2?=
 =?utf-8?B?dmVFRWsxbHFHeWxYOFI5OVhHaldHbmJMcURCSFQ1QzJ2RmlKVEVBVFY1dmRJ?=
 =?utf-8?B?UWJDcTEzdTdiN1R2TXhOYVJuYlFwak8xRnpBNUtHL1JXdmVscUhJUjBMcThE?=
 =?utf-8?B?RXVRdTB2NWhNNGNYak5hYi9sOXBvZlhaZXJnL1NQcmV2NjZ2cjNqTnBmYVdw?=
 =?utf-8?B?L2NNcFZpL2FoZnY0QlBqbUtuOTlXRklBTHV4TStDSVNINitrQmhCQTgwNzZi?=
 =?utf-8?B?dEVvVkljN0JmY3UxOHppZ0htOVJYNEJSOEpGeXN6ZURhSEI5N1JVNEVTL3Ju?=
 =?utf-8?B?MHlFU3R1RWZ3RWVpaEE4WWx2bnFrSEN5SERFazgvVEpJNW9XWGlpeVJyNVJt?=
 =?utf-8?B?RW5ESEhaeisxS09FSHlkNkhqZE5VVzlVak1iY0xpVEwyTkhFUVhDa29RVXYz?=
 =?utf-8?B?bVpkcHJlTkxwK3M1SVRONmpSSEJMNWZNRk9ONkptODRoQ2lKOXNVUEtrV08w?=
 =?utf-8?B?bWFkeHg3RmRubzRrM3V4bDR0NUNEVE5BQnV2OFJXU1o2T3I1TVYwcWFVOGFi?=
 =?utf-8?B?Ly9iUlNEajA3S0hWSmttRk5LcEtOV0p5QzNzbk1JL1ZaTGg3ckV1NmZlYWEx?=
 =?utf-8?B?QXZJdlRPYzFhbnUzakpvbnY4NHpFSGlZRFJndXIxSUlvdHpHdGozT25jdGhI?=
 =?utf-8?B?ZzE2UmRybXZUVkxXVjlOUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F9E5290885353409F2CC5BA92691CFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9185
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a35e8dff-8b61-438c-1892-08dc66033ab0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400014|36860700004|35042699010;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkRyZHdLUTNiODF2WGVBK203TXROY3Zkc2M0dFlVeDEvVi8zNCtTdzJnVUNv?=
 =?utf-8?B?MkhqV0hraXptUjVBRVhnZ0VyZjFtdUt3TVlGRm5rODQrS3NMZ0RQNFFlMWtM?=
 =?utf-8?B?SzBVZ2VKUnJhRzFVWWw1c1lkaGN4VG9XMkUvcFpaMFh5Q1plclJMdU9DM3lx?=
 =?utf-8?B?M0RxaWFuZnJYTkxHcUNIVFV3WFdiTHc4RHdRUlYxS0F5RGl4WHdTMDUyenhD?=
 =?utf-8?B?Rm5mMkxWbEpGU1B5eHVRUVRGbUxkbFZySjgvcGgwbjRwN2tZTEpPN0xoSDRV?=
 =?utf-8?B?T0VpbnQ2Y09qVHF2QkJSbXlmWGZ5bVBiamZNNXQzcE9rMG5aZXJkekF4dDFh?=
 =?utf-8?B?WnJMNTlMYUwzUWUzRE04TUNXTUhnckFHRGFZRzQ3RXo2VWwzOHRWNGFBL1I2?=
 =?utf-8?B?d3pnSEcvVi9rZHlFVVhNbHE4cVAzUy9kK2luajhkT0lGYWtqZDlka2ZDVVVM?=
 =?utf-8?B?QmpIbnYvY0hCN1BDYnhkaVZPcGN4cngzeTB4SGxFQVN0Qm40MmUwY1kxWm8y?=
 =?utf-8?B?c3ZGQld5aXRVRVYxaGJIZmV6c3AzTlBLdStXa1BmYWJ4OXRKZFAyZHY5WGpJ?=
 =?utf-8?B?dHRseldLbDR5dmJNUzhoa0taWGpUc1JkNGtjdEg5R3c2ZmNaRThUVjFZZ1dL?=
 =?utf-8?B?Rmo4ZVEwRnlWMUo1VkpGTmlRbUVlQ3VZc3ZXY28xY3BsY0Jja3ZhRDBORG4x?=
 =?utf-8?B?RUM1aDFSNzA4cEliZHhSeHdDTnIxOWE1d0hSdmxZak9sNlREaFZHeGpRK1ZB?=
 =?utf-8?B?NFVTRldETEFVUE5sbElSWnZ3MHNGSnJBMmcyVys2c2MvNit0Vlc2VXE5UGFi?=
 =?utf-8?B?QzNKTXVBanBaRS92QVFjUUJzWnlHalkyMXJaV1ZDUmtFUXhqRHY2Q0JHeGZG?=
 =?utf-8?B?YVRVT3FnbWJweFVDMU1YZU1CNVFqZXJ0YXBsVmoycjE5VVMzRkZzamZHSWVF?=
 =?utf-8?B?d1dvQUZZRFR1Vm9hSEFOelU0RXRBWEVEMnVDckwvNnd2NGRPcEFOeXRzR2NN?=
 =?utf-8?B?WFoxZHVScC9KM0xrUk9qR09yRmFKT2I2ejBzcDRZQ2hyY0VIWnU3UDJhdi9x?=
 =?utf-8?B?Yk1ML055OHBJSmJxVEpHcW13SUhlb2VydEFERFFST2srNnpKMzdTQmhVeHY3?=
 =?utf-8?B?ZjFNM0hhYWY1RExuUWluS2JlZ0pRdS92MFAyQVBmMkF6MWNwVmxuYnRuUGpR?=
 =?utf-8?B?QlB0aHhoQU45M3BPb3NBQmJkSUpNWUNVUmt5a2tKdGxRaU5SSmM1WjVkbC9p?=
 =?utf-8?B?SEFMOUxreGZ2YXNUTndtcVduM3B2dkJlMEJxV0FMZEREM3A1d0ZuclYwNVpy?=
 =?utf-8?B?NWJJRWFKdTRrcGJBVE41RkpYcHVaRGZ6aFpVeWhtSU5oWTJxNEpGL1FuNjlZ?=
 =?utf-8?B?VnI1b3YyR2ZELzJLNWF1RGJsSDYwdFR3QkwzeVJidVpqZ1paUFA1Z0ZuK0Z6?=
 =?utf-8?B?aGt0dTUvUkxiK2QvdnZmVkc1TmIyMWpXRnZROHNsWUJnbEl3RVBKQXJoSEd4?=
 =?utf-8?B?THJUUUpPcVZMNW56MGZsZEZkd2ZlMG1Tc2l4VnRDdVNlazhSb2RtellmVThu?=
 =?utf-8?B?dzVNaStIYkZUTWE1YjdLeFBXa0pyVE1WNS81N0pCMlNDYVVLK3BNYkdoSlhj?=
 =?utf-8?B?NXFyNmtZL3RYclk2U2pzeVhMelFhSU9TVk9GR1FYMEw0U1Job0t1RWd0TCsr?=
 =?utf-8?B?c2hIdHpSenNsNEZjTk5KTXUrekxlWWdVZi9lN2NuelJiRCtpdTZzKzNlK2Na?=
 =?utf-8?B?bHlzZFJjdWpQemlwbUp0NC9WYzdxTzIvZ3k3ZkhoSGpSNkhtdy9kdnlhTUkw?=
 =?utf-8?B?Y01Ra2s2U2NJdlkxVkNIUUtWTmRxM0hOTkdoWXNhVVRGenc5cFkxYXIzZE5s?=
 =?utf-8?Q?RdJ9nolRCDdKH?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004)(35042699010);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 15:12:14.6042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14541702-e114-44a4-1642-08dc66034153
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5840

SGkgSmVucywNCg0KPiBPbiAyNiBBcHIgMjAyNCwgYXQgMTU6MDIsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgQXByIDI2LCAy
MDI0IGF0IDI6NDHigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFy
bS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4gDQo+Pj4gT24gMjYgQXByIDIwMjQs
IGF0IDE0OjMyLCBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4gT24gRnJpLCBBcHIgMjYsIDIw
MjQgYXQgMjoxOeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4+PiA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIEplbnMsDQo+Pj4+IA0KPj4+Pj4gT24gMjYg
QXByIDIwMjQsIGF0IDE0OjExLCBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJv
Lm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIEJlcnRyYW5kLA0KPj4+Pj4gDQo+Pj4+PiBP
biBGcmksIEFwciAyNiwgMjAyNCBhdCAxMToyMOKAr0FNIEJlcnRyYW5kIE1hcnF1aXMNCj4+Pj4+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IEhpIEpl
bnMsDQo+Pj4+Pj4gDQo+Pj4+Pj4+IE9uIDI2IEFwciAyMDI0LCBhdCAxMDo0NywgSmVucyBXaWts
YW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPj4+Pj4+PiANCj4+PiBb
Li4uXQ0KPj4+Pj4+PiArc3RydWN0IG5vdGlmX2lycV9pbmZvIHsNCj4+Pj4+Pj4gKyAgICB1bnNp
Z25lZCBpbnQgaXJxOw0KPj4+Pj4+PiArICAgIGludCByZXQ7DQo+Pj4+Pj4+ICsgICAgc3RydWN0
IGlycWFjdGlvbiAqYWN0aW9uOw0KPj4+Pj4+PiArfTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArc3Rh
dGljIHZvaWQgbm90aWZfaXJxX2VuYWJsZSh2b2lkICppbmZvKQ0KPj4+Pj4+PiArew0KPj4+Pj4+
PiArICAgIHN0cnVjdCBub3RpZl9pcnFfaW5mbyAqaXJxX2luZm8gPSBpbmZvOw0KPj4+Pj4+PiAr
DQo+Pj4+Pj4+ICsgICAgaXJxX2luZm8tPnJldCA9IHNldHVwX2lycShpcnFfaW5mby0+aXJxLCAw
LCBpcnFfaW5mby0+YWN0aW9uKTsNCj4+Pj4+Pj4gKyAgICBpZiAoIGlycV9pbmZvLT5yZXQgKQ0K
Pj4+Pj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiZmZhOiByZXF1ZXN0X2lycSBpcnEg
JXUgZmFpbGVkOiBlcnJvciAlZFxuIiwNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgIGlycV9pbmZv
LT5pcnEsIGlycV9pbmZvLT5yZXQpOw0KPj4+Pj4+PiArfQ0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICt2
b2lkIGZmYV9ub3RpZl9pbml0KHZvaWQpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICsgICAgY29uc3Qg
c3RydWN0IGFybV9zbWNjY18xXzJfcmVncyBhcmcgPSB7DQo+Pj4+Pj4+ICsgICAgICAgIC5hMCA9
IEZGQV9GRUFUVVJFUywNCj4+Pj4+Pj4gKyAgICAgICAgLmExID0gRkZBX0ZFQVRVUkVfU0NIRURV
TEVfUkVDVl9JTlRSLA0KPj4+Pj4+PiArICAgIH07DQo+Pj4+Pj4+ICsgICAgc3RydWN0IG5vdGlm
X2lycV9pbmZvIGlycV9pbmZvID0geyB9Ow0KPj4+Pj4+PiArICAgIHN0cnVjdCBhcm1fc21jY2Nf
MV8yX3JlZ3MgcmVzcDsNCj4+Pj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1Ow0KPj4+Pj4+PiAr
DQo+Pj4+Pj4+ICsgICAgYXJtX3NtY2NjXzFfMl9zbWMoJmFyZywgJnJlc3ApOw0KPj4+Pj4+PiAr
ICAgIGlmICggcmVzcC5hMCAhPSBGRkFfU1VDQ0VTU18zMiApDQo+Pj4+Pj4+ICsgICAgICAgIHJl
dHVybjsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArICAgIGlycV9pbmZvLmlycSA9IHJlc3AuYTI7DQo+
Pj4+Pj4+ICsgICAgaWYgKCBpcnFfaW5mby5pcnEgPCBHSUNfU0dJX1NUQVRJQ19NQVggfHwgaXJx
X2luZm8uaXJxID49IE5SX0dJQ19TR0kgKQ0KPj4+Pj4+PiArICAgIHsNCj4+Pj4+Pj4gKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgImZmYTogbm90aWZpY2F0aW9uIGluaXRpYWxpemF0aW9uIGZh
aWxlZDogY29uZmxpY3RpbmcgU0dJICV1XG4iLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgaXJx
X2luZm8uaXJxKTsNCj4+Pj4+Pj4gKyAgICAgICAgcmV0dXJuOw0KPj4+Pj4+PiArICAgIH0NCj4+
Pj4+Pj4gKw0KPj4+Pj4+PiArICAgIC8qDQo+Pj4+Pj4+ICsgICAgICogU0dJcyBhcmUgcGVyLUNQ
VSBzbyB3ZSBtdXN0IGVuYWJsZSB0aGUgSVJRIG9uIGVhY2ggQ1BVLiBXZSB1c2UgYW4NCj4+Pj4+
Pj4gKyAgICAgKiBJUEkgdG8gY2FsbCBub3RpZl9pcnFfZW5hYmxlKCkgb24gZWFjaCBDUFUgaW5j
bHVkaW5nIHRoZSBjdXJyZW50DQo+Pj4+Pj4+ICsgICAgICogQ1BVLiBUaGUgc3RydWN0IGlycWFj
dGlvbiBpcyBwcmVhbGxvY2F0ZWQgc2luY2Ugd2UgY2FuJ3QgYWxsb2NhdGUNCj4+Pj4+Pj4gKyAg
ICAgKiBtZW1vcnkgd2hpbGUgaW4gaW50ZXJydXB0IGNvbnRleHQuDQo+Pj4+Pj4+ICsgICAgICov
DQo+Pj4+Pj4+ICsgICAgZm9yX2VhY2hfb25saW5lX2NwdShjcHUpDQo+Pj4+Pj4+ICsgICAgew0K
Pj4+Pj4+PiArICAgICAgICBpcnFfaW5mby5hY3Rpb24gPSB4bWFsbG9jKHN0cnVjdCBpcnFhY3Rp
b24pOw0KPj4+Pj4+IA0KPj4+Pj4+IFlvdSBhbGxvY2F0ZSBvbmUgYWN0aW9uIHBlciBjcHUgYnV0
IHlvdSBoYXZlIG9ubHkgb25lIGFjdGlvbiBwb2ludGVyIGluIHlvdXIgc3RydWN0dXJlDQo+Pj4+
Pj4gd2hpY2ggbWVhbnMgeW91IHdpbGwgb3ZlcmxvYWQgdGhlIHByZXZpb3VzbHkgYWxsb2NhdGVk
IG9uZSBhbmQgbG9zZSB0cmFjay4NCj4+Pj4+PiANCj4+Pj4+PiBZb3Ugc2hvdWxkIGhhdmUgYSB0
YWJsZSBvZiBhY3Rpb25zIGluIHlvdXIgc3RydWN0dXJlIGluc3RlYWQgdW5sZXNzIG9uZSBhY3Rp
b24gaXMNCj4+Pj4+PiBlbm91Z2ggYW5kIGNhbiBiZSByZXVzZWQgb24gYWxsIGNwdXMgYW5kIGlu
IHRoaXMgY2FzZSB5b3Ugc2hvdWxkIG1vdmUgb3V0IG9mDQo+Pj4+Pj4geW91ciBsb29wIHRoZSBh
bGxvY2F0aW9uIHBhcnQuDQo+Pj4+PiANCj4+Pj4+IFRoYXQgc2hvdWxkbid0IGJlIG5lZWRlZCBi
ZWNhdXNlIHRoaXMgaXMgZG9uZSBpbiBzZXF1ZW5jZSBvbmx5IG9uZSBDUFUNCj4+Pj4+IGF0IGEg
dGltZS4NCj4+Pj4gDQo+Pj4+IFNvcnJ5IGkgZG8gbm90IHVuZGVyc3RhbmQgaGVyZS4NCj4+Pj4g
WW91IGhhdmUgYSBsb29wIG92ZXIgZWFjaCBvbmxpbmUgY3B1IGFuZCBvbiBlYWNoIGxvb3AgeW91
IGFyZSBhc3NpZ25pbmcNCj4+Pj4gaXJxX2luZm8uYWN0aW9uIHdpdGggYSBuZXdseSBhbGxvY2F0
ZWQgc3RydWN0IGlycWFjdGlvbiBzbyB5b3UgYXJlIGluIHByYWN0aWNlDQo+Pj4+IG92ZXJsb2Fk
aW5nIG9uIGNwdSAyIHRoZSBhY3Rpb24gdGhhdCB3YXMgYWxsb2NhdGVkIGZvciBjcHUgMS4NCj4+
Pj4gDQo+Pj4+IFdoYXQgZG8geW91IG1lYW4gYnkgc2VxdWVuY2UgaGVyZSA/DQo+Pj4+IA0KPj4+
IA0KPj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkg
bG9vcHMgb3ZlciBlYWNoIGNwdSwNCj4+PiBvbmUgYXQgYSB0aW1lLiBUaGUgY2FsbA0KPj4+IG9u
X3NlbGVjdGVkX2NwdXMoY3B1bWFza19vZihjcHUpLCBub3RpZl9pcnFfZW5hYmxlLCAmaXJxX2lu
Zm8sIDEpOw0KPj4+IHJldHVybnMgYWZ0ZXIgbm90aWZfaXJxX2VuYWJsZSgpIGhhcyByZXR1cm5l
ZCBvbiB0aGUgQ1BVIGluIHF1ZXN0aW9uDQo+Pj4gdGhhbmtzIHRvIHRoZSAiMSIgKHdhaXQpIHBh
cmFtZXRlci4gU28gb25jZSBpdCBoYXMgcmV0dXJuZWQgJmlycV9pbmZvDQo+Pj4gaXNuJ3QgdXNl
ZCBieSB0aGUgb3RoZXIgQ1BVIGFueSBsb25nZXIgYW5kIHdlIGNhbiBhc3NpZ24gYSBuZXcgdmFs
dWUNCj4+PiB0byBpcnFfaW5mby5hY3Rpb24uDQo+PiANCj4+IFJpZ2h0IHNvIHlvdSBsb29zZSB0
cmFjayBvZiB3aGF0IHdhcyBhc3NpZ25lZCBzbyB5b3UgYXJlIG5vdCBhYmxlIHRvDQo+PiBmcmVl
IGl0Lg0KPj4gSWYgdGhhdCBpcyB3YW50ZWQgdGhlbiB3aHkgc2F2aW5nIHRoaXMgaW4gaXJxLmFj
dGlvbiBhcyB5b3Ugd2lsbCBvbmx5IGhhdmUNCj4+IHRoZXJlIHRoZSBvbmUgYWxsb2NhdGVkIGZv
ciB0aGUgbGFzdCBvbmxpbmUgY3B1Lg0KPiANCj4gV291bGRuJ3QgcmVsZWFzZV9pcnEoKSBmcmVl
IGl0PyBBbiBlcnJvciBoZXJlIGlzIHVubGlrZWx5LCBidXQgd2UgbWF5DQo+IGJlIGxlZnQgd2l0
aCBhIGZldyBpbnN0YWxsZWQgc3RydWN0IGlycWFjdGlvbiBpZiBpdCBvY2N1cnMuIEkgY2FuIGFk
ZA0KPiBhIG1vcmUgZWxhYm9yYXRlIGVycm9yIHBhdGggaWYgaXQncyB3b3J0aCB0aGUgYWRkZWQg
Y29tcGxleGl0eS4NCg0KSSB0aGluayBqdXN0IGFkZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgdGhl
IGlycWFjdGlvbiB3aWxsIGJlIGZyZWVkDQp1cG9uIHJlbGVhc2VfaXJxIHNvIHdlIGRvIG5vdCBr
ZWVwIGEgcmVmZXJlbmNlIHRvIGl0IG9yIHNvbWV0aGluZw0KbGlrZSB0aGF0IGFuZCB0aGlzIHdp
bGwgYmUgb2suDQoNClRoZSBjb2RlIGlzIGluIGZhY3QgYSBiaXQgbWlzbGVhZGluZyBiZWNhdXNl
IHRoZSBpcnFhY3Rpb24gaXMgdXNlZA0KaW5zaWRlIHRoZSBmdW5jdGlvbiBjYWxsZWQgb24gb3Ro
ZXIgY29yZXMgdGhyb3VnaCB0aGUgSVBJIGFuZCB0aGVyZQ0KeW91IGFjdHVhbGx5IHBhc3MgdGhl
IGFjdGlvbi4gWW91ciBzdHJ1Y3R1cmUgaXMgb25seSB0aGVyZSB0byB0cmFuc3BvcnQNCnRoZSBp
bmZvcm1hdGlvbiBmb3IgdGhlIElQSSBoYW5kbGVyLg0KU28gcGxlYXNlIGFkZCBhIGNvbW1lbnQg
b24gdG9wIG9mIHRoZSBub3RpZl9pcnFfaW5mbyB0byBzYXkgdGhhdA0KdGhpcyBzdHJ1Y3R1cmUg
aXMgdXNlZCB0byBwYXNzIGluZm9ybWF0aW9uIHRvIGFuZCBiYWNrIHRoZSBub3RpZl9pcnFfZW5h
YmxlDQpleGVjdXRlZCB1c2luZyBhbiBJUEkgb24gb3RoZXIgY29yZXMuDQoNCkNoZWVycw0KQmVy
dHJhbmQNCg0KDQo+IA0KPiBUaGFua3MsDQo+IEplbnMNCg0KDQo=

