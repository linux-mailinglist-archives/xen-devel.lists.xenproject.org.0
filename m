Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO0JFOn2gmlVfwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:36:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D631E2B8B
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220091.1528809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXQS-0002Ui-RL; Wed, 04 Feb 2026 07:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220091.1528809; Wed, 04 Feb 2026 07:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXQS-0002SE-OY; Wed, 04 Feb 2026 07:35:48 +0000
Received: by outflank-mailman (input) for mailman id 1220091;
 Wed, 04 Feb 2026 07:35:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnXQQ-0002Rz-Id
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:35:46 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d74e244-019c-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 08:35:45 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6193.namprd03.prod.outlook.com (2603:10b6:610:d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:35:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 07:35:41 +0000
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
X-Inumbo-ID: 1d74e244-019c-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQDEgY5ZuNXNCxiZ+Aqc0HvfurGChnVK6eqHpOuhGQN+bttlF62XfxSklXFQwSxajQ1SEaFRDRjQ9lrNM43ui2itevK2vgqyKHgigMvrj0uPpgMf3Go9Ab4aHyPJRZjnJmfnR+X7b5IdscWRjOEy5JjboFITUvVqr8Q7UUvXFCGpCBbXIWr3om8I8dRWx2CPvpmBDOXGUSYMT1Jj5DK47DS/Dof3YUmCPibC7lQgBrUefSI/rLtOcA1foty8DmbvpqE7ojM4wOWObbNhws81qAhZu4jRcEDBeQWCMi9xlXDebFiW9qO3OyV9u6t2Hh+4iw2pnlAnCP+qHzqWtQHT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCuPzVhmIQA4R9yXsSRCBeP/o1eGAWXwnmLxQpdbBuw=;
 b=kIfNNs95kdiIgpWn9m3K2Ie9FQE3cIcFbYO2EyILnbLFoJddu3Pczth8NHH3GzWbIvoKw5F7RZGsLNbpApGApPQ0jmrPU9XgpBFIxZUmPPYv+aauN4GLwGLF5Cd7PKRWd+HP1HimJK9n8mrgKg9ephIaohqbvxmLEtb6hvYTlotc3/hh9A7E2Rhmrzqg80AfvpJmezzM9Q8UulkEOjI/ff6hUx864gWNEvxqQBpHjwG19S+Hit6bwguMvBeUgTyw6f6USuiD5N/iaBVZutXA++EuAyiu1w/848rsMRlXrnvxfFzlK4GbeGC/Bnw97qTnuEYmWGRD0D8YQQawHAnaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCuPzVhmIQA4R9yXsSRCBeP/o1eGAWXwnmLxQpdbBuw=;
 b=M9K5CKvVhYflrTaILZiT+L+8SoPdRwUPfriruY67YTsQfD53D4jZr1/nWt8IIB+0LMuowaMUvKSrE22LK1p1Ds2cznU+618t5XaXz3wqngfNrA4ihi62VIWXTgkZaySMEdKG5MEpQIhFBiS3pTtomqWa1Ge+cZf2wssBYIv2O0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 08:35:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/P2M: correct type use in p2m_put_gfn()
Message-ID: <aYL2yt0g8HGdpOTA@Mac.lan>
References: <1ecefc98-f1c2-4116-95bf-a86c3b066843@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ecefc98-f1c2-4116-95bf-a86c3b066843@suse.com>
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b7bf86-db7d-4e61-4f31-08de63bfffa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3laLy9vTVQ5SHliemIwb3ROMzFkY1RqRDhUQ0tNNGdMYytESVU4TlJ6WC9E?=
 =?utf-8?B?ZzlPZldSSlVtTElOV1RsbjQ4SXhtdUVmenp5UW5wY2ZTcG5Jb0lKK3Z4Y05v?=
 =?utf-8?B?K1J4UDlwbmNISnpWSkFKd0Q2bHZYclZVWTZqZGFkdXJPVHppTDlicE5PVTRy?=
 =?utf-8?B?b2k2ZUJEM24xVm9uUkVsbGxnTmtkeGFhN2x5dzJwSGQva1hja29hcnpzU0tj?=
 =?utf-8?B?UGxsMXlHaE9CRktHeCs1bWFBVlFGcHB4TklyalVvTXJpUXdMMXg1bEFxZ21G?=
 =?utf-8?B?YVRkbGxhV01kdThVU3B2aGNWVzl4aU9DVHRTK2ZldGVQRmQzaU5aeUF4aThL?=
 =?utf-8?B?cVRoTjA1bXVUZGJ4VDl0SzdDd0x0dnRKRDdyT01yR1dZZkY1OFN3clhuc1h1?=
 =?utf-8?B?TjJNRURJZkE3MU5QWnF1OFNpZzVEcEdFbXlqSXVvNlRtczY5OTdGemF4djRn?=
 =?utf-8?B?Y3ZnWUJ2V1dmWGh6QmFiSlV2TTZSeHllV0NFY0xOQ29aU3RnL2ZMYndhaWRw?=
 =?utf-8?B?YXVIN08zNDhNVGtBT0JySjRUcllVMkFBWUZTS2h0QytUZVZIcG9EbEZiTW9t?=
 =?utf-8?B?UE5VbWJXTXFaTTczQmNrVGdOZXFIcjhsTlFneXJSRWlTZVMvYTViUTVjeTR4?=
 =?utf-8?B?bE0zU1N1N2pnbjI3NkZsWE9lbW00LzZJd01ZK0s4STJ6TlFBdjVWeUhsYzVC?=
 =?utf-8?B?WVRnNGthMHgva1NLcTFZcm12VEFkUDV0QUhXbERFdVFyL2NadXY3REhUVzhO?=
 =?utf-8?B?NFdGWHBLV0xYaFVuNVp0RTgyNnVhR0lXSWxtUDdsZkpWK29pTU5OYjcyaVIy?=
 =?utf-8?B?akpKRCs2N3liOWthcGJiMHlLRGhjclF0Z0dtVnB2OVNIcUxWbStzbDlCYm83?=
 =?utf-8?B?RFZhOWk4ZmhlR1VuN05oWXN3QlR6Y3FnWVp5Z244NytkUytibkNkMnd0enV4?=
 =?utf-8?B?TmVkakZNblVwenRocmlHcStxL1BzbHprZENWT2JtTXhSQ1N4L2JtYjR3S3Nx?=
 =?utf-8?B?OVBOaVRPR1F1dVE2U291NnJ4K01DMlRWL0R3TWpDclk3eFBQcWlRN0g1TEsx?=
 =?utf-8?B?N09UMFlnY01kL2UwejA0bDRNaXV2cUhqU1o4YTEwa01lREZkNWF6QXMwZzdK?=
 =?utf-8?B?Mkd2a1gveVQrdTkzSThDM0FLMmdZRmQ4UG9TK3UyTnVKM1dzcHVQVytNSUVI?=
 =?utf-8?B?SVMrVkw1a2JWeGV4NUtkR2owQ21sZWl2TW9SUkhLTG01bk1HL0NWTy9RWUZm?=
 =?utf-8?B?L0xHcUxzMzZBWE0yVm9QSngvV1VocXdEUnhDVXRFTGlrMVNGWmJYU1A5bkZW?=
 =?utf-8?B?bDR3R1BlTEZrOE9jUHA1ZCtRb0dnaElRZXowY05HajRhUUwyeWdlZGFUazl5?=
 =?utf-8?B?YmpwMlNaZEQ4c2kyeC9zWDBPS2R3MkZQZjJOVHNjYjRtWEJ4Zzk1ZXl0blpl?=
 =?utf-8?B?MnlmMzdFMHdmNVp0WTNlQ3NseGZ3dUV2b3FadjQ4REZneTlLNVBRWnhJWWZS?=
 =?utf-8?B?VVZpMFBpYzBQbzg4UVFQTEtsNmJ5TDlkNnByYm5yeU5FbENSSWwyN0hNc1Vv?=
 =?utf-8?B?NlJ5THFrNEs4UEhKem9HOXF0ZkhaVE45WDJVUVlzNm84aVFud05JMEhlTmg5?=
 =?utf-8?B?emlhYlU0c0J2a05tOU9mYS9CaE1QRkxYcDNQaGtVNXlnZjFtbldHYlhobUpJ?=
 =?utf-8?B?QVJzNUxha1pESFZVWG8wMmwyRXUxU2lDM1crc2EzVFplL01YcHFDTUdlNnFI?=
 =?utf-8?B?eWlmVDVTd2Y1cStuck5qbnA5LzdaNUpac04wQURNZ2VoUytGNk43dndNd2pN?=
 =?utf-8?B?KzVkUHpTRFQwWmJqclhJUUJoc1hsRi92azVHQTFYU2xoaFlNNzdreDhhUUM1?=
 =?utf-8?B?ZzNVdFIrNzdHa3U0SG9HMzd2cllzVEhBMnBOakg3ZUdDSlh0RHVjb2srRnQ1?=
 =?utf-8?B?RVVFMlJLRjBhWktvc00yMGlJdXVOcDdiUmFYWFFoUEhXaFFlblF0TDR2WDA4?=
 =?utf-8?B?VU1Vb2pZcWpvRHF3bm82K011dVpuYWF1SnhBcENGbnRsNjF2dlV0NW12ZUpS?=
 =?utf-8?B?TzNZREljTlhzRFNnaXlRMDhQZXVaOE9LWmoxa2I5Q0ZnN0N5aEE1ejNaVmZL?=
 =?utf-8?Q?epCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFZaYmZlR0h1bUV6K2dvVlBxbWdEYjljRSsrRm9rN1Q5d0dENktyb1dUa3kx?=
 =?utf-8?B?blNwZGNhWC94RTZ5VGVKTVVNOXlhL2l3MW1iL2J1ZEdvRmZTdC92dmdXY0FG?=
 =?utf-8?B?K2dNUkxhbnp2cUN6MHlqSW1LR0Q0ZVdGY1lYRllBZ2g5NlB3eGhMRHB4ck9v?=
 =?utf-8?B?S3dYYXduR1hvWXRhcmRXZWNIK2syNWo3OVY1QnJ1RlRIUHNNOFdIZkpjUW9N?=
 =?utf-8?B?MjNjMTBBNHRDM3YxejN0VTZVNURMb0lqdkJORmM3THdkTWJxeHpzTEZEckVl?=
 =?utf-8?B?WHZ5ZWdzQS9wTjN3ODJXNzFDNkZkSlQ3dEZPckI0Nm9mdnR1YXc0Mm9TTnl0?=
 =?utf-8?B?Y3hzU1RhU2l2N05IeCtoY1VqZWZzUHpFaWkzU29IV2t5d05NUHNZdzl0dmND?=
 =?utf-8?B?V0dFWHBUZ2lRL3R3UVdEOEFpeUR4Ri8rVDFma3hrN1YrWVdwVkVHVjBYeW5C?=
 =?utf-8?B?SUZPZnVHVWFueW9xVk1TbEgyaG5VTkpMQTBSZ21WV3pPeElFb3B5TGMySzhi?=
 =?utf-8?B?bDdPa3g5L2dRRjdyS3RPU2I5YXBDWXcvclcrMmhjSTVXaTltaUxCVnlmdXVy?=
 =?utf-8?B?bHM2SUptYURRQ00yRmx1anZlY2NmMWpMZ1ZBSU94eVEzUmVDYWZ6Z2IxYjZV?=
 =?utf-8?B?RVBEVVBXMThqOFM0WjlHK0RFRm1YeUU5ZDE1Qi80V1hRSzlpMXVlaXR2cDJJ?=
 =?utf-8?B?OGRidnhJU2szVjFaWlk4TzNkVGd6WkQzVnJaS0tHZFRxUlMxQ1FneWhVUXRC?=
 =?utf-8?B?UGZXVEFWa0UvT05zeXYzRGh3enVuM0IyeFB3dWVsTW5yWE5jUFRvSS9kTGh3?=
 =?utf-8?B?ZlNQRENHZm1vdGZ0dG05UngwYXg3YjhTYVdaOWNrNWxNNTZSM0N3RlQ3emhH?=
 =?utf-8?B?a2JabXg0dy9QUW9uL0pPdzBFUUZLMUVUTmtkY2UrcEUyN1B4MjI0b1RXWW5J?=
 =?utf-8?B?R3pkNWxnYWFSQXd6MDMyVmlEenpaOHhVOVlVOEJEaUV2UDRFZjc0NVVCekk1?=
 =?utf-8?B?SXgrclJCQ3ltZFNNUnl0b3IvMVVUR01BbUQ2eDg0LytoczJBZkw0WStvSC9B?=
 =?utf-8?B?dzNIb0ZkZzFuRUNsVGUwYnZzaWZhWXV5bHRuZzRzdmJPMHRnK0RIblBOWFBU?=
 =?utf-8?B?M2ovd3NaSjRCWXBWTzdXdDlKSXNBN2loOFFRQ1dKYVlvd3ZpdEJYTDZ5SVhT?=
 =?utf-8?B?L01STVBQSnFuU2l1TVNCOGpXWk8zck1McTFIdkg4M1hJT0hETEFGOHZHbm1G?=
 =?utf-8?B?c2lneGYxb2pvSFY3VHdQcGFWbW5QRTR6KzVVZVJFYnJ0QVlJWFBaNXZYSi9L?=
 =?utf-8?B?bHBubEErWVp0aXlNZG02dUpCVzlYUGZ2eUZQbStEMm1ZWjN0M210TnhkNEZS?=
 =?utf-8?B?dW5xaDJHV2dDUytkMUR5ME5DQ25sbWx1b1hOQ1VNQTgyRXZqZG5BOHhqeGhQ?=
 =?utf-8?B?NDVNK0J4Y2lmOGY1SzROTktiTzQ1ZDdocm5QdEsrWkNiN0N2Zkd6RkUrNGdv?=
 =?utf-8?B?VzczTFk3UUpZa1RDcUUwcnVuRmtWRk83Z3JJRzdPTkE1SERDaGl2RXlNZ2hK?=
 =?utf-8?B?TFV6QU9tR08yRXpTM05IejFMbjVlSEdSaDJqcktqbXdER2lHZmVYQTkra0dJ?=
 =?utf-8?B?ZXF0WnZqVVFRWENwZGMyWkhjRkNHcXZuTER6T2xXYXNzc3d4RXFRS3pLVlZL?=
 =?utf-8?B?T2puZk95MHJWOEdkYkxLKzRyWVUzZ1drbnRMMWFUWXhuVEFrODRCV2lYdEww?=
 =?utf-8?B?cnZ2SVprNGFMYTdFa3VvN3BJMWpUaDFlQkVjc2l5SnVFdkQ3UEx2eWt3ZDBw?=
 =?utf-8?B?OW93L2tBUVMzQ281T050aUwwaXVWMmxTVVRqQ0xwMjRVOWgrdjQ3WFUzdlRU?=
 =?utf-8?B?Q3VHZmgzclFMdnJXdWMwcjVXQ3B5UkQ0ZVp3QVVWbGgxM1NlRWpBRXI3VG9o?=
 =?utf-8?B?cWl5dTJ0NFdzMk5UYjBEUjg1U2I0RFNWVDh6MmVxbk91Wmx2eDVXVG5LSERv?=
 =?utf-8?B?MXNMT2V2Um9Bak5zRWJuajZubHdkSDJQYnR6TVA1T3pXVGgzRFZ4M01MV0dZ?=
 =?utf-8?B?Qmd6bDViVWhqOFhsS2xYVTlKOGt2dkZsSHdpc1pGZUVoWGRMRTV4V0dpT28y?=
 =?utf-8?B?ZnF6M1BtVUE2MnlJL2dSN1VOZEkyRlNGZXo3Yzh2VUVsLyt0UWxPbEhBK2s3?=
 =?utf-8?B?OUZoTG4veHpzU1MzMG9XMVhwT1pUSGEvcEJ3QWg0Nlo4dVNHV0RNVTdBenFp?=
 =?utf-8?B?bVRzZVFoMmFra3hZaGFMMDZ5MXB1YkFIckVpdjBoY2NYZ0NaQXRsR1JxMWhp?=
 =?utf-8?B?aTU2YmY0Q2RFSitFb3I5dFplemJyV2t6RUQ2SlFhZTI1MmFFazB5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b7bf86-db7d-4e61-4f31-08de63bfffa9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:35:41.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rja+/UG73Pd589f4zAO5K/KK71IgcwUbAJRFD9z7ynbx6JeYG7PMke64Y4IOKWbIe67qjfblla6vUyaYURht3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6193
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid];
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
X-Rspamd-Queue-Id: 9D631E2B8B
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 03:01:27PM +0100, Jan Beulich wrote:
> Everywhere else gfn_t are passed into respective GFN locking macros: Do so
> here as well.
> 
> Amends: 819cdc5a7301 ("x86/p2m: re-arrange {,__}put_gfn()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Easy to spot by adding ASSERT(!gfn_eq(g, INVALID_GFN)) to the respective
> macros. While imo that should be a correct thing to do (as with
> hypothetical split locks a valid GFN would really need passing in, in
> order to be able to figure out which lock to use), we can't do so right
> now: The lock is acquired ahead of respective checking in a number of
> places, e.g. in p2m_get_gfn_type_access().

Could we convert those macros into static inlines?  It's dangerous to
use macros like those when the parameters are dropped, as the
parameter is not evaluated at all.

Thanks, Roger.

