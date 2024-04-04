Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22489841C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 11:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700768.1094413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJUD-0000mI-N9; Thu, 04 Apr 2024 09:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700768.1094413; Thu, 04 Apr 2024 09:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJUD-0000jL-KR; Thu, 04 Apr 2024 09:34:21 +0000
Received: by outflank-mailman (input) for mailman id 700768;
 Thu, 04 Apr 2024 09:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClcT=LJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rsJUB-0000j7-Ft
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 09:34:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81608891-f266-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 11:34:16 +0200 (CEST)
Received: from DB9PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:1d9::27)
 by AS8PR08MB9840.eurprd08.prod.outlook.com (2603:10a6:20b:613::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 09:34:12 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::6) by DB9PR02CA0022.outlook.office365.com
 (2603:10a6:10:1d9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Thu, 4 Apr 2024 09:34:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 4 Apr 2024 09:34:11 +0000
Received: ("Tessian outbound e26069fc76b9:v300");
 Thu, 04 Apr 2024 09:34:11 +0000
Received: from d49fdf4a02c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 310C725A-DC60-4160-91DC-8025E332ECCB.1; 
 Thu, 04 Apr 2024 09:34:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d49fdf4a02c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Apr 2024 09:34:00 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM7PR08MB5509.eurprd08.prod.outlook.com (2603:10a6:20b:10c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 09:33:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3716:2f81:3984:f186]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3716:2f81:3984:f186%3]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 09:33:56 +0000
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
X-Inumbo-ID: 81608891-f266-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KNli5a21K0BXkxCFjawtzIq0uAueiPSTVXNM44xwhiB6NAX8jcAoem6sbM8oXf95w9O4HMSHqdHFRglta1IEr+Bfgco8pQxRkRQt/yRuHxH9K+0fMDQE/JMvl9aYiSEpmc+a9KId8E3Tdv+qwk8JboeOMy+sq6IiISEApBsjkx8rb5AfvAnGQnYGbHYnWNnkgauo7dAIb4SUOulZSw+OjQOZJgoQ76JIBzNG+gCYPf+Aez8T0C0eY9h+2eyjpaMZeQHtkWZH3iYsOI2FWxFqyZ8EeiwAoMlQjt/y4omjYunddSfOlkjQTmqiG8nzUQ/zecEQzmIyEPRsvsVsfz7fPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2BiQgMdgcwo9JQ200aWwl3N+V94lEXCpNNe51ZpZYk=;
 b=efa/23sexi1Iaf+L/VXLXboX61poZkNSgh/JLHFN3oB/9S9Mk+HW0kiw6Dg7R1hCochP6JQDMVKEkkjnouSz+lY/DIDSYEJ1UibBke69qfJJkaWSIKEM+FPycDuidNw1RUq3TPc5OXmFyvtXM/DATYr3VNhOSBdhEz10ng+S7C46YXLgxLoKQsX66FiVtr2hnnIr/HmJ3owOGdLGvIfQ0v33ZMMv3hHx/oU6V6cu4skAEdyzFWayrlNsuVkluneYLRVaks/+BiB3m7OtXO4A7ZBwgsrDjQ9IDba+Yq2iKjcjNCIR8fjywM9YGeT5b6A23auSe6J6hiuqinzM5VycKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2BiQgMdgcwo9JQ200aWwl3N+V94lEXCpNNe51ZpZYk=;
 b=JMZOxG1Kj61eIyJNrcLh8S4+kwsTd5L62Hwg/sHlCRLA+TALfH2EB0h6NcDN8nTZMvqyNDbWbVkGIaVBBNk+4JVxgOkOy17SZEnd+oZTJdAZ+dkM2peigZCVqyPzJ01saD+G5K1vn55g8dq1VnM6c1K6O8h44Gwefh25fLklYbk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c45b1de09844539f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKUSJE1HW+9e64S/mk5VxREWnfOUGzqUZ9rcZalF3ZfgaY3nI6G2U56n9McV3a/B4TAjWLhpR17DT1juabsBRxwUtFCo1sXW592qku60GOujWMyBVqH8CIe+H1pFMZD4zfvZTKPXTvqM7c9YEXL9ezuwiH+9yAKAiF1xDvxs9KMIkOk5OFGaVUqXMGFnwb1aS/B/QPLpSHGhiqAmxHPnQ1m0zlZS7AoR22UHtaENxNQoVUMaFXWo/6/PQ3U+dr0y5uhC8HQc6uJ3P884gVn6MQ49vMjhKsxRDLKXiKi/07qoHEJED0cjt/I7JlVW5cMsX5FPCNwFm27c+mkMZYEtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2BiQgMdgcwo9JQ200aWwl3N+V94lEXCpNNe51ZpZYk=;
 b=OtPM+RPyXIKwdSQsYQUJ1yxQmQhMxz0Zle6D4dMXmSSnxEFtkgKfP8TKgolqwy9CzvKG52ZHeNO9PWPv5Ir5g4zeCYNdGBPGHr3BNbfFeRZA+33tSDH9nCXvxflWFIlNZ8H182Jt4522d85muzHn3AK8LWXYOHe7kfK6jLcyG5ri2rFoLkWGpVHVlasjMgQSl57hS7FQfT1sNWjYS4jd4/oz1gwds9MvNtQI0Cmyd8PnYjvPzyw5/5jghqAsg1Hj4px2hH5qtwwOyW83F4oG3j462zPuNEHU86CBLo06gztZp8fzgy7U1Ka/DCen8smCHNOHLCFVELkGzvnuQ83RVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2BiQgMdgcwo9JQ200aWwl3N+V94lEXCpNNe51ZpZYk=;
 b=JMZOxG1Kj61eIyJNrcLh8S4+kwsTd5L62Hwg/sHlCRLA+TALfH2EB0h6NcDN8nTZMvqyNDbWbVkGIaVBBNk+4JVxgOkOy17SZEnd+oZTJdAZ+dkM2peigZCVqyPzJ01saD+G5K1vn55g8dq1VnM6c1K6O8h44Gwefh25fLklYbk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 08/11] xen/arm: Reduce struct membank size on static
 shared memory
Thread-Topic: [PATCH 08/11] xen/arm: Reduce struct membank size on static
 shared memory
Thread-Index: AQHadH3fZ6dDv0/IQEuODzMfw6ES3rFDntIAgBRekoA=
Date: Thu, 4 Apr 2024 09:33:55 +0000
Message-ID: <F2A93445-09E5-408B-8857-0CDB6ECCF360@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-9-luca.fancellu@arm.com>
 <1cfde34b-6d03-4a18-81af-2e2a0195190e@amd.com>
In-Reply-To: <1cfde34b-6d03-4a18-81af-2e2a0195190e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM7PR08MB5509:EE_|DB1PEPF000509EA:EE_|AS8PR08MB9840:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vtnhzV6/BTZVRKrY0X7gzCaWPOJKgMVxm0BTTTQASidnieNtBBjVhMgp2ykqEgmRCg9n6AU+heYJX2mwt3tsT068Uu5x2NKWxoX3Wsx9lllPdwfg4I/taRzC2Hd30SOq/IvqX+SlzZTCTEppPpTih3m0BTois5Ozpjn+3QpSf4+qSuJ5ytVg9TZuFb9zYv9lrxjoNUfu7p9ajeUr9c4WwxCJ4Xd/9W1OU9mfjnMCJKYEtdPYqFFkWJct2QNE4lzM0acOKnry/bken8NR0me1DmZPMbUJUNvPfslvh/zFFgfqwRVtgnRu8iAw6a/mHS+vsQSfCCBDCyKYE7qhCuPI5GP9euK7Zusr2CdvX1izd8/CTRQJvWXPeJoLnoOydyt7IZxKdpzYJFRp3WP/XzzDsGF7DTBWBC/QPXKfxUlBfVQjxevBmNt/8E++S9Iw3+l9Yzee2cshchIdkrAq1S7lNwoMRxc2rbkUHcUqKzmJkEdSOni21yBGVaZvbKrEyChO9Kwt2tblsVb17Ay4VVJMvcGHEO4pCzFO11jPKysKP9kuTjrMBJTVRTwQLceqLRIduIhHW1Bj7KowttUnwdB2SgEYrfp8Gn6VHtMhExhlxT4XP7WRntrC/GmyUYXTp4DFmdm9z1R53/yqj6t7+iaUX3qgVpUZnDI6UNxNo0zoN4U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCEBD6B91891864F9155F6A5410FCDFE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5509
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e21cf115-481b-4c5e-f1c9-08dc548a62b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZVApHholVDq278DMwwVZRhdSwBZ9EPKeS7638IVBQfPDAUuOj4TTJQ4NES80WftDjGx1myiw8QUQ3cLcPB2AAkJu4BnTEdWDa0D+GeSirCbOc2BLsZKNF8NuI/vDrwUlExmb46CJ5QFMxU6V0T6cXrKjBpQ+UR1ChSZzkVsFdIptqQzEb8d3KYYsL2TSd9Vt+ZzVzsgpu+7bVj7z8rbzAF8wU7htzkDRUTP9kIXceFDpkri26/dGdSERGzc73NKXg6AbEgKvlelMpuVNqLPDMfw8Sp3f9P+9/hxrbrBf27FXiCI0FcdtOIZhvVdPrCHzb9gEF7jYd494bPWP4iwYqwJsmXPOazDJwoeYpnID8OKNqI0y5WDtOaSac90hLPiLgKe+Ud8CI9ONmDPo4EXYH1U6GJ//0wo4cj+O/+8kXk3ypz8vYY1lAkrbpzfozoZpxVZx2Mo8PjRHvrq454oWZ1edOn/4mn7CVgfM67/P2Vl8U/TnE53FWnCNhjqjuwV5TdRIV0C1VG6isIKFY9kSEHdAxFNz6LK5yPuMyd+SRMaG0hj7yB9uE+b4uFLzVYp8l/DS3J/BFi83wh+oHQkAAMh4jgRaiI9/a4ICxE3yJWUsketwYU0Brn7ta00tjlJHztfSj4toB4NdVbdxDrD6jv5S8k7FflZPlF+qJPH5QH5wkzpCiJremHhpV7fsurpBPWWF8/PUn6IsfMKerC/gx75gIrgTljKSEBPIjLA+Lc+3WDWcFNCTTv80I/imOSq/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 09:34:11.7282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e21cf115-481b-4c5e-f1c9-08dc548a62b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840

DQoNCj4gT24gMjIgTWFyIDIwMjQsIGF0IDEwOjMwLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMi8wMy8yMDI0IDE0
OjAzLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IEN1cnJlbnRseSB0aGUgbWVt
b3J5IGZvb3RwcmludCBvZiB0aGUgc3RhdGljIHNoYXJlZCBtZW1vcnkgZmVhdHVyZQ0KPj4gaXMg
aW1wYWN0aW5nIGFsbCB0aGUgc3RydWN0IG1lbWluZm8gaW5zdGFuY2VzIHdpdGggbWVtb3J5IHNw
YWNlDQo+PiB0aGF0IGlzIG5vdCBnb2luZyB0byBiZSB1c2VkLg0KPj4gDQo+PiBUbyBzb2x2ZSB0
aGlzIGlzc3VlLCByZXdvcmsgdGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGV4dHJhDQo+PiBpbmZv
cm1hdGlvbiBsaW5rZWQgdG8gdGhlIG1lbW9yeSBiYW5rIHRvIGFub3RoZXIgc3RydWN0dXJlLA0K
Pj4gc3RydWN0IHNobWVtX21lbWJhbmtfZXh0cmEsIGFuZCBleHBsb2l0IHRoZSBzdHJ1Y3QgbWVt
YmFuaw0KPj4gcGFkZGluZyB0byBob3N0IGEgcG9pbnRlciB0byB0aGF0IHN0cnVjdHVyZSBpbiBh
IHVuaW9uIHdpdGggdGhlDQo+IE5JVDogQUZBSUNUIHRoZSBwYWRkaW5nIHdpbGwgYmUgcmV1c2Vk
IG9uIEFybTY0IGJ1dCBvbiBBcm0zMiB0aGVyZSB3aWxsIHN0aWxsIGJlIDRCIHBhZGRpbmcuDQoN
ClllcywgbXkgcHVycG9zZSB3YXMgdG8gbWFrZSBjbGVhciB0aGF0IG5vIGFkZGl0aW9uYWwgc3Bh
Y2Ugd2FzIG5lZWRlZA0KZm9yIHRoYXQgcG9pbnRlciwgc2hvdWxkIEkgcmVwaHJhc2UgaXQgb3Ig
aXTigJlzIG9rPw0KDQoNCj4+IA0KPj4gDQo+PiArc3RydWN0IHNoYXJlZF9tZW1pbmZvIHsNCj4+
ICsgICAgc3RydWN0IG1lbWJhbmtzIGNvbW1vbjsNCj4+ICsgICAgc3RydWN0IG1lbWJhbmsgYmFu
a1tOUl9TSE1FTV9CQU5LU107DQo+PiArICAgIHN0cnVjdCBzaG1lbV9tZW1iYW5rX2V4dHJhIGV4
dHJhW05SX1NITUVNX0JBTktTXTsNCj4+ICt9Ow0KPiBTYW1lIGFzIHdpdGggbWVtaW5mbywgcGxl
YXNlIGFkZCBhIEJVSUxEX0JVR19PTiBmb3IgcGFkZGluZyBiZXR3ZWVuIGNvbW1vbiBhbmQgYmFu
ay4NCg0KU3VyZQ0KDQo+PiANCj4+IA0KPj4gLXN0YXRpYyBpbnQgX19pbml0IGFwcGVuZF9zaG1f
YmFua190b19kb21haW4oc3RydWN0IG1lbWJhbmtzICpzaG1fbWVtLA0KPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBzdGFydCwgcGFkZHJfdCBz
aXplLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqc2htX2lkKQ0KPj4gK3N0YXRpYyBpbnQgX19pbml0DQo+PiArYXBwZW5kX3NobV9i
YW5rX3RvX2RvbWFpbihzdHJ1Y3Qgc2hhcmVkX21lbWluZm8gKmtpbmZvX3NobV9tZW0sIHBhZGRy
X3Qgc3RhcnQsDQo+IElzIHRoZXJlIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiB0byBwcmVwZW5kIHRo
ZSBzaG1fbWVtIG5hbWUgd2l0aCBraW5mbz8NCg0KSSB0aGluayBiZWNhdXNlIHVzdWFsbHkga2lu
Zm8gaXMgdXNlZCB0byBwb2ludCB0byDigJlzdHJ1Y3Qga2VybmVsX2luZm/igJksIGluc3RlYWQg
aGVyZSB3ZSBwb2ludCB0bw0KJ3N0cnVjdCBzaGFyZWRfbWVtaW5mbycNCg0KPiANCj4gfk1pY2hh
bA0KDQo=

