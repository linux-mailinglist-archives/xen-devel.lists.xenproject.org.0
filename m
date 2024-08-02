Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2803E945C8C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 12:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770959.1181539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpuU-0001IS-Sh; Fri, 02 Aug 2024 10:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770959.1181539; Fri, 02 Aug 2024 10:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpuU-0001GC-PD; Fri, 02 Aug 2024 10:53:22 +0000
Received: by outflank-mailman (input) for mailman id 770959;
 Fri, 02 Aug 2024 10:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQaU=PB=epam.com=prvs=4944f0ddb9=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sZpuT-0001G6-DB
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 10:53:21 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6db0ffb7-50bd-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 12:53:20 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4728unHP019684;
 Fri, 2 Aug 2024 10:53:09 GMT
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazlp17011029.outbound.protection.outlook.com [40.93.65.29])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 40rjd029jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Aug 2024 10:53:09 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB9395.eurprd03.prod.outlook.com (2603:10a6:20b:59d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Fri, 2 Aug
 2024 10:53:06 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 10:53:06 +0000
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
X-Inumbo-ID: 6db0ffb7-50bd-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKA5tuXM5msTfUzmW+U5eciEvxgbsMJhSN4oEeeE2AopHKsqAT+RNLk4XrvYczBuLd3NFzn6347TxYyZkAr5fCFlhzMqzYyJac+I+0gFs8ipJk6HToYSDmJq/DviMpE3AJiHwrQXqMAhRpZuBu1gXaz9B9lbeBg4lngiCUzg6aaxtMSgfZVVYh3kiaiGrlE65PuIi1C/QXeyCbikiQky4uTBsML9gqjKhg0JZkm02DV4jPDhQyct4kQMQWSS4+cdfhRAwbZVr5htLCj1CFxwUw1l4fG+QYIDQOTOE33u44koJpRSUiJ8H37YqCswBx7JxOX5Vzfi3lRLous8REAL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twp8q0lDoPWw47l5n3lTxsMj9kwYVZfhW/a8qtrss38=;
 b=QsyNOd7+4Kee4wK8fAY1cvu53XPuY8gtIsMhup0ZGqQsaJXyBctS3X6jPBE9zaS3y2hptqU7Ai6g/+0h/4T6ucq3WIEEea6qDotdHDTg0nck87vszB8c0lzr/AHLC9BSVPDTTpaWeKUfRRMaMVZXfDi1uGkqSMwv8FtzNQRB3LIe9QOBhAS45XBGsQ4kJ13t/uF/kLWi+YqOsTQ9nIHV5j2IoOSl1Pw2LH+1OBniRxLkbB0KsbxFndXrIG/QJqo6MYvNscFH+nVSAgoXwPSA7ZLWI8mB4Ky2zwrPw4baU0yclK0GAuIsr0XBZk0iUk7L6VUqPGDOUzxkiACzUdB0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twp8q0lDoPWw47l5n3lTxsMj9kwYVZfhW/a8qtrss38=;
 b=hV+uyO5ttj1OyYEdkAwCfTJcGNWjnWkeSaeFxpgQsUHDvTmKkJMwcQ02oANa03U6WdRjkJUV5AA6Qgzb9GoItzL4aYgcfkxB3VHJvw184tFtfe2Tr8UxAIGMk4qFMM21p0BZaFJGOfoPh3WCIKbtiJZjB+th2BPVzlicCfTB884X2k0/2Wi308lw0gQE23+I1klhxl+RosLq0J4ge6E63mWlYlQC1VciRs/8MZUlx9Xk1c3s8DksvIII+CFzAy+o2rhzJL6IaCUc9tU3/sSSkZ1kUI3HVreCfsrtqQObemwvFKjR0YlZYszEugJhv5y9hPI101k6hxUMSqyQsDwZ1A==
Message-ID: <ccd77283-4b88-4351-a3f9-bd4240b9b845@epam.com>
Date: Fri, 2 Aug 2024 13:53:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 09/13] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
        xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <c2961c8b67041883ce5a5f6d0511a31dc7fbe22d.1722333634.git.Sergiy_Kibrik@epam.com>
 <cc92ed50-89f7-48c9-b0e1-cd61a020001c@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <cc92ed50-89f7-48c9-b0e1-cd61a020001c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS2PR03MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 541dbef5-8c74-4c34-215e-08dcb2e14a22
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnBvZFhCY3FPRmNYUzBXZVNpMmEzQ0FHbGFXcmdaeDNaeGdpVVJvNGJFZVNG?=
 =?utf-8?B?SkwvQTl1eUdXMTFuVVJZVUYvY0dRWVh1K3FTR010dndkczQwaDgzNUVLVVVZ?=
 =?utf-8?B?b2JzRnhPVk5yb3ZKakJJYkhSTkpoSlZ3bFNYMENnWU1UWGVyVkNGUytoM3N2?=
 =?utf-8?B?eCtqeW00RFR3WUNKTDdaTmxHbUpMQVNaMU5nK2Rqekp2WGhDWTdqdGIxU3pq?=
 =?utf-8?B?ZUJSRFNRNWp5TnNKejF1REdOalBFNGtSWlBUS0UrYko4M1BXWHgwcEpKQmFp?=
 =?utf-8?B?VlZLRWJrQVhVNGZmdGVlUGY2ZzY3UWp0dmFLK29QNXRMSEdtSDlmQ29Hd1RJ?=
 =?utf-8?B?R1J2QUhZWTl5d0tNVW9tRncwRXNpRjdmRktVSGUvYVd3Nk5IYTdRMFlHMnZ3?=
 =?utf-8?B?djZ2TVU4aHF6UnZoNXJuUjN1MnBqRmJNaXp4ank1NWZ5S2FtMXdpeHhkcjhS?=
 =?utf-8?B?a2tUWjM3UjZpR1gzVlh4MTJUbHh2S2ExdzhPZENrdTZPU29FNVVsS1oyWWtw?=
 =?utf-8?B?VkoyQ0FUVHVKWCtKNHUwM0dnSFJNQ1FTMi9qTjdrbllxRnZwYmEzaWpwdmJr?=
 =?utf-8?B?Wk52WVBBell5SUVFU3hRa1dxZEg0d20vbXhTdzZUN3g4bnhUQU1jVTVrL21j?=
 =?utf-8?B?Rkc5VEhrekxKc01Jb3pEVTJjdDFnaVZ0QUtDRkxpQWR5SXh3eXF4M1pzWS9T?=
 =?utf-8?B?ZjZyeVc5cVE3bG9YaXdQc215MUI1N2NaaVcrVkNUQjBpSkdUa1RjNFI1aEdO?=
 =?utf-8?B?dTMvR2xDOExPaDhoNmNROGZJd0dieXlxeHhDdkJEUHlQSXB1WWh2QnJHdytt?=
 =?utf-8?B?SS9BaTFVV0Q1ZlFYLzVFNUJ2eFA4c3VvL01JMkN1RHdvRElSNlRkTDZ0aFo0?=
 =?utf-8?B?WWlkMVVCY3psMzN5bDRQQUNPR3l6SFF3T0FDTk1pMk5xaFhzVmswb0o0STZT?=
 =?utf-8?B?WDFObTJtR0orQnh2czV2NGdmSXA5OUtrRlFwNkN3K3FtY2VFaWlTSG9GNW5Y?=
 =?utf-8?B?Qi9STklIV2ZPdndqT0YzRnp4akdYTnB3VlpwajJVZVBWaEVEY0xnQXgvbmNz?=
 =?utf-8?B?Q2VmczhZaFRzYy9BV1FDL3U4MEZUUjhYOEhzU0k1SkZFeXpNQkkrU0Z0T0Y0?=
 =?utf-8?B?Z2JvYmJnajE1blB1dFRWbzQvNm9XeXllREJSNHR1MGFPdmc1dFhNTjJKVG5r?=
 =?utf-8?B?TzlqWXFMRXVjUVhZNmRma1QzdksyMWNEQ1lpUUZCRjlLUlJDTHhQd2Q1SVpu?=
 =?utf-8?B?RDJaY2tEYTB3VFV5ckc1MlZLUVh2NlBoSXFFUHhHZzlZRXJLT1Rwc2ZIQjR3?=
 =?utf-8?B?dVFzQlluSXVuRmRQa293ZmlWRFdQaHpJdUFkaTcwcDVOdTZFQUJ5QUZzaXhE?=
 =?utf-8?B?eE5ab1dLZm93N1krdnBNd3ZMdFN6RW5KT1hmVHAyT0Z5YTVqNmN2a0M1VmFE?=
 =?utf-8?B?YlVLWUFGZVhSVWQ4aGI1S1JLdlFQRnJtMWJ2REpwT0JPTUJiWm5rSDBEYXFS?=
 =?utf-8?B?VVE2andjZlNDYXVwWnF2U0lRZ1VuWitaQlhlSkFPN2l4a1N6M21jcUZHWllP?=
 =?utf-8?B?eTFqVWtXMWUzZU5OSzFSR1hRdnpjYkVEa28wR0xndUpIZE1CSWh5RzcxRUM3?=
 =?utf-8?B?QWVUUzA5OUJVYmhoNHVMYXlOVXF5T1ltUDZzLyt6bHBvcGg4SGJCQmhWMitH?=
 =?utf-8?B?ZkdBRXBuU0JKaGk2Mi9sb1ExZ0p4OUVFaVBOcTVRYzN6aW10MHFza3o0dll0?=
 =?utf-8?B?NlBrZUlzWkc0S1hVcmhmL1hJNE1ZZmtOQkVTRHdod3F1K1RsRkdIblBBRDBF?=
 =?utf-8?B?THQwMEw1OEFnMDdrZWd6UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1JScHVxSGIxbDJaZ2NqbUlXZHQ3S2FOUlc3ckdwdDVETWZkajhOVzFQeGJx?=
 =?utf-8?B?ZnpERFNEYmNWbVhFMkdSaXB2WS9DN0hZWnI0MUV3STFmdmxlK0wxZVFlOFQ0?=
 =?utf-8?B?YnAvenR1SEN6eWd1TlE4YUpURHlmQnFjVE5BRzFCSDcwYVIzK2UyYnZKOTRx?=
 =?utf-8?B?NllBN0tKeVpHNVk1cEgyYitqK0RRZERVWXBTRW1xWVF0Y0tsN2M4aUt1VGVp?=
 =?utf-8?B?NHl5dS83WjM3dlppQkM0VDdoUllmQTBQaWJqdUd5NG95Z0ZnSmc1WXU3TTR0?=
 =?utf-8?B?L3dhVEp0NXFWeThuU2xzcHQ4RUwySHo3NGJicjVnVURaUE54K0RGcEZNS0gx?=
 =?utf-8?B?emErbkRjSjU1Vmw3eTZJNDM4SEZSMThZcTJvOGhDeENQRzRyZ3l6Y2dzRmo1?=
 =?utf-8?B?ZzZ5a2RtaEFMUHZkL2NvR2s1UHBzZ1haZkpzdCtNVnByanJOdG5xbDF6TVdX?=
 =?utf-8?B?R2JjQ3JrQ3ZNU0ZRY0R3bktocjV2SjBaaDhhL0ptSFk2aXg0K0FXRG4ydEVO?=
 =?utf-8?B?TEtacHdXMUlTbVhvSTNMeVpQTkdaM0tsbkpUbVdOVFR6dXRPK05vMEFDVTR1?=
 =?utf-8?B?MkJBT3VRTHk1NW5oZzhSbU5QT0ZoSWJqdFpPN2tYemViRFBZTDFkVXdHODlB?=
 =?utf-8?B?Sm02Vmx5Sis1ZUF6K3ZPOUw3TGZEdWZjSHpZcmxjV3l2RkFCdmZrTVNMVjdQ?=
 =?utf-8?B?RjgxbE1wZ3lBREY5WXd3d0NFZDYrb2dDU1B6aitIZlROTmwySHFLUUN0dFFK?=
 =?utf-8?B?RUh0UTd1d2JCYkRsbWdhMG80V3FvSC9OU3JnVjIxcEw5dktGSThDalpESVNH?=
 =?utf-8?B?dVBLSmswdnZJeitDcStZclhzWGhLWkhMY3hyOWlrSWVPYUpsQ3YwaUJWaG0z?=
 =?utf-8?B?bWhFQ1diQ05WWjZsR0MyVFYzZFJtVEgxV3gycklnSUY1Wk4rK1RLcDN3YUc0?=
 =?utf-8?B?dThqYTdkalUvR3ZoVHpybFdDc2lWNTQxZTg5bGMwc0NYY3B1MDNoOE1JUFht?=
 =?utf-8?B?QTloUjI3UHhBUllSdHdRb0Y1VVJKN01UMytYeVpSTUE1Rk9TRi81M2tScTc3?=
 =?utf-8?B?UnVQdUowQWRHa2NLVWNkeFBDb1FCaGV3a1FuL2dsMWNQcFNpYUNvdGc5NE1o?=
 =?utf-8?B?YWFGQ3pWYnJmMk50SGc5ZWhrMHBGSTVsczFEMUFtNHFrU2JLblNWRmlCdHRX?=
 =?utf-8?B?L05heTNLMHJIK2hiOGpIcWI1cG54V1R4eFJWV2pYREljb0syTUhHRmQ2bmox?=
 =?utf-8?B?OHpWUGJZRWVscVF3K3BFSVd0Y0xPREx6L1VpeVUxU0kwYkdBV0JRNGpMMDgz?=
 =?utf-8?B?K05SMmdqbWdDdGZHbGNaTnVxL3hXeWZGTFdyallrUmFKdDZqZVdYUlA0L1Nw?=
 =?utf-8?B?NEdtZUFJSUZzejlkNjBGdW9BZ09yVXNIVHBiL1lFMWp3MDBsc3ViU2UwYk1B?=
 =?utf-8?B?S1hBZ21paWNTenFGdTlnY00rMDR1dkpyRXpLR3BSejVKZFUwWGt2ZTZUU09u?=
 =?utf-8?B?ZWE3UU4vcFBuUk50Q3JWL202RUNhZ08zUUJrUkgyaklTekJOTU1QbjMxS0VJ?=
 =?utf-8?B?YUN5bVRyOUpPWXlIZHJJcW5TZWx1TElrL3EvYVFnNWtDVFZMMFF3aW1UYmdQ?=
 =?utf-8?B?NmFJZVpnb3ZYUXZEYjVQeVV4OC8yVlhZZlNON0FpQy9JV0h4Y05WRmYwMTND?=
 =?utf-8?B?UDZBRlIyRVJlWnRWdkxENTMrMk54TnoxcmxCYmhQQjVEZVBJTGNWU2NPOER6?=
 =?utf-8?B?RFNZNGY2L3FXWWF2TlNMOHRtc1VpOElGVmdacnFPczBWUXNWZi9jenhKdDds?=
 =?utf-8?B?dFYwcDNMRGJRbXNzNXZEcHVzMktFbXVid3J6K0Y2U0h4VE9adWJhOFVoUGpX?=
 =?utf-8?B?a2ZMT3FjK25OamF2QlhWUGNicTY1eldZWDdPS2FLUUhBandKNmRVZlpjbWRV?=
 =?utf-8?B?TGozUlgvT2pEcFpzRStzdi9XTGtSY0pLdkdPREpVSTlVQjA2WlN6Ni9BQ3RW?=
 =?utf-8?B?TjZOdDlvdmFGdlUwL1ZYeWdMT0ZLWlJSeEZmYnR5S0c2SkRsY2M1MlZvaTBG?=
 =?utf-8?B?M0JKZ04xTUdWek01eVduVFJaWjd0U25mNnNCczlNT1ptOGlZVXF0TXNZKy9t?=
 =?utf-8?Q?peImQ5QdepK6S3ER0bT54JaFB?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541dbef5-8c74-4c34-215e-08dcb2e14a22
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 10:53:06.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU2HUSee2hl/Ztf2btGpsHn+n6LJOcC4G+hVwhFf/3jJKeQ/e+epGnVB87I+jQtLuI9VsDsttSE63MwJPGtiOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9395
X-Proofpoint-GUID: Ll_cGk91SQTtfhOWQcF4L_AVO1TY_1rV
X-Proofpoint-ORIG-GUID: Ll_cGk91SQTtfhOWQcF4L_AVO1TY_1rV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_07,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408020073

31.07.24 15:23, Jan Beulich:
> On 30.07.2024 12:33, Sergiy Kibrik wrote:
>> There're several places in common code, outside of arch/x86/hvm/vmx,
>> where cpu_has_vmx_* get accessed without checking whether VMX supported first.
>> These macros rely on global variables defined in vmx code, so when VMX support
>> is disabled accesses to these variables turn into build failures.
>>
>> To overcome these failures, build-time check is done before accessing global
>> variables, so that DCE would remove these variables.
>>
>> Signed-off-by: Sergiy Kibrik<Sergiy_Kibrik@epam.com>
>> Acked-by: Paul Durrant<paul@xen.org>
>> CC: Andrew Cooper<andrew.cooper3@citrix.com>
>> CC: Jan Beulich<jbeulich@suse.com>
>> ---
>> changes in v5:
>>   - change kconfig option name VMX -> INTEL_VMX
>>   - do not change .c files, only modify macros in vmcs.h
> Better, yet still not going far enough, as indicated earlier:

I must've misunderstood your earlier suggestion. Are we talking about 
modifying all of cpu_has_vmx_* macros -- even though most of them used 
internally to VMX code and don't cause any trouble in common code?

   -Sergiy

