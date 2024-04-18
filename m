Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3D8A9B4C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708384.1107281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRrE-00028H-2g; Thu, 18 Apr 2024 13:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708384.1107281; Thu, 18 Apr 2024 13:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRrD-000253-Vl; Thu, 18 Apr 2024 13:31:19 +0000
Received: by outflank-mailman (input) for mailman id 708384;
 Thu, 18 Apr 2024 13:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9OU+=LX=epam.com=prvs=083815c34c=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxRrC-00023E-2g
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:31:18 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4f43f7-fd87-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 15:31:16 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43ICJAfp029461; Thu, 18 Apr 2024 13:31:10 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xk3dur90d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Apr 2024 13:31:09 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7059.eurprd03.prod.outlook.com (2603:10a6:20b:281::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 13:31:06 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 13:31:06 +0000
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
X-Inumbo-ID: ee4f43f7-fd87-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXU8Dj74MzkoS9cIvbYAFQoEw2M7EbHIhWedravLMlhEpP+ZLSAGH0PfiqxQ1E8Ux0n0zxofMYci6a8KhYsBnGrERMidTVbYnNfoJyFCbHavXJGNFUFvomVW3DvfbVNxBKbnJ5O3e8pWHhPM2Gs8g6ndIQJk2p9XMpvzE69Bm+mqTZp2Yu0uhMola40xILkKjRyaJmLIW/I//onha2DWX2z/fQKr9/Vm+gK2ys80wRS4UZhSi4ek2cUjDCNi3QUNDfgcsdVXZyah/fiuncZpTKFaidYPxYpPp3mrezSQI2hHsZHHP4RlczAdmwKB2uGC2wrXmKq43yCoAmNC4J/vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HirSd0t5+EnyK16DnRJY1QL7GZUZgFHV+Bic5BSOBpE=;
 b=ax5y6AF1R7SYJl+CmKOngCbor0GKibzmIq5hVLvQWIWI0vorA4L1QJD6Y73nHNHdOqwqiytRBR8KxEZ402sCq+NgEvenBCUShooVPiRaVAEjQvxqV7lc8YVudcYG4ILksm8E/yF9r6DYlVY2PaDgfp3HIfRh0Uld03v3wEAVHtZv2eR9OPyni0q5r2cmnrbFqY5KdPkOaaexuonvpnDm9ZRVKxFMOp+aQJDvkaNf4hjvDgRFIVFp0LhxU8hm1Ah6YSs0/aPJduVASSM2fYcNKK2oAfaGCl41c+U2+EFCPtSlLOm/pCefvm2LB90Z0CmHWmQhk/f1tuGZ7FJ4lHFCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HirSd0t5+EnyK16DnRJY1QL7GZUZgFHV+Bic5BSOBpE=;
 b=ZijQQ3oOP7v8IUBa31hzkWalZRi7I1VDU8e6sDJcQS0FLlXIh0P+Vdq2/e97YUg8cQr/Cv+sxJcQMAxexYJYfCncDZM0DvNjo0Z2GcVQmLMhLv3dMT3x0xYbpW0PM1qPugqYPYmUEN9PTK307YAUvUnOdEZ+WxiefEoxXVO3P7Gu3NId4Ywgf+jyRyS48qkqP67wTmaNrFAFL2hDes/S9EHdRGaFBB+OsuyiMawLnOgPPX8RfynFPVx1oBmvIMC+rS1opuvz6OHutERDY6y2bYZhnIlm5pY7ebs/+6sGrH95RgwYSqyq8eCKlq79Nx3fDjn4RrWNqxo+++JiUFKuqw==
Message-ID: <5363530b-fbdb-4d7e-afcd-b71b1e681e5a@epam.com>
Date: Thu, 18 Apr 2024 16:31:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 13/15] x86: wire cpu_has_{svm/vmx}_* to false when
 svm/vmx not enabled
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <20240416064606.3470052-1-Sergiy_Kibrik@epam.com>
 <fb54fefb-404f-43a4-aea9-28649927c353@citrix.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <fb54fefb-404f-43a4-aea9-28649927c353@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb60bca-98ca-4c09-6a6d-08dc5fabcd19
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rFCxwdToVue6whatW6M+jQEBh4eWFJx4sfGJ5dW1jSyZViZS341jVX2rl/OUtkGcJPXJuCt7S4NXzpW6EY0+m5HPzsZuqkYQJ1LNoKz9JENWR4ZC0zKkCib+YegElRC9u2uuubY2eog94Cwihjb/+MQEvrOWVKSxMoodR6eJaDwdrD2REepL1PUGCRqX72gnbiRAou7xqT32eSiqSLv3V4JFweMjcFZPx/syDxC8xj8FdMikYoXGECaBDsv1lJHTn/FdgPIeIP200lfXIc28VhaECEvgzspY/WI+l3AfxGxZa1o+0I1CU88uhwydAi0TDI8bCApyWwW5mS9L7WjU9pHocIxHRJu5Q+jVgNYhg/a1+Ut+xrr6a8H+kr+U/dcgK2fQq7JFYXIGjW+5dbSglcVH+ktPxKzv82LqM/Ol9/Jx8lAsvPGmxDx89371eCkZ9XYxOelmbZsPHbtXO30+HSifN7TFD6uLF0m79IkUPlMqQpEPECAFUAKSy75DYZbCreZ6h5HAMPTb8tXDPw70QvoCg+18iAqlfudzjoifARxEihq3TTGY37MWRn1fPMBEfmWkerNMnFeN6qVeCqgXgyCwKrzOqZI7L/Ia2otDjoNz1nKN8ulx9S0B44OlbYl0S5nSjGVKfc3/XY2Wj/FQY13ebtjeidtUJ3RdjtTuhLA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUsxZVJQZ2dBUXBvamhCdW0xSFkwVFQ3dEFNYXFPMGpSMTNYSGtLZ1hnbDV2?=
 =?utf-8?B?akxkUDVKUXFCNUVqY3JjL1AzRStnNzJtWEZLOXJnNzVQUnhzZmhXcVd1SzFu?=
 =?utf-8?B?dkNzcXNLeWFvZG9PWUErb1lnanpseTBuczlZUkNPaFh1VDRlbXVjYkc3UE1X?=
 =?utf-8?B?TXRLTHZyVzg1K3VGMWlUVUpYQXpLVCt0ZlAwTTVWUTdEanVLQ1Q0T050Mi9R?=
 =?utf-8?B?Nk9yVnRmSHFIWUpnaWN1czJwZ3JSdkRMelduV0UvZUxkUm02R0t6RU9YTURt?=
 =?utf-8?B?NzRXYzhGTFAwdUNaZ3lRUUh6TlBRM05kWklVdVI5OUtFcjV1d0p2NkdiZUpp?=
 =?utf-8?B?K2g4cWMyaXR5bU8yVUpNcVBoMXlQcGlaYkQyTXRveEI2OTZJNFl3Z09Hamhp?=
 =?utf-8?B?bUdaTW9tTXpaNGY5YWxxSDBnakV0YmFoUEhlYmNKQ0NTSFNlSnpnVE9SR01l?=
 =?utf-8?B?MldJZ3R1THA2VlVWOGRTSEpkckZKZm1ocUNjaEdxQjhjWHFwS1E3RlpodkhU?=
 =?utf-8?B?MXZtYk1lWkhJeGZsNVdkZmdSNmY2VVVEaEJyQ2FocVRoeFZMZ1B3SXdBbDd5?=
 =?utf-8?B?UUtVUTdnUTJ2bDRtNWowS1kwQTk3eStJRG1sbEU0QVB1SHF6TkYzQjRGM1Fh?=
 =?utf-8?B?NDFYaE1vcWVZcEROQWNEZFh0eFNxdnBXWkVVUmxoNmNCVVJzR29Qa3hGQS9R?=
 =?utf-8?B?cGtVSnBZWkh4ZWtwZEdSYitEWjNVYW5YQ1FJMUxFQ3hJekFMODdMUkpGaGdw?=
 =?utf-8?B?ZHZtOUFJRVRNc0I0Y21hbWt2K3YwbDh0ck5MZGlKdFMrT2lYb3hOT1BRSjZr?=
 =?utf-8?B?Y3h3cTRYN2dvS3hrOXE1bFNrSU42K1JJdGxuNk9vOXJSMGxBNTJDQml1MUVK?=
 =?utf-8?B?dUx3MGVNbFRWSnBvSTNQbEJyN2JrY0puV0d6M3VmZFF4RDBpNTBsU3lmWXc3?=
 =?utf-8?B?RkNVTU5ZM2RKVkdBYXVKMWhSeXVnem1yMklic1hHRXJlMS9jVUo1SEV4VFJv?=
 =?utf-8?B?V2lBRlNyZ0E2b3RoMElmckE1ODFVRzJBbE5pVzBQd1ZCY0pNV2JQaTllOGlE?=
 =?utf-8?B?ZjN3T1JyWmlReExCS1RJdkhDUm1TK28yaXNveTFOSThTY2ozdEZBN1k3UzFi?=
 =?utf-8?B?cmlLNlpxQnpHRnZtQXdjZjFiN29JWGxJZmZLeklCTVNPSTBnb0MxQjVtb2F2?=
 =?utf-8?B?MGUyU2h5MmpSd2tCZjJPRFltTk14UU1CdkJNMzV0dlltelpQQ0FPcnE2Z0p4?=
 =?utf-8?B?YnQycjhOSzdWSlFzTmsweFMwWXB1MjFML2ZXTXowV2tobkVFUFBZT1Ewc2d6?=
 =?utf-8?B?Q2RKbkExNlM0VWhxZFNtTmptVkFJaGF3THJiKzVHT3NEWnBiYnNzYVhTaHkw?=
 =?utf-8?B?dXdCWHd4SnBiK0NKdFJVWUs5M3dXT0o2WVN0OUZwaWlYT244UGhPaDV0M01X?=
 =?utf-8?B?eUJ3eEZiclBFYkNCN0h6eG85MkRCekZnOVVBa3phWGl3SEFxRXNuZllua1hl?=
 =?utf-8?B?RUY4OTZiM09acys0TkhKeUlkOTBKUjZ4STNHL2hZeHJMWGV2MjBUU0NsWW9x?=
 =?utf-8?B?V0ptTmdCS1lockEyeFF0eG12MnU1UHhaNE5xejBqQlQ2ekd0N09CblUwd1pU?=
 =?utf-8?B?THVaazcvd0RWZTk3SFNHQWhNTnV2UDZjbjI1aXRpd08ybm13UmlCVEV3R0Za?=
 =?utf-8?B?TGMyU1AwSWh1ZFZ2QzZOVllVWHBVOXZ0ODUzMGluKzgzQVZYeTZXK2lnY0FL?=
 =?utf-8?B?QWY3NHpwNUJqcGJ1R0ZsTmM5djZoN1p2M2craTlJNW9lU21ZZWFuWUVBYVlY?=
 =?utf-8?B?bk1YcHBDZnI2NkFTUi9rc3BUanNKalBLK3d5RktHTnNZNnZON0J6bktGL3hh?=
 =?utf-8?B?N3ErNUhxR2ZXQXFFMFFXUEViSWkwa3haQjVid2FxL3k4Lyt1Q1JJRks1OVBt?=
 =?utf-8?B?LzJhQkNobUc3cWFPU3N0VWRleFR6N2l0V1c5b1ppbkZINTd4NDZ1VEp3Mk5V?=
 =?utf-8?B?cFBmQkRBbFdlYTV1T3ZGQnhvc00yQ1I2UnA2cTdMRWtIU3ZvYXZwYzl4RXpx?=
 =?utf-8?B?c011UkttSytOcjdETDM0ZlZUWUc4NHA5TE5LUGQ2aWtRNVZjdjRyNUo3TDJu?=
 =?utf-8?B?N0tsVXN5WVhrYU53V3Z3R29KemRjWGozZnhaTXU3Um8vandZZm5FeUJ4Q0pS?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb60bca-98ca-4c09-6a6d-08dc5fabcd19
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 13:31:06.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVrRkKeEjzNsAolfdN+N1lGA9hw58vJkWAKj9PBwg1+yqsFgjdPXjBgkd4bge9QUzCcF5sc6UPVHOxv6O+YTBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7059
X-Proofpoint-GUID: 5XMYp99Pu36a4yxEQOyMN_TwpvGxz56t
X-Proofpoint-ORIG-GUID: 5XMYp99Pu36a4yxEQOyMN_TwpvGxz56t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_11,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=831 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404180096

16.04.24 16:26, Andrew Cooper:
> I'm afraid this is going in an unhelpful direction.  We want to move
> both of these files to be local to arch/x86/hvm/{vmx,svm}/.
> 
> cpu_has_svm_* isn't actually used outside of svm/; only the plain
> SVM_FEATURE_* constants are, and that's only because they're not
> expressed as plain cpu features yet.
> 
> cpu_has_vmx_* has a few more users, but most are unlikely to remain in
> this form.  One critical set of changes to fix vulnerabilities in
> nested-virt is to make almost of of these decisions based on per-domain
> state, not host state.  The aspects which are host state should be in
> regular cpu features.
> 
> I already volunteered to sort out the SEV feature leaf properly, and I
> was going to do the SVM leaf while I was at it.  If you can wait a few
> days, I might be able to make half of this problem disappear.

I guess it can wait, surely if a better solution is to be crafted at the 
end.

Stefano, what's your opinion on that?

   -Sergiy

