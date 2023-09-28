Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4237B1611
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 10:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609374.948425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmRx-0002Dj-2q; Thu, 28 Sep 2023 08:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609374.948425; Thu, 28 Sep 2023 08:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmRw-0002AW-Vi; Thu, 28 Sep 2023 08:32:44 +0000
Received: by outflank-mailman (input) for mailman id 609374;
 Thu, 28 Sep 2023 08:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlmRv-0002AQ-JI
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 08:32:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 960b17d4-5dd9-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 10:32:41 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 04:32:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5635.namprd03.prod.outlook.com (2603:10b6:208:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 08:32:09 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 08:32:09 +0000
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
X-Inumbo-ID: 960b17d4-5dd9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695889961;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nolEQaUhwB8RtEujk9fNiHtaVsqqipH3a7RNEeyC6kw=;
  b=dFGJJA/XzjjUpbh1b/XclwPDDIpLariMp3IfShf0vq7c3mapO8BCs49O
   NfKtjLwT4c2FSYLZxRSuC5wyp8aYnnyq9g7YKIbyAiaSZohxFc7vxTs8L
   l0719mHdUQJExsrR07auz+2vhcvp0+Fg62i1K7Hgd/rrMA54LV+a9NLC0
   k=;
X-CSE-ConnectionGUID: EEsqage5QGqZ3cE1xSZRVg==
X-CSE-MsgGUID: A9/zgut2Riq5MPNi1HNRYA==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 123300047
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:5iXjlqLsLXOQIt5mFE+RVpQlxSXFcZb7ZxGr2PjKsXjdYENS1jdRm
 GcfWj+EOa2OamejeNx2YY+z8kkH78ODn9NnG1BlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhA7wZuPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5aLHpX/
 PMVdQkidyLYjM/v0ImJcNdj05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv23bSXxXunB+r+EpWRp7l4j0CPnFYSEUAzbX26+NmfsH+XDoc3x
 0s8v3BGQbIJ3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S3iQ67OVpjOaIjUOICkJYipsZQkY59jupqkjgxSJScxseIa/g8fpAzj2z
 3aPpTInmrQIpccR0uOw+lWvqy2ojojESEgy/Aq/dnm54w1wYonjfJCh41Xf6fdGLa6QS1XHt
 38B8/Vy98gLBJCJ0SaLEOMEGejw4+7faWOMx1lyA5Mm6jKhvWa5epxd6y1/I0EvNdsYfTjuY
 wnYvgY5CIJvAUZGpJRfO+qZY/nGB4C7RLwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:DNfslayVfNZNQzFncio7KrPxaeskLtp133Aq2lEZdPU1SL3sqy
 nKpp906faaslYssQ4b6Ky90cW7IE80lqQFkrX5Q43SPjUO0VHAROtfBODZsl7d8kPFh4tgPa
 wJSdkANDWZZ2IXsS6QijPWLz7uquPrzImYwd77i1NRZUVSbadkhj0JeDpy0CdNNXd77V5SLu
 vt2iKDzQDQCEj/Ff7LYkUtbqz4vtjWk5CjSQcebiRXkTWmvHeT8bvnFBrd9QsfVj4n+8ZezU
 H11zbh47mlsbWdwhvRvlWjiKh+qZ/a095eA87JrNYTJi6EsHfPWK1RH4eauSwzoqWUyHtCqq
 i1nz4Qe/5r7m/XfCWOrQDz1xLG2DIjgkWSsmOwsD/YuMnkQzB/NMZbn4JedXLimjAdgO0=
X-Talos-CUID: 9a23:Ix8Yv2zOT9Gt5fugqa9hBgU5N9s8e3LQkU7/On3jAkswWIanc2GfrfY=
X-Talos-MUID: 9a23:+Qv9Owt7ME/dDfxmeM2nrWAlJsh1//6UCVlQtK0gupCkExZBEmLI
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="123300047"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/2mk5SWVusdNmXP5SM3JnyeH/X/ogFpenl9FBSzRi2hJEjWQAnb3xZrzJpRogvLjMttdSTuWFLwjKp89ZaaNYtJfXKcbZcdgomFMh4qXPP2CuvaQsm1FXyBcTGcyfikSYEl7GplcflLwGaPZHXjHiPZylUEetrvTIkJIXp6/naF27/2LKZVphtZY8r/+D5++4i1WGChDZmEJTXY+jImHmNZthSoztbZeRyg2B/fSdCXyBcjH1zEK/c+JRPk8dSeCvts4qv2FWu257Ab+9QQbEifvpwLxjKeKW3KLo8iZEBoY20c0rF8QUdwc7HDURTdeecH5qckU+4hC651Fif/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTtB7ttfbqojrmfUtXuliVIqABohiExfvshaWDWyV8c=;
 b=NgxYbjKOANF3au+eWJvKyOkE2SOAnYUgtzq0JDUHe7m8QtSV+kStyxy1vamtiuZojJSjcr2O963X+fQOYChANIF3NHJTzZLJOq4ITXrBnlw2aaU03ZBLc4xsYBJ8r9eKDuGirhaM0MX0tQUnEbTIuNqSKwe6DkTYJNN5k95jEK5Lx5vp69JkvtBV7yTQKBfmamCGe06/xOw7r7UzPWgfN0XcTJSnxzKL8Mxh2QHxHosj4iNnqy8/mdEhXeN/EhvFZlZz9zNRn1L8cuD1q9JUonCur0V5ES6z31xQ2trpCVgkzWHkX9IXakhlR4KaiF439TpwGkK8LmVpWg2vwWXDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTtB7ttfbqojrmfUtXuliVIqABohiExfvshaWDWyV8c=;
 b=ePvUnizk7Yt8OMRigb1/fBLwLPMyXL3kN1Yf3Z+Yz/MOygmwUCjaL0Fvb8dkCAo5GkVzsARYm+VUIIkjo2ps8MsMmQG5HgUbXZEcA6bSo2B5FL6UVzW5EJD4EHHBkasj13ZOce51gsP/JT5Z2nXJt3NCkSeUq5Cyw0T0rPiV0EU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 10:32:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	jbeulich@suse.com, george.dunlap@citrix.com, julien@xen.org,
	bertrand.marquis@arm.com, wl@xen.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
Message-ID: <ZRU6A2wDSVEEHGbK@MacBookPdeRoger>
References: <20230927232004.1981595-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230927232004.1981595-1-sstabellini@kernel.org>
X-ClientProxiedBy: LO4P302CA0035.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 4413ac73-dc61-4a11-e3d0-08dbbffd67da
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8SnRDzf7kGOpXqaWFNyvxrnL+qX6kJx7r37jYVUTgANVI2w9EFP/n4I7kK/6Sy/GSGFi/QjXiqti7pNK2uvuUIVluCrH+7Q2gHgcFG8iu2ff/hGe1jWOJSkOzMNGwoVDeKZWRIwGMj30GJy+JvAu6pLXtIAy8h3yrSb0r9IswL+zpP3ZialXGeKCkWXgXXKzQIMSlXHIsYvYO+bIA4ArdlYZI26Qx8g4A5onDluZrADLvu80g9yU8AMA0hZ3+HwDTOzEDj62aQv6ODGAYaYKfeG+wGH3wUXk4Ryag7WOzL/rMi4jbqOVgzJOat3QiPyoMzErdYlgufdM79Yfc3g9LJiVclzOmkFG0LFgXcP8GoF1bhJ6f3hpQ3770FHR6Te60dE1+bGR1nlGW9fTFNeF5EuWKbNrwaRJEyDElT63FNbPL0kWN/eealJCq/fAhRW4WXSjyN+1OUKmeVSpKVVO662HysIj+p5BtVCF/36E50Dyg1w637JEJsjL+z2/GFqa7+zgwPIeNZ34ILqjgV/y/Q9yvD6tLX0rCh9hWYeSyN6Kc/rZKLW5i3s9yxc3QiL7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(26005)(66476007)(66556008)(6666004)(86362001)(9686003)(6512007)(6486002)(478600001)(33716001)(2906002)(38100700002)(4744005)(6916009)(316002)(8936002)(85182001)(82960400001)(5660300002)(4326008)(66946007)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0oyamk4Z3docFhQUGlWM1dZaldHUG5BWVpVbWVIOGM4aVlnNWxUNXFzV1FC?=
 =?utf-8?B?REh2dFFDUXM1U0s5b0tyblkzU2lnVFNIRlJ3ZTZsS2R0WENwMFA2VUtpVXpy?=
 =?utf-8?B?dXhyUFoxbWtYMDBRUHUwb1EwU1pZcjVVclQyd2diUmRwZ1cyd3c1NmFzd3F2?=
 =?utf-8?B?ZDlBRHoyOVpzVENublRnOVpXZmg0Vkl2SVhsVHJLZlhwSGxPeEFEY3ZqeEo4?=
 =?utf-8?B?dTFmbFo0cEF0ejJQaWdHK1VjMXVlNlEvamlaTW5TaGx1TFErclZJeWNGbHBJ?=
 =?utf-8?B?QnVQSHBNODl2VklVVXJaTjNtK3pnWktPeGtSV2h2a2ZkME9JMzFjL2lEaGht?=
 =?utf-8?B?UjVZZ2NlZGVSejRrWUN3MGYzVklONWtsMWpBcHJLUUpaN3dINTBFSGN1dUlj?=
 =?utf-8?B?c2JXeHZjaEtRNVYyQmoxTVlYVlBPUUVnR1ZUS1NKUXNNbWRkQ1BaWG4rejVO?=
 =?utf-8?B?dzZab2F2dTE2UlBiNkpOYXVxd21FQ0MxTHQ5eWlYNk8xN1ZtOXducHhMbndK?=
 =?utf-8?B?dWpuQUdwZEYzZkUyZW9ZUXB3ZksrSTh5Wjk3R1d1cnp1bHE2M3BZeVhXdjZG?=
 =?utf-8?B?OTRHSXVqSUpuL3RnTmlnQUgwTXFUa3lqMGxCWHhIejdpeFNGcUNxbFRQSklM?=
 =?utf-8?B?QkxVY0JUSXJaTHd1RDZGNU5qeFNyTHdPQUUzUURrVUFMMXBXT2JucllqcTND?=
 =?utf-8?B?RDZZdXFBTlJBT3dOMVRkcU9lcFlCQS9RVWdlc3hIbHFCczFwM250M1hJVXJj?=
 =?utf-8?B?MzVmTDBxWTd5N0VNR3JicjNhU0dPSmFqa3JKcVlWM3BPeDZjOWkrUW04dFVQ?=
 =?utf-8?B?S0Vvb09PYkthclBtTUx4QVJYb1FKa0ZhTzk1Q2FzSG1EREl4Uk9MaWRGR251?=
 =?utf-8?B?RGpkTEM1YlQ5RmNnTWVWMkFPQ3NQVTM0bEVlNWlOS2hXTmJzVHZwbzJnbWRC?=
 =?utf-8?B?aklQUUUyR3Z4ZUFVT1drSEk5NEk5WjdqODZpMzhwRXBGQmlXNC9BWVF2M2JT?=
 =?utf-8?B?NTBleThxTzdVZkFIMElKNmR0dFpvNkRwT3B2d0RmdFN0Z2FBWnM3QnJEOFpQ?=
 =?utf-8?B?MmV6NVZRNmhrVVh0cXJ5VnpqajhHOFhxQ2x5ZEU3bVU3bkdEUnFqSklqdUZP?=
 =?utf-8?B?Q00yMEJPVExJb0V1bFBGTFFtWHpxL0NSWEljb1lxUVppRDFXSWgzcW1EcTFW?=
 =?utf-8?B?MXdzQkJyUHZQLytIcWdUb29mWEFzcSt1UHdYb1dqdWp3TWFKKzc4Q1NacU0v?=
 =?utf-8?B?dmZuZVM5K3hPUXpnbnVkVlR2QjNBV1NYQS9wZnZhdWRmWnF5VmhweDlwcVI4?=
 =?utf-8?B?SmJYREFhdjNxL2ErcXc3K056aFpKRUtKalRrTmkwbEdmekd4eGRGc1dCbVhZ?=
 =?utf-8?B?NlRraHBUSzlVbklDMWJEK3F6UlRhK3hTdFQ5RGtCakdHd25RYjhDMWFRNnMr?=
 =?utf-8?B?cTI5WjZpSlFRVm5QT0IyVHdqKy8vRlZCd3FRc3IreGM3dDBUNytmcnNWdTc0?=
 =?utf-8?B?OTlybE9lYng5ZW0yQnBkQ00va09IM01Zd0pnc0ZSVjVFTE1RRGRhOGNXNGRm?=
 =?utf-8?B?ZVJoazYvRW92T3ZHTGIvNHpuUTBtOXRvNXNIN2NTSFhKc1MxVmVtUDhDK0Ni?=
 =?utf-8?B?Z2I4RG9KMEtoMkdRbk1WM0hkZi9tazR1R1JlM1NmaGlVRStmS3RsSXVYQXRu?=
 =?utf-8?B?WFg4aytsN056S3V1U2VjUld4YTMrVVlUbGpVWjVGTytyaG9pbXVwSytoc2FE?=
 =?utf-8?B?amZTZGszT2VQNzlqeXdkSWo5RnVPOVpyelluYTkzUjh0ZHFNL05oMW92ZVR4?=
 =?utf-8?B?OGd4V0laTTRYYno2SmlDK2xqRmdMS0VLQkx2bUd1TEliRk1WNldyZkY5alE2?=
 =?utf-8?B?SjV3SHdLYmtnS1QzdzVLQ2RBTnhBeEpqeS8wc1ViWTlBN0tvNnl0VnRyakxN?=
 =?utf-8?B?ZlZYOU5CMDNCY3FwZU9tM0pmcmp6SndZTnpVeEdIdUdCWXZvL3IvUE1yMnFu?=
 =?utf-8?B?WFJJYnR4SWhMNnAyc0VtSFc5NjlXL0VKK0UvUjk3Vnc1M3BIZDJUNERwYmVF?=
 =?utf-8?B?ay8vMFFDbERzb2pCcUl0c3hNRy9ocndOTVRiSWVkeXZycTVKWmxwQUhlUjl3?=
 =?utf-8?B?L1FRNHBYdG55L29qMzdCQTQ3RnZRSllmUG1FOFRweFRzSjMyMm5MNFEzTlI5?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	quSkIYxr3e+A7zi6cwXcplDdVBcd/+aXW0TXL4QyvzK5JP8Ziq36Rn3yWDicXzkHzYJmVGUQ9bWC3q7rWci9HgEDoxAO6KSSZMzp05Rg3pCREhuNPpCFnXE0r4ruWQhnZmmJH4HJ3BsZVMvDxiv1OB7dmbkDsBOJOYVKrdZLq0zHV+kULXBp5T6mUgMLnxrjNLwKaPvBNQWLymnrKx9/0hcbvydA4LKLqEh9DwZgv6FaIrSrFOBZfh/bhRlWmfSHNtXkzbtIkbPoZzKjhIVvbKR4kiBhoSy50w3SHEvSdbMULjMw7j1+GpU6F8YvoancdhxXb8klsSlQ+KMSmWRx6i0fOWSW2XRAa8yy2NDkkWAfDhITuFKhdsZvJyp7gKOrc2R7nKTkeGDM0cN52nC9xuxmIn95b3mmRIkBwwXGr/ttABQ501h+bqleO904cF5LU2u70c8xcNjO8a8qNNbnNcWUF0IyOGhX/ANSluUrqlIXMiCeUud702G/XM9BF6rGCTdi3ZhRq2Y949QoSoXzes4W054makPWOm9pvwncNQfOo6cKD72dJxZgyfF+xM3V3lPRUJoLXTkFfyCdmHpkoYZTCmPaPUo4vjNAmm0GCOb7FxTVN1otUqIwP2dRNqdT57USet1mvlsUlEqiGL8YwWo8bw+TR1ZvXfQGSvjF0PgsXQ2qwfRVncBFZPq4NV2ficCRfP74beITbBZPmuqxCeWHxpOLc6eshJWoU4RlviRi7umM3EhI0DnJDrjbWMqBciwx6ug9sTQiCKevSOQmvELuTsp0HErLweTwwdAkAqZZi2gDbupSOpH+v7w13slp/y78sO2i4bqKchW3oXs0bYNpPl2Q6xo1UvRfWvfdBR99b0/hWbtuVssvFO9+8jTp4ERZaJay0uwCLH015+FSaw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4413ac73-dc61-4a11-e3d0-08dbbffd67da
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:32:09.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWEZQjbxUDKr8F2JOKatiTuTbrJg/6aO327WeTR8Kv8BTpxGJwqin3rcUPZvObqpAN+7wSyFn8yZ0WXKVDjVBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5635

On Wed, Sep 27, 2023 at 04:20:04PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> The feature is not commonly used, and we don't have hardware to test it,
> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> members. We could use QEMU to test it, but even that it is known not to
> work.

I think this last sentence is ambiguous.  QEMU ACPI CPU hotplug
implementation does work AFAIK, it's Xen implementation of ACPI
hotplug that explodes (or so I've been told).  I would drop or reword
the "but even that it is known not to work." part of the sentence.

> 
> Also take the opportunity to rename the feature to "ACPI CPU Hotplug"
> for clarity.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

