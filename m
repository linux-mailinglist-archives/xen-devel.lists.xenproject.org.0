Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P7UOHmN72l5CwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 18:23:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F454764A9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 18:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295107.1571803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOji-0008Gn-U9; Mon, 27 Apr 2026 16:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295107.1571803; Mon, 27 Apr 2026 16:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHOji-0008EE-RS; Mon, 27 Apr 2026 16:23:06 +0000
Received: by outflank-mailman (input) for mailman id 1295107;
 Mon, 27 Apr 2026 16:23:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wHOjh-0008E8-9N
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 16:23:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHOjg-00GLJB-M9
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 18:23:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef8d5b-5cb7-0a2a0a5109dd-0a2a4506c4b2-26
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:23:04 +0200
Received: from [52.101.84.4]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef8d67-7371-0a2a45060019-346554049556-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 18:23:04 +0200
Received: from CWLP123CA0198.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::7)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Mon, 27 Apr
 2026 16:22:57 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:400:19c:cafe::2) by CWLP123CA0198.outlook.office365.com
 (2603:10a6:400:19c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:22:57 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 16:22:56 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VI1PR08MB10175.eurprd08.prod.outlook.com (2603:10a6:800:1cf::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:21:53 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 16:21:52 +0000
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
 b=Q3Z4jdj2Ep7i8JFoONpMhF7/kmZvI7151xIY8AcnPGq7ADaUQxVdCVyg4O2xwW289Y0IOYhFX5q0RRfaQU90Ywyd/CTUz+Yfc395w26rLgfB2qCHlVSUURGhppAo1qSVRZZrdVgTVTxnCPXTimj3991TF+jhl5XPcEMTWuet393aajpbCRIX5RsWu0P9AO7t+O9iQ8L+zKeWphquakvtBdJDA/FnKQ/ZrXMhfKoSv2tCNXlbMlvbPYX8c0P9dA2daPRIozbxvBC1ZGu33FKd0OpMmKQtoa8QAyEfXUpULjyc93g6H3HtNJbkFMGWY+k5gWydagMP0R4keabdtZ7YZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6gIRLO1eJ9UZpSI0qnIDNhpPqQWrIfJvf2DHz3O8ik=;
 b=KlqMPBjmp8UnjtoTVRUeQfk7O2phZT9fG+qPpEnZibM3Wow9RUkPhsN91KCIFsTIrAdZaFj2i+GEIk+AIhkWM+COfOca8ghyX9EZtgY/uWjAUGGQrfvcdy60ys13nBr84I7+Ngqb9t2KJDw6RGWdCOXMvbDQY7p3RIE4hYYUy2i5TL/y1e1Bm9Znj9HQDJEtwemWGFdQNDCuZY5ANdk0aUyp0q0yitYWboPZFWuheReW9rn+9jgo4zd/ZZ1d8bQPki8edWBl0Oyy3YahL9S3CVFhW7jlBOvQlSVFOn9Lra6G+r0+lWhpEV9eGiVxh1alIvADP/r8G6tsmqMMfCVsuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6gIRLO1eJ9UZpSI0qnIDNhpPqQWrIfJvf2DHz3O8ik=;
 b=oiSABdfWlA+0V7WSQGvSeIk7XQLQHw5kXYkN5YtT+E19w5iDkzwx25AQkK+svsjSDHHJtHCuX+yIeLNAMA/rE3DFdxNnZutQjQmZZM3yLAxSEvbdQ61FjSzR8DjFwY88atTxI3+Qbt6/xvSbKoxuZ82qzI3aQtOIYgiGzxMFEtk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnitQg57B6xQj3kLNthMMH6u63rnCm6bfC0bl6I5lYLXDYNYo6P8kPv8yMxdWLmBcn2XmIJWPG7pTL4Slj18WUVvFTskXK8F4O2E/vZK7OcR4FoEvVvoLKxTctMehrhVyC7Bs5SKnq1P7pXZgsbLJDW3Zr8SeS0F/ar8nOwrGO3bal6Af5jHT5pnRi1AcKhybOb0oA+JvZBM8r2yUU5vs+cK59Ihl97ovrVkMG04hV/EFRplii4QCDyMBQxXJPESry2kF02RapvdNfz5yz1kl5MEoLj+LxmtXvG13IE/q4PWdfMKxvj0HhjgLR14v5f/P3ts4UWpTYqiHs5/GE+wxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6gIRLO1eJ9UZpSI0qnIDNhpPqQWrIfJvf2DHz3O8ik=;
 b=hplENScueZqeNthdSQ2QnGqKHoY9io1Se04Hj/AvQ55cM7cQ1TN7xhPR8QQ06xHpz7BSD+1SKHMQCW5L5JQ3cIT2lxQzNJvYa0DIwNbuDT6fnxe75U5xHzx/LVYtoi9bzLl0HZh4JLt6ANmrp/rfgzw6g2bZPVtToV6TBPmykg4L+xBrpvNrI+HC67D0Yhu0z8BzcmPZ7EBWcSUswPpeSNUcJy5bRENojRb130OJxTUsyXRP85EUdYLZhZ3ZrdYEXrkrZDVnhddiu565Alj2TuxlPo1FYbzMFhtQGi9wlXRSo7XxKClIl+8xCCOSJFRnwwRgG+FdBLlnpdvNkJfrag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6gIRLO1eJ9UZpSI0qnIDNhpPqQWrIfJvf2DHz3O8ik=;
 b=oiSABdfWlA+0V7WSQGvSeIk7XQLQHw5kXYkN5YtT+E19w5iDkzwx25AQkK+svsjSDHHJtHCuX+yIeLNAMA/rE3DFdxNnZutQjQmZZM3yLAxSEvbdQ61FjSzR8DjFwY88atTxI3+Qbt6/xvSbKoxuZ82qzI3aQtOIYgiGzxMFEtk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 12/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Topic: [PATCH v8 12/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
Thread-Index: AQHc1mH01Xi7Oshm5kSQrRtdQMIF/g==
Date: Mon, 27 Apr 2026 16:21:52 +0000
Message-ID: <A0DD6517-9EFB-4DA3-85E6-91771BC23553@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <8767d4129cd5bc56086172e58320539be7da4059.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <8767d4129cd5bc56086172e58320539be7da4059.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VI1PR08MB10175:EE_|AM1PEPF000252E1:EE_|DB8PR08MB5371:EE_
X-MS-Office365-Filtering-Correlation-Id: 74738d77-2a76-41d0-5e41-08dea4793da3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 BNjdjhiTYH9z4Y3K18lDbw9vSWDpo/PzI87fZxfypdKb5ZKpPTtx7UN6g8/JtZWE39363uV8q+eDyVp/y7MIzqyCHKsJlmqg5aZR9Jkn+Xi+jmQ6Gq9CLeIMh+8IOIZoU73UsPnXbizerFIEM/OFpj0UpRQymTMAqP+dPDatVHwcUABOLgB86Ui2Z/fzyUX7VCHWyoImRlghrZ509pZvDywgYyYnM8i36WXDyqYDpb+ufXN6Luh1qpNeUYYjNMiuKeXcBDIw/hj1gxbdRi4Krx1R492gJvCEdHKl2XyVSV4jfGkiXe+2L12zO4bhPqFKDBPHwq9JDKm18LwurR8kI7WWm+XBhVcXcQpdSo2N3yxo270TvE9jyZWVqtWwPmz0gUtjm0L6iO/MrTul9FJcJRlka1Z2V95pZDMjtypGFSuIetlH6z6PHBhTqQ9Oh2udWeAC/RGnoiOom+r282/PafoU63bIGSPyBxC3cpPAjKpFymvgwUcd/nXFy/VsozGGYVQT/FaqvvGC1ga5CxR+MeWWj0zv6+2I+sQl5DJFY9iX9L0k+o1crvYF9YmJWNgXMiq+w431ELKoytr5BFwiyKLSAYcHcd+3MWlIJ9GzSYOrNw8rexzoLV6DwVSeb/qDwzvegxP1VWNCL54P7FPAt4BSP+E31I7rrvkrVRmxZbEa9qc2O+ymeoivBmyzfgp5FyS1va2EV72DV7ny1/FrRAFv63mopaPuQmfxxEScOOKOgaHcsKpEwgxeVGuFCOcZnYqHu5cHYiF72cuf2NOe8jn2a8ep4hEIiAB/YFPQlww=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <017FC4C666346145866B8490B66C9CEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nCm+UlEm3dW7bVQ0qzc8kDK3DdNlAE6ZW+xG4aR0DP05cOQ0zFzbIaBLVPy6k2JSmTZdGhi8LsOmbL+H+Mhk41zEprkYOHpFmGg4G5QZX/E3UTBptKt1EcRkGf6B4FJW2EAs9xra//WN4wtuZJmfg+6xpD0m06uDgn8kLwK4o4S+lC3ncwtZ1Qrfn+iIrRIryWa9nCS3sOj4pE6DVlzeKV3wIcskE9bqLxgn0EusUF3Dbn4WjZg5l3cI+iDm2Jjbs4tJc7zJQ645FZRJ4DpUZX/j4A2MkdhySDE3lDlbmM27fPmAgQbSd74XTa+YV7hejmVkfNSpK1oztWDmIpaLFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10175
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e6b23eb-6187-4a15-7cad-08dea47917aa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|1800799024|376014|82310400026|14060799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NtsSH/0RnCAo0mM40Y93J/9OOsdNu076J6agCTY8FrK0nN5ZEyWo/mwdOdSHq+kAV9/Gb58H1v8F7lNfE3XJAvxFXdMYebuXCCFYAPeFO+iFFRsQ1Ls7u7PCCN8TeIAFJ4/Dz3DH2PyJ61XEiVpYoyObwNDUR4a+29pjC2Jdx3RA+/XY7s9tblZVv/q4Xm22m1dfYNeSSegF9PEG7/dqOryfkjVeZkabHDfTPgzvj5WFFDMYD+v/+GPEBpVfu2djpMl82xkTlLzaPJrH23wioVhZ+l53sXGBmUm0u+f4gdWoBRUesOtioK7ChO3ZxxH1DMJyucoOmsvOvNoGN4ZdJi2ue1l9ko1q3u/jar0oNr9K96X86lrkCbf5rDtL3Mfn/+ZtcNQCNSkuryXWV8A0NK8IaN9NQFiv9Jdz9+GO8tZNa6Wg/mDYHZMgF6G6M3sY+b579pnZDd+L+2CkrYQGCd/hQaPfStqS6vaXBBzpzq0W/XsDbZb/OIpdqeS/NxtTqoWr4GNmt5dtHriCTd+Tdb/scPISKqWHAN++JX5Vz/bkLA7C9B98Q0Oucf7nyh3KZtu/zandDL3l+IP7RTo1RBXRNg813x5SlsteI/t7Uq91yQtE5Eq1dbmtxdhNlnAMvAaVXPr5c7GqM4qRi+N27wKoJFuLtjH7QtYJyjvqdlJQL1voVIzE5iEXAf57v8wltNUNpB6I3DiGNpNhkY9qn05Krm10YPt4eCSktdYWXkka8N0tXDrN2BxybFdeQQ4HGQKHbyiSwF1UX8L+JBNsyw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(1800799024)(376014)(82310400026)(14060799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	woyH9E03yzehuKA0Dc5TA/ygparVd7Omn4FMjLP54ufwyCNdvXc96Sh29wj1wyLzTNAJ7Attvxcy1eiYwoFzPBJ8Awkk6XCSufydbp5OUpzQTmyeePrgsDhQi/6GK+T6F9p9Uq7km06iaFXZR1qnXC8Fx+QqgjdblrMPkSGQE99qfI8gTjMRUSJ3q1emrCcdtcT0ZpuH9W5Ak10KU/V0N0pH/N+51YPK848/mUwr01Ae+wP/UPY6gRT29k0gMZWrQqlNzI57v1O2r3E2dXTXsxWIudo6Y4ycMIYXg27hCZ6kt00UQqi9uTDzLlOwTpRuuLHpQFX0gJXRvwunbI/7r/rBDjyHUxc5qRYkvq3svcvOiwQfK1PdrqjaakU1eD2lJrgM8RKey5ehly6cXv2eijtNRtUr39XkjbtzyipYZ78fYd7jHSeYUL4FEnHAaQXW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:22:56.4335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74738d77-2a76-41d0-5e41-08dea4793da3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371
X-purgate-ID: tlsNG-16d1c6/1777306984-90A7ED75-9720B7E8/0/0
X-purgate-type: clean
X-purgate-size: 4530
X-Rspamd-Queue-Id: 39F454764A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,epam.com:email,aggios.com:email]

SGkgTXlrb2xhLA0KDQo+IE9uIDIgQXByIDIwMjYsIGF0IDExOjQ1LCBNeWtvbGEgS3ZhY2ggPHhh
a2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gRnJvbTogTWlyZWxhIFNpbW9ub3Zp
YyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPg0KPiANCj4gSW52b2tlIFBTQ0kgU1lTVEVN
X1NVU1BFTkQgdG8gZmluYWxpemUgWGVuJ3Mgc3VzcGVuZCBzZXF1ZW5jZSBvbiBBUk02NCBwbGF0
Zm9ybXMuDQo+IFBhc3MgdGhlIHJlc3VtZSBlbnRyeSBwb2ludCAoaHlwX3Jlc3VtZSkgYXMgdGhl
IGZpcnN0IGFyZ3VtZW50IHRvIEVMMy4gVGhlIHJlc3VtZQ0KPiBoYW5kbGVyIGlzIGN1cnJlbnRs
eSBhIHN0dWIgYW5kIHdpbGwgYmUgaW1wbGVtZW50ZWQgbGF0ZXIgaW4gYXNzZW1ibHkuIElnbm9y
ZSB0aGUNCj4gY29udGV4dCBJRCBhcmd1bWVudCwgYXMgaXMgZG9uZSBpbiBMaW51eC4NCj4gDQo+
IE9ubHkgZW5hYmxlIHRoaXMgcGF0aCB3aGVuIENPTkZJR19TWVNURU1fU1VTUEVORCBpcyBzZXQg
YW5kDQo+IFBTQ0kgdmVyc2lvbiBpcyA+PSAxLjAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXJl
bGEgU2ltb25vdmljIDxtaXJlbGEuc2ltb25vdmljQGFnZ2lvcy5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFNhZWVkIE5vd3NoYWRpIDxzYWVlZC5ub3dzaGFkaUB4aWxpbnguY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBNeWt5dGEgUG90dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KPiAtLS0NCj4g
Q2hhbmdlcyBpbiB2NzoNCj4gLSBubyBjaGFuZ2VzDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vcHNjaS5oIHwgIDEgKw0KPiB4ZW4vYXJjaC9hcm0vcHNjaS5jICAgICAgICAgICAg
IHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3BzY2kuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wc2NpLmgNCj4g
aW5kZXggNDhhOTNlNmI3OS4uYmIzYzczNDk2ZSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3BzY2kuaA0KPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcHNj
aS5oDQo+IEBAIC0yMyw2ICsyMyw3IEBAIGludCBjYWxsX3BzY2lfY3B1X29uKGludCBjcHUpOw0K
PiB2b2lkIGNhbGxfcHNjaV9jcHVfb2ZmKHZvaWQpOw0KPiB2b2lkIGNhbGxfcHNjaV9zeXN0ZW1f
b2ZmKHZvaWQpOw0KPiB2b2lkIGNhbGxfcHNjaV9zeXN0ZW1fcmVzZXQodm9pZCk7DQo+ICtpbnQg
Y2FsbF9wc2NpX3N5c3RlbV9zdXNwZW5kKHZvaWQpOw0KPiANCj4gLyogUmFuZ2Ugb2YgYWxsb2Nh
dGVkIFBTQ0kgZnVuY3Rpb24gbnVtYmVycyAqLw0KPiAjZGVmaW5lIFBTQ0lfRk5VTV9NSU5fVkFM
VUUgICAgICAgICAgICAgICAgIF9BQygwLFUpDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cHNjaS5jIGIveGVuL2FyY2gvYXJtL3BzY2kuYw0KPiBpbmRleCBiNjg2MGE3NzYwLi5jOWQxMjZi
MTk1IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vcHNjaS5jDQo+ICsrKyBiL3hlbi9hcmNo
L2FybS9wc2NpLmMNCj4gQEAgLTE3LDE3ICsxNywyMCBAQA0KPiAjaW5jbHVkZSA8YXNtL2NwdWZl
YXR1cmUuaD4NCj4gI2luY2x1ZGUgPGFzbS9wc2NpLmg+DQo+ICNpbmNsdWRlIDxhc20vYWNwaS5o
Pg0KPiArI2luY2x1ZGUgPGFzbS9zdXNwZW5kLmg+DQo+IA0KPiAvKg0KPiAgKiBXaGlsZSBhIDY0
LWJpdCBPUyBjYW4gbWFrZSBjYWxscyB3aXRoIFNNQzMyIGNhbGxpbmcgY29udmVudGlvbnMsIGZv
cg0KPiAgKiBzb21lIGNhbGxzIGl0IGlzIG5lY2Vzc2FyeSB0byB1c2UgU01DNjQgdG8gcGFzcyBv
ciByZXR1cm4gNjQtYml0IHZhbHVlcy4NCj4gLSAqIEZvciBzdWNoIGNhbGxzIFBTQ0lfMF8yX0ZO
X05BVElWRSh4KSB3aWxsIGNob29zZSB0aGUgYXBwcm9wcmlhdGUNCj4gKyAqIEZvciBzdWNoIGNh
bGxzIFBTQ0lfKl9GTl9OQVRJVkUoeCkgd2lsbCBjaG9vc2UgdGhlIGFwcHJvcHJpYXRlDQo+ICAq
IChuYXRpdmUtd2lkdGgpIGZ1bmN0aW9uIElELg0KPiAgKi8NCj4gI2lmZGVmIENPTkZJR19BUk1f
NjQNCj4gI2RlZmluZSBQU0NJXzBfMl9GTl9OQVRJVkUobmFtZSkgICAgUFNDSV8wXzJfRk42NF8j
I25hbWUNCj4gKyNkZWZpbmUgUFNDSV8xXzBfRk5fTkFUSVZFKG5hbWUpICAgIFBTQ0lfMV8wX0ZO
NjRfIyNuYW1lDQo+ICNlbHNlDQo+ICNkZWZpbmUgUFNDSV8wXzJfRk5fTkFUSVZFKG5hbWUpICAg
IFBTQ0lfMF8yX0ZOMzJfIyNuYW1lDQo+ICsjZGVmaW5lIFBTQ0lfMV8wX0ZOX05BVElWRShuYW1l
KSAgICBQU0NJXzFfMF9GTjMyXyMjbmFtZQ0KPiAjZW5kaWYNCj4gDQo+IHVpbnQzMl90IHBzY2lf
dmVyOw0KPiBAQCAtNjAsNiArNjMsMjQgQEAgdm9pZCBjYWxsX3BzY2lfY3B1X29mZih2b2lkKQ0K
PiAgICAgfQ0KPiB9DQo+IA0KPiAraW50IGNhbGxfcHNjaV9zeXN0ZW1fc3VzcGVuZCh2b2lkKQ0K
PiArew0KPiArI2lmZGVmIENPTkZJR19TWVNURU1fU1VTUEVORA0KPiArICAgIHN0cnVjdCBhcm1f
c21jY2NfcmVzIHJlczsNCj4gKw0KPiArICAgIGlmICggcHNjaV92ZXIgPCBQU0NJX1ZFUlNJT04o
MSwgMCkgKQ0KPiArICAgICAgICByZXR1cm4gUFNDSV9OT1RfU1VQUE9SVEVEOw0KPiArDQo+ICsg
ICAgLyogMm5kIGFyZ3VtZW50IChjb250ZXh0IElEKSBpcyBub3QgdXNlZCAqLw0KPiArICAgIGFy
bV9zbWNjY19zbWMoUFNDSV8xXzBfRk5fTkFUSVZFKFNZU1RFTV9TVVNQRU5EKSwgX19wYShoeXBf
cmVzdW1lKSwgJnJlcyk7DQoNCkkgdGhpbmsgTGludXggaXMgcGFzc2luZyAwIGFzIGNvbnRleHQg
SUQsIHByb2JhYmx5IHRvIG1hcmsgdGhhdCBpdOKAmXMgbm90IHVzZWQsIEkgdGhpbmsgd2Ugc2hv
dWxkIGRvIHRoZQ0Kc2FtZQ0KDQo+ICsgICAgcmV0dXJuIFBTQ0lfUkVUKHJlcyk7DQo+ICsjZWxz
ZQ0KPiArICAgIGRwcmludGsoWEVOTE9HX1dBUk5JTkcsDQo+ICsgICAgICAgICAgICAiU1lTVEVN
X1NVU1BFTkQgbm90IHN1cHBvcnRlZCAoQ09ORklHX1NZU1RFTV9TVVNQRU5EIGRpc2FibGVkKVxu
Iik7DQo+ICsgICAgcmV0dXJuIFBTQ0lfTk9UX1NVUFBPUlRFRDsNCj4gKyNlbmRpZg0KPiArfQ0K
PiArDQo+IHZvaWQgY2FsbF9wc2NpX3N5c3RlbV9vZmYodm9pZCkNCj4gew0KPiAgICAgaWYgKCBw
c2NpX3ZlciA+IFBTQ0lfVkVSU0lPTigwLCAxKSApDQo+IA0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K
DQo=

