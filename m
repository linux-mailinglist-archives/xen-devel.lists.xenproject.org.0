Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC43F4B8863
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 14:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274117.469472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJwc-0008Uk-IU; Wed, 16 Feb 2022 13:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274117.469472; Wed, 16 Feb 2022 13:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJwc-0008Rt-E6; Wed, 16 Feb 2022 13:02:06 +0000
Received: by outflank-mailman (input) for mailman id 274117;
 Wed, 16 Feb 2022 13:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbM1=S7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nKJwa-0008Rn-GA
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 13:02:04 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe09::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a16d9192-8f28-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 14:02:02 +0100 (CET)
Received: from DB8PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:10:110::31)
 by AM6PR08MB4755.eurprd08.prod.outlook.com (2603:10a6:20b:c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 13:01:59 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::99) by DB8PR04CA0021.outlook.office365.com
 (2603:10a6:10:110::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 16 Feb 2022 13:01:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 13:01:58 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 16 Feb 2022 13:01:58 +0000
Received: from 34074e011fec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46AF6948-0894-4B8E-AD2E-772B45101CD3.1; 
 Wed, 16 Feb 2022 13:01:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34074e011fec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 13:01:51 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by DU0PR08MB7487.eurprd08.prod.outlook.com
 (2603:10a6:10:357::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 13:01:50 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 13:01:50 +0000
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
X-Inumbo-ID: a16d9192-8f28-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYnuAoGLLD+lAvfFx1UlXOA8KGYr5Gj5bO9LfnifR7M=;
 b=3GGJyLfhWjc4HjFGq+tNYgvt6h0IIXdtVEkSeWp3+R04hYSwAMDSp8NBRAom0VtrNKGKIuCaH03WgtQztIql3JDtYa+NNVxr4AhkxIgnGTDgBW28d5uV1e4AjpZ13xjiBZRwl4npBHRGFPf1gvVGDT24DQIC1mfkvCV3T+JnnA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 520dbcdd9541ea34
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS9oYQIDO8jrUCq1P2fAcGfPAz9YkIf9Rv/9Bpv3W9MhTtn6U9Vdk7kDbF4LkwXPd9XfoIRnN9FujKmJBhfTJKrFlLdVJKJYezPPh+vatT2c02nlVuRnKk+b2IWdieIEnfuuw9aWf6117Bn9nTVsPL06Z8ioLrLnn4iH7HciBFXvLpqWjEhrhkNOdE8gJWumGntJATBaVz+khkPCwcNUiOvAztRm6T/PORQJNqNt6ah7rxpRdD7DfF4XJUBGynZmsa4KiQTXveKGY5mCMYKJm7XFF62FyPyVLzgqbof9zQRg98CfR9R02wZ4IEcKBCLFoNXWel6EBEBwJE17D9/ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYnuAoGLLD+lAvfFx1UlXOA8KGYr5Gj5bO9LfnifR7M=;
 b=cmbU2vr75/BjWd6CiCSJEJn4CRllO8mum1a4HpBpzQvfsUTHlq3U2JFioJSuwinY3Fb9RuGjrwO69ImJEpCM1zhdq4rJIFSiAZSKs1QdAHPb+N7Xus00lGPTmwtCVCxh+ejE0lckUNHAk6Tzivkt9AAIU/9TsrsvyUzU4ZSApJ4qoH9nTGxwgJVq269wOj9pNXbkDvBJKzNTOba44YVMApi1KHdnwaZ6z4ZpyfoMMLkyOKrcZJ8dFIGW3VuL0AySET9rGa87o/PjAq6X2i1eJ9r7hewjzG0YGFAVd3kRnBcyYpuuOQb+II/TmhmnXWf8ssBaMNoJdOoGw0QpKjsz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYnuAoGLLD+lAvfFx1UlXOA8KGYr5Gj5bO9LfnifR7M=;
 b=3GGJyLfhWjc4HjFGq+tNYgvt6h0IIXdtVEkSeWp3+R04hYSwAMDSp8NBRAom0VtrNKGKIuCaH03WgtQztIql3JDtYa+NNVxr4AhkxIgnGTDgBW28d5uV1e4AjpZ13xjiBZRwl4npBHRGFPf1gvVGDT24DQIC1mfkvCV3T+JnnA0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <44d2673b-2450-81cf-5d3e-9afb23ae09c6@suse.com>
Date: Wed, 16 Feb 2022 13:01:44 +0000
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D92168D-DFD6-4B1A-9079-FBFDDA9F2969@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
 <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
 <44d2673b-2450-81cf-5d3e-9afb23ae09c6@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO2P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::13) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6bdcef03-6ff2-41bc-710b-08d9f14c8404
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB7487:EE_|DB5EUR03FT054:EE_|AM6PR08MB4755:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4755C6F07EAE4A1B6E0BC4EFE4359@AM6PR08MB4755.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KyDMVndrItDtop5fF7UidqJ3KDpeQlAbR+qqK0B0o6E8F0VY7tSFwTN/6lNfSJWbO471M29+XtW+yNDkOpd7JMXjQP7TMEC3mMm6YYvRMoRsygFTFbYumlHBqEz63xUc9j2yR3KtYoYn6iyA0dbksAPv3XjZEBUTcDJ/MjZRe6bcjmlyZ+6EMwgqoHzwJr3q9pypVquv1TxmEWSySeE0r7LjwH/L2JZqc2BNaBFX3zen5UL290i9myR0hi1VAKygzfdawgVs6bdtYuokAOGPIB5kk1rvgwhKZ/cvVByq0e8255FJHNiaZTjmZtvgBs87xJZhRng//u4YSk17TLfh0r38+m5JKtui3ae+eLjt/sroG9Uov4EOx6uGkjIPxDmyaYJMOYsTYh1pTHEj+vuprxJ431A3NoZAplufpL6i1b9BjnRUBwMsWJpRV2m2lRc3tai5uBLp6MWByfm3NeLIYbbEW9GN+NCfX4ufVpJt9VnmRNYfpMMUR+f77eWU/FKfpcRqaF5QO04/WaSR9TjSUt32U9imvZlLSxF8VvnQk1z3uNiVROJbTyzFtgM2heIhH6wXO0lS1j3vdaj8JkR4yNXTX+TYGEyR0V7YqQEepqr7A0xjyXWuxQaVeW63ammnk6ilF68lZN8RU0CpMLU7ye9oSrtMA2lHCyrxLbTaoiaWi9EQkwywEBKYsJFC9V1fu/Me5N9aXpAojNsrYRTTpAurc/JTXrLpMm3Q6JE3idIrdBMzZxJWBidHvFp5HAI8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(5660300002)(8936002)(66476007)(44832011)(2616005)(38350700002)(38100700002)(86362001)(36756003)(2906002)(6512007)(33656002)(26005)(186003)(508600001)(52116002)(6486002)(6506007)(53546011)(6666004)(8676002)(66556008)(4326008)(83380400001)(54906003)(66946007)(6916009)(316002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7487
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61f719e4-1aa0-402c-0ae9-08d9f14c7ef1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z0qrsjFs/1OD6BFWC7UJkVOzgLf/2HG4wCjzxUDbERWwBb/uv6Yxr2cKAhVqgl7cUo0sTF7Pa8MX/Ig25aPptv92o6GdccfbfaVzQH/FoBKvxMCq2V86Y6hIA+jLv6S0302I4yZOMvIbmGjpBHKQITvJkT+TiQaqa9dtngel0di2Qpx2piMyNzxzo9KLpZAzwlfOWm1tAukMmAhPcx4ScXUXRDDoCSCEhVY3k6xrgZ8TTfDUM/hQAiEZlbuHsAVq3BDMptymOFFbfyYVxH9Z+tfhESyrbFECEbhbtHmJc52PTYae4DEyVCfU3VCjCrqPFQHYcIUm42asvvgHNDbHlOa7mNS+v0S5ZMGTml6jFvbRZCbgcpL0BVLQles8vOi6T2iAtC7PPWEI263iW6jrtIaInI4lijwvakpZ49kccvYBjAagz2ngkaYHGzi1Yf7VeSSFsxyRpeze5/az4uevFx1M+3nGVqg4gJpSj6+KjvH+92EIv3CCYqf5gK/Gj33Fv/GvQLRa8kLcYFR0a55lCX0xkTRt1FEdhtH5fxFMgqqZRUP3qZkqXtCSHdV2Vjd1jgZkKgJEFxnGPqqD8hSJcOOsXuwCeY1LNI6mjTowMGiKQ5RW801uk57h+5YmaKghkXK6R4cFtQlhpDq33if+HLvLN2YVO2cYbda7OC6BASXHmNteFF3FIBor/tpMjr3T
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8676002)(6862004)(4326008)(83380400001)(36756003)(40460700003)(70206006)(70586007)(53546011)(6512007)(6506007)(86362001)(2906002)(6666004)(81166007)(356005)(33656002)(82310400004)(6486002)(5660300002)(44832011)(2616005)(336012)(186003)(26005)(8936002)(508600001)(107886003)(36860700001)(316002)(54906003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 13:01:58.4171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdcef03-6ff2-41bc-710b-08d9f14c8404
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4755



> On 16 Feb 2022, at 12:55, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 16.02.22 13:10, Luca Fancellu wrote:
>>> On 16 Feb 2022, at 02:45, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> On Tue, 15 Feb 2022, Luca Fancellu wrote:
>>>> Introduce an architecture specific way to create different cpupools
>>>> at boot time, this is particularly useful on ARM big.LITTLE system
>>>> where there might be the need to have different cpupools for each type
>>>> of core, but also systems using NUMA can have different cpu pools for
>>>> each node.
>>>>=20
>>>> The feature on arm relies on a specification of the cpupools from the
>>>> device tree to build pools and assign cpus to them.
>>>>=20
>>>> Documentation is created to explain the feature.
>>>>=20
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>> docs/misc/arm/device-tree/cpupools.txt | 118 +++++++++++++++++++++++++
>>>> xen/arch/arm/Kconfig                   |   9 ++
>>>> xen/arch/arm/Makefile                  |   1 +
>>>> xen/arch/arm/cpupool.c                 | 118 +++++++++++++++++++++++++
>>>> xen/common/sched/cpupool.c             |   4 +-
>>>> xen/include/xen/sched.h                |  11 +++
>>>> 6 files changed, 260 insertions(+), 1 deletion(-)
>>>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>>>> create mode 100644 xen/arch/arm/cpupool.c
>>>>=20
>>>> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/de=
vice-tree/cpupools.txt
>>>> new file mode 100644
>>>> index 000000000000..7298b6394332
>>>> --- /dev/null
>>>> +++ b/docs/misc/arm/device-tree/cpupools.txt
>>>> @@ -0,0 +1,118 @@
>>>> +Boot time cpupools
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +On arm, when BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, =
it is
>>>> +possible to create cpupools during boot phase by specifying them in t=
he device
>>>> +tree.
>>>> +
>>>> +Cpupools specification nodes shall be direct childs of /chosen node.
>>>> +Each cpupool node contains the following properties:
>>>> +
>>>> +- compatible (mandatory)
>>>> +
>>>> +    Must always include the compatiblity string: "xen,cpupool".
>>>> +
>>>> +- cpupool-id (mandatory)
>>>> +
>>>> +    Must be a positive integer number.
>>>=20
>> Hi Stefano,
>> Thank you for your review,
>>> Why is cpupool-id mandatory? It looks like it could be generated by Xen=
.
>>> Or is it actually better to have the user specify it anyway?
>>>=20
>> Yes at first I thought to automatically generate that, however I needed =
a structure
>> to map the id to the cpupool DT node. Here my doubt was about the size o=
f the
>> structure, because the user could even specify a cpupool for each cpu. I=
 could allocate
>> It dynamically and free it after domUs creation in setup_xen.
>> What do you think could be the right way?
>> Or the dom0less guest could specify the id, but I like it more when usin=
g a phandle to the
>> Xen,cpupool node.
>>>=20
>>>> +- cpupool-cpus (mandatory)
>>>> +
>>>> +    Must be a list of device tree phandle to nodes describing cpus (e=
.g. having
>>>> +    device_type =3D "cpu"), it can't be empty.
>>>> +
>>>> +- cpupool-sched (optional)
>>>> +
>>>> +    Must be a string having the name of a Xen scheduler, it has no ef=
fect when
>>>> +    used in conjunction of a cpupool-id equal to zero, in that case t=
he
>>>> +    default Xen scheduler is selected (sched=3D<...> boot argument).
>>>=20
>>> I don't get why cpupool-id =3D=3D 0 should trigger a special cpupool-sc=
hed
>>> behavior.
>> Cpupool with id 0 is embedded in Xen, it has its own special case handli=
ng in cpupool_create
>> that is giving it the default scheduler. I thought it was better to leav=
e it as it was, however the
>> cpupool0 scheduler can be modified using sched=3D boot args as it was be=
fore.
>>>=20
>>>=20
>>>> +Constraints
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +The cpupool with id zero is implicitly created even if not specified,=
 that pool
>>>> +must have at least one cpu assigned, otherwise Xen will stop.
>>>> +
>>>> +Every cpu brought up by Xen will be assigned to the cpupool with id z=
ero if it's
>>>> +not assigned to any other cpupool.
>>>> +
>>>> +If a cpu is assigned to a cpupool, but it's not brought up correctly,=
 Xen will
>>>> +stop.
>>>=20
>>> Thank you for documenting the constraints, but why do we have them?
>>> Imagine a user specifying 3 cpu pools and imagine the cpupool-id is
>>> optional and missing. We could take care of the cpupool-id generation i=
n
>>> Xen and we could also assign the default scheduler everywhere
>>> cpupool-sched is not specified. Maybe I am missing something?
>> Yes we could make the cpupool-id optional, my doubts are in the fist com=
ment above.
>> Whenever the cpupool-sched is not specified, the current behaviour is to=
 use the default scheduler.
>>>=20
>>> Does cpupool0 has to exist? I guess the answer could be yes, but if it
>>> is specified as id of one of the pools we are fine, otherwise it could
>>> be automatically generated by Xen.
>> Yes cpupool0 needs to exists, however it is still generated by Xen regar=
dless of the DT
>> specifications. In fact you could not specify in the DT any xen,cpupool =
compatible node
>> with the cpupool-id =3D=3D 0 and Xen will generate the cpupool0 anyway
>> (Xen internals are tied with the existence of a cpupool0).
>>>=20
>>> In any case, I don't think that cpupool0 has to have the default
>>> scheduler?
>> Ok I think I can create a function to assign a scheduler to the cpupool0=
 after its creation,
>> I would need to test it to be sure I don=E2=80=99t find something strang=
e.
>>>=20
>>> My suggestion would be:
>>>=20
>>> - make cpupool-id optional
>>> - assign automatically cpupool-ids starting from 0
>>>    - respect cpupool-ids chosen by the user
>> Ok, it would start from 1 because cpupool0 always exists
>>> - if some CPUs are left out (not specified in any pool) add an extra cp=
upool
>>>    - the extra cpupool doesn't have to be cpupool-id =3D=3D 0, it could=
 be
>>>      cpupool-id =3D=3D n
>>>    - the extra cpupool uses the default scheduler
>> I gave all the unassigned cpus to cpupool0 to reflect the current behavi=
our, so that
>> a user that doesn=E2=80=99t specify any xen,cpupool node ends up in a sy=
stem reflecting the
>> current behaviour as the feature is not enabled.
>> However I can say, if no xen,cpupool nodes are found then assign cpus to=
 cpupool0,
>> else assign them to a new cpupool and...
>>>=20
>>> If the user created cpupools in device tree covering all CPUs and also
>>> specified all cpupool-ids everywhere, and none of them are 0 (no cpupoo=
l
>>> in the system is cpupool0) then panic. (Assuming that cpupool0 is
>>> required.)
>> =E2=80=A6 panic if cpupool0 has no cpus.
>=20
> Today cpu 0 is always member of cpupool0, and changing that might be
> hard.

Oh, are you sure? I did some test in the past for this serie using a Juno b=
oard,
giving to cpupool0 only a72 cores and the a53 cores in another cpupool, my =
Juno
firmware configuration makes Xen having the boot cpu (cpu 0) to be one of t=
he a53
and it was working fine. But it was long time ago so I would need to try it=
 again.

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


