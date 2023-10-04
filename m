Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49237B8170
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612448.952588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2L6-0001pc-EY; Wed, 04 Oct 2023 13:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612448.952588; Wed, 04 Oct 2023 13:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2L6-0001ct-6R; Wed, 04 Oct 2023 13:55:00 +0000
Received: by outflank-mailman (input) for mailman id 612448;
 Wed, 04 Oct 2023 08:42:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47HB=FS=epam.com=prvs=4641d3e587=andrii_chepurnyi@srs-se1.protection.inumbo.net>)
 id 1qnxSk-00016L-04
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 08:42:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4d464dd-6291-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 10:42:32 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3948DnuJ012554; Wed, 4 Oct 2023 08:42:18 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3th4bwr3hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 08:42:18 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com (2603:10a6:20b:5aa::18)
 by GV2PR03MB9882.eurprd03.prod.outlook.com (2603:10a6:150:b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Wed, 4 Oct
 2023 08:42:15 +0000
Received: from AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa]) by AS8PR03MB9583.eurprd03.prod.outlook.com
 ([fe80::529f:7d90:7f52:64aa%4]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 08:42:15 +0000
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
X-Inumbo-ID: f4d464dd-6291-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZL74g3KaNrKswnoK7vK6zk2/LeI8NJfJvTymqZqZVd7hGmnTU0SeXbD3ZNLm6gkEoy8SCW3AwFw5ASq843gIxY2pdGXxIxiTm6QO7KN6gScLZTkjuNVgcj9wB28m6CX9eVC2X7LVd1JgxO26z5SLUE2XjqksXyFlfqE2zjFF1sJGSzdBni+yY/7SQ4DcWvsgZFIeveGy5NQL8mNcR5HAGnx3Os1s2nrw2whuD9d34/VjgxfOXR/FaRbXD3swm/sjTGwUmLTixEE7xcNdkNh/kv+vyDHJwRvt3H5DbFEFMcjPgi6YpHZemQgAHE8R8xAh9t191QyHlsTvIyhLcn1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBT7bNEVWvn3/HceSjgjLVnquEZtLkn7anQp2jkzFxA=;
 b=ct06c5Rl7IjDBgUnFcfv2iTTPJlotoxbqtR+d3XOf5r/Zx6jXRCPntVoUBu2pT6to5WgsKPiKqj4FSa7JVdVJpEP96OHjVWwjo4xfo3FUPzOFk3vNKvBM5gPNL9Ool52dZacEZt5lWBIWg3NsN3jbKjqI/zn59o77D2avTzSQSQCb0UL78wbA4uqt+/hBjIggKjL7bWjk+OdMOvECknqzeJxf+aNnMxjkygqYKgPINyrAOAQm4uxAWfv0SxS1B0kykSxIbWGrKQoIAhtWiFM4RmltGwn7ZzqvuIpL76pu0hTt4Am91iRjaJJoP/OqsQYiSH1h6yZAOYedQEF8/6W3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBT7bNEVWvn3/HceSjgjLVnquEZtLkn7anQp2jkzFxA=;
 b=cFQZrioI3PndgIghdJnu+us2m+EGovmjpc1wns9/RkujhGo06MfcfjFV8EHAqxGMvB2qlwV+WFFI6ixawcBdZRVvDmljbgaB5Uz1FN/ztAA8BlciUhciV3hj01coeQR+R/L0OSrhAenPHuG+XSRdWGMegMh8ZRcEer1NWst2jyMfvl8SJojV5VyBZ5/f6j4u3DMkTQM/9yXC6KUueeZwgKBi8S2OKKpWNQVON9+guP75/O/bcnSeWuE/bJdhsW9DrY1E79Cd/8ExRkl/GtNG7U7oleaPR+H0PXBpbw9viTtTDLJaR+mq9fwhmlyrGEYBC4o+c+cJFM2eEGjAe4PSLQ==
From: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Thread-Topic: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Thread-Index: AQHZ9fw82LZSu4lXwEi+r3jS4xqDm7A4FMmAgAE8lwA=
Date: Wed, 4 Oct 2023 08:42:15 +0000
Message-ID: <ec7089d1-0111-1e34-900b-b5c40dcb41d2@epam.com>
References: <20231003131923.2289867-1-andrii_chepurnyi@epam.com>
 <27044e68-4a49-4f1d-b8a9-174810efb5fe@xen.org>
In-Reply-To: <27044e68-4a49-4f1d-b8a9-174810efb5fe@xen.org>
Accept-Language: uk-UA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9583:EE_|GV2PR03MB9882:EE_
x-ms-office365-filtering-correlation-id: 2230c984-1402-4f39-d6a1-08dbc4b5cf7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UL7/c+aE3PaiijTsaz1I8k3Xha2NwWDHTPIByKc7Mw28lrFdCPbZZ1S08fotTXzai6H/ss604IriPCa/vjakGvLdTlOMUahKFDx76hQP/Nw26p39K64b+Fl42bsaBUsOQMK1r2SibaZzpTbxhVlG5eLCp1LR8MaHoZT7T08mh87NU32PFJrpIPqoEiKGfyeR6JrcpH0iIe9rI1mvK0T6ynRo2n3R+YFW9JJuPhC3IGf/UqVJeA5BGp3sR/SX5EnlRM24vLs+85KaxmmLqSbW7ypDy35VL39e6Dd9m0l3bQ5C5Ioq3rzFKzNI1kzvyDXuHtAqZSPnN0Iqr5IPCxzcojmASgTKB6EvJENn6syUwaeTe55lcDrru4e0z4MEHAzli7RKTkD/FRp04BqU1Ue5YSVlOGhk4WGsNzYbZVCAtF2aW+1wfj6p/Z3gG/wSg6um5vPXrjoVaLp4Rvia9j61An91zSkWmVmT9NtjxJkEib2sCZdNWYB3rp3Ky0gZ5GHIVu7U6JbKey22SAVj9npuweaca+iNZWaEBxsUkrtZ2PZ3aFWxTsU/seWG0jlc5HIhdzolqZXr5Oz8/d8vi8qaKdzGGFosEWBDACY3AX4f/lj0I0ZB139xKgEqKUGZRAckrdXL6XiuOIV5Sw3cISoovw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9583.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38100700002)(38070700005)(478600001)(316002)(91956017)(66556008)(54906003)(64756008)(66476007)(66946007)(110136005)(66446008)(2616005)(36756003)(6486002)(83380400001)(53546011)(107886003)(26005)(6506007)(76116006)(122000001)(6512007)(71200400001)(31696002)(86362001)(2906002)(31686004)(41300700001)(4326008)(8936002)(8676002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NU4xQjlybHhzNjNJcjZwWlVRNEVwTmpRdlg0eUVJc09IdXlycGNpVko5VE4r?=
 =?utf-8?B?L0V1S2taWlY1ay9BUXJsRjdaTVZzVzRFTXFlalovbVQ3VWxJMG5CL2lHZCtj?=
 =?utf-8?B?TzVsdlhhNjl3SjM2LzkwSDVSTnlDKzFNblNDZzFyZTBvdjZ6bzJXVnpJZGp4?=
 =?utf-8?B?VTdtVEEraUVDNnBNT1dZbG9KZXZqZXEra3p3SnFhcExIUjFPcmRrY3FGS3VJ?=
 =?utf-8?B?TjRaY3IyVWh0Zk04cDYzazJWdjdHWWlQaUVCOHcwVmIza3NraVFiY2lvcUx6?=
 =?utf-8?B?SXNuWHl2cHFsQndFT3U2M29aSjRwWU9DOWhsSkNoUGVuNnArOTljWmZMRmQz?=
 =?utf-8?B?M0tLcTR5YXJFRWY3Z1U0elJoeDkybWd2aXhOUE5xOG1zWS9nbmgwTGJHdm00?=
 =?utf-8?B?cGdvNlc5L01FbnN6Y25odHpGK3NzbzdaS1BiWjJ6SXBHSGlBbDFiZThXWnJT?=
 =?utf-8?B?c0ZrcnBVYVE2QU9mSGc1aVhPWnhCTExvUkcyUFJDd0dxTzQ2eFdrVVFUaXpO?=
 =?utf-8?B?bmdPV2lPOGlkbzBGN2tOV1IxUUxFb29IcnozUDFvOEJXS0dncEJtSDZpQU5O?=
 =?utf-8?B?aVF0a2xsYnF2TmtKY1BlVTA4bUNXVzRDdnI2c08yNWMrL2xzSzhpQVBrNnJt?=
 =?utf-8?B?VzhVc3ZmNzR5OUNKa05NOVFhell6MWxkekI1OXZ4OStGYjc4SmJBNFVMa0N0?=
 =?utf-8?B?dUx0N3VCQ1Mrb2pwZUNidGlNSkZibGxBNDFkdXlHamJXOHVMWjZpQkd5WEl2?=
 =?utf-8?B?VU5TY0twRzBmWU9CdEExcWVLMWlaRkJkTUFLWXNQK2E2UDlNem1yZVVYWkRI?=
 =?utf-8?B?VUNsdyt0aldsR00vRHJIR25UUlpYRk85UG5JblpJN3JwaWw5UWgxMk56UGk0?=
 =?utf-8?B?c2pNdkNHZkR3OTl6KzFCcENKTTllVmRjWGl6QUxLVzRoYWRCN09RU1ptajBP?=
 =?utf-8?B?TXlyaFdaM2ZsV3J1RVRBV3Fyb09aOTdBNHFVK3JtdkovL0tHQUxNRCtwaFBU?=
 =?utf-8?B?NmpGWUMwMFBVRjcyOXVjcEdZYzFCYTVHNUJmQUp3dnJDQ2dSSmZuaVhXeWEy?=
 =?utf-8?B?cDlrQUFTQkw0SEtSK0YyejRmVXZTbmNEazNpQzE4QmdmL0xJRkZWZ3pWSy81?=
 =?utf-8?B?eUxhWEtCU1NQZ3V6RWI4VGdaVVpjYTVOTGFZbXhSdE0zdGdLRDhKaHpad0Fz?=
 =?utf-8?B?M3U3Y2Nzd3J5WTlKbmtmYVV2SzhzbVNyTUJxOVpjMWkxSWlyM3EwQ0V5ajE0?=
 =?utf-8?B?VGF4OWo5UkJPK3FyTWVEcW0zMjRIamZPREFCSzN2a3Nib1RDblFUTVFGZHJV?=
 =?utf-8?B?L2pDMVFpRkc1QzlqWDJ5SEEzbS84QkZFODlESElNSUd4TDFsOHZ0NThZaUs4?=
 =?utf-8?B?bFNQOHFTVTl2TlZOVzBRUFljM3lNZ3h1eUpoMGE4Zkx6c3A0bk00UGRTakw3?=
 =?utf-8?B?dnpVN3A1YnlMWjJCelpzdExNWVg5U1h0cXVpRmZBOUZteVBBS25WSzM3dDNR?=
 =?utf-8?B?M0JiemhuQkNUYnBTbnpLZW5ROUpzOW5CakZ4b1FQMXJ1VSsxWnBPMzF0K0o1?=
 =?utf-8?B?Z0RqcjVhNWFWTFF5M05RYndSUUQzK3dwWlFQVU5Ici93eGVyb3BzWWZKbk9X?=
 =?utf-8?B?QjBJTnJPRUI0SkhDclpucmJMZkwxTWRMTXppa2ZjVkFWVVVEdGsvSVcwdi9m?=
 =?utf-8?B?dFdFVmxOYjdkTVJQd3liUHFZTnNMWEZaajUxSW9tZkVUbHFSV2ovZTdUV2Iy?=
 =?utf-8?B?Nm1xQ1MwK2NHblQ4ZHdUVHc1elBXYnRlMVlVOEg2dW1ndzdjMGFOWmNLOTQw?=
 =?utf-8?B?ZXNSS2dBOGFnUFVzVDMzamd1aWVTY2VBdHNJcUhEemFTd0RheS9jcWlhbHZL?=
 =?utf-8?B?NUprelhpclZSQmxmMlNRQk1mdjBuS0xSQTlLdktZOVVGYzhyZlFNRjNJb1pP?=
 =?utf-8?B?allmODRGSzN0ZG1oM3ZLTkFZdHRJTjhnbkkxZmk5R3BiRll0aCtUWlN1Zkt5?=
 =?utf-8?B?cDJuTUI1Sy91dmJhMTFvRzFRRVA2OW4vUFgzMG9DN2FkTlRMNlcyWGxOTDlV?=
 =?utf-8?B?NmNLcmdQa1IvaW5vOGZ5V0h3YmxzcDNMWXFQWm5reWFyMzJXRTlxUmtXQTFQ?=
 =?utf-8?B?VE1TdVdtYXJUemYxekMzV3NPWlhIbmRtTG8rV2JiZkU1SGZkMm9yOVQvRU56?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <851670D2656E4843960EF6769A0A4452@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9583.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2230c984-1402-4f39-d6a1-08dbc4b5cf7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 08:42:15.1743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dcr6Fl3lSVrFu2fXxo6QUaDglEMKMKQnVK6BSAKunMVrnajkjWffHAJYg/xIaQc15BqflNmHUSuXMDps0bRc+40cSBJBuNYrH801FIv/Th4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9882
X-Proofpoint-ORIG-GUID: Wj0uF7w4s8rgGwlhN9xFKq_MWWWWffkc
X-Proofpoint-GUID: Wj0uF7w4s8rgGwlhN9xFKq_MWWWWffkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040061

SGVsbG8sDQoNCk9uIDEwLzMvMjMgMTY6NDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+
IA0KPiBPbiAwMy8xMC8yMDIzIDE0OjE5LCBBbmRyaWkgQ2hlcHVybnlpIHdyb3RlOg0KPj4gRm9y
IHJlYWQgb3BlcmF0aW9ucywgdGhlcmUncyBhIHBvdGVudGlhbCBpc3N1ZSB3aGVuIHRoZSBkYXRh
IGZpZWxkDQo+PiBvZiB0aGUgaW9yZXEgc3RydWN0IGlzIHBhcnRpYWxseSB1cGRhdGVkIGluIHRo
ZSByZXNwb25zZS4gVG8gYWRkcmVzcw0KPj4gdGhpcywgemVybyBkYXRhIGZpZWxkIGR1cmluZyBy
ZWFkIG9wZXJhdGlvbnMuIFRoaXMgbW9kaWZpY2F0aW9uDQo+PiBzZXJ2ZXMgYXMgYSBzYWZlZ3Vh
cmQgYWdhaW5zdCBpbXBsZW1lbnRhdGlvbnMgdGhhdCBtYXkgaW5hZHZlcnRlbnRseQ0KPj4gcGFy
dGlhbGx5IHVwZGF0ZSB0aGUgZGF0YSBmaWVsZCBpbiByZXNwb25zZSB0byByZWFkIHJlcXVlc3Rz
Lg0KPj4gRm9yIGluc3RhbmNlLCBjb25zaWRlciBhbiA4LWJpdCByZWFkIG9wZXJhdGlvbi4gSW4g
c3VjaCBjYXNlcywgUUVNVSwNCj4+IHJldHVybnMgdGhlIHNhbWUgY29udGVudCBvZiB0aGUgZGF0
YSBmaWVsZCB3aXRoIG9ubHkgOCBiaXRzIG9mDQo+PiB1cGRhdGVkIGRhdGEuIA0KPiANCj4gRG8g
eW91IGhhdmUgYSBwb2ludGVyIHRvIHRoZSBjb2RlPw0KDQpGaXJzdCBvZiBhbGwsIHVzaW5nIHRo
ZSB0ZXJtICJ1c2VyLXNwYWNlIiB3aXRoIHJlc3BlY3QgdG8gdGhpcyBwcm9ibGVtIA0Kd2FzIGEg
bWlzdGFrZSBmcm9tIG15IHNpZGUuDQoNCkluIGdlbmVyYWwsIG15IHVzZSBjYXNlIGlzIHRvIHJ1
biB1LWJvb3Qgd2l0aCB2aXJ0aW8tYmxrIGluc2lkZSB0aGUgDQpndWVzdCBkb21haW4uDQpJLmUu
IHNldHVwIGNvbmZpZ3VyYXRpb24oaGFyZHdhcmUgcmVuZXNhcyBnZW4zIGtpbmdmaXNoZXIgYm9h
cmQpOiAgRG9tMCwgDQpEb21EICggUUVNVSBhcyBiYWNrZW5kKSBhbmQgcnVubmluZyB1LWJvb3Qg
aW4gRG9tQSB3aXRoIHZpcnRpby1ibGsuDQpUaGUgcHJvYmxlbSBhcHBlYXJlZCBpbnNpZGUgdGhl
IHUtYm9vdCBjb2RlIDoNCg0Kc3RhdGljIGludCB2aXJ0aW9fcGNpX3Jlc2V0KHN0cnVjdCB1ZGV2
aWNlICp1ZGV2KQ0Kew0KCXN0cnVjdCB2aXJ0aW9fcGNpX3ByaXYgKnByaXYgPSBkZXZfZ2V0X3By
aXYodWRldik7DQoNCgkvKiAwIHN0YXR1cyBtZWFucyBhIHJlc2V0ICovDQoJaW93cml0ZTgoMCwg
JnByaXYtPmNvbW1vbi0+ZGV2aWNlX3N0YXR1cyk7DQoNCgkvKg0KCSAqIEFmdGVyIHdyaXRpbmcg
MCB0byBkZXZpY2Vfc3RhdHVzLCB0aGUgZHJpdmVyIE1VU1Qgd2FpdCBmb3IgYSByZWFkDQoJICog
b2YgZGV2aWNlX3N0YXR1cyB0byByZXR1cm4gMCBiZWZvcmUgcmVpbml0aWFsaXppbmcgdGhlIGRl
dmljZS4NCgkgKiBUaGlzIHdpbGwgZmx1c2ggb3V0IHRoZSBzdGF0dXMgd3JpdGUsIGFuZCBmbHVz
aCBpbiBkZXZpY2Ugd3JpdGVzLA0KCSAqIGluY2x1ZGluZyBNU0ktWCBpbnRlcnJ1cHRzLCBpZiBh
bnkuDQoJICovDQoJd2hpbGUgKGlvcmVhZDgoJnByaXYtPmNvbW1vbi0+ZGV2aWNlX3N0YXR1cykp
DQoJCXVkZWxheSgxMDAwKTsNCg0KCXJldHVybiAwOw0KfQ0KDQoNCkkgZm91bmQgdGhhdCBpZiB1
LWJvb3Qgd2FzIGJ1aWx0IHdpdGggY2xhbmcsIGl0IHN0dWNrIGluIHdoaWxlIGluIA0KdmlydGlv
X3BjaV9yZXNldCBmb3JldmVyLiBBdCB0aGUgc2FtZSB0aW1lIHdpdGggZ2NjIGlzIHdvcmtpbmcu
DQoNCkhlcmUgaXMgYSBwYXJ0IGRpc2Fzc2VtYmx5IG9mIHRoZSB2aXJ0aW9fcGNpX3Jlc2V0IGZv
ciBib3RoIGNhc2VzOg0KDQpnY2M6DQoNCjAwMDAwMDAwMDAwMDAwMDAgPHZpcnRpb19wY2lfcmVz
ZXQ+Og0KICAgIDA6ICAgYTliZTdiZmQgICAgICAgIHN0cCAgICAgeDI5LCB4MzAsIFtzcCwgIy0z
Ml0hDQogICAgNDogICA5MTAwMDNmZCAgICAgICAgbW92ICAgICB4MjksIHNwDQogICAgODogICBm
OTAwMGJmMyAgICAgICAgc3RyICAgICB4MTksIFtzcCwgIzE2XQ0KICAgIGM6ICAgOTQwMDAwMDAg
ICAgICAgIGJsICAgICAgMCA8ZGV2X2dldF9wcml2Pg0KICAgMTA6ICAgYWEwMDAzZjMgICAgICAg
IG1vdiAgICAgeDE5LCB4MA0KICAgMTQ6ICAgZjk0MDAwMDAgICAgICAgIGxkciAgICAgeDAsIFt4
MF0NCiAgIDE4OiAgIGQ1MDMzZmJmICAgICAgICBkbWIgICAgIHN5DQogICAxYzogICAzOTAwNTAx
ZiAgICAgICAgc3RyYiAgICB3enIsIFt4MCwgIzIwXQ0KICAgMjA6ICAgZjk0MDAyNjAgICAgICAg
IGxkciAgICAgeDAsIFt4MTldDQogICAyNDogICAzOTQwNTAwMCAgICAgICAgbGRyYiAgICB3MCwg
W3gwLCAjMjBdDQogICAyODogICAxMjAwMWMwMCAgICAgICAgYW5kICAgICB3MCwgdzAsICMweGZm
DQogICAyYzogICBkNTAzM2ZiZiAgICAgICAgZG1iICAgICBzeQ0KICAgMzA6ICAgMzUwMDAwODAg
ICAgICAgIGNibnogICAgdzAsIDQwIDx2aXJ0aW9fcGNpX3Jlc2V0KzB4NDA+DQogICAzNDogICBm
OTQwMGJmMyAgICAgICAgbGRyICAgICB4MTksIFtzcCwgIzE2XQ0KICAgMzg6ICAgYThjMjdiZmQg
ICAgICAgIGxkcCAgICAgeDI5LCB4MzAsIFtzcF0sICMzMg0KICAgM2M6ICAgZDY1ZjAzYzAgICAg
ICAgIHJldA0KICAgNDA6ICAgZDI4MDdkMDAgICAgICAgIG1vdiAgICAgeDAsICMweDNlOCAgICAg
ICAgICAgICAgICAgICAgICAvLyAjMTAwMA0KICAgNDQ6ICAgOTQwMDAwMDAgICAgICAgIGJsICAg
ICAgMCA8dWRlbGF5Pg0KICAgNDg6ICAgMTdmZmZmZjYgICAgICAgIGIgICAgICAgMjAgPHZpcnRp
b19wY2lfcmVzZXQrMHgyMD4NCg0KDQpjbGFuZzoNCg0KMDAwMDAwMDAwMDAwMDAwMCA8dmlydGlv
X3BjaV9yZXNldD46DQogICAgMDogICBhOWJlN2JmZCAgICAgICAgc3RwICAgICB4MjksIHgzMCwg
W3NwLCAjLTMyXSENCiAgICA0OiAgIGY5MDAwYmYzICAgICAgICBzdHIgICAgIHgxOSwgW3NwLCAj
MTZdDQogICAgODogICA5MTAwMDNmZCAgICAgICAgbW92ICAgICB4MjksIHNwDQogICAgYzogICA5
NDAwMDAwMCAgICAgICAgYmwgICAgICAwIDxkZXZfZ2V0X3ByaXY+DQogICAxMDogICBmOTQwMDAw
OCAgICAgICAgbGRyICAgICB4OCwgW3gwXQ0KICAgMTQ6ICAgZDUwMzNmYmYgICAgICAgIGRtYiAg
ICAgc3kNCiAgIDE4OiAgIDM5MDA1MTFmICAgICAgICBzdHJiICAgIHd6ciwgW3g4LCAjMjBdDQog
ICAxYzogICBmOTQwMDAwOCAgICAgICAgbGRyICAgICB4OCwgW3gwXQ0KICAgMjA6ICAgMzk0MDUx
MDggICAgICAgIGxkcmIgICAgdzgsIFt4OCwgIzIwXQ0KICAgMjQ6ICAgZDUwMzNmYmYgICAgICAg
IGRtYiAgICAgc3kNCiAgIDI4OiAgIDM0MDAwMTA4ICAgICAgICBjYnogICAgIHc4LCA0OCA8dmly
dGlvX3BjaV9yZXNldCsweDQ4Pg0KICAgMmM6ICAgYWEwMDAzZjMgICAgICAgIG1vdiAgICAgeDE5
LCB4MA0KICAgMzA6ICAgNTI4MDdkMDAgICAgICAgIG1vdiAgICAgdzAsICMweDNlOCAgICAgICAg
ICAgICAgICAgICAgICAvLyAjMTAwMA0KICAgMzQ6ICAgOTQwMDAwMDAgICAgICAgIGJsICAgICAg
MCA8dWRlbGF5Pg0KICAgMzg6ICAgZjk0MDAyNjggICAgICAgIGxkciAgICAgeDgsIFt4MTldDQog
ICAzYzogICAzOTQwNTEwOCAgICAgICAgbGRyYiAgICB3OCwgW3g4LCAjMjBdDQogICA0MDogICBk
NTAzM2ZiZiAgICAgICAgZG1iICAgICBzeQ0KICAgNDQ6ICAgMzVmZmZmNjggICAgICAgIGNibnog
ICAgdzgsIDMwIDx2aXJ0aW9fcGNpX3Jlc2V0KzB4MzA+DQogICA0ODogICBmOTQwMGJmMyAgICAg
ICAgbGRyICAgICB4MTksIFtzcCwgIzE2XQ0KICAgNGM6ICAgMmExZjAzZTAgICAgICAgIG1vdiAg
ICAgdzAsIHd6cg0KICAgNTA6ICAgYThjMjdiZmQgICAgICAgIGxkcCAgICAgeDI5LCB4MzAsIFtz
cF0sICMzMg0KICAgNTQ6ICAgZDY1ZjAzYzAgICAgICAgIHJldA0KDQoNCkFzIHlvdSBtYXkgZm91
bmQsIGluIGNhc2Ugb2YgZ2NjIHJlYWQgb2YgOCBiaXQgZGF0YSA6DQoNCiAgIDI0OiAgIDM5NDA1
MDAwICAgICAgICBsZHJiICAgIHcwLCBbeDAsICMyMF0NCiAgIDI4OiAgIDEyMDAxYzAwICAgICAg
ICBhbmQgICAgIHcwLCB3MCwgIzB4ZmYNCiAgIDJjOiAgIGQ1MDMzZmJmICAgICAgICBkbWIgICAg
IHN5DQoNCmluIGNhc2Ugb2YgY2xhbmc6DQoNCiAgIDIwOiAgIDM5NDA1MTA4ICAgICAgICBsZHJi
ICAgIHc4LCBbeDgsICMyMF0NCiAgIDI0OiAgIGQ1MDMzZmJmICAgICAgICBkbWIgICAgIHN5DQoN
CmluIHNlY29uZCBjYXNlIHdlIGdvdCB0cmFzaCBpbnNpZGUgdXBwZXIgYml0cyB3OCBhbmQgbG9v
cCBmb3JldmVyLg0KDQoNCj4gDQo+PiBUaGlzIGJlaGF2aW9yIGNvdWxkIHBvdGVudGlhbGx5IHJl
c3VsdCBpbiB0aGUNCj4+IHByb3BhZ2F0aW9uIG9mIGluY29ycmVjdCBvciB1bmludGVuZGVkIGRh
dGEgdG8gdXNlci1zcGFjZSBhcHBsaWNhdGlvbnMuDQo+IA0KPiBJIGFtIGEgYml0IGNvbmZ1c2Vk
IHdpdGggdGhlIGxhc3Qgc2VudGVuY2UuIEFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSANCj4gZGV2
aWNlIGVtdWxhdG9yIG9yIGEgZ3Vlc3QgdXNlci1zcGFjZSBhcHBsaWNhdGlvbnM/IElmIHRoZSBs
YXR0ZXIsIHRoZW4gDQo+IHdoeSBhcmUgeW91IHNpbmdsaW5nIG91dCB1c2VyLXNwYWNlIGFwcGxp
Y2F0aW9ucz8NCg0KSSB3aWxsIHJlcGhyYXNlIGRlc2NyaXB0aW9uLCBzaW5jZSB1LWJvb3QgaXMg
bm90IGEgInVzZXItc3BhY2UgDQphcHBsaWNhdGlvbnMiLg0KDQo+IFRvIHRha2UgdGhlIDgtYml0
cyBleGFtcGxlLCB0aGUgYXNzdW1wdGlvbiBpcyB0aGF0IFFFTVUgd2lsbCBub3QgdG91Y2ggDQo+
IHRoZSB0b3AgMjQtYml0cy4gSSBndWVzcyB0aGF0J3MgYSBmYWlyIGFzc3VtcHRpb24uIEJ1dCwg
YXQgdGhpcyBwb2ludCwgSSANCj4gZmVlbCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYWxzbyB6ZXJv
IHRoZSB0b3AgMjQtYml0cyBpbiBoYW5kbGVfaW9zZXJ2KCkgDQo+IHdoZW4gd3JpdGluZyBiYWNr
IHRvIHRoZSByZWdpc3Rlci4NCj4gDQo+IEFsc28sIGlmIHlvdSBhcmUgd29ycmllZCBhYm91dCB1
bmludGVuZGVkIGRhdGEgc2hhcmVkLCB0aGVuIHdlIHNob3VsZCANCj4gYWxzbyBtYWtlIHRoZSB2
YWx1ZSBvZiBnZXRfdXNlcl9yZWcoKSB0byBvbmx5IHNoYXJlIHdoYXQgbWF0dGVycyB0byB0aGUg
DQo+IGRldmljZSBtb2RlbC4NCg0KT2ssIEkgd2lsbCBwdXNoIHYyIHdpdGggcmVzcGVjdCB0byB5
b3VyIGNvbW1lbnRzLg0KDQpCZXN0IHJlZ2FyZHMsDQpBbmRyaWkuDQo=

