Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83876565F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571152.894314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Ho-0001Nc-Qs; Thu, 27 Jul 2023 14:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571152.894314; Thu, 27 Jul 2023 14:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Ho-0001L1-O3; Thu, 27 Jul 2023 14:48:16 +0000
Received: by outflank-mailman (input) for mailman id 571152;
 Thu, 27 Jul 2023 14:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn4a=DN=epam.com=prvs=157204e9ea=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qP2Hn-0001Kv-GV
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:48:15 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c6f1c52-2c8c-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 16:48:13 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RDOnKN001551; Thu, 27 Jul 2023 14:48:02 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2177.outbound.protection.outlook.com [104.47.51.177])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3s3seprdny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 14:48:02 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by PA4PR03MB7343.eurprd03.prod.outlook.com (2603:10a6:102:10d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:47:59 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:47:59 +0000
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
X-Inumbo-ID: 9c6f1c52-2c8c-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVEVq4Kuq/lYLZfMli05m/TOZ+N8XkcP3xLFtDXHdnxgUkfH27mlm6ZgnzRSC7iamLBm+YpV1OjS6oyaPSqLGcwG/DeHxoFFOrEyszLULBZ+ch0pAYL/pW5JOnVvg5EqqfIsnu3D1M+g5XiLgQgWJkZ1n4lxmP30n2vx2aHvSoET0DBtAfTsagdiwigiD/bKKzvw+Sj8B3d9yT6STGqzrJkQk4xQWqtRFpndDEZBS1U/ua1ySI7qTRVfOMRYUs8PVxlIuQAnYAZ6gq16+4A1mc2ScpqynOJrREZ86Ux5WSDm/4H73z9Hhawfrhd4zc01SyjZdx5gv3Y6haUELizZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQXDzWhTz+hKtLvoWOOEmrmFD5eb4dULzLkuLmrNXSQ=;
 b=YhwrNGI1MJrV4g35JMANEYdkexAcf/sx0C5xEpcQUpYJ5HxbhUfUTaP5g9jj5OZuVxx4SLXs8F2ZwykivFwJpDgZOqFIJWDm+XsuSVxbvvsNnQ38DQCFFPH6jwEuq2OglaJPZkopCd39GuaDyTZT1i2z4+CxTdiU0vf4MqQNwB6rY4zckR7TAsKbXklvNkpf7SBEKwsEHcjEmE9yZnVXKLlkh+5UiHZHSRLaSkr/4oJ1G+e6WEYk/rrsHjdcmMjgtqtTjswHQnv8vXF4iroHuu7z1kQh6c9TnpvAVstb/sVXUM5yTlvdNGvn2RD6AsD9UuvH1IOatmlfPGuuwoiEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQXDzWhTz+hKtLvoWOOEmrmFD5eb4dULzLkuLmrNXSQ=;
 b=HXDYKOLFV7F3f0LbUIfPqI/k7WXw3virTElKXJCYBSlwsooqivlq+pDo6sgAa8PjeiSFPsaVJlqouy9TMe7rA6U4/Cmef7HIOcoGYXjcZXCCQMXvHD4k/yIYNt2AMnYvCR7daDNDMNR21BxnvoYKKWSCQG93eGklVLqNZo8exLvaN1HzuhWRS7IpnM6FNT+ReLQWpQjGNIlduU5MYdCvSPatZBpeCKPe4cxcMM8/Bsxm6bwFgq5QKhqontSm7M2NgKJ4+/KUxYxv4KRI4UH+04C19d+im8KpCBpZWUWjU0Jsipc4mmBGqIqLLyht7m8WYBYSZyduMJUo13FTtDvtgw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Anthony
 PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Viresh
 Kumar <viresh.kumar@linaro.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Topic: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Index: AQHZv8uYlQiykVHkhkC1aQss9HQu9q/MIX0AgAAGYQCAAYcXAIAABB+A
Date: Thu, 27 Jul 2023 14:47:59 +0000
Message-ID: <1fbb1e15-8e46-53ae-b1e0-5eb16c35b635@epam.com>
References: <20230726141459.985463-1-olekstysh@gmail.com>
 <969aacb8-a608-be01-f0f5-34fb1cc61d62@suse.com>
 <35a1988d-94a5-9f2e-2478-ab08268f02b0@epam.com>
 <f8c151e4-1e0a-1465-0d5e-be55e25df818@suse.com>
In-Reply-To: <f8c151e4-1e0a-1465-0d5e-be55e25df818@suse.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|PA4PR03MB7343:EE_
x-ms-office365-filtering-correlation-id: d8192417-e86a-4aa4-c6d4-08db8eb078d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gEesf5Ezm90ieO1mRoyKLHHRxNnVIjW3EDssSf75Q5SYaw7fbw7Rw9mcM/kyesd6r8mm1QB4rN8STgGNSi1sFBhZjDvxfAsYe4PCGGJt4abM/iJ6z/cS8EcSsYU8U24yi32o4vjn45mENYDsmEQPn0RAF2OGTR++vxCpswrbfR6Vfxd18ZIllx6ePWFlkqStkkzhFFDZIZ+LpglG/QoyaLVduFd+DLrwYMY4GCOqzqFWrGyG141NOw0JnUlFyc2bCkUm4XofOgKFXW33DfKIi6KlU/pqxovWIv/QY3KL+lIrD06WBECyiwiPbIMRBRmn+cWnNzy7V3B68+wlvWeWHCFKEE3+A8xXPr+BjKRVDe6orJyuTGw7Q9RsFi6JEmavRoaE5Ft2kiEbL+HOn/3IvPH7SUVYS/ZYeDLS8bpi/j6l3Yc3xQJzX3B9fLptaV41Sa6iQbzXkfDccyPKhRZrHPb3XSRHUWNJnx1jJSBn1ON6q36cTkA3+bSmE1g0BzwdKzk15r+f664E/LI+ilvbAUvNORjJhL48HdO8b/4qfMUBOzhAMH9YdR1NpgkRSKjIdQdxCHTCpVRUY+j0R0hgmy2xAIDNxjrsDGZPuM6Tc0k6vevC/Z8tUzES5ufF9Gld0KFmo5L4T3SE1A/zpJtBkEHxgaeFkyfXRYdjHftGlOg+RMwTI4yRUcm+4/7diCPZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(71200400001)(6486002)(478600001)(83380400001)(53546011)(6506007)(26005)(6512007)(4326008)(6916009)(66446008)(64756008)(38100700002)(122000001)(76116006)(54906003)(66476007)(91956017)(66946007)(66556008)(186003)(31686004)(2616005)(5660300002)(38070700005)(316002)(8936002)(8676002)(41300700001)(2906002)(31696002)(86362001)(36756003)(101420200003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZlVrN1cyTnp5MXRPWjA0VGNKQk1xbEJQdTBnMGRoSmZhSkpPZ1BqRE10OTRT?=
 =?utf-8?B?cFNpUHZ5VmFIYVVRdEY4Z2dPdjE1OEIvZDBveTF4dktKU1VPN1N0dm5WZy9K?=
 =?utf-8?B?NXpITHd6QlBLd1d6ZDJTM1JKSS91UlhrNkplbXZCQ04yd1BGcmVqd1BoZUcr?=
 =?utf-8?B?TmVicThkSkcrdnpTbnpGZ3ppU25NeGZWem9jOEdJd1NxcFNkQWh1TkE5M2Nk?=
 =?utf-8?B?b1c2bXZGYWZxY2lZcGlTQTYxVnV5SVZzU3RiUUtFMjJIUGpjb3RWZDZhQ09a?=
 =?utf-8?B?RmR2dzFXL05oRTdwL2ErVlUwMnNzYzljWVZaSURMb0ZzbUhmeTVza09SQVNB?=
 =?utf-8?B?YWYyV0ZZV2hDTUlRdVM2T2g1MVU0UCtGYUhmZjdSRHF0TlNUNVJGSlpEajJP?=
 =?utf-8?B?OUF1d3BaSHZaVHVEUk8yQTBPNWJ4S2dxUERwd0Z2eHloUkFUQStSVUlkSzZT?=
 =?utf-8?B?RTZUSC9lNTVXM1B6NGdqajVQeE5Hb0F4Z280TjlVell3V1E1Y01TODFFVVNU?=
 =?utf-8?B?QkhOVE5QMFFYUmdaTUFTd0JWaTYwQmFneWJNU1haMTFTZUQ5a2VoczlKQUtu?=
 =?utf-8?B?ekhCZ3kzK0tqSm9YUVA3a3dmWGtMSGx0akNSTkhxRjNPNjVtYi9BTUl2c2tE?=
 =?utf-8?B?K09FOHNac3o2Rk1mL0JCVVR0SDhiZkt6WHF4T3JIYThqa2NiVzhBRlV2VTZQ?=
 =?utf-8?B?djlwTVZvYXlacFQrLzR3c3U1QUpodmRZbU9PQXF4ZDd0eTVIWFFkOHBqalhj?=
 =?utf-8?B?TGh3YmV5M1NCdk9vTFM4d0hESy9qVERKTFN1bXVxVElQdmU2V3JlWXE3Y25R?=
 =?utf-8?B?VVMzRVdVQjlnTlZpb2QvZnBHTEZIVlhjdjlGVi9zQUhrdHFVVmFDRzBtRzU4?=
 =?utf-8?B?NzZZTVE0ai9SMTdscFB5VDVaYTh2OVpLL1gzSXBoWTZBb1hXL00za0wrRGUy?=
 =?utf-8?B?cGNqU3YrMHA0NGpiQVJqZUFrNHcycG5aUE51M1JsNXhxUGRpWWJGWVN0NVVz?=
 =?utf-8?B?Z2FrTjZjNmM0MExaN296T3dvaWcwQ1ZVRjZDblFLSTVrYnFnQWxEbWZHcmFa?=
 =?utf-8?B?eHN4ZUFieFIvTjVVV3hHU2lxbnV3cW94Y2EvM2VlVlRpV3VKNW9LdE51L0Z4?=
 =?utf-8?B?ckY4a2trQ1REZXlKYitWTm53aHo2SGhocVhZUk1aVm1lWU5keDFqMU4yQVd1?=
 =?utf-8?B?Z29abndjOFNQMklmK05RVHZiUWVORWNFVGJmdlJjRVhwTXNVNThnaFZEMnI3?=
 =?utf-8?B?UmJXVms0RFdGdmhZODFVeEFwQXVNdmNzMVRpL2ZMeVByZ3FxazU3U3hLMjY0?=
 =?utf-8?B?UnAwQVJacjFxeExLVWpxZHNBNmNEeWVPbUpBdGwwb21jUWV4dHNvRG5ON0M5?=
 =?utf-8?B?WDNWZUt0c1pRemlraHYrVGZXb041S1FiZlQrQndlWnhYVnlsN2c4eE03Y2s5?=
 =?utf-8?B?UWhnSXRSbE0vVWhZbC9KZjNaQnVOc2dDS2NTeThwQjFTS1BaRjh0RXNhZlMz?=
 =?utf-8?B?V3laa0t5ZExPNjA0cjJQaW1KSGs4V2JvaWlGRDJTMDFabjJYZW1XOTU3OUNP?=
 =?utf-8?B?UW1MUng4OVowcm5Ea3VYOHgyNDdJYkppeUY5SHFoejFJcm9HVVh5VXNleFhm?=
 =?utf-8?B?MFNOVFU2U25VWk9DZDdTTHRoQjEwOWx0V1I3YklibGtkb2tpekRHaXVjR0E1?=
 =?utf-8?B?TUVLTlRrN0NBbEUvUG4xajlPS2luV0JobnI4bGVsVUZTWE1IbHp6K2V0Tlg5?=
 =?utf-8?B?WmlDajBNZ2pva0s0MzJpQVNyUytJSWRqTHJFQSswQVlHRGJSNjBFcHpBTGxG?=
 =?utf-8?B?R3dlT1l0b2ZDLzh0ZVJXSlFVZEM1YkF3SWVLc1JRTndSaWxmbnY3WmNSc3pU?=
 =?utf-8?B?dm8yc3lkbGJTMWo2SnRUdzFZN2hRa0hweCs1ajQ3dHJBT2tET0EyMlc1YzZ3?=
 =?utf-8?B?dmdSVWM1UWZXVUxremdhZ2U0a3BkNjUyRFZpN3lWU0czbjFOYzFBbkFVSEdY?=
 =?utf-8?B?SUlqa2JQUWVvWGlTckNpSFRrY0V6c0tMYTNRNFE4VVozTnBLU2MvQVRLYjlB?=
 =?utf-8?B?WlM5TXdXLzhaY2hEYnEyMkpZZlFzZ2dEQUhlZlArdWZWRE1md0EyZGtxdDFu?=
 =?utf-8?B?SFNZZnNCaGJMbjJDclh4M0RuQ1dQSjVEQ3FldjlhVnpkUkx1dEg2aUR4aEhw?=
 =?utf-8?Q?BRNuIIaHoOz3QsnneubuwnU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C7CFA5CF2770D4BB1401386D002B398@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8192417-e86a-4aa4-c6d4-08db8eb078d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 14:47:59.5708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Efb2NmqAgTcN2zAFINUjPcICkN7Q9sVS+IFh9eXr+PnkXDD4EUN6zZAFUOGUkQ1mE8adNWZI7lEPynkMZA9tPlOGBnx1poLEU4h9414tN40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7343
X-Proofpoint-ORIG-GUID: Mp0UuiVwkq-4u9XLelp-DhrnfRa6vTAt
X-Proofpoint-GUID: Mp0UuiVwkq-4u9XLelp-DhrnfRa6vTAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270132

DQoNCk9uIDI3LjA3LjIzIDE3OjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCg0KSGVsbG8gSmFuDQoN
Cj4gT24gMjYuMDcuMjAyMyAxNzoxMywgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+PiBP
biAyNi4wNy4yMyAxNzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjYuMDcuMjAyMyAx
NjoxNCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBU
eXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gV2l0
aG91dCBpdCBiZWluZyBwcmVzZW50IGl0IHdvbid0IGJlIHBvc3NpYmxlIHRvIHVzZSBzb21lDQo+
Pj4+IGxpYnhsX19kZXZpY2VfdHlwZSdzIGNhbGxiYWNrcyBmb3IgdmlydGlvIGRldmljZXMgYXMg
dGhlIGNvbW1vbiBjb2RlDQo+Pj4+IGNhbiBvbmx5IGludm9rZSB0aGVzZSBjYWxsYmFja3MgKGJ5
IGRlcmVmZXJlbmNpbmcgYSBwb2ludGVyKSBmb3IgdmFsaWQNCj4+Pj4gbGlieGxfX2RldmljZV90
eXBlJ3MgZWxlbWVudHMgd2hlbiBpdGVyYXRpbmcgb3ZlciBkZXZpY2VfdHlwZV90YmxbXS4NCj4+
Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90
eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9jcmVhdGUuYyB8IDEgKw0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3JlYXRl
LmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2NyZWF0ZS5jDQo+Pj4+IGluZGV4IDM5M2M1MzU1
NzkuLmM5MTA1OWQ3MTMgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
Y3JlYXRlLmMNCj4+Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9jcmVhdGUuYw0KPj4+
PiBAQCAtMTg4Nyw2ICsxODg3LDcgQEAgY29uc3QgbGlieGxfX2RldmljZV90eXBlICpkZXZpY2Vf
dHlwZV90YmxbXSA9IHsNCj4+Pj4gICAgICAgICZsaWJ4bF9fZHRkZXZfZGV2dHlwZSwNCj4+Pj4g
ICAgICAgICZsaWJ4bF9fdmRpc3BsX2RldnR5cGUsDQo+Pj4+ICAgICAgICAmbGlieGxfX3ZzbmRf
ZGV2dHlwZSwNCj4+Pj4gKyAgICAmbGlieGxfX3ZpcnRpb19kZXZ0eXBlLA0KPj4+PiAgICAgICAg
TlVMTA0KPj4+PiAgICB9Ow0KPj4+DQo+Pj4gICBGcm9tIGRlc2NyaXB0aW9uIGFuZCBuYXR1cmUg
b2YgdGhlIGNoYW5nZSB0aGlzIGxvb2tzIGxpa2UgYSBGaXhlczoNCj4+PiB0YWcgd291bGQgYmUg
d2FycmFudGVkLg0KPj4NCj4+IExvb2tzIGxpa2UsIHllcy4gVGhhbmtzLg0KPj4NCj4+IEkgZ3Vl
c3MsIHRoaXMgc2hvdWxkIHBvaW50IHRvIHRoZSBjb21taXQgdGhhdCBpbnRyb2R1Y2VkDQo+PiBs
aWJ4bF9fdmlydGlvX2RldnR5cGUNCj4+DQo+PiBGaXhlczogNDNiYTUyMDJlMmVlICgnbGlieGw6
IGFkZCBzdXBwb3J0IGZvciBnZW5lcmljIHZpcnRpbyBkZXZpY2UnKQ0KPiANCj4gSW4gbGlnaHQg
b2YgQW50aG9ueSdzIGZlZWRiYWNrIEknbSBub3cgdGhpbmtpbmcgdGhhdCBubyBGaXhlczogdGFn
DQo+IHNob3VsZCBiZSBoZXJlLCBhcyBpcyBiZWluZyBjbGFyaWZpZWQgYnkgdGhlIGFkZGl0aW9u
IHRvIHRoZQ0KPiBkZXNjcmlwdGlvbiANCg0KSSB3YXMgYWJvdXQgdG8gc2VuZCBWMiB3aXRoIHRo
ZSBhZGRpdGlvbiArIEZpeGVzIHRhZyBhbmQgbm90aWNlZCB5b3VyIHJlcGx5Lg0KDQpCYXNpY2Fs
bHksIEkgYWdyZWUgdG8gbm90IGFwcGVuZCBGaXhlcyB0YWcsIHRoZXJlIGlzIG5vdGhpbmcgYnJv
a2VuIA0Kd2l0aGluIGN1cnJlbnQgY29kZSBiYXNlIHJlZ2FyZGluZyB0aGF0LCBhbiBhZGRpdGlv
biBjbGFyaWZpZXMgdGhlIHN0YXRlIA0KYW5kIGRlc2NyaWJlcyB3aGF0L2hvdyBtYXkgYmUgYnJv
a2VuLg0KDQpJIHNob3VsZCBoYXZlIG1lbnRpb25lZCB0aGF0IGZyb20gdGhlIHZlcnkgYmVnaW5u
aW5nLg0KDQoNCih3aGljaCBJIGd1ZXNzIGNhbiBiZSBmb2xkZWQgaW4gd2hpbGUgY29tbWl0dGlu
ZykuDQoNCkl0IHdvdWxkIGJlIHJlYWxseSBnb29kLg0KDQoNCg0KDQo+IA0KPiBKYW4=

