Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKd8EUYigmmQPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:28:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F09CDBF6B
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219369.1528255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJGI-00006H-E1; Tue, 03 Feb 2026 16:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219369.1528255; Tue, 03 Feb 2026 16:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJGI-0008Vj-A4; Tue, 03 Feb 2026 16:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1219369;
 Tue, 03 Feb 2026 16:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnJGG-0008VY-HH
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:28:20 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58683d58-011d-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 17:28:17 +0100 (CET)
Received: from DUZPR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::18) by AS8PR08MB9429.eurprd08.prod.outlook.com
 (2603:10a6:20b:5ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:28:10 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::10) by DUZPR01CA0015.outlook.office365.com
 (2603:10a6:10:3c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 16:28:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Tue, 3 Feb 2026 16:28:10 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:27:06 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:27:05 +0000
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
X-Inumbo-ID: 58683d58-011d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YTZgPIEz75NBIuHqZ56+MFKjsrtmsycwemvk7Js9LK8HQfIuIQTp4Rs5h9sKmerheqaCBb8ZacsJ6jk7CD4h4UBnPB+b6d0ii7ngplqoi9UlV0uYu9RwE+wyQeiA1XiQUh+MigrFBSykwmdmBjetZcTexyGI34BzE83cZd81o9C9vGNL9Is5TX5gRveNRKkBxmkcx/ntc5lVQlsKWggGdENbwSH3UODh+njMYz10YkobqUP1O5q3kHGTseL1GU6l5aaDUIjavwc10XN2QAhcYpTuqRyJGK9tkYM18iLrtlJhMsvf2ThWFN7g7x0qnsTkrF8b5/Eh7ppJDhD517q4ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndlUJPM5U2si1CrqH2NSJdSjz7TP+nLjnAauemSgZW4=;
 b=zEHohvpvT8EgHqYEwOVRK8gX4D+yROcanA8EPJh77gdfbBMajOkHBF8G9ogU/IPlKkqCuQgPDFRWsqc+UFZwBQDVd1yojiYB05ipkiPDwnday+/qGudVgMVu3E4ToZLbx4lv0FwWJDbF3X1BwU3cvEsT+3Tfhmm6Y1XaMHbOoIFBrW9JhG9WzggAwhConzpYjv2ZZvxdzDbDgbU/ntj3i/swCo/HrYBpdRqLJ1tMSiT6zN7My4eJPcE8n9lB19QXoo8z3OWVvI7RNsw2UYRiV6wBF+MaKz9IZ0+qrl/tf4HhUr4gpNiLhDCV+j4fhm1swMcARCPpw0rf9yF7F0vt6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndlUJPM5U2si1CrqH2NSJdSjz7TP+nLjnAauemSgZW4=;
 b=qMjFDTUwuGDb2+rGoRmHWP0sydy95LdBkWtWxieQbBH/XH3NTC8itIVsQLbMHVL+vILPH7L7oxM+sIoai5aLv5lrn6iKLelrUHSt/hlmJlhstY3eLE6towr5/kIlaLmL8U1BVtOinSvK/H/Se68Uxme50bX69yWwQza87Zz0W3Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejY2T1rYT/WJ7yxxJyxRO8yb3hLZrdivNQy1X9d7Ic1R3IYj8/8fm6mcYxRaVZCSlzy+36JHRGp0f6hnk8GbzJK8f77VtNqYGCUqPM9XnIgykwtFN0214FYOigpOxg4ou3RqQUbIv+TCKNyOwQWRKH8Xm4qbMs66ZPJIx0aNIDQuVK47bhza7u2Q33WBMuSWPgE1nkM/oZr7su+VO6TXxL4Hds/9n24lbsnLhxbCMN2xhZQmcugys89+NDmLC+4vliOV3wi90ucyhuO4fcTpD4mo/fkgE79iTHr92u22UBOguVb6q/9PIVOTkkBzm7X2NTrOSLEozsekGCGT5km9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndlUJPM5U2si1CrqH2NSJdSjz7TP+nLjnAauemSgZW4=;
 b=t0T/625Z5RxWI7O/8FldVL8coM2vqYPRw7y2CdZsnoTrqvg+PW3mhgxucxtz/abtCzxPgB3UttRaACN1r+lfDMTDxAJ3X1nVkC4ErGaChLxQiHi8uulKAYqP/3IyHJ5uY3Pxh1zVggHujS5CnMaSmnzHUGNvE/TSk5UvZTYy9RqHSU+9151UmpRwjMK/ZaDHQQ2I8vEke6RlUgm0xRaqiPmQ55DB7+9J3uKNOl5ZwGGv4vBKVnNdnWSu/fdOqRzG7lrTsL8zl1SesIg0zTMIECU/fDqLYJeEcExZQDynmXlt4HME1Nr98Wzmp/2DzpsLpbU6TapUAaP+S042S/zSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndlUJPM5U2si1CrqH2NSJdSjz7TP+nLjnAauemSgZW4=;
 b=qMjFDTUwuGDb2+rGoRmHWP0sydy95LdBkWtWxieQbBH/XH3NTC8itIVsQLbMHVL+vILPH7L7oxM+sIoai5aLv5lrn6iKLelrUHSt/hlmJlhstY3eLE6towr5/kIlaLmL8U1BVtOinSvK/H/Se68Uxme50bX69yWwQza87Zz0W3Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Topic: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Index: AQHclF8GgI2Kr/X/QEO5wnP/6sbdXbVwv1qAgAAn3QCAAEPbAA==
Date: Tue, 3 Feb 2026 16:27:05 +0000
Message-ID: <656D8BAE-7237-4B19-9508-09ACB0CB59CA@arm.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
 <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
 <88755b1b-a9c9-489a-80e3-e014244b108a@epam.com>
In-Reply-To: <88755b1b-a9c9-489a-80e3-e014244b108a@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM7PR08MB5381:EE_|DU6PEPF0000A7DE:EE_|AS8PR08MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ac2dfa-707d-4175-54fb-08de6341384d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NUpIU2xhTXlkQTRiN3MzU0ZYaFBRSTFsN2Y3dERHTVJVdnZqb0VGWDg5eGdB?=
 =?utf-8?B?c0IxQUVWQ1lOMVdFYUZJekpoZXkzYzMwZ04rcGQ4VGFvdGpOazlzWVNab2Fy?=
 =?utf-8?B?dXQzT25qMjdaWFBpQzVxMjlWcnVodHY1TGh1emtFL0xqbEJZTm5McERhNE9p?=
 =?utf-8?B?UnRObW1aM1lvd2tzUk0xUnlmakRjNG83ckx5bWNsdWg0YVVld3RielZrK3BB?=
 =?utf-8?B?LzZnZXFVMXd5S1N1YVVsR2xZQ0MweVowaWJLWG1tZ3JwaGFrZmdzR0x4Y0NM?=
 =?utf-8?B?Tm5ZditxQjF5L3dmK1prTXpwdUZHSmdsbTUzNDB0S3JXWmF1clBqTFVUVDlk?=
 =?utf-8?B?Q29MV1pjNkdjUFpjMGplL2ozNGhLYlFqcThocUljS21MNUFaWksyME00T2NN?=
 =?utf-8?B?TlFmQjRWaWJIVlFaZWtmMVhsODFMN3ltaTJZbEtJK1psNTlPN3NEVSt2eHRi?=
 =?utf-8?B?SUhBUmpXVmpoTHJZcUZEb1krSkhManFkeVk2YWxtYU5YWHp0Mk40ckxLWWpE?=
 =?utf-8?B?akFkeWJ5NXMzUHRPSlB5ckhkRkZQL2ExbmlYMjlNRzFubmFIMUpGT3hUWHBR?=
 =?utf-8?B?WDFuVTRWaGtYN0svajg0aXFWOERZWENiUnE2TEpGZ1JIN1ZHUVl2WjQzVmlI?=
 =?utf-8?B?V0Z2RmVYaXVKMlBxbitlZ2poeTZ3Zkk1dnFDWUFPd3ZNdlhBNjRUNFVkb1Vk?=
 =?utf-8?B?Z2ZvWHJFaFgxZGNwek5XNU5yRm5udXArQmlGS3Fpa2ZnL0dqRXQrN0UwbVli?=
 =?utf-8?B?QWw5bENxdzUxci9EcVF1eGRKVDJCZXplU0kvSTdlaDJYWVF4WkhPZ3Z4TzRk?=
 =?utf-8?B?RXd6MFAwNm54ZXpJV0V6WVMrVFZISk1NSjlMQ2tEbEhFSU9oQWFNbkY0TTJn?=
 =?utf-8?B?NngwTEgxaEdFZUg0ZVU3Sm1rcGxzb0Iyem5MWVNianhiWXl2U3NHR1RmTERV?=
 =?utf-8?B?ZXVERnllL1hQd3NGZU1LTytzWGh0d3dDUDQwMUdOQ3VOUlFFWmpZUkN0U05Q?=
 =?utf-8?B?cFo0KzFGUmJmRkZLS0RMQXN1dzFsZlpDNFBNQ1Q5MmY4K2xlZTZrbU92b3BR?=
 =?utf-8?B?bjIxQ2hSZmxBL0tqSzZzbC9IbWh4K2Nia3htM3cwUHBxdjhUUDNHa1h3QkIv?=
 =?utf-8?B?Vk03N3hKMk9DZUNHeUJGeHlVRzJBZitOTnJxbG9RSUw4MGpkK0hOMmwyYUZS?=
 =?utf-8?B?d1pjTzhMa0k5MFBiVm1ORnlHZk42SVRhcFRRa0J6SmpNaklaeWRoTUtSdTJ2?=
 =?utf-8?B?Lzg2MmFCZTUzL1ZIYmxTSExoc296cGI3ZUFxLzEzRGNCUDNSczRqOWg0L0Ix?=
 =?utf-8?B?aGhtRFU5anhmem9oenFyS2lNUkNmN0g4UmpVb3p2NlZkSU00eEwwbFhKYWN2?=
 =?utf-8?B?SEs1Tm05UDNTNUljbVA1dHhLQzNmekZydjRoTk5yN1pBamdQbS9rUkZ4ZFZw?=
 =?utf-8?B?OGdHVnM4aDNncjlqRW05allucC9temhNaFp6aVg4WnExempadDN5NHZTaUNw?=
 =?utf-8?B?aWlnVWVIdlJTdEQvS0s5bC9VdXJVcHZhNnA4cW9UQkF3ckNGN1g0L1NZS1V2?=
 =?utf-8?B?QndpWmtnM2FXeVROSytJQ3l4SUZJZWwyM2phajUrZEpLTVJXMENNNFQvaDBO?=
 =?utf-8?B?czJ0QlhtdmYwaXJhVGJQOTZ2R1daYWxyZkpWcFV4NVFJc3dpOXo1c1dwVFMw?=
 =?utf-8?B?VFlwUHRaaU42T0tuNWtES1g0eDBta2E0S1Q0bFFlYkRrTEpXdWJlMzFvNDFp?=
 =?utf-8?B?QTdMaUpSaG9LeGFoeEdrZytMT0daajhEeFVCYWtna0h0R0JyVHk2MW1aY09X?=
 =?utf-8?B?dVVqKzV3eXRnZlUzTlY1cGQya3NhRitLalZ3NXJscFhvVHc5ZGZYSXFJMjdy?=
 =?utf-8?B?dlpKcEdHVFVoVzNUUzNWbGliTFhueGgwTHFkQ2hQblJUMEVja014TTV0ZEV2?=
 =?utf-8?B?SzgxeG5MWURFQnY1cmF6aHY3OS9QdnFhQ3lUOG8vbXljWWlKeE13QkRNVFFx?=
 =?utf-8?B?QU9rRXlHR25wVkk5bWhqL0ZXMWpvWHRvN3pUT2F1RGp1TzdTYVFSeml2bFpS?=
 =?utf-8?B?MGJqZytPZ1JrQjFkZWRreStoWElua0dTNmhZN25wRll1a3dSVVVYWjVIM2px?=
 =?utf-8?B?L01DUys2ejl3ZmVWa2NQUWF3ZFQ3VzI5TFFzalhDRWFXL3JiMUttWGhGU25w?=
 =?utf-8?Q?FRE2EqcT8mslvUc7Yc9Au+s=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D4EA70C3C13174EB44501450988A211@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53e15cd1-cac7-4f0a-0ca8-08de63411184
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|7416014|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE9TZ0lXSWtvcTVFUkNCWWtzVTJwNFZwZVJVQmttcWNtaDNBb29oOWZDT1Vj?=
 =?utf-8?B?czBHRXRhenlLekkwWWNiWkEwUDF4MXg5S3lEdG9Xbm10SXRqQ082SVFwdzAv?=
 =?utf-8?B?SkREcEZCbG11Wmx5bVRQS2JGQVZmdGJQMmtQa2czYlRUZjY3THJSeXorKzE5?=
 =?utf-8?B?RUFYSkhjdFBScmozcXdqS2xyZ3NYeURhVll3Skt4UkxoSzhPeUEza3VnVUpO?=
 =?utf-8?B?ME1GS2NBMzE2VE9vVHZLOGFtTkZUY01Jb25vejUxUDlUeEN3NTNtekRmMG95?=
 =?utf-8?B?SGtzTmJhTW90R1k0L0ZnRDdzTWlUL3ZRdG1Pb2Z0djZoU2FhSUlVakJzUXdC?=
 =?utf-8?B?cFE3S2lISGJBUHRrMWpERUVEZmZNQjhjLy9RLzRMR0hTSi80cmhrdG9zc0dC?=
 =?utf-8?B?OGthQjRWcXUyYit5dTV1Y1RESWRHVi9QMzRWNFhPWFpxNUJUSTBORkp5czRC?=
 =?utf-8?B?UE1pQ1RqMUlzaHhmbUt0MWhBaFRid3BTWS9HVUVLRXJSUHpoaWw5NjlzK1pV?=
 =?utf-8?B?NWRmcGxNZUM4WW9CWUs4eC9tdTFzaEprUlNJOEdJQWVaMjUxaFhnR2pOYzJJ?=
 =?utf-8?B?cjFMY3A5TS9XUDFyUkx2TDl4U3lORTZ3bnhCTkRZNFFZOXp1cHowRGlqNlF4?=
 =?utf-8?B?TXpMcXJnV2FqQUl0OGc0dTV5eVRPakVGRDREdENVSzlPNld2OXlEMk9WVXVR?=
 =?utf-8?B?UkRmUW14aUtNcytpU0lVU1RsMUZwdlVJWjRrNk51bEhLVGh0dXdBaWh4ZXhR?=
 =?utf-8?B?ZGlGQ3EyVUowcWh6WFlqVWhGTm5vQ01ieWJ2SG9CaVo1WDM3Vy9ETXJFcGNM?=
 =?utf-8?B?Uktya2Z2SnJubEJxTGZ5Qm5oVXNsL2p1N0NFa0kzci93TmpjbVhkbmM5a1Nw?=
 =?utf-8?B?ZUluT2FheEJLWVdEMWRpeU9aa21iSVFrZ3lJWmdBLy9PN3lhZzBpemVGSjls?=
 =?utf-8?B?bURmL3QvVE14Y0RyWlJUankvVmt6QXdnOUNpMldpb3JTa1R6ajAzZWFtTU5L?=
 =?utf-8?B?ZTMvR05EZFFOdENqNkNhbGVFeHpCTnY3TjNrZCtBZ3N1UStFTTBlanZQZEZm?=
 =?utf-8?B?RFhOWlVXQXptNFhHWC9LdHNFeHlXQ1dPOHJjckc3NXJKK0VTenNweUVpZCt0?=
 =?utf-8?B?OVcveEwxdkFUOGNtRmhiVlBVQTYxbDY5ZWg1dklFRDdibnVMSWZOb0VkZnJt?=
 =?utf-8?B?ZytWVVdYVjUvdlZtbnRFSGdveFdDQWpaeGlVbVVxL1hGRUZhWFpDUVpPMXJC?=
 =?utf-8?B?UG9mNklYWUkyTVVHRDJSQlJvazNueHFVQlg2WGdVSUVBRDIxUWt3RXF2Z2Vr?=
 =?utf-8?B?OXBweDdRNkFQQ0xZV3ZodmVsSHhrWE94RGl2c3hjMFhLb1BLdS9hOUpSVEZ2?=
 =?utf-8?B?STRpeFdEczFtS2J4U0JYU3ovUGF5Q0lLa0hqTnYrZFhxNnlKNzhkNXVSay8y?=
 =?utf-8?B?NGFvNUIvanIzVk83T2U3aUNDTU9JWktGbklnNFJJN3daOUtvRWJOZnlEamhp?=
 =?utf-8?B?Q1BGK0xGcjBkZHE5ZU1CbVNDRm9QTGdQKy9Bb3VxQTlvVXYrY2JNZUZzVUp6?=
 =?utf-8?B?L3laelFmZ1VLNWRXZVBGUGJWY05FQXNhQ1Frd3NMVGJGNHh0MVpPUFYyL0tM?=
 =?utf-8?B?UnFXYVZaTHJPTWg5YUJCcVg3a3lmcFZLNHorT01qV1VmWGRFWW5Sd3R4WWk4?=
 =?utf-8?B?aG52dXJFYWZiTy9tNWtoTXlac1JRMFYwbGx4UE5ZdVNzYTU0K2tpdU1CZWFR?=
 =?utf-8?B?K0Q4OGdrUjZmL29PNTdpcEVZQ0tQd0RlSW8zbjRBS3piTklnV3BGbGpmVnUz?=
 =?utf-8?B?YmVaeVU5Q09FNkYvWW9iVEI2ZWFscEVDSCtFZVlZdEhrTGhHRFdocmwySXZ6?=
 =?utf-8?B?bitvaUFrMlJYR08rUHhFVkJzTHJQZFdkc2h0bm1Ub3N5M01pVVdvUXlDWWtD?=
 =?utf-8?B?Z3p2UkREQ09JYmV6YlR2ancvN25jSlFvc1RGa0VZRUYyUDlKM0gxa1d3czlk?=
 =?utf-8?B?U0FEbzZBcXlIU3Z6bERkeUN6cENFSTY2b0R0K0R2cGxScHRkemE1eExVaUE4?=
 =?utf-8?B?ek5saGs0ZVVXU3g2cko3N1VnQjVGZzJaNUJRdVFnd1lyMVdXbklyODJYenMx?=
 =?utf-8?B?eS9LQUN6RnVXRmxqT29WL3ZTRkpsa0ErSDhWa0ZhVlhZNWd5c3ZicXpPOU1X?=
 =?utf-8?B?WFhNeCs1M0xNN3BtaE1KbVdjNUVsU2xrWEFLSnpNQTdpL1Racm0zZENMSFd0?=
 =?utf-8?B?TnU4UUVIcUJRZWRuNzFxR3hndGdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(7416014)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zEFMZss8iN51Bv6N6ss2RcRU46olrGsHAXXSJmltntsHn31YlF6Vg2j/6A0uWV3niVIAxJPOv1uRalWFL1Bi1+pQUDEKP96G2r9aNX5Ih0VQbBQTkNhbQfPxAPj1LuLQz9vWnedvwzH8rnq65ZpEjgppBx1ngi0HhX3tHUnIXSj8NoXfvMPj82Bo5w+zr6Bln6flwbQprmqGCZ8gp6n2WTpax6zS2LdqDzV4+BJs0ha0rxvaFjaRPD9uaspnmH9RKVdmIJBW7c7jWnOknqs3GLr0hyliC5fcg8ukdHNch28SWyyy6SylqjKJ90Fo9pzGhoaJ+JPjBIRKKEdLipBm4JeJIxwmKHefnH8wSeUjmkMkNbjf5XlloodVxTcZJx3m0Ol0MYr2hBpLLAdnKfrj0rmYPVyfXw6rCRP00LRDdltp5Z5VUJpiphC86pV+1JJW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:28:10.0698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ac2dfa-707d-4175-54fb-08de6341384d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9429
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 6F09CDBF6B
X-Rspamd-Action: no action

SGkgTXlreXRhLA0KDQo+IE9uIDMgRmViIDIwMjYsIGF0IDEzOjI0LCBNeWt5dGEgUG90dXJhaSA8
TXlreXRhX1BvdHVyYWlAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDMuMDIuMjYgMTI6MDEs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBNeWt5dGEsDQo+PiANCj4+IFdlIGhhdmUg
YSBudW1iZXIgb2Ygc2VyaWVzIGZyb20geW91IHdoaWNoIGhhdmUgbm90IGJlZW4gbWVyZ2VkIHll
dCBhbmQNCj4+IHJldmlld2luZyB0aGVtIGFsbCBpbiBwYXJhbGxlbCBtaWdodCBiZSBjaGFsbGVu
Z2luZy4NCj4+IA0KPj4gV291bGQgeW91IG1pbmQgZ2l2aW5nIHVzIGEgc3RhdHVzIGFuZCBtYXli
ZSBwcmlvcml0aWVzIG9uIHRoZW0uDQo+PiANCj4+IEkgY291bGQgbGlzdCB0aGUgZm9sbG93aW5n
IHNlcmllczoNCj4+IC0gR0lDdjQNCj4+IC0gQ1BVIEhvdHBsdWcgb24gYXJtDQo+PiAtIFBDSSBl
bnVtZXJhdGlvbiBvbiBhcm0NCj4+IC0gSVBNTVUgZm9yIHBjaSBvbiBhcm0NCj4+IC0gZG9tMGxl
c3MgZm9yIHBjaSBwYXNzdGhyb3VnaCBvbiBhcm0NCj4+IC0gU1ItSU9WIGZvciBwdmgNCj4+IC0g
U01NVSBmb3IgcGNpIG9uIGFybQ0KPj4gLSBNU0kgaW5qZWN0aW9uIG9uIGFybQ0KPj4gLSBzdXNw
ZW5kIHRvIHJhbSBvbiBhcm0NCj4+IA0KPj4gVGhlcmUgbWlnaHQgYmUgb3RoZXJzIGZlZWwgZnJl
ZSB0byBjb21wbGV0ZSB0aGUgbGlzdC4NCj4+IA0KPj4gT24gR0lDdjQuLi4NCj4+IA0KPj4+IE9u
IDIgRmViIDIwMjYsIGF0IDE3OjE0LCBNeWt5dGEgUG90dXJhaSA8TXlreXRhX1BvdHVyYWlAZXBh
bS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgR0lDdjQgZGly
ZWN0IExQSSBpbmplY3Rpb24gZm9yIFhlbi4NCj4+PiANCj4+PiBEaXJlY3QgTFBJIGluamVjdGlv
biByZWxpZXMgb24gdGhlIEdJQyB0cmFja2luZyB0aGUgbWFwcGluZyBiZXR3ZWVuIHBoeXNpY2Fs
IGFuZA0KPj4+IHZpcnR1YWwgQ1BVcy4gRWFjaCBWQ1BVIHJlcXVpcmVzIGEgVlBFIHRoYXQgaXMg
Y3JlYXRlZCBhbmQgcmVnaXN0ZXJlZCB3aXRoIHRoZQ0KPj4+IEdJQyB2aWEgdGhlIGBWTUFQUGAg
SVRTIGNvbW1hbmQuIFRoZSBHSUMgaXMgdGhlbiBpbmZvcm1lZCBvZiB0aGUgY3VycmVudA0KPj4+
IFZQRS10by1QQ1BVIHBsYWNlbWVudCBieSBwcm9ncmFtbWluZyBgVlBFTkRCQVNFUmAgYW5kIGBW
UFJPUEJBU0VSYCBpbiB0aGUNCj4+PiBhcHByb3ByaWF0ZSByZWRpc3RyaWJ1dG9yLiBMUElzIGFy
ZSBhc3NvY2lhdGVkIHdpdGggVlBFcyB0aHJvdWdoIHRoZSBgVk1BUFRJYA0KPj4+IElUUyBjb21t
YW5kLCBhZnRlciB3aGljaCB0aGUgR0lDIGhhbmRsZXMgZGVsaXZlcnkgd2l0aG91dCB0cmFwcGlu
ZyBpbnRvIHRoZQ0KPj4+IGh5cGVydmlzb3IgZm9yIGVhY2ggaW50ZXJydXB0Lg0KPj4+IA0KPj4+
IFdoZW4gYSBWUEUgaXMgbm90IHNjaGVkdWxlZCBidXQgaGFzIHBlbmRpbmcgaW50ZXJydXB0cywg
dGhlIEdJQyByYWlzZXMgYSBwZXItVlBFDQo+Pj4gZG9vcmJlbGwgTFBJLiBEb29yYmVsbHMgYXJl
IG93bmVkIGJ5IHRoZSBoeXBlcnZpc29yIGFuZCBwcm9tcHQgcmVzY2hlZHVsaW5nIHNvDQo+Pj4g
dGhlIFZQRSBjYW4gZHJhaW4gaXRzIHBlbmRpbmcgTFBJcy4NCj4+PiANCj4+PiBCZWNhdXNlIEdJ
Q3Y0IGxhY2tzIGEgbmF0aXZlIGRvb3JiZWxsIGludmFsaWRhdGlvbiBtZWNoYW5pc20sIHRoaXMg
c2VyaWVzDQo+Pj4gaW5jbHVkZXMgYSBoZWxwZXIgdGhhdCBpbnZhbGlkYXRlcyBkb29yYmVsbCBM
UElzIHZpYSBzeW50aGV0aWMg4oCccHJveHnigJ0gZGV2aWNlcywNCj4+PiBmb2xsb3dpbmcgdGhl
IGFwcHJvYWNoIHVzZWQgdW50aWwgR0lDdjQuMS4NCj4+PiANCj4+PiBBbGwgb2YgdGhpcyB3b3Jr
IGlzIG1vc3RseSBiYXNlZCBvbiB0aGUgd29yayBvZiBQZW5ueSBaaGVuZw0KPj4+IDxwZW5ueS56
aGVuZ0Bhcm0uY29tPiBhbmQgTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPi4g
QW5kIGFsc28gZnJvbQ0KPj4+IExpbnV4IHBhdGNoZXMgYnkgTWFyayBaeW5naWVyLg0KPj4+IA0K
Pj4+IFNvbWUgcGF0Y2hlcyBhcmUgc3RpbGwgYSBsaXR0bGUgcm91Z2ggYW5kIG5lZWQgc29tZSBz
dHlsaW5nIGZpeGVzIGFuZCBtb3JlDQo+Pj4gdGVzdGluZywgYXMgYWxsIG9mIHRoZW0gbmVlZGVk
IHRvIGJlIGNhcnZlZCBsaW5lIGJ5IGxpbmUgZnJvbSBhIGdpYW50IH40MDAwIGxpbmUNCj4+PiBw
YXRjaC4gVGhpcyBSRkMgaXMgZGlyZWN0ZWQgbW9zdGx5IHRvIGdldCBhIGdlbmVyYWwgaWRlYSBp
ZiB0aGUgcHJvcG9zZWQNCj4+PiBhcHByb2FjaCBpcyBzdWl0YWJsZSBhbmQgT0sgd2l0aCBldmVy
eW9uZS4gQW5kIHRoZXJlIGlzIHN0aWxsIGFuIG9wZW4gcXVlc3Rpb24NCj4+PiBvZiBob3cgdG8g
aGFuZGxlIFNpZ25lZC1vZmYtYnkgbGluZXMgZm9yIFBlbm55IGFuZCBMdWNhLCBzaW5jZSB0aGV5
IGhhdmUgbm90DQo+Pj4gaW5kaWNhdGVkIHRoZWlyIHByZWZlcmVuY2UgeWV0Lg0KPj4gDQo+PiBJ
IHdvdWxkIGxpa2UgdG8gYXNrIGhvdyBtdWNoIHBlcmZvcm1hbmNlIGJlbmVmaXRzIHlvdSBjb3Vs
ZA0KPj4gaGF2ZSB3aXRoIHRoaXMuDQo+PiBBZGRpbmcgR0lDdjQgc3VwcG9ydCBpcyBhZGRpbmcg
YSBsb3Qgb2YgY29kZSB3aGljaCB3aWxsIGhhdmUgdG8gYmUgbWFpbnRhaW5lZA0KPj4gYW5kIHRl
c3RlZCBhbmQgdGhlcmUgc2hvdWxkIGJlIGEgZ29vZCBpbXByb3ZlbWVudCB0byBqdXN0aWZ5IHRo
aXMuDQo+PiANCj4+IERpZCB5b3UgZG8gc29tZSBiZW5jaG1hcmtzID8gd2hhdCBhcmUgdGhlIHJl
c3VsdHMgPw0KPj4gDQo+PiBBdCB0aGUgdGltZSB3aGVyZSB3ZSBzdGFydGVkIHRvIHdvcmsgb24g
dGhhdCBhdCBBcm0sIHdlIGVuZGVkIHVwIGluIHRoZSBjb25jbHVzaW9uDQo+PiB0aGF0IHRoZSBj
b21wbGV4aXR5IGluIFhlbiBjb21wYXJlZCB0byB0aGUgYmVuZWZpdCB3YXMgbm90IGp1c3RpZnlp
bmcgaXQgaGVuY2Ugd2h5DQo+PiB0aGlzIHdvcmsgd2FzIHN0b3BwZWQgaW4gZmF2b3Igb2Ygb3Ro
ZXIgZmVhdHVyZXMgdGhhdCB3ZSB0aG91Z2h0IHdvdWxkIGJlIG1vcmUNCj4+IGJlbmVmaWNpYWwg
dG8gWGVuIChsaWtlIFBDSSBwYXNzdGhyb3VnaCBvciBTTU1VdjMpLg0KPj4gDQo+PiBDaGVlcnMN
Cj4+IEJlcnRyYW5kDQo+PiANCj4gDQo+IEhpIEJlcnRyYW5kDQo+IA0KPiBDdXJyZW50IHByaW9y
aXRpZXMgYXJlOg0KPiANCj4gLSBDUFUgaG90cGx1Zw0KPiAtIFN1c3BlbmQgdG8gUkFNDQo+IC0g
R0lDdjQgKHdlIHdpbGwgZm9sbG93IHVwIHdpdGggYmVuY2htYXJrcykNCj4gLSBTUi1JT1YNCj4g
DQoNCk9rIExldCdzIGZvY3VzIG9uIHdoYXQgaXMgYWxyZWFkeSB0aGVyZSBhbmQgYmVpbmcgcmV2
aWV3ZWQgYmVmb3JlIEdJQ3Y0Lg0KDQpJIHdpbGwgZm9sbG93IHVwIGFuZCB5b3VyIENQVSBob3Rw
bHVnIHJldmlldyBhbmQgc3VzcGVuZCB0byBSQU0gaXMgYWxyZWFkeSBhZHZhbmNlZCBzbw0Kd2Ug
c2hvdWxkIGZvY3VzIG9uIGZpbmlzaGluZyB0aG9zZSBmaXJzdC4NCg0KQ2hlZXJzDQpCZXJ0cmFu
ZA0KDQo+IA0KPiBNU0kgaW5qZWN0aW9uLCBkb20wbGVzcyBmb3IgcGNpIGFuZCBQQ0kgZW51bWVy
YXRpb24gYXJlIGxvdyBwcmlvcml0eSBmb3Igbm93DQo+IA0KPiBTdXNwZW5kIHRvIFJBTSBpcyBo
YW5kbGVkIGJ5IE15a29sYSBLdmFjaA0KPiANCj4gU01NVSBhbmQgSVBNTVUgc3VwcG9ydCBhcmUg
bWVyZ2VkIGFscmVhZHkgQUZBSVUNCj4gDQo+IC0tIA0KPiBNeWt5dGENCg0KDQo=

