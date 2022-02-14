Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D314B41FE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 07:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271190.465540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJUvP-0007NU-2Z; Mon, 14 Feb 2022 06:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271190.465540; Mon, 14 Feb 2022 06:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJUvO-0007Ka-UL; Mon, 14 Feb 2022 06:33:26 +0000
Received: by outflank-mailman (input) for mailman id 271190;
 Mon, 14 Feb 2022 06:33:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJUvN-0007KU-Km
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 06:33:25 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01d81dd8-8d60-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 07:33:23 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21E5h6aO030180;
 Mon, 14 Feb 2022 06:33:12 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7fqn08wy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 06:33:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7123.eurprd03.prod.outlook.com (2603:10a6:20b:286::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 06:33:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 06:33:08 +0000
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
X-Inumbo-ID: 01d81dd8-8d60-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHr/tvDdFj5Hfxs6PLmkajk6UjBW6SVfhUaukTKrYFiWkfd3YEpBSEXKdUkSVOaJCks7vTvRQzQICPqmO86fUguDHRPlLmqVHOCzc0Dv2MNhEv9atpCiSVVSkyaUShmH/kJ2hjj9EBUSbvlgjXfbGdnHDqxj6D1THYBkWJOARar/Z2PMl2kFa4oQ2ci23uaiLrokGJfAmjLz+j98xHFiahE/zTMKTXbiLDn8EudRfxii4blQg6UlD72TKXuv7KCpj/3AhC5gQdlzshkqC8dKAEj772k5Pb1pU4+oOxvYxUoEBT5rmTxbnhrsFrVO2OdI4xQd+K4SUp7HgHgK5jAleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8ELf5Y1gF5qwnJww0uaqHGz69o6pXjws34kuC23Lk4=;
 b=Be731YC7JL0ztOMcfolHtJFsUigL35hVR9InqqNHT9toUtBl6efnM9sVW5L5XNFEujX/AjgvQrqQrqRcVBCBh32TBnqtG6ARWpLlqBy2+BRzXjZnlEO+tIu5r4QpAK8yIxfT2IsZP7xjaVm0LBLR74VNTJ7Gm0/I70ffhwlzLCLBnb6A/Aaboc7Xoml1aaWCSATiB5M1L39CG7WLMWw7s9vuZgoCUjTxKs7vvhXsEg5d+0xTYKor5sdMDX9JAgHR76AP8zyojSitzoqh0Mspq3VQkSYFRB4qLcrSsiL4BhDoT/GPMA1oBXjr+W3s1AZmWJiakHF/qnGvUAQ1AzvXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8ELf5Y1gF5qwnJww0uaqHGz69o6pXjws34kuC23Lk4=;
 b=YPpd2P8ygckqj5x7QypwGWzy+w5rINNE9kHkiSvzUttiI2pV9RdE+Cdl+5kxiUsPtl1qGISptAT2rZjjXAk01NjJgVd/l25SlMv4w7259fmage7Y4OOrTdI+JKDnLCk4WXphF/BaQ7Wy4osApkdI+m9laYsx7bg09Ou7QBO5mazSZn781TAFDQTtW9IojlrMDAfgGth3Ne2xT6PRrP2qDTkc4Ki5iiPi2IVOBk9krNbf7iQFjQtm4fUCbYm/txH+VDejyegylcAgK44nEeNSg4W6c/0JGbF1hAAk1pbDFiIQTdaByrDKJ/HOgqBAX2Jee61OIOPphzpX+7w3dtOkNw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAACWWAgAA6ygCABB0SgA==
Date: Mon, 14 Feb 2022 06:33:07 +0000
Message-ID: <6905d6ab-e435-fb65-2e93-446644b69b82@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <1dbd0f54-affb-1e67-215c-6e6c8fb8535b@epam.com>
 <YgaEQrqIEPc258Fy@Air-de-Roger>
In-Reply-To: <YgaEQrqIEPc258Fy@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 776ac44d-7cc9-4ae1-1030-08d9ef83dd47
x-ms-traffictypediagnostic: AM9PR03MB7123:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7123D95765FF17EF679F554FE7339@AM9PR03MB7123.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JK8/SKlQazjsBO6lRndBZs6DqSXHPefERGXRub+qFmMYk30fVo+syUQi3cdD/+TQArXWAbsafKxs1r+Ky9uz9TgIHWr6vqPXl5oiHIl9khKvdbrcU7gpANe5XIdhHQkEXn2AD0iuG7Dl3dXoqm4HVNiLwjBB04zq9wDT2xDc2Nm63tc6Y4uzE+ZUjRA3HBxVfNh7A7RoxlL5j0kCuIjRsMoa/TNPYGD6ziBsZCdbjYmeH3PpaRdEh30DMGOG9Tz4TvsvELU/OQQScW+mBqAHudTRyQsjxuo+CIxx9JRH20XcanRexpL8btOX49z5LdY7DwNvgCWmjG1xhCObGdLFreXT+fhS2u7vd7IVCgvY82N3jexaQbEg1XE07+PJZ5/VSwxm+eUFddHAqqU/51O/zVOq3YMGl5WFICXX4TON+VhkhXVdnrZj8WfJ1aa7lK2NItnPIBqpTgk6sT1svyjuXV1IVapmc+daI6WacltBoT7tAlSvl2QHGu6y1mAaDTQsTz6e91GPSJAt2bBb0/Woj4XG5sgefz9wrB6f7zWhGzExwlIRkYCDQVXGMYNDtgRGZRctWNbDWVKT8ahoolTxZmudqYMN/BgIAxIJx4YK9m2eusqJdFPC2Fu+rfT5vu+8j8NIYpYazr9hRcZzsrVRhjtm45sceYddVBY/ss79xm6Xj+tRkwNptLZZGpsOEDyHKADCeXVje7UxeAgDwV+qh8t5Y1ptI0E/Gpv+w0Ev49K8QzYOz8TcwJQ/qGhoh4lB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(122000001)(5660300002)(38100700002)(6916009)(54906003)(6486002)(316002)(6512007)(55236004)(2616005)(2906002)(36756003)(26005)(64756008)(66446008)(66476007)(66556008)(86362001)(186003)(38070700005)(66946007)(31686004)(4326008)(8676002)(71200400001)(31696002)(53546011)(8936002)(6506007)(91956017)(83380400001)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T3VqKzE5bUk1SUd5bHhMbVpWelN5V0tOWWFjL0lkYU9TUTAvQjYrblNlMnd3?=
 =?utf-8?B?RXdEa3lBSUJoYzZPNlJxSnlOMTBhUkxFaEtEN0RVVzhhTHZmQUFMTFVYcGlh?=
 =?utf-8?B?ZkN2U09MQWI5SVN6b1NzOXQ1cVNNenpaU05xcDl6TkhSYnE4NUlCeFVvTFpY?=
 =?utf-8?B?anlscmNLbnpQbHlSSktKZmMvejNFMXpONDNjZTg2SEpVSGU0d3FQOU5UTFNp?=
 =?utf-8?B?STh1TTBOSDl3YnJtS3JyTERiV3dFK1N1c0YwdTVWMGwveGY1RFo0cjJaSER1?=
 =?utf-8?B?SHUwZERWSGlSeUhGK0dkSTMyZmVneHRVUTlzTHVGWURUU2FZMzA4dUNMbktL?=
 =?utf-8?B?UXVacnVSQ25nMTcyYnpTK3dFRTdzZkRycEJ6eTh4Y04xeWFTdGVNR3ZHWnU4?=
 =?utf-8?B?d2o3U2EyWjhqdWNTeWV5LzVlYTBrK1U5U0tCTXBtc1p3NWM1QjZPaFdFaGpk?=
 =?utf-8?B?dmNDRm1oaUFaY2pQSWREdHFiQmhUM1dKcVdsTmRQa3EzRE5Ka2FYekc5N1BJ?=
 =?utf-8?B?bnhTcE81Ym93VkFCZWcvWHl1cy83VncwaG9meVB0M0RyTjBrTzNjQU4vaDFS?=
 =?utf-8?B?RU1JUzFXNTMvRFZyeHA0eWNFTy9nR1ZYZGFWTEFDZkcxWHAraVRFTmVNbFhk?=
 =?utf-8?B?a25jRkw5TUpmdkNWOWI5MnlMT0VMS3BwY3JVRjBENTU5VFRKemtGVENGN1Yy?=
 =?utf-8?B?VnVJeVRMT0hta1NEbmM4VitiRVJKRWpuNzlzOUMrODhaYlM3QTRlM2ExSW45?=
 =?utf-8?B?RTVPWDlwaVVSTEJWMVNtbG9rRlJGOC9TdUxoTTNqK2g3T2xsMFpUQkU3U0lK?=
 =?utf-8?B?Z3ZuUmtNeHRXejRzNEZ6Tk9uSFRTQStnK3NpRXJqVWZLYzBmVFJrT0Z2d0gz?=
 =?utf-8?B?UnlQQXBpNUE4cW00UjRXRjN4dDNlaThveGU1RlBrVW9zSkc4Tzd4WGtBbytE?=
 =?utf-8?B?NHNwK3lmL1hGbkNiODA0a2UxNjhwWk5XMElLY3Y0dlVVMVMyMCt5YzlHMnk3?=
 =?utf-8?B?ajd4dE9QYlpIODlZVG1lR3YwT1MzSG13QjhmQW5vUTNxMDdvT29YTEFNMWlJ?=
 =?utf-8?B?bjJxR05wOGdYUlMzNGRnUVNhSVlReTM5RGNDbjkrTXVCZDBqaHhzVmdtclU1?=
 =?utf-8?B?MmlWYXJpTlNWSGxnWmNtZUkzay9tRkcyM1U3V1hQL1lwYVJXK21vc0t3WnY0?=
 =?utf-8?B?YUJFQmxNT04yZXp0S2I5NmRiY1RyQ1BiR281cVk4RmNSZktvOHRXVHk5VU5L?=
 =?utf-8?B?ZGZZWVI0cFU3UW10UnV3alZrdnpQUm5VWXhJWWdnVGI2OGM3VW9aSlFHcXY5?=
 =?utf-8?B?Rm9oMTJvT0lzUlZaTWFXb1k5Y1h6N0RXbStCRnNhV2V3M0MxQ2huNU9TNVFr?=
 =?utf-8?B?a2Q0M1MraGNYTUoyVUxsTnl5cE8ySXlCdkZTb1ZOaDRRbElhSnJFbEU1R2kz?=
 =?utf-8?B?U05CcmI2enNDUk9aTWNpUklmUVJwVU9FdUwybWdSRkUxTE05TDR4SFFiWUZp?=
 =?utf-8?B?TFVZbk9wZmdrTTF5RjhBOWdycUF1UHJ0WE9RK0VtK3AvelFweGpONWNyTWJQ?=
 =?utf-8?B?OUdSdnhzb1lzN1JOZXBlZ3J5QTF6cXgyUWVqYklVeG42R0ZZd092ak5PZGZE?=
 =?utf-8?B?d1pIdXNhVUpXQmJsbURMTXFEZnZOTjQrQkd4b1p0TmxMdVdtVGk2OXdwUHND?=
 =?utf-8?B?Y0tBQW56RmFuakZGUmFFZXBkRzh4TE5zUy9JUjA0WG9hVDgvdXR5NFlZVXFC?=
 =?utf-8?B?Qk44blpmUzA2UlgxN1ROM1RZSGJjYm1IaTZCeGhSb3RlMitFZlRqQlplMzVK?=
 =?utf-8?B?QWVFaFowV29tclVVOVE2TE1EY0pybm1NU0ZHenREaENmb2VScjhEeTcySUNT?=
 =?utf-8?B?VWVWbzJuUWg4ZE9mdFhUaWxJZjcrdG1ubUFERkhRdXFBWUY5ek9KcFFVTGdr?=
 =?utf-8?B?SnZMak96VFhCY0VCN2FwcnJyZXpLbU1hVUp5N082UFNpVjJldWIvWXFQR1Z0?=
 =?utf-8?B?eWc3VUJveHJKeElUQVh5aVB1M3JGQTRFV0F2MU1sN1RzY1NWNFdGeFNTM2ZR?=
 =?utf-8?B?VlFlT2JJczVXMk1MMzI3RFpBYUMwU1JtZHFqeUxwN3RZaG91bFhsa0tuRHh5?=
 =?utf-8?B?dlk4bXVUb213cUNUeXpVWVZEMlhBbDhabFgvcUJITWUydmRyZ053eXgvYk1M?=
 =?utf-8?B?Qml4MVZPUk1qaDJVdkZTaWRmcVNiaFgzRVdUS0tGMzFBdUlPUnNieGxHcWZq?=
 =?utf-8?B?TmNVTXBtTU5iUnllQW5ZUUx3NS9sU2I1bnBVQkhXWHFCbDJIdmZlWkVhcjhp?=
 =?utf-8?B?ell5L2VPU3RZZzVFZUtwS3VMb05rOGJ5Vmk0RnVaeEVrUVNhY2FyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08F98950CD8F1E48AAE9EDAB8B5438A2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776ac44d-7cc9-4ae1-1030-08d9ef83dd47
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 06:33:08.0406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mySMycqgbty8v4wdGQtc9XBhM6U7c2VaJB5w6I2CuQnwv8RurkyA7JA3LzADaHFdYc74IuFEq8geu/rJ7ltZAB3bpnpcw4WXygSEXygxR93nqvWjDWpWBWHdsIcHh85u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7123
X-Proofpoint-ORIG-GUID: wFph8D3mjqfLTyHuk0_3Ht2xgbG9x3_n
X-Proofpoint-GUID: wFph8D3mjqfLTyHuk0_3Ht2xgbG9x3_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 mlxlogscore=901 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202140042

DQoNCk9uIDExLjAyLjIyIDE3OjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmks
IEZlYiAxMSwgMjAyMiBhdCAxMjoxMzozOFBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAxMS4wMi4yMiAxMzo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBGcmksIEZlYiAxMSwgMjAyMiBhdCAwNzoyNzozOUFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gSGksIFJvZ2VyIQ0KPj4+Pg0KPj4+PiBPbiAx
MC4wMi4yMiAxODoxNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIFdlZCwgRmVi
IDA5LCAyMDIyIGF0IDAzOjM2OjI3UE0gKzAyMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+IEludHJvZHVjZSBhIHBlci1kb21h
aW4gcmVhZC93cml0ZSBsb2NrIHRvIGNoZWNrIHdoZXRoZXIgdnBjaSBpcyBwcmVzZW50LA0KPj4+
Pj4+IHNvIHdlIGFyZSBzdXJlIHRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0byB0aGUgY29udGVudHMg
b2YgdGhlIHZwY2kgc3RydWN0DQo+Pj4+Pj4gaWYgbm90LiBUaGlzIGxvY2sgY2FuIGJlIHVzZWQg
KGFuZCBpbiBhIGZldyBjYXNlcyBpcyB1c2VkIHJpZ2h0IGF3YXkpDQo+Pj4+Pj4gc28gdGhhdCB2
cGNpIHJlbW92YWwgY2FuIGJlIHBlcmZvcm1lZCB3aGlsZSBob2xkaW5nIHRoZSBsb2NrIGluIHdy
aXRlDQo+Pj4+Pj4gbW9kZS4gUHJldmlvdXNseSBzdWNoIHJlbW92YWwgY291bGQgcmFjZSB3aXRo
IHZwY2lfcmVhZCBmb3IgZXhhbXBsZS4NCj4+Pj4+IFNhZGx5IHRoZXJlJ3Mgc3RpbGwgYSByYWNl
IGluIHRoZSB1c2FnZSBvZiBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluIHdydA0KPj4+Pj4gcGNpX3Jl
bW92ZV9kZXZpY2UsIGFuZCBsaWtlbHkgd2hlbiB2UENJIGdldHMgYWxzbyB1c2VkIGluDQo+Pj4+
PiB7ZGV9YXNzaWduX2RldmljZSBJIHRoaW5rLg0KPj4+PiBZZXMsIHRoaXMgaXMgaW5kZWVkIGFu
IGlzc3VlLCBidXQgSSB3YXMgbm90IHRyeWluZyB0byBzb2x2ZSBpdCBpbg0KPj4+PiBjb250ZXh0
IG9mIHZQQ0kgbG9ja2luZyB5ZXQuIEkgdGhpbmsgd2Ugc2hvdWxkIGRpc2N1c3MgaG93IGRvDQo+
Pj4+IHdlIGFwcHJvYWNoIHBkZXYgbG9ja2luZywgc28gSSBjYW4gY3JlYXRlIGEgcGF0Y2ggZm9y
IHRoYXQuDQo+Pj4+IHRoYXQgYmVpbmcgc2FpZCwgSSB3b3VsZCBsaWtlIG5vdCB0byBzb2x2ZSBw
ZGV2IGluwqAgdGhpcyBwYXRjaCB5ZXQNCj4+Pj4NCj4+Pj4gLi4uSSBkbyB1bmRlcnN0YW5kIHdl
IGRvIHdhbnQgdG8gYXZvaWQgdGhhdCwgYnV0IGF0IHRoZSBtb21lbnQNCj4+Pj4gYSBzaW5nbGUg
cmVsaWFibGUgd2F5IGZvciBtYWtpbmcgc3VyZSBwZGV2IGlzIGFsaXZlIHNlZW1zIHRvDQo+Pj4+
IGJlIHBjaWRldnNfbG9jay4uLi4NCj4+PiBJIHRoaW5rIHdlIHdpbGwgbmVlZCB0byBtYWtlIHBj
aWRldnNfbG9jayBhIHJ3bG9jayBhbmQgdGFrZSBpdCBpbiByZWFkDQo+Pj4gbW9kZSBmb3IgcGNp
X2dldF9wZGV2X2J5X2RvbWFpbi4NCj4+Pg0KPj4+IFdlIGRpZG4ndCBoYXZlIHRoaXMgc2NlbmFy
aW8gYmVmb3JlIHdoZXJlIFBDSSBlbXVsYXRpb24gaXMgZG9uZSBpbiB0aGUNCj4+PiBoeXBlcnZp
c29yLCBhbmQgaGVuY2UgdGhlIGxvY2tpbmcgYXJvdW5kIHRob3NlIGRhdGEgc3RydWN0dXJlcyBo
YXMgbm90DQo+Pj4gYmVlbiBkZXNpZ25lZCBmb3IgdGhvc2UgdXNlLWNhc2VzLg0KPj4gWWVzLCBJ
IGRvIHVuZGVyc3RhbmQgdGhhdC4NCj4+IEkgaG9wZSBwY2lkZXZzIGxvY2sgbW92ZSB0byByd2xv
Y2sgY2FuIGJlIGRvbmUgYXMgYSBzZXBhcmF0ZQ0KPj4gcGF0Y2guIFdoaWxlIHRoaXMgaXMgbm90
IGRvbmUsIGRvIHlvdSB0aGluayB3ZSBjYW4gcHJvY2VlZCB3aXRoDQo+PiB2UENJIHNlcmllcyBh
bmQgcGNpZGV2cyBsb2NraW5nIHJlLXdvcmsgYmVpbmcgZG9uZSBhZnRlcj8NCj4gSWRlYWxseSB3
ZSB3b3VsZCBsaWtlIHRvIHNvcnQgb3V0IHRoZSBsb2NraW5nIG9uY2UgYW5kIGZvciBhbGwuIEkN
Cj4gd291bGQgbGlrZSB0byBiZSBzdXJlIHRoYXQgd2hhdCB3ZSBpbnRyb2R1Y2Ugbm93IGRvZXNu
J3QgdHVybiBvdXQgdG8NCj4gaW50ZXJhY3QgYmFkbHkgd2hlbiB3ZSBkZWNpZGUgdG8gbG9vayBh
dCB0aGUgcGNpZGV2cyBsb2NraW5nIGlzc3VlLg0KT2ssIHNvIEknbGwgc3RhcnQgY29udmVydGlu
ZyBwY2lkZXZzIGludG8gcndsb2NrIHRoZW4NCj4NCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlv
dSwNCk9sZWtzYW5kcg==

