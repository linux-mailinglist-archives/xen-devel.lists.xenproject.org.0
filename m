Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7DE7C810E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616325.958236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDyu-0005cr-Pk; Fri, 13 Oct 2023 08:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616325.958236; Fri, 13 Oct 2023 08:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDyu-0005bB-Ms; Fri, 13 Oct 2023 08:57:16 +0000
Received: by outflank-mailman (input) for mailman id 616325;
 Fri, 13 Oct 2023 08:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lwD=F3=citrix.com=prvs=64352611f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qrDyt-0005b5-8U
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 08:57:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f0eb601-69a6-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 10:57:12 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2023 04:57:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB5970.namprd03.prod.outlook.com (2603:10b6:610:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 08:57:04 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 08:57:03 +0000
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
X-Inumbo-ID: 7f0eb601-69a6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697187432;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=HqiBDSscAtbX7em/2LYRc1zJfCQxg7kOnvJ5vqf2WMc=;
  b=cdnM8bDv/ABVlf72VZkMen7Hbw+4ELNGq3FO8hnDur2zUVIDZflqRAmI
   Bwt9grqG77bjOL3CKuH9AAlmCYb3Oy5WAX6aNDGPW4DdmzN0/F+YxMPFX
   wE8ecyBre/CfF1hWjFDEqPaHsmrUsrXIwbg45ZustlYkKoAp3BEijHdTo
   A=;
X-CSE-ConnectionGUID: DzJK9zZkQl+obUYfq8EnUg==
X-CSE-MsgGUID: oB7MF9gbRdqPYE7nMI1oiw==
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 128235519
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:V/pFXqrYcU9jx/qtNL7NkVweUxxeBmLYZBIvgKrLsJaIsI4StFCzt
 garIBnXOPePZWvwet93O4y/oRhT7JDUnIVnHlNq/C1mQi4U+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGziJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABwfTDPSldC1+bb4TeNRt8o6fOTtAYxK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKMEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhCTublq6c76LGV7ms5Vzg4BFSxm/Wgsn+TBNR6C
 hUT+zV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcWSDowx
 xm2ltXmLTV1tfueTnf13rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseIath8DxMSH9x
 XaNtidWulkIpcsC1qH++E+dhTup/8DNVlRsvlyRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:PWq1wayTsGznpRTe1yUeKrPx9uskLtp133Aq2lEZdPULSL3+qy
 n+poV+6farskd1ZJno8erwfpVoZUmssqKdhrN/AV7CZmXbUQ6TR/AF0WKM+UyQJ8STzJ8s6U
 4CScJD4b/LYGSS5PySiHjaYrRQuaj+gd3Y+ZagvglQoBlRGttdBmxCajpzfHcGNzWuMaBJYa
 Z0q/A36gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1od5AyHnVqTmfbH+0zz5GZkbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819pqHqW3+4ooAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6knWYnq+rXLWqkrdOQ4VmjrfIGKj8DreSI3CNXwH4vN69M1km87imgodVNIV6t
 MD44vWjesSMfr6plWK2zH5bWAfqqOKmwtUrQcytQ0VbWJMUs4akWVYxjIYLL4wWBjX0aZiON
 VCLPyZxNs+SzKnRkGchEVX5piSUm8oHhGAK3JthuWQ1TVroFBVpnFotvAiog==
X-Talos-CUID: 9a23:KH5FBG/JrFNOY7g+n1iVv2IGOON0YE/e9XOTJEWFOGhwGJCTdFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A50dcWQ92G9yN4MhTvGku99eQf8BCvIGAWU8Hq5k?=
 =?us-ascii?q?fg/ipaipVGm6ajSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,221,1694750400"; 
   d="scan'208";a="128235519"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExXT0f3HhqY6N3d0cStUI15nSwrEDLEcYLfsmD3lcFM23S6UTKDXbIv72+C4kM7biVISVJcrk8Ab5S2vaAgJjuGJZ/yK48vgf7nlmwxWl2g5VrsFSwNIwjtmLJDeUxsfJQWFAsc6cN60YLBJkrSV0ila4fMyugdOCYg3kqQvEgmtQ2sDO4lsshfvuYMlXhgTAXPg8a26rzrn3j1FzqKLQSjgR9LB1deiuUyzEgTBos1ri3ol5H1rR7Mbl8t8Zf0oW6UCv05c0jSWifM1axDy3SOkjBX4HeHqJoP6B79TToU4glh8Jp6crmPh6YU8a9/dGSBYdsPCsGP3EyfuGUToVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77H2C9EPKmrWnBk3ms8fMnbWqampqnWeb8VcPihyer8=;
 b=m95rohWxoq2JB30g/hl3SGyfHUfJYJ3zKy//bFJIjFQPoncvzfrqG47ujEDVQzQdhUbfdDY3ylI5m+wdbLMHF0CquLBNq9/pUtFxRf+7Ubeprp8/hQ1F8S0HpAZL7oCqOODzbVxrUrRCOw46efEotH+sXvdDmHMCEJVu66ej18NgSu50N3zyVSsVLaFGwsLoRhcC+BCZ5cnKZShRbnsdpfc6YktaiaseYlmcm3TXwfPQls3qRbtQQfx+UZuzDHAH41N0DX7E9oSeumcNz6FUPXfYUG5NID6X8NxiT7A84b/FaVV1XSjEY7Mer+v2Hn/0wt7vOdsZq82IbuwtOWKTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77H2C9EPKmrWnBk3ms8fMnbWqampqnWeb8VcPihyer8=;
 b=u0BUMCVL6mComBW+WRNYaE09RsQIOD8+ZXQqtHaqyhAFDqa1UcKT5lS1Nn4XY6Qa16WIiyP6m6eHec/QCisn3row25MPCrPiqT2k/zuEeX7CeoXY240RK2i3501pYeZsQ3eTq4y6F2Wn6vXrt/RDt9FjYa1DmiVqQAxTpI9Re7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Date: Fri, 13 Oct 2023 10:56:54 +0200
Message-ID: <20231013085654.2789-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: f1458f1c-0aa8-4a23-00ac-08dbcbca5eaa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QtZYUbaEYpuPVtp0zEozLhmO3G+jvDhzuUc3gNpk+7Ez8IHqx+mL7TlMtAB3U9uKF16bAI4uEMAY8Wy77Z/4vBOfu7iJhxbnmNdMzmJBRAMgHQF3dADGfyo/FSWKHmUmNLMdlTSNQyhjF/sj8ae29906mllCZV73PqizXzJ3+pPTJAwLmkZmzppxEB0fe/RPCkIrNWuc8SpFmSBJHr8o5g6w9oEhPB4LrbWEgTfT/MM78Y8tbb5zFLvryRX2RoKmLO+Y3LfqDtzojIX6ZW5bFOQq1Dz74wmOLUN3t74maSFbX9x3JB5C3oUJQ9vj/tJUObuixMtXR34R2bO/O/HJUaGeCiLEW1XkaNFrZSNDefJqmf69yUir97IKrQEh09be+sLdHHaWLsVLMZOTKBcTeL+uxi2bN2MRLTbXjpdCfGhWT+b4HzIb/r57w9dkkQ8AHNf4Z1h4jFrOW0JGBTV9ifR7L1XDV3f9i0ktpyDQWajhiJS3kN1dz6VdGYO2dPOQavkRMp4nmwqIG+DEZEM15BnS8tAdOekfTZLRrE3HmU02p/8dNCnGRwVxsGi6eONQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6506007)(83380400001)(26005)(82960400001)(38100700002)(6512007)(86362001)(4326008)(2906002)(6486002)(5660300002)(8936002)(8676002)(66476007)(6666004)(6916009)(316002)(66946007)(54906003)(66556008)(41300700001)(36756003)(1076003)(2616005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aytyWjZoS1NlRDRVRlY1b09STUE4OXFqWVU5SXZwRG5wU01pTC9rZVhBajdz?=
 =?utf-8?B?cHJQSGFyWEZjTmk4Zlc4eUpEMDZEekFVRkdZL0tBSXh2eU8wZHVzQ0NrcGgz?=
 =?utf-8?B?L1lrd3BhNE5nOGdLbDhBM3RHbWo5dlZhWkZ6ZjNaZUhBdGlKRXlHVlFwZ25P?=
 =?utf-8?B?emY5Mlhkajc0YlZ6R3hIdWlVRU1ObkpZdkVtc3JNR0xkYngzZTZXSGZCMHlS?=
 =?utf-8?B?dUtRd0dtTU5tNXEyWmo5ZXpNV2Q0SzF2eVZwZ0RqR2YyVHppdC9CZzlpcXpl?=
 =?utf-8?B?UHo2OURmRmF6RmVncFV3U05GdlliTkRDYXNuRTIrckNVZnZtWlRkSnZ5K3Jn?=
 =?utf-8?B?MjJUR2Z5c3p3cXM2TFR1d1RoS09wVnVnYmFGUXYyYnZOcXBidzcyMnNMS08z?=
 =?utf-8?B?NkNKWmw1OXArVjl1cm12SnNWV3IxZXhza0d2TVJhSkhZTEZBSXFGc3dCdFhj?=
 =?utf-8?B?RFk0a2luQ3RYREcvRUV0UFl0NkxFS0oyYkZnL2pNdG80OVFWY0N1dFRDd2NE?=
 =?utf-8?B?SkhzQlhoMFVLU2hkTk9YdGtxQnUwTnQrUEhzS2tnUEZCdmZnbkpjUEh4T1dh?=
 =?utf-8?B?THQvMHh5UmVUcGRhVXVnSGpJVUplVGUzK0s5ZG9ucVdHai9OVUJmVHllTi9I?=
 =?utf-8?B?NUd1MGNGUys2Uy8wT0hocTRLVksvVUEzalppTWNxdWdtYUMzdmZuYW5YNGdv?=
 =?utf-8?B?L2RraEcxRG1ZTTQvQXNFTTFrV2w4cm5YSTlCT0x5aG5pMFdXZjVSOWx2d0Zl?=
 =?utf-8?B?RHdvaGluUmpMZERZVEZIOWRVb2FFdzRLSDR0Q3RxcVZicDRTNW9PK3V4T2JZ?=
 =?utf-8?B?ajRJVjNQaVFna0J5cENES05Yc015WVJ5dG5JaTNNaE0rNVBCQXVuL0pXdDV5?=
 =?utf-8?B?S1ZLQTEvUHM5S2VvWkNsU0JBYXRjZzBiOSs5Wk9nYkRBNExZWWhNTHlLSDNQ?=
 =?utf-8?B?cm5KNG8waHFQNEUwZGpTTjJOb09UUjR4ZXc2dm4rS2xKUGpEdnFqaUxxY0Iy?=
 =?utf-8?B?bmo1UENLN2xQNjBtSzRaNHhJb3lhZGxSb2pZTVlCSDVvdTRwVDNDbFVlL09u?=
 =?utf-8?B?Z0cwZS9JanFqRWFjZFpNM3pnQlhFYTJhaGpPeWQ2dEhtU3liRll3Wk1JTzZV?=
 =?utf-8?B?MFZIUXIwNXBHVC9tQklFNlgwTDR6VG9FdURhazBhVzZGYVp3RFpuYk1lMk9x?=
 =?utf-8?B?YURoNmlpUGVMTHlDQ3dWZXNQTWx0QUlocVpTU2hHUnJaSnprKzRCNkNNdDZW?=
 =?utf-8?B?RmlzQmRXZ2dqeDlLdG1HNll6Q29xQStHNThEd00waEZ2S0t3SFF0VXJ5MW1Q?=
 =?utf-8?B?MHVvYnJ1R0RrbUdMN0tDdGhYY3RoVUVuNnl6NVV3RUtwb3pBL3I1MjFHSkhh?=
 =?utf-8?B?WFBVeDZJcTlCL1Fra3FIOXo5N2Q5d3kxNTJiTk9ZVklhNFBXRjZqWUNzR3hu?=
 =?utf-8?B?Q2lzTGJJb3pOL0tHRG5pV0NjbkZEcE5zOGg1aEpRZVZEWDBlTlI5TlA2cmpl?=
 =?utf-8?B?OXFiMFdDK2FFdjNEcWk1eXozQWxTeWdFREJQNitwc0k5OEJZU0I0UXN6ZGlx?=
 =?utf-8?B?ay9sMkNoYlIwNGVJbEJaN1Y1SnBPYXh2eDd5K2Y5bzR5eWFocTF6a3RkazJ6?=
 =?utf-8?B?QTVxMUdmMHM2OEpwcTRnNmQwNU5sOWNxelJwVUgrdU9VbDlRby9tNWcxR2kr?=
 =?utf-8?B?WmdKR1Vna0dWaytkTTFwUVVZU0NQcG03YzRXUUY2K3RqVDFkanIyTVlYY1g1?=
 =?utf-8?B?N0JDaHZnQjVGSTdkUjcrSnhFQ0NIMDdPbWh0UGJBSkI1cVBmbXIyMUF4NE0y?=
 =?utf-8?B?OFNDQ1U3RU01TW5UU2VLUmJTbDk3NUZSNWMwZWZvVXVaUS8vTVVzREY2VVdJ?=
 =?utf-8?B?WGdyekp6MWVQSFM1UGhXU2ZqTnNlZzdrY0M5emtsTWdleHV3M1VxM0NNVHA0?=
 =?utf-8?B?MjBvY0I1NU9FWWJhUkx2bXpQZDZPN2kvcDVyeVFsZ25OaUxOQkdsejBJbjB3?=
 =?utf-8?B?QXdRVy9Wdmp1ci9pOWZCTTJRcWljZ1JZQTVMcWwwWFBWNkp3Q1FiR2lTcjNq?=
 =?utf-8?B?QUxWTzFpQ1hQOXhvSU96Mkx2cVZ4VUtyUHU0OVhUalJ3NHR0OVZwTEsxd3Bi?=
 =?utf-8?Q?xCzBQ36cSyZr3EbSc5YHYNe0j?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ISyTFgXJqgS5cg2RUbLZeXyDAV0D7SCtY4vjILZ4oeeFFL07TWYcNZhFFRDhEexOJ5R9tjd6CKVaA99gYhnAxWnQYmjlA6peBVkIW7TLNDX12EgtHPuX4brOpkPCi2EBtxcNAt4uyVjr5dTyc+OAHOy0X99G4SSfpd0HyrXLmCYTfPQV4Ad6W31EgFzGl5jpL330nh2250btqKDc/roNkpgsWpCchmqzKAKjqYRwtyPUludNQNbrylQd7+ft5pVEdwT4K287zzRtO5yewqzJXBjWZqBU+UJ3M+9B7AHlg04vzlucIFTobkudvFpJOhGCMNIuDEHP4wYDWh5QjZ5tfIsgstAIvqBLbFSPLRkknEp2moagT6X8yuHkNayPZ9fDl50eOScBuS+li2VuFqHTjuFbBHzrQyZyLMGHCpHuUPeIeB3MCRiwuCshmVy/jBSGu7h5BJ4YOnOhbtg8/VsLL3KjmI+9MUaKsBxnBuylOBRO04ndj417KIX1gU9DDVarWnUIIv2tmWmK9ApajEZVbuXlUN4t2BIX+EgL0wNbLjWpAchjbXEQDPg4v6cMsCo07gobF0VUaaVzC8ELhvjwYYK/Q/i/Lk+2LrPSUMjjEcuIgHsDfHnd8QPEDE1YQH2D+HS2xI6lQW7HP7lNARsZ+aQuvTtgFj30l5gnrUj8QKOfvTiKaympK+kD6rne9hZQNXfBy9FNflWGsLgeyvgikS8t4q9FtGG1hEmHCRJrUYYGWySCWqnc/J1foD1E+kOpLd8sp5qYYWF5mSM1Xjvq0aRMnwHuEmdcJYfQVk7QsguvRKKaDto/O1rs292LqcBYFAk0uxwZB6OS3KgNndRsG1PzvmVWzbsdDsRmterWAXs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1458f1c-0aa8-4a23-00ac-08dbcbca5eaa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 08:57:03.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twb3HFOhyuGqCy677Oe9vkfHRL8UKDN1zeb69EtjaaMnkTwZN+nlZ+PyKhAvGLWon3foWGj+y2W1q8T3htNpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5970

The mapping of memory regions below the 1MB mark was all done by the PVH dom0
builder code, causing the region to be avoided by the arch specific IOMMU
hardware domain initialization code.  That lead to the IOMMU being enabled
without reserved regions in the low 1MB identity mapped in the p2m for PVH
hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
faults until the p2m is populated by the PVH dom0 builder:

AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0

Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
Opteron(tm) Processor 3350 HE).

Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
arch init code to create any identity mappings for reserved regions in that
range (like it already does for reserved regions elsewhere).

Note there's a small difference in behavior, as holes in the low 1MB will no
longer be identity mapped to the p2m.

Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Reword commit message.
---
 xen/arch/x86/hvm/dom0_build.c       | 22 ----------------------
 xen/drivers/passthrough/x86/iommu.c |  8 +-------
 2 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index bc0e290db612..979db7d1ec4d 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -449,28 +449,6 @@ static int __init pvh_populate_p2m(struct domain *d)
         }
     }
 
-    /* Non-RAM regions of space below 1MB get identity mapped. */
-    for ( i = rc = 0; i < MB1_PAGES; ++i )
-    {
-        p2m_type_t p2mt;
-        mfn_t mfn = get_gfn_query(d, i, &p2mt);
-
-        if ( mfn_eq(mfn, INVALID_MFN) )
-            rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
-        else
-            /*
-             * If the p2m entry is already set it must belong to a RMRR and
-             * already be identity mapped, or be a RAM region.
-             */
-            ASSERT(p2mt == p2m_ram_rw || mfn_eq(mfn, _mfn(i)));
-        put_gfn(d, i);
-        if ( rc )
-        {
-            printk("Failed to identity map PFN %x: %d\n", i, rc);
-            return rc;
-        }
-    }
-
     if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
     {
         /*
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index c85549ccad6e..857dccb6a465 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -400,13 +400,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
     top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
 
-    /*
-     * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
-     * setting up potentially conflicting mappings here.
-     */
-    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
-
-    for ( i = pfn_to_pdx(start), count = 0; i < top; )
+    for ( i = 0, start = 0, count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
-- 
2.42.0


