Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALYdBFH53GnXYgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:10:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D83ED164
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281168.1564198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCHzE-0002MN-1p; Mon, 13 Apr 2026 14:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281168.1564198; Mon, 13 Apr 2026 14:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCHzD-0002Km-Ts; Mon, 13 Apr 2026 14:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1281168;
 Mon, 13 Apr 2026 14:09:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCHzC-0002KD-My
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 14:09:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCHzC-002cUY-31
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:09:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcf934-5cb7-0a2a0a5109dd-0a2a45038396-14
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:09:57 +0200
Received: from [40.107.130.46]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcf935-02b3-0a2a45030019-286b822e898e-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:09:57 +0200
Received: from CWLP265CA0491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::23)
 by VE1PR08MB5728.eurprd08.prod.outlook.com (2603:10a6:800:1a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:09:51 +0000
Received: from AMS1EPF00000090.eurprd05.prod.outlook.com
 (2603:10a6:400:18a:cafe::3b) by CWLP265CA0491.outlook.office365.com
 (2603:10a6:400:18a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:09:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000090.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 14:09:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VI1PR08MB10273.eurprd08.prod.outlook.com (2603:10a6:800:1be::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 13 Apr
 2026 14:08:43 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 14:08:43 +0000
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
 b=qposFM5KButqIHk3UZcHz56rIDo1oE8U1GMEheNs/05sz3//1e7ONfF4sWxCS+06uITnfmT8NEoxmMptY3wwlYYKsuWKq0DzgP0APn/VERGwBIAkvKuWveSNInyzTv1HrlDXF1nfIzIRWpFqIvQPbBWZfvuCmW0hw9earFUH1AjthjA3Q+K5WAs1/kgU2f3Kj++ZASqEo3sMWCCx3wx2ZMdJW8ZEeKONoN2a52NRbIR33mzeZfXdDrfGw5yppZRfQOWk3Hez9tir7mCNIEPa57ZxL/DeMZsxGQDbXr/2SWS3F1zdlNKEG48NZlFRN9s+wctN9QK1DpYvsCI7pleLxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz9UpjxAqS+7cm/kak0fgHeEiA61zv4+UV3DbjBj2JA=;
 b=QSoLGjOqZdhVkSFdFrbgmXu9hE33Wpx8JFeKhauIipWssiUnhZvGOSgHCqXcYB/9UPCBNfes32oxNIhS8ytmoU6B17/w496jFYWkbi3TA/bH2qXMyG4Vsx1rOqabe0zVbgqpun3ziifGy6qI+iAwoVNaJ6zGkya3i0WQd84bntyry5pg99nT28qHLSJmYyLBKzBWWiuRfGLsq999KyWxKT5V505SZgJzRWpGLs0RvnefxeQ+TIFVeiieqzwmCWWYaF/81lUqXSPCqBqq2RzfiB+UKXSqKP2bWzcmeJvu7g00JDhnhCbxGzJ4hiqAvuI3gHoPjtYv5QMHFT9eGI3Izg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz9UpjxAqS+7cm/kak0fgHeEiA61zv4+UV3DbjBj2JA=;
 b=kdVoPUULoP+pB0k8i8sXtIbzXP40uCm5rNeV1+N1LtINSITiQbvlOqPKZhqJhqZwLciflv9x/wi1yOqqXAC336hCDB/C2QiF9ZMdc/1u9UHuSRAwljkdMMQ2lZp2mejfbTBv7wf0xe/ON7lf4cFBbL3AjNO8NnFRo+c6LKf9NC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4EVDDE9qx75xFX397Ppf/syiLOdWFgtFZMLkEtperpBILjK+/S5eBIr6s/e8LO0/edR60Z8mXVveSuqhAhrM6/nqSfKixopoLZvHfnqOcsnmDsH1UqX2BsxipbrHMXPi5KZBRFIpPxYkzUfuvnNQbRZyXZSYgdU4YGeDBG4PS2lTyx2Lts7PEkz9RbPiq4BiKYMIIpLs2OP9ainGYnsFJwMQW39tJdUmWOQwhMMW80AVKVO1RNeWmCjz4TvNbamKojH2eHuOD6R5kqGuVZevfhZelh1kW8lA4sBXwz2XukaCe4q8hfZd1t3nNwsCjAd1en4gZfp5nJjEdrQv3G6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz9UpjxAqS+7cm/kak0fgHeEiA61zv4+UV3DbjBj2JA=;
 b=G5Et4hkIqq+4+ku3/3Cb6zYS7UICCYWYvssjGKdV7GU+qpwJD2SgAyeV0dQx+E5Sl9ztFmaIRRl/8uY8+mrc/IxMVFCkV/k2NgKXp3qdnMoQXEKFWIjJfcc1PdkmASa5JzVTB5BIorIj0V+Y6+PX8UlL8kfZ8dRDZGAFjvtvUPiMDt/ATu+WHTwL8UFdre9EopzENm6QtTpJ7OaHAM3uxhq3CxHsvW4GgpQ4IovIQ06gzofPG1NJz+9VfXQaYBEf5Bto4Lgp9qYViIRlJpJnwsIMW7RD/zK/n+ciIWuc/AsQJGJE3W8XfLW2AJlPCq32+a/bpkPhyDg+9Te+DqhZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz9UpjxAqS+7cm/kak0fgHeEiA61zv4+UV3DbjBj2JA=;
 b=kdVoPUULoP+pB0k8i8sXtIbzXP40uCm5rNeV1+N1LtINSITiQbvlOqPKZhqJhqZwLciflv9x/wi1yOqqXAC336hCDB/C2QiF9ZMdc/1u9UHuSRAwljkdMMQ2lZp2mejfbTBv7wf0xe/ON7lf4cFBbL3AjNO8NnFRo+c6LKf9NC8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 17/23] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Topic: [PATCH v3 17/23] xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
Thread-Index: AQHcy08JvVB1cGPAx0GVSpi1e5g4zw==
Date: Mon, 13 Apr 2026 14:08:43 +0000
Message-ID: <6045AD03-C831-4A3C-82DC-34A38A1EF716@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <f06cb7dce5ae69de77164cef365ba659a077348f.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <f06cb7dce5ae69de77164cef365ba659a077348f.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VI1PR08MB10273:EE_|AMS1EPF00000090:EE_|VE1PR08MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bcdad2-a594-4989-1398-08de99665352
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 gxi+4gCn99gpb1JtHNvBowPzo9UNFWg/DRChRGow6Fhpnx9pU3vha7yisT+yrBATq7ZdjN5/CVuPj1+BK3+j8JIe+wj2F1sW3X0HF7r0ET9PVvk8OH82A5LtWvj4q0jNWXtYgKZ2qWiuJVVXCDu12+f7FZtiU50Any54JBuJh+fOaynU4UUXfAszLOqwZbU6Z3OvrYOztaPQlMuHe2ygoealQ973WkVgvrcv4J18Tei2y1B5UT/AykaSjlLk+IziBLEfvHbRJ1NGETYshNLK6QedIGmeFf/XgfxEsui1DyCrE6CMjtiNvFtGEp/gI63qBOiMtubuMUsk5ipMCXqXHADJi1aa3S41EadalTj/CCsicZpm3vObPzBX5r20tQTQiRF0kv8eihRrxx/buFX4T0moIsfVg+vH2uXBvRvZnW7UHt5bMhmPugbTaHH4s00fYYlO3HCnp6DloazNhHH1+xs6qtdgPhoYF1H+TcsGBDaE9D2r60snK6cax/SnG5ccGN5V5WnwWuBh4NzYmuRnez7CVsPpKpGMIg9rA+oTJPM0QHbHLDEkZk1zGyoWgtCjIhT7IG4ZsA6eTWFtO1A6pNymX0K/ffDRQ4JmZcnf3tc7xc/Kvg0vQvnfrjcLTJPlHPjAqWu9Ji5oEV2vj+RUmG+zixpoy1IZ0NVK9IwPwsDK+wbtaBHk3/CmLfep7cXrU18Lk819KlUAe1cyRKX6fRWAbjU3mSM1y9FNXrnDpQ+8peD+dgOxm6KdWnUovf6L
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A326CE1761DC70428E35E68B56B60530@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nO4La22IxBUmt5WSCBU9P3J8mmTgVlW8YQWpap65khegB3M1OIiPJg/Idv1bUSh+4VCRCYS2hy/ZVOBsKWcgPK+fUtUYAU7+Tt/0oedzPELZI/YwXuJhT2zJsplYW/9Ahuhz/DRAGLSZY5eYb6U0XvJdMkHAIlJQDSfq86LyjUjNAg2c2inCPvGx52tD0BX2bGPNVvy550voGniyVexiNt1EF2cUfYLg8JX3i6fMg2kO/N5aWu6QPTzptQzYh7HjG1zY+1s8tdB2V9ZD0bbJGb5mLGtPjATH874vyHnTnZXNI7ahJG255m3h05reqpoVwbdo2ywB1A0VOpS2wDysxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10273
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc5391b7-9940-4c52-be16-08de99662bf1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700016|82310400026|35042699022|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2+NoXp5KhI1MCwL1o+EnP+uJ5Sw59czjTTBzK3pD6hw2cFja2sXW3ybyoI3s3DHbIcrI6nvUeKqoSoKMONquay85Ns7L/CaR3jwj/EHAjP+V7TLxySx+ofbtMGiAuDLF6GYPcMuhRmg2Isjhz7QPzvXOpXrcAn3yR6rwry7xab7WTvUxyQlaeDVL3gdsEfo5MKtNkTNta/7u44M3BVmktQ3ouUC2nEqdedCH+FQXzbVZIalVrV0UnZQSXxxeh1bUxq8WHLpaj+xaCpYaA0AMph/VzXWUVVpn3CpsImcUPb6x6njBFr5XiHwBh4WFNe41XugqICpHrYjAwwPQrqUMW4SF12BL0nt6FxOZz/M++gvLd0q8tlJxbtMVcr4JKFVZRt1RLwrphKB9Sh9wKejRIguSDF4deq5ix+ebOXX4WMcCOxVOiRXX/1/KffK70Si34KD9XOjtvCOcnNMBMq658zO7yDrFBVYKbQEnuOo4lmkumVIIMlPv3+Tq6X27lG6eHZuhT2NshlMBzRzrHrFXkXCpd6oUv04v17jzgJbF08W3OGNK798ySW45rKJ9Hhqkjgk/oZjs75hebOZBkAmB8hA1t/DiXtzFJsrvZEK8Yph/1d+A/eSWnIP2J/Q7Xaa2yhBZ1U2Hjne2lJxaNDIZF+oSZfxPDbVfGczbW8iqTDPiAEORO6qcJei4AeURegtCzE+wBvDZL2YiAeYJcFoTl0L4C6zj2ngazqJfN2A5cr4=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700016)(82310400026)(35042699022)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tN3mk1X+o4Vy/ToXsAseqjUMHsvu1H85OYVOmlM6KTMaszytSu80SqGeFxSYQgNfuGAZMLOm9xyijkrUajPRPGjjE2D450LJjBjyBjHLKSMA3X+OoW45Qb2yM5Y6CEbO6wXkZS5TA3Sk+vJam7XyQBtL+FytP4fYm6OuYXTKK4lRhYp9gPd4yczonk+fenhEmRmVwQ1lfNByrQJtZnFBeilnFih9cx5ydO+Oqyza4DaY9wGejLk3h/TiB9YMgCelh+bAgmtBZ8HLAgJmhrMpl4e5Jyq+2mEEAehwn71x5QhKWqbNZ6jSBxJjWVlx0GPZX6fCc2TF9CrOwBvzNDDSF59h8RMbwBNqPu1iggQEJ/wZObG/+qFrvQuPht9CM6oZff3qQFaO7QOCKCMOKxEnFWkJe4OQb5ahULE3Mzgj4AoJBwyehg+MW2RlWm4DE0dR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:09:49.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bcdad2-a594-4989-1398-08de99665352
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5728
X-purgate-ID: tlsNG-33051d/1776089397-41B15C9A-9447CEF1/0/0
X-purgate-type: clean
X-purgate-size: 9296
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,xen.org:url,epam.com:email]
X-Rspamd-Queue-Id: D90D83ED164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDAyOjUyLCBNaWxhbiBEam9raWMgPG1p
bGFuX2Rqb2tpY0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4NCj4gDQo+IEFsbG9jIGFuZCByZXNlcnZlIHZpcnEgZm9yIGV2ZW50
IHF1ZXVlIGFuZCBnbG9iYWwgZXJyb3IgdG8gc2VuZCBldmVudCB0bw0KPiBndWVzdHMuIEFsc28g
TW9kaWZ5IHRoZSBsaWJ4bCB0byBhY2NvbWFkYXRlIHRoZSBuZXcgZGVmaW5lIHZpcnEuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQo+IC0tLQ0K
PiB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jICAgICAgICAgICB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrKy0tDQo+IHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jICAgICAgICAg
IHwgMTcgKysrKysrKysrKysrKysrKw0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNt
bXUtdjMuYyB8IDEzICsrKysrKysrKysrKw0KPiAzIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4gaW5kZXggZWI4
Nzk0NzNmNS4uODAzYzNiMzliNyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4
bF9hcm0uYw0KPiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+IEBAIC04Niw4
ICs4Niw4IEBAIGludCBsaWJ4bF9fYXJjaF9kb21haW5fcHJlcGFyZV9jb25maWcobGlieGxfX2dj
ICpnYywNCj4gew0KPiAgICAgdWludDMyX3QgbnJfc3BpcyA9IDAsIGNmZ19ucl9zcGlzID0gZF9j
b25maWctPmJfaW5mby5hcmNoX2FybS5ucl9zcGlzOw0KPiAgICAgdW5zaWduZWQgaW50IGk7DQo+
IC0gICAgdWludDMyX3QgdnVhcnRfaXJxLCB2aXJ0aW9faXJxID0gMDsNCj4gLSAgICBib29sIHZ1
YXJ0X2VuYWJsZWQgPSBmYWxzZSwgdmlydGlvX2VuYWJsZWQgPSBmYWxzZTsNCj4gKyAgICB1aW50
MzJfdCB2dWFydF9pcnEsIHZpcnRpb19pcnEgPSAwLCB2c21tdV9pcnEgPSAwOw0KPiArICAgIGJv
b2wgdnVhcnRfZW5hYmxlZCA9IGZhbHNlLCB2aXJ0aW9fZW5hYmxlZCA9IGZhbHNlLCB2c21tdV9l
bmFibGVkID0gZmFsc2U7DQo+ICAgICB1aW50NjRfdCB2aXJ0aW9fbW1pb19iYXNlID0gR1VFU1Rf
VklSVElPX01NSU9fQkFTRTsNCj4gICAgIHVpbnQzMl90IHZpcnRpb19tbWlvX2lycSA9IEdVRVNU
X1ZJUlRJT19NTUlPX1NQSV9GSVJTVDsNCj4gICAgIGludCByYzsNCj4gQEAgLTEwMiw2ICsxMDIs
MTYgQEAgaW50IGxpYnhsX19hcmNoX2RvbWFpbl9wcmVwYXJlX2NvbmZpZyhsaWJ4bF9fZ2MgKmdj
LA0KPiAgICAgICAgIHZ1YXJ0X2VuYWJsZWQgPSB0cnVlOw0KPiAgICAgfQ0KPiANCj4gKyAgICAv
Kg0KPiArICAgICAqIElmIHNtbXV2MyB2aW9tbXUgaXMgZW5hYmxlZCB0aGVuIGluY3JlbWVudCB0
aGUgbnJfc3BpcyB0byBhbGxvdyBhbGxvY2F0aW9uDQo+ICsgICAgICogb2YgU1BJIFZJUlEgZm9y
IFZTTU1VLg0KPiArICAgICAqLw0KPiArICAgIGlmIChkX2NvbmZpZy0+Yl9pbmZvLmFyY2hfYXJt
LnZpb21tdV90eXBlID09IExJQlhMX1ZJT01NVV9UWVBFX1NNTVVWMykgew0KPiArICAgICAgICBu
cl9zcGlzICs9IChHVUVTVF9WU01NVV9TUEkgLSAzMikgKyAxOw0KPiArICAgICAgICB2c21tdV9p
cnEgPSBHVUVTVF9WU01NVV9TUEk7DQo+ICsgICAgICAgIHZzbW11X2VuYWJsZWQgPSB0cnVlOw0K
PiArICAgIH0NCg0KTm93IHdlIHdvdWxkIGluZmxhdGUgdG9vIG11Y2ggbnJfc3BpcyBpZiBhbHNv
IHZQTDAxMSBpcyBwcmVzZW50LCBJIHRoaW5rIHRoaXMgY29tbWl0IHNob3VsZA0KbW9kaWZ5IHRo
YXQgcGFydCBhbmQgdGhpcyBwYXJ0IGluIHRoaXMgd2F5Og0KDQppZiAoZF9jb25maWctPmJfaW5m
by5hcmNoX2FybS52dWFydCA9PSBMSUJYTF9WVUFSVF9UWVBFX1NCU0FfVUFSVCkgew0KICAgIG5y
X3NwaXMgPSBtYXgobnJfc3BpcywgR1VFU1RfVlBMMDExX1NQSSAtIDMyICsgMSk7DQogICAgdnVh
cnRfaXJxID0gR1VFU1RfVlBMMDExX1NQSTsNCiAgICB2dWFydF9lbmFibGVkID0gdHJ1ZTsNCn0N
Cg0KaWYgKGRfY29uZmlnLT5iX2luZm8uYXJjaF9hcm0udmlvbW11X3R5cGUgPT0gTElCWExfVklP
TU1VX1RZUEVfU01NVVYzKSB7DQogICAgbnJfc3BpcyA9IG1heChucl9zcGlzLCBHVUVTVF9WU01N
VV9TUEkgLSAzMiArIDEpOw0KICAgIHZzbW11X2lycSA9IEdVRVNUX1ZTTU1VX1NQSTsNCiAgICB2
c21tdV9lbmFibGVkID0gdHJ1ZTsNCn0NCg0KYXMgZG9uZSBoZXJlIGh0dHBzOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xzL2xpYnMvbGlnaHQvbGlieGxf
YXJtLmM7aD03ZTlmOGExYmMzNjY2YWM5YTNmOGFhNDg3MzY2Mzk5ZGMyNTViMTQ5O2hiPXJlZnMv
aGVhZHMvc3RhZ2luZyNsMTQ0DQoNCg0KPiArDQo+ICAgICBmb3IgKGkgPSAwOyBpIDwgZF9jb25m
aWctPm51bV9kaXNrczsgaSsrKSB7DQo+ICAgICAgICAgbGlieGxfZGV2aWNlX2Rpc2sgKmRpc2sg
PSAmZF9jb25maWctPmRpc2tzW2ldOw0KPiANCj4gQEAgLTE3MCw2ICsxODAsMTEgQEAgaW50IGxp
YnhsX19hcmNoX2RvbWFpbl9wcmVwYXJlX2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLA0KPiAgICAgICAg
ICAgICByZXR1cm4gRVJST1JfRkFJTDsNCj4gICAgICAgICB9DQo+IA0KPiArICAgICAgICBpZiAo
dnNtbXVfZW5hYmxlZCAmJiBpcnEgPT0gdnNtbXVfaXJxKSB7DQo+ICsgICAgICAgICAgICBMT0co
RVJST1IsICJQaHlzaWNhbCBJUlEgJXUgY29uZmxpY3Rpbmcgd2l0aCB2U01NVXYzIFNQSVxuIiwg
aXJxKTsNCj4gKyAgICAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KPiArICAgICAgICB9DQo+
ICsNCj4gICAgICAgICBpZiAoaXJxIDwgMzIpDQo+ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAN
Cj4gQEAgLTkwNyw2ICs5MjIsNyBAQCBzdGF0aWMgaW50IG1ha2VfdnNtbXV2M19ub2RlKGxpYnhs
X19nYyAqZ2MsIHZvaWQgKmZkdCwNCj4gew0KPiAgICAgaW50IHJlczsNCj4gICAgIGNvbnN0IGNo
YXIgKm5hbWUgPSBHQ1NQUklOVEYoImlvbW11QCVsbHgiLCBHVUVTVF9WU01NVVYzX0JBU0UpOw0K
PiArICAgIGdpY19pbnRlcnJ1cHQgaW50cjsNCj4gDQo+ICAgICByZXMgPSBmZHRfYmVnaW5fbm9k
ZShmZHQsIG5hbWUpOw0KPiAgICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCj4gQEAgLTkyNSw2ICs5
NDEsMTQgQEAgc3RhdGljIGludCBtYWtlX3ZzbW11djNfbm9kZShsaWJ4bF9fZ2MgKmdjLCB2b2lk
ICpmZHQsDQo+ICAgICByZXMgPSBmZHRfcHJvcGVydHlfY2VsbChmZHQsICIjaW9tbXUtY2VsbHMi
LCAxKTsNCj4gICAgIGlmIChyZXMpIHJldHVybiByZXM7DQo+IA0KPiArICAgIHJlcyA9IGZkdF9w
cm9wZXJ0eV9zdHJpbmcoZmR0LCAiaW50ZXJydXB0LW5hbWVzIiwgImNvbWJpbmVkIik7DQo+ICsg
ICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCj4gKw0KPiArICAgIHNldF9pbnRlcnJ1cHQoaW50ciwg
R1VFU1RfVlNNTVVfU1BJLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0hJR0gpOw0KPiArDQo+ICsg
ICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoZ2MsIGZkdCwgJmludHIsIDEpOw0KPiAr
ICAgIGlmIChyZXMpIHJldHVybiByZXM7DQo+ICsNCj4gICAgIHJlcyA9IGZkdF9lbmRfbm9kZShm
ZHQpOw0KPiAgICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5j
DQo+IGluZGV4IGE0OGVkYjk1NjguLjczODA3NTNmYTIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNo
L2FybS9kb20wbGVzcy1idWlsZC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb20wbGVzcy1idWls
ZC5jDQo+IEBAIC0yMjUsNiArMjI1LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92c21tdXYz
X25vZGUoY29uc3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykNCj4gICAgIGNoYXIgYnVmWzI0
XTsNCj4gICAgIF9fYmUzMiByZWdbR1VFU1RfUk9PVF9BRERSRVNTX0NFTExTICsgR1VFU1RfUk9P
VF9TSVpFX0NFTExTXTsNCj4gICAgIF9fYmUzMiAqY2VsbHM7DQo+ICsgICAgZ2ljX2ludGVycnVw
dF90IGludHI7DQo+ICAgICB2b2lkICpmZHQgPSBraW5mby0+ZmR0Ow0KPiANCj4gICAgIHNucHJp
bnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJpb21tdUAlbGx4IiwgR1VFU1RfVlNNTVVWM19CQVNFKTsN
Cj4gQEAgLTI1NSw2ICsyNTYsMjIgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92c21tdXYzX25v
ZGUoY29uc3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykNCj4gICAgIGlmICggcmVzICkNCj4g
ICAgICAgICByZXR1cm4gcmVzOw0KPiANCj4gKyAgICByZXMgPSBmZHRfcHJvcGVydHlfc3RyaW5n
KGZkdCwgImludGVycnVwdC1uYW1lcyIsICJjb21iaW5lZCIpOw0KPiArICAgIGlmICggcmVzICkN
Cj4gKyAgICAgICAgcmV0dXJuIHJlczsNCj4gKw0KPiArICAgIHNldF9pbnRlcnJ1cHQoaW50ciwg
R1VFU1RfVlNNTVVfU1BJLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0hJR0gpOw0KPiArDQo+ICsg
ICAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsICJpbnRlcnJ1cHRzIiwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaW50ciwgc2l6ZW9mKGludHIpKTsNCj4gKyAgICBpZiAoIHJlcyAp
DQo+ICsgICAgICAgIHJldHVybiByZXM7DQo+ICsNCj4gKyAgICByZXMgPSBmZHRfcHJvcGVydHlf
Y2VsbChraW5mby0+ZmR0LCAiaW50ZXJydXB0LXBhcmVudCIsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAga2luZm8tPnBoYW5kbGVfaW50Yyk7DQo+ICsgICAgaWYgKCByZXMgKQ0KPiAr
ICAgICAgICByZXR1cm4gcmVzOw0KPiArDQo+ICAgICByZXMgPSBmZHRfZW5kX25vZGUoZmR0KTsN
Cj4gDQo+ICAgICByZXR1cm4gcmVzOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL3ZzbW11LXYzLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUt
djMuYw0KPiBpbmRleCA3YTZjMThkZjUzLi5hNWI5NzAwMzY5IDEwMDY0NA0KPiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KPiBAQCAtNzMzLDYgKzczMyw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbW1pb19oYW5kbGVyX29wcyB2c21tdXYzX21taW9faGFuZGxlciA9IHsNCj4g
c3RhdGljIGludCB2c21tdXYzX2luaXRfc2luZ2xlKHN0cnVjdCBkb21haW4gKmQsIHBhZGRyX3Qg
YWRkciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qgc2l6ZSwgdWlu
dDMyX3QgdmlycSkNCj4gew0KPiArICAgIGludCByZXQ7DQo+ICAgICBzdHJ1Y3QgdmlydF9zbW11
ICpzbW11Ow0KPiANCj4gICAgIHNtbXUgPSB4emFsbG9jKHN0cnVjdCB2aXJ0X3NtbXUpOw0KPiBA
QCAtNzQ4LDEyICs3NDksMjQgQEAgc3RhdGljIGludCB2c21tdXYzX2luaXRfc2luZ2xlKHN0cnVj
dCBkb21haW4gKmQsIHBhZGRyX3QgYWRkciwNCj4gDQo+ICAgICBzcGluX2xvY2tfaW5pdCgmc21t
dS0+Y21kX3F1ZXVlX2xvY2spOw0KPiANCj4gKyAgICByZXQgPSB2Z2ljX3Jlc2VydmVfdmlycShk
LCB2aXJxKTsNCj4gKyAgICBpZiAoICFyZXQgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgcmV0ID0g
LUVJTlZBTDsNCj4gKyAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgfQ0KPiArDQo+ICAgICByZWdp
c3Rlcl9tbWlvX2hhbmRsZXIoZCwgJnZzbW11djNfbW1pb19oYW5kbGVyLCBhZGRyLCBzaXplLCBz
bW11KTsNCj4gDQo+ICAgICAvKiBSZWdpc3RlciB0aGUgdklPTU1VIHRvIGJlIGFibGUgdG8gY2xl
YW4gaXQgdXAgbGF0ZXIuICovDQo+ICAgICBsaXN0X2FkZF90YWlsKCZzbW11LT52aW9tbXVfbGlz
dCwgJmQtPmFyY2gudmlvbW11X2xpc3QpOw0KPiANCj4gICAgIHJldHVybiAwOw0KPiArDQo+ICtv
dXQ6DQo+ICsgICAgeGZyZWUoc21tdSk7DQo+ICsgICAgdmdpY19mcmVlX3ZpcnEoZCwgdmlycSk7
DQoNCkkgZG9u4oCZdCB0aGluayB3ZSBzaG91bGQgdXNlIHZnaWNfZnJlZV92aXJxIGhlcmUsIGlm
IGl0IHdhcyByZXNlcnZlZCBhbHJlYWR5IHRoZXJlIGlzIHNvbWUNCmJ1ZywgdGhlIHZpcnEgY2Fu
IGJlIEdVRVNUX1ZTTU1VX1NQSSBmb3IgZ3Vlc3RzIGFuZCBod19pb21tdS0+aXJxIGZvciBIVyBk
b21haW4sDQpzbyBpZiBpdOKAmXMgcmVzZXJ2ZWQgaXQgc2hvdWxkIGJlIGEgY29uZmlndXJhdGlv
biBpc3N1ZSBhbmQgZnJlZWluZyBpdCB3b3VsZCByZW1vdmUg4oCcc29tZW9uZSBlbHNl4oCdDQpy
ZXNlcnZlZCBpcnEuDQpQcm9iYWJseSBJIHdvdWxkIHByaW50IHNvbWV0aGluZyBpbiB0aGUgaWYg
YWJvdmUgYW5kIGFsc28gSSB3b3VsZCBqdXN0IGhhdmUgdGhlIGNvbnRlbnQgb2YgdGhpcw0KTGFi
ZWwtcGF0aCBpbnNpZGUgdGhlIGlmIGJyYW5jaCwgc2luY2UgaXQgaXMgdGhlIG9ubHkgY29uc3Vt
ZXIgb2YgdGhpcyBsYWJlbC4NCg0KPiArICAgIHJldHVybiByZXQ7DQo+IH0NCj4gDQo+IGludCBk
b21haW5fdnNtbXV2M19pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+IA0KDQpDaGVlcnMsDQpMdWNh
DQoNCg0KDQo=

