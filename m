Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B68C46E2CC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 07:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242696.419730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDLF-0000ag-Ah; Thu, 09 Dec 2021 06:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242696.419730; Thu, 09 Dec 2021 06:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDLF-0000YK-72; Thu, 09 Dec 2021 06:55:45 +0000
Received: by outflank-mailman (input) for mailman id 242696;
 Thu, 09 Dec 2021 06:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCcN=Q2=epam.com=prvs=2977d6bd4b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mvDLD-0000YE-EJ
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 06:55:43 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 056aaf82-58bd-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 07:55:41 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B96doIW012941;
 Thu, 9 Dec 2021 06:55:37 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cucb5r2pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 06:55:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3284.eurprd03.prod.outlook.com (2603:10a6:208:c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 06:55:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%5]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 06:55:34 +0000
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
X-Inumbo-ID: 056aaf82-58bd-11ec-9d12-4777fae47e2b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtVxHQ3UWFT4+uVfNPCn81xn62gQAxKcE3miofbGIwUbn34IZgnfLSI4sT+GDgmGbSyOow86tkzHxi6Guwf5bsLyPXdrTZGAKYBE+erzcAGPAyeR8vDflOpNRuOaAhKOOlz+5TeJ7hxt63ZAYZ8d9WB7M/QuglFM/RAdH/XRftJhYtoNQO2pbY2vrL4mg36lmZ35spRtl7CpwsfUnb+8IW5g2Y6GkyjmH2lZyhQCeWBeOPylSjNud4zi62zUsC+d74slYhOM46ZPchN+vf2RKb+vfD6Uj6BUVinGkqTogtzfYQ7K4ck6scKuBOGRbZSW+Hg2pVROwK/NDO3rCQ5oUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBgVJG2gqFhKZwdXigUwjE3s+Wl4y3vToSgqFORTI+Y=;
 b=WUEPmf036c1fbCBJYxuEOX0yvvQlFLGV/u9IRqlIFCnQeakxVq473OaJsMtbAcxRKQf9HRpUH1/btWb8SfN+lM/uYk6ylkBfuVM/Ax0sia7V/YutfxQkhByhhn50OMZyqtiZfBM1js+47BvkWhW/YPuIYd6G4nn6VtsS91jMqsJF6s7lvGFkFFn4ChzM0fryN9WGWwNozeF3KgzWdttP1vnSIzwYvJNuNBnmoOOopkl+DjttNXom491gfGao7NmN0lMzZZacekz9L+PcnnqXZrgpxyyvRSp9OGPG6f7tfP7eiWufPWUpt2ggc3pQHq2Gqo4pAdDL/FtI8+jxRWacSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBgVJG2gqFhKZwdXigUwjE3s+Wl4y3vToSgqFORTI+Y=;
 b=ddFv65YhxKvUp2uUgxYRIWOuQbkfjeoMRddb4TWgYZrHdCm0L2MVV0QaQ2XZSXAmdoV3nVadS1YMFmLvMdVIFv+rkFZpFn727LHBsvXw1OiXONBZdSAfRAkJgBCt/DR9leUsCn1BHPYiE6Q6WwGQri6hkFt5GuMMpf04t3qjEdXpijhusaMKKnKDKsoPD6FoBqmb0Tf6ZpcVJDvrTCgNCxABfpEwatC+olDkjGQfQgrtIr4gsUVrQKDjxvgZexIpMwliBGQqBpI+kGIsxP6VxgNtXVkJ7rJZEGo860YsWrMJyR62NAQUzDzS2PTVx3S790TCZdvIasjAl9w5C0CQEw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host
 bridge
Thread-Topic: [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host
 bridge
Thread-Index: AQHX4QlHTkep1sCXwU6sAzOhbUDnn6wo5hsAgAAi1QCAAMiCgA==
Date: Thu, 9 Dec 2021 06:55:33 +0000
Message-ID: <0adab467-8289-5dc9-2bee-b9f4d5e5fa3e@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-5-andr2000@gmail.com>
 <77326c24-9d2a-22ef-00cf-b89f1e70eaaf@xen.org>
 <de027721-5240-cf79-b932-4a1e36077e41@epam.com>
In-Reply-To: <de027721-5240-cf79-b932-4a1e36077e41@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d33964e-ada2-4c3f-0243-08d9bae0e5d8
x-ms-traffictypediagnostic: AM0PR0302MB3284:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB32842EC4D2A002A08FE6BD6BE7709@AM0PR0302MB3284.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GCUIiB+KgU7KqLzRyZZ4OqMium+917ryJL8t+na8SZraqTJ4A9HxM3HMv0lFP2pUwlUbQL242pEPmPMNqVVQookIAQooL3e5zcioQO+tecVt+JZygAApQ2a28Zg2CR2uY5icIPwBjltL+F8ewgWOaTMT0SCvFnOm1fHqB7NpjGu9eg1Z+F+RRxpGCK3r4l5pkZ2B2hk5N6QYRZV9+FDhNvmkZShqHpyRTu+Duttab9K2XvRP9jkzlGo3dQ0LjeD7Layap/DuCgoeZc2e8jyK39yvMmCv2aZRlP1ROHa76PbpGg7a6fOA46ej/h+2jI3UFAOylsBITckpdZkI6T0DIQpKobm5cGh3z3Am8RNu0JKIaH5xGkIzlLwEcl9Edt/FZvr0A15zeOz12t1LHcoW4eWhIo48OBqv9TNSwSiMdCW0G7LqY4rBBL4rePHgSP6yxBJTl7nS72fqGUXObY2WopJkBJw0UdPgVVWLJOpc+5go6ROLPxOIcqUOrLuodUpc/wyh89usHVrNmJqdtHiMBPP9csMYhbCaMjVqJjCyQovS47L5UZ3+R01v14HaBFpUefW2WnWPEx5USSKLbiNB/T0707zgpom7sYm7HB5a6FQ1xvpuMNGuAsUa7u1eFFFow9S7Ston3RETN+VCM2vGeu97LhyJxfJQ/6SqqMRvzbrA7isad0pro1VpBAmOCKe9QP4K/SriWdDY76jYOz/6yoOQ1hJgYsqCvRrWlWQI1uwpVgNAnnWI3UNQsteOxBUn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(91956017)(55236004)(8936002)(107886003)(186003)(6506007)(8676002)(26005)(76116006)(4326008)(4744005)(31686004)(2906002)(2616005)(7416002)(5660300002)(38070700005)(54906003)(110136005)(66476007)(66556008)(31696002)(64756008)(316002)(508600001)(66446008)(6486002)(38100700002)(71200400001)(122000001)(83380400001)(86362001)(6512007)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NFNFK3NDcU4ycCt5TU5OamM3WlRsQzdmdWRUazF5RzhCRjFHbU0wSWRzem5V?=
 =?utf-8?B?enR3eHkvaUxlQW40N1hMSkkrdzRXLzhFeE5IenNmbnkwYk5XcWNkd1Bjdlcz?=
 =?utf-8?B?ZnA5RVE0UFY2RzBmd1RFVnRlUk8wUmt2TVZTb05QQlpJbll5WXZuSTNBVm83?=
 =?utf-8?B?amRFbmlFWXhmeENqMXVMMEgydVhPVzVYWkZndjNzRituc2ZCdkxSdDcrc05H?=
 =?utf-8?B?V3lvZkpXNGhidjNtVm5Kbjg0THpUODNKZmEwV0Y5R2VaZUtWMndnS1lodFEy?=
 =?utf-8?B?RnNRVDJsR2VXZG00cnJ6dzdtNHZNSmx2VExqWk84Vm9NZHRPMVRORGRERHN6?=
 =?utf-8?B?SEtpSWhDZkNPbTRCU2ZMeEQ4Z0tmeFQ1MzI0bHdVU0draG9ENU5NU21PRWds?=
 =?utf-8?B?Wk5uaFc4R3IzeDFvUHA0aUFIZjFuWFoxMmpnOUd4MjhNUTI3MlA1dXVmQ1dO?=
 =?utf-8?B?bUNtSGNUaUxQNWxrbi9uUGFKZjhqQlpvZjdLTWVjQkJ3SUhJMGlrdjdqYjE0?=
 =?utf-8?B?eExpQkhZekVPU2tKeU5zVDNhbkF1dDVxajJqdTFXOEJ0dWhXZTJkemx4OEs1?=
 =?utf-8?B?cFlBZ201cjVuTmo5VUw3bEhZZ3lhZElVVjk1enhzbjhkeElkUUwzbGtscjlL?=
 =?utf-8?B?SDgyWVZzS1pINEY2dGwzdzlIRzBEZ29vVlZCOENmc2g3RXBnemdTQXp1WExa?=
 =?utf-8?B?TTlKYjA0ZmUvcm1Vb0hZajVSVlYrN01SUzNJTEY3MTB5VWxmci9jZDYyNlZU?=
 =?utf-8?B?VDJPelJucUJZSUViZ3dtRGlVLy9Qb2J3eXQ3cFVPOHYzTURKZCtxWUxSYlMr?=
 =?utf-8?B?ZTlMUnB6ZlEySVMxc3lYNDU5aG4rZm5NN0tlbjcycFRvSmVsS0pMMlhRSUVp?=
 =?utf-8?B?RlpjOURtUEFiTFNJVDFCeFIzc1JpbVJtWktuanFVbVJZV1o1NkhaYWgwOXcy?=
 =?utf-8?B?ekduK1RMQlhLbTBvdm9Oc1hWYjNXZ0l6N3V2bmJXVGNVNzBqMHNDd1AwSUY4?=
 =?utf-8?B?NXBXTmtEbTNmSzBYeGtqcWkxN0NwSGErZTByL1orejZqbGR1UTlrZnhXcmJk?=
 =?utf-8?B?Nzcxd21tZzhqSHpSUlZhcjJOYnF2QSsyR1dEVnE2LzRQYW9EK3VoanhzdnFq?=
 =?utf-8?B?WFZiVjdNWEVpeDR1SHBBWnpPQmQ5S2RmeVplWEhuZHBJMUlQT0RaK0ovTEY3?=
 =?utf-8?B?eXR5VExWbGRnYmU0b2liN3pPaG4zeERtZjhMSUx2aFltdmFFWTFtVDhxR0sz?=
 =?utf-8?B?cmZKdmE5RzhNOE92dHQ4M3ZiTkZTaFBSd2paOUdGeVRMZ0hwSUExSlArMHlK?=
 =?utf-8?B?SmhNVzJCRTNCeEFBQzB5U3pjMUdDUEx1L1N3UTBjekR6VlVENlhjNkdWcWEr?=
 =?utf-8?B?SW5NOFkyZmdzd0JPTUJrV2NRUWxBaFIrRDFMNE5wQURBS3JzQXRxVURWSklW?=
 =?utf-8?B?cjZDb2prOE1wVmFubkxGOW1GNnEzVlhGcGd5UFdxWVdwOW5tVC9LZmYwUjZv?=
 =?utf-8?B?YWwvSmR3dmI1NktvK1FtclQ2ZmlSUEV3dzVPRmxNZ3JYK3pIZ1hodlFsUkpi?=
 =?utf-8?B?TXFMc21xdnlwZ0tGZFRDbkpoZ1hPcCtvbDNUMFVlbW8xZkZ1RERmamVLbGlo?=
 =?utf-8?B?UllpU2MvZjBVUzRHaXRjejlqa0svWVJMeS80Q2hmZUtuL09UYlptclB1bndT?=
 =?utf-8?B?VGc0d1ZwS3N2bmNVbVZYWk02b3N6ajhmNVhTeGwyZzNDQ1djaWl1RkpJQ25O?=
 =?utf-8?B?RzFRWWlaTE5SeDJYY1ZaMFBodXR3MXNCTDhVVVJLVkU4aEhmcnVCaHBTSXhG?=
 =?utf-8?B?UXhLYmdJM3d4WW9JK0lZR1NnNzBxUndRSXlmc29xbVpaaWVXdHhLWmtSOFpu?=
 =?utf-8?B?U1IzS0piaVczK1crQ21BL2p0dnF5NjZmaTRmR09QL0RvaS9UR3hFdGZRem9T?=
 =?utf-8?B?OXkxNVRXYXZtOXNGZDcyeDNUMWpBTTdNaGF6Q1JqOFJmL3VpNHVlbytNdFVD?=
 =?utf-8?B?WlJXRzJSc3pZSVQ0SjJvdTFMVEVCaDRZeFoxZkJ6alJnQnBXdDNMNndHclFJ?=
 =?utf-8?B?K0s1Q1Jmb2xPcTdJRUo4cHVPNXdEUlA5Qk9iOUtacVptOVVBbmR5S1ZVdFNC?=
 =?utf-8?B?Z0xhbUl4eHFVS3NUa3lOaTEvNlVvTnF5dllUKzArR1BHQ1kyaHhyWS9MajlD?=
 =?utf-8?B?S01ON0tHTDcrN0V0MHprK1dNSThTSkpGU2gzVGEzRVhxV0RWZW1jaXdsRWRv?=
 =?utf-8?B?MmFNaXhZSGlKU2ZzdUlidVB4eWNPTU1XcU5MdGhBVkxEdWtSQnNPYWxhMUxu?=
 =?utf-8?B?bURSaHVSYjNWSTN1eStNRzdFRm5weVRUcE80UmgxMlV2ODBCYUJnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F9E1B915776854B95D6B5D514500DE6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d33964e-ada2-4c3f-0243-08d9bae0e5d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 06:55:33.9496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsSzknhxEpo/Bd108yEkqC7+GyWS253zm8r0V5pHUDPIctEBrojt4D7FzlIWr+V/EwW7n3RYty6kuYYCDxtH0qDN9bBu3giuLG8mgggLqUMqaiBEyGsL/ofnpuEO+dGh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3284
X-Proofpoint-GUID: eo6c4UFu6-BLn6JMJ7MD8zkyA6L-SXGo
X-Proofpoint-ORIG-GUID: eo6c4UFu6-BLn6JMJ7MD8zkyA6L-SXGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_03,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=633 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112090036

SW4gZ2VuZXJhbCwgaXQgaXMgYmV0dGVyIHRvIGhhdmUgdGhlIGZpeGVzIGF0IHRoZSBiZWdpbm5p
bmcgb2YgYSBzZXJpZXMuIFNvIHRoZXkgYXJlIHJlbHlpbmcgb24gbGVzcyByZXdvcmsgYW5kIGVh
c2llciB0byBiYWNrcG9ydCAoaWYgbmVlZGVkKS4NCj4+IEluIHRoaXMgY2FzZSwgUENJIHBhc3N0
aHJvdWdoIGlzIHN0aWxsIGEgdGVjaG5pY2FsIHByZXZpZXcgc28gaXQgZG9lc24ndCBtYXR0ZXIg
dG9vIG11Y2guDQo+IEkgYW0gcGxhbm5pbmcgdG8gcmVzZW5kIHRoZSB3aG9sZSBzZXJpZXMsIHNv
IEkgY2FuIG1vdmUgdGhpcyB0byB0aGUgYm90dG9tLA0KPiBidXQgaXQgaXMgaW5kZWVkIGRvZXNu
J3QgbWF0dGVyIGF0IHRoZSBtb21lbnQNCkkgdHJpZWQgdG8gcmUtb3JkZXIsIGJ1dCB0aGlzIHBh
dGNoIGFscmVhZHkgZGVwZW5kcyBvbiB0aGUgcHJldmlvdXMgaW4gdGhlIHNlcmllcy4NCkl0IG5l
ZWRzIHRvIGJlIGZpeGVkIGluIGEgZGlmZmVyZW50IHdheSB0aGVuIHdoaWNoIHdpbGwgY2hhbmdl
IHRoZSBwYXRjaGVzIGFib3ZlLA0Kc28gSSBsZWF2ZSB0aGlzIHdoZXJlIGl0IGlzLg0KDQpUaGFu
ayB5b3UsDQpPbGVrc2FuZHI=

