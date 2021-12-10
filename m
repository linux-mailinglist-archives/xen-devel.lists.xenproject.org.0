Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549D4708FA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244237.422427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkmB-0003Yp-77; Fri, 10 Dec 2021 18:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244237.422427; Fri, 10 Dec 2021 18:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkmB-0003X2-2E; Fri, 10 Dec 2021 18:37:47 +0000
Received: by outflank-mailman (input) for mailman id 244237;
 Fri, 10 Dec 2021 18:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrZX=Q3=epam.com=prvs=297895717b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mvkm9-0003Ww-Ui
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:37:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e63821-59e8-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 19:37:44 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BAH6d7o016475;
 Fri, 10 Dec 2021 18:37:31 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cvab3ras4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Dec 2021 18:37:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4145.eurprd03.prod.outlook.com (2603:10a6:208:c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 18:37:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4778.014; Fri, 10 Dec 2021
 18:37:21 +0000
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
X-Inumbo-ID: 42e63821-59e8-11ec-a74f-db008197e53d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/EWCPTZdlI54PT/IcMdW08sp8FNVpjFWY1WfR9gCSJ9KS710uRT9yqYTknUg1Oh7zX00fXNQEqFwnEnm8YjMT0UrY48w6hAsQsN7cTrM3/DyP/TNXRKiADc9XKbpoU4620RqyF5RDdBJLAwaEEet0mtt+Lr1pTW2njFDoDFuGK7OBP7C+y2wp/0WMxxrkSPIQOyuUoq63TTtFUVcYusCYIPcUwiPgwH5MD5J1TTkXxl27m9V5Fwfn4iqcw7Jat5p/PDizvi1o6S+zTuib7yZLckMpj+rV6Xggq+0Yddxu7wPKjMpaJgzNI+8Un+dAQlvrpfSIThp4ggmWvvcKGLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBMrnK8FE5UpZd3amEKKd2tlKe96FYPd0Mksfq8EJRg=;
 b=h2qqwfRidIojbeqJ5GoDDZoeMC8pNqk1C09oFNOrFywt3ZljPqOCY4B1dstXpBqo3jDqc271B1vMHZlJOaJT7OV8nKdgfHlFDOO220bdCjHLzozf1RwxDeOE6rAcj3UElm1zm9VlhaZCEBfKj13anV+JzruGWJ44vjKWZwwJKrtmbu8GCjp+21poFDWEmGwbJ0rU/kajVx/RsWgg7kVuH01suHJ4QEmHwI83PQRo5Ug74dY05Rdn+PgJVxSv3hoJmVWlYZBKxH1zeGh8wLOCnViLnRCI84fV0CDVR/mxJ0FX7xy3wxbv4NFzRutQWkd6hIw2j0lkDcP34Tg0QOz1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBMrnK8FE5UpZd3amEKKd2tlKe96FYPd0Mksfq8EJRg=;
 b=rtK1I6QTweNFrjjtW5yQl7QNx4Pydgj9MJh2/KlylnwpUutB5eSxWAM/+ZmEmsvttWVM5KCO89DGg+cAZfX1I9las81IBL5q6e52+2Jwdg3ET7SxDvwsm/aJDumcW7Y/JHYyFJluwd94l6hkdutUUe3t1dkztFdmAMW2JiWcdpkM8zwmkdzBmnNXKp+nIccZhBZ6H0BKCIhWSD588DduHZsDR0OzLLm3zxT+2em0/fCTHkhBg7ZR3t8l6OLc1xmaKXJiHfJCLK3b9KT6YwqHTL55/ghT3UX1lywu7lAdNksXfqXuVOBgveFkjVMqqJxLSxO/LCnB0FtkLv690b67OQ==
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
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v8 2/4] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v8 2/4] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHX7M6BKfC+NnP8FUmShHJlmPRsZqwsA82AgAAMgoA=
Date: Fri, 10 Dec 2021 18:37:20 +0000
Message-ID: <d58e87db-2be9-e982-b78e-64d72afb59ef@epam.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
 <20211209072918.460902-3-andr2000@gmail.com>
 <78ee3d68-7901-2cfe-b0f1-76239339dc49@xen.org>
In-Reply-To: <78ee3d68-7901-2cfe-b0f1-76239339dc49@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 851ecf5b-1462-4dc5-57b2-08d9bc0c19fe
x-ms-traffictypediagnostic: AM0PR03MB4145:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB414542FCFD6F1D74165B3F67E7719@AM0PR03MB4145.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xwYXtF3dWkSySQwNgUmR4qqXImgxSQNq7J8m+2813CS9h/dcQHN+hANs9v4RWcRUptperUBlDckELTDkn3SeNtN3HvifVsDWDCD83jfUC6Nb1rwXlBTcy31qP3sNLtk3/aGjx5u9MZfKPGHWKDwdxDSUvM5NbO6GzMMIwhINtegFIdd7S4xXQXHRF0L8/h5IUaVKjrIANIa2oymjHcTPHkJHmbEHB+OW/iPMqd2ul9H4KiLgeHsXLHlCPpRhmCIpRzYzsGCKc6n4szO8rQJcYHLEETXCnfa61s6I6GPNGfu4DEfn1yE4xE6Aow5WQEbpRsD/KAHUdsJNJ74Qb+po9904o6DLskv40BKSkq7XtR39DYRah+w/tdqqbjhcHsM4IFkovExW4HWFP23WNNp0hkJ3S+D1ncaWPZ/g7HJkA3SuYMzOJ9Uk8T6r4PIHm2NSMETiRqZNay+k/oXRe5PbvciyFKPGX4Tv1f42SRycUFd0FebPZsCMH4GAoqiKuKBU9JH+QGfuLB9M273Wmx4zQK4jq/lqebgN/eZ1GQyL9sqWGorf/K4DxiDZTBCw7qWGgQwPv20FLl+iKS2Vcl0oLhQvabU2tVsU0oAXcZ6MYMCSA4soPGPG40T13BzCFB+J+t64q1jhoO2lpjy1i/JueaZ6hwkyGG5ksQia0ON7B7lFdVJ/oDl2KrJrdkJhdvLd2xgfTqDVnyTn/OOeqwCzVwWd5+QIdfHGRco0nqnhBUw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(31686004)(54906003)(110136005)(8676002)(55236004)(6512007)(122000001)(316002)(4744005)(508600001)(36756003)(2616005)(38100700002)(86362001)(26005)(31696002)(53546011)(76116006)(4326008)(71200400001)(186003)(66556008)(66446008)(6506007)(64756008)(66476007)(2906002)(8936002)(38070700005)(91956017)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VmwyWGNLaHZ2VzBkQzlIckxybS83Mm81VVo3MUFPb3o1bE1FN25IdEpHWHlq?=
 =?utf-8?B?dnIydnp1ZUlOVlppUUlpeEgyZHNKbDVsVDB5dlhJNTZVVEVMdXVTek1iT3Nz?=
 =?utf-8?B?aUZKeGoxbTNRRlBuWncxVTNEUE8xVFQ2K1BVd1NkR2ZzbWdUbnYrbW03bWQ1?=
 =?utf-8?B?S2dRWFJJMW1wRlcxUjdYMmk4S2J0b011bHQxVnQ3WFhjWHE0cVgzUi94aEhC?=
 =?utf-8?B?RUpMaFEwUjJNbmpaQWpuTldVWm5zUmtKdmltLzNqWmIyWFBwbEdwSk54R0hU?=
 =?utf-8?B?UWhJeDlzREY5RlJPSWd2Q2xWa0RpWGxnWC9qbmI2TzF6clorQlJoZE1YQUZF?=
 =?utf-8?B?UmR2T1lRTzlhMXVoaGJoSXowSXZqUkNYUkhBaTNMNEcrNUtUNTBURDlKZFgz?=
 =?utf-8?B?QXlWVW81eFJGWWFiNVVDWkdtZHJFNlB0YS9nZytIejF2a1VJWlpVVjVNbnk1?=
 =?utf-8?B?dTZqVmlQald6VmdFdDVVVFlsSkFWOVJ3RW8zSXcxRTdDYlpwZEJoRk1QU2wy?=
 =?utf-8?B?R01HWlpaWEdXeS92bEVra00xbVlMVWZxU0lLQzlJNlNocWF0d1plWFM3bmpl?=
 =?utf-8?B?V0Q0ZlZYNGU2SERVUGFlbmhwaGlMK013aHVaYmlNOENLWG5iMjQwS0swbWRp?=
 =?utf-8?B?NE9GaytqS2RNSmFtQUprbXVRSW05Yml3ZXArWkh2dG9CdERXNmNRa29IU3Qz?=
 =?utf-8?B?ZExnVjQxMkRhdnNRMUlYeVM3M0JKc2hKUmd1bFhIdnpPQmExc0NBNzZnRUxw?=
 =?utf-8?B?bHNiU1ExKzBKMWRJaS9yZDNDZEE3NitRK2tqMEdLR0JaQW8wb2Y3Qnk0bFpO?=
 =?utf-8?B?ZkphR1drTVBpaWFkY0JGTXNRbGFQSVVNMEhOTnc0ZHlhazZDdkY2WjE3U3dU?=
 =?utf-8?B?VkRIMEk2MXR5OUg4UDRkKzRXc1RFNlowVzdtNDd3K2dBVDAzYTRhajdoVFNs?=
 =?utf-8?B?cnNCQXhnUysvSHR4UjBtNTh2SWxhQnB2TGsxWFYrdkpZSEZadTd3WGZCMXBr?=
 =?utf-8?B?TUxEb1lxeEJ0dVJjUDhXN3RhQWNCTXRhYUdZR1VMM1NZYlJjVE5Sc2hNRUxQ?=
 =?utf-8?B?UlR3czIrRGtZQUJnWjg2dDMwU1QxQkk3cm9LOVVNU2lWQkdMYjU3UXdPRzhx?=
 =?utf-8?B?NHNKYkZibWcvUmNlTWFPd2QvVDA4SU1VV2Q3WUxmWmpoMTEybmoxdTFqc2Rm?=
 =?utf-8?B?NFk3Z0cxM0o1cWFIUThCMWpGTDdpTUtPS3RtZEpGWTRKa2NPTnYzenJiTyt5?=
 =?utf-8?B?dFB5K1FFWGhRV1NqKy9qWWJ0TkVoT1JITlVvY25ZSFdYdFNIZHdEcTE3WTFB?=
 =?utf-8?B?aW1pOC9vSU1sZmtXTzVydlFMbVg5aktNS3ZkWnBYUUxXK1hlbS9jMVRLN3A1?=
 =?utf-8?B?ZVlFMUVIZ0dLdU1NcktYNko2a0l3NGY0ZHBVbjRjdTk1THRpUDRuaWx5bnhz?=
 =?utf-8?B?MFh4OUpPTFV5ajBMeno5V2w0Y2lNeWZDV0RtUUdMem9nai9wYnYzMDdXUFYx?=
 =?utf-8?B?bFFKNlVldTl1dWMwc0tXUlJjVGdHeEYyQTUvM3g2SXg1cFFhaW1TUHE3QXF0?=
 =?utf-8?B?ZVpMVGdIRzZHQzJjd0NVWkN0ak0rZlkzemM5VjUrbHBCYUZYR0w2YjdxdjZl?=
 =?utf-8?B?RHg3NjFJZ1ZQWjE0QysvdEk0TnZEamxETytWbXJQcG5tWXZ3V3I1OVBWU2RP?=
 =?utf-8?B?ZUpFODY2WS8rcDBGMUpJdmFTcHg3N2xxaHFheUptY091NWN2TUc4V1BDT3hX?=
 =?utf-8?B?aDN6RUxERUtRU09PWDdxSUl4b204ODlhRkU1NDdaTFJFVTVLMWVaUDluVkFh?=
 =?utf-8?B?c0EyU2VZaE1BN3laY1MrSFFYR1QyOVNjd3hkZFlBeWtVMUYrWVpzV0psaXNu?=
 =?utf-8?B?N3pDQ0JlMWUrSlo0djROWWN4NzRIcXN3NDJnVGNEcnIrOWlLbzFwUEdSQkph?=
 =?utf-8?B?cmZoRDUwUTdFMWFhaS9PeENsRmc0ejdHWVFQRHZmOGY1UCtNckNJN2I3RGhk?=
 =?utf-8?B?dHpaU011NVJNVy9KVjZWdm9SQnpEdUNsUkFLc3JXRUNuZmN0UE43Q3lQVEpo?=
 =?utf-8?B?OXB2cEVPZzVkZGF4S0Y1Q0ZGOTBnSjBFRDUzNTBjZEg0L3Z4M1BzM1BrY0lX?=
 =?utf-8?B?OWRiSG5oMklWUC80b2R2eHBQdDBjMzJEZ1liTVJHVGR2aHZzSGhHenRlWUhZ?=
 =?utf-8?B?ZFZhUkl4ODdSeUdqV0hEb2F2bHorcWNTTld3d1MvZm9ERll3UllLMWFuY1Zl?=
 =?utf-8?B?SHFIZ3NTTlRFSXp1b2tyOWZCT0piVFptTlBEQmpCZ1RFcHFFQ0NjVDhlTU5n?=
 =?utf-8?B?TGc3UW84K1oySnZCcWN2SVliQ3RZMFVuMTRTVXFVL2JEa00vNi9RRlBCd2xk?=
 =?utf-8?Q?UVuetBu18jct7TSc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCD36DB339D7B949AA0ADEC034273387@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851ecf5b-1462-4dc5-57b2-08d9bc0c19fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 18:37:20.9401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRGKZ58BkR3JdIw3vKIJCnD3KHd68cRHJfX7jm5Djyl2oyVr4GxECUN5wlIOt4KHaR7l0MFvlzufoJJ5m4XQ2n/YByCrhMU0fACPAmoB9kZUZCV2D8Mk1phcID7Cae65
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4145
X-Proofpoint-GUID: ZKGpcZ39YNEtnsl4oRwNi764N5GwKplN
X-Proofpoint-ORIG-GUID: ZKGpcZ39YNEtnsl4oRwNi764N5GwKplN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-10_07,2021-12-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=914
 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112100103

SGksIEp1bGllbiENCg0KT24gMTAuMTIuMjEgMTk6NTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwOS8xMi8yMDIxIDA3OjI5LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+ICt1bnNpZ25lZCBpbnQgZG9tYWluX3ZwY2lfZ2V0X251bV9tbWlv
X2hhbmRsZXJzKHN0cnVjdCBkb21haW4gKmQpDQo+PiArew0KPj4gK8KgwqDCoCBpZiAoICFoYXNf
dnBjaShkKSApDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiArDQo+PiArwqDCoMKg
IGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+ICvCoMKgwqAgew0KPj4gK8KgwqDCoMKg
wqDCoMKgIGludCByZXQgPSBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXNfYW5kX2NvdW50KGQsIHZw
Y2lfZ2V0X251bV9oYW5kbGVyc19jYik7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldCA8IDAgPyAwIDogcmV0Ow0KPg0KPiBTb3JyeSBJIG9ubHkgc3BvdHRlZCB0aGlzIG5vdy4g
QUZBSUNULCByZXQgaXMgbm90IG1lYW50IHRvIHJldHVybiByZXQgPCAwIGluIHRoaXMgY2FzZS4g
QnV0IGlmIGl0IHdlcmUgdGhlbiBJIHRoaW5rIGl0IHdvdWxkIGJlIHdyb25nIHRvIGNvbnRpbnVl
IGFzIG5vdGhpbmcgaGFwcGVuZWQgYmVjYXVzZSB0aGUgY29kZSB3aWxsIGxpa2VseSBmYWxsIG92
ZXIvY3Jhc2ggd2hlbiByZWdpc3RlcmluZyB0aGUgSS9PIGhhbmRsZXJzLg0KPg0KPiBJIHdvdWxk
IGRvY3VtZW50IHRoaXMgb2RkaXR5IHdpdGgNCj4NCj4gaWYgKCByZXQgPCAwICkNCj4gew0KPiDC
oMKgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiDCoMKgIHJldHVybiAwOw0KPiB9DQo+DQo+IEkg
Y2FuIGRvIHRoZSBjaGFuZ2Ugb24gY29tbWl0IGlmIHRoZSBvdGhlcnMgYXJlIGhhcHB5IHdpdGgg
aXQuDQpZZXMsIHBsZWFzZSwgZG8gbWUgYSBmYXZvcg0KPg0KPiBDaGVlcnMsDQo+DQpUaGFuayB5
b3UsDQpPbGVrc2FuZHI=

