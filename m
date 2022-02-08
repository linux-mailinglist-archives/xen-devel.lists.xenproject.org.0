Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F54AD4EE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267855.461612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMqk-0006fX-UG; Tue, 08 Feb 2022 09:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267855.461612; Tue, 08 Feb 2022 09:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMqk-0006dT-R2; Tue, 08 Feb 2022 09:31:50 +0000
Received: by outflank-mailman (input) for mailman id 267855;
 Tue, 08 Feb 2022 09:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHMqj-0006dL-S9
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:31:49 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efcb9308-88c1-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:31:48 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187rTod012298;
 Tue, 8 Feb 2022 09:31:43 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3mh50et9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:31:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4331.eurprd03.prod.outlook.com (2603:10a6:10:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 09:31:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:31:37 +0000
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
X-Inumbo-ID: efcb9308-88c1-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE6Sf8YRMbCw+/t029QYqzd03pbmTPIXp6wrIBqdnA0v6E0l5UjIMo/MuZ6vvhj0Ocg55vyD5oEUygFag9o2RWnR8y3cAEIQG4Kg6GLEqHMre9MhjDehhNdyt5axPS8yRfl847IdXbC6BWeEEfM9s+ikDipDrzx+kU+sxKy/pcr4EboSXmt7rWfNPOp31Jqh/j6QplIYM/ZpkZhg7DRthqORzPevho4003SoVgpyDb/lzZJozN5toMuTozutCR/atSEOdinjY1lay9F6qxiaEncx0RDXiJnSZB2SlaBtCfdZJp/2aC21+hEUOZbr+aZljYQ+Pxb0T9W3WcTOTIduFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwFh837abhIqJJakuU1HploUDshY7oxKC3GB9UXIqKg=;
 b=MFcnB6Z00g6ej6+qLETiM0ZAZPa0qOkZtypo0yCgpqlnGFKH39/XxkMRfQCTDyMETYHyZt3T0rTSEl0J8twMyP64Gs4JxYcr+51owLfryfBE1lTCtU2Op5g+LlbkBlEWmOEH6oe7dlhHYnrJYC+5eioXztXRi/tV5g7K1r57EhbvN+lOAoGfvsgzmyQP7Vqh3XWurvKLs4Sp0oW/8VRDjcpZSCL20076aOZ9UI8PiwzLF8iH9P48jeqrr9KBzfznTtj3jvJzoseaQjxBJb31DHkRsjPKyVHKTM7XpHe/XtTtu1S1PYdWlqWZYc20eJkTOxZhDucpTSO4QqhqwXeqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwFh837abhIqJJakuU1HploUDshY7oxKC3GB9UXIqKg=;
 b=KcUjxqdfiK6223FsGelP2jxXA0PQ0Q/OIg6k6rcoGX1qodHgICEQPb87bZM6abDSgK7sgQCmoHPXvAiXBPgf4zYNchT1U35VofBt68vVvdVLRnRZuOkFVkQbIfUv1g+H75YoobxkrpM52k4NV28lI2ysZigD4unN4FRZnX7b6X+fkXPkZ0YC0K+BDvyjwEyXLQD/BLln7xF/SZwaRrldy4PDFXfzuJdrRLP6AW8ob9CosYr/Lao1Edw7bNLMto4r8UjIZV6jkheEr0ih7ZhgryyHBCHPZFEuVRGcMZnxpXSj+eTkaeVe8JLg9f+rdGC8kAvK1/xbQwkcudIo7uUyIQ==
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
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHYGZFd6D+qnME8W0+wTH+v8YZ8DayJaJYAgAABnAA=
Date: Tue, 8 Feb 2022 09:31:37 +0000
Message-ID: <498ca523-2642-e35f-b316-0a089f98ca91@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com> <YgI3HpFffudiEmNN@Air-de-Roger>
In-Reply-To: <YgI3HpFffudiEmNN@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e8fe79a-6020-4335-85d3-08d9eae5ce17
x-ms-traffictypediagnostic: DB7PR03MB4331:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB433109A89A4DE6ED14E74411E72D9@DB7PR03MB4331.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 I5mGTdR9hQxfGWG0QFalaMHTgTvcvS6w8r3273HStFMGTEwtBBg+u8NQgR+sMzwAg+OdesaZVZHcZVvxZ+uBOnGwpRClJu+eR9pHYgk9XSTFSW3MK627m81gZlmh19GxcR+stgEsebDXYY33SdjflTwCN0XrU6tClDzIRYaXNMY+/KkrpduCiST7hcreALMQ4gpT4dyzhiCbw6bxovT2PAT3p0LthY6YLI6TqE0TzkxtmgTVTGJDV6DQvnMPRgt0yxZsh6dosHRUneHk1juAyITt8kHL0SAi9ctDccY8mpXD7TIifnaT+11kiUotVCKbivbf3guWXHA4XUNeXgba7RA9c0+TvjT70Dn3lqGEJJFT9EWDLEoWGz7TuI6jW7sjIAfLVOGzk1xbm7XzL/MwpU6W8WPdjKIl26fyFdgys9MtoSIvfGsMu3mPv+FGvqERFs4p3wWIXeUvXuOWpJO9ImiKzg04uREjEEI+2uqce54zwUr3A1fnWxlYnCfhgeKyxYcdapx6dvMmuG+z57Evx+C9yHMnsJEbwIysRBC2k4eM07vbl+aIWBeCSOJYwmhuTQdIdX1fDX9c/eoN4tF4YoLV5vo4jaGtupeJV2lvdMvA8Kwpf+sViz9NGJ+0smy794TVKfulWTQbbAWTtkl8x/D7PB6FwIrieHsd9a85KD0eQ8MSeGdFEoTbay3Y1wAPC+j5XsnrmcU7WGzr41/cGTA/TB669vWZdDbzEAhFYlaOmF9i4GkNtIPu4k0Z/IFA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(26005)(122000001)(316002)(53546011)(31686004)(36756003)(6512007)(107886003)(55236004)(2906002)(2616005)(508600001)(4326008)(38070700005)(7416002)(6916009)(8936002)(66446008)(54906003)(6486002)(71200400001)(66946007)(5660300002)(86362001)(66556008)(91956017)(38100700002)(76116006)(66476007)(64756008)(8676002)(186003)(6506007)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dGd1RGZxWXluNFpIdUVHMGZJaFk0WHBxeDloaFhMS28yZVFKSFVNUmFxSXps?=
 =?utf-8?B?NjFIOXQ2eWFTcDBkR21JK1N0WElRNXBFSjBBWTRuSW1kOER4NjVwWEFadExE?=
 =?utf-8?B?V1VST1BYdkRadE5yNDhCYU9BTC9FZ3lGcXlSOG8vTHVRaEszakg0QXdyejAw?=
 =?utf-8?B?SkZQOXR4Y2JKQ3plMTM3ZWhubURiZHNnOWcyT295Unp3NTVsdVVHSzg2NWxZ?=
 =?utf-8?B?WTE5TkJRMWl0SXBlMzBKUDBiaEpIODF0ZUIwOFlNd0N4cUxRd3hiaUtxNGZT?=
 =?utf-8?B?Q1hzckFTNGRybkRXeWczK1FFSmpPVXRzUEkzYTFSYnNyUGJwelhQbW8reTlC?=
 =?utf-8?B?ZVpwRnBPSi9adzRyRlFUVlRXNlBZMHArYUJad2M0U1MxejVyaSs1YjR4ZmZJ?=
 =?utf-8?B?Y1N4VUN6YlhyZHpRSWJYY1JNSk5jVXFtd2VaVVMxQlZPcDNUMzlya01jRjNp?=
 =?utf-8?B?Mi9VdDdUTEF4YlRYREh0TFRxZjRMVjdFT0pxNlh3SkNDRS9XMjNybGlGaXJE?=
 =?utf-8?B?ZGxzMUxDYTZma0N5czVEckEwa0ZRNXE4MUFuU053aW9qM2VKd1BDT0psRVlo?=
 =?utf-8?B?SWk2NkxpZUhMSXdNV1JWUFd2SHFReXVwNjVPU0VzSFhiTXFHRnNXQkRxN2Vl?=
 =?utf-8?B?YTdKcWlRMm1ieDF3cUhZK0NIeVpvdDBwN2EyaE9aVmFZVWp1QVVqbSthcWFO?=
 =?utf-8?B?YVhoVDlxaDhnTEt5OCthbGNKVGxaUlg0YkFydmRuU1F6ZkFCQndsTGpoTitY?=
 =?utf-8?B?M0x2YjB4WHE1K1NIZU1CTGxVS1djc2I5Mmw5ZmxiTnZRNHExN1phZ29XMDNO?=
 =?utf-8?B?RFVrS1pwQUYweHd2eW9aLzduVCs2aUE5N3ZkVTlhaXFPcms2UGQ0TzJrMDBm?=
 =?utf-8?B?V09tMkxFMlpORWNSNEd0MkR2MC9aNVNGUUxnaUJJZXNBc1c1bjU0QS9RWmsw?=
 =?utf-8?B?dTk2cmc3cURUaDBHc0dHMGNyVDJob3Y0eElOdVJveWJqK2xUUEM5YnZLRitQ?=
 =?utf-8?B?bzYvWTJ4OGlpOXFyVUZhL05pa254MmRIcUhnbWZ6VGYwVVJ6SGVqTHh0TEtU?=
 =?utf-8?B?b1RnNlZua0UyRVNLN2RLWGkwUFpMVE50R3k1bTFwcVZXVk8zY3h2c0E1b3JX?=
 =?utf-8?B?UjhoYXd5WlE1T012Njk0U25ENlo5NUlqSjNsVzJtTWpaQjhuYndyQ3grMWt1?=
 =?utf-8?B?bXI0LzJmOThweUJBbjMwU0J2YjJNTU5KYy9NUngzQVljMGhTV0lpc0NSWVhG?=
 =?utf-8?B?ZXY5L29XRWxjdXdxSndPT2lrL3NoVlUyM3BZamJGUm5VcmZIRXBmek8rRGlT?=
 =?utf-8?B?MkZqR0V4aFBIeWsyOUlodUdTZ1E3aStvRDhUTndhTWtpbGUwZmgxdHp6WENZ?=
 =?utf-8?B?RTdnSk5DRlBCRW5XZEtDKzRnVFNNZkd1MVdEdlVIRzhCTTlDYy9PR0ZGaUNV?=
 =?utf-8?B?QTZRZUhsTUhoVTI2aEpWemlqa2VONXlhdm9QMTFwRjVkeElGanlXM3BKUnE3?=
 =?utf-8?B?cEprWUtMbzI5MTBybHQ2eVlKc1JoZUdQRzBDK3hSeG1NVlc4SGM3WVZSc2Vk?=
 =?utf-8?B?SXZsZDdWKzIrd2psMHBIYTZlOGo1cGhmS3lCemdWQnFZR3NPUEluUXVsZklE?=
 =?utf-8?B?bWExb0IxeDBGZWVLMjg0SnZHdm9rZk5YbTUrUVVkdjhLdkRpQUlyc1FqZCtK?=
 =?utf-8?B?U0RSQjlmeTNtdzNIMmlFUXNLdEFPdjRUM0ovNmJWZWU4a0xreWxVcW5wejhK?=
 =?utf-8?B?RVNHcDc2dlAvQTdxanF5NkVpZE9aMGNKdXg3NjYvQnk3Z2FoRGN4S2w4czNR?=
 =?utf-8?B?TXlIcWRacWNpVVBvL1hVWW5oVzdvVnNReFVveXVGRkpVbUo2cXlSdTdSN0o5?=
 =?utf-8?B?K3RpVmFFWFRCbEhQaGN4SmtEWHhnOGFtL3JMQWp4OGFnbkJUbWxGdSsxR0Qv?=
 =?utf-8?B?WnY3UmJCRGFJaks2Ukh1eHBEVTc3dVVBb002MUMzSG5HWUxvNDRNdkJYaGlR?=
 =?utf-8?B?eERCRGE2RWtuY2YvNDh3alhxQndOSkZCbThhdTNRNUoxMUQxS1NrTnhwTWxS?=
 =?utf-8?B?ZjNJSlBLbGtwM3IvOTF6Y2M1TXVnd3JRTkpjMFJOanAwaGwyRU9QMmREM0tJ?=
 =?utf-8?B?Y29OU05jWUhPNW03NUZtc0o1dlBESEJFS1lBNUEyVDhWRHFDUGNJV0RQWGpY?=
 =?utf-8?B?SWdhQ0RXMXU2RXFYM0I0bFBlK1A5T3hLTGQza2VPWkorNnZ4WjRtT1JnL1cx?=
 =?utf-8?B?c2t4RVpwTWJaN1lOZHd4enQvaXp4UUJnWDg2K0FkT05RbG4wbFdwTzdFNkVR?=
 =?utf-8?B?emhCaXcrR25laWY4cVhrYTJZZDdQdkpIU3M4ek9uSjNJZWUvanc4dk5VYlhr?=
 =?utf-8?Q?Jg1dEtJP4048JGR8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4150A19D8E74364CA9A280894A5DDD3A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8fe79a-6020-4335-85d3-08d9eae5ce17
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:31:37.3350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmsFCEaxP3JPuyNzAGsiiPA9zq3f1qPuS2SGUqWmZadRUJaeRe1nUqNhw3nDf54AKQrkkGjXxn+4/dl20sEzOIgCnT7Iv2oMMgewI1+iL6fTM7a4Z8J/2PUMMQjAFEY4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4331
X-Proofpoint-ORIG-GUID: xRBPKWbAxXTc4lFSAi8SHIq9COKns3h4
X-Proofpoint-GUID: xRBPKWbAxXTc4lFSAi8SHIq9COKns3h4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080053

DQoNCk9uIDA4LjAyLjIyIDExOjI1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmks
IEZlYiAwNCwgMjAyMiBhdCAwODozNDo1MkFNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBBZGQgcmVsZXZhbnQgdnBjaSByZWdpc3RlciBo
YW5kbGVycyB3aGVuIGFzc2lnbmluZyBQQ0kgZGV2aWNlIHRvIGEgZG9tYWluDQo+PiBhbmQgcmVt
b3ZlIHRob3NlIHdoZW4gZGUtYXNzaWduaW5nLiBUaGlzIGFsbG93cyBoYXZpbmcgZGlmZmVyZW50
DQo+PiBoYW5kbGVycyBmb3IgZGlmZmVyZW50IGRvbWFpbnMsIGUuZy4gaHdkb20gYW5kIG90aGVy
IGd1ZXN0cy4NCj4+DQo+PiBFbXVsYXRlIGd1ZXN0IEJBUiByZWdpc3RlciB2YWx1ZXM6IHRoaXMg
YWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3Qgdmlldw0KPj4gb2YgdGhlIHJlZ2lzdGVycyBhbmQgZW11
bGF0ZXMgc2l6ZSBhbmQgcHJvcGVydGllcyBwcm9iZSBhcyBpdCBpcyBkb25lDQo+PiBkdXJpbmcg
UENJIGRldmljZSBlbnVtZXJhdGlvbiBieSB0aGUgZ3Vlc3QuDQo+Pg0KPj4gQWxsIGVtcHR5LCBJ
TyBhbmQgUk9NIEJBUnMgZm9yIGd1ZXN0cyBhcmUgZW11bGF0ZWQgYnkgcmV0dXJuaW5nIDAgb24N
Cj4+IHJlYWRzIGFuZCBpZ25vcmluZyB3cml0ZXM6IHRoaXMgQkFScyBhcmUgc3BlY2lhbCB3aXRo
IHRoaXMgcmVzcGVjdCBhcw0KPj4gdGhlaXIgbG93ZXIgYml0cyBoYXZlIHNwZWNpYWwgbWVhbmlu
Zywgc28gcmV0dXJuaW5nIGRlZmF1bHQgfjAgb24gcmVhZA0KPj4gbWF5IGNvbmZ1c2UgZ3Vlc3Qg
T1MuDQo+Pg0KPj4gTWVtb3J5IGRlY29kaW5nIGlzIGluaXRpYWxseSBkaXNhYmxlZCB3aGVuIHVz
ZWQgYnkgZ3Vlc3RzIGluIG9yZGVyIHRvDQo+PiBwcmV2ZW50IHRoZSBCQVIgYmVpbmcgcGxhY2Vk
IG9uIHRvcCBvZiBhIFJBTSByZWdpb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gLS0t
DQo+PiBTaW5jZSB2NToNCj4+IC0gbWFrZSBzdXJlIHRoYXQgdGhlIGd1ZXN0IHNldCBhZGRyZXNz
IGhhcyB0aGUgc2FtZSBwYWdlIG9mZnNldA0KPj4gICAgYXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mg
b24gdGhlIGhvc3QNCj4+IC0gcmVtb3ZlIGd1ZXN0X3JvbV97cmVhZHx3cml0ZX0gYXMgdGhvc2Ug
anVzdCBpbXBsZW1lbnQgdGhlIGRlZmF1bHQNCj4+ICAgIGJlaGF2aW91ciBvZiB0aGUgcmVnaXN0
ZXJzIG5vdCBiZWluZyBoYW5kbGVkDQo+PiAtIGFkanVzdGVkIGNvbW1lbnQgZm9yIHN0cnVjdCB2
cGNpLmFkZHIgZmllbGQNCj4+IC0gYWRkIGd1ZXN0IGhhbmRsZXJzIGZvciBCQVJzIHdoaWNoIGFy
ZSBub3QgaGFuZGxlZCBhbmQgd2lsbCBvdGhlcndpc2UNCj4+ICAgIHJldHVybiB+MCBvbiByZWFk
IGFuZCBpZ25vcmUgd3JpdGVzLiBUaGUgQkFScyBhcmUgc3BlY2lhbCB3aXRoIHRoaXMNCj4+ICAg
IHJlc3BlY3QgYXMgdGhlaXIgbG93ZXIgYml0cyBoYXZlIHNwZWNpYWwgbWVhbmluZywgc28gcmV0
dXJuaW5nIH4wDQo+PiAgICBkb2Vzbid0IHNlZW0gdG8gYmUgcmlnaHQNCj4+IFNpbmNlIHY0Og0K
Pj4gLSB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlDQo+PiAtIHMvZ3Vlc3RfYWRkci9ndWVzdF9yZWcN
Cj4+IFNpbmNlIHYzOg0KPj4gLSBzcXVhc2hlZCB0d28gcGF0Y2hlczogZHluYW1pYyBhZGQvcmVt
b3ZlIGhhbmRsZXJzIGFuZCBndWVzdCBCQVINCj4+ICAgIGhhbmRsZXIgaW1wbGVtZW50YXRpb24N
Cj4+IC0gZml4IGd1ZXN0IEJBUiByZWFkIG9mIHRoZSBoaWdoIHBhcnQgb2YgYSA2NGJpdCBCQVIg
KFJvZ2VyKQ0KPj4gLSBhZGQgZXJyb3IgaGFuZGxpbmcgdG8gdnBjaV9hc3NpZ25fZGV2aWNlDQo+
PiAtIHMvZG9tJXBkLyVwZA0KPj4gLSBibGFuayBsaW5lIGJlZm9yZSByZXR1cm4NCj4+IFNpbmNl
IHYyOg0KPj4gLSByZW1vdmUgdW5uZWVkZWQgaWZkZWZzIGZvciBDT05GSUdfSEFTX1ZQQ0lfR1VF
U1RfU1VQUE9SVCBhcyBtb3JlIGNvZGUNCj4+ICAgIGhhcyBiZWVuIGVsaW1pbmF0ZWQgZnJvbSBi
ZWluZyBidWlsdCBvbiB4ODYNCj4+IFNpbmNlIHYxOg0KPj4gICAtIGNvbnN0aWZ5IHN0cnVjdCBw
Y2lfZGV2IHdoZXJlIHBvc3NpYmxlDQo+PiAgIC0gZG8gbm90IG9wZW4gY29kZSBpc19zeXN0ZW1f
ZG9tYWluKCkNCj4+ICAgLSBzaW1wbGlmeSBzb21lIGNvZGUzLiBzaW1wbGlmeQ0KPj4gICAtIHVz
ZSBnZHByaW50ayArIGVycm9yIGNvZGUgaW5zdGVhZCBvZiBncHJpbnRrDQo+PiAgIC0gZ2F0ZSB2
cGNpX2Jhcl97YWRkfHJlbW92ZX1faGFuZGxlcnMgd2l0aCBDT05GSUdfSEFTX1ZQQ0lfR1VFU1Rf
U1VQUE9SVCwNCj4+ICAgICBzbyB0aGVzZSBkbyBub3QgZ2V0IGNvbXBpbGVkIGZvciB4ODYNCj4+
ICAgLSByZW1vdmVkIHVubmVlZGVkIGlzX3N5c3RlbV9kb21haW4gY2hlY2sNCj4+ICAgLSByZS13
b3JrIGd1ZXN0IHJlYWQvd3JpdGUgdG8gYmUgbXVjaCBzaW1wbGVyIGFuZCBkbyBtb3JlIHdvcmsg
b24gd3JpdGUNCj4+ICAgICB0aGFuIHJlYWQgd2hpY2ggaXMgZXhwZWN0ZWQgdG8gYmUgY2FsbGVk
IG1vcmUgZnJlcXVlbnRseQ0KPj4gICAtIHJlbW92ZWQgb25lIHRvbyBvYnZpb3VzIGNvbW1lbnQN
Cj4+IC0tLQ0KPj4gICB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIHwgMTMxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+PiAgIHhlbi9pbmNsdWRlL3hlbi92cGNpLmgg
ICAgfCAgIDMgKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDExOCBpbnNlcnRpb25zKCspLCAxNiBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIu
YyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IGluZGV4IGJkMjNjMDI3NGQ0OC4uMjYy
MGE5NWZmMzViIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4g
KysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gQEAgLTQwNiw2ICs0MDYsODEgQEAg
c3RhdGljIHZvaWQgYmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLA0KPj4gICAgICAgcGNpX2NvbmZfd3JpdGUzMihwZGV2LT5zYmRmLCByZWcsIHZh
bCk7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGljIHZvaWQgZ3Vlc3RfYmFyX3dyaXRlKGNvbnN0
IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsIHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAg
ICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9IGRhdGE7DQo+PiArICAgIGJvb2wgaGkgPSBmYWxzZTsN
Cj4+ICsgICAgdWludDY0X3QgZ3Vlc3RfcmVnID0gYmFyLT5ndWVzdF9yZWc7DQo+PiArDQo+PiAr
ICAgIGlmICggYmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+ICsgICAgew0KPj4g
KyAgICAgICAgQVNTRVJUKHJlZyA+IFBDSV9CQVNFX0FERFJFU1NfMCk7DQo+PiArICAgICAgICBi
YXItLTsNCj4+ICsgICAgICAgIGhpID0gdHJ1ZTsNCj4+ICsgICAgfQ0KPj4gKyAgICBlbHNlDQo+
PiArICAgIHsNCj4+ICsgICAgICAgIHZhbCAmPSBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0K
Pj4gKyAgICAgICAgdmFsIHw9IGJhci0+dHlwZSA9PSBWUENJX0JBUl9NRU0zMiA/IFBDSV9CQVNF
X0FERFJFU1NfTUVNX1RZUEVfMzINCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOiBQQ0lfQkFTRV9BRERSRVNTX01FTV9UWVBFXzY0Ow0KPj4gKyAgICAgICAg
dmFsIHw9IGJhci0+cHJlZmV0Y2hhYmxlID8gUENJX0JBU0VfQUREUkVTU19NRU1fUFJFRkVUQ0gg
OiAwOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGd1ZXN0X3JlZyAmPSB+KDB4ZmZmZmZmZmZ1
bGwgPDwgKGhpID8gMzIgOiAwKSk7DQo+PiArICAgIGd1ZXN0X3JlZyB8PSAodWludDY0X3QpdmFs
IDw8IChoaSA/IDMyIDogMCk7DQo+PiArDQo+PiArICAgIGd1ZXN0X3JlZyAmPSB+KGJhci0+c2l6
ZSAtIDEpIHwgflBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0s7DQo+PiArDQo+PiArICAgIC8qDQo+
PiArICAgICAqIE1ha2Ugc3VyZSB0aGF0IHRoZSBndWVzdCBzZXQgYWRkcmVzcyBoYXMgdGhlIHNh
bWUgcGFnZSBvZmZzZXQNCj4+ICsgICAgICogYXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb24gdGhl
IGhvc3Qgb3Igb3RoZXJ3aXNlIHRoaW5ncyB3b24ndCB3b3JrIGFzDQo+PiArICAgICAqIGV4cGVj
dGVkLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCAoZ3Vlc3RfcmVnICYgKH5QQUdFX01BU0sg
JiBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLKSkgIT0NCj4+ICsgICAgICAgICAoYmFyLT5hZGRy
ICYgflBBR0VfTUFTSykgKQ0KPiBUaGlzIGlzIG9ubHkgcmVxdWlyZWQgd2hlbiAhaGksIGJ1dCBJ
J20gZmluZSB3aXRoIGRvaW5nIGl0DQo+IHVuY29uZGl0aW9uYWxseSBhcyBpdCdzIGNsZWFyZXIu
DQpUaGlzIGlzIGNvcnJlY3Qgd3J0IGhpDQo+DQo+PiArICAgIHsNCj4+ICsgICAgICAgIGdwcmlu
dGsoWEVOTE9HX1dBUk5JTkcsDQo+PiArICAgICAgICAgICAgICAgICIlcHA6IGlnbm9yZWQgQkFS
ICV6dSB3cml0ZSB3aXRoIHdyb25nIHBhZ2Ugb2Zmc2V0XG4iLA0KPiAiJXBwOiBpZ25vcmVkIEJB
UiAlenUgd3JpdGUgYXR0ZW1wdGluZyB0byBjaGFuZ2UgcGFnZSBvZmZzZXRcbiINCk9rDQo+DQo+
PiArICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmLCBiYXIgLSBwZGV2LT52cGNpLT5oZWFkZXIu
YmFycyArIGhpKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAg
ICBiYXItPmd1ZXN0X3JlZyA9IGd1ZXN0X3JlZzsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHVp
bnQzMl90IGd1ZXN0X2Jhcl9yZWFkKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRh
KQ0KPj4gK3sNCj4+ICsgICAgY29uc3Qgc3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRhOw0KPj4g
KyAgICBib29sIGhpID0gZmFsc2U7DQo+PiArDQo+PiArICAgIGlmICggYmFyLT50eXBlID09IFZQ
Q0lfQkFSX01FTTY0X0hJICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgQVNTRVJUKHJlZyA+IFBD
SV9CQVNFX0FERFJFU1NfMCk7DQo+PiArICAgICAgICBiYXItLTsNCj4+ICsgICAgICAgIGhpID0g
dHJ1ZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gYmFyLT5ndWVzdF9yZWcgPj4g
KGhpID8gMzIgOiAwKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHVpbnQzMl90IGd1ZXN0X2Jh
cl9pZ25vcmVfcmVhZChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZWcsIHZvaWQgKmRhdGEp
DQo+PiArew0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGludCBi
YXJfaWdub3JlX2FjY2Vzcyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50
IHJlZywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2cGNpX2JhciAq
YmFyKQ0KPj4gK3sNCj4+ICsgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWlu
KSApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIHZwY2lfYWRk
X3JlZ2lzdGVyKHBkZXYtPnZwY2ksIGd1ZXN0X2Jhcl9pZ25vcmVfcmVhZCwgTlVMTCwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZywgNCwgYmFyKTsNCj4+ICt9DQo+PiArDQo+
PiAgIHN0YXRpYyB2b2lkIHJvbV93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5z
aWduZWQgaW50IHJlZywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwg
dm9pZCAqZGF0YSkNCj4+ICAgew0KPj4gQEAgLTQ2Miw2ICs1MzcsNyBAQCBzdGF0aWMgaW50IGlu
aXRfYmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgIHN0cnVjdCB2cGNpX2hlYWRl
ciAqaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4+ICAgICAgIHN0cnVjdCB2cGNpX2Jh
ciAqYmFycyA9IGhlYWRlci0+YmFyczsNCj4+ICAgICAgIGludCByYzsNCj4+ICsgICAgYm9vbCBp
c19od2RvbSA9IGlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4pOw0KPj4gICANCj4+ICAg
ICAgIHN3aXRjaCAoIHBjaV9jb25mX3JlYWQ4KHBkZXYtPnNiZGYsIFBDSV9IRUFERVJfVFlQRSkg
JiAweDdmICkNCj4+ICAgICAgIHsNCj4+IEBAIC01MDEsOCArNTc3LDEwIEBAIHN0YXRpYyBpbnQg
aW5pdF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgICAgIGlmICggaSAmJiBi
YXJzW2kgLSAxXS50eXBlID09IFZQQ0lfQkFSX01FTTY0X0xPICkNCj4+ICAgICAgICAgICB7DQo+
PiAgICAgICAgICAgICAgIGJhcnNbaV0udHlwZSA9IFZQQ0lfQkFSX01FTTY0X0hJOw0KPj4gLSAg
ICAgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFk
MzIsIGJhcl93cml0ZSwgcmVnLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgNCwgJmJhcnNbaV0pOw0KPj4gKyAgICAgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIo
cGRldi0+dnBjaSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2h3
ZG9tID8gdnBjaV9od19yZWFkMzIgOiBndWVzdF9iYXJfcmVhZCwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlzX2h3ZG9tID8gYmFyX3dyaXRlIDogZ3Vlc3RfYmFyX3dy
aXRlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnLCA0LCAmYmFy
c1tpXSk7DQo+PiAgICAgICAgICAgICAgIGlmICggcmMgKQ0KPj4gICAgICAgICAgICAgICB7DQo+
PiAgICAgICAgICAgICAgICAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIFBDSV9DT01N
QU5ELCBjbWQpOw0KPj4gQEAgLTUxNiw2ICs1OTQsMTEgQEAgc3RhdGljIGludCBpbml0X2JhcnMo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgICAgICAgICAgaWYgKCAodmFsICYgUENJX0JBU0Vf
QUREUkVTU19TUEFDRSkgPT0gUENJX0JBU0VfQUREUkVTU19TUEFDRV9JTyApDQo+PiAgICAgICAg
ICAgew0KPj4gICAgICAgICAgICAgICBiYXJzW2ldLnR5cGUgPSBWUENJX0JBUl9JTzsNCj4+ICsN
Cj4+ICsgICAgICAgICAgICByYyA9IGJhcl9pZ25vcmVfYWNjZXNzKHBkZXYsIHJlZywgJmJhcnNb
aV0pOw0KPiBUaGlzIGlzIHdyb25nOiB5b3Ugb25seSB3YW50IHRvIGlnbm9yZSBhY2Nlc3MgdG8g
SU8gQkFScyBmb3IgQXJtLCBmb3INCj4geDg2IHdlIHNob3VsZCBrZWVwIHRoZSBwcmV2aW91cyBi
ZWhhdmlvci4gRXZlbiBtb3JlIGlmIHlvdSBnbyB3aXRoDQo+IEphbidzIHN1Z2dlc3Rpb25zIHRv
IG1ha2UgYmFyX2lnbm9yZV9hY2Nlc3MgYWxzbyBhcHBsaWNhYmxlIHRvIGRvbTAuDQpIb3cgZG8g
d2Ugd2FudCB0aGlzPw0KI2lmZGVmIENPTkZJR19BUk0/DQo+DQo+PiArICAgICAgICAgICAgaWYg
KCByYyApDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsNCj4+ICAgICAgICAg
ICAgICAgY29udGludWU7DQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgICAgIGlmICggKHZhbCAm
IFBDSV9CQVNFX0FERFJFU1NfTUVNX1RZUEVfTUFTSykgPT0NCj4+IEBAIC01MzUsNiArNjE4LDEx
IEBAIHN0YXRpYyBpbnQgaW5pdF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAg
ICAgIGlmICggc2l6ZSA9PSAwICkNCj4+ICAgICAgICAgICB7DQo+PiAgICAgICAgICAgICAgIGJh
cnNbaV0udHlwZSA9IFZQQ0lfQkFSX0VNUFRZOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIHJjID0g
YmFyX2lnbm9yZV9hY2Nlc3MocGRldiwgcmVnLCAmYmFyc1tpXSk7DQo+PiArICAgICAgICAgICAg
aWYgKCByYyApDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4gSSB3b3VsZCBiZSBm
aW5lIHRvIGp1c3QgY2FsbCB2cGNpX2FkZF9yZWdpc3RlciBoZXJlLCBpZTsNCj4NCj4gaWYgKCAh
aXNfaHdkb20gKQ0KPiB7DQo+ICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNp
LCBndWVzdF9iYXJfaWdub3JlX3JlYWQsIE5VTEwsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcsIDQsICZiYXJzW2ldKTsNCj4gICAgICAgaWYgKCByYyApDQo+ICAgICAgIHsNCj4g
ICAgICAgICAgIC4uLg0KPiAgICAgICB9DQo+IH0NCkJ1dCB3ZSBoYXZlIDMgcGxhY2VzIHdoZXJl
IHdlIGRvIHRoZSBzYW1lIGFuZCBhbHNvIGhhbmRsZSBlcnJvcnMNCnRoZSBzYW1lIHdheS4gSSB3
YXMgdGhpbmtpbmcgaGF2aW5nIGEgaGVscGVyIHdpbGwgbWFrZSB0aGUgY29kZQ0KY2xlYXJlci4g
RG8geW91IHdhbnQgdG8gb3BlbiBjb2RlIGFsbCB0aGUgdXNlcz8NCj4gRmVlbCBmcmVlIHRvIHVu
aWZ5IHRoZSB3cml0aW5nIG9mIHRoZSBQQ0lfQ09NTUFORCByZWdpc3RlciBvbiB0aGUNCj4gZXJy
b3IgcGF0aCBpbnRvIGEgbGFiZWwsIGFzIHRoZW4gdGhlIGVycm9yIGNhc2Ugd291bGQgc2ltcGx5
IGJlIGENCj4gYGdvdG8gZXJyb3I7YA0KSSB3YXMgdGhpbmtpbmcgYWJvdXQgaXQuIFdpbGwgaXQg
YmUgb2sgdG8gbWFrZSB0aGlzIGNoYW5nZSBpbiB0aGlzIHBhdGNoDQpvciB5b3Ugd2FudCBhIGRl
ZGljYXRlZCBvbmUgZm9yIHRoYXQ/DQo+IFRoYW5rcywgUm9nZXIuDQpUaGFuayB5b3UsDQpPbGVr
c2FuZHI=

