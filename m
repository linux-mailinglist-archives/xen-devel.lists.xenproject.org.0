Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D986D9C78
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 17:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518931.805961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRd2-00027t-FJ; Thu, 06 Apr 2023 15:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518931.805961; Thu, 06 Apr 2023 15:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkRd2-00024W-Bz; Thu, 06 Apr 2023 15:34:24 +0000
Received: by outflank-mailman (input) for mailman id 518931;
 Thu, 06 Apr 2023 15:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkRd1-00022u-5a
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 15:34:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f13c028-d490-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 17:34:21 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 11:34:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6768.namprd03.prod.outlook.com (2603:10b6:806:214::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 15:34:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 15:34:16 +0000
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
X-Inumbo-ID: 7f13c028-d490-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680795260;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fo534stp1uE7qEY5cfiGY31pmf7oA8z54TWbmIphH0w=;
  b=eOvvnPKx4eRb/D2a2cpaX2AIVoUEKpijzx9nf28gPJwRDpqYg0VLnPBb
   9p16AyowWnEi2GkVbh5w58Q36uFKzycHAhtVFiKj+2ZmH7dUhoHe8FIGk
   0UDs53aTFuuMVJwMoUhKA6B5pAiHO0CzSitL39jWP6XVtJQq3190WXx31
   s=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 104498565
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7ODgZqK989CjcTn6FE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENSgmRVz
 zFKCz/TO62NNDCme4xwOd+08kkG6MfWzNVnSAtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5aXEFCz
 fY6CAwtdzqIt+as2ZKQYOtj05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHunBNNCSePlnhJsqEae9kkBBxctblmYs6apgUuXYsocI
 FNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI88Tuiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:dT3QeKk5aUjOiwP6nGiDRSwNVo3pDfL93DAbv31ZSRFFG/FwWf
 re/sjz8SWE8Ar5OUtQ4OxoXZPvfZqyz/9ICOUqXYtKGTOWw1dAb7sSkrcKoAeQfREWlNQtsZ
 uIKJIOdOEYZGIS5a2RjWXWLz9j+qjhzEnCv5a6854Cd3AIV4hQqyNwCgOaFUMzYQldGPMCZe
 ShD9J81kedkGosH76GOkU=
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104498565"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixQ8+VxCLOd8BYAkH7zHxzqY/FbO/+Grj7Z+IxXexXTO3lr1PfnXsX9PMETOo6YwLVyddCYfUT5ws6fGPKCS+ZbDsJ5H+9y7/mjPh/w0kILu7Vb1gDD+2KEpaUp8vzwpbgYJPf4GlTTeN/XlMXn+KrSfIowhDAS5cGqsMzGQm6MzFmuoOuHAIVrOe3iTEOJsDR0m2Jr7OAzW4qT9plfR1FqkqRV6TNzW6nf6pjPW6HNNvkaqiWaqNKoogPoKGh6YhRTIZDwpiia4rlYkEV5GiXWD4KwkvaBrPvmTPxWVCeRD5MNEEU7slI82bDg06lA0VaWkNO0rpPq18qxFx8PiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo534stp1uE7qEY5cfiGY31pmf7oA8z54TWbmIphH0w=;
 b=MX7uf6S8zXZtlR4wrRsQusEfGuyyzFNpoSwlxkKLXSAc4gOeZpYewWvA7B2q5+9d3k290PTA2NEEPAiwCLrNSw+gTFSS/pdvA3maDvtIhNTlAOb8pbm53HpasxOFtjy11twgf+b9rDiC8n3G8a2sIA9k3mN3xDWs2V6fgRGb9an7XNqCzFLPcyV9GLYKFPi78jYS2P9kOjcfeNiUcLsM4sPO0ZH99+uIE1N931xubORNY10fNWqgB2o2dZQ5AasszxlPinAU6HJ6Cxq3CmgNyOQXmFByV70xczKYpQnOCjfBRN3lqNEMLTjCMvdeDsP4+o2Yu5ZsBP/VpLS3TqK6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo534stp1uE7qEY5cfiGY31pmf7oA8z54TWbmIphH0w=;
 b=PS2RmEQDoDziKfnwSb6loomN8Xv/bjTyzNMzQPhdvSdblJK5YzymWq1JoMa3IVggRW4r7Wrs1vi3gQH5xjZT1DMLApwf9NHsKVTC3sEpzMFCMAqgULU1HsxzECzjfhvrzxpI0xRb/syWBzezCkAD5W4XAmqExDG7X8jtZaiOPzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4dabc9c7-7c9f-1fb4-5555-827d282f0567@citrix.com>
Date: Thu, 6 Apr 2023 16:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/9] x86emul: drop regs field from emulator state
 structure
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <cf5580db-3573-ec73-9e59-61aee337b2c6@suse.com>
In-Reply-To: <cf5580db-3573-ec73-9e59-61aee337b2c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 267078b5-8c83-4b1e-1719-08db36b46164
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+zUxhH4aE0TYglcYvP78cFAZeHcZ68V6qvLDUnaw8doEcv/soCV8JsJMjMGMFXJAq2i8g8k2Xay+u4xVRDhkRtGaaa+gfaf2aOqAunMnnkIr3VZlU4hX/55rk/eMD8daIJQPlR17gILhLVfhosqad7FtUyvGQt42/GVJtjIELmyChbiPgCFY+7GqfCdGTgfK5LD0teger2GrSp4gQLKr3WWTqPcowUTrL7RVxe/zxI28Q4wUN8eBdIz2XUhHlgPTb6aISaQ5otc7cVl0qGlm+2mNpRupWVyBNP7/2WHAuk9k2rVCzDtMCehH7ZowH8ombEndeXvQb2n2DsoFmDNLl4MYJuSs0HW1YeFUpJd+sTnAhd4vh+micDaAcbYpHXqqHOMoHf+ssWkyEPtA5pqMTcfxi55UI5DZ1zo2q/MJYiJFQMnqkvYoI7vmVZbCCnYmWgcIaeZ41owjqOlBl9wLQRh/cQV9yUIaLKtLRBFYmtL4uvcuV64FSFFur3X+hBfJlv/akEn8PhnpkQk7n7mqvxVkLTTdWlktCyc6sbi0k8jT9zvVUj5+B9kypk60ST39e67LLbM1LLYi231sOgrS/EaRD7xyWi6UgwKOLrrrxSO8cyGONp6pbldDwjuJth8q8RcaNMhpEKq3deiYAutiQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(86362001)(31696002)(36756003)(316002)(110136005)(66946007)(41300700001)(4326008)(66476007)(6486002)(6666004)(478600001)(66556008)(54906003)(8676002)(8936002)(4744005)(2906002)(5660300002)(82960400001)(38100700002)(186003)(53546011)(6506007)(26005)(107886003)(2616005)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHoxZnpzeHFDdDNuRERqNUFHRFpZaFRkQ0FMQ2YvU0xjZVNjZXlUZm1jOWRI?=
 =?utf-8?B?Z0I4VUpERmVoWHEvVjZMbUEwcUh6MmlnZTJTdnFNQmNYeTBmYnQ1SysxS094?=
 =?utf-8?B?NXJNcEdTcEh3Q3JwQ2dEeUpkVXRnQ1g2NWVVZ0ZRQWpMdktrdmZlQXBsV3o5?=
 =?utf-8?B?cjNNUXJOZlFBZFo3SmVFcDRYRnNvaWdFeWpiRmU3OHlmVUdHQ2pKOEZhWWlI?=
 =?utf-8?B?V01Yc2M0bmR4MVJXUG41eWkwck1YQ2dDcFFDK2xuZHRFWFUzMEJNNVJjbGZ5?=
 =?utf-8?B?eFhWTDN0T3Y4UlVKWmNNeUlpcEU5Z3VLSHhMaUlyWUlSYlJuc2hvY3ExTDM0?=
 =?utf-8?B?K28wWmp2UXI0MTZoU0ZOTlVuWk1Qd2FsaGVFNHpkSnBlK0xhQ245VGV1MXpS?=
 =?utf-8?B?bTdTS2YwazZCQzIzcGcxZ3FDVjJZWGNXN3hoeUd4dWxQbzBpUVhlcDdoOU1T?=
 =?utf-8?B?MzhzOHZDM1doRlR3U2U1K2JpRjF3MzhvOXpCZk5jb1MrTkFJWTh4ZWtHazJi?=
 =?utf-8?B?NXV0YTRYdFFyekkrbXRya21nL3BuL3I5S0RpWUh5cklicWNkYnlWWUNYR0xW?=
 =?utf-8?B?cVFjUzZYZTN5MDRvYXFlbk5oQXo3NXZIR3BzMW5obDZPalhuRE80aW1IdktH?=
 =?utf-8?B?Q05EcUw2VGxaQkthLzNmOE5CN3F2LzlnWHphN0ZISmRLTUdXalZuZUM3RTN0?=
 =?utf-8?B?MU9JaUY4VTJmdTRWc3dlNmQ2KzVyZU5SUDM4UVhtTU9OUHprQVlUK21rZXps?=
 =?utf-8?B?eEZ2SHpkNEU1OTlzN3NTRzdERmpJQ1oxWmFKakZyMlR4WVRVQjZiSXBNM2sr?=
 =?utf-8?B?bDVLREZZMzVHUVFVYjc4Wk1hbXVEaGpENXd5cUIzVjRCeU16VUtVenIyaHR0?=
 =?utf-8?B?SmNwRjJqZjdQSGlXMmFZbnBiTFMvcTZCMXFKbjNHNC8zS2dyR0p0cEJrMWVq?=
 =?utf-8?B?YjRLNVVjemVIZFJIekhLSzBibU5yL3BOa1ppenc0bHMzWmFQeG9rQ1hDck0y?=
 =?utf-8?B?TXM3REFqNGRYUDlHSmY4blp4L0EreHlaN0hIKzlNUStEMnBnYkFFajIxbHh0?=
 =?utf-8?B?UlNsZ2xPUWJxWFV0eVpDZFFQSWpQQ1A4NU1jMWpQWHh0TFcxakJpWFYwaGt6?=
 =?utf-8?B?bWI3ZHNEd05Ndloyc3R1cCtoK3RLdmlPY1V4cEZPTmpMZXpEV09rSkRHY09E?=
 =?utf-8?B?cWZubWFoZlZRRGFBSTB5aUt3T2JWQ3lXbzNaSFdWSkdhTFBkb2gzUUFLZG9z?=
 =?utf-8?B?NmN2SFNZbGhPa1p0MWdDYVYzRDZDSll6STdkOVZSTUlZVlRyS3pVYUwvWFRu?=
 =?utf-8?B?bWN1V0h5RHRPNEFMaUlDSDRoS1QwWGpiV3dHdXprY2pEemNPV2cxY2p3eHZ5?=
 =?utf-8?B?SGtneWM1Ym1YV1RCbjlMU0xZOFNpaW9pM25DWDZTeWJGVFV1NE5qRUV5NVBo?=
 =?utf-8?B?SHk1SVpjYU9MY01QbGJHK21LbGcrV2VUL2k1Q3FFNk0wS2txMmZaRE5FL3U3?=
 =?utf-8?B?M0Z4d2hrYlZXT0pSU29MZytGTlorekdER0dDQkZZN2owSUlHZTJwdlpuWTVo?=
 =?utf-8?B?MXZVNVFvbklGWUpvRWZwT1lVdHFmM0tEZGhJZzUyOW95SkxnTm9IMFlONlJo?=
 =?utf-8?B?Q25OZDhvR2pnOVpKWGw0VUtsZTQ1Wkc2K2REeXp1ZC9DYzk3MUNTcUU1TW53?=
 =?utf-8?B?UXlQaEFhZWIzQlBxUFhmbHJNRk1Ya2JQSkhMcWg2S3FXL3ZOM1VSSmpHaVVI?=
 =?utf-8?B?U3ZRdzhoMGVSdlJXS1p0T0ZHb2dBV2FQb0xNYkpJSVE3T09lcjQwTkF4SlRB?=
 =?utf-8?B?ckpXZGtubEVKOVZSMEs5MmVlenR5WjFBb2I4RStBaTkxQms2R1VIUE1XVm9o?=
 =?utf-8?B?d3FlUUVzYjFENlMrbS8wQXVDdDM1ckYwRnhvTlNwSlJlV0xnNVcyNUt2NmxK?=
 =?utf-8?B?ZXZ4K3l1ZWpvWlNNdURtTmVSMUQ4bFF0OVZDRlpWalYzcm9CejM3RzFncVJa?=
 =?utf-8?B?ZS8yOUxqREp0bm8zZE51SXpJeWVTbmtqMzI5KzZqRXBheDY1U2d4Zy9kbWRl?=
 =?utf-8?B?eFlOZStyVzdmUWdUL05oR0k0djBrci9IZStYZ052b3dlMnVtK1NxRFRxU1VB?=
 =?utf-8?B?b3MxTFJCS1JuNzdYM1VxVm5MaU1ac3cvVjVVa21FNmFUMjZFVlRiV21mYzgx?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L17J5MsdPsNkDCn8jcn+HUBwvjtg8oO7BrrfwyjzMysls4ZvzhFDh3MULyfLii7wc/CYk7Kqn3i40i4Mu0a2a7Q/fx0u5BiOZSJtTgHy6cttrS1yFaZNj1lxqqpN5l1FGS7HRBV7uTVvBVWb4qkgZRl5jDFYTA80PchnsgqyNloWLwf+aEHeKpDuWidE1aknnBB+ZJuY7jGppRl3Rme44iRXiumP0pCaG/HD9R+OwHZjg+5koljNYsFK6Y7g74DYURraj0OrrfXxLHdnbhpHxS8CxCituiuqDUBAa7787iLypm2Og5CYyrkNY1g/ghNuZboMCCSXlAqrOxe6nW4h65zClh7ViZ/bzum5KDRCqQcBFPpbKfFz7sufKZWE9GLyQ8pMnzooD7nvddFqaT7jZZt/6n5dV9X2YbVVgj27Wae5kZYQhIntcnvm775SVqG5lNe5WKccnFFQ9F0B8SxzIuLKUfCStPBhD4DdlIJvbIseuKDHM4oVLpahof1kQVAV4IhuXf15WbG1lmwStonOvEMLqEvGvEkaR/eweK7l5W0zcGMyjnGP/XPv96bmWurKI9h95j3uWpd6ThaOycReglxDkGss5docG12+5KCe9spUZsF+VXCGnpfggfJqujwN6+Qq58xIH37Sq5ldrX1CTx/hGy4uwEf/Er71wF0P8PZ7KoWQ4D5eKl3uCNulRN+lhtHYzgJiROB0jE0q2zNTyu0GORqjfyCT4qdIaf4tv13bpW5H1f/DlDxRQswDLq1hRsIj6IekbwgRldkh81fCGMIcyJWVQxigZmwZzIJwzYuDTiGmCO2O+atMpZIWr4DD
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267078b5-8c83-4b1e-1719-08db36b46164
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 15:34:16.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgbqYcmn0r07erzj7/m/oKROZT3iE2Xpw2VH1Wub5g7OnwHV5jWZifQlFYnulKy7wvZJP1XilZXUvx438CeF8bqptdY9BjaXAtczkznARUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6768

On 04/04/2023 3:51 pm, Jan Beulich wrote:
> For an unclear reason 0552a8cfda43 ("x86emul: track only rIP in emulator
> state") converted the original struct cpu_user_regs instance to a
> pointer, rather than dropping the field altogether: The pointer merely
> aliases the one in the context structure.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

