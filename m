Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFF2IDf7eWkE1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C3A0F91
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215574.1525733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4H3-0000lB-H9; Wed, 28 Jan 2026 12:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215574.1525733; Wed, 28 Jan 2026 12:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4H3-0000jg-EZ; Wed, 28 Jan 2026 12:03:53 +0000
Received: by outflank-mailman (input) for mailman id 1215574;
 Wed, 28 Jan 2026 12:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl4H2-0000VQ-MW
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:03:52 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 690e71cc-fc41-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 13:03:52 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7357.namprd03.prod.outlook.com (2603:10b6:408:195::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 12:03:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 12:03:47 +0000
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
X-Inumbo-ID: 690e71cc-fc41-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weSqEPKlzUVex2kMgRj3aGweRzcmUB1WaXAH2SdpR4iqro8Ih7SSz26YGj0IsmDD1kmbwem/2BqYMZELwONNz2Bk5w0x365ymynsyMwg8cOO4/OAhT7WIqXiKvGMjtmuQ9sokJ0dQhLQRqz6qOEHlS20ulo81sNVv2U4yhKkU3J6Z04vYyl9hEm29j+zq4XLCXry9mGZJ+2NMk9wohKXftGTewYdPrSb0P5m6Pin3MmeapQuC2AHIvMqwyxjvzbqH4vOv/Rtn9pNWVV4F8XH7G7QG3wxCUJRTjkiDVcczkafWUxWm1sGDeS5Z3rQ371XPftnxaLopYpqfKNF+4mXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGFKVF0i2wWigbiwR7BNTdhzq53D/kNouGUmcPEvNic=;
 b=uDmppB3y6Pb5eqg77P7eYtO72Q4sTTs0Mwc93CD3I85Q/YNzSlwoEj+JfJeSbTPqTyGRqHujqOeF/oEe4zY4HAN1aN9EZHh77sjgVlr3++zJ6KIxTIqFabaEO+Koze2FwHKfBvONgVHG21I/1VLHg3beOoE3AA3VhGsKu/U9S91sYZaTUetqec6+i1YPsS9YuM/7pyaP4yWoK5JUnZ7uGzVKM0DUXEVay4FZYhsMFLfzWD4vkJ22vZHCOw8YD/cRLRtb69sLk160OM27FGIrYk1GG3dhz6DUTauNrLwByOioohmuxNmogwIaOPGcKEA64ikmlSfZqAfLNxD+fjpslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGFKVF0i2wWigbiwR7BNTdhzq53D/kNouGUmcPEvNic=;
 b=OpBCIn1htQkOWlM2gHkr6c09DS+/XvIF2QMRr6Vj1OY5gfKav8NhyL7z9C6LM1tLFWixK//xmkZC4oWAferJeFeSTkEEzXkLGyH0Pb9pKkRxh2nE99gWC0GrhS1SMvXed1X72Pg4m37LWouT11QS8HRGi9PSgnms7SFF08xzW2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/3] xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
Date: Wed, 28 Jan 2026 13:03:37 +0100
Message-ID: <20260128120339.47373-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260128120339.47373-1-roger.pau@citrix.com>
References: <20260128120339.47373-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0182.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::21)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 588aec5d-2056-440e-b27e-08de5e654b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnYwc2pEOUlJMXVObVJFRWRmSXdXOGhra2NwOWpGamxMTXVkOUdyck5JTExz?=
 =?utf-8?B?cWxsSzZRQ0ZYUE9adDRaZTZETG9lazZPTkdaVE1HVnFXRndqRUtlMDBteFFZ?=
 =?utf-8?B?WTRibDFGT05nMEdEak1LWVNGaDBlZzJKRkZjamVuVis4OWl4WFZoYnRybzd4?=
 =?utf-8?B?Z3NZVnNaY0h2ZkVWbklTK0ZnQ1dMNUsyUk53T3c2S2xFRHA2bUxsV04zMVZ2?=
 =?utf-8?B?WEJUa1lBV3JZR25LazZTS0VYdWxJRjN5L3hGOS9LODJTUHE5QmwzcldSQ3lR?=
 =?utf-8?B?ZGg2cEl6bVdHNi9wSGk5MlNvU2tkbzdDZWM0OTArdHQxMFhLNnp3andRR0xR?=
 =?utf-8?B?T0Z1OTNhWStFRm5TNzJRTFpNZ0lhbktNS2N1RGp2SXJXd2FDSW9yTktTakxt?=
 =?utf-8?B?M0M4Y1loc1pEZGpUUzZSNjFYNFVWL1FvUVhVaU9Pb2ZuQXdRaHlUSm42YkM4?=
 =?utf-8?B?ajBJelowYXp2cms3SExsSFZId3hqVDZiZStBTnlicmNvMjVqWFhMc21jbG51?=
 =?utf-8?B?UVFXRFMyaHhERkFZY0lyQng4cE9URm02NWw0aDhoaCszOFhjNFBxNjd6YVhm?=
 =?utf-8?B?NWtHUmlzSW1uRzY1OVNONjNWTzBzdmM4akFKL0dnb3VaMUpyRnNiRC80VXdE?=
 =?utf-8?B?TzdLaUh6bk14Mm5LMzIvc3lkZU05eHppc2tGSVN6NWI5c0g1WjBPOG16TWE1?=
 =?utf-8?B?djFvNDNkMXpvL1V4MWVxTXFTclplQXBEZE9VbWwxd1hoQnFna05tZTJrdWNl?=
 =?utf-8?B?VXRNdmpwZUZpSGtKRFJCdlVyTHhWY29aaEllY09lNlZhYUlobEpOSGE1UXlC?=
 =?utf-8?B?QW5SN1hFblk0bmZya2lxQm5hSEQ0WVN1SytFMU53SUlWL3p1MGRiVm9JWWtW?=
 =?utf-8?B?Ym9LQWdwL3pLbW1Wd1h2TDlrTzFYRElHKzE5TEJtSThVSlIyOEh6WEM2YllM?=
 =?utf-8?B?SlBHM2IwK3VUMTExNUZNMTk1WmZwRWx4R2dLVFRJbERscTVNK0syc3dzS1Mv?=
 =?utf-8?B?NWNJYkNIZXNqcGZyQm5yNHRYZitpZnpZN1o5S3hGRnlTKzNhTmYxYzVxN1pm?=
 =?utf-8?B?V3lNb1F3VkREUjBWWDR1ekRmQW5yYkZBRVRIMUtuYmtkZlNmeGtJaWI2Um1p?=
 =?utf-8?B?eElhVmdIeVFld2VyM0VVVG5CWkU3RVNXSVBKU05DYWo4K21oUGQyMkt0U01n?=
 =?utf-8?B?TjFNSE4yODJxc2IzNHREeWF5R0VoUXRjSS8rUzgxYW42YWQzSCtUZUtLOTFC?=
 =?utf-8?B?Wk5VcmFWRFVFSmVnU290djY0RmxCQlF1OTEvU3FQSDI1MlVnNnNHSCt2a0dF?=
 =?utf-8?B?SjRVMWxnNW4rVzJFbm9QSjEyMUVzSW5hMENHL1pLQzFDb0VTb0NPSzJvazhp?=
 =?utf-8?B?ZCs0QzlMV3dlamx2bXdVM1NWVkpJZ0txSHc0d1ZGQXA2UEpPSW9lZzhqemlZ?=
 =?utf-8?B?MVhFc2Y1MXpZbFdkTFVBLzlQU0svb21DcFR2ZGpJS0I5N3RncXJLNFN6eHV0?=
 =?utf-8?B?aFUrS1lsWlhUb09QZ2RadGpUa2ZWbkROdHJ2cDlHNFNBQkE3ZjBmeTlOMDFI?=
 =?utf-8?B?S2tsblROdkdtSG9qWmptNitrTlZhVjlWNlFyRWR4VGYrckpHNmd6T2J0UEx6?=
 =?utf-8?B?WTBDNThjU0UzRzB5Zm9Ud1pWUDdhK0VoclJxMXFJZEZFb1JrS3VhaGZNaTBo?=
 =?utf-8?B?SjM3dTF6T0V6YkJiSUliUlkvZGpJTTRMVzZsYWtiUWVZRVFjYy9COFpSNEt4?=
 =?utf-8?B?TjA3ZUFrRlZaWlZZQ1FndUtVaVNockNsalVWbXJFTDNmb3hQOTYxM29ONmtO?=
 =?utf-8?B?UVB6YlJPOW5NdFFyM0pwV1RZajZUbWpPbFAzWittUEdnT3ltQ2M5YStJd0cr?=
 =?utf-8?B?bTdGL0hTdWFWVHB3UVk3Wld3MCtEMGtjc2pGWjI2L1R3dGs2TnVQdFVMOHdH?=
 =?utf-8?B?MU85UUZYQkFvK09helJ0TEVaU1FiNDllbG03aUQ4RE1Vekp6c21XQ2cxR0dz?=
 =?utf-8?B?SGc4dHFSelExUitFVml2T1I5N3ZuM0Q0TCtVNWYyQ3hxNnpFM3ZCeDVwVXk1?=
 =?utf-8?B?MVJtUThBT3hWdDhNZGMxMDlCbmxpSU9PUDBDS3hTdktneTVXY290eGFiVU50?=
 =?utf-8?Q?D+2w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjlETmgrRUJtbGlZRVdJOVovczJ5Rng0WFBxL1RRYlB2UytLNVV2eWNYTzlB?=
 =?utf-8?B?K1JwWWF0OEowMDF4VFJ1OHJSRloyM1lRQitVQXpKcGxHR2JVeU5JbmZlNFJq?=
 =?utf-8?B?VXloejBRSjdkT2d4S1NPRUpRcG1tRDNmK0R4ZHQyTThpMk5RYjVJd1Q0OFBu?=
 =?utf-8?B?K1FYNmtLODdLcExEM09QcU96WUdmSTlza1Juck5mZDNsTXhMNlViMFRSckVz?=
 =?utf-8?B?bnc0SUhLNWlFVG5QNWY5R1hPVHMvZVFLWTJJQWNwclRqaHRIRjJqU21Tcksy?=
 =?utf-8?B?citMQkl3QTgvRVRXbmdqVHlsL1ZYQ3F5WTBCUnJ1TG9HM0lSaTFGZ3J6d2FG?=
 =?utf-8?B?bjUyRFZkQWljVE5uZG1LSE1hTFZ5bEdXdWIyTi8xdGtkUGZkYW1rOWpGV2Ni?=
 =?utf-8?B?bE1GRGEvam43L3FlZ1hSR0RyVklvcW9JODRZdHRsQlNqeHJrUGxzb0kxWHZo?=
 =?utf-8?B?Q05samVncngxalVaSWhRQ2xwRFFqazYvS0ZDcExoTjVQWlFCdjU5Z2RMMFd6?=
 =?utf-8?B?bTY4NlgxQ1BFclhySCtCOVdDS1crTENHbGpHZTRsb3NOQVVQeVlPQVNEYkli?=
 =?utf-8?B?OS92dS94MHIyRHlOQnVyMUlmY2dlWmN6dStsaWRRK2JPczV3M3lVUFk3dklO?=
 =?utf-8?B?REs5ZDBFRTE5WVZ1YVNGaW1zaDVSMVordy9QcjBJK1ByOFpTbDZ5WFdBcHU5?=
 =?utf-8?B?T1pNTjBIR1laMWlsenFsNnNJUWt6N2NGRmY2MlJYNnF5djdrbGpmc0NKREsz?=
 =?utf-8?B?a2hQN2pUUE9reWt5TDQ0bCs1WDNyZmU2TXl5MTdkbDBVQm1LaGZoeXUrWC9r?=
 =?utf-8?B?K0RCMTZVSENxMjNVVzFHby94MHBicDM4bVRleG5UVWp3M1dadHVYWEoyaW1p?=
 =?utf-8?B?bGltWmFIZlBTUjNkWXpBaEpUbzhuakNBWmZhNWRIVCtiaTA1Ti9HWDQ2a09N?=
 =?utf-8?B?aDBEVjJrU0ZJMjdqOVk3ZnlSNksvY0ZmZ3FPSlFHdWUwSDNzQzJhVDdCL2Mv?=
 =?utf-8?B?bllyd3VRVFlJM3lWTms3em9SVGZxdElxaEFlWXJLWlowRzdRckY1cWkrcnVQ?=
 =?utf-8?B?bURvalVtcFBxRjBmcGRYQlpYdEVMZHlEYTFEUEhBSzAxVGpWTERsSlYrdVBz?=
 =?utf-8?B?Ym0wcVVmTXI3VTdLdTdDMVpHbVFnSm5ObE56cloxTkViZTlnQjRKUWpvQmRz?=
 =?utf-8?B?emdiWlpYS08zdGN4aG1wLzhUZHo3aThKeGJZOFBtTGx4SjRMZmFoOXUxR0xv?=
 =?utf-8?B?L0xDdEFHM2xkeUk0TlhiUldyNmFxSmU2TmdVQTQweE85QnViS3A1dyt4ODM1?=
 =?utf-8?B?NHNCQjVsQy80R29LbDFmSkRHNXhtcU1WVEJCVmIyTGtFSG1EVHRhNnpZNzE4?=
 =?utf-8?B?bHBGNkNhNkY2ZS9pUlFzMjdQY0FKYS9wRDQ0UVZaWXkxTyswdnQyQUNiTW4w?=
 =?utf-8?B?cjJ3SWdML0E0SjRDdUZZQnhaOXFhZ2UzUGY5ZHg2RzUvaUFGWWVYbis0VmpB?=
 =?utf-8?B?dmJnZzVUbzdnS3VSRmlqQmVYM0h1RXB1cFZDU0xTb3J2RFNaUmkxTFpvTmpP?=
 =?utf-8?B?WFVhV2dKTDNuVGNMUXZGZXAvTHJacTdBdUdKck5oQUJxcWpsVjhuSmg5L1V3?=
 =?utf-8?B?SlFtd3NMMzB3TXNDdTN3WDJxVmRhUGx6NU5WMncwazJGcjZXUmNRb0o0RzRh?=
 =?utf-8?B?ZHY3QUsrazBybXVVQm5pNW5ZM2U5OHEyNFN6bzEyYUFuSFl6VDV4a2ljSXJI?=
 =?utf-8?B?NTdpVG1BNkhnNG9ySWxHamprK21Fc1lVOWpTMEFUU1V6bFgzb3pEWEQ2bnFk?=
 =?utf-8?B?dzhOUzBtQUxveXJIaHFzdjc3NEZSUW00ekkwTmlIcXFvRDg3M2crOUhISlR5?=
 =?utf-8?B?dmQ2cGRMYnFTZUNXZUQ1OTNRdFBHZHlIUkhQaDJNWjE5NjNwdkM2REF2dkJ6?=
 =?utf-8?B?T1pEdUhMOU50RWlpeDRObEtNSzUyNFhiVDNweG1zdWVYRkxqVi9uSllJMGpL?=
 =?utf-8?B?SVllQWNEdmR0Y1pwb0xXREhXa0FsTEZSdnc2MFVwRmhRS3k2WmVLdHhsNkIz?=
 =?utf-8?B?T0lUa0E4MjlrTk5CMVdzWURkdmp5MUg3QkNwWG5Xd1pjZjVBWFpkSW96TDd1?=
 =?utf-8?B?N1J4OWxYSVJaTEZ6dWlZSHVySmtZM1RpM2FUMnJwNnh3VDhMVzN1b1VmLzJt?=
 =?utf-8?B?aWNNeEJBWEsrOGluNTQvK1RpUEg4dVFTY01oSDAwZ1FoQXFqcytBQXplaTFX?=
 =?utf-8?B?YUVoRVZSMEU0ZDRRS3ZtbEQ0OS8zSHZCU05qUHpGSzRSQVlLTUZ0Sng5Q0Ev?=
 =?utf-8?B?eXBGUjc1aEtqRVVOdkMyNEliRFFHR3BQNXkwME5kaEZGNlVqZEMwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588aec5d-2056-440e-b27e-08de5e654b0e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:03:47.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szKkvejoB2NCDS7dB27iT1TAJRnOFO44EF+wIvwJCrzQrSYRGDo+Yv+oCT1NtkdXNgJAmJkTjovr+MNRZchNww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7357
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B98C3A0F91
X-Rspamd-Action: no action

The logic in alloc_heap_pages() only checks for scrubbing pattern
correctness when the caller doesn't pass MEMF_no_scrub in memflags.
However already scrubbed pages can be checked for correctness, regardless
of the caller having requested MEMF_no_scrub.

Relax the checking around the check_one_page() call, to allow for calls
with MEMF_no_scrub to also check the correctness of pages marked as already
scrubbed when allocated.  This widens the checking of scrubbing
correctness, so it would also check the scrubbing correctness of
MEMF_no_scrub allocations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
After discussing with Jan I've deliberately omitted the tag:

Fixes: 0c5f2f9cefac ("mm: Make sure pages are scrubbed")

The intended approach might have been to ensure the caller of
alloc_heap_pages() gets properly scrubbed pages, rather than asserting the
internal state of free pages is as expected.
---
 xen/common/page_alloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2efc11ce095f..de1480316f05 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1105,8 +1105,7 @@ static struct page_info *alloc_heap_pages(
 
     spin_unlock(&heap_lock);
 
-    if ( first_dirty != INVALID_DIRTY_IDX ||
-         (scrub_debug && !(memflags & MEMF_no_scrub)) )
+    if ( first_dirty != INVALID_DIRTY_IDX || scrub_debug )
     {
         bool cold = d && d != current->domain;
 
@@ -1119,7 +1118,7 @@ static struct page_info *alloc_heap_pages(
 
                 dirty_cnt++;
             }
-            else if ( !(memflags & MEMF_no_scrub) )
+            else
                 check_one_page(&pg[i]);
         }
 
-- 
2.51.0


