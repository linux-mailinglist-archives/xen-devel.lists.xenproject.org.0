Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374D7B561D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611619.951175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKas-0002mB-JB; Mon, 02 Oct 2023 15:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611619.951175; Mon, 02 Oct 2023 15:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKas-0002ij-F2; Mon, 02 Oct 2023 15:12:22 +0000
Received: by outflank-mailman (input) for mailman id 611619;
 Mon, 02 Oct 2023 15:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKar-0001wY-35
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12fcb395-6136-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 17:12:18 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:15 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 15:12:13 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:13 +0000
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
X-Inumbo-ID: 12fcb395-6136-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=a/AJPPtiiInCeVF/0s1F5KgDnLN6kpPIjcJ+zFRlvr0=;
  b=IeiAIn72J3B3QDiJgikfdEXlggsJOPcAJOnEUtpvrXBrUYz386XMclPu
   dweNiqKmTB5VKDRhq8OjzcWoSQdlWbw7e42tIqTi8Six7PxKrpyOV7wke
   wgfJ4WDVggRk+71jsuTOeBjxFflJdzsF+30oJLMJwQQPtOuOW0M3BL7/f
   g=;
X-CSE-ConnectionGUID: nSL1cQw+TDCQ/26z7B39yg==
X-CSE-MsgGUID: jDPny1WPQSK2qt4J9RWQhw==
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 124398882
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:V6/kJqBZY46umBVW/xviw5YqxClBgxIJ4kV8jS/XYbTApD1xgjUCy
 mQeDT2HOPmDNGX3ed8ga4/lph5Q7J+ExoU2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtA5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/N1TWGp36
 r8kBBs0KUrdlb2cm+OqRbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC7317+fzXmTtIQ6FpGA8O8zv2Wq/U9JEQFKdwqBnsC5lRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmgJSCRQLsMvssAeTCYvk
 FSOmrvBBzZirbmUQnK17aqPoHW5Pi19BXAGTT8JS00C+daLnW0ophfGT9ImHKvriNTwQGj02
 2rT83F4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CNsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:ffj3m6rL0fAhDsLfZzA91joaV5oveYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qH/xTQXwH46+5Bxe
 NBXsFFebrN5IFB/KTHCd+DYrMd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3APW+oAmqb31P79+koz4X3o9TmUcYeViTW9WiTH2O?=
 =?us-ascii?q?TMCEzFq/KYwTB6awxxg=3D=3D?=
X-Talos-MUID: 9a23:OU2mvwU+s0Rw1APq/D3AvDdzbfhQ2p+NUlkRzbdXgfa9NTMlbg==
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="124398882"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NY6LluRR+YdsfBBV7azOTAqzl1Xpvr76iY0t8iRumJqdlJpzEVBUE+n03DuexmEUEyPgreX2GNi12IL3kjmSiuU7f4EJxPC2Wj1MDL4bYarje1WoNBtSzOXmaqcFsXfW8CST/KeF538OyoBs3NXV7ptHiU4ehSEheyl/DQwtQdyzuQUTVj+Vr5IK9frKvFtA+0IWfof6VXhQGqcQ7a/WOuugqesPmnF6jfI0fNgdABF9qX3vBMolyZLs9cGwyIYd+iNhEB8UIXYVnauIsZ/80LWw1HDCAH6ke/1lM0Qo+MisrJvFeqBn9X1bpQnMISyrKS+OxCuZbv4yOTqCHPCouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNopSXtZurBZ4E6tSOFy4W/8WMqlD6/cPCnqWUU/QCI=;
 b=QPJMyL7Wf5ideIxR2c/73Jhlxu9PK0JNHVks6e14fNJ6WXU5IyRz38VZHzbHiEiBTj9W7hlCCWhix0dBDP+44t1un4dvfhnnZDo0oSaQlRlv//pen+EuWM2tYiEwornLtEjvnSY4bnvne34TWpVCHI0jYWa3nw0Q0TMMbtZFdd3C2/S82uYBmCAhNifMKNAwvQYzlB9shf46xzGk+UdASKNHa9UyRfX0LaVa5alqizKNzcwC1ZV4UK7diTJmcXZMewQIvSCNfM6CgyLYVWLB5wmzx3QrZihVdCaui0rWaWBAZR/Qg/hwTqgo/YHaBz8YQqZGWpa5vKm84m89lRPWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNopSXtZurBZ4E6tSOFy4W/8WMqlD6/cPCnqWUU/QCI=;
 b=hEYQqPwGaW4ru+0Gxjhlw3vD1XoNRzEMu2mmbvSAGvZvWVgZCJ1v509n9QEmeSHpqv6AmHYYH2RWznJCZ8bUVDKOYVzATNY+7WyGXF8qLD+qRtvt3QOM68jCji8Lky1J6e4O5PmCQ6qfyfGQZOrGgo/pVIh8RBJwNfuHpHLRK4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 05/10] x86: update GADDR based secondary time area
Date: Mon,  2 Oct 2023 17:11:22 +0200
Message-ID: <20231002151127.71020-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f80fff-3d39-46cd-2972-08dbc359f4cd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KsjqnjP8HSqcz1r/jmxL8+7mA078ZNXbNRwz5KNLtoHuHUZatZc+WXUfDMfACD5QwgM7plLnZf3SoO5JlwWg5pbaQHyJFX0s7MsUSvCelvBGp7rIrM2eB2iKrTq29VF+HP8krU1dSQw3l+q3SIZhiS6CBDklWHQ7EhyTaQoIbl9HEdFvMgRsTIt3HmXfdVH/OTdQx7/XYK0ydmGA2/EaULKnJ+0V5cKAGqUc8CFmK7iFcCD4bkYQAjNsRCPZg9B7PMGlK6okpJ6GU5JgE0Kcgaz1fJqP975URVeP9KBdt4p9F50CY77LIByP4jJNzjwlYWYNxxxVANrbJ5kEQocC8bgSPVujcSt5oxcg4WrzE3erQ9XzDC6L2lVLqp1KjQxxAppTS1cknDtPww8HGoQdTGcxFrcHPUzPurfcsbuOV8SPl5KY1XSNyXv3X4afD6sFr8tzfFsfgTopp+iOfMdaErrrAYTDtqoioNzYtqKUTuIzCMZfKYV40+hnYZsWFM7DAnKmkkRTYuFcjUVLlEP5NZBLjoB1gvqRyMJhpCylJ+CTz2W54S/LBBQVMXeSaIx6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(4326008)(8676002)(5660300002)(8936002)(6512007)(478600001)(6666004)(6486002)(2906002)(15650500001)(6506007)(26005)(1076003)(83380400001)(2616005)(66476007)(66556008)(54906003)(316002)(36756003)(41300700001)(86362001)(82960400001)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2w0dWVmMlFJSGUxVENMVit2eWRBZDUwT0MxaXBHb2JVRkxaTEE2SHV6WTRx?=
 =?utf-8?B?amN0TUtocGsvVTYyUm1hMU5nbU10Y1lpYlhQYnU0WFFTRU5EeDdUT0Vicmxj?=
 =?utf-8?B?dkVXTFVsZjRQZW5hMy95N29FTDdNM3NuSVVBODg1VlJDc0dBWGkveW1PQkd3?=
 =?utf-8?B?SlJyUE9xdmtsN1FsS0E5YklueW13elB6TFFQbUpFY1EwMCtYMzU0TmZ3eGRu?=
 =?utf-8?B?L2lLTnpzWk5DdGZGRXF4aDdoWGZSclV1NFdWVnlXQjlvbFlnaXJ6aEdMa0lP?=
 =?utf-8?B?cWJDTjNwUXlhTVV2MXF1Z3NIdjRqdENJZnFDazhiQ09ZUGt6ZXczOWVnS01J?=
 =?utf-8?B?Y3Vqc25ka1BsZWp1WW5zREkwWmlOMmZxaGUyTk9uOC9vWG1hTHlqZ09vNjIr?=
 =?utf-8?B?WVIwQlFpc3NLdFpEZ3NPU2hYSDZNMllyUkZKU0cyRUFkOXAvWEhZRXdEVkN1?=
 =?utf-8?B?bFhmbkE0cCtIajY3RjByc1c3a2pmNVoxcHNSbzlxRlBNMnFESWxrQ083Qi9D?=
 =?utf-8?B?SXpzUndvOThqQTZzZVl2VFhlMCt3YU9TSkk5cnppcGdkNHdxM1ZLeSs2Y05l?=
 =?utf-8?B?Qkg5emdSNDJPUkdicGlocGppSEZkYU5mUkJ3eU81dFQ1ZkZmUXVyeHFPbWQ1?=
 =?utf-8?B?Y3VZMW1YRzFKVy9sT0R6K3MvMEVMb3V5ZS9SbzNTOXBVeis0UUlZWnYxbXJM?=
 =?utf-8?B?M1JiTnN3Y3Bra0JKSnhiMkpOcjZQZmVsZ3ZwQndicUMvYTQ3VXdINnVOMEhH?=
 =?utf-8?B?OVBLd2FXL2VTajRHQWNUWlp4ajVLL0NWNkhoSjRLV3oza2liVEo3WGxJc2M5?=
 =?utf-8?B?RmRwb1gvNFU3WHRCbHdEZ2xEWGRnTFQ4THNxVW90NXlZdERmQWNZM3NEZjRh?=
 =?utf-8?B?endEb1FmVmNsSk5oWW1uVjV5RWsxbW1lb3dtK0FTQmQ5ZHFmcTlncTMxaGwr?=
 =?utf-8?B?L3BYSmZtODR3VHZ6NjBCSlIwWWpCUGNZQlBCNklxaHN2eDZVTEdNY05CQ2VX?=
 =?utf-8?B?ZDh3c1dKZGlnVTE3Z05TdTZIUFVtK0hHeUFFaEVLdGdKN0FtSDRXS0s5bWt0?=
 =?utf-8?B?a2Fsa2VSRWxaZWFjVkJOZHhUbjd6VkpLZWZaMjZmVm5PaUlyT3daVDB4Rk53?=
 =?utf-8?B?N2pNdFM1dE9JckJtSTJsVFk3aXI4OFhBSXY0SEg1M2dvYXJGZ3ByZnJ2TS9K?=
 =?utf-8?B?U0htYTF1TGJBYUsvK25Ba2IzOWJ0WHRIdTNWRkxrcXVJRUlvQ1JTU0V5Ymov?=
 =?utf-8?B?U0ZRSU0wTTByMVkvMGRrN3FFWS9vcC9iQ25RVlNZeENETVJHWkV5TE1xb2tl?=
 =?utf-8?B?a01JZXdiSVJUL3hyRmNtL1lLWEtRVzhBYlhORDNYQ2JiQlpob2tvSzRQZlBU?=
 =?utf-8?B?WFpLeG94aWJ0RW1VVktNcW0vck16Znl0SHV2L0RKby92dDJsWDJkZnZnWmlj?=
 =?utf-8?B?Sm9QREp6ckNVcmVPaURHbzJMQ0d4UlhSQWhTaTcwSCtDYUxsWHJMeURwckNO?=
 =?utf-8?B?SEtmd1VGVElBUEs4ZEpKTkVsNXVJN2hZNFNHQm8vTkhtREp4cStuQ3hjR29E?=
 =?utf-8?B?elY5d2NZV1VBelhRSmYvZWtPemhIUkcwZjRuTkNvb0FwL1crRlZtN2xMK2ZH?=
 =?utf-8?B?LzNzSy95UVAyOHVQVitzcWpXVGlSR0pqdjdZUyt1bWZlR0xxRkJRdWRTY2xw?=
 =?utf-8?B?YitRSnBzMWlIbXB3blAvaFc1Z3hDTmRUT3FBSnQ0M2lMaS96aHZqaDd3TVNZ?=
 =?utf-8?B?dzE0Vm94Y2Q4clJrZ3dwRHRQWmtZS2dZTlVCVGliZ1plSVMxdmVraTNtU1FF?=
 =?utf-8?B?NE5MTThXc2lUSklvUm1WbGk2VlZQK2dMYkEyYitIV2lVQXZINHhUbnJKcCth?=
 =?utf-8?B?Y3pMNjM4SFd2b2tUTXBVanh0aHB0THFYbXdZaVB0NkZqanpFK1NGTmgySE43?=
 =?utf-8?B?V01tcGxwRXFuR002TkxEUWNQaGsvQlBxQmE2R3lQai9HNmxDMU5nVnVKSEZx?=
 =?utf-8?B?dU42WklzTEhqZzVqd0paY3F4cEtMSFJ4c3lkemNGeHh6RXgybmNUTzBaTkpy?=
 =?utf-8?B?VUliRFlqdXVvWHYzYXlJa0RiSlVtcHl3dEdSQTZXLzFPTzF3NjNYVS9OM3dy?=
 =?utf-8?Q?M5c+Q+sGyvvxLh31aOIvuDCrV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nrp3AaXIguPWEEWFygW5hPYaBJIXg5obRusdCww3C9Krc+YnBvqLXZCuSeNvVVq0lAtDyYRsa9gwXmZzOJ1RfRhPZyB8n/bkIskwkkB5ycc6CJpMEO7ZBeWEP+UVqyzSXzpyRkv5njylnzKZd0+C5+lo4RJyri5FvYQjQzVPUodGfyPlC7iZ1rr9gFSZAE1zgudlB4RMsN9i/etxnKFFwn1uACeyM6ZaizLEZNTaIaXblWzWuzgCye73FTt2etOu2fIAswuaLshpOG0QW3LsPA+3y0V3vE1phq3TG1iwe4Wk4BnLQPYyjy1sbhjy+zd+EYUeDQdc/epzw7/8PB0VdyuIHv3nlXZwOR1Pr+ruCdeaY5HzLm97425yB+J/EuAfou7IYMreZMZ5eKXuLWfsZUGCXsCvAfzCORrfkPrjZtiIA7LIhpmgaGpUitMwRe6GFF3HOslYgqAJZwwM7WryN8aBxp+rwRMUhABra6Lf+Vny1Y3JJKvQuk55dLDDCKR5L+1KQEC4fxr0eZxyD2uILEqnbX9vmKY4r/ducd/hq8cjtU+hcgIpok1tjTvh8riwKxqLYQD4xaHCeFgCT6WPPZ9YTiNCFI7VQq9zPQDOJ5pyBBjunkIvoBe0xstxdnqIy73lN/XxsVX1P4V+Wfm7EvWkc6/itGquuBMTG5iccuuqO19YlZkvJTI7ARSNF7wFO5ZUA1i+5eDQwxCiqSBvttRbdwrN99wxkUlELDGeImSrFjUPpB61OcTOvfQ0mjxeXAXKO2KiWiWEONj7V+2kXZIKPh/LKnAJgMLF3AwOTIXjKHK8MqPXRmVRNTc/beQx5ZJgb4pB0rMmY0riN6pDrw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f80fff-3d39-46cd-2972-08dbc359f4cd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:13.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNdYtbDuNK+9oED38dcI/JZm403Hjx8qLAkxwoywdphKik/ezoDxqLOdxYOui1oAfbIDRPdH+8+Yr1VFSpv+fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

From: Jan Beulich <jbeulich@suse.com>

Before adding a new vCPU operation to register the secondary time area
by guest-physical address, add code to actually keep such areas up-to-
date.

Note that pages aren't marked dirty when written to (matching the
handling of space mapped by map_vcpu_info()), on the basis that the
registrations are lost anyway across migration (or would need re-
populating at the target for transparent migration). Plus the contents
of the areas in question have to be deemed volatile in the first place
(so saving a "most recent" value is pretty meaningless even for e.g.
snapshotting).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/time.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index af40a9993c81..332d2d79aeae 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1566,12 +1566,34 @@ static void __update_vcpu_system_time(struct vcpu *v, int force)
         v->arch.pv.pending_system_time = _u;
 }
 
+static void write_time_guest_area(struct vcpu_time_info *map,
+                                  const struct vcpu_time_info *src)
+{
+    /* 1. Update userspace version. */
+    write_atomic(&map->version, src->version);
+    smp_wmb();
+
+    /* 2. Update all other userspace fields. */
+    *map = *src;
+
+    /* 3. Update userspace version again. */
+    smp_wmb();
+    write_atomic(&map->version, version_update_end(src->version));
+}
+
 bool update_secondary_system_time(struct vcpu *v,
                                   struct vcpu_time_info *u)
 {
     XEN_GUEST_HANDLE(vcpu_time_info_t) user_u = v->arch.time_info_guest;
+    struct vcpu_time_info *map = v->arch.time_guest_area.map;
     struct guest_memory_policy policy = { .nested_guest_mode = false };
 
+    if ( map )
+    {
+        write_time_guest_area(map, u);
+        return true;
+    }
+
     if ( guest_handle_is_null(user_u) )
         return true;
 
-- 
2.42.0


