Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJsPHUpejGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846912393A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227222.1533573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kQ-0003BB-Ca; Wed, 11 Feb 2026 10:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227222.1533573; Wed, 11 Feb 2026 10:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kQ-00039R-8G; Wed, 11 Feb 2026 10:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1227222;
 Wed, 11 Feb 2026 10:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq7kO-0002Tg-UG
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:47:04 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00276b77-0737-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 11:47:03 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7844.namprd03.prod.outlook.com (2603:10b6:303:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:47:01 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:47:01 +0000
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
X-Inumbo-ID: 00276b77-0737-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXvMrF1XN4c+YntWJDWobQ3OylDk1ojIiY6DJec6UvmS4YpuZ4IXN1rbu03GeN8AQlGeMQdCY9LLTZ10v/FkpIJivX3VZuocDgOQBx9f6J4GJVqcxbioY99YdvFO+SxWgG+mg9JQ5phmhaCKwUdjAL0XPdDnva7FlBKTaBKuYe6GbJX1asxv1pIFOi6JMhqyXfMmB9FvClPKVBF6SSvzRmCSxjsYKtsuOdO1J3ujLPsUWekAxdel7eMro9FNCYtAjydBc0zk+sBotl9VA/8jQ8miEyp7qN6zMIWJiDHEvs3XB0V9nWjZAI/soP8YeHmYcxHKz8v66zs0hYQ/AjuxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7XzdqwuGAV5YHCJRquaLBzI+WwKGfkVfdOG5E//3D4=;
 b=SvhULgMTdaNua61CIFHe2LqlQJnmcXJ4+OwCVnDpgQ+9knFDJz/IsieQ1cdkwaXo6waQMLAqUB6vcx4p8Nc4F+QZHtQe9S7hr+5lGnYGcwksGFAl8judJhjbkRh3vsHXMLrzdBUltbHZDpISNjAkk/GWnCcRCRSEXVoxRNWQPa7qJFqF8QxecuyGtbJfE09PFpD2EAgN5r/GlS/g0bbseDeg3iI4ncodoP/a8Qoimn7w0GuFom12VPX0hgUyVbXRWylnX66z4ldfQ1y7qmnzuYReamanPb+XeafRo7U3yn7KwcHU7sklk1EIGGs2DtiuuI09SRuXQ4+L7CXHFB7Otw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7XzdqwuGAV5YHCJRquaLBzI+WwKGfkVfdOG5E//3D4=;
 b=UeTK4PjUYBxp4BAm8qHGlPnC6E8ZHJthFwY1l3615GLCrsBk+FIsWXtq3r+5Z7liMzSThMCPNk5QS4xPsa+w8M8iwYu+InZxuffhOyiCNQxAIfBgt0gQC2ksSR/Bz9Euks7xSuAlkBM2tCPjkOSQfeJJ4rSTlQQykVB82z3rD8g=
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 3/5] xen/tools: fix grep reporting 'illegal byte sequence' in check-endbr.sh
Date: Wed, 11 Feb 2026 11:46:36 +0100
Message-ID: <20260211104638.7938-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211104638.7938-1-roger.pau@citrix.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0062.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: fafbc603-3b94-4732-38ac-08de695ae31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3VPU0piY2JUT29wYW5jaXBoenRkR2VZMEhQcWNNUVdyNVBWOXBQc3FnczU3?=
 =?utf-8?B?K3NSLzloZ3BubXVhVHVBT3JrSGhkS3JaMHRHTWZ3TjVKRlhSbUtrK2kwVE51?=
 =?utf-8?B?emU3SmtGdWRMVW90TXcxT0xOMUlBQTlNZlVncEtuU25GbzFPbDk4WHBITVBH?=
 =?utf-8?B?eHFDbkFUN2V5OG5sZElCRFZQZm9leEdVQUdrREEyRkJ0YnNqeVZKRWtZbGVp?=
 =?utf-8?B?QUhqTXVMODdXZXYzbkhrQlNaU3VIOGpRekFZSU1FKzVJRUN2MnlmUmtjZzBt?=
 =?utf-8?B?dmtsbE1ldUVLZVdUdk5yWUluejN4MWI0cHVoRWxxU2x3dEdKeW5lVHpacXVo?=
 =?utf-8?B?Zm15VFM2WHZrQ2dTc1cwZGR1N1cxcW11SFd0RkJkWnFBRkU4UnBpeWUxVzZS?=
 =?utf-8?B?N1BPZHJXMUhNRVk5S1ZwRXB1UTVBZms1NmdNZm9HRzBWbVErR0ZwRmxmamJ5?=
 =?utf-8?B?UVdpdC9XSDBGREVNVlVHQzhGQUR2L25DTmxOQ1diNnFQNWcyemZRd1hrSHVQ?=
 =?utf-8?B?SUVsNTNuZHhDdDJsQmVTUnQ2Q0E0QTQyK0RWd3FUdHhOYnVyMGtZWkxNUHBE?=
 =?utf-8?B?cG90U2tJVzNBaWI4bXZKM3BZVXAwY0lqM1YyMU9ObmhGd1ZhQ0daM1NOSjBl?=
 =?utf-8?B?RFVVeGU0cFZBYU5VdW9BQ0RZTEYwcnJMbVpJZ2EyLzc1MTBLZmRxSjk1R2FN?=
 =?utf-8?B?U0lnblZ3VFJTU3lrdEgxZnd0ZXQwL3FHY0JvV1FwbDZ2Vjh0RmQ1N1p6elkr?=
 =?utf-8?B?UWIvTVRZekd0cGlDQkRvMk5oSHhuZFVHb2dPQ1VKcEZmS0xYa2JoQjkvRFZo?=
 =?utf-8?B?eFVoZThJdWF6bDYvQzdqamdZcVJpTUpRdm16YVBKOEJpY05icHd2Yk9WM1Ra?=
 =?utf-8?B?aENnNllzY2tBZFRsQ0VRZ3JyMTJkU3NYaGVyaGJ6M3djTTNiRkNwVkVNenYw?=
 =?utf-8?B?SmpiVjYyWGU0OTlhVUQyUFM1MDQvb1VzWEsxTkhaa0d4TEQ1aGllNDNuS0NC?=
 =?utf-8?B?MzlNbSs0aEtmUER6QUhTZFY2cVBMcFNsZGRtc1BjalJmdXBhMFREdEdUcXZy?=
 =?utf-8?B?bzhxS2lraXVUVTExRmtIOVhMNXhIQXcrR2lhRUtRbXdJTW9uUFNyKzJ2NlZB?=
 =?utf-8?B?YUZZMUp6N2dUNG4zM2NSZzNMSEo4a0hFWjdoUnpwS1l1NllmRlBsUDVVWmlJ?=
 =?utf-8?B?eFAzS1paazJtQ2MwMWhhTEtZSTI4OGFRallXaWdhQ1VPUmlvN2FlR0FvQTRn?=
 =?utf-8?B?eSsycytzajFFclJIVnJXNjR0UU5uUDlzZzJ6OEF1SWVGNTBZYXM4dldFN0JK?=
 =?utf-8?B?TGMwaEEwV0RaaGI2UmZPMHQ0NlJPU1AvRGpVc0VDSCtCcFRldm4rVVpRNzEy?=
 =?utf-8?B?ZVFTWXBxL2U3aCtTaHdEOTc3VGRadDZGY0M5c0dRQlEvUWxoREhBM3Vpa25s?=
 =?utf-8?B?c05idndlS0kzRzhXY3VwdkQ2KzN5U25sekFaYmdqdmpjMlJSd0ZNZjhqZEc2?=
 =?utf-8?B?Z2tOSTdXdEx2eWtWQzNEbjNMUE1abjcxcWQzZnJJeHE3WDRGVitVNU5LRFBV?=
 =?utf-8?B?UWUzZ3FUblE1bWRjM0ltVkRkWDNmQUtEUEJjajFCU2paQVdrU1RobnZwdWR4?=
 =?utf-8?B?VlVoN1pObnljdnFyKzY0WUUyNElyNzFLZWpNSlJzUVkzOTZURHhqVEZ1WkVI?=
 =?utf-8?B?aU44SVFQWno1d0IyVDBxMGkvZjVFK3NvRVVORGowcEt3OHZPdXVSSDdNTXpr?=
 =?utf-8?B?b0VlcXNIWVdyUGd3RFJvVHlXME44MU9jZncxOWR6czBJTHdIQmF6UDdNbEZU?=
 =?utf-8?B?WXFDYUFHcDZrL1dyN3RmaW5VbTBQRDFGZ0lVN0FkVEJaRVlKUG56bmIybVQ3?=
 =?utf-8?B?SFIzWkNsQ1pPSVVnSHpHdko5SWlKSmcwWWpGMnk5UUZHSUVlYk9ZQ1JJTHAr?=
 =?utf-8?B?enZaMW1NdndEZ3FjSm55YStDMDluYW5VNmJSWUVYaVVPN2tyd3FaeElBMHln?=
 =?utf-8?B?TGNPWUUybWZyUkRYNzIxc281Tnc5b0FoalVDMWY0VVZUdmJ1aFAyMGladWxV?=
 =?utf-8?B?MG5WNndWSDJRVU1YakQ3K2wxemRGR1JqREQ4SlVvYnUraFBOMnZINFI5eHJw?=
 =?utf-8?Q?bDfg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRUYUJJOURxaithczU4MWdoRGtBMzJTalJsanBlTjB2Tk1xRWNsZHdiWlFT?=
 =?utf-8?B?MCtoVkRqRit6VDVxZU5ERFJaaTdjZUUvQkk4VENGTThKbmNTVzc2a053ZEZI?=
 =?utf-8?B?aExSYURqRzZzdHJudGJYNTI5eU1nUlhvM0VDOVRKNC9wVzdtaHZVZDd1YTh5?=
 =?utf-8?B?TXhLTEFsc0I0a2FHVTlmaXBmdktBRndVaE43UkdnZHJuTjVIQXR5dXhzUE1F?=
 =?utf-8?B?WlhZRTZHQUZSTVRBSk5yc0N3WlJDUXAvY1R0cit0RG1sYVoxaTlGRGtTb3Zq?=
 =?utf-8?B?ZG4xbDhQSjBHTitrWFJPYnFrTzc0OUhETlVRM3VwTU5zUTFYL2E3WG16YVRy?=
 =?utf-8?B?R2NucEVoSVVTb1ZFSHZuY3I5WXpZR0xQWHU5aG0vK2xPSFJrTHY2TzRSNnVB?=
 =?utf-8?B?L3I0QjQrd0RPUXNpTXpOZVBwNEp1ZEtzOFV2U1IycDZzZC9XMmpjMS8zemhz?=
 =?utf-8?B?OUJ1bjM1a1UrVWZEVVdnVndnTnBoN2N3eTY3b01uQXRaU3NOWEU1VjNBd3NN?=
 =?utf-8?B?dDlBK01MV0c3Y00rRTZycDdxWUlTYnI1TVAwL3NLVnhlcFJ4N0haNElRazB1?=
 =?utf-8?B?WGJEM2VDa1BSUTlUckx2a2pTQXpNTmk1VjBZd3VlVllmVDJ0YXBZUWpDcWs1?=
 =?utf-8?B?Si93MXZSdkFwRWRkUnJYaCtDS2s2UlhCakZQZkY5NkVra1l1K0dnOFR5SnRD?=
 =?utf-8?B?RnNxRUFUMTl5RGRpT3VWZVMwcTk5cnQzeTI4OG9uZTFTSXozQTdOemZkdjd4?=
 =?utf-8?B?YXh5Tm1manMvd00ySUFnUzRDRG9ENXlNV2JJQ0R1VktmVm9qOENpTUtZSkJX?=
 =?utf-8?B?bVlaWVorNjA3Wjc4ZDdWOVNnL0U5MlBHTk1hSkM4QUQzRXFZaTl3VUkxbG4y?=
 =?utf-8?B?VjRwRmt3UUQzZW0vLzF3emdaelhGSWZhaFBaVTNjeGZhekIzRWtmR3ZBbDh0?=
 =?utf-8?B?SDlWK0lBNVByd1dxeVNEZW15MGtWTkFvRC9Ja1A1M05VTnZSa3MwS0tCTmJZ?=
 =?utf-8?B?NUwwYXRlak5iMEgxQjA4RVNMUEc0VEpEU1I0L25jZUxNRkcwd1EzTktmSjhK?=
 =?utf-8?B?dzM0YkdlSS8vUnJpbVUxQjRlUkRoY1RzZ0hNR2dEZEFCTFF6Ym1EK28rZnBs?=
 =?utf-8?B?MDh6b01sVWhXbkR6eGRqSTgyRDFhMHRPenFtT3ZoaG42TTJTek1yMGhzNkVH?=
 =?utf-8?B?VlNldUl3RndMQWU0QUhlNXpUWEc4aFRPNlo4YnB3cUxTalBqWE9FeUswU1kz?=
 =?utf-8?B?TjNzTHd4dTRVeUFPNm04MGEzcHVpbmZrZks0NHp0a29UWUp3eGxON3lkWEIw?=
 =?utf-8?B?dkJpWUVHalRyTnVMMDNVL2IxRnptRlEvLzRsV1FvSVh4Z2Q0QUgybjRGMEQy?=
 =?utf-8?B?VUphMUJtbWtPWnYrZ1BadHpRa2tqMWRBR3l2WGV1dklwUHM4WUNTa3NTOWFx?=
 =?utf-8?B?QUxobGRtR2tLY2hET285eEhNRGlDTVZzTVR2MHFrUTVGYmV2cmt5bS8yKzEz?=
 =?utf-8?B?WjFNZGlJckQ0TG9NNUxadzB5VTVYY04yd0xOZ3d1UWJaYVJwVnlKM0dKTEpC?=
 =?utf-8?B?bmZuQXRLRXFaVnZ0RjNZMG1nT1ZpbXlIbDVaWVN4VTJVWjVWdERiVkI0NFM4?=
 =?utf-8?B?T3BYZVMzcWNYNk4yeXZmMFo0dkVpVnhtVWxMRjBHRUsxNjFjdHNCQUZ3eXVY?=
 =?utf-8?B?MlBabE1qaVQ1N2lZS05UTnozZEhFclhPQzFBWUt6MkVLaFo4VTh2N1ZyYVBC?=
 =?utf-8?B?R3gxblROeXZLbEszUUpLOGRyUVoxVU5kb0N6bGc5dVk3aHQzdmJDMjZLOHNS?=
 =?utf-8?B?bkZFN1U5SmFnYVZCbnh1OVhjS01ydk5IaDJqdWFCRWJaWUQ5bVVWMmRiaHRi?=
 =?utf-8?B?U0RkU2s5V1JvVUo4VFVNL2ZPa1RPbFlVWXNUN1U1QXlHa09LOXVFTUpqM0Zo?=
 =?utf-8?B?OWVpWHgxVTZLQlFXY1ltZzhOYkJTeUoyK2k5N0V0c1k5YXdJbmJOd1ljQlUz?=
 =?utf-8?B?cGF1VHkwSFlFbnFhYkNYdXZHYTJSeWV2Z01OazQzZkxjQXVVTE1ocUVPN2tG?=
 =?utf-8?B?bFJzL3ZOMnc0Mmo3VVBpUUptRXlNZmtrVkhJMDRGeEhQaGErZkpDRjljZmFB?=
 =?utf-8?B?ZURqZ2tmekhNQ2xaMUNtZDA5YWJQTEdPUGFyYXBueHIwbjFxWVJrbXdXcDVs?=
 =?utf-8?B?MzRLSkFkd21tNGR0emJrVlN0NWtmVTg0SUs2bTE5QWVQaTRjWkpVQ0FJZ1Mv?=
 =?utf-8?B?NlpqRVBBbEdJL3luckI0UHdNcDlodHVWTW5qditpLzFqM0JNclovcXFDclgx?=
 =?utf-8?B?eTRuZlJFSTFtTEJwZjdYbkFtaE8vTzExT2xJc0FhYm05VmtSbVU1Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafbc603-3b94-4732-38ac-08de695ae31f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:47:01.3343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAuyRiFBhyl+sufGPJuHmbNhtkQk6COI+LLGRgFEgrRMgnSX7NEcORQOJf7xVO/cBzVtcrv+LrkPQCYfq5/Jpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2846912393A
X-Rspamd-Action: no action

On macOS the default encoding is UTF-8.  The binary encoding used by the
grep matching pattern is not valid when processed as UTF-8.  Switch the
local to C just for the grep invocation to use the binary match pattern
correctly.

Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/tools/check-endbr.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index 383d7e710a53..0be9986dd356 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -109,8 +109,9 @@ if $perl_re
 then
     LC_ALL=C grep -aobP '\xf3\x0f\x1e(\xfa|\xfb)|\x66\x0f\x1f\x01' $TEXT_BIN
 else
-    grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
-         -e "$(printf '\146\17\37\1')" $TEXT_BIN
+    LC_ALL=C grep -aob -e "$(printf '\363\17\36\372')" \
+                       -e "$(printf '\363\17\36\373')" \
+                       -e "$(printf '\146\17\37\1')" $TEXT_BIN
 fi | $AWK -F':' '{printf "%s%07x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
 
 # Wait for $VALID to become complete
-- 
2.51.0


