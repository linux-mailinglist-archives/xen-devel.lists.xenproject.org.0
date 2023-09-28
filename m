Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD27B1A42
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 13:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609507.948612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlov1-0000UJ-9J; Thu, 28 Sep 2023 11:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609507.948612; Thu, 28 Sep 2023 11:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlov1-0000RA-6L; Thu, 28 Sep 2023 11:10:55 +0000
Received: by outflank-mailman (input) for mailman id 609507;
 Thu, 28 Sep 2023 11:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlouz-0000R0-CT
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 11:10:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae30b4be-5def-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 13:10:51 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 07:10:48 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7105.namprd03.prod.outlook.com (2603:10b6:510:2b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 11:10:41 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 11:10:41 +0000
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
X-Inumbo-ID: ae30b4be-5def-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695899450;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yV7OMOE7LtZ5y48lvresqQnMS0cGupeD89tY/RjZiEQ=;
  b=JqfR1nHoltpOxU/4ccSuGdbOb5yHnAi9poooUT2k4bG6/hA+QYPsyxKx
   Qs6/NsfHhX6PksaKtD8MBZ7baZifX4wErDDxUi6Ml3uoGbpvJQ5MC7NVV
   Hi0F4ZbY2K4lWtXbm8JY6I+fb28ykWyPmC/wVWhtOnSA5IqS2g/NwvKx+
   g=;
X-CSE-ConnectionGUID: 1YplpTPXQ7qUDerlJh8QxQ==
X-CSE-MsgGUID: u7JoJ6KyQ0emnjhr5clgwA==
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 124476439
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:YaoOE6sAGHp3PU60tP1AORfF7ufnVIxfMUV32f8akzHdYApBsoF/q
 tZmKWjVOPyLM2ekLdgkO96w/UIBvsPdz9RrQAdrqC9nRihD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5A6ExyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcQEVagi/v9KPn6uGZuR2guYjfPD7BdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt5OS+Pkra8CbFu72zMxDz9IdkqC+fS8jEy+QY9UL
 0ML0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqYj96i950GBvDuqqbDAVAtz7QLSNl9J9St8bY+hIoCtt17S6K8aKJ7DFwfR+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5dEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:q3/Nza1z9GiIUmGJVJwxkAqjBJckLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWbtN98YgBEpTniAsa9qBHnlKKdiLN5Vd3OMDUO3lHYVb2KhbGSpAEINBeOlNK1vp
 0QF5SWZueAd2RSvILX5xS5DsZl4PTvytHUuQ+Up00dKz2CEJsQjDuR0zzranGekjM2fqYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AUXCDYmjl6noM4O9vB0YNN1iePzJuK0zFyG/sG3+?=
 =?us-ascii?q?BVn9UZLCPTX2QqJp0qp87?=
X-Talos-MUID: 9a23:BNyuyAkBduHRYgn2Rwmfdnp/a+VvwfqNGXlVnJAAucmeaCd0NCi02WE=
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="124476439"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT1nyfgLK/VCLQ1EBd94SU/5tJHtj8scQtQQuFX6CJJo7szy6w+1zrCXI61q0IaK7m8RY2b4vKJqXhvztmnhepnq2jHEYG2TvUdIMvbVpB54tzkPu1HOX65UdpBwNMi3NKTLRJWHHBNUpeVym/dPXv2OFIpcIiJzjCvfgySsW/M2fEnDfD3JRlaN8G1ji64xzb/uxAqXGkERLIy4QBxSxtB1mn1ih23lcf+kgY4AxmfLIQPpPOsvNk/SqbMXquOOGm5crGYLlSmKAh5e2OVLnEEXBhzoBEn7qqvhwFzwjBlPHGEHkPXFIfWGQ0JsmNcl82UPxy6MZgQ9ovXziU5mOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCYsISzUf3IEAEdoXzsWBm5kNv5TXJ89DzAwx7TnxXk=;
 b=W5k3uV2uRMIlHFbcSNQtwPlnmsd4/WffItHnbmSA7+nC2oV/TmOtW5K43C6YCC0ycHSl1HHekm57pBPVIg+wDCfWcqoAsg0QAVZJdVnAwJ5X0v4npCcx3vSIiT12pBUkfcuFj/yM2ebJQ1brtJ1uEREAzwmC96+zJOWI0HbacHRlhrYlwlcV7/0v3nlWJj3UA6Qrrs5EhT5N4UPGlmTbCjiP1LS6KA00V20GJElKJQggZnTrldQTy12bvixqv0ydTp0D3F7GOOkQp+0vUo+n290D9I4g1G8CRm+ba7IOJLWxout+SFOb+ANvLXOPMCLJhChb49q05UMgBhj/MZEz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCYsISzUf3IEAEdoXzsWBm5kNv5TXJ89DzAwx7TnxXk=;
 b=WfhRFjEPOwFRPc7eoY8EZfhP2qauqpxmgOxAiXE+7QGa+b7tSDUwYxiQl9xGQZBaevBSx3XBwJJSsQJKqvepIvPnmEe2pB7ZJfdfxAWGnJLrBVjhSMPjDN9tnkv3cyD9HGRRe0XAPRWrq5RHfoo5n5wNs7R7hGpBtLx2f1kjzHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 13:10:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 6/9] domain: map/unmap GADDR based shared guest areas
Message-ID: <ZRVfK4d5rQIWve8M@MacBookPdeRoger>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <a34cef71-d60f-43ae-f61d-13d6c846eaa4@suse.com>
 <ZRVPqiRHXMJC3Bo9@MacBookPdeRoger>
 <4566ffee-7e97-0309-f5ff-7ce24b050e8a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4566ffee-7e97-0309-f5ff-7ce24b050e8a@suse.com>
X-ClientProxiedBy: LO4P123CA0699.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a4e31f-6cb2-4f74-caca-08dbc0138d73
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7rPVev7QYtzTmEeV15W/4i43nA4jShtIhktTzFe8tO2yzE0QkfAY55IfG3FvjdUNyUMV3Muq21ygP3cSmPmDzHYLq7Dm5BzXJDs6RKKIPDXE4vUBZaF1Cup8pD6pLdT9QTl+vbmqeCCcTCim/LaM5/jNPcVBEvYUVLhfZFT5vNF27962CY2LsT4nLBhU2MLCzLQ7p5u/BgdwIu4AV8Fmf8b+5bpS1qPxVyrtZy4KZbVH2w8TD4c6ezmMvnwb7wXKeUmSBwlvgYdHgbvHgijyUoh7Z9ne9JuzpZ6UrLcf18+n86IMd9c+AluDC8TqQ+d5r7op4RSd9dYLxbQbs5J1HD2kLSe90E0fUpX4OXYGNUyEEgoSAm60h/R+swAknBN61OCmiiwxc26pqH6cIuFKgoB/w1MoUZDI4b8u130nZPqffZA1ZWGA9hzdItLRQLQQpjcSNbFuy2m8KkFSDVdObnO79en0L/rnDRGNbnUNeDBZYaSPmTm9NbRKlLOzZmOfDrIes+rDBsFPjO3GpVoCTL+IoKXd3q4jDtLCk/TtM4Kee2qJwU5pBqsTho9aNyyn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6486002)(83380400001)(33716001)(478600001)(26005)(8676002)(66556008)(85182001)(54906003)(38100700002)(5660300002)(4326008)(2906002)(6666004)(316002)(6916009)(66476007)(9686003)(41300700001)(86362001)(66946007)(8936002)(6512007)(6506007)(82960400001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5pcFRlMW9tYnN1eElsOTZRem40Qzl6dmsvLzBSOXIxV1F0ZmVnTWNvQXRk?=
 =?utf-8?B?WnFjcjFaRm1nZ21YQUc3alhhRWpmcEZNTStqa25tbmptY1JtZk9DSVlLU1RR?=
 =?utf-8?B?S1VwNllCT1YybnZYbWZIWXlIT2ZHaVhPMGRMemZaQ0FaZURqekRmOS9POWR4?=
 =?utf-8?B?eGQ2VitLY0lQNmRXSS9BVFRYYTlmdkMxc0pDelh3R1R1ejFEeTFuWERUdTI5?=
 =?utf-8?B?QUQ1TWdQc2l5em9JRnJ0OFB2SlhoOGNsTDlzU01nRlNaZnFSbXNUV3dHTGNp?=
 =?utf-8?B?OGQycDhVODhCT2hXaXRQMzZxNHorS0tha2N6Nyt2c1NBNEdXdURXZGRoVzRO?=
 =?utf-8?B?QjNGS29Td3l0aFV6RG5uSm85Y3FqUGNxZWx4ZFhsTnFIaTZ2Nk9VdFFMTEw2?=
 =?utf-8?B?c0VleU9LNmZRT1BBZXZvM2UwNU5hZy9GejFwVWc0R2orQW5VTGNqbThwdkFL?=
 =?utf-8?B?cXBCOFhzZkZQTWFuWFhQYzNaTE9rbEI1S25PNktxVkdqKzlIYmF5U05WZnFI?=
 =?utf-8?B?U0llUnpOblBWUXJYMDJBb05DNk5rZ0pvdGEzRC9lVUkyZSs1dEx4YWFyZm1u?=
 =?utf-8?B?K3lPa0x6dVh6OFMzZ1poMElweldJZ0ZZRFZmS1VvK0U4NWptdlk0MTJacVB6?=
 =?utf-8?B?NnhZeGwxaTJFclRwTjBOUDg1aWN4OVFYdXJ3QVFRZWJWWEl4L0k2bTEzNWlZ?=
 =?utf-8?B?YkVHUW96d0FvVjY2M0kvN0dCeWVIc0hLYVVHUzJCbE1RaHRTZ2I2ejUycWNk?=
 =?utf-8?B?dGh2djRkUXUxTlJHajhSTlh6WVB0dm9mN09wTXNSWHoyRGpaM3NESUxyMEV6?=
 =?utf-8?B?MVlYY2hvU0xOUWlXTTBNaEk4eER2VWdxNkNsdkhFMElsem1VeVdQUitTY3JC?=
 =?utf-8?B?OW83K2xJLy9ianh4MjJOYjF5WjlGaGt6U2sycXRHMHVMR2dJdjRNZWgxYk5S?=
 =?utf-8?B?S3dHRkNkN1dSbEZHVno1UytjWkNXRmUvRCtFajkxRXV3SGZGVVhHNmlpa2Y4?=
 =?utf-8?B?aVpxbGVneWxVNEN3ZFRmODRmekhSbGhmVUhRcVYySVlibFZmZ3ZuTWhWWVJF?=
 =?utf-8?B?VFh5MjBrdjNLdlJMSUtoNEltdkZXeUxsREZjUFltaTR5dWNrWEJxM1cxZFNB?=
 =?utf-8?B?VWpTb3FGL3RNcGM5WjVoci9YbHRDVkxuUURVMGlYNDhPTTY2dHJFL2YrdXRa?=
 =?utf-8?B?TEJDZXh2RjVIRHpCbnRBR05aSFhqK0p1elB4U1VGRGZieVk3N0pNbkVGU0Rq?=
 =?utf-8?B?U05LNUU4VHExUTdsck42amdTejgyU3ZldlhPblNwZ3g3ZlMwZGlXLzl0VDln?=
 =?utf-8?B?dzI4eEVCc0duNEF5Rk5nRmNxRW9vRXQ4YzNEMHpzZzg3OW5DRWtpTXU2ang1?=
 =?utf-8?B?Q3I2RGEvL0lVQ0E3S1VCczcvMFQ5cG5TVDFuSTBTTS82a1NTUFhNMUl3TnRF?=
 =?utf-8?B?OUJacnRyakhsTUNkTGQwZXRoemxaQXEyYTYrQ0JqaTZIT2U2MlZxWTBEdkJs?=
 =?utf-8?B?TFcxbTh5WVE3WmNWSG9ySXJuTGYvSDEvZ0xsaTNpZ0g2eklybTdOMUM2NzhX?=
 =?utf-8?B?Y1FCdUJRNm50Mk5ybEpNaXRkaXpQUTEyWHA0ZVUyZ3FrRXo1dGN6U2w5emZD?=
 =?utf-8?B?dEdOelVTTGV0U1lOOFc3cEFhUUVDVVA5RGFVMTdVcjJpcm8xQ0lIQmRmbGlr?=
 =?utf-8?B?WVQ1dzEzZUZyRDh6UUJCeisyWjgxeVdKaXFnc245UktmYk5HMjd5R0hySE00?=
 =?utf-8?B?ZWw0eFBRZWZ6UnlpT1JZazV1ZEh1ekdyaHZKdUNmQitSaStnaHc0OW9CT0VE?=
 =?utf-8?B?TURaQVNhYlhuak1GakRFTitVN3ZJczNITllyT2lOOTk5dGZVMmVOaFpBSHpR?=
 =?utf-8?B?WG10WXgwakgrVy94WlZYZnpiaTNidEM0Q2dmNzlJVmZQVnBwS0h5Zmw5dnNE?=
 =?utf-8?B?SFJkSlE1bEhKdWdJcUViOHNtT3JVOHkvNVIrKzZJeWJhdmVKelNSbDU5N0E0?=
 =?utf-8?B?V2xteVMzbEkrZVY5QTZnTkxDV3lGcUtJci9xUkRiSFd4MCsvVHlVZTFETjVW?=
 =?utf-8?B?M21HdDgzUDF4aXBIZktXWmJSL01xL1hnaDIxZ213NmY4WGFnek9zRFZTbVA4?=
 =?utf-8?B?Zk9mdm1peCtyVjc4aW5uc3d2b1RLNlNkZEFuU2lKOGthVmhGcGNYcG9lV0ho?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FIWsi3dX8ISnGUtYTLxp6ePEhUTMjaRYV4xQOzU9DwJRVekUdDD484bUfUITGxjs9MvOJkMr8uPyVuf9uW5o8cY6lKb//KAMT9HZoOwALlXxigJem2NLDWW/SkWyurvmD97xPCgOrqnSLuRgEgwEAPoQMb+QEgqumefO5l/r/1vX0CFWps8YuiRDvfIHttjmb6W8Dp897nOI5poPZWvXAtyTKYBXXYIP38VesCEWaYE9QCkO9h8RmOyE/mtXIxUzS4+wtGzmJWLaU/1f7MNRtl7sRw9W5XpjtoQubFa1IgF8BgLQzSTV0tCIBUcw9hIcWIwkPnqjp19cRAemJAx/gnYHmI9arHS5L0hbM0w1FO4V70KeRzSJziIQfdE+efaSQ6MkPwREEs1c+5r7qwVtXO+R6/pTrTOQnFoyyjl15ump6x0pQ1Q+TiK15FymUw3F2yEhH5Pf+L4Oj8sKugMBQyKAzuX1czzKsl5kFirqpfPk8n82p7GlyC5kn0KfAKC+bqObyo4xPPiIjBtLlucRcc8rg01Zcym0uH8WHt/2ErOhNBnU0cbikIX65+PL5uIXjknJgqSVYs0I9Iz4ccyx+yqJLfd/EfbCbUYIE/4nF5GQOqHO++P+YI5pj3G6DxZkaLystOXN6qGHndlHo3CEzIpcDAP2IxhXs+0AzmvLoD1Z1NifiGUPmQuQD/1edOw+GGgyQTkFpkG2tYfwItRAhn/isWk8pUVXI5th6Ze1cJasxSq3JirWMqMh5EnsCjcLN4YMs5WB/crtEuziD4TI/VGa7fbilBZ9eXOkvHQ0M3Um57qrss5nvuP/KsFs4Kf4Nx4TpVii5SJOzp3QPebbFQcrf0tjukCzNzbpp++ib1dBzJo/s+/vZ6/0ymt9rTFK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a4e31f-6cb2-4f74-caca-08dbc0138d73
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 11:10:41.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b5vObyUd4KVOQITXPCYcUAtScpvgqsCY4cFPFwIlBpBwHm2WIAmRHXU4t6anF/rdcd1KKUDFxSpKWBEdV0oeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7105

On Thu, Sep 28, 2023 at 12:14:17PM +0200, Jan Beulich wrote:
> On 28.09.2023 12:04, Roger Pau Monné wrote:
> > On Thu, Sep 28, 2023 at 09:16:48AM +0200, Jan Beulich wrote:
> >> The registration by virtual/linear address has downsides: At least on
> >> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
> >> PV domains the areas are inaccessible (and hence cannot be updated by
> >> Xen) when in guest-user mode, and for HVM guests they may be
> >> inaccessible when Meltdown mitigations are in place. (There are yet
> >> more issues.)
> >>
> >> In preparation of the introduction of new vCPU operations allowing to
> >> register the respective areas (one of the two is x86-specific) by
> >> guest-physical address, flesh out the map/unmap functions.
> >>
> >> Noteworthy differences from map_vcpu_info():
> >> - areas can be registered more than once (and de-registered),
> >> - remote vCPU-s are paused rather than checked for being down (which in
> >>   principle can change right after the check),
> >> - the domain lock is taken for a much smaller region.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, but to be clear: Formally this doesn't help this patch make any
> progress, aiui. I'll still need an A-b by a REST maintainer then. An R-b
> from you would be different in this regard.

I see.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

