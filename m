Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A47CAB7A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617662.960478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOa6-0005BS-6C; Mon, 16 Oct 2023 14:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617662.960478; Mon, 16 Oct 2023 14:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOa6-00059m-2V; Mon, 16 Oct 2023 14:28:30 +0000
Received: by outflank-mailman (input) for mailman id 617662;
 Mon, 16 Oct 2023 14:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fsKw=F6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qsOa4-00059g-O7
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:28:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe12::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44aba4bd-6c30-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:28:26 +0200 (CEST)
Received: from AS9PR05CA0074.eurprd05.prod.outlook.com (2603:10a6:20b:499::28)
 by DU0PR08MB9509.eurprd08.prod.outlook.com (2603:10a6:10:44f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 14:28:24 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:499:cafe::d) by AS9PR05CA0074.outlook.office365.com
 (2603:10a6:20b:499::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34 via Frontend
 Transport; Mon, 16 Oct 2023 14:28:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 14:28:22 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Mon, 16 Oct 2023 14:28:22 +0000
Received: from a241823e5d2c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2754960-43DD-404E-974E-4442AF540A7C.1; 
 Mon, 16 Oct 2023 14:28:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a241823e5d2c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 14:28:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB3PR08MB9011.eurprd08.prod.outlook.com (2603:10a6:10:431::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 14:28:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:28:13 +0000
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
X-Inumbo-ID: 44aba4bd-6c30-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtrQLvZpZ5xzU0hZv0SZXceP0Jv8dq5/1Vh2eapkjSA=;
 b=O0IklEHn9eovPkW9+/eukeOIW+EoKt5fEddF8t4Hr7DQLZ/G0F3NvEDoekQH+cYQBguDvLoo5N+9hTkwDey6aRTHh9dP2bLpCsdJPfwDg62AQeLUqI36rA2pkwF9FBxk9ffdWnzHdPY+CMT/xcDGbHUsO/eIFxv50mhZ+Nw+Eg8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b0d5164131b7c4e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npTtcCn+T9H+cFdBgikkuyaTaiq2+KpIUYLapDwPxXVbqVk/MYAdZd8LknrmuBdKhypnOU9G2J52o+E4gJagHFwDmG4sU1d+E/AHS4khCYcI5R/72fewF8okbqAUYfWf7jsuzKdv3bOb4znrj1MFdUQqB6kLqR7aqPSsc6W7uH3Becg/dDU116u/WamjKXWYb3WBuQYjviw624KUcUUuztQFaa1dKWO6eSgbrbrWdosBniwK7d5s0WtH4vNZZzXchhNJAKJiSzWvlpiM9xKGamK4lRU8tQYh8GpIGYlr4leHGgn/fMtbrRKgaQso+NQKjU8jeNq2RDd4b4WP1lU+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtrQLvZpZ5xzU0hZv0SZXceP0Jv8dq5/1Vh2eapkjSA=;
 b=D9yGYDrxzeqxYqjJm9PO9MjEGKO9K/P1xnmJ4tPRbolYrpSwv6rSVUCToLOc+tCBJI3Q/kiBmtYwCL07iodqsVJwLGqunE7F1iHckhwPqL6EAFu19oE5w/2zWNcxiWNpMll14t21McIIaKdda0Umv8x5t9Z+YOtwO0ChEGyqZzV9oP9lqSulLgIWU/LlEaOKoMsLqFn6RdXTREboz2lZKwOff+RMTPiGz+aUNzP8+w5if6tE4g48bVY8lFax0F1QRfGPbq3lntCLpOFDR/d7pI0ZReLj/lyT8LthoZUpIHjjKE90RBFHs2DdCNWqwEOFoWZ/z+H7UCO8579Gi5uzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtrQLvZpZ5xzU0hZv0SZXceP0Jv8dq5/1Vh2eapkjSA=;
 b=O0IklEHn9eovPkW9+/eukeOIW+EoKt5fEddF8t4Hr7DQLZ/G0F3NvEDoekQH+cYQBguDvLoo5N+9hTkwDey6aRTHh9dP2bLpCsdJPfwDg62AQeLUqI36rA2pkwF9FBxk9ffdWnzHdPY+CMT/xcDGbHUsO/eIFxv50mhZ+Nw+Eg8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, "leo.yan@linaro.org"
	<leo.yan@linaro.org>, Xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Topic: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Index: AQHaADhLetLGz4GvX0qAhZnpE9HtkrBMcc4AgAADlICAAAMQAIAAAQ6A
Date: Mon, 16 Oct 2023 14:28:13 +0000
Message-ID: <AAABDB6E-5C71-4393-8E88-8BE34798AE1B@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
In-Reply-To:
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB3PR08MB9011:EE_|AM2PEPF0001C710:EE_|DU0PR08MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1526f0a7-563e-462b-6673-08dbce5426dc
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HeZB3vR55r1x1072miqWP+VqptcY6LYjbE/7bq//UyNQKZ9DSYbwKUiERGyq1v5Ynyc2Lfc5/ga5S9bGVu6EfCM73bF0QDXUBRTbWAmSxYm4lhRbHWzL6wL855KZDSrmX8SzCK1e41FRJLKhSVF0NcvCq7V+lFsdsMz1jOVl4yu8f8YMprl/PfvreCfPYvlN3IGDD8+lBSAJUsUz33kUvqNDcvuq8n+7abT9XklYIrA6UEb7lt3RFEEsdCvl2stjYDHt3E+Dkec97NGSwA5IAFtRc2j4DVQlGwP/kIE9sfKbQoaX3lMV3xek2ZjgsI56/7+4TgpXI/xZpei+9sBpj7JENeQFzTuKYxavXqNQgbaExaeCjmryO284AJbtYf6s38blDDEm0aqfLyMBQ63GqucDe7WpLNyjK1PH8IDRZyxGoXLDGDArIDP0tfOo8SQC9jrGBu+8zQuZa2sOFX3j7MlG8bMwKkq+AQtZtLmlcUNNVR6c024mddAlLaHTZqVJE/rECakFYBPQB0gmM+lFwEc+TRZ6v9FwsjvhEjeo3cAF7hAERMrttcq1VeAxTQVL6sCrlC5yYajAKCbVqbFDYxeCVNa/EmdaRlyRRzhQJ1nSJhGQe6NxuubpH53w2wRoPKmTnRGBnSr1GEDi299K6GSEsLZBxdJfaw3yUYNfJog=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39850400004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(6486002)(66946007)(91956017)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(71200400001)(6916009)(86362001)(38100700002)(2616005)(6512007)(26005)(6506007)(33656002)(5660300002)(41300700001)(36756003)(122000001)(38070700005)(316002)(8676002)(8936002)(4326008)(2906002)(4744005)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C13BD100036A641BDDAF9F0AB92AF33@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9011
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d03d599-2b3d-49fe-388d-08dbce54219a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yuv5nzHOCb4hS5UnYqe4J1tajBMJvi2l3t3PDGn9SYaL4os6k/waUtkRCYU6w9I+ADuypbtg0KAtmwJj4KW3RRvu6cnsobaVHZtkPNK8oXCoL1Mt/EiRcO2cAFKj1FB3q/fmJSJoXC070zepYuwdX31qaDeQTVMt2aaZXqkldoJSIyO46AZYt04apOviV4doHSna5L2Iz/XVHDAC10R008vXyxD7Wd9MGdQIJmGdZfIsKHd7rDzx1NdXupnX6v1+yGPnc8nKaPsuGz7KlAKnWqY4F2OUDZTYHt4t9kKF5kRfK2JF+rGoGoWjVt2GbT5wHum8lXFeRQg0E9/rXDx/h8nNWcj/jd7oOo/c9iYJx5Kydyl2G3FQlB+W+PflYui8OhJvIr9aAqs7IS+MefjJd9jLgUx4WWcDQr1Y1JbAJtK4U/bpCxNHaqmybRjw9BKrscVglCBDGn1th/hRx7r/wch+gdBEFjfs2LJdVx/vVsGJWl5mamq6LMacP7/mnumOBOGRPHDmdvdS+249TWMmmsKjcDZrNsPz2dabOIi6OU3/Z10HY20ftJGNux4x3EsRfxdFlVN+fV3Q2zmtox+vPpZMGamXHyZsSp1FQMj9xl9ZUWqoYxkS4rMAu9XaHWtzlH8SY5fAtRZ4yl0nbHLHHg47pOxDXC3zS5DOrE41zkDYh5DYn76ObJZv9zDEe18UhoWijTcMcJ8V6IhJH2/WzkXLdfjrhP3OtLm4f/Md3lI5eHwsJVHBt5WPs+6OB5rKD7luLAM5W3Z3ZjOqtKOlvg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(346002)(376002)(396003)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(70586007)(316002)(70206006)(54906003)(26005)(336012)(36756003)(6512007)(2616005)(356005)(81166007)(47076005)(82740400003)(86362001)(33656002)(36860700001)(40480700001)(478600001)(6486002)(6506007)(41300700001)(5660300002)(2906002)(4744005)(6862004)(8676002)(4326008)(8936002)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:28:22.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1526f0a7-563e-462b-6673-08dbce5426dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9509

Pj4+IA0KPj4+IEBSYWh1bCBvciBMdWNhOiBjb3VsZCB5b3UgZ2l2ZSBhbiBhbnN3ZXIgaGVyZSA/
DQo+Pj4gSSBrbm93IHlvdSB1c2VkIFhlbiBvbiBhbiBBVkEgcGxhdGZvcm0gYnV0IHdhcyBpdCBi
b290aW5nIG91dCBvZiB0aGUgYm94ID8NCj4+IA0KPj4gSSBjYW7igJl0IHNheSBmb3IgWGVuIDQu
MTcsIGJ1dCBvdXIgbmlnaHRseSBqb2IgaGFzIHJ1biBzdWNjZXNzZnVsbHkgb24gQVZBIGZvciB0
aGUgY29tbWl0IDczMDQwNmFiODEwOTQxMTVkOWZiNWNhMDBiYThkNTNjZWMxMjc5YjMNCj4+IChk
b2NzL21pc3JhOiBhZGQgZGV2aWF0aW9ucy5yc3QgdG8gZG9jdW1lbnQgYWRkaXRpb25hbCBkZXZp
YXRpb25zLikNCj4+IA0KPj4gV2UgYXJlIG5vdCBhcHBseWluZyBhbnkgcGF0Y2ggZm9yIGl0IHRv
IHJ1biBvbiBBVkEuDQo+IA0KPiBNb3N0IGxpa2VseSBpdCBpcyBiZWNhdXNlIHlvdXIgVUVGSS9C
SU9TIGZpcm13YXJlIGlzIDIueCwgZm9yIGluc3RhbmNlDQo+IDIuMDQuMTAwLjA3Lg0KPiBUaGlz
IGZpeCBpZiBmb3IgQVZBIG1hY2hpbmUgd2l0aCBvbGRlciBVRUZJIGZpcm13YXJlIDEuMDcuMzAw
LjAzLg0KDQpZZXMgaW5kZWVkLCBhbGwgb3VyIEFWQSBoYXZlIGEgbmV3ZXIgZmlybXdhcmUsIHNv
IEnigJltIGFmcmFpZCB3ZSBjYW7igJl0IGNoZWNrDQoNCkNoZWVycywNCkx1Y2ENCg0K

