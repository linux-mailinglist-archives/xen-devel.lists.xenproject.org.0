Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECE51AE98
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 21:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320982.541979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmLA1-0001iO-Rc; Wed, 04 May 2022 19:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320982.541979; Wed, 04 May 2022 19:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmLA1-0001fY-M3; Wed, 04 May 2022 19:59:45 +0000
Received: by outflank-mailman (input) for mailman id 320982;
 Wed, 04 May 2022 19:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CPX=VM=epam.com=prvs=71238bbcb9=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1nmLA0-0001fQ-84
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 19:59:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbe39775-cbe4-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 21:59:42 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244IDPwY011405;
 Wed, 4 May 2022 19:59:25 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3fuxjx88ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 19:59:25 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com (52.134.85.31) by
 VI1PR03MB3102.eurprd03.prod.outlook.com (10.165.190.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Wed, 4 May 2022 19:59:22 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::78c1:e5da:903e:66f8]) by AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::78c1:e5da:903e:66f8%3]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 19:59:22 +0000
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
X-Inumbo-ID: bbe39775-cbe4-11ec-8fc4-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAHXikLKCJY+8KhhwurLUSs/dKOnEpbM4dBGGMqa/hSs45g9gAnUtaUmwQufnFoNmF/Ue9TNTuybMNbNq+nFvK+wPub5aYrG5AAS/F9KlRMvbOtlyghKluAjldzongJYt5pE6cyTznfjXHkJtmArDR1y1/PLDnbSkRmo6P5Mo09ZC/SJMtw7nCGkjoZj4DaGDMnu5iSlsw83jvQHUjFhtR0K/yO49eLLRcZD6HjbJgyhU+s1GcztjqrNyU/lJUvHI4CfOw/+LKIofcTrbGBMjTJMO61rQ+Su9uNr0ucxc4pHh03IFpGiPvpPZI0wQWsDXfWaZ/IdWJKy6bjaU80OCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGtCWR5lByVj/N6VFEw2T6DzI7VtEWTpfk8cjDXtedo=;
 b=KyRZS616Lwc0Z5adJx8WSRLoSIUnQE8+fiVZ36gB37XuKpNSqj+Rxo6+j6tYvb7/ug0KoIH5aSu+AG8jVLja5ho/Wh3oUvNRZF5OedVsLxcmZ32qy1xzyE6y4hetSCAGx9o+oO2CSTbOFLSDLTq3dY1a5eCvQ5jeybMzg/uQzcT/gFSRL0k2LvVTHmuP3i6/7CfiqSWIjlBG13D4zC1juX2LA3ZW50gdn4zpLqQ00gedVt3+3X3FA6QLYJJzzQiuGjOGc2Z55iseRq/gSK8AwBk7cLCZpQvvmnsymKBIsKlBYM95gn85rvhnCjxdrhymyz9tzpXV0XlsY+xGIdQUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGtCWR5lByVj/N6VFEw2T6DzI7VtEWTpfk8cjDXtedo=;
 b=Le+r2uXSqakkzf7LCQOxsTgPTeckCt9YgrWmo18PMURhxX+S5+AeBonZVtDBXwz7s7hYdS7g6YCEzoLblMJan5beCRN4tmJzW1yKHstA2p+q4ntl8W9WWW5+zOCfWbMUnt515DKoGObPx08o1eo60FvGmIh2dgIz+gcK5rp3g49OW29p+ptMT1CgAtwRIC8n8FvU6JJLiWteBKbjScbF5Mry2dD1UcEWEw+U5x1BeAHUuH2sMG30ZZDjdkyrd3nQMEqeiLgEdJhtVPRifN48V+kYBBGMyh0EMhUBcUw2L/FT1Xaa3srPF1KRk0bcaiaifn1Kqk46VRZ+bMl8DTvciQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH] optee: immediately free RPC buffers that are released by
 OP-TEE
Thread-Topic: [PATCH] optee: immediately free RPC buffers that are released by
 OP-TEE
Thread-Index: AQHYX3q1+cwfT5uujESolgz3RZy+760PI7EA
Date: Wed, 4 May 2022 19:59:22 +0000
Message-ID: <8735hpm5ly.fsf@epam.com>
References: 
 <287f81d7cec66b5ef1f8f3f61679b9593e2b81d4.1651643156.git.jens.wiklander@linaro.org>
In-Reply-To: 
 <287f81d7cec66b5ef1f8f3f61679b9593e2b81d4.1651643156.git.jens.wiklander@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b341712-0cce-4ac7-d14b-08da2e089548
x-ms-traffictypediagnostic: VI1PR03MB3102:EE_
x-microsoft-antispam-prvs: 
 <VI1PR03MB3102764843D2991B99FA6C40E6C39@VI1PR03MB3102.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aEyS1YvdLcaEhWd3dzJTjg9RHw10ZDVk3+lNxRfnXkjybU7Ob2y8JEijdke7IO35OWI1BkA7NHAioV7SdCuV1rDCzwPNRyhQEDuZ4W4fTKU26KJZXVz9JKGb8BjjjU3Gemq4YveetprCfbpBWUeP/3eK0T+bvo3dMMbj/YIzKMBtT4y8i7d5T+9JPVamRaGdxx/PIBIfUex3lbq6QBMsFJHC01toHd6wM+PO9Zh9s9z8uQNem28y6MMusyk7B+MKSYaPY7oYRM93wxPjAHM9y82gjPaQVQXAxsnxxM6labvwTX0JgmsyQezROb6kit6u7VS/m+P4lGHETZNi0cJ+T3cKOGgt8K8vc2goeAXzBBZ1EWHXrfCIoGbwodRMBL54OyAVeM7n2S+eX8Vmk/GvgOBwEq75xdzTkthBwQPDLcjnlQvyl+oKRBqW/9btYoCJB4xXS9p6L2/EY4O0RwBo6+URo/jyk/c9Z2QQynJqYRw1vtMgzFBuxTmWUuPnaiRUQZPF3iQx6zs1cIJV8IkK/g+cYPTtCbNdGxdayPb3vCkg/4dOSeEuw/W41J2Y7NJekHA15747PCtpGDV0jLQkDNkDuZ91UqdoyzODv1cE52K3rLhlL3Fm9Kn0fCDntyILAVNdq6eC9wiOwdVGdlKg0hZ9BdGSaqWN0tIQmh78j8lubRjEkTQKHybGBcF3T1m9g0WJvnCV+1wquYYSdr/vVsxgYPT3ksZy5vZhEWll8do=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3699.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(71200400001)(6486002)(83380400001)(508600001)(6512007)(2616005)(55236004)(6506007)(86362001)(38070700005)(38100700002)(5660300002)(122000001)(36756003)(2906002)(66446008)(66556008)(54906003)(66946007)(91956017)(76116006)(66476007)(4326008)(64756008)(8676002)(6916009)(316002)(8936002)(14773001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xir0iemCa3r41Yj9cK8uwJDYAajOBzCHuxbGPQ+ULccuaejeXqtxgGv+qi?=
 =?iso-8859-1?Q?FfqJimJ6Z/xRYIMJCcoptuJ2NYZ9tEw2xrQqLh6vXWR5t2CxndZmrVINcX?=
 =?iso-8859-1?Q?q8coK6z3EkBSuIVfpvnVLRuQDAprlLwhRHnjUg5xjIHAjD4SNVkWQH/xCE?=
 =?iso-8859-1?Q?37rxQkjP277XhBjgBV/+69O+D47DP5WQYM4PRTQbvqi3tuhCOM+qAoKj7j?=
 =?iso-8859-1?Q?G6RKxA3ftfXn02gv5I2Fak0TP2AFjurDKRvqCf9ZT7KzISR3aAL0o/BZZY?=
 =?iso-8859-1?Q?+WpACLHiTOMEjR4JrRsf/eKgGDYT7DG/Ufz0lQyqe1dPTTnkSBo+/l2nAV?=
 =?iso-8859-1?Q?B3mYxcL2OLDDMNayHTKo8iBRPjwNwZMMzSutA6eH6I3wydrACFgz6tsBeM?=
 =?iso-8859-1?Q?36m1Hv9d6nv//NRU9j2E9zXWYjN8dZRa+GwiO/YTOaBsete4mlEdLpMnV7?=
 =?iso-8859-1?Q?bu0paSPCXRU44sNmA/ZLSsx5wR2U1/TXtGfayx9UiRPuQ+XVcVnV5xxaB7?=
 =?iso-8859-1?Q?VheDKqkIFZBGkiGDVwO0TW9Uju9xsMVnj2VkPNwfEDo+8vO1+eeFQYkOpD?=
 =?iso-8859-1?Q?A/U1IqpaPy5jgvPLJ0p/bWMkrl8dL2hwprWCDyxks3Bf7ReeY4VQ62oKhl?=
 =?iso-8859-1?Q?JxpwZZlXW+xQLb4uVCh154qBpAHLTMBqZAyt7e2WIia3cWrSd82f0yM76j?=
 =?iso-8859-1?Q?DcMJAZEbK99eT8Dmb7GY7UMBiIoWZPp952veJaxo9T5TkEpKoz4a+kpN0Q?=
 =?iso-8859-1?Q?jvPsNWaNf6lF0NkKL2iZvsOAqi8MY4TcaNTE83a9MqAs6+uz8yUJF8cCLQ?=
 =?iso-8859-1?Q?4sqzRNxu78Lmde1Agky8YcJ+xDJGTKaDeDnx6bQ5uNlJSt86r3zv2nr8sf?=
 =?iso-8859-1?Q?FbWLDPAY6lI4MgE1ij0TmZ135y6izRiAuv7QLbgI1XLlVHyF2Gz8spE9Nc?=
 =?iso-8859-1?Q?v40LaUX7zRDBtDo9iyJdGP2bUPMVN0WUHR5uQqkrC1ONkrRbUgdEmfe/Uq?=
 =?iso-8859-1?Q?1mZ7iq+a0YZSg3MCWmdvbmB1RO/u6l6dnrseNQKD5xa8HjI9ioPy6cL3qK?=
 =?iso-8859-1?Q?WJdyKzme607mvtYimfeg3zqOR28CvYq17RAQAOE/Frb9LFsc+6q1UFGZum?=
 =?iso-8859-1?Q?FS6cDr3Ptrcgn51ZTaApMzAurBkC5rjqDAgIZYKryw+e/dzlCAR2tM/xfm?=
 =?iso-8859-1?Q?j1SDkgLYIXm7asWidTRhfU9iyIxUFCBK+0t3b8Gtnnyq7SyKkooQ3vSFYZ?=
 =?iso-8859-1?Q?gmvQ/vcnVUX4CuQM0DZu1Awl7PC1lDXU9sQ4WPK3oxsHhd64sWAsmO1P9j?=
 =?iso-8859-1?Q?BbbmtHnY0+wmr7Ux8XXf3ybiybcp28IWRB1+9w8KcYOuRzHqfkaQ5TkW8d?=
 =?iso-8859-1?Q?Vjz/VsabYnN61tjpN56jzga65rMq7Qk0matIADjMnJlezsEs6l/cPScIf0?=
 =?iso-8859-1?Q?On74puo4MlDUmU+cHASmRe+UhE+ZaUFdJgL0FTfXlC8s33iyPHzAAW1A6x?=
 =?iso-8859-1?Q?Uiz5wLz7jQinyi87Is+T7Iy1BVhQjXhahs/PfzZlQCGr28id19z1NIy3d5?=
 =?iso-8859-1?Q?dlDKpEqok/JvOH80DUKnTxi+K1Pg2Hpc7T03o3qTZzg322qTKQOyEn7hB9?=
 =?iso-8859-1?Q?cup3P9Keaza9NRLK6VNc0Kwv5I4J2IRshWH94/+ezZKsHL5tHoTg8YMoKA?=
 =?iso-8859-1?Q?BAXlYgPWU8KDBDzA3AMoSdHx54sjOUoBAfqWla/3l6TMlxWooQpAY4K5WJ?=
 =?iso-8859-1?Q?i6E3ngSfAOVljGhW5Zh4eF1f8OzuYp35UTrghKYtG9nCHObpcnmH71oinK?=
 =?iso-8859-1?Q?A3aFM8WQ/qtjxmHEoN7JUd9jyMrwxH8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3699.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b341712-0cce-4ac7-d14b-08da2e089548
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 19:59:22.5071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jk5Rz8GyJqzcFsXY0RSsdz9w1fE+aMdX1PDgTgSlT6pj5ivBKGNKu+4+Bxr7iqOSTuA7jNGAplzprgOxWLDMQ/BVIBCn78SK1i98uA2al5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3102
X-Proofpoint-ORIG-GUID: 17zvTvYtmbeEZZIvXIAbjTcHEaDsYSlk
X-Proofpoint-GUID: 17zvTvYtmbeEZZIvXIAbjTcHEaDsYSlk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_05,2022-05-04_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=811 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040117


Hello Jens,

Jens Wiklander <jens.wiklander@linaro.org> writes:

> This commit fixes a case overlooked in [1].
>
> There are two kinds of shared memory buffers used by OP-TEE:
> 1. Normal payload buffer
> 2. Internal command structure buffers
>
> The internal command structure buffers are represented with a shadow
> copy internally in Xen since this buffer can contain physical addresses
> that may need to be translated between real physical address and guest
> physical address without leaking information to the guest.
>
> [1] fixes the problem when releasing the normal payload buffers. The
> internal command structure buffers must be released in the same way.
> Failure to follow this order opens a window where the guest has freed
> the shared memory but Xen is still tracking the buffer.
>
> During this window the guest may happen to recycle this particular
> shared memory in some other thread and try to use it. Xen will block
> this which will lead to spurious failures to register a new shared
> memory block.
>
> Fix this by freeing the internal command structure buffers first before
> informing the guest that the buffer can be freed.
>
> [1] 5b13eb1d978e ("optee: immediately free buffers that are released by O=
P-TEE")
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Thank you for the fix:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>


--=20
Volodymyr Babchuk at EPAM=

