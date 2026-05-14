Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ChMMlbgBWpJdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 16:46:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028CD5436A7
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 16:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308958.1580187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNXKL-0003jB-Mp; Thu, 14 May 2026 14:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308958.1580187; Thu, 14 May 2026 14:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNXKL-0003gH-JD; Thu, 14 May 2026 14:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1308958;
 Thu, 14 May 2026 14:46:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNXKK-0003gB-GL
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 14:46:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNXKJ-005qgn-Pv
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 16:46:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a05e010-2eae-0a2a0a5409dd-0a2a450884f0-20
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:46:14 +0200
Received: from [52.101.72.0]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a05e036-63b5-0a2a45080019-34654800750b-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:46:14 +0200
Received: from CWLP123CA0106.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::22)
 by GV1PR08MB10477.eurprd08.prod.outlook.com (2603:10a6:150:163::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 14:46:08 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:401:5f:cafe::4b) by CWLP123CA0106.outlook.office365.com
 (2603:10a6:401:5f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 14:46:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 14:46:07 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB11318.eurprd08.prod.outlook.com (2603:10a6:150:2c2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 14:45:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 14:45:04 +0000
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
 b=TiIdws1Sxd+qgZ/bf8U7mXL71QCQYb30Kon7DYCnJg49WdKh3yGXygR1CycSPn390CIeV+DnkZJ62q2p0hWmeGfvoilaiPyt+Hi5GU0DpR47g8xESCsBvdtn44n0RAqxkSK4DrFxaRhsU09ArdpdiKYgeqDHFCLTaqalDu8jKtYPvxvAk2bSWBgVj3FSBeqHr7uTa8HH8Vwta2BNnecjH75wsBhtBP2OF7jflksAKznX1QlqPmolG0ilWkHWXMNbaXZJVOwye4ptKoj+wz8UQMAGYGiqUnvWT0gN71z7kDn6oaevT29CrjGBvXfab8hm3/RfaDF3lh1h+3EAbXVukg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXcoDxHRxGKKp8TCK5YNDj+o6REzgmHVFwVATp9BCck=;
 b=zPm39aeOtzvn+LrswtThgBV4yCDuJjig64W1poxRErQv6ZUFal0dM/N4+veP/Yf8dySDv46kPUOyYUuz0fE3RhnUhjiqr3rpDTFKupd90tK3wvcQb6T5JVK5oam+aX3LyTPDs4/T6adJyI1B7j6bXGB91LVCHLmxa/HgKyJtTrtzWx95VwrtqLZRXU/ktN5mvLLUVZeFzgF4+hMvYHerlI2x7Gug4eMR0VPrjkctIvlvbRF7SYR0U4redCE4b2VLV69VjNZCdAAVuIZr+Gapf3tlTa15c9PTGVdpmZFhi2KJU2KkzU4VW94yfcDte23YVUO47qx1uvdalMkwErxHJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXcoDxHRxGKKp8TCK5YNDj+o6REzgmHVFwVATp9BCck=;
 b=bmzaljxNTagqdBS93ILTJ2ZCkIh0FELd6KafcUQ/lVjuHSYQfA3XUgrhlAlW1sO/YTd/DFokMPPImbfeMkbdgA3nmHHqMXOJvyHMI1+606B2xkj2i1PQujKL1kjeLKgqpXxMCtll3wLqNh8huW7FA3MwYGCL6n3whrFQAI7moLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG9j7faOQSW7lBcjlO+X80ZF5DVgpaqfPEryD6xbDSwgiifZOEKvKjkLM3VhphfOX9At8S4g7DfPZ04uTUpa3jdUdPxkRnrVB3Cl5wO/K6KHlUmlKK1ZrlqoDGbsK9V3CUMht+ALFzEfQe1WpN+JWCtWkCNyfy7osZyrpqvvPYjC+h2RhQaL1ayWSCNbZEwPsAwZfdt2Wp7N+9i4rdxo1RSYvpSCkSadiKra9ZouV/gVPOgE8YI6qeDFIzUVk3vg+fQO9WK51bzLfLBk7G3TXK6AbthPn9LigwPi2ohiHHTGgVlK/TFavkPB7xkr5s0O6HUQRu9tsrYFYumW1abZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXcoDxHRxGKKp8TCK5YNDj+o6REzgmHVFwVATp9BCck=;
 b=arvRz/JnERYq9R8IHvuwJdAXgRPswJ5l/p68XQvEBKa1SF4WdgBpoNS0S1GCp9lLoDHfoDQq3C+p2vaHUgZhTYYiWat8QDLZyAcmREQC7MrkestLIYuq7V+F9ByHQob/7ibF+GR3YIxEYK8/tPF+YrU8EEurqzoojelHxBZ8IrBTmms4jugXdvJJQwT7E+bexzT31RCWBmj4bpSQNeeE0In0Jr6A+e/0N2yhyKJr0BJwRccKRdMt8ECQa4hAGjGWiV/JldqUe5QSgNOk5EmE+9NiubNz8xIvJIkZPiHa5UE3hijVjI4dwZJbBx70GzlOxsYQH+BdlEbgczC5rdgmqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXcoDxHRxGKKp8TCK5YNDj+o6REzgmHVFwVATp9BCck=;
 b=bmzaljxNTagqdBS93ILTJ2ZCkIh0FELd6KafcUQ/lVjuHSYQfA3XUgrhlAlW1sO/YTd/DFokMPPImbfeMkbdgA3nmHHqMXOJvyHMI1+606B2xkj2i1PQujKL1kjeLKgqpXxMCtll3wLqNh8huW7FA3MwYGCL6n3whrFQAI7moLM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Topic: [PATCH v9 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Index: AQHc4jIv4lr3xwecDU6oUMQf2MSZUrYNm/aA
Date: Thu, 14 May 2026 14:45:04 +0000
Message-ID: <5323B63C-7F37-418C-97C6-0A94F9D03B4F@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <bd79226263c1dd9c915a7fffd4f92b194af864ee.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <bd79226263c1dd9c915a7fffd4f92b194af864ee.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB11318:EE_|AMS0EPF000001A7:EE_|GV1PR08MB10477:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c39170-c7ca-4fc6-32b0-08deb1c78811
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|22082099003|56012099003|38070700021|3023799003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 IcNz05VCJKlZDr6vaIdo7CJsFCKF3YxUJmUM1JQUgKkA5qX5hQhIDF9BfNR4q+AmK7wDKnu1V+iFVEEwtAccYAvt0Uf1Kf6h6YtgNSVB5IEI5pMXk3IHQJoYJLcZBos1Q3DylK2Ca6bEHpQ+EUWNGcO+QiGwBFLGxu3Zt8z5m2SigRKBqrYSw2KRio921Wz+mzlBB/4gIkHSB2MqoqUMJUKv5ngbeCF+aHXUIlYD3TWjbEzH3kCkzCSDNU2d5+gh/8Z2NPUKWFJqnM7YPUTeMDUGaA39d940gZsJr126itp12qu/FnkJ4mf3/rbqBRjYuxdy4WEBHNbK2/k48sLiTE2hi9iP9utTe7ddT/4/OOLdry+pJUFnLR0QRvwuNqQDQl39aCuR2H8kTETqXI0YIRVnc1+cp6ZVc2y+P45db5gX7/ZWYSqH3At4+U2kX2TfjUjj8bnZxWZBVf/h1HT0BDegFir9OOk30xCMI2U3VnWSwwPYRLy05CLngfGVeYBi6dEajLXKv0oh4mUj7JEBa6o2BdQVOj3EnQgJZnBND/x8uyOBUkeKOaxr3XbqY0AnTa6te0pwf9SPckntSKQA7jFdKbnRCM2yaJYM3PpudicjhU76aXwWdK7vE84TQb8APvCKA77g0ck9FxvQ8KvFzuGA7My7/hbbq+HooGyGeDPWTLiU2j3z2ys9t5ihvH8D+icQBUt0OKcSTJouUKT9sm3ZbYSPOO1/v/9bG4QZOp0JwwmwsUPQkFSe9zUzSGtd
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099003)(38070700021)(3023799003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCEEE0F0D2B6D54685B646230F19FF70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 NQXV4T+lywkCMJtt3QFLDd1MaVi6WSSVTIQKM3SIhWuxqvjTZbT6Xma/glx2IoI70C1rf8j0t1kTFYnPJzlz0D5EpYwt9Ij1/srJlewCmXkMlEzwz/cQS7aGthvSt22zGeJ7m+fCvE5E/O5rLK3Jjn4UBPoHP5+4mZmANs3X6mChIexIqw4S7IRqZUqoA/ewHmKawNQxSQTAbQAH28whGX5vfZlaxGLlG8rfS29gEGvBpqpkYwH/ZKJIgj0XWU5qeoBR87FyKn0S/7G66ORYM/jtgXDP0khryXR86TmD2I9VuGpS+soM2JMpQY2QflzgiO2dti40k4OYdL2x+q/i+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11318
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa80bc95-c204-46a1-de1a-08deb1c76274
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|82310400026|7416014|1800799024|36860700016|35042699022|3023799003|11063799003|22082099003|56012099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	bnDvruiUMe/HIDNygPyuhQUAqWpbi0QYSl2dHcmL2OgQqy00Iyi1//MF782wWy+GaLbmuRdHioiM9lDRw26KQxDcw/REOcW+HhYaG8eEj7Eh+yKLfYtPE0pDw5lsGrAAxNl1QKlf4sMlNBPK1WhAr+xqWu2RNLQMeY0KCrbQCYshLO/3M7MbJqNF6lv+87tAtBdKtcnjoCjZoZgzTnpB6qD1cHSlJ9dlStbQzH5QIryuvqfh20We81y4P1IIZBk3208tu5QGbL37xjAIK6csa7fIhVHawKcvh0WSPpiAbiuCYNhxZqUUFq3bjk/ETWwgTtaIpqLdV6n0q4lEdEVMNefo85Gv4ynShBG6LpZ+upPvJnVPTLEs6s1puLcTMu6kOkjPHkZP4mz68IK+nrVMcwAWWN3ri2tUAdEPzR8Agg4rtpFPVnq01/7cCItvAvzDd6+rhhfq9IILv/9xe8X7X4zakqBaO+j2owOeXqWE+EvZLOn95dAcrPH1B9pFOqJThwUWvaLmyb20cse4yxIiAaL6ao5cj/mbgixmL7Fp+308ufQEA3sZSku0dnX2CFhWBzIuMUYSCmQeGSIxxnp/WZVHanOeWCVgRNNUAq2vx3C4GWat41XvebTkT+DgAUG+4N+qwZuedBkNiAlA8lRHpHpkxvGN+Eh5nYqaVBQUnyoSiJBCPmnPAA9ehATrNgnEnPDE09l3ODgeGb23tYBvygJZi1tuBDelK+XqIj8CAM4=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(7416014)(1800799024)(36860700016)(35042699022)(3023799003)(11063799003)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WDexAI+5mJu9f2z67bnLD6lUPShk4sW92+z0+VfSBBvHFrUmTbLu3oTSqcLVti1cWpy20excUTWuULWDsQqrBgNtrb5hCbQsIYpZJqVOK8ilw+xw20x4Lj3Rkaz4kmrVEgLJt+1vVbttEobF8v6I84BDgtfJALTj9hRpuag+2+7j1fGsRZ5OzwMY/+Y6g819ckJNXoL0pQhkVI43PYxdxp5R74lCxAu3/khta+Nk3mOAIU2XrvVCVHreHGzgpuAw8bWzQ/1O78XaLqdOHHM8hg0M2JRISH7mpKNilTMd4LpqIuHSiVDGApktmJzxK7hiAOO8tAziGrX00clmwRUFzwZjSF1Fsfag12Lph3EuG8l9+7h7ZonBvgTR3XSKx8ol7xVi34aAtlQpMhpJQ2dMYxSpGpI/nCpSQoYErK0/ioWx54J3qG+QiyaH30L7HedJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:46:07.1664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c39170-c7ca-4fc6-32b0-08deb1c78811
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10477
X-purgate-ID: tlsNG-c1860d/1778769974-BC766DB1-C2A927A2/0/0
X-purgate-type: clean
X-purgate-size: 10096
X-Rspamd-Queue-Id: 028CD5436A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+IE9uIDEyIE1heSAyMDI2LCBhdCAxODowNywgTXlrb2xhIEt2YWNoIDx4
YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEZyb206IE15a29sYSBLdmFjaCA8
bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KPiANCj4gSGFuZGxlIHN5c3RlbSBzdXNwZW5kL3Jlc3Vt
ZSBmb3IgR0lDdjMgd2l0aCBhbiBJVFMgcHJlc2VudCBzbyBMUElzIGtlZXANCj4gd29ya2luZyBh
ZnRlciBmaXJtd2FyZSBwb3dlcnMgdGhlIEdJQyBkb3duLiBTYXZlIGFuZCByZXN0b3JlIHRoZSBJ
VFMNCj4gQ1RMUiwgQ0JBU0VSIGFuZCBCQVNFUiByZWdpc3RlcnMsIGFuZCByZS1lc3RhYmxpc2gg
dGhlIGNvbGxlY3Rpb24gbWFwcGluZw0KPiBvbiByZXN1bWUuDQo+IA0KPiBBZGQgbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9jb250aW51ZV9yZXZlcnNlKCkgaW4gbGlzdC5oIGZvciB0aGUgSVRTIHN1c3Bl
bmQNCj4gZXJyb3IgcGF0aCB0aGF0IG5lZWRzIHRvIHJvbGwgYmFjayBwYXJ0aWFsbHkgc2F2ZWQg
c3RhdGUuDQo+IA0KPiBCYXNlZCBvbiBMaW51eCBjb21taXQgZGJhMGJjN2I3NmRjOg0KPiAiaXJx
Y2hpcC9naWMtdjMtaXRzOiBBZGQgYWJpbGl0eSB0byBzYXZlL3Jlc3RvcmUgSVRTIHN0YXRlIi4N
Cj4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+
IC0tLQ0KPiBDaGFuZ2VzIGluIFY5Og0KPiAtIGZpeCB0aGUgSVRTIHN1c3BlbmQvcmVzdW1lIGNv
ZGluZy1zdHlsZSBuaXRzOw0KPiAtIHByZXNlcnZlIHRoZSBzYXZlZCBHSVRTX0NUTFIgc3RhdGUg
d2hpbGUgbWFza2luZyB0aGUgcmVhZC1vbmx5DQo+ICBRVUlFU0NFTlQgYml0Lg0KPiANCj4gQ2hh
bmdlcyBpbiBWODoNCj4gLSBSZXdvcmQgdGhlIENCQVNFUi9DV1JJVEVSIGNvbW1lbnQgdG8gbWF0
Y2ggWGVuIGFuZCBkcm9wIHRoZSBzdGFsZSBMaW51eA0KPiAgY21kX3dyaXRlIHJlZmVyZW5jZS4N
Cj4gLSBDbGFyaWZ5IHRoZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X2NvbnRpbnVlX3JldmVyc2UoKSBj
b21tZW50Lg0KPiAtIEZhY3RvciBvdXQgcGVyLUlUUyBoZWxwZXJzIGZvciBjb2xsZWN0aW9uIHNl
dHVwIGFuZCByZXN1bWUuDQo+IC0gUmVzdG9yZSBlYWNoIElUUyBhbmQgcmUtZXN0YWJsaXNoIGl0
cyBjb2xsZWN0aW9uIG1hcHBpbmcgaW4gdGhlIHNhbWUNCj4gIGxvb3AsIHNvIGEgZmFpbGVkIElU
UyByZXN1bWUgaXMgbm90IGZvbGxvd2VkIGJ5IE1BUEMvU1lOQyBvbiB0aGF0DQo+ICB1bi1yZXN0
b3JlZCBpbnN0YW5jZS4NCj4gLSBwYW5pYyBpbiBjYXNlIHdoZW4gcmVzdW1lIG9mIGFuIElUUyBm
YWlsZWQNCj4gLSBjbGVhbnVwIGJhc2VyIGNhY2hlIGR1cmluZyBzdXNwZW5kDQo+IC0tLQ0KPiB4
ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jICAgICAgICAgICAgIHwgMTMzICsrKysrKysrKysrKysr
KysrKysrKysrKy0tDQo+IHhlbi9hcmNoL2FybS9naWMtdjMuYyAgICAgICAgICAgICAgICAgfCAg
MTEgKystDQo+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfaXRzLmggfCAgMjMgKysr
KysNCj4geGVuL2luY2x1ZGUveGVuL2xpc3QuaCAgICAgICAgICAgICAgICB8ICAxNCArKysNCj4g
NCBmaWxlcyBjaGFuZ2VkLCAxNzEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYyBiL3hlbi9hcmNoL2FybS9n
aWMtdjMtaXRzLmMNCj4gaW5kZXggOTAwNWNlOGNlNS4uNTgyYzI2ZDk2NCAxMDA2NDQNCj4gLS0t
IGEveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYz
LWl0cy5jDQo+IEBAIC0zMzUsNiArMzM1LDIyIEBAIHN0YXRpYyBpbnQgaXRzX3NlbmRfY21kX2lu
dihzdHJ1Y3QgaG9zdF9pdHMgKml0cywNCj4gICAgIHJldHVybiBpdHNfc2VuZF9jb21tYW5kKGl0
cywgY21kKTsNCj4gfQ0KPiANCj4gK3N0YXRpYyBpbnQgZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rp
b25fc2luZ2xlKHN0cnVjdCBob3N0X2l0cyAqaXRzLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNwdSkNCj4gK3sNCj4gKyAgICBp
bnQgcmV0Ow0KPiArDQo+ICsgICAgcmV0ID0gaXRzX3NlbmRfY21kX21hcGMoaXRzLCBjcHUsIGNw
dSk7DQo+ICsgICAgaWYgKCByZXQgKQ0KPiArICAgICAgICByZXR1cm4gcmV0Ow0KPiArDQo+ICsg
ICAgcmV0ID0gaXRzX3NlbmRfY21kX3N5bmMoaXRzLCBjcHUpOw0KPiArICAgIGlmICggcmV0ICkN
Cj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4gKw0KPiArICAgIHJldHVybiBnaWN2M19pdHNfd2Fp
dF9jb21tYW5kcyhpdHMpOw0KPiArfQ0KPiArDQo+IC8qIFNldCB1cCB0aGUgKDE6MSkgY29sbGVj
dGlvbiBtYXBwaW5nIGZvciB0aGUgZ2l2ZW4gaG9zdCBDUFUuICovDQo+IGludCBnaWN2M19pdHNf
c2V0dXBfY29sbGVjdGlvbih1bnNpZ25lZCBpbnQgY3B1KQ0KPiB7DQo+IEBAIC0zNDMsMTUgKzM1
OSw3IEBAIGludCBnaWN2M19pdHNfc2V0dXBfY29sbGVjdGlvbih1bnNpZ25lZCBpbnQgY3B1KQ0K
PiANCj4gICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoaXRzLCAmaG9zdF9pdHNfbGlzdCwgZW50cnkp
DQo+ICAgICB7DQo+IC0gICAgICAgIHJldCA9IGl0c19zZW5kX2NtZF9tYXBjKGl0cywgY3B1LCBj
cHUpOw0KPiAtICAgICAgICBpZiAoIHJldCApDQo+IC0gICAgICAgICAgICByZXR1cm4gcmV0Ow0K
PiAtDQo+IC0gICAgICAgIHJldCA9IGl0c19zZW5kX2NtZF9zeW5jKGl0cywgY3B1KTsNCj4gLSAg
ICAgICAgaWYgKCByZXQgKQ0KPiAtICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gLQ0KPiAtICAg
ICAgICByZXQgPSBnaWN2M19pdHNfd2FpdF9jb21tYW5kcyhpdHMpOw0KPiArICAgICAgICByZXQg
PSBnaWN2M19pdHNfc2V0dXBfY29sbGVjdGlvbl9zaW5nbGUoaXRzLCBjcHUpOw0KPiAgICAgICAg
IGlmICggcmV0ICkNCj4gICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gICAgIH0NCj4gQEAgLTEy
MTAsNiArMTIxOCwxMTMgQEAgaW50IGdpY3YzX2l0c19pbml0KHZvaWQpDQo+ICAgICByZXR1cm4g
MDsNCj4gfQ0KPiANCj4gKyNpZmRlZiBDT05GSUdfU1lTVEVNX1NVU1BFTkQNCj4gK2ludCBnaWN2
M19pdHNfc3VzcGVuZCh2b2lkKQ0KPiArew0KPiArICAgIHN0cnVjdCBob3N0X2l0cyAqaXRzOw0K
PiArICAgIGludCByZXQ7DQo+ICsNCj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KCBpdHMsICZo
b3N0X2l0c19saXN0LCBlbnRyeSApDQo+ICsgICAgew0KPiArICAgICAgICB1bnNpZ25lZCBpbnQg
aTsNCj4gKyAgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlID0gaXRzLT5pdHNfYmFzZTsNCj4gKw0K
PiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBCeSB0aGUgdGltZSBYZW4gcmVhY2hlcyBnaWNf
c3VzcGVuZCgpLCBldmVyeSBkb21haW4gaXMgYWxyZWFkeSBpbg0KPiArICAgICAgICAgKiBTSFVU
RE9XTl9zdXNwZW5kLCBzbyBJVFMtdGFyZ2V0aW5nIGludGVycnVwdCBzb3VyY2VzIGFyZSBleHBl
Y3RlZA0KPiArICAgICAgICAgKiB0byBoYXZlIGJlZW4gcXVpZXNjZWQgYnkgdGhlIG93bmluZyBP
UyBiZWZvcmUgU1lTVEVNX1NVU1BFTkQuDQo+ICsgICAgICAgICAqLw0KPiArICAgICAgICAvKiBQ
cmVzZXJ2ZSBzYXZlZCBHSVRTX0NUTFIgc3RhdGUsIGV4Y2x1ZGluZyByZWFkLW9ubHkgUVVJRVND
RU5ULiAqLw0KPiArICAgICAgICBpdHMtPnN1c3BlbmRfY3R4LmN0bHIgPSByZWFkbF9yZWxheGVk
KGJhc2UgKyBHSVRTX0NUTFIpICYNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fkdJVFNfQ1RMUl9RVUlFU0NFTlQ7DQo+ICsgICAgICAgIHJldCA9IGdpY3YzX2Rpc2FibGVfaXRz
KGl0cyk7DQo+ICsgICAgICAgIGlmICggcmV0ICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAg
ICAgd3JpdGVsX3JlbGF4ZWQoaXRzLT5zdXNwZW5kX2N0eC5jdGxyLCBiYXNlICsgR0lUU19DVExS
KTsNCj4gKyAgICAgICAgICAgIGdvdG8gZXJyOw0KPiArICAgICAgICB9DQo+ICsNCj4gKyAgICAg
ICAgaXRzLT5zdXNwZW5kX2N0eC5jYmFzZXIgPSByZWFkcV9yZWxheGVkKGJhc2UgKyBHSVRTX0NC
QVNFUik7DQo+ICsNCj4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBHSVRTX0JBU0VSX05SX1JF
R1M7IGkrKyApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHVpbnQ2NF90IGJhc2VyID0g
cmVhZHFfcmVsYXhlZChiYXNlICsgR0lUU19CQVNFUjAgKyBpICogOCk7DQo+ICsNCj4gKyAgICAg
ICAgICAgIGl0cy0+c3VzcGVuZF9jdHguYmFzZXJbaV0gPSAwOw0KPiArDQo+ICsgICAgICAgICAg
ICBpZiAoICEoYmFzZXIgJiBHSVRTX1ZBTElEX0JJVCkgKQ0KPiArICAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPiArDQo+ICsgICAgICAgICAgICBpdHMtPnN1c3BlbmRfY3R4LmJhc2VyW2ldID0g
YmFzZXI7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9DQo+ICsNCj4gKyAgICByZXR1cm4gMDsNCj4g
Kw0KPiArIGVycjoNCj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X2NvbnRpbnVlX3JldmVyc2Uo
IGl0cywgJmhvc3RfaXRzX2xpc3QsIGVudHJ5ICkNCj4gKyAgICAgICAgd3JpdGVsX3JlbGF4ZWQo
aXRzLT5zdXNwZW5kX2N0eC5jdGxyLCBpdHMtPml0c19iYXNlICsgR0lUU19DVExSKTsNCj4gKw0K
PiArICAgIHJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgZ2ljdjNfaXRzX3Jl
c3VtZV9zaW5nbGUoc3RydWN0IGhvc3RfaXRzICppdHMsIHVuc2lnbmVkIGludCBjcHUpDQo+ICt7
DQo+ICsgICAgdm9pZCBfX2lvbWVtICpiYXNlID0gaXRzLT5pdHNfYmFzZTsNCj4gKyAgICB1bnNp
Z25lZCBpbnQgaTsNCj4gKyAgICBpbnQgcmV0Ow0KPiArDQo+ICsgICAgLyoNCj4gKyAgICAgKiBN
YWtlIHN1cmUgdGhhdCB0aGUgSVRTIGlzIGRpc2FibGVkLiBJZiBpdCBmYWlscyB0byBxdWllc2Nl
LA0KPiArICAgICAqIGRvbid0IHJlc3RvcmUgaXQgc2luY2Ugd3JpdGluZyB0byBDQkFTRVIgb3Ig
QkFTRVI8bj4NCj4gKyAgICAgKiByZWdpc3RlcnMgaXMgdW5kZWZpbmVkIGFjY29yZGluZyB0byB0
aGUgR0lDIHYzIElUUw0KDQpzL3VuZGVmaW5lZC91bnByZWRpY3RhYmxlLyA/DQoNCj4gKyAgICAg
KiBTcGVjaWZpY2F0aW9uLg0KPiArICAgICAqLw0KPiArICAgIFdBUk5fT04ocmVhZGxfcmVsYXhl
ZChiYXNlICsgR0lUU19DVExSKSAmIEdJVFNfQ1RMUl9FTkFCTEUpOw0KPiArICAgIHJldCA9IGdp
Y3YzX2Rpc2FibGVfaXRzKGl0cyk7DQo+ICsgICAgaWYgKCByZXQgKQ0KPiArICAgICAgICByZXR1
cm4gcmV0Ow0KPiArDQo+ICsgICAgd3JpdGVxX3JlbGF4ZWQoaXRzLT5zdXNwZW5kX2N0eC5jYmFz
ZXIsIGJhc2UgKyBHSVRTX0NCQVNFUik7DQo+ICsNCj4gKyAgICAvKg0KPiArICAgICAqIFdyaXRp
bmcgQ0JBU0VSIHJlc2V0cyBDUkVBRFIgdG8gMCwgc28gcmVzZXQgQ1dSSVRFUiB0bw0KPiArICAg
ICAqIGtlZXAgdGhlIGNvbW1hbmQgcXVldWUgcG9pbnRlcnMgYWxpZ25lZC4NCj4gKyAgICAgKi8N
Cj4gKyAgICB3cml0ZXFfcmVsYXhlZCgwLCBiYXNlICsgR0lUU19DV1JJVEVSKTsNCj4gKw0KPiAr
ICAgIC8qIFJlc3RvcmUgR0lUU19CQVNFUiBmcm9tIHRoZSB2YWx1ZSBjYWNoZS4gKi8NCj4gKyAg
ICBmb3IgKCBpID0gMDsgaSA8IEdJVFNfQkFTRVJfTlJfUkVHUzsgaSsrICkNCj4gKyAgICB7DQo+
ICsgICAgICAgIHVpbnQ2NF90IGJhc2VyID0gaXRzLT5zdXNwZW5kX2N0eC5iYXNlcltpXTsNCj4g
Kw0KPiArICAgICAgICBpZiAoICEoYmFzZXIgJiBHSVRTX1ZBTElEX0JJVCkgKQ0KPiArICAgICAg
ICAgICAgY29udGludWU7DQo+ICsNCj4gKyAgICAgICAgd3JpdGVxX3JlbGF4ZWQoYmFzZXIsIGJh
c2UgKyBHSVRTX0JBU0VSMCArIGkgKiA4KTsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICB3cml0ZWxf
cmVsYXhlZChpdHMtPnN1c3BlbmRfY3R4LmN0bHIsIGJhc2UgKyBHSVRTX0NUTFIpOw0KPiArDQo+
ICsgICAgcmV0dXJuIGdpY3YzX2l0c19zZXR1cF9jb2xsZWN0aW9uX3NpbmdsZShpdHMsIGNwdSk7
DQoNClRoaXMgd2lsbCBhbHdheXMgaXNzdWUgYSBNQVBDIFY9MSwgaW4gdGhlIHNlY3Rpb24gNS4z
LjkgaXQgc2FpcyBpdOKAmXMgInVucHJlZGljdGFibGUNCmlmIHRoZXJlIGFyZSBpbnRlcnJ1cHRz
IHRoYXQgYXJlIG1hcHBlZCB0byB0aGUgc3BlY2lmaWVkIGNvbGxlY3Rpb24gYW5kIHRoZQ0KY29s
bGVjdGlvbiBpcyBjdXJyZW50bHkgbWFwcGVkIHRvIGEgUmVkaXN0cmlidXRvciwgdW5sZXNzIE1B
UEMgaXMgZm9sbG93ZWQgYnkgTU9WQUxM4oCdLA0KaW4gdGhpcyBjYXNlIHRoZSByZWRpc3RyaWJ1
dG9yIGlzIHRoZSBzYW1lIGJ1dCB0aGUgc3BlY3MgZG9u4oCZdCBzYXkgYW55dGhpbmcgYWJvdXQg
dGhpcyBjYXNlLA0KaXTigJlzIGdlbmVyYWxseSB1bnByZWRpY3RhYmxlIGlmIHdlIGFyZSByZW1h
cHBpbmcgYW4gYWxyZWFkeS1saXZlIGNvbGxlY3Rpb24uDQoNCkkgc2VlIExpbnV4IHJlcGx5IHRo
ZSBNQVBDIFY9MSBvbmx5IGlmIHRoZSBjb2xsZWN0aW9uIGlzIHN0b3JlZCBpbiB0aGUgSVRTIChu
b3QgbWVtb3J5IGJhY2tlZCksDQpvdXIgY29sX2lkIGlzIGBjcHVgLCB3aGljaCBJIGJlbGlldmUg
dGhhdCBmb3IgdGhlIHN1c3BlbmQgcGF0aCBpcyBhbHdheXMgemVybyAoPyksIHNvIGJ5IGxvb2tp
bmcgaW50bw0KSENDIHdlIGNvdWxkIGNoZWNrIGlmIHdlIG5lZWQgdG8gaXNzdWUgdGhlIE1BUEMg
b3Igbm90Lg0KDQppZiAoIGNwdSA8IEdJVFNfVFlQRVJfSENDKHJlYWRxX3JlbGF4ZWQoYmFzZSAr
IEdJVFNfVFlQRVIpKSApDQogICAgcmV0dXJuIGdpY3YzX2l0c19zZXR1cF9jb2xsZWN0aW9uX3Np
bmdsZShpdHMsIGNwdSk7DQoNCnJldHVybiAwOw0KDQo+ICt9DQo+ICsNCj4gK3ZvaWQgZ2ljdjNf
aXRzX3Jlc3VtZSh2b2lkKQ0KPiArew0KPiArICAgIHN0cnVjdCBob3N0X2l0cyAqaXRzOw0KPiAr
ICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7DQo+ICsgICAgaW50IHJl
dDsNCj4gKw0KPiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGl0cywgJmhvc3RfaXRzX2xpc3Qs
IGVudHJ5ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHJldCA9IGdpY3YzX2l0c19yZXN1bWVfc2lu
Z2xlKGl0cywgY3B1KTsNCj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPiArICAgICAgICAgICAgcGFu
aWMoIkdJQ3YzOiBJVFNAJSJQUklwYWRkciI6IGZhaWxlZCB0byByZXN0b3JlIGR1cmluZyByZXN1
bWU6ICVkXG4iLA0KPiArICAgICAgICAgICAgICAgICAgIGl0cy0+YWRkciwgcmV0KTsNCj4gKyAg
ICB9DQo+ICt9DQo+ICsNCj4gKyNlbmRpZiAvKiBDT05GSUdfU1lTVEVNX1NVU1BFTkQgKi8NCj4g
DQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

