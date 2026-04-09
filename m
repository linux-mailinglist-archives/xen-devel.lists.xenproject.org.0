Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGldAbZa12lqMwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:52:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439DE3C74AF
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276729.1562050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkB7-000227-7T; Thu, 09 Apr 2026 07:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276729.1562050; Thu, 09 Apr 2026 07:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkB7-0001zZ-4R; Thu, 09 Apr 2026 07:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1276729;
 Thu, 09 Apr 2026 07:51:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wAkB6-0001zT-79
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:51:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkB5-000KJw-J8
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:51:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d75a8e-e002-0a2a0a5209dd-0a2a4503b66e-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:51:51 +0200
Received: from [52.101.83.29]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d75a96-02b3-0a2a45030019-3465531db55e-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:51:51 +0200
Received: from AM0PR02CA0193.eurprd02.prod.outlook.com (2603:10a6:20b:28e::30)
 by DBAPR08MB5557.eurprd08.prod.outlook.com (2603:10a6:10:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 9 Apr
 2026 07:51:47 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::da) by AM0PR02CA0193.outlook.office365.com
 (2603:10a6:20b:28e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 07:51:46 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 07:51:46 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB11724.eurprd08.prod.outlook.com (2603:10a6:150:30c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 07:50:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 07:50:41 +0000
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
 b=h72mnjlfxQVz7BSl7rcnYIgKDU4QlJeCuwNXUBv/2YSaaOn5l5fVpUPr+LhRDb3RFts3xjUL+Muu07uViFrxpw7HMQpW+Pi8BKs7d+5gz1zD0/VNNBk4e5S3Bj/LCBX23fNvnisyZqbqpYs1DdwWuqqXZA6LoS6d2eciDCwxSUGnXoVnQHF6UspO1ctxQCNW6WdNddVI5FkglRtVBMBUo29v0TFMo4OFDV3OiZ4Oy+VfCNUP/5a/9PdQOpVn79215pwVLhKMYYLpvW7X6ZUiWV4ng8BltMWV6TNvfrDWJjxtKGBXZjdGPfCcgbqZAlYUzFk5haZVY5+pX1RX1ebqLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuW+HS+xOH0ClkWDUm7JfLOYmsWBrFu7Gz03zcthstY=;
 b=jGvdpsnupClK9QiVag/Y+yML3VkHP7lLr04REHWi3jEJrTAo+obvcz+720C/F4WT95f1aaRfnQd2IZUL0NFNu45i1XAI2FtJbS0ESceCKMl4MrGpIl+VrCCLk1c+mNXuLwZiUVieTezmWicHMjGLLtA0n07yhxcnkz2vn4O823gPokH0Raczyw++SMjHwuh6IU/OibweI4dERK0ChFQZEaDzCmUHck0ZSSDRGpszT4Y78Djx/D+k0QsviXfYEo++gDRYRpUO8sjPjNUCK6j4TIS8L/2e9Akwo9AFiZniGHvrRyYAISU1yXTPYm2Na5yi1jkKvCFTb1TIrZI/7mJbzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuW+HS+xOH0ClkWDUm7JfLOYmsWBrFu7Gz03zcthstY=;
 b=kSGyF7QzVD9DrP+CXILmOqV4J0QH952glYO+XM+UxH2LHbKq+RwKlTP3GbiNZDs41wdNJcIS8yJHhTv/CPz/wERDW9mSwe7f9WFZChbU0+M7mTBitkJAkaA9gZEnLeyy64NIuJyBhuqIDXVAkmie1JzT71ujiWQYGuKQT8Oqq6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2S52KgddQyB/f7hMrYrIixpQptOD50dV485Xy0RQxO0StwBYl0OjuFPDqe60jEQLVACI6X0jzcLLMycdu0Qddk6jS1Qau1VDk2fAItcv6xAqU3X93a5Cq67niVqrarIcGAb0RUA7KpINP/HDaGItJmlMW9KuuDJclbK9Q4F7ryERztu5FGvBCG3BMsQGTE+hGCaWUgePojm2fNvoeeEk8Z0GKSL59LkyMn2pYjM9TdC3GoJE1xNEXhFC6T8MfjzTzGU7SvKfj6+bTU6+yH6exwVyfRYP1htiJxM74WQLW2WB2vXPhHqQo1dyyiJTJQ0JRLVx6PMthCkos4jdzQyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuW+HS+xOH0ClkWDUm7JfLOYmsWBrFu7Gz03zcthstY=;
 b=dDsMVtT/M9fOzOu8nOvAk83QmmPi4vc3dPEia62QXZcdc3yrf7RXzFWPkpHvuh+tOrje/PQQ4uXLTaQbf4TcoaHnraNLtjdWriHkiYDvf+jHoH5O7slCc+4/CMMwTJq1MKPSD80Ia90W06HxnEGhF9MZ9K9/uvrIF6/0AitraVz0q7WnHXuMXuXDgiqvjQXQF4URu/IiNQN8dgeFoobLeVntnErZrgrUE7d3JEeUHsN5JZP0mZ5Qsz8ZODAcy0RIH9d06JIC2olR3hUDOSdn3QokY0mfg449jl2QdJcPUnyiwD09smkbk1macTK+ZNNInGrVFyBnDCZ/Gg+Tu5rDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuW+HS+xOH0ClkWDUm7JfLOYmsWBrFu7Gz03zcthstY=;
 b=kSGyF7QzVD9DrP+CXILmOqV4J0QH952glYO+XM+UxH2LHbKq+RwKlTP3GbiNZDs41wdNJcIS8yJHhTv/CPz/wERDW9mSwe7f9WFZChbU0+M7mTBitkJAkaA9gZEnLeyy64NIuJyBhuqIDXVAkmie1JzT71ujiWQYGuKQT8Oqq6w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Topic: [PATCH v3 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index: AQHcx1925wGns5uRCkO+Bld4rDba9bXVTXKAgAEOy4A=
Date: Thu, 9 Apr 2026 07:50:41 +0000
Message-ID: <29251E79-8302-4336-81F0-C27D256B74A3@arm.com>
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
 <20260408135531.1744388-3-luca.fancellu@arm.com>
 <bb6caa97-b3b5-465e-8690-c3aef061d885@citrix.com>
In-Reply-To: <bb6caa97-b3b5-465e-8690-c3aef061d885@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB11724:EE_|AMS0EPF000001A9:EE_|DBAPR08MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: f240f10b-34ed-4bca-a9ad-08de960cd98f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 Wp/X5FB37FotRpp4sdC7kFtIc/2WlTb4CnJywbxQG57Q7E2yWpmVi2ZPdS7J1xCMVVx1quLD/gVbMphHVn31CjNwTomQwuTWDXpdMtR5BIujvEQhF5e65QNYG0FdCEKF/X9lRt4q3ji5LStQxfrTcl+JbSPnRvWNIwNcN28pQtwoltGBFMlwu6XEayFczZw8B7O92kxfnx7SdNUnqmc6w6IEFHPwiCT9qY3dblIw51DqTcoILwi7JT9PoZRvayryuJiVksNbXOvkehltEckywH8FHwo1Y7Shqi2BKmz2ECzar0Y07zGzDGCUAWrc+JnFQOpLOisxMv8YmEa6PAw150oRtH741HdombjJmByLB3K/etAGky3k9CcwYWlsnfQD16T0DxBkrBrlX3izc7d7y7wIeau1uPc+nQ7mj8zApb+gDRGpNgkb6srmT1aVjM//rTPXCKHIvLyw0ARHfmVKEx1bM8IZFTsUfpJK42QpDDcYTZtXBq66lvZsUTB68lEOJ/vqwYKeTkwXgmy4MtdoK4lctiYwTDraC+qsZuRvPdJXMdKTR1UcafTPtNwJckx8gAfcGaoxN6p+1Jb2zA9byczbIJtg25A7YUds0Q6uCpWhaMYLjom4fgboQofvgpu3jiGCMl404fKU56LwBndadx+fB52Bs72jQFGWLDimniL3Krm5G60z1yoIMia1flcQe8TX8uIKVXxWARARqCxYJyWs2KZ0xPUhrlNhkBjGYIDoNbZRWXYt8rux5Jyxnc+G4ateVm0HpcDWJWMoHC9M0nzpbeEyYGVy/w9A8IRg9oI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <32F2322C945E044EBB8E627825AC9D2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 D2G0WxEynzX7XqyHu2EjYnHxzef3keATQjguPp4CUWuyEVo8aZRkbTTK9xgNMAXWaGkhyT2wvpzdcNqshclSG0Be/CjCgdATnJjJkulOyI0aiY4SznL8GtHTQ11OnfKdYqOWpODpfITTgjDcJ+6vpwMQH8sdjtvBPUicOTiTAdlin9NqY4Z6NjBcV7IrDN6bNOtFMRT+GNRR94S8kFJiOUE3FQO9DAJsFZMx26bmFvO+UgzwkECxHFs/F8+aLZu/fx22fXXrdOKATAIt3HQp/Yh72bY+HB3Ar9jhj8K9DGlAucS8artxUWIlXFpWXEjAVcly72Zbv5SBS3VnzShPRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11724
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	404a2cc9-3cdd-4b5d-ad94-08de960cb2dd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LMCn8PMEmegIX7OR1uFP9c+ifMd7wAIGa1ze2CIMlHzS/+O3NxCEaKxEcL4BZ9AM8Cm0m/YjojnzPcW1MpVuCBdnm7aJaTJy/h8ypRmiwEvqUpBQIgJVuY8boZWdtFrKjuifFpFm8BYWPyL5KzCo+qZGU34sMWAkmVOb9ISmW5in5nCNFJrRUImbmGwmTD56mG4BDdzXmDa2UrEt6J1SAEMhYfketVYRuMKjSq3ExuUYuhEcy6aQowNPPzPpzJ7gnUpR4lzKLSySIeBqxZZjA+7xQ9/rm/15lPMW3OWQ4yij5HO9Ev/WLzsvkwgLePuZgkwxS//NptI3ydJRzOvPXdy9vHy1eH7TAn7vK3KHCVEE3/Kc0mq/7y/RK5kUeC/1u6egNsGKlZUEa9t8qCQyYhGqdZ28HWmw5u6asJiZGSSXoDjyCXL2Pb4asoU6FytooTWU8iAjLolc2ePNiB6qfmhbJaAiT86+O8Q2s6ysWNOYK3bZlbhBkGGYPVJ1lU6ldPJxffR4pWqqMGh2VoXv9oU+ujYWefwS5zg0Glq8W0T0xVERC7liDhOfZZ8zHOcgUhY6+KG5hETvOiASWSOon4K+vTLrV2rjWnqPN5CvmNemsckQuEJmVIkPp8IPTAHJZIdD30w3xRVdRavMlA4LtchtIpI7PANa9sAxkafZAe9xcYwSYHTv9KFb317f9hOF3gzB+S5u0dgc5NbY8LAUYBC6BN7FhYjXK/vzk/OkdJI=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z4bGHmRcpI9+6XFe/DyFGawcEMU4c9NkrHXyp8Q/YM7fUMP4agdq7r+3BEJ2QuHM33wfy5JYMtHkhD39af2jo6KDKiGFISGlrk7+alekNLpS30R5JVEh7s+UWZor4RRb0T38MdZlk/Hm6NBlvlpgUWPpTTzII+rilIVrEFl9jD6x/BxcVCmlF8qlXCWhCMQZriCBBzWuWqPCcZlFVS+vKlxletblFdUpE4I52/O6VPoG7dhI/+abnhhnGmXm0EOvnbM+JvaKFzxxNMtUyj6PPzzg3xYzSfBMpFIn/P9Im4bXwJNJJe+p1ZeIuy/mjEHy6XBhusLQr2DS+Kpiu91mZen3GQMUC87kngyNyj1EjQFS21sDQJyKj3w4z62WFaDg/0gYQEQE8No8azJvNTCh8NZQLTmU8FJ6OQmiAETbfDYynQz+V6CnMxWIW0nVPkG8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 07:51:46.6047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f240f10b-34ed-4bca-a9ad-08de960cd98f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5557
X-purgate-ID: tlsNG-33051d/1775721111-40B6DC9A-9394293F/0/0
X-purgate-type: clean
X-purgate-size: 2920
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 439DE3C74AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQW5kcmV3LA0KDQo+IE9uIDggQXByIDIwMjYsIGF0IDE2OjQwLCBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDA4LzA0LzIwMjYgMjo1
NSBwbSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9w
dWJsaWMvYXJjaC1hcm0uaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+PiBpbmRl
eCBjZDU2M2NmNzA2ODQuLjIzZGYyZjI0Y2IwOSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9hcmNoLWFybS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0u
aA0KPj4gQEAgLTM1NSw2ICszNTUsOCBAQCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnIHsN
Cj4+ICAgICB1aW50MzJfdCBjbG9ja19mcmVxdWVuY3k7DQo+PiAgICAgLyogSU4gKi8NCj4+ICAg
ICB1aW50OF90IGFybV9zY2lfdHlwZTsNCj4+ICsgICAgLyogSU4gKi8NCj4+ICsgICAgdWludDhf
dCB2OHJfZWwxX21zYTsNCj4+IH07DQo+PiAjZW5kaWYgLyogX19YRU5fXyB8fCBfX1hFTl9UT09M
U19fICovDQo+PiANCj4gDQo+IFRoaXMgaXNuJ3Qgb2sgYXMgdGhlIHNpbmd1bGFyIGNoYW5nZSB0
byB0aGUgcHVibGljIGhlYWRlcnMuICAoQWxzbywgSQ0KPiBoYXZlbid0IGhhZCB0aW1lIHRvIGZp
eCB0aGUgb3RoZXIgQVBJIGFidXNlcyB0aGF0IGhhdmUgY3JlcHQgaW50byBBUk0ncw0KPiBhcmNo
IGRvbWFpbiBjb25maWcpDQo+IA0KPiBZb3UncmUgaW50cm9kdWNpbmcgYSBuZXcgaHlwZXJjYWxs
IGlucHV0IHBhcmFtZXRlciAod2hpY2ggaXMgZmluZSksIGJ1dA0KPiBoYXMgbm8gZGVmaW5lcyAo
b25lcyBwcml2YXRlIHRvIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaCBhcmUNCj4g
bm90IHBlcm1pdHRlZCBmb3IgdXNlIGluIHRoZSBwdWJsaWMgQVBJKSwgYW5kIGZvciB3aGljaCB0
aGVyZSBpcyBubw0KPiBpbnB1dCB2YWxpZGF0aW9uLiAgVXNlcnNwYWNlIGNhbiBjdXJyZW50bHkg
cGFzcyBhbnkgYXJiaXRyYXJ5IGJ5dGUgaGVyZQ0KPiB3aGljaCB3aWxsIGJlIGNvcGllZCBpbnRv
IGQtPmFyY2gudjhyX2VsMV9tc2EsIG5vdCB0aGF0IHRoZXJlJ3MgYW55DQo+IGNvbnN1bWVyIG9m
IHRoaXMgZmllbGQgSSBjYW4gc2VlIGluIHRoZSBzZXJpZXMuDQo+IA0KPiBGcmFua2x5LCBJIHRo
aW5rIHRoaXMgc2VyaWVzIGlzIGNob3BwZWQgdXAgdG9vIG11Y2guICBZb3UgcmVhbGx5IG11c3QN
Cj4gbm90IGJlIGludHJvZHVjaW5nIG5ldyBoeXBlcmNhbGwgcGFyYW1ldGVycyBsaWtlIHRoaXMg
d2l0aG91dCB0aGUgd2hvbGUNCj4gc2VyaWVzIHdoaWNoIGxldHMgeW91IGB4bCBjcmVhdGVgIHN1
Y2ggYSBWTS4NCg0KVGhhbmtzIGZvciB0aGlzIGZlZWRiYWNrLCB3aGlsZSByZXdvcmtpbmcgdGhp
cyBwYXRjaCBJIHdhcyB3cm9uZ2x5IGFzc3VtaW5nIEkgaGFkIGFsd2F5cw0KemVybyBmcm9tIHRo
ZSB0b29sc3RhY2sgYXMgdGhpcyBpcyBub3Qgc3VwcG9ydGVkIGF0bSwgd2hpbGUgaW5zdGVhZCBp
dOKAmXMgbm90IHRydWUgZm9yIG1hbGljaW91cw0KdXNlcnNwYWNlIGh5cGVyY2FsbCBjYWxsZXJz
Lg0KDQpUaGUgZnVsbCBicmFuY2ggaXMgYXZhaWxhYmxlIGF0IGh0dHBzOi8vZ2l0bGFiLmNvbS94
ZW4tcHJvamVjdC9wZW9wbGUvbHVjYWZhbmNlbGx1L3hlbi8tL2NvbW1pdHMvcjgyX3JlYmFzZWQ/
cmVmX3R5cGU9aGVhZHMsDQpidXQgaXQgZG9lc27igJl0IHN1cHBvcnQgZG9tYWluIGNyZWF0aW9u
IGJ5IHRoZSB0b29sc3RhY2ssIG9ubHkgYnkgRG9tMGxlc3MuDQoNCkZvciB0aGUgZGVmaW5lcywg
c2hvdWxkIEkgaGF2ZSBzb21ldGhpbmcgaW4gdGhlIGZpbGUgeGVuL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9hcmNoLWFybS5oIGxpa2UgdGhpczoNCg0KI2RlZmluZSBYRU5fRE9NQ1RMX0NPTkZJR19BUk1f
VjhSX0VMMV9NU0FfUE1TQSAgICAgIDANCiNkZWZpbmUgWEVOX0RPTUNUTF9DT05GSUdfQVJNX1Y4
Ul9FTDFfTVNBX1ZNU0EgICAgICAxDQoNCkFuZCBjaGVjayB0aGUgdmFsdWUgb2YgY29uZmlnLT5h
cmNoLnY4cl9lbDFfbXNhIGFnYWluc3QgdGhlbSBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25m
aWc/DQoNCkNoZWVycywNCkx1Y2ENCg0K

