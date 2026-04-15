Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LSAOL2h32mBXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 16:33:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03964405544
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 16:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282554.1565114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1I7-0004y2-4R; Wed, 15 Apr 2026 14:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282554.1565114; Wed, 15 Apr 2026 14:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1I7-0004wa-14; Wed, 15 Apr 2026 14:32:31 +0000
Received: by outflank-mailman (input) for mailman id 1282554;
 Wed, 15 Apr 2026 14:32:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD1I5-0004wU-AA
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 14:32:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD1I4-00ApuF-Fm
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 16:32:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa17a-bab6-0a2a0a5309dd-0a2a45098a7a-4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 16:32:28 +0200
Received: from [52.101.83.63]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa17b-bf79-0a2a45090019-3465533f570b-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 16:32:28 +0200
Received: from DU2PR04CA0299.eurprd04.prod.outlook.com (2603:10a6:10:28c::34)
 by AS8PR08MB8160.eurprd08.prod.outlook.com (2603:10a6:20b:561::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 14:32:22 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::ee) by DU2PR04CA0299.outlook.office365.com
 (2603:10a6:10:28c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 14:32:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 15 Apr 2026 14:32:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB7954.eurprd08.prod.outlook.com (2603:10a6:150:a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 14:31:18 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 14:31:18 +0000
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
 b=jey7VvFTEs3ighi1WgEtVuenMAEtF3770kseqvNpK/jVek86BjQD14R6lLVmEAnt1rBQI3ofT7ItNUQKoCTEJKQXOXdwtC4QmB+0LdZrC6cjZVTZayulhjjD6jSPTisp/dyS9CVnz4Agyk2F/0qLWohP+l6k6/9LdC7EoGptod0hOvr6031zsTmZDJRvy39oXMkpS5OFJx86zknWFwBYtzT8Xlm7AtKtBmudmzHcdGgfTfoje4qGRVLV5/6EOw5uDtuGtwAW+DLzerXjynVRt3P6vbdt4Jh4TBSj7yU3xIaozrG499tgyiKpRX+jHdS9Pb01gJ89AdnDXNfBd8G6Yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQdJJxGfBiMUNrgXyhm/E+tiuTsLt47c6AZEW/9sf6Q=;
 b=FBx4i2WHnEjk4yIbXFbCXw6ilqDX9kWuGPUUnZ7PDy7mvfkwc/bwzxONcW9OlHBzXH0FSh0D6Jx7tOwaViVFYX/Yq+R6m0wA48PoI4BqeAFpbvB5trqPphCYr8OvSUy8qvB4zULZNmn7IGlk1zl8eJ3GTOFm2fNSlgsNAsc88Gr4ZmwpFT3MT8cFwEdbO1PqTYvqULT6jt8SWYIyZpspieWIjdWpdkhI7fselHCZwaV+SmFtYGn8cbePxBdQ3egxC7Wcw3ZZ58Gmb0CmAzEJm0B/ePj4//4Q3Nw11amdpKjoHPfDay2N8Dy96oUSbWHPBitgTHNKVkJmT4PnBpF6jw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQdJJxGfBiMUNrgXyhm/E+tiuTsLt47c6AZEW/9sf6Q=;
 b=cD8kqXo80lDTPnn6zQCVl31Y+/WgKo4rYYpyslkxbxfVxChcybFDxVE2ST5Z/yviQPIjUJcVNdyRWruW0on5sUoG5EQ5pAwx3yTIH6QK/Q981rrX7hwOnvtCHQaWhd6B+l7qLaLw2EYazIEVAWv8Q7y6NmKPSnIP1cahD8Ap3+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh/XryE8Pg+U7ZOb1FdrYykaFKJ944jQbN8Ju02ChcrHrg0tAA5MZfiAI+mlL5dXzJPesJljOj1w/pZ3O6D9jJ6zNKpZRdDRnZklD08BuQQD63tffwiioRozdhsLCuefF8HVzpT72pdIxm+sHIuUM+7+nf4w5FjCkGR6iWzU4iwLXDcQXEnwOxAtg3/U3srs7IGKruWHCVU4V6rADu9I769dcoG86qazJhEv7wFEAl/cKt05iS66lAfEwUdSrmlbWdZmTkI0Pv46t3Tm1CPwe2qdu/6t6d1jGSHvuKPv9i+bD6K0vqMmzHdx9s07BEvcgxlUIB0zukxlfAnuZ4TOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQdJJxGfBiMUNrgXyhm/E+tiuTsLt47c6AZEW/9sf6Q=;
 b=ORT0jTBUFn2G8s7fREqXo9kIYhAMdK8XkwxFExqIt70W+f3SgQTKKUGpvGcSgaEVlGgbPZWgRbnho/9ZoNv22h1yadTUQ7q56QR9ZUz+xuZVcx1YALQeXcOnrv3Pj2+KOs8C5xo874OYXsxfl8qP4CcoT3Yk4mzuDWpMnGcU2LgWMNaimYBR8ufYvEVp05z2aZJ9aL7zzHweN6/k0xqzu1locOQnFI2eONWjuhDYA8kr9CTZ/2nr+wjARPgRvU0jZq3yC9Gaw5SJ6uhUEgkpOQ+KdIkXLNZ59sxVfoe/AFERjYppGrjwG5nalimX92hT4c/EsbeXIMSxssQ9IwgfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQdJJxGfBiMUNrgXyhm/E+tiuTsLt47c6AZEW/9sf6Q=;
 b=cD8kqXo80lDTPnn6zQCVl31Y+/WgKo4rYYpyslkxbxfVxChcybFDxVE2ST5Z/yviQPIjUJcVNdyRWruW0on5sUoG5EQ5pAwx3yTIH6QK/Q981rrX7hwOnvtCHQaWhd6B+l7qLaLw2EYazIEVAWv8Q7y6NmKPSnIP1cahD8Ap3+0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v2] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v2] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHczBC6OGp5DbFlyEyismnWkcVdqLXgJmgAgAAKXQA=
Date: Wed, 15 Apr 2026 14:31:18 +0000
Message-ID: <809EAE3B-A92F-4655-83F4-20D3F65C3828@arm.com>
References:
 <da128e8fb41add9efc30860612786cd62f21addc.1776168699.git.mykyta_poturai@epam.com>
 <8CF45F67-B635-478D-9623-A69956FFEC5B@arm.com>
In-Reply-To: <8CF45F67-B635-478D-9623-A69956FFEC5B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB7954:EE_|DB1PEPF00050A01:EE_|AS8PR08MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 333c1d14-7a55-4168-3230-08de9afbce0f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 0FwEeHZqKl67z+SN9c07ZLHREc9rhMiaotknfha2ZVwct2GAczFEUqJ7PspuL1emOFAv97gZwe9giWb4TWIMt79zEwM3XSQzivbSxD84BPi+GlHJ4XB/BoqcwuwmqqRjTnjrvuk9rf+VwhIHgvyt9eZgSUWQazHb3C582XPFlrqwbU1qRhZRkWNpa4rRHRJ/dJdZehGyFrESPiixREXnoFBGAHAUwzco+TrlRU1+MKJapb8blR/HaUr3cDBcxr4A4VH32u8hrFBQUX3v0+MLtGXAchlkmNt4upjDCQ3ZCfBu2z2p0EhBVvYO+BVOLPJEvpNQxPwqNV1saiHdL3izIgEryBlPReUyzbuquqUDjkwfAjkCdJ/Tp4iXE46F8SGy3Kt4Ke0imdlLf26AIvkzCXv2OvesNcB0in5cjkFLrkMmdtyEgQp+G12EeOXH12/npH/iu+MDm+X87s5Hvj5O4zwHX9YJsTzX/VCYK0ro+Z+J6+fd275HP6xmPwX8bYd6/vF/H7FBJ3zkvZhvlCSIR7fRe3e1y6bFTPcQS4DUGPsGeWxQDIGvbwAOZ5WX284DtgllySanMtWcwO9gaWhNuVWARtvW+ftKRdRDZpsl/W+695578da0K9Lhz3UeE4haWtNAUknMPrZjkjsshFmd2OAERpeLJJk+OzEWp4bwuHwcCba/sNUF1jlQ8+AXOkoVdVMojiTaVWSSda+DTa7hIUBGPnLUmdBPIi9x+5tdxycxpAg7tH6Y1nhLwLVIPiwz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2986F72C977904394B8D0EEA78822C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 VvwTh74DvGo0WYTn6EnxFkYByJd1AxVNKdOSyo8f07d+HQ6kKqpjKTo4EB7cj/M2XnS8AXWEd+xB6eKG0kVNNt3o42gg91zRRSR5YmNgpNHiszY36Sgh7+Qd8PE6jKKtx9w8yFlUL+I59a/X8+fdwhemXHVZbFiC0eu7qp1ud+ogQ5IV5DjITLouy9fKp8EbdZIlCw2FuCtUVVb7u2pKr2wWAhAtVHkZmHqbQR1Lz3KYcAp0edKDRmHCgxWeaXerbFi/UOdFoARkMKmQCLpxPeF6QrbQ2OgjiXD1EdL7xcO2j/hlSUy/n7jbhBvmB+6WBUiPeehnxScS9xHYUTF8/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7954
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb7daa26-c92f-49a7-cf38-08de9afba862
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|35042699022|14060799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FCe6nEgcpUMUyDT+8u9coY2o4ljY0O1jcY/CLSp5r6Ltp6ACScM+Jdt7tS95o1V1YcXtWSeeprIi8gfVW8pzE3lhTRHerXe6iA8RR8RGfdhHuCqgLT9pLlYPVwFA0oKn+iLHHFZNEbRsmcYtKGHmWxEOWb3mNTouTJPXhyvhzMCg4gI5sia9nlq94iCmCak8ixGcYHgPpwTRKEjpWV9+C2j6XDa5JbduRyOPU42gxMXx2cBdV3j2xLJgTp6XKPAAru3nk6wsSQleDe8Cj7o68Wbtw1KLP1YV4CsZM+zwV+cpUNP0EMGO4KLG+CGiCs3UHHAvlK5YOtbSyDLLWizPkk5XxMY4l/aQ2RCe2lSuTwXaTE4AQSTC5ZdLoKJtbAEuOb+zB/2zyUUdGFEyE8yg2+Kl6T2rt+qR8cfpi/gHH8dfQ7C4fMP264sWklhnv7M+0LlILeR5AjE+9etFJVkpXuzZNzskDG9xjJBzqfuzh/PK25IOAaOv8bWm00TMNmjiCYWZlgjZW31FTz7dj/bOajAf1lqV4exF/aSghxJ12cJOBX+cX8efCaWR2J4TOD8hWOt81lVQTBT3MTxN7ZZayu1WtDnUFlMNgrAL+8vMb51KOwdFds9tBBOsdT2AmqgUrvBiB/NxBs4VawOgnCp6edmP0g4QDwEXLU0gZL1pVXWXUYff3z2EkwI7IGYUWtLLsh8wH49HSVZPIDhFjsaDw/R+bbY2GVQbBT3PTnllT/Q=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(35042699022)(14060799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ia3hpwJtY03Wu7PB8TzRa+wWvlb9Cze0XfNNCvYXl/7wr4jPko4YDG8s4q5Wz/Zl3p/OZVSacPm1iC4Oi54iM/J0PobdlJk9YpWXxYg3MSpug+0pruTe7FSl55hfaLBgPQ4n01ZbArNtHrZ2AZB7UcPaXzsYSMQXJUVMcv7z/1O8+MccX+5L0/whxptDc1tYUPOjsyGFekXiUJ4iyAmxuXGWZ/kJJIEMOpSVearhh1TZDZ06BkM8O3ahltl1aHBL0hZfywQkhOE4TKqDY0Px0eaGSm/AQ7dKGsdWKvyWtMs5SkoWCI3sev0eOSfblbteHlgEioa98byA6Wj2mjTuk1b4I/qJFgTBYwjgmX8O7/3E0J5R1OkYPcSULqy0iBOTbGqH2w98P5uCJcbiUL9XMkYwbHspqIlw6p5zbg/qPzqGTNcQi+wXGnVbtvnrAjH5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:32:21.6606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333c1d14-7a55-4168-3230-08de9afbce0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8160
X-purgate-ID: tlsNG-bad1c0/1776263548-2E354152-D0326728/0/0
X-purgate-type: clean
X-purgate-size: 5916
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
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Rahul.Singh@arm.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 03964405544
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gMTUgQXByIDIwMjYsIGF0IDE0OjU0LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgTXlreXRhLA0KPiANCj4+IE9uIDE0IEFwciAy
MDI2LCBhdCAxNDoxNSwgTXlreXRhIFBvdHVyYWkgPE15a3l0YV9Qb3R1cmFpQGVwYW0uY29tPiB3
cm90ZToNCj4+IA0KPj4gQWxsb3cgZm9yIHJlbW92aW5nIGRldmljZXMgZnJvbSBTTU1VdjMuIGFy
bV9zbW11X2RlYXNzaWduX2RldiBoYW5kbGVzDQo+PiBtb3N0IG9mIHRoZSB3b3JrIGJ5IGRpc2Fi
bGluZyBBVFMgYW5kIHplcm9pbmcgU1RFcy4gQWRkaXRpb25hbGx5LCB1bnNldA0KPj4gdGhlIGR0
X2RldmljZV9pc19wcm90ZWN0ZWQgZmxhZyBhbmQgZnJlZSBubyBsb25nZXIgbmVlZGVkIHNtbXVf
bWFzdGVyLg0KPj4gDQo+PiBSZXdvcmsgZHRfZGV2aWNlX3NldF9wcm90ZWN0ZWQgdG8gYWNjZXB0
IGEgYm9vbGVhbiBwYXJhbWV0ZXIsIHVwZGF0ZQ0KPj4gY2FsbHNpdGVzLg0KPj4gDQo+IA0KPiBT
aG91bGQgLi4uDQo+IA0KPj4gVGVzdGVkIG9uIFFFTVUgd2l0aCBTUklPViBzZXJpZXNbMV0gYnkg
cmVwZWF0ZWRseSBlbmFibGluZy9kaXNhYmxpbmcNCj4+IFZGcy4NCj4+IA0KPj4gWzFdOiBodHRw
czovL3BhdGNoZXcub3JnL1hlbi9jb3Zlci4xNzcyODA2MDM2LmdpdC5teWt5dGEuXzVGcG90dXJh
aUBlcGFtLmNvbS8NCj4gDQo+IHRoaXMgYmUgb21pdHRlZCBmcm9tIGNvbW1pdCBtZXNzYWdlPw0K
PiANCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9wb3R1cmFp
QGVwYW0uY29tPg0KPj4gLS0tDQo+PiBWMS1WMjoNCj4+ICogY2hlY2sgZm9yIHBoYW50b20gZnVu
Y3Rpb25zDQo+PiAqIHNpbXBsaWZ5IHBjaS9kdCBkZXZpY2Ugc3BsaXQNCj4+ICogaW1wcm92ZSBl
cnJvciBoYW5kbGluZw0KPj4gKiBkb24ndCB0cnkgdG8gZnJlZSBtYXN0ZXIgZm9yIHVucHJvdGVj
dGVkIGRldmljZXMNCj4+ICogcmV3b3JrIGR0X2RldmljZV9zZXRfcHJvdGVjdGVkDQo+PiAtLS0N
Cj4+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMgfCAgMiArLQ0KPj4g
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyAgICB8IDU3ICsrKysrKysrKysr
KysrKysrKysrKysrLQ0KPj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyAgICAg
ICB8ICA0ICstDQo+PiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCAgICAgICAgICAgIHwg
IDUgKystDQo+PiA0IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBt
bXUtdm1zYS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYw0KPj4g
aW5kZXggZmE5YWI5Y2IxMy4uMDY0OGY5YjQwNyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9pcG1tdS12bXNhLmMNCj4+IEBAIC0xMzY3LDcgKzEzNjcsNyBAQCBzdGF0aWMg
aW50IGlwbW11X2FkZF9kZXZpY2UodTggZGV2Zm4sIHN0cnVjdCBkZXZpY2UgKmRldikNCj4+ICAg
ICAgICB9DQo+PiANCj4+ICAgICAgICAvKiBMZXQgWGVuIGtub3cgdGhhdCB0aGUgbWFzdGVyIGRl
dmljZSBpcyBwcm90ZWN0ZWQgYnkgYW4gSU9NTVUuICovDQo+PiAtICAgICAgICBkdF9kZXZpY2Vf
c2V0X3Byb3RlY3RlZChkZXZfdG9fZHQoZGV2KSk7DQo+PiArICAgICAgICBkdF9kZXZpY2Vfc2V0
X3Byb3RlY3RlZChkZXZfdG9fZHQoZGV2KSwgdHJ1ZSk7DQo+PiAgICB9DQo+PiAjaWZkZWYgQ09O
RklHX0hBU19QQ0kNCj4+ICAgIGlmICggZGV2X2lzX3BjaShkZXYpICkNCj4+IGRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPj4gaW5kZXggYmYxNTMyMjdkYi4uOGUwODBjZDdkMCAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4+IEBAIC0xNDkz
LDYgKzE0OTMsNjAgQEAgc3RhdGljIGludCBhcm1fc21tdV9hc3NpZ25fZGV2KHN0cnVjdCBkb21h
aW4gKmQsIHU4IGRldmZuLCBzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiBzdGF0aWMgaW50IGFybV9z
bW11X2RlYXNzaWduX2RldihzdHJ1Y3QgZG9tYWluICpkLCB1aW50OF90IGRldmZuLA0KPj4gc3Ry
dWN0IGRldmljZSAqZGV2KTsNCj4+IA0KPj4gK3N0YXRpYyBpbnQgYXJtX3NtbXVfcmVtb3ZlX2Rl
dmljZSh1OCBkZXZmbiwgc3RydWN0IGRldmljZSAqZGV2KQ0KPj4gK3sNCj4+ICsgc3RydWN0IGFy
bV9zbW11X21hc3RlciAqbWFzdGVyOw0KPj4gKyBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWM7
DQo+IA0KPiBJ4oCZbSBsb29raW5nIGludG8gdGhlIGFybV9zbW11X3JlbW92ZV9kZXZpY2UsIGF0
IHNvbWUgcG9pbnQgdGhlcmUgd2UgYWxsb2NhdGUNCg0KQXBvbG9naWVzLCBJIG1lYW50IGFybV9z
bW11X2FkZF9kZXZpY2UgaGVyZQ0KDQo+IHRoZSBpb21tdV9md3NwZWMsIGJ1dCB3ZSBhcmUgbm90
IHVzaW5nIGlvbW11X2Z3c3BlY19mcmVlKCkgaGVyZSwgSeKAmXZlIHRyaWVkDQo+IHRvIGxvb2sg
YXJvdW5kIGFuZCBJ4oCZbSBub3QgYWJsZSB0byBzZWUgd2hhdCBmcmVlcyB0aGF0IHN0cnVjdHVy
ZSBhcGFydCBmb3JtDQo+IGlvbW11X3JlbW92ZV9kdF9kZXZpY2UoKS4NCj4gQnV0IHBjaV9yZW1v
dmVfZGV2aWNlKCkgLT4gaW9tbXVfcmVtb3ZlX2RldmljZSgpIGNhbiBjYWxsIHRoaXMgZnVuY3Rp
b24gYXMgd2VsbCwgSeKAmW0gbm90IHN1cmUgSeKAmXZlIHVuZGVyc3Rvb2QNCj4gY29ycmVjdGx5
IHRoZSBmcmFtZXdvcmsgaGVyZSBzbyBtYXliZSBzb21lb25lIHdpdGggbW9yZSBQQ0kgZXhwZXJp
ZW5jZSBjYW4gaGVscA0KPiBAU3Rld2FydCBIaWxkZWJyYW5kID8NCj4gDQo+IA0KPj4gKyBzdHJ1
Y3QgZG9tYWluICpkID0gTlVMTDsNCj4+ICsNCj4+ICsgZndzcGVjID0gZGV2X2lvbW11X2Z3c3Bl
Y19nZXQoZGV2KTsNCj4+ICsgaWYgKCAhZndzcGVjICkNCj4+ICsgcmV0dXJuIC1FTk9ERVY7DQo+
PiArDQo+PiArIG1hc3RlciA9IGRldl9pb21tdV9wcml2X2dldChkZXYpOw0KPj4gKyBpZiAoICFt
YXN0ZXIgKQ0KPj4gKyByZXR1cm4gLUVOT0RFVjsNCj4+ICsNCj4+ICsgaWYgKCBJU19FTkFCTEVE
KENPTkZJR19IQVNfUENJKSAmJiBkZXZfaXNfcGNpKGRldikgKQ0KPj4gKyB7DQo+PiArIHN0cnVj
dCBwY2lfZGV2ICpwZGV2ID0gZGV2X3RvX3BjaShkZXYpOw0KPj4gKw0KPj4gKyAvKiBJZ25vcmUg
Y2FsbHMgZm9yIHBoYW50b20gZnVuY3Rpb25zICovDQo+PiArIGlmICggZGV2Zm4gIT0gcGRldi0+
ZGV2Zm4gKQ0KPj4gKyByZXR1cm4gMDsNCj4+ICsNCj4+ICsgZCA9IHBkZXYtPmRvbWFpbjsNCj4+
ICsgfQ0KPj4gKyBlbHNlDQo+PiArIHsNCj4+ICsgaWYgKCAhZHRfZGV2aWNlX2lzX3Byb3RlY3Rl
ZChkZXZfdG9fZHQoZGV2KSkgKQ0KPj4gKyB7DQo+PiArIGRldl9lcnIoZGV2LCAiTm90IGFkZGVk
IHRvIFNNTVV2M1xuIik7DQo+PiArIHJldHVybiAtRU5PREVWOw0KPj4gKyB9DQo+PiArDQo+PiAr
IGR0X2RldmljZV9zZXRfcHJvdGVjdGVkKGRldl90b19kdChkZXYpLCBmYWxzZSk7DQo+PiArIGlm
ICggbWFzdGVyLT5kb21haW4gJiYgbWFzdGVyLT5kb21haW4tPmQgKQ0KPj4gKyBkID0gbWFzdGVy
LT5kb21haW4tPmQ7DQo+PiArIH0NCj4+ICsNCj4+ICsgaWYgKCBkICkNCj4+ICsgew0KPj4gKyBp
bnQgcmV0ID0gYXJtX3NtbXVfZGVhc3NpZ25fZGV2KGQsIGRldmZuLCBkZXYpOw0KPj4gKyAvKiBU
aGlzIHNob3VsZCBuZXZlciBmYWlsIGJlY2F1c2Ugd2UgYWxyZWFkeSBjaGVja2VkIHRoZSBkb21h
aW4gKi8NCj4+ICsgQVNTRVJUKCFyZXQpOw0KPj4gKyB9DQo+PiArDQo+PiArIGFybV9zbW11X2Rp
c2FibGVfcGFzaWQobWFzdGVyKTsNCj4+ICsNCj4+ICsgZGV2X2luZm8oZGV2LCAiUmVtb3ZlZCBt
YXN0ZXIgZGV2aWNlIChTTU1VdjMgJXMgU3RyZWFtSWRzICV1KVxuIiwNCj4+ICsgZGV2X25hbWUo
ZndzcGVjLT5pb21tdV9kZXYpLCBmd3NwZWMtPm51bV9pZHMpOw0KPj4gKw0KPj4gKyB4ZnJlZSht
YXN0ZXIpOw0KPj4gKyBkZXZfaW9tbXVfcHJpdl9zZXQoZGV2LCBOVUxMKTsNCj4+ICsgcmV0dXJu
IDA7DQo+PiArfQ0KPj4gKw0KPiANCj4gQ2hlZXJzLA0KPiBMdWNhDQo+IA0KDQo=

