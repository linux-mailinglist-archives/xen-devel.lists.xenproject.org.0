Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5288C4FC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 15:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698101.1089436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7eM-00049p-Bd; Tue, 26 Mar 2024 14:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698101.1089436; Tue, 26 Mar 2024 14:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7eM-00047G-8Q; Tue, 26 Mar 2024 14:19:38 +0000
Received: by outflank-mailman (input) for mailman id 698101;
 Tue, 26 Mar 2024 14:19:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfPE=LA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rp7eK-00047A-Cs
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 14:19:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id debeed21-eb7b-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 15:19:34 +0100 (CET)
Received: from DU7PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::27) by DBBPR08MB10841.eurprd08.prod.outlook.com
 (2603:10a6:10:533::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 14:19:32 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::6e) by DU7PR01CA0037.outlook.office365.com
 (2603:10a6:10:50e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 14:19:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7409.10
 via Frontend Transport; Tue, 26 Mar 2024 14:19:32 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300");
 Tue, 26 Mar 2024 14:19:31 +0000
Received: from c19ff881ff38.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B81EFC4-418D-4289-B86B-C3AF66658A0F.1; 
 Tue, 26 Mar 2024 14:19:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c19ff881ff38.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Mar 2024 14:19:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 14:19:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3716:2f81:3984:f186]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3716:2f81:3984:f186%3]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 14:19:23 +0000
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
X-Inumbo-ID: debeed21-eb7b-11ee-afe3-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TEwintZXPnOIzpiwbyWE04CVa/Hyti2gyQtsOcqasYpWGU8/znzLp74ImTcS57l9llqZriqek+I0R2qF13Q+T1JBfH5h7zg78WcNW0CJxkmty8NAdWZA8VgHxIMBLcdgYryRqNMeVjO/OSj6LOS8n2MAZLaIHcIu4qnG3o8Hc0P2RC4Go6+VMMCikUAVKT5xgQ6u0RLH1xy2WGugoBSpmf/93/gszdFMYj1m0XM/SLR58AGUQuuR3y3n4v2O+4cKNl/WWMqJfLPlxXHx2bvBlr+l7ewsga6lJByw9gTwAh/bEyn6v1UESEl1/YynvXyw9mDRpYjZfWW77ypGt5SKwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+tYe4elhZdJp+BiMVTqTs9S+x6YORR9gCYEcIpP5hk=;
 b=HNxcGru1NLElXHBtn2d8Qo/UJEGbzANSiP/9Yg4vHsT2lrTJU+AQ7K2/WNlfb+Cn1Gn2Ety3+p0BWW/l0DdER9PcWHf/mVhZJTAxnUH9AGcuKPEdgZdEhD7M2zhrt/s9beWlx0lMarsCVIC6UWAc+c7oohr8z+hhV3ZsADwp4v5UjQESwEUyq8npNplZhnL0cq9/rhwF/mWkZnzsYHLxRTUMXJALrlrbfnb1xc/E2FqdxvcAnMWkWlAvjrQLyRW8Ibt2T+6BN8OeBKpbX9JzjXUq+SLiS/wQ/RPHZlHhLp90M+alfZNweM89qYqOxUYpQx1709RmELXmiPqs88bn2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+tYe4elhZdJp+BiMVTqTs9S+x6YORR9gCYEcIpP5hk=;
 b=poTUVoAurBjNCbTa6An+7kQJpoFpzwEY9I7Uc3L5uoai5zheldyBhhu8inO5VeI55c7tjOemXxS1WsZo4+2dvL9tETugjjBH6t4rd6YUze0urlFG414EhF9G9EhMeY+C4aLI7DP36LwE8SE7DwYmmgEaDAytYfozzUYac6EhMyo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ea786dc3d807939
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfzbmzTNejDD+wKeAaEZlKWRi/PO2O+eQO3vYq4WUhm2W8tiW0smlC9ZcRTu90b/mOd6jULuXMmB124/5ZSTW25CZNlNrNsu7TX9/VTZvDbzCCht/mXtO1hxhMuX8xnY+EHhWHG3TDH5dIIyBIaypkUx8ZfzpYM07Vt1bfQDRLmiuzB0lZzJTfkIcrlOvtI80xS69CQcbjBbGW1/pYkeI+9pnwE3zMPLXHybGfJCCE0hdiSb7HWtbyNq9lry8dbP7sIatngY/gcLrUHqJJa4yIzkypY9ZswKVHrjvdLNHmcx0jHTDwSPk4cNvx945X+WgCHIrkiS6ygUTvLOiAiXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+tYe4elhZdJp+BiMVTqTs9S+x6YORR9gCYEcIpP5hk=;
 b=lIzwr0BXk8lLvbWHShXfMTJWuv3dIIzKP+cKaHDFOAbEMFLZa2kcLHJ5R2TythkZaXkB6XX/lZuiIytnd+VX+satsaydKPZJpfgVB9G5ApM7BBGnOuyMEZJRN5zviS68Xn2NtUIuJf0onETfaeZYvZaXt2ZUcj68Sd0/Q6S2paPWQXyraBfdTyt1jRgX7HqEy4i5UwYisVhctQA3VGadzLqKaCrlra+Ockhir0EoxFql76Un6Ic2V5Ehzu0SOhV6+nxKxKveMuRNPELVFisYMaOBq8PYmfR//gO7WqITsSl80YPFqY8QtlOZ9GiRGgN8KI4pPfzvAVoLTSfLKLvIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+tYe4elhZdJp+BiMVTqTs9S+x6YORR9gCYEcIpP5hk=;
 b=poTUVoAurBjNCbTa6An+7kQJpoFpzwEY9I7Uc3L5uoai5zheldyBhhu8inO5VeI55c7tjOemXxS1WsZo4+2dvL9tETugjjBH6t4rd6YUze0urlFG414EhF9G9EhMeY+C4aLI7DP36LwE8SE7DwYmmgEaDAytYfozzUYac6EhMyo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 11/11] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Topic: [PATCH 11/11] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Index: AQHadH3e45Ool8yPzEGouaBUJ1T0kbFIPF2AgAHrzQA=
Date: Tue, 26 Mar 2024 14:19:23 +0000
Message-ID: <B338349C-76A3-48C3-97B8-98D0CC9C1A72@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-12-luca.fancellu@arm.com>
 <3a9e8323-9eb3-4c06-9ef1-e85c8bf2aefd@amd.com>
In-Reply-To: <3a9e8323-9eb3-4c06-9ef1-e85c8bf2aefd@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB10055:EE_|DU2PEPF00028D13:EE_|DBBPR08MB10841:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 04PSlS5EiNYwJYpTb51Z7E2PqgGZjOL95asfuKglf06PGtuz7s44ae+wCa7w6CvJ9uPRqvXiGHCMK3kogTTmokl/odJ5tMhxOI69VKQ22LxDihX1rdwmEzb+MP4Ne4hpL2aD3ZjLfVQiAsDMxeb8fdt8Rj5/AG/pGKuLoXySW0KGz2HNxryo/C/Ob9V84ZB0VipI1cjzjNYaeCkLxXiW7sMhuN3upt99iyVw71ryrWeucVgfXceqgA/fqanh5O1dyDe9UgIYHJmOEea3SN/w7CVwGt3vx3pbvh14xOzf97SJqyp9rFNbN4n92CGYUt/T9SfLA1G3H6GysqAMh6wTEp/V2zUIiMlzl5/IAxzEX8TktsSx0krKF1a6f7cN1mXnE3vxvAivmqPDyfqFHg73A1eyG1HZqp3N1XliKBkJgNASTUX7Sc4WYzH2wBtMg90hQEB2EzmMTecd+hNqYw0PACmRziBRcLWciSGujcxhCjDFqqV6woD+mGKk5BmLNhQCk2zE06anf/xk86ox3oSgbj3mzjvflpmhX6/T99CxqDLm65uKMBcuEphGTvNGanRWht1kO3LNLjva6fv1M2XjQZCNiX1mJS38IidW3hy6qjEJEny3kFN1uO9/49M5mfQFCW/+7PqdTSTTz25YJx3rSuCVBI5DJ3RafpRuMPg5JyQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA0845F3FBB4BC4C99CC839788510DE9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 977fa108-eb4a-4f0a-f787-08dc4d9fc172
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r07tT/eR/KeD5c5aVszWFBMrkGMYQ7au04AljskMKiS0Wgq1Dub/dYboKxbpwBCodh/2PUo/q6Vvu64ziyNq4Wfgb72QK9zBSkwJ+T28NTXhXMXzbF0sgowyxNEioq7cKzSocRNtQGwm7b7ndy2ME99Ecek8QDTDEzDdNFGfvSUGtk8hBGtRJ8zQoWTbHzc6po+Z1CY9hXDWdRV0TwqbghXrNRhzVtw4aPhx3lTDCUtQC1V2maUOhp+Fljg/tlEUhvahRpSt92eegonXVxaeKZoUY0MWVQktdt85MLUXaOnft1aNBg5vNczEScGQ3tGBfCCUYwwkC0GArWHQiOILY1J0hMcT27kj61IhU3Xxo2HktQXX+I15fp668iSkNVhTd/Wz285VDpv1BqCoYhk1YRDU02lm/k4yFp4wP/vzQSBrNWU0E+u81tlN7SkKXiik51V20/QoBY/TNSuAYaU/2+7f1wYvw1JvaS7jhgBArc3w6XUoehCGW1psL3hyAkqXmDiGxOKweE7orRplNOA7C+MXMw5ubf7LDx/dKk7A2+NrQexkaq+6sTNDjFNeQ4kLC0QuDp/jwo8pnkV+DRGJmhmFLQLBuvjGEzadqJPP5A3UcdZ6oFHSGyHMKOz9QemjR3SuqTowkHurYuYC2O9Sw+RmERKHkXzed1shJGelW4EH21DBfVowYEPS54aKBvDuFi9uei+CEuxkAQD+e5MULElCvVmgSkbNQe/KMNdaCZH7YroGq3u659RgCp50XuZ9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 14:19:32.0287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977fa108-eb4a-4f0a-f787-08dc4d9fc172
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10841

DQoNCj4gT24gMjUgTWFyIDIwMjQsIGF0IDA4OjU4LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KDQpIaSBNaWNoYWwsDQoNCj4g
T24gMTIvMDMvMjAyNCAxNDowMywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IA0KPj4gDQo+PiBD
dXJyZW50bHkgWGVuIGlzIG5vdCBleHBvcnRpbmcgdGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IHJl
Z2lvbnMNCj4+IHRvIHRoZSBkZXZpY2UgdHJlZSBhcyAvbWVtb3J5IG5vZGUsIHRoaXMgY29tbWl0
IGlzIGZpeGluZyB0aGlzDQo+PiBpc3N1ZS4NCj4gTG9va2luZyBhdCB0aGUgaW1wbGVtZW50YXRp
b24sIHlvdSB3aWxsIGFsd2F5cyBjYWxsIG1ha2Vfc2htX21lbW9yeV9ub2RlKCkgdHdpY2UuIEZv
ciB0aGUgZmlyc3QNCj4gdGltZSwgdG8gY3JlYXRlIC9tZW1vcnkgbm9kZSBhbmQgZm9yIHRoZSBz
ZWNvbmQgdGltZSB0byBjcmVhdGUgZW50cnkgdW5kZXIgL3Jlc2VydmVkLW1lbW9yeS4gQWxzbywN
Cj4geW91IHdpbGwgY3JlYXRlIGEgc2VwYXJhdGUgL21lbW9yeSBub2RlIGZvciBldmVyeSBzaW5n
bGUgc2htZW0gcmVnaW9uIGluc3RlYWQgb2YgY29tYmluaW5nIHRoZW0NCj4gaW4gYSBzaW5nbGUg
L21lbW9yeSByZWdpb24gbGlrZSBtYWtlX21lbW9yeV9ub2RlKCkgd291bGQgZG8uIENhbid0IHdl
IHJldXNlIHRoaXMgZnVuY3Rpb24gZm9yIHNpbXBsaWNpdHk/DQoNCllvdSBtZWFuIHVzaW5nIG1h
a2VfbWVtb3J5X25vZGUoKSB0byBwb3B1bGF0ZSAvcmVzZXJ2ZWQtbWVtb3J5IGFuZCAvbWVtb3J5
PyBJIGZlZWwgdGhleSBhcmUgdmVyeSBkaWZmZXJlbnQNCkluIHRlcm1zIG9mIHByb3BlcnRpZXMg
dG8gYmUgY3JlYXRlZCwgc28gSSBkb27igJl0IHRoaW5rIHdlIHNob3VsZCBjcmVhdGUgYSBtYWtl
X21lbW9yeV9ub2RlKCkgdGhhdCBkb2VzIGJvdGguDQoNCk90aGVyd2lzZSBpZiB5b3Ugd2VyZSBz
dWdnZXN0aW5nIHRvIG1vZGlmeSBtYWtlX21lbW9yeV9ub2RlKCkgb25seSBmb3Igd2hhdCBjb25j
ZXJucyB0aGUgL21lbW9yeSBub2RlcywNCml0IG1pZ2h0IGJlIGZlYXNpYmxlLCBob3dldmVyIHRo
ZXJlIGFyZSBzb21lIHBhcnRzIHRoYXQgbmVlZCB0byBiZSBza2lwcGVkIHdpdGggc29tZSBmbGFn
cyAoYWxsIHRoZSBjb2RlIGFjY2Vzc2luZyAudHlwZQ0KbWVtYmVyKSwgaWYgSSB1bmRlcnN0YW5k
IGNvcnJlY3RseSB5b3UgbGlrZSB0aGlzIGZ1bmN0aW9uIGJlY2F1c2UgaXQgZG9lc27igJl0IGNy
ZWF0ZSBvbmUgbm9kZSBmb3IgZXZlcnkgYmFuaywgYnV0IGl0IGNyZWF0ZXMNCnJlZyBhZGRyZXNz
ZXMgaW5zdGVhZCwgaW4gdGhhdCBjYXNlIEkgY291bGQgbW9kaWZ5IHRoZSBjdXJyZW50IG1ha2Vf
c2htX21lbW9yeV9ub2RlKCkgdG8gZG8gdGhlIHNhbWUuDQoNCj4gDQo+IEFsc28sIGFmYWljdCBp
dCBpcyBub3QgZm9yYmlkZGVuIHRvIHNwZWNpZnkgc2htZW0gcmFuZ2UgKGNvcnJlY3QgbWUgaWYg
SSdtIHdyb25nKSwgd2hlcmUgZ3Vlc3QgYWRkcmVzcyB3aWxsIGJlDQo+IHdpdGhpbiB3aXRoIFJB
TSBhbGxvY2F0ZWQgYnkgWGVuIChlLmcuIEdQQSBSQU0gcmFuZ2UgMHg0MDAwMDAwMCAtIDB4NjAw
MDAwMDAgYW5kIHNobWVtIGlzIGF0IDB4NTAwMDAwMDApLiBJbiB0aGlzIGNhc2UsDQo+IHlvdSB3
b3VsZCBjcmVhdGUgeWV0IGFub3RoZXIgL21lbW9yeSBub2RlIHRoYXQgd291bGQgcmVzdWx0IGlu
IG92ZXJsYXAgKGkuZS4gbW9yZSB0aGFuIG9uZSAvbWVtb3J5IG5vZGUgc3BlY2lmeWluZyB0aGUg
c2FtZSByYW5nZSkuDQoNClRoaXMgaXMgYSBnb29kIHBvaW50IEkgZGlkbuKAmXQgdGhpbmsgYWJv
dXQsIHllcyBjdXJyZW50bHkgdGhlIGNvZGUgaXMgY3JlYXRpbmcgb3ZlcmxhcHBpbmcgbm9kZXMg
aW4gdGhhdCBjYXNlLCB3b3cgc28gaXQgbWVhbnMgSQ0KbmVlZCB0byBjb21wdXRlIHRoZSBub24g
b3ZlcmxhcHBpbmcgcmVnaW9ucyBhbmQgZW1pdCBhIC9tZW1vcnkgbm9kZSB0aGVuISA6KSBvdWNo
DQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5IHlvdXIgY29t
bWVudHMuDQoNCkNoZWVycywNCkx1Y2ENCg0KPiANCj4gfk1pY2hhbA0KDQo=

