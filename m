Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2B92CEE3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756743.1165467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUI7-0007xw-PG; Wed, 10 Jul 2024 10:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756743.1165467; Wed, 10 Jul 2024 10:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUI7-0007vO-MC; Wed, 10 Jul 2024 10:11:15 +0000
Received: by outflank-mailman (input) for mailman id 756743;
 Wed, 10 Jul 2024 10:11:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O6Uk=OK=epam.com=prvs=39211ffd58=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sRUI6-0007vI-Ai
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:11:14 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbdf0fb4-3ea4-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:11:12 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A8JSMP013655;
 Wed, 10 Jul 2024 10:10:58 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013011.outbound.protection.outlook.com [40.93.64.11])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 40943smn1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2024 10:10:58 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB8769.eurprd03.prod.outlook.com (2603:10a6:20b:550::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 10:10:54 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 10:10:54 +0000
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
X-Inumbo-ID: bbdf0fb4-3ea4-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2ifTAd6GsYr0UjpBSZX2i3JU7CCXxV6bJddOCNth5CceLIPgkyYVKNxllB6I2pog3aPmo3jAqIu00Y1aMAxFYIk9Ycq9/5wkFFM8VMpNaG0icpJzrQCHJWW/4fSQtzKLaG6plb6H43WQ+uaqxuxs6GczfmntC18T5j5Qt/RF3HkeIY3oRZuk+ZI1JwXyIceIKt4rda0eb+021S3h5vFzo8Mq8WAcpXZt0PEk+HLUdD6+9NfaW0UUM+j8MbI3cQQH2kojW4M4RZRsKHZIFg37VcBNUaN2vCYgtV8gINRaJfqbYvB2z4Sl1AXjrsBrWbxpCyqmxHWOXrjQbKtYjM+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERDALx3/dNAIti2FoW9con7z9jmPBqC88euLxc/I3BM=;
 b=f+Om5fRIm21PQIOt9nPrgvGA1PcCNJerUW7z5khnNY8ogIrrC9HN5ssr2H3P2wydIMLTbe0EOFM9WX5kfMNA2ODgmSk+KxN7TdjXYBUbLZ5B/TU7edXpgAX+HwEET3VPSlIQKt/k4DiWFUBxsH4CY9/rA4mvOjyKvihGvJnkIZ/7W2cuq0wZgYtw8Xqmb6HBAxxNdZEJtx03geNS/gxtoFiC+5jZtbF1yrPkoCJQnISGUb/7hV2Z0qgYVg2CHwOhUyOQr4NcJlhvJFmNmCUv87yN1bLn6MqZ/NlFYkp2Hq0hxzpnSdnDGQtoQzBFEVclDyWgTJ966t1Rn+Wvw/ZwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERDALx3/dNAIti2FoW9con7z9jmPBqC88euLxc/I3BM=;
 b=qWBhTWobgcnamB50r1PxawN99JajPL4crRjCKbxbv4iNoK2hvzVV2PMa0nmHIsW5Nic9aiQMY4AfSV+dx6b8uxGtH+IVdCEARRDVwFUCFCDeMaaq9vFy7tCpxZpSBZxA9KHIdM8c28QuQn07SwWs4J26NKlO42rRDGa5eleHh6ijhz+d/3N4H022UgGl8yalBv2HKkIWI3FJuaefluYyFhJVPHOaWoSmfqLKiLl7M20YSThdACSQ6jGfhV+kpvUvbJBFBcNo3HCEML/68wPSU8HoG9BXyzXOwpbyNBnuYXZQrR3Yob5bLiWQGQFx8hyyHC8JGdIvD+CrUBQjYlYfqQ==
Message-ID: <6fc22816-5f2c-4f87-a86b-09363f254e05@epam.com>
Date: Wed, 10 Jul 2024 13:10:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 12/14] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <e6e0f30ea69ecfed4d8de531fc42162162b3f6e5.1720501197.git.Sergiy_Kibrik@epam.com>
 <5fad5c8e-a7f0-4536-86ea-b74a3116d122@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <5fad5c8e-a7f0-4536-86ea-b74a3116d122@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS2PR03MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fa95ca-7389-485a-e901-08dca0c895b3
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L2R5S3JDVm40bXVZR0w1eDNkU0F2b3RWaTM4ajNidURvaUVPa1pzOUdadlcr?=
 =?utf-8?B?QVhxUEJFVXBTVnJuWmI4TWtWWDJtMGtBaUZUeDUzczAzUDRvb1hDRUhCUDhS?=
 =?utf-8?B?cVU4d0RGWlg1Q0pVQVlrSzl3bXVOdFZnYlRkTHUzdDVLa0gvUWxWUjRZTDY1?=
 =?utf-8?B?WS9QUjdzMGpBV2xMcExPM04rTWJEMDdQbGJtRHpYUjBsRUVTRUoyZEs5ci82?=
 =?utf-8?B?ZkhTZ3pGSHJ5bURLMTRzTko4MkhlTE9haVAxOGtGTEJJQ3ZhVU9GMldHRVVk?=
 =?utf-8?B?TU9adVJyUnJCY1ZFNFhINzUxbERDN1A3MnhNOG9LelM3NmZaL0ZoWnRsVm9a?=
 =?utf-8?B?YjBZVjl6a2JKdTJBOTFOMi9TazNudi92eUxxbkJFYll3NnpZOXJDajhGUUFJ?=
 =?utf-8?B?NEFsdUtNSnM0eHVnUlBzdytNV0p3NDdNSFlYNTdNR1MwSW5DSGZVV2tvMnZh?=
 =?utf-8?B?Z0xoWFo5Rmk4NFZaTllobEkyb0tsQ0taUzk0c1F3TzRBWnN6bWloVWlFUlA4?=
 =?utf-8?B?d1dCZ3dCMEh1WkRJSVpJRGRQQnVNZmlNdkpTMnFIdUVBbW5EUy9FYldOd1Fj?=
 =?utf-8?B?cUtpZ0p1TVhpTnVSTXYxTnBSRkp3N005WXY1MmlXUDdEZVBUMUR6QVBjRFph?=
 =?utf-8?B?bVBKL2FxeEhrZzQyVXNDNjFIcy9Mbm13RFZOdHhxUUJOTHBGdVNkTlo4Nzk0?=
 =?utf-8?B?elAyd1EyTG9PaVg2TDBpQ3YrMDQ4MWNOVHV5ZXk0dEQ5b2dnWUtOazVuRlY5?=
 =?utf-8?B?eG4wU1lHRVg0TGhXWjNId3hhNUlCN25VTXFzS3c4Mld1UkpWRXVsSmxJb0VV?=
 =?utf-8?B?VmNuQ25GQ01XckNsMUFZQjdXVnFwTHppcE55OENadkdZdkxveEVmZEhFN2FR?=
 =?utf-8?B?a0djdkFjeVBFdjVMaDREUjYvci9ua3NnQmZmOVdNMmZpbjY1STlQQlJwZFlt?=
 =?utf-8?B?RldWZDV5b2MyR2hPVmlqTnpVN1h6MDk4MW1oUElOS2hyNWxNdGFXRnd0R2d3?=
 =?utf-8?B?cGVoRXVsWURqRGJVMWlTWnlRS2lMbWVNVk9DUkJsa241emZKWGIwdHNaeEd3?=
 =?utf-8?B?Rkt2K2VmTnhEN0hXR1dCZ1FwSU13bEY1dzJ1Y2pONFJmMXZGVEtvUTlhbDFo?=
 =?utf-8?B?YmJkWDdMczZWanR3RmxnOWFUSEQyb1ZiSzlGRDBsbUN3RVB1TjlleVp5SzFC?=
 =?utf-8?B?TnZvSWlyY3h4K3hIbVpzZkV3L0VTY1FCNVNnT3JQZjJsS3dBMGNRUnJCdnk0?=
 =?utf-8?B?R21qU1JhVlUxOW0rOVBxcHc3OHNmUEJoa3dvSTM3OS92WW9yT29ucFVoT0JL?=
 =?utf-8?B?cDJ2cTJPT3FEZ2kwTjBDYUpkUmdSdW9WbnFXd2QwUWNUbjEvY2xWNFBjU2dV?=
 =?utf-8?B?SjdodWRNak5Ja3U2Tm9qeVBZVW1rOGErcVlla0ptVHdTNXowQkt5cVEwTjVv?=
 =?utf-8?B?M2VXdWRsYzBWU1lTK3ludHB0cnBSNkR2QUxLWkdBMVUwazJZczBNZllsemxw?=
 =?utf-8?B?bkFOa1dIanZBVDNlclY3MjhEN29zaWZHVUZEbXBrcmJIRFd2Z2ZLMHlLdGlt?=
 =?utf-8?B?KzVlNHhud3BQelJRZHl6RkpQMFM0a0pGcTBTUExyV0I0dmE4N3ZWWElQWHVW?=
 =?utf-8?B?ci8zZklTUTJHT2JyelJkUjdjbkkvY2Q4NnJpOFMyWnNUMHd6TUZnNDJSeDZh?=
 =?utf-8?B?OWJLckxlUEZXc1NieWZkOXNFOGlub3F4RGI2YUlodDk2M0UyNUdFckduNEFm?=
 =?utf-8?B?M3J5QXV6d0tWUTVOTkNOWGwzN1JYWFVaNjUyZGluanM2U2EzcENhdWIyb0Fz?=
 =?utf-8?B?NTkvUXEwY3hYK2Jvc0FnUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZExvK2MrbngxVDQwdjRjSTFDdnZLeGZEclhJUFkvYm5IamVEVEF6alI2Rzcw?=
 =?utf-8?B?NUIxeExjUmM0ZkJiRm02LzdubWNzT3g4VUJlY2xiM2luS0ZWenh5RjlXR0JN?=
 =?utf-8?B?ODZCYVU2MmNPRmtrMFl5TmVSelMrUmlSKzBCM1JaRWRwc2FLVm1Gb2ZhYld2?=
 =?utf-8?B?cGphRDhqczEweXFoNWo3L0wyNmtKYmw1RXhwM3E5YjNXOGV5OHROcFArMGQz?=
 =?utf-8?B?Skk5NVdTeVQ5SFVDdlJzSDVnemtZR0Z2eVo5V1NSVWxsVStnY0tFMDlpNlg3?=
 =?utf-8?B?anlkQzMzYzl3M2MrVGFoMHV5RzBKMXA4SU1aQW0yb3ZqWGdxVFA2Uk9Qd04v?=
 =?utf-8?B?VWxrUDM4K2JaQXpuU3FqWGVoZ1FQWG5QNDhSSkxYNVN0aEhYaXlMUDFPVUEv?=
 =?utf-8?B?UHk2YVZtS1p3Y0JCQTlZeGZ5ZlZoRG9nMEZwbStzQmhIQUhDVzU1SnBIS2VU?=
 =?utf-8?B?bU9Xak13dkhPazN4RkxkRUcySS92NUU4ZzBVV00ra0lFODZUSjhsRkJWSzIv?=
 =?utf-8?B?STNOOXUvaFVvUm10V3Q0K0xkL1RBT24wdG16OGFTQW0vQ2V4Ly9sNW0xZ3pm?=
 =?utf-8?B?cWx2b2lWV0N5YmVvZkNSU0NubnZLcUxyczhRMmlDMG5OcXdHTS9WSEpmeXEr?=
 =?utf-8?B?UzV0dlJDKzNHVG9wUitiR2NOcGVFQng3YTIrMm5JR3M3TlpRcitkL2hjZENn?=
 =?utf-8?B?aXpTTmdNS0FUejIzK09zNlBnTTJ6SWVwNWg2UDE3bVZRT1lGeXhvYU11RHhH?=
 =?utf-8?B?cWkrQzhEQ3BoK2lWNExrTCtDMWxqMVNRODI1NVdqeGw0emRYZUc3a1NtUzNI?=
 =?utf-8?B?SjlHaVVzOUhSZ3NJckttSENYVStoOEx6eXFyK04yYnNLTnZBZ0FCWTJuV0tK?=
 =?utf-8?B?WTlFL1RZMTZxaW9yUDIyYU92SWFXSGVobXhneWNvWmxZUWt5aGJoQlZnWm80?=
 =?utf-8?B?Yy9nKy8rSjk4T3VXVzNOUW1VZjVaR2ppVTR2R2NWbG50NHBHQkhTNXAzZzFY?=
 =?utf-8?B?bUFabncrenJUdTBWSHltL3N3U0x4NGlvbm43clRMNEVlZHRNaEZIL09tTTVw?=
 =?utf-8?B?R1ZmMjR3SHhXcE8wbDVBSEVFZjNiVjd2OEFTZmdMK1VhWGZwdGM0dTNJRUo3?=
 =?utf-8?B?U012Ly9OSThPK2E2a2pVSlZIUEJnYml6WmFuM3NkUy9Xc1krbG83Q0xldmdI?=
 =?utf-8?B?Z3d2Tk1Ic1JTQ0s2SE9sSjFKSXlBWVBZeC9TVDBjaXFiVDhFQXRZd21SblEx?=
 =?utf-8?B?Y0dSTW9SeGxQV0JYUTBmZTRESjQ4cDBtdTJNSFF2OHJPaXgyeE1kTkRCWnJo?=
 =?utf-8?B?bHhpU0dCaEZCL2E4UEV2ZW5IcUc1NWZrMm5yRGZkR01CenNQamNvd1NCVGl4?=
 =?utf-8?B?SExJMGs1aVliWHVZRmd6M0tVdUlCNjBVMmtKNVczM0h1LzdoWDhQUTBnUmN2?=
 =?utf-8?B?TlNXLzd4WGVwVzRwZis2Q01lYnhwUThpWU56SUJhVHhkbU9tTzlTWCtWT0wx?=
 =?utf-8?B?ZlpzS1NoeE1MT3ZCM3gwT2dyS1RCbmdjbG5Wak1rY1hERjhPcldmTVppajBW?=
 =?utf-8?B?cEdIMGxaMXBkM1VkWXJ3RTRQN3k1ZHlxcTJZNjBXUTdGS3owdU5ONXg1Mklq?=
 =?utf-8?B?RjN1ZitrNkNsNVZRK3lsZzdydmYremRDYVNob2t3alZramVlaGU5U0hwR3JB?=
 =?utf-8?B?aE5iZkl4M1ZvRmxNN3VlSGNxSUt4WktEMHkwa3dGa0Q5a1JKdk5WS3hKNzZK?=
 =?utf-8?B?Y21YdW5mRkc2cWNuZDQ1UzdGcUxWUmM3VFlOWFArMlRYaWUwbG81WFlFUVZY?=
 =?utf-8?B?V1V5bFZzcXhNM2FCZEgyUVlhUVlCTzdJSjZkVWhOMDBsUVl2cWdhOUgrWGZG?=
 =?utf-8?B?RU1YeDZOVkJwNXc3NC9QRU9ZVVhBd3ZXcStsUm1sMmN5M25XQ0t2cTFZY1RI?=
 =?utf-8?B?SllPTXROTzQwWkowNG1XRG1tWFZHbnJiZFA1cHY5YjZJR3BxVG80Zkd3UTNa?=
 =?utf-8?B?MkxFZHp5eUk2SVg3ejdmTmJHclArVU95OHNzVXhXNDE1cHFZWS95c29HY0ZV?=
 =?utf-8?B?R3FnV0N5RjBCQThWeWNhUTVWc05Rdk5xcFBTbFhVMWRBa1dTN1hwVDF5NUdQ?=
 =?utf-8?Q?QYsjDcU/NN84jdFzPGgyb62Og?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fa95ca-7389-485a-e901-08dca0c895b3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 10:10:54.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0ck9L3Y+jlbm3jQBT8kCxP4tsE6oD9LDVSaFE/VD0XF/1J1SjfffnF8uwkr/WYoZwcC4Jp1n7lDhgyoyvYIVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8769
X-Proofpoint-GUID: gKzILvDHJLoA-fttwEaI9mG-pDWcpALM
X-Proofpoint-ORIG-GUID: gKzILvDHJLoA-fttwEaI9mG-pDWcpALM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_06,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100069

09.07.24 10:28, Jan Beulich:
> On 09.07.2024 08:09, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/include/asm/hvm/ioreq.h
>> +++ b/xen/arch/x86/include/asm/hvm/ioreq.h
>> @@ -13,6 +13,11 @@
>>   #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>>   #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>>   
>> +#ifdef CONFIG_VMX
>> +bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>> +#define arch_vcpu_ioreq_completion
>> +#endif
> 
> Putting the (or some kind of) #define here is certainly fine, but moving ...
> 
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -111,7 +111,6 @@ void ioreq_domain_init(struct domain *d);
>>   int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>>   
>>   bool arch_ioreq_complete_mmio(void);
>> -bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>>   int arch_ioreq_server_map_pages(struct ioreq_server *s);
>>   void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
>>   void arch_ioreq_server_enable(struct ioreq_server *s);
> 
> ... the declaration from here requires that all architectures wanting to
> implement the function need to have identical copies. That's unnecessary
> risk of going out of sync.
> 
> As to the #define itself: It expanding to nothing means the call site
> de-generates to
> 
> #ifdef arch_vcpu_ioreq_completion
>          res = (completion);
> #else
> 
> which hardly is what is meant (despite compiling fine, and it likely
> only being Eclair which would then tell us about the issue). Further
> there you're also removing a blank line, I don't see why you're doing
> that.
> 

looking through these changes once again I wonder why can't we just move 
stub to the header like this:

in xen/include/xen/ioreq.h:

#ifdef arch_vcpu_ioreq_completion

#ifdef CONFIG_VMX
bool arch_vcpu_ioreq_completion(enum vio_completion completion);
#else
static inline bool arch_vcpu_ioreq_completion(enum vio_completion 
completion)
{
     ASSERT_UNREACHABLE();
     return true;
}
#endif


and avoid additional pre-processor variables & conditionals, because it 
looks like we do need some kind of stub that does ASSERT_UNREACHABLE() 
anyway.

   -Sergiy

