Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE918A681A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 12:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706857.1104282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwfs8-00069Y-Bh; Tue, 16 Apr 2024 10:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706857.1104282; Tue, 16 Apr 2024 10:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwfs8-00067q-98; Tue, 16 Apr 2024 10:17:04 +0000
Received: by outflank-mailman (input) for mailman id 706857;
 Tue, 16 Apr 2024 10:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BC7b=LV=epam.com=prvs=0836b5ee6a=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rwfs6-000654-Dx
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 10:17:02 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75d773da-fbda-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 12:17:00 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43G78l4s004642; Tue, 16 Apr 2024 10:16:50 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3xh185bwq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2024 10:16:50 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PAXPR03MB7949.eurprd03.prod.outlook.com (2603:10a6:102:218::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 10:16:46 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 10:16:45 +0000
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
X-Inumbo-ID: 75d773da-fbda-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q293SwQjPGZ62cComV/uUJQAZw8Sp+gcThERMBt6bRSzjuZi41dmC6rWF6KPSwU/whjhgv9aDx/uUYdl5rnGbjPy3IjH4cQ0ZZZmPazrta+jMJt0517TxTu+hTp7BGt2Syr/Wte2sKWeGA562q5CNTAhssowZS6KBa6lT7CSFJSTj6zsFdK16G1WcIfP/CMO/KyLhGLQscnnYjXulDU1aMefHhVSKdR2lPPfPWAsYxc71b1K0v+ekJG+azL7WDwMIYSNV6l74A80yixFwr1DtZkETZojeKRzRy+UDN5deI/qgC+2yufhz09OFl2ClzRwFcpv1Km3yVwvqXTPMMTBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncGlppm32XK4vT3fDEKNCpA5e5RJxdU7Iqj66hOD2A0=;
 b=cn6RCAWeJ29A4vxNVAw+nS9uxU0LbvF9vJ5XXrLLVSep+0iUb4NIo6EAYCWJRCgGnjVuchDPOaqKqAbVJLe0ZBgYNXu0c1TZF4wVq1baU7cIMQnFTS4qemAhPLBlZe3E+Q2zEKlrLNtZYcviEptx2SDVCPe3Ne47iJwXHbGpSM447c9ZV1s7MNRbCGLZb4aVJeXiNngVrJhXkW/R6V25escNO3rL3bZwWmr3tupRN96SLRSyyVopzpIxbK/9GPYsmKodORVsp+SiJtOb43+NS1cjMfUGc6sSIA8nkVPBLmyemjqjRCONFuNE9BuxyTPEMLApd2gKPNAjBp03MRFVjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncGlppm32XK4vT3fDEKNCpA5e5RJxdU7Iqj66hOD2A0=;
 b=NVNl+dw1mG6QfyZpsxFLbZ7Pb86L+oDYj7Yu/wJWUlLeP31pmLo96YibTT2CyDCAGc4KDHM6NL9V/sPpzKGTyPrkGMvbfwMT0PNEiC7OQ9uHQmDXZ5pBZgLivZbGEgMktaGBOGRKIUSuVGrDQEnu2bQxzIy9zRAN3mPZ99SEH3CDxKVuEq8e1d87c65vVJ65TRGJuSh08QBWOixOP3E0Xuu67YAbqXWPtYkFxCvUrLl7mvpcHLc/T31pt0UxqPiNV1kUNNj/TFRVDc39ORTejLEfKtJQu8Wla+h0aoNyhzCcNh0/wBB26KXBOH3Q/XsqgZBVo4ZqgzPDPv9IxqOOnw==
Message-ID: <ddef1318-1524-43ce-a9c8-6017d9c2abc8@epam.com>
Date: Tue, 16 Apr 2024 13:16:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 15/15] x86/hvm: make AMD-V and Intel VT-x support
 configurable
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <20240416065012.3470263-1-Sergiy_Kibrik@epam.com>
 <bbae1c9d-4c86-415a-963b-a17ff4f3fa4b@citrix.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <bbae1c9d-4c86-415a-963b-a17ff4f3fa4b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PAXPR03MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f90e90-b98c-41f4-1192-08dc5dfe51b9
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mD3CFoUJfJ4eNrKopS3XbwPEpAIX2zHQaDj6wcm2RehkqR1C6IWNo+mp2d1eN6HfOJ2eOqN3igE1XqY0ObeAoyjJF6BbcSTOjfVXmpjZ06V5VF9CyysZGrFHvIqPRGWYX1LusecPW8iCEhNoPecJf6U6IGtm4SGzMeZx3a6AZY/bm2Ql1zDi+PmaPcNdIl3RYRlfrOqv9u6fPqmogWhwJu50LFEkijJ+eGDyr5H+8p3Fa2eGUJO6F/sObLJp68GvVNiV0K9tIB8e8pkJEgLBHSSQCqGn6n3wHkulC5tyDBcjjEDzVszhV7snTRcpgqkl7vpd3aEub42ZLy+SX8QpcdTSqMBPG/ffzbV4damcbt27J5/HV/NlUWleHtvmLbpfNffUnUTZbizl+gR411FkkN/wCoCjkkzBuoYGVOoJ1/LwBa4J/DbjYlz8tYAFxtb5njI2izZNyvKwIAj+5TnEi58t9gXKyfvOEaGm2PMhglPQ8JJ45igkmWlQQ8XBiy4MJIHDG/1vmbCy+fjptaJu5iIl3F1exTyBsLT9FtAaYxZmOPXhSxKXU8C6fP2QHP+CwD0UYOKmgCfihm7EoGeog7h4pgzVbm9Pjr0xAlVeJSZPndgNaLz1HTI5RilQB2CBlQdqPayrQJBSgZjn2mIaGMLTz0ass54TXQ1a3fdqB84=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0ZoU1dqSHBWL0pTME93WEloT3NUaXNoaVNQKzlkNUFrV0VGMm9WTkZsTGpy?=
 =?utf-8?B?cVVBZFNlS1FJUzFEaGwxN0NnQ0JVWTdDUFlWaDdhT0RtVUVYWFNuazA2eXM0?=
 =?utf-8?B?cDNWMTBBT0hjTEFjdTVldW9lWHdYWEt1WkRSdmd6dVNEWngrMjhBZmczUnF1?=
 =?utf-8?B?K0c1cDJjMnc5T201UUVtenhJTG5FSHlteGVvalZlZGt0aS9na2RrQ0VrWWVU?=
 =?utf-8?B?QURhVHBZVXhPQlhGeStzdEJvVHJqd3Z3TUFMNk55Zy8veGx2enJzZU4vRUh4?=
 =?utf-8?B?WTNTa2NoTkhIZTF2bXFzRG56ZVhlWjI0S3BESk9iMFdDcy9EczN2eXRaUHBD?=
 =?utf-8?B?VElZUEJqZHgzQnhwb3NyKzRGU1cyMGJkeTk4cUtSMWlHMEdCRWdFcTNrUUY2?=
 =?utf-8?B?NkkzNjMxMjNad1p3ZExhdmV3aGUwZk83N0xvY21laUl5dDB6SXg2SmpaM1B5?=
 =?utf-8?B?aTIrRWJhaU1BWER3enRMUXNRMklNZFArZ2twSkx3OTRMN3J4dzBIS3NsSXRy?=
 =?utf-8?B?T0J0V0EzdXd5b2JqQmNSeStRakRNWk1Eb1FMN0F2bnN1WDB4MWM4QmwzMTBr?=
 =?utf-8?B?MHVGUXV0M0Vzd2FtZ0cybXFSMUVkbDBIT3N0M2c1SFk5ZjVTM3JRL2M3UkhE?=
 =?utf-8?B?cWlDNUh1QWZwTGxzQXVjcE9JZzR3Z0taVE9BdW5XZnVVeE1QM2g2ZElpMk82?=
 =?utf-8?B?THNJKzF5ZHpGS0pHK0FlOUdacnRHa0tWaEJGajFCMHRLM0ljUGhibHNOZ1la?=
 =?utf-8?B?RzJMdHJaVjM0S001Q01zU3lERHVISytNZkNnZUR5ZmRhN2NHS1VjZFB6Szln?=
 =?utf-8?B?WjRMQjBwSGxGYld4eHJXWjltUFpIcHQxQkxhQ1pUQ0piQWhnYjRPS0ZPaXhj?=
 =?utf-8?B?TllqczJoNUtiTUlqNmxjN0F1bkdUWXpWQUI1K2VYY2QwaXo5dzgzOUVteDRn?=
 =?utf-8?B?OUhBU2dqcVpNbFM0TThDeGs1blBRMUNwbVJlOTNrM2phNnp1dlV3WExyaXdJ?=
 =?utf-8?B?OWFDYllPMzdEMXdTUkFtdjVwUGRod3R3cjNMZ3VTelgyajVQWnlyR2RDT2pu?=
 =?utf-8?B?NU1CRnRHRmxEaEhjYU40SkRhMzVRcXdpQ0ZGQThUbmZDdWJjbDA2ZTZ6VE1G?=
 =?utf-8?B?dUFKcTBFOGJiMzFXR1p2UVh6VytCNDczUlpnMkVoWG9rTERYclp5bng5Y25K?=
 =?utf-8?B?azFJWXQ2RUtrd1FZRXZ6S1RFbWxXV3RNeEVMQTV5ak5PMXE1TDZGRG1STThP?=
 =?utf-8?B?ZDNDMmxsL0dtSHozUnJYQm9YUzJlaFNpbzFVSDZWUjZndFJ0cXB2UnB4bmtK?=
 =?utf-8?B?a0hZc0dIRHVrOHJPSXdpeUt3SWZFUkE5a01XL0YwOHZXMzBuWHFKejcxSXpZ?=
 =?utf-8?B?RnByYnRya1R1L3hPbkY1Nzh4aVdjaFF3cFR6T3Jpc3NIb2F3Zm9rNS9MYUlY?=
 =?utf-8?B?N3N1TU42c2JSTFdMMkJLODVQSXZYZm9CMzB4VExsczVUTmJRTEJ6QWF1Ykxt?=
 =?utf-8?B?Nkw4dVBkZDdieUZZNjdYVFArdFFsbWwwb3kyK1RNNGZCWWMrdlJOOWtVOThH?=
 =?utf-8?B?UFM5VXpNQzdKbXd1QnFYNTVWSVRpRDZBNDZxampCc0gyakJzR1JiQkpnU1Yz?=
 =?utf-8?B?VVIvRUNScXBrZ1hlU25iZm9XVkpxbWFITDdpck5XT2Y1ZXd5ZmcwR0hjRldF?=
 =?utf-8?B?b0t5S3JWUXk3WXd4S3FxTGY3UEdIU25YVkoxMXM4NGZMV2h0UXNjT0lkVk4r?=
 =?utf-8?B?Wi8zNldubks2NGt4TElTdnlIb1F4djkyNWM0R3A1dXo2bVpQa0FXM2tuZ0xR?=
 =?utf-8?B?YU5ybHhDV2tkdEZjclo1RmNISUZEWm1KYkhvSS9MTCtJakhQWEZxNDlwRmFz?=
 =?utf-8?B?SWJ4UnFYTUtvb1U3TTRlWDRhajRYTzY3ZFovUlZkd3Y3MmcwK2pGeUVScjVO?=
 =?utf-8?B?QVVoT1R3WDhibjVXS1E0bmh4ZDlHOFQxWlg5SG1nL2UyZXR1dm4yNUo1Tk1l?=
 =?utf-8?B?WnRBemVpSmhLNHlkQ0h3Z0tZRE9HTENyR1ZKSFh3MXQyVEtqMXZPMHdwc1hI?=
 =?utf-8?B?Y1pndWRkNzQ3TXExZEl4R2g2NHhyajdsc3RrZ0FiUHQrOTZweTdHdWIxSWtn?=
 =?utf-8?B?R0tPWVBhc2RBY2FldUszNGxLOUlPTkUrOTJpWlcvSE45dHJyTmJyY09ubHJm?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f90e90-b98c-41f4-1192-08dc5dfe51b9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 10:16:45.5633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6SPK5ar+cMkKvi6XNzJYye7cz1Hjh5q/xwX+96Ut0KKthhHvqzQ9KM+z4/zUnuVYR7T6WVSVr5+Tdq6WOauww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7949
X-Proofpoint-GUID: 1v5vvRtHNeIFBswzSsKTRBqDTu1eVbFi
X-Proofpoint-ORIG-GUID: 1v5vvRtHNeIFBswzSsKTRBqDTu1eVbFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_07,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1011 malwarescore=0 mlxlogscore=756 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160063

16.04.24 12:36, Andrew Cooper:
> 
> Everything else seems ok, but there's no inherent dependency between
> VMX/SVM and IOMMUs.  There are certain features (HAP/IOMMU pagetable
> sharing, posted interrupts) which do depend on both, but the vast
> majority of functionality is independent.
> 
> It would be a legitimate config (although getting less plausible, these
> days) to have PV && IOMMU && !HVM.
> 
> Furthermore, randconfig will do a better job without such restrictions
> in place.

understood. I'll make a patch instead to guard posted interrupts calls 
from iommu driver.

   -Sergiy

