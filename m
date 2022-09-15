Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800AD5B9F1B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 17:44:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407562.650107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYr1m-0000ou-Ld; Thu, 15 Sep 2022 15:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407562.650107; Thu, 15 Sep 2022 15:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYr1m-0000mh-Iw; Thu, 15 Sep 2022 15:43:46 +0000
Received: by outflank-mailman (input) for mailman id 407562;
 Thu, 15 Sep 2022 15:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCqY=ZS=citrix.com=prvs=250640b55=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oYr1l-0000mb-1z
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 15:43:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd53950-350d-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 17:43:43 +0200 (CEST)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2022 11:43:29 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB5912.namprd03.prod.outlook.com (2603:10b6:510:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 15:43:24 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 15:43:24 +0000
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
X-Inumbo-ID: 2cd53950-350d-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663256623;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=imvobpJKOs+YK9Q3NP3nitqE+xSoQweHyBX2W9oPZ2M=;
  b=b+zcd6PFMIFWSz5nB+OAarJe+eTs25Np5OSjt+OmkH4qkrTFH4zNJV9X
   LS9RKOtHs9eSGEj6C+SJjDx8LjPIibV2k2zej+mELGBmTWY3utiL+RrE6
   wX8qVgVbTD/84xfSi9sJ/P7AkzOnJl6AmZITwlfE0Z3MBIqDvQL3Fw0o9
   c=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 80606575
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AJXYSlaoxqjgE/GZvpIoOu1LwFiVeBgzWbkUCk?=
 =?us-ascii?q?Ij8NTMUsmV9RDklARbmC1H/SmUOH6lRJ12Li22o4QS1BUtn7T0DSHuUOmbDA?=
 =?us-ascii?q?6N/KNYXvgEZKOkUkPTFRcZNoWdCnu9XMzd4FtkxfN4T79Ix/fhR8XW2XWR5Y?=
 =?us-ascii?q?hB9/Plei9QJWo1DInWq7QvhStXeDfXG0b33pwp6WHyZ5NIKAONpfl4n0LwWe?=
 =?us-ascii?q?WZOhByqbOwbTJKsSXnvhjYKXquFOsrrcAbtrfMYS+q+3bFU6XsUuvsmyGpLo?=
 =?us-ascii?q?fzNdoWZlzxhRrxupRolpBU7z0qulPZzGOr356FOIsrHmprOaFC2E78M6rZHl?=
 =?us-ascii?q?aUseZp0nwJrsdglEryvS9ejXy2jJzswxUDzxqL2/KCB0WkUIgIPJB24T0KZL?=
 =?us-ascii?q?vvEGdU7VYtZoX56EwjA7dGvbrECrvLC0Q1rjNtlKj3ARAE7g17BuXJGKFym4?=
 =?us-ascii?q?TPnQfGuLgD4L90ZVDff6QknKUSo7CYZH1D6SCp9qt4UcSvQWtnGm3Yb6Rw4K?=
 =?us-ascii?q?Fe80b0xrjdWXbA3JWSL+L6Gvdx2jx3CBLW/3X6UO7uPqF9IM8vfqHZ8CauBw?=
 =?us-ascii?q?jRI6rUJxk9s4SQhcYDhb0/dHpUQMIKkHYUQDCPguR9JrQEA8VNauvB0UUXdA?=
 =?us-ascii?q?H8M0f2zRN/Fqk5cE/wDnB4WGH/7KFsS278noe30lhAKmM3E3I10IZ5LOCiFp?=
 =?us-ascii?q?0qCdCQucG5egw/DKLOVylZQhzsAS+l4QozgwdrG7awD6psw9SBvkbwmZTcZX?=
 =?us-ascii?q?8YLpV+9f2UpIzm4/85Gw4TFXznJf16CRTwGDLS5AKNsBAm5yq32wN6OQqx0G?=
 =?us-ascii?q?AvGoCeupwQCWjMOh/H7PNzq6d1WNKQEQFtIRcwj4TXb5wyS6itPDOpvxmlwU?=
 =?us-ascii?q?oY8Wpvl8rt5ritjXcJU7Mi34tItw9yYXtGV37Dn7VlNSrjmq4jBoWW4fV+ZX?=
 =?us-ascii?q?rmZrCWTxapVjzLYnQqvAN2kDvuuvxAHdBj6+xKy1ewEt6k+wCmglMQt39MaW?=
 =?us-ascii?q?oAsvuvBT6F/VPILleGKxfsf2/tMdQTJCfKXcMSJWNM7sMB2P+3AdB21/kaas?=
 =?us-ascii?q?tAa0bTLjrX5Vi/QaQVOeRQDx/g0Os9pyE2F3mz3ZTcCyDdgl7Cv2qU7bHXcJ?=
 =?us-ascii?q?atd5DxA+eAHtTP8rwnuHnp7Fn6DYxeogrM+jzlVqUYQwaaCuPTFQKTtHUpGy?=
 =?us-ascii?q?ZlS+3uW3OhZUQLGU2CJwii7Lq0Osob7hTeSgZbxWNTEeV5r4Lo9Q0R0Uy4D/?=
 =?us-ascii?q?m/zDmTDgf6iFx0J3xGZz5RmMBghPd/he4KADgv6A8OjrJJ9nAyRv0NLL3bR8?=
 =?us-ascii?q?X2ui0gSgsV9AvEANjT1SI+3oO+JZDbCDCdcWNdARlxPV2QiGWQM7kI3fCAFK?=
 =?us-ascii?q?hrK3PGOiX+iAWRORHHqqy1SBpz4KsGsfB7ptWxMSlmKtedu3gw+EvKi/HQZE?=
 =?us-ascii?q?BJPSIHNYFnjDQYnnpRAFs7rc0NyP77gkUKnsGyCWFTaa7c7w1UegfPxsDLQV?=
 =?us-ascii?q?AlzXoI3oSN7QOIjOOTfogzkQQrZ5dXXRj6Fyd8kVGuCn1jn+PZof6vBD9jYj?=
 =?us-ascii?q?1nUU1KxbLM810ZVLwtBpLzsdscyba2p07j+nEkTpdltB3j8zaCrt93wiHezv?=
 =?us-ascii?q?g/m55qJtB0utWWTocFp9k14lNhLgwVueOavcMr9pxjkexR1mwyHGdkLZNLEz?=
 =?us-ascii?q?sV2K13JTGuDj5/06yqV4Eb4Cr9Yg6ozT4ShPvn77ZP2iSaADEWa7cUMp7cOH?=
 =?us-ascii?q?Hs5NmCXZXWMKf7rpHvXvKVeGGVku/1r8IznABs03cZLM2svh1b+bjOF+MLCD?=
 =?us-ascii?q?YMFqoaA+rh7RP8cKcaUSqeKvp+7OMPdupuRP3tCgSVi0G4f9Aa9bac6ECEYT?=
 =?us-ascii?q?5C0OeTT2cAyFFpL2jIdu3/p7JLOuySJT3KTQLylgkK3f0N57Di4UmvedgnXH?=
 =?us-ascii?q?vDnvdYjdjTwqD0lnXVW2N2Ij7wNlfP336x64WFci7UbtMuNypjwpwB++8y36?=
 =?us-ascii?q?OkeKeyzIv14FYnMfT8tB8Smc6+rUDyxxmA/Otmlg576h+dPZ1NsNbzB+8GHG?=
 =?us-ascii?q?PB2Vt2yFSh2AojmYx/iBsfiyBGg9uz2Xs1FYwA+lU/7R/NCasZV3kvxTfRKm?=
 =?us-ascii?q?FEsabnUFuz3sh68ERplrDTFyqByXxSkVPefhv0Bm/h2Q41Qn+Z/RsDHxmy2b?=
 =?us-ascii?q?tvZAGxE7WqVZQdxM2LNuZ5uEosr+MDDCcp0cw4g41axAXroxIfaglG0ObVbu?=
 =?us-ascii?q?2iw3xBWoAj0/qItNWWVVjgeWnUBKVpPApxPJfJAZuYQnKlv39QRS2BMb3GIB?=
 =?us-ascii?q?Kwrybzu7FflCpMI743FOEbD/3D/+Rrpb32k6N+leSblyrlgbaIvN45oizO+H?=
 =?us-ascii?q?Bev4LXuDfLmagrA6g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,318,1654574400"; 
   d="scan'208";a="80606575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsOrZl5FrxHA41IIjT9FXCME7fl1LJPqiOrTVYHAlt6qiKirhwCGxaynIlYU9KlX17sAxBUS7H7buglu+GKgHCp3Lgmm28X3HWujloXyb12XbVWYoCWnuIM9xcQbUh2bs9aDbLE1396YMXspvj0cvBXVowwn8fCWJxCLLIPl+ZA4lod2E3wr9eINNDzNTNNatAOL3nVz7ZQxRi+CCbJjSDmKdHFCeS5uAufaSVxfr5/0zzRR3A9pDasnSbOqzFOJ856X0rZnGyPlJBvAIl3W8i1CrCw993kyfOZycA/RbQ6UJ0w/YZmWY+P7oX8e2UhiPnjWfdTuvT9wDmO5WTTZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R54Hv3p1A2LG97ycmJp3uzkpF4FYTACcAPHpo/K48iA=;
 b=aM8KThLDGDLVAaD7EhO8pR9NPQajbThbU7WAP7BC5mD+98pbnBmSNigLOaUpjUPBs3d/gDC9UGBrxYIjtyx2vbSfc0y61frfxrwOzTI1WIrg241yV5WiHaAi14iEIJK4r1gVVZWztlwNs5nYOniXVFgOEpY7z7NfRNTj5qWO04qNsZNQzd/mbjlHCk9TORJ4BoIKYkcVj4RC1ftERVm4+W2sXoXPAG86F4/kVXMmyNh5mcxnm68hNVDmODaHtpDaggc349hjgVmBm8VM2STRjehPtHSVjQmYfV164/xJagW9/rHoQg+vjA78QpEji7xe/2/HmTodINJvyaa/DLsuSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R54Hv3p1A2LG97ycmJp3uzkpF4FYTACcAPHpo/K48iA=;
 b=sbbJINuoYObywQ7asstWMRleQSGh8G6IcOVUsu1NpF/LTXrgruvqz1BtF07sIvpbG4UqdWUGNAQnBSeqAWe5dz8urTapDPfnALYApJ0szbHp5zFcJAy6tXGeoqjK4+JEWoqEFXcebypP9LBwfKwX85t2tCWPEUYwqjVBiD04LTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Sep 2022 17:43:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Message-ID: <YyNIGR+Nk/wJeJzB@MacBook-Air-de-Roger.local>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <YyCYw6Hi0jVg0L+6@MacBook-Air-de-Roger.local>
 <74fcfb7c-a699-03d5-c8aa-5f654515c566@suse.com>
 <0ccfe125-9455-8f40-430e-cfa1347b0aed@suse.com>
 <YyGbTIwaO+a2KVFW@MacBook-Air-de-Roger.local>
 <d232013d-aa21-afe8-ae71-5580ff4d679d@suse.com>
 <YyHjyzXfScvSWyK2@MacBook-Air-de-Roger.local>
 <52cb5a00-83fb-8a35-4670-8dde87585f9d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52cb5a00-83fb-8a35-4670-8dde87585f9d@suse.com>
X-ClientProxiedBy: BN8PR12CA0005.namprd12.prod.outlook.com
 (2603:10b6:408:60::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|PH0PR03MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 62140324-86b8-484b-1b13-08da97310627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mUllo7kJMqgaoudCfPkQ6PE3mzO26F/jJvE7xcinyl7NmJP7Eg72O87qpflyOo4xKPaCPwH3QOWAloudVhJ7T8Pu+HtnG75i103O/N1/ZwqSNjqo2e287ZRc0B2ojirle5OEUVxAyHB5TZSb5eMvrLxM7eMQVfHPzPV45UQ6OcGd1iYCSMsV64n8OaQubPreuBNvO6QPJiqPnFwtz/skmm7nRHbHhqlaqVPge41dOZrItJN2CmRTIP2eNfSnPSV4Uyx9ql/T5neOAZof5qXJeFGgfWD/z2Jj4OVAZh0pXtlAnwMsduAQtItjd2TprGI6+uYe+JVdRQBAx9/2zU7S4u1XjxkEeYy8ChWzU7qiWImFxaDC+/9JP09e5MmlLFGij4sBXpyqJHdz0AqXt05SrosGF7f6DLL4eVor8YKGoJB4K/b1Pqc4fUernsk3C1aQ2prj/ZbH+3moHjlS73mozvbON9FSdg0SMdnQl6qLU1bP19cfx9Mf0z4wI29voQPMkGa04Qi866LgiN1UmQu32OPPd4kONm9RrjZNazuS+3JqJHptSSnU/eyckE7/PduOAkUkFY1IwUaaOaIy/3XhSGaQjtO5t5pQmN9w/6Ckt2iEdc94N/COrARJuk0Q1FxCeDOsnTyXOECcPulxRGUgs1KLJDBf5wPM+2hqS9s3z6VF2RG40/KdK/hllANUNITqTyZYOtY6hzipDXyoG8Ep6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(41300700001)(6486002)(6666004)(478600001)(53546011)(6506007)(186003)(83380400001)(26005)(9686003)(6512007)(2906002)(316002)(54906003)(6916009)(8936002)(4326008)(66556008)(8676002)(66946007)(5660300002)(66476007)(86362001)(38100700002)(85182001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym9RRHMxdkJ1SWZWQ1E4SlBpL0lFUFRtWGJPcWYzYTNFa3cvZWUxZlJ2djc1?=
 =?utf-8?B?M2NuME9Ia3NrWmJoMGVQblNXdW9lZS9QaEVVT0tFRlg1TlpTU0k3MVloNHBi?=
 =?utf-8?B?ZkpESXU3ejc4UWljZkxpNExxbTY3MmIrVk0vVUZiUlZ2bWlCeCt1WjQzWWRS?=
 =?utf-8?B?RHYrTG5VaFJxa1Y1Yk9pb3JaR2d1dEgzVmFxZGx6RC9FQXFmazRRT1FJUk53?=
 =?utf-8?B?Vks2SkFrQ1NNdWJUcDFWUUFKT3BGWW83d3lKc3AwcUdscUlQMG0rZEJLdHVN?=
 =?utf-8?B?SmRXQ3lkazZ1cU94Tkl1bFB1R2lSWTZMbk00QmtaaWFYakJ4WXUzNnN2SGtQ?=
 =?utf-8?B?alFUaERsN0NBd1NJZnhKRmNjd2x1WGpXUnVPbm5zbTM2SlI3elo0TzNoVTRx?=
 =?utf-8?B?N25Uc0R5NWE4UklXTmxCQkZCamUyQjRPbVp5NHB6Nnd5R0k3QjMwUnFINDd4?=
 =?utf-8?B?amRITi92YlBISkpLNER6aVFKQ1dyRzZPU044U0tVakN6NWFQUXFiQjZ1bFN4?=
 =?utf-8?B?U2I1c3k5MTVoTWZ6czhOa0xLS1JnM3U2bm8vdXo5YTZ0aW13U0FRbzlhQWM1?=
 =?utf-8?B?dVVnRU9jOHZib1RuTjJERnJWUDdYUndya3l4R1BicXlmTWVrc2s3b3pQNCtq?=
 =?utf-8?B?ZzdVQnpjbDNMK3QxWXNQNEh1MHlSTXd1YVN6bGJCNDVLNzNWVHN4Mm43cUpR?=
 =?utf-8?B?dXBGNFQ0bi81Qi9wSG5jdGVOMkFnZnlTeEFnekxFVEpBaXdTREZNNEZqRjAr?=
 =?utf-8?B?ZmRBQXpmRTZyWG5hYkVDRkNwZnE1ek8rRVRkM00vU0JyWHlhR2hhYytrQ0R3?=
 =?utf-8?B?TmhnK0M0ZS9LY3EwRUxGQjlqS25QTVRnRWNFZGk3ZnBUYk9CYUVkbzVtRWJP?=
 =?utf-8?B?OTVxVzhabWU3Q3dZNnRoaHhjZ213QkFQdG9uM2NRcE9xNytnOHBCUXlwNmc0?=
 =?utf-8?B?WEdlL1luOHZ6MGdKYWlrUFNYTEs1NStGTkN1NmVhamNNV1grQUUwVXhtOXln?=
 =?utf-8?B?WXU4RzVSTFp5aS9CRk5sMURnODVwbXEyc2NkNm5sZDM4VWZPSHpKa253dkI4?=
 =?utf-8?B?OHpkY21HQ0pJTllkOGtld1AxOVdmTDlJZWVtRFBqVnpCektqdEwraGRDRlYw?=
 =?utf-8?B?ZDd2ckQ2d3gzNFQ2VmlValo5NkNVMlFkUVl3TXF0RXRlRm1ob3RwS3U5am1H?=
 =?utf-8?B?VGxqRW4za052R0NEeWNIUW96TGlDU2t0dXhQOFFFdW0xMytsalRUbXVxNEZE?=
 =?utf-8?B?aEsyRkNNbUtEWE1wUzBRcnZYSEFEbmVyQ0p6Ly96cG9keUtYR202Q2hzVHBP?=
 =?utf-8?B?QW9FUmE1UHFaS1FkOWRaaWNXblpOcDE5eTQ3Y3c2UkhPOFV4OGpTWUR2UVc1?=
 =?utf-8?B?azZoWHV4U1JXNG55WTllMkNYejdYNTB4NzU4M3ViUmpjM21VVHJqczhTU0xk?=
 =?utf-8?B?RlNBbmxaQ0ZPMHpneDFnZzEwc1hNNHBuNjlGdE1valJEOVFPZmVQVEozU3p2?=
 =?utf-8?B?c2ZHb0hweWhRTU1mcWZFbzhFYy9FUDFIZGR0cFdyV0crUkw2Ukdnb0kvL09v?=
 =?utf-8?B?a2pJTXU5SlZsVnRza1VuTTdrcVZ6MVoxbC9nbSt0bHhqWkRERndjdjFGaWps?=
 =?utf-8?B?M0ExZFQrb1F1c25XVXJNWlhUd1FrclJmeXpNU0htY1phRnYvbDl6MjI5Wmgw?=
 =?utf-8?B?TEUzL1A3dVY4emhRRGRGaTRJeUNObkhOam9rY3R5UlJGY1pqekQrcWhybEJQ?=
 =?utf-8?B?NnBnNGJXOUdnSEZoQXZ0VXE0YmtXbk5NTUFKcSs0QXNvTlRJMWdTRjF4eitw?=
 =?utf-8?B?YWYwcC8rc0lxdWZnRHQwNjdpeHBpTG5sekhiaHdtT2hlSDluYlUxNzdLcUxY?=
 =?utf-8?B?VWEydGM1VWNYdXdMNCtzNHN3d1NlWXFHbXZZZGhNc2lxeXd5aTNtSkh1aG9V?=
 =?utf-8?B?YUVXMURNQk03WElJdlh0NlBVUTVlSWoxUElrYm1BR1FyZzYrY25tUW9CMjJC?=
 =?utf-8?B?T3Y0c1MxeDloUWpZL2RiWlVQK3hZVzhHWFJ6a2VRYkRkRnVTVlRDckpKZGRa?=
 =?utf-8?B?OWk3R2Y1K2JCb0pBaGEvSGUvbnZoMmphdEZYcXU2WWpIMEVwOW1UYlRwVmdM?=
 =?utf-8?B?b1VtNFlPLzFuU1YvMklxMlNIZDcxdzV5aE9TVWZ3T095QWRiTzJqR1djbG14?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62140324-86b8-484b-1b13-08da97310627
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 15:43:24.1576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vgqXEAgd5g9byjxwhnaYeyOEcvvhNP89xCLF5tywrOJotAetblOB2hSTjbbxjf6dGZZ5IgjRb6eP4SiGIoPjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5912

On Thu, Sep 15, 2022 at 10:01:11AM +0200, Jan Beulich wrote:
> On 14.09.2022 16:23, Roger Pau Monné wrote:
> > On Wed, Sep 14, 2022 at 12:13:49PM +0200, Jan Beulich wrote:
> >> On 14.09.2022 11:13, Roger Pau Monné wrote:
> >>> On Wed, Sep 14, 2022 at 10:31:34AM +0200, Jan Beulich wrote:
> >>>> On 14.09.2022 10:14, Jan Beulich wrote:
> >>>>> On 13.09.2022 16:50, Roger Pau Monné wrote:
> >>>>>> On Mon, Dec 13, 2021 at 04:12:55PM +0100, Jan Beulich wrote:
> >>>>>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
> >>>>>>> the consistency check in check_lock() for the p2m lock. To do so in
> >>>>>>> spurious_interrupt() requires adding reentrancy protection / handling
> >>>>>>> there.
> >>>>>>
> >>>>>> There's also an ASSERT(!in_irq()) in _percpu_write_lock() that will
> >>>>>> trigger when trying to acquire the p2m lock from spurious_interrupt()
> >>>>>> context, as p2m_lock() -> mm_write_lock() -> _mm_write_lock ->
> >>>>>> percpu_write_lock().
> >>>>>
> >>>>> s/will/may/ since spurious_interrupt() doesn't itself use irq_enter(),
> >>>
> >>> do_IRQ() does call irq_enter(), and that's the caller of
> >>> spurious_interrupt() AFAICT.
> >>
> >> Hmm, you're right. I was mislead by smp_call_function_interrupt()
> >> explicitly using irq_{enter,exit}(). I guess that should have been
> >> removed in b57458c1d02b ("x86: All vectored interrupts go through
> >> do_IRQ()"). I guess I need to either open-code the variant of in_irq()
> >> I'd need, or (perhaps better for overall state) explicitly irq_exit()
> >> before the check and irq_enter() after the call. Thoughts?
> > 
> > Well, it's ugly but it's likely the easier way to get this working.
> 
> Just to clarify - the first of the options I did name is (of course) not
> viable: If we open-coded a local_irq_count() == 1 check here, the
> assertion you named would still trigger.

Oh yes, sorry, I was referring to calling irq_{exit,enter}() around
the show_hvm_stack() call.

I'm slightly worried that this could cause errors with reentrancy in
case we get further interrupts, or even and NMI.

Mutating the environment to make it suitable for what the function
expects seems troublesome in case we get any other interrupts or
exceptions that rely on the state being correct.

But again I cannot see a good way to sort this out short of
introducing an unlocked p2m walker (and related accessors) to use
under this conditions.  I haven't looked myself, but I would expect
this to be a non-trivial amount of work.

Thanks, Roger.

