Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA396A10EA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 20:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500682.772154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVHhx-0008QA-0I; Thu, 23 Feb 2023 19:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500682.772154; Thu, 23 Feb 2023 19:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVHhw-0008Mq-TG; Thu, 23 Feb 2023 19:56:48 +0000
Received: by outflank-mailman (input) for mailman id 500682;
 Thu, 23 Feb 2023 19:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVHhv-0008Mk-IH
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 19:56:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30a42939-b3b4-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 20:56:44 +0100 (CET)
Received: from mail-dm3nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2023 14:56:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5071.namprd03.prod.outlook.com (2603:10b6:208:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 19:56:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 19:56:36 +0000
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
X-Inumbo-ID: 30a42939-b3b4-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677182204;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zyOLyV+PKQqFWDsR2+Fbj6MZ0evlP7hc9G/W/vzn/24=;
  b=ZMRZ0p55z2468z+lkAiCLzsSKUTWp3rIYR+gLr4P5iaubeEKH0Afz5MR
   jk9CiO8H/+VIYOcD+tyhirQASESIcbaleQp+WvT6QxDYAiy0oVRrhCvqh
   vAThi8vCD4yY0C6WL61W9cNlCbvQRS4YR1MV9KWcCSZw0uWH1LgP3gxBW
   M=;
X-IronPort-RemoteIP: 104.47.56.42
X-IronPort-MID: 98189842
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n6GZX6xTlM++++e2st56t+e9xyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 jdJDTqHPfzeYjDzc9kjPYWwo0MO7MCDn4VgSQo4qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkP6sT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWEU+
 aczKCEDUkyCoruzwYCfdPNtiP12eaEHPKtH0p1h5RfwKK58BLzmGODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVkFYZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKrAdJDROHinhJsqHyc2VwdJgA6bn74ueeG0m66aehvb
 GVBr0LCqoB3riRHVOLVWhSkoXefswAVQdN4HOgz6QXLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rKdsTK7Im4LJHULTTENUQYepdf5yKkxhB/SStdoEIauk8b4Xzr3x
 liisywWl7gVy8kR2M2T/03Dgj+qjojESEgy/Aq/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpl
 HQKkseR7ecKDLmWiTeABu4KGdmUC+2tNTTdhRtjGsIn/jH1oXq7J9gMund5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpkmCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:NdiIvq0n8Sqm3u8Wy4+mWwqjBIkkLtp133Aq2lEZdPU1SL3hqy
 nKpp536faaskd0ZJhNo6HnBEDiexLhHPxOkOws1N6ZNWGMhILPFvAA0WLM+UyDJ8SUzJ876U
 4PSdkGNDQyNzdHZATBjDVQ3+xP/DBPysCVuds=
X-IronPort-AV: E=Sophos;i="5.97,322,1669093200"; 
   d="scan'208";a="98189842"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYTHbAJNfomuzTLeaqTFqn46WDy8vynuYNNGmes7V3EbXoSfd8WizsPSa3rop2dqt6VlEn+z9yae8TDW9BmBgL7SKI5xxY8NRgTHKOr7pmPnUIHjY3kJTMa60qISl6U/YxBlMOHNeMvwoipdAqCSfflFFCpor4SKOctSk/HEgx+sDo0FXry2DSu+2nstEByBmMdiNzejSZ86g6WIjN3ToMrw7WGx+n6GRzcAX6fekBfKfYrXXU5gOzYepITcZmTc2IoYw6B5ZNCMrA/XKWn9bXouRR8o+vOBIC+TjVRKlIFzneAHqv/nZgfbRIutQ1lrt6b6hxNDAATF0R5+2RGvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyOLyV+PKQqFWDsR2+Fbj6MZ0evlP7hc9G/W/vzn/24=;
 b=NTDln5azhqpnJARMol/+bSFTDnJJEaUGFqSguwa9U20fOG2vd/V4fwc919ddowGMXnoCGEJoVLpljkZaCxC783pTWL7dtVawRIabaVTbXvMJ4EbgWztBy9uT0lH4xA1SqNH/rW7MBJ1q1Ch+nYyftgsco+summcmxwNUTucR0qcmZ2lU9nNHuw/0c/dYpWTNdCma/WmsKwDllS4ddEFhOkOWzYovR3eb+GkBcKC5bPyylQ6gOOst2Y6UymMGraV+F5rWsrcpuH1H4vBnUPFgY3PwhxeSkVSVRr9jOpzgoM/3SMJ9dHUn4+bchd+FLng63ZG0MDRu9a/eAFzZGL93Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyOLyV+PKQqFWDsR2+Fbj6MZ0evlP7hc9G/W/vzn/24=;
 b=ZumkQwBAYr/DxlE/2YFI4xLm2bFpCPa8tZwSb1bMzM2wUaKIny78kYaD2T/tXDfIZxZvODi6IlRYNZOTikMmL2KojT6GS/ZFY1WpF5DEYTextjqyako0vSFHPt5mGNXGEZCYFLFtTRVcU1rsHkv6rOvFsYLA3o9/VC/So9yF88o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
Date: Thu, 23 Feb 2023 19:56:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to query
 vcpu statistics
Content-Language: en-GB
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
In-Reply-To: <cover.1665138677.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0026.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::14)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: ff72265d-c9fb-448b-fa34-08db15d81196
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GxzSXe1F1NLZQ0YzFBl+e+7hbxfsLZFKMTKwSsZWDBdwJLrV9pGmAgdQ0K70IhaHD/bDWo4VDLFtRKgTWOwmK762buFAMrZOUQGcIDyP7KPhFfx5BmYA/CwNiyjzJZlPxYxPlMyvNB+OiwxLJblwyd/Z21o31G6WrEwgHfreDzWlE0Qb+40mcQIJv9sCAzn18dxEtdlptMh8q1lMOXjGNabuLnj5NQXrFO+MnZEPlJtRaTW8oQgXdmseapUij+SUXL2nkmaFnELvT8Fkn4pipmSMkGwJ6Yoy53h1EkgrlexP8Ev/tUtFV3hCm1c1dl/HGnv1mzOlDeTEpqoLmLmwCvnDWPSmIY7zXLqjo+z7KV0XNog+vpXbl6h9sK/YXEXldxFYOIoukvP/+uMdzdGXh9rCS1IkrpZJ6DsiO7J+R68XgTFt/YH8EeXzcj05Oq97OO4FkXwL6RrTb0ycmX3lxrxQ9ld4UjlRtEZXB22L+BukIxNVX8GiVV+4ZKkPzvpbPy3qgL1tLuC6w5Pq7qsR+lz+GaVNXlk7SWb6vbjrNxNFg+I8/ISL5J+AlS4IFk0tx8dlvPTY6AgFKsk0myzZ4baWV1135Wa2huJlmilUEDgb+SsMNV+Z418okaDGrYmFVRaZ1S8exHhEnuhoHGpeVms+jwfePgEd0K7L5tI8++VvqDjBC88ww3q5GYoPDmgZ8ZjAGzD9sKHoumUvn1723wpGZ4Rpj+h1FaiNt+J0wd8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199018)(2906002)(31686004)(6486002)(36756003)(66476007)(66556008)(316002)(107886003)(6666004)(41300700001)(2616005)(66946007)(82960400001)(6512007)(6506007)(31696002)(5660300002)(478600001)(83380400001)(54906003)(26005)(8676002)(4326008)(7416002)(186003)(8936002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnhkQ25BbVY1M2RYcjNPaXVLWUo0TGJPZEdXazEyVFY2ekhtUkUyc0ZUekFG?=
 =?utf-8?B?eGJKWHp2NTNPOHdCbFdNL2wxUnhJVDk3U0pSY0MzWWxQd0pWeERwcVFubmtq?=
 =?utf-8?B?emJkSzJsS3dJckRORUxMTStwNjR0NzBUOGxEUTZTclBCVFdFMmVhcjMrRmRr?=
 =?utf-8?B?OStudEhNdDdQeTQwWmlRUW1TVDBTRUZsMmJjenZpeVVSREY3eW1XL253SWpy?=
 =?utf-8?B?MFJabzg5cHRCK2haeDdEQmxwTGRRYWpUbzg2NlVsT0dJQzFHZlcydWVSUSty?=
 =?utf-8?B?UlZrQlRSdkJNMldRQ05OVzNIY2Fud2EzYjNxc2ZjNFJiN2RPblVNdU5yejNu?=
 =?utf-8?B?KzVWVUlJZHN2TE9kdy9xdk1CVzdnWk9rYWJpalE5WUlsbk5KMUIxTkpEekV5?=
 =?utf-8?B?K1NCeURiaUE1bXJwdm9jTFJWcWQrN0V3dSttMXNjMlh1Vk9JcFAxblpzbFNR?=
 =?utf-8?B?aXFZQTkyaWRhUmkrREIrZkRwUTZnTEx2cXFuLzBjT011SGRUQUJqV2dzaGhl?=
 =?utf-8?B?QkdGSndncjd4NUdqWlN6dy9aRlZvWElMcUxKdUNkWHRHKzJBUWNlcnFzK0V3?=
 =?utf-8?B?d3RKSEpZb0hwN2ZDTHVJV1FWbXRLdCtZb1EwQXFmaDFoejB6eGtDYXQwSG1s?=
 =?utf-8?B?MUZmNDl1VThwaHpEczAwN1M2bFBvUWVzVms1N25PYmNKZWg0Z3RXWndnb2ly?=
 =?utf-8?B?WTJPMnN6aitiUFBGNlJIZUZEZmNnQ2tMNUJFbjNZZEd0eXR6ckhGVjV2c3pk?=
 =?utf-8?B?TDZMZnZtNjlXajYrWjN4VmI1Yk5UaVlmRnBIenBLeU11UkdtWmhFOUI1MlpB?=
 =?utf-8?B?em92blJMR3JGOVVRY0NqdE8wY2RDbGtOT3k5eEJrclJMNk1nYkNQbmJqM004?=
 =?utf-8?B?QWM2UnVDNWVkblMwU0lnVXNZQ0pxOUZ4dnBuTFBiMjU0TzhYR29GWENpaDdm?=
 =?utf-8?B?cDFabXN3MGRiY25xVk90TlZHVHZKTjJRNFBaeDJhWkVoZ2JyejJ3V0dxYi92?=
 =?utf-8?B?SUd6bXZBRjMybS9kSktKT2o1T2lIdCtrLzBTaXk3OEQxRDhNeCtSMlEzaWVn?=
 =?utf-8?B?ZVNRNXE5cEx3Wjh6cWMxZDJLelYrZDBTK3lwbmhMSDhEZCtwMUNwNHkrNVdk?=
 =?utf-8?B?anRVcVBPTStpQ3MyYWhJS3pQN1pWa0xGMndHbVhTRVo1cnlDZWVGUGQzNEtG?=
 =?utf-8?B?MmxSQ2NHbmlZcGdSR0o3L3N6RkZqUC9oaElESUpBNXgvSjhsQ0EvczlpUWRL?=
 =?utf-8?B?Slc1UDVHSTRrRWRLek40Rk50QjRXTWZrNHpTQWJpek5lU0krOFdOM0VUbnEx?=
 =?utf-8?B?MlUzbVlzeHpZYm1aQklGQVp3VFBmeHNUTko4S0gyT1VOUUM0TDRmRm1ZYldJ?=
 =?utf-8?B?L2tZTlNObWtuazZZRkxuYnY1T0N5d3MvSUVjNEVFT1dxSW1hNDg4VWY3WHZM?=
 =?utf-8?B?U290R2JpdVM3eWZQM1pqcDRwaFlIUVBJY0IrbjVXMnJtaW9GU2VpQ2N2M2VL?=
 =?utf-8?B?NTJrdlJ5cEVhNk5WdVhDYmtJdlRPdi9UK0ZUWDF4NWNmS2ZBV0M0MXU3QmhP?=
 =?utf-8?B?VmRsQm1LMnNOZVI0THZzSlhaZm5vbVNNOGExVTBoYnhPMXRERHlRZHBmRFF4?=
 =?utf-8?B?a0t2YWE1bWhwUjAxVE9nd3NFQXA0d3VQZjFLclUyemR2RnFFa29TOXlSdlN0?=
 =?utf-8?B?NUIzZklRMnhEeXNFVEFwL09NZ0RnL2ROTndsNitwNXhTQnpXaXZQZ0taRXU0?=
 =?utf-8?B?UXByWjkvNHBrVzMxSGJJQWsxd3lHTG85RWEzN2ZxamI5RzM1a3dxelc1TENV?=
 =?utf-8?B?TmtUNUplemtaZzZhdExYSlpjQ1FXMW9oS01XWUxjays5ODZvU05jbEJPUTR4?=
 =?utf-8?B?RmtZVVdUOUpoSGo4djZKYnJ6YjdhUlltb0tqUWpacDYzazh3eWk1K0J0cFk4?=
 =?utf-8?B?U0xQbm9qVDA1ZTNGQTc0YVpIcnplT3E4VCtTcjhQQnNwb0hSYWVkLzNMMDl6?=
 =?utf-8?B?RWxzTCtoS3h6VVlwL2lrbXlQRUkxeFRJdGsyQmk3d0hqNkMxRlRBdk1ONUho?=
 =?utf-8?B?YW0zTnE2ZUJUcWZYWkYzdkNsc0NWNGFFbFU3UEJkaEwxMWdPRkZRVnJVNW43?=
 =?utf-8?B?VW5lcVBoVUJSQTd1c0xsbVgxMk9nZFh4ZzVtaW5sVGUxemFrSU82eVB4S0Ur?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rMUZ52WQnyKwI5tYXrYSUtTJYQwbYaQwCtnHCUeJb3ybKy6PjT3fS+NwWuSWVCop9atFDjKaEndfz/Il99QJoLlNPjNce5783vU2RCsz8pf7hBmLoPUCKiI9l2ePjVIwxQz945QNenZF4ivlR8epbqAQcb14YjNyhW4ycw5hK2DSWe7eUwMej+cZsqQdS513pEIb142ABjKwmb9KlCqOvIAutulVLREOYbZjqYxmALWIUyG72t1XLrZbKTm1pKpZlKSpMVXBmrxma7xgcntWSArPlNAXrq2hsfLFF8j86wcF+AvdMCicyaFR2POYfqfL9vEKOfeEoXyxNzaAgKcG6sSoNFGPYTIgEZZm8UGD3PvuaSUimNWqd+bW7IQd3JqiO1Lmn2l/9GS89tdS4vDX5gKX4oNO7cjY2l2/IqzZDa55JEJSkbotVQU8LTkxNv0KdAOWBMxG/au4MMs5Xk3hSTIlXq9uRAOxvvDh1XYMfl45AhGkluXuLKr0VBA74qg2KwVBSwzKBlkjn1jihlLoP5loy1zesvKlFyv53JWviDpv98R+ky422qWYhgnF4KmvTH+R91U/Xq8ar4t8LofPZyrQW4wlgoK41xjNSSZ324CoG/uYKyDmVdX1A/N9nLtMeY/sBVJzQF29bAdR0QcU1Cl16uTAqtPnEZzOuYcFvZJmuUWu8ynt7nqfgetoRR038CQuSii8MikeYUnV3I3OL1gjYe6/1BKpWTj4pptkITkB/pwFoGSXqwXD+ZwKcjOSOTgYJYTQN1MY0Wn/4AJgT1ZKlSs/Nnn7X4MywmvxOi6HaRrFmG4CkG5grn8xyzbg8kXdtriIAoEGoF3aB9GBItIu+02hJ/iiu6R6Wz2wcdAx0HhVkLqXiXSoJe3bN0L601z5EfiwSgrCpZXtmzSv/g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff72265d-c9fb-448b-fa34-08db15d81196
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 19:56:36.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vANTbHZtDZLWeZIRlb+RTurv8LDNzItCoCQM2FHtZO8w4kyiAQBdeRRdBx8DXLLil607Yehd/l9YaV13cEenG+xt8IruyDfYXDDYyjQARxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5071

A discussion about forward extensible APIs and ABIs here.

First, its important to say that this should be "domain stats" and not
just "vcpu stats".  This is easy to account for now, but hard to
retrofit later.

For the shared memory, we have a minimum granularity of PAGE_SIZE (4k
for now, but this will change in due course on non-x86 architectures),
and a resource-agnostic way of determining the resource size (as a
multiple of the page size).

But there are other things we need to consider:

1) To be sensibly extendable, there needs to be some metadata, and the
domain stats is clearly going to be a different shape to the vcpu stats.

2) We also want to give Xen some flexibility to allocate memory in a
suitable manner for the system.

3) Xen and the userspace consuming this interface will likely be built
from different versions of the header.  This needs to inter-operate with
the common subset of functionality.


So what we want, at least to describe the shape, is something like this:

struct dom_shmem_stats {
    uint32_t dom_size; // sizeof(dom)
    uint32_t vcpu_offs;
    uint32_t vcpu_size; // sizeof(vcpu)
    uint32_t vcpu_stride;
    ...
};

struct vcpu_shmem_stats {
    ...
};

where the data layout shall be that there is one dom structure starting
at 0, and an array of vcpu_stride objects starting at vcpu_offset.

Obviously, some invariants apply.  vcpu_offs >= dom_size, and
vcpu_stride >= vcpu_size.  The total size of the mapping must be larger
than vcpu_offs + vcpus * vcpu_stride  (and no, I intentionally don't
care about the rounding at the end because it doesn't change things in
practice.)

A very simple layout, packing the data as closely as reasonable, might be:

vcpu_offs = roundup(sizeof(dom), cacheline_size)
vcpu_stride = roundup(sizeof(vcpu), cacheline_size);

but Xen might have reason to use some other rounding.  As the dom or
vcpu size approaches a page, then Xen will want to change allocation
scheme to use page size for both, and not vmap the lot as one
consecutive region.



For the stats data itself, there wants to be some indication of what
data Xen is producing, so userspace can know not to bother consuming. 
So something like:

struct $foo_stats {
    ...

#define STATS_A (1u << 0)
#define STATS_B (1u << 2)
    uint32_t stats_active;
   
    struct $foo_stats_a {
        uint32_t single_field;
        ... // maybe other singleton fields
    };

    struct $foo_stats_b {
        uint32_t seq;  // "seq" is more common than "version"
        uint32_t _pad;
        uint64_t field1;
        uint64_t field2;
        ...
    };
};


Forward compatibility rules say that you can only ever append new
fields.  But as hinted at with the stats_active field, its fine to leave
reserved fields around for future use, generally with a rule that
anything reserved shall be 0.

Importantly, this means that offsetof(dom, stats_b) is fixed, and will
inter-operate just fine if e.g. userspace knows about a stats_c that Xen
doesn't know about.

But this does highlight some more invariants.  Xen must not produce any
data outside of [0, vcpu_offs) for dom data, and [base, vcpu_stride) for
vcpu data.

Furthermore, Xen should not produce any data not indicated by the
stats_active field.  That said, if Xen is compiled knowing about
dom->stats_c, and userspace is not, then userspace will observe Xen
advertising a stat it doesn't know, and producing data beyond
userspace's sizeof(dom), but within dom->vcpu_offs.  This is explicitly
fine and expected, and why Xen writes it's sizeof() information into the
dom header.  This allows both sides to agree on the layout even when
they're not compiled from identical copies of the header.



A few closing thoughts.

1) It is wise to have a magic number at the head of each dom and vcpu
struct.  This helps sanity check that both sides have correctly agreed
on the layout, but can also serve double duty as an ABI "version".  If
we screw up spectacularly, and decide that the best course of action is
to break backwards compatibility, then we can change the magic and edit
the structs in a non-forwards-compatible way.

2) We may get to a point of wanting arch specific stats.  This can be
accommodated in the model by having struct arch_{dom,vcpu}_stats at
positions described by the layout at the start of dom.  It would be wise
to leave space (reserved fields) there to use if necessary.  This is
cleaner than deciding that we need to put some new layout fields after
the latest $foo_stats_$N and before $foo_stats_$M.

3) It would be great if we could have something in tools/tests/ which
can attach to a running VM and assess the correctness of the invariants
given.  Better yet if it could compile for each change of the ABI and
assess the correctness for all.


I hope this all makes sense.  I know its not trivial, but there's also
nothing in here which is rocket science, and with a bit of good design
work up front, it will be a flexible interface that we never have to
break backwards compatibility with.

~Andrew

