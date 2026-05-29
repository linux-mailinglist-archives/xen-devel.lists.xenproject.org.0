Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFbvJMFgGWpevwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 11:47:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FEA6002CD
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 11:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321859.1588342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSto1-0001qu-B6; Fri, 29 May 2026 09:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321859.1588342; Fri, 29 May 2026 09:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSto1-0001oC-7p; Fri, 29 May 2026 09:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1321859;
 Fri, 29 May 2026 09:47:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wStnz-0001o6-Ld
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 09:47:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wStny-004wR4-GT
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 11:47:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a196091-e002-0a2a0a5209dd-0a2a4503b9ca-34
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 11:47:01 +0200
Received: from [52.101.83.2]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a196094-672d-0a2a45030019-3465530234d2-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 11:47:01 +0200
Received: from AS8PR04CA0168.eurprd04.prod.outlook.com (2603:10a6:20b:331::23)
 by DU0PR08MB8929.eurprd08.prod.outlook.com (2603:10a6:10:464::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 09:46:58 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::7f) by AS8PR04CA0168.outlook.office365.com
 (2603:10a6:20b:331::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Fri, 29
 May 2026 09:46:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 29 May 2026 09:46:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAVPR08MB9556.eurprd08.prod.outlook.com (2603:10a6:102:311::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 09:45:53 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 09:45:53 +0000
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
 b=x8pJF8pHkBG9OtMbZYR2iemNiCRmhtu1NK3LsBRhmvnNMXh0aJqTdaXn6lMHydpoUXgpLMqUB5G7W+uRFTaQiGa4WEj/VNMzqlXWrW8tGymu0DTntW9xRordvlHcg0ViJ118TC892YfCi7tblFv1WFEf48Vky2HoXuSz6LklvZ3qpNtH3e2yrQvX/RSCvYRZLke4h47f7rd+MO9FuvrvWnv49u6ohLI/Z62o3sCOy/0jHPAB8EbqzZxtsfB9jWQWYhFJBcDWoep56uYUFjpI5zoh+xQqAE8/qqhvbzJ60O7NCB044arbbI5Wz83r2d0tjKErt1KA7XB4XHmTbkVvKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OkPbLOrMqqyBoy2/s9F/mTHpozibR4ya9kIhxBsmh0=;
 b=hWaurzY9T3d6yHcJkE0agpJtQ+6XUshLfVKbcdB2J1lIuclnCMz3jsLILLT/cDPKVG3zeF2ef1kwRLNjyYAOME4IzSFeXkhRrvf+Nn7RZluidES4FxPGTbS4TFu9x0sILpTBg7XWPVBfKl3NkljpAqbquNpuFZl05U9LUa8H5eWDAgZWIF5X4sLppSHJRv8EEfLfUW4TeZgeebO+c4S0hghAPcrXFWJeah6utU9XMFS8Xwu7xXUoN8HZ4YwzTO+pik+JCALJRm7YKEOiS5EOH0QDjz4bMzhFJoKW/q/5wFVqTZ0nHW9wwktKiEnq/as5lmsg4iCo/vRCOAYpJiUrqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OkPbLOrMqqyBoy2/s9F/mTHpozibR4ya9kIhxBsmh0=;
 b=rPVBegoV3t1oyVRlwcs4gM/SvGrsg2SUfuNHnuXROKyNlCgf38ecNoIBLG8+9ZiSaO1IDRXAkBDY2+HGvnEq/6WmVfO9DSAGtU8QMcjkUe4jb6KunYtXi0LSm9xqS7qhm006xX9gsKZVw/OOxWprH0klT5rSMfDbcwslebEZGHo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk5utapGOZExYvq04qzZyk+RXq0iQEYwEUWcEAwzmf3xiYm8IK5G7zT1xMFtixPgpo8Kb6hce86Kf0FUsbSflms2enq4to53afch2d27GaeRro7JCd3UYY7pCnRd89Y3eTk/CUI/KZ5NXm729CWGNQFCkQofBLJhCoZUPsJbIQ5EsvveEs1dCSkGIc8dyzJeSK2fC0N5IUIijbFV/MA9W14rrVxXQU0rop/+9pAYJSxKHUy8hLnaX8v3csUvF6rPqSlstUDpq03IEhrlPgf91gJPvq46H6QGlNlVP/7yfmTGqBd7QS/LZI331j4F7PY61EdwhD3BbqMKhniAX8H4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OkPbLOrMqqyBoy2/s9F/mTHpozibR4ya9kIhxBsmh0=;
 b=VYFlml6gUrM1CGs3jt3le3meGPl0mf21vFlE+bwASbpb8eMsKoCEcnO554VmlhgJ/smZXi3GXFK0pOL0foMmsNPnrqEs1ZvpoQi+Tmen4dI6C5w/fMNEpEL4FKMi7eqIlEaEFMvMnQ3D1izzFuQ4S9FK7AcPQF/3Ba2WeCyljhv/vhLGsHY5h/Ebi8r1de6bdwqVkUVvsPUhU6exjPxf4aYa18NzpQomOtOWOI04QoDlCxe0SAOL+OK+tGook8flHPYYuLS93t+yFmW64+Uuch1lQ/bFf6Jx7ToOl1eGp4oqRc3Cma/axVCWBQew+W8QgKSl2+KkEguc5CbrSb63xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OkPbLOrMqqyBoy2/s9F/mTHpozibR4ya9kIhxBsmh0=;
 b=rPVBegoV3t1oyVRlwcs4gM/SvGrsg2SUfuNHnuXROKyNlCgf38ecNoIBLG8+9ZiSaO1IDRXAkBDY2+HGvnEq/6WmVfO9DSAGtU8QMcjkUe4jb6KunYtXi0LSm9xqS7qhm006xX9gsKZVw/OOxWprH0klT5rSMfDbcwslebEZGHo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v10 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Topic: [PATCH v10 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Index: AQHc6UoH9mMqjMgbj0ORE0RKSkpfJbYkzScA
Date: Fri, 29 May 2026 09:45:52 +0000
Message-ID: <3FBF0FE9-E811-4597-944E-73CF8C9DEABD@arm.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
 <9cb404f9327e203594127495ff9aedcf96c18377.1779385072.git.mykola_kvach@epam.com>
In-Reply-To:
 <9cb404f9327e203594127495ff9aedcf96c18377.1779385072.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAVPR08MB9556:EE_|AMS1EPF0000004C:EE_|DU0PR08MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf94ecf-2adb-4ca9-2d9b-08debd6739a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 8eaMN3TMnpWSOW7G4F18USqHnEViedAS+TUOcS6DYcLl+Qrm4TpTRlrZqGAtVWfrkez5BDZELnDHEzaHmlFKp+eCS4Q1khYCxiYF7LldLok9ozNsPyU9AjDZwGFXbVVfZmnLp7YYF6WZNFlC1RRxOiODSZp82jl+OBfNTggQYARuKkjA9xhhJcIz81UjfZodyp8Ah+Tf/P3/oOX29/PX5XKJU1AsEtSnLxXEDB5UKRDys+f7VsM3cbBjQwhZC0q8UDApVG7lho6crPHUQboehKTLOfj7yF5gwRxeeifOlWtwLrs6c3lqYARyQsHAG1OsrIezuaItUXd/jQL1N/WIX23FMb4YGD5AyUNPqTE8mAG9gB89sjkCKyM7mMHGMasiodSI0Nn7TjYdDfn5jupIguHIP69WoZYygN4Ke6LsHXgdn9OC6B+tbopBE/QcOQ2KdiVbV5dv9lkH0UJOyTMREshcj/VnA0ova96Mgdg3Z9x90GspEiqoo3USJrMewfpInm9bqKWYjxxv/prDcRIHwWbMevXgjedDoaXQ/mO9CT/LtQDHhhRywqn5flyMTikE8RgQl2qN3Evr8w/JzrHrM2N+zzu9ZqSduO/aODbN5Je9LkKTp2W3eAtWbqqpewgRjH/46Ha4pcE5R5IsIgSUqFVFOPNMDKbKY0hMD8j7y0t/51m9SdqLJz/sQwETZVXkwooBARlIkKCCNaw8D4/Cnd9b9t0EO/bzIvqyT4xbLu2f3RpMdTKyHflF4d1dUrXV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7DB65183BE98DD4C96766B89D72C2771@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 Q+P2NZAaOPTTMFlFwukFGHzIWX1oHhPKxVOH9JG2bbqejQevg/PCw4S+LEC2SgeEOfCkAcEK3XoCeZQEMWEQkCdVTgEEbgzSga47gOrtv9gj4AFUWRcC6yt1T2rh0bVyyTKLVagNNVMnUNdmlQaCav/LndqbvxsG9lCyo/6cRkcKm2592FGlBYa7xo2xPdsJAQRHWPHybgt0BWKijUuJv0dOzaFfYOwVIJSml7RhaWlBxG0Oy4CzckmGse6/LBSBpqw3DtFtmFwJu8Z1ljR+SgfdfCjzia5splDvdijHcXAot1UomAZyu57VkEaSUc2q3ehWodtG0kztibsxfVJY0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9556
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	43442602-a40b-481a-f964-08debd6712ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|35042699022|1800799024|14060799003|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5mmeDwvHUNbaRCgt5RdlTV9HNcyjtYJfyi7s7g3SK/MlCEH8jTs+GKaI8By1wyFmDf/dQorcWQnCXCXLLIK4rbBsR93eXH3X6HBZUDLLSNTVfSP91brolWm76E7XAq9nTOoPhOjSSxC2X+GyzCXi9rvknLgtyu3oTatCt0dVooW40QDJEH1+yefRIypd4tLSNHhB73epaWH4ozZNY5R0lvJZh7W2u0D9gToSD22K1SRcHTWHmxo2oxz82KxS3NuUXYl/ghIr2Ffl0Pu35UaUn2EiIhePmgmvG7yXftwIRDokjqZlMV4CXatx0agz0lXHEoBqZiF8S+NaPvt7frtI7WeC0vi6Ug8R/xq+OzkarCa9FP3RxHfx8jpbVzCmWtEVm6HWs+uzDlsCG59g0jkOvO9g+w10hnC1mgPbU1I2CYWIem/WkcUBMdaIV7ODzrrxtd4GnbLCIty+dMRbKbghEU1M1w8tn0p5fKYjTtqGa4NPgD5p4hTrSeR5BDiXGgz5zcrIns0JK6x6WzksMUyUHlDjB9yncb1482f/ScaeBcv4tw4vwTlft2LY9KF8ibSzjOxfgqzGbAlSbzZ/YiIzZrk9nJswtjBSOB8EtZqSgCnnRpYiq3wEj9OfVh5kTq3Tj0k2B33V8m7eKB3TIcpQGKBi+umGLYOSp+aToECgHFA86Nq1HHtKaJC5XBPWbpHAbizFKIcfdQZUg8Yf3/C/U6LS4IRv06JGSv65miQk+UY=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(35042699022)(1800799024)(14060799003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OrGN855lvJpUDFVrGMFyDqfiDXYFNVt4IpnC9Okjxx1ArCe7rZvozmjpIM0p+LY9SDHIPG7AwRJPR5rHFQKHhzxeaQC6OnIF3mwVbChnYwjnevFBYgfRKY89JKydtFEq+DflTnU/s1SBWXnbrSVKh15MWeWBbo6znzJHlpMFk/aPaASRB9jnHDsXhPD+40/O8OZdFWJd1SdbTf6S0XGYbJpWPk/bmP+tFMlNFgLLIWcElxy7RBmA1ikowfWqZsCQ4Tu+YcMulrcD6mNorlcZVRASMdGoEyCRREtljkbNhp8hrV62yCsBRdIaJvkU+d+f+Yk95UJKdVhR8uCjrvnzhbgsFX+i1ZAqnKjwiDrui5up2KuYOpahx6HRcnnefwqEhNPreJVuTLdpYF/y/8ksj9llduzRrQpnjSCa/5PGt2MGypiPfb8TeNY1C4CXYEQS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 09:46:57.8434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf94ecf-2adb-4ca9-2d9b-08debd6739a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-purgate-ID: tlsNG-33051d/1780048021-3754F938-CCE93EE8/0/0
X-purgate-type: clean
X-purgate-size: 1212
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,epam.com:email]
X-Rspamd-Queue-Id: B6FEA6002CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 21 May 2026, at 18:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Store and restore active context and micro-TLB registers.
>=20
> On resume, restore Root IPMMU context state before restoring Cache IPMMU
> micro-TLB state. Cache IPMMUs select Root contexts through their micro-TL=
B
> configuration, so restoring Cache micro-TLBs before the Root context
> registers are restored can expose stale or uninitialized context state.
>=20
> Tested on R-Car H3 Starter Kit.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V10:
> - Iterate over registered IPMMUs in reverse order during resume so Root I=
PMMU
>  context state is restored before Cache IPMMU micro-TLB state.
>=20
> Changes in V9:
> - set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
>  succeeds, so DT devices do not remain protected on allocation failure.
>=20
> Changes in V7:
> - moved suspend context allocation before pci stuff
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


