Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LQDE1DdBmoxogIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:46:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9DA54BA63
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309744.1580798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNoB7-000796-TR; Fri, 15 May 2026 08:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309744.1580798; Fri, 15 May 2026 08:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNoB7-00076p-QL; Fri, 15 May 2026 08:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1309744;
 Fri, 15 May 2026 08:45:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNoB6-00076j-KC
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:45:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNoB5-00FMbW-KM
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 10:45:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06dd2f-2eae-0a2a0a5409dd-0a2a450cdf70-26
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:45:51 +0200
Received: from [52.101.70.0]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a06dd3f-62f1-0a2a450c0019-346546005ec3-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:45:51 +0200
Received: from DU7P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::18)
 by GVXPR08MB11763.eurprd08.prod.outlook.com (2603:10a6:150:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 08:45:45 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::8a) by DU7P195CA0018.outlook.office365.com
 (2603:10a6:10:54d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Fri,
 15 May 2026 08:45:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 08:45:44 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB10863.eurprd08.prod.outlook.com (2603:10a6:150:154::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 08:44:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:44:37 +0000
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
 b=JCHsmQnbHuB5zSbqD9ZrS7NtbJx0Y6QIiTUDmVK9u5NTybgOYb/bzlqeW5t18+VDRojuxWFOR6LsnRAuVbXPiW5kqmN47U+ISJz6oXX4Yt4vmHZGslzhrjXLsMRD10XSMVWfonYNRUgeIbjBbu67Djz6eAt+F5kLhvEW2KKUEf79a0EFndVULQr4iOknHdyIdcL+6pF9L7IE5ds1YJpsxTSAgZQtDfNBYxJgIgDNy3uwP9o/w7z7IKMFgMjoGnpfRsCE8v809ra4e9RpblAuicDwMsaV4vaKv7k/9U5LXPmSehWHIG14tOE86CI6C4xTXJDGm+Jk4vdghcgPnE25tQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YpyfBYxDXce/q/laFp31CxeRg+WsVCWY8lHyDPvuu4=;
 b=zPd3OW7dozPmUNq1I5t9AAnBSvMb6LxKuwGJnXilBa+PlJ7lTZqEcpl6iq/OL9kb7I/nXK6ETJoqEsZVlfZzCKYizPIt/m6Wl7L/3yyM8BpDgdy8Xb4H5NwpiplxK1xfaW7vsMyEwwZF5nfAbFMPbh8UviG/9X3aooXqh/WP9fPYfHexmjv8bfoaaNBWyld3EY3ynui3wNXXAUamLJsJ8F570mYNUZkSom4psDRMxC4jnR4lzJbALfVw67aAhpqa0WksivKDEPbuoppz/AJmga9JvDPrQvtJVYf4ITxhh2DZXMuohxb3/auah6TSJ/tYsjab/BuGjvXN8F389kAxZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YpyfBYxDXce/q/laFp31CxeRg+WsVCWY8lHyDPvuu4=;
 b=cw3FMbJLGuggmtNfNbCefsKzjliLrf4Nuch1tZx2d8U1n2Y1ZElFGEnxz2O4R8fdzaiEvPw1x86bkHHrjNAH4cwq2qdZ4AARchlbEFw0BZLGSXVNGjRBJULLg/CdV0IaWbrH/nf5/jVPhulzsjXqaWszL5ui4xqzj4Cphh+qnSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpeFrTBiEsgTgf6NI8B49aUNtQpgT/EFnIbwZu3g1qv/LbPwGJiVzIist4JeYdP7ZcYaNFnD8ogT4IqHuClYULDHA7gG64GP8yCcTcQG7vTp89NhQrwfKK2txskPQKmsc2FaegQ9XmWuW1aKE0X0+0VL0rZtvQP7TQEFh5uPWb8/OuLie612iN+LSZ1d0CkLQabrw0La2Qha6mmqd5t1LDhZzGHHL5xHVCkqkF+PBoRe/r0bgNiV3PJZBrzpdoyAHwtmCdzvD3VlNeMY5Fl8yJiO4RE0eDetKhcHFe/QFHTn/nA0VcCCM4/p86x7IKsWpwA15OeUtB8ZYpC3ifeLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YpyfBYxDXce/q/laFp31CxeRg+WsVCWY8lHyDPvuu4=;
 b=zHNoT0+1J+36jcHKx92jyOjmsz6tkZdTgCZjlkbVVzLxAm0960i+a70tbm2hg6nds5YuAk0I6kqwR8qBm1b2q8UoDIPSFMFvt6UmOCvq7IiiQ95U8hlT67n3Sl336kumqyoP3uQ0XwyXYlkdIRPx0n1BbCAhnEoFu0NszczaRy99+J7etBYeursKSRYmyNulYoMm9g9sY4XyubIyU2XqwgpPjCUP1K4uoIOIy6B8PEZz5DZiprCFJoqlOJNodSeYMmWCbiW7Pu8fqj12ZvbmH+woz2TWBed7QonEGOmrHR18Pa0v4hVELE8N4s0aE82UZFFIq3C4MQ9z8MBI2+KlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YpyfBYxDXce/q/laFp31CxeRg+WsVCWY8lHyDPvuu4=;
 b=cw3FMbJLGuggmtNfNbCefsKzjliLrf4Nuch1tZx2d8U1n2Y1ZElFGEnxz2O4R8fdzaiEvPw1x86bkHHrjNAH4cwq2qdZ4AARchlbEFw0BZLGSXVNGjRBJULLg/CdV0IaWbrH/nf5/jVPhulzsjXqaWszL5ui4xqzj4Cphh+qnSY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 13/13] xen/arm: Add host system suspend backend
Thread-Topic: [PATCH v9 13/13] xen/arm: Add host system suspend backend
Thread-Index: AQHc4jI2GSPod59Ym0q4tbUq8XkiRLYOyZeA
Date: Fri, 15 May 2026 08:44:37 +0000
Message-ID: <14563498-D318-4419-A07C-DDFDCC8FECA8@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <2268857aa7eef95444169564c17f7e9a6f59b1c5.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <2268857aa7eef95444169564c17f7e9a6f59b1c5.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB10863:EE_|DB5PEPF00014B8F:EE_|GVXPR08MB11763:EE_
X-MS-Office365-Filtering-Correlation-Id: 127c3779-ab14-41ab-4f5d-08deb25e5a8b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|4143699003|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 Q+VwBLZtGnwu2/FE/n9CqM3U6wc5OBQcDiEabeadrAvdUP2zi1IWtBEVHrzMscwese6TTtuqaYAYhYp6RisO6Pf+UQM2i/SXbsRkPU6Xo/ho8OCI8PRunGoRHUjbvV0C47SD9f6JykzFBwlyGGlIZcjuOSBPNKAasyvPfsD5eoh909p86L70YiieauRDuXQQybBzhnelt4Tg5SxbrmT9m6qYjS2yZKhoQcMVy4S0XodfIBfo37s2oYnt4877HApRzs1kGHlL6z3QvncYzqvkVeU+oi0QRGWey5n0FgLINnA4PXbG7ssQFfKRjhKjxyLAcXl/3yQQKRDTDyk1kyPuod2MxizBtddR4NapWz8cp33V+nMWHtJYYoAHGZ2Vu9vtrCalliMtb+c+jlrH2FvSjzkGJ2Jo/4OSspSHfw4zt+PrikKN+e2/OEiluq7EX6SdM9zDe2wCD8nCO0ch0+90y1lg1DQAm3XEbFNTF28K93NrINIRWQNjnQGp04UYRSj2znFSFAi64kT6ovx2FI1Ca0LAG8VLBkPkQQ0Aefc7cYfDqMy9eEWVJEJ8AFcf2G5v8PEnnEcYSVbhMkbTBG3mESG+jIa8ceiiANUQyegBJaCb5OpDojPWJ5rYxL4uurMa/sMeHLfhEjwJX68eUQOLhn7iWMYUAEPjEmBSk5Bu0EcUuvmYxb/I8Tv1lJpi7nri8yqVQplPLuyopTMT5sNFr71ksfEB8/qAxEmAFKl5lAex4/wcq/Wl5dDs+CbPH26Q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(4143699003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F91278D7A363941804A2BE5D9F53F41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 EdYDFkXeC5yK/ZzJWU2xrDHes2kbHfINRWQY2B0iON2VeLtV9NoN2RHRh4nESNE3bO2gJX5dxs5Gq67P74MqpIvnm0sAxwbWe60ekhWs+8CPRv3ZbuZlw6CSpmHe61oIfgzzbZ7xusVfwnkoyNq8xk5TeIbnsi5LIwfK9L94g/X4FY9Tg7hlMn1DpS6B2vw9VtiECw8Z7Pli5T35ck63db1dZ7KHoYBVHUYFiqlispf64prjHytU40W+/gueK0Oi4M/zjzt04Bpga2dT8+lEb5PPNMfVgNtWoH729t3jOdsQmsRJYSkY8vguLQMMhjnXgRhor3U3wGlNQnxpKc5vFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10863
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1cf33c3c-50ac-406e-6c06-08deb25e328a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|376014|36860700016|14060799003|1800799024|56012099003|11063799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y0ps6Dh/8daaK8pw+c6KoVwkESpkPNPT21/VsvzMbd1dUeZ5bo1grDWzOjC2F/3STo8WyzD9oZPXHPppzprV3YviTEdpe0QLX90NDWUXGnV33Ay+10mmyLurM/0UPgpUE5Ni//tqihJFWWExniDD+aBADWXaOdtZCbFgBAHcGCjCapJWL9Tu2D+q4Tz4HogB+yEq6jSMG//Z5h1vFwi7iRsKdpQ1pxM4zqwGiEwR+w/B63xvZw2quGt4X1dchUy8/opJyanvgUk+XGZ3jrjR0g9WcyvwQerp+NvkqLmIx9kh1CH1x0GcwMaP3D0p0AV1Fd3gHLbP/qqnd3mQG2REv3chUucjtMqePlE4/0FWX5qwIopfcVqe4fvu/9GNOZMGuUhUdUTf13/NdUIQTn55LUcH2PrGvLnea5GlFVGEU3ZkFKqnGFf0IXTlEi4+MmwBPVv8aIJ18CgngvZvX81mSv+oqD1eJGkl/uA/Osf3oy/8oE/hZcKiyt74m7uExHUvQiE01CV99eZp2rBjZXEbHyOj39ZKrXX2id2M+D+X24jIHUKNuzLrq/sUHmCcCnBeD/CX6TjHm/K6N/86CKt9tMWs9enB3kccleRWfh797JqC1Tz60C+ln0J1pHHBan9FDJwj7lf17kKYeE9oj3NVGa6rmeanDSSqHGBkzt35X4z/SnPFjC/E6bWjtqTYtsb5EJGabq2YBLdax2zcaynXH1L7qCX2avdz5rhySagmuw8=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(36860700016)(14060799003)(1800799024)(56012099003)(11063799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	43CI4AMMLe2tNKzsQfX1mvyzkf4XNFWHko5NjsNr+9yEn5CiRiXHyuaNkZeSe1ab7fjnxlAvax3CHBjepxJw+ZdxtKo1hX6NFKv3IJlCG7q1THKRympGNTBrEVv++adnGlZc4h3wOIEFm9vN1BhJZ9nC+tyNXEFhR5HvRbepS7YTxq9ikwQr2tip4CGLB+MP014trr3TXsfJt4/d4VoubzJjbQcn4EnDG9w2jWxTEyeMZOZyjd9veBeXI/1EBLj3AkpVdwXLTcnIj1wNyra0fFpyYpgBzvgJjuH3vhX8iViLsEncBTpjNDAey+q5Olv1iK9QJMgTb/4CMPj4iVqhNV28AfRrSJS5zb9scqfLU8tWPlDsS2M7+ox2vivRumbZW6TAMiJxGNYefM7C3e9LsWF3v5tjDvVMtprf3XwsdcsB1JUsp1Ceqns/uCFMt0Cc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:45:44.7957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 127c3779-ab14-41ab-4f5d-08deb25e5a8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11763
X-purgate-ID: tlsNG-d25034/1778834751-E196DCF5-6B098861/0/0
X-purgate-type: clean
X-purgate-size: 586
X-Rspamd-Queue-Id: AA9DA54BA63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Mykola,

> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.=
h
> index 2eb8465aa9..de119cad3a 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -360,6 +360,8 @@ static inline void page_set_xenheap_gfn(struct page_i=
nfo *p, gfn_t gfn)
>     } while ( (y =3D cmpxchg(&p->u.inuse.type_info, x, nx)) !=3D x );
> }
>=20
> +void set_init_ttbr(lpae_t *root);

Since this is MMU only, shall we move it to asm/mmu/mm.h?

with that fixed:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


