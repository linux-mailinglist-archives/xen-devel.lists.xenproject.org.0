Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F072DF9A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548003.855758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KS-00036U-Kv; Tue, 13 Jun 2023 10:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548003.855758; Tue, 13 Jun 2023 10:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KS-00033Z-FM; Tue, 13 Jun 2023 10:32:48 +0000
Received: by outflank-mailman (input) for mailman id 548003;
 Tue, 13 Jun 2023 10:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KQ-0001im-VQ
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a28aba95-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:32:46 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35DAO5KX019280;
 Tue, 13 Jun 2023 10:32:33 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r5yahmgn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9706.eurprd03.prod.outlook.com (2603:10a6:10:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 10:32:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:26 +0000
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
X-Inumbo-ID: a28aba95-09d5-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFo7Sa8zm/Ht66kAc4Xn6T+u7b5NHw8DTsD5ymKb6G+HVLVtu4JExg5+KdMKUBf7D2ljXxXhgGCKFizly18kJhngo6BaDC1uap98ChsL+qxiRWC3eb2jivFSm8mIt2YWQYnTK+VVcJC5x+ADUyceHjInyP575OFpZvfgwIpzedtwT7G8KNqc5kxkAXnCph+dw1//fxF4dNKfeqCc5uBl+DcC7pe7323385bJOmTXoqcX0bQOFAN8oCG+umRm61IHrJdMf9K7Bib99gt3QQ9i6nuYo82M/AjCMlgnA2bQ7Hl/lxyhpiIcjSWV6HIKIegku4Mrpo9M9ha6YkQRh8QTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiG9vC34t2GxGzLSOhrsfH8tHrKU/OCY0N5867nXnSg=;
 b=HCCBdJhKYOJqyFbwX2RWIh7o0fpA71UDiPRzRsn1glyyB7SDXdrAcSRh+JEJncUxqbaYj5B1kZyV8i+3DPUwmIEjbKG32JryYYVzswoPQcKrtaVBI1Xv2pl9G2Rt8xF6LXxRo3CtbYK/zeSFLxQw5auuXrqKioRhifRUs9jdiYYKMmNH4dx6KDj/m9TUl0oFzYTkVI6ctjNN34GLbkBLZi6JVLciWG5SvY30l2gBheu4sjFD3dgRAmjFQdDC0IJDrK/WkQNwBil0u+jakkEgvYXM5OOM21+w6R2QAFCD0MtOGePNWsc2iGy8tLZ1INkojGyuXuvJ8s499xSvcY7SxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiG9vC34t2GxGzLSOhrsfH8tHrKU/OCY0N5867nXnSg=;
 b=IFd1PlgBsoXmoEV42RPSiAU1y4yNxUqezFPT38eOtvKvBciQMPCsHdixAFiPrfwhkV0f3gQ+RAyiqAw6UTIPEgicLcUEq0sr7B8UBE9BVMjz6AjhZgM6hZMMLENrfeOcAvC1/bRf7whbI1JqfZO6Y03beWnkn1lxHxhVvICH0IDM2Qrz39zXFqKGgwUMPEY2ozbVy36QnZ0WvpCjQlNiBgL+81TDi+98aoc/HjLgL890O8i9D97ytoxkX4xX/hJWsUPFhHpHZZiDyyHPlTEiIaBxXZITrRofD77D5XRbbbnmFWtDQIdh7wkh2UAWoJ+QYDe423OtJjBT+DTV6jlPxA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Thread-Index: AQHZneJYJeyWMREaaUSf/027X0QuCg==
Date: Tue, 13 Jun 2023 10:32:26 +0000
Message-ID: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9706:EE_
x-ms-office365-filtering-correlation-id: e2bbb522-f54b-4288-4094-08db6bf97b88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UCm3OR2Xghn68zR6JAyIMurkunurXr/HhEbm1vydwtTur3pISlrvTKhw8PaxGt0ao1Dm8LVnpYx9Vg488AyBHhkB5pitDbjjIwBlrTWbdYbD7WLZVKUa26r4vXRg3z8EaPscB3CVB+5E2wOc0GY8fdBCa4dyVbJGANUw1lLkEaIkbuf9AUrgjD2C2XXBsGw9nH1R21sfuCKBK+T1Z8SONKtavoqT87VB6MvPtCpmszBI8wULy7LdpVeK/j+4ZMP5KHKZEeIbtCCQhjJ0ZzpHATdhA727ICXDrzsnFDA+rbUQoX3eI4ipKi4VkY05CiuXFPMR3/WEXNb6GYuYKqt4SeJJeTjqtPbba0RXJcnhM09PFMYpuM79UXc4n3CGE/BxsvxoxSuRCmRvznd9F4LBVVu8T1QzCgXPIpE+/e1yDWQ7PYnqf+REbxaW4r9dH8mmPwXAyge4fKECMs6O2k5fqpGcHTWJMvcYYpkSFbighrRYPjpeFNa9R0jxUmn26EMVYte+oT+lCMZP+QuOckeuSbTUEzG6b0JZsrtXlxMxj9HK/HMMSZJQiE3qUfYpDotqYSbqJWoMo5AvBj/E6jvE3ITjImtOPdt+lrqfbxx3d/U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(966005)(91956017)(64756008)(76116006)(66556008)(66446008)(7416002)(4326008)(6916009)(66476007)(71200400001)(5660300002)(66946007)(41300700001)(8936002)(8676002)(316002)(36756003)(54906003)(83380400001)(478600001)(2906002)(6486002)(38100700002)(186003)(6506007)(107886003)(26005)(1076003)(6512007)(86362001)(55236004)(38070700005)(2616005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d05ONEtJeWorcXI0d0dQQVZyam00dEdXM3VzcTZ2MDAzNjgyaTVzWUNFOW50?=
 =?utf-8?B?eXFtb2hOUXc0VWtuNGNCeDgzaW15Zmt1YWh6MWJ0SDU2cG42U245QUtmc3ZD?=
 =?utf-8?B?SHFDNE1wV3lqaUkwSDZHNkZZcWU0eWNEYU1PNCtMM2o1c2JoSTBsQTJ0KytG?=
 =?utf-8?B?MWlHNDRGWHhiWkMrQkxFc1dHQ1h4ZVhVN0trb0RxbUZreXNvWXNoTFRzdXRR?=
 =?utf-8?B?cnc3Q3UvRUE2Q3MxUVoyUDFVaGRpekwzZ0h0WkxST1F1Qk4vZ2VGMEVBaEti?=
 =?utf-8?B?Y0FOcHJveU9HWmE3bDFMcGwzSU5sNUo2V21NUnZQSE5rS0RwUDRGNEtieU1I?=
 =?utf-8?B?VW9COGozZnV4d0wvYjJMRXdMNkZwQnRGcGFPR0pLOXE5cG9pRWR4c1ZoRE4x?=
 =?utf-8?B?Qy9yUE14RjR0M2R0K1ZQVnBRTEplWE1GQ1pNNkNxamZMRlpEYzBZS01jcDNy?=
 =?utf-8?B?R0ZJNFhML21DMjdOQmVWWE9Cbzhuc2xRZ0FkQ3VvUGMyeW9DeXg3MVhkQ1RI?=
 =?utf-8?B?Mks5NndkL0hOY05GWi9jZmNIYXdhVmQvVTBoWEh6NmV0WURNYXRheHNINldD?=
 =?utf-8?B?bnhiRGpkTDRwMzFXWDFhbW9laUw0MElEVVJ5V3NTb3JRSlkwd2VGY0Q0cXla?=
 =?utf-8?B?b216d2lPYWtHQnBxOEkzNUNFTnp4NzIzTTArWnVySEE2RGVmalJRZ1A2dmJ0?=
 =?utf-8?B?R3k4MWVJWTlrUE5CYk9oU215K2pucENiSjJaMytQYUlHN2dYTTZEOVlnL0Uz?=
 =?utf-8?B?ZzF0dmJkTWdJV3c3bU9vbUpjNG13WHVXZkZwR0ltc1RZWnV3VGxCZGFwaVFD?=
 =?utf-8?B?eHBXWGRlYlpOMkZLVGE4NEZ5c1JrbGpibWJPMW1OV3FKMUs5UzhicStVK0l0?=
 =?utf-8?B?WXVPR1Q4NllvYUpuL0NjeFRBL1RIMWhtaEw4bW9wRTJ4RnlaUlZPb3pPKzU1?=
 =?utf-8?B?dTd6M2JobFhGTFFhNUM3QjY2WDE4aFpoZkpTRmkybUZxWnZNMWxvdGpvMFVN?=
 =?utf-8?B?QnQ2cFNaM0NSc2wrN2dlVzUxaEpmdDd1U3ZSUC9SdUR6OGlNdGZPNER3N2Nr?=
 =?utf-8?B?NU5jUDJGMTZ0UEpXL1JlQndvaUZuUy9tRWxxeE5QcFZjbk1QdFJQeVV3b1Zo?=
 =?utf-8?B?cHZ4MVZXNnNQZWE0RjJRMlBIeStaek5CemN5U3RXWG0rTzRZanVXUzJVT0lq?=
 =?utf-8?B?SXdYT3JLbDVFem1XbGkwcWtEN1NoMHprRHdSMnBwWFNjdlBwYlBGeE1PZmNX?=
 =?utf-8?B?WkdyamFTa1B6cXNpNWtaZG1ybVdYVmZJdVJkZ2tYUC9ZUHRyQk1jdU9jNmsz?=
 =?utf-8?B?TUFnUVJGbXltN3ppazluQnpZN3cydVIvR3p2ZUQ3dmlEekV0Z1lrQ0FnMHgy?=
 =?utf-8?B?L1VkUitjTHR6ejcvbTFPM3lZM2VoaFJNNW1PblZ6Vmxnc2lmK0g4azhESHc3?=
 =?utf-8?B?WHRHdVB1eEFBM2VPZTRFMnpZNE93cFdiUU83ajUvVUluZkRzdFJac3diaUdQ?=
 =?utf-8?B?dWpvc3BPOXBoSmR2T096anJtUFkwN0o3YzA4akNUTm5QMysyQUoyZ0trZFdX?=
 =?utf-8?B?bmgvbmNzRjF3cmpZdXZJdnoyV3lNS0phRzBVWDFDK0djbGlMVXFCTjlCZTlP?=
 =?utf-8?B?eE9vM1ZQTHhFai9MZEJ6cER1UWM1SVhJK0JWb0hPcnZ6Y3QyQU1qTFBoTm9H?=
 =?utf-8?B?c3hscWs2ZVluSCs1ZVFtWDN1cGM3Sm5hYlhYeE81S2U3MGEyTjVycGJZdFNl?=
 =?utf-8?B?RFFFb3YwaktnajFQNlI4bjhVSy9KWjBIMzg3RE9iNkJDMFNkWGxvOVpoTXBY?=
 =?utf-8?B?Ym5qZXRWYjdwelp4cEtmS3JyRm9zUUVUUDcxUlBPK0lRRGVpMHBSQ1V5ZEcv?=
 =?utf-8?B?djA0bDZXdDVIZTlIQVdqK0pBcjE1Vzk5V2xOWGVoTUtGSkNRWUtDbHVXdzJS?=
 =?utf-8?B?REJEY2xqTEx4bS9yRzhDT1BacGV3eEhzeU5iQVZjQWpiWWVCSkhudkRCRFZT?=
 =?utf-8?B?SnMxTmQrc1FlaFV0Z0YveU5uMzBJSS9pVVFaaXhpR240bDhTMzVFNmVNRUh2?=
 =?utf-8?B?S2Y0bHh3TDhaa0szUEphTkJabEduZDFGMFpkYis4RFFDQmErc1kxNnZpS01z?=
 =?utf-8?B?eHZ5V3pHRjJGZWNHRFo5ZElGQktxWnhIdFdpMllKWmN0VWNETndUVGtHUlFY?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <352CE6813D1022428BF74FB99F62787A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bbb522-f54b-4288-4094-08db6bf97b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:26.6053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdKUP8QF4/tIpd9eTehmtiaDQxyF1lAV4a3NU9ZTAn1O9thwZTfSFmyDunJZzqa2FknzC62TWHvhBXLhxEq92/ooy7gOyFMkWUBZCrj6Giw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9706
X-Proofpoint-GUID: aW2oc2PcnjmaewcXi_7-q95ic-WGLpzn
X-Proofpoint-ORIG-GUID: aW2oc2PcnjmaewcXi_7-q95ic-WGLpzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=673 spamscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130093

SGVsbG8sDQoNClRoaXMgaXMgYW5vdGhlciBhbm90aGVyIHZlcnNpb24gb2YgdlBDSSByZXdvcmsg
KHByZXZpb3VzIG9uZSBjYW4gYmUNCmZvdW5kIGF0IFsxXSkuIFRoZSBiaWdnZXN0IGNoYW5nZSBp
cyBob3cgdlBDSSBsb2NraW5nIGlzIGRvbmUuIFRoaXMNCnNlcmllcyB1c2VzIHBlci1kb21haW4g
dlBDSSByd2xvY2suDQoNCk5vdGUgdGhhdCB0aGlzIHNlcmllcyBkb2VzIG5vdCBpbmNsdWRlIG15
IHdvcmsgb24gcmVmZXJlbmNlIGNvdW50aW5nDQpmb3IgUENJIGRldmljZXMgYmVjYXVzZSB0aGlz
IGNvdW50aW5nIGRvZXMgbm90IHJlc29sdmUgaXNzZXMgd2UgYXJlDQpoYXZpbmcgZm9yIHZQQ0ku
IFdoaWxlIGl0IGlzIChtYXliZSkgbmljZSB0byBoYXZlIFBDSSByZWZjb3VudGluZywgaXQNCmRv
ZXMgbm90IG1vdmVzIHVzIHRvd2FyZHMgUENJIG9uIEFSTS4NCg0KDQpbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjIwMjA0MDYzNDU5LjY4MDk2MS0xLWFuZHIyMDAwQGdtYWlsLmNv
bS8NCg0KT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gKDEyKToNCiAgdnBjaTogaW50cm9kdWNlIHBl
ci1kb21haW4gbG9jayB0byBwcm90ZWN0IHZwY2kgc3RydWN0dXJlDQogIHZwY2k6IHJlc3RyaWN0
IHVuaGFuZGxlZCByZWFkL3dyaXRlIG9wZXJhdGlvbnMgZm9yIGd1ZXN0cw0KICB2cGNpOiBhZGQg
aG9va3MgZm9yIFBDSSBkZXZpY2UgYXNzaWduL2RlLWFzc2lnbg0KICB2cGNpL2hlYWRlcjogaW1w
bGVtZW50IGd1ZXN0IEJBUiByZWdpc3RlciBoYW5kbGVycw0KICByYW5nZXNldDogYWRkIFJBTkdF
U0VURl9ub19wcmludCBmbGFnDQogIHZwY2kvaGVhZGVyOiBoYW5kbGUgcDJtIHJhbmdlIHNldHMg
cGVyIEJBUg0KICB2cGNpL2hlYWRlcjogcHJvZ3JhbSBwMm0gd2l0aCBndWVzdCBCQVIgdmlldw0K
ICB2cGNpL2hlYWRlcjogZW11bGF0ZSBQQ0lfQ09NTUFORCByZWdpc3RlciBmb3IgZ3Vlc3RzDQog
IHZwY2kvaGVhZGVyOiByZXNldCB0aGUgY29tbWFuZCByZWdpc3RlciB3aGVuIGFkZGluZyBkZXZp
Y2VzDQogIHZwY2k6IGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHZpcnR1YWwgUENJIGJ1cyB0b3Bv
bG9neQ0KICB4ZW4vYXJtOiB0cmFuc2xhdGUgdmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5IGZvciBn
dWVzdHMNCiAgeGVuL2FybTogYWNjb3VudCBJTyBoYW5kbGVycyBmb3IgZW11bGF0ZWQgUENJIE1T
SS1YDQoNCiB4ZW4vYXJjaC9hcm0vdnBjaS5jICAgICAgICAgICB8ICAzMSArKy0NCiB4ZW4vYXJj
aC94ODYvaHZtL3Ztc2kuYyAgICAgICB8ICAgNyArDQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAg
ICAgICAgfCAgIDMgKw0KIHhlbi9jb21tb24vcmFuZ2VzZXQuYyAgICAgICAgIHwgICA1ICstDQog
eGVuL2RyaXZlcnMvS2NvbmZpZyAgICAgICAgICAgfCAgIDQgKw0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jIHwgIDE2ICsrDQogeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgICAgfCA0
ODUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KIHhlbi9kcml2ZXJzL3ZwY2kv
bXNpLmMgICAgICAgIHwgIDI5ICstDQogeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMgICAgICAgfCAg
NTUgKysrLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgIHwgMjU3ICsrKysrKysrKysr
KysrKystLQ0KIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgIHwgICAxICsNCiB4ZW4vaW5j
bHVkZS94ZW4vcmFuZ2VzZXQuaCAgICB8ICAgNSArLQ0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
ICAgICAgIHwgIDExICsNCiB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgICAgICB8ICA0NyArKyst
DQogMTQgZmlsZXMgY2hhbmdlZCwgODI2IGluc2VydGlvbnMoKyksIDEzMCBkZWxldGlvbnMoLSkN
Cg0KLS0gDQoyLjQwLjENCg==

