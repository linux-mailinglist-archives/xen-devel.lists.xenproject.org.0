Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6FA3FA370
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 05:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174185.317782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJpSo-0006gk-5N; Sat, 28 Aug 2021 03:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174185.317782; Sat, 28 Aug 2021 03:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJpSo-0006eP-1g; Sat, 28 Aug 2021 03:57:02 +0000
Received: by outflank-mailman (input) for mailman id 174185;
 Sat, 28 Aug 2021 03:57:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJpSm-0006eI-1d
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 03:57:00 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.60]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd2a3d6a-07b3-11ec-ab31-12813bfff9fa;
 Sat, 28 Aug 2021 03:56:57 +0000 (UTC)
Received: from AM6P192CA0085.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::26)
 by AM0PR08MB3460.eurprd08.prod.outlook.com (2603:10a6:208:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Sat, 28 Aug
 2021 03:56:55 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::8) by AM6P192CA0085.outlook.office365.com
 (2603:10a6:209:8d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Sat, 28 Aug 2021 03:56:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 03:56:55 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Sat, 28 Aug 2021 03:56:54 +0000
Received: from 5c62d85db21b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 39D7B30A-3F5E-416F-88DB-0FDD5CEA0ABB.1; 
 Sat, 28 Aug 2021 03:56:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c62d85db21b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 03:56:43 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6348.eurprd08.prod.outlook.com (2603:10a6:10:263::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Sat, 28 Aug
 2021 03:56:42 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 03:56:42 +0000
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
X-Inumbo-ID: fd2a3d6a-07b3-11ec-ab31-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZcFglF7B46BLPewFjtE5YuegrN7m+4w6ZBJWU+VNIc=;
 b=N57v5J3R47IiYVSojk2sYh+/bqBADT0RTaq6yvaHNiOmZKAQ7IwpCQPvIWG70AY0qOFBGMmU05BMP5k4Dte2rVScgSmpzRxYP9cI06f9Wk/VTblY8Z5doW1tANDIQoGyBozgQq6+HqVtJs7Jnf+l3CwRJF5J2jvhhK05PRCYoJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+8k8U6JIhM4U/3iA+OVDi0uFAKhd/UjTyKcKonlcKgi2tSkRn73jzsrsAs73XwX/hiYBQFqoF3xaBSl1dwWBjhkhAXiQE4HgoZgRIY+ZJ9SG0mSmT4sNKWRg+hVQLWaCzXBdZUCHQAnDqKJlLsX9MMHP0SBvQrGC8k+8Bk7XIggVE0LyuFpCRzb6GYrbA/c0i84HIfyvR+6YgyeP1XeAypuTgq/ULa2H3TH7IMUVKH7inlmplopgya53fRaM+eei1kVUIuG104RawntSJxvgawOmQZ4CpQc5glbS2g/+MoVI0BgPO3fVmwEnw1FSxVs42wlvRwjoTXyO9rTHt8n+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZcFglF7B46BLPewFjtE5YuegrN7m+4w6ZBJWU+VNIc=;
 b=VW4fvYTuNpcSVh2+gPKY7nuy13w/xlmsOEfKuq6HE/BtC/TJUN+kzaRqAO1rI1nRK/6noPXGQALkMwnmA3nwQQt8SJ38Bx+WtxEpKO8u1vOkLnvt5WahUrHYByEWYy6lB/ml8MQwfagoFCW5G7d9H44NsfO2yAxkLrEGzfVml8WtupSNl0kfEyAc/g3lIEmnxAAIwqNJSmF+cmRvZJVOEwAeC6H+uHGpSmYsHb/LIBWjv4ZbYlM+YxDX2GBeW761v7uUlR3J1pDnPztRckyKbPicJ9s3hXaUNSmLWesP1L/ScDwr6KpzxLs+r5bo1A3tdHqjHIdl8EM9FRrnT7RUrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZcFglF7B46BLPewFjtE5YuegrN7m+4w6ZBJWU+VNIc=;
 b=N57v5J3R47IiYVSojk2sYh+/bqBADT0RTaq6yvaHNiOmZKAQ7IwpCQPvIWG70AY0qOFBGMmU05BMP5k4Dte2rVScgSmpzRxYP9cI06f9Wk/VTblY8Z5doW1tANDIQoGyBozgQq6+HqVtJs7Jnf+l3CwRJF5J2jvhhK05PRCYoJE=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
Thread-Topic: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
 device tree memory node
Thread-Index: AQHXjps6uVXfLZKD7EKSvvhEptOzS6uINJ4AgAAs9PA=
Date: Sat, 28 Aug 2021 03:56:42 +0000
Message-ID:
 <DB9PR08MB6857618112DC045293A449699EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 26CD57FC708995488B3B8FC205FFD895.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 76197760-0947-4982-b867-08d969d7e06d
x-ms-traffictypediagnostic: DB9PR08MB6348:|AM0PR08MB3460:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3460E24B0C6531645B2A638C9EC99@AM0PR08MB3460.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 76MPRxLzs6EZ2kGUBrP+X0OLHkGPQwEcFYOPZd3MwNkLv3nzwzEL4ewgmdw3/qkEdIhUccDH8+hJmLq2J6lMFtYHgX9mXpKQeIyaMUyM+M1YQF18KD1nIW7oB2MqHQr3zJwyKM4qde421XX2nbvKb+CdYqgoYU5sBcJau0QqhJRc/K0jMWsnXAAe9WrLnlGJgvgckQgGfNKkwQi5RwnrdpONkqxJzstU5jUBLQ4Wpc0r96LBLMpXSnK50Qo7JU4AV4u+mNh7yvA0QKN+WUrD2G4a5tM8iHyJxKX59RPlU0op3Eq310+36zK9N183qIsbLBhO3t5AUSc2OYBD7w+3SEpnMyaFZE2MNIf6kVOVoY69npVySsgYOVPI6WOinTK6CcMiuw8Ozd/s9JzeEMaKxxKFx/cNC7buYBK2DRByCEUpoQehUhpIlLsnDU5dINkSTAeurX4xsPNdvA8du89ByksXtVc9YiDY47q5hfXPEPTEr01193u0364r/fjKHMPF5W1ggSKVa778sxWSStxAP7zNJcV9wwnkplqxkT2hqwzXJbhYWz4Tz+oHU0LIQ6kMNf3hEEUBvJNJoxp6TWrHCu1We9fi8pqJUniMOiun9VSjYwyRlcVFkdG/pdsRG4CiWI7uAfUpXBgKy7obGCjpydRgPdY/qThy9C/rZTW1iqZutkYggm037GEnqW4k514PrRBN5BFWtytuE1fETLY4KA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(186003)(54906003)(55016002)(86362001)(316002)(66946007)(8676002)(64756008)(83380400001)(9686003)(478600001)(2906002)(38100700002)(122000001)(26005)(66446008)(4326008)(38070700005)(8936002)(6916009)(52536014)(6506007)(71200400001)(53546011)(7696005)(66476007)(66556008)(76116006)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SENUQmwvKzUrQUc0YnkzQVZiWEd1MDlDKzBEcmJRY3ZVL1ovNUNyNExGVW0v?=
 =?gb2312?B?MjAyVkcwbkNBV3BKbURZRnZoLzdsTStFRWhRNVRRb0hQZXZybEVja0FMMG9R?=
 =?gb2312?B?ZGxtTzlsNkFHNlZaYm1INmF4WWNoMXRhSnh1WW5aN2o5S2lHY093NUpUSEN0?=
 =?gb2312?B?YVkwZjA0QTBRNG1CQ0xpZG1Palc1TFNoQ1Y5MlNnSHFmVUpNZFhGMlBGcmgw?=
 =?gb2312?B?R1VNNjBHaWJXVnJZNG5jQWZFRDN5dlYza3dOM0FUMDZNN2dnU3A5Y2FlckZ3?=
 =?gb2312?B?c3d0WDNyNTNpdW04aXFERUFpeHpBY25WSmtxZmY4TDlYL0IvZXhjeGVic2p5?=
 =?gb2312?B?NnUzQ3h4Qk5nWUwrSERjNkMwVDRMZlV1eksrZnVEOCtQam1abVQ4OXhVZEsy?=
 =?gb2312?B?OXhGZUp3eisxUnpRYzg3T1huZkxIdUx0MTJkN3E1V0hjZ1VRVTUyT09xdEtX?=
 =?gb2312?B?TTNpUHJ2RFNxZ0NvbTYyWTZRWE5RZXViNGRZdDZGelROV3lqT3d1dVpJZGhW?=
 =?gb2312?B?ejdiZFZDQ0ZIS3FTL0J6Z3N1M0N3UkRtY0dXUXdDalcvclZKNEEvZXZwdE9E?=
 =?gb2312?B?VDFZbmtOR20wS1NQQ2Q2cjNtZG14RTN3MlNzMjZzNlVyMjhqeWxhNWdzMFRQ?=
 =?gb2312?B?UEJkMS9WM2k4ajRhQ3FKcnZKU01wRVVqcGhXbFlLYXhOUys1am83eUN6aldG?=
 =?gb2312?B?M0pTYkFrYytFQUV1Mi9lMlQxNUpiNXg3Z3pjUm1RTXJqOGN3dkFESnI4OWlF?=
 =?gb2312?B?UTVGUlFJa2x2L0hMdk9mdEhpT3krVnJmUTE3WWgzS240T254QVg0c3JBaHBD?=
 =?gb2312?B?Uy9YUFFIMXVkUkJuVHlxcjN1RmlYT0hyK1NvL0FENHlsYXVzTkozdUlyR2JR?=
 =?gb2312?B?N0wrZ1NmZGpVcmhVZDlSUVQ2MnlNakJLMUxTMlY2M1QzUS92bmJkc09xVDhx?=
 =?gb2312?B?OS8zaEtIOEgzOXRQc1lqM0tGUlFWa0l2S0tGZDcrUVNNaDhCMHNIbDk0dlgw?=
 =?gb2312?B?SGxZb1ptWk42YXI0TDRQZGNvekpvaU1sa1p2eUxFcDNUbmZwU0lsTmRjb0dx?=
 =?gb2312?B?ZUhnQlBsZTlqeW1MNXRua2c0dzN4QVpmSEhVWi8vRkJsc3J1bHZmUHdrbmpZ?=
 =?gb2312?B?WU5jRUFOMHZoN0xBVmxqd2NvMGJoN0dFL2JzZFlrM2NkeXRIMGxqN2Y1OEtO?=
 =?gb2312?B?WjlyZXdKZzRCRTZaRWJtMEFEWGV5U0lRcEpDaG1ScjRlWVIvQzFTb05WbXk2?=
 =?gb2312?B?c2VUY1JqVUxoT05WVUsrdUE4SkdOa1Y5UnNWUHFVbWt3a0FQdStTMHBueEo2?=
 =?gb2312?B?RG1tN2k2Z3VGQ1lxemtER3MvSFBJS3FEVjBPOGJRYnhpMGFzWHlMcS95a0hP?=
 =?gb2312?B?ajRDc2RoazVUU2lId1hld0J1aUNmbVI3SUN0SXI3ZCt4Q2dMMk5HZDRSR0Zz?=
 =?gb2312?B?MnYrVVdJZ0lLYVB4WGhZU1RKVTlZWTBVSnBsdWZxSXo3N2ErbG9ac1c5dGY0?=
 =?gb2312?B?TXM1NnhPS3NlM3ZkaitOL3VNTk9nMlZ1aHlCaE52M2N2UTlLdDJpVVg3NlRY?=
 =?gb2312?B?bVFSMExqRVlINEZSMUMxWDNhTWFOSE9kUEk0VjQ4MVVtTjd1UFpQaFZDa3Rl?=
 =?gb2312?B?Wlo1VU5HUFkyTmk4bnNQcFd5c0VpemJPUktuWi9sOVZGTTZWYUFkYmNCY0o2?=
 =?gb2312?B?bmNudWUzSVpWQTJNTmw5YjlsdmtkT1ZRRTk1am5FQVhMbDN4ZkJLTERZeDJo?=
 =?gb2312?Q?V8cxYhLLiN50APO25ekUrPlHHe5RDo6BkRmt1P7?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6348
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c7e62d10-0adf-4ddb-a67e-08d969d7d897
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P1F9KDrXGwWia2FKWNS0xIqn2axsVGxZx7Cm4EVAYpRRVPcroub3UQlSMl2RCg1n9EyEYml6JChX9uYUcxUFPtUxVr3/VjWSbJvXGvjEAJsLmc0n7iuiHA8NXTgWsmQGUofcqmuf0FZByOpX+68RGEbDtrcEakW++8/SQWqA9u8nI55C6Qzrl2A7OejzMfgBfifsCyuyTY80H2HH4XFebGSmV9XTYE8lo/AhroIIyXTAr6bRy460bjxbam9h97Yp05i+SUfTD/lBuHIyawb/QTT6bf9jBcT8NtyQxhjVzTW5n0FXDNkz4J/YhQMQxFte/leG0lKduUPovmwYNg8UsM3DlkfVBEQpvHZ0enbH6t54u7N6sjYL0cGIUqyG/y2uieT18vsrvAyDMB/+nLeyKNo9AwkmgII/UDQQ+BTePeDCrKHsq9pG9fyuRWSUt91SZHYRexc8E8fQHYZzCg3/2cQ+3X7TGkPUtvZOhmaRApWlidxT47JVOHZWPipokN4BAfJhVh4gs47xYe4c0lqMjcBhnmQUQJBI9BXibRPTp1809Y8c2ARZs+aRQCkBygB8YEM51nqaNeUbf9dFiX0DzeZqV5gFxKrET7gpV6R4ogGo3nHqIOQGGp0KVe7MklfTrpFLnGZ48821JkynRQneLurbRhKRgXYgHSOANca9Z4qjMLaz10U2xECdufB1+wd8utuumUAtNuNLJ8wUC6GpDg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(336012)(7696005)(107886003)(186003)(9686003)(316002)(47076005)(5660300002)(8676002)(6506007)(55016002)(4326008)(2906002)(53546011)(54906003)(83380400001)(36860700001)(70586007)(8936002)(356005)(33656002)(82310400003)(70206006)(52536014)(86362001)(81166007)(26005)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 03:56:55.3088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76197760-0947-4982-b867-08d969d7e06d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3460

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjI4yNUgOTowNg0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjMvNDBd
IHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZQ0KPiBkZXZpY2UgdHJlZSBtZW1v
cnkgbm9kZQ0KPiANCj4gT24gV2VkLCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4g
TWVtb3J5IGJsb2NrcycgTlVNQSBJRCBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZGV2aWNlIHRy
ZWUncw0KPiA+IG1lbW9yeSBub2RlcyBhcyAibnVtYS1ub2RlLWlkIi4gV2UgbmVlZCBhIG5ldyBo
ZWxwZXIgdG8gcGFyc2UNCj4gPiBhbmQgdmVyaWZ5IHRoaXMgSUQgZnJvbSBtZW1vcnkgbm9kZXMu
DQo+ID4NCj4gPiBJbiBvcmRlciB0byBzdXBwb3J0IG1lbW9yeSBhZmZpbml0eSBpbiBsYXRlciB1
c2UsIHRoZSB2YWxpZA0KPiA+IG1lbW9yeSByYW5nZXMgYW5kIE5VTUEgSUQgd2lsbCBiZSBzYXZl
ZCB0byB0YWJsZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5A
YXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgeGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYyB8
IDEzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTMwIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
bnVtYV9kZXZpY2VfdHJlZS5jDQo+IGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0K
PiA+IGluZGV4IDM3Y2M1NmFjZjMuLmJiZTA4MWRjZDEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2Fy
Y2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9udW1hX2Rl
dmljZV90cmVlLmMNCj4gPiBAQCAtMjAsMTEgKzIwLDEzIEBADQo+ID4gICNpbmNsdWRlIDx4ZW4v
aW5pdC5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL25vZGVtYXNrLmg+DQo+ID4gICNpbmNsdWRlIDx4
ZW4vbnVtYS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2xpYmZkdC9saWJmZHQuaD4NCj4gPiAgI2lu
Y2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+ICAjaW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+
ID4NCj4gPiAgczggZGV2aWNlX3RyZWVfbnVtYSA9IDA7DQo+ID4gIHN0YXRpYyBub2RlbWFza190
IHByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQgX19pbml0ZGF0YTsNCj4gPiArc3RhdGljIG5vZGVtYXNr
X3QgbWVtb3J5X25vZGVzX3BhcnNlZCBfX2luaXRkYXRhOw0KPiA+DQo+ID4gIHN0YXRpYyBpbnQg
c3JhdF9kaXNhYmxlZCh2b2lkKQ0KPiA+ICB7DQo+ID4gQEAgLTU1LDYgKzU3LDc5IEBAIHN0YXRp
YyBpbnQgX19pbml0DQo+IGR0Yl9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0eV9pbml0KG5vZGVpZF90
IG5vZGUpDQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+ID4gKy8qIENhbGxiYWNr
IGZvciBwYXJzaW5nIG9mIHRoZSBtZW1vcnkgcmVnaW9ucyBhZmZpbml0eSAqLw0KPiA+ICtzdGF0
aWMgaW50IF9faW5pdCBkdGJfbnVtYV9tZW1vcnlfYWZmaW5pdHlfaW5pdChub2RlaWRfdCBub2Rl
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qgc3RhcnQsIHBh
ZGRyX3Qgc2l6ZSkNCj4gPiArew0KPiA+ICsgICAgc3RydWN0IG5vZGUgKm5kOw0KPiA+ICsgICAg
cGFkZHJfdCBlbmQ7DQo+ID4gKyAgICBpbnQgaTsNCj4gPiArDQo+ID4gKyAgICBpZiAoIHNyYXRf
ZGlzYWJsZWQoKSApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsg
ICAgZW5kID0gc3RhcnQgKyBzaXplOw0KPiA+ICsgICAgaWYgKCBudW1fbm9kZV9tZW1ibGtzID49
IE5SX05PREVfTUVNQkxLUyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgZHByaW50ayhYRU5M
T0dfV0FSTklORywNCj4gPiArICAgICAgICAgICAgICAgICJUb28gbWFueSBudW1hIGVudHJ5LCB0
cnkgYmlnZ2VyIE5SX05PREVfTUVNQkxLUyBcbiIpOw0KPiA+ICsgICAgICAgIGJhZF9zcmF0KCk7
DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsg
ICAgLyogSXQgaXMgZmluZSB0byBhZGQgdGhpcyBhcmVhIHRvIHRoZSBub2RlcyBkYXRhIGl0IHdp
bGwgYmUgdXNlZA0KPiBsYXRlciAqLw0KPiA+ICsgICAgaSA9IGNvbmZsaWN0aW5nX21lbWJsa3Mo
c3RhcnQsIGVuZCk7DQo+ID4gKyAgICAvKiBObyBjb25mbGljdGluZyBtZW1vcnkgYmxvY2ssIHdl
IGNhbiBzYXZlIGl0IGZvciBsYXRlciB1c2FnZSAqLzsNCj4gPiArICAgIGlmICggaSA8IDAgKQ0K
PiA+ICsgICAgICAgIGdvdG8gc2F2ZV9tZW1ibGs7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBtZW1i
bGtfbm9kZWlkW2ldID09IG5vZGUgKSB7DQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAg
KiBPdmVybGFwcyB3aXRoIG90aGVyIG1lbWJsayBpbiB0aGUgc2FtZSBub2RlLCB3YXJuaW5nIGhl
cmUuDQo+ID4gKyAgICAgICAgICogVGhpcyBtZW1ibGsgd2lsbCBiZSBtZXJnZWQgd2l0aCBjb25m
bGljdGVkIG1lbWJsayBsYXRlci4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBwcmlu
dGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgIkRUOiBOVU1BIE5PREUgJXUg
KCUiUFJJeDY0DQo+ID4gKyAgICAgICAgICAgICAgICItJSJQUkl4NjQiKSBvdmVybGFwcyB3aXRo
IGl0c2VsZiAoJSJQUkl4NjQiLQ0KPiAlIlBSSXg2NCIpXG4iLA0KPiA+ICsgICAgICAgICAgICAg
ICBub2RlLCBzdGFydCwgZW5kLA0KPiA+ICsgICAgICAgICAgICAgICBub2RlX21lbWJsa19yYW5n
ZVtpXS5zdGFydCwgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gPiArICAgIH0gZWxzZSB7
DQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBDb25mbGljdCB3aXRoIG1lbWJsayBp
biBvdGhlciBub2RlLCB0aGlzIGlzIGFuIGVycm9yLg0KPiA+ICsgICAgICAgICAqIFRoZSBOVU1B
IGluZm9ybWF0aW9uIGlzIGludmFsaWQsIE5VTUEgd2lsbCBiZSB0dXJuIG9mZi4NCj4gPiArICAg
ICAgICAgKi8NCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+ICsgICAgICAgICAg
ICAgICAiRFQ6IE5VTUEgTk9ERSAldSAoJSJQUkl4NjQiLSUiDQo+ID4gKyAgICAgICAgICAgICAg
IFBSSXg2NCIpIG92ZXJsYXBzIHdpdGggTk9ERSAldSAoJSJQUkl4NjQiLSUiUFJJeDY0IilcbiIs
DQo+ID4gKyAgICAgICAgICAgICAgIG5vZGUsIHN0YXJ0LCBlbmQsIG1lbWJsa19ub2RlaWRbaV0s
DQo+ID4gKyAgICAgICAgICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0YXJ0LCBub2RlX21l
bWJsa19yYW5nZVtpXS5lbmQpOw0KPiA+ICsgICAgICAgIGJhZF9zcmF0KCk7DQo+ID4gKyAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICtzYXZlX21lbWJsazoN
Cj4gPiArICAgIG5kID0gJm5vZGVzW25vZGVdOw0KPiA+ICsgICAgaWYgKCAhbm9kZV90ZXN0X2Fu
ZF9zZXQobm9kZSwgbWVtb3J5X25vZGVzX3BhcnNlZCkgKSB7DQo+ID4gKyAgICAgICAgbmQtPnN0
YXJ0ID0gc3RhcnQ7DQo+ID4gKyAgICAgICAgbmQtPmVuZCA9IGVuZDsNCj4gPiArICAgIH0gZWxz
ZSB7DQo+ID4gKyAgICAgICAgaWYgKCBzdGFydCA8IG5kLT5zdGFydCApDQo+ID4gKyAgICAgICAg
ICAgIG5kLT5zdGFydCA9IHN0YXJ0Ow0KPiA+ICsgICAgICAgIGlmICggbmQtPmVuZCA8IGVuZCAp
DQo+ID4gKyAgICAgICAgICAgIG5kLT5lbmQgPSBlbmQ7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+
ICsgICAgcHJpbnRrKFhFTkxPR19JTkZPICJEVDogTlVNQSBub2RlICV1ICUiUFJJeDY0Ii0lIlBS
SXg2NCJcbiIsDQo+ID4gKyAgICAgICAgICAgbm9kZSwgc3RhcnQsIGVuZCk7DQo+ID4gKw0KPiA+
ICsgICAgbm9kZV9tZW1ibGtfcmFuZ2VbbnVtX25vZGVfbWVtYmxrc10uc3RhcnQgPSBzdGFydDsN
Cj4gPiArICAgIG5vZGVfbWVtYmxrX3JhbmdlW251bV9ub2RlX21lbWJsa3NdLmVuZCA9IGVuZDsN
Cj4gPiArICAgIG1lbWJsa19ub2RlaWRbbnVtX25vZGVfbWVtYmxrc10gPSBub2RlOw0KPiA+ICsg
ICAgbnVtX25vZGVfbWVtYmxrcysrOw0KPiANCj4gDQo+IElzIGl0IHBvc3NpYmxlIHRvIGhhdmUg
bm9uLWNvbnRpZ291cyByYW5nZXMgb2YgbWVtb3J5IGZvciBhIHNpbmdsZSBOVU1BDQo+IG5vZGU/
DQo+IA0KPiBMb29raW5nIGF0IHRoZSBEVCBiaW5kaW5ncyBhbmQgTGludXggaW1wbGVtZW50YXRp
b24sIGl0IHNlZW1zIHBvc3NpYmxlLg0KPiBIZXJlLCBpdCBzZWVtcyB0aGF0IG5vZGVfbWVtYmxr
X3JhbmdlL21lbWJsa19ub2RlaWQgY291bGQgaGFuZGxlIGl0LA0KPiBidXQgbm9kZXMgY291bGRu
J3QuDQoNClllcywgeW91J3JlIHJpZ2h0LiBJIGNvcGllZCB0aGlzIGNvZGUgZm9yIHg4NiBBQ1BJ
IE5VTUEuIERvZXMgQUNQSSBhbGxvdw0Kbm9uLWNvbnRpZ3VvdXMgcmFuZ2VzIG9mIG1lbW9yeSBm
b3IgYSBzaW5nbGUgTlVNQSBub2RlIHRvbz8gSWYgeWVzLCBJIHRoaW5rDQp0aGlzIHdpbGwgYWZm
ZWN0IHg4NiBBQ1BJIE5VTUEgdG9vLiBJbiBuZXh0IHZlcnNpb24sIHdlIHBsYW4gdG8gbWVyZ2UN
CmR0Yl9udW1hX21lbW9yeV9hZmZpbml0eV9pbml0IGFuZCBhY3BpX251bWFfbWVtb3J5X2FmZmlu
aXR5X2luaXQgaW50byBhDQpuZXV0cmFsIGZ1bmN0aW9uLiBTbyB3ZSBjYW4gZml4IHRoZW0gYXQg
dGhlIHNhbWUgdGltZS4NCg0KSWYgbm90LCBtYXliZSB3ZSBoYXZlIHRvIGtlZXAgdGhlIGRpdmVy
c2l0eSBmb3IgZHRiIGFuZCBBQ1BJIGhlcmUuDQpBbnl3YXksIFRoYW5rcyBmb3IgcG9pbnRpbmcg
dGhpcywgSSB3aWxsIGxvb2sgaW50byB0aGUgbGF0ZXN0IExpbnV4DQppbXBsZW1lbnRhdGlvbi4N
Cg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KDQo=

