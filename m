Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36363ACE47
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144748.266383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG52-0003qH-VU; Fri, 18 Jun 2021 15:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144748.266383; Fri, 18 Jun 2021 15:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luG52-0003nk-Pt; Fri, 18 Jun 2021 15:06:48 +0000
Received: by outflank-mailman (input) for mailman id 144748;
 Fri, 18 Jun 2021 15:06:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luG50-0003ne-Nm
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:06:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6dfbde3-9f32-4a01-b80d-48a217fc3b94;
 Fri, 18 Jun 2021 15:06:46 +0000 (UTC)
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
X-Inumbo-ID: f6dfbde3-9f32-4a01-b80d-48a217fc3b94
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624028805;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/svcxhVG8EEGRY/VXc0QLq6Tln/BQuqmJRcsq2pI20U=;
  b=efbORxzw4jZgzDSuN2463l/KUENKud2EGH1O+qz4KCMaMtQ2eP+qU7Qp
   CJB9O4njFIRGxTAFnmQRGc7b5gHyb9YpUqhWSmdAmXCVBusW3qwN6K7Wj
   lO2XdmvcsadZtOwkHOQSANpFyNdBDJAgUuuFtfxA2GeNAaVA4yGp6WjuV
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ccv9kBffNnDsJTR4D4BIIbBG+3WoJjiqEeQciv9WRkiQdo25v8A+H1dvnSxfnyDFD9q9rGyLhk
 dT7a0+JRu+KUhIKdSYVo75QDX02+iOKj9dv+OQ6VfwLe85MZ0CIm89wdemka4uRqASfcmQLJDF
 AyZv80CAX6btDYvlK2nFagxHGpfiPIgHSgqv0vAYcV1I2y6hzQcr/fS+co5T23Vh/TnuGuy1GG
 nhc5e4gt4P6HwUcLxOSPpBnbMfA4YPN4u1USsv8vWQ/1OTLAIJDqc2a2s5FH06L51CRQghCMEX
 tPc=
X-SBRS: 5.1
X-MesageID: 48057106
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:k9gk1qvFXntY024ySoyz2Cv/7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="48057106"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqEfkzenuIE1ZxJLrt5PR55ESqCdHKjq15YY/gYa91oKATdRBOiBVyBFrlqIzr5/JeJsI4Q3Y2rrrUG4aw7CQI6X+nMphQf8cTQDi4OQ7rTfSdMmMk59bqpcFT84lGVEH/XwMFCZzWPmREDum5XopanzRqjxMi+DHONS3NV57i+fGNamZlaCk/1quaczLi+JWoetmcQtuWCtiLhOmvTB1UPHGxHp8h3kgfFqLuiUZzCP0z6hI2y9NwUPpCJpNCJidOXRDK4fquB0aLWV/mkMCIQLu5YhfUn/zKSy/232LxRFn2XpVqwV3VbiehvesDxVsQsomcUdPCq+70QSwF3LBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5sO1dSzaUua+udKhamhVhm6K1msGtIfc37nbI2hxgk=;
 b=QKJWD05+9H6GMKi4kjUXlDT5tze3u0BJJJwIoLcRMr0We/sTm4wgv0YANMKWhWcqE76voPcO4FZ7I+w1gWDkgxupTW4CNf+PRLVAK3g3IEXYjgwl3u5iXunVg64X5U99FYahJYb84ipBBlf9OSOiIbw2GF1i6rc7WufM5UKfr22ZXxSgi4sufxEcxBx0R1M0x46Pfi0Zxf++B3bBQRArAWULx6IA+cpUZ5WLuxRFwW3chqKtOJ3lOWZKtPShK+CCrhZD/rmqDqrMaCa9DjfYWPpaTOOk9vQUXrB6Oi7nnRWpNXPl5k7W2PXeWnxwN7qvvvA2wh5RuJamMrhV1EwI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5sO1dSzaUua+udKhamhVhm6K1msGtIfc37nbI2hxgk=;
 b=A6OABJGnzHAggjlH8yNYfdu/PGX/SWP0dpwNb14oprBALm2gvZCWyDCdBOiUEX8N0lvKBQ4kidcRHqLABoRVXi5czat7GYnUb2C07K0RhVmPGs7oQ+IzL0RdzRIxGZ21i+oxfMazpdllnVPOjozlAwcvX4epMZdWz7NJvJv/NrI=
Subject: Re: [PATCH 5/5] libxc: make xc_domain_maximum_gpfn()
 endianness-agnostic
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <99979695-e53e-7764-85e1-64dd4cf9447b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bcbf4a71-bf30-5a9e-a399-d4366ee95423@citrix.com>
Date: Fri, 18 Jun 2021 16:06:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <99979695-e53e-7764-85e1-64dd4cf9447b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f53653f1-849e-4e23-0b19-08d9326aad11
X-MS-TrafficTypeDiagnostic: BYAPR03MB3560:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3560259CD1B1658878496865BA0D9@BYAPR03MB3560.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqA29SAkKc/NCD0iX5eHclMaYM6FeQexQJRWEe8rjRh+/cgw2cCedular9IHNfYgEOYXZIJC6lKeU6z9oTT0983IPRDkbMbl602egSC5DyWY4uIokzV1pHeKIjgEnP+MF10DUoQtyKHyKwhyKZwUlOq34wboKhS1pfiOd27gYFdawpbDF3ofPX3UJkSMR3OBiDmJad5ffOsjmVAYqyC/idy/a75P1AEZS1p4RLBFbsntprw8hzj4GgYv1WEbKQEVTzKrYio/J4pedIE9oyNSld3sajafB7bymgggwG5X71Oe1VGDEaiHWL6He3y4HVCZytiKu6CdDnXST3OYV0tueRWFGCtULdM9QhynqvnAzSUsQ7w2wErISm447n0YCqClEtxzCb9Lp1PcREF+T4E8DjCgV2th6PF2CnjAamQfOnjOBea+VDY2BZBCaBH2q4Ic5Rkv0TwUL9lBXel0gBb+0h3bXwRUw0aAvjdAm0EId57DI3K6Be8Z6yML5odKaezSbJ3DYgnz6On/CYvLUVeLG1iFTWaJNaa0z7ZzfVWOp8guFNkCO+VrfeXtj5rLz7RL8Ixhw5x9SSOh5o7XXVKWD5KrM7MkuDscq0ophlMyNPRgqjJzoXcFYtZf4WD61oa8JGPgkFhuKMNbcfyOVl1k9cJqux1aP9Af/pKscy5+lF7bCqCq3OYdmGrjg4hoRmUh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(86362001)(8676002)(478600001)(2616005)(2906002)(36756003)(956004)(4326008)(8936002)(110136005)(66556008)(16526019)(6666004)(66476007)(6486002)(16576012)(38100700002)(66946007)(316002)(5660300002)(26005)(31696002)(54906003)(53546011)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWpXZE9xNTd6aFlWZHRKbUZoWXRNckxrd3AwOUFBV04yY3JOSlg3TGNoeXZM?=
 =?utf-8?B?MW91dW8yalFMMUxOeG1mMlZWc1Rta1BIWU9kdG4rNHllQi9lN3g0dE0vVnZG?=
 =?utf-8?B?ajloek9wa0xCMC83U2NCR1BmMHArR25JK1YvOWljNlozRzFpcG56cGJRcGJC?=
 =?utf-8?B?UDR2SjdjSXZRUFJzVHIzMFFlWmFWRHdMdVluZVIvOGRpTlpsanR6dG4zYmZ4?=
 =?utf-8?B?RmJiNFdEckRWTWtrQlNBZEpVZ3BQTGxlaVpGRnlTVHFxSVF2aWpwclJsVDFz?=
 =?utf-8?B?MkFkei9rTlFYWVZWLzc1UGhWUlNmTmtxQkQwYS9QbmhsNzdjVlNwUnNzNEU1?=
 =?utf-8?B?eVFlZ3p0UFY3R2ZtQkZtRExUQ2hFNDJIYXpINlVLcjcvOTBNTG5RUGUxVFkz?=
 =?utf-8?B?VFZDVHJpR1N4K3V5L29adUlGd0J1TzQ5eFlOTEQyTG1rN1kyK2ltR2UzNHkz?=
 =?utf-8?B?bjNCdkRaV25FZlJydVl6L1VHbkxHd0c3ZUNOVWV6dW11R09ESjBMQ0NaQjN2?=
 =?utf-8?B?N0ZUZ3hRcHlaak1GYnJ3eGtURjVURmhxTlVnVnk5dGtrNjFGdWdnaHkvQkw5?=
 =?utf-8?B?RXEzVXZOVG5JUGJFM1ZaYmZLWXJ3NkpjeXFGeTJZcE50THo1L1hCcnVyZStO?=
 =?utf-8?B?RE0rcEFUdVB5WGw3UHhmb04vZW8wa0UzMVF2NGh6aWhEN29MOVJUeThnYjNt?=
 =?utf-8?B?MFV1Lzk4YU1uM2prNmE5czcyUHh4R2xYOEhMa1ZUVW5NMm5MV3dSQStGMG16?=
 =?utf-8?B?bjB6SnpRVTVMMmdOK1d5L1FSSE9qN1QrL1Jta0k1SCs3aHZERzhOY2d0dnNx?=
 =?utf-8?B?UnlJTno5MHhQRlBUWEl3bFlvMTBBZjJvVDR4R05xOTdEcVpDa2t0RDF2UmMr?=
 =?utf-8?B?dFl1K0VkZU5BTzZEVExvMkZSOHRRQWFqS2lzZEpOMWFmbGxUcDF4N2dWcFF3?=
 =?utf-8?B?RVE3K3JUaGJYWXdkUnVRN0xjNTFacGpYZlBmUWEzVUF3VE84a2NrazFmRjkz?=
 =?utf-8?B?UHpFc2F1dVpFTGtpSEtpZUhJRXoyWTU1MmJkOTNyZXYvTG1BWUFQczQ5OFBG?=
 =?utf-8?B?VkExQXBlYUpoRHFVNE5GaCtBbVp3ajZlZW5aUzFWWnUvOGd5YVJacGRPenRW?=
 =?utf-8?B?NTFyejdLMmdnUElqVXBaMEhWUHpzVXVvaTJHTlB3UHlKamQ1dWpNWldmeXNq?=
 =?utf-8?B?NmVFTDVMR3o1cHZhTHFJUnR4M1EvdXRxL3VraTNNV3Q4U1E2WnlUb2huY1E3?=
 =?utf-8?B?NlF5Wk5IcDBHZnFmYjRqZkt2R2h5RUxma05LQnl1Tjd0VU5wVitsVGE5bG4r?=
 =?utf-8?B?UUw1RmNVWnA0U2VoRGlaWXArK21sZkx6NElpRXRMTmt3MGhuYUh5bnd5MXJG?=
 =?utf-8?B?ampZd0NJNm43Mnk2a05RTXpUdmRCYmJMTWROTm9KcCtua1dVc1I0aWNGcHFR?=
 =?utf-8?B?UUZCZ1FqTkhGNVh1Mm1JeXJiQThjY21nSktHUEc4WkRBb1BDazY4UVhadDZk?=
 =?utf-8?B?cmwyTzdXRkpmK3VlMEd2ZHZnZUY5MjZFMU0vR25XM0lMd2R1Nmw3Y1YwbHlC?=
 =?utf-8?B?Mkl3V3pGcVBYMm5GOVpxdnN5VEFjNkx4bVZxTUIrcXdrbVY3d0pMa2krdGw1?=
 =?utf-8?B?elFCVS9TNTFxOGVxVDlJTGQ5RFlpTXpNYmVmb1hSeTB0UzVwSlJhMVBEQmxN?=
 =?utf-8?B?NjNLOFNOdjF0WjhHbXRMNVA0NXhWbDdjWkFvUTBwYkFDK1NUMGtkVnYwcTEy?=
 =?utf-8?Q?xHPXdEgie29Kl5tIW82pxjBZZU9YvNTrwfRjpgq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f53653f1-849e-4e23-0b19-08d9326aad11
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:06:40.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3LPSLqjPUy6Lhr8YJ1yQNAeU+2N3HgX4dB11wg9CChZEo4zKnATaMdKQj/KYfWiMAPaiseEmlQXI4n99wXFcKWpwlXCbOiET8IAzkTmp0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3560
X-OriginatorOrg: citrix.com

On 18/06/2021 11:25, Jan Beulich wrote:
> libxc generally uses uint32_t to represent domain IDs. This is fine as
> long as addresses of such variables aren't taken, to then pass into
> hypercalls: To the hypervisor, a domain ID is a 16-bit value. Use an
> intermediate variable to deal with the issue. (On architectures with
> arguments passed in registers, such an intermediate variable would have
> been created by the compiler already anyway, just one of the wrong
> type.)
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -856,7 +856,9 @@ int xc_domain_get_tsc_info(xc_interface
>  
>  int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns)
>  {
> -    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &domid, sizeof(domid));
> +    domid_t xen_domid = domid;
> +    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &xen_domid,
> +                           sizeof(xen_domid));

Why on earth do we pass the domid in by pointer and not value?

~Andrew

