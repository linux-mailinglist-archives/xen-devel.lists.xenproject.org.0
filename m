Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD167809E0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585926.917139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwYt-0006fT-A6; Fri, 18 Aug 2023 10:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585926.917139; Fri, 18 Aug 2023 10:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwYt-0006c8-7K; Fri, 18 Aug 2023 10:18:35 +0000
Received: by outflank-mailman (input) for mailman id 585926;
 Fri, 18 Aug 2023 10:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWwYs-0006c2-El
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:18:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a04a58-3db0-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 12:18:28 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 06:18:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4923.namprd03.prod.outlook.com (2603:10b6:5:1e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 10:18:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 10:18:19 +0000
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
X-Inumbo-ID: 91a04a58-3db0-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692353908;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BDYwlAem/LmKHHoLYf3ryOYFkU2M+VOKdRZeieRmwns=;
  b=igKDWFaIdMHPEbQbjaQ83msRsCaBPvLzOK0Clr8FMcFwJqYzSuQTN0zQ
   v8TmrrZ+bmfDMfWzEm73JZ/OygDfA6kjb1N3hJihmHZJTmiMUqDCcuWbb
   yenqroI46+1pBuZrKydK9aujRDs8g8g70u68Jw5355Y3JEkPq9O00TjDu
   M=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 122561465
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nisOXKlMaqST8p9BtY4glXvo5gyjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWGCOMquDMWrxedsjYN/jo05SuZ/XyddlTwNlry0wQSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgb5Q+GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fk/FW0OPz6AvOyZkI67V8Zi3sY7PMa+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOeF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtITuDmr6I03TV/wEQ3WDoabAPjoMK6iwnlae9WB
 xFJ/SMh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mpZ5piBvKF4xnCPTt0oKzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:a53gL6lq4VKbcP+QG1poCrYaSW/pDfLS3DAbv31ZSRFFG/Fw9v
 re+MjzuiWatN98Yh8dcLO7Scy9qBHnhP1ICOAqVN/INmSLhILPFuBfBODZsl/d8kPFltJ15O
 NYaK55B8T3DV9myejHwCTQKadH/PC3tJmyg+HQ1nFsShwvTZpBwUNWNia3e3cGIzWvP/ACZe
 KhDw581kOdUGVSV9+8AHYdWejFupnwrbrDJTMHHQcg8gmSjTWugYSKaCSl4g==
X-Talos-CUID: 9a23:ceb+9GO+ginSnO5DXQ5aqU1FNMMefFKN8HfNDEHgC355R+jA
X-Talos-MUID: 9a23:I5ihewjo3WO4L9yrJ+BIFsMpEJdP7532UEE2kpRB4Pu5PAAtZjCUg2Hi
X-IronPort-AV: E=Sophos;i="6.01,182,1684814400"; 
   d="scan'208";a="122561465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0ggcCamaLiVaSHXdQeZHz4RogHUlLp2Sy4QCXD+vAKSxJf6AUs7lwtA3tlUatAiAVr7iUSIuEJBFBN34x9Wz8k+TdQUAYxUWTqBCEeOtqnPXYF1tfX35Q7oE+67ZayK/JzUsnN7rKE13gfjLOxEnA/CywubYzg0jOK411Zq693dW8nJ7/aLoIvmqqvs2l7RpCCmDKtJYnbwzsekrNQTl81ClIY2cL5osmk6h03h4Mn5IuPMRpOamVfv6pCbVBAE7dQqJykACUCu/ueUjWYquYlki24z6fGfNLn5HvhCn97yCH6H7VzHtkJwo3x5J3zipB6v5MTLvqyTanzzSCcTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8rxcG5NehhkNjXvZQ5+TFotq+ci1Zucu0pwzb5LsSI=;
 b=hbRSyS2hpzw173LR0Nvjr3LDFWwjPAj7uoKNuRMSUNlBIPG7P2cFikeBSZAfhHUrXf5rrELaDS6758yBngoLH7MoK+98qzS2lKBnOiWtLqjVxGiBLjBcCVPn0pIu4Ts4zaKrQz6P/QQZ5FPg5Z6rA6vq3t/B3zHIqHjtx4R2faAJFuxN3XBVBzYd0CJXSD1/VET+fa5CLPG0VsQTEi7AXkliNzNT1EhGwYfLHntK5DqiZ/YB+lHtFIesrKz//K/Lo3xKTIrS1FSXFcSSbhLXa8f5ftQTo919MzhTV10RYYofosutT6mE9+wriONY9TnzBNodH71B5LESnmcjxfA01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8rxcG5NehhkNjXvZQ5+TFotq+ci1Zucu0pwzb5LsSI=;
 b=Uh0QuCw4L6WMPE2PMJ2OkedC5Djen1tnVJxKunCvzMG7Qhvsh4tYNABBh2gHAV0qkqvNkyqTGSnHpfaEQNC2R87PwTgLp6qxQe1gWDHPR1jibQAt58jPJqQ2TJEVlxmU9FCjiM23GCO7vQozSGc/Jhr1ullIJAczPOHx8006UmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b34854e8-d99d-bb56-2afe-d5d9a520d83b@citrix.com>
Date: Fri, 18 Aug 2023 11:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] rombios: Work around GCC issue 99578
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230817204506.34827-1-andrew.cooper3@citrix.com>
 <622e33b5-7fae-ba1e-0100-667cd9b50ceb@suse.com>
 <e5f790ac-2f8d-7da8-8e6e-5691615e7d59@citrix.com>
 <76efe3d1-d89b-cd60-2112-740510467a1d@suse.com>
In-Reply-To: <76efe3d1-d89b-cd60-2112-740510467a1d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c22c93-aa35-4273-6300-08db9fd47160
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3UjEjT8Qj+OrHPgz8C3lT1zUw5V03baBrp/vS+9+lpeL97HQi2v25N8dzdwHJPdPYG9SyhU5eN+sjDrrS0xh49zLjORFFElFtd/zr4/Tyx7EGw/20iy5CQPNPVk+v6xCFw12ZlTuzi2+nBDmIlzkAzI34WNWer0w+mKmYqXz3OlUYTutbdYJH0tBz65Eu7Q8Wq38Fds6wcbAFKudkzCNaZODDgnO1Evml4EpAyumneGjb2k33k55S0r3ApVoyry93IMHrRwXJh6WO6U/mdSdpDup3Hvv45QGco7W8gAIr5OLRo8oWk+7HTK6d6cTAE046n/nMDx3DWc0r7udw/lNiQ6orVE9RASp8uiSehB3GrkldjmsGCh+XzP6BknD3Td3FCniVSiVQRZtMViY+08reyKJ5Z2GqbOpQURlCaxoaBFhBwXE4NMoD6a37E+apqvaK0L6F9VIeCe0b1jH/FWRAuDLqXvIHP0b5+H3eH4HkwlurQvQFvauEw9xQud9zKwmE6wI0UwMpgtRat49+oqtv4QsuIAwmStk/dfaI9ke9g/Wp5C9BcoiwGVbyfG5/eDZupiAC7LXBZpsbQ1n5G5Dcy1uo7DEXe9bFzX1TeYfYlnKjH9BgkFaPRt7qPFnboM4KU7R0k3KoZL+XOMLO/wPdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199024)(1800799009)(186009)(316002)(2616005)(6666004)(26005)(6486002)(6506007)(53546011)(6512007)(83380400001)(4326008)(5660300002)(8936002)(8676002)(2906002)(478600001)(41300700001)(6916009)(54906003)(66476007)(66556008)(66946007)(38100700002)(36756003)(82960400001)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Lzh2R2ZpVEpWZnlRcks5N0E2dWR0bjlZRStzV0V1L3ZLb3JtWWE0R0dOQ0ZY?=
 =?utf-8?B?Vk9OamVtUUFlNkRjVGlqN1BLZVQzVnJoeUQzRVoxVERmRXRmQ1pEdjdOTWVN?=
 =?utf-8?B?d2hKbElsZ08yRHNPZzNwQXB5VU9XZllORTBaTG5MWHRnSjc0SHRDQUpVTlBV?=
 =?utf-8?B?MjFlekxxdmtSWFVUU2xpWWNlVTlnYmlpRnJsMTJTVzlGN01vQkVQeFhsUDJO?=
 =?utf-8?B?RS8rSUdwYzRicFY1Y3JwOTYrenVJMTIvNkVTaVZhOVI5RWY3dkVYSTZQK2tC?=
 =?utf-8?B?ZWRYaHd2d3VJci8vYzkra3RacHB5S1BDNk9JWWUrbERUNWp6U09RSFlsOGZa?=
 =?utf-8?B?b1UzS3RJVnAwSTVEWTJhU2JwSlFoaTZDK3FjWEpJQm43Mm5idUJ1VC9zUURC?=
 =?utf-8?B?TVU4UTZWajVPcS9IRGtGVlNkZVVOYkp0MlVLeGM5NjN0cWxyZ0pFT012U0pS?=
 =?utf-8?B?ajk3NTRsODBUSy93bjRRUWFqaTZkMGdsaXFyTkRCc3hJd0J4NGFaZVVTRGNs?=
 =?utf-8?B?VUt3a0tINkZ4YkR2TTI1WnRiYnFCNnAxM0JqUXlzN2kvWTN3MTdZUEFkZDEw?=
 =?utf-8?B?bjliRzU1K2Y0cVpsbHg0KzBZczN6VGVIMW5uOTMwbkMwTTV4c2NEWHJGVzh5?=
 =?utf-8?B?ckxGN3ZaQW51YmdLUkZuZm44VTVWaEIvbTBibFVoRDhURjlHcXJlT0haTDZ0?=
 =?utf-8?B?OFZiWXpFRFQ2SnZ5VWpTaTNiM2pHVC9ZSGMzZTErN2Y1Wk41VWxIbWEvSkYv?=
 =?utf-8?B?OVNTRFBmWkhjclJzV2Q3Tk9DRGlWbUZ3Z3k0cGphYXhGYUw2MG5vVHJxYThT?=
 =?utf-8?B?MWhCOXhESW9zNzlGYUdFZ0RMZDdEd2FHVWFYWkx4dVpRNUJyUDg5VjJoQ1pv?=
 =?utf-8?B?NFNqYTZFMHplN3I3djdPWnNXWjU4c2hzTUVZa0FEU1JrRml2YTZ2TENhL3pC?=
 =?utf-8?B?QlpFUVlZaE0wTlM0ZkJBbm9VUXNXWkU1R3BpNW8yOUgzR1A4d0tSY094U09T?=
 =?utf-8?B?T1dtbjZWemgvSmtCcC9YNmdrSitqekg4dmwxNFV6d3U2SnJ2dGgwYXppYkxi?=
 =?utf-8?B?VzV3M3VBM2s0bFhhL2dUSDRtenIzWjg3a2Frb0ZWWWZlTXBuaDRPaUxocWJC?=
 =?utf-8?B?bm9lL1R6MnNqM0RCckxzb1BwUFp5dy92YlAwcndTY2daRUh2Q0VGdzA3Rjhx?=
 =?utf-8?B?ZktHaVpIMnNleXlzdkVsL2pRV0VZRXZsYWpvcFZhaVNMUmZvcjltcEEvR1lI?=
 =?utf-8?B?emlzSUQzTkgvdUdCQ0NaWXBjdXNnVmRwN3R4RnpTWHNCaENrd3BuS3ZYazlw?=
 =?utf-8?B?a3FncWhXUEE4bHNrOGRhcXQ5SmNXZjRseU5QdXEydFRWZUt1OWkwM1RncE5V?=
 =?utf-8?B?dEZ5QVFpVmFRanp2ME1wdWIrUno2b3pyVXVsMWJwR1g3RTUzOFJWK3o1VFkw?=
 =?utf-8?B?V0VXT1k4UlEvd29mcnExL0FWZXJ5bk10SjMrbzRocEVsclFQUkZZSUlWWWR6?=
 =?utf-8?B?RHFIUFIzSW1zV21SRjBldngyWW4xdk44TlJjZ3pXNEZ5OWM4WjBsZng0OXBL?=
 =?utf-8?B?ZHRpeHc1eGNybENlTTJRMkE3dHJWSllMSDRaQWZhME1NRGN5WUVFeG9LUXlT?=
 =?utf-8?B?NUo4Y2NHM1BKTy9yakt3YlFOMHdhaWZLa21Kc09peDUySkV0SCtEVVBYOElU?=
 =?utf-8?B?QUs0OTA0TUNZMTJmajk3ZGwvZlE1MEZJU0p4cTh4MEQ1aXJKajZzZmNDL29N?=
 =?utf-8?B?N0g1ejNjYjlKWXJTajg2MVhFZFRqSGsrMkVFMEx5MWRVcUs4bVlvT1hsa2ZC?=
 =?utf-8?B?MWVsTjBHZTJrSnlLcEVrQkUxR3A2TjJyL0dYbGNRR0N2ZEM4Wm16NWNDWDNK?=
 =?utf-8?B?ZC9RYTRuVHN1Q0tsRUtYU0VwTjdzUjlzelpJbUt4RjQ0OUJnSWs5aTJlR3lK?=
 =?utf-8?B?b0xYODgxRExUR1NmblZZQkFMUHBVd0lIaSt4Nmk4b1NsUlpqRGtUeFBaU1pr?=
 =?utf-8?B?N0JpMElRK1ZqQ0MxM21lZE91SHVmYnQxRHFvQmNyRnFMMVV1Q1FPcE14YWlv?=
 =?utf-8?B?eGVyWTRKYjhqOVl6WlkzajhyVFNrUStDMXMzU2lYSDBobDZ1MkRlZVQ5TXlQ?=
 =?utf-8?B?UmYzeUg2MHUwK1RERzlOSTdJTVNZaTA3bzRJUU5vN1hzNENvclhrWkdjZUhY?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uAT9ebOf/llB0onn1Qu0afHsVl5yFwYO6kAWHsVZac0bD2sTa+RMjRZUl7aQ1QtMd3apztBYavcerFQuszZuaVks6/u5YsLLwunR5Yk+1pgmYwnRYrCD2tT+r7y2gYA6yUuOVk4s09t9HCCGjw/SEz4Zs9Olm8Dwlo/lNdoZXQwruFGICNENy2HPcCaZktQ8A1qGIu3oDi8dLFP0y4oXaSkP64y/v6J8Iq86/eM4DSfA6liPSv2d37j8FNtXEuj+PVjEeSvJUfFJ8Da37K0GcQtJZkBdx3vGx/8Vkqdn1fxdD720hSEntlptsaCpcdPOkBJsOmxZn316aeTCoIEPo2FCzdk+kR7HBN6Avc8AlIJ96LGjBtjMXQQ/D5xD5Td4dMy3zFZuGHBMk6Euse8cAkIh4eNZCBqsUlUarVLo5zvrCtowCmFSNwYoKKVAGMOO3D6xaITYG+FOozG8NYGnjR8T6cYF2N5nhHZkA8gdbBjoj9yCG3k42H9ahdZ0HpukfFvR4dEr0rC3jIraDcurrN9+9IA6/aNA3o4oHVnHEoFyFChm2MWp+IUVliwPNDYhAfYZHKeGzlr8tJz+6W6jOdoQrBcydfDSncuVtQFqE2BnMvvbLPrtQETCw5+6V65VYEnt4B4Fh2lhyOqGaACVvW6m5PcGQzKH1rffc+Z2GaJK8VaNEIrJwNBk1BuyWdE1FOXIsM0+FNshgP0dA9ltDZXJDI+KCNFnO8p0o8LRD3U5NmJCEzvHd90pfmoQ1rR+LSLYHIi0pyBuC968JTNbxm/Bf2nVQBYmqu7+qAPDjem2pTdc0lRBsSD62fxoGdo1H/uOX21p4fQXy7qcrkSZ2g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c22c93-aa35-4273-6300-08db9fd47160
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 10:18:18.9603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGH9e4TfdzQ4uGxQVznsIwisUdYgC4rNHwQ3fBYDtYsmJ4VZ71DxV4S5tTJJR+slMNRX0dq3CQMP5FCBw4Dzla414sOL1klstQ9NRNslXqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4923

On 18/08/2023 11:09 am, Jan Beulich wrote:
> On 18.08.2023 11:44, Andrew Cooper wrote:
>> On 18/08/2023 7:50 am, Jan Beulich wrote:
>>> On 17.08.2023 22:45, Andrew Cooper wrote:
>>>> GCC 12 objects to pointers derived from a constant:
>>>>
>>>>   util.c: In function 'find_rsdp':
>>>>   util.c:429:16: error: array subscript 0 is outside array bounds of 'uint16_t[0]' {aka 'short unsigned int[]'} [-Werror=array-bounds]
>>>>     429 |     ebda_seg = *(uint16_t *)ADDR_FROM_SEG_OFF(0x40, 0xe);
>>>>   cc1: all warnings being treated as errors
>>>>
>>> Yet supposedly the bug was fixed in 12.1 (and the fix also backported to
>>> 11.3). Did you spot anything in ADDR_FROM_SEG_OFF() and this particular
>>> use of it that is different from the patterns mentioned in that bug?
>> $ gcc --version
>> gcc (GCC) 12.2.1 20221121
>>
>> At a guess, only a partial fix was backported into 12.1.  AIUI, it was
>> an area of logic which had already seen significant development in 13
>> before the behaviour was reverted.
> Hmm, for 12 I didn't think there was any backporting involved.
>
>> The only thing interesting about ADDR_FROM_SEG_OFF() is the constant
>> folding required for the expression to become *(uint16_t *)0x40e, which
>> (I suspect) is why it compiles fine at -Og but fails at -O2.
> Oh, the relevant aspect may be that is is below 4k (which I think is
> their heuristic offset to guess "almost NULL" dereferencing).

Ah yes, I remember that aspect now you've pointed it out.

Yeah, that's probably it.

>>>> This is a GCC bug, but work around it rather than turning array-bounds
>>>> checking off generally.
>>> I certainly agree here. I guess it's not worth trying to restrict the
>>> workaround for rombios (I will want to try doing so in the hypervisor).
>> Can I translate this to an ack?
> You can now:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

