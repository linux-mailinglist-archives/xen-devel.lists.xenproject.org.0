Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOJEDAdy62nCMwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:37:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0A45F3C1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293556.1571187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGhW-0001zS-Jz; Fri, 24 Apr 2026 13:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293556.1571187; Fri, 24 Apr 2026 13:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGhW-0001wT-Ga; Fri, 24 Apr 2026 13:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1293556;
 Fri, 24 Apr 2026 13:36:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wGGhU-0001wN-MH
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 13:36:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGGhU-00EOph-2w
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:36:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb71b4-2eae-0a2a0a5409dd-0a2a4502cd7e-22
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:36:07 +0200
Received: from [52.101.83.40]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69eb71c7-af86-0a2a45020019-346553287dd3-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:36:07 +0200
Received: from CWLP265CA0427.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::14)
 by DB9PR08MB8290.eurprd08.prod.outlook.com (2603:10a6:10:3de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 13:36:02 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::47) by CWLP265CA0427.outlook.office365.com
 (2603:10a6:400:1d7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 13:36:02 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Fri, 24 Apr 2026 13:36:02 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB6348.eurprd08.prod.outlook.com (2603:10a6:10:263::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 13:34:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 13:34:59 +0000
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
 b=pCfx8Mw3Boe/sE1PCHtPeInu9ELWFJxG0FDiYKb+IECeAiPiMM3Ax/CnW2EvjyKTD96oLxjt3aARPQ1CrIkSfadkSUSB6R6mv7rqO0nzBdgeREgUzsxWH0NKFOA1mXD2AAvN4I+dl0di/X3UfrarjaPnKZwaZi7fb5ExIAejIZ6AyZn5YYxicILm5Igc2Ys2uZSjlSj1z2KYsKkK8pflxAOERVmPrpvZCG2mcH7pMb+Tj6kiN7yUwC/7UtISJDf3XkQ2kHN5Dbl45sI/QidAaoBOSzyjvFRybZJfIGad+JYQA1z88cyeZmBbmOwxBAfj8f1UnA8+9HObi5ItUnltmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmy7HzYXvJ10sD3XGH84NxdNdHKo+kCSSsl5RHAIIog=;
 b=N7FNqlSdHvdq7RFcwq7A2e04VOCT5CV2VMYB+A2KSiBtaptUq2Mtd2wJ/x1Nt/EtNndLd77yYmWY6gfdcaeuY6erYXRp/6B03YVkrs7D9ctDw8vAL3l3xju034Xfz4YpGBJpY6JgFm9J5dZaoNaAYRdrJ6zohnCdMW+lneoHTJCR4bf34LiZd+n8UHmEvELGpuREy6Pj/HLL1disE8PWtUOUqyqQCNhzPtLPxzZXEEmMcPLK/Ftiv7IAxKsG7kMKXqnqXGxT5E0FJyIlkGKwqpT1MDxRG3NF6djaNJO45ncIi16HToyiHA/fJgKpQjrLKQ8Xj/KP1zXuXCiyb+4jQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmy7HzYXvJ10sD3XGH84NxdNdHKo+kCSSsl5RHAIIog=;
 b=ip0SaOXW1i9967G4Y0mkHMH9w8o0EvO1vn0ER82S7IgSMMk08Vcz1akou2H7tkNhh72JEB94QEX77t0oYBOmIbmbxQHAXJALw2V3Bad9iPIT5iNoJCF7YGv0uZhoeDOB3QGAizvFJ1uyoZzAXbQwv8LaJ5Wi2aF1xRqfZdK2zyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Faj4Z16snzJOt/egmzQYE8d6D20uF+3/dlEdQ0iX/kTkgY1uIu8MDZvFl87DoZAADkJ0cxS/OEUn/E8I5aCD0wVOZXliVBiGFOw1Ddc7JJb6RbpSWisnMhBi+WaveOuFAhoOyvNWdS5Z71ZHxExx8IS7ne6PZ2hZ+YRx60Bd4k5LCSh2+b71lcG1DTNGSpSAF9kNW/yS0YTrkz5YPBWH0qxAXx1yC3rI+PeFeqtpT3yS9Yaw09JqnS4xrvvhB2Bq6c1mruu7+QuE53v+PT2xsUp+onRrOqVjXgf02q/WiXX+AsTNR5dSC+jXEBsnQTVXxjRdDKIP0Nqn4prJ8zknHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmy7HzYXvJ10sD3XGH84NxdNdHKo+kCSSsl5RHAIIog=;
 b=TZs7HNrvd7WCYeOo4gN6Hh92X+Akt9eH6/FkG3NFURUW5qOrW8wfIMr5ZujydyUgLgZq25fVNG7nyInF2fgnMbCnNasJ5B2OECeSR8sc7SgGR6J2WwKv9nQQMgXz+Y5mLSh+gDV3Q4MMvQKZLa8xHj54T5nw3cdOhw5vNR8V8Q1Kv47lAjRrvNdyvNIIJNQCsFcCQTGQQlre8dcHFoBvnw1zX5siEaj7RHTuzzk1fC/6BrrTW7Eus4m1O7/BAMtsP22pk6MVHfN1/Yqkeaot526vCaX+IOXkPfdB2aZZlWKJhUd2Z4MZUqoYz81AubysXQoICrMPioZhFq2LneTkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmy7HzYXvJ10sD3XGH84NxdNdHKo+kCSSsl5RHAIIog=;
 b=ip0SaOXW1i9967G4Y0mkHMH9w8o0EvO1vn0ER82S7IgSMMk08Vcz1akou2H7tkNhh72JEB94QEX77t0oYBOmIbmbxQHAXJALw2V3Bad9iPIT5iNoJCF7YGv0uZhoeDOB3QGAizvFJ1uyoZzAXbQwv8LaJ5Wi2aF1xRqfZdK2zyg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Topic: [PATCH v8 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Index: AQHc0+8l3+I00g5Ym0qFHM3WPj8anQ==
Date: Fri, 24 Apr 2026 13:34:59 +0000
Message-ID: <55B2462D-41E5-42CB-9525-39CF4843E95E@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <63b219c3cae5201c5db804f69c3b88ac41c9bdf6.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <63b219c3cae5201c5db804f69c3b88ac41c9bdf6.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB6348:EE_|AMS1EPF00000045:EE_|DB9PR08MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efcb085-6fad-41e1-7a09-08dea2066d6c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 vfNMt1WM4XhBjmPRgmubHGrxEj3TtyQVrxCQi7UANMlo7waPCcJdWFEG143i6HmDiEYsMv3Q0XAzFduxoiMgn7ZWJbgZze6sQLya1j93tnGQBh9+zJ9o0fIsVPzqIXvwAvaMQi0YC1INVTexzZwjPxdnpUMaDzQSV3Ne2S+wtAcPG0NRVPpkPgBJabFBA7BcE27ZOpD8VXcljzAAIaLz5lCH5B+/OSZsm6vMwiTRx87UdsY+MPCF6UI7FeNTgVkPTHF8vzpdRliQ8hesUpPmcZS6SBAxh9vzMpBfcL43nQ9gbk3kXwb5ko6PEYIJc1bU4QEfeHmn15Vo3zDzG3qU7cYhozjbZR+Ak9WkJK0db318YJNocyqtaSA7Pmra3QuB8pJkT+vZvbIxrOIj5iafqGarrH6ooTjYooE8ZCdvlnIKMxwHCBTZyLsDWER1QFZ0T16eenWSSOUvVa9elA0F6b3qt1wRGOLBpGmuP+olR8WD9OoceQAuzYL0TyscGLMYT0DHXJjavsrbQwTiXDz0PHaUIbPJIAloZV06JT1hEb9QYYoOBvHiWcef4NgmIP2fqE8Ze+H8tbBhrXDKo9UPigYHzD9/glWs9ZrK7dZU+bRQgDgTFQoFtb+sNQ5QujKZWXPeNeYBAIKe7SAVr/GOhxA/Cg/nHJByq7FBuSchXyiHuf+yepdrt+i/NeCuvtMtluhkJlAdDwLdPBBNG1k3GmJr9CdXujdyjumJ2UcDtvp87FeVbRfR5rgt76Iu1v+fAuYHZkaHoT9XlnbT+J0qD/y+bpfflXmsF58emJJazFg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0868DF37AF62664DBE9D306CEFD1984A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 TqZvac4gRZ+GVWx6ZhHHePk2oTKSmrrNPuw0h/SE+QELUvayA7vlwTb+Irw+6R9zNGtRoNsR2zCQX3ZlU74NjKb+AB1rGmgRLW/8bgexS2ZxvIWj5Ac99/q4mLlo822+Q1o5eGEXQhCOJZtVaTt0SC6/L1TOuaRahB8vTUDpxMCvl1GLbkZ+PPAVBlWnzJUiGMzGJspAJtjWCcWr8nk4FE/A2P0+jO3VGbTJrP/hJqxkILTzIFsZk5qofitkrF3dekkXziZxHjzCgGIMxot+z2jjL6ZzADwHd37hoftrmhgMrfJNClMZmKAfmsCpOsOXtnhN3YvfTPpA+LyZc2LoAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6348
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f96cb27e-4fe9-4dd7-6b7c-08dea20647cc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|35042699022|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MRqE1mp9lpfkQs3O3Ehu28wRfR8KTHsdCMT0AOtC83jqS2styowwkcA8cQt+7u6GgAfH4su1AAXlJWbndu7+DypZEAhWp7tLEnAsRVwwELwRXO26JuBqT5pmmeNSH4EniVg10KmaeIfdJ0boqsCEJa3i/lIgxlbognfNgS9a8IIpKjsHF4A4fH16NTUAVQc5YxqEDgmSDuSOd7OSI34TfglmwYyTNIrz2AfA1NmSy7Tnpg5mbc3rFXhlLDNGHQrd4nAy93qRaDK4VuR6h2PUbEPwUc9xmEwTbIWUSi+2sUPlJfgsX1dk3RXH0Hc3HwtJqc+YdaFX0NeftyU6XIJ/igchWmOOKClplkYVD5/vsX0zVZyjnk/jXxPxFDoyNpx6ZeBE/QIEQ9ypWT+SV1vGq2zOudVpF6xm4Mv+bju3dur/SF7pOyIEWg12zIvw96qlnlQUFF9dqH8YBrvgBsKnQjnVVa7dv8O3HorMl/bH3eKm/mhopK6MNquUVmrHhfiG0GUX2Baww9uvyGtBso14qmn/k2SsObvUQjpq7CiysSloIpN0PhhuIhPCV/iCKvB3XfSQ+vE0xyWUdBv+7AaxjY7FEBR+7HJ/qQyBuJUgeGjPPl0vW/NGj68jVdN0i29ql6SscqV66i7ZB3nek60WBJvv/RxRUuFfgJfcBLhknpglCshWJDhUjsdUHffM+L2JoG9GU9RoJhN2J6vVarDny41NpnXURL6uvkOABZvgSEDi3EXln309U3ZSdlx5UwZMaMRrU5HAPT2n7gFl/OeN2Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(35042699022)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XrYnB/99QlEWZ1IeMEDFZlmPPbvqFC9cJQRCQ05LpxFYCSjwK2UW16ler5azHkPGFgIlNERXD6Vq3G24vohER/NZh9Zbaa1d+gV2iJOalBdGRzFEQQezmNWE+dHMO0g2S22HIv1KModyXFVHPQvTYdQOrNK3R9Snl9SzCfL+GxuFkEufF5wBKm+CZmL3eHK2aTvgPB4mTu2XbDbk5c2MBzE7sRagUJDEpkRHgBcFznzqUAoFgsqW6TH6T5RzVPY4cnSDEpBhLaxOD+u8k99CQ234EhQYzaPstXm8wUkMY+8710u2IupCdT9Bg6WQFHWmg5m8PjL8nQ0Q7t7IABexIEwjCeAreROC2QCXEDDgtAg2MD/iZEtwRHTDqyUCAVtDghX0+8v0qVg1vKcUZa2F6SDKUTX+OGO/3hywcsRAsUOpuX8TBdFo18l5iCw1qsTN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 13:36:02.1520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efcb085-6fad-41e1-7a09-08dea2066d6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8290
X-purgate-ID: tlsNG-720697/1777037767-892CE161-2006E151/0/0
X-purgate-type: clean
X-purgate-size: 3060
X-Rspamd-Queue-Id: 37C0A45F3C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

SGkgTXlrb2xhLA0KDQo+IE9uIDIgQXByIDIwMjYsIGF0IDExOjQ1LCBNeWtvbGEgS3ZhY2ggPHhh
a2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gRnJvbTogT2xla3NhbmRyIFR5c2hj
aGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPiANCj4gU3RvcmUgYW5kIHJl
c3RvcmUgYWN0aXZlIGNvbnRleHQgYW5kIG1pY3JvLVRMQiByZWdpc3RlcnMuDQo+IA0KPiBUZXN0
ZWQgb24gUi1DYXIgSDMgU3RhcnRlciBLaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0KPiAtLS0NCj4gQ2hh
bmdlcyBpbiBWNzoNCj4gLSBtb3ZlZCBzdXNwZW5kIGNvbnRleHQgYWxsb2NhdGlvbiBiZWZvcmUg
cGNpIHN0dWZmDQo+IC0tLQ0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1z
YS5jIHwgMzA1ICsrKysrKysrKysrKysrKysrKysrKystDQo+IDEgZmlsZSBjaGFuZ2VkLCAyOTgg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL2lwbW11LXZtc2EuYw0KPiBpbmRleCBlYTlmYTlkZGYzLi42NzY1YmQzMDgzIDEwMDY0
NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jDQo+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMNCj4gQEAgLTcxLDYg
KzcxLDggQEANCj4gfSkNCj4gI2VuZGlmDQo+IA0KPiArI2RlZmluZSBkZXZfZGJnKGRldiwgZm10
LCAuLi4pICAgIFwNCj4gKyAgICBkZXZfcHJpbnQoZGV2LCBYRU5MT0dfREVCVUcsIGZtdCwgIyMg
X19WQV9BUkdTX18pDQo+ICNkZWZpbmUgZGV2X2luZm8oZGV2LCBmbXQsIC4uLikgICAgXA0KPiAg
ICAgZGV2X3ByaW50KGRldiwgWEVOTE9HX0lORk8sIGZtdCwgIyMgX19WQV9BUkdTX18pDQo+ICNk
ZWZpbmUgZGV2X3dhcm4oZGV2LCBmbXQsIC4uLikgICAgXA0KPiBAQCAtMTMwLDYgKzEzMiwyNCBA
QCBzdHJ1Y3QgaXBtbXVfZmVhdHVyZXMgew0KPiAgICAgdW5zaWduZWQgaW50IGltdWN0cl90dHNl
bF9tYXNrOw0KPiB9Ow0KPiANCg0KDQo+IFvigKZdDQoNCg0KPiANCj4gQEAgLTEzNDAsMTAgKzE2
MDgsMTEgQEAgc3RhdGljIGludCBpcG1tdV9hZGRfZGV2aWNlKHU4IGRldmZuLCBzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ICAgICBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWM7DQo+IA0KPiAjaWZk
ZWYgQ09ORklHX0hBU19QQ0kNCj4gKyAgICBpbnQgcmV0Ow0KPiArDQo+ICAgICBpZiAoIGRldl9p
c19wY2koZGV2KSApDQo+ICAgICB7DQo+ICAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBk
ZXZfdG9fcGNpKGRldik7DQo+IC0gICAgICAgIGludCByZXQ7DQo+IA0KPiAgICAgICAgIGlmICgg
ZGV2Zm4gIT0gcGRldi0+ZGV2Zm4gKQ0KPiAgICAgICAgICAgICByZXR1cm4gMDsNCj4gQEAgLTEz
NzEsNiArMTY0MCwxNSBAQCBzdGF0aWMgaW50IGlwbW11X2FkZF9kZXZpY2UodTggZGV2Zm4sIHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gICAgICAgICAvKiBMZXQgWGVuIGtub3cgdGhhdCB0aGUgbWFz
dGVyIGRldmljZSBpcyBwcm90ZWN0ZWQgYnkgYW4gSU9NTVUuICovDQo+ICAgICAgICAgZHRfZGV2
aWNlX3NldF9wcm90ZWN0ZWQoZGV2X3RvX2R0KGRldikpOw0KPiAgICAgfQ0KPiArDQo+ICsjaWZk
ZWYgQ09ORklHX1NZU1RFTV9TVVNQRU5EDQo+ICsgICAgaWYgKCBpcG1tdV9hbGxvY19jdHhfc3Vz
cGVuZChkZXYpICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRv
IGFsbG9jYXRlIGNvbnRleHQgZm9yIHN1c3BlbmRcbiIpOw0KPiArICAgICAgICByZXR1cm4gLUVO
T01FTTsNCj4gKyAgICB9DQo+ICsjZW5kaWYNCg0KSWYgdGhpcyBmYWlscyB0aGUgZGV2aWNlIHdp
bGwgcmVtYWluIHByb3RlY3RlZCwgSSBzdWdnZXN0IHdlIG1vdmUgdGhpcyBvbmUgYmVmb3JlIGBp
ZiAoICFkZXZfaXNfcGNpKGRldikgKSB7IOKApiB9YA0KYmxvY2sNCg0KVGhlIHJlc3QgbG9va3Mg
b2sgdG8gbWUsIGJ1dCBJ4oCZbSBub3QgYW4gZXhwZXJ0IG9mIHRoaXMgcGFydC4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo=

