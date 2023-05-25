Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26B77106E2
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539344.840122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q262C-0007jg-AL; Thu, 25 May 2023 08:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539344.840122; Thu, 25 May 2023 08:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q262C-0007gL-6p; Thu, 25 May 2023 08:09:20 +0000
Received: by outflank-mailman (input) for mailman id 539344;
 Thu, 25 May 2023 08:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q262B-0006xv-86
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:09:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f946945-fad3-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:09:14 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 04:09:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6876.namprd03.prod.outlook.com (2603:10b6:a03:43b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 08:09:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 08:09:10 +0000
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
X-Inumbo-ID: 6f946945-fad3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685002156;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OhpifKVdT3H0GGYml+BiKdiX37xk/3pT/fvPW7rjgxs=;
  b=Gl3PhYRxEbup0vxdS1Te/6eZxJKYzidU98ox5C4FGQB0hs7jNBCQmUcm
   +8sYvhyO6m284D2ZRLRZTvnI4KclOJ/nnbtK0NQbioW6cJtCf3uX32h1p
   EeydjxSdNumYOZmFDQnZcThqM61zlnd83STSUxVOg/2OnPXB6MaJxOEXy
   M=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 109097446
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/0kp7qvwkbAprvWY5U6zBVNYCufnVElfMUV32f8akzHdYApBsoF/q
 tZmKW2HOP+JajT1KI8lPozi8kJT75bUn9NrTAs/rS41Fiwb+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKEyyFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwI2oSSzKaqeGPwqO4acxp2u0TI9L0I9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIC9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANNKReLkqqACbFu7/2ADAk0EbxiAh8KomE7hR/Rzc
 lIYw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMw7Wz0sk
 EOIltXBBDpzvbnTQnWYnop4thu3MCkRaGUEOikNSFJd58G5+dlpyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:YfAyXqA+x7DeX/TlHemp55DYdb4zR+YMi2TDtnoBLyC9Hfbo8/
 xG8M566faMslcssRIb6Le90cu7K080nKQdieIs1NGZLWrbUQCTXeRfBOXZsl/d8hrFm9K1BJ
 0PT0AuYOeeMbAl5fyX3DWF
X-Talos-CUID: 9a23:jCMiPW1LFq9io2bnPGKcLLxfEZo6V1/E4nTpIV67KkNsFJSlRkSP5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AB8FKtQ4R2ox0L1WWSuRSBCbexoxR77SkWFI30q4?=
 =?us-ascii?q?ggNiWNXNsHRvEkjiOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,190,1681185600"; 
   d="scan'208";a="109097446"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJzcoiShheu/WNMPNk5+UC11C2roSw8TKxPtoVc3D3oHCVwGq2G8ny8S+Ms1WYbovdARYI5yqFAjNv/+SvYeEtyYFzSBUKoBbFEVoRxS8NhEL5siwHlbtFOH7ntUeKj+sB7BOwURHvSOu+IdKLhIpxk078gs+sGQG6rItaC/+1fA4wjCVCzh+RNLuLZeFqbUmxD7AsqWEZ+aQUfDaPFVKlcefBP9cYYqbPtD366yi1eiPcJB8ORUj+gMoeVblSz0R7fbBRJSE35vho+yZBHzu5rsinGGzXD7l4JYQgIpgR0lCo9XfwJnkL+3Jz4kKopKdYHcd7+3bX7acfMcolAYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlsVx+vz8iEzY3emfUcaCeeXNrSn049ryPKxtlFAKgc=;
 b=KTBl9X0gkK0kCVwA0xPwS7ct/fPtYb4OYH5aDDLi9oIKjB/kP0poaHr70DdpqDgN94OV6AAw5JO72cAFq3+g97ArdN+wG5qWNKXGpe4jb1l0Ez1DJJunkne+Hc58e8W+7E4lfCqv5pkCYYM0jCGFV4Lav1D+tM4TNcrwyEMLImuSR/Vj+afImHC5k4lXw40MC6pebFJNKxSkd3MvCqELBhHMatm78BLHTWihkBW89XFPMA4AQHEScMgOsEVPNOC44ep7fClB7ITMjAB40IO+SVL4pjlgHYbdVD1hrPplJSwiA27pUzxfCR0o0C4f6qwbXRUnem865tHcr/Exx4dLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlsVx+vz8iEzY3emfUcaCeeXNrSn049ryPKxtlFAKgc=;
 b=L9ktaMuZd0wiJt6Pq8SyUgTbUZMGskDSxm2n8pRIMmBjJ6EIFqE1oFfSwDuxTQI5CcD0Fe6baOHqch6j+VbQlNqY3hFU8rB5NhdnCXZJFbaIm5fjjJWzvqK5DR/egy9bS8t6Y2CPfrd7L2lvvhUq3bDzVMuyRRfnPfZfXmNbewA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3] iommu/vtd: fix address translation for leaf entries
Date: Thu, 25 May 2023 10:08:59 +0200
Message-Id: <20230525080859.29859-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 6117e259-897c-4f01-7c31-08db5cf7516f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xfvf5j4MphXMVfFyEFHn38YHkSaaZEmkKObpdX59ykjOLJTNurDniUZXAExmhmD7ZRAaHExZx7srwkama580y8Fp+evaxKB9T8CjZTRkU9GKOM0n57o7g1YjW8HoTZGGvoSqfpK3rU3nI8W5OXdKhnQWyoEb4ummvkDx1FjJynBdOkm/NLDnzHgVsXLGMl9gzkuK5kHZ1F/aJXDPllQma+uCB0E5bNKQKc0dhVPobBFnOAzApJMus9EwnE1IuFWyU7GVji1Rn8sWAFjc1pS3P9tMU2N+zRieXiWg1LBsZulPXqUgIVS2kH98MMoJjeLAqD5C6uRf0adNRLJyqs8NsdsGSV28oXkzWT64QzGPSCXmumirIq6rYo1UAYPZ3u/J2h8UurfBTR7Yev8rPRYiHU4n2nufaVOaPhlF4K/cyDlTpPzEhE0/kuRMqF6hu5YqfGnSdEek3xrrHKRk13uMfXrGg1GUFC3DwRUDu6dlTMOye708ApE6nqtqqWCZjYJiKhUfqsnq2lVcogDtD5Y2Vng6aCDHv3svEwh4UFCLxROXrW8q41ah46DU0BjQ5Cuw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(36756003)(38100700002)(82960400001)(86362001)(8936002)(8676002)(5660300002)(26005)(1076003)(6512007)(6506007)(2906002)(83380400001)(186003)(66556008)(6666004)(66946007)(316002)(41300700001)(6486002)(2616005)(4326008)(54906003)(478600001)(6916009)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2RhTXBGZGRGOUR6Yzh6Ym42YUo1eDF5UzJ1N2lZVGg2aUpNa05qakZSOXIr?=
 =?utf-8?B?RzBZdEpHeEI1clFkbWZkcnNUVjNxNGQ4MjdaWlQ2U3F0UmRoZlNYTlpZc2ZD?=
 =?utf-8?B?OTdwajBhUzZHa3RPUWhpcDUxaC91UzNQMnpSVnczanRVNzNZeTlVMHpkcDkz?=
 =?utf-8?B?L29SdnJYclFHVjZGSHdrcmNzZ3JkR20rL2p1U2gzc3VkNlpVc3dIbTV1MUNC?=
 =?utf-8?B?WFdZdmFOTHJ6Y0pIS01vNU5JR2VwMldIaDRrKzIvbG1ZTW5CZ1lLQXNVSHhs?=
 =?utf-8?B?UU5HR2RyNVNpMTcxYVF3QVFHYVloU2RjTldhblpyUzdFanpmZ0lOOXZnaFhO?=
 =?utf-8?B?QXl6SzNiS0ltYm5WSjgybVdWNUcrZ011alNvTVVIUXAxWTdBZFJYbmVaa1Rp?=
 =?utf-8?B?RHB2QjJJcDEvR0pLU2pmQ04vTXF4a3ArUXMvL0R5dU8yK0tibWVlRUpxekxR?=
 =?utf-8?B?dDhoVU9KVUJ6Uk9XMS8xMWxhSHFidU5pYnpoNENqMy9UdjBkaUcrK2FiSFhl?=
 =?utf-8?B?OXRJVUdPekdXSHRpNkF5TEE3cXZpcXhranNTdU96c2ZQczFKNHhaaU9mTnoy?=
 =?utf-8?B?ZTV2WG1YT3pRZUNBMThyTi9qTEZ3MHREOUp3dmZxR3FhUkF3ZGlxTFJaZ1RU?=
 =?utf-8?B?WCtiVTlNR04ra3RTMnp0N216OHB5UHd6aUZZMVhKcFgrazJJdEFVQUVUVmxG?=
 =?utf-8?B?eUxEQmxrcjgyWjgzb3VSUVJzaEt0UkVwdzU1aFVLZnFpQTB4U0JqTUk0VUIy?=
 =?utf-8?B?R2xLYnpqRHZac2F3anlKcHpFdzhnMFhtazhqV2xNL2pMOHcvcE5oL2t2YXgw?=
 =?utf-8?B?dmF5TFR1Q0NsTVRBSUlLK2xXZzZUdU91cllMV2NJS0ZVY0N5dmlwcEYwLzAv?=
 =?utf-8?B?NEdUaCtiRDRLMWJLdkRleFJuekJpSVZOd3IyVG5oUVFYLzU5aGpuWC83eWtW?=
 =?utf-8?B?dURpT3Z6RkVLazBYdVpYYmJVdi9XV1ZqK3RoeHR1Y3huZmtPZytjWnc4L2Jl?=
 =?utf-8?B?NkJKMi9GVXlpeUF5MDZzR3Vlc1ZFK01tbGNEWUxsVnIzYjNkYTI1cWVvKy9s?=
 =?utf-8?B?R00zTDRscWxFT0tRV3V6cWtwVmdWYjY4SDd6cUpTZFZXak5NN1dZMzBKRG9y?=
 =?utf-8?B?SUU1alZld1R2VWVONWdYSXB3eEFvaEhBTVdWUzBsSC9nZ0FQVFJnbW11dWNJ?=
 =?utf-8?B?NTBYdXRpdWpzUEx5aWt6cWVNeS9kNXdHbW9yMzFISkZMellUUUdHeWNFd2Ux?=
 =?utf-8?B?amlYVjFUdmhmbGVmZUlKdENQUUpYRW1GQ3VmaTJzb25tOEt4M29ZTE4yMFFN?=
 =?utf-8?B?enZEWmRYQ2VEKzNnejZrK2EzUk5QMHVZVjNMaVlSWmFvM1hBb3Y0d29wRUxj?=
 =?utf-8?B?Y1JWRk5kUisyZFIxSFNCdGRyS0xFWDBmV2diTm5IRlFVNWhoR0xpUFpYNWgv?=
 =?utf-8?B?VnlXbFBlWXNIM0Z5aXE5djluYUhjR0M3d01aYWVzbG9yNnFhbE8xVW5rSWI4?=
 =?utf-8?B?ZCtLWlBhekdON1JvbnRmT2Y3dU5SejlrNGlaRFFBclNURTYwRm1UZDZKZHRk?=
 =?utf-8?B?K1UwMTlMUlNtUEtNdXZ0ZWh2RFMvbUR3RDkxaFY4K3p6anFoTU8zcCtuWTBX?=
 =?utf-8?B?S3k2aWJlek9tZE9mRjBxcU51MnRUZjFjVGdBakRnRzcxUlo1ZWlmT3V6eEEy?=
 =?utf-8?B?NCtVMXJHcUdtbm9jajExWWZVWHFrUWg3bklyMEgydTBFd0w5a0d4dG9oRVF4?=
 =?utf-8?B?SXpqYkJ6Uzl6L2EvcE00Zll4cG1tMmZQS04xWHVTanoyM2g4Z0tCdm1LdUZp?=
 =?utf-8?B?SE5Pd2JObWZwYWIrdTZUU3Y0ajk3dUZEVjgyR3U4OCtWTHdWTjZ0M1dBMDV2?=
 =?utf-8?B?U2VsZ2VXMm9Yc2szWDZYRytva0VuNWNML0JXRGNTYmUwZjNVWUNmRHBkdGhq?=
 =?utf-8?B?VEVHMlE3N2huMHR4b2VqaDdzVERGejgvVkR5NEJQTEZESGVYMW5PZFZmN0N2?=
 =?utf-8?B?bG9WL0J4MzdRUVNCY1pqdXkyVGVYSFgxUEZKNDlGd0ZDd080Zm11cmNnN1lC?=
 =?utf-8?B?UDdjeVp5VU0zN2oxWXFlcVVDMUxmbTFDSktXRUpnMkhEZ1ZIRm9MVnplVEl5?=
 =?utf-8?B?UjlNdWx2SVRPV3ZUZU90dUFsRGw4UFVEOG5rVktFWUtpKzJkY2hLYzdUbEky?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TdRfZlaWa2kzr87mOnahsY5YzeN8l4ihmPhS95f6YXpVG12hq8vSy9kXS3L0o2sWtP+ZKNWcjF1pWPXhE9B6Wp/SpoofF0f///zeMouJxSklRWxkqI3W6avGtaBhCn71xFKgiBTZsGxAlE2BEgsEMsxR0DCqBayKWShSWdOnKXHh6LpqUqOZ82RccmFXAauZfE5VHRUqkSJ/ZbxY/9y1bUK/9s6gwhVui2KIxDHrS6Wu4oKeNsYtmc20BgqP8eNB7CIGoAxK1xJ6RwQuAmLNpQC63LtKTCpdQF34AHgv/Jq9/ATAaP9YrVHD36/gN90VUg6zrFECLXcA503+XAiWB+LKoUWb6D64tlWuvHcvh8wq5dHm5RfQaujzfw/HrrCk26crH81/yYrGOE3nVqvVq7N0qzOZXalSlPfpEIMIkgk+wqLC0T4tWD79+6X1xQM6rWnVe7kC/ZCc2di07iQBBMhj1G7F9It1alpdtkvWHr+Oo3XN+dm6jIrLaEZ63URpSQToEScBM6yovZXUEuE+dgiX3QqGVdI7JzTy3oL0vfHafALBMnpGXqaqegm4SkL59lqcNGob28JSC7d1K5Dormvtv1b1iJq7vHywv8+DXW0DhdNM55F6gKSv7pCsOoDpFFdAIlCp6EOxbmy6kyJ5IWjhYLZMBm9qKgIZ7RAJD2fMQ7QcGdzlebPn1+2TuAlcerIwU71Sb2ZfXslwgcR4og1mksTSG5+BHGrvpTLhsRPtvZFMx2m/2v2+1O6hJ0jgwW9+ZQdJMGOufhzDn0/33jWmY6fHuqA3xqo98DL06BsPadoR4Sr0Q5NU+Hegv2sY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6117e259-897c-4f01-7c31-08db5cf7516f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:09:09.8894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5XxW4YokkKRwVGK+Dc3jUtZ1IIs/d2OcWFXo20GE+QExMinMTn0P6QvSZSHivITD+OsLPwtVw/16ZK1eXjDkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6876

Fix two issues related to leaf address lookups in VT-d:

* When translating an address that falls inside of a superpage in the
  IOMMU page tables the fetching of the PTE value wasn't masking of the
  contiguous related data, which caused the returned data to be
  corrupt as it would contain bits that the caller would interpret as
  part of the address.

* When the requested leaf address wasn't mapped by a superpage the
  returned value wouldn't have any of the low 12 bits set, thus missing
  the permission bits expected by the caller.

Take the opportunity to also adjust the function comment to note that
when returning the full PTE the bits above PADDR_BITS are removed.

Fixes: c71e55501a61 ('VT-d: have callers specify the target level for page table walks')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use PADDR_MASK.
 - Also fix the non-superpage case.

Changes since v1:
 - Return all the PTE bits except for the contiguous count ones.
---
 xen/drivers/passthrough/vtd/iommu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 130a159cde07..0e3062c820f9 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -310,7 +310,7 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
  *   failure,
  * - for target > 0 the physical address of the page table holding the leaf
  *   PTE for the requested address,
- * - for target == 0 the full PTE.
+ * - for target == 0 the full PTE contents below PADDR_BITS limit.
  */
 static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
                                        unsigned int target,
@@ -368,7 +368,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
                  * with the address adjusted to account for the residual of
                  * the walk.
                  */
-                pte_maddr = pte->val +
+                pte_maddr = (pte->val & PADDR_MASK) +
                     (addr & ((1UL << level_to_offset_bits(level)) - 1) &
                      PAGE_MASK);
                 if ( !target )
@@ -413,7 +413,11 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
         }
 
         if ( --level == target )
+        {
+            if ( !target )
+                pte_maddr = pte->val & PADDR_MASK;
             break;
+        }
 
         unmap_vtd_domain_page(parent);
         parent = map_vtd_domain_page(pte_maddr);
-- 
2.40.0


