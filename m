Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071523C233C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 14:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153614.283787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pE1-0005mf-2K; Fri, 09 Jul 2021 12:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153614.283787; Fri, 09 Jul 2021 12:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pE0-0005ki-Uq; Fri, 09 Jul 2021 12:03:20 +0000
Received: by outflank-mailman (input) for mailman id 153614;
 Fri, 09 Jul 2021 12:03:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1pDy-0005kX-LD
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 12:03:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44317f20-cec0-4d6e-9335-7b1d0c416151;
 Fri, 09 Jul 2021 12:03:17 +0000 (UTC)
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
X-Inumbo-ID: 44317f20-cec0-4d6e-9335-7b1d0c416151
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625832197;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KP/P3cgjZ2naWvGN2SO98xSxlgDJ4fxlXoUAh/LpcpA=;
  b=bAiTKNe8aAhdtBPCXOQdpAQjCJ7h8cxUh9XSD5NeAsFA/on+6Lu7XnZl
   rw6WJbmyemfaFOxPXihwmItcLb3WfmsTQRyhd5l8Q3P/0cJn6L514yy+A
   Lpgdnr7sGWaSWmIr7hyg5eovvUX9QZL/qxGQSx/Jgz4Lq+/RcBOaOoBAW
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MVEzP2OpelgBOuXu3AjIdmx/3Wy2g521rNTAn0eQSn82pClDm7Nj3O/ptghmabSWZbW77T4AUq
 UQWzsBrPIxMbEd86t9MPFAYaIM6HoaWxGcPUA0zuY94YMBeeUz4RmtN7s5UvuZtdQnj3NmJ2KE
 hdIK4k21MoPDIB4vzN55GBt+/RwU7O/tT47+Lwctww5wM2oLxKE7cMJRxJ0SaabRFHtFJ6cCpe
 SaMPd77MRl+NDQG9TXM4fBh9sibDUt1aINVK1Y5qTkBJ5WiiwgvxVtyQb1Tqpp8euk92QQa/g8
 Z3c=
X-SBRS: 5.1
X-MesageID: 47987237
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XQnFfa9I/I8584u5Ki1uk+Evdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc29qADnhOBICO4qTMiftWjdyReVxeRZjLcKrAeQYBEWmtQts5
 uINpIOdeEYbmIK/voSgjPIa+rIqePvmMvD6Ja8vhUdOD2CKZsQiDuRYjzrYnGeLzM2fKbReq
 Dsg/av6wDQA0j+Oa+Adwg4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMSfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvEbf2UIUh6LD3wXklVKvpREnBmcca+a
 hVfYDhDc9tABGnhyuzhBgo/DTENU5DbCtvQSA5y4eoOnZt7SlEJnAjtbsid0E7hdoAoql/lp
 D525tT5cdzp+8tHOhA7bQ6MIaK4lKke2OEDIvVGyW+KJ06
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="47987237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccimj/d4hoi1nyCnk1zAYa5yuokve15dIy9mfQzPFP9utPKbGViuSJRw2hDbS2+yi4CIfMDUv4b2nhwYku0/faa7606ciP4mlnxLZ5yEh1zJSWbtKn7Yda+SsfFu8M3ky/nmBWJWg33GPuA0A/SPI65I/TewOOvbb6Dyg4osmRcLyF6XFfl3pCRYyvUkmd4W1ChIVsCH3nob47IotiMOTm396RB4WjW2zSnBkeYZoIqClsHKp9/Vx8XKu9xRrBvo9RjfM6LRgNe5lZGPuYwKXBGkNJEtabwvIrKJyceDHfXXQrqY5HnmZ+S8o6tam0vBI49XDTd3Dys+Y/OdKXwmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=357tfsZfYpMIGXZxF8my277cJhJim5eElO4nSeS++9k=;
 b=kbuCa0H4Mm1KxdC6G7RE8uwBY0BjyLhNsFRBRQaqHsxJ2yTXHf8oFAvzj/igPFkiNo/G3WI84HKxOaEYJjYByWXMTmpv6QQJfUeuHxZmTtJZxZa71+PcwBMiGP9Qzl9MtLhKAOk9pl8Y+j8napZGjS0PL4qpgIMsn7pG1X388aKmYgl+8lYFdoEiBjnJjfz92mHd4AyfVKT8wX8F9+a/PgSPVcFSAh/RMTSYUMCfC/ro3WKHh+fpx2RqGD1wGWzCWvgsLGEp9df+civqwkUNoqyqNjpcZAW5zzUN6BgsvNqrJm/Dxo6j91SQZOky5rYMFc9eCSuuz8EJDdb9yfpBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=357tfsZfYpMIGXZxF8my277cJhJim5eElO4nSeS++9k=;
 b=qMoZ9GKe1rxvc1Zrmn+dRDgJd7O5ny/DjD5Yho4heJHj0twnS39gursHi2SRODs2SHxQI1qa5SK2eGONylHDuyC88FKLCVEf9WAi9PU9UVDbIfU5EIyGu13KRgwgMbIZmQhZVQjGAW798lDnMzqNSjDDP3Rbg1RQa3938YwjTuM=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <20210708145628.8902-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] automation: document how to refresh a container
Message-ID: <b405e7c8-44ac-56c0-8fcc-3c25ac4b3914@citrix.com>
Date: Fri, 9 Jul 2021 13:02:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708145628.8902-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3825821b-40e1-4875-ef72-08d942d17f39
X-MS-TrafficTypeDiagnostic: BN6PR03MB3188:
X-Microsoft-Antispam-PRVS: <BN6PR03MB318820714390FBD01C8B1408BA189@BN6PR03MB3188.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ef9cU46h2BPUf3nfpIyyWZOsb4eXUg2MlNtPyuwbQEdtx97HKxBL26AVy0qhGsx5qoMEwqx/5s2rExy9J9QtRzmQTvoqT9ZLR8MEoEME3ed9UYM4/aaYNtJiBcqq+AkZ7GOaAD3VCBbHHKk7Nfm89Ec2f46bQYR8e6bL3xUJykvCpzdjvuYnvB6PuGs91GZChxOu1gHCLnVbKjH18Yu/cPjzLqKNa0Cn9u2F26lPNU4FY+ZaEs0EVqapXQBAaWKQF7NvthdEku/aKJOXKAon22HfPpiREqNJsjP12q337P86D97Oi4c/vzMe0BDFZ/TIr0kGdWDiNmcwduXZFA6EI92WXeoEpeQLq8ZqOrXtXSHcacket7OSq/P38i1XKxcVeCWx1IbIyvLoafI7ThPCkdw8+983F7sqVHkto5Q1BZoiwbfRMhL0G3io/Nq2D8MVDIQ0VSLod4gPw4Mu/Jmwjm5xIrRW9WxE/UNGH1x2IUn9RvQpFf4pQATURnoOVKLr+kJ1Dzmtc/DDM8qN4Qhx40UBAU8JX2KZtxpeGZ6NtHtrjWXOvSHHN1crPx6EJzp6RWI5qaQnHT7rhSiokKGQpklmROGTv4nKvzjVt6BuOf71nTGgM6mSxk1r4HFXMr1+ZGYSfNY9aK6Ds842a586EYqEoJuS5g7cZcJ9nB7QHd+qtkBKBuj6yUUiEX/FrElrigBvNiXQ3iz62itNZs0wgCF6nh/nGOSciHWu0Pe77QqOnSHzmTQm2vhxl5tg4b3U3w4KCiqX7eSjfU7Gz8WHSEiED5UDoXVa4s4/HgMvLHYnuhly+GKTEJCj0M9wqcP1CgN82rYWbtJz55Y9RnYfkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(478600001)(966005)(31686004)(6666004)(83380400001)(16576012)(4326008)(53546011)(956004)(316002)(26005)(36756003)(31696002)(66556008)(38100700002)(8936002)(66476007)(86362001)(2906002)(6486002)(2616005)(186003)(66946007)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDF6SXRjWUQ0dnQwaTBneEt1V0QvaERDbkR0NzZOOWtmWGNEUVRsNGZlcUg0?=
 =?utf-8?B?T2VySWVRaTFBMVN4SUg4TjQyK1NwYVZwNk92YkpZTENiellmeDE5SDNhdHFW?=
 =?utf-8?B?dThhZWViRnRZYmZoYzJKbXM4YXVxbU5QdmRwSGJIYmcyQmVScitIOFljWXR6?=
 =?utf-8?B?VGxKQnlwT2JjSDRObXAvWW81SGd2UzlMdWZnZXlvTDJ2Y0tGZkd4NGVoSEV3?=
 =?utf-8?B?dmZYeElwaVNBUkRHblRueWF6V2xRU2x4RVBjZGFNOEdWZEx5dGg2Z1JxTWUv?=
 =?utf-8?B?dUUyM3hWT25ZY2xHemV1UWlnVlpwRVk1b1JpcUFtNTB4QVFKRGJMQkR5WkFS?=
 =?utf-8?B?VktGS1RTbHpHNkJYZjVqOFV5RnJIYWtEUENxQWwvWjBQd2RjWmQydCtpUGRr?=
 =?utf-8?B?a25rY0MyRE44V2o3ZmU0T3h0UWg0WlRYNWJRZkJ5Smp2MGNIOWt0YjI4Mmdo?=
 =?utf-8?B?Y3VqcHh5eTk4MnZvQzc2MGYyb2pQcm0xTm96SVhJMnYyeDlhbHVUZzlGbERv?=
 =?utf-8?B?S0FJdWlVdmZtZldWNUQzYWEzUld2RnhkWlVqcUx3a3RzR20xMjQzUC9rOEVS?=
 =?utf-8?B?TkhNZHVCeVpic1JydVRDcS9oYTl4YVlDUCsxaUdCb0dWVVg2bTc4R3VUV2xU?=
 =?utf-8?B?c3kvckJMWkJ3dEwrVWZHZysxOU1IWGg5Z0RKY2lQVWtzTXNlUThlR1YvU3Mx?=
 =?utf-8?B?SnB4OEVEeFlhTkY3RTZkbnhpN2hyN0V0OXRrbndXRmI0NytXK21UUCtrZWxz?=
 =?utf-8?B?TU1ydXh2UlNET2NpR1FFK2tPRXJkOTBKY2dwTmppSXZGSml3VmI5bTkxc2dh?=
 =?utf-8?B?VGx3OG12OHZTR3N5R0RVNHlIR2pZMTh3cnRsczdHaUxYT0xWay9maEt2ZGRz?=
 =?utf-8?B?eUhuWTAxOW5zT3owSEZ3UFl1bU5SZTF1Q3d1VVV3NTdUcmRZMWNSMGoxRDZN?=
 =?utf-8?B?NWNudlhzdnk2QllkT09aaTRLeHQ0UlNZMlV2YnJjMlVzdmw5U1BNZXFJZ0Mx?=
 =?utf-8?B?ZDExYXhvWVAxWDdBUFlVRnhGS0lFbFpzNTNtQysrMVpsR0k4eHhMdXMwY1ZZ?=
 =?utf-8?B?enJ5VDVnN2RmWldXVm1lSTNvWUsvdXk2N3RicVFpRUF1TERuNGRxY0E3NDc5?=
 =?utf-8?B?MSt5OE1EbjNmTzhQRTRkOUlxbEJacitEM2o2bEI2VGpUYkVncStWRWkwOUFG?=
 =?utf-8?B?eUpDK0p1VDM1bXFFVHR4eExKbWlFOGVIemxBS3ZDdVpRZVJEMlZJRXI1STBT?=
 =?utf-8?B?cGFYNnEvMWs5b0pyREduN3JoSURuWHJROGhuUSsvYWlNWHppYkkxSHNCemlM?=
 =?utf-8?B?SEF1Q0pVWFFuR2Y4V1FVL05hRWxDWTZJUENuK2E5WEJ3UUFQZGtNQzRGUzdN?=
 =?utf-8?B?ZkNEZ25CNGZaUmF1aWlrMlc3Tlphd0o3dEZQOFd0aFdqK2dTKzNpTFJ0SFd3?=
 =?utf-8?B?MmVLNTNucEtRZlJKZVJMK2JaT0laSGRoNk1JS2llL0ZweVhSVUJxMFlHMkhI?=
 =?utf-8?B?RXVpYW5sZzZrQzNHdVQxbUZHOGJpc3VuUitESFlSOUNtS280NzJDcVV5ZFJZ?=
 =?utf-8?B?NUljYkNnZ1J4Qk1rSCsyTm1LWEc5Nm4ySGFQOS9mVTB3ekZKNDVlcElXUXZR?=
 =?utf-8?B?Ylh4ckt3NGpGdUZ6T0RnL2crQVgzaFIzT3Q4S2wvUkd4OVpJUElxR1lwZWpQ?=
 =?utf-8?B?a1owS0k4Qk8zMkRzMXppaGxXODNza2dsWmlWdXE3b3IveVhOaDlhdzBwZ3pL?=
 =?utf-8?Q?1g9q+Y7lFoUhD37Cwk5ziDb2Z7m4eRMFHGtpar8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3825821b-40e1-4875-ef72-08d942d17f39
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 12:03:00.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5N4+ODUGiQxV8sJcbDCdLks7ZZE/sw9ip0wizH/uN21Kaq5wsHb5mGmnuhl39K8ieboVdVHFrsLHkF3LhrKUbxq8CtLyX3t8wVVIPp8Xi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3188
X-OriginatorOrg: citrix.com

On 08/07/2021 15:56, Olaf Hering wrote:
> The Tumbleweed container should be updated often.
> Describe the neccessary steps how to refresh and test it before
> pushing the new image to gitlab.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  automation/build/README.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> I did not actually run the "PUSH" command.
>
> diff --git a/automation/build/README.md b/automation/build/README.md
> index e1fb3124de..7f33ea077b 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -91,5 +91,18 @@ you have access to do so and have your Docker logged i=
nto the registry.
>  To login you must run `docker login registry.gitlab.com`. For more
>  information see the [registry help].
> =20
> +This example shows how to refresh a container for a rolling release
> +such as openSUSE Tumbleweed. Login with the gitlab.com credentials.
> +
> +```
> +docker login registry.gitlab.com/xen-project/xen
> +make -C automation/build suse/opensuse-tumbleweed
> +docker image ls

Do we need the ls here?=C2=A0 That sounds a little like debugging.

Otherwise, LGTM.

> +env CONTAINER_NO_PULL=3D1 \
> +  CONTAINER=3Dtumbleweed \
> +  automation/scripts/containerize bash -exc './configure && make'
> +make -C automation/build suse/opensuse-tumbleweed PUSH=3D1
> +```
> +
>  [registry]: https://gitlab.com/xen-project/xen/container_registry
>  [registry help]: https://gitlab.com/help/user/project/container_registry
>



