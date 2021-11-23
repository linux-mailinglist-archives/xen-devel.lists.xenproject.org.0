Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5B459D61
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 09:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229184.396627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQmj-0007yK-QD; Tue, 23 Nov 2021 08:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229184.396627; Tue, 23 Nov 2021 08:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQmj-0007wW-Mx; Tue, 23 Nov 2021 08:04:13 +0000
Received: by outflank-mailman (input) for mailman id 229184;
 Tue, 23 Nov 2021 08:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmA=QK=epam.com=prvs=19611c0f38=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpQmi-0007wO-Gm
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 08:04:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f01daa53-4c33-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 09:04:11 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN7j7P4006383;
 Tue, 23 Nov 2021 08:04:08 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cgv67031k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 08:04:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3281.eurprd03.prod.outlook.com (2603:10a6:208:a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Tue, 23 Nov
 2021 08:04:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 08:04:02 +0000
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
X-Inumbo-ID: f01daa53-4c33-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKeFOrHN/KEZDM1rb+dWnxmzw6umY/28iLxxCAQeILXM17D6tZTsMdWev+9+IaJE9go0QOZkEe+a5yaGcD1MpF0JyjbuV1uItXam8Aype1D3fVi5DLlSUgHfK9XmRJM9qNQGE2iN8J1ijCc20pr3uNZ6zbjplFIXPtI6Wz+gQw/BsrKq8aiGG0N0t6BHqEYxgtMKDnglpy7gQXlrcZ2ku49e+Fey/INedayyb9J7SreNo05f6zf7IrphUecn6V/Sh8lqx9NPb1rI+5nBuirZsQ3VFPI30QAlw2jOaJg9spctnyNAu/TxGhwHfLiycxSwJvTVkvM1+gYMCT/g8R10sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEmr4y0KxL+qd031VVKDNsaTVf0BU43exO5qqZFOFOE=;
 b=aY/H3aDwDOS3SP74e0hA3k1RkSvpypPvPP7kVnz9rQvZO2Uh7rAjaVlBY8+m4Bsx8sC0VeIyEmenggglqTMzjtDPTCEHewYzzU9I4vWCH8ExFcW0V6eP5TR8MlSfKKZD296P7KMvXyQS6+Sx5S9OBJoGpzpNAkx2mNsXJTxYvomWFC1VTqj95nSoZh7k0/SF6wtSPs0yZ0YtIP/eUnvYoeveEJVMIFuj/UvXuk7Y94FViuRZqaINng3CRYnk9RkSRiZoesHVoozbVv7bANnE1cSTpZCE0T1E20FjLv1XplfwpGin7yJDMmrRpFragdmDN/iomDz649QtrRv2lUiRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEmr4y0KxL+qd031VVKDNsaTVf0BU43exO5qqZFOFOE=;
 b=E2a8vFFRF3m2cdtFPpGGJxXzMEoPn8AMxpz0ThTts47Vf6E3EyshnmU9a8IMVHr5fR3sXXQCXndvIW9JaCPr+xv+hGJV1+yUoWigmKw4Ls1zfUzz6oq1LOg5N068nRroQ08Lqkc6koTleUIkMFwwZyQ78ZerdUjNK9PMdi1Axwl0jnqwzCUtD5GjIRr8h9xL6izWjHXkO/UvV1v+zE8MgeDsQ5V26V6wqvYNVg9V7nr8zQPK3pSfuOWHBxRoN45OmBdWkjR+dY6vBxoaG3I6JUXp2plbwmIK1h+BMe9bPG6t2+9pVQudOOQ88oPNKih9wgBhswpecJL0Wl4eyS8sdA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHX34NQb/OdxzJcEUqRnDxd7565ZKwQu1AAgAADEACAAAMogIAAAMqA
Date: Tue, 23 Nov 2021 08:04:02 +0000
Message-ID: <f5c8c022-857e-aa1c-47be-49f4283a2223@epam.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <d6b298a2-bc04-8845-eaea-09502e32dcf1@suse.com>
 <b3a0d4c1-8b18-5d63-c70a-8b3db7fd6c84@epam.com>
 <31816ff1-987d-f78d-036d-a35bfd9f807d@suse.com>
In-Reply-To: <31816ff1-987d-f78d-036d-a35bfd9f807d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c170d06d-7bd8-447a-bbd4-08d9ae57cfe1
x-ms-traffictypediagnostic: AM0PR0302MB3281:
x-microsoft-antispam-prvs: 
 <AM0PR0302MB32814E7CC3D86DC78935F88CE7609@AM0PR0302MB3281.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JJ5hwQEPzOFVHyreeCwmI1+HICEcDn6aIiViSxT0oDvFEpxi9AFySJlnCCFQTAqAJKN2izdQ5phXX8UhpxtAhC+HqHTfBBkdxooHPreUEoI5FLW8SUXKWy2UTLTNCP2VAR/gS9l1pgHWRYYAFoHYU5ZhAuTwFgptUKtTPovMPJQmW+gvIQ8qKWa2RIp/D4BBK5EVz+ITi6jMheYUnBtrWGB1u+Kv9nxmMfx+sa+KjNng85YtuM50ZDxtSZpH9gasS2FpAEh4qSxS3nhNAiPxH/2IU0VPgjPagi/gRMlGbnv39s5gag1FlixsFqC9bq7n8IvQLrMJ9To4lJhukYs7P7g/fqvRzsQ770jFACbZj06UuYLDpLWYS52cDmzXd1vTnEDZgeaflRWeCSthKm0wuQbOyz2LkXww83ikZCID5Kz5UWmL/Vq63TPIlq1sbVXBsBr7nqcFgy9ZIguqDWfsJmcjai5QGfg/VlEd5p3CYXMh0tzu/Urc0N8ITg6d9TsiZsv3r0UMgmGt3WM4kOZU8/SM6AzXmaXl9S9CuniVpIF7Jb3H+faeZlxi+UUpiPjQ5PBqXS+MF+umZenBuM7eDB2RO1hMKyqmkH9NvdV73mGeNqcfzJtYFYjfrx+taPvjio3fPzEjrZhFq4DYUPwUY/EeQ73/CqP3d/nbzSdzmCrARu57M54OyxGTJ9oMmIPx8FwvQN5Cr7w6WmfTm+2iu2hx0xkHR2TY5cQF/Q1I6VI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(64756008)(66446008)(2616005)(66556008)(76116006)(186003)(31696002)(83380400001)(2906002)(122000001)(38070700005)(91956017)(66476007)(86362001)(6486002)(66946007)(31686004)(4326008)(54906003)(107886003)(8936002)(71200400001)(6916009)(508600001)(38100700002)(36756003)(316002)(6506007)(8676002)(6512007)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b1hMKzZzK3FnaGhOeGNRS1NaRzR0blF2NzIrbG5JOCtuUHZTdVlaeE1HcEF1?=
 =?utf-8?B?ZzZ0S1F3bE81YU5QUFF4bnRBbVBXeG9qaUFYK0ZVVmZGc25RSjFaRG53Y3k0?=
 =?utf-8?B?dTkya3ZUcUozaHBXek52YlBiUDFPUk05b0h3dkJ1d012M1cvYWpaRVFZYW9w?=
 =?utf-8?B?RmdwZHpraThnU29GcjY0WG1MK3IyeGcxVUkrdm1kRDBMT2lQMW85MlJXWkdE?=
 =?utf-8?B?MFRDY2J1czI2a3plbHE0TVJ6bWNaZG8xcjVxdVlITEpqNXBkT3hEbng1bktK?=
 =?utf-8?B?OXFINm9XZDJtb2pmSnFxQkt2cmR2VHdIb0NZdjQyQTlKWUtXdDc3OWJHSTBt?=
 =?utf-8?B?eVkwV3FYRHFKSmZFdDVwNXZ1Qzd6RDhpc1c3Y3dCS1VEZEd2QU1zaVkvR2FT?=
 =?utf-8?B?ZDhwR2F2TXJtd0VGcHJtOHRCMWFKRjBJYWdQYUtUcmFYOFZPNDgwRGxKVnU5?=
 =?utf-8?B?NVorVHFqMmh5M3VySCt0YjRLdUg1VHF1NUEza05VbkVrMVJSSmxIaVd2aElp?=
 =?utf-8?B?RHl2UHIvdStHdjAyajQ4U3hwUGp4bDFEWmJMcFdsdlU3RU1wN3ZSV0MzSkVl?=
 =?utf-8?B?NENPbTN6MEFCVVk3N1lYQVRkNkNuVmZkZEQvVklCUUN4WWZzUml3N0hFL2dy?=
 =?utf-8?B?L0FCMUJ4STJNVkxBOGt4QnNhOWtxbjRPZ2cyT3YxdFFpQkFqK21nZG9ndm9q?=
 =?utf-8?B?cktlRmRQa1NKVnFZK014bGNSbE5hQUhLTVhtUTRtakNoWHg0c3N3RFdqUjVv?=
 =?utf-8?B?K2VQdTJ0dnc5cEx2ZjZkc2psYW1JV1dzWnlNL2t0M1ZFcVN2QmdXbTQvQjNy?=
 =?utf-8?B?YldFVE9STWloSWs2VUtES0crTnhZb2s1c2tlNE4zU3dnMmdJTWJnVndVWWJQ?=
 =?utf-8?B?YXlRSXY3c2l6N3VwMFVlb2NMYkhIenBnNGdLMDNXVmJQYUdoVTRkek1IOVJB?=
 =?utf-8?B?NkhMVVlXQTNGcE9MVlY0RFZ1bnRrazV4b0JOeEVsbVJPWlVVMk4wVlczN0Fi?=
 =?utf-8?B?aDF1d3JYSEZpUjlFQUtsd1R6SXM3TVRQNTVrTVBRcVdOa1RpVFZHNnZNNXh2?=
 =?utf-8?B?Z0I1Q0NmYnhPQ0pDZHJwaUtNenp2VkI4enVsU2lPYlVBQ3BIOVA5UG4wMkpS?=
 =?utf-8?B?VzFSOTNNdW85MEw1TzVZNi9PSWdQOFVocnE2ZjRZRHBUS0tnZGFjMS9WZFVL?=
 =?utf-8?B?SzhxM2xtaVhRaEdXS0c1Y1FabFFZeS9kdUcwWWFmU0tFbXBuajlWSm9QaEIx?=
 =?utf-8?B?SDg5TkdIUEpBV0FTWUZjRWJXNkk2dGlJUkFTbUhtbWc1elY4TzFCRkRjNis1?=
 =?utf-8?B?UFc5YnlNUUFwTHVJY1p4TUVyVE5mU2RzYlcyeXZZdXJwZVBOWmpLOVBDRDEx?=
 =?utf-8?B?RUJ2bkJHaWhHVWJBYkpRWk0wNXBBS2R6NWZHZTJXRHh3Z2x0VURoa0hlVS93?=
 =?utf-8?B?cjhKZUkrcWhGdmhGczVjL2tiUS9qTTRRU2FiU2FTakkxQy9VbDdLOHNZVzNx?=
 =?utf-8?B?SDhPa2tWV0NZNk9mL21Ma3JFZ0Jxd29qWHJtdkN0S0RFd0NKVW9JV0oxOFll?=
 =?utf-8?B?eGJRdGt3cTVSREJ0ejFzam0vR3VIcFpuV3pyV2xUbEZQQnpUUUZNcTdBQWts?=
 =?utf-8?B?ZlB2QmVsM0ljVUsrQ1B4MFI1dHdRY21uQmtxK2F5UlFHVzJGNzJEaUZSNTlu?=
 =?utf-8?B?RGRWZGVjZmdFbkdxS0FIOHVzQit5ZUxMK0NUamVOUWVKciszLzFibkF5MUR3?=
 =?utf-8?B?cE16dzh2OGVGdFh4MGhUQWxCblJnM0JBcFFkZUdNOFZ5cjRGdEJzYjJJVU90?=
 =?utf-8?B?eVVyNTJrNUZsb2JNcXo2SjdTQUQ2dnRNOUZ4SHFQNmxrd2hHZCtuR0J4ZDVn?=
 =?utf-8?B?aVFwdXE1OFRDUjR2Q0Nha3E4K1hWRGFJQ05MZVVnOUtybDZOR2djVXYxS29G?=
 =?utf-8?B?cFBOSjRWK1RVbURZRUpMbVJyR1Q2bzdjTDRFUHZKT2tJcE1zeDZBR1VWOVJ0?=
 =?utf-8?B?bGpWc1pyZ3R4bkVvSy9LUGQvVVU4dGJlbGIrQy94RStDN082VGwyUEIrbEdn?=
 =?utf-8?B?VkVZaFJ5ZlY0YW5oOTFyZnhONFE1ZTV1dmF4aDZZZHFLa0pIaEhGV29MczFR?=
 =?utf-8?B?bFJrOTh0c0E1L0VGVnJJbjUyWTdRVGZ0b21PMWpsRE9Ga2pTS1d6VFBvbmV3?=
 =?utf-8?B?d1FQZDFDZllERTh5SHdiTEhlUWM1QnlUc0NPWUdQaGpJeGdJb0svb0xwQm5L?=
 =?utf-8?B?eUNkeW1SRUVxL3lwVXN3YnlyUk8rUmVaaWRaUGdHTFZGdmxpczYyb2xyRnNW?=
 =?utf-8?B?YzNEQTFlN3Via0E1Lzg5OHI2OFZLd0h2T1pkMEIzeHVVMy9QSTZpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6C9E867EF63C84CB35162253722AF1D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c170d06d-7bd8-447a-bbd4-08d9ae57cfe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 08:04:02.1705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aazp1F3p6uJQvej2I9/hKbkpen9QuAJO/Np+dKsLxJ9/R/1iA3rUMBfxyOnS1vvBjP0anmVpf4JbbwZBPS+VChPk0DHiz1AmqCR8Q9tAFW+EO/CC52zQ4NizDXUvOqU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3281
X-Proofpoint-GUID: dk93QZjDn_HjjYe35xtGkbzxCW-1Gt1i
X-Proofpoint-ORIG-GUID: dk93QZjDn_HjjYe35xtGkbzxCW-1Gt1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_02,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxlogscore=770 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111230042

DQoNCk9uIDIzLjExLjIxIDEwOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjMuMTEuMjAy
MSAwODo0OSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMjMuMTEu
MjEgMDk6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjExLjIwMjEgMTA6MjgsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
cmFuZ2VzZXQuaA0KPj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcmFuZ2VzZXQuaA0KPj4+PiBA
QCAtNTEsNiArNTEsOSBAQCB2b2lkIHJhbmdlc2V0X2xpbWl0KA0KPj4+PiAgICAgLyogUHJldHR5
LXByaW50IHJhbmdlIGxpbWl0cyBpbiBoZXhhZGVjaW1hbC4gKi8NCj4+Pj4gICAgI2RlZmluZSBf
UkFOR0VTRVRGX3ByZXR0eXByaW50X2hleCAwDQo+Pj4+ICAgICNkZWZpbmUgUkFOR0VTRVRGX3By
ZXR0eXByaW50X2hleCAgKDFVIDw8IF9SQU5HRVNFVEZfcHJldHR5cHJpbnRfaGV4KQ0KPj4+PiAr
LyogRG8gbm90IHByaW50IGVudHJpZXMgbWFya2VkIHdpdGggdGhpcyBmbGFnLiAqLw0KPj4+PiAr
I2RlZmluZSBfUkFOR0VTRVRGX25vX3ByaW50IDENCj4+PiBUaGVyZSdzIG5vIG5lZWQgZm9yIHRo
aXMsIHNvIEknZCBsaWtlIHRvIGFzayB0aGF0IHlvdSBhZGQgLi4uDQo+Pj4NCj4+Pj4gKyNkZWZp
bmUgUkFOR0VTRVRGX25vX3ByaW50ICAoMVUgPDwgX1JBTkdFU0VURl9ub19wcmludCkNCj4+PiAu
Li4ganVzdCB0aGlzLiBJbiBkdWUgY291cnNlIHdlIHNob3VsZCBkbyBhd2F5IHdpdGgNCj4+PiBf
UkFOR0VTRVRGX3ByZXR0eXByaW50X2hleCBhcyB3ZWxsICh1bmxlc3MgeW91IHdhbnQgdG8gZG8g
c28gcmlnaHQNCj4+PiBhdCB0aGlzIG9jY2FzaW9uKS4NCj4+IE9rLCBJIGNhbiByZW1vdmUgIiNk
ZWZpbmUgX1JBTkdFU0VURl9wcmV0dHlwcmludF9oZXggMCIgYXMgd2VsbA0KPj4gYW5kIGhhdmUg
Ym90aCBmbGFncyBkZWZpbmVkIGFzDQo+PiAgIMKgLyogUHJldHR5LXByaW50IHJhbmdlIGxpbWl0
cyBpbiBoZXhhZGVjaW1hbC4gKi8NCj4+ICNkZWZpbmUgUkFOR0VTRVRGX3ByZXR0eXByaW50X2hl
eMKgICgxVSA8PCAwKQ0KPj4gLyogRG8gbm90IHByaW50IGVudHJpZXMgbWFya2VkIHdpdGggdGhp
cyBmbGFnLiAqLw0KPj4gI2RlZmluZSBSQU5HRVNFVEZfbm9fcHJpbnTCoMKgwqDCoMKgwqDCoMKg
ICgxVSA8PCAxKQ0KPj4NCj4+IE9yIHdlIGNhbiB1c2UgQklUIG1hY3JvIGhlcmU6DQo+Pg0KPj4g
LyogUHJldHR5LXByaW50IHJhbmdlIGxpbWl0cyBpbiBoZXhhZGVjaW1hbC4gKi8NCj4+ICNkZWZp
bmUgUkFOR0VTRVRGX3ByZXR0eXByaW50X2hleMKgIEJJVCgwLCBVKQ0KPj4gLyogRG8gbm90IHBy
aW50IGVudHJpZXMgbWFya2VkIHdpdGggdGhpcyBmbGFnLiAqLw0KPj4gI2RlZmluZSBSQU5HRVNF
VEZfbm9fcHJpbnTCoMKgwqDCoMKgwqDCoMKgIEJJVCgxLCBVKQ0KPj4NCj4+IFdoYXQncyB5b3Vy
IHByZWZlcmVuY2UgaGVyZT8NCj4gQ2xlYXJseSB0aGUgZm9ybWVyLg0KSSBhbSBmaW5lIHdpdGgg
dGhpcyB0b28sIHNvIEknbGwgdXNlIGl0DQo+ICAgQnV0IHRoaXMgbWF5IG5vdCBiZSBldmVyeWJv
ZHkncyB2aWV3LiBJJ20gaGVzaXRhbnQNCj4gdG93YXJkcyBmdXJ0aGVyIHVzZXMgYXQgbGVhc3Qg
YXMgbG9uZyBhcyBpdHMgZ2VuZXJhbGl6YXRpb24sIEdFTk1BU0soKSwNCj4gaXNuJ3QgcmVhZHkg
Zm9yIGVhc3kgdXNlLiBJdCB3YXMgc29tZSB0aW1lIGFnbyB0aGF0IHdlIGhhZCBhIGRpc2N1c3Np
b24NCj4gYWJvdXQgdGhhdCBvbmUsIHN1cHBvcnRpbmcgbXkgcmVzZXJ2YXRpb25zIHZvaWNlZCBi
YWNrIGF0IHRoZSB0aW1lIHdoZW4NCj4gaXQgd2FzIGludHJvZHVjZWQgaW50byBvdXIgY29kZSBi
YXNlLiBJaXJjIHRoZXJlIHdhcyBtb3JlIHRoYW4gb25lDQo+IGlzc3VlIHdpdGggaXQ7IHRoZSBp
bW1lZGlhdGVseSBvYnZpb3VzIG9uZSBpcyB0aGF0IGl0IHNpbGVudGx5IGRvZXMgdGhlDQo+IHdy
b25nIHRoaW5nIHdoZW4gdGhlIGFyZ3VtZW50cyBnZXQgc3BlY2lmaWVkIHRoZSB3cm9uZyB3YXkg
cm91bmQsIHdoZW4NCj4gaXQgcmVhbGx5IHdvdWxkIGJlIHJlbGF0aXZlbHkgZWFzeSB0byBzdXBw
b3J0IGVpdGhlciBvcmRlcmluZy4NCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

