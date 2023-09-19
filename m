Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7A7A6634
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 16:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604782.942302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibQU-0004iw-S2; Tue, 19 Sep 2023 14:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604782.942302; Tue, 19 Sep 2023 14:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibQU-0004hg-Lu; Tue, 19 Sep 2023 14:10:06 +0000
Received: by outflank-mailman (input) for mailman id 604782;
 Tue, 19 Sep 2023 14:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qibQS-0004MD-I6
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 14:10:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36fe5871-56f6-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 16:10:00 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 10:09:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5859.namprd03.prod.outlook.com (2603:10b6:303:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:09:45 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:09:45 +0000
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
X-Inumbo-ID: 36fe5871-56f6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695132600;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cYJusNWdOzHq2wpHZKob2Mtr0plkVWOcJrgiLUE//MA=;
  b=WgVsc/GUVtwtSq7ioZX50v0DM2sGLXgxYlKAS+Cu3X/HBzF0LAmLlpe9
   CZjy+RXvtjLSBw3qHIlJ1Gj/OlrySOB1EwoE+NP169L13mgbvYTQv+ahA
   nlv/TCLguOY5YAT159QgjJ63KxFSgsWo2PXGQWERSqXYkux95As7R4idD
   4=;
X-CSE-ConnectionGUID: PfIQZX/ATsukkiFvcFwaOg==
X-CSE-MsgGUID: z2pyGF9XSZSJ9T3BAuwnIw==
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 125832073
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ddcs5q+d53T6leAdxqMFDrUDIn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2EdXTvSM/nbNmOmeNB2Oduy8R5S7ZWDytNlTlBkrCA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKka5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl2+
 90hGgBKRyyYmuG1wZylQcdzj+MseZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUujNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwHOgAtpNT9VU8NZ42kWC6UJCOCYkbnnqnaKTo1OhXfNAf
 hl8Fi0G6PJaGFaQZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSiuNDccN3NEZS4AQQYP+dDlrKk6ix6JRdFmeIa3hNDoHTD7w
 xiRsTMzwb4UiKYj1bi//F3BqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZkaFl
 GgJnY6Z9u9mJYmEiSilUOgLWraz6J6tMzDCgFgpA5go8Rys/WKuecZb5zQWGatyGsMNeDusa
 0iKvwpUvcZXJCHzMvMxZJ+tAcM3y6SmDc7iSv3fcttJZN52aROD+yZtI0WX2ggBjXQRrE32A
 r/DGe7EMJrQIf4PIOaeLwvF7YIW+w==
IronPort-HdrOrdr: A9a23:tEfX5qpQTZDhJCPMGidtphcaV5tQL9V00zEX/kB9WHVpmwKj5q
 STdZUgpGvJYVMqMx8dcL+7WJVoPkmsiqKdjbNxAV7AZniVhILXFvAB0WKK+VSJcREWndQttp
 uIHZIObeEZBjBB/LjHCGHTKbodKLLsys+VbSi19RpQZDAvUoUlyzpQTj+cFEgefngyOXL6fq
 Dsl/auY1CbCAcqhgHQPAh0YwG5naytqLvWJSQeAgIh6k2nlCrA0s+DLzGomi0GVi9Jw/MI7W
 jBnmXCl9memsD+8AbYy2jQq7NfnNeJ8KokOOW8zvINLynqiEKPeoNsQNS5zUkIidDq0k8ujN
 7P5y0BEq1ImgjsV1DwmwLpxw7jlAwj8GDv0niRhXeLm72CeBsKT/BZgJ5fcF/n51E7vNd6uZ
 g7ol6kiw==
X-Talos-CUID: =?us-ascii?q?9a23=3AnotTLmvKKXlIoSfAColUWKUJ6IsdfFzk/keXCnO?=
 =?us-ascii?q?jFGVqSZOLQnGP8YRrxp8=3D?=
X-Talos-MUID: 9a23:kRu/7gs/VTIKGYa+oc2nlmt6JehGspSVOnsvwKldkeCZKipRJGLI
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="125832073"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=go30rtAz/ix7M7ub3tNtg8/miAVuC7JTjMEuXz3wTinYfjxtUHwirXf2xkYG7JyMBfxBqrwwpruXzS7kSxQxJ4yTUGPFb30JYhIIXQMKcPPDUl4fiz6U7X+md/gJwQI+xPyUNwpC3qGNFAj+y9O0JpRFCHi79fpl6HwXHuGQoXsYeVUGmpRKDNe/31TT4TL2EdUFcE5vRqZJfTfE5VRIFAFSk3CxGqhp6He8jwSsqMwMuRLT7eCfyk4Ku7d1n5o3dAssjD2RJcuHa3NnNa6so3HtFRf4++u4Gxj/BLcd6l+KGu7aebD0NGWKdILfm5+vdijJoq2lBc+enBg29A/ZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Wlu/cL8a5sbGwcXL6S4ZPGCSKgPPB297NyQjClZR8w=;
 b=Nrh2bYzwO0VUgdse+Kqwq2mbAcwHs7N+iONrmDSTLEfwvoP3zo4pZk8zJ8G0iXvLPDzzXI/P9ZDyN2g/pgVup7zk6d8wpWXuAxxtdybDRVEIfDgta0c9xr/BzoYr5UMAgGPAZIz3WGUvHgmq+/wxw/xrncewuuDenD2WQ240n3tcIETCGiwAb57+ecIQd/RpgvjEihCpbSrbycPZFLeWNfo2BUmWV3t2YJiyptbSFVDSEIJ280UXOQmRmuLC3MR16uky6ApbMVg7axIZqg1DV8Af/lcME5OZHLeDDCEFqy3zFxOfBwM3dq0j0jaUvYw6PMuLHoJL7f86niUv+ZznKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Wlu/cL8a5sbGwcXL6S4ZPGCSKgPPB297NyQjClZR8w=;
 b=s/KhP8Bmzy9iZyLcZYVosOQDCU3022YAVJgnEiUvbrt4R3jz9xkp1LVj42ybK08zzPZbNvwx2qvf3Yv82OGXn9vJB/DjpHZemOsgoXAL7POdv2GA8nhYXQ/gJ7FtQpTdVIXkaVFa/LokhE6psGuQG9x5c9UFoFc400P1ukqe/2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 19 Sep 2023 16:09:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v9 01/16] pci: introduce per-domain PCI rwlock
Message-ID: <ZQmro968jYGOb5sY@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829231912.4091958-2-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b840a6-5e90-4fa4-c26a-08dbb91a1369
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V5bFuXB3JRGwNSmZcmlVqzssDRlQQy0fG134r7ZYZeEzbIMT3lPXJVbPA/H8oqZY08CIyoJhZu6rFoPixb8GeOEo24HbTdNqtH4JkVZ9UuyTu6MifiLIJ/Y9g/l/jthWM7TAkWej8YdCnb965iDBjaPy8LcaO2jvwRE2e0xhmBLlWef+JkRzIbbgOYCtMut/n6aOd7eNkYELjwyavhU8YXGroIhWk4eJJQQvr+at+E6fuvmd7afXb7prcLr8NhDg/uC9tGreshtk12Kb2CzAnPPc1n1pki2ucpuJgh+gT9bFQj4O0UQqU1yLuXspdRqDDXUBZHpZ51o9zPJvAta27cgdId0jYXlOonQyX6l/8xRs4uJsGwX5unnwtgnFrg+A5D7kUUGxixQHnt6UBS37S6QGp1ytIPdDL4AO/pjPaWuMxdfQ57hcT+zvMSKS2gEO/LPaoNv3sef1L7qgjjBgC0Wpvs1TBX8dXOlBqhIXcAZGejjh2ALOH7dwcZw2NeuZwD8+FjD8bgvjm86kN4Kfs4pUMrkxykBGbPT0cc9XDNzq0Is+778RfGVYFxqVB5AH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(366004)(376002)(136003)(346002)(186009)(1800799009)(451199024)(26005)(6506007)(6486002)(9686003)(6512007)(82960400001)(85182001)(38100700002)(86362001)(33716001)(83380400001)(5660300002)(478600001)(7416002)(41300700001)(6916009)(54906003)(66946007)(66476007)(316002)(8676002)(4326008)(8936002)(66556008)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1Y0SXB5a2JRNC9FMmFic0l4T1kwaXlpdXpVeVRNWTVINGtzL09oSW4rVjZF?=
 =?utf-8?B?QlQ4RjZ3dnlaU1Z6ek81blhWZ1lNTnl4V1E2Wk9rMEVYZW82V1F6QXU4SjYr?=
 =?utf-8?B?U1FmSHNDVXowL1Q3ZkFvV3JrY2E5SGtHcFhmUldMVUlvYi9sNnB6akJOMXpy?=
 =?utf-8?B?SXRNWWNML3pGMmRjZGVDaUVmRXQrdDNKeWtwWGMyYjhicnRnemNOOWh3NmVh?=
 =?utf-8?B?RktHWmtYZnMwbm1UVVVDNjBvT3h2RWM0WnYrdi9VR29KTHBXbkR1eHNrMjRS?=
 =?utf-8?B?elhkU2lNZVQvSWMrMnRja25ZUlovQ0lZa3hTUnVtK3IxaWhDS3l2WllvNXE5?=
 =?utf-8?B?bEFEcUdtQkRtakxZZExkckNUN3NNSmcyRE5vYzRHN2tQaXhNSGljNHJhNkdo?=
 =?utf-8?B?V0oxamFRdVFWTkdnc001L2xjSm8wRlF5MW9ZL29Sa3BPTkpHY2hiM0dZaXhG?=
 =?utf-8?B?TGM2eTN0N21qck1kY3k1ZlA2MWFMSzcxY09JU1FvVUdQOTFBLy9VN3Z0bXpG?=
 =?utf-8?B?d0RDVk1Pb3ExbHQrZG9tczlqZTlOWHBYT0NyWmpnMEtiN2pFaXcwYVRLdHNJ?=
 =?utf-8?B?SXRJM0VmOWdyTnNkK25nTjErUVY5M216bWc2SmZYNXRPM2pMRm5JbGFUdFd3?=
 =?utf-8?B?Z0FYc1h2Z1V6WU0yRDFHRUdlRU1NZVNYN05sbWh0MkF4WFpiUXZyR1Fwamlu?=
 =?utf-8?B?blh4bnpESDQxNzl4YTFNVTZjc2VGa0pGSkc2MTAzcHZsN1dsNHBjYnhFdU11?=
 =?utf-8?B?TXQxcVl1UFdybUZiMWZLQkRmY3dFS3RJalJBSXM5VFV5clVQWDhid2dPSkl3?=
 =?utf-8?B?STNwcGZXS3VWSWlENkxzamQyWWY4SnRTNG0vdVB3bUVobmVCczh3VjVPaEJ5?=
 =?utf-8?B?TzU2MWV0N0JBamJBRWtKS0o5cERtQnlSVktNR3dGS1I4VlVYdDlJa0xnbDhy?=
 =?utf-8?B?NWpBY29UUXJuQlQyWCtVempON2xvOW9LWGh4N1M1VkF5Y3RrMDErQzRwN2t3?=
 =?utf-8?B?ZnRUZDVxeTdIRC9SZFdxQUNZUUFsV3BNRk9hYWU5WHVPQW9Xc25vZms2L3RN?=
 =?utf-8?B?dWNqdUR4aTlGY3RLSjZqSnhGSkc4MVhNNG5iZFBWQm1sSUtRWWNFak1xd3JC?=
 =?utf-8?B?OUw4d1ArMm9uZ04rekJyWFdRZ0lJOFJ1SjQwcFo1THdlbWt4OUE1NGhSVktG?=
 =?utf-8?B?clZ2V1k0bU1tMDlDWjlrT2VkMnlCbVBQYmMweFB1dFRSdXh3NEFuT0lCVjh3?=
 =?utf-8?B?bDVQcURBb2ttR2RhWGRITUZMKzlxejdkekVzSlVVOWdVTk1zWGZWQ0RxaC92?=
 =?utf-8?B?c0V4c3pqSGVPSXJ3ckJIS0xveXZTWTZpR0UvRmxxTTl3ZmIxcHd3bE4vMWx2?=
 =?utf-8?B?NTRITm0yWGtQNDlUWS9qNjF3dTV0cTN5Q0hlNlVBdFRPM0Z6Q2F1cE9qNzdj?=
 =?utf-8?B?NGRUY2xtRDdXNDBLY2M3akhSMTltWFc5NVRlZkxOM2RNU2FOL2wwR3VFRHVn?=
 =?utf-8?B?K29OTEoya2I2T1h6YzJhZ2ZOTjJzQVdOWkRSUUdoN0xUb2dVWHpteXJLbTBu?=
 =?utf-8?B?SnNvZFFhWDBsVDl6SXE0MlBzNWdwRE1aRGlRckNPaTVnblFvNDZnY0ZpazJZ?=
 =?utf-8?B?RmZOTjhZdHhTckZhNmNhaFBEMXBEQlRxSnlPaXNMem1ObTcwN1FJRjZsU2ZD?=
 =?utf-8?B?YzRsTG40WVpuYkpkRHo2dlNNU1RneDJOWlB6MStRdk1wODlZUTFJdWxtb044?=
 =?utf-8?B?K1UzSXNGYlo1UDR5QTNUeGpPY2txWEdTb0sveWxLdUV3QzNHWjdpZ0R5M1FP?=
 =?utf-8?B?Yk5JM3l3QUJZS1ZhM1VBOWc5bWtMVUlTdFpCbzBlZGZJbnFJZG9VM2ViVHBw?=
 =?utf-8?B?aHJCYWwyY0NVQ0J4TzNEcUo0MEppSTlkeUhrSGpXSUxZZjZSYmJDVjUwYWhn?=
 =?utf-8?B?c3ZIK1J6QVBrMlpqK3NQU0pPN3RSbHNTTXg3T2R2cXhuNUU0ZVZOTkZicmtD?=
 =?utf-8?B?S3VySVdPTGozejUxTEZFNnVDNFRBbzMyNHZWMWJ3cWhoazBycVNqamgvWXBr?=
 =?utf-8?B?S1EyRldVYVRQV2xNVW42dFhNNHp3TndFT2lsdzh1ekRldVQwanQ3OXFhZWI3?=
 =?utf-8?Q?8NMr1A+saqxezTZlUA7MhOIPp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IT088PkaB2DXtT6TohGrIQsBXLDFPVnEnD7WUZb+mOzXHhjmryvimDAkTKcQzxeXWUjsZ5jGrLYhGZbB7EmElbJl08Yii6AZ9lSID4BKWGa+Je6eVIeF0ro/NEuxae5+JQGJ5aIechJMOa7LMbHaRePeIgYQrssqXPfyrKYMoB67S3QXPBwQrmXXi+dq6XCUMkNEZqaG8ILIWRV5z3W/KIezavKzwuv58IASqf8dEqpP+iUztMckhbT9Z9wLwWE9ty1L2zRGJIPdD4+WJ0oOb6vmVuf2x7dM2WiaUlGmfRxhHOy66RWArJFpHXAldrx1sREf1aSyPR8QLiE568hniGE2De3zOPbdBczduFncok1DEDH4Lb2Z2YFZieFBnSlQfT18aOcuLdZ9L3wM0FChN1zT7yR84dPIK3pw5Jyu1pKrEhv6vxyhbDhCS02BSv1e19R9irec0Ll+BH9PdP7m9NFduzBAqKOnC5r54xbsbFD+UaHYxqkjahZzGq9WDsUoYgSJQ++efDKgCW4CNtjSOiatNKbQskcbHqrWV2QH0vL+ePrN+WJ6ncG+rjrYAL7ajbC4jxsJ3+UoTEfbevo1owUEFBFcEd/IrgiJ+/N21NOD4SczwrO8MZlUg6zW+bzM9pGVOejK2s6Oe6JrHa9KhFEN4j08GQB44pU5wo8MftI+g4KhTalMOMleSJc4x+WMUS/ID05WZIMm17QBgAQbfgcxUk4maEPwgCSTEd1E2Ra5NgtftPUbnIeOoy8YKcQ4lMIB6kPcu2rKw8BS8/GAsrQenAKzcSSoGQYh0IPT2/f0fMS708W5tw10PD8QOHMZQW8w+7ezYRD466HnzMsSNwROWFsDKH3aMGvCTaVr3upv4cKCqZ1aDndfPLCKqz5nj2MkCgNUOC/yXDpt1M5R+4/M5WIecGGKh37jPxZOoEg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b840a6-5e90-4fa4-c26a-08dbb91a1369
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:09:45.1511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5xynKI6Rqc+XmfOJpLU1H1vwUfutnKIMKuNVw+bsRN1QTud76X/7vHx++ZAq4ofaJqMDIV6V1Qyoefgw8XmKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5859

On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
> Add per-domain d->pci_lock that protects access to
> d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
> that underlying pdev will not disappear under feet. This is a rw-lock,
> but this patch adds only write_lock()s. There will be read_lock()
> users in the next patches.
> 
> This lock should be taken in write mode every time d->pdev_list is
> altered. This covers both accesses to d->pdev_list and accesses to
> pdev->domain_list fields.

Why do you mention pdev->domain_list here?  I don't think the lock
covers accesses to pdev->domain_list, unless that domain_list field
happens to be part of the linked list in d->pdev_list.  I find it kind
of odd to mention here.

> All write accesses also should be protected
> by pcidevs_lock() as well. Idea is that any user that wants read
> access to the list or to the devices stored in the list should use
> either this new d->pci_lock or old pcidevs_lock(). Usage of any of
> this two locks will ensure only that pdev of interest will not
> disappear from under feet and that the pdev still will be assigned to
> the same domain. Of course, any new users should use pcidevs_lock()
> when it is appropriate (e.g. when accessing any other state that is
> protected by the said lock). In case both the newly introduced
> per-domain rwlock and the pcidevs lock is taken, the later must be
> acquired first.
> 
> Any write access to pdev->domain_list should be protected by both
> pcidevs_lock() and d->pci_lock in the write mode.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v9:
>  - returned back "pdev->domain = target;" in AMD IOMMU code
>  - used "source" instead of pdev->domain in IOMMU functions
>  - added comment about lock ordering in the commit message
>  - reduced locked regions
>  - minor changes non-functional changes in various places
> 
> Changes in v8:
>  - New patch
> 
> Changes in v8 vs RFC:
>  - Removed all read_locks after discussion with Roger in #xendevel
>  - pci_release_devices() now returns the first error code
>  - extended commit message
>  - added missing lock in pci_remove_device()
>  - extended locked region in pci_add_device() to protect list_del() calls
> ---
>  xen/common/domain.c                         |  1 +
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  9 ++-
>  xen/drivers/passthrough/pci.c               | 71 +++++++++++++++++----
>  xen/drivers/passthrough/vtd/iommu.c         |  9 ++-
>  xen/include/xen/sched.h                     |  1 +
>  5 files changed, 78 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 304aa04fa6..9b04a20160 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -651,6 +651,7 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PCI
>      INIT_LIST_HEAD(&d->pdev_list);
> +    rwlock_init(&d->pci_lock);
>  #endif
>  
>      /* All error paths can depend on the above setup. */
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index bea70db4b7..d219bd9453 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -476,7 +476,14 @@ static int cf_check reassign_device(
>  
>      if ( devfn == pdev->devfn && pdev->domain != target )
>      {
> -        list_move(&pdev->domain_list, &target->pdev_list);
> +        write_lock(&source->pci_lock);
> +        list_del(&pdev->domain_list);
> +        write_unlock(&source->pci_lock);
> +
> +        write_lock(&target->pci_lock);
> +        list_add(&pdev->domain_list, &target->pdev_list);
> +        write_unlock(&target->pci_lock);
> +
>          pdev->domain = target;

While I don't think this is strictly an issue right now, it would be
better to set pdev->domain before the device is added to domain_list.
A pattern like:

read_lock(d->pci_lock);
for_each_pdev(d, pdev)
    foo(pdev->domain);
read_unlock(d->pci_lock);

Wouldn't work currently if the pdev is added to domain_list before the
pdev->domain field is updated to reflect the new owner.

>      }
>  
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 33452791a8..79ca928672 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -454,7 +454,9 @@ static void __init _pci_hide_device(struct pci_dev *pdev)
>      if ( pdev->domain )
>          return;
>      pdev->domain = dom_xen;
> +    write_lock(&dom_xen->pci_lock);
>      list_add(&pdev->domain_list, &dom_xen->pdev_list);
> +    write_unlock(&dom_xen->pci_lock);
>  }
>  
>  int __init pci_hide_device(unsigned int seg, unsigned int bus,
> @@ -748,7 +750,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> +        write_lock(&hardware_domain->pci_lock);
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> +        write_unlock(&hardware_domain->pci_lock);
>  
>          /*
>           * For devices not discovered by Xen during boot, add vPCI handlers
> @@ -758,7 +762,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +            write_lock(&hardware_domain->pci_lock);
>              list_del(&pdev->domain_list);
> +            write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -766,7 +772,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              vpci_remove_device(pdev);
> +            write_lock(&hardware_domain->pci_lock);
>              list_del(&pdev->domain_list);
> +            write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -816,7 +824,11 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>              pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
> +            {
> +                write_lock(&pdev->domain->pci_lock);
>                  list_del(&pdev->domain_list);
> +                write_unlock(&pdev->domain->pci_lock);
> +            }
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
>              break;
> @@ -887,26 +899,61 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>  
>  int pci_release_devices(struct domain *d)
>  {
> -    struct pci_dev *pdev, *tmp;
> -    u8 bus, devfn;
> -    int ret;
> +    int combined_ret;
> +    LIST_HEAD(failed_pdevs);
>  
>      pcidevs_lock();
> -    ret = arch_pci_clean_pirqs(d);
> -    if ( ret )
> +
> +    combined_ret = arch_pci_clean_pirqs(d);
> +    if ( combined_ret )
>      {
>          pcidevs_unlock();
> -        return ret;
> +        return combined_ret;
>      }
> -    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
> +
> +    write_lock(&d->pci_lock);
> +
> +    while ( !list_empty(&d->pdev_list) )
>      {
> -        bus = pdev->bus;
> -        devfn = pdev->devfn;
> -        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
> +        struct pci_dev *pdev = list_first_entry(&d->pdev_list,
> +                                                struct pci_dev,
> +                                                domain_list);
> +        uint16_t seg = pdev->seg;
> +        uint8_t bus = pdev->bus;
> +        uint8_t devfn = pdev->devfn;
> +        int ret;
> +
> +        write_unlock(&d->pci_lock);
> +        ret = deassign_device(d, seg, bus, devfn);
> +        write_lock(&d->pci_lock);
> +        if ( ret )
> +        {
> +            const struct pci_dev *tmp;
> +
> +            /*
> +             * We need to check if deassign_device() left our pdev in
> +             * domain's list. As we dropped the lock, we can't be sure
> +             * that list wasn't permutated in some random way, so we
> +             * need to traverse the whole list.
> +             */
> +            for_each_pdev ( d, tmp )
> +            {
> +                if ( tmp == pdev )
> +                {
> +                    list_move_tail(&pdev->domain_list, &failed_pdevs);
> +                    break;
> +                }
> +            }
> +
> +            combined_ret = combined_ret ?: ret;
> +        }
>      }
> +
> +    list_splice(&failed_pdevs, &d->pdev_list);
> +    write_unlock(&d->pci_lock);
>      pcidevs_unlock();
>  
> -    return ret;
> +    return combined_ret;
>  }
>  
>  #define PCI_CLASS_BRIDGE_HOST    0x0600
> @@ -1125,7 +1172,9 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
>              if ( !pdev->domain )
>              {
>                  pdev->domain = ctxt->d;
> +                write_lock(&ctxt->d->pci_lock);
>                  list_add(&pdev->domain_list, &ctxt->d->pdev_list);
> +                write_unlock(&ctxt->d->pci_lock);
>                  setup_one_hwdom_device(ctxt, pdev);
>              }
>              else if ( pdev->domain == dom_xen )
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index 0e3062c820..3228900c97 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2806,7 +2806,14 @@ static int cf_check reassign_device_ownership(
>  
>      if ( devfn == pdev->devfn && pdev->domain != target )
>      {
> -        list_move(&pdev->domain_list, &target->pdev_list);
> +        write_lock(&source->pci_lock);
> +        list_del(&pdev->domain_list);
> +        write_unlock(&source->pci_lock);
> +
> +        write_lock(&target->pci_lock);
> +        list_add(&pdev->domain_list, &target->pdev_list);
> +        write_unlock(&target->pci_lock);
> +
>          pdev->domain = target;

Same comment as in reassign_device() above.

Thanks, Roger.

