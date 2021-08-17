Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781753EE6F4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 09:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167600.305958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFtAE-0001Cz-B9; Tue, 17 Aug 2021 07:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167600.305958; Tue, 17 Aug 2021 07:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFtAE-0001BB-7u; Tue, 17 Aug 2021 07:05:34 +0000
Received: by outflank-mailman (input) for mailman id 167600;
 Tue, 17 Aug 2021 07:05:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7Bs=NI=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mFtAC-0001B3-Ey
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 07:05:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 182c77ef-5956-4d89-ab8a-410977f4a101;
 Tue, 17 Aug 2021 07:05:29 +0000 (UTC)
Received: from DB8PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:10:110::29)
 by HE1PR0802MB2282.eurprd08.prod.outlook.com (2603:10a6:3:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 07:05:26 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::18) by DB8PR04CA0019.outlook.office365.com
 (2603:10a6:10:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Tue, 17 Aug 2021 07:05:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 07:05:25 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Tue, 17 Aug 2021 07:05:25 +0000
Received: from 4b31f0f45051.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 69CD5DD8-74FE-410D-AC7D-1151BAF5F0B5.1; 
 Tue, 17 Aug 2021 07:05:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b31f0f45051.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Aug 2021 07:05:16 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB2038.eurprd08.prod.outlook.com (2603:10a6:4:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Tue, 17 Aug
 2021 07:05:12 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 07:05:12 +0000
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
X-Inumbo-ID: 182c77ef-5956-4d89-ab8a-410977f4a101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NCe22AEZtdVyOGjfiHkUDQkbqz9KPcjUAagky9RHto=;
 b=Rw6uaGD78d2EZLdORUIeTniy4y3LSePvSnLuLLYVcwYx9bG7+nTPGNKw1vcIUE67oAByJfpR5pkdaQM/s4WG8XTRHq67mdAHZF8HLSctAWZeAJHJ21YFRHhfy+IpkdqV7X+A0ymGk/c/LlJ8nT2sYc7c/RGUYxRDT/TOGYJ+Fhk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjsXB1hB3xSGpbSypklAZdqVN2hvRVFy2+QRuSVDJhcFxRb8usjWBao4p/vO3eJBQr6UyVRZOA+Z0IritqjJBR9L1TODzZKS8M8k3c84s9CdmJ5sARtrxdcVMsDaZKW6xv+vvBewChdTQdWQAcH8RkRN3JfQHLw2ZF4WIl/To5RkhXsB67LbZ/C/kifNUc4M5wugYgk4WLxQDimYxKZjs4LRbjQEjS1VTe33e6Su+Z8A6IvLBHACJl0g7LDulU+ahzqAY+44kGlhS99shhOxhOIPasel/b9sLKHTjdDa9kilT0Uv9fkmaNvnBFA5W6L2oEaIASk16/XkBSkhz/bSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NCe22AEZtdVyOGjfiHkUDQkbqz9KPcjUAagky9RHto=;
 b=ZyY6Hf/q3me+dd8/TBR2EnCXB4fEDtsohN9WAZoVMcVne0os2ib6Oguy+rI0jaLrXgWh5RzJn+EJj+hWvMl7mmWLlcK4TzbzMS8Mi2p29fFnTAR2xkJSzFiw0sRt9sNhLk2jc8u6KFeHZhq4GJnbL8Q0VYEtvCUX4tz8h9TfAt0Bu+DCvetwdx3j7ATcHPYG79fFHII4AQ52F15y3LKEZbcACb7c4EaMTttvbSEbSvfU2nx/avsGzcdHmUO82+fUdmG6lnSOrmmtSOzSXxN1q+mJRzrgBN4vh2BA/TpoYYRz+Ugc7aLHVnEQYjkZDkb7IItBxS7/MN9maiWgmL2VPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NCe22AEZtdVyOGjfiHkUDQkbqz9KPcjUAagky9RHto=;
 b=Rw6uaGD78d2EZLdORUIeTniy4y3LSePvSnLuLLYVcwYx9bG7+nTPGNKw1vcIUE67oAByJfpR5pkdaQM/s4WG8XTRHq67mdAHZF8HLSctAWZeAJHJ21YFRHhfy+IpkdqV7X+A0ymGk/c/LlJ8nT2sYc7c/RGUYxRDT/TOGYJ+Fhk=
From: Wei Chen <Wei.Chen@arm.com>
To: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
	=?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Jiamei Xie
	<Jiamei.Xie@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: RE: [RESEND PATCH V5 0/2] Virtio support for toolstack on Arm (Was
 "IOREQ feature (+ virtio-mmio) on Arm")
Thread-Topic: [RESEND PATCH V5 0/2] Virtio support for toolstack on Arm (Was
 "IOREQ feature (+ virtio-mmio) on Arm")
Thread-Index: AQHXTnoCHElKJmdGXUiNoDkpH2GuFqs2J7IAgEGng/A=
Date: Tue, 17 Aug 2021 07:05:12 +0000
Message-ID:
 <DB9PR08MB6857063D7D576B7776E4DED69EFE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>
 <0b2c79f9-67d4-219d-2edf-3576a8684c58@gmail.com>
In-Reply-To: <0b2c79f9-67d4-219d-2edf-3576a8684c58@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0DF71355F98A2043937A2EFAD4E1155E.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5b94d6d7-6e63-42c2-ed8e-08d9614d6365
x-ms-traffictypediagnostic: DB6PR0801MB2038:|HE1PR0802MB2282:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB228273D07FCCA137D642061A9EFE9@HE1PR0802MB2282.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UOTF4Qc6hwzHSSquQmr+NFBkMDJ22tKAtZ2QYlwlFAr0uZFxO4iigoCLomG0NRDiNn271UQImJIvQA7aoZ74Q0bTTIW9HLiL+5VmyJLRbEWxMSTHLCryI4Sr1190voe+lV5whMpzJigoTwU/KXj3q7Tww0+/2ZWxkWADpba8nBouaRo87Mwv3Mfj+4Lpofn06SQez/vMTcUxIRwrNgV8YGRat6B2JvtqQNHhLRbcOlJY+SI1AC53Ri3G7oJtsVLRsku+iDRYWONFhaqZTOJHaWJhOvumNRsqiHyNv14eeS0Qy3+hlNRkz4VU6E7fcB83rHuQjwU8NW+TY+MiY6DvFjgegkW7+DYPGHL608Bgc+9qlIpYZXVcTeaGtgtlmeTi/l4wg7wKA0cM8iqg0ZxSaVvC5MbjZfHcyf1Wf1dWj+K1RTAr+bQyrbAtBsdX1PwaYwPEKTQkkqZrTn0IHCHLCYl2rt7tIVg2ho8hg06GurPouswkN7Lx7+LQaRB+oc0+1Q8bWg6jz81z0HW+QWc9zeOTaahOS21oU8MniaZr87odJMfT/v3dd36CP5Mhj7UK5sRGiC+JYJuMk3fIV+zLePGJrYleLN9gRaQS1L+mO7DcvJmEqsqa6EydazQrIzLXrrdK3iI8Od5ETCFOfFnBIrAVQeRPXcYuT6EnmxO8c4L6EVNcW7XnAZVDWBeklVu3TOFio69JC3Od9BCNvKcLHr9cxPc6hZ+ZvVplqQuHjst/p7dgiD9aQcF6C4CYDIZ2GPg3NNrgGIyBLRuZQMcdEbHhfc20ObiC/52MGSaO5ZYU26Enxqavw+fzxnsv8iVJjaBPwBxvAbzsNiQWT87ZGQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(39850400004)(346002)(110136005)(9686003)(52536014)(316002)(5660300002)(55016002)(38100700002)(66446008)(64756008)(66556008)(66476007)(966005)(54906003)(66946007)(83380400001)(478600001)(33656002)(122000001)(71200400001)(53546011)(4326008)(38070700005)(76116006)(66574015)(8936002)(8676002)(7416002)(86362001)(26005)(186003)(6506007)(2906002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlIrSlIwbDVhbW1mZVJqSlJuVlVRU0pmQ0pjVm9TVjNMb3drVGVNdEtWZHgr?=
 =?utf-8?B?RVJNR2tjOG5qVDF0aTkrVHplaGVUU1A2eWE4RXdINWdhb3RSbVZQMGl6RXhz?=
 =?utf-8?B?eXkzYTh4TDZjTWo0UEc2dU1EY3UyL0Zqam9zbENSNVkwa2swT0xiRWtIRExX?=
 =?utf-8?B?MnhVTkQrU0Y4OUFBMlM2Z1h3eEFiSGVKU2M3c25PZ041anJsa0gzZ25Xa2Ju?=
 =?utf-8?B?ZEs5V20xWjNPcGM1ZGpITU1MVFNISkdhclYzT2R6L2xOVFVIQ09iek4xWjVo?=
 =?utf-8?B?b2pRTExER3NsS0JIbGVndkU1ekVCdkxvWlZpUld6SVEyVHY1NHFxZzlFNXlH?=
 =?utf-8?B?eFF4NzhXb0JqbkJOMkQ4aUdpSFJnTWlCS1dnRjlSOEpWVjMrSHRpWm5YalB6?=
 =?utf-8?B?MFFzbVh3Y3dtV1Q3Ym1XMi8vbFdIRitIak5DVC9zdGVDRjgyM3M5cWM3eGo1?=
 =?utf-8?B?MXFiNUpEQ3IwVThzL3VQTi81MjNFeVpKakF5dHNFYUxFdURsR2xCMXdBcDMz?=
 =?utf-8?B?UUZVZ2o3U0wrVlFOeFh1RzBwV1BKNkdoaHdEYlM3ajNIUWdEc0JOVnp1aTIz?=
 =?utf-8?B?TXNYT3dWVEt0ZWpqTHNLU2RFOVVYRDRUUHZIeE5vNUpPdDBOS1JnTXVmTWVy?=
 =?utf-8?B?M1ZqTlpXc1Fkb1ZzWFpjdTRWR1c1YWFXQTkwMG9SNmhaSSsyVTYzMWMwcThD?=
 =?utf-8?B?ajRnazNWMDdGS2tYbFVhSk5iQjZlaEYzRUtkOUp2UHB3S0RXdHpCWTRBa2ZF?=
 =?utf-8?B?S2dka2Y4UnkydXJnWjFRYmU4am5SWUR6Rk1aaWtXWnQycFVBVlFJcmFGNFQ0?=
 =?utf-8?B?OFdhTndyRjNhTmk4NytkU2NqTU9wOFRGeklTUWdFS2xqVXprVkVMUVN2OXNC?=
 =?utf-8?B?ZTRaSng0dXlwOXRTblNNcWl4R2NqaHZEYldhU1RLOFFVdE5jelZzYXMzVGQy?=
 =?utf-8?B?T1pXbWt0QnYxY2JhYnEwNGxzMURCUklZZ2dYb2l6enV6YmFZYzBncm00UGJI?=
 =?utf-8?B?SlAza2l0NW4rN2MxcG1ib0hWODZKTDhKbmlDMi9iS29JWkNXR3NxWFF5TXhB?=
 =?utf-8?B?c013WjBQVi8yTDFQdVFHV0xodXBzY1F5RTFtVGFVVzU5M0pyeHdlZ2dZb0xK?=
 =?utf-8?B?aDRvWEpyYWNEYmRsV2pPZkNGcnFKeW11MmJhZHlJYStQVndXYWFXZkFHUStE?=
 =?utf-8?B?dktsLzdSMU0zSW1VaCsrYU0yRkEwaDBDVHNaRXoxZFhyQmdRdWRMNm1Ycksz?=
 =?utf-8?B?MlIwUU9NV1YrdE1FVXZONFljVnNNbzl2NzNtQ1QxRDU2ZWErU242L1ZyVTlp?=
 =?utf-8?B?dnBtaTNHV3Bma1VTVzVKVVNOa1FuemdVSzJKZHBnRzZzRDNPak8yVndSR0dQ?=
 =?utf-8?B?U25zYnA1eVZQY0NIRWZ3V1RWdjd5RkR0azlaLzFVUHd2REhHeEd5UlloMXZ4?=
 =?utf-8?B?VFFMVU5SOFVYOGo1NGN5OGtoM3piOXY4K2R3aWdRTm9Hby9DaXpFZzBTYk5n?=
 =?utf-8?B?TTNsN2Z5QThibHlyTEZRSUYyT2UrVEo0U3ZLMnFPQ2hrODdlRDRxNUVwMDN2?=
 =?utf-8?B?S1B3bFJVTDJnb3pocXVnSWtMQ2xTbDlMVWxDNEFraG1hWGFvVklpakI2bU1i?=
 =?utf-8?B?MFBHZ3dKY1JydzcwUEhCbEFKTFY2UDdFTVlza2lrRU5yRElHWm5ZQUc1L2VN?=
 =?utf-8?B?c1gyRWc5eGlaZTZQZ1Nkbkt6TU14Y0lTdlBtMStTV3hUbVRvaUFQcnRhSFZ3?=
 =?utf-8?Q?xM8rzlbNyISrVGcIjVSZb/qXnpR8mIWX6zuxNxT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2038
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a854078-0717-4134-39b1-08d9614d5b77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TzNY3+KtSSPFI8GZbal1W6SUM1RX3gjAH/wVNCnyLSFi9Yh31JEfUb8wm/qCa6GkCihEy09QFjW4JaBt2tugLB+AzBu6gcBaF+JMFZp2rdcXTP/FVndFVLduuR1Lsj3OICcpYWln4EyUH3bXtw5tm0N4E507gFnTPXTolelEdFspk54DQI6bYBgu+NkSXuwYC3aqq1MekxCrzaPxQZ/Hyl6UAoD+fkOxAdl2DXYUDL/MUyP0J3xEUpCp02wbCNfhLQ6Lx+j52QR6GoCISrQ85X8HDy8J86OGqXnBzRQs+d7NOBb3xz/1nksiP4nb/b4dIITz8XPn4lVsu4Bc7EBU3RGw2FS+nuO+J3GVASJgQa15I3xGQ4lPQE1OnJ/zXVbZAwQQh+jI0Ja/WOd5aVKHGhOIDNzmNS6BMSXWHViWzaL1CYSkzlbEQsYnKBIaxQlq7kvAI2J2JJzsGWJJluUerZNJjtclUFwFQGLY+UAzc6LqxEr6jSvXyM8YXJKZXyoHCt7H+iAtSpe2ShPt/qmsi5mgIG/y2Ubc91o9DdVAfFAecgBBo1+IlmXRdePMyUS2ZN0AKrJce5TNKc47A90fHLGgZvP8DEq2FlSsnIi+VYNgPy8HlJg56NcUPY+uRGYXxZGV+5C02yyTjqeASQwvteH4CLJQAZ3IDA+VPTmI8p6TqkdPwPMMxoXO1YgaqSU8DvLbHbzDkl7UgSNdfoxI84BzMoGx7qbWuXtNd9lv9z29KqHbueMcFdZx74bVQJuL6fmyvIlI/rbX82JvLWDxZ+dGPLvXIU4lI3/VrrWs68QrGhQeMuewNkF2WifUz/KuHWu+PjphFxl80k7bKD2IQQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966006)(36840700001)(8676002)(478600001)(70586007)(8936002)(52536014)(53546011)(83380400001)(81166007)(2906002)(6506007)(82740400003)(356005)(82310400003)(86362001)(186003)(336012)(54906003)(9686003)(55016002)(4326008)(33656002)(316002)(70206006)(66574015)(5660300002)(26005)(966005)(36860700001)(47076005)(7696005)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 07:05:25.7565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b94d6d7-6e63-42c2-ed8e-08d9614d6365
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2282

Q0MgdG8gSmlhbWVpIGFuZCBIZW5yeSBhcyB0aGV5IGFyZSBkb2luZyB0ZXN0aW5nDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91
bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IE9sZWtzYW5kcg0KPiBT
ZW50OiAyMDIx5bm0N+aciDbml6UgMjA6MjgNCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBDYzogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPjsgSWFuIEphY2tzb24NCj4gPGl3akB4ZW5wcm9qZWN0Lm9yZz47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+OyBBbnRob255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFy
bS5jb20+Ow0KPiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEthbHkgWGluIDxLYWx5Llhp
bkBhcm0uY29tPjsgQXJ0ZW0gTXlnYWlldg0KPiA8am9jdWxhdG9yQGdtYWlsLmNvbT47IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtSRVNFTkQg
UEFUQ0ggVjUgMC8yXSBWaXJ0aW8gc3VwcG9ydCBmb3IgdG9vbHN0YWNrIG9uIEFybQ0KPiAoV2Fz
ICJJT1JFUSBmZWF0dXJlICgrIHZpcnRpby1tbWlvKSBvbiBBcm0iKQ0KPiANCj4gDQo+IEhlbGxv
IGFsbCwNCj4gDQo+IA0KPiBHZW50bGUgcmVtaW5kZXIuLi4NCj4gDQo+IA0KPiBPbiAyMS4wNS4y
MSAyMjo0NSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+ID4gRnJvbTogT2xla3NhbmRy
IFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPiA+DQo+ID4gSGVs
bG8gYWxsLg0KPiA+DQo+ID4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBzZXJpZXMgaXMgdG8g
YWRkIG1pc3NpbmcgdmlydGlvLW1taW8gYml0cyB0bw0KPiBYZW4gdG9vbHN0YWNrIG9uIEFybS4N
Cj4gPiBUaGUgVmlydGlvIHN1cHBvcnQgZm9yIHRvb2xzdGFjayBbMV0gd2FzIHBvc3Rwb25lZCBh
cyB0aGUgbWFpbiB0YXJnZXQNCj4gd2FzIHRvIHVwc3RyZWFtIElPUkVRL0RNDQo+ID4gc3VwcG9y
dCBvbiBBcm0gaW4gdGhlIGZpcnN0IHBsYWNlLiBOb3csIHdlIGFscmVhZHkgaGF2ZSBJT1JFUSBz
dXBwb3J0IGluLA0KPiBzbyB3ZSBjYW4gcmVzdW1lIFZpcnRpbw0KPiA+IGVuYWJsaW5nIHdvcmsu
IFlvdSBjYW4gZmluZCBwcmV2aW91cyBkaXNjdXNzaW9uIGF0IFsyXS4NCj4gPg0KPiA+IFBhdGNo
IHNlcmllcyBbM10gd2FzIHJld29ya2VkIGFuZCByZWJhc2VkIG9uIHJlY2VudCAic3RhZ2luZyBi
cmFuY2giDQo+ID4gKDk3MmJhMWQgeDg2L3NoYWRvdzogc3RyZWFtbGluZSBzaGFkb3dfZ2V0X3Bh
Z2VfZnJvbV9sMWUoKSkgYW5kIHRlc3RlZA0KPiBvbg0KPiA+IFJlbmVzYXMgU2FsdmF0b3ItWCBi
b2FyZCArIEgzIEVTMy4wIFNvQyAoQXJtNjQpIHdpdGggInVwZGF0ZWQiIHZpcnRpby0NCj4gbW1p
byBkaXNrIGJhY2tlbmQgWzRdDQo+ID4gcnVubmluZyBpbiBEcml2ZXIgZG9tYWluIGFuZCB1bm1v
ZGlmaWVkIExpbnV4IEd1ZXN0IHJ1bm5pbmcgb24gZXhpc3RpbmcNCj4gPiB2aXJ0aW8tYmxrIGRy
aXZlciAoZnJvbnRlbmQpLiBObyBpc3N1ZXMgd2VyZSBvYnNlcnZlZC4gR3Vlc3QgZG9tYWluDQo+
ICdyZWJvb3QvZGVzdHJveScNCj4gPiB1c2UtY2FzZXMgd29yayBwcm9wZXJseS4NCj4gPg0KPiA+
IEFueSBmZWVkYmFjay9oZWxwIHdvdWxkIGJlIGhpZ2hseSBhcHByZWNpYXRlZC4NCj4gPg0KPiA+
IFsxXQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8xNjEwNDg4MzUyLTE4
NDk0LTI0LWdpdC1zZW5kLWVtYWlsLQ0KPiBvbGVrc3R5c2hAZ21haWwuY29tLw0KPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8xNjEwNDg4MzUyLTE4NDk0LTI1LWdpdC1zZW5k
LWVtYWlsLQ0KPiBvbGVrc3R5c2hAZ21haWwuY29tLw0KPiA+IFsyXQ0KPiA+IGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0NCj4gMDEvbXNn
MDI0MDMuaHRtbA0KPiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAyMS0NCj4gMDEvbXNnMDI1MzYuaHRtbA0KPiA+IFszXSBodHRwczovL2dp
dGh1Yi5jb20vb3R5c2hjaGVua28xL3hlbi9jb21taXRzL2xpYnhsX3ZpcnRpbw0KPiA+IFs0XSBo
dHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy92aXJ0aW8tZGlzay9jb21taXRzL2lvcmVxX21s
Mw0KPiA+DQo+ID4gSnVsaWVuIEdyYWxsICgxKToNCj4gPiAgICBsaWJ4bDogSW50cm9kdWNlIGJh
c2ljIHZpcnRpby1tbWlvIHN1cHBvcnQgb24gQXJtDQo+ID4NCj4gPiBPbGVrc2FuZHIgVHlzaGNo
ZW5rbyAoMSk6DQo+ID4gICAgbGlieGw6IEFkZCBzdXBwb3J0IGZvciBWaXJ0aW8gZGlzayBjb25m
aWd1cmF0aW9uDQo+ID4NCj4gPiAgIGRvY3MvbWFuL3hsLWRpc2stY29uZmlndXJhdGlvbi41LnBv
ZC5pbiAgIHwgIDI3ICsNCj4gPiAgIHRvb2xzL2luY2x1ZGUvbGlieGwuaCAgICAgICAgICAgICAg
ICAgICAgIHwgICA2ICsNCj4gPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMgICAgICAg
ICAgICAgIHwgMTMzICsrKystDQo+ID4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2RldmljZS5j
ICAgICAgICAgICB8ICAzOCArLQ0KPiA+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9kaXNrLmMg
ICAgICAgICAgICAgfCAgOTkgKysrLQ0KPiA+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF90eXBl
cy5pZGwgICAgICAgICAgfCAgIDQgKw0KPiA+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF90eXBl
c19pbnRlcm5hbC5pZGwgfCAgIDEgKw0KPiA+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF91dGls
cy5jICAgICAgICAgICAgfCAgIDIgKw0KPiA+ICAgdG9vbHMvbGlicy91dGlsL2xpYnhsdV9kaXNr
X2wuYyAgICAgICAgICAgfCA4ODEgKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAtLS0tLS0tLQ0K
PiA+ICAgdG9vbHMvbGlicy91dGlsL2xpYnhsdV9kaXNrX2wuaCAgICAgICAgICAgfCAgIDIgKy0N
Cj4gPiAgIHRvb2xzL2xpYnMvdXRpbC9saWJ4bHVfZGlza19sLmwgICAgICAgICAgIHwgICAxICsN
Cj4gPiAgIHRvb2xzL3hsL3hsX2Jsb2NrLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsN
Cj4gPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oICAgICAgICAgICAgIHwgICA3ICsN
Cj4gPiAgIDEzIGZpbGVzIGNoYW5nZWQsIDc2NCBpbnNlcnRpb25zKCspLCA0NDggZGVsZXRpb25z
KC0pDQo+ID4NCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IE9sZWtzYW5kciBUeXNoY2hlbmtvDQo+
IA0KDQo=

