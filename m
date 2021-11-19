Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7E456EFC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227847.394190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3GB-0000H0-Ai; Fri, 19 Nov 2021 12:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227847.394190; Fri, 19 Nov 2021 12:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3GB-0000Dw-6j; Fri, 19 Nov 2021 12:44:55 +0000
Received: by outflank-mailman (input) for mailman id 227847;
 Fri, 19 Nov 2021 12:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo3G9-0000DF-Sg
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:44:53 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cb73e2e-4936-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 13:44:52 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJC4fMX004555;
 Fri, 19 Nov 2021 12:44:50 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cebkv84j2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 12:44:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3374.eurprd03.prod.outlook.com (2603:10a6:803:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 12:44:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:44:44 +0000
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
X-Inumbo-ID: 7cb73e2e-4936-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/gslR0zJygztveIK+p8CosWObAorCZf01vwPgQLC+3kEOAWISOrt9ejXNqOVaVVm25+YUWs1facNU6Hifhm+lKZ6LANRpDaEOIVXcoAtKleRr1WD+bhaC7FkfB79htnrGT3wvzLiwXL/NkczLXNKoEYnov9Lwo76YzJUzxNKAL+R1+n95TjRg/mMo9ORs5aGMhHB0ePo6ofuUoKc+Qc9mEfjcW/uaaYJcmphLZqXzkWfIA/1WR9qWJSapDP4lCmgi6ALSV7ROP7saNREmAVVEFoBRblAwtb2IHyKf7FCBq4FI2EnGztv7Npx4MArQgAbyCDJV3RZoo8AwGNkpwAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH9qTMIG6Td3WekJv9Kf8c821Gtj4t5tegPnX2Rf3YQ=;
 b=KdiL3k3YtQSVtGFDM9uHal1kkAvCIwrRQoiNGJCFR52qivtKJXu32F7HY6Gs9o5FY8T/r/TA4tOoIRanKwNUa/0JTkOCKbTOE5VWw/1EPTOU8H9+q/bMxywTj+dPw9Xn5FFxihsaBDrjApl5PmZWuFl6qMw/w2UTeGZVOSTl9V7fVb9dbMFfA+PsCQcPcds0GIlWGjhcnJLSuu6TWygcHZ4Epbe9OkhmvkiZUcGBwvb079kcPebHXajlfuzr/e7ChUaG08ELpzXkkO0h5fCWEhtaHfE+t09+k+6DRwMYwe+XAOTd2ez4MgtGJQWtnLJLOsEFVPIrKjdaq51SI24+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH9qTMIG6Td3WekJv9Kf8c821Gtj4t5tegPnX2Rf3YQ=;
 b=Plkj0qyKm4McweUrAuuOH5F+bfRRbcOSdX1Hx0B3YM8DM5Wg4FRCQoVe0b2LgZdYP2Kl4NMpYAIWKVfHYKcnEo4cly/L1FlpVaLV3OTydvQdGiYW9n/qwqz3I5Kr9NAJnksl1JOA3gRT5rFIxc6/bUxD7yk1gbMgPgoKRgGJMqvufwJf63z/4NackV4NrdH3SyfRj8YNU3Bu4PtYifoEt/RFBhKDt9Ks6V9gL07DFt/M/EE+Q2nMCYL2V7f0M44Q8DlxWiOVyKJWotUzIk8J6GquJMDJBxmdvm20XpZtnXWqEjol9lN/lrISSMa0OTPdtOwquj1tzHf4ZcSsGe4Efw==
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
Subject: Re: [PATCH v4 07/11] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v4 07/11] vpci/header: program p2m with guest BAR view
Thread-Index: AQHX0hJLYbNons1z5kiEnkmparMbRqwK306AgAADAQA=
Date: Fri, 19 Nov 2021 12:44:44 +0000
Message-ID: <d12380fd-83de-3c56-99c5-c3f35c108291@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-8-andr2000@gmail.com>
 <e64d3e7b-a725-07aa-3a03-512868527221@suse.com>
In-Reply-To: <e64d3e7b-a725-07aa-3a03-512868527221@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cb698df-e052-48bf-cc46-08d9ab5a5d2e
x-ms-traffictypediagnostic: VI1PR0302MB3374:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33745EBAF8C054832C188C4BE79C9@VI1PR0302MB3374.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 d/d6Eqic/j1gIqrzAJX1TEIe762mJn7XUuo+9pBKZlc7AEn2eG9svwlLsnR4Uwkux+CXHQ7ZOQ3yT/I2adRbzw9q2ZoJQVGoA24B5iDXWJ6TqA1FXARlqtDQHGoUd8OrI2FE71cQC9QEfucwvGFbVpR67mqGBZJQrIy8A6pcdm0CvYyeQbw0WH0E3w8bEymo+1wnhU3UYy5S0wTA2r1FNqwhUE59YO+n7V029ZlJDm+CnOiomMQVlGSAkjq6WVb6yeLKfCrzhU9Lxlm+d9VtI1MZpIZMk7hrTjAsFoJ/f/KpFPL+ePMLOkhJKEQ5X6QhNRmZk9HawYwT9WDecn3QW+3/9Qac6FINFMCyF78+bJ4lOE+J1Jmk7B7iurpPc2/h1ZT8hS49b9hXSaK1gtQP+cxzBZVp1AkfdrJGoN1qiAqaqbkbPDyueAcLuo4WHCcH0zAgZN5dVuoVDAKUJdyzfGGyGXLrWe44zs/4GeItsix5eMMX6k3WRw7CnQcb5SiFkQzpxNR0b06tVqxve6kVWkGrn+y9XpxZ7yRCrHoIEULQYmsgis+MPAHK+yXc1p3hA55b1kny0VE6cHEE+fDue59Jw0gBRwdS7Rzt3E1XqFAllFqsNmcXNoQsGN2GgHoPl8T50xeMo9dIcP8ZCqqTjB7m5nzlgGxdcu2Jae298e/xBc6btGug0IlgnAcuNauhW47QAXn5PcgAApou118duJJs8911OjOumrsV3KcROP0ERus3D/1gRreRgJoqKMwz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(2906002)(36756003)(31696002)(6486002)(6916009)(7416002)(66946007)(54906003)(508600001)(2616005)(122000001)(6512007)(8936002)(31686004)(6506007)(53546011)(86362001)(71200400001)(83380400001)(316002)(64756008)(38070700005)(8676002)(66476007)(5660300002)(186003)(26005)(38100700002)(107886003)(91956017)(76116006)(66556008)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YnM0UDNOak1WenFNTHBoekQyNjNnbXRFL3RFT0FTYkY2Rzg0NlRiMXczSU9E?=
 =?utf-8?B?NE1DN0MyY0V1YUdPa1BZT0x1YkUvOUF1QXdJMWYwSCswVHJzb3Y5Z3FkeXRL?=
 =?utf-8?B?TC9ScWRsQUE0eXF2WXdvcnJKS3RxU1pJaEhDKy91MW0rUFVMdEpDTFRSK0Ix?=
 =?utf-8?B?SVVmS2haMVMxNUUxSk9vQ09relA2Y2p1M1BuUG5JOUVyd0xyZHMvOE0vQi9Z?=
 =?utf-8?B?MlB6aHlVK25lK2pWVmt2WWtEWnV2dU1QR01GT3pHcmw1UFNmc3VRTW8zRndq?=
 =?utf-8?B?VFVaNXN6ZDNrMStUZUMycnNXTUVMUDdtK1dqMHFGSnd4WTg2SWhHbXZicXc2?=
 =?utf-8?B?cGUvaS9jUlZzZnI4WWJYUTRMOVZPM3dZVWxvYkNqclBWM3k5TXpSaEM2TEx5?=
 =?utf-8?B?WXM1QkwxeGM2ZDJPMmpMRllhQjdEeFFMSDB3YjRPZzV3VXI2Q0hCVmZWbGhU?=
 =?utf-8?B?VHlZaU52T0NqZWl0M3Y0ZHBBdUF6bUVwd1lCdmt2dld4alUreHluUUJ4SU1R?=
 =?utf-8?B?T2Z1RU10RHpNMll5UmQzc2U1cTNTUmdpZnhBMzFmbU4wY0lBS3pjaU5odVU5?=
 =?utf-8?B?RGhuTnlzOXJwb2xJbVl3dmNPaW40R3VLeVgwUUNhV2hpYklLSHMyZUY3U2M2?=
 =?utf-8?B?c3owd242VHpSUzZVQVVxS3JrMm05WjlET0tlcmxvOFJEaEdoUjl1SGRZd1hx?=
 =?utf-8?B?dWZ6NklaTTBmeC9XeU9hL2ljdlJ4MHlJZ2pmbmhzM2U4eVRJTlE5cUVKNjVu?=
 =?utf-8?B?MVV5cVNOVDBoRGgvQnJudEZyWEZBc1c0VE9IdHRYR1NGOTVLYXFkTHdBTmdG?=
 =?utf-8?B?U1A0OC9hbnVSS0VPMUVKVlh3bStmbXZxd1FhMU81NlcyOWRYR0RHV2JqRFBF?=
 =?utf-8?B?dmI1d0FqR2pia0Vnc2pNa2wzZVR2dGRYbUp0SDZuNGxncktCdEtQUzg0ek5u?=
 =?utf-8?B?YXN4cGFwY0pKUDdic09HL3h2T1V5L2tGK09TWVlMWWJ1R09wajNrK3lOUjVP?=
 =?utf-8?B?L2dBL1hLRjRDTmU1cFVDUlhlWUp0YjY5TTNSNTcrT3lkRjVGTkJDcWdUNFRB?=
 =?utf-8?B?QnMxQStHOFVuNEIyYnNJdkFKV1FtOEEwNlZlL1NTVDZ1OUtsMjBzQ0h6cE1I?=
 =?utf-8?B?OEJDb3FPSDYwZzVqYXZsWmtVejZFWGZBL0F5WjgzVVAremZmNzQwVGpPak53?=
 =?utf-8?B?b0w4Z2NPUStQT3RjL0RHQkpFMGJiQ1J5dmlZTXBVUVdvVUV6U2c3ZWhZcm43?=
 =?utf-8?B?M012czhjM0JPNkgwWFMyRERtdEE5RzNDT0dOblUyYWRreHBIN3dac2o3d3BG?=
 =?utf-8?B?cmQ5UWtDYUNVTGhpOGhmK1RncFFZVVpieFhXZDIvUXZiSEpSL2ViSUs5NVg0?=
 =?utf-8?B?L3NmdEdTQm5nbmF6NVJYdERldjVFTUhKQkR1QnJZZWxWWlBNSm91UkUwSy9z?=
 =?utf-8?B?dHJHQzZSU3VhcEhNSmU1cFJETlpSdm9MU2xnNzNWODNBWXBrUUNZMnV4RFk1?=
 =?utf-8?B?V3NoNW5EbGcremJ6K3czYXFwVkU4eXk1dUEyRWFsWE1qcFJLcHZ3cG83cU9T?=
 =?utf-8?B?SkJsQ3JrYnVxamVqWFI3ZHl4U3pYNW1sV1VkZFJaT2VBT0tNS24vOEQvMWkx?=
 =?utf-8?B?eU80NDBLZ01TYnQvdkFrcmVRV3BBSDMzSUdTOTZveDRBS08vYWRZaFYyaDIy?=
 =?utf-8?B?TEx1Z1c5dFVEaGRyclRrOW9mZnpnZFdlM3BOUlhFR3A5Z3YxSE8xQ2piOWpM?=
 =?utf-8?B?UEVnTlVkVC8zY1hSWERNRjJONGRhek5tU3hjcG9YcGVIdmJpKy9wY1dqOWV6?=
 =?utf-8?B?eHdjbFZFellQNEJCVmtOaE83MFI2QXJ1YnRVSEtsN3cvY1M3MkVLSzNxSWNJ?=
 =?utf-8?B?VnZPY2VGOUwwVFRDZEpTdi8vdVNDYkU2d0grWjBtdFBteFVya3UyWTBZZGZq?=
 =?utf-8?B?ejZXOE8xYzBqQWVlbGhNdXJrNjFKN3RkNXBUME9Kck80c09LeTlwNVptNTU2?=
 =?utf-8?B?N1dFK0tNUWo3SDdQcVRYMm1EOG9ONWljcWdYamliV1pOOWQwWnRPbHlYWUx0?=
 =?utf-8?B?a3o5SkJQak9ZRWJvall3OFZmTWY2Ym5acXd1ZTA2aE1QRjlvQkFwYTEyU0ov?=
 =?utf-8?B?aGhBY1dPOGtCeDJzTVdVUDdZbDQyTE01Zm5rUFpXRVprek9aWXJyUUxic1Nr?=
 =?utf-8?B?VUx5dkNsSzJLZStqdzFnclRSU2NpdE4vMDV4R001cGdxN1BpR0tGL2ovVkVR?=
 =?utf-8?B?cmZGU0xZNDhCK0N3czNqbEhrYXRDYmVhUkd1NXJ1aW5INm9VclRjZ3VJcUo5?=
 =?utf-8?B?dTlwQ013T0xteVIyTUswUUF1aTd0bVpxYlNlanRqaGxEaEtxTy9Idz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB083E0047595F46B29FFDB40C1200D5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb698df-e052-48bf-cc46-08d9ab5a5d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 12:44:44.7494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Embn6XJqYUQsv1GWVRZTf8N6prA9GafxSomtiXFhDhJ/+3890Xxb4inA3JAf3FcLpqFNCWKbfLYxATCU0bD5RXHr6ChLVQSm4XLSpXvtOsy9hds9090bqNnyUYTWu/Dg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3374
X-Proofpoint-GUID: muRRpTA6q1SLGClipYYD2fYUEMH121sW
X-Proofpoint-ORIG-GUID: muRRpTA6q1SLGClipYYD2fYUEMH121sW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190070

DQoNCk9uIDE5LjExLjIxIDE0OjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gVGFrZSBpbnRvIGFjY291bnQgZ3Vlc3QncyBCQVIgdmlldyBhbmQgcHJvZ3JhbSBpdHMgcDJt
IGFjY29yZGluZ2x5Og0KPj4gZ2ZuIGlzIGd1ZXN0J3MgdmlldyBvZiB0aGUgQkFSIGFuZCBtZm4g
aXMgdGhlIHBoeXNpY2FsIEJBUiB2YWx1ZSBhcyBzZXQNCj4+IHVwIGJ5IHRoZSBob3N0IGJyaWRn
ZSBpbiB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPiBJJ20gc29ycnkgdG8gYmUgcGlja3ksIGJ1dCBJ
IGRvbid0IHRoaW5rIGhvc3QgYnJpZGdlcyBzZXQgdXAgQkFScy4gV2hhdA0KPiBJIHRoaW5rIHlv
dSBtZWFuIGlzICJhcyBzZXQgdXAgYnkgdGhlIFBDSSBidXMgZHJpdmVyIGluIHRoZSBoYXJkd2Fy
ZQ0KPiBkb21haW4iLiBPZiBjb3Vyc2UgdGhpcyB0aGVuIHN0aWxsIGxlYXZlcyBvdXQgdGhlIGNh
c2Ugb2YgZmlybXdhcmUNCj4gZG9pbmcgc28sIGFuZCBoZW5jZSB0aGUgZG9tMGxlc3MgY2FzZS4N
ClNvdW5kcywgZ29vZCBJIHdpbGwgdXNlIHlvdXIgd29yZGluZywgdGhhbmtzDQo+DQo+PiAtLS0g
YS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hl
YWRlci5jDQo+PiBAQCAtMzAsNiArMzAsMTAgQEANCj4+ICAgDQo+PiAgIHN0cnVjdCBtYXBfZGF0
YSB7DQo+PiAgICAgICBzdHJ1Y3QgZG9tYWluICpkOw0KPj4gKyAgICAvKiBTdGFydCBhZGRyZXNz
IG9mIHRoZSBCQVIgYXMgc2VlbiBieSB0aGUgZ3Vlc3QuICovDQo+PiArICAgIGdmbl90IHN0YXJ0
X2dmbjsNCj4+ICsgICAgLyogUGh5c2ljYWwgc3RhcnQgYWRkcmVzcyBvZiB0aGUgQkFSLiAqLw0K
Pj4gKyAgICBtZm5fdCBzdGFydF9tZm47DQo+IEFzIG9mIHRoZSBwcmV2aW91cyBwYXRjaCB5b3Ug
cHJvY2VzcyB0aGlzIG9uIGEgcGVyLUJBUiBiYXNpcy4gV2h5IGRvbid0DQo+IHlvdSBzaW1wbHkg
cHV0IGNvbnN0IHN0cnVjdCB2cGNpX2JhciAqIGhlcmU/IFRoaXMgd291bGQgZS5nLiBhdm9pZCB0
aGUNCj4gbmVlZCB0byBrZWVwIGluIHN5bmMgdGhlIGlkZW50aWNhbCBleHByZXNzaW9ucyBpbiB2
cGNpX3Byb2Nlc3NfcGVuZGluZygpDQo+IGFuZCBhcHBseV9tYXAoKS4NCkFoYSwgeW91IG1lYW4g
dG8gbW92ZQ0KDQorICAgICAgICAgICAgZGF0YS5zdGFydF9nZm4gPQ0KKyAgICAgICAgICAgICAg
ICAgX2dmbihQRk5fRE9XTihpc19oYXJkd2FyZV9kb21haW4odi0+ZG9tYWluKQ0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA/IGJhci0+YWRkciA6IGJhci0+Z3Vlc3RfYWRkcikpOw0K
KyAgICAgICAgICAgIGRhdGEuc3RhcnRfbWZuID0gX21mbihQRk5fRE9XTihiYXItPmFkZHIpKTsN
Cg0KaW50byBtYXBfcmFuZ2UuIE1ha2VzIHNlbnNlLCBpdCBzZWVtcyBJIGNhbiBkbyB0aGF0DQoN
Cj4+IEBAIC0zNywxMiArNDEsMjQgQEAgc3RhdGljIGludCBtYXBfcmFuZ2UodW5zaWduZWQgbG9u
ZyBzLCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRhdGEsDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgKmMpDQo+PiAgIHsNCj4+ICAgICAgIGNvbnN0IHN0cnVjdCBtYXBf
ZGF0YSAqbWFwID0gZGF0YTsNCj4+ICsgICAgZ2ZuX3Qgc3RhcnRfZ2ZuOw0KPiBJbW8gdGhpcyB3
YW50cyB0byBtb3ZlIGludG8gdGhlIG1vcmUgbmFycm93IHNjb3BlLCAuLi4NCj4NCj4+ICAgICAg
IGludCByYzsNCj4+ICAgDQo+PiAgICAgICBmb3IgKCA7IDsgKQ0KPj4gICAgICAgew0KPj4gICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSA9IGUgLSBzICsgMTsNCj4+ICAgDQo+PiArICAgICAg
ICAvKg0KPj4gKyAgICAgICAgICogUmFuZ2VzIHRvIGJlIG1hcHBlZCBkb24ndCBhbHdheXMgc3Rh
cnQgYXQgdGhlIEJBUiBzdGFydCBhZGRyZXNzLCBhcw0KPj4gKyAgICAgICAgICogdGhlcmUgY2Fu
IGJlIGhvbGVzIG9yIHBhcnRpYWxseSBjb25zdW1lZCByYW5nZXMuIEFjY291bnQgZm9yIHRoZQ0K
Pj4gKyAgICAgICAgICogb2Zmc2V0IG9mIHRoZSBjdXJyZW50IGFkZHJlc3MgZnJvbSB0aGUgQkFS
IHN0YXJ0Lg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBzdGFydF9nZm4gPSBnZm5fYWRk
KG1hcC0+c3RhcnRfZ2ZuLCBzIC0gbWZuX3gobWFwLT5zdGFydF9tZm4pKTsNCj4gLi4uIGFsbG93
aW5nIChpbiBwcmluY2lwbGUpIGZvciB0aGlzIHRvIGJlY29tZSBpdHMgaW5pdGlhbGl6ZXIuDQpZ
ZXMsIGdvb2QgaWRlYQ0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

