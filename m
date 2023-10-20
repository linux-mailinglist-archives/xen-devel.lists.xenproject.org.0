Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9712A7D0621
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 03:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619621.965010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qteFM-0007xM-Ku; Fri, 20 Oct 2023 01:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619621.965010; Fri, 20 Oct 2023 01:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qteFM-0007uv-IF; Fri, 20 Oct 2023 01:24:16 +0000
Received: by outflank-mailman (input) for mailman id 619621;
 Fri, 20 Oct 2023 01:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qteFK-0007up-Ta
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 01:24:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ffbe917-6ee7-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 03:24:12 +0200 (CEST)
Received: from DB6PR0301CA0079.eurprd03.prod.outlook.com (2603:10a6:6:30::26)
 by DB9PR08MB8435.eurprd08.prod.outlook.com (2603:10a6:10:3d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 01:24:09 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::5b) by DB6PR0301CA0079.outlook.office365.com
 (2603:10a6:6:30::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 01:24:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21 via Frontend Transport; Fri, 20 Oct 2023 01:24:09 +0000
Received: ("Tessian outbound 36e2b13fe8d0:v215");
 Fri, 20 Oct 2023 01:24:09 +0000
Received: from 1347e361894b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3FAE05F4-61AC-4FF6-AF30-7C109472EDE0.1; 
 Fri, 20 Oct 2023 01:23:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1347e361894b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 01:23:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB10001.eurprd08.prod.outlook.com (2603:10a6:20b:632::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 01:23:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 01:23:56 +0000
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
X-Inumbo-ID: 5ffbe917-6ee7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBhBFV9Wdde77kOytVt9Rym9kvwEhwRRhDf/L8rLFb4=;
 b=18EIY3j+HBg6InD43UVAVGmZTWHQCkYt081as0oK9aYzPSmu1e0wSdXNfasmKtwvIblafNSbghJAoFUQ1SImLyFHial7wTvOV/qNyThBFSjl95KW2bTypiWS0dUJzQNrElOguCP8P7M7jmYASlA/+Ns9/v5R/L3M+KlhQFAoOtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3417ae61d3af89f3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivmu6xAk7FrNvDmy11l2mjEshGUbtBQ2WqF2KX9S7ywSzItFlYJpkoogpA8dMCJbFBzTgKB3BMjKXLTxoVzpbT1yH38tmp93YgUbFVjoHGsQnjx3s0lIWgIndx6vDlaiHp8ogB7ZcJSktltaAOpC/EW0LKxbzv+Tk1SrRgVxRjbpd+8QyjfGpvuoNaKbflFFKNZlA/0jVVWpre/wsJ+3iOK/3gA8ro8F/RPhVe72S2ZsJlJHkgblI4t6VgQz52bQfzIw1V1lW2ieDgqWnvxJI7COgyFRG62v1S1hAG/iB5hdnfrDKOuAKzmSy14lm5v0zO9bnLJDa3yXce68c81q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBhBFV9Wdde77kOytVt9Rym9kvwEhwRRhDf/L8rLFb4=;
 b=Ei4TPlC90DexH9aAsjJ+o1R2vBdJcZA1aps42XTz3Q5tmLEdJLUZcnczmJO9mmglRGHtWX/9EOV6qyH1OwqRKvZtsjhX7gT+6zSFop2khjLddSqp9A3CyqYgWs/tlaTKQrRpueFufPiYqhst8xEpkHUVMXPvb2SjVnhW2m6athVPsRS5PvOzb0mpCU2PGrJurGqNFg8r3MFz49D7pqDBxrKK6i4JHXGk56uJ87Svj6R+qYokNI0D9PXMuPvDsSA4vhrr4YNaHrFk/DuFKYDbiXdU6M6KRio9wK5qjo1HUiWCe2/oAOOuf+N+EPW7hvMuxTLHA+DXNgwj5K9boZPOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBhBFV9Wdde77kOytVt9Rym9kvwEhwRRhDf/L8rLFb4=;
 b=18EIY3j+HBg6InD43UVAVGmZTWHQCkYt081as0oK9aYzPSmu1e0wSdXNfasmKtwvIblafNSbghJAoFUQ1SImLyFHial7wTvOV/qNyThBFSjl95KW2bTypiWS0dUJzQNrElOguCP8P7M7jmYASlA/+Ns9/v5R/L3M+KlhQFAoOtE=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 2/3] CHANGELOG.md: Set 4.18 release date and tag
Thread-Topic: [PATCH 2/3] CHANGELOG.md: Set 4.18 release date and tag
Thread-Index: AQHaAkwelJ/nqwKyk0yYe6Zf84C1/bBRSfMAgACZlYA=
Date: Fri, 20 Oct 2023 01:23:56 +0000
Message-ID: <8327F8D2-72B7-42CE-A31A-9E845A38DAC0@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190913360.1945130@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310190913360.1945130@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB10001:EE_|DU6PEPF00009529:EE_|DB9PR08MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e11254-c7aa-4a14-9ed4-08dbd10b427e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Zb51Qq95BgWp6fGR+r8XFEkte+cHVOX6DrZpnFtuqBhwxb33VMZ1vSrNrGjixgKvweePEOgppem5kAZypI8SaZBdw486bqvo2rmaXg6BilMpX3GDmqqRydLwqxocZ69j8WSYjHiOUndpQw9o7RIp0WHsrgIaC3zyows1+yHAAnZi3gowSQ5GuXLV9gflZgoUBUUXNp6jBmZJV8gPFJ8Xs+7HvgFwdVA9mgQyXpFaLN74aTIftjH60G10bBiyAW/uuCMllBCsAx5xZYHFt1jHzpDpwtE2vG4IC5zMi2xAHcRHcldkIhqDAx4POl6BZLaOqcLNUzju1OPj5z8K6KbaNVM5+7qIJXqQ+EcGEYdivEXb9Yfn7NeYpJUI8p9aj1MJEqcN1G8sUICOOnxIYA7ugz7NBaTW3LwUguO4SIRQF3zjZ3wugyXBAfvZ4qBBZQLh6t9+yqe7b+s8AlGbUI8K50TE+4KemeTLKa2R2QBZ13djFtiYwDjHG7IGdXPPHb/bN+jXGeDOawRGThZ1YI9ZPXeEtTEGe+psLbAKIswzMsfmvD7NEh4Xjj93VLdL/1I/IGsvru7GQnwqEUnfwMch5SFQyNl7scrTxMfRycvvyo2En5v66qUaFSAOtVVG6dVgGq6MgYA3ia7ooqEPUsx4NRI273mtbn0R/F1GMA4BDihCDN/GlqxhpwjjV/sw0SYSh27XAPVIHGDpSNJSByca39WaOEO/tNKwMfOV0ptaEkA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(38070700009)(4001150100001)(36756003)(122000001)(2906002)(316002)(5660300002)(8936002)(33656002)(4326008)(86362001)(8676002)(26005)(71200400001)(53546011)(83380400001)(38100700002)(2616005)(6506007)(91956017)(6486002)(41300700001)(478600001)(6916009)(6512007)(76116006)(54906003)(66476007)(66446008)(66556008)(64756008)(66946007)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <36815FC55F58DC48A2AFDD1650140910@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10001
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2c21e9a-20f6-4f68-dc65-08dbd10b3a98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tzhjDOf8nwdjBXLrVUoDV1xxgcPdPwEShFNC/LQXMx1Yw+IE/PdUV+h/9YN5wadkV0Tkxj+v91b96cdYdNwD/UCt2+9kMvJxPMC3TIQ9zSssu2n3VERlXUrGWQL70ANSJVvzLAb+9llv61Pqw90Z1fzazAo5bP6WI8eoCEJ+VpIS7mXkl9FgyX0For4MPzEtDOto3iPPQmnwU+vSBkpdPCc6ycb9C5n9zt3vdjTHUDyLNhB/zPcTUVbZz0HgC5QUqDXirHHX7VEYtqoyLLqMUk2vd/iRz6NUdu8BfRIZw+YTK7OloRDCtPU4C6CC0SDzha4X7QhZxD98NyPHdRSQp4prQv3i1alPnV1ZlSbgTwd4sR6GKL/sngnXFuWCdnVEzVxFlJGM88B/0utEpyE7GmH/P+OG3OOOKmvRoNS7xtshFi3ETFQq61L2HXk55Rjcq3FaEvUsrwRkzkmCCtstKsxdjEJCW2rVN7SOtKzrc2Jo4nnkv7DozQtWKprzNnqvOwfrTN8yQgBezNDE9fSO28Us/5f97teniJTTws4eG8GiQ5oVEfdqBoireB4pKzAxevKmOeGGEY8qJZJlX446e5ckrsSY45dhhRU4jEWuNsO20ukpPTaViJFzoCADr9UdKt39UtKrvHKmwY3TPgVstzmwN+hxxyESm8pORs+rlDUJ+7EBkJ6I2eMu2GGps7ePu1rfbEgDFnrUYv3SxVnG9bGE9a4tAy+xGyq7qoPRY4TBFz32nGa9E7QH+ER/yoM08l04ps7AZON0jTPBUkW5c9mnQVi73SS9ajf0EThp/sDdnbIVezsXPJQv/HZHSsvAiOShzV0HhjwKAsDbYTBMUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(47076005)(36860700001)(40460700003)(70586007)(70206006)(83380400001)(478600001)(6486002)(316002)(6506007)(53546011)(26005)(41300700001)(54906003)(2616005)(81166007)(356005)(4326008)(6862004)(8676002)(8936002)(6512007)(5660300002)(40480700001)(2906002)(4001150100001)(86362001)(33656002)(336012)(82740400003)(36756003)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 01:24:09.3184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e11254-c7aa-4a14-9ed4-08dbd10b427e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8435

DQoNCj4gT24gT2N0IDIwLCAyMDIzLCBhdCAwMDoxNCwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMTkgT2N0IDIwMjMsIEhl
bnJ5IFdhbmcgd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5n
QGFybS5jb20+DQo+PiAtLS0NCj4+IENIQU5HRUxPRy5tZCB8IDIgKy0NCj4+IDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEv
Q0hBTkdFTE9HLm1kIGIvQ0hBTkdFTE9HLm1kDQo+PiBpbmRleCA0N2U5OGYwMzZmLi4zYzgzODc4
YzliIDEwMDY0NA0KPj4gLS0tIGEvQ0hBTkdFTE9HLm1kDQo+PiArKysgYi9DSEFOR0VMT0cubWQN
Cj4+IEBAIC00LDcgKzQsNyBAQCBOb3RhYmxlIGNoYW5nZXMgdG8gWGVuIHdpbGwgYmUgZG9jdW1l
bnRlZCBpbiB0aGlzIGZpbGUuDQo+PiANCj4+IFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAg
YSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+IA0K
Pj4gLSMjIFt1bnN0YWJsZSBVTlJFTEVBU0VEXShodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9eGVuLmdpdDthPXNob3J0bG9nO2g9c3RhZ2luZykgLSBUQkQNCj4+ICsjIyBbNC4xOC4w
XShodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXNob3J0bG9nO2g9
UkVMRUFTRS00LjE4LjApIC0gMjAyMy0xMC0zMA0KPiANCj4gU2hvdWxkIHdlIHVzZSB4ZW5iaXRz
LnhlbnByb2plY3Qub3JnIGluc3RlYWQ/IEkgdGhpbmsgdGhhdCdzIHRoZQ0KPiBvZmZpY2lhbCBu
YW1lLiBJbiBhbnkgY2FzZToNCg0KSG1tbSwgZ29vZCBxdWVzdGlvbiwgYnV0IGFmdGVyIHNvbWUg
ZGVlcGVyIGxvb2sgc29tZWhvdyBJIGFtIG1vcmUgY29uZnVzZWQgbm93Lg0KDQpTbyBpZiBJIGNs
aWNrIHRoZSB4ZW4uZ2l0IGxpbmsgaW4geGVuYml0cy54ZW5wcm9qZWN0Lm9yZyA8aHR0cDovL3hl
bmJpdHMueGVucHJvamVjdC5vcmcvPiwgSSB3aWxsIGJlIGRpcmVjdGVkIHRvDQoiaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXN1bW1hcnnigJ0sIHdoZXJlIHRoZSBo
dHRwIGFuZCBodHRwcyBnaXQgVVJMDQphcmUgYm90aCB1c2luZyAieGVuYml0cy54ZW4ub3Jn4oCd
Lg0KDQpIb3dldmVyLCAiaHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD14
ZW4uZ2l0O2E9c3VtbWFyeeKAnSBpcyBhbHNvIGEgdmFsaWQNCmxpbmssIGJ1dCB0aGUgaHR0cHMg
YW5kIGh0dHAgZ2l0IFVSTCBhcmUgc3RpbGwgYm90aCB1c2luZyDigJx4ZW5iaXRzLnhlbi5vcmfi
gJ0sIGFsc28sIGFsbCBvdXIgcHJldmlvdXMNCnJlbGVhc2VzIHNlZW0gdG8gdXNlICJ4ZW5iaXRz
Lnhlbi5vcmciLg0KDQpDb3VsZCBhbnlvbmUgaW4gdGhpcyBjb21tdW5pdHkgbG9uZyBlbm91Z2gg
cHJvdmlkZSBhIGJpdCBtb3JlIGRldGFpbHMvY2xhcmlmaWNhdGlvbnMgb24gdGhpcz8NCkkgYW0g
b2sgdG8gZWl0aGVyIGNoYW5nZSBvciBub3QgaWYgdGhlIGRpc2N1c3Npb24gaXMgc2V0dGxlZC4N
Cg0KPiANCj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K

