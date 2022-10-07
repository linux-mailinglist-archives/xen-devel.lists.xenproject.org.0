Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4A5F76F2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417693.662511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfO-00007l-Vg; Fri, 07 Oct 2022 10:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417693.662511; Fri, 07 Oct 2022 10:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfM-0008BO-T3; Fri, 07 Oct 2022 10:33:16 +0000
Received: by outflank-mailman (input) for mailman id 417693;
 Fri, 07 Oct 2022 10:33:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkfB-0004P4-Hm
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:05 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c133096-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:33:03 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297AP2K4008629;
 Fri, 7 Oct 2022 10:33:01 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k208bupyg-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:33:00 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DBBPR03MB6716.eurprd03.prod.outlook.com (2603:10a6:10:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 10:32:54 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:54 +0000
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
X-Inumbo-ID: 6c133096-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkzCvlc+0u3GZIlM4U++d39+MIe3yuwa1arWJwKL+3AwyZjJz1HsX6FTU4rfDwW2DsXezKGGNCpjvCyV6UnjcWW6RTLSdMhz9iJu8TzD59muekLSTImpIf8K4rLQ9wbwwbr8E0BEyIFQutC37dG1pspzb811xdUJcsw5qbxP36ie81DYH/KUsPiMLQ26ORRJsIF66XmrA9qe298uM+RuVfZqVPwqIYUtkbZo6UPCWEz2QoJmhlf7H1SpOi2yHfsDqlxRa50xq6ggcS6Er/OMguXECcsWboJHdbiMo/qqfhTzKLMKqWBxRUzNzK8+/+Cp52KMCNrkQLZ568+77ayhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qf6AA5NEbLzd3qFM2Qjj9M0bqVZ+Q4ALQBxoGny/l0=;
 b=LXv/oSQ38HhL8GAMS9Acsrxdzq8iPJqeX238udgugmjX8Y2vsH8aOs5qAORBS9O3h6UbjKnRnqm4Fil2I5PhyPlQVXN2xTIna5MQWxw9XH93f9ZVUuQJpTbhZCUFyPdIQf74gp1NTbwXDYBSMlIMDHWkoyZ7HKNW+oni7Pv62ZncpLmEIrXD5M+msgCWc9+etwTaLG9d/fbiOaFo/+MFZ+csM/XvGW6thGV/KbzJO4yR8QuTy1gZY511c30uE2hQxQZTeqxW+tc0D5GYhOsKNhgGNkIPpwxZg4cYqrsIkqqAPsBWzk74Ot44bKQN5Ox70im1CuOZAVdwlV0PUnSI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qf6AA5NEbLzd3qFM2Qjj9M0bqVZ+Q4ALQBxoGny/l0=;
 b=GbI09yOSyvti6P1XF3wPuFtkpeJ71/dAsmkJ9bef2mNDHQdZ/Z/ElZzYt5W+atA9OyD2BvzBE+AjB0RrxBNoaISF45LXbE45txztezoaFmtmzlzXFXABH5tL09l2HLA6aLo1Ag2vT4OgA7A2pdzpWgSylj4eoGul2xhTealuzzOpAQiIMUCIZwVxO4FoUF2uCh4QG2tzNaA7Orfd9iwiQrm9fU6U1+yzb/UW0XD/SBhU0D5FWgEP+g5jESudjY9SYxUQ3VsYFf3wavNg2rfBkZjnoxW5g3h5zbum/LPdWedtMxy8fdd0CBKBEBxK+Lv3T8ZLsRx5jtoiBzJRnwPJ+A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 17/19] xen: don't free percpu areas during suspend
Thread-Topic: [PATCH 17/19] xen: don't free percpu areas during suspend
Thread-Index: AQHY2jgm2f/PHlobT0esfUs820FvAw==
Date: Fri, 7 Oct 2022 10:32:51 +0000
Message-ID: 
 <37f0f84cdaf47b1efda59f0368998183dff88a3b.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: 1a3b279d-d328-4aa1-0180-08daa84f4b70
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ecDtL/g2qwre5mJv9NB+s8+t/bQP6twC5yIdumgmkS8Veb/LS7u7ghQQVwIDHa8RgJO6WszmUfSOej7n6b2HCx9I6hVnsZHfD6Q3Vsv/+sn88sj5Imz2oACYwZrbuGkQXTZ+rZ4iJ65++Mzl0vfAtusQHdzZpH/ZPXSiv1t1cyRvmOPid64zIawhvVqpzpyftZCuJ+LF4XrPFdB2Gg2bWruP+C643FYTJcMTgZ2JXa2g2ysJo66O8kcnhAFFrNiU7k7cyNGcwi7oh0WBgTqqf2bG+MW1J0Ca0ZRyRBfp1P9zShbVvuZnx6JbXEqK+TJQj/+64YMr2vzqkMX1lRyozGJ7feSmTdF4QfgBA5N0NTARzpWdS5qQM75wC831fWN1KPqesIP249pdFYReEUiNldQIRUIecn5ZURv6tBRmAuFmZPSNg8kA7wQvOTBsvh9dcMIxzsK8uVE6WIZa1tA1agDqmkv+mARrDME8P64IwX/hp8mIvnKW9Dh+JDWXai+46O9Q9CKfmoo/7qYybA7kzRtg3Dorjs57TGQo3BKVy5UmpASUsa6YYOjYs9jlUafy6xEem/s7hNTju9peKc9CKk8K61QSKPFH5T3vzMOfHVZHE61tXXCzDd5ay5mzdaUBncK0kr3StsgYmt2xX9rAjTYip4S3uP3uf/P2QjVKJe2NgZt0UThzKmv6Hw+y4idxlloHUnw44Lw9uNmoo88hUdiGfy3q1c27jwdupUlH6fSWV4c/r7HwQtl3IdeX9F0rRvY9Ep1f3YN68dSLjkjmDg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(38100700002)(38070700005)(122000001)(41300700001)(15650500001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(6666004)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4MbiXlJGER0tbGljFkS4pt1Fd/RmOH1dLF7UMyBPhGvuGHtbgEtR1xMnvG?=
 =?iso-8859-1?Q?HpWghb7BZfO/RnK7Hi/9RqdZV0P5Io3aiwnVgxc9Ob8XLabUFTJN0foAfC?=
 =?iso-8859-1?Q?PH83wRhkYUGjJNdqH9ylt+byjyNM7UvHpbEEOCy33dsV+GuUYPwA4Fln+9?=
 =?iso-8859-1?Q?+uGoWQDKN/0fSne1Hvb9wsJcbEjS+tn4TUopmz2B57wrP4vsDksUPcy56b?=
 =?iso-8859-1?Q?aSiP4i7Yi1id6XNnsagAwpsfzxciOoNYoRqndDWu2HsQmd57jMFg479KH8?=
 =?iso-8859-1?Q?6oL0qDHEGxhhUxpa/sCKa+kFTwhahU5uze1XG1enRtPkwzxrjmgVseRnsb?=
 =?iso-8859-1?Q?T07+9EQVkvCNZDAEKc7Ir5CDj6l4QXyzQF9eY06rRJnwm5iU9IV5CzzY+8?=
 =?iso-8859-1?Q?oCamRHhNvrPFh2AFSap4lrKEZSaELShrLmDqt7/D+CJIF3/nfuc5Yegdke?=
 =?iso-8859-1?Q?n++of3JKKdHvw5P0gVCWVPdqIcU9I2v4XSkPmDOoj96iBE6A8h1YdbV6LQ?=
 =?iso-8859-1?Q?poIbH/V/RjA0l8Zq2HtE5q+Bo5xgMqlCb1YVASoC2PKoNuVHJK4QpAEXDs?=
 =?iso-8859-1?Q?9p5ZyybZfeZ7SyTTIzseRiytqsCEQkqli4rxoOwheGGl/dlTjEbQMuwp0B?=
 =?iso-8859-1?Q?pRN05mhpWYxqn/+JrCc747BR/3X0zYU1L3NcipatvjDfRFgw2i0EFA8Mmi?=
 =?iso-8859-1?Q?LMSzHay5l46nah9oiipwBYQDIawd3QWwkeTN9+HqnyeMvIGpayZ12HgfE1?=
 =?iso-8859-1?Q?kKGNqiSyJXfkXm0x+PorCdNpipenabY4MS6o1J0GE5ZNi6dIDp/NNcMKr4?=
 =?iso-8859-1?Q?//Wx4brYbR7DoS6EnNdvYE3ftZSlUDFQgv4vgwH3o+W9eSuu3z5Bgp2Xw8?=
 =?iso-8859-1?Q?BCNJgnrv40+1UMYSNJU66NMBpBkRR+NrhsWhfR1roSBis9Nez50xvhuFOs?=
 =?iso-8859-1?Q?H2dTmWcHXmnAxHT7X2FiM0X7R4XQTNx1zWeXrjXyjnoz9tpquML69MtG4x?=
 =?iso-8859-1?Q?P/Z9uLS3HQLB4gPXP9NMGvR1Bru9nifyR6MxWRp5QRgGNYE4/6x96raGLu?=
 =?iso-8859-1?Q?ELhzK2AzVPCSoBxeeBDeyTwx1X9WA7//Mn7MgTdpAKcRCU/HeQtIYm7HzO?=
 =?iso-8859-1?Q?Wg1oGpIHkE3WEwb6Ta11io1uQGpwN9RjdKDHXOTwP+nlVOCWwRbtEU+Tis?=
 =?iso-8859-1?Q?YTf5SeAgIaYu3bEpsy5x5pPbF/VeXC9dOE3NNYEwkY8a8u0UEHUjmkyr2E?=
 =?iso-8859-1?Q?xu4w8uKBXtBf12QSgbWGvRugDePoVlZtUhPf9r4QF7Tb4zGID2qSszk6ux?=
 =?iso-8859-1?Q?UpOhOiuUnTTrBO5tiyb4zYJUR8Uuuf5MV0x2rhdOtEW5FYPFAdtErDdBJi?=
 =?iso-8859-1?Q?w0+UThKATf7NOiLTGxfCAecnADLj5NLeTSo+Ub6q8KsgzcW6QJlIsP7gH6?=
 =?iso-8859-1?Q?lGm6p+yMJMFFZf6lK6oLeGUavxzSA/kQv5Ml2Yl4nkBqsApzYEvJ87LSu7?=
 =?iso-8859-1?Q?v3/mPNWy/Hs5omAkSXt3iy/KoQViCXP3qYjCJoMsVGEb/L13avQZwFEWJx?=
 =?iso-8859-1?Q?KulrhoLXQiOzrXZV93hdt/gnNkq1i55kJ81C6gbm5kK+WYo2sJw6vhM26E?=
 =?iso-8859-1?Q?IY8SblL5elyzsU2IMScRLHK844LUcb5fA6ezerspU4miEAbmqiM42s4A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3b279d-d328-4aa1-0180-08daa84f4b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:51.1144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEb6R4VpY/RYY/cNvU3to79x337wq1wFh4C2hxm9rsaemQNH7fWwtVvG/uLgANyC9FfTtQn3/Z4LOJ3c8f94SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: UQIPysAdlfJtbKMRG4rWIHYIYuX7nz6j
X-Proofpoint-ORIG-GUID: UQIPysAdlfJtbKMRG4rWIHYIYuX7nz6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=814 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Juergen Gross <jgross@suse.com>

Instead of freeing percpu areas during suspend and allocating them
again when resuming keep them. Only free an area in case a cpu didn't
come up again when resuming.

It should be noted that there is a potential change in behaviour as
the percpu areas are no longer zeroed out during suspend/resume. While
I have checked the called cpu notifier hooks to cope with that there
might be some well hidden dependency on the previous behaviour. OTOH
a component not registering itself for cpu down/up and expecting to
see a zeroed percpu variable after suspend/resume is kind of broken
already. And the opposite case, where a component is not registered
to be called for cpu down/up and is not expecting a percpu variable
suddenly to be zero due to suspend/resume is much more probable,
especially as the suspend/resume functionality seems not to be tested
that often.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
---
 xen/arch/arm/percpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
index 25442c48fe..0642705544 100644
--- a/xen/arch/arm/percpu.c
+++ b/xen/arch/arm/percpu.c
@@ -58,10 +58,13 @@ static int cpu_percpu_callback(
     switch ( action )
     {
     case CPU_UP_PREPARE:
+      if ( system_state !=3D SYS_STATE_resume )
         rc =3D init_percpu_area(cpu);
         break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
+    case CPU_RESUME_FAILED:
+      if ( system_state !=3D SYS_STATE_suspend )
         free_percpu_area(cpu);
         break;
     default:
--=20
2.37.1

