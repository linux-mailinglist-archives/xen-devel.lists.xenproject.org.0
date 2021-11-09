Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B630044AA77
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 10:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223805.386698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNIg-0005gq-Vc; Tue, 09 Nov 2021 09:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223805.386698; Tue, 09 Nov 2021 09:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNIg-0005e8-QV; Tue, 09 Nov 2021 09:20:18 +0000
Received: by outflank-mailman (input) for mailman id 223805;
 Tue, 09 Nov 2021 09:20:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWUs=P4=epam.com=prvs=19475aedfb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mkNIe-0005dv-BC
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 09:20:16 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e6cea56-413e-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 10:20:14 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A993s6D004946;
 Tue, 9 Nov 2021 09:20:11 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c7p1cg38e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 09:20:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2801.eurprd03.prod.outlook.com (2603:10a6:200:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 09:20:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:20:08 +0000
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
X-Inumbo-ID: 3e6cea56-413e-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeiIDd31q7ActeIQgdnTIcFndmMKCUupY5GNL4B+yM1dMD0x0o9rTPYXvEak/6h1Feo9wWLqEXdbD815OyUW2/3G7se+ZZtyzuBsTYcRbv/Wav3P/CcpTdOJ1bqMM60/0/EFJPrk46egYoSbXbxoKZ+Ly+Gwl0HFtwucSbERKDBu/tbsW52T6OvX3HTGDclMerXAZbyc1do/POZqHf3SGDUCmLa/FKpvSjqUGNQgmVrFSdeI7Wdbs2l0ZHlC9fBnVt9wb6SQe3utpeTvWrQ/WWNQcZJv92sTG1NKggK8qElUs7DPolrjciBaYA9swazFrSLNVwfb8naxzBiPKo+gJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSaoZOnfQ5M7uQbM3WDYGvwgK1SH1oBRNQXWXT59lKA=;
 b=XHrysb1ogpcgkPpJ347Vw5GANBa/wsCL3UbtupQKTVdz2L1ubwAz2HprhxMPXJOfWVNl1W9YxKOcCAe8DrSiTwneICUd4rQcujZsyNvq0ZftFh/lhr7gbrDZedoLUZniPRt6y6sNVRpa3bTfkaqb4BhYgKj4vxAGb+cmOKT2AabKt6XkLjY09LrzsmK0oHjsbG8Npcd8+t7k2CdZD6ty7NjeC+jIbpydQScp6vYT666VZ57PDPthl8KMYMq0vUsYSWIWeh2AkfjKwOBABIAMKU2LAou/tl6e3/WWlPdFuT1Q5HlSaljvXWfc/8x6A8SRG3O3NvdLByZgoRQXs5Ku/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSaoZOnfQ5M7uQbM3WDYGvwgK1SH1oBRNQXWXT59lKA=;
 b=L9Zs+6o/5DWvnWWxC2Fk45rRfqTQncOQ3dDjd1dLpPKGokWSml5DkZ0SekXFB4+Z0pphS36OvgA53GoWcRlz+F8ul/cizhgtaYVo+G7wImkhwa6zAoRp5dsyzh+F6sQvbndyW3WJcEAZwvI3jLHfMNdSZPuE1qcgSufweHDLqUmq06fC76PUMIQgLGE1NGmgCj+ZaKsOP/rMha7zPrFYvePX+ppL4rWCWbjGr882/15kn4j6zldTT6u5GA1k3DYfShFM6MXTEbUwuns7MytZTrBBlUl6fKyFVr9uGXnz+Ol1b4qgcwtXnUulFXY6wJ4HzraLX9DdrvcTayR9HE20/A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHX0g8SPRoS2Ac9eEeTcWew1GI8x6v68dqA
Date: Tue, 9 Nov 2021 09:20:08 +0000
Message-ID: <6a8febab-1bd7-7896-e1da-b021513293ac@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-4-andr2000@gmail.com>
In-Reply-To: <20211105063326.939843-4-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf0f41c9-25c6-4021-a279-08d9a3621fbb
x-ms-traffictypediagnostic: AM4PR0302MB2801:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB280189754507DC4A701CFF77E7929@AM4PR0302MB2801.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aReg3K8foG/D9c8yV1gUpbI8p7lbW9OCAXNgfqHEmsA5nL4oSryk08IUZ6ltL3914PCNiWRq0ANvSZpUtZBiM4ZUivrOqHc525YkNM5RNFDCFxzwMZz46RDzstr5RT+OH63y2rxSzfuNRYog8MKhk6Ww4WOg+DO4HuCaiQT0K8QaB3vbUrpMChbHlT3cvbuK4yw44xwcDL+v/RTy/Uwfnq1ywft4Di22il/rmazszTLWqoDYyEMlL9Z8vaNFHzENQRwt/XyDhbscqnhlTNX7tOEob2N26kQO169k+kB6sewUiY9iDMx+ZLo0GRLZvTTGgHyvOIZHAPxc5U06hLoqX7ohjWmw3Cr9nPUaxE1jveilzuyHaABIMDEpoVUSnlSiHgDOO1poHPP9RyVv6EE4GL08qzl9bHTAOMd22qBHrlcJ5eXsebfCT7FG0BVFphIQwcpdeC36gcVeAhnptzMzK4HT5SnBfQg5R0R37wfpEFxkIp5LcCZpEK3QjkBhebZ92nzot39ODoVTqvjOl/WJnXY9EnKZj+pjn9BoaFCDWCQ0BdC2/YaUFDwWhDpMoyVG1VcDO6siwBRHuGgHhe77+5diHZx+21j6Ur8ztmBS6NvxPFjmdOeao91H37gUBxOA9H+6Q13mOHSDDPYAivkxYuEyK958vyaIZImnC+rqVcHtM4d4gP1+vM+dab7tBOK2vCG4ItuIzgi9pJmKv/+u2rGu/XCfrUX0CQ6+WGNtMEDR4f/Bb8LePMt6EEQTuZ9s
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(86362001)(6486002)(6916009)(66446008)(64756008)(66556008)(508600001)(2616005)(26005)(54906003)(66946007)(91956017)(36756003)(7416002)(5660300002)(76116006)(71200400001)(2906002)(31686004)(38100700002)(107886003)(53546011)(122000001)(4326008)(6506007)(31696002)(8936002)(38070700005)(8676002)(186003)(316002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YkJJb3pvcndDbWl6cDRoUmFxaTI3Qk9QYjh3eS9VRnlkMXVhaDcwMHZmWEpr?=
 =?utf-8?B?YkpMV2kwdEMrR2JIVE1EZ3RxU29LY3B6elJTN0oyUjdLYnlwTFRjTVlTRVV4?=
 =?utf-8?B?Z2s5YVQxUUVGRmE3RnNKdEozOVlzdW9WYWQ5aWlIbTNZSGJUbDdzS1UrSFBH?=
 =?utf-8?B?UGJNUVVSQXZtM05JK1lNZFlueFIvUDJRZi82V1ZQcjJGYmdIcFl1ZDdZVzIx?=
 =?utf-8?B?b1VUZkFLRCs4M21acXdKMXhnMlUxajNucFAyeElySHQ4M212K0pIL3FLVE9o?=
 =?utf-8?B?VlNOT09VWVlRVjZpSEJBaXJ5L2phQTluenI4WXFvOUh2SGFVRFg2eWpWYWQy?=
 =?utf-8?B?aGlFQk1HSEZaVHNxY3MwTkNsenZoZ29tWjZGYytOZ1BSV0tMUGRNQkM2Q3dJ?=
 =?utf-8?B?MGRXV1BaMjZtdU9ROEdGclRzTnFFa2Evd2d4eXowN0NBMGNUNHAvZWhSelI0?=
 =?utf-8?B?NVFmbnYrZ3lYU1ZrbE9Dc2c0ZlpuOU9BanFkUFZiYmxXYVdQRmV6UUJzZnpO?=
 =?utf-8?B?Y1pGLy9EKzdocmtzbnN5Y3R4Tnc4bXpFb0pHR1I2VTduQXVxblRlVHNydnBR?=
 =?utf-8?B?dkFBQVBraHlsTnY4dnNQNTkrWU5KTmNhU3ZVMnFzYXhmaE9TRjM4M2g1ZTQw?=
 =?utf-8?B?L3NpSHcxaVJBMGlkTENLQi9aUHVZYm9XZXRDcWFHalpVQk93R1hJQnJ1aVMz?=
 =?utf-8?B?SUlrS0Qyc3hLekJTOWd2VUlsaWErbHV5MmVJbWUyWXJxOXhiRWRNc0xVSS84?=
 =?utf-8?B?OGxZR1lVK1lsNURsd2djNDJHMlZMTWFDenREcm1SMHhWQUU2SElQS2dOTUVt?=
 =?utf-8?B?T3h4N1o4c3M1aU8vYzZaVUYzZmxMd290K2gvL05RSDdIdzVIc3dvcXk2aGd1?=
 =?utf-8?B?aTJVc3QzUkFibkxLYjhnd2h3VkRzRDR5U2g1TDkvMC9qSEl1TWxiK1U0Skcz?=
 =?utf-8?B?a3N4ajU5MDJYUWN4bUNQWU1zaVdFclRrMk9yRkV4WDNlVjhTUTltVnpGVXdz?=
 =?utf-8?B?MDN3eE5HeEF4V0hwVkFxbTVaVzVNVWNYcTZyRTNjTDlyd0dZdG9mbC92VTJ3?=
 =?utf-8?B?b0hhU0ExN2JmSTkrYmV0aFdYNksraThmcHJXRWJOWERWOXVrdGZrMWlXcUhE?=
 =?utf-8?B?MzUvaGd5K1hmYVY1WHF2cyt4dlRFTmVlM3ZITEpBTWwzRXhZeGx6SG9wS2lQ?=
 =?utf-8?B?Q0h4UTh5ak14Q2pzL2JQWFlGUHJhTU1rRlpZNDQwKzFXWmwzcDV6UE14eUUy?=
 =?utf-8?B?UmpVVUZBcVBheFJteEdOWlJlNVJ0VUVKcTdBcWtZU2gveXlGSlJWY0txSlk3?=
 =?utf-8?B?V3l1UW9nN3NidTFYMUFPUytwUFpoZFFrM2VPRk02UUE2MGlPTmxpWXRMOS9U?=
 =?utf-8?B?UzhVa0hweGNKSHJaUFRXTk4zazRkckNpb0xFV1lqZklldFRSTmxPd2VFWVNF?=
 =?utf-8?B?QjV5ZzlMYk5rNWljQ2dEOVhxMDBZNGVnNDlXU2JiQkM5OXZsVy84NUFNSFVl?=
 =?utf-8?B?SzF0ZFlQdC9OcXJUa3ZhSExac1BscUMvc0E5WmNueGd0VzUxQ1RFRXhVK0tv?=
 =?utf-8?B?YUc0SStURzJFeDNaTEE2MmJWVXZnbmFnVFVyS2NrL29mRlltaXFINE16SFZI?=
 =?utf-8?B?Z2xhTEVWNUMvU1RYaC9SYnM1QjFwYnM0Y1hUUTZIUHZVZXN0SjRhWlRBRzlR?=
 =?utf-8?B?U0NCd0pDL3lWTGFKMWJxYm4wVTl2bzA3Z1lFZGEranllM0VnU2dTdktJU3Yv?=
 =?utf-8?B?V011aDVkWUZXTEx5SFNDUk5MeXRlUytuaVZzVlh6eEtYNzd1OUZETDBMcy9Y?=
 =?utf-8?B?V2RlTEtkT2lvYmdtSXFxaUttSzF2SVNUQ3JXUFpBaTg5cjFNYllQQ2ZqeXhR?=
 =?utf-8?B?djVaRFFwVEJhbWErWHgxOGJlYlRCajVSSDJYV3N6NmhBSjZiYjM4TXZsM0hh?=
 =?utf-8?B?VFBldEdqVGNXZFBTZlN2blFQTXR0ckVQTkM4L3BTaW5uaURDZDhtQjhxK3VU?=
 =?utf-8?B?aTJqbzJQT25WREVoUVJxbW9JcUJCMFZGSDFaWUtZZEd2RWVJOHFacXVJYVd1?=
 =?utf-8?B?TFZ4UXZFcGREL3hYcjVYUEp0N2s0aXNzcGJOMFVsREo2cWlnSm9PMWd4emUv?=
 =?utf-8?B?VXNlZW1ERlQvUlVuNjZCdlpvN1ZwWW9RMFpvUWRFU3IwMzdFdXdMUU1YU29t?=
 =?utf-8?B?WWxzY1pSeWYrUkZMcmhOdnRzTFpUZGZxRjZzTUR0WGgvK2xIdy82RUZmNGFl?=
 =?utf-8?B?UkxER3NIV0NSVyt1VTJMTUJUbDdNUWkwZlh0eE9hMTNvZnRMcTA4bzZmcC9E?=
 =?utf-8?B?K0grWnYwK3FESGpienhQOWlueHEyeFRqRHJQc3NnUnhvUmJUV2FFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40B7C8BEBF892F4982DC062960BCBF71@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0f41c9-25c6-4021-a279-08d9a3621fbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 09:20:08.2954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJQ2m5MmniQWET/snwxxCwwMuGcnlN4V0m4rK3LnO2bpOiz3AMESJijpgKswJMpLCnUDaMHaIPbrA4q/c3miMCoARImsau67H8uohmK86VPVxyBu+HHgdfbIvZvMGhJC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2801
X-Proofpoint-GUID: 4KeKt2At0zEjB270qb1HEpfPB2fkAeT6
X-Proofpoint-ORIG-GUID: 4KeKt2At0zEjB270qb1HEpfPB2fkAeT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=936
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090055

DQoNCk9uIDA1LjExLjIxIDA4OjMzLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KPg0KPiBbc25pcF0NCj4gK2ludCBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoc3Ry
dWN0IGRvbWFpbiAqZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICgqY2Ip
KHN0cnVjdCBkb21haW4gKmQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UpKQ0KPiArew0KPiArICAgIHN0cnVj
dCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZTsNCj4gKyAgICBpbnQgZXJyOw0KPiArDQo+ICsgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeSggYnJpZGdlLCAmcGNpX2hvc3RfYnJpZGdlcywgbm9kZSApDQo+
ICsgICAgew0KPiArICAgICAgICBlcnIgPSBjYihkLCBicmlkZ2UpOw0KPiArICAgICAgICBpZiAo
IGVyciApDQo+ICsgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiArICAgIH0NCj4gKyAgICByZXR1
cm4gMDsNCj4gK30NCj4gKw0KPiArdW5zaWduZWQgaW50IHBjaV9ob3N0X2dldF9udW1fYnJpZGdl
cyh2b2lkKQ0KPiArew0KPiArICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZTsNCj4g
KyAgICB1bnNpZ25lZCBpbnQgY291bnQgPSAwOw0KPiArDQo+ICsgICAgbGlzdF9mb3JfZWFjaF9l
bnRyeSggYnJpZGdlLCAmcGNpX2hvc3RfYnJpZGdlcywgbm9kZSApDQo+ICsgICAgICAgIGNvdW50
Kys7DQo+ICsNCj4gKyAgICByZXR1cm4gY291bnQ7DQo+ICt9DQo+ICsNCj4NClRoaXMgY2FuIGJl
IGV2ZW4gc2ltcGxlciBpZiBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMgcmV0dXJucyB0aGUgY291
bnQ6DQoNCi1pbnQgcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2VzKHN0cnVjdCBkb21haW4gKmQsDQot
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW50ICgqY2IpKHN0cnVjdCBkb21haW4gKmQsDQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
cGNpX2hvc3RfYnJpZGdlICpicmlkZ2UpKQ0KK2ludCBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXNf
YW5kX2NvdW50KHN0cnVjdCBkb21haW4gKmQsDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgKCpj
Yikoc3RydWN0IGRvbWFpbiAqZCwNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlKSkNCiDCoHsNCiDCoMKgwqDCoCBz
dHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2U7DQotwqDCoMKgIGludCBlcnI7DQorwqDCoMKg
IGludCBlcnIsIGNvdW50ID0gMDsNCg0KIMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGJy
aWRnZSwgJnBjaV9ob3N0X2JyaWRnZXMsIG5vZGUgKQ0KIMKgwqDCoMKgIHsNCiDCoMKgwqDCoMKg
wqDCoMKgIGVyciA9IGNiKGQsIGJyaWRnZSk7DQogwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGVyciAp
DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7DQorwqDCoMKgwqDCoMKgwqAg
Y291bnQgKz0gZXJyOw0KIMKgwqDCoMKgIH0NCi3CoMKgwqAgcmV0dXJuIDA7DQotfQ0KDQpUaGVu
IHBjaV9ob3N0X2dldF9udW1fYnJpZGdlcyBnb2VzIGF3YXkgYW5kIHdlIGNhbiBjb3VudA0KZGlm
ZmVyZW50IGVudGl0aWVzIHdpdGggdGhlIHNhbWUgaXRlcmF0b3IgYW5kIGEgc2ltcGxlIGNhbGxi
YWNrLg0KVGhpcyBiZWNvbWVzIHBvc3NpYmxlIGFzIHRoZXJlIGlzIGEgc2luZ2xlIHVzZXIgZm9y
IHBjaV9ob3N0X2l0ZXJhdGVfYnJpZGdlcw0Kbm93IHdoaWNoIHNldHMgdXAgTU1JT3MsIHNvIHRo
ZSBjaGFuZ2UgYWJvdmUgc2VlbXMgdG8gYmUgcmVhc29uYWJsZQ0KSSB3aWxsIGluY2x1ZGUgdGhp
cyBjaGFuZ2UgaW4gdjcNCg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

