Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F845971E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 23:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229082.396477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHQR-0003Vk-En; Mon, 22 Nov 2021 22:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229082.396477; Mon, 22 Nov 2021 22:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpHQR-0003TT-Am; Mon, 22 Nov 2021 22:04:35 +0000
Received: by outflank-mailman (input) for mailman id 229082;
 Mon, 22 Nov 2021 22:04:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTyB=QJ=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mpHQP-0003Qi-Bt
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 22:04:33 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29f83424-4be0-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 23:04:30 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMKp8Or031836; 
 Mon, 22 Nov 2021 22:04:11 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg461d3pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 22:04:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AMM0Yh4007842;
 Mon, 22 Nov 2021 22:04:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2172.outbound.protection.outlook.com [104.47.73.172])
 by userp3030.oracle.com with ESMTP id 3cep4xcwc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 22:04:10 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com (2603:10b6:610:c0::22)
 by CH0PR10MB4956.namprd10.prod.outlook.com (2603:10b6:610:c9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 22:04:08 +0000
Received: from CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::8c5d:23d6:3381:fefe]) by CH0PR10MB5020.namprd10.prod.outlook.com
 ([fe80::8c5d:23d6:3381:fefe%5]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 22:04:08 +0000
Received: from [10.74.108.248] (138.3.200.56) by
 SA0PR11CA0199.namprd11.prod.outlook.com (2603:10b6:806:1bc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Mon, 22 Nov 2021 22:04:05 +0000
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
X-Inumbo-ID: 29f83424-4be0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=TZ6vik4grgqtOJgtAy8rPWATYXJh62sMicdI+zK2Hh8=;
 b=byen7eZLVTtiljgcYcer0w1Un0xEGE+646DAclhdQitah5CeZWb4Zwywnfnv9nGVi3H4
 aVIHYefFlfIajtgtlhYKvk83U33W7KoBnC685y2G/KDnIEaVj9OVeRbxDcIJNa+lH1cB
 f2814APMRHFvAJThJfCrBdR9nyfmZNV7LBEKN/pZFEO9jDRdd2hWe3GnRv2jcFz/Y9pV
 15lQeL9fiH74Sbx7PHow8RBcIGcJrgqqHWtRLIV3u/Tfkx/YDB36AP/vjhkzJJOZ80qV
 MDehTY4j8KCSzcRPnNfDarCwc0/SjFh1J75RJ3etxUpGEBrYT9+HIZR1d+CMQ3dd18/o cw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJSFO+upYJIlSaRos2J+rVDtNGAJ2OOJQ8hSjfXjq475YbnIoVczEzsWXfX2wPL1RcsPejjVD6ej5DiZqbCw8PzZrNr7BrMGbw9RoPo8hpU74+U7x2kNVyu91rfutKMjoZQSO6tW/oDhrE+8T1vkDzyz5HWd1GtPKowTmaYqF0rqvF/ywblb366wj8mQF3ITsppq3H6OeOVSMIr2ukl7vUTTaMWL1+gZKmDVGGJFgt9h/8N1XKkYburRltNJKxO9j8L+oBy54D43SW8L27pBdCyQYLzNB1p47uyG6DPHcOmmV/uaWVsBFW5IcGfc6ypHNCRTONceiiV4V3wJA0YIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZ6vik4grgqtOJgtAy8rPWATYXJh62sMicdI+zK2Hh8=;
 b=SBA2JlpLL5ewEzo3Cmcn8sWENAghahBJpGm6oL2iEWnAkFusCdlSdcNyUcbCWKR68VxoYzONI4QfttbEQJXZbEeOEYmJlWeHMhrBN8kwzHM1VFRqXxryhXnVRvI57Z/5ZyPu6NfUIC2zUGuTLPJ5c+0KUhKoF22XbSLiwBYJz7GagNIu0SBELJXyZefKJHr37EhY0WeXsgka7EE5j3sK30l0ljAMUNni/IaQg2xwEa0rt0dXPnMuVWuFpg02G/97iiD8AJQOghoW1ZAiO/dJWjw6W0jCZohWZNzPStdDjI0ZS4YA+nnpN6otXiLdC+gHZ7daeo2nHKLZf8SZI79GIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ6vik4grgqtOJgtAy8rPWATYXJh62sMicdI+zK2Hh8=;
 b=ghhTjjjbC268qN1Tk5GCWFhFsEKne8swcbxX7vDmGuJlp5aAZL6YBgWRH5Dz/4qSrqpqcMee7YQyzlJ+RfymGFppplKePUaH3MkqmO2S+AuiGqHjqfAFL5MjU4P9MPHKkcsP/fHUgKpL0pJrKNBio7d2d+4iOnur/CRfb89CFr8=
Message-ID: <550dcbd7-d48e-0b3f-4029-a887c84a72c5@oracle.com>
Date: Mon, 22 Nov 2021 17:04:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH] xen/pvh: add missing prototype to header
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
References: <20211119153913.21678-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211119153913.21678-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0199.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::24) To CH0PR10MB5020.namprd10.prod.outlook.com
 (2603:10b6:610:c0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f28178ce-44ba-4509-958b-08d9ae040168
X-MS-TrafficTypeDiagnostic: CH0PR10MB4956:
X-Microsoft-Antispam-PRVS: 
	<CH0PR10MB4956E78E9C4989E82CCACD178A9F9@CH0PR10MB4956.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+zyHqIwBbf/0XLiS9aKrTow0I2AukwmdmTr9IhPAcLHl3mUFgdoEwK6JN9dORb1PnRgXwFNyo2/HYDQh1gBx7HThM8N4v2Uuv0YIl/Z+KlUo/pONG6b3L2BFurGJk/d9wSvmy6BUB4HZg5+CDGhJYDWAM95/NPlBaJm2VEE3ESdU53WoLnFgFjXKj36vi8/5StWO3hY9yoTrUsel08ngkZrKlL4F11i0PVFpKWLY+j73X6VaYQ0dNYOzZjTOfdsS/eia/qKTiaeuPGCJVDZlGwKvr149basyKzvjVK3n3k0hByuHtgchiZXzRML9nETHR643L5pR7hjfltHKqfid9eOSmofi8IbLDgrR8iJOTHexY8GQZMwzLCZaWWsOmXcCU2iMHol8qn5gA4kTypQ8g3S8y1n6ZIIBYqAvv6JDYONOdK6KDi6QH0t7n6bjz5xs/7wQv+w7V/G4tQ6gxTP01P84L610Vl6TNSCNKNEKnzUDFWCsYISq1+zrpixLuAJZMPWz+tQh3WNXTtHo9jX8C9JnenALXY5K0FJIolOjR4qJh/Asb7g6r2vCoyKYUgKQ+MY8ueT0kL0kR7HnOaxeKChuc6N2vkCnGOuCBDUalWc3viJzn2aMMH3T4uvaG5fLyxYaUeRDgEnZ5mYPMldHidc3+zl/vLSoW52X/HqknW+E8JFq1n3NTciDIdc8xbWy4K3IdmWe9nXzSfi9E4DA1Cdx8fmRETzNq819PZdoE+E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5020.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(31696002)(54906003)(86362001)(36756003)(26005)(16576012)(316002)(4326008)(4744005)(38100700002)(53546011)(5660300002)(66556008)(7416002)(66476007)(186003)(6666004)(6486002)(2616005)(508600001)(31686004)(8676002)(956004)(2906002)(8936002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OThFd0dMbk1yQ3ZibzZKV2pFNHFHTUVSVGtmRU1kOVYzTnQ1RWdNenRvR1F0?=
 =?utf-8?B?NkgzL1gzMkYxM29aVWkxcWltOStORFdXM3l4cGx3ZDBBbGl6UDBvOWxaRFZi?=
 =?utf-8?B?YUlOYlg4THR0Z2d0R0xGa2QvYUZvOFB3SndsRTNjbXJ1Zk8rbXF4UlB3MjE4?=
 =?utf-8?B?aXRLb3BQZ0d1RzVCanpjQndoWnR4ZVBES21nVlFiTnlkMno4VHROZ1VUdU5q?=
 =?utf-8?B?eG1PT2llVjNnODhpcE9hUC9TeEFsK1FjN1dNOEtMZjA1ZUFtWnRnNERmdDlj?=
 =?utf-8?B?VWpZVXRobmJXa3FRelRtREJRSG1NYmw2L0ZKcFJXczRGeXQwdU04bFl6NVJI?=
 =?utf-8?B?KzRadEF3U1MzSENkVGkvSnJKQXFreDZTYTZJa2ZCVEJyMllIQ0k2bVU1MERY?=
 =?utf-8?B?K0k4TFBzd0V5L1ZSMlVURzRxbW5IVlY3ai9kRFNzZWQ3M2ZaMFl3YkkrS3Nw?=
 =?utf-8?B?RS9yR0NnSW9ha3hnSkpuYU40cEFrSnI5a25KbDdwcG1VZjhKMTVuYnhBdlhn?=
 =?utf-8?B?NVJ3QzUzVDF2Q2RmWVNiZEI0SUtqVWpzSzExT0xabXlqQk9rWHpGRk9zcjdn?=
 =?utf-8?B?aUcxZ1lVRWVEZy9JQ243MFlVa1dtVzdybndDdGZNMmI4UTdnempRVGdaZnFW?=
 =?utf-8?B?cVQ4dkN4VWQrc1U5cUtUem1HS3VBNkRGUDEvekNqNWhUckJnbFpZNnRuVi8z?=
 =?utf-8?B?Nzg0WDd5NWppbENFMER6SGpsZ3JEWVFLamsyUmZETGJoVFJ6VjFtUHFJZVFx?=
 =?utf-8?B?a1o0U2d1K0NKTXFBOVU5cjhjL3BBUGNZdHhRM1VaU3FFWWRjZWxqWmhzaER6?=
 =?utf-8?B?VWpWVzh1WkNjRWs3d01pREFLamtGQmRWb3JIdjloWlNFKzR1bWVVK3d2ODBB?=
 =?utf-8?B?L1FRa0wxUkpPVkRtTkdqMnNBZEZZaURRZmRsZlBsQ2k4Q212ZU5pb25DQ1Fm?=
 =?utf-8?B?VndzeWg3Z1BySEJZOTNKMmRhRGU0S1VlRHFYaWtYT1JDelVvOGlkb1h1SU1J?=
 =?utf-8?B?UER0Z3liYzNkL3FCMmRITGhxOFVXYkhHVnBNN2Z5ckFOQ1ZLWks5TWdCbjBl?=
 =?utf-8?B?bXVVeEM1dDJnSmN0U0tuaC9rS2x0bWlySGMvSDZxbUROYmtTMVN4ZXFpRFcv?=
 =?utf-8?B?bml1ZllzdEFrVG1yeTh6b1piZmJPaWFnbllWYzFPczl2OW5ibVJUUHZlQmw4?=
 =?utf-8?B?bGVwUVg0ZllXcWozam1YVDdYYTU5eER1bUEvbC9OdkJVUGJWeksyUldMdDNn?=
 =?utf-8?B?UDRkWmpVNk11UmpaazMwbHhjd0FYUXU3YzNQaFB5OFFwckdlUHY0SXpjd3RX?=
 =?utf-8?B?ZGdiYTM0SHp3ZTNLVWFTa21JbnJRd2dobHV4VzlTWXNNZjRDRVpEYXlQQVJO?=
 =?utf-8?B?QVAxSUtVTmR0NEZWMmh0ck1QOTZLbWoyNUE0NkdKbEJJVkZBMm9uTHpQK3FS?=
 =?utf-8?B?UEFKUzIxd21wYU82SHBXOVh4b0JmbXUwYlhnMFg1KzRZRDJES1RtSkwvWm5R?=
 =?utf-8?B?eHJmUXdQc1psaWNOMEdLQWVmbDR6OUhyNG9UVE8xK0FWcVgrM1N5NlArYzhr?=
 =?utf-8?B?NUNFazlTelBJTTFBVVd6cEhQM3gyMmlxZUVxTWN0Z3A4WmJ3T0hTYkpZNzFJ?=
 =?utf-8?B?aHQ2RW9YWnpxZzNPUDAwUHpxNTd6QzA4YmJRU0pWeWxlQ3RXSmNZcE9QUm9Y?=
 =?utf-8?B?TnBrWjF1TXlaa2FhcENlRTBWY0tyMXhBNWZHVWlmVEJPUVpDdmt1TnYwLzYr?=
 =?utf-8?B?cXdJUDkxUk91SU1zcnB6NlUxTGloVmg5TythUU96Q3RWSUdpRkF4ZmFJWWw5?=
 =?utf-8?B?ZVFvQ095Qy9rODBQbEh3Y1R3djIvbnFQa1Z5cXdKcVRTYTFGWWIveWRiYVFL?=
 =?utf-8?B?UFNRQ0ZZVkRaSk43NU9xK0E4bndDQ0VmbnYray85S1RLZUtNNk5KTHJYY3Fr?=
 =?utf-8?B?bS81S1Y1ZkkvZ1U2NXZpdzFGQkZEcGlJd09UWSs2S094alpKcU0vOERQRTRp?=
 =?utf-8?B?bFJ2WGg1VnRWQk91YnNrQkZtVUwzZGlhMm1id01HOUJGVXFzbEVXYlJhMGkv?=
 =?utf-8?B?cTlGbGlDSzd0L1k2Q3Q2N0F5dGo1dU1GVHZGUHRUTDhCVXZ1VGlMUUdxeWc4?=
 =?utf-8?B?V1UzeHJFdVZBSnliU1pyZmNEbGZGbWhwcjZFTlZxY0pZdUVQV0tDcnlXOWhN?=
 =?utf-8?B?aVByaTZRUzJxNlRwUmJBelE5VVZMTHZmYldmRFBYTUZUQjloYmF4dWlxZWxV?=
 =?utf-8?Q?0pNWNvcUkdootFb80tDS9FfVxannwQNhRRFbYdvvOk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28178ce-44ba-4509-958b-08d9ae040168
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5020.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 22:04:07.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3naG5B1AGMqvwMauhooMFV+Z6UPJztU7q+EVM7KpQ9zbX+SizPo0CiLb9tuWLeU4LrfoA9QAL6BF7tkmhpAQBYxpX9tQUpxc1nan6F/gAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4956
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10176 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220110
X-Proofpoint-GUID: DdGrCZAsQ_QH3Cn225y0FGjJmKHZvuyX
X-Proofpoint-ORIG-GUID: DdGrCZAsQ_QH3Cn225y0FGjJmKHZvuyX


On 11/19/21 10:39 AM, Juergen Gross wrote:
> The prototype of mem_map_via_hcall() is missing in its header, so add
> it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: a43fb7da53007e67ad ("xen/pvh: Move Xen code for getting mem map via hcall out of common file")
> Signed-off-by: Juergen Gross <jgross@suse.com>



Applied to for-linus-5.16c


-boris


