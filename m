Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB91440BF5E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 07:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187224.336016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQNaQ-0001kj-Ma; Wed, 15 Sep 2021 05:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187224.336016; Wed, 15 Sep 2021 05:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQNaQ-0001hl-JI; Wed, 15 Sep 2021 05:35:58 +0000
Received: by outflank-mailman (input) for mailman id 187224;
 Wed, 15 Sep 2021 05:35:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFB7=OF=epam.com=prvs=9892afeb01=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQNaP-0001hf-8B
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 05:35:57 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cca51e80-15e6-11ec-b4d9-12813bfff9fa;
 Wed, 15 Sep 2021 05:35:56 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F5D6DE025402; 
 Wed, 15 Sep 2021 05:35:53 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b39ff06v0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 05:35:53 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3472.eurprd03.prod.outlook.com (2603:10a6:803:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.26; Wed, 15 Sep
 2021 05:35:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 05:35:48 +0000
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
X-Inumbo-ID: cca51e80-15e6-11ec-b4d9-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO+mc9O8Kx7jYbjiJiD3w87d5prvrEeTv6KFMVHRWKIKYQFMlN+Yv7TiLZbDUEvg3CUryfTGktzQVonEshCyeEQIL0MwDFguuaOclHyzTkfshgeGcitKQGAChR5J6ebodxbrAsL9aej72+MSMgppPr1B5V1WniyMtQEp7lEvbEuZcdUxFiDVbY8MdRmqjKzfxbqPjrK7xG9bgj7BRK4XOuwqaJlA2M7qF4jcMUWsAhIIJ9PJyK5c+/yPbvLnl/i5WBJbsqoIsewwyq8hVSSDwhTMOozNWs8hHoCA4FlKUIG6oe4Nye6vQVdP2+Ix58C9hSTqFkaTP0LsT3VEFQBmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vPpE+tz+LC0WamEI+NnBHQ3+T2W7EesEGE/fp236j10=;
 b=FIZiGAvSfY7bK2d6HDLeRtaP57MmkxuMvzDbT2DSiBZNDAITpVio22zwD2gJ6TI9u0tuwrXK8pJB0fCW1DEqa1fqrdxUHVqbo3fA2doGkqHDqFq8We6jsJO635Iu9jJhZ9brmF12E3fVqJ7/6PEEdImPac3br/+8mpX10ypmYrmfbsCHUtohodvdU3QRwN4mR8jKjM54k1JuNYb/5xvq/K2MtUPiqjmgnH6OUGb/O1rrIpG9JCigDtmUHuL1++LM1s1ww0LmIP8pt2zK328v7GCwKBkxYkRu6dNVQ7vjY3PHCG2lOTRM9IqAC9KyDS7C1zbMucFmX+nIm/HJF0ZoBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPpE+tz+LC0WamEI+NnBHQ3+T2W7EesEGE/fp236j10=;
 b=FwBtxYOZHKdn9MbSVzn317TVlxr77Lz4BpyLwOZmYjzqotrLEgzz9djADhNOrWI1/6jNzZ4kex8rOxMJQ0rl5VBIKR3QmGJGffueAzRHcq3uZsB6fHuBqPLSOyMv9COx+SEDEaS9w0iZ5qa8P+UDt7WCfJ56sxDqXt5d3Cw8MCB8qGiwG+4IfwP92AmMjfkpuFwYrYNh7al5es/u2GL5sQo3xC6cPmPpxAqdTDZOyNzz99OiWxnVTYfgXHopw72Z3i1NgLNcfRSIAVlo48yWD7z4OEEsvp3f/+pFjS+L1x3aaHhPZP+t4gEvIU7acuYmTEISox9Hdmo9l17Jy2NB3A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Rahul Singh
	<rahul.singh@arm.com>
CC: Julien Grall <julien.grall.oss@gmail.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index: 
 AQHXoJ50hf+zXQhc2ka7YfmmERKX+aucB06AgAE4wYCAAAtRgIAADDiAgAARZwCAAFsJAIAAFA4AgAO3eICAAc7agIAA860AgABTv4A=
Date: Wed, 15 Sep 2021 05:35:48 +0000
Message-ID: <ee38bc53-c590-24d2-9061-3d4fd33f58bd@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <684b3534-40eb-add7-f46e-c6258904757b@xen.org>
 <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com>
 <3ecfc742-b720-0381-dbd8-7147615494c8@epam.com>
 <1e71ebba-b2d3-1201-05ac-e035f182226f@epam.com>
 <alpine.DEB.2.21.2109141731410.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109141731410.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5070c9f-9e1b-4bcd-42f2-08d9780aac28
x-ms-traffictypediagnostic: VI1PR0302MB3472:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB34723F08504615DB0F5B46F4E7DB9@VI1PR0302MB3472.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 S2YlYZ62Do98mBAVopKsmT8HUoJm38R34lWNyeYNsNU9tz3SIL9G6jBHqbrj2Uie6EfNZHeJPixvWl3jHpuPuiR86px9iAlheJE2BfT8X70fmKzIzkxrkGxjpqXRinmaU5j0MfDakn1RDnGaWEV/yy39SXBxtsPi9Vmy42ZQrn9uCDhUmur82kmtcy8WBc380fmTblrUzkft89Znv4ByifA17WJkZgxs5bWffVB9s32Y2Mi0mPRAM7f4+b2S+Ez/kyFZdeUmOyLgk9PwAch9twnML5rhXshH1j7ebWCB8+TW2PnHTnF8L/xeVg78+3baNzFYF22fcNioqdo8UqEBGdJe1oNNO8a6UL5T9YHEbun4ASY/+kA+cLVgxRguaeFPovOOkDxXL4cgCwOg0AriQmYUKM7PSpCWK6bJdHGzn4kVf05cpF3/9bZwb4uei0hgvUfZGp0I9C4qYezusWXRDGfA8Kr0JSJk+tTCRhz4xdi1k3/55FgTlx+81dIqlZogFsYmjWrWQ1M+OlB2YalzpK4Tyz3c4YUhXWuUeWS7AoUW56j8GBOBQcpn/2Xf9sBaEzkChil2y5aOEk5mFxHRSGcCKVAY6L8oqVFL/fgoShpYhiih6aXIrxsNOegxeHLkxnplkuaXnBq+K9/HwlhB1M1iEAdj9tBEw1Tj0SjPQrSHQheLqibCXpnfWG1s6zy5CdGFOQEPbr8PQuWr8FAffeTKcv8DxO5ImD4q/6y8frbiDeC4mo+JaHXNGCaIBF8E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(8676002)(478600001)(316002)(66946007)(71200400001)(5660300002)(36756003)(26005)(122000001)(31686004)(6512007)(66476007)(83380400001)(64756008)(38100700002)(31696002)(55236004)(91956017)(53546011)(66556008)(6506007)(8936002)(54906003)(66446008)(2616005)(86362001)(76116006)(6486002)(38070700005)(4326008)(2906002)(110136005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RGQ5L1Rack9mcVA2QmZFUFBsNG1hSk04dnRMbFIzeEpDdkd6VkhpcEIwSTE2?=
 =?utf-8?B?NUJRb2NFbnpwT0YyaXBzM0M3TEdpSTNJaWVCaTY5QXNzVFViUFZSVnY4TXp6?=
 =?utf-8?B?NzRvSzl1VmdNbWpNVkMzczB0WWFtZTBWTnpZSmcvTUJRSGltMk1SVGxVWXRK?=
 =?utf-8?B?VzU4WG1NSnhaMHBGK3JpNzFCSk9mZHJmdS9NV2d1bmx1R2RNM050S2kyU1lx?=
 =?utf-8?B?Ym8rZklKV1Z2OW5lVHNmSCtLeDRES2g0WUUvZklKS0xSWk9pVnViQ002aTZC?=
 =?utf-8?B?d1dkaWV1VEw3VGQ4eXJKT2JSK1JUeWxvRWhYa082bUc1Qm1FblpkdlRLcWpy?=
 =?utf-8?B?TDZrcUVPNkJJeFpJdTZUU1BpMDcveVlHK3BFbFk2QkJDM0RRN29GblRlWks5?=
 =?utf-8?B?bHhYaUNDMjF5NWswUEppZDBHb0lRaWlEL2x4R0kwME44OTdKWW82REcxRTJZ?=
 =?utf-8?B?dUxDb1VJTnZDdXpvVmNycjlVMHZLeEJPV1FSenRHazZ5NmdmNWU4NWFCd2VH?=
 =?utf-8?B?REEzSW1PdmNGZUZvcEFKQktpNWpQUDNjaDZMdElIR0hyNlZqcS9DZEdIY3VR?=
 =?utf-8?B?ekE4RFkxM0dPeU1sbXpGZGF2bWZ3aHlKVVRpMzRxSTAya2VrWWFaakdTSXhD?=
 =?utf-8?B?a0lPenVCdzVmZjdnN1ljVkE2Y2ZzdDBjZUxTT0JTQXZxazU4QzMzTTFMaTV1?=
 =?utf-8?B?RUNCWW9OVUk5RkVPcU5pVDdBUjNRVzhKa2U3bmF0dkZvQkRxNjJ0VjhHVkpT?=
 =?utf-8?B?Sy9DVnFRQ0pSRFVLcEU4dW1KTXlFRHFCY3lyNUJ0ZGFQc0FEa3Y3WVNyR05D?=
 =?utf-8?B?N3pRcXowZjVFSE5UaTZDUmZPOUh1RUl4Q1ViMDVxRGUzaURsak15L05YSzcx?=
 =?utf-8?B?YmdjNy9pcm93a3JHUmxoc0tGU1kvd3RPUEVEd09BODZ3UUxBQ3BwNjNxaEJi?=
 =?utf-8?B?cjZnRGgvWTVTbURHOXNpMGZmV2dZMW1DVW1CN3BNS3ErU0FKWWI5U1NubGIv?=
 =?utf-8?B?SW1EZk1zQWR1ZXRBOUxuQ1V2RVJEVGhOOFZsN3MyK0lnZWZvZk02MkE2RWRK?=
 =?utf-8?B?eUp4V2NqeEFPK25aQmsyelZpUHAxd1dqUG5wQXcrOHdNUnlVcFVXRTU3ZDRY?=
 =?utf-8?B?VE5DbGhqdHE3K0I2VHJaYWVFQ0JiZmJGU21wR251ODJvdUVFOHcxSnB4TlVJ?=
 =?utf-8?B?bDRMTzVqUEF6QUQxcWtvaUNaZUZpWHAxVmM0a3lKcG5sMzQvL0x6SUFWSEtw?=
 =?utf-8?B?YnozenJ4eCtJVDRSdVRTSC9LcVVwWXg2VkkvV1VvaFBoTjFROEZjMlFHRFQ1?=
 =?utf-8?B?Y25vWkxlaTV2ZXdqc01PKzZNU3BzbjcyTHA2aUo5bVRmNldIaG91Z0VXcFlL?=
 =?utf-8?B?Q1d6Zyt4SWpNaFAxeFBLZmRFOEVWTjUwN3VsdVVEOW9CTlhBL00xSzZKN0Ny?=
 =?utf-8?B?QTdMMm5hSENIc1ZlQjdLT0w1Rm9UbE1pOGtBUTEwWUs0L0dHVmw0R0dCeFdH?=
 =?utf-8?B?d2ZrY0s1WThFOWhBUGpPdldoWEVNWWVkcUN5c2hrR0NheW82djVIWndCZ2Nt?=
 =?utf-8?B?Z1RaYkhlOFhPOTkvNTdHNW11YitSZ24rQy9jVjVUVy9xSklzZFZDeEdGV2ZH?=
 =?utf-8?B?dlc3dGRzYi9IZXM5VE90WWlvenhoYmlIVm4zTkl0Skg0cDRCT1RDRFVOa0JG?=
 =?utf-8?B?UWFRbWFHTlRjQ01EYlV5NDBSZytlVk4wL0t6LzBBL0pSakY0ajREM1o3UG04?=
 =?utf-8?B?V2cyRjF6UEtJOXZYVk1aZXRFck0vRitJVFNuazduVmlGMjFtY0FPTjhwTmxi?=
 =?utf-8?B?bE8rZS9QQjVycFAyMnJuUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <902E2E3EF1FCC44AA10C63136363F766@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5070c9f-9e1b-4bcd-42f2-08d9780aac28
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 05:35:48.1806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULPz0j6W+S1eBSYzxzNyAS3GQB/Ygpj4YInngC7fjTP/sa475nUYzqb72W+Lhe69lSnz3jXHF+aDEuGeN1OmtUP88AM6k5VgJdFFIPWDV2jJQGVoWQIrMIARgnfP4iPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3472
X-Proofpoint-GUID: IgkAErY10S5bHY-ghGWHjmbI1RDyXjMT
X-Proofpoint-ORIG-GUID: IgkAErY10S5bHY-ghGWHjmbI1RDyXjMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_10,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150035

SGksIFN0ZWZhbm8sIFJhaHVsIQ0KDQpPbiAxNS4wOS4yMSAwMzozNiwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOg0KPiBPbiBUdWUsIDE0IFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IFdpdGggdGhlIHBhdGNoIGFib3ZlIEkgaGF2ZSB0aGUgZm9sbG93aW5nIGxv
ZyBpbiBEb21haW4tMDoNCj4+DQo+PiBnZW5lcmljLWFybXY4LXh0LWRvbTAgbG9naW46IHJvb3QN
Cj4+IHJvb3RAZ2VuZXJpYy1hcm12OC14dC1kb20wOn4jIChYRU4pICoqKiBTZXJpYWwgaW5wdXQg
dG8gWGVuICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1dCkNCj4+IChY
RU4pID09PT0gUENJIGRldmljZXMgPT09PQ0KPj4gKFhFTikgPT09PSBzZWdtZW50IDAwMDAgPT09
PQ0KPj4gKFhFTikgMDAwMDowMzowMC4wIC0gZDAgLSBub2RlIC0xDQo+PiAoWEVOKSAwMDAwOjAy
OjAyLjAgLSBkMCAtIG5vZGUgLTENCj4+IChYRU4pIDAwMDA6MDI6MDEuMCAtIGQwIC0gbm9kZSAt
MQ0KPj4gKFhFTikgMDAwMDowMjowMC4wIC0gZDAgLSBub2RlIC0xDQo+PiAoWEVOKSAwMDAwOjAx
OjAwLjAgLSBkMCAtIG5vZGUgLTENCj4+IChYRU4pIDAwMDA6MDA6MDAuMCAtIGQwIC0gbm9kZSAt
MQ0KPj4gKFhFTikgKioqIFNlcmlhbCBpbnB1dCB0byBET00wICh0eXBlICdDVFJMLWEnIHRocmVl
IHRpbWVzIHRvIHN3aXRjaCBpbnB1dCkNCj4+DQo+PiByb290QGdlbmVyaWMtYXJtdjgteHQtZG9t
MDp+IyBtb2Rwcm9iZSBlMTAwMGUNCj4+IFvCoMKgIDQ2LjEwNDcyOV0gZTEwMDBlOiBJbnRlbChS
KSBQUk8vMTAwMCBOZXR3b3JrIERyaXZlcg0KPj4gW8KgwqAgNDYuMTA1NDc5XSBlMTAwMGU6IENv
cHlyaWdodChjKSAxOTk5IC0gMjAxNSBJbnRlbCBDb3Jwb3JhdGlvbi4NCj4+IFvCoMKgIDQ2LjEw
NzI5N10gZTEwMDBlIDAwMDA6MDM6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIp
DQo+PiAoWEVOKSBtYXAgW2UwMDAwLCBlMDAxZl0gLT4gMHhlMDAwMCBmb3IgZDANCj4+IChYRU4p
IG1hcCBbZTAwMjAsIGUwMDNmXSAtPiAweGUwMDIwIGZvciBkMA0KPj4gW8KgwqAgNDYuMTc4NTEz
XSBlMTAwMGUgMDAwMDowMzowMC4wOiBJbnRlcnJ1cHQgVGhyb3R0bGluZyBSYXRlIChpbnRzL3Nl
Yykgc2V0IHRvIGR5bmFtaWMgY29uc2VydmF0aXZlIG1vZGUNCj4+IFvCoMKgIDQ2LjE4OTY2OF0g
cGNpX21zaV9zZXR1cF9tc2lfaXJxcw0KPj4gW8KgwqAgNDYuMTkxMDE2XSBud2xfY29tcG9zZV9t
c2lfbXNnIG1zZyBhdCBmZTQ0MDAwMA0KPj4gKFhFTikgdHJhcHMuYzoyMDE0OmQwdjAgSFNSPTB4
MDAwMDAwOTM4MTAwNDcgcGM9MHhmZmZmODAwMDEwNGI0YjAwIGd2YT0weGZmZmY4MDAwMTBmYTUw
MDAgZ3BhPTB4MDAwMDAwZTAwNDAwMDANCj4+IFvCoMKgIDQ2LjIwMDQ1NV0gVW5oYW5kbGVkIGZh
dWx0IGF0IDB4ZmZmZjgwMDAxMGZhNTAwMA0KPj4NCj4+IFtzbmlwXQ0KPj4NCj4+IFvCoMKgIDQ2
LjIzMzA3OV0gQ2FsbCB0cmFjZToNCj4+IFvCoMKgIDQ2LjIzMzU1OV3CoCBfX3BjaV93cml0ZV9t
c2lfbXNnKzB4NzAvMHgxODANCj4+IFvCoMKgIDQ2LjIzNDE0OV3CoCBwY2lfbXNpX2RvbWFpbl93
cml0ZV9tc2crMHgyOC8weDMwDQo+PiBbwqDCoCA0Ni4yMzQ4NjldwqAgbXNpX2RvbWFpbl9hY3Rp
dmF0ZSsweDVjLzB4ODgNCj4+DQo+PiAgIEZyb20gdGhlIGFib3ZlIHlvdSBjYW4gc2VlIHRoYXQg
QkFScyBhcmUgbWFwcGVkIGZvciBEb21haW4tMCBub3cNCj4+DQo+PiBvbmx5IHdoZW4gYW4gYXNz
aWduZWQgUENJIGRldmljZSBnZXRzIGVuYWJsZWQgaW4gRG9tYWluLTAuDQo+Pg0KPj4gQW5vdGhl
ciB0aGluZyB0byBub3RlIGlzIHRoYXQgd2UgY3Jhc2ggb24gTVNJLVggYWNjZXNzIGFzIEJBUnMg
YXJlIG1hcHBlZA0KPj4NCj4+IHRvIHRoZSBkb21haW4gd2hpbGUgZW5hYmxpbmcgbWVtb3J5IGRl
Y29kaW5nIGluIHRoZSBDT01NQU5EIHJlZ2lzdGVyLA0KPj4NCj4+IGJ1dCBNU0ktWCBhcmUgaGFu
ZGxlZCBkaWZmZXJlbnRseSwgZS5nLiB3ZSBoYXZlIE1TSS1YIGhvbGVzIGluIHRoZSBtYXBwaW5n
cy4NCj4+DQo+PiBUaGlzIGlzIGJlY2F1c2UgYmVmb3JlIHRoaXMgY2hhbmdlIHRoZSB3aG9sZSBQ
Q0kgYXBlcnR1cmUgd2FzIG1hcHBlZCBpbnRvDQo+Pg0KPj4gRG9tYWluLTAgYW5kIGl0IGlzIG5v
dC4gVGh1cywgTVNJLVggaG9sZXMgYXJlIGxlZnQgdW5tYXBwZWQgbm93IGFuZCB0aGVyZQ0KPj4N
Cj4+IHdhcyBubyBuZWVkIHRvIGRvIHNvLCBlLmcuIHRoZXkgd2VyZSBhbHdheXMgbWFwcGVkIGlu
dG8gRG9tYWluLTAgYW5kDQo+Pg0KPj4gZW11bGF0ZWQgZm9yIGd1ZXN0cy4NCj4+DQo+PiBQbGVh
c2Ugbm90ZSB0aGF0IG9uZSBjYW5ub3QgdXNlIHhsIHBjaS1hdHRhY2ggaW4gdGhpcyBjYXNlIHRv
IGF0dGFjaCB0aGUgUENJIGRldmljZQ0KPj4NCj4+IGluIHF1ZXN0aW9uIHRvIERvbWFpbi0wIGFz
IChwbGVhc2Ugc2VlIHRoZSBsb2cpIHRoYXQgZGV2aWNlIGlzIGFscmVhZHkgYXR0YWNoZWQuDQo+
Pg0KPj4gTmVpdGhlciBpdCBjYW4gYmUgZGV0YWNoZWQgYW5kIHJlLWF0dGFjaGVkLiBTbywgd2l0
aG91dCBtYXBwaW5nIE1TSS1YIGhvbGVzIGZvcg0KPj4NCj4+IERvbWFpbi0wIHRoZSBkZXZpY2Ug
YmVjb21lcyB1bnVzYWJsZSBpbiBEb21haW4tMC4gQXQgdGhlIHNhbWUgdGltZSB0aGUgZGV2aWNl
DQo+Pg0KPj4gY2FuIGJlIHN1Y2Nlc3NmdWxseSBwYXNzZWQgdG8gRG9tVS4NCj4+DQo+Pg0KPj4g
SnVsaWVuLCBTdGVmYW5vISBQbGVhc2UgbGV0IG1lIGtub3cgaG93IGNhbiB3ZSBwcm9jZWVkIHdp
dGggdGhpcy4NCj4gV2hhdCB3YXMgdGhlIHBsYW4gZm9yIE1TSS1YIGluIERvbTA/DQpJdCBqdXN0
IHdvcmtlZCBiZWNhdXNlIHdlIG1hcHBlZCBldmVyeXRoaW5nDQo+DQo+IEdpdmVuIHRoYXQgRG9t
MCBpbnRlcmFjdHMgd2l0aCBhIHZpcnR1YWwtSVRTIGFuZCB2aXJ0dWFsLUdJQyByYXRoZXIgdGhh
bg0KPiBhIHBoeXNpY2FsLUlUUyBhbmQgcGh5c2ljYWwtR0lDLCBJIGltYWdpbmUgdGhhdCBpdCB3
YXNuJ3QgY29ycmVjdCBmb3INCj4gRG9tMCB0byB3cml0ZSB0byB0aGUgcmVhbCBNU0ktWCB0YWJs
ZSBkaXJlY3RseT8NCj4NCj4gU2hvdWxkbid0IERvbTAgZ2V0IGVtdWxhdGVkIE1TSS1YIHRhYmxl
cyBsaWtlIGFueSBEb21VPw0KPg0KPiBPdGhlcndpc2UsIGlmIERvbTAgaXMgZXhwZWN0ZWQgdG8g
aGF2ZSB0aGUgcmVhbCBNU0ktWCB0YWJsZXMgbWFwcGVkLCB0aGVuDQo+IEkgd291bGQgc3VnZ2Vz
dCB0byBtYXAgdGhlbSBhdCB0aGUgc2FtZSB0aW1lIGFzIHRoZSBCQVJzLiBCdXQgSSBhbQ0KPiB0
aGlua2luZyB0aGF0IERvbTAgc2hvdWxkIGdldCBlbXVsYXRlZCBNU0ktWCB0YWJsZXMsIG5vdCBw
aHlzaWNhbCBNU0ktWA0KPiB0YWJsZXMuDQoNClllcywgaXQgc2VlbXMgbW9yZSB0aGFuIHJlYXNv
bmFibGUgdG8gZW5hYmxlIGVtdWxhdGlvbiBmb3IgRG9tYWluLTANCg0KYXMgd2VsbC4gT3RoZXIg
dGhhbiB0aGF0LCBTdGVmYW5vLCBkbyB5b3UgdGhpbmsgd2UgYXJlIGdvb2QgdG8gZ28gd2l0aA0K
DQp0aGUgY2hhbmdlcyBJIGRpZCBpbiBvcmRlciB0byB1bm1hcCBldmVyeXRoaW5nIGZvciBEb21h
aW4tMD8NCg0KUmFodWwsIGl0IHNlZW1zIHdlIHdpbGwgbmVlZCBhIGNoYW5nZSB0byB2UENJL01T
SS1YIHNvIHdlIGNhbiBhbHNvDQoNCnRyYXAgRG9tYWluLTAgZm9yIE1TSS1YIHRhYmxlcy4NCg0K
VGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

