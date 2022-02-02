Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A64A7156
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264142.457134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFUE-00078c-W1; Wed, 02 Feb 2022 13:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264142.457134; Wed, 02 Feb 2022 13:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFUE-00076R-R6; Wed, 02 Feb 2022 13:15:50 +0000
Received: by outflank-mailman (input) for mailman id 264142;
 Wed, 02 Feb 2022 13:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFFUD-00076L-3x
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:15:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b60683c-842a-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 14:15:47 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212D4fCF028654;
 Wed, 2 Feb 2022 13:15:42 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyth0r1r3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 13:15:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3488.eurprd03.prod.outlook.com (2603:10a6:803:1d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 13:15:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 13:15:37 +0000
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
X-Inumbo-ID: 3b60683c-842a-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+Na9ktr1SSjQ5Dfg3W+2/VRhU2Hm6gZiQ4xSAXom8dKGQ/cDht/fWeMJgz4j0yF5Ds917xSHd7OiqM4FSYrjo/05Cdg4xTr/hcr62etuErzL8aHK17hZMEersUP6A+2t/zQGVgSECHmhNx/VsedvZVaSnq7h2oONG8BpFqxiFy3Ujlsvx6IB8pVJ+oBSShmnXRKmKNBy9AhC1y5Xaykd++7OLQ3OXMedk/VgcWDjpukTPEkJa4p11zTBAcMgZsqEkhTBgtcKgggMW1kQmrm4IqLcOMd8K6uteWgWJexyuDO5T0mzeWvHfnR90X8rNJOpZdQQHEHV5Wc43Ev0MyvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAV4m35Tz3r4nzVT+GPAx09cya+fWlo6iXU3D/rPMdE=;
 b=cf7miCQIDJdWxuBXLBxHv4OsTXkoTFgzT+QofYzJdVtubyNhfurng1z921xESK2d5VUsisChnBwqjlmoOjz3KpLrSg8u2fdaUdG8KULVUt60zqnaAksDGlLuUk1R9QZoUe1ji/xLyaBuqtxqfjS94PPe8A/ginOQRMt/UcOMS024T+nLCTKISIHqBB7SkThD9NnbP9XHGs1hZsmRiRGAJiyt1R8VXdojKh6ELAi1SDUTOuDDvRkTOXmsRylNAxIQWkcvBmQRiBVWQxig1lduyNkTbw0naK7kjWInyQfZzIMcPrIJRhYrB2rb+tJaTjnd9N0pOEK5RM3u1czGUUGgcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAV4m35Tz3r4nzVT+GPAx09cya+fWlo6iXU3D/rPMdE=;
 b=RMC5i2MG/Uvx+K70IUCfEcjT6GKd+2mOd9/gmZQ45R+lL0gJbOY2xwAdBhU9WO/3G2vHd/iyt1TKSxsqSAb1k1R9JwfJpb2TqARm9ebRlPmPF/UiXeg0J7zLhO8YZRCXqoS35jEK0adbUqmuYOM1WhfyQqDhvRrDhqH/Ym1sS7iyGwrlEWIg+45nPnIOEfdiYi3a2+eMlq9fjlpMobdBcF32FuZFQPn7J8ZFVxSEQQERcN1p5nxe2Qe4pAD0/pOrN+cz/w8t1mJcuLJSGu+eMvHYreFy0wig9DECsC2cF7kBu2UD6f+XPtXYn1QZGn45SO3XRl4x8TtXG/B3enqEMw==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 11/14] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v5 11/14] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHX4ewLCr4mT3CEwkeKGdBUjNnfXqxf0T8AgCDY2IA=
Date: Wed, 2 Feb 2022 13:15:37 +0000
Message-ID: <af801609-12ca-9908-3bb1-03d4fe75f2bd@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-12-andr2000@gmail.com>
 <a6caa134-cef4-f6b2-378e-759c10a37c0a@suse.com>
In-Reply-To: <a6caa134-cef4-f6b2-378e-759c10a37c0a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80f65a48-0130-4103-b1ad-08d9e64e1ab7
x-ms-traffictypediagnostic: VI1PR0302MB3488:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3488579F3CE7E652F5103158E7279@VI1PR0302MB3488.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AvQ0U7JR6mr4nU3RABnLfKWVcI0C79A5vbVBOuECR3YF/ROeycik4BpostEJFTTvgITKRhd1hpalr87vbAKIxLodfnyc+BcjyhOlPNKZi1yxNMGif6odQ8i7zGMbdKQZ1PRVY4lrYuRTAOoOxLl+pSkcD7CMl/bNnVBJpYr/qNDJQyHXr44VFZ9KJXD59lhOOlFxeVz3Hb5wm16iNNAUZnmZx7HSFmM/Ckj/qDAjOJGSnP6j1KraynFzRWJNFHMZ7caxFEX9fpSjaAFL3CC8pVV+FXrAvWlJERFR7acH8kLYFXEIp7bqs31eYI1gVrkrZlfEHBjvPMKkRBN0qD4Z2tSNGU8BRipYyAyvqPdjQ9hxRO5w99C7CFdHTJKKwKW4Dr0Ij1Tbs/aIGEY5BN4RV+4AjXy7giHuQZvd/Y722JadbPD1s0NNiWI3io1hhT4fSykYHESbNoEfiHrsQ2a2WkmT4FzScscpS8ttnnZnA69YfQD7+PvJSMO+XlocYNalqNhO+2W8QjShlTfL71Oenb6We9JIWWFZPnBGJ+S1kRA+Tog0vS+gih/MfUgIanZyQEUadfqmrzAYV/TTWBz2VewAWoW7+8EBTGa2TgEPcITi42nsTWAhGJOyBWRknm7ESEqI87Y32mF5/TaaPzanxlF+bZmgaiM3zvz6YU5nDAAs81HWsvq6gWnCIXajLIywEiaRqz4Nkj2WneUBfCzd/i9W3Nfkh6unbHjPvXqv9jrDPFuTbQ3vixK+UbrcTgTQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(66556008)(66476007)(8676002)(6486002)(4326008)(66946007)(38100700002)(86362001)(38070700005)(64756008)(31696002)(66446008)(76116006)(508600001)(107886003)(8936002)(186003)(26005)(2616005)(7416002)(6512007)(91956017)(53546011)(31686004)(2906002)(122000001)(5660300002)(36756003)(54906003)(6916009)(316002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VnhacnIxQnc5eFBrSVJaM1FHV0Jjd2V4MG1seGZqT2hYUG16OHlkTk1HQ1Q5?=
 =?utf-8?B?ZWYveVE5YmhFQnMvWGszL3oxblNpditGZjIzSmpINTJ0emxWUjZhdXU2bkI1?=
 =?utf-8?B?cTVNSlFnTERRSnlyVFhIZE5MVlZMeE5MdDVTajk5RndNSitEdVpRSytqSWVS?=
 =?utf-8?B?dnk1dWZtSHU0U0tGWFQzWGVERVF4ZEJqa3F4TTVCUnY1NVlCaWJ2b1J3RHpB?=
 =?utf-8?B?TkltMHZzanc0UVFhRVEwU0VwcStxUVRxcnExaFd0UEdpRW1GY2RrOThidWNL?=
 =?utf-8?B?QzhlRjh4UGpObTJLNWErTVZZVW95RWNSYU55NU40ZVJyMmdWeVZGV0pTQXla?=
 =?utf-8?B?UFRoeWZYYkpKSlVWOUMwcmVjSGpaUk1jTlNEdkM0c0VhSTVNVmZMMFRDT2JZ?=
 =?utf-8?B?OTRFWGRtUTRMOTFONnlxc3NSb2RnMmxwWjVFMnB1WURaeXFFOEI2Tnk0VXoz?=
 =?utf-8?B?K0xUajlZOVlBS0IvTHVqS09yblZidTJVdlN5VmlMODBVWnhqOVFIN3JzUWc2?=
 =?utf-8?B?QWp2bENwdnBHU3grR3BSNG4xczJWNFQzNHR4UUJWSzFENUFpbUdGQXpQejJw?=
 =?utf-8?B?TEdhOTErNjB0ZmdhZjBGVGRQZitDVUNtbXdMSmYwalFuY0JyUmo0OEg3Uzcx?=
 =?utf-8?B?ejRNVytxd0doN05hQ0I3SzNrd0FrT1EzdDZXRmY4SGVLQWUvUDVzeGtmckkw?=
 =?utf-8?B?Rzl6aTdxTHZsNnl6QStSZ1NSRSt0S2RuL0N1VTB2WS9oTEpGdSs0TUlOWGhv?=
 =?utf-8?B?M0ZBOUZHeEE1cVJaR3RXZW1CK0YxT1RCckM3dnhWMmJCb3FSeFNrTjVZWDRP?=
 =?utf-8?B?d2NRSFFncStWb3RkYkFEblRsMmVZZEVrNnc2cVlkQnMrWEhFbElaRUJ1Z0t2?=
 =?utf-8?B?NUNDM0hVQUtWY1E4OUxSSGV0UVl5RDg3ZnVua3hBR1ZyOXJERnRaRkZKbit1?=
 =?utf-8?B?YUV0Z1gxY0FMMnBIalNFZ1lGNjd5SE1UNGFoanJmYVIyRFBjUHRPVHRpcUJY?=
 =?utf-8?B?NmFUK0VNY0ZhWWorOFZGcHJZR3hmSlN6Nnp0UUszTGNCVHZPSXZNdTVWWjZI?=
 =?utf-8?B?a2x3bStwRnZ6TGVDSldWbU9TOFRMRnk0R1NPNHl0anFRNXZUb1plODZvVmV0?=
 =?utf-8?B?Ly9yQ3hKNVNoYVhNbE50bU1oSDV6ZHB1MTB3TWJXWUtFd2dlWC9HRzVaZ1VK?=
 =?utf-8?B?WS9mRDNoZlQ5NUtwNmdkS2NjN0NNb3pmb3QvYzEvZW9TYmdCUFFNL0pUeWpn?=
 =?utf-8?B?R0RjQ0RMTExiTG5EZlgxSmpGdlBvWncvZzA1UUlxaGtMZFc5UWZjRGxLY05Q?=
 =?utf-8?B?OTNud1BQdFVIa2R5b09NUWQ4eDl6dlNEcktqbTNkYWZyU253SWNMeVcrcVEw?=
 =?utf-8?B?YlpIQUhXbWVzWXlTaklWUEdHWDdwVUJ0TStyR24xR25OemIrL1dLWlRjcmo4?=
 =?utf-8?B?SElvanErVUcvU2UxbWpNdE9GWVpDYkVLd2xTb1R5VXQyUmN1SHdicUlhN2dC?=
 =?utf-8?B?SFhDckVKZ3g0WmVERjVEb2d3ZXBlRzRPeStvMHhmdjJIMFNURFpBVSs2ZG9o?=
 =?utf-8?B?aFNBYnd0Nys1ckVnYSs1UEFjZUl0c2VCVmh4TzVzdHdRaVhRdkhKdklRTnFM?=
 =?utf-8?B?Vnh6cGd4cmtONHNUTDZRUThITWN5bnRNYU93WXM0YzJDSFVGdllxWm94NE82?=
 =?utf-8?B?eVVuR1dpclcrdTU1TkN1ZXJiTXdETFFybjlxMC9nb1pUbVpqb2NFU3hRd0o3?=
 =?utf-8?B?M3NlR0Fvdng5SU0xd3BSY1RJOXVRRC9VTHJzNnF0N0dZMEZJTGIvMzllMFVE?=
 =?utf-8?B?U3NIYi9QcTdYODJrUWJoMmNKSTVHUkthU0hQSWxYeUpJMnltc1p1SVFxRmln?=
 =?utf-8?B?akE0UG9pUHUzVXlnL3RIOXN5WGRlMGwvNUNtWTYwbTV5QUpzcXFvcjJpUWFl?=
 =?utf-8?B?SUsxVUowNUZETCt2Q0YzQnNYUEVTbGEzRVpOdzkyRVZSMndnMXZtY2xIZlZP?=
 =?utf-8?B?VC9kbG1RUDZXRmtqeWdjR2RqbU44SE5hTTg3UTRtcGFVVERwOGpTUVVLSEZJ?=
 =?utf-8?B?Ulhta1U3RUZSMndWWEFza1Vyb05VeFRuRWRnaVhrc3FyUnJ0cnU3S0xybGtl?=
 =?utf-8?B?TjlROWthREVGWkRRTWs3dnBaWGR2THNVV1hwRWJqNXM0aFdYYUlYT0pXelh4?=
 =?utf-8?B?T1h4QmRwRkNwbVVUd3hwaHhRb1V1SEdQMTQyQ082d0cwQVVuWnMvalFacVov?=
 =?utf-8?B?Vnp0MjRJcGFvR2dzT092Z1ZKaXJaOFFlRklXV0ZaKy9rdFpLWmE3ZVVNMmVP?=
 =?utf-8?B?c0FnaEJLZGtTTXhON0JtOER6dm13enFHWkNvVDN5WVFxTElEV0ZEZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD41529E15C2D4479A4F4D193690140B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f65a48-0130-4103-b1ad-08d9e64e1ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 13:15:37.9250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phtHEOMZuYLLAUkUMZG9wy7nMEXs6H1LBlOaNGrQPDDvU+a3Az3sBRbwtgG2EXSsHPgaO0gjKgHPIvC5VxhjtUMj7koV/KqTV/+T61Sobuwtt4SukTae5rfySlyKcf6g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3488
X-Proofpoint-GUID: q_2YwYKgcc7ISvvmhmvvGJ0aRe2OKJ5d
X-Proofpoint-ORIG-GUID: q_2YwYKgcc7ISvvmhmvvGJ0aRe2OKJ5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020073

SGksIEphbiENCg0KT24gMTIuMDEuMjIgMTc6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAy
NS4xMS4yMDIxIDEyOjAyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEBAIC0x
NDUsNiArMTQ4LDUzIEBAIGludCB2cGNpX2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCj4+ICAgfQ0KPj4gICANCj4+ICAgI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQ
T1JUDQo+PiAraW50IHZwY2lfYWRkX3ZpcnR1YWxfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBkZXYtPmRvbWFpbjsNCj4+ICsg
ICAgcGNpX3NiZGZfdCBzYmRmID0geyAwIH07DQo+PiArICAgIHVuc2lnbmVkIGxvbmcgbmV3X2Rl
dl9udW1iZXI7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIEVhY2ggUENJIGJ1cyBzdXBw
b3J0cyAzMiBkZXZpY2VzL3Nsb3RzIGF0IG1heCBvciB1cCB0byAyNTYgd2hlbg0KPj4gKyAgICAg
KiB0aGVyZSBhcmUgbXVsdGktZnVuY3Rpb24gb25lcyB3aGljaCBhcmUgbm90IHlldCBzdXBwb3J0
ZWQuDQo+PiArICAgICAqLw0KPj4gKyAgICBpZiAoIHBkZXYtPmluZm8uaXNfZXh0Zm4gKQ0KPj4g
KyAgICB7DQo+PiArICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAiJXBwOiBvbmx5IGZ1bmN0
aW9uIDAgcGFzc3Rocm91Z2ggc3VwcG9ydGVkXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgJnBk
ZXYtPnNiZGYpOw0KPj4gKyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4gKyAgICB9DQo+
PiArDQo+PiArICAgIG5ld19kZXZfbnVtYmVyID0gZmluZF9maXJzdF96ZXJvX2JpdCgmZC0+dnBj
aV9kZXZfYXNzaWduZWRfbWFwLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVlBDSV9NQVhfVklSVF9ERVYpOw0KPj4gKyAgICBpZiAoIG5ld19kZXZfbnVtYmVy
ID49IFZQQ0lfTUFYX1ZJUlRfREVWICkNCj4+ICsgICAgICAgIHJldHVybiAtRU5PU1BDOw0KPj4g
Kw0KPj4gKyAgICBfX3NldF9iaXQobmV3X2Rldl9udW1iZXIsICZkLT52cGNpX2Rldl9hc3NpZ25l
ZF9tYXApOw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBCb3RoIHNlZ21lbnQgYW5kIGJ1
cyBudW1iZXIgYXJlIDA6DQo+PiArICAgICAqICAtIHdlIGVtdWxhdGUgYSBzaW5nbGUgaG9zdCBi
cmlkZ2UgZm9yIHRoZSBndWVzdCwgZS5nLiBzZWdtZW50IDANCj4+ICsgICAgICogIC0gd2l0aCBi
dXMgMCB0aGUgdmlydHVhbCBkZXZpY2VzIGFyZSBzZWVuIGFzIGVtYmVkZGVkDQo+PiArICAgICAq
ICAgIGVuZHBvaW50cyBiZWhpbmQgdGhlIHJvb3QgY29tcGxleA0KPj4gKyAgICAgKg0KPj4gKyAg
ICAgKiBUT0RPOiBhZGQgc3VwcG9ydCBmb3IgbXVsdGktZnVuY3Rpb24gZGV2aWNlcy4NCj4+ICsg
ICAgICovDQo+PiArICAgIHNiZGYuZGV2Zm4gPSBQQ0lfREVWRk4obmV3X2Rldl9udW1iZXIsIDAp
Ow0KPj4gKyAgICBwZGV2LT52cGNpLT5ndWVzdF9zYmRmID0gc2JkZjsNCj4+ICsNCj4+ICsgICAg
cmV0dXJuIDA7DQo+PiArDQo+PiArfQ0KPj4gK1JFR0lTVEVSX1ZQQ0lfSU5JVCh2cGNpX2FkZF92
aXJ0dWFsX2RldmljZSwgVlBDSV9QUklPUklUWV9NSURETEUpOw0KPiBJcyB0aGlzIGZ1bmN0aW9u
IGd1YXJhbnRlZWQgdG8gYWx3YXlzIGJlIGludm9rZWQgYWhlYWQgb2YgLi4uDQo+DQo+PiArc3Rh
dGljIHZvaWQgdnBjaV9yZW1vdmVfdmlydHVhbF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCj4+ICt7DQo+PiArICAgIF9fY2xlYXJfYml0KHBkZXYtPnZwY2ktPmd1ZXN0
X3NiZGYuZGV2LCAmZC0+dnBjaV9kZXZfYXNzaWduZWRfbWFwKTsNCj4+ICsgICAgcGRldi0+dnBj
aS0+Z3Vlc3Rfc2JkZi5zYmRmID0gfjA7DQo+PiArfQ0KPiAuLi4gdGhpcyBvbmUsIGV2ZW4gd2hl
biBjb25zaWRlcmluZyBlcnJvciBwYXRocz8gT3RoZXJ3aXNlIHlvdSBtYXkNCj4gd3JvbmdseSBj
bGVhciBiaXQgMzEgaGVyZSBhZmFpY3QuDQpBY2NvcmRpbmcgdG8gUm9nZXIncyBjb21tZW50IEkg
d2lsbCBub3QgdXNlIFJFR0lTVEVSX1ZQQ0lfSU5JVA0KbWFjaGluZXJ5IGZvciB0aGlzLg0KPg0K
PiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

