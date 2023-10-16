Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EB7CA8C3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617527.960177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNDR-0000zW-UO; Mon, 16 Oct 2023 13:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617527.960177; Mon, 16 Oct 2023 13:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNDR-0000xI-Ri; Mon, 16 Oct 2023 13:01:01 +0000
Received: by outflank-mailman (input) for mailman id 617527;
 Mon, 16 Oct 2023 13:01:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsNDR-0000x9-04
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:01:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09868787-6c24-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:00:54 +0200 (CEST)
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 09:00:44 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN8PR03MB4946.namprd03.prod.outlook.com (2603:10b6:408:7c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:00:41 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 13:00:41 +0000
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
X-Inumbo-ID: 09868787-6c24-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697461254;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P6a4xS8WAqFWUEi2rNivCnXC69RIfRJtHXPO+I91Pr0=;
  b=iQxZQlkg1SjeHI473Due7O0HZ+Bsez9Ia7adul1WixiuPUOg3NHyNg2V
   t16NtRZNOl6jRcoNhL8+vTduGk+0F8v8ku3eZmBHgYED4WyVhuj5tKUUc
   KNCm1HzobSK75YmIMAyyAgM1KnLE6G4O6YM1FwK6f7qIByfGVgx3o8y7I
   s=;
X-CSE-ConnectionGUID: CYV33QmkRh2TqI8PKs6aJg==
X-CSE-MsgGUID: aprf7JTrQf2NLjxXFsbv+w==
X-IronPort-RemoteIP: 104.47.74.40
X-IronPort-MID: 124308025
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:XTLjMq12Bg+hDHKINvbD5VZwkn2cJEfYwER7XKvMYLTBsI5bpzxSy
 mYYXWmFMqqCMWH9eIsnaI2w80pQucWEyYNhGVFupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRnO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKlBwr
 qchLTM3bkq/nsPm+JGgFOBOiZF2RCXrFNt3VnBI6xj8Vapja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxovy6PlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv22rSXzXuhBer+EpWx7uRk33+v3FUdUjsyV0uLj+KzlA2hDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ua5QeX2+zr6gCWLmEeS3hKb9lOnMQxQDk30
 F6VjpXsDDpmv7CPYWKQ8K+OqjG/MjRTKnUNDQcGUA8E7t/LsIw1yBXVQb5LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T4lTvkz+q4J/TQWYd9gjRG26o8A59TIqkfJCzr0jW6+5aK4SURUXHu
 2IL8/Vy98gLBJCJ0SaLEOMEGen14+7faGGEx1lyA5Mm6jKhvWa5epxd6y1/I0EvNdsYfTjuY
 wnYvgY5CIJvAUZGpJRfO+qZY/nGB4C6fTg5fpg4tuZzX6U=
IronPort-HdrOrdr: A9a23:vKgfh6FLi6fvoCq2pLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:Y8/E8m6hSU6EpsOPB9ss338qQZscd37nzC3sOm7oMUVyFrS3RgrF
X-Talos-MUID: 9a23:wKlwEgV3p/zrRBbq/Db0nj89Fvty2qr0LmQPgaUooMOadjMlbg==
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="124308025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/LL2a9aHgdBSUo97KdAM8Pigh4VYbl09r9P63o8mQinUP+8YfJqoCJir7zhEeAfp/zxpEFwffuAOaSn2r5+KtbnjpGCaSAzk2gs6rX09wIXn0WALPEfAtYgYslQO65erq4DlD7B7yemnXos/fEITcF9oVNPSJ2bDduE22morbXBvzDfXEZySHvM09ZPjwMHqdn9U13PteXNkqQLkQUM9GxTdWCnyu0COrDJ14kZd4lkzXoIVlJK1Xx/CZaAsAT+khBThvnGKOi+ImI05dPeiZLZcIsz+lf/1tYf13PHUOA55hDNHNy1NmogRXsvMZjGywJYD/NsBmLmCGxLtg9XfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jC1Wjo2d68yWt7bQUv6t5zGkTBJiO/L4u+7ynfEWJ4U=;
 b=jB/GNiMlxUR/1pM9gqs8ufb6rutE2rO3d/ujJALJ8N2E+XUQy9XZ44ExdCWlBl80w+iZ/Es0wGEt7aqrD6jxjvMMhgTsVjFbvNIuIOzezPZI+Pxx7zgS3QV1y8xWuqZi5JHsM+SkaCB+BRNc1jNBQAxWilRd9lz/jff2cXlmdMWCO/lpGklOh+OgeOPJvxo9Md0R8e1F3QYvJn2HAlVRsH38BJwFq9BMPVjkf1fWfcUCAwmunQOvM2R/es1gvr8sd976jivPWNoa1NG9dxwjQrxUrbB3z9A2lK8XjDy5SVJ9vD+yAnoV3R2npU6atzVgu5PN9kQEE2iZhLAz6XergA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jC1Wjo2d68yWt7bQUv6t5zGkTBJiO/L4u+7ynfEWJ4U=;
 b=KuHre6w5O6CK3Apx19SFiqljBgBpQZ250WzcfIddmqsvi7lxi1u/jLPbhO8RisJfLAveVPQCn8LZecVJxxHxQbU2I8PihMvqy8ADvLGtTIN3mwkHMoHmv7D5eyeyl1IQs1ESL1XiN7tgz5M/E1Z+/QuMwwD8yH1zs7MZ+FRJPWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 15:00:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Message-ID: <ZS0z89xtFzkmK8_d@macbook>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <b8c03b77-d4bf-3be7-2090-e76e6849b085@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8c03b77-d4bf-3be7-2090-e76e6849b085@suse.com>
X-ClientProxiedBy: LO3P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::12) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN8PR03MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d1de69-7178-4fda-0ae3-08dbce47e671
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9tGBfss555fgtSk5EfhXeDrEotUYU21Q7CsfiErWAcPKC/UiTOLYsxhQT76sX8xVxSIU6ODKqjVXoH3hUyZBheluFRScHfNm6cmh4FezbBDQ9AxhNu79R19A4HS1TQlOS5x5DsuwP4enaCCXu6nXfU92pL7JJul3C+XPhLtvq4S2qZMj0rCSSyW75MdrsYKmgwiV5cY/7pT7HodkSg0qh6fEoeURtfMnU/azhJfPvzNjUBrFsRtZPjzSTB5fCfELrmH/Xmj52hyifBFnsPvEo/LTbLGuq9MCMv2hOJX0SZmvf1mw4oYpvivglMa5IZk8kcrRFwmOPS5bAk3q+aI0L2ZyuxwgygNHeVLMh9g7T93WQTC5mY6f6OqqReRBBkqbW+0Ibw15vHoHgaqA25HES1gmBU+SLrL2hBOCSHvfqSyWCOKv+Umo+JNayjXg1ZiL9E5uthzppyZDdAxjJ6nz/+8s03L7wr+3qZEqht5bTuNt95/1ycMdC7GoL0WZ7O4XyixDEttDdyi9IcO83sFEr3WMRt3yGiDfvjqOMIUZigTHFV9nrdTIAkPZ9UP7ysWU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(53546011)(5660300002)(6666004)(2906002)(26005)(85182001)(83380400001)(82960400001)(38100700002)(86362001)(9686003)(33716001)(6512007)(6486002)(478600001)(54906003)(66946007)(66476007)(66556008)(6916009)(41300700001)(316002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2UwVFB4VGcyL3V3OWZ0ZzA3bmxFVmd3ZzJnV2M0UU1TQXBGKzEwYy9qTW4y?=
 =?utf-8?B?Ujl5TCtBZGp5UFQ3blRrckVMTTVabFdjZFVIbmFjQVhSb3hScTNKbWlHV0dw?=
 =?utf-8?B?TlY4SzF5eEdWVVZiRThmeGs0cVJVWnVUcUVoMUIwRFJmTDlMREtoUHd4dzlV?=
 =?utf-8?B?bXlWWmtBSXN0SmIrM201d1YxVDZ0Ri9HV1VZWGJKWXlsWTc5eFpkd2IxZXNT?=
 =?utf-8?B?ejJoK2N6R3BuYnJibXk0MXcyTmJIOW1UK0ZKUlc0aSswaUxlZWZZLzFNUTM5?=
 =?utf-8?B?ak5qTmthQk1QYXdQQWYySnl5eHJ4ZGR0VXdYNE1ZeG40WTVZMXl1Q3BYKzJj?=
 =?utf-8?B?cWgrZStBcmVILzdIMEliS3JCM0gvbHl2REVuL0kxbjBqTWxHc3p6eWZ6d1JC?=
 =?utf-8?B?eUpub25IS2FaLzBnRXNoZ0FCVDJJL2tMbk1yOEdoTlNVMkJKSHNTT3dISmxX?=
 =?utf-8?B?OTV5eEdpcWZKcUs4cjhGeDlEL1NyNXA4VW0wdHAxTHhiakRENS9uWFlLbkcy?=
 =?utf-8?B?b2tkS3RkVGlUMGFkRzFUTGgyL3FObnIrZFgvbzRKb3NnUzY1YytMNU5vYTBR?=
 =?utf-8?B?TytsQXhHTGp1c0s4U3ZYcUpzUEEya0VXb0xabWhINHRwM2ZmOTdRZFloRUxN?=
 =?utf-8?B?YWVYNjl0dzg5b2JYZjhSSzRnTXlmZlAxR1c5UGV2UlRSNENRL0dxSDU0MVNu?=
 =?utf-8?B?c0RrbGhVM2xVMWF2R25uNElVb3pGMlhLWXhJM2xKWWp6blJJa3FRWXpZUTFw?=
 =?utf-8?B?Tk9oc3c0cTBuTjZ2QXNmdHdmVUpWamlhVUVwUXQ3VGE2RWtNWHJtUE5Cd3pt?=
 =?utf-8?B?anJtMy9PMUJCK0FEWUgzNUhZdzRXbHM0cWJ3aXRlcDgrSndmZVRKNktoZ2xK?=
 =?utf-8?B?QVpkbkRmSEJlRGdCT1Z1TWFrK0h2b1NMTno2S3VjR0FvSHUzSE5ZR05VSEtq?=
 =?utf-8?B?cWNsZU11NFFGcWV2RllkcTRPNGk4N3Nnck5RcEJ6VjRpRVlHWEt1NjBKYkVj?=
 =?utf-8?B?WHBvSVFLYlJ5YkRVcStwZitKME9rMFJ4eWJqRVVNVzlJZHpjNnE2UGY5bHZI?=
 =?utf-8?B?R09NRTVsOGxXWmNxL1lRYmhDcEVYbnhoaGdCeU8vaFhIYysxVG1DL2Rkdmh3?=
 =?utf-8?B?OGNaRmZjWXpCbDU3RERjcldWYThqdDB5K3FvbTBpZjhvVm5yUUJDOUFMZ3Ur?=
 =?utf-8?B?NEZ6ZXNBZER6NnNmSzVLUWV4S2lIUnRiOXUzR1RMZVo2eVladGhwNnJENzNi?=
 =?utf-8?B?MHJwN3pxV29NMHF1RWRCRG13UFB5amg5QWVhRWZYdUMvblMxOStiME53a0FS?=
 =?utf-8?B?eTNRNjNVSW01dEt4Z3VoRWZ2WmhtMDF1WGlQL1B6aSt6MGYvN0RqcUU5RERr?=
 =?utf-8?B?VVBHNHNIZUh3SStlKzVqb1UxYWtjMm5vbXVrYUhZeGtFSHFhYmdxWmZod0oy?=
 =?utf-8?B?VHpoTmlSTUNHUmZvU0xTQ01sam5jdEpDT09DRGxqS0hULzlxOVhjbllFakl2?=
 =?utf-8?B?OTFtQUprZnpBL2VGMkVPZTNxckx0NGZ1S0hmZzFLVzB1VCtEWllqTFZHcVFI?=
 =?utf-8?B?cWZPSFRncThVZExpT0o0Rk5OK01uSFNETGhCb1BuMUJWQnZQRklmU2w4eWFH?=
 =?utf-8?B?NTBZY2ZjMXByVnc5U1JjSWUvQ3UvaGRKN3RRQTRZRG5ZbGdXNEcxZ0VnYzlv?=
 =?utf-8?B?WWtWeERzdFh1K2tqNHhnMlR3SUwydW5GUTlpZzlNajRaSndiQUtBa3dRc2xO?=
 =?utf-8?B?TEFVTDZScE4rTlFiTGVGQ3Vjc2dKdVpHTTFGUWhBK0szZGtvbFJrcXAyaVI3?=
 =?utf-8?B?RGpSQ3RsMkZ1a0N5eFZBTUxYYWw2d1psOWd3NU96T3BhMUd3Q1c2clNWRWd0?=
 =?utf-8?B?N2VnT25kTXdGMGhNd293a0R6Vk0vNFFWb3Yyck1xWE8vQ0tCbWFJdVR4dU1p?=
 =?utf-8?B?M0h4N0hCQnB2YkR5V2pmVk1wSTVFVS9GVzIrdFJmczU0ZGQxc3BuWHdUY1VO?=
 =?utf-8?B?aWFwY0UrR1FnSWNEVDdvcVBiaUFuV0txNTA3amU4OG10TTBGZ3IwQXhHTW9V?=
 =?utf-8?B?aGRmYkF3enc0ekhldDdBbUJiZnRxdkg0N25INEVWTnRIZG1KWktqYVRYY0Nm?=
 =?utf-8?Q?LFQK/W26ZPWYC5rLuhMweYkN7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IdtP8nbu04ZdNFQtSk7eEBNtqbRe/pI55+5dmM8tdJUyM/5URgHscT7RzZNoMdoZKWLtOm0RlcCgm0Xv5SpVoTuu9W4FmtakDYP77sEipr6UTimYa9Xf3oGBV3vyJyOYtfb/AkJGJgZbsfOZFoM9L7kHfyt3aan2/d5TeDfhdBhzeuw7eoyBvfff9Ban4Z7blCQdywRQFNX14nXkU4FC5K9RfdXlqYRTD2LUxCZfj1Ttarip0qfLOjQXLrlB/69O5Z5Ao9S6zP72bchEgs3tVKWL5Rec0PgdpGFWH+P7soW1/muDsgBYH8vKiEwBnYaSlq8MmmwTctB7z714zWruONKkHCgmv/Z0BIzebueUKBUbgv5wWdELQnKWNf2noesM8VrR/4pLIGltjAcZwAlCnsnBr8WaovmkaOtn/TUK7KBngR2CFAhyYZvpmCCuyHhZaqorYTBSE6gaVmwKXRZ3x6arsrs8IGSxh7YnvUxIKNxrMt3KbMxTuB4Fi7dxEFQ0yUBldusPKJUj9/mJ8eIS0o1zeQtonQxGTR6S6r0EjWgpjdBcSPY+AP5CBuewgOPTTJmPbFTso6SGReplNr0WfWLrEwg7D0gWIMOkpHGw0thzeC25Zhxmefz0HY8r7aCUx5KO3xy/y+rldYhHHdcDar3Qz0xlvAWTGo8//Dcx0DCcPyv+aYv9eFfxC6gLQkpL7cxSix+J/EPj2tYY/JSr5ZTOyQBRzQUuqc+iOCuQgkqUuoRMg0EKWoFVcK91itnb9Svs2j9ljCQWZ6vW0KBYlmJ4/5kssIakpQvfWt3r77T1uzZos5ia2Et8R/cnZUmJB3Fv4M7GWG4/Pb0uZjSgNye6IrEzxz+6FCRvXHVqkJeZiH01M5skakrnG6IqsM+SJUyz4s/gvhv/thSeWBUDG9YqV76wi8bHLm/lj4ZLNAQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d1de69-7178-4fda-0ae3-08dbce47e671
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:00:40.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Awso6ccQdKTcw/YivPRlKJAAGeLFeKfhNV6rPSnG6o4nHlnVLX2rWTWeiZyZWwDfIut7vHW8+EWNFRvcW5anNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4946

On Mon, Oct 16, 2023 at 02:35:44PM +0200, Jan Beulich wrote:
> On 06.10.2023 15:00, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -1580,6 +1580,10 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
> >      {
> >          struct vcpu_register_time_memory_area area;
> >  
> > +        rc = -ENOSYS;
> > +        if ( 0 /* TODO: Dom's XENFEAT_vcpu_time_phys_area setting */ )
> > +            break;
> > +
> >          rc = -EFAULT;
> >          if ( copy_from_guest(&area.addr.p, arg, 1) )
> >              break;
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> >      {
> >          struct vcpu_register_runstate_memory_area area;
> >  
> > +        rc = -ENOSYS;
> > +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
> > +            break;
> > +
> >          rc = -EFAULT;
> >          if ( copy_from_guest(&area.addr.p, arg, 1) )
> >              break;
> 
> ENOSYS is not correct here. EPERM, EACCES, or EOPNOTSUPP would all be more
> correct.

I don't think so, common_vcpu_op() default case does return -ENOSYS,
and the point of this path is to mimic the behavior of an hypervisor
that doesn't have the hypercalls implemented, hence -ENOSYS is the
correct behavior.

> 
> > --- a/xen/common/kernel.c
> > +++ b/xen/common/kernel.c
> > @@ -607,7 +607,11 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >          switch ( fi.submap_idx )
> >          {
> >          case 0:
> > -            fi.submap = (1U << XENFEAT_memory_op_vnode_supported);
> > +            fi.submap = (1U << XENFEAT_memory_op_vnode_supported) |
> > +#ifdef CONFIG_X86
> > +                        (1U << XENFEAT_vcpu_time_phys_area) |
> > +#endif
> > +                        (1U << XENFEAT_runstate_phys_area);
> 
> No provisions here for the "disabled for this domain" case?

TBH I'm not sure the `if ( 0` above are of much help, if we ever want
to provide toolstack overwrites for those it's fairly easy to spot the
paths that need to be patched anyway.

Thanks, Roger.

