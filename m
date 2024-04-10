Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E210089F997
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 16:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703325.1098941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYhH-0007Z1-DA; Wed, 10 Apr 2024 14:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703325.1098941; Wed, 10 Apr 2024 14:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYhH-0007Wl-9v; Wed, 10 Apr 2024 14:13:07 +0000
Received: by outflank-mailman (input) for mailman id 703325;
 Wed, 10 Apr 2024 14:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ruYhF-0007Wf-VC
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 14:13:05 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c6ba83-f744-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 16:13:03 +0200 (CEST)
Received: from DU6P191CA0065.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::27)
 by AM9PR08MB5907.eurprd08.prod.outlook.com (2603:10a6:20b:2da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.53; Wed, 10 Apr
 2024 14:13:01 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::90) by DU6P191CA0065.outlook.office365.com
 (2603:10a6:10:53e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 14:13:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 14:13:01 +0000
Received: ("Tessian outbound e26069fc76b9:v300");
 Wed, 10 Apr 2024 14:13:01 +0000
Received: from c70380364e75.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD9C9D44-A379-47C6-94BC-C4D009882C24.1; 
 Wed, 10 Apr 2024 14:12:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c70380364e75.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 14:12:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB7347.eurprd08.prod.outlook.com (2603:10a6:150:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 14:12:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 14:12:52 +0000
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
X-Inumbo-ID: 71c6ba83-f744-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CBqFvqeLBL6syF2LUqVWjWwnw9Dwm3U5eSKHDDr68UbJaO3ayL7ps8g1EVEYl29RNrYK+1o6XBGoJykw2fsLzfy3D49OxCA0Yq5bdyo2xS6350eCOc987pGOt6GCKBVQvMXN6Yz47AHLV24QXAApC256rOnwTt70PwEbzd9h5p/8unJSnI7P5qGNe3pRh0C/unFOgZGZP269wrLyS2rbCoyOUSJ5YO58Sj7tr2DGn5kd26lTMdrlMuHiSy/7IpZlo8WjKdNHH7kAvEiQvT+JVtt5oyHVMbD0fQgzAgrkW9596swgx1vqMigsDOj10nA+OgC5WmMNSymDdvDN2r4uRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMIAwGnV1HFDgviNHDJR3yXbIfYL3DSik9WPIyo0vrM=;
 b=Y9B4H+1m9I0eHfK4tCZJYCgG+GMGArFUoXpckYM0sBSMguhjRwcNzolHoLFR/oBPXRc3uyzFYbC0ls53gZ2hxLlK6cjO4Vg3FsMI8fhuxGeCgaNeiKiUaLKYF6G8J+zd8hCUEaIFrqSQuTdnBV1uRWBAFKsJqxxwVe0rs/6bdOALLRmjV4Mjl6DedWN8VXVw9o125gUzjluBFZTHtNdUNu8qXmet3/hoZlLq3XD233SqTIHvmSri8i5r0AOwSXS5mMYiMl1rUReYNCYEGtbWYXIaHUSIAdDZRLFtTGragCNfDULNwpDC/rplaWd12Lpy1Wtylqs9AtFJmyIm5XtXvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMIAwGnV1HFDgviNHDJR3yXbIfYL3DSik9WPIyo0vrM=;
 b=Q3Oz5z5ZZ4KBFj7Y1Z1pUIWqWryBmBF6jYY/0vJ9lvQYZ5tFyTEd67XGo6Y7YTEcCucypjrIlFu9K1OAC3Kg4G+5ZSixxSAlsVx8hEXucrSCLCOzJvJQDH2eB+Z5jygaIW2hyU0kQK7jN8ukeC7lG8D9P+S9vXbXwdlQ8Xkuz8Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7923f4667f956716
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hhkjj0+h2yOQZWQuvqq7NP+MKrud/ZzbQmN6e4KK4C8lEONi23G2JIH/e2tM9PJ1OE0ixY9cixJNJHkY0O6bYD2HYFw4cXEOGG3XtdA+1R4v4xLNQxs7KxdV20fBUrZfIgpQcS0Zr1DqLTQut+OtEhIt/cM23a/TQ4tx5P1g47ZaSgl2+SJ54Dwkp70MJl350o861ILxJMyB9lmFyZzQB1iJi+fjbWZa+Itva6uokTxkVLYyFAkITBTL6J59u9wFkcpcKzH6RmyyWNcvj5zsEpgmwhz0i5zlagBfUGlx4K1xJsFoDwTYLvIa3pnbOajTZjwFOd+tNy9g6uqrc4tXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMIAwGnV1HFDgviNHDJR3yXbIfYL3DSik9WPIyo0vrM=;
 b=dpVOqhubAZbe+stq41MC7qOhhDLUUfb3we65Sul1UVgqPUzVyyo9Rl7WRZ14GiDVcsjDNJrtRHkKD+SKdzbqMG6AxkbZWRgddUEdzB3yDGwqaqOgDpJy5z73+4vUbrpfWr+y85boHVPkH/qJkv5GIRxlSP/fE0E/WZ+bpV3KSrJGsSIwff9dVr3unk5mhA+Jkf7E4yuJSDDn38OdoA6dOEBnOxc9Gq9v6bP69HTCF0vFHn66cXS23jMjFuoZqnxjtyXXi4gwVnkTBHpeF0z7gLXoBsFsUrfooclxtosOu3A9Xd9XFCeWK4C6UGRW4s9nmvBfenzhf8D3atysph0rXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMIAwGnV1HFDgviNHDJR3yXbIfYL3DSik9WPIyo0vrM=;
 b=Q3Oz5z5ZZ4KBFj7Y1Z1pUIWqWryBmBF6jYY/0vJ9lvQYZ5tFyTEd67XGo6Y7YTEcCucypjrIlFu9K1OAC3Kg4G+5ZSixxSAlsVx8hEXucrSCLCOzJvJQDH2eB+Z5jygaIW2hyU0kQK7jN8ukeC7lG8D9P+S9vXbXwdlQ8Xkuz8Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 10/13] xen/arm: remove shm holes from extended regions
Thread-Topic: [PATCH v2 10/13] xen/arm: remove shm holes from extended regions
Thread-Index: AQHainORNadX2Zn/QkSGO7PTdS59ZLFhXAaAgAAxYAA=
Date: Wed, 10 Apr 2024 14:12:52 +0000
Message-ID: <933424A0-627F-428E-8A32-6CB3F2839294@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-11-luca.fancellu@arm.com>
 <38281ab3-0680-44d3-8c81-14b09d52680b@amd.com>
In-Reply-To: <38281ab3-0680-44d3-8c81-14b09d52680b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB7347:EE_|DU2PEPF00028D08:EE_|AM9PR08MB5907:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 agKByOfIb47W9zJ4+fts7Nr8WOYuQnHCAv5ceVuTwRIaFj2wmBi2DeWm2+YVuQxEfiyOS1fSrKwMgDhn3MA37icR8xjw/zaeY0vTl4bH1NnDan/FO3y8YyqkGcoVNvFyS3l0RRmkodIMa8zt32huA2I9EnnR+2N/4+DLGb/tpPEZ4wBmnp17KwCmSfwcyDZ1hp92SyK5tJc9y5PT6/o9pDR9CYrldZyUrOVaSySWQr5b03qyGQ8zIe9y4ufr/3IltqQuT/cICvHc7PRVbLepTKZrszYg41tz0qOF+GHFtaKb/xl+bwpLPzZ4/jPdfUuV4Vcg7DSVDpj2eB0lfU5A3Pw++oj7HUk/UT3UCEfFo+EjVowh0AW8qpcvSioBdZUgldUgHxyG0XeB7JLbadi6mPJs6/ObgpIzffMvurIprDtc4yfbm+4LlKC2XFlSXJVkNmTRryXfHI5cKyd1lS5qNFN0IndYZcWGxEaThvBznovhDHrcD84c7AbZYdlPlk3MwQeTgFd0ytsQIJfaYFZORbjRKES/yhxKGFm9l0NbSkrkFj3Mr3eYKBD/uc0E+uZcLlSFucUc52BH7i0E6Rd4/zDFBOGtAwzvu9rbwAXUb0MTz6wg/tq7EyGI1Vk2XEYlPv2jjLhsdWR1MoJpVDNzCW6DOphdASakCCkI1Ss+wpk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <98343E42A1B53D45A662E05994533671@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7347
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47e7dbc-4c05-4fab-db3e-08dc596854c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pAeGBXpePTp2adWLw0JTopqqR3QJ6mdjGRiam+/SfBGg6r2nl1WToy7ubL8K8Crw34b3htf8w0Vos7NMnmQgZEC2i9HdrLkqdlASgZTUfI1Z4GwfmiFjpu/vJuDZLgfdqSoaekGROZzGn2tt1R9FN3fixeJdgWUejmTijC+Ut0hb3eV3blxhdW7DdfsEeenfb1MR1fH4SMfOGyBR7du7Yl4CM1wBSc4J1bDIhuxgnW6hD1S8dy3EnzsTUgXALbAzOWe7IwZeRwmSPqbiq9AgabGd2L7iY3CS76hFSEfWzz/GbPCK/qQzc7bEcbkgHop7Ho53UB0u2M8Rwm9oaf9p4TjyyNiMk0xDY2yPrwm3MCUIJVzaM/mlLSoFvYPjFYlVYcYOjCZW3ADMiuYwPo1kn2Vuy7CE6L2pbm8IBPBqavsrFNdrS1FBctGkqovOw2UjCrErosyRqlUHjOZ6jjN31lPqcCE7pLROo2uLoZcdA1Yb99tQgO3BETl57/si9y+icP7nTMjHIpGJy9PdYg+BqwBMYyg8vKz/Z8bWxhL8MeYtM4f8UBZ5vCcz6LgZglL1sVfnMVuMtEiscFA3oAudUiLA/xmCnS3B3kG7Hb+Zo2tq2Dq3wQy1Da+4QBWSo0R0tkxg0tcP/xfuxI0o/mL7Jd33H4ue7d76hNs2vQl2oQQOk9kekQ8CNMWMUeNVGnkjYIM1jLgxZ3fzu3XmLWtfqlceCW0PL+RBjwbRgj/ltu34keKlP+BQa156+jK5Ok7T
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:13:01.3557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b47e7dbc-4c05-4fab-db3e-08dc596854c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5907

DQpIaSBNaWNoYWwsDQoNCg0KPj4gDQo+PiBGb3IgZGlyZWN0LW1hcCBkb21haW4gd2l0aCBpb21t
dSBvZmYsIGFzIHN0YXRpYyBzaG0gaGFzIGFscmVhZHkgYmVlbiB0YWtlbg0KPj4gY2FyZSBvZiB0
aHJvdWdoIHJlc2VydmVkIG1lbW9yeSBiYW5rcywgd2UgZG8gbm90aGluZy4NCj4gU3RhbGUgaW5m
byBnaXZlbiB0aGF0IHNobWVtIGlzIG5vIGxvbmdlciBwYXJ0IG9mIHJlc2VydmVkIG1lbW9yeSBi
YW5rcy4gSXQncyBiZWVuIHRha2VuIGNhcmUNCj4gb2YgYnkgcmVtb3Zpbmcgc2htZW0gcmVnaW9u
cyBpbiBmaW5kX3VuYWxsb2NhdGVkX21lbW9yeSgpDQoNClNvcnJ5LCBpbiB0aGUgcHJldmlvdXMg
bWFpbCBpdCBkaWRu4oCZdCBwYXN0ZSBteSBwcm9wb3NlZCBmaXg6DQoNCkZvciBkaXJlY3QtbWFw
IGRvbWFpbiB3aXRoIGlvbW11IG9mZiwgYXMgc3RhdGljIHNobSBoYXMgYWxyZWFkeSBiZWVuIHRh
a2VuDQpjYXJlIG9mIHRocm91Z2ggZmluZF91bmFsbG9jYXRlZF9tZW1vcnksIHdlIGRvIG5vdGhp
bmcuDQoNCkNoZWVycywNCkx1Y2ENCg0K

