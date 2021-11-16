Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D11452E2A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 10:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226219.390846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmuvS-0007f0-H5; Tue, 16 Nov 2021 09:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226219.390846; Tue, 16 Nov 2021 09:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmuvS-0007cW-Dw; Tue, 16 Nov 2021 09:38:50 +0000
Received: by outflank-mailman (input) for mailman id 226219;
 Tue, 16 Nov 2021 09:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmuvR-0007cM-03
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 09:38:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcfa878a-46c0-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 10:38:44 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG9JlKH029584;
 Tue, 16 Nov 2021 09:38:41 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cc9rs044x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 09:38:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2802.eurprd03.prod.outlook.com (2603:10a6:200:93::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 16 Nov
 2021 09:38:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 09:38:37 +0000
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
X-Inumbo-ID: fcfa878a-46c0-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE+AiDXdTEkVQbCoJMd5Z69PeiWuhZ9+qzWpGkqlSIKNy+ZzepvufyMCsSl0uAfX4lX0NeP1Fxt/Vbj02B948LYT3V8jlmwSLRQKFAUs3MX3wst05VoI1tyP+TgkZcOLLvbCGouKFAkaVBs9gMX/rwoN92DQPVP15mYbIEfcsNMZEI3as7GV/FEWfkTt8y3Wss5eqtzMQ5enqwipKpuxva8chErb4PCLNPf5TCxzIZYX1Gb7E7xSneW51JZr1ZCqTl1sPt/jzyucEYFNMu2UtgssZnnPNE4cW4CqWjXoiPPLCXPc0wSGs2m22vUIV4iIPynKn3hFKdP587kjVqo2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOi4jsePjCVJJtf8XlN9+bvo8ugQSGEW4ln9t2Y+Pt0=;
 b=Dj3TDwkD4Lf+MxfAP5bUcpDf0lYM/j9zOwJGiGFpNi4TB39rBrRCF9IopcNfmwZ2nC4LXrh4+P2m+mwh2hH/toEG1TyvmKt1hN9LVivsVQzZLtCnT2g+JbTFXkWy5Ihr8gYDokxNumND6cZ9z0fLLN+d46N1zTdo4fEr7XNDh+3YkEXC1wYsU87DDT30LN6FuTRbfYLIh+MmEuKEfxsc/z8sgIYRnRHGyO/orwaFjJ/ZHgMsJEDh531N5kRho1W6NfFG4QRZyUVqjCn9g60nXtvW9VDS+rfkNIMRb3BWpyIGBrHQ1shgo4YS8hYlw+DcUvs0jMuaZHHq2fkYDtkDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOi4jsePjCVJJtf8XlN9+bvo8ugQSGEW4ln9t2Y+Pt0=;
 b=K8VzKW4rYwCZy0y6VpY/nyNZo20yw/n4Q0MNWVyC5y51Tv6KgibbwrpDwDVlDWjdLebqYrZsj3kJjlCH++S8iUkfAz9wKyzysmvkSY3AwLUt8iS5WO9WL6KTfDHBbXcXxu11QPJVNFFh8050Ny5KCZ2RkcVMDsXkKnUYiAoRzQGb9bo0vapQPyf8d7x8KEgLRpDXgsy1e3jb4B5Xs4/9LEopiXKt1CdLqPLgajsB1MYZ5KOCgnlZrCZbbSV4vlMUJaZJD1EVT6Rh4RE7QUFn7gYVXrUGISCRwQ8pNhtsMFNr/pykrjhK5HnyAH30FO0F3S8cMA8u4tNdu0VC/hgjeQ==
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
Subject: Re: [PATCH v4 04/11] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v4 04/11] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHX0hJJIJTGsgsktEqeU1aKILk346wE4jUAgAEVGwA=
Date: Tue, 16 Nov 2021 09:38:36 +0000
Message-ID: <9a22f3a6-d1d2-a40b-f1a2-50c9816eafcd@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-5-andr2000@gmail.com>
 <9d72b3b0-22be-45fd-2bc6-cf27f96afe5f@suse.com>
In-Reply-To: <9d72b3b0-22be-45fd-2bc6-cf27f96afe5f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57a9510c-f805-4748-8b43-08d9a8e4dd6a
x-ms-traffictypediagnostic: AM4PR0302MB2802:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB280224BF2069A06C522C73F4E7999@AM4PR0302MB2802.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w47f7WlGeVeZqdREBdFNfdv40UpykEdAt1jEgH8Gs0vWT7BXPNBFYLNHtHIc2IuE8f/v1m7NsLTnFn6vBWDc1o14I+QPg0ixVqPORxySx6pE8jZ4MdWrcrwyXquNY3qSJBehk8jIsZA9tYdFS6EPieYKu9RIRc11CoZJyOy3czX/nPyOCEY8iazgSHHnHmw6RupFujGtbUrU4d/qcPg5FUi6ccexYWGnWGCKXkSRlJvrA7Z87FtrBJh+8XIkNC2pO5mE2DFcImDSkb4AYkjh7mrGeNaFSmhdQhZcVC8Wns0LLbr4BS6fgVDHvbcAuYYlZYBU5SN/C2Pko/aeoUzvRj1ENDN9i/IwNHOm4RYyF9epGuerGOzxFqE+eSODSdiCr5dcT7biTkx3ReAoPnXtpg2d1OsScKW5eQP4NMQuUggu+Oog/arscGcUTb3P42zdU9jo3+Ji29Gx5paxsq+8Ac7iMKHy/9ZyBtVL8Q14/s33Uy+iF8CORR+CXRgXSGCf9NTDYQSRjyR4TN+P7Yt7roirQGrTFYAy1clQLF37qYmGplX/tlZZm1g/L4NajycGzn5IglRB2V0vq2pb9SS6K3+wQ3ep08JsB9Af9wdXuq4JVEuDYxr6JGSmFSupXGHdm+dqZ79K2Jf4umwDE5SdFlakRlrIahwVKf+HZPRcdFAk/kgkyQxVyPdL8XUm9sqMEzV2maaatbilKp32EdGAGT4Eu2ffbrMfBRaTpJKsxzl/0zmlkrRVypXg/oCh3ODo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(38070700005)(508600001)(2906002)(66946007)(316002)(107886003)(66476007)(66556008)(31696002)(2616005)(66446008)(38100700002)(64756008)(122000001)(76116006)(7416002)(91956017)(186003)(8936002)(53546011)(54906003)(6506007)(86362001)(31686004)(6486002)(4326008)(5660300002)(71200400001)(26005)(6512007)(36756003)(8676002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aEFPWkkzL0FqSllzR1N0L28zMmxBSDdpRHRtVjc4aDJTODJZeGJubFliQ2kz?=
 =?utf-8?B?MTNLYmZ0dWZwNkRHZ1dlV0d6cncrajVlL3NJZjBLeEN1UlU5YU13R0ZhRjQx?=
 =?utf-8?B?ZHppM25QMkR3c2NnS3N4QzN0Y1RITmxXVDNjRkZTbnNRTldHNlhGQ0ZNS29y?=
 =?utf-8?B?ZG8xMlppMjNlZk5aMjRyNFRNVlMyNzJmSU1wYTVteFNoWnY3SDhRME9CR0lT?=
 =?utf-8?B?Z3R5TnJla1g1SDF2UWRoaDBDcTcxUEZtbWN4cU05L2VwL24rb3JiWVlKcGhv?=
 =?utf-8?B?Q0t6NU0xSnpNdG5SOVlZb29wUjh1MDlUSVBYd2FaNXFjZEJQaTlPbjY2M1hO?=
 =?utf-8?B?aElEcDJmZ0xmNW5aeW1ldGU5d1JYZ05XdnVzZnplK3ArR0cvNjlDdzVJZmpV?=
 =?utf-8?B?WW53NllXTHJnMGFKek5SNmhEU3ZZYzVaakFHSzFHZ0hrbXRzcUtZR2hjM1pV?=
 =?utf-8?B?bGJyNEZUU1QzZitpRG9lcU1pdERaWUFubHVBUjhNT0lpTWNkRmdsdWwxVEhz?=
 =?utf-8?B?SWd2aUk1VHFFNlJ3dmJUclJUcm15Uk1UQVlVbkJCbmNURHNCU2VZYUtjWUF3?=
 =?utf-8?B?T1llU1E3TFZ4OVNlVnNFNldEc3p5eXFqS0gyMUpHcHpqMzF4azhjQUlNNElR?=
 =?utf-8?B?bjdyVGRrVmdYcUVMSWRNR0djd2xUdEVFRHBmSGRTUzhhUHNXbGNEYWVjWUls?=
 =?utf-8?B?YlNsV0NnVm9IMkJ1dzQwWlREUXA4V2UxZytqengxZWtEazEvOFVjbDlFMFR6?=
 =?utf-8?B?L0JlZlZOMmpLK2hxVWMrOTduYmhMMXl3azlIaU5BU0Y4ajJpS1NYVnI1bW1Y?=
 =?utf-8?B?K3hRRlV6Y3J2Tm51THdZK2s3UHJMbTlPa3NMOVp6eWd6SURYeDcwejJzb1pY?=
 =?utf-8?B?MExCQnNOaEVGVWpIR0FtYnpQUlJZclJIQTgvcko4bjQ4RGhpRDZBbmhva0dP?=
 =?utf-8?B?TVRBSzlnUUd0RVdienpJZWUvdHFIUG1ldXZmY1gyNEtvYStaNEZqMmVwbHVS?=
 =?utf-8?B?eVpackJYRFQwT0phdHY4cG1JeXpueHA5aHhGOGRuRUt1cUp1L2NpWmdzVnlV?=
 =?utf-8?B?R21oS29jSm1IWnFGMjQwV2hLM29vNEZlV29OOEZqS2gwNE5uMDVrbnFCMFNH?=
 =?utf-8?B?TFgvbmhha3lkb0ZQUUVLczhzTWk1d1lPbFRJcnU2K0t0bUtZelFxcXZ5Q005?=
 =?utf-8?B?MU5LOGs4NFl0Ky9xNGQ5aHdldzJnbEpUYW1EWUo5UHNKS3JEMU8zTXV1UlVk?=
 =?utf-8?B?QlBMckhzUWE5cmdYckdpT0ZRejNMYnVsa2hXZWhFa2l1eHJxdUhRWHNGYnBa?=
 =?utf-8?B?czdON01TZFI2ZEMzeW5ucDI5T0lQd1ZOU0dVZmd0bDNyK3VQWDMvRFhIU1N6?=
 =?utf-8?B?M2FkOGFyeG55WEovc3pYeDE4c3p3YlZQdTUrcFBrdmxLYnRJeE1IUlFZd2xB?=
 =?utf-8?B?UENVUmUyYVNnK2VXYTBzRUR4cGJMMnE3cGpZaTRwNlZUMlJwUVZSQXZzVk9X?=
 =?utf-8?B?cVRmVHdPQ1FLNXNnUngyS05wU29uVmJsL1QrRDNKa0xMRzdlQ1dXK1ZBNE1P?=
 =?utf-8?B?QU5VMnFTZDl6UTJHYmt1S1dxVWdGalFWY1g3TG5SUDFRdmJHeGxwMkp3eHI2?=
 =?utf-8?B?cUc3eDJlT2czQjhJOHJnRS9xOUVtUTFMem4ycnpzc01UeXVmak5HRHl0MC8x?=
 =?utf-8?B?MkdqOGdnS29SMHM2TnpBamtiejBHU082Rm9TRjRMNk8zbEJyNUhrOGtvcm1X?=
 =?utf-8?B?VUNVTTFMdUZHelI5ejBJMFBHb2them9vcHNZRThKL1YwazAyUmFmOWxNM2xQ?=
 =?utf-8?B?TDBCZEwxTlhNRFl2SWlhY2pYb3Q1aFNnZHVlaWNLZUJNTythVGhSWnhLNDY2?=
 =?utf-8?B?RnB5Y0xWblc5TGlCODFIZUd4MDQ5VWQ0U1hBOG94RlQvNno4ZTdrazN2OG1z?=
 =?utf-8?B?NnhWQU1CQkw3aEkxQ09CbFJ1QmlBeWJmVzMvK3pyMzdQdGxyd1dTeTZCdTFO?=
 =?utf-8?B?d0ZIaWxnQWNCR3dDaHVvSGhjZ0J4dWk1RlNUL2d4OFkxZzRuaXVkamFoTlRI?=
 =?utf-8?B?UTY1cUZQRmUyK3RKcVEveit6eXBiWXBKcTNtbDQwTkZTM0tyUk8wMzZha0JV?=
 =?utf-8?B?MHdaMDUrRkI2NlpjZ3JEWGNvdk5CSWJNeDI1MGNUSXBlTE5iOTI3SjZJcFUw?=
 =?utf-8?B?ZTJwR2xDanM1Sm1taWhoWEdXTlR3RS9rYlNBeG1mekVUNitheDVwZXNWSmRJ?=
 =?utf-8?B?R2pLRlRCbUdHazk4NkVYVTduL3VQUExtNFFtbGhNSHhaY3FpWWxkZzNlMXlt?=
 =?utf-8?B?U0I5cllVMTk4bEVlbk9ndE82UjFjZnhQUWFNRFNpNFZaQVdwUHhtUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62EBA8D252909746830FAC332FA052B6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a9510c-f805-4748-8b43-08d9a8e4dd6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 09:38:36.8371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wCnD0II5q96glAdkmclSOz3nAvmzwropn2ykfpQsmdG0QvSsz22ei3tvysmFZzU03g+n2Sk56n6kHaZifb9LJSJmlY4j9b3JkVi6MlcN+WDlqcucI+CgTGkHq0jVFlH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2802
X-Proofpoint-ORIG-GUID: NWn9t-jt8DIElM6bjDgiFIf6C5XPTswu
X-Proofpoint-GUID: NWn9t-jt8DIElM6bjDgiFIf6C5XPTswu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160048

DQoNCk9uIDE1LjExLjIxIDE5OjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gV2hlbiBhIFBDSSBkZXZpY2UgZ2V0cyBhc3NpZ25lZC9kZS1hc3NpZ25lZCBzb21lIHdvcmsg
b24gdlBDSSBzaWRlIG5lZWRzDQo+PiB0byBiZSBkb25lIGZvciB0aGF0IGRldmljZS4gSW50cm9k
dWNlIGEgcGFpciBvZiBob29rcyBzbyB2UENJIGNhbiBoYW5kbGUNCj4+IHRoYXQuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBTaW5jZSB2MzoNCj4+ICAgLSByZW1vdmUgdG9v
bHN0YWNrIHJvbGwtYmFjayBkZXNjcmlwdGlvbiBmcm9tIHRoZSBjb21taXQgbWVzc2FnZQ0KPj4g
ICAgIGFzIGVycm9yIGFyZSB0byBiZSBoYW5kbGVkIHdpdGggcHJvcGVyIGNsZWFudXAgaW4gWGVu
IGl0c2VsZg0KPj4gICAtIHJlbW92ZSBfX211c3RfY2hlY2sNCj4+ICAgLSByZW1vdmUgcmVkdW5k
YW50IHJjIGNoZWNrIHdoaWxlIGFzc2lnbmluZyBkZXZpY2VzDQo+PiAgIC0gZml4IHJlZHVuZGFu
dCBDT05GSUdfSEFTX1ZQQ0kgY2hlY2sgZm9yIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JU
DQo+PiAgIC0gdXNlIFJFR0lTVEVSX1ZQQ0lfSU5JVCBtYWNoaW5lcnkgdG8gcnVuIHJlcXVpcmVk
IHN0ZXBzIG9uIGRldmljZQ0KPj4gICAgIGluaXQvYXNzaWduOiBhZGQgcnVuX3ZwY2lfaW5pdCBo
ZWxwZXINCj4+IFNpbmNlIHYyOg0KPj4gLSBkZWZpbmUgQ09ORklHX0hBU19WUENJX0dVRVNUX1NV
UFBPUlQgc28gZGVhZCBjb2RlIGlzIG5vdCBjb21waWxlZA0KPj4gICAgZm9yIHg4Ng0KPj4gU2lu
Y2UgdjE6DQo+PiAgIC0gY29uc3RpZnkgc3RydWN0IHBjaV9kZXYgd2hlcmUgcG9zc2libGUNCj4+
ICAgLSBkbyBub3Qgb3BlbiBjb2RlIGlzX3N5c3RlbV9kb21haW4oKQ0KPj4gICAtIGV4dGVuZGVk
IHRoZSBjb21taXQgbWVzc2FnZQ0KPj4gLS0tDQo+PiAgIHhlbi9kcml2ZXJzL0tjb25maWcgICAg
ICAgICAgIHwgIDQgKysrDQo+PiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgIDYg
KysrKw0KPj4gICB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgICAgICB8IDU3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tDQo+PiAgIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAg
ICAgIHwgMTYgKysrKysrKysrKw0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL0tjb25m
aWcgYi94ZW4vZHJpdmVycy9LY29uZmlnDQo+PiBpbmRleCBkYjk0MzkzZjQ3YTYuLjc4MDQ5MGNm
OGUzOSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL0tjb25maWcNCj4+ICsrKyBiL3hlbi9k
cml2ZXJzL0tjb25maWcNCj4+IEBAIC0xNSw0ICsxNSw4IEBAIHNvdXJjZSAiZHJpdmVycy92aWRl
by9LY29uZmlnIg0KPj4gICBjb25maWcgSEFTX1ZQQ0kNCj4+ICAgCWJvb2wNCj4+ICAgDQo+PiAr
Y29uZmlnIEhBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICsJYm9vbA0KPj4gKwlkZXBlbmRzIG9u
IEhBU19WUENJDQo+PiArDQo+PiAgIGVuZG1lbnUNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBp
bmRleCBhOWQzMTI5M2FjMDkuLjUyOWE0ZjUwYWE4MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYw0KPj4gQEAgLTg3Myw2ICs4NzMsMTAgQEAgc3RhdGljIGludCBkZWFzc2lnbl9kZXZpY2Uo
c3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3Qgc2VnLCB1aW50OF90IGJ1cywNCj4+ICAgICAgIGlm
ICggcmV0ICkNCj4+ICAgICAgICAgICBnb3RvIG91dDsNCj4+ICAgDQo+PiArICAgIHJldCA9IHZw
Y2lfZGVhc3NpZ25fZGV2aWNlKGQsIHBkZXYpOw0KPj4gKyAgICBpZiAoIHJldCApDQo+PiArICAg
ICAgICBnb3RvIG91dDsNCj4+ICsNCj4+ICAgICAgIGlmICggcGRldi0+ZG9tYWluID09IGhhcmR3
YXJlX2RvbWFpbiAgKQ0KPj4gICAgICAgICAgIHBkZXYtPnF1YXJhbnRpbmUgPSBmYWxzZTsNCj4+
ICAgDQo+PiBAQCAtMTQ0NSw2ICsxNDQ5LDggQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0
cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4g
ICAgICAgICAgIHJjID0gaGQtPnBsYXRmb3JtX29wcy0+YXNzaWduX2RldmljZShkLCBkZXZmbiwg
cGNpX3RvX2RldihwZGV2KSwgZmxhZyk7DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gKyAgICByYyA9
IHZwY2lfYXNzaWduX2RldmljZShkLCBwZGV2KTsNCj4+ICsNCj4+ICAgIGRvbmU6DQo+PiAgICAg
ICBpZiAoIHJjICkNCj4+ICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORyAiJXBkOiBh
c3NpZ24gKCVwcCkgZmFpbGVkICglZClcbiIsDQo+IERvbid0IHlvdSBuZWVkIHRvIGNhbGwgdnBj
aV9kZWFzc2lnbl9kZXZpY2UoKSBoaWdoZXIgdXAgaW4gdGhpcw0KPiBmdW5jdGlvbiBmb3IgdGhl
IHByaW9yIG93bmVyIG9mIHRoZSBkZXZpY2U/DQpZZXMsIHRoaXMgZG9lcyBtYWtlIG1vcmUgc2Vu
c2UsIGUuZy4gdnBjaV9kZWFzc2lnbl9kZXZpY2UocGRldi0+ZG9tYWluLCBwZGV2KQ0KYmVmb3Jl
IGFzc2lnbmluZyBwZGV2IHRvIGFuIElPTU1VIHdoaWNoIHVwZGF0ZXMgcGRldi0+ZG9tYWluIGFu
ZCB0aGVuLi4uDQo+DQo+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+
PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+
PiAraW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldikNCj4+ICt7DQo+PiArICAgIGludCByYzsNCj4+ICsNCj4+ICsgICAgLyogSXQgb25s
eSBtYWtlcyBzZW5zZSB0byBhc3NpZ24gZm9yIGh3ZG9tIG9yIGd1ZXN0IGRvbWFpbi4gKi8NCj4+
ICsgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNfdnBjaShkKSApDQo+PiArICAg
ICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgdnBjaV9yZW1vdmVfZGV2aWNlX2hhbmRsZXJz
KHBkZXYpOw0KPiBUaGlzIHJlbW92ZXMgaGFuZGxlcnMgaW4gZCwgbm90IGluIHRoZSBwcmlvciBv
d25lciBkb21haW4uIElzIHRoaXMNCj4gcmVhbGx5IGludGVuZGVkPyBBbmQgaWYgaXQgcmVhbGx5
IGlzIG1lYW50IHRvIHJlbW92ZSB0aGUgbmV3IGRvbWFpbidzDQo+IGhhbmRsZXJzIChvZiB3aGlj
aCB0aGVyZSBvdWdodCB0byBiZSBub25lKSAtIHdoeSBpcyB0aGlzIG5lY2Vzc2FyeT8NCnRoZSBh
Ym92ZSB3b24ndCBiZSBuZWVkZWQNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

