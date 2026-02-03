Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I6GMcXKgWl1JwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:15:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD7D76B2
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219185.1528114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDRA-0006Dl-Bc; Tue, 03 Feb 2026 10:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219185.1528114; Tue, 03 Feb 2026 10:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDRA-0006Aj-8w; Tue, 03 Feb 2026 10:15:12 +0000
Received: by outflank-mailman (input) for mailman id 1219185;
 Tue, 03 Feb 2026 10:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnDR8-0006Ad-7Z
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 10:15:10 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 375f2725-00e9-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 11:15:09 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY1PR03MB7873.namprd03.prod.outlook.com (2603:10b6:a03:5af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 10:15:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 10:15:05 +0000
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
X-Inumbo-ID: 375f2725-00e9-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nz5e8mHYXGashbY6AgTdDY0eaTLL+aeZhQq40YkbJN/NkpMOtVL31in+N4s0jaxrPQy+mx3fxJ2gfjIrOwgfbXfE00zGvyEmjOosT6Ubr/WHoXAg3WEWUqEYGr2wDVOOId2Qra1YMbeFIN1PSij9t4MmWKGdVTi9q2NJZu5eZVEx8tyaX87J4xQA8a4hBOF7X/RDkqvjP6FPl378f+l5MbDoWIzykeiPwHjFUuLEhle24cQHAaY7HtUDF2NvA+C4hJyxVDKgCD4gSlXTA/RpKCYQU3kpuu9BZm9E4qgDvAKzXwRzQ7zNtlLwYENYykubaRF8GlU+OsKvgq0iytU6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z21zLrbzck0YRU7xZ1+yXNuRUMs/p6MNAGGLBgZmPw=;
 b=KK2DFT3znGsAfJdt06IMlMekcRTEVnOgwqfzw6XE4xH0ZGK+HwBqM/JjagOqclw62f58XcvGMuuFM9AurLWHLx83VE2CEw6rPfcHguDxJetv4vYg2NgcNoY0rJxPs8RThX45UAwZ8dbO/F4+S+Hb5mQAIN9/7wXRafwCmWW7pEC0czjbrKTfk/jThcoMefFc66e95gcheAKo9msEPDDJTJxcTIP2n7jdOS/h3LQ8q6MBfXti8cVEssELam+Xm9Na+4IX0WZ0tP9R2CAe9sqMCjVSHqLl9y5JnnI+MvyGAk7/BJsJGk7AELxGDml1tH5MheAGYjR5dhhHe+No7i9xaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z21zLrbzck0YRU7xZ1+yXNuRUMs/p6MNAGGLBgZmPw=;
 b=X1nTJ5yiNB1AGBtQtRCRMsNeDax03b8sBsgg4u5dpdlXDPc0ZVeWYtwrOrGLCNOHOIowH99beID8VP/TfFzBvH/So7av+k4GZwovJAg+BHNLgKUaLBXu8rPGq3WJhfgVQKBf5kSDRHC5y0IStP69jrRpfEUSpxf7TZPw6dvO6O8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/domain: adjust limitation on shared_info allocation below 4G
Date: Tue,  3 Feb 2026 11:10:17 +0100
Message-ID: <20260203101017.56962-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0023.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY1PR03MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1af679-182d-4883-4ef7-08de630d1a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUR6bVdXTXliSWtlM3h5MVhIMzlpSmdJY0xHUDZRUCszcnMrb1FtVmpEQ0R3?=
 =?utf-8?B?UEVFcXdzMXg0OERjRVB2bXBDbUF4NnpYWkxZc05xVzJqN3VnYStWS1JaaHlU?=
 =?utf-8?B?YnFhNjVIbFdva2FiSFY2QW1xZGxKckdocGhyZE9YaVdLQVRGWlVXcWhCVDB6?=
 =?utf-8?B?VGVib2J2MGJaRUI3cUg5WXhEb3BZUGNjUHh5aW9nUm5xR2JtSjlMZG84eFEv?=
 =?utf-8?B?MTdacUREcTFKeXg4ZllWd0EvanVCVGpTdjBHNWgwbC9KcUpDU24vV2sva2pN?=
 =?utf-8?B?b1dnbk52dHFlbDlrQi8wcmxsMWorbUIvdXpVNy83WkVKUkhFb0RTVGNWRjZR?=
 =?utf-8?B?bDJtblVidm1WRllYb29VbllwWVo0ZUVPcGg2VlpXT1l4enVySm1mYXNGVnF4?=
 =?utf-8?B?UVUra2VuY2lYdzBtTnhkaTNZZG9vb1BMQ1lnUi92Z1B6cEVkWWFXdVZXWlgr?=
 =?utf-8?B?UGo2VENqVWovcUlVWXBIODcxSFZGMmlZTnpQR0U3Yy9HNVQ4aFRQRm9DRElI?=
 =?utf-8?B?d0RmSzRYWXE3ZjBRRURITDBjREFLN0gyaFYwcGdncktwbllCbml4Mmh3VDhH?=
 =?utf-8?B?NUFCQlFxR3BSaHdxWFNaaXYzOFVGc2thSlFucVpSTndlbS9seHJnZzB4Z2k1?=
 =?utf-8?B?WGpQVTFUYm82MTNtdVlkQys1dnJRQ242eHptVVBtcTkyTWdXT2J1TzloVXZJ?=
 =?utf-8?B?WjhHUXFKejQ4bnR0RnRJSjdiMXJYOGJOTlJMVnpkSWxGMkEvUGsrUTlxYTJX?=
 =?utf-8?B?TGZydFA2TUJ4SXIybEt2UHgvNUljSHFaZ0ltM09Pd0pNdm5vbGNVRzdaQU5u?=
 =?utf-8?B?c1NKRWZTYXo1ZEcwSk91eTk3YUhDTmdZUWtoSHZFYnI2TDR1V3ZzNFZ3Q3Qz?=
 =?utf-8?B?LzhCWjZEV0xRUmkzVHljL0lsYWtMS2x0UTFvR05mMVdGT20rVHZFOEp3b045?=
 =?utf-8?B?Q1F0aFJPODNJWDFObFJpckNiVURqWjZmbC9vQ3hSaVZvZWhPQ3pOMUQ1VWI0?=
 =?utf-8?B?MWxiZ2VTdTBIZmt6bTJUZ3hGUDZTYlVyYjhzUlhqZmpOQkljSlRHeE1hV2Qr?=
 =?utf-8?B?QURjNE9vcmIyY1ppRkdtTVlMNnkxM3JNelZTME1mOXM0R1QvK2ZGaVFSSFcx?=
 =?utf-8?B?U3dkc2NmZDU3WHJvY3hKbk1ZNVdFa1Y0VzFBVHQ4dVpIbUdRWWIycWtUWkZn?=
 =?utf-8?B?U0lkL3NWV1c1TFdmdTFaZE1sYng3aHJVK1pUaU11ZDVkSFBqeGhIVmNhaVV3?=
 =?utf-8?B?bmRyTnFyZE1DdW1tblNxT0xQWG9JclFJMDVKRFduOERwSUJjemwveUI5ZVNP?=
 =?utf-8?B?cXJBOVdORTdHNEJtZm45V2VkRVlOQnhvdStjZHBvY002UVpkbzhRZWM4UzZ5?=
 =?utf-8?B?WmZSYkpERnY1bTNGeUNPdUlxT3lvbXVMRzdEdGIrZ1JUVGZwTnVjQVFxRk1O?=
 =?utf-8?B?UHZCNXhJR0tvNkJOU1BVcjBwWEVRU2dDQTdRTFk0RjVIZ3NyM2FFa3hnUTly?=
 =?utf-8?B?WllYVjlzMURHVlp4bG9oTnowZCtseUpYM203SXo1L3BYK3FLbnZ6bnMyR0VX?=
 =?utf-8?B?Wi9LVFIzdmh4dnVVZVg4Nmllam1qczhVbzBCNnl2aGZZWUhOejFSQzU2Y0Zq?=
 =?utf-8?B?NXVtRG43RThSelIvWHFlU0EzZkZRa3U5YXl4Y0loSkFJYis2bEFVZit2VVJR?=
 =?utf-8?B?MGNLK3JoNWdmZ0U3dktlRms5bDBkTnVBYzlFbWNGUjZSeXR2bkEvQ3MxK0E4?=
 =?utf-8?B?aGRaVWxKbEFadDBGOHI4c3M5QW9ieG16L0pJY1R3d0lxa294djRXNzh6QTVy?=
 =?utf-8?B?aHZ4N1NXSytnK1d3Y3o2aCtrQUM0MnMvUWJKaUkyZzFpenFwbWZuaGltSFhK?=
 =?utf-8?B?WXNqVkcxQzRvellpOWdvYlEvVUJ6RGJibVhKbVgyRGI4djFSSDdrM0cwOHFR?=
 =?utf-8?B?eWJPSS9IVWd1a2NJQ21iYlNXb0Q0L2pqdnllSWtuZDZ0Z2E1bnhFZDdpU2dY?=
 =?utf-8?B?UFdKWFNtTU1jU1Z2V3I1cU5rRGZLRDBsQmxpeU5BNGZrQlN2cVhDV09Hbk1C?=
 =?utf-8?B?VlArU2FJRkR0ZXJJS1RJNDVOSDlKTmxZNUhBdUd3ajF0RGd6L2pEdEczMk1D?=
 =?utf-8?Q?Shfw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1B3RG5heThZWGdsOWxXcDU1Qm95a1RWd2UrLy9tbXFFZ29SdnQ3ekF2SnJz?=
 =?utf-8?B?M2xFOURYVTlpbSs2eURYK2ptekt0R0l6cmkyQnpBc0c3V3VUWGw0MHk3WlhE?=
 =?utf-8?B?cmFpa1ErMENKOVRIZG8xc2lUSEpwVzd1V25rZ0hyRUR5TmxVOUxVMjdIcnlm?=
 =?utf-8?B?cU9td2FhazFXMmVmcUFlaTRYSXdNUm5KM0o0Z2dpNitXU0ZKWmlxWVpQdHlo?=
 =?utf-8?B?aldtdHFhQ2oxSGJkY0Z6TUVWekJwSTFGTW5QOExST1g5VjErRElxc0F1ck45?=
 =?utf-8?B?MXdxQ3V3Z1dia1V5cWpTeE9RUFVhVlBIWGdHMXJyWFFhNE55QTkvL25PVmov?=
 =?utf-8?B?YUJDaWxDVjBmWURRa3RSYkc1WEJZdzZObTBIQWdOblRuUXB1M1hrTVhNbkxj?=
 =?utf-8?B?S3puazNaWUNFZjkyVTc5Q3JWejA5K1R1UTY2TFJNbE52WjNJeit5SVg0eEp5?=
 =?utf-8?B?TkxMM2lwTE54clpON3FWQXBtc2s5TEpqSVRLNTF5NitmVTFZVXkrK2FiNUlw?=
 =?utf-8?B?My8xKytQYVVIWTVWb0NQS3JBVk1IOEVWNnMwYi93MmxyaFZKanJNRGtNSEw4?=
 =?utf-8?B?NEY2V0F2S1ZYcnJ6UklaWXhYdDJuUE0xZFFyRXlsVXJ4ZXMzcUxUQjJiaTc5?=
 =?utf-8?B?Q2E0UHhmSDkxZmwzT0pJdnA5MVE3OUNmWDlSdE5IeUdjeGNZWldJS2J5cTl3?=
 =?utf-8?B?UUVlNFR5Szd0SWtPS1V4RktLR0xoeEY2andwWTY3Z2pmLytDYzcrUWR4TlU0?=
 =?utf-8?B?QnQ4dFBQS0NkY2owVjhvWFdydW5XZEJpV2tEK3Y5Q0dNQXZralRPeXR6SkdK?=
 =?utf-8?B?K3JQdDZwUjVkWVhJdEc1eEo3d2FFYVE4eVFjczVSWlJBM29XL2J5dnFNWWk5?=
 =?utf-8?B?VTMyRVNvNThpMmhsZEVIaG9XRk53ZkVGVUJRTjhpK1k2SnRSYndyZFFNV2tM?=
 =?utf-8?B?UWRSSE01WENZRDdOdDFFSVhYYnB4ZEZ1aVJQcUE0VlNaUzZKc3F4Ri9ZS042?=
 =?utf-8?B?YnptMEN0RGgzREp1b0ZGY29rekFFNFpaSzhHUGtYZTlVcERjYnlhb09SZXN2?=
 =?utf-8?B?eXdEQ3ZyczE3N1NVWjVsOEw5cWcxaE1HVW9jU2xLQmJ6L2J0dURyR0dqOHgy?=
 =?utf-8?B?cFJOSE1tOWlNWitYYXd6enlMS1BJRE41bFZ6SVduelZ0VWV6ak1KZEEzc004?=
 =?utf-8?B?MUw4ZldVamZJSlovQlk3M1BQak1VQUZKdWx1SjJlQjVlcFpCZ1h1MFRyWXU5?=
 =?utf-8?B?aUZMQTRKMWhxQ2FyT3dVT1BXS05GeTJsSW5xbzVYNnhEU2dKU0VaVWR1cVU2?=
 =?utf-8?B?Z3J3aWIxZU5Gc3ZobFhNRDFtbTlrT0JkY2lsL2ovaDVFS0REckRWVHFnUTkr?=
 =?utf-8?B?clA4TDNTSDZ5azZXYzVDTkRLaGtJMnA4a0Rtb2Z0WlcrVklZTVk0NE8xZi9T?=
 =?utf-8?B?T1o1TUUzamRRYlBNWmpMS2pwVEJNYkxra0MzdjdJbWxySGc1N1FrNnF1b1pi?=
 =?utf-8?B?R0g5RmZhMHFtbWFwTXJYREhKZUs4bTJDT3RSbHAvazBnQStyM0Y0bnphbnF2?=
 =?utf-8?B?S2phL0t1dzdNWVBqbmY3U21jZ2N6SDRTYi92NWxoZkl1c3l4N0FsekRZMmlo?=
 =?utf-8?B?Y1dJWHVveVFsMS9jclBiK2tBR0ZwdDdMRm5wZ3FpeVZwd1dYNGYyMGJvYkJX?=
 =?utf-8?B?WXlJR01qb0o0VUV0WDJ1cW9mYTAwb0QvbXhvMkJpZmR3eEx2SUN4UU5UazB1?=
 =?utf-8?B?ZEhWWnd5Qk84OFg1MDZWUXBzc1BoemhsZFd6eG5rQjYwL3RjR1UrRXhKUHEy?=
 =?utf-8?B?c3orUis3cHBTalptY3VQK3JRekhmN0poSytKalNHcWMwcVc2ZGVkeFFGSlJi?=
 =?utf-8?B?cjd6aWdpQk5ZeTFFYkxxaEVyRWJuUHBxQ0dvYjRhUlNUVjhSWmNIUDkralhY?=
 =?utf-8?B?d3dQR21wb0Y1NjcybWNBU05tZFpFYUlsYkVZVEoxNjlYYVc4RHZHWS83ZlVm?=
 =?utf-8?B?UzVrUk1OeFZNc0t5NjMwUGMwUUh0SWE2MXFUTFpwT0w2YnhWaVRwQTg3dzV4?=
 =?utf-8?B?UWUrcGIxTGhXNVozaGRMRnE1bURqUzYvWUU1Ukc0a0I5Sk5YdjFQSzhRVjRy?=
 =?utf-8?B?anRVRUV5b0NWZFdlRWtyY0F1cjlhOVRObzVjRnBsNkM1YVdUZFA1SnI3SGhm?=
 =?utf-8?B?emRxQUl5eGpCRUhWQnB1SkpLdXlsWEJHZXRwRzdVaUVKL2owYnZJY01tcjla?=
 =?utf-8?B?S1hnVlAvbjRkcEFZd2dCVnJhV2t5eUphNXpIZ1h5azVjMHFHSkZTdTZ4TGtW?=
 =?utf-8?B?Z0pwTHU4RndqcmlmTHBlK2o3bUhoMFBYZHFWalgzK1c2VWVzWjhidz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1af679-182d-4883-4ef7-08de630d1a09
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:15:05.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kH7Jrnfr81ROGvdZXvKGDCTViNnf2ih8Fx9afPx+KWgb/lbYu2YocCk560oCUncNjCbzbYKB3DmUGBhltA/IaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7873
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
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 35AD7D76B2
X-Rspamd-Action: no action

The limitation of shared_info being allocated below 4G to fit in the
start_info field only applies to 32bit PV guests.  On 64bit PV guests the
start_info field is 64bits wide.  HVM guests don't use start_info at all.

Limit the allocation address restriction to 32bit PV guests only.

Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index edb76366b596..4163568043b1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -882,10 +882,13 @@ int arch_domain_create(struct domain *d,
         goto fail;
 
     /*
-     * The shared_info machine address must fit in a 32-bit field within a
-     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
+     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
+     * field within the guest's start_info structure. Hence we specify
+     * MEMF_bits(32).
      */
-    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
+    if ( (d->shared_info =
+          alloc_xenheap_pages(0, is_pv_32bit_domain(d) ? MEMF_bits(32)
+                                                       : 0)) == NULL )
         goto fail;
 
     clear_page(d->shared_info);
-- 
2.51.0


