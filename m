Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700126DF337
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 13:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520175.807505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmYc9-0007HW-59; Wed, 12 Apr 2023 11:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520175.807505; Wed, 12 Apr 2023 11:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmYc9-0007Ex-1R; Wed, 12 Apr 2023 11:26:13 +0000
Received: by outflank-mailman (input) for mailman id 520175;
 Wed, 12 Apr 2023 11:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SpRk=AD=citrix.com=prvs=4590bba82=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pmYc6-0007Er-Nf
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 11:26:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd5e2407-d924-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 13:26:03 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2023 07:25:59 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO6PR03MB6227.namprd03.prod.outlook.com (2603:10b6:5:358::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 11:25:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee%3]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 11:25:56 +0000
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
X-Inumbo-ID: cd5e2407-d924-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681298762;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6J7iWm4iSPCoESaN81BwvrsTYthin0+NWUfWLWrh4YM=;
  b=P982LGsERJ00AjMchkN2Uq6LX8TIvdMwfNPLS/I8nu9Ej0nXeqB/KDxs
   6d1IcwCCNZ5+GlIwKxs6e6fRET+0vid/hlnW5NEOaTmnhJ/yt96tI8ASm
   Ms6HHOCGMEhsDeLAFdlbHGllb7gCDKfdkX3/RjUAw2DuaSznRWH7U86qN
   0=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 105626508
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lhfcXqth59NllZTtkspcPwT8H+fnVJBfMUV32f8akzHdYApBsoF/q
 tZmKWGEP/jeMTGmfot+Otm2o0pSuJPSnII3G1Fo/3pnRH5H+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOHzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAxEAQAqD3/+KyY28Wss0h+IRA9TLFdZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4S9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAN9MTuPlrq4CbFu7nEsQIzgxDUOCg/SCzXagR/VSM
 X1F5X97xUQ13AnxJjXnZDWjoXuDuDYdXcRRCOww7AyRyqvS7B2dD2JCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BWoLfyoNVwYGy9jlvoAojxjLQ8pjEai6ldn8E3f7x
 DXikcQlr7AajMpO3aPr+1nC2miovsKQEVBz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:QvMwaqyXHa9EWHxyXq+DKrPxS+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRZxRBf7LdUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrXAgWVxRAXVhJI2PMH/X
 LemwL0y62/u7XjoyWsmlP73tBzop/M29FDDMuDhow8LSjtsB+hYMBMSqCPpzc8pcCo8RIPnM
 PXqxktEsxv4zf6f32zozHqxw78uQxeoUPK+Bu9uz/OsMb5TDU1B45ogp9YSALQ7w4FsMtn2K
 xG8mqFv94PZCmw1xjV1pztbVVHh0C0qX0tnao6iGFea5IXbPt0oZYE9E1YPZ8cFGbR6ZwhEs
 NpEMbAjcwmOW+yXjT8hC1C0dasVnM8ElOvRVUDgNWc13xskHVw3yIjtbgit0ZF0Kh4Z4hP5u
 zCPKgtvqpJVNUqYaV0A/pEaderC0TWKCi8cV66EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5Yj2gvYEjjYPf+kqGjyiq9A1lVYA6diP23v/NCy/jBrfvQQGK+oWkV4oudS651OLyeZx
 6xUKgmdsMLY1GeXrqh5DeOK6W6GUNuLvH9hexLKm5mgvi7XbEC5darBsr7Ff7KLQsOfF/ZLz
 8qYAXTTf8wnHxDHEWIzCTsZw==
X-IronPort-AV: E=Sophos;i="5.98,339,1673931600"; 
   d="scan'208";a="105626508"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wtr7brGMUlrZFWmFb33NIYD/Ug0h0BNvu16CW/wpYvluKWJD/rS/aqosg0jpSRnHEe+0JdQ5TvcngWXcoDbirH+W0IdKZi/IY3zz24TfGMa/QbiF0AEmgA+r3KumI7rb9Hb6tnddwDSLQrNXobMoKFtZ1mmnuNR7Y+9oDt1LbuB/85mDnsVkgszZ4W59VZvwRqd+AyIKXC8glNz/Gua95ZpfgyzZmgsLAJGgbCKYys/7wtG/NBCEJCwEhqnGrktud4YIf8ZG5wz6L1+bx6D/p806yO1EhLLYryRPcrKO2udiSaSsS40dFUde6TO0u5JWJhR3S5C+llHkTYbA2+Eamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVv+u4ZD0bgtW12ZnZ97zJ8R98hI71abvFB8dGcBmG0=;
 b=OBTNBGglc6vRbc4GxozfP0vWIAqID0YhD2GBZSH38JyBeqDqJm54VoHbDL+I/pBm2vV7GX2AQu/RX0Ute2sT0kQalew1keGiJ4efyMOdtHuU13+EKjjoggMNPl6v3atBqKnL9XNNiZEEHkyH3uE0Nt9yRUxyryzp7JxsfxdI2s/IfKAx5MVnBxQkFIAJruZ4W9jl2Hppjm69Yuewra1pBGHU9tQxHsm6BBXc7MFDiE8x3XRgf0NBprpmNX4KBpWrGlB0o0vcF7qTZ/4FpH/vB0F8tMP/aQO+1b2Zp3EibV6qBI/Yd9JwHMU6uTpDUpr7Ib5SYp1Sjgh4FeHHxLBYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVv+u4ZD0bgtW12ZnZ97zJ8R98hI71abvFB8dGcBmG0=;
 b=fQYRGMe0psAtl+md8iCXG4NpP/htdu+TpZAOek8xPy6pLDX49mpD8B31ga4YNpmQc+Chc8KrKJBjXyzeSikyM9rPPVZ4eOMwJVyB6kYCAclkOqnyvg9w3sWg7R8wj4XI7ZI2tITt4r843+tLi5xEOuOOXsvoYyBmR9QSXcFz5fM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 12 Apr 2023 13:25:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: RFC: disable HPET legacy mode after timer check
Message-ID: <ZDaVPiJTt8q74nQw@Air-de-Roger>
References: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
 <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
X-ClientProxiedBy: LO2P265CA0459.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO6PR03MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ece3b53-98a6-4b6d-a4f3-08db3b48aedf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Q3oGv3rBKT6NP9QoowZn4lWHPowYVmRrbnB+v52vKNjI5y7wsA6EQDDyP7imcF7YOUkNKsp4uSqoJK8unCYyQtWZokoTQ/5r3vQXczvRbou/ZwoHdaNtDkBq2YJigvgUkjD2U0ikjv4DU2BSEw9ZM6BQU1ww+i9ufPP6/p2dUEy/ObNeDY6jpP0q4oNqOcbuYkoeojH2hPlnhfAVzkwk3AfOW6j0um13C+4nj0QZ/IXCCP6jOxTEz8m29G+4zOIAhZk/q7c2uXIgcQtznhYaUNsBZeT36/ZxD2rcyNQc+5fF83MxUIJEjjXLJmxA7XdZkvJVl8GQEYoHQHszrVDLWA6DBQwjox9omQHSGDPyl2KYG/0qCfKez3eIniwz3N9KfOnz5iTA2DaqSE98WOtVg468NSL/BvEoESZ4MoR4oDkJuSnzZ2Fk82CYYOwZoR1enKIF8JGbRkjy4kHx/ihTfIRWPKho36WQmrTsfHIwYuJjUBc/GC1Wt8AywANtzYCqpeMYBvgoKvLzkqJP4MX10FeRLiwDm+9jPrCr361mpwQftQ+xiGNuOJXgw4z9FYv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199021)(83380400001)(478600001)(6486002)(6666004)(186003)(26005)(54906003)(6506007)(6636002)(53546011)(9686003)(6512007)(33716001)(2906002)(85182001)(38100700002)(5660300002)(66946007)(82960400001)(4326008)(41300700001)(66556008)(66476007)(6862004)(8676002)(8936002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU9UYmdaeFNVSytKemFEKzZabEI1MVZFNjIxeUM0VzRkWTN1ajZCR1ZqV3BP?=
 =?utf-8?B?SXpBdHQ4UnFkOC9iL0FpUnVjdWRqRFkwbm44RnhnNmhPSzlCK1RiZkVWTi8v?=
 =?utf-8?B?L3k5Qkw4cjN1a1V2bGxGSVd2WDZOSTdmRC9WbnFkTCsrUFJxVXhvM2xpZ0x0?=
 =?utf-8?B?cmNKNGpLZWFNc2ZOcDhvT3pBYytvQWZMb25odTEzQzI1bTdyamFnRGhaejNy?=
 =?utf-8?B?ZzYxOHJub3ZPbENzTzEzL1FXVGR6eFRGL2VJeUh5OVhFdnJqK3hISGdVenlu?=
 =?utf-8?B?VzM2VlI4a1d6amVTMHU1cUYxeFJFN2E1R01zVVR4ZXVDRWVLNm5aSHNITTh0?=
 =?utf-8?B?YzNlWHdsMFBuQzNCbE9NWDY5V1p2d2ZIOXNpUmFNZC9lN082Nk9FWUR3WndW?=
 =?utf-8?B?VHJnU2NBbDF6bHRHN0Z5UTErNWZISi9nRXg0ME94dEYxVlNUS05LRU5nalox?=
 =?utf-8?B?VTcvdGNsSkYvb0tTRU5kYnRJSEMwUHA4QzJocUwvK2I4cDJOa0tldkhLY0Zq?=
 =?utf-8?B?NDk1Ky9zd0RRQVAwMVVveVVBSm5tRStzWjBvN2FsVERuLzl0ZHNFc21Td2gr?=
 =?utf-8?B?WEFtTjB6ZGcwd21tMk5YN29NWVV4WWw4VXU1VnBwS1d1RkF1SStya28zVVZD?=
 =?utf-8?B?RGRyN3lGcXF0QVJjUUpHaGhZc2NiWVRRNW9VeWdFM1EvR1NXVVZGbUhLVUJI?=
 =?utf-8?B?YUwwd0I3eW4yUlNYOGE3K0FzOVpMaEJEUkhWRmEvL0VPMUhuT3VYeStubm1Q?=
 =?utf-8?B?ZXYrTXB1SFk5L0FSTXlVN0J2TU9NRUJlYk1SMGZZR08yc1BLbHNqeURVYWIv?=
 =?utf-8?B?WVVJTm1hWStEVXZiSE1qNVJ1T3ZBS29ERTZxK01XTnR6TTJ6eEYxd2pQVzRw?=
 =?utf-8?B?L1lVSW11SmlhTG1aS21XTlAwUFVDSDcyTHJYSFZlTVBTR20rR0ZwNGpMbDNZ?=
 =?utf-8?B?T2RyUitoNnlvOTBUdGdxdEx5VFhRTkpUa1pqdkxjUWFVdmljamw5S2J3U2ow?=
 =?utf-8?B?aUZOTytKdzd1YVlHWnpONTc0RzdySk9uOEJUTi84Wi9CZUZUZm1RRGZQOFpF?=
 =?utf-8?B?eit6YWVBYWtoekJyV0IxWWdUUjNCV0FiMG11N0pSdEdLazN3MUZWWU5RMlo0?=
 =?utf-8?B?WGYzdFV1NUdUL1JSOGs0OVhTay9SSGs1NEJ0N1U3ZzE2RmJQZnVPRjhqVmJV?=
 =?utf-8?B?M0tlenRBaWFOY0RqeGZhdXhQVWZzZ2xNVElqaklrait2NWEreG5Sa2c0SGtB?=
 =?utf-8?B?ZXNGcnM5eUhTamhPaTIyZGIwZkwxTGtXRkd0bE9vV2hRRm4wZ2RkR2t2UWJw?=
 =?utf-8?B?UkJwdER1OVlGZmNlbnRYS2drRmw2dkZHTHp1WCtzOFVkak5NQVAvdjdQSjI0?=
 =?utf-8?B?RGJ0KzBXYTVkVUlhcEZEME5oK1BEM2k1S3R2Y1dWbEx1eG1ONTU0MVF5TDlZ?=
 =?utf-8?B?QTVnbHdTbEtBSmswdHZoN1Z0d1RFMXg2VmMyUmpCU0RZcmZJN2U0ckUzcmRF?=
 =?utf-8?B?M1Q2M3dzS2xCdER2U2ZnSEc5c3V6YWEwbnZYYThIQ3F2Qi92bXdEYVB2b3JC?=
 =?utf-8?B?Zmh4N1ExSFpndnNHalBhZWdob3NTM3pUNWphZFROUWhSYlEwb2hUcWV4bXJs?=
 =?utf-8?B?Qkdmdi9DSEJFRTY5NDRCRE5sOUwzdklwdTVwTFNqY1BiTHR2dkhOcTh4S3dG?=
 =?utf-8?B?Wk1FRTh4VDZZVkQrUk1hanVjN0t5NXlSS2R5ZFNWSE9ic1JDV2Nsc1dWcGp1?=
 =?utf-8?B?Ri9lZ29rdkYyMWJVcnNxdU84UE8vcExJMk1ibkpOUTdUbUgwVHJ4R3BEdWxJ?=
 =?utf-8?B?MG1yVVA3UlFVVytTcmdMSjhNcy9kTDNJTmZnRjEzUEN0cGs2MythbWYrbVRz?=
 =?utf-8?B?MDJleFIyVFhzOWhjRUV6aWNkM0h4WE1EUld4ZzdYcmo4ZFREOTJiaG43aWlF?=
 =?utf-8?B?ZjQ5ZW5WamppTGNnbG1UNW41TndncnBKVzVwKzVmUGxydFd5VDVvRUFvNWFU?=
 =?utf-8?B?M0UxWXJNTUI3bjVNUXBXVEFOZTR3NlBxSTAxdTlBSWlmdXZxVDJOVnNBeEJj?=
 =?utf-8?B?ZVNuenhMTzJkR1BnZVJLNWdadHoyNHFCK0lteExKanNuck1CTVNRMlRvWnZW?=
 =?utf-8?Q?GEOWjoJBgiKhAH6sUdJElqa9w?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MSdUblyKRUE4yzyZu/6G1FyMAw+JT1Hmxyo44deF2S2Tfc/5hGJ72Xuh4ZVPWs7BaKHRpjiKtM47oJGTBBweHkoQA2ih6Sgy+mOfC/+VHWKD2XhEAjJFtulQkrmXz0EkLCKLUeeWKGFDAQ0wI/qnPR/Qd34rOxkJwNZzutylssTqRT4vjnDKMbpvBD2JarA1l0NQZGnfrd/jAh92ouwgczQk9/13yUMUW6eylw61siYiVhHbgFmtBiq7KCQavWxVHS9xxY3XMWMNy2iwWrnN2xmoB7R1tb92Fm4prQpk0RpxsR7zMuZi4rm76epc7k+Aa/DseHSJWZqjIbqkIkebgFxLeij5P8lYwOhcljEAHlKvbmEfwEFjse1suI4C6ClHXbx1UFwI80z2hqTpm1/1onbnNHGIwgyBv8RYFfV+TWGJii8YP6UWrZk6NGfGt0RPtplVy1/JsJgKagh4jDUG1IAnFdffUSrwUn9whfiVGZJh3cyLNIhhhiOQYbxxe6VZWgm5RymBn6flWEQDkztWruJ5euRFU/khxSar9q8MBLJTDiTNbfNpoeK0pMLT+Q17WriPtPqBpf8AGWeH3c7GxbsRXsDQR0ffZn0GTsUxjd01DzrckB0tE5px27HyzbXMvW3mYasRCjiLRIG/2V5rhSphrcprIN60g7nIznOk7K1JL/v+lwfZkJLJR6Bi4Eh5MOQwrRiFShbn3DKZL1QGmImCXvBBuU7F4FfkEJPl0pJdXGP3PjcgUpAl3WWS/Q+q3sBlXn42/5jU+sWZFVTZKtdp4xWZoAY3Xoblgd3Tmz/QfKSBCrprdPleOniq//RzjQrlnKDQPz96JjVQKakGHg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ece3b53-98a6-4b6d-a4f3-08db3b48aedf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 11:25:56.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Nao5uXLAyfAWqCJ9JYGxEfVzTreyw5E5t2xR3v8PepK9sNB1Sx2O0afHTaGpmhkPSMqtevkxwyf47k/kMvyvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6227

On Tue, Apr 11, 2023 at 12:20:13PM +0100, Andrew Cooper wrote:
> On 11/04/2023 11:30 am, Simon Gaiser wrote:
> > Hi,
> >
> > I have been recently looking into getting S0ix working on Xen [1].
> >
> > Thanks to a tip from Andrew I found that the HPET legacy mode was
> > preventing my test system from reaching a package C-state lower than PC7
> > and thereby also preventing S0ix residency.
> >
> > For testing I simply modified check_timer() to disable it again after it
> > checked the timer irq:
> >
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -1966,6 +1969,8 @@ static void __init check_timer(void)
> >  
> >              if ( timer_irq_works() )
> >              {
> > +                hpet_disable_legacy_replacement_mode();
> >                  local_irq_restore(flags);
> >                  return;
> >              }
> >
> >
> > With this [2] I'm able to reach S0ix residency for some time and for short
> > periods the systems power consumption goes down to the same level as with
> > native Linux!
> 
> Excellent progress!
> 
> > It reaches low power states only for a fraction of the suspend to idle
> > time, so something still makes the CPU/chipset think it should leave the
> > low power mode, but that's another topic.
> 
> Do you have any further info here?  There are a range of possibilities,
> from excess timers in Xen (e.g. PV guests default to a 100Hz timer even
> though no guests actually want it AFAICT), or the 1s TSC rendezvous
> (which isn't actually needed on modern systems), all the way to the
> platform devices not entering d3hot.
> 
> >
> > I tried to understand how all the timer code interacts with disabling
> > the legacy mode. I think it only would break cpuidle if X86_FEATURE_ARAT
> > is not available (Which is available on my test system and indeed I
> > didn't run into obvious breakage). 
> >
> > Is this (disabled PIT && !ARAT) a configuration that exists (and needs
> > to be supported)?
> >
> > Did I miss something else? (Very much possible, given that this is way
> > above my existing experience with X86 and Xen internals.)
> 
> Xen's code is a mess and needs an overhaul.
> 
> Right now, we're using the timer as "a source of interrupts" to try and
> check that we've got things set up suitably.  But this doesn't need to
> be the PIT, or a timer at all - it just needs to be "an interrupt coming
> in from the platform".

I would even question whether that testing is useful overall.  We test
a single IO-APIC pin, which still leaves room for the rest of them to
not be properly configured, and Xen might not be using the PIT timer at
the end.

IOW: I think it's fine to test that the timer is working, but forcing
that to be routed through the IO-APIC is wrong.  HPET for example can
support FSB, which skips the IO-APIC and injects the vector directly
into the local APIC.

We do support the APIC deadline timer, so I'm confused as to why we
also need to use the PIT or HPET.  I don't think I fully understand
the relation between the usage of PIT/HPET/APIC deadline timers on
Xen.

Roger.

