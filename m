Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5A37AFEF
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 22:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126019.237210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgYdf-0000RM-8Q; Tue, 11 May 2021 20:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126019.237210; Tue, 11 May 2021 20:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgYdf-0000O6-5H; Tue, 11 May 2021 20:05:55 +0000
Received: by outflank-mailman (input) for mailman id 126019;
 Tue, 11 May 2021 20:05:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tq61=KG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lgYdd-0000Nx-2J
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 20:05:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d92ff197-7738-4aeb-85bf-fab2e6959177;
 Tue, 11 May 2021 20:05:51 +0000 (UTC)
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
X-Inumbo-ID: d92ff197-7738-4aeb-85bf-fab2e6959177
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620763551;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ERd6zyM/71VfFvobv7ncrvPMsEmZ1g/7zcMa40Z7Dbk=;
  b=BC7Lb7CQktt2MRFYkoAd1sljRi8NW7ydxcQhWRsFJopKaBl3mLsBXuUA
   tFiURAeUMLYYntFKQ0CM7PBK6AGL1hYPdDMHBTv85yPDxja4UVHHyCgjz
   jkI+RjhzC5iHZDXcFgddtyGevR1xq4UqYR2Pz6BsxId1I6FpJj4XdHL86
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yQtaLk/ETNQNmOdso3w9OI4fw+t+D9nsqG83DqJSP+8QO81WhzAAlXUJ/x5rA2J6oI/HmQnjWf
 BSXZyk51XPCSXcNv69UIBJNRg+PRQ4XRqeQLt3SZIQK2B3V1XBqYDeyPvYTt1OXvbIT2hFsSz1
 htv+HC1Yize1WceygelYs8PeOARcpnD6SyQ5A2bHPLZcTDSPgvdPqhw3BE2cV2rMtjT0gCtVyo
 sN38GJ7e8/87wTp6eZsftbVGUotrjB1bulas1HeiQpjKqZn1JmEFp0RAWjYj1gMyzoiPH4m4Ab
 1n8=
X-SBRS: 5.1
X-MesageID: 43570403
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8iN59ampt0WtjyYWhQHG6DJ8zEvpDfKt3DAbv31ZSRFFG/Fwz/
 re5cjzpiWE8Ar5OUtQ5+xoV5PwJE80maQa3WBVB8bFYOCEghrYEGgB1/qH/9SIIUSXnYQxuc
 hdmupFebrN5DNB7foSlTPIcerIt+P3k5xA692+85+wJTsaG52IpD0JcTpzWncGPjVuNN4BD5
 yb6dNApz28PVoqTunTPAh2Y8Hz4+TRkpToeBgHAANizjKvo3eH1J7WeiLorSv3dVt0sMMfGK
 z+4nnEz7Tmuaqj0RnX23XI45lRg9WJ8Ko9OCRO5/JlVgkEpDzYGbhcZw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43570403"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAp0LVwOF2zA3KXJv35cgF3cG1N+FcfTnhtx98XLLqX04RsSJSyLGKW4C2sIzCajlEtqdAHvmwq+3a+pJvbnZnnic15CHkgNKFG6rgFaKuDENuMwRGejFgkctAx4V+osY/LtUQtq2W43ZrWjTn1ogFChh9x5IaoIlghI4mN1g4be+1kNQvvjCGTMmtInRF04t48BLZCKfny7DWgN8Djhw0ssM22kVVnA/b8WcTid/a0YSfUSedqKhz2w+br2FcK/plyH4BZGHsCjZP0bQcOUyywZFWfX2h5nyS7BrfShAcaJkTCxqshw9LmIXcAqzEmHj34XWSmczREQIh7Lk7D5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHSqoKI0B0vWUlCCXnk3zGPds3/b7z3KLLtbZlG9J6g=;
 b=CrgGpIpScjiFXzMPQLktQXGYM1a59nUQHhNZSdWFGLJV0m8CypmoY3Bcdedhtrg1L42+pkWLZNavf7cAE82hYJPb9FQBNqXFDNvhOEIykrcILHQY9LARmsifhP7BTTFqXl76o2cNZzMnaHFIbNGkgZd4JcmOXmKJx+ZPvMZsDUohcLYCgcalmilIL0lZWe+sCm7Izzyqbk4Olm5eGNNRs3tHvn1NiMayOMtfNpe46xtf0yEwOacukzm6bUPur1vAqcZiP9z3vaW8xp74VnO2vqK4G1Ubkw2XliKXH0Q9qPo/ii9PGos0g8UBZj4lqlEFye26CQBzvw2b5mPf9S6f3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHSqoKI0B0vWUlCCXnk3zGPds3/b7z3KLLtbZlG9J6g=;
 b=tM1uowWqKNxvJiHWlSsyTOJHNZja+/fIDe1mhF4kUNJHGJpSbKrDkjFmr2V/aP+9KT3J8jUEyS20EdAEc8WWS1ygWXlbh1gKzoabGF+5yvHCo7BARGWEiEjFFzEADJBgmHiYJuYszD6V2WfrjtmVl64/T34i7f2B86UfqFpY0L4=
Subject: Re: [PATCH v2 00/17] live update and gnttab patches
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Juergen Gross <jgross@suse.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c744d834-659a-e361-df97-128032402950@citrix.com>
Date: Tue, 11 May 2021 21:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13f42dea-24ea-4112-dbce-08d914b829c1
X-MS-TrafficTypeDiagnostic: BY5PR03MB5000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB500075BA673463D5E608FA0ABA539@BY5PR03MB5000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GJb1StAXTa+VpfXm1lGbo7LxKoHAwvoHo9BZwZVl6dX6ndDvXrfj42SpolsD+Ep455gmzemKWGZ0s93WH9gfGrmaQ0VWkKwX619mrDZWsN3eok0gEjZo4Jo3axx+RhZ/xqn2z2SGxT7AtvJ7b4Fjmyk5yp9nmDVjFhj2TUEYRZ0SAD9bUlpcc7FPOsjrfSUHOUHGHma0saxvlRvczfTFMitprHk0KRQp6BMUSt2p7QLRAJ6eIeHChCL58PPPdKAptChKcB04hSKlfDRA5OID/h4yJ5JiZm0PZ+58jDe7miF8D00noqiq1U/CsdTgSat8YAUJBryWuOUJSKT25ViJBDD/8jR2sTSjN+KiFqwwPICxOaBp2iADmadtuNAvw3ECnOOF5GXnvNoh2jzKcFV7lurUHXhtFuOJXPZQHdsFrFF88waFKHymO46pRk51u7VLbo0seS479SdL675NIIQ6maRQUE0Cwb9RzxsHPLK9B2pJcn0stcPdJ8daMdiyyIYQLoBcE4COIxW0Hxf158x2F3z/9fsGgLJ8yun0odu9qNEwoy5edZWvcSB9ZR2ZZOqZ2kwnGeEiOXfwrKzoZpwA4JdXgapKpgEmzy+FAmm7N41IZruZI0Ji7bxVNJhnlgBDJ2jgQySI0Ik6yZPzJCZlzgs6CdyTsdT9RD9u8MNIOXtf46f382cxkAWi8AWyaAp8zv8PxNlleL1AwGdmJEFZG9EC2VPY+kpdfpM86DXeMmtJysKxPikbdLKkUVmg42LqtFXelKXR0hah5v7bwCELiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(2616005)(15650500001)(956004)(66946007)(26005)(8676002)(316002)(4326008)(478600001)(54906003)(16576012)(186003)(83380400001)(8936002)(53546011)(966005)(66476007)(36756003)(6666004)(2906002)(86362001)(6486002)(5660300002)(38100700002)(66556008)(66574015)(16526019)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VERYZy9yWkgxZmtJVmtEN3ZkM1JUeHBFUHo0SnB3VStoKzVaY1pEdWk5YWJF?=
 =?utf-8?B?WVVET0I2M0J2R2dJOG4yN214T0ZoVmRiUWM1YlFRQUx4RUlXRk51ZjBWZUE2?=
 =?utf-8?B?c0U4UHNpTU9Kb01sRkpmZ2N4LzRaWjhrczNvQmFydVBIRjhQa3pTWm8xbTFL?=
 =?utf-8?B?bExkUVJhMlJNTnd3WS85ZzlSam9NTUlYcU9HZnJDYk9tMC93YjhYQVVsVDZX?=
 =?utf-8?B?TmduNUhDSm1CazNlRFZMclh6dHdCZjNBYTFZT1JkQUFHL0NnaFRGL2YrVmtK?=
 =?utf-8?B?YU1jT05XcVRyQWVoQW1RdkR3SER6NTNDWjdiWEwzMEo4bGVSaVNEZXdXaXBV?=
 =?utf-8?B?NXVocVFFVTlla1hLdXM1dFVnaEtIdmdZWlduWGJVVmhqOXdWOWVCczhmYWli?=
 =?utf-8?B?ZUF3TU9ldzRUTlVpTHVZT2hxQXpoQm9nYjJQdzdQeFdxYW9zalNweGNYSnNU?=
 =?utf-8?B?WURWWmZON0IxbTQzRE5JTlhnaVRZWkdiL3hndUd3NS9pcDBPU1Nud2xJYy9z?=
 =?utf-8?B?cUtWYnFvbHozWnVNMWd6RzNHSkdac1dhak8wWkp6L1hqL1ZOSmF0VHdybVZ4?=
 =?utf-8?B?azhMQ0FXMVN2aTRvaVUxNzZlZmFROUZ0YVVUcllXNzZHWlF0eSt6MFRpVWtk?=
 =?utf-8?B?N3RUaEJTL3VEam5jcTdRT3BDYnErTzhNd2NXZkRhdGFCQkt1Y3I1TVg4dFdv?=
 =?utf-8?B?aTEraXZrVDRyNUJMcGt5cnNPN0ROblJKTzk0RW54RUVVV2VpZVRMb1ZGTkMz?=
 =?utf-8?B?bm5hTkJMMkdoQ1hkclFqQmdCNGREUFIzdzRMVEVWSHRlS09Iam1rZjVhSDQ3?=
 =?utf-8?B?bjAzSDZyd2RmN1VUcjhYQk53S3VwUTNZRldMYVlYS2xidWY5b0RvNjRsMWZ0?=
 =?utf-8?B?eUFXUDNxYXdHNVRwbU9UL0h2YitsblRwT1FmZnZQU2l2VlBpeURGZkI3T3lK?=
 =?utf-8?B?RGlhbjFmcWIxazNkSVo4aFV0eFFlZWRzQ2tzaG54K3dLakFCaDlKQ2RaRUZO?=
 =?utf-8?B?VXZtQWtzODc1c3pQZTAyMUtRcFg0TEFTRUJDb1Fybm5Ec0V1dDdZOTNxMkxO?=
 =?utf-8?B?WVFpa2crdkp3MzVrc0d2b1paNHN1QUJSWTJ0T0dEMERqMUkrQkRuY1llZ01Q?=
 =?utf-8?B?RVh6UWhVaFZORWY1bDJzWnlCZTRCWkV2a1FacXBjeHhZNEE0RXNHaVV1empV?=
 =?utf-8?B?WlBCSnlPQ1RvUDRoYmRWWEdpZzcza0ZBdFpMb2dMZ2l6UjB0a29GVS82cEpV?=
 =?utf-8?B?bEFWb0NPbEJwSjRPZkdvdndrQnFPZHh6clVYUVNaakF6RCtDRTZSS3ZGdWd1?=
 =?utf-8?B?UFc2dVR4T1N0SzVvTThUQTZCOFZwcWhJNDBlM1dkVUhCcDU0Q1g0QnBXOHE5?=
 =?utf-8?B?c1VNenRqblZCb21USEFWT3F3MHRqSmRDenM3VVhJTUUyQmhKTHlRN3RjUXZ0?=
 =?utf-8?B?TzIrcVl5U1k2dC9QZWM4c0V0SW1WdjUweVh6eUFpTE5pRWxRcUlhbUdDTHRI?=
 =?utf-8?B?OVVsbi9kT1I4Qm10dmJxeDBZREtDNXlnTEI2N05HN1RCR3VzSjhSb01GaDNv?=
 =?utf-8?B?ZDgvalVtRlVnbzZpQzBvYXJLYmc0RURBcEdSOGlBaVRzamxjT2gwN3BReGlP?=
 =?utf-8?B?KzFhbHEwNUxsQ3RtaDlUVkhTbGhXbUZaUUFWWHZFblNnMWtlVUc0cWZudlBC?=
 =?utf-8?B?RDdwWVhsYk9jRTl2UitLUVVFb0Z5S3JETXR1T3U0RHZXcGROZ3FXQjVXZkRB?=
 =?utf-8?Q?0Ot1DbfT5bETitzYxlIDE6r/WP5xPWfNAW3kR/K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f42dea-24ea-4112-dbce-08d914b829c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 20:05:45.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gdsHDiWF1NOF7bYSwdi3DmS8ZFiy0JSHdms3Z2ZbvTjjKHlrgVCi3E0SHeZKvvMyVfgwpUGIU4ijuQyQr4YLHobcnoQeJVcMeAKT0n/MHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-OriginatorOrg: citrix.com

On 11/05/2021 19:05, Edwin Török wrote:
> These patches have been posted previously.
> The gnttab patches (tools/ocaml/libs/mmap) were not applied at the time
> to avoid conflicts with an in-progress XSA.
> The binary format live-update and fuzzing patches were not applied
> because it was too close to the next Xen release freeze.
>
> The patches depend on each-other: live-update only works correctly when the gnttab
> patches are taken too (MFN is not part of the binary live-update stream),
> so they are included here as a single series.
> The gnttab patches replaces one use of libxenctrl with stable interfaces, leaving one unstable
> libxenctrl interface used by oxenstored.
>
> The 'vendor external dependencies' may be optional, it is useful to be part
> of a patchqueue in a specfile so that you can build everything without external dependencies,
> but might as well commit it so everyone has it easily available not just XenServer.
>
> Note that the live-update fuzz test doesn't yet pass, it is still able to find bugs.
> However the reduced version with a fixed seed used as a unit test does pass,
> so it is useful to have it committed, and further improvements can be made later
> as more bugs are discovered and fixed.
>
> Edwin Török (17):
>   docs/designs/xenstore-migration.md: clarify that deletes are recursive
>   tools/ocaml: add unit test skeleton with Dune build system
>   tools/ocaml: vendor external dependencies for convenience
>   tools/ocaml/xenstored: implement the live migration binary format
>   tools/ocaml/xenstored: add binary dump format support
>   tools/ocaml/xenstored: add support for binary format
>   tools/ocaml/xenstored: validate config file before live update
>   Add structured fuzzing unit test
>   tools/ocaml: use common macros for manipulating mmap_interface
>   tools/ocaml/libs/mmap: allocate correct number of bytes
>   tools/ocaml/libs/mmap: Expose stub_mmap_alloc
>   tools/ocaml/libs/mmap: mark mmap/munmap as blocking
>   tools/ocaml/libs/xb: import gnttab stubs from mirage
>   tools/ocaml: safer Xenmmap interface
>   tools/ocaml/xenstored: use gnttab instead of xenctrl's
>     foreign_map_range
>   tools/ocaml/xenstored: don't store domU's mfn of ring page
>   tools/ocaml/libs/mmap: Clean up unused read/write

Gitlab CI reports failures across the board in Debian Stretch 32-bit
builds.  All logs
https://gitlab.com/xen-project/patchew/xen/-/pipelines/301146112 but the
tl;dr seems to be:

File "disk.ml", line 179, characters 26-37:
Error: Integer literal exceeds the range of representable integers of
type int

~Andrew

