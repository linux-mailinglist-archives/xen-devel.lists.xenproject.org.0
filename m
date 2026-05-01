Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFmaLN519GklBgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 11:43:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF374AB5EA
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 11:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298623.1573788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIkOg-0005xH-Qf; Fri, 01 May 2026 09:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298623.1573788; Fri, 01 May 2026 09:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIkOg-0005ue-Nu; Fri, 01 May 2026 09:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1298623;
 Fri, 01 May 2026 09:42:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wIkOf-0005uY-J9
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 09:42:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIkOe-00AXpc-VM
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 11:42:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f47593-e002-0a2a0a5209dd-0a2a4504b3a4-10
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 11:42:56 +0200
Received: from [52.101.69.42]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f475a0-1dec-0a2a45040019-3465452a896b-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 11:42:56 +0200
Received: from DUZP191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::9) by
 AS4PR08MB7733.eurprd08.prod.outlook.com (2603:10a6:20b:510::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 09:42:53 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::17) by DUZP191CA0011.outlook.office365.com
 (2603:10a6:10:4f9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22 via Frontend Transport; Fri,
 1 May 2026 09:42:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Fri, 1 May 2026 09:42:52 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 09:41:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9870.016; Fri, 1 May 2026
 09:41:50 +0000
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
 b=C6TALPBkLk9TvCMawRS7C0Tt0VXRCyJHDncwBXQjjTA0gWamtC71Nv7j/ECTXNP6fVRPfULHbSOAtUM6C7Mmmf6YPfFliA8ZZrQbV7DefSNFzjrh7wZUHQpVvKKknK1QjXvy7WxZMvr79gqCWjUBy+pYchIBZ+gAE8tgJETEwcRnPfwbYrf95A23x57vcdWpy2LcZra5vk22dUu9SqDDNiSP/GjL26OXM77Im3zXDZtC3f1jkuPzby0apDu2sDTV4zRn6Hqd/y+zLICG3/8l2sK82ogtJeJGzCZ+YLEiwyVuI7eKyxfv5z6sRIANcuUY1R27CcYLdaK+S7yNsDvS4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8iLryvx1fW21SxdaNFfhYgHa51F0iStH0NN+Yobfn8=;
 b=aDFsbDWDjQ9dq03m2u46nMgEt004vZdDXeieghRNhWFUbZ2QRTlrgYigdjiaWXDwMl8970gawfHZ9SMXXIszjMubM544OT83B/Sq7jnAwtZfoEv2EWtl9Rerl0C1rj3m9x7CAhHWvzbvpBpu/lipBUCrpJQmAoPphj4aSxoAskzw9s6fh43GShRLee1TUAsj8/smqYkXnZ+i5ZMLwIl+ROTAlPn2zXRr6DyzyvJgPnO/eQ2fb1KTd9Ymk73ssiD4P28P2ztlFSDCsbcq6Q6giqC51KlmCyusgu6DUpa2Qa3OAWq8ntkLiApQwlnmBo1RWNgGob4eagDVzvftg2LrHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8iLryvx1fW21SxdaNFfhYgHa51F0iStH0NN+Yobfn8=;
 b=Ao7HsU3uKRbf2w3Y9gTOZvbzP7VG1JV4xh4fbpAbLaJSRafWBavOjj8TJEcY2GNsHGCZaJ09izxTiwoh9Pt1dsYc3Aey2AHiQsAeoSmYzAnIt174r3lKcFZXuoLxnF13cSOOyt28RqeHeL6ggTsq8sO21kf0pyxaWGfImngtI+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoagBfiCZ/5XXawhdC0RW7m9bPIP1/Ohq0V/fG+OAjuG5suxj7A2nfrcoiPxgyKhw4Nwvxj5p/FU6uUAen8GYwjKxYDyig8hV08OIewCNnY0KG75NX8TkKwkaPR9FHcDozs5dH7taGzqvhxKBfKWvgVB5+oRHqYqIDBBbKvCq6Tqf/94JfqiydiWlckxp+mmFL4MKDeAMPMPxEiunzGYWSIRZX9paafDdybitG7RRdhYD1Rmq1eD5gOp9eiYIhHwAuhVr9eZ+ZGb++Ven5xwou3h6Me3PsrVGKMc2HcS8Akq22r84+AbWm7StorwOLV3QhwPCVAMt8/A/eFqvB96Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8iLryvx1fW21SxdaNFfhYgHa51F0iStH0NN+Yobfn8=;
 b=a50HFlASlE1XeNIiki7ipbOZ93ktDeQxALMBO4N8W98N5DsU5eDzfGnhIFcPkYuk8V6EczEzq/IZeIDVW2NnL8DlP8BugWg3c/HAhCw5dtC0FvgaAjJOIYWe4LeyIVR6mSXVfYMtiA+pNbYm/YLFvxpK6q1c3WCINjSXqkGcnR2ezygW5RoE4amborO4RJO/GSNN0a1clnCrbhklalJxEl2lcqYh0WC4hLxnfL3IBSCqY/bt+nQRnpJNZ4gnO06VRpQtY4ydjkxZY0q3H7M2cNKr3iAexPBshaq5P83XkuUpvaj8lOZwSmy7miHA++aZnRY15RMJ3UrD6HNxKHnAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8iLryvx1fW21SxdaNFfhYgHa51F0iStH0NN+Yobfn8=;
 b=Ao7HsU3uKRbf2w3Y9gTOZvbzP7VG1JV4xh4fbpAbLaJSRafWBavOjj8TJEcY2GNsHGCZaJ09izxTiwoh9Pt1dsYc3Aey2AHiQsAeoSmYzAnIt174r3lKcFZXuoLxnF13cSOOyt28RqeHeL6ggTsq8sO21kf0pyxaWGfImngtI+Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
Thread-Topic: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
Thread-Index: AQHc2KAtk6uvg3kMbkmyodn66STuo7X47BMA
Date: Fri, 1 May 2026 09:41:50 +0000
Message-ID: <9CEA7814-0ED6-401A-A5E9-2361278D9859@arm.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
In-Reply-To: <20260430125103.401811-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB6546:EE_|DU2PEPF00028D01:EE_|AS4PR08MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: df9030e1-93f0-4cce-d91f-08dea76603d8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 8sG4KCIr9blKr7m7Xg7nTVLTVs3GSGJGYHoBFwtJdSCb60fDHgusDXXS9vae/omSbWEUZ3RCImMZIvIKmxbPetbxTUywWS3kgbcg+0KqLktqvou0zBxh293KbrCeDtjC7Q+1hqIe/too4OXF637gQu1Icj6pyHOfrRJZD+mAwVkADwjgOXLDnZX4fDG2F8oQRLqbiX0FY5A11Vym4U/cAcUPA0N7hN5uHQoKrnXY6k+OmSM/ppNOB6ZnyzAwFX+y8cZELek+kjDBHJ47pgHY1pJf/xeiyyqvDPhy5mZpe1Y6yvtodn45PadfTYZQbCI4Pnt6j/wXTonjNwQRekOLs/xUGlkgzSQr0tXAXgpvYO5WyHTXUzIUvACMKXC5n9E/nWZruXiOM35++59ihpDJXsVw3fx99R92+IKlphNCNb3WKQ0dPCtfETRHQTDyDr45Uqb5CymWevN5SnUHgGR7jMg3wf5yuqUbFpLRqjyOV4gw/svM+UkoUHiC6RDfylJpu4DpOdacXY8eRTbnvBQ8pOleqGOh9BOdI0LoKLKuYkbQHvZrOE3NC66Q0xIO761a63ZTEViOIXJMcY9KDhDZcJXMJkMuArCs1a2o+nmhnwpY145g3AQVx5B63ub99a6rhEOaIBMDtXl73c/ZYOhPLUIL6Qp8kLu+oKkz9PIoJZjLQZwIpXL5055/tus1QhaWmFciEmaPxo1tuoYIsGOhxs83CYg91zpqXm9g1qyS6KTTgHGEsZXUf7DkQXYGP08t
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A1E8F5BB114A945A6BF41B992BDE68A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 CX0iTbej7ZpPkMh7a2B6tvp1MvgdH0LYypMstPE2a+2MftS1vHjLS714p1c+01sALjQJXLzXTi7dAsna9T6qXdqel+8OiWsHjmZa40ahiMnJOrcg/mlgcl4fs2JjCDNNXmfYdb3HqDhWaJ1R0vbRkfVi/srGNAdzKawONSJZwNKQiHnhxtd6HdskA7c47fWKPfslpdiqJrWVBO+HfGm5ODQySXY/If9Sby7YAyyQfjelq69qqgYNfyWDkEPeBFkOfVyPfPnzYXwL7bfomCrQZRHNOKzIps/3bq24NnYE6GYGospu6ijDHa6lR9zX4YrEF5qmzSepgGivdeDI0L2l1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c10437f-ac00-41dd-07ae-08dea765dec4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|14060799003|376014|7416014|82310400026|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ax/5GjjXVVfplnKnYAesiwkN4yj0e+SsMvDjoI3WvDWotoDyZQm1qMPZwC26ZZDtr4Um9U6DVhdA7qfkSGaOd7ZjFod6Kct2aua+ADjk/kRTcLXw+FXs/quuDtejV7bAGeHW7FZwL79GbtUS/wp8CsJmpTOJZ9ShWk4Y29TUw+eSmJ9NZRhDzfqon8A1iSJKID7aYr9mHaL7KFWjk5XLlv9Jv60NpxrB7Z5ImXB6ULRCjXP/yAzYIjulC8SBWlU/U/BwZTO9whL0gZEJ/Pb9LT+wK5AB8lbSb5C3ft7mtC3ZSZdQYZ91A/fJ122F9ifG9AU+EE7cejws7CbV9C9mig5bL1npeYdnGxbXUh6rek6ObB9HHc68yd1JJceZBw68wCoyrGbe+7W5GpR/hS1iWc7foJef/4uBFMkKTJ72bdvYxOunmyXdS+69L67fSVvZt8CqOjweHXjTu77zPhWSRxZfAvQTjky+i2+qbcv9+MYkKunV23J9CbveAndt+EX5bJSRPbN8mAnykyMH/CHGmTCH1osgso8dyy3H1Q9pAXErrzJWIz/MJCZYiklLQfeN/xCfg9eCR2DUAjcTiTiMeSQzMjgYdRkX1prQNL6J6zg7hhSn7FYMFrdgM6HOnGvaCbHo44N+q0QAgq5kuagQhBhyhXeLn8XEKhQHgggOmw8xJPsEIHfVtFJiCWKx8aJfE27d7m+wGCjKZDhZU832faYyy99fHHzWAOt3hjxToEw=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(376014)(7416014)(82310400026)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4qWB/I9QxwugBtBukn2B5HQH++y0/y/eYyEHe6hj5DIjTy9IJP6TBT0uyIz6nl0wZanhUBycX0W5xbsvGosQ/8DmDIJE1wMLszIVpHpgS/oiprzCzDVhugbfrrjApKfQIr25YzpzGEP3gNVxK3i9FMfgVuqrd6dQ64W9LHY6R0Ki8WCpK2rdjbVULZ31Qet/TQbcAaAnYwnr7XXczoAtISKHP0NrDNtgbZWaW/IApz7oSy/V+Qe8i9uq1uYoFDh2crPHlNEqQ4nJ1FFnTLaeF8BvpsxQK1Qh0BkWCvkH04Sk6TQKXT8r7l6qZweUkpxbHNL5abKjzwqjx3EnuFbxP1L1s4hHqsdXOp/AieICCUlV5cRUwEkvYxQMCRAmPmCOYMtgyOR9IePQUgaL7DcoVkUteqluO2g/TR7OEVR+nE13YtVNizEnOJU3ZiSfG+40
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 09:42:52.5261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df9030e1-93f0-4cce-d91f-08dea76603d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7733
X-purgate-ID: tlsNG-ebf023/1777628576-300413FF-39A645E5/0/0
X-purgate-type: clean
X-purgate-size: 2492
X-Rspamd-Queue-Id: CBF374AB5EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]

SGkgTWljaGFsLA0KDQo+IE9uIDMwIEFwciAyMDI2LCBhdCAxMzo1MSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgZ2VuZXJpYyBwZHhfdG9fcGFn
ZSgpIGFuZCBwYWdlX3RvX3BkeCgpIG1hY3JvcyBpbiB4ZW4vcGR4LmggYXNzdW1lDQo+IHRoZSBm
cmFtZSB0YWJsZSBzdGFydHMgYXQgUERYIDAsIHdoaWNoIGlzIG9ubHkgdHJ1ZSBvbiB4ODYuIEFS
TQ0KPiB1c2VzIGEgbm9uLXplcm8gZnJhbWV0YWJsZV9iYXNlX3BkeCB0byBvZmZzZXQgaW50byB0
aGUgZnJhbWUgdGFibGUgKFBQQyBhbHNvDQo+IGRlZmluZXMgaXQpLg0KPiANCj4gRml4IHRoZSBn
ZW5lcmljIG1hY3JvcyB0byBzdWJ0cmFjdC9hZGQgZnJhbWV0YWJsZV9iYXNlX3BkeCwgZGVmYXVs
dGluZw0KPiB0byAwIHdoZW4gdGhlIGFyY2ggZG9lcyBub3QgZGVmaW5lIGl0LiBUaGlzIG1ha2Vz
IHRoZSBnZW5lcmljIG1hY3Jvcw0KPiBjb3JyZWN0IGZvciBhbGwgYXJjaGl0ZWN0dXJlcywgZXZl
biB0aG91Z2ggdGhleSBhcmUgb25seSB1c2VkIG9uIHg4Ng0KDQrigJxjb3JyZWN0IGZvciBhbGwg
YXJjaGl0ZWN0dXJlc+KAnSBJIHRoaW5rIG9ubHkgUklTQy1WIG5lZWRzIHNvbWUgd29yayB0byBl
dmVudHVhbGx5DQpiZSBhYmxlIHRvIHVzZSB0aGUgZ2VuZXJpYyBtYWNyb3M/DQoNCj4gdG9kYXku
DQo+IA0KPiBXaGlsZSBhdCBpdCwgY29uc29saWRhdGUgdGhlIGFyY2gtc3BlY2lmaWMgUERYIGRl
ZmluaXRpb25zDQo+IChmcmFtZXRhYmxlX2Jhc2VfcGR4IGFuZCBQRFhfR1JPVVBfU0hJRlQpIGZy
b20gdGhlIGFyY2ggbW0uaCBoZWFkZXJzDQo+IGludG8gbmV3IGFzbS9wZHguaCBoZWFkZXJzIGZv
ciBBUk0gYW5kIFBQQy4gVGhlIGFzbS9wZHguaCBpcyBpbmNsdWRlZA0KPiBlYXJsaWVyIGluIHhl
bi9wZHguaCB2aWEgX19oYXNfaW5jbHVkZSwgbWFraW5nIHRoZXNlIGRlZmluaXRpb25zIGF2YWls
YWJsZQ0KPiBiZWZvcmUgdGhleSBhcmUgbmVlZGVkLg0KPiANCj4gQWxzbyBkZWNvdXBsZSB0aGUg
X19oYXNfaW5jbHVkZSg8YXNtL3BkeC5oPikgY2hlY2sgZnJvbSB0aGUgUEZOLXRvLVBEWA0KPiB0
cmFuc2xhdGlvbiBvdmVycmlkZSBtZWNoYW5pc20uIFByZXZpb3VzbHksIHRoZSBleGlzdGVuY2Ug
b2YgYXNtL3BkeC5oDQo+IHdhcyB0YWtlbiB0byBtZWFuIHRoZSBhcmNoIHByb3ZpZGVzIGN1c3Rv
bSBwZHhfdG9fcGZuIC8gcGZuX3RvX3BkeA0KPiBpbXBsZW1lbnRhdGlvbnMuIFRoaXMgY29uZmxh
dGlvbiB3b3VsZCBwcmV2ZW50IEFSTSBhbmQgUFBDIGZyb20gaGF2aW5nDQo+IGFzbS9wZHguaCAo
Zm9yIGZyYW1ldGFibGVfYmFzZV9wZHgpIHdpdGhvdXQgYWxzbyBiZWluZyBmb3JjZWQgdG8gZGVm
aW5lDQo+IHRoZSB0cmFuc2xhdGlvbiBoZWxwZXJzLiBSZXBsYWNlIHRoZSBfX2hhc19pbmNsdWRl
IGdhdGUgd2l0aCBhbiBleHBsaWNpdA0KPiBBUkNIX0RFRklORVNfUERYX1hMQVRFIHNlbnRpbmVs
IHRoYXQgb25seSB4ODYgZGVmaW5lcy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4g
LS0tDQoNClRoZSBjaGFuZ2VzIGxvb2tzIGdvb2QgdG8gbWUsIGZvciB0aGUgQXJtIGFuZCBjb21t
b24gcGFydDoNCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJt
LmNvbT4gIyBhcm0sIGNvbW1vbg0KDQpJ4oCZdmUgYWxzbyB0ZXN0ZWQgb24gQXJtNjQsIEFybTMy
LCB4ODZfNjQgd2l0aCB2aXJ0dWFsIHBsYXRmb3Jtcy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

