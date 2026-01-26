Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPauDJgVd2mHbwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:19:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92784C93
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213328.1523817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGsp-00067v-Ii; Mon, 26 Jan 2026 07:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213328.1523817; Mon, 26 Jan 2026 07:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGsp-00066U-G1; Mon, 26 Jan 2026 07:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1213328;
 Mon, 26 Jan 2026 07:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0MJ=77=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vkGsn-00066O-QX
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 07:19:33 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b3f4d07-fa87-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 08:19:31 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB6543.namprd12.prod.outlook.com (2603:10b6:8:8c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Mon, 26 Jan 2026 07:19:27 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 07:19:27 +0000
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
X-Inumbo-ID: 5b3f4d07-fa87-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvqCUKbhrnIjAswc2vyX6pq8B5GpmPCd67RiiiDo0oPaXXHpDDKPjZCcp+b8+Gz8eCAjDJgTgAvSJZV/GrhO3LBOeyC/UtD8hbdlvxsbpUxc2l4Nq+FRVH5eUUhU+3gb7dAU3CYRCocrJs5jPfAKZAcS+M05GHzbfto0Xy803gnMRo+3jgggnV4LNV7q9yml8x5XmDQLLzzEJmnmRTx3PcUFb8aR6TcSwikhk8qklWA0f8J255MCTPbgh67r3js44RZhrZ82vnF8/FbG8xWc6y9m9TBfjDDrMNvg1gH+4kBiQcQnlGtyNkIRFT5fmn45Wj7hMwvITG+arIbPzLSBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX1DOoMa5nFnV7X4GDFJEoJk5FTI55hORRJzUCWfSn8=;
 b=W76TTfdqDortc1DYE6Btny1HdsarpW9Uu3FYADKVMP4E+NJHkYEdhg/cHb3x2PeJBPYJTvP5TTEKXm0aOFO3RHSVGdyfDIW4Vqeg+CSDqCOAeKkkdzNVBr/Io6blTgAeCPYjH1dsjnmYDjfYoXchMRnOx4szyETrqv4HObMZ9trPCVt0c2vStsrbJxhsncQ23fDqLcAvA4CmjrpG8EJF8xjTvghVnmKvgzlXD5od1fjIcNIEUk6Q8aBUgsgcvMKwnOxiwxA/q0HazxFsgvQOmHfasrYBNhHt69U3AW7qGsaaW+22oW7RVkJIOKav2xXEZaxYiAgcFAg1HGlBiUO7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX1DOoMa5nFnV7X4GDFJEoJk5FTI55hORRJzUCWfSn8=;
 b=A+R3pac8bR+r3Ib0aCnIQNQ6G4xG9Ji5alUIuOEmTULSr42VPLiMcra+0okH7GeiBJ19LDSgsinIG+AWxyCLWxvDjFriy9tfq1CKQ6uZsX7nh02kw2kwajlaZ4tExVWJloZoBoRXQqyR/EBEeLJLDuy4xNaKXqmic1SxojCDobQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH 4/5] cpufreq/amd-cppc: move epp_init into driver data
Thread-Topic: [PATCH 4/5] cpufreq/amd-cppc: move epp_init into driver data
Thread-Index: AQHci4OVpTuwrEnBuEWXPpEzWRHqS7VkEONA
Date: Mon, 26 Jan 2026 07:19:26 +0000
Message-ID:
 <DM4PR12MB8451C609DDC1C0343537CDBEE193A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <18639925-4e8f-4d58-a850-291d7ac0e6da@suse.com>
In-Reply-To: <18639925-4e8f-4d58-a850-291d7ac0e6da@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-26T07:19:18.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB6543:EE_
x-ms-office365-filtering-correlation-id: 04693ec1-4065-4356-853a-08de5cab3d4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Qmx3OGZkWW1Ea2I5WG4vNk1nclp3YnZhb3RkTTRTVjduUHVObW1ITWN1NSta?=
 =?utf-8?B?K0c4d2MzYzA3K0pUZ25VZXVWbUVDUlIwNTRzdlNHY3F0UGtmdVRmbGdIcXVP?=
 =?utf-8?B?VmVlbEJxS2pNbEM2eHhTdXZwcHU5M0poUmhveXYzNnBRdE5BdXdQRytwRVdQ?=
 =?utf-8?B?RG0yTmt2U0t4d3hobTdta3cxaEltK2pqOUExSC9wM0wxL2ltODVVeWxZQTNP?=
 =?utf-8?B?K01EVkdKWkpYdDVJNzNWdUtWc1FNTHQ1cE45WnlpQkcrVjhxUEErUndBMmoy?=
 =?utf-8?B?K0Z5RGFnOE1aTHRwQkhzcGs4Z1UxSzl5NXRMOFpyT3Jnd21qTmUxLzBkS3Rl?=
 =?utf-8?B?MG1VZzVobW91Wi9qTVdCOEdmeGZVKzZEMDFDMjJXYlArTGJwUWpCT2VaZWs5?=
 =?utf-8?B?c2kzbXNLRUJHWFhtUUxsTXZsWVZLNTU4T09GTUVpcUIya3NLa0dKNzNPN1Jx?=
 =?utf-8?B?Tkp5cHdTMzd4ekVXcDlTWXNvOGxEUHRRWHBaVkRYQzdMYVl4bEtvNGUra1JZ?=
 =?utf-8?B?TWxSaEhrOXY4MnRKVGdSdlMxUEExSXhGZEUyZjBaeU1hU21POFQ4ZlJHdVUw?=
 =?utf-8?B?OHU4VjVtekhSMjNsZG1ZUjhMYmFQWFg1M0gvVFRuUERRUElLcjg3R2VJZTZx?=
 =?utf-8?B?aEEwb05SVWpYM1RydFRCTWZvckNSck5lcXZHdW84c3RIWWdhQjJ3cVdjaDVq?=
 =?utf-8?B?aEFiYm82ZU5UQUNaZnhJVUR6dTltZHh3SiszaWwzWllCb2NoSjk0OFYwY2Y5?=
 =?utf-8?B?ZUQzcW5ybVVlaW42ZVQwS1YwdkJyMnl5QVJnY0dLZW1qT3Q4TVFYVUxlMDlw?=
 =?utf-8?B?dkVJeDUxQkVlVDh6V2Q2QVdtcjRXdXY4SnhLODJ5L1JXNng1MHAvMHdlelh5?=
 =?utf-8?B?Tk1Ia0ZrZXUraWdBRXlEMzM2YXBLejNtTmxYc24vazJra1FuaEsxdDRMODJY?=
 =?utf-8?B?dnVOZ1VKUllJdUdUWHZVSUs4bHJKQ0g1eXJuVkJubGtYYnNMcmx4YkFwUTNo?=
 =?utf-8?B?OEhia1lDSldFMGtnNGNQMzYrZzUwVDRveS82WXQ0Um1RaWh5SHpVanRRY3h2?=
 =?utf-8?B?SmJudU1EQWR5NTFzeEwvaDlqZ2RndVdiSUpIQmxUZGMrZkM0SnFSL2hjcGZW?=
 =?utf-8?B?TW5GWmZzdlpMS0RZRDJYRHltU0dWaWhkKzFUeWZ5SXRBWE4zWk1IWE1XM0wx?=
 =?utf-8?B?bEwxZk1rY1FsWVRxdWxmbDZrNWdLSkNLSk1lT1IvN2xDakYxV3lHcHFaTG0v?=
 =?utf-8?B?TS9YOTc0TzRwajdMTFBEQkswTWdJZ0gxU29mT1BhRUxRN0E0aE9VV1IreUtQ?=
 =?utf-8?B?S1pWM1pOYllncGZHYktKZkhqVGM1WjZIaHFGaGFvTXBvV05SQ2lXcXkwNUk5?=
 =?utf-8?B?bTNiV29zNDlRZTkxRzF0RmMvV2tHQjJVTFljQ2s2UEN0WlRTTmtxL0pGM2tZ?=
 =?utf-8?B?Nm0vL1NOaGdwK3FQNWNLVXZkKy9VWHh4K0hMT1JFbWR5dm5tNTBqN2NYbXNU?=
 =?utf-8?B?ZW1jR0ZRS1ltTXFUNFlTNzQxOWtkdENiUklnYjQ2cU1YdjJGbEJGeDBFVndM?=
 =?utf-8?B?Ym1sUFNqZFgwTVpONjM4dFE1T0RJN3l3NEhyTlF3TmcwWmdOak9uR2xOOEJa?=
 =?utf-8?B?TUhQcm5zSjM5U2poVVNQZGZ5QnB1NlFPY3RuZkN6b1FkdEFDbUw0d0xERnZK?=
 =?utf-8?B?YVVuZzZyUmQzSm83MHZJeDNZS2lQSzI4Vm0rU2ljb1cxMlBLQlR6emFBOTlT?=
 =?utf-8?B?ejh2OERMVTJ0dmRtZ2N0Yk12WENuNXcyeGtPL2JOWXdONkFTODRBK1BVYVAx?=
 =?utf-8?B?cmpxRUlsczhSSUIwSmRRTVdnMnRUZUpndFVscjRJcXFuNUQyQU5ocUFpQWtL?=
 =?utf-8?B?L1B1QTBsWklFQ1ZKT0k1QXhNNUhMRWdFS3YrYUZLNlhHRHZsUVVQbkZ1Sjlh?=
 =?utf-8?B?SzlpaXBOOWN5QjhMV09MRGJObTBBaDEvNWUzMWlOaGJYN3BXVWpRYlFtME1Q?=
 =?utf-8?B?MXB2dmwyYXJoaWtsV1RnOHBReE1YeUJtL3RsUXp4bVlqbVFiWWlyV2hrNlVG?=
 =?utf-8?B?WlIxOUsyYURDeVZWbDlhZEVNTktiMmRCYjRNZlE1N2JqaWVqa3JGTDhTdFpF?=
 =?utf-8?B?ZENIakc3Yi8wVmlybmlaL0FkelBUbjN5TVRoaWFBSUo1dTczVE9NaEp5bXF6?=
 =?utf-8?Q?KEzJc71/otf3oW3H5zvXBZ0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmF1Um10VG85RDFoeWNsODI5ajhMaGwrZlc2aDFhRGJIRnd5U2RYR1Z5RFVB?=
 =?utf-8?B?cDY2K293VFduVzFBNkkrK09WZjFPRHkzc1YwM3dUYVMwaGViRVVhTS93b3Yy?=
 =?utf-8?B?OHgrQk0rYkZJY3hiODRlK0pQWGZXS3FDWi9SRVpib3Npdis4MlIxekhGUStu?=
 =?utf-8?B?bDAxY3JIb2ZESGgvU0liS04wck41aXhYYXg1ai9yZk1lN1dCVnhTbjBmRll5?=
 =?utf-8?B?dVJCdkh0UGVmUEJPOTh6Lyt1cnZKZFlHUVBneGdyN1dPU0JQZVRhWlArUHJD?=
 =?utf-8?B?UXRlRWN6aVpGTEx3TlYrcEg2TkhGSVR1SDZjcGpEYzd0Y2hlOGNQcWFvbm1a?=
 =?utf-8?B?VVJSSzE0QlVtbzVvNkE4emNGNG9WTUhxUW9USmpLaHk1SWVKbFNtczI1ZmtE?=
 =?utf-8?B?dFJYVjlzeWw1eDV0aS95d01hNk4yTy9JUFdZbXArUkV6QmhiWHZqNkVVV1Bn?=
 =?utf-8?B?Y0dHM0Y3MWJuNXMvUWlBS0RwaWpiWGk4bzgyWCtkaWRXOVN0dzdJMytqOFdi?=
 =?utf-8?B?ZklEOXJwbmdRUG9OWEV0ZjZXa3lPVEo0YkZiWFBtclNyYy9KU0xGaXplNnE5?=
 =?utf-8?B?VTg4ZDdaSXhpVUpRbHp0ZXIyU2dJZkVGM0RUQnBGdkpiVG9NWncwNXpxdnls?=
 =?utf-8?B?cVJYL01qbWUrMmYzMk03SS9oczlpUVlNd25IOTN0NXZFN2VhOXJRQ09pOTBG?=
 =?utf-8?B?UW4zQ2FuL2dNYUQyR1A4WDNHbE9GdUtoYlZvL3lLUmt5cW5tMmxVQzc1NEdQ?=
 =?utf-8?B?b1lrdVpKNzJ2cWdORkpCOXVSMEh1STRMUHRIWXJ2KzNjTk1MS281VE1kU0F2?=
 =?utf-8?B?VWVvQTByUzZSTi9JTmlDZVgrUjQzUmlvdk1rYjVyejB4SS9uU280c3l2OU1X?=
 =?utf-8?B?SXZQZnQ0a1V0RzZGMHpISTRyS1kxaW5PdjliUXB1aGQzOXBxMXdicHIvK0tS?=
 =?utf-8?B?cXdhVG9nWTg2TUd3WVNrSGFyUkNWWE9vRjNpaFlReVkvY3o1cFN3SGFSSG05?=
 =?utf-8?B?M2E4WUN5NjVpWFpYTWgzajBnWDVnTERLL1JDL3NKVkM3aTYvK3BMbWlKQXhy?=
 =?utf-8?B?VHlzMjAyU2Mvc2wxQUNIc281SlZoMHhtbkNaYS8wZUppTkxFMU94MFZGczE5?=
 =?utf-8?B?RlhNZ1FDekhBQ3gzYzM2TWRLRXVEM2d1K1hLd2FWOFltSzFqRTlzZVFvUHlW?=
 =?utf-8?B?SXIrQU9vbk5FZ09BNG1rZmVtc21Sbm9naHc2N1pERGRMNzYvRnJxbnI0YXhs?=
 =?utf-8?B?NEQ0M3l1RkkzcVY0VEN3ektRUGpvc0tjendFU2J4eVpQY2xHQWdrOTJCakJh?=
 =?utf-8?B?Z09WQVNmY09EaFpYWUtwK2FVb1V3dmdwa0F0Nzc2TGFabm43cUdKekNpTm93?=
 =?utf-8?B?SENLZ1c3UFNYN2dYWnFLODBWd2RhSmRLMlJySGcwZk5ITHZTM0Q5ZGdyMFo0?=
 =?utf-8?B?TjYrbWUxR01tZE5BZGg0QmYvYVZnUHc2WFBCRmg5OHZBMDZUTkh4aTN3Mldh?=
 =?utf-8?B?Rk94eVI4UUY1VkFmZ1AvbzhNaElkK3pici9QYmFXNy90VnV2VHpjR2hOUTU5?=
 =?utf-8?B?N1oyL1ZYUWllRGNkY1E4VnU1QUtGREhsbjZCeWRIY0VmMFo5ZVAwYkt2c1U1?=
 =?utf-8?B?QnpVRjVpclk3d0F1MXdIdjlWWkphQUdRaFlJTUNDMGxaUzVKd2RienBiOWFy?=
 =?utf-8?B?cWZRMHhTbUVSQ2Q1R2wxcWtiZ2VFVFdnMkh4QXJqZURRV2NCMXY1VmxPeHhH?=
 =?utf-8?B?bC9KdXA3UUwyYXJlNGdoUmdkbjAxZTV4YmpYMjVyVWc1cEZrVXNrOTJsOTJQ?=
 =?utf-8?B?SERsQTNVZG4rblpPeW0vTXZpakdGWWU4OEwvb1BBSFBNbXBndURGSlg1YjFT?=
 =?utf-8?B?ODNyUGlWY28ranlVY0VpMFpPQVR3YkxWMk0yTHdaSEpnenVpTmwwMGNFTTdN?=
 =?utf-8?B?TTZ4NXN3UEp0cXZVVzRwbW1FMnN6US9ucUplYU9PeWdqOFdOT0pDNlcwa2cw?=
 =?utf-8?B?SUVUNU82UnVJTHJHNVJvcVpNajVtU2E5cU5wNUx0dFF5TC9YN3lXNGJXTlJk?=
 =?utf-8?B?RWR6QzdnSERhdWVEbTBwWTFGekQ4VStIZFZUVVFERk16a2EwUmpEZGd1RDNs?=
 =?utf-8?B?Vlo0WDJmNnc5MVBZSHBDeGxQMGNveUEwNzNoWjZzQWdGT0k1dk5sL3ZoSlBm?=
 =?utf-8?B?QkpSNzFvVlJCV0t2b3NTUWlnODVjVHl1V1E4eDhKcWkxR25jc2JhWWFEUmRz?=
 =?utf-8?B?allBL2V2ZW1IVUozYWRqTjdkQ3QyQnoxd2theGQwMW5Nb1hMb3JHRFBscGlV?=
 =?utf-8?Q?QdtgdbBvBTLNtmK0rM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04693ec1-4065-4356-853a-08de5cab3d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 07:19:27.0303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCXZ4rHBVBKo591+mccqUWD5BPyhOvhxvbsJTzG9ysSRVCsX65tO2IhJk9Hn/VJzNWVIdaFtgFogLyYZEI+YHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6543
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,DM4PR12MB8451.namprd12.prod.outlook.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D92784C93
X-Rspamd-Action: no action

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDIyLCAy
MDI2IDU6NDMgUE0NCj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
w6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0Bh
bWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNC81XSBjcHVmcmVxL2FtZC1jcHBjOiBtb3ZlIGVw
cF9pbml0IGludG8gZHJpdmVyIGRhdGENCj4NCj4gTm8gcmVhc29uIGZvciBpdCB0byBiZSBhIHNl
cGFyYXRlIHBlci1DUFUgaXRlbTsgaXQncyBjb25uZWN0ZWQgdG8gYSBzdHJ1Y3QNCj4gY3B1ZnJl
cV9wb2xpY3kgaW5zdGFuY2UganVzdCBsaWtlIG90aGVyIGRyaXZlciBkYXRhLg0KPg0KPiBUaGlz
IGZ1cnRoZXIgcmVkdWNlcyB0aGUgY29uY2VybiBvdmVyIGFtZF9jcHBjX2NwdWZyZXFfY3B1X2lu
aXQoKSBiZWluZyBjYWxsZWQgZm9yDQo+IGFsbCBDUFVzLCBvciBhIENQVSBnb2luZyBvZmZsaW5l
IHRoYXQncyByZWNvcmRlZCBpbiBwb2xpY3ktPmNwdSAod2hpY2ggd291bGQgcmVzdWx0DQo+IGlu
IGFjY2Vzc2VzIG9mIHBlci1DUFUgZGF0YSBvZiBvZmZsaW5lIENQVXMpLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+DQoNClJldmlld2VkLWJ5
OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCg0KTWFueSB0aGFua3MsDQpQZW5u
eSBaaGVuZw0K

