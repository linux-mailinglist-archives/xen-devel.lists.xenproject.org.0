Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id axq3Fgd752nC9QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:26:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA843B50C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288969.1569201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFB77-0007kb-As; Tue, 21 Apr 2026 13:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288969.1569201; Tue, 21 Apr 2026 13:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFB77-0007j9-7u; Tue, 21 Apr 2026 13:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1288969;
 Tue, 21 Apr 2026 13:26:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wFB75-0007j3-F5
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:26:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFB74-00ElK0-Ih
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:26:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e77ae4-e002-0a2a0a5209dd-0a2a4503c1c2-14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:26:01 +0200
Received: from [52.101.70.69]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e77ae9-672d-0a2a45030019-34654645c859-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:26:01 +0200
Received: from AM6PR0202CA0072.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::49) by PA6PR08MB11262.eurprd08.prod.outlook.com
 (2603:10a6:102:513::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 13:25:57 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:3a:cafe::c8) by AM6PR0202CA0072.outlook.office365.com
 (2603:10a6:20b:3a::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 13:25:57 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Tue, 21 Apr 2026 13:25:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA4PR08MB6063.eurprd08.prod.outlook.com (2603:10a6:102:ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 13:24:53 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Tue, 21 Apr 2026
 13:24:52 +0000
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
 b=f+y16iM0ACWtrCyXZzPCMKEyCRil39/bSx/xZ9mpsLLqtnewfTggq2YIfIbaxzAnOVMTiTvOPzUyIPNe81X5rGfn01LneNKiJtxbJQC8z66gtU8A0e2OaxSdATjQxmPk2a5RiwO6np3MRHrTG169DNEe9HGIQZalG/ZnMLe9ZDdaRt43SM/FYm7rJ9WK/xlCj6XDtGYUzjK2k+E+Rjb9Ldp53CY8nxuolXA0YsWr7OzUuxJamrK+ZjqTEVsYZxRWp/QBUaMPOOs+NdT1zewPt5Pbi7clWlVXpGQfiYyJY+ym7Yt7F12p4lx+XI9OZPg7KLnh+WG6ToSDjEvNcNKbzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpGVs+CZAb05IuNP22MMkQS8t0793vH3LX8eKdVjC9g=;
 b=s0sIBJBH8esbafd+IbijHmMcPxdY8ZVbOm48O8Lk6f5lCcOAY8c3GpkVKD5TDY6Y+Kll8LhQM0qIqKr5th/ipLf0g0VIg66hTGCDcv3rxJZumwRX8PiN6q/OtkA21qyoJEJ2X6sSLgTUpoAcXE9R/HCx3xpfbT0y0kfCpSrDN30c6fwdVzNSiKm5CuWvCUNwhJ3EHP7MyOnHEXeBkLfflTiIyY0aWYvBqCB9tAwF/6x2k7LQ95ccgtGVJHt9U8wWY+O6KzOK5vSrRszkUmVynF2XBl6SFE7vnlMwROvLWXEh9LRyuE4LGzgB2xxz+3aFDMtTYQk38sKVj2hvRLaB2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpGVs+CZAb05IuNP22MMkQS8t0793vH3LX8eKdVjC9g=;
 b=FNcM3LOPVt2G3S6YaJxhw7SKDrPVpfgHkgT9t7oFBfXGUFXcFqiJUV1091Ym9NWVE4cu0uSHtRpL4UAm3gkwwTwkt9rBRJzW3gEBBCaLSdW3l3G9HY+0Ose/Gu1LRozcqNrtgROJo/YGOnoLS1HD4l+Sk0Rrc7koka+k451gWGk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0iwkWHIY6U9i2r8j118hbKqPzY5S+GifMcR8TgiGv/VpnhkeWDCG3a/POxbxuGl2wJFhi0WSkGlYnkODlcuYizPHfbYCT9cYapCBuaN0EiVmxpBTAodN3e7Sl0PKE2V5EqhMiTta5A0wU/v6m759QmFgjlP0OaiyY6rYoqn3iKI5sTjkFG+IZVDFphGkxE3/P2fBkAB88dDOEprEMOSm91Jk0DRWEGY0JXCol6tBQWRmezQeh41UxLHZ9mB2X30ahUaJK1X5ZodmmyRtOTOeG5wcHc1Mvl1UblgKV23E/HdI3A++/tjsYnVM+FSg0PY/COlzt01VjkjL8QGtDa85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpGVs+CZAb05IuNP22MMkQS8t0793vH3LX8eKdVjC9g=;
 b=XKwz5rvHXuhvji5WRIZNo/1OW6R37+oc7zoiaO696WOvho3gTNMYdUDbJUiDwJVoY+DCEMCmO6zpn7i5b8tzy8BYYNNfs9lXRyF80jXAbmZC7excswRVRdivb1gXrUTPAwLAY8IDf0BeXXVSEhqWpUIMtHlcq1P4DPEv6iGpVODZgMFWnvVuTj+hO93sHrjXfs2zHW/SLZ7XGT4E0QTSdI4AZZhnSS4TWGquTlP/fRtVPUqzs8nobGU0aIZV539RYoSuClCUAMi9CD5W8L6ykz5Eo5FHxM0eBR/s03NvKuL3rIHmt7VMN6Kb+74TGjZYCu958xjcu8GebVghW2lQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpGVs+CZAb05IuNP22MMkQS8t0793vH3LX8eKdVjC9g=;
 b=FNcM3LOPVt2G3S6YaJxhw7SKDrPVpfgHkgT9t7oFBfXGUFXcFqiJUV1091Ym9NWVE4cu0uSHtRpL4UAm3gkwwTwkt9rBRJzW3gEBBCaLSdW3l3G9HY+0Ose/Gu1LRozcqNrtgROJo/YGOnoLS1HD4l+Sk0Rrc7koka+k451gWGk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHc0ZI74iA20ItBV0OKtUp08vt6Qg==
Date: Tue, 21 Apr 2026 13:24:51 +0000
Message-ID: <EB3F884F-FCD6-4AE7-84FA-79ABF31EA88E@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <5e1951e1c17037e020de9c0eecb5fba94edcd9dd.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <5e1951e1c17037e020de9c0eecb5fba94edcd9dd.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA4PR08MB6063:EE_|AMS1EPF00000049:EE_|PA6PR08MB11262:EE_
X-MS-Office365-Filtering-Correlation-Id: 723b41c2-c55b-4944-12f7-08de9fa98586
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 ZGfHfguCmyULddfm8Y+wL+3T2jC6VMJustPSYMezCPkDDBfuSgxLefjBXy8Yjbqbv2PfxSk835/D+RD1uzXysdfYuRqovUSLBVWAbdQ2GRFvKzqbpZG5khurC+I/FrIHBDo0JUuvceIiDnG0N/6qxcru0/wZ0CoSVVZoeQjDLCicsIsWbJUB/ITWkkTyui4e2OHpbMjrFhmIHqZirlY8CgeMds1Fc1bl933Yffns28tb4G2InvbYvoKX8POmgZ8fip33xgFRn1l3cBq2Jzj85C8xa64rfHTMS1TKV58tBDMjoFjkK+5a6QTtRdirH9L4GZI0XuFggmbliWvH+jr/f7bAUGhUPTBTrRKcv/wjfz6hngk7S6kdppXW4SHGb390f3ADd5KptwGk9I0yyey7jqXQPiM6iM+Jec3K7hcRGpiJrntanOPebFZSO8inoQTBiLlat107uqm/qRAnkjNVEil/gu4/XM13JyQEv/X7C7lzVboJZi6GqoWg47ry4M6F2BlLlQ7bFH5KAIHPtIfcoe7d4nROMRQNfuirbVZp3Cb5ApKb+waF0B0XL3A41GI5uJbR64Yi6hY+1RX2dqapEeTvQt3Zy+/05VTT4iHRii8bYr1DJ+52umjrEi3gp1Lb8hT1ju04NuXVW0h+1LFqndQBvMkHkalNxndhd+b6jrMPgICsJkLs+9eCBua9fd0PlUHXFdkBddf7968GkX57FDOff6FgUpNq586wjo4SW38xKhBcGZ0HBAHIZteceHaQxY33AcAWCWKegRGR1OcNOij9FdQ7WOY9ANvuGX9m1SQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A6C4C87A06B4C4AA07F70BCAE311DA5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 YkHvva8MGuks601OSjWKwOymXPn5OFwL6J2q4WXNBRdiT4c9TV4xtglC9UVvriOKyOhQGXQemn3QA68g8dj4V1QPbOu2HzSCoc/S1Z/eoWJuwjR6RzbPeS2CCAB0SIWDEzBC9mM1IeAYk648XVG6iKAFNHxWi2LF65kwx0UyQNcq0qgh1PvpoidVggRFnrrlyst3p0D93YMEKIy3MZVFATY8qLfyjnGe6Z5VBWAXK5NKokFed6wyhfbAShqevG6TPIfhSKfh/EKoHha6NZgR2l05FWvkqTUgsX4SPBpw57opXqaB+8/0Vzv9kluwMtt5gaZhgLMYtfyVRnSICQ9azw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6063
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	726819cf-8871-4039-a588-08de9fa95e82
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|14060799003|82310400026|35042699022|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y8FjttOZluJWmzfbb37C0zCk38XhLTVKyXy48fcUx8tcaDYwzx8jGvxSXJN9XZzl0HGcKfRg3w5WYHocAEXl0sqm8jtu6NNI+QZBhzORP73JVoKsCgPugbFagbC5MOW3Pw4qUgjKsCzMxh0zwPt3zAS3cXqmPh8soutHr+bBwtVdJ+j4maiExRGTWhhRb8AdxjztywL1a/G2cmfVA6y2fNyOsyX7UnBWShgU5O1IiBwyw4V9IPDtt8exBeFwDeUNytauSv1fPNF09OVB7wrkJgNVZt+BGX6SmiDkm8lBhtjWQbEfSTsjiMgnIhcX1/DFUIy7Hxgq75NdhLIoVW8zGipwBtCn7/A6o8hbXI+wbqZEhI+D5d5ZWlG3VNEjNNoXZsn3UHhI0zeUJB7BYNigjFCB19rS81acZXRrtjijLwAREwOjTFmzCckpDhXwru3/auVmGkWN039pDzQUYA6nvApQMR0+tzxu4bjZ519lU4z4H9v+wxKuuvGNVTzsjYMbhXFrIAu76+Qpsln5ayw85zn6HOBdN70ooU+gUZpOLTpIM2Gl/R8dGnFajbKlElDRUbAA5mSfWwVSCqElb6x7DotPWvpI+ZLN2mRum2MVF5HaibkAefXaOAxBS72aqbb0JxnuMdWYv4kF35Iqxc0niYLshCzrKC2w16SbGlXuIwjH4eCdFohIovhb2u3oF2Xv35i7T3bSrqKV9qEeAsHRmFR7p3Cg4jXwjUgXDeTZq+NskayJGQfKaxSjJea0bsOy5EC5wBhMoNOQ+ZVBTsKWRQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jrZpoOdsrIjkjWlEHU7UoXQF9ZWmGXj8RMzPEdPREAxFMq4VcF3z970Ojb/wrcbZauqFvSKpkD7Em4d49MEdZAd7kriHYL+Zk8qwRGgRKQ981GJKfG3cPT3fo8l/eS8eSYZpURXFuojVxgStAg8bFTyTOD9+TjqtZPyb9DSI9ibOrkdoq85MkvJBnGWqFnUTJ4sf4RRDKroh31ccaryVebBdqFbhExqEwWOqYgnEBurBZT3q4zLUuY8jgz1t365wtoN6cWBspp3YuHwJDEQiURvnlXZSOOQE0NcJN64Emc/qYVG616pOS4ybmu5YOyOCBURcQAP/omfVhNSZpmADTN3VlN+nPxbYL584FlamvyTRGPY1Y6+J7t0HDtIwKRkuCltbE5Nc1F99KIaHXk526kuEWyvM7bsghwi3O5ri3Nv5t+/buYMemjlENZW/r0MF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 13:25:57.0642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 723b41c2-c55b-4944-12f7-08de9fa98586
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB11262
X-purgate-ID: tlsNG-33051d/1776777961-2A179938-0A1E4A87/0/0
X-purgate-type: clean
X-purgate-size: 6602
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
	NEURAL_HAM(-0.00)[-0.653];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,arm.com:url]
X-Rspamd-Queue-Id: 9BFA843B50C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlrb2xhLA0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Mi5jIGIv
eGVuL2FyY2gvYXJtL2dpYy12Mi5jDQo+IGluZGV4IGIyM2U3MmEzZDAuLmRiZmY0NzA5NjIgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMtdjIuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0v
Z2ljLXYyLmMNCj4gQEAgLTEwOTgsNiArMTA5OCwxMjkgQEAgc3RhdGljIGludCBnaWN2Ml9pb21l
bV9kZW55X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgcmV0dXJuIGlvbWVtX2Rlbnlf
YWNjZXNzKGQsIG1mbiwgbWZuICsgbnIpOw0KPiB9DQo+IA0KPiArI2lmZGVmIENPTkZJR19TWVNU
RU1fU1VTUEVORA0KPiArDQo+ICsvKiBUaGlzIHN0cnVjdCByZXByZXNlbnRzIGJsb2NrIG9mIDMy
IElSUXMgKi8NCj4gK3N0cnVjdCBpcnFfYmxvY2sgew0KPiArICAgIHVpbnQzMl90IGljZmdyWzJd
OyAvKiAyIHJlZ2lzdGVycyBvZiAxNiBJUlFzIGVhY2ggKi8NCj4gKyAgICB1aW50MzJfdCBpcHJp
b3JpdHlyWzhdOw0KPiArICAgIHVpbnQzMl90IGlzZW5hYmxlcjsNCj4gKyAgICB1aW50MzJfdCBp
c2FjdGl2ZXI7DQo+ICsgICAgdWludDMyX3QgaXRhcmdldHNyWzhdOw0KPiArfTsNCj4gKw0KPiAr
LyogR0lDdjIgcmVnaXN0ZXJzIHRvIGJlIHNhdmVkL3Jlc3RvcmVkIG9uIHN5c3RlbSBzdXNwZW5k
L3Jlc3VtZSAqLw0KPiArc3RydWN0IGdpY3YyX2NvbnRleHQgew0KPiArICAgIC8qIEdJQ0MgY29u
dGV4dCAqLw0KPiArICAgIHN0cnVjdCBjcHVfY3R4IHsNCj4gKyAgICAgICAgdWludDMyX3QgY3Rs
cjsNCj4gKyAgICAgICAgdWludDMyX3QgcG1yOw0KPiArICAgICAgICB1aW50MzJfdCBicHI7DQo+
ICsgICAgfSBjcHU7DQo+ICsNCj4gKyAgICAvKiBHSUNEIGNvbnRleHQgKi8NCj4gKyAgICBzdHJ1
Y3QgZGlzdF9jdHggew0KPiArICAgICAgICB1aW50MzJfdCBjdGxyOw0KPiArICAgICAgICAvKiBJ
bmNsdWRlcyBiYW5rZWQgU0dJL1BQSSBzdGF0ZSBmb3IgdGhlIGJvb3QgQ1BVLiAqLw0KPiArICAg
ICAgICBzdHJ1Y3QgaXJxX2Jsb2NrICppcnFzOw0KPiArICAgIH0gZGlzdDsNCj4gK307DQo+ICsN
Cj4gK3N0YXRpYyBzdHJ1Y3QgZ2ljdjJfY29udGV4dCBnaWNfY3R4Ow0KPiArDQo+ICtzdGF0aWMg
aW50IGdpY3YyX3N1c3BlbmQodm9pZCkNCj4gK3sNCj4gKyAgICB1bnNpZ25lZCBpbnQgaSwgYmxv
Y2tzID0gRElWX1JPVU5EX1VQKGdpY3YyX2luZm8ubnJfbGluZXMsIDMyKTsNCj4gKw0KPiArICAg
IC8qIFNhdmUgR0lDQ19DVExSIGNvbmZpZ3VyYXRpb24uICovDQo+ICsgICAgZ2ljX2N0eC5jcHUu
Y3RsciA9IHJlYWRsX2dpY2MoR0lDQ19DVExSKTsNCj4gKw0KPiArICAgIC8qIFF1aWVzY2UgdGhl
IEdJQyBDUFUgaW50ZXJmYWNlIGJlZm9yZSBzdXNwZW5kLiAqLw0KPiArICAgIGdpY3YyX2NwdV9k
aXNhYmxlKCk7DQo+ICsNCj4gKyAgICAvKiBTYXZlIEdJQ0QgY29uZmlndXJhdGlvbiAqLw0KPiAr
ICAgIGdpY19jdHguZGlzdC5jdGxyID0gcmVhZGxfZ2ljZChHSUNEX0NUTFIpOw0KPiArICAgIHdy
aXRlbF9naWNkKDAsIEdJQ0RfQ1RMUik7DQo+ICsNCj4gKyAgICBnaWNfY3R4LmNwdS5wbXIgPSBy
ZWFkbF9naWNjKEdJQ0NfUE1SKTsNCj4gKyAgICBnaWNfY3R4LmNwdS5icHIgPSByZWFkbF9naWNj
KEdJQ0NfQlBSKTsNCj4gKw0KPiArICAgIGZvciAoIGkgPSAwOyBpIDwgYmxvY2tzOyBpKysgKQ0K
PiArICAgIHsNCj4gKyAgICAgICAgc3RydWN0IGlycV9ibG9jayAqaXJxcyA9IGdpY19jdHguZGlz
dC5pcnFzICsgaTsNCj4gKyAgICAgICAgc2l6ZV90IGosIG9mZiA9IGkgKiBzaXplb2YoaXJxcy0+
aXNlbmFibGVyKTsNCj4gKw0KPiArICAgICAgICBpcnFzLT5pc2VuYWJsZXIgPSByZWFkbF9naWNk
KEdJQ0RfSVNFTkFCTEVSICsgb2ZmKTsNCj4gKyAgICAgICAgaXJxcy0+aXNhY3RpdmVyID0gcmVh
ZGxfZ2ljZChHSUNEX0lTQUNUSVZFUiArIG9mZik7DQo+ICsNCj4gKyAgICAgICAgb2ZmID0gaSAq
IHNpemVvZihpcnFzLT5pcHJpb3JpdHlyKTsNCj4gKyAgICAgICAgZm9yICggaiA9IDA7IGogPCBB
UlJBWV9TSVpFKGlycXMtPmlwcmlvcml0eXIpOyBqKysgKQ0KPiArICAgICAgICB7DQo+ICsgICAg
ICAgICAgICBpcnFzLT5pcHJpb3JpdHlyW2pdID0gcmVhZGxfZ2ljZChHSUNEX0lQUklPUklUWVIg
KyBvZmYgKyBqICogNCk7DQo+ICsgICAgICAgICAgICBpcnFzLT5pdGFyZ2V0c3Jbal0gPSByZWFk
bF9naWNkKEdJQ0RfSVRBUkdFVFNSICsgb2ZmICsgaiAqIDQpOw0KDQpyZWdhcmRpbmcgR0lDRF9J
VEFSR0VUU1IgLi4uDQoNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgIG9mZiA9IGkgKiBz
aXplb2YoaXJxcy0+aWNmZ3IpOw0KPiArICAgICAgICBmb3IgKCBqID0gMDsgaiA8IEFSUkFZX1NJ
WkUoaXJxcy0+aWNmZ3IpOyBqKysgKQ0KPiArICAgICAgICAgICAgaXJxcy0+aWNmZ3Jbal0gPSBy
ZWFkbF9naWNkKEdJQ0RfSUNGR1IgKyBvZmYgKyBqICogNCk7DQo+ICsgICAgfQ0KPiArDQo+ICsg
ICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGdpY3YyX3Jlc3VtZSh2b2lk
KQ0KPiArew0KPiArICAgIHVuc2lnbmVkIGludCBpLCBibG9ja3MgPSBESVZfUk9VTkRfVVAoZ2lj
djJfaW5mby5ucl9saW5lcywgMzIpOw0KPiArDQo+ICsgICAgZ2ljdjJfY3B1X2Rpc2FibGUoKTsN
Cj4gKyAgICAvKiBEaXNhYmxlIGRpc3RyaWJ1dG9yICovDQo+ICsgICAgd3JpdGVsX2dpY2QoMCwg
R0lDRF9DVExSKTsNCj4gKw0KPiArICAgIGZvciAoIGkgPSAwOyBpIDwgYmxvY2tzOyBpKysgKQ0K
PiArICAgIHsNCj4gKyAgICAgICAgc3RydWN0IGlycV9ibG9jayAqaXJxcyA9IGdpY19jdHguZGlz
dC5pcnFzICsgaTsNCj4gKyAgICAgICAgc2l6ZV90IGosIG9mZiA9IGkgKiBzaXplb2YoaXJxcy0+
aXNlbmFibGVyKTsNCj4gKw0KPiArICAgICAgICB3cml0ZWxfZ2ljZChHRU5NQVNLKDMxLCAwKSwg
R0lDRF9JQ0VOQUJMRVIgKyBvZmYpOw0KPiArICAgICAgICB3cml0ZWxfZ2ljZChpcnFzLT5pc2Vu
YWJsZXIsIEdJQ0RfSVNFTkFCTEVSICsgb2ZmKTsNCj4gKw0KPiArICAgICAgICB3cml0ZWxfZ2lj
ZChHRU5NQVNLKDMxLCAwKSwgR0lDRF9JQ0FDVElWRVIgKyBvZmYpOw0KPiArICAgICAgICB3cml0
ZWxfZ2ljZChpcnFzLT5pc2FjdGl2ZXIsIEdJQ0RfSVNBQ1RJVkVSICsgb2ZmKTsNCj4gKw0KPiAr
ICAgICAgICBvZmYgPSBpICogc2l6ZW9mKGlycXMtPmlwcmlvcml0eXIpOw0KPiArICAgICAgICBm
b3IgKCBqID0gMDsgaiA8IEFSUkFZX1NJWkUoaXJxcy0+aXByaW9yaXR5cik7IGorKyApDQo+ICsg
ICAgICAgIHsNCj4gKyAgICAgICAgICAgIHdyaXRlbF9naWNkKGlycXMtPmlwcmlvcml0eXJbal0s
IEdJQ0RfSVBSSU9SSVRZUiArIG9mZiArIGogKiA0KTsNCj4gKyAgICAgICAgICAgIHdyaXRlbF9n
aWNkKGlycXMtPml0YXJnZXRzcltqXSwgR0lDRF9JVEFSR0VUU1IgKyBvZmYgKyBqICogNCk7DQoN
CuKApiBwbGVhc2UgbGV0IG1lIGtub3cgaWYgSSByZWFkIGNvcnJlY3RseSB0aGlzIGxvb3AsIGJ1
dCBoZXJlIEdJQ0RfSVRBUkdFVFNSMCDigKYgNw0KYXJlIHJlc3RvcmVkIHdoZW4gaT0wLCBidXQg
dGhlIHNwZWNpZmljYWl0b25zIHNheXMgdGhhdCB0aGlzIGJsb2NrIGlzIHJlYWQgb25seSBvbg0K
bXVsdGlwcm9jZXNzb3IsIHNvIHdlIHNob3VsZCBza2lwIHRoZSByZXN0b3JlIHBhcnQuDQpBbHNv
IHNhdmluZyBpdCBjb3VsZCBiZSBza2lwcGVkIGJlY2F1c2UgZWFjaCBmaWVsZCByZXR1cm5zIGEg
dmFsdWUgdGhhdCBjb3JyZXNwb25kcw0Kb25seSB0byB0aGUgcHJvY2Vzc29yIHJlYWRpbmcgdGhl
IHJlZ2lzdGVyLg0KDQo0LjMuMTIgVXNlciBjb25zdHJhaW50cyBbMV0NCg0KPiArICAgICAgICB9
DQo+ICsNCj4gKyAgICAgICAgb2ZmID0gaSAqIHNpemVvZihpcnFzLT5pY2Zncik7DQo+ICsgICAg
ICAgIGZvciAoIGogPSAwOyBqIDwgQVJSQVlfU0laRShpcnFzLT5pY2Zncik7IGorKyApDQo+ICsg
ICAgICAgICAgICB3cml0ZWxfZ2ljZChpcnFzLT5pY2ZncltqXSwgR0lDRF9JQ0ZHUiArIG9mZiAr
IGogKiA0KTsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICAvKiBNYWtlIHN1cmUgYWxsIHJlZ2lzdGVy
cyBhcmUgcmVzdG9yZWQgYW5kIGVuYWJsZSBkaXN0cmlidXRvciAqLw0KPiArICAgIHdyaXRlbF9n
aWNkKGdpY19jdHguZGlzdC5jdGxyLCBHSUNEX0NUTFIpOw0KPiArDQo+ICsgICAgLyogUmVzdG9y
ZSBHSUMgQ1BVIGludGVyZmFjZSBjb25maWd1cmF0aW9uICovDQo+ICsgICAgd3JpdGVsX2dpY2Mo
Z2ljX2N0eC5jcHUucG1yLCBHSUNDX1BNUik7DQo+ICsgICAgd3JpdGVsX2dpY2MoZ2ljX2N0eC5j
cHUuYnByLCBHSUNDX0JQUik7DQo+ICsNCj4gKyAgICAvKiBFbmFibGUgR0lDIENQVSBpbnRlcmZh
Y2UgKi8NCj4gKyAgICB3cml0ZWxfZ2ljYyhnaWNfY3R4LmNwdS5jdGxyLCBHSUNDX0NUTFIpOw0K
PiArfQ0KPiArDQoNCkkgYWxzbyBzZWUgdGhhdCB3ZSBkb27igJl0IHNhdmUgcGVuZGluZyBTR0lz
IHN0YXRlIChieSBHSUNEX0NQRU5EU0dJUm4vR0lDRF9TUEVORFNHSVJuKSBvciBBY3RpdmUgUHJp
b3JpdGllcyByZWdpc3RlcnMNCnN0YXRlIChHSUNDX0FQUm4vR0lDQ19OU0FQUm4gW2xhdHRlciBp
ZiBzZWN1cml0eSBleHRlbnNpb24gYXJlIHRoZXJlXSkgYXMgd3JpdHRlbiBpbiBbMV0g4oCcNC41
IFByZXNlcnZpbmcgYW5kIHJlc3RvcmluZyBHSUMgc3RhdGXigJ0sDQp3YXMgaXQgaW50ZW50aW9u
YWw/DQoNClsxXSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vaWhpMDA0
OC9iYi8/bGFuZz1lbg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

