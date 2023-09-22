Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978627AACB4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 10:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606781.944816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbaG-0000hJ-12; Fri, 22 Sep 2023 08:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606781.944816; Fri, 22 Sep 2023 08:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbaF-0000eX-UI; Fri, 22 Sep 2023 08:32:19 +0000
Received: by outflank-mailman (input) for mailman id 606781;
 Fri, 22 Sep 2023 08:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CgRi=FG=citrix.com=prvs=622ae25b4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjbaE-0000eR-CI
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 08:32:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87849efc-5922-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 10:32:14 +0200 (CEST)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2023 04:32:11 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by MW4PR03MB6965.namprd03.prod.outlook.com (2603:10b6:303:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31; Fri, 22 Sep
 2023 08:32:08 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 08:32:08 +0000
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
X-Inumbo-ID: 87849efc-5922-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695371534;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s2MuC4RhzzNkgabhArhM25SNCwEIYo/l0iwhhYRCazI=;
  b=LRQAMn68f4PUDB3P4RxynCfUtn3PacNDPNkDDYFldZk3eyd8KwMe1Gn8
   BSfvpm9A+ew1He23U5+QAr4M4BlwsLH8ObSxQ11gbzsR+YXrfrjBVe+jU
   q6apLP8rA+JkmJiH92qdQFSPU6Tl9g6o/gRHtr7nf5fvPYBx86HVjesvF
   s=;
X-CSE-ConnectionGUID: rGHISn1xReWy2M95g8v6rA==
X-CSE-MsgGUID: gjN8EwZVTJqLUERfb0961Q==
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 123904253
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:a0f9HKOI+sWYFvjvrR0/lsFynXyQoLVcMsEvi/4bfWQNrUpxhWMDz
 DBOCGuPPPfZZWv9ed5xat/n9xlSvZHcnYQwHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42tJ5AZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vxYIUB18
 6UIEj0yf0qm1r+5kKzlUMA506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvze7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCn93rOVwHiTtIQ6G7+eptN1smOv5HU3NTAsW1Hj8KfgsxvrMz5YA
 wlOksY0loAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqG6rqLpCmufygUKWMPbzUNSwct6tzv5oo0i3rnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjoPSUgc/6wHTX2SkxgB0foioY8qv81ezxfRdKIeUSHGRs
 X5CnNKRhMgEAIuRjiWLTKMIFauw+veeGDTGhBhkGJxJyti203uqfIQV+zcnIk5sapwAYWWxP
 BCVvh5N7phOOnfsdbVwf4+6F8Uty+7nCMjhUffXKNFJZ/CdaTO6wc2nXmbIt0iFraTmufhX1
 UuzGSp0MUsnNA==
IronPort-HdrOrdr: A9a23:w+OTY6uEgl3IjyYFqwUnjm/67skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-Talos-CUID: 9a23:gdVaN27ax+nbnjuIKNss7mE0O/sjK23nwUjBeWrpVGk5VuOPYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AJ3cSPg9ZG8aLjKmO4yxq0OCQf8hqxfSDF3Izrbc?=
 =?us-ascii?q?fn/SpDyJ6Y2bD1Q3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,167,1694750400"; 
   d="scan'208";a="123904253"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNI1bLmhB410bRK96psfIweCWJt5sJpDRdVI6e0M7788vHg3FDaJhDVzwl6l8wt4BVWov6jPo8sxue0NvL7lYD+N670F174uAHDiHlNI9eCE9oPWQfzEGlL9SBUgOspJ0A8CIozkNtYXiRtikfRBlGzbRHNDu8hv9pXpmyzXmboaMW1q5SsopnZlY+ckG1fAlfuwTwdlBz3BaLSftUzIwG0p84FGwucOef+/2ip8dRwLecfKLKiRStdjvn2Fx06hjThRdmCfPREpfseT2e8C5Se5XH7vFU84T0S6R1gp0Djot5qjNDoddguPUC+/825FxycRGN20tgNavaASlpW73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nvizTNSUCdJ8DtlHI8iR/2dZ0aIS4CCIf3a/DsWljM=;
 b=VwLf1vMPzcbWw7Y2SJXxp8yFCs2KG0A9b7Erl440FEdU5DxnXPbecC+IG5QkIoB60hHcjrj5DISYQd539kwE1EBP4Q1guU0cMCCZkKlSTMMUdEa4tKr6kBHf3E20w9yjSQEGPBpoxKTZHsbfP+Tr7dLVbU01LeaF8iifjOANJ1B1UeAnJv1lUzzsitWLHd2DO9pAlWaeQuW/hRB7c90WteWeIlD2PyyYxzZlheHSsJi9jWiw22tye91uuX50GvmrVa+dX+Rpj0YCj/BycJNwld/J8MrcCOHfKIAgXrJ8WLpeixyLyyyskpf6pZASGSl+stYVziE9RrnKQAE9TvOJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nvizTNSUCdJ8DtlHI8iR/2dZ0aIS4CCIf3a/DsWljM=;
 b=EISsvuIJfXDU4sn7hoy7NBwQ0n/yVwuljs7sm4DnIM+GcmNUNFtAWjeDsjljL/AoqPLNciHefUEtvq2QhAhb7c4Zs80cCp5GdfCLarZMn/pNqRrKVCJFdkopWFUM36w6whZzS7DzVkEQk51kH3QYak1Cc0kk5yNoEovPhxF9cgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 Sep 2023 10:32:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v9 13/16] xen/arm: translate virtual PCI bus topology for
 guests
Message-ID: <ZQ1RApe7wrKUIrM_@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-14-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-14-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|MW4PR03MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa51f25-f4c5-46c2-2384-08dbbb46689c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PlrrhxhFMH1eGo711qAV6xJDEY9b4LAlAskSvWdYQDDc4mL/yG1AfGKrVBqHXfQXFbpX7tcK++BgyENwtD4E7+Gvxi/mxF3N8GaZTekefp1Ri+3yZkY+Wg4hw2Z08I74dwDddONt7B+HloynvV93hFIZubp83ZFOr0iDUAL/4dIwnflRjrqBwizwM4hOjDbpyYN2tCfwbdVfP7aon2d1OXhGYadruoup02GHKKHLY61i3Va02E2i+d8TeeYozmCeJQ0dbUuwDL7uKXo/hWGp1IVuXwokUXlsd6JkTRE+XgMc0xkqSEEdAiXqcIaOBkhyOhuwd01nPzW+EKo9yytQiXcxRHIrrv7cb3o8px5GKxkgRbAyb/VdQ5xtvlW5nVQ1Ko/eK/O0esG7tApNYGdBFuX9LT/eHKZ3FE9CkXFVcCEuZ+tpSbzahamljk86DTbaE9UYQNd6PnZTWuTB6w+xbpmskXNNKeGfautWfDY9filQzWP9lsibmE3A2PGY3/fZ0dBqk+ajWMz11+oTbrs2iHlHfqZUy39FOUYTWtpLmbq912jgdlfD7FNqIP3e5UAu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(366004)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(33716001)(2906002)(66556008)(66476007)(5660300002)(41300700001)(316002)(86362001)(8676002)(66946007)(6916009)(8936002)(54906003)(85182001)(4326008)(83380400001)(38100700002)(26005)(478600001)(6512007)(9686003)(82960400001)(6666004)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDZqdkFFRGxlN2RpOEphN2FYQzRxTTk1MFpXSXBZckw2bkJiT0NUL2xGd2lt?=
 =?utf-8?B?UTZ5L2YvWWF1bUw1YmUzbEIyU0NydENJQUUxbTZmY3VqVGNRTGxyWGNJdnR6?=
 =?utf-8?B?WDZHbitJbFhMMTRhb2daYmhuNEZFZ0pzTS9mMk1ON0pwUHQxRTh1MHorMUlX?=
 =?utf-8?B?My9mcmRCazhPeEpQZjZYTXo0UFlaOC9tUzdCZzhqcUhOdWsyb2VPcUVTSnZJ?=
 =?utf-8?B?NFUxdUh4S0ZpV3d6WHQ3QWI3UmZjcThHa2h3V0xZWUdJOFZMNWJsMDVLU1hm?=
 =?utf-8?B?dThhLy9sSkd6dXI3Vi82clN6L3BRUVFOckF4MExFVVBvM290Q2hXWERGejNR?=
 =?utf-8?B?d0hhMjkwdlRZK2VaWWN5TE1aUTZFTUtLMHIzdTZHMkFmRU1OY2dNaGRTQXk2?=
 =?utf-8?B?K3JML2xYOStIZXhqZnEwZ2JwQUhmSVE1L0tGaUpVTDNranFNTmpjUkFwNjY1?=
 =?utf-8?B?YkpkK0hCUlYreEZYMHY4eGREbmhObUYzc0VnckY2Q3B1SWxUcHlOSE8zMGZZ?=
 =?utf-8?B?ek8zZFNNU1dtRXcxZTM4anBxQ2VpUDNjOXNFbTQ0bGxuMnlENnVmMERhMHJT?=
 =?utf-8?B?OHhWdlhzVXhQMitCeDhwMjc5YUNhem4xUU93YUUxc0UzaTJJVlZQKytjT2RP?=
 =?utf-8?B?bVlWVW9rSnRvSnF2T21MUldYZ1RsMTF1b28wbUNFMWZpamViQllzSnQ4amM3?=
 =?utf-8?B?RGg2dXgrWWxjekUwcmUzWXZXeHF2Q2NtREs5Z3dmY2s2R2gzYUlmQm02cXFl?=
 =?utf-8?B?bnVUT0YycDMzVWhXKytKY2hHaHZBbFoyK1lrV080S0Z5b2ZwU21BOG9GTEhk?=
 =?utf-8?B?SlJBYkpRMWpjOVZ2RVV1bTNVampkdThQeUVNQUIwWHgzUVZHb2VzaXdTT0c5?=
 =?utf-8?B?NmlOSEhmYkdxM1dTcU5iY0twZ003NzFibTd1aDBxTnI4YzJYdFhqREYzTlpy?=
 =?utf-8?B?dVkrQTN1cEpvN3JwYWtwem44THpWZlgySFRhU0g4VWREd2pYM2U2Zm43Qmtx?=
 =?utf-8?B?UXJLU00rTjB2UmpKSGFsQW9KakZCTjEvUGNRa2xSZENVMXNTNmxSMWpWeGl6?=
 =?utf-8?B?U2JPcnR0M3VOek9tYU9HR2NzK09sYjNuV3ZiTVBWNlVHb3NTcWRnbm9ITUdW?=
 =?utf-8?B?TVpkd1Z4bndjcVo5UG1XNFlJSEFWcDJTejNzaExMSml1QmJyemZRYmt6RWNZ?=
 =?utf-8?B?QXhhWkNiR05CcGt5bGUvdGZINjFnWUo3YUlJaHlINHBzcHE4REV0N1lmZjRY?=
 =?utf-8?B?Z05LS0MrUlpEV21ucUV0cVpQbkRTa2VLbVdDZys4TUx1akJ1S2dtVjJoUHp1?=
 =?utf-8?B?UTluNmlDM0QvRWVOTWpzWVBBRFBXQy9TV0ZJQ3Fvc0dEV09YYVBSSHZ5eHhY?=
 =?utf-8?B?TXVqOWxIQWQ3MUlOYTN6dW9vQ2pudkpZRmdZT0lrQ29zT2tBWGhldEpSY3FD?=
 =?utf-8?B?WGR6V1A2S3cveXlZNm1IZmFJdEoveFNVdnRCWnNvNnRzUlNmSTE5MGpkOURM?=
 =?utf-8?B?UHU2dGRKSmhnNWZqbW5Nb3kzVkRudHFhYnhwNHdUTHhieC91SGVteWh4SXNY?=
 =?utf-8?B?Y21YdlRFbTJlTVNlaEUyZkZIclVoYVB3OVpCTnByTDZ6MDBTWHJ2OGR2anZK?=
 =?utf-8?B?Yi9mNTB1MXJWdHRYZHlrbVZQVVlDdHEwNDkvSUxSS3pjL0xuSDBnaUZMcmRU?=
 =?utf-8?B?NlZWZklVNEVUUG9JTkRDMU4yNGtrT2prY3Fmb2ZST1BxNUhoVjZIRzFYQkJj?=
 =?utf-8?B?cWlwaGV5UjZkajRBUFJmcUVoV2lLSDRmekJ0STEvM0h6dWtGUGVVNHFIZFZ6?=
 =?utf-8?B?Y2ZpY1NaUFZMYmRveW9KOHlSY2NXTXJYaXhwSG9mSXdoc1YyeWdqTUE2TzQ0?=
 =?utf-8?B?SExPRFIvTEV6MGY0RmlQY1VacVJRQkZQMHdPbjBqUWNRQmprMEVTaXUwNVd3?=
 =?utf-8?B?U0xUSm5ZL2NSOWVEWFBLekpyL2NJLy9jUGVPcndjR2FRLytvdmxtb0lnbWlJ?=
 =?utf-8?B?RG1VK1ZGeUY5U0h1QjBobVE5NGg3ekZuM1RsNllLU0pRM3Z0SWllWEpvMW1Z?=
 =?utf-8?B?UC9JbXo5aW0vZ0dZRW9Ta3p1eDRydVc4RW5uYUF5aTZvWGdjenRkekJxN25L?=
 =?utf-8?Q?ywnsFyZN47qX2/H/7UL/XgPGH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YCp1l5iyKyHutJ/USrnbDco8sPQdGXHWGKGF2AUZOGhUKwcSOQyyGUYEgN5TVCW7WFyTAD3P2va2OTIIIN/05f+nIzwJjwc0MCQtZSRkNjBx1EFCxjRnygxNM+RKBreyHIzjxtQdYkfughtJqI5JLZY28CnwkccSH6P6y6Z2LMcYwi2BgDupWUBgs/MCzkrNihHyxhruejweJUIBvxhpl/0jYwtF+J3D1Q0XhfNX3GDCcTCqLagnbxT9YEng0esis9Loq/yrBIKzLnKH0uq7SX4tJXN18SBR7/gICMiH+JiPp3m2kTMg7hJ8fbgGbLKGON7+JnPdQutSHh5ecqVtx9vybNb+AvzDlHhJUhtMedhwXA4TLdMrEPYc9AfyaxHOZyJNt/r77ceimriuREedGE8OwdLViRA6P/TwueG9TUMvxBefnBqau0HmOvM1KTglImVOhbF/VKiMqA60maWxHLlWB/uHF82UP8fODQA96s4EdhrMs4Hd6uBNdHD2+UcdhgCkRSLZUocLnL5WRDrjlEHILfum+TERAe25jaaSHBtd8Hp3+fW88Rxd3I+AP9G65VTyAUQKZNxJUJN86v66HZu6pXmNsjUmXTYBIAJoumtcUrNxTAMAJ9PDAH4ZP8oRzBLOppE3JJpzb3n2gNaR48SdQpNxQgaSt5PA/CVKKgwRXcgiIrOfDO46e824KUxmP3WsOtdXPBJ//ciZvHdpwy36TjthAl4LG6oZEEAyf/vUpv7EiMH1lfEOdUfQw6fxmT/6es2t9/4a4x24fmVcIC3NPdiLyYqXgW0CEC1iVIkfERph1ONrXCwSUuy4szTywbLBwuo9uXoVaHs+Mh3g6EeLcxNdhC+8aKUyWiiN5JbQhQq6S1yJs82hiBABvHnWoHZ9XWbBK75AstKFkjLlWw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa51f25-f4c5-46c2-2384-08dbbb46689c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 08:32:08.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2Jx7Pd+RhDn1eJ5lkQGqrRrVitTqVfnTsqbbMm0dOq2JHr+tznieEXc/LOvyZglGAmKDpBbQ+rvZIh4cnHUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6965

On Tue, Aug 29, 2023 at 11:19:46PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v9:
> - Commend about required lock replaced with ASSERT()
> - Style fixes
> - call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
> Since v8:
> - locks moved out of vpci_translate_virtual_device()
> Since v6:
> - add pcidevs locking to vpci_translate_virtual_device
> - update wrt to the new locking scheme
> Since v5:
> - add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
>   case to simplify ifdefery
> - add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
> - reset output register on failed virtual SBDF translation
> Since v4:
> - indentation fixes
> - constify struct domain
> - updated commit message
> - updates to the new locking scheme (pdev->vpci_lock)
> Since v3:
> - revisit locking
> - move code to vpci.c
> Since v2:
>  - pass struct domain instead of struct vcpu
>  - constify arguments where possible
>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/arch/arm/vpci.c     | 51 ++++++++++++++++++++++++++++++++---------
>  xen/drivers/vpci/vpci.c | 25 +++++++++++++++++++-
>  xen/include/xen/vpci.h  | 10 ++++++++
>  3 files changed, 74 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 3bc4bb5508..58e2a20135 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -7,31 +7,55 @@
>  
>  #include <asm/mmio.h>
>  
> -static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
> -                                     paddr_t gpa)
> +static bool_t vpci_sbdf_from_gpa(struct domain *d,

Plain bool please.

> +                                 const struct pci_host_bridge *bridge,
> +                                 paddr_t gpa, pci_sbdf_t *sbdf)
>  {
> -    pci_sbdf_t sbdf;
> +    ASSERT(sbdf);
>  
>      if ( bridge )
>      {
> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
> -        sbdf.seg = bridge->segment;
> -        sbdf.bus += bridge->cfg->busn_start;
> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
> +        sbdf->seg = bridge->segment;
> +        sbdf->bus += bridge->cfg->busn_start;
>      }
>      else
> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> -
> -    return sbdf;
> +    {
> +        bool translated;
> +
> +        /*
> +         * For the passed through devices we need to map their virtual SBDF
> +         * to the physical PCI device being passed through.
> +         */
> +        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> +        read_lock(&d->pci_lock);
> +        translated = vpci_translate_virtual_device(d, sbdf);
> +        read_unlock(&d->pci_lock);
> +
> +        if ( !translated )
> +        {
> +            return false;
> +        }
> +    }
> +    return true;

You could define translated = true at the top level of the function
and then set it to `translated = vpci_translate_virtual_device(d,
sbdf);` and have a single return in the function that returns
`translated`:

bool translated = true;

if ( bridge )
{
    ...
}
else
{
    ...
    translated = vpci_translate_virtual_device(d, sbdf);
    ...
}
return translated;

Thanks, Roger.

