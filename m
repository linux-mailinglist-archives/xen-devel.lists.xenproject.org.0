Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FCA8A9456
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:44:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708062.1106659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMRa-0004FB-K9; Thu, 18 Apr 2024 07:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708062.1106659; Thu, 18 Apr 2024 07:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMRa-0004CT-F8; Thu, 18 Apr 2024 07:44:30 +0000
Received: by outflank-mailman (input) for mailman id 708062;
 Thu, 18 Apr 2024 07:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyP4=LX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rxMRY-00045y-Nx
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:44:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b093c6c-fd57-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:44:26 +0200 (CEST)
Received: from AS9P250CA0016.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::26)
 by DB3PR08MB8986.eurprd08.prod.outlook.com (2603:10a6:10:42b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 07:44:19 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:532:cafe::21) by AS9P250CA0016.outlook.office365.com
 (2603:10a6:20b:532::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.27 via Frontend
 Transport; Thu, 18 Apr 2024 07:44:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 18 Apr 2024 07:44:18 +0000
Received: ("Tessian outbound 9fd7e4b543e6:v313");
 Thu, 18 Apr 2024 07:44:18 +0000
Received: from 6380d7eee6c7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A7F4A8A8-6733-4EF1-ADE4-2A5F9EC10F59.1; 
 Thu, 18 Apr 2024 07:44:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6380d7eee6c7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Apr 2024 07:44:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB9094.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Thu, 18 Apr
 2024 07:44:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 07:44:08 +0000
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
X-Inumbo-ID: 7b093c6c-fd57-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Zxtoxp8Ob6YEB7n68OmwUoE3lsHmJfoPt+Ok2+EnkeIspNbPRHczQqVMTHsjsAIqO/ku169ot3BPfBoPR67Z3GQDteBqm+XkBUDNNZH+WvFhtnzgCx6rDPMvEtTpb2m/LTuMv18gdnwhh2ApUihPWAYYvNpXbiD6EHTYM4UK1Nt0ew1daYvjQbWGsFRlfsjtybC/ptJ9Pycz4+YIeLr44sPH+C2/FB7EPqcXM87R/buOkLGIdvgL8RF8wxfIrZTZOG2b8k3eksExbyC3l19qBrP+pbJWeweGO+NLz0jDDpdgHm3tEh4Paj2GsqZx6KweArNe4PCXmnuaTAwFr56Pqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcbTUjYhGq5guoyqnpt3YMaIlsYavqoRdiDfc88Dwg4=;
 b=HWuWArVV0/SooNGjX/0ngilCPq50mdEGdeeQoMoY+ayLU3T/gOjgplin0HtM3VMqJ+LtEceLSp0jVYvksidekKB5xDQMFgBbXbxH01zCQrqA/jWxzXmRMG3An72KpBGHOY24aXv//FNYvjByldfVWY8L++C/cr4mkYgAGKfQMvR1S/SozBcNMkVDFhKD6HeHFOQtffy1ZEDqcICI0Im+MowkuOmCIlfMwuNK9p9Anykm0/OIWHWP4gCQWTAY8C4TjZgj+eMsPj4TDholr5qB4smFojtbLBuytTTjVwur79l10Nl/zxE5Ty6825+iwUlnV3vrXqfPl5OsrS+fEj8D8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcbTUjYhGq5guoyqnpt3YMaIlsYavqoRdiDfc88Dwg4=;
 b=jcntsSwRqQAe5NSS5psEhcAPqJdm+dp1wp28J2tmp01/yOvDHY2ixbj+QFFOtewYR4DlkvbPAmwnNdwMDIc/HL2w9ZNQcAproMpaux7IOQzgR+FwaKdRenO/CctkFTxzg/uTaWbN85iT1zab9GwQAktQ40dYB0wgxVGycdhcWKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0995f625191d9ab1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTWKDLxUYbr8fY5i4vLkfXBjfVCbC6FLi/eNcqGs4TmfMN7ak6EFpOJQ/p/8Wa9pJBOShQHqvWm9PC0PnxJwKShB5Y9/jJwCA2FflKoeRtYwjeeLMa2MAG6pYc5k9gxizpw49BpCQoeXdiSsb08wVLwy6mjULG2A5Tn/bQycDfF8r8gzezxNx1dOhWg4B/WGXM7Y/LJc2An9mz5T+K7tWwZRdtXbJdU/kXLp/phFVt3jBY/G/rbxq145Uj5newSyEYmXVg6y48pHmBSfnMjOGkyJvv5yVUTmAc0ogRRRUX/jW7BJuM7r2v2p3ZGnJgBaQi6mU0dPiPN3ncDeJ4AKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcbTUjYhGq5guoyqnpt3YMaIlsYavqoRdiDfc88Dwg4=;
 b=CNdtFawD99s4AoWk+MIN15XA58Aq+DUxweVJpo0sYJcefSWZOhiYgeG/LIapIJfpRYBLK0qriTCvni8+bgLoX3EPczWqF9ypbLS6xtJY+O052FDl3ahkf53itZIoiuLoUyCoTlyA+MVIBB44LLKQOwe3Xrw4i70rR+Qh0UJp0zJ0OQx9xLvsvEUCVMsKfohmpGSawIUUUisIFisbXnodd7Rn54zoj+cVytwEPb8WWZ7Wz8yTLASLGB1Fz3jkGqAqy7dKlbqyWEFNz8Epm803rmGffXDk51r5vPOvediwn0v77YcKfIH1L0ZkkEC4XHG04V1TdLzEJT3I83h9LybJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcbTUjYhGq5guoyqnpt3YMaIlsYavqoRdiDfc88Dwg4=;
 b=jcntsSwRqQAe5NSS5psEhcAPqJdm+dp1wp28J2tmp01/yOvDHY2ixbj+QFFOtewYR4DlkvbPAmwnNdwMDIc/HL2w9ZNQcAproMpaux7IOQzgR+FwaKdRenO/CctkFTxzg/uTaWbN85iT1zab9GwQAktQ40dYB0wgxVGycdhcWKA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 12/13] xen/device_tree: Introduce function to merge
 overlapping intervals
Thread-Topic: [PATCH v2 12/13] xen/device_tree: Introduce function to merge
 overlapping intervals
Thread-Index: AQHainObwzEJT+Mf6kG9My8yFKsem7Ftnm0AgAAVAwA=
Date: Thu, 18 Apr 2024 07:44:08 +0000
Message-ID: <936487ED-B717-48B6-B4F3-842752911360@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-13-luca.fancellu@arm.com>
 <930fcf9b-2ce3-4477-88f0-e3881cacdae7@suse.com>
In-Reply-To: <930fcf9b-2ce3-4477-88f0-e3881cacdae7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB9094:EE_|AMS0EPF000001A7:EE_|DB3PR08MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bd2b1e-5128-4c27-8973-08dc5f7b5ac6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GXEP9WAxIlahh634bW6S8AJw+842+25b2TJu5KRl5nwMw6xA6TTDJxVRi1cdoKIN62c7WweQoqGSn0lS7I/YT3D3U9gir0etzfw0yqoh7n95Shfmfn+HmZ43VjNzx9UusD+BjdAEedfeCVFaFc9BouGk5XQzOofno4GmU51L8TnJSLxTRTO1jZjGKBkajed4B9vGNM0BnZhTHxu/GgaYyqKqagXaTpHKe6OxfCslp5IE7UAqTKmWZ0VZYq+54/iaErVb6D01uCqdR3ypPHKUFq0841oHKFmtJwQLM+aIj3aWh4c7TaXeRh5Ci9o2tiBkLkSGJ3Tx+0dTSogB8pnsyHL2PfwwgqkWMaZUFQ7qFmxAVOT34hgzUKJ6NIYHzlkGkjdZcJraMZe9UHJAIIQD2E8Nm+e3Sset37lv41Aub+rqRl3OHqUOC6DALS3nzBuLyeiboM6zjKv9ERfbP8FOCphA9N+h68IWv7NdILVfdMVT2zRtbRHntLO3VJNB+bR/wW8pRNqczpcX1FmLQOwAbZHkcxYxTzdbPs2KPinN/My8RCLZygz4+K967LsGBWxlMrv1uA27jldfuSYm1NcMPoEx8fzWtl1ffyvljAS+agTSSbJA5RQIOleZsyT/T5CVBzza3ngzq3X4/J4f7elVBqHiS7Jq3DpwWnG6Bt6tpHKUAa5moZUDFM7QZGgo3UNVYtvPSMnjZdx5ryG8h9PTK/O8jw33ODYQPIPGgtq8VcQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <90C888E19E32724884FB71D72488E540@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9094
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3915090-649a-43e2-a121-08dc5f7b54af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YoHno23F08Pw5Vkgu3vNFT/czEvc1Frx2mQuykIXY/h4CtmVXFxWenJ02RKD3s/Sm1kvZgabpSwGj1M+hNLv7D4D5H6NilmLLGlBYowdaggMkFNip+5FHpQlyqqiBtW9jX2MQdTpOnnuayQ9XQi20mcv3QCjuX0Qf8eiRkvW66IAzfGr1VMmrMqUURqk37xspG8QGpdZN8m4m/zx6ryqu1srvmUdHJlzRgXvkQSiv1Y1z+5agEZkWL8OYobjRJNoIWzcol4Vw+pc4f1tBwsgt5W7sd0PMeUWImlwm56sXLZFfBejgQyhVxGykYvnmdimmv3E8o8R2VAw44afeLPhDd/yQR7Jg/1RDxKghyE+uHydek3Mn2fEotfAL6yEPQtBu1YetosJ6BWzuPQN5vZuSEOJf6i/EJly9IPwRbStrFaKg0crqpZr+VvtMnvramDUS3gjo+yUEW/BE2fsTqD7y5RBmFD5EI91jYxLakfSLo7Xdj9a77065SHt8TxolJ8ezOikBUTbJ/upwNotcrKXPJPIVX+1J8GzTwcN8saxfkiG67fIpmT2G9rCS852KSwzqjPl7TrvK+6HW7gqfbHJqSBIQkKRhJNHUkqG59uTZcMHw0k8Fe4Uh2gJtNrjKoxePsKnpvydX9RT7GZy1AxY1tFzGaHraLrPWdaQiG4m2IbkLRIN2+0X5QCgY5n6pfx8T34U0l1D01LvX2SOuVGxu90qwcWcK1ejvMxbBipyx1F9H9bMrbMOezas/clDM6pw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 07:44:18.7719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bd2b1e-5128-4c27-8973-08dc5f7b5ac6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8986

DQoNCj4gT24gMTggQXByIDIwMjQsIGF0IDA3OjI4LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDkuMDQuMjAyNCAxMzo0NSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9leHRhYmxlLmMNCj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9leHRhYmxlLmMNCj4+IEBAIC0yMyw3ICsyMyw4IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBleF9jb250KGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFibGVfZW50cnkgKngpDQo+
PiByZXR1cm4gRVhfRklFTEQoeCwgY29udCk7DQo+PiB9DQo+PiANCj4+IC1zdGF0aWMgaW50IGlu
aXRfb3JfbGl2ZXBhdGNoIGNmX2NoZWNrIGNtcF9leChjb25zdCB2b2lkICphLCBjb25zdCB2b2lk
ICpiKQ0KPj4gK3N0YXRpYyBpbnQgaW5pdF9vcl9saXZlcGF0Y2ggY2ZfY2hlY2sgY21wX2V4KGNv
bnN0IHZvaWQgKmEsIGNvbnN0IHZvaWQgKmIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgdm9pZCAqZGF0YSkNCj4+IHsNCj4+IGNvbnN0IHN0
cnVjdCBleGNlcHRpb25fdGFibGVfZW50cnkgKmwgPSBhLCAqciA9IGI7DQo+PiB1bnNpZ25lZCBs
b25nIGxpcCA9IGV4X2FkZHIobCk7DQo+PiBAQCAtNTMsNyArNTQsNyBAQCB2b2lkIGluaXRfb3Jf
bGl2ZXBhdGNoIHNvcnRfZXhjZXB0aW9uX3RhYmxlKHN0cnVjdCBleGNlcHRpb25fdGFibGVfZW50
cnkgKnN0YXJ0LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IGV4Y2VwdGlvbl90YWJsZV9lbnRyeSAqc3RvcCkNCj4+IHsNCj4+ICAgICBzb3J0KHN0YXJ0
LCBzdG9wIC0gc3RhcnQsDQo+PiAtICAgICAgICAgc2l6ZW9mKHN0cnVjdCBleGNlcHRpb25fdGFi
bGVfZW50cnkpLCBjbXBfZXgsIHN3YXBfZXgpOw0KPj4gKyAgICAgICAgIHNpemVvZihzdHJ1Y3Qg
ZXhjZXB0aW9uX3RhYmxlX2VudHJ5KSwgY21wX2V4LCBzd2FwX2V4LCBOVUxMKTsNCj4+IH0NCj4g
DQo+IE5vdCB0aGUgbGVhc3QgYmVjYXVzZSBvZiB0aGlzIGFkZGl0aW9uIG9mIGFuIGVudGlyZWx5
IHVzZWxlc3MgcGFyYW1ldGVyIC8gYXJndW1lbnQNCg0KV2VsbCBpdOKAmXMgbm90IHVzZWxlc3Mg
aW4gdGhpcyBwYXRjaCwgZ2l2ZW4gdGhhdCB3aXRob3V0IGl0IEkgY291bGRu4oCZdCBrbm93IHRo
ZSBzaXplIG9mIHRoZSBhZGRyZXNzDQplbGVtZW50LCBob3dldmVyIC4uLg0KDQo+IEknbSBub3Qg
aW4gZmF2b3Igb2YgLi4uDQo+IA0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NvcnQuaA0KPj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL3NvcnQuaA0KPj4gQEAgLTIzLDggKzIzLDggQEANCj4+IGV4
dGVybiBnbnVfaW5saW5lDQo+PiAjZW5kaWYNCj4+IHZvaWQgc29ydCh2b2lkICpiYXNlLCBzaXpl
X3QgbnVtLCBzaXplX3Qgc2l6ZSwNCj4+IC0gICAgICAgICAgaW50ICgqY21wKShjb25zdCB2b2lk
ICphLCBjb25zdCB2b2lkICpiKSwNCj4+IC0gICAgICAgICAgdm9pZCAoKnN3YXApKHZvaWQgKmEs
IHZvaWQgKmIsIHNpemVfdCBzaXplKSkNCj4+ICsgICAgICAgICAgaW50ICgqY21wKShjb25zdCB2
b2lkICphLCBjb25zdCB2b2lkICpiLCBjb25zdCB2b2lkICpkYXRhKSwNCj4+ICsgICAgICAgICAg
dm9pZCAoKnN3YXApKHZvaWQgKmEsIHZvaWQgKmIsIHNpemVfdCBzaXplKSwgY29uc3Qgdm9pZCAq
Y21wX2RhdGEpDQo+PiB7DQo+IA0KPiAuLi4gdGhpcyBjaGFuZ2UuIENvbnNpZGVyIHlvdSB3ZXJl
IGRvaW5nIHRoaXMgb24gYSBDIGxpYnJhcnkgeW91IGNhbm5vdCBjaGFuZ2UuDQo+IFlvdSdkIGhh
dmUgdG8gZmluZCBhIGRpZmZlcmVudCBzb2x1dGlvbiBhbnl3YXkuDQoNCkkgZ2V0IHlvdXIgcG9p
bnQgaGVyZSwgd2Ugc2hvdWxkIG5vdCBjaGFuZ2Ugc3RhbmRhcmQgZnVuY3Rpb25zLg0KDQo+IEFu
ZCB0aGUgd2F5IHdlIGhhdmUgc29ydCgpDQo+IHJpZ2h0IG5vdyBpcyBtYXRjaGluZyB0aGUgQyBz
cGVjLiBUaGUgY2hhbmdlIHRvIGRvIHJlbmRlcnMgdGhpbmdzIHVuZXhwZWN0ZWQgdG8NCj4gYW55
b25lIHdhbnRpbmcgdG8gdXNlIHRoaXMgZnVuY3Rpb24gaW4gYSBzcGVjLWNvbXBsaWFudCB3YXku
IE9uZSBhcHByb2FjaCBtYXkNCj4gYmUgdG8gbWFrZSBhbiBhZGp1c3RtZW50IHRvIGRhdGEgcmVw
cmVzZW50YXRpb24sIHN1Y2ggdGhhdCB0aGUgZXh0cmEgcmVmZXJlbmNlDQo+IGRhdGEgaXMgYWNj
ZXNzaWJsZSB0aHJvdWdoIHRoZSBwb2ludGVycyBhbHJlYWR5IGJlaW5nIHBhc3NlZC4NCj4gDQo+
IEphbg0KPiANCg0KQW55d2F5IGluIHRoZSBlbmQgdGhpcyBwYXRjaCB3YXMgZHJvcHBlZCBmb3Ig
b3RoZXIgcmVhc29ucy4NCg0KQ2hlZXJzLA0KTHVjYQ==

