Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOiQDxkge2lPBgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:53:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844EFADC82
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216198.1526148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNmJ-0000Ew-S4; Thu, 29 Jan 2026 08:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216198.1526148; Thu, 29 Jan 2026 08:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNmJ-0000Cd-PC; Thu, 29 Jan 2026 08:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1216198;
 Thu, 29 Jan 2026 08:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlNmI-0000CX-Bu
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 08:53:26 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7a3c5ce-fcef-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 09:53:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5822.namprd03.prod.outlook.com (2603:10b6:a03:2ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 08:53:20 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 08:53:20 +0000
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
X-Inumbo-ID: f7a3c5ce-fcef-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHkMccuimlrRAkH2WhJXaxkdnrhlo/pHh858Egor4S1UF+E61FTstuciqsxgODwZU3jFf1/wF6nM0NfK8QSwqn8B3owZWAfz2BaqDAsk3WBcLLukWoZJ9Iq/GXry530cswv55f2r0FFq8dHUGyPe8/RAG85cvIt4QLhrrdPAbLtFMkhMK0WMuZIf2BumECBXDqM0fOkzW1dU8QdEzc6SY4dmOfLWd3CSw7oVIT5x65pTDsBNIf9VZVjXabUpB83wHHePN5cbaRssbJ7meGU7GvKgvC7tgilAcM30YyqpqnXiqRZG2w1bn5gpmMQR+990uZbSwT13wCR5WuH6onAElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdArQUDMnd4BCxiGxc/1w0KBlr3WP/1p/ZdFMe0E4YY=;
 b=vdqh0mLiU3kGq1/7jjtdqKiKJSmIhGDsIEHNDttZCh87gsGjp4bbBbJ+oV5/DjMutYQxYTj3torfGw2Uovwu54ElO6CVVHnoaQ9vIIXTfzDonbHmHuJa8u8aHJXuM0ZggybCBO8n0geZ8lpRlYfJIrKXxTt7CUcPQmUSL6M+CyrBLKIp2Z7GM1lZb0Osa+O3nwmu0Cfd2KA0kE7isvh1gpW8P6KRJPjae/icqP7kTp+FbzaBuTKqzptonf4hh6CKPUgOMM9TsKqk2BAsSWcONXCx7bvyKq5Vtr9sIury8l+ye2Mptrz4EpGGdWfVBufu8g4kbLGv88lumP5urbYv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdArQUDMnd4BCxiGxc/1w0KBlr3WP/1p/ZdFMe0E4YY=;
 b=q2EDYHo53bCEjbP+/VKpYLiAFUZ7QPJ9jNJYSARyq6dZJmOfAqoeJosfKxpsJlOzHavoWy+uDz9FdAd35iNQaLJKDMENZqMcJyfUXmy/itx8HKlklQVrS7r9yT2Sv/2rBY54Gobe7vzsD3RTDcAekPm93gL4eXJUW3LHNZzI/zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 09:53:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 3/4] PCI: don't look for ext-caps when there's no
 extended cfg space
Message-ID: <aXsf_NFDfyJCcte1@Mac.lan>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <133c1cb0-bdb6-4c9a-bea8-c50f42ce58d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <133c1cb0-bdb6-4c9a-bea8-c50f42ce58d7@suse.com>
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acaf9b1-aeb1-4df7-650d-08de5f13da41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXFpSXVkMGg3ak8zbDJsOXE0RHpxQ1RJcmNOdzh2eGNuZndnSHVqVVRlaDUr?=
 =?utf-8?B?c1V6L1Q1V1pWNG1FeUZpQkxFTjRWbVBiMUZ3NGZtUGhySG9hUW9ySDRWZCsx?=
 =?utf-8?B?N2l4cDBtTElNbklPMExwcXZQOEtpUno5d2N0WGJlNis3U3l1VDhzT0cyeXBI?=
 =?utf-8?B?bzJTRHhSUU4vVDh0R25CY25hdVgzYmtmNStBUGFpQlFlZ1JPamVobTM4UWdz?=
 =?utf-8?B?bkZheVFEZEZYU2ljZkg1WHhkYThyWThYY2hpd1hHNE83b2Z2Wk5IbE1XTk5n?=
 =?utf-8?B?MTV3OGdXYi9TYlZPMDhQOTIvY1BWcjRzNWpHQVFJdHVCaGlCeXFjSWlJYnNW?=
 =?utf-8?B?cnVqT3AyTmtKdHRwZjIxZHJ0Q1NRV0tWQUhNTW9wT0hpSkRzVFA5MjZrQlZU?=
 =?utf-8?B?dkMwL3lBQXJNYmNkVjJEZndrZWxpWGlIbEZpeVRIWHhyV1JVM1g0ZjhOZHNX?=
 =?utf-8?B?bnNRaTNBSnkxSzNIVVpMMTU3Z0F1dC94T3UrdnRWWmpLUnRpVGpUMm85QzFL?=
 =?utf-8?B?dWFIbXkzeUZjRWpVY293NVVQY0VUUExYWnMwWHgzbU1FUGFBdmR1dXJhTUVn?=
 =?utf-8?B?L1NPdHl5dCsycU1LM1FBbkRlcFBzbjYvUnFuRnRNNkc3UEQrRE1KaG5zVFRT?=
 =?utf-8?B?L3ZydFFKNHFnSjRsQWJyZ0VpRjJSL3ErV1BwTks1WVZ2ZG4xYWJGTUg4bXpa?=
 =?utf-8?B?MlJVM3BIckRyUmZuZ2hLZERtMWFoa1JVQnAyTFJwQTNVUUg5Zktxb3B0eFk0?=
 =?utf-8?B?VVBvajVKam1HWVhOeFVVL0xXMEhuS0VXNnVwTkdqVFVrRWROQ2N1L0RGZFk5?=
 =?utf-8?B?UERHMlE2ZkY1ODRlWmppSjM0bDMrNGNpclUwZkdNVHdhVTFjMVoySXRlOGhr?=
 =?utf-8?B?WE11TmZsNnBUUlZJb1k5Uk9haHI2dzV1d1lJMHFPcWI4TFBDTnZXVDVjTXB4?=
 =?utf-8?B?bjkwdlkzKzg2bHc0MTB4c3VMWkZtR0M4UDRZWW54dGc1Z29udEJCQUJWRE1I?=
 =?utf-8?B?d2ZuUnRYaE4rZmx2YXdmWWxjV3NoK3Y5M3liVXBIM0RXNUswbC9lNXY3TVJz?=
 =?utf-8?B?bElnMFdZTkJ0dzNoWFdjM3NrbFJOaXROcTZxMTUyTllBT3B4UXBIczBxelFa?=
 =?utf-8?B?Z3g3dGtoYnVqNW5oc3hiM2lVMmlsa1FTZVQxWEFNNnhmNlF4M1ZlbkxMTVJ2?=
 =?utf-8?B?NHVLQk1UUkM1MnlSb1VIOFF1bUNZTmpPeHhmdmVsRWUxekl0VEt6U3d4VWUr?=
 =?utf-8?B?RDJ0Q1JySHRNU1YrNzhwZ0tvSGZNQWFwNHpRZDdmTk10eUMvZjByWEFiQThu?=
 =?utf-8?B?Z3ZlUnNJQlFqVm1EZ2xvLzMzdTBQZjF2RU5JclFvRW9WYkhVeC9sc3VUOUVX?=
 =?utf-8?B?bEEybXE1MmNTZnhRWTQ3eG9kTU9STFFnNUpwQzdNSnZkaUd1cEpGd09WMVhh?=
 =?utf-8?B?Ym5tWHNoSVVRYmZBMy9heDJZbVlXVmUvaVl4Qks0amxBdjlNeklzWlY2R05l?=
 =?utf-8?B?TmVuNTI1Sk1HbmRwVjAvcU1vUlhNMGMyWjlKUW9jYUxjK1FEenZvbWJrekhy?=
 =?utf-8?B?bHk0cHl5RFVYUGxyNEJieDhYOUcvdXAvazU4NDZ5Z21URXlscGQycmdMZUNz?=
 =?utf-8?B?YUZleXlCVnBjU1hON29ZaFlHQkFHaVlhOUZkV1NIRHZTVDJqa3UxZndVZ1hh?=
 =?utf-8?B?a0JUcDlYNktQOVJERUw0MWkrSlR3d01vTDdZbmJtYTdjTzllVC9yWk9uM2Jz?=
 =?utf-8?B?YU5sbWVXWUJUQXRWSVZ0OWx3NlczT2h5UlFaWWdQWExUWFYrVHRaSGxEcDNR?=
 =?utf-8?B?RmJSc00vbVM1SGpHUk03N1U2ZDZkSmN2Nk5ENDBvQnkyenRHaUFmVWplRG02?=
 =?utf-8?B?a2h1bkFEWm5JNHlwUlFQMkFwNCtrWFZTOThBandwaDcvUGV6Z1JmVURQQUhM?=
 =?utf-8?B?UEJsSjVJbHd1Y1AyL1EzZkF4OGM3ZnMyNWxMU2lNbi9oMGdCWms1UUFaaTlo?=
 =?utf-8?B?bm9xRm11a1RxQTNVci82cUJNNExsUnBtSGZTbC9lTUd2MDVpODhGRXI1UlVK?=
 =?utf-8?B?S3JiYXNMZFpSWGVCQ29LNS9MWXNsa2Z6bmJxdHdWbm03WitHWmk1eE1qN2lt?=
 =?utf-8?Q?E0Hg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUFacVBlZHNlRVBqSndLMVJvT2lOVU9NaWdxajNDZVQyVjJseGZ6U0MrT1Yv?=
 =?utf-8?B?Y1Q4R1Mrc3g2eUw4SEc0cjNEbmY4ZHBudmtaMmtMdnppaEo2cWxuKzlDUlF0?=
 =?utf-8?B?aGdJQ0x3cmd4T2ViZ1BzU2ZYeFhKeWdUQ05RWEVjTlhFZnNwclVFZTVJQkkz?=
 =?utf-8?B?NExTTjZtOHNDbWcrZkh0allxdVFXZTZPVFFIVnZFcDAzNUVvMHdtVmt1Ykl3?=
 =?utf-8?B?dmN6UW5QbWE2bTJkVnZSR014YTk3Q2R0K29MdnNXZlRiZ3RYcEJHYVoyUDhZ?=
 =?utf-8?B?R3pSemRza1JuYWlQbW9PaGZSVlZkVU05Vlp1QWxUczNiUVA0Q2EvakVrOTMz?=
 =?utf-8?B?VS9HcU45Z1JIajVJaDF1M0FOQUV1bytTOXQyb0JYSEdET0NaQXYrOFRyTW9u?=
 =?utf-8?B?S3o3OUJyc21nVFJpdFVRaWppbUluc1gvc2JyMVRhNmxDc1MwT0RjSVdKZFNO?=
 =?utf-8?B?R2V0RllPazdkMkQvZUxObTRXUlZYUGdzWVlCUVl1a3dQdG5KaUlhYVVFTFJk?=
 =?utf-8?B?NlVHTjMxQVVSV0YvRVVQcVpCeE5pQVFuT0xkWmNvelhxSUdWMjZkcGQxNThH?=
 =?utf-8?B?aW1tN0NLRnJvSmNGR0lWaFZFOURCbTJ5YkNlVC84V2VxWFYyVkZ5NlAwSGtU?=
 =?utf-8?B?N0M2SmhCZm1XeSs3VlFPWWpQQVlBTWt2RU0vVXlkcHBGSWhwTjZOWk05dGdl?=
 =?utf-8?B?YWtVdlp1RXFoSU1MQWVlc05IT0dtNjczSmVkZXoza0Q5QnJzbXc5Z3V3VThk?=
 =?utf-8?B?RVBrUlphM2s1MklFa3lrNEpLYnZRODRRMWdJbS9zN29XNHNTOEJOaWJVV2k4?=
 =?utf-8?B?ZXVJVnFMUVpoRE1HTGVBR2ZpU3QrT0hpS2UxOWJKK1pEejVYZXhUQVRVODJh?=
 =?utf-8?B?eDZId0Y2SzNNZkFxeWkwb3hIQUI2azg2eGlzQkVQenpCMDNTbkVWT21CRytQ?=
 =?utf-8?B?T2dNaUp0ektySURIOFE5cExMTlhxS1ppelVvWEJPR2I2N01pL3lZdU4zRkhS?=
 =?utf-8?B?L0h5U0JaUzRRTUxCalNzRTVyUVJ5TDV3MmxJcy9PZjFJYnZlVWJiZ3FLbGxP?=
 =?utf-8?B?V2tENFR1UjlMK1RhbWhqSVJJaitvV0VUMVU1U2VJWjFOQVBrTEpQQ2hzZlpD?=
 =?utf-8?B?Z053akhEaG5tM2VNRks0eXIweEtWQVpVMDBHUyt1NlFPVzFCTXpIQkhpS1Qy?=
 =?utf-8?B?TkZWMVZhRG1EaUN2dDVmZmR2cG9TUENSd3EzbmtVTmVJN2x3S2d1dHpwblZH?=
 =?utf-8?B?TjV5a0lyY1pSOGhYWG9nc0poQUhENEdiYkNWR2w0aHVkOTBFdUlTUU9aWEdJ?=
 =?utf-8?B?anVqYm9HaGdZOXptTzY5d2g0VzQrek1JU050dlBiRzlSN25OVE5IeU92c1JH?=
 =?utf-8?B?U0JuQzE3UUNvZWNvcFlia05YQVVnOUFESmlxRXorK1EwRkk3SGljS1BRV0Nj?=
 =?utf-8?B?YXV4TVpLQWJXQTFoUldTUFNpb1dvYnhXR2tURDJLN2Y2M2ExdnBOVTFSMDRt?=
 =?utf-8?B?OXJweVRJWXNOVVJhZ3B5SFRuSXVma21XQ0J6QWc0MUEwNURBamVyVzZ3dzBh?=
 =?utf-8?B?d0FuSi9zQy8rQmx6dmVFTURsQ3lIZlkyNFhDeVZUTDBlRFR6MmJoWDdRdDMv?=
 =?utf-8?B?Z3UxNWZPN0xxNzBZSHp6SERueU9yM1dTSVRrd2pteDR4RmJBNnpBMC9OOVVK?=
 =?utf-8?B?WmE0bXFnL1d3SlJaT0w0M1k0Q0tyamdZOTM1RVBDY3V3Z2VJOVRFdHdxMFpS?=
 =?utf-8?B?MkxGU2RGblZxcGVJdEhUM0xwWUJwdTJ3WG9MWDJvdXhGbFdyRU9QeHBGdjNl?=
 =?utf-8?B?MzkxeHFuVWdMVnQvNDhBc2g5NE5pd3JyQ0xJL0FqRVczejZFQzhNaU1kRVBB?=
 =?utf-8?B?U0tCVkN5cjBySGRsdWdPZTJsTFRmR0J0c3JjaW1LY2Zzemx0UUI0RjFKYU1X?=
 =?utf-8?B?TFA4dEFLUEhhZHlkOEFYZ2U1MDBFZFpaMDBLbTRDQzFvQ2k5bDl2RWg1VjdR?=
 =?utf-8?B?RmFnMlc5U3RMUHcvM0dwU0FhOTA1QWhuUHM1djdGd2hEbzlsUElacXVTTmV0?=
 =?utf-8?B?ZkJvaDYwRTVGNy9xRm5tMG0wU1JZZEUrSVo0cnlESTVDZ2xJY1VpclNSbjR6?=
 =?utf-8?B?TmNleUY0em82Sm4yYllzcFJVT0NPWnBLZXhTSk9qeThPdUE4My83VmhrKzZK?=
 =?utf-8?B?RnhUMXcvWFBhcVpPYTBtNW9BM0FDcFJyK214ZW5CcDJKRWF2RHh1ME5aOEhB?=
 =?utf-8?B?SFZmOFNwRnFrTlhFajQ3WUUyWE5XVko4TXg5ZEYvd1dNSXJEL0EzQ21rNFJY?=
 =?utf-8?B?OGpuVjZHRGRnQ1RqdFJ6OXhaVElKTjh1NW1wNUw5YnJaQ3NsM0d5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acaf9b1-aeb1-4df7-650d-08de5f13da41
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:53:20.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtbIYA62R9TA12PpgHFBXCQkxsf/HKdP+2KwN2N2NANPsxzWqrHFwYpsmn4vTJiMQpr1nFFh5+cSsmeJNe61YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5822
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 844EFADC82
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 03:47:29PM +0100, Jan Beulich wrote:
> Avoid interpreting as extended capabilities what may be about anything. In
> doing so, vPCI then also won't mis-interpret data from beyond base config
> space anymore.
> 
> Fixes: 3b35911d709e ("Enable pci mmcfg and ATS for x86_64")
> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Because of the multiple prereq changes, despite the Fixes: tags I'm not
> quite sure whether to backport this. (I'm leaning towards "no".)

I won't backport, prereq changes are too intrusive.

Thanks, Roger.

