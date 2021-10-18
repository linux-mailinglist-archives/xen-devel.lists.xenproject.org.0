Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B0431413
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211921.369615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPX0-000338-NW; Mon, 18 Oct 2021 10:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211921.369615; Mon, 18 Oct 2021 10:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPX0-00031L-Ib; Mon, 18 Oct 2021 10:06:10 +0000
Received: by outflank-mailman (input) for mailman id 211921;
 Mon, 18 Oct 2021 10:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RpTT=PG=epam.com=prvs=0925c93432=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mcPWy-000317-Vj
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:06:09 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0251ab1a-2ffb-11ec-82d1-12813bfff9fa;
 Mon, 18 Oct 2021 10:06:06 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I9S3Rl029117; 
 Mon, 18 Oct 2021 10:06:05 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bs6ar855s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 10:06:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2659.eurprd03.prod.outlook.com (2603:10a6:200:95::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 10:06:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 10:06:02 +0000
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
X-Inumbo-ID: 0251ab1a-2ffb-11ec-82d1-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIdU+3xgHdaxhFQ28jz+zaBOgwNCD/vKeR0+ci75DK5jLJOXpEjxPVoDWDbysJETqlZehG4dpMZVJF4fI8YYE6eOr2BsVTc0+twKy4H82VIri7yl5hzh5m5vqVQUFNcrf6/i53b5qEKYxZgmrXSINsjKeNNHGpZZ9CeGfdY92Q0o1V5BIzw+9cBiHizOj4Nr/Mg4mPRjL6J552ot7vem1kU1OaF3ISZy0Qwp8tOVUKE2ccFRP6orbgBioW1++q7kPSXswXOk5fWXv5JM59ZHDfI6tIWNbPv4+mr3+1CSXGtv6MR9m/U19qsnNIMvIkSVGyXia8CAfyzLUFXM3yXM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsCgakRF88Gi8f0O1TajMGiNPGor3X03uI6NAkKhJJc=;
 b=ZHBpzeKma1vryNTZvcOZcqFMDkYj4C6W6u/iLYog/y35sM0zE7BFQWn3r+QizCRMKSp8kjssFhNgvzGxAZpdS3+c2GZI+9JNdaSjEDlv/nZX0gp8CLqU4NWwWO+pQfj+DOd3gv945u2lYGEPZs8ah4lD1N4c62BcyPb6dd7KbmWer8IFi6xCgl8/qeQ/mGvb1Y6kSlifT3bFcKe38o9KdV713/AajGOYj7j54Fyf2uwD6DP41wpCC/5AG/3SPPTDiiqlBKz7i/KGAnDEqj7Qmn76PKDazsWhe9WF5jv7jGGc+or4/bclChqmye1i1Aa3mm9ODJhP7KX7xABqcIfbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsCgakRF88Gi8f0O1TajMGiNPGor3X03uI6NAkKhJJc=;
 b=VEju3V9GQoOmLYQC1LuZGeN2rqE2l845N5shk1CISEqmH6vWdIohWsD77wRhD83GfWsXfBCQ/QqkUN455y1s7Nb+uFXEI0zDhzAL+9duik9ojXCElnbFV2A+tkz7nIRTOs7FOQZ3wVi5GydWYQAH/mLVew3WBLTbhaf6qnN7uSMIyCohZG8F2sO2x2+LdnYfuF9nk5q5WtwGlQXnagqfR3TXtAIgNWT5BTydTip7deSJ7NZBgqYuK21q7emk3/m7jB6GsDMZ5deOFPAFNgXMHjIShoSxycXwi62JEk3ooudbS51T8cSJIHLanXHY1x6f1d3Zy2Oy8eFrTj8bxv8vjA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "iwj@xenproject.org" <iwj@xenproject.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXxAfAx+Lzp09rU0elFmx0jxVt5g==
Date: Mon, 18 Oct 2021 10:06:01 +0000
Message-ID: <387863e8-3de6-0aa9-032c-4cde7cb61679@epam.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
In-Reply-To: <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 136b3300-56ee-4bfb-ec82-08d9921ee3fb
x-ms-traffictypediagnostic: AM4PR0302MB2659:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB2659B3EBFBAFF408E18F06FCE7BC9@AM4PR0302MB2659.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cNwY3YOx0ouoBgBCdMs2Etu1hb7wGiGQ2SdCTjXa8sJiEpwLCk0/GAydg4qbnj9y8NcfnwBwsQ6h8HIxVozT6wHM8aiCs00VhLW0wi4t4lFtCKi5wt8PDjB+b/EP060F78kpCnGy34KPCfdWtzTzqXBu/3FPdh9wBEvqwxVyxTi2bf0htRVIFxcmAqzcJW+L3i0Ev4K6xDvLA2/McrvJLLFtHRPV8S5a+UpO6mMFsRw18CFtdgpdycIz2Al8jqGUIKNLBJ09UcgyxQur+q92mCWLxpt1KoAgJj65H/aB86D/ksolcawhk4UK0dUNlv+YP6cvmAnuhuhq9mYcilyDDMOr98Qh71QmPrGj0LOyb9IHbmqZbydXcXuVrA0/HWy7nUVILLx6CPbe87WFWHFq9FJgZUgt3vYm0qSCHc4RPdeyReAPOOxexFv0vzq6/Ejhlw15CUZfAEjpJU8IxPw+8GF8lHfg7RKjSYJ4Xe6UIjVVjeF2w8PW++G7E7fhAZ9C7+6/vLB3dt8ssfKKsXwYEoJj70tOMS6kR4mPMO1xrx5HIobrd0Wb8MO/Ht7nERm70LYt0vICY7aiaNu/LS72C45LqKZ7OzGqquqBY4XzPYXU2rtqFve6QEt0e8sj5ZYOCc5csCLCTvwRUoQZuCeR/bz9R6hiyLFX42x1Wyx7bAxGWO/QBLY792AKGmh9u4cku44Y4cZbN6Lc+NTbavLgZGUnitFGDHIGAwXM003szf+VkESmakfnrTpCC9IzHPZJymJKKItJOr3nWiPjFwNwHw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(54906003)(31696002)(71200400001)(66556008)(186003)(316002)(6506007)(2616005)(110136005)(86362001)(26005)(6486002)(53546011)(6512007)(8676002)(36756003)(66946007)(91956017)(5660300002)(66476007)(122000001)(64756008)(8936002)(66446008)(107886003)(38070700005)(508600001)(76116006)(38100700002)(2906002)(4326008)(7416002)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SnhJZEdIRXlGcVB2Vm8wL3NpMjJReGVRTHNLWUJ4U1hTc1dHOVFUa2VobWhk?=
 =?utf-8?B?VzFnNElHaXRSUFliL0V3YlVuVzgxMmdjaWhIMTFSOHRtT3JnR3R6aTFpS09L?=
 =?utf-8?B?aUROSHUzMkNPTGdSbjhaVEdxZVBhL0Y1K1AxbzhnYlJoblR2Z0JBR0NRNUsy?=
 =?utf-8?B?cTdTMjZITCtYRlpzWkJJUXVGZEdEdXEyVU1OSUphUmJIR21NekJvRmRwYmMz?=
 =?utf-8?B?dU9aMXRGZWxBMGVyeFJqSHFtSnJNbDQydVlKRitPTlRrUFFQejJDMVdTWnZw?=
 =?utf-8?B?MmhoYkNkWmdDdzZINjkvZ2ptVitkTkhXbnlhNDQzbThWOEROeTk3Y21LVzZJ?=
 =?utf-8?B?NEkyVHA4ZFpUcnlsSUluM09mMlNWdlNGMTIvZHpoYlNyMVY4STg4RE1qbXJH?=
 =?utf-8?B?eUpSWXdqU2xIUUlld3NsdmlTcUNNNS9YTk4zTHJBV1RXWVdQNWJHK1REaUto?=
 =?utf-8?B?Mmh3R1FUZktBS1RUK2hWK2JRbGlHR0cvc0VEOER4SzEweFVNdjhzeXVjNk1M?=
 =?utf-8?B?ckNmVmpEbENHTnl5Ry90YkhSQUpEMU9seTRISHlJeE9XK0RNZmlzZHlGOGs3?=
 =?utf-8?B?Q1pQbGVaMHBRQ25HV01BUWlpNHpublVaUFkxTHo4dDZlRWtSeUd0RDdYTU9O?=
 =?utf-8?B?Z3IxTTAzUS9vM2lGbnh1bFJEU2pjRUk2NUxNWDFORGk5UmJ6M2JvcHg1bkFO?=
 =?utf-8?B?VHo4REgyWGRpcXNTcURvYVIwTHdPUEhsVVF4aDdSOW1WNndKNSsxV294TXB6?=
 =?utf-8?B?Zkx1YVBmbHBianRhR1V6NlpuMS9jRFlYRXF5c2J5R1JKTFNkblcyTWorSTI4?=
 =?utf-8?B?TGdINUNORjJlY0VhMlRUUVNkUndsZE8zaUJvRTNkbXlpK3ZYL0lRM2I4NEZ5?=
 =?utf-8?B?TFpOVmRxaWcyWHMrb3NLS2hHc2RpVFgvNG9UbTB5SnVHdm5CUk9aSVU5b1ZB?=
 =?utf-8?B?ZDc2ZVNTaVplSGhzVlRZMmxnOXovR053aFNFVVhOVWdnSmREbzZjM1QrUnZM?=
 =?utf-8?B?N215WWYwWnpCQUJ5NkhhQUxvN0s1QW1NeTcrelA4NjJXdFlGTHo1WG5PL2hC?=
 =?utf-8?B?amVjOE1xNmtRSjU3VDMxRzF2ZjZSeXhuZ2wwQ0traEs0czZKdWptTkR5MnJk?=
 =?utf-8?B?aHNQaXBnVm5jNmZtWDcwcU5BazJVSnVDTFZsY3NNM2gwRTVwUW1aZFFyazlZ?=
 =?utf-8?B?Qk1YaU9VVi9zelk2Z3poTjRTaElCUWxNN0lualNPVktrdWk1TnBmalBwUnRu?=
 =?utf-8?B?REphN0tCdmd2eHFIbUhoeTJiZ3crNVh3OHJHcUYzdlNsN0ovNEZkenZtREl1?=
 =?utf-8?B?a1NzZFR4dkVZczF3RkFKbWZXWFJRWmJjY1pScnhhMkNUeVdiQW1qdEtYdXFu?=
 =?utf-8?B?b0EyeElXMDBLR3N4dVVZMWRZbVRTSFE1OUdmWTRmWkFHb250ZkVVZGE2WDAx?=
 =?utf-8?B?MDBJN2F2RW1aS2pPNngwbU1ZTGpZZCtvNnBnV3FFSmRJMlpYMDlwSHhIL0tm?=
 =?utf-8?B?V0Q1SkxYWlQ4cXBxTDlwK1EyWUZiYzB3cGlpaWlqYTZjMDN5MGhlTXIzYitT?=
 =?utf-8?B?UzNhS2E1alBNOEduZzdSeEFrU0JNd2E3b3R6cmFhdzdFT0VSU1p4WndDOEdq?=
 =?utf-8?B?VWZaVzdGUFk0SHQzUjd4WlFwRmswSldpUlZrMElVT00zTktjOWdsSy8wbHV2?=
 =?utf-8?B?U2ZyUDBmMS9MS1Z0VWhqZXoxWjhaSG1yNTFvVFRtbytlQm9hbnJLQXg2YUZr?=
 =?utf-8?Q?Ml73k7y69FGdlZqIRrAuXzwdwjBx2Lrx2CBV5C3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8B3C0C462A77F42B2D9F5BF140AC70D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136b3300-56ee-4bfb-ec82-08d9921ee3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 10:06:02.0431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ji50GMHrYtM5Ip9nh3vceSUxGBbzPP3zBQmB6e23OLbMJhKxa7mQv+XKSSpRg7DgEKvwvi2P2aQI5xxR106MKKhdR4L5GWC22JMT5FeChS736fI+WxuWDhzwQlzPQuiP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2659
X-Proofpoint-GUID: mvdLd9EYaU3NBweZyVy9Zppo5WwAUb7v
X-Proofpoint-ORIG-GUID: mvdLd9EYaU3NBweZyVy9Zppo5WwAUb7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_03,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180063

SGksIEphbiENCg0KT24gMTguMTAuMjEgMTA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAx
NS4xMC4yMDIxIDE4OjUxLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gLS0tIC9kZXYvbnVs
bA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gQEAgLTAsMCArMSw3NyBAQA0KPj4g
Ky8qDQo+PiArICogeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gKyAqDQo+PiArICogVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2Rp
ZnkNCj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieQ0KPj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yDQo+PiArICogKGF0IHlvdXIg
b3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgcHJvZ3JhbSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPj4gKyAq
IGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJh
bnR5IG9mDQo+PiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZQ0KPj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3JlIGRldGFpbHMuDQo+PiArICovDQo+PiArI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPj4g
KyNpbmNsdWRlIDx4ZW4vdnBjaS5oPg0KPj4gKw0KPj4gKyNpbmNsdWRlIDxhc20vbW1pby5oPg0K
Pj4gKw0KPj4gK3N0YXRpYyBpbnQgdnBjaV9tbWlvX3JlYWQoc3RydWN0IHZjcHUgKnYsIG1taW9f
aW5mb190ICppbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnaXN0ZXJfdCAq
ciwgdm9pZCAqcCkNCj4+ICt7DQo+PiArICAgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+ICsgICAgLyog
ZGF0YSBpcyBuZWVkZWQgdG8gcHJldmVudCBhIHBvaW50ZXIgY2FzdCBvbiAzMmJpdCAqLw0KPj4g
KyAgICB1bnNpZ25lZCBsb25nIGRhdGE7DQo+PiArDQo+PiArICAgIC8qIFdlIGlnbm9yZSBzZWdt
ZW50IHBhcnQgYW5kIGFsd2F5cyBoYW5kbGUgc2VnbWVudCAwICovDQo+PiArICAgIHNiZGYuc2Jk
ZiA9IFZQQ0lfRUNBTV9CREYoaW5mby0+Z3BhKTsNCj4+ICsNCj4+ICsgICAgaWYgKCB2cGNpX2Vj
YW1fcmVhZChzYmRmLCBFQ0FNX1JFR19PRkZTRVQoaW5mby0+Z3BhKSwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAxVSA8PCBpbmZvLT5kYWJ0LnNpemUsICZkYXRhKSApDQo+PiArICAgIHsN
Cj4gSGVyZSBpdCBpcyBxdWl0ZSBjbGVhciB0aGF0IHRoZSBTQkRGIHlvdSBwYXNzIGludG8gdnBj
aV9lY2FtX3JlYWQoKSBpcw0KPiB0aGUgdmlydHVhbCBvbmUuDQpOb3QgcmVhbGx5IHlldA0KPiAg
IFRoZSBmdW5jdGlvbiB0aGVuIGNhbGxzIHZwY2lfcmVhZCgpLCB3aGljaCBpbiB0dXJuDQo+IHdp
bGwgY2FsbCB2cGNpX3JlYWRfaHcoKSBpbiBhIG51bWJlciBvZiBzaXR1YXRpb25zIChmaXJzdCBh
bmQgZm9yZW1vc3QNCj4gd2hlbmV2ZXIgcGNpX2dldF9wZGV2X2J5X2RvbWFpbigpIHJldHVybnMg
TlVMTCkuIFRoYXQgZnVuY3Rpb24gYXMgd2VsbA0KPiBhcyBwY2lfZ2V0X3BkZXZfYnlfZG9tYWlu
KCkgdXNlIHRoZSBwYXNzZWQgaW4gU0JERiBhcyBpZiBpdCB3YXMgYQ0KPiBwaHlzaWNhbCBvbmU7
IEknbSB1bmFibGUgdG8gc3BvdCBhbnkgdHJhbnNsYXRpb24uIFlldCBJIGRvIHJlY2FsbA0KPiBz
ZWVpbmcgYXNzaWdubWVudCBvZiBhIHZpcnR1YWwgZGV2aWNlIGFuZCBmdW5jdGlvbiBudW1iZXIg
c29tZXdoZXJlDQo+IChwZXJoYXBzIGFub3RoZXIgb2YgdGhlIHJlbGF0ZWQgc2VyaWVzKSwgc28g
dGhlIG1vZGVsIGFsc28gZG9lc24ndA0KPiBsb29rIHRvIGFzc3VtZSAxOjEgbWFwcGluZyBvZiBT
QkRGLg0KPg0KQXQgdGhlIHRpbWUgb2YgdGhpcyBwYXRjaCB3ZSBkbyBub3QgeWV0IGhhdmUgYSB2
aXJ0dWFsIHRvcG9sb2d5DQppbXBsZW1lbnRlZCB3aGljaCBpcyBhZGRlZCBhdCBhIGxhdGVyIHN0
YWdlLg0KU28sIHdoZW4gYSBEb21VIHBlcmZvcm1zIFBDSSBlbnVtZXJhdGlvbiBpdCBzZWVzIGFs
bCB0aGUgcmVhbA0KUENJIEhXIGFuZCB0aHVzIGRpc2NvdmVycyBhbGwgUENJIGRldmljZXMgd2l0
aCB0aGVpciAqcmVhbCBTQkRGcyosDQplLmcuIGp1c3QgbGlrZSB3ZSBwYXNzIHRocm91Z2ggYWxs
IHRoZSB0b3BvbG9neSB0byB0aGUgZ3Vlc3QuDQpTbywgaW4gdGhlIHF1ZXN0aW9uLCBTQkRGcyBh
cmUgcGh5c2ljYWw=

