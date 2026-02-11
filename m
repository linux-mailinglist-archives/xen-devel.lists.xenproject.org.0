Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIpiOHmFjGmfqAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:34:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BA124CDE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:34:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227640.1534060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAMO-0000SY-M3; Wed, 11 Feb 2026 13:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227640.1534060; Wed, 11 Feb 2026 13:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAMO-0000Qc-JR; Wed, 11 Feb 2026 13:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1227640;
 Wed, 11 Feb 2026 13:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqAMN-0000QV-8E
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 13:34:27 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60cad62c-074e-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 14:34:25 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7367.namprd03.prod.outlook.com (2603:10b6:510:2f5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Wed, 11 Feb
 2026 13:34:18 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 13:34:18 +0000
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
X-Inumbo-ID: 60cad62c-074e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1XPxP3k7Y2aPth8+LihOv8PJ31NzXt/TSWxs20+WsaPI7zl3VqhLLpFzK0JlP+JATgqoqZ0lsTJlXYTK0sKRURexBTKBu2gHGUJhDYU6nWSA2oKihwW1CdSnEH6Ds0kG4RKuifgENO56eShFD9NRLPecGUhQKOmBgeJOHxscC5v9YIiCNO0ooZt4M5CzBF14g7mMpTlKYdg4jn6yHS94rt7af3kBpa4eJ6JWhLiZbkk/dQTGkxlWR0HGGnelIP+isr3VhA8Xkhv97zO3yrFUbAMwfrfwpTqWkSuxT0SvhMs2SKcMFPlYsI//Al/PvPc5eWI3DMhxaJXAlU4l4TWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1LG3wp6iwynYamW5A5tf/8u/hcbZBz25ZZeEB7jSAI=;
 b=dY0SwMstpS27PcgItBwLxZuS0mBgnAk9V2WbqTT0Cfcb8dI9vw5tjLFV3acrKuh6HOQTJMP8eCb/+FihQ5MSag+dq3YSYvvx7oiTUVXpuaR1ICXW+XdJzYuR1LiPYUSFVxa1MyZAESkiG0OqQaQNrMDu7eXxAfXEv7wk6iTXP/xIpYZxQ5UMuMrQAR5xD6GQm7gWb/OJ7ciJRG4FY1FPdb/mRMvySlk+5OLD/r2vR7X6K1bgLzZXXsxjlZlxj99BlQk1EJ5Ro/J9obKKSeWxGpJMeVGMWo+Gq4M5SeXnntr2WiPncwrmJfzS5CM4LS/bpa5ADBAmGJXp5zbVWMA2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1LG3wp6iwynYamW5A5tf/8u/hcbZBz25ZZeEB7jSAI=;
 b=yng6EB6dsRbE3QDQMQw17hn8/yDpfpf089/rkeFs5pQ8kSIPwzQcEahX8x+JhW7af7av5Lige0wBv02Og7ZlAeBZlsP1PdCLNRkqIoQcewk859nhgCqHHGzml9KeEEQk9CIMHTui8nsQK1ZxyJkD4Nn2u1uHwNB23ne7zFwb6WI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 Feb 2026 14:34:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] xen/tools: remove usages of `stat -s` in
 check-endbr.sh
Message-ID: <aYyFV9sIw_cAvruJ@Mac.lan>
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-3-roger.pau@citrix.com>
 <35bdb10b-d39d-4e67-9ed8-c0b85ca5bd54@suse.com>
 <aYx064WIMMNmLAza@Mac.lan>
 <3f1e043f-2cd1-43a3-9ec9-9323c133d8d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f1e043f-2cd1-43a3-9ec9-9323c133d8d1@suse.com>
X-ClientProxiedBy: MA3P292CA0050.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a739b1-2027-4f44-713f-08de697241bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0hYcDJuQlU2ZmNyelhyQXV5RGFhY0wvRzRLU2FRdlQydTVwbGFQWjBzZDB6?=
 =?utf-8?B?cW1HRm9DcGozanBtSGpsbnRCU3VMcnJCY3BZYWMrazZhQVVDemhhQ0NPaS9l?=
 =?utf-8?B?RUV0akJPdzFOczFOczVRK0hBd0RUUnQ1c2pQalFQNEk4VmorR2p3aiswUk5Q?=
 =?utf-8?B?SGtKcHBjdXplTmRzVlNUc0s1ci96ZENicFdUN2cyblJVRVFtajl6RGJOSGtW?=
 =?utf-8?B?SnVYTVJGRitqcUwwYmV1bEVML2RBTHZQdllqZy9Lb0cveTVIak8xa2lOTHlo?=
 =?utf-8?B?dURHdVhIQ2p2c0RROGtLVTl3YVJ5K0ZPOXY4alJlY0ZBN3U4UUdSSXVQeTBN?=
 =?utf-8?B?a3dtR2xhcDJSMzJUZGtNelJuNU5vZzdvM0x1ci9DK2VFTUJlWUw2dko2WDFE?=
 =?utf-8?B?d2FaNzRhVnc0VHBXQjlpL2xXS1NkcFdkMG40N1JRVUlNR1A3dUxtVGVocmEw?=
 =?utf-8?B?ZzVMRmFFa0lQZDRNcExPZTNqUDRWYkEyRWRGRFU5Y0hoTTFHUHlkZXcwUlJF?=
 =?utf-8?B?WnVuYjlyR29PUTI4QXpucGJibGhhYzlycXpOUFRuOHpkWWZDVGRDbll1MHNM?=
 =?utf-8?B?eWFFc0JoSkpSRmpDcmlTSTZTOExnWHBIdkhGZDBuV3o5bmNMUFhoaTh5eEl6?=
 =?utf-8?B?enlycmM1K295aUlUSmFoT2owbzk4WkNwUFhRRXpycUxYSmI1ZGIvUmdOTTBG?=
 =?utf-8?B?cjhrZkttak1HT0lyMCtJZyttR2pOcG00N2hQU2puRVNDaTNFbVNoMk12eGdG?=
 =?utf-8?B?WTljcGsvZlBTaTdxZ3cwaS9ac2kydW1hNTZ0WVEwMFdRbDdmTmpqdjhHRXB0?=
 =?utf-8?B?Qnkyc0NhMnNnSHMyRkhWSW1heGtUc3ZVMFFVQ2tQVGtraExvMko1UnBWMlBM?=
 =?utf-8?B?UzNFc3hnNmc5TWw5czJCdSt6OU5ua2N0WjNDNGNDN04xbndKUmlXallObk5r?=
 =?utf-8?B?ZkpmMDNlNGgzWDFYeGs3ZjZRVVdiL2hWSUQ4cjkzWmEwNFVrZ1ZrNUdZRmdn?=
 =?utf-8?B?MGNaUVM3QXowVm45SE5GdzJLaU9mRWc1VHUvM3ZhTGxMUno3YUxXSkNONVd2?=
 =?utf-8?B?Z2RrR3VCdFFpNE5XQzFXRmlJTVVBMmRoQ21zeDNuZUROYzRCdlh2ejVRY3RM?=
 =?utf-8?B?QisvdExOS2JMTUJqN1dtdGpsMHY1eXN5UFBGZ2NYdHBON2hlbHgzZ2hIRjBZ?=
 =?utf-8?B?QzRKcHBNWEZQL2FVdG91ODlCMjdtODFhVUZ1NDlLdGJhcUtKQWZaS3dXR3hq?=
 =?utf-8?B?UVp3dWkxTmxNa05jRG05aENnSEt6ZzdRS3ZiS1R3UlorVXQ5WXpUM055V21Q?=
 =?utf-8?B?eHNxd0VmQzR0NEpoZW9YMFBWQ1R4azcwdU9GUXNrWHF4Rkp6b0FhaTNEaTZ1?=
 =?utf-8?B?TjArUEN6UlFwOCtEYjdlN05HdE12b1pncEY0dEd6bEFtUzFkdG13RzdtV2Mz?=
 =?utf-8?B?OE5HQWVyaVJ1ZmtYWVY3c1NCdk9hQnR5SGxQM0hEMnJDUGVqdlcwLyt1dVRU?=
 =?utf-8?B?Mm5EbEZEQTlzU2ZkRmlwbW9RMStFOVIyL3IwZVhzRkMyRyt5SUZOYU9JUU1t?=
 =?utf-8?B?NXRHSmMzcnpWcjNqR1h1UCtYVnlxc3BFbXRxcWlHcGZhWXdpUmJGQVZ6S2Ir?=
 =?utf-8?B?VGxoV2xZcDdoTjhDUGE2aWRhU1BGTHd3djUzcGYrelRHN2RSY1JlV1Y5TlFE?=
 =?utf-8?B?M3YzaXFIZ25wUHF2alBmcEMzUWFPSmo1UjRwa1J4QnN2MWFYaUtQaU9zOFBQ?=
 =?utf-8?B?eGJlVEZvYkZnMXpsQi9JZTJJNmpwdy80dURBVzF2b05YSVpVbDY3N1dlQXl1?=
 =?utf-8?B?b1hvT25FTkVOdDh2bEdTcXdWeXdQc3FNdjdLQ0h2YmxHQ2xMUi9SK0J0S0tP?=
 =?utf-8?B?NUFTYlYxKzNNa2JBQVRtaVdMb0FXSFl5TFRMYUhYOGY0SXUxSDJabEMrZnJw?=
 =?utf-8?B?cmY3WnN6aHhZamxGTUJ5aUFXVENlTDYwMlRGNnBYbE1QUUFxQmJ5OE4wbVYr?=
 =?utf-8?B?WG9vVFBxczBMMHRwdzczT2dJMUxncE9YRm92ZXphQzEwSDl1RzlXT3l3dVlq?=
 =?utf-8?B?cTlMQmhHTEZUMUl5WWY4cXdIeWdyM3BlNngxTHpKMjdSaUJES2cvMkJoZGZ3?=
 =?utf-8?Q?GbJ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUdNeS91YlB0NzZrZDJ0eHNxWmtRZlQrTHI5UTZzTU5adndMRFNmdTdBZUha?=
 =?utf-8?B?WEV5dUxXNThRT1ZzTGhwUG5KMGhvQXE1dFh6ampMdlFvdVVQVldXb3F1ZDNR?=
 =?utf-8?B?Tlc4V2R1R28zQ0ZtNktZNE9PcWZDQXprdGtqd2N1VVA4bktvV2pVOHlhT3lt?=
 =?utf-8?B?SGhuOW9OVVBIb2RQR0VpRXdwVTZaSlY5WHJna0I1MEtlaGMxcXREV25aV2Vv?=
 =?utf-8?B?dkltL3NLTEFlYlNoR3dsRm91M1oyZVBHVnF5UThKR25JenU4THZUM3pOREJU?=
 =?utf-8?B?VHFyVkQ5SEJ2cGFPaVJ6Yk0wOElGQ0hoUFRkaVhBR3VtZWpNT0hNbkg5SkFs?=
 =?utf-8?B?RE9PWm83dk9qTkFnSS8xT3FKZzk0dDdjT1A2N0l4S0xjYmxpSUFKRGtLMDlF?=
 =?utf-8?B?Q1l6SVgzSmowTnFQeUxzTnVKSUdWeHZ0M1ZnejRzZFpweFZOc1ZEclBnSjA3?=
 =?utf-8?B?V09PUVhRMHlqMVptWUVtUmtDbDVnamhYWFlsSkxrczVoanBScHR3MXc3Rndm?=
 =?utf-8?B?Tm9vR0hmdTRrVXFRQzgrYjNua2VPODlLd1J4ZW5DTHQ2bktJSHRFaU1vR21K?=
 =?utf-8?B?OEI5RkxORk02OXFUYncyWTZnSlVOV3d1ZUNzT0dveXUxU21ZWjE3NHcyQnFs?=
 =?utf-8?B?ZEVWbVVEZlRCR3ZaK2tzNHM5NWNCWkN0VThSQi9ueG43NmpGaWtGQmN5ZE9J?=
 =?utf-8?B?ZnNSZzVzQWErR0M3WmhwSVFVQmU2czNMVlBGcTFYYi8rcnlVSVZJaGk1czJj?=
 =?utf-8?B?WllsZ3Q4QWJZOU1JeVROY1FaVzN0YnU3YTNXTENiMTZ1ZHJzQnIxMGpXMy9o?=
 =?utf-8?B?alVud0ZhSEs0YmdUWHhFckVKQ0VLNFphUWJqcnc1SEp3VWxGMmpORTRnalNa?=
 =?utf-8?B?WHVuc0R5UVp0bXEwaENraXpqT01wYzVNWUtwbnpuWWY5SGVvUUFpNWl2bXdo?=
 =?utf-8?B?enlVSjFhQkhGYWNpS1VmZTBncnIzckhlaThNbjQ0UUNtWjh0OXRTWm9rRjBB?=
 =?utf-8?B?STVwYlIzak0xMEx1aUNXRkl1TmFyWG5SMEh2dzgzRHByK25pOEdidWhoV2Q5?=
 =?utf-8?B?VnpiR2xIeEtyK0Ria0kxUEZvZmxLb3p1aHNxUy80M0hNZDdLSUMyUGlac1Nk?=
 =?utf-8?B?NG42eUN1Y0hsRlRrOXhWTWFLSzZydE9kZ0plc2lUVjFPYmE4bjNabnJxbWdW?=
 =?utf-8?B?WHo4OExsaXQyZ0tVbGRka01GNzN0cHBTQVFwMHRnZUgyOGVoYVYzQ05ZL1Er?=
 =?utf-8?B?V200L2x2QksrQWszTWNDQXg5dUdqb3dUNEFhL0sySHBRMHcreGdOQWJHNXR3?=
 =?utf-8?B?YUVqNitWa0NFenFacG1BZ2IvYnh1Z3dDSGxOcGVCUXl1MDc3blJoc24yaXhK?=
 =?utf-8?B?U25GbFVFQ3hyZ3Rxa2hJaXFadkRJWXZVeHpjVU03ZVltcXRCWHFHK0VjT1c3?=
 =?utf-8?B?QVVncGlrZElqNXN6V0VpVDBBbjNWRThERGdHYVZUOVh0VEFhb0NUTEdmRWYz?=
 =?utf-8?B?dXB4Q3hXWll2VHVLNEdmWm15RTJSVGd4SThvbXNyNlNuSG1PVG10TzhqSG5y?=
 =?utf-8?B?WVFXVGtDaUk0L04vU0JTano2VDBhTHNldXNWL2h2ZFd3Vm1acFdMdmcwRllP?=
 =?utf-8?B?YXYyalVub2owVWk4NlArc3Rpd05DNlZvdVp4Rmh1QVBmbkxBTnY0andNVmJm?=
 =?utf-8?B?WUJQSllNQ0tobjhqMm9qWnJMUDlLN242d1lrQ1FXa3FvWFR1MWpsR2g4V1l1?=
 =?utf-8?B?Nk81TEliNSt5MFJ1L2hzY2gwblBHTitnYzBOekE2THdSZ3JRWUsrREs3d2Zz?=
 =?utf-8?B?TXE5QkE2S0gzalpPOVVVZU5wZVp6R0dTVXpUWVBoZWRPbTY4eGhYMVNhVDkv?=
 =?utf-8?B?dUpBRlg5VzJHSU9WZjR4WGxISEEreVdmZ1M3UmRTaHJJYVRsWmFyTWcvZG5W?=
 =?utf-8?B?VmJqT1JxVXozNE1zR29PdkRMUllkaWZEenh1Qy94b0IrNUQ2RmNrdDA4Tkk4?=
 =?utf-8?B?Y0k2b0F2UGhkSDNyVHR5bmtTa2tvMFQxTk82cFh4Y2FPc29sWU1kMGluaFJT?=
 =?utf-8?B?djNKNCtWSnBsdThtRThaQTNBVWVVcGMxVmQxeks4OStQTEdWYlRvRXU4QWx4?=
 =?utf-8?B?SFo5WXlSNHpPRUJkVG9WK04zK0JhUmNMWGgzQjA1Y1JHelZ0eHVjUUhUYThw?=
 =?utf-8?B?TjNNTmNVa1g3WkhYQml0YS9zRGN1VmFJeGVjUHVtU2gwWjdhd3Frc1RManlz?=
 =?utf-8?B?RVBEU2FObko2QUUwSW9RWkt1QjVVUU0rWW9rdnJPZm03amNSZEswSjFTN1Rn?=
 =?utf-8?B?bEd1WjZ5bGR3dHBzQlE2YWZUaGNBQlErSTJ4MEtaM0w1QW5mc003QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a739b1-2027-4f44-713f-08de697241bb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:34:18.5875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2of2vos86ePlBDSqc4wMExuWq7XnZwlL92QOKl0KD/gYgR6K4gtEzrEqz/OJgyYH+trRDiS5x4O6jC2UIVRBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7367
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 547BA124CDE
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 02:07:13PM +0100, Jan Beulich wrote:
> On 11.02.2026 13:24, Roger Pau Monné wrote:
> > On Wed, Feb 11, 2026 at 12:40:58PM +0100, Jan Beulich wrote:
> >> On 11.02.2026 11:46, Roger Pau Monne wrote:
> >>> --- a/xen/tools/check-endbr.sh
> >>> +++ b/xen/tools/check-endbr.sh
> >>> @@ -92,14 +92,15 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
> >>>  #    check nevertheless.
> >>>  #
> >>>  eval $(${OBJDUMP} -j .text $1 -h |
> >>> -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
> >>> +    $AWK '$2 == ".text" {printf "bin_sz=%s\nvma_hi=%s\nvma_lo=%s\n", "0x" $3, substr($4, 1, 9), substr($4, 10, 16)}')
> >>>  
> >>> -${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
> >>> -
> >>> -bin_sz=$(stat -c '%s' $TEXT_BIN)
> >>> +# Convert objdump hex reported .text size to decimal
> >>> +bin_sz=$(printf %u $bin_sz)
> >>
> >> (Alternatively without this line, but ...
> >>
> >>>  [ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
> >>
> >> [ "$(($bin_sz))" -ge $(((1 << 28) - $vma_lo)) ] &&
> >>
> >> ?)
> > 
> > Isn't that bash-specific functionality?  The script interpreter is set
> > as /bin/sh.
> 
> I, too, would have thought so, but then the rhs of the -ge already used $((...)).

OK, yes, I didn't realize those existing usages.  Now that I look at
it it does seem to have a bunch of other bashisms, for example
parameter expansion.

I will adjust that plus the commit message and take your RB.

Thanks, Roger.

