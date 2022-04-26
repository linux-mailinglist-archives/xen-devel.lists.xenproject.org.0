Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A65F50FBB3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 13:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313811.531571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njJ2w-0004ma-Um; Tue, 26 Apr 2022 11:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313811.531571; Tue, 26 Apr 2022 11:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njJ2w-0004kl-R1; Tue, 26 Apr 2022 11:07:54 +0000
Received: by outflank-mailman (input) for mailman id 313811;
 Tue, 26 Apr 2022 11:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BNuI=VE=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njJ2v-0004kf-4X
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 11:07:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf6ae52-c551-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 13:07:51 +0200 (CEST)
Received: from DB9PR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::35) by DBBPR08MB4363.eurprd08.prod.outlook.com
 (2603:10a6:10:ce::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 11:07:49 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::b8) by DB9PR01CA0030.outlook.office365.com
 (2603:10a6:10:1d8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Tue, 26 Apr 2022 11:07:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 11:07:49 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 26 Apr 2022 11:07:49 +0000
Received: from 4ffcf29158da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 680C3B81-ADB5-48CF-8C9F-15F77D8E4F01.1; 
 Tue, 26 Apr 2022 11:07:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ffcf29158da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 11:07:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM8PR08MB6369.eurprd08.prod.outlook.com (2603:10a6:20b:354::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 11:07:39 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 11:07:39 +0000
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
X-Inumbo-ID: 1cf6ae52-c551-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5BqB17tVcu5/rRvTTNBFR/32NiBn8L7cdCLyzRYD3o=;
 b=Z6IcTUy8c/NwcOtD9SEn8NHumM+O5mnDSeHozwW74j8i5UM4Jgjcry6p4dpsksblBs2w3Y+WOqi0AQBC5z/rqdb2b7/K0hr4wrd9ogyiCTwwbUIZaVc3kvvmmOdeNM8tpsur4mq96DsWCsdK1bSTwUWZYtBGb0WtUifrzOHO3Io=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 296156087e89cfc3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jprzCejm7E5Qhw1V7RZ4TfxdIdS/dZNCMZDua7S6Af7rZRuCgX+rRn0M2Ed3QB4Un7i8Mz2i4OHjuGmMC1qsOkK1zvlg9eq02G5rGHnVsqEYxtkDvODyoDabgCZCyNg1UjNxxJ6bzW6ExBVxTiLnzjO/quhBif/ur2jp0j+G2QgnbvlCeqN4LSboQTVLlKR1Jat32AenSnzjaytM98ZZCWYtQ4Z7sfmEW1bfavdmvZDzMoHcbDhMeMiILfHbdRDRYUhO93ihUJ+tdpQL2MctQUKB0KmURce7I85WIFHFaHC5xagDKj7/Mr0fTDlUo+folVBo06A0vvDP/vqrLRThSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5BqB17tVcu5/rRvTTNBFR/32NiBn8L7cdCLyzRYD3o=;
 b=NjF1/wsMt+QSzjUfV6OW3qAEDYmGu5cOoBFkgB7GdjD25WqTfjqC/Nk3xPalxCoxLTQ4I1TAdm4UeJ/jvn2TKT9s6Qa7+beT5FkiYVBfLhS1V8859gtmacZ7XETrde/Ueir8hKj7M7uzimdlJ+QZeHicl9/jfh7ergAJx3o+f7Ni1bGqOo2+M8A7i4yxqwMzVGnqbY8tWqvY6fIi1Nff/xBbJ0A89YvOYSNmNAgSVS79GH4SZjuIg0nLWShj2n2Cl490bhW+wK7pAD1AxBr0yb3aeltZEUXsRahvQ9fYBo5N84AbTCpQ2uArHSX5ItJt6uluzZCvIfdPxdqcf2++wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5BqB17tVcu5/rRvTTNBFR/32NiBn8L7cdCLyzRYD3o=;
 b=Z6IcTUy8c/NwcOtD9SEn8NHumM+O5mnDSeHozwW74j8i5UM4Jgjcry6p4dpsksblBs2w3Y+WOqi0AQBC5z/rqdb2b7/K0hr4wrd9ogyiCTwwbUIZaVc3kvvmmOdeNM8tpsur4mq96DsWCsdK1bSTwUWZYtBGb0WtUifrzOHO3Io=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <efc5dd55-0fc9-5741-520e-f98000ddb324@arm.com>
Date: Tue, 26 Apr 2022 19:07:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 10/10] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-11-wei.chen@arm.com>
 <22591300-a09f-1ab2-fd6b-6c4875641035@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <22591300-a09f-1ab2-fd6b-6c4875641035@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::17)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 72356f91-fc81-4ad7-b4e3-08da27750017
X-MS-TrafficTypeDiagnostic:
	AM8PR08MB6369:EE_|DB5EUR03FT034:EE_|DBBPR08MB4363:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4363BA6917C22D4C51C628E99EFB9@DBBPR08MB4363.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wqvI/wPJLao+dV3a/FRnE5M9PlUDZUT3se/cdjZi6Q9yL7QpBEgOqRFRn/PwJ5Sn5B46qCqgT29odjUG1yTpWKHf/SKSQAF9jbBqIPYkwt88fdPVKAmRqKZtH2V+O+rCsKXf3UEVLUj9RiTLwb9ZT2p9FnUvrouNqQRobvUZxClIQkNp6oUjvPDAPhft052bkj29k/N7tFvUMkR2nC8ctXrddNYaNaD64eRA4NAcYGqu1NpydDcTPvx1GO1g8tdjwtELWLy8/3NlKpjRF8ZTZVKlN1YMOBWrkpXb2oWmS5a5hozceSM5/JrjZMpUTOm+PZAZuuuI+833ZPMPiuBwMY0+lkyTRHAT7kgRAWUNwsPytjVYwIJLXhRZeIJi0njcn/UXx548NxEjynVC7gPf4CjFkqA4jZpQBd25DKmFuyZXEdZnrf20Y6AcemVIM7sVqMjB5kFZ/Xt8afde9GEF9CZflHtz17MyT7G2DH2Q991TxROmyvZ5t/HKPepMtMdvO1rSe0eH6pD0qaPAKmdMJ7K+QwGINHm0pzIeZXJeRmgzqRyxaVFQyktrIs5cdaG/bCkW3frSxeo6/E5+xdGuNc3SUkeqrIJt+B7vdMcQPuuZVQsJX4X3zt3J+euHzvR/4RckvEoZsqLVTHm7WyzCPh0PEHmD8VLW+6PCr2oHCn9KiVgLtcjuWRrzAVFLuP8sVLZ4Z5p+6LBe2m2t2nCPutasctNktQ90tH8CYaTaSyBW+6PW8ZVhJzMRC1k1fWhq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(83380400001)(316002)(6512007)(26005)(8936002)(6916009)(86362001)(5660300002)(36756003)(6666004)(186003)(6506007)(53546011)(2616005)(54906003)(38100700002)(2906002)(508600001)(31696002)(6486002)(66556008)(4326008)(8676002)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6369
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2cd4a7ab-e09c-492f-0d38-08da2774fa13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iMteELIlrbMs1SJVLGsAehHyj/I4olADr3HHO9GTLMGFk6X/Sp72JZDN0hjMsvVQPSX3TYipgHXEeXa7ZL3u1lbGl3gUDoIAyd+ty8qSNjwuJJRlEZZZZNV+jv8PLugBlLuehNODhGXia1Vvcrv/8SUULEGGeB1KPtqsdIvw0/2FwOyN0TDkAjx/JHWPNXi8Gh1fYg6hqD/fgtX91+rEw5bCu7LBhvDFFYamxxAF389wE3ca0+e+1C+02yntIQaT471VYac6iqH6DICYhiV5B7PNaxjulDV6rpoHROeQwyAnq8V9DzsSb2+UomoJlnAqoYr/nvyLT14AjxZftDToFCnw5cgP7wiVByrSrVz/g5WOOyvXY56wvAcbeVR3U4f/HV+M0iDF2E0yTsJvKUsurOGBxQtJl6Vg9AI1gRb2gD7afjuwl2R4bHi0TLbwKoujFME6vlIGDGIQv2u3B5hpi0o+6EFLCDK6LTIedxEHKROVJxO3jE+RuDsc3mWVi6XW9yARiG9g0fBG1xZKLkT4t4oloya4HM6KNo5jO3pJPTODdV7vTaTPvEBCKB40S2jyYdPiAxpOhCNn/GflK/ELo7zRBu94m70keB4FnDaBQ78mkGYVlSrP6BNxrAOkc85ffS2B5phmkItUgyCFDTIruFbzTKvPoSzVWyNSXwEx+QOrh5RxuQsC5QI0NcX63ayvaCaO3eEqmqnhnRuJZ2K9ug==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2616005)(4326008)(8676002)(186003)(36756003)(336012)(47076005)(31686004)(81166007)(316002)(86362001)(31696002)(6862004)(36860700001)(8936002)(5660300002)(82310400005)(26005)(40460700003)(6512007)(70586007)(70206006)(83380400001)(6486002)(54906003)(508600001)(6506007)(53546011)(6666004)(2906002)(356005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 11:07:49.2472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72356f91-fc81-4ad7-b4e3-08da27750017
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4363

Hi Jan,

On 2022/4/26 17:20, Jan Beulich wrote:
> On 18.04.2022 11:07, Wei Chen wrote:
>> --- a/xen/arch/x86/srat.c
>> +++ b/xen/arch/x86/srat.c
>> @@ -271,6 +271,35 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
>>   		       pxm, pa->apic_id, node);
>>   }
>>   
>> +/*
>> + * Check to see if there are other nodes within this node's range.
>> + * We just need to check full contains situation. Because overlaps
>> + * have been checked before by conflicting_memblks.
>> + */
>> +static bool __init check_node_memory_interleave(nodeid_t nid,
>> +                                                paddr_t start, paddr_t end)
>> +{
>> +	nodeid_t i;
>> +	const struct node *nd = &nodes[nid];
>> +
>> +	for_each_node_mask(i, memory_nodes_parsed)
>> +	{
>> +		/* Skip itself */
>> +		if (i == nid)
>> +			continue;
>> +
>> +		nd = &nodes[i];
>> +		if (start < nd->start && nd->end < end) {
>> +			printk(KERN_ERR
>> +			       "Node %u: (%"PRIpaddr"-%"PRIpaddr") interleaves with node %u (%"PRIpaddr"-%"PRIpaddr")\n",
>> +			       nid, start, end, i, nd->start, nd->end);
>> +			return true;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   /* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
>>   void __init
>>   acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>> @@ -340,10 +369,22 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> 
> Just up from here there already is overlap detection (via a call to
> conflicting_memblks(), and you even mention that in the earlier
> comment). If that doesn't cover all cases, I think it wants fixing
> there rather than introducing a 2nd checking function. But afaics
> that code covers the "fully contains" case.
> 

Yes, that makes sense, I will try to add this case check in 
conflicting_memblks.

Thanks,
Wei Chen

> Jan
> 
>>   			nd->start = start;
>>   			nd->end = end;
>>   		} else {
>> -			if (start < nd->start)
>> -				nd->start = start;
>> -			if (nd->end < end)
>> -				nd->end = end;
>> +			paddr_t new_start = nd->start;
>> +			paddr_t new_end = nd->end;
>> +
>> +			if (start < new_start)
>> +				new_start = start;
>> +			if (new_end < end)
>> +				new_end = end;
>> +
>> +			/* Check whether new range contains memory for other nodes */
>> +			if (check_node_memory_interleave(node, new_start, new_end)) {
>> +				bad_srat();
>> +				return;
>> +			}
>> +
>> +			nd->start = new_start;
>> +			nd->end = new_end;
>>   		}
>>   	}
>>   	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> 

