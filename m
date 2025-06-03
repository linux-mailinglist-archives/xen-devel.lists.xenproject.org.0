Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678ACACCBB0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 19:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004722.1384441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMV3q-0008RD-5I; Tue, 03 Jun 2025 17:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004722.1384441; Tue, 03 Jun 2025 17:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMV3q-0008P4-1w; Tue, 03 Jun 2025 17:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1004722;
 Tue, 03 Jun 2025 17:04:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbA8=YS=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1uMV3o-0008Oy-Ss
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 17:04:25 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbae3515-409c-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 19:04:23 +0200 (CEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AEpSu009184;
 Tue, 3 Jun 2025 17:04:18 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahac5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Jun 2025 17:04:18 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 553Fc9xB034872; Tue, 3 Jun 2025 17:04:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46yr79whu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Jun 2025 17:04:16 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Tue, 3 Jun
 2025 17:03:34 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 17:03:34 +0000
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
X-Inumbo-ID: cbae3515-409c-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iEr+24aXgFdbbB10KT8hbM5HxMuXX2wJFJsvwsazeyA=; b=
	PklZb3ID+X3ZTlAfTNbKvOmD+Us8fVtkLtKfOSCTs66ElBCvUoVwrE4KSme/C8Di
	XFZ0EtnDeHZKxbOurcOvcxC7pCdglXo39rRaUGgKc9yZD7bcBVpYk22o8lXWy5v6
	TuWmhWMcA1XydGuQJhK1R1Q48s1PC8S4Zvt+YBD1vf5WcJr09kAJPtej/acLtnHe
	N4W1Qo4NpAtAbct7y9EP5kL4uPnGnI1rmm37aMNGrXw4OnFlMdiTb6R7h6nq+Ube
	RhShyCgguIQQegOzp/JuTaedchkL0fM/Y36z6TqIjQdWqK8PqIDgAxwE0rlVCTdM
	dNgzRcxocWOpRN1q7Hg7mg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvxVDTSMa04bB6h3ghl2lzV5RZVmIIVn+3NyV58Z8NEPjyZRaKvE07QjrlrTNqlA68CRCWsuk6jU+VPG22jd73ehW5okUWccEjBjibfyVhc/SDPCz8YJBTv/EYoz1duoMDQDKD+MmIY3y9Rs5Q+HTQ5f33+QviKavWx3ZTNQkM/hdC/LFIdilbI/u2prndHuOPL2ntiVc0Nly+aeUb9ZpGjsk4WfvHAjLo5yKS+qkzTfB05lOdLjqWfU8ov3WzSIH4VCJhqoirchhNn5VfMhJXqcfsZvtRlu3tW37aq3nKT/yfs6jUICWNOohB53A62pbtZTnjaNjzenrwdH3Z56eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEr+24aXgFdbbB10KT8hbM5HxMuXX2wJFJsvwsazeyA=;
 b=PscygufRVCWVFROiSHAPFTpiUVqZMD9x2Rsg7KC74Kaj977T8ZvaSjDeOyF5496OHIDty6eD2/gJtobS2kwKTvVAempsBYtDp//SLyAbnkuni3BPa1wkPEAXNwXPGIc7E9y/H09yu9YipxhJzt0wOrO+Rf31ProX5HBwGx/boh1bsoJAnJjKAOYNnp3crijMGNWC68QjH6Sqt7SVlC+UXSnNtwAqluogULc4pJlgwDcj3ihMzZ/vz5mgf1FSu7oBtXL+WCddoaq+m0tF0X+H1shNvhhqf1N7TBDSjV2T18u0Bo0ixOA2VzBUeHVHlxALqH4Jejt/OYTgunQ2apVJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEr+24aXgFdbbB10KT8hbM5HxMuXX2wJFJsvwsazeyA=;
 b=QTdiLF85kVmJaqnp+49uvfhI4BhrShI8NKrLOV4eOZz+T/P959QXqP2eMEYqZS/bU3C7vBO7ZV9ieI/deZNI9s1aTYYUHmBe89KRg38KfgQ6WxaOZP/2xCgYVki97AMK1PzOjaLj8mfsQ9NQ9eaZC3L0ehN3CVdrb9H5QGq+EPs=
Message-ID: <4ff41a13-1af9-4c87-ad6b-cd616b4d1840@oracle.com>
Date: Tue, 3 Jun 2025 10:03:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/22] x86/boot/slaunch-early: early TXT checks and
 boot data retrieval
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        trenchboot-devel@googlegroups.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <a05ef5d70803eb25ab959de011c9717ce9194558.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:408:e8::27) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|SJ0PR10MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 362effc4-fb26-4423-0039-08dda2c09322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTZ3TkpKUDVkTEphaldXMmFZbmllOFE4QmI5dEFwYzc5ZStGYWRDY0JvRHh3?=
 =?utf-8?B?cjhjUzB5NmxjY25xbmQ2ZGdwTExLRWlwemZNdlVoZWg5dCtnUHM5K3pETVhF?=
 =?utf-8?B?YjRtSkNRcGNETVVpR0VTaVBGZXArWTFZdXByVDl6ZEQxS0IzbXExRG40YU0w?=
 =?utf-8?B?RUkzY00wVXE2eTRwVTlud3dFRmh1NFp6MEhxN3U0Ly9pWHU3TGd4YVVMUVRa?=
 =?utf-8?B?VkpwTFR3T1FYb0FOVC9iV3VRc043KzdZcThnbXJ5b2twUEdMV3JSVDF2dFh0?=
 =?utf-8?B?R21FQ05ITGNQMCtET1V3UnJyNWpzY2lpN3M4NE5IYnVLMDlwRktlSVh3V0ow?=
 =?utf-8?B?Q1dudDRVZVdKckY1d3kzejBac3VMMVFJcWlES0IwZWRyZkFJam5KRnM4dmpJ?=
 =?utf-8?B?QnJlRjZ0TFVKbkJ2K2FGZ2hBZDhXSnhIWTFGTFBaU2ZXTmdZQXE1ODg2d1cv?=
 =?utf-8?B?TkhSeWw1STU5MWJYc1RabDNDUWYvMTNlWkMyY3RENHBGZkhXWDg5NWpVc3gz?=
 =?utf-8?B?K1M2M0dXMkFibVNvbURnYUR4NzZRbWJGSE5SWVdjL2l3MlNDYTd6V1F3WXFi?=
 =?utf-8?B?ZUxMSTFDTnVGZWh5OG9QODZISUw1M1c3TmlOTHNNRVNFaUIxdWRxY01sY0tH?=
 =?utf-8?B?T3BTQmpvVHJNRU5wd01JZ0VKWnJqSkVQUE9USVBxeE9JdWRzSU1BN3JvQVAy?=
 =?utf-8?B?NnNsT2lBMW1pQXNBUlo1SFcxRnBzM2xtbmZ1Q3NDVXZ4TytXNUhUODBXdkZH?=
 =?utf-8?B?dlIxc29hMlJNK2hvNnNZb0ZQYkFSdERMc2VJbDI3NVVWSkJxN1h3WVliRjBQ?=
 =?utf-8?B?Vk5hc1VGWTVNY1JIWFRJUkRvbDYya2xaQ1RYLzVWTjUxOWtoV3BuZkNPaGFV?=
 =?utf-8?B?dDJIdSs3d0crakhXakRtOERpRnFaRDVBZHhZazM4ZHBybU96YlVYS01LdGlp?=
 =?utf-8?B?TlozYWozTlNYc3gwSmMwemk0eE00TFFvMnFlbVNPRlpUMG1CbjRYUUd2anJ1?=
 =?utf-8?B?eW8zV0ZXMEpTZWYxR29RS1ovU09kNEdsNU5nMEdJQ1YyRkg4dlR3ZFI3SkFw?=
 =?utf-8?B?MzlvdDkyem1NYS9kWFlrS2duNE1IWTl4THh0ZFFRNUY4Y3J6YlcwbmYvQmhE?=
 =?utf-8?B?RS9KcFZDM3RwMXoxY0NxV3crelh3NVc3b0ZIRk5zVWxtM2I2WFV1Rm52UzBB?=
 =?utf-8?B?OUJhM3N5VG1zSjk1OGcxNG1QZERpNWtQNVFpK0dXWXMvRUVnTDdLYi9vMG14?=
 =?utf-8?B?bEF4V011dWRCMnNiNCs4eDZDUmJ3eHJPckljZGd4TitWS2svN2FHZzd6RFVM?=
 =?utf-8?B?UVZSOE8yQmE4bmhLdFRYdXk3cWhuMGpjS2lsTC94NXQya3pvWEt3ekp1Wktj?=
 =?utf-8?B?VEQ1anVtSUFPR2x3N3JvNDExdGkvd0pxQXRrN0RSWWlIcUxadlVRcmJ5Y1lG?=
 =?utf-8?B?TVdTWmtuZmZTZHh6eHFkWUJSTGx1SEt2V1QvZCs4enVkbW9MOUNneXNvNUYy?=
 =?utf-8?B?M1NCOWdMSnUvMkR2V3A0ckZialFaS0NmeEJKSTRrQzlqT0Qvbm13N1BIRGxy?=
 =?utf-8?B?cnRiVVo2bCtjL1lRb1ZEdGhCWWxIbGJyRWFQQ0hQUWhTOWJwWmV6bHJMOHdT?=
 =?utf-8?B?cENXRHFyYzZKR2hiNHBicHMweVd4bmVSeGlWWm40L0pXVzFzMlA1alJTQlhT?=
 =?utf-8?B?UVA1WTA0V1VreklaOEE3dVZKZy8yZXBCNGpsV0JRYlphWkphZ2Rsb25XNGs1?=
 =?utf-8?B?eExxUTZTV0sxUmQ5dlJYV0ZqNG4ySklRd0ZKOGo0Tm5rT1B0WThwcEZJbjZq?=
 =?utf-8?B?WFVLanpYQ2NHcTYxN3BvOG93WVhrOTdyK0xubTdGTDQ0dUgyUlZjdHlOKzZU?=
 =?utf-8?B?Zk0zWnZwQmhxTHNRdHZqbWxWUFA0dWI4Y2tURldqUjAxWmZIdTRJNkF2eXg2?=
 =?utf-8?Q?T+kjp6dvXNE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlJsVTU0dkxTZzVkUEQzT1NhMkljRVBqb3c4OCtoOTFBaVFuQmVNMzJWTXUz?=
 =?utf-8?B?S25kNjNQdUtRTTF0ZklTRkVSVWwrL2NDc2RHNzlQMkVrNU8vOFptYjJTZXk5?=
 =?utf-8?B?YXcrSC9qa2pzV3RjWGhDSFZhV01xNllFaXlFSTBESFlyV0xIaFI4bGI4Q0gy?=
 =?utf-8?B?MkhYK0ZhYWZXUW1pa1NOeUhaZVRzSVlpTVB5R3hnSXlPcm9NaVpqckZPN2NL?=
 =?utf-8?B?elJsK3d1eWlpTXdvdi9wek5QZ1p3a0ZjWUlabTRzQy9tcXQwRzJ0SHd4bGJJ?=
 =?utf-8?B?R3dGZlZkaDEyaVJQOGUvNmxubld1UGp4SkVWUjdaZDRlMzg5VmZhU2pKL01V?=
 =?utf-8?B?aW9CUW5PL3Bkcmk2Z1UzUi80eDlUWHEyWjlLT284NDl3anM1RWlzcldmdEJL?=
 =?utf-8?B?VGhDMFArZWEzQ0VWeUEzZGFOTUZzcWhXL0xScGFKRGhHUVd0VU1GdENmQk1F?=
 =?utf-8?B?dXpuTEVHRTEweHlGM016OUR1bEFEcmZJL3BxY1VBWWkzeDhWcWxrVFQxTmNI?=
 =?utf-8?B?TVZrRGJDejlsR2ZIZEtUamVFN3Q5dWFGUXRDclIvMXRFZzE1UHZSYnZMSS9V?=
 =?utf-8?B?N1liZElZNDVMVVo3WWl6K3VyV1dPL2JsSjRuN21rNGJxWkh6UzZQbVhpUlpU?=
 =?utf-8?B?WGlvcjVEaFBEQmpGemFLT2VvRWdHK0JITkFMNTFOODMxWHlUUmxtbEVsMlVU?=
 =?utf-8?B?Z3pTU3hKQTJPYUtIMjg3bm9xNSs5ZXdrTlJvLzJpWFZreVhKR0Y3YnRpVGtW?=
 =?utf-8?B?K2VCaEI1NFYwWFdYN3hCUzhVQ3NtQkNFbDN0ckFOcmQrampPWFNrWU1RV2pz?=
 =?utf-8?B?WVJvRE01V25YRnlWMnVFdzFzZ2xDbklYQTR5OXJzbjEvakRGbXk3cTUvaGV2?=
 =?utf-8?B?aVlDalZadUhDRVl3aDBEayt1c0dzQVlhMjVhRVlJZWcyQ0FRbnFXUlRwaHF5?=
 =?utf-8?B?NFpTTW0zMnZrTy9KVnVyN3hrczI1djMxZzRZRVpmRkg2YmJTUDhJd0pZOVhG?=
 =?utf-8?B?cWNhSCsrT2QwR2Rra1hWUXl3dHk4eFh4cG1CWFpyekI0THNaK1NZNm5udmZ4?=
 =?utf-8?B?VkVsVkRkUTkvYUJNU01hRWlXYTgxSE5DVkREUEJOOStlemFIRmk1bnhTV09I?=
 =?utf-8?B?SkoranAxeWo5Y3ZkM05qV2xuWG1zSVgvSmVLQ1BONXFwcyt2MHJ5ZHRNdzVF?=
 =?utf-8?B?YlAxdnNyY3RjbW11cVUzVEFOTkV1ZTBkNmlJMXZiYTFISFY1dkpVM2V1Mmx0?=
 =?utf-8?B?aTM2emRJNEVRVTNRNTk0V2R2eXFoZlFORmt1ck90N1h3b0c4TXpMTWQ0elht?=
 =?utf-8?B?VUFMRXZEcWFVUENvazlId2hvbFNTSFNUVXhnOVZ4ODZJcEF0MmJ3cjJmODJw?=
 =?utf-8?B?NGl0QUlWRlJmZi9nSERLTFZtSWdrRG5kdkFNK0NETGRCdnIza01ZQjlvaHVR?=
 =?utf-8?B?cndrQ2N3VTdPZ0RldnVtMDNSY0I1cGZuNU5PRTdGSHI5RDdXemtLMUdLemZx?=
 =?utf-8?B?WlFHdGpzNlBLYTlzcmZhUzI4ZjczczYrSXY5WXdzQ1ZiOEhMTGhTSHdNUTdP?=
 =?utf-8?B?YUdJektKS2xvM3ZzU0ZKZkY3Zy9kdzZzRWh2L3pUYm02ejlwOS9aYU5mWnJ0?=
 =?utf-8?B?MldLMG03ZnJYb3BXcHN1Y09UQjJ2SXI0d2Y3Lzc5dU81elk3TndXems1Mmdy?=
 =?utf-8?B?MnVOMlBmbEhCcFlHckVkRXdqYlFOKy85dHpGZk1PWGhtU28yakJ0U05PZVFn?=
 =?utf-8?B?Ry9CSHZ6RUVBcVRmL2UyYjZ4eFZrUWNpVnQ4L3FaQWJKQ2Y2ajVyUXV1Q0Nr?=
 =?utf-8?B?OW5iVnNDaGcvYVpDaWhya05yVDc0WVd6RUdWUlRNREY1eWMwWHVWcVdSN3Za?=
 =?utf-8?B?N3NFeG1nZ0hHQU1mV2x2bzVySnlIdmNQN050d0k0aytZVm1xNFlDcW00TkNo?=
 =?utf-8?B?cG5TbjlFTHUzQXVVUWdnS1BiYW1ybzZ2dDB4bURod0lQc3NHVi9DZnAwL2t5?=
 =?utf-8?B?ajloYmJPa2N0NHdoL2pqb0NiT0JNbGdScFVuYWVZKzlHdDZ5dXYrTU8zd3Bm?=
 =?utf-8?B?QXJVVk9VUkZ3K1R3U2NtK1ViWGRhbHB4djQwTjQrU2t1T0lscDN2QTFCOUpB?=
 =?utf-8?B?MDVkdDJBMlhZTlZJeEU4dFlDSEVjdDN2b2xpMkNmNVJ5N201MWdFekNPdmtK?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0C1VkevhZVH6/Xks/QXz8bYKyaYRHXP9IqvBnKs86uXpNXdEyQ6692O/qEATUqVFxcIMNGHSefBDQdReOpd3u4NaEtqj8fEibDk9cLp9/K6jXi2Zp6WmnGA962ND3s21pzwmHPUjU1Fw1EOe3I5QWoMAf6SPiuNod7n1pAG1QBez2NYBEPyKvTrkERLukxNSsXyNmy/F2vjczwsm9gNcN8hj/BJdtdNbiyKEh2dLjQuRhakIYOHwwny+0bsJ/y10Zc1lKptJnQp6lNomO2to8ZyYCdfMYZGYdf3shW0mSj2G3S5KFQ8dgO7r8vXg7T7iyThfxbRgKYReFCVlOUtTP198UW6GM4IuEAtom92r3Sst+C/27AdmHF0sSRfgyJx/5iPMVSJG8BULXHQ3UeP98y/lJIk3eumsGVjZwtKU1GtZk3w5bYnveE1NzhJKVN+ako+OJDflTvwNDWJZVLLYD+8noFgIPijm4WIofsiUq5gNetxJ4FTQV0SnJpqlJhZRqfUfcthLfBpfsTp2aA3SxZCRhBZ2G9pQpGvLYPeoamZ0pYiVXQbzN3adqDhrmKhtWwX+OvPDecSazlftKduCo5Xsvf34uBjuLbHDz64fZ3A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362effc4-fb26-4423-0039-08dda2c09322
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 17:03:34.4212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cvbhl1iRz51kwMQoEZezJXiCschc7Rh0cHGnGzxnIhMK03SRHRxqerx/z5hL1OjJVJDkN73QD3ULyBM0BM7yAneZ16Uz3IJchrMOM8XwHtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030149
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683f2b12 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=C_d68mY_AAAA:8 a=1LLuQrjauJPoW5hFOboA:9 a=QEXdDO2ut3YA:10 a=wASdygnoxNaGnvDdgHrj:22
X-Proofpoint-GUID: QzQpXWojv_vT1-lncHvqD9Tj5t-9cENs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE0OSBTYWx0ZWRfXwKX0pfKcXx7K X7pQOKt8lWVyous+52XV9T43tRyc+lVkj7ZNwMMv2ndc4cw140jIHNWeoiPrgqbNerayUk0RPw7 nRuhztQbVuE2n2Rz/02IYLHYAdNfFyi7yLH1nd02AyZNTtxzhKQ5UeSl9A0n2ACyW1Q526bs8na
 rSqdWEdmTihDnvV+GMhYnp0cdDTH24xVzYR6/SRAUPJSdxlAOfDIyIAbU8eRqybGYcCKM2UMI5Q 0QIC5OuptYLHrdtQz67+CYN45BF5UPL1Wc3hWGM64Qdu79VLGPXel68phKW3wzhd4s8AwlWvCpv 1fkhQOF3B6wG3KIjcXe+7oibBc9932ov6RUtbbZe/y81eAhXYZL+aAjlbeHPFCijyh2PjEpZk8P
 IBZ5SDpupxwgxfYA3ADp1f0QIof2MMeWYMeKNvPhqw1i3lE3VKSbL/CjUfCUgykiKGile6Js
X-Proofpoint-ORIG-GUID: QzQpXWojv_vT1-lncHvqD9Tj5t-9cENs

On 5/30/25 6:17 AM, Sergii Dmytruk wrote:
> From: Krystian Hebel <krystian.hebel@3mdeb.com>
> 
> The tests validate that important parts of memory are protected against
> DMA attacks, including Xen and MBI. Modules can be tested later, when it
> is possible to report issues to a user before invoking TXT reset.
> 
> TPM event log validation is temporarily disabled due to an issue with
> its allocation by bootloader (GRUB) which will need to be modified to
> address this. Ultimately event log will also have to be validated early
> as it is used immediately after these tests to hold MBI measurements.
> See larger comment in txt_verify_pmr_ranges().
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>   xen/arch/x86/boot/slaunch-early.c    |   6 ++
>   xen/arch/x86/include/asm/intel-txt.h | 112 +++++++++++++++++++++++++++
>   2 files changed, 118 insertions(+)
> 
> diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
> index c9d364bcd5..662144e42f 100644
> --- a/xen/arch/x86/boot/slaunch-early.c
> +++ b/xen/arch/x86/boot/slaunch-early.c
> @@ -22,10 +22,13 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
>       void *txt_heap;
>       const struct txt_os_mle_data *os_mle;
>       const struct slr_table *slrt;
> +    const struct txt_os_sinit_data *os_sinit;
>       const struct slr_entry_intel_info *intel_info;
> +    uint32_t size = tgt_end_addr - tgt_base_addr;
>   
>       txt_heap = txt_init();
>       os_mle = txt_os_mle_data_start(txt_heap);
> +    os_sinit = txt_os_sinit_data_start(txt_heap);
>   
>       result->slrt_pa = os_mle->slrt;
>       result->mbi_pa = 0;
> @@ -38,4 +41,7 @@ void asmlinkage slaunch_early_init(uint32_t load_base_addr,
>           return;
>   
>       result->mbi_pa = intel_info->boot_params_base;
> +
> +    txt_verify_pmr_ranges(os_mle, os_sinit, intel_info,
> +                          load_base_addr, tgt_base_addr, size);
>   }
> diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
> index 7658457e9d..122b4293ea 100644
> --- a/xen/arch/x86/include/asm/intel-txt.h
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -93,6 +93,8 @@
>   
>   #ifndef __ASSEMBLY__
>   
> +#include <xen/slr-table.h>
> +
>   /* Need to differentiate between pre- and post paging enabled. */
>   #ifdef __EARLY_SLAUNCH__
>   #include <xen/macros.h>
> @@ -308,6 +310,116 @@ static inline void *txt_init(void)
>       return txt_heap;
>   }
>   
> +static inline int is_in_pmr(const struct txt_os_sinit_data *os_sinit,
> +                            uint64_t base, uint32_t size, int check_high)

bool return val?

> +{
> +    /* Check for size overflow. */
> +    if ( base + size < base )
> +        txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
> +
> +    /* Low range always starts at 0, so its size is also end address. */
> +    if ( base >= os_sinit->vtd_pmr_lo_base &&
> +         base + size <= os_sinit->vtd_pmr_lo_size )
> +        return 1;
> +
> +    if ( check_high && os_sinit->vtd_pmr_hi_size != 0 )
> +    {
> +        if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <
> +             os_sinit->vtd_pmr_hi_size )
> +            txt_reset(SLAUNCH_ERROR_INTEGER_OVERFLOW);
> +        if ( base >= os_sinit->vtd_pmr_hi_base &&
> +             base + size <= os_sinit->vtd_pmr_hi_base +
> +                            os_sinit->vtd_pmr_hi_size )
> +            return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static inline void txt_verify_pmr_ranges(
> +    const struct txt_os_mle_data *os_mle,
> +    const struct txt_os_sinit_data *os_sinit,
> +    const struct slr_entry_intel_info *info,
> +    uint32_t load_base_addr,
> +    uint32_t tgt_base_addr,
> +    uint32_t xen_size)
> +{
> +    int check_high_pmr = 0;
> +
> +    /* Verify the value of the low PMR base. It should always be 0. */
> +    if ( os_sinit->vtd_pmr_lo_base != 0 )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_BASE);
> +
> +    /*
> +     * Low PMR size should not be 0 on current platforms. There is an ongoing
> +     * transition to TPR-based DMA protection instead of PMR-based; this is not
> +     * yet supported by the code.
> +     */
> +    if ( os_sinit->vtd_pmr_lo_size == 0 )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_SIZE);
> +
> +    /* Check if regions overlap. Treat regions with no hole between as error. */
> +    if ( os_sinit->vtd_pmr_hi_size != 0 &&
> +         os_sinit->vtd_pmr_hi_base <= os_sinit->vtd_pmr_lo_size )
> +        txt_reset(SLAUNCH_ERROR_HI_PMR_BASE);
> +
> +    /* All regions accessed by 32b code must be below 4G. */
> +    if ( os_sinit->vtd_pmr_hi_base + os_sinit->vtd_pmr_hi_size <=
> +         0x100000000ULL )
> +        check_high_pmr = 1;
> +
> +    /*
> +     * ACM checks that TXT heap and MLE memory is protected against DMA. We have
> +     * to check if MBI and whole Xen memory is protected. The latter is done in
> +     * case bootloader failed to set whole image as MLE and to make sure that
> +     * both pre- and post-relocation code is protected.
> +     */
> +

Is this the full list of entities that should be covered by PMRs? I am 
thinking of entries in the SLR policy that should be covered. E.g. with 
Linux we ensure setup_data entry blobs are covered before measuring.

> +    /* Check if all of Xen before relocation is covered by PMR. */
> +    if ( !is_in_pmr(os_sinit, load_base_addr, xen_size, check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
> +
> +    /* Check if all of Xen after relocation is covered by PMR. */
> +    if ( load_base_addr != tgt_base_addr &&
> +         !is_in_pmr(os_sinit, tgt_base_addr, xen_size, check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_LO_PMR_MLE);
> +
> +    /*
> +     * If present, check that MBI is covered by PMR. MBI starts with 'uint32_t
> +     * total_size'.
> +     */
> +    if ( info->boot_params_base != 0 &&
> +         !is_in_pmr(os_sinit, info->boot_params_base,
> +                    *(uint32_t *)(uintptr_t)info->boot_params_base,
> +                    check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
> +
> +    /* Check if TPM event log (if present) is covered by PMR. */
> +    /*
> +     * FIXME: currently commented out as GRUB allocates it in a hole between
> +     * PMR and reserved RAM, due to 2MB resolution of PMR. There are no other
> +     * easy-to-use DMA protection mechanisms that would allow to protect that
> +     * part of memory. TPR (TXT DMA Protection Range) gives 1MB resolution, but
> +     * it still wouldn't be enough.
> +     *
> +     * One possible solution would be for GRUB to allocate log at lower address,
> +     * but this would further increase memory space fragmentation. Another
> +     * option is to align PMR up instead of down, making PMR cover part of
> +     * reserved region, but it is unclear what the consequences may be.

The consequences depend on the firmware. The failure mode we used to see 
was on some systems if the PMR covered certain areas marked as reserved, 
the system will hang at boot. In this particular case, firmware was 
trying to use an xHCI controller to get to the kb attached to use it at 
boot time. When DMA to the host controller was blocked, the firmware was 
unhappy. We have not seen this issue in a while and the current logic in 
the prologue code just sets the upper bound to the highest RAM area 
below 4Gb which is optimal.

The most correct solution for PMRs is to read the VTd RMRR structures. 
These can tell you what reserved regions should not be blocked like this 
(if any). This will give more control over the best configuration for 
the PMRs and what to avoid. This needs to be done in the prologue code 
and validated in the DLME.

And yea, TPR support too where available.

Thanks
Ross

> +     *
> +     * In tboot this issue was resolved by reserving leftover chunks of memory
> +     * in e820 and/or UEFI memory map. This is also a valid solution, but would
> +     * require more changes to GRUB than the ones listed above, as event log is
> +     * allocated much earlier than PMRs.
> +     */
> +    /*
> +    if ( os_mle->evtlog_addr != 0 && os_mle->evtlog_size != 0 &&
> +         !is_in_pmr(os_sinit, os_mle->evtlog_addr, os_mle->evtlog_size,
> +                    check_high_pmr) )
> +        txt_reset(SLAUNCH_ERROR_BUFFER_BEYOND_PMR);
> +    */
> +}
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* X86_INTEL_TXT_H */


