Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1894F41954D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 15:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196881.349773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUqv4-0003oD-T0; Mon, 27 Sep 2021 13:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196881.349773; Mon, 27 Sep 2021 13:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUqv4-0003mQ-Px; Mon, 27 Sep 2021 13:43:46 +0000
Received: by outflank-mailman (input) for mailman id 196881;
 Mon, 27 Sep 2021 13:43:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUqv3-0003mK-Qn
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 13:43:46 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce064853-999d-45da-ada7-f24061ccfc8c;
 Mon, 27 Sep 2021 13:43:43 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18RDguLv015569;
 Mon, 27 Sep 2021 13:43:41 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbewr829b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 13:43:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5697.eurprd03.prod.outlook.com (2603:10a6:208:176::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 13:43:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 13:43:39 +0000
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
X-Inumbo-ID: ce064853-999d-45da-ada7-f24061ccfc8c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az1jILi20w4NZsxRs6zJusxvIk5Ad8Vhu4oBiHeIEHYFkvCe2wuTE2fc2WrVLIuq8Mc+kvy7BttUMssq0OUGZ3a2qByMkz/aMLsgcV07sHwTOyLsXqh1xxpwA+MVbOCEz84l6owe1xwPUfldVBE+XGmfJjpe5kb5MvihQ5Th1YNlZ3xYTpzkcAlOpe3loWVweF7dvQ2WjTeBWofuHKwwf/P91kci9Qiu3qqWwA6i/UNGNfYW6YZmQjcnKvUy8Ay4AXiR4NFKXmd3DR2Fw3vb3Yeigh0KTM6gV5CnyQh1rr1SZKieLA0nvuzrzRT8xA9EZdcufarf8kjcmf+X2Ak2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OwstH2iTl88Yqp1+7Q5OgdCSPwcuaZstrSlZ+MRXWhM=;
 b=ZFR6BlnLC9O3eOG6Zo0sWGEOmRpuhY+upmnvj6+s+JaC8zjCpuXrAyyprq2HOgMbAshr7E9UmqXgZYwG9DyyG97oKPxQpDzjt6Mfh8O+2Q4oWIY8o9JQPAfv2qCc+XxlMVkSElhPLm8/CLP44vSKXPhCvPqqMlz405m37eKUPWqnOg9JY5ZemPiN+ep6sS7xLowF1bh9zqfUhi5gQqxUR7SxrZ3iYToH9ZaPFqj0Re2mq8YDn2+UsGdaftiBo+1M899lkQZQbaABAnm7vZJuIm1QlM1jx3g+xsI3vQS2jc2S1pmH0sXYSgkubCcwoL0WWIS0IL7UzSeQ0VVT5Jc68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwstH2iTl88Yqp1+7Q5OgdCSPwcuaZstrSlZ+MRXWhM=;
 b=Jo8183zooor6XvezoSAFdFZG89Q8lG0tiKgSqSl1ZkHSNRyPOgsbcCInncUNdUjfqzZy/FQjRp3XpKn+PZ+fknQu4xHJSk8thvABzTKxp8n9DxSe8Vkvakj7g6X7SLeU3sFtOPeEwt7p9jF8jwkpIMPXbYlnP+/0O6dqyYOeAWvt0PL6z1LI/mLgkYQbzsYgUX8LnrB9NnnTGRubZT3YJboCL1XngyKndKyVz+ijmQqZuZu9hUK8r4Kkp6qSHly6V13r0sRfZKC/G8rO8cEeS0HAC9ftlZAw7r+Y3rawPNakmGV7DRp86auleH5fEOX91eWDFjG5eB4ywrCsS1wheA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Index: AQHXsHpEqeYVqdD8fU+X35KPuXAnA6u3xY6AgAAKMQCAABgZgIAAAowA
Date: Mon, 27 Sep 2021 13:43:39 +0000
Message-ID: <27378eb1-7dad-29a4-a136-c9e5e55a2067@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-12-andr2000@gmail.com>
 <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
 <d08a9d34-5f75-f266-f8fb-95594fb0a8b0@epam.com>
 <3dcba7a0-6984-a9bf-6121-5003bbc2ccaa@suse.com>
In-Reply-To: <3dcba7a0-6984-a9bf-6121-5003bbc2ccaa@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45d64c47-af92-4ade-2442-08d981bccfeb
x-ms-traffictypediagnostic: AM0PR03MB5697:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5697D1D8C34801302A200393E7A79@AM0PR03MB5697.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 V5vY7qzA13V89+jyHio76fumKpmeeZYE2cbjpHimFbBJBSuBX7hEnn6lssArdYgtw7ywopSsoajSE7XaCZC892o7falAmCd6FQTlQXOviPXTtQnQtdzv/CC/3r4e9HPojKnRXib6ePZ1qr0BPngUNzlW6JnkIVo9rGYc+bJfBcYiTbjAtNfll+HmXTeqwYuAO5SEfD3bxonGaQ6UBnBVyvbTOGQ+wQkxYPXdjoW1Jg/8suxASSEd3RsJbdjZURtdORwYHobPMW3ijrXsMFDTefN9b3H7T1iHFlbgLjkJMSxgs2q4XzgoWJd79BIwsUHntMZf4GO8m+gEc5iJOR7URwex4WzuVvsOfcIENNdES5LK729caU1jeYUNXAtjVXSvs8RldKevBZRt+WwLB+KwmKdGSueyUkTtPCAft+v3VPj86YeEVThFqJ9M0Z1TEQ2DMyNAWTuunBTUoc9/fpNe+Ch8oVhiNM+g9fXAU/7Kr5r3r8v7CqaSr21PGu5kgRkLC1CTB4/GjHJQyi9lAbmfApy2i4+xlLlBI/FrUo07O9684VW2MEXv1EKZZ/oKXjFGftSnp+B9W1VwN33iEOePcFX1TjdweGSqwF0XHXDMAT0LbK9bnvbn0QH+eeO/73r9Q26sj2Nmf98gHnLvgkBmd/ZIOQFULdVY63mRg7tNvuQs8EYJkTikHmNFJIUfYXLUPBLpsbsJV/yWvY6m7bzaSJZPIfEEKYZ2nQky9Zrc04+JuIjmQkq8Dg1rJshc/cbT
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(26005)(55236004)(6506007)(36756003)(86362001)(2616005)(38100700002)(508600001)(6486002)(122000001)(53546011)(5660300002)(2906002)(31686004)(6512007)(38070700005)(71200400001)(186003)(66476007)(4326008)(316002)(66946007)(66446008)(64756008)(8676002)(76116006)(8936002)(91956017)(107886003)(83380400001)(66556008)(54906003)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c2gvNnMvODAwYW1ZTEtUdHNVUXFaNTJXWUdTVWdNN1U3SW50WXRKNDR4MXZh?=
 =?utf-8?B?M0U3T3ljVDNmdlA4Q1Z5QWM1RHI5TVFjNVFqakNQVXZhN3RiSWJuKzJHWWVt?=
 =?utf-8?B?SytOSmRmZnZyL1ZPNHgzMHdMM05mbVJ5S1F6bEpsT0IyQXNjNVQ2QnZ3aTRz?=
 =?utf-8?B?c0FpOVlWaGdMQ1FRYk1yR3JBZXNQaFZDS2hVaFZjdGVmN0UwbXdWY3d6UWdE?=
 =?utf-8?B?LzNMRUVKWCtkQ0pMM3dmam5jR3JIeDVKVzR5QWNxSVRvak9Md3kwMTVHSGli?=
 =?utf-8?B?Z0h1cjFFbU1CVS8xeXl5U2MyWDJGZS9BYXJsbWJ2cUkwV3ROWlV3cFQ3SWpJ?=
 =?utf-8?B?YlJ4WlZBck5WcVdEQ0dqMExrU0Z0ck9CT01jUzhCRVpnQlU2RVp2NzBxc3oz?=
 =?utf-8?B?bVdYTGJpaWZDTmhxaXBwWEduRHR5ZTRyRDhDYXdIcHNucDZ1dUt0MUtjbEp1?=
 =?utf-8?B?cnppYXNDNDk2aDYvdnp5T1pFRmRueWR5dE80UURnN2tpeTNVdStCUW5DdGNN?=
 =?utf-8?B?L1k5dkpoNUlleUZNNXVkWHA5Mm9Ua3dHS0p6cHdINzF3YVYvanRIc1NiQ0xL?=
 =?utf-8?B?N2hZWEZVWHhMQUV1WmY5dUhUWGc4Zkd2U1hMN2Vnb1h3OHFMMkNpQVhrSFFD?=
 =?utf-8?B?Z3EyWnBTTHlxQnN0dmVpSHpIT0MvRUpyY2E5M1Y1aW10SGVjMXBndjlGUzN4?=
 =?utf-8?B?MGFNejc4d0VPZlBKckorK0phc1ZQZ1IzcmduMVBrL2FpUGtjcW5pWGpEVU1k?=
 =?utf-8?B?UE4ybU15K0ZaTDBPa25ldDYvckxrWDdJa3Z6aEpid3ZyTTNnK04yVTlZYWJ4?=
 =?utf-8?B?d1pWOEtZTmJQajFady9obFZCZW5NN2czL3pXZ2d2YzRzbGw3ZzdoRWxqQ2xx?=
 =?utf-8?B?eEYxcW1OL3I2L3Z4bm55eWxxb0xuRVpCV0Y0TC85WE5vc1dYeEFWdUtEeWE3?=
 =?utf-8?B?SENOZ2JkNjRqQ0ErQk04dHlpYjluRUFKN3BvcGxGaEZHK05sZUdkTVlqVmJJ?=
 =?utf-8?B?V01qV0IxZTBXeXNCcVBBdmJuM3dMZWxOcWhKdXFoMDRmMk9YcnZhZmR2cm1K?=
 =?utf-8?B?d2phMnhUY0V4clNvc3ZRNnhXTlZlSVc2VnRHVTZnbHhFSkJzV3Z0bVdTY0sr?=
 =?utf-8?B?eVEzdUs2ZWpUTG9MbE5Vd2lYMzZIZDlLSC9uaVN6Y3owUnQxNmgwOVZqdVQy?=
 =?utf-8?B?THIwenRjNlVucWVqWlJ0RmQ5M090UXVjcWRpMWlhcVlFQStqdmNmei9RYUJM?=
 =?utf-8?B?RFlCYTYzakZybHZ2Wk8rcFc0bUlCSGh1WFcrUTFiK2swamNyTFhzVnA4MXFS?=
 =?utf-8?B?eFNUZ0lRZnErZkJUbzVpMGFJWC9RMWlDTW9uR3Bkbm9nOXFWUm9TMWF2c1Ru?=
 =?utf-8?B?RUpQVnhabzdESlIxYm5kNFd2R2VHcEdnNWFwNlNjQjk0NWFQVlZjYmNIdVE5?=
 =?utf-8?B?VDBObEtmaDQ4WEVwbU5maktQVWZEbGI1b0lJNHYrb1g3Z25UK3BRTVZ1TTJ4?=
 =?utf-8?B?a2pSSTRGenovcEJwWGd6UU9nSFF6MjE1OGdWOVJhMFpIOUt5M0tRSncyOC9q?=
 =?utf-8?B?UWJXb3BJbEZtNDVwNmFqYWFEaVlzazkvMkFsQjVEQldsQU03ZXVqVXQ0QVlE?=
 =?utf-8?B?UFVxazhrR1IwK0RsTmQxRDJ4eDBNMWUxRTgwOGYxMDd5ckhKbkVkOFNCZE4r?=
 =?utf-8?B?d0FZS3pFbXJKQzJJWWVUMHdIaHNqMFVBaVpkWlVvK1pITm4xYTYwNC9naFAv?=
 =?utf-8?B?M1ZQK1g2V0c3a25FWXBONGdjRUI1YjI3QVhVWkV0eENqbXZ4ZDZTVXptYzhz?=
 =?utf-8?B?UkRGRGNQc0dyemV3SklwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD646CC93040EB449514B760F6629524@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d64c47-af92-4ade-2442-08d981bccfeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 13:43:39.1187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhyeqPcnc/KNYrHcXw6KMVe8qxNvdiqeY6RWdd/CxxA5RIOYVrsmVFnxlRNjFb1iulLGSeWPK3vY19ufh4OTnzulaA51/86eQuXRmMFW77hMoDkSfdKdNVCxxHXfqAVk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5697
X-Proofpoint-ORIG-GUID: UT4S6YB7rzP8aPvA5MTtqqQLyE3z49q0
X-Proofpoint-GUID: UT4S6YB7rzP8aPvA5MTtqqQLyE3z49q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270094

DQpPbiAyNy4wOS4yMSAxNjozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjEg
MTQ6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMTQ6
MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjA5LjIwMjEgMTQ6NTUsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+PiBA
QCAtODkwLDYgKzg5MCwzMSBAQCBpbnQgcGNpX3JlbW92ZV92aXJ0dWFsX2RldmljZShzdHJ1Y3Qg
ZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gICAgICAgIHJldHVy
biAwOw0KPj4+PiAgICB9DQo+Pj4+ICAgIA0KPj4+PiArLyoNCj4+Pj4gKyAqIEZpbmQgdGhlIHBo
eXNpY2FsIGRldmljZSB3aGljaCBpcyBtYXBwZWQgdG8gdGhlIHZpcnR1YWwgZGV2aWNlDQo+Pj4+
ICsgKiBhbmQgdHJhbnNsYXRlIHZpcnR1YWwgU0JERiB0byB0aGUgcGh5c2ljYWwgb25lLg0KPj4+
PiArICovDQo+Pj4+ICtib29sIHBjaV90cmFuc2xhdGVfdmlydHVhbF9kZXZpY2Uoc3RydWN0IHZj
cHUgKnYsIHBjaV9zYmRmX3QgKnNiZGYpDQo+Pj4gV2h5IHN0cnVjdCB2Y3B1LCB3aGVuIHlvdSBv
bmx5IG5lZWQgLi4uDQo+Pj4NCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0g
di0+ZG9tYWluOw0KPj4+IC4uLiB0aGlzPyBJdCdzIGFsc28gbm90IHJlYWxseSBsb2dpY2FsIGZv
ciB0aGlzIGZ1bmN0aW9uIHRvIHRha2UgYQ0KPj4+IHN0cnVjdCB2Y3B1LCBhcyB0aGUgdHJhbnNs
YXRpb24gc2hvdWxkIGJlIHVuaWZvcm0gd2l0aGluIGEgZG9tYWluLg0KPj4gQWdyZWUsIHN0cnVj
dCBkb21haW4gaXMganVzdCBlbm91Z2gNCj4+PiBBbHNvIC0gY29uc3QgcGxlYXNlIChhcyBzYWlk
IGVsc2V3aGVyZSBiZWZvcmUsIGlkZWFsbHkgd2hlcmV2ZXIgcG9zc2libGUNCj4+PiBhbmQgc2Vu
c2libGUpLg0KPj4gT2sNCj4+Pj4gKyAgICBzdHJ1Y3QgdnBjaV9kZXYgKnZkZXY7DQo+Pj4+ICsg
ICAgYm9vbCBmb3VuZCA9IGZhbHNlOw0KPj4+PiArDQo+Pj4+ICsgICAgcGNpZGV2c19sb2NrKCk7
DQo+Pj4+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHZkZXYsICZkLT52ZGV2X2xpc3QsIGxp
c3QgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgaWYgKCB2ZGV2LT5zYmRmLnNiZGYgPT0g
c2JkZi0+c2JkZiApDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIC8qIFJlcGxh
Y2UgdmlydHVhbCBTQkRGIHdpdGggdGhlIHBoeXNpY2FsIG9uZS4gKi8NCj4+Pj4gKyAgICAgICAg
ICAgICpzYmRmID0gdmRldi0+cGRldi0+c2JkZjsNCj4+Pj4gKyAgICAgICAgICAgIGZvdW5kID0g
dHJ1ZTsNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsg
ICAgfQ0KPj4+IEZvciBhIERvbVUgd2l0aCBqdXN0IG9uZSBvciBhdCBtb3N0IGEgY291cGxlIG9m
IGRldmljZXMsIHN1Y2ggYSBicnV0ZQ0KPj4+IGZvcmNlIGxvb2t1cCBtYXkgYmUgZmluZS4gV2hh
dCBhYm91dCBEb20wIHRob3VnaD8gVGhlIHBoeXNpY2FsIHRvcG9sb2d5DQo+Pj4gZ2V0cyBzcGxp
dCBhdCB0aGUgc2VnbWVudCBsZXZlbCwgc28gbWF5YmUgdGhpcyB3b3VsZCBieSBhIHJlYXNvbmFi
bGUNCj4+PiBncmFudWxhcml0eSBoZXJlIGFzIHdlbGw/DQo+PiBOb3Qgc3VyZSBJIGFtIGZvbGxv
d2luZyB3aHkgdG9wb2xvZ3kgbWF0dGVycyBoZXJlLiBXZSBhcmUganVzdCB0cnlpbmcgdG8NCj4+
IG1hdGNoIG9uZSBTQkRGIChhcyBzZWVuIGJ5IHRoZSBndWVzdCkgdG8gb3RoZXIgU0JERiAocGh5
c2ljYWwsDQo+PiBhcyBzZWVuIGJ5IERvbTApLCBzbyB3ZSBjYW4gcHJveHkgRG9tVSdzIGNvbmZp
Z3VyYXRpb24gc3BhY2UgYWNjZXNzDQo+PiB0byB0aGUgcHJvcGVyIGRldmljZSBpbiBEb20wLg0K
PiBUb3BvbG9neSBoZXJlIG1hdHRlcnMgb25seSBpbiBzbyBmYXIgYXMgSSd2ZSBzdWdnZXN0ZWQg
dG8gaGF2ZSBzZXBhcmF0ZQ0KPiBsaXN0cyBwZXIgc2VnbWVudCwgdG8gcmVkdWNlIGxvb2sgdGlt
ZXMuIE90aGVyIG1ldGhvZHMgb2YgYXZvaWRpbmcgYQ0KPiBmdWxseSBsaW5lYXIgc2VhcmNoIGFy
ZSBvZiBjb3Vyc2UgcG9zc2libGUgYXMgd2VsbC4NCg0KQWgsIHdpdGggdGhhdCB0aGF0IHJlc3Bl
Y3QgdGhlbiBvZiBjb3Vyc2UuIEJ1dCBsZXQncyBiZSByZWFsaXN0aWMuDQoNCkhvdyBtYW55IFBD
SSBkZXZpY2VzIGFyZSBub3JtYWxseSBwYXNzZWQgdGhyb3VnaCB0byBhIGd1ZXN0Pw0KDQpJIGNh
biBhc3N1bWUgdGhpcyBpcyBwcm9iYWJseSBsZXNzIHRoYW4gMTAgbW9zdCBvZiB0aGUgdGltZS4N
Cg0KQnkgYXNzdW1pbmcgdGhhdCB0aGUgbnVtYmVyIG9mIGRldmljZXMgaXMgc21hbGwgSSBzZWUg
bm8gcHJvZml0LA0KDQpidXQgdW5uZWVkZWQgY29tcGxleGl0eSBpbiBhY2NvdW50aW5nIHZpcnR1
YWwgZGV2aWNlcyBwZXIgc2VnbWVudA0KDQphbmQgcGVyZm9ybWluZyB0aGUgcmVsZXZhbnQgbG9v
a3VwLiBTbywgSSB3b3VsZCBnbyB3aXRoIGEgc2luZ2xlIGxpc3QNCg0KYW5kICJicnV0ZSBmb3Jj
ZSBsb29rdXAiIHVubGVzcyBpdCBpcyBjbGVhcmx5IHNlZW4gdGhhdCB0aGlzIG5lZWRzIHRvIGJl
DQoNCm9wdGltaXplZC4NCg0KPg0KPj4+PiArICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+Pj4+ICsg
ICAgcmV0dXJuIGZvdW5kOw0KPj4+IE5pdDogQmxhbmsgbGluZSBwbGVhc2UgYWhlYWQgb2YgdGhl
IG1haW4gInJldHVybiIgb2YgYSBmdW5jdGlvbi4NCj4+IFN1cmUNCj4+Pj4gK30NCj4+Pj4gKw0K
Pj4+PiAgICAvKiBDYWxsZXIgc2hvdWxkIGhvbGQgdGhlIHBjaWRldnNfbG9jayAqLw0KPj4+PiAg
ICBzdGF0aWMgaW50IGRlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCBz
ZWcsIHVpbnQ4X3QgYnVzLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50
OF90IGRldmZuKQ0KPj4+IFNlZWluZyB0aGlzIGZ1bmN0aW9uIGluIGNvbnRleHQgKHdoaWNoIHBh
dGNoIDIgYWRkcyB3aXRob3V0IGFueSAjaWZkZWYNCj4+PiBhcm91bmQgaXQgYWZhaWNzKSwNCj4+
IEkgYmVsaWV2ZSB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgdnBjaV9kZWFzc2lnbl9kZXZpY2UgaGVy
ZQ0KPj4gdnBjaV97YXNzaWdufGRlYXNzaWdufV9kZXZpY2Ugc2VlbSB0byBiZSBub3QgY2FsbGVk
IG9uIHg4NiBQVkggYXMgb2Ygbm93LA0KPj4gdGhpcyBpcyB0cnVlLg0KPj4NCj4+PiAgICB3aWxs
IHRoaXMgbmV3IGZ1bmN0aW9uIG5lZWRsZXNzbHkgYmUgYnVpbHQgb24geDg2IGFzDQo+Pj4gd2Vs
bD8NCj4+IEl0IHdpbGwgYXQgdGhlIG1vbWVudC4gQnV0IGluIG9yZGVyIHRvIGF2b2lkIGlmZGVm
ZXJ5IEkgd291bGQgbGlrZQ0KPj4gdG8gc3RpbGwgaW1wbGVtZW50IGl0IGFzIGFuIGVtcHR5IGZ1
bmN0aW9uIGZvciB4ODYuDQo+Pg0KPj4+ICAgIChJIGRpZG4ndCBsb29rIGF0IG90aGVyIGludGVy
bWVkaWF0ZSBwYXRjaGVzIHlldCwgc28gcGxlYXNlDQo+Pj4gZm9yZ2l2ZSBpZiBJJ3ZlIG1pc3Nl
ZCB0aGUgYWRkaXRpb24gb2YgYW4gI2lmZGVmLikNCj4+IFNvLCBJIGNhbiBnYXRlIHRoaXMgd2l0
aCBIQVNfVlBDSV9HVUVTVF9TVVBQT1JUIGluIHBhdGNoIDINCj4+IChIQVNfVlBDSV9HVUVTVF9T
VVBQT1JUIGlzIGludHJvZHVjZWQgaW4gcGF0Y2ggNCwgc28gSSdsbCBtb3ZlIGl0IHRvIDIpDQo+
PiBEb2VzIHRoaXMgc291bmQgZ29vZD8NCj4gWWVzLg0KSSdsbCBzZWUgaG93IEkgY2FuIGdldCBy
aWQgb2YgdGhlIGNvZGUgdGhhdCB4ODYgZG9lc24ndCB1c2UNCj4gSmFuDQo+DQpUaGFuayB5b3Us
DQoNCk9sZWtzYW5kcg0K

