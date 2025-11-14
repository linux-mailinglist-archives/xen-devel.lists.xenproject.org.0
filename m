Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04503C5B622
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 06:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162236.1489957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJmDf-0008UV-2B; Fri, 14 Nov 2025 05:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162236.1489957; Fri, 14 Nov 2025 05:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJmDe-0008SD-US; Fri, 14 Nov 2025 05:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1162236;
 Fri, 14 Nov 2025 05:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tovc=5W=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vJmDc-0008S7-LY
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 05:19:33 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d96af74-c119-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 06:19:28 +0100 (CET)
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ADMdKNa018905
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 05:19:27 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4adra7hx5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 05:19:26 +0000 (GMT)
Received: from SJ0PR05CA0112.namprd05.prod.outlook.com (2603:10b6:a03:334::27)
 by LV8PR16MB6688.namprd16.prod.outlook.com (2603:10b6:408:258::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 05:19:24 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::6c) by SJ0PR05CA0112.outlook.office365.com
 (2603:10b6:a03:334::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Fri,
 14 Nov 2025 05:19:23 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Fri, 14 Nov 2025 05:19:23 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE1OCbh1998789
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 00:19:22 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4ac5jkatpv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 00:19:22 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id JmDOvzua0osj2JmDPvhW1n; Fri, 14 Nov 2025 05:19:21 +0000
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
X-Inumbo-ID: 7d96af74-c119-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=/ca
	TaloZJgx3jVoA4sILw4FgJsrBBRPJ1tCswcDbuH8=; b=MhTf9UNqDMpCIvau0lF
	FpQQbtjZVfuFEuq2QyaEBm/2+EPsadOJRtD14Z2hr8vOZnVLgBA+GJma9OZQNGjL
	H2KxGP0HbRufvVFNm6e/bIYyjf+WK6LNlL9i0rqvimDcgFSiZHuyJAxVHxCigGPg
	j3LHmvjiUy4TuQk/j5bziB77Z1qMYi13GmY9s/1kC/UH3LuSkyXJ4GUSmRmFHBXc
	JjplfMNypHYPhHb99C8jH41MTc5GRj6hw19LFAmjXY9H8Nk8r0f+ndkGBt4R1C1A
	/UizmR35PGZpysUcj43Uh6HY2ldnT54CTKvOerlcl/pzu2c67nCKzQb4U0ILpAbj
	IfQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeZ8oarRBcEh3F9aan8r89mfbEIYbWT6HvhLUXEj31QX/m03RuYts3qopHy5hqnpaUpvO5dE2bA2GI9xFi/BnoddFZMVIR51sgnM5AhGNEJqPbTBKuGVPV0rgXBOVF4nvMQniNtNtSet9VsR2Pq7KaUQ+G1FD5hC1+6sC4bifTI3WPJRjH8sjrMkgO6bdAQOJ8aMlCGPJO8I9C4iNIExEeTXhcIhHJ5Rr0pWw0mN4wsnxIr0+xPTtzHi2hcX28gSkA5TE2RP35SL32OLWGlBltNX2myIHfK6Yy87DeN9l2+6EIuaE2szuPiwFTBl2v8WdXoymv/eVdfRqHwaYx63Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/caTaloZJgx3jVoA4sILw4FgJsrBBRPJ1tCswcDbuH8=;
 b=QTMLOkiUtW0ZSPj3PMiV7negcDFnDvPXWRgUFL0FXRa17BWTk8egnWu5bqwXdO0Mf4VbC97mKj+wIjmZUGAq4h22bweROMNEpeSKrAZe5Arowj8uztJYSHVTgTrpe7wDYbYnaa6LpusYwMA8SRWgFpJhBQjFOnIAJfRcXMC9EWFrx1RiAd5t5A2d6l9lmA+Bavc8ybMVUtLfPH6Gyb/dsOeyq7VOdB7wpUZzdjdR4xQG5+FwkU6yroxeN6t/FtZWDJrWhzk25hUqMqOzhQOgOwxyLdcWbqW/8sANsymO1olneZV1uMyAzXJnmJBLxZro9P+o7a+sioidI40ujIimIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/caTaloZJgx3jVoA4sILw4FgJsrBBRPJ1tCswcDbuH8=;
 b=R/suOObeYRuOooMkJ97Iw2Zo5gFvYvnHtw1zr+JPWDdQoOfOcCUefabq6jPCTr+ShmbRYiB2CQDr4oGlbKbjafQteCR57JDAViXFdAzVoLRNcQqc5CmKZAF7NtARUbXVEhCpircKbyKOG6KwOX/IYvRimckAUPVGEN5GnKblssA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=/caTaloZJgx3jVoA4sILw4FgJsrBBRP
	J1tCswcDbuH8=; b=IhkznWWLDnKwt0gcN0oBCMHWUend6aroY5XdtdVBXDq4LFS
	BVm2kIlQXZNVPe4rz/Ad5aMVrG9++7yIr1qUiB+Rscj0y6UBr9kIcsYcbpjMz9to
	Mdnqdfpgk0U7/cPrwRAt6j43UlSlDN0jr7EXKGMQ815FlNOfb1cODp5mWMuJBud+
	ZrSq4P4upN3dE6Xbih/hQd9YJ0ovhYbG7faZHGT5yUeJhcTdscC3Fvs4NR9XOvA2
	Psgla77ciyQ3GCMbmbu5zgJQzyx8ETkh1KEwjgY8H6GZC9O/PgNlk5McOXBCITva
	n/NB7WERhlIjtMd/CcAeEfGQTQd5fhn/23HOdzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=/caTaloZJgx3jVoA4sILw4FgJsrBBRPJ1tCswcDbuH8=; b=oQIqQdq2iG7m
	UTvY1qFhinrHSKhbAoLKF5GgMds6lpJ2JvksSGba4OW+h3DoxdRSen3cNxNWEIlU
	X6z4hgdX2frm3cRP9rHESVfVKqzBP5OydBwfQFISu/apcWbBl8tYrZQRKhMgwIfm
	TI/hwBOJsyb/bR0lF8dZ8MhZ1Q+2xTUiuFXBb0e49RJLQPDPKCS9pzu8LMvceoNu
	Iu4qFtBvKZP4KyeamD6hPYc1khGGE+Dnh0s6ftyll2mXvJoRq56++1xV/d1sXPbY
	BU9GJDiNLx8texNkETS/+BQxaPDd3AIfiTWpauwRGdzfcJRVc9ituUhmhVpUTKe3
	ZQIpEJi+rQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: JmDOvzua0osj2JmDPvhW1n
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 13 Nov 2025 21:19:17 -0800
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
        anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com
Subject: Re: [PATCH v7 03/16] emul/ns16x50: implement emulator stub
Message-ID: <aRa71Z16o4VCk3Jo@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-4-dmukhin@ford.com>
 <CAGeoDV_-AOeN=_kNK8wo-X8ZBq8DTxwGoi=wBd1ScN9j0XohmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV_-AOeN=_kNK8wo-X8ZBq8DTxwGoi=wBd1ScN9j0XohmA@mail.gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140039
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|LV8PR16MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c31794a-7963-436c-c8aa-08de233d5f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3lZL01LWUQ0L3lqc1ZScnVMYVIvWklNYnVnYlhUN3ppa2JMQUN0NjJzREdS?=
 =?utf-8?B?cytiZ0VaRS85Z3NjbENDNXpTSGJYbXh0dHlmSWtKRnU5TXcyclhNcXRpWWU1?=
 =?utf-8?B?emhseHhoZDBZR0lrVitNMHlJL1F4cEthdXZJMXUvL1drTGszKzRRMStTOEg0?=
 =?utf-8?B?T1M1YldvY1BTV1BoVEk0TkFnVWZIbHJVb3VremJQOVdPc2V6OEwrRWg2QlR4?=
 =?utf-8?B?K2YrZS9xU3p4TDZ3dVVLSmNBa1VyazgyUGFYajBQMjdsbGFaNWlYVmRCQWNq?=
 =?utf-8?B?UUVQR290WjRMZVBGQ2MzSmZpTXBQWXpJcHVndTViTmlJcWVZT0hPK3dGcXZt?=
 =?utf-8?B?MW1Qa0NnaThQempTQlRUcU1OdkxtK2dOYW5iaUxqUkl5NWFkQmdBVUxlb2Nn?=
 =?utf-8?B?MFJiZUhTN2J0c25CVFdMRWs5YWFZN3d4REprTzNXZ0FYcGhmMXBDOEJNZVhU?=
 =?utf-8?B?QkUyc1NDNzY4K1MyTXRCWHRBVktpVk1Fd0tNa3dIWU8zZElON05ML2V2S0Zh?=
 =?utf-8?B?VWVvb3R3V1JXeWVnYUxkNzNVSjRvQm51bHFHY0hxL0M3VnFldUNMMnYrWGlm?=
 =?utf-8?B?WVZyN1NQYnE1SXNFN3hoNUI3TlVVdGNVMk5YYStLeXViZVphZzE0UzlkYjdt?=
 =?utf-8?B?M0ZZMkJKaTJPWitOOXpIWS83d29WMm8rb0pHQjJnekJXTmYrdHk2RlBYbElk?=
 =?utf-8?B?K05CNHBXVFlyTjBtWEhHdDJHN0ZWUi9IQm1UdkRaelphUVlBV2tjN2x3cStR?=
 =?utf-8?B?a0hpS0N0bzFwN2RnMjc1cTNUUlkzWnlUOXptUi9kRzVjaHlHcUM2YUcwQTYw?=
 =?utf-8?B?S2Q4OVlSZVhEUTVBNmw2aWdnSkhJVTI5blYxbVpPS3RKcXl3MUc4K0R0WVBk?=
 =?utf-8?B?Q2lzV1R2dnNBK3hwZmNuSDVzcVlYdzN3dFVrMXVMQlZOSEY2dWRrbFcxZjB3?=
 =?utf-8?B?Q0d6LzRRY3VkSzY4WXhFNy9NZWNGRXVEdjhHQ3VFZW1rU0NxRk8zSmJvcGhF?=
 =?utf-8?B?UzgzY1Nyb1l6WFAzTWIrUjBrVTJtcko3dFRBazVaeFNBVHNDY3FQb3F0K1R3?=
 =?utf-8?B?VWhTWE1oUGVGTVpCaWtwWm10SjVTN0lFQ0phWlpHamI4cTlzUHVOWEJoUjd3?=
 =?utf-8?B?cFUzN1NMSHlPbTBBSnV6NGl5c2dmeC90cDhFczUyc1BRclhmNm1KdjU4YXha?=
 =?utf-8?B?RUNkQ0h6cGMvenFJbTAzdnJ1cGNSYzVLNXJsWTRKbXRJRVJUSFlWVDU0VWgx?=
 =?utf-8?B?WE5NUjFUWFdqTldZbGFVQ1Y1T0EyVEVldzZoUGFOeW9oamxBSE01YVhBbEJp?=
 =?utf-8?B?dGNBODBjc0lqNXZXWWNiSFcwZnNBNjNrT0swdlUzS2IwZXlJWktwL3o2cVhi?=
 =?utf-8?B?bXR5T1VpZUJqRTVGd3pVWXM4bmVXOTV2d01iTmtwV0xzYlNMemp2Y21kWUJF?=
 =?utf-8?B?bEE1VCtTaU5DQjZnNWVQUDBGL0FBeTZVaDRkOFNsUXBLZUMyMnZXckFLZzd3?=
 =?utf-8?B?eWU2bWVwaVF1YnROUXlQU2hmRloya3lNYlN6SVJNT0U4dUNsem56WENJRWhJ?=
 =?utf-8?B?NTQxckw1TUJZSGp4UDVaNkRLUEJxZWk5UFlvWjBJbXJscDFkM21TV25lRUVy?=
 =?utf-8?B?eGtqTmxOZTdOdU96a09LNytPS0NOTmliYlFpVW9ua3JTdHFOb0duRWM4clVV?=
 =?utf-8?B?blZMZDhoZ1dpNERtZFg5OGVZdklva3lFN2s3bXhTSk44ejNNWkg4YncvU1RD?=
 =?utf-8?B?RkxhSGtlR2NBYXBBZG5xTU5JdlhJWHJFNlYvc2c3KytDOURsdEdjNC84Wm9E?=
 =?utf-8?B?L0paSStrclQrZjdCRlM2UEY1Z3QvQWY5clNhMWxDbldIVy9hVUJrM2FXZHE1?=
 =?utf-8?B?a3RkcHZvN2ZWY2xxM0IwdTNKdDFnTU5GTE9QKzdhdmJzZWtKdGdNK0FOb2VT?=
 =?utf-8?B?aWdGM3Q0cERleDdQQlIwVnRWeDJ6WDY2UTVSMzJJcVUyaXlEMFFMVDdhZGlW?=
 =?utf-8?B?cUluZUxscjQ1bTM0S0VaTDFHKzNlTGcvVGxRbDA5bHpTZzVsTmRKem1hTU1v?=
 =?utf-8?B?K0RSQkZCaWFTVHR6MThHOFFzeDFrMUtSRUJKWlcrM25ZanBJcFhjbDcrWitG?=
 =?utf-8?Q?7nDU=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TLwep0PKc1mTXm7tdwMyPy8bTe1BdiRzeZi+QMdkF87itJzmsSYkxztnoxg90bL56SEMdyEu8GZ5KmcqPT0ZQRudesVsjnvihli3NpfMd08gIZ8hHExWGoPaq/1Bm5y9WImKC0FX2lZgNgnjl0cbzlxTzEYblNj8PlFAGW7jnkuu1uck3C7bSNM42HHuZzP6/wBpJJnl/91iar9h+wADudM+3nR6koR8Vrig8K+9itFgDSt0IsyllSzLoQ5beKvLgn/WsvWuZxYLpUlmsBlz50C/bItIBtOneJazVEfF5wiEk2L3SGEaLYn5OPvPSU7/Gymc8xgO1vU1rTGlWipBETVrkKsRlch9czGQV13T/bpVacBdsQuiB5jn1qA2J5UxB0JcGOSWhZVxt4NTEYMWZottPiP8MdmKW6cUJYpWsGhd4mqtXDiN76wbFk1SW9ueOVS0t1Ici5ybYSlItbJfEqqe08vhWf3ItKDex33C89mCf1kfzKyUqoh5NpeeLY8ZuwyGfwfEKv2ku3QoPA9nSjAq7MkZX9DHKHVsw28u4qn7xgzewWpRk1vayM9Tgp0OvdU7UF/DjAIWUTaYg8/2FqGvXCwkJlP4cGpRE/9DjajvhCx7sNJ+Gxaf7U5vTDKdUfFklvwK/qheabUnNSlJ4g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 05:19:23.1208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c31794a-7963-436c-c8aa-08de233d5f6b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6688
X-Proofpoint-GUID: mL31vQwhq5KiXLnYj6q6aKUjPU4_LSqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE3OCBTYWx0ZWRfX9KOaVYf/WFNy fAIGeJIj7QVS+5ETfiyX1iqewZ2KDgecKnxMf1pLNgj47Hkv0ufIPc3FXa/hBpol+px0e6AAHjf iws6OBJkZO+QP1B6NBsFiLg9sXOIe+U11uQRgqnV6aSNclD/UeCp6OriV2TdWRDn61KsnV/AG7+
 +ztWpEmX9KV7mEZ9sHc+C6pvsiXiLIFPLwlqm9ePAUVkQguox+K2Cpv/lDs4T6Fsm5FZfzCBwhi HxzXF3rR3EfU3cHMZB/OYTUMsTjqNnP5qlJGwK5SPO2Yi266tPAFHeZLKHXFRFW79DNDAuP+5s0 fM9drGEyt4xPOieBsZoo17B1SdT6QgiyZra+8Uhse2thdenh1ueSMxzwL40XNI6jAdZDhDSIwEv
 5v1UN/yES3O19pBlAXs+TKJNBA/ilw==
X-Proofpoint-ORIG-GUID: mL31vQwhq5KiXLnYj6q6aKUjPU4_LSqS
X-Authority-Analysis: v=2.4 cv=JtL8bc4C c=1 sm=1 tr=0 ts=6916bbde cx=c_pps a=uKk6FyUS+xKIvFCPM6xM7A==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=haI2-YjwY8mpjQWYs8cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=DqJYxgmhk6moR-_7_KoZ:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511130178

Hi Mykola,

Thanks for the earlier reviews!

I am getting back to that series.

On Wed, Sep 10, 2025 at 01:05:13PM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> I appreciate you addressing the comments from the earlier version
> of the patch series.
> 
> On Tue, Sep 9, 2025 at 12:12 AM <dmukhin@xen.org> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > The change is the first on the way on introducing minimally functional
> > NS16550-compatible UART emulator.
> >
> > Only one domain, defined via 'vuart=' parameter, will have UART emulator
> > initially. The command line option is not documented yet because of the plan
> > to adjust this code for vUART configuration via xl.
> 
> Since the command line option is not yet documented, it would be
> helpful to include the expected format of the 'vuart=' parameter in
> the commit message. This will make it easier for reviewers and future
> readers to understand how to use the option.

So I ended up moving that code into vuart.c where it belongs, along with
addressing all your feedback.

--
Denis

