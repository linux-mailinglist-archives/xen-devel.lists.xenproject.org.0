Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3733DA5BD4A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907656.1314862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwaD-0007u7-56; Tue, 11 Mar 2025 10:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907656.1314862; Tue, 11 Mar 2025 10:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwaD-0007rv-2S; Tue, 11 Mar 2025 10:11:33 +0000
Received: by outflank-mailman (input) for mailman id 907656;
 Tue, 11 Mar 2025 10:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72vt=V6=amd.com=Luca.Miccio@srs-se1.protection.inumbo.net>)
 id 1trwaC-0007ro-08
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:11:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2415::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32bbeb78-fe61-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 11:11:30 +0100 (CET)
Received: from CY5PR15CA0065.namprd15.prod.outlook.com (2603:10b6:930:18::20)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:11:24 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:18:cafe::58) by CY5PR15CA0065.outlook.office365.com
 (2603:10b6:930:18::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 10:11:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 10:11:24 +0000
Received: from [10.252.149.239] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 05:11:22 -0500
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
X-Inumbo-ID: 32bbeb78-fe61-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2GEFBettdIK/3/RehVR+q7KGmUsOSGfC08uBPO8GYyGroCcIYzbXRQOueX7MzmJKHrmC3AIn9m8Zie7M0LqTuPzvBfSYJWfohBlWxHQYhTwWmOcSE47RblZC5b87GkPLuKv37fl7s7iB2qzk2osKP+RC0gQuBC9R6G205a1BSYrEToOneszeLC+B6kmX1pl5ZKBOxN137Y07w+TTAWBcB8Q+0bFXUC97drfPRV1jm16pB1PRORzCmeDV6Rg7D8LcfSTt8PkWIhA+jEck+sZ8Ej0uq90CAVb+l24qIFQ3m6KKvjsuNPsIufIzgskPozgSdR/kP74o9oCGEEqEIXEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E79lLws45ZBEe6luJS6Y165zfndfyoNjgEp6F3PC4J0=;
 b=HdFWPvf+MeaaFLmhxspzG8g57le2LVRq4D2G+vjxYMBMlytB7sJ7AjoONsnPVAK9SZYhAUdO1TO+lj16aT8HD72HhvIdaR5CUn2wmHeK6o/93/sHqJtbThgLPJqGq8ULXfze8kEl1jL378wkfGv7atOIDNzu+vtUm3HwZSostJbWHY9JT0aYo0OTrH9KMlMx8C9+if5cVIgeAKXK/YHMhwWl48IqQnKgTWwVN7jGNgglBrlpAKIbe0+N7qq4eKPfjvsrz6YJrSLXZPMX57W9858oeNGW1WQLKLxXhIsPT3OFCZYo+NAiEwi8a/qsVFuILO+s3DW0ABbXkpvKxKPuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E79lLws45ZBEe6luJS6Y165zfndfyoNjgEp6F3PC4J0=;
 b=h6WkTff0NvSBXZHC7wPA5WcSHUtjJXHhakob6FzfRzqE8evqdFxHLHW9U4S1yVLnuRgb8v7kB6NYtcUUjohAC6PxY/VqBRfMpio4JsFX6RA0MEmWTlbIc+cpYRLyEOlVcy3MQQ5qnzJpK4oyxqqTSQDIfsEqjktVSxKf7Cevp+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <42aba4f1-3aa5-47b2-8e74-b20d3fe0cb35@amd.com>
Date: Tue, 11 Mar 2025 11:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] uboot-script-gen: handle reserved memory regions
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>
References: <20250228150733.3945774-1-luca.miccio@amd.com>
 <alpine.DEB.2.22.394.2503061606020.2600338@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2503061648360.2600338@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: "Miccio, Luca" <luca.miccio@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2503061648360.2600338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: da70dbd7-fa8d-40ed-b637-08dd6085143c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnB3ZEtGNy90SmFBbHlKWS9Pb2xtSDdYalFOd1laR3FTNTdRVVlXTk9DODdH?=
 =?utf-8?B?Qzh3MEo5WSthK3lMRTEweHFDVjV0OElmcVVDUW1hRlZnY2MxNGVvRHYwelN6?=
 =?utf-8?B?VzB6THI2ZjVLRmhmalIyVTZsOVQyU0hqYVVwYnpubk5GZ3JSM25RNFlLRHJK?=
 =?utf-8?B?OGY0ZU56YjlVcHM2QzJWSGRsVjMrRVZSTmVDdTc0c3JBU0t1OGJ6aWJwUUdV?=
 =?utf-8?B?Z09wVkNKNHVvZVdzZlJIZzFqK2syVEZHM0ZPaHUvUjFxcCt0aEZVOG83NW1r?=
 =?utf-8?B?TVJxYnVOWFppd1h5V2RqQm9KT2RSSEVPWmVRUXYraEVCK2ppc0hqaU1kVFRR?=
 =?utf-8?B?VTlPRG9BTWE0S2YvZmlUWTNyUjVMVXBGbDRCdy9xWXRGYnhIL2c1SEpNcFlM?=
 =?utf-8?B?dUZVN25hdEV1R3FScTR5QjcrNkt4WHNQVkJ4d2lVV3RsS0xsYkFKV2U5UThN?=
 =?utf-8?B?UXB6elVXejdHRmpmczg1M2N0RHNTRkwvUTZ0VUhUK25TK3FLaVZTdTVodk5K?=
 =?utf-8?B?bWgrWTQzdTI2VDVnckdCZmZibm5nZHdTZjRmN1ZKUTh0a29RK3Qwdi9acDdR?=
 =?utf-8?B?b29QWXoyOWlVMUdOakFqcEFvbWx0VW5xdTIwRWlhNTVPR2Z2UjNlMHpVakI5?=
 =?utf-8?B?T3VMMTZzK09TaVpMdnVwQzc5eW5iWTN3THFQYXVMcUtUN09zSy9XZnFpbHRN?=
 =?utf-8?B?bXorY2pTYk5ETjhXOXhpUk1jMWRWdm5aaG9mK3ZrUHpKSUxIRHBNMlBVUWQv?=
 =?utf-8?B?K3JGZ2VWSVFSTUNIQmh1MEpZVnVLS1UwaTMrM2ZOYXpHTERzNjdVN29NRmo2?=
 =?utf-8?B?alRuQjc1d2Jialp5OEJnMWFpTnJTTXlqMlk3ZlFPbUE4RTdkNjlLNFNCT0pa?=
 =?utf-8?B?OFF3QURYRGpmc3RDVFVjMTh6bE55VDhkOE9aVmYwQ0s2eXpCWmpvcHB4UDJh?=
 =?utf-8?B?U2EwVUdLbVJTNGtINWZEbGo4bkgxWlhaUkQxUmlGT0hXdTFhVlB1c3h3Nloy?=
 =?utf-8?B?MmszbThiTktvcU9NTUFFSjRLSjFzVUk3Wm0vRDFRTkNtNERTTFFLSkg3OENG?=
 =?utf-8?B?b2hieDBZR0hUa2ZuaXI1WFdtTURsVWdzNksxRzkzWUlPc3QvTFp5amdPeE1S?=
 =?utf-8?B?VmlwN2o0QXFtdjIzQkFrZkhiSVNndnYwbzliVXVQa1NJVFpKWXdaRy9MczRJ?=
 =?utf-8?B?TFpsNTZLOFFYeWluQXN0czUvRlEwRHg0ZllxT0lxUVhLYlk5WUNORGU5enVH?=
 =?utf-8?B?QmFNZ0UrSGx2NTRtcUNWQkR1MHM2dEtsK0lGN2UyeHI4Zkd5VlZKQlRoVmQz?=
 =?utf-8?B?T3B0YjRDYWxybWltL1FVZDJrWmNxSlRDL1VBZklQNXJvTGtiekxNaEpQUW5K?=
 =?utf-8?B?ZTR6aGFXbEwxajA4aWJ5U2FQMG9OWVIwR2VXaGNmKzR3d1c2V2JndWxKTEpo?=
 =?utf-8?B?dlMvYXFVc2hOTE9RTU54RWMyMHJTeFAyTy9rN3NlZ1lMUzlpb2pyRTA5cDVS?=
 =?utf-8?B?Rm1wL2dRSllJUSthVlZXZklMMU5yNVNKRlZCTUE5RThpYmN4RHI1QzkrZEhD?=
 =?utf-8?B?TjZmOTBpemFMWC9pK25SMVlPVnR2NEtYemZaYk8zaWNEMmpnNVY5aVF0RW91?=
 =?utf-8?B?SEhDazZ3UGVBTFlSWjc1NGp3QmllTno3SVJ3YW9La09IUU5RMTJ6TFRNejR2?=
 =?utf-8?B?eUdkcHRrRW9iQ0NObUo5eEM5U2N5M2ZvcUlkUTYySk5uREZtUTVSYWpwQnk4?=
 =?utf-8?B?bk85cGp3WndnSUNaUytFVStSSmw3YjBpZVBMK3pucTRhcFhQZzBVU0lvcXBC?=
 =?utf-8?B?Z2tRM2dKUGsxdUZXTzhFc0cwNnZUMGJTOHdURFIyWFo3NTlmNE9JalRIcWdm?=
 =?utf-8?B?OCsvOXhKeXNpRWdzNFBRVVliTzZ5Z0tLN2JUZ0FSOUhtQ2tXUUhGR0orU29Q?=
 =?utf-8?B?cjlLZXdVWEJhdExwNXg4d2U4T3M4SHc1T0ZmZXdrVWwrSmZzdG1ab1hzQXdW?=
 =?utf-8?Q?PoHfocl8D2tKqMbKrklF7SiMsr8Su0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 10:11:24.1355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da70dbd7-fa8d-40ed-b637-08dd6085143c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121

Hi Stefano,

On 3/7/2025 1:49 AM, Stefano Stabellini wrote:
> On Thu, 6 Mar 2025, Stefano Stabellini wrote:
>> On Fri, 28 Feb 2025, Luca Miccio wrote:
>>> Currently, the uboot-script-gen does not account for reserved memory
>>> regions in the device tree. This oversight can lead to scenarios where
>>> one or more boot modules overlap with a reserved region. As a result,
>>> Xen will always crash upon detecting this overlap. However, the crash
>>> will be silent (without output) if earlyprintk is not enabled, which is
>>> the default setting at the moment.
>>>
>>> To address this issue, add a function that iterates over the
>>> reserved-memory nodes and populates an array. This array will be used
>>> later to calculate the load address for any given file.
>>>
>>> Signed-off-by: Luca Miccio <luca.miccio@amd.com>
>>
>> Hi Luca,
>>
>> Thanks for the nice patch! I was waiting for the 4.21 development window
>> to open.
>>
>>
>>> ---
>>>  scripts/uboot-script-gen | 59 ++++++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 56 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>> index db2c011..cd0d202 100755
>>> --- a/scripts/uboot-script-gen
>>> +++ b/scripts/uboot-script-gen
>>> @@ -468,6 +468,42 @@ function device_tree_editing()
>>>      fi
>>>  }
>>>  
>>> +function fill_reserved_spaces_from_dtb()
>>> +{
>>> +    if [ ! -f $DEVICE_TREE ]
>>> +    then
>>> +        echo "File $DEVICE_TREE doesn't exist, exiting";
>>> +        cleanup_and_return_err
>>> +    fi
>>> +
>>> +    addr_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#address-cells')
>>> +    size_cells=$(fdtget -t x $DEVICE_TREE /reserved-memory '#size-cells')
> 
> One more comment. If the DT doesn't have any reserved memory regions:
> 
> Error at '/reserved-memory': FDT_ERR_NOTFOUND
> Error at '/reserved-memory': FDT_ERR_NOTFOUND
> Error at '/reserved-memory': FDT_ERR_NOTFOUND
> 
> It would be best to silence these errors
> 
> 
>> missing "local" for both variables
>>
>>
>>> +    for node in $(fdtget -l $DEVICE_TREE /reserved-memory); do
>>> +        reg_values=($(fdtget -t x $DEVICE_TREE /reserved-memory/$node reg))
>>
>> missing "local"
>>
>>
>>> +        for ((i=0; i<${#reg_values[@]}; i+=addr_cells+size_cells)); do
>>> +            addr=0
>>> +            size=0
>>
>> missing "local" for addr and size, and also i and j
>>
>>
>>> +            for ((j=0; j<addr_cells; j++)); do
>>> +                addr=$((addr << 32 | 0x${reg_values[i+j]}))
>>> +            done
>>> +            
>>> +            for ((j=0; j<size_cells; j++)); do
>>> +                size=$((size << 32 | 0x${reg_values[i+addr_cells+j]}))
>>> +            done
>>> +            
>>> +            addr=$(printf "0x%X" $addr)
>>> +            size=$(printf "0x%X" $size)
>>> +        done
>>> +
>>> +        # Add the reserved space to the list and avoid duplicates
>>> +        if [[ ! " ${RESERVED_MEM_SPACES[@]} " =~ " ${addr},${size} " ]]; then
>>
>> I think this is too imprecise as a check because it would match with a
>> similar element of the array with a higher number of zeros. If I read
>> this right:
>>
>> 0x1000,0x1000 would match 0x1000,0x10000
>>
>> I would either remove this check, as it might be OK to have duplicates,
>> or I would turn it into a proper numeric check, one item at a time in
>> the list.
>>

You're right. I would go for the numeric check and avoid duplicates.

Thanks,
Luca

>>
>>> +            RESERVED_MEM_SPACES+=("${addr},${size}")
>>> +        fi
>>> +    done
>>> +}
>>> +
>>>  # Read effective image size from a header, which may be larger than the filesize
>>>  # due to noload sections, e.g. bss.
>>>  function get_image_size()
>>> @@ -505,9 +541,24 @@ function add_size()
>>>          size=${image_size}
>>>      fi
>>>  
>>> -    memaddr=$(( $memaddr + $size + $offset - 1))
>>> -    memaddr=$(( $memaddr & ~($offset - 1) ))
>>> -    memaddr=`printf "0x%X\n" $memaddr`
>>> +    # Try to place the file at the first available space...
>>> +    local new_memaddr=$(( (memaddr + size + offset - 1) & ~(offset - 1) ))
>>> +
>>> +    # ...then check if it overlaps with any reserved space
>>> +    for reserved_space in "${RESERVED_MEM_SPACES[@]}"; do
>>> +        local reserved_start=${reserved_space%,*}
>>> +        local reserved_size=${reserved_space#*,}
>>> +        local reserved_end=$((reserved_start + reserved_size))
>>> +
>>> +        if [[ $new_memaddr -le $reserved_end ]] && \
>>> +           [[ $((new_memaddr + size)) -ge $reserved_start ]]; then
>>> +            # In that case, place the file at the next available space
>>> +            # after the reserved one
>>> +            new_memaddr=$(( (reserved_end + offset) & ~(offset - 1) ))
>>> +        fi
>>> +    done
>>> +
>>> +    memaddr=$(printf "0x%X\n" $new_memaddr)
>>>      filesize=$size
>>>  }
>>>  
>>> @@ -1373,6 +1424,8 @@ uboot_addr=$memaddr
>>>  memaddr=$(( $memaddr + $offset ))
>>>  memaddr=`printf "0x%X\n" $memaddr`
>>>  
>>> +fill_reserved_spaces_from_dtb
>>> +
>>>  if test "$os" = "xen"
>>>  then
>>>      xen_file_loading
>>> -- 
>>> 2.25.1
>>>
>>


