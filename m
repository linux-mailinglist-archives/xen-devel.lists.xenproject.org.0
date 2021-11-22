Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8085458D1F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228814.395995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7HA-0004v8-80; Mon, 22 Nov 2021 11:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228814.395995; Mon, 22 Nov 2021 11:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7HA-0004sQ-4e; Mon, 22 Nov 2021 11:14:20 +0000
Received: by outflank-mailman (input) for mailman id 228814;
 Mon, 22 Nov 2021 11:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mp7H9-0004sK-3x
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:14:19 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54b1f205-4b85-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 12:14:17 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMAwEtx021612;
 Mon, 22 Nov 2021 11:14:15 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cg8mt0h82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 11:14:15 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM7PR03MB6181.eurprd03.prod.outlook.com (2603:10a6:20b:142::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 11:14:11 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 11:14:11 +0000
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
X-Inumbo-ID: 54b1f205-4b85-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBr036J/e4AlawXY891pGXfiFWr/caHOHF9Kz3Qn9Ox7uALWJ7b/XMKMY6II2w06Tv9kX9d0DGhr9werH8SsDFBxu8gB7XTFzVVCIeOfDWnf2GTEJtP3NiBVFG5anzHlOGKHG9zur40BosaZ3DiiPqncWGdN6vrU+cmQK3yoT7nywnOQFTXT6C4eYv7Lgzzo++Ei9K9wr2sF6ZBvJfJWW0PS80nqhXWTy/fQjQ4XbljktPZfJJUfU0FwjRmMwhUwy2QQwXsDPvnF/kB2nAM9zbaB/C69LRa6tSBBu+P/eL+EE3J4KLOfZ6Ou0XdvXQ9LD1AUXa3p8l9StF3BDbNvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55NDRTyfekNmjQ+peTiPRW/tkm0QGbNwHcGG4EBK7jU=;
 b=Npg50x2YJm3FKqg0OGh2eP+T9ermdWC6ejwW0jlMt2W0R4xQLjEc57amdY4JQNScU0QlJheVeh/whZpIYX0nyvsBIjBQueXne+hHV99jXyTr661Teat84Tgj/pGpCLyDGAb5a8mXNcXf9Uqb3yP/KA2uGhg7vyLVCI/Gn99/zXoMPdrp7SSYaodqMF+ivfMV+NAn/Sl8d6iU0u0HZHVV3gazkylgsint0jL8oXK8Xm8JzIy0OaR/sPTSAdP3HRLuI+0DRkTI8/podBBnqrjd9pxKlWHuzpCKhSPLdyO2KktBI6zcxrFT4sIYEAN/MS7kaPm4zm4+Qsv7+6Tdgjtayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55NDRTyfekNmjQ+peTiPRW/tkm0QGbNwHcGG4EBK7jU=;
 b=lofxA3kTGjX6DemAhyLnOS9pbIn/O+RJIPusqoQQKLRO0YIh592gExpKHP2wkQ0qdOvdSsFdCOt2sLXZb7HBVZ22AEcEziKrmyyni1+0qYT9p0iTN8xTJM4pgREoJMSX7wp70Bx2YxJ7177nYn6XuQaD0C42qsCLcJhiqLHma5Zv0fJ6HCji9FXi6DXU+jwVenDaWYPq6AjQ/hBcAFw/opXA0b7Ue4VK/OZHvEC/XX+mZEWEe82QPj/j83eDr4tqV/gT+MYoKiejBPbudH892tam4e/ybZ810GYb5VjMJ7PvtWtVaj3q0f/MosOHMooIkxuIZ1e6P4UvaIB20O1VFQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Thread-Topic: [PATCH 2/2] vpci: use named rangeset for BARs
Thread-Index: 
 AQHX34NSPeXhoB5iREudUJGr9f4eDKwPWBGAgAAEhQCAAAHcgIAAATqAgAABWoCAAAKVgIAAAYKA
Date: Mon, 22 Nov 2021 11:14:11 +0000
Message-ID: <e1476cab-e0dd-6415-4b23-11fc8d737cc1@epam.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com> <YZtwj0OKrNaZ7s5X@Air-de-Roger>
 <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
 <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
 <a0345cce-5b44-6cdb-681f-002403893e31@suse.com>
 <90fe8b04-4bc3-2d10-e94e-70e5e28c9780@epam.com>
 <44e5403f-bd76-dbd6-7af0-b1807a9c89bc@suse.com>
In-Reply-To: <44e5403f-bd76-dbd6-7af0-b1807a9c89bc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b82d870-3d77-4053-f56c-08d9ada935bb
x-ms-traffictypediagnostic: AM7PR03MB6181:
x-microsoft-antispam-prvs: 
 <AM7PR03MB618168ED170F7C60689CF4DFE79F9@AM7PR03MB6181.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:197;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /nHAC3qrKiVNVGoIum6halr/Yp3WLK9lqXo+hcHtokH9IdoPnyihVTlSCsbKdQ3hfvGaQm8Y3gfXqlQC2JHC+wq2z5y6rgOgr0RN0VjWmqp/2N/gTyflhV0G8w2tmUCv6VCqYwOF/TR9x062HMALnyWBKXQPZtbDlDN2uA8p9tVNrrZxOnC+zVokyD1ewFrZN5SHfJDiEFM9dqIwyxK688jxjOo6D6afMvyMpdYW+fwK1SsR51BLQGILAlEutACOb78AN7R2prQL7lO3ns2YaWsINlMT1b6HvzUDX8SJeEw0ojqkHs9O2r3q56XiMW3MZRYqVXHnqgmCBqq2hmgIfo8OTs+T4ijJktz3+inkDZmcnThbEJuvQgAcVGPPsS/WbF4n7ncjY6t4r4rNgl0JYETvJtLJI2v2nj8ahaghkr4kVTZ78cp9G7E7qDkYXGdtlr2Zl1IJLQb3Hg12w1SY92CGfRKHQ6yPM/ZHTd4mAkBUmtLgj/Mx8zp4jC/4fRz59zfrLPabfacnjqzby3Gh+r5uAKMVLMlE5LWFw12vvRrJjR9e49ARKnydGRGO2GuOA+Yt8wvG5T4dz+C+XWmfzYPc3w7KorqRpkWgs0AhrIR0kBmqmXFY44GUMm8PI/A/j8PPXEOW1SMAFPBUAI0ffKJxZCxL+UcGXBIaCRw7Y72mChHZeXExRqFh+sXLKm08UfL9Bp63YivmjjVUfr7GRDnDE2t7GZsMKmtoGnUQkuIfE/uliCGraPcezfIJTTby
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(38100700002)(186003)(2616005)(122000001)(86362001)(36756003)(71200400001)(508600001)(31686004)(6916009)(6512007)(31696002)(8676002)(2906002)(6486002)(8936002)(5660300002)(83380400001)(4326008)(66446008)(38070700005)(64756008)(107886003)(66476007)(66556008)(316002)(54906003)(6506007)(53546011)(26005)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NEZSUHVMaE1rUVdVRVBvdmpwRHczZ2lnbnpnV25hc0VieHZZSnk4cXFIYWE1?=
 =?utf-8?B?bktNbXEzRGttdExFU1MzbTFOcWxhTVUxeEtmbHlJSDdhYyt5OU85U3ZCMmph?=
 =?utf-8?B?bm1GV0diWHA2cjdQT2hnd2FCVVZWYjZrNlAvcW5adlIweWJ5elFPTTdlOHVP?=
 =?utf-8?B?ckp6dlZFcGJXSnRPTVFUcGVYSW9jQzlYWFRwRGRlbDFrbFhxL3hUS3dVelZX?=
 =?utf-8?B?bUFSMUZqb09UYjNKV2huOW1TdExRanBaR0VManNFcm0vOGFFVDdJMEI3czJ5?=
 =?utf-8?B?dXVhRDY5VEVQSm1NWlM2K3V4Y3RrZmxwOENGNDRRY3o5Wm9YOGtVTnJwa1JL?=
 =?utf-8?B?dVk1a3E3TEp6ems0a01EMFpuSXdSTU1WSmp0UE1NSlFxNExENkg3RTd6L3Np?=
 =?utf-8?B?NjhHTnRHaEZOVUQ2K0Z6ZXBxN2hvMUNpcUloM3ZBWlNQODdjd0NFcGFNNXND?=
 =?utf-8?B?ZW5GZzRaWmFTSmJDdGs5ZVptbUw3Z0VqV0V2cm9KWmdTZzhKWEd6SHVpSnEr?=
 =?utf-8?B?MXFuWFpmeW9iUEFFaUFLeHRUU2JPV3RIdEVIaHdrc0E2M1hpeGtJblh0ZHpw?=
 =?utf-8?B?YUV6UDFJWlJTVVZES3Q1QjlhZDZwV2xWaWRWZmpoSUw1Vko1ck9tWkVSYnUr?=
 =?utf-8?B?SjVxbEh6ZjhISnF2RDBvZUJ5S1hZeWVMdzN0UjBhVjFoS0FjQ05URVM5N012?=
 =?utf-8?B?ZU1pYnB5M3JNVmFzMGtaczUrbkQ2R0gzVEQ5RDJuMjdWWXk4cWgrUFgvY1pF?=
 =?utf-8?B?ck01Wk1LeTBvUklBS2FXS0hSdk9IZWdEV2RydUE0U0VJNFpTdklraXFKQmFv?=
 =?utf-8?B?SzNTYzE2VXNhVlMrVWhrTVFhTlBZbzVCUXRtT1pJMGp5ZVZuclNGY3ZNYzQ0?=
 =?utf-8?B?OVZ0eDJNUXNteHZvRWxzN1d0Z25xU2c5bS9mdmo2S2xETW5GdWZScC9udmJL?=
 =?utf-8?B?T0J0Y2FGSHhuYTBxcWVFRDBseGc0NTBzS0ZCUWlHU3crUkVmeU1YVk9GTmsw?=
 =?utf-8?B?bVExSGxseC83WEN5dG0xRjdOUkdyc2Z5VEMwL3VBK3hzdFVZNHc2TEtZMlFP?=
 =?utf-8?B?aXBwclhKVjY4UEJVZ2RzUG8vVWFDY2duelJwUnk3Um5hT1RlTVRRa1BIZkxy?=
 =?utf-8?B?dWl5OElpc0lrakZzQldMOHBuUkJ0NG9rVEhKdnZBM055L2tseGdaeHRVTktD?=
 =?utf-8?B?VnAyam90amVsbTBjWUFLU0xCNWFaSTFtVmVBR21GcFErUjI1dUtwOVBoNkkw?=
 =?utf-8?B?UE1ZNTdPelAwazlxanlOS2dVaDlTR1doQyswY0RqWTZIOHc3dXBTQml1TG1s?=
 =?utf-8?B?anJhUGlxRWl5MUZuWjZEeE9ONmtMN1U0N1prMjFTeGZtUVJpM0N2UUlaVzVO?=
 =?utf-8?B?ZGY0MEJtdVQ2djk1dGt2YjNwMkh1Tkg1RXJtYjdtNTMzTDRqN2lZeWs1elJQ?=
 =?utf-8?B?RTdHcnU0ZmNpZ3hzL0FtYU8wMnpTa2xMWU5qWWtFeDE3d0NRMVhZR0J2aHpI?=
 =?utf-8?B?dVp6bjZBZGZWbmJFYldwcXZ0YjNWa2V1QTF3Rmd4eDdzdDFyYkE3eFF6V3lT?=
 =?utf-8?B?cHB4NXdIZHA0Wk9rTmR3VFR2eDZGSlhzOEsyV3oyVlFNcGNBT2xyQWluZmJT?=
 =?utf-8?B?UytYS2Y1bER5aXZPNDhXMC9ML3hVQlZjOEpEQWs0M2MxYjhNTzl5a05qak0v?=
 =?utf-8?B?OWpwbTdPOFJxd2QrQVdHaG0yZk8vVFFqVVl5L2V6aTEyRDhWcDVCdDFtZkpQ?=
 =?utf-8?B?dncyRW5Ja1FKa1IxWnhWNThtdUpTZFZqWGJzb0luU3QxaS9RcldCdDU0dW8v?=
 =?utf-8?B?M1NIUlYwWm1SZGVDZHZab2lZOWtDN0tRQWxYS3MrZm1Uai9XcGo1bllINlg5?=
 =?utf-8?B?TWpYVTBtNW4rT283TVZZMGNzTWM4M3JxMEdKdFgzNmsxTjNZL0RVTkl3OWJq?=
 =?utf-8?B?TmZNejNCL1ZITXFHelphNGVsbm9jNEtRTUQ2ZUNUSFpoa1NrUWdnLzB4OXB3?=
 =?utf-8?B?S3diWnFDcFZTVFc5SDJpS0xldGV1cEsyZk5sc21CUVphV0tHbVVyNGxzWDMz?=
 =?utf-8?B?eWVNVGgxU3RnMCt2bFhxNGgraTErb3NvWU9EVzFQcElUdFlZbTdGWkJOYmtl?=
 =?utf-8?B?SlE3QUR2RjdyWFp4Um8zT01ZUVhXd0d2eXhQeS93OHhOWkZQOTBzT2FhVHBk?=
 =?utf-8?B?b0hLREJJdmVldmIyeHpFR3h6aUVDYWUxKzI1cGJ0NFQvbW9CNloxbDZYcVRh?=
 =?utf-8?B?TlhBRFdYL2MyQkZCTG13dEQycDZFN2FDQjVHczd0WFdnZVpqNXYrK0R6YkxU?=
 =?utf-8?B?NXc5eGFKcjEwU2psMG44QWZVbGhmMGdmVDgzWml3Z1FEbHlFcVUvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36DA7204CE055A4CB6E872D4E9736C6F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b82d870-3d77-4053-f56c-08d9ada935bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 11:14:11.1338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3CCPykB7wJLX9XfXpkFKVtCWptqvdcWcRKyaHUHg4BpjAtoABt7XE3SJPTmo9PBtZspDH+MzMug0FXv8OOuaYIsDDoQgY4K0k2jSw2lyDEIRzhVMOxEhipVr0Q4kwP/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6181
X-Proofpoint-ORIG-GUID: gIJs0j3BiMTgx8RkF6siFuOAEz74rGCr
X-Proofpoint-GUID: gIJs0j3BiMTgx8RkF6siFuOAEz74rGCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_05,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220059

DQoNCk9uIDIyLjExLjIxIDEzOjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjIuMTEuMjAy
MSAxMTo1OSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAyMi4xMS4yMSAx
Mjo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjIuMTEuMjAyMSAxMTo1MCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDIyLjExLjIxIDEyOjQzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDIyLjExLjIwMjEgMTE6MjcsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6DQo+Pj4+Pj4gT24gTW9uLCBOb3YgMjIsIDIwMjEgYXQgMTE6Mjg6MjVBTSArMDIwMCwg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3ZwY2kvaGVhZGVyLmMNCj4+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0K
Pj4+Pj4+PiBAQCAtMjA2LDEyICsyMDYsMTYgQEAgc3RhdGljIHZvaWQgZGVmZXJfbWFwKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4+Pj4+PiAgICAgc3RhdGljIGlu
dCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2X3QgY21kLCBi
b29sIHJvbV9vbmx5KQ0KPj4+Pj4+PiAgICAgew0KPj4+Pj4+PiAgICAgICAgIHN0cnVjdCB2cGNp
X2hlYWRlciAqaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4+Pj4+Pj4gLSAgICBzdHJ1
Y3QgcmFuZ2VzZXQgKm1lbSA9IHJhbmdlc2V0X25ldyhOVUxMLCBOVUxMLCAwKTsNCj4+Pj4+Pj4g
KyAgICBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbTsNCj4+Pj4+Pj4gKyAgICBjaGFyIHN0clszMl07DQo+
Pj4+Pj4+ICAgICAgICAgc3RydWN0IHBjaV9kZXYgKnRtcCwgKmRldiA9IE5VTEw7DQo+Pj4+Pj4+
ICAgICAgICAgY29uc3Qgc3RydWN0IHZwY2lfbXNpeCAqbXNpeCA9IHBkZXYtPnZwY2ktPm1zaXg7
DQo+Pj4+Pj4+ICAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+Pj4+Pj4+ICAgICAgICAgaW50IHJj
Ow0KPj4+Pj4+PiAgICAgDQo+Pj4+Pj4+ICsgICAgc25wcmludGYoc3RyLCBzaXplb2Yoc3RyKSwg
IiVwcCIsICZwZGV2LT5zYmRmKTsNCj4+Pj4+Pj4gKyAgICBtZW0gPSByYW5nZXNldF9uZXcoTlVM
TCwgc3RyLCBSQU5HRVNFVEZfbm9fcHJpbnQpOw0KPj4+Pj4+IFlvdSBhcmUgc3RpbGwgbm90IGFk
ZGluZyB0aGUgcmFuZ2VzZXQgdG8gdGhlIGRvbWFpbiBsaXN0LCBhcyB0aGUgZmlyc3QNCj4+Pj4+
PiBwYXJhbWV0ZXIgcGFzc2VkIGhlcmUgaW4gTlVMTCBpbnN0ZWFkIG9mIGEgZG9tYWluIHN0cnVj
dC4NCj4+Pj4+Pg0KPj4+Pj4+IEdpdmVuIHRoZSBjdXJyZW50IHNob3J0IGxpdmluZyBvZiB0aGUg
cmFuZ2VzZXRzIEknbSBub3Qgc3VyZSBpdCBtYWtlcw0KPj4+Pj4+IG11Y2ggc2Vuc2UgdG8gbGlu
ayB0aGVtIHRvIHRoZSBkb21haW4gQVRNLCBidXQgSSBndWVzcyB0aGlzIGlzIGtpbmQgb2YNCj4+
Pj4+PiBhIHByZXBhcmF0b3J5IGNoYW5nZSBhcyBvdGhlciBwYXRjaGVzIHlvdSBoYXZlIHdpbGwg
aGF2ZSB0aGUNCj4+Pj4+PiByYW5nZXNldHMgcGVybWFuZW50IGFzIGxvbmcgYXMgdGhlIGRldmlj
ZSBpcyBhc3NpZ25lZCB0byBhIGRvbWFpbi4NCj4+Pj4+Pg0KPj4+Pj4+IExpa2VseSB0aGUgYWJv
dmUgcmVhc29uaW5nIChvciB0aGUgYXBwcm9wcmlhdGUgb25lKSBzaG91bGQgYmUgYWRkZWQgdG8N
Cj4+Pj4+PiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+Pj4+IElmIEkgZm9sZCB0aGVuIHRoZXJlIGlz
IG5vIHJlYXNvbiB0byBhZGQgdGhlIGNvbW1lbnQsIHJpZ2h0Pw0KPj4+IEknZCBzYXkgeW91IHN0
aWxsIHdhbnQgdG8ganVzdGlmeSB0aGUgY2hhbmdlIGZyb20gImFub255bW91cyIgdG8gIm5hbWVk
IGFuZA0KPj4+IGFjY291bnRlZCIuDQo+PiAiTWFrZSB0aGUgcmFuZ2Ugc2V0cyBwZXJtYW5lbnQs
IGUuZy4gY3JlYXRlIHRoZW0gd2hlbiBhIFBDSSBkZXZpY2UgaXMNCj4+IGFkZGVkIGFuZCBkZXN0
cm95IHdoZW4gaXQgaXMgcmVtb3ZlZC4gQWxzbyBtYWtlIHRoZSByYW5nZSBzZXRzIG5hbWVkDQo+
PiBhbmQgYWNjb3VudGVkLiINCj4gTWFraW5nIHRoZW0gcGVybWFuZW50IGlzIGEgcmVxdWlyZW1l
bnQgb2YgeW91ciBjaGFuZ2UgaWlyYywgc28gSSdkIHN0YXJ0IHdpdGgNCj4gIkJlY2F1c2UgdGhl
IHJhbmdlIHNldHMgbm93IGJlY29tZSBwZXJtYW5lbnQsIG1ha2UgdGhlbSAuLi4iLg0KIkFzIHRo
ZSByYW5nZSBzZXRzIGFyZSBub3cgY3JlYXRlZCB3aGVuIGEgUENJIGRldmljZSBpcyBhZGRlZCBh
bmQgZGVzdHJveWVkDQp3aGVuIGl0IGlzIHJlbW92ZWQgc28gbWFrZSB0aGVtIG5hbWVkIGFuZCBh
Y2NvdW50ZWQuIg0KPg0KPiBKYW4NCj4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

