Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A4F79D147
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 14:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600454.936085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2jy-00037v-H8; Tue, 12 Sep 2023 12:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600454.936085; Tue, 12 Sep 2023 12:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2jy-00034b-Dt; Tue, 12 Sep 2023 12:43:38 +0000
Received: by outflank-mailman (input) for mailman id 600454;
 Tue, 12 Sep 2023 12:43:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIu2=E4=citrix.com=prvs=6128f91ed=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qg2jw-00034V-76
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 12:43:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fabab64d-5169-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 14:43:33 +0200 (CEST)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Sep 2023 08:43:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5375.namprd03.prod.outlook.com (2603:10b6:208:1ee::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Tue, 12 Sep
 2023 12:43:22 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 12:43:22 +0000
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
X-Inumbo-ID: fabab64d-5169-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694522613;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0kYb5+Qn0qoz7b/CzaIPgKbYizgsNIZc8LMMvIlSzuw=;
  b=J8DaZcBV/ZIFFdFVy8N8dDja/whtQC1lTXAtBiqYCoTu98lKZRGwK5sx
   djqq9s2M6WXUYLGJGlh1QVrojiTmMDBTpQag/9Levd3nNAf5l80kexlJD
   fdXexvnOaqgks2JX+mT4PyaHkvToOp2gZXu+Fm79K6vK2G7d6Jfhj/41B
   o=;
X-CSE-ConnectionGUID: e0CCQHTxTeacDUhgn0rYSg==
X-CSE-MsgGUID: 2Oh3lnb2SyuSzV+r/CFX8w==
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 122246842
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:DGkIYKPyJo/onhDvrR1ClsFynXyQoLVcMsEvi/4bfWQNrUp30mYDz
 jEYUT2FaPjbYGLwLtBzbd619RwCsMDVmtJnTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5wZmOZingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0usvKkp31
 cAIFD0EZTy+h+2wmKiKceY506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCj22rGfwXmTtIQ6Tpq4rfpsigeo13EoGiNVTxyQj8nplRvrMz5YA
 wlOksY0loAp9UmsSPH8WQO5u3+OuhMAW9tWHPY+4QvLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseIawh8fwECv9w
 BiLqjY/nLQZicMX16S98kvDijjqrZ/MJjPZ/S3SV2Ohqxh/PYisYtTy7UCBtaodaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhkndC+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:cvqJ1KPQy3XUnsBcT6D255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2c6bQU/
 Gnl7p6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyqIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 p29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmckaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3h7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdak8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IRxlXFYJCgLT4PC1rd52GkinehT+Yd2t8LAT23FBgMy8eFKxWhfzDWzHkKOb0oci64PgKr
 KO0altco7exFvVaPl0NjLFKudvwFklIbkoU4UAKiWzi/OODLHWncrmV9uWDIbRMF8fKxDC6z
 04LXXOGPk=
X-Talos-CUID: =?us-ascii?q?9a23=3AW4NbMWm0iDd0y/4/BM+geDmLURzXOXCF51zpA3O?=
 =?us-ascii?q?oNWtgQ5GoSVCWoLlVqMU7zg=3D=3D?=
X-Talos-MUID: 9a23:3FPxjgbq1gXURuBT7Rjs3zVkPp1T8rmVGn5Oi9ItlfnUKnkl
X-IronPort-AV: E=Sophos;i="6.02,139,1688443200"; 
   d="scan'208";a="122246842"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H74tgK52N2ZXa+ApGsxhMhc38EsxmQDGlT8ZcqupePK/ocRCQeONNkxTf7bN5wRAJSvoYe+8YC1J1hXrcFmlxBKUbwsTZsNLR9BIvI5OgREa6J3R+5B9eTo7m/ZxFwqTC29vdfEKJsS7UDTdGKyIoJtHkVICxdTQ0UUeOLDWVb7KDHSQ57lKUtRlJFIFPRAyoNEaPZua6ld1Ih8EUO2eC0y3zvhUVHoFUnuy0Ekiw75+7CTogtVOdu5E3+0dy9SX1LOch+bMIjxnq6hg4BZJaESQMwmKmSq4/jyhXTYTdjQjBxv7Akve5rIJIQBDh7D715A49xC7QYCuT8B2hc0i/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRBvMra1lmS64FReeDF5pza9jmMIBQ3Lan0L+hv2AGA=;
 b=Jy1ZbovHoBmkVYpfkcGwcd1xUGlYsfeDWqLmuNZgPcT+k2SF0hicbv8jfe6miof8QeimlJ9iOH7PyK2Cq4vzm3m6q6Fi20YVpMsHc8iB3C3bEEI6VHF1Mf/7dlFUia7Gh7OELL8hdJSCjaLXxTRK3kBm5uv8Qh8A0Dx56lRx0fCC5ZW/WX+TzLjuVgPIEu764A6Pg9wj2yCHcyRfTbyfp+OVPO+bmvF16GjC9BUTzUXdEwn9XEZfO+YElaAdeREihhXelBcISuGhCv7MOTd0az1khQnJP5OZCWvQTgnvggspxJJK6i4AxPDHrauMDeQt7MyFW9CiLc726Q0Q3iGPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRBvMra1lmS64FReeDF5pza9jmMIBQ3Lan0L+hv2AGA=;
 b=txJ7wLu/2oSzk+z/RFQXHWBuTyE5nfABLUYGHBMnTxWi2C/HTYxr6EWH6mQvJlyjDacKD9lyq6OWiXqp+3qP4wLNS9XSx6gwZ7XGD+ydBdjpGUi38PoW9e1n/Psk3coInbP/Msp9XDGnWlUVz0/B4aDBu9tZ0R+sH//eYoPsQts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 12 Sep 2023 14:43:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when
 parsing MADT
Message-ID: <ZQBc4qccWlRJoDqQ@MacBook-MacBook-Pro-de-Roger.local>
References: <20230911101238.18005-1-simon@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911101238.18005-1-simon@invisiblethingslab.com>
X-ClientProxiedBy: MR1P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5375:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da544d5-be60-4865-1321-08dbb38dd90e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qmMHJJzwCTRAzyysLNcUdDac9FMA2IuQyZ26lUj4FpauC4GJsHzs0QN/83tvyNtp1QddU2s9mlEt4Ef6owl5gMpxM1YWHowk8k46OMhuPA2d5l8zqud4GTqxQXZhVt1gC6vj1vUo9StpHVceii99xyWpVEjBmhRRC3zEqKMRxbnlmZZMGeyNDE0al+1jRqfl4TQ/qhj0umEH7C1QFyKE3HVCKjffz7Uw7tbNvdWXF5Fc92vXbBW5HMfceejN7a6eCGgR2PgYvEPLwEbYyVynwBcAqz15+M5S3IjLdLKIOL5jYYHggchVKrBGPl6IgynQz04P1vxLgNMNXGQ7YJS4tnCQtzuUdaHzEhRh2KjtmXt3yJfNFZLUx1u6IE52HOdp/k7GFwba+/yvTLjEAG0aVEi5zTgSKWJUWdY/R3qt33rbQr2osa3SwliOvw5ccHMKCrB2BFpjnA87T0K6/+8944AtBVeXm2ndkdRBHiH2Xe8fubD912tq1UYfGBVGCYZT/N48gYNO+QqzNSsteirnmvM1pYz1TPr4rn2Ql4MZeTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199024)(1800799009)(186009)(85182001)(26005)(5660300002)(83380400001)(86362001)(41300700001)(8936002)(4326008)(8676002)(6506007)(6666004)(6486002)(6512007)(9686003)(66946007)(478600001)(2906002)(38100700002)(82960400001)(966005)(6916009)(54906003)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnRiUGdHMzVvVWVJV1ZQQ2tQWW5qaHNoZTJsM2hHamRJbXVQMVJjbVBaZDZm?=
 =?utf-8?B?MHNHVFU1SmhlZkR3THN6K3c5UWZHclVXR0NEblN4RHl3aW1JbnUxa2xHeTRM?=
 =?utf-8?B?SHFiRXU4dWgvdjJpa1ZiVHNlU3h5Y0UraUhjTHZkcmMrQW81MVhMVW1GSkEv?=
 =?utf-8?B?T1dHU3pZUytUUXArbHdtUmFrTExPdk0zcXFEVUY2WWtNVDNZTjQrU2lrNzB1?=
 =?utf-8?B?SDJSOWxuZXVKSzM2N1NkMkRVN0gzclIxWC9RbFJYdUxld2tucjBweGdzNlgz?=
 =?utf-8?B?WE1LeldMb3hzUllPU3FPM2FiSnNaSUlLOXcxL1lWMWdMN01XK3pMcDEvaDcr?=
 =?utf-8?B?djVsamFQY0hDa2UzTFdXQ1ZOV2FLbzdzM3dkT3djOHNNcGVOQ3VxdFZ2bE1z?=
 =?utf-8?B?cXUwSDBOUmtkOVdDQjJDOW53SVZJRWpnVndTQ0I2azFBVFAzU2kyL0xHcjd3?=
 =?utf-8?B?YVhpRnFMZ3VTT0NscmNJUlJGQlZYR2RTSFJIN0J0bS80a2Jjdmg0ay9KTlFW?=
 =?utf-8?B?cEJWZWVlcURreUhGUlc2dmtqc0ErYXdLWVVuY2RXdWw5cHpkMTV3ZDlwdFFt?=
 =?utf-8?B?M1pPa3huSVV0clV0U0ZXcjZyOS96OEtTTWdiV09pNGRGN0ZPY1dCVExNR0ha?=
 =?utf-8?B?Mkl3SEJSOHhVdlZtS0pwMHhRcUlMN2ZJYUVZS1hKSHV2eGtXVmFHWHJhVjB4?=
 =?utf-8?B?ZGk1dm1jNnZSaVFGNTJzQ3VienB4WldYQWFONVp1dUJmbW5UUStsMHgvT3Y1?=
 =?utf-8?B?NUZENnBsZjJ2MFVWcTlrOERRWmN6SDRqV1R1R2FDTWJNVFI4U3NhbVZvbmFo?=
 =?utf-8?B?d1YwY0RsTy9lR0crcmtFTERiQ3FmdldIdnc1WWhhbmRtYnpVS3daaUhnMmNH?=
 =?utf-8?B?bXVRZS8ycndiNDBxYXgwcFBtQ1VnSmdrU1VydVZZajdoUk03K2dScllXWDBl?=
 =?utf-8?B?QlROUVRxZndwcHg0RzNKbjU4VlpzdjBBbUVZYzdkWnBTVU5KcUlHL0dBUTQz?=
 =?utf-8?B?K1E4eUo5VVB5djhOL2Y5KzNCajB5VUtrRjJsTHZJR1dXOXNoZW0wSzNKOFVO?=
 =?utf-8?B?ck5mMVYwOUFYOUhZaER1OXZ0bnNYTEg3R1dCUDB6SkRCR2luYi9Za20ySGpQ?=
 =?utf-8?B?SC9MWElvVmg3R0dvcGc5KzhITWNWUzh3djJ3MkovcWkvb2R5bUpsVlE5ZHkz?=
 =?utf-8?B?Sko3VkJkMHJRbEFjRXBreVFVSG4wMzg1N2RjRW13MGZ5dkhQbDQvSWJjZE02?=
 =?utf-8?B?bU82SGR0UTE3M0h4WVRxUnYybFhmVnNFdTRSd2pxaTlGdmRNcEJrR0JkbVhM?=
 =?utf-8?B?ek9mYzUvajkyems5SUEvLzlhcURQMk9nbEtNbmRiQVRuSFMraFpaY1pKWThO?=
 =?utf-8?B?OWttQUoyN1J5aE15MDdQNjUrM2tRbnBjOENIME41L1dmZnJVS3NWOXU2Vmkv?=
 =?utf-8?B?aGxlQnlPMm01UnVhVXRLVGt2b09wT0UxWWkrUnR4K1RPNitwbHJITEUwUHVR?=
 =?utf-8?B?WGdKbVJLRGhwN1pIZytZWGtzeVQ5MnZOL2JGUU85ODNXS2xLaHdSTWI3WXhG?=
 =?utf-8?B?aUYvWVJtTisyK2lNY2tQVWJNRHZka2tkTWRTcnh3YzRCWDFSd3Y2T0hGbU56?=
 =?utf-8?B?WWRWZklLNEtKQzNXdnFpOGlYSXRFU1FYZzlEaWMxZnNjOVhjQXlKcFhHL2RX?=
 =?utf-8?B?ZWJWYndPMEU3VVM2cXRMYUVtYklLVXZ1VzEyTysvZTNkY3Qzd0VyZG9CUmJT?=
 =?utf-8?B?ajErNG55dTdXRnNEMkVzNk9VbVk1dUkwNThEU3o4Yy82V3lnSFZ2RTU5S1dC?=
 =?utf-8?B?TWhNcndOWE5VcEkxY3p3TGRyM1JhK0JlbzFrQTdnSU5wclpLbzc1cjFxTllH?=
 =?utf-8?B?WW4reTFqNUFQWlpIMXRXYUZlNVNrWlA0Q29pMW9NWEZCRGF5ZnBiMzJTRVZx?=
 =?utf-8?B?K2xkQkxFQXE5YkUyQ0FuejVUTThRdVF3RXJBRkJ3MHJqcm51b01mem9YVGZD?=
 =?utf-8?B?cUhNMjkzcDhubThKbWFPV3psY0hUME52RXFQQWNoeENzajJnS3BZVEt3MjQx?=
 =?utf-8?B?enhyMFJ5VTVsZGI0aUlqNURDaVVFeVloM0dtQzh3ekFMZ2FnUTNsUDdSZHZj?=
 =?utf-8?B?QzNFRGRPdHN5N1dER3dZbkgrSWY0ZXBNc3dSRDJMUnJFNlAwbldMaEEwbjlG?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cF2+E1wJHKv2zXuVy3BTPCp5+TbEmWhQOyhuX0s+rrP+zrUtQ7MNtvK8h51JXasAY673b+IN7MqhRQ44BZy9acwTvi2DkuBBC2gQS7ygJcEgIU7vZm5yQQ5W8SbsVzNdTXZikJvZ1/8ExJl66uZaauRN59mtllfA1dmrixT+Xek81bQJy3cTZFrRAJ8POmDAvJv8PhLGpIRgXGpXac/pmw+MebTr5nlHzWKvA9+LSRuizUAhE3Vm8CzIeby5aa7T/heZyG2WiRrCwGzFVhWZYL4uI4E4zXxrmopLcVR8LBDbnqVl1E0LPdoiZyRclPATZVsd+QaK6UDzy7FZZTmJmRmbHMQPSBTu9ma34qjQafibOPlB61+efNugyCqYYmqCxuNo5gnN3dG1946F0P0savudrmrYAdpOggjNiEekF7jbWQ047RiSbFLGuH9ScKEc6Kgh6lILgNFKmwG7JW/e5SewfDex/rh8npo77Ut88uVHpbqtGTOAxQrhVcMKRS4g/Ceta1i1GY6tcT3FqHtrD5+qYfhhFskokVCuDC2IMeQWdBLuX/Lu93ICUX073zbsTBaBO32xl6NJKp6ep7b9YCghOsC8Y7TqG5qzoN/kacTMo3DToj+E0Lr88H8ebKRhvcK0EskTMrCy/uDszoHCU7Dakq9sLoETMYBfkpHa1KkHoLDGFjCyCQ5261G2z7gEI5/SXdfplxOYvKuCyxhQOUx7A7/7Ia88c1vfmjjv+7hlANOlHDCzx3p/+GD2+0QK6WNcKn0sUuj1oZz84MEwqceQbw+ZuE2fQbrVMS8zizizHDHRuqVptioFECLH7OF12ap9CzrRHuMLk2zQ6NQkCErA4nMrEtHfMjKt+jGcSTBKZdQgkQiaTlEyOtFwM3m3
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da544d5-be60-4865-1321-08dbb38dd90e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 12:43:21.9634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/JatG2pqX0pGQUgrr+y8et+Fpt8pu+vTQEFxjOihcXAUg/MffURuARkJ66RSXC8iDCi6disChVjaN+xilNjpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5375

On Mon, Sep 11, 2023 at 12:12:38PM +0200, Simon Gaiser wrote:
> Up to version 6.2 Errata B [2] the ACPI spec only defines
> ACPI_MADT_ENABLE as:
> 
>     If zero, this processor is unusable, and the operating system
>     support will not attempt to use it.
> 
> The bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
> "Must be zero".
> 
> Version 6.3 [3] then adds ACPI_MADT_ONLINE_CAPABLE and changes the
> meaning of ACPI_MADT_ENABLE:
> 
>     Enabled
>         If this bit is set the processor is ready for use. If this bit
>         is clear and the Online Capable bit is set, system hardware
>         supports enabling this processor during OS runtime. If this bit
>         is clear and the Online Capable bit is also clear, this
>         processor is unusable, and OSPM shall ignore the contents of the
>         Processor Local APIC Structure.
> 
>     Online Capbable
>         The information conveyed by this bit depends on the value of the
>         Enabled bit. If the Enabled bit is set, this bit is reserved and
>         must be zero. Otherwise, if this this bit is set, system
>         hardware supports enabling this processor during OS runtime.
> 
> So with conforming firmwares it should be safe to simply ignore the
> entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE
> 
> As a precaution against buggy firmwares this change, like Linux [4],
> ignores ACPI_MADT_ONLINE_CAPABLE completely if MADT revision < 5. Note
> that the MADT revision was already increased to 5 with spec version 6.2
> Errata A [1], so before introducing the online capable flag. But it
> wasn't changed for the new flag, so this is the best we can do here.
> 
> For previous discussion see thread [5].
> 
> Link: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_Sept29.pdf # [1]
> Link: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_Jan30.pdf # [2]
> Link: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf # [3]
> Link: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2fe99644a01f # [4]
> Link: https://lore.kernel.org/xen-devel/80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com/ # [5]
> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> ---
>  xen/arch/x86/acpi/boot.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
> index 4a62822fa9..2d0b8a9afc 100644
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -77,6 +77,17 @@ static int __init cf_check acpi_parse_madt(struct acpi_table_header *table)
>  	return 0;
>  }
>  
> +static bool __init acpi_is_processor_usable(uint32_t lapic_flags)
> +{
> +	if (lapic_flags & ACPI_MADT_ENABLED)
> +		return true;
> +
> +	if (madt_revision >= 5 && (lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
> +		return true;
> +
> +	return false;

So this means that Xen would only support ACPI CPU Hotplug with
versions of the MADT >= 5?  Because with the proposed code non enabled
entries on MADT versions < 5 will be reported as unusable.

Will this work with QEMU?  (ie: does QEMU expose a MADT table with
version >= 5)  Otherwise we will loose all possible ways of testing
ACPI CPU Hotplug.

Regards, Roger.

