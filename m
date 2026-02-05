Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHg0JpKJhGl43QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:14:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61EF2463
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221859.1529973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyEt-0003NF-Aa; Thu, 05 Feb 2026 12:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221859.1529973; Thu, 05 Feb 2026 12:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyEt-0003Ks-6Y; Thu, 05 Feb 2026 12:13:39 +0000
Received: by outflank-mailman (input) for mailman id 1221859;
 Thu, 05 Feb 2026 12:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IOj=AJ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vnyEr-0003KW-Si
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 12:13:37 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15e3c2ac-028c-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 13:13:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB8058.namprd03.prod.outlook.com (2603:10b6:610:27f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 12:13:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 12:13:28 +0000
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
X-Inumbo-ID: 15e3c2ac-028c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjRPERWmfgOZs9I2claEN08KlYRo9o+FHTiIYpQjmrKoFiAkuzqQsiNy/R/ex2/RLM16JxYAor8gUOjBKYWLu8DDgS97H1zAvmYWcLtgd4sjewA/PMbQEtHbUY3CCKe+bDP4A+hE5HmuDXX0+p//Sgx8iS8+dOIkokUQH89WPBva0/6SQg3XglFv4h2tsV4/+LACo3WkEmN2ZUcgF0CMTKySfHTnODdZ6QfIbk6DZG/8LHd3kEoLkaWuNivhb/zVwc/NobRMj8D4wlCdurubCPxNTOcgz2p+4L8VloP2bkWcTCnzEkmYeIftTpZMJhs6J15I7wWHTjK8DOVcLdDurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNUhN9lWdI54/sSo9y/2/3hOHiXdlGEsa4Q3yI/diVc=;
 b=UBNRh4J5IgSMFiPMC3bkCHu3riQQXuTmhuMd6CVVt9PlxkPDBHO54GtyljcvNeEmDAlHkdx0FjWXCtJch/9tDCU+uSS7Ew/vApL04fsaIiVOhxtbseKgFT056zvZGHQJKhRxFIU+SF/fHYGbpwX+rzFyfnXuMzIGsYyOws0i+mz6udfQOXmNClZl9Iv1BPDCLibLf9/d4In15jpIo95pcKjgjoNv7cYKEwjWd5cqYfAMAykXEtY0BoSizsImPeta/qeJlIEUmbA7n7o1UcGGV6PF0+4sLDS30vB90ficfQoXIQkwAcuV3yyRWoPfzy6dhTRaGcIDwT8c4em9YW2sFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNUhN9lWdI54/sSo9y/2/3hOHiXdlGEsa4Q3yI/diVc=;
 b=ycBlZkBZLC1XG3EVuNdJLElx4F06vzyB7mYiQpI17IRo+h5+Cl3vzUEaNdl+sOtawWWhm3zaFNpcYYe9F/gG2hdPRVAD/NPEGNhxv/zgBlYe9IThnjUIDYnHCbFY2qngSQEFulfviKLN7ogcPs3eLUbJwuetjrkd2E9UE7rXd+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f2015a9f-1713-446e-a89e-f75038f3d715@citrix.com>
Date: Thu, 5 Feb 2026 12:13:24 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260205080308.91057-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260205080308.91057-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 125abe08-b6d4-405f-3dc9-08de64aff87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkczamZhOXp2aUNGU1hjWnRTV3dPalBPa1k0dU90aWNDMGhxY3BnMGhzRHdJ?=
 =?utf-8?B?Zy9QNWl1OXJLa1drcVV6UDVmSHhuZGFDa0pTK3V5Q0VmeVpZZVhmdW5tYksz?=
 =?utf-8?B?VlZSdlUrOTVZZjlIeGY3U2s2cFU4bWFPMXFpdFI1eS9VZjZnb1UxV21DTFho?=
 =?utf-8?B?Uy9ITXZucFVUU2g3U1VZSWcya3ZJMFA0S2tkRmZHejJBL3BlL0ZXUDYwUVhR?=
 =?utf-8?B?SkMwODFTSVNCRWdaT2FsZjYyYUFSMEZQclowWWtHWWJyU3hGTys5bERQMTRn?=
 =?utf-8?B?RjMwdVQyT09TSHJuM2lBUVpCakRIMXNlMUxqQ3VkODYxVFY5TTdua0EwNStp?=
 =?utf-8?B?OWlaN0hoQmpyTC9ka1dFRVNtWmY5TkthU2lLNGtLSmljM0hxSFhhclR2czhu?=
 =?utf-8?B?a29PRzQyRmt6end5SmdKaURaYXdWTndqNTB0TnV4T09CTndKUlp0TnphTGVY?=
 =?utf-8?B?emkrQnlUNXpZNlZqVC9ORnhsY2psSDByYmlKNUgxSWRCODBZQnp0TWROcVlQ?=
 =?utf-8?B?dG1pbVpnMVBvOVZDSHltekNDNW5LcHlENVVZa3ZmRDhXaldRcEErMXdPUzFO?=
 =?utf-8?B?b2RCRVFjcGU4YmZ4QVFRU3ZtNEtxTEhKRzFFa0VvemJ4S0tQRExwUGRFdFdM?=
 =?utf-8?B?UHQ5cytVWXhGZGhoNmx3bW1tMnhjeUIwM3ZWcGk2aWluR0t5c0s4WnlCVVEr?=
 =?utf-8?B?ZnI2MXltSzZiQld2eHJhZnN2WFVnZTQ1a3NsUWdodmRrTEhxVkFvQTRrL0xJ?=
 =?utf-8?B?S1UxbFQyR3QwQW1vVlVtMThLcVUxa1l2KzgwWDNqR3ROdGN2TEFsWWlraFpq?=
 =?utf-8?B?UUlJZ0ltQlFzUDBBNFNtZ2pYZFNoRGIrV3ZCTFRjdzJBZ3ZUOXl0d2c2bGlI?=
 =?utf-8?B?UzBKZEdzOVhZWjZCbitTRUtFSDJYOGJBOVpnaXdSbVFMNG1rZG8vZmp4WnJJ?=
 =?utf-8?B?ejhwd1BPSkpqdXp5TndMV2J0VnhxOW1ndUJxeUlZY3JaS0RDdTdUVHVKVDJI?=
 =?utf-8?B?RWlNODFSaVVpSTc1WFpZd1BzRUo1L2txQnBaSzlOd0pRbnFTRUJ1TzVNRVJ0?=
 =?utf-8?B?WS8wNlRyUWgydjdocEFmRlRpQkZMODVsbG9MTyswdTNpeVRNY2NMblNidnI4?=
 =?utf-8?B?MERubDJDYnM2R2diK0MybDV1TTFZbXJjakEvekJiTEoxYWV1Rk9FdDZnVWg5?=
 =?utf-8?B?T0FTWHE2Zk56S3ZYeEEveFN0cFBsaEl2WDBmYnI5MVh0eEU3NHdrQlhaakU1?=
 =?utf-8?B?UWtObXhldVlBZmpxbFFRcnVYbEpNRHQzN2JSU0pFZGF2aEZwc1FvN0sySk91?=
 =?utf-8?B?U2p1ZHVCMDliMEJmd0FBalZOUDE4cGo4NE8zZHo1WXRhSnVVZWkyZGhvUUpX?=
 =?utf-8?B?aTJwd2lMQzdoZ2h4Uld0SlZOMGNVUzZRbWJwcm5ldC95RldOMkhhcUw3ZVBl?=
 =?utf-8?B?M2FmbkpydzZ6Mnd6ZW5FL29yZG1MK3RxY3ViVTVONmY1WndXVWxZTGNsL2ZX?=
 =?utf-8?B?WVhjaURRUFcrQjJmSUJHTzNqZmd2dnB4RWFTOHRrcWkwNGtFcCtyRUFVeUwy?=
 =?utf-8?B?WWNUUEVmSzBQQUNXTzc1NTJlbmVDeVpSeUZFUGlJY2dYaVBMZ0Izd3NCSzJi?=
 =?utf-8?B?MmZQZnNJNjN2bjVNNmpscm9YVWIxQWdrcENScEgxK3dCZHZNbGdDY24rYWdB?=
 =?utf-8?B?SGc1Vzd1R01jYnNicm5nUTM2WWEwU2xZTlBFUjgxRnFZU0pmdlZKVUI1T08r?=
 =?utf-8?B?N3l1MXhPVkpaaGl2Wko4dkhkN2R5QnVHb2ZpbGZ0UzRyZ2VVUUVBZ28xT2xp?=
 =?utf-8?B?R2dyQ095SDJKSnM4ZlJ4bVdpSjY0c2tQN3dVL2xmakNhdXAxV2w0dlM1N3FV?=
 =?utf-8?B?RFZrZTJFcyt3RXRQYXEzWHNhdnlpdjJhbFgzUGhVZnhhOFZSK3VjRmN6c3dz?=
 =?utf-8?B?bE9HZ0w2eVoyZ2toQkhpOWJZYzlaS3dlbDhFTHZJeVBTcnpibmE1Ti9IeXhO?=
 =?utf-8?B?SmV0VERvR0VHU3JJYXpLMzhNenV3Wnc2UDh0VkMvR1dzaml2Y1NVczBJMFFs?=
 =?utf-8?B?R1F6SDVudU1BeTg4c1BpdzFQVkVwbjRFZlBhc08zQTVMZnZFZVlHRUZJTlU5?=
 =?utf-8?Q?f2F8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzhKcUlrMWlNN2F0TDhvMURoVW5BdFpDZExGZTBQQmRNVmhrSGNUVFAzdi9P?=
 =?utf-8?B?WlVNTnczbmNNTUJRa05mMnZqeFZ4bWlsT3N5b015UFNKbDdxRnVVMjVha3RX?=
 =?utf-8?B?bGhXSENJNmNlZnFGeDJObGZ2NXF3SEF3VVdyQmpBUi9URFJzY2hpYlFJbThV?=
 =?utf-8?B?Ymk1MlhYbm1LS2tpeFpsblNPVW9jMzE5czdaUjVud3F5UmlmaGpDMS91enBs?=
 =?utf-8?B?aWJkbktzWVpFV25CQ3hMbVZnU2dsdW5Hak9qWmxaQVppRkxmK285RUtGQldC?=
 =?utf-8?B?cVdrd2h3OXZuQjh2SXAzZnNnYnRpOXdoYXBBQ25la1EzSnI3cFI5SXk2bVlY?=
 =?utf-8?B?L2VadTloM1VLLys5YkxsZlA2NnBiRUZ1Q0w2amQ0MkYvZ3U5Y2NoZkZTc1Y3?=
 =?utf-8?B?UkdvSWhQOFAwZ0Y1azZ1SUFQai8zbGZKaWkxQUMxdTRITnFkKzRQVDIxcThU?=
 =?utf-8?B?SUJPdjRvb29CK1J1VE5PV0VvT1Q0TVYzR2gwWEtxR0FrYkdyV3dPMG1BcGsy?=
 =?utf-8?B?bWdMdWoxeStwVG5tTjVCd0V1MlBMdGIrT2dCS2VGRk9sSkVmcGV3UDI4Mlgy?=
 =?utf-8?B?OXR0aWFkYVAvdzNoeDJ5UlZyanNuZjlweUlHSVVCVkowS2lPREtxcGlPT0lt?=
 =?utf-8?B?QVVvamo3WGxKeXo1RkNSZE4zS042UFpFSlFIWjdCd3JlMlBXelczRnBuZ0tm?=
 =?utf-8?B?eFlMQ1JEMjZFQi9GaGJvZTFXb3podStIYzBGd3B4OHk3RFFpaXIxZjY2RmdN?=
 =?utf-8?B?cW9RakIrd1J4ckRabThkQUc4N2dDekMwVDAySDd5MWVmZnFSb1YyZmhGb1cv?=
 =?utf-8?B?MzlleUJiVDBEQ0dHMGVzRzRyaVI5LzFVRTJQeW5HdjlZUXhYZ291MzZIVDNw?=
 =?utf-8?B?SDNuTFBxbXJUTmVBaGE1TktESDNHZDJXNm9PUnh5aFZqbEZQeDNoS1hrMDd4?=
 =?utf-8?B?VTU1UWZvUmhoVU1hVlJyZzdIdWJZRkFkQXlUWStXWldJWjA2NkV3dVV1WDh1?=
 =?utf-8?B?RVlpL0pkVjNSbU5DWnBuY1ZPYWtpUkg1L1doRlNJd3IrSlBmWkVoTm43Qm50?=
 =?utf-8?B?M29RT3NZTjBiUDhqRkdLWElhUG1DZFREMEtJQ1ZNNHJqanZzTVdQS1FWcGR4?=
 =?utf-8?B?YmdpenJPTGRwOHF0Qi9SdnpQeUhXOGgvVklPanlOSGxHcVVyS3FTc2hEcHJX?=
 =?utf-8?B?UDRRa0VWVnNLekpHMG91RXNWQmt0U0cxc0NmM2h3T2k1MU4wVGhsMjVtY2k2?=
 =?utf-8?B?dVU1TmgvbG5TSHlwOG1tMlduSms4dkEvazUvMnd4RisrRVhDUERYT2pwQ1Jq?=
 =?utf-8?B?dTRIZ1JwQytadkpBQVVTS1RUNDlYeUk2RkNqMFlvZTJtWjBFMk1rWXFaRDIx?=
 =?utf-8?B?ODNOTlZNQThZUkU0Z2kyUlRUYjNOa0tnOVAzWG5mdi82R2MrY3drUGs0ejJo?=
 =?utf-8?B?am83VFVlbERYa1FXckNnSGJENFZJVGtVbVRxVFQ4bmJTWVJuRStNMUZ2WkUx?=
 =?utf-8?B?ams3T3VXRXkwQUtNbGZjYVRXN1dVWkx3Z1c4cTZGcE9kV1hIVHIwOVBBWnRk?=
 =?utf-8?B?TDJBRGRra2l3d2txOGE4VC9Ndm1zakMzYTlGNkZSODB6Skx1Mk85aHBOTkhD?=
 =?utf-8?B?ZG1uVk1KUmUzRnRRakNwT0JydS9ZUFY3Yk9rNVJNQzAwNXpuVjZjR3lnYVh4?=
 =?utf-8?B?V1VZS2NzWWFHcVZMbXJUc2ZCeVQwL1MwVGYxaWRhbUl2UmJrU3lmSkh0M3Fm?=
 =?utf-8?B?cGNVZytydFlkZS9NYzZzK283UUlvVjhvUWRZTHRvOWphcjRlczVjbGFPdmtv?=
 =?utf-8?B?Zkk0TmpZSVN6YXZtMVJFaVJQdVZDdWlLajV1WVJRWW55cWZCRjNMK0NxUzVU?=
 =?utf-8?B?V1lhcFh2dXM3VEhiYTFGVHYxTUdPbHZIS0lBWk80UWdTUHZ0VUhLZnRSZzIx?=
 =?utf-8?B?bDhvdFhJWTlUaUhnc3VVOWZnQnJ0SlRmaDJSaUNjdWxHZW5NNzd5dzl5QVJn?=
 =?utf-8?B?d3hRM1ZTKytOQ2tuaTF2TElBUFBOWVRRL290cHBreGk4ZkVpK3dmeXUzRFlT?=
 =?utf-8?B?L3BaM2FYYUZDcm93aEhjMFkrWVV2bXh3VWdkNkVUWlo3MUt5aDdxMnRpVlQy?=
 =?utf-8?B?YjE5aEh4R3dTeVd4ZjMvOElwL0tPSEtlRjVWTm91QVZKS2toNGNKRmR6SDBx?=
 =?utf-8?B?dWF2R1dPTE5RdVRwQlRCNG16Z3lHdk9GSjYrQ3E3YllWd21SZ0RMWEpKVTEx?=
 =?utf-8?B?WE9rcUR1TmJHeGMyazBlVlpwYzJVbVcvanQ3TG9vT01xREJlTEMvZlFuYVZ6?=
 =?utf-8?B?MVJlMzc4NkpiSmVhY1ZqM1cwWGhjOTdFTEd0SDhXc3M2SUxsWnQxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125abe08-b6d4-405f-3dc9-08de64aff87e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 12:13:28.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kx+COh2NmpOMm38RfFVwVGlREwsKCAXXTgSPlFEUylDfszZGECiOW7oZ9RkNZ2aCLcWVkuR6Ex8jfvrQFcaGG0Ohi0bbBtwZlwJwZFuNuKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB8058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DA61EF2463
X-Rspamd-Action: no action

On 05/02/2026 8:03 am, Roger Pau Monne wrote:
> The limitation of shared_info being allocated below 4G to fit in the
> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> start_info field is 64bits wide.  HVM guests don't use start_info at all.
>
> Drop the restriction in arch_domain_create() and instead free and
> re-allocate the page from memory below 4G if needed in switch_compat(),
> when the guest is set to run in 32bit PV mode.
>
> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

