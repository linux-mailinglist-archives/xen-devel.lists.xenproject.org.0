Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPGSJYCwhGk14QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:00:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9124F45CA
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222069.1530116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo0pP-0003t1-Bl; Thu, 05 Feb 2026 14:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222069.1530116; Thu, 05 Feb 2026 14:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo0pP-0003rM-8J; Thu, 05 Feb 2026 14:59:31 +0000
Received: by outflank-mailman (input) for mailman id 1222069;
 Thu, 05 Feb 2026 14:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqXU=AJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vo0pN-0003rG-WF
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 14:59:30 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 419ee51a-02a3-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 15:59:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6145.namprd03.prod.outlook.com (2603:10b6:610:d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 5 Feb
 2026 14:59:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:59:18 +0000
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
X-Inumbo-ID: 419ee51a-02a3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leG5IRQ6WELDIGCanNZWE18Bnb3BsoG+acjEonnE28yWRxjODgUcNzDfT+UrXD5O2u5TiA8h0y9qLXSuFyeq4zRIf36FmNRFmXu2aIWr0jUB+R2+KMaMFQf559L+C2IZoGxLPShrKMzOt3l/6wJ9W7U0wKLxaHlkcXmt4t0uf/IipkdCV9IX14pz6CYFwTRQbPmUBoVmGG6Wi54NIfCUpk71NOhQ87hbK/zg6VW4WtM6DQagdn8uXPcoSqabOGmaswhLhOfADd8yxPvFTVJ4NTeqfT1HtNJDqhkZRGOMCIaTZ/c2CzJofACKKdlPja81mgJbxfpwL2JETQOotBJMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAgvj105r1XUSES0+bqszkrt5vEC6Yy3AtKCOMh/jsA=;
 b=BQkYWwtcXbUHpD9vhOwJb3rqQrRz6rN9irb+YA/7Ner+BGEkjR66FAXMvzpfrlawpCcwPHDt+QuJ93bIWmD9RxrvhH3wj86s6+gOWGx37qNZAbcO3VqKbNyDjg9rbConYlhNNI9p4pMJaiUnMVHQenzlL27q6DTCa6YeW6WcmzHiFJaQc/NTjaWCmx71izc4shYXZjwLme4Vfg/7LAu0ypHgnQt5kxEQbdxhR/ENMXAvWmRN1owrxErQUiJ/gJgUBw9yinjYY95KQjroiIFUZ/NWxU638AOtzyloSlmkylAM7bft/n/G9L/E5QCn5LnkaBP3b87hQLILQl6wGDdszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAgvj105r1XUSES0+bqszkrt5vEC6Yy3AtKCOMh/jsA=;
 b=k72283hy/izTT08815kygpwBGfcqD6MdPrKjulANUKwrXUvfDwVPXwuoDQbCyVj+4J5n1TLYUxzpIDfju2CHxuwaCqu4MOe0Y9J2CJnOtE6MY/nk+CcL4TT6680sV4UvPludUA6QOSt7sJbO5LiKpYTG0KrwDYPmHJXYRRbRZok=
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
Subject: [PATCH] xen/arm: use BSD sed compatible regexp in SRCARCH
Date: Thu,  5 Feb 2026 15:59:13 +0100
Message-ID: <20260205145913.99032-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2083a2-ec99-48d8-7142-08de64c722bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUJkMnIrSE1YZC9TSkdTTW0xTis0RVM3MXgxSEJIVTh6aTdOdUFvVjBzd3Aw?=
 =?utf-8?B?eHdieGt2MHZxSUJCUVJoZnY2Q2tYL0RsTENvd05pbWRVYThabU4yQXpaTS9F?=
 =?utf-8?B?UWpKU0lZOXJxZzFIMUVRWWtiNnVyTXNoUCtYZWRjaXVPK3UzbmJLREJOM0dl?=
 =?utf-8?B?dE02SEFlZUJ2dHh4Lys3WDIxREcyOFBlbjVRck5GOWVvTHFsUEdaY3RhcjRS?=
 =?utf-8?B?bEpNSkRKMFBmcHp0STBnMWRGTnU5UUpldG1oTjdGSFZob3dCdHJveEpmZ1hZ?=
 =?utf-8?B?MWFXVWc5RGNtMkxNd2VNWGJGbWdDaHRLbmVFeGtMSk40RytBZUdUYjRuaTN1?=
 =?utf-8?B?ZzFPM3IwQ2xJZTY2SnEwS3d0a2swZkJGb2paYkgxWk10N2FpY3hkK3BIOXpT?=
 =?utf-8?B?aUV4bVowRTlFQWxMdXMrWjJDbmhLbHBRU0lmQmU2cFU0QjZoaE8zeWVOdjFj?=
 =?utf-8?B?cWFIZ3Z2eUs0RHBJS0pnY3VGcEp5UDFORkYxa1pxc0w5c0lJVjM0NXE2dWZm?=
 =?utf-8?B?bVlHMjBka2ZhV2JSR2k4MUpZMFZ3M0trYThKdDM5OEpGc0wvU0xLb2s4Y2tO?=
 =?utf-8?B?MWpTd0xWbVdCU0JJcVNwZlJzaDBScVIwa2VLVEJBQkZKeTRZL1RBU3c1Z3Jv?=
 =?utf-8?B?aExxY294Q1hublZMNk9vdnlTNFMwNEJRd1ZJcVJiRlNzbDJQaFJ2WGxHSUZV?=
 =?utf-8?B?RERheHZzK0NDaWg2WDRrL0o1RXBSLzFRaG5Xb3NPTDhTZGlWMHBUUFZ6MStx?=
 =?utf-8?B?R2ovc2NFZFNMYnFHVWFoOGJValVZM3JaaGZWamgzY3kxd0trWXNpckR1dzJr?=
 =?utf-8?B?U2pTMzU2T1pWa3JwNUcrUFJvNTN1SzZxM1BYNytKM2xFTm1UemVDKzE2cGtU?=
 =?utf-8?B?ZkRiUDBSa1h4eW41eUc0eG5vRmRLTXBjdlJrazM1OXB4MjNhQ29ydlZ3aUVG?=
 =?utf-8?B?S0ZMa1pYN3hreG5WR3YyQWQyZUROZlNjV2pkbVlxenJLRndoUDNFYUxpRjRX?=
 =?utf-8?B?N0RyajdOaWpCZUd6NVc1QmRydmI4R1JhaVRzUkx2YlFaL1RtOUk5UERkdzEr?=
 =?utf-8?B?U1hpbytBbDU4b3UrNkNXa045cXd3TWRiVmRPK1BQOWYzZXNUMDZ3YkdGYUFV?=
 =?utf-8?B?SWpaSWRac1RyZ3N4NkQ2cFM2WjFpOElqamlEMU5INHk3Z2wxM05GSVZUVTgx?=
 =?utf-8?B?TXYyWUVCck1vZjRiQjJhK3M2cDFudittdW9PZ2RCM3V5OEFidVFSM2VKOFFz?=
 =?utf-8?B?akRWblBocDJBbzYyMHpJTThPaHZOd0EzeUJ4Qk92YVorS3RTSThkQmNtYW1O?=
 =?utf-8?B?bGltaVl1bHBQUDlBZVhjZ29QTmk4NlNXN0oreWlTczYwWEFscjZRYUp5d09F?=
 =?utf-8?B?NlFsZy8za1dabkordEU5eUJFOTREbXBoRVlWdUEvblNwTVhHaEh5UlRBcWJE?=
 =?utf-8?B?aW4wKzYwV1d5ZUNBeTZKNzBWRkFGdkRWZmVrWW4xT2tHNHppWUk0dFlDaDFG?=
 =?utf-8?B?L2NRdStQcjI3YkR4cWJ4WDVUTGlseTBpTytLWlVRV09iV25YZ052WkJJTzM5?=
 =?utf-8?B?bGZiYmhOeHpJS3FHUDdOQ0c5eWpTczM5WEFjc29IcXBUUHlzcE4wRUtnaXgz?=
 =?utf-8?B?OCtaNHVqRmYwcEZYUGcxZnBTYWcxSFRMS1laeHlvUU5sNHBPVG5ZNkpPc0FD?=
 =?utf-8?B?UStHcFBhZHI3d2h4aVpnZTRZSGlwdk9EMUlUbHd2K2dkdmNjUU1LTHlHM0E2?=
 =?utf-8?B?M2VoN0RuOHh5NEhVNWdIdkxIN1B3cHdDUkdURFk2NjNhVExiUGFCUzdLT3Vv?=
 =?utf-8?B?WWEvVTFGQytzNis4Smt0czRXSVVpZXFxYXNSWmhwUWx3YXpyVVRtMG5hL3pU?=
 =?utf-8?B?ZkZCVDNzeUQwODRRaHRnR0NkZFdOWTI4Q2Mra0ttVWtmcTVGU0dMR09zRjBL?=
 =?utf-8?B?Q00wWCtCcEt0L1RQSjZwamhNanY1TTlsVXBmcUpwckNqSHNRNThkWkFRYTd3?=
 =?utf-8?B?SUFGa1dHb0lad0pPSGJXM2t0Y1A0eldLcmU1SmNqVFJtYVVlQTRRMVpyQXJ2?=
 =?utf-8?B?UEZjWkVmVnZ6VzlDRmlyaXVMK0xoZjVNaHF0amY1MFhYR2pTanRWYmdsZ2Z6?=
 =?utf-8?Q?hFbY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVNyTDV0b3JqckRwZ0d6M21ONmJDNjJzNFg3K3AybkVJcDR2TWxHUlVnM1ZG?=
 =?utf-8?B?cFliWG5UUFdKQm5EYSsvUitQOFJ6YmJsamF2L1k5UUlZZmRxYjBGbmtyWXdl?=
 =?utf-8?B?OHhZZEdLWXljdzRHQVFIeXpDZEhhNnVJS2xWcU5QRnhGaVRKdko4dmZYWE1a?=
 =?utf-8?B?bFhOQjQ4UHo3bk1zRGNDOVh5a0ppK1ZveG1heVJwazR5dXlPZC93eDBVVHJP?=
 =?utf-8?B?eTY3VUpoODJlOFlyMlczblVUOTB3MjRlQ3hXUnFvQm1vNi9NYmNQYVNSbFYz?=
 =?utf-8?B?Z2xHQXJvVnZWUTE5Ym0rQ2M4cElkMEJ2T0pHUEkvUUhKMHJrVnovOFd4KzNI?=
 =?utf-8?B?cllUcWdFdjdjRkRMdkxZVE1QWVZyTmhkSGZlYU9XYUZEY1Fpa2FHQm9pamNQ?=
 =?utf-8?B?SlprcDlnRnhQN0Z3aTJwWmlqZmlnYXRBck1KOVBHQVM0MWV3QXkrbTc3Z2J6?=
 =?utf-8?B?SjluT0xaS3hDbHQrekNad3I0K3I0S0NzaWZUNEc4ekhxNUV5MUUxbnErUEFt?=
 =?utf-8?B?QUVMNExWWGdyNGprWGFidk50MVV1RmlRdVlHZ2h2cG9xRXZYMmJjalVBRVVI?=
 =?utf-8?B?ODFzeUs2dGZwZEt4MDExOU1BMjE5SVBnMTBHemlmTUtOYldmaERhWnRRVkFD?=
 =?utf-8?B?UGZCNlNzaWZYVEJ3a1Y0TGh1SDJHNkRQcUh3SVZhaWhXY0xtMEw2cnVaeDNa?=
 =?utf-8?B?UmNFZ0xOT2VucGdmOEpDVUJHVWpTRjVXbjhCaldxcHRSeUV2L2JZZ1pDWUl0?=
 =?utf-8?B?Qmc0THByVUlmc0hKRjdzK0VJNWJuVittSDFmdmY5eTJBN0ppbW5sTmphbW9Q?=
 =?utf-8?B?TllzMGRDR1JWTUplejRyK1dCcTQwN0lMSzZOdDIvWVFoTys2VkJFTlpLc3NY?=
 =?utf-8?B?U3JNSDFMVExKUjYyVzFQT0hnc3R5ZTRjRVhrbU9aY1ZjMEhSWDRqcllIUHhn?=
 =?utf-8?B?N2kzdjdPMTlLdDMvVkNVRTc3VVl1SHhBUmJIWmtwZlBrc2RaeU5Lemd3U280?=
 =?utf-8?B?ZU5aS2daSkMveDE4akNrVmpMcktFc3BJNExOT3oxa1ptK1lnakMvS3puT3JC?=
 =?utf-8?B?WTBvWlliZWErRjNiK0pVNyswWXNWKy9nWkhJb2Q4UlN4U3VESWZ4aGdaTW1u?=
 =?utf-8?B?bm8xanJaREtwdjdRZ2JCcjVDY3VVRllpM3hDUDhrVk5Eb21XQzkzeEpCNEFi?=
 =?utf-8?B?TFhtOFV4d213ckVBVkhDL2JpdElTRFRjeEY4dUVGQ0VabFpQczZPRWllK25x?=
 =?utf-8?B?eWUraUJrMk1JK1JxMUl1c1BJenRVNzhVSEZRelNqTGkvQU9jdVJPSHhLZWJJ?=
 =?utf-8?B?NmZjN2lPblJGS0xVT0oydkp2M3cxVmtQaG1qTFpaLzEvamdkR3l6OXMxUWp2?=
 =?utf-8?B?NGJua2x4SnBhVE5UZzBOVmF4d1l4QUQvL2VGanR2SUFFaEJ3aE5wMUx6Q2p2?=
 =?utf-8?B?Y1NZdFFHZUlEMHJFWEppMFg3UzlqWmduUWlBb1A0M04ySk9CT0ZtbGlCTWMz?=
 =?utf-8?B?QWNwSUxueHVUeW9BaFQ2S1Z3NytDSE9SaEkvaVZrbjFTTGtxUENVRVRyNFdK?=
 =?utf-8?B?NDBobVFLNnZmeWtBOWplQ1I0Rk13dmh5OWY2U3ZSNHV5L2JCL1RqNlAyd0FN?=
 =?utf-8?B?cHhUUEtrR0wyeUU4aTBTRUpTSFErNkduYmNwN3NqTmxTY1VzbDhrUVZnZDhp?=
 =?utf-8?B?UUNla0VtY2VwNC9LTTRQUTVrc1p5b3hKTXk3ZTA1SkpZK1huMFZvRTZJTHNy?=
 =?utf-8?B?RlFKc3JKcUhiVU8zZm14M0J1WVJLRzgxTmNVQUNvbzluNWd4TW9mYkVPZWZ5?=
 =?utf-8?B?aFFYYnRXY0ZzY0pVa2lkVytwOXlZT3A5ZkNwMjhsTGNJNG43akVNWEQ0UTVI?=
 =?utf-8?B?cXZ6K211cGIybFFCeEFyMW15ekxvcno2ZHgxRlh6ekErMFhKNkV6eTlHc3pX?=
 =?utf-8?B?NEg3LzFjTGtYMk9FVlJoOUNGaG1SSzhDZU02dXlSeVhDYXZQUXlBN0I0L280?=
 =?utf-8?B?Q2dKL2dPRklYazd5Z0I2VjliMVY1Z0JGVnZsZ0ErdFh1R0dZSzRsQm05dm9u?=
 =?utf-8?B?ME11cDJiRVNRazk1dWJTckdDMzR0d1J5ZW5BL3d2VklrMkNMRStmei8yOHc5?=
 =?utf-8?B?RGlzd2hxNm9qZkwxTmlUcGhBSmhOd1JkcytTTCtnRU8rM2hDUEVLRXR6L0Ir?=
 =?utf-8?B?YUNPOGwzeVlySEZHNExuL25ZRzU3STM2dkxBUzFXWlNNaENYMTYyQnMrNndW?=
 =?utf-8?B?VjZxdXczMmVDeDhlUHM3cm9pMGxDSjVTWE9XemNxUUM0VHQrTXlRZUxUbkpz?=
 =?utf-8?B?bE50Qkg2UGxHNFpodnR5SjlYUXU0WFc5bHpvNFdZcWxBY3BnUzNDUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2083a2-ec99-48d8-7142-08de64c722bf
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:59:18.0271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcrneGSPKaLGwVuhwsZZb5+eu6HD0r5D2G+DTPzUEJW2z9obvyM05E0u5+/IFgw7JauxmTMHSRLrGi2sGEPVwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E9124F45CA
X-Rspamd-Action: no action

Convert the ARM SRCARCH variable setting to use the more common 'arm.*'
expression rather 'arm\(32\|64\)', as the later doesn't work with BSD sed
for not being a basic regular expression.  The usage of | alternations is
not part of basic regexp support.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 13e336ba5484..31352d4cd260 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -242,7 +242,7 @@ include $(XEN_ROOT)/Config.mk
 
 ARCH := $(XEN_TARGET_ARCH)
 SRCARCH := $(shell echo $(ARCH) | \
-    sed -e 's/x86.*/x86/' -e 's/arm\(32\|64\)/arm/g' \
+    sed -e 's/x86.*/x86/' -e 's/arm.*/arm/g' \
         -e 's/riscv.*/riscv/g' -e 's/ppc.*/ppc/g')
 export ARCH SRCARCH
 
-- 
2.51.0


