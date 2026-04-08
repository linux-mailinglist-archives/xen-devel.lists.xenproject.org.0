Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF34E5Vl1mnIEwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 16:26:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1F3BDA35
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 16:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276256.1561792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATqq-0008Ci-NS; Wed, 08 Apr 2026 14:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276256.1561792; Wed, 08 Apr 2026 14:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATqq-0008AY-Kf; Wed, 08 Apr 2026 14:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1276256;
 Wed, 08 Apr 2026 14:25:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wATqp-0008AS-E0
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:25:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wATqo-0086W9-FB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 16:25:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d66563-2eae-0a2a0a5409dd-0a2a4506e176-20
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 16:25:50 +0200
Received: from [40.107.162.18]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d6656d-0df0-0a2a45060019-286ba21249b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 16:25:50 +0200
Received: from DUZPR01CA0204.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::25) by AS2PR08MB9320.eurprd08.prod.outlook.com
 (2603:10a6:20b:598::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 14:25:45 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::48) by DUZPR01CA0204.outlook.office365.com
 (2603:10a6:10:4b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 14:25:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via
 Frontend Transport; Wed, 8 Apr 2026 14:25:45 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 14:24:40 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 14:24:40 +0000
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
 b=J2hphFbLG+Vq88AQM4HFM5h4U4KDu0lB+eqvuuLF3zf7w88I/6hzjgDXuPD3ny+ucpluK6wncgqNu5Y9GJGXSzo3tPCLZrbTnuZq4nQCDCLDkyliV6fOxp34VrknebepqWfk1E//+D/WkvooNo0UhswE37ZMlkUlEz61RqT2xFuK9TnKGpDEU6tGfC9YS3QkpGUt+613wkJ7rbEhTFoKSsnBlv51guFZwWUtIoWWpHYFES58bho3cwqyIENmToUZHae/ctD5wTarAIfCc+cPcxiM4WxTcJX/f+57wy30HXthpgFFqNDAR9U5a+jp3VsiKfOuUNkHo2cDbiFaSo5H5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crjtuVI0/8IRJIVmV7CB5LK2aDZnz4Cjmew4sqLTOXI=;
 b=WnS391qCSBWg0GCF48nTFc4/3IqNZG6fKnJhbl+n4Ev/tQs3xBakPQ9uO/l88IIEJKNsuZurGvvCWG75YJvez9LxwCAgxKW6F25n1wdU/bhAt80YJ4k1SLYGDhMZmgJNcIh+N+6AQ6HcHJLNEVJrOUE9SAbGbLysstomHOuNvYGRro4IEmYXX3C9WjL7C6NLJcZKTZ3VmBkVlSfH4nfYln9VeKyMGtBWAHmHy4TtiVR//LLFUar7TDnI7/U/P732Tu0NpygNqYJbrLp2IGqbJkP8uJQuMNnTrRt4veLwvtEkeuuRytugIveXL33vHO4vn01hovblWLpBfrKOq5XHqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crjtuVI0/8IRJIVmV7CB5LK2aDZnz4Cjmew4sqLTOXI=;
 b=TN0gwgmXlkVD21O8i5r/wqmsQIj9e6vSWtEOT9AGeABXi96VqI0xMPwlvxaWLAoS49OZi/4d6A9lqev1QbBj9ynFMp9cj1IU46d6JGsodZPUXPUUjNgpuwITGuzS1yfa8j5ucYU4SWBcNIbhM1ivCxQMh5aFQUZIlNxt4bqbnzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4OCMVXri277bS8AdrzYYlBvtUf+45+xkTLXk4CWF0I/RktDWS450+H6MaiqB9T9V8JHTXHs3AKQmc7o/8ZUx1vmSEeShkWNwS1jIjEupkL97SfCBuOpOnE4iMoZ2VJi+lFC16pVIpbZh+6pYhl9bYgOpIL/XB36tlCS9BvLsNhh0HP4iQ3hpnaxCqbyRyYvy9qnFp2JPGVhvS5P2Wu42Xg0Iq2sLDRnw063WbVRlBjYDCqUdybk2mHKBru1A+/ODfGD2I9VSUeA3M4ugS2nNNUt5tom9ub03Hq0T/XnVX6pykPU6MTrPH0i70MyQg72dHvXCB2oCBpfYeFUDP2wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crjtuVI0/8IRJIVmV7CB5LK2aDZnz4Cjmew4sqLTOXI=;
 b=SJYukOARCpgplZ0GTrx4RFreZtaYeK/6rckLZ89JrE8yZxiIO1u39cWVyOkIStYR3Wj3EXeYmwdpyeZNP4QZvxVKSEhhRCCVk0awdSDFWO2wXMUZ5Q2WokuXFGg5CJyd3DiSk19aLqI4pFfBgHIEkFby5jBerZkI55KkVXENcepgt2TcFgX9ylJbAEykY+0yD327cdN0hlzN161kYu2z/0KCo+o9mZJwIEu55ThCFwM9yPs6nosSSlolPR23ph88eXRS/JaOrS5T/DY1XWOM03+1z1Zqe6Kw7C8Tsqq6zFc9uGzebvlPara9SPrxg3Kt/mVt0hc0r09CMfHvhnBhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crjtuVI0/8IRJIVmV7CB5LK2aDZnz4Cjmew4sqLTOXI=;
 b=TN0gwgmXlkVD21O8i5r/wqmsQIj9e6vSWtEOT9AGeABXi96VqI0xMPwlvxaWLAoS49OZi/4d6A9lqev1QbBj9ynFMp9cj1IU46d6JGsodZPUXPUUjNgpuwITGuzS1yfa8j5ucYU4SWBcNIbhM1ivCxQMh5aFQUZIlNxt4bqbnzI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Topic: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
Thread-Index: AQHcx2Nvy01nqbaxNEymwM2jnpP38w==
Date: Wed, 8 Apr 2026 14:24:40 +0000
Message-ID: <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB6546:EE_|DU2PEPF0001E9C6:EE_|AS2PR08MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: d569e302-a090-439f-380a-08de957ab8d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|38070700021|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 j/DIS/D8DUT1wwT+yi+QWDtPBPalJh+hIlyzZWx2unaOp87mGthmFjSvdwJCN/402Td3snMKXzSxJzyE6CkQcwhyNUJBM17s09Gp28K9ZuAcqswdYApS+b79p0uaL5Mru1vhvdIx42r5EwTKyxRfb0K7ZUSTA7hsxvxw/nkTOr7twqY1L15T8b6DByJ6HM6dZ4Auo4T1eW6fnSSQUhPNr7BVcK6j3gvDWgccn5Qv1WlJV+XIbF0ow0Sa5eHk5jUFqOlY+VocetkNJfANNIWbG6cV4OPdMs+uSEuu6ebP/TNLAoUbjhJM31RKoogkiuRfhDKeOaWWS5n2AhLHeLCUdi4yd6xmjq/vfUI/713JUJZiwhmrBSZ5KElnFZcgOkvC4evTBP99E5cOHFzg6U2FHg1yQm11vOQgAQtFzSM53YmekeM93ITX6Y3emuc70GhiSTpdwkV+OeA9cQ5bTp+sNZlnumUf9s2hiN87lVDIo6EG8IPMsJ6+YPjhnsBx+cCxyXCiGbrhwTc5uPhzI10JG85y6PoO9XaBVvEjaQoCzs6LMKAkz3QaFhMgV6lzimAtNCB7nXcKpg6zK2kwrhPyz7bTKcJe9YmWQB0rotkQ3nUrPMLHCCDRFgKfSC/wPnAKujF35c3rCOugR5Ul3QLFk6rGmCuo8O9XUtqeq7/dO7afO1cj0BtIYPuwPUuWJb8yB0uwvP4WUa9vAOM5NzJvBgfFT1vE0V25emQsHphiEIxuGu7RIvtNLA5hTsPF1eHFoSus/pZAKzEdkdfAgLhAIb1/1eD+aeUXb7ljxqQez1g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CA97545DD63005458BB23B70344E52F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 HkFEwcI00r4hWWJ1pWMzbKQLRJOW1awcj4iVHNivVWAzdmF/58rSpOuYrJlUc8zMsehgQgjK3Wdyd+U56gHERcCJKFedDJz/qToQEMokem7qPpV7fPk3YskRVyqPp0b1qJBX7FpWNRJdoD7h1G8oERkFCK6wrG9Gfs73UxoO/I9VB7G0JBv3vl5EcEWZBPozjxMBiOW8+s0ga/fPRFq9RoR9QrNawmKfz04z8f4ke1OgTcSmEazmflAohmS38ixdGAZCvb97hZmOWSA3mrKYIUoVTYQ5T07k8LLZdQ29ISN07C6Xkw1GTfc/lJ7JqgkiKo49LNY9ni0NTaHzp+oEog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	00cb39c5-8d14-4506-8db1-08de957a9243
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700016|1800799024|14060799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aJmfcubT3I3MX7wG4WcHyN9HskNnebgM/QpAL3DfqCAWzqxJTOd1TQzXNIkMlQ6R5l6MitbOrZx4ss1exaIXQE8IeUttHhsoaTdYKU//1ut4l97bw+6m5ca8QyPp2/6RSn1CIqZXRJ9cmXudnK55nKOpE7LM2dyXW4x9ZR3p4mKUq+Ki4riYb9/P05AXrI5rujxRENXYy+gt5yjXadTIMONaGMYM0GLjis7eYKPjue/kvhFyEeZibRx6naj4bJey7VsfHhD/uc5gQ+hboxJrOtFs1mhWUPIKlPeb/dBFQqiNP1uV4wXcfGXm6fp7rISbAdPqDXHrn8ji2uo0mYHbDkBV6mhaVJ+ZNsT4NvVi0LLsiDQYMJ32ntdAkzYaBiKO0rW8lWAtsmKFPvj2bETttJc56IR/wMeySoLrKXSU0R4W6KwwG8cwVDlm8mNloIZiyw/7D+4dremUI+JjWEHjbCtbJXPbmq4G/jNoq51608/gS8nVbU9JfHobFk/VtLYGUdTU5ibP5KUXlxX84aMazEfZtw1ScAIKj5bfRbiDfFuUK49mgymvIJSNfnPPTOvjVv9yIfJttbgsVRziiq/PNPoYPPeoZqZ47P+TUvVxfydajZW2ZWP9749onpVO61UDYtlzMqAaqjnPhfxutPBDdE3FEm0T4qRvvl1T0QoW0FN13xJEsG9EgDmX7wpZMGGyYYJwt4HBoBV1GiSvSSbHEEQ0Z2Ypl1Kt/tS9T1TSIvCCdRqQmXru9u5VUX1wlUjs6DJOp/rPJgsnr8oRxc582w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700016)(1800799024)(14060799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QCksOqbixVEpTvS9hZR23IqJQvFnnQ86AU85cemBFlcWNWBmSHodV/y0QzgYNYrUhiONm4q+NJkRuqTLxmSTGGSffDYK3QtBgyjRoqJRU3f0mnH1gKG9O2VAz8E4+Hf/YSQOv4wlCOK+NqDVU2v0tR9bEso3rAi/5tCmMgfAGamiyPbywWljbW3CqKa6dl8zD626GtGhGgP9Qbr621TEFGOfF2lS5w8STK8V5vhR3G9hIf6l74UQG3u7U7DIli6xcDqbTUdHEIl6ZIhNllBYr1o8XanMo3WRMoaY5ofg4S0kxiZw32Ephc/Lv9CFyfsgCGXU0c3hOkG4aXua1xkaA8v0+hgXchxk0Kwro5vnXXjTbkppD6xeNtQuR41h6i6KFcBjuOFvIiSmpUMMnAicfFm9/DUOYG7IiDXt7nQO0aTE7j8fjKN5qeM272mYmZmg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:25:45.1709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d569e302-a090-439f-380a-08de957ab8d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9320
X-purgate-ID: tlsNG-16d1c6/1775658350-5EB333D8-4DD0E899/0/0
X-purgate-type: clean
X-purgate-size: 5436
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,arm.com:dkim,arm.com:mid,arm.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 8EF1F3BDA35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ayan,

> On 18 Mar 2026, at 14:09, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> One key requirement of Xen functional safety is to reduce the number
> of lines of code to be safety certified. Besides, a safety certified
> Xen requires a static hardware configuration to be defined. This static
> hardware configuration is described as per the test hardware/emulator
> hardware configuration against which Xen is verified.
>=20
> Introduce GICV3_NR_LRS with the two aims in mind:
> 1. User should set the number of GICV3 list registers as per the test
> hardware so that the unwanted code can be removed using GCC's dead
> code elimination or preprocessor's config.
> 2. By doing #1, one can ensure that there is no untested code due to
> unsupported hardware platform and thus there is no safety impact due
> to untested code.
>=20
> However if the user does not set GICV3_NR_LRS, then it is set to 0.
> Thus Xen will fallback to the default scenario (i.e. read the hardware
> register to determine the number of LRS).
>=20
> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
> This ensures that if the hardware does not support more than 4 LRs
> (for example), the code accessing LR 4-15 is never reached. The
> compiler can eliminate the unsupported cases as the switch case uses a
> constant conditional.
>=20
> 2. RAZ/WI for the unsupported LRs.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changelog:
>=20
> v1 - 1. s/lrs/LRS
> 2. Implement RAZ/WI instead of panic
>=20
> Few comments which were not addressed
> 1. Do "gicv3_info.nr_lrs to LRS" in gicv3_hyp_init() and keep the code
> unchanged in gicv3_save_lrs()/gicv3_restore_lrs() -- This prevents the
> compiler from doing dead code elimination as the switch condition cannot
> be evaluated at compile time.
> I am not sure how to get around this issue.
>=20
> xen/arch/arm/Kconfig  |  9 +++++++++
> xen/arch/arm/gic-v3.c | 14 ++++++++++++--
> 2 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2f2b501fda..6540013f97 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>=20
> endmenu
>=20
> +config GICV3_NR_LRS
> + int "Number of GICv3 Link Registers supported" if EXPERT
> + depends on GICV3
> + range 0 16

16 is the maximum supported since ICH_VTR_EL2.ListRegs is 4 bits [1],=20
however how are we handling the case when GICV3_NR_LRS is greater
than the supported number of LR registers?

Shall we check that in gicv3_hyp_init()?

> + default 0
> + help
> +  Controls the number of Link registers to be accessed.
> +  Keep it set to 0 to use a value obtained from a hardware register.
> +
> menu "ARM errata workaround via the alternative framework"
> depends on HAS_ALTERNATIVE
>=20
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16..eaae95eb4d 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
> #define GICD                   (gicv3.map_dbase)
> #define GICD_RDIST_BASE        (this_cpu(rbase))
> #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
> +#define LRS                    (CONFIG_GICV3_NR_LRS ?: \
> +                                gicv3_info.nr_lrs)
>=20
> /*
>  * Saves all 16(Max) LR registers. Though number of LRs implemented
> @@ -59,7 +61,7 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
> static inline void gicv3_save_lrs(struct vcpu *v)
> {
>     /* Fall through for all the cases */
> -    switch ( gicv3_info.nr_lrs )
> +    switch ( LRS )
>     {
>     case 16:
>         v->arch.gic.v3.lr[15] =3D READ_SYSREG_LR(15);
> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
> static inline void gicv3_restore_lrs(const struct vcpu *v)
> {
>     /* Fall through for all the cases */
> -    switch ( gicv3_info.nr_lrs )
> +    switch ( LRS )
>     {
>     case 16:
>         WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
> @@ -178,6 +180,10 @@ static inline void gicv3_restore_lrs(const struct vc=
pu *v)
>=20
> static uint64_t gicv3_ich_read_lr(int lr)
> {
> +    /* RAZ for unsupported LR */
> +    if ( lr >=3D LRS )
> +        return 0;
> +
>     switch ( lr )
>     {
>     case 0: return READ_SYSREG_LR(0);
> @@ -203,6 +209,10 @@ static uint64_t gicv3_ich_read_lr(int lr)
>=20
> static void gicv3_ich_write_lr(int lr, uint64_t val)
> {
> +    /* WI for unsupported LR */
> +    if ( lr >=3D LRS )
> +        return;
> +
>     switch ( lr )
>     {
>     case 0:

Now, since we are using CONFIG_GICV3_NR_LRS or gicv3_info.nr_lrs in gicv3_s=
ave_lrs/gicv3_restore_lrs,
there are other part of the codebase using nr_lrs (gic_get_nr_lrs() is one =
of them), but all the callers of that
function will use the HW nr_lrs and not the CONFIG_GICV3_NR_LRS, so I think=
 some work needs to be done
to align them or there will be mismatches at runtime with possible loss of =
information.


[1] https://developer.arm.com/documentation/111179/2025-09_ASL1/AArch64-Reg=
isters/ICH-VTR-EL2--Interrupt-Controller-VGIC-Type-Register

Cheers,
Luca



