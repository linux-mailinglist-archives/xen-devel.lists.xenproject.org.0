Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA6C8D605B
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 13:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733637.1139940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0Bo-0004Tn-TJ; Fri, 31 May 2024 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733637.1139940; Fri, 31 May 2024 11:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0Bo-0004Qd-Qb; Fri, 31 May 2024 11:12:52 +0000
Received: by outflank-mailman (input) for mailman id 733637;
 Fri, 31 May 2024 11:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5xk=NC=oracle.com=john.g.garry@srs-se1.protection.inumbo.net>)
 id 1sD0Bn-0004QX-7t
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 11:12:51 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b7fb7e-1f3e-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 13:12:48 +0200 (CEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44V9VkQ2005534; Fri, 31 May 2024 11:12:21 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8g4ayta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 11:12:21 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 44VAqSDC016232; Fri, 31 May 2024 11:12:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3yc50tqwv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2024 11:12:20 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH0PR10MB7007.namprd10.prod.outlook.com (2603:10b6:510:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 11:12:18 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%5]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 11:12:18 +0000
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
X-Inumbo-ID: b5b7fb7e-1f3e-11ef-b4bb-af5377834399
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:content-type:date:from:in-reply?=
 =?UTF-8?Q?-to:message-id:mime-version:references:subject:to;_s=3Dcorp-202?=
 =?UTF-8?Q?3-11-20;_bh=3DNrlvPCyMcyqWI/tJUTwItb4RxylbxvVIA4qhSg7km+Q=3D;_b?=
 =?UTF-8?Q?=3DnUW4xs7f5PO9r50nppwk98Hp+BJj1PlsdTaQvIsCNMcqLEa+xtCjOxGr+EBG?=
 =?UTF-8?Q?wI45Z6PL_p7tkWy0NBBSMfau3hUwoDrlwXvjC5XgBCrfPgfY8ADSQX7nI2dk3lP?=
 =?UTF-8?Q?1TaM7EmWql5KJp_oV7S03klv1qPuK0PUsQBgwBsyyyc6uptOCGJNJ90ZQrYxc5I?=
 =?UTF-8?Q?6y7YOPtF6udQIdrm1Fqt_zPwADo5Zb6buQP+cKHHFX/kYOPL/WRpzfh8br7U5qx?=
 =?UTF-8?Q?sj+faNbF0cyPxAyaE/aMRc5yEf_G4VoqMsVTo0j/qykmw3qnOIQYfXxnUkDTi6q?=
 =?UTF-8?Q?YIDQkhh1yrAuGgct9Co5t5Ia45vqu6QF_4A=3D=3D_?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+CvvaW8eTd/F26GHjAiUYiRLmA6oc0CSqS+l7ebABkbtA0JPaGDgSrsO6G+7U7cK1A9O9h8h3Tu/SjLBRziRFo6TVty5qSuXTnhaqnejvQhKqJfTHJOuetcpWesvou9pTDWlcEYgVxNQXKfOcKbLHweaSKSEU0gcQb+afQHqKGCcKqIqSKfBOYBElVqFz1lyqPg4oTJh8leZ/SRSXchEZgBFOOzOCenDVMOvw9jhqYw3xahlB8N8T7ssU0B1bZouHMoa/YqT3J0AcjnYbVlcgQrIM0tmrSc+3XQ/GI9QRXH0rS0OSghLs+wV/7eA31IYfDYAU+KakRUqS2nP1xOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrlvPCyMcyqWI/tJUTwItb4RxylbxvVIA4qhSg7km+Q=;
 b=RXfln5wCwBpRnBmQEJ5cVyCvquVS/TMATf6NpC5YBAC7YhFS6Nmoc++AU9NiHBD1A3JUQxbcfvXU3x4QoAlg5FbTS701Trm0429Kxnx0QMce2bJDcXhKV6gl4KNjUKrdZW60rfu2xXPP12mOXvZ3R5xZiWrZWRPDN3FotaR5MEVgARFJWgn+xcd9C3QtuVgnI1005/0hLn/tg+X8XgyaOkMWpir/Cgg+GmL+ATmzyKGXeeX7tj3NzJ2w3V/SF01GsPtIibdOeFyNCKeIctTI8VcFpEgIubFAHSz79JedqAE5ixdeQx6sTrCORqMSSPZp5GDWPqA0iz34q2Gm/LFB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrlvPCyMcyqWI/tJUTwItb4RxylbxvVIA4qhSg7km+Q=;
 b=xR8kwZJbV+OzrYtU58cUZKd+kpGDvJ3MsUwtBHrb2elNBp/d+z6QlKM1ngfKYSbF53hw/ZH9iyhIwRto4B+PMw7t5nwyqMkoqI7s9JoPNSYsSogNA9FV2Vudp5U00/Zz1Bwg9xLlbe+MULxxeoTx81yLxBlNPBX9+IWSaR/uv5E=
Message-ID: <3aed8f85-890c-4c4f-85eb-fdfaeb65b6fd@oracle.com>
Date: Fri, 31 May 2024 12:12:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] block: remove unused queue limits API
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
        Bart Van Assche <bvanassche@acm.org>
References: <20240531074837.1648501-1-hch@lst.de>
 <20240531074837.1648501-14-hch@lst.de>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240531074837.1648501-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0193.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::7) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH0PR10MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecb6b76-b14a-4033-6418-08dc81628897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEQ5b1FKQ0F3TDBMMHRrN0FNN25zZDJiUGY0a3Brc3UrZi9BWVRuLy9xTkNJ?=
 =?utf-8?B?eENkK2pXZkh4Y28vY3RDeGpUUndoRWNqSjMwdE02TWoyNXNicVZORHR5alcr?=
 =?utf-8?B?YkcrekRSV3lNSllmMjg1dzUrZlB1c3pJOUcwRldiMS9sSUgxSjVlUWtrTmpu?=
 =?utf-8?B?dUZnOHlEbkUyaC9FbUtRbU9lbUxOeEo5Ky9KWFhPR2JaVmVNemgvMU80Z0dS?=
 =?utf-8?B?bk1oemhUOVNiajZPZ3Y5eVoyY3JTUzM0QkpJREc4VC9OTkJnSkVOM0ZoeGE1?=
 =?utf-8?B?R09Rc211MmJtUnB1NzkxUGFDa3BiVmovTUxBaHZkRktGeDFVS3d2U2svcGFo?=
 =?utf-8?B?VFg5WW4vQmh6dEk0Z0ZEN1JrQ0RKMFlPYXdMejBmTlV2ckx6Z25zOUlRQjV0?=
 =?utf-8?B?YjhOQ3FmR2Jzb05Ja2o5Vm5qd0V4RkdSWlpxVkxhaFdoSnVBNlZYeTlYenZU?=
 =?utf-8?B?ZW5SaDJrMS9QWUFFQnhwb0ZLVWVKMHV2aFNjVk5VdmlwYnNKZklvc1l1cXcr?=
 =?utf-8?B?bDBNN21KZndzaDdBVkFkb1NRNEJIaS9YQzZMUkg1U3NDZUpzL3d3YTF4ZVJM?=
 =?utf-8?B?Vy9jSXZrbzhKeHJpb0RZSlJib0xiU1MxRkNCTU01TDN1czFyOWQ1ZXExbEh0?=
 =?utf-8?B?S2dsWlFVc1N6a1hZR1hRa2hxWmFpU1I5OTVTNlltZTRJZkU3YmtlQ3ZBY3NB?=
 =?utf-8?B?Y0F6SUpOSjJ6cDFZOFdyQ3I4b3QxcFYyTmRxSTVna0FYdnBLVnVZK1cvZVNn?=
 =?utf-8?B?S1BBLy83UjJJZUplUlZGekE3c0hwWVhuYUl2UXhLSnVOelE3eWFwTnM5MHcy?=
 =?utf-8?B?b1l3eDl1SnZ4T0ViWjNmWUxKeFh5NTJqL2xsTlU0UTFPQ2JvVUJrdVFRejV5?=
 =?utf-8?B?Y1RIemx5TXVDdGFQNkZtRktmaEp6dHl3N1EzVVlZRlI4bGlkbHdKT0ZMeGti?=
 =?utf-8?B?UnpXcVllcm9NWFZzUTZ6OTZWZTBaUmpNWnhUVW5HSEx6dEdrQ2YzTkQzVEhH?=
 =?utf-8?B?K0FmNlJXc0R2NnBrNHEwY25JV0dOZmVCZWhVWXp0UjhEZU00eHM1RlNEek9F?=
 =?utf-8?B?N2RBRHRaZXF2OUV4eG9JdFNzLzJTc3orb2poMmhneEwzeVMzdlN4emhDTHZW?=
 =?utf-8?B?a2U3bWU4UlowUVkzMkN1NHp3d01ndlkzWmhnTHJ4T3p0Mmp4bnB3NEdpQlRY?=
 =?utf-8?B?NnF5bmtBeU54dFJxQkR0LzRlWDhibjROTnJJNG9JMEptbkhHVnZLbmJldFFT?=
 =?utf-8?B?NjVpUEp1WHQ3dHZnTTE3TjBtV0NBZm9pVG1xcEwxTU5QU2lpMzB1cVMwczNL?=
 =?utf-8?B?R2lpOENJTEUxYXc3VVQvK3E0U2MvSnBnMEIxTnMrdEdRZStkakwwUS9IaVRl?=
 =?utf-8?B?KysrN3dYUXVTYitrcUV5by9rKzhvdjVhOTU3aTZYaWJpYWtOQ2s0WlJHVnl0?=
 =?utf-8?B?Z3dTUnNlaVBPeGpsdG9CaXYzYmIxOFdETXZ2UGRHYkZhQnBRM1pqYjR4LzE5?=
 =?utf-8?B?cHFlcnI3U1VRdUpUMDk3SWVDUU9ScXd2OXdId3NnU2dsTER5K3pOTGdtSmg3?=
 =?utf-8?B?NG9ib2EySWozL01NK2NUbGdBck9kU3VjNDU3by8vZGErUDlJMHRrdnFXbFlp?=
 =?utf-8?B?Z3VXalpVSGc3T3pOV1AvR2pEUXVSWnpLS2FVZHFMN1JEVGlsQUNJS2ZydHBz?=
 =?utf-8?B?emJ5KzFiZXZoM04zNGZJUlVnWUcwYkhodDlPNUREZUcySXh3ZC9LdGR3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFZ5R0x3eGRGZGRPZjNUc1hKd1M2R3ZjWmFTVlc2a2VDQnBvWUJqTkFmRjAw?=
 =?utf-8?B?Y0ZSalFCY1BvVW5QVEFlT0YwVzdsYmhXT0ExbVhuLzVmR3gwOVNPZytkWjY4?=
 =?utf-8?B?cXVuc2NURE0yaTh2UkRjRDJLSDNma0pld1hQdVphTFM2S0U4OHoyTFBhQ3lT?=
 =?utf-8?B?VzU0NDZNY0ZyVFVDOGFuRlkweG1IWTU2Z1ZUcUJPOUJIQ3dTOUhnRHhodGxZ?=
 =?utf-8?B?eEVmeGZxUTJENWF4OW1PV1hLY1lLYVZjS1RwMWR0SEw5Q3lLZUlvZFByejM5?=
 =?utf-8?B?a0M3M0ZSNjU4ZVZZNzlSbUl5T0xNeHpGd05RWG9UOWhqb3pCV28xV0NTNGZh?=
 =?utf-8?B?T1lqMmtzOHVtZlFQRVhEcDlQbkRjMmFWVXpTMjkzL29sUTQ1WEFBOFE5WU9p?=
 =?utf-8?B?cTdqeFpvVXdpQmRNbkVOSFNBTWJQQ0l6Z2hQeFcza0FhTTQ4SUM4SS9PREhq?=
 =?utf-8?B?ampycnZ2Qnpsd2lTeHF3azRWbHQxUy9ZYlI0eGNtT09wd0VEMmo3Tk1wRFh3?=
 =?utf-8?B?dnBtd01idkJrUkVDYTBid091UFFwTWxPZytWRlVwelIvc0dkVFRFT0dpSWFl?=
 =?utf-8?B?WDZCN3p5M2lqVmcxOHBVYlBORDZ6cmRTK0tIbVBONCs2YmpsN1IvL2daQngv?=
 =?utf-8?B?MjhKSzNIbUhFNTc2dlJjajlKcloyWWFKV1QzVllIWnU1REZsK0FtOVRYU2l2?=
 =?utf-8?B?UnRFem9Cb3gxMmtXV1FjTjV0RXR1NU1XVlZ1Wi9qWW5pNWVnNzVSaEp4WjZ1?=
 =?utf-8?B?K2wzZFVvSjZrM0NaRXRTTnVpendXdU1lM2cvaWJ0aGRyZXhUdEFiVDlqUGNr?=
 =?utf-8?B?QlJuRm1qbWF3RHk5NENXRHpXZmhOWStrS0JIODFPOE9RN3JxaXF1V3dsKzJv?=
 =?utf-8?B?RHBvc2NxZkNtSHZWR0xMaGZnWE9vKzhqT3VtRDFnYWQ3OUwra0xZYVRZMDl3?=
 =?utf-8?B?OEZkeEh5ejdvQmYwWHFBOXpKeXplSEsyWUdVOVYrTnUyaTd0T25Rb1EzZmVt?=
 =?utf-8?B?QS8wWjQ2b2ZLT3d6Zy84YUxFaXFmTVFxRU9LckNpM3NCU29FVWlaWUxhakU3?=
 =?utf-8?B?eEExTk9rTldHMXBadktIeDRnZkJsaklhZDhDbStWalFZajlVdmNoRGZablhk?=
 =?utf-8?B?NUxGV1RnbFB0YkYraHdVa2ZOVzErLzg0ZFB6cTgyQVFmM2ErMHpMeGdremNh?=
 =?utf-8?B?N0JvU1lpc3pRWHlHc2dxQzk3SWN0eWJLb3BKZmwwSDRxQVI3ZGtTOXk3ZUgv?=
 =?utf-8?B?Z3FMYWF0UGxweGdxTDZnS0pkOUNmV0svMjFPdmFHYWsvYmNYT0piUS90Z0Fl?=
 =?utf-8?B?b0xsNEcrUU5sNnRRWWkvZWQ3TFBkMW1IN0YvQWErVEFoYWsxNlB1WnR4TFJU?=
 =?utf-8?B?SU5qM1RZZXpIL1VsQUZDMDkvYnViemhFU0x1SUtYVSswNmM4NkZlMDFkMmxW?=
 =?utf-8?B?WjlvQUx5bVpFWkVheVczTlNMT2xTWUd5QzFFM0RQbkJiS25CQ1ZoRVRVV0lj?=
 =?utf-8?B?dWlCK3pIeU5GN2xYTkE4dXRNcXdKamg1TXlJaDVSUCtGYzQ4M01jUGl3MUxl?=
 =?utf-8?B?OXNxSUhsamE2Z3hoMCsrK2hHNmVtQitxVEVIWU9zU3czMGsyZ2ExeDgzN25Q?=
 =?utf-8?B?MVdzTklHZE90amdKN3VhK3RXNENjbUJVcUpuMm1wUVYvVXMyRUgxWGp2RCs4?=
 =?utf-8?B?OVlmOVFZb0FxRGp3VWhPR2RsVnR6VGlvQ2RISDZEeC84TkxWRENZc2REUmNG?=
 =?utf-8?B?d2Zjd2dpYlRzY2NBMlZ0UEwvWm9lSFVIMHMyNm1wZy9GY0RjSW11THBzRGdW?=
 =?utf-8?B?QlJGSGEraEhaTXlramFQN0dBalZPSkdjaXU1M3pYY09WcWxYdHJsOVVzam8v?=
 =?utf-8?B?TlR5VlFSam9XNGFKUVE5QXZjbWFIYkwwYzBiZStDeHVUa0dKL1lWekRqRnYx?=
 =?utf-8?B?Z3dHYlYrcTdJQnNsSWlkd3NvOExhQjlGdFdzUjdBbXdOZ3FDSEJmY241Z1ZQ?=
 =?utf-8?B?SjB6L1BPRHNCWHlqUERQd2IxeDJySlU1OExKdWNjb1RIUWZXWllRRHkzYjdr?=
 =?utf-8?B?THkvN05zZWRBV3RGTVBJZ3J0MUx0N2dUYUlmdktqbTNqRjVGOWlQd3Fsem9P?=
 =?utf-8?B?ZTgzTmdHWlNFaVErdjJuU2ZwejhPTDdpR3hiVGxSQVV2ei9vc1VxWUsxVTRk?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	P7Dw/WwJQMlT6ivAC+aLcn7Q+Yuk+suSTGd/hhslbA2c8vBGvav2bE+zbPphFfvgQuTuLOdxu6ZaOc/t0smRGQnEDgbR8zhbr2r/6eY8ke0g+a+ow45JCSV2y47keXN935fJxCmMujGp0arOHdADicW9ExEL+/xSvoqAMTqTYXPrth+su1k+7r6F9vJKvq+nTBdnZxoOu+XMZGXKQdenmHUxFO6SXHV1cfBV/bHT8fS9rkQfyAFhGK9HeaIAK7mJbjnZPL4XYYtZ+NRSFQ/YQnjXQdcah1V6J0k8n5kMqRUFRZL6mDs1dxcw3qOn5i6kOJghFrMgIKgMWVYmVWHk3RBafdbHJ9wGcujRBjcMmOHj27DZwV6L172pKU7HVyFEgHATf7iMnN5ptPnEt7M8AuWPoJ0Zo6ZUoLMgs2RDehQr5kFy4nkJJQFFlQkCeXYvrMajoJChsqcvvXZxG619s06TJdZ9gpsgRdi8zMx9s+W7WO/1lhfpj/ch4qvKUlustM0vlR+OMT/h3+PZ4FYh+YjNeE0uEXFERQkBkGOJGoaKH+ATCtNk3gSFvfF8NziXurZAY/8VABDQdvEIUiLSqluF1tj+1I0CxFCjOvgqFxs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecb6b76-b14a-4033-6418-08dc81628897
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 11:12:18.0389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlS8g9FNHD10ZFzs2aPWqEsBc5RPGKLVmv73mO+5QeEGqvAUB4gEc9FfIs3zDDz+t1lyykZ1F0Al6MN2AHIO9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310082
X-Proofpoint-GUID: HWzHE3q1ri3FSbJIqskY_Tg5EiZe8LwJ
X-Proofpoint-ORIG-GUID: HWzHE3q1ri3FSbJIqskY_Tg5EiZe8LwJ

On 31/05/2024 08:48, Christoph Hellwig wrote:
> Remove all APIs that are unused now that sd and sr have been converted
> to the atomic queue limits API.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Reviewed-by: Bart Van Assche<bvanassche@acm.org>

Reviewed-by: John Garry <john.g.garry@oracle.com>

