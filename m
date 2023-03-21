Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D86C36FB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512860.793183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeu3-0004on-UD; Tue, 21 Mar 2023 16:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512860.793183; Tue, 21 Mar 2023 16:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeu3-0004m4-Qj; Tue, 21 Mar 2023 16:32:03 +0000
Received: by outflank-mailman (input) for mailman id 512860;
 Tue, 21 Mar 2023 16:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKE/=7N=citrix.com=prvs=437062dd9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1peeu1-0004lm-V7
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:32:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5ac51e6-c805-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 17:31:59 +0100 (CET)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 12:31:55 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6328.namprd03.prod.outlook.com (2603:10b6:a03:395::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Tue, 21 Mar
 2023 16:31:50 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:31:50 +0000
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
X-Inumbo-ID: e5ac51e6-c805-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679416319;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z47n4n+gS5fEkoQ9JMPCtVYQMplr5axJE+aJRnonHPU=;
  b=UH0MLkB8gL2VA9CXdiZb6X6+U8x2fcU6ww9o6C42XLDHKknDou8a4OFL
   mZMWzu7hCnP6gxs36bw5gLqMj4SPXSFcT0EFmjfO4uQ74dkV+5EKVcDPj
   hQlNZ6TOjqSrt4cMyxLo3ADNk5CZ+uxV3C0ZPdUnSJ7YFhYIuGeMUMzRS
   k=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 101742101
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:u3/rWqm8uehNSQ81QNHP15Lo5gymJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKXWvXP6vcY2r0KY9/YITl8hwB6pbSn9ViQQM5rX0yFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 bsoLWozYiCku/m/65yLEOBmvvoADta+aevzulk4pd3YJdAPZMiZBp7svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3jOeF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXqkBNhLTOTQGvhCh3eqhU83OiMtBXiQn9mw1kjlXdhnE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACBADut/qpdlpigqVFoo8VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:5gZGAKs5Igk0stIWBgseTO957skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101742101"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8+xO3iz+c+U6zT7YqlBpNjvBSUkyHRcm2vA3Ye5ozgANqC5M6Q+B+3uZvvjQooo4lINoTYpFrdZjPanKp6LuYGXS7b6JgXh2AGGQhyTz1CbFq2X/gJPCJKCrQFJ+88JKiKzQ1Aq9N4ohj8+5x55wS9uXOhEIYL3k2AJH/0SAhCjOc+72L9o+nNS1rHBl47BgWmXMp6AQ7p48QLPi917M5dFJRCoRMLj1xxCjWZJiyE9VszXjGvbrogsFcKV6+iH8/07AvI25Tc6DKS6BubXyfXwB6BayrHBSrK8B3hkKmXwaMP0LyxD79iHQGR9W65UWQpCU9bJgHSKSBIESr39bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3D/1CYGdKpvMDBEEWWPkgDar4XcmsQuGKLFgHUD7qy8=;
 b=fydPyrV5Cx4kUcy/K5kS8fMehtPZr/q2y69lROSEAmPZHUJ6AOUA0iIjL81WCTqWfs3Saxi1topQqvjcnyZEwknMG6i/15GXOSmGp2EC78ZAdGSLQf0XLpyVOehnnkOEWBI2+dk6LHsIcvb/+qjW5WBM2+pOXxVC5xZR7iku5nLuBaTf/xsUyCmVi2mMwIOBfvaQdf4an9w3mMeZzkpjkSnmyJVxuwQaFMxc1tsQtr/XuBJTH7lft9Je/6OooCHKXpAOmBXkrbZ4ZGnQNJ8lqNDH7gCRXkKGKBvgsoGeoc3juk0DH+ZGYrLIZim3qGzLTJ+aWw2VTCt65Mc2qsRgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3D/1CYGdKpvMDBEEWWPkgDar4XcmsQuGKLFgHUD7qy8=;
 b=jimSr1v7BfbgyT2e9dSfsbzQ4G0SElOUsuW036jtJ9rFPcYkQSdFTaUEDniM+3wYIHIEIWmkt2s+RmyGGs642kHIzZuAd3mSw5+dymj5eoWRtCT2JOphhe0n4SiwkhnROqzASh3vhawxljnYeRLP25EYc0ri9QlwlvcYR+R3psM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Mar 2023 17:31:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <ZBnb8Dv08XZm+a3t@Air-de-Roger>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
 <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
 <ZBnF2oTLQjJtfZiK@Air-de-Roger>
 <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
X-ClientProxiedBy: LO2P265CA0432.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::36) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: def6ec31-a7d7-4682-941c-08db2a29c59c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FambRrIWBjOs5o+ot4EGvjycnyf7UWQW1Ulp7kn9t4edJzRcLJ6boB4vbPOpeKj7OdoALVjd1XeLcnMOlxn7ltg77Sd68d+c3L/Ok1pV9Zq1GGd8gVNTtEVC0ILt/qHo5mOk0J2RdNYln9SdVufJB2hpL8V5aO75FHTtck0BsJLvq11PNC8RR0VxMy4BIMfjB1XpfFGWnHpvhBoRwqq5C7G+iWOOfo9sRKlVKPeYcmEIgWA1BETDXw3gDSqLFrinHU576zU4E5wFzVRry97y2WZdgIZe00sE6uwcs+do63xCWWXoZPgEdIiIlWlavihFAefIXkJsQ9V8Ohk304BOxr16kaaFFVhEIUUCzH4qYDFOUkuUvrzXO4kwS87ZhYvzJF8oVoJumdVHAHac3z2872c7mPyFaczd388gOIBhwEcx72XUoT8DYYWnSjDdtXto1i1vui+wUEgvcOIzjUVy6fmHdOvLFs0FLtWHg4GJeBP9DdLvvR64Xmi0OLDm2Y4giRXzVEeLf/12ChJ2HrLm0R12tMK2TDllXisYdA7f0VTFTVYvSb+3kAuvlaQ/r2CcsaT+C5DKhoX6dJIYRBj6SZrBz8mHXaFWr3dCMhgY/tf9Lb5dUBuxt1epf6oRtYOJYOHC5oIgR0f4Myk9D4ZWzsyD0nzl2MYWhFemkOkbizF3uzwztv5CxMENHPQNFG1uPiyAeHDeOlfl9+YzBQyCn1QSZH2/Q9YWWZnfO5fIr5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199018)(186003)(9686003)(54906003)(38100700002)(316002)(478600001)(41300700001)(8676002)(82960400001)(4326008)(66556008)(6916009)(2906002)(8936002)(66476007)(5660300002)(26005)(6666004)(85182001)(6512007)(53546011)(6506007)(83380400001)(33716001)(86362001)(6486002)(66946007)(16393002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG9zK3JJRHcwRXE1OGZ2cm91WUZKTTg3ZktSeTU0WUVOaWxMVHB1d2JEa2Jm?=
 =?utf-8?B?OEM2MTlCRkxxNXJtNG1UYUpkU3BFN2ZSSmI0U2tib1EzS2xRQ2d1NVNoeTB6?=
 =?utf-8?B?bWIxV200aThCd0UrZGlaMXNFS0YrSFNVZFVBaUtsYVBaNmttSll4RU40bEVI?=
 =?utf-8?B?c1FhSjk2b1lxNlhHU3c2b0VtaGJ6RVZVY1FUNHl5MHNLa3FCZ05EV2hUYVpv?=
 =?utf-8?B?RGR2cnR2QTNlb3RrbkpaSzAzVjkxTEtMeWo3dGNQSzhTT0l0T0YzZGl2a3JC?=
 =?utf-8?B?VlIxQW45TERNSXJLUXBVL0dMa0N1MjVGd1V4d1hUYVA0NVpaaEgwMXpHRTUz?=
 =?utf-8?B?WGpRakVpd0tRVUNPTEYyb3lLUUl5TndYUEVBeUJXOFpGRFV2b3gxaFhUd2dF?=
 =?utf-8?B?Q1pIcGJvNUlud3VSVVZ0dVlQZHNhWHhndVRIa0wyVHFJcktGd2NkNnlKTEgx?=
 =?utf-8?B?Z2ZNeVFpcmovZ3YrL09BRTdwWkVCaXdDS2JhY3FyN3ZMbFNkcVd5Sm84NldR?=
 =?utf-8?B?SFA2K3VtakUzQ3hYdDErNFFsTkdGd1ZMb1ViSTVKZjlBaEtKYkt3VlFZUEY2?=
 =?utf-8?B?QkhuRUgvNFhRQzJ2UUxXT0dCKzZOZHJKTDMzMjFtQUowU1ZJOUVXWkJDZE1l?=
 =?utf-8?B?QUFBVXU4d3Q3RWtCNkt4anVDR3hGVkxZY2J5UHkvYTQ1UnpTdEtOaWduaUpM?=
 =?utf-8?B?djlOR09Udm9NQWYzTWJuWWZqTVExclVKdTNPcVZwSHliWEgweUV1WEc5bmxQ?=
 =?utf-8?B?c21DTTdPRFpPeU5ZQ0NFTkdBdHNES1JCdDNseE9paEF6Nis3aFdyWm1ZZXU3?=
 =?utf-8?B?Y0NaQkszNlZBN0s0aElubWUrVjRYWFJBY1RPZHlYcWNRSmN6QWdPdlBqK2xH?=
 =?utf-8?B?eXRnQW1OQ1dWUUhadXJGbVhaNit1Y0ozOWNKb2xnTlBydjVuczB0WndQaWpP?=
 =?utf-8?B?WThOMTEwQnp2WER3NHVyYjNzVUZmbWRpa1dqZzExNDhQbFBNYUNKeGpFTDVZ?=
 =?utf-8?B?TStmV3BNa3gzUUpVcXFzQ0dVZm94MmdFdkJOKzZLakVISnVtSENCM1h5M0d5?=
 =?utf-8?B?THhmSlNmOXVDVWpFanhjVDdHUU1KdGdwd0F6OU5mOHlCbDRFVkZWSVpwVi9p?=
 =?utf-8?B?MFRQM0lNT1FRckYvQjJIMmw4QjVxT0Y0RE52dGxkRWZjTG1YK3dPLzdDOVNz?=
 =?utf-8?B?OUJkblo1K2FlckU2a3JrTXIxcnRJRXE5NVRsOFd4WEFaV3dabzM5TU0zSG1X?=
 =?utf-8?B?WE81TlMwUmZhRUZIQ1JmUzYyYWt5YTA0cmZWVE02Rk9QYm9Nb1BCMEVCeThY?=
 =?utf-8?B?b0ZRZzBiRDZNMkJLeVJnMkNoQ0c1MThUWTlRNHhlYzlZa2RxUG1HUEkxOVo5?=
 =?utf-8?B?bEk1dTFFc0NDenUrcjYrSGJtUFU5VnNUUGwrL0lDYmtEaHNWanptMUFqSzdR?=
 =?utf-8?B?aEdOZUp2N3BCM0FxTnl3RzdRR243dStZbmtqWG4zTStkaTRyN2YzNk5icVNU?=
 =?utf-8?B?ZExSdE1HVlFUNldTbkFGR2F3VXQvNmFPaHVTUEppOGY1UFhCUkIzUjgyb0x0?=
 =?utf-8?B?ZWppUm9RM2dFMEhKeUZsbm04THJXSkpOR2pPZDRDcnZqam5lc085cURHZU0z?=
 =?utf-8?B?cldDQ2FIaXRoUHE2UVh6NVlWWXR4VGUvY29DaU13MWhUYjZ4QmFtOFY1Sjhu?=
 =?utf-8?B?VlpWT0tpMTFPRldyNlA4djh3YjYwSFV2STFEUk9OUmtjQ2ZDeVpMWkgzUkxy?=
 =?utf-8?B?anpsejRtcUdtcDJnZXlsT2o0Szkwc21VejlFbFkxUmJVaTUzczludHRpN0VB?=
 =?utf-8?B?amNYQXdhMTh1MFpncTVDSDFJRTN6WVkzdVhjR2k4M2tGMFhkT3ZmT0JrMmZt?=
 =?utf-8?B?YTBIU0NTNnlwQVdBNmJYNVoreFFqRWJrc2NlSmhQM09Hd1Ixcm9XY0JzMHlB?=
 =?utf-8?B?SUE2ZjV2R01ZdkhXbUJHWURpMjJZWUpNS0VzcVFYRG5OTVlPcm85ZWhFMVlW?=
 =?utf-8?B?SDBNaVdUNHgydXJZelcvT2tXQVlIc1NnbDNFb1RCV2xkL0VYWi9WYjI0YmNi?=
 =?utf-8?B?ZDBGNHAzc1A2Wkx2d0d3c2pBOXVHL3BmNHlNandCSGJxY2dEaytGZkJkZXZm?=
 =?utf-8?B?ZnFIYWZaQ2hTTXVZOEFNSGxwejdQc1l4RDZ3b05GdkZERGkxUjh5VHlUcEs3?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zVDEfedoYgefLUNec0lP9f3qlI/mkLhh/U8eRs4MiN0QBNEXeGC/eje+G0RPR1wMSDMmxrVJjdt/e9nzKT6rPT4h5QPgVUyJE+daYW8RwiPVTaVZWbK0k7nK6b4fU8ZT+fyHmJR/bZf2q0B3UET1xXhdf1vM9luOvhAChdksG5e+BIq1XtOhIfhU4qOr10w5y5dub3TpefKj6MobydjovO+dRA6encCUfMQMw6aVfnUhnokSqwy38Hm/xMPTnDInxdWaQy150rKxJVkQTOrTqbPWUYXPVm7KsrsEhvaTxHdKKYKhLleRW/hTfg/q6SSXwxpItrgwXDaWkJBh/lBnQ2NksP2JGFEFti/j71Fck9YtbDL29LUVV59hVcB0bxkb85+gn39HD5L7q+cHGV6H2D1HdgCSGW8Ti6NgX2aw+mgcln+spnG81Ge9L7RvA7HTzSlQYpbSBx7IlEe9kvyv3PtsI3jIlrZ09pN4bf9NWjBX+fNE0ho3bJ/m/69hCUFkSIU3UPIFBRVTTzNdNuTmf8iZkodSah0CDERuoVkVfOugPvHOPxZcgsdPYkr2T0jinzovt+IPr9OKpSOcksGqLqiIX0BCqzNfAbR2lCMAGBedumZ/qLMWBQ6BmYm1A2o3590ucGARHgK14X0ZYLaKJr+HWizb/79qX1y1E80pWkOhQizXFxayiwzsc3yOUf7iYZ6Q2TY5UQrsgpi6Vp55KM0CS09gLBa8vlYK4yRUhze7OnmINQaqWq8QBLCB5KHoE4NE7mpVE0q94Bizrp3a98hl8esP3DiHnYw/weO9k9zwhjgRjPSakou49NpdcuM/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def6ec31-a7d7-4682-941c-08db2a29c59c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:31:50.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7Tm2mSzgUmq4HsXNokRFGz4sRiOH8UxYihQTOGcEOtOTUopx5jIH2nkjX0jmc5K+hpSEyGxG5g54m4SAAaeLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6328

On Tue, Mar 21, 2023 at 04:35:54PM +0100, Jan Beulich wrote:
> On 21.03.2023 15:57, Roger Pau Monné wrote:
> > On Mon, Mar 20, 2023 at 10:48:45AM +0100, Jan Beulich wrote:
> >> On 17.03.2023 13:26, Andrew Cooper wrote:
> >>> On 17/03/2023 11:22 am, Roger Pau Monné wrote:
> >>>> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
> >>>>> This is faster than using the software implementation, and the insn is
> >>>>> available on all half-way recent hardware. Therefore convert
> >>>>> generic_hweight<N>() to out-of-line functions (without affecting Arm)
> >>>>> and use alternatives patching to replace the function calls.
> >>>>>
> >>>>> Note that the approach doesn#t work for clang, due to it not recognizing
> >>>>> -ffixed-*.
> >>>> I've been giving this a look, and I wonder if it would be fine to
> >>>> simply push and pop the scratch registers in the 'call' path of the
> >>>> alternative, as that won't require any specific compiler option.
> >>
> >> Hmm, ...
> >>
> >>> It's been a long while, and in that time I've learnt a lot more about
> >>> performance, but my root objection to the approach taken here still
> >>> stands - it is penalising the common case to optimise some pointless
> >>> corner cases.
> >>>
> >>> Yes - on the call path, an extra push/pop pair (or few) to get temp
> >>> registers is basically free.
> >>
> >> ... what is "a few"? We'd need to push/pop all call-clobbered registers
> >> except %rax, i.e. a total of eight. I consider this too much. Unless,
> >> as you suggest further down, we wrote the fallback in assembly. Which I
> >> have to admit I'm surprised you propose when we strive to reduce the
> >> amount of assembly we have to maintain.
> > 
> > AMD added popcnt in 2007 and Intel in 2008.  While we shouldn't
> > mandate popcnt support, I think we also shouldn't overly worry about
> > the non-popcnt path.
> 
> We agree here.
> 
> > Also, how can you assert that the code generated without the scratch
> > registers being usable won't be worse than the penalty of pushing and
> > popping such registers on the stack and letting the routines use all
> > registers freely?
> 
> Irrespective of the -ffixed-* the compiler can make itself sufficiently
> many registers available to use, by preserving just the ones it actually
> uses. So that's pretty certainly not more PUSH/POP than when we would
> blindly preserve all which may need preserving (no matter whether
> they're actually used).
> 
> Yet then both this question and ...
> 
> > I very much prefer to have a non-optimal non-popcnt path, but have
> > popcnt support for both gcc and clang, and without requiring any
> > compiler options.
> 
> ... this makes me wonder whether we're thinking of fundamentally
> different generated code that we would end up with. Since the
> (apparently agreed upon) goal is to optimize for the "popcnt
> available" case, mainline code should be not significantly longer that
> what's needed for the single instruction itself, or alternatively a
> CALL insn. Adding pushes/pops of all call clobbered registers around
> the CALL would grow mainline code too much (for my taste), i.e.
> irrespective of these PUSH/POP all getting NOP-ed out by alternatives
> patching. (As an aside I consider fiddling with the stack pointer in
> inline asm() risky, and hence I would prefer to avoid such whenever
> possible.

Is this because we are likely to not end up with a proper trace if we
mess up with the stack pointer before a function call?  I would like
to better understand your concerns with the stack pointer and inline
asm().

Other options would be using no_caller_saved_registers, but that's not
available in all supported gcc versions, likely the same with clang,
but I wouldn't mind upping the minimal clang version.

What about allocating the size of the registers that need saving as an
on-stack variable visible to the compiler and then moving to/from
there in the inline asm()?

> Yes, it can be written so it's independent of what the
> compiler thinks the stack pointer points at, but such constructs are
> fragile as soon as one wants to change them a little later on.)
> 
> Are you perhaps thinking of indeed having the PUSH/POP in mainline
> code? Or some entirely different model?
> 
> What I could see us doing to accommodate Clang is to have wrappers
> around the actual functions which do as you suggest and preserve all
> relevant registers, no matter whether they're used. That'll still be
> assembly code to maintain, but imo less of a concern than in Andrew's
> model of writing hweight<N>() themselves in assembly (provided I
> understood him correctly), for being purely mechanical operations.

If possible I would prefer to use the same model for both gcc and
clang, or else things tend to get more complicated than strictly
needed.

I also wonder whether we could also get away without disabling of
coverage and ubsan for the hweight object file.  But I assume as long
ass we do the function call in inline asm() (and thus kind of hidden
from the compiler) we need to disable any instrumentation because the
changed function context.  I don't think there's anyway we can
manually add the function call prefix/suffix in the inline asm()?

Thanks, Roger.

