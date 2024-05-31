Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD158D5DF1
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733504.1139802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyLG-0008HM-1F; Fri, 31 May 2024 09:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733504.1139802; Fri, 31 May 2024 09:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyLF-0008Fa-Tz; Fri, 31 May 2024 09:14:29 +0000
Received: by outflank-mailman (input) for mailman id 733504;
 Fri, 31 May 2024 09:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5xk=NC=oracle.com=john.g.garry@srs-se1.protection.inumbo.net>)
 id 1sCyLE-0008FU-SJ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:14:28 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf79836-1f2e-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 11:14:26 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44V93r1E027556; Fri, 31 May 2024 09:14:08 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8j8amy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 09:14:07 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 44V8xOFi010688; Fri, 31 May 2024 09:13:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yc511qa0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 09:13:52 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by CH0PR10MB7462.namprd10.prod.outlook.com (2603:10b6:610:188::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 09:13:50 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%5]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 09:13:50 +0000
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
X-Inumbo-ID: 2cf79836-1f2e-11ef-b4bb-af5377834399
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:content-type:date:from:in-reply?=
 =?UTF-8?Q?-to:message-id:mime-version:references:subject:to;_s=3Dcorp-202?=
 =?UTF-8?Q?3-11-20;_bh=3DcHHrRtBpQo6HarUUVxEbRkQ1sXtnA7t664mRopKjiWY=3D;_b?=
 =?UTF-8?Q?=3DUg4UTyMQnf8D4yn1+sak5TU0zscr1/FFBw+MCJoKKstxuU1TKc1R0/YNRYn6?=
 =?UTF-8?Q?483+quwo_ZMhCEmARYOYdrJxJbwr62nUuo3UVNQ68jWn7GKJ5EbqDdVeISo3Jg9?=
 =?UTF-8?Q?1M17teypia0Ygu_rbiR/r7s+rHwnqfaYcUW+s2QoVJd4yBI76zhfW0nyJvBzT33?=
 =?UTF-8?Q?9S09GB1A+7FpkWTbRsI3_tyAvXc9hTz8o4QVnxQtgXzQ5h5MOIKZ61KajO93Li/?=
 =?UTF-8?Q?kUHWPZnHpRjee7b/KtaNze01cd_OMhB06ROrTuQQcnId8/G8sQUC+8QvplLJtMk?=
 =?UTF-8?Q?HSdh2i2JDVd/HXxwGSo1/cJd/wIu4+Cb_+Q=3D=3D_?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgVZVOUWa3jO0pvA89TlU/2ZjbRkxB+g2bnaXF3d7/iyusPf3K06ieO7a7CbNpeTk3Hntx9W1gfFmwKXXg6LeNz9Hw+4OSTUzeuJE0SxhEE7PWGpJtT/D1n1ooqJ5vCMsEyorb1quGP0w1eX7Y5qrd+K0ez82kAXSb2QVmNVLBHLa0O+I6GHmlbhXQbz57z4v6k0+O90HOZ8X7lEyTiJg0vxhC7klHZDPgu1AjqZFmEcLTwx1MjVKrK6HkLjBGv8F5PkrWVRMqLoXJqwdSd9u4x+LybOUsPrXsqOdcttYXFhLMlBpnFDE/drD2cYtdDGPTGDGt4bsh3rPI5YzkbeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHHrRtBpQo6HarUUVxEbRkQ1sXtnA7t664mRopKjiWY=;
 b=SYI7jPGug0dM8HIM8Nsv5t2XcvB2xEGC4IVWQDJ3Rv9eYUFrpbZEwb+N/kHNKWKM/iX5zg1L7s98EeQR/Xb5PtslyA+EmBCYRu4cTeHykW3fuuPz82OnfoV01/IoAxZjHr2zNbAfVbF93bfRZAMX6doEE48/ak4XCtkxtp0opcojdVXRBknFX18iSa8frHKIpQuD9kds4TGhPWFwH5uaf3We+Ich8KzYfE7M7p8/TF2PZ1fLDXbS3d/q6zR6ViRJTO2h4tExHLniSC5Viz9oCiix3DvrdWq9KShBTg4dGgsa2TofkR3wouxrHgUEiMjGydrsrQp5ELtSOUq7aFFrOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHHrRtBpQo6HarUUVxEbRkQ1sXtnA7t664mRopKjiWY=;
 b=fy/WJg0YV8qYk5TyUZ8FYkjYje5ALZsvMeaHpD1W5cPIh6QVhv57e+f5r0+lDIWV3ChfxJry027spIB1eTUZ7KLBr4NyAXg3FWonhitRv+lYFFJ9AotGPvZ3sYDRAX2ve6liiMEZJTXNW4owQL/FocBA2TEEGfqALlzPlMIh58I=
Message-ID: <6f608f8b-2eb8-4ad4-8e8e-d210b9ffd712@oracle.com>
Date: Fri, 31 May 2024 10:13:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] block: add special APIs for run-time disabling of
 discard and friends
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-13-hch@lst.de>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240529050507.1392041-13-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0442.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::15) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|CH0PR10MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: c335975d-60ea-4776-ccf8-08dc8151fc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d1dobHJDZzZiWlNRdHA5SlNZS1paN09EV3p5S3lJMmQ3OTk0Nmh3Q3oxdCt3?=
 =?utf-8?B?SzJGMVZQR0VQTnRIY2x4NWlJS0FCNythd2JxRXdHVXRVWlJPc3hRQ0pWRTBn?=
 =?utf-8?B?VXludFkrMnVHdUV1KzFDbVp3ODBiQTI2eHNqaGFDL1JFN0xlazFkVkZvRFNI?=
 =?utf-8?B?WHpOWUNnT3RsMEcvazcwci90M0lVMHgxaUN5VWRaZStlcWd3QmJ4by9IakZm?=
 =?utf-8?B?RU1lUXd2UHpjbUJwbGxDM0hIeVBQV0VsMWVBeVZzRFFrV2E3OS9CVjgzVGtz?=
 =?utf-8?B?dHNLREdLVlVubDZCMkV5ZGJrYktZZTRadWhvbjcyR2F6ekRzdGdmRGFaNG04?=
 =?utf-8?B?aHJYUTRIalZCWGU0RFdDZnF1YVRoMEJ6ckRNQnZ5My9wcTc2V05INnBmZE02?=
 =?utf-8?B?dFpZVlljT05jbWhsVnJqS3dLUmxoT2dqMXJmbnZIeG9wc1FNVW9hYUM3Y3A3?=
 =?utf-8?B?cHB5MzEyN28vYkdkZzRvemN4VFY0eDJzaS9wZS8weE8rUm9FeFNPZW9LaFlS?=
 =?utf-8?B?S0x1Y0xHcVdaeDMzVWJIMEoxSkxUQzlMMVBxTytRbDBmOExub0JwMWJRblZ0?=
 =?utf-8?B?elM4Um81b3hwT0lETXlwaHB6akJoL1ZqbzZuTjFIcEtRT2RScEpkM2Z4OFBR?=
 =?utf-8?B?R3pMZVFlR1AyVzE1dU9CekF5S0VZOHp0dEU1RGg1TSsvNTlpaWlxWDkxMm1u?=
 =?utf-8?B?aW5VWjhVb2dzdXkrdTRIT1dEM1FmdTlaQk1jRjAxamJvQUZPMTh1akN2aEwr?=
 =?utf-8?B?VVVjMFFkNkRIZlZrbXQwU0NUZm03V2FhRlZCQ2poeTBnTFFvVHFva05kNllh?=
 =?utf-8?B?YUtYVmwxS25zREFSaW1xSERnaENpajU5bzRPWjBQblNORzJVamd2VWl1bHRr?=
 =?utf-8?B?eHNQZWZKK1pVL1l1NFAwTTFRMDQ3bit4MVVVV1pPVlhhYTBQS29IWVltUUV1?=
 =?utf-8?B?K2Qzd2l5aUIzKzVacktPOFpHSVBhNXFhNUJsRk9vZHVNZ3ZOTm9JaUlFYlMy?=
 =?utf-8?B?VENPVmxETjdlVzdoMEhGdTJOYVhJNzE1MERrN3d0T0xWUksydGEweU5SK3FM?=
 =?utf-8?B?SjIyZG5vZElnUldnUTRCd256M09lRkI5a1lLejBtREp6V2tYVko3SERyK1NT?=
 =?utf-8?B?RGE2bGMyS28rRWw0V1ZTVEVqTEo0QVV1QmhPUE0xaU54eDIvempSNUo4UVAz?=
 =?utf-8?B?Z3NFSjhVZDFjZ3o2THV5Q2VDQk9Hd09odnRwYTErT1FkN0ZJaURlZDEvVCtY?=
 =?utf-8?B?NUNmQ0Vsb3A5TUhVQzlyM0VjU3JEeC80M3I1STYxcW1IOGFtcy9USXBEWHpI?=
 =?utf-8?B?ekY5aUQvN211VW1UYUxVek52dWthc0NlQWRnem9Ha3UyZEh6b0pDLysyb1dH?=
 =?utf-8?B?WVJLZDNGV2FOZDR6ZUNTN3oxTlQ4YjE5Y0RUSHFhTGY5YVNVUVdHMUQwRlNV?=
 =?utf-8?B?OExoZDV3K2YxNW1ESDk0UTAySzVyaEhSNzdWWURnc3R5Zno4SUlJZlMxRllm?=
 =?utf-8?B?dDl6ZVR6enlhT2s2U1J4YjM0ZFVWdkZCZlcwS3VCOFR4QUV1ckV1cXdQMnJQ?=
 =?utf-8?B?ZlNYelBYUDdLK0NjYVpPelI1R1FRdGRXRGRKajZxM2k5ZUpnNXdUalZKd1Y2?=
 =?utf-8?B?aGdXNDBEeXZZdnBQTDVLR2VsME9rdndBdVRMZnc2MDhqV2V5Yk9TcXVXNzFO?=
 =?utf-8?B?U0NtUkV6R3FjVXA2VDhBbERNTlpRWXEzQjk0QjNmUWtlVFZtdjhsSmhBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEYyR0xzb2ZNN3lhN3lTU3lWU2o4bU1PMm1NQW1ZS3dzZS9nMVpvNEJFLzkw?=
 =?utf-8?B?eTUyVnBpRXRJeHdDR1dNeEg0ci8zV3JiQm1odzlYeWQyZGNqZEtCQW9kb1N2?=
 =?utf-8?B?U1RsNUZxSUJPSVhtTDRpSy9nNnUvU1pPQVBGN2VrSEJUNUVKWlZ4cDhYUmhw?=
 =?utf-8?B?V0UwbFB2dWN2SXh4NjBIQnhMeHRFYnk3aUNMMW9zK0ViYXFZNDlYV3Rhc2hR?=
 =?utf-8?B?NmpucHlrWm5pZFFwNjdpWDlETS9XY0pxYVU1ZGZmR1YrbUFUY21aNzcvR280?=
 =?utf-8?B?R1hmWHRXelo4dWJtb2x2Um10ZWFPTmRWdWdRdm8xWXU5V0tCM2d4V0czd2Yx?=
 =?utf-8?B?cTFtaW90VFNUK0tkT3E0MlFXbkhGMTAvZEVsZnFoM1V6c0pqejNCdVhlc0Fu?=
 =?utf-8?B?clZjcC81TzZVN1VhU21CdkV0TWdFNlFiczJqYkF6bFMzMldBL01nRWRHRzN6?=
 =?utf-8?B?Wjc1TjhGaWZBajJXSHhVMEUvbDFvN2pGazZ0Y0c1U21lU1JhSWxZbEsyRUQ0?=
 =?utf-8?B?ajFGTFNQaDhTNXhiRWtrcmtsTHM0VVUySHdwVnZXZ3h2Q3BtVHVDNjI0T2Z5?=
 =?utf-8?B?YzdXTWhSUys4eVJLWVBIMUdRclBOSm1kd3B6TjJXV3EwRXdOK1psOUtzM1p1?=
 =?utf-8?B?Y29aOWs0d0RHZ3VjaGhXWFFuVTkwSG1hQUxVeThrdjV1R3N2SVBwVXJaalps?=
 =?utf-8?B?T1hFbUJNeXRja2Y4TGpzL3ZEMCtuVEhFUnlySXU1ZktNa2xLM1BDTGcrWWNp?=
 =?utf-8?B?QVVYb3lrWG1xcklwYlNFRkpLaGVhd0p4UG1lZmZGQjBHN3hpcmFLNDgwMVlw?=
 =?utf-8?B?WXdXdnpPZzdpdTYyV2E3eWZGaVZwSWVsOFh1TFFkS1hDa3V3VVkvUnM3cnBC?=
 =?utf-8?B?SjdOM2FRY2VNY3VUejdrTFpoWXRTRG54S3dRY3FSVUlBUzR2UE0remttZE9k?=
 =?utf-8?B?YzFzbFNmbCtObEhOTkFBSm5lcnRtQ2kwNStvR1BkMkFCVFBLcnNUT0VaN2Ey?=
 =?utf-8?B?ZEx4Z1RjVWN0QVBYWWRaSUFvUkJ1ZTVGc2s2aDBMVCtlNndRSHRFZ3J1Y1Ba?=
 =?utf-8?B?YTVLK0lqT01lSU9nZEhJaEVER0dKMUtlYWlqdWpDcThubGJoWDBvRllYVGVk?=
 =?utf-8?B?c2piaG9abDkwakUxTnJJa3d4UDhYcSt4UE5sTWtGTU5CZzRRbFQxb2V2bklw?=
 =?utf-8?B?WHpvRHV2aGF2MmJvNGhSNmdkUWtYTE4vR2MxdXF0UFM5MXlsNTdKSXFzekNX?=
 =?utf-8?B?aTBtd2ViMVJlWVZDNy9ET1FTakQvTkVyM3BaS2NsMnY2VHJpdmJLdkFIQVky?=
 =?utf-8?B?Q01XNGhpd09aWE00NldpM1NKRlpkdG1qcFRVcVFHSXpZTWtDNENvVWFkOU80?=
 =?utf-8?B?bXc1eXZOVzkvamFUU2xBclFucDZqUmVCc09sblNpZXJrbDd3ekI4d0szOVFj?=
 =?utf-8?B?SEgyRmlRN0U1WXZEdXpOTk5RaXJsWk9BcGsxdzA5Vnh0eVhQWUFwTWg3aWFY?=
 =?utf-8?B?QUp6eEoyUHJYZE5YRTdESnd6L082K3orMVBuc1JWZ21TQWd5RkN4UTBUdnF4?=
 =?utf-8?B?UGZxY3FuTjVBdEQ1TTBPTzZpcUU0ZlJ1N1Q0dkJaY2NBMFR6TlhlRUVST2lP?=
 =?utf-8?B?MmF2K29QZUp1U1hZOG9USzhxaTlnbWMvRFQydHZkWlp6MmgrMEI2dkErUUQ1?=
 =?utf-8?B?d0lRSFVpYkozY1gxWEhYSGRFY3ZTbUJ3TWRsSEVSNkxVd1FVZ1RDY016RGc3?=
 =?utf-8?B?SGRxaHVoeWx2QmRtQ2RJMVh4TXkwMjZzREcrWVhCNmVJb2ZSZ2lKOUlTTzJU?=
 =?utf-8?B?cnF5NEs2TUsvSm9JKzNCTG9CU1FYYTd5bjFpNmRDS2R0SEoyZjljV1FPT1g0?=
 =?utf-8?B?cytkeWtPNGN3MUNPaTEzaHpDVll4SWc4a2RlYlJwMEtiVkU4Z0E0UFVpZklK?=
 =?utf-8?B?cjNkeElpdEI2L0dsTHdCVXR3VEVEWXFNTkYzRXQxK3IxSnpZSzFJTW1PdXly?=
 =?utf-8?B?VENEenprNmRLVFhsNmFZZ1ZVakhUdlYzeFhhZllDVC9pZXozb2JHT3dsRmhF?=
 =?utf-8?B?YXcrU2F6d2dEUVVOdTJET3d6dFBiLzEyc1J0UzdGb09Ha0Z0YWM0WHEzaGZq?=
 =?utf-8?B?K1FmS0lPbUJqMlFYUGtGY04ybnZiYzg5UTkrSkczUHNvVUxjMDNyamxlUVVl?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4kHKVAtjuMQDK+/qAH+z0zm2kfSe83x1rjw3ZVWCKciRgMUdhu9TLPKS8PgYHjmuJvg0eA4VYvi9kxj7uwJl4bGhlSebXLCx6J69M0Z5VNmGoGnlHzd9KI0rIkyFhUPwelJBc24OdFNZQQNmGDzLMmt4gZBaZLRZ1tLSQXZeEuAQu/5bxw/9UmRSyrrP3OxvoGhVGP9B8TXFmnW/hARnk9yzaoMsAmJqACeKOpIf9M+eP/eYI7hZAXLkJs93vRzgNemuKFxvxeXdXKsRXpDEY8GzmxY/dJecczt0aukd9MmXq2OfPOGrMlJrZt8n0c5654dhSAoNzWIr0j6LqZVzEV8nWZ4YmLcqjw3sgfbsVNGnSsVAL1w1v+RGQF9pWZOKPLtIt2JntkENLFABjUNNXb8i/sfSXipU9dBfqpTtofrhMrXJdUZnJUBuhv9s2zZuZxstSEppCP+s4VVzmmEt3nOLM617QTDy/PwKU5BQlQzFTY8m2X76yxc/OtrTXsKzO5dUxI59BLhi00NX0KdMVr5op4JghpUzgvCHU0bsmisZYEq8g3BApJHXfTPpBKEZrL1QWQR0t+0j8/DGOhJtpHqAq1TB1G4DYv8wQW72Gzc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c335975d-60ea-4776-ccf8-08dc8151fc4a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:13:50.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44FhA22J2PAWJbljg8/bBf/DYqpIHIdMyy22MJhlFMcozT8qGnBB5qHSu74ZtCCQg97bro3vQtcM3ya6oZNH6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7462
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405310068
X-Proofpoint-ORIG-GUID: 0rcWkHplyRDCatLlB3VGhVObKVFEMQWm
X-Proofpoint-GUID: 0rcWkHplyRDCatLlB3VGhVObKVFEMQWm

On 29/05/2024 06:04, Christoph Hellwig wrote:
> A few drivers optimistically try to support discard, write zeroes and
> secure erase and disable the features from the I/O completion handler
> if the hardware can't support them.  This disable can't be done using
> the atomic queue limits API because the I/O completion handlers can't
> take sleeping locks or freezer the queue.  Keep the existing clearing
> of the relevant field to zero, but replace the old blk_queue_max_*
> APIs with new disable APIs that force the value to 0.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>

It would be nice to improve this eventually (to use the atomic queue 
limits API). Anyway:
Reviewed-by: John Garry <john.g.garry@oracle.com>

