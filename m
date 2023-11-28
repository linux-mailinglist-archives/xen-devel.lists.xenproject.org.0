Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA6B7FAF7B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 02:21:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642687.1002327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7mmf-0005ZB-P6; Tue, 28 Nov 2023 01:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642687.1002327; Tue, 28 Nov 2023 01:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7mmf-0005Wh-MP; Tue, 28 Nov 2023 01:21:05 +0000
Received: by outflank-mailman (input) for mailman id 642687;
 Tue, 28 Nov 2023 01:21:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nMQ7=HJ=epam.com=prvs=5696eae2e6=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r7mme-0005Wb-KV
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 01:21:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62cf4f63-8d8c-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 02:21:00 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AS0fZwl022786; Tue, 28 Nov 2023 01:20:43 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3un5vdr1c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 01:20:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB3PR0302MB8918.eurprd03.prod.outlook.com (2603:10a6:10:43b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 01:20:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 01:20:36 +0000
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
X-Inumbo-ID: 62cf4f63-8d8c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuyhFnKut4iK56T3LtUK4Ahe7ZkifCLAFoTK4wsvDJTHQRSdakuHW8OZYAo9q6JNe9CY3uc+V1+PC9TPCrd6tAcm8XsFt3qjCtKw0+Rejjz1T+aMO2UECIl6gLRRbH1O+qioWwKNgvtwwzHTIujHv0517gqDwYfABjraiVyGzbLdbENYyLP6K9Fy2vBd+eTCMJ66KLDFfgAqTn+KgPf0YnxQjCjal1TNOCEVti4IBqGpBPOxTLWkmHZKLysykQA88/4n+BZLOfA7cOYb4roSIrXWj9K7wmKKgnmbkVZryGEfY96zsmh29gETefpMk8+0i8iK0m4QlMY7B6+iX7IBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSDu9I+631VGlq0MXvzkyYgsxuEOrGfIBIEr3UjIK3k=;
 b=ipoJcWXtN1cUPpZ2uMmqxTyl4IZ620yj8qCjcfw8ie6+FjIbCJZEmHf6V1dQtgO3eyBhmG6rRzP0BIaPw0LmRn5GahnMBGTThPDyRQ9cC6tyyLYIk6+4qENGprRQecHXadq/H8DbhjAKWp05rK96tMskENGs3eZeXM0KxtCftrJK5C8UT8b9+zploAK8ae7vG67EiqO0L+bexnLYf0+4uRb+UQ5n/TduapQU1iDsSo8xWFEgTisjL3LTMu6NvY37VWIBGENafbvSNztAilslFJ83ojgBZ3JDE7yK5v+/7YrU404cP4lpReTs4GQOEjumFQLchuzQdHRtYoL6BsVuDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSDu9I+631VGlq0MXvzkyYgsxuEOrGfIBIEr3UjIK3k=;
 b=SsMHBt2JizT8cZcNpYEvBT+LiSdZZe1GgTZSYEIGJ1oVJALBvcB6gXoy4TFRVlVtTJYeLFo+hlHlXEqSa7msO8wylQ7fMeMuRj6n0OlAR93mzRfonbPi7XaDOHR4t1XMr1111yTTVoGXz7pzLFK8Nu8iiU4gG+DIOUlIuSj/cC6IKt+5RZT/fSfX4OP3WfrQ/bb6okRMWMz6B2y8mE6nZNn/x0/utj8969dlS4MEhAH/b2e57bBotafvRWHbRR7tQbpuEQaJ8/I7dlWBd1TGodjk1FCtJJxKsk3zcv4wnLtJsgmfvLStullI9Nie1kU957t4aUoFT4Fvuk//BCD/7Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>, Paul Durrant
	<xadimgnik@gmail.com>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
        "open
  list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
        "open list:Block  layer
 core" <qemu-block@nongnu.org>
Subject: Re: [EXTERNAL] [PATCH v3 2/5] xen: backends: don't overwrite XenStore
 nodes created by toolstack
Thread-Topic: [EXTERNAL] [PATCH v3 2/5] xen: backends: don't overwrite
 XenStore nodes created by toolstack
Thread-Index: AQHaHy1b3EzvbBTaE06mm4g67YDmDbCN2w8AgAEGzQA=
Date: Tue, 28 Nov 2023 01:20:35 +0000
Message-ID: <87il5mvfkt.fsf@epam.com>
References: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
 <20231124232400.943580-3-volodymyr_babchuk@epam.com>
 <51fd9b1f4407b92352c109cbef5acf16c91351d4.camel@infradead.org>
In-Reply-To: <51fd9b1f4407b92352c109cbef5acf16c91351d4.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB3PR0302MB8918:EE_
x-ms-office365-filtering-correlation-id: 08684dd8-202e-40ce-53dc-08dbefb03972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MkuNxnIEcKW0Lyb7Li3sObgMoihKaqFFKUkdGcqfPesjXQuo86F5D5PwatAPDcOaJhGPJdW/we3/8trDOXszfZPr8d8ybLhfYfDw30Q72o1TP6RZpEgZQVFBIFiKQO9XRLxoIFPOmrRCM01p86oamw4uDL/0R0KqXZ3BeNNpg/8pdMlQlhncyDdLeKF/IgKfcZSdg/RjOBDUiYGLH51gaV7nBI+KJSMW08HZx5EC4AL0cXBaabvLWFRB4Dn0DDywTjG2ScJCIvAT9SG+DjnYoQsRcpIzr+7VwnfMRBxkkJaB5JmpU58j0+wRUzTzFHHTYX5KBcYl0ueDAa16O9OiAq2HpWV9Mw4pF9HoHa4G3/xdMIl0qqrvrQPjyP52ikj3sIpkm9y7rdH9jthd3y1NBJV+AigviI63DjT9ovvxhW1dRatY2PjhMZmRa7G4+UaJ96i6n7xfWA5XGgtSnEswiXne3esMNzOzoux0vMFH164utxBrUCmqvXmIEnrXybYt/uzKqaWXsvdic0Di84p9VJLqPIeeUExoqfY90Y2j5ginaveIJOkKWwyCfsXNvRhjx5wXtn3OcUfubdQkjCMcy1mnLpkzTdG/hxcmpdAby446e1/dG4t6Kv+60S3EY75A
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(26005)(71200400001)(6506007)(6512007)(4326008)(8936002)(91956017)(7416002)(86362001)(478600001)(6486002)(6916009)(76116006)(66946007)(66556008)(316002)(54906003)(66476007)(66446008)(64756008)(8676002)(55236004)(5660300002)(38100700002)(83380400001)(122000001)(41300700001)(2906002)(38070700009)(4001150100001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VzlqejQ4dXVQMTdLVjRrcnJhUCs0dkcrbUljQkFUUjRNbjVuMmVzVVNwdVVG?=
 =?utf-8?B?alJLbXRSRlprZ3I2Ukg3cHRhVW5VMjE5b0dja0J5V282b3VwN1haVy82Mnpq?=
 =?utf-8?B?VnNqbGJIUHBkTXlhOThralFMdWdSNW1DM3ZBcjhGSTdYTFFvT0dBdEROZmJn?=
 =?utf-8?B?YmVrVTdnUzlZeVVUOWRabFFuN3gwbGRrSkNYYzRJSEpINnd2M1Zhek9VM2Rq?=
 =?utf-8?B?TU8rcW1DdHY1cHV2M3FQNVI4VGNrKzB3Q1RtZExTTHNXQUw4N3VtNjJzVTR2?=
 =?utf-8?B?cE9DeXhLUU0yTm4rVEJCQTBrSElyWStXZHN2dEdrenhaR0p1cEpHd1NpNFJN?=
 =?utf-8?B?cnBwbmFlWmVoNXd6S2lwUjN5Vi8rWmgxczlhMGJEOEVGMCt3Z09TMU4zeTZU?=
 =?utf-8?B?Ny96Y3IyUVFGUkkzTXBZM3hMTnoxQjJBWW5oNkVPOXkvQWRoVXpGUEp6Z3lS?=
 =?utf-8?B?QjRpT3c4b0duOHJkRDA1TTVHWEZlSWFlSS9iTnpUaGZBd1h0ZEpDN3k3eUU3?=
 =?utf-8?B?KzcrWHBhcHpKKzZVaGNEZm9KV1NEVXhQbXdZdUYwSENLTnBHWXdOcmVFR0ZK?=
 =?utf-8?B?R0hrdU1RZnYxNkxPWjl3OXdsWGRTNFd4YlhUcVV6VS9xRFFEMjh6QlFnS0dv?=
 =?utf-8?B?UWVYNlBUTTFPUkNkbG5LSnVNT1N2c0JTMmYzRDRMd1dLeGFQN2VzRFpxQkcv?=
 =?utf-8?B?UFpVNW1TbEVaRExPZ0ZFdlNDU1B2RGpaYWo3dE1JWmt1SXhlVmtob0JXbm1H?=
 =?utf-8?B?Nko0UTgyUXU1aWtFVWFaMWMxNGVoRHd0L2EyMUEwNDc0ZERZUE12NU85MWVi?=
 =?utf-8?B?QXBwTnBpeCtZdzRrSjByL2VBNC9aVVRrcXc5V0lzcVZNdEhROWYwenVDUjRS?=
 =?utf-8?B?bVV6bGZRL2JjYVlFQ2pMS01zaDR6blNZdStCTTlkQXo1YUUrdkV0aVg5NVZS?=
 =?utf-8?B?NnpjOGdka0h3SXU5Y3BZN0VXT2NOYTQyUlMybS9TQmludXVQZmNxWVhSVExp?=
 =?utf-8?B?eWlkNDRIaVFCTWVrVFM2anBaZ1EwUWFHcmx0T1hSaHJoaCtTdHg4U1dNcTVy?=
 =?utf-8?B?N2t5dm02TU9qek8wekRGWExmVGlHS0c5NkZFNkkwWllXMWFWc1VrQk9YN3Zv?=
 =?utf-8?B?WFJ5RE1paVVaMkY2dys3ejFSdW5Yb0VxNGsybW5lQ0FwN2J0Q0R3WFBmd0dn?=
 =?utf-8?B?MEdxTnBDdENMQVRTempDTlMyWTBRa004ZHJsRkRnT0tUdllIWHNhek9GYzE1?=
 =?utf-8?B?UmkzZjhuZnpEejhjb2FlNkhGenZkYnZUK1BjKzBEMGJWeHRpanBhYWdKOGx2?=
 =?utf-8?B?NXo0bGlsNVB5TUZwN0tMS0RDTnBMeUt1WC8yeFYrS3dDdVNRYXVBOG9ueXQv?=
 =?utf-8?B?NDZZaXRINUh6Vm54YmtsSjRDUDNMS1NBVVhLblZUWHZ2dmJvZnpTam5QMjFC?=
 =?utf-8?B?ODlVMkZEMWozWXN3dFlTWFlhUzNlbFNJK3FjeGJNMFZLbThSRVB3RWVUakNP?=
 =?utf-8?B?U3pOa1l3WU53WTRCb1d0NitHWXZwOUVUNmNXQTVTaDZrQW9xQTlYQ1NqMU5M?=
 =?utf-8?B?aTVkN25EZjNjT0hjOE9FRG5EZEhFZ0o4bEd1Vk5hdlpaY2M1NEgrMi9ZNHVR?=
 =?utf-8?B?Z0szM0xaZk1LcnhpOXFJQzhxam8xeFUrSzNmK1RoSFZYOFp5bmZLMTg1cXpt?=
 =?utf-8?B?aXVrQnVyQXFSOC9oQWZlSmh5dFA4OGJVaHBTcE5RRGxCVGVFb1FUMEcxVUtB?=
 =?utf-8?B?QkIrNXhvOEZkcy9aN2h2Zk96Ull2RHgzWnR3V0NGUFNqTzJ5d1hYbmR3aVht?=
 =?utf-8?B?UkpLM2p0R05wekFWYWRoZGVteCtwbSszTHdOM010U2I4SEJ2L21hNEVUOHNn?=
 =?utf-8?B?Y2dlQmYrd3diM2hyV0NYelNiY3pBaUNkUndjdmZUbC9VMUdXNmpzYWM4aTlP?=
 =?utf-8?B?U0J4ZUpyOGdkWjlOMUZqeVk2ei8rcTR0NklYeUdNcWlRTDdtSHUxc1gzOWRr?=
 =?utf-8?B?ZkFwTDFVOFdaRGZQUjMxdEU5QXJTOGRHRXo5UGZ5VUwwbHM3bFJWSWYvTE43?=
 =?utf-8?B?aTEwUHdWcEJaZEZLUVhaY0dhaVp0TUQ1S2xpb05uZlFHN0JqV2tJekJGcWN3?=
 =?utf-8?B?SGd3UjhmMy94M1FZUThlWUQ1S0I2YVdHVncyRmVMTTczNmE2NlUwWUVWdmtw?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <691736B00C6D1E4595BCEA2D0C4C4360@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08684dd8-202e-40ce-53dc-08dbefb03972
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 01:20:36.0039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O77BPFQN1G2fT7WW92WiWXhLzD5VnxwrTE4apV81YLCWI+lHvGgwmSiJfYULPxJoZLkQRRiJ5VvLdzNzDFV+Qqbq434loybb0S77ZVqjwBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8918
X-Proofpoint-GUID: c0vklUpUJpaOH0g9gSmXMIO9x9v8_p5X
X-Proofpoint-ORIG-GUID: c0vklUpUJpaOH0g9gSmXMIO9x9v8_p5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280009

SGkgRGF2aWQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldw0KDQpEYXZpZCBXb29kaG91c2Ug
PGR3bXcyQGluZnJhZGVhZC5vcmc+IHdyaXRlczoNCg0KPiBbW1MvTUlNRSBTaWduZWQgUGFydDpV
bmRlY2lkZWRdXQ0KPiBPbiBGcmksIDIwMjMtMTEtMjQgYXQgMjM6MjQgKzAwMDAsIFZvbG9keW15
ciBCYWJjaHVrIHdyb3RlOg0KPj4gWGVuIFBWIGRldmljZXMgaW4gUUVNVSBjYW4gYmUgY3JlYXRl
ZCBpbiB0d28gd2F5czogZWl0aGVyIGJ5IFFFTVUNCj4+IGl0c2VsZiwgaWYgdGhleSB3ZXJlIHBh
c3NlZCB2aWEgY29tbWFuZCBsaW5lLCBvciBieSBYZW4gdG9vbHN0YWNrLiBJbg0KPj4gdGhlIGxh
dHRlciBjYXNlLCBRRU1VIHNjYW5zIFhlblN0b3JlIGVudHJpZXMgYW5kIGNvbmZpZ3VyZXMgZGV2
aWNlcw0KPj4gYWNjb3JkaW5nbHkuDQo+PiANCj4+IEluIHRoZSBzZWNvbmQgY2FzZSB3ZSBkb24n
dCB3YW50IFFFTVUgdG8gd3JpdGUvZGVsZXRlIGZyb250LWVuZA0KPj4gZW50cmllcyBmb3IgdHdv
IHJlYXNvbnM6IGl0IG1pZ2h0IGhhdmUgbm8gYWNjZXNzIHRvIHRob3NlIGVudHJpZXMgaWYNCj4+
IGl0IGlzIHJ1bm5pbmcgaW4gdW4tcHJpdmlsZWdlZCBkb21haW4gYW5kIGl0IGlzIGp1c3QgaW5j
b3JyZWN0IHRvDQo+PiBvdmVyd3JpdGUgZW50cmllcyBhbHJlYWR5IHByb3ZpZGVkIGJ5IFhlbiB0
b29sc3RhY2ssIGJlY2F1c2UNCj4+IHRvb2xzdGFjaw0KPj4gbWFuYWdlcyB0aG9zZSBub2Rlcy4g
Rm9yIGV4YW1wbGUsIGl0IG1pZ2h0IHJlYWQgYmFja2VuZC0gb3IgZnJvbnRlbmQtDQo+PiBzdGF0
ZSB0byBiZSBzdXJlIHRoYXQgdGhleSBhcmUgYm90aCBkaXNjb25uZWN0ZWQgYW5kIGl0IGlzIHNh
ZmUgdG8NCj4+IGRlc3Ryb3kgYSBkb21haW4uDQo+PiANCj4+IFRoaXMgcGF0Y2ggY2hlY2tzIHBy
ZXNlbmNlIG9mIHhlbmRldi0+YmFja2VuZCB0byBjaGVjayBpZiBYZW4gUFYNCj4+IGRldmljZSB3
YXMgY29uZmlndXJlZCBieSBYZW4gdG9vbHN0YWNrIHRvIGRlY2lkZSBpZiBpdCBzaG91bGQgdG91
Y2gNCj4+IGZyb250ZW5kIGVudHJpZXMgaW4gWGVuU3RvcmUuIEFsc28sIHdoZW4gd2UgbmVlZCB0
byByZW1vdmUgWGVuU3RvcmUNCj4+IGVudHJpZXMgZHVyaW5nIGRldmljZSB0ZWFyZG93biBvbmx5
IGlmIHRoZXkgd2VyZW4ndCBjcmVhdGVkIGJ5IFhlbg0KPj4gdG9vbHN0YWNrLiBJZiB0aGV5IHdl
cmUgY3JlYXRlZCBieSB0b29sc3RhY2ssIHRoZW4gaXQgaXMgdG9vbHN0YWNrJ3MNCj4+IGpvYiB0
byBkbyBwcm9wZXIgY2xlYW4tdXAuDQo+PiANCj4+IFN1Z2dlc3RlZC1ieTogUGF1bCBEdXJyYW50
IDx4YWRpbWduaWtAZ21haWwuY29tPg0KPj4gU3VnZ2VzdGVkLWJ5OiBEYXZpZCBXb29kaG91c2Ug
PGR3bXdAYW1hem9uLmNvLnVrPg0KPj4gQ28tQXV0aG9yZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hl
bmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFZv
bG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCj4NCj4gUmV2aWV3
ZWQtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+DQo+DQo+IC4uLiBhbGJl
aXQgd2l0aCBhIGNvdXBsZSBvZiBzdWdnZXN0aW9ucy4uLiANCj4NCj4+IGRpZmYgLS1naXQgYS9o
dy9jaGFyL3hlbl9jb25zb2xlLmMgYi9ody9jaGFyL3hlbl9jb25zb2xlLmMNCj4+IGluZGV4IGJl
ZjhhM2E2MjEuLmI1MmRkZGRhYmYgMTAwNjQ0DQo+PiAtLS0gYS9ody9jaGFyL3hlbl9jb25zb2xl
LmMNCj4+ICsrKyBiL2h3L2NoYXIveGVuX2NvbnNvbGUuYw0KPj4gQEAgLTQ1MCw3ICs0NTAsNyBA
QCBzdGF0aWMgdm9pZCB4ZW5fY29uc29sZV9yZWFsaXplKFhlbkRldmljZSAqeGVuZGV2LCBFcnJv
ciAqKmVycnApDQo+PiANCj4+IMKgwqDCoMKgIHRyYWNlX3hlbl9jb25zb2xlX3JlYWxpemUoY29u
LT5kZXYsIG9iamVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKGNzKSkpOw0KPj4gDQo+PiAtwqDCoMKg
IGlmIChDSEFSREVWX0lTX1BUWShjcykpIHsNCj4+ICvCoMKgwqAgaWYgKENIQVJERVZfSVNfUFRZ
KGNzKSAmJiAheGVuZGV2LT5iYWNrZW5kKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIFN0cmlw
IHRoZSBsZWFkaW5nICdwdHk6JyAqLw0KPj4gwqDCoMKgwqDCoMKgwqDCoCB4ZW5fZGV2aWNlX2Zy
b250ZW5kX3ByaW50Zih4ZW5kZXYsICJ0dHkiLCAiJXMiLCBjcy0+ZmlsZW5hbWUgKyA0KTsNCj4+
IMKgwqDCoMKgIH0NCj4NCj4NCj4gSXQncyBraW5kIG9mIHdlaXJkIHRoYXQgdGhhdCBvbmUgaXMg
YSBmcm9udGVuZCBub2RlIGF0IGFsbDsgc3VyZWx5IGl0DQo+IHNob3VsZCBoYXZlIGJlZW4gYSBi
YWNrZW5kIG5vZGU/DQoNClllYWgsIEFGQUlLLCBjb25zb2xlIHdhcyB0aGUgZmlyc3QgUFYgZHJp
dmVyLCBzbyBpdCBpcyBhIGJpdCBzdHJhbmdlLg0KQXMgSSBzZWUsIHRoaXMgZnJvbnRlbmQgZW50
cnkgaXMgdXNlZCBieSAieGwgY29uc29sZSIgdG9vbCB0byBmaW5kIFBUWQ0KZGV2aWNlIHRvIGF0
dGFjaCB0by4gU28geWVzLCBpdCBzaG91bGQgYmUgaW4gYmFja2VuZCBwYXJ0IG9mIHRoZQ0KeGVu
c3RvcmUuIEJ1dCBJIGRvbid0IGJlbGlldmUgd2UgY2FuIGZpeCB0aGlzIHJpZ2h0IG5vdy4NCg0K
PiBCdXQgaXQgaXMga25vd24gb25seSB0byBRRU1VIG9uY2UgaXQNCj4gYWN0dWFsbHkgb3BlbnMg
L2Rldi9wdG14IGFuZCBjcmVhdGVzIGEgbmV3IHB0eS4gSXQgY2FuJ3QgYmUgcG9wdWxhdGVkDQo+
IGJ5IHRoZSB0b29sc3RhY2sgaW4gYWR2YW5jZS4NCj4NCj4gU28gc2hvdWxkbid0IHRoZSB0b29s
c3RhY2sgaGF2ZSBtYWRlIGl0IHdyaXRhYmxlIGJ5IHRoZSBkcml2ZXIgZG9tYWluPw0KDQpNYXli
ZSBpdCBjYW4gbGVhZCB0byBhIHdlaXJkIHNpdHVhdGlvbiB3aGVuIHVzZXIgaW4gRG9tLTAgdHJp
ZXMgdG8gdXNlDQoieGwgY29uc29sZSIgY29tbWFuZCB0byBhdHRhY2ggdG8gYSBjb25zb2xlIHRo
YXQgaXMgYWJzZW50IGluIERvbS0wLA0KYmVjYXVzZSAidHR5IiBlbnRyeSBwb2ludHMgdG8gUFRZ
IGluIHRoZSBkcml2ZXIgZG9tYWluLg0KDQo+IEkgdGhpbmsgd2Ugc2hvdWxkIGF0dGVtcHQgdG8g
d3JpdGUgdGhpcyBhbmQganVzdCBncmFjZWZ1bGx5IGhhbmRsZSB0aGUNCj4gZmFpbHVyZSBpZiB3
ZSBjYW4ndC4gKEluIGZhY3QsIHhlbl9kZXZpY2VfZnJvbnRlbmRfcHJpbnRmKCkgd2lsbCBqdXN0
DQo+IHVzZSBlcnJvcl9yZXBvcnRfZXJyKCkgd2hpY2ggaXMgcHJvYmFibHkgT0sgdW5sZXNzIHlv
dSBmZWVsIHN0cm9uZ2x5DQo+IGFib3V0IHNpbGVuY2luZyBpdCkuDQoNCk5vcGUsIEkgYW0gZmlu
ZSB3aXRoIHRoaXMgYXBwcm9hY2guIEknbGwgcmVtb3ZlIHRoaXMgaHVuayBpbiB0aGUgbmV4dA0K
dmVyc2lvbi4NCg0KPg0KPj4gZGlmZiAtLWdpdCBhL2h3L25ldC94ZW5fbmljLmMgYi9ody9uZXQv
eGVuX25pYy5jDQo+PiBpbmRleCBhZmExMGM5NmU4Li4yNzQ0MmJlZjM4IDEwMDY0NA0KPj4gLS0t
IGEvaHcvbmV0L3hlbl9uaWMuYw0KPj4gKysrIGIvaHcvbmV0L3hlbl9uaWMuYw0KPj4gQEAgLTMx
NSwxNCArMzE1LDE2IEBAIHN0YXRpYyB2b2lkIHhlbl9uZXRkZXZfcmVhbGl6ZShYZW5EZXZpY2Ug
KnhlbmRldiwgRXJyb3IgKiplcnJwKQ0KPj4gDQo+PiDCoMKgwqDCoCBxZW11X21hY2FkZHJfZGVm
YXVsdF9pZl91bnNldCgmbmV0ZGV2LT5jb25mLm1hY2FkZHIpOw0KPj4gDQo+PiAtwqDCoMKgIHhl
bl9kZXZpY2VfZnJvbnRlbmRfcHJpbnRmKHhlbmRldiwgIm1hYyIsICIlMDJ4OiUwMng6JTAyeDol
MDJ4OiUwMng6JTAyeCIsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ldGRldi0+Y29uZi5tYWNhZGRyLmFbMF0sDQo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG5ldGRldi0+Y29uZi5tYWNhZGRyLmFbMV0sDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ldGRldi0+Y29uZi5tYWNh
ZGRyLmFbMl0sDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG5ldGRldi0+Y29uZi5tYWNhZGRyLmFbM10sDQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5l
dGRldi0+Y29uZi5tYWNhZGRyLmFbNF0sDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ldGRldi0+Y29uZi5tYWNhZGRyLmFb
NV0pOw0KPj4gLQ0KPj4gK8KgwqDCoCBpZiAoIXhlbmRldi0+YmFja2VuZCkgew0KPj4gK8KgwqDC
oMKgwqDCoMKgIHhlbl9kZXZpY2VfZnJvbnRlbmRfcHJpbnRmKHhlbmRldiwgIm1hYyIsDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIiUwMng6JTAyeDolMDJ4OiUwMng6JTAyeDolMDJ4IiwNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBuZXRkZXYtPmNvbmYubWFjYWRkci5hWzBdLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ldGRldi0+
Y29uZi5tYWNhZGRyLmFbMV0sDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV0ZGV2LT5jb25mLm1hY2FkZHIu
YVsyXSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXRkZXYtPmNvbmYubWFjYWRkci5hWzNdLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG5ldGRldi0+Y29uZi5tYWNhZGRyLmFbNF0sDQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV0
ZGV2LT5jb25mLm1hY2FkZHIuYVs1XSk7DQo+PiArwqDCoMKgIH0NCj4+IMKgwqDCoMKgIG5ldGRl
di0+bmljID0gcWVtdV9uZXdfbmljKCZuZXRfeGVuX2luZm8sICZuZXRkZXYtPmNvbmYsDQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBvYmplY3RfZ2V0X3R5cGVuYW1lKE9CSkVDVCh4ZW5kZXYpKSwNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERFVklD
RSh4ZW5kZXYpLT5pZCwgbmV0ZGV2KTsNCj4NCj4NCj4gUGVyaGFwcyBoZXJlIHlvdSBzaG91bGQg
Y3JlYXRlIHRoZSAibWFjIiBub2RlIGlmIGl0IGRvZXNuJ3QgZXhpc3QgKG9yDQo+IGlzIHRoYXQg
ImlmIGl0IGRvZXNuJ3QgbWF0Y2ggbmV0ZGV2LT5jb25mLm1hY2FkZHIiPykgYW5kIGp1c3QNCj4g
Z3JhY2VmdWxseSBhY2NlcHQgZmFpbHVyZSB0b28/DQo+DQoNCkkgYW0gbm90IHN1cmUgdGhhdCBJ
IGdvdCB0aGlzIHJpZ2h0LiBjb25mLm1hY2NhZHIgY2FuIGJlIHNlbnQgaW4gdHdvDQp3YXlzOiB2
aWEgeGVuX25ldF9kZXZpY2VfY3JlYXRlKCksIHdoaWNoIHdpbGwgZmFpbCBpZiB0b29sc3RhY2sg
ZGlkbid0DQpwcm92aWRlZCBhIE1BQyBhZGRyZXNzLCBvciB2aWEgcWVtdV9tYWNhZGRyX2RlZmF1
bHRfaWZfdW5zZXQoKSwgd2hpY2ggaXMNCnRoZSBjYXNlIGZvciBYZW4gZW11bGF0aW9uLg0KDQpY
ZW4gdG9vbHN0YWNrIGlzIHdyaXR0ZW4gaW4gYSBzdWNoIHdheSwgdGhhdCBpdCBhbHdheXMgcHJv
dmlkZXMgIm1hYyINClhlblN0b3JlIGVudHJ5IGFuZCBmcm9udGVuZCBkcml2ZXIgZXhwZWN0cyB0
aGF0IHRoaXMgZW50cnkgaXMgYWx3YXlzDQpwcmVzZW50LiBTbywgaWYgYnkgYW55IGNoYW5jZSB0
b29sc3RhY2sgaGFzIG5vdCBwcm92aWRlZCB0aGUgTUFDLCB0aGVuDQp0aGVyZSBpcyBzb21ldGhp
bmcgd3JvbmcgYW5kIGl0IGlzIGJldHRlciB0byBmYWlsLCB3aGF0DQp4ZW5fbmV0X2RldmljZV9j
cmVhdGUoKSBkb2VzLiBJIGFtIG5vdCBzdXJlIHRoYXQgaXQgaXMgYSBnb29kIGlkZWEgdG8NCnRy
eSB0byBzaWxlbnRseSBmaXggYW55IHRvb2xzdGFjayBpc3N1ZXMuDQoNCi0tIA0KV0JSLCBWb2xv
ZHlteXI=

