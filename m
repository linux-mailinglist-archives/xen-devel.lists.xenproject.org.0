Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81773F24BC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169182.309052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuAS-0006rw-JK; Fri, 20 Aug 2021 02:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169182.309052; Fri, 20 Aug 2021 02:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuAS-0006po-GE; Fri, 20 Aug 2021 02:22:00 +0000
Received: by outflank-mailman (input) for mailman id 169182;
 Fri, 20 Aug 2021 02:21:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGuAQ-0006pg-WF
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:21:59 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54009750-af43-4089-b606-106785bdbbc6;
 Fri, 20 Aug 2021 02:21:56 +0000 (UTC)
Received: from DB9PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:10:1db::11)
 by PR2PR08MB4714.eurprd08.prod.outlook.com (2603:10a6:101:1c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 02:21:51 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::a1) by DB9PR06CA0006.outlook.office365.com
 (2603:10a6:10:1db::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 02:21:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:21:51 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Fri, 20 Aug 2021 02:21:50 +0000
Received: from 9b8fd9c8a195.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F114F58-8576-4D08-BA91-961D0CCF91E0.1; 
 Fri, 20 Aug 2021 02:21:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b8fd9c8a195.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:21:40 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3802.eurprd08.prod.outlook.com (2603:10a6:10:77::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Fri, 20 Aug
 2021 02:21:38 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:21:37 +0000
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
X-Inumbo-ID: 54009750-af43-4089-b606-106785bdbbc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW7OVIAUcPTAxYeLV2dOZpZhL/hEQFmN1dRjX3N+Qpg=;
 b=c+3JZ0CDcdeNy1k1E2Attn/NTXMkpZO+mvc8YO0I97HoMUW+pXRmZcwXxPSSWxZh1aCuZsNWzij+tQmAlZ8yEjCSWV+zBhhy/tyN4YnCG3VR7STN8flxxmQUi1qd/AFekZWeUFK4GPi9MGESXJKfVyr3v2mT0QNlv6PGslfXfPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mz1KJ8iQxmFUHobkwCPxT+09aoTOyTaYbpB45MuO/C/BkpdETWchH0iEBBtuyr/12KsTL1F9JB4dC6cfHo2JPPG56WydkEV1xq2B9hVaiswK393jQYvy3bF224wem+taeKrt5QkALFN6S9GFliJ/K6SBSyxW/9Oxkcpg5A3ZK5lKLvy6Fp3GfeWn2UBDV4NQ+OgyfY1sWXSaGGXXDKiufDkReSRnz15Yk5xFUi6wGuT+bF1R3DuEECFevi7Ok6gOSLTWYaCcFWxnClyrb57KwJ2eB8EHLbt+xvw1n1/6S/9L5iZ00Ajjyk1SuqKr0x57FiToAvJ40e3YqZbYIwpx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW7OVIAUcPTAxYeLV2dOZpZhL/hEQFmN1dRjX3N+Qpg=;
 b=aoCpkhzzsPj9HjCM4N8/BvxtoIaxDYF5yuk+/cqMBmCIb5wpDOmTay57LUPMpFS54UeN2pgFFiGOE84Q8u8urmVSFXMx21/Mo44VeRDCzbEKbqo7Pldsa3y8NjQ6wPqo37EEY2N+sNrCKROOBGBxF9fBMZWCk+4SLuSAAmz+v6tOaRUFbLkJPR34TVbU5+2pXTZabf2dOUNmfNJ4dVCsJO65qGopV+w29peFwEQ28UD8SnHZUjjUM4+NS0Rw4G/DCnfXO3ad01M3ZKOhQvdcj49ghdaf39CykPtFWVRc8cHfXs5mcTyu4A8kWHEcZVOG/szNLCQhV0RQTEZwG2yDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW7OVIAUcPTAxYeLV2dOZpZhL/hEQFmN1dRjX3N+Qpg=;
 b=c+3JZ0CDcdeNy1k1E2Attn/NTXMkpZO+mvc8YO0I97HoMUW+pXRmZcwXxPSSWxZh1aCuZsNWzij+tQmAlZ8yEjCSWV+zBhhy/tyN4YnCG3VR7STN8flxxmQUi1qd/AFekZWeUFK4GPi9MGESXJKfVyr3v2mT0QNlv6PGslfXfPw=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 21/40] xen/arm: introduce device_tree_numa as a
 switch for device tree NUMA
Thread-Topic: [XEN RFC PATCH 21/40] xen/arm: introduce device_tree_numa as a
 switch for device tree NUMA
Thread-Index: AQHXjptKJGIUZAkdGES3RqD+Z0s1i6t7JsMAgACPmnA=
Date: Fri, 20 Aug 2021 02:21:37 +0000
Message-ID:
 <DB9PR08MB68573FDEB4A89A165D124CE19EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-22-wei.chen@arm.com>
 <c83a7bcc-7d74-c01c-e91a-eeb11dd348d1@xen.org>
In-Reply-To: <c83a7bcc-7d74-c01c-e91a-eeb11dd348d1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D259BECE1682D446BB66CA2545B3D42E.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 25059a9f-b65d-4b9f-4dfa-08d963814513
x-ms-traffictypediagnostic: DB7PR08MB3802:|PR2PR08MB4714:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4714B0E9F9BAE6C68B4D49289EC19@PR2PR08MB4714.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m5tqU210HXYIxaK0mAZbIJkdOs+ZoIfFw/WF8D8TFkRc2+rFn3Srkcw/cR155ERoy1YK4YZ1DP8I0kuEWkrvXGY4thXQefUOFm2cL1x2ankzGl5hpqv5GsZs5zSnZe5RI3xncCEUBLLNOxCSGa0eow3bMPA0Z3ybgEtzpC2dpIDhhEkUXngZMKJDb5MGHf/ctztfquY88FXrl+E/AwZloLilOGSHzkVzkqFFXUGZZpsOpMfxg88PxhGomivdMsHueRd4DBFRW7jYyaKLIjrII0/YjgZg3S6rK1zHj/S4YSygjn5XeAMEtj0ub3ZRXiRyAWf2AKcl1FXk+si2uasTkHpWva/o277DtmfbVosrDfPvpn5WlzySy5cjk9/fK/oXqaV05C8RcwvPJ9kmti89BOIbttHe8KnsB03g81KS7Hp8n0pcHFC8lwDTlen7E9PhYU02rkfoAYfsp/M3PekM7HJ7TwIRk1WDUUHobKmXzMlp6exVdZTK35v5tMFNcp34e9PuQvxrj2iimXahGEunNJTFjGS4FnDx/KkJZcU7yNBW8qMmksqMss7aGyqhPc8lU3YuIu+qGNbuVA//hNigeczz3LQBvsrvzXycGJXPCkHNrCIExyOHPXh6q2SFu/1+T3EyA8zyxzBRWFAvOs6088HZtEBwirbe7MbtOF0W23tARMoCXeRla0BNlNg7m5ku4p6HRAZGiDAb0JjdhYwj1jDy6SyC0skXihebzZ1DS7HbQv2/pAsr9OKYnRBXWzVcUorz1+31pZiIgdVW6dLxPN8hbdoRqHSTGCSTM+ccwQmTYXHQDNAMAIYI5Lo+7VYs
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39850400004)(66946007)(478600001)(110136005)(55016002)(316002)(4326008)(9686003)(5660300002)(52536014)(66556008)(66446008)(2906002)(83380400001)(122000001)(71200400001)(8676002)(38100700002)(53546011)(64756008)(8936002)(76116006)(38070700005)(66476007)(7696005)(86362001)(186003)(33656002)(6506007)(26005)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3BBK1BURnlVaFNjN2NtRXRkc1dBcENzM0NuaDQ5S3Noc3p5bjlLRnQ2NlIv?=
 =?utf-8?B?TzhpL2p5TVAxQld1a2htLzA0em1DenRJT3NxdTZGbDN1eVNHMUMwVUlWOG9O?=
 =?utf-8?B?cFJScW9vZkI0aWJvZFB2RWxMV0ZlTytDOXpWMUZqNGh6ZndQUnVzdE41aFdS?=
 =?utf-8?B?SDVoaUhhRVVkc0paWlE2T28rRno0OE1tbm1URlJFa2cxNGxsSnYxbTFHczMx?=
 =?utf-8?B?MjlITndpUzF0dGhuZmFsbWlHcERucUJINzdsR28wQUZMdWV5azh1NU4reWF6?=
 =?utf-8?B?VFI4dzJNRE8wVEFlVkVVQTQvanBuQSszRVl1RkxzTjRRdVQrVnpyc3c3T0F2?=
 =?utf-8?B?Ty9MUytHQUV6VW8yWjRHZWl3U1lHY2VIZXJBUllWMFFINFNqOGsycFBIL1Ir?=
 =?utf-8?B?U3RGcStxYUxzQWNIRndkemtneUUwbncxWVRNbThmQmRxQjlnTWROa0dtUFNq?=
 =?utf-8?B?NjRZNFlId3N6T0ZYV0FxSlZZMlpQWi9MY0dIUmlBNWlwZXN4VzQwVTJpQyth?=
 =?utf-8?B?VnE4SGNLaXNQa3pJOHVmV001UkQ2MTUzWlorNGRMaWFLSlpiWUdJdG1VZzJV?=
 =?utf-8?B?WnFTQ1Fka3dhUGtveFptWFFoV1Q0K05lUnJ2L0lBQmh0RWRYR1N1TFJSNXpm?=
 =?utf-8?B?RXNSWFIrYmFnc0xyVk1zWTNjRTlxYmhiaHJtM1N5NDRvWU1vTm0zSXZ6N0Q4?=
 =?utf-8?B?TUdGNlNhL2VTY0ZTL2s2cGdiSEtBaHFwSi9pU3hySDNyeUFPcmEvVVR2M2Zn?=
 =?utf-8?B?M0l3dzFsbk9mTlpSTnU4aHlxVlpXeXpYUWpVc01leUl0Q3QzUDRrTG5xZENi?=
 =?utf-8?B?YXVmRENiSnErMXR0dWFIOENza3dMSHMzYU1Da0U3NkhvdTR3T2VMaUxoenRZ?=
 =?utf-8?B?NGRFaGFFeWlrTnN4bUNaaFFraGFsZXVVMHVrK3F4L2szQWtXNEk1cVdzZm1D?=
 =?utf-8?B?QXVuVjI0c2dyeWNCaDR4YnEzcVBtejlmOFFxemdVUUVOaXl2RFVCRjRKdy9E?=
 =?utf-8?B?R0YzT2hJSkhFekVpYUt5MkZhVDZrUDdoZmpkcU9hVUp2RWo0KzBGbEZDczZG?=
 =?utf-8?B?YmNVYUhmcTZOTW9SYTRwZ09LN21acUFBS0czdERzVldwdUxZcyt3R0hQUWxM?=
 =?utf-8?B?Y0t2dWVkY1d3ZWt2dXNpT3JuOGZnajYrRFg0ZDZvNU5QR0FnQkpYMThPTGZa?=
 =?utf-8?B?b3pYR3JCRE55US9MT0FHODYxa1J0WDFhU2pMaUZLeVY0QTh6dkFBSVdkdmxE?=
 =?utf-8?B?d21RSC9xV1NjV01oS3IrREZGUFNIbTFKWHlkU01qaTQ5M2dKdEY5ZGRsSDdR?=
 =?utf-8?B?aTd5Q3dRSm9GVFJhano4UCt3YWt1aEhiVkVGOTVSSDFBbWZ1S25KYlo4REQw?=
 =?utf-8?B?bElGZEVwcVVJOGNOVWM0OUR0eFBYemp1NVorZ29zUGQ5dGtVSnljL3RvRUtF?=
 =?utf-8?B?NXFwRThBNWZnRjhIRlhhVDlvb3o1RVBsN3dwcW1jNXRLQ2k0QzlCbWVtcFhS?=
 =?utf-8?B?RlNjQ3FEVmNqcUFrbmtKN3QySDhrQWNJVDkveFhKOEhnOXVoZkIzYnBtYURa?=
 =?utf-8?B?RFgxUTRxYzBGMjFpZGdmVFlYM1dUdHVHUTlKL25GQUh5d3FWZnh1cGh3Q0xk?=
 =?utf-8?B?TnBTV0lxTzRZMWl3a0RxcWxBbFNjaTR5NUxXdHR5RVVPUlpza2YvejJJemRj?=
 =?utf-8?B?Y1pyOUJjUHZiQTIreG80djg1R1NGd2RuaDVNKzBXRzFlUituL1hwWGpWUUpK?=
 =?utf-8?Q?8UwgLniyS3NmCGuGg1yS69ZSjR4rXX+pyFqk/e6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3802
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91c2e9ff-a608-480a-b62a-08d963813d42
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tS8rl9C67y0RVNWXOStd6FvyRJgg/okzYGo9VP3W2/4x+UUntwa3n9Ms3f4Z5qXmAtdZw5Ba3guw7cAxBwSsjleWBmU3ZRZTHT9VsCAs7xJyDv8kzvhXorJtJYukAEzHmF4TkXQV1nRgktmWFuvR5ZdwHODk8euzhL1f3a3Efl7zGWD0CgwIKOqO/IQL6d7noFGE3IsNe5C1nxXp7+gxrplPyCydi+SUAGqrdP/Yu/aEJKv1WcgN4hvF7+vmvNJteb6X1x7LnpCniEi/QI5dRgAifdTBL7fi5fS1Xh1WWxvaI8SglDTVVm9VHJVZdnvlFJ96CIufk46ltPKHiO2SWz7yg9cG94lBPJKJmfD73O5qHD0iWHZHDfECdFnIZ6Xrw4CNLwGEgFj2Y3MQEkbv1Kyw2WYLpzsgIK6DNpxpG052gxJ8RyRwPUcSttCr7vE59mILcLOVeGab6447jj/H/ZsWUhuEQ+QQmh40HuJC1lunyRxR2gdWqO3I0nuyzx1mxATV+sddiPcvpJ++ZRIkxVF4laztGdeVSt65a70CrOFlorpAh1Fqfhu3Em7e8KP6hnqewIPLnmOpzyR6/1wJpV6tLQ5kPHb0EeZYQV/CP/qzWbZD2Bc7Y/N9tuYwQpnfOXxYF3NbM/2/Pvb8DPtG0mvsT17GTNbKY5AuTfwj+J7GWg8ZgwJL73hCtl2JeDXIW8s69RHNQdPrOqzjEI7jVgS0PKQBd2dyUZz3/BmdrvRMvVMmpLybxi2jmDoB58R+9nUfv+mAGEUt79VZlAofMPciXfxwldcNIegIhiFwVvq0MlBnHpR+VkGkigr4qEAA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(136003)(396003)(36840700001)(46966006)(33656002)(81166007)(4326008)(55016002)(26005)(8676002)(316002)(82740400003)(9686003)(6506007)(5660300002)(110136005)(356005)(53546011)(186003)(478600001)(8936002)(36860700001)(70586007)(52536014)(70206006)(336012)(82310400003)(7696005)(2906002)(83380400001)(47076005)(86362001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:21:51.0369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25059a9f-b65d-4b9f-4dfa-08d963814513
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4714

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTo0NQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyMS80MF0geGVuL2FybTogaW50cm9kdWNlIGRldmljZV90
cmVlX251bWEgYXMNCj4gYSBzd2l0Y2ggZm9yIGRldmljZSB0cmVlIE5VTUENCj4gDQo+IEhpIFdl
aSwNCj4gDQo+IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IExpa2Ug
YWNwaV9udW1hIGluIHg4NiBhcyBhIHN3aXRjaCBmb3IgQUNQSSBiYXNlZCBOVU1BLCB3ZSBpbnRy
b2R1Y2UNCj4gPiBkZXZpY2VfdHJlZV9udW1hIGFzIGEgc3dpdGNoIGZvciBBcm0gZGV2aWNlIHRy
ZWUgYmFzZWQgTlVNQS4gV2hlbg0KPiA+IE5VTUEgaW5mb3JtYXRpb24gaW4gZGV2aWNlIHRyZWUg
aXMgaW52YWxpZCwgdGhpcyBzd2l0Y2ggd2lsbCBiZSBzZXQNCj4gPiB0byAtMSwgdGhlbiBOVU1B
IHN1cHBvcnQgZm9yIEFybSB3aWxsIGJlIGRpc2FibGVkLCBldmVuIGlmIHVzZXIgc2V0DQo+ID4g
bnVtYV9vZmY9MC4NCj4gDQo+IFRoZSBoeXBlcnZpc29yIHdpbGwgbmV2ZXIgdXNlIGJvdGggQUNQ
SSBhbmQgRFQgYXQgcnVudGltZS4gSW4gZmFjdC4uLg0KPiANCg0KWWVzLg0KDQo+ID4NCj4gPiBL
ZWVwIHVzaW5nIGJhZF9zcmF0IGFuZCBzcmF0X2Rpc2FibGVkIGZ1bmN0aW9ucyBuYW1lLCBiZWNh
dXNlIHdlIHdpbGwNCj4gPiByZXVzZSBub2RlX2NvdmVyc19tZW1vcnkgYW5kIGFjcGlfc2Nhbl9u
b2RlcyBjb2RlIGZvciBBcm0uDQo+IA0KPiAuLi4gZ2l2ZW4gdGhhdCBib3RoIGZ1bmN0aW9ucyB3
aWxsIGJlIGNhbGxlZCBmcm9tIHRoZSBjb21tb24gY29kZSwgaXQNCj4gd2lsbCBiZSBhIGxvdCBt
b3JlIGRpZmZpY3VsdCB0byBhZGQgQUNQSSBhZnRlcndhcmRzLg0KPiANCj4gU28gSSB0aGluayB3
ZSBzaG91bGQgZWl0aGVyIHJlbmFtZSBhY3BpX251bWEgdG8gc29tZXRoaW5nIG1vcmUgZ2VuZXJp
Yw0KPiAobWF5YmUgZndfbnVtYSkgb3IgY29udmVydCBudW1hX29mZiB0byBhIHRyaS1zdGF0ZS4N
Cj4gDQo+IFRoaXMgd2lsbCBhbGxvdyB0byBoYXZlIHRoZSBjb2RlIG1vc3RseSBjb21tb24uDQo+
IA0KDQpJIHdpbGwgdHJ5IHRvIGFkZHJlc3MgdGhlbSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gPiBU
aGVzZQ0KPiA+IGZ1bmN0aW9ucyBhcmUgdXNpbmcgdGhlc2UgdHdvIEFQSSBuYW1lcy4gQW5kLCBh
cyBkZXZpY2UgdHJlZSBjYW4gYmUNCj4gPiB0cmVhdGVkIGFzIG9uZSBraW5kIG9mIHN0YXRpYyBy
ZXNvdXJjZSB0YWJsZS4gU28gd2Uga2VlcCB0aGVzZSB0d28NCj4gPiBmdW5jdGlvbiBuYW1lcy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+
IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICB8ICAxICsNCj4gPiAg
IHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMgfCAzNSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oICAgICAgfCAg
MiArKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQo+ID4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9NYWtlZmls
ZQ0KPiA+IGluZGV4IDZlM2ZiODAzM2UuLjEzZTE1NDliZTAgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2FyY2gvYXJtL01ha2VmaWxlDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+ID4g
QEAgLTM2LDYgKzM2LDcgQEAgb2JqLXkgKz0gbWVtX2FjY2Vzcy5vDQo+ID4gICBvYmoteSArPSBt
bS5vDQo+ID4gICBvYmoteSArPSBtb25pdG9yLm8NCj4gPiAgIG9iai0kKENPTkZJR19OVU1BKSAr
PSBudW1hLm8NCj4gPiArb2JqLSQoQ09ORklHX0RFVklDRV9UUkVFX05VTUEpICs9IG51bWFfZGV2
aWNlX3RyZWUubw0KPiA+ICAgb2JqLXkgKz0gcDJtLm8NCj4gPiAgIG9iai15ICs9IHBlcmNwdS5v
DQo+ID4gICBvYmoteSArPSBwbGF0Zm9ybS5vDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9udW1hX2RldmljZV90cmVlLmMNCj4gYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5j
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi4xYzc0YWQx
MzVkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9udW1hX2Rldmlj
ZV90cmVlLmMNCj4gPiBAQCAtMCwwICsxLDM1IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIEFybSBBcmNoaXRlY3R1cmUgc3VwcG9y
dCBsYXllciBmb3IgTlVNQS4NCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIxIEFy
bSBMdGQNCj4gPiArICoNCj4gPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4gPiArICogaXQgdW5kZXIgdGhl
IHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMNCj4g
PiArICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uDQo+ID4gKyAq
DQo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLA0KPiA+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhv
dXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPiA+ICsgKiBNRVJDSEFOVEFCSUxJVFkg
b3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlDQo+ID4gKyAqIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+ID4gKyAqDQo+ID4g
KyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlDQo+ID4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiBJZiBub3QsIHNl
ZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+ID4gKyAqDQo+ID4gKyAqLw0KPiA+
ICsjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9ub2RlbWFzay5oPg0K
PiA+ICsjaW5jbHVkZSA8eGVuL251bWEuaD4NCj4gPiArDQo+ID4gK3M4IGRldmljZV90cmVlX251
bWEgPSAwOw0KPiA+ICsNCj4gPiAraW50IHNyYXRfZGlzYWJsZWQodm9pZCkNCj4gDQo+IFlvdSBl
eHBvcnQgdGhpcyBvbmUgYW5kIC4uLg0KPiANCj4gPiArdm9pZCBfX2luaXQgYmFkX3NyYXQodm9p
ZCkNCj4gDQo+IC4uLiB0aGlzIG9uZSB3aXRob3V0IHByb3ZpZGluZyBpbiBhIHByb3RvdHlwZS4N
Cj4gDQo+IExvb2tpbmcgYXQgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcy4uLiB0aGV5IHdpbGwgYmUg
dHVybmVkIHN0YXRpYyBpbiB0aGUNCj4gbmV4dCBwYXRjaCAoIzIxKSBidXQgdGhlbiByZS1leHBv
cnRlZCBpbiBwYXRjaCAjMzMuDQo+IA0KPiBJbiBnZW5lcmFsLCB3ZSBzaG91bGQgcmVmcmFpbiB0
byBtb2RpZnkgY29kZSB0aGF0IHdhcyBhZGRlZCBpbiB0aGUgc2FtZQ0KPiBwYXRjaCB1bmxlc3Mg
aXQgaXMgbm90IHBvc3NpYmxlIGZvciBzcGxpdCByZWFzb24gKGUuZyBjb2RlIGNsZWFuLXVwIGFu
ZA0KPiB0aGVuIGNvZGUgbW92ZW1lbnQpLg0KPiANCj4gSW4gdGhpcyBjYXNlLCB0aGUgaGVscGVy
cyBzaG91bGQgYmUgZXhwb3J0ZWQgZnJvbSBub3cuDQo+IA0KDQpPay4NCg0KPiA+ICt7DQo+ID4g
KyAgICBwcmludGsoS0VSTl9FUlIgIkRUOiBOVU1BIGluZm9ybWF0aW9uIGlzIG5vdCB1c2VkLlxu
Iik7DQo+ID4gKyAgICBkZXZpY2VfdHJlZV9udW1hID0gLTE7DQo+ID4gK30NCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL251
bWEuaA0KPiA+IGluZGV4IDU1OWIwMjhhMDEuLjc1NmFkODJkMDcgMTAwNjQ0DQo+ID4gLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJt
L251bWEuaA0KPiA+IEBAIC0yMyw2ICsyMyw4IEBAIHR5cGVkZWYgdTggbm9kZWlkX3Q7DQo+ID4g
ICAjZGVmaW5lIE5VTUFfTE9DQUxfRElTVEFOQ0UgICAgIDEwDQo+ID4gICAjZGVmaW5lIE5VTUFf
UkVNT1RFX0RJU1RBTkNFICAgIDIwDQo+ID4NCj4gPiArZXh0ZXJuIHM4IGRldmljZV90cmVlX251
bWE7DQo+ID4gKw0KPiA+ICAgZXh0ZXJuIHZvaWQgbnVtYV9pbml0KGJvb2wgYWNwaV9vZmYpOw0K
PiA+ICAgZXh0ZXJuIHZvaWQgbnVtYV9zZXRfZGlzdGFuY2Uobm9kZWlkX3QgZnJvbSwgbm9kZWlk
X3QgdG8sIHVpbnQzMl90DQo+IGRpc3RhbmNlKTsNCj4gPg0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

