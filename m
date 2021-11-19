Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD99C456F1D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227871.394234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Lv-0003qc-SC; Fri, 19 Nov 2021 12:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227871.394234; Fri, 19 Nov 2021 12:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Lv-0003o8-Nz; Fri, 19 Nov 2021 12:50:51 +0000
Received: by outflank-mailman (input) for mailman id 227871;
 Fri, 19 Nov 2021 12:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo3Lv-0003o2-0W
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:50:51 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51da04c3-4937-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 13:50:49 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJCRvS7007946;
 Fri, 19 Nov 2021 12:50:47 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ceby2g2pf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 12:50:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6884.eurprd03.prod.outlook.com (2603:10a6:20b:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 12:50:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:50:42 +0000
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
X-Inumbo-ID: 51da04c3-4937-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuK/g6c14aP2jpNiWq4vDWRavWF6oN404PthDReOj6D+z/ZHg/gexh02IbkZcEV7T9ukg50D152MGIkDYLPbnYjrFIkR8gZCrHNYvtEf64yo68XkRDkxV456/0HuK9AUtb5NWajm8TYRhLsuLzsN2yzk4TDJJVKiM24FaLdLolJx+CGr+RsgBcwuYlo1+uo6ASa/stgkh8DAiYPxZGWzHzQMX8/x5u+hT7KO8l16PbCKOf0z+qdmv98VIOnX8VO8X2sVfFiY3Rr2JEiIdehWzAC1dGgkNTgGynICoJratXX3mvRok24+jxppqr+moYzSiFjOcFCK7bA8doUOKOt5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gucn4GoxjAnbDeafu2/ruyMlVydR6mo0GvKh1UJKVQA=;
 b=N2y9Jt01OmsP6WqPa2onY8D/TZpJeP1WyB0ey+C/RQ5u14jQ1cAG9SxxYKJ39hoIkFy3noNq9ZXi/+9tknERtM0MwDds5yu6etE2JqHLpPC8WhbDbvw7XQVnF32b0ETij/a+y1ScrgywkD8CfOiezm67+F6NwiwXSWw0lPGiLibNR1HAXoSwl+JLh6GMP5vhor8l+yHNgeYBlbezjj9NluBuBsc13JCysO2Jf9O24+ZYgJtuCkSw/pKjMrV4AX0Vsx+4AEJX/tPob4UlIVgn91Cp4BIvf9zpMPodvZU0rXuSW2Mki8dlGdf6vExXpqBV/bSVXoRjKwK36LnUTe5g4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gucn4GoxjAnbDeafu2/ruyMlVydR6mo0GvKh1UJKVQA=;
 b=Da+1nhrMzQPzGofi6FrWOsdMf6/t+tsoZxp5RAqT8MUWmSYDxC/yPDDuM7MZuieesYWvxeuLhPQcs0emeu+l3qcpaV1xFkpRnWVd72PU7tF09B52ejokEhPCBXZb/UFJP5P6FysksIqN86YIp4vXjuTD+leDOQVNS2CHwC/dUJDE+31q6E68X58fE9yWBi/DuBkoo+N527QlJSX0ZZKj7YevJ8Jo4KA2M8H5SS1CarDzuUNX7dzYCYYjB7EiblumsKTZSIZ5ZbgTuwhyeN4sfyKadOgA94SIvaV7XjWsIyyxB9eOcye+asO/nzE0dz28udVSBUF9nf+tACldU73vvg==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHX0hJLwt+wJ2t1lka5jlbMIq7ZAqwK13MAgAACAoCAAAkUAIAAAXCA
Date: Fri, 19 Nov 2021 12:50:42 +0000
Message-ID: <ea3e52f3-c844-d2a7-2f45-9d4e1bd04d5a@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
 <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
 <76e929f9-2df1-951f-55bf-58caba80750c@suse.com>
In-Reply-To: <76e929f9-2df1-951f-55bf-58caba80750c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a118117-7608-4e47-ac6e-08d9ab5b324f
x-ms-traffictypediagnostic: AM9PR03MB6884:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6884F3DFE31290500D10BAD6E79C9@AM9PR03MB6884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tWxTw+e8GNhOh97615zGLxZRMkmyUt64lT5I7h1pRPxTRxkOgZ8IQ2IIHlf0YWQmJNXKg/fjhK3Lp7JszOp3AdhtSk3JragZX+5LHkJFebwaX/2F62kdq2w75FFxQRhiesRaMG0fjCgy5EwBxgBtskqmJPgOd1gL+4f5wqAAxb0wdd7y3Abc+8YxEML2py3FoNj0Z3ag/OFe8jaqEYqGgdPMc7JzXoMRnDkeDA6pasivok4EBGJoL7g6KCs/y5/qU9Zc1RE6k8V7Ln2KP00JQ1zjNJA7Ruqu8TGfxLNIO9QPmFjpeKA5uJvq+3Ntoy+ZA5i3XLhwfMaJUhh2fuHGHOSU5ScAGMRPSgvYfKHzhZJJ2Da9BCvAZBXxTUr03CJYPS02JJ6Zt+X/G4ZLbth1PfnURLae+X9TTaoGY4x3isynAPO06nV7679lxVsEiTEO0RxcSX9Dk/q3nVX+lVRL6P7+BMZvZNEqBuqJecbcGgc/foyoADN6Tn6+bfKvn1maNcHcS8KtAMOyWmpSOw4L87y6fhDljg1kPEuVtzBxxmvZndRKrIhcCx+3DpZo6h9bxhR8QWGFtV6re3n2OJ6dUnhvMVD5JHmA2fge09NnfRz3A2PlS1+hIDZVNYQ+3UvFQd0+aNguRImSzkSTcL17tNZEkocF80RbW9HKQ7R00vczxnsH3MeqHF7mKgzDkB2D/gw/8xqM+N7jTRjyGdb9ajnQaGV4zWI9kHa6bXRkfFYwQ1ljMTGA08G2Guip7pGh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(4326008)(8936002)(86362001)(316002)(186003)(5660300002)(2616005)(38100700002)(508600001)(71200400001)(2906002)(66946007)(91956017)(76116006)(66446008)(122000001)(6486002)(53546011)(8676002)(6512007)(31696002)(6506007)(64756008)(66556008)(66476007)(31686004)(7416002)(6916009)(26005)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SW1oSGdYVlN6Ny9TRXpLc2MxUHhzck8vajllTWlMdzRtOVo4Wkl1UnBNVWxZ?=
 =?utf-8?B?bEVvc0xkKy9BSlVITm93eWUwODZqOE03dFFidEJZYm96dVUwMkRTVVFKTWhB?=
 =?utf-8?B?V29iTXJIVk1hTU1FVWdHaUlOTFFUcndTNXNaWm1TQnZTamtFaml2K21GTnhu?=
 =?utf-8?B?ZzdqcDdvVUNpckRZZ3lFbmo5dW9pUXBmNVhUSExXMGlybHFJZEYvemFhWjY3?=
 =?utf-8?B?MHFWUWpmWVN0QlFSRFNzQkwvYUY0MlNWMitIUFRYY1NTVUk1Y0xxczZBM3lC?=
 =?utf-8?B?eDhOY3B5MUcxaCtNWU1KTEVPVlQ3SHpHYU5DZWQxQWZia00velJubTJaa2xu?=
 =?utf-8?B?VGxyV1ZBaVpGSmFrbE5BcGxmSnZlSlh0TDZmaXBRY1Vqdm9vMlhuQkJwdDJ1?=
 =?utf-8?B?MHhpcUNUSnNlazRXOTJTQTJvNVJoSDBrZHBPY0RpUUovcnVBSm5vRVlFV3ZM?=
 =?utf-8?B?S0dKTWR1eXdJTU02cGF6WHFXdDFNREt0dmpxdWlnQUhpWXlZakpNbEdINDAx?=
 =?utf-8?B?cy9IeVMvbEhrc01YRTM1MHgvQWd1M2ZNOWpBS1pOS0VYNGRBempRNGdKWVF0?=
 =?utf-8?B?L05qNHUrOXA3eUl3WGwyWmI3R1lXU29VSjc2NWxaQTE3SlBiYWE1OTh4L0JK?=
 =?utf-8?B?aDlkK0h0Nis3UDR0TzcwL1hramdhWU8xekFPbm1TRUxiYjQwbHY5QnBTQXpN?=
 =?utf-8?B?ZVNVUHVXQlBZcGJRaGZEVjR0MHdGeU9BMmFsbEJmNEJ4YmFjRzNocTllMjVT?=
 =?utf-8?B?TEVjZ3ltTjl0S01hdjBTNzNaVk82OGxWSHJ0VG0vTm9nT3dPMEdVV0x5UG9N?=
 =?utf-8?B?MitDOE4wWnpBdTNjNUc4SHA2ejE4Lyt5RFM0aUtpdEFkT1cxQUQ2SUdrZ0FT?=
 =?utf-8?B?UlA4aUJhQXJtUnJLKzJ6d1p4SUtCK2d0UTlQcnhYSEFsOUd0VU9rRHREcmZm?=
 =?utf-8?B?VDVwOTdWNXh3TUQ1aUNvY044NCsxd1VGc01FRTZiR1NMY1kvMDhaTnlOU1o4?=
 =?utf-8?B?dEZnUkYzYkxTWktUMk45cjN4Z3lyYmFZclQ3eXEvMytxclowMGh2S2JDL25w?=
 =?utf-8?B?UVFjVDJuZk1qL1loeU9FNXFuaitzam9qUGJXTHE2K1p2ZjViRHZ2ZnI1NW5w?=
 =?utf-8?B?OVhxYS9EaE5ZVzAxMVozc2JWcVVBSGxycEFaOTZWUjNMeTEwc0xyT2dsUS9S?=
 =?utf-8?B?YzRGWXNBcWNVQ3RGbzlWaTF0bEdxMkFpeHBTdkM1RmxiOXM3SlhVdFpabG9Y?=
 =?utf-8?B?RURYMFBnb2tTakwrNnhCZTNqRUZ4MElxS21KK1lFTGZwcVBKaWtaMktlazU5?=
 =?utf-8?B?OWJmNndsdC9pZ1RvNXcvb21haEdoUW9adXcxTW1lc0d5NDhqR3BjOWZyZjFO?=
 =?utf-8?B?MFVhRHBPcTdLOUNiTStYNFovTmdBS2NVOG5pV281QWxrYWZEYVVSbDhnRjhh?=
 =?utf-8?B?YWhUbGUzeTR4bUFpOWphY0U5aTYwODlLY2RLaUY1cCtIcmhQOW1BOW1JcFNj?=
 =?utf-8?B?WXByUyszdEFscVRzNzREMUZIOG1ZNG1rcXlmQ2hVVFFuVHhnVHpTTzVjbXZW?=
 =?utf-8?B?L1ZtYnIwelFUbnNkLytQZiszNVM3K0RTRGJWTUdVZWVQUk16Yng5QURHNms0?=
 =?utf-8?B?RTZaZm52S0Fvc2hzaXVCaHM2bkcwK0J0VzBJOFNRdGZQY0Z4YmR5WHZQK29I?=
 =?utf-8?B?cjErWWdhbjZVNGJrRktjUDNBb1BNTWRENTZSbnNDNTRseVBPQ1E4NzFlLy96?=
 =?utf-8?B?c2l2Y2g2amYvU1h5TUd5dUw1Ym5TUTJ2RXlzdFdQR2FwL3Jpb2txa3RNTzlo?=
 =?utf-8?B?djFocHY2VkdxOHBRS0xhOTdaYk9saFh4bzhsS05uMFFzdnFIRjRlOWpxWldt?=
 =?utf-8?B?QWR3WUJZZVNmYkE4bG1jN0c0MDFiL3ppdDdHeHV3VjMzNlduRnZOemdzUEdr?=
 =?utf-8?B?TTJHbTJaVkJhUmZkVFpXU3M4VDhhUStKYVlScHEwYUc5bys4cy83MUpETS8v?=
 =?utf-8?B?RzJBMzBlcTJxOE9IRXEzVE5odVZjTitpUGp3WXBFSkRNMks2THhCK3ZIbm1z?=
 =?utf-8?B?MitBdzMrcGtHR1gyS2hMUGMyNTBDRGtHdzMzK1ZBelA3REFrMzJLL0ZEN3Uv?=
 =?utf-8?B?a1MxSjk3RVRpRCtjRG5mcnpLZno4RC9VVXVHYUVIazJoaVFsMkJrQWZKS1lB?=
 =?utf-8?B?WkVwTjVNKytuU2hOL3BQa0phbjhhT21iR0tGeU9aWWlFeWttem5OSmZEWDBn?=
 =?utf-8?B?UzU3Q00zdit3NGkvbHcyV1EyRDk2OUNEVDZxaGxPSkJaZ2RjZWI1dU5hdG4v?=
 =?utf-8?B?WkRxaFhwTWRpQ05QMzFLTTk4YUZsTHUyMkcvQzJkQkVTVmtibXd0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDEED55AB6B2724EAD803713EB1AAEB6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a118117-7608-4e47-ac6e-08d9ab5b324f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 12:50:42.3006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rf+/o44Zg7hkN/I4L+71mI3ApuAPKvVhv+Lt/id5ytNmClK+A9bIpsgxVgAwxtEHlVOa2jrRA/YnBn6lU6qOdDP6cNV/kO1YbG6f8HUxourSs0DH6HpaFQxDbwli7x07
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6884
X-Proofpoint-GUID: P5xn_QqqG7H3xbuRuiSCRkBj5sm2HaDh
X-Proofpoint-ORIG-GUID: P5xn_QqqG7H3xbuRuiSCRkBj5sm2HaDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190071

DQoNCk9uIDE5LjExLjIxIDE0OjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxMzoxMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
NDowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDUuMTEuMjAyMSAwNzo1NiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gSW5zdGVh
ZCBvZiBoYW5kbGluZyBhIHNpbmdsZSByYW5nZSBzZXQsIHRoYXQgY29udGFpbnMgYWxsIHRoZSBt
ZW1vcnkNCj4+Pj4gcmVnaW9ucyBvZiBhbGwgdGhlIEJBUnMgYW5kIFJPTSwgaGF2ZSB0aGVtIHBl
ciBCQVIuDQo+Pj4gSWlyYyBSb2dlciBkaWQgaW5kaWNhdGUgYWdyZWVtZW50IHdpdGggdGhlIHNw
aXR0aW5nLiBNYXkgSSBuZXZlcnRoZWxlc3MNCj4+PiBhc2sgdGhhdCBmb3IgcG9zdGVyaXR5IHlv
dSBzYXkgYSB3b3JkIGhlcmUgYWJvdXQgdGhlIG92ZXJoZWFkLCB0byBtYWtlDQo+Pj4gY2xlYXIg
dGhpcyB3YXMgYSBjb25zY2lvdXMgZGVjaXNpb24/DQo+PiBTdXJlLCBidXQgY291bGQgeW91IHBs
ZWFzZSBoZWxwIG1lIHdpdGggdGhhdCBzZW50ZW5jZSB0byBwbGVhc2UgeW91cg0KPj4gZXllPyBJ
IG1lYW4gdGhhdCBpdCB3YXMgeW91IHNlZWluZyB0aGUgb3ZlcmhlYWQgd2hpbGUgSSB3YXMgbm90
IGFzDQo+PiB0byBpbXBsZW1lbnQgdGhlIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBhcyByYW5nZSBz
ZXRzIGRvIEkgc3RpbGwgdGhpbmsgd2UnbGwNCj4+IGR1cGxpY2F0ZSByYW5nZSBzZXRzIGF0IHRo
ZSBlbmQgb2YgdGhlIGRheS4NCj4gIk5vdGUgdGhhdCByYW5nZXNldHMgd2VyZSBjaG9zZW4gaGVy
ZSBkZXNwaXRlIHRoZXJlIGJlaW5nIG9ubHkgdXAgdG8NCj4gPE4+IHNlcGFyYXRlIHJhbmdlcyBp
biBlYWNoIHNldCAodHlwaWNhbGx5IGp1c3QgMSkuIiBBbGJlaXQgdGhhdCdzDQo+IHRoZW4gc3Rp
bGwgbGFja2luZyBhIGp1c3RpZmljYXRpb24gZm9yIHRoZSBjaG9pY2UuIEVhc2Ugb2YNCj4gaW1w
bGVtZW50YXRpb24/DQpJIGd1ZXNzIHllcy4gSSdsbCBwdXQ6DQoNCiJOb3RlIHRoYXQgcmFuZ2Vz
ZXRzIHdlcmUgY2hvc2VuIGhlcmUgZGVzcGl0ZSB0aGVyZSBiZWluZyBvbmx5IHVwIHRvDQo8Tj4g
c2VwYXJhdGUgcmFuZ2VzIGluIGVhY2ggc2V0ICh0eXBpY2FsbHkganVzdCAxKS4gQnV0IHJhbmdl
c2V0IHBlciBCQVINCndhcyBjaG9zZW4gZm9yIHRoZSBlYXNlIG9mIGltcGxlbWVudGF0aW9uIGFu
ZCBleGlzdGluZyBjb2RlIHJlLXVzYWJpbGl0eS4iDQoNCj4NCj4gQXMgdG8gb3ZlcmhlYWQgLSBk
aWQgeW91IGNvbXBhcmUgc2l6ZW9mKHN0cnVjdCByYW5nZXNldCkgKyBOICoNCj4gc2l6ZW9mKHN0
cnVjdCByYW5nZSkgd2l0aCBqdXN0IE4gKiBzaXplb2YodW5zaWduZWQgbG9uZyBbMl0pPw0KSSB3
YXMgbm90IHRoaW5raW5nIGFib3V0IGRhdGEgbWVtb3J5IHNpemVzIGluIHRoZSBmaXJzdCBwbGFj
ZSwgYnV0IG5ldyBjb2RlDQppbnRyb2R1Y2VkIHRvIGhhbmRsZSB0aGF0LiBBbmQgdG8gYmUgbWFp
bnRhaW5lZC4NCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

