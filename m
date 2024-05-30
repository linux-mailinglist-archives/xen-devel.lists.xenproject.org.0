Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806508D4848
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 11:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732580.1138569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCbxW-000274-Pe; Thu, 30 May 2024 09:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732580.1138569; Thu, 30 May 2024 09:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCbxW-000257-Ln; Thu, 30 May 2024 09:20:30 +0000
Received: by outflank-mailman (input) for mailman id 732580;
 Thu, 30 May 2024 09:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zMW=NB=oracle.com=john.g.garry@srs-se1.protection.inumbo.net>)
 id 1sCbuC-00013j-Ff
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 09:17:04 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f8e7cae-1e65-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 11:17:02 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44U7n5hV002784; Thu, 30 May 2024 09:16:43 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8fcghay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2024 09:16:43 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 44U7Jqpe006215; Thu, 30 May 2024 09:16:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3yd7c6pax4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2024 09:16:42 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH0PR10MB5706.namprd10.prod.outlook.com (2603:10b6:510:148::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 30 May
 2024 09:16:39 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%5]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 09:16:39 +0000
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
X-Inumbo-ID: 5f8e7cae-1e65-11ef-90a1-e314d9c70b13
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:content-type:date:from:in-reply?=
 =?UTF-8?Q?-to:message-id:mime-version:references:subject:to;_s=3Dcorp-202?=
 =?UTF-8?Q?3-11-20;_bh=3DBdPYxC5USHVULUTy7ZfZqhM+RCgM6BcNA8YOCr9E+nE=3D;_b?=
 =?UTF-8?Q?=3DiEXCWqw7ljieCh6HQcv6moF6g6zlOtYTs6l/bQyZBV7mrEjbMzJiceT6F0TR?=
 =?UTF-8?Q?mJYApcHD_rrmIiuOIR//EoyWR5w5CSCCTXNENc+IUNFx3eivp4gh377HOwdhGXi?=
 =?UTF-8?Q?LP5i7sN6kjGLHM_LDBfpz+1caJFy25YoJCcGZ/fD/OU2M+YZLB4kMTCD69tUswW?=
 =?UTF-8?Q?3N8vMnLx5eV8OkcTv0Xc_vNISwufG4aQ5sr3GKcT/Xq7FCrvNjhtKsIEv90+n7P?=
 =?UTF-8?Q?+gACPMVFAPtt9crp60YwPRs3dr_smafucRx/zlmlFgn9uu1Q+J/CM2vjEQXkAQ3?=
 =?UTF-8?Q?uxyo1jJ1rqG7DC7kE0Kqc8IyI4bl7JCo_Mw=3D=3D_?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZW4sdwt7nQbdjT0+fvotSJ75hJ6npAhUXI5NdHvh5g2RfO7Hwze0n6s4G7cAHt5sM7X2WtDBBIjEVtGgby77A+ClUiEEERrhNwsldrqxryazhuHk5ou7HAB5cNLPT9RuywPSPtBJxKEfr2b19fM2xMP911XbMN9HPtFlE8saewhwqJtkhvVSbPAg8DCxN3hXyf84ug3gHb0sz+fEuR3KELd3qgrluqMkrcjbpCSvNpTKIvZAl8hJYsIULC7JIvXVKG9eEzs9OUInDVTmSWxH9lvDF7uTRgPeBdEI4Vx+xN3+sihlxpPD1k/ioz6RTGWx7AGkO/97mo0nYRPoKptH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdPYxC5USHVULUTy7ZfZqhM+RCgM6BcNA8YOCr9E+nE=;
 b=MxU1uyBe/4XWuZlHRz6ZGJ//6QpvoPjDgaSd3O0hpy4VHW1FKCqSfE04+mAGBtdbxoYWqCUHOyGsTS2P/9xlDtT8XnZ+LhvY0R5Vd95y2NAnjwGhp4xgVLBXB3sbAsBonL5WRbbXn0DjH9NSfjgUnnTwIEhEs4cvGQRqyUtu4dJ2HGLMSYWC/iPr63WwiOmOhrxrCtgmsx5x64f+6e9/9zVXTFWxMNhGyg93UvvaLsue55s/d2FjpgKWvjnh8wJy3jrDClGkKIJyV57+rifk4KX+Pm9/9bI/KQtbCB2kUqIIUt3SuMxwaxr8QlFdg57WNNJiDjxXgGEZyxMIXlNwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdPYxC5USHVULUTy7ZfZqhM+RCgM6BcNA8YOCr9E+nE=;
 b=G/7QTVDgO+k85ObUI8TepKa4ed7WFzUGZgaPA/T1NlpuXHcU5g6u/DK/lJFVobL9IyH3DZgHV7oNkueIPT1RrT/AuDv25KcA5Mk5siotZ7nswU82hU2RiKjTMiHDBmwJmkT3sO/vg+heGPGmcBgVVb9ScoszC+PtHlQMwESHSG8=
Message-ID: <1a1854bb-1f28-44d1-a4ac-30872bd6c3c8@oracle.com>
Date: Thu, 30 May 2024 10:16:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] sd: convert to the atomic queue limits API
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
 <20240529050507.1392041-10-hch@lst.de>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240529050507.1392041-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0024.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::29) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH0PR10MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 58489bb1-ca80-451c-ae61-08dc80893636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zk0xKzhCaGd6TXRoNUJzU21JbVY5VEkrRVA4TndzUW1Ycm5kUnRnWmozM3Fs?=
 =?utf-8?B?UGpOYTVxdXYrdlI3bHlUSTY3c3Q3SHBVODBFRWYra25zaDdXbEJUUnV6ME5w?=
 =?utf-8?B?OWFldVYvMHhRdVkvNmFQcHRnSjFlWDdLT0szV1RDanpKQWxPMURhbmJUSjlo?=
 =?utf-8?B?NEMrMzZzWHlKeE9SRTNESGN4YmE0ekIxWHlIZHZvdWdaaVpIZXRFRFREQktw?=
 =?utf-8?B?R2RocTEvczQ4ZUhJZ3p0RmZDaEpzWGkxREtBejJVWjlyN05yc1Rtak5YUWpF?=
 =?utf-8?B?dk54SVlSaURrQ3lFZmtEV3NZWjVRNG5KamtqRzFHNFlVdTBmZDFHRFFWbjBi?=
 =?utf-8?B?Mmh2bmtTYnZHTnpEOVRTcVRzSUJvQmpLQUNsV0xaK2o5aklIdzUvZ3ZGVXlT?=
 =?utf-8?B?SGxHdk1hbmNxdklPQnp2VVovYUhWRE0xK1lHaGhhbGo1cVlrLzg4VDZyMDVu?=
 =?utf-8?B?U1JjZVlrYW5QK2tKZnRPV25VQlhTZFE0am5hbnlXbWoxdlE4cWpuU2ZjUGR2?=
 =?utf-8?B?MmlYMmN0UlRpYVF4VDRNTVBTMlVzVURhcytXSmtXRnU0T1J5Q1VXK2FwSTNK?=
 =?utf-8?B?QzRwemsxbGxTeWNhZ3Z0bUZ1V250YXN5NEU2VjZxbXFqZGVGRUgzYVIyNVN0?=
 =?utf-8?B?TW82K05MM3hYQUlQQ2xNMUlUWmpDNTRtWVRTZlI3ZGJ0RGJvYS9wOFdHTjh4?=
 =?utf-8?B?c1ZXUkkxdnluYk1yUjJPbmoxRkxNM3MvaElUSjNDTm5pTFMzWWNMVWhxSkQ3?=
 =?utf-8?B?Umlwb01mMU16a3VRQWxMRHlpNk9jcGxWMDVuTCthQkVSQ3FEdW4vcVJLY3lB?=
 =?utf-8?B?RS9Ddk9FZTV5MHpMdy8vRTRSaXp4T0JHaU1pNjRObVFzaU1GenFwWWhGRGNO?=
 =?utf-8?B?WmtMbmw1UXFoMVd6dXlyM0dJbjM0cVFRaXVjdmRCbG1DSHZNL2JYZXZsTi9l?=
 =?utf-8?B?VzMrSzVETUFFUGpFZitUWVJOSlNDMXJFQlEzQTdNYjlXZUwrZjN2SDh0cENM?=
 =?utf-8?B?cVpvcFRuTEhVQ0pCUWs4NGpnN1ZiN3I4Zkw4K0NvSi9yWnlIT0Y4RktLTDVl?=
 =?utf-8?B?cUFpeklwdDdXM29WaGx1VXNjak9KVkF2eDFpRTNsenVaMWZIL3ZKSW94OTc2?=
 =?utf-8?B?TUcxRU1HNWV2QWx3Y1FrWTVYWDJSWDVSMi8rVGhtSi96OGdhTTRja2N6TW1y?=
 =?utf-8?B?cHd5U3Z0TFZHUDM2K2dIZG9rN3JqK2xWY0RFVVVqVWpTZTRvbnM2KytZNnNF?=
 =?utf-8?B?UmFiQUdCaUw1UFYrSnRzWSt5dEJycW1sUjI3N0hXVEdGcDlBVHVhZWZTa2pK?=
 =?utf-8?B?UHJYbXhJOTdzaGFzSEd0VktpTXIzaSt2Y2RtR3NHbUdaRUI5RXRnWkRGOVRP?=
 =?utf-8?B?WXpXbndBTGp1aCtBRlc2dFloNFFMVFRQbEZwb3RIMnZXalVDYnBWdVBjOENa?=
 =?utf-8?B?eW5qa0xKVjllZXVjNHdoanhOYk5CZ1hrdFJGNFNxOURoTnlhdkxYYUZuRWxN?=
 =?utf-8?B?aGU3YzVLMEhFajByTXlQWTYxYUZFSERETmdIbTNIYjdMTnR2a0V3Y1J0QXJL?=
 =?utf-8?B?elRTNG1nbVJkQTRMOG4vbHl5TjBqaDNKMGFzclRITXVsUndVbU1uMTYwTXpN?=
 =?utf-8?B?aTI2VFRhbmpmQnYxVU9ieXcwNnAraStPTjBaaVpTRFpSM0hUenl6anZLdU45?=
 =?utf-8?B?dktJcEszckovaVRpSnVPSnFtYXFkTXBmZXNkSzkxNkJXeEY2MFVJN3JBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amJLcStFaDB3aGZZZndOMzkyRGQvc3BFeUNZNUtkN25iNVoxUnJlWkZzam81?=
 =?utf-8?B?VXcyU3dXYU5sRjl0Ylh3TlBqWXo5VnFCR3B4UEtvNDRIeER3WmNPRXRScmRx?=
 =?utf-8?B?REZKY3hIRDhjaStkRExVd3I2eGRmYTk2Smd0NnBMcGh6d1dtTEhxVHIwa0dY?=
 =?utf-8?B?UEZ6OHhnMm9MN2NLQ0svUjE4TTN6ZHF6dHBwRUd1cVdQRHp5RXNXbWlaeTdC?=
 =?utf-8?B?V2ZsNFNzY2x5RzkxNEhuZExaZkhJMTh3SkdwdG43TFdUWkI5SWVSTmN5d1ZI?=
 =?utf-8?B?NndIS0Z6VUpaMVAzMjE5NzVWSE5Ib05FaVBsZTA0SVVqVDlGc3hMNVBUajJL?=
 =?utf-8?B?SDROVTlRV2ZwaUxWNWQ4Q1hrOGtCOXNjckovNmZreUxiRVlJRWR2QnJmVGJL?=
 =?utf-8?B?UWtzV1hadmd1ckc0ZGQ5eU1uRGVWb0kzK25HcGp5eitYN1NGTWZCdURWTUNW?=
 =?utf-8?B?NkdvMS8xVWpBL3FDZWdNWktLQW9xR2R6RW5PK1NidTI2Q2JsUGFFVjVHOWFM?=
 =?utf-8?B?NGd5SXBxekZ1cEZCNVRjSEkyQ3U5Tlp0M0ZkQUJWRGxvWXgvSGZOM3RPMTlz?=
 =?utf-8?B?U0VMb1hOanF4NzlqTC9ibjI2ZXFKZGFsZTJDb3dQL3UxZ3BOSVhoamlEcFhi?=
 =?utf-8?B?WS80SkZWZ2o2SHdVSEx3ZWcrUWpHUm1JM0dkTVdnZGxqRjVDRS9MTUxlSjdR?=
 =?utf-8?B?SUkvcVQzSmx3ZFVoSDVia1crYXdQMk9IWlFmbDFMRG5GMkhzTTNaRnpwbGp3?=
 =?utf-8?B?WUx0bURzeHBhTU1mTzlkbDExcEZ3dm1VRDVDb0xTZ0pSZWxSNjIwVzJxKzJt?=
 =?utf-8?B?MHZhL1ZPaEpydXhKaDAxUi9PeEFZZXF5TjJKekx1Y2hCb0FnMklFaUxVWmF6?=
 =?utf-8?B?K3NiVmZxZ0VpUjlUZjA1d3RFcXlYaFk1VEMxd3gxdTlHTExqR1hJc0dFajRq?=
 =?utf-8?B?TzMzbG5UMWFoMnJaMVkrQm01cDZ0L1M4a2wyMlp5WXlMWWhYVjVvN2UrNnRY?=
 =?utf-8?B?bCtjcDNCVG0wTkRqM0l2bGxPVFp3WDlUdHdmcmJxUTd1TE5RRm41dU9BaTFY?=
 =?utf-8?B?aWgwTnFyeFMvcUJ6Kzc5OVZDY1FXMkZKOTF2TWdhT3djMUtudVNETzQxeDd2?=
 =?utf-8?B?c0s5TkE3bFhVd2NEWVBxMk1Pd3J4MThKTmhLWllZRnYvUDBxMzlCZHdpa2FJ?=
 =?utf-8?B?MUxJVHdEUGE4SSt0Z2U5cmhyVHRGenp3RHk5bUNEYnBpazlnbVJWKzJGRUQ2?=
 =?utf-8?B?ZUNmVnJtaExlZTFONGFyZDgvUkxMZENzNzhLOStYSzZ2TGRyanpjUFB5enlj?=
 =?utf-8?B?anN6ekFNM2wrM2RzS3lRdkwvRFM4UHB6NXVzeWVRQ3JWTW93ejNMS01YZ3JH?=
 =?utf-8?B?Y0haMWh3a3ZaZ0ljaTBLOGFQNFVlQ1NhMHJXVUlHT1FRNGpKQjFWSDBtQkFt?=
 =?utf-8?B?OHRXQldRaTZaTnpFY0h4TmFqQlRVUjA4aFRVUWxCN29zOCtlajZ3YVR2aTB0?=
 =?utf-8?B?MTJyeTNqR3g5YjkwMTRrcHRzeGhqZDBLN1lKNjZpd29FNjZKd1ZWSE5TZEhO?=
 =?utf-8?B?VzlUQUlKajRSU1N4czhWdWdxK1llU2RoNS9KT0VFa3RLWkFFRENRSjAzU1Vo?=
 =?utf-8?B?Y01zOFFMODJPaEQ4bTkrbkdzd2ZjRGEvTVBYZlN3RXdWN1V1U25MWG1sN0NM?=
 =?utf-8?B?bmtQYm40c3JmZVowL0xnYmg2VWd3VEcxTzMyQzREWE9kRm5kT2plczExS1Fm?=
 =?utf-8?B?RDVrbzkzcG1odGZSZWE0TlZsSzU4bGZpM3FDQXBFYlVibitaRVEwMDlqd0xZ?=
 =?utf-8?B?RWpETGp2L1VQRVlHQ0RJT0NxTWltZWxwU1hhSlNmbFBSZTFCNUppb2hFMTJn?=
 =?utf-8?B?Y0tPVVpRL0w1U21EU2FIQVhkVEphdGdjOGJYcEdFc1RjVnZ2S1FnT1ZFamdR?=
 =?utf-8?B?eWdBbmhyYTcxK09QSFk1T3BCUWVsTDhUSVVMSzIyTlVmRXV0T1UrQTJSRW5P?=
 =?utf-8?B?bTJrZnluNm1vNTkyaW5aS1psTFV4QWN2RnZuNHE3Z0RFK1MwalV4RXVaeWt3?=
 =?utf-8?B?U1RvMWxYYjh0QW9QR3B4c0dsVmVPRFlJR3pITFhCWFJTaFNEcWgvK1lNbFdx?=
 =?utf-8?B?b3R2a0l6YktNWmRMcU9jYndBWFUvWHNzenk0TEVOUEs3QWlMcFU2RnZtaGVD?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UKTJAUO3q0sghuFUKdNK7rSr3+26ZMaipkdPiZvhJNc6wEVZhwno+clU5y4O/Pp2HdYW9iY9QMLMMu16TGOXKV3oMqO6rCXomRyHdIh/WZfnTafxZz4bl4UmIM1aGNnza2BXXAKWMZhOy89w23kxxkLdAvcbSne+mnYN+gYyu7tBvhFK8HSJ0LyLN22ccrn8smNq6J3SS6TQxzSGOnTYS6o7//CFbHNaxMIx5yrdTbVTyM7juYmbzAKLezaOGOmFtu14XqszW5g5ilg3xVRAKAtNPlQ1UVvjqyIbahZr71mY+wKwbf0jJSiIyb3sQPinnCkfuOvXDXSGFWGk7WdKk6Kg2elkAL0MtyuzKyp8WFRxFURwuezmn8qYPRAVucqDnqEPXAVEdNx1UOd3F7bpYuRtRa2xDXL7LN8lY4qFNaaFTk2rnxKAhk7pgfiAPoaQtLchXox5YiNwAymXCHJi9qo4iFJIjwEDrTiPRcLepaAWdUPt4qYGcDZXXMW8XftWdeFHEbUV7EDIED/sBj8hfOAGscwNl2qU6E7IYjlsm9EBer516R1/bQotVqeWKIlKz5QLaotXqC9hIEHT5GXx1HmqlLAFlMZe5/AytMHkTeg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58489bb1-ca80-451c-ae61-08dc80893636
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 09:16:39.0204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5GSa65PHgdF5oTKzy44z/QFhMi5Un1nMJTu2pndw9ivSAwVhBMG/01UeobuMRTKqOVi2hMHLSMrwmVHN7oHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5706
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405300069
X-Proofpoint-GUID: j10R_a81KfEQxABw76oXQWImEvLQnw5t
X-Proofpoint-ORIG-GUID: j10R_a81KfEQxABw76oXQWImEvLQnw5t

On 29/05/2024 06:04, Christoph Hellwig wrote:
> Assign all queue limits through a local queue_limits variable and
> queue_limits_commit_update so that we can't race updating them from
> multiple places, and free the queue when updating them so that
> in-progress I/O submissions don't see half-updated limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/scsi/sd.c     | 126 ++++++++++++++++++++++++------------------
>   drivers/scsi/sd.h     |   6 +-
>   drivers/scsi/sd_zbc.c |  15 ++---
>   3 files changed, 84 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index 2d08b69154b995..03e67936b27928 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -101,12 +101,13 @@ MODULE_ALIAS_SCSI_DEVICE(TYPE_ZBC);
>   
>   #define SD_MINORS	16
>   
> -static void sd_config_discard(struct scsi_disk *, unsigned int);
> -static void sd_config_write_same(struct scsi_disk *);
> +static void sd_config_discard(struct scsi_disk *sdkp, struct queue_limits *lim,
> +		unsigned int mode);

Are there any reasons why we keep forward declarations like this? 
AFAICS, this sd_config_discard forward declaration could be removed.

> +static void sd_config_write_same(struct scsi_disk *sdkp,
> +		struct queue_limits *lim);
>   static int  sd_revalidate_disk(struct gendisk *);
>   static void sd_unlock_native_capacity(struct gendisk *disk);
>   static void sd_shutdown(struct device *);
> -static void sd_read_capacity(struct scsi_disk *sdkp, unsigned char *buffer);
>   static void scsi_disk_release(struct device *cdev);
>   
>   static DEFINE_IDA(sd_index_ida);
> @@ -456,7 +457,8 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
>   {
>   	struct scsi_disk *sdkp = to_scsi_disk(dev);
>   	struct scsi_device *sdp = sdkp->device;
> -	int mode;
> +	struct queue_limits lim;
> +	int mode, err;
>   
>   	if (!capable(CAP_SYS_ADMIN))
>   		return -EACCES;
> @@ -472,8 +474,13 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
>   	if (mode < 0)
>   		return -EINVAL;
>   
> -	sd_config_discard(sdkp, mode);
> -
> +	lim = queue_limits_start_update(sdkp->disk->queue);
> +	sd_config_discard(sdkp, &lim, mode);
> +	blk_mq_freeze_queue(sdkp->disk->queue);
> +	err = queue_limits_commit_update(sdkp->disk->queue, &lim);
> +	blk_mq_unfreeze_queue(sdkp->disk->queue);
> +	if (err)
> +		return err;
>   	return count;
>   }
>   static DEVICE_ATTR_RW(provisioning_mode);
> @@ -556,6 +563,7 @@ max_write_same_blocks_store(struct device *dev, struct device_attribute *attr,
>   {
>   	struct scsi_disk *sdkp = to_scsi_disk(dev);
>   	struct scsi_device *sdp = sdkp->device;
> +	struct queue_limits lim;
>   	unsigned long max;
>   	int err;
>   
> @@ -577,8 +585,13 @@ max_write_same_blocks_store(struct device *dev, struct device_attribute *attr,
>   		sdkp->max_ws_blocks = max;
>   	}
>   
> -	sd_config_write_same(sdkp);
> -
> +	lim = queue_limits_start_update(sdkp->disk->queue);
> +	sd_config_write_same(sdkp, &lim);
> +	blk_mq_freeze_queue(sdkp->disk->queue);
> +	err = queue_limits_commit_update(sdkp->disk->queue, &lim);
> +	blk_mq_unfreeze_queue(sdkp->disk->queue);
> +	if (err)
> +		return err;
>   	return count;
>   }
>   static DEVICE_ATTR_RW(max_write_same_blocks);
> @@ -827,17 +840,15 @@ static void sd_disable_discard(struct scsi_disk *sdkp)
>   	blk_queue_max_discard_sectors(sdkp->disk->queue, 0);
>   }
>   
> -static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
> +static void sd_config_discard(struct scsi_disk *sdkp, struct queue_limits *lim,
> +		unsigned int mode)
>   {
> -	struct request_queue *q = sdkp->disk->queue;
>   	unsigned int logical_block_size = sdkp->device->sector_size;
>   	unsigned int max_blocks = 0;
>   
> -	q->limits.discard_alignment =
> -		sdkp->unmap_alignment * logical_block_size;
> -	q->limits.discard_granularity =
> -		max(sdkp->physical_block_size,
> -		    sdkp->unmap_granularity * logical_block_size);
> +	lim->discard_alignment = sdkp->unmap_alignment * logical_block_size;
> +	lim->discard_granularity = max(sdkp->physical_block_size,
> +			sdkp->unmap_granularity * logical_block_size);
>   	sdkp->provisioning_mode = mode;
>   
>   	switch (mode) {
> @@ -875,7 +886,8 @@ static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
>   		break;
>   	}
>   
> -	blk_queue_max_discard_sectors(q, max_blocks * (logical_block_size >> 9));
> +	lim->max_hw_discard_sectors = max_blocks *
> +		(logical_block_size >> SECTOR_SHIFT);
>   }
>   
>   static void *sd_set_special_bvec(struct request *rq, unsigned int data_len)
> @@ -1010,9 +1022,9 @@ static void sd_disable_write_same(struct scsi_disk *sdkp)
>   	blk_queue_max_write_zeroes_sectors(sdkp->disk->queue, 0);
>   }
>   
> -static void sd_config_write_same(struct scsi_disk *sdkp)
> +static void sd_config_write_same(struct scsi_disk *sdkp,
> +		struct queue_limits *lim)
>   {
> -	struct request_queue *q = sdkp->disk->queue;
>   	unsigned int logical_block_size = sdkp->device->sector_size;
>   
>   	if (sdkp->device->no_write_same) {
> @@ -1066,8 +1078,8 @@ static void sd_config_write_same(struct scsi_disk *sdkp)
>   	}
>   
>   out:
> -	blk_queue_max_write_zeroes_sectors(q, sdkp->max_ws_blocks *
> -					 (logical_block_size >> 9));
> +	lim->max_write_zeroes_sectors =
> +		sdkp->max_ws_blocks * (logical_block_size >> 9);

Would it be ok to use SECTOR_SHIFT here? A similar change is made in 
sd_config_discard(), above

>   }
>   
>   static blk_status_t sd_setup_flush_cmnd(struct scsi_cmnd *cmd)
> @@ -2523,7 +2535,7 @@ static void read_capacity_error(struct scsi_disk *sdkp, struct scsi_device *sdp,
>   #define READ_CAPACITY_RETRIES_ON_RESET	10
>   
>   static int read_capacity_16(struct scsi_disk *sdkp, struct scsi_device *sdp,
> -						unsigned char *buffer)
> +		struct queue_limits *lim, unsigned char *buffer)
>   {
>   	unsigned char cmd[16];
>   	struct scsi_sense_hdr sshdr;
> @@ -2597,7 +2609,7 @@ static int read_capacity_16(struct scsi_disk *sdkp, struct scsi_device *sdp,
>   
>   	/* Lowest aligned logical block */
>   	alignment = ((buffer[14] & 0x3f) << 8 | buffer[15]) * sector_size;
> -	blk_queue_alignment_offset(sdp->request_queue, alignment);
> +	lim->alignment_offset = alignment;
>   	if (alignment && sdkp->first_scan)
>   		sd_printk(KERN_NOTICE, sdkp,
>   			  "physical block alignment offset: %u\n", alignment);
> @@ -2608,7 +2620,7 @@ static int read_capacity_16(struct scsi_disk *sdkp, struct scsi_device *sdp,
>   		if (buffer[14] & 0x40) /* LBPRZ */
>   			sdkp->lbprz = 1;
>   
> -		sd_config_discard(sdkp, SD_LBP_WS16);
> +		sd_config_discard(sdkp, lim, SD_LBP_WS16);
>   	}
>   
>   	sdkp->capacity = lba + 1;
> @@ -2711,13 +2723,14 @@ static int sd_try_rc16_first(struct scsi_device *sdp)
>    * read disk capacity
>    */
>   static void
> -sd_read_capacity(struct scsi_disk *sdkp, unsigned char *buffer)
> +sd_read_capacity(struct scsi_disk *sdkp, struct queue_limits *lim,
> +		unsigned char *buffer)
>   {
>   	int sector_size;
>   	struct scsi_device *sdp = sdkp->device;
>   
>   	if (sd_try_rc16_first(sdp)) {
> -		sector_size = read_capacity_16(sdkp, sdp, buffer);
> +		sector_size = read_capacity_16(sdkp, sdp, lim, buffer);
>   		if (sector_size == -EOVERFLOW)
>   			goto got_data;
>   		if (sector_size == -ENODEV)
> @@ -2737,7 +2750,7 @@ sd_read_capacity(struct scsi_disk *sdkp, unsigned char *buffer)
>   			int old_sector_size = sector_size;
>   			sd_printk(KERN_NOTICE, sdkp, "Very big device. "
>   					"Trying to use READ CAPACITY(16).\n");
> -			sector_size = read_capacity_16(sdkp, sdp, buffer);
> +			sector_size = read_capacity_16(sdkp, sdp, lim, buffer);
>   			if (sector_size < 0) {
>   				sd_printk(KERN_NOTICE, sdkp,
>   					"Using 0xffffffff as device size\n");
> @@ -2796,9 +2809,8 @@ sd_read_capacity(struct scsi_disk *sdkp, unsigned char *buffer)
>   		 */
>   		sector_size = 512;
>   	}
> -	blk_queue_logical_block_size(sdp->request_queue, sector_size);
> -	blk_queue_physical_block_size(sdp->request_queue,
> -				      sdkp->physical_block_size);
> +	lim->logical_block_size = sector_size;
> +	lim->physical_block_size = sdkp->physical_block_size;
>   	sdkp->device->sector_size = sector_size;
>   
>   	if (sdkp->capacity > 0xffffffff)
> @@ -3220,11 +3232,11 @@ static unsigned int sd_discard_mode(struct scsi_disk *sdkp)
>   	return SD_LBP_DISABLE;
>   }
>   
> -/**
> - * sd_read_block_limits - Query disk device for preferred I/O sizes.
> - * @sdkp: disk to query
> +/*
> + * Query disk device for preferred I/O sizes.
>    */
> -static void sd_read_block_limits(struct scsi_disk *sdkp)
> +static void sd_read_block_limits(struct scsi_disk *sdkp,
> +		struct queue_limits *lim)
>   {
>   	struct scsi_vpd *vpd;
>   
> @@ -3258,7 +3270,7 @@ static void sd_read_block_limits(struct scsi_disk *sdkp)
>   			sdkp->unmap_alignment =
>   				get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
>   
> -		sd_config_discard(sdkp, sd_discard_mode(sdkp));
> +		sd_config_discard(sdkp, lim, sd_discard_mode(sdkp));
>   	}
>   
>    out:
> @@ -3278,10 +3290,10 @@ static void sd_read_block_limits_ext(struct scsi_disk *sdkp)
>   }
>   
>   /**

below is not a kernel doc comment

> - * sd_read_block_characteristics - Query block dev. characteristics
> - * @sdkp: disk to query
> + * Query block dev. characteristics
>    */
> -static void sd_read_block_characteristics(struct scsi_disk *sdkp)
> +static void sd_read_block_characteristics(struct scsi_disk *sdkp,
> +		struct queue_limits *lim)
>   {
>   	struct request_queue *q = sdkp->disk->queue;
>   	struct scsi_vpd *vpd;
> @@ -3307,29 +3319,26 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp)
>   
>   #ifdef CONFIG_BLK_DEV_ZONED /* sd_probe rejects ZBD devices early otherwise */
>   	if (sdkp->device->type == TYPE_ZBC) {
> -		/*
> -		 * Host-managed.
> -		 */
> -		disk_set_zoned(sdkp->disk);
> +		lim->zoned = true;
>   
>   		/*
>   		 * Per ZBC and ZAC specifications, writes in sequential write
>   		 * required zones of host-managed devices must be aligned to
>   		 * the device physical block size.
>   		 */
> -		blk_queue_zone_write_granularity(q, sdkp->physical_block_size);
> +		lim->zone_write_granularity = sdkp->physical_block_size;
>   	} else {
>   		/*
>   		 * Host-aware devices are treated as conventional.
>   		 */
> -		WARN_ON_ONCE(blk_queue_is_zoned(q));
> +		lim->zoned = false;
>   	}
>   #endif /* CONFIG_BLK_DEV_ZONED */
>   
>   	if (!sdkp->first_scan)
>   		return;
>   
> -	if (blk_queue_is_zoned(q))
> +	if (lim->zoned)
>   		sd_printk(KERN_NOTICE, sdkp, "Host-managed zoned block device\n");
>   	else if (sdkp->zoned == 1)
>   		sd_printk(KERN_NOTICE, sdkp, "Host-aware SMR disk used as regular disk\n");
> @@ -3605,8 +3614,10 @@ static int sd_revalidate_disk(struct gendisk *disk)
>   	struct scsi_device *sdp = sdkp->device;
>   	struct request_queue *q = sdkp->disk->queue;
>   	sector_t old_capacity = sdkp->capacity;
> +	struct queue_limits lim;
>   	unsigned char *buffer;
>   	unsigned int dev_max;
> +	int err;
>   
>   	SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
>   				      "sd_revalidate_disk\n"));
> @@ -3627,12 +3638,14 @@ static int sd_revalidate_disk(struct gendisk *disk)
>   
>   	sd_spinup_disk(sdkp);
>   
> +	lim = queue_limits_start_update(sdkp->disk->queue);
> +
>   	/*
>   	 * Without media there is no reason to ask; moreover, some devices
>   	 * react badly if we do.
>   	 */
>   	if (sdkp->media_present) {
> -		sd_read_capacity(sdkp, buffer);
> +		sd_read_capacity(sdkp, &lim, buffer);
>   		/*
>   		 * Some USB/UAS devices return generic values for mode pages
>   		 * until the media has been accessed. Trigger a READ operation
> @@ -3651,10 +3664,10 @@ static int sd_revalidate_disk(struct gendisk *disk)
>   
>   		if (scsi_device_supports_vpd(sdp)) {
>   			sd_read_block_provisioning(sdkp);
> -			sd_read_block_limits(sdkp);
> +			sd_read_block_limits(sdkp, &lim);
>   			sd_read_block_limits_ext(sdkp);
> -			sd_read_block_characteristics(sdkp);
> -			sd_zbc_read_zones(sdkp, buffer);
> +			sd_read_block_characteristics(sdkp, &lim);
> +			sd_zbc_read_zones(sdkp, &lim, buffer);
>   			sd_read_cpr(sdkp);
>   		}
>   
> @@ -3683,28 +3696,33 @@ static int sd_revalidate_disk(struct gendisk *disk)
>   	q->limits.max_dev_sectors = logical_to_sectors(sdp, dev_max);


is setting q->limits.max_dev_sectors directly proper?

>   
>   	if (sd_validate_min_xfer_size(sdkp))
> -		blk_queue_io_min(sdkp->disk->queue,
> -				 logical_to_bytes(sdp, sdkp->min_xfer_blocks));
> +		lim.io_min = logical_to_bytes(sdp, sdkp->min_xfer_blocks);
>   	else
> -		blk_queue_io_min(sdkp->disk->queue, 0);
> +		lim.io_min = 0;
>   
>   	/*
>   	 * Limit default to SCSI host optimal sector limit if set. There may be
>   	 * an impact on performance for when the size of a request exceeds this
>   	 * host limit.
>   	 */
> -	q->limits.io_opt = sdp->host->opt_sectors << SECTOR_SHIFT;
> +	lim.io_opt = sdp->host->opt_sectors << SECTOR_SHIFT;
>   	if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
> -		q->limits.io_opt = min_not_zero(q->limits.io_opt,
> +		lim.io_opt = min_not_zero(lim.io_opt,
>   				logical_to_bytes(sdp, sdkp->opt_xfer_blocks));
>   	}
>   
>   	sdkp->first_scan = 0;
>   
>   	set_capacity_and_notify(disk, logical_to_sectors(sdp, sdkp->capacity));
> -	sd_config_write_same(sdkp);
> +	sd_config_write_same(sdkp, &lim);
>   	kfree(buffer);
>   


