Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN9XGDHO6Wm9kgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:45:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66C44E1CB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291670.1570530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFokX-0008PS-Sz; Thu, 23 Apr 2026 07:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291670.1570530; Thu, 23 Apr 2026 07:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFokX-0008NE-PL; Thu, 23 Apr 2026 07:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1291670;
 Thu, 23 Apr 2026 07:45:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wFokV-0008N7-Lw
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 07:45:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFokU-000onz-V7
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:45:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9ce09-e002-0a2a0a5209dd-0a2a450bbf7a-26
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:45:22 +0200
Received: from [52.101.84.39]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9ce10-212f-0a2a450b0019-34655427ef8a-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:45:22 +0200
Received: from AS4P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::10)
 by AS8PR08MB9549.eurprd08.prod.outlook.com (2603:10a6:20b:61e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 07:45:14 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:657:cafe::83) by AS4P191CA0043.outlook.office365.com
 (2603:10a6:20b:657::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 07:45:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 23 Apr 2026 07:45:14 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM8PR08MB6498.eurprd08.prod.outlook.com (2603:10a6:20b:364::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 07:44:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Thu, 23 Apr 2026
 07:44:12 +0000
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
 b=v+EEsAE8EvI0QaTmJeGnAitilw7IUNk8FvGJgxCV/4NWHJgkoKejOEFx85Ba+m8ZnKT7Kbh7b7dcdcZb+R9dXKROQTxwCIueFcPyY9udKPH2Avh5fTuzNlDV3mmmRJh0AzGyx08l2mu/HAxyL2XDY2jifwqlDE63Ot4pPFEu/OJI9emw+cPgA/vWM+4/IqfQyly5rm8X3aN3bWjxegG/RlBDMpc0rX5jxbJsmqcJEuSKqHnx6dh1ldx0Evqc+dHU6aXzxvzfoaO0fSCU+IBfARbmiooZAu2TMgj0kKOv1EUiZci9NEMdHSRYoOe4r6C4jRA1JW/1eOb7CpUtXJWRbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fVyrfeACI5cUP5mPal2D/GFOoj38PCJBF36dY0hRdg=;
 b=TkObDwUcDZhQHXPvSkAiBtsYmzPjoG+X/+Dmbpli13SlcwkbqKF0+zNGiUIPvZua8X7hI/Q5DLnm5d6tEmOAmzm2PiNYyxuVZof8RAqfq4IRAwOyY7fgaS3JSeKiidIOR9CcQpwY9Jn1zgjO9G5HbAxIqhVfz9EoJVYlgQq/yawq7X8H2+Tqj4D1wduhRnwBv7/BxIYzyO/7bxoeCNkDgQ8s5KjikTL8L4/Gx/3d9GuWk8iZocR36eF2cLgfBerQ5LWeGK7Z64dn0kpSgV3ycEVPYGDXNfy4Zg6AFQfdo719CT4hpCqKDOFRXoN77z4I5vFkMvfnOS88Ttj56xSQDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fVyrfeACI5cUP5mPal2D/GFOoj38PCJBF36dY0hRdg=;
 b=ibd1oMLPltLGpYze3+gQ4oz6Q+I/nZ1rKQ4hN2LDHp94+jBvjDpoG03vOnhon8p2PpnQleNBLikgQ1KqhXfFqMDbXgmOWvh0abzDr/kbzCRmsIsnjH1TDzRo5Bc326szvvRBXT7eAAa9NSdImGUOE3USi3IJSSJhyuhNbtyleU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+zyj5hbQNkaOBzZ7R8p1r8L24jQCE8agEjMOOTtJMBiLFNeRFFlNzsMN4VE/bVHQcKuNZsS1nXRegRvC2xjSfWDLr58oAqA+ZdX92MQ5jtb8myFl03kUQRWIBEUo6JHaU0V/GYSdRBo3pc8JC5iY3n0m/4COWSbV6H8EGzYgts8mSvcgWzU4Ip6vkHNS9a+LTkL5q/6j9Jl/EBA2VdpFYN2yhDX9IqgZMdOXW7xx6trj++ipbPcKljp0UO+Mn7Riu192VkKqK5hkd2OXOdoSpiuvc04CdZY8bILyNkFuLwdzjJuiylleURLRcElPQrBRTr/Fo9vnQq+msjp6ALpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fVyrfeACI5cUP5mPal2D/GFOoj38PCJBF36dY0hRdg=;
 b=EAJlAQEq7mGrwUG9NzgcsfaujKn76sSN7kojt6PkGjKOPtyggeiYDO/YnyF/pFA6v4Hf6fvX4PzaaWyIUkfm1llJN4yhGr+ITng4EQ4haBXWCb07Tj/Czrj96ZBD7/f+gu+zIrDhCX6xb8WJl2BIMSRHanWPkx42xb59kKpN0KwjahRieOSA/icVQWXuf1QA/f+k1puDSbLSpUzEq3qtz5ML60DK2NETDqL3/IRq0NnspBOoXKVwUJtw8/Ksz6hPv4kQXLGjGJqdFUebGB+wNCEj97729h+cWwu7utem9aY+tyRZ2Ra0lDfcztPLWyme4tEoIvuiB3NRCXQ0hkgXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fVyrfeACI5cUP5mPal2D/GFOoj38PCJBF36dY0hRdg=;
 b=ibd1oMLPltLGpYze3+gQ4oz6Q+I/nZ1rKQ4hN2LDHp94+jBvjDpoG03vOnhon8p2PpnQleNBLikgQ1KqhXfFqMDbXgmOWvh0abzDr/kbzCRmsIsnjH1TDzRo5Bc326szvvRBXT7eAAa9NSdImGUOE3USi3IJSSJhyuhNbtyleU4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 5/6] xen/arm: ffa: Track VM notification bindings locally
Thread-Topic: [PATCH 5/6] xen/arm: ffa: Track VM notification bindings locally
Thread-Index: AQHcznArOQx42qP1+k2R4bBbbIb5Y7XrGR0AgAEz6AA=
Date: Thu, 23 Apr 2026 07:44:12 +0000
Message-ID: <535A06EE-BB9C-4D97-9C8D-2C571E753640@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <a3e689abc6695c0adbe294ebce7ee0a77bd4b7bf.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44EnUgxzyY7z53pfOhB5Xps8KWOV2FdZiTEF0gufrfQcdQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44EnUgxzyY7z53pfOhB5Xps8KWOV2FdZiTEF0gufrfQcdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM8PR08MB6498:EE_|AM1PEPF000252E0:EE_|AS8PR08MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad7c0c6-35e6-4264-4217-08dea10c41af
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 jpRdHgSlgYrKfduE7395i98L1FW9ZXAA5pjyspU0YR/YcSQ4G9FiKzW69LzPx3Qk6EkRDkQn5oxg8YFEnLI10KNpLO/2w/YSKeF9Knit7qOuzoYEzjZV+go2pPQEP3VXgUgf8nHJarbO2Pn2fliilIw5ky9hKQBhsh6T1nZMIIqc4D9b78dum3bIhOZnNu3pi5vdacSY0zIdWY3y+MM5IfyEir7NM5aPY30bYmvXDVOpQzo1m1vZLt2ihOoSa+wJ/AgqgaXZTTKZg7mQZezUYsABovRelQ2HxUhTEesHfo8SqymhO3KMyQHxVeaSlWgxiAakTmuwguyWD/iu3V+rw2qCm3QYh4v4GX+9qlivSCuWn/Tad6/9Ci5mAMrD18NoQW0GvrnNpR+lhsKP9wtxqwUMemaw0LKJX/f+/1ar4eIbJUd35DiDTEryqdfdHdCUxoI9kulLa2I6+vCsndf+TDy1YPlc8rbwbKP10KLUarmNXBlW4XbBCwqR0D2TXQe1yRPXZUcwIIj6gYmpcj4AVQDf4UQNOZZ7BbVYivPGvOBVxHHIv54rIckL5BBd+B3a10yhZIm8JA0TYtLM/Vlft+fqGx6iKf7dsceGHCnJurVgeV8NwhEmFMRPTgHxS+at3rJo7bqqVPMh/8XYnb8CmNgWjasZdCueQmmK+2O2+Br/fjCrLRVi9dnUaxybfeAzY5CVOhkukIgfxN1G/TUO0pr5THZ9/ZX3Y91CiPSWrB0GYEShf5s9SPSXH8KNoBOq91+pI1WxOo15PlqRkI6Smf3QQEfU2GNIQEamFRnbVHA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A238FBC162C49C48B85B80DE12544BA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ST5fzN/exA6YbXpFtz8F4fINzP1Vy+yNQot6j94K8p5tGEbeykRrwfjFh52uLPWl1krx9rRz1YiNvC7c9q89QhRukXsVfdN+Qa2SRLiGoJcCumk5o85+kq58uuNIedFGdFPNWuXHhgmmai0y3gEGkMGo5olQoGXDg7ifSp++dYUamIx7cn2Hzjl6SH08+BErZEDGebKWdCu4DqSs7ti7s2+XKLta9d3i76TWGUi2swFpNT2vqNwlnU4HbUjY1zz4iKPfQ2P0DaEUjbb19aI/s0w2iHSeBNfvnW0EUITy58py5MbU3prOvEKem2WoeopMj1FD93htsEh8H7v3fhyGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64dc2b8c-0516-4f2b-9497-08dea10c1c69
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|14060799003|376014|82310400026|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DFAvOEKejLXVpZR3w2/N8b4Trc/GqTB8VJ2hOPY7eHegbNAaT8KV6Crvu+FbJwpf/FN53X/hRiPRlxuspkpWBYoBNlK8VUP8WCgMLPn0kWygrP+MbqzPooXwVqfn6nJWo3jJfqZ4mnMyK6mVknJYQ1jZ4zqJeYiQ57suzQ7yyQVtaSAIhXbX7Du6CsmffYgmsOWv9m11tbxdC4mh1miYrgRRVPTtn017beYd4OOg08ioCQc+XPPogTFq6tXC4624KYUYOSjAqkHUMEbTjJB5ansY0mM3xRCQLOxG9ytvBXYuoeUxi6B1L/5YAo4IFmdueC12VZqYIWF5uqkeANZXvCoJkttYZqFGZ82ipp7irP+u8pjuM0rUSKvkWS5B21NV5sLeIipo0L5iqa19eF4rWHNEFZ75J2JdJ2+hlpAht3717W21h7L3YGAW5akqBnmC07RgMHWr516DfknhV+XRyzHi7WT7d6f6wxQE9ap26NzE3EF6+XBs805CR9jZ5xHbxoQz66Ovw8xLqF5y1z7QarNjpdP7bquEL1cEqUHsp5iaEeutavDuhsM4bdRridiTIwTWX+AsqsM02nmOC93yBO0M6Cri8uuCqlqZTw3eYsbVtLYh4TjPZvM8xGciftUV3NAr6OcWx8+6PLZLrIXYY2r5mIGZr84JJeFkma2AilTLhWSPGA1vYeE12AHTtM31BCLZfL4yPeD6GP/HdMKBHra6o2g0hqxsaJPKuAI8B3DrqjgKlvbUkC7kY2+ET9IzeCw5u39xIrGY5S6twPJiag==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(376014)(82310400026)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WU+acXVNanqe19i9y/oX7AT7d9ytNzpJTsz0DmysREk/+nD23NTBA4qn4ueWYehyt3h3Pw/fEYDnCnrfqWRI5V1SkDnp8X7BjEWM+AC/8WKSZFwWzN6HNsXpNhpRmHI4GLKv+zqSnmBtQ167Ik8+S2yLy3jfQRz0Mz+BHAekDxqiP/o+W6IJzfHSCcXNXgl3m/GrmPVqK0W6JpwNqQurLl8cFc7kkjP+vEFzYG20tnPEnDGkA/qbKtvWXAEkjhTNTcVqBPcc9rBiJs5I/4OuUTAgGZeGwQ9D2HD7C4l4HN5eNlgxoi89SG8GEC77yq9B1DwaCBvHboo5cu09AgeKo8LF/bApQXcsITiqBuuwek2HfDAe/dyc1XqGYq2jHlozf0jucyff5b0weIJHaa86DfHAH+WwzmJjXL9WBdxXR1MAvBZNUxUimw3hMWyO1pBZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:45:14.5906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad7c0c6-35e6-4264-4217-08dea10c41af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9549
X-purgate-ID: tlsNG-42698a/1776930322-06B70F3B-4D55E246/0/0
X-purgate-type: clean
X-purgate-size: 10678
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,linaro.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 8D66C44E1CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmVucywNCg0KPiBPbiAyMiBBcHIgMjAyNiwgYXQgMTU6MjEsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gRnJpLCBBcHIgMTcsIDIwMjYgYXQgMzo0MeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IFZNLXRvLVZNIG5vdGlm
aWNhdGlvbnMgbmVlZCByZWNlaXZlci1zaWRlIGJpbmQgc3RhdGUgc28gWGVuIGNhbiB2YWxpZGF0
ZQ0KPj4gd2hpY2ggc2VuZGVyIG93bnMgZWFjaCBub3RpZmljYXRpb24gYml0LiBOb24tc2VjdXJl
IEJJTkQgYW5kIFVOQklORA0KPj4gcmVxdWVzdHMgY3VycmVudGx5IGhhdmUgbm8gbG9jYWwgc3Rh
dGUgYW5kIGNhbm5vdCBlbmZvcmNlIHRoYXQgY29udHJhY3QuDQo+PiANCj4+IEFkZCBwZXItYml0
IFZNIG5vdGlmaWNhdGlvbiBiaW5kaW5nIHN0YXRlIHRvIHN0cnVjdCBmZmFfY3R4X25vdGlmIGFu
ZA0KPj4gdXNlIGl0IHRvIGhhbmRsZSBub24tc2VjdXJlIEJJTkQgYW5kIFVOQklORCByZXF1ZXN0
cyB3aGVuDQo+PiBDT05GSUdfRkZBX1ZNX1RPX1ZNIGlzIGVuYWJsZWQuIFRoZSB1cGRhdGUgaGVs
cGVyIHZhbGlkYXRlcyB0aGUgd2hvbGUNCj4+IHJlcXVlc3QgdW5kZXIgbm90aWZfbG9jayBiZWZv
cmUgbXV0YXRpbmcgYW55dGhpbmcsIGRlbmllcyBiaW5kIG9yDQo+PiB1bmJpbmQgd2hlbiBhIGJp
dCBpcyBwZW5kaW5nLCByZWplY3RzIHJlYmluZGluZyB0byBhIGRpZmZlcmVudCBzZW5kZXIsDQo+
PiBhbmQga2VlcHMgcmViaW5kaW5nIHRvIHRoZSBzYW1lIHNlbmRlciBpZGVtcG90ZW50Lg0KPj4g
DQo+PiBQcm9tb3RlIHZtX3BlbmRpbmcgdG8gYSBiaXRtYXAgc28gdGhlIGJpbmQgbG9naWMgY2Fu
IHJlYXNvbiBwZXINCj4+IG5vdGlmaWNhdGlvbiBJRCwgdXNlIHRoYXQgYml0bWFwIGRpcmVjdGx5
IHdoZW4gcmVwb3J0aW5nIHBlbmRpbmcgc3RhdGUsDQo+PiBhbmQgaW5pdGlhbGl6ZSBhbmQgY2xl
YXIgdGhlIG5ldyBWTSBub3RpZmljYXRpb24gc3RhdGUgZHVyaW5nIGRvbWFpbg0KPj4gaW5pdCBh
bmQgdGVhcmRvd24uDQo+PiANCj4+IEZ1bmN0aW9uYWwgaW1wYWN0OiB3aGVuIENPTkZJR19GRkFf
Vk1fVE9fVk0gaXMgZW5hYmxlZCwgWGVuIHRyYWNrcyBWTQ0KPj4gbm90aWZpY2F0aW9uIGJpbmRp
bmdzIGxvY2FsbHkgYW5kIHZhbGlkYXRlcyBub24tc2VjdXJlIGJpbmQgYW5kIHVuYmluZA0KPj4g
cmVxdWVzdHMgYWdhaW5zdCB0aGF0IHN0YXRlLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0
cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9h
cmNoL2FybS90ZWUvZmZhX25vdGlmLmMgICB8IDk3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCB8IDE1ICsrKystLQ0K
Pj4gMiBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4+
IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMgYi94ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiBpbmRleCBmZmYwMGNhMmJhZWMuLjRkZWY3MDFmMDEz
MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+ICsrKyBi
L3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+IEBAIC01Niw2ICs1Niw1NCBAQCBzdGF0
aWMgaW50MzJfdCBmZmFfbm90aWZfcGFyc2VfcGFyYW1zKHVpbnQxNl90IGRvbV9pZCwgdWludDE2
X3QgY2FsbGVyX2lkLA0KPj4gICAgIHJldHVybiBGRkFfUkVUX09LOw0KPj4gfQ0KPj4gDQo+PiAr
c3RhdGljIGludDMyX3QgZmZhX25vdGlmX3VwZGF0ZV92bV9iaW5kaW5nKHN0cnVjdCBmZmFfY3R4
ICpjdHgsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQxNl90IGRlc3RfaWQsIHVpbnQ2NF90IGJpdG1hcCwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBiaW5kKQ0KPj4gK3sNCj4+ICsgICAgdW5zaWdu
ZWQgaW50IGlkOw0KPj4gKyAgICBpbnQzMl90IHJldCA9IEZGQV9SRVRfT0s7DQo+PiArDQo+PiAr
ICAgIHNwaW5fbG9jaygmY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+ICsNCj4+ICsgICAgZm9y
ICggaWQgPSAwOyBpZCA8IEZGQV9OVU1fVk1fTk9USUY7IGlkKysgKQ0KPj4gKyAgICB7DQo+PiAr
ICAgICAgICBpZiAoICEoYml0bWFwICYgQklUKGlkLCBVTEwpKSApDQo+PiArICAgICAgICAgICAg
Y29udGludWU7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGN0eC0+bm90aWYudm1fcGVuZGluZyAm
IEJJVChpZCwgVUxMKSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmV0ID0gRkZB
X1JFVF9ERU5JRUQ7DQo+PiArICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gKyAgICAg
ICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBiaW5kICkNCj4+ICsgICAgICAgIHsNCj4+ICsg
ICAgICAgICAgICBpZiAoIGN0eC0+bm90aWYudm1fYmluZFtpZF0gIT0gMCAmJg0KPj4gKyAgICAg
ICAgICAgICAgICAgY3R4LT5ub3RpZi52bV9iaW5kW2lkXSAhPSBkZXN0X2lkICkNCj4+ICsgICAg
ICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgIHJldCA9IEZGQV9SRVRfREVOSUVEOw0KPj4g
KyAgICAgICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7DQo+PiArICAgICAgICAgICAgfQ0KPj4g
KyAgICAgICAgfQ0KPj4gKyAgICAgICAgZWxzZSBpZiAoIGN0eC0+bm90aWYudm1fYmluZFtpZF0g
IT0gZGVzdF9pZCApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmV0ID0gRkZBX1JF
VF9ERU5JRUQ7DQo+PiArICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4gKyAgICAgICAg
fQ0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGZvciAoIGlkID0gMDsgaWQgPCBGRkFfTlVNX1ZN
X05PVElGOyBpZCsrICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgaWYgKCBiaXRtYXAgJiBCSVQo
aWQsIFVMTCkgKQ0KPj4gKyAgICAgICAgICAgIGN0eC0+bm90aWYudm1fYmluZFtpZF0gPSBiaW5k
ID8gZGVzdF9pZCA6IDA7DQo+PiArICAgIH0NCj4+ICsNCj4+ICtvdXRfdW5sb2NrOg0KPj4gKyAg
ICBzcGluX3VubG9jaygmY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+ICsNCj4+ICsgICAgcmV0
dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+PiBpbnQzMl90IGZmYV9oYW5kbGVfbm90aWZpY2F0aW9u
X2JpbmQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiB7DQo+PiAgICAgc3RydWN0IGRv
bWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4+IEBAIC03NiwxMSArMTI0LDIxIEBAIGludDMy
X3QgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fYmluZChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykNCj4+ICAgICBpZiAoIHJldCApDQo+PiAgICAgICAgIHJldHVybiByZXQ7DQo+PiANCj4+IC0g
ICAgaWYgKCBGRkFfSURfSVNfU0VDVVJFKGRlc3RfaWQpICYmIGZ3X25vdGlmX2VuYWJsZWQgKQ0K
Pj4gLSAgICAgICAgcmV0dXJuIGZmYV9zaW1wbGVfY2FsbChGRkFfTk9USUZJQ0FUSU9OX0JJTkQs
IHNyY19kc3QsIGZsYWdzLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaXRt
YXBfbG8sIGJpdG1hcF9oaSk7DQo+PiArICAgIGlmICggRkZBX0lEX0lTX1NFQ1VSRShkZXN0X2lk
KSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggZndfbm90aWZfZW5hYmxlZCApDQo+PiAr
ICAgICAgICAgICAgcmV0dXJuIGZmYV9zaW1wbGVfY2FsbChGRkFfTk9USUZJQ0FUSU9OX0JJTkQs
IHNyY19kc3QsIGZsYWdzLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Yml0bWFwX2xvLCBiaXRtYXBfaGkpOw0KPj4gDQo+PiAtICAgIHJldHVybiBGRkFfUkVUX05PVF9T
VVBQT1JURUQ7DQo+PiArICAgICAgICByZXR1cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4g
KyAgICB9DQo+PiArDQo+PiArICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19W
TSkgKQ0KPj4gKyAgICAgICAgcmV0dXJuIEZGQV9SRVRfTk9UX1NVUFBPUlRFRDsNCj4+ICsNCj4+
ICsgICAgcmV0dXJuIGZmYV9ub3RpZl91cGRhdGVfdm1fYmluZGluZyhjdHgsIGRlc3RfaWQsDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCh1aW50NjRfdCliaXRt
YXBfaGkgPDwgMzIpIHwgYml0bWFwX2xvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHRydWUpOw0KPj4gfQ0KPj4gDQo+PiBpbnQzMl90IGZmYV9oYW5kbGVfbm90
aWZpY2F0aW9uX3VuYmluZChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+IEBAIC05OSwx
MSArMTU3LDIxIEBAIGludDMyX3QgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fdW5iaW5kKHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgIGlmICggcmV0ICkNCj4+ICAgICAgICAgcmV0
dXJuIHJldDsNCj4+IA0KPj4gLSAgICBpZiAoIEZGQV9JRF9JU19TRUNVUkUoZGVzdF9pZCkgJiYg
Zndfbm90aWZfZW5hYmxlZCApDQo+PiAtICAgICAgICByZXR1cm4gZmZhX3NpbXBsZV9jYWxsKEZG
QV9OT1RJRklDQVRJT05fVU5CSU5ELCBzcmNfZHN0LCAwLCBiaXRtYXBfbG8sDQo+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJpdG1hcF9oaSk7DQo+PiArICAgIGlmICggRkZBX0lE
X0lTX1NFQ1VSRShkZXN0X2lkKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggZndfbm90
aWZfZW5hYmxlZCApDQo+PiArICAgICAgICAgICAgcmV0dXJuIGZmYV9zaW1wbGVfY2FsbChGRkFf
Tk9USUZJQ0FUSU9OX1VOQklORCwgc3JjX2RzdCwgMCwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJpdG1hcF9sbywgYml0bWFwX2hpKTsNCj4+IA0KPj4gLSAgICByZXR1
cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gKyAgICAgICAgcmV0dXJuIEZGQV9SRVRfTk9U
X1NVUFBPUlRFRDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoICFJU19FTkFCTEVEKENP
TkZJR19GRkFfVk1fVE9fVk0pICkNCj4+ICsgICAgICAgIHJldHVybiBGRkFfUkVUX05PVF9TVVBQ
T1JURUQ7DQo+PiArDQo+PiArICAgIHJldHVybiBmZmFfbm90aWZfdXBkYXRlX3ZtX2JpbmRpbmco
Y3R4LCBkZXN0X2lkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICgodWludDY0X3QpYml0bWFwX2hpIDw8IDMyKSB8IGJpdG1hcF9sbywNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxzZSk7DQo+PiB9DQo+PiANCj4+IHZvaWQg
ZmZhX2hhbmRsZV9ub3RpZmljYXRpb25faW5mb19nZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpDQo+PiBAQCAtMTI1LDkgKzE5MywxMCBAQCB2b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9u
X2luZm9fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gDQo+PiAgICAgaWYgKCBJ
U19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+ICAgICB7DQo+PiAtICAgICAgICBu
b3RpZl9wZW5kaW5nIHw9IHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi52bV9wZW5kaW5n
KTsNCj4+IC0NCj4+ICAgICAgICAgc3Bpbl9sb2NrKCZjdHgtPm5vdGlmLm5vdGlmX2xvY2spOw0K
Pj4gKyAgICAgICAgaWYgKCBjdHgtPm5vdGlmLnZtX3BlbmRpbmcgKQ0KPj4gKyAgICAgICAgICAg
IG5vdGlmX3BlbmRpbmcgPSB0cnVlOw0KPj4gKw0KPj4gICAgICAgICBpZiAoIGN0eC0+bm90aWYu
aHlwX3BlbmRpbmcgKQ0KPj4gICAgICAgICAgICAgbm90aWZfcGVuZGluZyA9IHRydWU7DQo+PiAg
ICAgICAgIHNwaW5fdW5sb2NrKCZjdHgtPm5vdGlmLm5vdGlmX2xvY2spOw0KPj4gQEAgLTQ5Nywx
MCArNTY2LDE0IEBAIHZvaWQgZmZhX25vdGlmX2luaXQodm9pZCkNCj4+IGludCBmZmFfbm90aWZf
ZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+IHsNCj4+ICAgICBzdHJ1Y3QgZmZhX2N0
eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+PiArICAgIHVuc2lnbmVkIGludCBpOw0KPj4gICAgIGlu
dDMyX3QgcmVzOw0KPj4gDQo+PiAgICAgc3Bpbl9sb2NrX2luaXQoJmN0eC0+bm90aWYubm90aWZf
bG9jayk7DQo+PiAgICAgY3R4LT5ub3RpZi5zZWN1cmVfcGVuZGluZyA9IGZhbHNlOw0KPj4gKyAg
ICBjdHgtPm5vdGlmLnZtX3BlbmRpbmcgPSAwOw0KPj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEZG
QV9OVU1fVk1fTk9USUY7IGkrKyApDQo+PiArICAgICAgICBjdHgtPm5vdGlmLnZtX2JpbmRbaV0g
PSAwOw0KPj4gICAgIGN0eC0+bm90aWYuaHlwX3BlbmRpbmcgPSAwOw0KPj4gDQo+PiAgICAgaWYg
KCBmd19ub3RpZl9lbmFibGVkICkNCj4+IEBAIC01MTYsOSArNTg5LDEzIEBAIGludCBmZmFfbm90
aWZfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+IHZvaWQgZmZhX25vdGlmX2RvbWFp
bl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpDQo+PiB7DQo+PiAgICAgc3RydWN0IGZmYV9jdHgg
KmN0eCA9IGQtPmFyY2gudGVlOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+IA0KPj4gICAg
IHNwaW5fbG9jaygmY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+ICAgICBjdHgtPm5vdGlmLnNl
Y3VyZV9wZW5kaW5nID0gZmFsc2U7DQo+PiArICAgIGN0eC0+bm90aWYudm1fcGVuZGluZyA9IDA7
DQo+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgRkZBX05VTV9WTV9OT1RJRjsgaSsrICkNCj4+ICsg
ICAgICAgIGN0eC0+bm90aWYudm1fYmluZFtpXSA9IDA7DQo+IA0KPiBXaHkgbm90IG1lbXNldChj
dHgtPm5vdGlmLnZtX2JpbmQsIDAsIHNpemVvZihjdHgtPm5vdGlmLnZtX2JpbmQpPw0KDQpEZWZp
bml0ZWx5IGJldHRlciB0byB1c2UgbWVtc2V0LCBJIHdpbGwgdXNlIGl0IGhlcmUgYW5kIGluIGRv
bWFpbl9pbml0DQppbnN0ZWFkIG9mIGFuIGV4cGxpY2l0IGxvb3AuDQoNCj4gDQo+PiAgICAgY3R4
LT5ub3RpZi5oeXBfcGVuZGluZyA9IDA7DQo+PiAgICAgc3Bpbl91bmxvY2soJmN0eC0+bm90aWYu
bm90aWZfbG9jayk7DQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9w
cml2YXRlLmggYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmgNCj4+IGluZGV4IDU2OTM3
NzI0ODFlZC4uNmQ4M2FmYjNkMDBhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9m
ZmFfcHJpdmF0ZS5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmgNCj4+
IEBAIC0yMzYsNiArMjM2LDExIEBADQo+PiAjZGVmaW5lIEZGQV9OT1RJRl9JTkZPX0dFVF9JRF9D
T1VOVF9NQVNLICAgIDB4MUYNCj4+IA0KPj4gI2RlZmluZSBGRkFfTk9USUZfUlhfQlVGRkVSX0ZV
TEwgICAgICAgIEJJVCgwLCBVKQ0KPj4gKyNkZWZpbmUgRkZBX05VTV9WTV9OT1RJRiAgICAgICAg
ICAgICAgICA2NFUNCj4+ICsNCj4+ICsjaWYgRkZBX05VTV9WTV9OT1RJRiA+IDY0DQo+PiArI2Vy
cm9yICJGRkFfTlVNX1ZNX05PVElGIG11c3QgYmUgPD0gNjQiDQo+PiArI2VuZGlmDQo+IA0KPiBC
VUlMRF9CVUdfT04oRkZBX05VTV9WTV9OT1RJRiA+IDY0KSA/DQoNClllcyB0aGF0IHdvdWxkIGJl
IGNsZWFuZXIuDQpJIHdpbGwgcHV0IGl0IGluIGZmYV9ub3RpZl9kb21haW5faW5pdCBhbmQgcmVt
b3ZlIHRoYXQNCmZyb20gdGhlIGhlYWRlci4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo=

