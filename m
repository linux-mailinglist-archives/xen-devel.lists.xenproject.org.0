Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460668D605C
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 13:13:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733640.1139949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0CJ-0004wh-5r; Fri, 31 May 2024 11:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733640.1139949; Fri, 31 May 2024 11:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0CJ-0004ut-2i; Fri, 31 May 2024 11:13:23 +0000
Received: by outflank-mailman (input) for mailman id 733640;
 Fri, 31 May 2024 11:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5xk=NC=oracle.com=john.g.garry@srs-se1.protection.inumbo.net>)
 id 1sD0CH-0004QX-1I
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 11:13:21 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c83df09c-1f3e-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 13:13:19 +0200 (CEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44V9W0Fi005630; Fri, 31 May 2024 11:12:52 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8g4ayu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 11:12:52 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 44V9DwAm026633; Fri, 31 May 2024 11:12:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3yc509rb36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 11:12:51 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH0PR10MB7007.namprd10.prod.outlook.com (2603:10b6:510:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 11:12:47 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%5]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 11:12:47 +0000
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
X-Inumbo-ID: c83df09c-1f3e-11ef-b4bb-af5377834399
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:content-type:date:from:in-reply?=
 =?UTF-8?Q?-to:message-id:mime-version:references:subject:to;_s=3Dcorp-202?=
 =?UTF-8?Q?3-11-20;_bh=3DhEGrEfvhl50DirHQTj6h8OIju65uZeJ9y0w/EBJbnic=3D;_b?=
 =?UTF-8?Q?=3DDVj+nGnEzLF30QcqobJE5Ev7eYz0a39GXIlU75c46kTt+g0ahtUaeZ3JLhpn?=
 =?UTF-8?Q?gvHIyDoS_8xtM7fJJFjZ208m1LrnJ8O7GNZiYZIbzxZpO6CohXRDwl3nVZOVFTW?=
 =?UTF-8?Q?iYBcoM1jH6haOJ_ixgY91L7RyfIN0WTIrz4VQ2xSyUBjtJlHcUc8QfyR81rA4cn?=
 =?UTF-8?Q?fUzB+66gLjO6VAx2/Owq_Zh/Og7UhzDrgSsF6sC6HnquIh3h/ACd6n0BgyHJtnM?=
 =?UTF-8?Q?c09KP0ctjt+8cAAKIGbZ/5fdeF_fn/wutE7XMDrdi7T/MFuSKKbTqLKSPX8fb7c?=
 =?UTF-8?Q?0FfCG0IuS3LygnrOPnqmzHmR447aP7jo_Bw=3D=3D_?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy98gaGldBLOmAn8NHkKdJgq17abyV5ejgCXLioS2fFA9Q/Suh5NkBl048hKOge9whUXpCB2yq6bDXjA3/FZy4pb811/swsIfFkI8cH9YfVrBIJ+6OXzhW8b3mZrDZt8qOmFNXH5GtK8yw8SlGd3KQnMejUsg9B3GdenpqI99uPHgVz/lqfnaAFvnaq3FJ7lzoxBnnx28sCTwH2AuKCUKVlYs07YwPn9BsaJVdChBPWgzASaFZpmQJ61Gj7xdUMU3rPYjf1M31YKOPa4VWB2x+GS1xORwfPP3Cm+2W5AuGmn1XjPNIjNtVmq0t/2WppfTO8v4cEKnaK42tF9UdPZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEGrEfvhl50DirHQTj6h8OIju65uZeJ9y0w/EBJbnic=;
 b=IHf5dYDTEIbd10gb7sdUQqeKxy+SYj+RHb2FegGLx9a9dY785ka8YnL4N8lp6lC2YU6A8GsijASP+AV1iCk2g7skHCsUwDg4zxGuWQgFhvZiDzT9Dwftkf59zaX9wU86DAB7qoxvNFpKcC5BzqM7Aj+SLqNxPGp2D6c83+DQGFDc1WA/b+gDRR7DEP7BKErjQPc3uZufS4bvrKtKY64eJNd+KTX1VUPEmOtGlSeYbwHfgOUN5ZfbJNpzkXAK/XjWzMgirGHKamMDZIUTAxQ4RZSBIf8WcqA+Cvx2uKoGYT/wFPvg8DdwbclpC0NXtDtLJkglYuZfBnfAfA72k+UqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEGrEfvhl50DirHQTj6h8OIju65uZeJ9y0w/EBJbnic=;
 b=N4/tMwWqyrIucBTeITGDvFl4GGL10JrZYH76v39bCmHIU679tPpOszlCft3ZJAbFbIOv5kRc5jznTr5ksAo7c6Ka6H1DRbt/7keEaBAfEqDqzYB3h2vYvCy1a+VpcIn02xqscdCJ2dqcR9qJ70qL8XerFoIG0FcvRp/MRVJV4NQ=
Message-ID: <7a7cbb99-23b9-4ea0-855f-8f4db8113806@oracle.com>
Date: Fri, 31 May 2024 12:12:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] block: add special APIs for run-time disabling of
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
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        Bart Van Assche <bvanassche@acm.org>,
        Damien Le Moal <dlemoal@kernel.org>
References: <20240531074837.1648501-1-hch@lst.de>
 <20240531074837.1648501-15-hch@lst.de>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240531074837.1648501-15-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0195.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::12) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH0PR10MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 379abc61-9b81-48d3-0181-08dc81629a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QS9ZUU04Z2RIRXpCZmdoK3N6M0VoRHdWTVdnbkw0ZUx2TlpsNjNrZlFYQnJi?=
 =?utf-8?B?RXFQdVBIcDFyb050Q0YyRHlNSXJsT2dZK2RieGYxVmk1dFRjUlBkeHphYmR6?=
 =?utf-8?B?elpvRUNYampwQnZoWTBhWlcwMHA2UUdmcDQ5NDh5VTNrc2ZPcDdPcVhuSmUv?=
 =?utf-8?B?MUJOSllNTWh1SytQYUtucGpjMlZnSzBvUVpZMFdBV3laZ016c29TbUxoc0d6?=
 =?utf-8?B?YVlhUHg2M1V6V1k2Y1ZVVDk2UjNqckdnSWo0elRZeFBKTVl5aTdrUCs3Q2o0?=
 =?utf-8?B?amJXa0FGTE92OGZqRUdGMVlNM20wZkdlTlgvbHJDaWZjQzhjU284T3oyU2JE?=
 =?utf-8?B?dWxiT1J4QmJZcmo0ZkNTMWRQbUM3U0tSOVkweUV4V21wenl1TEJ0Qm9JSjl1?=
 =?utf-8?B?WGVaYzdnTloyZ3lYTWR1WC9BWTJHWGN0TjV0NEgwTDBPZTdpYWhyS09Tb1VD?=
 =?utf-8?B?OFpUNjh2dWIyQktTazlMSFpxcHBXQ2Q5blVQLzBMREcrdUdxUllPRzFDL3dJ?=
 =?utf-8?B?K21HV0ZoVVo3eDhFM0sza0k1U0tGU1Qya0dDRjVubDhFUzBxR1h4N0sweUFY?=
 =?utf-8?B?Z0RLbmRvdHFhcG43bGI5M3FyRFpVQVVpSSs2MmZMQmwyT25XNjdNM3F2SDY0?=
 =?utf-8?B?TE1GSmszTkw0MkRUSHFpWTYvTVZvMU9uVjBQai96b2tFMHdvSW5qV2U5dkRv?=
 =?utf-8?B?T2dUOWp5dDhRcHRLeFRFM0Y3ZkRQYSt1b2pPY3EvZlY1eG9qWHo0SXZ0bEI4?=
 =?utf-8?B?NzFXeFdUQXFxK0toQmJLcnQ2RmQxQktaYVgwS0lmdWQ1dmhyUGFjbEpwZGha?=
 =?utf-8?B?SmFSaWllREdXdGl6czZJTVh3MEhMU01kNVh5ZjhCbGwyZzVpRVFVeXB4OXM0?=
 =?utf-8?B?cU9kamxob0VaMHUwR1hyUklaWW0zbm1BYjV5V2RIR2xGZnUxamhCUkM0WHd6?=
 =?utf-8?B?N28yS2FPY1d2VDVaYnR0d2VvaWFyaXo3blNkTzNwV0dHZWNxTlVRblh3NTY5?=
 =?utf-8?B?bCtGWWJMQmNkcnlpS3IwVk9JUWZ4Z2hnZXNBaW5Mbm1YQndSc2lPUVZja285?=
 =?utf-8?B?RTAxamRnNzNRd004TFJremZXdjFmMmNYUXZ6QW13Wnhsc1N5MmZWS242cENu?=
 =?utf-8?B?eVQycGRqZkxpZGpIWlpCRG5HZmRvNXlTTFJFYWlvcEJnWjdiUnQ5L2hpQUwx?=
 =?utf-8?B?dkp2RnJNU2ZFOFhJSnBNT1h0RW9jWFJaWVRxTVVsTHFzYytWWkdGeDl4cCtT?=
 =?utf-8?B?Mkh2QklvVW82Zmh3ZUhpSHBJQW9uWHpaTGdkbnowNzEvSFFQbVR1MVpDZXhS?=
 =?utf-8?B?RFVSV0h6d29sUjdyc0dZTWpWVlJ2YWJpTldCcTdWWVQ1NWZQZ1FFTTJXMTNG?=
 =?utf-8?B?ZEJlbTUxamNZZ0tQaHlqL25Bcko0RTlQZC9yQ05JVVpwOGRoenBlZ0xGSVBs?=
 =?utf-8?B?NW96Ui9TZTBNSWNlVmc5Vit4eW40aFdVOVQxam9Gd2I3d2dLZ0FVM2dyT2FN?=
 =?utf-8?B?SUYwWDNkUjBUdk1JVFlZSW0rajhGZFBydVBpYWpOdjdnNlhnU2lZakNqZHpi?=
 =?utf-8?B?ajhTMGFPMTBySlJmMC9JcXNsSGhLSGpwZUZsbG1aMWRXdXFsTDFHRVpHdFls?=
 =?utf-8?B?YmhDUnM4bjI3eENMUHBCZFZWK2lNL2VZcS93R1JDdkF2Y2JkT3RRU2hKaGVV?=
 =?utf-8?B?cnRCUFMyQWVSdThkV1dYcFoyVHVONmJON2lEblVUVVZScjI3b3A4RU5BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnNOaUgxRmpIUTdhNnpUbXQ2Q1cwZ29mM1JRZ3QzTUVvM0l6QWxDYUlUdUw4?=
 =?utf-8?B?WjZxYlA0c0U2L3hOd0hEeDdaR3lhMWpPSXBZS2JnTmltZHRLeFNZMFYzbFhY?=
 =?utf-8?B?NHEwMUJSaEI2QVhjR0xnUTFHbHdGMU9rd3VmemtmTURUdkdSdTNwOGo4c0pk?=
 =?utf-8?B?Q2RsSVN3MXdJTHpiMkZ4TUE5UU54azBnN0FBcllHWDVrNzA1Y1V4czhJdW84?=
 =?utf-8?B?SXdjaGl3Y2dGWGNZbDVVQ2gvbXdTdjBva0QxSnIrMHNhbVdnVG4waXNaZUgz?=
 =?utf-8?B?SzFhNmJVMldFNllKUjJJb0lkK0JBNGhhNkx1T3NTbDM5eUtvS0VTVXYrQ1Nv?=
 =?utf-8?B?SW9VbnlveHIydHZGRkFtNy9GM3ZmMWNkWUJ3VGpQK2RKYi82UTZOTWgyR2Zw?=
 =?utf-8?B?UHczdjJKNjh3UlludnpxbmpwMTh3RllhVnc3MHY0YkQya1ZVckFIU1VGV2U5?=
 =?utf-8?B?WTZZbDEwN2cxbXo0Q3E5VVVWOTU3aFRhT0doRTRMNVJYVmRxcGZyOUk0WERZ?=
 =?utf-8?B?dnBheDNhUjFvQ1p6dDlpZVlSSHhLbzhvVnYza1NpZitmN0sweDZLcXF5bTJR?=
 =?utf-8?B?Wjd3L3h0cExjbDZ0V0VkYWlmaEJYS0h0TDh1RG5RRzhwS3BPd1RkL1JMNGJO?=
 =?utf-8?B?cXNqM2F2cjJmMWJlZEJqRklkSzBiVUFMdmkvbHA4QmdsUkwzQlFNdE9nMzgv?=
 =?utf-8?B?ZG1Sc0o3R3o0ZWlrMmhZeGlQZGlsUVEwUlVMUCtFMGxOT3NlVDFzN3QrTFFz?=
 =?utf-8?B?U25mUWhVcUlKNnZlMUZnUDMyS0ViSDVsSWZlMFMwSTNQM0JRaWdOazJZSzcx?=
 =?utf-8?B?VytZRjZQYUVCOUpyeFprRzFzVjNKTndab2hGM2MvbGRDaHFNUUVzWnJVS3JD?=
 =?utf-8?B?UXNLZll3QTk2TjIvOW1BSnJ0ZHVUU0kvdDZ1cW81Vk1pcWJlSU5zNVB5YVQ5?=
 =?utf-8?B?VXRzaysxUzF2ZnZMQVFsVHlITVpmNXJaWmFUZjVFazIvMWJJd3k1eWhHcDUz?=
 =?utf-8?B?N3VReUN0c2tIck9WaFl3TXNmSEFsTkRiWjNCQWM3UEw1cFpaYldtNHlHSVhH?=
 =?utf-8?B?aGxlUFJqMzlDc1V4M3diWXdFeUdzcjBreEc0SnlEUkloeWxpdWhNV3dkdlR2?=
 =?utf-8?B?MGNvNG5OcWk5S0huZjFBbmMwVm8xenFuOG11czVnZE8xNWIzaVlzbzMzamh1?=
 =?utf-8?B?eHVrSE9IT0hzejBERmNkeUV2K3lVYjFkVXp5Rzk2U0RhYzN5SVppZy9jcUVZ?=
 =?utf-8?B?Q21qKzJlaFA5Z0kvZVIwb3creVBYNktNdDNWUlZCVjh4c1dPVzV0dElBdDhM?=
 =?utf-8?B?T1ptNVV3RmY2eU52Sm8xS05GYitBK0tHQnp4bkgxYXAvVmtrdjc1cmdZL1NR?=
 =?utf-8?B?T0N2Z0Z0c1gweDlXZ2xlbUJJM2FuVHMrTldNTnkyVXlUR1JNTkVrTjhkRjVX?=
 =?utf-8?B?cUhMTXU3d0FDcFpvNm9YWHZRZC9ab2p2Z1p2alZIekVzVDl1M01PbkpUOVNv?=
 =?utf-8?B?eitBdWI5UzJFZGRHbXpQWnhoTlNZUWo5Q3gvd1IzSGdWMit0bk1RN1lWLzM0?=
 =?utf-8?B?V2ZWY1QvWWlOYk5JT0tLeW51YVJsVmlRZnlBTElieHAxcUlvWUtmTDhSc3VM?=
 =?utf-8?B?UFJmZzJ0aXp1czJRbzY5dHVMN1l2MDV4QUc3YVZEdFNlbXJaZEVpaXFKY2Zi?=
 =?utf-8?B?bGxEd0FrZjlqMWZxNUJGWXA3Qlc3aDYxSDJ4eXZNeFdLQ29sejA2K0lsTyt3?=
 =?utf-8?B?c0FLMUxEQTdocjdCb0I1UTY2OGR4Ky9kWEtYaXR3UDQza1llZW8reDBydGJ4?=
 =?utf-8?B?TmdOVUFGeEpJeXVaV3V5Z2t3aWVSREFLdURvMnpyKzdGVXQ0cFNmNy9sN2Jk?=
 =?utf-8?B?VEVGWWpwT29UUlk0Wm9pQjN6WDVUMnluOXV6bmVOQmR3MDZtTE1SVXBvR1l1?=
 =?utf-8?B?bUJJOXRPcGFGejl3NHhlaVIrazI0eXJGU001UGYzVlBkS0lBQ0RkOGhYV0JH?=
 =?utf-8?B?dFAzQTg3MTJNLzJYVmttV3BtL1FTbzBRUlIwV21RdGJ6UEV3ZHJxQ3g3YjZC?=
 =?utf-8?B?UVZ3Y0lYdjN0UjREMGlIL04rU2ZXQVB3NW03UlMrVEpHa1ZzL3AzMjRCSXZB?=
 =?utf-8?B?elRIS1BPUDE0S0lwTFE3dys3a2VPK1VFc3hQNGpXeFAyYmpqRVF4WGZJV3pJ?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mM75Ky+Rp0XOED22ih7gFGm+CyVi5YobrgaH0XtpuwKfZEtPIgKoOD5uJLJkRfq2pw1djSWjtTixukLKmYeLlaabsNAs3X0v3I2GTWTtHneQ7zTYrTF/9icECo7LrNcpORovcUkyyvGsLMe5v55258NFqjR7Pv+sewckvkBs8aI0oGYx/V/SkUfDvUMPWYP4R14WJn/pGPJDjR7aX/EB8Y8IFVZq5tdnxs5B5RhcUR9Yp6IKZvirh0i1UYKckuzPwx2L/utBNpwjZ5+5j4Fv9UPWeCwgANYAjfIFH/sgRMCaoeNms/yv1n8looGGWYfULnBVaibNr0Zt3VDK5aj3ud6i88cEg4tWRL99HjO3IcLaK0BBGhFd9q82xfQovW9No5YSZi7WJjiJrMp39saPvo35T92vgd9pdonG0NluBtuxViwsoCqm0q8/6lDdtHVzHJUhiO+lqQBC7fb+PNp/iYEviLYA+bE+S6Iyi3Z5KF8txfnWr7sUSSeoBpL/94y17sIwN8NaTe/EbCjv4QLno+UID7cTbmnLfg42hiJfW2jmEDniotXnktEvPUFszMs6FF13to8dT1bGDScTSO5UBqkKo8k5x9FK+eflDODVUeI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379abc61-9b81-48d3-0181-08dc81629a18
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 11:12:47.3759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqfGGOoC0qzZfTyQVuj2z0cVmEfBswvtC0H3ozBDp1gIT30ScZV5SmQ3JrvEQL1imqxLF7V51UbjiJj+LpInXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310082
X-Proofpoint-GUID: arDQOMF-4_0TP-qZw765mF9c812Q52b6
X-Proofpoint-ORIG-GUID: arDQOMF-4_0TP-qZw765mF9c812Q52b6

On 31/05/2024 08:48, Christoph Hellwig wrote:
> A few drivers optimistically try to support discard, write zeroes and
> secure erase and disable the features from the I/O completion handler
> if the hardware can't support them.  This disable can't be done using
> the atomic queue limits API because the I/O completion handlers can't
> take sleeping locks or freeze the queue.  Keep the existing clearing
> of the relevant field to zero, but replace the old blk_queue_max_*
> APIs with new disable APIs that force the value to 0.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Reviewed-by: Bart Van Assche<bvanassche@acm.org>
> Reviewed-by: Damien Le Moal<dlemoal@kernel.org>


Reviewed-by: John Garry <john.g.garry@oracle.com>

