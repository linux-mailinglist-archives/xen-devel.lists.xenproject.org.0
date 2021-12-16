Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C59477A80
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 18:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248147.428011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuUF-00071w-V2; Thu, 16 Dec 2021 17:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248147.428011; Thu, 16 Dec 2021 17:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxuUF-0006zI-Qr; Thu, 16 Dec 2021 17:24:11 +0000
Received: by outflank-mailman (input) for mailman id 248147;
 Thu, 16 Dec 2021 17:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Da8C=RB=epam.com=prvs=2984c96734=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1mxuUE-0006U3-28
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 17:24:10 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9857ab2-5e94-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 18:24:08 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BGGcpYT003956;
 Thu, 16 Dec 2021 17:23:58 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3d03vjsec3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 17:23:58 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7981.eurprd03.prod.outlook.com (2603:10a6:102:21b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 17:23:54 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%5]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 17:23:54 +0000
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
X-Inumbo-ID: f9857ab2-5e94-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COMXH+sHUPrDxXWJol9l5ENFBPLyvGN5YlGkZxxmDygOj0pQ2bzMbCrvr9ckJAuGamchxZC9AUDy6H5d5uZZ5/0/ycJ4iE9W4DlXitIv9gY0ok6eVUzbHz20AACt3iNtArG0tXkw4ebU6klDVcskS+W+oBD8OGqFt7IXNjJuquHHuSzZ6G+rKYo2JOZ0ekSjKPBRLsW3YXIgLNKtkycV/KkzBA3aMF2v9OH7nFB66E0kjndVrb5A0qeO/zhPToKjlANs2kp+DNBfQACOubkHOxWdIyLbdzKRj6C0NgHhIO2aEeRNOnZgXjHQ3yUXHJ9p5qPTW9FlJzKW9fX549ikEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuI2KGAqDErX4MmrWfJBNYCP34DijAEa7Ex8WTqHu8w=;
 b=eYvBth8zQa8HqWIRQfjMkYEyRPIIcfe1Ih0RJHteKbnlzKJLP/u/Lh0iTmDBdynZRdNJbqLGAVDUq1nc72ZwW+vysK75HHQ1C6QfUQuvK4CI4mXWoZKTXNrC25Y10DKiFKumMhSkUhpDDDAnfs3hc11FMf3JwR+p0kXS1ox0o8IGriCM9x/0OIoJy5VOiMONjeJybQykhO5Ih+sKPTbX7qPmGJj2YZjM0Eg7tPo91PSV1I1+k2zRw+Pb5Zj+gmQ3azMj5uFc47x50eNOl02KH6Oidr9DjIJ3vltj4CFef/vJxPjMAEp3zhdbNB1Hzsmq1D6bMtM9fZZJoUj+IBGiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuI2KGAqDErX4MmrWfJBNYCP34DijAEa7Ex8WTqHu8w=;
 b=H4CYYKm2yVlyR6+20gVOimT0r3Y0bIf7OgO8IF8ByT0KLJ4wsaoJ9rH87b7yOB3o+GQuwKhY2MvLuypHMaiyik4Tn64mBTzh3D34+QMzTHgjnl1jugiDgrp/X3YtdlmUbzKg+L7K2g6+y195LoOCERApgUm0YDd4wAR279jiXRLDikynSWv1hb2vIZm6l5on0dyLHMMhoE5PhhiN/UDDb+R2TnWu/klh1ZjMH7Ci2u6Y0fNjHfnKHENTBeOSU8fTRns+qH+Btra+ctCsHFc1JBIiIikP8bLRluNUM/GfsOkkX4CecGadIGCiMFuuIVBfimgo9RAql4/ji9D+f2mBLA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Jan Beulich <JBeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/build: Fix `make cscope` rune
Thread-Topic: [PATCH] xen/build: Fix `make cscope` rune
Thread-Index: AQHX8l40WACp9tX7JUSJrSNPlqLfbaw1WHYA
Date: Thu, 16 Dec 2021 17:23:54 +0000
Message-ID: <87sfuswjiu.fsf@epam.com>
References: <20211216092014.707-1-andrew.cooper3@citrix.com>
In-Reply-To: <20211216092014.707-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fcb9251-da27-441d-2548-08d9c0b8d5f5
x-ms-traffictypediagnostic: PAXPR03MB7981:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB7981B9993DD7FE5548F34751E6779@PAXPR03MB7981.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Fc23qjaN3cE8b1Ul27PTNYugT4w0fvussOFENawSk0159lURa/eaIKsKr/TRKq2AmkX/GZDfy8q0OaJzd+0YUmYDJRUYSlEdRZcpl6oe5a0cCfEEkMhW0MtxGqgqa9vAQdDZZq7XUogc+6Ty57Yt/cBH1wK9ua/36G+ZYP9JZopJYkc8qgmmkwOtT/20vXbt1hlNIAEUMvABSaaupb0s0Xe2lzKACST8cRgsMSQZDnz5vhzKcK0ZhujfsOpnv85SBJp7kxhXsmtKD96yrdbbpEjQbtHCkWR330dX76Rmkyy6L+yMwNU0dhs8ouMrKcKFIJSL1wrzPzgNbs3q7X34+2rhMvnozfMEq3kjYoGCKMt28zkWs+Us7KFbLxGg0vVHB5u5K8Hfc/KwXqIg6mQRtDDkWKXFhq8ModLlpcV4uLzyjGvpy3NE4yC7VjQCRr3uINyTOMp1hNBc/DMP0nU65GEHuVJG6h5ADqMAmwofmT3DAX9u9EJawbPF52g5t9Hi+nTcY47vifo7Ic5yfTRM9nEC0QbbF2VQryjq5dQXB9AwwBdJT185PZdDEcUGdxchN3X0DW9nGK0nw4XEvvdm1HHMEwWKjz+/KfXEyiRKusS5gkzRlzUQ+mc/+V16AtSSSbbzZcZAlyGfzo4D/W7by3kuMUNKPkpIhC1Lc77YFvaUg9EtsITHgnaakw16FxoiSAlZle7RdlpmZeht8xt3MkR1081v5YeS7lIqSiwyvPQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(71200400001)(86362001)(508600001)(6916009)(76116006)(91956017)(66476007)(64756008)(5660300002)(36756003)(38100700002)(122000001)(6512007)(66556008)(66446008)(66946007)(4326008)(186003)(26005)(55236004)(6486002)(38070700005)(2616005)(83380400001)(54906003)(6506007)(8936002)(2906002)(316002)(81973001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWhacDF1blJkVmxycWNDekJmeWxoWFVyUzVNYlNWSE1YMWIvNXpLdHdtcERr?=
 =?utf-8?B?VXBRVmk4SE52aFJrT3RxMlJjQXpmaGJmdTRWelFaQllHYVZyZTNVcnZnMTJn?=
 =?utf-8?B?UEcrVTAzd0pta09kcU9jMnBNUFVEaWVJZUorZEdKRWp3aVVkbEExcFdlamFE?=
 =?utf-8?B?RHpDbVRTVHpJblF1eXFHdWJIOGFJWjBzUDhEeHk2Zks5MDRYbzdKLzMyV2sr?=
 =?utf-8?B?WDBGMXpOVHRQWnJyUG5vUjBwU0pRQllKUENxWmt4dEN2bVVWcjFYZ0FIbXo2?=
 =?utf-8?B?Rk1HSmgvYnNIL0FYbkNBcFpUZEpSNXpGeFNLdWc3Vmw0UnNaL1V1Mk45MUhC?=
 =?utf-8?B?V3Rvbkx6cmQvOTBiZktvcXdCRDBEbm9jdCs1YUQwR0FrUEovMmswdENwZ2xQ?=
 =?utf-8?B?S1M2K1dsTmNtMnp1OEpYa21BczlNUCtqZlUwbW5sYTFZRlVzbW44S0oxZlAz?=
 =?utf-8?B?UG12Q0FjRkZONHM4S0VaQ1gvSWRKK3Iwb3pnL0dnWmZ4aFRVa2QwS1pYSGE5?=
 =?utf-8?B?ZnB2eDBZVlowayt3OXM5K2JDU3NJcUpFelpkT1ZEd3pIUGIxa3dtWitIb1d1?=
 =?utf-8?B?SUtSOUFTL3J1Q2JsRkZQRUhlRVlWVFllTTc2NGRpM0pCODUwSnZFVFdCWUNT?=
 =?utf-8?B?d2JJRk85OGJZNlV1YVNLejBIN3R5a2pMUnc5a1diQWFzbTVibXdpMTd2WkhH?=
 =?utf-8?B?Y0oyUVRoOXBHT01FeWM0MnZVT2RxM0xKcjd0WDBtMkN2NU1XSzA1NFo3Tis3?=
 =?utf-8?B?MmpKaCszeDNOSGUxdXBKWXZpRm42Um1FOHZJdnFaN21HUUs5Y3VwMW1wbEF2?=
 =?utf-8?B?MmFvV1FaeTdvL0sxOVY2SmdGc2NlaGpycDMwUjJzb3lQdTVzU2c2RGdlY1pN?=
 =?utf-8?B?UHFiOUxZY3NKTGFjcEZQRk0wb1NUYVdiTWdNL1FnQlhJQ0VFWGdQdnRIbEMz?=
 =?utf-8?B?T2RaeG9YK1lYaXRIRXVVU0kwMEFjdk5mdXQ4RUtFa3lvWXBSWXRQalJkRGRT?=
 =?utf-8?B?TXJkQU5Rd0YzQnBIZ3BaNnRtUXJTSG44M3h1MkdxaXZjUTllQUJ5OTllbmhw?=
 =?utf-8?B?RG9kbjFZSE83blNNdkJPSTJxODBmWXZQVHhPUWh6YUhnRUJXbGlCclJtbUU2?=
 =?utf-8?B?NDZJOFp4UnUzeWk0Ynh4cW5CVHJIRkl4SEx2b1lJNDVycGNBSkxtejEybThv?=
 =?utf-8?B?QW1YRG9sSWZTRTI4TVJZSm0vdEdqdVh3cWdhY0l2V2VyOURJRHRyTTBJbENv?=
 =?utf-8?B?MGZScWpXbER4bTgzNXNRL2dBc1N1MjhiUU5DdjdhOU5ueU9qTmdWN2VVMVBN?=
 =?utf-8?B?blN5V0svWGtiT1NwRG82N2g5Z3l5d0NCRFBCWVZCN0c0NUVVSGtsa3V6YndG?=
 =?utf-8?B?YzEvS0Z2MjJ1U2ZoVHZQTHl4Z2oxMXhWWXovUmtmZTNzanZ5S3VhMjVyMFpT?=
 =?utf-8?B?UTFUaklBN3B2WjNkZ0xjL3hseXNjam53NHFHNFlZTVU4eWZIN1VDU1RKS25F?=
 =?utf-8?B?R3BlQXZwTmdkbGtWdWJQNmx5L01HV1hiTmtOWnNjbWVoNWxRUHVDWmZEdHZH?=
 =?utf-8?B?SUJIVnNlVW1HbFZIVlNDS1dVaWlpMXgvOER2Rkhsa2FHaFRxdjZxRm1QRFBa?=
 =?utf-8?B?RHgrTlhibXkrV2hLU3Ntd1doUzU4YmVFVnpsT1MrM3dsVEhqVmpMR0E2Z3JB?=
 =?utf-8?B?NVpxZ0dwby9iUE9zWUVsUkFCQ1ZOTGRFQzA0RTRld3J3SmVEK2U5U1ZDZ2hQ?=
 =?utf-8?B?aEtsazUvMzkxbDJkTjhOMWVCOTl3RSsyUjFnd0dVWlRFbldRV2lrVEhqeEF1?=
 =?utf-8?B?bXY0MGpHc1JIV004U3h6bUVkSW1RdU0wWS9IOU8wRndnTzlRays5TDhOaUYv?=
 =?utf-8?B?T3gxQVdENjV6RWI2eSt2R2Q5bkI3M2diMlNsK2dUMGR1T2dWNlFjb1J0RzFa?=
 =?utf-8?B?cmUwNGQ1T0tJYS9RbW1XbHNMQ2dMZENPQ1JqeGc1Sm1QYjBYMWozUEM0RzZL?=
 =?utf-8?B?RlNMVlpkbTZJdU4xSlFCejVBRmlNREZscU5NNzJjYWhaOFhUK0k0ei83VXpE?=
 =?utf-8?B?cjgrNHljN3VzQ1FnSW1peFM5R3BmOFNXcDFMMjdSUUR3c0tUMlNNRHI5Z2hS?=
 =?utf-8?B?VHd1YnJRSEV0anU5RHRWTFJDM0RhQmVTaDlCdDkxWUlpZnFYRmVWa1Z1R1Rv?=
 =?utf-8?B?b3lycXNVSHdWSHFkR3Q4c0h6emptcVo2MUVDTzF2eEt1UkR3cFN4K2FRTkJB?=
 =?utf-8?Q?s1WbGX6rwDOzlAt9qrnX4HVJKuO/bdRQP8JrCrw6aQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58D90F746CE9E54784953571D4E98188@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcb9251-da27-441d-2548-08d9c0b8d5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 17:23:54.4983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8CiJu6tg7WWz4BFu6tP2y+p3TLJvNGFBNcWDcMtHTm0Hsaj8ypDPJ6LXon8xoB3hLe1RrqybYvEF4b3O2Lde5NGO9BnyLdfbt+2QuOW1WR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7981
X-Proofpoint-GUID: 8RHjfh51FKJC0Uzfl0UCXvCJKAjxks-Z
X-Proofpoint-ORIG-GUID: 8RHjfh51FKJC0Uzfl0UCXvCJKAjxks-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160097

DQpIaSBBbmRyZXcsDQoNCkFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyaXRlczoNCg0KPiBUaGVyZSBhcmUgdHdvIHByb2JsZW1zLCBib3RoIGluIHRoZSBhbGxfc291
cmNlcyBkZWZpbml0aW9uLg0KDQpBcyBhIGNzY29wZSB1c2VyIEkgd2FudCB0byB0aGFuayB5b3Ug
Zm9yIHRoZSBmaXguDQoNCj4NCj4gRmlyc3QsIGV2ZXJ5dGhpbmcgaW4gYXJjaC8qL2luY2x1ZGUg
Z2V0cyBkb3VibGUgaGl0cyB3aXRoIGNzY29wZSBxdWVyaWVzLA0KPiBiZWNhdXNlIHRoZXkgZW5k
IHVwIGdldHRpbmcgbGlzdGVkIHR3aWNlIGluIGNzY29wZS5maWxlcy4NCj4NCj4gRHJvcCB0aGUg
Zmlyc3QgYGZpbmRgIHJ1bmUgb2YgdGhlIHRocmVlLCBiZWNhdXNlIGl0J3MgcmVkdW5kYW50IHdp
dGggdGhlIHRoaXJkDQo+IHJ1bmUgZm9sbG93aW5nIGMvcyA3MjUzODFhNWVhYjMgKCJ4ZW46IG1v
dmUgaW5jbHVkZS9hc20tKiB0bw0KPiBhcmNoLyovaW5jbHVkZS9hc20iKS4NCj4NCj4gU2Vjb25k
LCBhbmQgdGhpcyB3YXkgZm9yIGEgbG9uZyB0aW1lOg0KPg0KPiAgICQgbWFrZSBjc2NvcGUNCj4g
ICAoIGZpbmQgYXJjaC94ODYvaW5jbHVkZSAtbmFtZSAnKi5oJyAtcHJpbnQ7IGZpbmQgaW5jbHVk
ZSAtbmFtZSAnKi5oJyAtcHJpbnQ7DQo+ICAgZmluZCB4c20gYXJjaC94ODYgY29tbW9uIGRyaXZl
cnMgbGliIHRlc3QgLW5hbWUgJyouW2NoU10nIC1wcmludCApID4NCj4gICBjc2NvcGUuZmlsZXMN
Cj4gICBjc2NvcGUgLWsgLWIgLXENCj4gICBjc2NvcGU6IGNhbm5vdCBmaW5kIGZpbGUgYXJjaC94
ODYvZWZpL2VmaS5oDQo+ICAgY3Njb3BlOiBjYW5ub3QgZmluZCBmaWxlIGFyY2gveDg2L2VmaS9l
Ym1hbGxvYy5jDQo+ICAgY3Njb3BlOiBjYW5ub3QgZmluZCBmaWxlIGFyY2gveDg2L2VmaS9jb21w
YXQuYw0KPiAgIGNzY29wZTogY2Fubm90IGZpbmQgZmlsZSBhcmNoL3g4Ni9lZmkvcGUuYw0KPiAg
IGNzY29wZTogY2Fubm90IGZpbmQgZmlsZSBhcmNoL3g4Ni9lZmkvYm9vdC5jDQo+ICAgY3Njb3Bl
OiBjYW5ub3QgZmluZCBmaWxlIGFyY2gveDg2L2VmaS9ydW50aW1lLmMNCj4NCj4gVGhpcyBpcyBj
YXVzZWQgYnkgdGhlc2UgYmVpbmcgc3ltbGlua3MgdG8gY29tbW9uL2VmaS4gIFJlc3RyaWN0IGFs
bCBmaW5kIHJ1bmVzDQo+IHRvIGAtdHlwZSBmYCB0byBza2lwIHN5bWxpbmtzLCBiZWNhdXNlIGNv
bW1vbi9lZmkvKi5jIGFyZSBhbHJlYWR5IGxpc3RlZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFZv
bG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCg0KPiAtLS0NCj4g
Q0M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPiBDQzogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBDQzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDQzogSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT4NCj4gQ0M6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1
aXNAYXJtLmNvbT4NCj4NCj4gQW50aG9ueTogSSBsb29rZWQgdGhyb3VnaCB0aGUgcmVtYWluZGVy
IG9mIHlvdXIgYnVpbGQgc2VyaWVzIGFuZCBJIGNhbnQgc3BvdA0KPiBhbnkgZWRpdHMgdG8gYWxs
X3NvdXJjZXMuICBBcG9sb2dpZXMgaWYgSSBtaXNzZWQgaXQuDQo+IC0tLQ0KPiAgeGVuL01ha2Vm
aWxlIHwgNSArKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtlZmlsZQ0K
PiBpbmRleCAyYWQ3ZGE3YWQ2N2IuLmRjNmJkYzQ0YzdhMiAxMDA2NDQNCj4gLS0tIGEveGVuL01h
a2VmaWxlDQo+ICsrKyBiL3hlbi9NYWtlZmlsZQ0KPiBAQCAtNDY4LDkgKzQ2OCw4IEBAIGFyY2gv
JChUQVJHRVRfQVJDSCkvaW5jbHVkZS9hc20vYXNtLW9mZnNldHMuaDogYXNtLW9mZnNldHMucw0K
PiAgDQo+ICBTVUJESVJTID0geHNtIGFyY2gvJChUQVJHRVRfQVJDSCkgY29tbW9uIGRyaXZlcnMg
bGliIHRlc3QNCj4gIGRlZmluZSBhbGxfc291cmNlcw0KPiAtICAgICggZmluZCBhcmNoLyQoVEFS
R0VUX0FSQ0gpL2luY2x1ZGUgLW5hbWUgJyouaCcgLXByaW50OyBcDQo+IC0gICAgICBmaW5kIGlu
Y2x1ZGUgLW5hbWUgJyouaCcgLXByaW50OyBcDQo+IC0gICAgICBmaW5kICQoU1VCRElSUykgLW5h
bWUgJyouW2NoU10nIC1wcmludCApDQo+ICsgICAgKCBmaW5kIGluY2x1ZGUgLXR5cGUgZiAtbmFt
ZSAnKi5oJyAtcHJpbnQ7IFwNCj4gKyAgICAgIGZpbmQgJChTVUJESVJTKSAtdHlwZSBmIC1uYW1l
ICcqLltjaFNdJyAtcHJpbnQgKQ0KDQpJbiBteSB0b29saW5nIEknbSB1c2luZyAtcHJpbnRmICJc
IiVwXCJcbiIgYmVjYXVzZSBnZW5lcmFsbHkgdGhlcmUgbWlnaHQNCmJlIGZpbGVzIHdpdGggZnVu
bnkgbmFtZXMuDQoNCj4gIGVuZGVmDQo+ICANCj4gIGRlZmluZSBzZXRfZXh1YmVyYW50X2ZsYWdz
DQoNCg0KLS0gDQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFN

