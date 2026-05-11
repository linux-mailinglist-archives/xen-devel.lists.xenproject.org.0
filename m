Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE0wOki9AWozjQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:28:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3350CB75
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306082.1578175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOnS-0004oR-6C; Mon, 11 May 2026 11:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306082.1578175; Mon, 11 May 2026 11:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOnS-0004lv-1x; Mon, 11 May 2026 11:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1306082;
 Mon, 11 May 2026 11:27:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMOnQ-0004kV-Hk
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:27:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMOnN-004Rhn-Us
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:27:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01bd1f-e002-0a2a0a5209dd-0a2a4505a742-30
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:27:35 +0200
Received: from [52.101.84.44]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01bd26-aaa8-0a2a45050019-3465542ce874-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:27:35 +0200
Received: from DB9PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::14) by PA6PR08MB11287.eurprd08.prod.outlook.com
 (2603:10a6:102:514::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 11:27:32 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::43) by DB9PR01CA0009.outlook.office365.com
 (2603:10a6:10:1d8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 11:27:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 11:27:32 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by FRRPR08MB11968.eurprd08.prod.outlook.com (2603:10a6:d10:1ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 11:26:30 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 11:26:29 +0000
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
 b=wKU/rZDbz3cktZ3dsQfGpCG3q4YfhxNv69pJP7ttiM3OuCH8ZzKAxoyMDX23mQaZIxcWGb8sHGEvRGtUfd4mhw5LTzzlGAsBGyUeDB+z1l6CRG3ioL/BwYJNBq8/KRa0jra/kEvCS+vD6v5Ze6BXLIDEoGky80lMMqFMPE9WBMYAj5Amn2j3CmLgNHy6slGt/teowU70lxG//eYtsJ/vGhWHdyIxNOlArGrU1C2XfKhCS4HfpU7G4KriMjqRF1og2vO+oilD4uL7wi3iwTEy4hXzI8QigKeN/N2TPU5O5r73acPwEmycbTlyTFio9A3N/j9KOe2blwEKoOuyRa1rLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdlZIU2PP+msux/Ann/M7BCZaM2zeQD8OPawu/rv7VQ=;
 b=IiX2pNn4Xn3q2fDEsnYiMNliKrP4yQqTdEQXp+ziGatHzYo/otMkm+nwkHbF/MChZwiwBoEogGbPd3A1fVZ8STQBSdp8xjxT6Uk+gA/SVi+/iKa9rkVI3TDNFM0i756+/9zPA08xhVmaS6RF2xWHTMAa3bY0rB70HfF9PoUpBeUL2a7slL3Is3lnS34EAeHafUzhAJVtM0OQTSASWs2l82r4l/6C0lah1lvbM1jPRvaco4VCZ14c1T7RfPBDP2JQQLYnypXFspIJ53ha/OIWHzZa/z2eGWWL0aX3mzq+iF0pXFuEKQBc+d5Ut/a+rtf9N9eHMvojMA47rkID0oiQXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdlZIU2PP+msux/Ann/M7BCZaM2zeQD8OPawu/rv7VQ=;
 b=IQg6x0CT7Cc4zN1b3WAX61/WtW4VKXCk4dIMNq4qQVbiBPnXRcsLcZAg2RWUdCCpHv4BXXw3/i4HfLc7XaY5Y8sEwv+S/7l28Bc0dB7QoI4M7rXuLt+9WBqvSCy6Ip101cYmOkPktOI0pKPouOrZRzcIueO8ok6htB5udoeftw0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ic+AEbS6jr5NAkfSfQOyiU04MtuUIBdIjD62YSERT0f9/WV0EcclO1OoF1HynNlP4swP+pHTk7X2fOCU62EtTZZkPCIDtxZbKdceNQ2SqdHYOFH7xvURjJkRnQXD4iDOxLufYZRTdays7eh8XLihiaDgxgj5M/IMGYO9arnKFcRkIX4ocBtfiWOddIXpZrD2IQCRpFz+072hnD6fq76DYOyhlwI73VrrwT/eblvFiEp/JWr3r4nWAwHTFdmrfBgaVV+nBNx5nwsAUs29X+WDtWGoANYLxIPSVuW4lQ3UndiDMsPqPZbLnrGgByWeFHppfw7cFYYl4DY18fj/T2i/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdlZIU2PP+msux/Ann/M7BCZaM2zeQD8OPawu/rv7VQ=;
 b=uK0tJdpYmutHaatBQm70d2qCPfzIqNqTIboZW+Cs7v7STNhFbq1y/6FWTxRZXqxOgLlB0hHGKwYpFUz3sOK2PWkloCgiTBla6EM8uyYVlLoRavXPaTLH5UHKqT1gxUHEH3mPKS300NJS40b1yjKK2+EkmPxST53x/pykuy2PIwXHUDj20i0DoZchvSsmJxSiUEN7ZK9G2orQXgwT4VdvINF0BASP2p+6tHe4ekmeB83bd2sKQc218f6Npvcw0waT3ChFc7KhD7wQKR1H8FPMa/spDWYNKYL5/3zU2u/frURgW4oTbXJ/ceYv0Iz/StxQJyBQHChrhrRj7DXK5kJFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdlZIU2PP+msux/Ann/M7BCZaM2zeQD8OPawu/rv7VQ=;
 b=IQg6x0CT7Cc4zN1b3WAX61/WtW4VKXCk4dIMNq4qQVbiBPnXRcsLcZAg2RWUdCCpHv4BXXw3/i4HfLc7XaY5Y8sEwv+S/7l28Bc0dB7QoI4M7rXuLt+9WBqvSCy6Ip101cYmOkPktOI0pKPouOrZRzcIueO8ok6htB5udoeftw0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Topic: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index:
 AQHc3vfGpFkxMscyakiMWMN4gJbZfLYIoFeAgAAH44CAAAHaAIAAAMeAgAABqICAAAH9AIAAAx8AgAACTIA=
Date: Mon, 11 May 2026 11:26:29 +0000
Message-ID: <36ED2CB3-27A1-4C35-9A21-3558C4F0E527@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
 <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
 <4372B93E-1AC7-4BF5-93A7-D1AD8FCE42FE@arm.com>
 <ce38f845-42ac-491b-98c2-eb2bd90f00c1@amd.com>
 <A3D4B900-2A5B-4398-A914-C1635E34C8C3@arm.com>
 <74ffed08-caae-4d70-959b-12daf5d67cb1@amd.com>
 <4E3CC074-A194-4B55-9B69-12204047D1E4@arm.com>
 <c429d2d8-d655-4c39-a703-f9e29ec37135@amd.com>
In-Reply-To: <c429d2d8-d655-4c39-a703-f9e29ec37135@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|FRRPR08MB11968:EE_|DU2PEPF00028D00:EE_|PA6PR08MB11287:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e72a20-9566-41c0-c0ed-08deaf504ad7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|11063799002|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 3l/8rGsT/t69BESaNHPE2rLQ6t6fjrTdxgVZRv4hs+alCjeqBbuOh8MFsJRgxOJ0IJEsQbzkowi0ASf7f7q+EadH+3xz+fZo2iMn6XuCuVu9i4/1CPxKeXp51K6lgfIH+yUPyVVik2Qhc0On+YJIPybHvo/k5jlqBjqKqrgzfzP2Ag+yUaxiyoHmJDuWLfr9CB0C786ShdL7IT6CO44WZY7PezrFDRmYDWjoxAvpaagwC/0RvK13HU6u4S4pOvnaRplekgjRCZQ0SIpmNwemO+Q3qtFb8nOlNlYyoiA3EzUivbol/FstM6VBp/hmmYobUsH3XuVv3vX/eXzwAfiGSAK52Nge0aRYFQ5PVc5DkACLteb4WFtpfl21gIRuFqCOBVxE+sm4vJjhGNwVuGlxzjyRlKU2LjamldR2qIiX5oy8KtP7mISbPcEw96605CVsM0l7xdM9s0fqELtJ6kypq2eIex4qL8hOE+tuqTFZWodc7edlfCssXLnG6OfD0X8Wek/M73FBsf7sCYYoOVhuIVIhafa33DTVd8xFnzRWB2Y0DaVSZtM+7k8TzRmF3HSo3BxwuwNnZ+liBXOspyydnBd2w6BmtzrRoUywzWJEG77oFKGnwFxx2qZgSPLs1vU9TIDoy1VsTGzNQl7lSXJHlPqDXNYzaae7l5wJGYx1sPjiBGk4zy7RztkRI3YR2lzoc+hFTr+R6be7W6drpXAaUdFRAvPz9DZWNpXJj/9v4635SXNc8u1/0J0sjrL90YGJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(11063799002)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5BDE3F6D8E651E4AB1E9E82A9648B80B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 v50JwnsycwVvzXswB9ofSz7JBUhTXxgr+7ZmnGwKF6eGLeB7mYL6qLOX7TG2AmDy0hLFsRdH2+0yrDsha+g6jZ4iuSwfcIwjOaNqMDi9DzFI7gHh3xapd8QEQrcemAaJydVt5mrSBfxHKPIPZxQaKX7Bqd08MakEc0X6ZC5wzTMIud2qLcfOek/mO9gIffFE6c667xtA0hsI8kX3M6wd//AQXH7K4Gxca2jS/rbkqL0LjZd30YAo//m7Qww4yp93RBbb2YhddRvEL+XK3iLvFL+BcBzLFrI2hk0NjYpI2JVbeZIgHQyAaT8IDgM3bn6g9jvicir2ThaYyOKPutGlvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR08MB11968
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5e93b9a-a0de-49cf-a1b9-08deaf5025bb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|82310400026|35042699022|376014|56012099003|22082099003|18002099003|11063799002;
X-Microsoft-Antispam-Message-Info:
	Uprj5de8wUhvlyZvRAdlve9nI5Vj37Um5giGfLF+0jiFOT3lrPk7+UEtSsXlwc05hqDsGqxXmNwhiKQOPO/jpr0l8gWwq7le9DtQLxeN0OJYF4AY8X4JV9Lkbl8y0hmbfSfWTBdnHeVcbt19rxPZwXPi2T6YHY3q02rsWNkyjQ92Q3EfuPUzZgVCiBqe8B62yX+OrXwsXgHaUO/GcQKE286tO1+ZdV3EwudrwVKXxLA6hg3NmRunlwEhVQkvrsA0QLUUzW6sKifPbRZx34161ahZc1HFn0fs3gWBq8f3sVn2qcK5ryXB5x34MyPGt9UKQC/h0dXGmk2QpQg306L/d1m93QS+Reztiksob3z4XcFL0h6cdQk93dN2suLevCz4O0u3krBS7XH2rLBY1+RU4sWbDUE1VUrWGMJJ89c+l5oPfDAe2y9nTyG8yOWj5itYm+i1CrScIpvuXvS4VLeIB1Tihto/etGpQIsqtb3bUBCTPbG2dVqIOfV8S4zc5fnEOMaqMfsjzoz717feR+7gOZqezJTE5IIUKXY5Wc+f1zblTqMZ6uxKxiQlSWYaUGeXXWqHEzuJCsenJFNtjxqr8MQ4DGhpkPesIwUi2MzSfidLqZ+kCOR3+4txP3GZxvhDzTn9E0rMGjIzSOeKMGjJJlCvkDuZu6B40d4ZlJ6D/397t4ATa0f8yb33CbHmoi9tYXa4w8/LwGzkx1VaJ/3bsi1EXdopyZEJkjcOodTZFVI=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(82310400026)(35042699022)(376014)(56012099003)(22082099003)(18002099003)(11063799002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7O1EG7RYNHqybvGtK1bMgSkQTC1A7qNFB7nye/EvXnm9mh+I9hZrWR8MtAmLPvQAKXl2CSUF3LTbFFyAUTuJi8FuZ5A3pE6qFINEYn6YO1+X1826shRguAcRiN9BZZz5H17H22As7Vv4vOKmYcD0q4HaLSp5+fAZvqp29MXmty573Sf5kRE6VgNxV55QgGo9DOnlxNhp8dDAVZlDkWers8j5OFB8T81cVfb9tFhBPh1wyLauYurdhtC2O4iGH1nGbAWJ2qSJcaNMj5oJv6X4mJsOytSjm9eQYfHJdcHaNktX/s+9xxs04xlhYlikz3Qk4El/gpdIVQnbOE5HsFZcHEEVOwl2vWkl2pwBmI9s6nYtPlzrxHEKM5jT+L/lydmNr7OKFvtYz+9+LZf2bdISMDoQWaKiiA0Clf6DAugNBC18S4vO2H55PfVDwOKZyJ6n
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 11:27:32.0057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e72a20-9566-41c0-c0ed-08deaf504ad7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB11287
X-purgate-ID: tlsNG-c201ff/1778498855-DBF66443-5E3A6A47/37/8731104561-1579941
X-purgate-type: clean
X-purgate-size: 2294
X-Rspamd-Queue-Id: 3DC3350CB75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

>>=20
>>>>=20
>>>>>>>> +
>>>>>>>> +static inline bool v8r_el1_msa_domain_sanitise_config(
>>>>>>>> +    const struct xen_domctl_createdomain *config)
>>>>>>> Why can't this function be common? I can see 3 definitions (Arm64 M=
PU, Arm32
>>>>>>> MPU, MMU) but they do not have anything that would prevent from gen=
eralizing
>>>>>>> them in a single function.
>>>>>>=20
>>>>>> I can do a common one I think, just to be aligned, should the common=
 one behaves as the current implementation?
>>>>>>=20
>>>>>> Arm64/32 MMU: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_=
MSA_NONE allowed
>>>>>> Arm64: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NO=
NE,PMSA,VMSA}  allowed
>>>>>> Arm32: Only v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NO=
NE,PMSA}  allowed
>>>>> What's the reason for allowing NONE for MPU here? None denotes proper=
ty not
>>>>> specified but at this point it should be set to a default.
>>>>=20
>>>> We treat NONE as PMSA on Armv8-R, so either NONE and PMSA are valid an=
d lead to PMSA at EL1
>>> NONE denotes property not set i.e. set a default. IMO at the place wher=
e we set
>>> a default, NONE should be switched to PMSA. This is a cleaner solution =
than
>>> giving two options the same meaning. Sanitization could then verify tha=
t indeed
>>> the default setting took place.
>>=20
>> Ok so this is a bit different from how all other *_NONE are handled curr=
ently (TEE and SCI).
>>=20
>> So on MPU Arm32/64 now we will stop the domain creation if NONE is passe=
d, is that the behaviour
>> you are expecting for DOMCTL v8r_el1_msa? (Ideally we should not get thi=
s because we will switch
>> during DT parse)
> I think the confusion is that you are mixing the meaning of none (i.e. I =
don't
> want it) with not set. In case of TEE and SCI, none means you I don't wan=
t TEE
> or SCI, please disable them. Now, how would this look like for MPU. I don=
't want
> PMSA or VMSA? This does not make any sense because it's something impossi=
ble.

ok makes sense, I will then:

Arm 64/32 MMU: allow only XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE
Arm 64 MPU: allow XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{PMSA,VMSA}
Arm 32 MPU: allow XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA

Cheers,
Luca


