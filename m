Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C236F3EB17B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 09:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166667.304222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mERcQ-0002oF-E9; Fri, 13 Aug 2021 07:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166667.304222; Fri, 13 Aug 2021 07:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mERcQ-0002lB-Ad; Fri, 13 Aug 2021 07:28:42 +0000
Received: by outflank-mailman (input) for mailman id 166667;
 Fri, 13 Aug 2021 07:28:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9ox=NE=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mERcO-0002l3-Vo
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 07:28:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a788e748-ae88-43fd-83de-4106404e2679;
 Fri, 13 Aug 2021 07:28:39 +0000 (UTC)
Received: from AS8P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::15)
 by AM9PR08MB7276.eurprd08.prod.outlook.com (2603:10a6:20b:437::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 07:28:28 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::a3) by AS8P189CA0029.outlook.office365.com
 (2603:10a6:20b:31f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Fri, 13 Aug 2021 07:28:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 07:28:28 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Fri, 13 Aug 2021 07:28:27 +0000
Received: from e1b22bee447e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC04CE73-0EB8-47D5-B212-13E34C2C7B95.1; 
 Fri, 13 Aug 2021 07:28:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1b22bee447e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Aug 2021 07:28:17 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0802MB2198.eurprd08.prod.outlook.com (2603:10a6:4:84::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 07:28:15 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 07:28:15 +0000
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
X-Inumbo-ID: a788e748-ae88-43fd-83de-4106404e2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci9TPY2/u/eaEnThdJ/q0nnOONaG/rLVeodMy2M2xk8=;
 b=l6xTAJbzsVNEGaWdn5sqP7xArrGXa1Oha5rRn/AcugVSg+7tO73jHvyH8LgC9yeQE1biCbPJ8/JqWSPblOqEwMBk7NnUJSWU8EXnZPSjRF6c1WdjCwjeTryRdOilyXlx9m+tzsHoAiwgs0B22zN/il+u70J/xRoFd2b17xe7Svo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZhDCgjZ1Z77rvM37EK6Dp/BpM5aozLMR4lQ+TN03Xh4ZvmdboxXzeQ0NOoM7x/BtQm7P4QjR3XSjjIiTsePjJSJUgbYZ9QiLV9oJZUpcMmEXuqh0mZbDV6ImRG+TnvOTJ3t+bDVFRdLM3y1R7p8LArWpMOd4J3NQXY70UQgczn9Njyv6UM7BqADpgI+MIYQnbnCMw+rzSwuk/tbTNro7vLY+JUJ2uD+OQgPTBkiL8SYA24/ft9iBv6Nrd7FfI6Xmin6GOReytJ5zXOfXKKXXE+fKs0wjNJaKCdVjPPfc0BEjDdvOfrW1fpCy0uQilAe1igctyGji2Kc6odBPflmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci9TPY2/u/eaEnThdJ/q0nnOONaG/rLVeodMy2M2xk8=;
 b=MTKQdvkuAmvHTDK0FjnuHQtH2cb3MKnRozkQWZeISkCRn0BoS/cNj7R38GHE3UgSZwGieV5B2d1sa9vt/CiU4qO0v/J6ogCqw8a3plO6BvigQ49hv0r5got1WuCa+CndrtFuP5aQLfK0p4l8tyJD5W2rLiO0m1f/bxWmgCBeFQrxkk+jFrDjLcyPUP5sPX04DOkwoKDi+mUpqsKJuDwuJVFdDVs3ALzqUcDSlOxaM2ENDAXB2PM8uuLMy5AY8xMwoHw4UWI0MYRmnqBftWSPIr2gkohQwfdrLq0srrMv5kj6RpuB39K/902cpEcSTj/pu7l/yq0YoD4yw633GBFUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci9TPY2/u/eaEnThdJ/q0nnOONaG/rLVeodMy2M2xk8=;
 b=l6xTAJbzsVNEGaWdn5sqP7xArrGXa1Oha5rRn/AcugVSg+7tO73jHvyH8LgC9yeQE1biCbPJ8/JqWSPblOqEwMBk7NnUJSWU8EXnZPSjRF6c1WdjCwjeTryRdOilyXlx9m+tzsHoAiwgs0B22zN/il+u70J/xRoFd2b17xe7Svo=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 06/40] xen: decouple NUMA from ACPI in Kconfig
Thread-Topic: [XEN RFC PATCH 06/40] xen: decouple NUMA from ACPI in Kconfig
Thread-Index: AQHXjpsj2PxHFai2b0GMDOvdzCQyuqtwGE+AgADzwpA=
Date: Fri, 13 Aug 2021 07:28:15 +0000
Message-ID:
 <DB9PR08MB685796AC99CC892AB4FAA1979EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-7-wei.chen@arm.com>
 <5ad90b2a-c440-3488-fe2d-fd89db1ca3b3@xen.org>
In-Reply-To: <5ad90b2a-c440-3488-fe2d-fd89db1ca3b3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E63C9A6EDFE62743BA5DA0DFD3105361.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cd009585-613f-4b1a-e11f-08d95e2bf1ed
x-ms-traffictypediagnostic: DB6PR0802MB2198:|AM9PR08MB7276:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7276D727D148326838E92D9E9EFA9@AM9PR08MB7276.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LLONNTcqNUFMcLmRcnr4hnFebAqTsdh51Rj62qVaWn6Bu+mnqLVb94+ekQb1QJJzSXPK9G7h4imqmzuE1BQrLku0ZoxhpkLsxnEntj0VeaHIUHiZTPbdkyJOOEBfz8AHg9p3/BDhUIcEj8OH4JiVRfDKBNdzXBVT7at8uS/lrVkR1BqV0GdXx6JxUJmwM+JnB3CAZODdbAjKf9hnJifUikB5McmRhPEaJiRcZqlG9oHDcoCsRvb2G3KVP2sFZaB36kD0AjZIxQFqPgFpxv59n862qJsy3HHb1ThxkslcgMur2ekm0npCw0m5kp2eSluxOuITTkv+Tt3ElmYbBuLYUvSJZh0Diejxgml0KHYp6FkeMisCubhNzasDFQtqYo9rSn2is7nNaRQzAyiCEWSAOHRUuqCNbgj5eXE5ba438Qr6SYi0s6jm+VheBNiEDnUwMnzpApqcJmwv5fE8dLqG+U8AXX5WgAsCS1Ch0utgfQEDbXuyc4CmjEXcebnTaiDh971UAOQiIQNGa5sxGaCmkfCgc9EDlDYa8j6t7RFaDXRkSzL2tUrL9ttBllZbB/i26jG9mLjSePXMVKWEZkp8HCsIfNAu5pv3trvgat0PF4MXAvj02YXuo59aOduFcNpHqPK3hfcBfsVK0fJgs2ush8KCgVWZkfphNWpxjeSUG0il4L9RW5+87jFh0Cv6wHtCuxUdFB5Qko05p6pGIh3GUg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(8676002)(122000001)(478600001)(8936002)(316002)(2906002)(4326008)(110136005)(38100700002)(71200400001)(83380400001)(5660300002)(55016002)(26005)(9686003)(33656002)(76116006)(86362001)(66946007)(38070700005)(7696005)(52536014)(66556008)(186003)(66476007)(53546011)(66446008)(64756008)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blVQT0w1NGQ2aVhQMHE0Q0wxMEU4NlVISXl1QzVHeEg5NG9lcC85UnhBZVR4?=
 =?utf-8?B?TFQrMEdyV0RwN0t2bGplUk02WWg3ZjBTKzdXYi9heWZ1SjVUSGdZMUtwb0xi?=
 =?utf-8?B?ZHQ5K200bEU1Nm5NL2FkU2hiWDJhUldMUUtONGxZT3BSMXBNRVdiVjZFWU4y?=
 =?utf-8?B?andtVzB4U2NkSmxWdmJFS0NhcEp4Q3VKVnBJMDJnaXFsTWg1bnB6RFVQc0tz?=
 =?utf-8?B?dGloVkw4Y1ZaTGN3L1FEdHNpcDF0Q1ZMOGFXdGViUVRkdWRWSnZpMFB3ODFW?=
 =?utf-8?B?a0hMckVxejcvenVxVFVmWlFwMGZnbFE5bWhtUTNEdUNkRkd4ZEUyOHNYSGtU?=
 =?utf-8?B?ai9jNUZiZDdPV20wSXZaU3ZPVXhEc0xoUmRZOXRzbGZrU0hiM1NMemdYckE3?=
 =?utf-8?B?UmZXaVVXU3k1azdaT2E3dkhQUFJqdzQ5RUFKT1lHMzZJYkR6UDZlTURGWnlZ?=
 =?utf-8?B?K2FkU3BWY2JDNGhSdmRNakRkZUNtSmFkTGN0TDh3UjVpSnJVMTJrRlFWdFYy?=
 =?utf-8?B?dENLUjZuOHBlVFJaZnhnVnduQkxvN3c4cEtkT1J4N2NlcnNsOVJDckhOMXNa?=
 =?utf-8?B?MlZyMWlra29xclJCRW0yOVhObjBwTGQvUUVvV0NHV2lneXdzcGZJUE52UXl6?=
 =?utf-8?B?SUdHeHRRaWt3ZDc5cnNRRzRlcVg5ZmsvZ0Q1TjVyb3FybGRrUHBVNGRPNzBU?=
 =?utf-8?B?RHhucVQ2S0VkQjQ3ZEJEUk5aQzZ0M3RRM2hpUFFndTVoaTBCTXNGT21pTTBD?=
 =?utf-8?B?a0x6Njd2aGsyZWZkd1ZhTmQvVkpJdXlYZy9YemowaGNRSTZpMGpIa3U1MW1R?=
 =?utf-8?B?cVVnY1ZnWDNrS3Arc3ZtWERWR2FjVVZZY0lkSlFQWEh3RTJDdnp2QmNYcCtD?=
 =?utf-8?B?bU9RLzh3R1lsR2ZsZ1Jqc0ZtYi84VkZHWVlTdk93VWtRYXMvdU9pdlg2bGp0?=
 =?utf-8?B?b2FrVWZ6am91b1FmVEZiRE1iU3IrMXpEdGpuVldodnlOZGptTHpXRE12S3N2?=
 =?utf-8?B?OFh3bmJmVTgwNVNlNXppV3IxRDdGSzkwbS9HSkp3ZDlRMjlMUzNiQmR5Z00v?=
 =?utf-8?B?TUJzQW84Tytrb1VUbTU4M2hHeTV3RWhndFVWWTVORU1qS0tsbUQ3dUpKOVFC?=
 =?utf-8?B?d3NCQnBwZE5ZdmxEVDRQUDFGTTljcWJ5Z00ybysvMWp3K0UzOTdqQURUZjdU?=
 =?utf-8?B?VWxNa282MWdBVTUra0t2YnhNKzBmZDRDWGR6Q2hGWkFiS0o2WGpXT1EwdWJ4?=
 =?utf-8?B?V2t2d3k3WmxXMFBNbFk1K2VOOWYwdGtnM2JLT29icjBqZWo4elh3aVRuY3FJ?=
 =?utf-8?B?dmVtRC90TjVKdFpwU2ZyeW9PNmQ3WllPMWduY2dTMUZTbDdUeUxpMStlTjFW?=
 =?utf-8?B?bXhZK1VGOGVyYVkxL3ZDMmRWZFEzRnhjVnYrcUc0MFlEVWh4M0xReW9GRnRp?=
 =?utf-8?B?ajdPNWsvWEtLbkFqM0JBeHFQUTJPR3R0aDcwU2RQWmc0bmoxdFJVamlQL085?=
 =?utf-8?B?ODZOWGIrSlVUcjBMM2xLQnhJREdNYUNnZHhLeWhaOWtZQTJrTTBCQlhKL3lm?=
 =?utf-8?B?Q2V1MldZMHRqZ0ZXaHBEWGdzdGJmdHd0RUV3OHhGdFdRd1ppRHhuVjVCS3Vu?=
 =?utf-8?B?Z1h2c0Y3eHYyMi9GcmxyajFrS3VZby9IQ0FKZEFJakIrUS9iZUtoMkxYZXNk?=
 =?utf-8?B?UWcvWVlZMFl0SVJxV1p0ZVR5ampDK2ovMGNiWUY4VFpuaUFKenU5QUFRT0xt?=
 =?utf-8?Q?zB0xJ0SlUdbKfbZExqy/7o5fT4IdnkbadPaqhz5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2198
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99f96d55-d911-4515-6f14-08d95e2bea19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZaMTyyrbVvQtYAo0OC6WeURoAXQDYA5DkkrhtW52HhUMSNPhwWf9aKyUH/zwCvTqLai76YpesR7mP/T7jlcr2TgN7pZs7TCv4HvijUONcDm6jg+OwDGdhcKmZOFgHvOEJwVEzK4vV55drd7a9NQdJLBt1N2m1T9OZrmNkiT6VpEuLqzIcLXZfKROnnWfx50cmYSP6mVHeyId7U0KcNICN4HspwGIQuC87Kkef4e9S3nWMmvsIwtt1HFqFs3E2MOD+KoBJPHhrzLyVTqjzNXloPNJTZV9jBSWL7y5yMT3jMOX1r8EWheLq0Bt1ARRcGAOKs+hNg07RRXepmap1KZfuslVpuFYSg9aVdnq5FxeDZTqmVKdMHOxfkCcOg/hlKJiEzMVQ4emL3T27q5q8vVW4o0fYVQJaXcU7pWOwa9ar7jDkvOPgNA0y+JDoQgdmtrYWtd/r3lKEZQIr0O1sH3jSkIDtBYXvhJaOrE2J8TvunsJZJF9ZFqxIF9bMQANx9ILzqVY/rOUS+3unXGr5c/C789ClGdyd4WKekijVnbv1YAw2PJkdtAckQtkSfT0hfP8nSh97aPL7EZw/rIVVi/wFAwSmFjpsVenByqFUEVeSaRhshoJpc61DggF5j0RYZhDYsRldAD/MH2c8AaO/ntXMe3MVB/+EAjVyF1yie1h9e7x8zKh6hXGqFfaJPg8jJ1NpckaIj+C9fvs0h90ak1h2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(136003)(36840700001)(46966006)(110136005)(47076005)(36860700001)(186003)(33656002)(52536014)(316002)(336012)(53546011)(6506007)(9686003)(7696005)(26005)(86362001)(82310400003)(55016002)(5660300002)(4326008)(2906002)(70586007)(70206006)(83380400001)(8676002)(81166007)(478600001)(356005)(8936002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 07:28:28.4565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd009585-613f-4b1a-e11f-08d95e2bf1ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7276

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMTPml6UgMDo1NQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAwNi80MF0geGVuOiBkZWNvdXBsZSBOVU1BIGZyb20gQUNQ
SSBpbiBLY29uZmlnDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAxMS8wOC8yMDIxIDExOjIzLCBX
ZWkgQ2hlbiB3cm90ZToNCj4gPiBJbiBjdXJyZW50IFhlbiBjb2RlIG9ubHkgaW1wbG1lbnRzIHg4
NiBBQ1BJLWJhc2VkIE5VTUEgc3VwcG9ydC4NCj4gDQo+IHMvaW1wbG1lbnRzL2ltcGxlbWVudHMv
DQoNCkdvdCBpdC4NCg0KPiANCj4gPiBTbyBpbiBYZW4gS2NvbmZpZyBzeXN0ZW0sIE5VTUEgZXF1
YWxzIHRvIEFDUElfTlVNQS4geDg2IHNlbGVjdHMNCj4gPiBOVU1BIGJ5IGRlZmF1bHQsIGFuZCBD
T05GSUdfQUNQSV9OVU1BIGlzIGhhcmRjb2RlIGluIGNvbmZpZy5oLg0KPiA+DQo+ID4gSW4gdGhp
cyBwYXRjaCBzZXJpZXMsIHdlIGludHJvZHVjZWQgZGV2aWNlIHRyZWUgYmFzZWQgTlVNQSBmb3IN
Cj4gPiBBcm0uDQo+IA0KPiBUaGUgY29uY2VwdCBvZiBwYXRjaCBzZXJpZXMgb25seSBhcHBsaWVz
IHRvIHRoZSBNTC4gT25jZSBjaGVja2VkLWluIHRoaXMNCj4gaXMgb25seSBhIHNlcmllcyBvZiBj
b21taXQuIFNvIEkgd291bGQgd3JpdGU6DQo+IA0KPiAiSW4gYSBmb2xsb3ctdXAgcGF0Y2gsIHdl
IHdpbGwgaW50cm9kdWNlIHN1cHBvcnQgZm9yIE5VTUEgdXNpbmcgdGhlDQo+IERldmljZS1UcmVl
Ii4NCj4gDQo+ID4gIFRoYXQgbWVhbnMgd2Ugd2lsbCBoYXZlIHR3byBOVU1BIGltcGxlbWV0YXRp
b25zLCBzbyBpbiB0aGlzDQo+IA0KPiBzL2ltcGxlbWV0YXRpb25zL2ltcGxlbWVudGF0aW9ucy8N
Cj4gDQoNClRoYW5rcywgSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IGxvZyBpbiBuZXh0IHZlcnNp
b24uDQoNCj4gPiBwYXRjaCB3ZSBkZWNvdXBsZSBOVU1BIGZyb20gQUNQSSBiYXNlZCBOVU1BIGlu
IEtjb25maWcuIE1ha2UgTlVNQQ0KPiA+IGFzIGEgY29tbW9uIGZlYXR1cmUsIHRoYXQgZGV2aWNl
IHRyZWUgYmFzZWQgTlVNQSBhbHNvIGNhbiBzZWxlY3QgaXQuDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

