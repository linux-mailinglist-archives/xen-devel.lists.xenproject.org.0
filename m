Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCOPHZFN62muKwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 13:01:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7BB45D6E9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 13:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293443.1571165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGEHj-0002lF-Im; Fri, 24 Apr 2026 11:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293443.1571165; Fri, 24 Apr 2026 11:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGEHj-0002j7-Ep; Fri, 24 Apr 2026 11:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1293443;
 Fri, 24 Apr 2026 11:01:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wGEHi-0002j1-45
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 11:01:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGEHh-000KN5-Gv
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 13:01:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb4d7a-2eae-0a2a0a5409dd-0a2a4507df0a-40
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 13:01:20 +0200
Received: from [52.101.69.36]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb4d80-229c-0a2a45070019-34654524ac8f-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 13:01:20 +0200
Received: from CWLP265CA0401.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::7)
 by DBBPR08MB6219.eurprd08.prod.outlook.com (2603:10a6:10:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:01:18 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::b7) by CWLP265CA0401.outlook.office365.com
 (2603:10a6:400:1d6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 11:01:18 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Fri, 24 Apr 2026 11:01:18 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB8182.eurprd08.prod.outlook.com (2603:10a6:20b:54f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 10:59:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 10:59:59 +0000
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
 b=xq9ocaa82SyvCMr4a+tr+XQT/O/OJPtMoN/L8miAWsX91S4yQWnVZJzBS6h8HLJ8+svcqPCrbmKdYYUdd9dI2mtDxUAxKkKBjEN10GhKdwRML0hWZa0ZWIF+NYhhsiu+BFbj35aoHds6O2OhJNZWOLGZj9ahJKN2AneyJhBahoDBQ+aLyjndw4DxUEC9VJN9hLW2hKHKUvNAfDIPLAcJmo9SmviGkFRt//54+BtI8LAcQSbgKuhRv4+AF8/ap56GSLdH3LsyJYaljzM3CMLYA08Kqt36AuDZzr7cOegIkagX7CIduQYLZV140ieP223B9iIi+Y1X1zUUY5zK9TWCrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pClc1SyCOQKZ1GGjSYisodXle1Fg+GHUdenSnzYGUss=;
 b=lkLDRMXqAF9ABfDO+AZ3Bt00IxQ6gbSM/amIwheyluWZ6ythcwbnVnslTfBGk7o64HDuTkSr+VwBeDw7g3e4AuDZZm65dTBQ+IDCfoXwYZuz4uYYrsQkxca6lhdmOEQwzNSmRkw4hd8t7S7MrGayX7VfLmLZEMv2aHzDNEqcN62UfwM8m21BHqPP+aVaFHyRioZPGG74YUOppNxheRvAr0RaZSqAU0gkKhG4Ru0CNaq8Jgoitj/AsGMYjHK6iaqe8+lTQ5AVG04qxXWaTBB0UY6bH/c8YRaWy2V/dyEY7J64lR+6b/QiwIrlXgObUTLAcXenZKwjPl5/FzcyVhHP4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pClc1SyCOQKZ1GGjSYisodXle1Fg+GHUdenSnzYGUss=;
 b=fjw0dDQ+4ITw/OoQeWabkxzDi6jmla3DRaw+YnOdTis7doIsFY5aXEf7hg1zuicITZ7xkn+ZhZfZ7HG4fbBt9lFhSaZSqGy7cmYBDBC5W9z4u/9x5ifKe298uWuP3wRYnMbkj05wXDAw7pMlC5CpJL+YUmhqbBK1CQghiHAb1XU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv2ip3brgU1kGp3/YC/gXIueeVVfpQkOF3npztQWrWfXmXwatYJuyCFrhG2/lOhgtCltrjzmQX9REA4xl9Z0pv6MpqHLjhImYaGb3mUFwWCTd6M2PjypXCPjTAk4eTwSCy0baRWsR0WnyAW/LBAhUn5HuLWORUfluQUW6e9qwTKgI3kwie46ffXa9F/VOO+xkSI+bZr6Rk+tQZB9KmXt0LQ8KfrRIdMciZWDWZ+XtkiBfZ5DenM/K4HEn0fo1/q55zxknsk4zOwu0aa8Aff8uiFhmXJtgdhge18gWR9G2qOmh00QTvMscB5HYXZ1GxnvLLucLFCisBkOsPJt/eoa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pClc1SyCOQKZ1GGjSYisodXle1Fg+GHUdenSnzYGUss=;
 b=H+sJFsYDHr3fPwohVjVGqCD9rOcJszJ682KQPlkSomfhCQUUZ6ioiD/sDGWNZAPjKTXfQ9+0YNIXPfbOb/V9SEuXsZGuPhvunotxjEw+D46yJQiGEfWV9/M8/tKHNJGVP68W3jv68mGJ0e+j+VNryInjCcxtphVpzS7kNZT97uREPfgTlByfC2R8ZP6ChYJ0hdJW1NRxNiZ7YWncjgAJj8Q5b5D0DSR4hPY4D5dVsBeDwVj1FXm3jI4D7mVDVKvIDWAALX7GChp3oAQ4Xfk33T+fj6wrHPa22d2tvALFkx9NIocSWBzv3MEzd6ErZML3pWZBhqV33zuEBcsgX7TLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pClc1SyCOQKZ1GGjSYisodXle1Fg+GHUdenSnzYGUss=;
 b=fjw0dDQ+4ITw/OoQeWabkxzDi6jmla3DRaw+YnOdTis7doIsFY5aXEf7hg1zuicITZ7xkn+ZhZfZ7HG4fbBt9lFhSaZSqGy7cmYBDBC5W9z4u/9x5ifKe298uWuP3wRYnMbkj05wXDAw7pMlC5CpJL+YUmhqbBK1CQghiHAb1XU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v8 06/13] xen/arm: tee: keep init_tee_secondary() for
 hotplug and resume
Thread-Topic: [PATCH v8 06/13] xen/arm: tee: keep init_tee_secondary() for
 hotplug and resume
Thread-Index: AQHc09l+7v4jgDmb+0a+B+BWKNJH7g==
Date: Fri, 24 Apr 2026 10:59:59 +0000
Message-ID: <89B9D5E8-6B30-4948-8375-0B48EED46017@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <666917e8e8e435640c272c19908f412c315b2dc6.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <666917e8e8e435640c272c19908f412c315b2dc6.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB8182:EE_|AM4PEPF00027A61:EE_|DBBPR08MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fda640-29da-48c7-2966-08dea1f0cfab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 nSmBOGo9wmaK/V8VjUTaGeK+48HSH9NDrR7g0o6G97ou8pv86QHIKmNFx6FN7QxYm3f5XYSbqSeUNaflGweN40X9Rhw0G5/OtjeG4z5MeyXmz1BdcPgTI0o3Ncv6W8o+CTLpo0hd1ceIj+GJ0gAMNvj0kV9eqotgJKF+HvcqCVd9Rg2JLFkXnGIGOaB/A9/GVNFTHuKkwtPPSsKCV7lSCeuQ3AYxwQLUAq+VQNpc+sg8KFqVZgukG7e1B83OtZrjMdJBIFVYf8odw1KluAU0nxoZt702X/l6JQn2lZg0/fobLWHYPMw2JL8JBs88Prrm94X/OtVYzqs/vJXra1CE/tdJDekVxkAkmu8SSlOROzmD+1WZNfbvx8Hv2FGfEx5NbZqnA35JRKeRzi/lqLbUrc+BU4ZkrHGNLruWJ/R275+Pr0yprfIWpgkSpei/0Z2B/FK4Zoq9IOma5c8B3EVzc2eT4cKMMsAWj0UEbzsU0DVwwHHzgZfbmQFEhcD+nXRyOXSgXHsJwJbF81QsTudxsT9ef5JydovQGPAmDtgluIoNTQWpY6ebzcMAEgLdpYqXE1++0z2/mBwevNKMIQ8pzWMb14Tus+/o5NNZvQPrfLOagjmvqb/oA0TbwqY/KfOZxLWdRK7qGICvw3Se/1UAjZgX2Drpaj2YrurzlCc2hcagoP+Da4B48gKqDvtXWzk0V/oP8Sw5RgWU6LmDwA34schkFL9tpHEzPa2QykBp4WnfWhkvJrJvi3KbjFb+WiSIAUItMeB6uIfhVWyofwVKoG1M+w+sAq3Jv9oyvfTcdyw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5236B14D9273740BF812A33698A501A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 nqylNRMqsuevXZJJgL94gVFUBzkbi2WyEYrItQpygHZXt81ZPIcCEa2fImgE7oe6IHh4H9THYX2iMRXOQeiDaGD4n/d2FaFNw0Qv2eMMX5Oc/DhMRg2r4vxukdd3AQLnKdjaB9GosN1wbGRG0YE00ZWrsfDDv+gymL35+5ljJAq40HTgrp70Z5FSDZPfBAqLbkckxGZbF3M6NKmGgUSuSHCp0/7R3AujEvD4aeiNj+NQ1v9SjUfmLs79QQ2+cBI3yx5OT7j1/faUistyKNbflQXcFyIR6tp4Lkic9VSLucknnp7kVel7QStN7ViTeKkY7Zl7NlZ0eHC6c9BtVrMsSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8182
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89bef2cb-e24f-4791-98a6-08dea1f0a0d1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|35042699022|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	K09Q2CTvLdXs1UrvVH0KBxqPO4n1MXT6BvDRCQ2VKhRiTNtIsK4nYBu7m+K1WgT9lZjNbpDFr5aTcZiSAesYE1oTYg+R/fFcD0XsdP54ILn502k9FahIXOcvMHWbF7KSIkmbwz8miWGD31iwlVqNHOsVfYxvwHC/PtZUr2qJXY8IVoZxbl61xjnZxg1sYKTzAD78QTwErBnayQ5/Baa8yKso/GFyHZ07srKAE1f7LUsLDU0BayAju57r1p/h8kuiNvWtAO31JgBxMV93bOb0T8DE7znuZyGC0MmXbeGj9ed0CEk+s7VJ56U4a0nimxEp9nmMKp7aQmxfyGugnaBF5yyQ9hDaAO5Hg3JvONTXNFRZCjyoVy2a2qWgR4walwzkbZFvgNt+ZOtRLRkVNWxrkkladA+VoDsBQj2Cp7ILHierxkUJDj2JOvr3MZfXXIWj67Z7p6jI6kofzJN+PfqSlpU6rr7bXkYF24lH6/Zo6xymBBxcDuj3127HEtMF4ZfNykQcAYAZsBozoA9bTCdBLhjeU3NIQtAll4HYmajYBx+8KjSWV4AgkmKJ2TEaf+7A0BUEdfe6fPe+pz2oQaP6HigRD/28cXSvferWNE2CqPg1N39u6Ggxna74GYO/JSPEaZHiVF4Dq+WHdzU2npEvlVKL9Ch+gG5OHmgN+DYzjq1e81UU7TnUdBD3dBxLD8/bUMq48lYpPwusWX9WtvVxvaYSl5UO85QGhakR8BcWPskq+mQK8q4S8Oqv3gSDd60mawPE4KoXnKXU8TFLIhSIeQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(35042699022)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6e8KRpG+ePJx54onpbyYfLRBoV/80I2lFCo8Pa5BWyKhHhg4B3cazZ5HZPFHv+JowDBpI77hlb8cwo4EDDawhB4t5wGw41a6mNrMZigCQVyJKGgpS0/fpahivzqV89rgnI6qLz9Jww3bjfOm9r8Do1RX4RmokD/YYE+iK27IWLqMTrIdazv5aMwQEOADGrqIXNAe7UQ/JFrHtoD48BvROjhYeNJu8Tnsh3wBUM5zR9KCFJcE5+Ci1geblKIATCeaHvgkjmEcKc4RPnenOBcJyvbcfhFnN8gUEjlHyMlDfFzsoBD1mlnr/UVBo7QMZ5uf0cVOwLqZoYXVQ93XuEFglIMWJcWhfsSDC/SWSDFDfmkCZjvV8zL3z6PQLE9qE45Elzs4RwCEm3R+43/6OUEVIkGpf/+/hbpVdPrsNY3WyFbjXdbQTYdYmS5x6HyCkBTk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:01:18.0274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fda640-29da-48c7-2966-08dea1f0cfab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6219
X-purgate-ID: tlsNG-ef75cf/1777028480-15458C48-7776A1F2/0/0
X-purgate-type: clean
X-purgate-size: 1101
X-Rspamd-Queue-Id: CF7BB45D6E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:Bertrand.Marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,arm.com:email,arm.com:dkim,arm.com:mid]

Hi Mykola,

> On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> init_tee_secondary() was marked __init and freed after boot. Calling it
> from the CPU hotplug/resume path then executed discarded code, which
> could crash Xen. Drop __init so the TEE mediator secondary init can run
> safely on hotplugged and resumed CPUs.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> xen/arch/arm/tee/tee.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 8501443c8e..00e561fc78 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -128,7 +128,7 @@ static int __init tee_init(void)
>=20
> presmp_initcall(tee_init);
>=20
> -void __init init_tee_secondary(void)
> +void init_tee_secondary(void)
> {
>     if ( cur_mediator && cur_mediator->ops->init_secondary )
>         cur_mediator->ops->init_secondary();
>=20

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


