Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37345D91E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230987.399336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCo9-0006qP-7G; Thu, 25 Nov 2021 11:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230987.399336; Thu, 25 Nov 2021 11:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCo9-0006oA-4D; Thu, 25 Nov 2021 11:20:53 +0000
Received: by outflank-mailman (input) for mailman id 230987;
 Thu, 25 Nov 2021 11:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lI9u=QM=epam.com=prvs=1963e0fee4=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mqCo7-0006o4-N1
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:20:51 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdc0a40f-4de1-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:20:49 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1APBHgvH027258;
 Thu, 25 Nov 2021 11:20:46 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cj8mg0723-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 11:20:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6884.eurprd03.prod.outlook.com (2603:10a6:20b:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Thu, 25 Nov
 2021 11:20:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4734.022; Thu, 25 Nov 2021
 11:20:39 +0000
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
X-Inumbo-ID: bdc0a40f-4de1-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlgKrQUMyREnaAqC8av84Az//OzS0cLVp7pGS+wfdrsIcukIWun73oRX1oXWgu0uzI3gPY8VldrVeGbzTreIyhYUa+AREdAz1DkJLmDt8ADw3lCv5qRuXJ12t3RpVWiF/6CmuKnyTLpG2gOWWRFQ61cJxL0jK1W9r3cxsLJc4Wd1bhTzcVDxhb03YsbP4L0qphsvfaF5q5K/64RHZsWYUq5FtlfjjJFtBDqbeVgqTQomZrdFvWPXSXKAbY1ZD4bYRZoLwRgKw4NjhLwCfxkk2FYh/FX+fRa+bcqvCMOsPPMYCl5EiIafxfFjqkocKjLUGPFeDNBMnQhTJcl0/h1cMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTLF9kFSmUDDPi3lveMdTbhQS/4c2xojykeC3vHcILQ=;
 b=ieMbTb7qnkUqr0jXpzlzZee9xGybUsvYXJWcvo7sywAkHRFvUyO39ugms56WHemfCdLeFGEkeUbwZHLGOYaXngSDI2007Jpd1T0oyQhBhzZeHEl5LhwiJWC9Ejj0U4LaT+C8IRBD0OznsJwvHpy6aNAM6jTfe3FsIX6crn6LjK2liI+YLrrZJhzaCrdAcK97o2hj522DJnbm8yZ/PXVWfNuozeZDx2fJHdV2W3wd7hGSRDBlWYrxQocBYrRYjzRCadUAM1oiR5Ia2u1pNvXt8RjoUyg+kh0alUSA5Tj4gkpcOsBX+bgL7KepXkdA6e62BMiMexq+1DbN7x5tWiAh9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTLF9kFSmUDDPi3lveMdTbhQS/4c2xojykeC3vHcILQ=;
 b=XqKIOq6EW8N5GZVMj6QtDEll06lAKZWqlzfBG3paxGZGIHACZvEmWgcLbpvlu26qjYRGbk3PTWakvq0s7UnMdq09GpXVe3OyjRLunCAvtmVm/6WXYpvXMUiFRKLZUaGgpL3eRU04dxePIh0O8ojmW40TDglUqtlVZ8bfpj1zPHt97yPqopBYXMmi9lSBYeNsI0yD5CjmlNpfmrH0ddmu8Yi57hJ+zYtfUBNJo7Yh4d1Ioy0UvYLjhI9xLcebd+8VwJzp2HaJFtBDYACSpaqyKaTlhEcI+huGyDSzJJn9ksyCywPajsBrRdAehzHhLQ7LB8PEsPxT5Wjm0S6Chw4xuw==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly
 handled
Thread-Topic: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly
 handled
Thread-Index: AQHX4ewNiPcRmuDEOU6R/33b+PKQzqwUGDwAgAAA3IA=
Date: Thu, 25 Nov 2021 11:20:39 +0000
Message-ID: <75b4ef3a-b4ac-fd61-3ee6-52469718b723@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-15-andr2000@gmail.com>
 <892d6148-e98f-def2-121b-922f1215a442@suse.com>
In-Reply-To: <892d6148-e98f-def2-121b-922f1215a442@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7df01fd9-9dcc-49ab-dd43-08d9b0059c42
x-ms-traffictypediagnostic: AM9PR03MB6884:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6884A27F6066D1E6325F341AE7629@AM9PR03MB6884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kHJtuoUfFknlKTYMlVRz/RCQA2oIUR2ftbF8ufShrAZJWEtzKD6zP+YJX7IUI2GZuf63McQL6enua0KFHCtf7YUzVN+bdiwZr9a59aXm6UisAlOos5Rdgi8wcjPxlqM3FkTcRA2pCWCUWZbvwHJ9VtHUqRASn7xHvBc1iBqSdxc3wt2/zE3qDyg/dPVz5XUC6zJ6hl0plzlsqzju0rcxy3wzycvQ4+svHKL6Vr3OGDD3umz9agVV0Ex7yHsWUP8Zfjeof7TMpR1hT6YDCMEl+fTr59E8OKKkJdeSx1roRR8xerJESJcyhOotg9BNv0B+wPJUxJSRe8tSKG6cIigcCboAMuvxyqyBP1rJ+Og748KfMzPJa2I5ArIRK4XDWSm8N0cao1M/BTe4URMC826+xNB07PR3N1DXgTAcMf/9vVme1ixK6C+02FAge891vE3T8Gww1a6F1/rQHapJym1BeMvopJwk7fBHnIi1y+AbIYVDgFA2gPoepiMnojcYo3AMPuMiMc42y0W8NAF7vv/YC0Hcd2MmPvmuj4yZQ4j2uP4xIv3Fx2TwZxQ7WnUnjbAXaCjHq0OFQ3+/CbOBzXAAHhpJunYT1iKXbH7qad73AaxmyqRWHqqv0oGUBBnC1juj4wOv/J19GTlLNtYAr9FzzU+GE7R2Y94Vsxe4MZ5cfeusbmLpyAC+hBFE90IsLW+BGI9cw0L8AbCPKHxxxrHx1zaD3Z1yZoQFVJa20Wut+n0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(508600001)(8676002)(7416002)(31696002)(4326008)(5660300002)(6506007)(71200400001)(91956017)(66946007)(54906003)(66476007)(107886003)(38100700002)(31686004)(66556008)(6486002)(6512007)(36756003)(2906002)(8936002)(6916009)(76116006)(66446008)(64756008)(86362001)(316002)(53546011)(38070700005)(122000001)(55236004)(26005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RkpmRjNIWDlGUEgwbXAxeDQ3dnNyc3Y4TWFaU1RJbkZib294M0NnWVc3UnZ1?=
 =?utf-8?B?SnU5MFhsVzRHRTlUa3ltcmVUcDcyWkVoNXBRcVp6cExUL0lvTFFBa0NDcXhk?=
 =?utf-8?B?NE5QT04yY1FPeSsxRlVLdVpXOEJtKzVtMTFVSi9mQzBuRVFLOWlXRTZjV3Bz?=
 =?utf-8?B?djV6WTFnWi9IckpzampOVnhXY2dmenR3SmtRanlUdVIySlEvUTdCcXo1eXAw?=
 =?utf-8?B?ZUdRb09MWmhHOHdrSDhidUpGb2pQakdYSXVSOUtndXl1Zm1JUmdpbVdFV1hN?=
 =?utf-8?B?RncwUHk4cXF6TktjK1lsZ29Pdlo0d1BRcndsUFRTL2xIbzhTSFV1cUgyVlpM?=
 =?utf-8?B?b3paOStwNlRRRkpsMUVmZkRCVzJGbU1td0VmK2FnTGk0TDQ0VWwzbCtXWG04?=
 =?utf-8?B?MkxCUnpmdmZmKy8xcUd3N2ZDMHE4Zk14bXZQd2VUWWN5NWlneWcxVjMwcWtI?=
 =?utf-8?B?SmRqVkl1eGh3ZUJzVFg4TUw0L3dDMHlqbWlXcmNIc1FpZ3A2OVh2N3h2L0ps?=
 =?utf-8?B?R1VQZE1zZ2tmTnB5ZkFVbTZpREp3eEUraVZaLzQ1UjJqYUw3cWpPQXNNczZL?=
 =?utf-8?B?ai95MnJkQTBUOVdrSUpHNmE2WjFqdjV5WHVwaUNYV2lDaElQSVlac2Fwek50?=
 =?utf-8?B?Um9TZnBTMTBNSk11cGFFQlNGemVsN01wSmt2MS83WGk4SzhsakVpQUlMVEpH?=
 =?utf-8?B?a2gyUmFOREdmMDc0L2hMUFpjKzhsaGNrYUYzNHJBbmN3R2VJTlFHUGhENXVy?=
 =?utf-8?B?VTQzblg0YkJaZitLYzBPRnNac2ladGd3TXgxejJCeHZzSzZseFhUQ2ZGZzBt?=
 =?utf-8?B?citiaFo4Z1ZNUW9JMzFjVzNMeWVGVjJYMkNGbklSYThFUU9KdlJraXZyNDE0?=
 =?utf-8?B?SVYzUENhRVIvSk9EeDFFUitxc2NkdnNvcUpCY0xqc2RJeExXWDE5bWU2YWRR?=
 =?utf-8?B?d3czRklKTkhYQUFFbDB0UGRkWTIyM0ZidW9tLzUzeUs5YVhkeEh6UEFmMkF4?=
 =?utf-8?B?UHRRbC9iYWJNY1lWRkUwT29NdGV1cWVlUDRFUG8vaFNKYmpidCtDZndvSmxz?=
 =?utf-8?B?UVVGTGJFY094WndUbTVXYnJpbHBrQjdOdGJML2lOY2dHM3YvOTNzQlo0NHUv?=
 =?utf-8?B?SjBmakU4VVhvY1NmTVFOMHQ1enBlMVJSS0NYTW5QbFRWOUZaY29aWjlLT3Na?=
 =?utf-8?B?ci9GcUJZa294ckFiTXZXQzZLZitWL1RzUzhtUVBGelFIYzQvN2ZkQTIvUnNS?=
 =?utf-8?B?MExHVXkzMjlrSVRPZkVrQWFCU3EwM1RyUjI3UE84WWpKSXpLdytrWHM1YzZE?=
 =?utf-8?B?cmZZQ1RSSE8rRWV5MWZ6TFpMbDBDb25VakltYWFZNjE4VlFBQjhsaVdHNG1x?=
 =?utf-8?B?bW11dTQ2bDdLNElLSENkTXhDTDVxVGRaYVB1Q29iQy9YQmZlU2t0d3AyTWs5?=
 =?utf-8?B?SG1iNE9JVG16MGtlaWtjZHpscmVpMVBpeVZvWWdnaGp1S0FQS1JJKzVNeVhL?=
 =?utf-8?B?ajVNN1ZETnlOUzNITjgzVDYrYnlFZ3JpRE0zZkNITmwwU0l4SFFFUkJlZitn?=
 =?utf-8?B?YWtXMW51dkdPS201Z2xlUXk2U0x4WVBiZjQxcG9uZHF4RytOb01hSnFCYjhS?=
 =?utf-8?B?dFVpbXNqSWM4Q2Z3c2dZMU9tV2VlSWdSMTkydTVqMEkrQS9nT1hzL0hDWXNm?=
 =?utf-8?B?b1MzZXQ1dDduajkvU2RuR2dwNWhFVFlwTENDL1JEdTQ0UGtacmpJRk9FcGdv?=
 =?utf-8?B?bzBZaWNIS28zMU4rckNoSGhrSkVFZkt6YVo1QzZaeWVNUFpTSmdHN0tibWRO?=
 =?utf-8?B?b2VWTHJhZzAwYTJNQitYSEsrU1MrUmUrSTdGV285Nm1JSGZrSVkySERJUnFD?=
 =?utf-8?B?ZVBBMTgvck9JTktyQzRySmx4NGswekRoUklpZ3lIR1ZtNUk0ZURnOU45OXJr?=
 =?utf-8?B?aDJSNmpEZEhJZ1VWaDcvWU91bFRjSktoOG9mSkl0eEo3Qm9MdTFURWJHblMv?=
 =?utf-8?B?ZjE2WEVMWWp2dDRnSjdSMVlZRHllSjFLUzFLY2xPb1AxY05jSzJ5MnZIazc0?=
 =?utf-8?B?QW5OT3F0Smc5NmVtVXpLTnFlcUdxWGFQOUdRRisvb0EzQXUxeDI1elJDYUkw?=
 =?utf-8?B?ZVFENDVwVUxtdHJqZW9ySWF5SUF5WVMrTHZVQlIwV1FnU0c5QmFxV1grdlZW?=
 =?utf-8?B?SFBJcEU3cFVmaUFra2V5NC90NGhxWXRtWWdmYjk5YklXOG5vVHVHVUNVZGly?=
 =?utf-8?B?TGxtc1RKVDJVTUVic3VIcXJpc3BoSDZQZFo4M2szT213cVNKajRPdlIyWDNx?=
 =?utf-8?B?dUh6OWo3UEhvWnE4UWdFY28yRkVjdVR4RDl0WVlLazY0T2c5QkNWQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7EB5B88C14D3848BDAE1441DF20CC91@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df01fd9-9dcc-49ab-dd43-08d9b0059c42
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 11:20:39.1134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1iodWfh6t4xnbTeygeJgFg3b0W4H4sBLS0Am9FJ8oSEJnH+Ud31v0yB4Nytm8L8GxpcbtNwtExcenqvMjYsBnNw9dTqNw3p+g3OT3MneM7ZlmE7EWhdYcug9fDDe0qw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6884
X-Proofpoint-ORIG-GUID: SCMpP6n3gWSBeMKR5-9-OnXtDXuhtFmH
X-Proofpoint-GUID: SCMpP6n3gWSBeMKR5-9-OnXtDXuhtFmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_05,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxlogscore=986
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250062

DQoNCk9uIDI1LjExLjIxIDEzOjE3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMTEuMjAy
MSAxMjowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gRm9yIHVucHJpdmlsZWdlZCBndWVzdHMgdnBjaV97cmVhZHx3cml0ZX0gbmVlZCB0byBiZSBy
ZS13b3JrZWQNCj4+IHRvIG5vdCBwYXNzdGhyb3VnaCBhY2Nlc3NlcyB0byB0aGUgcmVnaXN0ZXJz
IG5vdCBleHBsaWNpdGx5IGhhbmRsZWQNCj4+IGJ5IHRoZSBjb3JyZXNwb25kaW5nIHZQQ0kgaGFu
ZGxlcnM6IHdpdGhvdXQgZml4aW5nIHRoYXQgcGFzc3Rocm91Z2gNCj4+IHRvIGd1ZXN0cyBpcyBj
b21wbGV0ZWx5IHVuc2FmZSBhcyBYZW4gYWxsb3dzIHRoZW0gZnVsbCBhY2Nlc3MgdG8NCj4+IHRo
ZSByZWdpc3RlcnMuDQo+Pg0KPj4gWGVuIG5lZWRzIHRvIGJlIHN1cmUgdGhhdCBldmVyeSByZWdp
c3RlciBhIGd1ZXN0IGFjY2Vzc2VzIGlzIG5vdA0KPj4gZ29pbmcgdG8gY2F1c2UgdGhlIHN5c3Rl
bSB0byBtYWxmdW5jdGlvbiwgc28gWGVuIG5lZWRzIHRvIGtlZXAgYQ0KPj4gbGlzdCBvZiB0aGUg
cmVnaXN0ZXJzIGl0IGlzIHNhZmUgZm9yIGEgZ3Vlc3QgdG8gYWNjZXNzLg0KPj4NCj4+IEZvciBl
eGFtcGxlLCB3ZSBzaG91bGQgb25seSBleHBvc2UgdGhlIFBDSSBjYXBhYmlsaXRpZXMgdGhhdCB3
ZSBrbm93DQo+PiBhcmUgc2FmZSBmb3IgYSBndWVzdCB0byB1c2UsIGkuZS46IE1TSSBhbmQgTVNJ
LVggaW5pdGlhbGx5Lg0KPj4gVGhlIHJlc3Qgb2YgdGhlIGNhcGFiaWxpdGllcyBzaG91bGQgYmUg
YmxvY2tlZCBmcm9tIGd1ZXN0IGFjY2VzcywNCj4+IHVubGVzcyB3ZSBhdWRpdCB0aGVtIGFuZCBk
ZWNsYXJlIHNhZmUgZm9yIGEgZ3Vlc3QgdG8gYWNjZXNzLg0KPj4NCj4+IEFzIGEgcmVmZXJlbmNl
IHdlIG1pZ2h0IHdhbnQgdG8gbG9vayBhdCB0aGUgYXBwcm9hY2ggY3VycmVudGx5IHVzZWQNCj4+
IGJ5IFFFTVUgaW4gb3JkZXIgdG8gZG8gUENJIHBhc3N0aHJvdWdoLiBBIHZlcnkgbGltaXRlZCBz
ZXQgb2YgUENJDQo+PiBjYXBhYmlsaXRpZXMga25vd24gdG8gYmUgc2FmZSBmb3IgdW50cnVzdGVk
IGFjY2VzcyBhcmUgZXhwb3NlZCB0byB0aGUNCj4+IGd1ZXN0IGFuZCByZWdpc3RlcnMgbmVlZCB0
byBiZSBleHBsaWNpdGx5IGhhbmRsZWQgb3IgZWxzZSBhY2Nlc3MgaXMNCj4+IHJlamVjdGVkLiBY
ZW4gbmVlZHMgYSBmYWlybHkgc2ltaWxhciBtb2RlbCBpbiB2UENJIG9yIGVsc2Ugbm9uZSBvZg0K
Pj4gdGhpcyB3aWxsIGJlIHNhZmUgZm9yIHVucHJpdmlsZWdlZCBhY2Nlc3MuDQo+Pg0KPj4gQWRk
IHRoZSBjb3JyZXNwb25kaW5nIFRPRE8gY29tbWVudCB0byBoaWdobGlnaHQgdGhlcmUgaXMgYSBw
cm9ibGVtIHRoYXQNCj4+IG5lZWRzIHRvIGJlIGZpeGVkLg0KPj4NCj4+IFN1Z2dlc3RlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiBTdWdnZXN0ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4g
TG9va3Mgb2theSB0byBtZSBpbiBwcmluY2lwbGUsDQpUaGFua3MgUm9nZXIgZm9yIHdyaXRpbmcg
bW9zdCBvZiB0aGUgdGV4dCBpbiBlLW1haWxzIHdoaWxlIGRpc2N1c3NpbmcgdGhlIGlzc3VlDQo+
ICAgYnV0IGltbyBuZWVkcyB0byBjb21lIGVhcmxpZXIgaW4gdGhlDQo+IHNlcmllcywgYmVmb3Jl
IHRoaW5ncyBhY3R1YWxseSBnZXQgZXhwb3NlZCB0byBEb21VLXMuDQpJIGNhbiBoYXZlIGl0IGFm
dGVyICJbUEFUQ0ggdjUgMDUvMTRdIHZwY2k6IGFkZCBob29rcyBmb3IgUENJIGRldmljZSBhc3Np
Z24vZGUtYXNzaWduIg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

