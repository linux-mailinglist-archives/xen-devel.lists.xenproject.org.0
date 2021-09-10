Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93AE406B82
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 14:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184346.332957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOfmz-00059Y-VO; Fri, 10 Sep 2021 12:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184346.332957; Fri, 10 Sep 2021 12:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOfmz-00057Z-Qx; Fri, 10 Sep 2021 12:37:53 +0000
Received: by outflank-mailman (input) for mailman id 184346;
 Fri, 10 Sep 2021 12:37:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOfmy-00057T-7a
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 12:37:52 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01c1eb1f-6ccc-4d40-aa80-7a70c438bc03;
 Fri, 10 Sep 2021 12:37:50 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ABTHwB025704; 
 Fri, 10 Sep 2021 12:37:47 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b04tx0swx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 12:37:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3374.eurprd03.prod.outlook.com (2603:10a6:803:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 12:37:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 12:37:44 +0000
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
X-Inumbo-ID: 01c1eb1f-6ccc-4d40-aa80-7a70c438bc03
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG4qmk8IRMawKYHO4H2DolR11+n7ZYfQU2QKWZidnArZKv8irpE6zE/tpdJMdKZYTwhZbBrBdOC70LgTKCnKa+RoA/KvcOiZXhjCS3rmLkaUmrdDOnlfizPOBIShL1//0kcaY/QKheKgPjUd3tsb4Xi4SWjLMYLyTjLFPbcgcxYx7o4LZRM1fH+Dc8AhecKD66U2YZFVR2alfYvXE2t+UcqVcuyqku8fqd3sHLD2T6WiU1Y3pknWfEqojckN++8QgOPcFsRHjj1gxwrO6V2jg/UfBMWIq63Xedf/prBjs4EnM7n4FGey8WA9/RWtKMkE+GPqJI4dupoStdnqecdpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fOY/k+Cl916ZN8DknowvG6mZDifaIyk5CAKNXWJuwOg=;
 b=ZMckj97MYUnaPkecitEZ9uvTWEzKY5fgFh2eKvq/CTZA+jjjwrVjAfdxE5qXjqwYG/M8FPkUsRWG8ISbvewV82YGwA8BEHqmw2C/Se0IVmgDMh49BmMxQneSIEM3WMGktt7bRkAPABiE5UyR+U6NqlEupBc+i2NkV2GN9dCm1HqipW44irN4bO57t0v6bdVQiKMUklNGLOfLXXZlBekd5zmQWsBsndOr+ELHBoIyHlilztfHRdn18L4DWHjkRNQNvcPFJYw9rZWAxlCs4c0JGvsH8z5enWd4tlplMn/5hg7c0XtnZyeBOrU3VEb3f1I6x6H7BQh7b/BwjV+9s9n0qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOY/k+Cl916ZN8DknowvG6mZDifaIyk5CAKNXWJuwOg=;
 b=KRtvBXJBwVNDZX/aTTTpwt2ppyRjdwORRhNcqFZea1xjTBq82C3mprrs0XSFgP+NEruwi+pGplgipzVx+Xl2tXdGK4rpgSfUkUPWUKA8yOW37g2oYDZJNuUebgoESydHKzKze9ob63JTMtnCZDYs/M/cFUuJBZYc65qkfWnl6TkDI7AqBUbaCk2YS0CXhmuC5WiRdvT/sOKraIQj9aal6PoC5uslt0qhzAGthtHJcFaR0ewfX0XRG2FsxImAWCvde4KbhzjLiuWlTxTd+in2ugJo8NkEhTYEbA2tmFYTH7YYVFdPgf3VQ8MojB6K08Vs+aC+WaVMNgnf+8HcnSvUvA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index: AQHXoJ50hf+zXQhc2ka7YfmmERKX+aucB06AgAE4wYA=
Date: Fri, 10 Sep 2021 12:37:44 +0000
Message-ID: <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
In-Reply-To: <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b0858b1-c2b7-4a63-af01-08d97457c9d9
x-ms-traffictypediagnostic: VI1PR0302MB3374:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB337404E0C4B3A2E153B89C6CE7D69@VI1PR0302MB3374.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +XM95JvvPpWJczxA+8BU0i8Hx5DPIo2/twRaw4eQyZiH8zS5wRZbPmE4cm5fqmtuGXDVq3fLrijVH8W97boIDKW0+AOxMJWDDM9hQCE+x+58G2GY5uY9emd/ut7M5mb9xe8uxBJVXwy1bEfJJjbOnBM+a+O1gevy5FOLbJizL+3rYjzKyj91CgfiqvdZzt+e5g7sl4LbJAVGM50XgBdJfbQIsWRdbWW1POSkH8NhRdO5NKLvbmG+lriRhAboK9HBLNb5NbR5fXKa5UT46F4+3/epjR4G/oWg6H5D/XxsEsMqtY5yPVT5dO16JZRS++4Xm4I6MgjJOOVsdGJf7XL0wiqGqnQLyVEYBufmboU/Q0pDhXUQv8tIYxgdIDt+RK1xh8a9pBQbG09BePJ98vR79awQ76SwX3uCtTgK1ROswCWOXzrcES87UrkXRtH+J+vqX2IrfOxVj9sC5veJ0OWeJ0l/XpXZ3zwtz4sbHJIyv0RLkOBULHIkQoOlhqOAUbaoKrXWfec6i3E6p0jfsynamUU6j/iIGR2dCPscBV963AF2nq14mgoE7i5XllPENv1wabwB7XQLzcOl7Eii7peGQewzZ2ASC6iMrK6vqAoXlpW959N6sOqmI6I9rKT3BLD9kZvJeHxmm7YcgwIcLrdO3tDLoaQX2b23up4KpN0ODZ/IJOsCVgz4e048hcqRVxR6pKufwjeXwmbAO8CApOTiQGC9BG5ZqEQKS6dOJvPSZc36rZGYf80wsAw5bcFz64n0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(83380400001)(86362001)(5660300002)(66556008)(91956017)(54906003)(36756003)(66476007)(38070700005)(64756008)(110136005)(6486002)(66946007)(316002)(66446008)(508600001)(71200400001)(2616005)(55236004)(53546011)(6506007)(38100700002)(31696002)(122000001)(2906002)(6512007)(31686004)(8936002)(186003)(26005)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TWpKelVZRmRqS0FlNTE3MEl0SHpIVGVQdXF4L0FCYk1WUHgvRzF0Y0lYOTkw?=
 =?utf-8?B?cE9mMFZaLytVa1BmZHNEdjhqTkFWZzBDbTRObVZxTUo0b3ZPR1lZdlJWZUtL?=
 =?utf-8?B?REJBaWJvcllTemZBUlB6bnR0SDRMdUZoelZNTXQyYnhCTnRTMXZ6ZSticUhh?=
 =?utf-8?B?L0pZRTAxQzdCY25UamM4Yk9CZlVpWVhxaERsVzhPZndXdEVKbXV5dklSdENO?=
 =?utf-8?B?enRxM1IvaXBzNG45QmVoR3c1aklWcGdWU0NOTWtaN0ZXSk5pa1JOYnhIWm81?=
 =?utf-8?B?NnlrSVVYbENQN2x0Mk85d3FwZ20wVTBFN1A1WHdOQWkzdjBtYm9VbWkwaEN0?=
 =?utf-8?B?ZGlHaUkwR25KbzdYNzBIM2xmRUlITm9HaENIaGt3Qm5sWGkvRTdxcWh2OFI1?=
 =?utf-8?B?YTh3VmhrRXF1bHNtSXdmSVdUZHJ4dUZ4K3hvcDhYejNyNU5LL1NlK2Y4TGtC?=
 =?utf-8?B?QnhnT2VvalZRdzk3Q3JWSGtIekxSVzhhWENwdHlzY3owK2pSckdTVEk4M3VF?=
 =?utf-8?B?Qy9oOGlIUkxuVE5waWcvQVpRbUpIV0RUOUhvVDdRUWEwektCS0MzamhILzFw?=
 =?utf-8?B?bzZFSWtDaXRiZGtneEs2ODdYU1BOMHgrTG9OZnF4UTZYbGgyVllFS0JwOVY5?=
 =?utf-8?B?c0k2UjZ3TittcFB0NEwvREtaR0RIaEllRm1vdGtaaGl5Mk1FanVnZWVOR21F?=
 =?utf-8?B?c1NFd0pCWjQyNStjaGV0OCtRYUZoWmcyQk9qeUQ1OVY0U2UwQ25pTUlqY3JU?=
 =?utf-8?B?Tk5uRHB6T3ZmQVRpdGVRZFlJTFFWWmYyUStSS0w3V2t1Y1ZRQWZPVEZwMjNV?=
 =?utf-8?B?OHZCMUVrVmtkZmtuNldzYUc1MEFNOVJ4bXNydnVLbkJVbXpCOGJqbmFjNnI3?=
 =?utf-8?B?RXkrWXJOMXVwTUphTWx0bXhwa28vRGh4OERqUHNKUlU0YzJrUTh3K254dG1U?=
 =?utf-8?B?YXQyQlFXeUlpOXF6a1BsQ2NxNUgyY1JUZ3hNQnZnbkV6cjRPdTlHZ3JTc1Bs?=
 =?utf-8?B?eW1Tb0c2TXBXS2hnSE9tZ25PbitQcUZBeHMyV3d0M005MU9XMWlWejZDVVV5?=
 =?utf-8?B?V01yNDlSR3JPMk42SEtSM0N2Q1ZvSVY3dGw2bThsa0xGOUtnYXhiQ3B6Tkw0?=
 =?utf-8?B?RHNGb0tmVmZRYnUwVXhYNDNqQTBXd21pWXRML0UxWjRtOWdGRGMyWUZMMzVk?=
 =?utf-8?B?azBJdU10Q1RrWGhxNURleVhBK0lhaklLeC9pZEpoK3h3bzVkMDIvMFN0c0ZE?=
 =?utf-8?B?c3VyM1pMQ21mQ0MzUkFydkNUWnRESmlwcmxpWHJielo2S3BxSEdsRUVkRk5U?=
 =?utf-8?B?eGlCQVZMb2YwR3JPYWlEdkNqc1l0RkIxV0RrTi9aUVA4ZTJGUnVCNTBaWDFM?=
 =?utf-8?B?WkhBTkhGeXpPRDNFdnUyMkZLWm5Kd29ORWF1eHpMdnN1QXM3N055TzZSTEJ1?=
 =?utf-8?B?c3pTaG5raGlUN3NCN3VPQ2tCQ0wyY0NDWlg0WEJQcnJGMVRtU2d4SG1lU1hN?=
 =?utf-8?B?RktyN29HeElERFJSbnhyNDNKYVlUTUxhZDRPRXE0OUVLVWNPc2ZicGpzVFkw?=
 =?utf-8?B?VkVET1Z5bVlOSTdjeVRpakxlaGNBMGh4L0QwbFlrU1hnSGlqRGlZeU1FTjJr?=
 =?utf-8?B?cUc2WStZR290cE5WR1dlYVg3MzFsVnpQSHhnZGdMTkYvcCtBZmlTdERuWEZq?=
 =?utf-8?B?eGk1VGJrcCtKSmZRa2dqd2NRcDkxdm5oKzhyNFI5eEx2QW1IMFdGUzhHRUs1?=
 =?utf-8?B?eGFSZGY0c1N0aVVVRFBCbSsxV0pBbTZ3ajZmUFAyWUpGZDVWR0doN2dBKy9r?=
 =?utf-8?B?S0t4K1lvclRmRmszTE1SQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <023085D875ED244C86E92F8E8F6A6D79@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0858b1-c2b7-4a63-af01-08d97457c9d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 12:37:44.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xCqO2nK5Nw47iJOfXuiH+/bG7+nj72V4k4QQbVb91elF+A1gE1VBTDJjcS2mtmcb26cFwChcSb9Uw8i+uhMdNW6SVTU4MxdDzGulygemY6jSq8GqGk1pkOTXMFJgWRlJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3374
X-Proofpoint-ORIG-GUID: pNAUkeGQULJSEn8vPvgbJfxqpJghB-Od
X-Proofpoint-GUID: pNAUkeGQULJSEn8vPvgbJfxqpJghB-Od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100074

SGksIEp1bGllbiENCg0KT24gMDkuMDkuMjEgMjA6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwMy8wOS8yMDIxIDA5OjMzLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBIb3N0IGJyaWRnZSBjb250cm9sbGVy
J3MgRUNBTSBzcGFjZSBpcyBtYXBwZWQgaW50byBEb21haW4tMCdzIHAybSwNCj4+IHRodXMgaXQg
aXMgbm90IHBvc3NpYmxlIHRvIHRyYXAgdGhlIHNhbWUgZm9yIHZQQ0kgdmlhIE1NSU8gaGFuZGxl
cnMuDQo+PiBGb3IgdGhpcyB0byB3b3JrIHdlIG5lZWQgdG8gbm90IG1hcCB0aG9zZSB3aGlsZSBj
b25zdHJ1Y3RpbmcgdGhlIGRvbWFpbi4NCj4+DQo+PiBOb3RlLCB0aGF0IGR1cmluZyBEb21haW4t
MCBjcmVhdGlvbiB0aGVyZSBpcyBubyBwY2lfZGV2IHlldCBhbGxvY2F0ZWQgZm9yDQo+PiBob3N0
IGJyaWRnZXMsIHRodXMgd2UgY2Fubm90IG1hdGNoIFBDSSBob3N0IGFuZCBpdHMgYXNzb2NpYXRl
ZA0KPj4gYnJpZGdlIGJ5IFNCREYuIFVzZSBkdF9kZXZpY2Vfbm9kZSBmaWVsZCBmb3IgY2hlY2tz
IGluc3RlYWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gLS0tDQo+PiDCoCB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmPCoMKgwqDCoMKgwqDCoCB8wqAgMyArKysNCj4+IMKgIHhlbi9h
cmNoL2FybS9wY2kvZWNhbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE3ICsrKysrKysrKysr
KysrKysrDQo+PiDCoCB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIHwgMjIgKysr
KysrKysrKysrKysrKysrKysrKw0KPj4gwqAgeGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDEyICsrKysrKysrKysrKw0KPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCA1
NCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gaW5kZXggZGE0MjdmMzk5
NzExLi43NmY1YjUxMzI4MGMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gQEAgLTEyNTcs
NiArMTI1Nyw5IEBAIHN0YXRpYyBpbnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4oY29uc3Qg
c3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4g
wqDCoMKgwqDCoCB9DQo+PiDCoCArwqDCoMKgIGlmICggbmVlZF9tYXBwaW5nICYmIChkZXZpY2Vf
Z2V0X2NsYXNzKGRldikgPT0gREVWSUNFX1BDSSkgKSA+ICvCoMKgwqDCoMKgwqDCoCBuZWVkX21h
cHBpbmcgPSBwY2lfaG9zdF9icmlkZ2VfbmVlZF9wMm1fbWFwcGluZyhkLCBkZXYsIA0KPiBhZGRy
LCBsZW4pOw0KPg0KPiBBRkFJQ1QsIHdpdGggZGV2aWNlX2dldF9jbGFzcyhkZXYpLCB5b3Uga25v
dyB3aGV0aGVyIHRoZSBob3N0YnJpZGdlIGlzIHVzZWQgYnkgWGVuLiBUaGVyZWZvcmUsIEkgd291
bGQgZXhwZWN0IHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBtYXAgYWxsIHRoZSByZWdpb25zIG9mIHRo
ZSBob3N0YnJpZGdlcyBpbiBkb20wIChpbmNsdWRpbmcgdGhlIEJBUnMpLg0KPg0KPiBDYW4geW91
IGNsYXJpZnkgaXQ/DQpXZSBvbmx5IHdhbnQgdG8gdHJhcCBFQ0FNLCBub3QgTU1JT3MgYW5kIGFu
eSBvdGhlciBtZW1vcnkgcmVnaW9ucyBhcyB0aGUgYnJpZGdlIGlzDQoNCmluaXRpYWxpemVkIGFu
ZCB1c2VkIGJ5IERvbWFpbi0wIGNvbXBsZXRlbHkuIEJ1dCBhdCB0aGUgc2FtZSB0aW1lIHdlIHdh
bnQgdG8gdHJhcCBhbGwNCg0KY29uZmlndXJhdGlvbiBzcGFjZSBhY2Nlc3MsIHNvIHdlIGNhbiBz
ZWUgd2hhdCBpcyBoYXBwZW5pbmcgdG8gaXQuDQoNCj4NCj4+ICsgPsKgwqDCoMKgwqDCoCBpZiAo
IG5lZWRfbWFwcGluZyApDQo+PiDCoMKgwqDCoMKgIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXMgPSBtYXBfcmVnaW9uc19wMm10KGQsDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Bj
aS9lY2FtLmMgYi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0KPj4gaW5kZXggOTJlY2IyZTA3NjJi
Li5kMzJlZmI3ZmNiZDAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0K
Pj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9lY2FtLmMNCj4+IEBAIC01Miw2ICs1MiwyMiBAQCBz
dGF0aWMgaW50IHBjaV9lY2FtX3JlZ2lzdGVyX21taW9faGFuZGxlcihzdHJ1Y3QgZG9tYWluICpk
LA0KPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IMKgIH0NCj4+IMKgICtzdGF0aWMgaW50IHBj
aV9lY2FtX25lZWRfcDJtX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlLA0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBsZW4pDQo+PiArew0KPj4gK8KgwqDCoCBzdHJ1Y3Qg
cGNpX2NvbmZpZ193aW5kb3cgKmNmZyA9IGJyaWRnZS0+c3lzZGF0YTsNCj4+ICsNCj4+ICvCoMKg
wqAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gdHJ1ZTsNCj4NCj4gSSBhbSBhIGJpdCBwdXp6bGVkIHdpdGggdGhpcyBjaGVjay4gSWYgdGhl
IEVDQU0gaGFzIGJlZW4gaW5pdGlhbGl6ZWQgYnkgWGVuLCB0aGVuIEkgYmVsaWV2ZSB3ZSBjYW5u
b3QgZXhwb3NlIGl0IHRvIGFueSBkb21haW4gYXQgYWxsLg0KWW91IGFyZSByaWdodCwgdGhpcyBj
aGVjayBuZWVkcyB0byBiZSByZW1vdmVkIGFzIHRoaXMgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQg
Zm9yIERvbWFpbi0wDQoNCj4NCj4+ICsNCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoCAqIFdl
IGRvIG5vdCB3YW50IEVDQU0gYWRkcmVzcyBzcGFjZSB0byBiZSBtYXBwZWQgaW4gZG9tYWluJ3Mg
cDJtLA0KPj4gK8KgwqDCoMKgICogc28gd2UgY2FuIHRyYXAgYWNjZXNzIHRvIGl0Lg0KPj4gK8Kg
wqDCoMKgICovDQo+PiArwqDCoMKgIHJldHVybiBjZmctPnBoeXNfYWRkciAhPSBhZGRyOw0KPj4g
K30NCj4+ICsNCj4+IMKgIC8qIEVDQU0gb3BzICovDQo+PiDCoCBjb25zdCBzdHJ1Y3QgcGNpX2Vj
YW1fb3BzIHBjaV9nZW5lcmljX2VjYW1fb3BzID0gew0KPj4gwqDCoMKgwqDCoCAuYnVzX3NoaWZ0
wqAgPSAyMCwNCj4+IEBAIC02MCw2ICs3Niw3IEBAIGNvbnN0IHN0cnVjdCBwY2lfZWNhbV9vcHMg
cGNpX2dlbmVyaWNfZWNhbV9vcHMgPSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLnJlYWTCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSBwY2lfZ2VuZXJpY19jb25maWdfcmVh
ZCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAud3JpdGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgID0gcGNpX2dlbmVyaWNfY29uZmlnX3dyaXRlLA0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIC5yZWdpc3Rlcl9tbWlvX2hhbmRsZXLCoCA9IHBjaV9lY2FtX3JlZ2lzdGVyX21taW9faGFu
ZGxlciwNCj4+ICvCoMKgwqDCoMKgwqDCoCAubmVlZF9wMm1fbWFwcGluZ8KgwqDCoMKgwqDCoCA9
IHBjaV9lY2FtX25lZWRfcDJtX21hcHBpbmcsDQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIH07DQo+
PiDCoCBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYyBiL3hl
bi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMNCj4+IGluZGV4IGE4OTExMmJmYmI3Yy4u
YzA0YmU2MzY0NTJkIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1j
b21tb24uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYw0KPj4g
QEAgLTMzNCw2ICszMzQsMjggQEAgaW50IHBjaV9ob3N0X2l0ZXJhdGVfYnJpZGdlcyhzdHJ1Y3Qg
ZG9tYWluICpkLA0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4g
wqAgfQ0KPj4gKw0KPj4gK2Jvb2wgcGNpX2hvc3RfYnJpZGdlX25lZWRfcDJtX21hcHBpbmcoc3Ry
dWN0IGRvbWFpbiAqZCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHRfZGV2
aWNlX25vZGUgKm5vZGUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgYWRkciwgdWlu
dDY0X3QgbGVuKQ0KPj4gK3sNCj4+ICvCoMKgwqAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJp
ZGdlOw0KPj4gKw0KPj4gK8KgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KCBicmlkZ2UsICZwY2lf
aG9zdF9icmlkZ2VzLCBub2RlICkNCj4+ICvCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICggYnJpZGdlLT5kdF9ub2RlICE9IG5vZGUgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGludWU7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCAhYnJpZGdlLT5vcHMtPm5l
ZWRfcDJtX21hcHBpbmcgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7
DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGJyaWRnZS0+b3BzLT5uZWVkX3AybV9t
YXBwaW5nKGQsIGJyaWRnZSwgYWRkciwgbGVuKTsNCj4+ICvCoMKgwqAgfQ0KPj4gK8KgwqDCoCBw
cmludGsoWEVOTE9HX0VSUiAiVW5hYmxlIHRvIGZpbmQgUENJIGJyaWRnZSBmb3IgJXMgc2VnbWVu
dCAlZCwgYWRkciAlbHhcbiIsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZS0+ZnVsbF9u
YW1lLCBicmlkZ2UtPnNlZ21lbnQsIGFkZHIpOw0KPj4gK8KgwqDCoCByZXR1cm4gdHJ1ZTsNCj4+
ICt9DQo+DQo+IElmIHlvdSByZWFsbHkgbmVlZCB0byBtYXAgdGhlIGhvc3RicmlkZ2VzLCB0aGVu
IEkgd291bGQgc3VnZ2VzdCB0byBkZWZlciB0aGUgUDJNIG1hcHBpbmdzIGZvciBhbGwgb2YgdGhl
bSBhbmQgdGhlbiB3YWxrIGFsbCB0aGUgYnJpZGdlIGluIG9uZSBnbyB0byBkbyB0aGUgbWFwcGlu
Z3MuDQo+DQo+IFRoaXMgd291bGQgYXZvaWQgZ29pbmcgdGhyb3VnaCB0aGUgYnJpZGdlcyBldmVy
eSB0aW1lIGR1cmluZyBzZXR1cC4NCg0KV2VsbCwgdGhpcyBjYW4gYmUgZG9uZSwgYnV0OiBteSBp
bXBsZW1lbnRhdGlvbiBwcmV2ZW50cyBtYXBwaW5ncyBhbmQgd2hhdA0KDQp5b3Ugc3VnZ2VzdCB3
aWxsIHJlcXVpcmUgdW5tYXBwaW5nLiBTbywgdGhlIGNvc3QgaW4gbXkgc29sdXRpb24gaXMgd2Ug
bmVlZA0KDQp0byBnbyBvdmVyIGFsbCB0aGUgYnJpZGdlcyAodW50aWwgd2UgZmluZCB0aGUgb25l
IHdlIG5lZWQpIGFuZCBpbiB3aGF0IHlvdQ0KDQpzdWdnZXN0IHdlJ2xsIG5lZWQgdG8gdW5tYXAg
d2hhdCB3ZSBoYXZlIGp1c3QgbWFwcGVkLg0KDQpJIHRoaW5rIHByZXZlbnRpbmcgdW5uZWVkZWQg
bWFwcGluZ3MgaXMgY2hlYXBlciB0aGFuIHVubWFwcGluZyBhZnRlcndhcmRzLg0KDQo+DQo+PiAr
DQo+PiDCoCAvKg0KPj4gwqDCoCAqIExvY2FsIHZhcmlhYmxlczoNCj4+IMKgwqAgKiBtb2RlOiBD
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaCBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vcGNpLmgNCj4+IGluZGV4IDJjN2M3NjQ5ZTAwZi4uOWMyOGE0YmRjNGI3IDEwMDY0
NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaA0KPj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9wY2kuaA0KPj4gQEAgLTgyLDYgKzgyLDggQEAgc3RydWN0IHBjaV9vcHMgew0K
Pj4gwqDCoMKgwqDCoCBpbnQgKCpyZWdpc3Rlcl9tbWlvX2hhbmRsZXIpKHN0cnVjdCBkb21haW4g
KmQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsDQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgbW1pb19oYW5kbGVyX29wcyAqb3BzKTsNCj4+ICvCoMKg
wqAgaW50ICgqbmVlZF9wMm1fbWFwcGluZykoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9o
b3N0X2JyaWRnZSAqYnJpZGdlLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBsZW4pOw0KPj4g
wqAgfTsNCj4+IMKgIMKgIC8qDQo+PiBAQCAtMTE1LDkgKzExNywxOSBAQCBzdHJ1Y3QgZHRfZGV2
aWNlX25vZGUgKnBjaV9maW5kX2hvc3RfYnJpZGdlX25vZGUoc3RydWN0IGRldmljZSAqZGV2KTsN
Cj4+IMKgIGludCBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoc3RydWN0IGRvbWFpbiAqZCwNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbnQgKCpjbGIpKHN0cnVjdCBkb21haW4gKmQsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSkpOw0KPj4gK2Jvb2wgcGNpX2hv
c3RfYnJpZGdlX25lZWRfcDJtX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUsDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdWludDY0X3QgYWRkciwgdWludDY0X3QgbGVuKTsNCj4+IMKgICNlbHNlwqDC
oCAvKiFDT05GSUdfSEFTX1BDSSovDQo+PiDCoCDCoCBzdHJ1Y3QgYXJjaF9wY2lfZGV2IHsgfTsN
Cj4+IMKgICtzdGF0aWMgaW5saW5lIGJvb2wNCj4+ICtwY2lfaG9zdF9icmlkZ2VfbmVlZF9wMm1f
bWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpub2RlLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgYWRkciwgdWludDY0X3QgbGVu
KQ0KPj4gK3sNCj4+ICvCoMKgwqAgcmV0dXJuIHRydWU7DQo+PiArfQ0KPj4gwqAgI2VuZGlmwqAg
LyohQ09ORklHX0hBU19QQ0kqLw0KPj4gwqAgI2VuZGlmIC8qIF9fQVJNX1BDSV9IX18gKi8NCj4+
DQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

