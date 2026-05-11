Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNeRCgDXAWryjwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:17:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202350EB76
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306171.1578242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQVk-0005hz-4J; Mon, 11 May 2026 13:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306171.1578242; Mon, 11 May 2026 13:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQVk-0005fR-08; Mon, 11 May 2026 13:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1306171;
 Mon, 11 May 2026 13:17:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wMQVi-0005el-L6
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:17:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQVh-006WVZ-Ij
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:17:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a01d6e0-e002-0a2a0a5209dd-0a2a45099280-14
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:17:24 +0200
Received: from [52.101.65.14]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a01d6e4-2497-0a2a45090019-3465410ea86e-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:17:24 +0200
Received: from CWLP265CA0430.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::12)
 by AS2PR08MB8904.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 13:17:16 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::f5) by CWLP265CA0430.outlook.office365.com
 (2603:10a6:400:1d7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 13:17:16 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 13:17:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB9681.eurprd08.prod.outlook.com (2603:10a6:10:45c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 13:16:11 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9891.019; Mon, 11 May 2026
 13:16:11 +0000
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
 b=V10aPhv4UutPAXwpqe5hWTY4nsTmsPzRjnJb3GwgaboXm5q4H/ZfmLoUEqRejnd3HZ4YMiUOU4vi+8m2OwLMrknhJ6jkNe81QY9KFWT0KJ5/LX33+071LmCkdzFgk7kMsG7oje58TM+T4bXNZzFGLwhAWoW/LaPzFdBsyaD4teywur3F1j/XwAxsL9bq7QzQZU/BolhsWS/KQQJsFL9PVbsX5oDnWiaR3G4guWuV0kKZhlB5p5ewWcaC/TmO4Uwzk691UeL52FhGr4TCexDk9cQy6SI8huQtxZNmxj7dzI9LkF2gvDHJCaFskf6wmzhmi00CYANlsW2Gl4XcMfRGkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kme/demMMAAaZm77U98WvERpvK8HXjHbB+VmpkFcDO8=;
 b=xC4OIJUj1OVm3cAGbJs10AnUTVMR+4RhSU9nhav/tg5uJmY+R7n/llF0BFoGd78okNJPcvGnproo7jnL4xHkeaIuPRNAV5IGrDdZPb50b5iz1iBHRXgvN2xqJfZMnvlrw9JShZZXABVVuYAkPzddK49Qjz79E/Iea07YKIchwoXukuBzcsHMEtgmQPz4f+6wRClGPRKbQGZ/kM3L6BBmOzwJ5/CACjWJVbfC01vr879USMsqRsZgiVyoXKBvMBsTh+HQrS/fTkffGTODl0dPUsGobYyqbXAC3HG/Pt06YfQVYTcWQ+0fc5heFLLImYDoX/CYsJPeRdvAVFam4/L1fA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kme/demMMAAaZm77U98WvERpvK8HXjHbB+VmpkFcDO8=;
 b=Iaad1ClIJYV4piwHcUyDLhj0M8uP6VYIdSUsZxW1qmsBBLtCaFNtlYe4L5OH2Msoq4Y0hb7BukD0hRHjKNVIYl1H0vggo7zfEwjnVpPWUfIO2vuUsvp8GYnnyZQ+4csMYYMVVRewolbctHHevhwukx2+Y4XkcIYs3XgIi68T1uw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIW7FWZnxO/vA+5rojw0DCku0oOhuN6a84V8H6f0hBI4pXJLAaKLRBeowEh/PMU0l6/rzN2RHba5OmBzxn3xViqiSwnvjkSIj4tQ703qG3ZLuJo7xP/PDkpkkU4vdOjjfw1oBhSY3Vlvh72YZqExHB+VDRiBFV4Unwv4UGURlS3fuQ2sZkWGITJVRe+IoFHkxDRLl7UAv2+ejvNcpDcjXdkGaFYSuHWA6YivAIyuWYW+BGgpzAKHd91HkAZj8jy4Q0mgMHyif1z/tTotUVx0c+nYaVtSei02BN+9cpzWhVXXB71G+F8+bhXYVVCz8eXJ3fE0r/tbjxauJ0A/yTx+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kme/demMMAAaZm77U98WvERpvK8HXjHbB+VmpkFcDO8=;
 b=IrWJRbZIqkZIVH980FK0G/wxuBzKfz4bL6CsW2/dBn6gnrbhqHMB2XQKFbXtov/s2M/POP8+jcVwMLf0kUVRmNLcLVBV0DjxbR8dLF1hSCQtORMGTiz4mFRwswI9fRDwOvikA3GBnLkqbi7AnP4phKq30b8c6rrfmPofyXOoxCI+7E65hhLCiflWi77Hv4L5dkXVfBwZbh+wOKgJMzNtyEtnLN4QSkf7HleQtAHMJnSgXDBWDDY+MXCCxGVuYFE0+aFZohvRummqGLkzuZnZFoFkM970iaGLDUgA8m3I9s73fRI7ZVAWLbGEcdGCwrGaquXMMwoRc+LmfDz24x8r5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kme/demMMAAaZm77U98WvERpvK8HXjHbB+VmpkFcDO8=;
 b=Iaad1ClIJYV4piwHcUyDLhj0M8uP6VYIdSUsZxW1qmsBBLtCaFNtlYe4L5OH2Msoq4Y0hb7BukD0hRHjKNVIYl1H0vggo7zfEwjnVpPWUfIO2vuUsvp8GYnnyZQ+4csMYYMVVRewolbctHHevhwukx2+Y4XkcIYs3XgIi68T1uw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v2 6/6] xen/arm: ffa: Deliver VM-to-VM notifications
 locally
Thread-Topic: [PATCH v2 6/6] xen/arm: ffa: Deliver VM-to-VM notifications
 locally
Thread-Index: AQHc15tBfAqUtgqv9kG77vlVw6CxULX/MgaAgAmvYgA=
Date: Mon, 11 May 2026 13:16:11 +0000
Message-ID: <109D53DA-85D7-4AA5-BBB1-F54DF529BA8D@arm.com>
References: <cover.1776955622.git.bertrand.marquis@arm.com>
 <1ead2af7182a0501f16e7b4e9ad3e58ccd8f538c.1776955622.git.bertrand.marquis@arm.com>
 <CAHUa44ES1LD6wgDic8Y6zm7+AzWFg6x7pSZhY6NkneW3mse+wA@mail.gmail.com>
In-Reply-To:
 <CAHUa44ES1LD6wgDic8Y6zm7+AzWFg6x7pSZhY6NkneW3mse+wA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB9681:EE_|AMS0EPF000001A6:EE_|AS2PR08MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 9869ee5a-420b-4435-27c5-08deaf5f9f35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|11063799003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 8BYfFf9Xgrdex59obP9js59OR1d2N+dhy1RhA6tm/I4mP35a36/wltUSqH7wcDuselRp1fzzfVj7OxIpPQtNPBKUhQiOZifCxHBmafYpdD0gW0dRlmbP84X6ZfILKWVHhtuMnXjwWIoz8wuBr3xNKgud/pbT5/fuLhYUlwMJsyxZdHlcqIYKXMfWsfgOcArFGRZ7MkuXkNvgz85gv/8aGWP2hwU5h7hNH2yZgWEdae+nMfA+STxSS0+CsZCb3Ccoz/VlrFcbtQZeEpujg3YLN4kLSHh/aKAh00BPRshTKhncgWc4Bgt5pOVV5Y6FV2r0XHy/LdHn8BvSlyznvIYmvJlDI9bKFamVahEnozzkntKoCGhZUu2N6e+BqtQnzEn2mhNXZUhvEUn1Xdu6MdlMSNEKPp5Xtr2MBImToJ+rSbwYMiBSfz7mNJcvWpTd62J1JjwycmYai4oz7XK2NipdzMuQznKBjGmFByjfyeUYDB1VQ4MURpWMQuzSadlzji4l4NYpPFjw6gVYhmpO+70dZlJNfsLOWlHXNyDQNNi7Vok7Puwmt8jhHd5OIPTwDRQgXsLi2/5ka7BZDWwPPp94fFumTsqrdD1o1lkIGcNGaH9HFfCDXMxSjAFSuJQNvQlWd4x7LBt1OE8LlrkFpPz4IYHUPVbS+CkvrIpwPf/XGhwkfI+3wUd4lKghFxGc8s4p5jPQqbHt9NgNsnN77x1Sux7uyW4+t4Xc406IZQ+8jsKKN9pc6QmDdB25jqX3XEZb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <63B6969A5BB2974A84C1EC7B2EF99539@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 G5ZLf2D5Lto104LrxFn1q5yfOw62oq0exqObsneojmQsecsMpKfEGM3VKA6kVeymCRc+LvnmAwK9eZUsSADq7rP4FaFmuNxpQw5p+GNWeEGQE2sAk57lDSyH0FJW8hDMkDhq+zSjnWYQKnnBk+jGHESdoBneiQkiGBq5poz2mjt85k2wia0ksic+DYRoulWoOJQCsjHL2sez+Gf4piOIOXvnLW9sDrhCv9CSgJI6Wd2I6x2bYsRKGEj61oHImV0tGOp1BgTftE6mfDGMXE+n1gvJ5PjhZY+1CIInzByVo8wfMkyMHDLBCr3FWJx7P/MV1Kua4qpTYPIdlaZ3jDR7Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9681
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	77bfd6f2-6aa0-4be7-0145-08deaf5f78aa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|14060799003|35042699022|18002099003|22082099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	HJ7OmRogY/JMcL/aSaNpwH/3vC6jHN4DdALf8D65vRvzFfRIz8q+XPbVCPtVvf4XNO01SgUg16AxbeJr0juZwkgS8OEQsdtzx/UNEye9zE/sCYI80z9A971/+yfalQZvg+ce2gVBRD412KAEhvoNtVvAbWmYWIPCyyGEwTgwuIc7Ac4NpDq37jcbDArU9SFP8FMvvSq7qY4SGyE2gsGQC64oikDowzbWd/ek02owlSMNkEC+hL1BgJr6iCcJyXg37jDejXinIsnfbMBDnbnNd9I88RIz3M0UhpXCqi3R9D2SVutZrEfyXueXC0JJQqE8Bv90RVqMpRGavbN+G1VGEtAm5rImXwjIYaTlvjwdKdTtF79mCqGKRPMcM0gYcCJz53mC3Ef+QJsUmP9GpmLVSBEDb9Jhr9XDV0FvNwnf6bcu9evuXbu9U4BQRYGRdZahqVy76dlpvsWg6JmjcZywt8XRj7nq++ixM2tL6kS5G28FcQHLdJ7ppPEsMKgWpLw7v7aW4sI3SIrNa18dHPcMGimPlnoMCQPVV1NB7J3J2vc/NoRLUPSoIbwrX5DidQl3Ppv2GJg1SqCn8DkMd1kxO+V6mIR3UXnGmpb+MDXz3hXyrfGqUgvQ7WsJlb0PquoOhanP8fqTN3Vt8/8x+7ztnTFSje0pxa51FrTmGfhB4FgzEQBMPrTQAjlVGxal3R7q/Jphs9aLYiaSmim1Jp6INMJSVOhoJEewUz4J+QZwXB0=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(14060799003)(35042699022)(18002099003)(22082099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fLSq25uawl0KX6kxd4XlHZtwnP0a+Cyzex9hflnmzYdby5yMgYRQPlRASKOP5wBfZmGyyXLWyNXhubBjvVF5tI1+4i4c6LOPrsKNJyuJuv1sA5gqfGvqGtuI+uKH1DcZuNKLmrjQKwh1vitGW9R5l9SfHyFzp2Ym4QrBRBczPO2+K2V+kzWaeZ7EK0016sfKul5J/afU49BON66wABJS2WX3V6z2H/kz/S1ofuf/T5aJIe72NVpXVc0HssNpSXfBQiyqt/oU9mZBEhqU7ZffMRpfIJ9gXwPjFotK4NDFMgaL2+VehHYufLuB2i1wSQx0j/Aq2WAeksJCJxybvV8nX9lVn79qNmBdRFehBRuqrLxE5CMunSyU4wAwjUhcGQojIcqn6L7D1VYwtQ2i20rgzXyLCiHa64G30H1UbTuWQ0WwumZlOSyKSmdSsesR8jCT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:17:16.0005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9869ee5a-420b-4435-27c5-08deaf5f9f35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8904
X-purgate-ID: tlsNG-bad1c0/1778505444-8A589A53-DCB7CB34/0/0
X-purgate-type: clean
X-purgate-size: 15060
X-Rspamd-Queue-Id: 4202350EB76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiA1IE1heSAyMDI2LCBhdCAxMToyMSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBXZWQsIEFwciAyOSwgMjAyNiBhdCA3OjQ04oCvQU0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gVk0gbm90aWZpY2F0aW9u
IGJpbmRpbmcgYW5kIHBlbmRpbmcgdHJhY2tpbmcgZXhpc3QgZm9yIG5vbi1zZWN1cmUNCj4+IGVu
ZHBvaW50cywgYnV0IEZGQV9OT1RJRklDQVRJT05fU0VUIHN0aWxsIG9ubHkgZm9yd2FyZHMgc2Vj
dXJlDQo+PiBkZXN0aW5hdGlvbnMgdG8gdGhlIFNQTUMuIE5vbi1zZWN1cmUgVk1zIHRoZXJlZm9y
ZSBjYW5ub3QgcmVjZWl2ZQ0KPj4gbm90aWZpY2F0aW9ucyBmcm9tIG90aGVyIFZNcy4gTG9jYWwg
TlBJIGRlbGl2ZXJ5IGFsc28gbmVlZHMgZXhwbGljaXQNCj4+IHJlLWFybSB0cmFja2luZyBzbyBy
ZXBlYXRlZCByYWlzZXMgYXJlIG5vdCBsb3N0IHdoaWxlIHRoZSBpbnRlcnJ1cHQgaXMNCj4+IGFs
cmVhZHkgcGVuZGluZy4NCj4+IA0KPj4gQWRkIGEgbG9jYWwgVk0gbm90aWZpY2F0aW9uIGRlbGl2
ZXJ5IHBhdGggZm9yIG5vbi1zZWN1cmUgZGVzdGluYXRpb25zLg0KPj4gbm90aWZpY2F0aW9uX3Nl
dF92bSgpIHJlc29sdmVzIHRoZSBkZXN0aW5hdGlvbiBlbmRwb2ludCwgdmVyaWZpZXMgdGhhdA0K
Pj4gZXZlcnkgcmVxdWVzdGVkIGJpdCBpcyBib3VuZCB0byB0aGUgc2VuZGVyLCBzZXRzIHRoZSBy
ZWNlaXZlcidzDQo+PiB2bV9wZW5kaW5nIGJpdG1hcCB1bmRlciBub3RpZl9sb2NrLCBhbmQgcmFp
c2VzIGFuIE5QSSBvbmx5IHdoZW4gbG9jYWwNCj4+IHBlbmRpbmcgc3RhdGUgaXMgbm90IGFscmVh
ZHkgYXJtZWQuDQo+PiANCj4+IFRyYWNrIHdoZXRoZXIgYSBsb2NhbCBOUEkgaXMgYWxyZWFkeSBh
cm1lZCB3aXRoIG5vdGlmX2lycV9yYWlzZWQsDQo+PiBjbGVhciB0aGF0IHN0YXRlIG9uY2UgYm90
aCBWTSBhbmQgaHlwZXJ2aXNvciBwZW5kaW5nIGJpdG1hcHMgYXJlDQo+PiBkcmFpbmVkLCBhbmQg
a2VlcCBub3RpZl9sb2NrIGhlbGQgYWNyb3NzIHRoZSBWTSBub3RpZmljYXRpb24gaW5qZWN0aW9u
DQo+PiBhdHRlbXB0LiBJZiBubyBkZXN0aW5hdGlvbiB2Q1BVIGlzIG9ubGluZSwgbGVhdmUgdGhl
IHBlbmRpbmcgYml0cyBzZXQNCj4+IGFuZCBrZWVwIG5vdGlmX2lycV9yYWlzZWQgY2xlYXIgc28g
ZGVsaXZlcnkgY2FuIGJlIHJldHJpZWQgbGF0ZXIuDQo+PiBBbHNvIGV4cG9zZSBmaXJtd2FyZSBu
b3RpZmljYXRpb24gYXZhaWxhYmlsaXR5IHNvIEZGQV9GRUFUVVJFUyBvbmx5DQo+PiBhZHZlcnRp
c2VzIG5vdGlmaWNhdGlvbiBzdXBwb3J0IHdoZW4gaXQgaXMgYWN0dWFsbHkgcHJvdmlkZWQgYnkg
dGhlDQo+PiBmaXJtd2FyZSBvciBieSBDT05GSUdfRkZBX1ZNX1RPX1ZNLg0KPj4gDQo+PiBGdW5j
dGlvbmFsIGltcGFjdDogd2hlbiBDT05GSUdfRkZBX1ZNX1RPX1ZNIGlzIGVuYWJsZWQsIG5vbi1z
ZWN1cmUNCj4+IEZGQV9OT1RJRklDQVRJT05fU0VUIGRlbGl2ZXJzIFZNLXRvLVZNIG5vdGlmaWNh
dGlvbnMgbG9jYWxseSBhbmQga2VlcHMNCj4+IE5QSSBkZWxpdmVyeSByZWxpYWJsZSBhY3Jvc3Mg
cmVwZWF0ZWQgcmFpc2VzLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlz
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IENoYW5nZXMgc2luY2UgdjE6
DQo+PiAtIHNlcmlhbGl6ZSBub3RpZmljYXRpb25fc2V0X3ZtKCkgc3RhdGUgdXBkYXRlcyB3aXRo
IHRoZSBOUEkgYXR0ZW1wdA0KPj4gLSBrZWVwIHBlbmRpbmcgVk0gbm90aWZpY2F0aW9ucyBzZXQg
d2hlbiBsb2NhbCBpbmplY3Rpb24gZmFpbHMNCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9m
ZmEuYyAgICAgICAgIHwgMjQgKysrKysrKystLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90
aWYuYyAgIHwgODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPj4geGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIHwgMTcgKysrKy0tLQ0KPj4gMyBmaWxlcyBjaGFuZ2Vk
LCAxMDcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4gaW5k
ZXggMWZlMzNmMjY0NTRhLi43ZmUwMjEwNDljYmEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vdGVlL2ZmYS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBAQCAtMzks
OCArMzksMTMgQEANCj4+ICAqIG8gRkZBX01TR19TRU5EX0RJUkVDVF9SRVE6DQo+PiAgKiAgIC0g
b25seSBzdXBwb3J0ZWQgZnJvbSBhIFZNIHRvIGFuIFNQDQo+PiAgKiBvIEZGQV9OT1RJRklDQVRJ
T05fKjoNCj4+ICsgKiAgIC0gb25seSBzdXBwb3J0ZWQgd2hlbiBmaXJtd2FyZSBub3RpZmljYXRp
b25zIGFyZSBlbmFibGVkIG9yIFZNLXRvLVZNDQo+PiArICogICAgIHN1cHBvcnQgaXMgYnVpbHQg
aW4NCj4+ICAqICAgLSBvbmx5IHN1cHBvcnRzIGdsb2JhbCBub3RpZmljYXRpb25zLCB0aGF0IGlz
LCBwZXIgdkNQVSBub3RpZmljYXRpb25zDQo+PiAtICogICAgIGFyZSBub3Qgc3VwcG9ydGVkDQo+
PiArICogICAgIGFyZSBub3Qgc3VwcG9ydGVkIGFuZCBzZWN1cmUgcGVyLXZDUFUgbm90aWZpY2F0
aW9uIGluZm9ybWF0aW9uIGlzDQo+PiArICogICAgIG5vdCBmb3J3YXJkZWQNCj4+ICsgKiAgIC0g
dGhlIHNvdXJjZSBlbmRwb2ludCBJRCByZXBvcnRlZCBmb3IgYSBub3RpZmljYXRpb24gbWF5IG5v
IGxvbmdlcg0KPj4gKyAqICAgICBleGlzdCBieSB0aGUgdGltZSB0aGUgcmVjZWl2ZXIgY29uc3Vt
ZXMgaXQNCj4+ICAqICAgLSBkb2Vzbid0IHN1cHBvcnQgc2lnbmFsbGluZyB0aGUgc2Vjb25kYXJ5
IHNjaGVkdWxlciBvZiBwZW5kaW5nDQo+PiAgKiAgICAgbm90aWZpY2F0aW9uIGZvciBzZWN1cmUg
cGFydGl0aW9ucw0KPj4gICogICAtIGRvZXNuJ3Qgc3VwcG9ydCBub3RpZmljYXRpb25zIGZvciBY
ZW4gaXRzZWxmDQo+PiBAQCAtMjQ1LDYgKzI1MCw4IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9mZWF0
dXJlcyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICB1aW50MzJfdCBhMSA9IGdl
dF91c2VyX3JlZyhyZWdzLCAxKTsNCj4+ICAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+
ZG9tYWluOw0KPj4gICAgIHN0cnVjdCBmZmFfY3R4ICpjdHggPSBkLT5hcmNoLnRlZTsNCj4+ICsg
ICAgYm9vbCBub3RpZl9zdXBwb3J0ZWQgPSBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0p
IHx8DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgZmZhX25vdGlmX2Z3X2VuYWJsZWQo
KTsNCj4+IA0KPj4gICAgIC8qDQo+PiAgICAgICogRkZBX0ZFQVRVUkVTIGRlZmluZXMgdzIgYXMg
aW5wdXQgcHJvcGVydGllcyBvbmx5IGZvciBzcGVjaWZpYw0KPj4gQEAgLTM0MywxMCArMzUwLDE2
IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9mZWF0dXJlcyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykNCj4+IA0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9GRUFUVVJFX05PVElG
X1BFTkRfSU5UUjoNCj4+IC0gICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIEdVRVNU
X0ZGQV9OT1RJRl9QRU5EX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgaWYgKCBub3RpZl9zdXBw
b3J0ZWQgKQ0KPj4gKyAgICAgICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIEdVRVNU
X0ZGQV9OT1RJRl9QRU5EX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgZWxzZQ0KPj4gKyAgICAg
ICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdzLCBGRkFfUkVUX05PVF9TVVBQT1JURUQpOw0K
Pj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9GRUFUVVJFX1NDSEVEVUxFX1JFQ1Zf
SU5UUjoNCj4+IC0gICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIEdVRVNUX0ZGQV9T
Q0hFRFVMRV9SRUNWX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgaWYgKCBub3RpZl9zdXBwb3J0
ZWQgKQ0KPj4gKyAgICAgICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIEdVRVNUX0ZG
QV9TQ0hFRFVMRV9SRUNWX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgZWxzZQ0KPj4gKyAgICAg
ICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdzLCBGRkFfUkVUX05PVF9TVVBQT1JURUQpOw0K
Pj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9QQVJUSVRJT05fSU5GT19HRVRfUkVH
UzoNCj4+ICAgICAgICAgaWYgKCBBQ0NFU1NfT05DRShjdHgtPmd1ZXN0X3ZlcnMpID49IEZGQV9W
RVJTSU9OXzFfMiApDQo+PiBAQCAtMzYxLDcgKzM3NCwxMCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVf
ZmVhdHVyZXMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgY2FzZSBGRkFfTk9U
SUZJQ0FUSU9OX1NFVDoNCj4+ICAgICBjYXNlIEZGQV9OT1RJRklDQVRJT05fSU5GT19HRVRfMzI6
DQo+PiAgICAgY2FzZSBGRkFfTk9USUZJQ0FUSU9OX0lORk9fR0VUXzY0Og0KPj4gLSAgICAgICAg
ZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVncywgMCwgMCk7DQo+PiArICAgICAgICBpZiAoIG5vdGlm
X3N1cHBvcnRlZCApDQo+PiArICAgICAgICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVncywg
MCwgMCk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgZmZhX3NldF9yZWdzX2Vy
cm9yKHJlZ3MsIEZGQV9SRVRfTk9UX1NVUFBPUlRFRCk7DQo+PiAgICAgICAgIGJyZWFrOw0KPj4g
ICAgIGRlZmF1bHQ6DQo+PiAgICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdzLCBGRkFfUkVU
X05PVF9TVVBQT1JURUQpOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25v
dGlmLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiBpbmRleCBhODQxYzhmOGQ3
NDcuLmIyOWQ5NDhhNzExMCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25v
dGlmLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+IEBAIC0yMSw2
ICsyMSwxMSBAQCBzdGF0aWMgYm9vbCBfX3JvX2FmdGVyX2luaXQgZndfbm90aWZfZW5hYmxlZDsN
Cj4+IHN0YXRpYyB1bnNpZ25lZCBpbnQgX19yb19hZnRlcl9pbml0IG5vdGlmX3NyaV9pcnE7DQo+
PiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKG5vdGlmX2luZm9fbG9jayk7DQo+PiANCj4+ICtib29s
IGZmYV9ub3RpZl9md19lbmFibGVkKHZvaWQpDQo+PiArew0KPj4gKyAgICByZXR1cm4gZndfbm90
aWZfZW5hYmxlZDsNCj4+ICt9DQo+PiArDQo+PiBzdGF0aWMgYm9vbCBpbmplY3Rfbm90aWZfcGVu
ZGluZyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gew0KPj4gICAgIHN0cnVjdCB2Y3B1ICp2Ow0KPj4g
QEAgLTEwNyw2ICsxMTIsNTUgQEAgb3V0X3VubG9jazoNCj4+ICAgICByZXR1cm4gcmV0Ow0KPj4g
fQ0KPj4gDQo+PiArLyoNCj4+ICsgKiBEZWxpdmVyIGEgVk0tdG8tVk0gbm90aWZpY2F0aW9uLiBj
dHgtPm5vdGlmLm5vdGlmX2xvY2sgcHJvdGVjdHMNCj4+ICsgKiB2bV9iaW5kL3ZtX3BlbmRpbmcg
c28gY2FsbGVycyBtdXN0IG5vdCBob2xkIGl0IGFscmVhZHkuDQo+PiArICovDQo+PiArc3RhdGlj
IGludDMyX3Qgbm90aWZpY2F0aW9uX3NldF92bSh1aW50MTZfdCBkc3RfaWQsIHVpbnQxNl90IHNy
Y19pZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGZs
YWdzLCB1aW50NjRfdCBiaXRtYXApDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkc3Rf
ZDsNCj4+ICsgICAgc3RydWN0IGZmYV9jdHggKmRzdF9jdHg7DQo+PiArICAgIHVuc2lnbmVkIGlu
dCBpZDsNCj4+ICsgICAgaW50MzJfdCByZXQ7DQo+PiArDQo+PiArICAgIGlmICggZmxhZ3MgKQ0K
Pj4gKyAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gKw0KPj4g
KyAgICByZXQgPSBmZmFfZW5kcG9pbnRfZG9tYWluX2xvb2t1cChkc3RfaWQsICZkc3RfZCwgJmRz
dF9jdHgpOw0KPj4gKyAgICBpZiAoIHJldCApDQo+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4g
Kw0KPj4gKyAgICByZXQgPSBGRkFfUkVUX09LOw0KPj4gKw0KPj4gKyAgICBzcGluX2xvY2soJmRz
dF9jdHgtPm5vdGlmLm5vdGlmX2xvY2spOw0KPj4gKw0KPj4gKyAgICBmb3IgKCBpZCA9IDA7IGlk
IDwgRkZBX05VTV9WTV9OT1RJRjsgaWQrKyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICgg
IShiaXRtYXAgJiBCSVQoaWQsIFVMTCkpICkNCj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+
ICsNCj4+ICsgICAgICAgIGlmICggZHN0X2N0eC0+bm90aWYudm1fYmluZFtpZF0gIT0gc3JjX2lk
ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICByZXQgPSBGRkFfUkVUX0RFTklFRDsN
Cj4+ICsgICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7DQo+PiArICAgICAgICB9DQo+PiArICAg
IH0NCj4+ICsNCj4+ICsgICAgZHN0X2N0eC0+bm90aWYudm1fcGVuZGluZyB8PSBiaXRtYXA7DQo+
PiArICAgIGlmICggIWRzdF9jdHgtPm5vdGlmLm5vdGlmX2lycV9yYWlzZWQgJiYNCj4+ICsgICAg
ICAgICAoZHN0X2N0eC0+bm90aWYudm1fcGVuZGluZyB8fCBkc3RfY3R4LT5ub3RpZi5oeXBfcGVu
ZGluZykgJiYNCj4+ICsgICAgICAgICBpbmplY3Rfbm90aWZfcGVuZGluZyhkc3RfZCkgKQ0KPj4g
KyAgICAgICAgZHN0X2N0eC0+bm90aWYubm90aWZfaXJxX3JhaXNlZCA9IHRydWU7DQo+PiArDQo+
PiArb3V0X3VubG9jazoNCj4+ICsgICAgc3Bpbl91bmxvY2soJmRzdF9jdHgtPm5vdGlmLm5vdGlm
X2xvY2spOw0KPj4gKw0KPj4gKyAgICByY3VfdW5sb2NrX2RvbWFpbihkc3RfZCk7DQo+PiArDQo+
PiArICAgIHJldHVybiByZXQ7DQo+PiArfQ0KPj4gKw0KPj4gaW50MzJfdCBmZmFfaGFuZGxlX25v
dGlmaWNhdGlvbl9iaW5kKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gew0KPj4gICAg
IHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47DQo+PiBAQCAtMjg4LDYgKzM0Miw4
IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKQ0KPj4gDQo+PiAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0p
ICkNCj4+ICAgICB7DQo+PiArICAgICAgICBib29sIHBlbmRpbmc7DQo+PiArDQo+PiAgICAgICAg
IHNwaW5fbG9jaygmY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+IA0KPj4gICAgICAgICBpZiAo
IChmbGFncyAmIEZGQV9OT1RJRl9GTEFHX0JJVE1BUF9IWVApICYmIGN0eC0+bm90aWYuaHlwX3Bl
bmRpbmcgKQ0KPj4gQEAgLTI5OCw2ICszNTQsMTggQEAgdm9pZCBmZmFfaGFuZGxlX25vdGlmaWNh
dGlvbl9nZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgICAgICAgICAg
Y3R4LT5ub3RpZi5ub3RpZl9pcnFfcmFpc2VkID0gZmFsc2U7DQo+PiAgICAgICAgIH0NCj4+IA0K
Pj4gKyAgICAgICAgaWYgKCAoZmxhZ3MgJiBGRkFfTk9USUZfRkxBR19CSVRNQVBfVk0pICYmIGN0
eC0+bm90aWYudm1fcGVuZGluZyApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgdzQg
PSAodWludDMyX3QpKGN0eC0+bm90aWYudm1fcGVuZGluZyAmIEdFTk1BU0soMzEsIDApKTsNCj4+
ICsgICAgICAgICAgICB3NSA9ICh1aW50MzJfdCkoKGN0eC0+bm90aWYudm1fcGVuZGluZyA+PiAz
MikgJiBHRU5NQVNLKDMxLCAwKSk7DQo+PiArICAgICAgICAgICAgY3R4LT5ub3RpZi52bV9wZW5k
aW5nID0gMDsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIHBlbmRpbmcgPSAoY3R4
LT5ub3RpZi5oeXBfcGVuZGluZyAhPSAwKSB8fA0KPj4gKyAgICAgICAgICAgICAgICAgIChjdHgt
Pm5vdGlmLnZtX3BlbmRpbmcgIT0gMCk7DQo+PiArICAgICAgICBpZiAoICFwZW5kaW5nICkNCj4+
ICsgICAgICAgICAgICBjdHgtPm5vdGlmLm5vdGlmX2lycV9yYWlzZWQgPSBmYWxzZTsNCj4gDQo+
IFRoaXMgc2VlbXMgdG8gdGFrZSBjYXJlIG9mIGNsZWFyaW5nIG5vdGlmX2lycV9yYWlzZWQgZm9y
IGFsbCBjYXNlcy4gRG8NCj4gd2Ugc3RpbGwgbmVlZCB0aGUgb25lIGp1c3QgYWJvdmUgdGhpcyBi
bG9jayAoY29waWVkIGhlcmUpOg0KPiAgICAgICAgICAgIGlmICggIWN0eC0+bm90aWYudm1fcGVu
ZGluZyApDQo+ICAgICAgICAgICAgICAgIGN0eC0+bm90aWYubm90aWZfaXJxX3JhaXNlZCA9IGZh
bHNlOw0KPiA/DQoNClllcyB5b3UgYXJlIHJpZ2h0LCB0aGlzIGlzIG5vdyByZWR1bmRhbnQuDQpJ
IHdpbGwgZHJvcCBpdCBpbiB2My4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMs
DQo+IEplbnMNCj4gDQo+PiArDQo+PiAgICAgICAgIHNwaW5fdW5sb2NrKCZjdHgtPm5vdGlmLm5v
dGlmX2xvY2spOw0KPj4gICAgIH0NCj4+IA0KPj4gQEAgLTMyMyw5ICszOTEsMTcgQEAgaW50MzJf
dCBmZmFfaGFuZGxlX25vdGlmaWNhdGlvbl9zZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Mp
DQo+PiAgICAgaWYgKCBmbGFncyApDQo+PiAgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFMSURf
UEFSQU1FVEVSUzsNCj4+IA0KPj4gLSAgICBpZiAoIEZGQV9JRF9JU19TRUNVUkUoZGVzdF9pZCkg
JiYgZndfbm90aWZfZW5hYmxlZCApDQo+PiAtICAgICAgICByZXR1cm4gZmZhX3NpbXBsZV9jYWxs
KEZGQV9OT1RJRklDQVRJT05fU0VULCBzcmNfZHN0LCBmbGFncywgYml0bWFwX2xvLA0KPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaXRtYXBfaGkpOw0KPj4gKyAgICBpZiAoIEZG
QV9JRF9JU19TRUNVUkUoZGVzdF9pZCkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIGZ3
X25vdGlmX2VuYWJsZWQgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiBmZmFfc2ltcGxlX2NhbGwo
RkZBX05PVElGSUNBVElPTl9TRVQsIHNyY19kc3QsIGZsYWdzLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYml0bWFwX2xvLCBiaXRtYXBfaGkpOw0KPj4gKyAgICB9DQo+
PiArICAgIGVsc2UgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgcmV0dXJuIG5vdGlmaWNhdGlvbl9zZXRfdm0oZGVzdF9pZCwgY2Fs
bGVyX2lkLCBmbGFncywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgo
dWludDY0X3QpYml0bWFwX2hpIDw8IDMyKSB8IGJpdG1hcF9sbyk7DQo+PiArICAgIH0NCj4+IA0K
Pj4gICAgIHJldHVybiBGRkFfUkVUX05PVF9TVVBQT1JURUQ7DQo+PiB9DQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFf
cHJpdmF0ZS5oDQo+PiBpbmRleCA3OGEwYTk4MTVkNTYuLjkyM2EwNzFhOWQ3YyAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gKysrIGIveGVuL2FyY2gv
YXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBAQCAtMzQwLDIwICszNDAsMTggQEAgc3RydWN0IGZm
YV9jdHhfbm90aWYgew0KPj4gICAgIHVpbnQ2NF90IHZtX3BlbmRpbmc7DQo+PiANCj4+ICAgICAv
Kg0KPj4gLSAgICAgKiBTb3VyY2UgZW5kcG9pbnQgYm91bmQgdG8gZWFjaCBWTSBub3RpZmljYXRp
b24gSUQgKDAgbWVhbnMgdW5ib3VuZCkuDQo+PiArICAgICAqIFRyYWNrcyB3aGV0aGVyIGFuIE5Q
SSBoYXMgYmVlbiByYWlzZWQgZm9yIGxvY2FsIHBlbmRpbmcgbm90aWZpY2F0aW9ucy4NCj4+ICsg
ICAgICogUHJvdGVjdGVkIGJ5IG5vdGlmX2xvY2suDQo+PiAgICAgICovDQo+PiAtICAgIHVpbnQx
Nl90IHZtX2JpbmRbRkZBX05VTV9WTV9OT1RJRl07DQo+PiArICAgIGJvb2wgbm90aWZfaXJxX3Jh
aXNlZDsNCj4+IA0KPj4gICAgIC8qDQo+PiAtICAgICAqIExvY2sgcHJvdGVjdGluZyB0aGUgaHlw
ZXJ2aXNvci1tYW5hZ2VkIG5vdGlmaWNhdGlvbiBzdGF0ZS4NCj4+ICsgICAgICogU291cmNlIGVu
ZHBvaW50IGJvdW5kIHRvIGVhY2ggVk0gbm90aWZpY2F0aW9uIElEICgwIG1lYW5zIHVuYm91bmQp
Lg0KPj4gICAgICAqLw0KPj4gLSAgICBzcGlubG9ja190IG5vdGlmX2xvY2s7DQo+PiArICAgIHVp
bnQxNl90IHZtX2JpbmRbRkZBX05VTV9WTV9OT1RJRl07DQo+PiANCj4+IC0gICAgLyoNCj4+IC0g
ICAgICogVHJhY2tzIHdoZXRoZXIgYSBsb2NhbCBub3RpZmljYXRpb24gcGVuZGluZyBpbnRlcnJ1
cHQgd2FzIHJhaXNlZC4NCj4+IC0gICAgICogUHJvdGVjdGVkIGJ5IG5vdGlmX2xvY2suDQo+PiAt
ICAgICAqLw0KPj4gLSAgICBib29sIG5vdGlmX2lycV9yYWlzZWQ7DQo+PiArICAgIC8qIExvY2sg
cHJvdGVjdGluZyBsb2NhbCBub3RpZmljYXRpb24gc3RhdGUuICovDQo+PiArICAgIHNwaW5sb2Nr
X3Qgbm90aWZfbG9jazsNCj4+IA0KPj4gICAgIC8qDQo+PiAgICAgICogQml0bWFwIG9mIHBlbmRp
bmcgaHlwZXJ2aXNvciBub3RpZmljYXRpb25zIChmb3IgSFlQIGJpdG1hcCBxdWVyaWVzKS4NCj4+
IEBAIC00OTUsNiArNDkzLDcgQEAgdm9pZCBmZmFfbm90aWZfaW5pdCh2b2lkKTsNCj4+IHZvaWQg
ZmZhX25vdGlmX2luaXRfaW50ZXJydXB0KHZvaWQpOw0KPj4gaW50IGZmYV9ub3RpZl9kb21haW5f
aW5pdChzdHJ1Y3QgZG9tYWluICpkKTsNCj4+IHZvaWQgZmZhX25vdGlmX2RvbWFpbl9kZXN0cm95
KHN0cnVjdCBkb21haW4gKmQpOw0KPj4gK2Jvb2wgZmZhX25vdGlmX2Z3X2VuYWJsZWQodm9pZCk7
DQo+PiANCj4+IGludDMyX3QgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fYmluZChzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncyk7DQo+PiBpbnQzMl90IGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX3Vu
YmluZChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk7DQo+PiAtLQ0KPj4gMi41My4wDQo+PiAN
Cg0K

