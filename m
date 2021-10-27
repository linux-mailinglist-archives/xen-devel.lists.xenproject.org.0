Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2143C91B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 14:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216893.376672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfhb1-0001tI-HL; Wed, 27 Oct 2021 11:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216893.376672; Wed, 27 Oct 2021 11:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfhb1-0001qR-EJ; Wed, 27 Oct 2021 11:59:55 +0000
Received: by outflank-mailman (input) for mailman id 216893;
 Wed, 27 Oct 2021 11:59:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mfhb0-0001qL-EK
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 11:59:54 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6457da7c-371d-11ec-845d-12813bfff9fa;
 Wed, 27 Oct 2021 11:59:52 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBScMp005785; 
 Wed, 27 Oct 2021 11:59:50 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3by4rqgu1x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 11:59:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7345.eurprd03.prod.outlook.com (2603:10a6:20b:273::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 11:59:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:59:47 +0000
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
X-Inumbo-ID: 6457da7c-371d-11ec-845d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtFs1gb8NzeI54Ehulow8bilsGvy5apcZzfqatu8sBRs15PLSWpomx17M5VO/0ctPHHmGbpqYTkL1Jo2XlUc4QQlHh9YUC4HVO4a3oYZsEzvpih7C4/lmjYUyoKLs3of9UIRaAHUs4f5OlCkssTKPUe1W1FlIxVsa4uu0gPxRShEqSEu7nMLnlZWVSkRKsYtEzzUpjDHDDd3waOjrG58BpfXPySg1kkTodSUe09uJPxFlp6AoDUIyqMdM2XINRNM7wccTuPbj/lJ4sN0arm/VWRGeXXPVRgQLvCc+JaYsKjIM5NSx8PrI/tVNhDtr4FkoBOrmH7H2f4ijb5UzRkvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwtKAD/U7xJJJxkyj6ijJDX5fvDJUHshCauM3+qbnU0=;
 b=NoIK7LFam+4JwH5nMs5co3HXWySffmiE96hWg5NYKhSglZQRIJxlw22QkQVUN/TZrCp8fS+gPhM+VvorxK9l4PHRrmWgrOHdL3kCrQV6kGS/BqzHaneEj5BpvpcR+jyOv4pxC+Hi1hDZy+e1ORJe8tnUxGmnixcxDNErE/kbBqZ81cb5dyAgMB7cDSUM+e38coYozhL9nT/C9d/5WxJyqvmqGqiNzpCTonN9VaaS90hcsRId6Be6cDswIIq1UkU4G9g+tBgLY3sCHJH6MWkpcM4ZvP1oWJyySUWRnk5fDj4unfReZhNGc//ud8UcHEkeiKHn20fzjY+8EUli6JeUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwtKAD/U7xJJJxkyj6ijJDX5fvDJUHshCauM3+qbnU0=;
 b=OqmoZFwD3ZlOctbh6R4YkiUYsBAve6Io7U5mfy979f8L+qnCSb1+qA1NpqBwLTAaPYFq05b35fmbdk30+A67+ZS4suVLHhxHUpnwd88oFcvtANg2Ula6HUKBvpiA+GW8Ru82SkHyRojndgFD+id+b3SqH9hnZsBc0gwNQY8VhHd6sFDGZ9g7kWGtAMhtqUXeQoRQiqWkmTmQNTFYYIisoCjF0nS3y6aC5aikBEICPo121UmT2zCXMf7kW4/LqFIt0VvyEXKHnL08vygNt4OeekbYfzlK0wfl6SGLiZ1EiX+bMX2CS9AcFUftEIR6yUoHmAilA6ZUD0gzJdUrFwl1bg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Thread-Topic: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Thread-Index: AQHXtdAhPfrDnvz+/U+T4IKIC1fCcavRBz+AgBXEsICAABy1AA==
Date: Wed, 27 Oct 2021 11:59:47 +0000
Message-ID: <344cf880-8f76-1a71-d27c-e7ba10459d5b@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
 <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
 <89e1f09e-c840-860e-e596-38fb141aa707@epam.com>
In-Reply-To: <89e1f09e-c840-860e-e596-38fb141aa707@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af438979-ccae-405e-e765-08d9994145f4
x-ms-traffictypediagnostic: AM9PR03MB7345:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7345D37373DF1AE667D16C4AE7859@AM9PR03MB7345.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ihE73+xfZDCiRMr79UUu/N8Zhwz8/3esnVke6qP70gphBNSNgPh7HdC0Aecv4buRI4WXWCi2ySn5OaVkN3OSrQGIEOoIhO4XKnNID3vtdjDmdnTJPTktwjI4aEBDlzRi+qYlrWvubAAUWSc4ekL9Co0+msLsKV1zpv2GFj880bAvEIGu6eRUz4QEug6Dr3IQ6mNmCGSjvZIAAnGHEXoC3n0IzL1u4YOHYji1WIxQc3vBkxg1smWfidcfg2vnLAes7An5vqX2KnGsS8HCKofnD+PLxyQkvIm+XvvSdYbCukTNxyCy5j/5M6PLIeMFlmtZ9H31dMkM/hMr8x0EpXLtZexEJbPBxntPjPK/m9Uhm/LGZCg0wNRdUflT2n4VnRwjgUaen++LLfqxXTYPQ9yLM1MBIuTtD4w/i3H7L2i04ahjDPkpyg77XEK3RLd1xLVM3hQmZ1RgS/3GKpN+Ixo9R+i3LMOircVzG6dLeekfCV3iRQE7GyZbARwS8TSk26I9X43H2CyLiLjpffUexwPtoZGJA3VHHoJzx0ewt998WH2sx0L1j3mHlWBgruSbkifAfg0WLxm8Vl6r30bTHqBUmukWh9fXVrS4ubSy4ASls8o2pvCXdbujJL8GQsYRkPpSf7aQiuXPsuK5P69kBFAMSSrPAJnDQ6fmt0v2tyH72ZIRgGJhENTaTmEe0TgyZDoCjIkS4GQvEMnQyQ6yqWG+GWCTkpdggUG5/7xbK2LCo5hclQcMKoTCzCir6yiSohOa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(38100700002)(8936002)(54906003)(6512007)(8676002)(83380400001)(26005)(2906002)(31696002)(6916009)(6486002)(107886003)(36756003)(508600001)(2616005)(5660300002)(66946007)(66446008)(66476007)(64756008)(4326008)(122000001)(66556008)(86362001)(186003)(31686004)(38070700005)(71200400001)(53546011)(91956017)(6506007)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L3ZOelBLTjBiR01jN2VRQlV5Y2RwNnN6SjNlMEh5Y1hmU0toMTlmaVZnemcv?=
 =?utf-8?B?OUV2UktxT3YzaDlnVVQyOE9jQ3JPMUdMWGJhTzBsNmpFSU5WQUtlN2t1YzN1?=
 =?utf-8?B?SGt0TkNTSkpiWkxvWGxuVWlYT1lXVUtrTjhGUjVaQTFBS2lOYU51T21yY2Ur?=
 =?utf-8?B?WjgvUW42VmtTRUhFcDc4WXJHYklURjAxVmVvQzZHczFTVThPTFhJU2RSNHpF?=
 =?utf-8?B?cVhJUzJuVTV0RVI1cVFOMDNZQjJrR0sydnVwNEJKckdjWU8zV09oN1dyWmtk?=
 =?utf-8?B?SEtaZExNMFJrdkQwaHkxVWcwR1h2bDRuSXFHVUNmUE9HYVd2VjVnV3Uya0N5?=
 =?utf-8?B?eWZMWW9GcmtxM3l4ZXZpUVk4TDl3V0F1Y3BHUzhxeWN2V0FyQmN0SEhJMWgx?=
 =?utf-8?B?QUZtbVYzZ3NlcXZpdDFEMjhQOXR2cW5md0R3d3FaNnpVQTlVSHNTWGh4SHVw?=
 =?utf-8?B?cE93V1A1dDkxUzZQTnNtbHg0Mmp1eVVoY2lvVm9zT0VyRFFrbWZnMCtWU2pP?=
 =?utf-8?B?ZWlDem5qby9GV0h2V2VkOTBHN1JLU0FlTXVjb3R5b1ArR3ZPNnltOXRFakkz?=
 =?utf-8?B?UmMwbHdyK3B3Qm55LzFhWDJDSWNYMGZ3RFBlczcxTlZJLzlkUnVxNXlpcVM5?=
 =?utf-8?B?QU1sU3F2NTV5MkdEY3pvTG5DY2NHcDc3UklCWnovZm9IWFhmUmN2QVptU29n?=
 =?utf-8?B?cmxrcUFFTFJSSDFJRVRwdjFtWlhEek9jVUt6MzRESXY1UzVTU1ZLVjhiYm9q?=
 =?utf-8?B?c3pGTm5yQUJBNlVxa0RsYW9NTXpjbXIrclhlZUxqUnlRemVFd1Z1OE9qdi91?=
 =?utf-8?B?elRSdFRmSDNNazUwcmVVQUtsOUY4a1NoRE4rY0hORzN6MG5HMThwSWJvV3Qy?=
 =?utf-8?B?Vy9BUFl5K01yMUloT0I2ajVVUi9KS3NXMUdEZDQ3a3MrbUhRcjZpTmZsR2Rz?=
 =?utf-8?B?RE9NdWFKWnhZMEhydVlEWmd3SFBRNGlpWStSUGhoRkpOcnk1QStKM0g5alVH?=
 =?utf-8?B?ZUxNN2M3K01iL05Lakd2d0ZQR2RnT0x4WjFDenlqVWQ2UVFSaDEwUTNld0Fh?=
 =?utf-8?B?akpZelJKS3YwSExiajBPOVV1Mk1lNVZXUkZqV1dQb29pR3JTRlRRWnlaTDhI?=
 =?utf-8?B?a1dQdEpYbVNkbUhaNm4wQmZuN3JxYW1kaVdHQWswTUpLaHFhdkh0SCtqZ2p3?=
 =?utf-8?B?ZjF6ckxMT2VmSHdTNUtRNTBGb0JpcUYrbmRxUWVXUTRUQ1RuTGxHOW1tVUFr?=
 =?utf-8?B?NUsxZ09mRHJGVVVqL1lzdW9GdDZvYWZNUFFubmxoSVNjOU1oM0R3K3Q0ZEVT?=
 =?utf-8?B?bG9QcC9xdnZDK1dYWWRzVUlmMk55SlI3cWFMS1VNU3A1TkFwUDhiVmxZUTFU?=
 =?utf-8?B?RTYxTDF5ck9hMzhPSisrZVBpSldXbElvTmtJMzJTaHhzVDlFM0hmZVBmS3Zp?=
 =?utf-8?B?VzdVZWJYT3NRSzdWTmVoakJsMDRhWm8vYjBMVkZhUDlWdGhFUHQxTVVwSkVR?=
 =?utf-8?B?UUZxbUl6aUdjb3luMVFxZHd1RWh5UlF3cnpVNlJDUjNHZ2xMbEFFd3E2Nkg5?=
 =?utf-8?B?ODVhd3d3N0xWVGRMLzdyMk11ajNhN0IzSStleC9MWmx1YVdxSlIxMEdlUGpq?=
 =?utf-8?B?aktEN2piS1d2ZUg4cDFGQ21pc00vRytJODlrM1R4cGIwY1lBN011eUZoNElG?=
 =?utf-8?B?U2x6TWpUYXh4YWZYNW1mZXd0b3k5aW1FamVrczU2L2RVSnJ5c1pyNUxYVkRY?=
 =?utf-8?B?Z1J2U2hBM2JEd3JPMlhRZExVMDk1ZjZqb1Mzait0L1NQeGZmNW9WdkY4dk5j?=
 =?utf-8?B?R3NRZjY1dFk1SnpHYXpjUDlCOXhROEp1NHFpUjFFSnYvWHY4bXplYXVLUGh2?=
 =?utf-8?B?MDBpWWJXOTVjOEp2b3VXRzFBcytLVmo0QTVlQWtoQnN0MEpvNjNOaFZxYUNz?=
 =?utf-8?B?bGZFU2FKYXltNk05TTdGYWw4VS9yWms2bU5oNjFpeENnZitXVUlMcWlkcTJw?=
 =?utf-8?B?Q1hLYU91bUpoeEUzVDJhTkRtd0tYZmZ5ZDFqWXExQUdDZENyelQ1ejdnMXlI?=
 =?utf-8?B?SktYcHIyeTNjQm5kNW1oSnJCTWNsb2dKRkYyQ3J6NS9XeEY3R2Z4UHd6Mm9T?=
 =?utf-8?B?ZkFuWnhGSmhnVzZSYk10TUlIK3dRdGdOc0hVM3R6QjhLWUJrU1lrZEdDRkRU?=
 =?utf-8?B?TFdGVWZkczgzNGNid0Y1bUZEVXo0OFMyRzJZT0liM2hwMzhqY0NOR3lOampF?=
 =?utf-8?B?VW54VmtQNFpqM3FUL1NBUmRBN2ZqYjNjdkVoVzkxckNMRndXNXJrN0YzREVJ?=
 =?utf-8?B?VkYrbXAwcHQ1ZHJla09uQlc1MkltTHF3RHpHWFJhT2QwM1M0OTdxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BA4C1A5AB1AEE4AB95764898ED62B59@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af438979-ccae-405e-e765-08d9994145f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 11:59:47.3893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YItOJdbO8XIUgvyWDQOSQxX53/t9mZIGhFRJ6YE9mvf8dduhIgLXDmQLlLoSVZFZS8MYsvYERNXne4Cg63iH86PnjJm4ngKFKdcl66veDxy9UPO7YeGn1DVDsHmXvkbr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7345
X-Proofpoint-GUID: uPDv8_TRYiK89CzYIVtRkxK6REe1Fe0M
X-Proofpoint-ORIG-GUID: uPDv8_TRYiK89CzYIVtRkxK6REe1Fe0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_03,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270074

SGksIFJvZ2VyIQ0KDQpPbiAyNy4xMC4yMSAxMzoxNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+IEhpLCBSb2dlciENCj4NCj4gT24gMTMuMTAuMjEgMTY6NTEsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6DQo+PiBPbiBUaHUsIFNlcCAzMCwgMjAyMSBhdCAxMDo1MjoxNUFNICswMzAw
LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+PiBU
aGlzIGlzIGluIHByZXBhcmF0aW9uIGZvciBkeW5hbWljIGFzc2lnbm1lbnQgb2YgdGhlIHZQQ0kg
cmVnaXN0ZXINCj4+PiBoYW5kbGVycyBkZXBlbmRpbmcgb24gdGhlIGRvbWFpbjogaHdkb20gb3Ig
Z3Vlc3QuDQo+Pj4gVGhlIG5lZWQgZm9yIHRoaXMgc3RlcCBpcyB0aGF0IGl0IGlzIGVhc2llciB0
byBoYXZlIGFsbCByZWxhdGVkIGZ1bmN0aW9uYWxpdHkNCj4+PiBwdXQgYXQgb25lIHBsYWNlLiBX
aGVuIHRoZSBzdWJzZXF1ZW50IHBhdGNoZXMgYWRkIGRlY2lzaW9ucyBvbiB3aGljaA0KPj4+IGhh
bmRsZXJzIHRvIGluc3RhbGwsIGUuZy4gaHdkb20gb3IgZ3Vlc3QgaGFuZGxlcnMsIHRoZW4gdGhp
cyBpcyBlYXNpbHkNCj4+PiBhY2hpZXZhYmxlLg0KPj4gV29uJ3QgaXQgYmUgcG9zc2libGUgdG8g
c2VsZWN0IHRoZSBoYW5kbGVycyB0byBpbnN0YWxsIGluIGluaXRfYmFycw0KPj4gaXRzZWxmPw0K
PiBJdCBpcyBwb3NzaWJsZQ0KPj4gU3BsaXR0aW5nIGl0IGxpa2UgdGhhdCBtZWFucyB5b3UgbmVl
ZCB0byBpdGVyYXRlIG92ZXIgdGhlIG51bWJlcnMgb2YNCj4+IEJBUnMgdHdpY2UgKG9uZSBpbiBh
ZGRfYmFyX2hhbmRsZXJzIGFuZCBvbmUgaW4gaW5pdF9iYXJzKSwgd2hpY2ggbWFrZXMNCj4+IGl0
IG1vcmUgbGlrZWx5IHRvIGludHJvZHVjZSBlcnJvcnMgb3IgZGl2ZXJnZW5jZXMuDQo+Pg0KPj4g
RGVjb3VwbGluZyB0aGUgZmlsbGluZyBvZiB2cGNpX2JhciBkYXRhIHdpdGggc2V0dGluZyB0aGUg
aGFuZGxlcnMNCj4+IHNlZW1zIHNsaWdodGx5IGNvbmZ1c2luZy4NCj4gT2ssIEkgd29uJ3QgaW50
cm9kdWNlIGFkZF9iYXJfaGFuZGxlcnMsIHRodXMgcmVuZGVyaW5nIHRoaXMgcGF0Y2ggdXNlbGVz
cy4NCj4gSSdsbCBkcm9wIGl0IGFuZCByZS13b3JrIHRoZSB1cGNvbWluZyBwYXRjaGVzIHdpdGgg
dGhpcyByZXNwZWN0DQpPbiB0aGUgb3RoZXIgaGFuZCBhZnRlciB0aGlua2luZyBhIGJpdCBtb3Jl
Lg0KV2hhdCBhY3R1YWxseSBpbml0X2JhcnMgZG8/DQoxLiBSdW5zIG9uY2UgcGVyIGVhY2ggcGRl
diAoX19pbml0PykNCjIuIFNpemVzIHRoZSBCQVJzIGFuZCBkZXRlY3RzIHRoZWlyIHR5cGUsIHNl
dHMgdXAgcGRldi0+dnBjaS0+aGVhZGVyIEJBUiB2YWx1ZXMNCjMuIEFkZHMgcmVnaXN0ZXIgaGFu
ZGxlcnMuDQoNCkZvciBEb21VIHdlIG9ubHkgbmVlZCAzKSwgc28gd2UgY2FuIHNldHVwIGd1ZXN0
IGhhbmRsZXJzLg0KU28sIGZyb20gdGhpcyBQT1YgZWl0aGVyIHdlIG5lZWQgdG8gaGF2ZSBhIHll
dCBhbm90aGVyIGFkZF9iYXJfaGFuZGxlcnMNCm9yIHNpbWlsYXIgZm9yIGF0IGxlYXN0IHRoZSBn
dWVzdHMgYW5kIHRoZSBjYXNlIHdoZW4gcGRldiBpcyBhc3NpZ25lZCBiYWNrIHRvIGh3ZG9tLg0K
DQpTbyB0aGlzIGNhbiBiZSBhIHJlYXNvbiB0byBkZWZlbmQgdGhlIGN1cnJlbnQgYXBwcm9hY2gg
d2l0aCBhZGRfYmFyX2hhbmRsZXJzLg0KDQpPcj8gRG8geW91IGhhdmUgYW4gaWRlYSBob3cgdG8g
ZG8gdGhhdCBzb21lIG90aGVyIHdheT8NCj4NCj4gVGhhbmsgeW91LA0KPiBPbGVrc2FuZHINCg==

