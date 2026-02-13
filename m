Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJfxHJ8tj2ksLgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:56:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC354136C33
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231035.1536368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtem-00061X-P1; Fri, 13 Feb 2026 13:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231035.1536368; Fri, 13 Feb 2026 13:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtem-0005zv-MI; Fri, 13 Feb 2026 13:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1231035;
 Fri, 13 Feb 2026 13:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqtel-0005zi-Ss
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:56:27 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7eae86f-08e3-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 14:56:23 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6673.namprd03.prod.outlook.com (2603:10b6:a03:398::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 13:56:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 13:56:19 +0000
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
X-Inumbo-ID: c7eae86f-08e3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnTmAdMvKE/rdj/KVCc+vnw4TVjPMqD2KLhH3qkMC7HQKtZKO55WUawP+SmM/XhcjcLDyYNsOkrftXh6jjcQ13x2mG8e02RSjsI5ZZfeRH77BVrtZStKvleM5E2hcLxIgw2iQl5ZRgYxGmNTMuOmktzitSRX0tYcWGXE0TJvxcIov7Hwx/nshLt2w3HoGyIyeA+TmMEArsrpfJ3x0tr8JHaMj+x4t3EGDzZ7c3aaOnM73r9E1RXrtL3K52Eo00fq/BpvoPO8AFRppJr/k5SNREMN0Ehh3yYTzPlEjpp3mmIxfyjIqNQF3akcx9w40f/qepYh67W0gvuRZGwQ03rLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZW6JiHzpijx8nT81NwFSTX3BWvzHbwr9vDzp7tCVofQ=;
 b=IW4Tp6FIYG8qSFxuGuzPK46Io3yiutT+FCT9M7QEjpGIrKG3JRnMcPQLL6Hiqg1E8OWSQ9RQtYwD6zk0FLcV/Uk/C1+1WG2D+3E+PDJ7SFQxnHWd+xQwevl3bo1ELYhCgxFl6B7mA6RZsh5QVUEs83fUO/pKDRbncarLvJbNWJNLpOLLo1CqPmIg84HKMILygoXwfgiHt0e3rODW5PWb8Llel7MVpdEIHHcqLlverYxI9Dd42hXsT+rO/2rem6zJsos/kvrl6hqyJW9PNM93G70u3D7bQfiMVAUtH57InC9npTsN92T6K00g41c+bQrTp9DL9P91Vk1EmQrGyfAbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZW6JiHzpijx8nT81NwFSTX3BWvzHbwr9vDzp7tCVofQ=;
 b=H//rXT+u4fsPjKA1XdHN/UHpNCnP0p4LI8x2kkQn8PyewC616niXUHXtGFMKYX25Y+dorcUAZolxLHgoYhwjL33T1hp1I/rx8fr0FSAeqmG24SQ/Is9JImXgyIP5K1SppIn4Oodv7VLJcEuIK63MyHr6SUsBYSFCjBpdvfvw77k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] x86/darwin: two extra fixes to placate build warnings
Date: Fri, 13 Feb 2026 14:56:12 +0100
Message-ID: <20260213135614.25842-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0026.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c3be89-4312-4575-3a33-08de6b07a984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c29kRGFrUS9ieVdJVGVHcGNYYU5wNFNmNkFvZ1R4eEhwZTZKeExWMVFRUm5E?=
 =?utf-8?B?Qmpodm9OK0NMM2hRdENPUGNzdUoybFBSdzVUU3NRd3c5clVWWUNBZ1AzaFdO?=
 =?utf-8?B?OGovQ3BCWEwyV2M2WVdlVmlJWGd1eC9DSUhWQi8rdWlRSTUwSGhVSnFpaHJC?=
 =?utf-8?B?YUhhS3dsUElDTndwd1hXLytQUlRETmR1NzgvS3NxaWJIZmwxeEhMbHJma1NU?=
 =?utf-8?B?d29EMmpHUWNSK1NDWkd6QnQ2QndSZUJTSDFJYlIrMndFSGpsLzRTcmViQlFy?=
 =?utf-8?B?MkYwNGcyQmxDUHdqOXhuY3QxQ0lYYXQwc3RLRjhuZy80QVRoa0M0MlNrcXpu?=
 =?utf-8?B?dytUTmNOeWhwR3MyY1YrZVdOdDgvOFdJSjNpSHl4cWxoSGNrZkRoUDhROUdQ?=
 =?utf-8?B?UDUyUW9TdUFWT2h6T3Z5ZHBuL0pWaUVjWkVIWFpEZ2NpTGhOR21Id2tabXN2?=
 =?utf-8?B?L1Bub0VHTUtOSEIrbENuMUZOK2RQNWdvbVdBWlFXWVZkQmRqL2I5Tk9pbXhT?=
 =?utf-8?B?ekhlUTFPb1k1TmprMjBvd0laRW9ZOHdZbFdUbHZoaVc2dVBVaXo2Z0drdVBD?=
 =?utf-8?B?bTJJNFZlcTVIdmZSaVRsdXVPRzVJZ3ovazhTSTBIN0Q1c2tQTTBzOU1SUmFv?=
 =?utf-8?B?KzZwaGtFc2hmT0NSTHE3SGRpVkYxb2ZURFZhRXB3U3p1OE5DeW5TWU92ZzVi?=
 =?utf-8?B?L1QrTWdEYmplbDNmYTR2K0J2ZVEzVXk5SzRrcXhvWXR0MS9VYms5TzFGRXdI?=
 =?utf-8?B?am1sTEFWcStYaFFpL0xQdlVsMWtKOXBLb3NEZGtSaFZuakhrR3pmZFEvOTZa?=
 =?utf-8?B?U2dVMjV1RzNRNHo5UHZ2ZU9qWmpTcjFZUDgxdy93OWNrM3BHMnI2bHJHQzAx?=
 =?utf-8?B?d1RQLzlFdmsrd3JlK0IrT0NIV2UyYWxJVlY4UFZwcHhIRGtpcUdmNFAzYlZG?=
 =?utf-8?B?aUhoL0FkQ0NlMTllbGxOOTQzU3pqSUFRRjBaWUhCZHducnR5TUg4QmFhUmk3?=
 =?utf-8?B?K2JxYVh1NjJPM05EYnRrYzBwWHdVRFZrekNMWDhOWWtGR3ovZlVieXVpLzZS?=
 =?utf-8?B?QWFQa2JuMVJKbFRlbmpURkNaVy9PM2tuczlSMUpIMmVnbXh4RVNEQjE2MmtS?=
 =?utf-8?B?TUlBSEJnaVFRMDFLMVJMZW0xTkJtZjl3N0U4c3B0UmNqTDlWRWlkWk1NZHdu?=
 =?utf-8?B?ajdSK1V2TFh2U1Y3WjFORG1YLzY4NWg0TWlCdnh5bmRYV0xsTExUdzNpTGpl?=
 =?utf-8?B?VHh3clBocmwyNHdNYmxuS0NuN2IzSUVhWGY1NENoMlRLQ09zRFJPOURYK0pM?=
 =?utf-8?B?OGp1aGVDYUI2QjJEdmM5eFhsMmc2Mjl1S0JGOTJ6OEUxT0FJRi85T2k0eVRz?=
 =?utf-8?B?amllSkpOb3BWQk02TS9jNmFJeTZieUR0cVNCREZJMlRpSmt2ek54RVQ1SXdq?=
 =?utf-8?B?czZXYjhpdzlqZjlNUUNQU2FhV3FRTWZlY3ZOcko2Ukg3V1FZejNwekJweGpW?=
 =?utf-8?B?a3crZkVDbW9LS2FVWXBpTExTdkJBcXZGWUpEdUpGd3JScFlCSnBhTUxKUWN5?=
 =?utf-8?B?K3JMVWtISWFCRFpUbkoyRHhvblYySjFZT2JTL0hUREtVVDdRVTUwa3pzbCs2?=
 =?utf-8?B?QUdIeXcycWs2ekNsMnNzWE00N0lScldMOHBpS2JpWTZ5Rm5Td01ISlZndXJR?=
 =?utf-8?B?QkVXYm5HYXU0cC8rRit0MUpmSjNpUUZZS2VYcm84S2x5a3JUNlE0dWtabE9C?=
 =?utf-8?B?d3pzSUhldWVXTjUrY0Z2VUxNWW5OeUdpaWJhUHVPU0UxL3ZCTTZIQ2toRWJZ?=
 =?utf-8?B?K0F6Y0E3dHBuUWpFNWI3T2JiOXNaaExLK21qb3E0RG44ZzhiWlpjNFcwRXg2?=
 =?utf-8?B?TnBEVmwxSXRxVU5EbCtSWmp4Ry9iUlR0TkpGKzR6ald5NzJNSWFvWjFwREZp?=
 =?utf-8?B?UWJjVkNMbEpwK1Q4Z09vVzB5NzNZTjA2V29RMktsc0VIa2d6Wk5sa0txNUhP?=
 =?utf-8?B?RHJNb1RBV3c1U09pUm9QSGZFUU15TDU1SzJSZXRMT0dsRFlKeGREUWNGTEts?=
 =?utf-8?B?NXkrb2ppdlMzSG0xV0V5NkJqbG1IS0M0SUFvbzhVU0VldEVVSitoYVBKSTMz?=
 =?utf-8?Q?ocgo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmozcVdXZkJ4UHBSTGxlek1PNTlzRndDNUpjNW9sbnpjSmZTdjE5djZvNkFj?=
 =?utf-8?B?ZHdyNVVOL2Q3c1RLd3k2bVZEQkQ0MDlIa2NEOW5nSzJ0b1BqSGJZVkJiYmp4?=
 =?utf-8?B?R3d5Zkc0SlhnVEdFaFlIaG8vTFpEZ00vWWVMRllGaG0wa0xmRkVnSFFpK1FH?=
 =?utf-8?B?YWh2VlVnS2JhUEdncS9BQXNxM3pFdm9temZkNFUzVy90eThrV1lmSFAxS3pI?=
 =?utf-8?B?czJWWng4aHprR3lpNUFrcGNvMGhxcDRPTlVJcXFNQ3QwQTVkQUF5SDZIWUk5?=
 =?utf-8?B?bnVQUmtBbmN3aWl5NUFTczQycUZ1WWNzSGpCV3ZuZ0pBTFFQUVdJL1dndk0r?=
 =?utf-8?B?M00xV2xzRE4zSEIveEpocDZhSXU5Tldmek12aUtjbjJua0U2SzFwV1J3OXNB?=
 =?utf-8?B?emthUFBkZFEyYmZqT2JvUmxUNmpYR1FCaHg4YituV2ZCcG5TT0NqSnd2NEg3?=
 =?utf-8?B?cmpOMVZDemUyZ05hVEJQSlFVZHI1OFkwS0NmZ29TayttUnZSTmY4MGVkRGJt?=
 =?utf-8?B?MjQ1Wm5xY1N2R0Q4YUh0Tno0V3ZCVXpqdnVyTTloUkJnMXRtTVFCL0hwRlEv?=
 =?utf-8?B?TGU4bXRSUFR4UjBaWG5mcVlEOENZUEFJSVZoVmM1cUFqejlSZEVOdmVGK2pX?=
 =?utf-8?B?eEFtUGo3L05qOGJIeDVtTHlvd0hEQ045ZjVYeGR0ZmtPRFd4SnlMbldWcnps?=
 =?utf-8?B?SUwzd3FQRG9qNDFic1BHWXpvKzdPN290QmxKQnM3dXViRGJHM0F2SmJGVG5X?=
 =?utf-8?B?azJhTnZiWk8vdWdPQmt2UVFscGV5aTBlNm52WTE0aGxFV1lsKzRoUkt2eUd6?=
 =?utf-8?B?VElRRkg5RDFmbThFaHUxb0JXdlF6TFFBL3A2NFZRN2NmR08vRVVPRTlpSHNY?=
 =?utf-8?B?d0VNMmppR0JtQUFvbkkwdmwzT01EcXpwT0F5b24vd3JnbERmK2ZFdDJlR2lz?=
 =?utf-8?B?WTd1QlR3VGJlL0JkQis1WWl1VU5GLzRLVjZncThneExvMXY5WGs1ejh4WXdq?=
 =?utf-8?B?UGRmczAwdmo5RElSUHZEMkZlWjJnMlg2NkU2QytRQS9qNmZwK2t0K1FNNEp0?=
 =?utf-8?B?aU9BYlZFTmoxVWNKSmtNV1ZTMnJPNnJvcjRnSFI0Y0R3eFJHR1FPL1dxdjFB?=
 =?utf-8?B?cWcza3htQ1pCMHJVL1NldEFVZVJ4aUg4MWhxenVTT2E3Y2pocEtrd0VhWVE5?=
 =?utf-8?B?WGhIKy9IN1hiMTJ0ZkdEL255VWpqamw3eTFCaTg4QVYwanFnUVlxRVhDemlL?=
 =?utf-8?B?VUo2UmlObS81RUFwZ3dBOFFFcjNJY1phOURzOVBmamRuM3hzMGNoYmtHS1Fh?=
 =?utf-8?B?K2lEVVE5Nm1Xa251akxFUGE4dC9TVWVjRlZseVdSSllvODhWQjhkUjhCSWhZ?=
 =?utf-8?B?aTFBdmY0dk5GcHJUaHpWZUV4aTk0OE9KaDBBZGVvQzFna0lnWitGeS9EU2dD?=
 =?utf-8?B?b3Y2OG1mUUlsT3NsSUhlZ1dRcmM0cVR0cVM4VXVoV1M5aTBDVVJxNE1nL0NH?=
 =?utf-8?B?L1RtWDBnRVlHTERmWVd4VXU0eGNwQStlL0VkUDJtNFNyVURqTTR2eGcxSm9Y?=
 =?utf-8?B?RXlrZGVPblJ4NlB6ZW00THE0c0JWZWM3MUREVW9ZRndKREQ0akVITjJQR29y?=
 =?utf-8?B?SnArYk5YOWtjcHN6TnJ1V3NBbWNRdjRWL3RoUGJLUUlNTFNuR1ZTNFZ4NWlG?=
 =?utf-8?B?OURVTXdkRjEvamFvcDBtUmczeWR0a2xTd2dUR2ZubHBjblFVWDdOc0JiYjVu?=
 =?utf-8?B?V053ZEFwcUc4K3VzY25JU3R2VndRY2tROVMxRnRSRHNkbkRKazRRclUrZ2hR?=
 =?utf-8?B?bEFoMzJScis4a2h3RkgzQW8vbjM5Zk5QU0hYckgzekZ1RDhxOEF6Y1g5RlV5?=
 =?utf-8?B?cmloOWxUa05QUHhkb3Uza3RIUVBXcFNrYVVpTEwvUkV6T1hMRlpMbHhFbkpF?=
 =?utf-8?B?SUdvY21aKzc2eVJ2VFpZR0tVOGprWUFYcjUvRGpmN2xvUzRWUnVlYUh1VkJB?=
 =?utf-8?B?czhSdXcrZ2lTalZZVkh2RGpmR0dnTFUrajJkNGtLeGd1TjFIc2Ywajc0SS94?=
 =?utf-8?B?QUJFMWh0MXNnNTdkVlVxR2pGZHlqMEVON0NHaWplVmdBbnpORk5XTUlZU09p?=
 =?utf-8?B?VnBpa09rTGJsU2tsZUtFNDNqZEF0TkZ2UVNqbWFtQzZidjNabUVZWU44U2la?=
 =?utf-8?B?TDZHMlU3VlRIYVZ6T1dZYXdBOXRTK05PdjBZbFR2YzJsaldmdU13RDk2YU5v?=
 =?utf-8?B?S2NYMzY1Tnk4cFBQYVFaWGNDeHlKeEU2K3picjFheVJ3Zk8xRC9YWnBHcFZq?=
 =?utf-8?B?ZG51K0g1dCtid3BqdEhJVGZxbUpiRWNUblZSbE4vZFZ2OHVwWDBMZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c3be89-4312-4575-3a33-08de6b07a984
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:56:18.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLnduFNHSNJBQ7/pl382YqkbgcTki8UnG32uXhEARvn3JJVjtxqh9bwwIoADuo/t+ytZ9fX859B1RlUbNEwTgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6673
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DC354136C33
X-Rspamd-Action: no action

Hello,

Following two patches fix the remaining two warnings seen on the x86
Darwin build of Xen.

Thanks, Roger.

Roger Pau Monne (2):
  xen/x86: fix usage of [[:blank:]] with BSD grep
  xen: add non-executable stack note uniformly

 xen/Makefile         | 2 +-
 xen/arch/x86/arch.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0


