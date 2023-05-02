Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B526F4007
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528393.821478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmDp-0000lP-FV; Tue, 02 May 2023 09:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528393.821478; Tue, 02 May 2023 09:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmDp-0000jg-BE; Tue, 02 May 2023 09:22:57 +0000
Received: by outflank-mailman (input) for mailman id 528393;
 Tue, 02 May 2023 09:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptmDn-0000TZ-RB
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:22:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e39fd0-e8ca-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 11:22:53 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 05:22:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6348.namprd03.prod.outlook.com (2603:10b6:303:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 09:22:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 09:22:49 +0000
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
X-Inumbo-ID: e9e39fd0-e8ca-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683019374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Dq+sSd8VpqgctaVXXnnolVpe/f4WOYP+g9T1j8Xl514=;
  b=W2nrzB5pAIN47qGqnNLNLnNTSDa9GCsk0UJe8bNHY3J3Pqt8pnNAFo3w
   cE9hylybGuAuICPVq8YupCwc3A28rt+u7Dsd34VSRQ6iejmKMyua05Gov
   2ubR1lL6yBTw9iXvCgoP2ahOn6Wot5sGZjLpZ0l75KfPauYMZlqKvJpi6
   Q=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 107567454
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:f7vg4Kx9xmwsU1jbvkF6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 WQXXTuOO/rbYGr9L4wnO43j8k4DsJWHndZgHVBpqyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPaoT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVB8x
 aY8BAoRVDPd2uW6+ZKAFthvj+12eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMuuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eQwH2kBN9OfFG+3sRMjWCT7VcYMyYtUUrliteor2iQC90Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+oUr1EuQEZBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:NkiOOa9R0ApEaksDvItuk+FZdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8boYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOQuEYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpDWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1+cJi+EzSvBkuPJlagkEuTzYJ7iJnIfy/gzdldvfqWrCVu
 O85ivIcf4Dr085NVvF3CcFkzOQrArGrUWShGNwyEGT3/AQSF8BerV8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJmdXf2eP0A4feNQo/gtieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZSRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGda48aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu188HLzou
 WybLp1jx9AR6u1M7z+4HRiyGG8fFmA
X-Talos-CUID: =?us-ascii?q?9a23=3Arw0tj2uHNhCcCrv4d4cglXzI6IsUQE2H6FvqP3W?=
 =?us-ascii?q?bVztuRIS1cgOh+6pNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AXf9Pbwzglp5q9XzAmyHDDFr2rBCaqJ6IBX0Nuq4?=
 =?us-ascii?q?NgPK/MT0uEBmMqRKZEoByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="107567454"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyKmkPZc0R2sVFoAByrKZWef/NHL6WziTmFrL/7Uh6BcznhYMwwhrQwMGpXmHgumSCyeV1K2RB+1AGRO9wP3+tgQ+gqRO0VJV8ZOLwT7kCRakQfA/7VJ3Nw9rvwFdd429o8qj/OPtNQo3QC+x9q07ulQHK9Z/PYUp9s5L7JS4ZTz93HaGrEwGzT9lE9S9VDrEPmJy325IzRjU3KVsM9/5lryUbG6w4X06EWTFtm4+UDVWaOYGmDfkmJHaQL4ic0VUlwDQCyCUmKBcYcGjHXFKeEAPDl53ijinV2ja8VK/kbTFMelrp84IuESTWrHe72dxEY7lnk9IgXna8DjLQd9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUjBzIIMR2wZs7nCQYlISDZS3wMRy1R7AX1/v57R7+w=;
 b=LK2zt9zsprfon7bdwxRH7KUx8gVbcoWguVDkDaotou/nzoySMbLoxJRTCrOI41ZVa/KMF9Q150kke9mdXtxumiWHRy9+l8H3o8wUHf8rWdNQEmFDX3HH7L++91woP9RUzXLb819R0jRP2l2WuAiocN/QFshDDDt9l8FNkh5efaYs5IEXaOzGhqRyj6FbII2VKThJ0SansSxoViX4MJpuEkeowTmothcACIoqlNheh05sJjfKDph9TJLx81YWmrQ6wK2LTKMOdpMAH8qjO4QJWy27kFLD3JtiaT83zJsUpa2pQpU81AMuWzm9ew7tOEzAaJI3WkToioija65aPTSBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUjBzIIMR2wZs7nCQYlISDZS3wMRy1R7AX1/v57R7+w=;
 b=SF469FBt6Wkq80xe8f2qEoH3EkBcPH0ldLrZdEJEvQ3Kita1OzJOMRPaoLNHgIHbPIBi80w+s+D3iivU3fNywPEA+MM1hyQtEbZQea4a8ZDoGU5sCRpwzjZ2D6yi+mSezSx4nyzw26PhD517BBQQaofdCL75jpC3nHEFrDRizic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/trampoline: load the GDT located in the trampoline page
Date: Tue,  2 May 2023 11:22:24 +0200
Message-Id: <20230502092224.52265-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502092224.52265-1-roger.pau@citrix.com>
References: <20230502092224.52265-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f46dc4-4c26-4918-231e-08db4aeecc26
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S9TCLLVijCkiVllTEdNlD6+0xUl3mtMSWMstH+dvQ5/6D8E4pH0RWSBvl4zO2kZphsLwgz/VpwNLHDNMg+UL3QXaHs+7cCljCnBPSHEVJpVDvO6ipmJjTAqkQBl6j2pPgO3MMdL5kMhyiFLC/yYtmk1aHKaSJqgES4AnFDMH6VE68M5VtoqNDm9sOmOPQnX5vfDKog6vdmlqc4YCUXJiRjczRzjvq+iOn7/KfrLu3RoOzWjk+G1d7GtHqXD8lxwJKSEUTcEcZ8L3Unwun7/LFc8EAxRHJ+ZXeACcgI6N6UBDWhPq4KenjDfBlY71o9O8lMfiuouoxKX8NnAwjXy69egSC1KJb/fTSyhMIqPtt/O+iQN/dLmo9kRkZRuM5NKj2e1NxX+BH5K7yI//FID+XJE5jYC0hqcQpx+T2hZk4kDCVQVT0G1mLWrwgsuKELiAcPl26+/GZOquW62dQNTSqo6WRysGvRMSgMn/CTW9tLvV3eI3i72zAghMkwoit0O9UZyK8FAFoOgw8NNRh+ARGO4Ei8KZfQDSkeD0IAPt/gKv+iGe4Pgq1Nn8NGZZXOgm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(26005)(6486002)(6512007)(6506007)(1076003)(6666004)(186003)(86362001)(54906003)(36756003)(478600001)(2616005)(82960400001)(66946007)(316002)(38100700002)(41300700001)(6916009)(66476007)(4326008)(66556008)(8676002)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjN2L3BzNlh2YnNvRERsWS96L3NSLzZaR25haFlpYTBmZXQvSnp0QlFFTVp4?=
 =?utf-8?B?RUtJZVhaU0dtdkJZZ3Y5VjlVOFlWa2VIQ1JRUEREbVBESWgyd0NDeUF2YklE?=
 =?utf-8?B?WVc2MGoyM3hjZnV1VS9YZ0pNUjBaOEhhNGxNQTF1VmRhYVRjdVdlZXE4L2VY?=
 =?utf-8?B?TGIrQWc0RFVGcVNsdE5XdjE0YzhuVUQyZnZ0K2t4akFUV2lYMmJZSkoyc2hX?=
 =?utf-8?B?VTBlSTAxazgzRExPekVSWXBMR2JJd3Q4NnB1Q1BPSU44eHlENTVla0gzd0NQ?=
 =?utf-8?B?UTRZeTVXNFhxWTFCQUNLNW54bkdpSkFrUnFvek1NSk4yb2Ztbkp0RXVyRDRX?=
 =?utf-8?B?SjIvWkozdHZZYkU2VmlRei9ScEtkUkhXc2JFazlVZ3BRVExwWElIU0tqQXZW?=
 =?utf-8?B?UWM2a1BtditSKzhSR0l3eEswOXhoUWNGUnF3RGt3UVo3S2Rad1Byem5PTUZO?=
 =?utf-8?B?elk4ZmdzZTNvR2Q1Z3lYTUJSalpBSW5JWEhQSEtUeWxlS0N5R0h0Q0hPcTB2?=
 =?utf-8?B?UE9Edk1QVVpuZHpwa0poK1c3QmtZeXZGekl1OThJb3VBTWhadmx3ZSs4ZzZW?=
 =?utf-8?B?bDNTZndlNFQwS200R3NlQ0N0Um9lbFZMaVNVdHpYRkZYM1ExcTVvMjZxM2NI?=
 =?utf-8?B?SGxsNEJSSmdwV2tSTnpvdWVzV2lpcGw3Rm9yUWcwYlQyOHNTNlhWU1Bpb0Jy?=
 =?utf-8?B?UkFuWFBMSmQ1RHdpVWxQNDBxdWpCNTQrL1VSNlYweDBZSUJFSFRpSjYrNkZI?=
 =?utf-8?B?YXJ4M3JkQWV3MVk2ZHlTclZIYTJtMkhYZG9IZExXaWJORmFqcmphV2tjSW1h?=
 =?utf-8?B?ZnViWW5jRUlLaHNzU1NxT1p1dVhhRWxpYnJLazhCZGNXejc3OWREZk5tYUhW?=
 =?utf-8?B?QjhwSk1DeXI2ZGJuN2FYVm1CMkdnclp4OW5oclFzaHoyUjB3OVVvd1YwNVJH?=
 =?utf-8?B?M0xBekFRMlVhb1puR0p2YiszYUFEL1h4RzJwM2hrY3crTGdUc2ZhQ3ZKWlFY?=
 =?utf-8?B?THBDSUM3RlBERVA5bzcrREtCQlc5MEZucUp6YTRBbXZhSEY3VE9HRWxhemRx?=
 =?utf-8?B?ZnJmWTRUQ0NEN0xMUnplVDlEUlhCeUQ5UzRpMGwvd1h3TnMvazlBZ254Q0k2?=
 =?utf-8?B?RHZEVXF2WkpYZXl6NHdHakQ4SFJHcGlKa2E3MzZHVWpNN1QzSDlGRXBpcDR4?=
 =?utf-8?B?c3VzdzI2UkJRQStEd1pGaFJZR2dtQXRrNktxMzVyTC9OVU5DcWVOSTNiTlVQ?=
 =?utf-8?B?b1BhaVJqeFd2UWx3N2ZUWEFOT2piWU1mcEc4M1Ewc2JoTlVmK1FQdnR5L1Fi?=
 =?utf-8?B?NllXYmEvOG1IWVo4SkQ1UGcvc2xjTlZjNXhubllMREJnOGU5U1lYSGp6N2t6?=
 =?utf-8?B?RkdrT2svend2RUdKcHhFZFhWbE8xQzRhY084bkJNdXRya3NPTHZ2emJ3d3N6?=
 =?utf-8?B?Z3MyWDRieW1pTHQxRkE4NzNYV0tVamxYanhLdGUrL0lvdkNDMjJrS21kcDBR?=
 =?utf-8?B?Slk4MEJLdXBmd3JzOXR2OEo2UHZUUkZyemZmRFpnWWtHTCtBL1podjBmUVVC?=
 =?utf-8?B?ZFhvNTIzazN2Z21JQ0xMR3N5aU1UaDM1THoxWVV0OCtGdVFmQ1lpUkNUMkZk?=
 =?utf-8?B?NlAxVHVDVjRscFd1YnR0emdpL1JYQkthL2gyNFlOOHZGVWROcGFKSnNxekI1?=
 =?utf-8?B?MXBpS2lQV0F0cndsRGRvRkpKRFB6R0tyRWZqZTBuWUUyS21peEdmMTZvRHVJ?=
 =?utf-8?B?Z3c0MFlGZU5JbWR6YTVZbklXWEhpVWNYZUkzUjA4SWwyM3Q0aytPNWFBRk1i?=
 =?utf-8?B?OTRtYUFKRlNxSnZlMXVYU0VwTWQ5TXhuVWMzNTVXN291WnFvd3pqRFpueXpa?=
 =?utf-8?B?SE5zWlVCVExwSnJEbzBwcFNlNEd2VlpOSVdQUEZVMUw3TUtoOGtLWTMydjR1?=
 =?utf-8?B?WVY3UVVjalJYMnNaRjRoc2tMelZXR2EvcDZTeGpyVFNUWTlPbjhlM2pxOXZl?=
 =?utf-8?B?ZjNaaExrZjQzY2ZOQ04vTkhra1pJUndpZnBMNnFYY2wyZXkvOU53S3VSZEl6?=
 =?utf-8?B?cnYrUGttWEdnREhjckJsMDRIMkNTaHNhdmt3Vmt6VFhybmExZHIreUxzSUNM?=
 =?utf-8?Q?qE0+ziXFILmo/VBohgPreWX1Y?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sXp29qqFBu8mGf2KYSUq1eB+vzHlz6LqIN7qXhYYCy0DJtP+VOhPIV4JIHIQFk+N16KwKBUNkTveJ2Dgg253DStaMhYssDfhso0lYn4qTLXFlaMSSCIg8RXbWN2EL8nqMJk/KIfNwqYmdGBZf6NKlXnA402p/Ur/fEGLFEWnQZgzIqLM0Q2JbJuKEE+kE/4KYzH6wB1X6Kpmi7t9crgII6s+t7nzS/kSOCGOZ1I5bJx9ZXk8DB/OOCA/6YyMwdw1NKH2FTDBRV2VBBxlWRTwHRh30Hv2DRhhy5sNCIn8kGQvX2b+w4x09bMi3H5AtgOkSw8hZjUowgDiHT5kKBGmxzmN6L0yoHEWEMtY/sJVC6I2Q6lxB4eMnWa649ICafOTCz4GYDI6zajvuX2BKFbMy98/Yex08Di5hn9Ynxw39vc2862Cm3SaGVG2emDy37A6HtJ+Vj6fXFviylSdkx7dy64pMCWODO3OIujmZbl7obmZQBdftrg3g+W26/Z8Zuljfal4rNcElY1G2EySQw5WJkCqc4PYcCGSIw8DTx+no/vgCyEKqrTWukU//TLm2Qt5Rqkhz0GEmeisiCRhSol5BlyEQ9RkwbIcdR2F+ZAIwdliyIfKmSfVYLlCu6PdDzf7q2ww0DiLMWbYUe57kn3jF1hdkJkgv21kbXva/jHHeNW2pXxAi8xOBWtS1VhCL/T31rSKKlBDICnjlvmw1gJh6Mg9E1D8RRxaLCTOppP6sHJ/ustLleYwAh0E/doTWplpHpS142qb8XZheHIZCHXPdF6ykBnQ6s965hqIWVF2d4g13tzLQew2/tbDGwRjIqQj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f46dc4-4c26-4918-231e-08db4aeecc26
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:22:49.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVd5TpzupTc1IBOwhbA5aeuPRAq+YVbFO/WOxsGynWEFPsjdbVpeag/5LysloKDx0u/z7c33gv5gn3T63Ragkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6348

When booting the BSP the portion of the code executed from the
trampoline page will be using the GDT located in the hypervisor
.text.head section rather than the GDT located in the trampoline page.

If skip_realmode is not set the GDT located in the trampoline page
will be loaded after having executed the BIOS call, otherwise the GDT
from .text.head will be used for all the protected mode trampoline
code execution.

Note that both gdt_boot_descr and gdt_48 contain the same entries, but
the former is located inside the hypervisor .text section, while the
later lives in the relocated trampoline page.

This is not harmful as-is, as both GDTs contain the same entries, but
for consistency with the APs switch the BSP trampoline code to also
use the GDT on the trampoline page.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/trampoline.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index cdecf949b410..e4b4b9091d0c 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -164,6 +164,12 @@ GLOBAL(trampoline_cpu_started)
 
         .code32
 trampoline_boot_cpu_entry:
+        /*
+         * Load the GDT from the relocated trampoline page rather than the
+         * hypervisor .text section.
+         */
+        lgdt    bootsym_rel(gdt_48, 4)
+
         cmpb    $0,bootsym_rel(skip_realmode,5)
         jnz     .Lskip_realmode
 
-- 
2.40.0


