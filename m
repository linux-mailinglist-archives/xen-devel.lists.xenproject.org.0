Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C1752ED4B
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334161.558190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pi-0006Ma-SZ; Fri, 20 May 2022 13:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334161.558190; Fri, 20 May 2022 13:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pi-0006Io-NV; Fri, 20 May 2022 13:38:22 +0000
Received: by outflank-mailman (input) for mailman id 334161;
 Fri, 20 May 2022 13:38:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns2ph-00056k-0t
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:38:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c2ec3d9-d842-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 15:38:19 +0200 (CEST)
Received: from mail-sn1anam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 09:38:18 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5755.namprd03.prod.outlook.com (2603:10b6:806:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 13:38:17 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:38:17 +0000
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
X-Inumbo-ID: 1c2ec3d9-d842-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653053899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mMJ5P0Y1TvLI0FEIdfDVmzdQ0NnWpot2Jwnk80caOVw=;
  b=TwzyxQ822meB1dPOnEBWNNLqC1cDRmoQb00ddo0OtFqn6cl009I4xyyz
   TXwV7XKE+BnC/fwrWGl5pUT2fANFQRbq2Sa1gU+nG8EwdBSf+pIwXp+wZ
   9BPj24lVpy1WmGfeq+UYMzAgrZeolvyuK6hzKY+WZZvYpXL5JeaE4sBAu
   E=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 71650044
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cnTWLaCEGIJYsRVW/zPiw5YqxClBgxIJ4kV8jS/XYbTApDMh3jZUm
 mofXWyCM6qIYmrzctx+bYm1/UwH7J+Bm9RgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nj2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhI5
 tZCu4TtaTsyfYrqpPsCWgFbEhphaPguFL/veRBTsOS15mieKT7X5awrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8ySK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7722yGnL2EwRFS9+IYv/zDKzFNIganUCouOUPe7dP9FkRPNz
 o7B1yGjav0AD/SPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmmp7+/g023WdNaI
 mQV/DYjqe4580nDZtrwQRy+5mKFtxg0WtxMHul84waIooLW6QuEAmkPThZadccr8sQxQFQCy
 Vuhj97vQzt1v9WopWm1876VqXapP3EcK2YHPXUAVVFdv4ilp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjvNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:iQFAAaAQkQFJylXlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dNMEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfXHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+06VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qY5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 129lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ9o+a87bWPHAb0cYa
 lT5Jm23ocUTbraVQGVgoBX+q3jYpxpdS32AHTruaSuok1rdT5Cvg4lLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P6krhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71650044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfN++KibEMnFvXHBmIXaZjynOtUN9kr4tnEnRTXVcv25PFB/HQreWA731QtN9DhQZYIp+bCTnI9XGy+IioLLI4teAFNutf0z3X4YZqbxIWMK6l65p7OiYrnOlSRUTp4+oXpIcm2XT7eq7fN+0t7aqrpPoyOuLxnR6pdRNq0GVoL0vJMhsbVjTZ1Mn6Irspx5jfrhr8hxkj6NpfEZbRhjfXdoJXYisP4DffaKgmxuUgCGUYA3qUlZ02XM5wVWFsXTv8jh02Dp89jXMvA1MPjvrBBU16CrS2AUi0PkL5UGuPnqbL/r3i8ZL1PFd0A4AYIK4sM0SF5wMBjHX6N0128tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AvxiNqFtJGVi/aGyaifVpzhB4RDM41TL+u3JB+MDoA=;
 b=G5M3pVPfsmoUU2bhBauUMGyO+axgHBYoVR8lT7ZFkoaG+ApSlcnqsHiUhRQugj92XjxuT/6Yt8UC9Y3BOg26SA6JL5NlfkjLZaALHXh0AcxC/yMm1FhaL3pUPo8kjnN8sEYjonjfaAl9SBWvkC2bY3sF70E4JEIL+PiyWT4X8ao8hGUBZKSdtn8Hl+znTDUdBi/x3ilhXebMh7KWB9CL6cJT3sUYv15AIzpvIVoD3n7I1twBm3NeK1egD9ck5hzFjIknt7Xr6YI4ayFUTIGBdt5nUeAUCj7wBt68vHdgy4kr02s5TPJFOPgso2ruy+HWPxwjZ0R7OqgatQ5+XrV+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AvxiNqFtJGVi/aGyaifVpzhB4RDM41TL+u3JB+MDoA=;
 b=o6QCtwVm5cNssF8DWwSHdTTpZVDl169pwpSXk8t+hG3vRvJjD/jj3jx13BS6HzBTojU6y2Nq4eMXkLdOEo+JbVGgIgXqkZUosvbVQ8HQ7L+Trbi2eqZK4Q1HaTk+P9s84uOg02URy+37muPoS0H355zgq+wD/HeorRy1Rev+kIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] x86/vmx: handle no model-specific LBR presence
Date: Fri, 20 May 2022 15:37:45 +0200
Message-Id: <20220520133746.66142-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520133746.66142-1-roger.pau@citrix.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2f8db8a-813f-4da4-458a-08da3a65fef6
X-MS-TrafficTypeDiagnostic: SA2PR03MB5755:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB5755CB62952198ED9B7378AB8FD39@SA2PR03MB5755.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Bvu0nahcCeRFDFJHB4ahfLVIk2rzFpkDYBf7IKsEU+cqAp+FnxdZK/aBfBsiqCG4YoVRgtl9x2+hM7bwbQXha+cvQyCfJUqjldNmmRkvBSPDiN1AuIZOtPHS4bgZARcSUBRRZ5yUHypeFKW6O9dWgvY43lnetCqtaXPVBK+0GB5E/A5e3z8klWZ8IE4IMwVcSfmtFN9XF2iKd7a/oP92qDKOzCau8V6UB2aVm/l4mDGUUtxz+Wfl2sliyqJDvb0E2mN7faw4zfWvd5VIjdFQ3ljBmPm0AUu2pvQiQR3uwLaX5o3qTfrNpRWxPUr1ZXMdXNbnCv2V5Xov6wMM3KyAzMXGSpH1Eagt82bI5TTQJaDVxtuYimc1fCC2lq0Pq9nvQitgcsiB/VW4383RJ+Y0ySkp+d6/Vm44KHCN0VWQTcUaW9BVZkcV9Gn7hit+pL2iRyta6gjBl2AqQR4twwShHBrSNLReN/q9ai6NqPFmyLGfecqisA95+VCR0D6uN6uiP3Hod4BVxy1AI7xpoMvrM8IDf0AJ0evXbeyBNKXfuzQS6rjyzIvEEDqnyXA2eYYQELsRjp3XnBnHHIZPBInDPF/ZQvhgoUpVlREVagLiHtYCfHK/2wI4TUDXRq8PqhfcPAS3p/zfnsSw1S498sFBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(6486002)(83380400001)(6512007)(26005)(2906002)(6506007)(508600001)(1076003)(38100700002)(2616005)(82960400001)(6666004)(36756003)(5660300002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJYM2NEL3JGOVh2aUVRZWp5TG5ERDB5ZVFzRlJta0t3UGFPWjdKQ2tWZVJz?=
 =?utf-8?B?RG9qZitzNytiMkVNbWNUb2REdHh4cXg1SmFOL0IzeTkzZW81dzMvbUNzV1Zq?=
 =?utf-8?B?RTRha3BtUjFWb3R3ZjJucEMrMG9tMUdPcGtJTkVlbEVDd3JwL2Q4cExTMVly?=
 =?utf-8?B?RmZKNFdYL0pqTVR6ZVZLejQycmhFSkFRQVQybFppRTZWMDI3amtlOEtvclRo?=
 =?utf-8?B?SkNLRmVtT0ZtMjNYRmdnblZXb2lNLzdJTkVxVVZZZGFsMUc1UklkMVhPVWc2?=
 =?utf-8?B?MjhMZzFNcWNHNmRCeEsxMGdoOXh6OGpYYkdXTk1zMWNBaEZxbitNUW83UkVD?=
 =?utf-8?B?blFHRlZTalJ2TEdGaUFZRDdNVy8wbEp3KzhZTUM0RnR1VUt3WDRDbHA0aHY1?=
 =?utf-8?B?OUZDZlVEbTAxaVhEZUdYMW50djNvQnU5bFprR0FQYm9jNTJkOVFLN0NrVEg5?=
 =?utf-8?B?YkllNTlRWG52YWxoT1dCRUVOQXE4Zm9zMXNrRHFkSDhZWkNjWGQ2a1N6c0xM?=
 =?utf-8?B?M3NCWjJsRTVhNVpMVHZQTHE5L3diUjBKOTdrUjJORFhSYkJRTmx5Nnh4K0Uv?=
 =?utf-8?B?NDVlQXVJVkNJeW1sT0pMNEpPSE41dklSYmhEa2lSMk1PM0xZYUdUaWdCMUNU?=
 =?utf-8?B?M0R6UkJmU0pFZ2hrTm9Fdm40ZENvOFI1c1N5TXkwWExlQ0JjbDBGUUhvYkFC?=
 =?utf-8?B?ZWhXQSsrZVRBNnlYMjArQmNOZFdRUkg2ZVpOamdVNUZMaTVwU1hFN1BMdjFk?=
 =?utf-8?B?SnRZWitCdjFXcDhMMkt1STE4MkVPL2hkRUxycmJ6RUlYTnhPNnBGQlVITUJV?=
 =?utf-8?B?WmFsVFVFb0N2UFhUUDRaQ1ptU3dUNW9rVzN2ZS9FMC9rTnl2VzU2RitxcnRi?=
 =?utf-8?B?WHdUWVdaSFhaSlFjTThsM3BtNG1BaWNIQTUyMnhOQUcwTUZqVi9JT214OXRB?=
 =?utf-8?B?TERBbzFxRDlFWlRURGhXUUw2YThTS1BMVzd5N0Z3aWNkTXNRU3YxeG1lbDZu?=
 =?utf-8?B?ekcwOHRzeFNpY1htelpBeHQ3Z2pnMEdxSVRsUWx5VVF6Wmg2cFdNOVFGUFdF?=
 =?utf-8?B?ZEpxUmVDVFI3bzVxWkZtSVlhNkMwN204SW81YTZ2UU9rUEZ0eWI0RFRYWDVV?=
 =?utf-8?B?ZldJQVArRVFmVVBVdHpUYVB6bjRrVjZTSXFacTU2eEZLSS80b2pyWUpvNFpX?=
 =?utf-8?B?QTR1N3BSMmJZMGI4QXVBSnp1a3Z1VTRra01qMHl3T2ZBb2tMVWU2M0ZYcDJE?=
 =?utf-8?B?TXUrbjN2VktCanlNRFZpRUJvOFQzL3l2MU9mV1BQR3ZyMzA3T3lXUkw0WjA2?=
 =?utf-8?B?b0hEQUVXd3BYZTl3YURVNnF0VTJXS0tKVkZhL25na3h6RWlCcEpNZHQ3QVVJ?=
 =?utf-8?B?eWIrUTVzUWxlbktXK3VkamZEUWxaSFdGdkpnVXBobllYUDRndDc0bSsrQUEz?=
 =?utf-8?B?TEgvejV1S2UzWW9UNlZzdENSNGZQT0VuR3pjelMwa3BtUXZuVW5rMkZSR1NK?=
 =?utf-8?B?SWxJdmpPNzJkYVlidkszcnJDaENQdnhPakdZeWNtOFUzU29waWlvSHdNT0xL?=
 =?utf-8?B?aXFhZjdtUituQjBQN0IxRjhnUW5TcjlCVG1oL3hERkQ4VElicjQ4bDYvRlR1?=
 =?utf-8?B?K2hCTkxJOUpEYVlZdDZXejk3TWt6bDNobCt4cjVGckNzaEVvT0R1SFdwSVlq?=
 =?utf-8?B?cTZja0VYTE93ZU4xZW9xaHNIL3FBamJ2cGVEdzRoc2dlVUhOeHhyWU9aZXpV?=
 =?utf-8?B?VkgrWVU1RkRLTUt3Y1BTRldnSE5wNEZEOEptRHRwU2IxSFVuUzFSWFEwOXpJ?=
 =?utf-8?B?enR0MlY0TWdiSWRXbFdBTDIwRGYvQmFFUHg2eUtRRGphRDB0Vmk2SStPQmJ4?=
 =?utf-8?B?U0xZMkpEU1dEWmwzYmtueUpiZzZUbkgwRlQ2dCswOVpkWUJ2QUpXdWtsa2dO?=
 =?utf-8?B?bDNVcWhaWnRtUGZucmYvTW94c3A4ZGRHOXk4TjJUZm9wcHZrRHBZR2RxaXV4?=
 =?utf-8?B?bVN4Y1JRdTlYMDNWYnlsdGNSajhLTXFxN2xLWG51S2lKSC9TcnR0aW1qWkM4?=
 =?utf-8?B?dzZOUVVLOFpPb2JZaUs2b21XYjdaTS9rWElzRWg4dU1EdmduMUVJL1dQVnU4?=
 =?utf-8?B?UXI0MUNBNXFlTVYzZVlDWkdNRHIwU2hjL0Q5NHJ2SUdKNHAwbjJ3cUJadlhI?=
 =?utf-8?B?SVJ5OWVZZ2VXNDRLM2xKbW5mVk5iaFplc0llTGlOVC9MODcvODQ0UFRORjFG?=
 =?utf-8?B?KzJEYTFRTmpzUnJmQmlURFJGREZJeXJTMnU0bElIN092RGF1Y0ZmV3hCS2RV?=
 =?utf-8?B?N20yQ3IvWEhuUjFRTDZrS3dKS05ubGJrZ1lLV2FPVDZyUW15VE5RNTk1YVpt?=
 =?utf-8?Q?QVgJAVCNMmtNfsrQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f8db8a-813f-4da4-458a-08da3a65fef6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:38:17.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCSmLOWkXo+LoC1wmktdundXOUZXBraRlZMD7/UYlIj5YNEHcjKltmcuuCtzrexF2T8udfqwqZxw/WtKHHU/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5755

Sapphire Rapids have no model-specific LBRs, and instead only expose
architectural LBRs.  As documented in the Architectural Last Branch
Records specification, processors not supporting model-specific LBRs
MSR_IA32_DEBUGCTLMSR.LBR has no meaning, and can be written to 0 or 1,
but reads will always return 0.

Implement support in vmx_msr_write_intercept() by adding generic
detection of lack of model-specific LBRs by checking if the LBR format
reported in PERF_CAPABILITIES matches 0x3f, which is explicitly listed
in the manual as a way to signal lack of model-specific LBRs
presence.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note the indentation change in vmx_msr_write_intercept() as a result
of the addition of a new condition is left for a following patch in
order to aid readability of the change.
---
 xen/arch/x86/hvm/vmx/vmx.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cf428a4849..3f45ac05c6 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3007,6 +3007,8 @@ static const struct lbr_info {
     { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
     { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
     { 0, 0 }
+}, no_lbr[] = {
+    {0, 0}
 };
 
 static const struct lbr_info *last_branch_msr_get(void)
@@ -3070,6 +3072,21 @@ static const struct lbr_info *last_branch_msr_get(void)
         /* Goldmont */
         case 0x5c: case 0x5f:
             return gm_lbr;
+
+        default:
+            if ( cpu_has_pdcm )
+            {
+                uint64_t cap;
+
+                rdmsrl(MSR_IA32_PERF_CAPABILITIES, cap);
+                if ( (cap & MSR_IA32_PERF_CAP_LBR_FORMAT) == 0x3f )
+                    /*
+                     * On processors that do not support model-specific LBRs,
+                     * PERF_CAPABILITIES.LBR_FMT will have the value 0x3f.
+                     */
+                    return no_lbr;
+            }
+            break;
         }
         break;
 
@@ -3521,6 +3538,8 @@ static int cf_check vmx_msr_write_intercept(
                 return X86EMUL_OKAY;
             }
 
+            if ( lbr->count )
+            {
             for ( ; lbr->count; lbr++ )
             {
                 unsigned int i;
@@ -3546,6 +3565,10 @@ static int cf_check vmx_msr_write_intercept(
                 v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
             if ( ler_to_fixup_needed )
                 v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
+            }
+            else
+                /* No model specific LBRs, ignore DEBUGCTLMSR.LBR. */
+                msr_content &= ~IA32_DEBUGCTLMSR_LBR;
         }
 
         __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
-- 
2.36.0


