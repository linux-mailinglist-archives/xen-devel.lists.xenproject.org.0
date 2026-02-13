Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOfVFeXYjmm/FQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 08:55:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD66B133BB9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 08:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230271.1535775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqo0k-0006fw-DT; Fri, 13 Feb 2026 07:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230271.1535775; Fri, 13 Feb 2026 07:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqo0k-0006cp-Ac; Fri, 13 Feb 2026 07:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1230271;
 Fri, 13 Feb 2026 07:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqo0i-0006ce-5e
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 07:54:44 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41130375-08b1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 08:54:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5902.namprd03.prod.outlook.com (2603:10b6:a03:2da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 13 Feb
 2026 07:54:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 07:54:38 +0000
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
X-Inumbo-ID: 41130375-08b1-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgCOZEXromjSHqkiwYWU5FFVmtiFaOQ88rkWGzo1/5G+81A6Ml5In6Y1mkP1fl4K3UcpUa4WAHP+4m+KBRae38ACFoQf2wta8k0B//HLVEoc6zILoqiULVHCBKgcXhiIQly79/+tGQXuf+vJm3lM2CM5l3MK7veBzpon147gD+D0XB6VTV8/B6t5qbcp4r9vTEEQY9HERK3raSHSzVUDpM9DxbXga3ZJBgSiVGi6m3Ml4bSvOMLiUxIZDTLqDuCnWBeSz5zj7dIU2d6uVtPKlgHOKXFQdPDPDo+pHB81T9YUuoROiuqDuS6y4GJMiWah+GY+pJ+deY1Th/3ubgqZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCKdz/pDlJYVq2CMS0QXX1zGEFRtLJeSi49IgpAHzZs=;
 b=sjyA2kiolcbDl1w6QbrmlFNZZym3fG/x9q22hfpTlVN1N0RFKscg49VZCuwPFSQJlv5HebWU831OFAFLVr96k5QZ9VwTtdhAL/69gXPRUtHBZfI+HgacCNR9P6NcYya1CUkRHfb3ktWmd/hQx4kUWtw/mboIuL2iG6+v41FsIsRA7JcXYeT/El2+V8zaWlSDYnzk1siUJnhZJjQd6d4SfaJUQu8pG4EeuVB6GVDg3r7H2nkkMl2R8oAP+eBIZR8Odur6JoO5UYe2CcHA8X0+TMOU23oYuLv8SJlAGm/bQWRiUwLzb73NlEBFvY3S3vkBWsjjfRs6CgWxgG8bXnalDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCKdz/pDlJYVq2CMS0QXX1zGEFRtLJeSi49IgpAHzZs=;
 b=NVVbJFrmaG5SDVGBh+MJ/TfDIt5J+2rQaeCveMt0h335MKv0Dj5La0x+zXnPi1c5d1OPBEckObjRVxGim/95xJ3mS8FaHzcGcSJzEzBHM5IaIroak/szwfQT2G5XlDbjLjgExPgJRSr7fnpdgt/JvLjGklCdpUYfHMlQRR2AjC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 08:54:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <aY7Yukpa3Vqf9dF2@Mac.lan>
References: <20230915074347.94712-1-roger.pau@citrix.com>
 <aY5y3GdZyd4j213N@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY5y3GdZyd4j213N@mail-itl>
X-ClientProxiedBy: MR1P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::32) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 1558ad22-dc0a-4037-a8c9-08de6ad52312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0RNMHd5WGFrZVFFUE01YzB2ZFk3Q2ZDN2xBUThTUkttNGpCRlBkazVvTUFS?=
 =?utf-8?B?S0FWdW11SFJNeE9ncUN1QzZxT1k4UWxNQ2paZ25MSUR4bTVicUpxWUtxZUtR?=
 =?utf-8?B?S1lRU00zUG1tRzA5QUR6QXVtUW51WURPZnRkcFlkbUxWcjZVK28yUHZMUDFz?=
 =?utf-8?B?ZXh2QVBWZkZjTk5laURJOTRFaEtXVitOaktYc2VETlJRWjhyR0JOSjBBMERJ?=
 =?utf-8?B?eXUrd0NpcEM2OTYzbm5NUmlrMVNMaFhqdEwxZTA1WTVPb2RtM21xUmo4S0Fm?=
 =?utf-8?B?YzFKUFdGRXdEQ3daTmxQWThJYkpUNkVwd0hUNUJBTmw5RTlKbVJaSU5Gdlpt?=
 =?utf-8?B?NUVGRkh1KyswRVR4b1BwNEVXWndLeDBxT3E5aW1HY1dUODNpR2NUc1lPZjJK?=
 =?utf-8?B?UGZ4WWc1U1RjWnVBZlo2M095MlRVZ2swVnlEelY1bEs2eDZGbmRxQUV5K00z?=
 =?utf-8?B?a1hSODZOTXhYcll1RjJQZ1NjRG1qNnpzMUV1RnpUTFo0OHJtTG0zdGxMK3NG?=
 =?utf-8?B?S3J1TjJ3MktJaWRBYUJlT2RoYjcvOXM3RXpDTUlaQWZWVkhxcTVhczJ5QWZx?=
 =?utf-8?B?aURwcG5KSGRXeGl0MithTXc2a2hQZ0l2UlhrZC9PWHVCQ2k3eTZLOThSSWdO?=
 =?utf-8?B?QTlKMjZ3REVTNXF0Z2xJOE1rVTVwbm43bkR5WTZhR2NiWnBiUHR6QmorK0Nz?=
 =?utf-8?B?Q3JQTkEvcnZLL0VEczd0MmwxSUZPTmpHaEtGdktpOU9zNHRYQ3ExRVowUVF1?=
 =?utf-8?B?dFJMandQM1pZbkdPMTkxVVlEV1FoRHp6b2VwR2lBUkV6c1BIR0lJTDFMMis3?=
 =?utf-8?B?MTBBUVhEeDRRRXhlcTc2ck5UUFpsRXBBb2FRTE5GRUs3R2dOY00zVHR1TzBv?=
 =?utf-8?B?ek81NDRONERHbTFqQ1NsMktWT0hsNWZVeDdPeU54L0dORmt6YnJGKzkrSzlF?=
 =?utf-8?B?Mmljbis3bFBVWDA4djNrbXBnT2dQSStaRmpOTFYxbzY4a0JWSVlxRnhWaVdW?=
 =?utf-8?B?R0YzVmRZTGRzVGNtTjNiOEcxZWVseFBxTnpLMWViREszdWFtbEkyK2piZ1c3?=
 =?utf-8?B?cVBYUGdlZ2dnU0huR3JMZ29sNjUwNjFVd1N2WGxKVHFIMUdRaEtpUDRuRVFs?=
 =?utf-8?B?emUzcWNaUGFFc1ZQdlpSNXEyaExPdEx1TURkMkl3bUxhVDlmQVIzbUZYU3Jj?=
 =?utf-8?B?QnlYOHJ4WUdmVzB2bUJHMkJqSHBTZkkyQWIyRHJycGxvazkrcXB3elNnN2tq?=
 =?utf-8?B?ZVpycGN5TjVLS0ZpekxodEJweWJtVTRkMVVacTdwU2pyNEhQTWw4R2szTzFH?=
 =?utf-8?B?bkM1anlpZ2hySTJCVjNTVXk4ZmRYRHJvcUZxYUltTUIyRFgvN2ZYT01yeGpo?=
 =?utf-8?B?bVFMUEdJcHJ0UFdMbjhtdjdKZmFZWSt1RUhOMFEwLytCSVNZMnh4ZXp2alFN?=
 =?utf-8?B?R0ZSd1FJNEdsVjBncytKcGUzendTQ2dYMUF2K0FlTDJGalVDclNyTDFVVFJC?=
 =?utf-8?B?UDVrcEhJUk5xdlBsSFNYMHdVaGFReVhJRVlxNUFNaHRURWl4SzRxS1ZLK1Uv?=
 =?utf-8?B?YllURFdiS3ozZitNOGVXMzZuSGlCTm5pRnZzT3RsVE5BWEFpN2RqSk1vOTA3?=
 =?utf-8?B?VnBOTnJGdzdoNU5TamVrczhBQnIwcjhtMW9FeGJzaDN5R3lOSXd4QUVHNWVK?=
 =?utf-8?B?SmdxemtXV2EvUjArazBPM0pjcHMrUzUyVXRNSHRwODFVeUZsWVhVdk0zWjgr?=
 =?utf-8?B?Nytic2tSTDZUSnk4NjlwejltZDRZOWVZUkR3WW9HWE9LMExzNnB0emM2dzhs?=
 =?utf-8?B?bEFJZE5aNmdQdXpnbXR4M1M2eXJJT1dlVFR3VFV1SVp3UTF3Tm9abEw1TFBk?=
 =?utf-8?B?blhuak9uYWdtaHNLNXpPSkhpSEpPYW5xUTZvUWZWUWRNUnVKN2t5ekFMZ21D?=
 =?utf-8?B?SjJ2eFJXVi9rK25PVGRodzJKcHdwTzFQSENLeG9GNDJpNXNCeitqQ2lGd2lp?=
 =?utf-8?B?VVRPSUZHb2VhNm1EcFhkZnFrMGtDdlF6eCsrR3QyTkRadjI0TkludEM3UnQ1?=
 =?utf-8?B?N0dTbGJwOWh2cWM3NnVEQ3BDeXd4REhoQWxBckxqYzFCblpNRkFkK0hxWlo4?=
 =?utf-8?Q?xGw8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGZsOFdsNElpNXpWQ3RxcGpGeHF4V1ZJc0JJYlp3S2k4RjJSeTdoZTZDSTVW?=
 =?utf-8?B?VTJYWnpkTkVCcTYzamZCb2YwVnFrUTVWOWs0cjhSRGx6NUZkZE9FYllQU0xj?=
 =?utf-8?B?cUtlMHZXeFRZSzdpVHkzVUdGN0U2UktzTkRKZHp2WnBUTUVkQWQ2ekovK3NN?=
 =?utf-8?B?dDFFaWMrV3R6OUpQNlFsL0Q1YkcybHlYUERBZERCWXF3NHV3TTM4VW5QY2xW?=
 =?utf-8?B?WkdmcGZsY29QVWRLczRYL0RtMUpTQ3VqbHpWVHU3MStJNndMMTNjeEg1T2hE?=
 =?utf-8?B?ZUJGeUR6Z090eCtYdG5aVlEwd25JU0tiN1M3UVBDbUZrRm1nczFCNGNZRVBy?=
 =?utf-8?B?OXkwc0ExWmVVV1ZXQUgrbVNRb3hqVDFvcWtyOFRHTjJESGZVUXhIR1JvN1dB?=
 =?utf-8?B?cWlWdlJZdDEwK04wY040Wm1nVjQwaVNiUnBUWHNGUGJoSVhQNjNUOStKeisv?=
 =?utf-8?B?YlBXVGU2RXRoUFlWUVVZU2lGN1BZZ1AvUmZQTTh1UTVsdjRlemhtaG9FbGYv?=
 =?utf-8?B?SnZqRE5DUk9LMmt2NjRBZWJkbkNrc1hRZFZNWmxCTlhka0FQY0FDMDZwQWt2?=
 =?utf-8?B?eGNTQ1RhS0xEUnlrclFXK0J6Rnp5SDlKeVA1dmpLSVlTTXRQdnM2WnV1UWU4?=
 =?utf-8?B?cEJ2RjgrQWZGT1luTk5kTEY0V1RmYmN6L1R6cnU4cjNLWjZxK2sxU2FjZ0Qw?=
 =?utf-8?B?M285emdRaGx0UUlxc1Jqd3JrdHJpSlVsMmdlRTl4NjkvOEVNTlRSdFJhVUdB?=
 =?utf-8?B?SzZPMHpnZzBpTVlDeGQ3ck5JYllwVFdTUS81U2lyQUVDNnZmRDN3KzdWVDFB?=
 =?utf-8?B?NktCY1FZZEVPV29XSGcwSmhjQ0Z2SHp3eHpZR1pBdXM4eTBpTWJ5S0JjOTRT?=
 =?utf-8?B?SHRFRTUvSW1YWHVGYWNXMytYZXNsY0VjNitqT3FJY1BWVjJTVlpmVDBidC9M?=
 =?utf-8?B?cW4vSmR4SEsxeDYrMUlPTEgvL0xhR0hFTXFGMjhCWTVwWXM2NzN4YUE0OUFD?=
 =?utf-8?B?VWlGYWc0WS9qcU44c3kzQk1IL0NwY3NpSGw3ZmF2aHo4a1V6cFNrY0l6ajRN?=
 =?utf-8?B?SFJIeG94QXhBR0xKNW5UQzZXb2JyM0FvR0dqRkd3RGlHTGJzK1ZNVWlWUGMr?=
 =?utf-8?B?SzBucjBNWEZDN05sYTRvdUxEcTdtRnF6TEQ5RS9ZdU8wMnB6TnRYRjJMS3kw?=
 =?utf-8?B?MTJkLy9SdWt6bWgxOGtkN3lmQXl3UFJxWXF6bjRnamYwcGxhR1JsUit3Y0l5?=
 =?utf-8?B?N2ZwS2EvWno2KzhjWjRmOW0zY2hleGtycnZjdmxIcncxcktwTy9seTBYcnhr?=
 =?utf-8?B?M29CTnVORncyM1NtTEhSUS9aek1aZHluWnByQlJhbFY1QnV4UG91dktDNWY2?=
 =?utf-8?B?RDBMN0IwLzhjS1E0WFplSlpVL1RVUVdqZ3YyRGJGZ1dkNU5TV0JWWEgvcWtQ?=
 =?utf-8?B?ZWpMSk54U2s5a2RnbGQzRVJMQTQ4VlhOWHdrbzYxODBDblB5VzBOVHpnd2JK?=
 =?utf-8?B?emU1SDh3M010K3NXc0N2WWVJUDBvQXJZbC9MUDBPbFBBTkt3aHZHcGhsKy92?=
 =?utf-8?B?cVpBSzVyN2pDMEVNWGlVTFlQZkpTNmR0QnAzcHpuVnBnNTQ5R25mUWZlMHU3?=
 =?utf-8?B?dUd3aSt2anFFNnpqTXFlM2ZhdkFySmtXVkJJcmx1dUNQVWVZQXFhMzl6cXBh?=
 =?utf-8?B?TFRYWE9KaXM1ZSs2UG01NFJ4bHVTazVZQW1TVkhmUkdwVmFveThuWTFGcUVi?=
 =?utf-8?B?UW13N1RPdWhTbS9VZlZNQUVFdlptVzF0K0lwd3VzZFNzK0RDVFJra1JLeGxP?=
 =?utf-8?B?OVVjU3AzTVhZSlo2L1NKN3dLWldaQmVtWDJ6OXgzYTFOL09ZN0JxVTRaS3ND?=
 =?utf-8?B?Tk5rSFhib3pYdVZhUFFmYU9ZK3RwSnZtSjlhZFBNUXNXNTBlMmN2ems5TU9l?=
 =?utf-8?B?cXdzbmRFbFAwNWpZSDJnaTV1anFLME5rU2I2NGtoZ2RidmU1b2dHRXB5UjVF?=
 =?utf-8?B?UWRjZmZDbVVSSTYzOFVVT0krU1k2THRVcVlpbTlYN3A4TGdzY0FTRWJhbTA1?=
 =?utf-8?B?ZDlQTjh4K0R1NXN2Uy93Z3pJd044bkdmMHJFYWx6NlgvaThzcmJBekNTazhF?=
 =?utf-8?B?VENlWG1hQk92cThCeXdtSElSL2I1Zy8yTWd3SDh4VGxPT2pFdmVvUVlGdnV6?=
 =?utf-8?B?cTlFMEFLbEU5SFE3WHdUdFFpZzh6U1RMUlNtTXIyczhHZW1FOE9Mbk9VemZq?=
 =?utf-8?B?L3BvYmV0SVhZc3l6WU8wWW1wNHhzRTdCNVRadTEvakxGTjJPOHJOS1NXM3JH?=
 =?utf-8?B?SHd4Q1hqMDBSYkZTNEZMNG94SjhIYjA1TmVBNE1kVmM5c09EaHNMdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1558ad22-dc0a-4037-a8c9-08de6ad52312
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 07:54:38.5521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t0zbjyHhJAJ7ixcOLhNLHwcFMiUi3O6A9GiFw6TdKtayPGLBIhW02bDPckmPAIsS1nCXl5Y8BCvwV7d61pLkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5902
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:wl@xen.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AD66B133BB9
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 01:39:56AM +0100, Marek Marczykowski-Górecki wrote:
> On Fri, Sep 15, 2023 at 09:43:47AM +0200, Roger Pau Monne wrote:
> > The current logic to chose the preferred reboot method is based on the mode Xen
> > has been booted into, so if the box is booted from UEFI, the preferred reboot
> > method will be to use the ResetSystem() run time service call.
> > 
> > However, that method seems to be widely untested, and quite often leads to a
> > result similar to:
> > 
> > Hardware Dom0 shutdown: rebooting machine
> > ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> > CPU:    0
> > RIP:    e008:[<0000000000000017>] 0000000000000017
> > RFLAGS: 0000000000010202   CONTEXT: hypervisor
> > [...]
> > Xen call trace:
> >    [<0000000000000017>] R 0000000000000017
> >    [<ffff83207eff7b50>] S ffff83207eff7b50
> >    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> >    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> >    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> >    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> >    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> >    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> >    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> >    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> >    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> > 
> > ****************************************
> > Panic on CPU 0:
> > FATAL TRAP: vector = 6 (invalid opcode)
> > ****************************************
> > 
> > Which in most cases does lead to a reboot, however that's unreliable.
> 
> It's not relevant anymore, but posting just for the posterity: I
> just found yet another system where EFI ResetSystem() crashes. What's
> interesting about it, it's rather new system - NUC 14 with Lunar Lake.
> It crashes as follows:

Interesting, all the NUC systems I owned had what seemed like proper
UEFI implementations.  However those are the Intel ones.  Lunar Lake
is made by ASUS.

Thanks, Roger.

