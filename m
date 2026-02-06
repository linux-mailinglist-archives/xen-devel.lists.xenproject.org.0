Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIj5Hw34hWlEIwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 15:17:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB37FEB64
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 15:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223284.1530845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voMdX-0002Ov-Ui; Fri, 06 Feb 2026 14:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223284.1530845; Fri, 06 Feb 2026 14:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voMdX-0002MV-RT; Fri, 06 Feb 2026 14:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1223284;
 Fri, 06 Feb 2026 14:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1voMdV-0002MP-Vn
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 14:16:42 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ee76d48-0366-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 15:16:31 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6540.namprd03.prod.outlook.com (2603:10b6:303:127::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 14:16:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 14:16:27 +0000
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
X-Inumbo-ID: 6ee76d48-0366-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cb/dWkEqchMkBs4dEJKLfEjfUfcIBOpPfgCJRIKgbd0UNkb3QCK6JI09PYly1W8HmZZOqY+tC7KVifj6oeZjrdraZza1zXd/akki2Epff6GTozXdJN/rZcbNBWQ2P0g89knY+f3yBXb2SNkuIhbUQ3cd3kRxaS2820LiGVbgZh6NhcV+LwWStJfvlKxjWcmzb8CuNVVUEzn+++tHS7gsErGhRBeukecOmHdjlyZ1DSnsvGpk/ZZtHJsyJ1rFUVNGaL0lsqwcE20VeDNOyj7J9m+PWSq7h1rxDt99A74cQ2IRKbmiBHWjCk9B+EEgd4Dt6d1FFMxMLEBMAEqLtgtYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTA1iiQO+s/F2BYi2DqPkFXaSmJXt2ZnztOC0nfAVGk=;
 b=q3UjlDYRZhNO8MbwtUVOxFpOoXLKKAi/ytm/JotSlja3SMP5NCH89qsbdBKkYmp2KaZFdhlw7cfTMg8FMriPzcLLwqnllx9zE2tQQCncRfgIki6wuNajLr53WQ/uVwrb3PZYcoCym2NzgkCCW66+IWQo56xcrwLvcDzFXif70jiyMX8e8djNW2e14gTT7qtxR8oZ76xJOXGOAIpTLUZ08v6YwM/A8DzYzl9ZZnzOpyKQEEvUo6E8I7Flhy39kBnVnkpbklzeltrtygGzCIlMSbM5n9TykwFF1DRn3PF3JbK8Ad3d95XIrrIWnG3EoICPFVClcsGRG7jSQBF2nogkrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTA1iiQO+s/F2BYi2DqPkFXaSmJXt2ZnztOC0nfAVGk=;
 b=c+qMNrh+8L2nQp83bG6LbO7nyl7AafhaOZ4maD45sDcJlUupIMnfXNWIhPWh1IHMSbiOL2FSD93OchgbUPAgRdM3qQ50MwfC/jXW5ijWf2iTsHtNoaFaIf5YfmGSow7oTI/sqz/ufh9890mgg0ws5D5qVkJoZ+YjL+DhDBjr/as=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Feb 2026 15:16:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Message-ID: <aYX3uBr6NcCZoP10@Mac.lan>
References: <a3837d27d473763a667596841754398e7d67df46.1770365754.git.bertrand.marquis@arm.com>
 <4bdcd7e0-ff9d-4bbd-8337-aa80d7d66ce9@suse.com>
 <aYXsvu3HlPuCUuY8@Mac.lan>
 <16ECC44C-5C56-47CF-8AB6-DED34990C5B1@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16ECC44C-5C56-47CF-8AB6-DED34990C5B1@arm.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd4649e-9708-48c7-41eb-08de658a5119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGllUm1JNmg4Z05qSnlMNDl0SmtJMmJrT3BlN3BrUm5JS21HQ0NWclkyY1Zx?=
 =?utf-8?B?K0VaRmo4UzVCekoxNmRnVVRzalBzQTBNMlBCd3ZlYU42TThQKzB4UGtMYlZC?=
 =?utf-8?B?RVN5aWRLaStXck1IZ0szSmxCQ3lsVWVXZWNrNjJ1cEtsK2U4UWo1bzhMM0p3?=
 =?utf-8?B?SjlQdG9UOUliNndHd28rNEJiRVRDZWZzQXhFcTRqTkpoRnl1eDJZOWlVMmJv?=
 =?utf-8?B?dFRPblVjTHZUbXpjeWpYM0FlZVdEUnFXUGdzUWV5K2FkeSs5YzdIbFRqWWc3?=
 =?utf-8?B?Zm5hRkJlZlpBZ1ZzanBiQ2RlQzUxZGEyN2RDMGRlZjYxanpNcVM3LzdxdDA3?=
 =?utf-8?B?aGNOeU9aYnR0aXBTQU9lL1N0SWt0WmlGWkxpWnRGakUxUTVYT1I1VEdZWHIx?=
 =?utf-8?B?cFQ2c25WUGpTUTNTd0tqeFE3NXdGR2ZraVB2MjNna2ZGTEl0WCtuNVVpYzlQ?=
 =?utf-8?B?Z2htRkxicVdDbUtvODRrRGxmNlQrMlRrL1VyRlpIeDRZbnJvN1NuSzhxNkRt?=
 =?utf-8?B?NlpjRFd2N3VWRVlFMEZDN2VPeHk1QWRJRnZlTHNaTytEL1g5Q3p6bDQyR3VK?=
 =?utf-8?B?MDJQOXM5NTBRSWYyNVBLYUk2TEozcThCZUxzZU03LzZWMCtOdFlhQ2RKaU5t?=
 =?utf-8?B?SEVFUFlxNHFKdFBIZnBCU2lyaGlRVWZlM3VoRHdzN0VtdU9XamRTQytnN0pM?=
 =?utf-8?B?NDJXSXFYVFYwaWR2aFZqRGt1SEpEbGdha2RyQktIeTFVUG1mRXhITGZPVm9L?=
 =?utf-8?B?dktVWUtNRFF1eWdBOFJEMjFVN01MdnVNeFByMk8rOFlxREdLQndWOXdqRjJQ?=
 =?utf-8?B?QlJSTTdWdHQvbVgzbVZJdU9BbEk4cFRtUy9vZ0wyQ2MycHM0Q3lIQUVQaHgw?=
 =?utf-8?B?Z3Awc29VeW4vQmdPdDM1Zk94akVVRFNlZnVwL0swT0Fid2NOYm5LQzZ2d2c2?=
 =?utf-8?B?TUpFQ01tbWRBY3AvZjhDcXBieG5KdWJoYkM1eGpVYlhZZWdlWTZGNjdLNlBj?=
 =?utf-8?B?dW5JVTZzSUNHRXVDY2NaalA0dTFRaUtqazRIb25ndkFxeDYrdkp3KzRsbHcv?=
 =?utf-8?B?Q3VNdlQ0djd5V1c3bHkxMGRYQklVTXdSYkhFVmlxbVovOVpOWVVPNWRZZGth?=
 =?utf-8?B?cGtFcklCWXUzd3cvY1VabkxEaDkvQTVKMHJHVFhBNHJhWjhMdWxaWEpMOEYz?=
 =?utf-8?B?NTYrNUd2SStTVUJuVlloZytEaDROSlVJRXJraDlBRE96VkFXVnMxQlVDaENa?=
 =?utf-8?B?SWdnREl1YzlmQ3lKZGt3cHdnZGpWT2lLMitWU2RSZm5Td1ZGZC9Cc01VVEZU?=
 =?utf-8?B?ZCtyaURqald6Mmc5OHRZQ1c5TVNBdXNlbGs5Ykp3aFpac3VyN2Q1MEtsTmZj?=
 =?utf-8?B?cDdpVERlVVBZYmFXMGd6b1diT0tTa0V4UFk1eGViaHErbkNBL2R5NkRtOGhW?=
 =?utf-8?B?VytGTHRyS0lqaHlhMVFXSUxraVRPNGQ1NFowOWFzQzF6bDliZm92TlBUcHRi?=
 =?utf-8?B?TnRCemRZUDh5SGszMWJyL2FiM2lTY1B0Rk52aDNBaHk2akdLTFpheWFCOUhr?=
 =?utf-8?B?cnBsMy9DVkxXTkVBVHRnMGMyZjBoeEN0ZnNkbitHSmtOOWIrNWl2ZWs0cFNq?=
 =?utf-8?B?Y0hZWjE4Z3d6a3JGN2U0dmNwUlU0VStmVzlMZk1oaVpWbTVWVWNtRDY5Q3dq?=
 =?utf-8?B?UTZ4cVFMeitLbG1peThsNkQzVUNjTFAzdzJ1Qk9ibUVjWnJ1ZU10ajFzN1p6?=
 =?utf-8?B?S2Fzd2tzR1E1dnE2TE5SZTJ3MzFxRGo2c3BERG1TcnZBVXRnTldhTVFhOGQ0?=
 =?utf-8?B?UlVFL0pqajFSVTVTbU9iOEh0ZkxOMVVyRWx6ZFN1M2VwSGNOQU5GejlNd081?=
 =?utf-8?B?dmIxY0V2SFdHS0dWWkduZjJZNk80cE9Ybm9haEpqRC9TM2g1MVpRQUdtZXZY?=
 =?utf-8?B?K1lCWXJ5cm14aGpFZ2R6NzMrUmYyL1VLM3FOYnR4djhlQmpySHpSMFV4NThC?=
 =?utf-8?B?blhHL2xnSEc2NytnYU9GNlR5SWdXd0RKTWExYUhjTHg2dFNQN3IrK2o2L09h?=
 =?utf-8?B?K1prblllc3MxZVhjeTd2V2dJclhnVkROWDBINlc3TWZmOGNKdyt4OUFDWStP?=
 =?utf-8?Q?RQFs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm5tL1BFVnJ6Skd3OXdjMXovNlpZZmlmV0RmL0tEQXUvRWY0VWhUbytrMFU2?=
 =?utf-8?B?YUIyN01saVlqZmFYY2kzSkt0Z2NXUlJhOVRMTCsxUWo5OXdUK1pGOFlrWHhS?=
 =?utf-8?B?S2thRTlIM0JtZElKeXhwZ1U5ZG11ck9qaHRpZExETys4VVk1K2d5TDFDa2dt?=
 =?utf-8?B?WlB1NklGYm45TE1Wa3ZMK2JCZXZkdnY5MzY1UXpEVFRwcXMwaHpPckY5VTMv?=
 =?utf-8?B?S0p3S2ttdUhjQVRuRmd6RHhuMml5RVRxdUlDS1FXcTFEUEpzUWZUbW9lMGdI?=
 =?utf-8?B?K0piN3RVaTF6cy9mQkZTS2Vib2ZaMWhvOXdTRlNmOWttT3dLY29VOGhwZ3FW?=
 =?utf-8?B?a0k4V2dHK29VV29US1JVWEFSa0NCRCtqMVNuK0NYaTh5U2wrZ1R2RnIzR2E3?=
 =?utf-8?B?SkN4bG1mcktrRHhDNnM2T2lxNFdqT3E5VUZZaXc0NUtqYyt6NjZGVVdzRnpn?=
 =?utf-8?B?NGhUOU9VVlhwUmtxV3lkUTVMb05reXk4a2NVVzdZR3NBUTJUc05kMzMvZk1u?=
 =?utf-8?B?WUI4akxYZC9vbmdES3FrVmNyT1RybUwvZmw1SXdnUThrWmxtSFhWSmVvdzFG?=
 =?utf-8?B?SXRYTU9iTHg2K1c3QTIyVXpWNlJFU1Y0SHVNWVdFMm1yMDdSRklQSks1cnVn?=
 =?utf-8?B?d2R1Yk5vVktZeDZGWk9SLzJTNHpqRzVTN2pkWTlHRFgxU3B0SVRrYTVkakpE?=
 =?utf-8?B?K0dsWUJqL1g1QXZKSVBROWJPa2FJalFyeUNvQ3ZUOG91eHR0MUwvR1FNY3VJ?=
 =?utf-8?B?Nk1Xc0t0RHAyZnNDYWlHcjhvaFZWU3dIVnNYaUlCcUIxM2l1ZG9SUEpISVVl?=
 =?utf-8?B?MGVRdFpNbVk5WG9KS0g1MDRTeStvTWpObEtuK3lLN2JaeGRSaEJXMko2NTlX?=
 =?utf-8?B?dm82UmZudmpvVUdIeUxmbnBEam01N0V5by9JQmcxZlhuMWNxMEk4OG4xWnhF?=
 =?utf-8?B?M0NhVUM1dHIyMk5DMnFFbnpnSVp5SEhjSEFaY2RCTmdrNEdsVTJUNjNDQ0dV?=
 =?utf-8?B?MTZCOGlNdHNnblRlOTdQNDBLenN3OU9VNW1GcGxyUTR6VHJub3B0Z01BSXdh?=
 =?utf-8?B?TGNhQmJvTzJMcWhSNUdjU2paZU5saDdhZTJ1cllIWkRoMlNDV1V2NWZrNHBS?=
 =?utf-8?B?Z0llUnd3czRrSHVSTUdpdUp6T2l4MTdhTmhZMWU2SXpNOEhhUW9QUmgvYStu?=
 =?utf-8?B?NzNpb0E2VzEyVVpueHBGTjdtMG9OQ3RnekVZMXdFUFRRUUlWbkQ1SFprQzVq?=
 =?utf-8?B?UldPWjZMakJSMFk4RWp3Z1dsMUJBYnVsUkUzeDEyMnVkaXNnTHg0ODlrbk1X?=
 =?utf-8?B?Wlk5dmJRTG93cm1FdGczSGhvSnNxYXlnU1dnVW16RkhrODBYamxxSFdmczBq?=
 =?utf-8?B?RGFqQTRjdDgvR3F4YUdDanRiZXVkYVdxZUpCaW5MbzJFTVpxL1JMWW1vTVdH?=
 =?utf-8?B?MDNsdGdxaVBPYnRETFVmVXdudUVxWmZWOU9JTFNYMDVwemg2Q1BwbnVpcC9S?=
 =?utf-8?B?SWNaV3dPaXd3VVZaQkltNkxtNnByRlk3NDNVamk2QURVM08rRUx5SEJQREpO?=
 =?utf-8?B?ZStMWDU4QUN0YWdqVkF4UDRjUFJkdGxUek5TZGE5bkIxSzlxMGpGRmJMWnNp?=
 =?utf-8?B?ei9yN3RSMVRUeHpJWC9wRDFnVlF3OGVzbExtbGNLbFVVb2tyZXp6dDd3blAv?=
 =?utf-8?B?SWtjckhOcSsrUGRsbWRUZ0kzOU44a2VqamFJckNTM2lzM044K2hPNStnZFNv?=
 =?utf-8?B?UHRtSHNPakY3WGMva1NuRGp3bVQxaXo5bFcwK1NDYnhWYWg5dUV4d0lYM2tW?=
 =?utf-8?B?WHNTRFMyTWNUeU1PYkFMeEwvRzYxUWoxU3JvdjRtd1AzZCtqLzE0RnhIOGFD?=
 =?utf-8?B?Q1dkOVRhRjVlVStxUlBsNTBULzFEUzNZMmNhOThJcHVRVDR2L1BaTmdsS0Vo?=
 =?utf-8?B?NERHUUZ0alVzNU8yTmo3ZGRXZ0k3cWVaNndORW5ZaEZ6N1VpM3Z1bVQ5TUE0?=
 =?utf-8?B?NHBaWFduODJLV0FmQ003akpDb1E0N1RnenphR044MFhxZmxZVWRjMXYrY0N5?=
 =?utf-8?B?NG1HZEdsbEY4VTNjNEF1Wi9VaGxxNzBzcGJIWXMvQmlWUFRhUC9GSEFJTm1P?=
 =?utf-8?B?T2RBMStjUGtmZERON21JdVk5TWRZTEkwZ1RJeTJzbXNLMEd5b1lKajBUaDBB?=
 =?utf-8?B?OHFFNmpnMThKMEJSTWVuT3BaZ2h2MmVjbkVVdm5kS2pEU29vT2gvT2tZTHRX?=
 =?utf-8?B?SVVsdUR5cXE1dUZNUDNyQWdtdzVBb3E2YlN3WlJsZWVFMXE3T21mblJiT1JK?=
 =?utf-8?B?SytZNnJZdFJmam5DMC9CYWFBMmtwNlFGdE00OTBNKzN3cmlmQkdxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd4649e-9708-48c7-41eb-08de658a5119
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 14:16:27.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOoabL3osC6scmmCaCtn7wB5bMb7+CPQl/Cf5k3PcJoZT3hokFmG95EAbV6timun6BdLzINEbuBAFzSoVNq8bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6540
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,arm.com:email,stdgnu.mk:url,Mac.lan:mid,darwin.mk:url,config.mk:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9EB37FEB64
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 01:34:23PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 6 Feb 2026, at 14:29, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Fri, Feb 06, 2026 at 11:38:02AM +0100, Jan Beulich wrote:
> >> On 06.02.2026 09:17, Bertrand Marquis wrote:
> >>> Xen does not provide a Darwin build configuration for selecting
> >>> GNU tool definitions. On macOS, the tools we use are either GNU
> >>> compatible or we only rely on features supported by Mac OS, so
> >>> using the GNU tool definitions is appropriate.
> >>> 
> >>> Add config/Darwin.mk to include StdGNU.mk and force
> >>> XEN_COMPILE_ARCH=Darwin, ensuring Darwin builds always follow
> >>> the cross-compile path as we depend on the Linux ABI so compiling
> >>> on Mac OS is always a cross compilation case.
> >>> 
> >>> An example of how to build the hypervisor for arm64 on Mac OS
> >>> (tools cannot be build for now) using a compiler from brew:
> >>> - brew install aarch64-elf-gcc
> >>> - cd xen
> >>> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc

I've just noticed: it's a bit misleading to use HOSTCC=gcc here, as
(under a normal OSX system) gcc is a plain wrapped around clang:

% gcc -v
Apple clang version 17.0.0 (clang-1700.6.3.2)
Target: arm64-apple-darwin24.6.0
Thread model: posix

You might as well use HOSTCC=clang and make it explicit the host
compiler is clang and not gcc.

> >>> 
> >>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>> ---
> >>> Changes since v2:
> >>> - Subject was "xen: Add macOS hypervisor build configuration"
> >>> - Update Darwin.mk comments to more accurate versions (Jan)
> >>> - Remove the build-on-macos help as we have no dependency on anything
> >>>  coming from brew anymore and the toolchain can be retrieved by lots of
> >>>  other solutions than brew on mac os. Switch to a simple doc in the
> >>>  commit message instead
> >> 
> >> Did you see Roger's notice on Matrix about objcopy?
> > 
> > I think Bertrand considers objcopy to be part of the toolchain, hence
> > "retrieving a toolchain" is meant to include objcopy (either the GNU,
> > LLVM or elftoolchain one)
> 
> Sorry i only saw your message in matrix.
> 
> I checked and i installed both gcc and binutils in homebrew.
> 
> So i think the commit message needs modifying to stay:
> 
> brew install aarch64-elf-gcc aarch64-elf-binutils
> 
> to be fully complete.

Yes, I didn't notice that in the commit message you explicitly
mentioned the brew install dependencies.  There's also bison and flex
needed for Kconfig, but AFAICT those are part of command line tools.
I think python is also part of the command line tools, and not sure
it's required for arm64, as it's required for x86 to generate the
cpuid headers (but I don't know if arm64 has anything equivalent).

> > 
> >>> --- /dev/null
> >>> +++ b/config/Darwin.mk
> >>> @@ -0,0 +1,7 @@
> >>> +# Use GNU tool definitions as the tools we are using are either GNU compatible
> >>> +# or we only use features which are supported on Mac OS.
> >>> +include $(XEN_ROOT)/config/StdGNU.mk
> >>> +
> >>> +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
> >>> +# Force COMPILE_ARCH to a fake value to make sure it is always the case.
> >>> +XEN_COMPILE_ARCH = Darwin
> >> 
> >> I first wondered why you say "fake", seeing the file is named Darwin.mk. But
> >> in Config.mk's cross-compile check the build host OS doesn't even matter. So
> >> yes, it needs faking here for the time being.
> > 
> > Hm, setting it to "Darwin" seems weird to me.  I understand the
> > purpose of this is to force the user to set XEN_TARGET_ARCH
> > explicitly.  I however wouldn't see it as fully uncorrect to not set
> > this.  It will then execute `uname -m` and get `arm64` back for Apple
> > silicon macs (which is kind of OK?).  Other I suggest we use a non-OSX
> > specific value here, so that if required we could distinguish this
> > case where the user is expected to provide XEN_COMPILE_ARCH.
> > 
> > Maybe XEN_COMPILE_ARCH = { unknown | undefined }?
> 
> I am ok to change this with either but maybe unsupported could be
> a third choice?

No strong opinion for either naming, as long as we don't explicitly
use "Darwin".

Thanks, Roger.

