Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F337576FDD
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 17:29:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368801.600214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjjV-0001Mx-DE; Sat, 16 Jul 2022 15:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368801.600214; Sat, 16 Jul 2022 15:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjjV-0001KP-8V; Sat, 16 Jul 2022 15:29:29 +0000
Received: by outflank-mailman (input) for mailman id 368801;
 Sat, 16 Jul 2022 15:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAeN=XV=epam.com=prvs=9196fa0856=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oCjjT-0001KJ-EF
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 15:29:27 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12c4fac7-051c-11ed-bd2d-47488cf2e6aa;
 Sat, 16 Jul 2022 17:29:26 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26GDSElm022600;
 Sat, 16 Jul 2022 15:29:20 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hbns20pke-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Jul 2022 15:29:20 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM6PR03MB3797.eurprd03.prod.outlook.com (2603:10a6:20b:23::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 16 Jul
 2022 15:29:16 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5438.020; Sat, 16 Jul 2022
 15:29:15 +0000
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
X-Inumbo-ID: 12c4fac7-051c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6hVNrDLpff8Q07sx0AuaER5zQBZIqI+7N7d4TEVrrq8xPHRUtqCb5yZHsxMG9jfT64MF5SGVxfwKJqLi917MK5e5zGTdo1wJAkKZvrr6QlmLV9z4/7t8AF0qEH2fdI7Striri18T1pfEjK2BKLE9kQmzQNna199z9UabzYopB/2z+o9lqYpBIJk9kWFwToL+GNgMJPvJV6kv+wIPkzBj/tNiU6LnPfk5o5psJctiE2Y5hikbngjdC9hpjkM4iqppC8oMF1e5FBbM4icQgPH2D/2tsPvMw1XCVTXbhT/3IsTvxbcyIvarhVS1Iy/pCUtulzpJMcLIyyfpOqrkWWd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xshPb5lPc/HAxThS2vp8lPrOIubeqM3CHtihU+Px9Q=;
 b=X49xPLm6PYUThVTTHb/IOPpr106mu89JBMO9qjKfKsAkMx6zCMB571V42idLGhfiaj8wz/J3U5dcGua6MQ7EcRnHs18RtcJ0+BNG9DAuJLIaBLHa/ky/2SgX5Iwf78H/hqWHFu8UedgGDPES6OrMcjAya9UmGo4+7a5yvb3vfagfo0Rl6BF/od2/5mvB1TiyFPlUXzMc7E0ut9Vsa9ReMqderneUMQGeVY/47+xuPvtBKeAltfZBtanaPYFHLRB3pQPlLFb5R6HZMxRL/5kVqtWiSFJlMWSsdpeDIf3UUW8LP9cOa/G2Ss7HUMaq7XQ+dPmoGDv6qsaJIt10TI/IpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xshPb5lPc/HAxThS2vp8lPrOIubeqM3CHtihU+Px9Q=;
 b=lxWgXSkBFvKZevoUsaq67M6JzeNS8wuAQOFPHRLeoSna8IYrxUHm0mp9L2pYuTe9eScj/h7W8g6aKz1h9wF9CKrra+Q4n61jqWLy3RYLWMYd7kET16ffmeQWAkdVAIBCZVyf5+wW24C36VZRlx+Ja6RlCPDvU/14f9EB0Zlpwv4MXYO5BnXea+MLO+uvCay6tNoR6LxLAUhyLiYS12vAuIMswNTLjiUafQANN2OZzs/2AS04xAAO+qREOpBYLIeAH90+lcdoyWf2TL/JXkOQ794AcUjHCbkxTp+bH/0PFziQNKLKL4wFoytL6ufgsYq+5kiKa9zgS7CQi5Wx/votZA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Julien Grall <jgrall@amazon.com>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V7 1/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
Thread-Topic: [PATCH V7 1/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
Thread-Index: AQHYmSRZ9DGrhwhfOkObghuNT/IAia2BGPyAgAAGWIA=
Date: Sat, 16 Jul 2022 15:29:15 +0000
Message-ID: <7960855a-5135-00d9-fff8-b571d7be03d1@epam.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <fea296b1-76e4-f8f1-77fc-274309b54a38@xen.org>
In-Reply-To: <fea296b1-76e4-f8f1-77fc-274309b54a38@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fdd8380-bbe2-4f7f-772f-08da673ff182
x-ms-traffictypediagnostic: AM6PR03MB3797:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7cjKkk3whdmTONZmUP1AJjnjVRrhAoA1dPIWsrYI/6DspPfRojwAh0Y+ArEiW6QfWsRoWbbDIP0QQGxGeUhAQa6WCY0n8SAjiBlaQeByo4jpsvhQzwIqvhR0JbIEWbsG0VM293Clz1YJxL3hg5998O8yhXqtqb9sDem2FOtUf4vHXZctVXrmDgGiSqLGECCtjfNU/R7b8uI7CBs4ilw59SVze8VgnCGQu4YSaSmEjNi60a7rYaIvJRhxtTp4gbzK7JJz4m1EZh+GnrjbUkmlTaeUC+iGlkhGKrwiPr40vdyyoRHht+XReSTlhuyN8aDnNfC0Ywl4+oBlPgMjtU2XQP0waN2146Wda8vYiasgcy6+h45N4liJyQ2JHXoOQZxjsYZwj3w3+IiOTvbG61qmaz5/qQQhq22DETkTlilYH+jTXMvDqUNMd45cf2rTJuQDx94dg51zkkPkn0Vlo+qAzVOpxMzDeK+2q7UDVLH+KYCUoptruGuDhroDHsbUg0n/Xk6Sxuj2s3U9KwqMeefYldFxGPopX2fm+mbXPNyyT+C4Hg+Uquaqkz2oVpgujCaMESDTwfbfYFRhjTGy8c/oyYs+D+rtuBkuHOKjwdCHPLlEIrtlujB9lWpdDN0SxrwGczpYr4FDqvxkzuTUdhz2dzLxquSjQdNnhcq9AdgleX7fjkspVS5NFeflNSnyK74J0e1a/hre+cOpTdOkdeJ9ks7DBQ7ULAhogF6DA2/zhbEr46CaC24UbfkLjgrXCCHjelKna7uGV23rv+a3w50eYxGtLnv5Xn6OCVGDuGWK9ygC8yFrvEERooy0QiiNcu8+TaO7SYq2HpTIKcKRNndGfTjhAmbC/e3TksTf1qLwQlUB98ZvbfXWEATCth+76lFb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(71200400001)(122000001)(316002)(38070700005)(86362001)(5660300002)(31696002)(38100700002)(110136005)(2906002)(76116006)(54906003)(66946007)(83380400001)(4326008)(2616005)(66446008)(66556008)(64756008)(66476007)(478600001)(8676002)(186003)(8936002)(6512007)(6486002)(55236004)(6506007)(53546011)(91956017)(26005)(41300700001)(36756003)(966005)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T2d1cVVKUFNZUC90cVBYaXRWQ3BHdDU2a3ZIdDUzeTNmREdMWXhDNUVXQmpN?=
 =?utf-8?B?M1htU09oNlREYVcwZzNuWE8zNEovOEt3a3RiVG1zTUhVL242N1dENmdHQVoy?=
 =?utf-8?B?OEQ1MjE3VUZOcUV3TWd0Rjc2eFM3U296TzNwZXgvN1JUeUNsQXdwb1o1Vkln?=
 =?utf-8?B?WExyUThyNmF5TDZaeWRVTVhUaVVFYnQxeTg2T2VWTmxPZjhvVlBJNnFaK1VG?=
 =?utf-8?B?QlpwYjlya2Z3bTMwTVducTBNQitJTWc5cE9yc2ZOdW1JakhMYzVCWWpObXB0?=
 =?utf-8?B?cklFZU1KbVlWcTNIdUk3MGhWZ3pjUWk5T1RiaGExVC80ZW04aDFkdUhOakVP?=
 =?utf-8?B?NTVjS0lZTWs3bnF1NGppc09zUDF2WDdJUFpkL3ZlQ1J4QjB0aHA2a0NUak5E?=
 =?utf-8?B?ME01MzA2SUE2SnE5MFlEbDFDMGF0WjJPNnBObDRQd2Rla1hNbVdseW5MUWZy?=
 =?utf-8?B?OE12NmhlNVJJLys2WDFPZWRVK0hsa3VDd1pQaDdKbnNId3ZOdmtlalArbFZY?=
 =?utf-8?B?ME02TjNwRXV3SEI2YjRyVlRjamlUMjZoWjVTRm4rOXByTjJqWUd6WmQ1QXlt?=
 =?utf-8?B?c0JXUzdTN0JLR1lPQ3dPZEkraG9IVFFXaFhxWFN0RXowWlFLb0pGa0puaVpm?=
 =?utf-8?B?K2tScE5SdFVmTDF0U0N6Zy9YbWt1N1JPSGFOcmFHVVdnT3c1amJzazE1NlFM?=
 =?utf-8?B?Y29WTEdLYzJTc2NRTVFHU0RwdllYaWNXL3ZkdE44UGY5OWtndWhBNGJmbzN1?=
 =?utf-8?B?MmN2aHhJdUoxcUFPUGc0TFdmRkE2c2phcjNVekxhdUFERm1RVi9GTHFUS2x2?=
 =?utf-8?B?ZFRubU03TEhiZUhqVGR2WmFGSnY2UXlFcm05YWNiZ1VYc0ZhNmRqcGFKc3c2?=
 =?utf-8?B?MXlFUUtuaEs2Q3hOalovbFFGMlJaN1VHMmN1KzJSZGtZc3Niem1IRzdCdzFL?=
 =?utf-8?B?dlgzOStvWjNIQXVvcDFkUk92Q2U2L3JIc0dsT3lScXk2NmNUUzR5Q0wvc25I?=
 =?utf-8?B?blovVk1mcldFdXgzY2NtZlF5UjJxdCtzQXVUc0dQY2YxelF3TlRqQm5rczYy?=
 =?utf-8?B?MWJlNTJyYjM5UDVJa0dVRFRSbGJ4dnpZdHVoKzRBKzdUbDFja012bHJ5blVp?=
 =?utf-8?B?OERSaTBaQldRUnRvdGpYbUNBL2tMVHcxbll2VDlraHkvVjNYSFcvUlVwWU9y?=
 =?utf-8?B?dW1hTnd3N0JUYXdKYTdoMG1vRzVpRXE2NXZPYnJzWVFucHZqWFJpRW5iaWtC?=
 =?utf-8?B?TlBhUlBjOEJ5VkpnZGVBZXdLaUFnMXYxeHA3ZHlUeDcycDU0MTQyZ3YzejJn?=
 =?utf-8?B?Q1FwNm9sVWw4NUkrckNWdTI3MTlnaktPSWVUaTdCclZsQWJwd3M5NE0rNDBC?=
 =?utf-8?B?R2RLWTZuc0FCNm9wckJoZEpZbjhvTlRvN3pUUWhGVTJqcndPcW5zTXJDZGVW?=
 =?utf-8?B?ZUtrQ0VzQk92UFpKK1E3VVk4cGFkd1pIQ0xIenV0THRabjhOMStON1RtYkNF?=
 =?utf-8?B?WU9mVDViK0R1eTJhaStXWkpCL3duMDMwL0hZZG5JMk1FdTY3MlRXcnBRcW5X?=
 =?utf-8?B?dkVKeEQxcmdUUnZYWlhBNzcvUUJnTFdZOWtyV2RLdDZyNjFFV0p4eTZRdEdU?=
 =?utf-8?B?eVNpemVBL2JwUUIxaTFwOG9DMmpwVGZnUEN1UTZEZDY3ZGFXTXZ4ZWNva0NV?=
 =?utf-8?B?Tk5pWmlJU0lmY0kvNkNhbVdMS0E2ZExOR1E4TUlhZEZ3Q05PWUwzcmFWTG5r?=
 =?utf-8?B?cXYzTFpFbWJJN29QQ0pIQy9IVnRidm45TG1neDhtc1h3YW4ya2tnM3lGcHVO?=
 =?utf-8?B?blZ4VzVvL2VMeWl6cnNWcG9WRDBGeVoxWGREUVZ4NEpKeHV4T1dnM00rQ2ND?=
 =?utf-8?B?NTFzNnpRbDFUM0RVSi90clhFN3h2dE11QnpKUE5yMUl6d2ozaXFaa3NKODMx?=
 =?utf-8?B?SWZFUkcvSVZrdUJXMGpOQkZtcXRaaWdydkhYV3hQcHZwcjkxdFI0YnhuOGtT?=
 =?utf-8?B?S1IvNU9DMG9LamRlNFlaV3VNcVlWLzlPZXRZdDVKY09weTBQSm5mZ281OUxP?=
 =?utf-8?B?cDRmSHpoTmVuVTBhYVpGcHJFbVNIQWU1MDk0RWhsM3dKa0ZERmN3eFpTY2lt?=
 =?utf-8?B?OUFNazd6NkpPVGpTSU5GbmlzUU1LN3pzbUIyNEVuMTRlVGRZbVpvS2puL2hu?=
 =?utf-8?Q?lwkxMrdZvdK7172GPsJZeaE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66C355C7875E004A804D4DC0720F8214@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdd8380-bbe2-4f7f-772f-08da673ff182
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 15:29:15.8650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQmBkNEnuoXeJnTfSGmwkMalEP5LSRdM+ar6PSVlKC5Tmy6KnyWqxR5QxpQ1oRM5iu3v/IHNm4j1AAZKP3lUVu3B2JxmnHiAH2UoQJpiJYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3797
X-Proofpoint-GUID: A-C4dze16qQ3_7WNkCd6ECjd0g42JSk1
X-Proofpoint-ORIG-GUID: A-C4dze16qQ3_7WNkCd6ECjd0g42JSk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-16_11,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207160066

DQpPbiAxNi4wNy4yMiAxODowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBPbGVrc2FuZHIs
DQoNCg0KSGVsbG8gSnVsaWVuDQoNCg0KDQo+DQo+IEluIHRoZSBmdXR1cmUsIHBsZWFzZSBwcm92
aWRlIGEgY292ZXIgbGV0dGVyIChldmVuIGlmIGl0IGlzIHNob3J0KSANCj4gd2hlbiB5b3UgYnVu
ZGxlIG11bHRpcGxlIHBhdGNoZXMuIFRoaXMgaXMgdXNlZnVsIHRvIG1ha2UgZ2VuZXJpYyANCj4g
Y29tbWVudHMgYW5kIGhlbHAgdGhyZWFkaW5nIGluIGUtbWFpbCBjbGllbnQgKGVhY2ggcGF0Y2gg
d291bGQgYmUgYSANCj4gc3VidGhyZWFkIG9mIDAgcmF0aGVyIHRoYW4gMSkuDQoNCg0KWWVzLCB3
aWxsIGRvLg0KDQoNCj4NCj4gT24gMTYvMDcvMjAyMiAxNTo1NiwgT2xla3NhbmRyIFR5c2hjaGVu
a28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hj
aGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQm9ycm93IHRoZSB4ODYncyBjaGVjayBmcm9tIHAybV9y
ZW1vdmVfcGFnZSgpIHdoaWNoIHdhcyBhZGRlZA0KPj4gYnkgdGhlIGZvbGxvd2luZyBjb21taXQ6
IGM2NWVhMTZkYmNhZmJlNGZlMjE2OTNiMThmOGMyYTNjNWQxNDYwMGUNCj4+ICJ4ODYvcDJtOiBk
b24ndCBhc3NlcnQgdGhhdCB0aGUgcGFzc2VkIGluIE1GTiBtYXRjaGVzIGZvciBhIHJlbW92ZSIN
Cj4+IGFuZCBhZGp1c3QgaXQgdG8gdGhlIEFybSBjb2RlIGJhc2UuDQo+Pg0KPj4gQmFzaWNhbGx5
LCB0aGlzIGNoZWNrIHdpbGwgYmUgc3RyaWN0bHkgbmVlZGVkIGZvciB0aGUgeGVuaGVhcCBwYWdl
cw0KPj4gYWZ0ZXIgYXBwbHlpbmcgYSBzdWJzZXF1ZW50IGNvbW1pdCB3aGljaCB3aWxsIGludHJv
ZHVjZSB4ZW5oZWFwIGJhc2VkDQo+PiBNMlAgYXBwcm9hY2ggb24gQXJtLiBCdXQsIGl0IHdpbGwg
YmUgYSBnb29kIG9wcG9ydHVuaXR5IHRvIGhhcmRlbg0KPj4gdGhlIFAyTSBjb2RlIGZvciAqZXZl
cnkqIFJBTSBwYWdlcyBzaW5jZSBpdCBpcyBwb3NzaWJsZSB0byByZW1vdmUNCj4+IGFueSBHRk4g
LSBNRk4gbWFwcGluZyBjdXJyZW50bHkgb24gQXJtIChldmVuIHdpdGggdGhlIHdyb25nIGhlbHBl
cnMpLg0KPj4NCj4+IFN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlz
aGNoZW5rb0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gWW91IGNhbiBmaW5kIHRoZSBjb3JyZXNwb25k
aW5nIGRpc2N1c3Npb24gYXQ6DQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzgyZDhiZmUwLWNiNDYtZDMwMy02YTYwLTIzMjRk
ZDc2YTFmN0B4ZW4ub3JnL19fOyEhR0ZfMjlkYmNRSVVCUEEhM2EydS1YTDROdkF6U01mejcyTEFS
cmRXVkZ2cTJJbjVacFVkeFAyY1N0N2JNOFBnVjdQX1pjbFpHMlItckU5UGNvc1VIeXFzS1JOZlZH
MlRpTTlUbGckIA0KPj4gW2xvcmVbLl1rZXJuZWxbLl1vcmddDQo+PiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzE2NTIyOTQ4NDUt
MTM5ODAtMi1naXQtc2VuZC1lbWFpbC1vbGVrc3R5c2hAZ21haWwuY29tL19fOyEhR0ZfMjlkYmNR
SVVCUEEhM2EydS1YTDROdkF6U01mejcyTEFScmRXVkZ2cTJJbjVacFVkeFAyY1N0N2JNOFBnVjdQ
X1pjbFpHMlItckU5UGNvc1VIeXFzS1JOZlZHMGtnN0laU0EkIA0KPj4gW2xvcmVbLl1rZXJuZWxb
Ll1vcmddDQo+Pg0KPj4gQ2hhbmdlcyBWNiAtPiBWNzoNCj4+IMKgwqDCoCAtIG1ha2UgdGhpcyBj
b21taXQgdG8gYmUgdGhlIGZpcnN0DQo+PiDCoMKgwqAgLSB1cGRhdGUgY29tbWl0IGRlc2NyaXB0
aW9uIGFuZCBhZGQgYSBjb21tZW50IGluIGNvZGUNCj4+IC0tLQ0KPj4gwqAgeGVuL2FyY2gvYXJt
L3AybS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDI4IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jDQo+PiBpbmRleCBkMDBjMmU0NjJhLi4yYTBkMzgz
ZGY0IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jDQo+PiArKysgYi94ZW4vYXJj
aC9hcm0vcDJtLmMNCj4+IEBAIC0xMzA4LDExICsxMzA4LDM5IEBAIHN0YXRpYyBpbmxpbmUgaW50
IHAybV9yZW1vdmVfbWFwcGluZyhzdHJ1Y3QgDQo+PiBkb21haW4gKmQsDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG1mbl90IG1mbikNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHAybV9k
b21haW4gKnAybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCj4+ICvCoMKgwqAgdW5zaWduZWQgbG9u
ZyBpOw0KPj4gwqDCoMKgwqDCoCBpbnQgcmM7DQo+PiDCoCDCoMKgwqDCoMKgIHAybV93cml0ZV9s
b2NrKHAybSk7DQo+PiArwqDCoMKgIC8qDQo+PiArwqDCoMKgwqAgKiBCZWZvcmUgcmVtb3Zpbmcg
dGhlIEdGTiAtIE1GTiBtYXBwaW5nIGZvciBhbnkgUkFNIHBhZ2VzIG1ha2UgDQo+PiBzdXJlDQo+
PiArwqDCoMKgwqAgKiB0aGF0IHRoZXJlIGlzIG5vIGRpZmZlcmVuY2UgYmV0d2VlbiB3aGF0IGlz
IGFscmVhZHkgbWFwcGVkIA0KPj4gYW5kIHdoYXQNCj4+ICvCoMKgwqDCoCAqIGlzIHJlcXVlc3Rl
ZCB0byBiZSB1bm1hcHBlZC4NCj4+ICvCoMKgwqDCoCAqIElmIHRoZXkgZG9uJ3QgbWF0Y2ggYmFp
bCBvdXQgZWFybHkuIEZvciBpbnN0YW5jZSwgdGhpcyBjb3VsZCANCj4+IGhhcHBlbg0KPj4gK8Kg
wqDCoMKgICogaWYgdHdvIENQVXMgYXJlIHJlcXVlc3RpbmcgdG8gdW5tYXAgdGhlIHNhbWUgUDJN
IGNvbmN1cnJlbnRseS4NCj4NCj4gTWlzc2luZyB3b3JkOiBQMk0gKmVudHJ5Kg0KDQpZZXMuIE1h
eSBJIHBsZWFzZSBhc2ssIGNvdWxkIHRoaXMgYmUgZG9uZSBvbiB0aGUgY29tbWl0IGlmIHRoaXMg
YXBwZWFycyANCnRvIGJlIHRoZSBsYXN0IHZlcnNpb24/DQoNCg0KPg0KPiBPdGhlciB0aGFuIHRo
YXQ6DQo+DQo+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0K
DQoNClRoYW5rIHlvdSENCg0KDQo+DQo+DQo+IENoZWVycywNCj4NCi0tIA0KUmVnYXJkcywNCg0K
T2xla3NhbmRyIFR5c2hjaGVua28NCg==

