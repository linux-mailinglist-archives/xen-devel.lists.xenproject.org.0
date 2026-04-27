Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBu1F7kc72ml6wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 10:22:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B546EFD2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 10:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294704.1571396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHED-0000PD-EO; Mon, 27 Apr 2026 08:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294704.1571396; Mon, 27 Apr 2026 08:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHED-0000NU-Ap; Mon, 27 Apr 2026 08:22:05 +0000
Received: by outflank-mailman (input) for mailman id 1294704;
 Mon, 27 Apr 2026 08:22:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wHHEB-0000NG-W2
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 08:22:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHHEB-00CoOQ-CX
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:22:03 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69ef1ca7-5cb7-0a2a0a5109dd-0a2a450aedf2-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:22:03 +0200
Received: from [52.101.84.57]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69ef1ca9-56b3-0a2a450a0019-346554399340-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:22:02 +0200
Received: from AS4P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::12)
 by AM9PR08MB6209.eurprd08.prod.outlook.com (2603:10a6:20b:283::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:21:58 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:20b:5da:cafe::be) by AS4P192CA0004.outlook.office365.com
 (2603:10a6:20b:5da::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 08:21:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 08:21:57 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB3PR08MB8938.eurprd08.prod.outlook.com (2603:10a6:10:43f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:20:53 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Mon, 27 Apr 2026
 08:20:53 +0000
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
 b=Ban5M/CvdRWQOfyYs0fgpBKYIt/UzoEyeMOkkiHmQ1HwAHj64uVP/ITLBehntABl8ZTmbY0LO3hQedTBhezkr28WvJBYTTLq8faFw4wlfAKR/5lbV/smX/heo/KV3L2ICdYQgOIpBT7pjo4/eShQJ51EHWwrFRyK2uHiVoNR9jzB5V6WTw6ZePeUYhBDUrbg3L+y7Uly5Qj4JhPhNDe424p/9Za4JpDbFYafqIQRnJneRBRSK/kQtP8UX0Xh4IRHpyqnqlpxUkzTxTueBW2I00rXIto1wKyKDjXFh1hDbLat0MAvLMu+bm9Jg64Xq04eFoSYyOyWSwV1OOJwsWuhYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCNkNqsMqJk6cgMVRtnwyoi0rKOTto9ucmjvwaDAVQM=;
 b=uUjiMiWHPwWMfu+PwntiHuibuPgkDixttQbXQIi45M4dWRxPMUJ27KS+5UjVGRodEWWkmxIkS0EoAXQKGuCd6YIr1grTW1KskqFx6g6qM/vEkGxYiArkSKhC+UHEY2yefIM6XbNnT0+Eh578rI2jlAnbI9JcdHtRakIugW6wCGj/+cVNy2jkqOTTBQfAcySeirmxpAh0Ul1UeNixljMBMoHo+VoAu9pJME8M2oi55LQOdfF5Syr9quz7BA4O9YuxaoatSLD91n6hxAVeMNQS44CEpBXBcb6s9f34aNcasvSdyWF21vWINdt7Afzc1PwWBtnKZLd+lirIbkyAxDIXoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCNkNqsMqJk6cgMVRtnwyoi0rKOTto9ucmjvwaDAVQM=;
 b=VhS/bwSLmNxU3I3VxPSFXLRbDRYrsyfMGCAzJGyTKJLz6Mx/hVTz3OibSzH6HF2oBntoCcz+SMYmYjhhcdLopr1+B96KRe5MrxQk/q7eUog9HLVmKs7iL8Uu9dfYuVTaV+OMuk/5Br2ICvMLQgIC+Vks9OZ7WC4tdaqrXljFzeo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPd8MvcSP5d4GJ+ViHL1hi9Xe9W9gkeYVaI91QabGECwIk+uD4p90R14aXE4TiVS27zoqPX57YQHsrBam1JbEObxArZCHa4bJJsiVdX6VMBhGvC4YTDB++hBMQ66rjiJ2F/RS3Xl5bqx+sJEmfrJPqFhYuZBdxOD8IQsIJcP8luf+CB24xChI8/3gjcmk3JRTQMzR1f2IO8bs9yyfU+fWw0/47a75g8baYOPDAxE3IXgAIVFCP9+oQF2gOubgLM5OHWRXSXqYiJfrrMaHrY+V/YE0jpKNyScL8adBGzEFpDM0TgwDWhXB1eRYg2dtHvPxSYNqTwppqTl0qkF5rD1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCNkNqsMqJk6cgMVRtnwyoi0rKOTto9ucmjvwaDAVQM=;
 b=YFF23TnGr0GDPmivj0L6H4UXgZxAlTQXfpiLfAMEWeSG0V0e28hUauH5+zbYjJVG4pWw50jWWuB6nLQzuXYCwiudQDEvzdxubGtHcsLPc16Bl1A3wJfShn4elDrRA8YQH0lJPHXY43ROL4qtTkRufc27oTXqsre2WT9j1Tc6KHSvbgp3J8wWvej3054zgx5jRMyTGZTEQJqGx5xbCF4Yt/IWZSaJ89G6nByKHgCp6lFdXl05qy37/hNmlsYtm817zqiMfBC3aQoxBQo8H5y1mVAUPA9sujbg+5ZCbbyLjp/a0yPSgSgKLNkUxqmTHUY8407xmyoVam7vBlR6G7VCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCNkNqsMqJk6cgMVRtnwyoi0rKOTto9ucmjvwaDAVQM=;
 b=VhS/bwSLmNxU3I3VxPSFXLRbDRYrsyfMGCAzJGyTKJLz6Mx/hVTz3OibSzH6HF2oBntoCcz+SMYmYjhhcdLopr1+B96KRe5MrxQk/q7eUog9HLVmKs7iL8Uu9dfYuVTaV+OMuk/5Br2ICvMLQgIC+Vks9OZ7WC4tdaqrXljFzeo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v8 07/13] xen/arm: ffa: fix notification SRI across CPU
 hotplug/suspend
Thread-Topic: [PATCH v8 07/13] xen/arm: ffa: fix notification SRI across CPU
 hotplug/suspend
Thread-Index: AQHcwo4hEZKVR+1qn0ekNt1kpsRBuLXyuF0A
Date: Mon, 27 Apr 2026 08:20:53 +0000
Message-ID: <8B067451-681E-45CA-843A-1F0FD34ABF3C@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <a977e246d1d0a32a6618efd1385ad178779c2a61.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <a977e246d1d0a32a6618efd1385ad178779c2a61.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB3PR08MB8938:EE_|DB5PEPF00014B93:EE_|AM9PR08MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: f18a5699-1eba-4bfd-5d31-08dea4360c9f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 rHBtbdllpGb2GcEEnNAlOYRsK9dtJU8lEvLjZoMBVDksII+3RwgUh31WRtLrwHopotXotkuyqEujeTWRTDvDvbUfrcdcPsxxiPjV4+Nyg+4Soe5fBramiiKKr/vUG9Rx6GCf0k+YQUz/XD9qGm+DiQ8JnVvEDxKXhao4Od6pwF1i2DZReUzpNVjnyrCG96M+//xFmVpng0IhqD3I1NEYfw66AfIqnqJwv5YRTtJr5CL1WcW6QN7dVsnKZoLfdXfWCJ1rt8OBitCayUPhZBRbWseQXARwkeQLx+HEcpcOXvg3MVEenAv93+JjzM5mcLUv3bNK5AvnLrrZXUN/KfSLmaXYSM/9GBxNgdkbq1nD9fOTDGAr77aWebFgnXNwwFp6t0DisjnavK14dW7ykpU0mTqixyUAiOtSRa7sPUBY1zKNKgg/SJtHX3sIKEQ3PgfdDJ2npJrpTLK3TDr/N/IQ+xWkWIsm3lKBQJVEH/4Hyc+1RriZqzFnxx2ZkwqqOIeG4G0j2Bay6Ryv7ZjoEVjAp1l12tDCe301St2AsGmr2OjqhyQYpLYLbXuKS8PHdxl7GgwzEIT8CFvg1c5UJ1ERjdx1yuHTjXz+URpjElsRzgcPhUUUMt9g+8Ejrsl6nWVpJCQAFXKt8aGlzJal2Tv+ZhV+b/lvFLsQYGqAPY4QUbw2+MxFS3mUkU8IJmNT2oZGkiSWRvqAjBTjsMidHR1RxOr8SZZxj0qNNrhJAemlZwNuIUj9wq/X2OLTf9c2/PmVVctwRGBPHMySjIy+xMmONDuPcrswjtMjKZ4WVTcZYmA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <05511841E06FE04385594807F35FD55A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 BmDy6YMWZboWG+ufONwN4a3ZHx7sCic1oGkEEtAniBl0WvyFfYlFC+dYq+Glz8+Hg03tMOt7s5VBw75Ypx6hpFep8q7ClPR6+E0J9Hok0y4ETHZRM1yyjAsTMtGMT0pfz6sYRzYmPF7IaCzonVN+XDS5xBgxQk+8iXy4vrdsEH+T+WUV6IjRbeOP4+Z1luvgosGG22B1MCNrT1FTemddxk82a3OAf422RCiX6+T3iu9e9330CMNixgmQtKtduDQfQlBG7zrQobOzuNt/6XBVRlLAgXYO6xcNUBrQsnRUasd4Yy6xbrqHfx/C4SxPCY70KdAlXOl7lKkrfjFz/KkuOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8938
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	747e3a42-c6fa-4da8-4234-08dea435e618
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|35042699022|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0JQ+dW5Hmhfz1BAuL+UaBq9Y5kViDMYFEB3nPdcKCxThk/LOYtN/HjZyX8unVF/PEsgavuoxpU15ZJC5I8kRoLVniDeVP8B59KxNpeLAmSCyPa7FVq6zYSOxW6qMh9bOyRSQTE1Ps3aEK6xtdikwCD4RTOnHQ8A2yAkboxC2ce7FAvlUMToPhwS6DeqNHggRVNjdhC8NnlKM21OpNGiV4b8dB0iRJnvmkRs54Jv8qCDWG63BZ/cwHEbze6pP0NNRA0cETXqY9XsSl/Nlo3vX+BfBBLM7rr0idTlFEHQgJGbTRTfWWZ9JAD0Y7O+IRF1u/TrXkX4Xmqk4CipGmSXl9uMlLqEZvA01k52DUwec4nOQMgYJ7vd8kvaebPvMnrcR+uzo4kbuLv/MsjXbJpQY78QqD/CVvLve+Z85xoBoslIjO12mnonWcbyIMwuziimLDA29/tO29x8O4srI0maC/9DFd45tDJXeoEF5xF1SR40OTX56GlD6ImVML3IW1KXn7CFnHMdWCaf4xI7wh4PgLeOzejKbMzSSktxZ03+Lk8h1TuwE1qqPiXOdFFynv5hzVdJvlIiKmLJcIrq9PH/4IuHM8phsKUtdNPlVO+kV+INtNF13nmOMCH3zU4wbANqS54PP8SS86h/Rml0rWnKfRRJWHA8Wb/7pXt/8PwBymaDY/9UTW2oPFSZIhzGddHUF23qg303sUyhGD1tNNuS/FGqzCiiEEz0S+zjqYgLHzntVMEp//mpC1vvqwl8i2dmD/hp1gwHRnpKViTutIdGbWA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(35042699022)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l++/Kcw4GfDl8et0QmeGjAtJE/y/wv4KEVNcjwMv411UUUStTGYYsIrIwTOlII8InUxd0fnONTrXl02XMD7Dv7FSmgwKbt6Ij53s+o7cTbLs4rpJvC5Fd/hLuoNDQUj/0NEn/j8GRc0I/dupwGes0NkgRkOyAFlfFB5wTJ+bmHWTjPPuwWyIFQEjzsecbwRZCK+8J8povUH+297puP19u3I9bus6BJdmJ2v9MTLjUgwxbsUq4q54+pgKgDgIyFLaqjcKzNRxcWBsjRROhHx/CSgdStaEaFtojTKeMY0PjblGiHklV1ABMi5xUvtZZCW/jyjkpkGVutr5iq7A7uRwXCVsz32KpcgivwtgKib2+4vmkVYjib//m1mdqPZekt7p3SqflhyIYOBPXZV0G8HkzwcmYUAnCkBOa5KVg6Axj1e5kVy5UJNn8Hngd3+nghX7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:21:57.9128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f18a5699-1eba-4bfd-5d31-08dea4360c9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6209
X-purgate-ID: tlsNG-4011c0/1777278122-47B7F8B7-0C60E4A3/0/0
X-purgate-type: clean
X-purgate-size: 4192
X-Rspamd-Queue-Id: 9E5B546EFD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

Hi Mykola,

> On 2 Apr 2026, at 12:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> The FF-A notification SRI interrupt handler was not correctly tied to
> CPU hotplug and suspend/resume. As a result, CPUs going offline and
> back online could end up with stale or missing handlers, breaking
> delivery of FF-A notifications.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

This will probably need a rebase if the harden notification and VM to VM no=
tification
serie in FF-A is merged first.

Anyway, changes look good so:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa_notif.c | 63 ++++++++++++++++++++++++++++--------
> 1 file changed, 50 insertions(+), 13 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index 186e726412..513c399594 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -360,10 +360,28 @@ static int32_t ffa_notification_bitmap_destroy(uint=
16_t vm_id)
>     return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0, =
0);
> }
>=20
> -void ffa_notif_init_interrupt(void)
> +static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, sri_irq);
> +
> +static int request_sri_irq(void)
> {
>     int ret;
> +    struct irqaction *sri_action =3D &this_cpu(sri_irq);
> +
> +    sri_action->name =3D "FF-A notif";
> +    sri_action->handler =3D notif_irq_handler;
> +    sri_action->dev_id =3D NULL;
> +    sri_action->free_on_release =3D 0;
> +
> +    ret =3D setup_irq(notif_sri_irq, 0, sri_action);
> +    if ( ret )
> +        printk(XENLOG_ERR "ffa: setup_irq irq %u failed: error %d\n",
> +               notif_sri_irq, ret);
>=20
> +    return ret;
> +}
> +
> +void ffa_notif_init_interrupt(void)
> +{
>     if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
>     {
>         /*
> @@ -376,14 +394,36 @@ void ffa_notif_init_interrupt(void)
>          * pending, while the SPMC in the secure world will not notice th=
at
>          * the interrupt was lost.
>          */
> -        ret =3D request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A n=
otif",
> -                          NULL);
> -        if ( ret )
> -            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\=
n",
> -                   notif_sri_irq, ret);
> +        request_sri_irq();
>     }
> }
>=20
> +static void deinit_ffa_notif_interrupt(void)
> +{
> +    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +        release_irq(notif_sri_irq, NULL);
> +}
> +
> +static int cpu_ffa_notif_callback(struct notifier_block *nfb,
> +                                  unsigned long action,
> +                                  void *hcpu)
> +{
> +    switch ( action )
> +    {
> +    case CPU_DYING:
> +        deinit_ffa_notif_interrupt();
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block cpu_ffa_notif_nfb =3D {
> +    .notifier_call =3D cpu_ffa_notif_callback,
> +};
> +
> void ffa_notif_init(void)
> {
>     const struct arm_smccc_1_2_regs arg =3D {
> @@ -392,7 +432,6 @@ void ffa_notif_init(void)
>     };
>     struct arm_smccc_1_2_regs resp;
>     unsigned int irq;
> -    int ret;
>=20
>     /* Only enable fw notification if all ABIs we need are supported */
>     if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
> @@ -408,13 +447,11 @@ void ffa_notif_init(void)
>         notif_sri_irq =3D irq;
>         if ( irq >=3D NR_GIC_SGI )
>             irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> -        ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NUL=
L);
> -        if ( ret )
> -        {
> -            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\=
n",
> -                   irq, ret);
> +
> +        if ( request_sri_irq() )
>             return;
> -        }
> +
> +        register_cpu_notifier(&cpu_ffa_notif_nfb);
>         fw_notif_enabled =3D true;
>     }
> }
> --=20
> 2.43.0
>=20


