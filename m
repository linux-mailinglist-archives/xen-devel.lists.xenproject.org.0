Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66758FD60
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 15:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384622.620033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8ET-0007mx-6e; Thu, 11 Aug 2022 13:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384622.620033; Thu, 11 Aug 2022 13:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM8ET-0007kN-3E; Thu, 11 Aug 2022 13:28:17 +0000
Received: by outflank-mailman (input) for mailman id 384622;
 Thu, 11 Aug 2022 13:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM8ES-0007kF-4o
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 13:28:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73460eed-1979-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 15:28:14 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 09:28:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5238.namprd03.prod.outlook.com (2603:10b6:610:a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 11 Aug
 2022 13:28:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 13:28:08 +0000
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
X-Inumbo-ID: 73460eed-1979-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660224495;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DGVTFhKGpF6+dO4s1Sidi8xH75hdqjc+ZBgsg21jmKc=;
  b=CGFGFCpn4xYhR+PuuhQJTGCVOj1YoJrjilTYIsxC5A9PC8Cowpuu6mdq
   BAf4igf1LT783tsHNB3y4xFbYVq3S/0OfPWrCCwz0+cI5TrAuirnBCOOz
   G3sSAURMpKoptJlbZ3xSwSZeGi9x0LxAgakb4iMYY27ATSucYMuy3PDjb
   s=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 77876639
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AYO9Rlqxn1eji7fOgAqN6t4n5zX0pJuY/Zkaij?=
 =?us-ascii?q?sDw7gqbGUtXu1SFAkJ/ySjEKRiNIzng2vs7SZUUdGKlGwxi4x2ElytlQ3tyl?=
 =?us-ascii?q?sLfoWLuo18932wJhUBgHO1tJvR627kgl+zDkIxMc+4SeQ3XEm3cqCYKulo83?=
 =?us-ascii?q?3TojssxzoVlQvVD/zO2rMg6bDtodNGbZhXytAmqHAZGPqfqowEuwfnH8DMaL?=
 =?us-ascii?q?iqOFpGUBlCDH6eZko264frak1HjJOPQXsHPg7UTO0TpBkGBST5gkb/G8nI3d?=
 =?us-ascii?q?KTsyMa7gi6aCCYM4ekTPowJDv4Lt8HUmVzOhkxYiYpmCnO6aFOm8TY4lg4oq?=
 =?us-ascii?q?czAuwr/wVNZS5bUBugGq1URkZWJKhsl1xh45YYaEcs9i/npKCbRL+Qc1EQz2?=
 =?us-ascii?q?MRseExtRft55TBqrLMYKzZWV1BaPBS8dgN9iddzlAO/WPFfp7GsZawauNgqY?=
 =?us-ascii?q?vMZoPqingX449yT5YUJHQgl2wx8N6PqBDo4Nykd4J6LgWkqHV3Pu3ITqLJ9l?=
 =?us-ascii?q?/ZTYKL4NihSKJEioGWfe2fE4n1YrB8CGbKxxX62MpoHqYh4w6CkJHW+djjXt?=
 =?us-ascii?q?nX/beH7kntt29JFDw2adCHhjznAaTCRUnKR7nWw1Hs5O0KaECZLbTtmT+snC?=
 =?us-ascii?q?TrFN3kSDm/odQD++Ci7KRIWUHgMcIsrgzAzeAGQ83ONk/rZlaP+C/eMtF/R9?=
 =?us-ascii?q?x6ujv1iPTxUUocgHO3kBFdTtPqAOwMD55evgD5Dm+BrWhh+9gAQLFjUMfXaU?=
 =?us-ascii?q?8HzjsthrZiuLNNSydgqqLhHZxo6ROpWSU4mYDvMvG37F6U0jXebGTrCH02d4?=
 =?us-ascii?q?By/TI357/XyOQiOJZWPLdpvqM0gXF2r6xWYN8OGVbwuSY07MnWetazozn8F/?=
 =?us-ascii?q?v/Er4roNYbEYfyZzXZ+wTvR5GOPNFyRPnWBtMyuP1icngTkYJ5QO80e1Si07?=
 =?us-ascii?q?J9SDYoDcKwpQcG4si7SU52NobJolZSPFKXj5zfCCYL7JXyB6M23VU5OwgtL7?=
 =?us-ascii?q?tmGRPbpY7kd7GytwG+eW0fhetD20Sj/RSszF2U5x8PDlHkgx5kLwLken6w6D?=
 =?us-ascii?q?guofFut4jUJ1By6dhpM54dhTJ9DIsrUny7Pw/ehTC8Na2O6bNCaFfXX9QYiE?=
 =?us-ascii?q?15qf7Xo6SBYOl2QrL+7jrTRJ3sAxhIZYv5Xk9PTpjpbfO+Mfgu/wDmxt12qO?=
 =?us-ascii?q?HOlH/s30POLX03nDi0i+1c500U42oEMRwu2Ds8QzyX3DzgnkTPOk7wx3tJG5?=
 =?us-ascii?q?lYwYIoKmK+fBBYByHH+VLmD2ZoH6UYaG9hzRNO1vIzqIfyJ6a3gn8TyL/RM0?=
 =?us-ascii?q?O0JXuxiqRlb4cXixAeSc0RQeyt7O+hhiNOwBxQgIRD/QwKmwHut9XLniDqwe?=
 =?us-ascii?q?r8Dwh1SuzLcfu7SvGouuxTd3NZXdj85m6KI/wVPsse1RfU3gTmgadJL6ifr8?=
 =?us-ascii?q?+6JEvsx/CN0MpIQN/3bxZobqfzdA+wr1rx6hyMRLiN85ZtxHs5+vobiffk5P?=
 =?us-ascii?q?cRrolHl6SQDbT8zso/ByRNtP/gH5xvZ9zmKKOoqIXRdjw1a1YoxH6jUI7NWq?=
 =?us-ascii?q?gglbBVQ+BLCFc/zEAnGNLDp713v9Ro1aeTTIWeot+yO86F0EQkwZy4oLVWVC?=
 =?us-ascii?q?y2QD7WiF+z4rR7Ih0gSLomFYzssNEpP9Cz2ZOxdspb7b32pdCg8k9sCBA+ev?=
 =?us-ascii?q?RdMNHa/pmiAXYL6m2VWu2igXWeKcRrv5Vxwpn1kRtPzy/zTqkeQuDunMGTha?=
 =?us-ascii?q?fgExniBsSLkky76fFDAn9mWYlNP1M3TPHmTz3byf/3JHuYpEVEgCt60qS9KO?=
 =?us-ascii?q?qgPFYYYMfbV7GK28RZ4j5FkyYZzQ6O1Vf/+H4fJEgPRlTuG9O5J/T6oGoIW+?=
 =?us-ascii?q?r6DIpm/vfR3xPtWKTZMKc/n4Zahj9Vc9kNMRAGZVODpvunjsZ6432qbdpylo?=
 =?us-ascii?q?mZs2F6kf2YrG6M8mGXCznLj5WQfoxemczy0wSCfiY+h8qhwU22zOZbmgv4fG?=
 =?us-ascii?q?L0SHeN8Q+vP7DHkMwE3RJXi3S/iMoCw37/7g2oSkwqC6sZ1ottXJAvjQx9QC?=
 =?us-ascii?q?JqT65yhsoNe9c3LaWqH4HxIAg60q179a1YpF4bEIOpZc3i4DIpfktQM9HV+H?=
 =?us-ascii?q?tsK/mFrPEVLx5jSLDITv+REY2O9kLWuZCLJf8vEvd7XRNCVK9RIobthwuaGg?=
 =?us-ascii?q?crFeTf/B3PFabfcKeLr4G+e2ZURQ76ZSNKtiZXJI9RgsMbTFLkxB3CJe+lDe?=
 =?us-ascii?q?wrG3RqO0+fB9tR6I5SaGtWt43KH70r4I46fwIfXj+Q9kO9r8T3uvIkSxoMnL?=
 =?us-ascii?q?w3OENK/FbrugvhsY5foZ9heJk6q21wiTaAlTQNH3XZZkgndZGoEaXPmpefrw?=
 =?us-ascii?q?+yOuH+WxwAT+8pmK0BEqHDPDG9Hr2z/5F8c2WS5IAxnUkcs8abLvJViSwG1n?=
 =?us-ascii?q?FzuJjfUHXGrivRo8WuxGGiS/Sl7c9kXJqW+qSs9R9f/VqqAI/SH/cwNXMpnA?=
 =?us-ascii?q?uvjRAHTtlYKViIzhFyqva8ieMVbh8n3TrK6gPhdfztzYQR8FThNfaRJr2m0c?=
 =?us-ascii?q?2EeyxnIiZ3vVEw3/tq0xdSf32vThlAfdW25rho=3D?=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77876639"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw/mnboGPgzO9mhEHwNpvRvIJQ9d/iu/vxYfcrXvmogo8dqPQs05kfQhCf0JfA1Qu2tSRwCbvG4JQ15Lidgz2WdF71hjsj7an0jz+qvxKvxvCFefSxvBqKLZn8jLFeYhpo1G5SVSErfK1O0/cxXOHKjksSyPI9+/1S9Q6SCp0Y242pU6Uar5Uj35KS5BLEEO3tCsK3obgfy4P3B7NyhBUOX6zdIseKpwkVWVt+kzAVm6OP3Xw+4zfBlYKBi0WLfCwE93Zl50KsnD55AFxESrcUviqozohQvPc10nMgZp01xWrJA2uQJhVZMIr80TJ4K+xzuIVTviDxjec7WzgTLrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGVTFhKGpF6+dO4s1Sidi8xH75hdqjc+ZBgsg21jmKc=;
 b=eFjnJUCtHPesYxRnCNBlKzQtLGNgTXoHt1Tw1lF0TMwfJ9HOh5cCrlZuubGXoaATVZAaqU4srmVuEmohH1+wajKrcl2QAxqCTy7HecC2ZdFzy5CNkchAbqr3b5angnWMz01GXU9g0HpPTL1uAnpT4epNkJ0zw6Th71KRO/0t2rOIV1kXE8gghA8ziwcVi8Etj5b7znKctNOCIRmzbhi4IAW5TcC2r20s8zsXQdJMOEAjJZzxFbanOUp1tfT+yvBTd2p32sfwzIWuq8VGNZQ39qH9nhpeqNPH/ru/JY+5k2TGFR5Mc3jCf6qamylAOMx/iVdMw+Qna03CKgn5zRHEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGVTFhKGpF6+dO4s1Sidi8xH75hdqjc+ZBgsg21jmKc=;
 b=bN/ltj5lCv6paUOLDs59jNjEU+6A5YO5ytY1QN3AuVX5hHHRHz6rBYwtF9LkhKo3O5/DBZvdNNcqURu2abJm9eK8xZ9e9RmYUZaPzT89Ac1Ii54scTF1r6oJmEgquiF2XzRgRiUIOFnvMvB6l8FgLI+KxJ23NABlvowwwz3yHkc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Rahul
 Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 3/3] PCI: bring pci_get_real_pdev() in line with
 pci_get_pdev()
Thread-Topic: [PATCH v2 3/3] PCI: bring pci_get_real_pdev() in line with
 pci_get_pdev()
Thread-Index: AQHYrXCAqmL9g3mLvEOyD7Moiye3sK2psYIA
Date: Thu, 11 Aug 2022 13:28:08 +0000
Message-ID: <02dac373-6614-ceed-8dfc-54fed69d5694@citrix.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <b8a5294a-6869-121b-cd67-0740e6330769@suse.com>
In-Reply-To: <b8a5294a-6869-121b-cd67-0740e6330769@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 469d41d9-4b06-4974-185c-08da7b9d54b9
x-ms-traffictypediagnostic: CH2PR03MB5238:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 c7fjY7dYoMUUwHxgj+6396AWWdOHfFIulnn7fQCD6BA+Td+B88XHP/z6W7wkOXaxG5/kklUkMtvvO/p6Bu7Z8p+Ud150I4m4jZpS93gXayf0ROvcrcI37B/QBOFQz0mxyxgt+OaqUBSzRJMstMNGSDkdrZI4dl2R8F1amEW2cIzJVlWfHas8+WSNOl4fHLETiyilbuIePQLtEW6kTaPAnYqSajZyNDtrDmUzeWzTxo5OV2B41K+4yPZA0qKzEOsYeZ5l3Ouk1b55h7SPjPeWch34nazXAIJ1EVA7jmCYMcqH2H7tfhPlqwDxUOlFHQkD0mHsj5jd7tw0GWavuhDA6K+BKcb8miT/KCi4HnIGQwzzFauQYMnMKvbvH4UYdW/WByLBi6Rm9Bb5pZFJehP63ilQtwDrLG6OYrJNO7nWEaDORNDDYZucS5hJGKecY1SCZeluQNKFGxtC6YGcpczZ9oOoAz7UEx8VYiFcTtewiNu7F59IRHyH5iLY4ktkVJ71MWrGyMYnCckisd+qTUpRncD6dxHh3vorKjtd54zD61YzDlKkGz6cwRUxRLHYjj5E95LlPbBqRweBCsJfxZONRyMEbl2WKkriyt6GKSacCjvRBx27RO2mjlHpMu9wDCi+rGNHgoFITzKesDnK6i7pKEe5h48DAtHznZAWfi6qq2BwRsE9EwiAbM7fl8CpAmSjtFq0t9mbO6ZX7nq4Mwl1jKWLSDzb32clTgOWvjwRjDAoos/HngJK0qikEvVSfQlb2u2NX97mpqbB005DtgTn5vfrSP9xpeBXCNHOOq9xUC9yjv7TTaB4PgRZPG719Pyq1vtwtxF8F0XFMei39zyZ6jJ7YosuH9kDY1zCMM8O2DTRA2oIw224yNF4U1MSLSem
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(4744005)(5660300002)(31686004)(2906002)(76116006)(36756003)(66946007)(316002)(110136005)(71200400001)(8936002)(31696002)(2616005)(6486002)(478600001)(86362001)(66556008)(26005)(54906003)(38100700002)(53546011)(41300700001)(122000001)(82960400001)(38070700005)(6506007)(186003)(6512007)(8676002)(66476007)(66446008)(64756008)(4326008)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V29MUU9FOUkrNDlzcENMU2RRcm8wTjZKUkQ4TnROdVN5cnFLaFVBdkVCdU9T?=
 =?utf-8?B?T01YTnNaMGhpZ29TVm45WWZPTzlqZk11S09VN2J4NzcyNXc5eWN5a1JuTkNX?=
 =?utf-8?B?Ymt3NXh1WHgraWNiNjR2UjlXeW5NZ3dDS0ltQjB4NVNoVXFvZ0hFVGM3RGtY?=
 =?utf-8?B?VEpuSVZ6Wkd2dUhjMEpMclFSUUtEYmJNSDlmZzVHakZMTHZlUG4wNWFIMHQ1?=
 =?utf-8?B?aUtTSW1oRHZxRUV4cEFRNktpQ1NiNnduQmFjUW5rVmVxelYzcTBZTHgwY1FR?=
 =?utf-8?B?Y0VraXlsRTh5eE5lS3prQldvTWtJN213S3c3R0k1enI0Y05VK3Aza0Vqd3d5?=
 =?utf-8?B?cXIrMkFodlo1bmgxVzVRNEw4bCtNSG1HTzdKUVpMYkhzL3B5Q1ZCQVUrTlBC?=
 =?utf-8?B?dWN2aDhmMXlQbllqSmEwbVZuWEd3RVd6TU5DK3BXL044OW9nTUlhOEdrYUwr?=
 =?utf-8?B?anJ4dnYxc2p4RFFKMGNhbTR1WXlTcGxRcGVyMnlqN1JPeXRmU2pTQmJnczZs?=
 =?utf-8?B?dFhZWlFCN1RHVHdtazRaV2QyY3NzdlVVMUxmY0ZKTC9LOFBsSXpHQ3pqaDNp?=
 =?utf-8?B?d3FqRm5zd3J4eVUrMmdDejRMM29ReWIrVDQxa2lKS1l0KzZWYmlKcjR4NEo5?=
 =?utf-8?B?VllhYmFCdDJqMzZqWGdOWmJGcldhODdNSzQycG1KNVJtU1BWQ3ljakN0VExD?=
 =?utf-8?B?UmhmNGplVE85d0M5eVZOcGNiV0ZYOFgvWUpkT3BvSlJhaVA4SkRXWHgwVDR0?=
 =?utf-8?B?aVd5RG1FL3B1M2lSWDAyUVR6ZmhGMi9WUGY2aUczdlk3S0pCWEpCZlB2a3Z2?=
 =?utf-8?B?Y21GK2lSZEtFejhrdlpFa1NBN082V2l6Sit2cDl1dEllMmxpbTRPaHhnKzVI?=
 =?utf-8?B?bzBxRkgwOEh2b0xGM1FyRkNrbVViYWxUTWVGUkk1NDNZa0pmbE8xRHNsMTRS?=
 =?utf-8?B?RHJPVkg2ck9HalFrQlJoQldHRUp0VklXdHFscDc0TnltalgydFYzbmdaOUY2?=
 =?utf-8?B?Ti81b3R6TzcwT1BnWk1UR1ZvRHd4cVNLWGVhS1NpYmxoM1l3K0VZSGFiSURq?=
 =?utf-8?B?azJoK2NCUXhnOWVwMmxhc3IxR3VTY1prdC90UjNlT2RwRzFWbFdLRFJRdmlP?=
 =?utf-8?B?UzV5T2J0bHk3a2xpU3BuMzFIcU13RElJaW9JL0VlUFlwRldGT1Rwb3F4SnlH?=
 =?utf-8?B?eDVrRSszQmJ1RDFhV2wrdnAxbVNmTmFCaEk2QmY2RzNFRTczWEVCVmlnU3k1?=
 =?utf-8?B?dmZlREJJdlZoOThUNGVMYzZJeGMvVTZiY0dmT3d2TjJaTnEwSFM3aEdlM0J0?=
 =?utf-8?B?bjBnSTFxdFZDNm9TQzNZNmRBd0VhRDJ6REZ0T08rWnExMzVQRkc2YWRGVHNi?=
 =?utf-8?B?K1U5akNUUHFlYUV0cmM4TlZtYjU3WDlHc3RGeS8wMytETytPa2EvOWdhbHhF?=
 =?utf-8?B?K3JGRVJZNUd6U0pJWFJUR1QzVkx5YWFmRWczdVF1UXYxT2RmSWM1cWsxRncw?=
 =?utf-8?B?Mmh1c0xmeDNMbjJ4aWMyay9LZENrbjVsQVpFb2kxcjg4VXhFU1VyOHgrU0tV?=
 =?utf-8?B?WjRWcHMxc2JuNytoZWhjaWhmdnNwMFJmVE5Kazg0bWZsVzJDeUNXdHlPVEtn?=
 =?utf-8?B?czl0K28zVEdCOHlrcW1XOTdZem0rNkhGaVBKRUl1N3RuVHRzSmUxNDE0SkY1?=
 =?utf-8?B?dy9RSjhFUTRUek9mdHJVRDRxSGVKY25xQUoxd2puN0VLdktZNFF0L2hmRElz?=
 =?utf-8?B?YVV1anZxWkJucTVyWkxybWhSdXM2TjJ1QW1ja1dXb01rcWs5YTJ3VExWRjZl?=
 =?utf-8?B?MFpwUkUwNHdwTWJWQzFXamZjY1JZYkNzNHd4Yk1OTmwvdXdyS0trRGp3eE9p?=
 =?utf-8?B?YW1WbTZLTEJZVDJndGIwdzY5ZjN5WXFKdGIrM3hFcHVNTUE4WWVhbFE3bEc1?=
 =?utf-8?B?QkNSSUFlWTdjRmVuRkZtdDIybTRaRnVBMHQvektaUWxhenlPR0dVNDR5eFVH?=
 =?utf-8?B?SXhQeUhhek1xTHYwVDM2aVZzVUE2eTNUYSt1ZjF0YzkzS1E2a3VkT2NuVzlL?=
 =?utf-8?B?T1Fod0FPT0pyVjZpMjVqZ0F0WkdsaG9hUzEwOHgrWFRocHB2eUxsNlBWQ1VE?=
 =?utf-8?B?THFVUjl4QWpDY1JIWGpaNXR5cTZXdkVVTjBpZngybFlGSkFWUzN6YlBiRnc0?=
 =?utf-8?B?aUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C57A53EDE9959A4FB0C71C4A06D0BA72@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469d41d9-4b06-4974-185c-08da7b9d54b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 13:28:08.7688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYUxS8KBbMXUDPwF+YTcwvri7jiHXy1pbJAI2/tAoSGfAYAX7bCpZuWhKa1/0BeKJFC/Xwk51gHzM+niJnd/hZBg9eMkp/3eKWIwJtuvBTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5238

T24gMTEvMDgvMjAyMiAxMTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEZvbGQgdGhlIHRocmVl
IHBhcmFtZXRlcnMgaW50byBhIHNpbmdsZSBwY2lfc2JkZl90IG9uZS4NCj4NCj4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UgaW50ZW5kZWQsIGRlc3BpdGUgdGhlICIoOCAtIHN0cmlkZSkiIC0+DQo+ICJz
dHJpZGUiIHJlcGxhY2VtZW50IChub3QgcmVhbGx5IHN1cmUgd2h5IGl0IHdhcyB3cml0dGVuIHRo
ZSBtb3JlDQo+IGNvbXBsaWNhdGVkIHdheSBvcmlnaW5hbGx5KS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

