Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF662C655
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 18:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444371.699502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovMAs-0007FU-ML; Wed, 16 Nov 2022 17:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444371.699502; Wed, 16 Nov 2022 17:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovMAs-0007Dh-JA; Wed, 16 Nov 2022 17:26:10 +0000
Received: by outflank-mailman (input) for mailman id 444371;
 Wed, 16 Nov 2022 17:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NgR=3Q=citrix.com=prvs=31293058e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ovMAr-0007Db-70
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 17:26:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04a081f-65d3-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 18:26:07 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 12:26:04 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB7020.namprd03.prod.outlook.com (2603:10b6:510:160::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Wed, 16 Nov
 2022 17:26:02 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 17:26:01 +0000
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
X-Inumbo-ID: c04a081f-65d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668619567;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rw2h9kMsOW3zNiGwzAQX9ietUjV35aFbVgcjxLKbQ7U=;
  b=PDtCFBIyhyEwifZD8+cwQWku6r4VQPFHx0MdCg4AvQJXUM65IDlPWQN7
   tJ21tTZ7X7IUu2qgGs/I9w0U7EHM0QoUBXH+V8JSmHmLJjz1IIZESU5Uu
   r6ICN59j8BU4rwTq/bAE1/3DG9wvjx4cen7etcyeqfUf9boJoGRoe9M9H
   I=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 85386777
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:stl5+K+1nNz2GMQbAfBnDrUDp3+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jMcXG2FbKzYNmGkLt51bdiyp0pUscCHnYAySgNk+yE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKkV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkJ7
 O4/Fw9cSyqtgtm6m4KqQ+xhhf4aeZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+SxnOlB91NfFG+3uxEgAGYx1IpMhQxa1ShhduJoX+VdesKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoOS1sD6ty6+YUr1EuRHpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:XsUXcK/xF4iRj+Ag9uNuk+G4dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBvT8LZyrnPDsqZpWAgjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="85386777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8JlAUDiZ0iBgOIn3UH5xEmWgJKNgnWXmQEtcCHa5LoX7iPRudyN2oE0Dh+uKWiuqkrfCctLczZLnnR9IYA6arF9EOlawPZrenq63eylmBHyiJTKbgXC0TZ8XDW5JKhC4HB1n4KaVWBF1aOh92Ab0FN9nuoctXf8bIy+o4hsdhfZWgNFmdi3yHy6aKE/fEm3V1LsJg06D556bMTbQ8/c560WXbQUmY57BQsLs2q0Z6KCLsGCaHafByuVxeEZ908PtSX4GZPBfaWXG9EjgD4rJlGt/6nWiXsPWmQHOYGAEfudkjp/II30SWlNCsU05AVZMh29S+bAgfbdasvq4+QpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz7hkhekNE3b2a/JxCJWetaum+jFhYX2mO+5SiLTx/0=;
 b=nn6ZY2xmFih0JJMwIwxgye+utVkkfvJxvj/VGRHH7w3JRB0wrF45gckDbUW+BNZrbOUeGqb1ieqcI+B+aj65kDJWE/bX7Yoe+rnh5qJqcexrODGa36j7kg6Sc35EIg9Gk3uDD5TaoWeBSXiTrKrL9zrGDJnfhDrUECn/fOGI1+Rq+xYrJqxNbXjcjfeifdz48YK9uSBlYJvHBEZUn5CK5OObnlHr5htbcAZoPKzJQYpcXxGCScI5N4ToDwrVm1NjJmqLvk71J4Dfm+J3IzUnpCMhKcg739oiiacaym3rsDaRyu7x3P7l/oZ2GH4udLb63I/I095BHiQLX4v4igPzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yz7hkhekNE3b2a/JxCJWetaum+jFhYX2mO+5SiLTx/0=;
 b=Lb61XfqDiG9h1p22LAWEM5aDUKKAwnp2CV4soFY2SIb/t1SHDbVFqc9GbDeAU7NpqXidIbVdo0AQoc17ItUynQRpZ7KiWnd1Tz6p+Z5vdi63EJr8e5vlpIHy56fOUrnjcjJmq7xrd0ozB+LZzYgXaIZPy/SrB0Gjd0lD0c2CzB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 16 Nov 2022 18:25:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures
 to dom0
Message-ID: <Y3UdIEwYL9qTNoIc@Air-de-Roger>
References: <20221116164216.7220-1-roger.pau@citrix.com>
 <e1ba1a77-e449-beb0-cd49-1e6df6b6eeb0@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1ba1a77-e449-beb0-cd49-1e6df6b6eeb0@citrix.com>
X-ClientProxiedBy: PR2PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:101:16::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5ea5ef-b344-42b1-21ce-08dac7f79fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vJR8EPL2rZBZAFq+3aCdKfeVly6XX6sfNMncIwqy6AbN3WYWgbuDD/W4IATWk+2J54VN/iBlgSN64t5IIwGBkjoEZTVo3qTnTDbYOFirvQtobnbn/Vj6lkFocgOI++VbILl3sMqWz9mOmHpLNdIcy5RZYj2JiPaetPgG+6twmSSSXpc7y9iuP3/waAv7We0Yt1jt1LKChV2Prym3b9LI0SyHy2CFRk5DvhbihHmbPk7nmY0StJYK7jo+oVv1cjjX39Xfqp6ycc9fpfvvVrWd5hwQPO8fUkULsMqv2nzcMPDa8djtKipEHmdY7QNs1PgNbfNn/tjjpDtyL44DPOq535FKM+S8ydOL07/06iEEdhn08OzeUmfZnT1bAc9BOLKDjVI+jvCeCxV64BvkcIDg977S3kB4tZ4IEC8z8sGcisWH5wcnua+XHw/PJpLz+IQxljQ1Xijx4L4fIN9USj7Hub1XsMvPHmRQmgrwlDxpA5hOQ6Vt2n7QBlZOjHYw9X6NISVIXt56xRSTwmJWSMnQRfEQN+u24N1cvQbhhrAPnazRDy9sMmLPahFvgy82Anh1HMIjTkzYHzBIUIb4JBkLkw9yjzppC2hekmWAce7RekeUK/mR9N/DF8H1SDi4gWTWnWSnZXSqMK21c1zY1A6Vt+wC6oPgtv4iW+ChRJ5SI1p1XXqS5G+VM1THRDyezuGElmY7JpLFCtY7SKQAGSB6ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(41300700001)(6486002)(8676002)(478600001)(316002)(33716001)(66946007)(66476007)(85182001)(4326008)(6636002)(6666004)(38100700002)(53546011)(82960400001)(6506007)(6512007)(83380400001)(5660300002)(66556008)(186003)(54906003)(86362001)(9686003)(2906002)(66899015)(26005)(8936002)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWQvZXRXZ2dRWDR3Q3pOUml6dVhsMzdablo4WSszRy8xZTJ5U2swZ1hwZUZq?=
 =?utf-8?B?T0IzWkFkb0U4L2gwcGFFM01aVjFXQzlJVHZNZnQwSnhnQmlBbENUNVdoSWFC?=
 =?utf-8?B?SWR5UmxNRWZlTVk0NEs3b1QyZXBUTWxwL0NPNjF3ZEdZakp0VFVlS3AwSUlE?=
 =?utf-8?B?NjIyUlhqQ2hvQ2phZ3huUytSblpITWFpMFMwZkZQVEJmWTBvQnVHb2d2MHMx?=
 =?utf-8?B?aTl1aVI4a3E5ZUY2OWxSOUl4RERzSVpSVG1IREl3UzhGeXdkSW9QeUhJdUpa?=
 =?utf-8?B?Mi9uYzYzL3hDOEp2ZUFqY0hoYWNBUEhBeEw4SHRKSzdhVFBJR0FVSjl3Ukl2?=
 =?utf-8?B?VmFvN0hDaktGQnBaYm1UcExBVU9FMlV0NGcxVmdBbEhFa3NvVkxoRFIydUFD?=
 =?utf-8?B?NnZjNFV2Z0ZmYzhYdFlZOEZROVBXSDFUL1NIa0MyZ2xMNkNzMlh4VFcxSmFB?=
 =?utf-8?B?ZjUyWXlHZE9ZTy8ydkJuN1g2NXdGR2xwQVk1SnVWblpSa1hkU3JFK1ZkckNj?=
 =?utf-8?B?cjcvSTF4RWhDcUluNWhzbG1SbkRRWFl2NnV5aHZVSnVsTHdpS0hWVWlVbnFT?=
 =?utf-8?B?MGFzZlZkM3F5VVZtSlAvU2NGb0ovTVB4WTJzRmRsZ0xMT3NKeTR6SWM3YVRL?=
 =?utf-8?B?TjY5aU5MeVZVZS9RYnRwQlhGajJMZHpHTU5tQ0NxLzc0ZlRJNU5rWkY5aUpv?=
 =?utf-8?B?M3ZsOTZmSFAvVnF3Y1RsWWJKallyajg1NktNQWtxL2tmOVVyTS9SejExQzU5?=
 =?utf-8?B?dERyR2VoRzRqblAxdGY1Q2NaR0diSXZRYVQ1Tm9nQURRTmp1ZWFzNnJOSnBD?=
 =?utf-8?B?Y1RzN04zT2o5eDZzUmZoK3AvNVpHdGNPTG1KNlFteEN4K0x0VzEya2lnNHps?=
 =?utf-8?B?Q0xCcDZ6aGEwbjBReXJSZDdsVXZUd3BIQmtBa01PQzN6TWpnVlArTkU3NjBU?=
 =?utf-8?B?bUUxdW02ZVd1VWJkV0ZlK3U2eHlibXp6RGo0bFRWclZjbHl0TUVUdVVDQzR2?=
 =?utf-8?B?SDJ4ZWZRWmxjeHpXWFVlZ0JIV2M2d0x1a3VTK1JDQ21Na1c2YXVGVDZCVU0r?=
 =?utf-8?B?STBGNEFOYzcyd0hNZkVERGVsU3FXdkMvejhjTUtySUZETCtBd0c0UlMxOUkw?=
 =?utf-8?B?ZExWWmdKREFIbllRQTVYTEdnYnd4K1llR3VPbTlFVUkvU0hWZ3Y4SmdxYVlS?=
 =?utf-8?B?VHE4bFRmRHZoMzJnOURia2o2dnlBSkpFS216SmNuaVA2bk0wVTdFeHZ2TU1E?=
 =?utf-8?B?NnRaYmlQNStGV0xteEo0akVyVmNhYVZ0enp5SUV4d3lEUGNhSW9QUWxMbDZR?=
 =?utf-8?B?MzNadHdDamZHRVF0K2lXYVoxY01lSnpJdEhmbmwvRlhsVUNtQTd3RmlWK1NH?=
 =?utf-8?B?YUJSOXV1dHhGd2R2cTBCVENSNkRzb1NuM3JJNEFMR2hjd2p0VnppT2tGRUU2?=
 =?utf-8?B?azQ5cE9sQTZ6VCtTMGtraXRmUWdpQlNvZCtyUTQxdGlSMnFWSXVFM3laQ1k5?=
 =?utf-8?B?MjBSYWJPajJFRXliajNWUUNtZVdhRG9zMFJjb3ZGVEcydVhPMzBEenlQYXJL?=
 =?utf-8?B?K1EyYU9aUlBTMSt4dTFxRVMrTFFrZ0VjK2JwZUpreEg3MElZcU14NnVKeWwz?=
 =?utf-8?B?dmoxUnY1RUxUVkEvZjM3amJ0MFgzb0pON2VxREQ5bk9DQitTZlUzMjIreUpK?=
 =?utf-8?B?c3dsRUZVQUsyTmRrY3gzcnljc0VIWE83OXBaQ0puUHVlZnkzekpsbExyZGF5?=
 =?utf-8?B?NjAvZUhOZHQva3c2QXE0T2lnOFZlcWpMOW83dStSaEhrQTV0SFN0RllHbmNv?=
 =?utf-8?B?QnRTQjRZVm1GV20rcnZXUjQxOE9QeTRlMTFnMDJia08xZ1BxWXJvNWNWMVNG?=
 =?utf-8?B?eXFYRjhUMDMrMjlBaE0vK2htTXVnWEFxWXhCUWFzdXppZXlpOXMxeVRvV2J1?=
 =?utf-8?B?bjcyNjUveGcrZWY5K1RhdDgzK0E1VnFZckx6K0hlLzAydk9FRGRNMWErQjZp?=
 =?utf-8?B?eTJ4ZlBUQ3RFaHVUdUVBRlVmck44MVdnTUIvUVFsS09yN1Q2QmkyRVA3ZWwx?=
 =?utf-8?B?emFCSjhHdGJoTk5hNSs5WW1rcTdBQ1ROQ3pFc2lyZnl6N0xGUDJ6ampxc081?=
 =?utf-8?Q?yLjtFn5dAfAiNO/3bUWBm+4I7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4nQ9PPQhrf/CRUihenNQhFarRp9cnYHwsOFCZ/u2jtN8CcMtzeBucgJQoSCxzTNmGHxWHHkJs/BsuRoIsMD/qiwEnYQmbikCoWe6ZkUeRuY0bBWP/g1geB6LWMj98QCgYXIsKcWrPZMx1BYVZIPxUI5JjaUIbOpSavsXmnGksie+yMicSqrMnHQY8vQFfyRQ9H0D7ULTZsoAHW28LWK9NJeq+JbgrE05nAKSM+h1nmQLWslJsZEiIyjr7MTZJ5OkgVWjUG+cJ0fmvYMTFGfrss7xwFBIic+FHanb27XaeNpeYaQ3kmQe5rSUZTozM5EzwrLVsJr8asH/T/gJC6HXjhPYifeiZJku9O+Bt+V9HP8Q2VK39ObQ3i43rd27e5QKej436t4gwfIEiAU1I+Bd9SRPqOkS+E8+2jUlqi21p8td8lvJfMHO9U+kmjWa6sHGuTUD2TzyOJkZMNNABTFULdBZHOuU2WO5NK2A/DjaS0esaxrEsWldhqebDi0F7ZnNUrfnuyfVGSG5Fo0DVQ3owcCa9EbOU3xDfebU1Z6SzaJOAuQL27ntPZdqnwhNMnxRu4a+6Q2LbVpEp7hQs0/wGqC+mKLEZNcJfYzyimOw943kB1we9T9xXb1HZ7mkMQz6s54QahKG/e+Nkxd5BTjDonRLPyA+5J4PTbkbj5Jzgrjb5fWwUTkrG9rp8UxR2sQq9k/OZN1JznyBumT7IBb77pNiE78+lsBKbwZHuiNDFg0HdslF9GjCvcUhGX7XSvhF7C5Gov/oQnMHKsnUOUYodSXE+FCe4kldYtwvxC4cv27eCsCMSDVw68sGp4Q7SpLCxSn7qvODJQK5nS7mBN0Vjg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5ea5ef-b344-42b1-21ce-08dac7f79fcd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:26:01.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYl+PLWzeyB4PFXqJSC5mm1IIQtpxuW1yqoXpG5eycXJJ8zCfCg4DFqVDOXNnkieJx/Mv0G2CrF/RBp8of7Npw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7020

On Wed, Nov 16, 2022 at 04:56:41PM +0000, Andrew Cooper wrote:
> On 16/11/2022 16:42, Roger Pau Monne wrote:
> > Currently Xen will passthrough any Local APIC NMI Structure found in
> > the native ACPI MADT table to a PVH dom0.  This is wrong because PVH
> > doesn't have access to the physical local APIC, and instead gets an
> > emulated local APIC by Xen, that doesn't have the LINT0 or LINT1
> > pins wired to anything.  Furthermore the ACPI Processor UIDs used in
> > the APIC NMI Structures are likely to not match the ones generated by
> > Xen for the Local x2APIC Structures, creating confusion to dom0.
> >
> > Fix this by removing the logic to passthrough the Local APIC NMI
> > Structure for PVH dom0.
> >
> > Fixes: 1d74282c45 ('x86: setup PVHv2 Dom0 ACPI tables')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Yeah, that was never going to work correctly.
> 
> That said, I'm not certain we can get away with discarding them either. 
> Some systems really do use ExtINT in IO-APIC entries, and dom0 is
> capable of configuring this if it thinks it wants virtual wire mode.

But the MADT entries discussed here (Local APIC NMI Structure) deal
exclusively with the LAPIC LINT# pins, not IO-APIC pins.

Interrupt Source Override Structure on the MADT are the ones that deal
with IO-APIC pins, and those we do forward them to dom0 and are setup
correctly (because they don't reference any Processor UID at all).

Thanks, Roger.

