Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76A4A49D3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 16:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263146.455752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYGJ-0000eL-5t; Mon, 31 Jan 2022 15:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263146.455752; Mon, 31 Jan 2022 15:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEYGJ-0000bU-26; Mon, 31 Jan 2022 15:06:35 +0000
Received: by outflank-mailman (input) for mailman id 263146;
 Mon, 31 Jan 2022 15:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEYGH-0000bO-Tc
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 15:06:33 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ef9cc08-82a7-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 16:06:32 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VCvwJM009282;
 Mon, 31 Jan 2022 15:06:28 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxc901gw4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:06:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VE1PR03MB5839.eurprd03.prod.outlook.com (2603:10a6:803:111::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 15:06:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 15:06:21 +0000
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
X-Inumbo-ID: 5ef9cc08-82a7-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaNllTJTFnTfB0MaxvzP9mAZqlFLcsFGs92IoYQegsRYXKtOw/evCWpcq2NjvgroPd/i9UNWs2oycr2+5wZe75MAPtG9wST/agaFl3UDfDDKZFcF0sRuZD7nJxxOgo00XrED7u96zhKOjD8wVcetZlcjL+nhtAOydnk+tJXtLofObwHXRO72s49VttY08yQQtJYI17nRDYKfxbaEJKGK9i1AI0eUujLIxvCtTtjrVrEr6L2eme0Inks0832AITSqRHxRIptEcEj/1mCOl0QPFT2mAFmVbq0kdRGN2uwUmfqLZjStJGMEl5cradsqJRPQVxi9ZzHdd0UCrJ9mO0tMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUMc7Cwgc3p4fx1LmRT4WAFT7O14oZIkwNY7wYk9LQk=;
 b=ekxELbwlPttKhrHHoknzHjCbEJFV1jI1XQ4Pu7s8RPFlyrMgBLQJQ59/H30IEKZrJlhsYIOyDtPfNrfJ+eN7LrdfOVJgf45QRTlEosvUW9FMETpOkqv1lN/NwVghkzFPAJ6vuKRnerb6+rDrUiOuqtD75GiIAUCHyJgLZQ2QBlgOT7LX+7RyN9MITTrD7/YYa4mr784LKFDbUDLUCkwKNxb1dQKxy5+dD3GdYb9NXW90pXX0bYgwss40NV+HDrAOrejd9RwTfi7DtH8AEYtyH94cfhBfQdfKKweLebXh77bgF60Vh00o6cBY2mro6FL05TSQCMKa0kRa/KXdz3FkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUMc7Cwgc3p4fx1LmRT4WAFT7O14oZIkwNY7wYk9LQk=;
 b=m1oIE3UtKfQkMm5pivNxFVtAROwvVsBYAzve0k4YuSo/jtmWK/gGLipObmqPUGIUvx8effBrxPBtf3/FGbB+w4f/uQxQ2oXos1Yu8jG+RIXmQdQiVSZg5GK5soWdOuM9E3j5ie+FgnOoDyaX93czaRkG6vn2qzpszzckyKI3Ofa6z8AL4tCeEfZA0rs9veOGzAGuWmZy6fczlzJakHxPdKZBJNegtgugXt2YKRMIJs9tIoQGn74dclWDJglc2j1AI6c3VMdkqJVbTBvqDmZUiyGndHXsinn7LkCYzLnuuaW7c7z2HrHNXCFKJvmmoLgbqp1YFTS30tsBip6ffFpCUA==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB4GiwA=
Date: Mon, 31 Jan 2022 15:06:20 +0000
Message-ID: <082ca110-2ab7-60ff-e705-032d2d472547@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
In-Reply-To: <Yd7K+9fvnBz+WTXA@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e58c2327-a467-4d69-b534-08d9e4cb3d7c
x-ms-traffictypediagnostic: VE1PR03MB5839:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB5839292312034C4B25A71914E7259@VE1PR03MB5839.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MW5fJ/yiuQB6lhtlpj6i93PlYCw7Efht5QIFocgMKYHdabkI4DOzuQu253R+tOaeqra4p4+XjaymbhNlZpxOxAYKgdPdSsH4Ok1IM5tF6lrzs7BpthyfeCN4hjDQhkSyQ71cMQGCeLmaS5fgBc/Mke0MtN8HbZ+5B9n1zWWLXGB8HlZs7M68zBs9aGooNzLwp6MJN2TmalA/UrFyYxwCZr3ftVcnp3ZWGapbva0xfcyz4fYJyrTDuRTZDLQmPco1pcTEkvvzRS9nSMhepsk3vjKbd6s40C/4Qdn7IPQMO7pZIrIOeeMphjVRR/7lFlAZu8jXPRAjprOklGae/N3AzJ+34Slq0bQhR+CK+/e1EipcGjjiQ7E5foOz+ilHcsf/Gz7zo/IAfs6b3j85AQn+RYOis8j4kh+rZQPOtF70tcn2ijdGME17gg1ygRXYo3kX+gGJoY3W0N/gibNoN7tXmJWaNdoUfLKAVynI9UhHLUKLkhQ3ovAHoUEfiYJqnwzLM7Qn6sbYmX0JwOiJBBfqyqhYRQ9+u0y7lU8jSOy2rm09O1cj/t5+Q6BTeZftkPGqB0M3KlZoydM9oR3P8HtEszwNdayqZWU5iB7dRZHM4SJJ5EZHJz4LNIpTWlvsQJLjKVt7GB+Li6joVxD0c0+lFK2xdJUtNrYbOoFhkzlgmqzWW9E5HLkUmksfSd+woE59eLJtthu5jjTZ/NN8HXdOPaqPXRvGJYIM51UvfIiGWHpz4dKhDhG4l/B9ODopDQsBu5Kcf4DS9kaLF7BZ8s2sAy3/4fat3K73THfFHJazplZUDycvSV4QDJYmzE4CCUJ5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(36756003)(71200400001)(508600001)(31686004)(186003)(26005)(83380400001)(6512007)(31696002)(5660300002)(86362001)(316002)(966005)(6486002)(54906003)(6916009)(122000001)(8676002)(66476007)(64756008)(66946007)(4326008)(66556008)(66446008)(8936002)(76116006)(107886003)(2616005)(2906002)(7416002)(91956017)(38070700005)(38100700002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NXBrVGV1UWE3SmpJdmFsUmx3Zm1DMHZMY1g5WlArZTMwN3RBQndUM0xJdDFv?=
 =?utf-8?B?MFMrSFhjREg2RkljcFBOWktGRzgzT0lLeVZZdXg5OVM3QWRpa2NhdDVOdFFp?=
 =?utf-8?B?aGw4RytOQTJvYzJpKzhqTUEyZWZkSHlRV3BDU0U3WGpuTzd4c0dUZFZEVUFm?=
 =?utf-8?B?Vm1UZjhvd29oTlJGamNUT3pBdTIxZXlqUlpXV3p1U3FVN1daRXN6NkJJLytJ?=
 =?utf-8?B?RTRTanA1ejVIZXNNVmprNGFrQ1lPMVFwT2k0aXlyU2NBZ2E0WU1EQnJUKzFR?=
 =?utf-8?B?emhWQkxFenNzSjZwQm0zVEl4dmxNRU1aR1FQOWlMc1Bubm1MSnhDSWJ0OXBX?=
 =?utf-8?B?TVBwb2NvdzBGTCt3VVZsRkc1VWhYT0x5aEIybldkVG1ydGpPaFVxcWcvOXZS?=
 =?utf-8?B?dURiL1IyL08xR0NSM21CeW92TmswWUFxeEFMOU04ZGQ0Y3AxbkxmMW1uWWRF?=
 =?utf-8?B?a21STURIQjZqZTZ0Z25RcmZkVWsrQWhxTEVnWUpTaE5OMmt6VEZHdkptb1Jm?=
 =?utf-8?B?WFNZNlpRa1VNcFBpbHpTaU5GeXdoMVlCZ2dXZVZScG92eGt3SWlPUTB6UlRt?=
 =?utf-8?B?Q2xxN0poSWd2TG1ONGZMMFRYUitoWS9qTlQ4Y2FObmpTdVBTT1h5SjBaMlZw?=
 =?utf-8?B?WlVYVlIwSmhCTWhrem1JU1kyNERsM29IM0VZSnBJMUxlY1FXZ1JBZTg2OWZ3?=
 =?utf-8?B?dzZCaVo0UktQYTVBZzU4OVlHYUg2MVpWd29aUGR6UUtMbFFENTJ4OE9MTXhy?=
 =?utf-8?B?WlBiYkZhM1M3RkdRdW1nSVdJeEQ2N1RQK0x6dHI4Rld6amMwVzE0dGZ1RFB2?=
 =?utf-8?B?ZHNXcU04MGw0V1NRQnk2ejQ3WEtTQ3IyNnM3UlBYR1V4M2hXeEc3YkZFbnUz?=
 =?utf-8?B?VmxVZ09mRy9kdk9IWk9LK0JDUFlnSk8vQmlnRy9kZDY4SEdXSEo2MUs1dk8v?=
 =?utf-8?B?WUdqUnR5WEdCdnJVL2JGR2N0UXdCblFVOThBODAxOEk0TDZMQ1JXaGxiU3I0?=
 =?utf-8?B?MmpXbGc2em1oL3p1SEE2Q1lPeHNoTnpjYWlNNXI5M2JKVEhhT2ZDdXhiN1BL?=
 =?utf-8?B?aDJ6aU5iclpqempFMHFqUkVQRVhKUm1IeWZma2hHaWs5dm9jMXVWUld1VFc4?=
 =?utf-8?B?WldTRmtYVDRXbmtOVlI2dW5La1JOMVVhUEIyZHVTVVhTN1VuMzRONSt6aHQ2?=
 =?utf-8?B?OVdzZm1pVGlTakI5K2pwWERMUENUOFV2WWYzN3grMjJZRmFMTE9lUzRrNnZE?=
 =?utf-8?B?dUhodDVHSWxqQUhlbXdqYkJXeE9VeG5tVHdZaHdBTnhZenY4aWV5T2t6dHgx?=
 =?utf-8?B?NzFzR3lrOTZNSk9hNTFYVmdhenBuR2s0R2kxYityZ3BSV3o5UUhzS3diQ21K?=
 =?utf-8?B?NzdvNGZOQzNNL1hXTy94RFplRjlWV2NDbWY0REZldzYvZkFuRHNKME1temJv?=
 =?utf-8?B?ZWJkTzkzK252UkwvdnJzK0VHeGcxYnN3OFZ3K2Uzbk1UN1ltYjN1QnlYVDhV?=
 =?utf-8?B?a1FicUFtZ2N2bUtqcjdEN2Z5ZFhIRHUyVHRuckpJS2N2L2xlV2pZTGJNQ2N5?=
 =?utf-8?B?SnBCQ2hMdmF4aEF1RnhxTFdCQmh6bWR5ZE5kZVBlREY1anVNb1FBQTF2SUFN?=
 =?utf-8?B?Q0ZWdXgwM2ZPRXpzUEN1aGQrdmhJOEQxdkF5Y0JWZDVZMjZzLzBkYzRHNkZW?=
 =?utf-8?B?cGt6eFNaSGFiZkpKS1BKY0lObmp1ZmQ2L2dsVElSUzFQZXRwZko5QTcxek9W?=
 =?utf-8?B?VjBTN01BWGwweDdYN084S0hPTnhZVjhZOENSazlYSm1UTHIwRFk3RXJSUEdE?=
 =?utf-8?B?SmdjWEtmekp1LzliYmhUQ0R1cElWWExNMS9vckR0K01VRG1hUDZyL0p4TWx0?=
 =?utf-8?B?RVBCLzRlRXVSM0MwNzlHVk54UXZSd0FMUS9qRXROb2U5djg4K1RLcDdOdFdT?=
 =?utf-8?B?RHY2WmtEbDMzNVZIdnQ0ZWZDM0puUlhxNFhXZGJTMmdlSTEwTWYwTFVhZnhQ?=
 =?utf-8?B?QVNFRlA0VkJKanBQTDdOZi8xcHcyOGluaEg5UzU3TDd1SDJNREd6SHJibXp4?=
 =?utf-8?B?ZytURmNXMmNDMkpOQzhPUDhlVHFvZGFiVGRKdU9sWkR6dE1VNXBpL2ZETGda?=
 =?utf-8?B?WXc4SFUyQ0l1UDRGOWtXcUNMQ0o2SGtIejFpTVRuYWF5ZzhGVHJXT0J1RWFr?=
 =?utf-8?B?bHArV09oVXhSTjB1cWJRTWVGVjc2ZU94NTZFY3pPRmdNWFlZME54TXN2WExG?=
 =?utf-8?B?ejVYYjArdk1qTnZIWVg3aEFxTitkcmRkaHYwb3AvZzFPZk5yTW9sUzljMGU5?=
 =?utf-8?B?WE55K28vTUlFMGpyKy9SelJHUlFvVVNHdWNHK0ZIcSsrc2s3Z3hPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <066E757C0A166247B8A4E3614B5BB5A0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58c2327-a467-4d69-b534-08d9e4cb3d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 15:06:20.9306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Og7WKAA/q7+PVecCXV+SwYMdO/uC9gOmOCzg7DS2ptfGls47yYAQuh1jC7roK01BDv/huqeeF9V0mi8F5oE/c6oh0Gz8KLNv3FAw/eJi8GbLND8bPDYhav83FrbgwbSb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5839
X-Proofpoint-GUID: wlyn5NvJvMQ-u1KG_eA1VZnd4bWEzkMJ
X-Proofpoint-ORIG-GUID: wlyn5NvJvMQ-u1KG_eA1VZnd4bWEzkMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_06,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310099

SGksIFJvZ2VyIQ0KPj4gICAgICAgICAgICAgICByb20tPnR5cGUgPSBWUENJX0JBUl9FTVBUWTsN
Cj4+ICAgICAgIH0NCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oIGIveGVu
L2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4gaW5kZXggZWQxMjdhMDhhOTUzLi4wYTczYjE0YTkyZGMg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vdnBjaS5oDQo+PiBAQCAtNjgsNyArNjgsMTAgQEAgc3RydWN0IHZwY2kgew0KPj4g
ICAgICAgc3RydWN0IHZwY2lfaGVhZGVyIHsNCj4+ICAgICAgICAgICAvKiBJbmZvcm1hdGlvbiBh
Ym91dCB0aGUgUENJIEJBUnMgb2YgdGhpcyBkZXZpY2UuICovDQo+PiAgICAgICAgICAgc3RydWN0
IHZwY2lfYmFyIHsNCj4+ICsgICAgICAgICAgICAvKiBQaHlzaWNhbCB2aWV3IG9mIHRoZSBCQVIu
ICovDQo+IE5vLCB0aGF0J3Mgbm90IHRoZSBwaHlzaWNhbCB2aWV3LCBpdCdzIHRoZSBwaHlzaWNh
bCAoaG9zdCkgYWRkcmVzcy4NCj4NCj4+ICAgICAgICAgICAgICAgdWludDY0X3QgYWRkcjsNCj4+
ICsgICAgICAgICAgICAvKiBHdWVzdCB2aWV3IG9mIHRoZSBCQVI6IGFkZHJlc3MgYW5kIGxvd2Vy
IGJpdHMuICovDQo+PiArICAgICAgICAgICAgdWludDY0X3QgZ3Vlc3RfcmVnOw0KPiBJIGNvbnRp
bnVlIHRvIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFyZXIgaWYgeW91IHN0b3JlIHRoZSBndWVzdCBh
ZGRyZXNzDQo+IGhlcmUgKGdhZGRyLCB3aXRob3V0IHRoZSBsb3cgYml0cykgYW5kIGFkZCB0aG9z
ZSBpbiBndWVzdF9iYXJfcmVhZA0KPiBiYXNlZCBvbiBiYXItPnt0eXBlLHByZWZldGNoYWJsZX0u
IFRoZW4gaXQgd291bGQgYmUgZXF1aXZhbGVudCB0byB0aGUNCj4gZXhpc3RpbmcgJ2FkZHInIGZp
ZWxkLg0KPg0KSSBhZ3JlZWQgZmlyc3QgdG8gZG8gc3VjaCBhIGNoYW5nZSwgYnV0IHRoZW4gcmVj
YWxsZWQgb3VyIGRpc2N1c3Npb24gd2l0aCBKYW4gWzFdLg0KQW5kIHRoZW4gd2UgZGVjaWRlZCB0
aGF0IGluIG9yZGVyIGZvciBpdCB0byBiZSBlZmZpY2llbnQgaXQgaXMgYmV0dGVyIGlmIHdlIHNl
dHVwIGFsbCB0aGUNCnRoaW5ncyBkdXJpbmcgdGhlIHdyaXRlIHBoYXNlIChyYXJlKSwgcmF0aGVy
IHRoZW4gZHVyaW5nIHRoZSB3cml0ZSBwaGFzZSAobW9yZSBvZnRlbikuDQpJZiB5b3Ugc3RpbGwg
c2VlIGl0IGNsZWFyZXIgSSBjYW4gcmUtd29yayB0aGUgY29kZQ0KDQpUaGFuayB5b3UsDQpPbGVr
c2FuZHINCg0KWzFdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20veGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnL21zZzEwMzQzMS5odG1sDQo=

