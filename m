Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6298A15B8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 15:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703948.1099981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruubZ-0005pb-RG; Thu, 11 Apr 2024 13:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703948.1099981; Thu, 11 Apr 2024 13:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruubZ-0005n4-O0; Thu, 11 Apr 2024 13:36:41 +0000
Received: by outflank-mailman (input) for mailman id 703948;
 Thu, 11 Apr 2024 13:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFZQ=LQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ruubY-0005mw-Nf
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 13:36:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85b6abe2-f808-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 15:36:39 +0200 (CEST)
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by DB9PR08MB8508.eurprd08.prod.outlook.com (2603:10a6:10:3d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 13:36:33 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::22) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 13:36:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22 via
 Frontend Transport; Thu, 11 Apr 2024 13:36:32 +0000
Received: ("Tessian outbound 601c9811abf4:v300");
 Thu, 11 Apr 2024 13:36:32 +0000
Received: from 91db5bf9a34a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3DD33E0-5090-4D2D-A7A3-4F4B6279B0A7.1; 
 Thu, 11 Apr 2024 13:36:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91db5bf9a34a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Apr 2024 13:36:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB8125.eurprd08.prod.outlook.com (2603:10a6:10:384::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 13:36:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 13:36:17 +0000
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
X-Inumbo-ID: 85b6abe2-f808-11ee-b908-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cZo7tn1gnGDkSCtWrLiL/ZRKSaWG6taFBcYHnlYK5GlRBYXtPDG9erWNz++Sk2HqLoXhlzI7R39R6GQEDDfA5UlEtYp2TXQsD++fomruYzcOtAjNrPf+WVMpwkQ1d5FCAAsQioM7MUG3dkdsUCcSG6/Ly9aluHhKp7xYPsuymUKkoUmJ6VJpTGisqTgIwo4tJC0Y5RnM4aoqXBcIivIw3ciIClAmt38Os0mRknm6DRvMA5JxQVfHz9xyn7i1TJYyL3cnQv0y43DCbyd8FKAheuebRU1+fkJ2uuW9rGJtdLpxtZwv4wO59ROKUc8v/dLl424mYtNiwozOuCpqvH4INw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb7QXCCmn67zncSAysXNO9F+injbQ4l3htdtoi5lf50=;
 b=RFDrb+NglJmwnyAPizPmNZU4bBbFs66b2SDj9Ezi5uzImlzs4k9fHmJ8M5l1rwI8vns/Pa1GO+Qa8oVBRv98Uwc6AC1PQKuFD85XAiLPaBtpmvc8kymOuQ2TfpTuRWWxMaW8Kac/he5ccqXFWhTqhDn/eE7YsfDsBOF1lMtvePxMelNptw48Nk3Y1gLvNuLmQqF1CBlOlxBmUyJnDCIztReWnCh65vzUxhI64Rhr1om+4RX2QoOJz0BsCNxC1o83AA83XEDm/sf0a8IQilwRrEUW0zIF1rQDT/KLzvB4wwliwtoXUbAgxRxI4bm4WLhQ9AMM+r8pTD71wRTHKeMDgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb7QXCCmn67zncSAysXNO9F+injbQ4l3htdtoi5lf50=;
 b=7kxrKko1zMUwpz95BZoBuIfg8HDe7TYEpXVIxsHPHrGPgbahIGrYzSL2g8vlYnlPDaeNFv4cB5pPXIUds1m9LqHuBp5aBvjk0G/IK6ak9dyrIsrRYBTcOXcZv0aZ2ZvjUo3/3v81BQOLg1pjwulKIB20iQFA5XZyA2XNNF1K2FE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5151743a993311ec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN/E3y5DzElZlGxuz/60Ii01mVwd/kaYy4AOpzTRG54Jyoa3nm+Jo9A/TgSVqqDmQijzSjhseyIhluO3owAJRcCzklJzJA1kuwuxK9Gvldw5tpnkwSwhBOPlMABbWenke1rPd/5GNwzxwZiIxsz0m4JyBaElPqeY4StBIOav28e3yTUJzl3DMAn40M8FJPVnvz/zJYUvTQfNsjHxHz3ee05G+gABpX+3aC2kvOw0r0g76BGhIb1w2A5RJ7SV+VNy2URtAkNeeARWOlyfd85Tt6apzvMKkJXeSSFwvtFf+BAJELCLgg9fXeUZ8yduo3zOw0X/uPYOenTK3t/Jf8nRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb7QXCCmn67zncSAysXNO9F+injbQ4l3htdtoi5lf50=;
 b=BDHU5BheOQ1U4oUSD3C5qmUc3TJI6xPY8v3cj2an+r743klkdd0RKdh2/ESwt7x4Lg0iODhI7HUsL2kYsKsPXO0iSR9HuLhS8wgN550oY8F2JEqWrDY9Zr/1zPUhWoxv0A2y/VHPoQUGYr2X/FdGHyWuzZOxIvERCgCVw81r8bk7FZxG9VRpOUz6vyvtn534Ex9kZETVipjppD+z+KvQfhmOUV9RFFaMWAakWNTevYxioJnBf+nUGwUp705TliRsrZBrFt5qZj5voc3AcETQ6hnMlmRK9+4o5OPXfejZcvLxB7kU+qRwvQvrbqolWRVJjsGpCF7IxUZR76jdC648gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb7QXCCmn67zncSAysXNO9F+injbQ4l3htdtoi5lf50=;
 b=7kxrKko1zMUwpz95BZoBuIfg8HDe7TYEpXVIxsHPHrGPgbahIGrYzSL2g8vlYnlPDaeNFv4cB5pPXIUds1m9LqHuBp5aBvjk0G/IK6ak9dyrIsrRYBTcOXcZv0aZ2ZvjUo3/3v81BQOLg1pjwulKIB20iQFA5XZyA2XNNF1K2FE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 12/13] xen/device_tree: Introduce function to merge
 overlapping intervals
Thread-Topic: [PATCH v2 12/13] xen/device_tree: Introduce function to merge
 overlapping intervals
Thread-Index: AQHainObwzEJT+Mf6kG9My8yFKsem7Fi1oaAgAA++wA=
Date: Thu, 11 Apr 2024 13:36:17 +0000
Message-ID: <983C3633-08B7-4F5F-AEC4-45E01F9C1388@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-13-luca.fancellu@arm.com>
 <C42AED6D-CD32-4829-82B1-F4213E1FD294@arm.com>
In-Reply-To: <C42AED6D-CD32-4829-82B1-F4213E1FD294@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB8125:EE_|DU6PEPF00009526:EE_|DB9PR08MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9d27f5-a64a-48c9-5b2b-08dc5a2c66bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nRykOK2sgC9FSOqpoT4Dm3m5ktMwm7qKKbBkTSKkvRg6lC27uLVuuvZocX6oB/xCW2JrK/ztPCOeXndDFpVYkyIvjfVMWYNBvklaDU8X4ePV0jdLzcmGGxOXSdzNQuxJSGyaCuGwCdskOlhDM/9mspeGd1cHt5IMZbRzKBX33wMrN4UR1nJ0/s6jMoJ0RU+h34c28fJ1TXlNAdLHCJpe9UzxTH5jNOYh0C+dDlMppKnt4AUsFWIPQGRws31HGgDKDxgl6XGxYwRtcPgNSFG+50UHYdGU0sW5Al0WyzsDDbAxfO5w/LVHfRgAp78HdBKNx9tBTCCXcfBy93nIjq5/65EREG+tY+3JkBoFGOqe5qVQgFTaG6x44SL/az5aATKmVdT0UKvx6eX87Krtln7XwNnugoAYfr/FEPefG7Cvf1duCtzetOBYkprUYh90PrHVlPFaO+9KZxMkbsTAAqYXkL4RSAGGHzW+jB/myOYWg1jmQpWHbI+L1luUjMuDmXl0wHvfNN0WQdCO9CulYUSpsnrHlwlHHe3WXrwPJYQmzrRGpn8dlLf2ei0B3iul28UEbgeJXFS7Y5fc3sF4rMV3CX27+mxISCdw9FYOkm+Z00UNi53s9pEAJpKkLGGgPdesY9JiTgRIWsWNJD+ZiWpQQQTUxN9P+SMw2trfrzQCcWPjA/x0mzgxCQ8WngEDNPPvCnU6NqTxYUpYT2h6mH5vQA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <512FBB64CE5FB94A9DBE4AFAB4F0FE17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8125
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	262da2c6-7835-41b2-527d-08dc5a2c5d6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bmoV9AdJ3fJSbG0OWpuwEu3hodnAJETnPaK78ryTXsiwuQ8Yuy9I8ghLF64kYX3F+dDcRH5K3bU2nDX0ohAUHnoQdDaK35LbBWCEg+mg/zocedF2LM+RMfZYMVhdgpQCVPJp8O5D2VIMku6/SahbcgE14aT4/BoW5D4PjUZcke+VwveUszvqtXOQZHrU6HQO2EGFb3t0pnvvES9D2kZYG7apAJPjdQ1CXjx4/fXteGIKmZtVhnG41LVL+dgrQQ8wTWGK1ZIcuj/vgwxttWQHnlBLqnlvgKUh3mxttQLmwRLVLPJ1iR94OsaD42qF/HSg8cUXmh9NfJ9f/yunw5bj7BH5H+tneI6JU78jaFYRnV9D5ur0eFEsd31+ZijJMfITzL8Ox9nWz3zd7aF+GyURe6gVukayuSfWAhl5OYYY1tL2xgW9TDDmjQae84f/HavIKH9YjngkOa2487tg6cXiGOO0QqizpLl9w/hUicyceq2SYUpZ4n+6mxiMdgTwzkb9zHFvWMDpbWQvOyFbtZVCYJqHNBjNivcxC97rHUfTYieICuG0k2ul1ULcLG4BhSkOeIuSyQPE28a872pbWTmA7Rce5if68eE94pYW/GVEHsmD/0UzPDQgveWFK2mv3EYm0YGjRt7UzRt4fCOaAVNwuryq3C4Yzal4gufsXLSrIlLnjcmK2Q3lDvmE/YZ/GQiUx6cKpXZL+oNQwoGVxIOGlwZQSe44o9IXfbDJPN66XXytPuU3cY7J1V/t04y9g3IW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 13:36:32.8489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9d27f5-a64a-48c9-5b2b-08dc5a2c66bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8508

PiANCj4gSeKAmXZlIGp1c3Qgc3BvdHRlZCBhbiBpc3N1ZSB3aXRoIHRoZSBhbGdvcml0aG0sIHRo
ZSBmaXggaXMgdGhpcyBvbmU6DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2Vf
dHJlZS5jIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jDQo+IGluZGV4IDI0OTE0YTgwZDAzYi4u
MjYyMzg1YTA0MWE4IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2RldmljZV90cmVlLmMNCj4g
KysrIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jDQo+IEBAIC0yMzYwLDYgKzIzNjAsMTAgQEAg
aW50IF9faW5pdCBkdF9tZXJnZV9vdmVybGFwcGluZ19hZGRyX3NpemVfaW50ZXJ2YWxzKF9fYmUz
MiAqcmVnLCBpbnQgKm5yX2NlbGxzLA0KPiAgICAgICAgICAgICBfX2JlMzIgKnRtcF9sYXN0X2Nl
bGxfc2l6ZSA9IGxhc3RfY2VsbCArIGFkZHJjZWxsczsNCj4gDQo+ICAgICAgICAgICAgIGR0X3Nl
dF9jZWxsKCZ0bXBfbGFzdF9jZWxsX3NpemUsIHNpemVjZWxscywgbmV3X3NpemUpOw0KPiArDQo+
ICsgICAgICAgICAgICAvKiBMYXN0IGludGVydmFsIHVwZGF0ZWQsIHNvIHRoZSBlbmQgaXMgY2hh
bmdlZCAqLw0KPiArICAgICAgICAgICAgZW5kX2xhc3QgPSBzdGFydF9sYXN0ICsgc2l6ZV9sYXN0
Ow0KPiArDQo+ICAgICAgICAgICAgIC8qDQo+ICAgICAgICAgICAgICAqIFRoaXMgY3VycmVudCBp
bnRlcnZhbCBpcyBtZXJnZWQgd2l0aCB0aGUgbGFzdCBvbmUsIHNvIHJlbW92ZSB0aGlzDQo+ICAg
ICAgICAgICAgICAqIGludGVydmFsIGFuZCBzaGlmdCBsZWZ0IGFsbCB0aGUgcmVtYWluaW5nIGVs
ZW1lbnRzDQo+IA0KDQpBcG9sb2dpZXMsIHRoaXMgaXMgdGhlIGZpeDoNCg0KZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYyBiL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0KaW5k
ZXggMjQ5MTRhODBkMDNiLi45YTJmNWIyN2FhOWIgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL2Rl
dmljZV90cmVlLmMNCisrKyBiL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0KQEAgLTIzNjAsNiAr
MjM2MCwxMCBAQCBpbnQgX19pbml0IGR0X21lcmdlX292ZXJsYXBwaW5nX2FkZHJfc2l6ZV9pbnRl
cnZhbHMoX19iZTMyICpyZWcsIGludCAqbnJfY2VsbHMsDQogICAgICAgICAgICAgX19iZTMyICp0
bXBfbGFzdF9jZWxsX3NpemUgPSBsYXN0X2NlbGwgKyBhZGRyY2VsbHM7DQogDQogICAgICAgICAg
ICAgZHRfc2V0X2NlbGwoJnRtcF9sYXN0X2NlbGxfc2l6ZSwgc2l6ZWNlbGxzLCBuZXdfc2l6ZSk7
DQorDQorICAgICAgICAgICAgLyogTGFzdCBpbnRlcnZhbCB1cGRhdGVkLCBzbyB0aGUgZW5kIGlz
IGNoYW5nZWQgKi8NCisgICAgICAgICAgICBlbmRfbGFzdCA9IHN0YXJ0X2xhc3QgKyBuZXdfc2l6
ZTsNCisNCiAgICAgICAgICAgICAvKg0KICAgICAgICAgICAgICAqIFRoaXMgY3VycmVudCBpbnRl
cnZhbCBpcyBtZXJnZWQgd2l0aCB0aGUgbGFzdCBvbmUsIHNvIHJlbW92ZSB0aGlzDQogICAgICAg
ICAgICAgICogaW50ZXJ2YWwgYW5kIHNoaWZ0IGxlZnQgYWxsIHRoZSByZW1haW5pbmcgZWxlbWVu
dHMNCg0KU28gaW5zdGVhZCBvZiDigJxzaXplX2xhc3TigJ0gLT4g4oCcbmV3X3NpemXigJ0uDQoN
ClNvcnJ5IGZvciB0aGUgbm9pc2UuDQoNCkNoZWVycywNCkx1Y2ENCg0K

