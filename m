Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A74AD577
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267989.461767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNeD-0002fn-Om; Tue, 08 Feb 2022 10:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267989.461767; Tue, 08 Feb 2022 10:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNeD-0002dP-Jc; Tue, 08 Feb 2022 10:22:57 +0000
Received: by outflank-mailman (input) for mailman id 267989;
 Tue, 08 Feb 2022 10:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHNeB-0002Ax-GF
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:22:55 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 129dea65-88c9-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:22:53 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2189rjf0002986;
 Tue, 8 Feb 2022 10:22:49 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3p9gr461-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 10:22:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB8PR03MB5484.eurprd03.prod.outlook.com (2603:10a6:10:106::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 10:22:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:22:45 +0000
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
X-Inumbo-ID: 129dea65-88c9-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaY6jq5GO9igg0SYniZ6O3K8MEMaz9O656QFbLc0//jNz7wkSkO7Gi7kVzDRMBURx+QE6lXyLvE9QPFdcmgpxqYFhRiBswR4Orc/TrN66nO2ybXmErjFKWpZ6dBDI1TFHtexAzO//4P11ah8SGdCeZAz4kUBk4dLgezc3mvjttlbZXMVyjvyhK+ZYlRRap4urJaA5PiFbSYeJfg16pePfQEmhGT0ju7e25bUrdHz2Ozr2ZizLIVAyztRTRDuH1kCDNGXZCmLXWUI8jpNfkNt2TS43iiv1g5VI/cy5us4Oz2l+uzNTkVNob6hZsplHSxgPcRcs21M2NOtVcAnwSqfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJUyAo0jW1J0+ga7HlrzqC5OcvxEppGSq93D+3FRDqQ=;
 b=a6MPm1gu/DPV1/HJsOiLUg6edjBvdEE4QsgeMpyVCM2rC+OBbkD8TuZuq206f93Wu0OHUgsyYIhncXeq9rOvEJYr8BynWQFn4U+bci+q9PjLcdZv1dzF+9/rIYUaOWaj3QnMO7kfCgEPdqMQ4Sw8OLxtWZJqOkR4EYw+oaEbjyj1G7mFp14mPqy9JtLm20TnJZvlDofYHtXYJMjRIfnwgpcQb8ZCJAYDG1bJ+FwmL9U5F4x8KfW1UFIkV8aAyv/i/bWduVEpDVtez29nQ2Wg/PEaFntvL3KJ2fo2QtwCPzv7t94pdw7gwKfBOg5SCdIJrUatCVelC7Nur3wbICUpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJUyAo0jW1J0+ga7HlrzqC5OcvxEppGSq93D+3FRDqQ=;
 b=i7M7hAeRd6EQ7Lhgvc+Yu/q2O+xIodLE6Z3Ai6ALgGoJLidaAKyVDXVivrLiGIkyFCYzNCdyzjl3gbesoGxCmfJdRIACBq6Fl8rGrNq0GIrtsrWo8VtenKKYGo6eA24FVg5yQCMJOaP4t754jK4qEzEnr9bNYxcL8Xs21urDIs+bM4ragNEL5rooO4IfHyzGjUMzmtb5OJwQ5HosN0dr5/RTH0uTPMW/xbTb+NwL5HW3qsXn+XNz6opZ6uBeUnvR4NqEwOexxcryJSb3m8eTIj1/eKyr0crJgtN9+fKMYmTDFKuQZnM0TgqqvFCZxe4wNNhHhKgmR4YqtjK7Ohjs5A==
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
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: 
 AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNICAAAt2AIAAA+uAgAAEsACAAAMyAIAABAgAgAADmAA=
Date: Tue, 8 Feb 2022 10:22:45 +0000
Message-ID: <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
 <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
 <15c16171-f196-38d2-370c-38627935a21b@suse.com>
In-Reply-To: <15c16171-f196-38d2-370c-38627935a21b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c968c3c8-3ce8-44b6-1cc5-08d9eaecf288
x-ms-traffictypediagnostic: DB8PR03MB5484:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB8PR03MB5484AA90F45B788596A44AB0E72D9@DB8PR03MB5484.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xwgF3Mr2fq5ZXWBUahrGRm3sQKIUwWuRU7o+8gpVOL6+VT4OxPS5jFFzBjjAwhitNT5BLPbSXf7DQFDVt+LKATcEp3kmHcQB7EG2G5wCIB6S9ikCalhG1jf17J/J9AM24KEPuIrPkyHme/WR496ZOZGz1t8sEYehuMV6MNnZdLQj2Bb/3YIlj89iQJ0Bny6Omx6pdKjVSjJ2uX7qIaiuTmlawZTWYHLCF3uslVbk9VxvbAQf/ZlMV/ZB/8HOfocP9XxrPnINtEWiJZZatHcUIyWo0WxKEG2gzr+BmfZwiCUCLf+ZozEIuKm7f/Ld4rhOTt8U0tPN2aLpIYYxrd6mCCXU+By0cXeqW9eMi6fw5k3GD4IrU5NL/4b3f3O2x5P0m1qfB5Itu8X06Px6gl9u8dn1H+Na9qSTlhG1Rd6xtkHXvzY3HBdVddTBt3sSr8WSOzToHCKBH6auk1UX4iZwbg3aK6BGVXR27G5Fbpf1+s8R7TduOT7pplPdfkcVbqTiK4ORmg8JUos31yQeqJmm7mForEUypQ7CGDqRXTJb2FYtXCp8wZjzQEGsNl41heqkXF0xZ7v2Kod5GE67MBQsaTk5Gu1Q18mKMIok1xwj4vNJuLj7yltr73yTrK3KCBLPTeDvD2KAeYyaHDf3hvN/FnxL27RNEzYntbeHOnYL/3V8gtQrJj60BtzVDOQmAiG02kaf6mcqN8it7uCsq0sd2cTBQ/GywHVI+SE4cnSD6v84N/SUyJZpT1S/Qc1frjXW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(36756003)(55236004)(53546011)(107886003)(6916009)(8676002)(6512007)(83380400001)(31686004)(76116006)(66946007)(91956017)(8936002)(2616005)(66446008)(508600001)(38100700002)(26005)(186003)(66556008)(71200400001)(6506007)(54906003)(66476007)(316002)(7416002)(2906002)(38070700005)(5660300002)(31696002)(122000001)(4326008)(86362001)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bjZzdG9kdWlFZmNrZnFwdUZWQ04xdWhOK3puaXJaUDhWSjJaS2VWbVRLaDZu?=
 =?utf-8?B?SDcvV3Ivb25hbDNkRTBRM0FsTjZOK29PM1FZODZJd01ObWpMTXg0L2tCZFZq?=
 =?utf-8?B?TXFXQWptTittRFplNmV2K0tiNzNxWi9jRmd5c0FxRWdiL2hPcE1ucHkrK3JQ?=
 =?utf-8?B?TC95NVFLcjRTUkpXZkYyRkk5UWxCa3ZRU21SQTd6WGFmdmpqR2pGZ3lJUzhi?=
 =?utf-8?B?Y3hYZ3NCcERrK0ErS1RQWEw1Z2grbSswa2RvNkRqQ0xvNHd0dkMyTC83S3Nx?=
 =?utf-8?B?RE1GSCtOYnFHdUg4ZnEwb2cwb0RkMXZ3b0YvUm5SNFh4djgwb1FsLzNhUVJD?=
 =?utf-8?B?Q0hkVk1HVmVOZGd6SDc2SHRoeXd4VlRWa0lPbmgwYWx3SnR1alk0STJNQUda?=
 =?utf-8?B?UG8vUTdkMWVHNm03NzRzRVhOWkVZS0hHakNoR3Flak5XL2pNZXA4RmpWQ1VD?=
 =?utf-8?B?WCsxcDc1UEY1UUJkT0s2b004T1VUekovNzZzREFUZUM1MDRMdllqaDgwVVhu?=
 =?utf-8?B?YytXZllGajd5RnRuVDhDSW5zN2w3TEtEU1J2YktWV00wVktUNUQvVURCNzV3?=
 =?utf-8?B?YWlwOUQyeDJzRCtDZjNxNGNUakFqMHhLbXVlRGVkRS9FV1QrZjdHRHhYZ0xE?=
 =?utf-8?B?ejFmbjIycHcyeUJnQlNLZk5lNkp6dlQ1YmdaVlE2elBHTEdHNksrWFliYTFE?=
 =?utf-8?B?cnoxcERuU2FaOHYrZ1ZsSjRWZkpUZmE5VGtTV3RLaDMySnV2Rmt4WUJBeWFk?=
 =?utf-8?B?c1N6RXJrUDZYK3IwVmU1eUc5K1B2NmNiYnRIUzM5M3pMWG84NEhBNXhnNU1V?=
 =?utf-8?B?SzNYeE1UdjkvZFhLTXdNamlSSVU5VHA5bWVxSjZxTzVvaVBKU2hZcC9oanUz?=
 =?utf-8?B?M2E0R0hZcE1xaDJLdWd3TFg4ZnhJdi9EdGVNWlB2dXdsWUFQSURRbGVvNHhp?=
 =?utf-8?B?c0IrTE9UOVJ4Q3E4SGxTbjdHUzNpRFh6Y0JhNFBGWDE3d3ZjQU10SUxBbUlU?=
 =?utf-8?B?M0YvM24xTWY5d2RNNkZRRGxIbG8rUnArUzIrODFyU2dmZ3VqTDJDNG5aK004?=
 =?utf-8?B?RlN6cXVsaElXR0tFcHlDRmhrWkFqclVEVUZubVBYZ2sydG1MZExRQTdHSlFM?=
 =?utf-8?B?eU5TbXQxb2NLMFdLN0xWQnZFZW5WaFF6OWdzMkJLMndFbmlSeEJoMzJJbC9x?=
 =?utf-8?B?Zi9TOFZsNklMRGF3VFFiZU9qSFF1dEpndktwelZxNkZwL1NTUzV3REF1TkNy?=
 =?utf-8?B?VnBuYS9DTk03T2JYTDR4ZURGekhwK2haZVJ4eC9HS3RiUEVVK1Q2NWlOQVdo?=
 =?utf-8?B?RmVlMWlieTE5MkdkcmpyUGE3eHVYK3RWeVRwdWUyUm12cmVuRzF0bFBuVGtX?=
 =?utf-8?B?RXBsZFd5UHNHVlpyRVBOdzJjeXRLMEJlSVY2UGxNRlR4U09mSmkxSGdWUnMv?=
 =?utf-8?B?ZzQ1dFFhdkxIcXVkYitQTmdnWC9CV0thQXdDMitCSzVQcDRWVGkxRUx2SEJM?=
 =?utf-8?B?SGpHUUt0TkNoNmdTTXR2RjhQc081WEY0UVpDcE9UdDNsNmNkVmEwaHpqRWQz?=
 =?utf-8?B?aWtCMng2OWJoK1lRRE9aT3Zpc1ZFU3ZZTEsydkYvS0tocysxNmNwbURwcDBl?=
 =?utf-8?B?QXJuRFY0TzZxbGhIdEwzcWc0Z0QwaWRBQzIrcmI3VDJNR0UxRmpyUHMwNldJ?=
 =?utf-8?B?eW1zM3U4NkhiYmFCNThPUm9hQmh1MlZiWkxVME5iZ2tJbWpRS3JQa2F6OEF0?=
 =?utf-8?B?di9sYnNtYlQ5clJwOVQzdnMzb1l4dEN6V3FwVVJhZDgxclFWWnNuS29KNUpI?=
 =?utf-8?B?RDg1REF3bHhaZEdHLzA4R2JSN05FOSt0QXEzbHRRM3BCSU53b3o3ZEVkR2JW?=
 =?utf-8?B?N3E1NmRVQUNENXZOUVo1MHBLVmNJK0kydWpFYjV6WUZuSXRwZk12RkRzOUZO?=
 =?utf-8?B?M0pQdGNyNlFWN3F6UklNckUvdWNoVG0yZm1jdFdsa0luL0tRTHRKY0s4M01Q?=
 =?utf-8?B?R0E3SjFCb21LVnN6WGMraGUvdlJDVC9UVW1rbDhmdnY3WGRYeXJSSzZKN1B6?=
 =?utf-8?B?Zk1VL0JSTjVGSjFiZGV1SWkzcWVFTVBNaGd4TVAxZ1FrUURVMkZRakJTZnly?=
 =?utf-8?B?S3p5Q042aS9WYmxaRkJScktNaFJVR056K1gwWDBybjl6aS9BbVNJNS9SRHF4?=
 =?utf-8?B?SG9zMzYvaElURGVLOWVZOGszOXFsS3UxcndxOGNDcnppMVpWcktiamNVbHh3?=
 =?utf-8?B?NlMvck9YWnhyMi9KT1BQYTRCMEFJUFNjV3BBVDVoL0E3WEEwMDRMK1EwWDdT?=
 =?utf-8?B?dzBaZjJXRHNCWmRKOXhEMXZCTkE0SWpJUGtzdzJzcncxSGNlZjJnVU4yYVBz?=
 =?utf-8?Q?tt46j8Ho8B2Bgc38=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEB54DA837D43C4FBCA255A03BB9AEB9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c968c3c8-3ce8-44b6-1cc5-08d9eaecf288
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:22:45.0574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vynGlPcljLTwr91Mee7qk9iOyRav+QcahtoU5RouxTRID/3hvngEEtqALOt6sNxOTEqnSoYwagAvij9s0hk92Jd1pa524nq5ANlzrz2wmrBjMkQDN3q9H5KahZQ1tZMT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5484
X-Proofpoint-ORIG-GUID: 6Card1H_3_3w6X21X8_j6bcwcUqXvOPZ
X-Proofpoint-GUID: 6Card1H_3_3w6X21X8_j6bcwcUqXvOPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080059

DQoNCk9uIDA4LjAyLjIyIDEyOjA5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAxMDo1NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDguMDIu
MjIgMTE6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjAyLjIwMjIgMTA6MjcsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwOC4wMi4yMiAxMToxMywgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwOC4wMi4yMDIyIDA5OjMyLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNy4wMi4yMiAxODoyOCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gQEAgLTE1MDcsNiArMTUxMSw4IEBAIHN0YXRpYyBpbnQgYXNz
aWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1
MzIgZmxhZykNCj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX3RvX2Rl
dihwZGV2KSwgZmxhZyk7DQo+Pj4+Pj4+PiAgICAgICAgICB9DQo+Pj4+Pj4+PiAgICAgIA0KPj4+
Pj4+Pj4gKyAgICByYyA9IHZwY2lfYXNzaWduX2RldmljZShkLCBwZGV2KTsNCj4+Pj4+Pj4+ICsN
Cj4+Pj4+Pj4+ICAgICAgIGRvbmU6DQo+Pj4+Pj4+PiAgICAgICAgICBpZiAoIHJjICkNCj4+Pj4+
Pj4+ICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORyAiJXBkOiBhc3NpZ24gKCVw
cCkgZmFpbGVkICglZClcbiIsDQo+Pj4+Pj4+IFRoZXJlJ3Mgbm8gYXR0ZW1wdCB0byB1bmRvIGFu
eXRoaW5nIGluIHRoZSBjYXNlIG9mIGdldHRpbmcgYmFjayBhbg0KPj4+Pj4+PiBlcnJvci4gSVNU
UiB0aGlzIGJlaW5nIGRlZW1lZCBva2F5IG9uIHRoZSBiYXNpcyB0aGF0IHRoZSB0b29sIHN0YWNr
DQo+Pj4+Pj4+IHdvdWxkIHRoZW4gdGFrZSB3aGF0ZXZlciBhY3Rpb24sIGJ1dCB3aGF0ZXZlciBp
dCBpcyB0aGF0IGlzIHN1cHBvc2VkDQo+Pj4+Pj4+IHRvIGRlYWwgd2l0aCBlcnJvcnMgaGVyZSB3
YW50cyBzcGVsbGluZyBvdXQgaW4gdGhlIGRlc2NyaXB0aW9uLg0KPj4+Pj4+IFdoeT8gSSBkb24n
dCBjaGFuZ2UgdGhlIHByZXZpb3VzbHkgZXhwZWN0ZWQgZGVjaXNpb24gYW5kIGltcGxlbWVudGF0
aW9uDQo+Pj4+Pj4gb2YgdGhlIGFzc2lnbl9kZXZpY2UgZnVuY3Rpb246IEkgdXNlIGVycm9yIHBh
dGhzIGFzIHRoZXkgd2VyZSB1c2VkIGJlZm9yZQ0KPj4+Pj4+IGZvciB0aGUgZXhpc3RpbmcgY29k
ZS4gU28sIEkgc2VlIG5vIGNsZWFyIHJlYXNvbiB0byBzdHJlc3MgdGhhdCB0aGUgZXhpc3RpbmcN
Cj4+Pj4+PiBhbmQgbmV3IGNvZGUgcmVsaWVzIG9uIHRoZSB0b29sc3RhY2sNCj4+Pj4+IFNheWlu
ZyBoYWxmIGEgc2VudGVuY2Ugb24gdGhpcyBpcyBoZWxwaW5nIHJldmlldy4NCj4+Pj4gT2sNCj4+
Pj4+Pj4gV2hhdCdzIGltcG9ydGFudCBpcyB0aGF0IG5vIGNhbGxlciB1cCB0aGUgY2FsbCB0cmVl
IG1heSBiZSBsZWZ0IHdpdGgNCj4+Pj4+Pj4gdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgZGV2aWNl
IGlzIHN0aWxsIG93bmVkIGJ5IHRoZSBvcmlnaW5hbA0KPj4+Pj4+PiBkb21haW4uIFdpdGggaG93
IHlvdSBoYXZlIGl0LCB0aGUgZGV2aWNlIGlzIGdvaW5nIHRvIGJlIG93bmVkIGJ5IHRoZQ0KPj4+
Pj4+PiBuZXcgZG9tYWluLCBidXQgbm90IHJlYWxseSB1c2FibGUuDQo+Pj4+Pj4gVGhpcyBpcyBu
b3QgdHJ1ZTogdnBjaV9hc3NpZ25fZGV2aWNlIHdpbGwgY2FsbCB2cGNpX2RlYXNzaWduX2Rldmlj
ZQ0KPj4+Pj4+IGludGVybmFsbHkgaWYgaXQgZmFpbHMuIFNvLCB0aGUgZGV2aWNlIHdvbid0IGJl
IGFzc2lnbmVkIGluIHRoaXMgY2FzZQ0KPj4+Pj4gTm8uIFRoZSBkZXZpY2UgaXMgYXNzaWduZWQg
dG8gd2hhdGV2ZXIgcGRldi0+ZG9tYWluIGhvbGRzLiBDYWxsaW5nDQo+Pj4+PiB2cGNpX2RlYXNz
aWduX2RldmljZSgpIHRoZXJlIG1lcmVseSBtYWtlcyBzdXJlIHRoYXQgdGhlIGRldmljZSB3aWxs
DQo+Pj4+PiBoYXZlIF9ub18gdlBDSSBkYXRhIGFuZCBob29rcyBpbiBwbGFjZSwgcmF0aGVyIHRo
YW4gc29tZXRoaW5nDQo+Pj4+PiBwYXJ0aWFsLg0KPj4+PiBTbywgdGhpcyBwYXRjaCBpcyBvbmx5
IGRlYWxpbmcgd2l0aCB2cGNpIGFzc2lnbi9kZS1hc3NpZ24NCj4+Pj4gQW5kIGl0IHJvbGxzIGJh
Y2sgd2hhdCBpdCBkaWQgaW4gY2FzZSBvZiBhIGZhaWx1cmUNCj4+Pj4gSXQgYWxzbyByZXR1cm5z
IHJjIGluIGFzc2lnbl9kZXZpY2UgdG8gc2lnbmFsIGl0IGhhcyBmYWlsZWQNCj4+Pj4gV2hhdCBl
bHNlIGlzIGV4cGVjdGVkIGZyb20gdGhpcyBwYXRjaD8/DQo+Pj4gVW50aWwgbm93IGlmIGFzc2ln
bl9kZXZpY2UoKSByZXR1cm5zIGFuIGVycm9yLCB0aGlzIHRlbGxzIHRoZSBjYWxsZXINCj4+PiB0
aGF0IHRoZSBkZXZpY2UgZGlkIG5vdCBjaGFuZ2Ugb3duZXJzaGlwOw0KPj4gTm90IHN1cmUgdGhp
cyBpcyB0aGUgY2FzZToNCj4+ICAgwqDCoMKgIGlmICggKHJjID0gaW9tbXVfY2FsbChoZC0+cGxh
dGZvcm1fb3BzLCBhc3NpZ25fZGV2aWNlLCBkLCBkZXZmbiwNCj4+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNpX3RvX2RldihwZGV2KSwgZmxh
ZykpICkNCj4+IGlvbW11X2NhbGwgY2FuIGxlYXZlIHRoZSBuZXcgb3duZXJzaGlwIGV2ZW4gbm93
IHdpdGhvdXQNCj4+IHZwY2lfYXNzaWduX2RldmljZS4NCj4gRGlkIHlvdSBjaGVjayB0aGUgYWN0
dWFsIGhvb2sgZnVuY3Rpb25zIGZvciB3aGVuIGV4YWN0bHkgdGhlIG93bmVyc2hpcA0KPiBjaGFu
Z2UgaGFwcGVucy4gRm9yIGJvdGggVlQtZCBhbmQgQU1EIGl0IGlzIHRoZSBsYXN0IHRoaW5nIHRo
ZXkgZG8sDQo+IHdoZW4gbm8gZXJyb3IgY2FuIG9jY3VyIGFueW1vcmUuDQpUaGlzIGZ1bmN0aW9u
YWxpdHkgZG9lcyBub3QgZXhpc3QgZm9yIEFybSB5ZXQsIHNvIHRoaXMgaXMgdXAgdG8gdGhlDQpm
dXR1cmUgc2VyaWVzIHRvIGFkZCB0aGF0Lg0KDQpXUlQgdG8gdGhlIGV4aXN0aW5nIGNvZGU6DQoN
CnN0YXRpYyBpbnQgYW1kX2lvbW11X2Fzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTgg
ZGV2Zm4sDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dTMyIGZsYWcpDQp7DQogwqDCoMKgIGlmICggIXJjICkNCiDCoMKgwqDCoMKgwqDCoCByYyA9IHJl
YXNzaWduX2RldmljZShwZGV2LT5kb21haW4sIGQsIGRldmZuLCBwZGV2KTsgPDw8PDwgdGhpcyB3
aWxsIHNldCBwZGV2LT5kb21haW4NCg0KIMKgwqDCoCBpZiAoIHJjICYmICFpc19oYXJkd2FyZV9k
b21haW4oZCkgKQ0KIMKgwqDCoCB7DQogwqDCoMKgwqDCoMKgwqAgaW50IHJldCA9IGFtZF9pb21t
dV9yZXNlcnZlX2RvbWFpbl91bml0eV91bm1hcCgNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZCwgaXZyc19tYXBwaW5nc1tyZXFfaWRdLnVuaXR5X21hcCk7DQoN
CiDCoMKgwqDCoMKgwqDCoCBpZiAoIHJldCApDQogwqDCoMKgwqDCoMKgwqAgew0KIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJpbnRrKFhFTkxPR19FUlIgIkFNRC1WaTogIg0KIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidW5pdHktdW5tYXAgZm9yICVwZC8lMDR4OiUwMng6
JTAyeC4ldSBmYWlsZWQgKCVkKVxuIiwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZCwgcGRldi0+c2VnLCBwZGV2LT5idXMsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pLCByZXQpOw0KIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluX2NyYXNoKGQpOw0KIMKgwqDCoMKgwqDCoMKgIH0N
ClNvLi4uLg0KDQpUaGlzIGlzIElNTyB3cm9uZyBpbiB0aGUgZmlyc3QgcGxhY2UgdG8gbGV0IElP
TU1VIGNvZGUgYXNzaWduIHBkZXYtPmRvbWFpbi4NClRoaXMgaXMgc29tZXRoaW5nIHRoYXQgbmVl
ZHMgdG8gYmUgZG9uZSBieSB0aGUgUENJIGNvZGUgaXRzZWxmIGFuZA0Kbm90IHJlbHlpbmcgb24g
ZWFjaCBJT01NVSBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbg0KPg0KPiAgIE15IHVuZGVyc3RhbmRp
bmcgaXMgdGhhdCB0aGUgcm9sbC1iYWNrIGlzDQo+PiBleHBlY3RlZCB0byBiZSBwZXJmb3JtZWQg
YnkgdGhlIHRvb2xzdGFjayBhbmQgdnBjaV9hc3NpZ25fZGV2aWNlDQo+PiBkb2Vzbid0IHByZXZl
bnQgdGhhdCBieSByZXR1cm5pbmcgcmMuIEV2ZW4gbW9yZSwgYmVmb3JlIHdlIGRpc2N1c3NlZA0K
Pj4gdGhhdCBpdCB3b3VsZCBiZSBnb29kIGZvciB2cGNpX2Fzc2lnbl9kZXZpY2UgdG8gdHJ5IHJl
Y292ZXJpbmcgZnJvbQ0KPj4gYSBwb3NzaWJsZSBlcnJvciBlYXJseSB3aGljaCBpcyBkb25lIGJ5
IGNhbGxpbmcgdnBjaV9kZWFzc2lnbl9kZXZpY2UNCj4+IGludGVybmFsbHkuDQo+IFllcywgYnV0
IHRoYXQncyBvbmx5IHBhcnQgb2YgaXQuIEl0IGF0IGxlYXN0IG5lZWRzIGNvbnNpZGVyaW5nIHdo
YXQNCj4gZWZmZWN0cyBoYXZlIHJlc3VsdGVkIGZyb20gb3BlcmF0aW9ucyBwcmlvciB0byB2cGNp
X2Fzc2lnbl9kZXZpY2UoKS4NClRha2luZyBpbnRvIGFjY291bnQgdGhlIGNvZGUgc25pcHBldCBh
Ym92ZTogd2hhdCBpcyB5b3VyIGV4cGVjdGF0aW9uDQpmcm9tIHRoaXMgcGF0Y2ggd2l0aCB0aGlz
IHJlc3BlY3Q/DQoNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

