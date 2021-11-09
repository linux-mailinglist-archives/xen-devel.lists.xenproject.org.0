Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715244AEC6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 14:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223928.386895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkRD3-000444-Me; Tue, 09 Nov 2021 13:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223928.386895; Tue, 09 Nov 2021 13:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkRD3-00041j-It; Tue, 09 Nov 2021 13:30:45 +0000
Received: by outflank-mailman (input) for mailman id 223928;
 Tue, 09 Nov 2021 13:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=20ed=P4=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mkRD2-00041d-OQ
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 13:30:44 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a93e958-4161-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 14:30:42 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9DEUPH017394; 
 Tue, 9 Nov 2021 13:30:34 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6uh4ju20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Nov 2021 13:30:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A9DUMZL127807;
 Tue, 9 Nov 2021 13:30:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by aserp3020.oracle.com with ESMTP id 3c5hh3kjs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Nov 2021 13:30:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB2883.namprd10.prod.outlook.com (2603:10b6:208:73::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 13:30:26 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::3c49:46aa:83e1:a329%5]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 13:30:26 +0000
Received: from [10.74.106.187] (138.3.200.59) by
 SN7PR18CA0012.namprd18.prod.outlook.com (2603:10b6:806:f3::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 13:30:23 +0000
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
X-Inumbo-ID: 3a93e958-4161-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RZ0Smk+mke277yOyQqGhvzEK97JkpfXatF9W30pc5FA=;
 b=Uk1IVEoETxGFpSYr4B+WYFqh5msa6KRNnwHgNJVh3Z5OqZv8R52ZMtOfRk0fLhzcqLYY
 tbCudXw5/NfSmMiaGuysqSiZih4GK0H3BiyIse4DDGif0hHMutjoD7hZe89r7zAnvyDA
 vutd1ieyEOFsjKn3L7pmb5CwY0p5rmm51oNKPs6SAkTu5PiKISMr/kGBtUSPFK3gBWWq
 VDQ8cx3VOjcvWe03NDJdW1E7elrNtth7tHVePScTiSyD59S+XnKRl6yZpgFptZ4kUPem
 9cESp7XTrVyimhHU0WFIznchdx2olYFJxpEnKExPftK96ody2BE8dA4RNhRlI9kzHz6J 2Q== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+CWx8+fMDmmnE/wl+VmPAxoj5R1p9xTNvS71JoKiubbtb1bQxkIFE7znxDX+vwwIoLR/4hhnBhRRAImZTsmd3U8cfKVVg942NV/TbOqqp+eTUuEXglQII/L/oTf8HoBKOcDgYfNw2+1lHtLXRq66J/By0WF8LXDeLZODb/yKJknyPTHRPlZ5cdrq+SVtvvJyR6HBmoRPo36bGvgItc4ZQAddpDsQepJMMTiI/C5UEUeVMFN4gisQ668TDngvYtcWjZQM0CysrUp70SZvzZUlDe/B70VFMfRAs/qQAjNd/ePvFjVGdKgjFdCxlkObRoLlQxyXxuGxjp/bOSvnZ3D+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ0Smk+mke277yOyQqGhvzEK97JkpfXatF9W30pc5FA=;
 b=C4Nfglvq1QymUfYVIkaVBXaq2l/YnkidbTi6U6dfiDLR1g0WrE8SSaikZu9Hyh0aSvXrW4d4d+N0ucvve5jmT8w4z6DqT0x3jwBOzu4tLGJ00uKbag6J66ktT2V32IrsK5mAk2m5T6FzpkHkBP/1D7wK5EbLwzVaekSZj/m9mWFbMTWAV+SoNpHIKOR4C9+uKgXs46idIj0DKlc6lv4qAmvBSy0NljLikqf/lAxLMZro8nZoskrw6VK4njWW4dbeYO0hwGpUKUCThqzya0XxkZy/uu3gtxtr1MhQ26aMOUzVD8BKCJsTyoXFJrDAu/STGq/WPzp2S9Jl2Fsd5Yxxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ0Smk+mke277yOyQqGhvzEK97JkpfXatF9W30pc5FA=;
 b=f6RbKL10bfQpyZQ9wtGmstrFdxmfCIzK6ppfubHYNy2sjDpJcuql/ZJ20XRz6Dr2eAu4ZUfHAJZxveN0/1bbYayYYf/8D/vYH9NQYyrZuRZxggL93oPFH2mo+BUEyZyj90iZXxyHGKZgHhHq9R4Z7A+MJd5kpykIrdM3zhTiukU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Message-ID: <961b14d5-db54-43e7-a816-1c12ceede49a@oracle.com>
Date: Tue, 9 Nov 2021 08:30:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/balloon: fix unused-variable warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Juergen Gross <jgross@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
References: <20211108111408.3940366-1-arnd@kernel.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20211108111408.3940366-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0012.namprd18.prod.outlook.com
 (2603:10b6:806:f3::35) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f4fffe-ca02-4da6-07c6-08d9a38516dc
X-MS-TrafficTypeDiagnostic: BL0PR10MB2883:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB2883556020EDE8BFADE544FF8A929@BL0PR10MB2883.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D9gTnEA5SR5hGWcxy4vusXC5ZYQlgSCalHynC5FvBKUQJaMHgdAFq67Lfn4jB3KnIcORASoryr/MIhrCNaLSeAZL792nNUfINZbCthzEf1cgaLTsuwj1m+erP3qMdzJnIcOQz9MG5Ai5C9rQm1Rd6Xqsodt1Vlvl1uFhkmQNVL5T98f2JUne4KaYq49U03MCftZi3zx02fOC4xktADofDubt3plRUmled9ThpQblVL83mlOGbW/jLnr6sGvlqLtT4TtbEaWYKIfkMr92J1YhPoswAUhe/A3C2pNr4FCYVCaQyb4VhJuzWxohRefNCyQJqOAVP1edm4+eGCqwXBJeIhcwo11Ngl0tHhP6O0znN7jpliHy2Ozj2W01fe9la6mpiDFhP//8O7Jekw6O02t6xCeRFriZM1Nnywnfot5StJ21qRyPKux5N6+h60kFLDRNFbMZ/CDQ4LX+JVqSYDZM7ouXgV7AMoGQlSNQ3GxhxWs8De0ETveAoM/Xp299zy14EDklQXwDPg8fod//bzwSsJBI1C5DySeUxFLBJcuZlQooYPjl7PITJRJe9E6pXXjLkWUM2I4d+jLqpHYObj0W5eyQvYW0A/yzIxxbNfmE2Kr4NYNFXVD41SdWUrTK0R38YDamxoeyZ9wKm2Iq9c+77td7pQq/SO0LW3mePjiDbYE6uHZkLPu0Mdv67A7Rhb7E/bOLPhnE2b2vB+r9HA07s23DFMcY/6iWRqDdWOhQu3KCY6PPmTPGEIWpXIvXR8GM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(2616005)(6486002)(7416002)(83380400001)(38100700002)(4326008)(66946007)(31696002)(956004)(66476007)(8936002)(36756003)(66556008)(4744005)(31686004)(316002)(26005)(16576012)(110136005)(5660300002)(54906003)(508600001)(2906002)(53546011)(44832011)(86362001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTNYK250c0NOU1F3T0FlMlZWRUNnRHdZSDRDZjdHRG5DYUV0bTZDS2JOTUc1?=
 =?utf-8?B?WGFOTFN5VXpLMTZzYklkMnRBdmpSeTdtUVVXakxYbTVwd3pEaUhLY0RMNEtk?=
 =?utf-8?B?MnF6aHlXdFhuTnQ3UzNUTG9Ndmw2RjVYQlVDcWM2cG9TVTBqU0tZZndyN0hE?=
 =?utf-8?B?QUtadDQxM0Y3RTNvMitQbVE4UjQ0eEF3Y3lONG5DUXhwVlJqWGFvVWNlcXBQ?=
 =?utf-8?B?Q1g3dDZ1eXpZWVNqN2hEV2dTQW1INDdNQWppMkFCaFdzUnNaaTlOZHJ0dGIv?=
 =?utf-8?B?T0VsdjRiY3NpMjJRNStJSjB6Q2kwVUovSzh4OXRGZkNuTUF4bkRIbUZnV0ow?=
 =?utf-8?B?dkpVV0VDelU2Z2p2U0p1SXVoUVdqWmpmb0YzQzlVUG5tUUs3WUJ6ekhyUTN6?=
 =?utf-8?B?TEdIUmVhb0EvaU00ZUZWT0tZaHQwb0p1NkhtL2RiM0xHZUtDaG8wcCsyMlZk?=
 =?utf-8?B?bmdLRHZleUQ1VTVsZHpDUXN0MEdQc01BN3RBM2drQiswMjlFYUlHNm5TNUxW?=
 =?utf-8?B?ekJtQmUzdmw1TG1MU1Rnam9pektYbnAvYmZhNFl5YkxOLzVQUGl2VkNJU2xQ?=
 =?utf-8?B?ckZ4WUVLZDgxVjNRTGdEMHRIVUZ0dk5kTW5PSGxZOCttcE1XN1RiSFEyekRh?=
 =?utf-8?B?VWw2L1ArVXpQMlV0czhlRlJTRlhabVc1bFBGQkRBWGtMSVE2Rm5zZWVob1hW?=
 =?utf-8?B?a1BLc2VsNnNFb3k3SjRVZkZpbTR2ZVlvWS9MVUVnM2d3cnpMWW9NWmFqeCtt?=
 =?utf-8?B?YWtuOWhhQWR5Ull5VEVxVjJhMkFSU2hja2JvQnQyaENSVGhYZzF3ZXVqWEtF?=
 =?utf-8?B?d2NyUFppaVFHc0VuM3M4S2FxNmdxUFhBOTdNVm1BRzdHSzlEbFdJY0hFbHp4?=
 =?utf-8?B?SjFMUDhTOHBGc09ZMGFyUUFXd0NQeE93bjBWMFdveTZPSHRkSmRXYlZZVEUv?=
 =?utf-8?B?WWRFZ1ZRTUZQQ0Vqa2F0bk81OGd0em9NTmw5Z0JvM2xiOCszVk9vYlovcG52?=
 =?utf-8?B?VUduTjRtZWhlS0E0emZzL2dsa0sya29PQ002RERwUGJMQ3QyRmpKL2FJNm9a?=
 =?utf-8?B?czR2WWt4VmM5c3lRNnJ6T1lZNzdFRHdnWENRNlR5WnhCc0RWUXcvcHJCalRq?=
 =?utf-8?B?b1lITHJSbVFKWHRONzhFZmZNekNVanZ6QklMSzJEWmkySU41UGEvbVZSeFE2?=
 =?utf-8?B?SWovZUE1c0tSZ05CaVRlaXNZUXFmSCtHaXYzOElWZisrTGFSVm9EcGNsR1Zv?=
 =?utf-8?B?VUt2emQySmlKbDFJV3ZjQTF5YXFaSlRQN1ZIQVF2UzhxYjRTVkpTN095d3NK?=
 =?utf-8?B?TGVxazR0UjRDL3hTWGQveitOU09hUUNYVkN2MENLNGVpL3kyZU9SdVZSQzBC?=
 =?utf-8?B?NjYvdXFMMGFDZjJ4b1IyVEM3aHJQdzlpY0dDcnBOMTcrdlYzWVZRdHFlTjRK?=
 =?utf-8?B?ckJnemN3NlNoK2trUGZnbllvWVhGOC9udmRLOUh5b2pseitqQlRxRVdHSHF0?=
 =?utf-8?B?cHA2QzFLUU40OFphUGJlSXRXT0lxQ05DMGk1N3MxcGhVQWZjOENKVm4rUmcw?=
 =?utf-8?B?clBlUnM3UE1ETmxNTEpZMGpmZmZMNW9NZm5CZEpZN09ZVVRldndKMWNXcTlW?=
 =?utf-8?B?cHNZNnZqSUUrWGIrRUtlUHdmWGVtYitEditWZTNwc3N5aEJhTndUdFF6WW5z?=
 =?utf-8?B?MVNhcmtkQTFmNGI2K29yT2dQcEt2bXFqdUVuYzQvaHM1eTJ0aWhKaFRtQ2Z5?=
 =?utf-8?B?dnpORk5GMG5zejVVT2JyTS8zVUVwT0M3UHJGYnF0Rk5TajYzQWljTmZUWUJ3?=
 =?utf-8?B?R3Z2TnhVUGZ6dWFOeFVrczk3SWRSWEZjN1RrRE9DVExIRzhZcHNNejlkYnRE?=
 =?utf-8?B?UGZ3TkFUZlJWWGNXWllaait0SFZEL2FSRGYyOXh3QjAySU53dTl6cVhQWnFp?=
 =?utf-8?B?eVdnemQwTlkvZUE2RXhDR2NMVWJLK2VBNUx5SFdPcUxXUTNDTTVKRWs5Qmor?=
 =?utf-8?B?MWt6S0FZZ2taVk9TWkN4bU05UHJqWW8zL2dMZE9HTXVFWm5kRE43ekhUa0NX?=
 =?utf-8?B?UjBxamE0MGNWT0xuZmw3TXliZGtOeWpqUkh4NDBxMExIR0pFQTJPVHR5VDFl?=
 =?utf-8?B?K2MyQk5lZFN6SXhURS9VYldpUGRQeXMrK0h4eWFqb3hoRUowN3dXaUxXaTh2?=
 =?utf-8?B?T0pHTmFKY2hkU2FpL2lzRmJyVVlpK082MUpzQjhDbXJFdzk3WWpIU2sxMVlq?=
 =?utf-8?Q?JmNWIVnGftQrM2kuuou8i6CD3LMigmY6iafInf0f9Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f4fffe-ca02-4da6-07c6-08d9a38516dc
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 13:30:26.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ao0/itf9l356jPNjin/Dv68+8qNoF5Ph/Zyz2qXC6huN3Rt+1vdMolUgH0qQycfWqENQjqoMi16zc/jGKk8MYdIlHi/6TNeNu84yckcqqyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2883
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090082
X-Proofpoint-ORIG-GUID: P1BuFuZVR0Qkx9f3gk-jZTQs0qXZSGyx
X-Proofpoint-GUID: P1BuFuZVR0Qkx9f3gk-jZTQs0qXZSGyx


On 11/8/21 6:14 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> In configurations with CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=n
> and CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y, gcc warns about an
> unused variable:
>
> drivers/xen/balloon.c:83:12: error: 'xen_hotplug_unpopulated' defined but not used [-Werror=unused-variable]
>
> Since this is always zero when CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
> is disabled, turn it into a preprocessor constant in that case.
>
> Fixes: 121f2faca2c0 ("xen/balloon: rename alloc/free_xenballooned_pages")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>



Applied to for-linus-5.16b


-boris


