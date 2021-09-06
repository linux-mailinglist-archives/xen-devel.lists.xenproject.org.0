Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9283401DD8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 17:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180071.326586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGxZ-00022c-6E; Mon, 06 Sep 2021 15:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180071.326586; Mon, 06 Sep 2021 15:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGxZ-00020l-26; Mon, 06 Sep 2021 15:55:01 +0000
Received: by outflank-mailman (input) for mailman id 180071;
 Mon, 06 Sep 2021 15:54:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNGxX-00020d-Dk
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 15:54:59 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8ec2a44-0f2a-11ec-b0ab-12813bfff9fa;
 Mon, 06 Sep 2021 15:54:58 +0000 (UTC)
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
X-Inumbo-ID: c8ec2a44-0f2a-11ec-b0ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630943696;
  h=from:subject:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iFu3zhxevD19T38OTBC4f/Ly8O9/qxuVANg6BKssmGw=;
  b=MMklRHFLM2DrltER2yO0x7m4s2923mrh/87ERbW6P8nRLKe4FwmsSTR0
   yO4t3nkU0PGM6Ji37bHOUMSXRm9OdR6nTgDNnXYFa7bwTRZVR/pikr2QV
   Bnopb4SJJwmzGk8zmvlLYoI6DXSnWP4sciThw423nGKPvBby4mY/+namF
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3cgpXJT0NZj5KsX2WolJ0HvD6SNovf9HEoo8OhyUGiOwJXc+C6exDVtoXnZ1RKejOczXPEK59A
 PAbiECxEFUOAM67eAYix485vlzLBpYiyaZ0KFPdDZhA9SRRytuOs5mNJMW0OBq5F8/uhoYinUL
 GcEszmLYpGo9S1rmabOj+DFCRz04i/rDi+dp3ljtWyjZOrhmCyVM2WBP9sKfV27tO3muhwWGlr
 AuWMFncw3Q+UCFWa13pl0AyuXIWX4utryogBaZPVdmOXd0coKZfDn8hme3UF7a9oZPyx4TUElF
 RALj7WFsUe+DjO7CxoCskDl7
X-SBRS: 5.1
X-MesageID: 52086313
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lGbq5arUxEKnUT+NoQ7iNocaV5uiL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHO1OkPcs1NCZLXbbUQqTXf1fBO7ZogEIdBeOjdK1uZ
 0QFpSWTeeAcGSS7vyKkzVQcexQuOVvmZrA7Yy1ogYPPGMaGZ2IrT0JczpzencGNDWubqBJcK
 Z0iPA3wAZINU5nFPhSURI+Lpn+TpDw5d3bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj3sV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MSTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4Kwupk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizypSKeSXLzAO9yq9Mw8/UpT/6UkRoJk59TpZ+CUnpAZEyHpnIKM0vt
 gtMcxT5fpzp4EtHPpA7Epoe7rANoX3e2O5DIulGyWuKEg2AQO5l3fJ2sRD2AiLQu1E8HJgou
 WMbLtn3VRCMn4GT/f+h6F2zg==
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52086313"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpord6Lul3uguoS/aSYBYiKyYp8hupYGMY0kTcgsKLDVRe1CNsVhJLOKVw2yPHykxhGcQ6KdXPMVO/koux+BZsFR5/sckE2l7NzSsRpLm2pR1S6cxfX8Jh9laL1HE8fAxJllMJePAapmlocuIa4Og2Yuoes0w07VPToLj5syxBS9uhMqRRtcCVkO70EDQp/K2aSEcuJuO++1yqPC6qGhalBEdgwIBgBfvLzvWBDeyEDlAUukXLO6C94gLUu3ia4hDY5jhzwHn5ncroyTM3A/3jp7Hm2mCckCOemnnWxrTP8ZvRpDcWLCu4kopuhfbRsJVEx2FsLZaoICfOUruW51gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iFu3zhxevD19T38OTBC4f/Ly8O9/qxuVANg6BKssmGw=;
 b=ZUPZ3aRZzzYGKTl3U65UZIA2jKcEB3cxy+Nveyw5s5JyKZa/4noOyzW2FgmoqqwaqzwzNCA4yC7gNQmygh6ly82i33j8QXt9+S3lrI233dtilcZsy9NAqg/kW74YcWVTT0ZNdoSOUSlMWQ+OMuyNLsjbCjYWDIU6YDqG+blF0v6QEysy/yBN+cTa/xLL4MJtd8vFPQS+MLdQPS/y/9ET0PD7RuJQd+B5HbAT1bzFG7/WVDSBgfKC1VFiRQVu+jtAfvavPOKKsTLi6L61+wpMukgQtlLfRYwH2WF650Q5dziu/MuBSnt4pFF/aOF80y06c+EjQTsToNMKVm/sUyBDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFu3zhxevD19T38OTBC4f/Ly8O9/qxuVANg6BKssmGw=;
 b=qjBPTzVsszUErkfx3PC604fELBLqTiWLRGEJxwa5vhz2zVDe8YjuUqMEo5T03dasgSu1OHVSk8u0zM4HKHxYxzmcyV+xuX4G/5zGWQZo+JKaptNER/Y5yk9lV14P/frTNt7Sz6SCw9LECqFvZxsnjR3aXNbEI7OMp+iVKdlmfRM=
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/6] x86/P2M: relax guarding of MMIO entries
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
 <9ab471d8-877c-b569-96c3-c3145800adcf@suse.com>
Message-ID: <4f794b1a-b1c9-2612-c3be-4dd710bef73a@citrix.com>
Date: Mon, 6 Sep 2021 16:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9ab471d8-877c-b569-96c3-c3145800adcf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c140d6c3-d73b-4087-cf4f-08d9714ea906
X-MS-TrafficTypeDiagnostic: BYAPR03MB4805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB48057D8FFAFBA71D118F9318BAD29@BYAPR03MB4805.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aaATC9MZA1LgM/AAKxeZSEG+Tr2JC32fsa+oWOAYlewJKhnU9yA15ucyZuw3/ljBYMAd1JiNgm08rxqACIPEFRJkBdfKM12cWBEqgxbwQ6i1MeGcDEqaGzQQOy4zA9ZwxtHr2050HzZv8gxbM8Ulg19c0CJge87DwRa0TYHteyq87AB9PRt9DBLQv1foKkA68dAJXPZGjpzYWQ5mfHGOYg3G2KQWvYuwf7KlCJMiE9q+obAl3v2kWP3Q6HO1PibjcUA3JE8bCfYvAxLUb+Crml70YqyIlUiNbzD1A354PliX07fAwierV/umq12Rm/aw0+PQPYf1MxqBEQzpmlBhf8xjgiXOHnML7EZPGwdG+ykhjPXtjyn7Qavm1tHflSGSU74Bj5I8sw/Tg6uYVZpagcdxqOAydbvgJeM4HJXulUPYJ22gwVrwCHcu1Bwjg9jju1zVkq9o7c76sSBQurs/GECJswmkCbtFWp7FNWHrIUqc2Xnr6TvKB3PunqrFllztJ2yij9zrVTSM2dSYbKx7pUu/E+6GvfWB6/PwpSGGgYoLLr4Tib0kBPghY1cyzUuBlUtC5wubtntxKXDgBBzqBdP1QQ+NAdk7JFnSNG96EBe2aVe3GkgNS13LMScCBHY0m8qCL5UTGo7/+bzJx59hM0q4m4OMZ9bbmSZdAWL6arl69IcIBrnmrV4ezIL6UsNOc/DLYZddgcBOacqGtXtdCspYuU0N+ERIgiu4+r7ok8sVEk2Ws0uM0EydDKtuaJej
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(16576012)(31686004)(38100700002)(4326008)(316002)(36756003)(54906003)(110136005)(86362001)(66476007)(66556008)(66946007)(5660300002)(6666004)(31696002)(83380400001)(8936002)(8676002)(53546011)(186003)(2906002)(26005)(6486002)(55236004)(956004)(2616005)(478600001)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnIwcjBCczdsSXExNVc4WmlCN0lCallFN3RPUjlzQUIwVGRSc1BNcGVUcTJr?=
 =?utf-8?B?OGJpcWZKd0Y1TXhVWWxBdGlPaGJ4aThVZmhMWjlDMHQvU3lZWlM3ZWgzcG9C?=
 =?utf-8?B?Lzh1US9EVW5PR1NIaGthd2FaUW9pTXRyTllkbkFGNnF1NEpZblYwTlBKV2pW?=
 =?utf-8?B?UU9KWjJ5ZkY0WGU2Q1NnbHdINlBUWHhHai9PMjFaMlh5WFNicmVHOTJjUTJS?=
 =?utf-8?B?czF5TWZMdGZxSU1UMWVMY0VVeUtmSHBHanlPb2xRNXl6ajZlMmVnOTJpVVU2?=
 =?utf-8?B?akwxcWhZWVp0MFdqU01iRGRIM1I4ektJVTRPYW9KVSt1bWNwcHgzU2cvSW1G?=
 =?utf-8?B?eENCYkJzdWlHMks5T0xnQnEvMFkzM2VJQmp1a21XUlE3RnVNcU9wckxJQ0Vh?=
 =?utf-8?B?c205WUpGMS9kam9rN2pZR3V0OFB1MjVuWk50dnV4aFJrNUNVbE9QWHJBTDdB?=
 =?utf-8?B?eklHRnZBWWxmbVFObll4MWVJUXZUa01PbExXNEFieGlEWmR4N0RSKzN4azdY?=
 =?utf-8?B?WDVBSFg1TkFxcXZaNDJocThSMEUwRXpIMGxYVjRZQU9tTzJINUtnVEdRc08x?=
 =?utf-8?B?V1Jka0YvbnY1TXhNblZQRkFZYmovNnVNdDlscEdGQW1wQUIxb3VuRFJobjRp?=
 =?utf-8?B?QXhOd0JWT1JFYzVTZGpzNithS3ZING9TVVpkcGxKem8wYjArSm5rT09zUXNy?=
 =?utf-8?B?QUdqSnZVbko2Mjhhblk2UlFJR1NTU2ZiQ2NGN3RyUitUTG9EVjFQMW9JclVE?=
 =?utf-8?B?US9VV05aVWQyUVJLTXdaMzRoclhsRGR0TkM1NWh1cCtBdWRDejY5TFR1cVJn?=
 =?utf-8?B?VWlpS0NadWl0ajBBczZkUzRNVG5IZ29mU0dKbmMrc24yLy9HdVpUKzB5SDk1?=
 =?utf-8?B?ZjFFUTJuY2RJTXBKdjVUMnVmV05xRS8xa2toeE5mRW9aUk5ZMWRPMnpsbmZp?=
 =?utf-8?B?QTlSS05wTVNIeGF0Mlk2R1VBZC9IL0dmNzl1THJVNWN4N3N2WWdzUXN2VnMz?=
 =?utf-8?B?Q1lCcWNrLzNJeTNacEtWUE5VSDk4QnZzRENrczl4cEJPeGRCOWt6NUJZTFkr?=
 =?utf-8?B?SGZ6VEVzaVVISWxPWjFjb0U5dzcvUjFDWXNoL08rZlBlc1gzYTFzT0tLeFda?=
 =?utf-8?B?QVNxREFadHEyVEJ4Vlo0bE1VZkRvREs0WGtIODNIcTZ4M3ozSm0vbjBON1ho?=
 =?utf-8?B?NzZSMjNYT0RxTGM3YXNtWDVzVjBiS3FpTWo2MjZFM3Q4RGRMckVkLzczaVVG?=
 =?utf-8?B?Z00xbk5lcCtodDExS0RaM2ZRalh6YnlKOFYzbGlVV1Nub04xd1lXQmhKTEIr?=
 =?utf-8?B?YW1IQ2d0ZmNMRVJHQWJyMnFuTi9WL240Y0U4M1hNb2c4N2NMeExIcUs1Y0dm?=
 =?utf-8?B?ZU9XUHRIZEFUd01EdTg1N09JQmJ2VkYvcG1Qb1Q4Vi9MTDBXM1ByWGxSTTBl?=
 =?utf-8?B?aDVDM0FTNjhoc2hQdm5mV2FETElmeFdvRkRGb0RQbG4rOXFza25pSFNEZk43?=
 =?utf-8?B?SVF4VWhDdklBYkNDdnUybHZDSFowTy9FaW05MXBOakE5eUJER1AzbXlPSk5L?=
 =?utf-8?B?bEpnTFNFK25oSzgzWFlOVDVMY0ZGSVFzU3VnSE9pSzhHVUR4SGttRVVtZmtu?=
 =?utf-8?B?ZzNKQ2tNTE1qS20vSjhFQWtJejlKamM5WmNrazBSbnV3ci9FNjZndXBJaE5q?=
 =?utf-8?B?dlpDaGQ1dVdkbEo5cXdKOXJBU2lCTDI5UEdXbGpoNmtPblNTRi9HYWFPZU9K?=
 =?utf-8?Q?XkWY4NScNXe35bWQvg16/TtQGBWsABp57j/V5yE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c140d6c3-d73b-4087-cf4f-08d9714ea906
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 15:54:50.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7E5OilklUTMU6p1bHGzlaiG9gClfm14WsSVQLxWI6Iz0fdqwzFA6/NePEb7GZtZOfWTTL5vdJvL5qjbmFS8FkJj+GiEoiKJMbLZKw1AKb2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4805
X-OriginatorOrg: citrix.com

On 02/09/2021 09:32, Jan Beulich wrote:
> One of the changes comprising the fixes for XSA-378 disallows replacing
> MMIO mappings by code paths not intended for this purpose. At least in
> the case of PVH Dom0 hitting an RMRR covered by an E820 ACPI region,
> this is too strict. Generally short-circuit requests establishing the
> same kind of mapping that's already in place, while otherwise adjusting
> permissions without - as before - allowing MFN or type to change.

"Generally short-circuit requests establishing the same kind of mapping
(mfn, type) but allow the permissions to differ".

> While there, also add a log message to the other domain_crash()
> invocation that did prevent PVH Dom0 from coming up after the XSA-378
> changes.
>
> Fixes: 753cb68e6530 ("x86/p2m: guard (in particular) identity mapping entries")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I may have gone too far by allowing "access" to change for all special
> types now.

I think this is appropriate.  After all, it is the pre-existing
behaviour, and the type change is the important thing to restrict.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

