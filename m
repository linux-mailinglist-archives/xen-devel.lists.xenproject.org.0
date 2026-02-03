Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH92LxougmlFQAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:19:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DEDCAD9
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219512.1528385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnK3W-0005Qk-KI; Tue, 03 Feb 2026 17:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219512.1528385; Tue, 03 Feb 2026 17:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnK3W-0005P5-Gf; Tue, 03 Feb 2026 17:19:14 +0000
Received: by outflank-mailman (input) for mailman id 1219512;
 Tue, 03 Feb 2026 17:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnK3V-0005Or-Qe
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:19:13 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7444a36f-0124-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 18:19:11 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS4PR03MB8374.namprd03.prod.outlook.com (2603:10b6:8:329::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 17:19:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 17:19:07 +0000
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
X-Inumbo-ID: 7444a36f-0124-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBEib5t9FvKNwC6zWyQcxrvyFzeyHDvNZrierkEkJW7wm2Fl95svsrem5MH7PZ/P27MpUwZxaXxEJGHa3zZkob1x4EITX2oIsfE1ga3BInG90FLskdYBtVoZzU9bVSBHire35gSQ7KLhmk8cmc50BAIiOz1NBAxnf/F7T+E4HjIoT2HQfIeuFdQ8C4nP2awtaiumE3Qjc3leytLrfuXzhTxhmsm3j2dYuMA+9AZ8z4BfcLNtup+EkH5S3vpx3WgjshN7VOgkXkwe8KvGzLtHXcwsTdGIs317x/Yd7MYJ5SAcWxpw1JIYkGQl6PZ5HSot1vvUxcG1BupiPP55GUhCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KKguGCm0m/c0z83/a0cONcteUbXEG5AiIiGnVyiGzc=;
 b=MlLXQ+4jxYzdD+6rorU5ySfWf5aMriXQzBi2x2DOLcZAUTT8TY0ruaKZUvUf0Hj9hWsWTTM0G0/8yNP/DmRWSTlvUrRkHb27/FtDSeW19eRq/KA/R7g+RBgPELGIDlOQZLWBR4kqG7o4fwcIj/i+frLGg69dh4cN4SxgDS82iYnWk3Gk+BDiJ3OUIIgJ7Xw1rdYCwlMrHrukX4sUUapSuXMhK+lgMT+K/Apo+G8oA8MgV+wmO/pnVTCxZxDg42A+1DWVBsgrctSlOt4gFW3tDbSK6eHAFf2f2SKALdiSq5pE7UDq5OPHchCVgmfc3qG4pJpdSEmQrgUfPcAwSYLgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KKguGCm0m/c0z83/a0cONcteUbXEG5AiIiGnVyiGzc=;
 b=Vv+TRdb7U6e+Pl8v+Kx3ZICx9W7AARaW70n+Y8n0AzQth9gBs/lZDOXAg7GnaOqAvK0EfVzjJg6vwC93YrGA2lSYmlqVHXrdr+mEyxlrFNyiSsdTRKCvNP5tfsRkDIsC32y4wNjCIoF1bxGyR4MP8ZpOuVL3U45abms/bYsYGXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Feb 2026 18:19:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
Message-ID: <aYIuB96SYzVwGfmj@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
 <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com>
 <aYBq2EoeP_TGv_sK@Mac.lan>
 <1bcdd2dd-9b2b-4eb2-a569-e28b03c1e1fb@suse.com>
 <aYB4z8CSA590Ytpo@Mac.lan>
 <da490e92-c8b1-40b3-83ca-ad77dc2defe8@suse.com>
 <aYDAUCVdk_2qGa-r@Mac.lan>
 <4913d9b3-03ec-443e-b908-a1531dca6699@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4913d9b3-03ec-443e-b908-a1531dca6699@suse.com>
X-ClientProxiedBy: MR2P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS4PR03MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c338bdc-e154-4374-daaf-08de63485649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0dGZUZYTUlFcmU0ZzFtYVVmYlZqSzV0Ulo2TTlnRjBTeE4wbjlRZk96VDla?=
 =?utf-8?B?a2FwZzYxLzNIV0d1dkc2U0pjZnRrbW44VVJVZDY5dVE5bTA2R2ZuS0dndnFY?=
 =?utf-8?B?QkkxYUdOVTVKcTFBdlBxOEw2bkVXQnpMdDBIbnFTRm4xUEFxZjFQbDJiaWFY?=
 =?utf-8?B?V3RZRGZtMWM2YzV6UnlMa1pVdnJQWmJiR2J5SlZSL01TeFBCWmF4Y2Nja2Fw?=
 =?utf-8?B?bUFVRWZnS0NVbk5YaWxxUStvbEhlOHVSQ0EwZHBmdXBBSXVLcG83Vko0SDdp?=
 =?utf-8?B?ZmR2ZTVrOXlZcGVtYllQc0Ivc0c2WGxwRzY5NkNLUjYzOEZqQTZ1ZTZra2Jz?=
 =?utf-8?B?TGdpaDNJcWt2Z0VVaGdSZXJ4M2ZJeWd0VjVDcFIvMHQ4eGNGaXk0aGpHamdy?=
 =?utf-8?B?ZlRaM3JMTVJ4M2lTQUowbSt1Z2RzK0hsTFh6N1RzZHJkdDFXZXFNZ2RYYStm?=
 =?utf-8?B?ZGFhRHlUUmVWa2dXQ0JTSlpSc0VtQlp5SkJZRUxUbUhuN2J4UHlZL2NSWEdM?=
 =?utf-8?B?ZlFoT0ZselNUNDV2V2p3SUo1aWhRTVVWK25nWUJaTnpQdnVvdERES3A1eEZn?=
 =?utf-8?B?RHNVL3N6b0oyZjI4SkdXZ2s4Rnppc3ZyMkNJcHBpMDdNUFVGWmh6WW5oUk15?=
 =?utf-8?B?aUY5WjYzZFVKNXdmelkwS3k1RVkzNHh1dDFhbGJGSm45enY5cE1kV0VlRk5D?=
 =?utf-8?B?Q1FRT3k0RXl3N0x1TDdEbzdTRGY5TDVwTlNqalpseklzR3pLVisrYXhLOEVQ?=
 =?utf-8?B?U1RCcmtpR1dYSm5Rd1JsWEdzOE54MU1nY0N1TDBUZ29aMTF4dUZuTGZhVjV3?=
 =?utf-8?B?WVlRYXFHMzVDOGJqQXFWOHgvaEkxRlJBbDd6YnRxeFZqdHlSNGlZQWVPTUo0?=
 =?utf-8?B?Snl6VzlKZzRNR0Z3R3VlZzZxVDdJeGx4WlNtUUZKck5UV0F2RnA5ZWJQc3Fn?=
 =?utf-8?B?eENubzM5eHo2c3BPeWEwTXpVdnZDMFdlRGdwaUxSdTBOWTNqeWFmaHh3K2E4?=
 =?utf-8?B?TklrNnJkemtaVWRDOFNRcmxmdGMyMW9kQTl2YTI1NFNqUVcvYkpzTDlCd28x?=
 =?utf-8?B?c1h5NmE1cDBUREVqZnRWQ0FqTXlmQnU1aTArNFFCNXpUeVFPVW1RZks1SWNK?=
 =?utf-8?B?MTZtb1lIMXVHME1QeHdtY0w3TGVBZUJXLzlxczQraDVXSW9ScHNnVllyNE13?=
 =?utf-8?B?dHpNdlhVMTJBMWZzQnVjTEZkUUJDR3dOdTJ4Nk8xUzRMVGd2Z1owSzVoOFRJ?=
 =?utf-8?B?S21NZ01ybFJqMjZ5Z2hDYVE3MVpOVlBJaVc1M1FFbVBhelBWa3daczNQYmFn?=
 =?utf-8?B?dlhCaGdRQlJ1ZkFoZjFMZ0xpSVo2V01tVDJQeGtGRGkzNjg1VEVXc3RoN2lF?=
 =?utf-8?B?NkxFYURjTEdoVVM2dXhnaVBRZUw1dmwyZTNobnl3bzVuS1EwdmI1a0pEa1JO?=
 =?utf-8?B?ZzRSalI5ajVZb2pBMUIwY1hJZjd6ZWg5M2hyUXQ5STdoSTBzbVd1bkxVcEhQ?=
 =?utf-8?B?MUJsNjFZSXdIbDFhcy9tcXoxWHM3SEd1SHA0OU54SFd2WDFmdDVaUlhCN29N?=
 =?utf-8?B?MzF6eWpYcXJicVA2WTd6SStKbU9NZDdFWGwwWXRXbVQ0cXdiS05uVFVVeUFu?=
 =?utf-8?B?cWZnL3NscWJ1em5QamRNQ2dxaUxXdzVFK1hPUm5wRGdNRW1TM2IrdllSOTlE?=
 =?utf-8?B?cDYzNGRubzFEYkROT1FmUTlWSjMyeFRlV1h5VXJUYWVxUUVHTTN3cEs1WFFO?=
 =?utf-8?B?S0Z1RVcvaTVPakU4RzJiSE1VMHRYSkZFTDNnR2hhZi9aVXQ4VTYzbXN1Y0ZL?=
 =?utf-8?B?MUIxdnZXTlg0VVVUaXg5Qm9lb0xUU0FQMk9OU1VUODRyMjFXVUp3bjU0SHFj?=
 =?utf-8?B?VDJsaURiUGVvc3lxaFovSElCaHEvQ1pwN2lEd2RPaDFhekxoNlViMEU5Q0NC?=
 =?utf-8?B?ZnVvNU1QK3hleXJuOFlqV1pkRDg1eWVoanIzMHhJQk1mbndoZVVTS0Q3cjVs?=
 =?utf-8?B?WWVBOEl0OGk0Mld5WGdJMS85VWt4Mkt1RFpzTTdXYS8yMXB5aTQ0dGdQeXNV?=
 =?utf-8?B?VVBPTmNwZzAweC9UbkR4YlBwRXJoWlRrWTRrZG5yNElWa1BzQWRiVzlsa0Zm?=
 =?utf-8?Q?zSjw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGFiSDY4YWc1QWFmRFZjVlhadEZOalNFalp4a0VLaXhnY2lYYkNMK3h0czlP?=
 =?utf-8?B?UWpUQ2w4RTEyOUhwTU9wdk9LbXJTNW93eTZCcFlMTEtYbmVvTUpkV3laSUtN?=
 =?utf-8?B?cjlNSXdReGFRamQ1ZC9Fc1RBUlRNd0xkemEwYlA2eUhPVC9nKzN3TnpmejJY?=
 =?utf-8?B?UGlNV2ErV05Vb28wK20wVmdCam1Bb1l3Z09SSzVmVm5xYWVYVytKanM4QWVr?=
 =?utf-8?B?aGRuU3RhS0o4dnJzdUNGaHFhd3VlSUEraFE0UGhBRFNNZGdmdUdUaGNibkh1?=
 =?utf-8?B?SjIrTkN6ODhyZDJXcWI2dW0vTnJMQmEwV0pBZ2MyYW4vNkV0UkhMei9jNE1M?=
 =?utf-8?B?bDMvbGdMS3VnWXcrci93L0R3QjEwdFFCMnpJOEx5b1hWSWlVdUFkWUpzdFdQ?=
 =?utf-8?B?bVJ4YW1rTi83VUlOeEoxSk9yZWtRc1VJTzlZTGdKWlBxdU9YcXg2MmIwUzNv?=
 =?utf-8?B?S0ZXRjV3NUlReTlCWEhkem96Sk8vMjZDUEpJbjZ5YVkxOVJ5T0c1dVJQY2tw?=
 =?utf-8?B?MloxQjdmRklXREpodXRFYjF1M1pSVWRTaEtKQ2QrdDF3Qlo2NXpycjRMZGhV?=
 =?utf-8?B?aGZGWnRHb2t2ZXBPbjU1ak5zWFJTbHd0YjJVUzRNcENTNUtEcW56ZzIwWDIx?=
 =?utf-8?B?ZC9ON0E0SWVjdTJnTTQxRWJ6ZHYxdGE0cHdJWS8xSEt6NTZ2NkdFVy9tNzBP?=
 =?utf-8?B?S0NMQURSb0R2Uy8vMDJ3RnhYUlJxSTFVYlRCKzFCb2x3QjlNckpPSmVMM2Jp?=
 =?utf-8?B?Y2NpTjlzNUpudXlPTW1FYzJTNkRlcWhsRmlWN0lnUURVeElaUEx0WVl4TmZ6?=
 =?utf-8?B?REQ3Ylp5aHFCb0lmbUN1dmIvNVJ2NXY0eUFkU1JIUmkvVE9STEtJaCs4Y2FT?=
 =?utf-8?B?Rmp2a1lUakZkc1U4YTd4WGJEM2dZMGsyRzlSU0w0d0hualVzVThYaEhGZVJh?=
 =?utf-8?B?cWdpdGphRUwrU3RSUnAxQlpEWFlDU2ZRWThpYk5UbTU0VXhvV1hLTmNZU0pl?=
 =?utf-8?B?K3o4VG5vdUVkRWtpZXBrOC80T2pibzJzcGZ0VGxJUnhrYTFlaktEbnd1UVR4?=
 =?utf-8?B?N2tQVGY0ZXlybjBnYkk2U0dkbncxa1NHK1VYcCswc3llYmVZUmhHVnFBeGZ0?=
 =?utf-8?B?RTY3YzZQZk5xTzYzZGlteDJzNVkrZUxLZ3ZmcjdXVE93U1d3cGhyb3V3US85?=
 =?utf-8?B?MXZhamFQUHBJZmdaQm5pMzdCa1pTVG9Wdit5VnFxeUFzZUxXN1c0eU9DU0kv?=
 =?utf-8?B?SkVuNElBUGdSL1lFUFNmMGtKSUpzdzlhSzlXeDJpL1BDcHYyYmpMM3llUlpC?=
 =?utf-8?B?RkFOTDFpZENZWDl6VmdZWXlNVkJ4cnRnVmNNaitKY2Z2dHVsNnpMTkJoanNk?=
 =?utf-8?B?RXo4eG5SSGxqaXpOVUx1cWVUd21jaDF0ZXpMa3NiL25vbWNtdjNSeFZ3YVR0?=
 =?utf-8?B?WXBYY0JzQStxTmpTUTdZRlFvR2xPUUZTdUVlVDFOTVAwSUlITjBRcXlaei9k?=
 =?utf-8?B?UWZPZ3h1aGZKTWNjKzltZFNMdzVKR1NPclpIbFB4MHBTbk41REdZZzg4VWRS?=
 =?utf-8?B?SCttd2JsK3FrZE5LSTJVWE9HY2dRaHZXbFVRSTB6S091WnczTFFxYU1PRkZu?=
 =?utf-8?B?ODBVS0RrU0cxR1lBV0hjTlVCWTBLalVxcXBEQWtyZXZUQ253Ui9ZRktQWVZ2?=
 =?utf-8?B?YXMvZFI2ZW9aNHorODR3SkJQaDIyK09EeDFrdk5qSHQ0aHZOTSsvaG5TVE5L?=
 =?utf-8?B?UENQYlM3c25sdWtneWFZMEtSUUlRNkNnM3QzeDlweUE4MS9acGUrU2puWnUw?=
 =?utf-8?B?TW4zS2p2ZUNuVi9JdnBqNU1CcnMycmpxaVQrOVU4eU1MckR0d2x5cWN4NmxD?=
 =?utf-8?B?WXJKVk1jWXZXQkppVE9wdlUvMVQyUHVKR3dXcDdRT3dsczQwSTloOHF3aURT?=
 =?utf-8?B?bFd4d0kzMXJYcUxJQ0g5b1hBbG9JbmpSTTd0L1dwaWhUSSswUU90MWI4YXJy?=
 =?utf-8?B?OStpQXNkUkJVLy9XdStlc2s2SVN0WENqWnFMZk1SWXV5S1RQd1ZxRTBha0Ri?=
 =?utf-8?B?TFdVWEZBUllNSjVaTEU0Y2huUVdSeWc5eVBZTm5qMUZCQXEzMnE5ZFg4bUZx?=
 =?utf-8?B?VFFsVkMxQnRvOGV2cVZEcWIyUTlWYS9rMFh3R2FtRXp0bVpZQ2ZBVVpCRUJP?=
 =?utf-8?B?dzFXcWovUjNWaDZKSFMzbWVjZ2JFazJsQTNZQkd1VmNVLzJWRnpnTUFEeEF2?=
 =?utf-8?B?ZjJaK3NleDVDcmZxNEJwNm5ZSmpEVDZSYmd5K1puNmd2alBTdlBKQlhiQ28w?=
 =?utf-8?B?aXEyT0kxc1IxK2R6UmNNMkxWNTRPS3JkWVJVWDhsT1NtVDZGV2Q1UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c338bdc-e154-4374-daaf-08de63485649
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:19:07.1395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94r1H5OFdcJDBN+BhRQSloZvX+TsxY1eUkQUueqi0JrjUQmL9mWsBeBb7C2d1qCHBFQKEmdkZ+XtJS1laybo0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8374
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4E6DEDCAD9
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 03:48:52PM +0100, Jan Beulich wrote:
> On 02.02.2026 16:18, Roger Pau Monné wrote:
> > My copy of the PCI Firmware Spec v3.3 contains:
> > 
> > "4.1.2. MCFG Table Description
> > 
> > The MCFG table is an ACPI table that is used to communicate the base
> > addresses corresponding to the non-hot removable PCI Segment Groups
> > range within a PCI Segment Group available to the operating system at
> > boot.
> > 
> > [...]
> > 
> > 4.1.3. The _CBA Method
> > 
> > Some systems may support hot plug of host bridges that introduce
> > either a range of buses within an existing PCI Segment Group or
> > introduce a new PCI Segment Group. For example, each I/O chip in a
> > multi-chip PCI Express root complex implementation could start a new
> > PCI Segment Group."
> > 
> > Together with this:
> > 
> > "The MCFG table format allows for more than one memory mapped base
> > address entry provided each entry (memory mapped configuration space
> > base address allocation structure) corresponds to a unique PCI Segment
> > Group consisting of 256 PCI buses. Multiple entries corresponding to a
> > single PCI Segment Group is not allowed."
> > 
> > Given that each segment group can only appear once in the MCFG, and
> > that the _CBA method can introduce new segment groups, it would seem
> > to me the spec does allow for new segments appearing exclusively as
> > the return of _CBA method?  It does read as if hot-removable segment
> > groups must not appear in the MCFG table.  I'm not finding any clear
> > statement in the spec that says that ECAM areas must previously appear
> > in the MCFG table.
> > 
> > I'm not sure how common that is, but it doesn't seem impossible given
> > my reading of the spec.
> 
> Hmm, that'll be a bit of work then, as Dom0 will also need to propagate
> the necessary data into Xen.

TBH this is what the spec says, but I've never encountered such a
system.  In fact I've never tested hotplug of a PCI host bridge.

Not sure this can be simulated with QEMU so that we could at least
test whatever fixes we plan to do in that area?  I guess we could
"fake" a bodge where Xen ignores the MCFG completely and only becomes
aware of the ECAM areas from what the hardware domain reports back.

Thanks, Roger.

