Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6939CA865B4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 20:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947752.1345353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3JO8-00023f-4p; Fri, 11 Apr 2025 18:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947752.1345353; Fri, 11 Apr 2025 18:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3JO8-00020i-1j; Fri, 11 Apr 2025 18:46:04 +0000
Received: by outflank-mailman (input) for mailman id 947752;
 Fri, 11 Apr 2025 18:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FIxv=W5=boeing.com=matthew.l.weber3@srs-se1.protection.inumbo.net>)
 id 1u3JO5-00020U-QN
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 18:46:02 +0000
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net
 [130.76.20.194]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34e380a1-1705-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 20:45:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 53BIjr7P009916; Fri, 11 Apr 2025 11:45:56 -0700
Received: from XCH16-09-04.nos.boeing.com (xch16-09-04.nos.boeing.com
 [137.137.111.49])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 53BIjj3F009811
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 11:45:45 -0700
Received: from XCH16-03-04.nos.boeing.com (137.137.111.13) by
 XCH16-09-04.nos.boeing.com (137.137.111.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 11:45:44 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-03-04.nos.boeing.com (137.137.111.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Fri, 11 Apr 2025 11:45:44 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.151)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 11 Apr
 2025 11:45:30 -0700
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by BN0P110MB0984.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Fri, 11 Apr
 2025 18:44:37 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519%4]) with mapi id 15.20.8583.043; Fri, 11 Apr 2025
 18:44:37 +0000
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
X-Inumbo-ID: 34e380a1-1705-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1744397156;
	bh=qE8pHTZDOnhvQ4hbu8o0+6CiG28JwAiKzNd2gHMGdi0=;
	h=From:To:CC:Subject:Date:From;
	b=fo+7tcTxjLDPRWE81Jy1aJ94/vNqJAxavplRE6B0yi+QTje7EWKlmm74PxBgoYAI3
	 miZJzxpiKVl4pqMrBRSbROZ4pRPGgZyvRgs4VSQstRCSdoHfyU7SIgdfztQcPC8Oz8
	 nQOQK5PhsvKra9h83nV6Uerf307fRUkjCWfye/3qAKLDR5Im7inozBNf2ltWRYX4bb
	 7ciw9MVt9kuyo5tJKma6pJgULoj0Ekda2PdMbGfJhZ7FnxU2YuGVIk7lD4GXfYZeOZ
	 EqA00y/rwLGCw00vGrvodvVSuWSVBCyZOjqjCNTZtcofpM4n3Xxl5HvTgzNV9Jdi0w
	 3qrqUF2YEd4lA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=D4bFVE7qWGmwc7n1hfLhB/KBpF+rYymH35KEdvy7cpsnlMo8zSy8spAA5lRw+Hk7QVz+orx5mDi/gPUomQbu2PglnCdxjwCLGJxStt9BHq5DmWng6tMRNNPif9mKklOnsJuk6G/aDY4vgcqNE02RgoxAZMSEXJM6j2NZItRDkNweO3ClS0qfTU0zo92Yvjd7Gk5YjQW4Yp5elzr2Fp9QZmxXF6OaLOthVYh4r/MX/nwsXDwtjEvT9M3UAtWdFzwILnIPac3h/bqHJVMtMbxceOtOY5hs7IyFacUzgc7T/zshqyhNuvnAV8k7wSjgmVJHFEvCdbIpSCS7aErhR+bFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qE8pHTZDOnhvQ4hbu8o0+6CiG28JwAiKzNd2gHMGdi0=;
 b=BAexxMkHhwUFFJOo1uatxTrSP6P1xTZWp+Ik6as4LOKYvh14SwflN4ShBl2pCR8pdI/3+nflmU1g/Mi0f240DyfODclkJm3hk/x22LfYcRFJxkcE1iH6XgVBt/QzYgQNqb/RaVg+3wXe/uWrNtoSz0l+s6F7EPItoqHZ/+nWqNYz8wPiPRr4Pb7k2sCDze8P8/ZBpPy2BiOr48YAFAVUPG+mbSQe3nJpE+uZWusKxCrt2vNg7+ThlWTjYtfYPxGc3WuZGk0YLxMVnAo4T3d6bj3c62ZzB/Rm1O0O4t59TSD/YtIDb66RLcUcKNy1/Bv1lidiVDSwJz0igLx4C6SiOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qE8pHTZDOnhvQ4hbu8o0+6CiG28JwAiKzNd2gHMGdi0=;
 b=OOrG5V61X0P9XZ7mHrqrIRupNND2anrHs+qddZoqkdhY/OKyXH0NcvB01n27G7o62i6h5q0LgnU/H3X2LiQGNmwUOdIZ7oemazFg02joDnGxr6LPfvpAn3gjXTlnk8PJfR/hwHJGGUu4Iy8eO0p4dv63YW1Y+QF4Bmvo+ASrjTQ=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>,
        "Wood (US),
 Brian J" <brian.j.wood2@boeing.com>
Subject: NXP Layerscape SMMU IDs
Thread-Topic: NXP Layerscape SMMU IDs
Thread-Index: AdurC8k5LfOUV15qRn2MJIXu5HZ2/Q==
Date: Fri, 11 Apr 2025 18:44:37 +0000
Message-ID: <BN0P110MB20674B71640958CA7A56035AF3B6A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|BN0P110MB0984:EE_
x-ms-office365-filtering-correlation-id: 46af1791-7c3f-4d8a-ea17-08dd7928e939
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?RNt9Pxl+yAqd/OzXtscSazJeAnKFZPj2kQkb2waRguUWXhNxnDBi8lysH/+N?=
 =?us-ascii?Q?3eD54G+Qrd1xgTgAlHIflmp2NBfeAhDXvtcXH+4j/kuneeDsjpQxv+tELxIY?=
 =?us-ascii?Q?cJz37WNBu3oxnSPo8Xs2NoPAZEhcWlRS/v4ZcmyH9oldecm9phvqS0PH17MC?=
 =?us-ascii?Q?gRM4hDgFRkq2li86t0Eq41RUTQMUCTj9dStQWSwPobd6lsVSqLKyZ2q9zv5q?=
 =?us-ascii?Q?7kY5koFHRU3UFyc76ndo7qPNsy65mupN5Zw4oWgX1MsUzgAJg9ahh8IeN02F?=
 =?us-ascii?Q?f0bhWH/Z/L8nph6FPP6L7hZDC1/LfiStEhc6DX2/qSqMtysHWw+YqRXuuLfb?=
 =?us-ascii?Q?H//OFEG1l7TeOVn2H5DZxO8AjMJIOw7QrjJP8S6Ps3epgG8WTNVUsRFO90A1?=
 =?us-ascii?Q?PYGJqflmE+wWmdJAMbDywF8WfVuheP1k4pKm4JhlCInJ+KYaCg4ujrQPtGwP?=
 =?us-ascii?Q?t47RdbfD5QxQ4vCGFMhT7AHxtRwD3GhgjNqUHc8BiqTPKbN8QT8Xti/0zMp9?=
 =?us-ascii?Q?nt0Ev/FGkRVwEgZswS4JqGK8gnN2G0n03eZKzNo/S6lDmiXUDw0NfrY+06B9?=
 =?us-ascii?Q?OjRbJrOpibFnP8X3aOiSmXcQPHYKi5407j/wWAlhleeKvaPcvwnzKt3rYJ0b?=
 =?us-ascii?Q?zZOuf53jUuzv5t8Okcornria4dEH6CKwD9VL3wYy2ZPJhTHCn7n8CpoYtYMm?=
 =?us-ascii?Q?cqmRHWyKVgZpk6FJiFhMDtQNUctuFcbS2kT5X/HogmAX9pZlF1wbtMmaNp7g?=
 =?us-ascii?Q?FMweNFnsr7fORXyAj13QBmjzrTUejspDgW129lcQ/z54aO2veE4G8cfaq+FO?=
 =?us-ascii?Q?lKrkqqDfEws0kp5osY6ohHuPlBl2+9Ur73CemDpEyuQkK5YCVAm0/ES//SzE?=
 =?us-ascii?Q?IBIMhgoebac8zqE0zMLNApoo+KjJciYzdK4EOD+3qpzBotdajabYRZomTzXV?=
 =?us-ascii?Q?F3VR+Uwc+KrLAe3Gtqkh2vMNRpBr2SYsq6IQXHwEm5J0YRpXy19j5Nuts6e7?=
 =?us-ascii?Q?SoHx+Ja5jDmqnz6bf1+lhl/keRnlyq0tpoCWSRb/skbXHDKX9EqdN5n/4ThV?=
 =?us-ascii?Q?4vQzZtA4FP0vQTnMFE/WLjpObnR4R91+e5jre4jJdFVfvRnPwKlSofBXI0X6?=
 =?us-ascii?Q?IA7uAW4JOg1XN+QGFHyrBHEzmn2y7u4CXYyhB3yKmM2MBim88FY0DGFJVu5v?=
 =?us-ascii?Q?nANxrEstEmvchH4m4qvRVM9r6jNwG/EGUxI9ZBnL/ia1TDRC/MH1DdHdicK+?=
 =?us-ascii?Q?I57ffIWuP/Q9sEY6xMd7w3N+F2lNZy0ru64qbRGosUYRDzU8iHJYSxDikUoG?=
 =?us-ascii?Q?CBaruYOqV0hEeQ8pUpRNOIE3HeOyK3ocO/7Akc7PjzAk7Xed36On72KAhfKo?=
 =?us-ascii?Q?W0f6WxdakltomEauG//wL6p3J8BoGtHP1N5eeYJQPE8jEFFxuuRTJ6SIww58?=
 =?us-ascii?Q?S3Fz+EGJWEYxCyJ97D8Wz4xjfL2qTAalpvs8Bpz+1zJQPiDFjENa5iJuI7Tg?=
 =?us-ascii?Q?FTQ0gC154+PaHxo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZwoDFysw1BKBWZ3dB7KO7R+6dRNYtuzKoMnCaL7rOr0gaPgmhh8X8GL/MSdE?=
 =?us-ascii?Q?KdMlpfOFVKtvl9m4BBJ6uIvMH8LTfMF0pJeXN77uesUw+bziXKV1WL600fWa?=
 =?us-ascii?Q?4hkU/wpgOfgUArIsR1VhetkAq01Qia3KqYeC4bJqaiZWbKybg5/9KoF50ZtL?=
 =?us-ascii?Q?JVg9uZAnlYMszYIRGGQ48N7xOYMq6Z7pQ+Nay5Rr8/znuae4UDHaxs4l5vh9?=
 =?us-ascii?Q?rkCM9hUoQpm+gqkYCq8oWz1PBRBX61omGD6o9R6+lxnAdsRppo9KaL2fpJAm?=
 =?us-ascii?Q?kdXHsBKLb5qeMrJHTV41EUc6mb1ld1kNv1suEaqmM+pk4Kw9GlEQSGLBBWww?=
 =?us-ascii?Q?tsHRn+RiaF7gc3g7G47kx0+y/s4DxEsBp93IvB+fb9SKFJz6WxFrJ3slePbv?=
 =?us-ascii?Q?TVRaSFy//m97FJyGmCRh6wPAUALlWmOA171cgl7RHRdjqg0GwKoCLs35t/OI?=
 =?us-ascii?Q?+hOhz4YFF60TudqZEXZplWZMnxXTb0XCgMLQTt9m84oJGD6xI7M7nDkZBDsh?=
 =?us-ascii?Q?RjFCQtzqGpB4UCeeaO8BiSZ8sF0DcuIUdv+kPj8LR+w+Rg4JnxPtKwuZ5luZ?=
 =?us-ascii?Q?y9qjDj2S2U+rwO7wQ7cX65yCY2LZqtb+7evKwnFIr+RLqwBlXiqlKrB930NR?=
 =?us-ascii?Q?aVzk12sShs3kw/QrNNiUw9RNug+mt/WlhMedc6XkynCJuB4f7fQbKfOGmYSw?=
 =?us-ascii?Q?yt5y7/iDrS9tkxzBH8n60qr6kc5o+HQ6Z4ZNNA5wx3Sn9qbzVBAQ/20YCjDw?=
 =?us-ascii?Q?udIU4U60K8s2qvfKOUlIeW5kVEalMk6fMGaIhe2MVitEcZK8gRg6jbOfZk1K?=
 =?us-ascii?Q?URcDoUPE7tcsYPLuBtFjSV3QbWWMXzYaCDYAc2oosBuBpNVC+bQR/qzRYhLv?=
 =?us-ascii?Q?YkjF7LExdSkqxxaRDGsc8j1+/yGpNk/YEGb1gt/dQ751nW1uS2m1GupJIohC?=
 =?us-ascii?Q?DhBMzfQ7VqBghpxPZMWx+v5lTB0JyTQ69NZKz2+DVScd151BSDuh8xThdsX0?=
 =?us-ascii?Q?Z9aXYfgD/KhMKABJD5C27mH8C++FNgq3786x6Zj5PNuKtbdPJgc1p80u+/5J?=
 =?us-ascii?Q?YtRl6Eq/GgeERWmgmplbPIAZBCOCmMiGwsloCtt/axr9BNA4vJO8xk+o9Km7?=
 =?us-ascii?Q?wsOiM/cMc33N75sHE/gau8J5fzf85entBsDH/8/cddprnxVV3YH7/1HbzDun?=
 =?us-ascii?Q?Guk7hB+C1bMFhj8wcAAc03K97nmup1Y5BAbgLvpdNviwc94VH2yawEhJaDev?=
 =?us-ascii?Q?9mK7fk5yk4XzJJu/0hLmNp3CKGOeZq2B5YXxVhqsO6dagOpMh2JMz6gvbs4Q?=
 =?us-ascii?Q?lQzv1pMRoo4U+RjG0hRE5kQ6uGp/Q6YS0ymZnPei8RWOth3WUBeIDGYHcaXs?=
 =?us-ascii?Q?0phguCNZ3K+ysdrliuY4bSoOQ0Vtea/Ju78tKIwHL99baItKgJgawAkoapfZ?=
 =?us-ascii?Q?EP6iHZo5dq/NT8UWSnhcdTO7QVZn2/z+oecIHcG5TwJEmpbCna1RRzNm/de0?=
 =?us-ascii?Q?btaRoc2ri9LMVSFCorVJSpLI6JogjImDkxWm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46af1791-7c3f-4d8a-ea17-08dd7928e939
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 18:44:37.4842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB0984
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Hello,

We're curious if anyone else has figured out NXP Layerscape Xen support to =
get at least basic domains launching with minimal IO support?

Started a recent discussion on it here:
https://community.nxp.com/t5/Layerscape/How-to-determine-LS1088A-SMMU-Maste=
rs-and-Stream-IDs/m-p/2072157#M15560

We're guessing some of the NXP specific chip/interconnect designs in Layers=
cape were carried over from the QORIQ PowerPC P/T series.  Maybe some clues=
 in that Topaz hypervisor code?  https://github.com/nxp-qoriq-yocto-sdk/hyp=
ervisor

Regards,
Matt

