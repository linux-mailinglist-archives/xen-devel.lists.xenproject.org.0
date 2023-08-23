Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341977853BF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 11:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589094.920819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYk3F-0001s1-SG; Wed, 23 Aug 2023 09:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589094.920819; Wed, 23 Aug 2023 09:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYk3F-0001pQ-OF; Wed, 23 Aug 2023 09:21:21 +0000
Received: by outflank-mailman (input) for mailman id 589094;
 Wed, 23 Aug 2023 09:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AP4=EI=citrix.com=prvs=59274c529=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYk3D-0001pK-AF
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 09:21:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6870db56-4196-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 11:21:16 +0200 (CEST)
Received: from mail-sn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 05:21:13 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DS7PR03MB5592.namprd03.prod.outlook.com (2603:10b6:5:2c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 09:21:08 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 09:21:08 +0000
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
X-Inumbo-ID: 6870db56-4196-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692782476;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WrSH3Zk7Y59xjaBOmCiILqLUlQVv9gVYPXkkZ/PzVrg=;
  b=ck9HoMcsmjE488UxqDcNjNMZgiViXGzrB/rWmkqaWg9fBZkzGJ0kQVeO
   7ZjAp4wPUdI+/IMeQRws47snK/Mqp9MSsl64TpKxF8nhKw/H0qTC6eoCV
   MYvKkUeemvE4FLU54kamzVLJXOwXmq9u20j/88RY0PH3jN0zt3Ax4VOGM
   U=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 120378320
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:s9hsrarkW2e6itrFUx7UTvSu4PVeBmLnZBIvgKrLsJaIsI4StFCzt
 garIBmGPP6CMGD0Ld9wPIqypkNVu5DRndViT1drr381EnsV95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzSJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADZOQk6Aveep+uyUFsZQq8AvEc7EOoxK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIu9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTirqU10AbJngT/DjUHW3W5m8aGlnW0UvBDN
 wtXqyMq95E9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQv3
 0WMlsnkBhRutqOUUnOX8rqIrTK0NjMRJGVEbigBJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7pdIE07WT+VHBni62oZ7IXkg5623/RWOg6QVRZYi7Zpep41zW8fZBKomCSlCL+
 nMDnqCjAPsmCJiMkGmWRrwLFbTxvfKdamWA0BhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLITLwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:jo3EUqh74b8LVfKas0A78SQqBHBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:PXhe+2GBhRZsFqmsqmJht2JKGfogbUeD4yv/H2K8BVtuZ7uaHAo=
X-Talos-MUID: 9a23:AMPSSgRoSDWeWdCXRXT9ih9gDvhX/5+kAWIRjdJF6sCAbxV/bmI=
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120378320"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCBaHG82DxXVdXB8mNsIzcwio1Orr8L4vDh6m2nqZEIqtiGKJM7XKK9ixKmaUSePFbL1tcYqumgeVU0S0Hu6m+E0T7R2hvghUNMd4lA+2WgJo7HElTYakHealQchOXU1PlA5EPaO7fdlL2wBXYizfmhz+BOHDBPtGJ8Ng6YYHdEQFLei/tqs9zn78R7apiSSWZX+ekc8F3qj0i1Xyo3ewpICzl60vOUCrjdNfb1d1vP87HY44OaC+bWhnNpDD47rHL6gS9+jefeXRLOoLjThzGox1BRtnCOsqS3kEa2CQjDTlJOhBw0sEugLeSIhAjg0ULADjbFzG/6EgOKkXsnLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrSH3Zk7Y59xjaBOmCiILqLUlQVv9gVYPXkkZ/PzVrg=;
 b=D6CtaRhqW4bo2CkS6EjdG/OVn/wDS+M/QTKhSo1Luy3ikyyZCO1MpovTr22k3JjPdAx5y9JKwLyuJLWBFLN7VjSKwWCSAwB3uAy5u6unJU/vvqF/NR2p46QyJ2qgOQbnmF1CKiCS/sUUJvXdkXYilvT7Qrl0n1v93hEUDcGIDn9VMVweqCKJg4ZtyX5OJwJWmmJhUjsAZo/hF3MQ0Njx9LTBcyxMf0hzY4rfgdpJX/BLX3iPGGVjJCozjeDMuDiML2USAuJzDmvMGSV6xVXnT90GH7ljHAre1rhdPCI51zKOlBGkUsqUnqCXh92ndAYm6X/7eTYNRYfyFd9MQ0hCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrSH3Zk7Y59xjaBOmCiILqLUlQVv9gVYPXkkZ/PzVrg=;
 b=JWft8OPMCc17sbAxxP0yPXX4ujxfoxTgSU+2ON3gLppY1C7GgAXVfT/1GaoWNnhoV+rEf3e3Vv4WZsh15kTNg2BRyrP7D1/8NV1zJiprnuKtYCz3GhoKoTiLOQy0ZfXCUSK6G22gcYr0ALdNnxzp9iViKuFrWcLd150B1WOd8II=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <635f0055-7001-f68c-9274-6c078d07a22a@citrix.com>
Date: Wed, 23 Aug 2023 10:21:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Simon Gaiser <simon@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
 <298af911-f4f0-165d-c493-90407d649945@citrix.com>
 <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
In-Reply-To: <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0622.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::7) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|DS7PR03MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d86fdc2-d2af-4b78-e635-08dba3ba4819
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d//fSa95FLYLEOFUP5DKQ4KRLL+3YkIMu+bIKBadWuCTsxU6+vlC6nI9NzdXbbRDX/AwiLQZW/Gzs58/xSf3cfxhc7Ztzk1tURH8OkR4PWHZisZQN1sS6wVx4ePya7WakuzLgQj8PfMIWFCCMVcHTNqvIXmHDXRivTWIomeTVi5MQ/Jhb7eh3ErzrA4z8gWmU1q0azzGOgHRdNJnO2TMRV4S0zBaB+6v8a/TDfVcCdYbFy/jCTioF/w7qw0ihn0quXH3B1Dl87KusPZs4L8tuOKjuq+JGqUjpBT7Oagc2Z49ku96kkUDJ4Eiqo6mDsYk1NDkn+A3PyWrOak1XAk2IQrYv9aLNlZ/Z7SN7sVJd+eVFQrkgNCZ7RgjQ7taBgLh+j0mhe8hXEXBgD++NPYsAwVYRpbNUQ/mLGgQAex3DIluS0ToxGBH03a1EvfWQg06vSM1SMUqJ0zRZ9cPG/j7JOV3y+E1QABVzUG+LwxBoAfmxRzqF2RuHFF0gjwWfztL4qnKSBt4uhHvA1r7etY5AUT95fu5vz5Rqgj6uj3tVX4tQdYgWNmdDEo2v/as64kvSthbYzW+VmNA3KDxEbucJVYW/WdMhzctdbDTGj83XlTG6AopZv/RKHtiiMgTPmaeuyF10pPCxDZHLVxpRbJ6RQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(186009)(451199024)(1800799009)(2616005)(6486002)(6506007)(316002)(6916009)(53546011)(4326008)(8676002)(8936002)(66946007)(66556008)(66476007)(54906003)(6512007)(41300700001)(26005)(5660300002)(6666004)(478600001)(31686004)(83380400001)(31696002)(36756003)(86362001)(82960400001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um1Xc2dsR2Rid2RZcEIvVVJuOWk1R1Y3VmhrU1lDZndnSmlWR0lKUnhiN3Fs?=
 =?utf-8?B?ZklYWkdodG9jYmd6dVhibGNEODJHTlR3amlYQVlpVmNiR0JVamlFMDRoZTVt?=
 =?utf-8?B?cmRsTFZZSlhCVVp3aG1uVDRQWUhWWVNLN09FQ1FMNW0xcWhRVVJHVXg0b3N6?=
 =?utf-8?B?bDdNNnluYVpRL1c4aGtnOEhUY3dMMzNvaGkyVmVnUGlJaEtBcXBPRVE2S3ds?=
 =?utf-8?B?K0xoVWpkR0RyTFM5dkFOczF4NEM4L3FjK3hFK2VRMUVQZnlwSjZXSXNmR1RP?=
 =?utf-8?B?ZVU1RFNodUhweDZKRzJyWmRTK3VGWmduN2hTZzlrQ1lKNXRIVzRIeWRQL3NY?=
 =?utf-8?B?LzJBRm93TGVKenEzNkd3eS9NU1E0MlZVQnI3b1Frc2c5Rk9kNm8vc1VUNDFr?=
 =?utf-8?B?SnlJVXJ0eUtIVDZ3dWF1NVdmRHpyL3Z6TlYzVllvc2JlZHllMlZtYzhadlVj?=
 =?utf-8?B?TzluU0NWblp4cGRGRVRmSWQ3OUo2ZlR6djgyYVJvWmFsNStTR2VxYXl3VEtq?=
 =?utf-8?B?L3dYVkpiU1JVOVAzWkNLZW9MRkVvYlppcFdNRGhFbWdYQmpSdU9GNXQxVmVy?=
 =?utf-8?B?ZGNDZGcyeGE2V1I2MjBGeVljUFlPdDVpWFYzZjBuUHI4TURSc1UzbHRUaXpR?=
 =?utf-8?B?OEIrdVVzNXNZdmdVN2FnRllwNmRVcENvSG1Ma2ZPcFpYQ1FkT1NZb1VRUUdU?=
 =?utf-8?B?SldCVmFvaUhQZ0NPZzBVU3crQnVZdDdQTFpMQ2Q0b1JMaEFSYkFpNFdVWk9i?=
 =?utf-8?B?b2tWbjlqUk9HdFlnYWI0Vm1JY1FQLzV0WnpqZzJMb3BaV0ZhenBLelhWZnQ5?=
 =?utf-8?B?RmxxeTZCWG9DSnVVbFlZNllKeFBUeVpXWUNiaTd1SGo0OXcyN0V0T2VJUlVU?=
 =?utf-8?B?QkpSbmhuZURYUVZBbG1oYU0vNThLcTJtSnVoTHhMRnNpQkNjdFVxeFBOd3pP?=
 =?utf-8?B?bzk1YnE1QUFWekp4OEJ6NFU0TmFmd1BobDRkK0dkWkRlbXV4NVE3RVpNb2hZ?=
 =?utf-8?B?V2xaNXR3ZTNldnNZb0g5NzRnd3htSTRMbWRJNHBlTWw5YkZCbDdPL2VCbmRU?=
 =?utf-8?B?a1NxQlNvL1l3cEpzMmpSc2FvQmdNVGVPUmpDbDl2Q3dQWklnSSt2c0dNT1d5?=
 =?utf-8?B?cFdRUy84UmU5ZFo2cDNUQksrOGNDSXR1MGpBbk9ucDMyZTJvTTRla1RVSGhY?=
 =?utf-8?B?alhCQ3dVbDh6eXNTblpzTDI3OTUzL0tIc0c1Y2VYM3N6bVpVdUtvejJycFcx?=
 =?utf-8?B?RHc5RmZ3cUdvVjlNQjlxRGJiYVFLaVhGRThFMEpTWVRWb0ZVY0NhZXFLZEFK?=
 =?utf-8?B?dkVxcTM1a0t1bHM1YUdvYkFoMmszTzZud25ibzNheVlsR21TN0RVY081dEhs?=
 =?utf-8?B?cTg4UnBoYXFGSHUrNGNFWmJQdmhWc1c2d0w0VWJhTENqOW55WDg4elVDT0FQ?=
 =?utf-8?B?cmNOY1pIK2hraXFvWkE1SHFldExRbFg2Qk5HdnJlQVVRR2Y3TUY5UlpFem9W?=
 =?utf-8?B?bzFpdS9OdkF5dG52MDl1RWEvU2Qrc0FDWTJ5N1JUQjQrU0RaWmJPU3Ntc0Nx?=
 =?utf-8?B?amhuYXM1OVZjVXJkZHZYTVNMRWVBamQvQktZNG9SRXNKYXc1U3ZCVnFpRWtt?=
 =?utf-8?B?Z2ZGVmVVQ2RELzN2d2YyckxXMFNhbHg3OWRpWEJQY3hTQWlaS2d3VFU0MWp1?=
 =?utf-8?B?cXpkRFR0dG04QnRSNDd2dXM5NTBxOEt0MjhzeSswK3MrblBWa1c2SW1jeEo4?=
 =?utf-8?B?OEJ2c2ZFNm5EOGR3c09vNGhYU0xuUnlUWURpRFNtc1doYzZnSUsrcUdEREVx?=
 =?utf-8?B?eEFkMVYyb2trcG1sZGd0YnlzZC91RmZUN1lRTUNGQXdrSXRKQWtFZG90dHJh?=
 =?utf-8?B?UjB4Rm5mSVlZcjJXR05WTGtnTjdyckZ2dHo0OVF1OFp6dTF6eDNGUWUvMkIw?=
 =?utf-8?B?QTJiZCsrL1E5RDFpdm4rWDFhRU42czArSE5ZTDd6c0JLSGw4RTdnR2ZpcjNx?=
 =?utf-8?B?QkVCNU04UEhOdHVuZUJ6Z2Z4WWNJR3FYRjFlNWh6OURVZWNYUGIxYlFYSVB0?=
 =?utf-8?B?ZFpWU2ZFMkFqV2dEMERud3pTSWtnV1dmNmlPc3hnY01ZSFY3OTU1RnlTZmRr?=
 =?utf-8?B?VG00UDIvc3hKVUR4MkNMWjM5QVNEdHV0Wll0VXBwRUUzblQrWFlQNFNPVnhJ?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0nW1DjLpHUlRVf1fOxW+mfnQEAWUb+VoBCuF2BhvSyk8SW4d7zzdulqKvCwp8S9Ii7Sj8A1SJJJxgjyYeuulT8Tf1BD/WtnhkBc3g7PTkyAE7zWXTHHwHt97NQA+zRs3HkFQWx0+cybKI/LIfxuIxQsOEiRj8KTkNlLe2vT1TL+frf5Di2eOYuIyYhG5KHE8ECkM2maVfur9uopwF7brnGAmydIF/MSk/ZjDzheNcAWd6vJMbHF/Y0JIt3atX0ppOhFIfflUdNAtJlYM03I0jahmmJfFmpSHN3aeDxH1xWKiF7KJcmN/uDadgBPlYvKetKZ8YLP/Ka5cE8PrZiEYeGx3FEVQUNDzWc2CZtXjoTgsMRMz4RVmQpq0TnGorpeuSC5oYjdwi2WBw7XbLSTB0n3/GNpmJ9UA8xkvQuzOjDwYeVSe4+m0TJroVXo1L98Ry2mS1muujRNwXhP2hcGjfrwnyO/p6z1hcMLzVtelxdGqiEJU5obBKm1wx/NiUG7XmZ3UerNWK7CDdpdypIbEpv4+iZjHOOvLrr/4xan2v+ZnhCeVEi/4OIDQaqMDbMzVdr2h8DyDms2+8IhavLF7PA4fvLNZuKi2GOjnkfn8ssx/GS5Vwg155TE6hhbOPZOLzzHhkY6EnMwPkFti9eCh0o3tGOMhyBQsefayPQOj1wVKAJDGYzPvPx89XQ5dUAPMVRA7TB6F/GwyvbnQofn7ctRcRpI3FeBNw0zxUGog5Nz1r6F/v7wGUcqL9wEmwNRP/LBlNp4P6eLKJJwXzU2q+Darj2CP0f6/hgNrETcWkk/5VXVmjUtfAr+dM74YoiRWBCaXcUe82fM4/FivOje7HU/W0r9q9qsE5ory0OKJ6P/Cu+RtSZ9dotrjGAC2PKMiT2JRC8RLD7P4wOfrZIKRNCnhWhI5Pb2sWpLf9GkZJe0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d86fdc2-d2af-4b78-e635-08dba3ba4819
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 09:21:08.0099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIXjAE5m6ZdTF1s3SJ8oJmG6VxTvKyE11UlGz+1QtgYJLJ7GXlghQGEv29QnK/VvGX9cuWERtIny+4PzH8vLcNgGJGzcN0GoiNUj8Ga104c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5592

On 07/08/2023 3:18 pm, Jan Beulich wrote:
> On 07.08.2023 16:04, Andrew Cooper wrote:
>> On 07/08/2023 2:17 pm, Jan Beulich wrote:
>>> On 07.08.2023 14:55, Simon Gaiser wrote:
>>>> Jan Beulich:
>>>>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>>>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>>>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>>>>> 0xff. Linux already has code to handle those cases both in
>>>>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>>>>> same check to Xen.
>>>>> I'm afraid it doesn't become clear to me what problem you're trying to
>>>>> solve.
>>>> I want Xen to not think there are possible CPUs that actually never can
>>>> be there.
>>> Did you try using "maxcpus=" on the command line? If that doesn't work
>>> well enough (perhaps because of causing undesirable log messages), maybe
>>> we need some way to say "no CPU hotplug" on the command line.
>> The ACPI tables are broken, and Xen's parsing of them is wrong.
>>
>> And irrespective - it's unreasonable to have users work around bugs in
>> Xen by adding more command line.
> Well, considering how rare CPU hotplug appears to be, such a new option
> could default to "no hotplug".

... or Xen could not be buggy and think there's a chance of hotplug on
the 99% of servers where there isn't.

>
>>>> Without ignoring those dummy entries Xen thinks my NUC has 2 sockets and
>>>> that there are 8 logical CPUs that are currently disabled but could be
>>>> hotplugged.
>>> Yet it's exactly this which ACPI is telling us here (with some vagueness,
>>> which isn't easy to get around; see below).
>>>
>>>> I'm moderately sure that soldering in another CPU is not supported, even
>>>> less so at runtime ;]
>>> On your system. What about others, which are hotplug-capable?
>> It is required that all APIC ID are stated *ahead of time*.
> Would you mind pointing me at where this is stated?

In the spec, exactly where you'd expect to find them...

"OSPM does not expect the information provided in this table to be
updated if the processor information changes during the lifespan of an
OS boot."

Which is wordsmithing for "Some firmware was found to be modifying them
and this was deemed to be illegal under the spec".

~Andrew

