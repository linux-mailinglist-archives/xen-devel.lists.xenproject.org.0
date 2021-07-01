Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468553B930F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148754.275019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxY1-00014y-4y; Thu, 01 Jul 2021 14:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148754.275019; Thu, 01 Jul 2021 14:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxY1-00012W-1l; Thu, 01 Jul 2021 14:20:09 +0000
Received: by outflank-mailman (input) for mailman id 148754;
 Thu, 01 Jul 2021 14:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T0jQ=LZ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lyxXz-0000yy-PZ
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:20:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38eb7b32-fdc7-40c8-9b92-6a2105e133d0;
 Thu, 01 Jul 2021 14:20:03 +0000 (UTC)
Received: from AS8PR04CA0102.eurprd04.prod.outlook.com (2603:10a6:20b:31e::17)
 by HE1PR0802MB2572.eurprd08.prod.outlook.com (2603:10a6:3:db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 14:19:58 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::dd) by AS8PR04CA0102.outlook.office365.com
 (2603:10a6:20b:31e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Thu, 1 Jul 2021 14:19:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 14:19:58 +0000
Received: ("Tessian outbound 71a9bd19c2b9:v97");
 Thu, 01 Jul 2021 14:19:57 +0000
Received: from 17edf0b672d7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9F1A26D-C978-49D6-8C77-92BDDDF02473.1; 
 Thu, 01 Jul 2021 14:19:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17edf0b672d7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jul 2021 14:19:36 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6575.eurprd08.prod.outlook.com (2603:10a6:102:156::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 14:19:34 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%7]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 14:19:34 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0361.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Thu, 1 Jul 2021 14:19:33 +0000
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
X-Inumbo-ID: 38eb7b32-fdc7-40c8-9b92-6a2105e133d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afscDBvgHhKc1x2AyQTYXc6zkHtTRdwpHFcfhh+V0Ek=;
 b=P5KAjpJq8xgSYK3l7kIqnfMRT64IvYQDtuoBwoSn4Z64iuRLAmhf9P7hEXhehrFBUGjlSI/rriBToq4oJ6acEu440KoUhcGY+YeZ8CSBD52eYXd5OwaREptPnidbP42fyN2eUtnWlNYhtb2a4CLPFxlTwIsZMfYUpc2vZydu6dQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6f5b7374b0fbda0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa6SXLjh1XpdbylyNhV7WEFW4td9/ACt4/04bjfUBHMQE909iJL7EPV0uM3HxvTwpMs6eJfxkCnX7v6oFNE5nTP942O7amT4vkI59A7wSc8WvVR+f2kkz4P6yZpJZJFN6CBJ8Wr0lnzZ3OK4jQslobE3QTC3AnRXxqimMSzPstyyzXfjzJuLqFvoVIsJ87VJ9XVxpNaOgzUzb1tLtyZLO6Ui4EQoXq3kUXTRCzXmYTf6QA+8NORydRd805+Urkj3I3nN8WAtnCjGuA/XQjaSIJA4iMXnyFPvMFIUUgoAyRiXujyR/i9mqzsL/lrIeXKqEFU962+V4kbk1O15c7etBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afscDBvgHhKc1x2AyQTYXc6zkHtTRdwpHFcfhh+V0Ek=;
 b=mKCdumG2JH49HjeT8jN2eaQih/2d4zV8N8FaouJW/S/eizzhZi4nfgkW2mpquewnah7j5SsRNvNhEUrrYC3K3P3fdLor+hxmiBgpEXwAyg3X0BNCnpXjIgpB42H62WQhK4t3dFHanRUFF1gMOMMFHkMw+pUZez2IBqDKHQKV8wsXZzuzvMS5X33QbMH9iEbD5xNUpKbemFFS3FsCFpA8TWyLUaf6+3ES4H05DyO1s1DxqlxxkA6TbHn0trv2UsPWrxFz/AWBtFGBOSaDBpGOy6IZKSNasalwjNCYwon7V81f8qPaLR5yVaQvJQawLL2a2KAcHB0+eTFsEHmWcgID8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afscDBvgHhKc1x2AyQTYXc6zkHtTRdwpHFcfhh+V0Ek=;
 b=P5KAjpJq8xgSYK3l7kIqnfMRT64IvYQDtuoBwoSn4Z64iuRLAmhf9P7hEXhehrFBUGjlSI/rriBToq4oJ6acEu440KoUhcGY+YeZ8CSBD52eYXd5OwaREptPnidbP42fyN2eUtnWlNYhtb2a4CLPFxlTwIsZMfYUpc2vZydu6dQ=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2106231530320.24906@sstabellini-ThinkPad-T480s>
Date: Thu, 1 Jul 2021 15:19:28 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <31171081-1007-4B4E-91CC-25EA1041EB58@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
 <20210510084105.17108-10-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2106231530320.24906@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0361.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::13) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 418a0670-7b2e-4ec5-6ce3-08d93c9b4e64
X-MS-TrafficTypeDiagnostic: PAXPR08MB6575:|HE1PR0802MB2572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2572A177328DA730C715BB15E4009@HE1PR0802MB2572.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L6b6686e6d80gydqVVakp+j2V8WkCGO9vFDQaDPQOlKgZgFmNtJDW3pXd0ImOmUZlCtm774kxqYK0yRWLYxHfvOUw1T9P4xekJiHyaxC2hfWrsdu2mpYBECOWg8jU2YCmf6FbRAhY1ilPDqOfM1BKCxw7AZBIYByF/F5dLmYMB12Mkkpg5qt4/rqt06kg3TMcBsVbfqxfsblMpKqroHYm1pdftNIMKrR+wz77dZpOCpQMVarosfuWPdnldgQIHTvi+u0Ee1mCYfVacOmmnRgDmDUg/FP7vzrmtCzpoWp6VBqUErMIMLz3QSHm8+RcMk7n8AH9eP4/rr71kjLXLI3WU462d4kzyS0ueKsqrOg+4jG+tNJjJKMQHgIkYlZjSHGtiC//c51FFx4ck0VLdLNodsmnTpJUX08vTCjY37g6XdK1x1c2cBG8c85bbLi1+Ygt1NfyUO5KbzIhMWeEj3K0hxq62VEaGk1njp2XUo/qXyAdtl7RGeLkHcfOBYkSa8IaQWZ5+KHx3Y5hAF/LDDTzqv9LdSqyJE3jA2gNzeFuX76Z/mDcEzV1o2EvFpQf/isv88x9F7Tl+IgaSaaRxnh1BcUExLmkYhyrSBl+xgKHcK+MWkRnZHADBWHEq6aXs3ENJ84QAJu2c9te//mVFW1PetU4ydThEqeF1tU7AC8UxlO7ogqORGHOrU1durNo04YyDIf1ytxUBeLZ4QSo5tDTWSlN1aom4vma4ben9tvyUKRte/G5k6YoUDqhu80tQdGudEV3Uy9kDU8RNU+TVMkP9w1sIgKADMLOE6ISUPKnNsDpISjWrlpFPCEAYAF+yPfdlsMTWfZx+viCZg0J/4MaOb7q4v6QmD4ppwt/s7E3W0h+enWf3+Y5+dEQYYFIzty
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(5660300002)(86362001)(966005)(956004)(6512007)(66476007)(498600001)(2616005)(52116002)(33656002)(6486002)(6506007)(6666004)(66556008)(66946007)(4326008)(44832011)(36756003)(8936002)(30864003)(8676002)(53546011)(6916009)(186003)(38100700002)(2906002)(26005)(38350700002)(16526019)(54906003)(21314003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Ly9JQTVDa2FlQjM2aHJGOTE4SW96T3VPQ1lvYXpRUm41c3Z2LzJoWWpFZWRW?=
 =?utf-8?B?Z24veWpMalNlTmFaWDF4d0IrQnFEcG5vck94TUVWakk1b29ocjEyVDFNdmRL?=
 =?utf-8?B?MW9STlRxamNLelNKMkNlbWxaYS9WaXI5eCtMSjhqK01FSkNCNGR5UUVQK0Jm?=
 =?utf-8?B?ZFJmOVVtZDUyYmhQcVFHRGhKeDBucGZuYjdhck1GTitYSEFrVUpoZDZ4eGtO?=
 =?utf-8?B?N3BieXhHNUVjNkl4RmVjWDNOVlVKODhGd2FTT0NJc1lhYytpaUlhWFdBV0Vm?=
 =?utf-8?B?YmtyNU82ay9HOUc5cmpESlFnbWkxdE9CUTFYQm03TktncTFoZTRtc2luZ1By?=
 =?utf-8?B?b3A1TmdHcjJJbjVUZkxQZzFOdTcwNVN3VDdXZGM4UTdibWwydmp3aVE4UEZ5?=
 =?utf-8?B?WmVVMm1LQjlZL1NKOGtNZW5DNUEvVURtemRpU2R6S3lZZnYvZlJJdTViZUMx?=
 =?utf-8?B?OFlkTEd5YjF3dG1rWFVnUTBjYnQ1b1dRUWZWYUJUR21Uc0l4ZnZpMTkzM2FL?=
 =?utf-8?B?dW9DTWxFZDEwZTdoc2ZBc1E1RCtVM2dqcmtLNzgwZmdmNERIRWJQWU1PN094?=
 =?utf-8?B?WlBHeWZDMDJpZE4xNUI0eUcvTko4U1pXdHNINkxwU1hYRXA3b1YzN0QxTk5v?=
 =?utf-8?B?ak1JU2lFd3YwdWs2TTF6NG9lR1hYZEVUMFljUEg5N3FOZHZQQWhXZXh5T0w5?=
 =?utf-8?B?WDd2RHdNWUZJNEE0SmcvdnNQT1ZJMVFEaWphSVRFc2dha29SelBhK0lhSjJa?=
 =?utf-8?B?UjNXTC9ZbWVWZ1NpMnpiYXNiL2dtOHh4SmNnTXhaUXdNRTlwWUg3aHVxTGRz?=
 =?utf-8?B?Q252TzVFZ1d3SWM5alBtSlA3amhHYUdrWXY4OENycWJQc2JWRlRNNDFydllQ?=
 =?utf-8?B?VlRuNGRFSUdZZ0d3ck83N1JCR0VtRGxZa1BCRURyMW16VGgwR1M2eWphUUlm?=
 =?utf-8?B?czRXcXcvYUNmdGpXbnNBejZXdHNLUDc0Nzd1Q3BtcjQ0SWFTa20wbDJwM2Ry?=
 =?utf-8?B?YUppWDlXZmZ2VnRheDZNaU5HVUMyV1ovUDBaOWJETmJYUzdKUHhxVlRMTFVT?=
 =?utf-8?B?YU9xcno5a2pEckpjK2VmVmNQckw0MENGUkhQcVIxNGp3R1hUUS9sTWpJZlRl?=
 =?utf-8?B?eGcwZDFua2ZkT2tHVEV3L2xlNFJYb0NqSEJoMDhTSzNmTWFSZDhaTHhNQ1U4?=
 =?utf-8?B?NVN1L00ycU9aWjIzcGxhdHB6L1IwVFpnYUp1b3ZUOWFiZDliTFR1dTZRRk9r?=
 =?utf-8?B?R1RDUTJGbGo0d0hTTkxVRGl1Vjg3b3o0Z2xiVjBZVkd2dUxNOGd6b3lnU1Bq?=
 =?utf-8?B?SnZuVzJjck1BaG9tTHUvbmo3SFFETjRTRHBaa1l5RndUcTFOb3NLazl0aFo1?=
 =?utf-8?B?SzhtOHpxWTc2bjYyY01uMngyNE8wcGhNOHZZZC9KNm5UNStoemhoRFVBWFdj?=
 =?utf-8?B?THNHZ1NoaU5hOCtlKzNXVTArUmZ4MmhCa3RvSW5jOGNQdTdFYTVkWjgzWVZX?=
 =?utf-8?B?Yy8xWGhwRHhyejRJSlYxUllKUHJGN3dlamVrU0NhTWt4dUdqYmxncDBLNjBz?=
 =?utf-8?B?aStwOWYwWFI1T2xEbG5lKzEyc0h2NW9nR2pSWTRJTFd3QWYwNEFaa2FpVVZV?=
 =?utf-8?B?THV6MnQ1U1NCUFp6dEtpTEhoVTN6dE5mbjBnaUd4dFpscmNjWCtlVjFWZVFQ?=
 =?utf-8?B?M0N0a3NYeGFlQ3k1QVhEcGVpblgrSDNmVWljOFQwNGNId3hwYkpXMThUYkds?=
 =?utf-8?Q?Vs1RtVXlvJ3AZiLi7kQUq11E7hfvtqztMi+QrdV?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6575
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ca3f7c7-25f5-4139-8d9f-08d93c9b4025
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6F4ktY+k2TFmQDQrdc8yh4LmD2GNxT6J6665TYxG572Gk0rxcUAyPnmrVJRfSeKLWo64E8cJFkGeDonbxAiosP1wxwWe2hfZO8g4wusv+VRn6z5E7f1efuoeMCPRP1THP9zFzbCXgBD60YVYA4Y5A3IqHbryJ5LzlDxzOR874+qEWN/oYn/q0GH6dxJq/TwmkCMrwX6wM9D72tYE93Y8DoboLagdP9eP8R6JW8EVPS0Zfh6qcIDdO2Plz5yUXO5kmSsN0RsvGh+2XWY5GDVfdoP3/xFXpB4ohagc1cjzaf66Pi8QGjf7VxBsxqPzXRfGEBwevOXfFMN/X+SlUa37fFJk1sOFlyDCdJBmPtaxGT/BTJRGA+owRp1E6ty3WZNetbvoSxeP42j3/AlC469Tm9vzddLj2i4j0rgMIVY7Mr/vbFaKUN5ns57Bldb/2tLmm/+Tw8c8xqB4b/DjjfVLIDs5j8ReC3W3ChST8t+Z/aQIz4XqQp7tcIbc3CYwDeHRk/CuxHi5OgwqxPk+thDwSViIpV3kZtBLa1cqFr+gGX2CRMjIO3GFDZu738AdF/TZzGnXtxzml6AtrLY/f1T2xzo4xSOSF83Tv2doPNDXprYUrSrJkAypglLWg/l2BodUK/IQfowP6X75BT15rPCSBGJNgFMlmaXduLz3GJssSqrVNeRO7LS6sokeZIpsjqADswSsfZL41LC46vkWksY8IyyFVNcJcCzWIKK/YI6PRQPmsxh79HDsTI7xO7kgf7woS6LTIwDnR62caIjusE/FkX2w8vfFNPRsCpT36Ornji+mT9O97lwzofj3I4uJ7SdfQEdgXKrzKidpwB7U3/S8GYktnU896NPOlvA9TJHQ5l4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6512007)(83380400001)(36860700001)(82310400003)(33656002)(36756003)(6486002)(8676002)(336012)(186003)(16526019)(53546011)(6666004)(966005)(6506007)(956004)(2616005)(44832011)(26005)(6862004)(47076005)(70206006)(4326008)(5660300002)(2906002)(8936002)(498600001)(70586007)(86362001)(30864003)(81166007)(356005)(54906003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 14:19:58.0908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 418a0670-7b2e-4ec5-6ce3-08d93c9b4e64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2572


Hi Stefano,

> On 24 Jun 2021, at 00:34, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 10 May 2021, Luca Fancellu wrote:
>> Modification to include/public/grant_table.h:
>>=20
>> 1) Add doxygen tags to:
>> - Create Grant tables section
>> - include variables in the generated documentation
>> - Used @keepindent/@endkeepindent to enclose comment
>>   section that are indented using spaces, to keep
>>   the indentation.
>> 2) Add .rst file for grant table for Arm64
>=20
> Why only arm64?

This is a mistake, it should be just =E2=80=9CAdd .rst file for grant table=
"

>=20
>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v6 changes:
>> - Fix misaligned comment
>> - Moved comments to make them display in the docs
>> - Included more documentation in the docs
>>  (see output here: https://luca.fancellu.gitlab.io/xen-docs/hypercall-in=
terfaces/common/grant_tables.html)
>=20
> It looks much much better. All the info we care about seems to be there.
> The only things that I noticed missing and might be good to keep is the
> small comment about HYPERVISOR_grant_table_op:
>=20
> /* ` enum neg_errnoval
> * ` HYPERVISOR_grant_table_op(enum grant_table_op cmd,
> * `                           void *args,
> * `                           unsigned int count)
> * `
> *
> * @args points to an array of a per-command data structure. The array
> * has @count members

Where do you want me to put this comment in the html page? In the end of th=
e description in the top of the page?

Cheers,

Luca

>=20
> All the changes look good to me.
>=20
>=20
>=20
>> v5 changes:
>> - Move GNTCOPY_* define next to the flags field
>> v4 changes:
>> - Used @keepindent/@endkeepindent doxygen commands
>>  to keep text with spaces indentation.
>> - drop changes to grant_entry_v1 comment, it will
>>  be changed and included in the docs in a future patch
>> - Move docs .rst to "common" folder
>> v3 changes:
>> - removed tags to skip anonymous union/struct
>> - moved back comment pointed out by Jan
>> - moved down defines related to struct gnttab_copy
>>  as pointed out by Jan
>> v2 changes:
>> - Revert back to anonymous union/struct
>> - add doxygen tags to skip anonymous union/struct
>> ---
>> docs/hypercall-interfaces/arm64.rst           |   1 +
>> .../common/grant_tables.rst                   |   9 +
>> docs/xen-doxygen/doxy_input.list              |   1 +
>> xen/include/public/grant_table.h              | 387 +++++++++++-------
>> 4 files changed, 245 insertions(+), 153 deletions(-)
>> create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst
>>=20
>> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interf=
aces/arm64.rst
>> index 5e701a2adc..cb4c0d13de 100644
>> --- a/docs/hypercall-interfaces/arm64.rst
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -8,6 +8,7 @@ Starting points
>> .. toctree::
>>    :maxdepth: 2
>>=20
>> +   common/grant_tables
>>=20
>>=20
>> Functions
>> diff --git a/docs/hypercall-interfaces/common/grant_tables.rst b/docs/hy=
percall-interfaces/common/grant_tables.rst
>> new file mode 100644
>> index 0000000000..b8a1ef8759
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/common/grant_tables.rst
>> @@ -0,0 +1,9 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Grant Tables
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. doxygengroup:: grant_table
>> +   :project: Xen
>> +   :members:
>> +   :undoc-members:
>> diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_in=
put.list
>> index e69de29bb2..233d692fa7 100644
>> --- a/docs/xen-doxygen/doxy_input.list
>> +++ b/docs/xen-doxygen/doxy_input.list
>> @@ -0,0 +1 @@
>> +xen/include/public/grant_table.h
>> diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant=
_table.h
>> index 84b1d26b36..dfa5155927 100644
>> --- a/xen/include/public/grant_table.h
>> +++ b/xen/include/public/grant_table.h
>> @@ -25,15 +25,19 @@
>>  * Copyright (c) 2004, K A Fraser
>>  */
>>=20
>> +/**
>> + * @file
>> + * @brief Interface for granting foreign access to page frames, and rec=
eiving
>> + * page-ownership transfers.
>> + */
>> +
>> #ifndef __XEN_PUBLIC_GRANT_TABLE_H__
>> #define __XEN_PUBLIC_GRANT_TABLE_H__
>>=20
>> #include "xen.h"
>>=20
>> -/*
>> - * `incontents 150 gnttab Grant Tables
>> - *
>> - * Xen's grant tables provide a generic mechanism to memory sharing
>> +/**
>> + * @brief Xen's grant tables provide a generic mechanism to memory shar=
ing
>>  * between domains. This shared memory interface underpins the split
>>  * device drivers for block and network IO.
>>  *
>> @@ -51,13 +55,13 @@
>>  * know the real machine address of a page it is sharing. This makes
>>  * it possible to share memory correctly with domains running in
>>  * fully virtualised memory.
>> - */
>> -
>> -/***********************************
>> + *
>>  * GRANT TABLE REPRESENTATION
>> - */
>> -
>> -/* Some rough guidelines on accessing and updating grant-table entries
>> + *
>> + * A grant table comprises a packed array of grant entries in one or mo=
re
>> + * page frames shared between Xen and a guest.
>> + *
>> + * Some rough guidelines on accessing and updating grant-table entries
>>  * in a concurrency-safe manner. For more information, Linux contains a
>>  * reference implementation for guest OSes (drivers/xen/grant_table.c, s=
ee
>>  * http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux.git;a=3Dbl=
ob;f=3Ddrivers/xen/grant-table.c;hb=3DHEAD
>> @@ -66,6 +70,7 @@
>>  *     compiler barrier will still be required.
>>  *
>>  * Introducing a valid entry into the grant table:
>> + * @keepindent
>>  *  1. Write ent->domid.
>>  *  2. Write ent->frame:
>>  *      GTF_permit_access:   Frame to which access is permitted.
>> @@ -73,20 +78,25 @@
>>  *                           frame, or zero if none.
>>  *  3. Write memory barrier (WMB).
>>  *  4. Write ent->flags, inc. valid type.
>> + * @endkeepindent
>>  *
>>  * Invalidating an unused GTF_permit_access entry:
>> + * @keepindent
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>  *  NB. No need for WMB as reuse of entry is control-dependent on succes=
s of
>>  *      step 3, and all architectures guarantee ordering of ctrl-dep wri=
tes.
>> + * @endkeepindent
>>  *
>>  * Invalidating an in-use GTF_permit_access entry:
>> + *
>>  *  This cannot be done directly. Request assistance from the domain con=
troller
>>  *  which can set a timeout on the use of a grant entry and take necessa=
ry
>>  *  action. (NB. This is not yet implemented!).
>>  *
>>  * Invalidating an unused GTF_accept_transfer entry:
>> + * @keepindent
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>> @@ -97,29 +107,32 @@
>>  *      transferred frame is written. It is safe for the guest to spin w=
aiting
>>  *      for this to occur (detect by observing GTF_transfer_completed in
>>  *      ent->flags).
>> + * @endkeepindent
>>  *
>>  * Invalidating a committed GTF_accept_transfer entry:
>>  *  1. Wait for (ent->flags & GTF_transfer_completed).
>>  *
>>  * Changing a GTF_permit_access from writable to read-only:
>> + *
>>  *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writin=
g.
>>  *
>>  * Changing a GTF_permit_access from read-only to writable:
>> + *
>>  *  Use SMP-safe bit-setting instruction.
>> + *
>> + * Data structure fields or defines described below have the following =
tags:
>> + * * [XEN]: This field is written by Xen and read by the sharing guest.
>> + * * [GST]: This field is written by the guest and read by Xen.
>> + *
>> + * @addtogroup grant_table Grant Tables
>> + * @{
>>  */
>>=20
>> -/*
>> +/**
>>  * Reference to a grant entry in a specified domain's grant table.
>>  */
>> typedef uint32_t grant_ref_t;
>>=20
>> -/*
>> - * A grant table comprises a packed array of grant entries in one or mo=
re
>> - * page frames shared between Xen and a guest.
>> - * [XEN]: This field is written by Xen and read by the sharing guest.
>> - * [GST]: This field is written by the guest and read by Xen.
>> - */
>> -
>> /*
>>  * Version 1 of the grant table entry structure is maintained purely
>>  * for backwards compatibility.  New guests should use version 2.
>> @@ -129,15 +142,17 @@ typedef uint32_t grant_ref_t;
>> #define grant_entry_v1_t grant_entry_t
>> #endif
>> struct grant_entry_v1 {
>> -    /* GTF_xxx: various type and flag information.  [XEN,GST] */
>> +    /** GTF_xxx: various type and flag information.  [XEN,GST] */
>>     uint16_t flags;
>> -    /* The domain being granted foreign privileges. [GST] */
>> +    /** The domain being granted foreign privileges. [GST] */
>>     domid_t  domid;
>> -    /*
>> +    /**
>> +     * @keepindent
>>      * GTF_permit_access: GFN that @domid is allowed to map and access. =
[GST]
>>      * GTF_accept_transfer: GFN that @domid is allowed to transfer into.=
 [GST]
>>      * GTF_transfer_completed: MFN whose ownership transferred by @domid
>>      *                         (non-translated guests only). [XEN]
>> +     * @endkeepindent
>>      */
>>     uint32_t frame;
>> };
>> @@ -150,60 +165,99 @@ typedef struct grant_entry_v1 grant_entry_v1_t;
>> #define GNTTAB_RESERVED_CONSOLE        0
>> #define GNTTAB_RESERVED_XENSTORE       1
>>=20
>> -/*
>> - * Type of grant entry.
>> - *  GTF_invalid: This grant entry grants no privileges.
>> - *  GTF_permit_access: Allow @domid to map/access @frame.
>> - *  GTF_accept_transfer: Allow @domid to transfer ownership of one page=
 frame
>> - *                       to this guest. Xen writes the page number to @=
frame.
>> - *  GTF_transitive: Allow @domid to transitively access a subrange of
>> - *                  @trans_grant in @trans_domid.  No mappings are allo=
wed.
>> - */
>> +/** This type of grant entry grants no privileges. */
>> #define GTF_invalid         (0U<<0)
>> +
>> +/** This type of grant entry allow \@domid to map/access \@frame. */
>> #define GTF_permit_access   (1U<<0)
>> +
>> +/**
>> + * This type of grant entry allow \@domid to transfer ownership of one =
pageframe
>> + * to this guest. Xen writes the page number to \@frame.
>> + */
>> #define GTF_accept_transfer (2U<<0)
>> +
>> +/**
>> + * This type of grant entry allow \@domid to transitively access a subr=
ange of
>> + * \@trans_grant in \@trans_domid.  No mappings are allowed.
>> + */
>> #define GTF_transitive      (3U<<0)
>> +
>> #define GTF_type_mask       (3U<<0)
>>=20
>> -/*
>> - * Subflags for GTF_permit_access and GTF_transitive.
>> - *  GTF_readonly: Restrict @domid to read-only mappings and accesses. [=
GST]
>> - *  GTF_reading: Grant entry is currently mapped for reading by @domid.=
 [XEN]
>> - *  GTF_writing: Grant entry is currently mapped for writing by @domid.=
 [XEN]
>> - * Further subflags for GTF_permit_access only.
>> - *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags to be used f=
or
>> - *                             mappings of the grant [GST]
>> - *  GTF_sub_page: Grant access to only a subrange of the page.  @domid
>> - *                will only be allowed to copy from the grant, and not
>> - *                map it. [GST]
>> +/**
>> + * @def GTF_readonly
>> + * Subflag for GTF_permit_access and GTF_transitive: Restrict \@domid t=
o
>> + * read-only mappings and accesses. [GST]
>>  */
>> #define _GTF_readonly       (2)
>> #define GTF_readonly        (1U<<_GTF_readonly)
>> +
>> +/**
>> + * @def GTF_reading
>> + * Subflag for GTF_permit_access and GTF_transitive: Grant entry is cur=
rently
>> + * mapped for reading by \@domid. [XEN]
>> + */
>> #define _GTF_reading        (3)
>> #define GTF_reading         (1U<<_GTF_reading)
>> +
>> +/**
>> + * @def GTF_writing
>> + * Subflag for GTF_permit_access and GTF_transitive: Grant entry is cur=
rently
>> + * mapped for writing by \@domid. [XEN]
>> + */
>> #define _GTF_writing        (4)
>> #define GTF_writing         (1U<<_GTF_writing)
>> +
>> +/**
>> + * @def GTF_PWT
>> + * Subflag for GTF_permit_access only: (x86) cache attribute flags to b=
e used
>> + * for mappings of the grant [GST]
>> + */
>> #define _GTF_PWT            (5)
>> #define GTF_PWT             (1U<<_GTF_PWT)
>> +
>> +/**
>> + * @def GTF_PCD
>> + * Subflag for GTF_permit_access only: (x86) cache attribute flags to b=
e used
>> + * for mappings of the grant [GST]
>> + */
>> #define _GTF_PCD            (6)
>> #define GTF_PCD             (1U<<_GTF_PCD)
>> +
>> +/**
>> + * @def GTF_PAT
>> + * Subflag for GTF_permit_access only: (x86) cache attribute flags to b=
e used
>> + * for mappings of the grant [GST]
>> + */
>> #define _GTF_PAT            (7)
>> #define GTF_PAT             (1U<<_GTF_PAT)
>> +
>> +/**
>> + * @def GTF_sub_page
>> + * Subflag for GTF_permit_access only: Grant access to only a subrange =
of the
>> + * page. \@domid will only be allowed to copy from the grant, and not m=
ap it.
>> + * [GST]
>> + */
>> #define _GTF_sub_page       (8)
>> #define GTF_sub_page        (1U<<_GTF_sub_page)
>>=20
>> -/*
>> - * Subflags for GTF_accept_transfer:
>> - *  GTF_transfer_committed: Xen sets this flag to indicate that it is c=
ommitted
>> - *      to transferring ownership of a page frame. When a guest sees th=
is flag
>> - *      it must /not/ modify the grant entry until GTF_transfer_complet=
ed is
>> - *      set by Xen.
>> - *  GTF_transfer_completed: It is safe for the guest to spin-wait on th=
is flag
>> - *      after reading GTF_transfer_committed. Xen will always write the=
 frame
>> - *      address, followed by ORing this flag, in a timely manner.
>> +/**
>> + * @def GTF_transfer_committed
>> + * Subflag for GTF_accept_transfer: Xen sets this flag to indicate that=
 it is
>> + * committed to transferring ownership of a page frame. When a guest se=
es this
>> + * flag it must /not/ modify the grant entry until GTF_transfer_complet=
ed is
>> + * set by Xen.
>>  */
>> #define _GTF_transfer_committed (2)
>> #define GTF_transfer_committed  (1U<<_GTF_transfer_committed)
>> +
>> +/**
>> + * @def GTF_transfer_completed
>> + * Subflag for GTF_accept_transfer: It is safe for the guest to spin-wa=
it on
>> + * this flag after reading GTF_transfer_committed. Xen will always writ=
e the
>> + * frame address, followed by ORing this flag, in a timely manner.
>> + */
>> #define _GTF_transfer_completed (3)
>> #define GTF_transfer_completed  (1U<<_GTF_transfer_completed)
>>=20
>> @@ -228,17 +282,17 @@ struct grant_entry_header {
>> };
>> typedef struct grant_entry_header grant_entry_header_t;
>>=20
>> -/*
>> +/**
>>  * Version 2 of the grant entry structure.
>>  */
>> union grant_entry_v2 {
>>     grant_entry_header_t hdr;
>>=20
>> -    /*
>> +    /**
>>      * This member is used for V1-style full page grants, where either:
>>      *
>> -     * -- hdr.type is GTF_accept_transfer, or
>> -     * -- hdr.type is GTF_permit_access and GTF_sub_page is not set.
>> +     * * hdr.type is GTF_accept_transfer, or
>> +     * * hdr.type is GTF_permit_access and GTF_sub_page is not set.
>>      *
>>      * In that case, the frame field has the same semantics as the
>>      * field of the same name in the V1 entry structure.
>> @@ -249,10 +303,10 @@ union grant_entry_v2 {
>>         uint64_t frame;
>>     } full_page;
>>=20
>> -    /*
>> +    /**
>>      * If the grant type is GTF_grant_access and GTF_sub_page is set,
>> -     * @domid is allowed to access bytes [@page_off,@page_off+@length)
>> -     * in frame @frame.
>> +     * \@domid is allowed to access bytes [\@page_off,\@page_off+\@leng=
th)
>> +     * in frame \@frame.
>>      */
>>     struct {
>>         grant_entry_header_t hdr;
>> @@ -261,9 +315,9 @@ union grant_entry_v2 {
>>         uint64_t frame;
>>     } sub_page;
>>=20
>> -    /*
>> -     * If the grant is GTF_transitive, @domid is allowed to use the
>> -     * grant @gref in domain @trans_domid, as if it was the local
>> +    /**
>> +     * If the grant is GTF_transitive, \@domid is allowed to use the
>> +     * grant \@gref in domain \@trans_domid, as if it was the local
>>      * domain.  Obviously, the transitive access must be compatible
>>      * with the original grant.
>>      *
>> @@ -277,7 +331,7 @@ union grant_entry_v2 {
>>         grant_ref_t gref;
>>     } transitive;
>>=20
>> -    uint32_t __spacer[4]; /* Pad to a power of two */
>> +    uint32_t __spacer[4]; /**< Pad to a power of two */
>> };
>> typedef union grant_entry_v2 grant_entry_v2_t;
>>=20
>> @@ -317,24 +371,25 @@ typedef uint16_t grant_status_t;
>> #endif /* __XEN_INTERFACE_VERSION__ */
>> /* ` } */
>>=20
>> -/*
>> +/**
>>  * Handle to track a mapping created via a grant reference.
>>  */
>> typedef uint32_t grant_handle_t;
>>=20
>> -/*
>> - * GNTTABOP_map_grant_ref: Map the grant entry (<dom>,<ref>) for access
>> - * by devices and/or host CPUs. If successful, <handle> is a tracking n=
umber
>> - * that must be presented later to destroy the mapping(s). On error, <s=
tatus>
>> +/**
>> + * GNTTABOP_map_grant_ref: Map the grant entry (\@dom,\@ref) for access
>> + * by devices and/or host CPUs. If successful, \@handle is a tracking n=
umber
>> + * that must be presented later to destroy the mapping(s). On error, \@=
status
>>  * is a negative status code.
>> + *
>>  * NOTES:
>> - *  1. If GNTMAP_device_map is specified then <dev_bus_addr> is the add=
ress
>> + *  1. If GNTMAP_device_map is specified then \@dev_bus_addr is the add=
ress
>>  *     via which I/O devices may access the granted frame.
>>  *  2. If GNTMAP_host_map is specified then a mapping will be added at
>>  *     either a host virtual address in the current address space, or at
>>  *     a PTE at the specified machine address.  The type of mapping to
>>  *     perform is selected through the GNTMAP_contains_pte flag, and the
>> - *     address is specified in <host_addr>.
>> + *     address is specified in \@host_addr.
>>  *  3. Mappings should only be destroyed via GNTTABOP_unmap_grant_ref. I=
f a
>>  *     host mapping is destroyed by other means then it is *NOT* guarant=
eed
>>  *     to be accounted to the correct grant reference!
>> @@ -342,25 +397,26 @@ typedef uint32_t grant_handle_t;
>> struct gnttab_map_grant_ref {
>>     /* IN parameters. */
>>     uint64_t host_addr;
>> -    uint32_t flags;               /* GNTMAP_* */
>> +    uint32_t flags;               /**< GNTMAP_* */
>>     grant_ref_t ref;
>>     domid_t  dom;
>>     /* OUT parameters. */
>> -    int16_t  status;              /* =3D> enum grant_status */
>> +    int16_t  status;              /**< GNTST_* status code */
>>     grant_handle_t handle;
>>     uint64_t dev_bus_addr;
>> };
>> typedef struct gnttab_map_grant_ref gnttab_map_grant_ref_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_map_grant_ref_t);
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_unmap_grant_ref: Destroy one or more grant-reference mapping=
s
>> - * tracked by <handle>. If <host_addr> or <dev_bus_addr> is zero, that
>> + * tracked by \@handle. If \@host_addr or \@dev_bus_addr is zero, that
>>  * field is ignored. If non-zero, they must refer to a device/host mappi=
ng
>> - * that is tracked by <handle>
>> + * that is tracked by \@handle
>> + *
>>  * NOTES:
>>  *  1. The call may fail in an undefined manner if either mapping is not
>> - *     tracked by <handle>.
>> + *     tracked by \@handle.
>>  *  3. After executing a batch of unmaps, it is guaranteed that no stale
>>  *     mappings will remain in the device or host TLBs.
>>  */
>> @@ -370,18 +426,19 @@ struct gnttab_unmap_grant_ref {
>>     uint64_t dev_bus_addr;
>>     grant_handle_t handle;
>>     /* OUT parameters. */
>> -    int16_t  status;              /* =3D> enum grant_status */
>> +    int16_t  status;              /**< GNTST_* status code */
>> };
>> typedef struct gnttab_unmap_grant_ref gnttab_unmap_grant_ref_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
>>=20
>> -/*
>> - * GNTTABOP_setup_table: Set up a grant table for <dom> comprising at l=
east
>> - * <nr_frames> pages. The frame addresses are written to the <frame_lis=
t>.
>> - * Only <nr_frames> addresses are written, even if the table is larger.
>> +/**
>> + * GNTTABOP_setup_table: Set up a grant table for \@dom comprising at l=
east
>> + * \@nr_frames pages. The frame addresses are written to the \@frame_li=
st.
>> + * Only \@nr_frames addresses are written, even if the table is larger.
>> + *
>>  * NOTES:
>> - *  1. <dom> may be specified as DOMID_SELF.
>> - *  2. Only a sufficiently-privileged domain may specify <dom> !=3D DOM=
ID_SELF.
>> + *  1. \@dom may be specified as DOMID_SELF.
>> + *  2. Only a sufficiently-privileged domain may specify \@dom !=3D DOM=
ID_SELF.
>>  *  3. Xen may not support more than a single grant-table page per domai=
n.
>>  */
>> struct gnttab_setup_table {
>> @@ -389,7 +446,7 @@ struct gnttab_setup_table {
>>     domid_t  dom;
>>     uint32_t nr_frames;
>>     /* OUT parameters. */
>> -    int16_t  status;              /* =3D> enum grant_status */
>> +    int16_t  status;              /**< GNTST_* status code */
>> #if __XEN_INTERFACE_VERSION__ < 0x00040300
>>     XEN_GUEST_HANDLE(ulong) frame_list;
>> #else
>> @@ -399,7 +456,7 @@ struct gnttab_setup_table {
>> typedef struct gnttab_setup_table gnttab_setup_table_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_t);
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_dump_table: Dump the contents of the grant table to the
>>  * xen console. Debugging use only.
>>  */
>> @@ -407,14 +464,14 @@ struct gnttab_dump_table {
>>     /* IN parameters. */
>>     domid_t dom;
>>     /* OUT parameters. */
>> -    int16_t status;               /* =3D> enum grant_status */
>> +    int16_t status;               /**< GNTST_* status code */
>> };
>> typedef struct gnttab_dump_table gnttab_dump_table_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_dump_table_t);
>>=20
>> -/*
>> - * GNTTABOP_transfer: Transfer <frame> to a foreign domain. The foreign=
 domain
>> - * has previously registered its interest in the transfer via <domid, r=
ef>.
>> +/**
>> + * GNTTABOP_transfer: Transfer \@frame to a foreign domain. The foreign=
 domain
>> + * has previously registered its interest in the transfer via \@domid, =
\@ref.
>>  *
>>  * Note that, even if the transfer fails, the specified page no longer b=
elongs
>>  * to the calling domain *unless* the error is GNTST_bad_page.
>> @@ -427,13 +484,13 @@ struct gnttab_transfer {
>>     domid_t       domid;
>>     grant_ref_t   ref;
>>     /* OUT parameters. */
>> -    int16_t       status;
>> +    int16_t       status;               /**< GNTST_* status code */
>> };
>> typedef struct gnttab_transfer gnttab_transfer_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>=20
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_copy: Hypervisor based copy
>>  * source and destinations can be eithers MFNs or, for foreign domains,
>>  * grant references. the foreign domain has to grant read/write access
>> @@ -451,11 +508,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>  * bytes to be copied.
>>  */
>>=20
>> -#define _GNTCOPY_source_gref      (0)
>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> -#define _GNTCOPY_dest_gref        (1)
>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>> -
>> struct gnttab_copy {
>>     /* IN parameters. */
>>     struct gnttab_copy_ptr {
>> @@ -467,19 +519,24 @@ struct gnttab_copy {
>>         uint16_t offset;
>>     } source, dest;
>>     uint16_t      len;
>> -    uint16_t      flags;          /* GNTCOPY_* */
>> +    uint16_t      flags;          /**< GNTCOPY_* */
>> +#define _GNTCOPY_source_gref      (0)
>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> +#define _GNTCOPY_dest_gref        (1)
>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>     /* OUT parameters. */
>>     int16_t       status;
>> };
>> typedef struct gnttab_copy  gnttab_copy_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_copy_t);
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_query_size: Query the current and maximum sizes of the share=
d
>>  * grant table.
>> + *
>>  * NOTES:
>> - *  1. <dom> may be specified as DOMID_SELF.
>> - *  2. Only a sufficiently-privileged domain may specify <dom> !=3D DOM=
ID_SELF.
>> + *  1. \@dom may be specified as DOMID_SELF.
>> + *  2. Only a sufficiently-privileged domain may specify \@dom !=3D DOM=
ID_SELF.
>>  */
>> struct gnttab_query_size {
>>     /* IN parameters. */
>> @@ -487,19 +544,20 @@ struct gnttab_query_size {
>>     /* OUT parameters. */
>>     uint32_t nr_frames;
>>     uint32_t max_nr_frames;
>> -    int16_t  status;              /* =3D> enum grant_status */
>> +    int16_t  status;              /**< GNTST_* status code */
>> };
>> typedef struct gnttab_query_size gnttab_query_size_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_t);
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_unmap_and_replace: Destroy one or more grant-reference mappi=
ngs
>> - * tracked by <handle> but atomically replace the page table entry with=
 one
>> - * pointing to the machine address under <new_addr>.  <new_addr> will b=
e
>> + * tracked by \@handle but atomically replace the page table entry with=
 one
>> + * pointing to the machine address under \@new_addr. \@new_addr will be
>>  * redirected to the null entry.
>> + *
>>  * NOTES:
>>  *  1. The call may fail in an undefined manner if either mapping is not
>> - *     tracked by <handle>.
>> + *     tracked by \@handle.
>>  *  2. After executing a batch of unmaps, it is guaranteed that no stale
>>  *     mappings will remain in the device or host TLBs.
>>  */
>> @@ -509,13 +567,13 @@ struct gnttab_unmap_and_replace {
>>     uint64_t new_addr;
>>     grant_handle_t handle;
>>     /* OUT parameters. */
>> -    int16_t  status;              /* =3D> enum grant_status */
>> +    int16_t  status;              /**< GNTST_* status code */
>> };
>> typedef struct gnttab_unmap_and_replace gnttab_unmap_and_replace_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_and_replace_t);
>>=20
>> #if __XEN_INTERFACE_VERSION__ >=3D 0x0003020a
>> -/*
>> +/**
>>  * GNTTABOP_set_version: Request a particular version of the grant
>>  * table shared table structure.  This operation may be used to toggle
>>  * between different versions, but must be performed while no grants
>> @@ -529,32 +587,33 @@ typedef struct gnttab_set_version gnttab_set_versi=
on_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_set_version_t);
>>=20
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_get_status_frames: Get the list of frames used to store gran=
t
>> - * status for <dom>. In grant format version 2, the status is separated
>> + * status for \@dom. In grant format version 2, the status is separated
>>  * from the other shared grant fields to allow more efficient synchroniz=
ation
>>  * using barriers instead of atomic cmpexch operations.
>> - * <nr_frames> specify the size of vector <frame_list>.
>> - * The frame addresses are returned in the <frame_list>.
>> - * Only <nr_frames> addresses are returned, even if the table is larger=
.
>> + * \@nr_frames specify the size of vector \@frame_list.
>> + * The frame addresses are returned in the \@frame_list.
>> + * Only \@nr_frames addresses are returned, even if the table is larger=
.
>> + *
>>  * NOTES:
>> - *  1. <dom> may be specified as DOMID_SELF.
>> - *  2. Only a sufficiently-privileged domain may specify <dom> !=3D DOM=
ID_SELF.
>> + *  1. \@dom may be specified as DOMID_SELF.
>> + *  2. Only a sufficiently-privileged domain may specify \@dom !=3D DOM=
ID_SELF.
>>  */
>> struct gnttab_get_status_frames {
>>     /* IN parameters. */
>>     uint32_t nr_frames;
>>     domid_t  dom;
>>     /* OUT parameters. */
>> -    int16_t  status;              /* =3D> enum grant_status */
>> +    int16_t  status;              /**< GNTST_* status code */
>>     XEN_GUEST_HANDLE(uint64_t) frame_list;
>> };
>> typedef struct gnttab_get_status_frames gnttab_get_status_frames_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_get_status_frames_t);
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_get_version: Get the grant table version which is in
>> - * effect for domain <dom>.
>> + * effect for domain \@dom.
>>  */
>> struct gnttab_get_version {
>>     /* IN parameters */
>> @@ -566,7 +625,7 @@ struct gnttab_get_version {
>> typedef struct gnttab_get_version gnttab_get_version_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_get_version_t);
>>=20
>> -/*
>> +/**
>>  * GNTTABOP_swap_grant_ref: Swap the contents of two grant entries.
>>  */
>> struct gnttab_swap_grant_ref {
>> @@ -574,12 +633,12 @@ struct gnttab_swap_grant_ref {
>>     grant_ref_t ref_a;
>>     grant_ref_t ref_b;
>>     /* OUT parameters */
>> -    int16_t status;             /* =3D> enum grant_status */
>> +    int16_t status;             /**< GNTST_* status code */
>> };
>> typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>>=20
>> -/*
>> +/**
>>  * Issue one or more cache maintenance operations on a portion of a
>>  * page granted to the calling domain by a foreign domain.
>>  */
>> @@ -588,8 +647,8 @@ struct gnttab_cache_flush {
>>         uint64_t dev_bus_addr;
>>         grant_ref_t ref;
>>     } a;
>> -    uint16_t offset; /* offset from start of grant */
>> -    uint16_t length; /* size within the grant */
>> +    uint16_t offset; /**< offset from start of grant */
>> +    uint16_t length; /**< size within the grant */
>> #define GNTTAB_CACHE_CLEAN          (1u<<0)
>> #define GNTTAB_CACHE_INVAL          (1u<<1)
>> #define GNTTAB_CACHE_SOURCE_GREF    (1u<<31)
>> @@ -600,40 +659,60 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
>>=20
>> #endif /* __XEN_INTERFACE_VERSION__ */
>>=20
>> -/*
>> - * Bitfield values for gnttab_map_grant_ref.flags.
>> +/**
>> + * @def GNTMAP_device_map
>> + * Bitfield value for gnttab_map_grant_ref.flags: Map the grant entry f=
or
>> + * access by I/O devices.
>>  */
>> - /* Map the grant entry for access by I/O devices. */
>> #define _GNTMAP_device_map      (0)
>> #define GNTMAP_device_map       (1<<_GNTMAP_device_map)
>> - /* Map the grant entry for access by host CPUs. */
>> +
>> +/**
>> + * @def GNTMAP_host_map
>> + * Bitfield value for gnttab_map_grant_ref.flags: Map the grant entry f=
or
>> + * access by host CPUs.
>> + */
>> #define _GNTMAP_host_map        (1)
>> #define GNTMAP_host_map         (1<<_GNTMAP_host_map)
>> - /* Accesses to the granted frame will be restricted to read-only acces=
s. */
>> +
>> +/**
>> + * @def GNTMAP_readonly
>> + * Bitfield value for gnttab_map_grant_ref.flags: Accesses to the grant=
ed frame
>> + * will be restricted to read-only access.
>> + */
>> #define _GNTMAP_readonly        (2)
>> #define GNTMAP_readonly         (1<<_GNTMAP_readonly)
>> - /*
>> -  * GNTMAP_host_map subflag:
>> -  *  0 =3D> The host mapping is usable only by the guest OS.
>> -  *  1 =3D> The host mapping is usable by guest OS + current applicatio=
n.
>> -  */
>> +
>> +/**
>> + * @def GNTMAP_application_map
>> + * Bitfield value for gnttab_map_grant_ref.flags.
>> + *
>> + * GNTMAP_host_map subflag:
>> + * * 0 =3D> The host mapping is usable only by the guest OS.
>> + * * 1 =3D> The host mapping is usable by guest OS + current applicatio=
n.
>> + */
>> #define _GNTMAP_application_map (3)
>> #define GNTMAP_application_map  (1<<_GNTMAP_application_map)
>>=20
>> - /*
>> -  * GNTMAP_contains_pte subflag:
>> -  *  0 =3D> This map request contains a host virtual address.
>> -  *  1 =3D> This map request contains the machine addess of the PTE to =
update.
>> -  */
>> +/**
>> + * @def GNTMAP_contains_pte
>> + * Bitfield value for gnttab_map_grant_ref.flags.
>> + *
>> + * GNTMAP_contains_pte subflag:
>> + * * 0 =3D> This map request contains a host virtual address.
>> + * * 1 =3D> This map request contains the machine addess of the PTE to =
update.
>> + */
>> #define _GNTMAP_contains_pte    (4)
>> #define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
>>=20
>> #define _GNTMAP_can_fail        (5)
>> #define GNTMAP_can_fail         (1<<_GNTMAP_can_fail)
>>=20
>> -/*
>> - * Bits to be placed in guest kernel available PTE bits (architecture
>> - * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set)=
.
>> +/**
>> + * @def GNTMAP_guest_avail_mask
>> + * Bitfield value for gnttab_map_grant_ref.flags: Bits to be placed in =
guest
>> + * kernel available PTE bits (architecture dependent; only supported wh=
en
>> + * XENFEAT_gnttab_map_avail_bits is set).
>>  */
>> #define _GNTMAP_guest_avail0    (16)
>> #define GNTMAP_guest_avail_mask ((uint32_t)~0 << _GNTMAP_guest_avail0)
>> @@ -641,21 +720,19 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
>> /*
>>  * Values for error status returns. All errors are -ve.
>>  */
>> -/* ` enum grant_status { */
>> -#define GNTST_okay             (0)  /* Normal return.                  =
      */
>> -#define GNTST_general_error    (-1) /* General undefined error.        =
      */
>> -#define GNTST_bad_domain       (-2) /* Unrecognsed domain id.          =
      */
>> -#define GNTST_bad_gntref       (-3) /* Unrecognised or inappropriate gn=
tref. */
>> -#define GNTST_bad_handle       (-4) /* Unrecognised or inappropriate ha=
ndle. */
>> -#define GNTST_bad_virt_addr    (-5) /* Inappropriate virtual address to=
 map. */
>> -#define GNTST_bad_dev_addr     (-6) /* Inappropriate device address to =
unmap.*/
>> -#define GNTST_no_device_space  (-7) /* Out of space in I/O MMU.        =
      */
>> -#define GNTST_permission_denied (-8) /* Not enough privilege for operat=
ion.  */
>> -#define GNTST_bad_page         (-9) /* Specified page was invalid for o=
p.    */
>> -#define GNTST_bad_copy_arg    (-10) /* copy arguments cross page bounda=
ry.   */
>> -#define GNTST_address_too_big (-11) /* transfer page address too large.=
      */
>> -#define GNTST_eagain          (-12) /* Operation not done; try again.  =
      */
>> -/* ` } */
>> +#define GNTST_okay             (0)  /**< Normal return.                =
        */
>> +#define GNTST_general_error    (-1) /**< General undefined error.      =
        */
>> +#define GNTST_bad_domain       (-2) /**< Unrecognsed domain id.        =
        */
>> +#define GNTST_bad_gntref       (-3) /**< Unrecognised or inappropriate =
gntref. */
>> +#define GNTST_bad_handle       (-4) /**< Unrecognised or inappropriate =
handle. */
>> +#define GNTST_bad_virt_addr    (-5) /**< Inappropriate virtual address =
to map. */
>> +#define GNTST_bad_dev_addr     (-6) /**< Inappropriate device address t=
o unmap.*/
>> +#define GNTST_no_device_space  (-7) /**< Out of space in I/O MMU.      =
        */
>> +#define GNTST_permission_denied (-8) /**< Not enough privilege for oper=
ation.  */
>> +#define GNTST_bad_page         (-9) /**< Specified page was invalid for=
 op.    */
>> +#define GNTST_bad_copy_arg    (-10) /**< copy arguments cross page boun=
dary.   */
>> +#define GNTST_address_too_big (-11) /**< transfer page address too larg=
e.      */
>> +#define GNTST_eagain          (-12) /**< Operation not done; try again.=
        */
>>=20
>> #define GNTTABOP_error_msgs {                   \
>>     "okay",                                     \
>> @@ -673,6 +750,10 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
>>     "operation not done; try again"             \
>> }
>>=20
>> +/**
>> + * @}
>> + */
>> +
>> #endif /* __XEN_PUBLIC_GRANT_TABLE_H__ */
>>=20
>> /*
>> --=20
>> 2.17.1
>>=20


