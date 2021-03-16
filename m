Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3C33DA79
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 18:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98430.186735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMDJL-0000sr-AJ; Tue, 16 Mar 2021 17:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98430.186735; Tue, 16 Mar 2021 17:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMDJL-0000sS-6b; Tue, 16 Mar 2021 17:16:51 +0000
Received: by outflank-mailman (input) for mailman id 98430;
 Tue, 16 Mar 2021 17:16:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o079=IO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lMDJK-0000sN-60
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 17:16:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0ea7f46-78e9-4d16-9cac-593a4e300526;
 Tue, 16 Mar 2021 17:16:49 +0000 (UTC)
Received: from DB6PR0802CA0036.eurprd08.prod.outlook.com (2603:10a6:4:a3::22)
 by DBBPR08MB6313.eurprd08.prod.outlook.com (2603:10a6:10:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 17:16:47 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::4) by DB6PR0802CA0036.outlook.office365.com
 (2603:10a6:4:a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Tue, 16 Mar 2021 17:16:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 17:16:47 +0000
Received: ("Tessian outbound 259fb7427a57:v87");
 Tue, 16 Mar 2021 17:16:47 +0000
Received: from 9f2d0a9b12f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7014543-FA7A-4C27-8A9B-C4CEFFDC0899.1; 
 Tue, 16 Mar 2021 17:16:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f2d0a9b12f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Mar 2021 17:16:40 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB4703.eurprd08.prod.outlook.com (2603:10a6:802:b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 17:16:36 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 17:16:36 +0000
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
X-Inumbo-ID: b0ea7f46-78e9-4d16-9cac-593a4e300526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxZQ4dQ4ONBqprdwygfqlLRxjnGYVCv+JAFlVxH/v0Y=;
 b=oc9TzB+8OOKg6u6ZZ0ZUoVQNWlKLhQ1dLUqDDHv8PDccFUHWGxMlk6EM4fca+Sgmiv8jZreR2Ef1tGGX1vZm7bZix1lOy3pAgsoBT9oJu90eo6+8AvA2R96HHuta7kc0v7EpjMoB+ZnSq9TM04jC0bk7+A8Z+LgQlLvDsHk/E4c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01ba933043eaa1af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqVek89DHntji3CWD/ZCra1wiPwVZKsPWXNcTqL4CCK607R2/N4fq3b4feZxW8NycJW6iMzM7J0QFiYTVgfL9Mex+RFInzJwEXEfgJe/Ti/erk18BQj012JK75yHdEvGQxUfM+dCfRhgQjzCCf9OaDj2DDLxfVntYl8GxXZI4RYsaC0rAnnyC7FUo3brYkXux3dfrfbKifzo6nWiGAGLOmrypGAhNppMgUR8KymxjQ9QCie4TcXjt+UcFRDCz1ByqEnrHPoTJJzDPDXLnmYf81Go5Pvfkwd5tw6s+egpx+LnfixvUOO2IXKmQjZQ37+QwSWCxI8rRmPp8m/jtd6Tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxZQ4dQ4ONBqprdwygfqlLRxjnGYVCv+JAFlVxH/v0Y=;
 b=C4Fb+ap6eZ8vuZtsYlgKvla6qDP7iXAnqZuZHqr77uQaQVB/piQO6enY9HI4vl3ChVy3OiRbBkjTO/s9t9tRUHqu1x/NJWerj1m7LFPWquCw0p7hCKXkA5opJE93apTu+DmFKyezXSNiD6tmXrDNAYUmRT4vh3S9hGRHMWDUYsBQeCxw+W2cob1Pd8Kjj3k2gZ90m6rYW7NATE03fA044mubpOqQKORVjl59Go1xqfUbTITq/cAaDngT7ZkaaHMvVZAjwaQv8llWjfRJ+uxHFfTBeDDc6u+K8eoYil74aQPtwMZs8EzI/uF8OMKRXP2G2WIA4V7fYHBQ+9kohiJLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxZQ4dQ4ONBqprdwygfqlLRxjnGYVCv+JAFlVxH/v0Y=;
 b=oc9TzB+8OOKg6u6ZZ0ZUoVQNWlKLhQ1dLUqDDHv8PDccFUHWGxMlk6EM4fca+Sgmiv8jZreR2Ef1tGGX1vZm7bZix1lOy3pAgsoBT9oJu90eo6+8AvA2R96HHuta7kc0v7EpjMoB+ZnSq9TM04jC0bk7+A8Z+LgQlLvDsHk/E4c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
Thread-Topic: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
Thread-Index: AQHXGCLVbl4hty1bX0WFvkxXr3KxFaqFDwwAgAGybICAAB5+gA==
Date: Tue, 16 Mar 2021 17:16:36 +0000
Message-ID: <4066B6A3-2904-4800-B63A-7EAD1EFC7D16@arm.com>
References: <20210313160611.18665-1-julien@xen.org>
 <D7999820-4FE4-4338-A93E-8641AF29F56C@arm.com>
 <119bdbc0-5400-87eb-e6ad-87b59ec4e07c@xen.org>
In-Reply-To: <119bdbc0-5400-87eb-e6ad-87b59ec4e07c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0f22e1ff-c619-4213-a21c-08d8e89f47b3
x-ms-traffictypediagnostic: VE1PR08MB4703:|DBBPR08MB6313:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6313A8069B83D3D79B5D33669D6B9@DBBPR08MB6313.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 flCxCAhQOsJC4d60fcWrDF9A7HiGLqlECWe0FmD4r8F7A0MWGXUf6Q/OERR/Pxn1zZc26DY7qltHkO7kUdWHQmd/FBkkPhEMX5tLon6FHM1IMWWaxazRhByiZRAufV1R8NIO3+QBBETXgcqaDy7FMwAZb92KWAWFbTHXAACyC0rEE00Uf5De/B60puAh8IRh4d79PYQBFOdG/0jBUcdpbxBdQDaaD/Wek3rn/2yzJ7k1dSw2eugU5xFCo5RS9rYLNRUdhtKWsXeXYixU1EMACKT1lJ657izIM5yUHgppiyc6oHOxnA2JC9WzdbaugmoAOLgQX0SOXGF8EHsXy9b2OgKNNT9CxSSX3chZaSVPealO7vPlZWXzyZFUQxAnk1Y8CsRSTb/t75w30bZayMbdfK656B/RB+1583oqzuQBAotZMgX0AIUVN7ZR6peeOY0MK7xJLfzuttbwtqGsca4CkKAzDBCPtuXkj4BuurQUqzKYIxXsfybXcXqfG96ucTDQyZ0uRH363EJ+O9F1oaRrFfeZfRNLjFkNC7t1b3jpcBwaliCRuLztex+/7Wxhph+Cd7lzA/SuuPuzwzl7gLo8SAkJ8+SKPjznCAs7AewPT4GYGr6H9//v7tRiV7WCwr6Vgq2v12BndzBmg+ClssjiNZNbk9oXYTu8gGVyUPmKmMoEGcLxGzurImE7kR9zvTFxBH+6cNtBvrZxXdeMnESSbP6ES79+7GJ8Uwt+hpBbYaU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(4326008)(6486002)(2616005)(76116006)(71200400001)(66946007)(36756003)(966005)(6916009)(5660300002)(55236004)(478600001)(66446008)(66556008)(53546011)(316002)(91956017)(6506007)(64756008)(66476007)(54906003)(33656002)(8936002)(2906002)(86362001)(8676002)(83380400001)(6512007)(26005)(186003)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?aE1BeVRjcGdnVFJLdWtra1o5T2xyV2VNaStKU3B0T2xobGhKTHJnS1Nwa0VH?=
 =?utf-8?B?UmJlMExuMjBEZVN3S3Zuam5GSk1OV1gwVGdnNTZ0Mmt0Q1NOV1NFSHFpWDJt?=
 =?utf-8?B?VlNYTkhNbjc5bXFrQXU5akpVN2JYVXNhM1BOdUszTzhjdWhLUjQvMGVMeUNW?=
 =?utf-8?B?YTF2cWJnWGs0Z2p2NDF0UVRCb0k0VDRJUEtTWDlTcnVtSDRKT0pNSmo1dEpi?=
 =?utf-8?B?L1RrQlF0N3d6WlZidmdKdUF3R3dSVU9vZU95aGRoeERDYnRNS0VwbTJIUmYz?=
 =?utf-8?B?YzQwa1p4VU9ZaVZsM2RuNkJnN1diT0trWllLSzZ5dzBxV1M0cVU4aGJjc2FQ?=
 =?utf-8?B?ZWJxUWZ6Mjl1MHJVSlByK2s4T2VPdDlkUENKeEI0WXNwc3dVRTBqazdRUkds?=
 =?utf-8?B?ME1yU25mdEpuWTVYUktoRUdmTUEzczdYNit0bFlqMGpDU1hLaTVicnFEMjFn?=
 =?utf-8?B?K0dmYWxZNUxrSXJTVFl6SkRBemx0OUlTZHpxTE1iUVBsRWdlLzZTcHFWZDRl?=
 =?utf-8?B?Wm1WV050SHQxZ0FHS2VDOW5hTXR0VkhJMnZoNW5Tb1pLbEQ1RWtZdk40UjVC?=
 =?utf-8?B?V0Q2WHVYYitOVmJvNFVSbnZHaVhNRXRLMGhGL0lScFZHV2RJcDM5RHdSeW9r?=
 =?utf-8?B?cmVBVFdmOGJvU3ZvU3RES25waU1NdFJvVEJGL1NucEFJMHZNVll4V1VuVDNl?=
 =?utf-8?B?ZmdWVFA0QW55SGI5dW5Ec2JQdDdmTVJXaHNQVE5PUzJUZU5sU1M5WmZ5QU4x?=
 =?utf-8?B?K0tSNGNReGhzQXhKb0ZLT3hpMlFoUDN1VTdZUzZkVW91VWpPWUtOc3dHRzhn?=
 =?utf-8?B?bEgrT2xsU3FkZHpsdUZuR0d0bzl1ajRyWTE3dm9CcXFYVEdIaVh1TXR4Zmpu?=
 =?utf-8?B?a3M5dWpIWUpaekY2R3BHRUhkaGNkN1ovaitEUVV5Z3lXWlgySlRGM3paV3p5?=
 =?utf-8?B?M1FpMlNBekZucExtWlZ5RFJOZytNS1J4cmc0Nmw5Wit6dHpQTnQzQnBvMU00?=
 =?utf-8?B?SmlEMjgyRW9NazJDdmI1WHlnR1lEZjdiWGhVVXNTL2RPV1hScWp3TldTTW5r?=
 =?utf-8?B?cTdZTW4wZExTNHpIVHg3Um5LRWg4M3FIWGt1OUlzYnJaWVlSZmc3akJYN0gx?=
 =?utf-8?B?R0UrZWZoRnluZXg5Mjh5NWZEb1BJbU5VaGZsZVk4ZHVvZE5WcEo2KzhSQ0t6?=
 =?utf-8?B?UEpHWldQVExiWDJYdVFLNTRvZWtqR2kyQkNRV3djaVBXekhOUjV0aWMxN3FC?=
 =?utf-8?B?OWdhUGJkZkFacENyTjJ4Y0k4WmJ4RzgrcnpZb0lmSEJNSXNERGNscG1Wek45?=
 =?utf-8?B?T0xwUDVnKzNheFFGTmMwaDNRWnN5ck9ETWtXdGRZZXc5emtvNVJMMmwzTHdT?=
 =?utf-8?B?cmxZcjRJa3VkUFNWT1hvSlJUb093NXNHOW1kWkZLMURmNGRBKzJDYmQ1ZFk1?=
 =?utf-8?B?bm9VT3h4MlNmZ3lNNXZhK3pWcVJ5ZFQ2a0xnaDIvMU1yK0Y2dlRnRVk0azJC?=
 =?utf-8?B?VnVSUGp6Kys0NGhDNE9lTTdHNU96NVp6a1hrdVFLRzNxSEp5amxRRldFQ3dT?=
 =?utf-8?B?RnhXUUJ4ejNwQTc2UXlIeU5xeGJNeWlJbFFGYUpJOTFJU0xLTFZ0QTdmWUtR?=
 =?utf-8?B?VFF0NC9Ubm5ncHBtWVlrWXM1STErSURETVd4eU9WRkNzUzVWSUtmdEd5Znlw?=
 =?utf-8?B?cEhHaXdhSGZnZmRsMkNJV2d6NVVhaGROaEc5Zm9XRndGd2J6Q3JNVkczMllC?=
 =?utf-8?Q?ilNzxtxXMNqhfY3IHACD+tiLoWQoyYC304B1ljz?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC8BA9994FCB044EB45B3DA73C38C348@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9bdbf9c0-012c-4ae7-42bf-08d8e89f414b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZK6+Q6iXmMFpsLBJu9WukNUhy50x7ipd1NQu697AdhjbJadX/TvLfwQejaBGGaORnkKLxTw9mzoDDP8VfCq5h1xiRu8OCX6n/QIs0TIeE6oSIRexOz/wjFFZM6yM7bM5YZrrESNedUQAZUsslUdV8kCcU7uv7CkjbajpKx9wKDUtPWcYJQ6OPLCjWIpFxQ4wy4SwZO0uDMPKGVgvAqfbP/aEjKRFR4dl+D6Y0Oed10AyRHl/V2sEOegqEGb5rySfWVT8376ytlqc/vCSkIT1x07lxeDzB3P3aFXeyZ/5Xa74pdLwMzbrRmg0S48coMopx9qYerukP8ev0yU4qFfjD5BGAaHkGPGIhruKZ+3zrgD0ZFyhkeUK7QRImB/bkeRYe/Kc45QilTJfsxNL1G6NuGdrZQutCd+Y21je/n9V4OUwtZv71Hx0GDSVafiWVgLMd8amN3jHT484OfptK3zHtBDLC6zD5q0LXKfbNilgFvBf1zirA1TMFtg//h/AZFP4E2MyfEyJ6UKfz2HaW99yWN/YSnXD6TxqXMRvnjA3HPHpGhlK4yqZdzp6aTSCpx0z6n90S9Jxnc6f90FxOeSYATmS+s+hLMvww1wE0dySiWaGC6h8iTmcmlb+u2TDBv171JU2zAfZ26+o7G8wXSYo4JHj1O/XawkfLulK2qx4swTNEa2dVdvXMn3rlZfH38XPl+VlUNkBWGaZ9BFr56urK/ilAiZNdRnRxTRtfanJIysx0/G6OrsA5IV9VV0sj9SY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(36840700001)(46966006)(107886003)(6862004)(316002)(86362001)(4326008)(82310400003)(6486002)(356005)(36756003)(966005)(8936002)(8676002)(55236004)(336012)(5660300002)(2906002)(6512007)(6506007)(82740400003)(53546011)(81166007)(54906003)(83380400001)(2616005)(47076005)(70586007)(186003)(26005)(36860700001)(70206006)(33656002)(478600001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 17:16:47.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f22e1ff-c619-4213-a21c-08d8e89f47b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6313

SGkgSnVsaWVuLA0KDQo+IE9uIDE2IE1hciAyMDIxLCBhdCAxNToyNywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE1LzAzLzIwMjEgMTM6MzIs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBCZXJ0cmFu
ZCwNCj4gDQo+Pj4gT24gMTMgTWFyIDIwMjEsIGF0IDE2OjA2LCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPg0KPj4+IA0KPj4+IEhpIGFsbCwNCj4+PiANCj4+PiBMYXN0IHllYXIsIEFybSBy
ZWxlYXNlZCBhIHdoaXRlcGFwZXIgYWJvdXQgYSBuZXcgY2F0ZWdvcnkgb2Ygc3BlY3VsYXRpb24u
DQo+Pj4gKHNlZSBbMV0gYW5kIFsyXSkuIEluIHNob3J0LCBhIHByb2Nlc3NvciBtYXkgYmUgYWJs
ZSB0byBzcGVjdWxhdGUgcGFzdA0KPj4+IHNvbWUgb2YgdGhlIHVuY29uZGl0aW9uYWwgY29udHJv
bCBmbG93IGluc3RydWN0aW9ucyAoZS5nIGVyZXQsIHNtYywgYnIpLg0KPj4+IA0KPj4+IEluIHNv
bWUgb2YgdGhlIGNhc2VzLCB0aGUgcmVnaXN0ZXJzIHdpbGwgY29udGFpbiB2YWx1ZXMgY29udHJv
bGxlZCBieQ0KPj4+IHRoZSBndWVzdC4gV2hpbGUgdGhlcmUgaXMgbm8ga25vd24gZ2FkZ2V0IGFm
dGVyd2FyZHMsIHdlIHN0aWxsIHdhbnQgdG8NCj4+PiBwcmV2ZW50IGFueSBsZWFrYWdlIGluIHRo
ZSBmdXR1cmUuDQo+Pj4gDQo+Pj4gVGhlIG1pdGlnYXRpb24gaXMgcGxhbm5lZCBpbiB0d28gcGFy
dHM6DQo+Pj4gICAxKSBBcm0gcHJvdmlkZWQgcGF0Y2hlcyBmb3IgYm90aCBHQ0MgYW5kIExMVk0g
dG8gYWRkIHNwZWN1bGF0aW9uIGJhcnJpZXINCj4+PiAgIGFuZCByZW1vdmUgcHJvYmxlbWF0aWMg
Y29kZSBzZXF1ZW5jZS4NCj4+PiAgIDIpIEluc3BlY3Rpb24gb2YgYXNzZW1ibHkgY29kZSBhbmQg
Y2FsbCB0byBoaWdoZXIgbGV2ZWwgKGUuZyBzbWMgaW4gb3VyIGNhc2UpLg0KPj4+IA0KPj4+IEkg
c3RpbGwgaGF2ZW4ndCBsb29rZWQgYXQgMSkgYW5kIGhvdyB0byBtaXRpZ2F0ZSBwcm9wZXJseSBB
cm0zMiAoc2VlDQo+Pj4gcGF0Y2ggIzEpIGFuZCBTTUMgY2FsbC4gU28gdGhpcyBpc3N1ZSBpcyBu
b3QgZnVsbHkgYWRkcmVzc2VkLg0KPj4+IA0KPj4+IE5vdGUgdGhhdCB0aGUgRVJFVCBpbnN0cnVj
dGlvbiB3YXMgYWxyZWFkeSBhZGRyZXNzZWQgYXMgcGFydCBvZiBYU0EtMzEyLg0KPj4gT24gbXkg
dGVzdHMsIHRoaXMgc2VyaWUgaXMgYnJlYWtpbmcgdGhlIGFybTY0IGJ1aWxkOg0KPj4gfCBhYXJj
aDY0LXBva3ktbGludXgtbGQgLS1zeXNyb290PS9ob21lL2Jlcm1hcjAxL0RldmVsb3BtZW50L3hl
bi1kZXYvYnVpbGQvcHJvZmlsZS1mdnAtYmFzZS5wcmovdG1wL3dvcmsvZnZwX2Jhc2UtcG9reS1s
aW51eC94ZW4vNC4xNStnaXQxLXIwL3JlY2lwZS1zeXNyb290ICAgICAgICAgLUVMICAtLWZpeC1j
b3J0ZXgtYTUzLTg0MzQxOSAtLWZpeC1jb3J0ZXgtYTUzLTg0MzQxOSAtciAtbyBidWlsdF9pbi5v
IG1lbWNweS5vIG1lbWNtcC5vIG1lbW1vdmUubyBtZW1zZXQubyBtZW1jaHIubyBjbGVhcl9wYWdl
Lm8gYml0b3BzLm8gZmluZF9uZXh0X2JpdC5vIHN0cmNoci5vIHN0cmNtcC5vIHN0cmxlbi5vIHN0
cm5jbXAubyBzdHJubGVuLm8gc3RycmNoci5vDQo+IA0KPiBJIGNhbid0IHNlZSBhbnkgYnVpbGQg
ZmFpbHVyZSB3aXRoIHRoZSBmb2xsb3dpbmcgR0NDOg0KPiANCj4gNDJzaD4gYWFyY2g2NC1saW51
eC1nbnUtZ2NjDQo+IGFhcmNoNjQtbGludXgtZ251LWdjYyAoVWJ1bnR1L0xpbmFybyA3LjUuMC0z
dWJ1bnR1MX4xOC4wNCkgNy41LjANCj4gQ29weXJpZ2h0IChDKSAyMDE3IEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbiwgSW5jLg0KPiBUaGlzIGlzIGZyZWUgc29mdHdhcmU7IHNlZSB0aGUgc291cmNl
IGZvciBjb3B5aW5nIGNvbmRpdGlvbnMuICBUaGVyZSBpcyBOTw0KPiB3YXJyYW50eTsgbm90IGV2
ZW4gZm9yIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4NCj4gDQo+IEFGQUlDVCwgdGhlcmUgaXMgYWxzbyBubyBjb21waWxhdGlvbiBpc3N1ZSByZXBv
cnRlZCBieSBnaXRsYWI6DQo+IA0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGF0
Y2hldy94ZW4vLS9waXBlbGluZXMvMjY5OTg5ODk0DQo+IA0KPiBXaGF0J3MgdGhlIHZlcnNpb24g
b2YgeW91ciBjb21waWxlcj8gRG8geW91IGhhdmUgc3RlcHMgdG8gcmVwcm9kdWNlIHlvdXIgc2V0
dXA/DQoNCllvdSBuZWVkIHRvIGhhdmUgZWFybHlwcmludGsgZW5hYmxlZA0KSSBhbSB1c2luZyBn
Y2MgNy41LjA6DQphYXJjaDY0LWxpbnV4LWdudS1nY2MgKFVidW50dS9MaW5hcm8gNy41LjAtM3Vi
dW50dTF+MTguMDQpIDcuNS4wDQoNCm9uZSBjb25maWd1cmF0aW9uIHRyaWdnZXJpbmcgdGhlIGlz
c3VlIGlzIHVzaW5nIHRoZSBkZWZhdWx0IC5jb25maWcgd2l0aCB0aGUgZm9sbG93aW5nIGl0ZW1z
IGFkZGVkOg0KQ09ORklHX1NVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1M9eQ0KQ09O
RklHX0RFQlVHX0xPQ0tfUFJPRklMRT15DQpDT05GSUdfUEVSRl9DT1VOVEVSUz15DQpDT05GSUdf
UEVSRl9BUlJBWVM9eQ0KQ09ORklHX0RFVklDRV9UUkVFX0RFQlVHPXkNCkNPTkZJR19ERUJVR19U
UkFDRT15DQpDT05GSUdfRUFSTFlfUFJJTlRLX0pVTk89eQ0KQ09ORklHX0VBUkxZX1VBUlRfUEww
MTE9eQ0KQ09ORklHX0VBUkxZX1BSSU5USz15DQpDT05GSUdfRUFSTFlfVUFSVF9CQVNFX0FERFJF
U1M9MHg3ZmY4MDAwMA0KQ09ORklHX0VBUkxZX1VBUlRfUEwwMTFfQkFVRF9SQVRFPTExNTIwMA0K
Q09ORklHX0VBUkxZX1VBUlRfSU5JVD15DQpDT05GSUdfRUFSTFlfUFJJTlRLX0lOQz0iZGVidWct
cGwwMTEuaW5j4oCdDQoNCj4gDQo+PiB8IGFybTY0L2hlYWQuUzogQXNzZW1ibGVyIG1lc3NhZ2Vz
Og0KPj4gfCBhcm02NC9oZWFkLlM6MzA1OiBFcnJvcjogdW5rbm93biBtbmVtb25pYyBgcm9kYXRh
X3N0cicgLS0gYHJvZGF0YV9zdHIoOTgsICItIEJvb3QgQ1BVIGJvb3RpbmcgLVxyXG4iKScNCj4g
DQo+IFRoaXMgaXMgc3RyYW5nZSwgdGhlIGNvZGUgc2hvdWxkIHVzZSBST0RBVEFfU1RSKCkgYnV0
IGhlcmUgaXQgaXMgaW4gbG93ZXIgY2FzZS4gQ2FuIHlvdSBjaGVjayBpbiB5b3VyIHRyZWUgd2hl
dGhlciB0aGVyZSBzb21lIGluc3RhbmNlIG9mIHRoZSBsb3dlciBjYXNlIHZlcnNpb24/DQoNCkkg
aGF2ZSBubyBpbnN0YW5jZSBvZiByb2RhdGFfc3RyIGluIGxvd2VyIGNhc2UuDQoNCj4gDQo+IElm
IG5vdCwgdGhpcyBtYXkganVzdCBiZSBHQVMgcHJpbnRpbmcgaW4gbG93ZXIgY2FzZXMuDQoNCml0
IHByb2JhYmx5IGlzIHRoZW4uDQoNCklmIHlvdSBuZWVkIGhlbHAgb24gdGhpcyBpIGNhbiB0cnkg
dG8gZGlnIG9uIHRoYXQgYSBiaXQgbGF0ZXIgdGhpcyB3ZWVrICh0aHVyc2RheSBvciBmcmlkYXkp
Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+PiB8IGFybTY0L2hlYWQuUzozMzE6IEVycm9y
OiB1bmtub3duIG1uZW1vbmljIGByb2RhdGFfc3RyJyAtLSBgcm9kYXRhX3N0cig5OCwgIi0gUmVh
ZHkgLVxyXG4iKScNCj4+IHwgYXJtNjQvaGVhZC5TOjM2NTogRXJyb3I6IHVua25vd24gbW5lbW9u
aWMgYHJvZGF0YV9zdHInIC0tIGByb2RhdGFfc3RyKDk4LCAiLSBDUFUgIiknDQo+PiB8IG1ha2Vb
Nl06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9iZXJtYXIwMS9EZXZlbG9wbWVudC94ZW4tZGV2
L2J1aWxkL3Byb2ZpbGUtZnZwLWJhc2UucHJqL3RtcC93b3JrL2Z2cF9iYXNlLXBva3ktbGludXgv
eGVuLzQuMTUrZ2l0MS1yMC9sb2NhbC14ZW4veGVuL3hlbi9hcmNoL2FybS9hcm02NC9saWInDQo+
PiB8IGFybTY0L2hlYWQuUzozNjc6IEVycm9yOiB1bmtub3duIG1uZW1vbmljIGByb2RhdGFfc3Ry
JyAtLSBgcm9kYXRhX3N0cig5OCwgIiBib290aW5nIC1cclxuIiknDQo+PiB8IGFybTY0L2hlYWQu
UzozOTg6IEVycm9yOiB1bmtub3duIG1uZW1vbmljIGByb2RhdGFfc3RyJyAtLSBgcm9kYXRhX3N0
cig5OCwgIi0gUmVhZHkgLVxyXG4iKScNCj4+IHwgYXJtNjQvaGVhZC5TOjQxMjogRXJyb3I6IHVu
a25vd24gbW5lbW9uaWMgYHJvZGF0YV9zdHInIC0tIGByb2RhdGFfc3RyKDk4LCAiLSBDdXJyZW50
IEVMICIpJw0KPj4gfCBhcm02NC9oZWFkLlM6NDE1OiBFcnJvcjogdW5rbm93biBtbmVtb25pYyBg
cm9kYXRhX3N0cicgLS0gYHJvZGF0YV9zdHIoOTgsICIgLVxyXG4iKScNCj4+IHwgYXJtNjQvaGVh
ZC5TOjQyNDogRXJyb3I6IHVua25vd24gbW5lbW9uaWMgYHJvZGF0YV9zdHInIC0tIGByb2RhdGFf
c3RyKDk4LCAiLSBYZW4gbXVzdCBiZSBlbnRlcmVkIGluIE5TIEVMMiBtb2RlIC1cclxuIiknDQo+
PiB8IGFybTY0L2hlYWQuUzo0MjU6IEVycm9yOiB1bmtub3duIG1uZW1vbmljIGByb2RhdGFfc3Ry
JyAtLSBgcm9kYXRhX3N0cig5OCwgIi0gUGxlYXNlIHVwZGF0ZSB0aGUgYm9vdGxvYWRlciAtXHJc
biIpJw0KPj4gfCBhcm02NC9oZWFkLlM6NDQxOiBFcnJvcjogdW5rbm93biBtbmVtb25pYyBgcm9k
YXRhX3N0cicgLS0gYHJvZGF0YV9zdHIoOTgsICItIFplcm8gQlNTIC1cclxuIiknDQo+PiB8IGFy
bTY0L2hlYWQuUzo0NTk6IEVycm9yOiB1bmtub3duIG1uZW1vbmljIGByb2RhdGFfc3RyJyAtLSBg
cm9kYXRhX3N0cig5OCwgIi0gSW5pdGlhbGl6ZSBDUFUgLVxyXG4iKScNCj4+IHwgYXJtNjQvaGVh
ZC5TOjY1NDogRXJyb3I6IHVua25vd24gbW5lbW9uaWMgYHJvZGF0YV9zdHInIC0tIGByb2RhdGFf
c3RyKDk4LCAiLSBVbmFibGUgdG8gYnVpbGQgYm9vdCBwYWdlIHRhYmxlcyAtIHZpcnQgYW5kIHBo
eXMgYWRkcmVzc2VzIGNsYXNoLiAtXHJcbiIpJw0KPj4gfCBhcm02NC9oZWFkLlM6NjY2OiBFcnJv
cjogdW5rbm93biBtbmVtb25pYyBgcm9kYXRhX3N0cicgLS0gYHJvZGF0YV9zdHIoOTgsICItIFR1
cm5pbmcgb24gcGFnaW5nIC1cclxuIiknDQo+PiB8IGFybTY0L2hlYWQuUzo4MDA6IEVycm9yOiB1
bmtub3duIG1uZW1vbmljIGByb2RhdGFfc3RyJyAtLSBgcm9kYXRhX3N0cig5OCwgIi0gQm9vdCBm
YWlsZWQgLVxyXG4iKScNCj4+IHwgYXJtNjQvaGVhZC5TOjg0ODogRXJyb3I6IHVua25vd24gbW5l
bW9uaWMgYHJvZGF0YV9zdHInIC0tIGByb2RhdGFfc3RyKDk4LCAiLSBVQVJUIGVuYWJsZWQgLVxy
XG4iKScNCj4+IHwge3N0YW5kYXJkIGlucHV0fTogRXJyb3I6IGxvY2FsIGxhYmVsIGAiOTgiIChp
bnN0YW5jZSBudW1iZXIgMSBvZiBhIGZiIGxhYmVsKScgaXMgbm90IGRlZmluZWQNCj4+IHwgL2hv
bWUvYmVybWFyMDEvRGV2ZWxvcG1lbnQveGVuLWRldi9idWlsZC9wcm9maWxlLWZ2cC1iYXNlLnBy
ai90bXAvd29yay9mdnBfYmFzZS1wb2t5LWxpbnV4L3hlbi80LjE1K2dpdDEtcjAvbG9jYWwteGVu
L3hlbi94ZW4vUnVsZXMubWs6MjA0OiByZWNpcGUgZm9yIHRhcmdldCAnYXJtNjQvaGVhZC5vJyBm
YWlsZWQNCj4+IFRoaXMgd2FzIGRvbmUgYWRkaW5nIHlvdXIgMiBwYXRjaGVzIG9uIHRvcCBvZiBj
dXJyZW50IHN0YWdpbmcuDQo+PiBDaGVlcnMNCj4+IEJlcnRyYW5kDQo+Pj4gDQo+Pj4gQ2hlZXJz
LA0KPj4+IA0KPj4+IFsxXSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL3N1cHBvcnQvYXJtLXNl
Y3VyaXR5LXVwZGF0ZXMvc3BlY3VsYXRpdmUtcHJvY2Vzc29yLXZ1bG5lcmFiaWxpdHkNCj4+PiBb
Ml0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9zdXBwb3J0L2FybS1zZWN1cml0eS11cGRhdGVz
L3NwZWN1bGF0aXZlLXByb2Nlc3Nvci12dWxuZXJhYmlsaXR5L2Rvd25sb2Fkcy9zdHJhaWdodC1s
aW5lLXNwZWN1bGF0aW9uDQo+Pj4gDQo+Pj4gSnVsaWVuIEdyYWxsICgyKToNCj4+PiAgeGVuL2Fy
bTogSW5jbHVkZSBhc20vYXNtLW9mZnNldHMuaCBhbmQgYXNtL21hY3Jvcy5oIG9uIGV2ZXJ5IGFz
c2VtYmx5DQo+Pj4gICAgZmlsZXMNCj4+PiAgeGVuL2FybTY0OiBQbGFjZSBhIHNwZWN1bGF0aW9u
IGJhcnJpZXIgZm9sbG93aW5nIGFuIHJldCBpbnN0cnVjdGlvbg0KPj4+IA0KPj4+IHhlbi9hcmNo
L2FybS9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAyICstDQo+Pj4geGVuL2FyY2gvYXJtL2Fy
bTMyL2VudHJ5LlMgICAgICAgICAgIHwgIDIgKy0NCj4+PiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TICAgICAgICAgICAgfCAgMSAtDQo+Pj4geGVuL2FyY2gvYXJtL2FybTMyL2xpYi9saWIxZnVu
Y3MuUyAgIHwgIDEgKw0KPj4+IHhlbi9hcmNoL2FybS9hcm0zMi9wcm9jLXY3LlMgICAgICAgICB8
ICAxIC0NCj4+PiB4ZW4vYXJjaC9hcm0vYXJtNjQvZGVidWctY2FkZW5jZS5pbmMgfCAgMSAtDQo+
Pj4geGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLXBsMDExLmluYyAgIHwgIDIgLS0NCj4+PiB4ZW4v
YXJjaC9hcm0vYXJtNjQvZW50cnkuUyAgICAgICAgICAgfCAgMiAtLQ0KPj4+IHhlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMgICAgICAgICAgICB8ICAyIC0tDQo+Pj4geGVuL2FyY2gvYXJtL2FybTY0
L3NtYy5TICAgICAgICAgICAgIHwgIDMgLS0tDQo+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9hcm02
NC9tYWNyb3MuaCAgIHwgIDYgKysrKysrDQo+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9jb25maWcu
aCAgICAgICAgIHwgIDYgKysrKysrDQo+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9tYWNyb3MuaCAg
ICAgICAgIHwgMTggKysrKysrKysrLS0tLS0tLS0tDQo+Pj4gMTMgZmlsZXMgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pDQo+Pj4gDQo+Pj4gLS0gDQo+Pj4gMi4xNy4x
DQo+Pj4gDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

