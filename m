Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51D3F831D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172756.315245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9nt-0004Up-D1; Thu, 26 Aug 2021 07:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172756.315245; Thu, 26 Aug 2021 07:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9nt-0004SX-9h; Thu, 26 Aug 2021 07:28:01 +0000
Received: by outflank-mailman (input) for mailman id 172756;
 Thu, 26 Aug 2021 07:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ9ns-0004SM-7I
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:28:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c07ccdcf-8954-4db1-a0eb-54aa2306675c;
 Thu, 26 Aug 2021 07:27:58 +0000 (UTC)
Received: from PR3P189CA0039.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::14)
 by AM6PR08MB4101.eurprd08.prod.outlook.com (2603:10a6:20b:a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Thu, 26 Aug
 2021 07:27:54 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:53:cafe::a) by PR3P189CA0039.outlook.office365.com
 (2603:10a6:102:53::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 07:27:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:27:54 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Thu, 26 Aug 2021 07:27:54 +0000
Received: from ee3be5e5ecb5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 288665E5-37D5-423E-810D-2C83A0812B4E.1; 
 Thu, 26 Aug 2021 07:27:43 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee3be5e5ecb5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 07:27:43 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3273.eurprd08.prod.outlook.com (2603:10a6:5:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Thu, 26 Aug
 2021 07:27:41 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 07:27:41 +0000
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
X-Inumbo-ID: c07ccdcf-8954-4db1-a0eb-54aa2306675c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0kvqqBAWJXA86SltcJBpWS2wb9ML6I9tsKYUSNkeQw=;
 b=9GK8LgDQPGPd8qri0mEFNq3eDmfWU2yBKaFYWfF3/mUTxFfE+jGp+eShVAY0rW/WzH2kwmCyuauSmHNmm8DHzjxGboyz2anYtR0PjGJeU94WTTPpUu5xV+YPmd8NgDJYdmhibSstKdcTcAawXrM1Z0C9SYs/rIM64gjoJIEZTCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgkYLRdNErl44Sn7ZVXyPaN0+6eu2pUVHIytch4hn7FSHbomILFicCDK2CD4aZM6rZjbxuRmar6kt9F4ZCuiPQjIkIMyviQkt9x7NiM5qwDPqrDwCPDmqpe0ixHpo1dJ0oOImn2o2Avnzu2X7jvp/FZ404Ef+bNSMRM00I8eKOQ5IpVZbuDiUUGz/goQYgXr2UlE1YhgY1dYV3W7xvinoL4J122Kzpof+vs1OPHMcZVRlhPfwEpgVR+Ho7hJpSZPeN/iyFRZD2NrNhwG1kO3Gkiuj+MBfEDT/2upaxQTPequD3PWV+Ccbs2gWqCEOheHw/9LyeFxHHCJEIh2MN6xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0kvqqBAWJXA86SltcJBpWS2wb9ML6I9tsKYUSNkeQw=;
 b=nS5djuBX9CR/IxYoHI/rX3+7Oz0/zKHLxFYd3ipFjQ9MlxngOCN6Ny8BT6JXzSWEnc8BDrUr9fdewSNu3B660qdYrrftdj68sxXDHWGlhIC0JZdYHgL5m1XAyxu8+sFPLEPogMgE8mPr9w30ft101EopFXHlnIrh7sOwodaoAfgg2k7cRhxkQqDeMyfLrjVgSSxSLQAJtTJ1ws/ylr/cpujrVpN8QpV+lqHp6ViJT2yArZTVj3gv4pzseGnVK0VUPZXg2HC0bBgZ8k0KsYchZu/rXlUiuXty1y9H3PBucS9lPXNSN5Fvlzkw4wK2H0cYHYk3/ZE5pTwrgmCZ7+0UBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0kvqqBAWJXA86SltcJBpWS2wb9ML6I9tsKYUSNkeQw=;
 b=9GK8LgDQPGPd8qri0mEFNq3eDmfWU2yBKaFYWfF3/mUTxFfE+jGp+eShVAY0rW/WzH2kwmCyuauSmHNmm8DHzjxGboyz2anYtR0PjGJeU94WTTPpUu5xV+YPmd8NgDJYdmhibSstKdcTcAawXrM1Z0C9SYs/rIM64gjoJIEZTCg=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 29/40] xen/arm: implement Arm arch helpers Arm to
 get memory map info
Thread-Topic: [XEN RFC PATCH 29/40] xen/arm: implement Arm arch helpers Arm to
 get memory map info
Thread-Index: AQHXjptHOflEs7xJrkCP3afsREFdpquEitqAgADvaqA=
Date: Thu, 26 Aug 2021 07:27:41 +0000
Message-ID:
 <DB9PR08MB68579DD0ABD212ECB8B21EFC9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-30-wei.chen@arm.com>
 <05ca94ef-900f-49fa-1e78-daabcf6fa729@xen.org>
In-Reply-To: <05ca94ef-900f-49fa-1e78-daabcf6fa729@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 86F39EDDA50F5E4788F5C16FD839DD0F.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0758e211-3f90-4c44-d6f7-08d968630510
x-ms-traffictypediagnostic: DB7PR08MB3273:|AM6PR08MB4101:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB410107BF1C1544592A54D8179EC79@AM6PR08MB4101.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2150;OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 va/HmisIQeZZRpK3FdqEtAgjMRzBYlp0hgSLXcN8M7oUTf/U1IpOfT3fGWxMFql5gO8kznVeBCPFiE0xCtLxFfW0ivNq92MDNPzhuOzJThAoI3+ImF53GT7SPz++wkF2yLGjQUS6U8pOFmY8yHXG59vT5WcdmXM8dMUWqE6DFJ78YIEuNXe9FhVsQkrduMfMnB8gUNNnCTSpV9D6/nm3LiAFB5im5YLZsbpTgW+KuC4LTSMlPUmihFDfEIWX+012Cv1e5d11+DmC3wFFzIjg9hOaqlnJALv5AJLuzi1YZZvmjSKFR7R23dqMlaSHcNkMZVms6RtPfnhIeqxpyALxk2LB1gDa6fcOkf9CEATRcsZA+ZXkh7/aMLC9olQ05XHoBfHUczZXHdyM2l0N6+A1/rJRZrVLwAU9IbcTOiklEeJf6L1OKLDKNkZvbN3vTkETbi9GZ5z98DJp1sbA6AGj594KabrhfRMgzonATmb1MOIGtopKn6GriWOE+0NCB18rHkvE851hlyyHDtYU4Iq4It0VGrm89dzsXd4S4JifznenRNkWdcMFzSwc2/KEYXj/OJyA+BACAKCsdbyxdIn1c2/0KpcDIUvhx9zWtscKgW+REsLxjK+mQLE/8gTFixpqK8mRGubiC8H+6xHUtUwlMpghwzMyLRAUsr2MwPQAKCWvBOQ9wZuTwKitm+ykgjotoKlt+CiHBMJWvRb5dfwrnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(53546011)(6506007)(38100700002)(52536014)(7696005)(5660300002)(66446008)(478600001)(8936002)(8676002)(110136005)(316002)(4326008)(55016002)(66476007)(33656002)(66946007)(76116006)(66556008)(64756008)(9686003)(83380400001)(86362001)(122000001)(186003)(2906002)(38070700005)(26005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVdBWmtyTzJ3YVNrdy9qTFhvNXFJNFBkdXl6RFA5bGRPUTJBTkpPN0hHdHM3?=
 =?utf-8?B?MjhXOUNzTi9zUmwyWWRBVEVJQXVWRjltY3kyekNGeFVFdHYyUUFYTy9Xdmth?=
 =?utf-8?B?RjdDOVN4RzBTVVIyWU9heU5IczRFcHlaMHIxaUJGQXkrMklnQnJxc3BvUmN0?=
 =?utf-8?B?OVNlNHJKYkdoYjd2czFaMWJ1VUlZQytoQkhUMXlMVGdiSC92YUYzNzkxVEpo?=
 =?utf-8?B?djIxQnBzTFV4UWpWZURGR3BVRlc3eHIzK1A4UFY0UlhIQmRGUUhMWlgxc1A0?=
 =?utf-8?B?aEQvamNXbzRzSW5iODIvUnhiWTgxamU0VUJhamxHc1BiREZDQVFpMnhVZ3NX?=
 =?utf-8?B?eG9WYmMyR28rTWQzRWJNUk9vR3NkMEduSFhCTUlqeWlkSDYreEFXUnNtR2Fi?=
 =?utf-8?B?d1Q1Mjk4UVhvN0tvUmVSUFgwL2Y1N2FRVng3SitGdFlwRWJUYXlCWTVOajF3?=
 =?utf-8?B?Uk9sMG8yVUxvd2E5aGZIYUwzRzhsTTJaM0hHQndzdU84ZCsxc3dCT1ZNdzlN?=
 =?utf-8?B?VGx4QUExckxndlhZNHhRVEpoVVQzQm02elBzWTFpaWpBYkxsakhFUWo5RDFp?=
 =?utf-8?B?SXVWTFZraVcyZU1pQkR6K09vVjN0OFBYVDVZdVAzTkZJckZmYm9ZVGE1VGZ2?=
 =?utf-8?B?Y2N6SEhwRzFFdzQ1UDZZRE1QblNSMzVvbHd4ejlVUFphNmxUcGdkZTIrYXd5?=
 =?utf-8?B?Y2lWRjdKVm0wamEydUVtTHkwQml0YnNqUUpvcUlUV3FwUWFaQmZuSWpJZWVI?=
 =?utf-8?B?TmJqOCtiTXJraS9JWDlwWlBVNXRxazcybTVXRHhraWNVejRPSmZmT0lBdkht?=
 =?utf-8?B?TGh6cGF5eFArb3JHcWkxYWtsNEpDdnNqeUpnWlp4dnJtOXgrWWRMcGpMWTEv?=
 =?utf-8?B?VkI0QUVnU3VnZm0zOWxCUG8xT3BrUno2eVdxWTZyNHpoTGh3VTA1Q2puRzU0?=
 =?utf-8?B?V1EzYXdyNHhWTXhDVVBLTDJieXRoclV2RW1nWWFWb2M4bzNhNjd4QTBubVFw?=
 =?utf-8?B?NmRHZlltcHlVVHJ2SW15cG43WnZJRnBhM0pmSnU3dGpwZ1N4UTI2anVNbkZi?=
 =?utf-8?B?YXZhd2FZbXJacHZwT0NJSkZRUTlSVkhDbTBxUEt1aU1sQThFdHRXb1FZWW8x?=
 =?utf-8?B?M2pYcDRRK3dUamdRTSt5YW00aHQ4bHExOFlqa0U1M3R2TWE0UnJmQ1RwMnZJ?=
 =?utf-8?B?T1hHT2kzamFOcjNsbjJFMDlmaEJqYVNoS1RIZ1RkNHQ3ZjhLeHJnTUNXTjFk?=
 =?utf-8?B?UjFwc29VNTF6dDMydEk3T2pNaWNTQS9zakltcFNmd1o1M0k0aTFlRVkrN1J6?=
 =?utf-8?B?Ull2a0czd1NxZmYwTjRsVjJwWk5iVDZSTE5OSk9ldGtORnVnOXNwOUc5bjJv?=
 =?utf-8?B?V1VxTXZnTC9oRERrSm1IWTZ3NmJ5NkMxMnJ1QUpyTDJGbjhrbk0xMVdhUGtt?=
 =?utf-8?B?U3dmL3Q0RFQvYkRLeW56ajgwZGpyUC91em5JbzJKdThwdEgySnNYZ0JNRW14?=
 =?utf-8?B?a00rN1NqQ2xVU0k2cDhHWGhhcHcvS3dVWXJzbUE4NDdES3BDYllkWGpqeFg1?=
 =?utf-8?B?M0ppSlFucFg4VUNTbUs1bUFiNkNaamxYaThZYTY2M0xjNStnem9NWlhiV3dK?=
 =?utf-8?B?NGJLeUtpcEI0RndVZVFRbEt4SC8zTFZEcFR4NmpZemVwQXM3S3BDZU0yQ1No?=
 =?utf-8?B?bGRFVHkyeDlIV0R2SGJNTjc4bkorNzk1WlkzOVdTcmJlRllVTWZFOHRnU0l5?=
 =?utf-8?Q?lcxamJahQdrTV9a8RmhzHfDKIFWSOtZ4pf4b7Ql?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3273
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6ffeccf-f484-460e-f3d9-08d96862fd6d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5gAT9FEKCi9pBjY2rb5pEJiPYex5cpb5DwfnszZYII7sFwvxeo6ncU3du5t5jKcUR9oJ8XiLf3LGBVxCMlPWG9gGW5CEwRL8rzmf18Jj5kbLpZGwQ9agnk78njRJyv9Q1psqxcRF+N6o27pOHbJunrLcyAN/nRntbredQAF0vl6bIKquAtTCSEGF8cogCxHIrkRJ8kZWpRWbTpT+FuMP6OO1jPCSQRj3yJM++Qk3KTjsJQG4zb4A/z2C0IItqjYQC/ahqVCbPZUHfSuC57DFs/P0OwtawAPJj0ZSC8E+QFzdMzKt2uW9Mpo0tTv0PyDY7XH3WbxLf0Q+vtQBLHSqPXxLTLMFIRPzkaKWa36mvgsXnmEiRcTp27w6kwqiFnuQrV70Uqa7/DN3sLd0nOjpLYcpkmIu8QsRS9ICNZMF4ZHIVAPqZhegZ1k9kci8pdaI+dzthXmBJY7bpmdvPsOjnP4S6b21MQhy6WHR+4NhiqCQ+Fw569VLqvOTjUXe+KzHqCSPYiBF+ceKgasXkdaw4CyKjVbTTvatxvmvpLdP1DzP/hoPNRvkqOEXIwf5rPEPqzAc9hsujTm/E+sA9RgOqioeA/VHzZjiLqifjfj69aD1rLndb9dZbxOPW0i/K84JzFJcWRKgUaVKz7r5vM7CWj+VMgNok8R5xO4JbgyySZj52NnI1ZZ+qw+d3dtFUkmoycNgwYURkkvFH/lCHqr5eg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(36840700001)(53546011)(6506007)(82310400003)(52536014)(7696005)(5660300002)(55016002)(478600001)(8936002)(8676002)(110136005)(316002)(4326008)(70206006)(33656002)(70586007)(9686003)(336012)(36860700001)(356005)(83380400001)(81166007)(86362001)(47076005)(186003)(2906002)(82740400003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:27:54.4607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0758e211-3f90-4c44-d6f7-08d968630510
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4101

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjbml6UgMToxMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyOS80MF0geGVuL2FybTogaW1wbGVtZW50IEFybSBhcmNo
IGhlbHBlcnMgQXJtDQo+IHRvIGdldCBtZW1vcnkgbWFwIGluZm8NCj4gDQo+IEhpIFdlaSwNCj4g
DQo+IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFRoZXNlIHR3byBo
ZWxwZXJzIGFyZSBhcmNoaXRlY3R1cmUgQVBJcyB0aGF0IGFyZSByZXF1aXJlZCBieQ0KPiA+IG5v
ZGVzX2NvdmVyX21lbW9yeS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWku
Y2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL251bWEuYyB8IDE0ICsr
KysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hLmMgYi94ZW4vYXJjaC9hcm0vbnVt
YS5jDQo+ID4gaW5kZXggZjYxYThkZjY0NS4uNmVlYmY4ZThiYyAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+IEBA
IC0xMjYsMyArMTI2LDE3IEBAIHZvaWQgX19pbml0IG51bWFfaW5pdChib29sIGFjcGlfb2ZmKQ0K
PiA+ICAgICAgIG51bWFfaW5pdG1lbV9pbml0KFBGTl9VUChyYW1fc3RhcnQpLCBQRk5fRE9XTihy
YW1fZW5kKSk7DQo+ID4gICAgICAgcmV0dXJuOw0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArdWludDMy
X3QgX19pbml0IGFyY2hfbWVtaW5mb19nZXRfbnJfYmFuayh2b2lkKQ0KPiA+ICt7DQo+ID4gKwly
ZXR1cm4gYm9vdGluZm8ubWVtLm5yX2JhbmtzOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtpbnQgX19p
bml0IGFyY2hfbWVtaW5mb19nZXRfcmFtX2JhbmtfcmFuZ2UoaW50IGJhbmssDQo+ID4gKwl1bnNp
Z25lZCBsb25nIGxvbmcgKnN0YXJ0LCB1bnNpZ25lZCBsb25nIGxvbmcgKmVuZCkNCj4gDQo+IFRo
ZXkgYXJlIHBoeXNpY2FsIGFkZHJlc3MsIHNvIHdlIHNob3VsZCB1c2UgInBhZGRyX3QiIGFzIG9u
IHN5c3RlbSBzdWNoDQo+IGFzIDMyLWJpdCBBcm0sICJ1bnNpZ25lZCBsb25nIiBpcyBub3QgZW5v
dWdoIHRvIGNvdmVyIGFsbCB0aGUgcGh5c2ljYWwNCj4gYWRkcmVzcy4NCj4gDQo+IEFzIHlvdSBj
aGFuZ2UgdGhlIHR5cGUsIEkgd291bGQgYWxzbyBzdWdnZXN0IHRvIGNoYW5nZSB0aGUgYmFuayBm
cm9tIGFuDQo+IGludCB0byBhbiB1bnNpZ25lZCBpbnQuDQo+IA0KDQpJIHdpbGwgZml4IHRoZW0g
aW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gK3sNCj4gPiArCSpzdGFydCA9IGJvb3RpbmZvLm1lbS5i
YW5rW2JhbmtdLnN0YXJ0Ow0KPiA+ICsJKmVuZCA9IGJvb3RpbmZvLm1lbS5iYW5rW2JhbmtdLnN0
YXJ0ICsgYm9vdGluZm8ubWVtLmJhbmtbYmFua10uc2l6ZTsNCj4gPiArDQo+ID4gKwlyZXR1cm4g
MDsNCj4gPiArfQ0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

