Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEBC3465F0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 18:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100752.192169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkUq-0004dF-ML; Tue, 23 Mar 2021 17:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100752.192169; Tue, 23 Mar 2021 17:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkUq-0004cq-JL; Tue, 23 Mar 2021 17:07:12 +0000
Received: by outflank-mailman (input) for mailman id 100752;
 Tue, 23 Mar 2021 17:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7DPu=IV=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lOkUo-0004cl-NP
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:07:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::627])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 478eaa4f-0b41-4203-9a08-d5be497a4aaa;
 Tue, 23 Mar 2021 17:07:07 +0000 (UTC)
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by AM9PR08MB6194.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Tue, 23 Mar
 2021 17:07:05 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::16) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 17:07:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 17:07:04 +0000
Received: ("Tessian outbound f15357ab733e:v89");
 Tue, 23 Mar 2021 17:07:04 +0000
Received: from 08a8de55d784.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8EBDA577-0DDF-465F-8076-872280E8DF8C.1; 
 Tue, 23 Mar 2021 17:06:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08a8de55d784.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Mar 2021 17:06:52 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB4688.eurprd08.prod.outlook.com (2603:10a6:802:a3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:06:50 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:06:50 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 17:06:49 +0000
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
X-Inumbo-ID: 478eaa4f-0b41-4203-9a08-d5be497a4aaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gJMI/JRdY9brm2ekNNIX6nBtQno/t7ociY5F+FOE74=;
 b=ybuih+Hr/Z4LsScleHoQl6A/bs6B+DaifU6oVAl+y7s/4jItk1c9pulTT0FaK3z8D3MeWjE7NRvc2KiMcbV74y4GtI/F8naPvFNvKroJjqIyOXYg+Fn53qDJyC9c5LuhUgBOJHZprHn72xX/TyX1q19GBb2nEk3RjWhmGlWWLS0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 575b515e21fe6b5e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxT65rz1iufRP3FZMV84Yt2yR3UO/Y3V5AkI/QA+tk1CVhXlrjbcQ43XDxuhlOvl1wOYauxOe28BgJYSSrANKnT5bsvsg9h1vlNP+ZSVA2jb4oZ+bmuS2xkqixJv5oqQl8LkSoJwgrOCf5Hrw0VN2akNtDRGUN/mq5r2fAfJrlhCoQCtTbfqnLWj2lL3VenMRW3tJxeGYvmt49H5BzLrI2fWxdXXwuNzK01vmZXy4RPVMj98oYujlW9oO6TvkQz0bz9G7inweGyT3943PMdkC6QdsFhIfGPIr3r8Lf9fQDqxIDMBv4ylMDb6RZqM46F3tHXEzBDJhfAIk0pOmnG3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gJMI/JRdY9brm2ekNNIX6nBtQno/t7ociY5F+FOE74=;
 b=mj2Qw+ers3kZVjuhto9oz0lVSBsa1FtQkCuHATisObeR5ysInkMIJuUd3LVnu9q7teh7uRA48odhfnWxOfxJsDhPUGca0r8feK2ch2KMgEZ6/XOZD/FAG7uvhxgVUWO/cMhWHq4JvLN35HiKgCweeExviiQgwxnVoTsbjRVmlWq+zmxTXFYyczMHIHHomq2lM4k/7cuL1ObMEEHN3dPYus6Q2xOyElTrHSF4aC7KTjH+lvM1BsOfhnMSNbHpRvq3iOR6oObvZCxMsGWpXHvpn2cuMSqRtE6SPZG7aE06flsZYoK3Z/1gISeGeiJpdkeyICWNIvUjL+sdVpxFRvV86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gJMI/JRdY9brm2ekNNIX6nBtQno/t7ociY5F+FOE74=;
 b=ybuih+Hr/Z4LsScleHoQl6A/bs6B+DaifU6oVAl+y7s/4jItk1c9pulTT0FaK3z8D3MeWjE7NRvc2KiMcbV74y4GtI/F8naPvFNvKroJjqIyOXYg+Fn53qDJyC9c5LuhUgBOJHZprHn72xX/TyX1q19GBb2nEk3RjWhmGlWWLS0=
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <565C6475-4693-4A7C-8316-9613146300C2@arm.com>
Date: Tue, 23 Mar 2021 17:06:43 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A09774F-ADDF-41B0-8E72-DC0FA0A6B1F3@arm.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
 <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
 <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
 <CAKf6xptBm8G-T8UCfht22nfeS_4XOj2sN9fBvJhOVA1QKbfnhA@mail.gmail.com>
 <565C6475-4693-4A7C-8316-9613146300C2@arm.com>
To: Jason Andryuk <jandryuk@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::25) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d18b5f3a-696c-4385-a543-08d8ee1e1551
X-MS-TrafficTypeDiagnostic: VE1PR08MB4688:|AM9PR08MB6194:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB61948F8165C6900565C564C4E4649@AM9PR08MB6194.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9ftpG99ilUvP3GZ2WRa5Iwv5P/5RpT1Np9B88HWhNm3p5Aw1NmPTJYXWgA7oj23CljE+3Mce1IjzAJpcPzXNanpVeb2XMsXXcxNrhB2zE7sjwOtPo3RVlRBz5kaKdvrB8jPqc1rfntELFr9g34WG6+1eh8QM0Wp1DLeIsl5sDsm5Q3jj7ExWyxdxEdrQpQyXuEIq41eth4jJwvyb2IiHn/WqMiLQ2pO16WeEgYWwu8IT5NfrsSdNlFS4L6MRGCx/PvpC4frU+IX7mG83Rn3/3DVGaEYnuQ9CbtcDDCLhqBSV6JHr+ALr4zcBbah+d8Wm0Hwz0ziprj6wY1nSADRfnk8kmlFClDZjVGe+lW9cRFC4wbq8uKS2rTKB4wr1eoXQqXO1DQU2AL6/aTwe9yfUbLYr2RQviAaNxb+TYmzDuu4DgGWBp+Cnw9Fr/hJecXjkTg9bWoqfl4JuF8I9kTp6dBs69P83EeBKKyyEZqsFaUCb5/9yGmOtTz2cFFIVXGdinEytQaS7QPmjWn8311J7T+e5RoKKeEI0HBna0uxhmU6FPN1n/IrDlVdbTH8cnZdRd3UpvDl8hjnHwiPZtHC7Fb8H5SOGAueeKMZJobxFICzNBIACukJsUU+xz3g7l9yFdeCUHuJKHkgWNFhePONlPKgG/GvCbnT5rhULk2sxdLOn/bnC5/ixaigZ8EiwSvDtV+WwsJMdkWcJ/zLwpfJoNHm9DfulZcQirtH/KtreKSoUktZLuAUz4SAxWpLA6v6Guy5Ay5X/QehW90HtALNE+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(66946007)(52116002)(66556008)(66476007)(36756003)(4326008)(8936002)(7696005)(6486002)(86362001)(478600001)(53546011)(83380400001)(8676002)(2906002)(6916009)(38100700001)(33656002)(54906003)(16526019)(5660300002)(186003)(26005)(316002)(956004)(6666004)(2616005)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?NjdwczJsaWRrUUJWb09rcE94aWpSUzg1QTQrWms5RFFIUVhKaStPNDZUSGg5?=
 =?utf-8?B?dTIxMFhBRThNODlmbWwyZkRPV21qdG1zbXQ3YTR1dUNOMTZja09GYUhtZVFo?=
 =?utf-8?B?SzdEc1NSeTg1bWxVNUtqQ0ZKMFk3MnhhTmwvK0FiTHpZUlpDUGR1NlZPZHhJ?=
 =?utf-8?B?Z2piamR2cnhITWVnWWlobG55WWZ1dHBZVjZGbFFXZTZEQ1hrb3dGNXpZeW1Y?=
 =?utf-8?B?RXBidEUyV29TUHBhWXBUdFFZc3pVdFNqbEttem9ScVNhblI4cXFHTE1qRUJB?=
 =?utf-8?B?U3A3V2w4NFlROU40L1NnaEdiMmxDdGgwOWljdGZEdUxQZERmVXRXRnJnWlZ6?=
 =?utf-8?B?SThQeFl4dFBzYldYZWJTSzFOdkpPNnlLV2JFMHNCZDBidlpCQndDQVFXQ1Bt?=
 =?utf-8?B?S3I0b1F0NEdEbWZ4UTcwdElPWGI0RVBWeFJabWZYMXF2ektGdEpXeGg0K3Vw?=
 =?utf-8?B?Qi9TeDNJbW9uRzlxaE01WGUxaUhaQjdvMjRIV3VKc3dVOVFNbHI3dU1lY3JN?=
 =?utf-8?B?RUYyVitnRUpGeDk1NnFnSmppaFQzN29PZG8wT0k4NElXTzBKYy9ZV0o2RG03?=
 =?utf-8?B?MjY1bXd6Z1ZuSllseERNQnI0RWpxYmpCSldxSDk4ZDk1VDlmQW10eWs1MnZu?=
 =?utf-8?B?SGlURWIyekpxOGVvS29Gc2RsZDdGdzRhbE02Sm1NeEg2anczd3B2bFBUdXNZ?=
 =?utf-8?B?VE4wbmRNVE1laVVWR1BYR1pCOGY1KzRxMnArcDZ4aFgreHVYWHgvOEJGZjBj?=
 =?utf-8?B?cHR4S1o1Tmx2Y3JRR0RBYndMSjFMcDlMZUwxd08ydkFiUzc2ZUltdlJCaGhX?=
 =?utf-8?B?TVZLVis1NTV1UklEYXdiUXpMRG5tWmhzbXpKM1J1U0IwTDRWWVpTZ05OZG9x?=
 =?utf-8?B?bEt6M1RCME1lSTgyYmpHK1NrUTVpZlZYWTh0dGxQZlVtSjRWYkNzM1lrMlo0?=
 =?utf-8?B?RUc4bUxxMjBxTUNUY3RaZktyRGcwTHhHckdwYkJweFQwbFJyK1lwSVZsL2Uv?=
 =?utf-8?B?VEoxclg1T0RzODg4a04yeEhJUVNwbTFBb0NMeStGcHV3YktGc3AyQ0xIcDM1?=
 =?utf-8?B?b0lhYmV4QXpTOHRNSDVKc1NVYThsYUVKVFJmd2xhbU84Wk83OUZmS3hnUzNK?=
 =?utf-8?B?L2haQkRqTzE0WnBlK29rTWJ4Z1ZDYVhuaDE4ZU5ETGo2V2NtMXBhZ1R3MTlN?=
 =?utf-8?B?eTJWWk00U0FsTjVVOE1wYk9hbEllMC9Xd2RZVnhWWmpyTWo1UnpGelNYaHZL?=
 =?utf-8?B?RlRITGdTNDBiODVHaDNZUE1HdXZMVGNHRXltLzg4UzNhQzFJTzlxQ3I0NHY4?=
 =?utf-8?B?STQxdzRhMGxjRWRrV2FTejJnYWRHdnljaEgvL1BrZXNPektzWnpnRVdlN21C?=
 =?utf-8?B?VlZlNnRDNHJBLzdYaFhIVHBiNC9RZnlrWE1QMHp4TC9aajdKYUhUeUJabTF3?=
 =?utf-8?B?OWwxeVVEWkQ1NXpQaUZWajRtSEpOZnNNOTg0bTJBbWhxQklNUnJiU1JFVWpC?=
 =?utf-8?B?M1NzdUhOdmFGYVJNU2tMSWxOQ1ZVb2lweXUvNkNlNEwwdXJVK1YyOC9kOGdI?=
 =?utf-8?B?c2sxMkdTc3NTdVZJU0dDQVFKdFFibU1KR0xYZy9PbitZQUVVRnBCMzJLYy8y?=
 =?utf-8?B?UzFNMS8vdHgxc1IxWVhsM2dCbldDUUh4NWhWekNFNkhPWnNxUlgwYkJuZ0Ni?=
 =?utf-8?B?aGhWZmlFelB1V0xmOXdIRGFPdlhSclM4dzRQZmFSVGY4dTJadFJSNHB0NWsv?=
 =?utf-8?Q?EIhNNBmxaXR0dI0Ce18ccF8cnyRECPynVylhXCA?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4688
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f0b09f1-89a3-4190-758f-08d8ee1e0c64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fz4u/+JLG5G76iVkY3z9Qrkbnu42ilgl0MkXj2iGeS7/SfILU3f8oSpoNEs1+zwTPLNv4VRjK0viUAq7Tfmzgj04QPxau/IcCv1y3dJ1U2XwW7rEFgruD/WZysL6+oq/fqzq+dhlM42WIM2ZJiBprFh8ZJAOwsQdUVWCdd83kN9xwuwxQtdIChNLe2bpOey6kIhRd9Ep7VnFeK4cOyCPQ9Ui+4JrDitlIgkos+t154nTpgTWUT+kGyXShQ/ltVzi2fQipJQp5vJinsOnirAvDNy/23vXpxtk7ZAIZOYhuJ2AH72We1pqdyxOGX78Dm9vxkLJ/9XFbLUynG2CjLxwgvfChFSGG6Cs7zIN2dQn6JT22tpy3j9JfuMvsiC5Ep2gx3UfGmknpei0lp0w6u4nDzfYcEWuAMlZPfOssycluwz92LTS+u6tte2K7cULSFtTsGXw4j1xK45gXc2wo7iMrz0vW3+NsFkV2lxafJYLW3cudGbMBwKIXR4ma/BZRB302JBW76LjlGCZmLlk7Kgfp1BcGUqJZMh57y8YV/4DTY+xvUmD+hb1dSVfTU7e15JiSMUoyz9eAwHoFQwWxTjFtKbY0fc2t7Fe7C/qBOAjtrdKpCShPa/lVPRTZPz00eVIrKHveLqrsY+BDkP0TDw91JpdMenjANn/TzbjQychW3YnnADOpuP+wN2DxM+kKaQJmRuvjl8lncP0O1U5PMihdgHe5n3caJ0vbVi8o9Iy/y8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966006)(36840700001)(86362001)(47076005)(36860700001)(83380400001)(107886003)(81166007)(82310400003)(82740400003)(6666004)(478600001)(5660300002)(6862004)(33656002)(356005)(70586007)(70206006)(4326008)(16526019)(6486002)(36756003)(26005)(316002)(54906003)(186003)(7696005)(956004)(44832011)(2616005)(336012)(53546011)(8936002)(2906002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:07:04.6947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d18b5f3a-696c-4385-a543-08d8ee1e1551
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6194

Hi all,

I have an update, changing the lock introduced by the serie from spinlock_t=
 to raw_spinlock_t, changing the lock/unlock function to use the raw_* vers=
ion and keeping the BUG_ON(=E2=80=A6) (now we can because raw_* implementat=
ion disable interrupts on preempt_rt) the kernel is booting correctly.
So seems that the BUG_ON(=E2=80=A6) is needed and the unmask function shoul=
d run with interrupt disabled, anyone knows why this change worked?=20

> On 23 Mar 2021, at 15:39, Luca Fancellu <luca.fancellu@arm.com> wrote:
>=20
> Hi Jason,
>=20
> Thanks for your hints, unfortunately seems not an init problem because in=
 the same init configuration I tried the 5.10.23 (preempt_rt) without the J=
uergen patch but with the BUG_ON removed and it boots without problem. So s=
eems that applying the serie does something (on a preempt_rt kernel) and we=
 are trying to figure out what.
>=20
>=20
>> On 23 Mar 2021, at 12:36, Jason Andryuk <jandryuk@gmail.com> wrote:
>>=20
>> On Mon, Mar 22, 2021 at 3:09 PM Luca Fancellu <luca.fancellu@arm.com> wr=
ote:
>>>=20
>>> Hi Juergen,
>>>=20
>>> Yes you are right it was my mistake, as you said to remove the BUG_ON(=
=E2=80=A6) this serie (https://patchwork.kernel.org/project/xen-devel/cover=
/20210306161833.4552-1-jgross@suse.com/) is needed, since I=E2=80=99m using=
 yocto I=E2=80=99m able to build a preempt_rt kernel up to the 5.10.23 and =
for this reason I=E2=80=99m applying that serie on top of this version, the=
n I=E2=80=99m removing the BUG_ON(=E2=80=A6).
>>>=20
>>> A thing that was not expected is that now the Dom0 kernel is stuck on =
=E2=80=9CSetting domain 0 name, domid and JSON config=E2=80=A6=E2=80=9D ste=
p and the system seems unresponsive. Seems like a deadlock issue but lookin=
g into the serie we can=E2=80=99t spot anything and that serie was also tes=
ted by others from the community.
>>> Do you have any idea on that?
>>=20
>> I think this can happen if xenstored isn't running.  Client access to
>> xenstore blocks until xenstored becomes available.  So check your init
>> scripts ordering.
>>=20
>> Regards,
>> Jason
>=20
> Cheers,
> Luca

Cheers,
Luca=

