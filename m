Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052E64C2C2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 04:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461621.719733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5IRX-0001GI-0X; Wed, 14 Dec 2022 03:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461621.719733; Wed, 14 Dec 2022 03:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5IRW-0001Dy-U8; Wed, 14 Dec 2022 03:28:26 +0000
Received: by outflank-mailman (input) for mailman id 461621;
 Wed, 14 Dec 2022 03:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+hnq=4M=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1p5IRV-0001Ds-AB
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 03:28:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2051.outbound.protection.outlook.com [40.107.14.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cb79fae-7b5f-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 04:28:23 +0100 (CET)
Received: from AS8P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::23)
 by DBAPR08MB5813.eurprd08.prod.outlook.com (2603:10a6:10:1a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 03:28:20 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::71) by AS8P250CA0018.outlook.office365.com
 (2603:10a6:20b:330::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 03:28:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 03:28:19 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Wed, 14 Dec 2022 03:28:19 +0000
Received: from 141e4d6af98a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9096FD12-1C27-4EBC-B9F6-5C2DA5248CE8.1; 
 Wed, 14 Dec 2022 03:28:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 141e4d6af98a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Dec 2022 03:28:13 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB6608.eurprd08.prod.outlook.com (2603:10a6:102:150::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 03:28:11 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::eb53:5027:9f6c:cb1b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::eb53:5027:9f6c:cb1b%2]) with mapi id 15.20.5924.009; Wed, 14 Dec 2022
 03:28:11 +0000
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
X-Inumbo-ID: 5cb79fae-7b5f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTOvCLoCmMQhOdF/WWZuf+zufey6SN9JrstnA22HoIo=;
 b=l4R9cBqAEmprGLs9Wt3rHhVay+FjEqlgy5chGHbueCR0SOAZ4i3IfwDzCXbnxHJaPz826+8+aSblwR7JPTdRZL1sJ854zaL10tPMUPG4ewCtAGJX6XhbxswGwcyAQ1aKlJO6eg1XbEpnVyO9bs8dLbzSs3plOE1+cwhuM0OeZNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc05eb3cb9730310
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vjee6QjXAIjTyvKyW6HvadaFMK31r79rTVZBdsNdDaiGsMvQKuziVlRvDiJ5F84St6n1gZLst8eVMTwHc7MNBJGkQ+Ai1SqT/kvJYLBDp76ef/j9MOn8umNV0umRJE6ZlESH8FxJKWntKsmco/cNQXbv9ydVx+Uxr6ch286BnU2wBPnDkjqVODWvoIwJ1q+tcChBuhh1UnqhPQ+nyABrfsz8WWZOwdYcnZDc/ozmiUXZkfrvQNXURy+yKjIObFJljhNcKMjiF4J53RayJ5KwHhKeRge/UtqOG5di8JxsldPfA9Dbz1cOeRrwSJOdkWngNpJSlw0qY8t+Sy9qvCxJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTOvCLoCmMQhOdF/WWZuf+zufey6SN9JrstnA22HoIo=;
 b=XBwObm7GgIVdTopZ66V1r12BdCgLq9hw2ni7UHqbMBC7Wic4ph6JrgUPlq6CpeTf5nSdnoJ2sWB9JPbE6n0HljBNFVgJZ4l0dwFq+cmcxWYYJudQ/Qi96fYGTHYYIRCqgNuNXFWxd+DWdU4K/WeTUwv1GjtjQcoDyv8ZUgILJh/xVTXyV2UNRe8DIubTIg6YXBKtkdtb1QRoNgaGhhnaCcWvq03avOVWaj5uDeMiE5v9kK5qvFiov1BKtpLTfWM9/uaDcOTclryeQ8GHiREtVP2NO7o0l9T2+kVgoUQon7tYwKP2wRl/UPvncUHKptANXzE79Yzaqbw54ODLSEc+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTOvCLoCmMQhOdF/WWZuf+zufey6SN9JrstnA22HoIo=;
 b=l4R9cBqAEmprGLs9Wt3rHhVay+FjEqlgy5chGHbueCR0SOAZ4i3IfwDzCXbnxHJaPz826+8+aSblwR7JPTdRZL1sJ854zaL10tPMUPG4ewCtAGJX6XhbxswGwcyAQ1aKlJO6eg1XbEpnVyO9bs8dLbzSs3plOE1+cwhuM0OeZNU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <495b4c44-0af0-d057-c584-8601c65c770a@arm.com>
Date: Wed, 14 Dec 2022 11:28:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] x86/mm: avoid phys_to_nid() calls for invalid
 addresses
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <d503a684-1689-ef60-23e8-5eb6b33ab5c8@suse.com>
Content-Language: en-US
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <d503a684-1689-ef60-23e8-5eb6b33ab5c8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::19) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|PAXPR08MB6608:EE_|AM7EUR03FT010:EE_|DBAPR08MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: b94eb001-fca7-4fdd-adba-08dadd833f61
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ClhoVq2D7NWSzc1xU60QUcbclxP3R/vn2t82eiSX4j4e/Kj7vQ9Tz6ENanvPKVqQ95nqPEfr03R6FZmnZTzJjeJt6RC/NJ1i5SxWw9mnnNJ3xMNncuKpwXln0AdCuCIL/prBu4l3H/bMUNn3dENGrIlctQCbpVwjnloBJZ+UezJBkdIZo6zKzERwk0c930LYtujftA1REd265IykB/yZW+1a2LP84YiFT7XlpG4sdkv3u3W7AOPB1Qu2IisM20dCKDn1CM574Xqx1r0DJTcUcE1a+HweVD2k/fOl+yD5wkpqiNiul0ui/raIXdMIciR1ACyA0GTWGlQwBbZ6OOX49JvY7RdTzbL0w5pUPnTqY93+vF8bEi82mCFNKuESDS+F7TV8loD4ad4tb4i1eIFkKWyuwryoAgdDprDV6bd9FBFji0MANRUPt8L9LzJ5X82XWa6MlMRSiG0EU1bamsAhLKoGvRAUGF+EuEzQ9xQfRoWR0shg7ggDgrZr+mYr3mjN5gBXEFHN7Swx56jkbyhRI+jJxItQkGYESACTQCKkoyBBZEDor/o8UVZIKkIzj8tt00NdCV6NMtDLu1wGikkBfckC43tW2Xrmt5rNrD29tXaIXu4eE6cbtVqGlG5bh9jZ+mSFTvIghIqvtjlpkBd9marhoVBZGR/t3kNZGZbiEMDOC6qwN+qmpXUaetYX5SDNyLR1r2oGHijfkbzg31XGTyBMy5tSPcBR0Rq8GuKTDQ4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199015)(8676002)(66899015)(4326008)(36756003)(83380400001)(41300700001)(186003)(66946007)(6512007)(6506007)(6666004)(66556008)(53546011)(66476007)(26005)(31686004)(6486002)(478600001)(316002)(2616005)(54906003)(2906002)(5660300002)(110136005)(31696002)(38100700002)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6608
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d0d251f-32cf-41fa-3753-08dadd8339cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MvptXZ52XMCEbRvvk6YAOez3s2o6g86tCA5dkbRa87znf9FE46256hRoQWoD5/MqyNjgXUj0ky3jNfFII8rBpfeien+C/BUaL9tIP4UNC2kOFjTzLSS2sNVAGJE2zOs5why6BD5Maiw0/2xAkL3LEWpe+1dU9Am1Ep9xP5/T3D2PGInocFhuQ5Cs01BDKCIKQ2av5AXA0+Z3HMfBlMchhQJMd6Tg4CvfZIVQEZnlm2URnF864zcz7qvCnllyHC/yp2BCU9bgIB5fWbMBWEdg95i/JaONAbdsfs/+fs4uCDwNYI1eyg+ctCswH3YBuYGfBwGAC5QZap35miPKRN878foDbVtzJgHHKsRls0dGx4C+bG4sSUh6Gwo/ZLAQXP4ryviZYVOYg8twOy5rDB+kX1IQSOZP73//5z2CcX3/Tjoogw+Gv26Y0Ym1vOdKNw5UGXLg7gpIK00Do6JI75fP8kXdZnEbBhDaw0DLGf+L5RoR9A5QUBjalBwhelhc0DMMlJK/y9yxemHq29h0gLSy4xv8cVWJCEL88NjZEH13vpOfbwfI+vSZkqdH891YXgBxV6uyXH799a96H3hNi/txLMbANLsBwbSvvSGChJWQoN9Je08wL+6cy0eOBL+kPHYWT5FLm3RsmR2vmj3ADGbpCOYPIB4tlgcbOdeHXUwN8S8dc8ynWxzQKuqOPdpEFidzVEZFj00eITvDhqE2fA/GSgIybSXLbsq2wGb4CKMe3HQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(40480700001)(356005)(40460700003)(86362001)(31696002)(316002)(110136005)(54906003)(478600001)(107886003)(6666004)(6486002)(2906002)(5660300002)(8676002)(4326008)(70586007)(70206006)(8936002)(41300700001)(81166007)(36860700001)(82740400003)(6512007)(186003)(26005)(53546011)(6506007)(82310400005)(83380400001)(47076005)(2616005)(336012)(66899015)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 03:28:19.9541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b94eb001-fca7-4fdd-adba-08dadd833f61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5813

Hi Jan,

On 2022/12/13 19:36, Jan Beulich wrote:
> With phys_to_nid() now actively checking that a valid node ID is on
> record, the two uses in paging_init() can actually trigger at least the
> 2nd of the assertions there. They're used to calculate allocation flags,
> but the calculated flags wouldn't be used when dealing with an invalid
> (unpopulated) address range. Defer the calculations such that they can
> be done with a validated MFN in hands. This also does away with the
> artificial calculations of an address to pass to phys_to_nid().
> 
> Note that while the variable is provably written before use, at least
> some compiler versions can't actually verify that. Hence the variable
> also needs to gain a (dead) initializer.
> 
> Fixes: e9c72d524fbd ("xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: With small enough a NUMA hash shift it would still be possible to
>       hit an SRAT hole, despite mfn_valid() passing. Hence, like was the
>       original plan, it may still be necessary to relax the checking in
>       phys_to_nid() (or its designated replacements). At which point the
>       value of this change here would shrink to merely reducing the
>       chance of unintentionally doing NUMA_NO_NODE allocations.
> 

I think it's better to place the last sentence or the whole RFC to the
commit log. Without the RFC content, after a while, when I check this 
commit again, I will be confused about what problem this commit solved. 
Because just looking at the changes, as your said in RFC, it doesn't 
completely solve the problem.

Cheers,
Wei Chen

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -498,7 +498,7 @@ error:
>   void __init paging_init(void)
>   {
>       unsigned long i, mpt_size, va;
> -    unsigned int n, memflags;
> +    unsigned int n, memflags = 0;
>       l3_pgentry_t *l3_ro_mpt;
>       l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
>       struct page_info *l1_pg;
> @@ -547,8 +547,6 @@ void __init paging_init(void)
>       {
>           BUILD_BUG_ON(RO_MPT_VIRT_START & ((1UL << L3_PAGETABLE_SHIFT) - 1));
>           va = RO_MPT_VIRT_START + (i << L2_PAGETABLE_SHIFT);
> -        memflags = MEMF_node(phys_to_nid(i <<
> -            (L2_PAGETABLE_SHIFT - 3 + PAGE_SHIFT)));
>   
>           if ( cpu_has_page1gb &&
>                !((unsigned long)pl2e & ~PAGE_MASK) &&
> @@ -559,10 +557,15 @@ void __init paging_init(void)
>               for ( holes = k = 0; k < 1 << PAGETABLE_ORDER; ++k)
>               {
>                   for ( n = 0; n < CNT; ++n)
> -                    if ( mfn_valid(_mfn(MFN(i + k) + n * PDX_GROUP_COUNT)) )
> +                {
> +                    mfn = _mfn(MFN(i + k) + n * PDX_GROUP_COUNT);
> +                    if ( mfn_valid(mfn) )
>                           break;
> +                }
>                   if ( n == CNT )
>                       ++holes;
> +                else if ( k == holes )
> +                    memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
>               }
>               if ( k == holes )
>               {
> @@ -593,8 +596,14 @@ void __init paging_init(void)
>           }
>   
>           for ( n = 0; n < CNT; ++n)
> -            if ( mfn_valid(_mfn(MFN(i) + n * PDX_GROUP_COUNT)) )
> +        {
> +            mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
> +            if ( mfn_valid(mfn) )
> +            {
> +                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
>                   break;
> +            }
> +        }
>           if ( n == CNT )
>               l1_pg = NULL;
>           else if ( (l1_pg = alloc_domheap_pages(NULL, PAGETABLE_ORDER,
> @@ -663,15 +672,19 @@ void __init paging_init(void)
>                    sizeof(*compat_machine_to_phys_mapping));
>       for ( i = 0; i < (mpt_size >> L2_PAGETABLE_SHIFT); i++, pl2e++ )
>       {
> -        memflags = MEMF_node(phys_to_nid(i <<
> -            (L2_PAGETABLE_SHIFT - 2 + PAGE_SHIFT)));
>           for ( n = 0; n < CNT; ++n)
> -            if ( mfn_valid(_mfn(MFN(i) + n * PDX_GROUP_COUNT)) )
> +        {
> +            mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
> +            if ( mfn_valid(mfn) )
> +            {
> +                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
>                   break;
> +            }
> +        }
>           if ( n == CNT )
>               continue;
>           if ( (l1_pg = alloc_domheap_pages(NULL, PAGETABLE_ORDER,
> -                                               memflags)) == NULL )
> +                                          memflags)) == NULL )
>               goto nomem;
>           map_pages_to_xen(
>               RDWR_COMPAT_MPT_VIRT_START + (i << L2_PAGETABLE_SHIFT),
> 
> 

