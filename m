Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DZZNI0me2nXBgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 10:21:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F122AE147
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 10:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216207.1526158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlOC7-0004KY-U9; Thu, 29 Jan 2026 09:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216207.1526158; Thu, 29 Jan 2026 09:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlOC7-0004Im-PD; Thu, 29 Jan 2026 09:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1216207;
 Thu, 29 Jan 2026 09:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlOC6-000424-F1
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 09:20:06 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae4f087d-fcf3-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 10:19:59 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5900.namprd03.prod.outlook.com (2603:10b6:806:11a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 29 Jan
 2026 09:19:56 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 09:19:56 +0000
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
X-Inumbo-ID: ae4f087d-fcf3-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHbdT3uxoQLhuqBipXQAS1VXMYdrb5vcrFPXzsIZ+XCjKlbTzvBWteqAwcf7DibQ/tWXXvD4cGS7HmPjoLuyHWq1DfNXpmsXhLETW/aqgOlEwTx0EItWljk63FV4eNmGCefTYYPW+X4ckvlkQcko0ynxJWrsyFwrj2rWZoew6TIcqz8hhCOGVvPh3btszy6t/uRkJ8WN7R3LKcuM9ZHNS5bd2UIMNbuwLzuzgQ/Z4QnU7VvZE6rR4yEdLfyU25ukuCu0lu0LPttoIgLirvGKAAR8xsWqZh+h3GHDGWdNQ0M8DhCNCvcebIcJycoZnqIfcnCa0MrZ46ILVwJSTL8g2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kuq4aZiaC0t9DHvOVIS3UuCmeuJl50jBYc3g9swdMco=;
 b=d56MwXJnWkT0cJou8y7es2+j7SUDauC+PBovqYGA8pOaiG+A6g82qgWROfpBOSo4y52fSuenjU4JHvoNJjRCUZ6wk+IDdi6jr2zLzzAM6rRo/+vdydbNBju8IOzZIj67LY3w5Bc5Tl06z0I6/46aJVCylpIDmr5/HwU++bpad8vYJU+OnS71ORzUclCcM2Zqawi6ve45QvcRoUWtuGNvQFjPeqtqSvm9xoKo8VwRFHYc1mcA7wEmgDiuAJtf67YIb77Zh9/2YXFVTilAEwiE4sXKUvsQ1VslHUSjtxySvEOMX8VJ8OT2nDXbcS5sfMkZtkkVUIeociN0mRVZrE8+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kuq4aZiaC0t9DHvOVIS3UuCmeuJl50jBYc3g9swdMco=;
 b=aPcFWUMg1AOeN/voo3DVjeXuc4nq+8d4wSaqYUdgCdkitRyuUISXmTX/FsFDH8T9S3B05JIqQtIrm0IfCG7cNssZgWOSWNL3JKHkmcxlXOPPjGeolBy+yd2MclA6C0LD/V5bBKHRoPxDFlh5CZMTvsppGJ4bIjBCw0sf/U6TS+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 10:19:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 4/4] vPCI/DomU: really no ext-caps without extended
 config space
Message-ID: <aXsmOEcSJaztURad@Mac.lan>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com>
X-ClientProxiedBy: MR1P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: 074fbde0-ccdf-41bc-fdfb-08de5f17913d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWpvUTFteDkxUWhnVjF6enFURWJtYlpCOTZaWWRHU3VYQVFVY1N5TlJWUU9J?=
 =?utf-8?B?VWxoTFI4V3h6TExFNVNkeFlYRyt2dVBnWnBUaGpDQzZWT2dORDFGcGhsTXc4?=
 =?utf-8?B?VFNWWWJDQkt1aW1SQk16dGdzTkZCdVFGOEVYTFlqQWFaUTF2RE84WkExb0NQ?=
 =?utf-8?B?ZVU5M3JjQ3Z0ZlpNUDdNblZ5RHNvMXFKcG1TZGRZb29LRThlSEVkckpPdHpJ?=
 =?utf-8?B?VTBDSGdSYkx4RW9yenBZbkpCMDM2eFBhMjlIZ0ZUVUxCdnRlTlV5eXFvYkVr?=
 =?utf-8?B?M1YxSUhvMGcxTWZMRG0zdGd2bFBnOWhtU0N0STRMY0cvNDZoRlIyZ1B0WG45?=
 =?utf-8?B?Vk5nTlVkajljVW1yd0FDRmcrME5MenlTZjEyUGxCdTA0cGlKV0hxclR0VDJ2?=
 =?utf-8?B?aWhxWVNTTmlNSGpCL0hJeVpkVDhrcGZpMmorcjliUERaeDdDeUVIalpDc3Mx?=
 =?utf-8?B?S3JuV3pqa3pXMGo4RmVzMnJBbTRGakFKbDB2VEorK0Q4Z282SHkwWm1iRzNC?=
 =?utf-8?B?Znp0bTBpMzdJQi9XNG00czFBTUUwSm1hWW5qT21Bc1dHQTRGaHhSS0J0SDBv?=
 =?utf-8?B?eHpDQ1JGK1BkQ2JZNWxlWDJ0czdKNWpuMmRoTElxOEdIZU80T1VEMXIyR1ds?=
 =?utf-8?B?aDdjdWRkZWxGT3UyWGx6NUZoNzN6WUtuaDVaL0pENWhVQ2hrakdMemMwZENR?=
 =?utf-8?B?Q2lnOThVVmFSRE41cU5maVJYdGUzaHcweEJGU1BvNVFkMXBNb0Q1N21aWktH?=
 =?utf-8?B?UmxvMzJhdURlbU9YWXpOSGlHNjZ6aGFGSHdhWndMYzZ4ZnBHWUNSd3BjYXF0?=
 =?utf-8?B?UkpDVkM0MU9MZ1l3Tm5Gbk5hK3lEend4ZDRkZVdmMldpUVQ0N0llU1FZbG84?=
 =?utf-8?B?VUxWUTgxTDZFU0hhMUxNZFM4ZTg1VmdDRTFOdnZJcFA0ZTdEVHRqQVNNUG1p?=
 =?utf-8?B?MTc5RWxPTFNvTGlMb1lhVEhvSHQ0VDE1VElXWEFSZnpZV3FpZUk0TjF2VG9i?=
 =?utf-8?B?MGc3czlpc0U5TDQ1VkpmR3NRTmt0UkJGUSs0czUxR0xRa0pVSzB5bDhucXkw?=
 =?utf-8?B?d3JibTEyUHVBemxaQ1M0RkV3ZnJxdG1HZmljcko4MVNJZStZY3pWbnU3TUgy?=
 =?utf-8?B?aVUrREFGTXRYTTUxdlJBazBQMjNTdkdCNUF3VzJvSTNFZlFSSjdWVnhab3Bx?=
 =?utf-8?B?d2tOcEM0WHN0QjFpTjBmTjBlMHZMQkhZbi9aM3dwMWJFYnFpaUhWWlBPcTBs?=
 =?utf-8?B?OGxEd0RGTmJsZlMxdWV4eGhCU0NvUFlBTHpVMXhFcGFsZUNhZkJaNVFjc2U5?=
 =?utf-8?B?VnhhdjV6NmlXczA3SUN1QksxUnA1a3RBNTU4dy9QQU9PZWt0QUpKU285R0pO?=
 =?utf-8?B?dnpwdU1nK2RFa21Xd3d2UGZRUHUvRXlaeHo3aDhRRG9jUlNRdERZd1hhemNp?=
 =?utf-8?B?ODdwdzNPSlFYMHRGUjBnbTVyYnpiRVkxYjFxbUJvWTMrVlJTQVJNNFFjdXAr?=
 =?utf-8?B?czRXRUhWeStIbGFidlhYTzRDWHV2WHNkQUE1d0pIUWJEV1BVWmdWbm11SUty?=
 =?utf-8?B?MkNNc01sZWlreEQ2bmJvYXRiZTBwWFhGemRwYVU3aDNvY05OUTNEaDhrcTc5?=
 =?utf-8?B?emRnMXd5TmIwN3p5WG0rN0RvOFV1VHZabjByZnQyRjhxRldFQjNsbkMyNnFz?=
 =?utf-8?B?Uk5wQkRoZVJGMlMrQVZoUWFPOEdFZjBVdnJvN2ZZdmM0Y0gyY1NYUElZZjll?=
 =?utf-8?B?WTFXYVhCam5Iblk2OHpwY1V4ekMrRlhrV0JGcVV4UFBHR0tkRFd4RUpaUW8r?=
 =?utf-8?B?THdrMkUyZWxab2o1eXM1SVd4ZXhWM3cyekJsT3V6TTRMdU4xa3o1alEwLzNa?=
 =?utf-8?B?OFN5a1BRZHV5UDBVN29TRW4rYTdWbE40eE84N3h3a0h0RmZYSzFwelhYcVpp?=
 =?utf-8?B?T0ZPOXBDeTc2V3lBd2NJL09BbHNTQ0UwYUIvVmJBdVd4WWRrWGxIRm42VEF2?=
 =?utf-8?B?dXdCTHFVUEFRNVdFQzEzcjlWNjl5RmdtWEhjN2czVFJzQ25MbmV3c0NiWHBZ?=
 =?utf-8?B?V1B5YjJRZ3dnY1FJRGE2RzhWZzM5RU42eXZhMSs1a29Zbk8zTE1PRHRHVUh5?=
 =?utf-8?Q?n12c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aCtyM0YxdkZDZFpqQkI1WlJmNmUrVzNiRW5QV0tTSFRnZHROY3lLWmJ1aGRT?=
 =?utf-8?B?amxiclVPWjM1UWFJd095Sktta2pvSmh6Y3A0V21WQit5SjlGSEdZZ1g0YVZ2?=
 =?utf-8?B?bUdKWjl6bVRjeUNHNHo5OTlSNTVyMU8zVDkyc2YrOXRmYmZBSWhLZHBBSTZl?=
 =?utf-8?B?Y1Nmb3hYWTZYU3F2MDhYanIwd3RkK2E4VWVQTzRJbGNFSjk4SDE5UVl2U2l4?=
 =?utf-8?B?bTEyVW5YdkVjNVVtaUdKK01pODNyR3dEOHR2K3Y4TStrTHpIVzE3Rit0M1FN?=
 =?utf-8?B?VGxXNXVYMkhnaFNVTTRXNG9GbHpFaHJhMk1OSXZCbTEwYldjMTMvMDhEV3g3?=
 =?utf-8?B?dFhTSzRsdlBveWZsdmFudE1lMXkwdHEralU2ckd1cEpPWVdSQ1J6MjdxZVFE?=
 =?utf-8?B?QkFNbFY1Uk9ZZ0o1dHQ2OE5weGs2UDRLeGlJSnVuR2JkRjBrZkc3UkVwMWdC?=
 =?utf-8?B?cDAvWWM0MitvTUlxN1gwK29EQ0xBbUt1QzVqb3d2ZCsvcS9rME4zWjFuYVov?=
 =?utf-8?B?NSt4cU1BbVZ1UlBWZWdhREJUbzRuai91Vy94M2V4blNJUUFPbFByb25nLzlR?=
 =?utf-8?B?TVAxeWpTUXF3ZnZmUnBBNUNtRS9lRTVSdnBGaU1hUThQYUNVb3RCM2VOWllZ?=
 =?utf-8?B?MnJHUVFyM2JucTdRZ05kU24wYTJxekFXd3ZYMFZCQ2VIZGRiSHFFblhzRjgr?=
 =?utf-8?B?OUF3WFVTZUJiTWdyTm5WU05ERXFkY2svdlA0ay9NcGovbTNzTlRFYStsemZa?=
 =?utf-8?B?UVhrdzlZTERuQ0Z4VHJjSzhkS0tBM2llb2NvTHgzdThHdTNUSklJWEI4SEg5?=
 =?utf-8?B?Tm80R2hTYm1heHV6Q011Q3BRUWFqUmlOTDRSZWxWTmFwTlpNem1CRnZrQ0VR?=
 =?utf-8?B?dGFyWUxKekJqQTlNWDkrbEFpWlFRMlZhelVndjZOQ3VYQnMvRmMxNloreGlx?=
 =?utf-8?B?UHZCdUg0aFR0L01rMFVLRW5XcVRaNzUyTTdnRmViVTM3aTcrbTJDaDBHMUI2?=
 =?utf-8?B?ZjJJcUhtWC9iTDNzOTdLMXZ4WjJtT04xeEwxVXZVY2dUejRFM3N4SHF5SE1T?=
 =?utf-8?B?cXdHVnkxQ1prK2JRLzVJNy9mSVZWM1FBMjhaYzR4bndHcWxUY1VGcy9BY29Z?=
 =?utf-8?B?Q2p3eXJwdFZGRnJBL3pCbkVhdVlYM1BiK1pZcDhicDB6VExUeTBnOENHUExw?=
 =?utf-8?B?OHJqVUZRczNYWXJnVGRnM1BFUFhuVnZPWjk4ZFpaY2o4NEZPRnMxYndIZXVX?=
 =?utf-8?B?bmFFTEtyRE5FLzIvb1hIYzNVRUE5bWQ0dmp0WHM4ZlM5YmZ6Y0xEcS9obmxD?=
 =?utf-8?B?UFNVeXBnK0dVOVNjbS8zSDJEZ0lqb2dPSGNzNUtOY1FKcHVaM0kybU5KbGtH?=
 =?utf-8?B?YmZwOGhkU0czdlp1R0tZbG4xUFhvdHZqRWJFTnNaVHl5ZGd6TVZFaDgweGVh?=
 =?utf-8?B?d3IxSUVRNENKaVJZa0xpaityQ1l1N2R0WjNpYTlEU2RzMWgxZHluZ3M3bXNF?=
 =?utf-8?B?U1BXRFBMRHZyaWpLcnRhTjNpYnUyQTFiYmszNDNPSWRjdDNveG41Q2ZWMHNu?=
 =?utf-8?B?SEp3OEJNcVNrRGJLTFNwYm1YL2F5NWIvczU2YWJBb2g3T2hjREpvUlA2VWg3?=
 =?utf-8?B?QTNScno5dUlrd1pSYWRja2JWbDhoK0xnYS9VcDMzU0NPOC9OMW9Cb29iNCtG?=
 =?utf-8?B?VkZ1U21yWlE2alZ0V2czcnBQZW1YNTZ1ZXNsME9Fb1RrV0IxVnJqSElkOVBk?=
 =?utf-8?B?RUs3RWhDTmpqb21vUXdYVitRZXlvdCtaZEdnLzVEZCszbVY5MDVDQ3hoOTY4?=
 =?utf-8?B?a0Z6TlVBZnVLOTBCb0szb2VBMkxZam4yV1Fab3c3TCtvUVQwRG1LWXlUSHJJ?=
 =?utf-8?B?WjNXYVdwL2grQnZYSHZUVlE5K3hlRFI1YmlteWNDNml4RUd3bXhIR1VOOWVZ?=
 =?utf-8?B?VUwxTFNWNVQyZGNmeEZzNWI3ZjFuYmpLWHRqaEQ4MUZQZ05BVjJ5b1U4eFQr?=
 =?utf-8?B?L1hxczExeE8yazhIYlFja010d0NteVdIK1Z5dFgwQzc3NXVmdmYrSW5tTFlx?=
 =?utf-8?B?bGl0TStPY1A3aDNqVGxyeUJDK0FRV095aWZOeVMyWFJLUlJlOWVkc1I5N2ZV?=
 =?utf-8?B?N2ZsMldZMnhsNjN4T3Uva3kyamFPWm5FK1JoOUVhbnFRNEdKVW9OT0ppTVBL?=
 =?utf-8?B?a0FDSzUwUjM1YllTTy9pTzF5VDg3NzYwc1lLbHJTRTNOekM2SituL3MyZE1Q?=
 =?utf-8?B?S3dtQXU1V0lEaWk2dFJUMERMdmpBeU5TVVpnMWczODY3WEY5Y2Z4Y1JvRloz?=
 =?utf-8?B?YXYwY1c4NEswYVJvRmZjYktJYnpsMWIwNTBDN3F5TjYyWXkyckVIQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074fbde0-ccdf-41bc-fdfb-08de5f17913d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:19:55.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQQC3I7LKJXtVmyFD6hMMSMngis9odsUVTFn0NtJkbLZdJ1XumwqUdTp2qpcNyoiC1ias5ndIc5FUP/EoKRDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5900
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 0F122AE147
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 03:48:01PM +0100, Jan Beulich wrote:
> Whether to emulate accesses to the first 32 bits of extended config space
> as read-as-zero or read-as-all-ones depends on whether a device actually
> has extended config space. If it doesn't, read-as-zero isn't correct; not
> getting this right may confuse functions like Linux 6.19-rc's
> pci_ext_cfg_is_aliased().
> 
> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -830,9 +830,14 @@ static int vpci_init_ext_capability_list
>      unsigned int pos = PCI_CFG_SPACE_SIZE;
>  
>      if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( !pdev->ext_cfg )
> +            return 0;

Don't you want to possibly put this as a top-level check, so if
there's no extended config space we avoid doing the PCI_CFG_SPACE_SIZE
read for dom0 also?

Thanks, Roger.

