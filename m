Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GwIG6Hf+WlPEwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 14:16:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE15C4CD4BE
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 14:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300625.1575161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEh1-00052p-QO; Tue, 05 May 2026 12:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300625.1575161; Tue, 05 May 2026 12:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEh1-0004zr-N9; Tue, 05 May 2026 12:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1300625;
 Tue, 05 May 2026 12:16:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKEh0-0004zk-6m
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:16:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKEgz-00CMQV-4x
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:16:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9df7d-e002-0a2a0a5209dd-0a2a45059c1a-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 14:16:00 +0200
Received: from [52.101.61.19]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f9df7f-aaa8-0a2a45050019-34653d132d89-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 14:16:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5903.namprd03.prod.outlook.com (2603:10b6:a03:2d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Tue, 5 May
 2026 12:15:56 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Tue, 5 May 2026
 12:15:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1ZyxGCYPjeTFQiK0CbLeyP+bM5+XACrDWzxu6GIYrF5KSmvCI8A8VqZ5wU3QWecHTsMhkjfPrRfucSHY3qlmwawKHJUcgE8m2SoOHQJnetTu/yqEFqRTpB5KCpyRsy7aTA+vIbjDPdwGSMTsdn9iDbxylLJ52OkAbc8uM9LNjxIHWhaX/8tVCeimI6pfQF3B9ptWQsViOe92vkZA9ttqk64duhuqHGUWcqcro+gBnuqBK1ruNjqVWwFNfwm2j0K1oPWb4+Ii69ctXty0TWIkXBeJ9H9jahk7/qlE2izlSUWirmw5VpPE8mrwvhG8OqYH0yllB3F9iHJNY0W0RU9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv2wb2TwkK+ZRxju/yzHigVcUCk0vEUazwDlDeMuXHs=;
 b=Fvgzo50a6ZKx1sn5XiN4kNmEixpF/j9MQhl1pJYhq7IEYXI1wwVtqE1JWd39WlNLNX8czlz1CtyTCxqqPm20MEo0alP9nhfDYYkizTFTknR+mHx3JruV41Ahpz6qItNGqN2tcn2VbatOgSlkqoX2/9pVvDVPrOZaXd/fPGwpHHueP71wd9akov5aUG3aZbppi+aAgK1rOBuBGNuof4ErCg0fZJp7adp3TbbHwFLEctT62PUPkcdUQT3fXxq9OQdF5ncuRg2rRH/x42e557Zo1QTXZphqlwFlzebEr9/Wn4GlYWzXPYmNukr4p6TE43RJCApJqL0QiGAyCtGTx1FKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv2wb2TwkK+ZRxju/yzHigVcUCk0vEUazwDlDeMuXHs=;
 b=QHtJ9eJim37GJqOBZLiqzsSOFnFp9877sRBJzbiZ8TkMr+W3GCPWdF3k6RYfWN2Yjm4A+SnuBwDYFrE44/EVLDEJJbi3YnlTqUutDoYO2vQ2gYVdVXqf63HV/ooVW+4dHnSwSoiwPG20wnWt0xGNdX2DV3jLtxLUe6Mdo3iKpUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 May 2026 14:15:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
Message-ID: <afnfeLeYypvBiEze@macbook.local>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
 <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
 <0a3583df-2682-426e-a704-aa8711caec0d@suse.com>
 <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
 <0267eb6f-1161-45b7-8905-d7aecb78e74c@suse.com>
 <e8218607-26d8-4517-8634-df3c365e5bb2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8218607-26d8-4517-8634-df3c365e5bb2@amd.com>
X-ClientProxiedBy: MR1P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b3fce2-5db8-4d9a-8d87-08deaaa00f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L60RVxQmAHDTo8WoMF76E5KvtyNeqyosrkhrK0lq513E4OXjOXk3cKE3YZSpjtn5GaYlg9kTrbC9/JZaJ9ttY2UREKNLyuqDJyjAHH0HIXORb65j0nx1dYo1rr0/OtBIc6wzJM1z3zoUkXwuae9YyoJerYTAPSjhApTC28xKx4UGos06iYFyS9x/X1RsXY/JDWLjVdCvMqaX48R/uOJHzjLl4HzPWlN3A+xCU/0p+XiZy0cgsdynwyPz8HFCDQLoeFtfRGKeYdtp/BIjASnEGKf3KDYn9P8iqGC6HdCr6/urGXF7CagyMPDNjK4iKMfJ7hKbVO0dUZOScEvYfREZKePMsANdh5TQyqrQUy5PK6nVtIZa3uDFus+yHxIOQeVsDjMPBHXPreRtt6BOCSGuTTzTMRlFn9HB201cKE7W3NrmWgoPZjBvblRowwckb2RWaYrnSt3MlZ0U9mqayZ9mioTrF99tez07rnSpI3R8N5Dh20GFndn5jz8KJ2Bw+0Lu6gZ/UEUP7taTpwxtp+MiZ+qVMIyzZ2fW7N8FrHJoiQaV8J+VYi2l4UtSXDc//DLnoCnO78kfEAc9My5TLPAbImEwcnsfn4r0GLChfY5f8FPNXoIG7L5lJE3un4StNmvmByaLIjm9ZxDPIu2RBY2pG0Iih/nnFMdqcRvjYD5ncNeHxkQVlRl0YiRmtgx7QGk/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWJkYkw2VFdFVTQ5c0U1eHdVaG1kejBXY2lad3ZxUlJnVlR3MUFUcHhON01O?=
 =?utf-8?B?Q0p3N1J1MXkwakpRaVh0d2YreVNSUFZ3MDdMeXNrellhVTdWdHJCRTduaGZa?=
 =?utf-8?B?M0FTa3lJSnV3eVZMNTY4V1lWeS9XRGR5L1RXM3Jhb1VydWtuaThreFZ4TTB0?=
 =?utf-8?B?NGpudzg3aWFnVXNlRVNkSUhVVXFkQlBnNXNMdDlkS01ERzFEWXZJYnZOZFBS?=
 =?utf-8?B?MDRrSEU3ejRXZm0zWUtaai8zdzQ3OWxZWUZhUnptVUQ4dTdZcWpvQjBuQk9l?=
 =?utf-8?B?VVlkb2I3Vy9rNC9tUE0zNDBYYUVDVVFyU25aSU5PcTNGOU9qUFBhRDBWbzdp?=
 =?utf-8?B?UVRZZE4zaC93eFZUNjlWR0diRytzZUF2dWd4WlNQMzhqVEQ5NlZtWHBnSDRF?=
 =?utf-8?B?OGNMa2Zldms2UXRBRUpFckl3eDkzQUNJa2R4c3BtamswbHd6bWFlZ2NKeXhs?=
 =?utf-8?B?Nm5Gd01BdzR5RTVhNFJpWldMdEFkWUZpemRvY01HL2NmZFBTK0w3SGlSUHdx?=
 =?utf-8?B?U3NQWDhEUXYxV0RVYThNdGo0V2FYVFhaemlwZnU5S3lkcUpvR0YrcDR2TG9T?=
 =?utf-8?B?ZHRpOXcvWkRvZnZGUUtFSTBKUWpTK053Y2FjWWZoZ1c4RmxJRy82MmQwWTls?=
 =?utf-8?B?QnJXMzVadjZoUEsrN1RUOXdreWpsVkVYakp4SGMrQTU5NC9uNlJPRmx0RnFB?=
 =?utf-8?B?TS9xSEl6M2xaVEJ5N3FXMnN1N1gxRzFNcnZ4eWFTaW1XQWgrMTBUT3FhYm9N?=
 =?utf-8?B?eHBBbEZRNDNnOW1Cd2kwelNFT0R2NjZYV1pjakZLaFJrMGhkU0MvQ0RvR2cv?=
 =?utf-8?B?eFAzZmhKdmdVSVVtS2NmVXRMRTQxdzNDWitUbStKVHZyNWZBblpVUVI2NEJp?=
 =?utf-8?B?Y2VoMnE1N0tUSGRpbFc1M1l6anZkOHFRMWovR3Mwd2txY09nRXVLRzI3My9o?=
 =?utf-8?B?MzcrbGxGb1hHZWVHTkRsejAzem1DRE1QWXVBMlNEdUQ2Yzc1SSs1WjFtelJQ?=
 =?utf-8?B?dmRkdm9BOFZRamVjeTRQQWpteXNRRUNCWEozOWZwbE96YTBKY255Z3o3alpL?=
 =?utf-8?B?bmx1R1E5dXprQkc0aVdvRlR1QzU3blQ2SVA0Y00rWUJTT3hrcGhiVnhmSEdS?=
 =?utf-8?B?S2JuNXBTQXRHOE9ET1hJTjBFeVdPV2dSY0FUWnVTTlRlcWtxN0lsQ09FYWhH?=
 =?utf-8?B?ZnFVZ0kwd3E3M1ZRZ2RpbWF2QTNVLytPdWhGbG45L2MwWkNqYjJMUTd0S0x5?=
 =?utf-8?B?Z3pWdlNsRDJwSFZpRnR0TEdlS2VhQnpKV29idXIzNVIrYmxqdU1zOFJJamNE?=
 =?utf-8?B?R2JmM1lhdUJxWUtJNk5wb1dNMUgySVF2TlFCanVEdnJpb0dYajVwSmxrRVU2?=
 =?utf-8?B?MGFqSWVUMmYvTHdLcG5SaUo2b3NPQ1ZJZVFNSnV4UU9ESi9zQjNDQXRuUFg3?=
 =?utf-8?B?TnRST2x5WExLU2I5Tzh0T2lkZzB5cFI0WFpqVUJGUlRsOVoybitZVmlPWklv?=
 =?utf-8?B?SzlHN2tXbXhiY1diM3BzZnU5a0tGOTd4VFJMeFdyU1JIaGp6V0hBVFNZQW9D?=
 =?utf-8?B?K2NOelIraUNLbTMzRkcveTU5ODk5RXI2Z3dZejR0TzFSSTZEbVNxSmtCK2xz?=
 =?utf-8?B?TGxzQUVPL1FvbG1yUjZ1cS9GMTF3N1pKT0FtelZYNTQ1cVNBOXk1MHY1dlR4?=
 =?utf-8?B?a1FCYzBxSHI2ajYzU0dSaG84cFBrTzhOOVM0OThEdzZHWGZTRnVqYVdnMVFq?=
 =?utf-8?B?dDZOaHR5Vlo2OGQxQ2JZNFEyMlplT21EbUtGZDR5VENQbjZSM1Q4MWF1YWRI?=
 =?utf-8?B?TFdxd2dnY3U5NUdBTitObjFzSzZmNkxqTitBdGUwdXROeWJmbEQyMG52ajkv?=
 =?utf-8?B?Z2UrSGMra3lBMzY5cUl4dnV6MGo2T3VoNVlCK3YxaS9hU09WMi9EbGFydUk3?=
 =?utf-8?B?a1dBTUNvZVFMcS9lZ2M1MDFOWnZvOFFVdkd3RE1sL0dUS0hYblk4QW40aXpR?=
 =?utf-8?B?anhlVlp5MmNSa2UvTW5DNFNEWmlUaWtxNGZBME02TmJtd0orNmVjMC9IeEpW?=
 =?utf-8?B?dmdiWXozV3pKR2YvbmVXYnZkMDhmay9Gek8xVGdURStIUFU4TlF2Z2I0Q1RR?=
 =?utf-8?B?cEo5RmJnV1RJam51bnZ6NTNQK242ZDE3SEJXeldXN215Ui8yK2hrWjlHTUx3?=
 =?utf-8?B?YWdmSUJ1d0JVZFVMSDBtTEpUR2pBR3UxclBVTW1rd0loM09WV3NoaHE1UGVp?=
 =?utf-8?B?dDBlQ2dBSWdYaUFsRFRqeURSdGtyeGw5bFVuNmE3Z1haQnFjaVNxdlpjMnlz?=
 =?utf-8?B?MTdXSnQrNUFJc3FnNXp6ZkZ5UE9Ra0owTjExVTNjMzVVNjNzSkJKdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b3fce2-5db8-4d9a-8d87-08deaaa00f4e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 12:15:56.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZJniwlUW2DIUYhjcHQB5DHGVv3DY4tHKvJDiL0BddwpYCgfJiRCp933KYrQw7NyXcbP4ZrpmTGp1a29h2UxbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5903
X-purgate-ID: tlsNG-c201ff/1777983360-E9DDB443-ADA5C781/0/0
X-purgate-type: clean
X-purgate-size: 4368
X-Rspamd-Queue-Id: CE15C4CD4BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, May 05, 2026 at 01:46:51PM +0200, Orzel, Michal wrote:
> 
> 
> On 05-May-26 12:49, Jan Beulich wrote:
> > On 05.05.2026 12:46, Orzel, Michal wrote:
> >> On 05-May-26 12:40, Jan Beulich wrote:
> >>> On 05.05.2026 09:35, Orzel, Michal wrote:
> >>>> On 05-May-26 09:13, Roger Pau Monné wrote:
> >>>>> On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
> >>>>>> On 04-May-26 17:28, Roger Pau Monné wrote:
> >>>>>>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
> >>>>>>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
> >>>>>>>> the frame table starts at PDX 0, which is only true on x86. ARM
> >>>>>>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
> >>>>>>>> defines it).
> >>>>>>>>
> >>>>>>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
> >>>>>>>> to 0 when the arch does not define it. This makes the generic macros
> >>>>>>>> correct for all architectures, even though they are only used on x86
> >>>>>>>> today.
> >>>>>>>
> >>>>>>> Hm, I assume this offset was added because the original mask PDX
> >>>>>>> compression won't (usually) compress the gap between 0 and the start
> >>>>>>> of RAM.  However the newish offset PDX compression should be able to
> >>>>>>> compress from 0 to start of RAM, and hence you don't need to apply
> >>>>>>> an extra PDX offset there?
> >>>>>>>
> >>>>>>> If that's indeed the case it might be better to integrate
> >>>>>>> frametable_base_pdx into the mask compression algorithm itself, so
> >>>>>>> that on some arches it's a mask plus a decrease.
> >>>>>> The offset is needed regardless of whether compression is used. With
> >>>>>> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
> >>>>>> 0x80000000, the first valid PDX is 0x80000.
> >>>>>
> >>>>> OK, so you are doing some (kind of) address space compression (removing
> >>>>> the leading empty range to the first RAM region) even when PDX is
> >>>>> disabled.
> >>>>>
> >>>>>> Without frametable_base_pdx
> >>>>>> the frame table would have to be indexed from 0, wasting
> >>>>>> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
> >>>>>
> >>>>> But you don't really "waste" memory, just address space?  Oh, maybe
> >>>>> not on ARM as it doesn't use pdx_group_valid?  And so you
> >>>>> unconditionally populate the frametable from PDX 0 to max PDX.
> >>>> With pdx_group_valid (which this series adds) we wouldn't waste
> >>>> physical memory for the leading gap. But we'd still waste virtual address
> >>>> space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
> >>>> because the full range from PDX 0 must fit. For example with RAM starting at 5TB
> >>>> the virtual offset before the first usable entry would be ~70GB — more than the
> >>>> entire 32GB FRAMETABLE_SIZE on ARM64.
> >>>
> >>> Yet still - this is exactly one of the situations offset compression means
> >>> to cover. I'm entirely with Roger as to it being undesirable to build a
> >>> special case variant of "offset compression" into "no compression".
> >> In this case, if you don't want to generalize the macros, how should we proceed
> >> on Arm if we still need the offset to cover the PDX_NONE variant that we also
> >> use? In v1 I just created a local override but Julien wanted to generalize the
> >> macros instead. The discussion about switching the default on Arm from mask to
> >> offset that is not even selectable on Arm needs to wait for the new release cycle.
> > 
> > I'm not convinced of that. If you need offset by default, why not enable it by
> > default (right now, and potentially even as a backport if there's any bug that
> > is being fixed)?
> As said before, we also need offset when using just PDX grouping and no compression.

But you don't really mean no compression?  The offset itself that you
subtract is a transformation, and hence a compression, as the physical
and PDX address spaces are no longer identity mapped?  Maybe those
systems should have never worked with PDX_NONE, and instead required
a PDX compression in place (one that would remove the offset from 0 to
the first RAM range).

It's an incomplete conversion IMO, as ARM applies it to the
frametable, but not the direct map.

Thanks, Roger.

