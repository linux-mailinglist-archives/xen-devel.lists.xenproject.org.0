Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11550F526
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313549.531138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGt5-0002NC-JH; Tue, 26 Apr 2022 08:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313549.531138; Tue, 26 Apr 2022 08:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGt5-0002KT-GB; Tue, 26 Apr 2022 08:49:35 +0000
Received: by outflank-mailman (input) for mailman id 313549;
 Tue, 26 Apr 2022 08:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU5=VE=citrix.com=prvs=10866150f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njGt4-0002KN-7G
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:49:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c925ead4-c53d-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 10:49:31 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 04:49:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB4771.namprd03.prod.outlook.com (2603:10b6:408:99::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 08:49:22 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:49:21 +0000
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
X-Inumbo-ID: c925ead4-c53d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650962971;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qLeY1JKC+QeH8TRDdEaxaq3kp7kqYz4CnmpDSRATwjE=;
  b=IpxKqpCCcPBDPj0ATO1mYQrK3xddnZ3unsObhcTTjNyHM2013PLkNQXL
   qFcw/HO+Qq7TTVwZhV+hHLYMdygnqeuhQX+GIbdxe1V6XlCXrcdaqsf2A
   2djev62wCyVKqynfw2wGLsTQASKm8k7LfbGZXf+3mK6XDR8BB7SwTdbDK
   Q=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 69807588
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O0fF3K0KJz0wuhJycfbD5W1wkn2cJEfYwER7XKvMYLTBsI5bp2NTm
 DcfWzuFbK6LYjbwc9Fxbozj8UtT78fWx4dqHgZtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1otr+gYhk2IJeRu8IiS0RbSS91Y/BZreqvzXiX6aR/zmXgWl61m7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82eBfyStbe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrieuI2UH9QLFzUYxy0iP4CZowZTACsHYQvaEeu9fuBeRm
 0uTqgwVBTlfbrRz0wGt7nupj/TngSD/VYQdBbC8sPVthTW72mUWAQZQUVa9rui0jma/Xc5SL
 wof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceRzMw0
 USSt8j0HjEpu7qQIVqf/LqJqTK5OQAOMHQPIyQDSGMt4cTnoYw1pgLCSJBkCqHdpsbuBTj6z
 jSOrS4/r7Yel8gG0+O851+vqzutvZHISgcd7ATLUm+r4wV1aZTjbIutgXDD9fdaJ4+dR1Ocl
 HIFh8ST4u0IAZyX0ieKRY0lHqyvofCMMzTegFtmN5gn6zmpvXWkeOh44zxgJUEvLscNfxfoZ
 lPevUVa45o7AZexRap+Yob0Dttwy6HlTIzhTqqNNooIZYVtfgia+i0ofVSXw23mjEkrl+c4J
 IufdsGvS30dDMyL0QaLegvU6pdzrghW+I8ZbcqTI8iPuVZGWEOodA==
IronPort-HdrOrdr: A9a23:u36iwK64LE9JJHqMcgPXwUGBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37wZJPh8sH7eGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heYAotd/lq
 D5259T5cBzp/8tHNxA7dg6MLuK40z2MGTx2TGpUB3a/J9uAQO+l7fHpJMI2cqNRLskiLMPpb
 WpaiIsiYd1QTOiNfGz
X-IronPort-AV: E=Sophos;i="5.90,290,1643691600"; 
   d="scan'208";a="69807588"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J25SFzOfSjaojSf4K+mB+H2Snbdp+BNoGAH8IFWyB0XclLdovbvMJVLegwO4GynG5+GQhsyqhXhTAdNVGZ4vic6iRkjP8sLXx9e5U11TU80yUBIIj1BO7KZ3UlW71JF7tpcvjajy8JojMptA5603HdgVIsf3hQGYLpW5PmQflWZ/+V3tjyaxxegxm0ozJzuwX5o7Wq7j/kGyAr+ePLwTYqtZFtaFs2K4/Z6U7K/zYTkh14UB34HLw2mB1AhwaInDD/MczzA+KzscaE7x6KUWVLQt0ONLTfb8pFu6Gt6ygBVJoUyXASGZT3dsXanYvYOQvDg9r41zITvtxoQ5nrIkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Zdbtn7eCo7nRYWxtLMmkGw8kPz1psaB2Mmh5sT3iU=;
 b=VdTk7+lrkCbbhqO/jYYjPTMljYC/ZDZD0BhzayGz2bDjKRxcsd5sehoW5zfpf+r9uRFTaIiF/eYh0XYLAZ/1SmCSaCImaSVlFN10TKIs/tDmBy1aXsnd1rt6uDktQFt7yxd5rUjyMUk5M3eKKJEh/qDE4YuOP30wjeI4we9t56qPNVwx+3Ca54IWxPhK4YfMXGt+DSaaaBpBGC3y/oJQ2JhrdemkXtVoq9mnmCRY6SDjDU/UdPor3ncXyyCeU5pR354U3qjlq3xn4Jw+5/k74IUxjxZAdqOqt2pfY+uOg3gcc+rjMBpwhWzo1Ixx/FCfA7rTeJ769bEe3W5if9YEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Zdbtn7eCo7nRYWxtLMmkGw8kPz1psaB2Mmh5sT3iU=;
 b=nw6mMQiaZhi5HmWKi7QV2WzGtzLic6H+LtJIJFgo907ARPy9EfxwejvN7BRgmr1sgsw95GOcZ1dfAWCmUODKFgs1zREaAcbj2yp2E320yYCDmg5SaAVSUkUCTEljUix0Xw5XGLYGlyJFwNfpZ5wject+h/9oo/ElRGnZHdl6HHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Apr 2022 10:49:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 2/2] x86/monitor: Add new monitor event to catch all
 vmexits
Message-ID: <YmeyDRYcwfgg7mwC@Air-de-Roger>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
 <YmazAdHL4LWOdDDv@Air-de-Roger>
 <CABfawh=Z1_88p14ivkqrBAUKbfw39f-frXN9uNsdVt9BDp+4bA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawh=Z1_88p14ivkqrBAUKbfw39f-frXN9uNsdVt9BDp+4bA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0142.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb539d3-3eb5-4a29-6c45-08da2761a861
X-MS-TrafficTypeDiagnostic: BN8PR03MB4771:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB477135FB073ADD3541EF155B8FFB9@BN8PR03MB4771.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PYEXZWlep5DlCYNHPX/hOVwkF7qyyPuihEW+H8KqXj83ZvAWeP9zewT3CMdrMS9M4+C4OkaQfSQ5WI4pl8JYfDHGIGE6DpxlpOxtWLBK7SzTdcGO90aL4QkqGmEER2d6nL9ssdcAhutRieEgeclMqSiLFoBl2jDM6bLxCr4hhpAsRsyCGwfFUV4aJvB3A3qaEWQ0yJ6/lbWt2fRc4Q5a5a+qRRfbf4rQa4El8cATQf1LOC6dkKbev/acBwVbXT9vF/u/ROK6rhCfrap34D061zCD0LM0DQQWzSZ7coP4MhAzfpWQtVo9ZFZg9IDPreT+y9FzI8pUXGRU/Ihu4qfiNZMgxEuFkg+QK1MGXq+nbh9aFrn+ApM9k7lN2tqjkBq0YUaj46gzRTS1dlH8FxxzFpnEp4GcNqk2wrAJ7fzfrgUi1qfRJuLpBu92/F6stWA8netpk9vkYU5enXasLSs35CKccww02MGqMh416XqT5zWN/o9eRI7n9Fb7x4lcbX64Plpucx9tp4z9kZB32MpaZBVZo55t/3MoL82bRKiuLjCiisIybkRRp7st/HWQ1wyyBDe3UPLPcjqJZYdZngRW+ehzdGcIk57bZgOgl/QUg6f1SBCl8PMe+100LGciEuzMlkB/+Z5x92sOVHQxaWUKTYW1bAXyD+oZgTiiGN7jwAnQ+ECiOp5EYxJD9DoLS7zA/9ZzzVMQQr3dmokeWiykEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(2906002)(53546011)(6506007)(33716001)(8936002)(186003)(30864003)(85182001)(9686003)(26005)(6512007)(7416002)(83380400001)(6666004)(4326008)(508600001)(316002)(6486002)(54906003)(6916009)(38100700002)(66946007)(8676002)(66556008)(66476007)(86362001)(82960400001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmk2Qmhmc0NVTGRnWmRkbjV2RnZnZ1lVcHlFQzVXa0diUzZEcWYwd0tucHJR?=
 =?utf-8?B?clkxVWNRZGw1amZ2TE52Q3UxSy9pNHFPN0x0ZkVuUkx3RDQzU3kwNncwbWpX?=
 =?utf-8?B?RlFTTnRxQ3JPSi9jRUhTU2RtSlZCVHM5eVlnSnRmV2xPc3pRUUZHSUJkRzg3?=
 =?utf-8?B?SzhyS2k5RWg2QlRSNE4xTVAvT3hhUEI3bHVIMGgwbnMyei92M2VHclV0WVFV?=
 =?utf-8?B?LzBIY0NlU05xcDRMZERLSUltU1dZYllKQUpvTVlLTDVqbjQzYVZxWE1jZCs3?=
 =?utf-8?B?NStYMWNxVFdrcUtWWktkMzJQUC9ncUZCT0krQ1JSdTUzRE92YWhXRTNFdUpq?=
 =?utf-8?B?dXIrdWxwamNaQ2RPZnlXb0pSTkY3L1FWTXo5ZStJWm55VS95Z2xBQVdHK0FM?=
 =?utf-8?B?dTd1WTBybUpMUEJTSEFrWm8yUWFOKzB1LzNkcTlMaVFaZ1htalJSUkU4RFFH?=
 =?utf-8?B?YURMSmNoUHIrNkFHaUplN2J6TGJka2RxWTJmMElmK3VVS1Ribktwc0RmNnBl?=
 =?utf-8?B?S2pwUjJzaUZyL2R0NnBrSzlncytaZFlwRUp5T1VVaXpDeHNYSkdyNWhxT01W?=
 =?utf-8?B?VDg0TTJrdWxrb1NYcHdwZ1ZLQ2lES3ZrSDRPRmZGRTVzdVBLK3dSeWx4VzFs?=
 =?utf-8?B?S0VZS3FGcEozVFJaMXJKVWVkelVUN0l6Q3JTc0doTDdtMHBaZkpnRTRrc2pw?=
 =?utf-8?B?endPVjcwVFdUSW93MHcxeHJmbHNlNDRKNXhSV2xMUzB5WDBSdXI4ZHlUTDlZ?=
 =?utf-8?B?QmtpNXUyVnA5UVRjbERRQUpyVFZRQmlIWStBWTZYUXljMnVaOE5lSEE4WXla?=
 =?utf-8?B?VzV6aUVvdzlvUlg2SlN6UUJMMnI1OS9keEQrTEFQK2UrQ3dXd1dBQkt3ckF5?=
 =?utf-8?B?OTNNVnpWbXRhZEt3R0JJRmtJdkJWVjUxbjVDZi9NODg1cU1aWVF3M1JBYSs2?=
 =?utf-8?B?UlRhTE9RMWRQWnhpeVVxN2pwQ1BnWWdsUU9vVVlaNnFUaWlGWHhOc0MvckpU?=
 =?utf-8?B?Z1ZaM2FTUFFLZW54enlBMWpvUWVlWlpwdm1kZitjdnh2b1FNaE5iaEVWOUl6?=
 =?utf-8?B?TytJN0JTZUJ0Q28xQVpvcy90WHpaMnJ3UVZOdnNoZWkybjJPTm9RN0FyMG9B?=
 =?utf-8?B?aUdkYWI4T2dtMjY0ZU5CcTMvVnprcTVlMFlaeVpkM0p0bDFLa0lLQXA4aDVw?=
 =?utf-8?B?MzAzTGtWYXVBUGtQbE1GdmhlMS9NdmlnTmZjNDk2MlhHRThUYjJJcW1aOVFy?=
 =?utf-8?B?Tyt4UWJGS2VTU2Q3c3pEaTRmNzR1SGMweWFKRGR1Ui9RNXFKL0U1UWw3WVhJ?=
 =?utf-8?B?TkNCUUQ5ZVB6Umhud1duU2V6ckRpMm01c1E2MWpHMy9TZmMwNHErNFNzUjdI?=
 =?utf-8?B?WHVWYytINnhVTDBCTVNxTHQzZ3Q0MllMUzhwbVdZVzg1YjhXNlBuN2hWV204?=
 =?utf-8?B?Z2pObTFjMmxHUHNoTjIzaWFFN2ZZa054WkdqbXFCYVUzUXprdE5yMG55VHU5?=
 =?utf-8?B?ZDNqRmxKNzhwOUVvdC9ld0tuQmM4T0VhNXNwcnZIVEV0TUJDUHNrYTRJbldU?=
 =?utf-8?B?OE0yVzdnS290TlRkNmozS2NGZldJMnAwNjZtejFwM1J4M3RXalNlN0xmSjFM?=
 =?utf-8?B?eWtvSlFLRjdhVmcvL1hxZ0J3d2djck5WOTN3dzd5OUJ1aVNVaG9kRmZTeld5?=
 =?utf-8?B?eXhJUEVvRnFxS2V0V2d6N2VjSWs4b0p6VXF1YVcrQUd5VWVXcGdGOFFJZmhB?=
 =?utf-8?B?NGE5WEMzZFhJVE0xblNvOFlhaFQ1YU4yZHlxN2pqQXBpbXRoN05TcFhOaGF6?=
 =?utf-8?B?eW1JSVQrNXN5NmtLZ2kybzM4SjZpVmpoWWloOSs0ZkVROXlkU3F6YkxqblZK?=
 =?utf-8?B?anlLeThWbldpbGhQNFY2aGlUWFdaZXpqbmF6LzE4MHVhcnRkek5XNGF4M3Zh?=
 =?utf-8?B?TjJOT1haZHBxb1NMVnBPUXlJT2hadnQydlMxUzZId3FQRldTY3BLbGRDRUhD?=
 =?utf-8?B?MjIwNzF6MVBDVDlqK1FSSGEzZnRRMkx3dHZmczVPb2l6aUxOa3hUaUI2a2FB?=
 =?utf-8?B?VVhiNWxQa0JTSm96SW5KUnptRE5LcXZVeVg3aFhtcGxncHdKaGpHR1RBNk5D?=
 =?utf-8?B?Wi9CSjJKdDFUVnZPQVlWSk9BU2JocDVNTjNTV3o0c2g0dFR0Nng5ZEpmcUJU?=
 =?utf-8?B?ZXFPYzh4YUpYeVpmbU11dXlQMjlkRElleFZsZTlFamxUSWRuc3pYdmNGeEQ4?=
 =?utf-8?B?Y0NyMFkwbDY5NVk4SjgxVXQrSTZCOGZCTnA0TVNVWnBaakROS3Z0aVNJUmk1?=
 =?utf-8?B?OGJ6aE9ZOENjbzNTb2RlYndHazV5a05BNUZxaHFoQ083bjF2cGlaRkhFY1J2?=
 =?utf-8?Q?2GBaEkg2txBR3+i4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb539d3-3eb5-4a29-6c45-08da2761a861
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:49:21.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uwn3t+HDul3wWjNIs4Ks9lLZqyEkNlqERsv6ShAK6pY8PoJcA1Zjea9hsqckAbH89Fgh/sJ8lBHMBSrXUz89uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4771

On Mon, Apr 25, 2022 at 11:40:11AM -0400, Tamas K Lengyel wrote:
> On Mon, Apr 25, 2022 at 10:41 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Apr 13, 2022 at 09:41:52AM -0400, Tamas K Lengyel wrote:
> > > Add monitor event that hooks the vmexit handler allowing for both sync and
> > > async monitoring of events. With async monitoring an event is placed on the
> > > monitor ring for each exit and the rest of the vmexit handler resumes normally.
> > > If there are additional monitor events configured those will also place their
> > > respective events on the monitor ring.
> > >
> > > With the sync version an event is placed on the monitor ring but the handler
> > > does not get resumed, thus the sync version is only useful when the VM is not
> > > expected to resume normally after the vmexit. Our use-case is primarily with
> > > the sync version with VM forks where the fork gets reset after sync vmexit
> > > event, thus the rest of the vmexit handler can be safely skipped. This is
> > > very useful when we want to avoid Xen crashing the VM under any circumstance,
> > > for example during fuzzing. Collecting all vmexit information regardless of
> > > the root cause makes it easier to reason about the state of the VM on the
> > > monitor side, hence we opt to receive all events, even for external interrupt
> > > and NMI exits and let the monitor agent decide how to proceed.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > ---
> > > v4: Minor tweaks and more verbose patch description.
> > >
> > > Note: making the sync version resume-friendly is specifically out-of-scope as
> > > it would require significant rearrangement of the vmexit handler. As this
> > > feature is not required for our use-case we opt for the version that minimizes
> > > impact on the existing code.
> > > ---
> > >  tools/include/xenctrl.h                |  2 ++
> > >  tools/libs/ctrl/xc_monitor.c           | 15 +++++++++++++++
> > >  xen/arch/x86/hvm/monitor.c             | 18 ++++++++++++++++++
> > >  xen/arch/x86/hvm/vmx/vmx.c             | 12 ++++++++++++
> > >  xen/arch/x86/include/asm/domain.h      |  2 ++
> > >  xen/arch/x86/include/asm/hvm/monitor.h |  2 ++
> > >  xen/arch/x86/include/asm/monitor.h     |  3 ++-
> > >  xen/arch/x86/monitor.c                 | 14 ++++++++++++++
> > >  xen/include/public/domctl.h            |  6 ++++++
> > >  xen/include/public/vm_event.h          |  8 ++++++++
> > >  10 files changed, 81 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > > index 1b089a2c02..159eaac050 100644
> > > --- a/tools/include/xenctrl.h
> > > +++ b/tools/include/xenctrl.h
> > > @@ -2096,6 +2096,8 @@ int xc_monitor_privileged_call(xc_interface *xch, uint32_t domain_id,
> > >                                 bool enable);
> > >  int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
> > >                                    bool enable);
> > > +int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
> > > +                      bool sync);
> > >  /**
> > >   * This function enables / disables emulation for each REP for a
> > >   * REP-compatible instruction.
> > > diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
> > > index 4ac823e775..c5fa62ff30 100644
> > > --- a/tools/libs/ctrl/xc_monitor.c
> > > +++ b/tools/libs/ctrl/xc_monitor.c
> > > @@ -246,6 +246,21 @@ int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
> > >      return do_domctl(xch, &domctl);
> > >  }
> > >
> > > +int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
> > > +                      bool sync)
> > > +{
> > > +    DECLARE_DOMCTL;
> > > +
> > > +    domctl.cmd = XEN_DOMCTL_monitor_op;
> > > +    domctl.domain = domain_id;
> > > +    domctl.u.monitor_op.op = enable ? XEN_DOMCTL_MONITOR_OP_ENABLE
> > > +                                    : XEN_DOMCTL_MONITOR_OP_DISABLE;
> > > +    domctl.u.monitor_op.event = XEN_DOMCTL_MONITOR_EVENT_VMEXIT;
> > > +    domctl.u.monitor_op.u.vmexit.sync = sync;
> > > +
> > > +    return do_domctl(xch, &domctl);
> > > +}
> > > +
> > >  /*
> > >   * Local variables:
> > >   * mode: C
> > > diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> > > index b44a1e1dfe..64a38e8fa7 100644
> > > --- a/xen/arch/x86/hvm/monitor.c
> > > +++ b/xen/arch/x86/hvm/monitor.c
> > > @@ -328,6 +328,24 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
> > >      return monitor_traps(curr, true, &req) >= 0;
> > >  }
> > >
> > > +int hvm_monitor_vmexit(unsigned long exit_reason,
> > > +                       unsigned long exit_qualification)
> >
> > Should this maybe live in vmx code or have 'vmx' in the name
> > somewhere, so that if an svm counterpart is added this doesn't need to
> > be renamed?
> 
> I don't follow. Why would this need to be renamed? I would presume the
> same function would be used on both if it comes to that, perhaps with
> a unified input structure if the two are not compatible as-is. In any
> case, there is no vm_event/monitor support for AMD at all (not just
> for this particular event type) and no plans on adding it any time
> soon so IMHO we should cross that bridge when and if that becomes
> necessary.

SVM has at least 3 fields related to vmexit information AFAICT:
exitcode, exitinfo1 and exitinfo2.

Instead of having an union in hvm_monitor_vmexit to cover all possible
vendor formats it might be easier to just have vmx_ and svm_ specific
functions, so it's contained in vendor specific code.

Or maybe that would be worse because you would have to expose a lot of
vm_event logic to vendor specific code in order to put the request on
the ring?

> >
> > > +{
> > > +    struct vcpu *curr = current;
> > > +    struct arch_domain *ad = &curr->domain->arch;
> > > +    vm_event_request_t req = {};
> > > +
> > > +    ASSERT(ad->monitor.vmexit_enabled);
> > > +
> > > +    req.reason = VM_EVENT_REASON_VMEXIT;
> > > +    req.u.vmexit.reason = exit_reason;
> > > +    req.u.vmexit.qualification = exit_qualification;
> >
> > You could set those fields at definition.
> 
> Sure, but this is the established style throughout the file.
> 
> > > +
> > > +    set_npt_base(curr, &req);
> > > +
> > > +    return monitor_traps(curr, ad->monitor.vmexit_sync, &req);
> > > +}
> > > +
> > >  /*
> > >   * Local variables:
> > >   * mode: C
> > > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > > index c075370f64..2794db46f9 100644
> > > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > > @@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> > >          }
> > >      }
> > >
> > > +    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
> > > +    {
> > > +        int rc;
> > > +
> > > +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> > > +        rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
> > > +        if ( rc < 0 )
> > > +            goto exit_and_crash;
> > > +        if ( rc )
> > > +            return;
> > > +    }
> >
> > Just for my understanding, is there any reason to not do this before
> > updating the altp2m?  AFAICT the update of the active EPTP won't
> > affect the call to hvm_monitor_vmexit.
> 
> The currently active altp2m information is included in the vm_event
> that will be sent out, so it is good to have the correct info for it.
> I don't currently plan on using altp2m with this particular even type
> but we should make sure it doesn't send out stale info in case someone
> wants to use it differently. Certainly no point in sending the event
> before it as the exit condition in the altp2m update blob is really
> just dead code and can't actually be reached.

Ack, thanks for the explanation.

> >
> > > +
> > >      /* XXX: This looks ugly, but we need a mechanism to ensure
> > >       * any pending vmresume has really happened
> > >       */
> > > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> > > index e62e109598..855db352c0 100644
> > > --- a/xen/arch/x86/include/asm/domain.h
> > > +++ b/xen/arch/x86/include/asm/domain.h
> > > @@ -430,6 +430,8 @@ struct arch_domain
> > >           */
> > >          unsigned int inguest_pagefault_disabled                            : 1;
> > >          unsigned int control_register_values                               : 1;
> > > +        unsigned int vmexit_enabled                                        : 1;
> > > +        unsigned int vmexit_sync                                           : 1;
> > >          struct monitor_msr_bitmap *msr_bitmap;
> > >          uint64_t write_ctrlreg_mask[4];
> > >      } monitor;
> > > diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
> > > index a75cd8545c..639f6dfa37 100644
> > > --- a/xen/arch/x86/include/asm/hvm/monitor.h
> > > +++ b/xen/arch/x86/include/asm/hvm/monitor.h
> > > @@ -51,6 +51,8 @@ bool hvm_monitor_emul_unimplemented(void);
> > >
> > >  bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
> > >                             uint16_t kind);
> > > +int hvm_monitor_vmexit(unsigned long exit_reason,
> > > +                       unsigned long exit_qualification);
> > >
> > >  #endif /* __ASM_X86_HVM_MONITOR_H__ */
> > >
> > > diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
> > > index 01c6d63bb9..d8d54c5f23 100644
> > > --- a/xen/arch/x86/include/asm/monitor.h
> > > +++ b/xen/arch/x86/include/asm/monitor.h
> > > @@ -89,7 +89,8 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> > >                      (1U << XEN_DOMCTL_MONITOR_EVENT_DEBUG_EXCEPTION) |
> > >                      (1U << XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG) |
> > >                      (1U << XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED) |
> > > -                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT));
> > > +                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT) |
> > > +                    (1U << XEN_DOMCTL_MONITOR_EVENT_VMEXIT));
> > >
> > >      if ( hvm_is_singlestep_supported() )
> > >          capabilities |= (1U << XEN_DOMCTL_MONITOR_EVENT_SINGLESTEP);
> > > diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> > > index 3079726a8b..30ca71432c 100644
> > > --- a/xen/arch/x86/monitor.c
> > > +++ b/xen/arch/x86/monitor.c
> > > @@ -332,6 +332,20 @@ int arch_monitor_domctl_event(struct domain *d,
> > >          break;
> > >      }
> > >
> > > +    case XEN_DOMCTL_MONITOR_EVENT_VMEXIT:
> > > +    {
> > > +        bool old_status = ad->monitor.vmexit_enabled;
> > > +
> > > +        if ( unlikely(old_status == requested_status) )
> > > +            return -EEXIST;
> >
> > What about if the requested status is the same as the current one, but
> > vmexit sync is not?
> 
> You need to clear the currently registered event first, then register
> the new one.
> 
> > IOW, I'm not sure this check is helpful, and you could likely avoid
> > the old_status local variable.
> 
> It is helpful on the callee side. Usually the callee needs to keep
> track of the state of what events are enabled so that it can clean up
> after itself and if it ever runs into trying to set the event to
> something it's already set to then that indicates its state being
> out-of-sync.

Hm, right.  I wonder if you should also check that the ring is empty
before changing the status?  So that the callee doesn't change the
status while requests are still pending on the ring from the previous
type?

> >
> > > +
> > > +        domain_pause(d);
> > > +        ad->monitor.vmexit_enabled = requested_status;
> > > +        ad->monitor.vmexit_sync = mop->u.vmexit.sync;
> > > +        domain_unpause(d);
> > > +        break;
> > > +    }
> > > +
> > >      default:
> > >          /*
> > >           * Should not be reached unless arch_monitor_get_capabilities() is
> > > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > > index b85e6170b0..4803ed7afc 100644
> > > --- a/xen/include/public/domctl.h
> > > +++ b/xen/include/public/domctl.h
> > > @@ -1057,6 +1057,7 @@ struct xen_domctl_psr_cmt_op {
> > >  #define XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED    10
> > >  /* Enabled by default */
> > >  #define XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT     11
> > > +#define XEN_DOMCTL_MONITOR_EVENT_VMEXIT                12
> > >
> > >  struct xen_domctl_monitor_op {
> > >      uint32_t op; /* XEN_DOMCTL_MONITOR_OP_* */
> > > @@ -1107,6 +1108,11 @@ struct xen_domctl_monitor_op {
> > >              /* Pause vCPU until response */
> > >              uint8_t sync;
> > >          } debug_exception;
> > > +
> > > +        struct {
> > > +            /* Send event and don't process vmexit */
> > > +            uint8_t sync;
> > > +        } vmexit;
> > >      } u;
> > >  };
> > >
> > > diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> > > index 81c2ee28cc..07f106f811 100644
> > > --- a/xen/include/public/vm_event.h
> > > +++ b/xen/include/public/vm_event.h
> > > @@ -175,6 +175,8 @@
> > >  #define VM_EVENT_REASON_DESCRIPTOR_ACCESS       13
> > >  /* Current instruction is not implemented by the emulator */
> > >  #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
> > > +/* VMEXIT */
> > > +#define VM_EVENT_REASON_VMEXIT                  15
> > >
> > >  /* Supported values for the vm_event_write_ctrlreg index. */
> > >  #define VM_EVENT_X86_CR0    0
> > > @@ -394,6 +396,11 @@ struct vm_event_emul_insn_data {
> > >      uint8_t data[16]; /* Has to be completely filled */
> > >  };
> > >
> > > +struct vm_event_vmexit {
> > > +    uint64_t reason;
> > > +    uint64_t qualification;
> > > +};
> >
> > You are exposing an Intel specific interface publicly here.  Might be
> > worth adding a note, and/or adding 'intel' or 'vmx' in the structure
> > name: vm_event_vmx_exit, so that a vm_event_svm_exit could also be
> > added in the future.
> 
> All vm_event monitor events are for vmx only right now. We can
> certainly do that abstraction if and when someone decides to add svm
> support, the ABI is versioned and no structure here is set in stone.
> No guarantees are even implied for the structures to remain the same
> in any way between one version of the ABI to the next. So with that I
> don't see the need for complicating the structures at this time.

Well, it's just altering the name slightly, but the structure layout
would be the same.  Just so that someone wanting to add SVM support
doesn't have to go and rename the VMX specific structures.  I think it
also makes it easier to identify what's vendor specific and what
should be shared between vendors.

I don't think it adds any complications to the code you are adding,
but would make it easier for someone wanting to add a new vendor
support in the future.

Thanks, Roger.

