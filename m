Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E5521859
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 15:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325615.548263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPwk-0006w7-Eo; Tue, 10 May 2022 13:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325615.548263; Tue, 10 May 2022 13:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noPwk-0006tR-Bj; Tue, 10 May 2022 13:30:38 +0000
Received: by outflank-mailman (input) for mailman id 325615;
 Tue, 10 May 2022 13:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=To9D=VS=citrix.com=prvs=122921be6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1noPwj-0006tL-1I
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 13:30:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e86351d-d065-11ec-a406-831a346695d4;
 Tue, 10 May 2022 15:30:35 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 09:30:31 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6437.namprd03.prod.outlook.com (2603:10b6:a03:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 13:30:28 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 13:30:28 +0000
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
X-Inumbo-ID: 5e86351d-d065-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652189435;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dr21bRf3x3WPOJUV3Hv7yosF59950Oq3PX0P99tY4gA=;
  b=GM5z5WgxgibhJE6bmnWA3RVGbFMa5UgEjSBzpoxdCXyDykhqZAljkVTm
   ad+4zzGQd+TF8cuDM8e8u+VLdbBTC1sYtpIvpB2LucH1+Jj21lrL1QcYc
   xjU2XpEOG9I2lrQYDpvx6T+x+pBvD1Yf/bA4QsCaYxhyJdu5f84hrD5b3
   Y=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 70969237
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vroLtqmFDZVszNyeyM2lbYfo5gz3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXD2GOaa3famH1edxzO4uxpkgB7ZHTztFrG1E/qnsxESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWlvV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYaVgmZqiUkfsnY0cDS3wvIpZrv7udGC3q2SCT5xWun3rE5dxLVRlzF6tHv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvZkBhGdYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8APL9PBsvAA/yiRh1pjgH+vLS+eXWMZfvVyVj
 Hvj+0/2V0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUHBBqlz6PV50OTADcCRzsYMNg+7pZuFXoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1bUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:05hAmqPG3HcT2MBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70969237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWSlrshCqepRHPAGDj4sS5/foBjZDSKk6NQHSv/WjYr2Km9hC8/L5+IPJbvEAZEkveM4wpagtEkdcDcNzLNtYAVXIFoN10gXGYL2d43QB7aisHFkz9TAEWqFBymfu6xl62q4NSJGEjVMi0jTzmk3NdnCEao4Wtgw3HMNvxDygKzQp2h5n69RjG9+CdiBwnATdgJy+iIQ76CBUkm8IabkKT0fsjryLeswJnu+HJ51ONF8bCWif7TsGpt/5oqN1W9klLqeNcgoP6i/gsFRfoIQ2vORY4GJwz6aDmvzjdRrZcmsCHZ0XEH1KOO/bvfu4Oxk3yrQoHS+l7G8E2wcv0N/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7l0EaIzwaBZrDZkYVGaiDs6kTZCqmXmKBNv7zBHnkYY=;
 b=Qr6R61AbHzTPJefd4byWr2CARyv6xEzCxdwD6BgpH8OQspIrWrQ4AKMJC9HrHfcoNC6+NCXmkdQ2gn7jzHx+1uU+5WJbMU83U+dDmVmiA74X4E+kWZR1lfMu7kAGoB0D3ZqVL/9sedrE2djy5n7xnepl7pqAeLt+93kYgHmqBTtHv8s2SN8jF9cKB0xj0wAaGFi6JpkcOLfZymPPwEB3pIqeICHPGr5siU1CmOtXEPYqAoHna84HK+TbgqEkKXnkFjshbvHb6hZiMBbcMCjXrkz9TfuzcieMMVgEgCIQSHSufG3UhykmH31QoTBsacF1upArkrhmRIiA83qvJbnOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l0EaIzwaBZrDZkYVGaiDs6kTZCqmXmKBNv7zBHnkYY=;
 b=bRA3a/PuRBWOlBVvIPBIKU2lSRqlpSzjqujt0Y0k6qgkqMoYcIypvq8UJsw7XEnWKJnK9Nco27+Ex4NoHkKrTtGgyA7lZBGWxOIkzoqHqC/5S0EQ0YVgeUXifQj2cyIlLrxZotK/V0uHcsUd/D+Sv620UmuUX5NMcbGoUv5yVoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 May 2022 15:30:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 15/21] AMD/IOMMU: free all-empty page tables
Message-ID: <Ynpo7xsOS61fZd/U@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <16f5b398-56f6-a70c-9ce0-0ad72eab5058@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16f5b398-56f6-a70c-9ce0-0ad72eab5058@suse.com>
X-ClientProxiedBy: LO2P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79b83e5-21c3-44f2-b674-08da32893f68
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6437:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB6437AD3A506DB80093CEC1ED8FC99@SJ0PR03MB6437.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mADddAtWYWWr+AAwE9IG5nbsM85lyvY5Q5MfXbpK1/L40enNXP41lVJ9Ux3pLIZOhALmkHqHrA8X4ZlHofh2v0uJo3x5NlpkfUFITG179YEo7mKKseVasXIkKugXT+QfvVPZBUidsW6h2uEUQYZTUBpo1zNUa5bN8x28Y88bbt9eZVhqlL+NAe8+I3PEXiG5ofX0hH/Kk+wOe/PV90IVVaNZx9AKClfQ079D03i7+H5T+zZl7Y66AuX5mYD2C317DJcxomb7ytZa3lr6r6si+iHdaVhGJ45ovgGTlYfJrfzO6sFUgP8B4TSuYXQl04CFOGx1ypSBSeQA1airlTZ5nXXSr6GE/LpnZV30fy+mgI8vOfvjuKloErphiz415TMbX/2AiNxTLFAhXt9sI0RqXUqB5AO6IDyf05JSmqWs/dSUKHsOGX6BY5uWtbHMqELfsQ9bIruHU62E5fJa34lYNviGdKdSsbRMbcgUYFX0yQmSAtmkf71UPjbU3W0kEyP+SZRldGfy1x99raZ7tnkzyiaRnJOJBLApXcwjOYwH4aiw7OvP3dLnljmfQgVvGNFOMhpVIqAw6051EF8el1IhiagzARYyJkC8ua2ppdKbfEUi+luqyV+qUqh3MZsT8ADqJzNn5Zhs/Fuf5QNj8FwGag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(38100700002)(8936002)(9686003)(86362001)(6486002)(82960400001)(316002)(6506007)(508600001)(54906003)(66476007)(66556008)(6916009)(66946007)(8676002)(4326008)(6666004)(83380400001)(186003)(85182001)(33716001)(26005)(2906002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3JDMmtHakQ5U05aeG9nT1cvZjJ3ZmJKcFBteG9kbCtnakw4MlNIN0lQRlVs?=
 =?utf-8?B?aGcxaXZyVWhNSnE0NjVoTGtlempzZElYNUdiano0d1QvMDMzSlZOMWRMcTl2?=
 =?utf-8?B?bEd2dit2QVRKZkRTNVQ1aDBGeXpjQjVPUkxqWGdsTTg2cjE2YTk0ZUQ1YVFj?=
 =?utf-8?B?M0NQbFo4dWY5alFoMXlkZFJzQ0tzVk9DRTlJU1ZxNzdmQlEwQXR2eHAvVUcv?=
 =?utf-8?B?aWJmUTl4YWVyZUZ5WktiZFNoMUxnTEZjK3hsQ0V0MnA3S2pVNTNNT0dKL05j?=
 =?utf-8?B?N1hEWnRjdlB2MmpnSVIzTUFYSENsMVJrWVNpRzRNNkZjaFF1bk9mcnlhMWRM?=
 =?utf-8?B?clBoUEsvQVVWUGkwUU9UUGxKR09td3l0b3pHY0VmN05La2cxV1pDMlFueThP?=
 =?utf-8?B?dGpUT0JUYTFzZ1hGVlQ5YVhmam4zOGc4Z1VCQzdsd0lwMWRkM2dRT2hib0ox?=
 =?utf-8?B?dmNHR2ZYWGxzbmZhMURtWE5vV1lQeTFrTVZXZ1FEdWwxUXlWZHgyS2k3d1Bk?=
 =?utf-8?B?WERRZU5IeW9iVDI5VEJyY0t1eUR3cFMrSUE4WWR1SjJKSStnVW5hMy9NWXRj?=
 =?utf-8?B?MWhGQmJSMUp0Tk4wbFNMdmE4elcwcGY5ZWRxa2NMWmtqUU1EOEpRVnMvUnc0?=
 =?utf-8?B?bzZHMU95aGtCMzhZVnd6US9jd0hmUzJVMVltUFByMnlRUVN2Ry9DR3FxMi85?=
 =?utf-8?B?UDFNMFNqODlMZDVyU1VRSjU3VzlQT09NTk9ab2lORU9iWlEwQ0p0dmVSVVNO?=
 =?utf-8?B?QnorNUVWNjdtS1ppekgzTWZlY3FNUG1na3FreGtCUEVKSnczVE1jUVVDNDEy?=
 =?utf-8?B?bDlKRVZsQ1BObStKMmJHQjh0eWo1VFd1V2hCNi9BZW9VcHdPbEJmTW0vL3Zq?=
 =?utf-8?B?NXROTU9jZTFNdXlaM0U4R2FXR09mYlpiMEZOOE9OaVZGOFd2eHdnYlViYUlW?=
 =?utf-8?B?L05haUxOT2ZBNGlKQUhtTUxFTnpXWHBQd083WENLemtVUVErRUtLR0N0VGVR?=
 =?utf-8?B?MFdUdHJkUGVTYWczWmFPc2c1N3dHSTJXUU1WZUdMSUY3dXJUeHBqR2lwNW1G?=
 =?utf-8?B?bEQya0xzcXZnbDZkYTE1RC9xaEFNemNFQ0hKQTlORXpBR29mWWdWeWdNVVBz?=
 =?utf-8?B?eWExcHE2Ui9Lc3pOT3hnTGlNWUhpanNFLzAzQXI4MXpmSnY2WHlWUENMYnRm?=
 =?utf-8?B?ajBWZUlZdU12QUtlVFNyZ3FWcWtXeW1Ja0taUzduNUlack0xeHJ6dzlrZ202?=
 =?utf-8?B?cGR6MkcwM2RhK1ByZzFQWFBYTGllSjVZTXJscXNYbHpoWXN3Rm5JUis3SGhs?=
 =?utf-8?B?VTYrbTlpNzBGRUZFUjFsaGsvdUdZeFlheFdSNi8vcytlOTFib2hkNlk0U1Z1?=
 =?utf-8?B?QzNGcVFrRjR0cE5GcFhJREJuWG1RVXV4ekpOdnIxWG03dzFHRTY0ZDZ1Qlk1?=
 =?utf-8?B?bURVMVdwVVJ0NXk1bnd4YWpFQ0oyazVSZmdPMkFGZG5KRVJkVkdDdm9aT1Zt?=
 =?utf-8?B?dTJmWng5dHdqMkIrY29xU0V6QzgxYk1iT29iVjdkemhQWWVoTmF3ejh0MGpw?=
 =?utf-8?B?RGFIOURnbFhDQlptUndBWk90TE9BRUhiWVM2dytWaUdIV3hBT1NCSHZQVFl4?=
 =?utf-8?B?bmZGQ3V6QTNLS2lCTzRZa3oreEYvTGNZQk00d3ZNZW5aRVNHSUhSRU8wLzBl?=
 =?utf-8?B?cWprSi9WTTNUVUY5MFhKY3JUaXFoMFErSG9vYURNSVdrdXhLZHJOQTdjWE85?=
 =?utf-8?B?RHgxU25GU0hqS0V2a25iSTdQWjdNREdBdTJlRzhmREFtRVdoYVY5ZnBMSWEy?=
 =?utf-8?B?bDlVbWw4Q0JrUExXSGdUVGkzTGtoRFFORG5rSWNMOW14RlFmaWV3UnZkZFZQ?=
 =?utf-8?B?MWt5b3lrbGYra2EzNVl3U2tyNTFIMWZLRkpVQ0g3VW5zclB1QlVBbFJtelFq?=
 =?utf-8?B?TmtZMEt1RGVzR2RmK2NkK1Q1ZWQvbUw2cFc4RGlXWVBhbVRPdlBvWXpEMWRN?=
 =?utf-8?B?N1ZGSVY5TnkxQVoyV2NiOS9iK0RuQ2pyVHVjU0FjQ0NucStEbFc1MkVDM0Vz?=
 =?utf-8?B?VVdzTXUwQ2ljYTU5TGJZblBVejNHaDdXNWJNV1BIdU9ad3NnNHN3Vmlpc0tI?=
 =?utf-8?B?UUlvTnhjaE80NVJLd0o0ZkJJWENscnV3eVAzSWNkUmhQSlpBTUx1QnFBZjBW?=
 =?utf-8?B?MWRMQncrU0NrVHBWVnFaUE5zaEZ3Y2JUdW1tRGJYR0FHaWU3ckRSMENxYmsz?=
 =?utf-8?B?WG9jQXlMTUVWVXQxVXNCcGx2dlI0RU93eU9oUU43cVdCbzNQRVBOWkFLeFUz?=
 =?utf-8?B?NU1Qb0c0d0V2bzdOZFpFbnVqYml2VHo1MExvQk9GZWE4SVdsM2xnUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79b83e5-21c3-44f2-b674-08da32893f68
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 13:30:28.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNXEk9F6OBKdr9BPi7VBncBnZQEXuOxNoF9bDo9Yga0eS/swflxCUnYtoA6JeQMpDg4ZbgYj0nTaVoHs6CF5rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6437

On Mon, Apr 25, 2022 at 10:42:19AM +0200, Jan Beulich wrote:
> When a page table ends up with no present entries left, it can be
> replaced by a non-present entry at the next higher level. The page table
> itself can then be scheduled for freeing.
> 
> Note that while its output isn't used there yet,
> pt_update_contig_markers() right away needs to be called in all places
> where entries get updated, not just the one where entries get cleared.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Some comments below.

> ---
> v4: Re-base over changes earlier in the series.
> v3: Re-base over changes earlier in the series.
> v2: New.
> 
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -21,6 +21,9 @@
>  
>  #include "iommu.h"
>  
> +#define CONTIG_MASK IOMMU_PTE_CONTIG_MASK
> +#include <asm/pt-contig-markers.h>
> +
>  /* Given pfn and page table level, return pde index */
>  static unsigned int pfn_to_pde_idx(unsigned long pfn, unsigned int level)
>  {
> @@ -33,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
>  
>  static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
>                                                     unsigned long dfn,
> -                                                   unsigned int level)
> +                                                   unsigned int level,
> +                                                   bool *free)
>  {
>      union amd_iommu_pte *table, *pte, old;
> +    unsigned int idx = pfn_to_pde_idx(dfn, level);
>  
>      table = map_domain_page(_mfn(l1_mfn));
> -    pte = &table[pfn_to_pde_idx(dfn, level)];
> +    pte = &table[idx];
>      old = *pte;
>  
>      write_atomic(&pte->raw, 0);
>  
> +    *free = pt_update_contig_markers(&table->raw, idx, level, PTE_kind_null);
> +
>      unmap_domain_page(table);
>  
>      return old;
> @@ -85,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
>      if ( !old.pr || old.next_level ||
>           old.mfn != next_mfn ||
>           old.iw != iw || old.ir != ir )
> +    {
>          set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> +        pt_update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level),
> +                                 level, PTE_kind_leaf);

It would be better to call pt_update_contig_markers inside of
set_iommu_pde_present, but that would imply changing the parameters
passed to the function.  It's cumbersome (and error prone) to have to
pair calls to set_iommu_pde_present() with pt_update_contig_markers().

> +    }
>      else
>          old.pr = false; /* signal "no change" to the caller */
>  
> @@ -322,6 +333,9 @@ static int iommu_pde_from_dfn(struct dom
>              smp_wmb();
>              set_iommu_pde_present(pde, next_table_mfn, next_level, true,
>                                    true);
> +            pt_update_contig_markers(&next_table_vaddr->raw,
> +                                     pfn_to_pde_idx(dfn, level),
> +                                     level, PTE_kind_table);
>  
>              *flush_flags |= IOMMU_FLUSHF_modified;
>          }
> @@ -347,6 +361,9 @@ static int iommu_pde_from_dfn(struct dom
>                  next_table_mfn = mfn_x(page_to_mfn(table));
>                  set_iommu_pde_present(pde, next_table_mfn, next_level, true,
>                                        true);
> +                pt_update_contig_markers(&next_table_vaddr->raw,
> +                                         pfn_to_pde_idx(dfn, level),
> +                                         level, PTE_kind_table);
>              }
>              else /* should never reach here */
>              {
> @@ -474,8 +491,24 @@ int cf_check amd_iommu_unmap_page(
>  
>      if ( pt_mfn )
>      {
> +        bool free;
> +
>          /* Mark PTE as 'page not present'. */
> -        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
> +        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);
> +
> +        while ( unlikely(free) && ++level < hd->arch.amd.paging_mode )
> +        {
> +            struct page_info *pg = mfn_to_page(_mfn(pt_mfn));
> +
> +            if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn,
> +                                    flush_flags, false) )
> +                BUG();
> +            BUG_ON(!pt_mfn);
> +
> +            clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level, &free);

Not sure it's worth initializing free to false (at definition and
before each call to clear_iommu_pte_present), just in case we manage
to return early from clear_iommu_pte_present without having updated
'free'.

Thanks, Roger.

