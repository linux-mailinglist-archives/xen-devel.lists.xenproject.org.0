Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB939456FC8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:38:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227941.394376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo45j-0006v1-4y; Fri, 19 Nov 2021 13:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227941.394376; Fri, 19 Nov 2021 13:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo45j-0006sX-1u; Fri, 19 Nov 2021 13:38:11 +0000
Received: by outflank-mailman (input) for mailman id 227941;
 Fri, 19 Nov 2021 13:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo45h-0006sR-PN
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:38:09 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edaf4934-493d-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 14:38:08 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJBYCsm005728;
 Fri, 19 Nov 2021 13:38:05 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ceb5k8fc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:38:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2831.eurprd03.prod.outlook.com (2603:10a6:800:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:38:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:38:02 +0000
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
X-Inumbo-ID: edaf4934-493d-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en1dSDzQS/EGrJgjVWJ2BLZSVCHPQlA1WHYaL7Z2dCQDhvV4iggSZInnrYFc3mfqneis17eaFNRCiuGaivrSVhBJklB8kNBiYaLJA86Se//TFVswMmLveIaMuN1e9N1seF6zJsPYKohc90urFPEHmUnyOxYn7u4q1/dnRvjKsIYSEcVhE6g+v5lgNB1Qbpm3wD7cXzIpMJKKwSuphCKM0ozvWmG5Skxv6ZYqVL3P8hNzqPNwGVEMZyhhgG5VFtHbSIeve+v9TU5w+3QeLfmUr8g5X8VLnv0o/CqQIi4SewPQ0XJ37E0WAQxFegBh3snpZ1LgoLEkxIPcdLdNcVoFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAtGxGIi003IPewgks8a5Qh5wNzc/sUGLNCDeZgVNPc=;
 b=nMLlPbbp6edf+F5svfV4GxjhSTLGw09r4w6gRKRAnD5ROuSimkW8BJT4Cm0z0W5XAGN54xe1v+KLkVZKu/JMQNpFzMA2o/fO26rgN2TyJ11Ty7IzEetewRazRiA8TGr+EDhBlBMgyI5CSF6Xiv+cc/bMlUiAGOK0aYUe4+Rk4zvSRwaNZgCIug3TKfco9NkhH/1KV1YkooGydnUV6us7e7SnN2galPLx5H53UK1nvJ/dYcXz6eZzs1jQy8hxPi4cjtqEbUmOmPrfMgJ2pK/EyCDAE9dAiAP5p+sSKJ9TKMqAhDT1yPoGTm+BDgczyTfr/S3x3GasP1Q7qV+z6sViJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAtGxGIi003IPewgks8a5Qh5wNzc/sUGLNCDeZgVNPc=;
 b=mOo2ubC1slGAX3yWTl8jcjXrOA/m5bKHbmqVom+cm8gqJulRxI4Wm9buPWjrt6CdPY08TtHJbPvSggKiAdBnDLiMGhPQPt04a8EidV51VncTWNvTr9KQ9FHQGFtiw4X6gMzR+XTxsvzSdUU4qb3jAzb96Yx/cEfKnBeY7dRsRl/14zgFfcTevOeOmv9q1L+NBK0MFrjsRC3+IFvvCZsjbgKtxSeEzbGALwDz4YhWgBLuDIJDBWiDjRkhpabNYqmsIPQutVFRFQfl2BdS3utdymtKq20pG08gn52shBMPmeJSQieUR2GedRD8/5HpYPxi5aZCCa/FsBpw9iY04dzUDw==
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
Thread-Index: 
 AQHX0hJLwt+wJ2t1lka5jlbMIq7ZAqwK13MAgAACAoCAAAkUAIAAAXCAgAAEdQCAAAOYAIAAArCAgAACfIA=
Date: Fri, 19 Nov 2021 13:38:01 +0000
Message-ID: <d0455f1c-0789-3548-5499-4a1dbd477225@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
 <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
 <76e929f9-2df1-951f-55bf-58caba80750c@suse.com>
 <ea3e52f3-c844-d2a7-2f45-9d4e1bd04d5a@epam.com>
 <a60f0837-3a01-4d87-7816-ae4a0a6a8413@suse.com>
 <3cca175c-5b33-2c50-bf4d-34bbe844ab11@epam.com>
 <97515b30-ea6e-e497-dfe8-a38d8a28b05d@suse.com>
In-Reply-To: <97515b30-ea6e-e497-dfe8-a38d8a28b05d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01393a27-803a-4ba7-2d94-08d9ab61cedb
x-ms-traffictypediagnostic: VI1PR0302MB2831:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2831F254789A5CD0C212D98CE79C9@VI1PR0302MB2831.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2LSCLL0+KktEnHbQO5qnIMsNrBswbfm/kRQdcgrqXqdQIOe27+91/joZpMQqrJajLIqU/3vHa/7Ein8cRJfdr/ivug1t0l8J0tHc5PtYGU867p3oDhhKN0ngxuSf5ko3nOrPPbesdZEYlVyG2RBjfFd7LoR+q0vqSGEeWjLpJk/i+Vwe1dUxN6pmic0WO91MYUVD4oNxYtBgJ4MGUwR2tuLeR4omNiOk9pz+qlxaCuehmN7mF8dHUIHhaw+eM2Zskl4hXnAKXciK5Kh72g1Qv7cmvCKX3AHEnuAuaIN5wo6BoSIsTWv83BUH7ps3X3WuA8AOiLlWzFlU8bSdRkJA01e5joctb3vaYOR3FCZEQkTqWLWnYNOIRlZVpfvmiuJlH8bUVQ1VMLS0QWjj40YYlGcl+neZDA1GsMJ3xZ7+7srld+5K13FObk/oeauaSqp5vlG9cpuyiOfimKjJrN7qkIL/U2XNFDGhPZsXpSUhlTtJLjjk3k6MlZVmjftq/y3eJKjSDvUMVT8AnnUYdbrVl8PsjncjJrwqLR+47unUfI9zEYUyHE4GjGiWNLprtU4KkqhVzmnXcE9OPnCY7fLE6ZyIuM0qg8m1VDnM82iRVzKuWVkt3dOo8NlEOQ872coi85nxX+Oc7ccESWikY3/B4VVKZQybOkDn3ldMKKx1Lz84gL0CZxl+/TgIueXHeXUs7mET05HKiOxCUAVdkpV03meOSkTxTetqbJu5I5o+CCRgl7x8Rw7oUN4FPiU2f8rE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(316002)(2906002)(6486002)(71200400001)(66556008)(91956017)(66476007)(54906003)(31696002)(86362001)(6506007)(53546011)(31686004)(38100700002)(64756008)(26005)(6916009)(4326008)(5660300002)(8676002)(186003)(76116006)(122000001)(36756003)(66446008)(6512007)(2616005)(8936002)(7416002)(508600001)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RmYwWnJycFRPWTFLMzJzVWhQTWNNRlNDNHpuNU1HWEpsT0pEclVmdFdDY1dv?=
 =?utf-8?B?U2J1VG03ejRqMGlRcUlSWHVoL0UwMGYzT2NxRmxkMUZiSkJqUWFQTXlvQWF5?=
 =?utf-8?B?Uis1bTl2cTlXZWRsdTNrcUovdm1sMjd6clFFU1dpa2NnOEt2dHR6NmxINjJK?=
 =?utf-8?B?ZXBIMjRNT1k5bHpzY29UTStHYXk1SENlSmx4c2ZLTmF2a3RhUTVLMXlZeEpB?=
 =?utf-8?B?QTBjMElFRFFaMmUxT3dSZVR5K2YrQ2hxQWVwSTVDSm96aXdFK0dCcm41THJP?=
 =?utf-8?B?WHFRMXIrdmJtM1o2Qzg2SEFod3ZiQlVzRWRPMnd2Z2grRmFqcjlHY0RHSzg2?=
 =?utf-8?B?UU9UMEZPK2JDakVuUWliV1dxbkYycFBlamh6Ty9RVUdLRUdFZ2VtY0VneWZj?=
 =?utf-8?B?TldjN1dEaHlLcDJhM2l6Y3JEUTlRYXVpWGp0YmFCVUpwWEQ1L3hMaTJJbGhV?=
 =?utf-8?B?eGdMd083TUlNL0NIdGJ5MElIR3Y2REZqOXlyMkJ6dThtdkRBb1dxeGQ2a1RB?=
 =?utf-8?B?ZE1xQ3F3aHN5OURpWjRyK3VHUnVEaXEyWnJoV2xJSHVDTUhObDJmR2U4TytP?=
 =?utf-8?B?cmo3TzQ5SG1TMndjL2JkNlI4ZVJLL3Z3bkwxWkpJWkJsanhkMGs4UkRDaGFW?=
 =?utf-8?B?cW1kMi84aEM5T0tRcDg0ZnEyQ1RHQnZiSmxlR3J5Y08yRnBzejBCcWZaZGFV?=
 =?utf-8?B?L1BWS1BYcGdvOEhYU2JCcENtSlFXc0lSeXJUQVp2TlVSTDd3UWU3a0Y1WXJm?=
 =?utf-8?B?cUZ4VXUrMkE0dFJOVzBWZGN3b2FTaW5OVmRxOE4wTCtIUDNPWHVUaEpyb3pk?=
 =?utf-8?B?ZWR1ZWdRV0RaWTg2ZUt0MitoNFJNUENBM3dHU0M0UjRKemM3cnZRQWVkT1Zw?=
 =?utf-8?B?cGs5NlF6ZmF4TkRJR1Q0azBFVHNicUNyMXF1amZoaEhFZCs4M040ZUVQbk9r?=
 =?utf-8?B?NGRBeHo0bjNOVFd3YWVCVVlRYkN1VzEzNnpmcFp4ZVJWTlB4SXpKamdxRjlN?=
 =?utf-8?B?bkNoQWpUdWVMTHd2eHlINkpqbkJ6VGhQbTIrN0gvbXlYMFMwakRaalFCUWFn?=
 =?utf-8?B?K2Yrc0tnblZ3Y3ZkK3NhRzQrcGJSV1NaMDRDMjBIWkNNcEVZenRDVTRCQWFs?=
 =?utf-8?B?bGVibVFtbGNVaXlyaEV0KzQ4aFBNcllaVWVjWU5BTnRJQ3JBVGVMT21YK0Ey?=
 =?utf-8?B?SEg5Ykcrd3lhVjBmUk1WMTBtNloyWk00WVpqK3QyOU5jby85LzN3SFBSWHEz?=
 =?utf-8?B?Y3ZsMzR1TVo0dVJDb1ZHRTE0VStzYzNEYzJnVEtVZzBSdVRlTmJWV0xYRlJX?=
 =?utf-8?B?Q2dEYk9Ga1R4ZkFJSS9hdTdab0NRVldyQVBFRzZiNXRZQmpmQzJ3V0MvVmlE?=
 =?utf-8?B?VWw3K0lxRkJUblF3UjhITXVEc0F6Q3BoOGI2TzNLMVBwUmlEYy9peFlBRVl5?=
 =?utf-8?B?NjNrTFRIMVRSeFo5Qk8ySzQ5WUpTUnh2ZEtNNzBtM2pFT21YcTF0bHBTVU5t?=
 =?utf-8?B?U01EemJoaHd0QVYvN25QMjI3emxNQVduZytEdXZWdGF0K01wTnh2U01TMnJD?=
 =?utf-8?B?T2tMSEtiV252TDRmOXFPMStrZmJ5cGNHV2ZkVGFIdnp6aGdyYzFUTE9wbHIv?=
 =?utf-8?B?cHdaaDBGbWhoMXFhZlV5T0o0cThGdFJnRzFyNURKVis3RnB1Ym9naGs2MjI3?=
 =?utf-8?B?RmNFMC9oWmhWSnZaUDBRQmo0blVaKzcwZU45TE90NjN6Y0RaSWtwRkZRWVlP?=
 =?utf-8?B?QTBEQldXemJkSkcyVWRTRm1HMVdmcFpaSHc1dUk2c3pDVmVtZ0xoNjJXVTBl?=
 =?utf-8?B?MzVVYlZBUENnZWdBaGhlUW1tUFhTZDFBQVZIUlYzVDJ2STZiQ1N6L2p5T1ZE?=
 =?utf-8?B?cHNGVUR3dGx4N0RheDRrL0ZnRTByWmt2T2FzaytuNmtnd29QMUVDU0FXSm5u?=
 =?utf-8?B?dmxlVUw3NWJ1NXdMalV5SDdaTmErNWVlY1gzNkhKNGRBTTZUSGxIMm9mWDFl?=
 =?utf-8?B?S3hkRmhtVjdHR1FTZEduOHo0dlBWeGZJQzU0dXB2aFNEbTF0U2ExbHA0V0hv?=
 =?utf-8?B?ZEFsNjNlUjA2RXg0N0xVTG5DNHRMSHdLM0wybU1OTm96ZzBULzFuMTNTbkQ0?=
 =?utf-8?B?a3RsWWtGYmlyVVZ1UGNNbUxhZ1B0aTFOdnltVWxONEwycVFsQm5iUStScUFO?=
 =?utf-8?B?c0p1L05MS2xmNzRYcG9aMnhTbVAzTGVqYzlrdlJuK3ZYWFk1amRzV0t1K3I0?=
 =?utf-8?B?bjVSLzc2cTl2SWMrWHloTmdZSy9JcHRwTENuWU16Q1Y3ajJJQ2R2WUFXMXJR?=
 =?utf-8?B?NjRxZ0pVaDlrT2Z5S29xOSs1SUFMVlg5TU5KRlRjakdUYW5neFFpQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF06333B8F425D4AB2DD9E6A0072FD83@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01393a27-803a-4ba7-2d94-08d9ab61cedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 13:38:01.8650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H5UwAq2To1y2qADlLv1XJDYwq5/t0qRiID2HBTRm+VBHxzLnFGOW7gMYYCnQg4I7oOL1GHAPrJMmenKxvP4Pe4puNLb5UKXfwno2Bx7cAKRdONrdMeKYjpEHSN5UcvhR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2831
X-Proofpoint-GUID: 8D9RgH6yaDi9Rr0vx5er4m5nirux0xgx
X-Proofpoint-ORIG-GUID: 8D9RgH6yaDi9Rr0vx5er4m5nirux0xgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190076

DQoNCk9uIDE5LjExLjIxIDE1OjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxNDoxOSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTkuMTEu
MjEgMTU6MDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE5LjExLjIwMjEgMTM6NTAsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxOS4xMS4yMSAxNDo0NSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxOS4xMS4yMDIxIDEzOjEzLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxOS4xMS4yMSAxNDowNSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEluc3RlYWQg
b2YgaGFuZGxpbmcgYSBzaW5nbGUgcmFuZ2Ugc2V0LCB0aGF0IGNvbnRhaW5zIGFsbCB0aGUgbWVt
b3J5DQo+Pj4+Pj4+PiByZWdpb25zIG9mIGFsbCB0aGUgQkFScyBhbmQgUk9NLCBoYXZlIHRoZW0g
cGVyIEJBUi4NCj4+Pj4+Pj4gSWlyYyBSb2dlciBkaWQgaW5kaWNhdGUgYWdyZWVtZW50IHdpdGgg
dGhlIHNwaXR0aW5nLiBNYXkgSSBuZXZlcnRoZWxlc3MNCj4+Pj4+Pj4gYXNrIHRoYXQgZm9yIHBv
c3Rlcml0eSB5b3Ugc2F5IGEgd29yZCBoZXJlIGFib3V0IHRoZSBvdmVyaGVhZCwgdG8gbWFrZQ0K
Pj4+Pj4+PiBjbGVhciB0aGlzIHdhcyBhIGNvbnNjaW91cyBkZWNpc2lvbj8NCj4+Pj4+PiBTdXJl
LCBidXQgY291bGQgeW91IHBsZWFzZSBoZWxwIG1lIHdpdGggdGhhdCBzZW50ZW5jZSB0byBwbGVh
c2UgeW91cg0KPj4+Pj4+IGV5ZT8gSSBtZWFuIHRoYXQgaXQgd2FzIHlvdSBzZWVpbmcgdGhlIG92
ZXJoZWFkIHdoaWxlIEkgd2FzIG5vdCBhcw0KPj4+Pj4+IHRvIGltcGxlbWVudCB0aGUgc2ltaWxh
ciBmdW5jdGlvbmFsaXR5IGFzIHJhbmdlIHNldHMgZG8gSSBzdGlsbCB0aGluayB3ZSdsbA0KPj4+
Pj4+IGR1cGxpY2F0ZSByYW5nZSBzZXRzIGF0IHRoZSBlbmQgb2YgdGhlIGRheS4NCj4+Pj4+ICJO
b3RlIHRoYXQgcmFuZ2VzZXRzIHdlcmUgY2hvc2VuIGhlcmUgZGVzcGl0ZSB0aGVyZSBiZWluZyBv
bmx5IHVwIHRvDQo+Pj4+PiA8Tj4gc2VwYXJhdGUgcmFuZ2VzIGluIGVhY2ggc2V0ICh0eXBpY2Fs
bHkganVzdCAxKS4iIEFsYmVpdCB0aGF0J3MNCj4+Pj4+IHRoZW4gc3RpbGwgbGFja2luZyBhIGp1
c3RpZmljYXRpb24gZm9yIHRoZSBjaG9pY2UuIEVhc2Ugb2YNCj4+Pj4+IGltcGxlbWVudGF0aW9u
Pw0KPj4+PiBJIGd1ZXNzIHllcy4gSSdsbCBwdXQ6DQo+Pj4+DQo+Pj4+ICJOb3RlIHRoYXQgcmFu
Z2VzZXRzIHdlcmUgY2hvc2VuIGhlcmUgZGVzcGl0ZSB0aGVyZSBiZWluZyBvbmx5IHVwIHRvDQo+
Pj4+IDxOPiBzZXBhcmF0ZSByYW5nZXMgaW4gZWFjaCBzZXQgKHR5cGljYWxseSBqdXN0IDEpLiBC
dXQgcmFuZ2VzZXQgcGVyIEJBUg0KPj4+PiB3YXMgY2hvc2VuIGZvciB0aGUgZWFzZSBvZiBpbXBs
ZW1lbnRhdGlvbiBhbmQgZXhpc3RpbmcgY29kZSByZS11c2FiaWxpdHkuIg0KPj4+IEZUQU9EIHBs
ZWFzZSBkb24ndCBmb3JnZXQgdG8gcmVwbGFjZSB0aGUgPE4+IC0gSSB3YXNuJ3Qgc3VyZSBpZiBp
dCB3b3VsZA0KPj4+IGJlIDIgb3IgMy4NCj4+IEl0IHNlZW1zIHdlIGNhbid0IHB1dCB0aGUgZXhh
Y3QgbnVtYmVyIGFzIGl0IGRlcGVuZHMgb24gaG93IG1hbnkgTVNJL01TSS1YDQo+PiBob2xlcyBh
cmUgdGhlcmUgYW5kIHRoYXQgZGVwZW5kcyBvbiBhbiBhcmJpdHJhcnkgZGV2aWNlIHByb3BlcnRp
ZXMuDQo+IFRoZXJlIGFyZW4ndCBhbnkgTVNJIGhvbGVzLCBhbmQgdGhlcmUgY2FuIGJlIGF0IG1v
c3QgMiBNU0ktWCBob2xlcyBpaXJjDQo+IChNU0ktWCB0YWJsZSBhbmQgUEJBKS4gV2hhdCBJIGRv
bid0IHJlY2FsbCBpcyB3aGV0aGVyIHRoZXJlIGFyZQ0KPiBjb25zdHJhaW50cyBvbiB0aGVzZSB0
d28sIGJ1dCBpc3RyIHRoZW0gYmVpbmcgZnVsbHkgaW5kZXBlbmRlbnQuIFRoaXMNCj4gd291bGQg
bWFrZSB0aGUgdXBwZXIgYm91bmQgMyAoYm90aCBpbiBvbmUgQkFSLCBvdGhlciBCQVJzIHRoZW4g
YWxsIHVzaW5nDQo+IGp1c3QgYSBzaW5nbGUgcmFuZ2UpLg0KU28gaWYgdGhleSBhcmUgYm90aCBp
biBhIHNpbmdsZSBCQVIgKHRoaXMgaXMgd2hhdCBJIHByb2JhYmx5IHNhdyB3aGlsZQ0KcnVubmlu
ZyBRRU1VIGZvciBQVkggRG9tMCB0ZXN0cyksIHRoZW4gd2UgbWF5IGhhdmUgdXAgdG8gMyByYW5n
ZQ0Kc2V0cyBwZXIgQkFSIGF0IG1heCwgc28gSSB3aWxsIHVzZSAzIGluc3RlYWQgb2YgTiBpbiBk
ZXNjcmlwdGlvbiBhbmQgd2lsbA0KcHJvYmFibHkgcHV0IHNvbWUgZGVzY3JpcHRpb24gaG93IHdl
IGNhbWUgdXAgd2l0aCBOID09IDMuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91ISENCk9sZWtzYW5k
cg==

