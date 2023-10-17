Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680F7CC40F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 15:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618244.961645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsjqH-0007dg-6f; Tue, 17 Oct 2023 13:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618244.961645; Tue, 17 Oct 2023 13:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsjqH-0007bm-2K; Tue, 17 Oct 2023 13:10:37 +0000
Received: by outflank-mailman (input) for mailman id 618244;
 Tue, 17 Oct 2023 13:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BgJ9=F7=citrix.com=prvs=6472a2412=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsjqF-0007bg-B1
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 13:10:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 894c46f4-6cee-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 15:10:28 +0200 (CEST)
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2023 09:10:13 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5897.namprd03.prod.outlook.com (2603:10b6:806:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 13:10:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 13:10:09 +0000
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
X-Inumbo-ID: 894c46f4-6cee-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697548228;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=todqh5vCT3K6790jT/LVcMC5BwvoYx2Ed8HNF2Af/Xs=;
  b=IIM7kRNGyods3mCFDCP6eaxH5pHMqFJP2gevOl8RTGHxo09EVAlGgwAG
   CofpCbTOqmmskSVMIQ33BX9OuZLAj9MUqW7pa7CjhrYDxI/f3Tn3CqmzF
   FV2qc1TZ6BcEUODakeiUdiqhzWcGmmSjIuTIhfTc6voHwRl9lV0TY2jar
   I=;
X-CSE-ConnectionGUID: pkI4cggCQHm8BTOVZzRcyg==
X-CSE-MsgGUID: H6tXgyuXT6C6+BHrCmxB3A==
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 128594362
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:v6fJP6piFQeSkjUykT6KZwWSi15eBmIwZBIvgKrLsJaIsI4StFCzt
 garIBmOPKuOMTP2c49yaI6y9U8EuseHytFlTwFs+CAyHigb9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGziZNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACgOT0yIiO2d+ZK+GsNQofoRPvPgLYxK7xmMzRmBZRonabbqZv2QoPV+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeGrbIO9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtJPReHjqKQCbFu75jIPOBIHSGuH/9LnyWSeQflaO
 2ZP0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBq19bqKrDX0JSkcK0cDYzMJSU0O5NyLnW0ophfGT9ImGqjsiNTwQWv02
 2rS8HF4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:QzYtMqmQ+atLEm4EKPzQ7Bu0giHpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-Talos-CUID: 9a23:uD1uRm+uU3yHF9f6YbaVv1YXO5wufXL29VfVc2WELlhbWoeeWFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AAN8A2w7wAzhWUQib1e+mivuYxoxIvbieB1EQoal?=
 =?us-ascii?q?YkJfHHwxqEDKNpm+eF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,232,1694750400"; 
   d="scan'208";a="128594362"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5e4k5SEA50VOQXaiLPZ1zDoE47qMrbyN1IaO/Qi/Mu7jaf7yvsv/my76mH62+BMAQjIoMKhnsZtWRlUGGZdIfNOV+K86Qg/cNTb7CQluzyjUjUY4tfR15Id6KJOWLwusIGn3rAZcTt+Lp/kKClCYl48XaFNDF28AZ0tqAUA3uT+SrTyJDfC0i3+7jhiwq4EKAgVPJUO7P3reS4tdgZSf6Ngubq8wBKBMW/eHDYn/o7FGttjoQaUd0Yg2PFQz+94Uo1N42URX1adhoPcYQRElzaFnoHnJbvtc9NwZ+H8GYpJganMnplHR4hX8PPv3beJ1fhCeUoH0BLfP//0ZVCifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3Pqfakh+wivShd6JtJSI6AU5g2VmHIJhHRDI3lyRBY=;
 b=GtHyCQVOYHFwcTt4t/5CB6vU7rjaq0QNmjWe9CV9tc3vmKa2aT+PGbaxggkPxrfb+Fpcu3GTcIHhlqpf3Y2L3Owvh2mR9xb5KpQRTyLCSZZN3MLhbagXrZLYq83DnPuE44ZbeIUhoASnVD28gcUK7UEkMoKNwSKhawKLDpRwUWR/eiERli7sRwNNGWUw2qh16A+rJG9tdnLPaTbVVG2pZksYVt9EDjiR5mk7j28Kg/AO+rLso4Sx7g8kvDhbCPiO7lBpxiK95cxyJQlzd27TJAU3XZlXOMooIhPPzNyIFzeX8LE6jcyuq7/C7WbRMiLd5gWVGxhsaa0oiDcvVe7SPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3Pqfakh+wivShd6JtJSI6AU5g2VmHIJhHRDI3lyRBY=;
 b=qtSYz6GxFpcTZym0KcldO4ELl40+scwCiOxYtny243YTDOCVNiphsksld68J9bDEVGJVfGsZtcHYX7VHbD0733BGtIjIAhWeMa2yX9wSuInvaRc/pOtzFF8Q6VnAIJOpO3uygsmH6TB+nlAkFXkbPjjAXe/bIjuYio0auhoc1+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH for-4.18] iommu/vt-d: use max supported AGAW
Date: Tue, 17 Oct 2023 15:09:43 +0200
Message-ID: <20231017130943.18111-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0205.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b548b2-81e4-45a2-7424-08dbcf12639f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1Hl2yFdcbx7giahJAZzxjaif2hOkbDAlei/3pY6dgLn3wk51BCZ3n44p61hgfKW1hXnJpGF4RyKoQcyjhMQSEs6rgHowWgbIkQxZaCI3T5wA7BurLFBi9pRlKmhBnwkgIpkpz5nTdf5Zwyr5KDKg2/WpeueScv+HxCb/+KRHHwMYLtI4ujLhtw2ir9rDFZBnsdgwlJwzdSe99JRY0rfMuyk8Bcoqff/47OqqeSQzaoz5s0ye/XfcHjIj9leIfQdw/ac7/UNDmYx6MQ7JfL26Ili2ybfi3QcOb94VrjRETYCGh0gX/uQVFAH3bgUIJmGifp7rpq+vNTEaxJn5YKzG38WIm1a6h8wa1KUaOzuMoej/ITeJHmB1lIOT537iZ4e7ztTQV1ekpT2uIyptFPBhJMBdPfLVX2KnGJLf2vbBEpxOvom7ySf78yjpUXA9qXi05hXMI3h4w4dbJ0Rf2Iy5QmvI9+8GtqP/RQM7lJnPqheE0TTBRcF8j5lF+HBQIANbEi2wMoLL9b6psbkj7g/MvBJdo8cl47DVmmGtynQikHvncZNmFkdUjOsOmMhJ+Ej
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8936002)(4326008)(8676002)(5660300002)(2906002)(41300700001)(86362001)(36756003)(26005)(38100700002)(6506007)(82960400001)(1076003)(2616005)(83380400001)(6512007)(6666004)(478600001)(66946007)(66556008)(6486002)(66476007)(316002)(54906003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1k0N2NXWkdXL05qeFQ5Zm1McExFVEdSMjB5WDZ5V1g3enNWa1hLUVB4cU1Q?=
 =?utf-8?B?NDJlU2JXQUFQUEJ1eHprSEcxZ05wOHZLQ0hoS0IwSXhIenhhenk0b0ttcmtF?=
 =?utf-8?B?eXRZcEFCbDdEbUJnbzRDclZzVHdqakp0UjFwWWlJNys2VzdqQ21leEJDTi9T?=
 =?utf-8?B?Q2gwTGhFbUZ2U1RqVGozclBzdGVoamRhckVVOWlidDdaTmRYQ05MeW9FOWI0?=
 =?utf-8?B?RnVOZVFabW1pa1B6QUFIUkt5Z1VFbk5VRUtrMXlnRlE4VEVUYW5DU0EzZGNi?=
 =?utf-8?B?Nys1aTVnOG83ZUc2N0ZlYkVyaWp6TE5LSm1zYUZvTjZLS1FvZmxOMzFYQ1Jy?=
 =?utf-8?B?Rm5vNnozTzhVYzVjZmp4aENuQnZYNXJMbUtuYmtmUVN2NzNhWnpyMTM4ZzM3?=
 =?utf-8?B?d0VlUHZ0c0tNK3BWZFJYZVBmazlmKzhVV3h1dTZoWG1aYU91cmYzQUVvb3lm?=
 =?utf-8?B?T3RXNTR0YVdTVWsvRlRhOFlUb2txUGh3dVA1R05IY05QQWZkN1hlNXlhaVo5?=
 =?utf-8?B?QWhSMm5NaGVkQmhGMzZRdlFLQ0F2L1BnRFlBMDZ3TE81enVnWWM5dkwzWUVO?=
 =?utf-8?B?dU80TE10dmVWeVo4SXN2SEhHbVFIb2JPWnJicjFtT1VSN3lpR3UvRXpObzBy?=
 =?utf-8?B?bVhJNzNzbW0rWE5RNTdkSy9iekFwcUlacU5OcGpoazlVdkoyTm80RGlJZWdF?=
 =?utf-8?B?OC9ScXFQUm83dm5GL2NlZGtOVEVDU3VQWHAwR0RqU2svQVZhTHVrUEN6YVBH?=
 =?utf-8?B?SGExNUNjWDJFN050Y05PUHRHNldOYUNpS0NOeUx5alA2SDFjU0lOZS9rSGNC?=
 =?utf-8?B?OUdIYmpEZUJUQVpUdWZ0MlNCR2dlQmRRUGRJZU5XRjRpU216eG1NNGtrUnZz?=
 =?utf-8?B?Tk5wd2hDdzg1cDB2MjUvaER2NFFScHE1WTJnYjZlODArcjFEZEdPUlFGSVR6?=
 =?utf-8?B?cUVnZ1hSbkM2M01oMUx2cGQ1dml6cDdFQ0ZTQXFzOHJ5NzJOSVBVU2VmZjdL?=
 =?utf-8?B?bU5VY0lRREdqYUZ3SjBSQ2I5Y1hiL3F6Y25KWnVHbE5MeTNrdEsrMnNPS09W?=
 =?utf-8?B?ZVVoQjZSeDJabHZ4aWpBdEVWUi9jcUk0L1ZQVExockNsT0JCQStBMnR2UEJO?=
 =?utf-8?B?T2FnNUtrS1BsWjJKRENJOUQ5M2hnUVluMVh5bmlEMGZaYllmU0VmUDh5Sk9H?=
 =?utf-8?B?M3FDVGl1L1hIZWlDcCtmbm5uQ0FvdjE2alFlRDgrbTIxMi9TSUY2bExER3g0?=
 =?utf-8?B?VmZpU3lPcUkxMTVUU3RFRWdWRERGTzlKNUFGQ040NG9tOGMrRHVvR2NqZ1Qz?=
 =?utf-8?B?T0c4b290Zlp3OW1UenVGeHUvUGRBMEk0SS91Y0JCTGZxRHFkTDF6ZXYrTFA2?=
 =?utf-8?B?TGxncVdQTDQwbUVPTVo3YzRTWjBBYkszU3M4UXRtMkdnV2JsTnlMZlNlUmVm?=
 =?utf-8?B?RDU4eHBSOXBDK3ljWWFKYzJ6M0pCU2EyaG1kQVc1S1JhTHBTVGd6aC9WZ1FE?=
 =?utf-8?B?WkNsMEZhdE5hSE9lTXV6eHB2T1ZjTU5XcWFZTmh6aC8rUUY2clI4cCt0aTli?=
 =?utf-8?B?OEt6Z2dXdUwyV09MczhrdTF4R25UY0J6UWVkcDJGUW9xcDJyelRVWDB0Z2E5?=
 =?utf-8?B?cmMzUjFDTGlHd3RZMEdxOU5vZWcwVXRTUkIvcWQzb0p6YkhROVF1WjVSRGZB?=
 =?utf-8?B?elVNVmpaRGVrcmcvQVIzV3UzbXVoRllQM0hoS0wwUWg1RDVSUEpGVmkyYUdu?=
 =?utf-8?B?Mm5Ya3VVdGpnVFpoUlF3OTViQnFjbmZJM0s4allQdStMWVJiWlZXWi9kUWxX?=
 =?utf-8?B?dm1QWkQ4SjZWNjhDdDhZcDVHOEVPVlJLcE9HU3dhVXRmdWpwd04yNWNEcTFa?=
 =?utf-8?B?bkU2aDlOR3hrSVZzSDNGMk9QUkFGN0RpaG0xeEtrUGt3c2wvQ3J5dmQ0MERX?=
 =?utf-8?B?YTdvQ3J2Mm9pdFd1NER0UGpXNnNvRjdEWm9nbXpiOVlsZXgzbmZDSXA0dGxF?=
 =?utf-8?B?TEJsQkxJVlBhRFdTNy9wZUc4Y2d4SlNReFh2SDNFc29aU0NCbzJKK3d2S1Nh?=
 =?utf-8?B?SWdWOU5nZFBZQXlNdTZEUjlYR3V4SXhjREJpMUhnK1AvV0Z5enRCS2xNdlkr?=
 =?utf-8?Q?CIAyc0W+fG/dvvHIDLm+KUXjO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YpZd5MP1wNUZysb1XLEiW/t4mhcSjonBSIquM6bhp2eYaNzuhT8WGdWuud/4bSVH5rrWpGPjCvJEIISKbt7ahpSVZ60GgOZGEsdQiZxdWVQua4UPX+joLD8QJb1c4tHj0sW9equ9qROBm4aMRvR4hXq8z76rq9QXv3gWm0Wp6HF95YBjG6SYcFHV7fEH8IfFykIayPW0uUIPjSSyJa9JEhO7D/k6auuPFITvR7DBgZOzOaU/N6CACTvAl8Wq3lT7ygQiQZaAlY85NSMKGFM+TsBf3XDrUlZM/XBRNDqEj0NaXSEN4veXDUtVkVer+bSo4Y86nW8z77ZYPqpJSYLnvKO/tHKFo+9ZWZ4jx3Rqml2XlAE21hCbVghCGKwjbO9YuMWGTgoJORWoxRwftHg64BV5+ZLbadnGyZ9yzGaE45vA73+QGZIN8Xq5WgEZ/KcyxCPy1MPNPx3RCMMxXOuULZ0XOwBv/KxqKG+tkL8UInMbPe6sZLMX93Q8NgWR3owPPu3+VOq6YmlCYBpCln7K6t5PNGncFWX3x5iZ6S+t1I96iRISW+jKqFAEsy4D3XzcuPbzPPu1Ekst7f+o5wkSFfJ65JbuSYFXiJ0PbwT0/2xSt5yeQi6YDOyxCbvOfA/KlVvGInkSfK+cLSI14ioGYm4ziz5CbaNzX10MGeL9rAGgHluHFwDJ1iiSJtuVKvfsohs/j6m9lEibpoRmfOMA9Q76astgunQZiFi3PQBhW/Hyk215PzoinSKoJX+2cnNGnF8ix7d2cpwk9yKQNLsYHOQJ0iTaxNOmp/nkMEJDJCwer909V7Yqzw1LT1BJ9Si9VIYG7C7Nr9oopfJpK4n1qA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b548b2-81e4-45a2-7424-08dbcf12639f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:10:09.4041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXRV3fk0NC6rnaYh4r0MNRWTxjFlTohyWh6tzJQlU2nenUqkBQV9ax3Qi1TktCDWfr6WQMFMlj9Zr0fvibDvdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5897

SAGAW is a bitmap field, with bits 1 and 2 signaling support for AGAW 1 and
AGAW 2 respectively.  According to the Intel VT-d specification, an IOMMU might
support multiple AGAW values.

The AGAW value for each device is set in the device context entry, however
there's a caveat related to the value the field supports depending on the
translation type:

"When the Translation-type (T) field indicates pass-through (010b) or
guest-mode (100b or 101b), this field must be programmed to indicate the
largest AGAW value supported by hardware."

Of the translation types listed above Xen only uses pass-through (010b), and
hence we need to make sure the context entry AGAW field is set appropriately,
or else the IOMMU will report invalid context entry errors.

To do so calculate the IOMMU supported page table levels based on the last bit
set in the SAGAW field, instead of the first one.  This also allows making use
of the widest address width supported by the IOMMU, in case multiple AGAWs are
supported.

Note that 859d11b27912 claims to replace the open-coded find_first_set_bit(),
but it's actually replacing an open coded implementation to find the last set
bit.

Fixes: 859d11b27912 ('VT-d: prune SAGAW recognition')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index ceef7359e553..be60d7573dae 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1328,7 +1328,7 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
     /* Calculate number of pagetable levels: 3 or 4. */
     sagaw = cap_sagaw(iommu->cap);
     if ( sagaw & 6 )
-        agaw = find_first_set_bit(sagaw & 6);
+        agaw = fls(sagaw & 6) - 1;
     if ( !agaw )
     {
         printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
-- 
2.42.0


