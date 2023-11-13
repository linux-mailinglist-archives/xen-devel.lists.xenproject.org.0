Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0B7E9BBE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 13:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631552.984972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VdP-00044B-RR; Mon, 13 Nov 2023 12:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631552.984972; Mon, 13 Nov 2023 12:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VdP-00041x-OV; Mon, 13 Nov 2023 12:01:43 +0000
Received: by outflank-mailman (input) for mailman id 631552;
 Mon, 13 Nov 2023 12:01:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTXO=G2=epam.com=prvs=56810bf7ac=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r2VdO-00041Y-QA
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 12:01:42 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66e2c58d-821c-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 13:01:40 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ADASXFq010917; Mon, 13 Nov 2023 12:01:23 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ubgy68k20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Nov 2023 12:01:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB7361.eurprd03.prod.outlook.com (2603:10a6:20b:263::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 12:01:18 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 12:01:17 +0000
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
X-Inumbo-ID: 66e2c58d-821c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWRBUuRjRMC7E1POftgan6V7i8W97lQYJY97dWfNm3b/IfSUV2D6B8yeD3cIl+55AaMxPT7YoHhL+SRAL3ZZX3NPjuPqVcuEVgzr1WxqcXGFKkO/1HAJrfKGGuQqA/zbYSHRFohwtnCNQRhQad+MvB/1uz5FcT+kSIOrujfVMucptuntrqJlJsRRbMtXlF5yXQdzOEFg/5Cu3U9rZV06Ol73BojxTtxrmvU0mfV7eGUreCYAjKTlfK2F1AVApf+cALdycIbry3FJcpz90kAEx9BWUzjtx2beJS0ex7ocUVSB/n5bKvdgLc5r4Aod/VAdBkXyY1b3mnEFrFqOOguohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8HWaLljOA6E56N33T2Bcw4FwTPLTI2ot1+G2GDZiTQ=;
 b=Sd/qJPrl5fHqCs/NH9NozB8WrnRkvkosOlVJPHkFAhrhfC/ZOvUOW6haEBqX3iIz3ou8EvfiiaJi9metqt50sS6fDkpxSwKEezP2mjpXCvWDIcl1kRQweq6atORcvXe4wYlNOsD40dYBFZKLDIPHTdOstbIJTwWMIGkaiDe8P6nkaClQNkpOn/TBFma7/tGlHV5lHtykzOXA3BdsHXcygoB2+5uygBay1wuQaacqQOnPvzGH8Hwe4HzI7fUswbck60zLqYsZa3U3uH2+homp81yShrhTiFrQ16sWGz4hM8u7TfhbDiCPtBLWTfByAKK67jM6i+nLiSVS13RKOW7zNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8HWaLljOA6E56N33T2Bcw4FwTPLTI2ot1+G2GDZiTQ=;
 b=ferAa8pUYD34DBTGZI2DZE+ZDu1Qa0eVakqSVB/OXeIFAAEDlOXxPXgS59iXV7+T9DVUMAI/2QyFRWcT95HW68uqxLlmUEpOQtl+56gTzH3FvNcrwaRsn9m5qe3/KWA6qmxoesFtB4wPdQ4Q6opAXKC9qEk5DssOfVSp8bVDfewgez0kCT9oTz6T33Aw34KbfP+TwvB/H5DqWeZjj3O3R132mqK/Rrq5R8qAZbJSwbCNtU/ZBqgQodniUF+OlLxJuKoq5fLpFFx4p+Ej6MmcfpTodlgRxEKqWh1iEP4MuiYwJZyCVA0bOx5+bcCfoY3pyixOCs70vzF/u/nY6chnKg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard
	<anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:ARM TCG
 CPUs" <qemu-arm@nongnu.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 7/7] xen_arm: Add basic virtio-pci support
Thread-Topic: [PATCH v1 7/7] xen_arm: Add basic virtio-pci support
Thread-Index: AQHaFBZpa05Dc66DRUqpQfiy75awpbB3Qk0AgADZWAA=
Date: Mon, 13 Nov 2023 12:01:17 +0000
Message-ID: <87v8a57tgz.fsf@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-8-volodymyr_babchuk@epam.com>
 <6119beefbf169cfa2626acd7201946f3f588fa3e.camel@infradead.org>
In-Reply-To: <6119beefbf169cfa2626acd7201946f3f588fa3e.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM9PR03MB7361:EE_
x-ms-office365-filtering-correlation-id: ac0cacf7-9271-4570-52d0-08dbe4403e19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KMAdXJZPhrt//jRAOwnjYK+1hd9xmZnZRPhhLnKvmWmzmxMilFhoiJ8sgqQXhp2GuR3xeEXuqNrippz4pcWv9v4e6S0HkKeicS4GqxevJWL96Hal8hUYUlBjknaNgadg8kjI3ei9uzPVqD8VQvESCLP1vNKb2zIbqQeN3BshOKMEuNLcSzbUOMJmYp5AB36pHWO/HRGPoDZscafzglmD6EV7PbNw0QLlpuM16qh9UxvonMbYLuE3a0xq+oTBYSlQR+0duAaeQ7Dc6jLYZ7eUy/JMqpftNci6PpEPQX8m3vZ+/uiZebe+pkwPSlBwqOCRRHplTdHgVlsgeRGYv96CmZCUpvy9nw4hVthmbEFV2JyMR+rBlQI+01HWT0g620k6FWl80QSszv+kM5Z85bQaM39m9AUqHDHj3EkzIJHCTbroBpbVh/rRPMDHiIIiSrnDMLIoXvTM8huV1QRo4apn8IsAHUPs5z0HhvIxmHu8hJ5LHmIQ1lKtFdmvEPt4C89oU9ffpJX4ZkBp+u2lAG7kGfysxJZfHhzgxhBl10ZT1SLxKxzcv+Uc7v9136nVlOY3764hoXLN7nr57NajU67+we9fKBnDQzt1Af6VvR2wbodLFerwjpAbSIB8l1Mu8bsd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(316002)(54906003)(6512007)(6916009)(66476007)(76116006)(66946007)(66556008)(66446008)(38100700002)(64756008)(4001150100001)(91956017)(8676002)(8936002)(4326008)(6486002)(122000001)(478600001)(36756003)(55236004)(6506007)(5660300002)(86362001)(71200400001)(2616005)(38070700009)(4744005)(2906002)(26005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bqQhd5idCKV3FScybD0Ubh2mRQSZSXuveLuOl0km3SKhAwTRUTRa7gzS8C?=
 =?iso-8859-1?Q?6G6t5WpVf7xOVM4CgtRGhqSQjVkPwFtl42kqBdQ4Uj8u9xMlCDt1gMbPTy?=
 =?iso-8859-1?Q?uCs6MWzz0JOSn/jYCOpMJjLdUeEw8KWomPZIGl2mfhZBjPuV2Vvu0E3MKO?=
 =?iso-8859-1?Q?wE6xbyp2tDg7vbunpTmM/sIXr8S8mNPmS99tHCaH6oeE7nnMYIeqmS8R/b?=
 =?iso-8859-1?Q?GJmpvvjZl0w9ZETaqaCWq7Gu2kx0G0HT6aeEaugwKgrVyoteI95Qaz8pZN?=
 =?iso-8859-1?Q?lKNbmN7KgboWpthawcuXwdwf4J1i6gpfIdf7BDswIZ4H2EYf/mCO2oqE6K?=
 =?iso-8859-1?Q?ugE6XCGIIWdxtRRd4Cnr36MQZEMHrXYcRrE5F9blp2nSvFzK+L0PStRLec?=
 =?iso-8859-1?Q?qY6YEEX9t9TbGvbqF59eCEaSX+XJe86CmuZedp0TlNnTBOTjr76ZLVbv6H?=
 =?iso-8859-1?Q?QX56GgdupncDJplsGwbyAo8FcQ7inwdpU8gS7LWTRH0T2WAiH0n74RkxsW?=
 =?iso-8859-1?Q?Zk3iIxGNN4OENzaVpfluSyR3cpVI4Szj1JX3+oHMIKk0vGP/oV0z6DBhRV?=
 =?iso-8859-1?Q?2jClegfjL066Fj1KBZM8tmHYuh6iaCNMkDew5DdJxb7hTTNx9Dtn4T3jML?=
 =?iso-8859-1?Q?x80h+ZkY1GLNyIGCKxJAvVjH3ek7pAd1MBdob2qdTdS9ISZ1pz8FjBvYq3?=
 =?iso-8859-1?Q?D+bhh0oig8ayBTrQoVawiuyJKI1qf3pDPMPLKmOw2cRkd5AUG914E5SFHF?=
 =?iso-8859-1?Q?SspqL8IQ0TGfEBl+EeB+FlaUtirUUOXopKVaUkR9Z7mGpg/fqAlZgfFcn7?=
 =?iso-8859-1?Q?pvFeJHipeseG6eiWMJgSgqyl6wnDiSv2/CoWCxZksCPAzHNn5YcwQOBnPX?=
 =?iso-8859-1?Q?x3gYVKnNMQjDch3HhPDvJT4Ja3Idc+lIxGUclyn0X+ZdlQVUb2UBCAWKdP?=
 =?iso-8859-1?Q?Cb1AZ0KY+kcnY1YWuI8eHePU7NDannPJ/LLe4YIve1gjxHi8296RA6/bd0?=
 =?iso-8859-1?Q?xsO4CLKLPaPeCrAOgb2Z1Ika62jQm2iHz6EEyQrjgdpe1PFE2mPI2OnOSk?=
 =?iso-8859-1?Q?i0kSRG/BZCxoPax7GD7+5M7t9HIFnoHt2DQMS0n3MCgz4fozADpsFSxDHf?=
 =?iso-8859-1?Q?4pnwZRaAdC7gEAAhbCeLcXclSRJym53fXHZWlp4g5mDrThqrI6+icKYMg9?=
 =?iso-8859-1?Q?INcfO0MDRHSE54RLYWbjm6f2/h/0Mf8uxQLDwfkVbYzP+EO2xwH9k8AmdJ?=
 =?iso-8859-1?Q?GgYwlDWGn6NfBh1nzflduUviNLh8J/5foe939W8hcZmilGjUi7Tj/qDD1c?=
 =?iso-8859-1?Q?4/7oZZqDvmAJ9KnEEKAO1/uJRfB4H8IWyQp2hpANME3NUG/idqY6gkqQ7l?=
 =?iso-8859-1?Q?3LHg5tJKuKTtrf45TZE0dCdcoPzTjcJqAQHFc/jmBWNcGX+jycRsq1jLa5?=
 =?iso-8859-1?Q?e2OhzJDBVmKYnt57WBnofqtFjDgwRx8hjqJScp7A/wqWv29TbVrYs9LKua?=
 =?iso-8859-1?Q?leW4KoO7uOg6xWCZfMXc7JLgpHvFDeZuDzaGd6A/BOn6/Y+qj7WIAY5nZE?=
 =?iso-8859-1?Q?cmSb4sra7m9XH8FYsEKR4/R1l5WSvY9xjJyfgAFFWKCdgA9Eh8cbKMRgpQ?=
 =?iso-8859-1?Q?5iV1fl5HB+UVd44zcR2SoluayZm6Mjzv/4dT3y3L+HN0tdS6PI7ayuBQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0cacf7-9271-4570-52d0-08dbe4403e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 12:01:17.3422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /IqfvwlZFhCz+IQ7F1afkYgE2wCq7LBV+uWt73M9BfFT6ZQR2CF28Xf3emcdhM4W5gjqnPJORfIsefZDK/k8L4OXNlOvlvcXQ9FJcJ9PEbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7361
X-Proofpoint-ORIG-GUID: lb8J4TMKqoVJTvdnmyQhzv-BTlPDqYIf
X-Proofpoint-GUID: lb8J4TMKqoVJTvdnmyQhzv-BTlPDqYIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_01,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=276
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130098


Hi David,

David Woodhouse <dwmw2@infradead.org> writes:

> [[S/MIME Signed Part:Undecided]]
> On Fri, 2023-11-10 at 20:42 +0000, Volodymyr Babchuk wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>=20
>> This patch adds basic virtio-pci support for xen_arm machine.
>
> Why only xen_arm? Couldn't this be a fairly generic device which can be
> instantiated on x86 too, both for real and emulated Xen guests? And
> riscv/ppc too?

This is the architecture-specific code. Actually, from QEMU point of
view, this code just adds a virtual PCI bridge. For example, on x86 this
is done in a some other way, so they already have virtio-pci working.

--=20
WBR, Volodymyr=

