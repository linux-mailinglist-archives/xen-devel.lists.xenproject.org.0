Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED04BD927
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:44:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276082.472133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6AV-0004yp-Qe; Mon, 21 Feb 2022 10:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276082.472133; Mon, 21 Feb 2022 10:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6AV-0004vB-NQ; Mon, 21 Feb 2022 10:43:47 +0000
Received: by outflank-mailman (input) for mailman id 276082;
 Mon, 21 Feb 2022 10:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vyL6=TE=citrix.com=prvs=04447c275=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nM6AT-0004v4-L0
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:43:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 237bb0cc-9303-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 11:43:44 +0100 (CET)
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
X-Inumbo-ID: 237bb0cc-9303-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645440224;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FGIrWIm1gGF5yEgAkMubnMpD4HFLKoCcvsdO83bJzkU=;
  b=eU61hvG5sFiqDNCUOx0RpqCqk/Sflb6YTf/TxcbgZVmZXm1sfMYFAiZo
   mU7Q6yts1YHIpHjxTbqcVd5Xw9LaZ4nvHpGBQfd/J21AAqc+FuSJHdw1i
   UFI63QipOyINp/jxy6+NJ44ka5VNlW22vYJTqUttZNTBaA3XITEQhwKC9
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64638340
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1jo0P60sIiF8z8lR5PbD5bFxkn2cJEfYwER7XKvMYLTBsI5bpzcGy
 DYcCmnUbqyDNGv8KN8lOdji8UNQv5eEyYdjTlY5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQy2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /13lIOSUBVwZZfxleQhbRh1NiEmDZdZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2p4VTa2CP
 6L1bxJUZzvbT0ViOG5NDYobhfyHpiDbchhH/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfycTjTAdxIUufir7gz3QPVljd75AAquUWTm9imqFesAollF
 kEUxhQvgI0yrHyRUYyoN/Gnm0KsshkZUttWNuQ17gCR16bZizqk6ng4oi1pM4J/6pJvLdA+/
 hrQxo6yW2Qz2FGAYS/Frt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTgBj3d3/buZRjs1XGGwrZBr2+/D0ovYdvFm/Y45cxloRiHSZT4Kp80PHyv1LMZyUSFKM1
 FBdxZTDt7BSXMzcyXbcKAnoIF1Oz6zYWAAwfHY1R8Vxn9hT0yXLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKK/z1PxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eV1nntnnTuLH/gWDX2PiNKjWZJccp9cWHOmZeEl9qKU5gLT9
 tdULcyRzBtDFub5Z0HqHUQ7dDjm8VBT6UjKlvFq
IronPort-HdrOrdr: A9a23:0LerX6r2Ae0rpbMfjSANKNUaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64638340"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwXS66QxG0h1KeU3krqz5cen2ea6bylUig2tAS9OioITbXr4Tq3D0pTrJGE00Gh37ltYukAnElk0SJbapE+8kS12l9le/9bYq3IcCuaLS5abzcs4G5lMx1IcRDbB7sq7UIUTzBgvw0WyaX/SvfUHHyfMXRgkMYT/1MCxpDrDa89bnoTvv1HjAvkp+005I+Lr+8pt2gqlkNn9TV8KgZ/AxxbH9cSh1dJKCCG7rzspSM47eMPYmtEPB5bqjIIGkuymAPD4lVzOB4ONn+q6BjSE2mKiji6qAt6ZbRz9Xi3PA/vgShccp4bkbSgh40lbqGzfDUBKT5Ru5r4/h8Mhh5QRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgPfmRmeN5J9fv2rp8St799o9ORvl2ij5ICCI8SDI8U=;
 b=hMjHFKMwS0NjpKYWnW3ytuit8wX0lsHNfmpM5EDkzNTnTEkjFj6+OfDEG5D82UT5kQaBp7KjbCxj1G4lp2a58WfJ4D/eM6rYbBFMvCJySz51Gxb7XciMOrOaLJqWYlE3amErlaxBoEZnIzvtXezkJwJMM5YPnSLtSeP41zJ1S/J7rLbx50iyan245uoamulprxMSHGC+/TTPAQfcIBx5p0o3WawoYhr9lN+S7L9Xz0UnssSmg/Uy97M2Ujpp6ixAWyY9g0/2onIyORpyFDBX2a/3C3aWSJ0mhD4D7nLgEH3fj1KZFqecrp04iWM7EVV5VgVWQZUGSIDOZrSIV/ip1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgPfmRmeN5J9fv2rp8St799o9ORvl2ij5ICCI8SDI8U=;
 b=lhfKOXQqlny56A/tWk/uITa/nCGhKz/CueZuGMs/CT88dHJMISRUQGXa51gSiALk3ZZL1b5pp0ziAEliulQxlA6OD4XmsGTHwPm7lDbihUpi8FUtTB5lIYfJzm2+Vc67GBkX6X26v2RfIze8ytiXzTFtEwURk5cS1rAPo/Wo5WU=
Date: Mon, 21 Feb 2022 11:43:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] tests/resource: Initialise gnttab before
 xenforeignmemory_map_resource()
Message-ID: <YhNs14xZK0t6OwGN@Air-de-Roger>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221100254.13661-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0224.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49ce92a2-fa92-422f-4f1a-08d9f527055c
X-MS-TrafficTypeDiagnostic: BN7PR03MB3474:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3474CE0906749BD8433641368F3A9@BN7PR03MB3474.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcchdAllAf5zHsULpBDjrOEd2IJFF4yYb0Y62A4qhBK+XGeVT32dH2RbjGciV/sjw4+E6NFyYfUsKYzolATB3THUBTvO8uM49QDIPWF1T/xX3tnGH7hR3fSKm4dWmLjvm+0ouTMQUTNEUi9x0NeGekBU/QGKvzD6aLVs0C79JgR2TnazpPac0VXgdSto8pqcFQ5LeDpMNUnvxc0TknOK5Pkv0JoNN+cv/uWGa39xvhTwVZS6FHtybse1E+UEFFhUlIKTV20ocMteOt3ZjTZj9fPuwS76GdMq/ZDE6SiNqcUqtsidluGzZBR14iz4TdIO8iWiy+CvsLpY09TJufCVej5ZsdkGtAgoLGx45JdWVjOXKb+yc3MBY23SPP+Y1iYboXkeavMOFLHJiqn4B//UndQTsrVpFqiYBJ9zTqgFOS5SqJDPG9rK2vVHdBEaZNABWHTpWVIcQ4lWaG+lSLZTwblvYr8lNDNGZ05O2PAYYbnxguz0aHf9RcsHcZVxC3BS3E4BHUjuPF+Ea0dyepVSS4wE81dduTIvxvk4VZ74Se/+3h9yk1AU6auTGk1FuVERUtAjdtqQLj0yVl1kMMxBPx3OKD10PPX+TsLy1hd84RKV4dx5Z15sokYH98tNIzeZgCm7Xr1bvUVrlm9kXFYDXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(4326008)(6862004)(66556008)(6486002)(66946007)(66476007)(6636002)(316002)(508600001)(33716001)(4744005)(6512007)(9686003)(8936002)(5660300002)(2906002)(82960400001)(6666004)(6506007)(86362001)(186003)(26005)(38100700002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmcwOUdrQWpxVlZOSVQ0ejZrSVN6aXpRWVdQc25ienY4VVJGUUIwSjllV28v?=
 =?utf-8?B?aFAzL1dUdTF0NlVMb0YrYnp5bnpadFZEdzFpQTVyYW1pakU3TVhuVHgvM1NB?=
 =?utf-8?B?T3NUMHBkOHdaOFFseVhxY0hnbEZEWGFzUnBpQlFrcVltVjkvbnhUaE03ellj?=
 =?utf-8?B?Um1FSjlOQXExWXczUGxpcWI2OCtia290TndsV0lIc2xxRjFkM3lhQkFLeEM1?=
 =?utf-8?B?cHJ1dmtiQjJlZDk0ZkUvRjZseDFMQVJsbTJ6b3NBREpXRHR4S0w5dXpZdjk2?=
 =?utf-8?B?RHk0azIwSk1lNlJ3V0VpTWhQTWRzazZocTRBMDR2cUdmajh3dHE1dVV2Mk9U?=
 =?utf-8?B?WCsxc1lpNjc5bTBsYkhRVWhibmxXa3FZWXQxUnA4SGpRVkxVL3ljM1RUQXJx?=
 =?utf-8?B?Y3VyWHduY1ZqZ2o5NTE5Ry94Rk1hRDFrNXh1YjhHSFVUTzc1K0JHZnM5eFVo?=
 =?utf-8?B?TWMwZEo3Wlo0ZldtbmUyVTZMQVNDcFFEakFBTkRqRkFaam5xanJVVERWRDhC?=
 =?utf-8?B?Z3M3WnM0K2tPUWFNZmgxTjB3R1h2dXk1UEtjcnNvOFFoR051UXlJTlJhTkNo?=
 =?utf-8?B?V3k5SDllM2I2ZHRBNkZ6STRmWmIzSlEzbFhaa3hCeElzOTBGYzQ5bXF6Snlv?=
 =?utf-8?B?aUp0L0VleTM2WmRpMnVhWmlGOXZXbHNldGYyL2E0SkU5QkFwQjY5eHFFOVRp?=
 =?utf-8?B?N3ZxaUtkT3pGOFpIUXpBK0ZFT0x0c0x5cmJoR25xazJYSWF2OUt3bWtvMk5X?=
 =?utf-8?B?cGNyRHNsTUQ3MmZCUE9jaml5STd0VHhYZEVxOGdhZFQ0V1NsUkdSdTFLWGtP?=
 =?utf-8?B?OWR4QjQ4dEc3N0pxeVUyc0tlMFZwRVRzUENoL2h2RXZpWUppZ0hQQXpoRzJZ?=
 =?utf-8?B?UTBKckcvelJneE9rYjdGL2pQUmhMYWZyYXB3ck9XL2MvdUpvSmRvSTdBc2pK?=
 =?utf-8?B?NDh3c2NXM1p5YVBsVGJiRUxIanE5eGJMY1puSUlZUUV4S1NscEMvRVFibVV3?=
 =?utf-8?B?dmZHTlR0aTFiYlMrZkM5WktkWWhIVkVJbkJqNlRoVTFjZTR4RzI3VGxYdUR4?=
 =?utf-8?B?c2lQQjhOYVdRcWVJUzVBNnBFSVNmQUlHbVhBY2VkR2VlNE0wYnJxWTlGYVY4?=
 =?utf-8?B?U0plblIyOXA2WnFNVlhTaW12QWx0VWwxeGFONFRNZ1NhVy9qVjRRU0ZzSGV4?=
 =?utf-8?B?UGFkNWM5bnBGSnRaK01oQ1NXNEdCTEs3cllmbTAwalROYStZOEZySWwzclkr?=
 =?utf-8?B?VWVIcTM4cHd6TmdGSjhDQkE5a1JvNi9LcWtHR1diNmxkWEZ2SU9tSVpXVDhi?=
 =?utf-8?B?R0xOcVR2N0h0MG80cWorbWJySk1vUG1UQVg5ZUNFZSt2MysraGx0WFkzYUtB?=
 =?utf-8?B?Y3ZCcXNuc2s1d2tEdkRKRnhqNXd3V0ZVS3lnclFSWTFGc3dOdEwyWWdXWVdv?=
 =?utf-8?B?YjlNaWVDMGlKckhIR3M2aG0zSzVCTDFocFNSYldjbmRDTm1LOTNqTEVPUW1O?=
 =?utf-8?B?SWlhYWhDS2x3OXdtbVhoYlhwTWNiWmwveWRMRFJQc1JpbUZuN0FNTjdHM05v?=
 =?utf-8?B?c0NDYlR2enBtYjJ6Sk9nRUgxWUlmT2tBOHBscVZGYWF1YllyNVRlWkFTSEFx?=
 =?utf-8?B?dTlxNmtlKzg4WDYvc3RjOVlhQlh3RGVrUVI1VUwvOXppOWRxa1J1MTYvcHpT?=
 =?utf-8?B?cTc5S3ZFV2llUVB0WTJRcWR4elc4YVlpS0dKYlZtWTNrTE9jd2g3ZFFFQjJr?=
 =?utf-8?B?SlVCUjR5YnBHa3N4K3NKUExYNVRhK1NKUWErWGhDQkdjUVlyZHhEaWNJd01W?=
 =?utf-8?B?cW9YcjFlN2x2U0puRzlreTIySDBEMCs0ZXQ3aWt3YXJEMjJGQzhJQXp0bDg1?=
 =?utf-8?B?bk92YTJGMmc4eTJxTTR0LzhoSm9Jb2g4ZCtNTnhnUUpEY29Kd2xYTUtMVnhK?=
 =?utf-8?B?Y29kK2pQOXl2SEdxNk02bWI2OWdqM2Z0cUNkSDZRcHcvVFNXTTZrb2RNWGp5?=
 =?utf-8?B?MmdzYUE0aDRCRVR2eFUrQy9MUzVBbkVnMjFFZ3loZWR4ZnFobkpPSWV2VjBN?=
 =?utf-8?B?d3czUnFWSU9hc3NJUU96NFZrY2xYcWFhbEI2b2VORGNRZXFVMXhVbk5mWDN6?=
 =?utf-8?B?SDlaVkF0bm5QREc2eUEyRldMeFV1cDBtZThscHFUa0N5RUxZd1pQLzlLK0Uz?=
 =?utf-8?Q?mW6JcgeGd/8lyTWttyajTQw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ce92a2-fa92-422f-4f1a-08d9f527055c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 10:43:39.3194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+113Il728xElcLlJvPze8Gx/n6B6rmFo5CEm4b1gG/ceUqNDVTYrIlBl267Ot5OSEX7EuCUDVUXvlo2qld/zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3474
X-OriginatorOrg: citrix.com

On Mon, Feb 21, 2022 at 10:02:52AM +0000, Andrew Cooper wrote:
> It the 'addr' input to mmap(), and currently consuming stack rubble.
> 
> Coverity-ID: 1500115
> Fixes: c7a7f14b9299 ("tests/resource: Extend to check that the grant frames are mapped correctly")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

