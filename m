Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91D4A9AE3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:24:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265636.459053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzVb-0002Oq-M9; Fri, 04 Feb 2022 14:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265636.459053; Fri, 04 Feb 2022 14:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzVb-0002N0-Ie; Fri, 04 Feb 2022 14:24:19 +0000
Received: by outflank-mailman (input) for mailman id 265636;
 Fri, 04 Feb 2022 14:24:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFzVa-0002Mu-FP
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:24:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21bd3fa4-85c6-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 15:24:16 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214ENubT001176;
 Fri, 4 Feb 2022 14:24:06 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e15v90014-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 14:24:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4577.eurprd03.prod.outlook.com (2603:10a6:208:c1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 14:24:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 14:24:02 +0000
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
X-Inumbo-ID: 21bd3fa4-85c6-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBGvwVQ00on9FXtRQUSLoI8kTDs1+6SmnEt5JfWi00QRcGUtFVp9Mb+DhyxIGuBNbgm5iWprXteHFb7WRsD1ZM73ShYdCrGmzxR+Lp5Onu7Cgg1PVtbVMOplejcGloTlQ2zYXLxNndSCA1uFdR56nrYITlP7+KWgQ1BrWuRM63PenYoVlwth4ILmOAVlCWSuxPjQfJgdOCvNj7ufcYX7ombWdn4qvJGZh/bbs4P5sqECvcuBS+KRpthydKlJwC6g53Rs74pVq6GPVuGnr0JF+wQNX+6Jkgw1iw+S1DyJ7v6h4yCTQz7YNzYyGPNQSBN3VIzcB2xaJKVNNSEWfBEE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VOvhtcv7FhQ67RS/6IdCg/8um4grepF7cuEjXpc9HY=;
 b=drgEkhHrEQYFD66hpikVmX4rBc5pCdtIupP+LG96LAInFi5/mpzfVJ657Sev1I7D4/wqebKKpdU5SQHbxBh4ckFY5Ppx9cpL3VG4CAdWEVKRZ4DWXEatMd5rQcMnMh30V4m97GxtuAf5MR9ORjagNhxPxRYgBgJF++w6H9NkQyhk2WVMcbQgkgw58JGBSsf5VruwbE2PpKBCY22tUgpzKbnKpasiBRfHEM47SOydMwAWBSIkOmhZowgkOU4yENuP4Y8xMnJxN1tUlzNfSS0WId3UqL5u3eQzJnfQSdHR748g/bQJQfF8fE/BPOd5N9qn9MItDWhCEEKnaCTi/fGO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VOvhtcv7FhQ67RS/6IdCg/8um4grepF7cuEjXpc9HY=;
 b=PacHSp/mDaEPFdgFjyeRyelw1rfRJWD/VebbStLeHMmBahCwOu7pnow/5Yud52s2sAx4kEFQ13OCV/u9y16cbHsRpxCHeUH0iKd8e+Yp1K6+Q9KwWFHTOsM9ZJ6ksv+X1XMCJDKuNJQd1KXZQZMItO2WqI8VSsZu0rtJxQteIEZsfIE3Xwwm5BmE5DfNpZpIAFKOtDJtovVgr6Vf1AYZjtX+CqY/As6vcIle/kogzc6kGUq0D4YeTuaSrYTm/wUQzmKbVyT8x41I9mySPa8LM0nXIRd8pGdtARdHS1wu12trnDkswY7Pst3QYkYnp0qlfRENdVn6FuX2RQrnaAALGg==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Topic: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHYGZFbf8/6pUr0mUKzbmboCx8QkqyDbvWAgAADnYA=
Date: Fri, 4 Feb 2022 14:24:02 +0000
Message-ID: <f86a43af-1388-6959-3e71-ba796e4a0c63@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-5-andr2000@gmail.com>
 <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
In-Reply-To: <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c24766bb-898d-4401-e075-08d9e7e9fe24
x-ms-traffictypediagnostic: AM0PR03MB4577:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB45774329A229A9B4914007BEE7299@AM0PR03MB4577.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b4DGUXr7l20NDZFAgb/9tXxy4RuEj5e2x/mtVS/pxgHXlCcSbRWMOzKUbojthdH+Ibc6jv4qiX2gcsjlUrGiTG7EGIdB87RO7H+yJts6gBVt1EOwqt+Z9T9YC8q8MeVUwyYEuV2+2YmqO4zKJRE2zrVxAxKfG5AysDje+voxX01Q8G8GYDkckq5zwoiSvkFx2lt6vqeVH5uxQ21YtObNTFv3aCCjgs2/k0WH31Kieb9XagQY7T3WLEoj6vvZ+AyqTdxX6pIZ/KGLKmsJBLZA5YVzIuHRyHyzkzbviYJ6EiTILH2efNsGaFbhX853OL5RrQRI821RXDAp4pN/39xkXTGHcbKQDXj8McwvdS5OwMFqmaOgHEshna34ielV+c2GvaGUZ5YnKOhhqmkTdEx1+1AbkbO8iiEB2rcgzAOwjdZTOJirhhOH3J0oUvhHtkCivou71ALOGt77e2XjC7xTdFi8Krp36MFX3utLqPRlIRXO+bNGOX+92v8jL9GIPXpiBL17NeFhlUPPD4q5UORwG0TTWYz7jSlysR1JXUvD9GYqxnifGiPGG5VlU5rkYv0ZQdw+pPNepnCWGu4FPfm1/zCJYolc5dJkxU44HogisFJAIfpbGICxbDT6NmYGVqyM0kEqABoGKpbs8XzphegLtZAgHseVdP24CY8suyy1/AyMcX1xs0KckKs4qVIyr4E+vOAUbOxvPCQdv1ChbC6YFJI4AbQkB5AhLE7GV6oGCflZnyz4zl7dSklgXZjGcAdb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(64756008)(4326008)(66446008)(6916009)(54906003)(76116006)(6512007)(31696002)(66556008)(66476007)(2616005)(31686004)(8936002)(8676002)(86362001)(38070700005)(91956017)(316002)(508600001)(71200400001)(122000001)(6486002)(38100700002)(83380400001)(26005)(7416002)(5660300002)(53546011)(36756003)(2906002)(6506007)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RVlYa0xWT1UrSFFtR2N0SFlyaVpBVko4cEhtbnRxZk8vamxJS2oxcGJMNUdh?=
 =?utf-8?B?aEJvc2ZPU1NnSEl0ejN0NTBWbWMrYjZYZTZwckdoWEM3VVprVGIyVWpqcXcx?=
 =?utf-8?B?MGZJK2FxQjU0RzQwUmFLS05zcnZkcjdZSVgrbzF1Uk5pOVluc0RUZlc4U1kz?=
 =?utf-8?B?eGJ5eFpDNjJSNkZCeS9WSnhwdFQ3OFpUeFp1MW5GREJZZ2Q3RXFEUVhUQjkr?=
 =?utf-8?B?Uzc5TThuZzJ3OHBrQytWNnFHMEpyQVF1ZTBySitHSWlHOGpZaG1RNmNPWGg0?=
 =?utf-8?B?V1dxNk9uRGQ1a3ZkcDgvcGNSZmRWWWpkTEh0dU1vYU1sZFZxMFFrR3FaQVVr?=
 =?utf-8?B?dGlHY2MwN2JtcTMvSGk0YnhOS29iWUJ5OWxlS2pXd0FxU0J5ZFlHT1VCWHcy?=
 =?utf-8?B?Wlo0cGJFdDBITzQ2STBpMEhEVUw1Rm44VDRvNmhDSkFaNVA0cXBTWjJVaXB1?=
 =?utf-8?B?cDNQRzNMVk1YV2FCb0xGK2ppbUVEeXlyajltTTVUV3JzNUZWa25iQ05zOWJV?=
 =?utf-8?B?cTMxNTZIeVlqWlcwb3ppbzk3c3JJY3N5SXpzeEVSdEh4MU9Yb09Lc25sTzA0?=
 =?utf-8?B?Rm1oMHlHejh1a2FhaWtSeHZYYloraFgwMHplZHJPanFDYmpWcWU1cDY3MDRl?=
 =?utf-8?B?RVJDS21WKzR1MFcwQzFvc2ZqVUY1ZDVBaVB1ZHhiTDgxQ3A1RUM5ZzdrLzVo?=
 =?utf-8?B?blZCZlZ2YXArMnBZRUFzM3F4QVBIbWFtRFRUMFBiL3NoZ21HMWJGVFpTQ2lq?=
 =?utf-8?B?b3RTQ0EzRVgrRmRibWJSdXg0R1gvZGdHWDVFY2VnS1FMLzQ4S3c0VW9tck9N?=
 =?utf-8?B?S3JJYU9qME02MzczR0JqVjZOSzZyb1BmZkM0SmtSZk1aRzlLRUFRaU83NnVK?=
 =?utf-8?B?S0tFTkZBWkV0S3hFQVU5MVlnY2ttK0tHYStrdXFaODJOVlhpbTY5TTNIUExC?=
 =?utf-8?B?SmRqVW5CSitVSGhZVHRrRHNQNk1EdmV5bFRQZG9KcE5nVkdSWFlPaUZ5Zkpl?=
 =?utf-8?B?elA0TzRiTUticTdYdDZ3blBwWEI5cUZpMVptZGY5WVh1QXFoaVQxVnFzY2VG?=
 =?utf-8?B?Q2ZWNnZpeVAyNUVGK0lZODBQYzdSZTY1RDZvSk93aEJWNnR3WURYRlgxeVFs?=
 =?utf-8?B?UE41UmxNUFRxeDh1bFNQRWorOWNkZUdLRnIvWGlWU0NwZjZqMXFFZ1BoR3Ey?=
 =?utf-8?B?Q21sM1dLZWZqWnpzQ2lEK2Y5dkk5bk1JMkhBVnROZzgzWjRWcGtva2xNU2Jl?=
 =?utf-8?B?MGFYMElkK3BCV3cyR2ZGN0V6VENLYVhlTFRBaFR4Rm9iSjhzWG1SaStHRllL?=
 =?utf-8?B?V2FHdDdZOUM0SlBMWEVkbkNhVVNCRkRaYXpGQWg5bDJJdnV5Q1Q4cUZrcFRj?=
 =?utf-8?B?K3p6NkpjSUNjcHBwNTA4ME0xSjg1all3djhHc1JSSjU1WVR1eFc4TytZWEtU?=
 =?utf-8?B?WHVnVVhLYk9kSWtZMjBNZzUvaFAxckMxbDNFZS8xY203S0R2N1hnc3hQWjF0?=
 =?utf-8?B?RGFkUW16cHM0czYxVnBycHpXYjVwNHMxR0JUL0M3cS8ybHJFbzRpdGNHTUp1?=
 =?utf-8?B?UHJYM2lyb2NpT0dzWFNXcDd3ajZlNUZkY1g4bElRbGp4MEIzMDk4UzBaL0ZF?=
 =?utf-8?B?NzdLWkZHVW91bTRUQytSTXArQkJtRmd5Q1FucFNnWlp5Qk8rYllFSkd6ZnZN?=
 =?utf-8?B?bFBzeE9pandGb0xONUpmYnU2QVF0aEw3R3Y2YzZSVTJra0VUKzJudzlUVlZQ?=
 =?utf-8?B?ZThETmhSU0FHQ1lTU0d5TWZVdDY4bEt0VXVrNkpXcFpaRUN5dldFY3U5V3hM?=
 =?utf-8?B?QzQ4LzdYSjVjc1lqNXBXdDVXbXVwNHRSbUphSmV5VHFmdVVJRktMUjR5VWJr?=
 =?utf-8?B?WjI1VUhjR2ZnTUthcHBmUmsyRGpDaHpHYzhHeGxZVGhVckpmS1A5LzdWcDdx?=
 =?utf-8?B?TDNJR2w4a2V1WS9HSVhDMGMzNm9oQWxnOGVRN3lxRDlybUM4SUhLLzN1KzE0?=
 =?utf-8?B?ci85VkJITmVqcU9iZnZCeElKeHY0dnVqWGpSNCtXUEk3bElEN3VJblE0QlIv?=
 =?utf-8?B?YkVPdUkvRGVQUUlSb1dOREZwTTJCT3lHNTlxY3pzeFlqcWJsdUFVcXpIUlJ2?=
 =?utf-8?B?WHNPcW5lUE50Ym5YWFk2QjNtb01Ua0lFOHp1VGhKSzIrelFxN1pLNm95MStS?=
 =?utf-8?B?UC9LT1ZaZmQzTnowQjZ5RWM3Skp6dFRzdHdKSkM0ZFVjejVaTmthcXIwNzJy?=
 =?utf-8?B?TGZwL1JEeW1QdDd4MytoVWtoaXV3a05iei8wdnpmMlFMbjF2Ry9DNmZmKzlR?=
 =?utf-8?B?eUY1NTMxTExzWmZyMnk1YzM1ZTVXTjdHZ25JYUR4TVQ1SEtURzRidz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19F2E9986367624F9CAB090E7C9D176A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24766bb-898d-4401-e075-08d9e7e9fe24
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 14:24:02.4830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2t3C/aD53/4tRPLND0rOuHoVvX3IKGqj82+BAq9BISRcabtkUIzfwvUZe+5PGvOrakd9dvE/sXyYtwAVuzOUq98XYPzsVYs1u1+mz2uK04tn2R8tX3P3rOhd55cel5of
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4577
X-Proofpoint-GUID: suCDA3JQwx6HzGNeWWnY09x-HrTwujEm
X-Proofpoint-ORIG-GUID: suCDA3JQwx6HzGNeWWnY09x-HrTwujEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040081

DQoNCk9uIDA0LjAyLjIyIDE2OjExLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAwNzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBBIGd1ZXN0IGNhbiBy
ZWFkIGFuZCB3cml0ZSB0aG9zZSByZWdpc3RlcnMgd2hpY2ggYXJlIG5vdCBlbXVsYXRlZCBhbmQN
Cj4+IGhhdmUgbm8gcmVzcGVjdGl2ZSB2UENJIGhhbmRsZXJzLCBzbyBpdCBjYW4gYWNjZXNzIHRo
ZSBIVyBkaXJlY3RseS4NCj4gSSBkb24ndCB0aGluayB0aGlzIGRlc2NyaWJlcyB0aGUgcHJlc2Vu
dCBzaXR1YXRpb24uIE9yIGRpZCBJIG1pc3Mgd2hlcmUNCj4gZGV2aWNlcyBjYW4gYWN0dWFsbHkg
YmUgZXhwb3NlZCB0byBndWVzdHMgYWxyZWFkeSwgZGVzcGl0ZSBtdWNoIG9mIHRoZQ0KPiBzdXBw
b3J0IGxvZ2ljIHN0aWxsIG1pc3Npbmc/DQpObywgdGhleSBhcmUgbm90IGV4cG9zZWQgeWV0IGFu
ZCB5b3Uga25vdyB0aGF0Lg0KSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UNCj4NCj4+
IEluIG9yZGVyIHRvIHByZXZlbnQgYSBndWVzdCBmcm9tIHJlYWRzIGFuZCB3cml0ZXMgZnJvbS90
byB0aGUgdW5oYW5kbGVkDQo+PiByZWdpc3RlcnMgbWFrZSBzdXJlIG9ubHkgaGFyZHdhcmUgZG9t
YWluIGNhbiBhY2Nlc3MgSFcgZGlyZWN0bHkgYW5kIHJlc3RyaWN0DQo+PiBndWVzdHMgZnJvbSBk
b2luZyBzby4NCj4gVGFuZ2VudGlhbCBxdWVzdGlvbjogR29pbmcgb3ZlciB0aGUgdGl0bGVzIG9m
IHRoZSByZW1haW5pbmcgcGF0Y2hlcyBJDQo+IG5vdGljZSBwYXRjaCA2IGlzIGdvaW5nIHRvIGRl
YWwgd2l0aCBCQVIgYWNjZXNzZXMuIEJ1dCAoZ29pbmcganVzdA0KPiBmcm9tIHRoZSB0aXRsZXMp
IEkgY2FuJ3Qgc3BvdCBhbnl3aGVyZSB0aGF0IHZlbmRvciBhbmQgZGV2aWNlIElEcw0KPiB3b3Vs
ZCBiZSBleHBvc2VkIHRvIGd1ZXN0cy4gWWV0IHRoYXQncyB0aGUgZmlyc3QgdGhpbmcgZ3Vlc3Rz
IHdpbGwgbmVlZA0KPiBpbiBvcmRlciB0byBhY3R1YWxseSByZWNvZ25pemUgZGV2aWNlcy4gQXMg
c2FpZCBiZWZvcmUsIGFsbG93aW5nIGd1ZXN0cw0KPiBhY2Nlc3MgdG8gc3VjaCByL28gZmllbGRz
IGlzIHF1aXRlIGxpa2VseSBnb2luZyB0byBiZSBmaW5lLg0KQWdyZWUsIEkgd2FzIHRoaW5raW5n
IGFib3V0IGFkZGluZyBzdWNoIGEgcGF0Y2ggdG8gYWxsb3cgSURzLA0KYnV0IGZpbmFsbHkgZGVj
aWRlZCBub3QgdG8gYWRkIG1vcmUgdG8gdGhpcyBzZXJpZXMuDQpBZ2FpbiwgdGhlIHdob2xlIHRo
aW5nIGlzIG5vdCB3b3JraW5nIHlldCBhbmQgZm9yIHRoZSBkZXZlbG9wbWVudA0KdGhpcyBwYXRj
aCBjYW4vbmVlZHMgdG8gYmUgcmV2ZXJ0ZWQuIFNvLCBlaXRoZXIgd2UgaW1wbGVtZW50IElEcw0K
b3Igbm90IHRoaXMgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgd2l0aCB0aGlzIHJlc3BlY3QNCj4N
Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92
cGNpL3ZwY2kuYw0KPj4gQEAgLTIxNSwxMSArMjE1LDE1IEBAIGludCB2cGNpX3JlbW92ZV9yZWdp
c3RlcihzdHJ1Y3QgdnBjaSAqdnBjaSwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4+ICAgfQ0KPj4g
ICANCj4+ICAgLyogV3JhcHBlcnMgZm9yIHBlcmZvcm1pbmcgcmVhZHMvd3JpdGVzIHRvIHRoZSB1
bmRlcmx5aW5nIGhhcmR3YXJlLiAqLw0KPj4gLXN0YXRpYyB1aW50MzJfdCB2cGNpX3JlYWRfaHco
cGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gK3N0YXRpYyB1aW50MzJfdCB2
cGNpX3JlYWRfaHcoYm9vbCBpc19od2RvbSwgcGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQg
cmVnLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzaXpl
KQ0KPiBXYXMgdGhlIHBhc3NpbmcgYXJvdW5kIG9mIGEgYm9vbGVhbiB0aGUgY29uc2Vuc3VzIHdo
aWNoIHdhcyByZWFjaGVkPw0KV2FzIHRoaXMgcGF0Y2ggY29tbWl0dGVkIHlldD8NCj4gUGVyc29u
YWxseSBJJ2QgZmluZSBpdCBtb3JlIG5hdHVyYWwgaWYgdGhlIHR3byBmdW5jdGlvbnMgY2hlY2tl
ZA0KPiBjdXJyZW50LT5kb21haW4gdGhlbXNlbHZlcy4NClRoaXMgaXMgYWxzbyBwb3NzaWJsZSwg
YnV0IEkgd291bGQgbGlrZSB0byBoZWFyIFJvZ2VyJ3MgdmlldyBvbiB0aGlzIGFzIHdlbGwNCkkg
YW0gZmluZSBlaXRoZXIgd2F5DQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

