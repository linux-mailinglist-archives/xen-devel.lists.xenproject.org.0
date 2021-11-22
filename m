Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5DA458A91
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228640.395692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4jh-0008Je-NY; Mon, 22 Nov 2021 08:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228640.395692; Mon, 22 Nov 2021 08:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4jh-0008H7-KU; Mon, 22 Nov 2021 08:31:37 +0000
Received: by outflank-mailman (input) for mailman id 228640;
 Mon, 22 Nov 2021 08:31:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mp4jg-0008H1-EO
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:31:36 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98520cce-4b6e-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 09:31:32 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM6vlPx018581;
 Mon, 22 Nov 2021 08:31:29 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cg5w8rdt9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:31:28 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB5925.eurprd03.prod.outlook.com (2603:10a6:20b:ef::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 08:31:25 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 08:31:24 +0000
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
X-Inumbo-ID: 98520cce-4b6e-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjqHsJ63hPJZw9BFqoAh55pHyIjbOcIPzhOhOGRIpponGOrsvPefut9R4vbI+17UFo+m4rqAHMr5SLl/3XqRcWSBVtnoBW1BQL2zvpUos1G6IOawWB1MktxjzDBwTSG1y1NUJeBkTX7Uz9aJ9EV6X+aMi4//RwDUQ6tJkgOYNOapFsM2nRyxFlGzXnTh/K8VLzlBoKttoxxqfc0PTGDRDKyN4XTInglOGh54GuRaBZ7G3tGOvP1TxeBgtprO4Wp2OThZNZX3dpqacO7GzPMQXRLu4+Y3SttrFt5pweCx51vmhndQm8CyC0xHk0ipOPYNGTS3GRbsgs1h80CBloxCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vlb9O0FZ+ezamRlJEaQGBYMlgxlo0aPY5iBpq1f2UDg=;
 b=G7AeStEDMq6P8RjnF6cQaJLTlQQ45LvpIhznKwf4xCuX5GaDYAbwi5Yeyl8vjeKTT1OdKSPfBffhP5YchOk6RVzyVjF7dwsWVZvYDEGzi7JKZ8qcawIuFFZ4aN2T1Z8LU4YvvgP5+01GBbGX9bCqjOMYkY+KnZdPrPVUURCTom1clHVIiwdhsx+N0ZSbWJFNnEU7T61uCLJdkTJL3xkueW+9qKWhA+MGpQeZJ8Iec5U+ZOiFrfcVXTpr5m9NblSmG+27ij9V9MlIGwwO65ghLVTNgeMIAdDo3uwwZhPDwGMcR66lnFtdBmqihAEFINOi6D+0hBTlKQMcYxyMcwDAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vlb9O0FZ+ezamRlJEaQGBYMlgxlo0aPY5iBpq1f2UDg=;
 b=ciDNQrSMWXDo1KPLq3o3rneR0Kcy+Pq3wJu+A34klEIPYooKQY0zp0RfQGNTib4B11Wxw9031EDZZbujG+fmuFLNe/i4jFkqqKoBCKJ5moCl0uup2RPDiFnK+WoVIsJfRrAF+CcAcHI9sxVS23OZKZsXBzffIZc6XkzNQ2BDtAJzbA4RvTi3MsAy+N4IFFjzLTU2yFmdndiQibcGo9jILTzo5lNNIR1QP0YM3kmzMCa36Wq0E3WqmfnbeP6re0IRlk2+j4z6QkvOHjub9tE8NCGNGk4zoAdOFuq4pjoukIGphfi/XrF77e2BPDtxfFmmqloy0DplMJRRwIRlr7uqtw==
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
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Index: 
 AQHX0hJLwt+wJ2t1lka5jlbMIq7ZAqwK60SAgAAG0YCAAASpAIAAA16AgARWfwCAAAHqgA==
Date: Mon, 22 Nov 2021 08:31:24 +0000
Message-ID: <77333e14-76f1-c262-c3f1-f596fc7a3aa2@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <3a7f4c3a-7162-8cd3-0879-2f87572f0225@suse.com>
 <6b2d4825-3b00-4034-2804-a44059de15a1@epam.com>
 <fb72cae2-1b7e-8d52-48d0-2967c68325ea@suse.com>
 <8bd7e778-6ebd-2f50-8e96-e21b3bf06a11@epam.com>
 <7a56d501-3e3c-5537-65ef-ddf08b47aa99@suse.com>
In-Reply-To: <7a56d501-3e3c-5537-65ef-ddf08b47aa99@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df0d345e-202b-4864-7d4e-08d9ad927894
x-ms-traffictypediagnostic: AM6PR03MB5925:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB59252B2DBD1BAABE858312E1E79F9@AM6PR03MB5925.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3myo9GBSgeJ5F7EQEVxp80r3lA21CeTpPKwny07H786nyRVj+rois11rYZ01s/zyycpXZ5mWvnRfkSLU7yUSpTloIc+9m3rma68CSu2DPW32zFrCHN8Nkbf8uAXD5F46VWR30qC9n1JzgL0m+2LLVSpoPzn0SjZkVRk7tukxDBaecPXmw8sFpwoel6hYLGZNV23aLKirjo9JZpZ1fQ3A+172ecc5tMgRBFFSnmCe9AF2RkNwmyQHor+xppbbtbXrblGkA+P48AWRzziLdN8pqy1T9d3KaTGK8Kx8r6DxXsADYTFZUoWoqMNZevW4yb26icugpm0axr1QozfbhouVLyHa+Kn6BjVZ20sJ0UaJ3zHQrzNgqy3VQQP6NW4QR3cSNAR+UfuVaolRY+ZYhRvyjpH2VdKNtH0lZQDQ4db5BB4T/ZyrUvKGErwpxn/XBSmXjrzSeYZZuuEaQYJKpuY/WCNuMuF/4wi1EGciZXwa/dzZmJomuNkCZi07Vj2UuxFKVYqTCOyNG4S1z2EYPqIeeOqQbGDyj1EaB17SL2xc+y8yuPlJBwws79TuoAHxcMkPEpGLO8m2Suz5FQZV36wrMvGMhfx5IsGhZ6VaXUYZMNCJObIuo9dDO+0LlrOEiZMxCZqDyEGUVju9PWC7HUYPXHO2SBipT/UwK7cUJnCSm0z/J7JYCgulBo+B71QCKti1tAQ32xTMesWbUjk/Hc8SXZzIF8/jsJIct//S/F6w48GmaWIWw4e3B81ei2ekS1Sd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(6486002)(8936002)(54906003)(26005)(8676002)(2906002)(31686004)(38100700002)(316002)(55236004)(2616005)(5660300002)(4326008)(508600001)(6506007)(66946007)(38070700005)(186003)(76116006)(86362001)(71200400001)(31696002)(66446008)(64756008)(66556008)(66476007)(83380400001)(53546011)(36756003)(6916009)(122000001)(107886003)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkJmMlRGWmZSVDlTZEd1QXJxSVE2aEt3RkZOOXk2MzRvc1Z4NGd3ZGM1YVBj?=
 =?utf-8?B?SDlmRmxqS2RwSEFIbDNQNzBwc2FxdlhQY1ZxZEdMSWNnUFBvTG51ZC9FMWNj?=
 =?utf-8?B?VHc4WkF4YWZHUzdqTk5iclh6dWh2RUo5MGpUb0VEcXlVQ2lKSkRYb3h5UTJP?=
 =?utf-8?B?MU5vd25wai9XZFVTWHNQaS9XOTY3RUNSQVJBRVl4WEk3UVoyOSt0anlBMGwx?=
 =?utf-8?B?bitnMU9WQm1tUWxBT0pXM3BoeVNMTEhacDdRTC8vaitLdjQ0VUZlZmtFa1VZ?=
 =?utf-8?B?cUl4bVFnZkZVakVVTDVaQ09PWHh1ZEI0dmtwSFpZSnBrQjZ3MXI4bTFJVHY2?=
 =?utf-8?B?cmo2bG4vVHRkYy9YUDdnRlg0cys2VlF5Nm1MOWNnd01FUFFkMmhVdXFPcHhW?=
 =?utf-8?B?dVlEOURGWGR0WW14OTlLSzV3bkpVdGdTT016ZTFneTdVdUVPakFKYnIwUVdk?=
 =?utf-8?B?ckFzUFJLWk9NeEl3ZmxQSXJJcC9xQXRqNzhjNkFmSDBESUlkN0NsUytkVUk5?=
 =?utf-8?B?MFB4SzZqcS96blB3NDdKYjJUdHVHMzN0UUd6Ni9zcXlpYVEycE1IeUZRTE9N?=
 =?utf-8?B?VVZ6OHAwM0V5RHgvaWN3UDM5Y2tHNkNkYWJ0c0ltU0VxdnB2dkVua3BKU0dn?=
 =?utf-8?B?ZVRFVTlsM1VINm9LREx6YnBJRDVhL3VOZ0laTVc0d2o4dDdlM3JRSmFyUmFa?=
 =?utf-8?B?QnJEekpCa0NJZDh3ZHpzdlI4ZzR1ZldoQ0N6KzFtQ1ZNNHUvaFpUODRYcHI3?=
 =?utf-8?B?aExVRUVnb0V5TCs1cG5Dc2NIdVVNVFZhZE95OU9DaFM5YVM2OVRTMk1oZXNU?=
 =?utf-8?B?NVM1K3hvbUNuZXlCZ0Rja0FPQXl6dWdjWkhjVHJzVmNqSHFHckxOdDdsYU4v?=
 =?utf-8?B?RlczaTVEUWJxVEFXR0VLMGRtYmF0VUlxZmhncnYzcGdOc3RRbXk0UGZRWlBZ?=
 =?utf-8?B?SlRvcEFlRDEwSzhzcW51c2pBSEtsL3JFdUxHVEVuQXZ3OGFtTE81VWt6Vnhq?=
 =?utf-8?B?T3hDUXMzNmJvMjhBU2ZKVGhzZFQ5bElONGxjMTI1T0pnTFRlQ2VkNGRXeHYr?=
 =?utf-8?B?YUlTbjA0UVFuUm0wejJIQURNbnlMQ1ZVdjRWRUJQQWdHanhxeHFWUHloVUFO?=
 =?utf-8?B?aWJOS2xMdFdIWWVNT2NzSUpZQ0Q5akhqMlBIYUt5YlNzUHIvejdHVExaaGE5?=
 =?utf-8?B?cXUyNWU4eTNmdFRoR0pud2s1eDVRNGpoZk1TaHppQ1BLVTlEaDlDekJvbVRZ?=
 =?utf-8?B?R0dvVzI4cTY3c2orUlRwYVhsT0FDWkFhTmlCOWVDbzgxM2hwRE4zN2dHZGN1?=
 =?utf-8?B?SUZxZ2MvR3dDY0ZTZzJaNUhsNWhwTkdtY1JNV0YxT0Vrcjl5aGQ0MlVkMFhn?=
 =?utf-8?B?MjRIMmNKRUZocnlaOEl2OXBvdEtOU0NRNXQxYXlYazZNVU5Pd1Aya1ZRWUlz?=
 =?utf-8?B?RDQveWd2OXQ2c0JPZDJnZWhyYmw5eXlzYTlGN1djeTk1b1JjTTRTQlIyUE5x?=
 =?utf-8?B?SExBUUs5UEtOVW9adGZLU0tQdndPR0lBbGpzSndsN2VGMklnd3dER3FnOVJL?=
 =?utf-8?B?TmxDUU84cndqQnQrSXFsaGxvWjlDTkJkZjUvRXB3eTUvLzhHUHhXczJaWXBt?=
 =?utf-8?B?Lzdia0tCN2ZHY2Z4eEFZajVYUUh5WVBBcnJBRlF5YW1nRXZpUWIxZExZTld5?=
 =?utf-8?B?dkNjeG1IbGRTQkJJY3l2em1LVjkzOVIvUmRUYytMYUtFNnF3cnYzWlNwVUVC?=
 =?utf-8?B?cGptaDdLUlRpK3ZZYW9yU3ErbDZXMFd2cFBxQk5oTGNGbHdpeC8xdW13Mlh3?=
 =?utf-8?B?SklONjh3THZqbGRYR3N3MWhsQitIOVZPM3piNnd1Z1F2cWdjK29PM2lDS3Bm?=
 =?utf-8?B?REJGQm02NnlsbHhvMm1hMTdZSnBucVI3RE16d1dmQXdpTkdIMHd2cytCKzZi?=
 =?utf-8?B?MGtCelo0N0ZJYS9Qa0hlV1ExdkptdHV4dUpvcm1IeFhsd0ZCcVNnVWt0Z1Jh?=
 =?utf-8?B?bkJoeGExOVBHYmYrbHJLcERGcVFFT00wVUthVTQyMUlLcDdUNGVtdFBuaGZK?=
 =?utf-8?B?Q3NzakxwYUpSbkVWd1Azc1lWcTQzcGJ3U0dDNlIzZnJzK1pOU0hzK2VzejNH?=
 =?utf-8?B?U2VzdEQ4ck9kMUJKekJuTzNBRVRUcmtiU2hNYytKRmFJcWttand2TVRIRGJu?=
 =?utf-8?B?eTZGZlJldUJIeGtueXZTOHc2VXIrMUlSaERSRGVYSWRjamduMFJTYkEvMjlZ?=
 =?utf-8?B?SmFIdk1YRHJCcXFEZHdET2RTLzgxem9VNHBKWE93cmJZT3lzR2cwSit2MFB6?=
 =?utf-8?B?K2pHR0N1eWNqNk5LL0x6ZjhzQmxadkpKeVNScHdIUndSTDdzZ2RUUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A61D81A3A1789C42AE3C8DE7FA5C9366@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0d345e-202b-4864-7d4e-08d9ad927894
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 08:31:24.7910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uu2bzzXkdkcCE+o3/behbqEb04Fg5trbqw6u2PoNiFzeQZwUvCLVDbApv3pd+JH5gwMwTmLPniwMiyAIpAO1vun3VLeywW6I3+phFc3Q5fYW4x6iwgbUmZLVOS12REop
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5925
X-Proofpoint-ORIG-GUID: YzQUyh5y2_Ddeu3kXf4scIGvqrmrkpIz
X-Proofpoint-GUID: YzQUyh5y2_Ddeu3kXf4scIGvqrmrkpIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_04,2021-11-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 mlxlogscore=850 mlxscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220043

DQoNCk9uIDIyLjExLjIxIDEwOjI0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxNTowOSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
NTo1NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjAyMSAxNDo0MSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDE5LjExLjIxIDE1OjE2LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEBAIC05NSwxMCArMTAyLDI1IEBAIGludCB2cGNpX2FkZF9o
YW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+PiAgICAgICAgIElOSVRfTElTVF9I
RUFEKCZwZGV2LT52cGNpLT5oYW5kbGVycyk7DQo+Pj4+Pj4gICAgICAgICBzcGluX2xvY2tfaW5p
dCgmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICsgICAgaGVhZGVyID0g
JnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4+Pj4+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlf
U0laRShoZWFkZXItPmJhcnMpOyBpKysgKQ0KPj4+Pj4+ICsgICAgew0KPj4+Pj4+ICsgICAgICAg
IHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+Pj4+PiArDQo+Pj4+
Pj4gKyAgICAgICAgYmFyLT5tZW0gPSByYW5nZXNldF9uZXcoTlVMTCwgTlVMTCwgMCk7DQo+Pj4+
PiBJIGRvbid0IHJlY2FsbCB3aHkgYW4gYW5vbnltb3VzIHJhbmdlIHNldCB3YXMgY2hvc2VuIGJh
Y2sgYXQgdGhlIHRpbWUNCj4+Pj4+IHdoZW4gdlBDSSB3YXMgZmlyc3QgaW1wbGVtZW50ZWQsIGJ1
dCBJIHRoaW5rIHRoaXMgbmVlZHMgdG8gYmUgY2hhbmdlZA0KPj4+Pj4gbm93IHRoYXQgRG9tVS1z
IGdldCBzdXBwb3J0ZWQuIFdoZXRoZXIgeW91IGRvIHNvIHJpZ2h0IGhlcmUgb3IgaW4gYQ0KPj4+
Pj4gcHJlcmVxIHBhdGNoIGlzIHNlY29uZGFyeSB0byBtZS4gSXQgbWF5IGJlIGRlc2lyYWJsZSB0
byBleGNsdWRlIHRoZW0NCj4+Pj4+IGZyb20gcmFuZ2VzZXRfZG9tYWluX3ByaW50aygpICh3aGlj
aCB3b3VsZCBsaWtlbHkgcmVxdWlyZSBhIG5ldw0KPj4+Pj4gUkFOR0VTRVRGXyogZmxhZyksIGJ1
dCBJIHRoaW5rIHN1Y2ggcmVzb3VyY2VzIHNob3VsZCBiZSBhc3NvY2lhdGVkDQo+Pj4+PiB3aXRo
IHRoZWlyIGRvbWFpbnMuDQo+Pj4+IFdoYXQgd291bGQgYmUgdGhlIHByb3BlciBuYW1lIGZvciBz
dWNoIGEgcmFuZ2Ugc2V0IHRoZW4/DQo+Pj4+ICJ2cGNpX2JhciI/DQo+Pj4gRS5nLiBiYjpkZC5m
OkJBUm4NCj4+IEhtLCBpbmRlZWQNCj4+IEkgY2FuIG9ubHkgc2VlIGEgc2luZ2xlIGZsYWcgUkFO
R0VTRVRGX3ByZXR0eXByaW50X2hleCB3aGljaCB0ZWxscw0KPj4gKmhvdyogdG8gcHJpbnQsIGJ1
dCBJIGNhbid0IHNlZSBhbnkgbGltaXRhdGlvbiBpbiAqd2hhdCogdG8gcHJpbnQuDQo+PiBTbywg
ZG8geW91IG1lYW4gSSB3YW50IHNvbWUgbG9naWMgdG8gYmUgaW1wbGVtZW50ZWQgaW4NCj4+IHJh
bmdlc2V0X2RvbWFpbl9wcmludGsgc28gaXQga25vd3MgdGhhdCB0aGlzIGVudHJ5IG5lZWRzIHRv
IGJlIHNraXBwZWQNCj4+IHdoaWxlIHByaW50aW5nPyBSQU5HRVNFVEZfc2tpcF9wcmludD8NCj4g
WWVzLCBhbGJlaXQgSSdkIGNhbGwgdGhlIGZsYWcgZS5nLiBSQU5HRVNFVEZfbm9fcHJpbnQuDQpU
aGVuIEkgc2VlIHR3byBwYXRjaGVzIGhlcmU6IG9uZSB3aGljaCBpbnRyb2R1Y2VzIGEgZ2VuZXJp
YyBSQU5HRVNFVEZfbm9fcHJpbnQNCmZsYWcgYW5kIHRoZSBzZWNvbmQgb25lIGNvbnZlcnRpbmcg
YW5vbnltb3VzIHJhbmdlIHNldCB1c2VkIGJ5IHZQQ0kNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3Us
DQpPbGVrc2FuZHI=

