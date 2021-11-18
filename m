Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D59F455CFB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227432.393355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhm2-0006HL-AK; Thu, 18 Nov 2021 13:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227432.393355; Thu, 18 Nov 2021 13:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhm2-0006FS-4s; Thu, 18 Nov 2021 13:48:22 +0000
Received: by outflank-mailman (input) for mailman id 227432;
 Thu, 18 Nov 2021 13:48:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnhm0-0006FM-By
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:48:20 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f3eefb1-4876-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 14:48:18 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIBZDPE020080;
 Thu, 18 Nov 2021 13:48:15 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cdchgtr7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 13:48:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2829.eurprd03.prod.outlook.com (2603:10a6:800:da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 18 Nov
 2021 13:48:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 13:48:07 +0000
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
X-Inumbo-ID: 2f3eefb1-4876-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWVp4coT/c+yB002O1Xkno8QrGCypWBXB8nP9ohSqfXYbw/nstVTunYGU0vwlqjx266eyq/CCMJFs3WLjYxTkbwBRiduZ3RVTk7ufAoVccanay6UGPDhhSxFPp7bKLtuTieQAEIM5dFKiEboD5iNzpd351izvAQ9ZDCPviETUQU4QwD1hr7eccmWTznpifd7/xXwx7iI+3qSnsHdX5+ODY2fAsFWscOk4c7wVX4stj2wZEsEdFwCfl7CMUta/21BBFX25V1r6geuZMc1Yz3eFDVresqR1IBLg/IQHSJu8oKNJZU0Ge6M89wc8mkd2/1vuUqJeIG/OqzsGm6vSQhcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbg+UYZgRAFSEXvRxiZrMy4N46RL/4mL3h1polXP4v4=;
 b=fH0DSwyK5ui8ekdTVX8TRgGAfaLWppGf9/e+pCLNko4PdJDCObEFkbqU95OTLcZqiXw7TiMpQwGHlCmJPrGru35UnXjMO91qdi8IIK1gk9gzYU82158e3+A9eUj54/C9ec85zLlnSOmMKTGlZSYSn76Bl7qfD3VLbZm1ZdWFfi1DjuN0kFl6Bd9rYDNvr5kLTh51Wxdo0VcYs+bUN684qIOQPdP3wVbZcbyYm4vb5OLNSBWGk5m5NAcLZta25ogygXr/arIYffAyxzB8dVx2ZCK0Ztx9F4hjreC92l7ALWPFdc24b+JXPDD3HofknOGoTNRacjzSSzrOIbOEhuaWEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbg+UYZgRAFSEXvRxiZrMy4N46RL/4mL3h1polXP4v4=;
 b=pwoFlclQzAyunSIexrZWGXrqhsHLHjbBy/UB7W2q4r1nqO2x6i4LDPSgotilBeZXWM0zLPl2xoYO3wMfCIz9vhb1XhHv+NetEoVZGJPvwxvkWRV0temlVRYUEJIjX+1ggyq6a9nIQ25VK1hTRgJKgqIoPArhm8pRv8AWmOo+xX5sl0SF+aVzUi6k5KbCOQxsXt6PAxg1G0MWIfmq5rtPEBjjkC9uZ+mWYGqRWpIZh5VPPO24yuDKQwmB9NjwyXrJVBTRfO17DHm7rck7q1QxncxGRT6l/VpI5lfJItinJyzcyCJOtXGm9xeeAeAG6ntExPJ+3STSPduJ0ylMoT2Hcg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgA=
Date: Thu, 18 Nov 2021 13:48:06 +0000
Message-ID: <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
In-Reply-To: <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7a172eb-3b02-49c0-ee67-08d9aa9a0d11
x-ms-traffictypediagnostic: VI1PR0302MB2829:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2829A13D107ECFCC82255693E79B9@VI1PR0302MB2829.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UucAYTfsCKefya5aWmWn4Ivr929qwbyVpFB+ZXmcfVkc6bebPxsnGjECO+K2grJOnyqeZry7nZKoJVrpRYrRgyjQlxXcmNP1jKGM1FMGvs8/d/sAeQJLZBBrEPsutd4ey+K1BxugYZVagvAWT3ti385NM7mrwYAf40LVxT4xMeF8uWhHSZ3XxeuAFeq6sOEggCeeVJwkuwv07QlOiTQ4HJ++Rvva0qpTsgkNvsyRT0T0hvWQ2mdacvagtuBuyxzdD5RoCRIWz47fIKzqTFaklwm6eUjbywOaoi65bWM4OGFjyYEGaYsN/mw4v7AhRz6LHihyaEoMIR0oqh8GWhoUwxETa3LjkzLFtqLg2CT0q1dtO2y6jAITWJvRe5PE+FwuNKhTaErm9UJNv0mck/M/XImi4QHAqBuFIZVYezUx9FzP395vf6YEp/5fcY7a3bphHke4FG0enW9AauiWkp/sC8IG9+B6zlNYibf1nxbQseJoD+I4Dxz0Sz26oSgrfoBj7jou7C/sDYQ+v8IuGrqRhwn8sDZONyFQmBVmzp9UCv2OnBwtwYPEdzr2wvWkty0BL1eRCEI29aV9XQmDlau4q1EEzLVTxlU3EECbPv+cRqxAxBNBcfp9+zYTRVfET3Fx3otU5cpufq5qg+bj0s/zRAnjge9YVPpopTgZDy570x8g9bsgiHgA7mWtMRy0Y3zEdslwv1T7AQpnz3glI7YhSMYlZ2AYXkYteCsZSr0TaC7Tf8HjzKITQ9zh6eiT3GJm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6506007)(2616005)(5660300002)(31696002)(53546011)(54906003)(186003)(36756003)(4326008)(38100700002)(71200400001)(122000001)(38070700005)(91956017)(6486002)(107886003)(86362001)(8676002)(6512007)(316002)(66446008)(64756008)(508600001)(66556008)(66946007)(31686004)(66476007)(110136005)(7416002)(8936002)(26005)(83380400001)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MU9zY2gxVUNWWVRPV3JCQWM5NjZpdU1NNFd6SFY2NFR6WDRkM2x0TVVSTTIv?=
 =?utf-8?B?RlEvLzk4azdINHcreWxCTGhuOVUyMlhycGZZNU9IdkZGZjRDbmZOR1czc0ti?=
 =?utf-8?B?UGQrQ3oyVGllYmE4aGxNQWJsMnFCMTNhYVlldDJkTGdNemJIK0phSHpndkVp?=
 =?utf-8?B?OUdER2RnSTA0bGFUMUdFMWxET0NjNTRhOUNwNk1RT3RjbjNtcklPa2FkZE9V?=
 =?utf-8?B?dTVtZGRLcjdGdXRQdjBLa0g1MFVGNms4bVp4clVWT01yQno5WHA3emhhM21D?=
 =?utf-8?B?UUJQZ0hkV2pPUDd6VFRPN2o2L3RnL1JPZkJqMVg0MjYvc1FBVER4SmY4R2l0?=
 =?utf-8?B?VmYzWm11ZVFRTkhPenI1Mi9GZGo1NUIvV1hsOWRmNHlXNTZDSHc5YTAySlJ6?=
 =?utf-8?B?Zml1Wmk4T1lVYnl0REZLQ0R3YVgwWDh1OXRnMDgrVFNDREJ3Q2ZabEZLSnJQ?=
 =?utf-8?B?R0JtOCtwamZoeWlSMGlaOXRmdlllOUwwdFR3YmZnS1ZSdVRCRGZ3aWdIZU1E?=
 =?utf-8?B?b1RFaGoxbnBMQzdXOTdjYjd2NlF1dmM2L21NWVg5ZUtLVllCenFnQzZQRnRB?=
 =?utf-8?B?VTZZQnkrMytOSGJya0FONGxiVDV5bWoyV0kvNVJwdXgzc3htS1pDQTd2UGVM?=
 =?utf-8?B?ODdkc1A3aWZqcHlvYXBvRm9LMmR6a2p4ZkpxcmlnTHg4T0xBbm0vVjBOSWRS?=
 =?utf-8?B?Yy9GTXB3c0IzODRDRGljM0dxTEMrY0lhQjRtYXNsYWpLbDA2YlVnZWE1dWNi?=
 =?utf-8?B?Nm5rMU9SR1dFa0hwUmw0bWlMb2pJMmp1ZktkQi9kZHpWMWQ3ZVdVM01BOEll?=
 =?utf-8?B?VDNJMFJtaXY3VFBaSThZQk84QVBINk1NWVVSMVVNZkU3NnozZCtCeW5PSi9O?=
 =?utf-8?B?SXFTbVFBbU94UzVXVFp5WllxZ1EyNlZHMlgwTlZjWGFzbEpkT2xMTDc3TTN5?=
 =?utf-8?B?bHJwTGlqWk9NRUhld3A3cE9NZ0ovTEpXcDF6UVgwTWRNN1JHQXlkWG1aQlA3?=
 =?utf-8?B?djNYTFZOZTQxQTd2Y3FPTUM5SlZrUVNpQzVZamp3bDBpeWc4MEhCbmFqd1g1?=
 =?utf-8?B?VGpqMHNaUnQrUzdkeGZQR0JXSXVxYnIvQ29TUThhZTRQekF6NWRLbHJHZWkz?=
 =?utf-8?B?WVVWNHE1ZzVoUmtrTThCaGJraUp2YlhnZVV5NVphYkV6MHRsNm5iS3FCUWxz?=
 =?utf-8?B?cC96a0JRVmt1U0RCVmdVRC9VYjdWY0hiWGptQUtOeVZXSlNDQU1PQWZZTC9x?=
 =?utf-8?B?eWxrMXNRN2ZaV1lmcDFiRjVEcmtTbVZlNjZuTXJ2R21SdjRoL3NwQUN6MGFC?=
 =?utf-8?B?KzB4MHBMTXpqM3ZWR1VGdDZzUlorS2g0NTlBb1hhYm56QnVFQU5Pd1RzZWVL?=
 =?utf-8?B?TENaL3hjbSs2YW9pdkdZL1BnRGM1SEJTZ2RuYk43RGFFRHp6T3RUbFFQclFk?=
 =?utf-8?B?N1hQWExRZ0NpSC9ObnBISVRCZ1V6TEhYR0ZXU0VMZy81L215bVBTMG1abnd3?=
 =?utf-8?B?VTR5NlgzNnIyLzNmTXpFM3VEWGg2SlNTcWo5S05Dc0NZRjJGWGJrbDhhMDZW?=
 =?utf-8?B?YkVXaUFDYXlHL05kTlB4UjJ3K0phaHVFWlRKdVB0NkJSV1ZhT0dtUVRxeGla?=
 =?utf-8?B?VDhUQTNKbncwejlVbmd6ZFBkYm0zSGlXZFVhMWNQcWpaRmFLOC9GSitDbGJV?=
 =?utf-8?B?WjhORklLOVpWSlMvelVlUzdmbXJkSFNVVkY3S3lTakZ0RktZR3FINzIreVQx?=
 =?utf-8?B?cXZ3Q0U2RGM3YWpZVUg3YlRIbFJjcFprRVNUdlIrTUJ4a2dqNDBUM0o0Y25X?=
 =?utf-8?B?RE9HeDFyL2UySjc0bVRnbHRDZVNtc012V01hb2NIcVFsdnZjUTh6ZmJVbG4x?=
 =?utf-8?B?S1c4M2Y0QTZGN2pUT1BEQnVUdG45Tk9leVM5emhkRnlSbHZvRHhCdWVsZGVX?=
 =?utf-8?B?NUNzeWg5c0wxOXJOYkxhaFM5S3lTeXoydFpOSHBMNDVPS3JZN0lRZGc3aUR3?=
 =?utf-8?B?WUxCMENtT3l6Yi9Nb1JYSzAzd2lGOEtpcFZCbGVWY1huQ2QxK1FBR3hjb29O?=
 =?utf-8?B?QjRENXZuM1FSUU40cmxXRGRKVG4vMkZBaHFwZ3lESFZDaEZIdmtzdFUrWlhn?=
 =?utf-8?B?NWcrWkNmYzA0U0VYUEk2QU9mZFZSR1ZzZ2tQVlVFSGE0K3lLOGg5d3cvMDdM?=
 =?utf-8?B?eE5tSnhnVkpORlRpcklNZlJnQnloemNKODZ4d3JRZ1AvRWlsTGhCQ2gwRGpZ?=
 =?utf-8?B?WE5XaHhDZWM4WWIzNXZyMVNrS2ROb3hSMk1UUjRONUwyZzhkem9UZW9DWGpl?=
 =?utf-8?B?d0t4dlVyTnRYSTlsbUd5OUN1NWVIQnh0NUNQYnZHOG8wT2pFVXpPQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F21D53F58419D44C940F4B033BA3765E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a172eb-3b02-49c0-ee67-08d9aa9a0d11
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 13:48:06.9106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwpzCPQ2BuH/weUsFmqnIV7sm470H0s1jdGLyAHS7HHfBhcqwxjySnB2CMA90nR9Oh6PXltEu70HTjJ3eCBqjOXnceBi1zstzGJiaC49h8Z3EmsQE8NQpQTaIrl7o+L7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2829
X-Proofpoint-ORIG-GUID: 6zo6QuMG5HFc_nfWwhB1DtxljeTp3_59
X-Proofpoint-GUID: 6zo6QuMG5HFc_nfWwhB1DtxljeTp3_59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180078

DQoNCk9uIDE4LjExLjIxIDE1OjI1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTEuMjAy
MSAxMDozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTguMTEu
MjEgMTE6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE4LjExLjIwMjEgMDk6NTQsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxOC4xMS4yMSAxMDozNiwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxOC4xMS4yMDIxIDA4OjQ5LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxNy4xMS4yMSAxMDoyOCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFdoZW4gYSB2
UENJIGlzIHJlbW92ZWQgZm9yIGEgUENJIGRldmljZSBpdCBpcyBwb3NzaWJsZSB0aGF0IHdlIGhh
dmUNCj4+Pj4+Pj4+IHNjaGVkdWxlZCBhIGRlbGF5ZWQgd29yayBmb3IgbWFwL3VubWFwIG9wZXJh
dGlvbnMgZm9yIHRoYXQgZGV2aWNlLg0KPj4+Pj4+Pj4gRm9yIGV4YW1wbGUsIHRoZSBmb2xsb3dp
bmcgc2NlbmFyaW8gY2FuIGlsbHVzdHJhdGUgdGhlIHByb2JsZW06DQo+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4gcGNpX3BoeXNkZXZfb3ANCj4+Pj4+Pj4+ICAgICAgICBwY2lfYWRkX2RldmljZQ0KPj4+Pj4+
Pj4gICAgICAgICAgICBpbml0X2JhcnMgLT4gbW9kaWZ5X2JhcnMgLT4gZGVmZXJfbWFwIC0+IHJh
aXNlX3NvZnRpcnEoU0NIRURVTEVfU09GVElSUSkNCj4+Pj4+Pj4+ICAgICAgICBpb21tdV9hZGRf
ZGV2aWNlIDwtIEZBSUxTDQo+Pj4+Pj4+PiAgICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlIC0+IHhm
cmVlKHBkZXYtPnZwY2kpDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gbGVhdmVfaHlwZXJ2aXNvcl90b19n
dWVzdA0KPj4+Pj4+Pj4gICAgICAgIHZwY2lfcHJvY2Vzc19wZW5kaW5nOiB2LT52cGNpLm1lbSAh
PSBOVUxMOyB2LT52cGNpLnBkZXYtPnZwY2kgPT0gTlVMTA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEZv
ciB0aGUgaGFyZHdhcmUgZG9tYWluIHdlIGNvbnRpbnVlIGV4ZWN1dGlvbiBhcyB0aGUgd29yc2Ug
dGhhdA0KPj4+Pj4+Pj4gY291bGQgaGFwcGVuIGlzIHRoYXQgTU1JTyBtYXBwaW5ncyBhcmUgbGVm
dCBpbiBwbGFjZSB3aGVuIHRoZQ0KPj4+Pj4+Pj4gZGV2aWNlIGhhcyBiZWVuIGRlYXNzaWduZWQN
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBGb3IgdW5wcml2aWxlZ2VkIGRvbWFpbnMgdGhhdCBnZXQgYSBm
YWlsdXJlIGluIHRoZSBtaWRkbGUgb2YgYSB2UENJDQo+Pj4+Pj4+PiB7dW59bWFwIG9wZXJhdGlv
biB3ZSBuZWVkIHRvIGRlc3Ryb3kgdGhlbSwgYXMgd2UgZG9uJ3Qga25vdyBpbiB3aGljaA0KPj4+
Pj4+Pj4gc3RhdGUgdGhlIHAybSBpcy4gVGhpcyBjYW4gb25seSBoYXBwZW4gaW4gdnBjaV9wcm9j
ZXNzX3BlbmRpbmcgZm9yDQo+Pj4+Pj4+PiBEb21VcyBhcyB0aGV5IHdvbid0IGJlIGFsbG93ZWQg
dG8gY2FsbCBwY2lfYWRkX2RldmljZS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+DQo+Pj4+Pj4+IFRoaW5raW5nIGFib3V0IGl0IHNvbWUgbW9yZSwgSSdtIG5vdCBjb252aW5j
ZWQgYW55IG9mIHRoaXMgaXMgcmVhbGx5DQo+Pj4+Pj4+IG5lZWRlZCBpbiB0aGUgcHJlc2VudGVk
IGZvcm0uDQo+Pj4+Pj4gVGhlIGludGVudGlvbiBvZiB0aGlzIHBhdGNoIHdhcyB0byBoYW5kbGUg
ZXJyb3IgY29uZGl0aW9ucyB3aGljaCBhcmUNCj4+Pj4+PiBhYm5vcm1hbCwgZS5nLiB3aGVuIGlv
bW11X2FkZF9kZXZpY2UgZmFpbHMgYW5kIHdlIGFyZSBpbiB0aGUgbWlkZGxlDQo+Pj4+Pj4gb2Yg
aW5pdGlhbGl6YXRpb24uIFNvLCBJIGFtIHRyeWluZyB0byBjYW5jZWwgYWxsIHBlbmRpbmcgd29y
ayB3aGljaCBtaWdodA0KPj4+Pj4+IGFscmVhZHkgYmUgdGhlcmUgYW5kIG5vdCB0byBjcmFzaC4N
Cj4+Pj4+IE9ubHkgRG9tMCBtYXkgYmUgYWJsZSB0byBwcmVtYXR1cmVseSBhY2Nlc3MgdGhlIGRl
dmljZSBkdXJpbmcgImFkZCIuDQo+Pj4+PiBZZXQgdW5saWtlIGZvciBEb21VLXMgd2UgZ2VuZXJh
bGx5IGV4cGVjdCBEb20wIHRvIGJlIHdlbGwtYmVoYXZlZC4NCj4+Pj4+IEhlbmNlIEknbSBub3Qg
c3VyZSBJIHNlZSB0aGUgbmVlZCBmb3IgZGVhbGluZyB3aXRoIHRoZXNlLg0KPj4+PiBQcm9iYWJs
eSBJIGRvbid0IGZvbGxvdyB5b3UgaGVyZS4gVGhlIGlzc3VlIEkgYW0gZmFjaW5nIGlzIERvbTAN
Cj4+Pj4gcmVsYXRlZCwgZS5nLiBYZW4gd2FzIG5vdCBhYmxlIHRvIGluaXRpYWxpemUgZHVyaW5n
ICJhZGQiIGFuZCB0aHVzDQo+Pj4+IHdhbnRlZCB0byBjbGVhbiB1cCB0aGUgbGVmdG92ZXJzLiBB
cyB0aGUgcmVzdWx0IHRoZSBhbHJlYWR5DQo+Pj4+IHNjaGVkdWxlZCB3b3JrIGNyYXNoZXMgYXMg
aXQgd2FzIG5vdCBuZWl0aGVyIGNhbmNlbGVkIG5vciBpbnRlcnJ1cHRlZA0KPj4+PiBpbiBzb21l
IHNhZmUgbWFubmVyLiBTbywgdGhpcyBzb3VuZHMgbGlrZSBzb21ldGhpbmcgd2UgbmVlZCB0byB0
YWtlDQo+Pj4+IGNhcmUgb2YsIHRodXMgdGhpcyBwYXRjaC4NCj4+PiBCdXQgbXkgcG9pbnQgd2Fz
IHRoZSBxdWVzdGlvbiBvZiB3aHkgdGhlcmUgd291bGQgYmUgYW55IHBlbmRpbmcgd29yaw0KPj4+
IGluIHRoZSBmaXJzdCBwbGFjZSBpbiB0aGlzIGNhc2UsIHdoZW4gd2UgZXhwZWN0IERvbTAgdG8g
YmUgd2VsbC1iZWhhdmVkLg0KPj4gSSBhbSBub3Qgc2F5aW5nIERvbTAgbWlzYmVoYXZlcyBoZXJl
LiBUaGlzIGlzIG15IHJlYWwgdXNlLWNhc2UNCj4+IChhcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Up
Og0KPj4NCj4+IHBjaV9waHlzZGV2X29wDQo+PiAgICAgICAgcGNpX2FkZF9kZXZpY2UNCj4+ICAg
ICAgICAgICAgaW5pdF9iYXJzIC0+IG1vZGlmeV9iYXJzIC0+IGRlZmVyX21hcCAtPiByYWlzZV9z
b2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpDQo+PiAgICAgICAgaW9tbXVfYWRkX2RldmljZSA8LSBG
QUlMUw0KPj4gICAgICAgIHZwY2lfcmVtb3ZlX2RldmljZSAtPiB4ZnJlZShwZGV2LT52cGNpKQ0K
Pj4NCj4+IGxlYXZlX2h5cGVydmlzb3JfdG9fZ3Vlc3QNCj4+ICAgICAgICB2cGNpX3Byb2Nlc3Nf
cGVuZGluZzogdi0+dnBjaS5tZW0gIT0gTlVMTDsgdi0+dnBjaS5wZGV2LT52cGNpID09IE5VTEwN
Cj4gRmlyc3Qgb2YgYWxsIEknbSBzb3JyeSBmb3IgaGF2aW5nIGxvc3QgdHJhY2sgb2YgdGhhdCBw
YXJ0aWN1bGFyIGNhc2UgaW4NCj4gdGhlIGNvdXJzZSBvZiB0aGUgZGlzY3Vzc2lvbi4NCk5vIHBy
b2JsZW0sIEkgc2VlIG9uIHRoZSBNTCBob3cgbXVjaCB5b3UgcmV2aWV3IGV2ZXJ5IGRheS4uLg0K
Pg0KPiBJIHdvbmRlciB0aG91Z2ggd2hldGhlciB0aGF0J3Mgc29tZXRoaW5nIHdlIHJlYWxseSBu
ZWVkIHRvIHRha2UgY2FyZSBvZi4NCj4gQXQgYm9vdCAob24geDg2KSBtb2RpZnlfYmFycygpIHdv
dWxkbid0IGNhbGwgZGVmZXJfbWFwKCkgYW55d2F5LCBidXQNCj4gdXNlIGFwcGx5X21hcCgpIGlu
c3RlYWQuIEkgd29uZGVyIHdoZXRoZXIgdGhpcyB3b3VsZG4ndCBiZSBhcHByb3ByaWF0ZQ0KPiBn
ZW5lcmFsbHkgaW4gdGhlIGNvbnRleHQgb2YgaW5pdF9iYXJzKCkgd2hlbiB1c2VkIGZvciBEb20w
IChub3Qgc3VyZQ0KPiB3aGV0aGVyIGluaXRfYmFycygpIHdvdWxkIGZpbmQgc29tZSBmb3JtIG9m
IHVzZSBmb3IgRG9tVS1zIGFzIHdlbGwpLg0KPiBUaGlzIGlzIGV2ZW4gbW9yZSBzbyBhcyBpdCB3
b3VsZCBiZXR0ZXIgYmUgdGhlIGV4Y2VwdGlvbiB0aGF0IGRldmljZXMNCj4gZGlzY292ZXJlZCBw
b3N0LWJvb3Qgc3RhcnQgb3V0IHdpdGggbWVtb3J5IGRlY29kaW5nIGVuYWJsZWQgKHdoaWNoIGlz
IGENCj4gcHJlcmVxIGZvciBtb2RpZnlfYmFycygpIHRvIGJlIGNhbGxlZCBpbiB0aGUgZmlyc3Qg
cGxhY2UpLg0KV2VsbCwgZmlyc3Qgb2YgYWxsIGluaXRfYmFycyBpcyBnb2luZyB0byBiZSB1c2Vk
IGZvciBEb21VcyBhcyB3ZWxsOg0KdGhhdCB3YXMgZGlzY3Vzc2VkIHByZXZpb3VzbHkgYW5kIGlz
IHJlZmxlY3RlZCBpbiB0aGlzIHNlcmllcy4NCg0KQnV0IHRoZSByZWFsIHVzZS1jYXNlIGZvciB0
aGUgZGVmZXJyZWQgbWFwcGluZyB3b3VsZCBiZSB0aGUgb25lDQpmcm9tIFBDSV9DT01NQU5EIHJl
Z2lzdGVyIHdyaXRlIGVtdWxhdGlvbjoNCg0Kdm9pZCB2cGNpX2NtZF93cml0ZShjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCBjbWQsIHZvaWQgKmRhdGEpDQp7DQpbc25pcF0N
CiDCoMKgwqDCoMKgwqDCoCBtb2RpZnlfYmFycyhwZGV2LCBjbWQsIGZhbHNlKTsNCg0Kd2hpY2gg
aW4gdHVybiBjYWxscyBkZWZlcl9tYXAuDQoNCkkgYmVsaWV2ZSBSb2dlciBkaWQgdGhhdCBmb3Ig
YSBnb29kIHJlYXNvbiBub3QgdG8gc3RhbGwgWGVuIHdoaWxlIGRvaW5nDQptYXAvdW5tYXAgKHdo
aWNoIG1heSB0YWtlIHF1aXRlIHNvbWUgdGltZSkgYW5kIG1vdmVkIHRoYXQgdG8NCnZwY2lfcHJv
Y2Vzc19wZW5kaW5nIGFuZCBTT0ZUSVJRIGNvbnRleHQuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91
LA0KT2xla3NhbmRy

