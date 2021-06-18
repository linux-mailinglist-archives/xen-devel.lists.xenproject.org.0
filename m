Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC13AD0F2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 19:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144926.266693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHy5-0006iq-Fp; Fri, 18 Jun 2021 17:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144926.266693; Fri, 18 Jun 2021 17:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHy5-0006g9-CL; Fri, 18 Jun 2021 17:07:45 +0000
Received: by outflank-mailman (input) for mailman id 144926;
 Fri, 18 Jun 2021 17:07:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luHy3-0006g1-8o
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 17:07:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dfafc1b-0a62-420c-8f71-3fc762af466f;
 Fri, 18 Jun 2021 17:07:41 +0000 (UTC)
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
X-Inumbo-ID: 7dfafc1b-0a62-420c-8f71-3fc762af466f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624036061;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tdNyLLlSw0qMVJehgjoDsRuNiAn6teHXz8gahh4senc=;
  b=XDFYNKKMXtEFRN9e8T9buIryi/Xb1JSry5OqchqhlL3JAtoqSMFze/o/
   lsomEosxYKi6l5RZ8xS62v9WTjCe9NrWpNxuzQvfEGPDKniAcMCTaT9Ev
   TlT4H98C2H4O6Z0WA4J+g6cwjmgN+1a544XDtVy9Vqcv8QJu0OncaZuCJ
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RVDpfXBWZVkDUKJoSufMmfybxX0e4lCEfh240PodOF3RyceWNiOg5LQvK/NCBbtmAKu0wSUVZL
 psFszpP09QmWBgOQ5KUF5LWY+cQHwl88totO64GuwHVCi7Pp9TSrtcGSs4+74PJhBRqe4Bg7l6
 MtG7EUyB9UG92wqc4wTmol3OnMvqzG6WAhqwHp4DjMxxOAG7ulFSq0EUrG/JR61BrpEwIw/6fm
 wniGmNZbg9t5nUM+wVHF7t7wnPeNp7mi4olntatSlDwqyIsMVdYud5nJGytNolVXGGrEoZOthO
 nFs=
X-SBRS: 5.1
X-MesageID: 46846757
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PMKqC6+Jqq7TybXv98tuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46846757"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+XrbDiJQo7iYfggKY06MvLlxXI62tOJudKV4UcK53ecOKOwnuLAZXfpOO4mU3PcTtyVEt/vpycO0VcTYJoKniibArWd+oWU+Eg0kIi/7GDbAUO/PgWAHbprqeUz+OwDgUmJlkXkN7gNmMBtDV8mCBhOaEfTtmpREiJXBV77TQQ4pYLCeqvamkbrM225JPObIJZ48nHa9J1tPshlt2B+DCYZWbJDLLPEF42c3qXcsGl4h6FaB/jQ9/2aOwuinV644qqNjXOlU6aHn+y+tV51h8jjBfB7kx29mBPBwQ+OL46nbFJcfGYN4xVad7z5gWAw1MOTEmyka9sBJH4f4+FEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKgHKUfz7/qH+TdJA7nGfrNDbbvgtfrzWNWzblCR9Ns=;
 b=VJYhNzxomiE4oX/8BhFz8+NGcE1hIMy+5YZ0EzNnL6VkZUY/Dh/Wadlde63KibtBDsqShaQwoOnsaHl8/9pgu5kLdishSnV/QgsN/UxaHEoDXn9iO8AxjhOCQI9slQekT4RNk7lhGG1qgb+5JfyEwdH80qwPkX1q0VoCDTMmrtEwpe2aWTS/BEWmSuev4hHUGr8XvN0F64MsqT4/MbwjH2HcjT1PFXRDskJxDH3+aefrfhbr5yNk3idRM/VU2sHxVLBzp3qPozxutaFbanJuLbvTZlf4RNkBtn94grK0eZUqNl/AZqLoGa+U6wQwbhYNAUivrLO3GfSGYXlJCkHXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKgHKUfz7/qH+TdJA7nGfrNDbbvgtfrzWNWzblCR9Ns=;
 b=e13TXkyg/HnugXyf+1dSB2mqZaqmBiYi3zKP+6DWKCyfI6oUK0HaJenKxhDotbD3ttOa4iZY9A2tlMiMQrsf7gzJm5cSXVObWWBGOWpZFSPArqcHwNNBXK9jh+RuFI212zJKv6jaH1eBz/jmoDuAssTJ2QZfKqvHmBwvgUaky1A=
Subject: Re: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
To: Edwin Torok <edvin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
 <4eb5d3fb-db71-5981-e6f5-0503ff896fd9@citrix.com>
 <5B331E67-0BE9-47DE-8076-EBBE06BDEBF4@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <70ab3e24-7586-b75a-6c88-ac22157d76e9@citrix.com>
Date: Fri, 18 Jun 2021 18:07:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5B331E67-0BE9-47DE-8076-EBBE06BDEBF4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55ef8128-a3a6-49e0-f28a-08d9327b926b
X-MS-TrafficTypeDiagnostic: BY5PR03MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4997D0F865611D23FC83824EBA0D9@BY5PR03MB4997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFHXYRX4afRDtWKmOS3dSJEiDqKZlkOt94Gza9Wmdl9fFKK/IcYizCRnb2twCUzWPH0dZiL/8iM0xggCVRXSv6Y+1Fi2qvB8E9frQGgaqQcQBqUWdGiRbPCzDAdTj10l1OvflCfvqkT+EfBWtWFd0W0v9Q/aDtoDEci8+KyBDQrVmrlZx9QcDjrVUpkNY+FAEHeS9Jrs6k5zBFUOP7k+QuI4Nw07u1iRqtxbBFPbl+kURktuN6KUBsgxLzwilT5Tl7k/3CQNJ2GEcgF147XwgnxN8iTiQpMNmJXYLuleruZtmfstArYHNJvbit6U5kGNALuvNhs8GNDZThYl/vo+YHxbQwON3WrrK9SzNuy7SqYFzkshpdF7z89to6XZsAsl2PVGW93fgVWZoE+Q59JAJdl3agWrIGyUVvnUEuVbBVtyhMtaQOrgLxC4zDpN1Cu18UCRtxOPaG/v8et2JIwNEy5wBgsHr8YPwkLP70cJPJOVa1F9jNGfPqoXCyH0b4YLtXXShRseuUB7mh9J/CtGWb53Jngf7pyM5JLFzQfjg780rPIzNWi8n9tf2wQpRvwvqjcbnVyx+3z0WwJl9g3SeX7Yvtv2GrYyiWsL1HwDBxI5Qa/xom0lgwvmY0UAiuZivZjLKLffgOurFfuKACV5XmHylEU1ud62ol0xNXdBzTmYvpkgjvU1l1m1DArWQla7wfnivvVloWGv0T6MORq6hqCrk/8qMD4AoluRtbDWdmsf48lBTmHF95VIUgI3YbMnqHNe8b0dDF75nIxD/N87Ymb+/mmMwQ8p6xaSempSm3nbWSqy7d26cehaRhv1oFkN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(6486002)(31696002)(66946007)(16526019)(316002)(36756003)(478600001)(6862004)(966005)(66574015)(86362001)(31686004)(6666004)(26005)(186003)(8676002)(53546011)(38100700002)(5660300002)(956004)(6636002)(37006003)(66556008)(4326008)(2906002)(83380400001)(16576012)(54906003)(8936002)(2616005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azVoWnFFOXRDTTUwN2VSK1dzOEVTU3Zoa3hlZ2hIT0dSTzg4QnFpS2JFdWhl?=
 =?utf-8?B?dm1abGErK09HTDUrWm92ajhwZmlwejBVQTRKTU8xNjI1U2k4Q25ZMXM2akJo?=
 =?utf-8?B?cEdvU2t5SWlaTms1UnEyUE1xSHFJYVgvdmF0MUliYk1nRlB3KzR1a1JwSDYw?=
 =?utf-8?B?WHVjZzd1K3I3TVYyTW11WXlWZVhRaHptK3ZTNjMxYk51OHAvM3RYN2IxYjlS?=
 =?utf-8?B?Yzg2U2VSYlE3ejkraGZwazRLSjJkeHFibzN1bzZLRFJwN3BxVnkzMThDc0hI?=
 =?utf-8?B?Tnp2ajIzNTYvN2xUcFdxOE9MQXE4Z25tZVhocUhKWTh4TXlFalc5MUJFY0Rj?=
 =?utf-8?B?U0M3MnNVUzFVZFZSb0hkU2lzOXFUSUxhc1Q1Q2NhUU1TMmZHcDBzTVB4QzlL?=
 =?utf-8?B?WVNKbHMvVjNIdXV3TTNUMHNFdmRqUXkrS0hLWE9qMVFZbmJoZExZSllEVlZl?=
 =?utf-8?B?OEtpbEI5ZHVTa2hoUG8zZGovY0l3emF5enEwYUhXN1VwZXVkT3Nva1RuYThh?=
 =?utf-8?B?TWg2Ri9YaENxVjhJUTB0clp2SG1BUFdqRS9WWmZuN20yblJRRTNKL1dZUU9T?=
 =?utf-8?B?TGdmU3pIbFRUajA3VkJmYjFhK3QrR00ySktYQk5zUnMxYzd1OHBKWTZ3dkJn?=
 =?utf-8?B?YzYrUlRxZWlpV29pQ0ZlcC9XRDNjOFpIRzM4R1NqQ3h1WUt5YmZhdEpoZW45?=
 =?utf-8?B?VEFmSzVnc3JVbE9KajF6c2lSQVJOeHdUYnZleTIxREZ6WG5ZNllKbGN1RThl?=
 =?utf-8?B?YWttQzFoZUVuSVVYc1BycUl2Z0FpNmVIMWYyWkZyQUl1Q013MkUvV09TR3gr?=
 =?utf-8?B?dVhuek12VmVvMm9rYi85RTVDSlVUd083MWJ6K3A5Q3ZXeE1jbnhTMG5Ub0xn?=
 =?utf-8?B?Wk13TmJvUHcwaVErN1VoQXRkTDg0WmQvVXdWeWJNUzFtYWRHZmsveHIzak5R?=
 =?utf-8?B?M3lOSHpWLzhlUVZMN0lzMWl2TlZLRnBtamF5bW5vWEZpSDZkUDRKZTRmcUEz?=
 =?utf-8?B?MkxGSm9VckszamcyTkpnNlk2bG1QYXdBSG1VUHNoNStZbWUvWWVQb1JhajEx?=
 =?utf-8?B?UnpZZCt2d2llR0pDV0M1cnpkK0RCMldUd2ZhY2RSUmMrMXFSV0R6YXdBdW9L?=
 =?utf-8?B?ZGYySkIwRm1rVCsvZDdGem5EVFIzYWFhOHZ0QkErc2tIVUNpNHgvVzFlZjBS?=
 =?utf-8?B?NldaT0k4aHpKckVCL3VIV2p6dlBLUW91eERyUDZlVkVvY09YVjhhM1JscmlM?=
 =?utf-8?B?Wlg1WkxlV0hLT3p3RGxoMDkzVTIwcTd0R3FSUW5KSUhhVFRyRFM0WUtuQ2lE?=
 =?utf-8?B?UWtlTU9HdEs3OWZQemtkZ0hYbTBJRDh5YW5STXo4UkJtSDBjTlVIQ2FMTzJp?=
 =?utf-8?B?WlF6MklMNVc0SWVpakxqanFTa000U1JoYXNiZk9FY2lBOVJSYlk2eFRNRkxX?=
 =?utf-8?B?K25iL0tRNUNiU08zTHhzYWFsQ2tkdzNPVXZvWHF3NXZtUW8vbFAydUVQbzlR?=
 =?utf-8?B?c1VCdXYyVkJUT0t5OEhiSzNVKy8yWUpwVjNxcEc1c3VvTDM0SVpmVkZScnRZ?=
 =?utf-8?B?enQwT0Z5VE9MM2RsOVlyMDMrc1F5amVYb3lFclZHMVZESkJ1QXZlTjlHZlVK?=
 =?utf-8?B?VERkN2ZiVE5nSjA3cUs2eWd2c29TZFNoSVpnVm1pSk5GSm1OcVNmOUIrUlpC?=
 =?utf-8?B?ZDlnaTVKSlFLZVBZQ2VnZlJrWSsvMk9lY0MxV2JJMDJmY0gydFI0b3VpMWJ0?=
 =?utf-8?Q?Ums6GvEQRpZAc11gAINY346qLmFoP8KhQPR+3oA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ef8128-a3a6-49e0-f28a-08d9327b926b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 17:07:37.0528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KFOx9Sr7aDqzLMeG8yx9KGh7cpKL+BY6n7X3TbqVYJ8ZRhGPQJ8sS/C7+7AfrqF3dPNr7UeGQL4BlVcUDjWu0n6t0yCT7UWIRKGQZdB6ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4997
X-OriginatorOrg: citrix.com

On 18/06/2021 14:46, Edwin Torok wrote:
>> On 18 Jun 2021, at 14:17, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>>
>> On 18/06/2021 11:45, Edwin Török wrote:
>>> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
>>> index d05d7bb30e..4a230de8b7 100644
>>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>>> @@ -34,6 +34,9 @@
>>> #include <xenctrl.h>
>>> #include <xen-tools/libs.h>
>>>
>>> +#include <xen/lib/x86/cpuid.h>
>>> +#include <xen/lib/x86/msr.h>
>> https://gitlab.com/xen-project/patchew/xen/-/jobs/1358403495
>>
>> CI says no.  This needs to be behind a suitable ifdef, for non-x86 builds.
>
> Should the stubs be disabled completely and raise ENOSYS/failwith on non-x86 (e.g. ARM), or are there plans on doing equivalent CPU policy on ARM at some point?

No plans.  "CPU Policies" comprising of CPUID and MSR data is entirely
x86 specific.

ARM do need a logical equivalent, but don't even have migration yet, so
all there is a stripped-down set of settings done by Xen.

~Andrew

