Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B85518255
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 12:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319412.539655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpia-0007Dh-5b; Tue, 03 May 2022 10:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319412.539655; Tue, 03 May 2022 10:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpia-0007B0-2L; Tue, 03 May 2022 10:25:20 +0000
Received: by outflank-mailman (input) for mailman id 319412;
 Tue, 03 May 2022 10:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlpiY-0007Au-Gs
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 10:25:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 527e869e-cacb-11ec-a406-831a346695d4;
 Tue, 03 May 2022 12:25:16 +0200 (CEST)
Received: from mail-bn1nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 06:25:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB4932.namprd03.prod.outlook.com (2603:10b6:408:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 10:25:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 10:25:10 +0000
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
X-Inumbo-ID: 527e869e-cacb-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651573516;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+pupD2a5y4pYFoFDh9jKRKip7/uuEXcjX5fTrjlfPsQ=;
  b=ZfNDTnd/HC4XOehWsGU7viIvjXGlm0S6wrvNRp6qsALJVFmLbqzYGzGz
   8O+zQFVklBbX5lWjLegKp2Jz8gXbPRNl6skNCc7uPc0GUsszWRSCYsSwJ
   L9b/ypbFid5ZpxhPAksHfsHCUwFlNSAkvpDVJB1ryZymyA0IqH6+pvJ6c
   s=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 70859850
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FpixEq2oqBXnH3J4fPbD5aRwkn2cJEfYwER7XKvMYLTBsI5bp2dSm
 zRNDGDXOP7ZYjTzf4xzaYm+9UsGvp/Qydc1SAFlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw2oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1oh8G/bwQnY5b3s98xDhh4NyUnHJRZreqvzXiX6aR/zmXgWl60mbBEKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82aBfmWjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SGvLmwI9Qr9SawfykHUkwNt9+bRO4DLeOTTefdtm2OYq
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0ZjZLO+gz6QXIwKyN5Q+cXjcAVmQZNIBgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZowL/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:bHy2Sa1B5m7N1xvFn3HH/wqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60Q5iApIs+MPP+UpgNdNvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70859850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsWVInaWfZ7PtBBYZZvTMWRvmZxkAallbtPQz5abw6jZdzktjutMWWK7A5abk0hbngO8oUSIZGiUQGOcbVet9i0zCIs14JwkVrszV2VRLUdvcav94v6vod+ZTVZZ2BeuNEWdssZO5GjRlSpIISef5ASiZ37I9dUYKFk+lB7YvFgKr2sEOomRFd4WV7Lh0V5+73Gmcl7qYAo1XvK4Bm0eIkAWW7K1MtogOYIG2fWYunLsuzIVH6798NfIHrtxwh8Bsa1xCT5If29soycVOunjwVSJR6pdmZuMh+s+n05K7UqIEt7zCyNvFGF5Se1o1/Ht7qquxiz/LccVE5ziv5Y+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T97w/gdwNAbA5j4mcu7BDnDUPb8/a0dHPURY2jYwcLo=;
 b=DOcVe0qkKNPndwP0pYFYU2w4lPLO2UVeRqHPVQzG0BIOFw6lSTbpT7ClnfWpKxNJhfUMb0QTOLxSZRPIjYanE/tCeKwPsFPlZQTDm3XMP9qMr5Yr/i48VWUXJdjcvIlblOe2FhmzRPSa5q+IHkU+ib3uimtV2WsItNd/GUW5WVoObc3hqrmuvYpTZ5m8dzzaoKUHFIlCv2l3DLjI/eQuxW6PRn+l5hlqsn7dvAox91dR5qVeXz2LMRHDzaurU1mfCBGPNVrJ/PYFfck1jSi31TP5RZvPqfhJuk1yYejtfIrkk5+f6JyNJ7M9xTLhr2yb2z7X8iZFniP6kkHM272gAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T97w/gdwNAbA5j4mcu7BDnDUPb8/a0dHPURY2jYwcLo=;
 b=FKUOr86TvUfZHn175qwaoAYpRBZMYs4k9tcPYTeDtDPFcPc6hrB4mLdQ9fFBnzaQR1q9zcCuwccp7OCD327VsX3qPi1AELrwb/pr5QClzvnUjlwOfvR7y+eYxDTWBSAbo7zlSWMpTXc5FoXHNczgM0avLISilmz3ke8WJ8lTb6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 12:25:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 02/21] IOMMU: simplify unmap-on-error in iommu_map()
Message-ID: <YnEDAG5HcQc8SOAt@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
X-ClientProxiedBy: MR1P264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54518ef7-9078-4e46-be36-08da2cef33ca
X-MS-TrafficTypeDiagnostic: BN8PR03MB4932:EE_
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB493216952B3F16E9D29B20A78FC09@BN8PR03MB4932.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3o+QzO9dR8C7SIq61V0eUULok+BxA5/azVvs6gz5YZubArcN70/czFMv5/3u1R0MdxeSnHDuLfgyfjWy0MUivTpqamDGj8BxX6X1jEnDd0mjONW4ZiGbq4lN2Di0YNN4I8pJEPqi/oZ61mtq6HFdwK6CDzfAf9ytNJBlI7zs5sKczXpXm4f/v9UbYa7b73lMs3zDKXBxnb4LPFMzj8ZkQPKAT32FZYT6cs1DshRztStjQiMjz8ZIxNgX6t5yKTFtrYsFakNlKbGnKpSbTMdgHOdGDnaWivFSqcHpRN6vj8lOHNi2zTCM5f+P3ge6se2x4tolD6qFcfh7joDEBJuS/QVC7r8X/rnZJtd7mYahHjyE2D4h9cw3GojdevsrKdIeCqXebD7v3aqz8jLTebUVKLQB3BaszpZ9YGLUCsO1Kqzw8r0tn3Ut9KU0EDdFmNWX75egSYd+kNQx5IHNM139GKK5BHBGpK+8Y6RkkTpsfSMJQ7k+FNmK1MK0f4rrjCl1m6mCOGhFfEpYlSn7YsxMYItBkIzUgxkEepBwdaKk3i8W5Q7xNYhxsF94oMPRVjBD8YDBQfVd/jt6uNYrs4DZW9HIA8YAuPIP3RmxmI2EhScs4/IrG14hd+Wr+6vDMkq5w3Lj8x3xWRPP3aS+oyh2FA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(6512007)(9686003)(6506007)(186003)(54906003)(86362001)(82960400001)(8936002)(4326008)(66556008)(66946007)(8676002)(66476007)(6486002)(6666004)(2906002)(316002)(508600001)(5660300002)(4744005)(38100700002)(85182001)(33716001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2dySmJXcDBjTTA4cDdmZXV5cU1yTE1Ub2NLNXEzN2lxaHZicDQvYjdxemdV?=
 =?utf-8?B?bzA5ajFyRitVTFRWdzJjNTNBOHcySVBjTmRDNjN5U1B1SmRHS1h2b2s5ZU1t?=
 =?utf-8?B?QnRuVlo4QXBPaGdjNUtTMzY1dDFaeGRYQWxLeE9rM2VSeUNnc0tlRll1ZEFz?=
 =?utf-8?B?U1FveXVHQmpPMUNONEx3bnh1dlRRZmpWTXk1cmplTCtxTWgrZHFSNU0xZUFm?=
 =?utf-8?B?dmJCejdkYUtHVm9NNzN5R0tEd3VESDJXckc3MGFWcURIanZ4VE5ZSHZSV3BQ?=
 =?utf-8?B?N1ZjYWRXc0VzSUo4SGhwZHljbUc5bmhMem0zY0twZEo2V0tFcWtoVWI0UWpX?=
 =?utf-8?B?V1VHQ3R1aWdJTFRENUgrRURwM1JaRldaLzMyZ1c1RlcxajRoSWRndFdqUUZQ?=
 =?utf-8?B?VkNJU2JJNWRRWis1bWhCUlMrcmJLVXZJOHFQYU55NktEemFsSjRPRHkwejNY?=
 =?utf-8?B?LzZKdDJNbzdGeEkrRFVGN2FpVk9rbFRUb3V5Ui90WG1wUURXdHZiWkh0aU5v?=
 =?utf-8?B?ZVNJbHU3RmFxM1BKLytFejdERGE1RHlUZ1NIMWVYQ2pJMlNCSTg1MWE0Qkt5?=
 =?utf-8?B?TnFzQzRhUWRWSENXNUxzRk0xZ2lHSVJST3hYTTZ0dHMydUZPcnRWOER0WllN?=
 =?utf-8?B?aEo3b0w2T0cxcUhXU0ZmL2w3MjJaOHNWZG9MWXM1bWpWYml5L1ZHS3pjSW1a?=
 =?utf-8?B?bEFqVkZHTXhzbmtOQm5pbUVVMlM4a3dNUHQzQkp1OWlzTjFJRlV3dzE3aVBp?=
 =?utf-8?B?MFlQcDVpQVEwMmRTcjVmT2I0cG1pbzJsSUV5ZnNBM1Y0d2xKTklOT1AwTWN0?=
 =?utf-8?B?NTlUQmtxK1hTd0hjZlg1SGRGNXpnSzhMK1VZTTJ2aG55cDFaRmRSK3JnWG1L?=
 =?utf-8?B?OXY3YnhtMVBaeWcyd0lLRVQ3UnFqK2FXNVlNRUltV25JNWdDV0lHeVJmWUtv?=
 =?utf-8?B?a0R1R3RkbDNPbVRNS1psN09WbTdzSXNqSFplLzJzYjFwc0srN1daQTkrbFg5?=
 =?utf-8?B?R1hZbEZLZHBrZWdKUnBVR2NERWovRnVpN2lxVDFRLzlxM1ZsckV1WWRRRnU4?=
 =?utf-8?B?MVdhTFNzM0RtY0NidVk0YlF1M051Y0NzRlYrditkQitTelFIaGR3OEFiUFhF?=
 =?utf-8?B?dzhEQnRBL0VJZWIyVmxRM284amt2eGpSd0cvQmlzYW83MVBFazM1QWtvbjA2?=
 =?utf-8?B?UVVIdllFQU1xcnVDdzJPeXhCN253aFBIZTNvRUVGR1NrY2hxMEd3VkpMWXR5?=
 =?utf-8?B?aWR2NmhjL1UxU21jSFhmaDBqRkhJYndRNTJhb2k5aVFxYjZXMEtKUm1ZRm9T?=
 =?utf-8?B?V0wzTXZoalU5clBGTW1LVTduTXFwR0kvNDNGOFh6ZVFUV09WYWR3NlNEaDhr?=
 =?utf-8?B?VzFMN09aSWhqVFpXZzVhZHM2VUFDVWdXWUVteVZNcFhTb1FDNlZPYzVzUHM0?=
 =?utf-8?B?SUpPaFNHN1hoYXVKRWpUeTNGaXdPUEVaN2RWR1U0c1NBRTNwQnZtSkE4Y0R2?=
 =?utf-8?B?aVlCbkhhY2xhSzlLRVhXWE5acEpxMmpjTFlpWEFQSE5MdWNTZmppWk5PcWtV?=
 =?utf-8?B?cm4yaFFLeUdsOHNLQ2l2eFpkZ2dLMVgxR2lIeDZ1U0I3WVhXbDlSQ2hGMzBP?=
 =?utf-8?B?NUpjeVNNSzVPczZxTEovb0J4VUFGKzlwSnFNcU9SOFVXWlF0aDYxc2loR0p4?=
 =?utf-8?B?Q28wZVRCaDJuMDY1ZmsvejVIaWx6bWN5Mkh4eGVDV1NaTy85VVVwNW4xY1Yv?=
 =?utf-8?B?cEEzTjdTa08yeU1BTkNXN3kvK3lNY0RteStKeUxTNndsWlVVb29yWGJNWEph?=
 =?utf-8?B?NGRWTkU4Ynkva2lYUHQ5SkR4a0p4RVVvQVJ6N21HZWxKeCtpcmVIdVJHWlFC?=
 =?utf-8?B?SlV3SEowOTdPMG5ETGY0YVd4d3Mrck1Ob3BIK3F0bWI3M3BLaVFWMFlZVVhD?=
 =?utf-8?B?NGhkaTdaemtKUUVsWVk0WWl6ejhmN1d0L08xbUxOOFpMVndwK3E2N1VhajA4?=
 =?utf-8?B?bTYrWWlSWE00MlVvTU9wWVBxZmJHZThubERiWVE0SDdPMFJtaTZUb1d6eE1C?=
 =?utf-8?B?QkVUNEZMaklDeUpvcCtzU2hBN3RlWkk1K201THhQU3ZWc2k1UWViclZ6eWE3?=
 =?utf-8?B?RHBvTjhUclhPQXBvTU1RcjJtYmdBY2VvZlR5TzZQNTgzSGd5YTloRWhlY1Bq?=
 =?utf-8?B?ekg0Zld6M1FZZEtwSDVRZkI3ekJ4bFZPRER2bTgyVHVDamxUQ283eDZhRmN6?=
 =?utf-8?B?aFZsa3d0aHdLdnBxZ3NPQnBWTmJwTldBM2Y2Um52cEdmbERBalhrR3RRMFlB?=
 =?utf-8?B?L1F5SEk5V0VIU3ZncFNOcGtoWFJ3TjRWdWh4bEs0RTIyWmt2STJzVUNjL1k4?=
 =?utf-8?Q?xyYRpI55jb2IpKQc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54518ef7-9078-4e46-be36-08da2cef33ca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 10:25:10.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6iWxpyV8BxD3PLZkyVwgs9Cguty0n+As2VoKPsU3crN8iHXw1Dl/Xh8mzUQirru26Zwhrhd75OlBVjuSHEaEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4932

On Mon, Apr 25, 2022 at 10:32:10AM +0200, Jan Beulich wrote:
> As of 68a8aa5d7264 ("iommu: make map and unmap take a page count,
> similar to flush") there's no need anymore to have a loop here.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder whether we should have a macro to ignore returns from
__must_check attributed functions.  Ie:

#define IGNORE_RETURN(exp) while ( exp ) break;

As to avoid confusion (and having to reason) whether the usage of
while is correct.  I always find it confusing to assert such loop
expressions are correct.

Thanks, Roger.

