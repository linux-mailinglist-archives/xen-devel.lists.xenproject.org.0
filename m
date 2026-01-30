Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIPFFqCBfGlwNgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 11:02:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F8B91FC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 11:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217297.1527000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vllJB-0005hf-96; Fri, 30 Jan 2026 10:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217297.1527000; Fri, 30 Jan 2026 10:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vllJB-0005fi-6G; Fri, 30 Jan 2026 10:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1217297;
 Fri, 30 Jan 2026 10:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vllJA-0005fc-Ad
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 10:00:56 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 905a0b46-fdc2-11f0-b161-2bf370ae4941;
 Fri, 30 Jan 2026 11:00:54 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB7494.namprd03.prod.outlook.com (2603:10b6:408:190::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 10:00:51 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 10:00:50 +0000
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
X-Inumbo-ID: 905a0b46-fdc2-11f0-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtflugoFJq5ZWb/WcPpN9HQiIHaWMnTrDmsJR/9zA6GacvO31xxFGKKxKXDjyFe0RV21KGJksZCugzfRvBAk+5/ECTIvTM+oO12QF4lCtMi1atMjaHYe6rZiGLsgMd15PZHCkUt2NVLcE+NNrurC4W0ZydgSNS3AgL6gUwFqIRsKVESIrfK8nWqqqYgh78Lvq4A/47rVCaRyUq81u/SatUAmfVAFvdtig4EX5bl4rgiFkSZydw7RENRb8lPRaIhRLtwx5dUkYaAs1bKick8Qq8Yb2y/5ZxogRt0TBpNIW7FCEX7kEfDnv2/J1A5lSxgyaI2ggbRp/VPxeqpRlwQM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAG0Y3HFPg+G9GbM4LfSgPa/2Fv0rpz07T57JiD+Oys=;
 b=IC6CTTVPFM1sJSOO/CZXmSZEHTxLTnvUF6GTNXk3xyT6ISk91Opg3Js/7IC8UsvXs2d5f8tN5imucUf1icCbne4wW16Kub1+CkUheQfFJuLvUwCzZXQfHWOh/RT4HZjHPtASU0nwMuqEPUDzuZcO6iXjhJPHDl3TWWB72gThLGybxttYq2djkvU43Df6Tncusk7w9fkrZ30ulPisI3ehxxEHH4oPWZnkIXZrn30IGN6jE8TNMfVgsB5WkU8+WtC3hMQeR21lnZgRYgWiOx9GC+eoJaCIuYceoUm0H4lvlNfIEkCPok8tixXMat59CX7E2+aGFM6vT8n/UGZ68QT2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAG0Y3HFPg+G9GbM4LfSgPa/2Fv0rpz07T57JiD+Oys=;
 b=A/ynxeKFfo/mB9ywdk1lg4vDofUcaE7tMXcLtSYD1HKfFYOivHf72cxsYZXXAMMhQM462JYufOh7L2mjXinsQR68vzVJB9CDqI2/MUkMyzuIv6OsCd0k2Wkoha72fZgcATJSn0ANKc0wnW5hLlAUlOLQwIG2RtB31YJvWvl4iEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 30 Jan 2026 11:00:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: allow ->write_msr() to distinguish origins of
 writes
Message-ID: <aXyBT-HOBxZQHeFY@Mac.lan>
References: <7987f1fc-5b5e-40c6-866e-ac332097c635@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7987f1fc-5b5e-40c6-866e-ac332097c635@suse.com>
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 3355668b-8a0a-4c14-8d64-08de5fe672c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUVuWjRGL3BQaUJmTmtRRlo2akkzZHMxZStQTU9pSDRoRVJTUUtQRnQySXZT?=
 =?utf-8?B?ZWl3Q2QvN1ZzZEdtcXdOa2hKTXdyK2ZFeFNVN1BiQ2xhcEhMSW5TK1BuMERC?=
 =?utf-8?B?Ty9TT1I1azB5QUNWOXZOODdPd0RtNFJZUEFHYzg2cm96ekhJdGw2TTQzVlI1?=
 =?utf-8?B?YWZGZXVYcmgzWGd4K0R5anlLb3YrNUNWSkkvS3ZjMHVUQWg0U3NhYk80NWhz?=
 =?utf-8?B?OGo4VElaZDlDaHpZQ2p4a1U2RENQVS9qWUNUUExJR1VBNWFEc0F2SmhNUGVF?=
 =?utf-8?B?MXpxbXV1T25VQnM5REtRY25xcXArY25nRGI5RDFkR0Z4d0hacjBWMnh6ZVZP?=
 =?utf-8?B?bUZod0JiRWZXMmlRVlU2MEZZRVVCWTUzcDJGcUQ0UUtLTUFRK2N3Qms3VDJp?=
 =?utf-8?B?SGVnaXNZZ29BYUV5NDF2WGF6cUxrMUNBZkVlR1dBaElYa2tkcXk2bURka1ZL?=
 =?utf-8?B?Q1R0ejhKTG9TQ0lQL0tMdEF0NFBKL0N2VTVNRXQ2Mk1pU2ZZRVVFc092S3pY?=
 =?utf-8?B?TGtKQmdyejg0Uzk3dWVOelNsTUEwTmdycUVFSzVicDVJT1pTQTNUOGdUREJm?=
 =?utf-8?B?U1BES3JQU2wxR1UrdTZSUWY5NGptK0xJb2JXRDVndVRLZjJQVEZBWUk0YndE?=
 =?utf-8?B?cmF3b3JGTjRITitDVEdHeWw4dlBYalZhbUlxalFNc0RVVlhJUStidmlXS0JK?=
 =?utf-8?B?OGZRa2RsNmdHc2NWM0lzVjJzRDE3aXVnTGR3QmtjMWpxdmtnZ0hjQy80MWlL?=
 =?utf-8?B?cjdIR2htZVErNk9DdSt1aWgzYjhZcVVCR0dWdm1LRzFiQlN5Z0tmLzl5eHVj?=
 =?utf-8?B?Q3cvWXJ0aEl0L3BxMW8yVWJlZHYvOWpzeXA4MEVRQUVrWTdqRVBEUUg3OE1v?=
 =?utf-8?B?bEFCVHZ5MG9JZXN2R0x3UlNZNHBTbHp2OUNhcnI5eEJid1BONFRwdDE4M1Rz?=
 =?utf-8?B?RkkvRU1pRmFWeGpzb2JVdWVsQVIvUHF1SzJnejFTVUw5TGZ1dUJDWHRYTU5F?=
 =?utf-8?B?UkMzdzIyQkF4SmwvMUx3d2lzWFlPWHB6aHFoalBqV3NNWEZZV1JEWXk2V2M3?=
 =?utf-8?B?WUJDdVFyUHVoMis0M1NEdlFkN0c0V3VEeDR1aGdGNW9qQzRySkxoaWpHZ00y?=
 =?utf-8?B?WUxyNEpobXh6MDI1L1l0TlBZMkF5cU02R3FvYTBPZGN1VU1DMjNYUUxCQmRI?=
 =?utf-8?B?aWcxRHVxWTBad2dyUFVydFdZS2tsZkQxMmp5TFFBNTBPbEJ6OWE3UjU0RVVr?=
 =?utf-8?B?MVR2Wmk2U28vZXd4b29yeVdzR2tUdlQ1Q1cwSmdCdFpoUmFxbnNlZEJEcXpk?=
 =?utf-8?B?U1hOazJsbjRXWlJwQTVUOHB2SHJRZmVEMkJrUkpqMmVDMlQzc2s1bUpKYzBW?=
 =?utf-8?B?NGhtcHV3VFl2NE9kK0hBYmh5MEE2U3VqR1VtVlpoN2dQMUEwdEp6RnQzYzVj?=
 =?utf-8?B?YUhkVVhrZXdqYjMwM28rOGVXampJZGpXcXRKL20zamFycHAvUkl3aGdQQVJl?=
 =?utf-8?B?STliWWxNaHRHNnpvcC9wY1cxVmRSamhWRS8zYkVXUHJVZFNKOG1KZFEzNmtI?=
 =?utf-8?B?eU1KdjE2UitaRDcwdFMrbDlmRmp1eFczOVY1S1VyaXhlVEpjbGg0Uk96WWhz?=
 =?utf-8?B?cUdndGxlZHhDSkQ3Y3Rwc01IdHp3YlpjWkp5OFRTYWN1Nk9hdzdJbGZLMkN0?=
 =?utf-8?B?YTk1cVpLQVFYa2xseWtPYUY1LzJ2c3g2QVVuSzhqR1E3NDY0VmZORldRTGhI?=
 =?utf-8?B?RVBITThjTXVMTU10dlIva2hPOWdDNHFQNk81UDQyOWZLcFpqZzdWSXJtM0Ry?=
 =?utf-8?B?RnFjT2VZbGhPOWJGcHgvd2xrOFZ5VU9wdWRWOWtOWmpweWRlU3VLWjd0Wk53?=
 =?utf-8?B?ZFZIeERCZndHM2NnWXFYdnhYZDNjem94UGhvM2tDWjZrTVZDYm9YQ3BpR09X?=
 =?utf-8?B?NHl3Z25EbzFGcjFueDdrVm1GcFlma3cxLzVYTGY0VCtxbTRBeCtaMVpvdDlC?=
 =?utf-8?B?dnhKUzhRUzArV0d2VDluUklWb3YzcGR0REFTSUVqVGhwMVFxSFJuQTRkS1BR?=
 =?utf-8?B?QWV3QWhOaDVoUUNmS000UEJxc0pNRUlrS2lGTmNBQnNUK1hNdCt5N0dnSmgv?=
 =?utf-8?Q?P9DU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THZ2Q3hTZDdKcVNmT2hjQTE3L012QURlR2FwTE9FY3JHdTNRRnVFMGlDY1R0?=
 =?utf-8?B?R0JGYklJb2MxdWJ1ang2UUhDZUN1bnJWbDhVeU41QXFGUDJSNHZqNDgyZHBV?=
 =?utf-8?B?NVVoNzkwTkhnSEdQbVQyYWtMNDBRZ040cE9jM0FEWFF2UjhXOFFuMEdiaGt5?=
 =?utf-8?B?bENtYjk4cEY4eFh6d3VFdHlFUThKZVBsK2JQUjhJVmRJTElKSnMyUnF5Q052?=
 =?utf-8?B?WGlRazlMNG9URXRGOEZDTnZjak55emlObU5aemMwZzBWbGxiZXVoVThiRGdU?=
 =?utf-8?B?akdlUytPbm1PY2R3V3JrZEp5SkJ0aStDdzB5LytXcFpJTXp2R3Voc2Nrb3FM?=
 =?utf-8?B?S3dETjYySWt4K3JjSHg5K0I0RFBJZ1pERlRqK2prdkZWTFQ4T1g4SkZmM0VT?=
 =?utf-8?B?cHRGMUJhbXdOQ1FXK3FPT3hpSlFLQUF4dWxhaXlmankrYnR0UzRFKzBPR2VQ?=
 =?utf-8?B?NjE2WWVhdHNuUm5zRzlqek14VnBxZmxLZmV4WFpCWStVVEFQTG1ueitNaURL?=
 =?utf-8?B?aEJoekVTNG5KT0U4VEt3R25uak9jQStvZUo3RzA3YTZyRDdTSHpKMW5DRGNl?=
 =?utf-8?B?WmFCd1lkZVNCZndaT0lEakpuUFhZb29BajRGblEvVWlXOTVHRzhCRWpxQUN6?=
 =?utf-8?B?ZXRaYlQ5S2h1ckFtWG5DRzc5OWkvU0VDNmgvc29haEdvVVFqUUpOaWF5R0dt?=
 =?utf-8?B?aGxEbFhORmZ5NmhjTklaUHJtVHo3cXliaEd6VHZKd0dFLzdGVFR3c1JXWEZH?=
 =?utf-8?B?MzY2cjU4WWR1aFZMVFNlY3NDOUdQU1VnQTFUSFpoRGtTcERlZE1CRnhLZEZS?=
 =?utf-8?B?a0M0U1dkcWF5OTJoTldlNk1sKzYwS3BDdlVWVVJGaXN1a2dHaDBSMjg5bG9D?=
 =?utf-8?B?QXBoWmFRdnZ1aENXeThrbDhnQ0xObUNVOGxOTjF5OHM1SFlmR1JLcEFPMlRp?=
 =?utf-8?B?TWl6RWFnL0loSE9tOWxhNHR5TG54U0U5YVJIYmFSazlLV3pxbG5xRy9HUjVw?=
 =?utf-8?B?dnFjNlJlaGdzRHJqTHpxcUZMVU9DOUl2RXVDR3ZzVDBLbjkyNDAwQURoUnJH?=
 =?utf-8?B?SVZRZ0NuYytQejNVOGFaSmpvc1RUOWk3WDJSTTdlaEM2SmZZUlNRRDVHOEFJ?=
 =?utf-8?B?ekdKY1VFMUkwSER2MjVwVVNGUFYvc3BzWkllNm9lMUJLVW1SUnYrdTNBckpM?=
 =?utf-8?B?QmxZK0JSYlRqa25hMVU3Q3RzR3FnMjNySGd0b2xoS3d2SUZKZ21sVGprR0Q5?=
 =?utf-8?B?NXFtNnFYbmJDVVZWZWZqOXpraGErYjdlV0FoWlpDNCsrS0tJVjlnRWF0QUU3?=
 =?utf-8?B?MmZsVW9nOGx0S0JwV1BqZFQrQTVIWS9ZR00xaTZERmJFQkhGdFFWZ1ZRa1hR?=
 =?utf-8?B?SlJ3dkxKR3FYNU4xNVplTjlEV2FqWjVKTEVQdmxmRHJmOFUzc2g3WEIvV1pW?=
 =?utf-8?B?TGdiVVlJaHc1M2p5bndFMEhlZUJUOVQyUzVQYml1NXhkU2psYTVINGtBNHNl?=
 =?utf-8?B?QWlRZ1BwN0toMkNsWFJ2eGFvODBnd21lcS9aOXJOaFJLYjZlR3RUdkVrN1VF?=
 =?utf-8?B?OUZwOTlyRW9Wb1Y3cUtNN1JHZXVHZkdKejQvVG54K05FK2s2bXB0Y1AyK09S?=
 =?utf-8?B?NktiWjVPaW9tMVlUTktBZlE2dHZZWFY0RjVnYWdrOForT092ci9WWGlVUmN3?=
 =?utf-8?B?c1F1Sk5DM1JDL00yc1hBNkFkU3RGZklXN3dnbGwxODVxbzdSQmhtdlNOMzBI?=
 =?utf-8?B?ZFpsdG5RK0h1aEtnQ0cyeWVYc09BMHkvLzVwKzVnQlIzd2NWclhsbkZVWGxO?=
 =?utf-8?B?UVlkMG02cWowY3hvcGhvUXpKZVZvNEZkbHliV2tMUzN4bkFldkV3aHJrZ3Qx?=
 =?utf-8?B?SjBHam1nZFBFLy9teklNQ09vNDZwcEVqTnZxUk0yQ1VHVVFiZUpPcXBoR0tG?=
 =?utf-8?B?SUxaSVNWK21YVThUNGxzcmhrZmlsSWs3OEZST3NEZ0JENTRBQlRoTkJPanls?=
 =?utf-8?B?YWpod0tPOWsyTTkyT1M3cHQ3MVY0ckl0TEpRakJDcjQxLzJSaGZQMWlIUmEr?=
 =?utf-8?B?YnNxb0pWUy9kbGRJL2dacWQ2RGxPeWFER01OOU5veS9mK1J3L2NLT2dlNTNy?=
 =?utf-8?B?QTRXRFVJdUM3eklJaENUQkEzNHc0NDNTNnpvbHVvbXpQSVRTT21OQ0k3cXlE?=
 =?utf-8?B?YTFxdHhjRzE2UnFVZ0tVSmhKMGhxMDdrYWZNTThJZnl3Ym9TRlpUelN4K1Ft?=
 =?utf-8?B?MCt4L0VZaVQrRlpKNXcrZk5Nay94K1A2V2xJYmcwMWtFWDBHaEsxcUZ4ZzZL?=
 =?utf-8?B?WU4zZ3YrTUxlZ2s3MTQ2Y0oyYTlsUUZaU1BVV0Qrald6YmRqbkkzdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3355668b-8a0a-4c14-8d64-08de5fe672c4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:00:50.8797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 468+AgkojX8Dceh4YuppAhSK44bi/2dygH+y8Mh4itJmlY6rBRiTkdhw8RwXAeQWD5R76vnjfBPHURH8ehSAhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7494
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B20F8B91FC
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:21:06AM +0100, Jan Beulich wrote:
> Only explicit writes are subject to e.g. the checking of the MSR intercept
> bitmap, which extends to VM-event's hvm_monitor_msr(). Indicate, by way of
> a new boolean parameter, to the hook functions which variant it is.
> 
> Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Later, in particular for nested, ->read_msr() may need to gain a similar
> parameter.
> 
> Prior to nested making use of it, the new parameter is effectively dead
> code with VM_EVENT=n. If we accepted Misra rule 2.2, something would
> likely need doing about this.

Hm, yes, it propagates into hvm_msr_write_intercept() which then turns
into `if ( may_defer && false )` in the VM_EVENT=n.  But then you
could say the same about the code inside the if block above for the
VM_EVENT=n, it's also effectively unreachable code.

> I've suitably re-based "x86emul: misc additions" on top of this, but I
> don't think I'll re-post it just for that.
> 
> --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> @@ -569,7 +569,8 @@ static int fuzz_read_msr(
>  static int fuzz_write_msr(
>      unsigned int reg,
>      uint64_t val,
> -    struct x86_emulate_ctxt *ctxt)
> +    struct x86_emulate_ctxt *ctxt,
> +    bool explicit)
>  {
>      struct fuzz_state *s = ctxt->data;
>      struct fuzz_corpus *c = s->corpus;
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -1705,7 +1705,8 @@ static int cf_check hvmemul_write_io_dis
>  static int cf_check hvmemul_write_msr_discard(
>      unsigned int reg,
>      uint64_t val,
> -    struct x86_emulate_ctxt *ctxt)
> +    struct x86_emulate_ctxt *ctxt,
> +    bool explicit)
>  {
>      return X86EMUL_OKAY;
>  }
> @@ -2427,9 +2428,10 @@ static int cf_check hvmemul_read_msr(
>  static int cf_check hvmemul_write_msr(
>      unsigned int reg,
>      uint64_t val,
> -    struct x86_emulate_ctxt *ctxt)
> +    struct x86_emulate_ctxt *ctxt,
> +    bool explicit)
>  {
> -    int rc = hvm_msr_write_intercept(reg, val, true);
> +    int rc = hvm_msr_write_intercept(reg, val, explicit);

I've wondered whether we also want to rename the parameter of
hvm_msr_write_intercept() into something different than may_defer.  It
feels weird to translate a parameter that denotes an explicit MSR
access into one that signals whether it's fine to defer the operation
or not.

Thanks, Roger.

