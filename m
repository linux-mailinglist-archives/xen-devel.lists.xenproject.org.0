Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAIGAamp32nQXQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:07:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7AF405AC9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282600.1565165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1pc-0002bn-MK; Wed, 15 Apr 2026 15:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282600.1565165; Wed, 15 Apr 2026 15:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1pc-0002ZA-Iw; Wed, 15 Apr 2026 15:07:08 +0000
Received: by outflank-mailman (input) for mailman id 1282600;
 Wed, 15 Apr 2026 15:07:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD1pa-0002We-Un
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:07:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD1pa-002n71-BW
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:07:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa98f-e002-0a2a0a5209dd-0a2a450194c6-28
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:07:06 +0200
Received: from [52.101.83.1]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa999-c1f2-0a2a45010019-34655301e223-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:07:05 +0200
Received: from PR3P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::10)
 by GVXPR08MB11398.eurprd08.prod.outlook.com (2603:10a6:150:2e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:06:59 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:b5:cafe::dd) by PR3P251CA0023.outlook.office365.com
 (2603:10a6:102:b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 15:06:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.0
 via Frontend Transport; Wed, 15 Apr 2026 15:06:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB6611.eurprd08.prod.outlook.com (2603:10a6:20b:36b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:05:54 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:05:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kmhHU+gDiTOVsVNCsBcLJV/c+Qba7qr5lvV70IqJZRJUqIcFeaee485ue03JQOy0wlAP788gBOaKAl8jA09S5NmGEjC43W0WjrW6+jup51bCKe9KX9HYyPRb5AVSAET4Qrf0h7PRnaODNKAypxe8CrSgkDpOEF+6+WYA4BEY0OFP1bIrOaCVCzQ5Itofcv6ixxaIEv2EMqnsyk4XaHy9oHLwx6LB5QjKup+E7LFGsWYFWfyOSVvBLloqWbw1+RwucWyetrLKx3WxujZX1jFolgX7nXVmdEBTn3KIOlOR4wKxxdbcUz2Jm/z4nTxYWyvOq8sCA7OX2j54Hq/8ogAP9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo/T6ByA8fqWtDlMUx4LiAYm7Wr4gCGAllXZXFM8KNE=;
 b=qhdBNPZNeAJnPCVwDKMkUORHxkqNCVsY3bRSu6p25OHpb5iXVGGdvkBjJ9/e6wT7ocKZ7J4iS+bZ3e2Iohk8cJPKHolaAL/6xNq3rRmIiSIzBtundqb577hBaw2PJRLBLioGfq7uMKggfsJkaqY133CKVTfxLnj8pdwlh0Riia7cFr87g3DEeg/9nX7m0JxxEtF8f/yx52vQrUdLGieWDZtbsV/YTQpVQP/bZFz7Oa834fB1cSKp2amAYbPWqlS9JM+IGxVczo6ckF4Yjtww4jPOVTGpfM6Lq0Rq/I+/dkD7m2LtrQhatbPbfJP6eCc7hXwRlH7QkoXi9zEaKkWeGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wo/T6ByA8fqWtDlMUx4LiAYm7Wr4gCGAllXZXFM8KNE=;
 b=Dx2PLMR9Q6+jhoDQoowaB8m5islUSgDoNxmYRF180fXDD2Dj1Q5tQ6UZRn6/xKxtu32n33TvZHA/if6+Kp8rayznEaV70SfhbE/2tQUNEHvamTlzL4PGgEkm2VBeCs3G4R+rZMVaY3cFi8JynqEtHZwqSqsepOSiZnFnmG9EihE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ex/A+Nf7UCgOO35X3PCk1RH7HqJCTmEOnN9DPTapkrW3TlBpbQp+VzmGevR2OCXOlGXu2JoDK2MlqhRtalJJSJ19AxEc9ZDDDuHt8tj5cq06yClyD25GCUv1i59AD1NuxRzn90GYzRVrmRzZqE7p6GeD10GnDWlLCKKfD5mE1JlV7q9E6h8bJ4I9tp+YfOp4Es1spcu/sF88VlfGxLKMbRpnXnN1Tzagtkd2pH8kwXhN0fRv01Fm+EuYEhaYhfhFTHN1hkfp3CoKGup7mNJ/YlM+/99HfMmKiAX5ITRD/ZDHLJhENb/X7r5VKRAfqG8qe0Ceo7Eztxr4D7uCp58sjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo/T6ByA8fqWtDlMUx4LiAYm7Wr4gCGAllXZXFM8KNE=;
 b=xwjmYnQWDpGuOSbsiDM2gOTPWUYi3IO8eUqLqeD6Ov9wiZ6Dfl6I9aCGSdGiQEq3AaL5z+oVxAEUUKlNHQKXQW4nld6c7OqnBz+w4JK2QMDosvLkpNJQKxR0hMQQSvz9qV7lidavWxaL/izhO4qIYTK+Qvy3Ov8BCTvUDC57Y+NbFF4I7lvV8FqPdxRwh7nWn3kVSO0ErrbfyOVLudg1OmSKd5x5Rm6T4U8LNehm9A5s8LkXVThHO402RJRDa4yL915Nl4PSlBiHe52VL5JL85rApVWrv8YuYR0yzNW+/uXMyE5jHMiyXDD9ysaLauhVt2U0o3LYte6t//2IAkWC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wo/T6ByA8fqWtDlMUx4LiAYm7Wr4gCGAllXZXFM8KNE=;
 b=Dx2PLMR9Q6+jhoDQoowaB8m5islUSgDoNxmYRF180fXDD2Dj1Q5tQ6UZRn6/xKxtu32n33TvZHA/if6+Kp8rayznEaV70SfhbE/2tQUNEHvamTlzL4PGgEkm2VBeCs3G4R+rZMVaY3cFi8JynqEtHZwqSqsepOSiZnFnmG9EihE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/6] xen/dt-overlay: fix rangeset leak and dead code in
 domctl path
Thread-Topic: [PATCH 2/6] xen/dt-overlay: fix rangeset leak and dead code in
 domctl path
Thread-Index: AQHczMxIjpIzSUmpeUSPrgyPaY80gLXgOPiA
Date: Wed, 15 Apr 2026 15:05:53 +0000
Message-ID: <33C5577E-F6AE-4FC2-BE53-879BA4EB6198@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-3-michal.orzel@amd.com>
In-Reply-To: <20260415113700.107915-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB6611:EE_|AM4PEPF00025F9B:EE_|GVXPR08MB11398:EE_
X-MS-Office365-Filtering-Correlation-Id: cba028a4-ced4-44ea-d482-08de9b00a333
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 NqMkLMq6zwMVkqClthsEV8yypB9/g0N4hmQKkYCojcFj2stOfCzvg9Fuz7h5hZqcv9FtGK1iAwHuHgHMJiE/frs84Upx2SEB5D6cAi37gW1gDta5njpDSJGPPUN4e780yOp+Hkom17omL6pY8NyOoHg0b8C0+pagk0fSaSjN6xLp8mxnbQBlQYUurHxTDwOPaEaYuZJ5gzpqjb+LP5LDTDcR099J0IQxwlhT24BwYWnN81RBvtPKAF0Ce5rApO8RPHWOZrL4RNyoIN913TDcOTGnhNs+m798+Efk5jg2QuneYBschzLtdeH5c16RWl4MJfh8DjgGw0SDmgsXBgXDDisVzyh3S1QtNwySpRWUsSL4TezD6k6VHTNPBS5nLCS9zmMwPpGnmbcfBNn8QZcRqgMpO1+HpW4lfZqVPN4+gPKb/iyGAHZCnF0FoYVZrIgKqOCEu5ZPC3raH2wSwhp9fGfHv/dDMUIla3fOsmNny34MBAWD4pXEywU/FVSIBIxftkc/MZW+ca29ibRuAhQF0iCtE3cXJC9ZwsFj0PN8YbPIJNGrWQ+xZcQIfstf8Ly+5WJ32evI0zrDoI3xf4AyKmPu6CmGk3oYHHaZdvu4aih8TCXIPsMnmqpHe7Jp1gcTRu7tlMXOnwtUmXQGE8GMMmrmTViFAYeRXKintRFDCRkeH8SYVZK9W4Y2k3TowXg+1RqnDj6Ge/lgfmK/xUA/h8zcdhOSIDzx5SMiUYrD1i6aWTVKTSH3taEyeCXYNk4lEwMFuy/CT1SPeB5DU+mQmyyB3iL6MnqjltK0DBFzvu4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB4D5317EA736B43B78901BCFAD45BE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 RrjQuAIFdSY9z8XZ9zBbbNrlQWpUWQugcB0C9vB+40Ps2/XRqlhE6XDhu97QRWV3fn/E6Gq8wPw3ZhmJ/hzqNajBiopRirYezjtKRTbT4HT3NGWcV+mFCVJKSAFm9gehWe6j2WCTLT/+cfeG6WwUErsgLO6w1T5UW0ZNy/gUJH88IOlygsTK9qShj0xiLK+IKSpMoQfiSVogzYNvCYd5HheedQTCX/Dl0W87l0XpzcgixFxjXi3+hixfwp9jPyvArg/ngnfvj3l3Eh7FYzse27FJrR3ZyNISGe7Jgl1ScHPNu9AlbRlUlwFJutaOAP3O7PizLLwvxP1t8iIE7tqfaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1b76ece7-65fc-484a-cac5-08de9b007d3e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|14060799003|36860700016|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B5AhMwmbvjbbJ/FU9zkKFezWuqpckQu1sLYifFKnxkDS+ErETR0w3MKhgKZlAZGHQ2w6N+E1ToB25QzpOGLVMLlYN0br7AwMFy9cpmgE+joNw3OuWvf8yEWvzOv3iL6hIG02UKya/sQ3QMWxnMGw6hOOpCFwIcw1VgcFFtaUYAMESh9ozEzlfB9u5Y6I6n/xsuvkBnG0B6jiDJlS0/lfyOtv0FFp+r1xj2bZeTiXhAkjpu4pI3ya+SZsHtRjfm55Fy6LJv73ngpdyuEWJOPK4hm/7aTwlNAnCDUvV6WkhqWolNpYgvoId4Dh5UI16kU71+nV5rd2tQKEhnQz2KKHcz/kDjGEnDeyKKct8vStvXGo/0WNS0RalnusIxBrVRYvonpwtXU+XDeENqx17T+1atdzcQIZ3oB/Vf/J4wrwsuO5SxOqps2N9V4JX7JVAottTYDW17klVKbM2RdGCFb9H45t3GzasypjAYBBewXpt97qMygGa6Yed1Aneri9E/EdxHYUQongvVNDm5XKmUWZDgvDShY4Y0qC+NyBue/r/grlp6A09r87wDaPAziC6DuZPnZaenlVwOfWCswRjBhM1Q/vZ3LvGqbRB/HCxcfxwJk1BeXZlYhg5jPwLs8Coiv8FojmK8jgjSglLkgTkPrMRpV25dnWW5atPd0i6lZRkCI7o/uEphmXWBwi8mh8Au2guk3PkL1Vk4tNIvj2fCylXCcJzF5q/fEyDgqxIb2mEIhky19KWTtO/hdI8dN6qQQGpjswb0IBoumTFArYZB7cJA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(36860700016)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WGNzcKgl3sx57pMnvKRQmgMV6S3leysZQVVN/FFY8NMR16Pm54cLpe2x/+JTXtL5cBIVO3Q4WbHGsVXAY7jWMQk7iQ6GhlDomn2rgqMkbksGsLpMJiMGCv7cagrhXO4WUrE8elqtv/520oVK43drXgMvMJ99prXImS7Hnko/V8pOiWzemJyezs3vTtE9FZ9JeTtmzbJfRjtBJNSWcdsfVRpSMbUFPw3C8Zg8xttj16PYaczDpPgg2inFbuYkqnOHi1fWgJUtP1BifmPA6AAiAS0nDn3h03Z+nYb3wQuH8C/qpfSr66qGa+5B+HKCR9NzN3kleaPoNFzEFhWrL2XXHFCqNoudvMzqrVkm0LQmf5L7ESbxAKnZwgYGfL/E4TGzULkvn90Vepcrdlbm5kJoIswUl0xVUTLloMUp6IM0SJO9hUDnSYOOoSkjsg/cjc+2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:06:57.2634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cba028a4-ced4-44ea-d482-08de9b00a333
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11398
X-purgate-ID: tlsNG-d62444/1776265625-B6C7CFF4-628C6E80/0/0
X-purgate-type: clean
X-purgate-size: 829
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,arm.com:email,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: EE7AF405AC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> handle_attach_overlay_nodes() unconditionally creates new rangesets
> without checking whether they already exist from a prior attach. A
> repeated attach for the same overlay leaks the original pair. Reject the
> operation with -EEXIST if rangesets are already present.
>=20
> Also, dt_overlay_domctl() early-returns -EOPNOTSUPP for any operation
> other than ATTACH, making the if/else at the bottom unreachable. Remove
> the dead branch.
>=20
> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attac=
hment to domains")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


