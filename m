Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EA429D32
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 07:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206736.362382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maARS-0002Zr-Bd; Tue, 12 Oct 2021 05:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206736.362382; Tue, 12 Oct 2021 05:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maARS-0002XU-6x; Tue, 12 Oct 2021 05:35:10 +0000
Received: by outflank-mailman (input) for mailman id 206736;
 Tue, 12 Oct 2021 05:35:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUjJ=PA=epam.com=prvs=091947bc67=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1maARQ-0002Wd-Og
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 05:35:08 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 286830c6-2b1e-11ec-8110-12813bfff9fa;
 Tue, 12 Oct 2021 05:35:07 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C3m8hK009515; 
 Tue, 12 Oct 2021 05:35:02 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bn0gp8e9x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 05:35:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2768.eurprd03.prod.outlook.com (2603:10a6:800:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 05:34:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 05:34:57 +0000
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
X-Inumbo-ID: 286830c6-2b1e-11ec-8110-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0L71adsplHhtKiMJXbbyVxLAstc1zMgUZ+9jVqEzaEOa+tubayBbUhHlhpd2uqr1SPtNRV1n3pKzdPM9Va/rDmhMV/58JfR6ghTL60nL2vUG8hl8T4bCNhCJKftpmvbfjzNbPy6ugd2rKno+lO7AVkhkuHkusmTPqmSkBIt2JhK8UU9+41fQRdQeYdOkuwtQwkD0pwomqUZT1/NIjlZBeXjit6rlUuM+fHF9S75rJxPFTp0wDMWzICP7j5IWY5bt1wtTTL1mkOL3H9aL4dgVKULX2vO0z+jnVVZigLhSK2s47EZkJhMNrZlMgtr01QcXd+GyidzhEpKhX6mRE2N3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qAI6hrCLaj07iwVgjkx6oF+//QWPUavjl1iD8By0QE=;
 b=Iqn9boVcF1IlPRm6jkgU4WiK7nDe28hDcX9pYuwhuKFHDP5j0ohVMoWfff7dwmDFKxKUYIfwMIIN/EWdtRMjgsf7d3KWJGN9zGN4PR2J75iXENP/k2nb2OnR+7Wh2Bb2rCXgeQfrKEYFxkeIob7QsDhWqN3dBmVLo83k+6mmbOuQm8s23fjVcJFWTK/2aIrUMG8REG+xYMvdmBOYqecXmK5Z9FXfKWL94g/MX12eSGE6AsB3h3ywrCttPdsDpsSXD2KvsnwKSWSiv7sFGrshqHYqjET9GGcXcumkUD/KIt3wR/HD3BpVxoiXZ7V11O4aOwD0RgDFf58fY8KqIEL0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qAI6hrCLaj07iwVgjkx6oF+//QWPUavjl1iD8By0QE=;
 b=1Xtq92CCgYotJkWlGLiE6KFR7xgvYkIRC2C3dOQDtQQvxa+L+20eKrrgYZPKqwqB0uSZSpZYcboj73v3L+ZQX/U6M7+ezo8UQKpmeUBhZffxtxiWvUcxQRSpbfFKKWGOFEJDNo50r04kPE96MvJh0QsJV52FV4UM0VAgN8QfOySzJZfHNqVjCZo/mX8Te2vLQFbNAnYgOihOZf4IdWgxZFORScLdGHt9L78UXb1RJpfzy/UFiE5tp81Dg43RYkUyuulU+Yk4WwlnozXLRWqbxld1vwLyea7gcY12nB/eKstYeT/fDSCJlySOcs97Uaf0mFulZ27H/LthJS1n0JgmEA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: 
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavNphKAgABZ5QCAAAISgIAABoqAgAAJBQCAABTvgIAAD/UAgACpmAA=
Date: Tue, 12 Oct 2021 05:34:57 +0000
Message-ID: <b0b0fef0-5985-f2ac-8d62-1cdf9b2e2153@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
 <4F406854-4F90-48F6-8470-6CCB60A3CB77@arm.com>
 <e199bfe2-0bcc-989f-fd4a-ecf44a3cd1ac@epam.com>
 <YWRpuUtHkyA4RY5H@MacBook-Air-de-Roger.local>
 <AF7AB609-3E79-4017-A296-CC7C87E1705F@arm.com>
 <611b61a4-9635-f1e6-a078-e40d4cbd49fd@epam.com>
 <alpine.DEB.2.21.2110111226220.25528@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110111226220.25528@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69355542-7505-4d49-52a5-08d98d4206f0
x-ms-traffictypediagnostic: VI1PR0302MB2768:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2768B918CBF0B85FE304F5F7E7B69@VI1PR0302MB2768.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nDB4vZAS3ibAWLLTjM0yg2x/V+uSvTX1spJnsidBRNVZdGcYm1Zgy7aZYUtEgvAPIEbFY7sQFzfhTZVoMNSWyMIPrSvs2gzP6A0TcuKnGZ3rbT3KpIo7M8EDUTNzySJJr3k1Sipjo9LX0L6Day1NERFrxsoxyXx9f+YdOcxG71mlUQIw57o7NOqY/W5lkUUNVVCIpB+MD0SLiO3jrsWYGtOC6F0I63vpaTP1HUDaEcJVDn9v1kB9jg4tju/6lpI1n2oRbr8MGrRlBISdX24L327FYaVnOXL8yqrF/OjHjurMYcjyZ2RQhgMRQh6iEXsDT15uf0fqMF7v7wAGd7LyDG3Fg/c4YbpVcZ7fx2v3OzdmY9MRI5Jeo4Ir+a2M0dsXPMm1PddnQJ+0lLrbrPPMkh/UOPwPHGBUwobXlLREwiwkyIZUZU4dD0ICMKUERbedWREoA4OOhVoIUg02wR4aIZgi/oY8qcZLsJfTwtnwrLyUSCcgwjmr2Xr3BCSvZ0qMK1NewlpxseGAHc2SU6Cl9dqRTYSKNoL9eAW4g8eF6ZLbjSNfPJyzOBC8VyWFW7e9HDTCs15YPSh9258MIJ62mtMWMMCIpQoQ/de2ncrgVd+6w19dmt9nxJ1izcxqUTXD3qBxdubuIZZJvVBpndqak7qCubC+HcGCRGdJSY782HPqEXrBvCaasLTYvY3C+5EYlvZBqdx8Ww60kK1NX77QMxEjY40PDEjd7jQFAbxg+zhqBWLTW1x9+f9KuAv1QvlJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(71200400001)(2616005)(38100700002)(6916009)(54906003)(76116006)(91956017)(6512007)(31696002)(66446008)(64756008)(66556008)(66476007)(316002)(7416002)(8936002)(2906002)(508600001)(26005)(107886003)(186003)(4326008)(6486002)(83380400001)(86362001)(122000001)(36756003)(53546011)(6506007)(31686004)(38070700005)(8676002)(5660300002)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U2hudjJJdHBUU2hMWnN2Sm01WkJQSmVQUTc5S2xpSmpXaFMvejJzUUJxS3Qy?=
 =?utf-8?B?dU9pcFN0dlpsZkhLSHR0bmNmZXkvZWN0NENlS0lQa2g4UHhFcnZoWkxyM2pr?=
 =?utf-8?B?cytrUDdSdEk4TkUxc2ZqZzRuT2YvZHlDRXVEUkZHRDFaL21tQVJPVzF4L0t5?=
 =?utf-8?B?a2V2UkFJMUZ0WFNhTmtyVXJ3YXZjZ2NOSnBqWmlQZGhDM0c4QkU1QzJCOHpR?=
 =?utf-8?B?azdKTmFDcU0vNjhDUDhTTUlwTTVKQk9BdGtsWkIwQW0walBHV2FjZUVuVEh1?=
 =?utf-8?B?QXFCeHRpaDI4Zm1qN2c1YmVWYnV6amNEOFd3UVArbjIvT3R0NDBPUnpjRTYy?=
 =?utf-8?B?amd5UHg2cXlRdlR3RTNkcFc1ZlRBN2YxM1liRTNQbUdzTG5KS2VCNVhFaWJM?=
 =?utf-8?B?ZDBPTWRTV2UxRFRmMS9uQ2QxUUpSNG9HekZRQXVNNUVWY0U3dGo5R0ZsVjNl?=
 =?utf-8?B?S3FiQnJMa1BKVllOWWlRQ3gydEo1MmN6eHBmMHp2MjUwRUJLeUY5em16NkZV?=
 =?utf-8?B?MHBRY0FKVWIvR3E5NUVpQTZaYkZ0SlV1a3VnY1gwYzlJeW9QaGg3UnZUV3Q0?=
 =?utf-8?B?bWo3dFlyOEdURTNDTVRjV2hkT3o3ZWRCU3FWVFFkWHFrUXZIQnZoWmtnYmlS?=
 =?utf-8?B?ekJSeXlKUXN0YSsxaERvQndUaDBMNlVUK29OeHVsMWFJSk91alo0c1UxbGk1?=
 =?utf-8?B?WUdsenR6Y0ZsTzJlSG5idzcvSjlKRWVrOVNidllnK0pnNzN1Tm5qRjFWRG96?=
 =?utf-8?B?Sk9aUG8vbUtMNk50UVpLbm91NlpVTFRLYlo5WVc2enV4bFJFWEhmMC9kVGRt?=
 =?utf-8?B?bkRwNy9hRDdZSm1KMklTZHFXNWRTY2pqc01ENEVPMkJXNHE0VmFwUjg5YkVT?=
 =?utf-8?B?VkJsMXVNd3JxOWFFa0RoSGs1bVZGVUtUeTNFSTJzZit3cm55eFQ3SmNDOXFm?=
 =?utf-8?B?N3p1dUNHbUl0VnhhN1RFWnJKMmthYVF5V3p6R0NCYmRoL1QraHF2WTVhZ0sx?=
 =?utf-8?B?QmRSK21sb2p0YWtWR081Y0ppaHc3NndoZ3R4MlVDTi96aDBSOHJpcHptTG9E?=
 =?utf-8?B?Ykd1VFpEeHJGODQyWmY1ZzRJdnRuTWZXaFRWMVVpaUt5alAyWTcxSlREL0dT?=
 =?utf-8?B?NTRVWHozeTJ4T0h4WmFqN214TEZQUmUyU0QzcGNUOHY3bE8yR09uRm4rSzB2?=
 =?utf-8?B?ZjhoVi9uRUN2RkRuaThuMi9TekJyNHJKcTljK1RwYVQ3OHkzbjRuU0VUSGpj?=
 =?utf-8?B?TllTNlMrU0tWZ2l5RkZMNkNqdHpHcnF4RVE1T0FubTVzNmR5YTVnUzN0NmRC?=
 =?utf-8?B?ZWZFTGZtVk9WeXdyU09HZmVXVy9DdEJzMnRzUGpYd2E3cVhQY1hlWnM4WUxk?=
 =?utf-8?B?ZmgvVVhFOS9xSzV3VHVQSHYyWkZNempVQThPTm14dWdKSFlSOWpBVDhMK0xC?=
 =?utf-8?B?U21PL1RQNzlNSlFqbFpZakxKTk1XdWE4Ny9Yc1JpUDAzZUY0RDc0Z0EyQ2NY?=
 =?utf-8?B?VlRNeUxiMnVZLzFpQVVoTzlmeHg5OFVQR0srUXQ5bk94TVNtVmg4TGc2ZHJp?=
 =?utf-8?B?NEovN0pVam9pVElmT0NnMTBDN3praSswd294KzNmN0pQbWNEcXVUekR1QkxB?=
 =?utf-8?B?SmUxNnRVd3I3ejNMZmdLSG0yV3dQYU54Z0E5ckRvcjFEYSthZVVjTFNDZENo?=
 =?utf-8?B?UUs3OWRTZmJVV0RoUUlucHZpNmR2dERWZkYwL05ieElOSVJiMEZRbytndUd5?=
 =?utf-8?B?RHd4L2FxNmZacWRSY0NKQ0JpbWxldm96UkEyWitLV2VGdVJFMzN1V1c3STdq?=
 =?utf-8?B?K2EyanRmRUt5NnFNNHpRdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A81FCB9D40E65A4084EF80BD6CE7990E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69355542-7505-4d49-52a5-08d98d4206f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 05:34:57.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bB2ShlEhreycuxgfSVMZWJHsgO/Txxi5we/QB1for21y8QNuDSUVisdgrnNBSIZyYI72zOGHKnj5SNjrpbzo1u0fuRDd4XxO1sR2wLK7h4yOo7f83PWtOQ1uNOZUC3Zi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2768
X-Proofpoint-ORIG-GUID: B3H6BzW-RcM_2GaWpENtVqyllXMS-3Tu
X-Proofpoint-GUID: B3H6BzW-RcM_2GaWpENtVqyllXMS-3Tu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_01,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120030

DQoNCk9uIDExLjEwLjIxIDIyOjI3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIE1v
biwgMTEgT2N0IDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMTEu
MTAuMjEgMjA6MTUsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gSGkgUm9nZXIsDQo+Pj4N
Cj4+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDE3OjQzLCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+DQo+Pj4+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0
IDA0OjIwOjE0UE0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4g
T24gMTEuMTAuMjEgMTk6MTIsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4gSGkgUm9n
ZXIsDQo+Pj4+Pj4NCj4+Pj4+Pj4gT24gMTEgT2N0IDIwMjEsIGF0IDExOjUxLCBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9u
IFdlZCwgT2N0IDA2LCAyMDIxIGF0IDA2OjQwOjM0UE0gKzAxMDAsIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+Pj4+Pj4gVGhlIGV4aXN0aW5nIFZQQ0kgc3VwcG9ydCBhdmFpbGFibGUgZm9yIFg4NiBp
cyBhZGFwdGVkIGZvciBBcm0uDQo+Pj4+Pj4+PiBXaGVuIHRoZSBkZXZpY2UgaXMgYWRkZWQgdG8g
WEVOIHZpYSB0aGUgaHlwZXIgY2FsbA0KPj4+Pj4+Pj4g4oCcUEhZU0RFVk9QX3BjaV9kZXZpY2Vf
YWRk4oCdLCBWUENJIGhhbmRsZXIgZm9yIHRoZSBjb25maWcgc3BhY2UNCj4+Pj4+Pj4+IGFjY2Vz
cyBpcyBhZGRlZCB0byB0aGUgWGVuIHRvIGVtdWxhdGUgdGhlIFBDSSBkZXZpY2VzIGNvbmZpZyBz
cGFjZS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBBIE1NSU8gdHJhcCBoYW5kbGVyIGZvciB0aGUgUENJ
IEVDQU0gc3BhY2UgaXMgcmVnaXN0ZXJlZCBpbiBYRU4NCj4+Pj4+Pj4+IHNvIHRoYXQgd2hlbiBn
dWVzdCBpcyB0cnlpbmcgdG8gYWNjZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlLFhFTg0KPj4+Pj4+
Pj4gd2lsbCB0cmFwIHRoZSBhY2Nlc3MgYW5kIGVtdWxhdGUgcmVhZC93cml0ZSB1c2luZyB0aGUg
VlBDSSBhbmQNCj4+Pj4+Pj4+IG5vdCB0aGUgcmVhbCBQQ0kgaGFyZHdhcmUuDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gRm9yIERvbTBsZXNzIHN5c3RlbXMgc2Nhbl9wY2lfZGV2aWNlcygpIHdvdWxkIGJl
IHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+Pj4+Pj4+PiBQQ0kgZGV2aWNlIGluIFhFTiBhbmQgVlBD
SSBoYW5kbGVyIHdpbGwgYmUgYWRkZWQgZHVyaW5nIFhFTiBib290cy4NCj4+Pj4+Pj4+DQo+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+
Pj4+Pj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+DQo+Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+IENoYW5nZSBpbiB2NToNCj4+Pj4+Pj4+IC0g
QWRkIHBjaV9jbGVhbnVwX21zaShwZGV2KSBpbiBjbGVhbnVwIHBhcnQuDQo+Pj4+Pj4+PiAtIEFk
ZGVkIFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+DQo+Pj4+Pj4+PiBDaGFuZ2UgaW4gdjQ6DQo+Pj4+Pj4+PiAtIE1vdmUgYWRkaXRpb24gb2Yg
WEVOX0RPTUNUTF9DREZfdnBjaSBmbGFnIHRvIHNlcGFyYXRlIHBhdGNoDQo+Pj4+Pj4+PiBDaGFu
Z2UgaW4gdjM6DQo+Pj4+Pj4+PiAtIFVzZSBpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCgpIGlu
IHBsYWNlIG9mIHBjaV9wYXNzdGhyb3VnaF9lbmFibGVkIHZhcmlhYmxlDQo+Pj4+Pj4+PiAtIFJl
amVjdCBYRU5fRE9NQ1RMX0NERl92cGNpIGZvciB4ODYgaW4gYXJjaF9zYW5pdGlzZV9kb21haW5f
Y29uZmlnKCkNCj4+Pj4+Pj4+IC0gUmVtb3ZlIElTX0VOQUJMRUQoQ09ORklHX0hBU19WUENJKSBm
cm9tIGhhc192cGNpKCkNCj4+Pj4+Pj4+IENoYW5nZSBpbiB2MjoNCj4+Pj4+Pj4+IC0gQWRkIG5l
dyBYRU5fRE9NQ1RMX0NERl92cGNpIGZsYWcNCj4+Pj4+Pj4+IC0gbW9kaWZ5IGhhc192cGNpKCkg
dG8gaW5jbHVkZSBYRU5fRE9NQ1RMX0NERl92cGNpDQo+Pj4+Pj4+PiAtIGVuYWJsZSB2cGNpIHN1
cHBvcnQgd2hlbiBwY2ktcGFzc3Rob3VnaCBvcHRpb24gaXMgZW5hYmxlZC4NCj4+Pj4+Pj4+IC0t
LQ0KPj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+PiB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICB8
ICAgMSArDQo+Pj4+Pj4+PiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICB8ICAgNCArKw0K
Pj4+Pj4+Pj4geGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgfCAgIDMgKw0KPj4+Pj4+Pj4g
eGVuL2FyY2gvYXJtL3ZwY2kuYyAgICAgICAgICAgfCAxMDIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4+Pj4+Pj4geGVuL2FyY2gvYXJtL3ZwY2kuaCAgICAgICAgICAgfCAg
MzYgKysrKysrKysrKysrDQo+Pj4+Pj4+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8
ICAxOCArKysrKysNCj4+Pj4+Pj4+IHhlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmggIHwgICA3
ICsrLQ0KPj4+Pj4+Pj4geGVuL2luY2x1ZGUvYXNtLXg4Ni9wY2kuaCAgICAgfCAgIDIgLQ0KPj4+
Pj4+Pj4geGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggfCAgIDcgKysrDQo+Pj4+Pj4+PiB4
ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICB8ICAgMiArDQo+Pj4+Pj4+PiAxMCBmaWxlcyBj
aGFuZ2VkLCAxNzkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pj4+Pj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdnBjaS5jDQo+Pj4+Pj4+PiBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2FyY2gvYXJtL3ZwY2kuaA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4+Pj4+Pj4+
IGluZGV4IDQ0ZDdjYzgxZmEuLmZiOWM5NzZlYTIgMTAwNjQ0DQo+Pj4+Pj4+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vTWFrZWZpbGUNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0K
Pj4+Pj4+Pj4gQEAgLTcsNiArNyw3IEBAIGlmbmVxICgkKENPTkZJR19OT19QTEFUKSx5KQ0KPj4+
Pj4+Pj4gb2JqLXkgKz0gcGxhdGZvcm1zLw0KPj4+Pj4+Pj4gZW5kaWYNCj4+Pj4+Pj4+IG9iai0k
KENPTkZJR19URUUpICs9IHRlZS8NCj4+Pj4+Pj4+ICtvYmotJChDT05GSUdfSEFTX1ZQQ0kpICs9
IHZwY2kubw0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IG9iai0kKENPTkZJR19IQVNfQUxURVJOQVRJVkUp
ICs9IGFsdGVybmF0aXZlLm8NCj4+Pj4+Pj4+IG9iai15ICs9IGJvb3RmZHQuaW5pdC5vDQo+Pj4+
Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jDQo+Pj4+Pj4+PiBpbmRleCAzNjEzOGMxYjJlLi5mYmI1MmY3OGYxIDEwMDY0NA0KPj4+
Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+Pj4+PiArKysgYi94ZW4vYXJj
aC9hcm0vZG9tYWluLmMNCj4+Pj4+Pj4+IEBAIC0zOSw2ICszOSw3IEBADQo+Pj4+Pj4+PiAjaW5j
bHVkZSA8YXNtL3ZnaWMuaD4NCj4+Pj4+Pj4+ICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+DQo+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4gKyNpbmNsdWRlICJ2cGNpLmgiDQo+Pj4+Pj4+PiAjaW5jbHVkZSAidnVh
cnQuaCINCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgdmNwdSAqLCBj
dXJyX3ZjcHUpOw0KPj4+Pj4+Pj4gQEAgLTc2Nyw2ICs3NjgsOSBAQCBpbnQgYXJjaF9kb21haW5f
Y3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+Pj4+PiAgICAgICBpZiAoIGlzX2hhcmR3YXJl
X2RvbWFpbihkKSAmJiAocmMgPSBkb21haW5fdnVhcnRfaW5pdChkKSkgKQ0KPj4+Pj4+Pj4gICAg
ICAgICAgIGdvdG8gZmFpbDsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiArICAgIGlmICggKHJjID0gZG9t
YWluX3ZwY2lfaW5pdChkKSkgIT0gMCApDQo+Pj4+Pj4+PiArICAgICAgICBnb3RvIGZhaWw7DQo+
Pj4+Pj4+PiArDQo+Pj4+Pj4+PiAgICAgICByZXR1cm4gMDsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBm
YWlsOg0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+Pj4+Pj4gaW5kZXggYzVhZmJlMmUwNS4u
ZjRjODliZGU4YyAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYw0KPj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+Pj4+
PiBAQCAtMzA1Myw2ICszMDUzLDkgQEAgdm9pZCBfX2luaXQgY3JlYXRlX2RvbTAodm9pZCkNCj4+
Pj4+Pj4+ICAgICAgIGlmICggaW9tbXVfZW5hYmxlZCApDQo+Pj4+Pj4+PiAgICAgICAgICAgZG9t
MF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaW9tbXU7DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4g
KyAgICBpZiAoIGlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0KPj4+Pj4+Pj4gKyAgICAg
ICAgZG9tMF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfdnBjaTsNCj4+Pj4+Pj4gSSB0aGlu
ayBJJ20gY29uZnVzZWQgd2l0aCB0aGlzLiBZb3Ugc2VlbSB0byBlbmFibGUgdlBDSSBmb3IgZG9t
MCwgYnV0DQo+Pj4+Pj4+IHRoZW4gZG9tYWluX3ZwY2lfaW5pdCB3aWxsIHNldHVwIHRyYXBzIGZv
ciB0aGUgZ3Vlc3QgdmlydHVhbCBFQ0FNDQo+Pj4+Pj4+IGxheW91dCwgbm90IHRoZSBuYXRpdmUg
b25lIHRoYXQgZG9tMCB3aWxsIGJlIHVzaW5nLg0KPj4+Pj4+IEkgdGhpbmsgYWZ0ZXIgdGhlIGxh
c3QgZGlzY3Vzc2lvbnMsIGl0IHdhcyBkZWNpZGVkIHRvIGFsc28gaW5zdGFsbGVkIHRoZSB2cGNp
DQo+Pj4+Pj4gaGFuZGxlciBmb3IgZG9tMC4gSSB3aWxsIGhhdmUgdG8gbG9vayBpbnRvIHRoaXMg
YW5kIGNvbWUgYmFjayB0byB5b3UuDQo+Pj4+Pj4gQE9sZWtzYW5kcjogQ291bGQgeW91IGNvbW1l
bnQgb24gdGhpcy4NCj4+Pj4+IFllcywgd2UgZG8gdHJhcCBEb20wIGFzIHdlbGwuIFRoZSBEb20w
IHRyYXBzIGFyZSBub3QgaW4gdGhpcyBzZXJpZXMsIGJ1dA0KPj4+Pj4gYXJlIGluIG1pbmUgYXMg
aXQgbmVlZHMgbW9yZSBwcmVwYXJhdG9yeSB3b3JrIGZvciB0aGF0LiBQbGVhc2Ugc2VlIFsxXQ0K
Pj4+PiBUaGVuIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHNldCBYRU5fRE9NQ1RMX0NERl92cGNp
IGZvciBkb20wIGhlcmUsIGl0DQo+Pj4+IHNob3VsZCBpbnN0ZWFkIGJlIGRvbmUgaW4gdGhlIHBh
dGNoIHdoZXJlIGRvbTAgc3VwcG9ydCBpcyBpbnRyb2R1Y2VkLg0KPj4+IE9rIEkgd2lsbCBjaGVj
ayB0byByZW1vdmUgdGhpcyBhbmQgaW5jbHVkZSB0aGUgY2hhbmdlIGluIHY2Lg0KPj4gSnVzdCB0
byBtYWtlIGl0IGNsZWFyOiBkbyB3ZSB3YW50IHRvIHJlbW92ZSB0aGlzIHBpZWNlIGZyb20gdGhp
cyBwYXRjaA0KPj4gYW5kIGluc3RlYWQgaGF2ZSBhIGRlZGljYXRlZCBwYXRjaCBvbiB0b3Agb2Yg
bXkgc2VyaWVzLCBzbyBpdCBpcyBlbmFibGVkDQo+PiByaWdodCBhZnRlciB3ZSBoYXZlIHRoZSBj
b2RlIHRoYXQgc2V0cyB1cCB0aGUgdHJhcCBoYW5kbGVycyBmb3IgRG9tMD8NCj4+IElmIHNvLCB0
aGVuIGRvIHdlIHdhbnQgdGhhdCBwYXRjaCB0byBiZSBjaGFpbmVkIGluIG15IHNlcmllcyBvciBz
ZW50IGFzDQo+PiBhIGZvbGxvdyB1cCByaWdodCBhZnRlciBpdCBzZXBhcmF0ZWx5Pw0KPiBJIHRo
aW5rIHdlIHdhbnQgdG8gcmVtb3ZlIHRoZSBYRU5fRE9NQ1RMX0NERl92cGNpIGNodW5rIGZyb20g
dGhpcyBwYXRjaC4NCj4NCj4gV2hlcmUgZXhhY3RseSBpdCBzaG91bGQgYmUgaW50cm9kdWNlZCwg
SSBhbSBub3Qgc3VyZS4gSSB0aGluayBpdCB3b3VsZA0KPiBiZSBPSyBhcyBhIHNlcGFyYXRlIHNp
bmdsZSBwYXRjaCBhdCB0aGUgZW5kLiBJIGRvZXNuJ3QgaGF2ZSB0byBiZSBwYXJ0DQo+IG9mIHRo
ZSBvdXRzdGFuZGluZyBzZXJpZXMsIGNvbnNpZGVyaW5nIHRoYXQgd2UgYXJlIGFsc28gbWlzc2lu
ZyB0aGUNCj4gcGF0Y2ggdG8gYWRkICJzZWxlY3QgSEFTX1BDSSIgZm9yIEFSTS4NClllcywgbWFr
ZXMgc2Vuc2U=

