Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8424A49CD55
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 16:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260971.451348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjvp-0007Lz-Tr; Wed, 26 Jan 2022 15:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260971.451348; Wed, 26 Jan 2022 15:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjvp-0007JN-Qo; Wed, 26 Jan 2022 15:09:57 +0000
Received: by outflank-mailman (input) for mailman id 260971;
 Wed, 26 Jan 2022 15:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zGnN=SK=epam.com=prvs=3025e8b925=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1nCjvo-0007JH-5j
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 15:09:56 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0370092e-7eba-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 16:09:54 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20QF9G5u015508;
 Wed, 26 Jan 2022 15:09:36 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3du8pjr011-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 15:09:36 +0000
Received: from PAXPR03MB8114.eurprd03.prod.outlook.com (2603:10a6:102:227::15)
 by AM6PR03MB4438.eurprd03.prod.outlook.com (2603:10a6:20b:12::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 15:09:31 +0000
Received: from PAXPR03MB8114.eurprd03.prod.outlook.com
 ([fe80::9d1a:2b77:5b10:1ea9]) by PAXPR03MB8114.eurprd03.prod.outlook.com
 ([fe80::9d1a:2b77:5b10:1ea9%3]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 15:09:30 +0000
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
X-Inumbo-ID: 0370092e-7eba-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8ksCc0BIoqKhFpjL/rc9etmE/SxzLIFxxu9BaLIC+rOTgMgO1FFsL5qcxw8TaLStJb7Iky1Nky6MkzEalaPOpSPb51AdfcItW0wc/tBKbmHfmHHJUs4T4kT2TDAVzBeJmwvl+rYftRTcGFm/inBxHRdM30+ovPNiNALtL/VGJRKpboQq+nVpWDWNjEVoVwWFS+vAmHyip9tg0sEvLXDp9BVLoyeaFK1d7S5G1n1iNMTKgCgwgh8yK5+5KDz5UqL2tlOjitnIYov520upaZ6JSv9TZ5XArudlm4K2xYCYFwJ2+gJ+f6iixGsO+FQEr6Lyp9PSoBD7rIaWru0+MWabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77IEcXF3A9+J0WHK2lhV0lwGNwme5kNZAF7ZbFJ31D4=;
 b=F1AMcnpOdfR24jeB7TDP+pqt8PEeo1B5kGycqg/4uQMMJxBmbut5qHlxIxC6OW27MmRqSFJNFilK//IQ+2Fdb0N0VQCZ2yqT23596N0bWe8ylLR7AKxxd4stRdJjxxal1N7yhQV6xMSo9ZMWJOQujewqgAnNkIWyK+pm89gz8tUx5ZNiqZe/E8CAQ8S1nKljyUvg9G6/GN0f3WIIqlitsumrVGWEbUR4tA6IsEsFJ7p6F33xlHoB7vrZajyIzy8YLpcVIqmmbtyzj9xgMnp0iOH/QdoYJQuUEkrygLw8ALNzIITW/Y3bCY5+zZcPdVyam1czIgu8sjA3PvxYhlzHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77IEcXF3A9+J0WHK2lhV0lwGNwme5kNZAF7ZbFJ31D4=;
 b=WyZeGf37yKLqKTqRxOvg1n6Yk8Al9m9X0LkINQPWGodn2+YH92TwEMNAszIZYb2kUpRvZ/N9RaiK+8a8znS1GsXKzL+ly8qq+Ekb82tr5vS9whGp3+rcgiTp6R8qzqRq3DRiioCIMrUEYKpt3NeeHqemFGshzA2OOXu2Uq/v+BK9n4F15xAuMWQUz5xvsbWPqDk14YSiiJY5oLYELBOt/M41unJABlSxVM2u0vXHn2ONyR1zdzP191TP624upHGWaWYdMtLiKQwGnVGQ1rWWZX3rKfNgeh6Oe2+IDVbgkdWlCfzgPhn2fATreS6VIv0Nl0AEixAxx5MaGieVxj3HzQ==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu device
Thread-Topic: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu device
Thread-Index: AQHYC7c/yzNIx4SEEE+Ytgaw3RrSZKx1dG0A
Date: Wed, 26 Jan 2022 15:09:30 +0000
Message-ID: 
 <PAXPR03MB81144A63E18CAF10E785E2A7F0209@PAXPR03MB8114.eurprd03.prod.outlook.com>
References: <20220117123251.140867-1-Sergiy_Kibrik@epam.com>
 <20220117123251.140867-2-Sergiy_Kibrik@epam.com>
 <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com>
In-Reply-To: <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67c6b206-ebd3-4190-81e9-08d9e0ddda85
x-ms-traffictypediagnostic: AM6PR03MB4438:EE_
x-microsoft-antispam-prvs: 
 <AM6PR03MB44382081B1648CAAA0B69739F0209@AM6PR03MB4438.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 syNzauhOMuOmeex4d3sTD44gaVmoMD7zFMGOkdpiHLZuBcm6FmBpD11e20zzWOY4CMmqqvqN1k9cCbOPiYom58IG3Z/ZwUKzDQYWXKO5SfJCiCQ0ygmPfbn9xStuHG9Nga7Vhi48/xy7/LYRcOZUl7LXXgc5/y5WONAOrzdwg3kNE2u1IcxooYxUa2VBvfGDmAuV8kzGeVjH/SjAlHXspn/JGtAVqpsmHH9bw35CG4oi9m3C2lXscvA+TRyfB2GRZe04rR5b5qWWYYBvyQ79RzLtdDdm54AOYw5Le1ie+/8/MhimTfV6lJV8DHmKSdgWtvYRusCP1iSE/+Vb8ObjKWUivTsp6ZME+N2/VKemoEOSAdmceC9nG6mPKTIv7rVRvRnRte8J1O45sgoAwvGIywzisxtNMB8607Gq1gI5q9Sp0p8MqJI9xzXU0JQBUVLNSXpqBzdBT9AxCNCR3MjxRZAwFxpudPWUGFdYMtQAU/OfITKeVU7ycH8kL8c66KqEkjAvo4k/wVARGHA78CMMOH9FZ4OWCmLW1ADL3hY5ZnrEZcmmd9CdDEayZq08Kg8hV5IEPAEv4LKXeMqFILRRwMTm55Mlv2qX+SIl4u37SZWyMcp7B38Fg4ZKtolgrA43zqpaMUe5LkvHshp8ZKtdamOGk+WxlrlWM86rEPrvoGwjlpaTlxuRaKyFZ3yLXVmL5xNJlfGxUWOeMdaY0cdSjQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB8114.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(38100700002)(66556008)(64756008)(8936002)(66476007)(76116006)(8676002)(33656002)(5660300002)(55016003)(66946007)(66446008)(2906002)(4744005)(4326008)(52536014)(6916009)(9686003)(6506007)(86362001)(508600001)(38070700005)(316002)(71200400001)(54906003)(7696005)(122000001)(83380400001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NWw2VTVUOW5ITEdPWHpRWnUzTlc2a1dIbENOZlMxYVNSS2duMEhiTmhobGJj?=
 =?utf-8?B?MnFpVnlCdCtFZmdsNTlOMVhGTTg3aEw5bFNhbkU0dDJmMzNRamswRE1iQXFQ?=
 =?utf-8?B?VGFWLy9jWSttV0RZN200bFYrb1NCa3lSb1RtZEEvSW83Vk1yWnN1cnFxWmI5?=
 =?utf-8?B?NzFRNjRmamVqQW02WEJNVzFER3RlbndBbWxqekVBRUVvZWxCVGJrRktZZHdB?=
 =?utf-8?B?OS9qL2xLRzNLN0ZvSFlLMm15ZVZuaW9EVkcreVlpR2tQcFk2S05lV1BPdlZG?=
 =?utf-8?B?Q0F4VDRjdzlVR1crN2VwRjhsaUZyQUpEQThtTkRvTnpwQmU3eno2SnVOVHhw?=
 =?utf-8?B?dHlVTTR0Z0hGand5cm4vUVVlSGZmQm5Hd2lvWFRGMWovTzNkcEZTcUdTdysr?=
 =?utf-8?B?YUNPN252MFFkb1hidWJMcmpBQ1NvNTE1U2JqaG1KdDZISmFHM0h5VmhTNjV5?=
 =?utf-8?B?RDZxdStvUWlWU3NrYlI2M1lJenpQNWNTZk5GdS85c0t4M0VMM0xnZTNMT1R3?=
 =?utf-8?B?Q1pPb08wa0xUS25OQzR1UjlRTjlPUmM1YllIVTd5OXZBWHV0ME1aTnFTYW9I?=
 =?utf-8?B?R2tMSUVDZThkM0lrZ0lUcklkUnEvWkl4NzhYaGtON3c0VWs1cTQ1SmdGRlU3?=
 =?utf-8?B?Z3NpSjFsUkN6eDBWS0NkWnBhYUYvZ1dNanU4UmtlMEZOTWtsY3g4Q3JVTXVj?=
 =?utf-8?B?czFFckdHNnpOQS9abEErcnRyZWtmZjhUR2VFR3pMUFFXVUcwRVc3NDRtWE5h?=
 =?utf-8?B?YzJ4Q2ZScUM4VlVwblUzb0xRZzhoVzR3SGc2SHFZazFjSXFjSlFwSHk4ckdW?=
 =?utf-8?B?bzVFWWRtdWFacTF4WGdPbWp0N2NPaytGSFBvQXpsbFk2QnJoZW0wdnl3ZThv?=
 =?utf-8?B?TlBUTVVaQmR0ZXliZkZwSTUwRG5JUEZRaHJLZkxyMnNZQTk1cFFnTFpFbzMz?=
 =?utf-8?B?YTlTaC9RNkVlTmRIcjRYVHZPTU5yWGN3QzR1ZG8yOUQzdWNpWmFTVDErMUFp?=
 =?utf-8?B?My9YWGtUMyt6MTNDUGNROVlLcldUNGltVm13RmRwb2hpa0Z6NnlzUXBVYmRF?=
 =?utf-8?B?dHpKN3dyQWdMQzZaTkxaVUFyL0EvbjgwSE9vQjZKbVRoZjFqTWtIb0JSNkJy?=
 =?utf-8?B?aGQ5VEF1dE9wMTh4VlFFSHA1T1NCbEREaWQzb2FvQnhtZGtVc2tiWVJmN1Fa?=
 =?utf-8?B?dmQvQ0VuVkZNcVEzYjIyTU54bC8veTFjdUE5Ym1iY0J2b3ZiaHBSeUNiaDd2?=
 =?utf-8?B?cU1weFczUThFNlJucUZJaGlObWZtYmdZZHozZFFLclJSRUZwcHEvUGMzUlJS?=
 =?utf-8?B?V0VaZVFlU2ZQaWhXU3RaeEpUMElmd0l6SlJZanNkL3FZYXNxckJJeTBxT1Fw?=
 =?utf-8?B?QlA1ekFNbXJWZmFXZHNOdzFCUDl4NFJadUVNN1ZHVVNzamxINWJIQVgyaiti?=
 =?utf-8?B?UGY4NmJ3VVljQytrbUg1cG4wa0JGK01aay83V2FDU3gxenE2RkdJZ1k0bnAv?=
 =?utf-8?B?eDBJUk9KL24wZmpXdHNQdUdUNFJUWWlYbVlMOGhBa1lGZDJYYU9aeWdVVHVC?=
 =?utf-8?B?QlJwWXdsWDBaeWh1TUlraVRiVWZ6WGpWOHhBWEc3b3Yvdm9RcUtvRVh0UkZu?=
 =?utf-8?B?WXhncGxwUCt4d0pmdDJiTURIcmt2Q1I4RjN1ME1OeFN4UnNOZmdRa1hRbjB5?=
 =?utf-8?B?WjFteGVBZUJHZ2tJeVNXUHdQd2dOOHZlU2NjZlBhTWQxUTZJNkpWdFg3QnNJ?=
 =?utf-8?B?dUUxSUZpRWtudk9LRG9CYjYxWE9BVUU3ZDhwV0gwOTJ2VkEvL1pLckI4VVhL?=
 =?utf-8?B?NTFFV3ZheGtMZWdUanB6SWFkdzBWTHd6SG9TSUVnSHc2UW5JaC9oMWJ5T0Nt?=
 =?utf-8?B?SmI4dUlPRUgzZjRUMEhtanNIYm0wdXIzRDI4TCtYTnpqNmRpL3JwSmVUbzFJ?=
 =?utf-8?B?dzVjeFZTU3VjclhZbDZScGFud1VoWGZKYkN1YTBmSGNWTlRiTTFNcVJsd2U1?=
 =?utf-8?B?WGQwcWFLUHFWcXE5b214Y04vZitOaElkaTAwZjBaRzRYK0pqRXR4ektFMUJq?=
 =?utf-8?B?aXRwSFJmYkRHYXpOYVBEWW1SeGtZb2NlUm9jUG9HQTd3ODlkOXNYK0VMZUVR?=
 =?utf-8?B?OHdxaVJxM1BDV01oMFlLT3N3MWZEQnhKR1QydEdJZW5KQWJ5UytoOERPbFNY?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB8114.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c6b206-ebd3-4190-81e9-08d9e0ddda85
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 15:09:30.6962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TG72l+tfnwVuQx6wSZ9Ur+V37wbOheFxDP0TVwS9bTHPp58nB9n48e7vy/QhICHGZffh1kKH+qwTuUjm+Rjxpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4438
X-Proofpoint-GUID: jVEbKZ7nFA0SYaYNxvNKxKDpIwHngTo6
X-Proofpoint-ORIG-GUID: jVEbKZ7nFA0SYaYNxvNKxKDpIwHngTo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_05,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=715
 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260093

SGkgUm9iaW4sDQoNCj4gDQo+IFRoaXMgY291bGQgYnJlYWsgTGludXggZ3Vlc3RzLCBzaW5jZSBk
ZXBlbmRpbmcgb24gdGhlIGRlZmVycmVkIHByb2JlDQo+IHRpbWVvdXQgc2V0dGluZyBpdCBjb3Vs
ZCBsZWFkIHRvIGRyaXZlcnMgbmV2ZXIgcHJvYmluZyBiZWNhdXNlIHRoZSAiSU9NTVUiDQo+IG5l
dmVyIGJlY29tZXMgYXZhaWxhYmxlLg0KPiANCg0KSSd2ZSBub3RpY2VkIG5vIGRlZmVycmVkIHBy
b2JlIHRpbWVvdXRzIHdoZW4gYm9vdGluZyB3aXRoIHRoaXMgcGF0Y2guIENvdWxkIHlvdSBwbGVh
c2UgZXhwbGFpbiBtb3JlIG9uIGhvdyB0aGlzIHdvdWxkIGJyZWFrIGd1ZXN0cz8NClRoYW5rIHlv
dSENCg0KIC0tIFNlcmdpeQ0K

