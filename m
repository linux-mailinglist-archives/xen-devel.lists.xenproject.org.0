Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81925470276
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 15:10:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243936.422067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgbg-0004xW-A4; Fri, 10 Dec 2021 14:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243936.422067; Fri, 10 Dec 2021 14:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgbg-0004vJ-62; Fri, 10 Dec 2021 14:10:40 +0000
Received: by outflank-mailman (input) for mailman id 243936;
 Fri, 10 Dec 2021 14:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrZX=Q3=epam.com=prvs=297895717b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mvgbe-0004uH-P1
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 14:10:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f224c620-59c2-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 15:10:37 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BADvGtk028708;
 Fri, 10 Dec 2021 14:10:32 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cv514gwk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Dec 2021 14:10:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7489.eurprd03.prod.outlook.com (2603:10a6:20b:272::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 14:10:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4778.014; Fri, 10 Dec 2021
 14:10:28 +0000
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
X-Inumbo-ID: f224c620-59c2-11ec-a831-37629979565c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCnfRY1zBNpRnHAD14NSDROhtnJuXqvpYQi+CT1vbrcOWZ7NOZWNPyorW3BAp35Ejxx4dqluOr440nLgvimWKfWbpHyO6Cy8d5iSECS0GYjNeu8luSqSOh801CdgFKwHzf44V66EsL9GOHgsiqJznoFHTm6BobOOuw/w+zForsLpIDsM+38fnxXe0z5/NaVUVA2oW903v3Q5Y6AwkpBlndJVHR9Gnla6Hm/yAC5dDLc2SC2+xnzUL291bMv4+bt5L7OLnzta/hR/EArADaZnSbEMPWsvmNo6v0XSE0/oBvoJfIn07RDNAoGTqnaB6ZQWBG33wTAK0Amd2Yja76DfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSoCI3dltpLEeJA328S4rqhWi2HKNZDYD9QN7yG2rmM=;
 b=nvL+SqCdYRPVV3HQL+wLONiBDp1KG2KaenTQv1hT2fFtoKz4KCHEKT9/MeJTt0PPVzw6pAWyAu7sYfkkbQM35j3d6Si/+4FJoFgPx+LJx/ReREFlp8ZP4YSIOyTohKZhOZ0xAxSXROEp0Y23CY1ztRY+tkKFMn9IsVxGJdmAV/7NT6NxkbQjTbbsp/iiadfcZ5zCr1q4GVTrITTBew79+cTnocaeg/DoFHh/BFcG1rc+bVTyFMtYbw1P9Vzcfk73fvNEj75JXg7MYK0vUF+4ko0CGMI/XRphKM+m8vhk9d16sZBdnUhqWAgfgAuD+rWfsw8gQoRTdrKVg2yE9nie0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSoCI3dltpLEeJA328S4rqhWi2HKNZDYD9QN7yG2rmM=;
 b=mZQd6qoGGFgC5/kJwHPMLeKDQA3N2DK6kHlZuYb+93jSV3TCvWIlqys4DMNoKPwDfzr8Z6xCEFvUImZ+1yGXDQg8nncM47CV3geVC3hl3HatDiYY+IwxWwodzLOBidyYSLXuA8y4IrCKygRAR0FMSrMZ5fzE6BpjPqiqftFD5lz8IWnRPZAjr4tfoM66kDKDlQcgYwROJNvN/Aso4DvKXTYXgz0m/kH7kH3CMEkPLjJo7Rbzs0fuYM64aNZZi+Q/6AzhQ+fs+WziLgFTh18MZdlnZP4nBqFCn6u8VbUAbGZkpcjo9sFAKFWgp2+kP8eXgaKoowDPQN1n1RdlWXdciA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
Thread-Topic: [PATCH v2 2/2] memory: XENMEM_add_to_physmap (almost) wrapping
 checks
Thread-Index: AQHX7c+uYXqxle9/kUKbI3W3gcIfZw==
Date: Fri, 10 Dec 2021 14:10:27 +0000
Message-ID: <612735b2-8af6-782d-35cf-526841109170@epam.com>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
 <0b68ff3a-3c82-f800-4d20-17eded13163a@suse.com>
In-Reply-To: <0b68ff3a-3c82-f800-4d20-17eded13163a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd5e35e2-b1b5-434e-8979-08d9bbe6d16c
x-ms-traffictypediagnostic: AM9PR03MB7489:EE_
x-microsoft-antispam-prvs: 
 <AM9PR03MB7489E853407939A15DB3439AE7719@AM9PR03MB7489.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lWxaSM1OPNTzkJTD/WprdybW6WbRvuj1EwrcArFirBZdpVue+PDiGXDTX+1TXCebY6syxNWKEIaGQHtanEyeunJWYSIYCpw3Nk47+uuzfReHgxpCa8FjAwTEoNzDADyXYLmrE0XtLb3NgY1ePtVqAiwdkvwZ9/0IEXD1mc8reHqHV107pbUrNW+k8Am1KpqTAizMy8Jo4Syik4qwe3T6nrGdlJb8tmxfcyuHwxnBMl7Ikk4AmI/yig/ufeuxtKj9zl59tphyTDb+w4F9x0Jb908vBipozeMPCfqALEx1d84mYu4qtfIi3Btyd/3QmPijHf5OClfE0agHa9pQwmFLQhzDx32q6r4rX2f8OWwmL3rqUoSNVAJKrQ3a+blsYLPzeONdLvOEDIXoHYL4P1RdIn/FGHiZ7SpYisSb/Z/ySuFjQGyDhRtnE5S/49/p3NNoP/FEiWCsAud0dj9sl1K+l4JAS9T/2rLuekcnYJ4Xs7Jn+6blmuHPB8mQNlaq1Nry3v2cVTKCrA+fCnq37gZTkOxRsVkar+oiS52HuHvUK9QLFR7Ra4J28gM1EtjBCxiQA4XT6U7Y3I/B5UxqwFEIzhe0HJmFlxJ8spy7kh0jCnd1p2SwNwz5fCM3PudUZoF+moCMov39rHXqdAhX49Pw1mnvA5hWpvnypKfl0ekZ6EkgaCZgweXCwSUTdT8BMVnHTOb6BKKqtWX2SbNOzolPR7WUNFWL35RJcjlsf+dKHoyfxvB/0qT7upS6mXPU4e3A
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(31696002)(76116006)(508600001)(66946007)(91956017)(110136005)(86362001)(5660300002)(2906002)(2616005)(122000001)(64756008)(71200400001)(66556008)(66476007)(6486002)(66446008)(38070700005)(186003)(83380400001)(26005)(8676002)(4326008)(31686004)(55236004)(6506007)(53546011)(54906003)(38100700002)(8936002)(36756003)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N0p5bksyZ1hNclJtbGx4ZkZCdHdYcnNoSU1YL3Z5YTFqSlBvUVNBY1lZaVda?=
 =?utf-8?B?T1BObTByNUFTWldBRG83bmVZYXh1T0lET0VZbzd1RG1EZ2ExR0ppbHlkZ1pX?=
 =?utf-8?B?SFRzSGx6Sy9XRDk3YmFMWWFHWVZxZVRFUDFleGFIbHVmaWZ0Rzdjdk15VzhJ?=
 =?utf-8?B?SXZ4QUNtcjFaKzVxWVVxQXVWcnViRE45SVRSYTJheW9FL0NnUDMzOUZQTFdP?=
 =?utf-8?B?WitRWklPdC9DYTM2ZjhYVk9QWHczRTZzOHFqYmJXMDFucEl3Tlp2eWRRVjh1?=
 =?utf-8?B?eG9Ob0ZVdEJ1d044ZzM4Q1lyR0lXdEVHQVBVbmp2eHJXRGNwclZSMDhaWVVy?=
 =?utf-8?B?WEZQYVlnN3lxaCs5eEpteGlYMmtUMDZwVDg2ZGIzcXFXdVZNWHVIZTBueDB1?=
 =?utf-8?B?WXZ5OWRBU3NPNTRSRE5xWDFmZXk4V3VuVnl4bkZGREFEUkVML1FaYlY0ZWdT?=
 =?utf-8?B?Sk5JeEd4RUxPZ00rMll4R0hURHlsbFN3Z3FnK1l1ckdjYkhaamJya2FlQVcx?=
 =?utf-8?B?TlFwaDl1R3h6QWZ2eEdnaENIdDdpQ2dGTGF2b2hxcHl5bEZYZ1MrUDByaUVK?=
 =?utf-8?B?M1NIKzhzR2pkWjFkQmVEUTF0NEJVSUNvM1hLaDhSckk3ZHlNL0JLOEwwVXI0?=
 =?utf-8?B?blNaOEZYZ2QwM0pVR1BISnd6TXNZT0ZXNTVTclYzQi9hRmhJK3ljTDJRbHBM?=
 =?utf-8?B?dThjOTZxcElEdDAvaDZUdkVuc21sUEpFSEtmNE94MWVpVlNTRm40TUYzTGpo?=
 =?utf-8?B?WlVLdXRVMmFSYXlhZmhJQlJRcnI5YVVnY3Bra3V2dDJtMzNBWTFhN2RmaGQv?=
 =?utf-8?B?aDFoQjkvd1N6YzF0VjZ1WHdEVXMwN01PUU4vZXNTOFNxU0Rld0JRTmJiU0ZQ?=
 =?utf-8?B?ekFES0I0RUt6L1BiUUFmT3VuZ0d0T2Q3dFZOWWVwODdUbUtPd2pnVlIzbjMz?=
 =?utf-8?B?dnVXc1ZYUTJOVnFMMk0rSEhTWDlCY1BqM29LdTk3QkJOcVhBRmpnMVJSQzZG?=
 =?utf-8?B?SDZjMFNRejRyVnY3K0ZUT0prWmZ1VnZBK1U3RjE0bDdCSlFzbUJJejZnMjlt?=
 =?utf-8?B?Q3owQ0hSeS9zb2FXWmdMNk1FenRneUEzWFA0Rmx0Y1JnbXZHWVlVMEVhVzlU?=
 =?utf-8?B?bzIvK3RTV2Z5eEhyUWVSYWJ3V0g5U1RDU3pGTkNENVNhUlFta0dEYVo0QUM2?=
 =?utf-8?B?dDJZN2JqdUxlQ0MvckZtTVdraGxmMHpseDA0V3pYZjc1YWkxeCtta2tzWEV4?=
 =?utf-8?B?MkFBdmYrRGJLMXBvSkd1SzdDOXBwTHF4dWc2dk9lY1R6cUJKQUxsdEFGU3pR?=
 =?utf-8?B?R0hsRUtwczZtcDFjY1lucUtSMTB2VjREQXZ4T05pSk1kblhHTEJKVU13UkZh?=
 =?utf-8?B?QVk1YUx4TzdJa3FhYy91QjIyT0ZEeEhmU3FDZFU4ZndtelR4eVh3UXRFZ3ps?=
 =?utf-8?B?Z3VTMDVXTkI0MjJZdExnVjRrSGhjQnhRTVlTd1FWZHBPQU4vanp3M1hqUW1C?=
 =?utf-8?B?T1Z0Wmx3YkhKa0Qremt4NzR2a0JFbUNJVXNTb3lLRTJ6eE1JdWxkelJlZzB5?=
 =?utf-8?B?czZhdytudWN1WTZsd0IxNUdBTzBLRVdHckZvOEVZL1dPU2VPeTM2YkRVbzNR?=
 =?utf-8?B?dGpOU0lIa1V4eDJibXlNZFc5S0sxdXNtYnRFK0hTS2JIazhYUThhcm1Hd3p5?=
 =?utf-8?B?QjI3Q0EyS1gyVW9yL3pNVHZPNmJDakYzSGoybklzNS9lZmhKRGJPaGJhNWZv?=
 =?utf-8?B?STNNUkw5dElPSUl4RW80MGhaM3ZhTXR0blZyTXloNmlzOEFCcitvRWF0cUdQ?=
 =?utf-8?B?ZlJiaGMxRU9aVldzb1JHdTZQY3plVkduSlluZFdlVVBmZ1d2SERYUEVMYjlI?=
 =?utf-8?B?K1BhNjBHYlJIK3dyOHY0Q29Od3VRUGJpNVhBQjRwU3JxemRHUHd2eFhnVXRm?=
 =?utf-8?B?dGUxSnBDWGs4bjhNL3A0SldpUDFycHFHZnZ6QlFaZEw4eGNHaHI0R0dLdEYv?=
 =?utf-8?B?cUNoeGg3WTZFTnNtTUtPQk9vaTM3L2tia1dicncxVnh0S1pKTm56QVZ4czM1?=
 =?utf-8?B?STVVSGZFUFMrR2ZRL2RFU1RkMVlJQ0YyTXUyaG81UVlkS2I4QlFmMTdaRjVI?=
 =?utf-8?B?Vkk5MTc0NGFmanFCM3lCVzFSQWpEZDdzN1o3Ylpyei9IUllMclFVbmY4NHla?=
 =?utf-8?B?bUFnQXQrWWZFZkx2MVZNWkJUQitBa3RqTEVZSWVMUmczSG5FNlVqZjM4RW9r?=
 =?utf-8?B?blRvUG13eXV5NkNTZnRKaFRhNEtYZ0pzNXgrVXQwYUtaTGk3S1Z3SlkwS244?=
 =?utf-8?B?WFVydUFzSTVnRk54MkRBZDdJY0lLYTRuemdpQnlGQjRmWkFQTmExb1FYOGEw?=
 =?utf-8?Q?maLAajthotMHYsgw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6825AE57592EC7429D181F6ED9426DA1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5e35e2-b1b5-434e-8979-08d9bbe6d16c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 14:10:27.8809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBtccic345amm/t2iF8UqVxDsLTE+FH+9ldQ9ytOxJ1AwLO9f6aWdFFzRohCdFAnV63XZ691GKLI5hFKTkMGw0u1E4A3fFGrZ2hBx2BxG0MHn18fByPbGGJ8OR+3zPmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7489
X-Proofpoint-ORIG-GUID: wnl-E7HRN3vkVZd3HDb9Uvl_pUHxFaZX
X-Proofpoint-GUID: wnl-E7HRN3vkVZd3HDb9Uvl_pUHxFaZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_05,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=953
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112100081

SGksIEphbiENCg0KT24gMTAuMTIuMjEgMTE6NDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBEZXRl
cm1pbmluZyB0aGF0IGJlaGF2aW9yIGlzIGNvcnJlY3QgKGkuZS4gcmVzdWx0cyBpbiBmYWlsdXJl
KSBmb3IgYQ0KPiBwYXNzZWQgaW4gR0ZOIGVxdWFsaW5nIElOVkFMSURfR0ZOIGlzIG5vbi10cml2
aWFsLiBNYWtlIHRoaXMgcXVpdGUgYSBiaXQNCj4gbW9yZSBvYnZpb3VzIGJ5IGNoZWNraW5nIGlu
cHV0IGluIGdlbmVyaWMgY29kZSAtIGJvdGggZm9yIHNpbmd1bGFyDQo+IHJlcXVlc3RzIHRvIG5v
dCBtYXRjaCB0aGUgdmFsdWUgYW5kIGZvciByYW5nZSBvbmVzIHRvIG5vdCBwYXNzIC8gd3JhcA0K
PiB0aHJvdWdoIGl0Lg0KPg0KPiBGb3IgQXJtIHNpbWlsYXJseSBtYWtlIG1vcmUgb2J2aW91cyB0
aGF0IG5vIHdyYXBwaW5nIG9mIE1GTnMgcGFzc2VkDQo+IGZvciBYRU5NQVBTUEFDRV9kZXZfbW1p
byBhbmQgdGh1cyB0byBtYXBfZGV2X21taW9fcmVnaW9uKCkgY2FuIG9jY3VyOg0KPiBEcm9wIHRo
ZSAibnIiIHBhcmFtZXRlciBvZiB0aGUgZnVuY3Rpb24gdG8gYXZvaWQgZnV0dXJlIGNhbGxlcnMN
Cj4gYXBwZWFyaW5nIHdoaWNoIG1pZ2h0IG5vdCB0aGVtc2VsdmVzIGNoZWNrIGZvciB3cmFwcGlu
Zy4gT3RoZXJ3aXNlDQo+IHRoZSByZXNwZWN0aXZlIEFTU0VSVCgpIGluIHJhbmdlc2V0X2NvbnRh
aW5zX3JhbmdlKCkgY291bGQgdHJpZ2dlci4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gdjI6IEFkZCBjb21tZW50IHRvIEJVSUxE
X0JVR19PTigpLiBBdm9pZCB0cmFuc2llbnRseSAjZGVmaW5lLWluZyBfZ2ZuKCkNCj4gICAgICAo
Ynkgd2F5IG9mIG5ldyBwcmVyZXEgcGF0Y2gpLg0KPg0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0u
Yw0KPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPiBAQCAtMTQ3OSw3ICsxNDc5LDcgQEAgaW50
IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUoDQo+ICAgICAgICAgICBicmVhazsNCj4gICAgICAg
fQ0KPiAgICAgICBjYXNlIFhFTk1BUFNQQUNFX2Rldl9tbWlvOg0KPiAtICAgICAgICByYyA9IG1h
cF9kZXZfbW1pb19yZWdpb24oZCwgZ2ZuLCAxLCBfbWZuKGlkeCkpOw0KPiArICAgICAgICByYyA9
IG1hcF9kZXZfbW1pb19yZWdpb24oZCwgZ2ZuLCBfbWZuKGlkeCkpOw0KVGVjaG5pY2FsbHkgdGhp
cyBpcyBvaywgYnV0IHJlYWRzIG9kZCBub3c6IHRoZSBmdW5jdGlvbiBtYXBzIGEgc2luZ2xlDQpw
YWdlLCBidXQgaXRzIG5hbWUgaGFzICJyZWdpb24iIGluIGl0ICh3aGljaCBtaWdodCBhbHNvIGJl
IG9rLCBlLmcuDQpmb3IgYSByZWdpb24gb2YgYSBzaW5nbGUgcGFnZSkuDQoNCkkgdGhpbmsgaXQg
aXMgd29ydGggZWl0aGVyIGltcGxlbWVudGluZyBmdWxsIG1mbiByYW5nZSBjaGVjayBpbnNpZGUN
Cm1hcF9kZXZfbW1pb19yZWdpb24gb3IgcmVuYW1pbmcgaXQgdG8gc29tZXRoaW5nIGVsc2U6DQp3
aXRoIG1mbiBjaGVjayBtYXBfZGV2X21taW9fcmVnaW9uIHdpbGwgaW5kZWVkIGJlIGFibGUgdG8g
bWFwDQphIHJlZ2lvbiBjb25zaXN0aW5nIG9mIG11bHRpcGxlIHBhZ2VzIGFuZCBwZXJmb3JtIHJl
cXVpcmVkIHZhbGlkYXRpb24uDQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg0KPiAgICAgICAgICAg
cmV0dXJuIHJjOw0KPiAgIA0KPiAgICAgICBkZWZhdWx0Og0KPiAtLS0gYS94ZW4vYXJjaC9hcm0v
cDJtLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3AybS5jDQo+IEBAIC0xMzU3LDE5ICsxMzU3LDE4
IEBAIGludCB1bm1hcF9tbWlvX3JlZ2lvbnMoc3RydWN0IGRvbWFpbiAqZCwNCj4gICANCj4gICBp
bnQgbWFwX2Rldl9tbWlvX3JlZ2lvbihzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdmbl90IGdmbiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgbnIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuKQ0KPiAg
IHsNCj4gICAgICAgaW50IHJlczsNCj4gICANCj4gLSAgICBpZiAoICEobnIgJiYgaW9tZW1fYWNj
ZXNzX3Blcm1pdHRlZChkLCBtZm5feChtZm4pLCBtZm5feChtZm4pICsgbnIgLSAxKSkgKQ0KPiAr
ICAgIGlmICggIWlvbWVtX2FjY2Vzc19wZXJtaXR0ZWQoZCwgbWZuX3gobWZuKSwgbWZuX3gobWZu
KSkgKQ0KPiAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgDQo+IC0gICAgcmVzID0gcDJtX2luc2Vy
dF9tYXBwaW5nKGQsIGdmbiwgbnIsIG1mbiwgcDJtX21taW9fZGlyZWN0X2MpOw0KPiArICAgIHJl
cyA9IHAybV9pbnNlcnRfbWFwcGluZyhkLCBnZm4sIDEsIG1mbiwgcDJtX21taW9fZGlyZWN0X2Mp
Ow0KPiAgICAgICBpZiAoIHJlcyA8IDAgKQ0KPiAgICAgICB7DQo+IC0gICAgICAgIHByaW50ayhY
RU5MT0dfR19FUlIgIlVuYWJsZSB0byBtYXAgTUZOcyBbJSMiUFJJX21mbiIgLSAlIyJQUklfbWZu
IiBpbiBEb20lZFxuIiwNCj4gLSAgICAgICAgICAgICAgIG1mbl94KG1mbiksIG1mbl94KG1mbikg
KyBuciAtIDEsIGQtPmRvbWFpbl9pZCk7DQo+ICsgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIg
IlVuYWJsZSB0byBtYXAgTUZOICUjIlBSSV9tZm4iIGluICVwZFxuIiwNCj4gKyAgICAgICAgICAg
ICAgIG1mbl94KG1mbiksIGQpOw0KPiAgICAgICAgICAgcmV0dXJuIHJlczsNCj4gICAgICAgfQ0K
PiAgIA0KPiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4gKysrIGIveGVuL2NvbW1v
bi9ncmFudF90YWJsZS5jDQo+IEBAIC00MTUwLDcgKzQxNTAsMTAgQEAgaW50IGdudHRhYl9tYXBf
ZnJhbWUoc3RydWN0IGRvbWFpbiAqZCwgdQ0KPiAgICAgICBib29sIHN0YXR1cyA9IGZhbHNlOw0K
PiAgIA0KPiAgICAgICBpZiAoIGdmbl9lcShnZm4sIElOVkFMSURfR0ZOKSApDQo+ICsgICAgew0K
PiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiArICAgIH0NCj4gICANCj4gICAgICAgZ3JhbnRfd3JpdGVfbG9jayhndCk7DQo+ICAg
DQo+IC0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gKysrIGIveGVuL2NvbW1vbi9tZW1vcnku
Yw0KPiBAQCAtODMyLDYgKzgzMiw5IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXAoc3RydWN0
IGRvbWFpbg0KPiAgICAgICAgICAgcmV0dXJuIC1FQUNDRVM7DQo+ICAgICAgIH0NCj4gICANCj4g
KyAgICBpZiAoIGdmbl9lcShfZ2ZuKHhhdHAtPmdwZm4pLCBJTlZBTElEX0dGTikgKQ0KPiArICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiAgICAgICBpZiAoIHhhdHAtPnNwYWNlID09IFhF
Tk1BUFNQQUNFX2dtZm5fZm9yZWlnbiApDQo+ICAgICAgICAgICBleHRyYS5mb3JlaWduX2RvbWlk
ID0gRE9NSURfSU5WQUxJRDsNCj4gICANCj4gQEAgLTg0Miw2ICs4NDUsMTggQEAgaW50IHhlbm1l
bV9hZGRfdG9fcGh5c21hcChzdHJ1Y3QgZG9tYWluDQo+ICAgICAgIGlmICggeGF0cC0+c2l6ZSA8
IHN0YXJ0ICkNCj4gICAgICAgICAgIHJldHVybiAtRUlMU0VROw0KPiAgIA0KPiArICAgIGlmICgg
eGF0cC0+Z3BmbiArIHhhdHAtPnNpemUgPCB4YXRwLT5ncGZuIHx8DQo+ICsgICAgICAgICB4YXRw
LT5pZHggKyB4YXRwLT5zaXplIDwgeGF0cC0+aWR4ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIC8q
DQo+ICsgICAgICAgICAqIE1ha2Ugc3VyZSBJTlZBTElEX0dGTiBpcyB0aGUgaGlnaGVzdCByZXBy
ZXNlbnRhYmxlIHZhbHVlLCBpLmUuDQo+ICsgICAgICAgICAqIGd1YXJhbnRlZWluZyB0aGF0IGl0
IHdvbid0IGZhbGwgaW4gdGhlIG1pZGRsZSBvZiB0aGUNCj4gKyAgICAgICAgICogW3hhdHAtPmdw
Zm4sIHhhdHAtPmdwZm4gKyB4YXRwLT5zaXplKSByYW5nZSBjaGVja2VkIGFib3ZlLg0KPiArICAg
ICAgICAgKi8NCj4gKyAgICAgICAgQlVJTERfQlVHX09OKElOVkFMSURfR0ZOX1JBVyArIDEpOw0K
PiArICAgICAgICByZXR1cm4gLUVPVkVSRkxPVzsNCj4gKyAgICB9DQo+ICsNCj4gICAgICAgeGF0
cC0+aWR4ICs9IHN0YXJ0Ow0KPiAgICAgICB4YXRwLT5ncGZuICs9IHN0YXJ0Ow0KPiAgICAgICB4
YXRwLT5zaXplIC09IHN0YXJ0Ow0KPiBAQCAtOTYyLDYgKzk3Nyw5IEBAIHN0YXRpYyBpbnQgeGVu
bWVtX2FkZF90b19waHlzbWFwX2JhdGNoKHMNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGV4dGVudCwgMSkpICkNCj4gICAgICAgICAgICAgICByZXR1
cm4gLUVGQVVMVDsNCj4gICANCj4gKyAgICAgICAgaWYgKCBnZm5fZXEoX2dmbihncGZuKSwgSU5W
QUxJRF9HRk4pICkNCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICAgICAg
ICAgICByYyA9IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUoZCwgeGF0cGItPnNwYWNlLCBleHRy
YSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZHgsIF9nZm4o
Z3BmbikpOw0KPiAgIA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oDQo+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgNCj4gQEAgLTI5Nyw3ICsyOTcsNiBAQCBpbnQgdW5t
YXBfcmVnaW9uc19wMm10KHN0cnVjdCBkb21haW4gKmQsDQo+ICAgDQo+ICAgaW50IG1hcF9kZXZf
bW1pb19yZWdpb24oc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICBnZm5fdCBnZm4sDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5y
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbik7DQo+ICAgDQo+ICAgaW50
IHAybV9pbnNlcnRfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBzdGFydF9nZm4sIHVu
c2lnbmVkIGxvbmcgbnIsDQo+DQo+DQo=

