Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJtqC77O3GmcWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:08:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617EB3EB1D2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281064.1564120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCF8p-0003Ys-VK; Mon, 13 Apr 2026 11:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281064.1564120; Mon, 13 Apr 2026 11:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCF8p-0003Vp-SK; Mon, 13 Apr 2026 11:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1281064;
 Mon, 13 Apr 2026 11:07:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCF8n-0003Vj-KF
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCF8m-001zyh-Si
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 13:07:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcce78-e002-0a2a0a5209dd-0a2a450b9f50-12
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:07:40 +0200
Received: from [40.107.159.52]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcce7b-bca8-0a2a450b0019-286b9f34e18f-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:07:39 +0200
Received: from DUZP191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::15)
 by AM0PR08MB11803.eurprd08.prod.outlook.com (2603:10a6:20b:747::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:07:38 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::6b) by DUZP191CA0016.outlook.office365.com
 (2603:10a6:10:4f9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 11:07:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 11:07:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM0PR08MB5460.eurprd08.prod.outlook.com (2603:10a6:208:187::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:06:33 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 11:06:33 +0000
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
 b=ysuCD9PJCly+U3YTbYpjP4pVaZ3CAdwWz0h1XSMMj2mBfbfnpDMo3ulJl9FfRwnxVx+hn8rTY1Rz6DVH5TqoJdI43DHUVoVN2tfXwerUwZC0F2Hg1t71P2Rt/pV/pBKfgUFrKF70dVeUyYoq9W9w8ONzFR4rcGdOdCbSLa5Kuiykin1heZO4px9m3j0iFEygPDjV5JGLe8RlkCL6D/Y3BYLyL8rRYsRFfPTG0bq2h4JD7KC9aB1a183q1gs/ALkJAqborhqSWLg54KzdCXYf4HKesdCiXj/aR8s4jR8m+vV5k90ztJfsRUWabOmLgtcL1V5aWxUXci5QsZhdlYZlyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKm9WY0FDXfeIXUUjwNFNFIYohAbgJ+9fFMaoRS1vww=;
 b=MO4qNy7wJXk87VVBuhmzOtrm3mT7i66V+kHw+nJDOFEyDIivNEnBCkOnml++Nhls/8I1Myu11fqPyRcKIsMGxf5nrdBowK1xdPszU8oQsH/j1xdYJEbbkH5MFefhrTy71p17eS3U7EldTxW2TA5q2AW5n2nUgGwnrSxbDCfz7L0JsjUYPsZMjYt7I8j0fs5jiOpJBzsp8liMDDBYW4OSotm7pmPwU6ogqVhLM1+PKOoFjfX2KtPe68PUKDWowJloLDyfNy4EMkEYJx8AEF+BbxbQk3wKfuuDxLmQJQclfdElLAIrr/2VQhVCmwsapZwCY3uSdgpTtpQImOaDZ3DxCQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKm9WY0FDXfeIXUUjwNFNFIYohAbgJ+9fFMaoRS1vww=;
 b=XfC70CuLigXcCatdr2jD5/cjMg0x+OeIXIpIjtjROcskQR3PR6QIMx1JX2u9k1psNn1sQYzyaD5GvazbZ4hTFQgwSqWctZQq0KhjT1BqIEuKJLofRMttM/5uZfR1cPUThPY2LMAicj7VBBpMIKk0JD7xoftAHwRZrw//W6VXvqo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5LhpyeoEw3rzihf9K+w3mQXrP3ZN17AkanExxjQouaoLJI1BjcSJBB0tcYqx9D/AF4Z1nvxMdeuxtIkQC22INhN80Iak4F1P7Do74EeAGdNMK7vQuJgrqNj28ukyBL5RQBorF+Tw2NOY0sSmZ16HOm6Q8VvLGDg3dw7Morw6dP1wvzJuQk0nYSyqGT0ILFQLesCpj/gKHvcyff7bN/p9ium7v/VEvvr8Q0kXPT/qqyOW+8rQIZJZZyvC9cP20iH0zp8Hb+MObuOjBSFeaFPncOL3alj9c7WoW7GwQvsd6PPkeAJ2AWyi58v7i+YwEcAM8f2wghBXYpYLoDFP5H4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKm9WY0FDXfeIXUUjwNFNFIYohAbgJ+9fFMaoRS1vww=;
 b=ZsRj6vASN0FxKSG0IsNS9XdtDc33OytSVqWAcmnLcYOOI/iZt4d2j3fmEAoYDqZyntWLQcrluGkVDzbLZIF6sT67/Yg8+hsxzN7R/NItnESJRutAd04vsBqF8NK7EVULWDK72JC+SEuaZPAcV31mJGgHiB7JqPpVqFyszuY3Nuf5Oed2+HDe/HCVzk/fFJP7FXb0GXx1E1PeMFTIY6E90FsQrYaMHlUkq020KndigNdW1tR9TUyslwl20RPyfjHxRY5B7xa9Fc+5gZu98rZ6qZZ7ycLDo+C6gIb1rIE1yQ1kJnviquMNajIGDRoaxImeIq9fc6ohDMN8gNO9n5yQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKm9WY0FDXfeIXUUjwNFNFIYohAbgJ+9fFMaoRS1vww=;
 b=XfC70CuLigXcCatdr2jD5/cjMg0x+OeIXIpIjtjROcskQR3PR6QIMx1JX2u9k1psNn1sQYzyaD5GvazbZ4hTFQgwSqWctZQq0KhjT1BqIEuKJLofRMttM/5uZfR1cPUThPY2LMAicj7VBBpMIKk0JD7xoftAHwRZrw//W6VXvqo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/23] xen/arm: vsmmuv3: Add support for event queue
 and global error
Thread-Topic: [PATCH v3 12/23] xen/arm: vsmmuv3: Add support for event queue
 and global error
Thread-Index: AQHcyzWWF4JjVjjX1ESgGXK5vaYBUA==
Date: Mon, 13 Apr 2026 11:06:33 +0000
Message-ID: <825D8F28-5C8C-4C46-9B53-04BE9FA7F156@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <b3c49d35b986dff560bba8a51f85fb6b4a57c0c5.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <b3c49d35b986dff560bba8a51f85fb6b4a57c0c5.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM0PR08MB5460:EE_|DB5PEPF00014B88:EE_|AM0PR08MB11803:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed481e8-b12f-41a9-fc84-08de994cdf65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 AfF64NTuI7RmNzk+yCxAjargna58CMMQ9k36FQ3IqR/p0LAtbcuiqHrjBAFwSF/IlvcxNr7U02/Bf1rlUUwZa19T71SdUCikhOsc3DA3J5aegftTnvAsRCEaqtxFEbICNaJRzUsn7gj2lx+5YZSACnulawyPBT0POZBngxxKSFdTwIz18jHBCCbk1e5yVZnLUbK46ua3xwm+8PfTuR+OdDaS5AkLgucEeCHwAssJ2X27gMG06zn3bWcsmFaED+nAFnFDdZHVMUZek5xwMON+20YwGpRi6ejcU5ZEX9JnlcRdJanWm61rH88CjNiXJJLoi+d54lh2S55M/xdsrgLE2rSjxlWAaflrH0mtDikIWPKItSgik6mES7wv3JuDGJJ+4VY/iDR5ufL68p6+wQPvVVVQy1VY8UKqfyKy7qHNV494qLTT5Ojhe7HRAK5jmpdGDygQk6bkGWhH5PqAw6Tqs/AmNcxeRUZcyCJ6vFrp3Orw1oCDGsPpyundTk28ehfLJP+6L1lEYg7nqKCN5xk2V0sJVPZxjpX3+jn7QEobHb0nDY6c/lA9+wd36pDU/3HguQN6CyJ/foYVp4kcHRPk8tDHtkMVVwYPR8wrR/mzyVTX6lYDdwqe9BCPHIJARCUKnXQ3n0nXYCOFzjPR9nv/WGrOcSOqu2Ypt/I1cEszQE3wClwGMWFe3DGY9rkCV8IuRjlPsQ03EkzeK9oRL05vADwok28axwxPSX7rfe0LGlMINniVhN5j9Z782wNLrsvBG1PNGHwgetTZD4FeZS2Jo6PL2IQDZz2Aq7b+clvSB3g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E4A4ADCC6C19E4CB85CD138B5596E3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bkRHeuzSrFqqAPZtXATZyVu3xM3SEixXnYjb+dNIJbuK16Zp5qCTipeoNfQLo5FSofsH1mQqhVl9z8Gn5mOpx85d4ryuhfM+O1+KQ4ha5oTmKYpk3IR9IVSjs95KezKOPDLGXL2m6s9RuCHybqjAxAZCLyLWHxbgoaXD5hIZmy4EBEvpYyZmPbTRcb3i9qn8dGm9xEB1ynKlqxlf/1wwljIZb29tmZV9guLRvaCwQQMzEPkH8zN/sR6+Y116m8295P0AVJ7oYrNGhUL3n/cajNLb0ve2E5m1eNI8aiZCASEWgFRj5On/uWxncsJezOlE2TtyePF417Cr5GmK51xAYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5460
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70448949-0ba2-42da-5b10-08de994cb917
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|35042699022|82310400026|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZNIENit3dPnSuT7RHukYOHNFvIvma1GpregN1fmgmtWyT1hVW6dQEN+XzDDgvqVmbc3rNdLBT/ot6qXb64Ks+BJXlZ6K0hTmiHAAOlvQeM38YL5arlCk77UP8ZXRG7tlvMfHLnnz2pdsHCmGIAJ4THSe+B2ODq71TnQJIjjZz7PoNKS5TJzPhMLjEuXUZTCATFwqZ1SlN7sgflkjwQsCkPVd6TVj/vx7/3rt+mDFOUjr0PGxgvfeHjC2ddumRNA3VsTwYzRNfXaqUeBeac5yQ5FYS5AXmxtLfv+kTebqaczGYP7wZz+M3SPEzm7x0G6eO4GXmqRMdRHQg7uV8hFP/wjv2n4JUMM/7+6Q5NwFpfme/DXFyFEdJFmrDnsexVw+SVV14koCAQyL0KPF3qeeqFmooATkM0r/VHzl59SwdvuEbWhc1zOwJ8h2YP7GqppIP+J1YsLfeupRhzdaQdFKpuSztpgXzadltQ48jYHJ9fdlmUxp0+oJCE3WdQR09FCCAtOqICqW7I03QiMnXNuBtjMNYwBYsZSWXb+5DXXOcQdq1a2qi5nQuKR3QZ20mBroiJKvEhV0RgCLRZzQEGrde2gsHvSEPV23QzAI45rlcLaahB9wKKb/nDlAD6SYBtQHGB1KhYGugksNBbbaH1wyFXSJPiCviCihlyKAPN99RMAJ11bv5HE6Es4p7o0q2aFCarZJTo4Z4oF1f50q/zp3rYBYWXtnQnOoeeI7xf70fojSxkudqk6RVptKDNUMs4ti3ApGhGZYgjUKXLiEJkmMtw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(35042699022)(82310400026)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5OzgiNHCKx2RyRMpyctAwvgYxDOPIMUmx4l0S+vKSEaF1JPrSeUlG27OL1HWW7XOxW7GdJFh56tld7LB4vqZUuYZ5hlPaTvZb5Lp55KwbcUyPAk5aol3GAnqaHhTK4o8Jy2DmXqMTSVTrWPfhftkVGiH/nx3dM3a5GniDIj+dPijE2sQUeZ5gdL4VOoOvSz9vpyyVQGxi+fw/6zNUuZJAnXe86U2WYyG1FeJ3XFzTxKCVEOi9+qoyHH/KCsicYGnZa825tN5aAGOcadM0nUoHnEKEwQ+LCRZSLhyd8GYzh6e3Eh8sW5JTRIl6yGx3nmBJYHbGO5PWJqgpTZzXueIjbgwRMT1r/xuri6xf5Bkd5/vcTU0RuKXKJ813lDuKFAP1FPnyGYppF2ib6B5UFF5foXLTZasqfPwHE+e+E60QfRQ6qXviaMHy28TyYWHP8/l
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:07:37.6631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed481e8-b12f-41a9-fc84-08de994cdf65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11803
X-purgate-ID: tlsNG-42698a/1776078459-EC75A2A1-A335CC4D/0/0
X-purgate-type: clean
X-purgate-size: 14066
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
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 617EB3EB1D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92
c21tdS12My5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmMNCj4gaW5k
ZXggNmQzNjM2YjE4Yi4uN2E2YzE4ZGY1MyAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL3ZzbW11LXYzLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL3ZzbW11LXYzLmMNCj4gQEAgLTQ0LDYgKzQ0LDcgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCB2
aW9tbXVfZGVzYyBfX3JlYWRfbW9zdGx5ICpjdXJfdmlvbW11Ow0KPiANCj4gLyogSGVscGVyIE1h
Y3JvcyAqLw0KPiAjZGVmaW5lIHNtbXVfZ2V0X2NtZHFfZW5hYmxlZCh4KSAgICBGSUVMRF9HRVQo
Q1IwX0NNRFFFTiwgeCkNCj4gKyNkZWZpbmUgc21tdV9nZXRfZXZ0cV9lbmFibGVkKHgpICAgIEZJ
RUxEX0dFVChDUjBfRVZUUUVOLCB4KQ0KPiAjZGVmaW5lIHNtbXVfY21kX2dldF9jb21tYW5kKHgp
ICAgICBGSUVMRF9HRVQoQ01EUV8wX09QLCB4KQ0KPiAjZGVmaW5lIHNtbXVfY21kX2dldF9zaWQo
eCkgICAgICAgICBGSUVMRF9HRVQoQ01EUV9QUkVGRVRDSF8wX1NJRCwgeCkNCj4gI2RlZmluZSBz
bW11X2dldF9zdGVfczFjZG1heCh4KSAgICAgRklFTERfR0VUKFNUUlRBQl9TVEVfMF9TMUNETUFY
LCB4KQ0KPiBAQCAtNTIsNiArNTMsMzUgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCB2aW9tbXVfZGVz
YyBfX3JlYWRfbW9zdGx5ICpjdXJfdmlvbW11Ow0KPiAjZGVmaW5lIHNtbXVfZ2V0X3N0ZV9zMWN0
eHB0cih4KSAgICBGSUVMRF9QUkVQKFNUUlRBQl9TVEVfMF9TMUNUWFBUUl9NQVNLLCBcDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZJRUxEX0dFVChTVFJUQUJfU1RFXzBf
UzFDVFhQVFJfTUFTSywgeCkpDQo+IA0KPiArLyogZXZlbnQgcXVldWUgZW50cnkgKi8NCj4gK3N0
cnVjdCBhcm1fc21tdV9ldnRxX2VudCB7DQo+ICsgICAgLyogQ29tbW9uIGZpZWxkcyAqLw0KPiAr
ICAgIHVpbnQ4X3QgICAgIG9wY29kZTsNCj4gKyAgICB1aW50MzJfdCAgICBzaWQ7DQo+ICsNCj4g
KyAgICAvKiBFdmVudC1zcGVjaWZpYyBmaWVsZHMgKi8NCj4gKyAgICB1bmlvbiB7DQo+ICsgICAg
ICAgIHN0cnVjdCB7DQo+ICsgICAgICAgICAgICB1aW50MzJfdCBzc2lkOw0KPiArICAgICAgICAg
ICAgYm9vbCBzc3Y7DQo+ICsgICAgICAgIH0gY19iYWRfc3RlX3N0cmVhbWlkOw0KPiArDQo+ICsg
ICAgICAgIHN0cnVjdCB7DQo+ICsgICAgICAgICAgICBib29sIHN0YWxsOw0KPiArICAgICAgICAg
ICAgdWludDE2X3Qgc3RhZzsNCj4gKyAgICAgICAgICAgIHVpbnQzMl90IHNzaWQ7DQo+ICsgICAg
ICAgICAgICBib29sIHNzdjsNCj4gKyAgICAgICAgICAgIGJvb2wgczI7DQo+ICsgICAgICAgICAg
ICB1aW50NjRfdCBhZGRyOw0KPiArICAgICAgICAgICAgYm9vbCBybnc7DQo+ICsgICAgICAgICAg
ICBib29sIHBudTsNCj4gKyAgICAgICAgICAgIGJvb2wgaW5kOw0KPiArICAgICAgICAgICAgdWlu
dDhfdCBjbGFzczsNCj4gKyAgICAgICAgICAgIHVpbnQ2NF90IGFkZHIyOw0KPiArICAgICAgICB9
IGZfdHJhbnNsYXRpb247DQo+ICsgICAgfTsNCj4gK307DQo+ICsNCj4gLyogc3RhZ2UtMSB0cmFu
c2xhdGlvbiBjb25maWd1cmF0aW9uICovDQo+IHN0cnVjdCBhcm1fdnNtbXVfczFfdHJhbnNfY2Zn
IHsNCj4gICAgIHBhZGRyX3QgczFjdHhwdHI7DQo+IEBAIC04Miw2ICsxMTIsNyBAQCBzdHJ1Y3Qg
dmlydF9zbW11IHsNCj4gICAgIHVpbnQzMl90ICAgIHN0cnRhYl9iYXNlX2NmZzsNCj4gICAgIHVp
bnQ2NF90ICAgIHN0cnRhYl9iYXNlOw0KPiAgICAgdWludDMyX3QgICAgaXJxX2N0cmw7DQo+ICsg
ICAgdWludDMyX3QgICAgdmlycTsNCj4gICAgIHVpbnQ2NF90ICAgIGdlcnJvcl9pcnFfY2ZnMDsN
Cj4gICAgIHVpbnQ2NF90ICAgIGV2dHFfaXJxX2NmZzA7DQo+ICAgICBzdHJ1Y3QgICAgICBhcm1f
dnNtbXVfcXVldWUgZXZ0cSwgY21kcTsNCj4gQEAgLTg5LDYgKzEyMCwxMiBAQCBzdHJ1Y3Qgdmly
dF9zbW11IHsNCj4gfTsNCj4gDQo+IC8qIFF1ZXVlIG1hbmlwdWxhdGlvbiBmdW5jdGlvbnMgKi8N
Cj4gK3N0YXRpYyBib29sIHF1ZXVlX2Z1bGwoc3RydWN0IGFybV92c21tdV9xdWV1ZSAqcSkNCj4g
K3sNCj4gKyAgICByZXR1cm4gUV9JRFgocSwgcS0+cHJvZCkgPT0gUV9JRFgocSwgcS0+Y29ucykg
JiYNCj4gKyAgICAgICAgICAgUV9XUlAocSwgcS0+cHJvZCkgIT0gUV9XUlAocSwgcS0+Y29ucyk7
DQo+ICt9DQo+ICsNCj4gc3RhdGljIGJvb2wgcXVldWVfZW1wdHkoc3RydWN0IGFybV92c21tdV9x
dWV1ZSAqcSkNCj4gew0KPiAgICAgcmV0dXJuIFFfSURYKHEsIHEtPnByb2QpID09IFFfSURYKHEs
IHEtPmNvbnMpICYmDQo+IEBAIC0xMDEsMTEgKzEzOCwxMDUgQEAgc3RhdGljIHZvaWQgcXVldWVf
aW5jX2NvbnMoc3RydWN0IGFybV92c21tdV9xdWV1ZSAqcSkNCj4gICAgIHEtPmNvbnMgPSBRX09W
RihxLT5jb25zKSB8IFFfV1JQKHEsIGNvbnMpIHwgUV9JRFgocSwgY29ucyk7DQo+IH0NCj4gDQo+
ICtzdGF0aWMgdm9pZCBxdWV1ZV9pbmNfcHJvZChzdHJ1Y3QgYXJtX3ZzbW11X3F1ZXVlICpxKQ0K
PiArew0KPiArICAgIHUzMiBwcm9kID0gKFFfV1JQKHEsIHEtPnByb2QpIHwgUV9JRFgocSwgcS0+
cHJvZCkpICsgMTsNCj4gKyAgICBxLT5wcm9kID0gUV9PVkYocS0+cHJvZCkgfCBRX1dSUChxLCBw
cm9kKSB8IFFfSURYKHEsIHByb2QpOw0KPiArfQ0KPiArDQo+IHN0YXRpYyB2b2lkIGR1bXBfc21t
dV9jb21tYW5kKHVpbnQ2NF90ICpjb21tYW5kKQ0KPiB7DQo+ICAgICBnZHByaW50ayhYRU5MT0df
RVJSLCAiY21kIDB4JTAybGx4OiAlMDE2bHggJTAxNmx4XG4iLA0KPiAgICAgICAgICAgICAgc21t
dV9jbWRfZ2V0X2NvbW1hbmQoY29tbWFuZFswXSksIGNvbW1hbmRbMF0sIGNvbW1hbmRbMV0pOw0K
PiB9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGFybV92c21tdV9pbmplY3RfaXJxKHN0cnVjdCB2aXJ0
X3NtbXUgKnNtbXUsIGJvb2wgaXNfZ2Vycm9yLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCBnZXJyb3JfZXJyKQ0KPiArew0KPiArICAgIHVpbnQzMl90IG5ld19n
ZXJyb3JzLCBwZW5kaW5nOw0KPiArDQo+ICsgICAgaWYgKCBpc19nZXJyb3IgKQ0KPiArICAgIHsN
Cj4gKyAgICAgICAgLyogdHJpZ2dlciBnbG9iYWwgZXJyb3IgaXJxIHRvIGd1ZXN0ICovDQo+ICsg
ICAgICAgIHBlbmRpbmcgPSBzbW11LT5nZXJyb3IgXiBzbW11LT5nZXJyb3JuOw0KPiArICAgICAg
ICBuZXdfZ2Vycm9ycyA9IH5wZW5kaW5nICYgZ2Vycm9yX2VycjsNCj4gKw0KPiArICAgICAgICAv
KiBvbmx5IHRvZ2dsZSBub24gcGVuZGluZyBlcnJvcnMgKi8NCj4gKyAgICAgICAgaWYgKCFuZXdf
Z2Vycm9ycykNCg0KTklUOiBjb2Rlc3R5bGUsIHNwYWNlcyBpbnNpZGUgcGFyZW50aGVzZXMgDQoN
Cj4gKyAgICAgICAgICAgIHJldHVybjsNCj4gKw0KPiArICAgICAgICBzbW11LT5nZXJyb3IgXj0g
bmV3X2dlcnJvcnM7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgdmdpY19pbmplY3RfaXJxKHNtbXUt
PmQsIE5VTEwsIHNtbXUtPnZpcnEsIHRydWUpOw0KDQpJIGRvbuKAmXQgdW5kZXJzdGFuZCB0aGlz
LCBzaG91bGRu4oCZdCB3ZSBoYXZlIHRoZSBpcnEgbGV2ZWwgaGlnaCBvciBsb3cgZGVwZW5kaW5n
IG9uDQpldmVudCBxdWV1ZSBvciBnbG9iYWwgZXJyb3IgcGVuZGluZz8gQWxzbyB0aGlzIGRvZXNu
4oCZdCB0YWtlIGludG8gY29uc2lkZXJhdGlvbg0KaXJxIGVuYWJsZWQgKElSUV9DVFJMX0VWVFFf
SVJRRU4gLyBJUlFfQ1RSTF9HRVJST1JfSVJRRU4pDQoNCj4gK30NCj4gKw0KPiArc3RhdGljIGlu
dCBhcm1fdnNtbXVfd3JpdGVfZXZ0cShzdHJ1Y3QgdmlydF9zbW11ICpzbW11LCB1aW50NjRfdCAq
ZXZ0KQ0KPiArew0KPiArICAgIHN0cnVjdCBhcm1fdnNtbXVfcXVldWUgKnEgPSAmc21tdS0+ZXZ0
cTsNCj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gc21tdS0+ZDsNCj4gKyAgICBwYWRkcl90IGFk
ZHI7DQo+ICsgICAgaW50IHJldDsNCj4gKw0KPiArICAgIGlmICggIXNtbXVfZ2V0X2V2dHFfZW5h
YmxlZChzbW11LT5jclswXSkgKQ0KPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiAr
ICAgIGlmICggcXVldWVfZnVsbChxKSApDQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAr
DQo+ICsgICAgYWRkciA9IFFfUFJPRF9FTlQocSk7DQo+ICsgICAgcmV0ID0gYWNjZXNzX2d1ZXN0
X21lbW9yeV9ieV9ncGEoZCwgYWRkciwgZXZ0LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVvZigqZXZ0KSAqIEVWVFFfRU5UX0RXT1JEUywgdHJ1ZSk7DQo+ICsg
ICAgaWYgKCByZXQgKQ0KPiArICAgICAgICByZXR1cm4gcmV0Ow0KPiArDQo+ICsgICAgcXVldWVf
aW5jX3Byb2QocSk7DQo+ICsNCj4gKyAgICAvKiB0cmlnZ2VyIGV2ZW50cSBpcnEgdG8gZ3Vlc3Qg
Ki8NCj4gKyAgICBpZiAoICFxdWV1ZV9lbXB0eShxKSApDQo+ICsgICAgICAgIGFybV92c21tdV9p
bmplY3RfaXJxKHNtbXUsIGZhbHNlLCAwKTsNCj4gKw0KPiArICAgIHJldHVybiAwOw0KPiArfQ0K
PiArDQo+ICt2b2lkIGFybV92c21tdV9zZW5kX2V2ZW50KHN0cnVjdCB2aXJ0X3NtbXUgKnNtbXUs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhcm1fc21tdV9ldnRxX2VudCAq
ZW50KQ0KPiArew0KPiArICAgIHVpbnQ2NF90IGV2dFtFVlRRX0VOVF9EV09SRFNdOw0KPiArICAg
IGludCByZXQ7DQo+ICsNCj4gKyAgICBtZW1zZXQoZXZ0LCAwLCAxIDw8IEVWVFFfRU5UX1NaX1NI
SUZUKTsNCj4gKw0KPiArICAgIGlmICggIXNtbXVfZ2V0X2V2dHFfZW5hYmxlZChzbW11LT5jclsw
XSkgKQ0KPiArICAgICAgICByZXR1cm47DQo+ICsNCj4gKyAgICBldnRbMF0gfD0gRklFTERfUFJF
UChFVlRRXzBfSUQsIGVudC0+b3Bjb2RlKTsNCj4gKyAgICBldnRbMF0gfD0gRklFTERfUFJFUChF
VlRRXzBfU0lELCBlbnQtPnNpZCk7DQo+ICsNCj4gKyAgICBzd2l0Y2ggKGVudC0+b3Bjb2RlKQ0K
DQpOSVQ6IGNvZGVzdHlsZSwgc3BhY2VzIGluc2lkZSBwYXJlbnRoZXNlcyANCg0KPiArICAgIHsN
Cj4gKyAgICBjYXNlIEVWVF9JRF9CQURfU1RSRUFNSUQ6DQo+ICsgICAgY2FzZSBFVlRfSURfQkFE
X1NURToNCj4gKyAgICAgICAgZXZ0WzBdIHw9IEZJRUxEX1BSRVAoRVZUUV8wX1NTSUQsIGVudC0+
Y19iYWRfc3RlX3N0cmVhbWlkLnNzaWQpOw0KPiArICAgICAgICBldnRbMF0gfD0gRklFTERfUFJF
UChFVlRRXzBfU1NWLCBlbnQtPmNfYmFkX3N0ZV9zdHJlYW1pZC5zc3YpOw0KPiArICAgICAgICBi
cmVhazsNCj4gKyAgICBjYXNlIEVWVF9JRF9UUkFOU0xBVElPTl9GQVVMVDoNCj4gKyAgICBjYXNl
IEVWVF9JRF9BRERSX1NJWkVfRkFVTFQ6DQo+ICsgICAgY2FzZSBFVlRfSURfQUNDRVNTX0ZBVUxU
Og0KPiArICAgIGNhc2UgRVZUX0lEX1BFUk1JU1NJT05fRkFVTFQ6DQo+ICsgICAgICAgIGJyZWFr
Ow0KPiArICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAi
dlNNTVV2MzogZXZlbnQgb3Bjb2RlIGlzIGJhZFxuIik7DQo+ICsgICAgICAgIGJyZWFrOw0KPiAr
ICAgIH0NCj4gKw0KPiArICAgIHJldCA9IGFybV92c21tdV93cml0ZV9ldnRxKHNtbXUsIGV2dCk7
DQo+ICsgICAgaWYgKCByZXQgKQ0KPiArICAgICAgICBhcm1fdnNtbXVfaW5qZWN0X2lycShzbW11
LCB0cnVlLCBHRVJST1JfRVZUUV9BQlRfRVJSKTsNCj4gKw0KPiArICAgIHJldHVybjsNCj4gK30N
Cj4gKw0KPiBzdGF0aWMgaW50IGFybV92c21tdV9maW5kX3N0ZShzdHJ1Y3QgdmlydF9zbW11ICpz
bW11LCB1aW50MzJfdCBzaWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2
NF90ICpzdGUpDQo+IHsNCj4gQEAgLTExNCwxMSArMjQ1LDIyIEBAIHN0YXRpYyBpbnQgYXJtX3Zz
bW11X2ZpbmRfc3RlKHN0cnVjdCB2aXJ0X3NtbXUgKnNtbXUsIHVpbnQzMl90IHNpZCwNCj4gICAg
IHVpbnQzMl90IGxvZzJzaXplOw0KPiAgICAgaW50IHN0cnRhYl9zaXplX3NoaWZ0Ow0KPiAgICAg
aW50IHJldDsNCj4gKyAgICBzdHJ1Y3QgYXJtX3NtbXVfZXZ0cV9lbnQgZW50ID0gew0KPiArICAg
ICAgICAuc2lkID0gc2lkLA0KPiArICAgICAgICAuY19iYWRfc3RlX3N0cmVhbWlkID0gew0KPiAr
ICAgICAgICAgICAgLnNzaWQgPSAwLA0KPiArICAgICAgICAgICAgLnNzdiA9IGZhbHNlLA0KPiAr
ICAgICAgICB9LA0KPiArICAgIH07DQo+IA0KPiAgICAgbG9nMnNpemUgPSBGSUVMRF9HRVQoU1RS
VEFCX0JBU0VfQ0ZHX0xPRzJTSVpFLCBzbW11LT5zdHJ0YWJfYmFzZV9jZmcpOw0KPiANCj4gICAg
IGlmICggc2lkID49ICgxIDw8IE1JTihsb2cyc2l6ZSwgU01NVV9JRFIxX1NJRFNJWkUpKSApDQo+
ICsgICAgew0KPiArICAgICAgICBlbnQub3Bjb2RlID0gRVZUX0lEX0JBRF9TVEU7DQo+ICsgICAg
ICAgIGFybV92c21tdV9zZW5kX2V2ZW50KHNtbXUsICZlbnQpOw0KPiAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiArICAgIH0NCj4gDQo+ICAgICBpZiAoIHNtbXUtPmZlYXR1cmVzICYgU1RSVEFC
X0JBU0VfQ0ZHX0ZNVF8yTFZMICkNCj4gICAgIHsNCj4gQEAgLTE1Niw2ICsyOTgsOCBAQCBzdGF0
aWMgaW50IGFybV92c21tdV9maW5kX3N0ZShzdHJ1Y3QgdmlydF9zbW11ICpzbW11LCB1aW50MzJf
dCBzaWQsDQo+ICAgICAgICAgew0KPiAgICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAi
aWR4PSVkID4gbWF4X2wyX3N0ZT0lZFxuIiwNCj4gICAgICAgICAgICAgICAgICAgICAgaWR4LCBt
YXhfbDJfc3RlKTsNCj4gKyAgICAgICAgICAgIGVudC5vcGNvZGUgPSBFVlRfSURfQkFEX1NUUkVB
TUlEOw0KPiArICAgICAgICAgICAgYXJtX3ZzbW11X3NlbmRfZXZlbnQoc21tdSwgJmVudCk7DQo+
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICAgICAgIH0NCj4gICAgICAgICBhZGRy
ID0gbDJwdHIgKyBpZHggKiBzaXplb2YoKnN0ZSkgKiBTVFJUQUJfU1RFX0RXT1JEUzsNCj4gQEAg
LTE4Myw2ICszMjcsMTQgQEAgc3RhdGljIGludCBhcm1fdnNtbXVfZGVjb2RlX3N0ZShzdHJ1Y3Qg
dmlydF9zbW11ICpzbW11LCB1aW50MzJfdCBzaWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDY0X3QgKnN0ZSkNCj4gew0KPiAgICAgdWludDY0X3QgdmFsID0gc3RlWzBd
Ow0KPiArICAgIHN0cnVjdCBhcm1fc21tdV9ldnRxX2VudCBlbnQgPSB7DQo+ICsgICAgICAgIC5v
cGNvZGUgPSBFVlRfSURfQkFEX1NURSwNCj4gKyAgICAgICAgLnNpZCA9IHNpZCwNCj4gKyAgICAg
ICAgLmNfYmFkX3N0ZV9zdHJlYW1pZCA9IHsNCj4gKyAgICAgICAgICAgIC5zc2lkID0gMCwNCj4g
KyAgICAgICAgICAgIC5zc3YgPSBmYWxzZSwNCj4gKyAgICAgICAgfSwNCj4gKyAgICB9Ow0KPiAN
Cj4gICAgIGlmICggISh2YWwgJiBTVFJUQUJfU1RFXzBfVikgKQ0KPiAgICAgICAgIHJldHVybiAt
RUFHQUlOOw0KPiBAQCAtMjE3LDYgKzM2OSw3IEBAIHN0YXRpYyBpbnQgYXJtX3ZzbW11X2RlY29k
ZV9zdGUoc3RydWN0IHZpcnRfc21tdSAqc21tdSwgdWludDMyX3Qgc2lkLA0KPiAgICAgcmV0dXJu
IDA7DQo+IA0KPiBiYWRfc3RlOg0KPiArICAgIGFybV92c21tdV9zZW5kX2V2ZW50KHNtbXUsICZl
bnQpOw0KPiAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IH0NCj4gDQo+IEBAIC01NzcsNyArNzMwLDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtbWlvX2hhbmRsZXJfb3BzIHZzbW11djNfbW1pb19oYW5k
bGVyID0gew0KPiAgICAgLndyaXRlID0gdnNtbXV2M19tbWlvX3dyaXRlLA0KPiB9Ow0KPiANCj4g
LXN0YXRpYyBpbnQgdnNtbXV2M19pbml0X3NpbmdsZShzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90
IGFkZHIsIHBhZGRyX3Qgc2l6ZSkNCj4gK3N0YXRpYyBpbnQgdnNtbXV2M19pbml0X3NpbmdsZShz
dHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGFkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFkZHJfdCBzaXplLCB1aW50MzJfdCB2aXJxKQ0KPiB7DQo+ICAgICBzdHJ1Y3Qg
dmlydF9zbW11ICpzbW11Ow0KPiANCj4gQEAgLTU4Niw2ICs3NDAsNyBAQCBzdGF0aWMgaW50IHZz
bW11djNfaW5pdF9zaW5nbGUoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBhZGRyLCBwYWRkcl90
IHNpemUpDQoNCldlIGFyZSBub3cgaW5qZWN0aW5nIGlycXMgZHVlIHRvIHRoaXMgcGF0Y2gsIHdl
IHNob3VsZCB2Z2ljX3Jlc2VydmVfdmlycSgpIGl0IGFzIHdlIGRvIGluIHBhdGNoDQrigJx4ZW4v
YXJtOiB2c21tdXYzOiBBbGxvYyB2aXJxIGZvciB2aXJ0dWFsIFNNTVV2M+KAnSwgc28gbWF5YmUg
YmV0dGVyIHRvIG1vdmUgdGhlc2UgY2hhbmdlcyBoZXJlLg0KDQo+ICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07DQo+IA0KPiAgICAgc21tdS0+ZCA9IGQ7DQo+ICsgICAgc21tdS0+dmlycSA9IHZpcnE7
DQo+ICAgICBzbW11LT5jbWRxLnFfYmFzZSA9IEZJRUxEX1BSRVAoUV9CQVNFX0xPRzJTSVpFLCBT
TU1VX0NNRFFTKTsNCj4gICAgIHNtbXUtPmNtZHEuZW50X3NpemUgPSBDTURRX0VOVF9EV09SRFMg
KiBEV09SRFNfQllURVM7DQo+ICAgICBzbW11LT5ldnRxLnFfYmFzZSA9IEZJRUxEX1BSRVAoUV9C
QVNFX0xPRzJTSVpFLCBTTU1VX0VWVFFTKTsNCj4gQEAgLTYxMiwxNCArNzY3LDE2IEBAIGludCBk
b21haW5fdnNtbXV2M19pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+IA0KPiAgICAgICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnkoaHdfaW9tbXUsICZob3N0X2lvbW11X2xpc3QsIGVudHJ5KQ0KPiAgICAg
ICAgIHsNCj4gLSAgICAgICAgICAgIHJldCA9IHZzbW11djNfaW5pdF9zaW5nbGUoZCwgaHdfaW9t
bXUtPmFkZHIsIGh3X2lvbW11LT5zaXplKTsNCj4gKyAgICAgICAgICAgIHJldCA9IHZzbW11djNf
aW5pdF9zaW5nbGUoZCwgaHdfaW9tbXUtPmFkZHIsIGh3X2lvbW11LT5zaXplLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod19pb21tdS0+aXJxKTsNCj4gICAgICAg
ICAgICAgaWYgKCByZXQgKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gICAgICAg
ICB9DQo+ICAgICB9DQo+ICAgICBlbHNlDQo+ICAgICB7DQo+IC0gICAgICAgIHJldCA9IHZzbW11
djNfaW5pdF9zaW5nbGUoZCwgR1VFU1RfVlNNTVVWM19CQVNFLCBHVUVTVF9WU01NVVYzX1NJWkUp
Ow0KPiArICAgICAgICByZXQgPSB2c21tdXYzX2luaXRfc2luZ2xlKGQsIEdVRVNUX1ZTTU1VVjNf
QkFTRSwgR1VFU1RfVlNNTVVWM19TSVpFLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEdVRVNUX1ZTTU1VX1NQSSk7DQo+ICAgICAgICAgaWYgKCByZXQgKQ0KPiAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPiAgICAgfQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVi
bGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPiBpbmRleCBl
YmFjMDJlZDYzLi4xYjYwNmUyMGZkIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPiBAQCAt
NTI3LDkgKzUyNywxMCBAQCB0eXBlZGVmIHVpbnQ2NF90IHhlbl9jYWxsYmFja190Ow0KPiAjZGVm
aW5lIEdVRVNUX0VWVENITl9QUEkgICAgICAgIDMxDQo+IA0KPiAjZGVmaW5lIEdVRVNUX1ZQTDAx
MV9TUEkgICAgICAgIDMyDQo+ICsjZGVmaW5lIEdVRVNUX1ZTTU1VX1NQSSAgICAgICAgIDMzDQoN
ClRoaXMgY2hhbmdlIGFsb25lIGJyZWFrcyBhbHJlYWR5IGJ1aWx0IHRvb2xzdGFjaywgY2FuIHdl
IGp1c3QNCmhhdmUgR1VFU1RfVlNNTVVfU1BJIGFzIDQ0IGFuZCBsZWF2ZSBHVUVTVF9WSVJUSU9f
TU1JT19TUElfRklSU1QgYW5kDQpHVUVTVF9WSVJUSU9fTU1JT19TUElfTEFTVCBhcyB0aGV5IGFy
ZT8NCg0KPiANCj4gLSNkZWZpbmUgR1VFU1RfVklSVElPX01NSU9fU1BJX0ZJUlNUICAgMzMNCj4g
LSNkZWZpbmUgR1VFU1RfVklSVElPX01NSU9fU1BJX0xBU1QgICAgNDMNCj4gKyNkZWZpbmUgR1VF
U1RfVklSVElPX01NSU9fU1BJX0ZJUlNUICAgMzQNCj4gKyNkZWZpbmUgR1VFU1RfVklSVElPX01N
SU9fU1BJX0xBU1QgICAgNDQNCj4gDQo+IC8qDQo+ICAqIFNHSSBpcyB0aGUgcHJlZmVycmVkIGRl
bGl2ZXJ5IG1lY2hhbmlzbSBvZiBGRi1BIHBlbmRpbmcgbm90aWZpY2F0aW9ucyBvcg0KPiANCg0K
Q2hlZXJzLA0KTHVjYQ0KDQo=

