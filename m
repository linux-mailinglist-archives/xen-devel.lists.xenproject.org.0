Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F012C34ECBC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 17:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103610.197624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGST-000590-OR; Tue, 30 Mar 2021 15:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103610.197624; Tue, 30 Mar 2021 15:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGST-00058b-Ku; Tue, 30 Mar 2021 15:39:09 +0000
Received: by outflank-mailman (input) for mailman id 103610;
 Tue, 30 Mar 2021 15:39:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNPq=I4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRGSS-00058W-4b
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 15:39:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d480fce4-c8b6-4945-b9e5-4351e0b8ef59;
 Tue, 30 Mar 2021 15:39:07 +0000 (UTC)
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
X-Inumbo-ID: d480fce4-c8b6-4945-b9e5-4351e0b8ef59
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617118746;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i4MWx8RKyI2m57Qe4Jvz7OTy7zS3azzQ25k3aG7RPmg=;
  b=bn3ABwUP7X9coLrk+j8nICiZEVIreuoW0JqoGKCoNe6ButScufH4W2Ku
   82+2eSUKPJudWZO5t61DvLRL1gK+arBfTGP+SW5dzUXOvNd+iOM9/vqQo
   Za8oaBQE53WpFbAIvWpF6BS26XRjpsS3K8QQry6fhUevpa9bdXa/hT6Qq
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Kr2+qOSarzQqro3lZndSfU5X6T9R5zdXEGEqxWGGNGSh1YzVq21PzVrb4coxJzcIdfrzq6rnON
 p3Iwt9LcJjG1nxJGkqJ+/4jtSNj5ZzwejzQUpMqc3ggsc6OrbP41s2XopaZZ74lO3lv01l7Xbl
 43TdU1zMIdKco47ybelcyqMrBHd53TKlV3LE6JuuFYPyKTWrvHYk1iMxghUNIkdHkAwExc0E5s
 Sa/IFa5zGrkSPMuYoKRi332OEGSWgj7dhgerrDnfWNQp1p514XkV1kh3ObnOld4tpZrSSqqHjy
 W/Q=
X-SBRS: 5.2
X-MesageID: 40446671
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RQUTFaNU9iezusBcTkSjsMiAIKoaSvp033ACy112DSZIeciZit
 2jkZ0gpHvJoRwWX2wtns3FHaGGT2/V+5Id2+gsFJ2lWxTrv3btEZF64eLZrAHINiXi+odmuZ
 tIXLN5DLTLZ2RSrcG/2wWgFsZl/d/vytHKuc7771NACT5ncLth6QARMG2mO2l7XhNPC5Z8NL
 f03Kp6jgGtc3gWcci3b0NtN9TrnNHFmInrZhQLHXccmWuzpAm14733GQXw5GZ6bxpzx94ZnF
 Ttokjc3OGOovu7whjT2yv2445NkNXsjvtYQOuAkaEuRAnRtg==
X-IronPort-AV: E=Sophos;i="5.81,291,1610427600"; 
   d="scan'208";a="40446671"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHAnxPtO0J+orWj+R4E/2tJfdLS/NdoDq+zg7CmHKLWJj49y744MlMWRmrzup+d6haCWNSnv/Ly5kMXFQIxsW+4s7Fs+rVCFIFyAnDW5iCu1/uaEDZOdDKv7/ZAdAnEpLIACiqKZcRgygWNFob4c974MnD31XOcvYAeUWqCM3j3qUrEJQyY2HSlqOPF/XrwsyIuSnWTyyd4TMSTSaDteGzZbSKReEERqEhavIg0gcXGL2S8kXCh4S1aU1PaH70dtbhOL5z4rwJkv/P1qcP77ODD33wfjL0O1PQQjV/q15c+nZTohRrIRMULYJU5v79r078rItW3J5X8h1qbmVMoBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4MWx8RKyI2m57Qe4Jvz7OTy7zS3azzQ25k3aG7RPmg=;
 b=EskyG8fLui5vnXhbcWxlPda9+Vteg/c9Q4LtTKrWrP2aEYmioIIqWOBq3CZt1q53GLAqOINp7APB8UkEoE2CzfV7s9MlUffpr4RLY9FT7Nzj64gLPdNHRj8PhN2ER8YeF86zzqBy14d86qwh+08b2Mx6CgATJwHk9/HRd/eU7M9rTMAOH5XteAjaLtweAo/fcYJ9HTPcrqwxWkY7eAJ6/yEWg3anwjXaVYHXrvEqkl9XS5r7ECnV164TnBrqN7L18K/FvpFE1QsnFSFgY5tgA1WTkmJvSVZUv/TV4HY5oe5RDvTy4ANDR30lYalC080nIVRLk6mbxLgGbufANQ6BiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4MWx8RKyI2m57Qe4Jvz7OTy7zS3azzQ25k3aG7RPmg=;
 b=mt8oEsJ8s1OjN2lp1VdvBtSspoPgexNgCrvAdBzyzoiZYKtK6vGGlCqcdzNzPp1SNiwxo1Gc85ptdw0TfBRDwshMeGvGKLb+Sm+OlW1IiGqcdmNJcdHJIprMIE3CHcMwqUeK4qvrKOKTyaYG17yP8n8PKt+I4nPf/036xrJjdpg=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 01/21] libxl: don't ignore the return value from
 xc_cpuid_apply_policy
Message-ID: <62a770d0-7c78-7c57-4de3-280bb999b28f@citrix.com>
Date: Tue, 30 Mar 2021 16:38:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::36) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97de602b-1e3c-4ae3-9154-08d8f391f1c1
X-MS-TrafficTypeDiagnostic: BN6PR03MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB24181B4BE1F32366D6C90A7DBA7D9@BN6PR03MB2418.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVC/qBkNQBzuz4BXgIVZmvNe+QrqbVUHH9871mb6XsRqHBuj4BCSfBREsu/YFWUEfdpbCPCtd9/jdvZY2252Cn2n6PCnJ8MpjgcQVVALYFJIXJhju3ioFW2qk3Cxt/w6OXHQazX5KxzAUywwB01M758xwy0mLY8h+IMSU098bWNcYcLD/Rbbiq/pH8Xv03l+HxpTYD5n0YmwvAdOHoBb8mLJl9tHT+jtbhP7PXpphh4WQEF0Bu6p//Y5KaJoxRBJYa9k5NSRlWSp0UV8hQcZ6llYd4QsOHVHyfWje8kc3u7pSZN0dBZCk44Ru8Yu+fIW3/S4s0LQOAK3616G68XbESkRWmszsXQ+MUyspGb99O3hbewPmksk35uY/JO5NKqK6fVMK4CAXzB/aeWWC+jiZxgnWrCJFZOSvqOF7dKy3P/LWX2yJjy9XoaK4h5PwNAnm3oFUy7PfI0sk05fKfChAB8S41FqYAL+lCKuuEnedH7CQm/G8t3YTosDghsgPZGiKyE80WDcVhyL/TvwOibiP/O5DE+NCwGPBLy6K8HaMAZt2kRivdpPS1iamSfMDPMuPlcqRjuMyDuy1GP+HJAG4kQgeB0Zc6N089nmqf9R64idH8XIx8po2yG0U7vpYm7jdewU2YyTkQINAIxI5rB8C4DIe+AGBd6M4eT+E43YC8soNjMb04fQw5HHt0yHstTa16IBiLtVM44+wipJxSP7Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(36756003)(31686004)(8936002)(53546011)(16526019)(186003)(26005)(4744005)(31696002)(478600001)(6486002)(83380400001)(6666004)(66946007)(2616005)(66476007)(66556008)(8676002)(5660300002)(54906003)(86362001)(16576012)(316002)(4326008)(2906002)(38100700001)(956004)(107886003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUVieGc5UHhYT04yZUxnZ1hRTmRONUdlNXJHOUt4ODk4azB4UFpSRWpNRzdF?=
 =?utf-8?B?aithbDVxRGEvMkpVSkk4TEszVnNsYlIwUUVtQ2RRQ3E5L21ub2d2SEUzRlVI?=
 =?utf-8?B?d0pGL09UeURTSnJ0aUxtSGdNanFCUjB6ZitMeUVGM2w5SnBqcURvM25UcXJh?=
 =?utf-8?B?ekx3N2pCd1E1akpxQ1hVMHMyR2g5WVE3OXh6MjdDclRmaEN0ckhzQnV4MXlq?=
 =?utf-8?B?TzdaVzhrSk9rb3ZzNlZubUVhaTJLZkZxK2F3K2ZZUVVYYkdOaWpFMzRCN3Bx?=
 =?utf-8?B?VjR0bCtvVDhuOVl4dFgwWURjZWJ1NnNoQ2x5dkJkWWRoRUY5MDJORUhXcE01?=
 =?utf-8?B?VXdvTW1tUjJXNGxDbVRVQ3hLWW9TaVMvK3pMUzIyNDl0RzNYM3ZaUEE0Mjl4?=
 =?utf-8?B?Myt3UVE0QlBVeGZxN21BTWV1WVFXMlpidTlwSC9nKzBQMFZ2cDVBbUlrTzRD?=
 =?utf-8?B?NFFiWG9XcXNlUEw0MVlFUUVPMU1zeE01d200UEl6WW93eTNxM091bDRNNUJD?=
 =?utf-8?B?c2x2dTc2K3JBeDNxNUczRnpDb3QzWFIrNFBsU2t6YTFlQW03RUozK1RSS3hP?=
 =?utf-8?B?Wk5uNFNtZ09LaFY2NlN6QVRpSWNQa2tvN1NkdnZZdXVLV3BFUUExb2NyRTZM?=
 =?utf-8?B?VjZOalZ3MzloYWFvZTZZbW9Ra0M1aGtkeXNjeGs0b0tSMTBONktvVjUyRE4x?=
 =?utf-8?B?dldRaDhyMmVKcnBubnAxMThQMWU0dmJyZUVJNTdNTlN0UTlScU1OVmRHU1hN?=
 =?utf-8?B?bXNDMFZKckh5dEFGRUkxRzBzWnAreVFRbkFPTmZQa2M0SjVYTUM2QzNmYi9Z?=
 =?utf-8?B?WEt6MVpvYm9jcXpWOStTbWFsY0ZzVGF6aTBOUUpmYlRyQjBWWjUvTDBLazQ3?=
 =?utf-8?B?cWIyNHlrVlFNY2Z5R1FoYzNNZlVFVm85WE1kU1hFZVFPbDNQbEZpY1BSVjhU?=
 =?utf-8?B?dS9DalFiNkRlRjltVXd0ZkdrUEM3V2ZvQkxGaHhkMXZzYzN0Nm9TdmVuOTZI?=
 =?utf-8?B?R0pOcUc3bWR5S1JuT2hqREhqZ1NvRGZGdS9DVFN0bjRKb3VuVWhCMGhQS2F2?=
 =?utf-8?B?S0JENTREQ1pvT21GNWNJdDJoeWVSbWdZcnh5R3Y1WUNEQ0ROa1dYVTFzcTk0?=
 =?utf-8?B?YW1FSUwxRVc5K2Frc0xZM29iRFpTakJDbDRYRHVxWEgrc0cwT0FISWpCUmJ4?=
 =?utf-8?B?WStCb3NqZ2d0a2JyckhaejRCeVlOTG9rWFp5R2k5c3BrT3dQeUNvSVpDOE5W?=
 =?utf-8?B?dE1VT3dndFBMeC9INDlyRlU1azhTei8zcTFlZmhsS0V5ZUhTY3NsQTB1NEM4?=
 =?utf-8?B?bDBvN2JoeXcrcFM2ZTgwWUNqR2Z4R1Nwa2FtNGxpZTNZUWs1WFdhOUVuK1FY?=
 =?utf-8?B?YlVSVkxwSS85L2ZDbUpLbVVjSEVoRmozRy9laHVQM29QQUtCOGN4M3hmZU5t?=
 =?utf-8?B?UmtubXBWV1RvVTkwUHRxQndOeGllaWhibTQxM0R3VDhkcUQwUlhEbjdwa3VP?=
 =?utf-8?B?Z1g1WWRaNGlPMy8yYkxOWmx2WVpLNWJRamw5OGs0OXFyNFNqZ1R4eHpNTEVZ?=
 =?utf-8?B?Y1Npa2I0TmxEejRRL3dtQjhTSHg3RVI1c3p3bmhNQk5GdnZlajlCRklNSW1R?=
 =?utf-8?B?MHZEYUdocEtad0VrVklLRmVrNVFsVCtCb1VSSWdnWWY4SHhjWWxDUUZpYktV?=
 =?utf-8?B?dFVKM1ZnaFFQZENiSHVuL3JLdGZIYlVzYldTd2k1R0VsUzBvaDFERXhCdG1N?=
 =?utf-8?Q?29PP+mwByh1Lvq3UjpSMEqDuhGc5V9bCej1I8xX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97de602b-1e3c-4ae3-9154-08d8f391f1c1
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 15:39:02.6926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrDGvQp5fEKhOanEn4fnjxzwo4BJ8pjck/yTAv1ZJIqXQL0QuSn3YXf7AFz4XkKi9RNi+mHt/cqADwTFgutmLvGUDoEmq2QJOzcjfqdXW5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2418
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Also change libxl__cpuid_legacy to propagate the error from
> xc_cpuid_apply_policy into callers.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

This path has never previously had error checking.

The set-cpu-policy hypercall, in principle, returns a triple of (leaf,
subleaf, msr) to try and help the caller fractionally more than just
getting EINVAL, but doesn't actually fail yet for interesting reasons.

My plan was only to wire up the error handling with the new interface,
which requires plumbing the extra failure information through into
suitable locations, and ideally also looking up the offending values to
render into error messages.

~Andrew


