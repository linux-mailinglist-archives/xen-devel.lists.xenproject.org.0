Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346C41E815
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 09:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200415.354940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWCiF-00037d-0Q; Fri, 01 Oct 2021 07:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200415.354940; Fri, 01 Oct 2021 07:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWCiE-00034m-T8; Fri, 01 Oct 2021 07:12:06 +0000
Received: by outflank-mailman (input) for mailman id 200415;
 Fri, 01 Oct 2021 07:12:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22t+=OV=epam.com=prvs=09080f3fa0=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mWCiD-00034g-CV
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 07:12:05 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0d9640e-2286-11ec-bd94-12813bfff9fa;
 Fri, 01 Oct 2021 07:12:04 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1916xOe1017939; 
 Fri, 1 Oct 2021 07:12:02 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bdwhsr1n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 07:12:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3470.eurprd03.prod.outlook.com (2603:10a6:803:1f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 07:11:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Fri, 1 Oct 2021
 07:11:58 +0000
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
X-Inumbo-ID: e0d9640e-2286-11ec-bd94-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyFOx7v7Mx+h+Ll5M1j1rA2/44gTVpwNfiQcpmHK+Q+cUn4kfkrL7YPMjPYnhuiZtFZCSKQbnfg1CKn5Noa4U8rS/umCrRLzQeslna89Dk+KgchvrDdlodz+WCqtH79g+jyTwrSiPJ33L7819wfSR6o+EKXvoZZ660kXPz7gPDN1xDKfXj9CZauWqe1ml9XNHnLQqkQTLp0CqQxwj2MvUfP/IE24Lch5EvoDf8uxCebrit69D3RtF6pu9skdJCqRt0Tqv3OSG8BDfrq7i1SMaMoIsd6Y9850GdI7/FeMyOXvkt0i2OdCyvWuYvg0YOvgPZWReT7pNp4UfwfRg0X1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOaDHZkgcRQbYueAnxlvdHHKOop6q82+9hNK1tPzRDo=;
 b=GQ/SIgloxGbKUzrS9r2PydxcHumQ/NuNnvsU8XYALyw0t0/8a4nuvWn8pKb0JNk5R23yl+jQ7n8C7RaHZaYuqzz0w7bwmU8TygrsMQEa8kjjPqmHJP+RrqdcOttdcik5KVK8U9PuqMXYgEPMYGZpoKI2+5W4dVLf4s9q/Xw5cJH2pslpQQt7/uTohV75ez9bWw3qT2852ecX65Gn2glt98vKawXoMvY88/ibZmoA3mc9zSdWB6gUNLbC6h9dnFIMo0hhYdic0XN5VCk4JiE3Nx5sE5/mRzIu6XEvH8zaWI9xmXvgzadPJz0GUXz956+jDWimVDznC0BKyWV1YFhsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOaDHZkgcRQbYueAnxlvdHHKOop6q82+9hNK1tPzRDo=;
 b=kRXcdWf3AYXXbq/k1n9EL7JiuQZYPWGn5fgZKbZtVXiugCsGOGOf+/5lm0eYOSWsbI9qIBjgycj5WEW+DSAkQmsrxP5CgVQ1Cu6ys2nkws+fbgYdgS+5AaMv68fUom0S3J6Krxa/svRqNcYc62ITnvl4qoxwHN3k1CZiWTKiju3yf7SsH2DlGn0VZ6+LSdNEuAdvZbbdtVldt6G2wKpdXCvLfUnIDxKyoTpF5jyxBC/LOD3NHG4sG1Lix/RMszIjs0tWHVIC3TgQZ8dMw6ZiqAYTMhde0ecHv9dcgaZNFP5BSsJ8hQgnzMCBX22nOPnzCmJauQs0mBj9NeC8Fbr9Zw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v3 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: AQHXtcqxBmbIjyoLuU2towH4iHJ8hau9TJiAgABvEQA=
Date: Fri, 1 Oct 2021 07:11:58 +0000
Message-ID: <8641a887-f579-bb73-781d-403917a7b765@epam.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
 <20210930071326.857390-6-andr2000@gmail.com>
 <alpine.DEB.2.21.2109301733250.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109301733250.3209@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cbe488e-25d4-4d4b-6ab3-08d984aac25c
x-ms-traffictypediagnostic: VI1PR0302MB3470:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB34704F19F7E0CC9885050F42E7AB9@VI1PR0302MB3470.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 O9B8ZaA7T5mWglmLN4wxQXM88Hbn10Fv7ArYezvrWFSJDOVLgBa7cZtBLZ1skAS+idB7Jz4ncbEBoQRUPRMipKB8gZFUlMX/UTJlQ35EpLrHMPwt8AIQovmHZKwj9Vbe7esBArdS8V+UCH4bvWyb4lt9RD0tnO1D8eItGBy85PT44L034idoU110kFv3PBjibCC7lZMHNbkVoVeF8MVhonjoWY2xS/y9P08IZjUmD6NPb1e8Xx7JQaxPnMDUxJir3xHsZyy4K7l95zfGwPYp5ak0OL0mr4wLmLjEfnJ/kq0a3YM8Wen1JaEuGJHAzOXpp8FwFfQ7JX6WNuPaohele/onm9S38Bg0Nz9slEnr7X2Vgoj6ub/Zo9J/PbDXD77xb3nqPxJtTkTB7VpwjDQkrn66IZTD9A0oVwgIZ0mOxfFKEKU1t3QsBrpj4v0/m1tsUuFNkPAoNiZX9WObIszqKh9KCX5ZIh3LZrDoBOu6YbZl9wRzipgLRIVp3y6vEQfXzVWOR5SybYpIAZlCAlaPj8yU2wwNG+z0ytGdCZfuQPAwY1lht4aT4BtjymU0pFa/77uyqBDmq+/5eSeSZrK6HeHtKKhkgLbqv9XC0dUksZyYHKa7QWVi6A5mJyFs4VyFaxZraWhxihO7DK0hbOmHbK87jyewXPsbNoasEwJ3zrwNddARtrC/lv7wUpzXqCErtqCqMjSMIBWs7Lv7OG07XOvv89jL14WDV+WW1/bOrrpWWVx3qCGyeviSO85/+TDh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(4326008)(508600001)(2906002)(110136005)(53546011)(2616005)(71200400001)(8936002)(5660300002)(26005)(6506007)(8676002)(186003)(54906003)(107886003)(38070700005)(86362001)(122000001)(31696002)(36756003)(6486002)(38100700002)(6512007)(66446008)(83380400001)(64756008)(66556008)(66476007)(66946007)(91956017)(76116006)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dDczRkNkTzFOWEhJd1NSaWZtcFFZem1mU0pROGg4V3Zydzd6MTNzS2dEeGV1?=
 =?utf-8?B?QUpNd1NobEJ2WDZHRFpkRktNL3d6ZmV6M0V2YXdIcC9VdDhiSkp6a2FoM0VQ?=
 =?utf-8?B?c0p6S2d4REdhTHM0azNueFYrTW1SREFIbFo5WmFMZlRhL0JFUTZPZ1c0eGw2?=
 =?utf-8?B?NTkvb1M0bDZWcDJ6Q1hKYW5qbVlDUnF3QU1QQXh6Q1BTWTBrWGZxLzhrYTJ2?=
 =?utf-8?B?YnJBWWVXMmlrTTFaZklGQWN4K3F5dVBQU244ZVpjc0duNmFaZEFGeFhDc1Nj?=
 =?utf-8?B?YVNrSzVhZ0ZwTGV6ZW1pQ0dWdmxhd3JhVVJsbnZ5WWNNU01rTU9NS0h6Mm5E?=
 =?utf-8?B?Tk1IaklhaXB3d3RHcENqWk9scyt5WVhoZkZmMXFSVEo1UDhnUVRrdjFWemhm?=
 =?utf-8?B?SU9LcHA1SGxkOEpXM0F4ZlRBNWtCRU1aczRQb2ovQ0NNRjJVcThkN21kTWxB?=
 =?utf-8?B?MFpkZ08zMys3TFNpSGF2TTlFWEtsdjdzMEgxVXRwRlo4and4UjEwNWNKcVJn?=
 =?utf-8?B?ZUJQblVmcDQrMHhObWlMbWNXZGFVTis2TXZNTG96YTV6VHNDK2Y3dnlvL0cz?=
 =?utf-8?B?d0oxK2xUTFF1ZUsreldXd1NTZ0FYZzhGRUU2Vlh4YW9Zdm0vNWViWEZrZHow?=
 =?utf-8?B?TXU4RHRnS0hXUkR0TFdHSVNZTGhLbUpSSGhQTExoUG1kRE1LR216eTJ0WllV?=
 =?utf-8?B?ZXpkRXRjVjBnU2RXUDM3TlpVdzhXZlduRlppbVBXVDZqbWFuWVR4aWFUd1hn?=
 =?utf-8?B?d1NpY2NvZlY4YVd1WXhPZUNTdUhod0pjREQ0Mit1SUxCUVlxTGM5alFUc3Zp?=
 =?utf-8?B?NmYwSXlxUVJjTXhMa2VKMjQyVHF3Rmp0bTA5bE1zMEViSzdSNUNaWFRPYi9y?=
 =?utf-8?B?eTF4R3k3TXF5bWkrRVdrWkFiUWZuK082RWNsQ0FxOVJNQ1h3ZTB0bHFTc0lh?=
 =?utf-8?B?RGxIeW5IZG1zVllTMlJkMDlhZ1V2SWZubTRIbjFIR0h1Q2srejBUQVNQa29t?=
 =?utf-8?B?RGYzTmF1NnQvL1daRTVNNm5tMXRmTXBmc1RYUkZSbDlVSXozMktFem9PQW01?=
 =?utf-8?B?YWY0aGJzMktkSlVFVXBDZEVZT0RldlVnUFgyR1hPNDhicjE3YWhFTGNyZ05u?=
 =?utf-8?B?RHV3SjJ1c011VEFLN0U2NGw1Uzd4dVdTUnZzcE50WG1WOW52cm1MdkpqVjMx?=
 =?utf-8?B?RUhtYi9BbDZNTHpBYS9qb085N01iaTYrMmJYNXd5elJFNWJ0cTlJcVBhT05J?=
 =?utf-8?B?SXZrMzZQWFcyTk53RFAyWFh3bFdhOGUyeTQxazdXaVZESHY5RWVEMFJISkk4?=
 =?utf-8?B?anFMYmY0Z05sQWZOSmREenRGM1B6S05oYnpLTlpyM0NBY1VYTWdVVXZ0VzlK?=
 =?utf-8?B?NG9RMEl4QWtpTXFVbklnWWtKL3lCZjNSK1dVcjVmM25qbkFpVGhSd25YRXdm?=
 =?utf-8?B?S3hsV3E0aFlUVkxqL3psTlpLMlRycmJVdmJNUVN3akRtT2VtMis2TmpzVkJM?=
 =?utf-8?B?SHRvTUVEclV0eFRiTHJpdndwcFpoMFY4ZmRSQXFjQzdHeEF4OUc5U0dFK2wr?=
 =?utf-8?B?U2c4NnErWEE3N0Zwcmg2eDc1cGN2MlZkeGZvamFEZ2crVDVwMDdFN2ZXVFR4?=
 =?utf-8?B?ZHlrc0dyM3orK2RLelArNkhhUXZQR2N4WU56SlBsUjJHL2dSbHZVUjdZREow?=
 =?utf-8?B?YzZXb1Z2QWpFcG5CbDgxUXZjZ2M4Z0FKaU15WmJsWnlUWFVLbzJ3M2ExMnR5?=
 =?utf-8?Q?3caFQL14QigmLsNHamk2LdoAMsnedunraUVGzGS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB01A9980C4E6D49B63748B2FE63A2DA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbe488e-25d4-4d4b-6ab3-08d984aac25c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 07:11:58.7977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nM40KrBcLsr5A5TdrIJIkc92XklQzQm3zywxmPBpXx9JIpWZ1XTcrtHn3fS22z9F3sAkmMsE2mfjezU3/xaeO0zy+hfH9bKHado2j1pxX1LKq9xcQAkp6fox2GGqrJ9p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3470
X-Proofpoint-ORIG-GUID: dIHrmShFm-6RliGSvRMSDdX3med1pLoJ
X-Proofpoint-GUID: dIHrmShFm-6RliGSvRMSDdX3med1pLoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_07,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010048

DQoNCk9uIDAxLjEwLjIxIDAzOjM0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFRo
dSwgMzAgU2VwIDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pg0KPj4NCj4+IFdoaWxlIGFkZGluZyBhIFBDSSBkZXZpY2UgbWFyayBpdCBhcyBzdWNoLCBzbyBv
dGhlciBmcmFtZXdvcmtzDQo+PiBjYW4gZGlzdGluZ3Vpc2ggaXQgZnJvbSBEVCBkZXZpY2VzLg0K
Pj4gRm9yIHRoYXQgaW50cm9kdWNlIGFuIGFyY2hpdGVjdHVyZSBkZWZpbmVkIGhlbHBlciB3aGlj
aCBtYXkgcGVyZm9ybQ0KPj4gYWRkaXRpb25hbCBpbml0aWFsaXphdGlvbiBvZiB0aGUgbmV3bHkg
Y3JlYXRlZCBQQ0kgZGV2aWNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gSSBnZXQgYSBi
dWlsZCBmYWlsdXJlIHdpdGhvdXQgQ09ORklHX1BDSSBvbiBBUk02NDoNCj4NCj4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC9sb2NhbC9yZXBvcy94ZW4tdXBzdHJlYW0veGVuL2luY2x1ZGUveGVuL3Bj
aS5oOjY2OjAsDQo+ICAgICAgICAgICAgICAgICAgIGZyb20gL2xvY2FsL3JlcG9zL3hlbi11cHN0
cmVhbS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaDoyNSwNCj4gICAgICAgICAgICAgICAgICAgZnJv
bSAvbG9jYWwvcmVwb3MveGVuLXVwc3RyZWFtL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oOjEyLA0K
PiAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvYXJtL2FybTY0L2FzbS1vZmZzZXRzLmM6OToN
Cj4gL2xvY2FsL3JlcG9zL3hlbi11cHN0cmVhbS94ZW4vaW5jbHVkZS9hc20vcGNpLmg6MTI3OjQ2
OiBlcnJvcjog4oCYc3RydWN0IHBjaV9kZXbigJkgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBs
aXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVj
bGFyYXRpb24gWy1XZXJyb3JdDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfcGNpX2luaXRf
cGRldihzdHJ1Y3QgcGNpX2RldiAqcGRldikge30NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+DQo+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzDQpBaCwgdGhpcyB0aGVuIG5lZWRzIHRvIGJlDQpzdHJ1Y3QgcGNp
X2RldjsNCg0Kc3RhdGljIGlubGluZSB2b2lkIGFyY2hfcGNpX2luaXRfcGRldihzdHJ1Y3QgcGNp
X2RldiAqcGRldikge30NCg0KSmFuLCBhcyB0aGlzIGlzIGdvaW5nIHRvIGJlIEFybSBjaGFuZ2Us
IHNvIGNhbiBJIGtlZXAgeW91ciBBY2sgcGxlYXNlPw0KDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

