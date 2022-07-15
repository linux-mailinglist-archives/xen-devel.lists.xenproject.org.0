Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC40575DEE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 10:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368005.599183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCH7x-00057j-Ru; Fri, 15 Jul 2022 08:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368005.599183; Fri, 15 Jul 2022 08:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCH7x-00054w-P1; Fri, 15 Jul 2022 08:56:49 +0000
Received: by outflank-mailman (input) for mailman id 368005;
 Fri, 15 Jul 2022 08:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lfc=XU=epam.com=prvs=9195ef3d5c=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oCH7w-00054o-5W
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 08:56:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d90c53d-041c-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 10:56:46 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26F7SpwY029778;
 Fri, 15 Jul 2022 08:56:35 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3haua5sb4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:56:35 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DB3PR0302MB3259.eurprd03.prod.outlook.com (2603:10a6:8:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 08:56:30 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5417.025; Fri, 15 Jul 2022
 08:56:30 +0000
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
X-Inumbo-ID: 0d90c53d-041c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjjPiJWCnyHnGLRhmP0pjDqQ3cDougDZWJmerU/mjLfhnxonnK4z35AlWIRLnjT4jSVqhE+s8j7mRIPyZuKOxtnvOec+8zwtiv7ZY98PBy9vxysyVXPY6HCKa/1CrmEkI6E1UpvhWrsqpJvF9+v30Xr1jKQM+oz4z2ojNa3F34S7q72G2oqaLizxSVtb83i/DKGwc/FG2SVBTTa9FJuKHawiSupxLRvfCVzq+/IrXX0w9MmXAowzMkm86Ix/wYnr0PZZAUxys8dYAxJds0pkGP5MAfu9sKKqNKTU36dJKJrE/nb9A9BKZg5n564QZ/QyfbAGIz15nh5OML7x317y7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul4YRkWIBpTNfduzak5HQ9qlutYvL9Q30qHW4nlXxgk=;
 b=SCdm2lXJtwkeJU5qbmOuFjct6qwKP1f8vtV+6HjdpwrKUavI8PlMpMzg9n/QfthQWxVFx9rAbsApr3eMhHQnQqdYLbUWXwCyIw+Uvx20/4YzKch3VbJ3NFyJ2cGGTjT5L7akn+iQtcliu0+TEKK3i7iKFHAKDfjxSxAUg6w4sz40g7psJ5KoZ2PVVC8rf6u/CR4JZNpiE9Ab7kki/Uf4XgDby1/MEXVK8sjb2hgOL50LOsoCJjW5T6kPoLZPggSvOpD82AnBedbres/BHp3mPuf/4y2yu+xsHG9LJTtXaNVll2it4AEwr/6LQ4iDnWtiIK20WULJf2G/wcIXDKK40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul4YRkWIBpTNfduzak5HQ9qlutYvL9Q30qHW4nlXxgk=;
 b=fScKFPK1hOav/gD8RSLygCBxzjvfmeFDUOZtKqmQ7ffz990zBArWbX7X8f+A2TSt1fXnY/+ZGvBZJnr2oD18Mxv9t93VghlXNdh6ludMvERShlSqo/k3spibDPMR+V2qBDpO+l0r1J+1YHAe6vybQkDZYBP9shX9E9wbsIqc7tyjb44FQx0KTUamvV+tyTlYe6zVbBlbILWTZzFsPROYN/H2STtZZ/9nKS56yxyf8d5/crDGK/+J+shXDhgYzIHaQVE3Cv+pqmgcPIGLlot/TQMrUl2cPtqZmQFNRTJwhSnm9+Ebchk9hWykhIO7753CMb3j5ew6ZQUbKHSBblIGgw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Andres Lagar-Cavilla
	<andreslc@gridcentric.ca>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/privcmd: prevent integer overflow on 32 bit systems
Thread-Topic: [PATCH] xen/privcmd: prevent integer overflow on 32 bit systems
Thread-Index: AQHYmCjGqfExByPyt0K1yo9lRsWBCw==
Date: Fri, 15 Jul 2022 08:56:30 +0000
Message-ID: <fa5e41eb-7f10-56d5-77db-e214535addf4@epam.com>
References: <YtEjVdG+pp9DGz++@kili>
In-Reply-To: <YtEjVdG+pp9DGz++@kili>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00415b8c-42e8-47b0-758e-08da663fe8cf
x-ms-traffictypediagnostic: DB3PR0302MB3259:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9qhEQhfTEDu04inhMjET/lxI0Pvl8uLOSoHzvnfTpmk8PMO7fFDU916vkRUcqxG0EZM8oc+gbdRjL9+NToNjtgkDndpEDa98VM1nGjKiFulsE3fHVHzuPxn1aXvjDxaLF4CYf8bRS49MVbP6OKAERhuiNo9DOEIv44gJWbthfT4aORiLqg1vqJFuCyDtj7iG7QZvqgVUkJa6NLMyD+/BSdm/Ai+cD3K+0UP/sZ/MgXDroZ9d00vs3Z5sMSMCxV1gZBZ+tT2/tpcIv2uouYZLKdzCP1QBMJbuagOyMXcP2WytfD+jgwSX66mR5xC0Uu26HXPTNXPG+3jsav4D/l3sV5yJelDia3wpeiLCZCvPgP/23hxQ5aiaCdBB0dig8guJMN8qFlj1w+XZnEak97aJ6h8MCvhVXNoKOlYqQGhgX5PFD3u+vHAkLfBhAHNXOhzYFcaTjvsh6AvxhriVT/sDWUo6To+cde7ajpUmKAghIDBKIDE7gr7js60axUS8HGVq/+xkHQ9BCpSLH7KMf3zajyrMcGN+Zj9+Di31De9KzECyLhsnApk3HPRnGed9fRmKi06Oys9JqzsQVzFRXbcsUa/eK41llcOqi804I+/AHX7IxV4n2Z1EgZNDNtw4oJjfQjx5xI5bp6SJd0NsSt48jJ8/95ysar84ftvxFU8hA4ZBl+KtxGsUHCUnChEMp+mG9LEu43Lu4SSOX9l+V3SyDbkYnpX+ZXjaILpba4urjst/VmiRg6tRnodnIzOjDebgDX+VfxSG60bOq0Q0i1UxVAyeZZWU6kPjqa5iOBbxGjR97cOCIumz2WTBDQosJyICPzg7i5JfwY+LlFup5qb3H1yHwBbrA9GgysHthEa9Zvs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(26005)(2616005)(6512007)(6486002)(71200400001)(55236004)(2906002)(8676002)(41300700001)(31696002)(86362001)(122000001)(66476007)(5660300002)(53546011)(6506007)(54906003)(478600001)(6916009)(38070700005)(186003)(31686004)(316002)(4326008)(91956017)(36756003)(83380400001)(38100700002)(8936002)(66446008)(76116006)(66946007)(66556008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTR0UDI2d2IzTmJIa1U5SSt4RlE1bmRhY1BobitSb28wTzJmdUprQlVrbEQ4?=
 =?utf-8?B?M0ZwakZiSzd5MlV4OHpPcHVqZVhNbVlnc1RkeHl2cWJrbkNHSXFRMGU2M3Rv?=
 =?utf-8?B?b0VPT2oxcmNDdzFBZzZ0bFg5SHRPQWtTdGJibXYyVDM1S2NhUnZHZnpWZXRO?=
 =?utf-8?B?SEI1c1ZqMU9McWtHN0N3ZnF3UXNobU1ZQjMvY2p6NVJlTmcxY2pqZ0ZxbnFC?=
 =?utf-8?B?SlAxNVFLWmg3WlM1eVhhaENsVlV2M3lZOGM1K3F4S3paVktibWR0eW51ajZt?=
 =?utf-8?B?TlRPdWJlUWkwcW0vQ1Y5NFMzVUl5elhDZDJGbFc3VnovbWFsT3cxbTcyZlNl?=
 =?utf-8?B?R2h5Ry93S2lPSGRYMzk4VWNoaXB6a0RRUk1pa0N0dmdCYVhSNER4WHZkZlFL?=
 =?utf-8?B?UW9XUVZZci9KN3NtQ01COG8zdzhaeVhNb3lUd29rMWU3dTgxSW43cVFoeTVP?=
 =?utf-8?B?MDNJekxkSmpneU9SZ0RYUGJ4U3liQWRxbC9ZVDI4WDZERlc2aHhHSFI0Nk4w?=
 =?utf-8?B?RldJUW16OTg1QkM1M2RDN2lzcXduS3d6NHA4UmtGUnBtYUJUaG1JYkF3NFVl?=
 =?utf-8?B?MmdQbkxBZlczNnRJVUpULy9hdWFzL1hxY2VXbDVITlBGaXJMWVVyTE9MTTVF?=
 =?utf-8?B?NWhzVDRmS080MzdHVXR4ei9DaXpDeHl6ZzNabWpFL255YmNwTkJGWTlzdGxn?=
 =?utf-8?B?RHE0MGpNVmlKcGhsVEk1YWVJNkpFWVViRktMRVQxaFNYbGtUZUMvbW1sc2N3?=
 =?utf-8?B?bWJwZDBva0RYVnZIeGl1SXRNcnJSRkx6eDdhVDlWQWNaczh4YkxzR0N0U21U?=
 =?utf-8?B?RXpETTkvWFVGWE1WUDA2V0krYTNYMkpSMC9kUGNQam05UEUwamEwU1NZM05V?=
 =?utf-8?B?a1dIMTVHMWJIcDg2WTV5UHZVR0VyMzNaems4MUcxTUpFMGgwM2NoZGs5YUQw?=
 =?utf-8?B?SGk0Sm94NjBaSlEzVEoyTUd0QkhncnlTRUxpZVZzT0NPKzdMc1JaNjhqSzlE?=
 =?utf-8?B?NmJiS3kxV081dUhjalVCb2RlTUlNNnFwMjBhRldsbkpKVThCTmY5c21kTFpV?=
 =?utf-8?B?RWlZb1FoL0tIbmRqbmJEWTZjSUYyYVRvTDhvYmd5NWR3Smt2SWY1WnY0akVX?=
 =?utf-8?B?b1JIeG9EamF6N3JySThLTWQvVExxTGRXZ0hwWWJRcVpCaXhaQ2xLYTdqYzZa?=
 =?utf-8?B?V0JsOXlqVjl0WkR1WVZUTlByKzF3b0M1UlRaVlZ4TXgzRmVtL251TjVzcDlt?=
 =?utf-8?B?QmhwQ0ZETnN5UTVnWHNPa0NyN1JRWGtpdGJHN2cxN2pkY2FrakZrOGJlMXRS?=
 =?utf-8?B?N0svWXRsOUR2WVh0dkVOMzFRYXlBc3M3aXErOXBBRkNjTHFra1AxVy9ncnVN?=
 =?utf-8?B?QVRxWlZjTGdxaHE4NjZ2VTAyV1BvR0NNZnI0NGhGZVNRZWFwcXpYSjlrVGtY?=
 =?utf-8?B?NGl1TFNSdGlTTjRldHJXK2N4V3QyOEt6UFlHR0RMS1BXbTRibEpOd2J2alFM?=
 =?utf-8?B?MHltTU9TSXM3VzlISm94T2FOTXc1eXV3ZUpNL2NNNllXcUtsc0FJVFBKWlNS?=
 =?utf-8?B?amQ5QkRVQ2NjSEN1a2U2aHZENW4yR1FPVmdjWlFkVkZ3cllHR0crMXJhN1l2?=
 =?utf-8?B?WVVwUDNoUHk2czF2QVdETUJLdC9iSlVEZHNaRGc3amFQV0VUM3E2MnR4Nmoz?=
 =?utf-8?B?cUFsR2w0cmZINncyMGtSTUd0YW8rSFNIUEJudzlkbmx6enFhNnFUTzE2VjU5?=
 =?utf-8?B?OGJmYWpscDliRk9qT0lIVmt3cE14clRtSGRReUc0YU13RU1zdVV1WVZhOHFp?=
 =?utf-8?B?RTUxVGdmTVlpU1l3eVpJaTVhNVpPS2pkT3VhSFhTVlNtc0tkOGlxMHJaa084?=
 =?utf-8?B?WDBSNU9XaHlaVzl1eHprU1REWU5iWUJBZ2FKVVowcHk1dEIwQTN3ajl6VHk5?=
 =?utf-8?B?UE9yZ0lEZW10ZUtwSCtUeWxDNW9Dcjl5NnZRUGkyOHBDREg1cmo0WkRKdzFX?=
 =?utf-8?B?R2o2QTRHL0Zyc25yRitTeSthZlVDVEg2elNFN1d1Rk44NjNQTTk2QXBaTlB4?=
 =?utf-8?B?S1Q3akR3SEM4dTk4dU5vVXhJOFhVWEZHdlllV0xHZHozTGxlV3lSeFFrVUpZ?=
 =?utf-8?B?bnhUblZHRTN1SUQrYU9vZjJqRTZWWGFXc0lQM1Zha01FQk1TbW9iQkxieHdp?=
 =?utf-8?Q?0o0FWIHU00rvo9yQDmmd0PM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE825738158F4B4CA13553BA6DE296DA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00415b8c-42e8-47b0-758e-08da663fe8cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 08:56:30.0916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ZOEMLDFOeAIHyMQBYAlngCEwycubE3A0w1LYYxbCIEqsrxpgPyUlwm4piGvDbKH5G2xLFta+eRA5BPZ1Jmb/OPTofi7KJQjnhel3vwN92U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3259
X-Proofpoint-ORIG-GUID: mqAfiAXF7dypPOmkr6zyfVeTeAlt-WQj
X-Proofpoint-GUID: mqAfiAXF7dypPOmkr6zyfVeTeAlt-WQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_03,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150038

DQpPbiAxNS4wNy4yMiAxMToyMCwgRGFuIENhcnBlbnRlciB3cm90ZToNCg0KDQpIZWxsbyBEYW4N
Cg0KPiBUaGUgIm0ubnVtICogc2l6ZW9mKCptLmFycikiIG11bHRpcGxpY2F0aW9uIGNhbiBoYXZl
IGFuIGludGVnZXIgb3ZlcmZsb3cNCj4gb24gMzIgYml0IHN5c3RlbXMuICBQcm9iYWJseSBubyBv
bmUgcmVhbGx5IHVzZXMgdGhpcyBzb2Z0d2FyZSBvbiAzMiBiaXQNCj4gc3lzdGVtcywgYnV0IGl0
J3Mgc3RpbGwgd29ydGggZml4aW5nIHRoZSBidWcgaWYgb25seSB0byBtYWtlIHRoZSBzdGF0aWMN
Cj4gY2hlY2tlciBoYXBweS4NCj4NCj4gRml4ZXM6IGNlYjkwZmEwYTgwMCAoInhlbi9wcml2Y21k
OiBhZGQgUFJJVkNNRF9NTUFQQkFUQ0hfVjIgaW9jdGwiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
eGVuL3ByaXZjbWQuYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYyBiL2RyaXZlcnMveGVu
L3ByaXZjbWQuYw0KPiBpbmRleCBhZDE3MTY2YjBlZjYuLjFlNTliNzZjNjE4ZSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy94ZW4vcHJpdmNtZC5jDQo+ICsrKyBiL2RyaXZlcnMveGVuL3ByaXZjbWQu
Yw0KPiBAQCAtNDU2LDYgKzQ1Niw4IEBAIHN0YXRpYyBsb25nIHByaXZjbWRfaW9jdGxfbW1hcF9i
YXRjaCgNCj4gICAJCWlmIChjb3B5X2Zyb21fdXNlcigmbSwgdWRhdGEsIHNpemVvZihzdHJ1Y3Qg
cHJpdmNtZF9tbWFwYmF0Y2gpKSkNCj4gICAJCQlyZXR1cm4gLUVGQVVMVDsNCj4gICAJCS8qIFJl
dHVybnMgcGVyLWZyYW1lIGVycm9yIGluIG0uYXJyLiAqLw0KPiArCQlpZiAobS5udW0gPiBTSVpF
X01BWCAvIHNpemVvZigqbS5hcnIpKQ0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgCQltLmVy
ciA9IE5VTEw7DQo+ICAgCQlpZiAoIWFjY2Vzc19vayhtLmFyciwgbS5udW0gKiBzaXplb2YoKm0u
YXJyKSkpDQo+ICAgCQkJcmV0dXJuIC1FRkFVTFQ7DQo+IEBAIC00NjQsNiArNDY2LDggQEAgc3Rh
dGljIGxvbmcgcHJpdmNtZF9pb2N0bF9tbWFwX2JhdGNoKA0KPiAgIAkJaWYgKGNvcHlfZnJvbV91
c2VyKCZtLCB1ZGF0YSwgc2l6ZW9mKHN0cnVjdCBwcml2Y21kX21tYXBiYXRjaF92MikpKQ0KPiAg
IAkJCXJldHVybiAtRUZBVUxUOw0KPiAgIAkJLyogUmV0dXJucyBwZXItZnJhbWUgZXJyb3IgY29k
ZSBpbiBtLmVyci4gKi8NCj4gKwkJaWYgKG0ubnVtID4gU0laRV9NQVggLyBzaXplb2YoKm0uYXJy
KSkNCg0KTG9va3MgbGlrZSBoZXJlIHdlIG5lZWQgdG8gY2hlY2sgYWdhaW5zdCBzaXplb2YoKm0u
ZXJyKSB3aGljaCBpcyB1c2VkIGluIA0KdGhlIG11bHRpcGxpY2F0aW9uIGJlbG93Lg0KDQoNCj4g
KwkJCXJldHVybiAtRUlOVkFMOw0KPiAgIAkJaWYgKCFhY2Nlc3Nfb2sobS5lcnIsIG0ubnVtICog
KHNpemVvZigqbS5lcnIpKSkpDQo+ICAgCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ICAgCQlicmVhazsN
Cg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNoZW5rbw0K

