Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4066D592F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 09:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517664.803353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjanS-0007hN-2q; Tue, 04 Apr 2023 07:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517664.803353; Tue, 04 Apr 2023 07:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjanR-0007eV-Vi; Tue, 04 Apr 2023 07:09:37 +0000
Received: by outflank-mailman (input) for mailman id 517664;
 Tue, 04 Apr 2023 07:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjanQ-0007eN-SZ
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 07:09:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a63cb010-d2b7-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 09:09:34 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 03:09:31 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB5696.namprd03.prod.outlook.com (2603:10b6:a03:2d6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 07:09:29 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a84f:cb5:8471:f9d6]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a84f:cb5:8471:f9d6%7]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 07:09:28 +0000
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
X-Inumbo-ID: a63cb010-d2b7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680592174;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wFGQFCHVvkmCrHJ1jX9q5LMd/o9f8WZjGtAJf7Jd0UE=;
  b=dJu7SBLs4BhfaUBslisJdVjswQzl/Sx5pfPFdrrCfTri+7Un9L+qbMeI
   eUGRARbOzIvk0B/4qCYTWhZvYv+ezpY9mG4eg5S4E1gYTNS1Wg3sOdEVJ
   0kq2aqUPQ2tNiEyW2eVCnsFw/8l7S7cJR623wLPFEpvguSlSoWfFf+zRU
   w=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 104636992
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d+uY0aktrPm+dP20RudmKQro5gxUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKXmyCb//ZYWKmKNojaY6zoEgP7MeAmIc2Sgtkqi5mECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgX5AOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c4nISEWcg2vvt67+Iird+dF3/kRAda+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOHmraA70Qf7Kmo7AzEdWQCHpMuFmFedXdsBE
 1I/xSYllP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2GEUvvhjutot3MUVQz7wCOBma9tFohNMiiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:oOtNSKvU+dmVJ4hhy/vsqf6A7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104636992"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAd9ThiVB1C/euKnE+DNBs86UG+rK+QzGvc4Qy+vcHCkQlfSpokUaK/PuMKk812NYbwjt/+XwCiqXiGTBa6oW/mNrPGlyX4ngPf+1k/xXjWJD/dDUbdykrpBTxjd5/J7sGTjXDeDSEg3aduIce8XooOgVPM0j6IyHyNs1nZboYO3qW55gY7PXz5Htld4B/YImUQGbUqy5QrtJRg8oWqUWNRbfDcKMXTnZdOtlM2XI701ACoucXhBU9Kj14wlI5tqxpat3x38b4XSq9GambHru80NkMfWRiSBCCjPsVDTLrfApJnDWT0l0z7tHdoDKoYHbkAU9QFC2IpD+/IietN7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFGQFCHVvkmCrHJ1jX9q5LMd/o9f8WZjGtAJf7Jd0UE=;
 b=hg6On8P1fYABJ+Q9Pns0LSJaW0DLCCB1B3GA573Y7dl0NSEF+SlxrN0F44MzHWKQBDcLUbr3qMFpHuE+2CaYnKVJ6Et7tUV1Brgio2LfrtFbCHF0uYWXVYnAi+hygKTbSvZVXOOmy/HMxsx0eR/qcYqtWhC52X5zKk9jPZTUOBwifFTSIZo/sqVbMIaokzhs23U4JBxOH6+nmfftQNxusyjXsKCJ9h0Alt33VEqhzBmAbiJUGOjGdh0Ra4Wka5zOVj0iHj3KzOUuWGvZP5cTtpnH+15skuP+i6bcB5r4CAfTHplcDiORRgSYWUeHd/BRUU20M7gRPHemwAxqekLzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFGQFCHVvkmCrHJ1jX9q5LMd/o9f8WZjGtAJf7Jd0UE=;
 b=ij63QU8l+Qz8QF4JeGPe38hrJWuSDxesxfMh2ki96JmxIvhcZMG1WZvCQhadQ3/dstdHHUkIJMQFnkw2NMJ66Iw5SZsFzQRnG0l56qplT+HUplhKCIjYYE4pFhyyRLRNoGZdDly//ZQxpZAd8nEwEi/kOl9yp8sAfgRiC/WcghE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0e165632-938d-596b-3087-75da66641d85@citrix.com>
Date: Tue, 4 Apr 2023 08:09:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] cmdline: document "extra_guest_irqs" upper bound
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d4fc10a3-abe7-1298-daac-00c96147c7a5@suse.com>
In-Reply-To: <d4fc10a3-abe7-1298-daac-00c96147c7a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0122.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|SJ0PR03MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4b58ae-eb1c-483a-c2a9-08db34db875a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WsTVc2LQ9NZBD0Cl+Q8p+FU07W6edyMigri2OIzAvEnfG2l0LR50CerLkoteTJRzN0OVDLTcg1H4EKL+XhdIK3yaxMW+JSoZdcd3o6GKk/UOqoeeLjwYFZ4a56BgGXyutfsamkOVT3CKdwXdXQwqJQQbghpRmQCnU2HJ0hkjc06eH3stSxnaYh49vWlx6by6BrQj7NxBw0xsFmKu3OtqtDVYFbz15lG0LQf1JTLa28pRFdxgTPAS0DBdh4wwpSmJ0RiCtBTfTeO48w/m4x+nEwvcVKQOoLRIcrG65v/OUI1o6yzAtaD+I3liO2cvdaM88UadULFcyHKSzj002LpOJTI2aHiSbZbvOG6lwLTrohmBnkLk1d/bgJiXO2DJxQaCXd+f/XQVelK7Htz/LTcEcpa6pS1uL89IaaPiKxyx6fKgEpgY5FyQBisIOEmVTGrmHZNI95khMAa2HH2lAGFnMmW+x6Ms0x5b3atSP6cGHe65CBls5Q/rbj+Ax22glKYqRguDpEniNgsHNyAsWLHZZSw4KObP2gVsSH0pRJwFYuNwSOdZyOJ1FxxKAa1R9oiazS9R6Ntngqu4vODF4rAst9o8plbShAeaY6cmL4SG+PgWrp5UCgCYmYiVV9zt9dGBIrgVq/7PaBZZw7AbobS03w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(31696002)(86362001)(2906002)(36756003)(31686004)(6486002)(2616005)(186003)(83380400001)(53546011)(6506007)(26005)(6512007)(107886003)(6666004)(4326008)(66556008)(66476007)(66946007)(478600001)(8676002)(5660300002)(38100700002)(82960400001)(4744005)(110136005)(54906003)(316002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDg5d0VJNlNaRHlzdDJ3L3NLZlgrcEZsa1VVdnc2d210aDZtNnZBYlpkcWV1?=
 =?utf-8?B?RlFrSmJKNzdvKzhXU09lR3AvWEFnMmxTZUI0SzNjSFZ1WXBNV3Y3b0QycXE5?=
 =?utf-8?B?TUNTbGx3S2xuakpJaEhHK0p2WFZZRVdtZmQvYmdidTVLelExNHppSXAzK1Vs?=
 =?utf-8?B?NEdBUDlvZGx3WUs1cGZIc0dzK0lDaHE4TFM5ZW15dlBrMzZObFBuM0tmSzVL?=
 =?utf-8?B?M21ZU29tempEb1M0c0wwemhHYUlidys0TjR5SUVmdDJCQXkvR3IzWnY5TWVw?=
 =?utf-8?B?RklGb1J3UjNNbDJ0NXhRbC95RFJHSFp2dG5YdVBVeUY2ZzFBV1F3ZXBhS1hU?=
 =?utf-8?B?K0hhaUE5OTlpVlNGSEtoekNKbEd6aEc2dXJiS2ErNnp4dHJ2dUN5V0pTaklJ?=
 =?utf-8?B?Q1JCbkFNc2RPTmh0K1U4UVRpRjU4Qm1RV21aSGdqZWYwTVlqLzJzM3BoVDNZ?=
 =?utf-8?B?aldzWTI0YndSTE9WclVOcTM4TWowVE5oK1k0VlBNRXo4V3lZZ3ljeklybkxG?=
 =?utf-8?B?dHgwa0EvMlA3MUlBdkFUcDNFSUdXem5SVzhheUorcVMyL1NtY2hsRjRFSjFz?=
 =?utf-8?B?NGVKVFd4QjJPcU1UeHVkdlBpU0dUaVNnVTJuQXhpVGpWMUFtNkhiYldzN00z?=
 =?utf-8?B?U3Rua2JiK25HbkZEMzJqekNUSnViVUdJWWYralIzMy9vVThpVC9PbXVrbmo2?=
 =?utf-8?B?cEtQejZaaWxyWUhTYlViYS9KaWRjaFpKeGk3VXJ4amRGUkdhdjRGL25kOCty?=
 =?utf-8?B?b2xRYVhOOEtkL3AvZ0xHbmN0akxxUTBuS0h5SkcvcWNya2FpT3FWR2U1TDly?=
 =?utf-8?B?UVZDQmsySi9hOUFPL25DZmxrcy9jeWtrTTRtcG9HMmVoWTNNZjlOMmtOVUdO?=
 =?utf-8?B?aUxlTEZzZnBFNFRhU0tRR1lvU2EzS2pXNjZCRkRwR0NqQkQ5QVhoZmJOZnJu?=
 =?utf-8?B?VUs1VTd2dFhRTkV0cXpCNHU1emRXMVpvOC8ybTlEeEk3QXY1TEpIekNSYmxx?=
 =?utf-8?B?UVdMUldrNVRzWUh0UGhJcnkxNGRFWSt3UTJ3eUdhblFoWnY3TUhwek1reERm?=
 =?utf-8?B?c3hjamp4cS94SE9vV0MzSVhicWNhUDRSQmM2dTA4MUc0dGl6N1NISEdtVnJm?=
 =?utf-8?B?KzlocFcwUlRvb0RscFBaUVp3TUpLUGdQd2RsTGtZY2lUNHp2MFBOOXgzWWk1?=
 =?utf-8?B?NFVaYkxuR0VIRTNhckhZZWF2OXBENjBiYTczNWVyb2FkYnlRSXRVanZZUkpS?=
 =?utf-8?B?ZEtBVzdwRlVpOVZsM3k3M2RTWDkzMDIvVnFXV1UxVWNiYWwyVWpnc3VScjVx?=
 =?utf-8?B?M0hQdFNEWEZzZnpkRmFIbWlMY2lYTHBhaWM3VjB0UnhNdFVJM0I5WlFnODJz?=
 =?utf-8?B?UjZQRmViLzFJL3d4cTJUeGU4akdVNjlydDlYOFBjbTM0cjZsMGp6dWVEUWo5?=
 =?utf-8?B?VTNHYVBUaU5hb0l5QXo1KzFSUnJJblpuUk4yZTZsUnVJOFZXb2pLQjdhV0tz?=
 =?utf-8?B?d0d6b01peTRYTTFJcFdXR3JnaWRzYnZHZm5TT1hSelRIMm5DY21HdmZWMGZV?=
 =?utf-8?B?OGNIdlY0QTJrUzI4TG1xanFRQ0VseDlZbXA1bmR0a0JzUTcweFlNaHQ0a1Z5?=
 =?utf-8?B?NlBNZjI4blNHdXhlRzFnMGNGaHpCRElycXRWU0NlMzFJeXFDcytmdlNuK0JC?=
 =?utf-8?B?aW9RK0NXVEhpVjBocnBSL3VRMGd4OWZIc2dQd0JPVTZyWktPT3FzMWpmNzBo?=
 =?utf-8?B?Tk5mQTF5bVF2TnFsbzdZSEFhOVdxc0tMRjJNd2hUK1RlN2RVZzhoOEJ6cFg5?=
 =?utf-8?B?OE40MS9pRXovZSt2ZUhlaGxhamtHb2lQRmVnZDJBT08zNjhjeWVDSmZqa0FH?=
 =?utf-8?B?VXNYcjhPTFRpQWNPQzhWZld5Z1RvdmpLc09vVjVLSlpQUTd6Zkx1R0p2V2xX?=
 =?utf-8?B?TWVXdUw5TEpMcndxZHRQM1hVcFZ6ZDViT0FqRkdDNGJkeDY3REFuZ2VCZ1p0?=
 =?utf-8?B?Mk9WZEdaNjFKanVTZC84S2RDbVYrV0lDT3c5aUkxejBwKzhMWmFvSzZWdS95?=
 =?utf-8?B?VmlLa1F5a2ZQalVjYkZnV2FSckE1WEpudWgwQ0xUL2ZlUThEYjQvRXRWeENt?=
 =?utf-8?B?U3hkNzA0L1VIV0dRYkZOSFhLVnFUSkJPdUtVdVB2Ulp0U0ZTY2VNZXVOMWVE?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n4IjA30dof9a2HkgiVTn3xNWUoJxxnbLH8+dr9D99mn9ddyQhI7b8K+ezN+PCpxRuSx1ba7YCm/6lb7PHMSkrnE2fOlctRPD3FBOm1XSathEO+7Teuogj4pSNGXDyJQoFP7Fsg21KN/1Qc497KiUXodQ8URU3kX18KumO2+NxutRtT+1ek1XVJP5E4U42bc6/VxVK1MMhRKT3gtg2Sy8QJoqKIQYTfsSR1SyVftwQEsG9adHG0+5EdQq4Q/LHfiKwFG7/ElNTUiS03qtgXoDpfR1mhrdytwxcfIAt5a05tkKZJ3aVJG6PBaJcQ/LZUVdvO2GM378WTti3LyhZ8ndwKSR6Zvw8UFxdUN4BU52C9Z4V+btukn6k8Yz7ET5Q85rXo5rTmFHjajao8RcCGqfqjoXEkj2JVb2OtZQSOgfa/EcruhlS0UoSA+f95nqlgd1Lohxi//spj6bvCQFuWa0IoqCjHlocX21A2/qipqIR/GlfQr7aRUup2zgAIcg4pYEsQgjrnArBUNGEnJCVg8aN+GkT70iLKzt+AphPv3tyVP9OS31mQuLYMZadX9l+YfIhe15xT89AVJY6OPbJavEah1kO3V0CgJ+vq/o8HMKq/WlhZFtQ5U5hbPlhUZXtdSlPh7w32it4xSCdYb6It0pBo6B1pNuU34N9ANsHRfXlaf2NdwTZaChHolZdEbflWthZMIzpF35INMkfV9kPusPKkGB7TODfx3VoMSErS/lH84HOg9OSz371kuWb+QeJtl63pWsOK9VxMe/35oyNNV2yma09+RzPV1Xi6rTdz6OtdKWJAB/rycLhyBVwCBr7VtD/UbN1D/vuDXTfhqDde3PLEml0CpP1PeTn6oDStKOWKQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4b58ae-eb1c-483a-c2a9-08db34db875a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 07:09:28.0290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkMYjRKcRyMclxKryR9ViLLMAHYE7YSojcUV/DGx0H44jnT/V1wDZNaU5HRcK6VYwVxUICHuZIFd6bVROi36cuBz9npwuoUshJv0wNi9J0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5696

On 04/04/2023 7:46 am, Jan Beulich wrote:
> PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
> more than 32k pIRQ-s can be used by a domain. Document this upper bound.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> I was uncertain about also introducing a bounds check in code: We don't
> check for bogus / abusive values elsewhere either.

Normally not, but in this case I suspect it's worth it.  Without a
bounds check, don't we risk wandering off the page?


