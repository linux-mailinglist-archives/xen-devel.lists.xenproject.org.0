Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EBC3F89DB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 16:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173092.315829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJG6j-0003wh-5Q; Thu, 26 Aug 2021 14:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173092.315829; Thu, 26 Aug 2021 14:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJG6j-0003uw-1L; Thu, 26 Aug 2021 14:11:53 +0000
Received: by outflank-mailman (input) for mailman id 173092;
 Thu, 26 Aug 2021 14:11:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJG6h-0003uq-Iq
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 14:11:51 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d7aec1-6b05-4fb1-862f-b14475a03e4e;
 Thu, 26 Aug 2021 14:11:50 +0000 (UTC)
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
X-Inumbo-ID: b4d7aec1-6b05-4fb1-862f-b14475a03e4e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629987110;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fz8f72ABt7nR+J4yOKOzUu5n/j+NR/P+d69WhMZaId8=;
  b=DoHQbMMTU+U1+wdBOruygZNjVu3FHwS5JXMq0LR7vikV0N4omtCKsM30
   P1mo60jLkCYsWWqLBp3TAM2+XPHOVaUcc4Xuqexk+6AQ4/TdYP0GM9Pz6
   6mpQpJRTqurf1Ea0oextEAgfMcimkmxarLiBFyo5h5WGg0rnvX7iQ/bpy
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ANAqpPyLpM0FoiF5F3YOFw8U+FjATMV2E/+VQGBlY1cBLJEA2Ggxy2GS2m7B/KRvGmGxgHBU2f
 0V1gRd6SMHwC9R6CnW1om2h0hYQpRcahn9C/tQAM8U7fNo5dGNCm8NnYPh3QKfEjVvbbvMBtzb
 WWK9aDLCA0cLsS/E2iflWPwnh/KIeQfwSQFXupT/HQtDvr2Zz6bvJYq6O4BERhrHtp1JOniSVI
 uzHeJk1ZunR06BO4m0WcFk9AHcOPGOqZ7Vy6HA1eSqfKY3EKb8CLVKY73giaKzc2Fm0ArRTkrJ
 CHHTftY0aiGE7BnGFas53PS+
X-SBRS: 5.1
X-MesageID: 51762181
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:d1lyzals6VxY98RTrV3HMAXQvFHpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51762181"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ber0+jJxE1avoK4Cw0PAeSCKXtkncB2eE5SEjNeZ3EHo0ltL4oqUcSSLz9NlJKCuQzBP7XXyBAxouqwokYjrXKgJ2LogqN+5fv0oSquFuPM6YDY+TgNgM+uXZ0IDD2vsxT5MoMEeJsOdyjD3kVeYaVRtdjlC5BV3bB2dBXnF0znhOX44pakKiQsshl05+JFb2/HeGLOKq3uP6SwdfPdZYBInCaqTUif3wLGW1xOqdMIKthl6xQ8cX4TzdsXUXayIja4FHDOdxjVhJnjayQ76AbwDkrvo9yR7OVDjMSkp8S2QOQOsdDvyLGrYFS6QNN7e5VOEwYb7iX3KrNwd8bmTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjzs+GwUD53JRNY2tPdQdcyk0bYkWizcvjHcWek0v60=;
 b=NVpa44/ManPiyo0mUWEhwDRNJw+vm3IShbpBat36h4WaHDlaoxCvZiHIu4ruUcCq1pc+L4MhelTVAdWB3s+enpIOmwQogwkdssDfCSeSXxfd/DC25JjEpuK8qYencocmp0hgamp6fC3p81TB5iyddMixGqXalHmj9MzwtdLqQUBQGSRiGq/DeHS4qnas72QOYf7nFIUFX2Waw4p0ciUqRZs8mzHUSF7s7Jtgk4UbK3uLznm8QlcKIrHkSt/0rZUkodVUAgjqYh5Z94ZbKLrgPbyfiCMQkwvKdS4f4jbkPSbupAyln9LjFKZRY7u6PaBw0iiZcznqkQQ6yzQYBpCitw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjzs+GwUD53JRNY2tPdQdcyk0bYkWizcvjHcWek0v60=;
 b=d1myavEj+LOU9bQrqwjZHui7f5xiseTxc2+zzFklIjAREZX165TUKrOMFrb+owGmRJZYOt3SlhU8FbQZAhgq5efgt+nivYMyAdO+tD+bDe0qcZ1bmBTZUVhrGwZZoDM90RkXzlZt5e3x3Hii/rQMR4cUWVXC2MrXccvhs24eVjg=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <1b974a3e-3ace-fbd9-411f-4493963317b8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 7/8] AMD/IOMMU: add "ivmd=" command line option
Message-ID: <46142ba8-0f41-4c3c-9108-281ece7528ce@citrix.com>
Date: Thu, 26 Aug 2021 15:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1b974a3e-3ace-fbd9-411f-4493963317b8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 773f8490-7c34-4aa6-76c1-08d9689aeeb3
X-MS-TrafficTypeDiagnostic: BY5PR03MB5077:
X-Microsoft-Antispam-PRVS: <BY5PR03MB50776A6E25087840C060C2C4BAC79@BY5PR03MB5077.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1eHvzHeM44rrwelb4+3HKHeLkvpfT7hseS+Tqj/Hm0GgEWvrFLWEgndYOly52JnqO0kHVJSjK/U8IMBNXbrLB/2qTMBvPDwqqXNxRSfUpaKX/ZdUrsU74zdn8zxAlglCIgMxRzEpPisah32ivrP+Y45Kq4ONn0enc8/k7GWcEtY3pNmDdSHGVJ+iJuNWHtf/14JfgUhcdNflOU7uORGqQJTy8K8ZFsdLQW6xdilKO4rGU4PtenWydPr40ek9LrlY81gulmWk4o5jPXlhr09C8G8RFwNgnjNqhQsBCw6JSC9G+bd7LbtWoWqyHomh5aywxHiDhyav6hQktdNU00tZXQ4BJPeHdvbiDqU+NY3qngEUFp/WFVFqV8X7NrS2DvhWUm4We15907v13/fCF+twjs9rdF/vhncfszIr6LX6LrGqtB6FDbAcOqlNpMoJ8ccTn+hKZnXYC35ZuOQWuqBjqSd+iYPAMYs6W5D3P3HOIxMGTED4s8tbDtDQtp+jVkM0dJ3Ka1ZW0EroGYy2pZaORTocMjmH4mgKqe9N0zlgf+C/nZkyDKJPN5hDZmqe0OEF7nm/P/jyLajJpk5Hmn68rc1ptPjXpaloWdUSRuUQP4Sc7oR4gUMP78JOkbKGG6mLiH2IWtLsrasltz1GOVV+LTAbajMRy+vMpMQqYylynvy0uBXa1LDxGRs1O8MyCZd+U4jg9Su8W9dUbI15JIKMS7eW9d2d1lR4m7uZrJU3xg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(16576012)(110136005)(31686004)(4326008)(53546011)(5660300002)(316002)(478600001)(31696002)(2616005)(956004)(86362001)(2906002)(6666004)(26005)(55236004)(8936002)(186003)(36756003)(38100700002)(66476007)(66556008)(8676002)(6486002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmhreklYSEV2Q3JEV05id3h6Wk1CZURZUmdKUzNTL0xobkVOTlQraktSMEZS?=
 =?utf-8?B?RENVSkNJdWpYcmZIVHVLRUhhTzEreXBNUkVEcENUVzNlMXdxeE83VFc2OVZs?=
 =?utf-8?B?TFBpcmVocmxDNzNNYjB5YlFITXBScnhvY2FzbDh1U0k1aGkxREpHSGdzc2JK?=
 =?utf-8?B?QXgydmk0c0JZODBFZ2g3ZERZaEw0cnB5ek4wOU51SktBV1VEa1VjVXBTbHIy?=
 =?utf-8?B?bHdmZC85bDBoc21IVE1sSXFHUnVlaTIxSHU1SUpVZDJwV0N6WUFucEtRNS9I?=
 =?utf-8?B?S1hVMnpHSGEwQU1oNXdLYkk1UVNBY0NYUjNCcXFhamNEd1BBNXYxUWxjYWJU?=
 =?utf-8?B?dnJtSUpMWkdGRDhOZFoyVnZ1TmYrc0VQNExGS2tzMGlsNC9VRkZHU2RkQlBq?=
 =?utf-8?B?OXUwOVpMdHl1VlF5aXdmMXVZdGZVWEpKQ2tFTUM0NzltZGJSVW9EdVNYQ2k4?=
 =?utf-8?B?WkNuTGpCVmhJVUxFMVFGRHlNcllVTEhMd28reS9XVnVnd2F1ckV6a2ZZUHRC?=
 =?utf-8?B?c0dZVmk5R3J2RmVUYklnQ1lQS1FEdURUYWg0M3N4RFRaM1pQRzlUQ0padCsy?=
 =?utf-8?B?UVdlSGhUVlBsWmFTUFd0N3hWSkdvRW9ldENzeU9SSVpWall3YVdLMmlXSXd6?=
 =?utf-8?B?aWZKY25GWE9kdEtJQk05RmZQc2RneVhQZjJDK21heTNNSml2a2d2TW12WUk4?=
 =?utf-8?B?TkpCWFVudVZYRy9ZaG04anU2YUgxUWgzeitUVlBKa3FrK2dCWFVPOUczd0Rj?=
 =?utf-8?B?azVOSmpGaEtYRHVRTUZNdzNNcFFmM01JOTNhNXo3QUNXaXFLMDBac1pRNnlR?=
 =?utf-8?B?MjJwTE9yWkhKMkYrSnZJN3NGOVlMRU43L1BYNWxPaUJzNzZ2ZVBvaTdHNTNT?=
 =?utf-8?B?a1ErL25FYWNZQVlrdWFDZnVUYVVSTS9kTkI5U2xlR0VaMjUxT0tBemlQY3VK?=
 =?utf-8?B?NjhlWEVPTDRMU0Y0c3ZQTlNyTk1aays5N3NLMmxPa0tpa21pbVgxLzFFS1FB?=
 =?utf-8?B?ejRLbjBlN0h1QkdVTGk1QUZkVkk3OXZCaEpzWDRXb3ZqbG1mQmhCWkxuNzR3?=
 =?utf-8?B?OUNJbHBPZ05tdGxCM0luaW5ObkJCMkZDajJwd2N6WDFqMkc3dlFxZGhiTTB6?=
 =?utf-8?B?YlJxaExuYlBrRTdXZmpkZmJxQlc2ZFNVQlhCN2pFakxzUmFnZWFma2FIQktz?=
 =?utf-8?B?blNnZHBYOHg5YmpCaFVKeHMwTE9VaVBUY2RtWXVOQjlESXJsaUxnTUVFcVRV?=
 =?utf-8?B?dFFlbENmMXpSRERVcUJGUndweGYyQlB0N1gwR0wrOEhuUGJmMWFCdkp2MGpq?=
 =?utf-8?B?UHZNbGN4OEIvU0RQb0FyajBMUDFadTdkZldzUE1wZUFhNjNqemg2UWRrcitZ?=
 =?utf-8?B?MUV4SU9nK2xWQ3h4d0cyWEtGZjFaUU9WQlBtRStVaFZCM1M0RXRCQ2dsQjg1?=
 =?utf-8?B?NTNnRjhsbkdKUnZFdk0wQkpNenhnZkEyYys1NmdldXlMRDkwaUtFVFBsTnZP?=
 =?utf-8?B?QkttdG5kb2k1NmpJeHZtb0YrcWlXa0o4QWEySm5BYW1ET0trQVdKTVE2TFN6?=
 =?utf-8?B?UXB1Uk5KVkFvdXBsc1k1UDNBb2g4aURUZ1JQYlR6M3RYWHd1cXRIMHJqTGM5?=
 =?utf-8?B?R2YrcTNFK0FKMGJnQW9SZS9OcG9VSGt1QlFOUTI1MEl6WGZGRm9uYTllcGJV?=
 =?utf-8?B?MDMyU3FQZjBRK1JBVkJodmhMd3JWNVR5V3ZiN0YrU2dxMG5OQTkwaEJlck1V?=
 =?utf-8?Q?CXH4X1kYbm1ZXQbhqRqZe0xOVOCFszwIRAxoJNU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 773f8490-7c34-4aa6-76c1-08d9689aeeb3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 14:08:08.9676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcdYBP+zbhN+ZPLwjCgN//GF9wcVBWLpDePsA1v1F4rpCY4ydmoGoj5driHATaniG26r7oYXj9eJ9lZquwZWkbQz/zzNV0AYwh9kGaxLAZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5077
X-OriginatorOrg: citrix.com

On 26/08/2021 08:25, Jan Beulich wrote:
> Just like VT-d's "rmrr=3D" it can be used to cover for firmware omissions=
.
> Since systems surfacing IVMDs seem to be rare, it is also meant to allow
> testing of the involved code.
>
> Only the IVMD flavors actually understood by the IVMD parsing logic can
> be generated, and for this initial implementation there's also no way to
> control the flags field - unity r/w mappings are assumed.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
> v5: New.
>
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -836,12 +836,12 @@ Controls for the dom0 IOMMU setup.
> =20
>      Typically, some devices in a system use bits of RAM for communicatio=
n, and
>      these areas should be listed as reserved in the E820 table and ident=
ified
> -    via RMRR or IVMD entries in the APCI tables, so Xen can ensure that =
they
> +    via RMRR or IVMD entries in the ACPI tables, so Xen can ensure that =
they

Oops.

> @@ -1523,6 +1523,31 @@ _dom0-iommu=3Dmap-inclusive_ - using both
>  > `=3D <integer>`
> =20
>  ### irq_vector_map (x86)
> +
> +### ivmd (x86)
> +> `=3D <start>[-<end>][=3D<bdf1>[-<bdf1'>][,<bdf2>[-<bdf2'>][,...]]][;<s=
tart>...]`
> +
> +Define IVMD-like ranges that are missing from ACPI tables along with the
> +device(s) they belong to, and use them for 1:1 mapping.  End addresses c=
an be
> +omitted when exactly one page is meant.  The ranges are inclusive when s=
tart
> +and end are specified.  Note that only PCI segment 0 is supported at thi=
s time,
> +but it is fine to specify it explicitly.
> +
> +'start' and 'end' values are page numbers (not full physical addresses),
> +in hexadecimal format (can optionally be preceded by "0x").
> +
> +Omitting the optional (range of) BDF spcifiers signals that the range is=
 to
> +be applied to all devices.
> +
> +Usage example: If device 0:0:1d.0 requires one page (0xd5d45) to be
> +reserved, and devices 0:0:1a.0...0:0:1a.3 collectively require three pag=
es
> +(0xd5d46 thru 0xd5d48) to be reserved, one usage would be:
> +
> +ivmd=3Dd5d45=3D0:1d.0;0xd5d46-0xd5d48=3D0:1a.0-0:1a.3
> +
> +Note: grub2 requires to escape or quote special characters, like ';' whe=
n
> +multiple ranges are specified - refer to the grub2 documentation.

I'm slightly concerned that we're putting in syntax which the majority
bootloader in use can't handle.

A real IVMD entry in hardware doesn't have the concept of multiple
device ranges, so I think comma ought to be the main list separator, and
I don't think we need ; at all.

~Andrew


