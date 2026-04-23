Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Pk/HV306WmepQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 12:28:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0281450AB8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 12:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291892.1570647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFrI5-0007Eh-Cs; Thu, 23 Apr 2026 10:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291892.1570647; Thu, 23 Apr 2026 10:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFrI5-0007D2-9u; Thu, 23 Apr 2026 10:28:13 +0000
Received: by outflank-mailman (input) for mailman id 1291892;
 Thu, 23 Apr 2026 10:28:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wFrI2-0007Bd-Mz
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:28:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFrI1-001RVp-QR
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 12:28:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9f439-e002-0a2a0a5209dd-0a2a45049812-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 12:28:09 +0200
Received: from [40.107.162.16]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9f438-1dec-0a2a45040019-286ba2107984-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 12:28:08 +0200
Received: from DUZPR01CA0209.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::22) by DU0PR08MB9418.eurprd08.prod.outlook.com
 (2603:10a6:10:421::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 10:28:02 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::d7) by DUZPR01CA0209.outlook.office365.com
 (2603:10a6:10:4b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 10:28:02 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Thu, 23 Apr 2026 10:28:02 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBAPR08MB5607.eurprd08.prod.outlook.com (2603:10a6:10:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Thu, 23 Apr
 2026 10:26:59 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Thu, 23 Apr 2026
 10:26:59 +0000
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
 b=sk3D0NgDEgGsW2OLKA0vhrSiFVvA3Bgs1z3zRuyeeWadpBwuTUO3/509jMPd4+Ic3DQKatJJoXM7Y5W1w1NZIonrtT+arrSmcPVCASL1Eu6gkRWfbWz/hgA7D6Lg42uz43pNo1KYlxM5fhSvnMFipFg4W6+1wFJlyPTdVyfd01WQ/CSmbgYwb/oK9Kl4ecQzYQaegKQaGa5sXsoykmQLK0i8f9WFpwC50I/SqPh0qTwFXoQqvEtmvIcmTcFZtzacXD2Vk3K4t8r8MqgxLL2X4J2gB8u1ssovMeUq19ZHuseFog09MJ6egdr1OwL9RjhcoaQs1QPVrnFv3km3gUXdgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym//CaW/erLXxXdxEf2Fr+w18mQtRJ5/hELSNT4mQlQ=;
 b=CuFvbFDwrItR/Znb7qskw3iSKjzfgcCAhQU/w0pOFJ35FeoUKF9iXU5+e4Jg7xX/YpfGQNTCuetmvsr08t9w7cqlKFuK57/f+ZadZ2so15Cib1jACJys6mpk+B58imorjtKNYSuvvf6jwqhMUKFp7PRb24A2VuksqpOmM/XcJJVg5NyfnwmyooB3HVAKLPtoP3YtEtoORMbZ/GO+L9OtseMxYeOGuNHtXpfQA7WfEgMHp4LtBxV8R8mJMiXlg36ZjQ5bqyW6CrvKpNMULn0z3u4TFlHpUFCYNsk2IB4+a2z3A04xTaCvBkMNAOOGjrtgVQO2ElNGE89hs3eFdlaEOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym//CaW/erLXxXdxEf2Fr+w18mQtRJ5/hELSNT4mQlQ=;
 b=czZ7/NIe3bGJbFPiud+NVpiynGYCT8+XpjDnGKXl4GXUvbCjtjzTPWIyV0pXOvjorG0AboT8hr941SUa3P0ir3zQ/Kd62EDtXv+O8+GeulHJ6SGxJI3s6PpDmwBCIPpKRF8EI7VFUfrx2A3d6TTMFnnecPPSFKAqzLDL5+8qPMw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeED73EHX9bXepXp5TRLrMDHMXQFHu2eRrWMwHjKlY32cYKONRnKCdkFMqr7FwsYSCLI1NUt6p3ws2RqXmbj6ZFRmfucx2SFJgWIlEDabh8lI4LN6nWCOs6MdTCHGJJu1hVKG9Swjy0Zei4/MzZkrTWr9T7bLuLEqPdvb/FB0OaKzD5KWGHSdNRVnYpoOnxP3lSeteAx/wtnWtrq5azK2mlVm4EHK0fb3pTtdW1R0LNKUEb1w4RVeP4ghfs358NEXunSn87FCx2zSQ/+W0t5VkP4E1SYFc3P3I5EqxPcEGM8lSzdOSG+GWFMno/NCTH4+mbJBaOKpbb3s6Hkjls5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym//CaW/erLXxXdxEf2Fr+w18mQtRJ5/hELSNT4mQlQ=;
 b=JGMIu/Yf+iHDQSTebQxPJTo2NqefHd/MHgqcRS1pMG9+EfBhryDJjY4f7sLlwwURDdHa/+5JdzE2NP8uPePwAIjLv05sq7H1nJ+M8fHMkns96BjnD/MMrKhUZ46iXRW1YyZe4IWn19fN71RH6CL0XjgPWQBkcmQYlW/SB3FWQNx3gMeJUnu82Dsg3MB55RQXsgnLKUdGeGWkP7oUO2OsfFaMs1fdEoeFljGwKlaDhUTDJ3hpzm71ug5rPXEnZoA18etSLd926EC+1c02omVCDq13m0X5iyCZHkABMfmCypZeLidV45lMbb+ilIzsVi4g9+Go+r+lon1jzsPe7jrRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym//CaW/erLXxXdxEf2Fr+w18mQtRJ5/hELSNT4mQlQ=;
 b=czZ7/NIe3bGJbFPiud+NVpiynGYCT8+XpjDnGKXl4GXUvbCjtjzTPWIyV0pXOvjorG0AboT8hr941SUa3P0ir3zQ/Kd62EDtXv+O8+GeulHJ6SGxJI3s6PpDmwBCIPpKRF8EI7VFUfrx2A3d6TTMFnnecPPSFKAqzLDL5+8qPMw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 2/6] xen/arm: ffa: Track hypervisor notifications in a
 bitmap
Thread-Topic: [PATCH 2/6] xen/arm: ffa: Track hypervisor notifications in a
 bitmap
Thread-Index: AQHcznAWfT9UE3mepUCzg5x2vENfULXq2YyAgAFvNoCAACc9gIAACoOA
Date: Thu, 23 Apr 2026 10:26:59 +0000
Message-ID: <11248077-23EC-40A3-8576-E3F52DE3682B@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <7053b8c14bbe50cc855dad0a82cde2bb10153d2b.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44HaFjLf9CcSJMDD5O-R24_Kq_7zabw2Op2X=P1gj+85Sw@mail.gmail.com>
 <6D745E55-2BBB-49CC-AE8D-D75E9704ED8D@arm.com>
 <CAHUa44HGhtnekDiC0GOb0+=gHkCOBwfBJWfwmBxF62ukWr8HDw@mail.gmail.com>
In-Reply-To:
 <CAHUa44HGhtnekDiC0GOb0+=gHkCOBwfBJWfwmBxF62ukWr8HDw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBAPR08MB5607:EE_|DB1PEPF000509E9:EE_|DU0PR08MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db7b3a1-b0e2-429e-cb43-08dea122ff93
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 L27L1/6t42KNd+XoflvIUHtXxbufyY8bImIqW7WppVbaSch20YmN9Ktc/lmkKtdW7lHQCbAgA5HPhhAk5IJ6prw+bevKIF+rYjuCJWZmx5VjSaOWXtcOuXGlmQxqYqV+wDFIeiFJs6viMFVWwbUgVCITE4mbl3ZBjvJj3yCCXDtWxl3Lzpq1/2J1wu83+nnMPeYQQBbxGx2GB9SCy3Bx6sj6XWbX+iM+fGXaBqf2YW55s/tRmr9w1cIV0RelhQTOvMVgnIMt26orjxo/m/aKVStG63JAx8whB8tCyPcWxaZzPIXVeeiwLH+uziFyDSi6BWYgS8s4KwN/kNtHVhL4VWUpDIulOgJ8y7aLp1wU7d7F2ExPjy8kvhQKod+jGUd9zKW0OeSEiqI8A+tyjLdwqlPC14Yv7lw9ZVOvLI3RsKQrAJSM4NhJvUuHhC6E3B2Gcz0WY1Yxl3DV929G8tp5KqYFhmCLvCRgJnp5ZaduZv09u1X/NtoNx5qZvGEhL9UD2DaSY1rW6wmoC/lC7cX+nZCuplplv6rf6XkKb0OxAa1AW/WX886rSyDCPCMHgfyhkIM9l5Enp/+59E+xnEhKjTy/3qkj/0A5rABQ3Wnb+6MWxFIQwBW8YGSVqW3pRf+17kfOaFqDSaPBRKK5FWK+4TDJikX0lUrFhaPIbYyHM8h1HGuMfS8D7+JGEzFUM7ti9Hcc0GrcdGTlAjc+YQajt6oKrIK4aqq4jb4q62Vb5VwC0biXDTmeQdnkYexhJ/SoRIp8JxrLfoJJcY0XVsj81zldGMAegbjs0hcFobS92BM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <59FF8E19D3924E4094D6A1D16DD2904A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 SNb4HK7DSsskh2tiETieowXTXGZjGAixkd6g/uci4HG6jZYOyMFEtXz0fwqiF26MVEa8UkfkKLqQAD6anR6IStxxqbeFQS74MDiXsar46x1LHvXHu98TujMgWUo1yWK/KVmCKa3YJZXL0+pDgOF0VVf0SBszGI3B8FjpcrNeR6KMwHtjIoUlGtoflLqGG8LEk19/532tMvR7cgY1imVzxQNjjhyc2ikjbMJg8FHXV0lI8+aqA5WHIOQWQm1r80k8retrEVDGz6edaml4a5jyZhqTuWH8Li/6pxqXadWnM7u+UscZxLns6apxQx3E3WvYtf4pt7HGFmlxSnh6Ia6QwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5607
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b79df717-8125-4e88-18c1-08dea122da4e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|35042699022|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cVi4YdQeGAP/cKkk2nvPHnQqXOF4X4oylC6FFhSXmQjz1pHNUKPq3KhqFvxQPhbq3/0/yx07Ohm8rHwpS0m8xlg4oGiY5l5ig+6JTZYBMrsxpIRuz3CUjWOjCyNVwWCKrNW1jSzkgdqpzCW5Rs8msNlVyLJCqPKBnO7/Nycr9HCuKrVyrqf11R5lKsdxD/cj9q1XDXtxWStXew5gPobIuxcrkE8MjO80afn7hJ4SQIBrcZorfEVTUuf/YELuNSGNWMjgZLMq9yFUzJod+yStus26c/pYETETI/Qm2GQOuRBki1X5/RSNdgwn1fx5O8chqC44WvReqTtkV2l6tNs1TCg5KyHSU585CQd3N5A2r9QSzvEX6mjmJVYlUPK1LV2kpmiTcCsoe83PPQEQPRKgaVxvItIzd5oexUHcKQwgW6ZUUCCDw3CDLem4U0iYQ8+Jo9pG+dgA8kAq26LY/p8Qp4suj4Ut8AMhNbnoH7FJrcFen0rf1rXVrcCEsTHPf91+P7AyhrSrsim3GIdOYuWWR/vh+B/plUOhkhB7+3kS2byQfL2oVQFAmlUZq17azuQ8zAJ5YX3gpFtgHCRZri+LujXOLIlGSpyDBQj9yRZxNixGm/NYJ8Hrb30MBQkTISElVP+y468YyN5/zLicfF4vI6C5RFbPhGxCl2i1ONVVzj8Vjd4z9vdkQMfsv4h0tSllLqydvwMkm9XGZrsAIRiw7cjAetsIOGEqW+IYYLfaqpVmBfaI2QllWc5ExfP92zJ48MwrGFKT7Yl1p/Hcm9ojqA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(35042699022)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zUDalQxNvJIkL2y03/Ejw4O5OMVVbezIKP1bSrESKFD5Opd+BrjQDVmdveuYInrjIa/EIGb6G7acgb9gVE5L+wmocluNeKXpsfZ97FIcMw7yPc71mLsb2CGRTIiXOedvQl8+jMRtU2C6RQ61rxmv1LDb+novdg1eymrwS1iILis2WeNXWePbUfWipjxX/5uQXaintvAWpaRuHe9Op41XiIsY8838zx3UtQjwYFptIS4peWZNx6rnzqeyFe7pqS8QZfvaQ6Yj/zI98gyyAc+sD1tDEpdW1Ho8k1JOfp6AmtxIRLSxl/yYwCICjqiC6UziN28PfE5GSa7nNuXfKJWAO/WCsWEZM/n5xk4RiY5jfCh0rvpeL2cVqj8cF2ApvYnW5WgT5gCXTAakqQOHE9m2eVMXQXuzsZz6iZIc6DbF25dn51UqDIGYNOTWWliPf+fm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:28:02.0842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db7b3a1-b0e2-429e-cb43-08dea122ff93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9418
X-purgate-ID: tlsNG-ebf023/1776940088-2A7613FF-70450AB0/0/0
X-purgate-type: clean
X-purgate-size: 8150
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,linaro.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: B0281450AB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmVucywNCg0KPiBPbiAyMyBBcHIgMjAyNiwgYXQgMTE6NDksIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gVGh1LCBBcHIgMjMsIDIwMjYgYXQgOTozMOKAr0FNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEhpIEplbnMsDQo+PiAN
Cj4+IFRoYW5rcyBhIGxvdCBmb3IgdGhlIHJldmlldy4NCj4+IA0KPj4+IE9uIDIyIEFwciAyMDI2
LCBhdCAxMTozNCwgSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdy
b3RlOg0KPj4+IA0KPj4+IEhpIEJlcnRyYW5kLA0KPj4+IA0KPj4+IE9uIEZyaSwgQXByIDE3LCAy
MDI2IGF0IDM6NDHigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+Pj4gPGJlcnRyYW5kLm1hcnF1aXNA
YXJtLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBIeXBlcnZpc29yIG5vdGlmaWNhdGlvbnMgYXJl
IGN1cnJlbnRseSB0cmFja2VkIHdpdGggYSBkZWRpY2F0ZWQNCj4+Pj4gYnVmZl9mdWxsX3BlbmRp
bmcgYm9vbGVhbi4gVGhhdCBzdGF0ZSBvbmx5IHJlcHJlc2VudHMgYSBzaW5nbGUgSFlQDQo+Pj4+
IG5vdGlmaWNhdGlvbiBiaXQgYW5kIGtlZXBzIEhZUCBiaXRtYXAgaGFuZGxpbmcgdGllZCB0byBz
aW5nbGUtcHVycG9zZQ0KPj4+PiBib29ra2VlcGluZy4NCj4+Pj4gDQo+Pj4+IFJlcGxhY2UgdGhl
IGJvb2xlYW4gd2l0aCBhIGh5cGVydmlzb3Igbm90aWZpY2F0aW9uIGJpdG1hcCBwcm90ZWN0ZWQg
YnkNCj4+Pj4gbm90aWZfbG9jay4gSU5GT19HRVQgcmVwb3J0cyBwZW5kaW5nIHdoZW4gdGhlIGJp
dG1hcCBpcyBub24temVybywgR0VUDQo+Pj4+IHJldHVybnMgYW5kIGNsZWFycyB0aGUgSFlQIGJp
dG1hcCB1bmRlciB0aGUgbG9jaywgYW5kIFJYLWJ1ZmZlci1mdWxsDQo+Pj4+IHNldHMgRkZBX05P
VElGX1JYX0JVRkZFUl9GVUxMIGluIHRoZSBiaXRtYXAgaW5zdGVhZCBvZiB1cGRhdGluZw0KPj4+
PiBzZXBhcmF0ZSBzdGF0ZS4NCj4+Pj4gDQo+Pj4+IEluaXRpYWxpemUgYW5kIGNsZWFyIHRoZSBi
aXRtYXAgZHVyaW5nIGRvbWFpbiBsaWZlY3ljbGUgaGFuZGxpbmcsIGFuZA0KPj4+PiB1c2UgY3R4
LT5mZmFfaWQgZm9yIGJpdG1hcCBjcmVhdGUgYW5kIGRlc3Ryb3kgc28gdGhlIG5vdGlmaWNhdGlv
biBzdGF0ZQ0KPj4+PiBzdGF5cyB0aWVkIHRvIHRoZSBjYWNoZWQgRkYtQSBlbmRwb2ludCBJRC4N
Cj4+Pj4gDQo+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4g
LS0tDQo+Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMgICB8IDQ2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0NCj4+Pj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0
ZS5oIHwgIDkgKysrKystLQ0KPj4+PiAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90
ZWUvZmZhX25vdGlmLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+Pj4+IGluZGV4
IDA3YmM1Y2IzYTQzMC4uZDE1MTE5NDA5YTI1IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vdGVlL2ZmYV9ub3RpZi5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlm
LmMNCj4+Pj4gQEAgLTk0LDggKzk0LDE1IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25f
aW5mb19nZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4+IA0KPj4+PiAgICBub3Rp
Zl9wZW5kaW5nID0gdGVzdF9hbmRfY2xlYXJfYm9vbChjdHgtPm5vdGlmLnNlY3VyZV9wZW5kaW5n
KTsNCj4+Pj4gICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+Pj4g
KyAgICB7DQo+Pj4+ICAgICAgICBub3RpZl9wZW5kaW5nIHw9IHRlc3RfYW5kX2NsZWFyX2Jvb2wo
Y3R4LT5ub3RpZi52bV9wZW5kaW5nKTsNCj4+Pj4gDQo+Pj4+ICsgICAgICAgIHNwaW5fbG9jaygm
Y3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+Pj4gKyAgICAgICAgaWYgKCBjdHgtPm5vdGlmLmh5
cF9wZW5kaW5nICkNCj4+Pj4gKyAgICAgICAgICAgIG5vdGlmX3BlbmRpbmcgPSB0cnVlOw0KPj4+
PiArICAgICAgICBzcGluX3VubG9jaygmY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+PiANCj4+
PiBJc24ndCB0aGlzIGEgZnVuY3Rpb25hbCBjaGFuZ2U/IEJlZm9yZSB0aGlzIHBhdGNoLCB3ZSBk
aWRuJ3QgY29uc2lkZXINCj4+PiBjdHgtPm5vdGlmLmJ1ZmZfZnVsbF9wZW5kaW5nIGhlcmUuIEFt
IEkgbWlzc2luZyBzb21ldGhpbmc/DQo+PiANCj4+IFdlIGRpZCBjb25zaWRlciBpdCBpbXBsaWNp
dGx5IHRocm91Z2ggdm1fcGVuZGluZy4NCj4+IA0KPj4gVGhpcyBwYXRjaCBtYWtlcyB0aGF0IGNs
ZWFuZXIgYnkgdXNpbmcgaHlwX3BlbmRpbmcgZm9yIHRoZSBIeXBlcnZpc29yDQo+PiBmcmFtZXdv
cmsgbm90aWZpY2F0aW9uIGl0c2VsZi4gUHJldmlvdXNseSwgUlgtYnVmZmVyLWZ1bGwgd2FzIG1h
ZGUgdmlzaWJsZQ0KPj4gaW5kaXJlY3RseSB2aWEgdm1fcGVuZGluZywgYW5kIEZGQV9OT1RJRklD
QVRJT05fSU5GT19HRVQNCj4+IGNsZWFyZWQgdGhhdCBzdW1tYXJ5IHN0YXRlLg0KPj4gDQo+PiBB
cyBhIHJlc3VsdCwgdGhlIGd1ZXN0LXZpc2libGUgcGVuZGluZyBpbmRpY2F0aW9uIGNvdWxkIGJl
IGxvc3QgYmVmb3JlDQo+PiB0aGUgSHlwZXJ2aXNvciBub3RpZmljYXRpb24gd2FzIGFjdHVhbGx5
IHJldHJpZXZlZCB3aXRoDQo+PiBGRkFfTk9USUZJQ0FUSU9OX0dFVC4NCj4+IA0KPj4gV2l0aCB0
aGlzIGNoYW5nZSwgdGhlIHBlbmRpbmcgc3RhdGUgaXMgdHJhY2tlZCBpbiBoeXBfcGVuZGluZyBh
bmQgaXMgb25seQ0KPj4gY2xlYXJlZCB3aGVuIHRoZSBIeXBlcnZpc29yIG5vdGlmaWNhdGlvbnMg
YXJlIHJldHJpZXZlZCB0aHJvdWdoDQo+PiBGRkFfTk9USUZJQ0FUSU9OX0dFVC4NCj4+IA0KPj4g
SSB3aWxsIHJld29yZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gbWFrZSB0aGF0IGNsZWFyZXIuDQo+
IA0KPiBUaGFua3MNCj4gDQo+PiANCj4+PiANCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gICAg
aWYgKCBub3RpZl9wZW5kaW5nICkNCj4+Pj4gICAgew0KPj4+PiAgICAgICAgLyogQSBwZW5kaW5n
IGdsb2JhbCBub3RpZmljYXRpb24gZm9yIHRoZSBndWVzdCAqLw0KPj4+PiBAQCAtMTc0LDEyICsx
ODEsMTcgQEAgdm9pZCBmZmFfaGFuZGxlX25vdGlmaWNhdGlvbl9nZXQoc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MpDQo+Pj4+ICAgICAgICAgICAgdzYgPSByZXNwLmE2Ow0KPj4+PiAgICB9DQo+
Pj4+IA0KPj4+PiAtICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSAmJg0K
Pj4+PiAtICAgICAgICAgIGZsYWdzICYgRkZBX05PVElGX0ZMQUdfQklUTUFQX0hZUCAmJg0KPj4+
PiAtICAgICAgICAgIHRlc3RfYW5kX2NsZWFyX2Jvb2woY3R4LT5ub3RpZi5idWZmX2Z1bGxfcGVu
ZGluZykgKQ0KPj4+PiArICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSAp
DQo+Pj4+ICAgIHsNCj4+Pj4gLSAgICAgICAgQUNDRVNTX09OQ0UoY3R4LT5ub3RpZi52bV9wZW5k
aW5nKSA9IGZhbHNlOw0KPj4+PiAtICAgICAgICB3NyA9IEZGQV9OT1RJRl9SWF9CVUZGRVJfRlVM
TDsNCj4+Pj4gKyAgICAgICAgc3Bpbl9sb2NrKCZjdHgtPm5vdGlmLm5vdGlmX2xvY2spOw0KPj4+
PiArDQo+Pj4+ICsgICAgICAgIGlmICggKGZsYWdzICYgRkZBX05PVElGX0ZMQUdfQklUTUFQX0hZ
UCkgJiYgY3R4LT5ub3RpZi5oeXBfcGVuZGluZyApDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAg
ICAgICAgICAgIHc3ID0gY3R4LT5ub3RpZi5oeXBfcGVuZGluZzsNCj4+Pj4gKyAgICAgICAgICAg
IGN0eC0+bm90aWYuaHlwX3BlbmRpbmcgPSAwOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsNCj4+
Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJmN0eC0+bm90aWYubm90aWZfbG9jayk7DQo+Pj4+ICAg
IH0NCj4+Pj4gDQo+Pj4+ICAgIGZmYV9zZXRfcmVncyhyZWdzLCBGRkFfU1VDQ0VTU18zMiwgMCwg
dzIsIHczLCB3NCwgdzUsIHc2LCB3Nyk7DQo+Pj4+IEBAIC0yMDcsMTIgKzIxOSwxNyBAQCBpbnQz
Ml90IGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX3NldChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykNCj4+Pj4gdm9pZCBmZmFfcmFpc2VfcnhfYnVmZmVyX2Z1bGwoc3RydWN0IGRvbWFpbiAqZCkN
Cj4+Pj4gew0KPj4+PiAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4ID0gZC0+YXJjaC50ZWU7DQo+Pj4+
ICsgICAgdWludDMyX3QgcHJldl9iaXRtYXA7DQo+Pj4+IA0KPj4+PiAgICBpZiAoICFjdHggKQ0K
Pj4+PiAgICAgICAgcmV0dXJuOw0KPj4+PiANCj4+Pj4gLSAgICBBQ0NFU1NfT05DRShjdHgtPm5v
dGlmLmJ1ZmZfZnVsbF9wZW5kaW5nKSA9IHRydWU7DQo+Pj4+IC0gICAgaWYgKCAhdGVzdF9hbmRf
c2V0X2Jvb2woY3R4LT5ub3RpZi52bV9wZW5kaW5nKSApDQo+Pj4+ICsgICAgc3Bpbl9sb2NrKCZj
dHgtPm5vdGlmLm5vdGlmX2xvY2spOw0KPj4+PiArICAgIHByZXZfYml0bWFwID0gY3R4LT5ub3Rp
Zi5oeXBfcGVuZGluZzsNCj4+Pj4gKyAgICBjdHgtPm5vdGlmLmh5cF9wZW5kaW5nIHw9IEZGQV9O
T1RJRl9SWF9CVUZGRVJfRlVMTDsNCj4+Pj4gKyAgICBzcGluX3VubG9jaygmY3R4LT5ub3RpZi5u
b3RpZl9sb2NrKTsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggIShwcmV2X2JpdG1hcCAmIEZGQV9O
T1RJRl9SWF9CVUZGRVJfRlVMTCkgKQ0KPj4+IA0KPj4+IERvIHdlIG5lZWQgdG8gY2hlY2sgZm9y
IEZGQV9OT1RJRl9SWF9CVUZGRVJfRlVMTD8gSXNuJ3QgIXByZXZfYml0bWFwDQo+Pj4gbW9yZSBh
Y2N1cmF0ZSwgaWYgYW55IG90aGVyIGJpdCB3b3VsZCBldmVyIGJlIHVzZWQgaW4gdGhlIGJpdG1h
cD8NCj4+IA0KPj4gIEkgd291bGQga2VlcCB0aGUgYml0LXNwZWNpZmljIGNoZWNrIGhlcmUsIGlm
IHRoYXQgaXMgT0sgd2l0aCB5b3UuDQo+PiANCj4+IFRoaXMgZnVuY3Rpb24gaXMgYWJvdXQgcmFp
c2luZyB0aGUgUlggYnVmZmVyIGZ1bGwgbm90aWZpY2F0aW9uLA0KPj4gc28gSSB0aGluayBpdCBp
cyBjbGVhcmVyIHRvIGNoZWNrIHdoZXRoZXIgdGhhdCBiaXQgd2FzIG5ld2x5DQo+PiBwZW5kZWQg
cmF0aGVyIHRoYW4gd2hldGhlciB0aGUgd2hvbGUgSHlwZXJ2aXNvciBiaXRtYXANCj4+IHdhcyBw
cmV2aW91c2x5IGVtcHR5Lg0KPj4gDQo+PiBVc2luZyAhcHJldl9iaXRtYXAgd291bGQgYWxzbyBt
YWtlIHRoZSBjb25kaXRpb24gZGVwZW5kIG9uDQo+PiB1bnJlbGF0ZWQgSHlwZXJ2aXNvciBub3Rp
ZmljYXRpb25zIGJlaW5nIHBlbmRpbmcuDQo+PiANCj4+IFRlbGwgbWUgaWYgeW91IGFyZSBvayB3
aXRoIHRoYXQuDQo+IA0KPiBJIHNlZSB5b3VyIHBvaW50LCBpdCdzIGZpbmUuDQoNCkluIGZhY3Qg
d2hpbGUgd29ya2luZyBvbiB0aGlzIGkgZW5kZWQgdXAgaW4gc29tZXRoaW5nIGEgYml0IG1vcmUg
Z2VuZXJpYw0KZHVlIHRvIHlvdXIgcGF0Y2ggNiBmaW5kaW5ncyBhbmQgYXQgdGhlIGVuZCBpIGRv
IG5vdCByYWlzZSBkZXBlbmRpbmcgb24NCnByZXZfYml0bWFwIGFueW1vcmUgYnV0IGp1c3Qgb24g
aWYgYSBub3RpZmljYXRpb24gd2FzIHJhaXNlZCBhbHJlYWR5IG9yDQpub3Qgc2luY2Ugc29tZXRo
aW5nIHdhcyBjaGFuZ2VkIHdoaWNoIGRvZXMgbm90IGRlcGVuZCBvbiBoeXBfcGVuZGluZw0KYW55
bW9yZS4NCg0KSSBhbSB3b3JraW5nIG9uIHYyLCBtaWdodCBiZSBtb3JlIGNsZWFyIHRoZW4gOi0p
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiBKZW5zDQo+IA0KPj4gDQo+
PiBDaGVlcnMNCj4+IEJlcnRyYW5kDQoNCg0K

